@implementation UIImage(TelephonyUI)

+ (void)clearCachedCappedSizeImagesIfNeeded
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0DC3870], "cappedSizedImagesAreValid") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "preferredContentSizeCategory");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__lastCappedImageSizeContentCategory;
    __lastCappedImageSizeContentCategory = v1;

    v3 = (void *)__telephonyUIActionButtonGlyphImage;
    __telephonyUIActionButtonGlyphImage = 0;

    v4 = (void *)__telephonyUIInfoButtonGlyphImage;
    __telephonyUIInfoButtonGlyphImage = 0;

  }
}

+ (BOOL)cappedSizedImagesAreValid
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = __lastCappedImageSizeContentCategory && (objc_msgSend(v1, "isEqualToString:") & 1) != 0;
  return v2;
}

+ (id)recentsOutgoingAudioCallGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__UIImage_TelephonyUI__recentsOutgoingAudioCallGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsOutgoingAudioCallGlyphImage_onceToken != -1)
    dispatch_once(&recentsOutgoingAudioCallGlyphImage_onceToken, block);
  return (id)recentsOutgoingAudioCallGlyphImage___sGlyphImage;
}

+ (id)recentsTTYGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__UIImage_TelephonyUI__recentsTTYGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsTTYGlyphImage_onceToken != -1)
    dispatch_once(&recentsTTYGlyphImage_onceToken, block);
  return (id)recentsTTYGlyphImage___sGlyphImage;
}

+ (id)recentsOutgoingVideoCallGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__UIImage_TelephonyUI__recentsOutgoingVideoCallGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsOutgoingVideoCallGlyphImage_onceToken != -1)
    dispatch_once(&recentsOutgoingVideoCallGlyphImage_onceToken, block);
  return (id)recentsOutgoingVideoCallGlyphImage___sGlyphImage;
}

