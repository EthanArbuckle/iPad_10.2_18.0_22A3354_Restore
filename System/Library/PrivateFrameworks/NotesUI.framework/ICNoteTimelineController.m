@implementation ICNoteTimelineController

id __65__ICNoteTimelineController_sanitizedDatesForDates_referenceDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  id v6;
  id v7;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    objc_storeStrong(v5, v4);
    v6 = v4;
  }
  else
  {
    v6 = *v5;
    if (!*v5)
    {
      objc_storeStrong(v5, *(id *)(a1 + 32));
      v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
  }
  v7 = v6;

  return v7;
}

BOOL __65__ICNoteTimelineController_sanitizedDatesForDates_referenceDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

+ (id)timelineSectionsForNoteObjectIDs:(id)a3 dates:(id)a4 referenceDate:(id)a5 direction:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10 && v11 && (v13 = objc_msgSend(v10, "count"), v13 == objc_msgSend(v11, "count")))
  {
    objc_msgSend(a1, "adjustedDateForReferenceDate:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sanitizedDatesForDates:referenceDate:", v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6 == 1)
    {
      objc_msgSend(v10, "reverseObjectEnumerator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allObjects");
      v17 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "reverseObjectEnumerator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allObjects");
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = v10;
      v19 = v15;
    }
    +[ICNoteTimelineControllerInternal ascendingTimelineSectionsForNoteObjectIds:dates:referenceDate:direction:](_TtC7NotesUI32ICNoteTimelineControllerInternal, "ascendingTimelineSectionsForNoteObjectIds:dates:referenceDate:direction:", v17, v19, v14, a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a6 == 1)
    {
      objc_msgSend(v22, "reverseObjectEnumerator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "allObjects");
      v25 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v25;
    }
    v26 = (void *)MEMORY[0x1E0C9AA60];
    if (v23)
      v26 = v23;
    v21 = v26;

  }
  else
  {
    v20 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[ICNoteTimelineController timelineSectionsForNoteObjectIDs:dates:referenceDate:direction:].cold.1(v20);

    v21 = (id)MEMORY[0x1E0C9AA60];
  }

  return v21;
}

+ (id)sanitizedDatesForDates:(id)a3 referenceDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__5;
    v12[4] = __Block_byref_object_dispose__5;
    objc_msgSend(v5, "ic_objectPassingTest:", &__block_literal_global_7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__ICNoteTimelineController_sanitizedDatesForDates_referenceDate___block_invoke_2;
    v9[3] = &unk_1E5C1E1F8;
    v11 = v12;
    v10 = v6;
    objc_msgSend(v5, "ic_map:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v12, 8);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

+ (id)adjustedDateForReferenceDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("dateForTimelineGroups"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;

    v4 = v8;
  }

  return v4;
}

+ (id)timelineSectionIdentifierForNoteObjectID:(id)a3 date:(id)a4 sectionIdentifiersToManagedObjectIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v10, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v13)
  {
    v14 = v13;
    v25 = a1;
    v15 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v17, "referenceDate");
          v18 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v18;
          goto LABEL_11;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v14)
        continue;
      break;
    }
LABEL_11:
    a1 = v25;
  }

  v31 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timelineSectionsForNoteObjectIDs:dates:referenceDate:direction:", v19, v20, v11, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)timelineSectionIdentifierForNoteObjectID:(id)a3 date:(id)a4 referenceDate:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v19[0] = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "timelineSectionsForNoteObjectIDs:dates:referenceDate:direction:", v12, v13, v9, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)invitationsTimelineSectionIdentifierWithTitle:(id)a3 referenceDate:(id)a4
{
  id v6;
  id v7;
  ICNoteTimelineSectionIdentifier *v8;
  void *v9;
  ICNoteTimelineSectionIdentifier *v10;

  v6 = a4;
  v7 = a3;
  v8 = [ICNoteTimelineSectionIdentifier alloc];
  objc_msgSend(a1, "adjustedDateForReferenceDate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ICNoteTimelineSectionIdentifier initWithTimelineSectionType:referenceDate:title:sortOrder:](v8, "initWithTimelineSectionType:referenceDate:title:sortOrder:", 0, v9, v7, 0);
  return v10;
}

+ (id)pinnedTimelineSectionIdentifierWithTitle:(id)a3 referenceDate:(id)a4
{
  id v6;
  id v7;
  ICNoteTimelineSectionIdentifier *v8;
  void *v9;
  ICNoteTimelineSectionIdentifier *v10;

  v6 = a4;
  v7 = a3;
  v8 = [ICNoteTimelineSectionIdentifier alloc];
  objc_msgSend(a1, "adjustedDateForReferenceDate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ICNoteTimelineSectionIdentifier initWithTimelineSectionType:referenceDate:title:sortOrder:](v8, "initWithTimelineSectionType:referenceDate:title:sortOrder:", 1, v9, v7, 0);
  return v10;
}

+ (void)setTimeZone:(id)a3
{
  +[ICNoteTimelineControllerInternal setTimeZone:](_TtC7NotesUI32ICNoteTimelineControllerInternal, "setTimeZone:", a3);
}

+ (void)timelineSectionsForNoteObjectIDs:(os_log_t)log dates:referenceDate:direction:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "timelineSectionsForNoteObjectIDs:dates:referenceDate:direction: sizes of arrays don't match", v1, 2u);
}

@end
