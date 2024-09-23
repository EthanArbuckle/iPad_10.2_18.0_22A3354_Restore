@implementation SMSuggestion

void __64__SMSuggestion_RTCoreDataTransformable__createWithSuggestionMO___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;

  v2 = objc_alloc(MEMORY[0x1E0D8BA90]);
  v3 = (int)objc_msgSend(*(id *)(a1 + 32), "suggestionTrigger");
  v4 = (int)objc_msgSend(*(id *)(a1 + 32), "suggestionUserType");
  v5 = (int)objc_msgSend(*(id *)(a1 + 32), "suppressionReason");
  v6 = (int)objc_msgSend(*(id *)(a1 + 32), "sessionType");
  v7 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(*(id *)(a1 + 32), "sourceLocationLatitude");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "sourceLocationLongitude");
  v42 = (id)objc_msgSend(v7, "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v9, v10, 0.0);
  v11 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(*(id *)(a1 + 32), "destinationLocationLatitude");
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "destinationLocationLongitude");
  v15 = objc_msgSend(v11, "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v13, v14, 0.0);
  v16 = objc_alloc(MEMORY[0x1E0D8B910]);
  objc_msgSend(*(id *)(a1 + 32), "buddyEmail");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "buddyPhoneNumber");
  v18 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v16, "initWithEmail:phoneNumber:", v17, v18);
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v6;
  v40 = (void *)v15;
  v37 = (void *)v18;
  v38 = (void *)v17;
  if (v19)
  {
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v36 = (void *)v20;
      v21 = v2;
      objc_msgSend(*(id *)(a1 + 32), "startDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "endDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v22;
      if (objc_msgSend(v22, "compare:", v34) == -1)
      {
        v30 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(*(id *)(a1 + 32), "startDate");
        v31 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "endDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)v31;
        v24 = (void *)objc_msgSend(v30, "initWithStartDate:endDate:", v31);
        v25 = 1;
        v23 = 1;
      }
      else
      {
        v23 = 0;
        v24 = 0;
        v25 = 1;
      }
    }
    else
    {
      v21 = v2;
      v36 = 0;
      v25 = 0;
      v23 = 0;
      v24 = 0;
    }
  }
  else
  {
    v21 = v2;
    v25 = 0;
    v23 = 0;
    v24 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v21, "initWithSuggestionTrigger:suggestionUserType:suppressionReason:sessionType:sourceLocation:destinationLocation:buddy:dateInterval:creationDate:", v3, v4, v5, v39, v42, v40, v41, v24, v26);
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v27;

  if (v23)
  {

  }
  if (v25)
  {

  }
  if (v19)

}

@end
