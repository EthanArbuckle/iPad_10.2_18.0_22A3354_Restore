@implementation ICSearchForNotebookItemsIntentHandler

- (void)resolveTitleForSearchForNotebookItems:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "spokenPhrase"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    v10 = objc_claimAutoreleasedReturnValue(+[INSpeakableStringResolutionResult successWithResolvedString:](INSpeakableStringResolutionResult, "successWithResolvedString:", v9));
    v5[2](v5, v10);

    v5 = (void (**)(id, uint64_t))v10;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[INSpeakableStringResolutionResult notRequired](INSpeakableStringResolutionResult, "notRequired"));
    v5[2](v5, (uint64_t)v9);
  }

}

- (void)resolveContentForSearchForNotebookItems:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "content"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "content"));
    v9 = objc_claimAutoreleasedReturnValue(+[INStringResolutionResult successWithResolvedString:](INStringResolutionResult, "successWithResolvedString:", v8));
    v5[2](v5, v9);

    v5 = (void (**)(id, uint64_t))v9;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[INStringResolutionResult notRequired](INStringResolutionResult, "notRequired"));
    v5[2](v5, (uint64_t)v8);
  }

}

- (void)handleSearchForNotebookItems:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  void *v45;
  id v46;
  objc_class *v47;
  NSString *v48;
  void *v49;
  id v50;
  id v51;
  NSString *v52;
  void *v53;
  NSString *v54;
  void *v55;
  NSString *v56;
  void *v57;
  NSString *v58;
  void *v59;
  void *v60;
  NSString *v61;
  void *v62;
  void *v63;
  NSString *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void (**v72)(id, id);
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];

  v6 = a3;
  v72 = (void (**)(id, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "spokenPhrase"));

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateTime"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDateComponents"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateTime"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDateComponents"));

  if (v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateFromComponents:", v11));

    if (v13)
    {
LABEL_3:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dateFromComponents:", v13));

      goto LABEL_6;
    }
  }
  else
  {
    v15 = 0;
    if (v13)
      goto LABEL_3;
  }
  v75 = 0;
LABEL_6:
  v70 = (void *)v13;
  v71 = (void *)v11;
  v74 = objc_msgSend(v6, "dateSearchType");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "vocabularyIdentifier"));

  v73 = (void *)v15;
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "vocabularyIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v20));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler noteContext](self, "noteContext"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "modernManagedObjectContext"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "persistentStoreCoordinator"));
    v25 = v8;
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "managedObjectIDForURIRepresentation:", v21));

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler noteContext](self, "noteContext"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "htmlManagedObjectContext"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "persistentStoreCoordinator"));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "managedObjectIDForURIRepresentation:", v21));

    v31 = (void *)v26;
    v8 = v25;
    v15 = (uint64_t)v73;
  }
  else
  {
    v30 = 0;
    v31 = 0;
  }
  v69 = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler notesWithText:title:fromDate:toDate:dateSearchType:modernFolderID:legacyFolderID:](self, "notesWithText:title:fromDate:toDate:dateSearchType:modernFolderID:legacyFolderID:", v9, v8, v15, v75, v74, v30));
  v33 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    sub_100014C50(v33);

  v67 = objc_msgSend(v32, "count");
  v76 = (void *)v9;
  v77 = (void *)v8;
  if ((unint64_t)v67 > kICMaximumSiriNoteCount + 1)
  {
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "subarrayWithRange:", 0));

    v32 = (void *)v34;
  }
  v68 = (void *)v30;
  v35 = objc_alloc_init((Class)NSMutableArray);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v36 = v32;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
  if (v37)
  {
    v38 = v37;
    v39 = 0;
    v40 = *(_QWORD *)v79;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v79 != v40)
          objc_enumerationMutation(v36);
        v42 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)v41);
        v43 = objc_msgSend(v6, "includeAllNoteContents");
        if ((unint64_t)v41 + v39 < 5)
          v44 = 1;
        else
          v44 = v43;
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler intentNoteForSearchIndexableNote:includeContent:](self, "intentNoteForSearchIndexableNote:includeContent:", v42, v44));
        if (v45)
          objc_msgSend(v35, "addObject:", v45);

        v41 = (char *)v41 + 1;
      }
      while (v38 != v41);
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
      v39 += (uint64_t)v41;
    }
    while (v38);
  }

  v46 = objc_alloc((Class)NSUserActivity);
  v47 = (objc_class *)objc_opt_class(INSearchForNotebookItemsIntent);
  v48 = NSStringFromClass(v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v50 = objc_msgSend(v46, "initWithActivityType:", v49);

  v51 = objc_alloc_init((Class)NSMutableDictionary);
  v52 = NSStringFromSelector("title");
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  objc_msgSend(v51, "setObject:forKeyedSubscript:", v77, v53);

  v54 = NSStringFromSelector("content");
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  objc_msgSend(v51, "setObject:forKeyedSubscript:", v76, v55);

  v56 = NSStringFromSelector("fromDate");
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  objc_msgSend(v51, "setObject:forKeyedSubscript:", v73, v57);

  v58 = NSStringFromSelector("toDate");
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  objc_msgSend(v51, "setObject:forKeyedSubscript:", v75, v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v74));
  v61 = NSStringFromSelector("dateSearchType");
  v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
  objc_msgSend(v51, "setObject:forKeyedSubscript:", v60, v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v67));
  v64 = NSStringFromSelector("count");
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  objc_msgSend(v51, "setObject:forKeyedSubscript:", v63, v65);

  objc_msgSend(v50, "setUserInfo:", v51);
  v66 = objc_msgSend(objc_alloc((Class)INSearchForNotebookItemsIntentResponse), "initWithCode:userActivity:", 3, v50);
  objc_msgSend(v66, "setNotes:", v35);
  v72[2](v72, v66);

}

@end
