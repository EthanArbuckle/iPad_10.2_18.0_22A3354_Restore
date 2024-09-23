@implementation NSBundle(UINSBundleAdditions)

- (id)loadNibNamed:()UINSBundleAdditions owner:options:
{
  id v8;
  id v9;
  id v10;
  UINib *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[UINib initWithNibName:directory:bundle:]([UINib alloc], "initWithNibName:directory:bundle:", v10, 0, a1);

  -[UINib instantiateWithOwner:options:](v11, "instantiateWithOwner:options:", v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
