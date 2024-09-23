@implementation ICBaseIntentHandler

- (ICBaseIntentHandler)init
{
  ICBaseIntentHandler *v2;
  void *v3;
  id v4;
  void *v5;
  ICUnifiedNoteContext *v6;
  ICUnifiedNoteContext *noteContext;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICBaseIntentHandler;
  v2 = -[ICBaseIntentHandler init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NoteContext sharedContext](NoteContext, "sharedContext"));
    +[ICPluginUtilities setupNoteContextWithOptions:](ICPluginUtilities, "setupNoteContextWithOptions:", 66066);
    v4 = objc_alloc((Class)ICUnifiedNoteContext);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v6 = (ICUnifiedNoteContext *)objc_msgSend(v4, "initWithModernNoteContext:htmlNoteContext:", v5, v3);
    noteContext = v2->_noteContext;
    v2->_noteContext = v6;

  }
  return v2;
}

- (id)searchableItemsWithText:(id)a3 title:(id)a4 fromDate:(id)a5 toDate:(id)a6 dateSearchType:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  __CFString *v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSString *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSString *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[3];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v63 = v14;
  v61 = v16;
  if (objc_msgSend(v11, "length"))
  {
    v17 = v15;
    v59 = v13;
    v18 = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchQueryOperation prefixMatchingQueryStringForSearchString:](ICSearchQueryOperation, "prefixMatchingQueryStringForSearchString:", v11));
    v20 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[ICSpotlightUtilities stringByEscapingSearchString:](ICSpotlightUtilities, "stringByEscapingSearchString:", v11));
    v22 = objc_msgSend(v21, "length");
    v23 = CFSTR("cwdt");
    if (!v22)
      v23 = &stru_100021400;
    v24 = MDItemTextContent;
    v25 = v23;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@=\"%@*\"%@"), v24, v21, v25));
    v65[0] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@=\"%@*\"%@"), MDItemAuthors, v21, v25));
    v65[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@=\"%@*\"%@"), CFSTR("_ICItemDisplayName"), v21, v25));

    v65[2] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 3));

    if (v19)
      objc_msgSend(v17, "addObject:", v19);
    if (v29)
      objc_msgSend(v62, "addObjectsFromArray:", v29);

    v12 = v18;
    v11 = v20;
    v14 = v63;
    v15 = v17;
    v13 = v59;
    v16 = v61;
  }
  if (objc_msgSend(v12, "length"))
  {
    v60 = v15;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchQueryOperation exactMatchingQueryStringForTitleSearchString:](ICSearchQueryOperation, "exactMatchingQueryStringForTitleSearchString:", v12));
    if (v30)
      objc_msgSend(v60, "addObject:", v30);
    if (objc_msgSend(v11, "length"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[ICSpotlightUtilities stringByEscapingSearchString:](ICSpotlightUtilities, "stringByEscapingSearchString:", v12));
      v32 = objc_msgSend(v31, "length");
      v33 = CFSTR("cwdt");
      if (!v32)
        v33 = &stru_100021400;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@=\"%@\"%@"), CFSTR("_ICItemDisplayName"), v31, v33));
      v64 = v34;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v64, 1));

      if (v35)
      {
        objc_msgSend(v62, "addObjectsFromArray:", v35);

      }
    }

    v15 = v60;
    v16 = v61;
    v14 = v63;
  }
  if (a7)
  {
    if (a7 == 3)
      goto LABEL_30;
    if (a7 != 2)
      goto LABEL_38;
  }
  if (v13 && v14)
  {
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    v37 = v36;
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("((contentModificationDate >= %f) && (contentModificationDate <= %f))"), v37, v38);
  }
  else if (v13)
  {
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(contentModificationDate >= %f)"), v40, v58);
  }
  else
  {
    if (!v14)
      goto LABEL_29;
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(contentModificationDate <= %f)"), v41, v58);
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(v39);
  objc_msgSend(v16, "addObject:", v42);

  v14 = v63;
LABEL_29:
  if (a7)
    goto LABEL_38;
LABEL_30:
  if (v13 && v14)
  {
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    v44 = v43;
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("((contentCreationDate >= %f) && (contentCreationDate <= %f))"), v44, v45);
  }
  else if (v13)
  {
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(contentCreationDate >= %f)"), v47, v58);
  }
  else
  {
    if (!v14)
      goto LABEL_38;
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(contentCreationDate <= %f)"), v48, v58);
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(v46);
  objc_msgSend(v16, "addObject:", v49);

LABEL_38:
  if ((unint64_t)objc_msgSend(v16, "count") < 2)
  {
    if (objc_msgSend(v16, "count") != (id)1)
      goto LABEL_45;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
    objc_msgSend(v15, "addObject:", v51);
  }
  else
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsJoinedByString:", CFSTR(" || ")));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@)"), v50));

    if (v51)
      objc_msgSend(v15, "addObject:", v51);
  }

