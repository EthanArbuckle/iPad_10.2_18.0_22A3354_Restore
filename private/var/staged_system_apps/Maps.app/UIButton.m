@implementation UIButton

- (BOOL)isTextTruncated
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self, "titleLabel"));
  v3 = objc_msgSend(v2, "isTextTruncated");

  return v3;
}

- (BOOL)isTextTruncatedIgnoringLeading:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self, "titleLabel"));
  LOBYTE(v3) = objc_msgSend(v4, "isTextTruncatedIgnoringLeading:", v3);

  return v3;
}

@end
