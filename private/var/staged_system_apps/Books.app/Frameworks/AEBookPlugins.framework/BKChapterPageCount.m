@implementation BKChapterPageCount

+ (id)newEmptyChapterPageNumber:(id)a3
{
  id v3;
  double v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  *(_QWORD *)&v4 = objc_opt_class(BKChapterPageCount).n128_u64[0];
  v6 = objc_msgSend(v3, "newByClass:", v5, v4);

  return v6;
}

- (NSString)name
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKChapterPageCount primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("name")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3));

  return (NSString *)v4;
}

@end
