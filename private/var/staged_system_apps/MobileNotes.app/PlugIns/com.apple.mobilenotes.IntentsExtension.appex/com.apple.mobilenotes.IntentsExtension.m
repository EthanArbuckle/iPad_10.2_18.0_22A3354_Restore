void sub_100004F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004F8C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Invalidated database-locking operation, error %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = (void *)*((_QWORD *)WeakRetained + 1);
    *((_QWORD *)WeakRetained + 1) = 0;

  }
}

void sub_100005388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000053AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Invalidated object creation-locking operation, error %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = (void *)*((_QWORD *)WeakRetained + 2);
    *((_QWORD *)WeakRetained + 2) = 0;

  }
}

void sub_1000056F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100005B48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005B6C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005B7C(uint64_t a1)
{

}

void sub_100005B84(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICWidget sharedWidget](ICWidget, "sharedWidget"));
  v3 = objc_msgSend(v2, "hidesObject:", *(_QWORD *)(a1 + 32));

  if ((v3 & 1) == 0)
  {
    v4 = objc_opt_class(ICAccount);
    v5 = ICDynamicCast(v4, *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = v6;
    if (v6)
    {
      v19 = v6;
    }
    else
    {
      v8 = objc_opt_class(ICAccountProxy);
      v9 = ICDynamicCast(v8, *(_QWORD *)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "account"));

    }
    v11 = *(id *)(a1 + 40);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForFolder:](ICAppURLUtilities, "appURLForFolder:", v19));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "absoluteString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allItemsFolderLocalizedTitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder defaultSystemImageName](ICFolder, "defaultSystemImageName"));
    v16 = objc_msgSend(v11, "initWithIdentifier:title:depth:shareDescription:systemImageName:", v13, v14, 0, 0, v15);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
}

void sub_100005CEC(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICWidget sharedWidget](ICWidget, "sharedWidget"));
  v3 = objc_msgSend(v2, "hidesObject:", *(_QWORD *)(a1 + 32));

  if ((v3 & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = objc_opt_class(NSManagedObject);
    v6 = ICClassAndProtocolCast(v4, v5, 1);
    v15 = (id)objc_claimAutoreleasedReturnValue(v6);
    v7 = *(id *)(a1 + 40);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForHTMLFolder:](ICAppURLUtilities, "appURLForHTMLFolder:", v15));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allItemsFolderLocalizedTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder defaultSystemImageName](ICFolder, "defaultSystemImageName"));
    v12 = objc_msgSend(v7, "initWithIdentifier:title:depth:shareDescription:systemImageName:", v9, v10, 0, 0, v11);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

void sub_100005E2C(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICWidget sharedWidget](ICWidget, "sharedWidget"));
  v3 = objc_msgSend(v2, "hidesObject:", *(_QWORD *)(a1 + 32));

  if ((v3 & 1) == 0)
  {
    v4 = objc_opt_class(ICFolder);
    v5 = ICDynamicCast(v4, *(_QWORD *)(a1 + 32));
    v16 = (id)objc_claimAutoreleasedReturnValue(v5);
    v6 = *(id *)(a1 + 40);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForFolder:](ICAppURLUtilities, "appURLForFolder:", v16));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedTitle"));
    v10 = objc_msgSend(v16, "depth");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "shareDescription"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "systemImageName"));
    v13 = objc_msgSend(v6, "initWithIdentifier:title:depth:shareDescription:systemImageName:", v8, v9, v10, v11, v12);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

void sub_100005F7C(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICWidget sharedWidget](ICWidget, "sharedWidget"));
  v3 = objc_msgSend(v2, "hidesObject:", *(_QWORD *)(a1 + 32));

  if ((v3 & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = objc_opt_class(NSManagedObject);
    v6 = ICClassAndProtocolCast(v4, v5, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue(v6);
    v7 = *(id *)(a1 + 40);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForHTMLFolder:](ICAppURLUtilities, "appURLForHTMLFolder:", v16, &OBJC_PROTOCOL___ICLegacyFolder));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedTitle"));
    v11 = objc_msgSend(v16, "depth");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder defaultSystemImageName](ICFolder, "defaultSystemImageName"));
    v13 = objc_msgSend(v7, "initWithIdentifier:title:depth:shareDescription:systemImageName:", v9, v10, v11, 0, v12);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

void sub_100006DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006DF0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100006E00(uint64_t a1)
{

}

void sub_100006E08(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventReporter"));
  objc_msgSend(v2, "submitNoteCreateEventForSearchIndexableNote:createApproach:", *(_QWORD *)(a1 + 40), 1);

  v3 = objc_opt_class(NoteObject);
  v4 = ICDynamicCast(v3, *(_QWORD *)(a1 + 40));
  v19 = (id)objc_claimAutoreleasedReturnValue(v4);
  if (v19)
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "folder"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "noteContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "htmlNoteContext"));
    objc_msgSend(v5, "refreshNotesForCollectionWithId:andContext:", v7, v9);

  }
  v10 = objc_alloc((Class)NSUserActivity);
  v11 = (objc_class *)objc_opt_class(INCreateNoteIntent);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend(v10, "initWithActivityType:", v13);

  v15 = objc_msgSend(objc_alloc((Class)INCreateNoteIntentResponse), "initWithCode:userActivity:", 3, v14);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "intentNoteForSearchIndexableNote:includeContent:", *(_QWORD *)(a1 + 40), 1));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setCreatedNote:", v18);

}

void sub_1000072BC(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void **v10;
  uint64_t v11;
  id (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recentNotesIndexer"));
  v3 = objc_msgSend(v2, "newSnapshotFromIndex");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sectionIdentifiers"));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000073A8;
  v13 = &unk_1000207D8;
  v5 = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v15 = v5;
  v6 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_compactMap:", &v10));

  v8 = objc_alloc((Class)INObjectCollection);
  v9 = objc_msgSend(v8, "initWithSections:", v7, v10, v11, v12, v13);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id sub_1000073A8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemIdentifiersInSectionWithIdentifier:", v4));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007480;
  v11[3] = &unk_1000207B0;
  v11[4] = *(_QWORD *)(a1 + 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_compactMap:", v11));

  v7 = objc_alloc((Class)INObjectSection);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

  v9 = objc_msgSend(v7, "initWithTitle:items:", v8, v6);
  return v9;
}

id sub_100007480(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v16[5];
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[5];
  id v31;

  v3 = a2;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_1000076F4;
  v30[4] = sub_100007704;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1000076F4;
  v28 = sub_100007704;
  v29 = 0;
  if (objc_msgSend(v3, "ic_isModernNoteType"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "modernContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000770C;
    v20[3] = &unk_100020788;
    v6 = *(_QWORD *)(a1 + 32);
    v22 = v30;
    v20[4] = v6;
    v21 = v3;
    v23 = &v24;
    objc_msgSend(v5, "performBlockAndWait:", v20);

    v7 = v21;
LABEL_5:

    goto LABEL_9;
  }
  if (objc_msgSend(v3, "ic_isLegacyNoteType"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "legacyContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000077C0;
    v16[3] = &unk_100020788;
    v10 = *(_QWORD *)(a1 + 32);
    v18 = v30;
    v16[4] = v10;
    v17 = v3;
    v19 = &v24;
    objc_msgSend(v9, "performBlockAndWait:", v16);

    v7 = v17;
    goto LABEL_5;
  }
  v11 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_1000142FC();

LABEL_9:
  v12 = (void *)v25[5];
  if (v12)
  {
    v13 = v12;
  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10001429C();

  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(v30, 8);
  return v12;
}

void sub_1000076D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000076F4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100007704(uint64_t a1)
{

}

void sub_10000770C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ICIntentNote *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "modernContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40)));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = -[ICIntentNote initWithObject:]([ICIntentNote alloc], "initWithObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void sub_1000077C0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ICIntentNote *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "legacyContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40)));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = -[ICIntentNote initWithObject:]([ICIntentNote alloc], "initWithObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void sub_100007A4C(uint64_t a1)
{
  id v2;
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _BOOL4 v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  id obj;
  uint64_t v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[5];
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  _QWORD v52[5];
  id v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[4];
  uint64_t v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "results"));
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  if (v2)
  {
    v44 = *(_QWORD *)v69;
    *(_QWORD *)&v3 = 138412546;
    v42 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v69 != v44)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "modernContext", v42));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentContainer"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentStoreCoordinator"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_managedObjectIDForURIString:", v9));

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "legacyContext"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managedObjectContext"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "persistentStoreCoordinator"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ic_managedObjectIDForURIString:", v14));

        v62 = 0;
        v63 = &v62;
        v64 = 0x3032000000;
        v65 = sub_1000076F4;
        v66 = sub_100007704;
        v67 = 0;
        v56 = 0;
        v57 = &v56;
        v58 = 0x3032000000;
        v59 = sub_1000076F4;
        v60 = sub_100007704;
        v61 = 0;
        if (objc_msgSend(v10, "ic_isModernNoteType"))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "modernContext"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "managedObjectContext"));
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_100008110;
          v52[3] = &unk_100020788;
          v18 = *(_QWORD *)(a1 + 40);
          v54 = &v62;
          v52[4] = v18;
          v53 = v10;
          v55 = &v56;
          objc_msgSend(v17, "performBlockAndWait:", v52);

        }
        else if (objc_msgSend(v15, "ic_isLegacyNoteType"))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "legacyContext"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "managedObjectContext"));
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_1000081C4;
          v48[3] = &unk_100020788;
          v21 = *(_QWORD *)(a1 + 40);
          v50 = &v62;
          v48[4] = v21;
          v49 = v15;
          v51 = &v56;
          objc_msgSend(v20, "performBlockAndWait:", v48);

        }
        else
        {
          v22 = os_log_create("com.apple.notes", "Intents");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v42;
            v75 = v10;
            v76 = 2112;
            v77 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unknown object type — skipping {modernObjectID: %@, legacyObjectID: %@}", buf, 0x16u);
          }

        }
        if (v63[5])
        {
          v23 = objc_alloc((Class)ICFolderListSectionIdentifier);
          v24 = objc_msgSend(v23, "initWithObject:", v63[5]);
          if (!v24)
          {
            v32 = os_log_create("com.apple.notes", "Intents");
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v63[5], "objectID"));
              sub_10001435C(v33, v72, &v73, v32);
            }

            goto LABEL_24;
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v24));
          v26 = v25 == 0;

          if (v26)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v27, v24);

          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v24));
          v29 = objc_msgSend(v28, "count");
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "recentNotesIndexer"));
          v31 = v29 < objc_msgSend(v30, "maximumNumberOfNotesPerAccount");

          if (v31)
          {
            v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v24));
            -[NSObject ic_addNonNilObject:](v32, "ic_addNonNilObject:", v57[5]);
