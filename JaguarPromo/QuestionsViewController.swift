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
    var m_currentNum: Int = 1;
    
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
        
        
        m_contentView=UIView()
        //m_contentView.center=self.view.center
        //m_contentView.frame.size=CGSizeMake(rect.size.width,rect.size.height/2)
        m_contentView.frame=CGRectMake(0, 0, rect.size.width, rect.size.height)
        m_contentView.userInteractionEnabled=true
        self.view.addSubview(bg_view);
        self.view.addSubview(m_contentView)
        self.view.addSubview(m_title)
        
        let back_btn=UIButton()
        back_btn.frame=CGRectMake(20, 20, 20, 20)
        back_btn.setImage(UIImage(named: "pag"), forState: UIControlState.Normal)
        back_btn.addTarget(self, action: #selector(QuestionsViewController.backBtnPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        self.view.addSubview(back_btn)
        
        createContentView(m_currentNum)
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
        
        m_currentNum = q_num;
        
        m_title.font=UIFont (name: "HelveticaNeue-UltraLight", size: 20)
        m_title.textColor=UIColor.redColor()
        m_title.textAlignment=NSTextAlignment.Center
        m_title.text=q_strings[q_num-1][0];
       
        let center_img=UIImageView()
        
        center_img.frame=CGRectMake(m_contentView.frame.size.width/2 - 50 ,m_contentView.frame.size.width/2 + 50 , 100, 100)
        
        center_img.image=UIImage(named: String(q_num))
        
        m_contentView.addSubview(center_img);
        
        let angle_delta: Double = 360/5
        var angle = 0.0
        var num=1;
        
        while(angle < 360){
            let button=UIButton()
            button.layer.cornerRadius=30;
            button.setImage(UIImage(named: "new_question"), forState: UIControlState.Normal)
            let x=220*sin(angle * M_PI / 180.0) + Double(center_img.center.x)
            let y=220*cos(angle * M_PI / 180.0) + Double(center_img.center.y)
            button.frame=CGRectMake(CGFloat(x), CGFloat(y),  60, 60)
            button.center=CGPoint(x: x, y: y)
            button.tag=num
            
            button.addTarget(self, action: #selector(QuestionsViewController.answerQuestion(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            let title=UITextView()
            var x2=260*sin(angle * M_PI / 180.0) + Double(center_img.center.x)
            let y2=260*cos(angle * M_PI / 180.0) + Double(center_img.center.y)
            
            title.backgroundColor=UIColor.clearColor()
            title.frame=CGRectMake(CGFloat(x2), CGFloat(y2), 100, 100)
            title.userInteractionEnabled=false;
            title.scrollEnabled=true;
            title.font=UIFont (name: "HelveticaNeue-UltraLight", size: 10)
            title.textColor=UIColor.whiteColor()
            title.editable=false;
            title.textAlignment=NSTextAlignment.Left
            title.text=q_strings[q_num-1][num];
            
            if(x2<x){
                x2 = x2 - 100
            }
            title.frame=CGRectMake(CGFloat(x2), CGFloat(y2), 100, 100)
            //title.center=CGPoint(x:x2,y:y2)
            num+=1;
            
            m_contentView.addSubview(button);
            m_contentView.addSubview(title);
            
            angle+=angle_delta;
        }

        
        
    }
    
    func createResultsContentView(){
        clearContentView()
        
        var progress: Int = 0;
        
        for  i in answers {
            if(i.answer == i.correct_answer){
                progress+=1;
            }
        }
        
        progress = 100 * progress / answers.count
        
        let result_str="Ваши результаты:\n\(progress)% успешных ответов"
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Center
        let attributedString = NSMutableAttributedString(string:result_str)
        attributedString.addAttribute(NSForegroundColorAttributeName,value: UIColor.redColor(), range: NSRange(location: 0, length: result_str.characters.count))
        attributedString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-UltraLight", size: 20)!, range: NSRange(location: 0, length: result_str.characters.count))
        
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: result_str.characters.count))
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor() , range: NSRange(location: 17, length: result_str.characters.count - 17))
        
        m_title.attributedText=attributedString
        
        
        let center_img=CircularProgress()
        center_img.frame=CGRectMake(m_contentView.frame.size.width/2 - 150 ,m_contentView.frame.size.width/2, 300, 300)
        
        let angle2=Double((360*progress/100))
        center_img.angle  = angle2
        center_img.roundedCorners=true
        center_img.trackColor=UIColor.clearColor()
        center_img.progressColors=[UIColor.whiteColor()]
        
        let progress_text=UITextView()
        
        progress_text.backgroundColor=UIColor.clearColor()
        progress_text.userInteractionEnabled=false;
        progress_text.scrollEnabled=false;
        progress_text.editable=false;
        
        progress_text.font=UIFont (name: "HelveticaNeue-UltraLight", size: 60)
        progress_text.textColor=UIColor.redColor()
        
        progress_text.text=String(progress)+"%"
        
        let textSize = progress_text.intrinsicContentSize();
        
        progress_text.frame=CGRectMake(center_img.center.x  - textSize.width/2,center_img.center.y - textSize.height/2, 200,
                                       100)
        
        m_contentView.addSubview(center_img);
        m_contentView.addSubview(progress_text)
        
        
        let angle_delta: Double = 360/6
        var angle = 0.0
        var num=0;
        
        while(angle < 360){
            let button=UIButton()
            button.layer.cornerRadius=30;
            
            let x=220*sin(angle * M_PI / 180.0) + Double(center_img.center.x)
            let y=220*cos(angle * M_PI / 180.0) + Double(center_img.center.y)
            
            button.frame=CGRectMake(CGFloat(x), CGFloat(y),  60, 60)
            button.center=CGPoint(x: x, y: y)
            button.tag=num
            
            
            button.userInteractionEnabled=true
            let title=UITextView()
            let x2=260*sin(angle * M_PI / 180.0) + Double(center_img.center.x)
            let y2=260*cos(angle * M_PI / 180.0) + Double(center_img.center.y)
            title.frame=CGRectMake(CGFloat(x2), CGFloat(y2), 100, 100)
            title.backgroundColor=UIColor.clearColor()
            title.userInteractionEnabled=false;
            title.scrollEnabled=true;
            title.editable=false;
            
            title.font=UIFont (name: "HelveticaNeue-UltraLight", size: 10)
            title.textColor=UIColor.whiteColor()
            
            let str_prefix: String;
            if(answers[num].answer == answers[num].correct_answer){
                button.setImage(UIImage(named: "new_question"), forState: UIControlState.Normal)
                str_prefix="Верно! "
            }else{
                button.setImage(UIImage(named: "wrong_answer"), forState: UIControlState.Normal)
                str_prefix="Неверно! "
                button.addTarget(self, action: #selector(QuestionsViewController.touchedShowCorrectAnswer(_:)), forControlEvents: UIControlEvents.TouchDown)
            }
            
            let res_str = str_prefix +  q_strings[num][ answers[num].answer ]

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
        
        }
        
        
        
    }
    
    
    func ShowCorrectAnswer(q_num: Int){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        let closeButon=UIButton()
        closeButon.frame=CGRectMake(20,20,20,20)
        closeButon.backgroundColor=UIColor.clearColor()
        closeButon.setImage(UIImage(named: "close"), forState: UIControlState.Normal)
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
        let str=title_preffix + q_strings[q_num][0]
        
    
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
        let str2=answer_preffix + q_strings[q_num][answers[q_num].answer]
        
        
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
        button.image=UIImage(named: "wrong_answer2")
    
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
            let str2=answer_preffix + q_strings[q_num][answers[q_num].correct_answer]
            
            
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
        answers[m_currentNum - 1].answer=sender.tag
        if(m_currentNum < 6){
            createContentView(m_currentNum + 1)
        }else{
            m_currentNum+=1
            createResultsContentView()
        }
    }
    
    func touchedShowCorrectAnswer(sender:UIButton){
        ShowCorrectAnswer(sender.tag);
    }
    
    
    func backBtnPressed(sender:UIButton){
        if(m_currentNum > 1){
            createContentView(m_currentNum - 1)
        }
        else{
            self.dismissViewControllerAnimated(true, completion: nil)
        }
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
