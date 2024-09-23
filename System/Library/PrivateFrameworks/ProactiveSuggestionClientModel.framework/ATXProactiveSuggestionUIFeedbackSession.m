@implementation ATXProactiveSuggestionUIFeedbackSession

- (ATXProactiveSuggestionUIFeedbackSession)initWithSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXProactiveSuggestionUIFeedbackSession *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = -[ATXProactiveSuggestionUIFeedbackSession initWithSessionUUID:sessionIdentifier:consumerSubType:sessionStartDate:sessionEndDate:blendingUICacheUpdateUUID:engagedUUIDs:rejectedUUIDs:shownUUIDs:sessionMetadata:](self, "initWithSessionUUID:sessionIdentifier:consumerSubType:sessionStartDate:sessionEndDate:blendingUICacheUpdateUUID:engagedUUIDs:rejectedUUIDs:shownUUIDs:sessionMetadata:", v5, v4, 0, 0, 0, 0, v6, v7, v8, 0);

  return v9;
}

- (ATXProactiveSuggestionUIFeedbackSession)initWithSessionUUID:(id)a3 sessionIdentifier:(id)a4 consumerSubType:(unsigned __int8)a5 sessionStartDate:(id)a6 sessionEndDate:(id)a7 blendingUICacheUpdateUUID:(id)a8 engagedUUIDs:(id)a9 rejectedUUIDs:(id)a10 shownUUIDs:(id)a11 sessionMetadata:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  ATXProactiveSuggestionUIFeedbackSession *v22;
  ATXProactiveSuggestionUIFeedbackSession *v23;
  uint64_t v24;
  NSMutableOrderedSet *engagedUUIDs;
  uint64_t v26;
  NSMutableOrderedSet *rejectedUUIDs;
  uint64_t v28;
  NSMutableOrderedSet *shownUUIDs;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a3;
  v35 = a4;
  v34 = a6;
  v33 = a7;
  v32 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v37.receiver = self;
  v37.super_class = (Class)ATXProactiveSuggestionUIFeedbackSession;
  v22 = -[ATXProactiveSuggestionUIFeedbackSession init](&v37, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_sessionUUID, a3);
    objc_storeStrong((id *)&v23->_sessionIdentifier, a4);
    v23->_consumerSubType = a5;
    objc_storeStrong((id *)&v23->_sessionStartDate, a6);
    objc_storeStrong((id *)&v23->_sessionEndDate, a7);
    objc_storeStrong((id *)&v23->_blendingUICacheUpdateUUID, a8);
    v24 = objc_msgSend(v18, "mutableCopy");
    engagedUUIDs = v23->_engagedUUIDs;
    v23->_engagedUUIDs = (NSMutableOrderedSet *)v24;

    v26 = objc_msgSend(v19, "mutableCopy");
    rejectedUUIDs = v23->_rejectedUUIDs;
    v23->_rejectedUUIDs = (NSMutableOrderedSet *)v26;

    v28 = objc_msgSend(v20, "mutableCopy");
    shownUUIDs = v23->_shownUUIDs;
    v23->_shownUUIDs = (NSMutableOrderedSet *)v28;

    objc_storeStrong((id *)&v23->_sessionMetadata, a12);
  }

  return v23;
}

- (void)updateConsumerSubTypeIfUnset:(unsigned __int8)a3
{
  if (!self->_consumerSubType)
    self->_consumerSubType = a3;
}

- (void)updateSessionStartDateIfUnset:(id)a3
{
  id v5;
  NSDate **p_sessionStartDate;
  NSDate *sessionStartDate;
  id v8;

  v5 = a3;
  sessionStartDate = self->_sessionStartDate;
  p_sessionStartDate = &self->_sessionStartDate;
  if (!sessionStartDate)
  {
    v8 = v5;
    objc_storeStrong((id *)p_sessionStartDate, a3);
    v5 = v8;
  }

}

- (void)updateBlendingUICacheUpdateUUIDIfUnset:(id)a3
{
  id v5;
  NSUUID **p_blendingUICacheUpdateUUID;
  NSUUID *blendingUICacheUpdateUUID;
  id v8;

  v5 = a3;
  if (v5)
  {
    blendingUICacheUpdateUUID = self->_blendingUICacheUpdateUUID;
    p_blendingUICacheUpdateUUID = &self->_blendingUICacheUpdateUUID;
    if (!blendingUICacheUpdateUUID)
    {
      v8 = v5;
      objc_storeStrong((id *)p_blendingUICacheUpdateUUID, a3);
      v5 = v8;
    }
  }

}

