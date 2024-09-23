@implementation CRLSelectionPath

- (CRLSelectionPath)initWithSelectionArray:(id)a3
{
  id v4;
  CRLSelectionPath *v5;
  NSArray *v6;
  NSArray *currentSelection;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLSelectionPath;
  v5 = -[CRLSelectionPath init](&v9, "init");
  if (v5)
  {
    if (!v4)
      v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    currentSelection = v5->_currentSelection;
    v5->_currentSelection = v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  CRLSelectionPath *v5;
  uint64_t v6;
  id *v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v5 = (CRLSelectionPath *)a3;
  if (v5 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class(CRLSelectionPath, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = objc_msgSend(v7[1], "count");
      if (v8 == (id)-[NSArray count](self->_currentSelection, "count"))
      {
        if (-[NSArray count](self->_currentSelection, "count"))
        {
          v9 = 0;
          do
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_currentSelection, "objectAtIndexedSubscript:", v9));
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[1], "objectAtIndexedSubscript:", v9));
            v12 = objc_msgSend(v10, "isEqual:", v11);

            if ((v12 & 1) == 0)
              break;
            ++v9;
          }
          while (v9 < -[NSArray count](self->_currentSelection, "count"));
        }
        else
        {
          v12 = 1;
        }
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSArray hash](self->_currentSelection, "hash");
}

- (NSArray)orderedSelections
{
  return self->_currentSelection;
}

- (id)selectionAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[NSArray count](self->_currentSelection, "count") <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261298);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E39378();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012612B8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionAtIndex:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 68, 0, "Requested selection index %tu is out of range!", a3);

    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_currentSelection, "objectAtIndexedSubscript:", a3));
  }
  return v5;
}

- (unint64_t)indexForSelection:(id)a3
{
  return -[NSArray indexOfObjectIdenticalTo:](self->_currentSelection, "indexOfObjectIdenticalTo:", a3);
}

+ (CRLSelectionPath)selectionPathWithSelectionArray:(id)a3
{
  id v3;
  CRLSelectionPath *v4;

  v3 = a3;
  v4 = -[CRLSelectionPath initWithSelectionArray:]([CRLSelectionPath alloc], "initWithSelectionArray:", v3);

  return v4;
}

- (CRLSelectionPath)selectionPathWithAppendedSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v8;

  if (!a3)
    return self;
  v8 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionPath selectionPathWithAppendedSelections:](self, "selectionPathWithAppendedSelections:", v5, v8));
  return (CRLSelectionPath *)v6;
}

- (CRLSelectionPath)selectionPathWithAppendedSelections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012612D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E39494();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012612F8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathWithAppendedSelections:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 92, 0, "invalid nil value for '%{public}s'", "selections");

  }
  if (!objc_msgSend(v4, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261318);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E39414();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261338);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathWithAppendedSelections:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 93, 0, "Must send in some selection to append");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionPath orderedSelections](self, "orderedSelections"));
  v12 = objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "addObjectsFromArray:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSelectionPath selectionPathWithSelectionArray:](CRLSelectionPath, "selectionPathWithSelectionArray:", v12));

  return (CRLSelectionPath *)v13;
}

- (id)selectionPathPoppingOffSelection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionPath orderedSelections](self, "orderedSelections"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v4);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261358);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E39528();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261378);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathPoppingOffSelection:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 102, 0, "Cannot pop to selection that is not in a selection path.");

  }
  else
  {
    objc_msgSend(v6, "crl_trimObjectsFromIndex:", v7);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSelectionPath selectionPathWithSelectionArray:](CRLSelectionPath, "selectionPathWithSelectionArray:", v6));

  return v11;
}

- (id)selectionPathPoppingToSelection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionPath orderedSelections](self, "orderedSelections"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (char *)objc_msgSend(v6, "indexOfObjectIdenticalTo:", v4);
  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261398);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E395A8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012613B8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathPoppingToSelection:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 112, 0, "Cannot pop to selection that is not in a selection path.");

  }
  else if (v7 < (char *)objc_msgSend(v6, "count") - 1)
  {
    objc_msgSend(v6, "crl_trimObjectsFromIndex:", v7 + 1);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSelectionPath selectionPathWithSelectionArray:](CRLSelectionPath, "selectionPathWithSelectionArray:", v6));

  return v11;
}

