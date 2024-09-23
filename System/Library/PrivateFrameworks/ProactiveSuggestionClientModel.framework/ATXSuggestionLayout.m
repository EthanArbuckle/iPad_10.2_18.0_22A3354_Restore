@implementation ATXSuggestionLayout

- (ATXSuggestionLayout)initWithProtoData:(id)a3
{
  id v4;
  ATXPBSuggestionLayout *v5;
  ATXSuggestionLayout *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBSuggestionLayout initWithData:]([ATXPBSuggestionLayout alloc], "initWithData:", v4);

    self = -[ATXSuggestionLayout initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXSuggestionLayout)initWithProto:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  ATXSuggestionLayout *v9;
  uint64_t v10;
  id v11;
  void *v12;
  double v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  void *v18;
  void *v19;
  ATXSuggestionLayout *v20;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXLightweightClientModelCacheUpdate initWithProto:].cold.1((uint64_t)self, v8);

    goto LABEL_8;
  }
  v5 = v4;
  v23 = v4;
  if (-[ATXPBSuggestionLayout hasUuidOfHighestConfidenceSuggestion]((_BOOL8)v5))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[ATXPBSuggestionLayout uuidOfHighestConfidenceSuggestion]((uint64_t)v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

  }
  else
  {
    v39 = 0;
  }
  v33 = -[ATXSuggestionLayout _layoutTypeFromProtoLayoutType:](self, "_layoutTypeFromProtoLayoutType:", -[ATXPBSuggestionLayout layoutType]((uint64_t)v5));
  -[ATXPBSuggestionLayout oneByOneSuggestions]((uint64_t)v5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:](ATXProactiveSuggestion, "suggestionsFromProtoSuggestions:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout oneByTwoSuggestions]((uint64_t)v5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:](ATXProactiveSuggestion, "suggestionsFromProtoSuggestions:", v36);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout twoByTwoSuggestions]((uint64_t)v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:](ATXProactiveSuggestion, "suggestionsFromProtoSuggestions:", v35);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout oneByFourSuggestions]((uint64_t)v5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:](ATXProactiveSuggestion, "suggestionsFromProtoSuggestions:", v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout twoByFourSuggestions]((uint64_t)v5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:](ATXProactiveSuggestion, "suggestionsFromProtoSuggestions:", v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout fourByFourSuggestions]((uint64_t)v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:](ATXProactiveSuggestion, "suggestionsFromProtoSuggestions:", v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout fourByEightSuggestions]((uint64_t)v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:](ATXProactiveSuggestion, "suggestionsFromProtoSuggestions:", v27);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[ATXPBSuggestionLayout uuidString]((uint64_t)v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "initWithUUIDString:", v25);
  v13 = -[ATXPBSuggestionLayout layoutScore]((uint64_t)v5);
  v14 = -[ATXPBSuggestionLayout isValidForSuggestionsWidget]((_BOOL8)v5);
  v15 = -[ATXPBSuggestionLayout confidenceWarrantsSnappingOrNPlusOne]((_BOOL8)v5);
  v16 = -[ATXPBSuggestionLayout isNPlusOne]((_BOOL8)v5);
  v17 = -[ATXPBSuggestionLayout isLowConfidenceStackRotationForStaleStack]((_BOOL8)v5);
  -[ATXPBSuggestionLayout widgetUniqueId]((uint64_t)v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE3(v22) = v17;
  BYTE2(v22) = v16;
  BYTE1(v22) = v15;
  LOBYTE(v22) = v14;
  v19 = (void *)v10;
  v20 = objc_retain(-[ATXSuggestionLayout initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:layoutScore:isValidForSuggestionsWidget:confidenceWarrantsSnappingOrNPlusOne:isNPlusOne:isLowConfidenceStackRotationForStaleStack:widgetUniqueId:uuidOfHighestConfidenceSuggestion:numWidgetsInStack:](self, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:layoutScore:isValidForSuggestionsWidget:confidenceWarrantsSnappingOrNPlusOne:isNPlusOne:isLowConfidenceStackRotationForStaleStack:widgetUniqueId:uuidOfHighestConfidenceSuggestion:numWidgetsInStack:", v33, v38, v31, v29, v28, v26, v13, v24, v10, v12, v22, v18, v39,
            -[ATXPBSuggestionLayout numWidgetsInStack]((uint64_t)v5)));

  self = v20;
  v9 = v20;
  v4 = v23;
LABEL_11:

  return v9;
}

- (ATXSuggestionLayout)initWithLayoutType:(int64_t)a3 oneByOneSuggestions:(id)a4 oneByTwoSuggestions:(id)a5 twoByTwoSuggestions:(id)a6 oneByFourSuggestions:(id)a7 twoByFourSuggestions:(id)a8 fourByFourSuggestions:(id)a9 fourByEightSuggestions:(id)a10 uuid:(id)a11 layoutScore:(double)a12 isValidForSuggestionsWidget:(BOOL)a13 confidenceWarrantsSnappingOrNPlusOne:(BOOL)a14 isNPlusOne:(BOOL)a15 isLowConfidenceStackRotationForStaleStack:(BOOL)a16 widgetUniqueId:(id)a17 uuidOfHighestConfidenceSuggestion:(id)a18 numWidgetsInStack:(unint64_t)a19
{
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  ATXSuggestionLayout *v33;
  ATXSuggestionLayout *v34;
  uint64_t v35;
  NSArray *oneByOneSuggestions;
  uint64_t v37;
  NSArray *oneByTwoSuggestions;
  uint64_t v39;
  NSArray *twoByTwoSuggestions;
  uint64_t v41;
  NSArray *oneByFourSuggestions;
  uint64_t v43;
  NSArray *twoByFourSuggestions;
  uint64_t v45;
  NSArray *fourByFourSuggestions;
  uint64_t v47;
  NSArray *fourByEightSuggestions;
  id v52;
  id v53;
  objc_super v54;

  v24 = a4;
  v25 = a5;
  v53 = a6;
  v26 = a7;
  v27 = a8;
  v28 = v25;
  v29 = a9;
  v30 = a10;
  v52 = a11;
  v31 = a17;
  v32 = a18;
  v54.receiver = self;
  v54.super_class = (Class)ATXSuggestionLayout;
  v33 = -[ATXSuggestionLayout init](&v54, sel_init);
  v34 = v33;
  if (v33)
  {
    v33->_layoutType = a3;
    v35 = objc_msgSend(v24, "copy");
    oneByOneSuggestions = v34->_oneByOneSuggestions;
    v34->_oneByOneSuggestions = (NSArray *)v35;

    v37 = objc_msgSend(v28, "copy");
    oneByTwoSuggestions = v34->_oneByTwoSuggestions;
    v34->_oneByTwoSuggestions = (NSArray *)v37;

    v39 = objc_msgSend(v53, "copy");
    twoByTwoSuggestions = v34->_twoByTwoSuggestions;
    v34->_twoByTwoSuggestions = (NSArray *)v39;

    v41 = objc_msgSend(v26, "copy");
    oneByFourSuggestions = v34->_oneByFourSuggestions;
    v34->_oneByFourSuggestions = (NSArray *)v41;

    v43 = objc_msgSend(v27, "copy");
    twoByFourSuggestions = v34->_twoByFourSuggestions;
    v34->_twoByFourSuggestions = (NSArray *)v43;

    v45 = objc_msgSend(v29, "copy");
    fourByFourSuggestions = v34->_fourByFourSuggestions;
    v34->_fourByFourSuggestions = (NSArray *)v45;

    v47 = objc_msgSend(v30, "copy");
    fourByEightSuggestions = v34->_fourByEightSuggestions;
    v34->_fourByEightSuggestions = (NSArray *)v47;

    objc_storeStrong((id *)&v34->_uuid, a11);
    v34->_layoutScore = a12;
    v34->_isValidForSuggestionsWidget = a13;
    v34->_confidenceWarrantsSnappingOrNPlusOne = a14;
    v34->_isNPlusOne = a15;
    v34->_isLowConfidenceStackRotationForStaleStack = a16;
    objc_storeStrong((id *)&v34->_widgetUniqueId, a17);
    objc_storeStrong((id *)&v34->_uuidOfHighestConfidenceSuggestion, a18);
    v34->_numWidgetsInStack = a19;
  }

  return v34;
}

- (int64_t)_layoutTypeFromProtoLayoutType:(int)a3
{
  uint64_t v3;

  v3 = (a3 - 1);
  if (v3 < 0x11)
    return v3 + 1;
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
  objc_storeStrong((id *)&self->_fourByEightSuggestions, 0);
  objc_storeStrong((id *)&self->_fourByFourSuggestions, 0);
  objc_storeStrong((id *)&self->_twoByFourSuggestions, 0);
  objc_storeStrong((id *)&self->_oneByFourSuggestions, 0);
  objc_storeStrong((id *)&self->_twoByTwoSuggestions, 0);
  objc_storeStrong((id *)&self->_oneByTwoSuggestions, 0);
  objc_storeStrong((id *)&self->_oneByOneSuggestions, 0);
  objc_storeStrong((id *)&self->_uuidOfHighestConfidenceSuggestion, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)allSuggestionsInLayout
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  void *v9;

  v3 = -[NSArray count](self->_oneByOneSuggestions, "count");
  v4 = -[NSArray count](self->_oneByTwoSuggestions, "count") + v3;
  v5 = -[NSArray count](self->_twoByTwoSuggestions, "count");
  v6 = v4 + v5 + -[NSArray count](self->_oneByFourSuggestions, "count");
  v7 = v6 + -[NSArray count](self->_twoByFourSuggestions, "count");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  v9 = v8;
  if (self->_oneByOneSuggestions)
    objc_msgSend(v8, "addObjectsFromArray:");
  if (self->_oneByTwoSuggestions)
    objc_msgSend(v9, "addObjectsFromArray:");
  if (self->_twoByTwoSuggestions)
    objc_msgSend(v9, "addObjectsFromArray:");
  if (self->_oneByFourSuggestions)
    objc_msgSend(v9, "addObjectsFromArray:");
  if (self->_twoByFourSuggestions)
    objc_msgSend(v9, "addObjectsFromArray:");
  if (self->_fourByFourSuggestions)
    objc_msgSend(v9, "addObjectsFromArray:");
  if (self->_fourByEightSuggestions)
    objc_msgSend(v9, "addObjectsFromArray:");
  return v9;
}

- (ATXSuggestionLayout)initWithLayoutType:(int64_t)a3 oneByOneSuggestions:(id)a4 oneByTwoSuggestions:(id)a5 twoByTwoSuggestions:(id)a6 oneByFourSuggestions:(id)a7 twoByFourSuggestions:(id)a8 fourByFourSuggestions:(id)a9 fourByEightSuggestions:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  ATXSuggestionLayout *v25;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = (void *)objc_opt_new();
  v25 = -[ATXSuggestionLayout initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:](self, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:", a3, v23, v22, v21, v20, v19, v18, v17, v24);

  return v25;
}

- (ATXSuggestionLayout)initWithLayoutType:(int64_t)a3 oneByOneSuggestions:(id)a4 oneByTwoSuggestions:(id)a5 twoByTwoSuggestions:(id)a6 oneByFourSuggestions:(id)a7 twoByFourSuggestions:(id)a8 fourByFourSuggestions:(id)a9 fourByEightSuggestions:(id)a10 uuid:(id)a11
{
  uint64_t v12;

  LODWORD(v12) = 0;
  return -[ATXSuggestionLayout initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:layoutScore:isValidForSuggestionsWidget:confidenceWarrantsSnappingOrNPlusOne:isNPlusOne:isLowConfidenceStackRotationForStaleStack:widgetUniqueId:uuidOfHighestConfidenceSuggestion:numWidgetsInStack:](self, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:layoutScore:isValidForSuggestionsWidget:confidenceWarrantsSnappingOrNPlusOne:isNPlusOne:isLowConfidenceStackRotationForStaleStack:widgetUniqueId:uuidOfHighestConfidenceSuggestion:numWidgetsInStack:", a3, a4, a5, a6, a7, a8, -1.0, a9, a10, a11, v12, 0, 0, 0);
}

- (id)compactDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "stringFromUILayoutType:", -[ATXSuggestionLayout layoutType](self, "layoutType"));
}

