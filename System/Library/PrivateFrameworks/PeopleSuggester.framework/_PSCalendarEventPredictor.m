@implementation _PSCalendarEventPredictor

- (_PSCalendarEventPredictor)init
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _PSCalendarEventPredictor *v9;
  uint64_t v11;
  uint64_t v12;
  Class (*v13)(uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v3 = (void *)getEKEventStoreClass_softClass_0;
  v19 = getEKEventStoreClass_softClass_0;
  if (!getEKEventStoreClass_softClass_0)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __getEKEventStoreClass_block_invoke_0;
    v14 = &unk_1E43FEA00;
    v15 = &v16;
    __getEKEventStoreClass_block_invoke_0((uint64_t)&v11);
    v3 = (void *)v17[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v16, 8);
  v5 = (void *)objc_opt_new();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v6 = (void *)getCNContactStoreClass_softClass_9;
  v19 = getCNContactStoreClass_softClass_9;
  if (!getCNContactStoreClass_softClass_9)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __getCNContactStoreClass_block_invoke_9;
    v14 = &unk_1E43FEA00;
    v15 = &v16;
    __getCNContactStoreClass_block_invoke_9((uint64_t)&v11);
    v6 = (void *)v17[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v16, 8);
  v8 = (void *)objc_opt_new();
  v9 = -[_PSCalendarEventPredictor initWithEventStore:contactStore:](self, "initWithEventStore:contactStore:", v5, v8);

  return v9;
}

- (_PSCalendarEventPredictor)initWithEventStore:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  _PSCalendarEventPredictor *v9;
  _PSCalendarEventPredictor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSCalendarEventPredictor;
  v9 = -[_PSCalendarEventPredictor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStore, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
  }

  return v10;
}

+ (id)_handleFromParticipant:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
    objc_msgSend(v3, "phoneNumber");
  else
    objc_msgSend(v3, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isCorecipientParticipant:(id)a3 seedRecipients:(id)a4 contactsMap:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  char v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "count") && _os_feature_enabled_impl())
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v7, "phoneNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "phoneNumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v12);

    }
    objc_msgSend(v7, "emailAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v7, "emailAddress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v14);

    }
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v17);

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v16, "emailAddresses");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v39 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "value");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v20);
      }

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = v16;
      objc_msgSend(v16, "phoneNumbers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v35 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "value");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "fullyQualifiedDigits");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
              objc_msgSend(v10, "addObject:", v30);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v26);
      }

      v16 = v33;
    }
    v31 = objc_msgSend(v10, "intersectsSet:", v8);

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (BOOL)isEligibleParticipant:(id)a3 context:(id)a4 contactsMap:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "isCurrentUser"))
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[_PSCalendarEventPredictor isEligibleParticipant:context:contactsMap:].cold.1();
  }
  else if (objc_msgSend(v7, "participantType") == 1)
  {
    objc_msgSend(v8, "seedRecipients");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") && (_os_feature_enabled_impl() & 1) != 0)
    {
      v12 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v8, "seedRecipients");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = +[_PSCalendarEventPredictor isCorecipientParticipant:seedRecipients:contactsMap:](_PSCalendarEventPredictor, "isCorecipientParticipant:seedRecipients:contactsMap:", v7, v14, v9);

      if (v15)
        goto LABEL_16;
    }
    else
    {

    }
    if (objc_msgSend(v7, "participantStatus") != 3)
    {
      v16 = 1;
      goto LABEL_17;
    }
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[_PSCalendarEventPredictor isEligibleParticipant:context:contactsMap:].cold.2();
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[_PSCalendarEventPredictor isEligibleParticipant:context:contactsMap:].cold.3();
  }

LABEL_16:
  v16 = 0;
LABEL_17:

  return v16;
}

+ (BOOL)hasFaceTimeSignalInEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsString:", CFSTR("facetime")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsString:", CFSTR("facetime")) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "notes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "containsString:", CFSTR("facetime")) & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(v3, "location");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v11, "length") == 0;

      }
    }

  }
  return v6;
}

+ (id)eventComparatorWithPredictionContext:(id)a3 contactsMap:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78___PSCalendarEventPredictor_eventComparatorWithPredictionContext_contactsMap___block_invoke;
  v13[3] = &unk_1E4401A38;
  v14 = v5;
  v15 = v7;
  v16 = v6;
  v8 = v6;
  v9 = v7;
  v10 = v5;
  v11 = (void *)MEMORY[0x1A1AFCBF8](v13);

  return v11;
}

