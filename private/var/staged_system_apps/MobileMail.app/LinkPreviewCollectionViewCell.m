@implementation LinkPreviewCollectionViewCell

- (void)setLinkView:(id)a3
{
  LPLinkView *v5;
  LPLinkView **p_linkView;
  LPLinkView *v7;
  MFAvatarView *v8;
  MFAvatarView *avatarView;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];

  v5 = (LPLinkView *)a3;
  p_linkView = &self->_linkView;
  if (self->_linkView != v5)
  {
    objc_storeStrong((id *)&self->_linkView, a3);
    if (v5)
    {
      -[LPLinkView setDelegate:](*p_linkView, "setDelegate:", self);
      -[LPLinkView _setDisableTapGesture:](*p_linkView, "_setDisableTapGesture:", 1);
      -[LPLinkView _setApplyCornerRadius:](*p_linkView, "_setApplyCornerRadius:", 1);
      v7 = *p_linkView;
      -[LinkPreviewCollectionViewCell bounds](self, "bounds");
      -[LPLinkView setFrame:](v7, "setFrame:");
      -[LinkPreviewCollectionViewCell addSubview:](self, "addSubview:", *p_linkView);
      v8 = -[MFAvatarView initWithFrame:]([MFAvatarView alloc], "initWithFrame:", 0.0, 0.0, 25.0, 25.0);
      avatarView = self->_avatarView;
      self->_avatarView = v8;

      -[MFAvatarView setTranslatesAutoresizingMaskIntoConstraints:](self->_avatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
      v11 = objc_msgSend(v10, "CGColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView layer](self->_avatarView, "layer"));
      objc_msgSend(v12, "setBorderColor:", v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView layer](self->_avatarView, "layer"));
      objc_msgSend(v13, "setCornerRadius:", 12.5);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView layer](self->_avatarView, "layer"));
      objc_msgSend(v14, "setBorderWidth:", 1.0);

      -[MFAvatarView setClipsToBounds:](self->_avatarView, "setClipsToBounds:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView layer](self->_avatarView, "layer"));
      objc_msgSend(v15, "setMasksToBounds:", 1);

      -[LinkPreviewCollectionViewCell addSubview:](self, "addSubview:", self->_avatarView);
      -[LinkPreviewCollectionViewCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_avatarView);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView trailingAnchor](self->_avatarView, "trailingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[LPLinkView trailingAnchor](*p_linkView, "trailingAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", -10.0));
      v28[0] = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView topAnchor](self->_avatarView, "topAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[LPLinkView topAnchor](*p_linkView, "topAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v16, 10.0));
      v28[1] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView widthAnchor](self->_avatarView, "widthAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 25.0));
      v28[2] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView heightAnchor](self->_avatarView, "heightAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", 25.0));
      v28[3] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[LinkPreviewCollectionViewCell linkView](self, "linkView"));
      objc_msgSend(v23, "removeFromSuperview");

    }
  }

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LinkPreviewCollectionViewCell;
  -[LinkPreviewCollectionViewCell prepareForReuse](&v6, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LinkPreviewCollectionViewCell linkView](self, "linkView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LinkPreviewCollectionViewCell linkView](self, "linkView"));
    objc_msgSend(v4, "removeFromSuperview");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LinkPreviewCollectionViewCell avatarView](self, "avatarView"));
    objc_msgSend(v5, "removeFromSuperview");

  }
}

- (void)linkViewNeedsResize:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[LinkPreviewCollectionViewCell linkView](self, "linkView"));

  if (v4 == v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LinkPreviewCollectionViewCell linkView](self, "linkView"));
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (void)_linkViewMetadataDidBecomeComplete:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[LinkPreviewCollectionViewCell linkView](self, "linkView"));

  if (v4 == v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LinkPreviewCollectionViewCell linkView](self, "linkView"));
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (MFAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
}

@end