+ (id)tpImageForSymbolType:()TelephonyUI textStyle:scale:isStaticSize:
{
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v10 = (void *)MEMORY[0x1E0DC3658];
  v11 = a4;
  objc_msgSend(v10, "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tpImageForSymbolType:textStyle:scale:hierarchicalColor:isStaticSize:", a3, v11, a5, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)tpImageForSymbolType:()TelephonyUI textStyle:scale:hierarchicalColor:isStaticSize:
{
  id v12;
  id v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v12 = a4;
  v13 = a6;
  if (a7)
  {
    v14 = objc_msgSend(a1, "shouldBeHierarchicalSymbolType:", a3);
    v15 = (void *)MEMORY[0x1E0DC3888];
    v16 = objc_msgSend(a1, "scaleForTPScale:", a5);
    if (v14)
      objc_msgSend(v15, "hierarchicalTpConfigurationWithStaticTextStyle:scale:color:", v12, v16, v13);
    else
      objc_msgSend(v15, "tpConfigurationWithStaticTextStyle:scale:", v12, v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", v12, objc_msgSend(a1, "scaleForTPScale:", a5));
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
  objc_msgSend(a1, "tpImageForSymbolType:configuration:", a3, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)tpImageForSymbolType:()TelephonyUI configuration:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (objc_msgSend(a1, "isCustomSymbol:", a3))
  {
    objc_msgSend(a1, "customImageNameForSymbolType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3870];
    TelephonyUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:withConfiguration:", v7, v9, v6);
  }
  else
  {
    objc_msgSend(a1, "systemImageNameForSymbolType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithConfiguration:", v6);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (__CFString)systemImageNameForSymbolType:()TelephonyUI
{
  __CFString *result;
  int v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  switch(a3)
  {
    case 0:
    case 75:
      return &stru_1E75FDD38;
    case 1:
    case 80:
      return CFSTR("phone.fill");
    case 2:
      return CFSTR("phone.down.fill");
    case 3:
      return CFSTR("phone.down.circle.fill");
    case 4:
      v4 = _os_feature_enabled_impl();
      v5 = CFSTR("phone.arrow.up.right.fill");
      goto LABEL_16;
    case 5:
    case 82:
      return CFSTR("video.fill");
    case 6:
      v4 = _os_feature_enabled_impl();
      v5 = CFSTR("arrow.up.right.video.fill");
LABEL_16:
      v6 = CFSTR("arrow.up.right");
      goto LABEL_80;
    case 7:
      return CFSTR("questionmark.video.fill");
    case 8:
    case 10:
      return CFSTR("xmark");
    case 9:
      return CFSTR("checkmark");
    case 11:
    case 45:
      return CFSTR("speaker.wave.3.fill");
    case 12:
      return CFSTR("person.crop.circle");
    case 13:
      return CFSTR("message.fill");
    case 14:
      return CFSTR("hand.raised.fill");
    case 15:
      return CFSTR("envelope.fill");
    case 16:
      return CFSTR("plus");
    case 17:
      return CFSTR("person.crop.circle.badge.plus");
    case 18:
      return CFSTR("circle.grid.3x3.fill");
    case 19:
      return CFSTR("arrow.merge");
    case 20:
      return CFSTR("arrow.swap");
    case 21:
      return CFSTR("mic.slash.fill");
    case 22:
      return CFSTR("delete.left.fill");
    case 23:
      return CFSTR("gobackward.15");
    case 24:
    case 77:
      return CFSTR("play.fill");
    case 25:
      return CFSTR("pause.fill");
    case 26:
      return CFSTR("square.and.arrow.up");
    case 27:
      return CFSTR("info.circle");
    case 28:
      return CFSTR("teletype");
    case 29:
      return CFSTR("realtimetext");
    case 30:
      return CFSTR("recordingtape");
    case 31:
      return CFSTR("volume.2.fill");
    case 32:
      return CFSTR("trash.fill");
    case 33:
      return CFSTR("trash.slash.fill");
    case 34:
      return CFSTR("exclamationmark.bubble");
    case 35:
      return CFSTR("checkmark.square.fill");
    case 36:
      return CFSTR("chevron.forward");
    case 37:
      return CFSTR("staroflife.fill");
    case 38:
      return CFSTR("alarm.fill");
    case 39:
      return CFSTR("xmark.circle.fill");
    case 40:
      return CFSTR("hourglass.tophalf.fill");
    case 41:
      return CFSTR("hourglass");
    case 42:
      return CFSTR("exclamationmark.triangle");
    case 43:
      return CFSTR("speaker.bluetooth.fill");
    case 44:
      return CFSTR("carplay");
    case 46:
      return CFSTR("airpods");
    case 47:
    case 74:
      return CFSTR("airpodspro");
    case 48:
      return CFSTR("airpodsmax");
    case 49:
      return CFSTR("beats.powerbeats");
    case 50:
      return CFSTR("beats.powerbeatspro.right");
    case 51:
      return CFSTR("beats.logo");
    case 52:
      return CFSTR("beats.earphones");
    case 53:
      return CFSTR("beats.headphones");
    case 54:
      return CFSTR("headphones");
    case 55:
    case 72:
      return CFSTR("homepod.fill");
    case 56:
    case 73:
      return CFSTR("homepod.2.fill");
    case 57:
      return CFSTR("homepodmini.fill");
    case 58:
      return CFSTR("homepodmini.2.fill");
    case 59:
      return CFSTR("applewatch.side.right");
    case 60:
      return CFSTR("desktopcomputer");
    case 61:
      return CFSTR("laptopcomputer");
    case 62:
      return CFSTR("ipad");
    case 63:
      return CFSTR("ipad.homebutton");
    case 64:
      return CFSTR("iphone");
    case 65:
      return CFSTR("iphone.homebutton");
    case 66:
      return CFSTR("ipodtouch");
    case 67:
      return CFSTR("beats.powerbeats3");
    case 68:
      return CFSTR("beats.studiobuds");
    case 69:
      return CFSTR("beats.studiobuds.plus");
    case 70:
      return CFSTR("beats.fit.pro");
    case 71:
      return CFSTR("airpods.gen3");
    case 76:
      objc_msgSend(a1, "symbolNameForCurrentDevice");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_86;
    case 78:
      return CFSTR("eye.slash.fill");
    case 79:
      return CFSTR("circle.fill");
    case 81:
      v4 = _os_feature_enabled_impl();
      v5 = CFSTR("phone.arrow.down.left.fill");
      goto LABEL_79;
    case 83:
      v4 = _os_feature_enabled_impl();
      v5 = CFSTR("arrow.down.left.video.fill");
LABEL_79:
      v6 = CFSTR("arrow.down.left");
LABEL_80:
      if (v4)
        result = v6;
      else
        result = v5;
      break;
    case 84:
      result = CFSTR("person.text.rectangle.fill");
      break;
    case 85:
      result = CFSTR("photo.fill.on.rectangle.fill");
      break;
    case 86:
      v7 = CFSTR("rectangle.inset.filled.and.person.filled");
LABEL_86:
      result = v7;
      break;
    default:
      result = (__CFString *)0;
      break;
  }
  return result;
}

+ (uint64_t)scaleForTPScale:()TelephonyUI
{
  if ((unint64_t)(a3 + 1) >= 5)
    return 0;
  else
    return a3;
}

+ (BOOL)isCustomSymbol:()TelephonyUI
{
  return a3 == 75;
}

+ (uint64_t)recentsGlyphForSymbolType:()TelephonyUI
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "tpImageForSymbolType:textStyle:scale:isStaticSize:", a3, *MEMORY[0x1E0DC4B10], 1, 0);
}

+ (id)tpImageForSymbolType:()TelephonyUI textStyle:cappedAt:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC13C0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1458]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  v14 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(v7, "fontDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "pointSize");
  objc_msgSend(v14, "configurationWithPointSize:weight:", MEMORY[0x1C3B6F0BC](v16, v13), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "tpImageForSymbolType:configuration:", a3, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)telephonyUIUnreadIndicatorGlyphImage
{
  if (telephonyUIUnreadIndicatorGlyphImage_onceToken != -1)
    dispatch_once(&telephonyUIUnreadIndicatorGlyphImage_onceToken, &__block_literal_global_1);
  return (id)telephonyUIUnreadIndicatorGlyphImage___sGlyphImage;
}

+ (id)telephonyUIInfoButtonGlyphImage
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3870], "clearCachedCappedSizeImagesIfNeeded");
  v0 = (void *)__telephonyUIInfoButtonGlyphImage;
  if (!__telephonyUIInfoButtonGlyphImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "tpImageForSymbolType:textStyle:cappedAt:", 27, *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F0]);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__telephonyUIInfoButtonGlyphImage;
    __telephonyUIInfoButtonGlyphImage = v1;

    v0 = (void *)__telephonyUIInfoButtonGlyphImage;
  }
  return v0;
}

