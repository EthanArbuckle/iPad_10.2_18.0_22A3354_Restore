@implementation PXFeedbackCollector

- (PXFeedbackCollector)init
{
  PXFeedbackCollector *v2;
  uint64_t v3;
  PXFeedbackStore *feedbackStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXFeedbackCollector;
  v2 = -[PXFeedbackCollector init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    feedbackStore = v2->_feedbackStore;
    v2->_feedbackStore = (PXFeedbackStore *)v3;

  }
  return v2;
}

- (id)feedbackEntryFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "objectForKey:", kPXFeedbackUserLikedCollectionKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_4:
    v8 = 1;
    goto LABEL_5;
  }
  objc_msgSend(v4, "objectForKey:", kPXFeedbackUserLikedMemoriesKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
  objc_msgSend(v4, "objectForKey:", kPXFeedbackUserDislikedCollectionKey);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

LABEL_15:
    v8 = 2;
    goto LABEL_5;
  }
  objc_msgSend(v4, "objectForKey:", kPXFeedbackUserDislikedMemoriesKey);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    goto LABEL_15;
  v8 = 3;
LABEL_5:
  objc_msgSend(v4, "objectForKey:", kPXFeedbackEntrySystemIDKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[PXFeedbackCollector _uniqueSystemIdentifier](self, "_uniqueSystemIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setSystemID:", v9);
  objc_msgSend(v4, "objectForKey:", kPXFeedbackEntryTimestampKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setTimestamp:", v10);
  objc_msgSend(v4, "objectForKey:", kPXFeedbackEntryAppVersionKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[PXFeedbackCollector _appVersion](self, "_appVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setAppVersion:", v11);
  objc_msgSend(v5, "setAlreadyCollected:", 0);
  objc_msgSend(v5, "setGeneralFeedback:", v8);
  objc_msgSend(v5, "feedbackItemsDict");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addEntriesFromDictionary:", v4);

  return v5;
}

- (void)addFeedbackEntry:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[PXFeedbackCollector feedbackStore](self, "feedbackStore");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addFeedbackEntry:", v4);

  }
}

- (id)addFeedbackFromDictionary:(id)a3
{
  void *v4;
  void *v5;

  -[PXFeedbackCollector feedbackEntryFromDictionary:](self, "feedbackEntryFromDictionary:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXFeedbackCollector feedbackStore](self, "feedbackStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addFeedbackEntry:", v4);

  }
  return v4;
}

- (void)removeFeedbackEntry:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[PXFeedbackCollector feedbackStore](self, "feedbackStore");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFeedbackEntry:", v4);

  }
}

- (id)_uniqueSystemIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifierForVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_appVersion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("CFBundleShortVersionString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PXFeedbackStore)feedbackStore
{
  return self->_feedbackStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackStore, 0);
}

@end
