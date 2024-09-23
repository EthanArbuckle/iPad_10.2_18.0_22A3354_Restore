@implementation NSNumber

- (id)bkdsml_nonZeroString
{
  void *v3;

  if (-[NSNumber intValue](self, "intValue"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumber stringValue](self, "stringValue"));
  else
    v3 = 0;
  return v3;
}

@end