LABEL_24:

          }
        }
        else
        {
          v24 = os_log_create("com.apple.notes", "Intents");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v42;
            v75 = v10;
            v76 = 2112;
            v77 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Note does not exist — skipping {modernObjectID: %@, legacyObjectID: %@}", buf, 0x16u);
          }
        }

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v62, 8);

        v4 = (char *)v4 + 1;
      }
      while (v2 != v4);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    }
    while (v2);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "allKeys"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolderListSectionIdentifier sortDescriptors](ICFolderListSectionIdentifier, "sortDescriptors"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "sortedArrayUsingDescriptors:", v35));

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100008278;
  v46[3] = &unk_100020828;
  v47 = v45;
  v37 = v45;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "ic_map:", v46));
  v39 = objc_msgSend(objc_alloc((Class)INObjectCollection), "initWithSections:", v38);
  v40 = *(_QWORD *)(a1 + 48);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "error"));
  (*(void (**)(uint64_t, id, void *))(v40 + 16))(v40, v39, v41);

}

void sub_1000080DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_100008110(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ICIntentNote *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "modernContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40)));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = -[ICIntentNote initWithObject:]([ICIntentNote alloc], "initWithObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void sub_1000081C4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ICIntentNote *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "legacyContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40)));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = -[ICIntentNote initWithObject:]([ICIntentNote alloc], "initWithObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

id sub_100008278(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = objc_alloc((Class)INObjectSection);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3));

  v7 = objc_msgSend(v4, "initWithTitle:items:", v5, v6);
  return v7;
}

void sub_100008434(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "allItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICIntentNoteResolutionResult disambiguationWithIntentNotesToDisambiguate:](ICIntentNoteResolutionResult, "disambiguationWithIntentNotesToDisambiguate:", v4));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

void sub_100008878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10000889C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ICIntentNote *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "modernContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40)));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = -[ICIntentNote initWithObject:]([ICIntentNote alloc], "initWithObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void sub_100008950(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ICIntentNote *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "legacyContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40)));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = -[ICIntentNote initWithObject:]([ICIntentNote alloc], "initWithObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void sub_100008A40(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008A50(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100008E30(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "folderIndexer"));
  v3 = objc_msgSend(v2, "newSnapshotFromIndex");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sectionIdentifiers"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008F2C;
  v10[3] = &unk_100020918;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v11 = v3;
  v12 = v5;
  v13 = v6;
  v7 = v3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_compactMap:", v10));

  v9 = objc_msgSend(objc_alloc((Class)INObjectCollection), "initWithSections:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

id sub_100008F2C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  _QWORD v16[5];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemIdentifiersInSectionWithIdentifier:", v3));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100009080;
  v16[3] = &unk_1000208C8;
  v16[4] = *(_QWORD *)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_compactMap:", v16));

  if (!objc_msgSend(*(id *)(a1 + 48), "length"))
  {
    v6 = v5;
    goto LABEL_5;
  }
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10000950C;
  v14 = &unk_1000208F0;
  v15 = *(id *)(a1 + 48);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_objectsPassingTest:", &v11));

  v7 = objc_msgSend(v6, "count", v11, v12, v13, v14);
  if (v7)
  {
    v5 = v6;
LABEL_5:
    v8 = objc_alloc((Class)INObjectSection);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
    v7 = objc_msgSend(v8, "initWithTitle:items:", v9, v5);

  }
  return v7;
}

id sub_100009080(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  ICIntentNotesFolder *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[8];
  _QWORD v31[8];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[5];
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v3 = a2;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_10000937C;
  v44 = sub_10000938C;
  v4 = objc_opt_class(NSManagedObjectID);
  v5 = ICDynamicCast(v4, v3);
  v45 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
  v7 = ICDynamicCast(v6, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_10000937C;
  v38[4] = sub_10000938C;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_10000937C;
  v36 = sub_10000938C;
  v37 = 0;
  if (objc_msgSend((id)v41[5], "ic_isModernContainerType"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "modernContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100009394;
    v31[3] = &unk_1000208A0;
    v31[4] = *(_QWORD *)(a1 + 32);
    v31[5] = v38;
    v31[6] = &v40;
    v31[7] = &v32;
    objc_msgSend(v10, "performBlockAndWait:", v31);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend((id)v41[5], "ic_isLegacyContainerType"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "legacyContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100009450;
    v30[3] = &unk_1000208A0;
    v30[4] = *(_QWORD *)(a1 + 32);
    v30[5] = v38;
    v30[6] = &v40;
    v30[7] = &v32;
    objc_msgSend(v10, "performBlockAndWait:", v30);
    goto LABEL_5;
  }
  if (v8)
  {
    v21 = -[ICIntentNotesFolder initWithVirtualSmartFolder:]([ICIntentNotesFolder alloc], "initWithVirtualSmartFolder:", v8);
    v22 = (void *)v33[5];
    v33[5] = (uint64_t)v21;

  }
  else
  {
    v23 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_10001454C((uint64_t)v3, v23, v24, v25, v26, v27, v28, v29);

  }
LABEL_6:
  v11 = (void *)v33[5];
  if (v11)
  {
    v12 = v11;
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000144E4((uint64_t)v3, v13, v14, v15, v16, v17, v18, v19);

  }
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v40, 8);

  return v11;
}

void sub_100009344(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000937C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000938C(uint64_t a1)
{

}

void sub_100009394(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ICIntentNotesFolder *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "modernContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_existingObjectWithID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                                + 40)));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = -[ICIntentNotesFolder initWithObject:]([ICIntentNotesFolder alloc], "initWithObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void sub_100009450(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ICIntentNotesFolder *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "legacyContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_existingObjectWithID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                                + 40)));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = -[ICIntentNotesFolder initWithObject:]([ICIntentNotesFolder alloc], "initWithObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

id sub_10000950C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "displayString"));
  v4 = objc_msgSend(v3, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_100009680(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "allItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICIntentNotesFolderResolutionResult disambiguationWithIntentNotesFoldersToDisambiguate:](ICIntentNotesFolderResolutionResult, "disambiguationWithIntentNotesFoldersToDisambiguate:", v4));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

void sub_100009808(id a1)
{
  ICSharingExtensionAttachmentsManager *v1;
  void *v2;

  v1 = objc_alloc_init(ICSharingExtensionAttachmentsManager);
  v2 = (void *)qword_100028A18;
  qword_100028A18 = (uint64_t)v1;

}

void sub_100009CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v7;
  va_list va;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a6);
  va_start(va, a6);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100009CD0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attachment"));
  if (v4)
  {

LABEL_4:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaURL"));

  if (v5)
    goto LABEL_4;
LABEL_5:
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributedContentText"));

  v7 = objc_msgSend(v6, "length") != 0;
  return v7;
}

uint64_t sub_100009D64(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaURL"));
  if (v4
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaUTI")),
        v6,
        v5,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaUTI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v7));

    v9 = objc_msgSend(v8, "conformsToType:", UTTypePDF);
    if (v9)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

    v10 = v9 ^ 1;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

void sub_10000A548(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100014620((uint64_t)v6, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appendLock"));
    objc_msgSend(v8, "unlock");

  }
  else if (v5)
  {
    if (objc_msgSend(v5, "isFileURL"))
    {
      v9 = objc_msgSend(objc_alloc((Class)ICAddAttachmentsManagerAttachmentInfo), "initWithFileURL:", v5);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appendLock"));
      objc_msgSend(v10, "unlock");

    }
    else
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "managedObjectContext"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000A6CC;
      v14[3] = &unk_1000209A8;
      v15 = *(id *)(a1 + 48);
      v11 = v5;
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(a1 + 40);
      v16 = v11;
      v17 = v12;
      v18 = *(_QWORD *)(a1 + 56);
      v19 = v13;
      objc_msgSend(v9, "performBlockAndWait:", v14);

    }
  }

}

void sub_10000A6CC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addURLAttachmentWithURL:", *(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "titleFromExtensionItem:", *(_QWORD *)(a1 + 56)));
  objc_msgSend(v6, "setTitle:", v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v6, "setCreationDate:", v3);
  objc_msgSend(v6, "setModificationDate:", v3);
  v4 = (void *)objc_opt_new(ICAddAttachmentsManagerAttachmentInfo);
  objc_msgSend(v4, "setAttachment:", v6);
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "appendLock"));
  objc_msgSend(v5, "unlock");

}

void sub_10000A7A0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000146B4((uint64_t)v6, v7);

    goto LABEL_7;
  }
  if (v5)
  {
    v7 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
    -[NSObject setAttributedContentText:](v7, "setAttributedContentText:", v5);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
LABEL_7:

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "appendLock"));
  objc_msgSend(v8, "unlock");

}

void sub_10000A868(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePlainText, "identifier"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000A9D8;
    v18[3] = &unk_100020A20;
    v9 = *(void **)(a1 + 48);
    v18[4] = *(_QWORD *)(a1 + 40);
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 56);
    v19 = v10;
    v20 = v11;
    objc_msgSend(v7, "loadItemForTypeIdentifier:options:completionHandler:", v8, 0, v18);

  }
  else if (v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "attributedContentText"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "string"));
    v15 = objc_msgSend(v5, "isEqualToString:", v14);

    if ((v15 & 1) == 0)
    {
      v16 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
      v17 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v5);
      objc_msgSend(v16, "setAttributedContentText:", v17);

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "appendLock"));
  objc_msgSend(v12, "unlock");

}

void sub_10000A9D8(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100014748((uint64_t)v6, v7);

  }
  else
  {
    if (!v5)
      goto LABEL_6;
    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "attributedContentText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "string"));
    v11 = -[NSObject isEqualToString:](v7, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
      v13 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v7);
      objc_msgSend(v12, "setAttributedContentText:", v13);

      objc_msgSend(a1[5], "addObject:", v12);
    }
  }

LABEL_6:
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "appendLock"));
  objc_msgSend(v8, "unlock");

}

void sub_10000AB28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  void *v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10001483C();
LABEL_12:

    goto LABEL_13;
  }
  if (v5)
  {
    v18 = 0;
    v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSDictionary), v5, &v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v7 = v18;
    if (v7)
    {
      v10 = os_log_create("com.apple.notes", "SharingExtension");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1000147DC();

    }
    v11 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("article-title")));
    objc_msgSend(v11, "setTitle:", v12);

    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("article-summary")));
    v14 = v13;
    if (!v13)
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((summary) != nil)", "-[ICSharingExtensionAttachmentsManager extractAttachmentsFromInputItems:note:]_block_invoke", 1, 0, CFSTR("Expected non-nil value for '%s'"), "summary");
      v14 = &stru_100021400;
    }
    v15 = v14;

    v16 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v15);
    objc_msgSend(v11, "setAttributedContentText:", v16);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
    goto LABEL_12;
  }
LABEL_13:
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "appendLock"));
  objc_msgSend(v17, "unlock");

}

