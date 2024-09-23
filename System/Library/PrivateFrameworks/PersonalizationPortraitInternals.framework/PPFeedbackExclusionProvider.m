@implementation PPFeedbackExclusionProvider

+ (id)excludedBundleIdsForClientBundleId:(int)a3 domain:
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;

  v4 = a2;
  objc_opt_self();
  if (!v4)
    goto LABEL_10;
  if (!a3)
  {
    v9 = *MEMORY[0x1E0D70E38];
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D70E38]))
    {
      v6 = (void *)MEMORY[0x1C3BD6630]();
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v9, 0, v12, v13);
      goto LABEL_9;
    }
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  if (a3 != 2 && a3 != 1)
    goto LABEL_10;
  v5 = *MEMORY[0x1E0D70E20];
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D70E20]))
    goto LABEL_10;
  v6 = (void *)MEMORY[0x1C3BD6630]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_msgSend(v7, "initWithObjects:", v5, *MEMORY[0x1E0D70DD8], *MEMORY[0x1E0D70DC0], 0);
LABEL_9:
  v10 = (void *)v8;
  objc_autoreleasePoolPop(v6);
LABEL_11:

  return v10;
}

@end
