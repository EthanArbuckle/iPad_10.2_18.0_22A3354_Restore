@implementation SXPlaceholderArticleThumbnailComponentViewFactory

- (id)componentViewForComponent:(id)a3
{
  SXPlaceholderArticleThumbnailComponentView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SXPlaceholderArticleThumbnailComponentView *v10;

  v4 = [SXPlaceholderArticleThumbnailComponentView alloc];
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
  v10 = -[SXPlaceholderArticleThumbnailComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](v4, "initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:", v5, v6, v8, v9);

  return v10;
}

- (id)type
{
  return CFSTR("article_thumbnail");
}

- (int)role
{
  return 0;
}

@end
