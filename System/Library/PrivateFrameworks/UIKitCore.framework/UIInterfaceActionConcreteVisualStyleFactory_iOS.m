@implementation UIInterfaceActionConcreteVisualStyleFactory_iOS

+ (id)styleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  id v5;
  Class *v6;
  __objc2_class **v7;
  id v8;

  v5 = a3;
  v6 = (Class *)off_1E167AA50;
  v7 = off_1E167AA58;
  if (a4 != 1)
    v7 = off_1E167AA48;
  if (a4 != 2)
    v6 = (Class *)v7;
  v8 = objc_alloc_init(*v6);

  return v8;
}

@end
