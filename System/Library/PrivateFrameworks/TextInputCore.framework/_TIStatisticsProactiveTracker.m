@implementation _TIStatisticsProactiveTracker

- (_TIStatisticsProactiveTracker)init
{
  _TIStatisticsProactiveTracker *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  PETScalarEventTracker *failureEventDescriptionTracker;
  id v18;
  void *v19;
  uint64_t v20;
  PETScalarEventTracker *failureCategoryEventDescriptionTracker;
  id v22;
  void *v23;
  uint64_t v24;
  PETScalarEventTracker *engagementEventDescriptionTracker;
  id v26;
  void *v27;
  uint64_t v28;
  PETScalarEventTracker *engagementCategoryEventDescriptionTracker;
  id v30;
  void *v31;
  uint64_t v32;
  PETScalarEventTracker *triggeredEventTracker;
  id v34;
  void *v35;
  uint64_t v36;
  PETScalarEventTracker *triggeredCategoryEventTracker;
  id v38;
  void *v39;
  uint64_t v40;
  PETScalarEventTracker *suggestedEventTracker;
  id v42;
  void *v43;
  uint64_t v44;
  PETScalarEventTracker *suggestedCategoryEventTracker;
  id v46;
  void *v47;
  uint64_t v48;
  PETScalarEventTracker *failureEventTracker;
  id v50;
  void *v51;
  uint64_t v52;
  PETScalarEventTracker *failureCategoryEventTracker;
  id v54;
  void *v55;
  uint64_t v56;
  PETScalarEventTracker *selectedEventTracker;
  id v58;
  void *v59;
  uint64_t v60;
  PETScalarEventTracker *selectedCategoryEventTracker;
  id v62;
  void *v63;
  uint64_t v64;
  PETDistributionEventTracker *timeInPredictionBarEventTracker;
  id v66;
  void *v67;
  uint64_t v68;
  PETDistributionEventTracker *timeInPredictionBarCategoryEventTracker;
  id v70;
  uint64_t v71;
  uint64_t v72;
  PETScalarEventTracker *personalizationWordAcceptanceTracker;
  uint64_t v74;
  PETScalarEventTracker *personalizationOfferTracker;
  uint64_t v76;
  PETScalarEventTracker *personalizationEngagementTracker;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  objc_super v88;
  _QWORD v89[5];
  _QWORD v90[4];
  _QWORD v91[5];
  _QWORD v92[4];
  _QWORD v93[5];
  _QWORD v94[4];
  _QWORD v95[5];
  _QWORD v96[4];
  _QWORD v97[4];
  _QWORD v98[3];
  _QWORD v99[5];
  _QWORD v100[4];
  _QWORD v101[5];
  _QWORD v102[4];
  _QWORD v103[3];
  _QWORD v104[3];
  _QWORD v105[3];
  _QWORD v106[5];

  v106[3] = *MEMORY[0x1E0C80C00];
  v88.receiver = self;
  v88.super_class = (Class)_TIStatisticsProactiveTracker;
  v2 = -[_TIStatisticsProactiveTracker init](&v88, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D80F20];
    v105[0] = &unk_1EA1402D0;
    v105[1] = &unk_1EA1402E8;
    v106[0] = CFSTR("LanguageModeling");
    v106[1] = CFSTR("ResponseKit");
    v105[2] = &unk_1EA140300;
    v106[2] = CFSTR("TaggedTextField");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertyWithName:enumMapping:", CFSTR("source"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("locale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticsCategoryToLegacyCategoryDictionary();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    TIStatisticsDescriptionToLegacyDescriptionDictionary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    TIStatisticsEngagementDescriptionToLegacyDescriptionDictionary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("category"), v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("count"), &unk_1EA13FF58);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D80F20];
    v103[0] = &unk_1EA1402E8;
    v103[1] = &unk_1EA140300;
    v104[0] = CFSTR("NoResult");
    v104[1] = CFSTR("Error");
    v103[2] = &unk_1EA140318;
    v104[2] = CFSTR("Timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyWithName:enumMapping:", CFSTR("reason"), v11);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("description"), v81);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("description"), v80);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("position"), &unk_1EA13FF70);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("position"), &unk_1EA13FF88);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("fieldType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0D80F38]);
    v102[0] = v5;
    v102[1] = v12;
    v102[2] = v6;
    v102[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("zeroSuggDesc"), v15);
    failureEventDescriptionTracker = v2->_failureEventDescriptionTracker;
    v2->_failureEventDescriptionTracker = (PETScalarEventTracker *)v16;

    v18 = objc_alloc(MEMORY[0x1E0D80F38]);
    v101[0] = v5;
    v101[1] = v12;
    v101[2] = v83;
    v101[3] = v6;
    v101[4] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("zeroSuggDesc_category"), v19);
    failureCategoryEventDescriptionTracker = v2->_failureCategoryEventDescriptionTracker;
    v2->_failureCategoryEventDescriptionTracker = (PETScalarEventTracker *)v20;

    v22 = objc_alloc(MEMORY[0x1E0D80F38]);
    v100[0] = v5;
    v100[1] = v87;
    v100[2] = v6;
    v100[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("zeroEngageDesc"), v23);
    engagementEventDescriptionTracker = v2->_engagementEventDescriptionTracker;
    v2->_engagementEventDescriptionTracker = (PETScalarEventTracker *)v24;

    v26 = objc_alloc(MEMORY[0x1E0D80F38]);
    v99[0] = v5;
    v99[1] = v87;
    v99[2] = v83;
    v99[3] = v6;
    v99[4] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "initWithFeatureId:event:registerProperties:");
    engagementCategoryEventDescriptionTracker = v2->_engagementCategoryEventDescriptionTracker;
    v2->_engagementCategoryEventDescriptionTracker = (PETScalarEventTracker *)v28;

    v30 = objc_alloc(MEMORY[0x1E0D80F38]);
    v98[0] = v5;
    v98[1] = v6;
    v98[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("triggered"), v31);
    triggeredEventTracker = v2->_triggeredEventTracker;
    v2->_triggeredEventTracker = (PETScalarEventTracker *)v32;

    v34 = objc_alloc(MEMORY[0x1E0D80F38]);
    v97[0] = v5;
    v97[1] = v83;
    v97[2] = v6;
    v97[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("triggered_category"), v35);
    triggeredCategoryEventTracker = v2->_triggeredCategoryEventTracker;
    v2->_triggeredCategoryEventTracker = (PETScalarEventTracker *)v36;

    v38 = objc_alloc(MEMORY[0x1E0D80F38]);
    v96[0] = v5;
    v96[1] = v84;
    v96[2] = v6;
    v96[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("suggested"), v39);
    suggestedEventTracker = v2->_suggestedEventTracker;
    v2->_suggestedEventTracker = (PETScalarEventTracker *)v40;

    v42 = objc_alloc(MEMORY[0x1E0D80F38]);
    v95[0] = v5;
    v95[1] = v84;
    v95[2] = v83;
    v95[3] = v6;
    v95[4] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 5);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("suggested_category"), v43);
    suggestedCategoryEventTracker = v2->_suggestedCategoryEventTracker;
    v2->_suggestedCategoryEventTracker = (PETScalarEventTracker *)v44;

    v46 = objc_alloc(MEMORY[0x1E0D80F38]);
    v94[0] = v5;
    v94[1] = v85;
    v94[2] = v6;
    v94[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("failure"), v47);
    failureEventTracker = v2->_failureEventTracker;
    v2->_failureEventTracker = (PETScalarEventTracker *)v48;

    v50 = objc_alloc(MEMORY[0x1E0D80F38]);
    v93[0] = v5;
    v93[1] = v85;
    v93[2] = v83;
    v93[3] = v6;
    v93[4] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 5);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("failure_category"), v51);
    failureCategoryEventTracker = v2->_failureCategoryEventTracker;
    v2->_failureCategoryEventTracker = (PETScalarEventTracker *)v52;

    v54 = objc_alloc(MEMORY[0x1E0D80F38]);
    v92[0] = v5;
    v92[1] = v86;
    v92[2] = v6;
    v92[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 4);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("selected"), v55);
    selectedEventTracker = v2->_selectedEventTracker;
    v2->_selectedEventTracker = (PETScalarEventTracker *)v56;

    v58 = objc_alloc(MEMORY[0x1E0D80F38]);
    v91[0] = v5;
    v91[1] = v86;
    v91[2] = v83;
    v91[3] = v6;
    v91[4] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 5);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("selected_category"), v59);
    selectedCategoryEventTracker = v2->_selectedCategoryEventTracker;
    v2->_selectedCategoryEventTracker = (PETScalarEventTracker *)v60;

    v62 = objc_alloc(MEMORY[0x1E0D80F18]);
    v90[0] = v5;
    v90[1] = v79;
    v90[2] = v6;
    v90[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 4);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v62, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("timing"), v63);
    timeInPredictionBarEventTracker = v2->_timeInPredictionBarEventTracker;
    v2->_timeInPredictionBarEventTracker = (PETDistributionEventTracker *)v64;

    v66 = objc_alloc(MEMORY[0x1E0D80F18]);
    v89[0] = v5;
    v89[1] = v79;
    v89[2] = v83;
    v89[3] = v6;
    v89[4] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 5);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("timing_category"), v67);
    timeInPredictionBarCategoryEventTracker = v2->_timeInPredictionBarCategoryEventTracker;
    v2->_timeInPredictionBarCategoryEventTracker = (PETDistributionEventTracker *)v68;

    v70 = objc_alloc(MEMORY[0x1E0D80F38]);
    v71 = MEMORY[0x1E0C9AA60];
    v72 = objc_msgSend(v70, "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("pers_word_accept"), MEMORY[0x1E0C9AA60]);
    personalizationWordAcceptanceTracker = v2->_personalizationWordAcceptanceTracker;
    v2->_personalizationWordAcceptanceTracker = (PETScalarEventTracker *)v72;

    v74 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("pers_offer"), v71);
    personalizationOfferTracker = v2->_personalizationOfferTracker;
    v2->_personalizationOfferTracker = (PETScalarEventTracker *)v74;

    v76 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("quicktype"), CFSTR("pers_engage"), v71);
    personalizationEngagementTracker = v2->_personalizationEngagementTracker;
    v2->_personalizationEngagementTracker = (PETScalarEventTracker *)v76;

  }
  return v2;
}

