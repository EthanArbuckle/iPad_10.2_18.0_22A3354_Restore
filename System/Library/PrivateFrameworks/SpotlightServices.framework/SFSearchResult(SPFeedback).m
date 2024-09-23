@implementation SFSearchResult(SPFeedback)

- (id)objectForFeedback
{
  id v2;
  uint64_t v4;
  id v5;

  if (objectForFeedback_onceToken != -1)
    dispatch_once(&objectForFeedback_onceToken, &__block_literal_global_45);
  if (objectForFeedback_atxAppClass && (objc_msgSend(object, "isMemberOfClass:") & 1) != 0
    || objectForFeedback_atxResultClass && (objc_msgSend(object, "isMemberOfClass:") & 1) != 0
    || objectForFeedback_atxSuggestionResultClass && objc_msgSend(object, "isMemberOfClass:"))
  {
    v2 = object;
  }
  else
  {
    objc_getAssociatedObject(object, "_feedbackobject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v2 = (id)v4;
      if (v4 == *MEMORY[0x1E0C9B0D0])
      {
        v5 = object;

        v2 = v5;
      }
    }
    else
    {
      v2 = objc_alloc_init((Class)objc_opt_class());
      objc_msgSend(object, "setFeedbackPropertiesOnResultCopy:", v2);
      objc_setAssociatedObject(object, "_feedbackobject", v2, (void *)1);
      objc_setAssociatedObject(v2, "_feedbackobject", (id)*MEMORY[0x1E0C9B0D0], (void *)1);
    }
  }
  return v2;
}

- (void)setFeedbackPropertiesOnResultCopy:()SPFeedback
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(a1, "copyBasePropertiesOverToResult:", v14);
  objc_msgSend(a1, "compactCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyForFeedback");
  objc_msgSend(v14, "setCompactCard:", v5);

  objc_msgSend(a1, "inlineCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyForFeedback");
  objc_msgSend(v14, "setInlineCard:", v7);

  objc_msgSend(a1, "tophitCard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyForFeedback");
  objc_msgSend(v14, "setTophitCard:", v9);

  objc_msgSend(a1, "mapsData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  GEOUsageSearchFoundationFeedbackDataForMapsData();
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMapsData:", v11);

  objc_msgSend(a1, "sectionBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.DocumentsApp"));

  if ((v11 & 1) == 0)
  {
    objc_msgSend(a1, "punchout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPunchout:", v13);

  }
}

- (void)copyBasePropertiesOverToResult:()SPFeedback
{
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  objc_msgSend(a1, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAction:", v4);

  objc_msgSend(a1, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setApplicationBundleIdentifier:", v5);

  objc_msgSend(v29, "setBlockId:", objc_msgSend(a1, "blockId"));
  objc_msgSend(a1, "calendarIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCalendarIdentifier:", v6);

  objc_msgSend(a1, "completedQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCompletedQuery:", v7);

  objc_msgSend(a1, "completion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCompletion:", v8);

  objc_msgSend(a1, "contactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setContactIdentifier:", v9);

  objc_msgSend(a1, "contentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setContentType:", v10);

  objc_msgSend(a1, "correctedQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCorrectedQuery:", v11);

  objc_msgSend(a1, "descriptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setDescriptions:", v12);

  objc_msgSend(a1, "fbr");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFbr:", v13);

  objc_msgSend(a1, "footnote");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFootnote:", v14);

  objc_msgSend(a1, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setIdentifier:", v15);

  objc_msgSend(a1, "intendedQuery");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setIntendedQuery:", v16);

  objc_msgSend(v29, "setIsFuzzyMatch:", objc_msgSend(a1, "isFuzzyMatch"));
  objc_msgSend(v29, "setIsLocalApplicationResult:", objc_msgSend(a1, "isLocalApplicationResult"));
  objc_msgSend(v29, "setIsStaticCorrection:", objc_msgSend(a1, "isStaticCorrection"));
  objc_msgSend(a1, "localFeatures");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLocalFeatures:", v17);

  objc_msgSend(v29, "setNoGoTakeover:", objc_msgSend(a1, "noGoTakeover"));
  objc_msgSend(v29, "setPreferTopPlatter:", objc_msgSend(a1, "preferTopPlatter"));
  objc_msgSend(v29, "setPubliclyIndexable:", objc_msgSend(a1, "publiclyIndexable"));
  objc_msgSend(v29, "setQueryId:", objc_msgSend(a1, "queryId"));
  objc_msgSend(a1, "rankingScore");
  objc_msgSend(v29, "setRankingScore:");
  objc_msgSend(a1, "resultBundleId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setResultBundleId:", v18);

  objc_msgSend(a1, "resultType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setResultType:", v19);

  objc_msgSend(a1, "secondaryTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSecondaryTitle:", v20);

  objc_msgSend(a1, "sectionBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSectionBundleIdentifier:", v21);

  objc_msgSend(v29, "setShouldUseCompactDisplay:", objc_msgSend(a1, "shouldUseCompactDisplay"));
  objc_msgSend(a1, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTitle:", v22);

  objc_msgSend(v29, "setTopHit:", objc_msgSend(a1, "topHit"));
  objc_msgSend(v29, "setType:", objc_msgSend(a1, "type"));
  objc_msgSend(a1, "userInput");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setUserInput:", v23);

  objc_msgSend(v29, "setUsesCompactDisplay:", objc_msgSend(a1, "usesCompactDisplay"));
  objc_msgSend(v29, "setUsesTopHitDisplay:", objc_msgSend(a1, "usesTopHitDisplay"));
  objc_msgSend(v29, "setRenderHorizontallyWithOtherResultsInCategory:", objc_msgSend(a1, "renderHorizontallyWithOtherResultsInCategory"));
  objc_msgSend(v29, "setContainsPersonalResult:", objc_msgSend(a1, "containsPersonalResult"));
  objc_msgSend(v29, "setDidRerankPersonalResult:", objc_msgSend(a1, "didRerankPersonalResult"));
  objc_msgSend(a1, "itemProviderDataTypes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setItemProviderDataTypes:", v24);

  objc_msgSend(a1, "itemProviderFileTypes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setItemProviderFileTypes:", v25);

  objc_msgSend(v29, "setCoreSpotlightIndexUsed:", objc_msgSend(a1, "coreSpotlightIndexUsed"));
  objc_msgSend(v29, "setCoreSpotlightIndexUsedReason:", objc_msgSend(a1, "coreSpotlightIndexUsedReason"));
  objc_msgSend(a1, "coreSpotlightRankingSignals");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCoreSpotlightRankingSignals:", v26);

  objc_msgSend(a1, "indexOfSectionWhenRanked");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setIndexOfSectionWhenRanked:", v27);

  objc_msgSend(a1, "indexOfResultInSectionWhenRanked");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setIndexOfResultInSectionWhenRanked:", v28);

  objc_msgSend(v29, "setHasAppTopHitShortcut:", objc_msgSend(a1, "hasAppTopHitShortcut"));
  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_serverFeatures)
    && objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_setServerFeatures_))
  {
    objc_msgSend(v29, "performSelector:withObject:", sel_setServerFeatures_, objc_msgSend(a1, "performSelector:", sel_serverFeatures));
  }

}

@end
