@implementation _PSSuggestion

- (_PSSuggestion)initWithBundleID:(id)a3 recipients:(id)a4
{
  return -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:](self, "initWithBundleID:conversationIdentifier:groupName:recipients:", a3, 0, 0, a4);
}

- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6
{
  return -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:](self, "initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:", a3, a4, a5, a6, 0, 0);
}

- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6 reason:(id)a7 reasonType:(id)a8
{
  return -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:](self, "initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:", a3, a4, a5, a6, 0, 0, a7, a8, 0);
}

- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6 reason:(id)a7 reasonType:(id)a8 score:(id)a9
{
  return -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:](self, "initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:", a3, a4, a5, a6, 0, 0, a7, a8, a9);
}

- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6 derivedIntentIdentifier:(id)a7 image:(id)a8 reason:(id)a9 reasonType:(id)a10 score:(id)a11
{
  uint64_t v12;

  LOBYTE(v12) = 0;
  return -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:familySuggestion:](self, "initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:familySuggestion:", a3, a4, a5, a6, a7, a8, a9, a10, a11, v12);
}

- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6 derivedIntentIdentifier:(id)a7 image:(id)a8 reason:(id)a9 reasonType:(id)a10 score:(id)a11 familySuggestion:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v44;
  id v45;
  objc_super v46;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v45 = a8;
  v23 = a9;
  v24 = a10;
  v44 = a11;
  v46.receiver = self;
  v46.super_class = (Class)_PSSuggestion;
  v25 = -[_PSSuggestion init](&v46, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v19, "copy");
    v27 = (void *)*((_QWORD *)v25 + 2);
    *((_QWORD *)v25 + 2) = v26;

    v28 = objc_msgSend(v20, "copy");
    v29 = (void *)*((_QWORD *)v25 + 3);
    *((_QWORD *)v25 + 3) = v28;

    v30 = objc_msgSend(v21, "copy");
    v31 = (void *)*((_QWORD *)v25 + 4);
    *((_QWORD *)v25 + 4) = v30;

    v32 = objc_msgSend(v18, "copy");
    v33 = (void *)*((_QWORD *)v25 + 5);
    *((_QWORD *)v25 + 5) = v32;

    v34 = objc_msgSend(v22, "copy");
    v35 = (void *)*((_QWORD *)v25 + 8);
    *((_QWORD *)v25 + 8) = v34;

    objc_storeStrong((id *)v25 + 6, a8);
    v36 = objc_msgSend(v23, "copy");
    v37 = (void *)*((_QWORD *)v25 + 15);
    *((_QWORD *)v25 + 15) = v36;

    v38 = objc_msgSend(v24, "copy");
    v39 = (void *)*((_QWORD *)v25 + 16);
    *((_QWORD *)v25 + 16) = v38;

    v40 = (void *)*((_QWORD *)v25 + 17);
    *((_QWORD *)v25 + 17) = CFSTR("null");

    objc_storeStrong((id *)v25 + 10, a11);
    v25[8] = a12;
    *(_WORD *)(v25 + 9) = 0;
    v41 = (void *)*((_QWORD *)v25 + 11);
    *((_QWORD *)v25 + 11) = 0;

    if ((unint64_t)objc_msgSend(v21, "count") < 2)
    {
      if (objc_msgSend(v21, "count") != 1)
      {
        *((_QWORD *)v25 + 7) = 0;
        goto LABEL_8;
      }
      v42 = 1;
    }
    else
    {
      v42 = 2;
    }
    *((_QWORD *)v25 + 7) = v42;
  }
LABEL_8:

  return (_PSSuggestion *)v25;
}

