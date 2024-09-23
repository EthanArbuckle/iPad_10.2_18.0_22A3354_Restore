@implementation SFSearchResult_SpotlightExtras

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
    v3 = (void *)userDefaults_0;
    userDefaults_0 = v2;

  }
}

- (void)clearBackendData
{
  -[SFSearchResult_SpotlightExtras setBackendData:](self, "setBackendData:", 0);
  -[SFSearchResult_SpotlightExtras setAttributeData:](self, "setAttributeData:", 0);
}

- (SFSearchResult_SpotlightExtras)initWithResult:(id)a3 groupId:(id)a4
{
  id v5;
  SFSearchResult_SpotlightExtras *v6;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;

  v5 = a3;
  v6 = -[SFSearchResult_SpotlightExtras init](self, "init");
  if (v6)
  {
    objc_msgSend(v5, "contentType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setContentType:](v6, "setContentType:", v7);

    objc_msgSend(v5, "setFeedbackPropertiesOnResultCopy:", v6);
    objc_msgSend(v5, "thumbnail");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setThumbnail:](v6, "setThumbnail:", v8);

    -[SFSearchResult_SpotlightExtras setPreventThumbnailImageScaling:](v6, "setPreventThumbnailImageScaling:", objc_msgSend(v5, "preventThumbnailImageScaling"));
    objc_msgSend(v5, "secondaryTitleImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setSecondaryTitleImage:](v6, "setSecondaryTitleImage:", v9);

    -[SFSearchResult_SpotlightExtras setIsSecondaryTitleDetached:](v6, "setIsSecondaryTitleDetached:", objc_msgSend(v5, "isSecondaryTitleDetached"));
    -[SFSearchResult_SpotlightExtras setIsCentered:](v6, "setIsCentered:", objc_msgSend(v5, "isCentered"));
    objc_msgSend(v5, "publishDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setPublishDate:](v6, "setPublishDate:", v10);

    objc_msgSend(v5, "sourceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setSourceName:](v6, "setSourceName:", v11);

    objc_msgSend(v5, "completion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setCompletion:](v6, "setCompletion:", v12);

    objc_msgSend(v5, "completionImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setCompletionImage:](v6, "setCompletionImage:", v13);

    objc_msgSend(v5, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setUrl:](v6, "setUrl:", v14);

    objc_msgSend(v5, "auxiliaryTopText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setAuxiliaryTopText:](v6, "setAuxiliaryTopText:", v15);

    objc_msgSend(v5, "auxiliaryMiddleText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setAuxiliaryMiddleText:](v6, "setAuxiliaryMiddleText:", v16);

    objc_msgSend(v5, "auxiliaryBottomText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setAuxiliaryBottomText:](v6, "setAuxiliaryBottomText:", v17);

    -[SFSearchResult_SpotlightExtras setAuxiliaryBottomTextColor:](v6, "setAuxiliaryBottomTextColor:", objc_msgSend(v5, "auxiliaryBottomTextColor"));
    objc_msgSend(v5, "punchout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setPunchout:](v6, "setPunchout:", v18);

    objc_msgSend(v5, "storeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setStoreIdentifier:](v6, "setStoreIdentifier:", v19);

    objc_msgSend(v5, "calendarIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setCalendarIdentifier:](v6, "setCalendarIdentifier:", v20);

    objc_msgSend(v5, "mapsData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setMapsData:](v6, "setMapsData:", v21);

    objc_msgSend(v5, "mapsResultType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setMapsResultType:](v6, "setMapsResultType:", v22);

    objc_msgSend(v5, "mapsMoreURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setMapsMoreURL:](v6, "setMapsMoreURL:", v23);

    objc_msgSend(v5, "mapsMoreString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setMapsMoreString:](v6, "setMapsMoreString:", v24);

    objc_msgSend(v5, "mapsMoreIcon");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setMapsMoreIcon:](v6, "setMapsMoreIcon:", v25);

    objc_msgSend(v5, "nearbyBusinessesString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setNearbyBusinessesString:](v6, "setNearbyBusinessesString:", v26);

    objc_msgSend(v5, "appleReferrer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setAppleReferrer:](v6, "setAppleReferrer:", v27);

    objc_msgSend(v5, "card");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setCard:](v6, "setCard:", v28);

    objc_msgSend(v5, "moreResults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setMoreResults:](v6, "setMoreResults:", v29);

    objc_msgSend(v5, "moreResultsPunchout");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setMoreResultsPunchout:](v6, "setMoreResultsPunchout:", v30);

    objc_msgSend(v5, "userActivityRequiredString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setUserActivityRequiredString:](v6, "setUserActivityRequiredString:", v31);

    objc_msgSend(v5, "sectionHeader");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setSectionHeader:](v6, "setSectionHeader:", v32);

    objc_msgSend(v5, "sectionHeaderMore");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setSectionHeaderMore:](v6, "setSectionHeaderMore:", v33);

    objc_msgSend(v5, "sectionHeaderMoreURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setSectionHeaderMoreURL:](v6, "setSectionHeaderMoreURL:", v34);

    -[SFSearchResult_SpotlightExtras setRenderHorizontallyWithOtherResultsInCategory:](v6, "setRenderHorizontallyWithOtherResultsInCategory:", objc_msgSend(v5, "renderHorizontallyWithOtherResultsInCategory"));
    -[SFSearchResult_SpotlightExtras setPlacement:](v6, "setPlacement:", objc_msgSend(v5, "placement"));
    -[SFSearchResult_SpotlightExtras setMinimumRankOfTopHitToSuppressResult:](v6, "setMinimumRankOfTopHitToSuppressResult:", objc_msgSend(v5, "minimumRankOfTopHitToSuppressResult"));
    objc_msgSend(v5, "resultTemplate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setResultTemplate:](v6, "setResultTemplate:", v35);

    -[SFSearchResult_SpotlightExtras setIsQuickGlance:](v6, "setIsQuickGlance:", objc_msgSend(v5, "isQuickGlance"));
    -[SFSearchResult_SpotlightExtras setIsStreaming:](v6, "setIsStreaming:", objc_msgSend(v5, "isStreaming"));
    objc_msgSend(v5, "engagementScore");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setEngagementScore:](v6, "setEngagementScore:", v36);

    objc_msgSend(v5, "queryIndependentScore");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setQueryIndependentScore:](v6, "setQueryIndependentScore:", v37);

    objc_msgSend(v5, "maxAge");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setMaxAge:](v6, "setMaxAge:", v38);

    objc_msgSend(v5, "titleNote");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setTitleNote:](v6, "setTitleNote:", v39);

    objc_msgSend(v5, "titleNoteSize");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setTitleNoteSize:](v6, "setTitleNoteSize:", v40);

    objc_msgSend(v5, "icon");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setIcon:](v6, "setIcon:", v41);

    objc_msgSend(v5, "itemProviderDataTypes");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setItemProviderDataTypes:](v6, "setItemProviderDataTypes:", v42);

    objc_msgSend(v5, "itemProviderFileTypes");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setItemProviderFileTypes:](v6, "setItemProviderFileTypes:", v43);

    objc_msgSend(v5, "contentTypeTree");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setContentTypeTree:](v6, "setContentTypeTree:", v44);

    -[SFSearchResult_SpotlightExtras setDataOwnerType:](v6, "setDataOwnerType:", objc_msgSend(v5, "dataOwnerType"));
    objc_msgSend(v5, "fileProviderIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setFileProviderIdentifier:](v6, "setFileProviderIdentifier:", v45);

    objc_msgSend(v5, "fileProviderDomainIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setFileProviderDomainIdentifier:](v6, "setFileProviderDomainIdentifier:", v46);

    objc_msgSend(v5, "srf");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setSrf:](v6, "setSrf:", v47);

    -[SFSearchResult_SpotlightExtras setDoNotFold:](v6, "setDoNotFold:", objc_msgSend(v5, "doNotFold"));
    objc_msgSend(v5, "localFeatures");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setLocalFeatures:](v6, "setLocalFeatures:", v48);

    objc_msgSend(v5, "entityData");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setEntityData:](v6, "setEntityData:", v49);

    objc_msgSend(v5, "entityIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setEntityIdentifier:](v6, "setEntityIdentifier:", v50);

    objc_msgSend(v5, "mapsData");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setMapsData:](v6, "setMapsData:", v51);

    objc_msgSend(v5, "normalizedTopic");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setNormalizedTopic:](v6, "setNormalizedTopic:", v52);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = v5;
      -[SFSearchResult_SpotlightExtras setHasTextContentMatch:](v6, "setHasTextContentMatch:", objc_msgSend(v53, "hasTextContentMatch"));
      objc_msgSend(v53, "mapsPersonalizationResult");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchResult_SpotlightExtras setMapsPersonalizationResult:](v6, "setMapsPersonalizationResult:", v54);

      objc_msgSend(v53, "backendData");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)objc_msgSend(v55, "mutableCopy");
      -[SFSearchResult_SpotlightExtras setBackendData:](v6, "setBackendData:", v56);

      objc_msgSend(v53, "rankingItem");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchResult_SpotlightExtras setRankingItem:](v6, "setRankingItem:", v57);

      objc_msgSend(v53, "answerAttributes");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(v58, "copy");
      -[SFSearchResult_SpotlightExtras setAnswerAttributes:](v6, "setAnswerAttributes:", v59);

      objc_msgSend(v53, "contentURL");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      -[SFSearchResult_SpotlightExtras setContentURL:](v6, "setContentURL:", v60);
    }
  }

  return v6;
}

- (SFSearchResult_SpotlightExtras)initWithResult:(id)a3
{
  id v4;
  SFSearchResult_SpotlightExtras *v5;
  uint64_t v6;
  NSDate *lastUsedDate;
  float v8;

  v4 = a3;
  v5 = -[SFSearchResult_SpotlightExtras initWithResult:groupId:](self, "initWithResult:groupId:", v4, 0);
  if (v5)
  {
    objc_msgSend(v4, "lastUsedDate");
    v6 = objc_claimAutoreleasedReturnValue();
    lastUsedDate = v5->_lastUsedDate;
    v5->_lastUsedDate = (NSDate *)v6;

    objc_msgSend(v4, "l2score");
    v5->_l2score = v8;
    v5->_feedbackBlockId = objc_msgSend(v4, "feedbackBlockId");
  }

  return v5;
}

- (SFSearchResult_SpotlightExtras)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 attributeKeys:(id)a6 attributeValues:(id)a7
{
  return -[SFSearchResult_SpotlightExtras initWithIdentifier:bundleIdentifier:protectionClass:attributeKeys:attributeValues:type:completion:](self, "initWithIdentifier:bundleIdentifier:protectionClass:attributeKeys:attributeValues:type:completion:", a3, a4, a5, a6, a7, 0, 0);
}

- (SFSearchResult_SpotlightExtras)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 attributeKeys:(id)a6 attributeValues:(id)a7 type:(int)a8 completion:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  SFSearchResult_SpotlightExtras *v22;
  SFSearchResult_SpotlightExtras *v24;
  id v26;
  id v27;

  v24 = self;
  v27 = a3;
  v26 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a9;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = objc_msgSend(v14, "count");
  if (v18 == objc_msgSend(v15, "count") && v18)
  {
    for (i = 0; i != v18; ++i)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", i, v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v17, "setObject:forKey:", v21, v20);

    }
  }
  v22 = -[SFSearchResult_SpotlightExtras initWithIdentifier:bundleIdentifier:protectionClass:attributes:type:completion:](v24, "initWithIdentifier:bundleIdentifier:protectionClass:attributes:type:completion:", v27, v26, v13, v17, a8, v16, v24);

  return v22;
}