+ (id)telephonyUIActionButtonGlyphImage
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3870], "clearCachedCappedSizeImagesIfNeeded");
  v0 = (void *)__telephonyUIActionButtonGlyphImage;
  if (!__telephonyUIActionButtonGlyphImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "tpImageForSymbolType:textStyle:cappedAt:", 26, *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC48F0]);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__telephonyUIActionButtonGlyphImage;
    __telephonyUIActionButtonGlyphImage = v1;

    v0 = (void *)__telephonyUIActionButtonGlyphImage;
  }
  return v0;
}

+ (uint64_t)shouldBeHierarchicalSymbolType:()TelephonyUI
{
  return ((unint64_t)(a3 - 30) < 0x2F) & (0x5F7FFEDF0001uLL >> (a3 - 30));
}

+ (uint64_t)favoritesGlyphForSymbolType:()TelephonyUI
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "tpImageForSymbolType:textStyle:scale:isStaticSize:", a3, *MEMORY[0x1E0DC4B10], 1, 0);
}

+ (id)favoritesAudioGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__UIImage_TelephonyUI__favoritesAudioGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (favoritesAudioGlyphImage_onceToken != -1)
    dispatch_once(&favoritesAudioGlyphImage_onceToken, block);
  return (id)favoritesAudioGlyphImage___sGlyphImage;
}

