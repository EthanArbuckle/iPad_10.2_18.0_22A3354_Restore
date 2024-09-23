@implementation NSCoder(UIKitCAPoint3DAdditions)

- (double)ui_decodeCAPoint3DForKey:()UIKitCAPoint3DAdditions
{
  id v4;
  void *v5;
  double v6;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = _CAPoint3DFromString(v5);
  return v6;
}

- (void)ui_encodeCAPoint3D:()UIKitCAPoint3DAdditions forKey:
{
  id v10;
  id v11;

  v10 = a6;
  _NSStringFromCAPoint3D(a2, a3, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v11, v10);

}

@end
