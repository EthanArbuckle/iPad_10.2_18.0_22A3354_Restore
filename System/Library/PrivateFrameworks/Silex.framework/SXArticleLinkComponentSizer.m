@implementation SXArticleLinkComponentSizer

- (SXArticleLinkComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SXArticleLinkComponentSizer;
  return -[SXComponentSizer initWithComponent:componentLayout:componentStyle:DOMObjectProvider:layoutOptions:](&v8, sel_initWithComponent_componentLayout_componentStyle_DOMObjectProvider_layoutOptions_, a3, a4, a5, a6, a7);
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  return 100.0;
}

@end
