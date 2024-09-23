@implementation SBSACollisionRequest

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01768];
  v4 = a3;
  objc_msgSend(v3, "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "isEqual");
  return (char)v3;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

@end
