@implementation PUIPosterSceneExtension

+ (id)hostComponents
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "addObject:", objc_opt_class());
  return v2;
}

@end
