@implementation NSData

+ (NSData)dataWithHexString:(id)a3
{
  id v3;
  _BYTE *v4;
  _BYTE *v5;
  unint64_t v6;
  _BYTE *v7;
  void *v8;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  char *v15;
  char __str[2];
  char v17;

  v3 = a3;
  v17 = 0;
  if ((objc_msgSend(v3, "length") & 1) != 0)
  {
    v12 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000B9FFC((uint64_t)v3, v11, v13);
    goto LABEL_11;
  }
  v4 = malloc_type_malloc((unint64_t)objc_msgSend(v3, "length") >> 1, 0x9F7E2380uLL);
  if (!v4)
  {
    v14 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000B9EF4(v3, v11);
LABEL_11:

    v8 = 0;
    goto LABEL_8;
  }
  v5 = v4;
  if (objc_msgSend(v3, "length"))
  {
    v6 = 0;
    v7 = v5;
    while (1)
    {
      __str[0] = objc_msgSend(v3, "characterAtIndex:", v6);
      __str[1] = objc_msgSend(v3, "characterAtIndex:", v6 + 1);
      v15 = 0;
      *v7 = strtol(__str, &v15, 16);
      if (v15 != &v17)
        break;
      ++v7;
      v6 += 2;
      if (v6 >= (unint64_t)objc_msgSend(v3, "length"))
        goto LABEL_7;
    }
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000B9F78((uint64_t)v3, v6, v11);
    goto LABEL_11;
  }
LABEL_7:
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v5, (unint64_t)objc_msgSend(v3, "length") >> 1, 1));
LABEL_8:

  return (NSData *)v8;
}

- (id)hexStringRepresentation
{
  NSUInteger v3;
  void *v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned int v7;

  v3 = -[NSData length](self, "length");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 2 * v3));
  v5 = -[NSData bytes](objc_retainAutorelease(self), "bytes");
  if (v3)
  {
    v6 = v5;
    do
    {
      v7 = *v6++;
      objc_msgSend(v4, "appendFormat:", CFSTR("%02lx"), v7);
      --v3;
    }
    while (v3);
  }
  return v4;
}

@end
