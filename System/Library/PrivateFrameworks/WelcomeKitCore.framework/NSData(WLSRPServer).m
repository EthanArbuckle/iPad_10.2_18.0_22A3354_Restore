@implementation NSData(WLSRPServer)

+ (id)wl_hmacSHA256DataForData:()WLSRPServer key:
{
  id v5;
  id v6;
  const void *v7;
  size_t v8;
  id v9;
  const void *v10;
  size_t v11;
  _BYTE macOut[32];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(a4);
  v6 = a3;
  v7 = (const void *)objc_msgSend(v5, "bytes");
  v8 = objc_msgSend(v5, "length");

  v9 = objc_retainAutorelease(v6);
  v10 = (const void *)objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");

  CCHmac(2u, v7, v8, v10, v11, macOut);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", macOut, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
