@implementation _PSShareSheetEphemeralFeatureManager

- (_PSShareSheetEphemeralFeatureManager)initWithContext:(id)a3 candidates:(id)a4 caches:(id)a5 store:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _PSShareSheetEphemeralFeatureManager *v15;
  _PSShareSheetEphemeralFeatureManager *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_PSShareSheetEphemeralFeatureManager;
  v15 = -[_PSShareSheetEphemeralFeatureManager init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_candidates, a4);
    objc_storeStrong((id *)&v16->_caches, a5);
    objc_storeStrong((id *)&v16->_store, a6);
    v16->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v16->_lock);
    -[_PSShareSheetEphemeralFeatureManager setFeatureManagerProperties](v16, "setFeatureManagerProperties");
    os_unfair_lock_unlock(&v16->_lock);
  }

  return v16;
}

- (id)loadPSConfig
{
  void *v2;
  void *v3;
  id v4;

  +[_PSConfig defaultConfig](_PSConfig, "defaultConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA70];
  v4 = v2;

  return v4;
}

- (void)setFeatureManagerProperties
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSSet *features;
  NSSet *v19;
  void *v20;
  void *v21;
  double v22;
  NSNumber *v23;
  NSNumber *histogramSmoothingParameterK;
  void *v25;
  void *v26;
  double v27;
  NSNumber *v28;
  NSNumber *histogramSmoothingParameterV;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[_PSShareSheetEphemeralFeatureManager loadPSConfig](self, "loadPSConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (NSSet *)objc_opt_new();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("featureList"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E0C9AA60];
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMLSEVirtualFeatureStoreFeaturefeatureNameFromString(), v30);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet addObject:](v7, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v14);
    }

    features = self->_features;
    self->_features = v7;
    v19 = v7;

    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("histogramFeatureSmoothingK"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    if (v22 == 0.0)
      v22 = 1.0;
    objc_msgSend(v20, "numberWithDouble:", v22, v30);
    v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    histogramSmoothingParameterK = self->_histogramSmoothingParameterK;
    self->_histogramSmoothingParameterK = v23;

    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("histogramFeatureSmoothingV"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    if (v27 == 0.0)
      v27 = 10.0;
    objc_msgSend(v25, "numberWithDouble:", v27);
    v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    histogramSmoothingParameterV = self->_histogramSmoothingParameterV;
    self->_histogramSmoothingParameterV = v28;

  }
}

- (void)setCandidates:(id)a3
{
  NSSet *v4;
  NSSet *candidates;

  v4 = (NSSet *)a3;
  os_unfair_lock_lock(&self->_lock);
  candidates = self->_candidates;
  self->_candidates = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setContext:(id)a3
{
  _PSPredictionContext *v4;
  _PSPredictionContext *context;

  v4 = (_PSPredictionContext *)a3;
  os_unfair_lock_lock(&self->_lock);
  context = self->_context;
  self->_context = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)computeFeaturesWithHistogramFeatures:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSSet allObjects](self->_features, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C99D80]);
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke;
  v20[3] = &unk_1E4402150;
  v20[4] = self;
  v21 = v4;
  v10 = v4;
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_47);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithObjects:forKeys:", v11, v12);

  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke_3;
  v18[3] = &unk_1E4400C78;
  v14 = v5;
  v19 = v14;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
  os_unfair_lock_unlock(p_lock);
  v15 = v19;
  v16 = v14;

  return v16;
}

