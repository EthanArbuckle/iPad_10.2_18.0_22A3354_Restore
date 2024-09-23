@implementation NSError(WFMDM)

+ (id)sharingMixedMDMContentErrorWithActionName:()WFMDM
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  WFLocalizedString(CFSTR("Sharing content that contains both managed and unmanaged data is not allowed."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, *MEMORY[0x1E0CB2D50], 0);

  if (v4)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Couldn’t Run “%@”"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v9, v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setObject:forKey:", v10, *MEMORY[0x1E0CB2D68]);
  }
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
