@implementation NSObject

+ (void)replaceClassSelector:(SEL)a3 withSelector:(SEL)a4
{
  BKSwizzleClassMethods((objc_class *)a1, a3, a4);
}

+ (void)replaceInstanceSelector:(SEL)a3 withSelector:(SEL)a4
{
  BKSwizzleInstanceMethods((objc_class *)a1, a3, a4);
}

- (id)_axAssociatedObjectForKey:(id)a3
{
  id v4;
  id AssociatedObject;
  void *v6;

  v4 = a3;
  AssociatedObject = objc_getAssociatedObject(self, objc_msgSend(v4, "hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);

  return v6;
}

- (void)_axSetAssociatedObject:(id)a3 forKey:(id)a4
{
  id v6;
  id value;

  v6 = a4;
  value = a3;
  objc_setAssociatedObject(self, objc_msgSend(v6, "hash"), value, (char *)&dword_0 + 1);

}

@end
