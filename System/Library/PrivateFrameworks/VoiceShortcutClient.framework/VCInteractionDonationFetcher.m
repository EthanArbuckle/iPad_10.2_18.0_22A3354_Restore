@implementation VCInteractionDonationFetcher

+ (id)streams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15AF8], "appIntentsStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)donationWithInteractionIdentifier:(id)a3 applicationBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    v8 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(MEMORY[0x1E0D15AF0], "intentsSourceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateForEventsWithSourceID:bundleID:itemIDs:", v9, v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "fetchDonationsWithPredicate:limit:filteringForTopLevel:", v11, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