- (SFSearchResult_SpotlightExtras)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 protectionClass:(id)a5 attributes:(id)a6 type:(int)a7 completion:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  SFSearchResult_SpotlightExtras *v19;
  SFSearchResult_SpotlightExtras *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSString *relatedAppIdentifier;
  uint64_t v27;
  NSNumber *displayOrder;
  objc_super v30;

  v9 = *(_QWORD *)&a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)SFSearchResult_SpotlightExtras;
  v19 = -[SFSearchResult_SpotlightExtras init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    -[SFSearchResult_SpotlightExtras setIdentifier:](v19, "setIdentifier:", v14);
    -[SFSearchResult_SpotlightExtras setResultBundleId:](v20, "setResultBundleId:", v15);
    -[SFSearchResult_SpotlightExtras setSectionBundleIdentifier:](v20, "setSectionBundleIdentifier:", v15);
    -[SFSearchResult_SpotlightExtras setApplicationBundleIdentifier:](v20, "setApplicationBundleIdentifier:", v15);
    -[SFSearchResult_SpotlightExtras setType:](v20, "setType:", v9);
    -[SFSearchResult_SpotlightExtras setCompletion:](v20, "setCompletion:", v18);
    -[SFSearchResult_SpotlightExtras setProtectionClass:](v20, "setProtectionClass:", v16);
    -[SFSearchResult_SpotlightExtras setBackendData:](v20, "setBackendData:", v17);
    -[SFSearchResult_SpotlightExtras valueForAttribute:withType:](v20, "valueForAttribute:withType:", *MEMORY[0x1E0CA60F8], objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setContentType:](v20, "setContentType:", v21);

    -[SFSearchResult_SpotlightExtras valueForAttribute:withType:](v20, "valueForAttribute:withType:", *MEMORY[0x1E0CA6100], objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setContentTypeTree:](v20, "setContentTypeTree:", v22);

    -[SFSearchResult_SpotlightExtras valueForAttribute:withType:](v20, "valueForAttribute:withType:", *MEMORY[0x1E0CA6310], objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setFileProviderIdentifier:](v20, "setFileProviderIdentifier:", v23);

    -[SFSearchResult_SpotlightExtras valueForAttribute:withType:](v20, "valueForAttribute:withType:", *MEMORY[0x1E0CA6308], objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult_SpotlightExtras setFileProviderDomainIdentifier:](v20, "setFileProviderDomainIdentifier:", v24);

    -[SFSearchResult_SpotlightExtras valueForAttribute:withType:](v20, "valueForAttribute:withType:", *MEMORY[0x1E0CA67F0], objc_opt_class());
    v25 = objc_claimAutoreleasedReturnValue();
    relatedAppIdentifier = v20->_relatedAppIdentifier;
    v20->_relatedAppIdentifier = (NSString *)v25;

    -[SFSearchResult_SpotlightExtras valueForAttribute:withType:](v20, "valueForAttribute:withType:", *MEMORY[0x1E0CA6850], objc_opt_class());
    v27 = objc_claimAutoreleasedReturnValue();
    displayOrder = v20->_displayOrder;
    v20->_displayOrder = (NSNumber *)v27;

  }
  return v20;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
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

  -[SFSearchResult_SpotlightExtras title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SFSearchResult_SpotlightExtras compactCard](self, "compactCard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[SFSearchResult_SpotlightExtras inlineCard](self, "inlineCard");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    objc_msgSend(v8, "cardSections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "text");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  v12 = (void *)MEMORY[0x1E0CB37A0];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSearchResult_SpotlightExtras sectionBundleIdentifier](self, "sectionBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@ %p> %@ (%@)"), v14, self, v4, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFSearchResult_SpotlightExtras sectionBundleIdentifier](self, "sectionBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = SSSectionIsSyndicatedPhotos(v17);

  if ((_DWORD)v15)
  {
    -[SFSearchResult_SpotlightExtras inlineCard](self, "inlineCard");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cardSections");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "cardSections");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v22, "thumbnail");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v23, "photoIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v23, "isSyndicated"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appendFormat:", CFSTR(" PhotoId: %@ isSyndicated: %@"), v24, v25);

        }
      }

    }
  }

  return v16;
}

