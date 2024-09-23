@implementation RTProximityEvent

void __72__RTProximityEvent_RTCoreDataTransformable__createWithProximityEventMO___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v2 = objc_alloc(MEMORY[0x1E0D18458]);
  objc_msgSend(*(id *)(a1 + 32), "eventID");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "relationship");
  objc_msgSend(*(id *)(a1 + 32), "socialScore");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "frequencyTransformable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recencyTransformable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "significanceTransformable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v2, "initWithEventID:startDate:endDate:relationship:socialScore:combinedFrequencyScores:combinedRecencyScores:combinedSignificanceScores:", v14, v3, v4, v5, v8, v9, v7, v10);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

@end