- (void)trackTriggeredWithSource:(unsigned __int8)a3 categories:(id)a4 locale:(id)a5 fieldType:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  PETScalarEventTracker *triggeredEventTracker;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  PETScalarEventTracker *triggeredCategoryEventTracker;
  void *v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  _BYTE v30[128];
  _QWORD v31[5];

  v8 = a3;
  v31[3] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  triggeredEventTracker = self->_triggeredEventTracker;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v14;
  v31[1] = v11;
  v31[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:](triggeredEventTracker, "trackEventWithPropertyValues:", v15);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v10;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19);
        triggeredCategoryEventTracker = self->_triggeredCategoryEventTracker;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v22;
        v29[1] = v20;
        v29[2] = v11;
        v29[3] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PETScalarEventTracker trackEventWithPropertyValues:](triggeredCategoryEventTracker, "trackEventWithPropertyValues:", v23);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v17);
  }

}

- (void)trackFailureWithDescription:(unsigned __int8)a3 description:(id)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  _TIStatisticsProactiveTracker *v16;
  PETScalarEventTracker *failureEventDescriptionTracker;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  PETScalarEventTracker *failureCategoryEventDescriptionTracker;
  void *v29;
  void *v30;
  id obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  _BYTE v38[128];
  _QWORD v39[6];

  v10 = a3;
  v39[4] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = self;
  failureEventDescriptionTracker = self->_failureEventDescriptionTracker;
  v18 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v19;
  v39[1] = v12;
  v32 = v12;
  v20 = v14;
  v39[2] = v14;
  v39[3] = v15;
  v21 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:](failureEventDescriptionTracker, "trackEventWithPropertyValues:", v22);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v13;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v34;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v26);
        failureCategoryEventDescriptionTracker = v16->_failureCategoryEventDescriptionTracker;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v18);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v29;
        v37[1] = v32;
        v37[2] = v27;
        v37[3] = v20;
        v37[4] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PETScalarEventTracker trackEventWithPropertyValues:](failureCategoryEventDescriptionTracker, "trackEventWithPropertyValues:", v30);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v24);
  }

}

