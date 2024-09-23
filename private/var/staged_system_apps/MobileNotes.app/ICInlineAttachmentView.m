@implementation ICInlineAttachmentView

- (void)openURL:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_opt_class(ICWindow);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICInlineAttachmentView window](self, "window"));
  v6 = ICCheckedDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_viewControllerManager"));
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "openURL:", v10);

}

@end
