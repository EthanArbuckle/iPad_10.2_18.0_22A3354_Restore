@implementation NSString

- (id)_lowercaseFirstLetterOfString:(BOOL)a3
{
  _BOOL4 v3;
  NSUInteger v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  v5 = -[NSString length](self, "length");
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self, "substringToIndex:", 1));
    v8 = v7;
    if (v3)
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lowercaseString"));
    else
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uppercaseString"));
    v10 = (NSString *)v9;

    if (v6 >= 2)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](self, "substringFromIndex:", 1));
      v12 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](v10, "stringByAppendingString:", v11));

      v10 = (NSString *)v12;
    }
  }
  else
  {
    v10 = self;
  }
  return v10;
}

- (id)stringByLowercasingFirstLetter
{
  return -[NSString _lowercaseFirstLetterOfString:](self, "_lowercaseFirstLetterOfString:", 1);
}

- (id)stringByUppercasingFirstLetter
{
  return -[NSString _lowercaseFirstLetterOfString:](self, "_lowercaseFirstLetterOfString:", 0);
}

@end
