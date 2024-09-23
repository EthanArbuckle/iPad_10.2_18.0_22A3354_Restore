@implementation BFFLinkHandler

- (BFFLinkHandler)init
{
  BFFLinkHandler *v2;
  uint64_t v3;
  UIButton *button;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BFFLinkHandler;
  v2 = -[BFFLinkHandler init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v3 = objc_claimAutoreleasedReturnValue();
    button = v2->_button;
    v2->_button = (UIButton *)v3;

    -[UIButton titleLabel](v2->_button, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v5, "setTextAlignment:", 1);
    objc_msgSend(v5, "setNumberOfLines:", 0);
    -[UIButton setExclusiveTouch:](v2->_button, "setExclusiveTouch:", 1);
    -[UIButton addTarget:action:forControlEvents:](v2->_button, "addTarget:action:forControlEvents:", v2, sel_buttonPressed_, 64);

  }
  return v2;
}

- (void)buttonPressed:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[BFFLinkHandler handler](self, "handler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BFFLinkHandler handler](self, "handler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
