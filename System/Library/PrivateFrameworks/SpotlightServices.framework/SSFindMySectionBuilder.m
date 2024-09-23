@implementation SSFindMySectionBuilder

+ (id)supportedBundleId
{
  return CFSTR("com.apple.people.findMy");
}

- (id)buildTitle
{
  objc_super v4;

  if (-[SSSectionBuilder isContactEntitySearch](self, "isContactEntitySearch"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SSFindMySectionBuilder;
  -[SSSectionBuilder buildTitle](&v4, sel_buildTitle);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)buildCollectionStyle
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setDrawPlattersIfNecessary:", 1);
  objc_msgSend(v2, "setInitiallyVisibleCardSectionCount:", 1);
  return v2;
}

- (id)buildCardSectionWithResult:(id)a3 resultBuilder:(id)a4
{
  return (id)objc_msgSend(a4, "buildHorizontallyScrollingCardSection", a3);
}

@end
