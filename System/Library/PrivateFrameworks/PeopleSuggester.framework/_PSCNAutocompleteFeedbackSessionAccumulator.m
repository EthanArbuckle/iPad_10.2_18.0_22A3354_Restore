@implementation _PSCNAutocompleteFeedbackSessionAccumulator

+ (id)parseSubmodel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  objc_msgSend(v3, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithString:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("Unknown");
  }

  return v7;
}

- (_PSCNAutocompleteFeedbackSessionAccumulator)init
{
  _PSCNAutocompleteFeedbackSessionAccumulator *v2;
  uint64_t v3;
  NSMutableArray *vendedSuggestionEvents;
  uint64_t v5;
  NSMutableArray *metricsForImpressions;
  uint64_t v7;
  NSMutableArray *metricsForSubmodelImpressions;
  uint64_t v9;
  _PSCNAutocompleteFeedbackActionStatistics *metricsForAction;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_PSCNAutocompleteFeedbackSessionAccumulator;
  v2 = -[_PSCNAutocompleteFeedbackSessionAccumulator init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    vendedSuggestionEvents = v2->_vendedSuggestionEvents;
    v2->_vendedSuggestionEvents = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    metricsForImpressions = v2->_metricsForImpressions;
    v2->_metricsForImpressions = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    metricsForSubmodelImpressions = v2->_metricsForSubmodelImpressions;
    v2->_metricsForSubmodelImpressions = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    metricsForAction = v2->_metricsForAction;
    v2->_metricsForAction = (_PSCNAutocompleteFeedbackActionStatistics *)v9;

  }
  return v2;
}

- (void)updateWithInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  _CDInteraction *interaction;
  _CDInteraction *v53;
  id obj;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _PSCNAutocompleteFeedbackSessionAccumulator *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "sender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v53 = (_CDInteraction *)v4;
  objc_msgSend(v4, "recipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v68 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v17);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    }
    while (v12);
  }

  if (-[NSMutableArray count](self->_vendedSuggestionEvents, "count"))
  {
    v18 = 0;
    v58 = self;
    do
    {
      v55 = v18;
      -[NSMutableArray objectAtIndexedSubscript:](self->_vendedSuggestionEvents, "objectAtIndexedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "vendedSuggestions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "suggestions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      obj = v21;
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      if (v57)
      {
        v56 = *(_QWORD *)v64;
        v22 = 1;
        do
        {
          for (j = 0; j != v57; ++j)
          {
            if (*(_QWORD *)v64 != v56)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
            objc_msgSend((id)objc_opt_class(), "parseSubmodel:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            v62 = 0u;
            objc_msgSend(v24, "recipients");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v60;
              while (2)
              {
                for (k = 0; k != v28; ++k)
                {
                  if (*(_QWORD *)v60 != v29)
                    objc_enumerationMutation(v26);
                  objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * k), "handle");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v5, "containsObject:", v31);

                  if (v32)
                  {
                    -[NSMutableArray objectAtIndexedSubscript:](v58->_metricsForImpressions, "objectAtIndexedSubscript:", v55);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "setCountUsed:", objc_msgSend(v33, "countUsed") + 1);

                    -[NSMutableArray objectAtIndexedSubscript:](v58->_metricsForImpressions, "objectAtIndexedSubscript:", v55);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "setTotalRankUsed:", objc_msgSend(v34, "totalRankUsed") + v22);

                    -[NSMutableArray objectAtIndexedSubscript:](v58->_metricsForImpressions, "objectAtIndexedSubscript:", v55);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "setHighestRankUsed:", v22);

                    -[NSMutableArray objectAtIndexedSubscript:](v58->_metricsForImpressions, "objectAtIndexedSubscript:", v55);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    v37 = objc_msgSend(v36, "lowestRankUsed");
                    if (v37)
                      v38 = v37;
                    else
                      v38 = v22;
                    -[NSMutableArray objectAtIndexedSubscript:](v58->_metricsForImpressions, "objectAtIndexedSubscript:", v55);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "setLowestRankUsed:", v38);

                    -[NSMutableArray objectAtIndexedSubscript:](v58->_metricsForSubmodelImpressions, "objectAtIndexedSubscript:", v55);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "objectForKeyedSubscript:", v25);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "setCountUsed:", objc_msgSend(v41, "countUsed") + 1);

                    -[NSMutableArray objectAtIndexedSubscript:](v58->_metricsForSubmodelImpressions, "objectAtIndexedSubscript:", v55);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "objectForKeyedSubscript:", v25);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "setTotalRankUsed:", objc_msgSend(v43, "totalRankUsed") + v22);

                    -[NSMutableArray objectAtIndexedSubscript:](v58->_metricsForSubmodelImpressions, "objectAtIndexedSubscript:", v55);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "objectForKeyedSubscript:", v25);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "setHighestRankUsed:", v22);

                    -[NSMutableArray objectAtIndexedSubscript:](v58->_metricsForSubmodelImpressions, "objectAtIndexedSubscript:", v55);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "objectForKeyedSubscript:", v25);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    v48 = objc_msgSend(v47, "lowestRankUsed");
                    if (v48)
                      v49 = v48;
                    else
                      v49 = v22;
                    -[NSMutableArray objectAtIndexedSubscript:](v58->_metricsForSubmodelImpressions, "objectAtIndexedSubscript:", v55);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "objectForKeyedSubscript:", v25);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v51, "setLowestRankUsed:", v49);

                    -[_PSCNAutocompleteFeedbackActionStatistics setCountUsedSuggestions:](v58->_metricsForAction, "setCountUsedSuggestions:", -[_PSCNAutocompleteFeedbackActionStatistics countUsedSuggestions](v58->_metricsForAction, "countUsedSuggestions")+ 1);
                    goto LABEL_35;
                  }
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
                if (v28)
                  continue;
                break;
              }
            }
