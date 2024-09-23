@implementation NSBlockOperation

- (id)ic_shortLoggingOperationName
{
  __CFString *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = ICCKOperationShortClassNameNSBlockOperation;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSBlockOperation name](self, "name"));
  v4 = blockOperationShortNameFromOperationName(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v2, v5));

  return v6;
}

@end
