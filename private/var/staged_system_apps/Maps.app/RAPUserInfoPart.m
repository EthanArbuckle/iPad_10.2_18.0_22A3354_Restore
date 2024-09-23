@implementation RAPUserInfoPart

- (RAPUserInfoPart)init
{
  RAPUserInfoPart *v2;
  RAPUserInfoSection *v3;
  void *v4;
  objc_super v6;
  RAPUserInfoSection *v7;

  v6.receiver = self;
  v6.super_class = (Class)RAPUserInfoPart;
  v2 = -[RAPTablePart init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(RAPUserInfoSection);
    v7 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    -[RAPTablePart setSections:](v2, "setSections:", v4);

  }
  return v2;
}

@end
