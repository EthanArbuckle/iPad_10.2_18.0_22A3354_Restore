@implementation UIComposeViewControllerIsAvailable

void ___UIComposeViewControllerIsAvailable_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("com.apple.share.Twitter.post");
  v6[1] = CFSTR("com.apple.share.Facebook.post");
  v6[2] = CFSTR("com.apple.share.SinaWeibo.post");
  v6[3] = CFSTR("com.apple.share.TencentWeibo.post");
  v6[4] = CFSTR("com.apple.share.Flickr.post");
  v6[5] = CFSTR("com.apple.share.Vimeo.post");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_UIComposeViewControllerIsAvailable_legacySocialActivityTypes;
  _UIComposeViewControllerIsAvailable_legacySocialActivityTypes = v2;

  v4 = objc_alloc_init(getSSVMediaSocialShareExtensionClass());
  v5 = (void *)_UIComposeViewControllerIsAvailable_mediaShareExtension;
  _UIComposeViewControllerIsAvailable_mediaShareExtension = (uint64_t)v4;

}

@end
