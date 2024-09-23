@implementation IMActivity

+ (id)activityTypes
{
  _QWORD v3[25];

  v3[0] = UIActivityTypePostToFacebook;
  v3[1] = UIActivityTypePostToTwitter;
  v3[2] = UIActivityTypePostToWeibo;
  v3[3] = UIActivityTypeMessage;
  v3[4] = UIActivityTypeMail;
  v3[5] = UIActivityTypePrint;
  v3[6] = UIActivityTypeCopyToPasteboard;
  v3[7] = UIActivityTypeAssignToContact;
  v3[8] = UIActivityTypeSaveToCameraRoll;
  v3[9] = UIActivityTypeAddToReadingList;
  v3[10] = UIActivityTypePostToFlickr;
  v3[11] = UIActivityTypePostToVimeo;
  v3[12] = UIActivityTypePostToTencentWeibo;
  v3[13] = UIActivityTypeAirDrop;
  v3[14] = UIActivityTypeOpenInIBooks;
  v3[15] = UIActivityTypeMarkupAsPDF;
  v3[16] = UIActivityTypeUserDefaults;
  v3[17] = UIActivityTypeCreateReminder;
  v3[18] = UIActivityTypeSaveToNotes;
  v3[19] = UIActivityTypeCloudSharing;
  v3[20] = UIActivityTypeSaveToFiles;
  v3[21] = CFSTR("com.apple.share.Messages.window");
  v3[22] = CFSTR("com.apple.Notes.SharingExtension");
  v3[23] = CFSTR("com.linkedin.LinkedIn.ShareExtension");
  v3[24] = CFSTR("com.apple.schoolwork.ClassKitApp.SaveToClassKitApp");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 25));
}

@end
