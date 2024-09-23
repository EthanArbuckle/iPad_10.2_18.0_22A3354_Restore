@implementation BKARQuicklookViewController

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKARQuicklookViewController ARModelDataURL](self, "ARModelDataURL", a3));

  return v3 != 0;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKARQuicklookViewController ARModelDataURL](self, "ARModelDataURL", a3, a4));
  v5 = BUProtocolCast(&OBJC_PROTOCOL___QLPreviewItem, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (NSURL)ARModelDataURL
{
  return self->_ARModelDataURL;
}

- (void)setARModelDataURL:(id)a3
{
  objc_storeStrong((id *)&self->_ARModelDataURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ARModelDataURL, 0);
}

@end