- (void)trackSuggestedWithSource:(unsigned __int8)a3 count:(unint64_t)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  PETScalarEventTracker *suggestedEventTracker;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  PETScalarEventTracker *suggestedCategoryEventTracker;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obja;
  id obj;
  unsigned int v33;
  _TIStatisticsProactiveTracker *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  _BYTE v41[128];
  _QWORD v42[6];

  v10 = a3;
  v42[4] = *MEMORY[0x1E0C80C00];
  obja = a5;
  v12 = a6;
  v13 = a7;
  v34 = self;
  suggestedEventTracker = self->_suggestedEventTracker;
  v33 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v15;
  v16 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v18;
  v42[2] = v12;
  v35 = v12;
  v19 = v13;
  v42[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:](suggestedEventTracker, "trackEventWithPropertyValues:", v20);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = obja;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v37;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v24);
        suggestedCategoryEventTracker = v34->_suggestedCategoryEventTracker;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v33);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v27;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringValue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v29;
        v40[2] = v25;
        v40[3] = v35;
        v40[4] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PETScalarEventTracker trackEventWithPropertyValues:](suggestedCategoryEventTracker, "trackEventWithPropertyValues:", v30);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v22);
  }

}

- (void)trackFailureWithSource:(unsigned __int8)a3 reason:(unsigned __int8)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  PETScalarEventTracker *failureEventTracker;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  PETScalarEventTracker *failureCategoryEventTracker;
  void *v27;
  void *v28;
  void *v29;
  id obja;
  id obj;
  unsigned int v32;
  _TIStatisticsProactiveTracker *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  _BYTE v39[128];
  _QWORD v40[6];

  v9 = a4;
  v10 = a3;
  v40[4] = *MEMORY[0x1E0C80C00];
  obja = a5;
  v12 = a6;
  v13 = a7;
  v33 = self;
  failureEventTracker = self->_failureEventTracker;
  v32 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v15;
  v16 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v17;
  v40[2] = v12;
  v18 = v12;
  v19 = v13;
  v40[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:](failureEventTracker, "trackEventWithPropertyValues:", v20);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = obja;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v24);
        failureCategoryEventTracker = v33->_failureCategoryEventTracker;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v27;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v28;
        v38[2] = v25;
        v38[3] = v18;
        v38[4] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PETScalarEventTracker trackEventWithPropertyValues:](failureCategoryEventTracker, "trackEventWithPropertyValues:", v29);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v22);
  }

}

