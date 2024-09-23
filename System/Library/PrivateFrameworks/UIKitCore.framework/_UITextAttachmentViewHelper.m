@implementation _UITextAttachmentViewHelper

+ (id)helperForAttachment:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setAttachment:", v4);

  return v5;
}

- (void)removeView
{
  void *v2;
  id v3;

  -[_UITextAttachmentViewHelper attachment](self, "attachment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

}

- (NSTextAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