- (NSString)description
{
  void *v3;
  NSUUID *uuid;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_opt_new();
  uuid = self->_uuid;
  +[ATXSuggestionLayout stringFromUILayoutType:](ATXSuggestionLayout, "stringFromUILayoutType:", self->_layoutType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestionLayout layoutScore](self, "layoutScore");
  objc_msgSend(v3, "appendFormat:", CFSTR("UUID: %@, Layout type: %@, Score:%.2f\n"), uuid, v5, v6);

  if (self->_oneByOneSuggestions)
    objc_msgSend(v3, "appendFormat:", CFSTR("[1 x 1] : %@\n"), self->_oneByOneSuggestions);
  if (self->_oneByTwoSuggestions)
    objc_msgSend(v3, "appendFormat:", CFSTR("[1 x 2] : %@\n"), self->_oneByTwoSuggestions);
  if (self->_twoByTwoSuggestions)
    objc_msgSend(v3, "appendFormat:", CFSTR("[2 x 2] : %@\n"), self->_twoByTwoSuggestions);
  if (self->_oneByFourSuggestions)
    objc_msgSend(v3, "appendFormat:", CFSTR("[1 x 4] : %@\n"), self->_oneByFourSuggestions);
  if (self->_twoByFourSuggestions)
    objc_msgSend(v3, "appendFormat:", CFSTR("[2 x 4] : %@\n"), self->_twoByFourSuggestions);
  if (self->_fourByFourSuggestions)
    objc_msgSend(v3, "appendFormat:", CFSTR("[4 x 4] : %@\n"), self->_fourByFourSuggestions);
  if (self->_fourByEightSuggestions)
    objc_msgSend(v3, "appendFormat:", CFSTR("[4 x 8] : %@\n"), self->_fourByEightSuggestions);
  return (NSString *)v3;
}

