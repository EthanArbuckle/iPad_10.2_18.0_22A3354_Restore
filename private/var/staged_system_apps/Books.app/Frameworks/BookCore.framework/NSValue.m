@implementation NSValue

+ (NSValue)valueWithUIEdgeInsets:(UIEdgeInsets)insets
{
  UIEdgeInsets v4;

  v4 = insets;
  return (NSValue *)(id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", &v4, "{UIEdgeInsets=dddd}"));
}

- (UIEdgeInsets)uiEdgeInsetsValue
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  __int128 v7;
  UIEdgeInsets result;

  v6 = 0u;
  v7 = 0u;
  -[NSValue getValue:](self, "getValue:", &v6);
  v3 = *((double *)&v6 + 1);
  v2 = *(double *)&v6;
  v5 = *((double *)&v7 + 1);
  v4 = *(double *)&v7;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end
