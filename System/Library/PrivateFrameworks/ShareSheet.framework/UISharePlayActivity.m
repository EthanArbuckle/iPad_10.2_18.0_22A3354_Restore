@implementation UISharePlayActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 3;
  else
    return 0;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (int64_t)_defaultSortGroup
{
  return 1;
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.SharePlay");
}

- (id)_systemImageName
{
  return CFSTR("shareplay");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SharePlay[Activity]"), CFSTR("SharePlay"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activityImage
{
  if (activityImage_onceToken != -1)
    dispatch_once(&activityImage_onceToken, &__block_literal_global_40);
  return (id)activityImage_transportImage;
}

void __36__UISharePlayActivity_activityImage__block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGContext *CurrentContext;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  id v19;
  CGImage *v20;
  id v21;
  double v22;
  CGFloat y;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  CGSize v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 2);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("shareplay"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "size");
    v3 = v2;
    objc_msgSend(v1, "size");
    v5 = v4;
    objc_msgSend(v1, "size");
    if (v3 <= v5)
      v6 = v7;
    v8 = v6 * 1.2;
    v30.width = v8;
    v30.height = v8;
    UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend(v1, "size");
    CGContextTranslateCTM(CurrentContext, 0.0, v10);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    CGContextSetBlendMode(CurrentContext, kCGBlendModeNormal);
    objc_msgSend(v1, "size");
    v12 = (v8 - v11) * 0.5 + 0.5;
    objc_msgSend(v1, "size");
    v14 = 1.0 - (v8 - v13) * 0.5;
    objc_msgSend(v1, "size");
    v16 = v15;
    objc_msgSend(v1, "size");
    v18 = v17;
    v19 = objc_retainAutorelease(v1);
    v20 = (CGImage *)objc_msgSend(v19, "CGImage");
    v31.origin.x = v12;
    v31.origin.y = v14;
    v31.size.width = v16;
    v31.size.height = v18;
    CGContextDrawImage(CurrentContext, v31, v20);
    CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceIn);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v21, "CGColor"));

    objc_msgSend(v19, "size");
    v32.origin.x = 0.0;
    v32.origin.y = -(v22 + 2.0);
    y = v32.origin.y;
    v32.size.width = v8;
    v32.size.height = v8 + 2.0;
    CGContextFillRect(CurrentContext, v32);
    CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationOver);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v24, "CGColor"));

    v33.origin.x = 0.0;
    v33.origin.y = y;
    v33.size.width = v8;
    v33.size.height = v8 + 2.0;
    CGContextFillRect(CurrentContext, v33);
    UIGraphicsGetImageFromCurrentImageContext();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)activityImage_transportImage;
    activityImage_transportImage = v25;

    UIGraphicsEndImageContext();
    objc_msgSend((id)activityImage_transportImage, "_applicationIconImageForFormat:precomposed:", 5, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)activityImage_transportImage;
    activityImage_transportImage = v27;

  }
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return +[UISharePlayActivity _canPerform](UISharePlayActivity, "_canPerform", a3);
}

+ (BOOL)_canPerform
{
  int v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint8_t v8[16];

  v2 = _os_feature_enabled_impl();
  if (v2)
  {
    if ((_ShareSheetSupportsSharePlayStartFromApp() & 1) != 0)
    {
      -[objc_class sharedInstance](getTUCallCenterClass(), "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "conversationManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isSharePlayAvailable");

      if ((v5 & 1) != 0)
      {
        LOBYTE(v2) = 1;
        return v2;
      }
      share_sheet_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[UISharePlayActivity _canPerform].cold.1(v6);
    }
    else
    {
      share_sheet_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "SharePlay: SharePlay is not supported because the app does not have the appropriate entitlement", v8, 2u);
      }
    }

    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  SHSheetGroupActivitySharingController *v15;
  SHSheetGroupActivitySharingController *groupActivitySharingController;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  +[SHSheetActivityItemUtilities itemProvidersFromActivityItems:](SHSheetActivityItemUtilities, "itemProvidersFromActivityItems:", a3);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
      +[SHSheetGroupActivity groupActivityType](SHSheetGroupActivity, "groupActivityType", (_QWORD)v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "hasItemConformingToTypeIdentifier:", v10);

      if ((v11 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v9;

    if (!v12)
      goto LABEL_14;
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v12;
      _os_log_impl(&dword_19E419000, v13, OS_LOG_TYPE_DEFAULT, "SharePlay: Found group activity for SharePlay activity: %@", buf, 0xCu);
    }

  }
  else
  {
LABEL_9:

LABEL_14:
    share_sheet_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E419000, v14, OS_LOG_TYPE_DEFAULT, "SharePlay: No group activities were found for SharePlay activity", buf, 2u);
    }

    v12 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  }
  v15 = -[SHSheetGroupActivitySharingController initWithItemProvider:]([SHSheetGroupActivitySharingController alloc], "initWithItemProvider:", v12);
  groupActivitySharingController = self->_groupActivitySharingController;
  self->_groupActivitySharingController = v15;

  -[SHSheetGroupActivitySharingController setDelegate:](self->_groupActivitySharingController, "setDelegate:", self);
}

- (SHSheetGroupActivitySharingController)groupActivitySharingController
{
  return self->_groupActivitySharingController;
}

- (void)setSessionID:(id)a3
{
  -[SHSheetGroupActivitySharingController setShareSheetSessionID:](self->_groupActivitySharingController, "setShareSheetSessionID:", a3);
}

- (void)_cleanup
{
  SHSheetGroupActivitySharingController *groupActivitySharingController;

  -[SHSheetGroupActivitySharingController setDelegate:](self->_groupActivitySharingController, "setDelegate:", 0);
  groupActivitySharingController = self->_groupActivitySharingController;
  self->_groupActivitySharingController = 0;

}

- (void)groupActivitySharingController:(id)a3 didFinish:(BOOL)a4
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", a4);
}

- (void)setGroupActivitySharingController:(id)a3
{
  objc_storeStrong((id *)&self->_groupActivitySharingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupActivitySharingController, 0);
}

+ (void)_canPerform
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "SharePlay: SharePlay is not supported because it is disabled at a system level", v1, 2u);
}

@end
