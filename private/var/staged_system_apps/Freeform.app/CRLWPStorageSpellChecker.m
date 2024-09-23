@implementation CRLWPStorageSpellChecker

+ (Class)concreteClass
{
  return (Class)objc_opt_class(CRLWPiOSStorageSpellChecker, a2);
}

+ (id)newSpellCheckerForStorage:(id)a3 selectionPath:(id)a4 orSearchCanvasDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(objc_msgSend(a1, "concreteClass"), "newSpellCheckerForStorage:selectionPath:orSearchCanvasDelegate:", v8, v9, v10);

  return v11;
}

+ (id)conditionalSpellCheckerForStorage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(a1, "concreteClass"), "conditionalSpellCheckerForStorage:", v4));

  return v5;
}

+ (BOOL)canCheckSpelling
{
  return 1;
}

- (id)suggestionsForRange:(_NSRange)a3
{
  return &__NSArray0__struct;
}

+ (void)p_inputLanguageDidChangeNotification:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CRLWPSpellCheckerLanguageDidChangeNotification"), a1);

}

- (id)p_textSourceWithoutDeletionsWithSubRange:(_NSRange)a3
{
  return objc_loadWeakRetained((id *)&self->_storage);
}

- (_NSRange)p_extendRangeToBeChecked:(_NSRange)a3 delta:(int64_t)a4
{
  char *length;
  _BYTE *location;
  id WeakRetained;
  id v8;
  id v9;
  _BOOL4 v10;
  id v11;
  id v12;
  _BYTE *v13;
  id v14;
  id v15;
  NSUInteger v16;
  NSUInteger v17;
  void *v19;
  void *v20;
  void *v21;
  NSUInteger v22;
  NSUInteger v23;
  id v24[9];
  _NSRange result;

  length = (char *)a3.length;
  location = (_BYTE *)a3.location;
  if (a4 < 0 && !a3.length)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
    v8 = objc_msgSend(WeakRetained, "length");

    if (v8)
    {
      v9 = objc_loadWeakRetained((id *)&self->_storage);
      sub_1001720FC((uint64_t)v24, v9, 0, 0, (uint64_t)objc_msgSend(v9, "paragraphCount") - 1, 1);

      v10 = location == sub_100172228((uint64_t)v24);
      v11 = objc_loadWeakRetained((id *)&self->_storage);
      v12 = v11;
      if (v10)
      {
        length = (char *)((_BYTE *)objc_msgSend(v11, "nextCharacterIndex:", location) - location);
      }
      else
      {
        v13 = objc_msgSend(v11, "previousCharacterIndex:", location);

        v12 = objc_loadWeakRetained((id *)&self->_storage);
        length = (char *)((_BYTE *)objc_msgSend(v12, "nextCharacterIndex:", location) - v13);
        location = v13;
      }

      sub_100171FA4(v24);
    }
    else
    {
      length = 0;
    }
  }
  v14 = objc_loadWeakRetained((id *)&self->_storage);
  v15 = objc_msgSend(v14, "rangeByExpandingToIncludePartialWords:", location, length);
  v17 = v16;

  if (v15 == (id)0x7FFFFFFFFFFFFFFFLL && v17 == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261FC0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3AAA0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261FE0);
    v19 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker p_extendRangeToBeChecked:delta:]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 118, 0, "Bad extended range");

  }
  v22 = (NSUInteger)v15;
  v23 = v17;
  result.length = v23;
  result.location = v22;
  return result;
}