void sub_10000AD38(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10001490C();
    goto LABEL_19;
  }
  if (v5)
  {
    v7 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
    v8 = objc_opt_class(NSDictionary);
    v9 = objc_opt_class(NSString);
    v10 = objc_opt_class(NSURL);
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, objc_opt_class(NSNumber), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v33 = 0;
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v12, v5, &v33));
    v14 = v33;

    if (v14)
    {
      v15 = os_log_create("com.apple.notes", "SharingExtension");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1000147DC();

    }
    -[NSObject setMetadata:](v7, "setMetadata:", v13);
    v16 = ICAttachmentMetadataURLKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", ICAttachmentMetadataURLKey));
    if (!v17)
      goto LABEL_18;
    v18 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    {
      v19 = v17;
    }
    else
    {
      v20 = objc_opt_class(NSURL);
      if ((objc_opt_isKindOfClass(v17, v20) & 1) == 0)
      {
        v25 = os_log_create("com.apple.notes", "SharingExtension");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1000148AC();
        goto LABEL_17;
      }
      v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString"));
      if (!v19)
      {
LABEL_18:
        objc_msgSend(a1[5], "addObject:", v7);

LABEL_19:
        goto LABEL_20;
      }
    }
    v21 = objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v21, "removeObjectForKey:", v16);
    v22 = v14;
    v23 = objc_msgSend(v21, "copy");

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "managedObjectContext"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000B078;
    v28[3] = &unk_100020A98;
    v29 = a1[4];
    v30 = v19;
    v24 = v23;
    v14 = v22;
    v13 = v24;
    v31 = v24;
    v32 = v7;
    v25 = v19;
    objc_msgSend(v27, "performBlockAndWait:", v28);

LABEL_17:
    goto LABEL_18;
  }
LABEL_20:
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "appendLock"));
  objc_msgSend(v26, "unlock");

}

void sub_10000B078(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", *(_QWORD *)(a1 + 40)));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "addURLAttachmentWithURL:", v3));

  objc_msgSend(v5, "setMetadata:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "setCreationDate:", v4);
  objc_msgSend(v5, "setModificationDate:", v4);
  objc_msgSend(*(id *)(a1 + 56), "setAttachment:", v5);
  objc_msgSend(*(id *)(a1 + 56), "setMetadata:", 0);

}

void sub_10000B12C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10001490C();
    goto LABEL_6;
  }
  if (v5)
  {
    v7 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
    v11 = ICAttachmentMetadataMapItemDataKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "base64EncodedStringWithOptions:", 0));
    v12 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    -[NSObject setMetadata:](v7, "setMetadata:", v9);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
LABEL_6:

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "appendLock"));
  objc_msgSend(v10, "unlock");

}

void sub_10000B3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B3E8(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double x;
  double y;
  double width;
  double height;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  unsigned int v57;
  void *v58;
  uint64_t v59;
  BOOL v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned __int8 v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[4];
  id v78;
  CGRect v79;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
  if (objc_msgSend(v2, "isURL"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
    if ((objc_msgSend(v3, "isiTunes") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
      if ((objc_msgSend(v5, "isAppStore") & 1) != 0)
      {
        v4 = 0;
      }
      else
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
        if ((objc_msgSend(v6, "isNews") & 1) != 0)
        {
          v4 = 0;
        }
        else
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
          if ((objc_msgSend(v7, "isMap") & 1) != 0)
          {
            v4 = 0;
          }
          else
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
            v4 = objc_msgSend(v8, "isPodcasts") ^ 1;

          }
        }

      }
    }

  }
  else
  {
    v4 = 0;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
  if ((objc_msgSend(v9, "isiTunes") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
    if ((objc_msgSend(v10, "isAppStore") & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
      if ((objc_msgSend(v11, "isNews") & 1) == 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
        if ((objc_msgSend(v12, "isMap") & 1) == 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
          if ((objc_msgSend(v13, "isURL") & 1) == 0)
          {
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
            v68 = objc_msgSend(v67, "isPodcasts");

            if ((v68 & 1) == 0)
              return;
            goto LABEL_26;
          }

        }
      }

    }
  }

LABEL_26:
  if (!objc_msgSend(*(id *)(a1 + 40), "count"))
    return;
  v14 = 0;
  v15 = 0;
  while (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == v14)
  {
LABEL_61:
    if (++v14 >= (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count"))
      goto LABEL_82;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "image"));
  if (v17)
    v18 = v4;
  else
    v18 = 1;

  if ((v18 & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "image"));
    objc_msgSend(v32, "size");
    v34 = v33;
    v36 = v35;
    objc_msgSend(v32, "scale");
    v38 = v37;
    if (v34 * v37 <= 800.0 && v36 * v37 <= 800.0)
    {
      objc_msgSend(v32, "ic_cropRectZeroAlpha");
      x = v79.origin.x;
      y = v79.origin.y;
      width = v79.size.width;
      height = v79.size.height;
      if (!CGRectIsEmpty(v79))
      {
        objc_msgSend(v32, "size");
        if (width < v44 || (objc_msgSend(v32, "size"), height < v45))
        {
          v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ic_imageFromRect:", x, y, width, height));

          v32 = (void *)v46;
        }
      }
    }
    objc_msgSend(v32, "size");
    v49 = v38 * v48;
    if (v38 * v47 > 384.0 && v49 > 384.0)
    {
      v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ic_scaledImageMinDimension:scale:", 384.0, v38));

      v32 = (void *)v51;
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
    v15 = 1;
    v53 = objc_msgSend(v52, "updateAttachmentPreviewImageWithImage:scale:scaleWhenDrawing:metadata:sendNotification:", v32, 1, 0, 1, 0.0);
    goto LABEL_56;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "metadata"));
  if (v19)
    v20 = v4;
  else
    v20 = 1;

  if ((v20 & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "metadata"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
    objc_msgSend(v52, "setMetadata:", v32);
    goto LABEL_56;
  }
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
  if (!v21
    || (v22 = (void *)v21,
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attachment")),
        v23,
        v22,
        !v23))
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
    v57 = objc_msgSend(v56, "isNews");

    if (!v57)
      goto LABEL_60;
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
    v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "title"));
    v60 = v59 == 0;
    if (v59)
    {
      v61 = (void *)v59;
    }
    else
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));

      if (!v62)
      {
        v60 = 0;
        goto LABEL_69;
      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
      objc_msgSend(v61, "setTitle:", v58);
    }

LABEL_69:
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "summary"));
    if (v64)
    {

      if (!v60)
        goto LABEL_60;
      goto LABEL_71;
    }
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attributedContentText"));

    if (!v65)
    {
      if (!v60)
        goto LABEL_60;
LABEL_71:
      v15 = 1;
      goto LABEL_57;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attributedContentText"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "string"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
    objc_msgSend(v66, "setSummary:", v52);

    v15 = 1;
LABEL_56:

LABEL_57:
    objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", v14);
    v54 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v55 = *(_QWORD *)(v54 + 24);
    if (v55 >= v14)
      *(_QWORD *)(v54 + 24) = v55 - 1;
    --v14;
    goto LABEL_60;
  }
  v24 = *(void **)(a1 + 48);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "URL"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "getURLWithoutQueryAndFragmentFromURL:", v26));

  v28 = *(void **)(a1 + 48);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attachment"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "URL"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "getURLWithoutQueryAndFragmentFromURL:", v30));

  if (((objc_msgSend(v27, "isEqual:", v31) | v4) & 1) == 0)
  {

LABEL_60:
    goto LABEL_61;
  }
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "title"));

  if (!v70)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attachment"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "title"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
    objc_msgSend(v73, "setTitle:", v72);

  }
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attachment"));
  +[ICAttachment deleteAttachment:](ICAttachment, "deleteAttachment:", v74);

  objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", v14);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "count");

LABEL_82:
  if ((v15 & 1) != 0)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "managedObjectContext"));
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_10000BB3C;
    v77[3] = &unk_100020AC0;
    v78 = *(id *)(a1 + 32);
    objc_msgSend(v76, "performBlockAndWait:", v77);

  }
}

void sub_10000BB3C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
  objc_msgSend(v3, "setPreviewUpdateDate:", v2);

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "attachment"));
  objc_msgSend(v4, "updateChangeCountWithReason:", CFSTR("Consolidated duplicate attachment"));

}

void sub_10000BD24(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "metadata"));
  if (v2)
  {
    v11 = v2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "title"));

    if (!v3)
    {
      v4 = ICAttachmentMetadataTitleKey;
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", ICAttachmentMetadataTitleKey));

      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v4));
        objc_msgSend(*(id *)(a1 + 32), "setTitle:", v6);

      }
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "summary"));

    v2 = v11;
    if (!v7)
    {
      v8 = ICAttachmentMetadataDescriptionKey;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", ICAttachmentMetadataDescriptionKey));

      v2 = v11;
      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v8));
        objc_msgSend(*(id *)(a1 + 32), "setSummary:", v10);

        v2 = v11;
      }
    }
  }

}

intptr_t sub_10000C4FC(intptr_t result)
{
  if (*(_BYTE *)(result + 40))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
  return result;
}

intptr_t sub_10000C510(intptr_t result)
{
  if (*(_BYTE *)(result + 40))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
  return result;
}

void sub_10000C7AC(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePDF, "identifier", v1));
  v6[1] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeAudiovisualContent, "identifier"));
  v6[2] = v3;
  v4 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 3));
  v5 = (void *)qword_100028A20;
  qword_100028A20 = v4;

}

id sub_10000CC08(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void sub_10000CC14(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "appendLock"));
  objc_msgSend(v3, "unlock");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10000CC5C(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appendLock"));
  objc_msgSend(v3, "unlock");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10000CCA4(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appendLock"));
  objc_msgSend(v3, "unlock");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10000CFF4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v14 = a1;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v10 = os_log_create("com.apple.notes", "SharingExtension");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error pushing cloud objects, but trying again: %@", buf, 0xCu);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v6);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext sharedContext](ICCloudContext, "sharedContext"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000D208;
    v15[3] = &unk_100020BD0;
    v16 = *(id *)(v14 + 32);
    objc_msgSend(v11, "processAllCloudObjectsWithCompletionHandler:", v15);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    objc_msgSend(v12, "save");

    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
  }

}

uint64_t sub_10000D208(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v2, "save");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10000D630(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_10000DC40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DC88(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000DC98(uint64_t a1)
{

}

void sub_10000DCA0(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "title"));
  v3 = objc_msgSend(v2, "localizedCaseInsensitiveCompare:", *(_QWORD *)(a1 + 40));

  if (!v3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

void sub_10000E294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E2CC(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id obj;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "hasPrefix:", CFSTR("\n")) & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "noteAsPlainText"));
    v3 = objc_msgSend(v2, "hasSuffix:", CFSTR("\n"));

    if ((v3 & 1) == 0)
    {
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("\n"), "stringByAppendingString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)));
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected"))
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", ICErrorDomain, 206, 0));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICSharingExtensionAttachmentsManager sharedManager](ICSharingExtensionAttachmentsManager, "sharedManager"));
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v13 + 40);
    objc_msgSend(v10, "addString:toNote:error:", v12, v11, &obj);
    objc_storeStrong((id *)(v13 + 40), obj);

  }
}

