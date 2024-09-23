@implementation SFUIAvatarImageRenderer

- (SFUIAvatarImageRenderer)init
{
  SFUIAvatarImageRenderer *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CNAvatarImageRenderer *imageRenderer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFUIAvatarImageRenderer;
  v2 = -[SFUIAvatarImageRenderer init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc((Class)getCNAvatarImageRendererClass());
    objc_msgSend(getCNAvatarImageRendererSettingsClass(), "defaultSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithSettings:", v4);
    imageRenderer = v2->_imageRenderer;
    v2->_imageRenderer = (CNAvatarImageRenderer *)v5;

  }
  return v2;
}

+ (id)avatarImageRender
{
  return objc_alloc_init(SFUIAvatarImageRenderer);
}

- (id)avatarImageForContacts:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[SFUIAvatarImageRenderer imageRenderer](self, "imageRenderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "avatarImageForContacts:scope:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)placeholderImageForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;

  height = a3.height;
  width = a3.width;
  -[SFUIAvatarImageRenderer imageRenderer](self, "imageRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "placeholderImageProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "imageForSize:scale:", width, height, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)avatarImageForContacts:(id)a3
{
  return 0;
}

- (CNKeyDescriptor)descriptorForRequiredKeys
{
  return (CNKeyDescriptor *)objc_msgSend(getCNAvatarImageRendererClass(), "descriptorForRequiredKeys");
}

- (id)avatarImageForContacts:(id)a3 pointSize:(CGSize)a4 scale:(double)a5 rightToLeft:(BOOL)a6 style:(unint64_t)a7 backgroundStyle:(unint64_t)a8
{
  return 0;
}

- (CNAvatarImageRenderer)imageRenderer
{
  return self->_imageRenderer;
}

- (void)setImageRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_imageRenderer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRenderer, 0);
}

@end