+ (id)participantComparatorWithContactsMap:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66___PSCalendarEventPredictor_participantComparatorWithContactsMap___block_invoke;
  v7[3] = &unk_1E4401A60;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1A1AFCBF8](v7);

  return v5;
}

+ (unint64_t)_numOfOtherParticipantsInEvent:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "attendees", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
      v10 = objc_msgSend(v9, "participantType");
      if (v10 == 4)
        break;
      v11 = v10;
      LODWORD(v12) = objc_msgSend(v9, "isCurrentUser") ^ 1;
      if (v11 == 1)
        v12 = v12;
      else
        v12 = 0;
      v6 += v12;
      if (v5 == ++v8)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
  }
  v6 = 0;
LABEL_14:

  return v6;
}

+ (BOOL)currentUserIsEligibleForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "attendees", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        if ((objc_msgSend(v10, "isCurrentUser") & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v11 = v10;

      if (!v11)
        goto LABEL_16;
      if (objc_msgSend(v11, "participantType") == 1)
      {
        if (objc_msgSend(v11, "participantRole") == 3 || objc_msgSend(v11, "participantStatus") == 2)
        {
          v12 = 1;
          goto LABEL_23;
        }
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          +[_PSCalendarEventPredictor currentUserIsEligibleForEvent:].cold.2(v4);
      }
      else
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          +[_PSCalendarEventPredictor currentUserIsEligibleForEvent:].cold.3(v4);
      }
    }
    else
    {
LABEL_10:

LABEL_16:
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        +[_PSCalendarEventPredictor currentUserIsEligibleForEvent:].cold.1(v4, v13);
      v11 = 0;
    }

    v12 = 0;
LABEL_23:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)isMaybeFaceTimeEvent:(id)a3 earliestStartDate:(id)a4 latestStartDate:(id)a5 maxParticipants:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  BOOL v18;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    objc_msgSend(v9, "startDate");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v9, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "compare:", v10) == -1)
      {

      }
      else
      {
        objc_msgSend(v9, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "compare:", v11);

        if (v16 != 1)
        {
          if (objc_msgSend(v9, "isAllDay"))
          {
            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:].cold.2();
LABEL_12:
            v18 = 0;
LABEL_13:

            goto LABEL_14;
          }
          if (objc_msgSend(v9, "status") == 3)
          {
            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:].cold.3();
            goto LABEL_12;
          }
          objc_msgSend(v9, "attendees");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v20, "count") < 2)
          {

            goto LABEL_21;
          }
          v21 = +[_PSCalendarEventPredictor _numOfOtherParticipantsInEvent:](_PSCalendarEventPredictor, "_numOfOtherParticipantsInEvent:", v9);

          if (v21 > a6)
          {
LABEL_21:
            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:].cold.4();
            goto LABEL_12;
          }
          objc_msgSend(v9, "virtualConference");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:].cold.8(v9, v17);
            goto LABEL_12;
          }
          objc_msgSend(v9, "location");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lowercaseString");
          v17 = objc_claimAutoreleasedReturnValue();

          if ((-[NSObject hasPrefix:](v17, "hasPrefix:", CFSTR("http://")) & 1) != 0
            || -[NSObject hasPrefix:](v17, "hasPrefix:", CFSTR("https://")))
          {
            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:].cold.5(v9, v24);
            goto LABEL_30;
          }
          objc_msgSend(v9, "URL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "scheme");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lowercaseString");
          v24 = objc_claimAutoreleasedReturnValue();

          if ((-[NSObject hasPrefix:](v24, "hasPrefix:", CFSTR("http")) & 1) != 0
            || -[NSObject hasPrefix:](v24, "hasPrefix:", CFSTR("https")))
          {
            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:].cold.6(v9, v27);
            v18 = 0;
          }
          else
          {
            if (!+[_PSCalendarEventPredictor currentUserIsEligibleForEvent:](_PSCalendarEventPredictor, "currentUserIsEligibleForEvent:", v9))
            {
LABEL_30:
              v18 = 0;
LABEL_37:

              goto LABEL_13;
            }
            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:].cold.7();
            v18 = 1;
          }

          goto LABEL_37;
        }
      }
    }
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:].cold.1();
    goto LABEL_12;
  }
  v18 = 0;
LABEL_14:

  return v18;
}

