@implementation PPSocialHighlightFractionalEngagementProvider

- (PPSocialHighlightFractionalEngagementProvider)initWithFeedbackGroupByBlock:(id)a3 highlightKeyBlock:(id)a4 highlights:(id)a5
{
  id v8;
  id v9;
  id v10;
  PPSocialHighlightFractionalEngagementProvider *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *engagementsByKey;
  id v20;
  void *v21;
  uint64_t v22;
  NSMutableDictionary *offeredByKey;
  uint64_t v24;
  id groupByBlock;
  uint64_t v26;
  id keyBlock;
  id v29;
  _QWORD v30[4];
  id v31;
  objc_super v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)PPSocialHighlightFractionalEngagementProvider;
  v11 = -[PPSocialHighlightFractionalEngagementProvider init](&v32, sel_init);
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0C99E60]);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __107__PPSocialHighlightFractionalEngagementProvider_initWithFeedbackGroupByBlock_highlightKeyBlock_highlights___block_invoke;
    v30[3] = &unk_1E7E1A550;
    v29 = v9;
    v31 = v29;
    objc_msgSend(v10, "_pas_mappedArrayWithTransform:", v30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99D20], "_pas_proxyArrayWithObject:repetitions:", &unk_1E7E598E8, objc_msgSend(v15, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithObjects:forKeys:", v17, v15);
    engagementsByKey = v11->_engagementsByKey;
    v11->_engagementsByKey = (NSMutableDictionary *)v18;

    v20 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99D20], "_pas_proxyArrayWithObject:repetitions:", &unk_1E7E598E8, objc_msgSend(v15, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithObjects:forKeys:", v21, v15);
    offeredByKey = v11->_offeredByKey;
    v11->_offeredByKey = (NSMutableDictionary *)v22;

    v24 = objc_msgSend(v8, "copy");
    groupByBlock = v11->_groupByBlock;
    v11->_groupByBlock = (id)v24;

    v26 = objc_msgSend(v29, "copy");
    keyBlock = v11->_keyBlock;
    v11->_keyBlock = (id)v26;

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keyBlock, 0);
  objc_storeStrong(&self->_groupByBlock, 0);
  objc_storeStrong((id *)&self->_offeredByKey, 0);
  objc_storeStrong((id *)&self->_engagementsByKey, 0);
}

- (id)valueForHighlight:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  BOOL v11;

  (*((void (**)(void))self->_keyBlock + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_engagementsByKey, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  -[NSMutableDictionary objectForKeyedSubscript:](self->_offeredByKey, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v6 | v8)
  {
    if (v6)
      v11 = v8 == 0;
    else
      v11 = 0;
    if (v11)
    {
      v9 = &unk_1E7E59900;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v6 / (double)v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
LABEL_3:
    v9 = &unk_1E7E5C0C8;
  }

  return v9;
}

- (id)applyFeedback:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSMutableDictionary **p_engagementsByKey;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;

  v5 = a3;
  objc_msgSend(v5, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSocialHighlightFeatureProviders.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("feedback.eventBody != nil"));

  }
  objc_msgSend(v5, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highlight");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || objc_msgSend(v7, "feedbackType") != 1 && objc_msgSend(v7, "feedbackType"))
    goto LABEL_14;
  objc_msgSend(v7, "highlight");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "isPrimary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(MEMORY[0x1E0C9AAA0], "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    (*((void (**)(void))self->_groupByBlock + 2))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_14;
    p_engagementsByKey = &self->_engagementsByKey;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_engagementsByKey, "objectForKeyedSubscript:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_14;
    v14 = (void *)v13;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_offeredByKey, "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_14;
    if (objc_msgSend(v7, "feedbackType") != 1)
    {
      if (objc_msgSend(v7, "feedbackType"))
      {
LABEL_14:

        goto LABEL_15;
      }
      p_engagementsByKey = &self->_offeredByKey;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](*p_engagementsByKey, "objectForKeyedSubscript:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 + 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](*p_engagementsByKey, "setObject:forKeyedSubscript:", v18, v8);

    goto LABEL_14;
  }
LABEL_15:

  return self;
}

uint64_t __107__PPSocialHighlightFractionalEngagementProvider_initWithFeedbackGroupByBlock_highlightKeyBlock_highlights___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
