@implementation STSResultDetailFooter

- (STSResultDetailFooter)initWithFrame:(CGRect)a3
{
  STSResultDetailFooter *v3;
  uint64_t v4;
  NSMutableArray *constraints;
  id v6;
  uint64_t v7;
  UIImageView *providerIconView;
  uint64_t v9;
  UIButton *providerButton;
  void *v11;
  void *v12;
  UIButton *v13;
  void *v14;
  uint64_t v15;
  UIButton *sendButton;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)STSResultDetailFooter;
  v3 = -[STSResultDetailFooter initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    constraints = v3->_constraints;
    v3->_constraints = (NSMutableArray *)v4;

    v6 = objc_alloc(MEMORY[0x24BEBD668]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    providerIconView = v3->_providerIconView;
    v3->_providerIconView = (UIImageView *)v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_providerIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v3->_providerIconView, "setContentMode:", 4);
    -[UIImageView setUserInteractionEnabled:](v3->_providerIconView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    providerButton = v3->_providerButton;
    v3->_providerButton = (UIButton *)v9;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_providerButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setContentEdgeInsets:](v3->_providerButton, "setContentEdgeInsets:", 10.0, 0.0, 10.0, 0.0);
    -[UIButton titleLabel](v3->_providerButton, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    v13 = v3->_providerButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v13, "setTitleColor:forState:", v14, 0);

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v15 = objc_claimAutoreleasedReturnValue();
    sendButton = v3->_sendButton;
    v3->_sendButton = (UIButton *)v15;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_sendButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageNamed:inBundle:", CFSTR("send-button"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](v3->_sendButton, "setImage:forState:", v19, 0);
    -[STSResultDetailFooter addSubview:](v3, "addSubview:", v3->_providerButton);
    -[STSResultDetailFooter addSubview:](v3, "addSubview:", v3->_providerIconView);
    -[STSResultDetailFooter addSubview:](v3, "addSubview:", v3->_sendButton);
    -[STSResultDetailFooter setNeedsUpdateConstraints](v3, "setNeedsUpdateConstraints");

  }
  return v3;
}

- (void)updateConstraints
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[6];
  _QWORD v19[8];

  v19[6] = *MEMORY[0x24BDAC8D0];
  -[STSResultDetailFooter removeConstraints:](self, "removeConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  v17.receiver = self;
  v17.super_class = (Class)STSResultDetailFooter;
  -[STSResultDetailFooter updateConstraints](&v17, sel_updateConstraints);
  if (self->_providerIconSize.width <= 0.0)
    v3 = 0.0;
  else
    v3 = 8.0;
  -[UIButton imageForState:](self->_sendButton, "imageForState:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("_providerIconView, _providerButton, _sendButton"), self->_providerIconView, self->_providerButton, self->_sendButton, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = &unk_24E757638;
  v18[0] = CFSTR("ProviderIconInsetsLeft");
  v18[1] = CFSTR("ProviderIconInsetsRight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  v18[2] = CFSTR("ProviderIconWidth");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_providerIconSize.width);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v6;
  v19[3] = &unk_24E757648;
  v18[3] = CFSTR("ProviderButtonInsetsRight");
  v18[4] = CFSTR("SendButtonInsetsRight");
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v16, "size");
  objc_msgSend(v7, "numberWithDouble:", (44.0 - v8) * -0.5 + 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = CFSTR("SendButtonWidth");
  v19[4] = v9;
  v19[5] = &unk_24E757658;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-ProviderIconInsetsLeft-[_providerIconView(ProviderIconWidth)]-ProviderIconInsetsRight-[_providerButton]-(>=ProviderButtonInsetsRight)-[_sendButton(SendButtonWidth)]-SendButtonInsetsRight-|"), 0, v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_providerIconView, 10, 0, self, 10, 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_providerButton, 10, 0, self->_providerIconView, 10, 1.0, -1.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_sendButton, 10, 0, self, 10, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_sendButton, 8, 0, 0, 0, 1.0, 44.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](self->_constraints, "addObjectsFromArray:", v11);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v12);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v13);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v14);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v15);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);

}

- (void)setProviderIconSize:(CGSize)a3
{
  if (self->_providerIconSize.width != a3.width || self->_providerIconSize.height != a3.height)
  {
    self->_providerIconSize = a3;
    -[STSResultDetailFooter setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (UIImage)providerIcon
{
  return -[UIImageView image](self->_providerIconView, "image");
}

- (void)setProviderIcon:(id)a3
{
  -[UIImageView setImage:](self->_providerIconView, "setImage:", a3);
}

- (CGSize)providerIconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_providerIconSize.width;
  height = self->_providerIconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIButton)providerButton
{
  return self->_providerButton;
}

- (UIButton)sendButton
{
  return self->_sendButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendButton, 0);
  objc_storeStrong((id *)&self->_providerButton, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_providerIconView, 0);
}

@end