- (id)suggestionWithUUID:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[ATXSuggestionLayout allSuggestionsInLayout](self, "allSuggestionsInLayout");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "uuid", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v4, "isEqual:", v10);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)minSuggestionListInLayout
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;

  v3 = (void *)objc_opt_new();
  +[ATXSuggestionLayout minSuggestionLayoutTypesForUILayoutType:](ATXSuggestionLayout, "minSuggestionLayoutTypesForUILayoutType:", self->_layoutType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC128);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v6 >= 1)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC128);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    -[NSArray subarrayWithRange:](self->_oneByOneSuggestions, "subarrayWithRange:", 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC140);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  if (v11 >= 1)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC140);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    -[NSArray subarrayWithRange:](self->_oneByTwoSuggestions, "subarrayWithRange:", 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v14);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC158);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intValue");

  if (v16 >= 1)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC158);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    -[NSArray subarrayWithRange:](self->_twoByTwoSuggestions, "subarrayWithRange:", 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v19);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC170);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "intValue");

  if (v21 >= 1)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC170);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedIntegerValue");

    -[NSArray subarrayWithRange:](self->_twoByFourSuggestions, "subarrayWithRange:", 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v24);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC188);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "intValue");

  if (v26 >= 1)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC188);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "unsignedIntegerValue");

    -[NSArray subarrayWithRange:](self->_oneByFourSuggestions, "subarrayWithRange:", 0, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v29);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC1A0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "intValue");

  if (v31 >= 1)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC1A0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "unsignedIntegerValue");

    -[NSArray subarrayWithRange:](self->_fourByFourSuggestions, "subarrayWithRange:", 0, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v34);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC1B8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "intValue");

  if (v36 >= 1)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E57EC1B8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "unsignedIntegerValue");

    -[NSArray subarrayWithRange:](self->_fourByEightSuggestions, "subarrayWithRange:", 0, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v39);

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXSuggestionLayout *v4;
  id *v5;
  uint64_t v6;
  NSArray *oneByOneSuggestions;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  char v11;
  BOOL v12;
  NSArray *oneByTwoSuggestions;
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  char v17;
  NSArray *twoByTwoSuggestions;
  NSArray *v19;
  NSArray *v20;
  NSArray *v21;
  char v22;
  NSArray *oneByFourSuggestions;
  NSArray *v24;
  NSArray *v25;
  NSArray *v26;
  char v27;
  NSArray *twoByFourSuggestions;
  NSArray *v29;
  NSArray *v30;
  NSArray *v31;
  char v32;
  NSArray *fourByFourSuggestions;
  NSArray *v34;
  NSArray *v35;
  NSArray *v36;
  char v37;
  NSArray *fourByEightSuggestions;
  NSArray *v39;
  NSArray *v40;
  NSArray *v41;
  char v42;
  NSUUID *uuid;
  NSUUID *v44;
  NSUUID *v45;
  NSUUID *v46;
  char v47;
  double layoutScore;
  double v49;
  int isValidForSuggestionsWidget;
  int confidenceWarrantsSnappingOrNPlusOne;
  int isNPlusOne;
  NSString *widgetUniqueId;
  NSString *v54;
  NSString *v55;
  NSString *v56;
  char v57;
  NSUUID *uuidOfHighestConfidenceSuggestion;
  NSUUID *v59;
  NSUUID *v60;
  NSUUID *v61;
  char v62;
  unint64_t numWidgetsInStack;

  v4 = (ATXSuggestionLayout *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = objc_msgSend(v5, "layoutType");
      if (v6 == -[ATXSuggestionLayout layoutType](self, "layoutType"))
      {
        oneByOneSuggestions = self->_oneByOneSuggestions;
        v8 = (NSArray *)v5[6];
        if (oneByOneSuggestions == v8)
        {

        }
        else
        {
          v9 = v8;
          v10 = oneByOneSuggestions;
          v11 = -[NSArray isEqual:](v10, "isEqual:", v9);

          if ((v11 & 1) == 0)
            goto LABEL_48;
        }
        oneByTwoSuggestions = self->_oneByTwoSuggestions;
        v14 = (NSArray *)v5[7];
        if (oneByTwoSuggestions == v14)
        {

        }
        else
        {
          v15 = v14;
          v16 = oneByTwoSuggestions;
          v17 = -[NSArray isEqual:](v16, "isEqual:", v15);

          if ((v17 & 1) == 0)
            goto LABEL_48;
        }
        twoByTwoSuggestions = self->_twoByTwoSuggestions;
        v19 = (NSArray *)v5[8];
        if (twoByTwoSuggestions == v19)
        {

        }
        else
        {
          v20 = v19;
          v21 = twoByTwoSuggestions;
          v22 = -[NSArray isEqual:](v21, "isEqual:", v20);

          if ((v22 & 1) == 0)
            goto LABEL_48;
        }
        oneByFourSuggestions = self->_oneByFourSuggestions;
        v24 = (NSArray *)v5[9];
        if (oneByFourSuggestions == v24)
        {

        }
        else
        {
          v25 = v24;
          v26 = oneByFourSuggestions;
          v27 = -[NSArray isEqual:](v26, "isEqual:", v25);

          if ((v27 & 1) == 0)
            goto LABEL_48;
        }
        twoByFourSuggestions = self->_twoByFourSuggestions;
        v29 = (NSArray *)v5[10];
        if (twoByFourSuggestions == v29)
        {

        }
        else
        {
          v30 = v29;
          v31 = twoByFourSuggestions;
          v32 = -[NSArray isEqual:](v31, "isEqual:", v30);

          if ((v32 & 1) == 0)
            goto LABEL_48;
        }
        fourByFourSuggestions = self->_fourByFourSuggestions;
        v34 = (NSArray *)v5[11];
        if (fourByFourSuggestions == v34)
        {

        }
        else
        {
          v35 = v34;
          v36 = fourByFourSuggestions;
          v37 = -[NSArray isEqual:](v36, "isEqual:", v35);

          if ((v37 & 1) == 0)
            goto LABEL_48;
        }
        fourByEightSuggestions = self->_fourByEightSuggestions;
        v39 = (NSArray *)v5[12];
        if (fourByEightSuggestions == v39)
        {

        }
        else
        {
          v40 = v39;
          v41 = fourByEightSuggestions;
          v42 = -[NSArray isEqual:](v41, "isEqual:", v40);

          if ((v42 & 1) == 0)
            goto LABEL_48;
        }
        uuid = self->_uuid;
        v44 = (NSUUID *)v5[4];
        if (uuid == v44)
        {

        }
        else
        {
          v45 = v44;
          v46 = uuid;
          v47 = -[NSUUID isEqual:](v46, "isEqual:", v45);

          if ((v47 & 1) == 0)
            goto LABEL_48;
        }
        layoutScore = self->_layoutScore;
        objc_msgSend(v5, "layoutScore");
        if (layoutScore != v49)
          goto LABEL_48;
        isValidForSuggestionsWidget = self->_isValidForSuggestionsWidget;
        if (isValidForSuggestionsWidget != objc_msgSend(v5, "isValidForSuggestionsWidget"))
          goto LABEL_48;
        confidenceWarrantsSnappingOrNPlusOne = self->_confidenceWarrantsSnappingOrNPlusOne;
        if (confidenceWarrantsSnappingOrNPlusOne != objc_msgSend(v5, "confidenceWarrantsSnappingOrNPlusOne"))goto LABEL_48;
        isNPlusOne = self->_isNPlusOne;
        if (isNPlusOne != objc_msgSend(v5, "isNPlusOne"))
          goto LABEL_48;
        widgetUniqueId = self->_widgetUniqueId;
        v54 = (NSString *)v5[13];
        if (widgetUniqueId == v54)
        {

        }
        else
        {
          v55 = v54;
          v56 = widgetUniqueId;
          v57 = -[NSString isEqual:](v56, "isEqual:", v55);

          if ((v57 & 1) == 0)
            goto LABEL_48;
        }
        uuidOfHighestConfidenceSuggestion = self->_uuidOfHighestConfidenceSuggestion;
        v59 = (NSUUID *)v5[5];
        if (uuidOfHighestConfidenceSuggestion == v59)
        {

        }
        else
        {
          v60 = v59;
          v61 = uuidOfHighestConfidenceSuggestion;
          v62 = -[NSUUID isEqual:](v61, "isEqual:", v60);

          if ((v62 & 1) == 0)
            goto LABEL_48;
        }
        numWidgetsInStack = self->_numWidgetsInStack;
        v12 = numWidgetsInStack == objc_msgSend(v5, "numWidgetsInStack");
        goto LABEL_49;
      }
LABEL_48:
      v12 = 0;
LABEL_49:

      goto LABEL_50;
    }
    v12 = 0;
  }
