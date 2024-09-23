@implementation NSData(Utils)

- (id)byteString
{
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(a1);
  v4 = objc_msgSend(v3, "bytes");
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    do
      objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v4 + v5++));
    while (v5 < objc_msgSend(v3, "length"));
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