+ (id)favoritesMailGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__UIImage_TelephonyUI__favoritesMailGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (favoritesMailGlyphImage_onceToken != -1)
    dispatch_once(&favoritesMailGlyphImage_onceToken, block);
  return (id)favoritesMailGlyphImage___sGlyphImage;
}

+ (id)favoritesMessageGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__UIImage_TelephonyUI__favoritesMessageGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (favoritesMessageGlyphImage_onceToken != -1)
    dispatch_once(&favoritesMessageGlyphImage_onceToken, block);
  return (id)favoritesMessageGlyphImage___sGlyphImage;
}

+ (id)favoritesTTYDirectGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__UIImage_TelephonyUI__favoritesTTYDirectGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (favoritesTTYDirectGlyphImage_onceToken != -1)
    dispatch_once(&favoritesTTYDirectGlyphImage_onceToken, block);
  return (id)favoritesTTYDirectGlyphImage___sGlyphImage;
}

+ (id)favoritesTTYRelayGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__UIImage_TelephonyUI__favoritesTTYRelayGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (favoritesTTYRelayGlyphImage_onceToken != -1)
    dispatch_once(&favoritesTTYRelayGlyphImage_onceToken, block);
  return (id)favoritesTTYRelayGlyphImage___sGlyphImage;
}

+ (id)favoritesVideoGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__UIImage_TelephonyUI__favoritesVideoGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (favoritesVideoGlyphImage_onceToken != -1)
    dispatch_once(&favoritesVideoGlyphImage_onceToken, block);
  return (id)favoritesVideoGlyphImage___sGlyphImage;
}

+ (id)recentsIncomingAudioCallGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__UIImage_TelephonyUI__recentsIncomingAudioCallGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsIncomingAudioCallGlyphImage_onceToken != -1)
    dispatch_once(&recentsIncomingAudioCallGlyphImage_onceToken, block);
  return (id)recentsIncomingAudioCallGlyphImage___sGlyphImage;
}

+ (id)recentsIncomingVideoCallGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__UIImage_TelephonyUI__recentsIncomingVideoCallGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsIncomingVideoCallGlyphImage_onceToken != -1)
    dispatch_once(&recentsIncomingVideoCallGlyphImage_onceToken, block);
  return (id)recentsIncomingVideoCallGlyphImage___sGlyphImage;
}

+ (id)recentsVerifiedCheckmarkImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__UIImage_TelephonyUI__recentsVerifiedCheckmarkImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsVerifiedCheckmarkImage_onceToken != -1)
    dispatch_once(&recentsVerifiedCheckmarkImage_onceToken, block);
  return (id)recentsVerifiedCheckmarkImage___sCheckmarkImage;
}

+ (id)recentsRTTChevronImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__UIImage_TelephonyUI__recentsRTTChevronImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsRTTChevronImage_onceToken != -1)
    dispatch_once(&recentsRTTChevronImage_onceToken, block);
  return (id)recentsRTTChevronImage___sChevronImage;
}

+ (id)recentsAudioCallImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__UIImage_TelephonyUI__recentsAudioCallImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsAudioCallImage_onceToken != -1)
    dispatch_once(&recentsAudioCallImage_onceToken, block);
  return (id)recentsAudioCallImage___sAudioCallImage;
}

+ (id)recentsVideoCallImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__UIImage_TelephonyUI__recentsVideoCallImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsVideoCallImage_onceToken != -1)
    dispatch_once(&recentsVideoCallImage_onceToken, block);
  return (id)recentsVideoCallImage___sVideoCallImage;
}

+ (id)mailActionImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__UIImage_TelephonyUI__mailActionImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mailActionImage_onceToken != -1)
    dispatch_once(&mailActionImage_onceToken, block);
  return (id)mailActionImage___sMailActionImage;
}

