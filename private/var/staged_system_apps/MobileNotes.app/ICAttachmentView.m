@implementation ICAttachmentView

- (void)app_updateViewAnnotation
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICAttachmentView attachment](self, "attachment"));
  -[ICAttachmentView ic_annotateWithAttachment:](self, "ic_annotateWithAttachment:", v3);

}

@end
