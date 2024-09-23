@implementation PRUISRequestDismissalAction

+ (id)actionWithAnimation:(BOOL)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v4, "setFlag:forSetting:", BSSettingFlagForBool(), 1);
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v4, 0);

  return v5;
}

- (BOOL)isAnimated
{
  void *v2;
  char IsYes;

  -[PRUISRequestDismissalAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flagForSetting:", 1);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("isAnimated");
  else
    return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 != 1)
    return 0;
  BSSettingFlagDescription();
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
