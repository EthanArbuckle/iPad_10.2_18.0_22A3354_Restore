@implementation RPPairingShowViewController

+ (id)instantiateViewController
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.RapportUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6E00], "storyboardWithName:bundle:", CFSTR("RPPairingShow_iOS"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instantiateViewControllerWithIdentifier:", CFSTR("PINShow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "view");

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPPairingShowViewController;
  -[RPPairingShowViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[RPPairingShowViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setHidden:](self->_cancelButton, "setHidden:", v4 != 0);

  -[RPPairingShowViewController _updatePasswordUI](self, "_updatePasswordUI");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void (**v4)(_QWORD);
  id dismissHandler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPPairingShowViewController;
  -[RPPairingShowViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  v4 = (void (**)(_QWORD))MEMORY[0x2348A6E58](self->_dismissHandler);
  dismissHandler = self->_dismissHandler;
  self->_dismissHandler = 0;

  if (v4)
    v4[2](v4);

}

- (void)handleCancelButton:(id)a3
{
  -[RPPairingShowViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_updatePasswordUI
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;

  v9 = self->_password;
  if (-[NSString length](v9, "length") == 4)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C %C %C %C"), -[NSString characterAtIndex:](v9, "characterAtIndex:", 0), -[NSString characterAtIndex:](v9, "characterAtIndex:", 1), -[NSString characterAtIndex:](v9, "characterAtIndex:", 2), -[NSString characterAtIndex:](v9, "characterAtIndex:", 3), v5, v6, v7, v8);
  }
  else if (-[NSString length](v9, "length") == 6)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C %C %C   %C %C %C"), -[NSString characterAtIndex:](v9, "characterAtIndex:", 0), -[NSString characterAtIndex:](v9, "characterAtIndex:", 1), -[NSString characterAtIndex:](v9, "characterAtIndex:", 2), -[NSString characterAtIndex:](v9, "characterAtIndex:", 3), -[NSString characterAtIndex:](v9, "characterAtIndex:", 4), -[NSString characterAtIndex:](v9, "characterAtIndex:", 5), v7, v8);
  }
  else
  {
    if (-[NSString length](v9, "length") != 8)
    {
      -[UILabel setText:](self->_verificationCodeLabel, "setText:", v9);
      goto LABEL_8;
    }
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C%C%C-%C%C-%C%C%C"), -[NSString characterAtIndex:](v9, "characterAtIndex:", 0), -[NSString characterAtIndex:](v9, "characterAtIndex:", 1), -[NSString characterAtIndex:](v9, "characterAtIndex:", 2), -[NSString characterAtIndex:](v9, "characterAtIndex:", 3), -[NSString characterAtIndex:](v9, "characterAtIndex:", 4), -[NSString characterAtIndex:](v9, "characterAtIndex:", 5), -[NSString characterAtIndex:](v9, "characterAtIndex:", 6), -[NSString characterAtIndex:](v9, "characterAtIndex:", 7));
  }
  v4 = (void *)v3;
  -[UILabel setText:](self->_verificationCodeLabel, "setText:", v3);

LABEL_8:
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subTitleLabel, a3);
}

- (UILabel)verificationCodeLabel
{
  return self->_verificationCodeLabel;
}

- (void)setVerificationCodeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_verificationCodeLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationCodeLabel, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
}

@end
