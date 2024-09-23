@implementation NSLayoutConstraint(UIInterfaceBuilderSupport)

- (_NSLayoutConstraintConstant)_encodedConstant
{
  double v2;
  double v3;

  v2 = 0.0;
  if (!objc_msgSend(a1, "symbolicConstant"))
  {
    objc_msgSend(a1, "constant");
    v2 = v3;
  }
  return +[_NSLayoutConstraintConstant constantWithSymbolicValue:numericValue:](_NSLayoutConstraintConstant, "constantWithSymbolicValue:numericValue:", objc_msgSend(a1, "symbolicConstant"), v2);
}

- (uint64_t)_setEncodedConstant:()UIInterfaceBuilderSupport
{
  if (objc_msgSend(a3, "symbolicValue"))
    return objc_msgSend(a1, "setSymbolicConstant:", objc_msgSend(a3, "symbolicValue"));
  objc_msgSend(a3, "numericValue");
  return objc_msgSend(a1, "setConstant:");
}

@end
