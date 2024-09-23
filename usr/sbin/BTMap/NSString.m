@implementation NSString

- (id)substringWithValidUnicode
{
  __CFString *v3;

  if (-[NSString length](self, "length"))
  {
    if ((-[NSString characterAtIndex:](self, "characterAtIndex:", (char *)-[NSString length](self, "length") - 1) & 0xFC00) == 0xD800)
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self, "substringToIndex:", (char *)-[NSString length](self, "length") - 1));
    else
      v3 = self;
  }
  else
  {
    v3 = &stru_1000086E8;
  }
  return v3;
}

- (id)UTF8DataWithMaxLength:(unint64_t)a3 ellipsis:(BOOL)a4 isTruncated:(BOOL *)a5
{
  _BOOL4 v6;
  unint64_t v9;
  unint64_t v10;
  unint64_t v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a4;
  v9 = -[NSString lengthOfBytesUsingEncoding:](self, "lengthOfBytesUsingEncoding:", 4);
  if (v9 >= a3)
    v10 = a3;
  else
    v10 = v9;
  if (v9 <= a3 || !v6)
  {
    a3 = v10;
    if (v10)
    {
LABEL_15:
      v13 = 0;
      v12 = a3;
      goto LABEL_16;
    }
LABEL_22:
    v17 = objc_alloc_init((Class)NSData);
    return v17;
  }
  v12 = a3 - 3;
  if (a3 < 3)
  {
    v14 = qword_10000D088;
    if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_ERROR))
    {
      sub_1000050C8(a3, v14);
      if (a3)
        goto LABEL_15;
    }
    else if (a3)
    {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
  v13 = 1;
LABEL_16:
  __chkstk_darwin();
  bzero((char *)&v19 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
  v20 = 0;
  v21 = 0;
  v19 = 0;
  -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)&v19 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0), v12, &v19, 4, 1, 0, -[NSString length](self, "length"), &v20);
  if (v13)
  {
    v15 = v19;
    v16 = (char *)&v19 + v19 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(_WORD *)v16 = -32542;
    v16[2] = -90;
    v19 = v15 + 3;
  }
  if (a5)
    *a5 = v21 != 0;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)&v19 - ((a3 + 15) & 0xFFFFFFFFFFFFFFF0), v19, v19));
  return v17;
}

- (id)UTF8StringWithMaxLength:(unint64_t)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSString UTF8DataWithMaxLength:ellipsis:isTruncated:](self, "UTF8DataWithMaxLength:ellipsis:isTruncated:", a3, 0, 0));
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc((Class)NSString);
    v5 = objc_retainAutorelease(v3);
    v6 = objc_msgSend(v4, "initWithBytes:length:encoding:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), 4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
