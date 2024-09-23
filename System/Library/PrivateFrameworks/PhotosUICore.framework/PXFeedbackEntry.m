@implementation PXFeedbackEntry

- (PXFeedbackEntry)init
{
  PXFeedbackEntry *v2;
  id v3;
  uint64_t v4;
  NSDictionary *feedbackItemDetails;
  objc_super v7;
  _QWORD v8[53];
  _QWORD v9[54];

  v9[53] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)PXFeedbackEntry;
  v2 = -[PXFeedbackEntry init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PXFeedbackEntry setFeedbackItemsDict:](v2, "setFeedbackItemsDict:", v3);

    v8[0] = kPXFeedbackUserLikedCollectionKey;
    v8[1] = kPXFeedbackUserDislikedCollectionKey;
    v9[0] = &unk_1E53F00E8;
    v9[1] = &unk_1E53F0110;
    v8[2] = kPXFeedbackUserLikedDetailViewSourceYear;
    v8[3] = kPXFeedbackUserLikedDetailViewSourceMoment;
    v9[2] = &unk_1E53F0138;
    v9[3] = &unk_1E53F0160;
    v8[4] = kPXFeedbackUserLikedDetailViewSourceMemory;
    v8[5] = kPXFeedbackUserLikedDetailViewSourceAlbum;
    v9[4] = &unk_1E53F0188;
    v9[5] = &unk_1E53F01B0;
    v8[6] = kPXFeedbackUserLikedDetailViewSourceFace;
    v8[7] = kPXFeedbackUserLikedDetailViewSourceCollection;
    v9[6] = &unk_1E53F01D8;
    v9[7] = &unk_1E53F0200;
    v8[8] = kPXFeedbackUserLikedDetailViewSourceRelated;
    v8[9] = kPXFeedbackUserLikedDetailViewReasonGoodMovie;
    v9[8] = &unk_1E53F0228;
    v9[9] = &unk_1E53F0250;
    v8[10] = kPXFeedbackUserLikedDetailViewReasonGoodSelectionOfPhotosInGrid;
    v8[11] = kPXFeedbackUserLikedDetailViewReasonRediscoveredOldPhotos;
    v9[10] = &unk_1E53F0278;
    v9[11] = &unk_1E53F02A0;
    v8[12] = kPXFeedbackUserLikedDetailViewReasonRediscoveredPeople;
    v8[13] = kPXFeedbackUserLikedDetailViewReasonRediscoveredPlace;
    v9[12] = &unk_1E53F02C8;
    v9[13] = &unk_1E53F02F0;
    v8[14] = kPXFeedbackUserLikedDetailViewReasonRediscoveredEvent;
    v8[15] = kPXFeedbackUserLikedDetailViewReasonMeaningfulCollection;
    v9[14] = &unk_1E53F0318;
    v9[15] = &unk_1E53F0340;
    v8[16] = kPXFeedbackUserLikedDetailViewReasonManyMeaningfulRelatedCollectionsIncluded;
    v8[17] = kPXFeedbackUserLikedDetailViewReasonGoodKeyPhotosRepresentingCollectionsInRelated;
    v9[16] = &unk_1E53F0368;
    v9[17] = &unk_1E53F0390;
    v8[18] = kPXFeedbackUserDislikedDetailViewSourceYear;
    v8[19] = kPXFeedbackUserDislikedDetailViewSourceMoment;
    v9[18] = &unk_1E53F03B8;
    v9[19] = &unk_1E53F03E0;
    v8[20] = kPXFeedbackUserDislikedDetailViewSourceMemory;
    v8[21] = kPXFeedbackUserDislikedDetailViewSourceAlbum;
    v9[20] = &unk_1E53F0408;
    v9[21] = &unk_1E53F0430;
    v8[22] = kPXFeedbackUserDislikedDetailViewSourceFace;
    v8[23] = kPXFeedbackUserDislikedDetailViewSourceCollection;
    v9[22] = &unk_1E53F0458;
    v9[23] = &unk_1E53F0480;
    v8[24] = kPXFeedbackUserDislikedDetailViewSourceRelated;
    v8[25] = kPXFeedbackUserDislikedDetailViewReasonNotSoGoodMovie;
    v9[24] = &unk_1E53F04A8;
    v9[25] = &unk_1E53F04D0;
    v8[26] = kPXFeedbackUserDislikedDetailViewReasonNotSoInterestingSelectionOfPhotos;
    v8[27] = kPXFeedbackUserDislikedDetailViewReasonTooManyJunkPhotosInGrid;
    v9[26] = &unk_1E53F04F8;
    v9[27] = &unk_1E53F0520;
    v8[28] = kPXFeedbackUserDislikedDetailViewReasonTooManySimilarPhotosInGrid;
    v8[29] = kPXFeedbackUserDislikedDetailViewReasonTooManyBadQualityPhotosInGrid;
    v9[28] = &unk_1E53F0548;
    v9[29] = &unk_1E53F0570;
    v8[30] = kPXFeedbackUserDislikedDetailViewReasonTooManyPhotosInGrid;
    v8[31] = kPXFeedbackUserDislikedDetailViewReasonNotEnoughPhotosInGrid;
    v9[30] = &unk_1E53F0598;
    v9[31] = &unk_1E53F05C0;
    v8[32] = kPXFeedbackUserDislikedDetailViewReasonNotVeryMeaningfulCollection;
    v8[33] = kPXFeedbackUserDislikedDetailViewReasonRelatedCollectionsMissing;
    v9[32] = &unk_1E53F05E8;
    v9[33] = &unk_1E53F0610;
    v8[34] = kPXFeedbackUserDislikedDetailViewReasonRelatedCollectionsNotRelated;
    v8[35] = kPXFeedbackUserDislikedDetailViewReasonNotSoGoodPhotosRepresentingCollectionsInRelated;
    v9[34] = &unk_1E53F0638;
    v9[35] = &unk_1E53F0660;
    v8[36] = kPXFeedbackUserLikedMemoriesKey;
    v8[37] = kPXFeedbackUserDislikedMemoriesKey;
    v9[36] = &unk_1E53F0688;
    v9[37] = &unk_1E53F06B0;
    v8[38] = kPXFeedbackMeaningfulMemoriesKey;
    v8[39] = kPXFeedbackGoodVarietyInMemoriesKey;
    v9[38] = &unk_1E53F06D8;
    v9[39] = &unk_1E53F0700;
    v8[40] = kPXFeedbackGoodSelectionsOfMemoriesRelatedToYourCurrentLocationAndPeopleNearYouKey;
    v8[41] = kPXFeedbackGoodAmountOfMemoriesKey;
    v9[40] = &unk_1E53F0728;
    v9[41] = &unk_1E53F0750;
    v8[42] = kPXFeedbackRediscoveredOldMemoriesKey;
    v8[43] = kPXFeedbackRediscoveredRecentMemoriesKey;
    v9[42] = &unk_1E53F0778;
    v9[43] = &unk_1E53F07A0;
    v8[44] = kPXFeedbackRediscoveredPeopleKey;
    v8[45] = kPXFeedbackRediscoveredPlaceKey;
    v9[44] = &unk_1E53F07C8;
    v9[45] = &unk_1E53F07F0;
    v8[46] = kPXFeedbackRediscoveredEventKey;
    v8[47] = kPXFeedbackGoodKeyPhotosRepresentingMemoriesKey;
    v9[46] = &unk_1E53F0818;
    v9[47] = &unk_1E53F0840;
    v8[48] = kPXFeedbackNotVeryMeaningfulMemoriesKey;
    v8[49] = kPXFeedbackLackOfVarietyInMemoriesKey;
    v9[48] = &unk_1E53F0868;
    v9[49] = &unk_1E53F0890;
    v8[50] = kPXFeedbackPoorSelectionOfMemoriesRelatedToYourCurrentLocationAndPeopleNearYouKey;
    v8[51] = kPXFeedbackNotEnoughMemoriesKey;
    v9[50] = &unk_1E53F08B8;
    v9[51] = &unk_1E53F08E0;
    v8[52] = kPXFeedbackNotSoGoodKeyPhotosRepresentingMemoriesKey;
    v9[52] = &unk_1E53F0908;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 53);
    v4 = objc_claimAutoreleasedReturnValue();
    feedbackItemDetails = v2->_feedbackItemDetails;
    v2->_feedbackItemDetails = (NSDictionary *)v4;

  }
  return v2;
}

