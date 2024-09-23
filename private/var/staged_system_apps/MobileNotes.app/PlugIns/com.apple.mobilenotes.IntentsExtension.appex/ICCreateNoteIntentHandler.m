@implementation ICCreateNoteIntentHandler

- (ICCreateNoteIntentHandler)init
{
  ICCreateNoteIntentHandler *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICCreateNoteIntentHandler;
  v2 = -[ICBaseIntentHandler init](&v6, "init");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler noteContext](v2, "noteContext"));
  objc_msgSend(v3, "enableHTMLContextChangeLogging");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  objc_msgSend(v4, "startAppSession");

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  objc_msgSend(v3, "appSessionDidTerminate");

  v4.receiver = self;
  v4.super_class = (Class)ICCreateNoteIntentHandler;
  -[ICCreateNoteIntentHandler dealloc](&v4, "dealloc");
}

- (ICNAEventReporter)eventReporter
{
  id v3;
  ICNAEventReporter *v4;
  ICNAEventReporter *eventReporter;

  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
  {
    v3 = objc_alloc((Class)ICNAEventReporter);
    v4 = (ICNAEventReporter *)objc_msgSend(v3, "initWithSubTrackerName:", kICNASubtrackerNameCreateNoteIntentHandler);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v4;

  }
  return self->_eventReporter;
}

- (void)provideGroupNameOptionsForCreateNote:(id)a3 withCompletion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void (**v28)(id, void *, _QWORD);
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  _BYTE v35[128];

  v28 = (void (**)(id, void *, _QWORD))a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler noteContext](self, "noteContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modernManagedObjectContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler noteContext](self, "noteContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "htmlManagedObjectContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NotesAssistantUtilities folderOptionsForModernContext:htmlContext:](NotesAssistantUtilities, "folderOptionsForModernContext:htmlContext:", v6, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "managedObjectID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URIRepresentation"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountIdentifier"));
        if (v18)
        {
          v19 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v17, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountIdentifier"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("accountIdentifier"), v20));
          v34 = v21;
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
          objc_msgSend(v19, "setQueryItems:", v22);

          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URL"));
          v17 = (void *)v23;
        }
        v24 = objc_alloc((Class)INSpeakableString);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fullTitle"));
        v27 = objc_msgSend(v24, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v25, v26, 0);

        objc_msgSend(v10, "addObject:", v27);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v12);
  }

  v28[2](v28, v10, 0);
}

- (void)resolveTitleForCreateNote:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = (void (**)(id, uint64_t))a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "spokenPhrase"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
    v8 = objc_claimAutoreleasedReturnValue(+[INSpeakableStringResolutionResult successWithResolvedString:](INSpeakableStringResolutionResult, "successWithResolvedString:", v10));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[INSpeakableStringResolutionResult notRequired](INSpeakableStringResolutionResult, "notRequired"));
  v9 = (void *)v8;
  v5[2](v5, v8);

}

- (void)resolveContentForCreateNote:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void (**v17)(id, uint64_t);

  v17 = (void (**)(id, uint64_t))a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content"));

  v8 = objc_opt_class(INTextNoteContent);
  v9 = ICDynamicCast(v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "spokenPhrase"));
  v12 = objc_msgSend(v11, "length");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[INNoteContentResolutionResult successWithResolvedNoteContent:](INNoteContentResolutionResult, "successWithResolvedNoteContent:", v10));
  }
  else if (v12)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[INNoteContentResolutionResult notRequired](INNoteContentResolutionResult, "notRequired"));
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(+[INNoteContentResolutionResult needsValue](INNoteContentResolutionResult, "needsValue"));
  }
  v16 = (void *)v15;
  v17[2](v17, v15);

}

- (void)resolveGroupNameForCreateNote:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupName"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupName"));
    v8 = objc_claimAutoreleasedReturnValue(+[INSpeakableStringResolutionResult successWithResolvedString:](INSpeakableStringResolutionResult, "successWithResolvedString:", v7));
    v5[2](v5, v8);

    v5 = (void (**)(id, uint64_t))v8;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[INSpeakableStringResolutionResult notRequired](INSpeakableStringResolutionResult, "notRequired"));
    v5[2](v5, (uint64_t)v7);
  }

}

- (void)handleCreateNote:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  id v46;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", kICNAIntentsExtensionReferralURL));
  objc_msgSend(v8, "startSessionWithReferralURL:referralApplication:", v9, 0);

  v10 = objc_opt_class(INTextNoteContent);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
  v12 = ICDynamicCast(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "text"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupName"));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler noteContext](self, "noteContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "modernManagedObjectContext"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler noteContext](self, "noteContext"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "htmlManagedObjectContext"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NotesAssistantUtilities folderForGroupName:withNoteContext:htmlNoteContext:](NotesAssistantUtilities, "folderForGroupName:withNoteContext:htmlNoteContext:", v16, v18, v20));

  }
  else
  {
    v36 = 0;
  }
  v21 = objc_alloc((Class)ICCreateNoteAction);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler noteContext](self, "noteContext"));
  v23 = objc_msgSend(v21, "initWithNoteContext:", v22);

  if (v14)
    v24 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v14);
  else
    v24 = 0;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "spokenPhrase"));
  v46 = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "performWithTitle:contents:container:error:", v26, v24, v36, &v46));
  v28 = v46;

  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_100006DF0;
  v44 = sub_100006E00;
  v45 = 0;
  if (v27)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "managedObjectContext"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100006E08;
    v37[3] = &unk_100020760;
    v37[4] = self;
    v30 = v27;
    v38 = v30;
    v39 = &v40;
    objc_msgSend(v29, "performBlockAndWait:", v37);

    if (objc_msgSend(v30, "isModernNote"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[ICSharingExtensionAttachmentsManager sharedManager](ICSharingExtensionAttachmentsManager, "sharedManager"));
      objc_msgSend(v31, "completeExtensionRequestInBackground");

    }
  }
  else
  {
    if (v28)
    {
      v32 = os_log_create("com.apple.notes", "Intents");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_1000141F8((uint64_t)v28, v32);

    }
    v33 = objc_msgSend(objc_alloc((Class)INCreateNoteIntentResponse), "initWithCode:userActivity:", 4, 0);
    v34 = (void *)v41[5];
    v41[5] = (uint64_t)v33;

  }
  v7[2](v7, v41[5]);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  objc_msgSend(v35, "endSessionSynchronously:endReason:", 0, 7);

  _Block_object_dispose(&v40, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end
