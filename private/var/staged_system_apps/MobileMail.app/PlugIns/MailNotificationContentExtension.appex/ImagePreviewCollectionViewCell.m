@implementation ImagePreviewCollectionViewCell

- (ImagePreviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  ImagePreviewCollectionViewCell *v3;
  void *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *imageView;
  void *v8;
  MFAvatarView *v9;
  MFAvatarView *avatarView;
  id v11;
  id v12;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;
  _QWORD v44[8];

  v43.receiver = self;
  v43.super_class = (Class)ImagePreviewCollectionViewCell;
  v3 = -[ImagePreviewCollectionViewCell initWithFrame:](&v43, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ImagePreviewCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v5, "setBackgroundColor:", v4);

    v6 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    imageView = v3->_imageView;
    v3->_imageView = v6;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ImagePreviewCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v8, "addSubview:", v3->_imageView);

    v9 = -[MFAvatarView initWithFrame:]([MFAvatarView alloc], "initWithFrame:", 0.0, 0.0, 25.0, 25.0);
    avatarView = v3->_avatarView;
    v3->_avatarView = v9;

    -[MFAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v3->_avatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    v12 = objc_msgSend(v11, "CGColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView layer](v3->_avatarView, "layer"));
    objc_msgSend(v13, "setBorderColor:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView layer](v3->_avatarView, "layer"));
    objc_msgSend(v14, "setCornerRadius:", 12.5);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView layer](v3->_avatarView, "layer"));
    objc_msgSend(v15, "setBorderWidth:", 1.0);

    -[MFAvatarView setClipsToBounds:](v3->_avatarView, "setClipsToBounds:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView layer](v3->_avatarView, "layer"));
    objc_msgSend(v16, "setMasksToBounds:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ImagePreviewCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v17, "addSubview:", v3->_avatarView);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ImagePreviewCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v18, "bringSubviewToFront:", v3->_avatarView);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v3->_imageView, "leadingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ImagePreviewCollectionViewCell leadingAnchor](v3, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:"));
    v44[0] = v36;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v3->_imageView, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ImagePreviewCollectionViewCell topAnchor](v3, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:"));
    v44[1] = v34;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v3->_imageView, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ImagePreviewCollectionViewCell bottomAnchor](v3, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:"));
    v44[2] = v32;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v3->_imageView, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ImagePreviewCollectionViewCell trailingAnchor](v3, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:"));
    v44[3] = v30;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView trailingAnchor](v3->_avatarView, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v3->_imageView, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", -10.0));
    v44[4] = v28;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView topAnchor](v3->_avatarView, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v3->_imageView, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 10.0));
    v44[5] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView widthAnchor](v3->_avatarView, "widthAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 25.0));
    v44[6] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView heightAnchor](v3->_avatarView, "heightAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:", 25.0));
    v44[7] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

  }
  return v3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (MFAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
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
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