LABEL_50:

  return v12;
}

+ (id)minSuggestionLayoutTypesForUILayoutType:(int64_t)a3
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v7[7];
  _QWORD v8[7];
  _QWORD v9[7];
  _QWORD v10[7];
  _QWORD v11[7];
  _QWORD v12[7];
  _QWORD v13[7];
  _QWORD v14[7];
  _QWORD v15[7];
  _QWORD v16[7];
  _QWORD v17[7];
  _QWORD v18[7];
  _QWORD v19[7];
  _QWORD v20[7];
  _QWORD v21[7];
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[7];
  _QWORD v25[7];
  _QWORD v26[7];
  _QWORD v27[7];
  _QWORD v28[7];
  _QWORD v29[7];
  _QWORD v30[7];
  _QWORD v31[7];
  _QWORD v32[7];
  _QWORD v33[7];
  _QWORD v34[7];
  _QWORD v35[7];
  _QWORD v36[7];
  _QWORD v37[7];
  _QWORD v38[7];
  _QWORD v39[7];
  _QWORD v40[7];
  _QWORD v41[7];
  _QWORD v42[8];

  v42[7] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      v41[0] = &unk_1E57EC128;
      v41[1] = &unk_1E57EC140;
      v42[0] = &unk_1E57EC1D0;
      v42[1] = &unk_1E57EC1E8;
      v41[2] = &unk_1E57EC188;
      v41[3] = &unk_1E57EC158;
      v42[2] = &unk_1E57EC1E8;
      v42[3] = &unk_1E57EC1E8;
      v41[4] = &unk_1E57EC170;
      v41[5] = &unk_1E57EC1A0;
      v42[4] = &unk_1E57EC1E8;
      v42[5] = &unk_1E57EC1E8;
      v41[6] = &unk_1E57EC1B8;
      v42[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v42;
      v5 = v41;
      goto LABEL_20;
    case 1:
      v39[0] = &unk_1E57EC128;
      v39[1] = &unk_1E57EC140;
      v40[0] = &unk_1E57EC200;
      v40[1] = &unk_1E57EC218;
      v39[2] = &unk_1E57EC188;
      v39[3] = &unk_1E57EC158;
      v40[2] = &unk_1E57EC1E8;
      v40[3] = &unk_1E57EC1E8;
      v39[4] = &unk_1E57EC170;
      v39[5] = &unk_1E57EC1A0;
      v40[4] = &unk_1E57EC1E8;
      v40[5] = &unk_1E57EC1E8;
      v39[6] = &unk_1E57EC1B8;
      v40[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v40;
      v5 = v39;
      goto LABEL_20;
    case 2:
      v37[0] = &unk_1E57EC128;
      v37[1] = &unk_1E57EC140;
      v38[0] = &unk_1E57EC200;
      v38[1] = &unk_1E57EC1E8;
      v37[2] = &unk_1E57EC188;
      v37[3] = &unk_1E57EC158;
      v38[2] = &unk_1E57EC1E8;
      v38[3] = &unk_1E57EC230;
      v37[4] = &unk_1E57EC170;
      v37[5] = &unk_1E57EC1A0;
      v38[4] = &unk_1E57EC1E8;
      v38[5] = &unk_1E57EC1E8;
      v37[6] = &unk_1E57EC1B8;
      v38[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v38;
      v5 = v37;
      goto LABEL_20;
    case 3:
      v35[0] = &unk_1E57EC128;
      v35[1] = &unk_1E57EC140;
      v36[0] = &unk_1E57EC1E8;
      v36[1] = &unk_1E57EC1E8;
      v35[2] = &unk_1E57EC188;
      v35[3] = &unk_1E57EC158;
      v36[2] = &unk_1E57EC1E8;
      v36[3] = &unk_1E57EC1E8;
      v35[4] = &unk_1E57EC170;
      v35[5] = &unk_1E57EC1A0;
      v36[4] = &unk_1E57EC230;
      v36[5] = &unk_1E57EC1E8;
      v35[6] = &unk_1E57EC1B8;
      v36[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v36;
      v5 = v35;
      goto LABEL_20;
    case 4:
      v33[0] = &unk_1E57EC128;
      v33[1] = &unk_1E57EC140;
      v34[0] = &unk_1E57EC1E8;
      v34[1] = &unk_1E57EC218;
      v33[2] = &unk_1E57EC188;
      v33[3] = &unk_1E57EC158;
      v34[2] = &unk_1E57EC1E8;
      v34[3] = &unk_1E57EC1E8;
      v33[4] = &unk_1E57EC170;
      v33[5] = &unk_1E57EC1A0;
      v34[4] = &unk_1E57EC1E8;
      v34[5] = &unk_1E57EC1E8;
      v33[6] = &unk_1E57EC1B8;
      v34[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v34;
      v5 = v33;
      goto LABEL_20;
    case 5:
      v31[0] = &unk_1E57EC128;
      v31[1] = &unk_1E57EC140;
      v32[0] = &unk_1E57EC1E8;
      v32[1] = &unk_1E57EC1E8;
      v31[2] = &unk_1E57EC188;
      v31[3] = &unk_1E57EC158;
      v32[2] = &unk_1E57EC1E8;
      v32[3] = &unk_1E57EC230;
      v31[4] = &unk_1E57EC170;
      v31[5] = &unk_1E57EC1A0;
      v32[4] = &unk_1E57EC1E8;
      v32[5] = &unk_1E57EC1E8;
      v31[6] = &unk_1E57EC1B8;
      v32[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v32;
      v5 = v31;
      goto LABEL_20;
    case 6:
      v29[0] = &unk_1E57EC128;
      v29[1] = &unk_1E57EC140;
      v30[0] = &unk_1E57EC1E8;
      v30[1] = &unk_1E57EC1E8;
      v29[2] = &unk_1E57EC188;
      v29[3] = &unk_1E57EC158;
      v30[2] = &unk_1E57EC1E8;
      v30[3] = &unk_1E57EC218;
      v29[4] = &unk_1E57EC170;
      v29[5] = &unk_1E57EC1A0;
      v30[4] = &unk_1E57EC1E8;
      v30[5] = &unk_1E57EC1E8;
      v29[6] = &unk_1E57EC1B8;
      v30[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v30;
      v5 = v29;
      goto LABEL_20;
    case 7:
      v27[0] = &unk_1E57EC128;
      v27[1] = &unk_1E57EC140;
      v28[0] = &unk_1E57EC1E8;
      v28[1] = &unk_1E57EC200;
      v27[2] = &unk_1E57EC188;
      v27[3] = &unk_1E57EC158;
      v28[2] = &unk_1E57EC1E8;
      v28[3] = &unk_1E57EC1E8;
      v27[4] = &unk_1E57EC170;
      v27[5] = &unk_1E57EC1A0;
      v28[4] = &unk_1E57EC1E8;
      v28[5] = &unk_1E57EC1E8;
      v27[6] = &unk_1E57EC1B8;
      v28[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v28;
      v5 = v27;
      goto LABEL_20;
    case 8:
      v25[0] = &unk_1E57EC128;
      v25[1] = &unk_1E57EC140;
      v26[0] = &unk_1E57EC1E8;
      v26[1] = &unk_1E57EC1E8;
      v25[2] = &unk_1E57EC188;
      v25[3] = &unk_1E57EC158;
      v26[2] = &unk_1E57EC230;
      v26[3] = &unk_1E57EC1E8;
      v25[4] = &unk_1E57EC170;
      v25[5] = &unk_1E57EC1A0;
      v26[4] = &unk_1E57EC1E8;
      v26[5] = &unk_1E57EC1E8;
      v25[6] = &unk_1E57EC1B8;
      v26[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v26;
      v5 = v25;
      goto LABEL_20;
    case 9:
      v23[0] = &unk_1E57EC128;
      v23[1] = &unk_1E57EC140;
      v24[0] = &unk_1E57EC1E8;
      v24[1] = &unk_1E57EC1E8;
      v23[2] = &unk_1E57EC188;
      v23[3] = &unk_1E57EC158;
      v24[2] = &unk_1E57EC218;
      v24[3] = &unk_1E57EC1E8;
      v23[4] = &unk_1E57EC170;
      v23[5] = &unk_1E57EC1A0;
      v24[4] = &unk_1E57EC1E8;
      v24[5] = &unk_1E57EC1E8;
      v23[6] = &unk_1E57EC1B8;
      v24[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v24;
      v5 = v23;
      goto LABEL_20;
    case 10:
      v21[0] = &unk_1E57EC128;
      v21[1] = &unk_1E57EC140;
      v22[0] = &unk_1E57EC1E8;
      v22[1] = &unk_1E57EC1E8;
      v21[2] = &unk_1E57EC188;
      v21[3] = &unk_1E57EC158;
      v22[2] = &unk_1E57EC1E8;
      v22[3] = &unk_1E57EC1E8;
      v21[4] = &unk_1E57EC170;
      v21[5] = &unk_1E57EC1A0;
      v22[4] = &unk_1E57EC1E8;
      v22[5] = &unk_1E57EC230;
      v21[6] = &unk_1E57EC1B8;
      v22[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v22;
      v5 = v21;
      goto LABEL_20;
    case 11:
      v19[0] = &unk_1E57EC128;
      v19[1] = &unk_1E57EC140;
      v20[0] = &unk_1E57EC1E8;
      v20[1] = &unk_1E57EC1E8;
      v19[2] = &unk_1E57EC188;
      v19[3] = &unk_1E57EC158;
      v20[2] = &unk_1E57EC200;
      v20[3] = &unk_1E57EC1E8;
      v19[4] = &unk_1E57EC170;
      v19[5] = &unk_1E57EC1A0;
      v20[4] = &unk_1E57EC1E8;
      v20[5] = &unk_1E57EC1E8;
      v19[6] = &unk_1E57EC1B8;
      v20[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v20;
      v5 = v19;
      goto LABEL_20;
    case 12:
      v15[0] = &unk_1E57EC128;
      v15[1] = &unk_1E57EC140;
      v16[0] = &unk_1E57EC1E8;
      v16[1] = &unk_1E57EC1E8;
      v15[2] = &unk_1E57EC188;
      v15[3] = &unk_1E57EC158;
      v16[2] = &unk_1E57EC1E8;
      v16[3] = &unk_1E57EC230;
      v15[4] = &unk_1E57EC170;
      v15[5] = &unk_1E57EC1A0;
      v16[4] = &unk_1E57EC1E8;
      v16[5] = &unk_1E57EC1E8;
      v15[6] = &unk_1E57EC1B8;
      v16[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v16;
      v5 = v15;
      goto LABEL_20;
    case 13:
      v13[0] = &unk_1E57EC128;
      v13[1] = &unk_1E57EC140;
      v14[0] = &unk_1E57EC1E8;
      v14[1] = &unk_1E57EC1E8;
      v13[2] = &unk_1E57EC188;
      v13[3] = &unk_1E57EC158;
      v14[2] = &unk_1E57EC1E8;
      v14[3] = &unk_1E57EC1E8;
      v13[4] = &unk_1E57EC170;
      v13[5] = &unk_1E57EC1A0;
      v14[4] = &unk_1E57EC230;
      v14[5] = &unk_1E57EC1E8;
      v13[6] = &unk_1E57EC1B8;
      v14[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v14;
      v5 = v13;
      goto LABEL_20;
    case 14:
      v11[0] = &unk_1E57EC128;
      v11[1] = &unk_1E57EC140;
      v12[0] = &unk_1E57EC1E8;
      v12[1] = &unk_1E57EC1E8;
      v11[2] = &unk_1E57EC188;
      v11[3] = &unk_1E57EC158;
      v12[2] = &unk_1E57EC1E8;
      v12[3] = &unk_1E57EC230;
      v11[4] = &unk_1E57EC170;
      v11[5] = &unk_1E57EC1A0;
      v12[4] = &unk_1E57EC230;
      v12[5] = &unk_1E57EC1E8;
      v11[6] = &unk_1E57EC1B8;
      v12[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v12;
      v5 = v11;
      goto LABEL_20;
    case 15:
      v17[0] = &unk_1E57EC128;
      v17[1] = &unk_1E57EC140;
      v18[0] = &unk_1E57EC230;
      v18[1] = &unk_1E57EC1E8;
      v17[2] = &unk_1E57EC188;
      v17[3] = &unk_1E57EC158;
      v18[2] = &unk_1E57EC1E8;
      v18[3] = &unk_1E57EC1E8;
      v17[4] = &unk_1E57EC170;
      v17[5] = &unk_1E57EC1A0;
      v18[4] = &unk_1E57EC1E8;
      v18[5] = &unk_1E57EC1E8;
      v17[6] = &unk_1E57EC1B8;
      v18[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v18;
      v5 = v17;
      goto LABEL_20;
    case 16:
      v9[0] = &unk_1E57EC128;
      v9[1] = &unk_1E57EC140;
      v10[0] = &unk_1E57EC1E8;
      v10[1] = &unk_1E57EC1E8;
      v9[2] = &unk_1E57EC188;
      v9[3] = &unk_1E57EC158;
      v10[2] = &unk_1E57EC1E8;
      v10[3] = &unk_1E57EC1E8;
      v9[4] = &unk_1E57EC170;
      v9[5] = &unk_1E57EC1A0;
      v10[4] = &unk_1E57EC1E8;
      v10[5] = &unk_1E57EC1E8;
      v9[6] = &unk_1E57EC1B8;
      v10[6] = &unk_1E57EC230;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v10;
      v5 = v9;
      goto LABEL_20;
    case 17:
      v7[0] = &unk_1E57EC128;
      v7[1] = &unk_1E57EC140;
      v8[0] = &unk_1E57EC1E8;
      v8[1] = &unk_1E57EC1E8;
      v7[2] = &unk_1E57EC188;
      v7[3] = &unk_1E57EC158;
      v8[2] = &unk_1E57EC1E8;
      v8[3] = &unk_1E57EC1E8;
      v7[4] = &unk_1E57EC170;
      v7[5] = &unk_1E57EC1A0;
      v8[4] = &unk_1E57EC1E8;
      v8[5] = &unk_1E57EC1E8;
      v7[6] = &unk_1E57EC1B8;
      v8[6] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v8;
      v5 = v7;
LABEL_20:
      objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v4, v5, 7);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

+ (id)maxSuggestionLayoutTypesForUILayoutType:(int64_t)a3
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[7];
  _QWORD v10[7];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 8:
      v21[0] = &unk_1E57EC128;
      v21[1] = &unk_1E57EC140;
      v22[0] = &unk_1E57EC1E8;
      v22[1] = &unk_1E57EC1E8;
      v21[2] = &unk_1E57EC188;
      v21[3] = &unk_1E57EC158;
      v22[2] = &unk_1E57EC248;
      v22[3] = &unk_1E57EC1E8;
      v21[4] = &unk_1E57EC170;
      v22[4] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v22;
      v5 = v21;
      goto LABEL_11;
    case 9:
    case 10:
    case 11:
    case 16:
      goto LABEL_5;
    case 12:
      v15[0] = &unk_1E57EC128;
      v15[1] = &unk_1E57EC140;
      v16[0] = &unk_1E57EC278;
      v16[1] = &unk_1E57EC1E8;
      v15[2] = &unk_1E57EC188;
      v15[3] = &unk_1E57EC158;
      v16[2] = &unk_1E57EC1E8;
      v16[3] = &unk_1E57EC218;
      v15[4] = &unk_1E57EC170;
      v15[5] = &unk_1E57EC1A0;
      v16[4] = &unk_1E57EC1E8;
      v16[5] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v16;
      v5 = v15;
      goto LABEL_9;
    case 13:
      v13[0] = &unk_1E57EC128;
      v13[1] = &unk_1E57EC140;
      v14[0] = &unk_1E57EC278;
      v14[1] = &unk_1E57EC1E8;
      v13[2] = &unk_1E57EC188;
      v13[3] = &unk_1E57EC158;
      v14[2] = &unk_1E57EC1E8;
      v14[3] = &unk_1E57EC1E8;
      v13[4] = &unk_1E57EC170;
      v13[5] = &unk_1E57EC1A0;
      v14[4] = &unk_1E57EC230;
      v14[5] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v14;
      v5 = v13;
      goto LABEL_9;
    case 14:
      v11[0] = &unk_1E57EC128;
      v11[1] = &unk_1E57EC140;
      v12[0] = &unk_1E57EC278;
      v12[1] = &unk_1E57EC1E8;
      v11[2] = &unk_1E57EC188;
      v11[3] = &unk_1E57EC158;
      v12[2] = &unk_1E57EC1E8;
      v12[3] = &unk_1E57EC218;
      v11[4] = &unk_1E57EC170;
      v11[5] = &unk_1E57EC1A0;
      v12[4] = &unk_1E57EC230;
      v12[5] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v12;
      v5 = v11;
LABEL_9:
      v7 = 6;
      goto LABEL_13;
    case 15:
      v17[0] = &unk_1E57EC128;
      v17[1] = &unk_1E57EC140;
      v18[0] = &unk_1E57EC248;
      v18[1] = &unk_1E57EC1E8;
      v17[2] = &unk_1E57EC188;
      v17[3] = &unk_1E57EC158;
      v18[2] = &unk_1E57EC1E8;
      v18[3] = &unk_1E57EC1E8;
      v17[4] = &unk_1E57EC170;
      v18[4] = &unk_1E57EC1E8;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v18;
      v5 = v17;
      goto LABEL_11;
    case 17:
      v9[0] = &unk_1E57EC128;
      v9[1] = &unk_1E57EC140;
      v10[0] = &unk_1E57EC260;
      v10[1] = &unk_1E57EC260;
      v9[2] = &unk_1E57EC188;
      v9[3] = &unk_1E57EC158;
      v10[2] = &unk_1E57EC260;
      v10[3] = &unk_1E57EC260;
      v9[4] = &unk_1E57EC170;
      v9[5] = &unk_1E57EC1A0;
      v10[4] = &unk_1E57EC260;
      v10[5] = &unk_1E57EC260;
      v9[6] = &unk_1E57EC1B8;
      v10[6] = &unk_1E57EC260;
      v3 = (void *)MEMORY[0x1E0C99D80];
      v4 = v10;
      v5 = v9;
      v7 = 7;
      goto LABEL_13;
    default:
      if (a3)
      {
LABEL_5:
        objc_msgSend(a1, "minSuggestionLayoutTypesForUILayoutType:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19[0] = &unk_1E57EC128;
        v19[1] = &unk_1E57EC140;
        v20[0] = &unk_1E57EC260;
        v20[1] = &unk_1E57EC1E8;
        v19[2] = &unk_1E57EC188;
        v19[3] = &unk_1E57EC158;
        v20[2] = &unk_1E57EC1E8;
        v20[3] = &unk_1E57EC1E8;
        v19[4] = &unk_1E57EC170;
        v20[4] = &unk_1E57EC1E8;
        v3 = (void *)MEMORY[0x1E0C99D80];
        v4 = v20;
        v5 = v19;
LABEL_11:
        v7 = 5;
LABEL_13:
        objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v4, v5, v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      return v6;
  }
}

+ (BOOL)isCompositeLayout:(int64_t)a3
{
  return ((unint64_t)a3 < 0x12) & (0x27000u >> a3);
}

+ (id)stringFromUILayoutType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x10)
    return CFSTR("ATXUILayoutTypeEight1x1");
  else
    return off_1E57CEA10[a3 - 1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXSuggestionLayout *v4;
  uint64_t v6;

  v4 = +[ATXSuggestionLayout allocWithZone:](ATXSuggestionLayout, "allocWithZone:", a3);
  LODWORD(v6) = *(_DWORD *)&self->_isValidForSuggestionsWidget;
  return -[ATXSuggestionLayout initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:layoutScore:isValidForSuggestionsWidget:confidenceWarrantsSnappingOrNPlusOne:isNPlusOne:isLowConfidenceStackRotationForStaleStack:widgetUniqueId:uuidOfHighestConfidenceSuggestion:numWidgetsInStack:](v4, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:uuid:layoutScore:isValidForSuggestionsWidget:confidenceWarrantsSnappingOrNPlusOne:isNPlusOne:isLowConfidenceStackRotationForStaleStack:widgetUniqueId:uuidOfHighestConfidenceSuggestion:numWidgetsInStack:", self->_layoutType, self->_oneByOneSuggestions, self->_oneByTwoSuggestions, self->_twoByTwoSuggestions, self->_oneByFourSuggestions, self->_twoByFourSuggestions, self->_layoutScore, self->_fourByFourSuggestions, self->_fourByEightSuggestions, self->_uuid, v6, self->_widgetUniqueId, self->_uuidOfHighestConfidenceSuggestion, self->_numWidgetsInStack);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3 == 0.0)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXSuggestionLayout encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXSuggestionLayout)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXSuggestionLayout *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXSuggestionLayout initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXSuggestionLayout proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)proto
{
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

  v3 = (void *)objc_opt_new();
  -[ATXPBSuggestionLayout setLayoutType:]((uint64_t)v3, -[ATXSuggestionLayout _protoLayoutTypeFromLayoutType:](self, "_protoLayoutTypeFromLayoutType:", self->_layoutType));
  -[ATXPBSuggestionLayout setLayoutScore:]((uint64_t)v3, self->_layoutScore);
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout setUuidString:]((uint64_t)v3, v4);

  +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:](ATXProactiveSuggestion, "protoSuggestionsFromSuggestions:", self->_oneByOneSuggestions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout setOneByOneSuggestions:]((uint64_t)v3, v5);

  +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:](ATXProactiveSuggestion, "protoSuggestionsFromSuggestions:", self->_oneByTwoSuggestions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout setOneByTwoSuggestions:]((uint64_t)v3, v6);

  +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:](ATXProactiveSuggestion, "protoSuggestionsFromSuggestions:", self->_twoByTwoSuggestions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout setTwoByTwoSuggestions:]((uint64_t)v3, v7);

  +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:](ATXProactiveSuggestion, "protoSuggestionsFromSuggestions:", self->_oneByFourSuggestions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout setOneByFourSuggestions:]((uint64_t)v3, v8);

  +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:](ATXProactiveSuggestion, "protoSuggestionsFromSuggestions:", self->_twoByFourSuggestions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout setTwoByFourSuggestions:]((uint64_t)v3, v9);

  +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:](ATXProactiveSuggestion, "protoSuggestionsFromSuggestions:", self->_fourByFourSuggestions);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout setFourByFourSuggestions:]((uint64_t)v3, v10);

  +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:](ATXProactiveSuggestion, "protoSuggestionsFromSuggestions:", self->_fourByEightSuggestions);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout setFourByEightSuggestions:]((uint64_t)v3, v11);

  -[ATXPBSuggestionLayout setIsValidForSuggestionsWidget:]((uint64_t)v3, self->_isValidForSuggestionsWidget);
  -[ATXPBSuggestionLayout setConfidenceWarrantsSnappingOrNPlusOne:]((uint64_t)v3, self->_confidenceWarrantsSnappingOrNPlusOne);
  -[ATXPBSuggestionLayout setIsNPlusOne:]((uint64_t)v3, self->_isNPlusOne);
  -[ATXPBSuggestionLayout setWidgetUniqueId:]((uint64_t)v3, self->_widgetUniqueId);
  -[ATXPBSuggestionLayout setIsLowConfidenceStackRotationForStaleStack:]((uint64_t)v3, self->_isLowConfidenceStackRotationForStaleStack);
  -[NSUUID UUIDString](self->_uuidOfHighestConfidenceSuggestion, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout setUuidOfHighestConfidenceSuggestion:]((uint64_t)v3, v12);

  -[ATXPBSuggestionLayout setNumWidgetsInStack:]((uint64_t)v3, self->_numWidgetsInStack);
  return v3;
}

- (int)_protoLayoutTypeFromLayoutType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 0x11)
    return a3;
  else
    return 0;
}

- (id)arrayOfJSONFromSuggestionArray:(id)a3
{
  if (!a3)
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __54__ATXSuggestionLayout_arrayOfJSONFromSuggestionArray___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonRawData");
}

- (id)jsonRawData
{
  void *v3;
  NSUUID *uuid;
  __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *widgetUniqueId;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  NSUUID *v26;
  _QWORD v27[17];
  _QWORD v28[19];

  v28[17] = *MEMORY[0x1E0C80C00];
  -[ATXSuggestionLayout suggestionWithUUID:](self, "suggestionWithUUID:", self->_uuidOfHighestConfidenceSuggestion);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  v5 = CFSTR("nil");
  v26 = uuid;
  v27[0] = CFSTR("uuid");
  if (uuid)
  {
    -[NSUUID UUIDString](uuid, "UUIDString");
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("nil");
  }
  v22 = (__CFString *)v6;
  v28[0] = v6;
  v27[1] = CFSTR("layoutType");
  objc_msgSend((id)objc_opt_class(), "stringFromUILayoutType:", self->_layoutType);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v25;
  v27[2] = CFSTR("layoutScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_layoutScore);
  v7 = objc_claimAutoreleasedReturnValue();
  if (self->_isValidForSuggestionsWidget)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v24 = (void *)v7;
  v28[2] = v7;
  v28[3] = v8;
  v27[3] = CFSTR("isValidForSuggestionsWidget");
  v27[4] = CFSTR("confidenceWarrantsSnappingOrNPlusOne");
  if (self->_confidenceWarrantsSnappingOrNPlusOne)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (self->_isNPlusOne)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v28[4] = v9;
  v28[5] = v10;
  v27[5] = CFSTR("isNPlusOne");
  v27[6] = CFSTR("isLowConfidenceStackRotationForStaleStack");
  if (self->_isLowConfidenceStackRotationForStaleStack)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  widgetUniqueId = (const __CFString *)self->_widgetUniqueId;
  if (!widgetUniqueId)
    widgetUniqueId = CFSTR("nil");
  v28[6] = v11;
  v28[7] = widgetUniqueId;
  v27[7] = CFSTR("widgetUniqueId");
  v27[8] = CFSTR("[1 x 1]");
  -[ATXSuggestionLayout arrayOfJSONFromSuggestionArray:](self, "arrayOfJSONFromSuggestionArray:", self->_oneByOneSuggestions);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[8] = v23;
  v27[9] = CFSTR("[1 x 2]");
  -[ATXSuggestionLayout arrayOfJSONFromSuggestionArray:](self, "arrayOfJSONFromSuggestionArray:", self->_oneByTwoSuggestions);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[9] = v13;
  v27[10] = CFSTR("[2 x 2]");
  -[ATXSuggestionLayout arrayOfJSONFromSuggestionArray:](self, "arrayOfJSONFromSuggestionArray:", self->_twoByTwoSuggestions);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[10] = v14;
  v27[11] = CFSTR("[1 x 4]");
  -[ATXSuggestionLayout arrayOfJSONFromSuggestionArray:](self, "arrayOfJSONFromSuggestionArray:", self->_oneByFourSuggestions);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[11] = v15;
  v27[12] = CFSTR("[2 x 4]");
  -[ATXSuggestionLayout arrayOfJSONFromSuggestionArray:](self, "arrayOfJSONFromSuggestionArray:", self->_twoByFourSuggestions);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[12] = v16;
  v27[13] = CFSTR("[4 x 4]");
  -[ATXSuggestionLayout arrayOfJSONFromSuggestionArray:](self, "arrayOfJSONFromSuggestionArray:", self->_fourByFourSuggestions);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[13] = v17;
  v27[14] = CFSTR("[4 x 8]");
  -[ATXSuggestionLayout arrayOfJSONFromSuggestionArray:](self, "arrayOfJSONFromSuggestionArray:", self->_fourByEightSuggestions);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[14] = v18;
  v27[15] = CFSTR("highestConfidenceSuggestion");
  if (v3)
  {
    objc_msgSend(v3, "jsonRawData");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v28[15] = v5;
  v27[16] = CFSTR("numWidgetsInStack");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numWidgetsInStack);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[16] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  if (v26)

  return v20;
}

- (BOOL)isShortcutConversion
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;

  if (self->_isValidForSuggestionsWidget)
    return 0;
  -[ATXSuggestionLayout allSuggestionsInLayout](self, "allSuggestionsInLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executableSpecification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "executableType");

    if (v6 == 3)
    {
      objc_msgSend(v4, "clientModelSpecification");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clientModelId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = +[ATXProactiveSuggestionClientModel clientModelTypeFromClientModelId:](ATXProactiveSuggestionClientModel, "clientModelTypeFromClientModelId:", v8);

      v2 = +[ATXProactiveSuggestionClientModel clientModelTypeIsShortcutConversion:](ATXProactiveSuggestionClientModel, "clientModelTypeIsShortcutConversion:", v9);
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (double)layoutScore
{
  return self->_layoutScore;
}

- (void)setLayoutScore:(double)a3
{
  self->_layoutScore = a3;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSUUID)uuidOfHighestConfidenceSuggestion
{
  return self->_uuidOfHighestConfidenceSuggestion;
}

- (void)setUuidOfHighestConfidenceSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_uuidOfHighestConfidenceSuggestion, a3);
}

- (NSArray)oneByOneSuggestions
{
  return self->_oneByOneSuggestions;
}

- (void)setOneByOneSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_oneByOneSuggestions, a3);
}

- (NSArray)oneByTwoSuggestions
{
  return self->_oneByTwoSuggestions;
}

- (void)setOneByTwoSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_oneByTwoSuggestions, a3);
}

- (NSArray)twoByTwoSuggestions
{
  return self->_twoByTwoSuggestions;
}

- (void)setTwoByTwoSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_twoByTwoSuggestions, a3);
}

