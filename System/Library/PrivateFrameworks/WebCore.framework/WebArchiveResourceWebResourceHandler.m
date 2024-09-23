@implementation WebArchiveResourceWebResourceHandler

- (id)resourceForData:(id)a3 URL:(id)a4 MIMEType:(id)a5 textEncodingName:(id)a6 frameName:(id)a7
{
  return (id)(id)CFMakeCollectable(-[WebArchiveResourceFromNSAttributedString initWithData:URL:MIMEType:textEncodingName:frameName:]([WebArchiveResourceFromNSAttributedString alloc], "initWithData:URL:MIMEType:textEncodingName:frameName:", a3, a4, a5, a6, a7));
}

@end
