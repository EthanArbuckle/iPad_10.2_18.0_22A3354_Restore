@implementation PSSpecifier(PSUIVoiceAndDataDrillDownController)

- (BOOL)isRATModeSpecifier
{
  __CFString *v2;
  __CFString *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "identifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v2 == CFSTR("VoLTESwitchSpecifierKey"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "identifier");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != CFSTR("SASwitchSpecifierKey");

  }
  return v4;
}

@end
