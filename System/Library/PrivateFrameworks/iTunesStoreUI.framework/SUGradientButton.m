@implementation SUGradientButton

- (SUGradientButton)initWithFrame:(CGRect)a3
{
  SUGradientButton *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUGradientButton;
  v3 = -[SUGradientButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    -[SUGradientButton setBackgroundImage:forState:](v3, "setBackgroundImage:forState:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("GradientButtonBackground.png"), v4), "stretchableImageWithLeftCapWidth:topCapHeight:", 7, 0), 0);
    -[SUGradientButton setTitleColor:forState:](v3, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"), 0);
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("GradientButtonBackgroundPressed.png"), v4), "stretchableImageWithLeftCapWidth:topCapHeight:", 7, 0);
    -[SUGradientButton setBackgroundImage:forState:](v3, "setBackgroundImage:forState:", v5, 1);
    -[SUGradientButton setBackgroundImage:forState:](v3, "setBackgroundImage:forState:", v5, 4);
    -[SUGradientButton setTitleColor:forState:](v3, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), 1);
    -[SUGradientButton setTitleColor:forState:](v3, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), 4);
    v6 = (void *)-[SUGradientButton titleLabel](v3, "titleLabel");
    objc_msgSend(v6, "setTextAlignment:", 1);
    objc_msgSend(v6, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 15.0));
    objc_msgSend(v6, "setLineBreakMode:", 0);
    objc_msgSend(v6, "setNumberOfLines:", 2);
    -[SUGradientButton contentEdgeInsets](v3, "contentEdgeInsets");
    -[SUGradientButton setContentEdgeInsets:](v3, "setContentEdgeInsets:", 5.0, 7.0, 5.0, 7.0);
  }
  return v3;
}

- (void)sendAction:(SEL)a3 to:(id)a4 forEvent:(id)a5
{
  objc_super v9;

  -[SUGradientButton setSelected:](self, "setSelected:", 1);
  v9.receiver = self;
  v9.super_class = (Class)SUGradientButton;
  -[SUGradientButton sendAction:to:forEvent:](&v9, sel_sendAction_to_forEvent_, a3, a4, a5);
}

- (void)sizeToFit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUGradientButton;
  -[SUGradientButton sizeToFit](&v3, sel_sizeToFit);
  -[SUGradientButton frame](self, "frame");
  -[SUGradientButton setFrame:](self, "setFrame:");
}

@end
