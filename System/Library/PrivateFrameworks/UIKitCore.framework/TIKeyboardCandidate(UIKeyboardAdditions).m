@implementation TIKeyboardCandidate(UIKeyboardAdditions)

- (id)icon
{
  return objc_getAssociatedObject(a1, &kKeyboardCandidateIconKey);
}

- (void)setIcon:()UIKeyboardAdditions
{
  objc_setAssociatedObject(a1, &kKeyboardCandidateIconKey, a3, (void *)1);
}

- (void)setCustomView:()UIKeyboardAdditions
{
  objc_setAssociatedObject(a1, &kKeyboardCandidateViewKey, a3, (void *)1);
}

- (id)customView
{
  return objc_getAssociatedObject(a1, &kKeyboardCandidateViewKey);
}

- (void)setHandler:()UIKeyboardAdditions
{
  id v4;

  v4 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, &kKeyboardCandidateHandlerKey, v4, (void *)1);

}

- (id)handler
{
  return objc_getAssociatedObject(a1, &kKeyboardCandidateHandlerKey);
}

- (uint64_t)isSlottedCandidate
{
  char isKindOfClass;

  if ((objc_msgSend(a1, "isSecureContentCandidate") & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)isAutofillCandidate
{
  return (objc_msgSend(a1, "customInfoType") & 0x66F8) != 0;
}

- (BOOL)isReplacement
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "input");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "length") != 0;

  return v2;
}

+ (const)imageNameForTextEffectsButton
{
  void *v0;
  void *v1;
  BOOL v2;
  void *v4;
  void *v5;
  uint64_t v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "userInterfaceIdiom"))
  {
    v2 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");

    if (!v2)
      return 0;
  }
  else
  {

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsTextAnimationsType");

  if (v6 == 2)
    return CFSTR("character.motion");
  else
    return 0;
}

+ (id)textEffectsButtonCandidate
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textEffectsButtonLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "imageNameForTextEffectsButton");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithCandidate:forInput:customInfoType:", &stru_1E16EDF20, &stru_1E16EDF20, 0x8000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), -1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 20.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationByApplyingConfiguration:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "_lightStyleRenderConfig"))
      v12 = 1;
    else
      v12 = 2;

    +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationWithTraitCollection:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configurationWithLocale:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v5, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIcon:", v17);

  }
  return v7;
}

@end