void sub_10000E650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E684(uint64_t a1)
{
  void *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "content"));
  v3 = (char *)objc_msgSend(v2, "length");
  if ((objc_msgSend(*(id *)(a1 + 32), "isPlainText") & 1) == 0)
  {
    v3 = (char *)objc_msgSend(v2, "ic_HTMLInsertionPoint");
    v4 = ICNoteHTMLFromPlainText(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  if (v3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isPlainText"))
    {
      v8 = objc_msgSend(v2, "characterAtIndex:", v3 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
      LOBYTE(v8) = objc_msgSend(v9, "characterIsMember:", v8);

      if ((v8 & 1) != 0)
        goto LABEL_9;
      v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("\n%@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    }
    else
    {
      v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("<div>%@</div>"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    }
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
LABEL_9:
  v14 = objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v14, "insertString:atIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(*(id *)(a1 + 32), "setModificationDate:", v15);

  v16 = objc_msgSend(v14, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setContent:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "title"));
  v18 = objc_msgSend(v17, "length");

  if (!v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "text"));
    v20 = ICNoteTitleFromPlainText();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(*(id *)(a1 + 32), "setTitle:", v21);

  }
  v22 = objc_opt_class(NoteContext);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "noteContext"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "htmlNoteContext"));
  v25 = ICCheckedDynamicCast(v22, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v27 + 40);
  v28 = objc_msgSend(v26, "save:", &obj);
  objc_storeStrong((id *)(v27 + 40), obj);

  if (v28)
  {
    v29 = *(void **)(a1 + 48);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "store"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "noteContext"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "htmlNoteContext"));
    objc_msgSend(v29, "refreshNotesForCollectionWithId:andContext:", v31, v33);

  }
}

void sub_10000EBCC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EBEC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000EBFC(uint64_t a1)
{

}

id sub_10000EC04(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc_init((Class)SANoteObject);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "title"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "modificationDate"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setLastModifiedDate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "creationDate"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCreatedDate:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForNote:](ICAppURLUtilities, "appURLForNote:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setIdentifier:", v8);

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setRestricted:", objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected"));
}

id sub_10000ED00(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc_init((Class)SANoteObject);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "title"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "modificationDate"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setLastModifiedDate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "creationDate"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCreatedDate:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForHTMLNote:](ICAppURLUtilities, "appURLForHTMLNote:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setIdentifier:", v8);

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setRestricted:", 0);
}

void sub_10000F06C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F094(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:", a1[4], a1[5]));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v3 = ICProtocolCast(&OBJC_PROTOCOL___ICSearchIndexableNote, v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_10000F118(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "existingObjectWithID:error:", *(_QWORD *)(a1 + 40), 0));
  v2 = ICProtocolCast(&OBJC_PROTOCOL___ICSearchIndexableNote, v6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_10000F2C0(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "setStalenessInterval:", 0.0);
  v1 = (id)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v1, "refreshAll");

}

void sub_10000F3B8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v6 = a2;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount accountUtilities](ICAccount, "accountUtilities"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "accountId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "temporaryDirectoryURLForAccountIdentifier:", v9));

    if (!v10)
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((tempDirectoryURL) != nil)", "-[ICSharingExtensionItemExtractor extractMediaFileURLWithProvider:contentType:completion:]_block_invoke_2", 1, 0, CFSTR("Expected non-nil value for '%s'"), "tempDirectoryURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v12, 1));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByAppendingPathComponent:", v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    LOBYTE(v12) = objc_msgSend(v17, "linkItemAtURL:toURL:error:", v6, v16, 0);

    if ((v12 & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v28 = 0;
      v19 = objc_msgSend(v18, "copyItemAtURL:toURL:error:", v6, v16, &v28);
      v20 = v28;

      if ((v19 & 1) == 0)
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[[NSFileManager defaultManager] copyItemAtURL:url toURL:tempFileURL error:&copyError]", "-[ICSharingExtensionItemExtractor extractMediaFileURLWithProvider:contentType:completion:]_block_invoke_2", 1, 0, CFSTR("Extracting media file: Failed to create temporary file copy: %@"), v20);

    }
    v21 = objc_msgSend(objc_alloc((Class)ICAddAttachmentsManagerAttachmentInfo), "initWithFileURL:", v16);
    objc_msgSend(v21, "setUsesTemporaryFile:", 1);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000F6DC;
    v25[3] = &unk_100020CC0;
    v22 = *(id *)(a1 + 48);
    v26 = v21;
    v27 = v22;
    v23 = v21;
    performBlockOnMainThread(v25);

  }
  else
  {
    v24 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10001497C(a1, (uint64_t)v7, v24);

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000F6CC;
    v29[3] = &unk_100020C98;
    v30 = *(id *)(a1 + 48);
    performBlockOnMainThread(v29);
    v13 = v30;
  }

}

uint64_t sub_10000F6CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10000F6DC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_10000F810(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F8C4;
  v7[3] = &unk_100020850;
  v8 = a2;
  v9 = a3;
  v10 = *(id *)(a1 + 32);
  v5 = v9;
  v6 = v8;
  performBlockOnMainThreadAndWait(v7);

}

void sub_10000F8C4(uint64_t a1)
{
  NSObject *v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = objc_msgSend(objc_alloc((Class)ICAddAttachmentsManagerAttachmentInfo), "initWithFileURL:", *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v2 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_1000149F8(a1, v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void sub_10000FA78(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v5 = a2;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000FB60;
  v10[3] = &unk_100020D38;
  v11 = a3;
  v16 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v17 = *(_BYTE *)(a1 + 64);
  v14 = v7;
  v15 = *(id *)(a1 + 48);
  v8 = v5;
  v9 = v11;
  performBlockOnMainThreadAndWait(v10);

}

void sub_10000FB60(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_100014B7C(v2, v3, v4);

LABEL_5:
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    return;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (!v5)
  {
    v12 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100014AAC(v12);

    goto LABEL_5;
  }
  v6 = objc_opt_class(NSURL);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0 && objc_msgSend(*(id *)(a1 + 40), "isFileURL"))
  {
    v27 = objc_msgSend(objc_alloc((Class)ICAddAttachmentsManagerAttachmentInfo), "initWithFileURL:", *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_12:

    return;
  }
  v7 = *(_QWORD *)(a1 + 40);
  v8 = objc_opt_class(UIImage);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = *(void **)(a1 + 48);
    v10 = *(unsigned __int8 *)(a1 + 80);
    v11 = *(id *)(a1 + 40);
    v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getAttachmentInfoWithImage:useTempFile:", v11, v10));
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

    goto LABEL_12;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "registeredTypeIdentifiers"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
LABEL_18:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", *(_QWORD *)(a1 + 64)));
      v21 = objc_msgSend(v19, "conformsToType:", v20);

      if ((v21 & 1) != 0)
        break;
      if (v15 == (id)++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v15)
          goto LABEL_18;
        goto LABEL_24;
      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", v18));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "preferredFilenameExtension"));

    v22 = v18;
    if (!v24)
      goto LABEL_27;
    v25 = (void *)objc_opt_new(ICAddAttachmentsManagerAttachmentInfo);
    objc_msgSend(v25, "setMediaUTI:", v22);
    objc_msgSend(v25, "setMediaData:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v25, "setMediaFilenameExtension:", v24);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
  else
  {
LABEL_24:

    v22 = 0;
LABEL_27:
    v26 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_100014AEC((id *)(a1 + 56), v26);

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void sub_1000101C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10001020C(id a1)
{
  ICAnalyticsObserver *v1;
  void *v2;

  v1 = objc_alloc_init(ICAnalyticsObserver);
  v2 = (void *)qword_100028A30;
  qword_100028A30 = (uint64_t)v1;

}

void sub_100010F38(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010F64(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100010F74(uint64_t a1)
{

}

void sub_100010F7C(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICWidget sharedWidget](ICWidget, "sharedWidget"));
  v3 = objc_msgSend(v2, "hidesObject:", *(_QWORD *)(a1 + 32));

  if ((v3 & 1) == 0)
  {
    v4 = *(id *)(a1 + 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForNote:](ICAppURLUtilities, "appURLForNote:", *(_QWORD *)(a1 + 32)));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteListSortUtilities dateForCurrentSortTypeForNote:folderNoteSortType:](ICNoteListSortUtilities, "dateForCurrentSortTypeForNote:folderNoteSortType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48)));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentInfoText"));
    v10 = objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected");
    v11 = objc_msgSend(*(id *)(a1 + 32), "isSharedViaICloud");
    v12 = objc_msgSend(*(id *)(a1 + 32), "isSharedViaICloud");
    if (v12)
      LOBYTE(v12) = objc_msgSend(*(id *)(a1 + 32), "hasUnreadChanges");
    LOBYTE(v16) = v12;
    v13 = objc_msgSend(v4, "initWithIdentifier:title:date:contentInfo:isLocked:isShared:isUnread:", v6, v7, v8, v9, v10, v11, v16);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_msgSend(*(id *)(a1 + 32), "turnAttachmentsIntoFaults");
  }
}

void sub_1000110F0(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICWidget sharedWidget](ICWidget, "sharedWidget"));
  v3 = objc_msgSend(v2, "hidesObject:", *(_QWORD *)(a1 + 32));

  if ((v3 & 1) == 0)
  {
    v4 = *(id *)(a1 + 40);
    v13 = (id)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForHTMLNote:](ICAppURLUtilities, "appURLForHTMLNote:", *(_QWORD *)(a1 + 32)));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteListSortUtilities dateForCurrentSortTypeForNote:folderNoteSortType:](ICNoteListSortUtilities, "dateForCurrentSortTypeForNote:folderNoteSortType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48)));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentInfoText"));
    LOBYTE(v12) = 0;
    v9 = objc_msgSend(v4, "initWithIdentifier:title:date:contentInfo:isLocked:isShared:isUnread:", v5, v6, v7, v8, 0, 0, v12);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

void sub_1000121B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012208(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100012218(uint64_t a1)
{

}

void sub_100012220(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v6);
        v8 = objc_opt_class(ICNote);
        v9 = ICDynamicCast(v8, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = ICProtocolCast(&OBJC_PROTOCOL___ICLegacyNote, v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v11);
        if (v10 && (v14 = objc_msgSend(v10, "isVisible", (_QWORD)v16), v12 = v10, (v14 & 1) != 0)
          || v13
          && (objc_msgSend(v13, "isMarkedForDeletion", v12) & 1) == 0
          && (v15 = objc_opt_respondsToSelector(v13, "isSearchIndexableNote"), v12 = v13, (v15 & 1) != 0))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v12, (_QWORD)v16);
        }

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

