@implementation THWKeynoteShowLayout

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteShowLayout;
  -[THWKeynoteShowLayout dealloc](&v3, "dealloc");
}

- (KPFDocumentProtocol)kpfDocument
{
  KPFDocumentProtocol *result;

  result = self->_kpfDocument;
  if (!result)
  {
    result = +[KPFDocumentFactory createDocumentWithKPFBundle:drmContext:](KPFDocumentFactory, "createDocumentWithKPFBundle:drmContext:", +[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", objc_msgSend(-[THWKeynoteShowLayout info](self, "info"), "sourceURL")), objc_msgSend(-[THWKeynoteShowLayout info](self, "info"), "drmContext"));
    self->_kpfDocument = result;
  }
  return result;
}

- (CGSize)showSize
{
  double v2;
  double v3;
  CGSize result;

  -[KPFDocumentProtocol showSize](-[THWKeynoteShowLayout kpfDocument](self, "kpfDocument"), "showSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setKpfDocument:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

@end
