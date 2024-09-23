@implementation AttachmentPreviewItem

- (AttachmentPreviewItem)initWithUrl:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  AttachmentPreviewItem *v9;
  AttachmentPreviewItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AttachmentPreviewItem;
  v9 = -[AttachmentPreviewItem init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_previewItemURL, a3);
    objc_storeStrong((id *)&v10->_previewItemTitle, a4);
  }

  return v10;
}

- (NSURL)previewItemURL
{
  return self->_previewItemURL;
}

- (void)setPreviewItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_previewItemURL, a3);
}

- (NSString)previewItemTitle
{
  return self->_previewItemTitle;
}

- (void)setPreviewItemTitle:(id)a3
{
  objc_storeStrong((id *)&self->_previewItemTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewItemTitle, 0);
  objc_storeStrong((id *)&self->_previewItemURL, 0);
}

@end
