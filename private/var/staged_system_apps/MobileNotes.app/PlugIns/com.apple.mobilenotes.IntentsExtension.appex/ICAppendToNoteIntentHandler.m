@implementation ICAppendToNoteIntentHandler

- (ICAppendToNoteIntentHandler)init
{
  ICAppendToNoteIntentHandler *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICAppendToNoteIntentHandler;
  v2 = -[ICBaseIntentHandler init](&v5, "init");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler noteContext](v2, "noteContext"));
  objc_msgSend(v3, "enableHTMLContextChangeLogging");

  return v2;
}

- (void)resolveTargetNoteForAppendToNote:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  void *v29;
  void (**v30)(id, void *);
  void *v31;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  id v39;
  uint64_t *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE v51[128];
  _BYTE v52[128];

  v5 = a3;
  v30 = (void (**)(id, void *))a4;
  v31 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "targetNote"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "spokenPhrase"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "targetNote"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));

  if (objc_msgSend(v8, "length") || objc_msgSend(v29, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "targetNote"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler searchIndexableNoteForIntentNote:](self, "searchIndexableNoteForIntentNote:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler intentNoteForSearchIndexableNote:](self, "intentNoteForSearchIndexableNote:", v11));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[INNoteResolutionResult successWithResolvedNote:](INNoteResolutionResult, "successWithResolvedNote:", v12));
      v30[2](v30, v13);

      goto LABEL_31;
    }

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler notesWithTitle:](self, "notesWithTitle:", v8));
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_10000DC88;
  v49 = sub_10000DC98;
  v50 = objc_alloc_init((Class)NSMutableArray);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "managedObjectContext"));
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10000DCA0;
        v38[3] = &unk_100020760;
        v38[4] = v18;
        v39 = v8;
        v40 = &v45;
        objc_msgSend(v19, "performBlockAndWait:", v38);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    }
    while (v15);
  }

  if (objc_msgSend((id)v46[5], "count") == (id)1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v46[5], "firstObject"));
    v21 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler intentNoteForSearchIndexableNote:](self, "intentNoteForSearchIndexableNote:", v20));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[INNoteResolutionResult successWithResolvedNote:](INNoteResolutionResult, "successWithResolvedNote:", v21));
    v30[2](v30, v22);
  }
  else if (objc_msgSend(obj, "count") == (id)1)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
    v21 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler intentNoteForSearchIndexableNote:](self, "intentNoteForSearchIndexableNote:", v23));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[INNoteResolutionResult confirmationRequiredWithNoteToConfirm:](INNoteResolutionResult, "confirmationRequiredWithNoteToConfirm:", v21));
    v30[2](v30, v22);
  }
  else
  {
    v21 = objc_alloc_init((Class)NSMutableArray);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v24 = obj;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler intentNoteForSearchIndexableNote:](self, "intentNoteForSearchIndexableNote:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j)));
          if (v28)
            objc_msgSend(v21, "addObject:", v28);

        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
      }
      while (v25);
    }

    if (objc_msgSend(v21, "count"))
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[INNoteResolutionResult disambiguationWithNotesToDisambiguate:](INNoteResolutionResult, "disambiguationWithNotesToDisambiguate:", v21));
    else
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[INNoteResolutionResult unsupported](INNoteResolutionResult, "unsupported"));
    v30[2](v30, v22);
  }

  _Block_object_dispose(&v45, 8);
LABEL_31:

}

- (void)resolveContentForAppendToNote:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, uint64_t);
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = (void (**)(id, uint64_t))a4;
  v6 = a3;
  v7 = objc_opt_class(INTextNoteContent);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));

  v9 = ICDynamicCast(v7, v8);
  v13 = (id)objc_claimAutoreleasedReturnValue(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "text"));
  if (objc_msgSend(v10, "length"))
    v11 = objc_claimAutoreleasedReturnValue(+[INNoteContentResolutionResult successWithResolvedNoteContent:](INNoteContentResolutionResult, "successWithResolvedNoteContent:", v13));
  else
    v11 = objc_claimAutoreleasedReturnValue(+[INNoteContentResolutionResult needsValue](INNoteContentResolutionResult, "needsValue"));
  v12 = (void *)v11;
  v5[2](v5, v11);

}

