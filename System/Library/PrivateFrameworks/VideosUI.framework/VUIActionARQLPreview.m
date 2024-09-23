@implementation VUIActionARQLPreview

- (VUIActionARQLPreview)initWithContextData:(id)a3
{
  id v4;
  VUIActionARQLPreview *v5;
  uint64_t v6;
  NSString *previewURLString;
  uint64_t v8;
  NSString *shareURLString;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIActionARQLPreview;
  v5 = -[VUIActionARQLPreview init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("previewURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    previewURLString = v5->_previewURLString;
    v5->_previewURLString = (NSString *)v6;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("shareURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    shareURLString = v5->_shareURLString;
    v5->_shareURLString = (NSString *)v8;

  }
  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self->_previewURLString, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self->_shareURLString);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIARQLPreviewManager sharedInstance](VUIARQLPreviewManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewWithURL:shareURL:", v7, v5);

  }
}

- (NSString)previewURLString
{
  return self->_previewURLString;
}

- (void)setPreviewURLString:(id)a3
{
  objc_storeStrong((id *)&self->_previewURLString, a3);
}

- (NSString)shareURLString
{
  return self->_shareURLString;
}

- (void)setShareURLString:(id)a3
{
  objc_storeStrong((id *)&self->_shareURLString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURLString, 0);
  objc_storeStrong((id *)&self->_previewURLString, 0);
}

@end
