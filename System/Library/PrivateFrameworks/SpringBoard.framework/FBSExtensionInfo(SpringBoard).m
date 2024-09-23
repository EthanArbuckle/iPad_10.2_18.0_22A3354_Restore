@implementation FBSExtensionInfo(SpringBoard)

- (uint64_t)sb_type
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "typeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.services")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.ui-services")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.keyboard-service")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.fileprovider-ui")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.fileprovider-nonui")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.photo-editing")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.share-services")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.widget-extension")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.watchkit")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.usernotifications.service")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.usernotifications.content-extension")) & 1) != 0)
  {
    v2 = 15;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.callkit.call-directory")) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.message-payload-provider")) & 1) != 0)
  {
    v2 = 17;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.intents-ui-service")) & 1) != 0)
  {
    v2 = 19;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.intents-service")) & 1) != 0)
  {
    v2 = 18;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.broadcast-services")) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Safari.sharedlinks-service")) & 1) != 0)
  {
    v2 = 20;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Safari.content-blocker")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.spotlight.index")) & 1) != 0)
  {
    v2 = 12;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.AudioUnit-UI")))
  {
    v2 = 13;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
