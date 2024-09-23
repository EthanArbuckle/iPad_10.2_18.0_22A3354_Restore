@implementation WBSLPLinkMetadataRequest

- (WBSLPLinkMetadataRequest)initWithURL:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WBSLPLinkMetadataRequest;
  return -[WBSSiteMetadataRequest initWithURL:extraInfo:](&v4, sel_initWithURL_extraInfo_, a3, 0);
}

@end
