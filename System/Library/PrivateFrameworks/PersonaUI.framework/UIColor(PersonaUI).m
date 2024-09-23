@implementation UIColor(PersonaUI)

+ (id)pr_colorNamed:()PersonaUI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleWithIdentifier:", CFSTR("com.apple.PersonaUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorNamed:inBundle:compatibleWithTraitCollection:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)pr_lightAccentColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.97647059, 0.97647059, 0.97647059, 1.0);
}

+ (uint64_t)pr_darkAccentColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.952941179, 0.952941179, 0.952941179, 1.0);
}

+ (uint64_t)pr_backgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.505882382, 0.505882382, 0.505882382, 1.0);
}

@end
