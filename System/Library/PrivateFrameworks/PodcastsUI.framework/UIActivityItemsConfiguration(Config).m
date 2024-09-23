@implementation UIActivityItemsConfiguration(Config)

+ (id)mt_configurationWithActivityItems:()Config
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3440]), "_initWithActivityItems:applicationActivities:", v4, 0);
  else
    v5 = 0;

  return v5;
}

@end