LABEL_35:

            ++v22;
            self = v58;
          }
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
        }
        while (v57);
      }

      v18 = v55 + 1;
    }
    while (v55 + 1 < (unint64_t)-[NSMutableArray count](self->_vendedSuggestionEvents, "count"));
  }
  interaction = self->_interaction;
  self->_interaction = v53;

}

- (void)updateWithFeedback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "feedbackType") == 3)
  {
    objc_msgSend(v9, "tappedSuggestion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSCNAutocompleteFeedbackSessionAccumulator updateWithTappedSuggestion:](self, "updateWithTappedSuggestion:", v5);

  }
  else if (objc_msgSend(v9, "feedbackType") == 2)
  {
    objc_msgSend(v9, "vendedSuggestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "suggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSCNAutocompleteFeedbackSessionAccumulator updateWithVendedSuggestions:reportTime:](self, "updateWithVendedSuggestions:reportTime:", v7, v8);

    -[NSMutableArray addObject:](self->_vendedSuggestionEvents, "addObject:", v9);
  }

}

- (void)updateWithTappedSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;

  v4 = a3;
  -[NSMutableArray lastObject](self->_vendedSuggestionEvents, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vendedSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[_PSCNAutocompleteFeedbackSessionAccumulator updateWithTappedSuggestion:].cold.1(v12);
    goto LABEL_7;
  }
  -[NSMutableArray lastObject](self->_vendedSuggestionEvents, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vendedSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v4);

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_PSCNAutocompleteFeedbackSessionAccumulator updateWithTappedSuggestion:].cold.2(v12);
LABEL_7:

    goto LABEL_15;
  }
  objc_msgSend((id)objc_opt_class(), "parseSubmodel:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray lastObject](self->_metricsForImpressions, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCountTapped:", objc_msgSend(v14, "countTapped") + 1);

  -[NSMutableArray lastObject](self->_metricsForImpressions, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTotalRankTapped:", objc_msgSend(v15, "totalRankTapped") + v11 + 1);

  -[NSMutableArray lastObject](self->_metricsForImpressions, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHighestRankTapped:", v11 + 1);

  -[NSMutableArray lastObject](self->_metricsForImpressions, "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "lowestRankTapped");
  if (v18)
    v19 = v18;
  else
    v19 = v11 + 1;
  -[NSMutableArray lastObject](self->_metricsForImpressions, "lastObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLowestRankTapped:", v19);

  -[NSMutableArray lastObject](self->_metricsForSubmodelImpressions, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCountTapped:", objc_msgSend(v22, "countTapped") + 1);

  -[NSMutableArray lastObject](self->_metricsForSubmodelImpressions, "lastObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTotalRankTapped:", objc_msgSend(v24, "totalRankTapped") + v11 + 1);

  -[NSMutableArray lastObject](self->_metricsForSubmodelImpressions, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setHighestRankTapped:", v11 + 1);

  -[NSMutableArray lastObject](self->_metricsForSubmodelImpressions, "lastObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "lowestRankTapped");
  if (v29)
    v30 = v29;
  else
    v30 = v11 + 1;
  -[NSMutableArray lastObject](self->_metricsForSubmodelImpressions, "lastObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setLowestRankTapped:", v30);

  -[_PSCNAutocompleteFeedbackActionStatistics setCountTappedSuggestions:](self->_metricsForAction, "setCountTappedSuggestions:", -[_PSCNAutocompleteFeedbackActionStatistics countTappedSuggestions](self->_metricsForAction, "countTappedSuggestions")+ 1);
LABEL_15:

}

- (void)updateWithVendedSuggestions:(id)a3 reportTime:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *metricsForImpressions;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend((id)objc_opt_class(), "parseSubmodel:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11), (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v14 = (void *)objc_opt_new();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  metricsForImpressions = self->_metricsForImpressions;
  v16 = (void *)objc_opt_new();
  -[NSMutableArray addObject:](metricsForImpressions, "addObject:", v16);

  -[NSMutableArray addObject:](self->_metricsForSubmodelImpressions, "addObject:", v6);
}

- (_CDInteraction)interaction
{
  return self->_interaction;
}

- (NSMutableArray)vendedSuggestionEvents
{
  return self->_vendedSuggestionEvents;
}

- (NSMutableArray)metricsForImpressions
{
  return self->_metricsForImpressions;
}

- (NSMutableArray)metricsForSubmodelImpressions
{
  return self->_metricsForSubmodelImpressions;
}

- (_PSCNAutocompleteFeedbackActionStatistics)metricsForAction
{
  return self->_metricsForAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsForAction, 0);
  objc_storeStrong((id *)&self->_metricsForSubmodelImpressions, 0);
  objc_storeStrong((id *)&self->_metricsForImpressions, 0);
  objc_storeStrong((id *)&self->_vendedSuggestionEvents, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
}

- (void)updateWithTappedSuggestion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A07F4000, log, OS_LOG_TYPE_DEBUG, "_PSCNAutocompleteFeedbackSessionAccumulator: Skipping processing of tapped suggestion feedback event - no prior vended suggestions event to match against.", v1, 2u);
}

- (void)updateWithTappedSuggestion:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A07F4000, log, OS_LOG_TYPE_ERROR, "_PSCNAutocompleteFeedbackSessionAccumulator: Skipping processing of tapped suggestion feedback event - tapped suggestion could not be found in list of prior vended suggestions!", v1, 2u);
}

@end
