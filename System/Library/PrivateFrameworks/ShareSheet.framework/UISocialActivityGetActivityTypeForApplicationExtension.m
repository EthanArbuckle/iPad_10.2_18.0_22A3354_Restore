@implementation UISocialActivityGetActivityTypeForApplicationExtension

void ___UISocialActivityGetActivityTypeForApplicationExtension_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.share.Twitter.post");
  v2[1] = CFSTR("com.apple.share.Facebook.post");
  v3[0] = CFSTR("com.apple.UIKit.activity.PostToTwitter");
  v3[1] = CFSTR("com.apple.UIKit.activity.PostToFacebook");
  v2[2] = CFSTR("com.apple.share.SinaWeibo.post");
  v2[3] = CFSTR("com.apple.share.TencentWeibo.post");
  v3[2] = CFSTR("com.apple.UIKit.activity.PostToWeibo");
  v3[3] = CFSTR("com.apple.UIKit.activity.TencentWeibo");
  v2[4] = CFSTR("com.apple.share.Flickr.post");
  v2[5] = CFSTR("com.apple.share.Vimeo.post");
  v3[4] = CFSTR("com.apple.UIKit.activity.PostToFlickr");
  v3[5] = CFSTR("com.apple.UIKit.activity.PostToVimeo");
  v2[6] = CFSTR("com.apple.reminders.sharingextension");
  v2[7] = CFSTR("com.apple.mobilenotes.SharingExtension");
  v3[6] = CFSTR("com.apple.reminders.sharingextension");
  v3[7] = CFSTR("com.apple.mobilenotes.SharingExtension");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_UISocialActivityGetActivityTypeForApplicationExtension___activityTypesByApplicationExtensionIdentifiers;
  _UISocialActivityGetActivityTypeForApplicationExtension___activityTypesByApplicationExtensionIdentifiers = v0;

}

@end
