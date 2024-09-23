@implementation PCLocalizedString

+ (id)localizedStringForKey:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.ProximityControl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCLocalizedString keyValueForKey:](PCLocalizedString, "keyValueForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24CCF7568, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)keyValueForKey:(unint64_t)a3
{
  if (a3 - 1 > 0x12)
    return CFSTR("ALARM_DEFAULT_TEXT");
  else
    return off_24CCF66A8[a3 - 1];
}

@end
