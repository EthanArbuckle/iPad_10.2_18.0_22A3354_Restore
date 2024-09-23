@implementation NSError(SignpostSerialization)

+ (id)errorWithCode:()SignpostSerialization description:
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a4, *MEMORY[0x1E0CB2D50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("SignpostSupportDomain"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
