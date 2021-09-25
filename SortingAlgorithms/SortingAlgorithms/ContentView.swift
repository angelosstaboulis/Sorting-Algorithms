//
//  ContentView.swift
//  SortingAlgorithms
//
//  Created by Angelos Staboulis on 26/9/21.
//

import SwiftUI
struct RandomNumbers:Identifiable{
    var id:Int
    var number:Int
}
struct ContentView: View {
    @State var numbers:[RandomNumbers]=[]
    var body: some View {
        VStack{
            VStack{
                Text("Sorting Algorithms").padding()
                HStack(){
                        Button {
                            numbers=quickSort(array: numbers)
                        } label: {
                            Text("Quick")
                        }.padding()
                    Button {
                        numbers=exchangeSort(array: numbers)
                    } label: {
                        Text("Exchange")
                    }.padding()
                    Button {
                        numbers=selectionSort(array: numbers)
                    } label: {
                        Text("Selection")
                    }.padding()
                    Button {
                        numbers=bubbleSort(array: numbers)
                    } label: {
                        Text("Bubble")
                    }.padding()
                }
            }
            List(numbers){item in
                Text(String(item.number))
            }.onAppear {
                for item in 0..<15{
                    self.numbers.append(RandomNumbers(id: item, number: Int.random(in: 0..<10000)))
                }
            }
        }
    }
    func quickSort(array:[RandomNumbers])->[RandomNumbers]{
        if array.count < 1 {
            return array
        }
        let middle = array[array.count / 2].number
        let left = array.filter{$0.number < middle}
        let equal = array.filter{$0.number == middle}
        let right = array.filter{$0.number > middle}
        return quickSort(array: left) + equal + quickSort(array: right)
    }
    func exchangeSort(array:[RandomNumbers]) -> [RandomNumbers]{
        var arrayValues = array
        for item in 0..<arrayValues.count{
            for subitem in 0..<arrayValues.count{
                if arrayValues[item].number < arrayValues[subitem].number{
                    arrayValues.swapAt(item, subitem)
                }
            }
        }
        return arrayValues
    }
    func selectionSort(array:[RandomNumbers]) -> [RandomNumbers]{
        var arrayValues = array
        for item in 0..<arrayValues.count{
            for subitem in 0..<arrayValues.count-1{
                if arrayValues[item].number < arrayValues[subitem].number{
                    arrayValues.swapAt(item, subitem)
                }
            }
        }
        return arrayValues
    }
    func bubbleSort(array:[RandomNumbers])->[RandomNumbers]{
        var arrayValues = array
        var swapped:Bool=true
        while swapped  {
            swapped = false
            for item in 0..<arrayValues.count-1{
                if arrayValues[item].number > arrayValues[item+1].number{
                    arrayValues.swapAt(item, item+1)
                    swapped = true
                }
            }
        }
        return arrayValues
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