+ (id)getZKWSuggestionForCalendarEvent:(id)a3 context:(id)a4 contactsMap:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _PSRecipient *v29;
  _PSSuggestion *v30;
  NSObject *v31;
  _PSSuggestion *v32;
  void *v34;
  void *v35;
  NSObject *obj;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v37 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v7, "attendees");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (+[_PSCalendarEventPredictor isEligibleParticipant:context:contactsMap:](_PSCalendarEventPredictor, "isEligibleParticipant:context:contactsMap:", v15, v8, v9))
        {
          objc_msgSend(v37, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v12);
  }

  v16 = v37;
  if (objc_msgSend(v37, "count"))
  {
    v34 = v8;
    v35 = v7;
    +[_PSCalendarEventPredictor participantComparatorWithContactsMap:](_PSCalendarEventPredictor, "participantComparatorWithContactsMap:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "sortedArrayUsingComparator:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v18;
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
          +[_PSCalendarEventPredictor _handleFromParticipant:](_PSCalendarEventPredictor, "_handleFromParticipant:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "firstObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:]([_PSRecipient alloc], "initWithIdentifier:handle:displayName:contact:", v25, v25, v26, v28);
          objc_msgSend(v19, "addObject:", v29);

        }
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v21);
    }

    if (objc_msgSend(v19, "count"))
    {
      v30 = [_PSSuggestion alloc];
      v8 = v34;
      objc_msgSend(v34, "bundleID");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:](v30, "initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:", v31, 0, 0, v19, CFSTR("Calendar Event Participants"), 0);
      v7 = v35;
    }
    else
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v31 = objc_claimAutoreleasedReturnValue();
      v8 = v34;
      v7 = v35;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        +[_PSCalendarEventPredictor getZKWSuggestionForCalendarEvent:context:contactsMap:].cold.2(v35, v31);
      v32 = 0;
    }
    v16 = v37;

  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      +[_PSCalendarEventPredictor getZKWSuggestionForCalendarEvent:context:contactsMap:].cold.1(v7, obj);
    v32 = 0;
  }

  return v32;
}

+ (id)createFinalSuggestions:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _PSSuggestion *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _PSSuggestion *v24;
  id v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "seedRecipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {

    goto LABEL_21;
  }
  v7 = _os_feature_enabled_impl();

  if ((v7 & 1) == 0)
  {
LABEL_21:
    v32 = v5;
    goto LABEL_22;
  }
  v8 = (void *)objc_opt_new();
  v32 = (id)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v26 = v5;
  obj = v5;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v41;
    v31 = v8;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v41 != v28)
          objc_enumerationMutation(obj);
        v30 = v9;
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v33 = v10;
        objc_msgSend(v10, "recipients", v26);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v37;
          do
          {
            v14 = 0;
            v34 = v12;
            do
            {
              if (*(_QWORD *)v37 != v13)
                objc_enumerationMutation(v35);
              v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v14);
              objc_msgSend(v15, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v8, "containsObject:", v16) & 1) == 0)
              {
                v17 = [_PSSuggestion alloc];
                objc_msgSend(v33, "bundleID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "conversationIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "groupName");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = v15;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "reason");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "reasonType");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:](v17, "initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:", v18, v19, v20, v21, v22, v23);

                v12 = v34;
                v8 = v31;

                objc_msgSend(v32, "addObject:", v24);
                objc_msgSend(v31, "addObject:", v16);

              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          }
          while (v12);
        }

        v9 = v30 + 1;
      }
      while (v30 + 1 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v29);
  }

  v5 = v26;
LABEL_22:

  return v32;
}

- (id)getParticipantContactsMapFromEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  CNContactStore *contactStore;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  void *v18;
  id v19;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = (id)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v4;
  objc_msgSend(v4, "attendees");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        contactStore = self->_contactStore;
        objc_msgSend(v9, "contactPredicate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSCalendarEventPredictor contactKeysToFetch](self, "contactKeysToFetch");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v11, v12, &v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;

        if (objc_msgSend(v13, "count"))
          v15 = v14 == 0;
        else
          v15 = 0;
        if (v15)
        {
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, v9);
        }
        else
        {
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v9;
            v28 = 2112;
            v29 = v14;
            _os_log_debug_impl(&dword_1A07F4000, v16, OS_LOG_TYPE_DEBUG, "Unable to find Contact for participant %@ w/ error: %@", buf, 0x16u);
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v6);
  }

  return v19;
}

