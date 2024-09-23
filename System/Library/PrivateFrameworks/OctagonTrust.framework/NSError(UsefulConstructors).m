@implementation NSError(UsefulConstructors)

+ (uint64_t)errorWithDomain:()UsefulConstructors code:description:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:underlying:", a3, a4, a5, 0);
}

+ (id)errorWithDomain:()UsefulConstructors code:description:underlying:
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v9 = (objc_class *)MEMORY[0x1E0C99E08];
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc_init(v9);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2D50]);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v12, a4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
