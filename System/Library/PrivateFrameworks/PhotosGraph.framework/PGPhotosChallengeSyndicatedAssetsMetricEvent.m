@implementation PGPhotosChallengeSyndicatedAssetsMetricEvent

- (NSArray)payloads
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  NSObject *v19;
  void *v21;
  id obj;
  uint64_t v23;
  id v24;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  objc_super v31;
  _BYTE v32[128];
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v31.receiver = self;
    v31.super_class = (Class)PGPhotosChallengeSyndicatedAssetsMetricEvent;
    -[PGPhotosChallengeMetricEvent payload](&v31, sel_payload);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v36[0] = obj;
    v17 = (id *)v36;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = objc_opt_class();
      _os_log_error_impl(&dword_1CA237000, v19, OS_LOG_TYPE_ERROR, "PGPhotosChallengeSyndicatedAssetsMetricEvent: evaluation object is the wrong type (%@)", buf, 0xCu);

    }
    v30.receiver = self;
    v30.super_class = (Class)PGPhotosChallengeSyndicatedAssetsMetricEvent;
    -[PGPhotosChallengeMetricEvent payload](&v30, sel_payload);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = obj;
    v17 = &v33;
    goto LABEL_15;
  }
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v3, "evaluationByReason");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v4)
  {
    v5 = v4;
    v23 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v3, "evaluationByReason");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v7);
        v9 = v3;
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v25.receiver = self;
        v25.super_class = (Class)PGPhotosChallengeSyndicatedAssetsMetricEvent;
        -[PGPhotosChallengeMetricEvent payload](&v25, sel_payload);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

        objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("questionInfo"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "falseNegatives"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("falseNegativeCount"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "falsePositives"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("falsePositiveCount"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "trueNegatives"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("trueNegativeCount"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "truePositives"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("truePositiveCount"));

        objc_msgSend(v24, "addObject:", v12);
        v3 = v9;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v5);
  }
LABEL_16:

  return (NSArray *)v24;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPhotosChallengeMetricEvent identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPhotosChallengeSyndicatedAssetsMetricEvent payloads](self, "payloads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@:\nIdentifier:%@\nPayloads:%@"), v4, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

@end
