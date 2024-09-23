@implementation PPSocialHighlightFeedbackUtils

+ (id)stringifyBiomeFeedbackType:(unint64_t)a3
{
  unint64_t v4;

  objc_opt_self();
  v4 = 10;
  if (a3 < 0xA)
    v4 = a3;
  return off_1E7E158C0[v4];
}

+ (id)biomeEventFromFeedback:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v41;
  int v42;
  int v43;
  uint64_t v44;
  const __CFString *v45;
  int v46;
  void *v47;
  id v48;
  void *v49;
  unsigned int v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "feedbackCreationSecondsSinceReferenceDate");
  v6 = (void *)objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:");
  v7 = objc_alloc(MEMORY[0x1E0D02770]);
  objc_msgSend(v4, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "feedbackType");
  objc_opt_self();
  objc_msgSend(v4, "highlight");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  if (v10
    && ((objc_msgSend(v10, "hasHighlightIdentifier") & 1) != 0
     || objc_msgSend(v10, "hasAttributionIdentifier")))
  {
    if (objc_msgSend(v10, "hasSyndicationSecondsSinceReferenceDate"))
    {
      v11 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v10, "syndicationSecondsSinceReferenceDate");
      v12 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v12 = 0;
    }
    if (objc_msgSend(v10, "hasContentCreationSecondsSinceReferenceDate"))
    {
      v14 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v10, "contentCreationSecondsSinceReferenceDate");
      v60 = (void *)objc_msgSend(v14, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v60 = 0;
    }
    if (objc_msgSend(v10, "hasRankingSecondsSinceReferenceDate"))
    {
      v15 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v10, "rankingSecondsSinceReferenceDate");
      v59 = (void *)objc_msgSend(v15, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v59 = 0;
    }
    v48 = objc_alloc(MEMORY[0x1E0D026F8]);
    objc_msgSend(v10, "highlightIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = &stru_1E7E221D0;
    v47 = (void *)v16;
    if (v16)
      v17 = (const __CFString *)v16;
    v45 = v17;
    v18 = objc_msgSend(v10, "highlightType");
    objc_opt_self();
    if (v18 == 2)
      v19 = 2;
    else
      v19 = v18 == 1;
    objc_msgSend(v10, "sourceBundleId");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationIdentifiers");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v10, "hasResourceUrl");
    v44 = v19;
    v20 = v12;
    if (v46)
    {
      v21 = objc_alloc(MEMORY[0x1E0C99E98]);
      objc_msgSend(v10, "resourceUrl");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)objc_msgSend(v21, "initWithString:");
    }
    else
    {
      v57 = 0;
    }
    objc_msgSend(v10, "sender");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v53 = v22;
    v50 = v9;
    if (v22 && objc_msgSend(v22, "hasHandle"))
    {
      v23 = objc_alloc(MEMORY[0x1E0D02768]);
      objc_msgSend(v22, "handle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "hasIsSignificant"))
        v25 = objc_msgSend(v22, "isSignificant");
      else
        v25 = 0;
      if (objc_msgSend(v22, "hasIsMe"))
        v26 = objc_msgSend(v22, "isMe");
      else
        v26 = 0;
      v58 = (void *)objc_msgSend(v23, "initWithHandle:isSignificant:isMe:", v24, v25, v26);

    }
    else
    {
      v58 = 0;
    }

    objc_msgSend(v10, "domainIdentifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "batchIdentifier");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupPhotoPathDigest");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayName");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v10, "hasIsPrimary");
    if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "isPrimary"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v56 = 0;
    }
    v27 = (void *)v20;
    objc_msgSend(v10, "attributionIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v10, "hasRank");
    if (v42)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "rank"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v55 = 0;
    }
    v28 = objc_msgSend(v10, "hasScore");
    v52 = v6;
    if (v28)
    {
      v29 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "score");
      objc_msgSend(v29, "numberWithDouble:");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v54 = 0;
    }
    v30 = objc_msgSend(v10, "hasIsConversationAutoDonating");
    v51 = v7;
    v31 = v8;
    if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "isConversationAutoDonating"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
    objc_msgSend(v10, "originatingDeviceId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolvedUrl");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "variant");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v48;
    v49 = v27;
    v13 = (void *)objc_msgSend(v36, "initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:", v45, v44, v27, v68, v67, v57, v58, v66, v65, 0, v64, v60, v63, v62,
                    v56,
                    v61,
                    v55,
                    v54,
                    v32,
                    v33,
                    v59,
                    v34,
                    v35);

    if (v30)
    v8 = v31;
    v7 = v51;
    if (v28)

    v6 = v52;
    v9 = v50;
    if (v42)

    if (v43)
    if (v46)
    {

    }
  }
  else
  {
    v13 = 0;
  }
  if (v9 >= 9)
    v37 = 9;
  else
    v37 = v9;

  objc_msgSend(v4, "variant");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)objc_msgSend(v7, "initWithClientIdentifier:feedbackType:feedbackCreationDate:highlight:clientVariant:", v8, v37, v6, v13, v38);
  return v39;
}

