@implementation NSString

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = objc_alloc((Class)NSString);
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  v10 = objc_msgSend(v6, "initWithBytes:length:encoding:", v8, v9, 4);
  v11 = v10;
  if (a4 && !v10)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid parameter."), CFSTR("TLV data is not UTF8 encoded"), 0, 0));
  return v11;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:allowLossyConversion:](self, "dataUsingEncoding:allowLossyConversion:", 4, 0));
  v5 = (void *)v4;
  if (a3 && !v4)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid parameter."), CFSTR("TLV data cannot be UTF8 encoded"), 0, 0));
  return v5;
}

@end
