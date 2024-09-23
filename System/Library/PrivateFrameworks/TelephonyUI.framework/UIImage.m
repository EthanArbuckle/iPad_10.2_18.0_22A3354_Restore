@implementation UIImage

void __58__UIImage_TelephonyUI__recentsOutgoingAudioCallGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "recentsGlyphForSymbolType:", 4);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)recentsOutgoingAudioCallGlyphImage___sGlyphImage;
  recentsOutgoingAudioCallGlyphImage___sGlyphImage = v1;

}

void __44__UIImage_TelephonyUI__recentsTTYGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "recentsGlyphForSymbolType:", 28);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)recentsTTYGlyphImage___sGlyphImage;
  recentsTTYGlyphImage___sGlyphImage = v1;

}

void __58__UIImage_TelephonyUI__recentsOutgoingVideoCallGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "recentsGlyphForSymbolType:", 6);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)recentsOutgoingVideoCallGlyphImage___sGlyphImage;
  recentsOutgoingVideoCallGlyphImage___sGlyphImage = v1;

}

void __60__UIImage_TelephonyUI__telephonyUIUnreadIndicatorGlyphImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  UIImageGetUnreadIndicator();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)telephonyUIUnreadIndicatorGlyphImage___sGlyphImage;
  telephonyUIUnreadIndicatorGlyphImage___sGlyphImage = v0;

}

void __48__UIImage_TelephonyUI__favoritesAudioGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "favoritesGlyphForSymbolType:", 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)favoritesAudioGlyphImage___sGlyphImage;
  favoritesAudioGlyphImage___sGlyphImage = v1;

}

void __47__UIImage_TelephonyUI__favoritesMailGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "favoritesGlyphForSymbolType:", 15);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)favoritesMailGlyphImage___sGlyphImage;
  favoritesMailGlyphImage___sGlyphImage = v1;

}

void __50__UIImage_TelephonyUI__favoritesMessageGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "favoritesGlyphForSymbolType:", 13);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)favoritesMessageGlyphImage___sGlyphImage;
  favoritesMessageGlyphImage___sGlyphImage = v1;

}

void __52__UIImage_TelephonyUI__favoritesTTYDirectGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "favoritesGlyphForSymbolType:", 28);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)favoritesTTYDirectGlyphImage___sGlyphImage;
  favoritesTTYDirectGlyphImage___sGlyphImage = v1;

}

void __51__UIImage_TelephonyUI__favoritesTTYRelayGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "favoritesGlyphForSymbolType:", 28);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)favoritesTTYRelayGlyphImage___sGlyphImage;
  favoritesTTYRelayGlyphImage___sGlyphImage = v1;

}

void __48__UIImage_TelephonyUI__favoritesVideoGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "favoritesGlyphForSymbolType:", 5);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)favoritesVideoGlyphImage___sGlyphImage;
  favoritesVideoGlyphImage___sGlyphImage = v1;

}

void __58__UIImage_TelephonyUI__recentsIncomingAudioCallGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "recentsGlyphForSymbolType:", 81);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)recentsIncomingAudioCallGlyphImage___sGlyphImage;
  recentsIncomingAudioCallGlyphImage___sGlyphImage = v1;

}

void __58__UIImage_TelephonyUI__recentsIncomingVideoCallGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "recentsGlyphForSymbolType:", 83);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)recentsIncomingVideoCallGlyphImage___sGlyphImage;
  recentsIncomingVideoCallGlyphImage___sGlyphImage = v1;

}

void __53__UIImage_TelephonyUI__recentsVerifiedCheckmarkImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "recentsGlyphForSymbolType:", 35);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)recentsVerifiedCheckmarkImage___sCheckmarkImage;
  recentsVerifiedCheckmarkImage___sCheckmarkImage = v1;

}

void __46__UIImage_TelephonyUI__recentsRTTChevronImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "recentsGlyphForSymbolType:", 36);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)recentsRTTChevronImage___sChevronImage;
  recentsRTTChevronImage___sChevronImage = v1;

}

void __45__UIImage_TelephonyUI__recentsAudioCallImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "actionGlyphForSymbolType:", 80);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)recentsAudioCallImage___sAudioCallImage;
  recentsAudioCallImage___sAudioCallImage = v1;

}

void __45__UIImage_TelephonyUI__recentsVideoCallImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "actionGlyphForSymbolType:", 82);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)recentsVideoCallImage___sVideoCallImage;
  recentsVideoCallImage___sVideoCallImage = v1;

}

void __39__UIImage_TelephonyUI__mailActionImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "actionGlyphForSymbolType:", 15);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)mailActionImage___sMailActionImage;
  mailActionImage___sMailActionImage = v1;

}

void __43__UIImage_TelephonyUI__messagesActionImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "actionGlyphForSymbolType:", 13);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)messagesActionImage___sMessagesActionImage;
  messagesActionImage___sMessagesActionImage = v1;

}

