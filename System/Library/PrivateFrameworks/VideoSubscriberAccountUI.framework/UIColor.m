@implementation UIColor

id __75__UIColor_VSAdditions__vsa_dynamicColorWithLightStyleColor_darkStyleColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "userInterfaceStyle");
  v4 = 40;
  if (v3 == 2)
    v4 = 32;
  return *(id *)(a1 + v4);
}

void __45__UIColor_VSAdditions__vsa_opacityADarkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)vsa_opacityADarkColor___color;
  vsa_opacityADarkColor___color = v0;

}

void __46__UIColor_VSAdditions__vsa_opacityALightColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)vsa_opacityALightColor___color;
  vsa_opacityALightColor___color = v0;

}

void __45__UIColor_VSAdditions__vsa_opacityBDarkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)vsa_opacityBDarkColor___color;
  vsa_opacityBDarkColor___color = v0;

}

void __46__UIColor_VSAdditions__vsa_opacityBLightColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)vsa_opacityBLightColor___color;
  vsa_opacityBLightColor___color = v0;

}

void __45__UIColor_VSAdditions__vsa_opacityCDarkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)vsa_opacityCDarkColor___color;
  vsa_opacityCDarkColor___color = v0;

}

void __46__UIColor_VSAdditions__vsa_opacityCLightColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)vsa_opacityCLightColor___color;
  vsa_opacityCLightColor___color = v0;

}

@end
