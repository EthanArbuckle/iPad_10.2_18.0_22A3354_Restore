@implementation UIBoxInviteActivity

- (id)activityTitle
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[UIBoxInviteActivity isiWorkFile](self, "isiWorkFile"))
  {
    _ShareSheetBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BoxInvite[Activity]"), CFSTR("Invite People on Box"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIBoxInviteActivity;
    -[UIApplicationExtensionActivity activityTitle](&v6, sel_activityTitle);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_actionImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  if (-[UIBoxInviteActivity isiWorkFile](self, "isiWorkFile"))
  {
    v3 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("Box"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_opt_class();
    -[UIActivity contentSizeCategory](self, "contentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_actionImageForActionRepresentationImage:contentSizeCategory:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIBoxInviteActivity;
    -[UIApplicationExtensionActivity _actionImage](&v10, sel__actionImage);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_activityFooterText
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  if (!-[UIBoxInviteActivity isiWorkFile](self, "isiWorkFile"))
    return 0;
  -[UIBoxInviteActivity boxFooterText](self, "boxFooterText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIBoxInviteActivity boxFooterText](self, "boxFooterText");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _ShareSheetBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BOX_FOOTER_LINK"), CFSTR("Learn More…"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    _ShareSheetBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("BOX_FOOTER"), CFSTR("Collaborate with other people in real time on this file stored in Box. %@"), CFSTR("Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v23, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "length");
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v22);
    v26 = *MEMORY[0x1E0DC32A0];
    v10 = v26;
    v11 = *MEMORY[0x1E0DC4AB8];
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v12;
    v27 = *MEMORY[0x1E0DC32A8];
    v13 = v27;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v26, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAttributes:range:", v15, 0, objc_msgSend(v9, "length") - v8);
    v16 = *MEMORY[0x1E0DC32B8];
    v25[0] = CFSTR("https://support.apple.com/en-us/HT207876");
    v24[0] = v16;
    v24[1] = v10;
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v17;
    v24[2] = v13;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAttributes:range:", v19, objc_msgSend(v9, "length") - v8, v8);
    v20 = (void *)objc_msgSend(v9, "copy");
    -[UIBoxInviteActivity setBoxFooterText:](self, "setBoxFooterText:", v20);

    -[UIBoxInviteActivity boxFooterText](self, "boxFooterText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    return v21;
  }
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "isiWorkDocument"))
        {
          -[UIBoxInviteActivity setIsiWorkFile:](self, "setIsiWorkFile:", 1);
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  v12.receiver = self;
  v12.super_class = (Class)UIBoxInviteActivity;
  v10 = -[UIFileProviderApplicationExtensionActivity canPerformWithActivityItems:](&v12, sel_canPerformWithActivityItems_, v4);

  return v10;
}

- (BOOL)isiWorkFile
{
  return self->_isiWorkFile;
}

- (void)setIsiWorkFile:(BOOL)a3
{
  self->_isiWorkFile = a3;
}

- (NSAttributedString)boxFooterText
{
  return self->_boxFooterText;
}

- (void)setBoxFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxFooterText, 0);
}

@end
