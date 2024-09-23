@implementation SSLinksSectionBuilder

+ (id)supportedBundleId
{
  return CFSTR("com.apple.searchd.syndicatedLinks");
}

- (BOOL)useCompactRowOnMac
{
  int v3;

  v3 = isMacOS();
  if (v3)
    LOBYTE(v3) = !-[SSSectionBuilder hasEntities](self, "hasEntities");
  return v3;
}

- (BOOL)useHorizontallyScrollingCardSectionUI
{
  objc_super v4;

  if (SSSnippetModernizationEnabled())
    return !-[SSLinksSectionBuilder useCompactRowOnMac](self, "useCompactRowOnMac");
  v4.receiver = self;
  v4.super_class = (Class)SSLinksSectionBuilder;
  return -[SSSectionBuilder useHorizontallyScrollingCardSectionUI](&v4, sel_useHorizontallyScrollingCardSectionUI);
}

- (id)buildCollectionStyle
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (-[SSLinksSectionBuilder useCompactRowOnMac](self, "useCompactRowOnMac")
    && (SSSnippetModernizationEnabled() & 1) == 0)
  {
    v3 = (void *)objc_opt_new();
  }
  else if (-[SSLinksSectionBuilder useHorizontallyScrollingCardSectionUI](self, "useHorizontallyScrollingCardSectionUI")|| SSSnippetModernizationEnabled())
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setNumberOfRows:", 1);
  }
  else
  {
    v3 = (void *)objc_opt_new();
    -[SSSectionBuilder section](self, "section");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "resultsCount") == 1)
      v5 = 1;
    else
      v5 = 2;
    objc_msgSend(v3, "setNumberOfColumns:", v5);

    objc_msgSend(v3, "setInitiallyVisibleCardSectionCount:", objc_msgSend(v3, "numberOfColumns"));
  }
  return v3;
}

- (id)buildCardSectionWithResult:(id)a3 resultBuilder:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  if (-[SSLinksSectionBuilder useCompactRowOnMac](self, "useCompactRowOnMac")
    && (SSSnippetModernizationEnabled() & 1) == 0)
  {
    objc_msgSend(v5, "buildCompactCardSection");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "buildHorizontallyScrollingCardSection");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (int64_t)maxCardSections
{
  SSLinksSectionBuilder **v3;
  SSLinksSectionBuilder *v5;
  SSLinksSectionBuilder *v6;

  if (SSSnippetModernizationEnabled())
  {
    v6 = self;
    v3 = &v6;
  }
  else
  {
    if (isMacOS() && !-[SSLinksSectionBuilder useCompactRowOnMac](self, "useCompactRowOnMac"))
      return 2;
    v5 = self;
    v3 = &v5;
  }
  v3[1] = (SSLinksSectionBuilder *)SSLinksSectionBuilder;
  return (int64_t)objc_msgSendSuper2((objc_super *)v3, sel_maxCardSections, v5);
}

@end
