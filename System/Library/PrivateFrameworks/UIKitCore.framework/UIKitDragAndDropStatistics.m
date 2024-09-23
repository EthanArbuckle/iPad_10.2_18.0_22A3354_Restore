@implementation UIKitDragAndDropStatistics

void __92___UIKitDragAndDropStatistics_incrementUIKitScalarValueForKnownInternalAppsForKey_bundleID___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.MobileAddressBook"), CFSTR("com.apple.DocumentsApp"), CFSTR("com.apple.mobilecal"), CFSTR("com.apple.Maps"), CFSTR("com.apple.MailCompositionService"), CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.mobileslideshow"), CFSTR("com.apple.Music"), CFSTR("com.apple.reminders"), CFSTR("com.apple.iBooks"), CFSTR("com.apple.mobilemail"), CFSTR("com.apple.news"), CFSTR("com.apple.mobilenotes"), CFSTR("com.apple.iCloudDriveApp"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD820C8;
  qword_1ECD820C8 = v0;

}

@end
