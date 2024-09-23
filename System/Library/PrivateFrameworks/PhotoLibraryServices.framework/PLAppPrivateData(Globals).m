@implementation PLAppPrivateData(Globals)

- (BOOL)getCachedIsReadyForAnalysisFromSavedState
{
  void *v2;
  void *v3;

  objc_msgSend(CFSTR("GlobalValue"), "stringByAppendingPathExtension:", CFSTR("isReadyForAnalysisDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForKeyPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (void)saveCachedIsReadyForAnalysis:()Globals
{
  int v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(a1, "getCachedIsReadyForAnalysisFromSavedState");
  if (a3)
  {
    if ((v5 & 1) != 0)
      return;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("GlobalValue"), "stringByAppendingPathExtension:", CFSTR("isReadyForAnalysisDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forKeyPath:", v7, v6);

  }
  else
  {
    if (!v5)
      return;
    objc_msgSend(CFSTR("GlobalValue"), "stringByAppendingPathExtension:", CFSTR("isReadyForAnalysisDate"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forKeyPath:", 0, v7);
  }

}

@end
