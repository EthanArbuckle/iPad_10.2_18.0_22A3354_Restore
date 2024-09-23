@implementation SAUISayIt(CommandUserInfo)

- (void)_siriui_applyUserInfoDictionary:()CommandUserInfo
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CRKAudioPlaybackCardSectionIgnoresMuteSwitch"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sruif_setIgnoresMuteSwitch:", objc_msgSend(v4, "BOOLValue"));

}

@end
