@implementation NSURL

+ (id)ps_URLWithStlString:(const void *)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString ps_stringWithSTL:](NSString, "ps_stringWithSTL:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));

  return v4;
}

+ (id)ps_URLWithPath:(const void *)a3
{
  void *v4;
  void *v5;
  int v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString ps_stringWithSTL:](NSString, "ps_stringWithSTL:"));
  sub_10006DB18((const char *)a3, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, v7 == 3));

  return v5;
}

@end
