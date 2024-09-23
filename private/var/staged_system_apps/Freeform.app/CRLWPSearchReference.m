@implementation CRLWPSearchReference

+ (id)searchReferenceWithStorage:(id)a3 selection:(id)a4 searchCanvasDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithStorage:selection:searchCanvasDelegate:", v10, v9, v8);

  return v11;
}

+ (id)searchReferenceWithStorage:(id)a3 selection:(id)a4 selectionPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithStorage:selection:selectionPath:", v10, v9, v8);

  return v11;
}

- (CRLWPSearchReference)initWithStorage:(id)a3 selection:(id)a4 searchCanvasDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRLWPSearchReference *v12;
  CRLWPSearchReference *v13;
  uint64_t v14;
  CRLSelectionPath *selectionPath;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRLWPSearchReference;
  v12 = -[CRLWPSearchReference init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storage, a3);
    -[CRLWPSearchReference setSelection:](v13, "setSelection:", v10);
    v13->_rootIndex = 0x7FFFFFFFFFFFFFFFLL;
    v13->_pulseAnimationStyle = 0;
    if (v11)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectionPathForSearchReference:", v13));
      selectionPath = v13->_selectionPath;
      v13->_selectionPath = (CRLSelectionPath *)v14;

    }
  }

  return v13;
}

- (CRLWPSearchReference)initWithStorage:(id)a3 selectionPath:(id)a4
{
  id v7;
  id v8;
  CRLWPSearchReference *v9;
  CRLWPSearchReference *v10;
  uint64_t v11;
  double v12;
  objc_class *v13;
  objc_class *v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CRLWPSearchReference;
  v9 = -[CRLWPSearchReference init](&v19, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a3);
    objc_storeStrong((id *)&v10->_selectionPath, a4);
    *(_QWORD *)&v12 = objc_opt_class(CRLWPSelection, v11).n128_u64[0];
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mostSpecificSelectionOfClass:", 0, v12));
    v16 = sub_1002223BC(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    -[CRLWPSearchReference setSelection:](v10, "setSelection:", v17);
    v10->_rootIndex = 0x7FFFFFFFFFFFFFFFLL;
    v10->_pulseAnimationStyle = 0;

  }
  return v10;
}

