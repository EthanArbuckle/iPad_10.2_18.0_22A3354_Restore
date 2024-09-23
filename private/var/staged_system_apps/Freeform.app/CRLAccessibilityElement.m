@implementation CRLAccessibilityElement

- (CRLAccessibilityElement)initWithAccessibilityParent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLAccessibilityElement;
  return -[CRLAccessibilityElement initWithAccessibilityContainer:](&v4, "initWithAccessibilityContainer:", a3);
}

- (id)description
{
  __CFString *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  NSString *v12;
  void *v13;
  void *v14;
  CGRect v16;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilityElement accessibilityValue](self, "accessibilityValue"));
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilityElement accessibilityLabel](self, "accessibilityLabel"));
  if (v3)
    v9 = CFSTR("; value = \");
  else
    v9 = &stru_1012A72B0;
  if (v3)
    v10 = v3;
  else
    v10 = &stru_1012A72B0;
  if (v3)
    v11 = CFSTR("\");
  else
    v11 = &stru_1012A72B0;
  -[CRLAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  v12 = NSStringFromCGRect(v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; label = \"%@\"%@%@%@; frame = %@>"),
                    v7,
                    self,
                    v8,
                    v9,
                    v10,
                    v11,
                    v13));

  return v14;
}

@end