- (CRLWPStorageSpellChecker)initWithStorage:(id)a3 selectionPath:(id)a4 orSearchCanvasDelegate:(id)a5
{
  id v7;
  id v8;
  CRLWPStorageSpellChecker *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  unsigned __int8 v19;
  char v20;
  CRLWPStorageSpellChecker *v21;
  CRLWPMutableRangeArray *v22;
  CRLWPMutableRangeArray *checkedRanges;
  CRLWPMutableDirtyRangeArray *v24;
  CRLWPMutableDirtyRangeArray *dirtyRanges;
  objc_super v27;

  v7 = a3;
  v8 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CRLWPStorageSpellChecker;
  v9 = -[CRLWPStorageSpellChecker init](&v27, "init");
  *(_QWORD *)&v11 = objc_opt_class(CRLWPStorageSpellChecker, v10).n128_u64[0];
  if (-[CRLWPStorageSpellChecker isMemberOfClass:](v9, "isMemberOfClass:", v12, v11))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262000);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3AB20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262020);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker initWithStorage:selectionPath:orSearchCanvasDelegate:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 127, 0, "illegal instantiation of abstract class CRLWPStorageSpellChecker");

  }
  if (v9
    && ((*(_QWORD *)&v17 = objc_opt_class(CRLWPStorageSpellChecker, v13).n128_u64[0],
         v19 = -[CRLWPStorageSpellChecker isMemberOfClass:](v9, "isMemberOfClass:", v18, v17),
         !v7)
      ? (v20 = 1)
      : (v20 = v19),
        (v20 & 1) == 0))
  {
    objc_storeWeak((id *)&v9->_storage, v7);
    objc_storeStrong((id *)&v9->_searchCanvasDelegate, a5);
    v22 = objc_opt_new(CRLWPMutableRangeArray);
    checkedRanges = v9->_checkedRanges;
    v9->_checkedRanges = v22;

    v24 = objc_opt_new(CRLWPMutableDirtyRangeArray);
    dirtyRanges = v9->_dirtyRanges;
    v9->_dirtyRanges = v24;

    v21 = v9;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_storage);

  if (WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262040);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3ABA0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262060);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker dealloc]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 143, 0, "expected nil value for '%{public}s'", "_storage");

  }
  v7.receiver = self;
  v7.super_class = (Class)CRLWPStorageSpellChecker;
  -[CRLWPStorageSpellChecker dealloc](&v7, "dealloc");
}

- (void)cleanup
{
  objc_storeWeak((id *)&self->_storage, 0);
}

- (CRLWPRangeArray)misspelledRanges
{
  return -[CRLWPCheckingResults ranges](self->_spellingResults, "ranges");
}

- (id)spellingErrors
{
  return -[CRLWPCheckingResults results](self->_spellingResults, "results");
}

- (CRLWPRangeArray)ungrammaticRanges
{
  CRLWPGrammarResults *grammarResults;
  CRLWPRangeArray *v3;

  grammarResults = self->_grammarResults;
  if (grammarResults)
    v3 = (CRLWPRangeArray *)objc_claimAutoreleasedReturnValue(-[CRLWPCheckingResults ranges](grammarResults, "ranges"));
  else
    v3 = objc_opt_new(CRLWPRangeArray);
  return v3;
}

- (id)grammarResults
{
  return -[CRLWPCheckingResults results](self->_grammarResults, "results");
}

- (BOOL)isBusy
{
  return 0;
}

- (void)synchronouslyCheckRange:(_NSRange)a3
{
  -[CRLWPStorageSpellChecker checkRange:synchronously:](self, "checkRange:synchronously:", a3.location, a3.length, 1);
}

