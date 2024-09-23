@implementation CSProminentDisplayViewController(PRAdditions)

- (uint64_t)pr_setAlternateDateEnabled:()PRAdditions
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "addObserver:selector:name:object:", a1, sel__pr_updateAlternateCalendarIdentifier, *MEMORY[0x1E0D0CB50], 0);

    return objc_msgSend(a1, "_pr_updateAlternateCalendarIdentifier");
  }
  else
  {
    objc_msgSend(v5, "removeObserver:name:object:", a1, *MEMORY[0x1E0D0CB50], 0);

    return objc_msgSend(a1, "setAlternateCalendarIdentifier:locale:", 0, 0);
  }
}

- (void)_pr_updateAlternateCalendarIdentifier
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayCalendarID");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D3EFB0], "localeForCalendarID:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setAlternateCalendarIdentifier:locale:", v4, v3);

  }
  else
  {
    objc_msgSend(a1, "setAlternateCalendarIdentifier:locale:", 0, 0);
  }

}

@end
