@implementation TICandidateGatingManager

+ (unint64_t)stickerUsageCountForApp:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  if (getSTKStickerUsageManagerClass() && (getSTKStickerUsageManagerClass(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    objc_msgSend(getSTKStickerUsageManagerClass(), "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "stickerCountsForBundleIdentifier:", v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
