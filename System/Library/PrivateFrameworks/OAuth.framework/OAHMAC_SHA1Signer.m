@implementation OAHMAC_SHA1Signer

+ (id)signatureForText:(id)a3 withKey:(id)a4
{
  void *v5;
  void *v6;
  _BYTE macOut[20];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(a4, "dataUsingEncoding:", 4);
  v6 = (void *)objc_msgSend(a3, "dataUsingEncoding:", 4);
  CCHmac(0, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), macOut);
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", macOut, 20), "base64EncodedStringWithOptions:", 0);
}

@end