void __38__UIImage_TelephonyUI__TTYActionImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "actionGlyphForSymbolType:", 28);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)TTYActionImage___sTTYActionImage;
  TTYActionImage___sTTYActionImage = v1;

}

void __53__UIImage_TelephonyUI__voicemailAudioRouteGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "voicemailGlyphForSymbolType:", 31);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)voicemailAudioRouteGlyphImage___sGlyphImage;
  voicemailAudioRouteGlyphImage___sGlyphImage = v1;

}

void __54__UIImage_TelephonyUI__voicemailDialRequestGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "voicemailGlyphForSymbolType:", 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)voicemailDialRequestGlyphImage___sGlyphImage;
  voicemailDialRequestGlyphImage___sGlyphImage = v1;

}

void __49__UIImage_TelephonyUI__voicemailDeleteGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "voicemailGlyphForSymbolType:", 32);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)voicemailDeleteGlyphImage___sGlyphImage;
  voicemailDeleteGlyphImage___sGlyphImage = v1;

}

void __51__UIImage_TelephonyUI__voicemailUndeleteGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "telephonyUIImageNamed:", CFSTR("trash.slash.fill_37x37"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)voicemailUndeleteGlyphImage___sGlyphImage;
  voicemailUndeleteGlyphImage___sGlyphImage = v1;

}

void __47__UIImage_TelephonyUI__voicemailPlayGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "voicemailGlyphForSymbolType:", 24);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)voicemailPlayGlyphImage___sGlyphImage;
  voicemailPlayGlyphImage___sGlyphImage = v1;

}

void __55__UIImage_TelephonyUI__voicemailPlayGlyphDisabledImage__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "voicemailPlayGlyphImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tpFlattenedWithColor:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)voicemailPlayGlyphDisabledImage___sGlyphImage;
  voicemailPlayGlyphDisabledImage___sGlyphImage = v2;

}

void __48__UIImage_TelephonyUI__voicemailPauseGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "voicemailGlyphForSymbolType:", 25);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)voicemailPauseGlyphImage___sGlyphImage;
  voicemailPauseGlyphImage___sGlyphImage = v1;

}

void __56__UIImage_TelephonyUI__voicemailPauseGlyphDisabledImage__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "voicemailPauseGlyphImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tpFlattenedWithColor:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)voicemailPauseGlyphDisabledImage___sGlyphImage;
  voicemailPauseGlyphDisabledImage___sGlyphImage = v2;

}

void __57__UIImage_TelephonyUI__voicemailReportFeedbackGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "voicemailGlyphForSymbolType:", 34);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)voicemailReportFeedbackGlyphImage___sGlyphImage;
  voicemailReportFeedbackGlyphImage___sGlyphImage = v1;

}

void __46__UIImage_TelephonyUI__voicemailTTYGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "voicemailGlyphForSymbolType:", 28);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)voicemailTTYGlyphImage___sGlyphImage;
  voicemailTTYGlyphImage___sGlyphImage = v1;

}

void __52__UIImage_TelephonyUI__videoMessageRecordGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "tpImageForSymbolType:textStyle:scale:symbolWeight:", 77, *MEMORY[0x1E0DC4B10], 2, 4);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)videoMessageRecordGlyphImage___sGlyphImage;
  videoMessageRecordGlyphImage___sGlyphImage = v1;

}

void __50__UIImage_TelephonyUI__symbolNameForCurrentDevice__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D3A838];
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeOfCurrentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v4, 1, 1, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v6)
  {
    TPDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50__UIImage_TelephonyUI__symbolNameForCurrentDevice__block_invoke_cold_1((uint64_t)v6, v7);

  }
  if (v5)
    objc_msgSend(v5, "name");
  else
    objc_msgSend(*(id *)(a1 + 32), "systemImageNameForSymbolType:", objc_msgSend(*(id *)(a1 + 32), "fallbackSymbolTypeForCurrentDevice"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)symbolNameForCurrentDevice_symbolName;
  symbolNameForCurrentDevice_symbolName = v8;

  TPDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = symbolNameForCurrentDevice_symbolName;
    _os_log_impl(&dword_1BCFA3000, v10, OS_LOG_TYPE_DEFAULT, "Initialized symbol name for current device: %@", buf, 0xCu);
  }

}

void __58__UIImage_TelephonyUI__fallbackSymbolTypeForCurrentDevice__block_invoke()
{
  int v0;
  void *v1;
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = MGGetSInt32Answer();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("iPod")) & 1) != 0)
  {
    v3 = 66;
  }
  else
  {
    v4 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPad"));
    v3 = 64;
    if (v0 != 2)
      v3 = 65;
    v5 = 62;
    if (v0 != 2)
      v5 = 63;
    if (v4)
      v3 = v5;
  }
  fallbackSymbolTypeForCurrentDevice_symbolType = v3;
  TPDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = fallbackSymbolTypeForCurrentDevice_symbolType;
    _os_log_impl(&dword_1BCFA3000, v6, OS_LOG_TYPE_DEFAULT, "Initialized fallback symbol type for current device: %zd", (uint8_t *)&v7, 0xCu);
  }

}

