@implementation UIColor

void __26__UIColor_IC__ICTintColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = __26__UIColor_IC__ICTintColor__block_invoke_2(a1, CFSTR("tintColorRed"));
  if (v2 == -1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("notes_tint_color"), v9, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)ICTintColor_color;
    ICTintColor_color = v7;

  }
  else
  {
    v3 = __26__UIColor_IC__ICTintColor__block_invoke_2(v1, CFSTR("tintColorGreen"));
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v2 / 255.0, v3 / 255.0, __26__UIColor_IC__ICTintColor__block_invoke_2(v4, CFSTR("tintColorBlue")) / 255.0, 1.0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)ICTintColor_color;
    ICTintColor_color = v5;

    sUsingCustomTintColor = 1;
  }
}

double __26__UIColor_IC__ICTintColor__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  char v8;
  double v9;

  v2 = (void *)MEMORY[0x1E0C99EA0];
  v3 = a2;
  objc_msgSend(v2, "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -1.0;
  if (v5)
  {
    objc_opt_class();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", &stru_1E5C2F8C0);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v5, "doubleValue");
      v6 = v9;
    }
  }

  return v6;
}

void __40__UIColor_IC__preferredDefaultFontColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v0 = (void *)MEMORY[0x1E0DC3658];
  v1 = (void *)MEMORY[0x1E0CB34D0];
  ICUIFrameworkBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("default_body_text_color"), v3, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) == 0)
  {
    v7 = v8;
    v4 = (void *)preferredDefaultFontColor_sDefaultFontColor;
    preferredDefaultFontColor_sDefaultFontColor = (uint64_t)v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_resolvedColorForLightUserInterfaceStyle");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)preferredDefaultFontColor_sDefaultFontColor;
    preferredDefaultFontColor_sDefaultFontColor = v5;

  }
}

void __37__UIColor_IC__ICTintedSelectionColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("notes_selection_tint_color"), v2, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ICTintedSelectionColor_sTintedSelectionColor;
  ICTintedSelectionColor_sTintedSelectionColor = v0;

}

void __54__UIColor_IC__ICSelectedAttachmentBrickHighlightColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:", CFSTR("selected_search_highlight"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ICSelectedAttachmentBrickHighlightColor_color;
  ICSelectedAttachmentBrickHighlightColor_color = v0;

}

void __46__UIColor_NotesColors__ic_notesAppYellowColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3658]), "initWithRed:green:blue:alpha:", 0.917647059, 0.733333333, 0.0, 1.0);
  objc_msgSend(v2, "ic_resolvedColorForNoteEditor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ic_notesAppYellowColor_appYellowColor;
  ic_notesAppYellowColor_appYellowColor = v0;

}

void __48__UIColor_NotesColors__ic_notesDefaultTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.270588235, 0.270588235, 0.270588235, 1.0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_resolvedColorForNoteEditor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ic_notesDefaultTextColor_defaultTextColor;
  ic_notesDefaultTextColor_defaultTextColor = v0;

}

@end