- (CRLWPSearchReference)initWithStorage:(id)a3 selection:(id)a4 selectionPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRLWPSearchReference *v12;
  CRLWPSearchReference *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CRLWPSearchReference;
  v12 = -[CRLWPSearchReference init](&v20, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storage, a3);
    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "orderedSelections"));
      v15 = objc_msgSend(v14, "containsObject:", v10);

      if ((v15 & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101249038);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E138C0();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101249058);
        v16 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE87A4(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSearchReference initWithStorage:selection:selectionPath:]"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSearchReference.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 92, 0, "Search reference selection path must contain the text selection if selection path is provided");

      }
      objc_storeStrong((id *)&v13->_selectionPath, a5);
    }
    -[CRLWPSearchReference setSelection:](v13, "setSelection:", v10);
    v13->_rootIndex = 0x7FFFFFFFFFFFFFFFLL;
    v13->_pulseAnimationStyle = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v4 = a3;
  objc_opt_class(CRLWPSearchReference, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference storage](self, "storage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storage"));
    if (v9 == v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selection](self, "selection"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selection"));
      if (objc_msgSend(v12, "isEqual:", v13)
        && (-[CRLWPSearchReference searchReferencePoint](self, "searchReferencePoint"),
            v15 = v14,
            v17 = v16,
            objc_msgSend(v8, "searchReferencePoint"),
            sub_10005FE60(v15, v17, v18, v19)))
      {
        v20 = -[CRLWPSearchReference pulseAnimationStyle](self, "pulseAnimationStyle");
        v11 = v20 == objc_msgSend(v8, "pulseAnimationStyle");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)contains:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;

  v4 = a3;
  objc_opt_class(CRLWPSearchReference, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference storage](self, "storage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storage"));
  if (v9 == v10)
  {
    v12 = (char *)-[CRLWPSearchReference range](self, "range");
    v14 = v13;
    v15 = (char *)objc_msgSend(v8, "range");
    v11 = v12 <= v15 && &v12[v14] >= &v15[v16];
    v10 = v9;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  CRLHasher *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_alloc_init(CRLHasher);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference storage](self, "storage"));
  -[CRLHasher addObject:](v3, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selection](self, "selection"));
  -[CRLHasher addObject:](v3, "addObject:", v5);

  -[CRLHasher addInteger:](v3, "addInteger:", -[CRLWPSearchReference pulseAnimationStyle](self, "pulseAnimationStyle"));
  v6 = -[CRLHasher hashValue](v3, "hashValue");

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  int64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "searchReferencePoint");
  v6 = v5;
  -[CRLWPSearchReference searchReferencePoint](self, "searchReferencePoint");
  if (v6 <= v8)
  {
    if (v6 < v8)
    {
      v9 = 1;
    }
    else
    {
      objc_opt_class(CRLWPSearchReference, v7);
      v11 = sub_100221D0C(v10, v4);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)v12;
      if (v12
        && (v14 = objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference storage](self, "storage"))) != 0
        && (v15 = (void *)v14,
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference storage](self, "storage")),
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "storage")),
            v17,
            v16,
            v15,
            v16 == v17))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference p_selectionForComparison](self, "p_selectionForComparison"));
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "p_selectionForComparison"));
        v21 = (void *)v20;
        v9 = 0;
        if (v19 && v20)
          v9 = (int64_t)objc_msgSend(v19, "compare:", v20);

      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void)setSelection:(id)a3
{
  uint64_t v4;
  CRLWPSelection *v5;
  CRLWPSelection *selection;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  CRLWPSelection *v12;
  CRLWPSelection *v13;
  CRLSelectionPath *selectionPath;
  CRLWPSelection *v15;
  CRLSelectionPath *v16;
  CRLSelectionPath *v17;
  CRLSelectionPath *v18;
  CRLWPSelection *v19;
  CRLWPSelection *v20;

  v5 = (CRLWPSelection *)a3;
  selection = self->_selection;
  if (selection != v5)
  {
    if (selection)
    {
      *(_QWORD *)&v7 = objc_opt_class(selection, v4).n128_u64[0];
      if ((-[CRLWPSelection isMemberOfClass:](v5, "isMemberOfClass:", v8, v7) & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101249078);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E13940();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101249098);
        v9 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE87A4(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSearchReference setSelection:]"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSearchReference.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 170, 0, "New selection is not the same class as the old selection.");

      }
    }
    v12 = -[CRLWPSelection copyWithNewType:smartFieldRange:](v5, "copyWithNewType:smartFieldRange:", -[CRLWPSelection type](v5, "type"), 0x7FFFFFFFFFFFFFFFLL, 0);
    v13 = self->_selection;
    if (!v13)
      v13 = v5;
    selectionPath = self->_selectionPath;
    v15 = v13;
    v16 = (CRLSelectionPath *)objc_claimAutoreleasedReturnValue(-[CRLSelectionPath selectionPathReplacingMostSpecificLocationOfSelection:withSelection:](selectionPath, "selectionPathReplacingMostSpecificLocationOfSelection:withSelection:", v15, v12));
    v17 = self->_selectionPath;
    self->_selectionPath = v16;
    v18 = v16;

    v19 = self->_selection;
    self->_selection = v12;
    v20 = v12;

  }
}

- (_NSRange)range
{
  void *v2;
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selection](self, "selection"));
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = (NSUInteger)v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference p_selectionWithRange:](self, "p_selectionWithRange:", a3.location, a3.length));
  -[CRLWPSearchReference setSelection:](self, "setSelection:", v4);

}

- (BOOL)isInsertionPoint
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selection](self, "selection"));
  v3 = objc_msgSend(v2, "isInsertionPoint");

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference storage](self, "storage"));
  -[CRLWPSearchReference searchReferencePoint](self, "searchReferencePoint");
  v5 = v4;
  -[CRLWPSearchReference searchReferencePoint](self, "searchReferencePoint");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selection](self, "selection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[CRLWPSearchReference %p] storage=%p, loc: %f,%f selection: %@"), self, v3, v5, v7, v8));

  return (NSString *)v9;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  return self->_storage;
}

- (id)searchReferenceForReplacingWithString:(id)a3 options:(unint64_t)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = -[CRLWPSearchReference range](self, "range");
  v7 = objc_msgSend(v5, "length");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference p_selectionWithRange:](self, "p_selectionWithRange:", v6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selectionPath](self, "selectionPath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selection](self, "selection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPathReplacingMostSpecificLocationOfSelection:withSelection:", v10, v8));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSearchReference searchReferenceWithStorage:selection:selectionPath:](CRLWPSearchReference, "searchReferenceWithStorage:selection:selectionPath:", self->_storage, v8, v11));
  objc_msgSend(v12, "setRootIndex:", -[CRLWPSearchReference rootIndex](self, "rootIndex"));

  return v12;
}