- (id)ttrDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  uint64_t v21;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[SFSearchResult_SpotlightExtras debugDescription](self, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFSearchResult_SpotlightExtras rankingItem](self, "rankingItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasShortCut");
  objc_msgSend(v6, "L2FeatureVector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSearchResult_SpotlightExtras applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\n\t\tselfBundle:%@"), v9);
  }
  else
  {
    -[SFSearchResult_SpotlightExtras resultBundleId](self, "resultBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n\t\tselfBundle:%@"), v11);

  }
  objc_msgSend(v8, "originalL2Score");
  objc_msgSend(v5, "appendFormat:", CFSTR("\toriginalL2:%.3f"), v12);
  objc_msgSend(v8, "experimentalScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("\texperimentalScore:%.3f"), v13);
  objc_msgSend(v6, "rawScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\t\trawScore:%.3f"), v14);
  objc_msgSend(v6, "score");
  objc_msgSend(v5, "appendFormat:", CFSTR("\tscore:%.3f"), v15);
  -[SFSearchResult_SpotlightExtras l2score](self, "l2score");
  objc_msgSend(v5, "appendFormat:", CFSTR("\tL2Score:%.3f"), v16);
  objc_msgSend(v8, "scoreForFeature:", 386);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\t\tparsecEnumScore:%.3f"), v17);
  objc_msgSend(v8, "withinBundleScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("\tL2VectorWithinBundleScore:%.3f"), v18);
  objc_msgSend(v6, "withinBundleScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("\twithinBundleScore:%.3f"), v19);
  objc_msgSend(v8, "scoreForFeature:", 366);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\t\tcep:%.6f"), v20);
  objc_msgSend(v5, "appendFormat:", CFSTR("\ttopHit:%d"), -[SFSearchResult_SpotlightExtras topHit](self, "topHit"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\tblockId:%llu"), -[SFSearchResult_SpotlightExtras blockId](self, "blockId"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\t\tsafariTophit:%d"), -[SFSearchResult_SpotlightExtras isSafariTopHit](self, "isSafariTopHit"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\thasShortcut:%d"), v7);
  objc_msgSend(v5, "appendFormat:", CFSTR("\tisFuzzyMatch:%d"), -[SFSearchResult_SpotlightExtras isFuzzyMatch](self, "isFuzzyMatch"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\t\tshouldUseCompactDisplay:%d"), -[SFSearchResult_SpotlightExtras shouldUseCompactDisplay](self, "shouldUseCompactDisplay"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\tusesCompactDisplay:%d"), -[SFSearchResult_SpotlightExtras usesCompactDisplay](self, "usesCompactDisplay"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\tusesTopHitDisplay:%d"), -[SFSearchResult_SpotlightExtras usesTopHitDisplay](self, "usesTopHitDisplay"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\tshouldHideUnderShowMore:%d"), objc_msgSend(v6, "shouldHideUnderShowMore"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\t\tphotosMatch:%d"), objc_msgSend(v6, "photosMatch"));
  if (SSResultTypeIsLocalSuggestion(-[SFSearchResult_SpotlightExtras type](self, "type")))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\ttype:%d"), -[SFSearchResult_SpotlightExtras type](self, "type"));
    -[SFSearchResult_SpotlightExtras rankingScore](self, "rankingScore");
    objc_msgSend(v5, "appendFormat:", CFSTR("\trankingScore:%f"), v21);
  }

  return v5;
}

- (id)getStableServerResultIdentifier
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SFSearchResult_SpotlightExtras sectionBundleIdentifier](self, "sectionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.parsec.stocks")))
    goto LABEL_5;
  -[SFSearchResult_SpotlightExtras identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("high_low"));

  if (!v5)
  {
LABEL_6:
    -[SFSearchResult_SpotlightExtras identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    return v9;
  }
  -[SFSearchResult_SpotlightExtras identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count") != 3)
  {
LABEL_5:

    goto LABEL_6;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("st:%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)urlValueForAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SFSearchResult_SpotlightExtras valueForAttribute:withType:](self, "valueForAttribute:withType:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[SFSearchResult_SpotlightExtras valueForAttribute:withType:](self, "valueForAttribute:withType:", v4, objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      SSGeneralLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v4;
        _os_log_impl(&dword_1B86C5000, v7, OS_LOG_TYPE_INFO, "%@ found to be NSString instead of NSURL. Converting to NSURL.", (uint8_t *)&v9, 0xCu);
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setFeedbackPropertiesOnResultCopy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFSearchResult_SpotlightExtras;
  -[SFSearchResult setFeedbackPropertiesOnResultCopy:](&v24, sel_setFeedbackPropertiesOnResultCopy_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFSearchResult_SpotlightExtras duplicatedItems](self, "duplicatedItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDuplicatedItems:", v5);

    -[SFSearchResult_SpotlightExtras attributeData](self, "attributeData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAttributeData:", v6);

    -[SFSearchResult_SpotlightExtras personIdentifier](self, "personIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPersonIdentifier:", v7);

    -[SFSearchResult_SpotlightExtras personQueryIdentifier](self, "personQueryIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPersonQueryIdentifier:", v8);

    -[SFSearchResult_SpotlightExtras relatedAppIdentifier](self, "relatedAppIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRelatedAppIdentifier:", v9);

    -[SFSearchResult_SpotlightExtras displayOrder](self, "displayOrder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplayOrder:", v10);

    objc_msgSend(v4, "setIsAppClip:", -[SFSearchResult_SpotlightExtras isAppClip](self, "isAppClip"));
    objc_msgSend(v4, "setIsWebClip:", -[SFSearchResult_SpotlightExtras isWebClip](self, "isWebClip"));
    -[SFSearchResult_SpotlightExtras userActivityType](self, "userActivityType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserActivityType:", v11);

    -[SFSearchResult_SpotlightExtras userActivityRequiredString](self, "userActivityRequiredString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserActivityRequiredString:", v12);

    -[SFSearchResult_SpotlightExtras userActivityType](self, "userActivityType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("/app/intents"));

    if ((v14 & 1) != 0)
    {
      v15 = 3;
LABEL_9:
      objc_msgSend(v4, "setPredictionsFeedbackActionType:", v15);
      -[SFSearchResult_SpotlightExtras protectionClass](self, "protectionClass");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setProtectionClass:", v19);

      -[SFSearchResult_SpotlightExtras launchString](self, "launchString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setLaunchString:", v20);

      -[SFSearchResult_SpotlightExtras suggestionsFeedbackData](self, "suggestionsFeedbackData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSuggestionsFeedbackData:", v21);

      -[SFSearchResult_SpotlightExtras mapsPersonalizationResult](self, "mapsPersonalizationResult");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMapsPersonalizationResult:", v22);

      -[SFSearchResult_SpotlightExtras answerAttributes](self, "answerAttributes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAnswerAttributes:", v23);

      goto LABEL_10;
    }
    -[SFSearchResult_SpotlightExtras userActivityRequiredString](self, "userActivityRequiredString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {
      -[SFSearchResult_SpotlightExtras userActivityType](self, "userActivityType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      if (v18)
      {
        v15 = 1;
        goto LABEL_9;
      }
    }
    else
    {

    }
    v15 = 4;
    goto LABEL_9;
  }
LABEL_10:

}

- (SFSearchResult_SpotlightExtras)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFSearchResult_SpotlightExtras;
  return -[SFSearchResult_SpotlightExtras init](&v3, sel_init);
}

- (SFSearchResult_SpotlightExtras)initWithCoder:(id)a3
{
  id v4;
  SFSearchResult_SpotlightExtras *v5;
  SFSearchResult_SpotlightExtras *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *protectionClass;
  uint64_t v11;
  NSString *launchString;
  uint64_t v13;
  NSString *filename;
  uint64_t v15;
  NSNumber *fileIdentifier;
  uint64_t v17;
  NSNumber *parentFileIdentifier;
  uint64_t v19;
  NSNumber *documentIdentifier;
  uint64_t v21;
  NSString *userActivityType;
  uint64_t v23;
  NSString *contentURL;
  uint64_t v25;
  NSString *personIdentifier;
  uint64_t v27;
  NSString *personQueryIdentifier;
  uint64_t v29;
  NSString *relatedAppIdentifier;
  uint64_t v31;
  NSNumber *displayOrder;
  uint64_t v33;
  NSData *suggestionsFeedbackData;
  float v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSMutableArray *duplicatedItems;
  uint64_t v41;
  NSData *attributeData;
  uint64_t v43;
  NSDate *lastUsedDate;
  void *v45;
  void *v46;
  PRSRankingItem *v47;
  PRSRankingItem *rankingItem;
  void *v49;
  uint64_t v50;
  IQFMapsPersonalizationResult *mapsPersonalizationResult;
  uint64_t v52;
  NSArray *answerAttributes;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)SFSearchResult_SpotlightExtras;
  v5 = -[SFSearchResult_SpotlightExtras initWithCoder:](&v55, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[SFSearchResult_SpotlightExtras url](v5, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SFSearchResult_SpotlightExtras url](v6, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        -[SFSearchResult_SpotlightExtras initWithCoder:].cold.1();

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_protectionClass"));
    v9 = objc_claimAutoreleasedReturnValue();
    protectionClass = v6->_protectionClass;
    v6->_protectionClass = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_launchString"));
    v11 = objc_claimAutoreleasedReturnValue();
    launchString = v6->_launchString;
    v6->_launchString = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_filename"));
    v13 = objc_claimAutoreleasedReturnValue();
    filename = v6->_filename;
    v6->_filename = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fileIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    fileIdentifier = v6->_fileIdentifier;
    v6->_fileIdentifier = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_parentFileIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    parentFileIdentifier = v6->_parentFileIdentifier;
    v6->_parentFileIdentifier = (NSNumber *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_documentIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    documentIdentifier = v6->_documentIdentifier;
    v6->_documentIdentifier = (NSNumber *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userActivityType"));
    v21 = objc_claimAutoreleasedReturnValue();
    userActivityType = v6->_userActivityType;
    v6->_userActivityType = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contentURL"));
    v23 = objc_claimAutoreleasedReturnValue();
    contentURL = v6->_contentURL;
    v6->_contentURL = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_personIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    personIdentifier = v6->_personIdentifier;
    v6->_personIdentifier = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_personQueryIdentifier"));
    v27 = objc_claimAutoreleasedReturnValue();
    personQueryIdentifier = v6->_personQueryIdentifier;
    v6->_personQueryIdentifier = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_relatedAppIdentifier"));
    v29 = objc_claimAutoreleasedReturnValue();
    relatedAppIdentifier = v6->_relatedAppIdentifier;
    v6->_relatedAppIdentifier = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayOrder"));
    v31 = objc_claimAutoreleasedReturnValue();
    displayOrder = v6->_displayOrder;
    v6->_displayOrder = (NSNumber *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_suggestionsFeedbackData"));
    v33 = objc_claimAutoreleasedReturnValue();
    suggestionsFeedbackData = v6->_suggestionsFeedbackData;
    v6->_suggestionsFeedbackData = (NSData *)v33;

    v6->_hasCommunicationContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasCommunicationContent"));
    v6->_hasTextContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasTextContent"));
    v6->_hasTextContentMatch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasTextContentMatch"));
    v6->_predictionsFeedbackActionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_predictionsFeedbackActionType"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_l2score"));
    v6->_l2score = v35;
    v36 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("_duplicatedItems"));
    v39 = objc_claimAutoreleasedReturnValue();
    duplicatedItems = v6->_duplicatedItems;
    v6->_duplicatedItems = (NSMutableArray *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_attributeData"));
    v41 = objc_claimAutoreleasedReturnValue();
    attributeData = v6->_attributeData;
    v6->_attributeData = (NSData *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastUsedDate"));
    v43 = objc_claimAutoreleasedReturnValue();
    lastUsedDate = v6->_lastUsedDate;
    v6->_lastUsedDate = (NSDate *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isAppClip"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_isAppClip = objc_msgSend(v45, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isWebClip"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_isWebClip = objc_msgSend(v46, "BOOLValue");

    v47 = objc_alloc_init(PRSRankingItem);
    rankingItem = v6->_rankingItem;
    v6->_rankingItem = v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_l2Signals"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSRankingItem setL2Signals:](v6->_rankingItem, "setL2Signals:", v49);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mapsPersonalizationResult"));
    v50 = objc_claimAutoreleasedReturnValue();
    mapsPersonalizationResult = v6->_mapsPersonalizationResult;
    v6->_mapsPersonalizationResult = (IQFMapsPersonalizationResult *)v50;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_answerAttributes"));
    v52 = objc_claimAutoreleasedReturnValue();
    answerAttributes = v6->_answerAttributes;
    v6->_answerAttributes = (NSArray *)v52;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  NSString *protectionClass;
  NSString *launchString;
  NSString *filename;
  NSNumber *fileIdentifier;
  NSNumber *parentFileIdentifier;
  NSNumber *documentIdentifier;
  NSString *userActivityType;
  NSString *contentURL;
  NSString *personIdentifier;
  NSString *personQueryIdentifier;
  NSString *relatedAppIdentifier;
  NSNumber *displayOrder;
  NSData *suggestionsFeedbackData;
  unint64_t predictionsFeedbackActionType;
  NSMutableArray *duplicatedItems;
  NSData *attributeData;
  NSDate *lastUsedDate;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  IQFMapsPersonalizationResult *mapsPersonalizationResult;
  NSArray *answerAttributes;
  objc_super v31;

  v4 = a3;
  -[SFSearchResult_SpotlightExtras url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SFSearchResult_SpotlightExtras url](self, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[SFSearchResult_SpotlightExtras encodeWithCoder:].cold.1();

  }
  v31.receiver = self;
  v31.super_class = (Class)SFSearchResult_SpotlightExtras;
  -[SFSearchResult_SpotlightExtras encodeWithCoder:](&v31, sel_encodeWithCoder_, v4);
  protectionClass = self->_protectionClass;
  if (protectionClass)
    objc_msgSend(v4, "encodeObject:forKey:", protectionClass, CFSTR("_protectionClass"));
  launchString = self->_launchString;
  if (launchString)
    objc_msgSend(v4, "encodeObject:forKey:", launchString, CFSTR("_launchString"));
  filename = self->_filename;
  if (filename)
    objc_msgSend(v4, "encodeObject:forKey:", filename, CFSTR("_filename"));
  fileIdentifier = self->_fileIdentifier;
  if (fileIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", fileIdentifier, CFSTR("_fileIdentifier"));
  parentFileIdentifier = self->_parentFileIdentifier;
  if (parentFileIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", parentFileIdentifier, CFSTR("_parentFileIdentifier"));
  documentIdentifier = self->_documentIdentifier;
  if (documentIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", documentIdentifier, CFSTR("_documentIdentifier"));
  userActivityType = self->_userActivityType;
  if (userActivityType)
    objc_msgSend(v4, "encodeObject:forKey:", userActivityType, CFSTR("_userActivityType"));
  contentURL = self->_contentURL;
  if (contentURL)
    objc_msgSend(v4, "encodeObject:forKey:", contentURL, CFSTR("_contentURL"));
  personIdentifier = self->_personIdentifier;
  if (personIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", personIdentifier, CFSTR("_personIdentifier"));
  personQueryIdentifier = self->_personQueryIdentifier;
  if (personQueryIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", personQueryIdentifier, CFSTR("_personQueryIdentifier"));
  relatedAppIdentifier = self->_relatedAppIdentifier;
  if (relatedAppIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", relatedAppIdentifier, CFSTR("_relatedAppIdentifier"));
  displayOrder = self->_displayOrder;
  if (displayOrder)
    objc_msgSend(v4, "encodeObject:forKey:", displayOrder, CFSTR("_displayOrder"));
  suggestionsFeedbackData = self->_suggestionsFeedbackData;
  if (suggestionsFeedbackData)
    objc_msgSend(v4, "encodeObject:forKey:", suggestionsFeedbackData, CFSTR("_suggestionsFeedbackData"));
  if (self->_hasCommunicationContent)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("_hasCommunicationContent"));
  if (self->_hasTextContent)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("_hasTextContent"));
  if (self->_hasTextContentMatch)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("_hasTextContentMatch"));
  predictionsFeedbackActionType = self->_predictionsFeedbackActionType;
  if (predictionsFeedbackActionType)
    objc_msgSend(v4, "encodeInteger:forKey:", predictionsFeedbackActionType, CFSTR("_predictionsFeedbackActionType"));
  *(float *)&v7 = self->_l2score;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("_l2score"), v7);
  duplicatedItems = self->_duplicatedItems;
  if (duplicatedItems)
    objc_msgSend(v4, "encodeObject:forKey:", duplicatedItems, CFSTR("_duplicatedItems"));
  attributeData = self->_attributeData;
  if (attributeData)
    objc_msgSend(v4, "encodeObject:forKey:", attributeData, CFSTR("_attributeData"));
  lastUsedDate = self->_lastUsedDate;
  if (lastUsedDate)
    objc_msgSend(v4, "encodeObject:forKey:", lastUsedDate, CFSTR("_lastUsedDate"));
  if (self->_isAppClip)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("_isAppClip"));

  }
  if (self->_isWebClip)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("_isWebClip"));

  }
  -[PRSRankingItem l2Signals](self->_rankingItem, "l2Signals");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[PRSRankingItem l2Signals](self->_rankingItem, "l2Signals");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("_l2Signals"));

  }
  mapsPersonalizationResult = self->_mapsPersonalizationResult;
  if (mapsPersonalizationResult)
    objc_msgSend(v4, "encodeObject:forKey:", mapsPersonalizationResult, CFSTR("_mapsPersonalizationResult"));
  answerAttributes = self->_answerAttributes;
  if (answerAttributes)
    objc_msgSend(v4, "encodeObject:forKey:", answerAttributes, CFSTR("_answerAttributes"));

}

- (void)setUrl:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[SFSearchResult_SpotlightExtras setUrl:].cold.1();
  }
  v5.receiver = self;
  v5.super_class = (Class)SFSearchResult_SpotlightExtras;
  -[SFSearchResult_SpotlightExtras setUrl:](&v5, sel_setUrl_, v4);

}

- (id)punchout
{
  void *v3;
  void *v4;
  SFPunchout *v5;
  SFPunchout *cachedPunchout;
  SFPunchout *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SFPunchout *v17;
  SFPunchout *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SFSearchResult_SpotlightExtras;
  -[SFSearchResult_SpotlightExtras punchout](&v19, sel_punchout);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    cachedPunchout = self->_cachedPunchout;
    if (!cachedPunchout)
    {
      -[SFSearchResult_SpotlightExtras resultBundleId](self, "resultBundleId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.DocumentsApp")) & 1) != 0)
      {
        -[SFSearchResult_SpotlightExtras documentIdentifier](self, "documentIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = (void *)MEMORY[0x1E0C99E98];
          -[SFSearchResult_SpotlightExtras fileIdentifier](self, "fileIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSearchResult_SpotlightExtras filename](self, "filename");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSearchResult_SpotlightExtras parentFileIdentifier](self, "parentFileIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSearchResult_SpotlightExtras documentIdentifier](self, "documentIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sp_URLFromFileID:filename:parentFileID:documentID:", v12, v13, v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v16);
            v17 = (SFPunchout *)objc_claimAutoreleasedReturnValue();
            v18 = self->_cachedPunchout;
            self->_cachedPunchout = v17;

            v7 = self->_cachedPunchout;
            goto LABEL_6;
          }
        }
      }
      else
      {

      }
      v7 = 0;
      goto LABEL_6;
    }
    v5 = cachedPunchout;
  }
  v7 = v5;