- (void)updateEngagedUUIDs:(id)a3 rejectedUUIDs:(id)a4 shownUUIDs:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (v10)
    -[NSMutableOrderedSet addObjectsFromArray:](self->_engagedUUIDs, "addObjectsFromArray:", v10);
  if (v8)
    -[NSMutableOrderedSet addObjectsFromArray:](self->_rejectedUUIDs, "addObjectsFromArray:", v8);
  if (v9)
    -[NSMutableOrderedSet addObjectsFromArray:](self->_shownUUIDs, "addObjectsFromArray:", v9);

}

- (void)updateSessionMetadataIfUnset:(id)a3
{
  id v5;
  ATXProactiveSuggestionUIFeedbackSessionMetadataProtocol **p_sessionMetadata;
  ATXProactiveSuggestionUIFeedbackSessionMetadataProtocol *sessionMetadata;
  id v8;

  v5 = a3;
  sessionMetadata = self->_sessionMetadata;
  p_sessionMetadata = &self->_sessionMetadata;
  if (!sessionMetadata)
  {
    v8 = v5;
    objc_storeStrong((id *)p_sessionMetadata, a3);
    v5 = v8;
  }

}

- (void)updateSessionEndDateIfUnset:(id)a3
{
  id v5;
  NSDate **p_sessionEndDate;
  NSDate *sessionEndDate;
  id v8;

  v5 = a3;
  sessionEndDate = self->_sessionEndDate;
  p_sessionEndDate = &self->_sessionEndDate;
  if (!sessionEndDate)
  {
    v8 = v5;
    objc_storeStrong((id *)p_sessionEndDate, a3);
    v5 = v8;
  }

}

- (BOOL)isValidSession
{
  ATXProactiveSuggestionUIFeedbackSession *v2;
  double v3;
  double v4;
  double v5;
  unint64_t v6;

  v2 = self;
  LOBYTE(self) = 0;
  if (v2->_consumerSubType)
  {
    if (v2->_consumerSubType != 48)
    {
      self = (ATXProactiveSuggestionUIFeedbackSession *)v2->_sessionStartDate;
      if (self)
        LOBYTE(self) = v2->_sessionEndDate
                    && (-[ATXProactiveSuggestionUIFeedbackSession timeIntervalSince1970](self, "timeIntervalSince1970"),
                        v4 = v3,
                        -[NSDate timeIntervalSince1970](v2->_sessionEndDate, "timeIntervalSince1970"),
                        v4 <= v5)
                    && v2->_blendingUICacheUpdateUUID
                    && ((v6 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerTypeForSubType:", v2->_consumerSubType),
                         v6 > 0xF)
                     || ((1 << v6) & 0xC002) == 0
                     || v2->_sessionMetadata);
    }
  }
  return (char)self;
}

