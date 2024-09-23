@implementation CRLContentDescriptionTranslator

- (CRLContentDescriptionTranslator)init
{
  CRLContentDescriptionTranslator *v2;
  NSDictionary *appDescriptionData;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLContentDescriptionTranslator;
  v2 = -[CRLContentDescriptionTranslator init](&v5, "init");
  appDescriptionData = v2->_appDescriptionData;
  v2->_appDescriptionData = (NSDictionary *)&__NSDictionary0__struct;

  return v2;
}

- (id)descriptionForBoardItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 3));
  if (v4)
  {
    v7 = (objc_class *)objc_opt_class(v4, v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("class"));

    v11 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v10);
    v12 = sub_100221D0C(v11, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_msgSend(v13, "isAutogrowingTextBox");

    if (v14)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("textbox"));
    if ((objc_opt_respondsToSelector(v4, "text") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
      v16 = objc_claimAutoreleasedReturnValue(-[CRLContentDescriptionTranslator descriptionForTextStorage:range:](self, "descriptionForTextStorage:range:", v15, 0, objc_msgSend(v15, "length")));
      v17 = (void *)v16;
      if (v16)
      {
        v21 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("text"));

      }
    }
  }
  v19 = objc_msgSend(v6, "copy");

  return v19;
}

+ (unint64_t)countOfObjectsInContentDescription:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appData")));

  return (unint64_t)v4 - (v5 != 0);
}

+ (BOOL)hasNativeTypesInContentDescription:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = a3;
  v4 = (unint64_t)objc_msgSend(v3, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appData")));

  return v4 > (v5 != 0);
}

- (id)contentDescriptionForBoardItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLContentDescriptionTranslator descriptionsForBoardItems:](self, "descriptionsForBoardItems:", a3));
  if (v4)
  {
    v8[0] = CFSTR("appData");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLContentDescriptionTranslator appDescriptionData](self, "appDescriptionData"));
    v8[1] = CFSTR("boardItems");
    v9[0] = v5;
    v9[1] = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  }
  else
  {
    v6 = &__NSDictionary0__struct;
  }

  return v6;
}

- (id)descriptionsForBoardItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v4, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLContentDescriptionTranslator descriptionForBoardItem:](self, "descriptionForBoardItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), (_QWORD)v13));
          if (v11)
            objc_msgSend(v5, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

+ (id)descriptionsForBoardItemsInContentDescription:(id)a3
{
  return objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("boardItems"));
}

+ (BOOL)hasNativeBoardItemsInContentDescription:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_boardItemsDescriptionsFromContentDescription:", a3));
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)p_hasNativeBoardItemsContainingTextInBoardItemDescription:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100164A58;
  v6[3] = &unk_10123D460;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (BOOL)hasNativeBoardItemsContainingTextInContentDescription:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("boardItems")));
  LOBYTE(a1) = objc_msgSend(a1, "p_hasNativeBoardItemsContainingTextInBoardItemDescription:", v4);

  return (char)a1;
}

+ (BOOL)hasSingleNativeImageBoardItemInContentDescription:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  id v8;
  NSString *v9;
  uint64_t v10;
  Class v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("boardItems")));
  if (objc_msgSend(v3, "count") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v6 = (objc_class *)objc_opt_class(NSString, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("class")));
    v8 = sub_1002223BC(v6, v7);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);

    if (v9)
    {
      v11 = NSClassFromString(v9);
      if (v11)
        LOBYTE(v11) = -[objc_class isSubclassOfClass:](v11, "isSubclassOfClass:", objc_opt_class(_TtC8Freeform12CRLImageItem, v10));
    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return (char)v11;
}

+ (BOOL)hasSingleNativeMovieBoardItemInContentDescription:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  id v8;
  NSString *v9;
  uint64_t v10;
  Class v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("boardItems")));
  if (objc_msgSend(v3, "count") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v6 = (objc_class *)objc_opt_class(NSString, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("class")));
    v8 = sub_1002223BC(v6, v7);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);

    if (v9)
    {
      v11 = NSClassFromString(v9);
      if (v11)
        LOBYTE(v11) = -[objc_class isSubclassOfClass:](v11, "isSubclassOfClass:", objc_opt_class(_TtC8Freeform12CRLMovieItem, v10));
    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return (char)v11;
}

+ (BOOL)hasOnlyNativeTextBoxBoardItemsInContentDescription:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("boardItems")));
  if (objc_msgSend(v3, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v11 = (objc_class *)objc_opt_class(NSNumber, v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("textbox"), (_QWORD)v18));
          v13 = sub_1002223BC(v11, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v15 = objc_msgSend(v14, "BOOLValue");

          if (!v15)
          {
            v16 = 0;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v7)
          continue;
        break;
      }
    }
    v16 = 1;