- (id)callFeatureFunctionWithFeature:(int)a3 histogramFeatureData:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  NSSet *candidates;
  NSArray *caches;
  void *v11;
  uint64_t v12;
  NSSet *v13;
  NSArray *v14;
  _CDInteractionStore *store;
  uint64_t v16;
  _PSPredictionContext *context;
  NSSet *v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C9AA70];
  switch((int)v4)
  {
    case 507:
      candidates = self->_candidates;
      caches = self->_caches;
      v11 = &unk_1E442CE68;
      goto LABEL_17;
    case 508:
      candidates = self->_candidates;
      caches = self->_caches;
      v11 = &unk_1E442CE80;
      goto LABEL_17;
    case 509:
      candidates = self->_candidates;
      caches = self->_caches;
      v11 = &unk_1E442CE98;
      goto LABEL_17;
    case 510:
      candidates = self->_candidates;
      caches = self->_caches;
      v11 = &unk_1E442CEB0;
      goto LABEL_17;
    case 511:
      candidates = self->_candidates;
      caches = self->_caches;
      v11 = &unk_1E442CF70;
      goto LABEL_17;
    case 512:
      candidates = self->_candidates;
      caches = self->_caches;
      v11 = &unk_1E442CEC8;
      goto LABEL_17;
    case 513:
      candidates = self->_candidates;
      caches = self->_caches;
      v11 = &unk_1E442CEF8;
      goto LABEL_20;
    case 514:
      candidates = self->_candidates;
      caches = self->_caches;
      v11 = &unk_1E442CF10;
      goto LABEL_20;
    case 515:
      candidates = self->_candidates;
      caches = self->_caches;
      v11 = &unk_1E442CF40;
      goto LABEL_20;
    case 516:
      candidates = self->_candidates;
      caches = self->_caches;
      v11 = &unk_1E442CF28;
LABEL_17:
      v12 = 0;
      goto LABEL_21;
    case 517:
      candidates = self->_candidates;
      caches = self->_caches;
      v11 = &unk_1E442CF58;
      goto LABEL_20;
    case 518:
      candidates = self->_candidates;
      caches = self->_caches;
      v11 = &unk_1E442CEE0;
LABEL_20:
      v12 = 1;
LABEL_21:
      +[_PSLastCommunicatedFeatures lastCommunicationFromCandidates:direction:mechanisms:caches:](_PSLastCommunicatedFeatures, "lastCommunicationFromCandidates:direction:mechanisms:caches:", candidates, v12, v11, caches);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 519:
    case 520:
    case 521:
    case 522:
    case 523:
    case 584:
    case 585:
    case 586:
    case 587:
    case 588:
    case 589:
    case 590:
    case 591:
    case 592:
    case 593:
    case 594:
    case 595:
    case 596:
    case 597:
    case 598:
    case 599:
    case 600:
    case 601:
    case 602:
    case 603:
    case 624:
    case 625:
    case 626:
    case 627:
    case 628:
    case 629:
    case 630:
    case 631:
    case 632:
    case 633:
      goto LABEL_33;
    case 524:
    case 526:
    case 528:
    case 530:
    case 532:
    case 534:
    case 536:
    case 538:
    case 540:
    case 542:
    case 544:
    case 546:
    case 548:
    case 550:
    case 552:
    case 554:
    case 556:
    case 558:
    case 560:
    case 562:
    case 564:
    case 566:
    case 568:
    case 570:
    case 572:
    case 574:
    case 576:
    case 578:
    case 580:
    case 582:
    case 604:
    case 606:
    case 608:
    case 610:
    case 612:
    case 614:
    case 616:
    case 618:
    case 620:
    case 622:
    case 634:
    case 636:
    case 638:
    case 640:
    case 642:
      +[_PSHistogramFeatures conditionedProbabilityAcrossAllBucketsWithCandidates:featureName:predictionContext:histogramFeatureData:histogramSmoothingParameterK:histogramSmoothingParameterV:](_PSHistogramFeatures, "conditionedProbabilityAcrossAllBucketsWithCandidates:featureName:predictionContext:histogramFeatureData:histogramSmoothingParameterK:histogramSmoothingParameterV:", self->_candidates, v4, self->_context, v6, self->_histogramSmoothingParameterK, self->_histogramSmoothingParameterV);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 525:
    case 527:
    case 529:
    case 531:
    case 533:
    case 535:
    case 537:
    case 539:
    case 541:
    case 543:
    case 545:
    case 547:
    case 549:
    case 551:
    case 553:
    case 555:
    case 557:
    case 559:
    case 561:
    case 563:
    case 565:
    case 567:
    case 569:
    case 571:
    case 573:
    case 575:
    case 577:
    case 579:
    case 581:
    case 583:
    case 605:
    case 607:
    case 609:
    case 611:
    case 613:
    case 615:
    case 617:
    case 619:
    case 621:
    case 623:
    case 635:
    case 637:
    case 639:
    case 641:
    case 643:
      +[_PSHistogramFeatures conditionedProbabilityAcrossAllCandidatesWithCandidates:featureName:predictionContext:histogramFeatureData:histogramSmoothingParameterK:histogramSmoothingParameterV:](_PSHistogramFeatures, "conditionedProbabilityAcrossAllCandidatesWithCandidates:featureName:predictionContext:histogramFeatureData:histogramSmoothingParameterK:histogramSmoothingParameterV:", self->_candidates, v4, self->_context, v6, self->_histogramSmoothingParameterK, self->_histogramSmoothingParameterV);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 644:
    case 645:
    case 646:
    case 647:
    case 648:
    case 649:
    case 650:
    case 651:
    case 652:
    case 653:
    case 654:
    case 655:
      +[_PSHistogramFeatures hasEverInBucketWithCandidates:featureName:predictionContext:histogramFeatureData:](_PSHistogramFeatures, "hasEverInBucketWithCandidates:featureName:predictionContext:histogramFeatureData:", self->_candidates, v4, self->_context, v6);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_32:
      v7 = (void *)v8;
LABEL_33:

      return v7;
    default:
      switch((int)v4)
      {
        case 328:
          +[_PSDeviceStateFeatures isInMeetingWithCandidates:caches:](_PSDeviceStateFeatures, "isInMeetingWithCandidates:caches:", self->_candidates, self->_caches);
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        case 329:
          v13 = self->_candidates;
          v14 = self->_caches;
          store = self->_store;
          v16 = 0;
          goto LABEL_24;
        case 330:
          v13 = self->_candidates;
          v14 = self->_caches;
          store = self->_store;
          v16 = 1;
LABEL_24:
          +[_PSDeviceStateFeatures isInCallWithCandidates:facetimeRequest:caches:store:](_PSDeviceStateFeatures, "isInCallWithCandidates:facetimeRequest:caches:store:", v13, v16, v14, store);
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        case 341:
          +[_PSContentFeatures utiTypesFromPredictionContext:candidates:](_PSContentFeatures, "utiTypesFromPredictionContext:candidates:", self->_context, self->_candidates);
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        case 342:
          +[_PSContentFeatures sourceAppFromPredictionContext:candidates:](_PSContentFeatures, "sourceAppFromPredictionContext:candidates:", self->_context, self->_candidates);
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        case 343:
          context = self->_context;
          v18 = self->_candidates;
          v19 = 0;
          goto LABEL_31;
        case 344:
          context = self->_context;
          v18 = self->_candidates;
          v19 = 1;
          goto LABEL_31;
        case 346:
          +[_PSContentFeatures urlTopLevelDomainFromPredictionContext:candidates:](_PSContentFeatures, "urlTopLevelDomainFromPredictionContext:candidates:", self->_context, self->_candidates);
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        case 349:
          context = self->_context;
          v18 = self->_candidates;
          v19 = 3;
LABEL_31:
          +[_PSContentFeatures numberOfContentFromPredictionContext:contentType:candidates:](_PSContentFeatures, "numberOfContentFromPredictionContext:contentType:candidates:", context, v19, v18);
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        default:
          goto LABEL_33;
      }
  }
}

- (NSNumber)histogramSmoothingParameterK
{
  return self->_histogramSmoothingParameterK;
}

- (void)setHistogramSmoothingParameterK:(id)a3
{
  objc_storeStrong((id *)&self->_histogramSmoothingParameterK, a3);
}

- (NSNumber)histogramSmoothingParameterV
{
  return self->_histogramSmoothingParameterV;
}

- (void)setHistogramSmoothingParameterV:(id)a3
{
  objc_storeStrong((id *)&self->_histogramSmoothingParameterV, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramSmoothingParameterV, 0);
  objc_storeStrong((id *)&self->_histogramSmoothingParameterK, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_caches, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