- (id)selectionPathReplacingMostSpecificLocationOfSelection:(id)a3 withSelection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSUInteger v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CRLSelectionPath *v18;
  id v19;
  CRLSelectionPath *v20;
  CRLSelectionPath *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012613D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E396BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012613F8);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathReplacingMostSpecificLocationOfSelection:withSelection:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 120, 0, "invalid nil value for '%{public}s'", "oldSelection");

    if (v8)
      goto LABEL_26;
    goto LABEL_17;
  }
  if (!v7)
  {
LABEL_17:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261418);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E39628();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261438);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathReplacingMostSpecificLocationOfSelection:withSelection:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 121, 0, "invalid nil value for '%{public}s'", "newSelection");

LABEL_26:
    v18 = self;
    goto LABEL_38;
  }
  v9 = -[NSArray count](self->_currentSelection, "count");
  if ((uint64_t)(v9 - 1) < 0)
    goto LABEL_28;
  v10 = v9;
  while (1)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_currentSelection, "objectAtIndexedSubscript:", --v10));
    if (v11 == v6)
      break;

    if (v10 <= 0)
      goto LABEL_28;
  }
  v19 = -[NSArray mutableCopy](self->_currentSelection, "mutableCopy");
  objc_msgSend(v19, "replaceObjectAtIndex:withObject:", v10, v8);
  v20 = (CRLSelectionPath *)objc_claimAutoreleasedReturnValue(+[CRLSelectionPath selectionPathWithSelectionArray:](CRLSelectionPath, "selectionPathWithSelectionArray:", v19));

  v21 = v20;
  if (!v20)
  {
LABEL_28:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261458);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E39750();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261478);
    v22 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionPath selectionPathReplacingMostSpecificLocationOfSelection:withSelection:]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLSelectionPath.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 137, 0, "Cannot replace a selection that is not in the selection path.");

    v20 = 0;
    v21 = self;
  }
  v18 = v21;

LABEL_38:
  return v18;
}

- (id)selectionPathByAppendingOrReplacingMostSpecificSelectionWithSelection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CRLSelectionPath *v10;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionPath orderedSelections](self, "orderedSelections"));
    v6 = objc_msgSend(v5, "mutableCopy");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    objc_opt_class(v4, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      objc_msgSend(v6, "replaceObjectAtIndex:withObject:", (char *)objc_msgSend(v6, "count") - 1, v4);
    else
      objc_msgSend(v6, "addObject:", v4);
    v10 = (CRLSelectionPath *)objc_claimAutoreleasedReturnValue(+[CRLSelectionPath selectionPathWithSelectionArray:](CRLSelectionPath, "selectionPathWithSelectionArray:", v6));

  }
  else
  {
    v10 = self;
  }

  return v10;
}

- (id)mostSpecificSelectionOfClass:(Class)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray reverseObjectEnumerator](self->_currentSelection, "reverseObjectEnumerator", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_isKindOfClass(v9, a3) & 1) != 0)
          {
            v10 = v9;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_12:

  }
  else
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_currentSelection, "lastObject"));
  }
  return v10;
}

- (id)mostSpecificSelectionConformingToProtocol:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray reverseObjectEnumerator](self->_currentSelection, "reverseObjectEnumerator", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "conformsToProtocol:", v4) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)leastSpecificSelectionOfClass:(Class)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = self->_currentSelection;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_isKindOfClass(v9, a3) & 1) != 0)
          {
            v10 = v9;
            goto LABEL_12;
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_12:

  }
  else
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_currentSelection, "firstObject"));
  }
  return v10;
}

- (void)enumerateSelectionsMostToLeastSpecificInPathUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];

  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray reverseObjectEnumerator](self->_currentSelection, "reverseObjectEnumerator", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateSelectionsLeastToMostSpecificInPathUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];

  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectEnumerator](self->_currentSelection, "objectEnumerator", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = sub_10003DB48(self->_currentSelection);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CRLSelectionPath: %p  %@>"), self, v4));

  return v5;
}

- (NSString)UUIDDescription
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectEnumerator](self->_currentSelection, "objectEnumerator"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8), "UUIDDescription"));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v10 = sub_10003DB48(v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CRLSelectionPath: %@>"), v11));

  return (NSString *)v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSelection, 0);
}

@end
