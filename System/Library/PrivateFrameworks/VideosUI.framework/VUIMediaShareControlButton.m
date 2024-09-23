@implementation VUIMediaShareControlButton

+ (id)shareControlItemForMediaItem:(id)a3 inPlayerViewController:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;

  v4 = a3;
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:", CFSTR("MEDIA_SHARE_BUTTON_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaShareControlButton perfectlyCenteredShareImage](VUIMediaShareControlButton, "perfectlyCenteredShareImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B408]), "initWithTitle:type:", v6, 0);
  objc_msgSend(v8, "setImage:", v7);
  objc_msgSend(v4, "mediaItemMetadataForProperty:", CFSTR("showMediaShareMetadata"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v25 = v7;
    v27 = (void *)v9;
    v28 = v6;
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("chevron.right"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    objc_msgSend(v4, "mediaItemMetadataForProperty:", CFSTR("mediaShareMetadata"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "vui_stringForKey:", CFSTR("menuTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC3428];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __82__VUIMediaShareControlButton_shareControlItemForMediaItem_inPlayerViewController___block_invoke;
    v34[3] = &unk_1E9F9B548;
    v16 = v4;
    v35 = v16;
    v24 = v13;
    v36 = v24;
    v26 = (void *)v14;
    objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v14, v11, 0, v34);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v17);
    objc_msgSend(v16, "mediaItemMetadataForProperty:", CFSTR("showMediaShareMetadata"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "vui_stringForKey:", CFSTR("menuTitle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
    {
      v20 = (void *)MEMORY[0x1E0DC3428];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __82__VUIMediaShareControlButton_shareControlItemForMediaItem_inPlayerViewController___block_invoke_2;
      v31[3] = &unk_1E9F9B548;
      v32 = v16;
      v33 = v18;
      objc_msgSend(v20, "actionWithTitle:image:identifier:handler:", v19, v11, 0, v31);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v21);

    }
    v7 = v25;
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9FF3598, v25, 0, 1, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMenu:", v22);

    v10 = v27;
    v6 = v28;
  }
  else
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __82__VUIMediaShareControlButton_shareControlItemForMediaItem_inPlayerViewController___block_invoke_3;
    v29[3] = &unk_1E9F98DF0;
    v30 = v4;
    objc_msgSend(v8, "setAction:", v29);
    v11 = v30;
  }

  return v8;
}

uint64_t __82__VUIMediaShareControlButton_shareControlItemForMediaItem_inPlayerViewController___block_invoke(uint64_t a1)
{
  return +[VUIMediaShareCoordinator shareMediaItem:metadata:](VUIMediaShareCoordinator, "shareMediaItem:metadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __82__VUIMediaShareControlButton_shareControlItemForMediaItem_inPlayerViewController___block_invoke_2(uint64_t a1)
{
  return +[VUIMediaShareCoordinator shareMediaItem:metadata:](VUIMediaShareCoordinator, "shareMediaItem:metadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __82__VUIMediaShareControlButton_shareControlItemForMediaItem_inPlayerViewController___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mediaItemMetadataForProperty:", CFSTR("mediaShareMetadata"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[VUIMediaShareCoordinator shareMediaItem:metadata:](VUIMediaShareCoordinator, "shareMediaItem:metadata:", *(_QWORD *)(a1 + 32), v2);

}

+ (id)perfectlyCenteredShareImage
{
  if (perfectlyCenteredShareImage___once != -1)
    dispatch_once(&perfectlyCenteredShareImage___once, &__block_literal_global_29);
  return (id)perfectlyCenteredShareImage_shareImageSymbol;
}

void __57__VUIMediaShareControlButton_perfectlyCenteredShareImage__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  CGContext *CurrentContext;
  CGFloat v12;
  CGFloat v13;
  id v14;
  CGImage *v15;
  uint64_t v16;
  void *v17;
  id v18;
  CGSize v19;
  CGRect v20;
  CGRect v21;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 18.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "size");
  v5 = v4 + 5.0;
  objc_msgSend(v3, "size");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;
  v19.width = v7;
  v19.height = v5;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v10);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, 0.0, v5);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v18 = objc_retainAutorelease(v0);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v18, "CGColor"));
  v12 = v7 + -2.0;
  v13 = v5 + -5.0;
  v20.origin.x = 1.0;
  v20.origin.y = 5.0;
  v20.size.width = v12;
  v20.size.height = v13;
  CGContextFillRect(CurrentContext, v20);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationIn);
  v14 = objc_retainAutorelease(v3);
  v15 = (CGImage *)objc_msgSend(v14, "CGImage");
  v21.origin.x = 1.0;
  v21.origin.y = 5.0;
  v21.size.width = v12;
  v21.size.height = v13;
  CGContextDrawImage(CurrentContext, v21, v15);
  UIGraphicsGetImageFromCurrentImageContext();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)perfectlyCenteredShareImage_shareImageSymbol;
  perfectlyCenteredShareImage_shareImageSymbol = v16;

  UIGraphicsEndImageContext();
}

@end
