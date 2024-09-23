@implementation NSArray(TRIFunctions)

- (id)tri_intersects:()TRIFunctions
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithArray:", a1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v6, "intersectsSet:", v7));
  return v8;
}

- (id)tri_contains:()TRIFunctions
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithArray:", a1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v7, "isSubsetOfSet:", v6));
  return v8;
}

@end