LABEL_12:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)hasOnlyFreehandDrawingBoardItemsInContentDescription:(id)a3
{
  id v3;
  void *v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  BOOL v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("boardItems")));
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v11 = objc_msgSend(v4, "count") != 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100165044;
  v7[3] = &unk_10123D460;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (BOOL)hasAnyFreehandDrawingBoardItemsInContentDescription:(id)a3
{
  id v3;
  void *v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("boardItems")));
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001651E8;
  v7[3] = &unk_10123D460;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (unint64_t)numberOfBoardItemsInContentDescription:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_boardItemsDescriptionsFromContentDescription:", a3));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

+ (unint64_t)numberOfTopLevelBoardItemsInContentDescription:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("boardItems")));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (id)descriptionForTextStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  void **v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  uint64_t i;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  length = a4.length;
  v5 = a3;
  v6 = v5;
  if (!v5)
    goto LABEL_14;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  if (length)
  {
    v7 = 1;
    if (!objc_msgSend(v5, "hasVisibleContent", CFSTR("hasText"), *((_QWORD *)&v17 + 1), v18, &__kCFBooleanTrue, *((_QWORD *)&v19 + 1), v20))goto LABEL_8;
  }
  else
  {
    if ((objc_msgSend(v5, "hasVisibleContent", v17, v18, v19, v20) & 1) == 0)
    {
      v13 = 0;
      goto LABEL_9;
    }
    LODWORD(v7) = 0;
  }
  v8 = v7;
  v9 = (void **)((unint64_t)&v19 | (8 * v7));
  v10 = *v9;
  *v9 = &__kCFBooleanTrue;

  v7 = (v7 + 1);
  v11 = (void **)((unint64_t)&v17 & 0xFFFFFFFFFFFFFFF7 | (8 * (v8 & 1)));
  v12 = *v11;
  *v11 = CFSTR("hasVisibleText");

LABEL_8:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v17, v7));
LABEL_9:
  for (i = 24; i != -8; i -= 8)

  for (j = 24; j != -8; j -= 8)
  if (!v13)
LABEL_14:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));

  return v13;
}

- (id)contentDescriptionForTextStorage:(id)a3 range:(_NSRange)a4 boardItems:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLContentDescriptionTranslator descriptionForTextStorage:range:](self, "descriptionForTextStorage:range:", a3, a4.location, a4.length, a5));
  if (objc_msgSend(v6, "count"))
  {
    v10[0] = CFSTR("appData");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLContentDescriptionTranslator appDescriptionData](self, "appDescriptionData"));
    v10[1] = CFSTR("text");
    v11[0] = v7;
    v11[1] = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  }
  else
  {
    v8 = &__NSDictionary0__struct;
  }

  return v8;
}

+ (unsigned)elementKindFromBoardItemDescription:(id)a3
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v5 = (objc_class *)objc_opt_class(NSNumber, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("elementKind")));

  v7 = sub_1002223BC(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  LODWORD(v3) = objc_msgSend(v8, "unsignedIntegerValue");
  return v3;
}

+ (BOOL)hasNativeTextInContentDescription:(id)a3
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("text")));
  v5 = (objc_class *)objc_opt_class(NSNumber, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hasText")));
  v7 = sub_1002223BC(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

+ (BOOL)hasTextStoragesInContentDescription:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  void *v13;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text")));
  if (v6
    && (v7 = (objc_class *)objc_opt_class(NSNumber, v5),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasText"))),
        v9 = sub_1002223BC(v7, v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9),
        v11 = objc_msgSend(v10, "BOOLValue"),
        v10,
        v8,
        (v11 & 1) != 0))
  {
    v12 = 1;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("boardItems")));
    v12 = objc_msgSend(a1, "p_hasTextStoragesInBoardItemDescriptions:topLevelBoardItems:", v13, v13);

  }
  return v12;
}

+ (id)p_boardItemsDescriptionsFromContentDescription:(id)a3
{
  return objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("boardItems"));
}

+ (BOOL)p_hasTextStoragesInBoardItemDescriptions:(id)a3 topLevelBoardItems:(id)a4
{
  return objc_msgSend(a3, "crl_enumerateAllBoardItemsNestedRecursivelyUsingBlock:", &stru_10123D4A0, a4);
}

- (NSDictionary)appDescriptionData
{
  return self->_appDescriptionData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDescriptionData, 0);
}

+ (id)stringToPrefixForStyleCopyingTypeFromDescription:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  sub_100889CD0(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
