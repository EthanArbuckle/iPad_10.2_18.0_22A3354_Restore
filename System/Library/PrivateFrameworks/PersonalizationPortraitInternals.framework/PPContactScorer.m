@implementation PPContactScorer

+ (id)mostRelevantContactsWithStore:(id)a3
{
  return (id)objc_msgSend(a1, "mostRelevantContactsWithStore:shouldContinueBlock:", a3, &__block_literal_global_16075);
}

+ (id)mostRelevantContactsWithStore:(id)a3 shouldContinueBlock:(id)a4
{
  id v6;
  uint64_t (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = (uint64_t (**)(_QWORD))a4;
  pp_contacts_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_contacts_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PPContactScorer.mostRelevantContacts", ", buf, 2u);
  }

  if ((v7[2](v7) & 1) != 0)
  {
    +[PPPeopleSuggester sharedInstance](PPPeopleSuggester, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rankedContactIdentifiers");
    v13 = objc_claimAutoreleasedReturnValue();

    if ((v7[2](v7) & 1) != 0)
    {
      +[PPContactScorer _contactRankMapWithRankedIdentifiers:]((uint64_t)a1, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      +[PPContactScorer _contactsWithIdentifiers:store:]((uint64_t)a1, v13, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7[2](v7) & 1) != 0)
      {
        +[PPContactScorer _scoreAndSortContacts:rankMap:]((uint64_t)a1, v15, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        pp_contacts_signpost_handle();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          *(_WORD *)v20 = 0;
          _os_signpost_emit_with_name_impl(&dword_1C392E000, v18, OS_SIGNPOST_INTERVAL_END, v9, "PPContactScorer.mostRelevantContacts", ", v20, 2u);
        }
      }
      else
      {
        pp_contacts_log_handle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "mostRelevantContactsWithStore stopping due to shouldContinueBlock", v21, 2u);
        }
        v16 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      pp_contacts_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "mostRelevantContactsWithStore stopping due to shouldContinueBlock", v22, 2u);
      }
      v16 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    pp_contacts_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "mostRelevantContactsWithStore stopping due to shouldContinueBlock", v23, 2u);
    }
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

+ (id)mostRelevantContactsWithName:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t v21[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  pp_contacts_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_contacts_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PPContactScorer.mostRelevantContactsWithName", ", buf, 2u);
  }

  +[PPPeopleSuggester sharedInstance](PPPeopleSuggester, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rankedContactIdentifiersMatchingName:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "rankedContactIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPContactScorer _contactRankMapWithRankedIdentifiers:]((uint64_t)a1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPContactScorer _contactsWithIdentifiers:store:]((uint64_t)a1, v13, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPContactScorer _scoreAndSortContacts:rankMap:]((uint64_t)a1, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  pp_contacts_signpost_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v19, OS_SIGNPOST_INTERVAL_END, v9, "PPContactScorer.mostRelevantContactsWithName", ", v21, 2u);
  }

  return v17;
}

+ (id)scoredContactsWithContacts:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[16];

  v4 = a3;
  pp_contacts_signpost_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  pp_contacts_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PPContactScorer.scoredContactsWithContacts", ", buf, 2u);
  }

  +[PPPeopleSuggester sharedInstance](PPPeopleSuggester, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rankedContactIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPContactScorer _contactRankMapWithRankedIdentifiers:]((uint64_t)a1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPContactScorer _scoreAndSortContacts:rankMap:]((uint64_t)a1, v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  pp_contacts_signpost_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v14, OS_SIGNPOST_INTERVAL_END, v6, "PPContactScorer.scoredContactsWithContacts", ", v16, 2u);
  }

  return v12;
}

+ (void)scoreContactNameRecords:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t spid;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[16];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pp_contacts_signpost_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  pp_contacts_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PPContactScorer.scoreContactNameRecords", ", buf, 2u);
  }
  spid = v6;

  +[PPPeopleSuggester sharedInstance](PPPeopleSuggester, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rankedContactIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPContactScorer _contactRankMapWithRankedIdentifiers:]((uint64_t)a1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "source", spid);
        +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v18 == 1)
          objc_msgSend(v19, "recordSourceContactsInitialScore");
        else
          objc_msgSend(v19, "recordSourceNonContactsInitialScore");
        v22 = v21;

        objc_msgSend(v17, "sourceIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setScore:", +[PPContactScorer _scoreWithInitialScore:identifier:rankMap:](v22, (uint64_t)a1, v23, v11));

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v14);
  }

  objc_msgSend(v12, "sortUsingComparator:", &__block_literal_global_3);
  pp_contacts_signpost_handle();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v25, OS_SIGNPOST_INTERVAL_END, spid, "PPContactScorer.scoreContactNameRecords", ", buf, 2u);
  }

}

