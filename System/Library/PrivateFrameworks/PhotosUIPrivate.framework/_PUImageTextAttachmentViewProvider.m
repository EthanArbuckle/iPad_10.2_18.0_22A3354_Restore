@implementation _PUImageTextAttachmentViewProvider

- (void)loadView
{
  void *v3;
  id v4;

  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTextAttachmentViewProvider setView:](self, "setView:", v3);

}

@end