- (PXFeedbackEntry)initWithSystemID:(id)a3 timestamp:(id)a4
{
  id v6;
  id v7;
  PXFeedbackEntry *v8;
  PXFeedbackEntry *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *appVersion;

  v6 = a3;
  v7 = a4;
  v8 = -[PXFeedbackEntry init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[PXFeedbackEntry setGeneralFeedback:](v8, "setGeneralFeedback:", 0);
    -[PXFeedbackEntry setSystemID:](v9, "setSystemID:", v6);
    -[PXFeedbackEntry setTimestamp:](v9, "setTimestamp:", v7);
    -[PXFeedbackEntry setAlreadyCollected:](v9, "setAlreadyCollected:", 0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "infoDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("CFBundleShortVersionString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "infoDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0C9AE90]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), v12, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    appVersion = v9->_appVersion;
    v9->_appVersion = (NSString *)v16;

  }
  return v9;
}

- (PXFeedbackEntry)initWithCoder:(id)a3
{
  id v4;
  PXFeedbackEntry *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXFeedbackEntry;
  v5 = -[PXFeedbackEntry init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("feedbackItemsDict"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeedbackEntry setFeedbackItemsDict:](v5, "setFeedbackItemsDict:", v6);

    -[PXFeedbackEntry feedbackItemsDict](v5, "feedbackItemsDict");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[PXFeedbackEntry setFeedbackItemsDict:](v5, "setFeedbackItemsDict:", v8);

    }
    -[PXFeedbackEntry setGeneralFeedback:](v5, "setGeneralFeedback:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("generalFeedback")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeedbackEntry setSystemID:](v5, "setSystemID:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeedbackEntry setTimestamp:](v5, "setTimestamp:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeedbackEntry setAppVersion:](v5, "setAppVersion:", v11);

    -[PXFeedbackEntry setAlreadyCollected:](v5, "setAlreadyCollected:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("alreadyCollected")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PXFeedbackEntry feedbackItemsDict](self, "feedbackItemsDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("feedbackItemsDict"));

  objc_msgSend(v8, "encodeInt:forKey:", -[PXFeedbackEntry generalFeedback](self, "generalFeedback"), CFSTR("generalFeedback"));
  -[PXFeedbackEntry systemID](self, "systemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("systemID"));

  -[PXFeedbackEntry timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("timestamp"));

  -[PXFeedbackEntry appVersion](self, "appVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("appVersion"));

  objc_msgSend(v8, "encodeBool:forKey:", -[PXFeedbackEntry alreadyCollected](self, "alreadyCollected"), CFSTR("alreadyCollected"));
}

- (id)uniqueID
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss.SSSSS"));
  -[PXFeedbackEntry timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PXFeedbackEntry systemID](self, "systemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringToIndex:", 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)userLikedResults
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v10[0] = kPXFeedbackUserLikedCollectionKey;
  v10[1] = kPXFeedbackUserLikedMemoriesKey;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PXFeedbackEntry_userLikedResults__block_invoke;
  v5[3] = &unk_1E511ED70;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
  LOBYTE(self) = *((_BYTE *)v7 + 24) != 0;

  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (id)osKeyForItemKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_feedbackItemDetails, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("osKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
    NSLog(CFSTR("ERROR: uknown itemKey: %@"), v4);

  return v6;
}

- (id)asTextForItemKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_feedbackItemDetails, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("asText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
    NSLog(CFSTR("ERROR: uknown itemKey: %@"), v4);

  return v6;
}

- (id)longDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__61336;
  v34 = __Block_byref_object_dispose__61337;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>]\n"), v5, self);
  v35 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)v31[5];
  -[PXFeedbackEntry uniqueID](self, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("   - uniqueID  : %@\n"), v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v31[5];
  v31[5] = v8;

  v10 = (void *)v31[5];
  -[PXFeedbackEntry systemID](self, "systemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("   - systemID  : %@\n"), v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v31[5];
  v31[5] = v12;

  v14 = (void *)v31[5];
  -[PXFeedbackEntry appVersion](self, "appVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("   - appVersion: %@\n"), v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v31[5];
  v31[5] = v16;

  v18 = (void *)v31[5];
  -[PXFeedbackEntry timestamp](self, "timestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("   - timestamp : %@\n"), v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v31[5];
  v31[5] = v20;

  objc_msgSend((id)v31[5], "stringByAppendingFormat:", CFSTR("   - generalFB : %ld\n"), -[PXFeedbackEntry generalFeedback](self, "generalFeedback"));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v31[5];
  v31[5] = v22;

  objc_msgSend((id)v31[5], "stringByAppendingFormat:", CFSTR("\n\n"));
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v31[5];
  v31[5] = v24;

  -[PXFeedbackEntry feedbackItemsDict](self, "feedbackItemsDict");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __34__PXFeedbackEntry_longDescription__block_invoke;
  v29[3] = &unk_1E513E2F0;
  v29[4] = &v30;
  objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v29);

  v27 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v27;
}

- (NSMutableDictionary)feedbackItemsDict
{
  return self->_feedbackItemsDict;
}

- (void)setFeedbackItemsDict:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackItemsDict, a3);
}

- (int64_t)generalFeedback
{
  return self->_generalFeedback;
}

- (void)setGeneralFeedback:(int64_t)a3
{
  self->_generalFeedback = a3;
}

- (NSString)systemID
{
  return self->_systemID;
}

- (void)setSystemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (BOOL)alreadyCollected
{
  return self->_alreadyCollected;
}

- (void)setAlreadyCollected:(BOOL)a3
{
  self->_alreadyCollected = a3;
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_systemID, 0);
  objc_storeStrong((id *)&self->_feedbackItemsDict, 0);
  objc_storeStrong((id *)&self->_feedbackItemDetails, 0);
}

void __34__PXFeedbackEntry_longDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToNumber:", MEMORY[0x1E0C9AAB0]))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = objc_msgSend(v5, "isEqualToNumber:", MEMORY[0x1E0C9AAB0]);
    v8 = CFSTR("No");
    if (v7)
      v8 = CFSTR("Yes");
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("   - %@  : \t\t\t%@\n"), v12, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

void __35__PXFeedbackEntry_userLikedResults__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "feedbackItemsDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v9, "isEqualToNumber:", MEMORY[0x1E0C9AAB0]);
  if ((_DWORD)v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)positiveFeedbackForMemoryDetailsKeys
{
  if (positiveFeedbackForMemoryDetailsKeys_onceToken != -1)
    dispatch_once(&positiveFeedbackForMemoryDetailsKeys_onceToken, &__block_literal_global_61563);
  return (id)positiveFeedbackForMemoryDetailsKeys_sharedPositiveFeedbackForMemoryDetailsKeys;
}

+ (id)negativeFeedbackForMemoryDetailsKeys
{
  if (negativeFeedbackForMemoryDetailsKeys_onceToken != -1)
    dispatch_once(&negativeFeedbackForMemoryDetailsKeys_onceToken, &__block_literal_global_571);
  return (id)negativeFeedbackForMemoryDetailsKeys_sharedNegativeFeedbackForMemoryDetailsKeys;
}

+ (id)positiveFeedbackForMemoriesKeys
{
  if (positiveFeedbackForMemoriesKeys_onceToken != -1)
    dispatch_once(&positiveFeedbackForMemoriesKeys_onceToken, &__block_literal_global_572);
  return (id)positiveFeedbackForMemoriesKeys_sharedPositiveFeedbackForMemoriesKeys;
}

+ (id)negativeFeedbackForMemoriesKeys
{
  if (negativeFeedbackForMemoriesKeys_onceToken != -1)
    dispatch_once(&negativeFeedbackForMemoriesKeys_onceToken, &__block_literal_global_573);
  return (id)negativeFeedbackForMemoriesKeys_sharedNegativeFeedbackForMemoriesKeys;
}

+ (id)positiveFeedbackForAutoLoopKeys
{
  if (positiveFeedbackForAutoLoopKeys_onceToken != -1)
    dispatch_once(&positiveFeedbackForAutoLoopKeys_onceToken, &__block_literal_global_574);
  return (id)positiveFeedbackForAutoLoopKeys_sharedPositiveFeedbackForAutoLoopKeys;
}

+ (id)negativeFeedbackForAutoLoopKeys
{
  if (negativeFeedbackForAutoLoopKeys_onceToken != -1)
    dispatch_once(&negativeFeedbackForAutoLoopKeys_onceToken, &__block_literal_global_575);
  return (id)negativeFeedbackForAutoLoopKeys_sharedNegativeFeedbackForAutoLoopKeys;
}

+ (id)positiveFeedbackForImageQualityKeys
{
  if (positiveFeedbackForImageQualityKeys_onceToken != -1)
    dispatch_once(&positiveFeedbackForImageQualityKeys_onceToken, &__block_literal_global_576);
  return (id)positiveFeedbackForImageQualityKeys_sharedPositiveFeedbackForImageQualityKeys;
}

+ (id)negativeFeedbackForImageQualityKeys
{
  if (negativeFeedbackForImageQualityKeys_onceToken != -1)
    dispatch_once(&negativeFeedbackForImageQualityKeys_onceToken, &__block_literal_global_577);
  return (id)negativeFeedbackForImageQualityKeys_sharedNegativeFeedbackForImageQualityKeys;
}

+ (id)negativeAlchemistFeedbackForImageQualityKeys
{
  if (negativeAlchemistFeedbackForImageQualityKeys_onceToken != -1)
    dispatch_once(&negativeAlchemistFeedbackForImageQualityKeys_onceToken, &__block_literal_global_579);
  return (id)negativeAlchemistFeedbackForImageQualityKeys_negativeAlchemistFeedbackForImageQualityKeys;
}

+ (id)createFakeTestEntry
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXFeedbackEntry *v7;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifierForVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MyApp%ld.%ld(%ld)"), 1, arc4random() & 1, 101);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXFeedbackEntry initWithSystemID:timestamp:]([PXFeedbackEntry alloc], "initWithSystemID:timestamp:", v4, v5);
  -[PXFeedbackEntry setAppVersion:](v7, "setAppVersion:", v6);

  return v7;
}