LABEL_45:
  if (objc_msgSend(v15, "count"))
    v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsJoinedByString:", CFSTR(" && ")));
  else
    v52 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(contentType == %@)"), CFSTR("com.apple.notes.spotlightrecord")));
  v53 = (void *)v52;
  v54 = +[ICSearchQueryOperation newOperationQueueWithName:](ICSearchQueryOperation, "newOperationQueueWithName:", CFSTR("com.apple.notes.find"));
  v55 = objc_msgSend(objc_alloc((Class)ICSearchQueryOperation), "initWithQueryString:rankingQueries:", v53, v62);
  objc_msgSend(v54, "addOperation:", v55);
  objc_msgSend(v54, "waitUntilAllOperationsAreFinished");
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "results"));

  return v56;
}

- (id)notesWithText:(id)a3 title:(id)a4 fromDate:(id)a5 toDate:(id)a6 dateSearchType:(int64_t)a7 modernFolderID:(id)a8 legacyFolderID:(id)a9
{
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  uint64_t *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _QWORD *v61;
  uint64_t *v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  _QWORD *v67;
  uint64_t *v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[4];
  id v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];

  v49 = a3;
  v48 = a4;
  v52 = a5;
  v51 = a6;
  v46 = a8;
  v44 = a9;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = sub_100012208;
  v78 = sub_100012218;
  v79 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = v52;
  v47 = v14;
  if (a7)
  {
    if (a7 == 3)
      goto LABEL_13;
    if (a7 != 2)
      goto LABEL_21;
  }
  if (v52 && v51)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("modificationDate >= %@"), v52));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("modificationDate <= %@"), v51));
    v82[0] = v16;
    v82[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v82, 2));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v18));
    objc_msgSend(v14, "addObject:", v19);

  }
  else if (v52)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("modificationDate >= %@"), v52));
    objc_msgSend(v14, "addObject:", v16);
  }
  else
  {
    if (!v51)
      goto LABEL_12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("modificationDate <= %@"), v51));
    objc_msgSend(v14, "addObject:", v16);
  }

  v15 = v52;
LABEL_12:
  if (a7)
    goto LABEL_21;
LABEL_13:
  if (v15 && v51)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("creationDate >= %@"), v15));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("creationDate <= %@"), v51));
    v81[0] = v20;
    v81[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v81, 2));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v22));
    objc_msgSend(v14, "addObject:", v23);

  }
  else if (v15)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("creationDate >= %@"), v15));
    objc_msgSend(v14, "addObject:", v20);
  }
  else
  {
    if (!v51)
      goto LABEL_21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("creationDate <= %@"), v51));
    objc_msgSend(v14, "addObject:", v20);
  }

LABEL_21:
  if ((unint64_t)objc_msgSend(v14, "count") < 2)
  {
    if (objc_msgSend(v14, "count") == (id)1)
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
    else
      v45 = 0;
  }
  else
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v14));
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler noteContext](self, "noteContext"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "modernManagedObjectContext"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler noteContext](self, "noteContext"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "htmlManagedObjectContext"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "stringByTrimmingCharactersInSet:", v28));
  if (objc_msgSend(v29, "length"))
  {

  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringByTrimmingCharactersInSet:", v30));
    v32 = objc_msgSend(v31, "length") == 0;

    if (v32)
    {
      v69[0] = 0;
      v69[1] = v69;
      v69[2] = 0x3032000000;
      v69[3] = sub_100012208;
      v69[4] = sub_100012218;
      v70 = 0;
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_1000123A4;
      v63[3] = &unk_100020DF8;
      v64 = v46;
      v65 = v25;
      v43 = v45;
      v66 = v43;
      v67 = v69;
      v68 = &v74;
      objc_msgSend(v65, "performBlockAndWait:", v63);
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_1000125D0;
      v58[3] = &unk_100020E20;
      v59 = v43;
      v60 = v27;
      v61 = v69;
      v62 = &v74;
      objc_msgSend(v60, "performBlockAndWait:", v58);

      _Block_object_dispose(v69, 8);
      goto LABEL_30;
    }
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler searchableItemsWithText:title:fromDate:toDate:dateSearchType:](self, "searchableItemsWithText:title:fromDate:toDate:dateSearchType:", v49, v48, v52, v51, a7));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
  v80[0] = v27;
  v80[1] = v25;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v80, 2));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectsForSearchableItems:inContexts:", v33, v35));

  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100012220;
  v71[3] = &unk_100020DD0;
  v37 = v36;
  v72 = v37;
  v73 = &v74;
  performBlockOnMainThreadAndWait(v71);

LABEL_30:
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10001287C;
  v53[3] = &unk_100020DA8;
  v38 = v45;
  v54 = v38;
  v57 = &v74;
  v39 = v46;
  v55 = v39;
  v40 = v44;
  v56 = v40;
  performBlockOnMainThreadAndWait(v53);
  v41 = (id)v75[5];

  _Block_object_dispose(&v74, 8);
  return v41;
}

