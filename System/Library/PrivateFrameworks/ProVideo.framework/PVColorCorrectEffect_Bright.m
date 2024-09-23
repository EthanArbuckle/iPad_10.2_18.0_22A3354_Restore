@implementation PVColorCorrectEffect_Bright

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("FFEffectProperty_DisplayName"), CFSTR("Helium"), CFSTR("FFEffectProperty_Category"), CFSTR("effect.video.filter"), CFSTR("FFEffectProperty_EffectType"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVEffect registerEffectClass:forEffectID:withProperties:](PVEffect, "registerEffectClass:forEffectID:withProperties:", objc_opt_class(), v7, v6);

}

- (PVColorCorrectEffect_Bright)initWithEffectID:(id)a3
{
  PVColorCorrectEffect_Bright *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PVColorCorrectEffect_Bright;
  result = -[PVEffect initWithEffectID:](&v4, sel_initWithEffectID_, a3);
  if (result)
    result->super._look = 2;
  return result;
}

@end
