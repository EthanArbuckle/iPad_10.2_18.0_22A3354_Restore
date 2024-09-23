@implementation NSData(Base64)

+ (id)dataWithBase64:()Base64
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBase64EncodedString:options:", v4, 0);

  return v5;
}

@end
