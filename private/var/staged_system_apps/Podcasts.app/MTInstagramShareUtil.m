@implementation MTInstagramShareUtil

+ (id)createSocialPostUIImageWithShareModel:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)sub_100317E10(v3);

  return v4;
}

- (MTInstagramShareUtil)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[MTInstagramShareUtil init](&v3, "init");
}

@end
