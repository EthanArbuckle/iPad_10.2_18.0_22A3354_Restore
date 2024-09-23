@implementation NotesAssistantUtilities

+ (id)sharedHTMLNoteManagedObjectContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NoteContext sharedContext](NoteContext, "sharedContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));

  return v3;
}

+ (id)saNoteObjectForSearchIndexableNote:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10000EBEC;
  v18 = sub_10000EBFC;
  v19 = 0;
  v4 = objc_opt_class(ICNote);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000EC04;
    v13[3] = &unk_100020C48;
    v13[5] = &v14;
    v7 = v13;
    v13[4] = v5;
    objc_msgSend(v6, "performBlockAndWait:", v13);
LABEL_5:

    goto LABEL_6;
  }
  v8 = objc_opt_class(NoteObject);
  if ((objc_opt_isKindOfClass(v3, v8) & 1) != 0)
  {
    v9 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000ED00;
    v12[3] = &unk_100020C48;
    v12[5] = &v14;
    v7 = v12;
    v12[4] = v9;
    objc_msgSend(v6, "performBlockAndWait:", v12);
    goto LABEL_5;
  }
LABEL_6:
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

+ (id)searchIndexableNoteForObject:(id)a3 modernNoteContext:(id)a4 htmlNoteContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_10000EBEC;
  v39 = sub_10000EBFC;
  v10 = ICProtocolCast(&OBJC_PROTOCOL___ICSearchIndexableNote, v7);
  v40 = (id)objc_claimAutoreleasedReturnValue(v10);
  v11 = (void *)v36[5];
  if (!v11)
  {
    v12 = objc_opt_class(NSURL);
    v13 = ICDynamicCast(v12, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_opt_class(SANoteObject);
    v16 = ICDynamicCast(v15, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = v17;
    if (v17)
    {
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));

      v14 = (void *)v19;
    }
    if (!v14)
      goto LABEL_12;
    if (+[ICAppURLUtilities isShowNoteURL:](ICAppURLUtilities, "isShowNoteURL:", v14))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities predicateForNotesMentionedInURL:](ICAppURLUtilities, "predicateForNotesMentionedInURL:", v14));
      v21 = v20;
      if (!v20)
      {
LABEL_11:

        goto LABEL_12;
      }
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10000F094;
      v31[3] = &unk_100020760;
      v21 = v20;
      v32 = v21;
      v33 = v8;
      v34 = &v35;
      objc_msgSend(v33, "performBlockAndWait:", v31);

      v22 = v32;
    }
    else
    {
      if (!+[ICAppURLUtilities isShowHTMLNoteURL:](ICAppURLUtilities, "isShowHTMLNoteURL:", v14))
      {
LABEL_12:

        v11 = (void *)v36[5];
        goto LABEL_13;
      }
      v21 = (id)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities objectIDURIRepresentationForHTMLNoteMentionedInURL:](ICAppURLUtilities, "objectIDURIRepresentationForHTMLNoteMentionedInURL:", v14));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "persistentStoreCoordinator"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "managedObjectIDForURIRepresentation:", v21));

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10000F118;
      v27[3] = &unk_100020C70;
      v30 = &v35;
      v28 = v9;
      v22 = v24;
      v29 = v22;
      objc_msgSend(v28, "performBlockAndWait:", v27);

    }
    goto LABEL_11;
  }
LABEL_13:
  v25 = v11;
  _Block_object_dispose(&v35, 8);

  return v25;
}

+ (id)URLForSearchIndexableNote:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = objc_opt_class(ICNote);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForNote:](ICAppURLUtilities, "appURLForNote:", v3));
  }
  else
  {
    v6 = objc_opt_class(NoteObject);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v5 = objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForHTMLNote:](ICAppURLUtilities, "appURLForHTMLNote:", v3));
  }
  v7 = (void *)v5;
LABEL_7:

  return v7;
}

@end
