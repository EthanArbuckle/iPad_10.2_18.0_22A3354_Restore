@implementation SFCardSection(SpotlightExtras)

- (id)spotlightBackingResult
{
  return objc_getAssociatedObject(a1, &spotlightBackingResultKey);
}

- (void)setSpotlightBackingResult:()SpotlightExtras
{
  id v4;
  id value;

  v4 = a3;
  value = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResult:", v4);

  objc_msgSend(value, "setCard:", 0);
  objc_msgSend(value, "setInlineCard:", 0);
  objc_msgSend(value, "setCompactCard:", 0);
  objc_setAssociatedObject(a1, &spotlightBackingResultKey, value, (void *)1);

}

@end