- (id)zkwSuggestionsFromCalendarWithPredictionContext:(id)a3 startDate:(id)a4 endDate:(id)a5 maxParticipants:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  EKEventStore *eventStore;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  unint64_t v59;
  uint8_t v60[4];
  uint64_t v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v10 = a4;
  v11 = a5;
  -[EKEventStore calendarsForEntityType:](self->_eventStore, "calendarsForEntityType:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore predicateForEventsWithStartDate:endDate:calendars:](self->_eventStore, "predicateForEventsWithStartDate:endDate:calendars:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  eventStore = self->_eventStore;
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __111___PSCalendarEventPredictor_zkwSuggestionsFromCalendarWithPredictionContext_startDate_endDate_maxParticipants___block_invoke;
  v55[3] = &unk_1E4401A88;
  v16 = v10;
  v56 = v16;
  v17 = v11;
  v57 = v17;
  v59 = a6;
  v18 = v14;
  v58 = v18;
  -[EKEventStore enumerateEventsMatchingPredicate:usingBlock:](eventStore, "enumerateEventsMatchingPredicate:usingBlock:", v13, v55);
  if (objc_msgSend(v18, "count"))
  {
    v42 = v17;
    v43 = v16;
    v45 = v12;
    v19 = objc_opt_new();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v41 = v18;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    v22 = v46;
    if (v21)
    {
      v23 = v21;
      v24 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v52 != v24)
            objc_enumerationMutation(v20);
          -[_PSCalendarEventPredictor getParticipantContactsMapFromEvent:](self, "getParticipantContactsMapFromEvent:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addEntriesFromDictionary:](v19, "addEntriesFromDictionary:", v26);

        }
        v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      }
      while (v23);
    }
    v44 = v13;

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[_PSCalendarEventPredictor zkwSuggestionsFromCalendarWithPredictionContext:startDate:endDate:maxParticipants:].cold.3();

    +[_PSCalendarEventPredictor eventComparatorWithPredictionContext:contactsMap:](_PSCalendarEventPredictor, "eventComparatorWithPredictionContext:contactsMap:", v46, v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sortedArrayUsingComparator:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)objc_opt_new();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v31 = v29;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v48 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          +[_PSCalendarEventPredictor getZKWSuggestionForCalendarEvent:context:contactsMap:](_PSCalendarEventPredictor, "getZKWSuggestionForCalendarEvent:context:contactsMap:", v36, v22, v19);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            objc_msgSend(v30, "addObject:", v37);
          }
          else
          {
            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              -[_PSCalendarEventPredictor zkwSuggestionsFromCalendarWithPredictionContext:startDate:endDate:maxParticipants:].cold.2(v60, v36, &v61, v38);

            v22 = v46;
          }

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      }
      while (v33);
    }

    +[_PSCalendarEventPredictor createFinalSuggestions:context:](_PSCalendarEventPredictor, "createFinalSuggestions:context:", v30, v22);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v44;
    v12 = v45;
    v17 = v42;
    v16 = v43;
    v18 = v41;
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[_PSCalendarEventPredictor zkwSuggestionsFromCalendarWithPredictionContext:startDate:endDate:maxParticipants:].cold.1();
    v39 = (void *)MEMORY[0x1E0C9AA60];
    v22 = v46;
  }

  return v39;
}

