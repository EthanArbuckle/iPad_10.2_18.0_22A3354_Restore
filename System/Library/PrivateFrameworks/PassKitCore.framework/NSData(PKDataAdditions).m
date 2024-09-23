@implementation NSData(PKDataAdditions)

- (id)SHA256Hash
{
  id v1;
  unsigned __int8 md[32];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_SHA256((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);
}

- (id)fileSafeBase64Encoding
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

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

+ (id)dataWithHexEncodedString:()PKDataAdditions
{
  id v3;
  _BYTE *v4;
  unint64_t v5;
  _BYTE *v6;
  void *v7;
  char *v9;
  char __str[3];

  v3 = a3;
  __str[2] = 0;
  v4 = malloc_type_malloc((unint64_t)objc_msgSend(v3, "length") >> 1, 0xD32AFB95uLL);
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    v6 = v4;
    do
    {
      __str[0] = objc_msgSend(v3, "characterAtIndex:", v5);
      __str[1] = objc_msgSend(v3, "characterAtIndex:", v5 + 1);
      v9 = 0;
      *v6++ = strtol(__str, &v9, 16);
      v5 += 2;
    }
    while (v5 < objc_msgSend(v3, "length"));
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v4, (unint64_t)objc_msgSend(v3, "length") >> 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)dataWithCGImage:()PKDataAdditions
{
  __CFData *Mutable;
  CGImageDestination *v5;
  void *v6;

  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v5 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier"), 1uLL, 0);
  CGImageDestinationAddImage(v5, a3, 0);
  v6 = 0;
  if (CGImageDestinationFinalize(v5))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", Mutable);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  CFRelease(Mutable);
  CFRelease(v5);
  return v6;
}

- (BOOL)hasPDFMIMEType
{
  char v2;

  v2 = 0;
  objc_msgSend(a1, "getBytes:length:", &v2, 1);
  return v2 == 37;
}

- (id)URLBase64EncodedString
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
