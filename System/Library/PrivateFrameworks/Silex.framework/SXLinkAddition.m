@implementation SXLinkAddition

- (id)action
{
  SXLinkAction *v3;
  void *v4;
  void *v5;
  SXLinkAction *v6;

  v3 = [SXLinkAction alloc];
  -[SXLinkAddition URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLinkAddition analytics](self, "analytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SXLinkAction initWithURL:analytics:](v3, "initWithURL:analytics:", v4, v5);

  return v6;
}

@end
