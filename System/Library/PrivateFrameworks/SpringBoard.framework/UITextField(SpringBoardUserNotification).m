@implementation UITextField(SpringBoardUserNotification)

- (void)sb_setMaxInputLength:()SpringBoardUserNotification
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "_sb_maxInputLength", v2, (void *)0x301);

}

- (uint64_t)sb_maxInputLength
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_getAssociatedObject(a1, "_sb_maxInputLength");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "unsignedIntegerValue");
  else
    v3 = -1;

  return v3;
}

@end
