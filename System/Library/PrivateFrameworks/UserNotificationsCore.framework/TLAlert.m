@implementation TLAlert

void __71__TLAlert_UserNotificationsCore__unc_toneLibraryAlertTypeForSectionID___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("com.apple.mobilemail");
  v2[1] = CFSTR("com.apple.MobileSMS");
  v3[0] = &unk_251B12710;
  v3[1] = &unk_251B12728;
  v2[2] = CFSTR("com.apple.mobilephone");
  v2[3] = CFSTR("com.apple.facetime");
  v3[2] = &unk_251B12740;
  v3[3] = &unk_251B12740;
  v2[4] = CFSTR("com.apple.mobilecal");
  v2[5] = CFSTR("com.apple.reminders");
  v3[4] = &unk_251B12758;
  v3[5] = &unk_251B12770;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)unc_toneLibraryAlertTypeForSectionID____sectionIDToAlertType;
  unc_toneLibraryAlertTypeForSectionID____sectionIDToAlertType = v0;

}

@end