- (NSArray)oneByFourSuggestions
{
  return self->_oneByFourSuggestions;
}

- (void)setOneByFourSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_oneByFourSuggestions, a3);
}

- (NSArray)twoByFourSuggestions
{
  return self->_twoByFourSuggestions;
}

- (void)setTwoByFourSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_twoByFourSuggestions, a3);
}

- (NSArray)fourByFourSuggestions
{
  return self->_fourByFourSuggestions;
}

- (void)setFourByFourSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_fourByFourSuggestions, a3);
}

- (NSArray)fourByEightSuggestions
{
  return self->_fourByEightSuggestions;
}

- (void)setFourByEightSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_fourByEightSuggestions, a3);
}

- (BOOL)isValidForSuggestionsWidget
{
  return self->_isValidForSuggestionsWidget;
}

- (void)setIsValidForSuggestionsWidget:(BOOL)a3
{
  self->_isValidForSuggestionsWidget = a3;
}

- (BOOL)confidenceWarrantsSnappingOrNPlusOne
{
  return self->_confidenceWarrantsSnappingOrNPlusOne;
}

- (void)setConfidenceWarrantsSnappingOrNPlusOne:(BOOL)a3
{
  self->_confidenceWarrantsSnappingOrNPlusOne = a3;
}

- (BOOL)isNPlusOne
{
  return self->_isNPlusOne;
}

- (void)setIsNPlusOne:(BOOL)a3
{
  self->_isNPlusOne = a3;
}

- (NSString)widgetUniqueId
{
  return self->_widgetUniqueId;
}

- (void)setWidgetUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetUniqueId, a3);
}

- (BOOL)isLowConfidenceStackRotationForStaleStack
{
  return self->_isLowConfidenceStackRotationForStaleStack;
}

- (void)setIsLowConfidenceStackRotationForStaleStack:(BOOL)a3
{
  self->_isLowConfidenceStackRotationForStaleStack = a3;
}

- (unint64_t)numWidgetsInStack
{
  return self->_numWidgetsInStack;
}

- (void)setNumWidgetsInStack:(unint64_t)a3
{
  self->_numWidgetsInStack = a3;
}

@end
