@implementation _UIDICPreviewItem

- (void)dealloc
{
  id v3;
  NSURL *URLToDeleteOnDealloc;
  char v5;
  id v6;
  void *v7;
  objc_super v8;
  id v9;

  if (self->_URLToDeleteOnDealloc)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    URLToDeleteOnDealloc = self->_URLToDeleteOnDealloc;
    v9 = 0;
    v5 = objc_msgSend(v3, "removeItemAtURL:error:", URLToDeleteOnDealloc, &v9);
    v6 = v9;

    if ((v5 & 1) == 0 && v6)
    {
      objc_msgSend(v6, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Unable to remove URL, reason: %@"), v7);

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIDICPreviewItem;
  -[_UIDICPreviewItem dealloc](&v8, sel_dealloc);
}

- (void)setPreviewItemContentType:(id)a3
{
  NSString *v4;
  NSString *previewItemContentType;

  if (self->_previewItemContentType != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    previewItemContentType = self->_previewItemContentType;
    self->_previewItemContentType = v4;

  }
}

- (NSString)previewItemContentType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)-[NSString copy](self->_previewItemContentType, "copy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_UIDICPreviewItem previewItemURL](self, "previewItemURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UIQLPreviewUTIForURLAndMimeType(v6, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (id)_primitive_previewItemContentType
{
  return self->_previewItemContentType;
}

- (NSURL)previewItemURLForDisplay
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_UIDICPreviewItem previewItemURLOverride](self, "previewItemURLOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_UIDICPreviewItem previewItemURL](self, "previewItemURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSURL *)v6;
}

- (NSURL)previewItemURL
{
  return self->_URL;
}

- (void)setPreviewItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSURL)previewItemURLOverride
{
  return self->_previewURLOverride;
}

- (void)setPreviewItemURLOverride:(id)a3
{
  objc_storeStrong((id *)&self->_previewURLOverride, a3);
}

- (NSString)previewItemTitle
{
  return self->_name;
}

- (void)setPreviewItemTitle:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSURL)URLToDeleteOnDealloc
{
  return self->_URLToDeleteOnDealloc;
}

- (void)setURLToDeleteOnDealloc:(id)a3
{
  objc_storeStrong((id *)&self->_URLToDeleteOnDealloc, a3);
}

- (void)setPreviewItemURLForDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_previewItemURLForDisplay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewItemURLForDisplay, 0);
  objc_storeStrong((id *)&self->_URLToDeleteOnDealloc, 0);
  objc_storeStrong((id *)&self->_previewItemContentType, 0);
  objc_storeStrong((id *)&self->_URLsToDeleteOnDealloc, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_previewURLOverride, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
