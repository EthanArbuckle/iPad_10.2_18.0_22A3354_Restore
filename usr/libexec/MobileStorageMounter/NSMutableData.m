@implementation NSMutableData

+ (NSMutableData)dataWithHexString:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableData), "initDataWithHexString:", v3);

  return (NSMutableData *)v4;
}

- (id)initDataWithHexString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableData *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  NSMutableData *v14;
  char __str[2];
  __int16 v17;

  v4 = a3;
  v17 = 0;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet alphanumericCharacterSet](NSCharacterSet, "alphanumericCharacterSet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5));

    if (objc_msgSend(v6, "isEqualToString:", &stru_10002F6C8))
    {
      if ((objc_msgSend(v4, "length") & 1) != 0)
        v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0%@"), v4);
      else
        v7 = objc_msgSend(v4, "copy");
      v9 = v7;
      self = -[NSMutableData init](self, "init");
      if (self)
      {
        if ((int)objc_msgSend(v9, "length") >= 2)
        {
          v10 = 0;
          v11 = 1;
          do
          {
            __str[0] = objc_msgSend(v9, "characterAtIndex:", v11 - 1);
            __str[1] = objc_msgSend(v9, "characterAtIndex:", v11);
            HIBYTE(v17) = strtol(__str, 0, 16);
            -[NSMutableData appendBytes:length:](self, "appendBytes:length:", (char *)&v17 + 1, 1);
            ++v10;
            v12 = objc_msgSend(v9, "length");
            if (v12 >= 0)
              v13 = v12;
            else
              v13 = v12 + 1;
            v11 += 2;
          }
          while (v10 < v13 >> 1);
        }
        v8 = self;
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v6 = 0;
  }
  v14 = v8;

  return v14;
}

@end