+ (id)messagesActionImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__UIImage_TelephonyUI__messagesActionImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (messagesActionImage_onceToken != -1)
    dispatch_once(&messagesActionImage_onceToken, block);
  return (id)messagesActionImage___sMessagesActionImage;
}

+ (id)TTYActionImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__UIImage_TelephonyUI__TTYActionImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (TTYActionImage_onceToken != -1)
    dispatch_once(&TTYActionImage_onceToken, block);
  return (id)TTYActionImage___sTTYActionImage;
}

+ (id)actionGlyphForSymbolType:()TelephonyUI
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tpImageForSymbolType:scale:paletteColors:", a3, 2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)voicemailAudioRouteGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__UIImage_TelephonyUI__voicemailAudioRouteGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailAudioRouteGlyphImage_onceToken != -1)
    dispatch_once(&voicemailAudioRouteGlyphImage_onceToken, block);
  return (id)voicemailAudioRouteGlyphImage___sGlyphImage;
}

+ (id)voicemailDialRequestGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__UIImage_TelephonyUI__voicemailDialRequestGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailDialRequestGlyphImage_onceToken != -1)
    dispatch_once(&voicemailDialRequestGlyphImage_onceToken, block);
  return (id)voicemailDialRequestGlyphImage___sGlyphImage;
}

+ (id)voicemailDeleteGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__UIImage_TelephonyUI__voicemailDeleteGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailDeleteGlyphImage_onceToken != -1)
    dispatch_once(&voicemailDeleteGlyphImage_onceToken, block);
  return (id)voicemailDeleteGlyphImage___sGlyphImage;
}

+ (id)voicemailUndeleteGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__UIImage_TelephonyUI__voicemailUndeleteGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailUndeleteGlyphImage_onceToken != -1)
    dispatch_once(&voicemailUndeleteGlyphImage_onceToken, block);
  return (id)voicemailUndeleteGlyphImage___sGlyphImage;
}

+ (id)voicemailPlayGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__UIImage_TelephonyUI__voicemailPlayGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailPlayGlyphImage_onceToken != -1)
    dispatch_once(&voicemailPlayGlyphImage_onceToken, block);
  return (id)voicemailPlayGlyphImage___sGlyphImage;
}

+ (id)voicemailPlayGlyphDisabledImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__UIImage_TelephonyUI__voicemailPlayGlyphDisabledImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailPlayGlyphDisabledImage_onceToken != -1)
    dispatch_once(&voicemailPlayGlyphDisabledImage_onceToken, block);
  return (id)voicemailPlayGlyphDisabledImage___sGlyphImage;
}

+ (id)voicemailPauseGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__UIImage_TelephonyUI__voicemailPauseGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailPauseGlyphImage_onceToken != -1)
    dispatch_once(&voicemailPauseGlyphImage_onceToken, block);
  return (id)voicemailPauseGlyphImage___sGlyphImage;
}

+ (id)voicemailPauseGlyphDisabledImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__UIImage_TelephonyUI__voicemailPauseGlyphDisabledImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailPauseGlyphDisabledImage_onceToken != -1)
    dispatch_once(&voicemailPauseGlyphDisabledImage_onceToken, block);
  return (id)voicemailPauseGlyphDisabledImage___sGlyphImage;
}

+ (id)voicemailReportFeedbackGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__UIImage_TelephonyUI__voicemailReportFeedbackGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailReportFeedbackGlyphImage_onceToken != -1)
    dispatch_once(&voicemailReportFeedbackGlyphImage_onceToken, block);
  return (id)voicemailReportFeedbackGlyphImage___sGlyphImage;
}

+ (id)voicemailTTYGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__UIImage_TelephonyUI__voicemailTTYGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailTTYGlyphImage_onceToken != -1)
    dispatch_once(&voicemailTTYGlyphImage_onceToken, block);
  return (id)voicemailTTYGlyphImage___sGlyphImage;
}