- (id)validSessionMetadataClassNames
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1AF421DC4](self, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ATXSpotlightSessionMetadata"), CFSTR("ATXFakeSessionMetadata"), CFSTR("ATXHomeScreenSessionMetadata"), CFSTR("ATXAppDirectorySessionMetadata"), 0);
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (NSOrderedSet)engagedUUIDs
{
  return (NSOrderedSet *)(id)-[NSMutableOrderedSet copy](self->_engagedUUIDs, "copy");
}

- (NSOrderedSet)rejectedUUIDs
{
  return (NSOrderedSet *)(id)-[NSMutableOrderedSet copy](self->_rejectedUUIDs, "copy");
}

- (NSOrderedSet)shownUUIDs
{
  return (NSOrderedSet *)(id)-[NSMutableOrderedSet copy](self->_shownUUIDs, "copy");
}

- (id)mutableEngagedUUIDs
{
  return self->_engagedUUIDs;
}

- (id)mutableRejectedUUIDs
{
  return self->_engagedUUIDs;
}

- (id)mutableShownUUIDs
{
  return self->_engagedUUIDs;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", self->_sessionUUID, CFSTR("sessionUUID"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_sessionIdentifier, CFSTR("sessionidentifier"));
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_consumerSubType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("consumersubtype"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_sessionStartDate, CFSTR("startdate"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_sessionEndDate, CFSTR("enddate"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_blendingUICacheUpdateUUID, CFSTR("blendinguuid"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_engagedUUIDs, CFSTR("engaged"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_rejectedUUIDs, CFSTR("rejected"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_shownUUIDs, CFSTR("shown"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_sessionMetadata, CFSTR("metadata"));
  if (self->_sessionMetadata)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("metadataClassName"));

}

- (ATXProactiveSuggestionUIFeedbackSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXProactiveSuggestionUIFeedbackSession *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  ATXProactiveSuggestionUIFeedbackSession *v41;
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
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  Class v57;
  Class v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSString *aClassName;
  ATXProactiveSuggestionUIFeedbackSession *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  unsigned int v69;
  void *v70;
  char v71;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_blending_ecosystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("sessionUUID"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v11 = (void *)MEMORY[0x1E0D81610];
      v12 = objc_opt_class();
      __atxlog_handle_blending_ecosystem();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("sessionidentifier"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession"), -1, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14
        || (objc_msgSend(v4, "error"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, v15))
      {
        v10 = 0;
LABEL_11:

        goto LABEL_12;
      }
      v16 = (void *)MEMORY[0x1E0D81610];
      v17 = objc_opt_class();
      __atxlog_handle_blending_ecosystem();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("consumersubtype"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession"), -1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19
        || (objc_msgSend(v4, "error"),
            v10 = (ATXProactiveSuggestionUIFeedbackSession *)objc_claimAutoreleasedReturnValue(),
            v10,
            v10))
      {
        v10 = 0;
LABEL_10:

        goto LABEL_11;
      }
      v71 = 0;
      v21 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", v19, &v71);
      if (!v71 || v21 == 48)
        goto LABEL_10;
      v69 = v21;
      v70 = v19;
      v22 = (void *)MEMORY[0x1E0D81610];
      v23 = objc_opt_class();
      __atxlog_handle_blending_ecosystem();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v23, CFSTR("startdate"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession"), -1, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v10 = 0;
        v19 = v70;
LABEL_49:

        goto LABEL_10;
      }
      v67 = v25;
      v27 = (void *)MEMORY[0x1E0D81610];
      v28 = objc_opt_class();
      __atxlog_handle_blending_ecosystem();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v28, CFSTR("enddate"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession"), -1, v29);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v10 = 0;
        v19 = v70;
        v25 = v67;
LABEL_48:

        goto LABEL_49;
      }
      v31 = (void *)MEMORY[0x1E0D81610];
      v32 = objc_opt_class();
      __atxlog_handle_blending_ecosystem();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v32, CFSTR("blendinguuid"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession"), -1, v33);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v10 = 0;
        v19 = v70;
        v25 = v67;
LABEL_47:

        goto LABEL_48;
      }
      v35 = (void *)MEMORY[0x1AF421DC4]();
      v36 = objc_alloc(MEMORY[0x1E0C99E60]);
      v37 = objc_opt_class();
      v38 = objc_msgSend(v36, "initWithObjects:", v37, objc_opt_class(), 0);
      objc_autoreleasePoolPop(v35);
      v39 = (void *)MEMORY[0x1E0D81610];
      __atxlog_handle_blending_ecosystem();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v38, CFSTR("engaged"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession"), -1, v40);
      v10 = (ATXProactiveSuggestionUIFeedbackSession *)objc_claimAutoreleasedReturnValue();

      v41 = v10;
      v65 = (void *)v38;
      if (!v10)
      {
        v19 = v70;
        goto LABEL_25;
      }
      objc_msgSend(v4, "error");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v70;
      if (v42)
      {
        v10 = 0;
LABEL_25:
        v25 = v67;
LABEL_46:

        goto LABEL_47;
      }
      v64 = v41;
      v43 = (void *)MEMORY[0x1E0D81610];
      __atxlog_handle_blending_ecosystem();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v38, CFSTR("rejected"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession"), -1, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v45
        || (objc_msgSend(v4, "error"), v46 = (void *)objc_claimAutoreleasedReturnValue(), v46, v46))
      {
        v10 = 0;
LABEL_45:

        v19 = v70;
        v25 = v67;
        v41 = v64;
        goto LABEL_46;
      }
      v47 = (void *)MEMORY[0x1E0D81610];
      __atxlog_handle_blending_ecosystem();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v38, CFSTR("shown"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession"), -1, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v49
        || (objc_msgSend(v4, "error"), v50 = (void *)objc_claimAutoreleasedReturnValue(), v50, v50))
      {
        v10 = 0;
LABEL_44:

        goto LABEL_45;
      }
      v51 = (void *)MEMORY[0x1E0D81610];
      v52 = objc_opt_class();
      __atxlog_handle_blending_ecosystem();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v52, CFSTR("metadataClassName"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession"), -1, v53);
      aClassName = (NSString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        v10 = 0;
LABEL_43:

        goto LABEL_44;
      }
      if (aClassName
        && (-[ATXProactiveSuggestionUIFeedbackSession validSessionMetadataClassNames](self, "validSessionMetadataClassNames"), v55 = (void *)objc_claimAutoreleasedReturnValue(), v56 = objc_msgSend(v55, "containsObject:", aClassName), v55, v56)&& (v57 = NSClassFromString(aClassName)) != 0)
      {
        v58 = v57;
        v59 = (void *)MEMORY[0x1E0D81610];
        __atxlog_handle_blending_ecosystem();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v58, CFSTR("metadata"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession"), -1, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v61
          || (objc_msgSend(v4, "error"), v62 = (void *)objc_claimAutoreleasedReturnValue(), v62, v62))
        {
          v10 = 0;
LABEL_42:

          goto LABEL_43;
        }
      }
      else
      {
        v61 = 0;
      }
      self = -[ATXProactiveSuggestionUIFeedbackSession initWithSessionUUID:sessionIdentifier:consumerSubType:sessionStartDate:sessionEndDate:blendingUICacheUpdateUUID:engagedUUIDs:rejectedUUIDs:shownUUIDs:sessionMetadata:](self, "initWithSessionUUID:sessionIdentifier:consumerSubType:sessionStartDate:sessionEndDate:blendingUICacheUpdateUUID:engagedUUIDs:rejectedUUIDs:shownUUIDs:sessionMetadata:", v8, v14, v69, v67, v68, v66, v64, v45, v49, v61);
      v10 = self;
      goto LABEL_42;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSUUID hash](self->_sessionUUID, "hash");
  v4 = -[NSString hash](self->_sessionIdentifier, "hash");
  v5 = self->_consumerSubType - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  v6 = -[NSDate hash](self->_sessionStartDate, "hash") - v5 + 32 * v5;
  v7 = -[NSDate hash](self->_sessionEndDate, "hash") - v6 + 32 * v6;
  v8 = -[NSUUID hash](self->_blendingUICacheUpdateUUID, "hash") - v7 + 32 * v7;
  v9 = -[NSMutableOrderedSet hash](self->_engagedUUIDs, "hash") - v8 + 32 * v8;
  v10 = -[NSMutableOrderedSet hash](self->_rejectedUUIDs, "hash") - v9 + 32 * v9;
  v11 = -[NSMutableOrderedSet hash](self->_shownUUIDs, "hash") - v10 + 32 * v10;
  return -[ATXProactiveSuggestionUIFeedbackSessionMetadataProtocol hash](self->_sessionMetadata, "hash")
       - v11
       + 32 * v11;
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionUIFeedbackSession *v4;
  ATXProactiveSuggestionUIFeedbackSession *v5;
  BOOL v6;

  v4 = (ATXProactiveSuggestionUIFeedbackSession *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXProactiveSuggestionUIFeedbackSession isEqualToATXProactiveSuggestionUIFeedbackSession:](self, "isEqualToATXProactiveSuggestionUIFeedbackSession:", v5);

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionUIFeedbackSession:(id)a3
{
  id *v4;
  NSUUID *sessionUUID;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *v8;
  char v9;
  NSString *sessionIdentifier;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSDate *sessionStartDate;
  NSDate *v16;
  NSDate *v17;
  NSDate *v18;
  char v19;
  NSDate *sessionEndDate;
  NSDate *v21;
  NSDate *v22;
  NSDate *v23;
  char v24;
  NSUUID *blendingUICacheUpdateUUID;
  NSUUID *v26;
  NSUUID *v27;
  NSUUID *v28;
  char v29;
  NSMutableOrderedSet *engagedUUIDs;
  NSMutableOrderedSet *v31;
  NSMutableOrderedSet *v32;
  NSMutableOrderedSet *v33;
  char v34;
  NSMutableOrderedSet *rejectedUUIDs;
  NSMutableOrderedSet *v36;
  NSMutableOrderedSet *v37;
  NSMutableOrderedSet *v38;
  char v39;
  NSMutableOrderedSet *shownUUIDs;
  NSMutableOrderedSet *v41;
  NSMutableOrderedSet *v42;
  NSMutableOrderedSet *v43;
  char v44;
  char v45;
  ATXProactiveSuggestionUIFeedbackSessionMetadataProtocol *v47;
  ATXProactiveSuggestionUIFeedbackSessionMetadataProtocol *v48;

  v4 = (id *)a3;
  sessionUUID = self->_sessionUUID;
  v6 = (NSUUID *)v4[5];
  if (sessionUUID == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = sessionUUID;
    v9 = -[NSUUID isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_32;
  }
  sessionIdentifier = self->_sessionIdentifier;
  v11 = (NSString *)v4[6];
  if (sessionIdentifier == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = sessionIdentifier;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_32;
  }
  if (self->_consumerSubType != *((unsigned __int8 *)v4 + 32))
  {
LABEL_32:
    v45 = 0;
    goto LABEL_33;
  }
  sessionStartDate = self->_sessionStartDate;
  v16 = (NSDate *)v4[7];
  if (sessionStartDate == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = sessionStartDate;
    v19 = -[NSDate isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_32;
  }
  sessionEndDate = self->_sessionEndDate;
  v21 = (NSDate *)v4[8];
  if (sessionEndDate == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = sessionEndDate;
    v24 = -[NSDate isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_32;
  }
  blendingUICacheUpdateUUID = self->_blendingUICacheUpdateUUID;
  v26 = (NSUUID *)v4[9];
  if (blendingUICacheUpdateUUID == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = blendingUICacheUpdateUUID;
    v29 = -[NSUUID isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_32;
  }
  engagedUUIDs = self->_engagedUUIDs;
  v31 = (NSMutableOrderedSet *)v4[1];
  if (engagedUUIDs == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = engagedUUIDs;
    v34 = -[NSMutableOrderedSet isEqual:](v33, "isEqual:", v32);

    if ((v34 & 1) == 0)
      goto LABEL_32;
  }
  rejectedUUIDs = self->_rejectedUUIDs;
  v36 = (NSMutableOrderedSet *)v4[2];
  if (rejectedUUIDs == v36)
  {

  }
  else
  {
    v37 = v36;
    v38 = rejectedUUIDs;
    v39 = -[NSMutableOrderedSet isEqual:](v38, "isEqual:", v37);

    if ((v39 & 1) == 0)
      goto LABEL_32;
  }
  shownUUIDs = self->_shownUUIDs;
  v41 = (NSMutableOrderedSet *)v4[3];
  if (shownUUIDs == v41)
  {

  }
  else
  {
    v42 = v41;
    v43 = shownUUIDs;
    v44 = -[NSMutableOrderedSet isEqual:](v43, "isEqual:", v42);

    if ((v44 & 1) == 0)
      goto LABEL_32;
  }
  v47 = self->_sessionMetadata;
  v48 = v47;
  if (v47 == v4[10])
    v45 = 1;
  else
    v45 = -[ATXProactiveSuggestionUIFeedbackSessionMetadataProtocol isEqual:](v47, "isEqual:");

LABEL_33:
  return v45;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (NSDate)sessionEndDate
{
  return self->_sessionEndDate;
}

- (NSUUID)blendingUICacheUpdateUUID
{
  return self->_blendingUICacheUpdateUUID;
}

- (ATXProactiveSuggestionUIFeedbackSessionMetadataProtocol)sessionMetadata
{
  return self->_sessionMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionMetadata, 0);
  objc_storeStrong((id *)&self->_blendingUICacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_sessionEndDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_shownUUIDs, 0);
  objc_storeStrong((id *)&self->_rejectedUUIDs, 0);
  objc_storeStrong((id *)&self->_engagedUUIDs, 0);
}

@end
