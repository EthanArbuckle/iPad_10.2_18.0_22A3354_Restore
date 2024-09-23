@implementation PGGraphContactSuggestionEdge

- (id)initFromPersonNode:(id)a3 toContactNode:(id)a4 confidence:(double)a5 contactScore:(double)a6 numberOfMomentsAtHome:(unint64_t)a7 numberOfMomentsAtMentionedAddress:(unint64_t)a8 numberOfWeakBirthdayMomentsAroundBirthdayDate:(unint64_t)a9 numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate:(unint64_t)a10 numberOfMomentsOverlappingWithCalendarEvents:(unint64_t)a11 numberOfAppearancesInSharedAssets:(unint64_t)a12 numberOfCMMMoments:(unint64_t)a13 facetimeFaceprintConfidence:(double)a14 contactFaceprintMatch:(BOOL)a15 relationshipsDebug:(id)a16 socialGroupsConfidence:(double)a17 socialGroupsDebug:(id)a18 messageGroupsDebug:(id)a19 birthdayScore:(double)a20 potentialBirthdayScore:(double)a21 addressScore:(double)a22 mentionedAddressScore:(double)a23 calendarScore:(double)a24 sharedAssetScore:(double)a25 sharedCMMScore:(double)a26 relationshipScore:(double)a27 scoreAfterMessagePenalty:(double)a28 sexMatch:(unint64_t)a29
{
  PGGraphContactSuggestionEdge *v44;
  PGGraphContactSuggestionEdge *v45;
  id v47;
  id v48;
  id v49;
  objc_super v50;

  v49 = a16;
  v48 = a18;
  v47 = a19;
  v50.receiver = self;
  v50.super_class = (Class)PGGraphContactSuggestionEdge;
  v44 = -[PGGraphEdge initWithSourceNode:targetNode:](&v50, sel_initWithSourceNode_targetNode_, a3, a4);
  v45 = v44;
  if (v44)
  {
    v44->_confidence = a5;
    v44->_contactScore = a6;
    v44->_numberOfMomentsAtHome = a7;
    v44->_numberOfMomentsAtMentionedAddress = a8;
    v44->_numberOfWeakBirthdayMomentsAroundBirthdayDate = a9;
    v44->_numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate = a10;
    v44->_numberOfMomentsOverlappingWithCalendarEvents = a11;
    v44->_numberOfAppearancesInSharedAssets = a12;
    v44->_contactFaceprintMatch = a15;
    v44->_numberOfCMMMoments = a13;
    v44->_facetimeFaceprintConfidence = a14;
    objc_storeStrong((id *)&v44->_relationshipsDebug, a16);
    v45->_socialGroupsConfidence = a17;
    objc_storeStrong((id *)&v45->_socialGroupsDebug, a18);
    objc_storeStrong((id *)&v45->_messageGroupsDebug, a19);
    v45->_birthdayScore = a20;
    v45->_potentialBirthdayScore = a21;
    v45->_addressScore = a22;
    v45->_mentionedAddressScore = a23;
    v45->_calendarScore = a24;
    v45->_sharedAssetScore = a25;
    v45->_sharedCMMScore = a26;
    v45->_relationshipScore = a27;
    v45->_scoreAfterMessagePenalty = a28;
    v45->_sexMatch = a29;
  }

  return v45;
}

- (PGGraphContactSuggestionEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  PGGraphContactSuggestionEdge *v62;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  double v74;

  v9 = a7;
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("confidence"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v74 = v13;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwscore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v73 = v15;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwnummmtshome"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v16, "unsignedIntegerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwnummentndaddrs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v17, "unsignedIntegerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwnumbdaymmt"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v18, "unsignedIntegerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwnummbdaymmt"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v19, "unsignedIntegerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwnummmtsclndrevents"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v20, "unsignedIntegerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwnumassts"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "unsignedIntegerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwnumcmm"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "unsignedIntegerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwftfprntconf"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  v67 = v26;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwfprntsmatch"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "BOOLValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwreldebug"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwsocialgrpsconf"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  v66 = v31;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwsocialgrps"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwmsggrps"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bdayscore"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "doubleValue");
  v65 = v35;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("pbdayscore"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "doubleValue");
  v38 = v37;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("addscore"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "doubleValue");
  v41 = v40;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("maddscore"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "doubleValue");
  v44 = v43;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("calscore"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "doubleValue");
  v47 = v46;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("asstscore"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "doubleValue");
  v50 = v49;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cmmscore"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "doubleValue");
  v53 = v52;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("relscore"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "doubleValue");
  v56 = v55;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("scoremfp"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "doubleValue");
  v59 = v58;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gwgenmatch"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = objc_msgSend(v60, "unsignedIntegerValue");
  LOBYTE(v64) = v28;
  v62 = -[PGGraphContactSuggestionEdge initFromPersonNode:toContactNode:confidence:contactScore:numberOfMomentsAtHome:numberOfMomentsAtMentionedAddress:numberOfWeakBirthdayMomentsAroundBirthdayDate:numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate:numberOfMomentsOverlappingWithCalendarEvents:numberOfAppearancesInSharedAssets:numberOfCMMMoments:facetimeFaceprintConfidence:contactFaceprintMatch:relationshipsDebug:socialGroupsConfidence:socialGroupsDebug:messageGroupsDebug:birthdayScore:potentialBirthdayScore:addressScore:mentionedAddressScore:calendarScore:sharedAssetScore:sharedCMMScore:relationshipScore:scoreAfterMessagePenalty:sexMatch:](self, "initFromPersonNode:toContactNode:confidence:contactScore:numberOfMomentsAtHome:numberOfMomentsAtMentionedAddress:numberOfWeakBirthdayMomentsAroundBirthdayDate:numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate:numberOfMomentsOverlappingWithCalendarEvents:numberOfAppearancesInSharedAssets:numberOfCMMMoments:facetimeFaceprintConfidence:contactFaceprintMatch:relationshipsDebug:socialGroupsConfidence:socialGroupsDebug:messageGroupsDebug:birthdayScore:potentialBirthdayScore:addressScore:mentionedAddressScore:calendarScore:sharedAssetScore:sharedCMMScore:relationshipScore:scoreAfterMessagePenalty:sexMatch:", v11, v10, v72, v71, v70, v69, v74, v73, v67, v66, v65, v38,
          v41,
          v44,
          v68,
          v22,
          v24,
          v64,
          v29,
          v32,
          v33,
          v47,
          v50,
          v53,
          v56,
          v59,
          v61);

  return v62;
}

- (PGGraphContactSuggestionEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  PGGraphContactSuggestionEdge *v22;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("confidence"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v17);
    *(float *)&v20 = a7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("confidence"));

    v17 = v19;
  }
  v22 = -[PGGraphContactSuggestionEdge initWithLabel:sourceNode:targetNode:domain:properties:](self, "initWithLabel:sourceNode:targetNode:domain:properties:", v14, v15, v16, v10, v17);

  return v22;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  BOOL v45;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidence"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      if (v8 != self->_confidence)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwscore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      if (v10 != self->_contactScore)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwnummmtshome"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "unsignedIntegerValue") != self->_numberOfMomentsAtHome)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwnummentndaddrs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "unsignedIntegerValue") != self->_numberOfMomentsAtMentionedAddress)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwnumbdaymmt"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v13)
    {
      if (objc_msgSend(v13, "unsignedIntegerValue") != self->_numberOfWeakBirthdayMomentsAroundBirthdayDate)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwnummbdaymmt"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "unsignedIntegerValue") != self->_numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwnummmtsclndrevents"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v15)
    {
      if (objc_msgSend(v15, "unsignedIntegerValue") != self->_numberOfMomentsOverlappingWithCalendarEvents)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwnumassts"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;
    if (v16)
    {
      if (objc_msgSend(v16, "unsignedIntegerValue") != self->_numberOfAppearancesInSharedAssets)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwnumcmm"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v17)
    {
      if (objc_msgSend(v17, "unsignedIntegerValue") != self->_numberOfCMMMoments)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwftfprntconf"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    if (v18)
    {
      objc_msgSend(v18, "doubleValue");
      if (v19 != self->_facetimeFaceprintConfidence)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwfprntsmatch"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v20;
    if (v20)
    {
      if (self->_contactFaceprintMatch != objc_msgSend(v20, "BOOLValue"))
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwreldebug"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (v21)
    {
      if (!objc_msgSend(v21, "isEqual:", self->_relationshipsDebug))
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwsocialgrpsconf"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v22;
    if (v22)
    {
      objc_msgSend(v22, "doubleValue");
      if (v23 != self->_socialGroupsConfidence)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwsocialgrps"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v24;
    if (v24)
    {
      if (!objc_msgSend(v24, "isEqual:", self->_socialGroupsDebug))
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwmsggrps"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v25;
    if (v25)
    {
      if (!objc_msgSend(v25, "isEqual:", self->_messageGroupsDebug))
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gwgenmatch"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v26;
    if (v26)
    {
      if (objc_msgSend(v26, "unsignedIntegerValue") != self->_sexMatch)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bdayscore"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v27;
    if (v27)
    {
      objc_msgSend(v27, "doubleValue");
      if (v28 != self->_birthdayScore)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pbdayscore"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v29;
    if (v29)
    {
      objc_msgSend(v29, "doubleValue");
      if (v30 != self->_potentialBirthdayScore)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addscore"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v31;
    if (v31)
    {
      objc_msgSend(v31, "doubleValue");
      if (v32 != self->_addressScore)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maddscore"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v33;
    if (v33)
    {
      objc_msgSend(v33, "doubleValue");
      if (v34 != self->_mentionedAddressScore)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("calscore"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v35;
    if (v35)
    {
      objc_msgSend(v35, "doubleValue");
      if (v36 != self->_calendarScore)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("asstscore"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v37;
    if (v37)
    {
      objc_msgSend(v37, "doubleValue");
      if (v38 != self->_sharedAssetScore)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cmmscore"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v39;
    if (v39)
    {
      objc_msgSend(v39, "doubleValue");
      if (v40 != self->_sharedCMMScore)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relscore"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v41;
    if (v41)
    {
      objc_msgSend(v41, "doubleValue");
      if (v42 != self->_relationshipScore)
        goto LABEL_53;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("scoremfp"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v43;
    if (!v43 || (objc_msgSend(v43, "doubleValue"), v44 == self->_scoreAfterMessagePenalty))
      v45 = 1;
    else
LABEL_53:
      v45 = 0;

  }
  else
  {
    v45 = 1;
  }

  return v45;
}

- (id)propertyDictionary
{
  uint64_t v3;
  NSString *relationshipsDebug;
  uint64_t v5;
  NSString *socialGroupsDebug;
  NSString *messageGroupsDebug;
  const __CFString *v8;
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
  _QWORD v33[25];
  _QWORD v34[27];

  v34[25] = *MEMORY[0x1E0C80C00];
  v33[0] = CFSTR("confidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v32;
  v33[1] = CFSTR("gwscore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_contactScore);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v31;
  v33[2] = CFSTR("gwnummmtshome");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfMomentsAtHome);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v30;
  v33[3] = CFSTR("gwnummentndaddrs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfMomentsAtMentionedAddress);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v29;
  v33[4] = CFSTR("gwnumbdaymmt");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfWeakBirthdayMomentsAroundBirthdayDate);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v28;
  v33[5] = CFSTR("gwnummbdaymmt");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v27;
  v33[6] = CFSTR("gwnummmtsclndrevents");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfMomentsOverlappingWithCalendarEvents);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v26;
  v33[7] = CFSTR("gwnumassts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfAppearancesInSharedAssets);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v25;
  v33[8] = CFSTR("gwnumcmm");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfCMMMoments);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[8] = v24;
  v33[9] = CFSTR("gwftfprntconf");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_facetimeFaceprintConfidence);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[9] = v23;
  v33[10] = CFSTR("gwfprntsmatch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_contactFaceprintMatch);
  v3 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v3;
  relationshipsDebug = self->_relationshipsDebug;
  if (!relationshipsDebug)
    relationshipsDebug = (NSString *)&stru_1E8436F28;
  v34[10] = v3;
  v34[11] = relationshipsDebug;
  v33[11] = CFSTR("gwreldebug");
  v33[12] = CFSTR("gwsocialgrpsconf");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_socialGroupsConfidence);
  v5 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v5;
  socialGroupsDebug = self->_socialGroupsDebug;
  if (!socialGroupsDebug)
    socialGroupsDebug = (NSString *)&stru_1E8436F28;
  v34[12] = v5;
  v34[13] = socialGroupsDebug;
  messageGroupsDebug = self->_messageGroupsDebug;
  v33[13] = CFSTR("gwsocialgrps");
  v33[14] = CFSTR("gwmsggrps");
  if (messageGroupsDebug)
    v8 = (const __CFString *)messageGroupsDebug;
  else
    v8 = &stru_1E8436F28;
  v34[14] = v8;
  v33[15] = CFSTR("gwgenmatch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sexMatch);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[15] = v20;
  v33[16] = CFSTR("bdayscore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_birthdayScore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[16] = v9;
  v33[17] = CFSTR("pbdayscore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_potentialBirthdayScore);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[17] = v10;
  v33[18] = CFSTR("addscore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_addressScore);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[18] = v11;
  v33[19] = CFSTR("maddscore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mentionedAddressScore);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[19] = v12;
  v33[20] = CFSTR("calscore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_calendarScore);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[20] = v13;
  v33[21] = CFSTR("asstscore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sharedAssetScore);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[21] = v14;
  v33[22] = CFSTR("cmmscore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sharedCMMScore);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[22] = v15;
  v33[23] = CFSTR("relscore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_relationshipScore);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[23] = v16;
  v33[24] = CFSTR("scoremfp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_scoreAfterMessagePenalty);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[24] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)edgeDescription
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[PGGraphContactSuggestionEdge propertyDictionary](self, "propertyDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[PGGraphContactSuggestionEdge _readableStringForContactSuggestionProperty:](self, "_readableStringForContactSuggestionProperty:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "isEqualToString:", CFSTR("gwgenmatch")))
        {
          -[PGGraphContactSuggestionEdge _stringForBiologicalSexMatch:](self, "_stringForBiologicalSexMatch:", objc_msgSend(v13, "integerValue"));
          v14 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v14;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), v10, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v15);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  objc_msgSend(v22, "sortedArrayUsingSelector:", sel_compare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB3940];
  v23.receiver = self;
  v23.super_class = (Class)PGGraphContactSuggestionEdge;
  -[PGGraphOptimizedEdge edgeDescription](&v23, sel_edgeDescription);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ (%@)"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("PEOPLE_CONTACT_SUGGESTION");
  return CFSTR("PEOPLE_CONTACT_SUGGESTION");
}

- (unsigned)domain
{
  return 303;
}

- (id)_stringForBiologicalSexMatch:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E842D210[a3];
}

- (BOOL)isFilteredOut
{
  double v2;

  -[PGGraphContactSuggestionEdge confidence](self, "confidence");
  return v2 == 0.0;
}

- (BOOL)isHighConfidence
{
  double v2;

  -[PGGraphContactSuggestionEdge confidence](self, "confidence");
  return v2 == 1.0;
}

- (unint64_t)numberOfMatchedRelationships
{
  unint64_t result;
  void *v4;
  unint64_t v5;

  result = -[NSString length](self->_relationshipsDebug, "length");
  if (result)
  {
    -[NSString componentsSeparatedByString:](self->_relationshipsDebug, "componentsSeparatedByString:", CFSTR(" , "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    return v5;
  }
  return result;
}

- (unint64_t)numberOfMatchedMessageGroups
{
  unint64_t result;
  void *v4;
  unint64_t v5;

  result = -[NSString length](self->_messageGroupsDebug, "length");
  if (result)
  {
    -[NSString componentsSeparatedByString:](self->_messageGroupsDebug, "componentsSeparatedByString:", CFSTR(" / "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    return v5;
  }
  return result;
}

- (BOOL)personContactBiologicalSexMatch
{
  return self->_sexMatch == 1;
}

- (BOOL)personContactBiologicalSexMismatch
{
  return self->_sexMatch == 2;
}

- (id)_readableStringForContactSuggestionProperty:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[23];
  _QWORD v11[24];

  v11[23] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("gwnummmtshome");
  v10[1] = CFSTR("gwnummentndaddrs");
  v11[0] = CFSTR("SignalNumberOfMomentsAtHome");
  v11[1] = CFSTR("SignalNumberOfMomentsAtMentionedAddress");
  v10[2] = CFSTR("gwnumbdaymmt");
  v10[3] = CFSTR("gwnummmtsclndrevents");
  v11[2] = CFSTR("SignalNumberOfWeakBirthdayMomentsAroundBirthdayDate");
  v11[3] = CFSTR("SignalNumberOfMomentsOverlappingWithCalendarEvents");
  v10[4] = CFSTR("gwnumassts");
  v10[5] = CFSTR("gwnumcmm");
  v11[4] = CFSTR("SignalNumberOfAppearancesInSharedAssets");
  v11[5] = CFSTR("SignalNumberOfSharedCMMWithPeople");
  v10[6] = CFSTR("gwftfprntconf");
  v10[7] = CFSTR("gwfprntsmatch");
  v11[6] = CFSTR("SignalFacetimeFaceprintConfidence");
  v11[7] = CFSTR("SignalContactFaceprintMatch");
  v10[8] = CFSTR("gwsocialgrpsconf");
  v10[9] = CFSTR("gwsocialgrps");
  v11[8] = CFSTR("SignalSocialGroupsConfidence");
  v11[9] = CFSTR("DebugSocialGroups");
  v10[10] = CFSTR("gwmsggrps");
  v10[11] = CFSTR("gwreldebug");
  v11[10] = CFSTR("DebugMessageGroups");
  v11[11] = CFSTR("SignalRelationships");
  v10[12] = CFSTR("gwgenmatch");
  v10[13] = CFSTR("gwscore");
  v11[12] = CFSTR("SignalBiologicalSexMatch");
  v11[13] = CFSTR("TotalContactScore");
  v10[14] = CFSTR("bdayscore");
  v10[15] = CFSTR("pbdayscore");
  v11[14] = CFSTR("SignalBirthdayScore");
  v11[15] = CFSTR("SignalPotentialBirthdayScore");
  v10[16] = CFSTR("addscore");
  v10[17] = CFSTR("maddscore");
  v11[16] = CFSTR("SignalAddressScore");
  v11[17] = CFSTR("SignalMentionedAddressScore");
  v10[18] = CFSTR("calscore");
  v10[19] = CFSTR("asstscore");
  v11[18] = CFSTR("SignalCalendarScore");
  v11[19] = CFSTR("SignalSharedAssetScore");
  v10[20] = CFSTR("cmmscore");
  v10[21] = CFSTR("relscore");
  v11[20] = CFSTR("SignalSharedCMMScore");
  v11[21] = CFSTR("SignalRelationshipScore");
  v10[22] = CFSTR("scoremfp");
  v11[22] = CFSTR("TotalScoreAfterMessageFrequencyPenalty");
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v11, v10, 23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v4;
  v8 = v6;

  return v8;
}

- (double)confidence
{
  return self->_confidence;
}

- (double)contactScore
{
  return self->_contactScore;
}

- (unint64_t)numberOfMomentsAtHome
{
  return self->_numberOfMomentsAtHome;
}

- (unint64_t)numberOfMomentsAtMentionedAddress
{
  return self->_numberOfMomentsAtMentionedAddress;
}

- (unint64_t)numberOfWeakBirthdayMomentsAroundBirthdayDate
{
  return self->_numberOfWeakBirthdayMomentsAroundBirthdayDate;
}

- (unint64_t)numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate
{
  return self->_numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate;
}

- (unint64_t)numberOfMomentsOverlappingWithCalendarEvents
{
  return self->_numberOfMomentsOverlappingWithCalendarEvents;
}

- (unint64_t)numberOfAppearancesInSharedAssets
{
  return self->_numberOfAppearancesInSharedAssets;
}

- (unint64_t)numberOfCMMMoments
{
  return self->_numberOfCMMMoments;
}

- (double)facetimeFaceprintConfidence
{
  return self->_facetimeFaceprintConfidence;
}

- (BOOL)contactFaceprintMatch
{
  return self->_contactFaceprintMatch;
}

- (NSString)relationshipsDebug
{
  return self->_relationshipsDebug;
}

- (double)socialGroupsConfidence
{
  return self->_socialGroupsConfidence;
}

- (NSString)socialGroupsDebug
{
  return self->_socialGroupsDebug;
}

- (NSString)messageGroupsDebug
{
  return self->_messageGroupsDebug;
}

- (double)birthdayScore
{
  return self->_birthdayScore;
}

- (double)potentialBirthdayScore
{
  return self->_potentialBirthdayScore;
}

- (double)addressScore
{
  return self->_addressScore;
}

- (double)mentionedAddressScore
{
  return self->_mentionedAddressScore;
}

- (double)calendarScore
{
  return self->_calendarScore;
}

- (double)sharedAssetScore
{
  return self->_sharedAssetScore;
}

- (double)sharedCMMScore
{
  return self->_sharedCMMScore;
}

- (double)relationshipScore
{
  return self->_relationshipScore;
}

- (double)scoreAfterMessagePenalty
{
  return self->_scoreAfterMessagePenalty;
}

- (unint64_t)sexMatch
{
  return self->_sexMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageGroupsDebug, 0);
  objc_storeStrong((id *)&self->_socialGroupsDebug, 0);
  objc_storeStrong((id *)&self->_relationshipsDebug, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("PEOPLE_CONTACT_SUGGESTION"), 303);
}

@end
