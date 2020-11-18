## Welcome to GitHub Pages

You can use the [editor on GitHub](https://github.com/Mayuresh12/Combine-FrameWork-Swift-/edit/gh-pages/index.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/Mayuresh12/Combine-FrameWork-Swift-/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.


### Subjects are both Publisher and Subscribers
 Here below is an example where we have creates String Subscriber then via subject on demand we can pass data via `PassthroughSubject` on demand.

```swift

import UIKit
import Combine

enum MyError: Error {
    case subscriberError
}

class StringSubscriber: Subscriber {
    
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print(input)
        return .max(1)
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
        print("Completion")
    }
    
    
    typealias Input = String
    typealias Failure = MyError
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Subjects
           // - Publisher
           // - Subscribers
        
        let subscriber = StringSubscriber()
        
        let subject = PassthroughSubject<String, MyError>()
        
        subject.subscribe(subscriber)
        
        let subscription = subject.sink(receiveCompletion: { (completion) in
            
            print("Received Completion from sink")
            
        }) { value in
            
            print("Received Value from sink")
        }
        
        subject.send("A")
        subject.send("B")
        
        subscription.cancel()
        
        subject.send("C")
        subject.send("D")
        
    }


}


```

### Type Eraser
In Swift we can hide type behind a type is called a type eraser.

for example

```swift 
 let publisher = PassthroughSubject<Int, Never>().eraseToAnyPublisher()
```
Here the publisher is `AnyPublisher` if any caller is trying to access the publisher it will not dislcose it is `PassThroughPublisher` but will dislcose as `AnyPublisher`

### Tranformational Operators
The are the operators which transforms a sequence to completr another sequence.
For eg.
`[1,2,3]` here array of number when passed to transformational operator might yeild us `["One","Two","Three"]`

Here are few transformational operators
- scan
- map
- flatMap
- map keypath
- collect
- replaceNil
- replaceEmpty

1. Collect
This will convert the give value into array. 
For eg.
```swift
["A","B","C","D","E"].publisher.collect(2).sink{
    print($0)
}
```
```
O/P:
["A", "B"]
["C", "D"]
["E"]
```
here the value `collect(2)` passed in 2 breaks the array into chunks of two. If no number is provided whole array is returned.

2. Map

```swift
import UIKit
import Combine

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[123,45,67].publisher.map {
    formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
}.sink {
    print($0)
}

```

3. Map Keypath
```swift
import UIKit
import Combine
struct Point {
    let x: Int
    let y: Int
}

let publisher = PassthroughSubject<Point, Never>()

publisher.map(\.x, \.y).sink { x, y in
    print("x is \(x) and y is \(y)")
}

publisher.send(Point(x: 2, y: 10))
```