- (void)trackSelectedWithSource:(unsigned __int8)a3 position:(unint64_t)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  PETScalarEventTracker *selectedEventTracker;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  PETScalarEventTracker *selectedCategoryEventTracker;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obja;
  id obj;
  unsigned int v33;
  _TIStatisticsProactiveTracker *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  _BYTE v41[128];
  _QWORD v42[6];

  v10 = a3;
  v42[4] = *MEMORY[0x1E0C80C00];
  obja = a5;
  v12 = a6;
  v13 = a7;
  v34 = self;
  selectedEventTracker = self->_selectedEventTracker;
  v33 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v15;
  v16 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v18;
  v42[2] = v12;
  v35 = v12;
  v19 = v13;
  v42[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:](selectedEventTracker, "trackEventWithPropertyValues:", v20);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = obja;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v37;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v24);
        selectedCategoryEventTracker = v34->_selectedCategoryEventTracker;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v33);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v27;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringValue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v29;
        v40[2] = v25;
        v40[3] = v35;
        v40[4] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PETScalarEventTracker trackEventWithPropertyValues:](selectedCategoryEventTracker, "trackEventWithPropertyValues:", v30);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v22);
  }

}

- (void)trackPredictionTimeWithSource:(unsigned __int8)a3 time:(double)a4 selected:(BOOL)a5 categories:(id)a6 locale:(id)a7 fieldType:(id)a8
{
  _BOOL8 v10;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  _TIStatisticsProactiveTracker *v19;
  PETDistributionEventTracker *timeInPredictionBarEventTracker;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  PETDistributionEventTracker *timeInPredictionBarCategoryEventTracker;
  void *v32;
  void *v33;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  _BYTE v41[128];
  _QWORD v42[6];

  v10 = a5;
  v12 = a3;
  v42[4] = *MEMORY[0x1E0C80C00];
  v14 = a6;
  v15 = a7;
  v16 = a8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = objc_claimAutoreleasedReturnValue();

  v19 = self;
  timeInPredictionBarEventTracker = self->_timeInPredictionBarEventTracker;
  v21 = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v22;
  v42[1] = v18;
  v23 = (void *)v18;
  v35 = v15;
  v42[2] = v15;
  v42[3] = v16;
  v24 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETDistributionEventTracker trackEventWithPropertyValues:value:](timeInPredictionBarEventTracker, "trackEventWithPropertyValues:value:", v25, a4);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v14;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v37;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(obj);
        v30 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v29);
        timeInPredictionBarCategoryEventTracker = v19->_timeInPredictionBarCategoryEventTracker;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v21);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v32;
        v40[1] = v23;
        v40[2] = v30;
        v40[3] = v35;
        v40[4] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 5);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[PETDistributionEventTracker trackEventWithPropertyValues:value:](timeInPredictionBarCategoryEventTracker, "trackEventWithPropertyValues:value:", v33, a4);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v27);
  }

}

