@implementation STSAlertController

+ (id)alertControllerWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STSAlertController;
  objc_msgSendSuper2(&v11, sel_alertControllerWithTitle_message_preferredStyle_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:withConfiguration:", CFSTR("alert-icon"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[STSAlertController roundEdges:](STSAlertController, "roundEdges:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v9);

  return v5;
}

+ (id)roundEdges:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  CGSize v20;

  v3 = a3;
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;
  v20.width = v5;
  v20.height = v7;
  UIGraphicsBeginImageContextWithOptions(v20, 0, v10);

  objc_msgSend(v3, "size");
  v12 = v11;
  objc_msgSend(v3, "size");
  v14 = v13;
  v15 = (void *)MEMORY[0x24BEBD420];
  objc_msgSend(v3, "size");
  objc_msgSend(v15, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v12, v14, v16 * 0.225);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addClip");

  objc_msgSend(v3, "drawInRect:", 0.0, 0.0, v12, v14);
  UIGraphicsGetImageFromCurrentImageContext();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v18;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)STSAlertController;
  -[STSAlertController viewDidLoad](&v2, sel_viewDidLoad);
}

@end
