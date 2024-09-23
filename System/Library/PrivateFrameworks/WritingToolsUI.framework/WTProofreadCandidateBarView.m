@implementation WTProofreadCandidateBarView

- (WTProofreadCandidateBarView)init
{
  id v3;
  void *v4;
  void *v5;
  WTProofreadCandidateBarView *v6;
  void *v7;
  UILabel *v8;
  UILabel *badgeView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc(MEMORY[0x24BEBDC60]);
  objc_msgSend(MEMORY[0x24BEBDC68], "sharedLight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithLightSource:", v4);
  v15.receiver = self;
  v15.super_class = (Class)WTProofreadCandidateBarView;
  v6 = -[WTProofreadCandidateBarView initWithEffect:](&v15, sel_initWithEffect_, v5);

  if (v6)
  {
    -[WTProofreadCandidateBarView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    -[WTProofreadCandidateBarView setExclusiveTouch:](v6, "setExclusiveTouch:", 0);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("text.magnifyingglass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    badgeView = v6->_badgeView;
    v6->_badgeView = v8;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6->_badgeView, "setFont:", v10);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v7);
    objc_msgSend(v11, "setContentMode:", 1);
    -[WTProofreadCandidateBarView contentView](v6, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v11);

    -[WTProofreadCandidateBarView contentView](v6, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v6->_badgeView);

    -[WTProofreadCandidateBarView setFrame:](v6, "setFrame:", 0.0, 0.0, 50.0, 48.0);
    objc_msgSend(v11, "setFrame:", 12.0, 12.0, 24.0, 24.0);
    -[UILabel setFrame:](v6->_badgeView, "setFrame:", 30.0, 6.0, 14.0, 16.0);

  }
  return v6;
}

- (void)setSuggestionCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringFromNumber:numberStyle:", v7, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTProofreadCandidateBarView badgeView](self, "badgeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[WTProofreadCandidateBarView frame](self, "frame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (UILabel)badgeView
{
  return (UILabel *)objc_getProperty(self, a2, 536, 1);
}

- (void)setBadgeView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