- (void)trackEngagementFailureWithDescription:(unsigned __int8)a3 description:(id)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  _TIStatisticsProactiveTracker *v16;
  PETScalarEventTracker *engagementEventDescriptionTracker;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  PETScalarEventTracker *engagementCategoryEventDescriptionTracker;
  void *v29;
  void *v30;
  id obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  _BYTE v38[128];
  _QWORD v39[6];

  v10 = a3;
  v39[4] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = self;
  engagementEventDescriptionTracker = self->_engagementEventDescriptionTracker;
  v18 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v19;
  v39[1] = v12;
  v32 = v12;
  v20 = v14;
  v39[2] = v14;
  v39[3] = v15;
  v21 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:](engagementEventDescriptionTracker, "trackEventWithPropertyValues:", v22);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v13;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v34;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v26);
        engagementCategoryEventDescriptionTracker = v16->_engagementCategoryEventDescriptionTracker;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v18);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v29;
        v37[1] = v32;
        v37[2] = v27;
        v37[3] = v20;
        v37[4] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PETScalarEventTracker trackEventWithPropertyValues:](engagementCategoryEventDescriptionTracker, "trackEventWithPropertyValues:", v30);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v24);
  }

}

- (PETScalarEventTracker)failureEventDescriptionTracker
{
  return self->_failureEventDescriptionTracker;
}

- (void)setFailureEventDescriptionTracker:(id)a3
{
  objc_storeStrong((id *)&self->_failureEventDescriptionTracker, a3);
}

- (PETScalarEventTracker)triggeredEventTracker
{
  return self->_triggeredEventTracker;
}

- (void)setTriggeredEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_triggeredEventTracker, a3);
}

- (PETScalarEventTracker)triggeredCategoryEventTracker
{
  return self->_triggeredCategoryEventTracker;
}

- (void)setTriggeredCategoryEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_triggeredCategoryEventTracker, a3);
}

- (PETScalarEventTracker)suggestedEventTracker
{
  return self->_suggestedEventTracker;
}

- (void)setSuggestedEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedEventTracker, a3);
}

- (PETScalarEventTracker)suggestedCategoryEventTracker
{
  return self->_suggestedCategoryEventTracker;
}

- (void)setSuggestedCategoryEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedCategoryEventTracker, a3);
}

- (PETScalarEventTracker)failureEventTracker
{
  return self->_failureEventTracker;
}

- (void)setFailureEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_failureEventTracker, a3);
}

- (PETScalarEventTracker)failureCategoryEventTracker
{
  return self->_failureCategoryEventTracker;
}

- (void)setFailureCategoryEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_failureCategoryEventTracker, a3);
}

- (PETScalarEventTracker)failureCategoryEventDescriptionTracker
{
  return self->_failureCategoryEventDescriptionTracker;
}

- (void)setFailureCategoryEventDescriptionTracker:(id)a3
{
  objc_storeStrong((id *)&self->_failureCategoryEventDescriptionTracker, a3);
}

- (PETScalarEventTracker)selectedEventTracker
{
  return self->_selectedEventTracker;
}

- (void)setSelectedEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_selectedEventTracker, a3);
}

