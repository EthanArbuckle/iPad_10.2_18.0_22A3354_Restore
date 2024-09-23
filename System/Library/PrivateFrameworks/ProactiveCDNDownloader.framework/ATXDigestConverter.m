@implementation ATXDigestConverter

+ (id)binToHex:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  __CFString *v8;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 2 * objc_msgSend(v3, "length"));
    v5 = objc_retainAutorelease(v3);
    v6 = objc_msgSend(v5, "bytes");
    if (objc_msgSend(v5, "length"))
    {
      v7 = 0;
      do
        objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v6 + v7++));
      while (v7 < objc_msgSend(v5, "length"));
    }
    v8 = (__CFString *)objc_msgSend(v4, "copy");

  }
  else
  {
    v8 = &stru_24D2244D8;
  }

  return v8;
}

@end
