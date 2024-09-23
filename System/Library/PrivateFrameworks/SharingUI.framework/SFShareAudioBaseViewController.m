@implementation SFShareAudioBaseViewController

- (void)viewWillAppear:(BOOL)a3
{
  char v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFShareAudioBaseViewController;
  -[SFShareAudioBaseViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  self->_viewActive = 1;
  v4 = -[SFShareAudioViewController flags](self->_mainController, "flags");
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "darkGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_cardView, "setBackgroundColor:", v5);

  }
  if ((v4 & 1) != 0)
    -[UIView _setContinuousCornerRadius:](self->_cardView, "_setContinuousCornerRadius:", 0.0);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE240], 1280);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFShareAudioBaseViewController;
  -[SFShareAudioBaseViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_viewActive = 0;
}

- (SFShareAudioViewController)mainController
{
  return self->_mainController;
}

- (void)setMainController:(id)a3
{
  objc_storeStrong((id *)&self->_mainController, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
  objc_storeStrong((id *)&self->_cardView, a3);
}

- (BOOL)viewActive
{
  return self->_viewActive;
}

- (void)setViewActive:(BOOL)a3
{
  self->_viewActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_mainController, 0);
}

@end