void sub_1000123A4(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id obj;
  _QWORD v16[2];

  v2 = +[ICNote newFetchRequestForNotes](ICNote, "newFetchRequestForNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteListSortUtilities sortDescriptorsForCurrentType](ICNoteListSortUtilities, "sortDescriptorsForCurrentType"));
  objc_msgSend(v2, "setSortDescriptors:", v3);

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = objc_opt_class(ICFolder);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "ic_existingObjectWithID:", *(_QWORD *)(a1 + 32)));
    v6 = ICDynamicCast(v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "predicateForVisibleNotesInFolder"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote predicateForVisibleNotesInContext:](ICNote, "predicateForVisibleNotesInContext:", *(_QWORD *)(a1 + 40)));
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v16[0] = *(_QWORD *)(a1 + 48);
    v16[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));
    objc_msgSend(v2, "setPredicate:", v10);

  }
  else
  {
    objc_msgSend(v2, "setPredicate:", v8);
  }
  objc_msgSend(v2, "setFetchLimit:", kICMaximumSiriNoteCount + 1);
  v11 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v12 + 40);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executeFetchRequest:error:", v2, &obj));
  objc_storeStrong((id *)(v12 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v14 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100014C90();

  }
  if (objc_msgSend(v13, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObjectsFromArray:", v13);

}

void sub_1000125D0(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id obj;
  _BYTE v26[128];
  _QWORD v27[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NoteObject fetchRequest](NoteObject, "fetchRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteListSortUtilities sortDescriptorsForCurrentType](ICNoteListSortUtilities, "sortDescriptorsForCurrentType"));
  objc_msgSend(v2, "setSortDescriptors:", v3);

  if (a1[4])
  {
    v27[0] = a1[4];
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NoteContext visibleNotesPredicate](NoteContext, "visibleNotesPredicate"));
    v27[1] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));
    objc_msgSend(v2, "setPredicate:", v6);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NoteContext visibleNotesPredicate](NoteContext, "visibleNotesPredicate"));
    objc_msgSend(v2, "setPredicate:", v7);

  }
  objc_msgSend(v2, "setFetchLimit:", kICMaximumSiriNoteCount + 1);
  v8 = (void *)a1[5];
  v9 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v9 + 40);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "executeFetchRequest:error:", v2, &obj));
  objc_storeStrong((id *)(v9 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v11 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100014CF8();

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "store", (_QWORD)v21));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "account"));
        v20 = objc_msgSend(v19, "didChooseToMigrate");

        if ((v20 & 1) == 0)
          objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v14);
  }

}

void sub_10001287C(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  if (a1[4])
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "filteredArrayUsingPredicate:"));
    v3 = objc_msgSend(v2, "mutableCopy");
    v4 = *(_QWORD *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  if (a1[5] || a1[6])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = *(id *)(*(_QWORD *)(a1[7] + 8) + 40);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v11);
          if (a1[5])
          {
            v13 = objc_opt_class(ICNote);
            if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "folder", (_QWORD)v23));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectID"));
              v16 = objc_msgSend(v15, "isEqual:", a1[5]);

              if (v16)
                objc_msgSend(v6, "addObject:", v12);
            }
          }
          if (a1[6])
          {
            v17 = objc_opt_class(NoteObject);
            if ((objc_opt_isKindOfClass(v12, v17) & 1) != 0)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "store"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectID"));
              v20 = objc_msgSend(v19, "isEqual:", a1[6]);

              if (v20)
                objc_msgSend(v6, "addObject:", v12);
            }
          }
          objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v6);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

  }
  v21 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteListSortUtilities sortDescriptorsForCurrentType](ICNoteListSortUtilities, "sortDescriptorsForCurrentType", (_QWORD)v23));
  objc_msgSend(v21, "sortUsingDescriptors:", v22);

}

void sub_100012D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100012D74(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "noteAsPlainTextWithoutTitle"));
    if (objc_msgSend(v2, "length"))
    {
      v3 = objc_msgSend(objc_alloc((Class)INTextNoteContent), "initWithText:", v2);
      v31 = v3;
      v4 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
  v7 = objc_alloc((Class)INNote);
  v8 = objc_alloc((Class)INSpeakableString);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "title"));
  v9 = objc_msgSend(v8, "initWithSpokenPhrase:", v30);
  v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v10 = objc_alloc((Class)INSpeakableString);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "folderName"));
  v23 = objc_msgSend(v10, "initWithSpokenPhrase:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v11 = *(_QWORD *)(a1 + 56);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "creationDate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "components:fromDate:", v11, v27));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v12 = *(_QWORD *)(a1 + 56);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "modificationDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "components:fromDate:", v12, v24));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForNote:](ICAppURLUtilities, "appURLForNote:", *(_QWORD *)(a1 + 32)));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absoluteString"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "folder"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "account"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
  v19 = objc_msgSend(v7, "initWithTitle:contents:groupName:createdDateComponents:modifiedDateComponents:identifier:accountIdentifier:", v9, v26, v23, v22, v13, v15, v18);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

}

void sub_100013034(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "noteAsPlainTextWithoutTitle"));
    if (objc_msgSend(v2, "length"))
    {
      v3 = objc_msgSend(objc_alloc((Class)INTextNoteContent), "initWithText:", v2);
      v31 = v3;
      v4 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
  v7 = objc_alloc((Class)INNote);
  v8 = objc_alloc((Class)INSpeakableString);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "title"));
  v9 = objc_msgSend(v8, "initWithSpokenPhrase:", v30);
  v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v10 = objc_alloc((Class)INSpeakableString);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "folderName"));
  v23 = objc_msgSend(v10, "initWithSpokenPhrase:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v11 = *(_QWORD *)(a1 + 56);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "creationDate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "components:fromDate:", v11, v27));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v12 = *(_QWORD *)(a1 + 56);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "modificationDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "components:fromDate:", v12, v24));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForHTMLNote:](ICAppURLUtilities, "appURLForHTMLNote:", *(_QWORD *)(a1 + 32)));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absoluteString"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "store"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "account"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "accountIdentifier"));
  v19 = objc_msgSend(v7, "initWithTitle:contents:groupName:createdDateComponents:modifiedDateComponents:identifier:accountIdentifier:", v9, v26, v23, v22, v13, v15, v18);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

}

void sub_1000136A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, __int128 a10, uint64_t a11)
{
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;

  if (a2 == 1)
  {
    v12 = objc_begin_catch(exception_object);
    v13 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "externalIdentifier"));
      a9 = 138412802;
      WORD2(a10) = 2112;
      *(_QWORD *)((char *)&a10 + 6) = v14;
      HIWORD(a10) = 2112;
      a11 = (uint64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Exception raised when attempting to refresh notes for %@ with store %@: %@", (uint8_t *)&a9, 0x20u);

    }
    objc_end_catch();
    JUMPOUT(0x100013650);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000137A4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t sub_100013A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5, uint64_t a6)
{
  _QWORD v9[2];
  char v10;
  uint64_t v11;
  uint64_t v12;

  v11 = a3;
  v12 = a4();
  v9[0] = a5;
  v9[1] = a6;
  v10 = 2;
  LOBYTE(a6) = isFeatureEnabled(_:)(v9);
  sub_100013BB0(v9);
  return a6 & 1;
}

id sub_100013B18(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for ICFeatureFlags()
{
  return objc_opt_self(_TtC38com_apple_mobilenotes_IntentsExtension14ICFeatureFlags);
}

unint64_t sub_100013B6C()
{
  unint64_t result;

  result = qword_100028920;
  if (!qword_100028920)
  {
    result = swift_getWitnessTable(&unk_10001DB98, &type metadata for NotesFeature);
    atomic_store(result, (unint64_t *)&qword_100028920);
  }
  return result;
}

uint64_t sub_100013BB0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_100013BD0()
{
  unint64_t result;

  result = qword_100028928;
  if (!qword_100028928)
  {
    result = swift_getWitnessTable(&unk_10001DB68, &type metadata for UniquelyiPadFeature);
    atomic_store(result, (unint64_t *)&qword_100028928);
  }
  return result;
}

unint64_t sub_100013C14()
{
  unint64_t result;

  result = qword_100028930;
  if (!qword_100028930)
  {
    result = swift_getWitnessTable(&unk_10001DB38, &type metadata for SiriSMARTFeature);
    atomic_store(result, (unint64_t *)&qword_100028930);
  }
  return result;
}

unint64_t sub_100013C58()
{
  unint64_t result;

  result = qword_100028938;
  if (!qword_100028938)
  {
    result = swift_getWitnessTable(&unk_10001DB08, &type metadata for GreyParrotFeature);
    atomic_store(result, (unint64_t *)&qword_100028938);
  }
  return result;
}

unint64_t sub_100013C9C()
{
  unint64_t result;

  result = qword_100028940;
  if (!qword_100028940)
  {
    result = swift_getWitnessTable(&unk_10001DAD8, &type metadata for TelephonyUtilitiesFeature);
    atomic_store(result, (unint64_t *)&qword_100028940);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for TelephonyUtilitiesFeature(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for TelephonyUtilitiesFeature()
{
  return &type metadata for TelephonyUtilitiesFeature;
}

ValueMetadata *type metadata accessor for GreyParrotFeature()
{
  return &type metadata for GreyParrotFeature;
}

ValueMetadata *type metadata accessor for SiriSMARTFeature()
{
  return &type metadata for SiriSMARTFeature;
}

ValueMetadata *type metadata accessor for UniquelyiPadFeature()
{
  return &type metadata for UniquelyiPadFeature;
}

uint64_t getEnumTagSinglePayload for NotesFeature(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for NotesFeature(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for NotesFeature()
{
  return &type metadata for NotesFeature;
}

const char *sub_100013D94()
{
  return "Notes";
}

uint64_t sub_100013DA8()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_100013DB4(uint64_t a1, uint64_t a2)
{
  return sub_100013EAC(a1, a2, (uint64_t)"Notes", 5);
}

uint64_t sub_100013DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100014044(a1, a2, a3, (uint64_t (*)(void))sub_100013B6C, (uint64_t (*)(void))sub_100013DD8);
}

unint64_t sub_100013DD8()
{
  unint64_t result;

  result = qword_100028948;
  if (!qword_100028948)
  {
    result = swift_getWitnessTable("}8", &type metadata for NotesFeature);
    atomic_store(result, (unint64_t *)&qword_100028948);
  }
  return result;
}

const char *sub_100013E1C()
{
  return "TelephonyUtilities";
}

uint64_t sub_100013E30(uint64_t a1, uint64_t a2)
{
  return sub_100013EAC(a1, a2, (uint64_t)"TelephonyUtilities", 18);
}

const char *sub_100013E40()
{
  return "GreyParrot";
}

uint64_t sub_100013E54(uint64_t a1, uint64_t a2)
{
  return sub_100013EAC(a1, a2, (uint64_t)"GreyParrot", 10);
}

const char *sub_100013E64()
{
  return "ResponseFramework";
}

uint64_t sub_100013E78(uint64_t a1, uint64_t a2)
{
  return sub_100013EAC(a1, a2, (uint64_t)"ResponseFramework", 17);
}

const char *sub_100013E88()
{
  return "UIKit";
}

uint64_t sub_100013E9C(uint64_t a1, uint64_t a2)
{
  return sub_100013EAC(a1, a2, (uint64_t)"UIKit", 5);
}

uint64_t sub_100013EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::String v8;
  Swift::String v9;
  void *object;
  uint64_t v12;

  v5 = *v4;
  v6 = v4[1];
  v7 = *((unsigned __int8 *)v4 + 16);
  v12 = StaticString.description.getter(a3, a4, 2);
  v8._countAndFlagsBits = 47;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  v9._countAndFlagsBits = StaticString.description.getter(v5, v6, v7);
  object = v9._object;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(object);
  return v12;
}

uint64_t sub_100013F28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100014044(a1, a2, a3, (uint64_t (*)(void))sub_100013BD0, (uint64_t (*)(void))sub_100013F3C);
}

unint64_t sub_100013F3C()
{
  unint64_t result;

  result = qword_100028950;
  if (!qword_100028950)
  {
    result = swift_getWitnessTable(&unk_10001D9C8, &type metadata for UniquelyiPadFeature);
    atomic_store(result, (unint64_t *)&qword_100028950);
  }
  return result;
}

uint64_t sub_100013F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100014044(a1, a2, a3, (uint64_t (*)(void))sub_100013C14, (uint64_t (*)(void))sub_100013F94);
}

unint64_t sub_100013F94()
{
  unint64_t result;

  result = qword_100028958;
  if (!qword_100028958)
  {
    result = swift_getWitnessTable(&unk_10001DA0C, &type metadata for SiriSMARTFeature);
    atomic_store(result, (unint64_t *)&qword_100028958);
  }
  return result;
}

uint64_t sub_100013FD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100014044(a1, a2, a3, (uint64_t (*)(void))sub_100013C58, (uint64_t (*)(void))sub_100013FEC);
}

unint64_t sub_100013FEC()
{
  unint64_t result;

  result = qword_100028960;
  if (!qword_100028960)
  {
    result = swift_getWitnessTable(&unk_10001DA50, &type metadata for GreyParrotFeature);
    atomic_store(result, (unint64_t *)&qword_100028960);
  }
  return result;
}

uint64_t sub_100014030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100014044(a1, a2, a3, (uint64_t (*)(void))sub_100013C9C, (uint64_t (*)(void))sub_100014074);
}

