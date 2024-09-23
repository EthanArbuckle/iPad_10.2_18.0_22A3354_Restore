@implementation TSWPUserDefaults

+ (id)invisiblesColor
{
  return (id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.180392161, 0.533333361, 0.921568632, 1.0);
}

+ (void)registerUserDefaults:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  if ((objc_msgSend(a1, "p_UserDefaultSet:force:", CFSTR("TWSPAutomaticallyDetectLinks"), a3) & 1) == 0)
    objc_msgSend(a1, "setAutomaticallyDetectLinks:", 1);
  if ((objc_msgSend(a1, "p_UserDefaultSet:force:", CFSTR("TWSPAutomaticallyDetectLists"), v3) & 1) == 0)
    objc_msgSend(a1, "setAutomaticallyDetectLists:", 1);
  if ((objc_msgSend(a1, "p_UserDefaultSet:force:", CFSTR("TWSPSuperscriptNumericalSuffixes"), v3) & 1) == 0)
    objc_msgSend(a1, "setSuperscriptNumericalSuffixes:", 0);
  if ((objc_msgSend(a1, "p_UserDefaultSet:force:", CFSTR("TSWPSpellCheckingEnabled"), v3) & 1) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("NSAllowContinuousSpellChecking")))
    {
      v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSAllowContinuousSpellChecking"));
    }
    else
    {
      v5 = 1;
    }
    objc_msgSend(a1, "setSpellCheckingEnabled:", v5);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "synchronize");
}

+ (BOOL)p_UserDefaultSet:(id)a3 force:(BOOL)a4
{
  return !a4 && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", a3) != 0;
}

+ (BOOL)automaticallyDetectLinks
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("TWSPAutomaticallyDetectLinks"));
}

+ (BOOL)automaticallyDetectLists
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("TWSPAutomaticallyDetectLists"));
}

+ (BOOL)superscriptNumericalSuffixes
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("TWSPSuperscriptNumericalSuffixes"));
}

+ (BOOL)spellCheckingEnabled
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("TSWPSpellCheckingEnabled"));
}

+ (void)setInvisiblesColor:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPUserDefaults setInvisiblesColor:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPUserDefaults.m"), 137, CFSTR("iOS does not support setting the invisibles color"));
}

+ (void)setAutomaticallyDetectLinks:(BOOL)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "setBool:forKey:", a3, CFSTR("TWSPAutomaticallyDetectLinks"));
}

+ (void)setAutomaticallyDetectLists:(BOOL)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "setBool:forKey:", a3, CFSTR("TWSPAutomaticallyDetectLists"));
}

+ (void)setSuperscriptNumericalSuffixes:(BOOL)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "setBool:forKey:", a3, CFSTR("TWSPSuperscriptNumericalSuffixes"));
}

+ (void)setSpellCheckingEnabled:(BOOL)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "setBool:forKey:", a3, CFSTR("TSWPSpellCheckingEnabled"));
}

@end
