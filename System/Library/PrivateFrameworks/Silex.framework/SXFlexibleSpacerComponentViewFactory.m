@implementation SXFlexibleSpacerComponentViewFactory

- (id)componentViewForComponent:(id)a3
{
  SXFlexibleSpacerComponentView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SXFlexibleSpacerComponentView *v10;

  v4 = [SXFlexibleSpacerComponentView alloc];
  -[SXComponentViewFactory DOMObjectProvider](self, "DOMObjectProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory viewport](self, "viewport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory presentationDelegateProvider](self, "presentationDelegateProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentViewFactory componentStyleRendererFactory](self, "componentStyleRendererFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SXComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](v4, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:", v5, v6, v8, v9);

  return v10;
}

- (id)type
{
  return CFSTR("flexible_spacer");
}

- (int)role
{
  return 0;
}

@end