LABEL_6:

  return v7;
}

- (BOOL)isSafariTopHitForQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  if (v4)
  {
    -[SFSearchResult_SpotlightExtras contentURL](self, "contentURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      NSLog(CFSTR("Didn't find MDItemContentURL attribute on Safari item: %@"), self);
      goto LABEL_13;
    }
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("https://")) & 1) != 0)
    {
      v7 = 8;
    }
    else
    {
      if (!objc_msgSend(v6, "hasPrefix:", CFSTR("http://")))
        goto LABEL_10;
      v7 = 7;
    }
    objc_msgSend(v6, "substringFromIndex:", v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
LABEL_10:
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("www.")))
    {
      objc_msgSend(v6, "substringFromIndex:", 4);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
    if (objc_msgSend(v6, "rangeOfString:options:", v4, 9) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 1;
      goto LABEL_15;
    }
LABEL_13:
    v8 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v8 = 0;
LABEL_16:

  return v8;
}

- (NSData)suggestionsFeedbackData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSearchResult_SpotlightExtras serverFeatures](self, "serverFeatures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v10, (_QWORD)v22);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "doubleValue");
          SSRoundDouble(4, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setValue:forKey:", v13, v10);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);
    }

  }
  SSRoundDouble(4, (double)(int)-[SFSearchResult_SpotlightExtras type](self, "type", (_QWORD)v22));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v14, CFSTR("type"));

  v15 = -[SFSearchResult_SpotlightExtras score](self, "score");
  SSRoundDouble(4, (double)*(unsigned __int128 *)&v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v16, CFSTR("score"));

  -[SFSearchResult_SpotlightExtras completion](self, "completion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  SSRoundDouble(4, (double)(unint64_t)objc_msgSend(v17, "length"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v18, CFSTR("slen"));

  SSRoundUInt64(1uLL);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v19, CFSTR("extras"));

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 2, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v20;
}

