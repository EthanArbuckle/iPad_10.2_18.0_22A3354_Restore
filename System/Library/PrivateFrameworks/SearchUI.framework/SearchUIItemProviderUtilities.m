@implementation SearchUIItemProviderUtilities

+ (id)itemProviderForItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)sub_1DAE04190(a3);

  return v5;
}

+ (void)copy:(id)a3
{
  id v4;

  v4 = a3;
  sub_1DAE0428C(a3);

}

- (SearchUIItemProviderUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIItemProviderUtilities;
  return -[SearchUIItemProviderUtilities init](&v3, sel_init);
}

@end