- (id)searchReferenceStart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference p_selectionWithRange:](self, "p_selectionWithRange:", -[CRLWPSearchReference range](self, "range"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selectionPath](self, "selectionPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selection](self, "selection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPathReplacingMostSpecificLocationOfSelection:withSelection:", v5, v3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSearchReference searchReferenceWithStorage:selection:selectionPath:](CRLWPSearchReference, "searchReferenceWithStorage:selection:selectionPath:", self->_storage, v3, v6));
  objc_msgSend(v7, "setRootIndex:", -[CRLWPSearchReference rootIndex](self, "rootIndex"));

  return v7;
}

- (id)searchReferenceEnd
{
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (char *)-[CRLWPSearchReference range](self, "range");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference p_selectionWithRange:](self, "p_selectionWithRange:", &v3[v4], 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selectionPath](self, "selectionPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selection](self, "selection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPathReplacingMostSpecificLocationOfSelection:withSelection:", v7, v5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSearchReference searchReferenceWithStorage:selection:selectionPath:](CRLWPSearchReference, "searchReferenceWithStorage:selection:selectionPath:", self->_storage, v5, v8));
  objc_msgSend(v9, "setRootIndex:", -[CRLWPSearchReference rootIndex](self, "rootIndex"));

  return v9;
}

- (id)p_selectionWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selection](self, "selection"));
  objc_opt_class(v5, v6);
  v8 = v7;

  return objc_msgSend(v8, "selectionWithRange:", location, length);
}

- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _TtC8Freeform23CRLWPReplaceTextCommand *v19;
  id v20;
  uint64_t v21;
  _TtC8Freeform23CRLWPReplaceTextCommand *v22;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference storage](self, "storage"));
  if (-[CRLWPSearchReference isReplaceable](self, "isReplaceable"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "string"));
    v9 = -[CRLWPSearchReference range](self, "range");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crl_stringByCapitalizingToMatchString:range:searchOptions:", v8, v9, v10, a4));

    *(_QWORD *)&v13 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v12).n128_u64[0];
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentInfo", v13));
    v17 = sub_100221D0C(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    if (v18)
    {
      v19 = [_TtC8Freeform23CRLWPReplaceTextCommand alloc];
      v20 = -[CRLWPSearchReference range](self, "range");
      v22 = -[CRLWPReplaceTextCommand initWithShapeItem:range:text:](v19, "initWithShapeItem:range:text:", v18, v20, v21, v11);
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
    v11 = v6;
  }

  return v22;
}

- (id)commandSelectionBehaviorForCommand:(id)a3
{
  return 0;
}

- (CRLSelectionPath)selectionPath
{
  CRLSelectionPath *selectionPath;
  void *v4;
  void *v5;
  void *v6;

  selectionPath = self->_selectionPath;
  if (!selectionPath)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012490B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E139C0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012490D8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSearchReference selectionPath]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSearchReference.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 274, 0, "Selection path must be provided on initialization for any search reference that is asked for one.");

    selectionPath = self->_selectionPath;
  }
  return selectionPath;
}

- (BOOL)isReplaceable
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  BOOL v14;
  unint64_t v16;
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference storage](self, "storage"));
  v4 = objc_msgSend(v3, "canUserReplaceText");

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selection](self, "selection"));

  if (!v5)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selection](self, "selection"));
  v7 = objc_msgSend(v6, "range");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference storage](self, "storage"));
  v11 = objc_msgSend(v10, "hasSmartFieldsInRange:", v7, v9);

  if (!v11)
    return 1;
  v16 = 0;
  v17 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference storage](self, "storage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "smartFieldAtCharIndex:attributeKind:effectiveRange:", v7, 6, &v16));

  v14 = v13 && v16 < (unint64_t)v7 && v17 + v16 >= (unint64_t)v7 + v9;
  return v14;
}

