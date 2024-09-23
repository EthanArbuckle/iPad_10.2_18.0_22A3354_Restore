@implementation SFUIShareSheetRemoteSettingsHelperSwift

- (SFUIShareSheetRemoteSettingsHelperSwift)init
{
  return (SFUIShareSheetRemoteSettingsHelperSwift *)sub_212795F2C();
}

+ (void)updateHostingControllerWithHostingController:(id)a3 context:(id)a4 hostProcessType:(int64_t)a5 hostPresentationStyle:(int64_t)a6 optionGroups:(id)a7 collaborationOptionsData:(id)a8 cloudShareRequest:(id)a9
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  swift_getObjCClassMetadata();
  v9 = a3;
  v10 = a4;
  v11 = a7;
  v12 = a8;
  v13 = a9;
  if (a7)
  {
    sub_212797A40();
    v14 = sub_21279DE40();

    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  swift_getObjCClassMetadata();
  static SFUIShareSheetRemoteSettingsHelperSwift.updateHostingController(hostingController:context:hostProcessType:hostPresentationStyle:optionGroups:collaborationOptionsData:cloudShareRequest:)((uint64_t)a3, a4, a5, a6, v15, a8, a9);
  swift_bridgeObjectRelease();

}

@end
