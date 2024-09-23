@implementation UIAction(PLSwipeInteractionAdditions)

- (void)setPl_defaultAction:()PLSwipeInteractionAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "UIView.PLSwipeInteractionAdditions.pl_defaultAction", v2, (void *)0x303);

}

- (uint64_t)pl_isDefaultAction
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_getAssociatedObject(a1, "UIView.PLSwipeInteractionAdditions.pl_defaultAction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

@end
