@implementation NSString(SSLoggable)

- (id)shorterLoggableString
{
  id v2;

  if ((unint64_t)objc_msgSend(a1, "length") < 6)
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", 5);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