- (id)valueForAttribute:(id)a3 withType:(Class)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  -[SFSearchResult_SpotlightExtras backendData](self, "backendData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[SFSearchResult_SpotlightExtras attributeData](self, "attributeData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_5;
    v8 = objc_alloc(MEMORY[0x1E0CA6AC8]);
    -[SFSearchResult_SpotlightExtras attributeData](self, "attributeData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "initWithData:", v6);
    objc_msgSend(v9, "decode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    -[SFSearchResult_SpotlightExtras setBackendData:](self, "setBackendData:", v11);

  }
LABEL_5:
  -[SFSearchResult_SpotlightExtras backendData](self, "backendData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

- (NSString)protectionClass
{
  return self->_protectionClass;
}

- (void)setProtectionClass:(id)a3
{
  objc_storeStrong((id *)&self->_protectionClass, a3);
}

- (NSNumber)fileIdentifier
{
  return self->_fileIdentifier;
}

- (void)setFileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_fileIdentifier, a3);
}

- (NSNumber)parentFileIdentifier
{
  return self->_parentFileIdentifier;
}

- (void)setParentFileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentFileIdentifier, a3);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->_filename, a3);
}

- (NSNumber)documentIdentifier
{
  return self->_documentIdentifier;
}

- (void)setDocumentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_documentIdentifier, a3);
}

