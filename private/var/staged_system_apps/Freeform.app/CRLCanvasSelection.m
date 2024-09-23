@implementation CRLCanvasSelection

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;

  v3 = a3;
  v5 = objc_opt_class(CRLCanvasSelection, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  Class v2;
  NSString *v3;
  void *v4;
  id v5;

  objc_opt_class(self, a2);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "hash");

  return (unint64_t)v5;
}

@end
