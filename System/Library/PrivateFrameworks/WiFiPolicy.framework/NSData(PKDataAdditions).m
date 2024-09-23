@implementation NSData(PKDataAdditions)

- (id)SHA1Hash
{
  id v1;
  unsigned __int8 md[20];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_SHA1((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 20);
}

- (id)hexEncoding
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned int v6;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v3 = objc_msgSend(a1, "length");
  v4 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (v3)
  {
    v5 = (unsigned __int8 *)v4;
    do
    {
      v6 = *v5++;
      objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), v6);
      --v3;
    }
    while (v3);
  }
  return v2;
}

@end
