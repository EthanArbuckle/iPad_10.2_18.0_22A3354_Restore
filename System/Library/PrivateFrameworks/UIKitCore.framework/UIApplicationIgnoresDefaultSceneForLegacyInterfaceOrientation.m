@implementation UIApplicationIgnoresDefaultSceneForLegacyInterfaceOrientation

uint64_t ___UIApplicationIgnoresDefaultSceneForLegacyInterfaceOrientation_block_invoke()
{
  char v0;
  char v1;
  char v2;
  char v3;
  uint64_t v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  uint64_t result;

  if (qword_1EDDC8440 != -1)
    dispatch_once(&qword_1EDDC8440, &__block_literal_global_3051);
  if (qword_1EDDC8438)
  {
    if ((objc_msgSend((id)qword_1EDDC8438, "isEqualToString:", CFSTR("com.apple.Home.HomeUIService")) & 1) != 0)
    {
      v0 = 1;
      goto LABEL_10;
    }
    if (qword_1EDDC8440 != -1)
      dispatch_once(&qword_1EDDC8440, &__block_literal_global_3051);
  }
  if (!qword_1EDDC8438)
  {
    byte_1EDDC8025 = 0;
    goto LABEL_13;
  }
  v0 = objc_msgSend((id)qword_1EDDC8438, "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));
LABEL_10:
  byte_1EDDC8025 = v0;
  if (qword_1EDDC8440 != -1)
    dispatch_once(&qword_1EDDC8440, &__block_literal_global_3051);
LABEL_13:
  if (qword_1EDDC8438)
  {
    v1 = objc_msgSend((id)qword_1EDDC8438, "isEqualToString:", CFSTR("com.apple.WebSheet"));
    byte_1EDDC8025 |= v1;
    if (qword_1EDDC8440 != -1)
      dispatch_once(&qword_1EDDC8440, &__block_literal_global_3051);
  }
  if (qword_1EDDC8438)
  {
    v2 = objc_msgSend((id)qword_1EDDC8438, "isEqualToString:", CFSTR("com.apple.PassbookUIService"));
    byte_1EDDC8025 |= v2;
    if (qword_1EDDC8440 != -1)
      dispatch_once(&qword_1EDDC8440, &__block_literal_global_3051);
  }
  if (qword_1EDDC8438)
  {
    v3 = objc_msgSend((id)qword_1EDDC8438, "isEqualToString:", CFSTR("com.apple.mobilesms.compose"));
    v4 = qword_1EDDC8440;
    if ((v3 & 1) != 0)
    {
      v5 = 1;
      goto LABEL_27;
    }
    if (qword_1EDDC8440 != -1)
      dispatch_once(&qword_1EDDC8440, &__block_literal_global_3051);
  }
  v5 = qword_1EDDC8438;
  if (qword_1EDDC8438)
  {
    v5 = objc_msgSend((id)qword_1EDDC8438, "isEqualToString:", CFSTR("com.apple.gamecenter.GameCenterUIService"));
    v4 = qword_1EDDC8440;
  }
  else
  {
    v4 = -1;
  }
LABEL_27:
  byte_1EDDC8025 |= v5;
  if (v4 != -1)
    dispatch_once(&qword_1EDDC8440, &__block_literal_global_3051);
  if (qword_1EDDC8438)
  {
    v6 = objc_msgSend((id)qword_1EDDC8438, "isEqualToString:", CFSTR("com.apple.shortcuts.runtime"));
    byte_1EDDC8025 |= v6;
    if (qword_1EDDC8440 != -1)
      dispatch_once(&qword_1EDDC8440, &__block_literal_global_3051);
  }
  if (qword_1EDDC8438)
  {
    v7 = objc_msgSend((id)qword_1EDDC8438, "isEqualToString:", CFSTR("com.apple.ScreenTimeUnlock"));
    byte_1EDDC8025 |= v7;
    if (qword_1EDDC8440 != -1)
      dispatch_once(&qword_1EDDC8440, &__block_literal_global_3051);
  }
  if (qword_1EDDC8438)
  {
    v8 = objc_msgSend((id)qword_1EDDC8438, "isEqualToString:", CFSTR("com.apple.SafariViewService"));
    byte_1EDDC8025 |= v8;
    if (qword_1EDDC8440 != -1)
      dispatch_once(&qword_1EDDC8440, &__block_literal_global_3051);
  }
  if (qword_1EDDC8438)
  {
    v9 = objc_msgSend((id)qword_1EDDC8438, "isEqualToString:", CFSTR("com.apple.datadetectors.DDActionsService"));
    byte_1EDDC8025 |= v9;
    if (qword_1EDDC8440 != -1)
      dispatch_once(&qword_1EDDC8440, &__block_literal_global_3051);
  }
  result = qword_1EDDC8438;
  if (qword_1EDDC8438)
    result = objc_msgSend((id)qword_1EDDC8438, "isEqualToString:", CFSTR("com.apple.Photos.PhotosUIService"));
  byte_1EDDC8025 |= result;
  return result;
}

@end