- (void)checkRange:(_NSRange)a3 synchronously:(BOOL)a4
{
  NSUInteger length;
  NSUInteger location;
  _TtC8Freeform12CRLWPStorage **p_storage;
  id WeakRetained;
  id v9;
  NSUInteger v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  CRLWPMutableRangeArray *v28;
  CRLWPMutableRangeArray *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  CRLWPMutableRangeArray *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  CRLWPMutableRangeArray *v49;
  uint64_t v50;
  CRLWPRangeArray *v51;
  char *v52;
  _QWORD v53[5];
  id v54;
  id v55;
  char v56;
  _QWORD v57[5];
  CRLWPMutableRangeArray *v58;
  _QWORD v59[5];
  id v60;
  id v61;
  uint8_t *v62;
  char v63;
  _QWORD v64[5];
  CRLWPMutableRangeArray *v65;
  uint8_t buf[8];
  _BYTE v67[20];
  __int16 v68;
  int v69;
  __int16 v70;
  NSUInteger v71;
  __int16 v72;
  id v73;

  if (a3.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    length = a3.length;
    location = a3.location;
    p_storage = &self->_storage;
    WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
    v9 = objc_msgSend(WeakRetained, "length");
    v10 = location + length;

    if (location + length <= (unint64_t)v9)
    {
      v14 = -[CRLWPSpellingResults copy](self->_spellingResults, "copy");
      objc_opt_class(CRLWPGrammarResults, v17);
      v19 = sub_1002223BC(v18, self->_grammarResults);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v15 = objc_msgSend(v20, "copy");

      if (length)
      {
        v21 = -[CRLWPStorageSpellChecker p_extendRangeToBeChecked:delta:](self, "p_extendRangeToBeChecked:delta:", location, length, 0);
        v23 = v22;
        v24 = -[CRLWPStorageSpellChecker dirtyRange](self, "dirtyRange");
        v26 = v25;
        v27 = -[CRLWPDirtyRangeArray delta](self->_dirtyRanges, "delta");
        if (-[CRLWPRangeArray rangeCount](self->_checkedRanges, "rangeCount"))
        {
          if (v24 != (id)0x7FFFFFFFFFFFFFFFLL || v27)
          {
            v52 = (char *)-[CRLWPRangeArray superRange](self->_checkedRanges, "superRange");
            v50 = v30;
            v32 = (char *)-[CRLWPStorageSpellChecker p_extendRangeToBeChecked:delta:](self, "p_extendRangeToBeChecked:delta:", v24, v26, v27);
            v33 = v31;
            if (v31)
              v51 = (CRLWPRangeArray *)objc_claimAutoreleasedReturnValue(-[CRLWPRangeArray intersection:](self->_checkedRanges, "intersection:", v32, v31));
            else
              v51 = -[CRLWPRangeArray initWithRange:]([CRLWPRangeArray alloc], "initWithRange:", v32, 0);
            v34 = -[CRLWPRangeArray superRange](v51, "superRange");
            v36 = 0x7FFFFFFFFFFFFFFFLL;
            if (v35)
              v37 = v35;
            else
              v37 = 0;
            if (v35)
              v36 = (uint64_t)v34;
            v48 = v36;
            v49 = objc_opt_new(CRLWPMutableRangeArray);
            v38 = &v32[v33] > v52;
            v29 = v49;
            if (v38 && v32 <= &v52[v50] && v37)
            {
              -[CRLWPMutableRangeArray removeRange:](self->_checkedRanges, "removeRange:", v48, v37);
              -[CRLWPMutableRangeArray addRange:](v49, "addRange:", v48, v37);
            }
            -[CRLWPMutableRangeArray addRange:](v49, "addRange:", v21, v23);
            if (v52 != (char *)0x7FFFFFFFFFFFFFFFLL || v50)
              -[CRLWPMutableRangeArray subtract:](v49, "subtract:", self->_checkedRanges);
            v28 = (CRLWPMutableRangeArray *)v51;
            v64[0] = _NSConcreteStackBlock;
            v64[1] = 3221225472;
            v64[2] = sub_10049EA54;
            v64[3] = &unk_1012620C8;
            v64[4] = self;
            v39 = objc_opt_new(CRLWPMutableRangeArray);
            v65 = v39;
            -[CRLWPRangeArray enumerateRanges:](v49, "enumerateRanges:", v64);
            -[CRLWPMutableRangeArray subtract:](self->_checkedRanges, "subtract:", v39);
            objc_msgSend(v14, "removeResultsForRanges:", v39);
            objc_msgSend(v15, "removeResultsForRanges:", v39);
            *(_QWORD *)buf = 0;
            *(_QWORD *)v67 = buf;
            *(_QWORD *)&v67[8] = 0x2020000000;
            v67[16] = 1;
            if (-[CRLWPRangeArray rangeCount](v39, "rangeCount"))
            {
              v59[0] = _NSConcreteStackBlock;
              v59[1] = 3221225472;
              v59[2] = sub_10049EA90;
              v59[3] = &unk_1012620F0;
              v62 = buf;
              v59[4] = self;
              v60 = v14;
              v61 = v15;
              v63 = 1;
              -[CRLWPRangeArray enumerateRanges:](v39, "enumerateRanges:", v59);

            }
            else
            {
              -[CRLWPMutableDirtyRangeArray clear](self->_dirtyRanges, "clear");
            }
            if (*(_BYTE *)(*(_QWORD *)v67 + 24))
              -[CRLWPMutableRangeArray unionWith:](self->_checkedRanges, "unionWith:", v39);
            _Block_object_dispose(buf, 8);

          }
          else
          {
            v28 = -[CRLWPRangeArray initWithRange:]([CRLWPMutableRangeArray alloc], "initWithRange:", v21, v23);
            -[CRLWPMutableRangeArray subtract:](v28, "subtract:", self->_checkedRanges);
            v57[0] = _NSConcreteStackBlock;
            v57[1] = 3221225472;
            v57[2] = sub_10049EAD0;
            v57[3] = &unk_1012620C8;
            v57[4] = self;
            v29 = objc_alloc_init(CRLWPMutableRangeArray);
            v58 = v29;
            -[CRLWPRangeArray enumerateRanges:](v28, "enumerateRanges:", v57);
            objc_msgSend(v14, "removeResultsForRanges:", v29);
            objc_msgSend(v15, "removeResultsForRanges:", v29);
            if (-[CRLWPRangeArray rangeCount](v29, "rangeCount"))
            {
              v53[0] = _NSConcreteStackBlock;
              v53[1] = 3221225472;
              v53[2] = sub_10049EB0C;
              v53[3] = &unk_101262118;
              v53[4] = self;
              v54 = v14;
              v55 = v15;
              v56 = 1;
              -[CRLWPRangeArray enumerateRanges:](v29, "enumerateRanges:", v53);

            }
            else
            {
              -[CRLWPMutableDirtyRangeArray clear](self->_dirtyRanges, "clear");
            }
            -[CRLWPMutableRangeArray unionWith:](self->_checkedRanges, "unionWith:", v29);

          }
        }
        else if (-[CRLWPStorageSpellChecker i_addSpellingAndGrammarMarksInRange:spellingResults:grammarResults:sync:](self, "i_addSpellingAndGrammarMarksInRange:spellingResults:grammarResults:sync:", v21, v23, v14, v15, 1))
        {
          -[CRLWPMutableRangeArray concatenateRange:](self->_checkedRanges, "concatenateRange:", v21, v23);
        }
      }
      else
      {
        -[CRLWPMutableRangeArray clear](self->_checkedRanges, "clear");
        objc_msgSend(v14, "clear");
        objc_msgSend(v15, "clear");
      }
      v40 = (char *)-[CRLWPRangeArray superRange](self->_checkedRanges, "superRange");
      v42 = v41;
      v43 = objc_loadWeakRetained((id *)p_storage);
      LODWORD(v40) = &v40[v42] > objc_msgSend(v43, "length");

      if ((_DWORD)v40)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101262138);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E3AC4C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101262158);
        v44 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker checkRange:synchronously:]"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v45, v46, 317, 0, "checked ranges exceed storage");

      }
      -[CRLWPStorageSpellChecker i_setResults:grammarResults:shouldSync:](self, "i_setResults:grammarResults:shouldSync:", v14, v15, 0);
    }
    else
    {
      v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262080);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        v47 = objc_loadWeakRetained((id *)p_storage);
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v11;
        *(_WORD *)v67 = 2082;
        *(_QWORD *)&v67[2] = "-[CRLWPStorageSpellChecker checkRange:synchronously:]";
        *(_WORD *)&v67[10] = 2082;
        *(_QWORD *)&v67[12] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm";
        v68 = 1024;
        v69 = 189;
        v70 = 2048;
        v71 = v10;
        v72 = 2048;
        v73 = objc_msgSend(v47, "length");
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Bad text range past end of storage (%lu vs %lu)", buf, 0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012620A0);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker checkRange:synchronously:]"));
      v15 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"));
      v16 = objc_loadWeakRetained((id *)p_storage);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 189, 0, "Bad text range past end of storage (%lu vs %lu)", v10, objc_msgSend(v16, "length"));

    }
  }
}