+ (id)voicemailGlyphForSymbolType:()TelephonyUI
{
  objc_msgSend(MEMORY[0x1E0DC3870], "tpImageForSymbolType:textStyle:scale:isStaticSize:");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)videoMessageRecordGlyphImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__UIImage_TelephonyUI__videoMessageRecordGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (videoMessageRecordGlyphImage_onceToken != -1)
    dispatch_once(&videoMessageRecordGlyphImage_onceToken, block);
  return (id)videoMessageRecordGlyphImage___sGlyphImage;
}

+ (uint64_t)videoMessageSensitiveGlyphImage
{
  return objc_msgSend(a1, "tpImageForSymbolType:textStyle:scale:symbolWeight:", 78, *MEMORY[0x1E0DC4B10], 2, 4);
}

+ (uint64_t)videoMessageUnreadGlyphImage
{
  return objc_msgSend(a1, "tpImageForSymbolType:textStyle:scale:symbolWeight:", 79, *MEMORY[0x1E0DC4B10], 2, 4);
}

+ (id)currentDeviceRouteGlyphForDisplayStyle:()TelephonyUI
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;

  objc_msgSend(a1, "routeGlyphWithSymbolType:displayStyle:", 76, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = objc_msgSend(a1, "fallbackSymbolTypeForCurrentDevice");
    TPDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[UIImage(TelephonyUI) currentDeviceRouteGlyphForDisplayStyle:].cold.1(a1, v8, v9);

    objc_msgSend(a1, "routeGlyphWithSymbolType:displayStyle:", v8, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v7;

  return v10;
}

+ (uint64_t)carplayRouteGlyphForDisplayStyle:()TelephonyUI
{
  return objc_msgSend(a1, "routeGlyphWithSymbolType:displayStyle:", 44, a3);
}

+ (uint64_t)muteRouteGlyphForDisplayStyle:()TelephonyUI
{
  return objc_msgSend(a1, "routeGlyphWithSymbolType:displayStyle:", 21, a3);
}

+ (uint64_t)headphonesRouteGlyphForDisplayStyle:()TelephonyUI
{
  return objc_msgSend(a1, "routeGlyphWithSymbolType:displayStyle:", 54, a3);
}

+ (uint64_t)bluetoothAudioRouteGlyphForDisplayStyle:()TelephonyUI
{
  return objc_msgSend(a1, "routeGlyphWithSymbolType:displayStyle:", 43, a3);
}

+ (uint64_t)speakerRouteGlyphForDisplayStyle:()TelephonyUI
{
  return objc_msgSend(a1, "routeGlyphWithSymbolType:displayStyle:", 45, a3);
}

+ (id)routeGlyphWithSymbolType:()TelephonyUI displayStyle:
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "routeGlyphWithSymbolType:displayStyle:color:", a3, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)routeGlyphWithSymbolType:()TelephonyUI displayStyle:color:
{
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v8 = a5;
  switch(a4)
  {
    case 0:
      if (objc_msgSend(a1, "shouldBeHierarchicalSymbolType:", a3))
        objc_msgSend(a1, "hierarchicalImageForSymbolType:color:", a3, v8);
      else
        objc_msgSend(a1, "flatImageForSymbolType:", a3);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 1:
      objc_msgSend(a1, "tpHierarchicalImageForSymbolType:pointSize:", a3, 32.0);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
      v10 = (uint64_t *)MEMORY[0x1E0DC4B60];
      goto LABEL_7;
    case 3:
      v10 = (uint64_t *)MEMORY[0x1E0DC4AB8];
LABEL_7:
      v11 = *v10;
      v12 = a1;
      v13 = a3;
      v14 = 3;
      goto LABEL_9;
    case 4:
      v11 = *MEMORY[0x1E0DC4B60];
      v12 = a1;
      v13 = a3;
      v14 = 2;
LABEL_9:
      objc_msgSend(v12, "tpImageForSymbolType:textStyle:scale:symbolWeight:", v13, v11, v14, 4);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v15 = (void *)v9;
      break;
    default:
      v15 = 0;
      break;
  }

  return v15;
}

