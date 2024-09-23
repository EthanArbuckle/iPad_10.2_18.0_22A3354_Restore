@implementation NSData(Base64)

+ (id)dataFromBase64String:()Base64
{
  id v3;
  char *v4;
  void *v5;
  uint64_t v7;

  objc_msgSend(a3, "dataUsingEncoding:", 1);
  v7 = 0;
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = NewBase64Decode((char *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), &v7);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  free(v4);

  return v5;
}

- (id)base64EncodedString
{
  id v1;
  _BYTE *v2;
  id v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  v1 = objc_retainAutorelease(a1);
  v2 = NewBase64Encode(objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), 0, &v6);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)objc_msgSend(v3, "initWithBytes:length:encoding:", v2, v6, 1);
  free(v2);
  return v4;
}

@end