- (uint64_t)score
{
  return *(_QWORD *)(a1 + 992);
}

- (void)setScore:(SFSearchResult_SpotlightExtras *)self
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)self->_score = v2;
  *(_QWORD *)&self->_score[8] = v3;
}

- (float)l2score
{
  return self->_l2score;
}

- (void)setL2score:(float)a3
{
  self->_l2score = a3;
}

- (NSString)launchString
{
  return self->_launchString;
}

- (void)setLaunchString:(id)a3
{
  objc_storeStrong((id *)&self->_launchString, a3);
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedDate, a3);
}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void)setUserActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityType, a3);
}

- (NSMutableArray)duplicatedItems
{
  return self->_duplicatedItems;
}

- (void)setDuplicatedItems:(id)a3
{
  objc_storeStrong((id *)&self->_duplicatedItems, a3);
}

- (NSString)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
  objc_storeStrong((id *)&self->_contentURL, a3);
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (void)setPersonIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_personIdentifier, a3);
}

- (NSString)personQueryIdentifier
{
  return self->_personQueryIdentifier;
}

- (void)setPersonQueryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_personQueryIdentifier, a3);
}

- (NSString)relatedAppIdentifier
{
  return self->_relatedAppIdentifier;
}

- (void)setRelatedAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_relatedAppIdentifier, a3);
}

