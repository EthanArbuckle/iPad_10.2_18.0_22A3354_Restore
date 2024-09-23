@implementation AttachmentPreviewCollectionViewCell

- (AttachmentPreviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  AttachmentPreviewCollectionViewCell *v3;
  void *v4;
  void *v5;
  id v6;
  double y;
  double width;
  double height;
  UILabel *v10;
  UILabel *nameLabel;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *dateLabel;
  void *v16;
  void *v17;
  void *v18;
  UIImageView *v19;
  UIImageView *imageView;
  void *v21;
  void *v22;
  MFAvatarView *v23;
  MFAvatarView *avatarView;
  id v25;
  id v26;
  void *v27;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  objc_super v72;
  _QWORD v73[13];

  v72.receiver = self;
  v72.super_class = (Class)AttachmentPreviewCollectionViewCell;
  v3 = -[AttachmentPreviewCollectionViewCell initWithFrame:](&v72, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v5, "setBackgroundColor:", v4);

    v6 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = (UILabel *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
    -[UILabel setFont:](v3->_nameLabel, "setFont:", v12);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_nameLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v3->_nameLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v3->_nameLabel, "setLineBreakMode:", 5);
    -[UILabel setLineBreakStrategy:](v3->_nameLabel, "setLineBreakStrategy:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v13, "addSubview:", v3->_nameLabel);

    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    dateLabel = v3->_dateLabel;
    v3->_dateLabel = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
    -[UILabel setFont:](v3->_dateLabel, "setFont:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    -[UILabel setTextColor:](v3->_dateLabel, "setTextColor:", v17);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_dateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_dateLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v3->_dateLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v3->_dateLabel, "setLineBreakMode:", 5);
    -[UILabel setLineBreakStrategy:](v3->_dateLabel, "setLineBreakStrategy:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v18, "addSubview:", v3->_dateLabel);

    v19 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = v3->_imageView;
    v3->_imageView = v19;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v3->_imageView, "layer"));
    objc_msgSend(v21, "setCornerRadius:", 5.0);

    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v22, "addSubview:", v3->_imageView);

    v23 = -[MFAvatarView initWithFrame:]([MFAvatarView alloc], "initWithFrame:", 0.0, 0.0, 25.0, 25.0);
    avatarView = v3->_avatarView;
    v3->_avatarView = v23;

    -[MFAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v3->_avatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    v26 = objc_msgSend(v25, "CGColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView layer](v3->_avatarView, "layer"));
    objc_msgSend(v27, "setBorderColor:", v26);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView layer](v3->_avatarView, "layer"));
    objc_msgSend(v28, "setCornerRadius:", 12.5);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView layer](v3->_avatarView, "layer"));
    objc_msgSend(v29, "setBorderWidth:", 1.0);

    -[MFAvatarView setClipsToBounds:](v3->_avatarView, "setClipsToBounds:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView layer](v3->_avatarView, "layer"));
    objc_msgSend(v30, "setMasksToBounds:", 1);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v31, "addSubview:", v3->_avatarView);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v32, "bringSubviewToFront:", v3->_avatarView);

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_dateLabel, "bottomAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell bottomAnchor](v3, "bottomAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:constant:", -4.0));
    v73[0] = v60;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v3->_dateLabel, "centerXAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell centerXAnchor](v3, "centerXAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:"));
    v73[1] = v58;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v3->_dateLabel, "widthAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell widthAnchor](v3, "widthAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:constant:", -5.0));
    v73[2] = v56;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_nameLabel, "bottomAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_dateLabel, "topAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:"));
    v73[3] = v54;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v3->_nameLabel, "centerXAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell centerXAnchor](v3, "centerXAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:"));
    v73[4] = v52;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v3->_nameLabel, "widthAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell widthAnchor](v3, "widthAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", -5.0));
    v73[5] = v50;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v3->_imageView, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell topAnchor](v3, "topAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:constant:", 4.0));
    v73[6] = v48;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v3->_imageView, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_nameLabel, "topAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:", -4.0));
    v73[7] = v46;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v3->_imageView, "centerXAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell centerXAnchor](v3, "centerXAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:"));
    v73[8] = v44;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView trailingAnchor](v3->_avatarView, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v3->_imageView, "trailingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", -10.0));
    v73[9] = v42;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView topAnchor](v3->_avatarView, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v3->_imageView, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 10.0));
    v73[10] = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView widthAnchor](v3->_avatarView, "widthAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToConstant:", 25.0));
    v73[11] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView heightAnchor](v3->_avatarView, "heightAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToConstant:", 25.0));
    v73[12] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 13));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v40);

  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell nameLabel](self, "nameLabel"));
  objc_msgSend(v3, "setText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell dateLabel](self, "dateLabel"));
  objc_msgSend(v4, "setText:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell imageView](self, "imageView"));
  objc_msgSend(v5, "setImage:", 0);

  v6.receiver = self;
  v6.super_class = (Class)AttachmentPreviewCollectionViewCell;
  -[AttachmentPreviewCollectionViewCell prepareForReuse](&v6, "prepareForReuse");
}

- (void)setImage:(id)a3 withAspectRatio:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell imageView](self, "imageView"));
  objc_msgSend(v6, "setImage:", v14);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell imageView](self, "imageView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell imageView](self, "imageView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "widthAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AttachmentPreviewCollectionViewCell imageView](self, "imageView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heightAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:multiplier:", v12, a4));
  objc_msgSend(v13, "setActive:", 1);

}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
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
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