- (BOOL)i_setResults:(id)a3 grammarResults:(id)a4 shouldSync:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10049EC70;
  v13[3] = &unk_101262180;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  v10 = v8;
  v15 = v10;
  v11 = objc_retainBlock(v13);
  LOBYTE(v7) = ((uint64_t (*)(void))v11[2])();

  return (char)v7;
}

- (BOOL)shouldCheckAtCharIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v10;
  unint64_t v11;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012621A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3ACCC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012621C0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker shouldCheckAtCharIndex:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 358, 0, "Bogus char index");

  }
  if (-[CRLWPStorageSpellChecker dirtyRange](self, "dirtyRange") == (id)0x7FFFFFFFFFFFFFFFLL && v8 == 0)
    return 0;
  v10 = -[CRLWPStorageSpellChecker dirtyRange](self, "dirtyRange");
  return a3 >= (unint64_t)v10 && a3 - (unint64_t)v10 < v11;
}

- (BOOL)hasValidResultsForWordAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  id WeakRetained;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  _BOOL4 v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
  v8 = objc_msgSend(WeakRetained, "wordAtCharIndex:includePreviousWord:", a3, 1);
  v10 = v9;

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL && v10 == 0)
  {
    v12 = 1;
    if (!a4)
      return v12;
  }
  else
  {
    v12 = -[CRLWPRangeArray containsCharacterAtIndex:inclusive:](self->_checkedRanges, "containsCharacterAtIndex:inclusive:", v8, 0);
    if (!a4)
      return v12;
  }
  if (v12)
  {
    a4->location = (NSUInteger)v8;
    a4->length = v10;
  }
  return v12;
}

