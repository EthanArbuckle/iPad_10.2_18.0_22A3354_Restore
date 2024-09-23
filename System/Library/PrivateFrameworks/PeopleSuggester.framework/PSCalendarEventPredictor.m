@implementation PSCalendarEventPredictor

uint64_t __78___PSCalendarEventPredictor_eventComparatorWithPredictionContext_contactsMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _BOOL4 v31;
  _BOOL4 v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _QWORD v54[2];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "seedRecipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {

LABEL_24:
    v31 = +[_PSCalendarEventPredictor hasFaceTimeSignalInEvent:](_PSCalendarEventPredictor, "hasFaceTimeSignalInEvent:", v5);
    v32 = +[_PSCalendarEventPredictor hasFaceTimeSignalInEvent:](_PSCalendarEventPredictor, "hasFaceTimeSignalInEvent:", v6);
    if (!v31 || v32)
    {
      if (v31 || !v32)
      {
        objc_msgSend(v5, "startDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "timeIntervalSinceNow");
        v35 = fabs(v34);

        objc_msgSend(v6, "startDate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "timeIntervalSinceNow");
        v38 = fabs(v37);

        if (v35 < v38)
          v30 = -1;
        else
          v30 = v35 > v38;
      }
      else
      {
        v30 = 1;
      }
    }
    else
    {
      v30 = -1;
    }
    goto LABEL_32;
  }
  v8 = _os_feature_enabled_impl();

  if (!v8)
    goto LABEL_24;
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "seedRecipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v40 = v6;
  v41 = v5;
  v54[0] = v5;
  v54[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v50;
    v42 = *(_QWORD *)v50;
    do
    {
      v15 = 0;
      v43 = v13;
      do
      {
        if (*(_QWORD *)v50 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v15);
        objc_msgSend(v16, "eventIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          objc_msgSend(v16, "attendees");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          if (v20)
          {
            v21 = v20;
            LODWORD(v22) = 0;
            v23 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v46 != v23)
                  objc_enumerationMutation(v19);
                v22 = v22
                    + +[_PSCalendarEventPredictor isCorecipientParticipant:seedRecipients:contactsMap:](_PSCalendarEventPredictor, "isCorecipientParticipant:seedRecipients:contactsMap:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i), v11, *(_QWORD *)(a1 + 48));
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
            }
            while (v21);
          }
          else
          {
            v22 = 0;
          }

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v25, v17);

          v14 = v42;
          v13 = v43;
        }

        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v13);
  }

  v5 = v41;
  objc_msgSend(v41, "eventIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v40;
  objc_msgSend(v40, "eventIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "compare:", v29);

  if (!v30)
    goto LABEL_24;
LABEL_32:

  return v30;
}

uint64_t __66___PSCalendarEventPredictor_participantComparatorWithContactsMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
    goto LABEL_10;
  if (!v7 && v8)
    goto LABEL_7;
  v11 = objc_msgSend(v5, "participantStatus");
  v12 = objc_msgSend(v6, "participantStatus");
  if (v11 == 3 && v12 != 3)
    goto LABEL_10;
  if (v11 != 3 && v12 == 3)
  {
LABEL_7:
    v10 = 1;
    goto LABEL_11;
  }
  if (v11 == 2 && v12 != 2)
  {
LABEL_10:
    v10 = -1;
    goto LABEL_11;
  }
  v10 = v11 != 2 && v12 == 2;
LABEL_11:

  return v10;
}

void __111___PSCalendarEventPredictor_zkwSuggestionsFromCalendarWithPredictionContext_startDate_endDate_maxParticipants___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (+[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:](_PSCalendarEventPredictor, "isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:"))
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }

}

@end