uint64_t sub_100014044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = a4();
  result = a5();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_100014074()
{
  unint64_t result;

  result = qword_100028968;
  if (!qword_100028968)
  {
    result = swift_getWitnessTable(&unk_10001DA94, &type metadata for TelephonyUtilitiesFeature);
    atomic_store(result, (unint64_t *)&qword_100028968);
  }
  return result;
}

uint64_t sub_1000140C4()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC38com_apple_mobilenotes_IntentsExtensionP33_A921802CC7A57BFB199FAD1B9BB98C9E19ResourceBundleClass);
}

void sub_1000140F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005710();
  sub_1000056F8((void *)&_mh_execute_header, v0, v1, "Releasing object creation locking background assertion", v2, v3, v4, v5, v6);
  sub_100005708();
}

void sub_100014120()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005710();
  sub_1000056F8((void *)&_mh_execute_header, v0, v1, "Releasing database locking background assertion", v2, v3, v4, v5, v6);
  sub_100005708();
}

void sub_10001414C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005710();
  sub_1000056F8((void *)&_mh_execute_header, v0, v1, "Finishing database-locking operation", v2, v3, v4, v5, v6);
  sub_100005708();
}

void sub_100014178()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005710();
  sub_1000056F8((void *)&_mh_execute_header, v0, v1, "Finishing object creation-locking operation", v2, v3, v4, v5, v6);
  sub_100005708();
}

void sub_1000141A4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unknown object type — returning nil {objectID: %@}", buf, 0xCu);

}

void sub_1000141F8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create note: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001426C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008A50((void *)&_mh_execute_header, a1, a3, "No managed object context — returning no items", a5, a6, a7, a8, 0);
  sub_100005708();
}

void sub_10001429C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008A68();
  sub_100008A40((void *)&_mh_execute_header, v0, v1, "Note does not exist — skipping {objectID: %@}", v2, v3, v4, v5, v6);
  sub_100008A60();
}

void sub_1000142FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008A68();
  sub_100008A40((void *)&_mh_execute_header, v0, v1, "Unknown object type — skipping {objectID: %@}", v2, v3, v4, v5, v6);
  sub_100008A60();
}

void sub_10001435C(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot create folder list section identifier — skipping {objectID: %@}", buf, 0xCu);

}

void sub_1000143B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008A50((void *)&_mh_execute_header, a1, a3, "No managed object context — returning nil default note", a5, a6, a7, a8, 0);
  sub_100005708();
}

void sub_1000143E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008A68();
  sub_100008A40((void *)&_mh_execute_header, v0, v1, "Note does not exist — returning nil default note {objectID: %@}", v2, v3, v4, v5, v6);
  sub_100008A60();
}

void sub_100014444()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008A68();
  sub_100008A40((void *)&_mh_execute_header, v0, v1, "Unknown object type — returning nil default note {objectID: %@}", v2, v3, v4, v5, v6);
  sub_100008A60();
}

void sub_1000144A4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No managed object context — returning no items", v1, 2u);
}

void sub_1000144E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008A40((void *)&_mh_execute_header, a2, a3, "Container does not exist — skipping {itemID: %@}", a5, a6, a7, a8, 2u);
}

void sub_10001454C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008A40((void *)&_mh_execute_header, a2, a3, "Unknown item identifier type — skipping {itemID: %@}", a5, a6, a7, a8, 2u);
}

void sub_1000145B4()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100008A68();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Extracting attachments from input items: %@", v1, 0xCu);
  sub_100008A60();
}

void sub_100014620(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
  sub_10000D63C();
  sub_10000D630((void *)&_mh_execute_header, a2, v4, "Can't load item for type identifier %@: %@", v5);

  sub_10000D654();
}

void sub_1000146B4(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTF, "identifier"));
  sub_10000D63C();
  sub_10000D630((void *)&_mh_execute_header, a2, v4, "Can't load item for type identifier %@: %@", v5);

  sub_10000D654();
}

void sub_100014748(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePlainText, "identifier"));
  sub_10000D63C();
  sub_10000D630((void *)&_mh_execute_header, a2, v4, "Can't load item for type identifier %@: %@", v5);

  sub_10000D654();
}

void sub_1000147DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008A68();
  sub_100008A40((void *)&_mh_execute_header, v0, v1, "Error unarchiving data: %@", v2, v3, v4, v5, v6);
  sub_100008A60();
}

void sub_10001483C()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 138412546;
  sub_10000D664();
  sub_10000D630((void *)&_mh_execute_header, v0, v1, "Can't load item for type identifier %@: %@", (uint8_t *)v2);
  sub_100008A60();
}

void sub_1000148AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008A68();
  sub_100008A40((void *)&_mh_execute_header, v0, v1, "Can't determine how to handle url that is not a string or a URL %@", v2, v3, v4, v5, v6);
  sub_100008A60();
}

void sub_10001490C()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 138412546;
  sub_10000D664();
  sub_10000D630((void *)&_mh_execute_header, v0, v1, "Can't load item for type identifier %@: %@", (uint8_t *)v2);
  sub_100008A60();
}

void sub_10001497C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  sub_10000D630((void *)&_mh_execute_header, a3, (uint64_t)a3, "Extracting media file: Error loading file representation for content type %@ - error: %@", (uint8_t *)&v4);
  sub_100008A60();
}

void sub_1000149F8(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeFileURL, "identifier"));
  v5 = *(_QWORD *)(a1 + 40);
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  sub_10000D630((void *)&_mh_execute_header, a2, v6, "Extracting URL: Error loading item for type identifier %@ - error: %@", (uint8_t *)&v7);

}

void sub_100014AAC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Provided item is nil.", v1, 2u);
}

void sub_100014AEC(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "registeredTypeIdentifiers"));
  v5 = 138412290;
  v6 = v3;
  sub_1000101C0((void *)&_mh_execute_header, a2, v4, "Error: could not find extension in %@", (uint8_t *)&v5);

}

void sub_100014B7C(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  sub_1000101C0((void *)&_mh_execute_header, a2, a3, "Error loading item: %@", (uint8_t *)&v4);
  sub_100008A60();
}

void sub_100014BE8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_1000101C0((void *)&_mh_execute_header, a2, a3, "Cannot save temporary file to disk: %@", (uint8_t *)&v3);
  sub_100008A60();
}

void sub_100014C50(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "notesWithText:... completed", v1, 2u);
}

void sub_100014C90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000137A4(__stack_chk_guard);
  sub_100008A40((void *)&_mh_execute_header, v0, v1, "Error fetching all modern notes %@", v2, v3, v4, v5, 2u);
}

void sub_100014CF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000137A4(__stack_chk_guard);
  sub_100008A40((void *)&_mh_execute_header, v0, v1, "Error fetching all HTML notes %@", v2, v3, v4, v5, 2u);
}

void sub_100014D60(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;

  v4 = objc_begin_catch(a1);
  v5 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = a3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Exception raised when attempting to refresh notes for %@: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_end_catch();
}

id objc_msgSend_ICTintColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ICTintColor");
}

id objc_msgSend_URIRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URIRepresentation");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemImageNamed:withConfiguration:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "account");
}

id objc_msgSend_accountId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountId");
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountIdentifier");
}

id objc_msgSend_accountUtilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountUtilities");
}

id objc_msgSend_acquireWithInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireWithInvalidationHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addString_toNote_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addString:toNote:error:");
}

id objc_msgSend_addURLAttachmentWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addURLAttachmentWithURL:");
}

id objc_msgSend_allItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allItems");
}

id objc_msgSend_allItemsFolderLocalizedTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allItemsFolderLocalizedTitle");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_appSessionDidTerminate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appSessionDidTerminate");
}

id objc_msgSend_appURLForDefaultFolder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appURLForDefaultFolder");
}

id objc_msgSend_appURLForFolder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appURLForFolder:");
}

id objc_msgSend_appURLForHTMLFolder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appURLForHTMLFolder:");
}

id objc_msgSend_appURLForHTMLNote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appURLForHTMLNote:");
}

id objc_msgSend_appURLForNote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appURLForNote:");
}

id objc_msgSend_appURLForVirtualSmartFolder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appURLForVirtualSmartFolder:");
}

id objc_msgSend_appendAttributedString_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendAttributedString:error:");
}

id objc_msgSend_appendLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendLock");
}

id objc_msgSend_appendMediaItemWithItemProvider_attachments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendMediaItemWithItemProvider:attachments:");
}

