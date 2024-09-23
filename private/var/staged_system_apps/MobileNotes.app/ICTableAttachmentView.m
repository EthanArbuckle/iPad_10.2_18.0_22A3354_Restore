@implementation ICTableAttachmentView

- (void)app_updateViewAnnotation
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICTableAttachmentView attachment](self, "attachment"));
  -[ICTableAttachmentView ic_annotateWithTable:](self, "ic_annotateWithTable:", v3);

}

@end
