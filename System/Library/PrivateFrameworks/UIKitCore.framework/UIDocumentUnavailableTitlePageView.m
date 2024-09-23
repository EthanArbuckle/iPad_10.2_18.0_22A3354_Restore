@implementation UIDocumentUnavailableTitlePageView

id __77___UIDocumentUnavailableTitlePageView__updateContentUnavailableConfiguration__block_invoke(void *a1, uint64_t a2, char a3, int a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) != 0)
  {
    +[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setButtonSize:", 3);
    objc_msgSend(v7, "setTitleAlignment:", 2);
    objc_msgSend(v7, "_setAlwaysApplyTitleAlignment:", 1);
    objc_msgSend(v7, "setCornerStyle:", 3);
    +[UIColor tintColor](UIColor, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBaseBackgroundColor:", v8);
  }
  else
  {
    +[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setButtonSize:", 3);
    objc_msgSend(v7, "setTitleAlignment:", 2);
    objc_msgSend(v7, "_setAlwaysApplyTitleAlignment:", 1);
    +[UIColor tintColor](UIColor, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBaseForegroundColor:", v8);
  }

  if (!a4)
  {
    v18 = *(_QWORD *)off_1E1678D90;
    objc_msgSend(off_1E167A828, "_preferredFontForTextStyle:weight:", CFSTR("UICTFontTextStyleBody"), *(double *)off_1E167DC78);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a1)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(a1, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v12, v10);
      objc_msgSend(v7, "setAttributedTitle:", v13);

      objc_msgSend(a1, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImage:", v14);
    }
    else
    {
      if (!a2)
      {
LABEL_11:

        return v7;
      }
      v15 = objc_alloc(MEMORY[0x1E0CB3498]);
      _UILocalizedString(CFSTR("com.apple.documents.moreAction.title"), (uint64_t)CFSTR("The title of the button that presents additional actions."), CFSTR("More..."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "initWithString:attributes:", v14, v10);
      objc_msgSend(v7, "setAttributedTitle:", v16);

    }
    goto LABEL_11;
  }
  objc_msgSend(v7, "setShowsActivityIndicator:", 1);
  return v7;
}

@end