id objc_msgSend_appendString_toNote_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:toNote:error:");
}

id objc_msgSend_applicationDocumentsURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationDocumentsURL");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachment");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachments");
}

id objc_msgSend_attribute_atIndex_effectiveRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attribute:atIndex:effectiveRange:");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_attributedContentText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedContentText");
}

id objc_msgSend_attributedTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedTitle");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_basicAccountIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "basicAccountIdentifier");
}

id objc_msgSend_canAddAttachments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canAddAttachments:");
}

id objc_msgSend_cancelEverythingWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelEverythingWithCompletionHandler:");
}

id objc_msgSend_cancelIndexingOperationsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelIndexingOperationsWithCompletionHandler:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_collectionForObjectID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionForObjectID:");
}

id objc_msgSend_completeExtensionRequestInBackground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeExtensionRequestInBackground");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_configurationWithScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithScale:");
}

id objc_msgSend_confirmationRequiredWithNoteToConfirm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmationRequiredWithNoteToConfirm:");
}

id objc_msgSend_conformsToType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToType:");
}

id objc_msgSend_consolidateDuplicateAttachments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "consolidateDuplicateAttachments:");
}

id objc_msgSend_containsOnlyRawImageDataInProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsOnlyRawImageDataInProvider:");
}

id objc_msgSend_containsOnlyRawImagesInExtensionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsOnlyRawImagesInExtensionContext:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content");
}

id objc_msgSend_contentInfoText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentInfoText");
}

id objc_msgSend_contextContainsOnlyRawImages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextContainsOnlyRawImages");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createTempFileFromImage_populateAttachmentInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createTempFileFromImage:populateAttachmentInfo:");
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "creationDate");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentProcess");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateForCurrentSortTypeForNote_folderNoteSortType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateForCurrentSortTypeForNote:folderNoteSortType:");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateSearchType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateSearchType");
}

id objc_msgSend_dateTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateTime");
}

id objc_msgSend_dbWriteLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dbWriteLock");
}

id objc_msgSend_dbWriteLockfd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dbWriteLockfd");
}

id objc_msgSend_dbWriteUnlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dbWriteUnlock");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultFolderInContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultFolderInContext:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultSystemImageName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSystemImageName");
}

id objc_msgSend_deleteAttachment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAttachment:");
}

id objc_msgSend_depth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "depth");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didChooseToMigrate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChooseToMigrate");
}

id objc_msgSend_disambiguationWithIntentNotesFoldersToDisambiguate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disambiguationWithIntentNotesFoldersToDisambiguate:");
}

id objc_msgSend_disambiguationWithIntentNotesToDisambiguate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disambiguationWithIntentNotesToDisambiguate:");
}

id objc_msgSend_disambiguationWithNotesToDisambiguate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disambiguationWithNotesToDisambiguate:");
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayString");
}

id objc_msgSend_enableChangeLogging_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableChangeLogging:");
}

id objc_msgSend_enableHTMLContextChangeLogging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableHTMLContextChangeLogging");
}

id objc_msgSend_endDateComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDateComponents");
}

id objc_msgSend_endSessionSynchronously_endReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSessionSynchronously:endReason:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventReporter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventReporter");
}

id objc_msgSend_exactMatchingQueryStringForTitleSearchString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exactMatchingQueryStringForTitleSearchString:");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_existingObjectWithID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingObjectWithID:error:");
}

id objc_msgSend_externalIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalIdentifier");
}

id objc_msgSend_extractAttachmentsFromInputItems_note_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractAttachmentsFromInputItems:note:");
}

id objc_msgSend_extractDataWithProvider_forUTI_useTempFile_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractDataWithProvider:forUTI:useTempFile:withCompletion:");
}

id objc_msgSend_extractMediaFileURLWithProvider_contentType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractMediaFileURLWithProvider:contentType:completion:");
}

id objc_msgSend_extractURLWithProvider_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractURLWithProvider:withCompletion:");
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequest");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fillOutTitleAndSummaryForAttachments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fillOutTitleAndSummaryForAttachments:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_findNoteForIntent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findNoteForIntent:");
}

id objc_msgSend_finishRemainingOperationsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishRemainingOperationsWithCompletionHandler:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstRelevantItemIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstRelevantItemIdentifier");
}

id objc_msgSend_folder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "folder");
}

id objc_msgSend_folderForGroupName_withNoteContext_htmlNoteContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "folderForGroupName:withNoteContext:htmlNoteContext:");
}

id objc_msgSend_folderIndexer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "folderIndexer");
}

id objc_msgSend_folderName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "folderName");
}

id objc_msgSend_folderOptionsForModernContext_htmlContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "folderOptionsForModernContext:htmlContext:");
}

id objc_msgSend_fullTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullTitle");
}

id objc_msgSend_getAttachmentInfoWithImage_useTempFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAttachmentInfoWithImage:useTempFile:");
}

id objc_msgSend_getURLWithoutQueryAndFragmentFromURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getURLWithoutQueryAndFragmentFromURL:");
}

id objc_msgSend_groupName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupName");
}

id objc_msgSend_handleFailedAssertWithCondition_functionName_simulateCrash_showAlert_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:");
}

id objc_msgSend_hasItemConformingToTypeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasItemConformingToTypeIdentifier:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hasUnreadChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasUnreadChanges");
}

id objc_msgSend_hidesObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hidesObject:");
}

id objc_msgSend_htmlManagedObjectContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "htmlManagedObjectContext");
}

id objc_msgSend_htmlNoteContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "htmlNoteContext");
}

id objc_msgSend_ic_HTMLInsertionPoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_HTMLInsertionPoint");
}

id objc_msgSend_ic_JPEGData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_JPEGData");
}

id objc_msgSend_ic_addNonNilObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_addNonNilObject:");
}

id objc_msgSend_ic_briefFormattedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_briefFormattedDate");
}

id objc_msgSend_ic_compactMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_compactMap:");
}

id objc_msgSend_ic_cropRectZeroAlpha(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_cropRectZeroAlpha");
}

id objc_msgSend_ic_existingObjectWithID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_existingObjectWithID:");
}

id objc_msgSend_ic_imageFromRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_imageFromRect:");
}

id objc_msgSend_ic_isLegacyAccountType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_isLegacyAccountType");
}

id objc_msgSend_ic_isLegacyContainerType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_isLegacyContainerType");
}

id objc_msgSend_ic_isLegacyFolderType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_isLegacyFolderType");
}

id objc_msgSend_ic_isLegacyNoteType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_isLegacyNoteType");
}

id objc_msgSend_ic_isModernAccountProxyType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_isModernAccountProxyType");
}

id objc_msgSend_ic_isModernAccountType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_isModernAccountType");
}

id objc_msgSend_ic_isModernContainerType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_isModernContainerType");
}

id objc_msgSend_ic_isModernFolderType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_isModernFolderType");
}

id objc_msgSend_ic_isModernNoteType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_isModernNoteType");
}

id objc_msgSend_ic_managedObjectIDForURIString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_managedObjectIDForURIString:");
}

id objc_msgSend_ic_map_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_map:");
}

id objc_msgSend_ic_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_objectsPassingTest:");
}

id objc_msgSend_ic_refreshObject_mergeChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_refreshObject:mergeChanges:");
}

id objc_msgSend_ic_scaledImageMinDimension_scale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ic_scaledImageMinDimension:scale:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "image");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageWithImageData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithImageData:");
}

id objc_msgSend_imageWithTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithTintColor:");
}

id objc_msgSend_imageWithUIImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithUIImage:");
}

id objc_msgSend_includeAllNoteContents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "includeAllNoteContents");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_initWithActivityType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityType:");
}

id objc_msgSend_initWithCode_userActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCode:userActivity:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileURL:");
}

id objc_msgSend_initWithIdentifier_displayString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:displayString:");
}

id objc_msgSend_initWithIdentifier_title_date_contentInfo_isLocked_isShared_isUnread_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:title:date:contentInfo:isLocked:isShared:isUnread:");
}

id objc_msgSend_initWithIdentifier_title_depth_shareDescription_systemImageName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:title:depth:shareDescription:systemImageName:");
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItems:");
}

id objc_msgSend_initWithLegacyManagedObjectContext_modernManagedObjectContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLegacyManagedObjectContext:modernManagedObjectContext:");
}

id objc_msgSend_initWithModernNoteContext_htmlNoteContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithModernNoteContext:htmlNoteContext:");
}

id objc_msgSend_initWithNoteContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNoteContext:");
}

id objc_msgSend_initWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObject:");
}

id objc_msgSend_initWithQueryString_rankingQueries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueryString:rankingQueries:");
}

id objc_msgSend_initWithSearchSuggestionsResponder_searchString_performNLSearch_performTopHitSearch_tokens_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSearchSuggestionsResponder:searchString:performNLSearch:performTopHitSearch:tokens:");
}

id objc_msgSend_initWithSections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSections:");
}

id objc_msgSend_initWithSpokenPhrase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSpokenPhrase:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithSubTrackerName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSubTrackerName:");
}

id objc_msgSend_initWithText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithText:");
}

id objc_msgSend_initWithTitle_contents_groupName_createdDateComponents_modifiedDateComponents_identifier_accountIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:contents:groupName:createdDateComponents:modifiedDateComponents:identifier:accountIdentifier:");
}

id objc_msgSend_initWithTitle_items_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:items:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_initWithVirtualSmartFolder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithVirtualSmartFolder:");
}

id objc_msgSend_initWithVocabularyIdentifier_spokenPhrase_pronunciationHint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:");
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputItems");
}

id objc_msgSend_insertString_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertString:atIndex:");
}

id objc_msgSend_intentNoteForSearchIndexableNote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intentNoteForSearchIndexableNote:");
}

id objc_msgSend_intentNoteForSearchIndexableNote_includeContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intentNoteForSearchIndexableNote:includeContent:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAppStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppStore");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFileURL");
}

id objc_msgSend_isMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMap");
}

id objc_msgSend_isMarkedForDeletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMarkedForDeletion");
}

id objc_msgSend_isModernNote(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isModernNote");
}

id objc_msgSend_isNews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNews");
}

id objc_msgSend_isOptedInForAnalytics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOptedInForAnalytics");
}

id objc_msgSend_isPasswordProtected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasswordProtected");
}

id objc_msgSend_isPlainText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlainText");
}

id objc_msgSend_isPodcasts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPodcasts");
}

id objc_msgSend_isSharedViaICloud(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSharedViaICloud");
}

id objc_msgSend_isShowHTMLNoteURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isShowHTMLNoteURL:");
}

id objc_msgSend_isShowNoteURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isShowNoteURL:");
}

id objc_msgSend_isURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isURL");
}

id objc_msgSend_isVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVisible");
}