+ (id)createFakeTestFeedbackDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifierForVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MyApp%ld.%ld(%ld)"), 1, arc4random() & 1, 101);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v4, kPXFeedbackEntrySystemIDKey);
  objc_msgSend(v7, "setValue:forKey:", v5, kPXFeedbackEntryTimestampKey);
  objc_msgSend(v7, "setValue:forKey:", v6, kPXFeedbackEntryAppVersionKey);

  return v7;
}

void __63__PXFeedbackEntry_negativeAlchemistFeedbackForImageQualityKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = kPXFeedbackImageQualitySceneScaleFeelsWrongKey;
  v2[1] = kPXFeedbackImageQualityUncomfortableFlickeringKey;
  v2[2] = kPXFeedbackImageQualityBoundaryOfObjectInaccurateKey;
  v2[3] = kPXFeedbackImageQualityObjectsSeemDetachedKey;
  v2[4] = kPXFeedbackImageQualityPersonPetObjectSplitIntoPartsKey;
  v2[5] = kPXFeedbackImageQualityForegroundStuckToBackgroundKey;
  v2[6] = kPXFeedbackImageQualityPersonPetPartiallyDeformedKey;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)negativeAlchemistFeedbackForImageQualityKeys_negativeAlchemistFeedbackForImageQualityKeys;
  negativeAlchemistFeedbackForImageQualityKeys_negativeAlchemistFeedbackForImageQualityKeys = v0;

}