- (PETScalarEventTracker)selectedCategoryEventTracker
{
  return self->_selectedCategoryEventTracker;
}

- (void)setSelectedCategoryEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCategoryEventTracker, a3);
}

- (PETDistributionEventTracker)timeInPredictionBarEventTracker
{
  return self->_timeInPredictionBarEventTracker;
}

- (void)setTimeInPredictionBarEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_timeInPredictionBarEventTracker, a3);
}

- (PETDistributionEventTracker)timeInPredictionBarCategoryEventTracker
{
  return self->_timeInPredictionBarCategoryEventTracker;
}

- (void)setTimeInPredictionBarCategoryEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_timeInPredictionBarCategoryEventTracker, a3);
}

- (PETScalarEventTracker)engagementEventDescriptionTracker
{
  return self->_engagementEventDescriptionTracker;
}

- (void)setEngagementEventDescriptionTracker:(id)a3
{
  objc_storeStrong((id *)&self->_engagementEventDescriptionTracker, a3);
}

- (PETScalarEventTracker)engagementCategoryEventDescriptionTracker
{
  return self->_engagementCategoryEventDescriptionTracker;
}

- (void)setEngagementCategoryEventDescriptionTracker:(id)a3
{
  objc_storeStrong((id *)&self->_engagementCategoryEventDescriptionTracker, a3);
}

- (PETScalarEventTracker)personalizationWordAcceptanceTracker
{
  return self->_personalizationWordAcceptanceTracker;
}

- (void)setPersonalizationWordAcceptanceTracker:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationWordAcceptanceTracker, a3);
}

- (PETScalarEventTracker)personalizationOfferTracker
{
  return self->_personalizationOfferTracker;
}

- (void)setPersonalizationOfferTracker:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationOfferTracker, a3);
}

- (PETScalarEventTracker)personalizationEngagementTracker
{
  return self->_personalizationEngagementTracker;
}

- (void)setPersonalizationEngagementTracker:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationEngagementTracker, a3);
}

- (TIAutocorrectionList)lastAutocorrectionList
{
  return self->_lastAutocorrectionList;
}

- (void)setLastAutocorrectionList:(id)a3
{
  objc_storeStrong((id *)&self->_lastAutocorrectionList, a3);
}

- (TIKeyboardCandidate)responseKitEntryOffered
{
  return self->_responseKitEntryOffered;
}

- (void)setResponseKitEntryOffered:(id)a3
{
  objc_storeStrong((id *)&self->_responseKitEntryOffered, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseKitEntryOffered, 0);
  objc_storeStrong((id *)&self->_lastAutocorrectionList, 0);
  objc_storeStrong((id *)&self->_personalizationEngagementTracker, 0);
  objc_storeStrong((id *)&self->_personalizationOfferTracker, 0);
  objc_storeStrong((id *)&self->_personalizationWordAcceptanceTracker, 0);
  objc_storeStrong((id *)&self->_engagementCategoryEventDescriptionTracker, 0);
  objc_storeStrong((id *)&self->_engagementEventDescriptionTracker, 0);
  objc_storeStrong((id *)&self->_timeInPredictionBarCategoryEventTracker, 0);
  objc_storeStrong((id *)&self->_timeInPredictionBarEventTracker, 0);
  objc_storeStrong((id *)&self->_selectedCategoryEventTracker, 0);
  objc_storeStrong((id *)&self->_selectedEventTracker, 0);
  objc_storeStrong((id *)&self->_failureCategoryEventDescriptionTracker, 0);
  objc_storeStrong((id *)&self->_failureCategoryEventTracker, 0);
  objc_storeStrong((id *)&self->_failureEventTracker, 0);
  objc_storeStrong((id *)&self->_suggestedCategoryEventTracker, 0);
  objc_storeStrong((id *)&self->_suggestedEventTracker, 0);
  objc_storeStrong((id *)&self->_triggeredCategoryEventTracker, 0);
  objc_storeStrong((id *)&self->_triggeredEventTracker, 0);
  objc_storeStrong((id *)&self->_failureEventDescriptionTracker, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2916 != -1)
    dispatch_once(&sharedInstance_onceToken_2916, &__block_literal_global_233);
  return (id)sharedInstance_instance;
}

@end
