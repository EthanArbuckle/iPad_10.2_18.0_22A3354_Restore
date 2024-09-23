@implementation SBAdvanceDateOverrideTestRecipe

- (id)title
{
  return CFSTR("Advance Date Override");
}

- (void)advanceOverrideDateByAmount:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DA9DE8], "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overrideDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, a3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setOverrideDate:", v6);
}

- (void)handleVolumeIncrease
{
  -[SBAdvanceDateOverrideTestRecipe advanceOverrideDateByAmount:](self, "advanceOverrideDateByAmount:", 1);
}

- (void)handleVolumeDecrease
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DA9DE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOverrideDate:", 0);

}

@end