- (id)notesWithText:(id)a3 fromDate:(id)a4 toDate:(id)a5
{
  return -[ICBaseIntentHandler notesWithText:title:fromDate:toDate:dateSearchType:modernFolderID:legacyFolderID:](self, "notesWithText:title:fromDate:toDate:dateSearchType:modernFolderID:legacyFolderID:", a3, 0, a4, a5, 0, 0, 0);
}

- (id)notesWithTitle:(id)a3
{
  return -[ICBaseIntentHandler notesWithText:title:fromDate:toDate:dateSearchType:modernFolderID:legacyFolderID:](self, "notesWithText:title:fromDate:toDate:dateSearchType:modernFolderID:legacyFolderID:", 0, a3, 0, 0, 0, 0, 0);
}

- (id)intentNoteForSearchIndexableNote:(id)a3
{
  return -[ICBaseIntentHandler intentNoteForSearchIndexableNote:includeContent:](self, "intentNoteForSearchIndexableNote:includeContent:", a3, 0);
}

- (id)intentNoteForSearchIndexableNote:(id)a3 includeContent:(BOOL)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v14[8];
  BOOL v15;
  _QWORD v16[8];
  BOOL v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100012208;
  v24 = sub_100012218;
  v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100012208;
  v18[4] = sub_100012218;
  v19 = &__NSArray0__struct;
  v6 = objc_opt_class(ICNote);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100012D74;
    v16[3] = &unk_100020E48;
    v17 = a4;
    v9 = v16;
    v16[4] = v7;
    v16[5] = v18;
    v16[6] = &v20;
    v16[7] = 252;
    objc_msgSend(v8, "performBlockAndWait:", v16);
LABEL_5:

    goto LABEL_6;
  }
  v10 = objc_opt_class(NoteObject);
  if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
  {
    v11 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managedObjectContext"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100013034;
    v14[3] = &unk_100020E48;
    v15 = a4;
    v9 = v14;
    v14[4] = v11;
    v14[5] = v18;
    v14[6] = &v20;
    v14[7] = 252;
    objc_msgSend(v8, "performBlockAndWait:", v14);
    goto LABEL_5;
  }
LABEL_6:
  v12 = (id)v21[5];
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(&v20, 8);
  return v12;
}

- (id)searchIndexableNoteForIntentNote:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler noteContext](self, "noteContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modernManagedObjectContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseIntentHandler noteContext](self, "noteContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "htmlManagedObjectContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NotesAssistantUtilities searchIndexableNoteForObject:modernNoteContext:htmlNoteContext:](NotesAssistantUtilities, "searchIndexableNoteForObject:modernNoteContext:htmlNoteContext:", v5, v7, v9));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)refreshNotesForCollectionWithId:(id)a3 andContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  unsigned int v26;
  void *v27;

  v5 = a3;
  v6 = a4;
  if (!v5)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((void *)0) != collectionId", "-[ICBaseIntentHandler refreshNotesForCollectionWithId:andContext:]", 1, 0, CFSTR("Should not pass nil collection ID into refreshNotesForCollectionWithId:."));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionForObjectID:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "basicAccountIdentifier"));
  if ((objc_msgSend(v8, "isEqualToString:", kLocalAccountIdentifier) & 1) == 0)
  {
    v9 = objc_opt_class(NoteAccountObject);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[DADConnection sharedConnection](DADConnection, "sharedConnection"));
      v11 = objc_msgSend(v10, "updateContentsOfAllFoldersForAccountID:andDataclass:isUserRequested:", v8, 32, 1);

      v12 = os_log_create("com.apple.notes", "Intents");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412546;
        v22 = v8;
        v23 = 1024;
        LODWORD(v24) = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Result of updating all folders for account ID %@: %d", (uint8_t *)&v21, 0x12u);
      }

    }
    else
    {
      v13 = objc_opt_class(NoteStoreObject);
      if ((objc_opt_isKindOfClass(v7, v13) & 1) != 0)
      {
        v14 = v7;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[DADConnection sharedConnection](DADConnection, "sharedConnection"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "externalIdentifier"));
        v27 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
        v18 = objc_msgSend(v15, "updateContentsOfFoldersWithKeys:forAccountID:andDataclass:isUserRequested:", v17, v8, 32, 1);

        v19 = os_log_create("com.apple.notes", "Intents");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "externalIdentifier"));
          v21 = 138412802;
          v22 = v20;
          v23 = 2112;
          v24 = v8;
          v25 = 1024;
          v26 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Result of updating folder with identifier %@ for account ID %@: %d", (uint8_t *)&v21, 0x1Cu);

        }
      }
    }
  }

}

- (ICUnifiedNoteContext)noteContext
{
  return self->_noteContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteContext, 0);
}

@end
