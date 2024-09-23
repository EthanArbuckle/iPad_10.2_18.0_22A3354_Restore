@implementation CRLPasteboard

+ (id)activePasteboardsQueue
{
  if (qword_101414B40 != -1)
    dispatch_once(&qword_101414B40, &stru_10122DBD0);
  return (id)qword_101414B38;
}

+ (id)activePasteboards
{
  if (qword_101414B50 != -1)
    dispatch_once(&qword_101414B50, &stru_10122DBF0);
  return (id)qword_101414B48;
}

+ (id)activePasteboardForName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10002BCEC;
  v17 = sub_10002BCFC;
  v18 = 0;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "activePasteboardsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BD04;
  block[3] = &unk_10122DC18;
  v11 = &v13;
  v12 = a1;
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

+ (Class)pasteboardClass
{
  return (Class)objc_opt_class(CRLPasteboardUIPasteboard, a2);
}

+ (id)generalPasteboard
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BDDC;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_101414B60 != -1)
    dispatch_once(&qword_101414B60, block);
  return (id)qword_101414B58;
}

+ (CRLPasteboard)pasteboardWithName:(id)a3 create:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10002BCEC;
  v20 = sub_10002BCFC;
  v21 = 0;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "activePasteboardsQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002BFE8;
  v11[3] = &unk_10122DC60;
  v13 = &v16;
  v14 = a1;
  v12 = v6;
  v15 = a4;
  v8 = v6;
  dispatch_sync(v7, v11);

  v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return (CRLPasteboard *)v9;
}

+ (CRLPasteboard)pasteboardWithUniqueName
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "pasteboardClass")), "initWithUniquePasteboardName");
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "activePasteboardsQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C13C;
  v7[3] = &unk_10122DCC8;
  v9 = a1;
  v5 = v3;
  v8 = v5;
  dispatch_async(v4, v7);

  return (CRLPasteboard *)v5;
}

+ (CRLPasteboard)pasteboardWithPasteboard:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10002BCEC;
  v17 = sub_10002BCFC;
  v18 = 0;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "activePasteboardsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C44C;
  block[3] = &unk_10122DCF0;
  v11 = &v13;
  v12 = a1;
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (CRLPasteboard *)v7;
}

- (NSString)string
{
  return 0;
}

- (NSArray)strings
{
  return 0;
}

- (NSArray)richTextStrings
{
  return 0;
}

- (NSArray)URLs
{
  return 0;
}

- (id)pasteboardTypes
{
  return 0;
}

- (BOOL)containsPasteboardTypes:(id)a3
{
  id v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "count");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLPasteboard pasteboardTypes](self, "pasteboardTypes"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13))
        {
          if (!--v5)
          {
            v11 = 1;
            goto LABEL_12;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)containsAnyPasteboardTypeInArray:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLPasteboard pasteboardTypes](self, "pasteboardTypes"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "crl_conformsToAnyUTI:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)canLoadItemsOfClass:(Class)a3
{
  return 0;
}

- (id)dataForPasteboardType:(id)a3
{
  return 0;
}

- (id)stringForPasteboardType:(id)a3
{
  return 0;
}

- (id)valueForPasteboardType:(id)a3
{
  return 0;
}

- (int64_t)numberOfItems
{
  return 0;
}

- (void)addItems:(id)a3
{
  -[CRLPasteboard addItems:isSmartCopy:](self, "addItems:isSmartCopy:", a3, 0);
}

- (id)pasteboardTypesForItemSet:(id)a3
{
  return 0;
}

- (id)dataForPasteboardType:(id)a3 inItemSet:(id)a4
{
  return 0;
}

- (id)stringsForPasteboardType:(id)a3 inItemSet:(id)a4
{
  return 0;
}

- (id)valuesForPasteboardType:(id)a3 inItemSet:(id)a4
{
  return 0;
}

- (NSString)name
{
  return -[UIPasteboard name](self->_pasteboard, "name");
}

- (int64_t)changeCount
{
  return -[UIPasteboard changeCount](self->_pasteboard, "changeCount");
}

- (int64_t)clearContents
{
  return 0;
}

- (id)importableRichTextTypes
{
  return +[CRLIngestionTypes supportedRichTextTypes](CRLIngestionTypes, "supportedRichTextTypes");
}

- (id)importableImageTypes
{
  return +[CRLIngestionTypes supportedImageTypes](CRLIngestionTypes, "supportedImageTypes");
}

- (BOOL)containsNativePasteboardTypes
{
  void *v3;
  _QWORD v5[2];

  v5[0] = CFSTR("com.apple.freeform.CRLNativeMetadata");
  v5[1] = CFSTR("com.apple.freeform.CRLNativeData");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 2));
  LOBYTE(self) = -[CRLPasteboard containsPasteboardTypes:](self, "containsPasteboardTypes:", v3);

  return (char)self;
}

- (BOOL)containsImportableRichTextTypes
{
  CRLPasteboard *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboard importableRichTextTypes](self, "importableRichTextTypes"));
  LOBYTE(v2) = -[CRLPasteboard containsAnyPasteboardTypeInArray:](v2, "containsAnyPasteboardTypeInArray:", v3);

  return (char)v2;
}

- (BOOL)containsImportableTextTypes
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLPasteboard pasteboardTypes](self, "pasteboardTypes"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (+[CRLIngestionTypes isValidPlainTextUTI:](CRLIngestionTypes, "isValidPlainTextUTI:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), (_QWORD)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)isSmartCopy
{
  void *v3;
  const __CFString *v5;

  v5 = CFSTR("NeXT smart paste pasteboard type");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  LOBYTE(self) = -[CRLPasteboard containsPasteboardTypes:](self, "containsPasteboardTypes:", v3);

  return (char)self;
}

- (unint64_t)pasteboardItemMaxSize
{
  return 18874368;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboard name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboard pasteboardTypes](self, "pasteboardTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p name=\"%@\" pasteboardTypes=%@>"), v4, self, v5, v6));

  return v7;
}

+ (CRLPasteboard)stylePasteboard
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CBAC;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_101414B70 != -1)
    dispatch_once(&qword_101414B70, block);
  return (CRLPasteboard *)(id)qword_101414B68;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteboard, 0);
}

@end
