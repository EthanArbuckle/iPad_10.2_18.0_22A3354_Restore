@implementation UIAccessibilityCustomRotor

Method __71__UIAccessibilityCustomRotor_AXPrivate___accessibilityAXAttributedName__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  _accessibilityAXAttributedName_baseNameMethod = (uint64_t)class_getInstanceMethod(v0, sel_name);
  v1 = (objc_class *)objc_opt_class();
  result = class_getInstanceMethod(v1, sel_attributedName);
  _accessibilityAXAttributedName_baseAttributedNameMethod = (uint64_t)result;
  return result;
}

@end