+ (id)flatImageForSymbolType:()TelephonyUI
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = objc_msgSend(a1, "isCustomSymbol:");
  v6 = (void *)MEMORY[0x1E0DC3870];
  if (v5)
  {
    objc_msgSend(a1, "customImageNameForSymbolType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:", v7);
  }
  else
  {
    objc_msgSend(a1, "systemImageNameForSymbolType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_systemImageNamed:", v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithRenderingMode:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithTintColor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)hierarchicalImageForSymbolType:()TelephonyUI color:
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithHierarchicalColor:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "isCustomSymbol:", a3);
  v8 = (void *)MEMORY[0x1E0DC3870];
  if (v7)
  {
    objc_msgSend(a1, "customImageNameForSymbolType:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    TelephonyUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:withConfiguration:", v9, v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithRenderingMode:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "systemImageNameForSymbolType:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_systemImageNamed:withConfiguration:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithRenderingMode:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)routeGlyphForDeviceType:()TelephonyUI displayStyle:
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "routeGlyphForDeviceType:displayStyle:color:", a3, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)routeGlyphForDeviceType:()TelephonyUI displayStyle:color:
{
  id v8;
  uint64_t v9;
  void *v10;

  v8 = a5;
  v9 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 0x21 && ((0x35FFFFFFFuLL >> v9) & 1) != 0)
  {
    objc_msgSend(a1, "routeGlyphWithSymbolType:displayStyle:color:", qword_1BCFE6FB0[v9], a4, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)tpImageForSymbolType:()TelephonyUI textStyle:scale:paletteColors:isStaticSize:
{
  id v12;
  id v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v12 = a4;
  v13 = a6;
  if (a7)
  {
    v14 = objc_msgSend(a1, "shouldBeHierarchicalSymbolType:", a3);
    v15 = (void *)MEMORY[0x1E0DC3888];
    v16 = objc_msgSend(a1, "scaleForTPScale:", a5);
    if (v14)
      objc_msgSend(v15, "paletteTpConfigurationWithStaticTextStyle:scale:colors:", v12, v16, v13);
    else
      objc_msgSend(v15, "tpConfigurationWithStaticTextStyle:scale:", v12, v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", v12, objc_msgSend(a1, "scaleForTPScale:", a5));
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
  objc_msgSend(a1, "tpImageForSymbolType:configuration:", a3, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)tpImageForSymbolType:()TelephonyUI scale:paletteColors:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0DC3888];
  v9 = a5;
  objc_msgSend(v8, "configurationWithScale:", objc_msgSend(a1, "scaleForTPScale:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPaletteColors:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "configurationByApplyingConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "tpImageForSymbolType:configuration:", a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)tpImageForSymbolType:()TelephonyUI textStyle:scale:symbolWeight:
{
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v10 = (void *)MEMORY[0x1E0DC3888];
  v11 = a4;
  v12 = objc_msgSend(a1, "scaleForTPScale:", a5);
  if (a6)
    objc_msgSend(v10, "tpConfigurationWithStaticTextStyle:scale:symbolWeight:", v11, v12, a6);
  else
    objc_msgSend(v10, "tpConfigurationWithStaticTextStyle:scale:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "tpImageForSymbolType:configuration:", a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)tpImageForSymbolType:()TelephonyUI pointSize:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tpImageForSymbolType:configuration:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)tpHierarchicalImageForSymbolType:()TelephonyUI pointSize:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((_os_feature_enabled_impl() & (v7 != 1)) != 0)
    v8 = 1;
  else
    v8 = 2;
  objc_msgSend(MEMORY[0x1E0DC3870], "tpHierarchicalImageForSymbolType:pointSize:scale:", a4, v8, a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)tpHierarchicalImageForSymbolType:()TelephonyUI pointSize:scale:
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  if (objc_msgSend(a1, "shouldBeHierarchicalSymbolType:"))
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 2, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationWithHierarchicalColor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configurationByApplyingConfiguration:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "tpImageForSymbolType:configuration:", a4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = *MEMORY[0x1E0DC4AE8];
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userInterfaceIdiom");

    _os_feature_enabled_impl();
    objc_msgSend(a1, "tpImageForSymbolType:textStyle:scale:isStaticSize:", a4, v15, a5, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

+ (const)customImageNameForSymbolType:()TelephonyUI
{
  if (a3 == 75)
    return CFSTR("b498");
  else
    return &stru_1E75FDD38;
}

+ (id)symbolNameForCurrentDevice
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__UIImage_TelephonyUI__symbolNameForCurrentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (symbolNameForCurrentDevice_onceToken != -1)
    dispatch_once(&symbolNameForCurrentDevice_onceToken, block);
  return (id)symbolNameForCurrentDevice_symbolName;
}

+ (uint64_t)fallbackSymbolTypeForCurrentDevice
{
  if (fallbackSymbolTypeForCurrentDevice_onceToken != -1)
    dispatch_once(&fallbackSymbolTypeForCurrentDevice_onceToken, &__block_literal_global_187);
  return fallbackSymbolTypeForCurrentDevice_symbolType;
}

- (id)imageWithEtchedBorderOfColor:()TelephonyUI radius:
{
  id v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;

  v6 = a4;
  objc_msgSend(a1, "size");
  v9 = v8 + a2 * 2.0;
  v10 = a2 <= 0.0;
  if (a2 <= 0.0)
    v11 = v7;
  else
    v11 = v7 + a2 * 2.0;
  if (v10)
    v12 = v8;
  else
    v12 = v9;
  objc_msgSend(a1, "scale");
  v14 = v13;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__UIImage_TelephonyUI__imageWithEtchedBorderOfColor_radius___block_invoke;
  v18[3] = &unk_1E75FD1E8;
  v18[4] = a1;
  v19 = v6;
  v15 = v6;
  TPCreateImageWithDrawing(v18, v11, v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)imageWithShadow:()TelephonyUI
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;

  v4 = a3;
  v5 = a1;
  objc_msgSend(v4, "shadowOffset");
  v7 = v6;
  v9 = v8;
  v10 = -v8;
  objc_msgSend(v4, "shadowBlurRadius");
  v12 = v11;
  objc_msgSend(v5, "scale");
  v14 = v13;
  objc_msgSend(v5, "size");
  v17 = v16 + v12 * 2.0;
  v18 = fabs(v9);
  if (v9 <= 0.0)
    v18 = 0.0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __40__UIImage_TelephonyUI__imageWithShadow___block_invoke;
  v24[3] = &unk_1E75FD210;
  v27 = v12;
  v28 = v14;
  v19 = v15 + v18 + v12 * 2.0;
  v29 = v7;
  v30 = v10;
  v25 = v4;
  v26 = v5;
  v20 = v5;
  v21 = v4;
  TPCreateImageWithDrawing(v24, v17, v19, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)telephonyUIImageNamed:()TelephonyUI
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleWithIdentifier:", CFSTR("com.apple.TelephonyUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)tpFlattenedWithColor:()TelephonyUI
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "imageWithRenderingMode:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)genericBusinessLogo
{
  if (genericBusinessLogo_onceToken != -1)
    dispatch_once(&genericBusinessLogo_onceToken, &__block_literal_global_198);
  return (id)genericBusinessLogo___businessLogo;
}

+ (void)currentDeviceRouteGlyphForDisplayStyle:()TelephonyUI .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "symbolNameForCurrentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2048;
  v9 = a2;
  _os_log_error_impl(&dword_1BCFA3000, a3, OS_LOG_TYPE_ERROR, "Failed to find current device route glyph with symbol name %@. Using fallback symbol type %zd.", (uint8_t *)&v6, 0x16u);

}

@end