id objc_msgSend_isiTunes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isiTunes");
}

id objc_msgSend_itemIdentifiersInSectionWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemIdentifiersInSectionWithIdentifier:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_legacyContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "legacyContext");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_linkItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linkItemAtURL:toURL:error:");
}

id objc_msgSend_loadFileRepresentationForContentType_openInPlace_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadFileRepresentationForContentType:openInPlace:completionHandler:");
}

id objc_msgSend_loadItemForTypeIdentifier_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadItemForTypeIdentifier:options:completionHandler:");
}

id objc_msgSend_localizedCaseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedCaseInsensitiveCompare:");
}

id objc_msgSend_localizedCaseInsensitiveContainsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedCaseInsensitiveContainsString:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedTitle");
}

id objc_msgSend_localizedTitleForDefaultFolder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedTitleForDefaultFolder");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedObjectContext");
}

id objc_msgSend_managedObjectID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedObjectID");
}

id objc_msgSend_managedObjectIDForURIRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedObjectIDForURIRepresentation:");
}

id objc_msgSend_maxNoteAttachments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxNoteAttachments");
}

id objc_msgSend_maximumNumberOfNotesPerAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumNumberOfNotesPerAccount");
}

id objc_msgSend_mediaURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaURL");
}

id objc_msgSend_mediaUTI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaUTI");
}

id objc_msgSend_mediaUTIs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaUTIs");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_modernContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modernContext");
}

id objc_msgSend_modernManagedObjectContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modernManagedObjectContext");
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modificationDate");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_needsValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsValue");
}

id objc_msgSend_newFetchRequestForNotes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newFetchRequestForNotes");
}

id objc_msgSend_newNoteWithString_inFolder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newNoteWithString:inFolder:error:");
}

id objc_msgSend_newOperationQueueWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newOperationQueueWithName:");
}

id objc_msgSend_newSnapshotFromIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newSnapshotFromIndex");
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newlineCharacterSet");
}

id objc_msgSend_notRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notRequired");
}

id objc_msgSend_note(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "note");
}

id objc_msgSend_noteAsPlainText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noteAsPlainText");
}

id objc_msgSend_noteAsPlainTextWithoutTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noteAsPlainTextWithoutTitle");
}

id objc_msgSend_noteContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noteContext");
}

id objc_msgSend_noteWithIdentifier_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noteWithIdentifier:context:");
}

id objc_msgSend_notesMatchingPredicate_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notesMatchingPredicate:context:");
}

id objc_msgSend_notesWithText_title_fromDate_toDate_dateSearchType_modernFolderID_legacyFolderID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notesWithText:title:fromDate:toDate:dateSearchType:modernFolderID:legacyFolderID:");
}

id objc_msgSend_notesWithTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notesWithTitle:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectID");
}

id objc_msgSend_objectIDURIRepresentationForHTMLNoteMentionedInURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectIDURIRepresentationForHTMLNoteMentionedInURL:");
}

id objc_msgSend_objectsForSearchableItems_inContexts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectsForSearchableItems:inContexts:");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_paragraphStyleNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "paragraphStyleNamed:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_performWithTitle_contents_container_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performWithTitle:contents:container:error:");
}

id objc_msgSend_persistentContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentContainer");
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentStoreCoordinator");
}

id objc_msgSend_predicateForNotesMentionedInURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForNotesMentionedInURL:");
}

id objc_msgSend_predicateForVisibleNotesInContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForVisibleNotesInContext:");
}

id objc_msgSend_predicateForVisibleNotesInFolder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForVisibleNotesInFolder");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferSingleLine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferSingleLine");
}

id objc_msgSend_preferredFilenameExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFilenameExtension");
}

id objc_msgSend_prefixMatchingQueryStringForSearchString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefixMatchingQueryStringForSearchString:");
}

id objc_msgSend_processAllCloudObjectsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processAllCloudObjectsWithCompletionHandler:");
}

id objc_msgSend_provideFolderOptionsCollectionForNotesFolder_searchTerm_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provideFolderOptionsCollectionForNotesFolder:searchTerm:withCompletion:");
}

id objc_msgSend_provideNoteOptionsCollectionForNote_searchTerm_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provideNoteOptionsCollectionForNote:searchTerm:withCompletion:");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_readLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readLock");
}

id objc_msgSend_recentNotesIndexer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recentNotesIndexer");
}

id objc_msgSend_recentNotesWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recentNotesWithCompletion:");
}

id objc_msgSend_refreshAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshAll");
}

id objc_msgSend_refreshAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshAllObjects");
}

id objc_msgSend_refreshAllOfNoteWithIdentifier_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshAllOfNoteWithIdentifier:context:");
}

id objc_msgSend_refreshManagedObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshManagedObjects");
}

id objc_msgSend_refreshNotesForCollectionWithId_andContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshNotesForCollectionWithId:andContext:");
}

id objc_msgSend_registeredTypeIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registeredTypeIdentifiers");
}

id objc_msgSend_reloadData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadData:");
}

id objc_msgSend_reloadDataAndWait(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadDataAndWait");
}

id objc_msgSend_reloadTimelinesWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadTimelinesWithReason:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "results");
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "save");
}

id objc_msgSend_save_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "save:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_searchIndexableNoteForIntentNote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchIndexableNoteForIntentNote:");
}

id objc_msgSend_searchIndexableNoteForObject_modernNoteContext_htmlNoteContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchIndexableNoteForObject:modernNoteContext:htmlNoteContext:");
}

id objc_msgSend_searchableItemsWithText_title_fromDate_toDate_dateSearchType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchableItemsWithText:title:fromDate:toDate:dateSearchType:");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryLabelColor");
}

id objc_msgSend_sectionIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sectionIdentifiers");
}

id objc_msgSend_setAnalyticsObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnalyticsObserver:");
}

id objc_msgSend_setAppendLock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppendLock:");
}

id objc_msgSend_setAttachment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttachment:");
}

id objc_msgSend_setAttributedContentText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedContentText:");
}

id objc_msgSend_setContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContent:");
}

id objc_msgSend_setContextContainsOnlyRawImages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContextContainsOnlyRawImages:");
}

id objc_msgSend_setCreatedDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCreatedDate:");
}

id objc_msgSend_setCreatedNote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCreatedNote:");
}

id objc_msgSend_setCreationDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCreationDate:");
}

id objc_msgSend_setDbWriteLockfd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDbWriteLockfd:");
}

id objc_msgSend_setDisplayImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayImage:");
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchLimit:");
}

id objc_msgSend_setFolder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFolder:");
}

id objc_msgSend_setFragment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFragment:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setLastModifiedDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastModifiedDate:");
}

id objc_msgSend_setLastNotifiedTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastNotifiedTimestamp:");
}

id objc_msgSend_setMaximumNumberOfNotesPerAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumNumberOfNotesPerAccount:");
}

id objc_msgSend_setMediaData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaData:");
}

id objc_msgSend_setMediaFilenameExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaFilenameExtension:");
}

id objc_msgSend_setMediaURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaURL:");
}

id objc_msgSend_setMediaUTI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaUTI:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setModificationDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModificationDate:");
}

id objc_msgSend_setNeedsInitialFetchFromCloud_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsInitialFetchFromCloud:");
}

id objc_msgSend_setNeedsRefresh_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsRefresh:");
}

id objc_msgSend_setNote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNote:");
}

id objc_msgSend_setNotes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotes:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPreviewUpdateDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviewUpdateDate:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQuery:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setStalenessInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStalenessInterval:");
}

id objc_msgSend_setSubtitleString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubtitleString:");
}

id objc_msgSend_setSummary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSummary:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUserActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserActivity:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUsesTemporaryFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsesTemporaryFile:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupNoteContextWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupNoteContextWithOptions:");
}

id objc_msgSend_shareDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareDescription");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedContext");
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedController");
}

id objc_msgSend_sharedIndexer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedIndexer");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedObserver");
}

id objc_msgSend_sharedWidget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedWidget");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sortDescriptors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptors");
}

id objc_msgSend_sortDescriptorsForCurrentType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorsForCurrentType");
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingDescriptors:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_spokenPhrase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spokenPhrase");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startAppSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAppSession");
}

id objc_msgSend_startDateComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDateComponents");
}

id objc_msgSend_startSessionWithReferralURL_referralApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSessionWithReferralURL:referralApplication:");
}

id objc_msgSend_startSharedContextWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSharedContextWithOptions:");
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "store");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByEscapingSearchString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByEscapingSearchString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_submitAttachmentAddEventForAttachment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitAttachmentAddEventForAttachment:");
}

id objc_msgSend_submitNoteCreateEventForSearchIndexableNote_createApproach_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitNoteCreateEventForSearchIndexableNote:createApproach:");
}

id objc_msgSend_successWithResolvedIntentNote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedIntentNote:");
}

id objc_msgSend_successWithResolvedIntentNotesFolder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedIntentNotesFolder:");
}

id objc_msgSend_successWithResolvedNote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedNote:");
}

id objc_msgSend_successWithResolvedNoteContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedNoteContent:");
}

id objc_msgSend_successWithResolvedString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedString:");
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "summary");
}

id objc_msgSend_syncChangesToCloudWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncChangesToCloudWithCompletionHandler:");
}

id objc_msgSend_systemImageName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageName");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_targetNote(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetNote");
}

id objc_msgSend_temporaryDirectoryURLForAccountIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporaryDirectoryURLForAccountIdentifier:");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_textStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textStorage");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamp");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_titleFromExtensionItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleFromExtensionItem:");
}

id objc_msgSend_typeWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeWithIdentifier:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_unsupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsupported");
}

id objc_msgSend_updateAttachmentPreviewImageWithImage_scale_scaleWhenDrawing_metadata_sendNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAttachmentPreviewImageWithImage:scale:scaleWhenDrawing:metadata:sendNotification:");
}

id objc_msgSend_updateChangeCountWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateChangeCountWithReason:");
}

id objc_msgSend_updateContentsOfAllFoldersForAccountID_andDataclass_isUserRequested_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContentsOfAllFoldersForAccountID:andDataclass:isUserRequested:");
}

id objc_msgSend_updateContentsOfFoldersWithKeys_forAccountID_andDataclass_isUserRequested_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContentsOfFoldersWithKeys:forAccountID:andDataclass:isUserRequested:");
}

id objc_msgSend_updateHTMLNote_withIntent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateHTMLNote:withIntent:");
}

id objc_msgSend_updateModernNote_withIntent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateModernNote:withIntent:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_visibleNotesPredicate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleNotesPredicate");
}

id objc_msgSend_vocabularyIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vocabularyIdentifier");
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilAllOperationsAreFinished");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceCharacterSet");
}

id objc_msgSend_workerManagedObjectContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workerManagedObjectContext");
}

id objc_msgSend_writeLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeLock");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}