- (BOOL)isSelectable
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference storage](self, "storage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "parentInfo"));

  if (!v3)
    return 1;
  while (1)
  {
    objc_opt_class(_TtC8Freeform12CRLBoardItem, v4);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0 && (objc_msgSend(v3, "locked") & 1) != 0)
      break;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentInfo"));

    v3 = (void *)v6;
    if (!v6)
    {
      v7 = 1;
      goto LABEL_8;
    }
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLWPSearchReference *v4;
  _TtC8Freeform12CRLWPStorage *storage;
  void *v6;
  CRLWPSearchReference *v7;
  void *v8;

  v4 = +[CRLWPSearchReference allocWithZone:](CRLWPSearchReference, "allocWithZone:", a3);
  storage = self->_storage;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selection](self, "selection"));
  v7 = -[CRLWPSearchReference initWithStorage:selection:selectionPath:](v4, "initWithStorage:selection:selectionPath:", storage, v6, self->_selectionPath);

  -[CRLWPSearchReference searchReferencePoint](self, "searchReferencePoint");
  -[CRLWPSearchReference setSearchReferencePoint:](v7, "setSearchReferencePoint:");
  -[CRLWPSearchReference connectionLineUnscaledPoint](self, "connectionLineUnscaledPoint");
  -[CRLWPSearchReference setConnectionLineUnscaledPoint:](v7, "setConnectionLineUnscaledPoint:");
  -[CRLWPSearchReference setPulseAnimationStyle:](v7, "setPulseAnimationStyle:", -[CRLWPSearchReference pulseAnimationStyle](self, "pulseAnimationStyle"));
  -[CRLWPSearchReference setAutohideHighlight:](v7, "setAutohideHighlight:", -[CRLWPSearchReference autohideHighlight](self, "autohideHighlight"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference findHighlights](self, "findHighlights"));
  -[CRLWPSearchReference setFindHighlights:](v7, "setFindHighlights:", v8);

  -[CRLWPSearchReference setPulseHighlight:](v7, "setPulseHighlight:", -[CRLWPSearchReference pulseHighlight](self, "pulseHighlight"));
  -[CRLWPSearchReference setRootIndex:](v7, "setRootIndex:", -[CRLWPSearchReference rootIndex](self, "rootIndex"));
  return v7;
}

- (id)p_selectionForComparison
{
  void *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  void *v6;

  if (self->_selectionPath)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selectionPath](self, "selectionPath"));
    *(_QWORD *)&v4 = objc_opt_class(CRLWPSelection, v3).n128_u64[0];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mostSpecificSelectionOfClass:", v5, v4));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearchReference selection](self, "selection"));
  }
  return v6;
}

- (NSArray)findHighlights
{
  return self->_findHighlights;
}

- (void)setFindHighlights:(id)a3
{
  objc_storeStrong((id *)&self->_findHighlights, a3);
}

- (BOOL)autohideHighlight
{
  return self->_autohideHighlight;
}

- (void)setAutohideHighlight:(BOOL)a3
{
  self->_autohideHighlight = a3;
}

- (BOOL)pulseHighlight
{
  return self->_pulseHighlight;
}

- (void)setPulseHighlight:(BOOL)a3
{
  self->_pulseHighlight = a3;
}

- (int64_t)rootIndex
{
  return self->_rootIndex;
}

- (void)setRootIndex:(int64_t)a3
{
  self->_rootIndex = a3;
}

- (CGPoint)searchReferencePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_searchReferencePoint.x;
  y = self->_searchReferencePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSearchReferencePoint:(CGPoint)a3
{
  self->_searchReferencePoint = a3;
}

- (CGRect)searchReferenceLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_searchReferenceLayoutFrame.origin.x;
  y = self->_searchReferenceLayoutFrame.origin.y;
  width = self->_searchReferenceLayoutFrame.size.width;
  height = self->_searchReferenceLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSearchReferenceLayoutFrame:(CGRect)a3
{
  self->_searchReferenceLayoutFrame = a3;
}

- (CGPoint)connectionLineUnscaledPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_connectionLineUnscaledPoint.x;
  y = self->_connectionLineUnscaledPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setConnectionLineUnscaledPoint:(CGPoint)a3
{
  self->_connectionLineUnscaledPoint = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (CRLWPSelection)selection
{
  return self->_selection;
}

- (unint64_t)pulseAnimationStyle
{
  return self->_pulseAnimationStyle;
}

- (void)setPulseAnimationStyle:(unint64_t)a3
{
  self->_pulseAnimationStyle = a3;
}

- (BOOL)alsoShowSelection
{
  return self->_alsoShowSelection;
}

- (void)setAlsoShowSelection:(BOOL)a3
{
  self->_alsoShowSelection = a3;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void)setSelectionPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectionPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionPath, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_selection, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_findHighlights, 0);
}

@end
