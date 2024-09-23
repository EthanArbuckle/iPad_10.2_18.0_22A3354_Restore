@implementation WebPDFNSNumberFormatter

+ (id)copyNumberFormater
{
  if (sWebPDFNSNumberFormatter)
    return (id)sWebPDFNSNumberFormatter;
  sWebPDFNSNumberFormatter = objc_alloc_init(WebPDFNSNumberFormatter);
  objc_msgSend((id)sWebPDFNSNumberFormatter, "setFormatterBehavior:", 1040);
  objc_msgSend((id)sWebPDFNSNumberFormatter, "setNumberStyle:", 0);
  return (id)sWebPDFNSNumberFormatter;
}

- (void)dealloc
{
  objc_super v2;

  if ((WebPDFNSNumberFormatter *)sWebPDFNSNumberFormatter == self)
    sWebPDFNSNumberFormatter = 0;
  v2.receiver = self;
  v2.super_class = (Class)WebPDFNSNumberFormatter;
  -[WebPDFNSNumberFormatter dealloc](&v2, sel_dealloc);
}

@end
