@implementation TSWPNSAttributedStringAttachmentConversionDelegate

- (TSWPNSAttributedStringAttachmentConversionDelegate)initWithConvertHyperlinks:(BOOL)a3 convertGraphicalAttachments:(BOOL)a4
{
  TSWPNSAttributedStringAttachmentConversionDelegate *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPNSAttributedStringAttachmentConversionDelegate;
  result = -[TSWPNSAttributedStringAttachmentConversionDelegate init](&v7, sel_init);
  if (result)
  {
    result->mConvertHyperlinks = a3;
    result->mConvertAttachments = a4;
  }
  return result;
}

- (TSWPNSAttributedStringAttachmentConversionDelegate)init
{
  return -[TSWPNSAttributedStringAttachmentConversionDelegate initWithConvertHyperlinks:convertGraphicalAttachments:](self, "initWithConvertHyperlinks:convertGraphicalAttachments:", 1, 1);
}

- (id)attachmentStringForDrawableAttachment:(id)a3
{
  return 0;
}

- (id)urlForHyperlinkField:(id)a3
{
  void *v4;

  if (!self->mConvertHyperlinks)
    return 0;
  v4 = (void *)objc_msgSend(a3, "canonicalRepresentationURL");
  if (objc_msgSend(a3, "scheme") <= 2)
    return (id)objc_msgSend(a3, "url");
  return v4;
}

@end
