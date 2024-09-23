@implementation VUIARQLPreviewController

- (VUIARQLPreviewController)initWithQuickLookPreviewItem:(id)a3
{
  id v4;
  VUIARQLPreviewController *v5;
  VUIARQLPreviewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIARQLPreviewController;
  v5 = -[VUIARQLPreviewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[VUIARQLPreviewController _commonInit](v5, "_commonInit");
    -[VUIARQLPreviewController setQuickLookPreviewItem:](v6, "setQuickLookPreviewItem:", v4);
  }

  return v6;
}

- (VUIARQLPreviewController)initWithQuickLookWebKitItem:(id)a3
{
  id v4;
  VUIARQLPreviewController *v5;
  VUIARQLPreviewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIARQLPreviewController;
  v5 = -[VUIARQLPreviewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[VUIARQLPreviewController _commonInit](v5, "_commonInit");
    -[VUIARQLPreviewController setQuickLookWebKitItem:](v6, "setQuickLookWebKitItem:", v4);
  }

  return v6;
}

- (void)_commonInit
{
  -[QLPreviewController setDataSource:](self, "setDataSource:", self);
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  id v5;
  void *quickLookWebKitItem;
  id v7;
  void *v9;

  v5 = a3;
  quickLookWebKitItem = self->_quickLookWebKitItem;
  if (quickLookWebKitItem || (quickLookWebKitItem = self->_quickLookPreviewItem) != 0)
  {
    v7 = quickLookWebKitItem;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", &stru_1E9FF3598);
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C895E8]), "initWithFileAtURL:", v9);

  }
  return v7;
}

- (ARQuickLookWebKitItem)quickLookWebKitItem
{
  return self->_quickLookWebKitItem;
}

- (void)setQuickLookWebKitItem:(id)a3
{
  objc_storeStrong((id *)&self->_quickLookWebKitItem, a3);
}

- (ARQuickLookPreviewItem)quickLookPreviewItem
{
  return self->_quickLookPreviewItem;
}

- (void)setQuickLookPreviewItem:(id)a3
{
  objc_storeStrong((id *)&self->_quickLookPreviewItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLookPreviewItem, 0);
  objc_storeStrong((id *)&self->_quickLookWebKitItem, 0);
}

@end