- (BOOL)hasValidResultsForRange:(_NSRange)a3
{
  if (a3.length)
    return -[CRLWPRangeArray containsRange:](self->_checkedRanges, "containsRange:", a3.location);
  else
    return -[CRLWPRangeArray containsCharacterAtIndex:inclusive:](self->_checkedRanges, "containsCharacterAtIndex:inclusive:", a3.location, 1);
}

- (_NSRange)rangeOfMisspelledWordAtCharIndex:(unint64_t)a3
{
  NSUInteger v5;
  uint64_t v6;
  _TtC8Freeform12CRLWPStorage **p_storage;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  _NSRange result;

  v6 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  p_storage = &self->_storage;
  WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
  v9 = objc_msgSend(WeakRetained, "length");

  if ((unint64_t)v9 >= a3)
  {
    v10 = objc_loadWeakRetained((id *)p_storage);
    v11 = objc_msgSend(v10, "wordAtCharIndex:includePreviousWord:", a3, 1);
    v13 = v12;

    if (-[CRLWPRangeArray intersectsRange:](self->_checkedRanges, "intersectsRange:", v11, v13))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker misspelledRanges](self, "misspelledRanges"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rangesIntersecting:", v11, v13));

      if (objc_msgSend(v15, "rangeCount"))
      {
        v6 = (uint64_t)objc_msgSend(v15, "rangeAtIndex:", 0);
        v5 = v16;
        if (!-[CRLWPRangeArray containsRange:](self->_checkedRanges, "containsRange:", v11, v13))
        {
          v5 = v13;
          v6 = (uint64_t)v11;
        }
      }

    }
  }
  v17 = v6;
  v18 = v5;
  result.length = v18;
  result.location = v17;
  return result;
}

- (_NSRange)firstErrorInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  NSRange v9;
  NSUInteger v10;
  NSUInteger v11;
  NSRange v12;
  _NSRange result;
  NSRange v14;

  length = a3.length;
  location = a3.location;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker misspelledRanges](self, "misspelledRanges"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rangesIntersecting:", location, length));

  if (objc_msgSend(v8, "rangeCount"))
  {
    v12.location = (NSUInteger)objc_msgSend(v8, "rangeAtIndex:", 0);
    v14.location = location;
    v14.length = length;
    v9 = NSIntersectionRange(v12, v14);
    v6 = v9.length;
    if (v9.length)
    {
      v5 = v9.location;
    }
    else
    {
      v5 = 0x7FFFFFFFFFFFFFFFLL;
      v6 = 0;
    }
  }

  v10 = v5;
  v11 = v6;
  result.length = v11;
  result.location = v10;
  return result;
}

- (BOOL)i_addSpellingAndGrammarMarksInRange:(_NSRange)a3 spellingResults:(id)a4 grammarResults:(id)a5 sync:(BOOL)a6
{
  id v8;
  id v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  Class v13;
  NSString *v14;
  void *v15;
  void *v16;
  char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  Class v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  Class v25;
  NSString *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  unsigned int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;

  v8 = a4;
  v9 = a5;
  v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012621E0);
  v11 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
  {
    objc_opt_class(self, v12);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 67110146;
    v31 = v10;
    v32 = 2082;
    v33 = "-[CRLWPStorageSpellChecker i_addSpellingAndGrammarMarksInRange:spellingResults:grammarResults:sync:]";
    v34 = 2082;
    v35 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm";
    v36 = 1024;
    v37 = 450;
    v38 = 2114;
    v39 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101262200);
  v16 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
  {
    v17 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v31 = v10;
    v32 = 2114;
    v33 = v17;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker i_addSpellingAndGrammarMarksInRange:spellingResults:grammarResults:sync:]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"));
  objc_opt_class(self, v20);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 450, 0, "Abstract method not overridden by %{public}@", v23);

  objc_opt_class(self, v24);
  v26 = NSStringFromClass(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v27, "-[CRLWPStorageSpellChecker i_addSpellingAndGrammarMarksInRange:spellingResults:grammarResults:sync:]"));
  v29 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v28, 0));

  objc_exception_throw(v29);
}

