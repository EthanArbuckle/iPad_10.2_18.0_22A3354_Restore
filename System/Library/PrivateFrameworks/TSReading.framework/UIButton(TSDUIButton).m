@implementation UIButton(TSDUIButton)

+ (void)tsdPlatformButtonWithFrame:()TSDUIButton
{
  void *v8;

  v8 = (void *)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
  objc_msgSend(v8, "setFrame:", a1, a2, a3, a4);
  return v8;
}

- (uint64_t)setTarget:()TSDUIButton action:
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:", a3, a4, 64);
}

- (uint64_t)setImageNamed:()TSDUIButton inBundle:
{
  uint64_t v5;

  v5 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", a3, a4, 0);
  objc_msgSend(a1, "setImage:forState:", v5, 0);
  return objc_msgSend(a1, "setImage:forState:", v5, 2);
}

- (uint64_t)setAlternateImageNamed:()TSDUIButton inBundle:
{
  return objc_msgSend(a1, "setImage:forState:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", a3, a4, 0), 1);
}

@end
