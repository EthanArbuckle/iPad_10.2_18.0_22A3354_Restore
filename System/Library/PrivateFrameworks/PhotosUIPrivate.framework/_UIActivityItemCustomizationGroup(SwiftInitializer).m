@implementation _UIActivityItemCustomizationGroup(SwiftInitializer)

+ (id)createWithGroupName:()SwiftInitializer identifier:customizations:
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([a1 alloc], "_initGroupWithName:identifier:customizations:", v10, v9, v8);

  return v11;
}

@end