+ (id)feedbackFromBiomeEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
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
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
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
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientIdentifier:", v5);

  v6 = objc_msgSend(v3, "feedbackType");
  objc_opt_self();
  if (v6 >= 0xA)
    v7 = 10;
  else
    v7 = v6;
  objc_msgSend(v4, "setFeedbackType:", v7);
  objc_msgSend(v3, "feedbackCreationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setFeedbackCreationSecondsSinceReferenceDate:");

  objc_msgSend(v3, "highlight");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  if (v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v9, "applicationIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v10, "setApplicationIdentifiers:", v12);

    objc_msgSend(v9, "attributionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributionIdentifier:", v13);

    objc_msgSend(v9, "batchIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBatchIdentifier:", v14);

    objc_msgSend(v9, "calculatedFeatures");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v9, "calculatedFeatures");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCalculatedFeaturesFromDictionary:", v16);

    }
    objc_msgSend(v9, "clientIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClientIdentifier:", v17);

    objc_msgSend(v9, "clientVariant");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVariant:", v18);

    objc_msgSend(v9, "contentCreationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v9, "contentCreationDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceReferenceDate");
      objc_msgSend(v10, "setContentCreationSecondsSinceReferenceDate:");

    }
    objc_msgSend(v9, "displayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDisplayName:", v21);

    objc_msgSend(v9, "domainIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDomainIdentifier:", v22);

    objc_msgSend(v9, "groupPhotoPathDigest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setGroupPhotoPathDigest:", v23);

    objc_msgSend(v9, "highlightIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHighlightIdentifier:", v24);

    v25 = objc_msgSend(v9, "highlightType");
    objc_opt_self();
    if (v25 == 1)
      v26 = 1;
    else
      v26 = 2;
    if (v25)
      v27 = v26;
    else
      v27 = 0;
    objc_msgSend(v10, "setHighlightType:", v27);
    objc_msgSend(v9, "isConversationAutoDonating");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v9, "isConversationAutoDonating");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setIsConversationAutoDonating:", objc_msgSend(v29, "BOOLValue"));

    }
    objc_msgSend(v9, "isPrimary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v9, "isPrimary");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setIsPrimary:", objc_msgSend(v31, "BOOLValue"));

    }
    objc_msgSend(v9, "originatingDeviceId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOriginatingDeviceId:", v32);

    objc_msgSend(v9, "rank");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v9, "rank");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRank:", objc_msgSend(v34, "unsignedIntValue"));

    }
    objc_msgSend(v9, "rankingDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v9, "rankingDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "timeIntervalSinceReferenceDate");
      objc_msgSend(v10, "setRankingSecondsSinceReferenceDate:");

    }
    objc_msgSend(v9, "resolvedUrl");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setResolvedUrl:", v37);

    objc_msgSend(v9, "resourceUrl");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "absoluteString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setResourceUrl:", v39);

    objc_msgSend(v9, "score");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v9, "score");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "doubleValue");
      objc_msgSend(v10, "setScore:");

    }
    objc_msgSend(v9, "sender");
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    if (v42)
    {
      v43 = (void *)objc_opt_new();
      objc_msgSend(v42, "handle");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setHandle:", v44);

      objc_msgSend(v43, "setIsMe:", objc_msgSend(v42, "isMe"));
      objc_msgSend(v43, "setIsSignificant:", objc_msgSend(v42, "isSignificant"));
    }
    else
    {
      v43 = 0;
    }

    objc_msgSend(v10, "setSender:", v43);
    objc_msgSend(v9, "sourceBundleId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSourceBundleId:", v45);

    objc_msgSend(v9, "syndicationDate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v9, "syndicationDate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "timeIntervalSinceReferenceDate");
      objc_msgSend(v10, "setSyndicationSecondsSinceReferenceDate:");

    }
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(v4, "setHighlight:", v10);
  objc_msgSend(v3, "clientVariant");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setVariant:", v48);
  return v4;
}

@end
