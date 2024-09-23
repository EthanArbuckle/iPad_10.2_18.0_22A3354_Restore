@implementation NSCoder(RBSXPCCoderExtras)

- (void)encodeCollection:()RBSXPCCoderExtras forKey:
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "encodeObject:forKey:", v8, v6);
}

- (id)decodeCollectionOfClass:()RBSXPCCoderExtras containingClass:forKey:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a5;
  objc_msgSend(v8, "setWithObjects:", objc_opt_class(), a4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (_NSIsNSArray())
    v12 = (void *)objc_msgSend([a3 alloc], "initWithArray:", v11);

  return v12;
}

- (id)decodeStringForKey:()RBSXPCCoderExtras
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
