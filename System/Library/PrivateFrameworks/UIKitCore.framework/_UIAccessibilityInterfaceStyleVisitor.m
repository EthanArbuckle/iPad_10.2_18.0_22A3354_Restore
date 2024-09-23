@implementation _UIAccessibilityInterfaceStyleVisitor

- (BOOL)_visitView:(id)a3
{
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v10;

  v5 = (void *)objc_msgSend(a3, "superview");
  if (objc_msgSend(a3, "_accessibilityInterfaceStyleIntent") == 1
    && objc_msgSend(a3, "_accessibilityResolvedInterfaceStyle") != 1)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(a3, "_accessibilityInterfaceStyleIntent") == 2
      && objc_msgSend(a3, "_accessibilityResolvedInterfaceStyle") != 2;
  }
  objc_opt_class();
  v7 = (objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(a3, "_accessibilityInterfaceStyleIntent") != 2
    && objc_msgSend(a3, "_accessibilityResolvedInterfaceStyle") == 2;
  if (v6 || v7)
  {
    if (objc_msgSend(a3, "_accessibilityInterfaceStyleIntent") == 2)
      v8 = 2;
    else
      v8 = 1;
    goto LABEL_15;
  }
  if (v5)
  {
    if (!objc_msgSend(a3, "_accessibilityInterfaceStyleIntent"))
    {
      v10 = objc_msgSend(v5, "_accessibilityResolvedInterfaceStyle");
      if (v10 != objc_msgSend(a3, "_accessibilityResolvedInterfaceStyle"))
      {
        v8 = objc_msgSend((id)objc_msgSend(a3, "superview"), "_accessibilityResolvedInterfaceStyle");
LABEL_15:
        objc_msgSend(a3, "_accessibilitySetResolvedInterfaceStyle:", v8);
        objc_msgSend(a3, "_tintColorDidChange");
        return 1;
      }
    }
  }
  return self->_originalVisitedView == a3;
}

- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6
{
  if (-[_UIViewVisitor tracksHierarchy](self, "tracksHierarchy", a3, a4, a5, a6)
    && (id)objc_msgSend(a4, "superview") != a3)
  {
    return 0;
  }
  self->_originalVisitedView = (UIView *)a3;
  return 1;
}

@end
