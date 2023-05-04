import UIKit

class Service {
    
    private let action: (String) -> Void
    
    init(
        action: @escaping (String) -> Void
    ){
        self.action = action
    }
    
    func retornandoNoMesmoBloco(callback: () -> Void){
        for i in 0...50 {
        action(String(1))
        }
        callback()
    }
    func retornandoDepois(callback: @escaping (Int) -> Void){
        for i in 0...50 {
            print(i)
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)){
       callback(1000)
    }
  }
}

let service = Service() { index in
    print("action está rodando com o indice \(index)")
}

//func executaRotina(_ value: Int) {
//    print("sucesso")
//}

service.retornandoNoMesmoBloco {    
    print("terminou")
}