+ (id)suggestionForBundleID:(id)a3 derivedIntentIdentifier:(id)a4 knowledgeStore:(id)a5 contactResolver:(id)a6 reason:(id)a7 reasonType:(id)a8
{
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _PSSuggestion *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  _PSSuggestion *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  uint8_t v78[128];
  uint8_t buf[4];
  NSObject *v80;
  __int16 v81;
  id v82;
  uint64_t v83;
  void *v84;
  _QWORD v85[5];

  v85[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v67 = a7;
  v72 = a8;
  v17 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0D15A40], "derivedIntentIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateForObjectsWithMetadataKey:andStringValue:", v18, v14);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0D15AF0], "intentsSourceID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "predicateForEventsWithSourceID:bundleID:", v21, v13);
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0CB3528];
  v66 = (void *)v19;
  v85[0] = v19;
  v85[1] = v22;
  v71 = (void *)v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "andPredicateWithSubpredicates:", v24);
  v25 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 0);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(MEMORY[0x1E0D15AF8], "appIntentsStream");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)v26;
  v83 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)v25;
  objc_msgSend(v27, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v25, v29, 0, 1, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_PSSuggestion.m");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringByAppendingFormat:", CFSTR(":%d"), 836);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setClientName:", v33);

  objc_msgSend(v31, "setTracker:", &__block_literal_global_235);
  v77 = 0;
  objc_msgSend(v15, "executeQuery:error:", v31, &v77);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v77;
  if (v68)
  {
    +[_PSLogging knnChannel](_PSLogging, "knnChannel");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      +[_PSSuggestion suggestionForBundleID:derivedIntentIdentifier:knowledgeStore:contactResolver:reason:reasonType:].cold.1();
    v36 = 0;
    v37 = v66;
    v38 = v67;
  }
  else
  {
    objc_msgSend(v34, "firstObject");
    v39 = objc_claimAutoreleasedReturnValue();
    v35 = v39;
    if (v39)
    {
      -[NSObject interaction](v39, "interaction");
      v40 = objc_claimAutoreleasedReturnValue();
      -[NSObject intent](v40, "intent");
      v41 = objc_claimAutoreleasedReturnValue();
      v64 = v13;
      v65 = v40;
      v63 = (void *)v41;
      if (v41 && (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v60 = v34;
        v61 = v15;
        v62 = v14;
        v43 = v42;
        v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v59 = v43;
        -[NSObject recipients](v43, "recipients");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v47; ++i)
            {
              if (*(_QWORD *)v74 != v48)
                objc_enumerationMutation(v45);
              +[_PSRecipient recipientForINPerson:contactResolver:](_PSRecipient, "recipientForINPerson:contactResolver:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i), v16);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              if (v50)
                objc_msgSend(v44, "addObject:", v50);

            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
          }
          while (v47);
        }

        v51 = [_PSSuggestion alloc];
        v52 = v59;
        -[NSObject speakableGroupName](v59, "speakableGroupName");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "spokenPhrase");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)objc_msgSend(v44, "copy");
        -[NSObject keyImage](v59, "keyImage");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v67;
        v36 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:](v51, "initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:", v64, 0, v57, v53, v62, v54, v67, v72, 0);

        v14 = v62;
        v34 = v60;
        v15 = v61;
        v37 = v66;
      }
      else
      {
        +[_PSLogging knnChannel](_PSLogging, "knnChannel");
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v80 = v35;
          _os_log_impl(&dword_1A07F4000, v52, OS_LOG_TYPE_INFO, "Could not retrieve send message intent from _DKEvent: %@", buf, 0xCu);
        }
        v36 = 0;
        v37 = v66;
        v38 = v67;
      }

      v13 = v64;
    }
    else
    {
      +[_PSLogging knnChannel](_PSLogging, "knnChannel");
      v55 = objc_claimAutoreleasedReturnValue();
      v65 = v55;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v80 = v13;
        v81 = 2112;
        v82 = v14;
        _os_log_impl(&dword_1A07F4000, v55, OS_LOG_TYPE_INFO, "No intent with bundleID: %@, derived identifier: %@", buf, 0x16u);
      }
      v36 = 0;
      v37 = v66;
      v38 = v67;
    }

  }
  return v36;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSSuggestion)initWithCoder:(id)a3
{
  id v4;
  _PSSuggestion *v5;
  uint64_t v6;
  NSString *conversationIdentifier;
  uint64_t v8;
  NSString *groupName;
  uint64_t v10;
  NSString *bundleID;
  uint64_t v12;
  NSString *derivedIntentIdentifier;
  uint64_t v14;
  INImage *image;
  uint64_t v16;
  NSString *reason;
  uint64_t v18;
  NSString *reasonType;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *recipients;
  uint64_t v25;
  NSString *trialID;
  uint64_t v27;
  NSNumber *score;
  uint64_t v29;
  NSString *adaptedModelRecipeID;
  uint64_t v31;
  NSString *supportedBundleIDs;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSDictionary *modelSuggestionProxies;
  uint64_t v40;
  NSString *utiList;
  uint64_t v42;
  NSString *messagesGroupIdentifier;
  _PSSuggestion *v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)_PSSuggestion;
  v5 = -[_PSSuggestion init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conversationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    conversationIdentifier = v5->_conversationIdentifier;
    v5->_conversationIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
    v8 = objc_claimAutoreleasedReturnValue();
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("derivedIntentIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    derivedIntentIdentifier = v5->_derivedIntentIdentifier;
    v5->_derivedIntentIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v14 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (INImage *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v16 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reasonType"));
    v18 = objc_claimAutoreleasedReturnValue();
    reasonType = v5->_reasonType;
    v5->_reasonType = (NSString *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("recipients"));
    v23 = objc_claimAutoreleasedReturnValue();
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trialID"));
    v25 = objc_claimAutoreleasedReturnValue();
    trialID = v5->_trialID;
    v5->_trialID = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("score"));
    v27 = objc_claimAutoreleasedReturnValue();
    score = v5->_score;
    v5->_score = (NSNumber *)v27;

    v5->_isAdaptedModelCreated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAdaptedModelCreated"));
    v5->_isAdaptedModelUsed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAdaptedModelUsed"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("adaptedModelRecipeID"));
    v29 = objc_claimAutoreleasedReturnValue();
    adaptedModelRecipeID = v5->_adaptedModelRecipeID;
    v5->_adaptedModelRecipeID = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportedBundleIDs"));
    v31 = objc_claimAutoreleasedReturnValue();
    supportedBundleIDs = v5->_supportedBundleIDs;
    v5->_supportedBundleIDs = (NSString *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, v35, v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("modelSuggestionProxies"));
    v38 = objc_claimAutoreleasedReturnValue();
    modelSuggestionProxies = v5->_modelSuggestionProxies;
    v5->_modelSuggestionProxies = (NSDictionary *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("utiList"));
    v40 = objc_claimAutoreleasedReturnValue();
    utiList = v5->_utiList;
    v5->_utiList = (NSString *)v40;

    v5->_familySuggestion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("familySuggestion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messagesGroupIdentifier"));
    v42 = objc_claimAutoreleasedReturnValue();
    messagesGroupIdentifier = v5->_messagesGroupIdentifier;
    v5->_messagesGroupIdentifier = (NSString *)v42;

    v44 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *conversationIdentifier;
  id v5;

  conversationIdentifier = self->_conversationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", conversationIdentifier, CFSTR("conversationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupName, CFSTR("groupName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_derivedIntentIdentifier, CFSTR("derivedIntentIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reasonType, CFSTR("reasonType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipients, CFSTR("recipients"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trialID, CFSTR("trialID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_score, CFSTR("score"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAdaptedModelCreated, CFSTR("isAdaptedModelCreated"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAdaptedModelUsed, CFSTR("isAdaptedModelUsed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_adaptedModelRecipeID, CFSTR("adaptedModelRecipeID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedBundleIDs, CFSTR("supportedBundleIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelSuggestionProxies, CFSTR("modelSuggestionProxies"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_utiList, CFSTR("utiList"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_familySuggestion, CFSTR("familySuggestion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messagesGroupIdentifier, CFSTR("messagesGroupIdentifier"));

}

- (NSString)description
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
  uint64_t v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_opt_class();
  -[_PSSuggestion conversationIdentifier](self, "conversationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestion groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestion bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestion reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestion reasonType](self, "reasonType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestion recipients](self, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestion image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestion derivedIntentIdentifier](self, "derivedIntentIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestion trialID](self, "trialID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@ %p> conversationIdentifier: %@, groupName: %@, bundleID: %@, reason: %@, reasonType: %@, recipients: %@, image: %@, derivedIntentIdentifier: %@, trialID: %@"), v14, self, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSUInteger v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_PSSuggestion recipients](self, "recipients", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 ^= objc_msgSend(v9, "hash");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v10 = -[NSString hash](self->_conversationIdentifier, "hash");
  return v10 ^ v6 ^ -[NSString hash](self->_groupName, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _PSSuggestion *v4;
  _PSSuggestion *v5;
  _PSSuggestion *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  uint64_t v53;
  char v54;

  v4 = (_PSSuggestion *)a3;
  v5 = v4;
  if (self == v4)
  {
    v54 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[_PSSuggestion conversationIdentifier](self, "conversationIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[_PSSuggestion conversationIdentifier](v6, "conversationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[_PSSuggestion conversationIdentifier](self, "conversationIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSSuggestion conversationIdentifier](v6, "conversationIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (!v12)
          goto LABEL_28;
      }
    }
    -[_PSSuggestion groupName](self, "groupName");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[_PSSuggestion groupName](v6, "groupName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[_PSSuggestion groupName](self, "groupName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSSuggestion groupName](v6, "groupName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if (!v18)
          goto LABEL_28;
      }
    }
    -[_PSSuggestion bundleID](self, "bundleID");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[_PSSuggestion bundleID](v6, "bundleID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[_PSSuggestion bundleID](self, "bundleID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSSuggestion bundleID](v6, "bundleID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqualToString:", v23);

        if (!v24)
          goto LABEL_28;
      }
    }
    -[_PSSuggestion recipients](v6, "recipients");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");
    -[_PSSuggestion recipients](self, "recipients");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v26 != v28)
    {
LABEL_28:
      v54 = 0;
    }
    else
    {
      v29 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[_PSSuggestion recipients](self, "recipients");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

      if (v31)
      {
        v32 = 0;
        do
        {
          -[_PSSuggestion recipients](self, "recipients");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectAtIndexedSubscript:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "handle");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            -[_PSSuggestion recipients](self, "recipients");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectAtIndexedSubscript:", v32);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "handle");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v38);

          }
          ++v32;
          -[_PSSuggestion recipients](self, "recipients");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "count");

        }
        while (v40 > v32);
      }
      v41 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[_PSSuggestion recipients](v6, "recipients");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

      if (v43)
      {
        v44 = 0;
        do
        {
          -[_PSSuggestion recipients](v6, "recipients");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectAtIndexedSubscript:", v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "handle");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            -[_PSSuggestion recipients](v6, "recipients");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectAtIndexedSubscript:", v44);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "handle");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addObject:", v50);

          }
          ++v44;
          -[_PSSuggestion recipients](v6, "recipients");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "count");

        }
        while (v52 > v44);
      }
      v53 = objc_msgSend(v41, "count");
      if (v53 == objc_msgSend(v29, "count"))
        v54 = objc_msgSend(v29, "isEqualToSet:", v41);
      else
        v54 = 0;

    }
  }
  else
  {
    v54 = 0;
  }

  return v54;
}