void __54__PXFeedbackEntry_negativeFeedbackForImageQualityKeys__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[20];

  v4[19] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v4[0] = kPXFeedbackImageQualityBadColorKey;
  v4[1] = kPXFeedbackImageQualityBadFocusKey;
  v4[2] = kPXFeedbackImageQualityBadContrastKey;
  v4[3] = kPXFeedbackImageQualityTooNoisyKey;
  v4[4] = kPXFeedbackImageQualityBlurryKey;
  v4[5] = kPXFeedbackImageQualityBadHDRKey;
  v4[6] = kPXFeedbackImageQualityBadFlashKey;
  v4[7] = kPXFeedbackImageQualityBadPortraitBlurKey;
  v4[8] = kPXFeedbackImageQualityShortLivePhotoKey;
  v4[9] = kPXFeedbackImageQualityMuteLivePhotoKey;
  v4[10] = kPXFeedbackImageQualitySemanticDevelopmentBadEffectKey;
  v4[11] = kPXFeedbackImageQualitySemanticDevelopmentNoEffectKey;
  v4[12] = kPXFeedbackImageQualityBadTrackingCPVKey;
  v4[13] = kPXFeedbackImageQualityBadCinematographyCPVKey;
  v4[14] = kPXFeedbackImageQualityBadRenderingCPVKey;
  v4[15] = kPXFeedbackImageQualityHardToChangeCPVKey;
  v4[16] = kPXFeedbackImageQualityGenericBadCPVKey;
  v4[17] = kPXFeedbackProvideOriginalAndEdit;
  v4[18] = kPXFeedbackProvideOriginalAndEditSysdiagnose;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 19);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)negativeFeedbackForImageQualityKeys_sharedNegativeFeedbackForImageQualityKeys;
  negativeFeedbackForImageQualityKeys_sharedNegativeFeedbackForImageQualityKeys = v2;

}

