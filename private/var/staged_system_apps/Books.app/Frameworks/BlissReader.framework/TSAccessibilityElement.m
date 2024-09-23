@implementation TSAccessibilityElement

- (id)description
{
  const __CFString *v3;
  objc_class *v4;
  NSString *v5;
  id v6;
  BOOL v7;
  const __CFString *v8;
  const __CFString *v9;
  CGRect v11;

  v3 = (const __CFString *)-[TSAccessibilityElement accessibilityValue](self, "accessibilityValue");
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = -[TSAccessibilityElement accessibilityLabel](self, "accessibilityLabel");
  v7 = v3 == 0;
  if (v3)
    v8 = CFSTR("; value = \");
  else
    v8 = &stru_43D7D8;
  if (!v3)
    v3 = &stru_43D7D8;
  if (v7)
    v9 = &stru_43D7D8;
  else
    v9 = CFSTR("\");
  -[TSAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; label = \"%@\"%@%@%@; frame = %@>"),
           v5,
           self,
           v6,
           v8,
           v3,
           v9,
           NSStringFromCGRect(v11));
}

- (void)accessibilityElementDidBecomeFocused
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSAccessibilityElement;
  -[TSAccessibilityElement accessibilityElementDidBecomeFocused](&v3, "accessibilityElementDidBecomeFocused");
  -[TSAccessibility _setCurrentlyFocusedElement:](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "_setCurrentlyFocusedElement:", self);
}

- (void)accessibilityElementDidLoseFocus
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSAccessibilityElement;
  -[TSAccessibilityElement accessibilityElementDidLoseFocus](&v2, "accessibilityElementDidLoseFocus");
  -[TSAccessibility _setCurrentlyFocusedElement:](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "_setCurrentlyFocusedElement:", 0);
}

@end
