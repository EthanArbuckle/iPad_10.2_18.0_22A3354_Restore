@implementation NSError

- (id)fm_commaSeparatedString
{
  NSInteger v3;
  void *v4;
  void *v5;

  v3 = -[NSError code](self, "code");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](self, "localizedDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld,%@"), v3, v4));

  return v5;
}

@end