void __54__PXFeedbackEntry_positiveFeedbackForImageQualityKeys__block_invoke()
{
  void *v0;

  v0 = (void *)positiveFeedbackForImageQualityKeys_sharedPositiveFeedbackForImageQualityKeys;
  positiveFeedbackForImageQualityKeys_sharedPositiveFeedbackForImageQualityKeys = MEMORY[0x1E0C9AA60];

}

void __50__PXFeedbackEntry_negativeFeedbackForAutoLoopKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];

  v2[9] = *MEMORY[0x1E0C80C00];
  v2[0] = kPXFeedbackAutoLoopPauseOrGlitch;
  v2[1] = kPXFeedbackAutoLoopUnpleasantCrossfade;
  v2[2] = kPXFeedbackAutoLoopUnsuitableContent;
  v2[3] = kPXFeedbackAutoLoopTooLittleActivity;
  v2[4] = kPXFeedbackAutoLoopTooShort;
  v2[5] = kPXFeedbackAutoLoopPoorImageQuality;
  v2[6] = kPXFeedbackAutoLoopBadStabilization;
  v2[7] = kPXFeedbackAutoLoopBadPanning;
  v2[8] = kPXFeedbackAutoLoopPeopleOrFaceIssues;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)negativeFeedbackForAutoLoopKeys_sharedNegativeFeedbackForAutoLoopKeys;
  negativeFeedbackForAutoLoopKeys_sharedNegativeFeedbackForAutoLoopKeys = v0;

}