- (id)contactKeysToFetch
{
  void *v2;
  id v3;
  void *v4;
  id *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  id *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  id v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v2 = (void *)getCNContactFormatterClass_softClass_6;
  v25 = getCNContactFormatterClass_softClass_6;
  if (!getCNContactFormatterClass_softClass_6)
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = (uint64_t)__getCNContactFormatterClass_block_invoke_6;
    v20 = &unk_1E43FEA00;
    v21 = &v22;
    __getCNContactFormatterClass_block_invoke_6((uint64_t)&v17);
    v2 = (void *)v23[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v22, 8);
  objc_msgSend(v3, "descriptorForRequiredKeysForStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = (uint64_t)&v17;
  v19 = 0x2020000000;
  v5 = (id *)getCNContactIdentifierKeySymbolLoc_ptr_8;
  v20 = (void *)getCNContactIdentifierKeySymbolLoc_ptr_8;
  if (!getCNContactIdentifierKeySymbolLoc_ptr_8)
  {
    v6 = (void *)ContactsLibrary_8();
    v5 = (id *)dlsym(v6, "CNContactIdentifierKey");
    *(_QWORD *)(v18 + 24) = v5;
    getCNContactIdentifierKeySymbolLoc_ptr_8 = (uint64_t)v5;
  }
  _Block_object_dispose(&v17, 8);
  if (!v5)
    goto LABEL_13;
  v7 = *v5;
  v26[0] = v7;
  v17 = 0;
  v18 = (uint64_t)&v17;
  v19 = 0x2020000000;
  v8 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr_7;
  v20 = (void *)getCNContactPhoneNumbersKeySymbolLoc_ptr_7;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_7)
  {
    v9 = (void *)ContactsLibrary_8();
    v8 = (id *)dlsym(v9, "CNContactPhoneNumbersKey");
    *(_QWORD *)(v18 + 24) = v8;
    getCNContactPhoneNumbersKeySymbolLoc_ptr_7 = (uint64_t)v8;
  }
  _Block_object_dispose(&v17, 8);
  if (!v8)
    goto LABEL_13;
  v10 = *v8;
  v26[1] = v10;
  v17 = 0;
  v18 = (uint64_t)&v17;
  v19 = 0x2020000000;
  v11 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr_7;
  v20 = (void *)getCNContactEmailAddressesKeySymbolLoc_ptr_7;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_7)
  {
    v12 = (void *)ContactsLibrary_8();
    v11 = (id *)dlsym(v12, "CNContactEmailAddressesKey");
    *(_QWORD *)(v18 + 24) = v11;
    getCNContactEmailAddressesKeySymbolLoc_ptr_7 = (uint64_t)v11;
  }
  _Block_object_dispose(&v17, 8);
  if (!v11)
  {
LABEL_13:
    -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    __break(1u);
  }
  v27 = *v11;
  v28 = v4;
  v13 = (void *)MEMORY[0x1E0C99D20];
  v14 = v27;
  objc_msgSend(v13, "arrayWithObjects:count:", v26, 4, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

+ (void)isEligibleParticipant:context:contactsMap:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, v0, v1, "Participant %@ is self. Skipping", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)isEligibleParticipant:context:contactsMap:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, v0, v1, "Participant %@ is not eligible because declined", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)isEligibleParticipant:context:contactsMap:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, v0, v1, "Participant %@ is not a person. Skipping", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)currentUserIsEligibleForEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v4, "User not eligible for %@ since user is not a participant", v5);

  OUTLINED_FUNCTION_9_0();
}

+ (void)currentUserIsEligibleForEvent:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "title");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_0_6(&dword_1A07F4000, v2, v3, "User not eligible for %@ since participant has not accepted and is not the host: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

+ (void)currentUserIsEligibleForEvent:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "title");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_0_6(&dword_1A07F4000, v2, v3, "User not eligible for %@ since participant is invalid state: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

+ (void)isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Event start time not within time window. Skipping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "All-day event. Skipping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Cancelled event. Skipping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, v0, v1, "Non-(<= %tu)-person event. Skipping", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)isMaybeFaceTimeEvent:(void *)a1 earliestStartDate:(NSObject *)a2 latestStartDate:maxParticipants:.cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v4, "Event has likely designated virtual conference using url in location %@. Skipping", v5);

  OUTLINED_FUNCTION_9_0();
}

+ (void)isMaybeFaceTimeEvent:(void *)a1 earliestStartDate:(NSObject *)a2 latestStartDate:maxParticipants:.cold.6(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v5, "Event has likely designated virtual conference using url in URL %@. Skipping", v6);

  OUTLINED_FUNCTION_7();
}

+ (void)isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, v0, v1, "[isMaybeFaceTimeEvent => YES] %@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)isMaybeFaceTimeEvent:(void *)a1 earliestStartDate:(NSObject *)a2 latestStartDate:maxParticipants:.cold.8(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "virtualConference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v4, "Event already has designated virtual conference using %@. Skipping", v5);

  OUTLINED_FUNCTION_9_0();
}

+ (void)getZKWSuggestionForCalendarEvent:(void *)a1 context:(NSObject *)a2 contactsMap:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v4, "Event %@ has no FaceTimeable participants. Skipping", v5);

  OUTLINED_FUNCTION_9_0();
}

+ (void)getZKWSuggestionForCalendarEvent:(void *)a1 context:(NSObject *)a2 contactsMap:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v4, "Event %@ has no eligible participants found. Skipping", v5);

  OUTLINED_FUNCTION_9_0();
}

- (void)zkwSuggestionsFromCalendarWithPredictionContext:startDate:endDate:maxParticipants:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "No candidate events found for Calendar extraction. Returning empty result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)zkwSuggestionsFromCalendarWithPredictionContext:(uint8_t *)a1 startDate:(void *)a2 endDate:(_QWORD *)a3 maxParticipants:(NSObject *)a4 .cold.2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A07F4000, a4, OS_LOG_TYPE_DEBUG, "Event %@ has no suggestions found. Skipping", a1, 0xCu);

}

- (void)zkwSuggestionsFromCalendarWithPredictionContext:startDate:endDate:maxParticipants:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Proceeding to rank events and build suggestions from their extractions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
