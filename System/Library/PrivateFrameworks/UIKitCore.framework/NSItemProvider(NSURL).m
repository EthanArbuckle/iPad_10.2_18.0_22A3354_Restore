@implementation NSItemProvider(NSURL)

+ (id)itemProviderWithURL:()NSURL title:
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(v5, "_setTitle:", a4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v5);

  return v6;
}

@end