void __50__PXFeedbackEntry_positiveFeedbackForAutoLoopKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = kPXFeedbackAutoLoopExceptionallyGood;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)positiveFeedbackForAutoLoopKeys_sharedPositiveFeedbackForAutoLoopKeys;
  positiveFeedbackForAutoLoopKeys_sharedPositiveFeedbackForAutoLoopKeys = v0;

}

void __50__PXFeedbackEntry_negativeFeedbackForMemoriesKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = kPXFeedbackNotVeryMeaningfulMemoriesKey;
  v2[1] = kPXFeedbackLackOfVarietyInMemoriesKey;
  v2[2] = kPXFeedbackPoorSelectionOfMemoriesRelatedToYourCurrentLocationAndPeopleNearYouKey;
  v2[3] = kPXFeedbackNotEnoughMemoriesKey;
  v2[4] = kPXFeedbackNotSoGoodKeyPhotosRepresentingMemoriesKey;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)negativeFeedbackForMemoriesKeys_sharedNegativeFeedbackForMemoriesKeys;
  negativeFeedbackForMemoriesKeys_sharedNegativeFeedbackForMemoriesKeys = v0;

}

void __50__PXFeedbackEntry_positiveFeedbackForMemoriesKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];

  v2[10] = *MEMORY[0x1E0C80C00];
  v2[0] = kPXFeedbackMeaningfulMemoriesKey;
  v2[1] = kPXFeedbackGoodVarietyInMemoriesKey;
  v2[2] = kPXFeedbackGoodSelectionsOfMemoriesRelatedToYourCurrentLocationAndPeopleNearYouKey;
  v2[3] = kPXFeedbackGoodAmountOfMemoriesKey;
  v2[4] = kPXFeedbackRediscoveredOldMemoriesKey;
  v2[5] = kPXFeedbackRediscoveredRecentMemoriesKey;
  v2[6] = kPXFeedbackRediscoveredPeopleKey;
  v2[7] = kPXFeedbackRediscoveredPlaceKey;
  v2[8] = kPXFeedbackRediscoveredEventKey;
  v2[9] = kPXFeedbackGoodKeyPhotosRepresentingMemoriesKey;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)positiveFeedbackForMemoriesKeys_sharedPositiveFeedbackForMemoriesKeys;
  positiveFeedbackForMemoriesKeys_sharedPositiveFeedbackForMemoriesKeys = v0;

}

