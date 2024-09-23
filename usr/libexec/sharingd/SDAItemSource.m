@implementation SDAItemSource

- (SDAItemSource)initWithData:(id)a3 type:(id)a4 previewImage:(id)a5 subject:(id)a6 name:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SDAItemSource *v18;
  SDAItemSource *v19;
  NSString *v20;
  NSString *subject;
  NSString *v22;
  NSString *uti;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)SDAItemSource;
  v18 = -[SDAItemSource init](&v25, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_data, a3);
    objc_storeStrong((id *)&v19->_name, a7);
    objc_storeStrong((id *)&v19->_previewImage, a5);
    v20 = (NSString *)objc_msgSend(v16, "copy");
    subject = v19->_subject;
    v19->_subject = v20;

    v22 = (NSString *)objc_msgSend(v14, "copy");
    uti = v19->_uti;
    v19->_uti = v22;

  }
  return v19;
}

- (SDAItemSource)initWithURL:(id)a3 previewImage:(id)a4 subject:(id)a5
{
  id v9;
  id v10;
  id v11;
  SDAItemSource *v12;
  SDAItemSource *v13;
  NSString *v14;
  NSString *subject;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SDAItemSource;
  v12 = -[SDAItemSource init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_previewImage, a4);
    v14 = (NSString *)objc_msgSend(v11, "copy");
    subject = v13->_subject;
    v13->_subject = v14;

    objc_storeStrong((id *)&v13->_URL, a3);
  }

  return v13;
}

- (SDAItemSource)initWithString:(id)a3 previewImage:(id)a4 subject:(id)a5
{
  id v8;
  id v9;
  id v10;
  SDAItemSource *v11;
  SDAItemSource *v12;
  NSString *v13;
  NSString *subject;
  NSString *v15;
  NSString *string;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SDAItemSource;
  v11 = -[SDAItemSource init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_previewImage, a4);
    v13 = (NSString *)objc_msgSend(v10, "copy");
    subject = v12->_subject;
    v12->_subject = v13;

    v15 = (NSString *)objc_msgSend(v8, "copy");
    string = v12->_string;
    v12->_string = v15;

  }
  return v12;
}

- (SDAItemSource)initWithAttributedString:(id)a3 previewImage:(id)a4 subject:(id)a5
{
  id v8;
  id v9;
  id v10;
  SDAItemSource *v11;
  NSAttributedString *v12;
  NSAttributedString *attributedString;
  NSString *v14;
  NSString *subject;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SDAItemSource;
  v11 = -[SDAItemSource init](&v17, "init");
  if (v11)
  {
    v12 = (NSAttributedString *)objc_msgSend(v8, "copy");
    attributedString = v11->_attributedString;
    v11->_attributedString = v12;

    objc_storeStrong((id *)&v11->_previewImage, a4);
    v14 = (NSString *)objc_msgSend(v10, "copy");
    subject = v11->_subject;
    v11->_subject = v14;

  }
  return v11;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *attributedString;

  attributedString = self->_attributedString;
  if (attributedString)
    return attributedString;
  attributedString = self->_data;
  if (attributedString)
    return attributedString;
  attributedString = self->_string;
  if (attributedString)
    return attributedString;
  attributedString = self->_URL;
  if (attributedString)
    return attributedString;
  else
    return &stru_10072FE60;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *attributedString;

  attributedString = self->_attributedString;
  if (attributedString)
    return attributedString;
  attributedString = self->_data;
  if (attributedString)
    return attributedString;
  attributedString = self->_string;
  if (attributedString)
    return attributedString;
  attributedString = self->_URL;
  if (attributedString)
    return attributedString;
  else
    return 0;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  return self->_subject;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return self->_uti;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  return self->_previewImage;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  NSURL *URL;
  NSString *v6;

  URL = self->_URL;
  if (URL)
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](URL, "lastPathComponent", a3, a4));
  else
    v6 = self->_name;
  return v6;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = objc_alloc_init(off_1007B34C8());
  if (self->_previewImage)
  {
    v5 = objc_msgSend(objc_alloc(off_1007B34D0()), "initWithPlatformImage:", self->_previewImage);
    objc_msgSend(v4, "setImage:", v5);

  }
  if (self->_URL)
    objc_msgSend(v4, "setOriginalURL:");
  if (self->_name || self->_subject)
    objc_msgSend(v4, "setTitle:");
  return v4;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (void)setPreviewImage:(id)a3
{
  objc_storeStrong((id *)&self->_previewImage, a3);
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSString)fakeBundleID
{
  return self->_fakeBundleID;
}

- (void)setFakeBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)fakeBytes
{
  return self->_fakeBytes;
}

- (void)setFakeBytes:(int64_t)a3
{
  self->_fakeBytes = a3;
}

- (float)fakeDuration
{
  return self->_fakeDuration;
}

- (void)setFakeDuration:(float)a3
{
  self->_fakeDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeBundleID, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
