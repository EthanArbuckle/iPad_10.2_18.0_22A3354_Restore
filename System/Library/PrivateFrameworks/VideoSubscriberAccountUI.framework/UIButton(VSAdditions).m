@implementation UIButton(VSAdditions)

- (uint64_t)vs_normalTitle
{
  return objc_msgSend(a1, "titleForState:", 0);
}

- (uint64_t)setVs_normalTitle:()VSAdditions
{
  return objc_msgSend(a1, "setTitle:forState:", a3, 0);
}

@end