void __55__PXFeedbackEntry_negativeFeedbackForMemoryDetailsKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];

  v2[11] = *MEMORY[0x1E0C80C00];
  v2[0] = kPXFeedbackUserDislikedDetailViewReasonNotVeryMeaningfulCollection;
  v2[1] = kPXFeedbackUserDislikedDetailViewReasonNotSoGoodMovie;
  v2[2] = kPXFeedbackUserDislikedDetailViewReasonNotSoInterestingSelectionOfPhotos;
  v2[3] = kPXFeedbackUserDislikedDetailViewReasonTooManyJunkPhotosInGrid;
  v2[4] = kPXFeedbackUserDislikedDetailViewReasonTooManySimilarPhotosInGrid;
  v2[5] = kPXFeedbackUserDislikedDetailViewReasonTooManyBadQualityPhotosInGrid;
  v2[6] = kPXFeedbackUserDislikedDetailViewReasonTooManyPhotosInGrid;
  v2[7] = kPXFeedbackUserDislikedDetailViewReasonNotEnoughPhotosInGrid;
  v2[8] = kPXFeedbackUserDislikedDetailViewReasonRelatedCollectionsMissing;
  v2[9] = kPXFeedbackUserDislikedDetailViewReasonRelatedCollectionsNotRelated;
  v2[10] = kPXFeedbackUserDislikedDetailViewReasonNotSoGoodPhotosRepresentingCollectionsInRelated;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)negativeFeedbackForMemoryDetailsKeys_sharedNegativeFeedbackForMemoryDetailsKeys;
  negativeFeedbackForMemoryDetailsKeys_sharedNegativeFeedbackForMemoryDetailsKeys = v0;

}

void __55__PXFeedbackEntry_positiveFeedbackForMemoryDetailsKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];

  v2[9] = *MEMORY[0x1E0C80C00];
  v2[0] = kPXFeedbackUserLikedDetailViewReasonMeaningfulCollection;
  v2[1] = kPXFeedbackUserLikedDetailViewReasonGoodMovie;
  v2[2] = kPXFeedbackUserLikedDetailViewReasonGoodSelectionOfPhotosInGrid;
  v2[3] = kPXFeedbackUserLikedDetailViewReasonRediscoveredOldPhotos;
  v2[4] = kPXFeedbackUserLikedDetailViewReasonRediscoveredPeople;
  v2[5] = kPXFeedbackUserLikedDetailViewReasonRediscoveredPlace;
  v2[6] = kPXFeedbackUserLikedDetailViewReasonRediscoveredEvent;
  v2[7] = kPXFeedbackUserLikedDetailViewReasonManyMeaningfulRelatedCollectionsIncluded;
  v2[8] = kPXFeedbackUserLikedDetailViewReasonGoodKeyPhotosRepresentingCollectionsInRelated;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)positiveFeedbackForMemoryDetailsKeys_sharedPositiveFeedbackForMemoryDetailsKeys;
  positiveFeedbackForMemoryDetailsKeys_sharedPositiveFeedbackForMemoryDetailsKeys = v0;

}

@end