- (void)i_resetSpellCheckingForNotification:(id)a3
{
  -[CRLWPMutableRangeArray clear](self->_checkedRanges, "clear", a3);
  -[CRLWPCheckingResults clear](self->_spellingResults, "clear");
  -[CRLWPCheckingResults clear](self->_grammarResults, "clear");
  -[CRLWPMutableDirtyRangeArray clear](self->_dirtyRanges, "clear");
}

- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  Class v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  Class v19;
  NSString *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  unsigned int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;

  v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101262220);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v25 = v4;
    v26 = 2082;
    v27 = "-[CRLWPStorageSpellChecker rangeOfNumericalSuffixPrecedingCharIndex:]";
    v28 = 2082;
    v29 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm";
    v30 = 1024;
    v31 = 462;
    v32 = 2114;
    v33 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101262240);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
  {
    v11 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v25 = v4;
    v26 = 2114;
    v27 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker rangeOfNumericalSuffixPrecedingCharIndex:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"));
  objc_opt_class(self, v14);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 462, 0, "Abstract method not overridden by %{public}@", v17);

  objc_opt_class(self, v18);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v21, "-[CRLWPStorageSpellChecker rangeOfNumericalSuffixPrecedingCharIndex:]"));
  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v22, 0));

  objc_exception_throw(v23);
}

- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3 forLocale:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  void *v20;
  void *v21;
  char *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  unsigned int v26;
  _BYTE *v27;
  uint64_t v28;
  NSUInteger v29;
  unsigned int v30;
  NSUInteger v31;
  NSUInteger v32;
  _NSRange result;

  v6 = a4;
  if ((unint64_t)objc_msgSend(v6, "length") <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262260);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3ADCC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262280);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker rangeOfNumericalSuffixPrecedingCharIndex:forLocale:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 467, 0, "Locale string is too short.");

  }
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = 0;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012622A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3AD4C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012622C0);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker rangeOfNumericalSuffixPrecedingCharIndex:forLocale:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 471, 0, "Invalid charIndex.");
  }
  else
  {
    if (qword_101415B10 != -1)
      dispatch_once(&qword_101415B10, &stru_1012622E0);
    v15 = &qword_101415AC0;
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("en")) & 1) == 0)
    {
      if ((objc_msgSend(v6, "hasPrefix:", CFSTR("fr")) & 1) != 0)
      {
        v15 = &qword_101415AC8;
      }
      else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("it")) & 1) != 0
             || (objc_msgSend(v6, "hasPrefix:", CFSTR("gl")) & 1) != 0)
      {
        v15 = &qword_101415AD0;
      }
      else if (objc_msgSend(v6, "hasPrefix:", CFSTR("pt")))
      {
        if (objc_msgSend(v6, "hasSuffix:", CFSTR("BR")))
          v15 = &qword_101415AE0;
        else
          v15 = &qword_101415AD8;
      }
      else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("es")) & 1) != 0)
      {
        v15 = &qword_101415AE8;
      }
      else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("ca")) & 1) != 0)
      {
        v15 = &qword_101415AF0;
      }
      else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("el")) & 1) != 0)
      {
        v15 = &qword_101415AF8;
      }
      else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("nl")) & 1) != 0)
      {
        v15 = &qword_101415B00;
      }
      else if (objc_msgSend(v6, "hasPrefix:", CFSTR("uk")))
      {
        v15 = &qword_101415B08;
      }
    }
    v13 = (id)*v15;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker p_textSourceWithoutDeletionsWithSubRange:](self, "p_textSourceWithoutDeletionsWithSubRange:", 0, a3));
    v16 = (char *)objc_msgSend(v14, "charIndexMappedFromStorage:", a3);
    v17 = sub_1001B098C(v16, 0, v14);
    if (v17 <= v16)
      v18 = v16;
    else
      v18 = v17;
    if (v17 >= v16)
      v19 = v16;
    else
      v19 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringWithRange:", v19, v18 - v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
    v22 = (char *)objc_msgSend(v20, "rangeOfCharacterFromSet:options:", v21, 4);

    if (v22 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet"));
      v24 = objc_msgSend(v20, "rangeOfCharacterFromSet:options:range:", v23, 0, 0, v22) == (id)0x7FFFFFFFFFFFFFFFLL;

      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringFromIndex:", v22));
        if (objc_msgSend(v13, "containsObject:", v25))
        {
          v26 = objc_msgSend(v25, "characterAtIndex:", 1);
          v27 = objc_msgSend(v25, "length");
          v28 = -2;
          if (v26 != 46)
            v28 = -1;
          v10 = (uint64_t)objc_msgSend(v14, "charRangeMappedToStorage:", v16 - &v27[v28]);
          v11 = v29;
        }
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          if (v22 && objc_msgSend(v20, "characterAtIndex:", v22 - 1) == 49)
          {
            if (qword_101415B20 != -1)
              dispatch_once(&qword_101415B20, &stru_101262300);
            v30 = objc_msgSend((id)qword_101415B18, "containsObject:", v25);
          }
          else
          {
            if (qword_101415B30[0] != -1)
              dispatch_once(qword_101415B30, &stru_101262320);
            v30 = objc_msgSend((id)qword_101415B28, "containsObject:", v25);
          }
          if (v30)
          {
            v10 = 0x7FFFFFFFFFFFFFFFLL;
            v11 = 0;
          }
        }

      }
    }

  }
  v31 = v10;
  v32 = v11;
  result.length = v32;
  result.location = v31;
  return result;
}