+ (id)_contactRankMapWithRankedIdentifiers:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PPContactScorer__contactRankMapWithRankedIdentifiers___block_invoke;
  v6[3] = &unk_1E7E1C258;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

+ (double)_scoreWithInitialScore:(void *)a3 identifier:(void *)a4 rankMap:
{
  id v6;
  id v7;
  void *v8;
  double v9;

  v6 = a4;
  v7 = a3;
  objc_opt_self();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (double)(unint64_t)objc_msgSend(v8, "unsignedIntegerValue");
    a1 = a1 + (1.0 - v9 / (double)(unint64_t)objc_msgSend(v6, "count")) * (1.0 - a1);
  }

  return a1;
}

uint64_t __43__PPContactScorer_scoreContactNameRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)MEMORY[0x1E0D70D00];
  v5 = a3;
  objc_msgSend(a2, "score");
  v7 = v6;
  objc_msgSend(v5, "score");
  v9 = v8;

  return objc_msgSend(v4, "reverseCompareDouble:withDouble:", v7, v9);
}

void __56__PPContactScorer__contactRankMapWithRankedIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

+ (id)_scoreAndSortContacts:(void *)a3 rankMap:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id obj;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *context;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v28 = a3;
  v5 = objc_opt_self();
  if (objc_msgSend(v4, "count"))
  {
    v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v26 = v4;
    obj = v4;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v32)
    {
      v30 = *(_QWORD *)v37;
      v31 = v5;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v37 != v30)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v6);
          v8 = MEMORY[0x1C3BD6630]();
          v9 = objc_msgSend(v7, "source");
          +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v9 == 1)
            objc_msgSend(v10, "recordSourceContactsInitialScore");
          else
            objc_msgSend(v10, "recordSourceNonContactsInitialScore");
          v13 = v12;

          v14 = v13;
          objc_msgSend(v7, "contactsContactIdentifierWithError:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v15;
          context = (void *)v8;
          if (v15)
            v14 = +[PPContactScorer _scoreWithInitialScore:identifier:rankMap:](v14, v5, v15, v28);
          v16 = (void *)MEMORY[0x1E0D70C28];
          objc_msgSend(v7, "phoneNumbers", v26);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPContactScorer _scoredLabeledValues:](v5, v33);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "emailAddresses");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPContactScorer _scoredLabeledValues:](v5, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "socialProfiles");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPContactScorer _scoredLabeledValues:](v5, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "postalAddresses");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPContactScorer _scoredLabeledValues:](v5, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "scoredContactWithContact:scoredPhoneNumbers:scoredEmailAddresses:scoredSocialProfiles:scoredPostalAddresses:score:flags:", v7, v17, v19, v21, v23, 0, v14);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
            objc_msgSend(v29, "addObject:", v24);

          objc_autoreleasePoolPop(context);
          ++v6;
          v5 = v31;
        }
        while (v32 != v6);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v32);
    }

    objc_msgSend(v29, "sortUsingSelector:", sel_reverseCompare_);
    v4 = v26;
  }
  else
  {
    v29 = (id)MEMORY[0x1E0C9AA60];
  }

  return v29;
}

+ (id)_scoredLabeledValues:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  PPContactLabelScoringMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v2;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v9, "label");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "doubleValue");
          v14 = (v13 + 1.0) * 0.5;
        }
        else
        {
          v14 = 0.5;
        }
        objc_msgSend(MEMORY[0x1E0D70C40], "scoredLabeledValueWithLabeledValue:score:flags:", v9, 0, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v4, "addObject:", v15);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "sortUsingSelector:", sel_reverseCompare_);
  return v4;
}

+ (id)_contactsWithIdentifiers:(void *)a3 store:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setMatchingIdentifiers:", v5);

  v11 = 0;
  objc_msgSend(v4, "contactsWithQuery:error:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (!v7)
  {
    pp_contacts_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPContactScorer: failed to resolve ranked identifiers to contacts: %@", buf, 0xCu);
    }

  }
  return v7;
}

uint64_t __49__PPContactScorer_mostRelevantContactsWithStore___block_invoke()
{
  return 1;
}

@end
