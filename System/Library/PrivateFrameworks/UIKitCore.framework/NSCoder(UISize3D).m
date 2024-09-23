@implementation NSCoder(UISize3D)

- (double)decodeUISize3DForKey:()UISize3D
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "UISize3DValue");
  v7 = v6;

  return v7;
}

- (void)encodeUISize3D:()UISize3D forKey:
{
  void *v10;
  id v11;
  id v12;

  v10 = (void *)MEMORY[0x1E0CB3B18];
  v11 = a6;
  objc_msgSend(v10, "valueWithUISize3D:", a2, a3, a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v12, v11);

}

@end
