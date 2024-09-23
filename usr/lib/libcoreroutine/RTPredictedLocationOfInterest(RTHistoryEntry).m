@implementation RTPredictedLocationOfInterest(RTHistoryEntry)

- (uint64_t)initWithHistoryEntryRoute:()RTHistoryEntry
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithHistoryEntryRoute:", v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D184C8]);
    objc_msgSend(v4, "usageDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUsageDate:navigationWasInterrupted:", v7, objc_msgSend(v4, "navigationWasInterrupted"));

    v9 = objc_alloc(MEMORY[0x1E0D18450]);
    if (objc_msgSend(v4, "navigationWasInterrupted"))
      v10 = 1.0;
    else
      v10 = 0.0;
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithLocationOfInterest:confidence:nextEntryTime:modeOfTransportation:sources:", v5, 0, 0, v11, v10);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (uint64_t)initWithHistoryEntryPlaceDisplay:()RTHistoryEntry
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithHistoryEntryPlaceDisplay:", v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D184C0]);
    objc_msgSend(v4, "usageDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUsageDate:", v7);

    v9 = objc_alloc(MEMORY[0x1E0D18450]);
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithLocationOfInterest:confidence:nextEntryTime:modeOfTransportation:sources:", v5, 0, 0, v10, 0.0);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
