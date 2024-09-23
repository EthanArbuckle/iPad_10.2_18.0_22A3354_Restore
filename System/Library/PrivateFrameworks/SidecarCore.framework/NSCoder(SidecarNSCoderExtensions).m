@implementation NSCoder(SidecarNSCoderExtensions)

- (id)decodeObjectOfClass:()SidecarNSCoderExtensions
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "decodeObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

@end
