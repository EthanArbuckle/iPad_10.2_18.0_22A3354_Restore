@implementation UIView(TelephonyUI)

- (uint64_t)tp_setCHCRPriority:()TelephonyUI
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:", 1);
  *(float *)&v4 = a2;
  objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:", 0, v4);
  *(float *)&v5 = a2;
  objc_msgSend(a1, "setContentHuggingPriority:forAxis:", 1, v5);
  *(float *)&v6 = a2;
  return objc_msgSend(a1, "setContentHuggingPriority:forAxis:", 0, v6);
}

- (uint64_t)tp_userInterfaceLayoutDirection
{
  return objc_msgSend((id)objc_opt_class(), "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(a1, "semanticContentAttribute"));
}

@end
