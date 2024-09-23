@implementation WFComplicationMetricsStorage

+ (unint64_t)appComplicationSlotsUsed
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("AppComplicationSlotsUsed"));

  return v3 & (v3 >> 63);
}

+ (void)setAppComplicationSlotsUsed:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("AppComplicationSlotsUsed"));

}

+ (unint64_t)shortcutComplicationSlotsUsed
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("ShortcutComplicationSlotsUsed"));

  return v3 & (v3 >> 63);
}

+ (void)setShortcutComplicationSlotsUsed:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("ShortcutComplicationSlotsUsed"));

}

@end
