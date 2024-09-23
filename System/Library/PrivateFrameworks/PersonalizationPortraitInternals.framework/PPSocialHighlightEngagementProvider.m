@implementation PPSocialHighlightEngagementProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestDateToAccept, 0);
  objc_storeStrong(&self->_keyBlock, 0);
  objc_storeStrong(&self->_groupByBlock, 0);
  objc_storeStrong((id *)&self->_engagementsByKey, 0);
}

- (PPSocialHighlightEngagementProvider)initWithFeedbackType:(unint64_t)a3 feedbackGroupByBlock:(id)a4 highlightKeyBlock:(id)a5 intervalSinceNow:(double)a6 highlights:(id)a7
{
  id v12;
  id v13;
  id v14;
  PPSocialHighlightEngagementProvider *v15;
  PPSocialHighlightEngagementProvider *v16;
  uint64_t v17;
  id groupByBlock;
  uint64_t v19;
  id keyBlock;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSMutableDictionary *engagementsByKey;
  uint64_t v29;
  NSDate *earliestDateToAccept;
  unint64_t feedbackType;
  BOOL v35;
  _QWORD v37[4];
  id v38;
  objc_super v39;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v39.receiver = self;
  v39.super_class = (Class)PPSocialHighlightEngagementProvider;
  v15 = -[PPSocialHighlightEngagementProvider init](&v39, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_feedbackType = a3;
    v17 = objc_msgSend(v12, "copy");
    groupByBlock = v16->_groupByBlock;
    v16->_groupByBlock = (id)v17;

    v19 = objc_msgSend(v13, "copy");
    keyBlock = v16->_keyBlock;
    v16->_keyBlock = (id)v19;

    v21 = objc_alloc(MEMORY[0x1E0C99E60]);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __127__PPSocialHighlightEngagementProvider_initWithFeedbackType_feedbackGroupByBlock_highlightKeyBlock_intervalSinceNow_highlights___block_invoke;
    v37[3] = &unk_1E7E1A550;
    v38 = v13;
    objc_msgSend(v14, "_pas_mappedArrayWithTransform:", v37);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithArray:", v22);

    v24 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99D20], "_pas_proxyArrayWithObject:repetitions:", &unk_1E7E598E8, objc_msgSend(v23, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "initWithObjects:forKeys:", v25, v26);
    engagementsByKey = v16->_engagementsByKey;
    v16->_engagementsByKey = (NSMutableDictionary *)v27;

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -a6);
    earliestDateToAccept = v16->_earliestDateToAccept;
    v16->_earliestDateToAccept = (NSDate *)v29;

    feedbackType = v16->_feedbackType;
    v35 = a3 != 9 && feedbackType != 2 && a3 != 3 && feedbackType != 4;
    v16->_acceptOnlyPrimary = v35;

  }
  return v16;
}

- (PPSocialHighlightEngagementProvider)initWithFeedbackType:(unint64_t)a3 feedbackGroupByBlock:(id)a4 highlightKeyBlock:(id)a5 highlights:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PPSocialHighlightEngagementProvider *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "timeIntervalSince1970");
  v14 = -[PPSocialHighlightEngagementProvider initWithFeedbackType:feedbackGroupByBlock:highlightKeyBlock:intervalSinceNow:highlights:](self, "initWithFeedbackType:feedbackGroupByBlock:highlightKeyBlock:intervalSinceNow:highlights:", a3, v12, v11, v10);

  return v14;
}

- (id)valueForHighlight:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  (*((void (**)(void))self->_keyBlock + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = &unk_1E7E5C0B8;
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_engagementsByKey, "objectForKeyedSubscript:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = &unk_1E7E5C0B8;
    v5 = v8;

  }
  return v5;
}

- (id)applyFeedback:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  PPSocialHighlightEngagementProvider *v20;
  void *v22;

  v5 = a3;
  objc_msgSend(v5, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSocialHighlightFeatureProviders.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("feedback.eventBody != nil"));

  }
  objc_msgSend(v5, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "feedbackType") == self->_feedbackType)
  {
    objc_msgSend(v7, "highlight");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v7, "feedbackCreationDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "compare:", self->_earliestDateToAccept);

      if (v11 == 1)
      {
        if (!self->_acceptOnlyPrimary
          || (objc_msgSend(v7, "highlight"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v12, "isPrimary"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(MEMORY[0x1E0C9AAA0], "isEqual:", v13),
              v13,
              v12,
              (v14 & 1) == 0))
        {
          (*((void (**)(void))self->_groupByBlock + 2))();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_engagementsByKey, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              -[NSMutableDictionary objectForKeyedSubscript:](self->_engagementsByKey, "objectForKeyedSubscript:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "unsignedIntegerValue");

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18 + 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_engagementsByKey, "setObject:forKeyedSubscript:", v19, v15);

            }
          }

        }
      }
    }
  }
  v20 = self;

  return v20;
}

uint64_t __127__PPSocialHighlightEngagementProvider_initWithFeedbackType_feedbackGroupByBlock_highlightKeyBlock_intervalSinceNow_highlights___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
