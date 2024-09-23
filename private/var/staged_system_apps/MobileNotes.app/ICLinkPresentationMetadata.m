@implementation ICLinkPresentationMetadata

- (ICLinkPresentationMetadata)initWithTitle:(id)a3 imageName:(id)a4
{
  id v6;
  id v7;
  ICLinkPresentationMetadata *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICLinkPresentationMetadata;
  v8 = -[ICLinkPresentationMetadata init](&v15, "init");
  if (v8)
  {
    v9 = objc_alloc_init((Class)sub_100088718());
    v10 = objc_alloc_init((Class)LPImageProperties);
    objc_msgSend(v10, "setType:", 5);
    v11 = objc_alloc((Class)LPImage);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v7));
    v13 = objc_msgSend(v11, "initWithPlatformImage:properties:", v12, v10);

    objc_msgSend(v9, "setImage:", v13);
    objc_msgSend(v9, "setTitle:", v6);
    -[ICLinkPresentationMetadata setLinkMetadata:](v8, "setLinkMetadata:", v9);

  }
  return v8;
}

- (ICLinkPresentationMetadata)initWithTitle:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  ICLinkPresentationMetadata *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICLinkPresentationMetadata;
  v8 = -[ICLinkPresentationMetadata init](&v16, "init");
  if (v8)
  {
    v9 = objc_alloc_init((Class)sub_100088718());
    v10 = objc_alloc_init((Class)LPImageProperties);
    objc_msgSend(v10, "setType:", 5);
    v11 = objc_alloc((Class)LPImage);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_PNGData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePNG, "preferredMIMEType"));
    v14 = objc_msgSend(v11, "initWithData:MIMEType:properties:", v12, v13, v10);

    objc_msgSend(v9, "setImage:", v14);
    objc_msgSend(v9, "setTitle:", v6);
    -[ICLinkPresentationMetadata setLinkMetadata:](v8, "setLinkMetadata:", v9);

  }
  return v8;
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
}

@end
