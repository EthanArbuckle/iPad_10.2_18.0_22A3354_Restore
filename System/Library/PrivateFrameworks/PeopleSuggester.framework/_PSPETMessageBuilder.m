@implementation _PSPETMessageBuilder

- (_PSPETMessageBuilder)initWithInteractionsStatistics:(id)a3 andConfig:(id)a4 andContext:(id)a5 andDeviceIdentifier:(id)a6 andTrialIdentifier:(id)a7 andDefaults:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _PSPETMessageBuilder *v19;
  _PSPETMessageBuilder *v20;
  uint64_t v21;
  PeopleSuggesterShareEvent *shareEvent;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  PeopleSuggesterShareEvent *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  _PSPETMessageBuilder *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  PeopleSuggesterShareEvent *v56;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  _PSPETMessageBuilder *v69;
  objc_super v70;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v70.receiver = self;
  v70.super_class = (Class)_PSPETMessageBuilder;
  v19 = -[_PSPETMessageBuilder init](&v70, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_interactionsStatistics, a3);
    v21 = objc_opt_new();
    shareEvent = v20->_shareEvent;
    v20->_shareEvent = (PeopleSuggesterShareEvent *)v21;

    v63 = v16;
    -[PeopleSuggesterShareEvent setDeviceIdentifier:](v20->_shareEvent, "setDeviceIdentifier:", v16);
    objc_msgSend(v15, "sessionID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PeopleSuggesterShareEvent setSessionId:](v20->_shareEvent, "setSessionId:", v23);

    v62 = v17;
    -[PeopleSuggesterShareEvent setTrialIdentifier:](v20->_shareEvent, "setTrialIdentifier:", v17);
    -[PeopleSuggesterShareEvent setVersion:](v20->_shareEvent, "setVersion:", 4);
    -[PeopleSuggesterShareEvent setIsFallbackFetch:](v20->_shareEvent, "setIsFallbackFetch:", objc_msgSend(v15, "isFallbackFetch"));
    -[PeopleSuggesterShareEvent setIsSharePlayAvailable:](v20->_shareEvent, "setIsSharePlayAvailable:", objc_msgSend(v15, "isSharePlayAvailable"));
    objc_msgSend(v15, "bundleID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSConstants mobilePhotosBundleId](_PSConstants, "mobilePhotosBundleId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqualToString:", v25);

    if (v26)
    {
      v27 = v20->_shareEvent;
      v28 = 1;
    }
    else
    {
      objc_msgSend(v15, "bundleID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSConstants mobileScreenshotsBundleId](_PSConstants, "mobileScreenshotsBundleId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqualToString:", v30);

      if (v31)
      {
        v27 = v20->_shareEvent;
        v28 = 2;
      }
      else
      {
        objc_msgSend(v15, "bundleID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSConstants mobileCameraBundleId](_PSConstants, "mobileCameraBundleId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqualToString:", v33);

        if (v34)
        {
          v27 = v20->_shareEvent;
          v28 = 3;
        }
        else
        {
          objc_msgSend(v15, "bundleID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[_PSConstants mobileSafariBundleId](_PSConstants, "mobileSafariBundleId");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v35, "isEqualToString:", v36);

          v27 = v20->_shareEvent;
          if (v37)
            v28 = 4;
          else
            v28 = 0;
        }
      }
    }
    -[PeopleSuggesterShareEvent setAppSharedFrom:](v27, "setAppSharedFrom:", v28);
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    {
      objc_msgSend(v18, "stringForKey:", CFSTR("_PSPeopleSuggesterRewritePETMessageKey"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PeopleSuggesterShareEvent setTestKey:](v20->_shareEvent, "setTestKey:", v38);

    }
    v61 = v18;
    v39 = (void *)objc_opt_new();
    v40 = (void *)objc_opt_new();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v40, &unk_1E442B4B0);

    v41 = (void *)objc_opt_new();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v41, &unk_1E442B4C8);

    v42 = (void *)objc_opt_new();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v42, &unk_1E442B4E0);

    v43 = (void *)objc_opt_new();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v43, &unk_1E442B4F8);

    v44 = (void *)objc_opt_new();
    objc_msgSend(v14, "conversationIds");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = 3221225472;
    v65[2] = __127___PSPETMessageBuilder_initWithInteractionsStatistics_andConfig_andContext_andDeviceIdentifier_andTrialIdentifier_andDefaults___block_invoke;
    v65[3] = &unk_1E44018A8;
    v64 = v14;
    v65[0] = MEMORY[0x1E0C809B0];
    v66 = v14;
    v46 = v44;
    v67 = v46;
    v47 = v39;
    v68 = v47;
    v48 = v20;
    v69 = v48;
    objc_msgSend(v45, "enumerateObjectsUsingBlock:", v65);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v50, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKeyedSubscript:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v52, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKeyedSubscript:", v59);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v58, "count");

        if (!v60)
        {
          v55 = (void *)objc_opt_new();
          objc_msgSend(v55, "setFeedbackType:", objc_msgSend(v15, "feedBack"));
          v56 = v20->_shareEvent;
          goto LABEL_18;
        }
LABEL_17:
        objc_msgSend(v47, "objectForKeyedSubscript:", &unk_1E442B4C8);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSPETMessageBuilder addFeedbackEvents:](v48, "addFeedbackEvents:", v53);

        objc_msgSend(v47, "objectForKeyedSubscript:", &unk_1E442B4E0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSPETMessageBuilder addFeedbackEvents:](v48, "addFeedbackEvents:", v54);

        objc_msgSend(v47, "objectForKeyedSubscript:", &unk_1E442B4F8);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (PeopleSuggesterShareEvent *)v48;
LABEL_18:
        -[PeopleSuggesterShareEvent addFeedbackEvents:](v56, "addFeedbackEvents:", v55);
        v16 = v63;
        v14 = v64;
        v17 = v62;

        v18 = v61;
        goto LABEL_19;
      }

    }
    goto LABEL_17;
  }
LABEL_19:

  return v20;
}

- (void)addFeedbackEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[PeopleSuggesterShareEvent addFeedbackEvents:](self->_shareEvent, "addFeedbackEvents:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)privacyMitigatedFeatureValueFromName:(id)a3 forConversationId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  -[_CDInteractionsStatistics valueOrDefaultValueForFeature:forConversationId:](self->_interactionsStatistics, "valueOrDefaultValueForFeature:forConversationId:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  v12 = v6;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("timeSinceOutgoingInteractionNumber10")) & 1) != 0
    || (objc_msgSend(v12, "isEqualToString:", CFSTR("timeSinceLastIncomingInteraction")) & 1) != 0
    || objc_msgSend(v12, "isEqualToString:", CFSTR("timeSinceLastOutgoingInteraction")))
  {
    v11 = round(v11);
  }

  objc_msgSend(v8, "setValue:", v11);
  objc_msgSend(v8, "setDefaultValue:", -[_CDInteractionsStatistics isUsingDefaultValue:forConversationId:](self->_interactionsStatistics, "isUsingDefaultValue:forConversationId:", v12, v7));

  return v8;
}

- (id)getPETMessage
{
  return self->_shareEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionsStatistics, 0);
  objc_storeStrong((id *)&self->_shareEvent, 0);
}

@end
