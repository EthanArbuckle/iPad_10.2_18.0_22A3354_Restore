@implementation NSString(SFUCryptoUtilsAdditions)

- (id)tsu_sha256HexHashString
{
  void *v1;
  unsigned __int8 *v2;
  size_t v3;
  char *v4;
  char *v5;
  int v6;
  void *v7;
  _BYTE v9[32];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  +[OISFUCryptoUtils sha256HashFromString:](OISFUCryptoUtils, "sha256HashFromString:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v9;
  objc_msgSend(v1, "getBytes:length:", v9, 32);
  v3 = 65;
  v4 = (char *)malloc_type_malloc(0x41uLL, 0x827E3FF4uLL);
  v5 = v4;
  do
  {
    v6 = *v2++;
    snprintf(v5, v3, "%02x", v6);
    v5 += 2;
    v3 -= 2;
  }
  while (v3 != 1);
  v4[64] = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  free(v4);

  return v7;
}

@end
