@implementation UICollaborationInviteWithLinkActivity

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
  return 1;
}

- (int64_t)_defaultSortGroup
{
  return 1;
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.CollaborationInviteWithLink");
}

- (id)_activityImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0DC3870];
  _ShareSheetBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("CopyLinkActivity"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v4, "_applicationIconImageForFormat:precomposed:scale:", 10, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_activitySettingsImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0DC3870];
  _ShareSheetBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("CopyLinkActivity"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v4, "_applicationIconImageForFormat:precomposed:scale:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Link[Activity]"), CFSTR("Link"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 0;
}

- (BOOL)canPerformWithCollaborationItem:(id)a3 activityItems:(id)a4
{
  id v4;
  uint64_t v5;
  char v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5)
  {
    if (v5 != 2)
    {
      v7 = 1;
      goto LABEL_7;
    }
    v6 = objc_msgSend(v4, "isURLProviderSupported");
  }
  else
  {
    v6 = objc_msgSend(v4, "isiCloudDrive");
  }
  v7 = v6;
LABEL_7:

  return v7;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 0;
}

- (void)prepareWithActivityItems:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObjects:", v5);

}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (SFCollaborationItem)collaborationItem
{
  return self->_collaborationItem;
}

- (void)setCollaborationItem:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationItem, 0);
}

@end