- (void)handleAppendToNote:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppendToNoteIntentHandler findNoteForIntent:](self, "findNoteForIntent:", v18));
  v8 = objc_opt_class(ICNote);
  v9 = ICDynamicCast(v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_opt_class(NoteObject);
  v12 = ICDynamicCast(v11, v7);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)v13;
  if (v10)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[ICAppendToNoteIntentHandler updateModernNote:withIntent:](self, "updateModernNote:withIntent:", v10, v18));
  }
  else if (v13)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[ICAppendToNoteIntentHandler updateHTMLNote:withIntent:](self, "updateHTMLNote:withIntent:", v13, v18));
  }
  else
  {
    v15 = objc_msgSend(objc_alloc((Class)INAppendToNoteIntentResponse), "initWithCode:userActivity:", 4, 0);
  }
  v16 = v15;
  if (objc_msgSend(v15, "code") == (id)3)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICWidget sharedWidget](ICWidget, "sharedWidget"));
    objc_msgSend(v17, "reloadTimelinesWithReason:", CFSTR("Note was updated via Siri"));

  }
  v6[2](v6, v16);

}

- (id)findNoteForIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetNote"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler searchIndexableNoteForIntentNote:](self, "searchIndexableNoteForIntentNote:", v5));

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetNote"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "spokenPhrase"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler notesWithTitle:](self, "notesWithTitle:", v10));

    if (objc_msgSend(v11, "count") == (id)1)
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    else
      v7 = 0;

  }
  return v7;
}

- (id)updateModernNote:(id)a3 withIntent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  uint64_t *v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v6 = a3;
  v7 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_10000DC88;
  v37 = sub_10000DC98;
  v38 = 0;
  v8 = objc_opt_class(INTextNoteContent);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "content"));
  v10 = ICDynamicCast(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_10000DC88;
  v31[4] = sub_10000DC98;
  v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000E2CC;
  v27[3] = &unk_100020BF8;
  v29 = v31;
  v13 = v6;
  v28 = v13;
  v30 = &v33;
  objc_msgSend(v12, "performBlockAndWait:", v27);

  v14 = (void *)v34[5];
  if (v14)
  {
    v15 = objc_msgSend(v14, "code");
    v16 = objc_alloc((Class)INAppendToNoteIntentResponse);
    if (v15 == (id)206)
      v17 = 6;
    else
      v17 = 4;
    v18 = objc_msgSend(v16, "initWithCode:userActivity:", v17, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler intentNoteForSearchIndexableNote:includeContent:](self, "intentNoteForSearchIndexableNote:includeContent:", v13, 0));
    objc_msgSend(v18, "setNote:", v19);
  }
  else
  {
    v20 = objc_alloc((Class)NSUserActivity);
    v21 = (objc_class *)objc_opt_class(INAppendToNoteIntent);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v19 = objc_msgSend(v20, "initWithActivityType:", v23);

    v18 = objc_msgSend(objc_alloc((Class)INAppendToNoteIntentResponse), "initWithCode:userActivity:", 3, v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler intentNoteForSearchIndexableNote:includeContent:](self, "intentNoteForSearchIndexableNote:includeContent:", v13, 1));
    objc_msgSend(v18, "setNote:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[ICSharingExtensionAttachmentsManager sharedManager](ICSharingExtensionAttachmentsManager, "sharedManager"));
    objc_msgSend(v25, "completeExtensionRequestInBackground");

  }
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(&v33, 8);
  return v18;
}

- (id)updateHTMLNote:(id)a3 withIntent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  ICAppendToNoteIntentHandler *v26;
  _QWORD *v27;
  uint64_t *v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v7 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_10000DC88;
  v35 = sub_10000DC98;
  v36 = 0;
  v8 = objc_opt_class(INTextNoteContent);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "content"));
  v10 = ICDynamicCast(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_10000DC88;
  v29[4] = sub_10000DC98;
  v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000E684;
  v23[3] = &unk_100020C20;
  v13 = v6;
  v24 = v13;
  v27 = v29;
  v14 = v11;
  v25 = v14;
  v26 = self;
  v28 = &v31;
  objc_msgSend(v12, "performBlockAndWait:", v23);

  if (v32[5])
  {
    v15 = objc_msgSend(objc_alloc((Class)INAppendToNoteIntentResponse), "initWithCode:userActivity:", 4, 0);
  }
  else
  {
    v16 = objc_alloc((Class)NSUserActivity);
    v17 = (objc_class *)objc_opt_class(INAppendToNoteIntent);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_msgSend(v16, "initWithActivityType:", v19);

    v15 = objc_msgSend(objc_alloc((Class)INAppendToNoteIntentResponse), "initWithCode:userActivity:", 3, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler intentNoteForSearchIndexableNote:includeContent:](self, "intentNoteForSearchIndexableNote:includeContent:", v13, 1));
    objc_msgSend(v15, "setNote:", v21);

  }
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(&v31, 8);
  return v15;
}

@end
