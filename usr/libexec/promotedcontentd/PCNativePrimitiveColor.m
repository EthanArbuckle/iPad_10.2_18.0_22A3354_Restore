@implementation PCNativePrimitiveColor

- (id)initWithString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  PCNativePrimitiveColor *v11;
  int v13;
  void *v14;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "length") == (id)6 || objc_msgSend(v5, "length") == (id)8))
  {
    v6 = objc_retainAutorelease(v5);
    v7 = strtol((const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4), 0, 16);
    if (objc_msgSend(v6, "length") == (id)6)
      v8 = (v7 << 8) | 0xFF;
    else
      v8 = v7;
  }
  else
  {
    v9 = APLogForCategory(21);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Invalid color string: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    v8 = 0;
  }
  v11 = -[PCNativePrimitiveColor initWithRGBA:](self, "initWithRGBA:", v8);

  return v11;
}

@end
