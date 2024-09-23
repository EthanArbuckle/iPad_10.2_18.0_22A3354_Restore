@implementation RTLocationOfInterest

uint64_t __87__RTLocationOfInterest_RTCoreDataTransformable__createWithLearnedLocationOfInterestMO___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D183D8], "createWithManagedObject:", a2);
}

void __55__RTLocationOfInterest_RTStateModel__initWithOneState___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (objc_class *)MEMORY[0x1E0D183D8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "EntryExit_s");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entry_s");
  objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "EntryExit_s");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "exit_s");
  objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithLatitude:longitude:horizontalUncertainty:date:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v14 = (id)objc_msgSend(v5, "initWithIdentifier:entry:exit:location:locationOfInterestConfidence:locationOfInterestSource:", v6, v9, v12, v13, 0, 0.0);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
}

@end
