@implementation SBSetupRegulatoryInfoViewController

- (void)loadView
{
  UIImageView *v3;
  UIImageView *regulatoryImageView;
  UIImageView *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIScrollView *v17;
  UIScrollView *containerView;
  UIScrollView *v19;
  void *v20;
  UIScrollView *v21;
  double v22;
  double v23;
  id v24;

  SFRegulatoryImage();
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v24);
  regulatoryImageView = self->_regulatoryImageView;
  self->_regulatoryImageView = v3;

  -[UIImageView sizeToFit](self->_regulatoryImageView, "sizeToFit");
  if (_os_feature_enabled_impl())
  {
    v5 = self->_regulatoryImageView;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v5, "setTintColor:", v6);

  }
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0DA9E68], "notificationListInsets");
  v13 = v12;
  v14 = *MEMORY[0x1E0CEBBE0];
  if (SBFEffectiveHomeButtonType() == 2)
  {
    objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockOffsetFromTopOfScreen");
    v14 = v14 + v15;
  }
  objc_msgSend(v24, "size");
  v17 = (UIScrollView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA970]), "initWithFrame:", v9, v14, v16, v11 - (v13 + v14));
  containerView = self->_containerView;
  self->_containerView = v17;

  v19 = self->_containerView;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView setBackgroundColor:](v19, "setBackgroundColor:", v20);

  -[UIScrollView setAutoresizingMask:](self->_containerView, "setAutoresizingMask:", 16);
  -[UIScrollView setContentInset:](self->_containerView, "setContentInset:", 24.0, 0.0, 24.0, 0.0);
  -[UIScrollView setContentOffset:](self->_containerView, "setContentOffset:", 0.0, -24.0);
  -[UIScrollView addSubview:](self->_containerView, "addSubview:", self->_regulatoryImageView);
  v21 = self->_containerView;
  -[UIScrollView frame](v21, "frame");
  v23 = v22;
  objc_msgSend(v24, "size");
  -[UIScrollView setContentSize:](v21, "setContentSize:", v23);
  -[UIScrollView setClipsToBounds:](self->_containerView, "setClipsToBounds:", 1);
  -[SBSetupRegulatoryInfoViewController setView:](self, "setView:", self->_containerView);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regulatoryImageView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
