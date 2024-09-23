@implementation PPSocialHighlightTimeSinceEngagementProvider

- (PPSocialHighlightTimeSinceEngagementProvider)initWithFeedbackType:(unint64_t)a3 feedbackGroupByBlock:(id)a4 highlightKeyBlock:(id)a5 mostRecent:(BOOL)a6 highlights:(id)a7
{
  id v12;
  id v13;
  id v14;
  PPSocialHighlightTimeSinceEngagementProvider *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *dates;
  uint64_t v27;
  id keyBlock;
  uint64_t v29;
  id groupByBlock;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  objc_super v35;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v35.receiver = self;
  v35.super_class = (Class)PPSocialHighlightTimeSinceEngagementProvider;
  v15 = -[PPSocialHighlightTimeSinceEngagementProvider init](&v35, sel_init);
  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __130__PPSocialHighlightTimeSinceEngagementProvider_initWithFeedbackType_feedbackGroupByBlock_highlightKeyBlock_mostRecent_highlights___block_invoke;
    v33[3] = &unk_1E7E1A550;
    v17 = v13;
    v34 = v17;
    objc_msgSend(v14, "_pas_mappedArrayWithTransform:", v33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithArray:", v18);
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = a6;
    if (a6)
    {
      v21 = a3;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    }
    else
    {
      v21 = a3;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99D20], "_pas_proxyArrayWithObject:repetitions:", v22, objc_msgSend(v20, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "initWithObjects:forKeys:", v24, v20);
    dates = v15->_dates;
    v15->_dates = (NSMutableDictionary *)v25;

    v27 = objc_msgSend(v17, "copy");
    keyBlock = v15->_keyBlock;
    v15->_keyBlock = (id)v27;

    v29 = objc_msgSend(v12, "copy");
    groupByBlock = v15->_groupByBlock;
    v15->_groupByBlock = (id)v29;

    v15->_feedbackType = v21;
    v15->_mostRecent = v32;

  }
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_groupByBlock, 0);
  objc_storeStrong(&self->_keyBlock, 0);
  objc_storeStrong((id *)&self->_dates, 0);
}

- (id)valueForHighlight:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  (*((void (**)(void))self->_keyBlock + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_dates, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToDate:", v6);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
    v9 = (void *)MEMORY[0x1E0CB37E8];
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceNow");
      objc_msgSend(v9, "numberWithDouble:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v5, "timeIntervalSinceNow");
    v11 = -v10;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceNow");
  }
  objc_msgSend(v9, "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v12;
}

- (id)applyFeedback:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;

  v5 = a3;
  objc_msgSend(v5, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSocialHighlightFeatureProviders.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("feedback.eventBody != nil"));

  }
  objc_msgSend(v5, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "feedbackType") == self->_feedbackType)
  {
    (*((void (**)(void))self->_groupByBlock + 2))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_dates, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        if (self->_mostRecent)
          v10 = -1;
        else
          v10 = 1;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_dates, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "feedbackCreationDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "compare:", v12);

        if (v13 == v10)
        {
          objc_msgSend(v7, "feedbackCreationDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dates, "setObject:forKeyedSubscript:", v14, v8);

        }
      }
    }

  }
  return self;
}

uint64_t __130__PPSocialHighlightTimeSinceEngagementProvider_initWithFeedbackType_feedbackGroupByBlock_highlightKeyBlock_mostRecent_highlights___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