- (BOOL)isReturnToSender
{
  void *v3;
  void *v4;
  char v5;

  +[_PSConstants returnToSenderReason](_PSConstants, "returnToSenderReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestion reason](self, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (INImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (int64_t)suggestionType
{
  return self->_suggestionType;
}

- (void)setSuggestionType:(int64_t)a3
{
  self->_suggestionType = a3;
}

- (NSString)derivedIntentIdentifier
{
  return self->_derivedIntentIdentifier;
}

- (NSString)messagesGroupIdentifier
{
  return self->_messagesGroupIdentifier;
}

- (void)setMessagesGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)score
{
  return self->_score;
}

- (BOOL)familySuggestion
{
  return self->_familySuggestion;
}

- (BOOL)isAdaptedModelCreated
{
  return self->_isAdaptedModelCreated;
}

- (void)setIsAdaptedModelCreated:(BOOL)a3
{
  self->_isAdaptedModelCreated = a3;
}

- (BOOL)isAdaptedModelUsed
{
  return self->_isAdaptedModelUsed;
}

- (void)setIsAdaptedModelUsed:(BOOL)a3
{
  self->_isAdaptedModelUsed = a3;
}

- (NSString)adaptedModelRecipeID
{
  return self->_adaptedModelRecipeID;
}

- (void)setAdaptedModelRecipeID:(id)a3
{
  objc_storeStrong((id *)&self->_adaptedModelRecipeID, a3);
}

- (NSString)supportedBundleIDs
{
  return self->_supportedBundleIDs;
}

- (void)setSupportedBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_supportedBundleIDs, a3);
}

- (NSString)utiList
{
  return self->_utiList;
}

- (void)setUtiList:(id)a3
{
  objc_storeStrong((id *)&self->_utiList, a3);
}

- (NSDictionary)modelSuggestionProxies
{
  return self->_modelSuggestionProxies;
}

- (void)setModelSuggestionProxies:(id)a3
{
  objc_storeStrong((id *)&self->_modelSuggestionProxies, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)reasonType
{
  return self->_reasonType;
}

- (void)setReasonType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)trialID
{
  return self->_trialID;
}

- (void)setTrialID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialID, 0);
  objc_storeStrong((id *)&self->_reasonType, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_modelSuggestionProxies, 0);
  objc_storeStrong((id *)&self->_utiList, 0);
  objc_storeStrong((id *)&self->_supportedBundleIDs, 0);
  objc_storeStrong((id *)&self->_adaptedModelRecipeID, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_messagesGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_derivedIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
}

+ (void)suggestionForBundleID:derivedIntentIdentifier:knowledgeStore:contactResolver:reason:reasonType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error retrieving intent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
