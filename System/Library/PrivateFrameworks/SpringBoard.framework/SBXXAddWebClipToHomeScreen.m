@implementation SBXXAddWebClipToHomeScreen

void ___SBXXAddWebClipToHomeScreen_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  UIImage *v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearDesiredIconState");
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CEAC08], "webClipWithIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "initialLaunchImage");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scale");
      SBScaleSuffixForScale(v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v26 = (void *)v8;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Main/Default%@.png"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "applicationWithBundleIdentifier:", CFSTR("com.apple.webapp"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "_snapshotManifest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "containerPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingPathComponent:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)v9;
      objc_msgSend(v15, "stringByAppendingPathComponent:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByStandardizingPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v17, "hasPrefix:", v13))
      {
        objc_msgSend(v17, "stringByDeletingLastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "fileExistsAtPath:isDirectory:", v18, 0) & 1) == 0)
          objc_msgSend(v24, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, 0, 0);
        UIImagePNGRepresentation(v5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "writeToFile:options:error:", v17, 0x10000000, 0);

      }
    }
    v20 = (id)objc_msgSend(MEMORY[0x1E0DA9F80], "sanitizeWebClip:", v4);
    objc_msgSend(v3, "addBookmarkIconForWebClip:", v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      if (SBWorkspaceSpringBoardIsActive())
        v22 = 12;
      else
        v22 = 14;
      objc_msgSend(v2, "addNewIconToDesignatedLocation:options:", v21, v22);
    }
    objc_msgSend((id)SBApp, "noteInstalledWebClipsDidChange");
    objc_msgSend(MEMORY[0x1E0CF8CA0], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "notifyBookmarksDidChange");

  }
}

@end
