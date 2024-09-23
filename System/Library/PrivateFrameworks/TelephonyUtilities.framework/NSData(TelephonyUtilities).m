@implementation NSData(TelephonyUtilities)

- (id)tu_URLSafeBase64EncodedString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "tu_stringByStrippingBase64Padding");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (uint64_t)tu_dataForAuditToken:()TelephonyUtilities
{
  return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, 32);
}

+ (id)tu_dataForURLSafeBase64EncodedString:()TelephonyUtilities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = (void *)objc_msgSend(a3, "copy");
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("+"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "tu_stringByAddingBase64Padding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 1);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)tu_UUID
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "length") != 16)
    return 0;
  v3[0] = 0;
  v3[1] = 0;
  objc_msgSend(a1, "getBytes:length:", v3, 16);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v3);
}

+ (id)tu_dataForUUID:()TelephonyUtilities
{
  void *v3;
  _QWORD v5[3];

  v3 = a3;
  v5[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5[0] = 0;
    v5[1] = 0;
    objc_msgSend(a3, "getUUIDBytes:", v5);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, 16);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
