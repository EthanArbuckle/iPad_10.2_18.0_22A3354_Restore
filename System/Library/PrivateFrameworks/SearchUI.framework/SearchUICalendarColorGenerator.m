@implementation SearchUICalendarColorGenerator

- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v6 = a4;
  -[SearchUIColorGenerator sfColor](self, "sfColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__SearchUICalendarColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke;
  v10[3] = &unk_1EA1F64F0;
  v12 = a3;
  v11 = v6;
  v9 = v6;
  +[SearchUICalendarStore fetchCalendarItemFromEventIdentifier:completionHandler:](SearchUICalendarStore, "fetchCalendarItemFromEventIdentifier:completionHandler:", v8, v10);

}

void __75__SearchUICalendarColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGColor");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKAdjustedColorForColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "colorWithAlphaComponent:", 0.9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v10[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

      return;
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
  }
  (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
}

- (int)defaultTintStyle
{
  return 1;
}

@end
