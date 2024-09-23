@implementation RTPeopleDensity

void __70__RTPeopleDensity_RTCoreDataTransformable__createWithPeopleDensityMO___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = objc_alloc(MEMORY[0x1E0D18410]);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "densityScore");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "scanDuration");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "rssiHistogram");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v2, "initWithBundleUUID:startDate:endDate:densityScore:scanDuration:rssiHistogram:", v13, v3, v4, v9, v6, v8);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

@end
