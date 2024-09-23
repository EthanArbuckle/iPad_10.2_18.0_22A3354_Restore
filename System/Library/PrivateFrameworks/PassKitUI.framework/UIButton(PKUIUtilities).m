@implementation UIButton(PKUIUtilities)

- (void)pkui_updateConfigurationWithTitle:()PKUIUtilities
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v4 = a3;
  objc_msgSend(a1, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "attributesAtIndex:longestEffectiveRange:inRange:", 0, 0, 0, objc_msgSend(v6, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }
  if (v4)
    v8 = v4;
  else
    v8 = &stru_1E3E7D690;
  v11 = (__CFString *)v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v8, v7);
  objc_msgSend(a1, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedTitle:", v9);
  objc_msgSend(a1, "setConfiguration:", v10);

}

- (void)pkui_updateConfigurationWithFont:()PKUIUtilities
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v10 = *MEMORY[0x1E0DC1138];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAttributes:range:", v8, 0, objc_msgSend(v7, "length"));
  objc_msgSend(a1, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedTitle:", v7);
  objc_msgSend(a1, "setConfiguration:", v9);

}

- (void)pkui_updateConfigurationWithImage:()PKUIUtilities
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  objc_msgSend(a1, "setConfiguration:", v5);
}

- (void)pkui_updateConfigurationShowingActivityIndicator:()PKUIUtilities
{
  id v5;

  objc_msgSend(a1, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsActivityIndicator:", a3);
  objc_msgSend(a1, "setConfiguration:", v5);

}

@end
