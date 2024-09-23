@implementation UIActivityContinuationAction(AppSuggestion)

- (uint64_t)initWithIdentifier:()AppSuggestion activityTypeIdentifier:appSuggestion:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = v11;
  if (v8)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, &unk_1E91D0CB0);
  if (v9)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, &unk_1E91D0CC8);
  objc_msgSend(v10, "originatingDeviceType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v10, "originatingDeviceType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, &unk_1E91D0CE0);

  }
  objc_msgSend(v10, "originatingDeviceName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v10, "originatingDeviceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, &unk_1E91D0CF8);

  }
  objc_msgSend(v10, "activityType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v10, "activityType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, &unk_1E91D0D10);

  }
  objc_msgSend(v10, "lastUpdateTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v10, "lastUpdateTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, &unk_1E91D0D28);

  }
  v21 = objc_msgSend(a1, "initWithSettings:", v12);

  return v21;
}

@end
