@implementation NSObject(HKSPProperty)

- (id)hksp_valueForProperty:()HKSPProperty
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "propertyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)hksp_setValue:()HKSPProperty forProperty:
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a4, "propertyName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forKey:", v6, v7);

}

@end