- (NSString)personalAnswerString
{
  return self->_personalAnswerString;
}

- (void)setPersonalAnswerString:(id)a3
{
  objc_storeStrong((id *)&self->_personalAnswerString, a3);
}

- (NSArray)answerAttributes
{
  return self->_answerAttributes;
}

- (void)setAnswerAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_answerAttributes, a3);
}

- (NSNumber)displayOrder
{
  return self->_displayOrder;
}

- (void)setDisplayOrder:(id)a3
{
  objc_storeStrong((id *)&self->_displayOrder, a3);
}

- (PRSRankingItem)rankingItem
{
  return (PRSRankingItem *)objc_getProperty(self, a2, 928, 1);
}

- (void)setRankingItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 928);
}

- (void)setSuggestionsFeedbackData:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsFeedbackData, a3);
}

- (unsigned)feedbackBlockId
{
  return self->_feedbackBlockId;
}

- (void)setFeedbackBlockId:(unsigned int)a3
{
  self->_feedbackBlockId = a3;
}

- (BOOL)hasCommunicationContent
{
  return self->_hasCommunicationContent;
}

- (void)setHasCommunicationContent:(BOOL)a3
{
  self->_hasCommunicationContent = a3;
}

- (BOOL)hasTextContent
{
  return self->_hasTextContent;
}

