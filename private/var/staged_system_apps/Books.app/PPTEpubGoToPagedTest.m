@implementation PPTEpubGoToPagedTest

- (PPTEpubGoToPagedTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  PPTEpubGoToPagedTest *v6;
  PPTEpubGoToPagedTest *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PPTEpubGoToPagedTest;
  v6 = -[PPTEpubGoToScrolledTest initWithName:options:testDefinition:isMainTest:](&v9, "initWithName:options:testDefinition:isMainTest:", a3, a4, a5, a6);
  v7 = v6;
  if (v6)
    -[PPTEpubGoToScrolledTest setTargetLayout:](v6, "setTargetLayout:", kBETestDriverEpubLayoutPaged);
  return v7;
}

@end
