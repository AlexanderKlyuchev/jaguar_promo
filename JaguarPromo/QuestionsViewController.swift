//
//  ResultsGestogrameController.swift
//  JaguarPromo
//
//  Created by Александр Ключев on 6/8/16.
//  Copyright © 2016 Александр Ключев. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    var m_contentView: UIView!
    var m_title: UITextView!
    
    let q_strings=[
        [
          "В чем заключается отличительная особенность дизайна, харатерная для каждой модели Jaguar?",
          "Стремление к классическим решениям",
          "Идеальные пропорции и элегантные линии",
          "Агрессивные и динамичные формы",
          "Экспериментальный подход, футуристичность",
          "Четкие прямые линии и углы"
        ],
        
        [
            "Из какого материала на 80% состоит  структура автомобиля F-Pace?",
            "Криптонит",
            "Алюминий",
            "Карбон",
            "Конструкционная сталь",
            "Низкоуглеродный титановый сплав"
        ],
        
        [
            "Из какого материала на 80% состоит  структура автомобиля F-Pace?",
            "Криптонит",
            "Алюминий",
            "Карбон",
            "Конструкционная сталь",
            "Низкоуглеродный титановый сплав"
        ],
    
        [
            "Какая технолгия используется для соединения интеллектуальных модулей InControl Touch Pro между собой?",
            "Ethernet",
            "Bluetooth",
            "Wi-Fi",
            "Internet",
            "Multitouch"
        ],
    
        ["Что такой \"интеллектуальный ограничитель скорости (ISL)\"?",
                    "Сигналы звукового оповещения при скорости свыше 180 км/ч",
                    "Ускорение или замедление атомобиля при нажатой педеали акселератора",
                    "Отображение ограничения скорости на лобовом стекле",
                    "Интерактивная цветовая индикация акселерометра",
                    "Автоматическое переключение(понижения) передачи перед препятсвием"
        ],
    
        [
            "Какое решение позволило инженерам F-Pace добиться оптимального баланса сцепления с дорогой?",
            "Самая большая глубина текстуры протектора",
            "Использование специальных утяжеленных колес",
            "Дополнительне пятое колесо, выпускаемое при необходимости",
            "Самый большой диаметр шин и колес",
            "Система адаптивного обратного вращения при потере сцепления с дорогой"
        ],
        [
            "Какое решение стало основой для систем активной безопасности F-Pace?",
            "Система инфракрасных сенсоров",
            "Система спутникового наблюдения",
            "Фронтальная стереокамера, создающая трехмерное изображение дороги",
            "Система контроля усталости водителя",
            "Система ультразвуковых сенсоров, сканирующая дорогу"
        ]
    ]
    
    
    struct answer{
        var answer: Int
        var correct_answer: Int
    };
    
    
    var answers = [answer(answer: 0,correct_answer: 1),answer(answer: 0,correct_answer: 1),answer(answer: 0,correct_answer: 1),
    answer(answer: 0,correct_answer: 1),answer(answer: 0,correct_answer: 1),answer(answer: 0,correct_answer: 1)]
    
    let result_str="Ваши результаты:\n80% успешных ответов"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bg_view = UIImageView.init(frame: self.view.frame);
        bg_view.image = UIImage.init(named: "main_bg")
        
        let rect=self.view.frame
        m_title=UITextView()
        m_title.frame=CGRectMake(rect.size.width/4, 0, rect.size.width/1.5, rect.size.height/5 )
        m_title.center=CGPoint(x: self.view.center.x, y: self.view.center.y/2.5)
        
        m_title.backgroundColor=UIColor.clearColor()
        m_title.userInteractionEnabled=false;
        m_title.scrollEnabled=true;
        m_title.editable=false;
        
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Center
        let attributedString = NSMutableAttributedString(string:result_str)
        attributedString.addAttribute(NSForegroundColorAttributeName,value: UIColor.redColor(), range: NSRange(location: 0, length: result_str.characters.count))
        attributedString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-UltraLight", size: 20)!, range: NSRange(location: 0, length: result_str.characters.count))
       
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: result_str.characters.count))
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor() , range: NSRange(location: 17, length: result_str.characters.count - 17))
        
        m_title.attributedText=attributedString
        
        m_contentView=UIView()
        //m_contentView.center=self.view.center
        //m_contentView.frame.size=CGSizeMake(rect.size.width,rect.size.height/2)
        m_contentView.frame=CGRectMake(0, 0, rect.size.width, rect.size.height)
        m_contentView.userInteractionEnabled=true
        self.view.addSubview(bg_view);
        self.view.addSubview(m_contentView)
        self.view.addSubview(m_title)
        
        createContentView(1)
        //createResultsContentView()
        
    }
    
    
    func clearContentView(){
        for subview in self.m_contentView.subviews {
            subview.removeFromSuperview()
        }
    }
    
    func createContentView(q_num: Int){
        clearContentView()
        
        if(q_num < 1 || q_num > 6 ){
            print("no question with num \(q_num)")
            return;
        }
        
        m_title.font=UIFont (name: "HelveticaNeue-UltraLight", size: 20)
        m_title.textColor=UIColor.redColor()
        m_title.textAlignment=NSTextAlignment.Center
        m_title.text=q_strings[q_num-1][0];
       
        let center_img=UIImageView()
        
        center_img.frame=CGRectMake(m_contentView.frame.size.width/2 - 50 ,m_contentView.frame.size.width/2 - 50 , 100, 100)
        
        center_img.image=UIImage(named: String(q_num))
        
        m_contentView.addSubview(center_img);
        
        
        let angle_delta: Double = 360/5
        var angle = 0.0
        var num=1;
        
        while(angle < 360){
            let button=UIButton()
            button.layer.cornerRadius=30;
            button.setImage(UIImage(named: "q_btn_bg"), forState: UIControlState.Normal)
            let x=220*sin(angle * M_PI / 180.0) + Double(center_img.center.x)
            let y=220*cos(angle * M_PI / 180.0) + Double(center_img.center.y)
            button.frame=CGRectMake(CGFloat(x), CGFloat(y),  60, 60)
            button.center=CGPoint(x: x, y: y)
            button.tag=num
            
            button.addTarget(self, action: #selector(QuestionsViewController.answerQuestion(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            let title=UITextView()
            let x2=290*sin(angle * M_PI / 180.0) + Double(center_img.center.x)
            let y2=290*cos(angle * M_PI / 180.0) + Double(center_img.center.y)
            title.frame=CGRectMake(CGFloat(x2), CGFloat(y2), 100, 50)
            title.backgroundColor=UIColor.clearColor()
            title.userInteractionEnabled=false;
            title.scrollEnabled=true;
            title.font=UIFont (name: "HelveticaNeue-UltraLight", size: 10)
            title.textColor=UIColor.whiteColor()
            title.editable=false;
            title.textAlignment=NSTextAlignment.Left
            title.text=q_strings[q_num-1][num];
            num+=1;
            
            m_contentView.addSubview(button);
            //m_contentView.addSubview(title);
            
            angle+=angle_delta;
        }

        
        
    }
    
    func createResultsContentView(){
        clearContentView()
        
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Center
        let attributedString = NSMutableAttributedString(string:result_str)
        attributedString.addAttribute(NSForegroundColorAttributeName,value: UIColor.redColor(), range: NSRange(location: 0, length: result_str.characters.count))
        attributedString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-UltraLight", size: 20)!, range: NSRange(location: 0, length: result_str.characters.count))
        
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: result_str.characters.count))
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor() , range: NSRange(location: 17, length: result_str.characters.count - 17))
        
        m_title.attributedText=attributedString

        
        let center_img=CircularProgress()
        center_img.frame=CGRectMake(m_contentView.frame.size.width/2 - 150 ,0 , 300, 300)
        center_img.angle=360
        center_img.roundedCorners=true
        center_img.trackColor=UIColor.clearColor()
        center_img.progressColors=[UIColor.whiteColor()]
        
        m_contentView.addSubview(center_img);
        
        
        let angle_delta: Double = 360/5
        var angle = 0.0
        var num=1;
        
        while(angle < 180){
            let button=UIButton()
            button.layer.cornerRadius=30;
            button.setImage(UIImage(named: "q_btn_bg"), forState: UIControlState.Normal)
            let x=220*sin(angle * M_PI / 180.0) + Double(center_img.center.x)
            let y=220*cos(angle * M_PI / 180.0) + Double(center_img.center.y)
            
            button.frame=CGRectMake(CGFloat(x), CGFloat(y),  60, 60)
            button.center=CGPoint(x: x, y: y)
            button.tag=num
            
            button.addTarget(self, action: #selector(QuestionsViewController.touchedShowCorrectAnswer(_:)), forControlEvents: UIControlEvents.TouchDown)
            button.userInteractionEnabled=true
            let title=UITextView()
            let x2=290*sin(angle * M_PI / 180.0) + Double(center_img.center.x)
            let y2=290*cos(angle * M_PI / 180.0) + Double(center_img.center.y)
            title.frame=CGRectMake(CGFloat(x2), CGFloat(y2), 100, 100)
            title.backgroundColor=UIColor.clearColor()
            title.userInteractionEnabled=false;
            title.scrollEnabled=true;
            title.editable=false;
            
            title.font=UIFont (name: "HelveticaNeue-UltraLight", size: 10)
            title.textColor=UIColor.whiteColor()
            
            let str_prefix="Верно! "
            let res_str=str_prefix + q_strings[0][0]
            let attributedString = NSMutableAttributedString(string: res_str)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.Left
            
            attributedString.addAttribute(NSForegroundColorAttributeName,value: UIColor.whiteColor(), range: NSRange(location: 0, length: res_str.characters.count))
            attributedString.addAttribute(NSFontAttributeName, value: UIFont (name: "HelveticaNeue-UltraLight", size: 10)!, range: NSRange(location: 0, length: res_str.characters.count))
            
            attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: res_str.characters.count))
            attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor() , range: NSRange(location: str_prefix.characters.count, length: res_str.characters.count - str_prefix.characters.count))
            
            
            title.attributedText=attributedString;
            num+=1;
            
            
            
            m_contentView.addSubview(button);
            m_contentView.addSubview(title);
            
            angle+=angle_delta;
            
            print("angle \(angle)")
        }
        
        
        
    }
    
    
    func ShowCorrectAnswer(q_num: Int){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        let closeButon=UIButton()
        closeButon.frame=CGRectMake(0,0,50,50)
        closeButon.backgroundColor=UIColor.whiteColor()
        closeButon.addTarget(self, action: #selector(QuestionsViewController.removeCorrectAnswer(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        blurEffectView.tag=100;
        
        blurEffectView.frame = view.bounds
        blurEffectView.addSubview(closeButon);
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation
        
        
        
        let title=UITextView()
        title.frame=CGRectMake(view.bounds.size.width/4, 0, view.bounds.size.width/1.5, view.bounds.size.height/5 )
        title.center=CGPoint(x: self.view.center.x, y: self.view.center.y/2.3)
        
        title.backgroundColor=UIColor.clearColor()
        title.userInteractionEnabled=false;
        title.scrollEnabled=true;
        title.editable=false;
        
        let title_preffix="Вопрос \(q_num):\n";
        let str=title_preffix + q_strings[q_num-1][0]
        
    
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Left
        let attributedString = NSMutableAttributedString(string:str)
        attributedString.addAttribute(NSForegroundColorAttributeName,value: UIColor.redColor(), range: NSRange(location: 0, length: str.characters.count))
        attributedString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-UltraLight", size: 20)!, range: NSRange(location: 0, length: str.characters.count))
        
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: str.characters.count))
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor() , range: NSRange(location: title_preffix.characters.count, length: str.characters.count - title_preffix.characters.count))
        
        title.attributedText=attributedString
        
        blurEffectView.addSubview(title)
        
        let answer=UITextView()
        answer.frame=CGRectMake(view.bounds.size.width/4, 0, view.bounds.size.width/1.5, view.bounds.size.height/5 )
        answer.center=CGPoint(x: self.view.center.x, y: self.view.center.y/1.5)
        
        answer.backgroundColor=UIColor.clearColor()
        answer.userInteractionEnabled=false;
        answer.scrollEnabled=true;
        answer.editable=false;
        
        let answer_preffix="Ваш ответ:\n";
        let str2=answer_preffix + q_strings[q_num-1][1]
        
        
        let paragraphStyle2 = NSMutableParagraphStyle()
        paragraphStyle2.alignment = NSTextAlignment.Left
        let attributedString2 = NSMutableAttributedString(string:str2)
        attributedString2.addAttribute(NSForegroundColorAttributeName,value: UIColor.redColor(), range: NSRange(location: 0, length: str2.characters.count))
        attributedString2.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-UltraLight", size: 20)!, range: NSRange(location: 0, length: str2.characters.count))
        
        attributedString2.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: str2.characters.count))
        attributedString2.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor() , range: NSRange(location: answer_preffix.characters.count, length: str2.characters.count - answer_preffix.characters.count))
        
        answer.attributedText=attributedString2
        
        blurEffectView.addSubview(answer);
        
        
        let button=UIImageView()
        button.image=UIImage(named: "q_btn_bg")
    
        button.frame=CGRectMake(3*self.view.center.x/4, 0, 30, 30)
        button.center=CGPoint(x: self.view.center.x/4 , y: self.view.center.y/2)
        blurEffectView.addSubview(button);
        
        if(true){
            let answer=UITextView()
            answer.frame=CGRectMake(view.bounds.size.width/4, 0, view.bounds.size.width/1.5, view.bounds.size.height/5 )
            answer.center=CGPoint(x: self.view.center.x, y: self.view.center.y)
            
            answer.backgroundColor=UIColor.clearColor()
            answer.userInteractionEnabled=false;
            answer.scrollEnabled=true;
            answer.editable=false;
            
            let answer_preffix="Правильный ответ:\n";
            let str2=answer_preffix + q_strings[q_num-1][2]
            
            
            let paragraphStyle2 = NSMutableParagraphStyle()
            paragraphStyle2.alignment = NSTextAlignment.Left
            let attributedString2 = NSMutableAttributedString(string:str2)
            attributedString2.addAttribute(NSForegroundColorAttributeName,value: UIColor.redColor(), range: NSRange(location: 0, length: str2.characters.count))
            attributedString2.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-UltraLight", size: 20)!, range: NSRange(location: 0, length: str2.characters.count))
            
            attributedString2.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: str2.characters.count))
            attributedString2.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor() , range: NSRange(location: answer_preffix.characters.count, length: str2.characters.count - answer_preffix.characters.count))
            
            answer.attributedText=attributedString2
            
            blurEffectView.addSubview(answer)
            
            
            
            let button=UIImageView()
            button.image=UIImage(named: "q_btn_bg")
            
            button.frame=CGRectMake(3*self.view.center.x/4, 0, 30, 30)
            button.center=CGPoint(x: self.view.center.x/4 , y: self.view.center.y/1.2)
            blurEffectView.addSubview(button);

            
        }
        
        
        
        self.view.addSubview(blurEffectView)
    }
    
    
    func answerQuestion(sender:UIButton)
    {
        print("pressed button \(sender.tag)")
    }
    
    func touchedShowCorrectAnswer(sender:UIButton){
        ShowCorrectAnswer(1);
    }
    
    func removeCorrectAnswer(sender:UIButton){
        if let view = self.view.viewWithTag(100) {
            view.removeFromSuperview()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