- (void)findErrorsInRange:(_NSRange)a3 onHit:(id)a4 stop:(BOOL *)a5
{
  NSUInteger length;
  NSUInteger v6;
  char *v8;
  id v9;
  __int128 v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  objc_class *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  char *v23;
  id v24;
  void *v25;
  uint64_t v26;
  double v27;
  objc_class *v28;
  objc_class *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  double v34;
  objc_class *v35;
  objc_class *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  double v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  id WeakRetained;
  void *v49;
  BOOL v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  NSObject *v56;
  void *v57;
  char *v58;
  __int128 v59;
  id *location;
  unint64_t v61;
  void (**v62)(id, void *);
  void *v64;
  void *v65;
  void *v66;
  uint8_t buf[4];
  unsigned int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;

  length = a3.length;
  v6 = a3.location;
  v62 = (void (**)(id, void *))a4;
  -[CRLWPStorageSpellChecker checkRange:synchronously:](self, "checkRange:synchronously:", v6, length, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker misspelledRanges](self, "misspelledRanges"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker ungrammaticRanges](self, "ungrammaticRanges"));
  v8 = (char *)objc_msgSend(v66, "indexForRange:", v6, length);
  v9 = objc_msgSend(v65, "indexForRange:", v6, length);
  if (!*a5)
  {
    v11 = (unint64_t)v9;
    v61 = v6 + length;
    location = (id *)&self->_storage;
    *(_QWORD *)&v10 = 67109378;
    v59 = v10;
    do
    {
      if ((v8 >= objc_msgSend(v66, "rangeCount", v59) || (unint64_t)objc_msgSend(v66, "rangeAtIndex:", v8) >= v61)
        && (v11 >= (unint64_t)objc_msgSend(v65, "rangeCount")
         || (unint64_t)objc_msgSend(v65, "rangeAtIndex:", v11) >= v61))
      {
        break;
      }
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      v12 = 0;
      v14 = 0x7FFFFFFFFFFFFFFFLL;
      v15 = 0;
      if (v8 < objc_msgSend(v66, "rangeCount"))
      {
        v14 = (unint64_t)objc_msgSend(v66, "rangeAtIndex:", v8);
        v15 = v16;
      }
      if (v11 < (unint64_t)objc_msgSend(v65, "rangeCount"))
      {
        v13 = (unint64_t)objc_msgSend(v65, "rangeAtIndex:", v11);
        v12 = v17;
      }
      if (v14 <= v13)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker spellingErrors](self, "spellingErrors"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectAtIndexedSubscript:", v8));

        v32 = 0;
        v23 = v8 + 1;
      }
      else
      {
        *(_QWORD *)&v18 = objc_opt_class(CRLPair, v17).n128_u64[0];
        v20 = v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker grammarResults](self, "grammarResults", v18));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v11));
        v23 = v8;
        v24 = sub_1002223BC(v20, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

        *(_QWORD *)&v27 = objc_opt_class(NSDictionary, v26).n128_u64[0];
        v29 = v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "first", v27));
        v31 = sub_1002223BC(v29, v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

        *(_QWORD *)&v34 = objc_opt_class(NSString, v33).n128_u64[0];
        v36 = v35;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "second", v34));
        v38 = sub_1002223BC(v36, v37);
        v64 = (void *)objc_claimAutoreleasedReturnValue(v38);

        ++v11;
        v14 = v13;
        v15 = v12;
      }
      *(_QWORD *)&v41 = objc_opt_class(CRLWPSelection, v39).n128_u64[0];
      v43 = v42;
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker searchCanvasDelegate](self, "searchCanvasDelegate", v41));
      if (v44)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker searchCanvasDelegate](self, "searchCanvasDelegate"));
        v46 = objc_opt_respondsToSelector(v45, "wpSelectionClassForStorage:");

        if ((v46 & 1) != 0)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker searchCanvasDelegate](self, "searchCanvasDelegate"));
          WeakRetained = objc_loadWeakRetained(location);
          v43 = objc_msgSend(v47, "wpSelectionClassForStorage:", WeakRetained);

        }
      }
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker searchCanvasDelegate](self, "searchCanvasDelegate"));
      v50 = v49 == 0;

      if (v50)
      {
        v55 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101262340);
        v56 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          v68 = v55;
          v69 = 2082;
          v70 = "-[CRLWPStorageSpellChecker findErrorsInRange:onHit:stop:]";
          v71 = 2082;
          v72 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm";
          v73 = 1024;
          v74 = 711;
          _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d No selection path will be provided to this search reference!", buf, 0x22u);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101262360);
        v57 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_ERROR))
        {
          v58 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          *(_DWORD *)buf = v59;
          v68 = v55;
          v69 = 2114;
          v70 = v58;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v57, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v51 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorageSpellChecker findErrorsInRange:onHit:stop:]"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorageSpellChecker.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v51, v52, 711, 0, "No selection path will be provided to this search reference!");
        v54 = 0;
      }
      else
      {
        v51 = objc_loadWeakRetained(location);
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "selectionWithRange:", v14, v15));
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker searchCanvasDelegate](self, "searchCanvasDelegate"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSearchReference searchReferenceWithStorage:selection:searchCanvasDelegate:](CRLWPSearchReference, "searchReferenceWithStorage:selection:searchCanvasDelegate:", v51, v52, v53));

      }
      v62[2](v62, v54);

      v8 = v23;
    }
    while (!*a5);
  }

}

- (_NSRange)dirtyRange
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[CRLWPDirtyRangeArray superRange](self->_dirtyRanges, "superRange");
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (void)i_addMisspelledWord:(id)a3 atIndex:(unint64_t)a4 ifValidForRange:(_NSRange)a5 toResults:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;

  length = a5.length;
  location = a5.location;
  v13 = a3;
  v10 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "smartFieldAtCharIndex:attributeKind:effectiveRange:", location, 6, 0));

  if (!v12 && location <= 0x7FFFFFFFFFFFFFFELL)
    objc_msgSend(v10, "addResult:forRange:", v13, location, length);

}

- (CRLSearchCanvasDelegate)searchCanvasDelegate
{
  return self->_searchCanvasDelegate;
}

- (void)setSearchCanvasDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_searchCanvasDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCanvasDelegate, 0);
  objc_storeStrong((id *)&self->_dirtyRanges, 0);
  objc_storeStrong((id *)&self->_grammarResults, 0);
  objc_storeStrong((id *)&self->_spellingResults, 0);
  objc_storeStrong((id *)&self->_checkedRanges, 0);
  objc_destroyWeak((id *)&self->_storage);
}

@end
