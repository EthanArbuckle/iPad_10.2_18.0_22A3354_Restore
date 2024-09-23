@implementation ICBrowseAttachmentsBrickCell

- (ICBrowseAttachmentsBrickCell)initWithFrame:(CGRect)a3
{
  ICBrowseAttachmentsBrickCell *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v14.receiver = self;
  v14.super_class = (Class)ICBrowseAttachmentsBrickCell;
  v3 = -[ICBrowseAttachmentsBrickCell initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)ICAttachmentBrickView), "initWithType:", 4);
    -[ICBrowseAttachmentsBrickCell setAttachmentBrickView:](v3, "setAttachmentBrickView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBrickCell attachmentBrickView](v3, "attachmentBrickView"));
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBrickCell contentView](v3, "contentView"));
    objc_msgSend(v6, "addSubview:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBrickCell contentView](v3, "contentView"));
    v17 = CFSTR("brick");
    v18 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-0-[brick]-0-|"), 0, 0, v8));
    objc_msgSend(v7, "addConstraints:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBrickCell contentView](v3, "contentView"));
    v15 = CFSTR("brick");
    v16 = v5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[brick]-0-|"), 0, 0, v11));
    objc_msgSend(v10, "addConstraints:", v12);

  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICBrowseAttachmentsBrickCell;
  -[ICBrowseAttachmentsBaseCell prepareForReuse](&v4, "prepareForReuse");
  -[ICBrowseAttachmentsBrickCell setAttachment:](self, "setAttachment:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBrickCell attachmentBrickView](self, "attachmentBrickView"));
  objc_msgSend(v3, "prepareForReuse");

}

- (void)setAttachment:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));

  if (v5 != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)ICBrowseAttachmentsBrickCell;
    -[ICBrowseAttachmentsBaseCell setAttachment:](&v7, "setAttachment:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBrickCell attachmentBrickView](self, "attachmentBrickView"));
    objc_msgSend(v6, "setAttachment:", v4);

  }
}

- (ICAttachmentBrickView)attachmentBrickView
{
  return self->_attachmentBrickView;
}

- (void)setAttachmentBrickView:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentBrickView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentBrickView, 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBrickCell attachmentBrickView](self, "attachmentBrickView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityLabel"));

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBrickCell attachmentBrickView](self, "attachmentBrickView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityValue"));

  return v3;
}

@end
