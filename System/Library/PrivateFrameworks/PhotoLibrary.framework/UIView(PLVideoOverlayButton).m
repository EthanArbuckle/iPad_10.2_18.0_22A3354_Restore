@implementation UIView(PLVideoOverlayButton)

+ (id)pl_videoOverlayButtonWithStyle:()PLVideoOverlayButton
{
  __objc2_class **v3;

  v3 = &off_1E70B4F98;
  if (a3 != 2)
    v3 = &off_1E70B4FA8;
  return (id)objc_msgSend(objc_alloc(*v3), "initWithStyle:", a3);
}

+ (uint64_t)pl_videoOverlayButtonSize
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", CFSTR("PLVideoOverlayBackgroundMask"), objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class())), "size");
}

@end