- (void)setHasTextContent:(BOOL)a3
{
  self->_hasTextContent = a3;
}

- (unint64_t)predictionsFeedbackActionType
{
  return self->_predictionsFeedbackActionType;
}

- (void)setPredictionsFeedbackActionType:(unint64_t)a3
{
  self->_predictionsFeedbackActionType = a3;
}

- (BOOL)forceNoTopHit
{
  return self->_forceNoTopHit;
}

- (void)setForceNoTopHit:(BOOL)a3
{
  self->_forceNoTopHit = a3;
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

- (void)setIsAppClip:(BOOL)a3
{
  self->_isAppClip = a3;
}

- (BOOL)isWebClip
{
  return self->_isWebClip;
}

- (void)setIsWebClip:(BOOL)a3
{
  self->_isWebClip = a3;
}

- (BOOL)isSafariTopHit
{
  return self->_isSafariTopHit;
}

- (void)setIsSafariTopHit:(BOOL)a3
{
  self->_isSafariTopHit = a3;
}

- (NSData)attributeData
{
  return self->_attributeData;
}

- (void)setAttributeData:(id)a3
{
  objc_storeStrong((id *)&self->_attributeData, a3);
}

- (IQFMapsPersonalizationResult)mapsPersonalizationResult
{
  return (IQFMapsPersonalizationResult *)objc_getProperty(self, a2, 960, 1);
}

- (void)setMapsPersonalizationResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 960);
}

- (NSString)personType
{
  return self->_personType;
}

- (void)setPersonType:(id)a3
{
  objc_storeStrong((id *)&self->_personType, a3);
}

- (BOOL)hasTextContentMatch
{
  return self->_hasTextContentMatch;
}

- (void)setHasTextContentMatch:(BOOL)a3
{
  self->_hasTextContentMatch = a3;
}

- (NSMutableDictionary)backendData
{
  return self->_backendData;
}

- (void)setBackendData:(id)a3
{
  objc_storeStrong((id *)&self->_backendData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backendData, 0);
  objc_storeStrong((id *)&self->_personType, 0);
  objc_storeStrong((id *)&self->_mapsPersonalizationResult, 0);
  objc_storeStrong((id *)&self->_attributeData, 0);
  objc_storeStrong((id *)&self->_suggestionsFeedbackData, 0);
  objc_storeStrong((id *)&self->_rankingItem, 0);
  objc_storeStrong((id *)&self->_displayOrder, 0);
  objc_storeStrong((id *)&self->_answerAttributes, 0);
  objc_storeStrong((id *)&self->_personalAnswerString, 0);
  objc_storeStrong((id *)&self->_relatedAppIdentifier, 0);
  objc_storeStrong((id *)&self->_personQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_duplicatedItems, 0);
  objc_storeStrong((id *)&self->_userActivityType, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_launchString, 0);
  objc_storeStrong((id *)&self->_documentIdentifier, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_parentFileIdentifier, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_cachedPunchout, 0);
}

- (void)initWithCoder:.cold.1()
{
  __assert_rtn("-[SFSearchResult_SpotlightExtras initWithCoder:]", "SFSearchResult_SpotlightExtras.m", 561, "[self.url isKindOfClass:[NSURL class]]");
}

- (void)encodeWithCoder:.cold.1()
{
  __assert_rtn("-[SFSearchResult_SpotlightExtras encodeWithCoder:]", "SFSearchResult_SpotlightExtras.m", 608, "[self.url isKindOfClass:[NSURL class]]");
}

- (void)setUrl:.cold.1()
{
  __assert_rtn("-[SFSearchResult_SpotlightExtras setUrl:]", "SFSearchResult_SpotlightExtras.m", 659, "!url || [url isKindOfClass:[NSURL class]]");
}

@end