void __60__UIImage_TelephonyUI__imageWithEtchedBorderOfColor_radius___block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGImage *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGImage *Image;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v12 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage");
  CGImageGetWidth(v12);
  CGImageGetHeight(v12);
  UIRectCenteredIntegralRect();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  CGContextSaveGState(a2);
  v22.origin.x = a3;
  v22.origin.y = a4;
  v22.size.width = a5;
  v22.size.height = a6;
  CGContextDrawImage(a2, v22, v12);
  v23.origin.x = v14;
  v23.origin.y = v16;
  v23.size.width = v18;
  v23.size.height = v20;
  CGContextClipToMask(a2, v23, v12);
  v24.origin.x = a3;
  v24.origin.y = a4;
  v24.size.width = a5;
  v24.size.height = a6;
  CGContextClearRect(a2, v24);
  CGContextRestoreGState(a2);
  Image = CGBitmapContextCreateImage(a2);
  v25.origin.x = a3;
  v25.origin.y = a4;
  v25.size.width = a5;
  v25.size.height = a6;
  CGContextClearRect(a2, v25);
  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  CGContextDrawImage(a2, v26, v12);
  v27.origin.x = a3;
  v27.origin.y = a4;
  v27.size.width = a5;
  v27.size.height = a6;
  CGContextClipToMask(a2, v27, Image);
  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGColor"));
  v28.origin.x = a3;
  v28.origin.y = a4;
  v28.size.width = a5;
  v28.size.height = a6;
  CGContextFillRect(a2, v28);
  CGImageRelease(Image);
}

void __40__UIImage_TelephonyUI__imageWithShadow___block_invoke(uint64_t a1, CGContext *a2)
{
  void *v4;
  void *v5;
  char v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGColor *v13;
  CGImage *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGImage *v23;
  CGAffineTransform v24;
  CGSize v25;
  CGRect v26;

  objc_msgSend(*(id *)(a1 + 32), "shadowColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      v7 = *(double *)(a1 + 56);
      v8 = *(double *)(a1 + 48) * v7;
      CGAffineTransformMakeScale(&v24, v7, v7);
      v9 = *(double *)(a1 + 64);
      v10 = *(double *)(a1 + 72);
      v11 = v10 * v24.c + v24.a * v9;
      v12 = v10 * v24.d + v24.b * v9;
      v13 = (CGColor *)objc_msgSend(objc_retainAutorelease(v4), "CGColor");
      v25.width = v11;
      v25.height = v12;
      CGContextSetShadowWithColor(a2, v25, v8, v13);
    }
  }
  v14 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage");
  CGImageGetWidth(v14);
  CGImageGetHeight(v14);
  UIRectCenteredIntegralRect();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage");
  v26.origin.x = v16;
  v26.origin.y = v18;
  v26.size.width = v20;
  v26.size.height = v22;
  CGContextDrawImage(a2, v26, v23);

}

void __43__UIImage_TelephonyUI__genericBusinessLogo__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("building.2.fill"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 24.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "configurationWithFont:", v2);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "imageByApplyingSymbolConfiguration:", v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(v3, "size");
  v6 = v5 * 2.0 + 12.0;
  objc_msgSend(v3, "size");
  v8 = (void *)objc_msgSend(v4, "initWithSize:", v6, v7 * 2.0 + 12.0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__UIImage_TelephonyUI__genericBusinessLogo__block_invoke_2;
  v13[3] = &unk_1E75FD258;
  v14 = v3;
  v9 = v3;
  objc_msgSend(v8, "imageWithActions:", v13);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)genericBusinessLogo___businessLogo;
  genericBusinessLogo___businessLogo = v10;

}

void __43__UIImage_TelephonyUI__genericBusinessLogo__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a2;
  objc_msgSend(v3, "lightGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFill");

  objc_msgSend(v4, "format");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v4, "fillRect:");

  objc_msgSend(*(id *)(a1 + 32), "size");
  v8 = v7 + v7;
  objc_msgSend(*(id *)(a1 + 32), "size");
  v10 = v9 + v9;
  v11 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageWithTintColor:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "drawInRect:", 6.0, 6.0, v8, v10);

}

void __50__UIImage_TelephonyUI__symbolNameForCurrentDevice__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCFA3000, a2, OS_LOG_TYPE_ERROR, "Error finding symbol for current device: %@", (uint8_t *)&v2, 0xCu);
}

@end
