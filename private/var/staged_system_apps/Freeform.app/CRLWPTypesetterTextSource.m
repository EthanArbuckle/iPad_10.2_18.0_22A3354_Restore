@implementation CRLWPTypesetterTextSource

- (CRLWPTypesetterTextSource)initWithSource:(id)a3 subRange:(_NSRange)a4
{
  NSUInteger location;
  CRLWPTypesetterTextSource *v7;
  unint64_t v8;
  id *p_source;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  unint64_t v17;
  id v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  BOOL v23;
  CFRange RangeOfComposedCharactersAtIndex;
  UChar32 v25;
  int v26;
  int v27;
  unint64_t v28;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v31;
  unint64_t *begin;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  unint64_t *v38;
  unint64_t v39;
  CFRange v40;
  int v41;
  unint64_t *v42;
  unint64_t *v43;
  unint64_t *v44;
  unint64_t *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  unint64_t *v51;
  unint64_t v52;
  CRLWPRangeMap *v53;
  CRLWPRangeMap *rangeMap;
  CRLWPRangeMap *v55;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  CKRecordID v67;
  Swift::String v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  CKRecordID v79;
  Swift::String v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  CKRecordID v91;
  Swift::String v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  CKRecordID v103;
  Swift::String v104;
  NSUInteger v105;
  unint64_t **p_end;
  vector<unsigned long, std::allocator<unsigned long>> *p_spaceCharIndexes;
  NSUInteger length;
  id v109;
  unint64_t v110;
  void *v111;
  uint64_t p_end_cap;
  BOOL v113;
  void **p_begin;
  uint64_t p_bidiDirectionMarkIsRTLVector;
  __CFString *theString;
  char v117;
  objc_super v118;
  _BYTE v119[32];

  length = a4.length;
  location = a4.location;
  v109 = a3;
  v118.receiver = self;
  v118.super_class = (Class)CRLWPTypesetterTextSource;
  v7 = -[CRLWPTypesetterTextSource init](&v118, "init");
  if (v7)
  {
    if (!v109
      || location > (unint64_t)objc_msgSend(v109, "length")
      || (v8 = location + length, location + length > (unint64_t)objc_msgSend(v109, "length")))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101244080);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0BD34();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012440A0);
      v93 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v93, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d The source storage and/or the specified sub range are invalid.", v94, v95, v96, v97, v98, v99, v100, (uint64_t)"-[CRLWPTypesetterTextSource initWithSource:subRange:]");
      v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource initWithSource:subRange:]"));
      v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v101, v102, 54, 1, "The source storage and/or the specified sub range are invalid.");

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v103, v104);
      abort();
    }
    p_source = (id *)&v7->_source;
    objc_storeStrong((id *)&v7->_source, a3);
    p_spaceCharIndexes = &v7->_spaceCharIndexes;
    p_end = &v7->_spaceCharIndexes.__end_;
    if (v7->_spaceCharIndexes.__begin_ == v7->_spaceCharIndexes.__end_ && length >= 2)
    {
      theString = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_source, "string"));
      v105 = location;
      objc_opt_class(_TtC8Freeform12CRLWPStorage, v11);
      v13 = sub_100221D0C(v12, *p_source);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = (void *)v14;
      if (v14)
      {
        v16 = 0;
        v111 = (void *)v14;
        p_end_cap = (uint64_t)&v7->_bidiCharIndexes.__end_cap_;
        p_begin = (void **)&v7->_bidiCharIndexes.__begin_;
        p_bidiDirectionMarkIsRTLVector = (uint64_t)&v7->_bidiDirectionMarkIsRTLVector;
        v17 = v105;
        v110 = v8;
        do
        {
          v18 = objc_msgSend(v15, "writingDirectionForParagraphAtCharIndex:", v17);
          v19 = (char *)objc_msgSend(v15, "textRangeForParagraphAtCharIndex:", v17);
          v21 = &v19[v20];
          if (v8 >= (unint64_t)&v19[v20])
            v8 = (unint64_t)&v19[v20];
          if ((unint64_t)v19 <= v17)
            v22 = v17;
          else
            v22 = (unint64_t)v19;
          v113 = v18 == (id)1;
          if (v18 == (id)1)
          {
            if (v22 < v8)
            {
              v23 = 0;
              do
              {
                RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(theString, v22);
                if (!RangeOfComposedCharactersAtIndex.length)
                {
                  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_1012440C0);
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    sub_100E0BDB4();
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_1012440E0);
                  v57 = off_1013D9070;
                  if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_ERROR))
                  {
                    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                    sub_100DE7E60();
                  }

                  sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d zero-length character", v58, v59, v60, v61, v62, v63, v64, (uint64_t)"-[CRLWPTypesetterTextSource initWithSource:subRange:]");
                  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource initWithSource:subRange:]"));
                  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"));
                  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v65, v66, 125, 1, "zero-length character");

                  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v67, v68);
                  abort();
                }
                v119[0] = 0;
                v25 = -[CRLWPTypesetterTextSource composedCharacterAtCharIndex:isSurrogatePair:](v7, "composedCharacterAtCharIndex:isSurrogatePair:", v22, v119);
                v26 = sub_1001B0EFC(v25);
                v27 = v26;
                if (v25 == 9 || v26 == 6 || !v23 && v26 == 4 || !v23 && v26 == 5)
                {
                  v28 = RangeOfComposedCharactersAtIndex.length + v22;
                  end = v7->_bidiCharIndexes.__end_;
                  value = v7->_bidiCharIndexes.__end_cap_.__value_;
                  if (end >= value)
                  {
                    begin = (unint64_t *)*p_begin;
                    v33 = ((char *)end - (_BYTE *)*p_begin) >> 3;
                    v34 = v33 + 1;
                    if ((unint64_t)(v33 + 1) >> 61)
                      sub_100007810();
                    v35 = (char *)value - (char *)begin;
                    if (v35 >> 2 > v34)
                      v34 = v35 >> 2;
                    if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8)
                      v36 = 0x1FFFFFFFFFFFFFFFLL;
                    else
                      v36 = v34;
                    if (v36)
                    {
                      v37 = (char *)sub_10002BA34(p_end_cap, v36);
                      begin = v7->_bidiCharIndexes.__begin_;
                      end = v7->_bidiCharIndexes.__end_;
                    }
                    else
                    {
                      v37 = 0;
                    }
                    v38 = (unint64_t *)&v37[8 * v33];
                    *v38 = v28;
                    v31 = v38 + 1;
                    while (end != begin)
                    {
                      v39 = *--end;
                      *--v38 = v39;
                    }
                    v7->_bidiCharIndexes.__begin_ = v38;
                    v7->_bidiCharIndexes.__end_ = v31;
                    v7->_bidiCharIndexes.__end_cap_.__value_ = (unint64_t *)&v37[8 * v36];
                    if (begin)
                      operator delete(begin);
                  }
                  else
                  {
                    *end = v28;
                    v31 = end + 1;
                  }
                  v7->_bidiCharIndexes.__end_ = v31;
                  v117 = 1;
                  sub_1001F28DC(p_bidiDirectionMarkIsRTLVector, &v117);
                }
                v23 = v27 == 3;
                v22 = RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length;
              }
              while (RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length < v8);
            }
          }
          else
          {
            while (v22 < v8)
            {
              v40 = CFStringGetRangeOfComposedCharactersAtIndex(theString, v22);
              if (!v40.length)
              {
                +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101244100);
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  sub_100E0BEB4();
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101244120);
                v69 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_ERROR))
                {
                  objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                  sub_100DE7E60();
                }

                sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d zero-length character", v70, v71, v72, v73, v74, v75, v76, (uint64_t)"-[CRLWPTypesetterTextSource initWithSource:subRange:]");
                v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource initWithSource:subRange:]"));
                v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"));
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v77, v78, 149, 1, "zero-length character");

                SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v79, v80);
                abort();
              }
              v119[0] = 0;
              v41 = sub_1001B0EFC(-[CRLWPTypesetterTextSource composedCharacterAtCharIndex:isSurrogatePair:](v7, "composedCharacterAtCharIndex:isSurrogatePair:", v22, v119));
              if (v41 == 3 && v16)
              {
                v43 = v7->_bidiCharIndexes.__end_;
                v42 = v7->_bidiCharIndexes.__end_cap_.__value_;
                if (v43 >= v42)
                {
                  v45 = (unint64_t *)*p_begin;
                  v46 = ((char *)v43 - (_BYTE *)*p_begin) >> 3;
                  v47 = v46 + 1;
                  if ((unint64_t)(v46 + 1) >> 61)
                    sub_100007810();
                  v48 = (char *)v42 - (char *)v45;
                  if (v48 >> 2 > v47)
                    v47 = v48 >> 2;
                  if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8)
                    v49 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v49 = v47;
                  if (v49)
                  {
                    v50 = (char *)sub_10002BA34(p_end_cap, v49);
                    v45 = v7->_bidiCharIndexes.__begin_;
                    v43 = v7->_bidiCharIndexes.__end_;
                  }
                  else
                  {
                    v50 = 0;
                  }
                  v51 = (unint64_t *)&v50[8 * v46];
                  *v51 = v22;
                  v44 = v51 + 1;
                  while (v43 != v45)
                  {
                    v52 = *--v43;
                    *--v51 = v52;
                  }
                  v7->_bidiCharIndexes.__begin_ = v51;
                  v7->_bidiCharIndexes.__end_ = v44;
                  v7->_bidiCharIndexes.__end_cap_.__value_ = (unint64_t *)&v50[8 * v49];
                  if (v45)
                    operator delete(v45);
                }
                else
                {
                  *v43 = v22;
                  v44 = v43 + 1;
                }
                v7->_bidiCharIndexes.__end_ = v44;
                v117 = 0;
                sub_1001F28DC(p_bidiDirectionMarkIsRTLVector, &v117);
                break;
              }
              if (v41 == 1)
                break;
              v22 = v40.location + v40.length;
            }
          }
          if (v17 >= v8)
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101244140);
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              sub_100E0BE34();
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101244160);
            v81 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)v81, OS_LOG_TYPE_ERROR))
            {
              objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              sub_100DE7E60();
            }

            sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Failed to advance curCharIndex", v82, v83, v84, v85, v86, v87, v88, (uint64_t)"-[CRLWPTypesetterTextSource initWithSource:subRange:]");
            v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource initWithSource:subRange:]"));
            v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v89, v90, 173, 1, "Failed to advance curCharIndex");

            SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v91, v92);
            abort();
          }
          v17 = v8;
          v16 = v113;
          v8 = v110;
          v15 = v111;
        }
        while (v110 > (unint64_t)v21);
      }

      location = v105;
    }
    if (v7->_bidiCharIndexes.__begin_ == v7->_bidiCharIndexes.__end_)
    {
      v55 = -[CRLWPRangeMap initWithSubRange:unmappedPairIndexes:]([CRLWPRangeMap alloc], "initWithSubRange:unmappedPairIndexes:", location, length, p_spaceCharIndexes);
      rangeMap = v7->_rangeMap;
      v7->_rangeMap = v55;
    }
    else
    {
      v53 = -[CRLWPRangeMap initWithSubRange:unmappedIndexes:isBackwardAffinities:]([CRLWPRangeMap alloc], "initWithSubRange:unmappedIndexes:isBackwardAffinities:", location, length, &v7->_bidiCharIndexes, &v7->_bidiDirectionMarkIsRTLVector);
      rangeMap = v7->_rangeMap;
      v7->_rangeMap = v53;
      p_end = &v7->_bidiCharIndexes.__end_;
      p_spaceCharIndexes = &v7->_bidiCharIndexes;
    }

    v7->_length = length + *p_end - p_spaceCharIndexes->__begin_;
    v7->_storageChangeCount = (unint64_t)objc_msgSend(v109, "changeCount");
  }

  return v7;
}

- (unsigned)composedCharacterAtCharIndex:(unint64_t)a3 isSurrogatePair:(BOOL *)a4
{
  id v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;

  *a4 = 0;
  v7 = -[CRLWPTextSource length](self->_source, "length");
  v8 = 0;
  if ((unint64_t)v7 > a3)
  {
    v9 = (unint64_t)v7;
    v8 = -[CRLWPTextSource characterAtIndex:](self->_source, "characterAtIndex:", a3);
    v10 = a3 + 1;
    if (a3 + 1 < v9)
    {
      v11 = -[CRLWPTextSource characterAtIndex:](self->_source, "characterAtIndex:", a3);
      v12 = -[CRLWPTextSource characterAtIndex:](self->_source, "characterAtIndex:", v10);
      if ((v11 & 0xFC00) == 0xD800 && (v12 & 0xFC00) == 56320)
      {
        *a4 = 1;
        return v12 + (v11 << 10) - 56613888;
      }
    }
  }
  return v8;
}

- (BOOL)adjustRangesByDelta:(int64_t)a3 startingAt:(unint64_t)a4
{
  unsigned __int8 v7;
  id storageChangeCount;

  v7 = -[CRLWPTextSource adjustRangesByDelta:startingAt:](self->_source, "adjustRangesByDelta:startingAt:");
  if (a3)
  {
    storageChangeCount = (id)self->_storageChangeCount;
    if (storageChangeCount != -[CRLWPTextSource changeCount](self->_source, "changeCount"))
    {
      self->_storageChangeCount = (unint64_t)-[CRLWPTextSource changeCount](self->_source, "changeCount");
      if ((v7 & 1) == 0)
        -[CRLWPRangeMap adjustByDelta:startingAt:](self->_rangeMap, "adjustByDelta:startingAt:", a3, a4);
      return 1;
    }
  }
  return v7;
}

- (_NSRange)range
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[CRLWPTextSource range](self->_source, "range");
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (BOOL)hasSmartFields
{
  return -[CRLWPTextSource hasSmartFields](self->_source, "hasSmartFields");
}

- (unint64_t)attachmentCount
{
  return (unint64_t)-[CRLWPTextSource attachmentCount](self->_source, "attachmentCount");
}

- (unint64_t)length
{
  return self->_length;
}

- (NSString)string
{
  id v3;
  NSUInteger v4;
  void *v5;
  _BYTE *v6;
  CRLWPTypesetterTextSource *v7;
  void *v8;
  unint64_t *begin;
  unint64_t *end;
  NSUInteger v11;
  _BYTE *v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  _BYTE *v23;
  _BYTE *v24;
  void *v25;
  char *v26;
  char *v27;
  unint64_t *v28;
  int v29;
  unint64_t *v30;
  NSUInteger v31;
  unint64_t v32;
  unint64_t v33;
  unsigned int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  _BYTE *v44;
  _BYTE *v45;
  void *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  void *v50;
  void *v51;
  void *v52;
  _BYTE *v53;
  _BYTE *v54;
  _BYTE *v55;
  void *v56;
  id v57;
  void *v58;
  NSUInteger v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  NSRange v65;
  NSUInteger length;
  NSUInteger location;
  unint64_t *v69;
  void *v70;
  CRLWPTypesetterTextSource *v71;
  uint8_t buf[4];
  unsigned int v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;
  NSRange v80;
  NSRange v81;

  v3 = -[CRLWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", 0, self->_length);
  length = v4;
  location = (NSUInteger)v3;
  v71 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextSource string](self->_source, "string"));
  v6 = objc_msgSend(v5, "length");

  v7 = self;
  if (v7->_spaceCharIndexes.__end_ != v7->_spaceCharIndexes.__begin_)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    begin = self->_spaceCharIndexes.__begin_;
    end = self->_spaceCharIndexes.__end_;
    if (begin == end)
    {
      v12 = (_BYTE *)location;
    }
    else
    {
      v11 = location;
      do
      {
        v12 = (_BYTE *)*begin;
        if (v11 > *begin)
        {
          v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101244180);
          v14 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v73 = v13;
            v74 = 2082;
            v75 = "-[CRLWPTypesetterTextSource string]";
            v76 = 2082;
            v77 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm";
            v78 = 1024;
            v79 = 279;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d unexpected index ordering", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012441A0);
          v15 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
          {
            v26 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v73 = v13;
            v74 = 2114;
            v75 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource string]"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 279, 0, "unexpected index ordering");

        }
        if (v12 > v6)
        {
          v18 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012441C0);
          v19 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v73 = v18;
            v74 = 2082;
            v75 = "-[CRLWPTypesetterTextSource string]";
            v76 = 2082;
            v77 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm";
            v78 = 1024;
            v79 = 281;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d request for characters past end of string (ruby)", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012441E0);
          v20 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
          {
            v27 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v73 = v18;
            v74 = 2114;
            v75 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource string]"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 281, 0, "request for characters past end of string (ruby)");

        }
        if (v12 >= v6)
          v12 = v6;
        if (v11 <= (unint64_t)v12)
          v23 = v12;
        else
          v23 = (_BYTE *)v11;
        if (v11 >= (unint64_t)v12)
          v24 = v12;
        else
          v24 = (_BYTE *)v11;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextSource substringWithRange:](self->_source, "substringWithRange:", v24, v23 - v24));
        objc_msgSend(v8, "appendString:", v25);

        objc_msgSend(v8, "appendFormat:", CFSTR("%C"), 8209);
        ++begin;
        v11 = (NSUInteger)v12;
      }
      while (begin != end);
    }
    if (v8)
    {
LABEL_75:
      if (location + length > (unint64_t)v6)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012442C0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E0BFB4();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012442E0);
        v50 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource string]"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v51, v52, 324, 0, "request for characters past end of string (extendedString)");

      }
      if (location + length >= (unint64_t)v6)
        v53 = v6;
      else
        v53 = (_BYTE *)(location + length);
      if (v12 <= v53)
        v54 = v53;
      else
        v54 = v12;
      if (v12 >= v53)
        v55 = v53;
      else
        v55 = v12;
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextSource substringWithRange:](v71->_source, "substringWithRange:", v55, v54 - v55));
      objc_msgSend(v8, "appendString:", v56);

      v57 = v8;
      v8 = v57;
      goto LABEL_95;
    }
LABEL_112:
    v58 = 0;
    goto LABEL_113;
  }
  if (self->_bidiCharIndexes.__end_ != self->_bidiCharIndexes.__begin_)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v28 = self->_bidiCharIndexes.__begin_;
    v69 = self->_bidiCharIndexes.__end_;
    if (v28 == v69)
    {
      v12 = (_BYTE *)location;
    }
    else
    {
      v29 = 0;
      v30 = self->_bidiDirectionMarkIsRTLVector.__begin_;
      v31 = location;
      do
      {
        v32 = *v28;
        v33 = *v30;
        if (v31 > *v28)
        {
          v34 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101244200);
          v35 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v73 = v34;
            v74 = 2082;
            v75 = "-[CRLWPTypesetterTextSource string]";
            v76 = 2082;
            v77 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm";
            v78 = 1024;
            v79 = 298;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d unexpected index ordering", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101244220);
          v36 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
          {
            v48 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v73 = v34;
            v74 = 2114;
            v75 = v48;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v36, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource string]"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 298, 0, "unexpected index ordering");

        }
        if (v32 > (unint64_t)v6)
        {
          v39 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101244240);
          v40 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v73 = v39;
            v74 = 2082;
            v75 = "-[CRLWPTypesetterTextSource string]";
            v76 = 2082;
            v77 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm";
            v78 = 1024;
            v79 = 300;
            _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d request for characters past end of string (bidi)", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101244260);
          v41 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
          {
            v49 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v73 = v39;
            v74 = 2114;
            v75 = v49;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v41, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource string]"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v42, v43, 300, 0, "request for characters past end of string (bidi)");

        }
        if (v32 >= (unint64_t)v6)
          v12 = v6;
        else
          v12 = (_BYTE *)v32;
        if (v31 <= (unint64_t)v12)
          v44 = v12;
        else
          v44 = (_BYTE *)v31;
        if (v31 >= (unint64_t)v12)
          v45 = v12;
        else
          v45 = (_BYTE *)v31;
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextSource substringWithRange:](v71->_source, "substringWithRange:", v45, v44 - v45));
        objc_msgSend(v70, "appendString:", v46);

        v47 = 8206;
        if ((v33 & (1 << v29)) != 0)
          v47 = 8207;
        objc_msgSend(v70, "appendFormat:", CFSTR("%C"), v47);
        ++v28;
        v30 += v29 == 63;
        if (v29 == 63)
          v29 = 0;
        else
          ++v29;
        v31 = (NSUInteger)v12;
      }
      while (v28 != v69);
    }
    v8 = v70;
    if (v70)
      goto LABEL_75;
    goto LABEL_112;
  }
  v59 = location;
  if (!location)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextSource string](self->_source, "string"));
    v61 = objc_msgSend(v60, "length");

    v7 = self;
    v59 = 0;
    if ((id)length == v61)
    {
      v8 = 0;
      v57 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPTextSource string](self->_source, "string"));
LABEL_95:
      v58 = v57;
      goto LABEL_113;
    }
  }
  if (v59 + length > (unint64_t)v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244280);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0BF34();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012442A0);
    v62 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPTypesetterTextSource string]"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTypesetterTextSource.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v63, v64, 311, 0, "request for characters past end of string");

    v80.length = length;
    v80.location = location;
    v81.location = 0;
    v81.length = (NSUInteger)v6;
    v65 = NSIntersectionRange(v80, v81);
    length = v65.length;
    location = v65.location;
    v7 = self;
  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextSource substringWithRange:](v7->_source, "substringWithRange:", location, length));
  v8 = 0;
LABEL_113:

  return (NSString *)v58;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  char *v6;
  uint64_t v7;
  unint64_t *end;
  unint64_t *begin;
  unint64_t v10;
  char *v11;
  char *v12;
  BOOL v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unsigned __int16 *v17;
  unint64_t *v18;
  unint64_t *v19;
  int v20;
  unint64_t *v21;
  unint64_t v22;
  char *v23;
  unint64_t v24;
  BOOL v25;
  char *v26;
  char *v27;
  uint64_t v28;
  unsigned __int16 *v29;
  __int16 v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;

  v6 = (char *)-[CRLWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);
  v33 = v7;
  v34 = v6;
  begin = self->_spaceCharIndexes.__begin_;
  end = self->_spaceCharIndexes.__end_;
  if (end == begin)
  {
    v19 = self->_bidiCharIndexes.__begin_;
    v18 = self->_bidiCharIndexes.__end_;
    if (v18 == v19)
    {
      v11 = v6;
    }
    else
    {
      v20 = 0;
      v21 = self->_bidiDirectionMarkIsRTLVector.__begin_;
      v22 = (unint64_t)v6;
      do
      {
        v23 = (char *)*v19++;
        v11 = v23;
        v24 = *v21 >> v20;
        v25 = v22 >= (unint64_t)v23;
        if (v22 <= (unint64_t)v23)
          v26 = v11;
        else
          v26 = (char *)v22;
        if (v25)
          v27 = v11;
        else
          v27 = (char *)v22;
        v28 = v26 - v27;
        -[CRLWPTextSource getCharacters:range:](self->_source, "getCharacters:range:", a3, v33, v34);
        v29 = &a3[v28];
        if ((v24 & 1) != 0)
          v30 = 8207;
        else
          v30 = 8206;
        *v29 = v30;
        a3 = v29 + 1;
        v21 += v20 == 63;
        if (v20 == 63)
          v20 = 0;
        else
          ++v20;
        v22 = (unint64_t)v11;
      }
      while (v19 != v18);
    }
  }
  else
  {
    v10 = (unint64_t)v6;
    do
    {
      v12 = (char *)*begin++;
      v11 = v12;
      v13 = v10 >= (unint64_t)v12;
      if (v10 <= (unint64_t)v12)
        v14 = v11;
      else
        v14 = (char *)v10;
      if (v13)
        v15 = v11;
      else
        v15 = (char *)v10;
      v16 = v14 - v15;
      -[CRLWPTextSource getCharacters:range:](self->_source, "getCharacters:range:", a3, v33, v34);
      v17 = &a3[v16];
      *v17 = 8209;
      a3 = v17 + 1;
      v10 = (unint64_t)v11;
    }
    while (begin != end);
  }
  if (v11 <= &v34[v33])
    v31 = &v34[v33];
  else
    v31 = v11;
  if (v11 >= &v34[v33])
    v32 = &v34[v33];
  else
    v32 = v11;
  -[CRLWPTextSource getCharacters:range:](self->_source, "getCharacters:range:", a3, v32, v31 - v32);
}

- (BOOL)hasColumnBreakAtCharIndex:(unint64_t)a3
{
  return -[CRLWPTextSource hasColumnBreakAtCharIndex:](self->_source, "hasColumnBreakAtCharIndex:", -[CRLWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  void *v8;
  unint64_t v9;
  _NSRange v12;

  v12 = (_NSRange)xmmword_100EECC60;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextSource smartFieldAtCharIndex:attributeKind:effectiveRange:](self->_source, "smartFieldAtCharIndex:attributeKind:effectiveRange:", -[CRLWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:"), a4, &v12));
  v12.location = (NSUInteger)-[CRLWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v12);
  v12.length = v9;
  if (a3 < v12.location || a3 - v12.location >= v9)
  {

    v8 = 0;
    v12 = (_NSRange)xmmword_100EECC60;
  }
  if (a5)
    *a5 = v12;
  return v8;
}

- (id)smartFieldsWithAttributeKind:(unint64_t)a3 intersectingRange:(_NSRange)a4
{
  CRLWPTextSource *source;
  id v6;
  uint64_t v7;

  source = self->_source;
  v6 = -[CRLWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);
  return -[CRLWPTextSource smartFieldsWithAttributeKind:intersectingRange:](source, "smartFieldsWithAttributeKind:intersectingRange:", a3, v6, v7);
}

- (int64_t)paragraphIndexAtCharIndex:(unint64_t)a3
{
  return -[CRLWPTypesetterTextSource paragraphIndexAtCharIndex:effectiveRange:](self, "paragraphIndexAtCharIndex:effectiveRange:", a3, 0);
}

- (int64_t)paragraphIndexAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id v6;
  NSUInteger v7;
  __int128 v9;

  v9 = xmmword_100EECC60;
  v6 = -[CRLWPTextSource paragraphIndexAtCharIndex:effectiveRange:](self->_source, "paragraphIndexAtCharIndex:effectiveRange:", -[CRLWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3), &v9);
  if (a4)
  {
    a4->location = (NSUInteger)-[CRLWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v9);
    a4->length = v7;
  }
  return (int64_t)v6;
}

- (id)paragraphStyleAtCharIndex:(unint64_t)a3
{
  return -[CRLWPTypesetterTextSource paragraphStyleAtCharIndex:effectiveRange:](self, "paragraphStyleAtCharIndex:effectiveRange:", a3, 0);
}

- (id)paragraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v6;
  NSUInteger v7;
  __int128 v9;

  v9 = xmmword_100EECC60;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextSource paragraphStyleAtCharIndex:effectiveRange:](self->_source, "paragraphStyleAtCharIndex:effectiveRange:", -[CRLWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3), &v9));
  if (a4)
  {
    a4->location = (NSUInteger)-[CRLWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v9);
    a4->length = v7;
  }
  return v6;
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(unint64_t)a3
{
  return 0;
}

- (id)characterStyleAtCharIndex:(unint64_t)a3
{
  return -[CRLWPTypesetterTextSource characterStyleAtCharIndex:effectiveRange:](self, "characterStyleAtCharIndex:effectiveRange:", a3, 0);
}

- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return -[CRLWPTypesetterTextSource characterStyleAtCharIndex:before:effectiveRange:](self, "characterStyleAtCharIndex:before:effectiveRange:", a3, 1, a4);
}

- (id)characterStyleAtCharIndex:(unint64_t)a3 before:(BOOL)a4 effectiveRange:(_NSRange *)a5
{
  _BOOL8 v6;
  CRLWPTextSource *source;
  unint64_t v9;
  __int128 *v10;
  void *v11;
  NSUInteger v12;
  __int128 v14;

  v6 = a4;
  v14 = xmmword_100EECC60;
  source = self->_source;
  v9 = -[CRLWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3);
  if (a5)
    v10 = &v14;
  else
    v10 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextSource characterStyleAtCharIndex:before:effectiveRange:](source, "characterStyleAtCharIndex:before:effectiveRange:", v9, v6, v10));
  if (a5)
  {
    a5->location = (NSUInteger)-[CRLWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v14);
    a5->length = v12;
  }
  return v11;
}

- (id)hyperlinkFieldAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  CRLWPTextSource *source;
  unint64_t v7;
  __int128 *v8;
  void *v9;
  NSUInteger v10;
  __int128 v12;

  v12 = xmmword_100EECC60;
  source = self->_source;
  v7 = -[CRLWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3);
  if (a4)
    v8 = &v12;
  else
    v8 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextSource hyperlinkFieldAtCharIndex:effectiveRange:](source, "hyperlinkFieldAtCharIndex:effectiveRange:", v7, v8));
  if (a4)
  {
    a4->location = (NSUInteger)-[CRLWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v12);
    a4->length = v10;
  }
  return v9;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  id v5;
  uint64_t v6;
  id v7;
  NSUInteger v8;
  _NSRange result;

  v5 = -[CRLWPTextSource wordAtCharIndex:includePreviousWord:](self->_source, "wordAtCharIndex:includePreviousWord:", -[CRLWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3), a4);
  v7 = -[CRLWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v5, v6);
  result.length = v8;
  result.location = (NSUInteger)v7;
  return result;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4 includeHyphenation:(BOOL)a5
{
  id v6;
  uint64_t v7;
  id v8;
  NSUInteger v9;
  _NSRange result;

  v6 = -[CRLWPTextSource wordAtCharIndex:includePreviousWord:includeHyphenation:](self->_source, "wordAtCharIndex:includePreviousWord:includeHyphenation:", -[CRLWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3), a4, a5);
  v8 = -[CRLWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v6, v7);
  result.length = v9;
  result.location = (NSUInteger)v8;
  return result;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return (unsigned __int16)-[CRLWPTextSource characterAtIndex:](self->_source, "characterAtIndex:", -[CRLWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(id)a5 hyphenChar:(unsigned int *)a6
{
  NSUInteger length;
  NSUInteger location;
  const __CFLocale *v11;
  CFIndex v12;
  id v13;
  CFIndex v14;
  CFIndex v15;
  __CFString *v16;
  CFIndex HyphenationLocationBeforeIndex;
  int64_t v18;
  CFRange v20;

  length = a4.length;
  location = a4.location;
  v11 = (const __CFLocale *)a5;
  v12 = -[CRLWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3);
  v13 = -[CRLWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", location, length);
  v15 = v14;
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CRLWPTextSource string](self->_source, "string"));
  v20.location = (CFIndex)v13;
  v20.length = v15;
  HyphenationLocationBeforeIndex = CFStringGetHyphenationLocationBeforeIndex(v16, v12, v20, 0, v11, a6);

  if (HyphenationLocationBeforeIndex == -1)
  {
    v18 = -1;
  }
  else
  {
    while (a3 > HyphenationLocationBeforeIndex)
    {
      if (-[CRLWPTypesetterTextSource characterAtIndex:](self, "characterAtIndex:", --a3) == 173)
      {
        HyphenationLocationBeforeIndex = a3 + 1;
        break;
      }
    }
    v18 = -[CRLWPRangeMap mappedCharIndex:](self->_rangeMap, "mappedCharIndex:", HyphenationLocationBeforeIndex);
  }

  return v18;
}

- (unint64_t)charIndexMappedToStorage:(unint64_t)a3
{
  return (unint64_t)-[CRLWPTextSource charIndexMappedToStorage:](self->_source, "charIndexMappedToStorage:", -[CRLWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3
{
  return -[CRLWPRangeMap mappedCharIndex:](self->_rangeMap, "mappedCharIndex:", -[CRLWPTextSource charIndexMappedFromStorage:](self->_source, "charIndexMappedFromStorage:", a3));
}

- (_NSRange)charRangeMappedToStorage:(_NSRange)a3
{
  CRLWPTextSource *source;
  id v4;
  uint64_t v5;
  id v6;
  NSUInteger v7;
  _NSRange result;

  source = self->_source;
  v4 = -[CRLWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a3.location, a3.length);
  v6 = -[CRLWPTextSource charRangeMappedToStorage:](source, "charRangeMappedToStorage:", v4, v5);
  result.length = v7;
  result.location = (NSUInteger)v6;
  return result;
}

- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3
{
  CRLWPRangeMap *rangeMap;
  id v4;
  uint64_t v5;
  id v6;
  NSUInteger v7;
  _NSRange result;

  rangeMap = self->_rangeMap;
  v4 = -[CRLWPTextSource charRangeMappedFromStorage:](self->_source, "charRangeMappedFromStorage:", a3.location, a3.length);
  v6 = -[CRLWPRangeMap mappedCharRange:](rangeMap, "mappedCharRange:", v4, v5);
  result.length = v7;
  result.location = (NSUInteger)v6;
  return result;
}

- (unint64_t)charIndexRemappedFromStorage:(unint64_t)a3
{
  return -[CRLWPTypesetterTextSource charIndexMappedToStorage:](self, "charIndexMappedToStorage:", -[CRLWPTypesetterTextSource charIndexMappedFromStorage:](self, "charIndexMappedFromStorage:", a3));
}

- (_NSRange)charRangeRemappedFromStorage:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  char *v7;
  NSUInteger v8;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = -[CRLWPTypesetterTextSource charIndexRemappedFromStorage:](self, "charIndexRemappedFromStorage:");
  v7 = (char *)-[CRLWPTypesetterTextSource charIndexRemappedFromStorage:](self, "charIndexRemappedFromStorage:", location + length)- v6;
  v8 = v6;
  result.length = (NSUInteger)v7;
  result.location = v8;
  return result;
}

- (unint64_t)changeCount
{
  return self->_storageChangeCount;
}

- (void)updateStorageChangeCount
{
  -[CRLWPTextSource updateStorageChangeCount](self->_source, "updateStorageChangeCount");
  self->_storageChangeCount = (unint64_t)-[CRLWPTextSource changeCount](self->_source, "changeCount");
}

- (unint64_t)storageLength
{
  return (unint64_t)-[CRLWPTextSource storageLength](self->_source, "storageLength");
}

- (unint64_t)bidiCharIndexCount
{
  return self->_bidiCharIndexes.__end_ - self->_bidiCharIndexes.__begin_;
}

- (unint64_t)spaceCharIndexCount
{
  return self->_spaceCharIndexes.__end_ - self->_spaceCharIndexes.__begin_;
}

- (unsigned)wpKind
{
  return -[CRLWPTextSource wpKind](self->_source, "wpKind");
}

- (id)attachmentOrFootnoteAtCharIndex:(unint64_t)a3
{
  return 0;
}

- (int64_t)charIndexForParagraphAtIndex:(unint64_t)a3
{
  id v3;
  __int128 v5;

  v5 = xmmword_100EEE418;
  v3 = -[CRLWPTypesetterTextSource paragraphStyleAtParIndex:effectiveRange:](self, "paragraphStyleAtParIndex:effectiveRange:", a3, &v5);
  return v5;
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3
{
  return -[CRLWPTypesetterTextSource paragraphStyleAtParIndex:effectiveRange:](self, "paragraphStyleAtParIndex:effectiveRange:", a3, 0);
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return -[CRLWPTextSource paragraphStyleAtParIndex:effectiveRange:](self->_source, "paragraphStyleAtParIndex:effectiveRange:", a3, a4);
}

- (int64_t)listNumberAtParIndex:(unint64_t)a3
{
  return (int64_t)-[CRLWPTextSource listNumberAtParIndex:](self->_source, "listNumberAtParIndex:", a3);
}

- (id)listStyleAtParIndex:(unint64_t)a3
{
  return -[CRLWPTypesetterTextSource listStyleAtParIndex:effectiveRange:](self, "listStyleAtParIndex:effectiveRange:", a3, 0);
}

- (id)listStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return -[CRLWPTextSource listStyleAtParIndex:effectiveRange:](self->_source, "listStyleAtParIndex:effectiveRange:", a3, a4);
}

- (id)listStyleAtCharIndex:(unint64_t)a3
{
  return -[CRLWPTextSource listStyleAtCharIndex:](self->_source, "listStyleAtCharIndex:", a3);
}

- (id)listStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return -[CRLWPTextSource listStyleAtCharIndex:effectiveRange:](self->_source, "listStyleAtCharIndex:effectiveRange:", a3, a4);
}

- (unint64_t)paragraphLevelAtParIndex:(unint64_t)a3
{
  return (unint64_t)-[CRLWPTextSource paragraphLevelAtParIndex:](self->_source, "paragraphLevelAtParIndex:", a3);
}

- (unint64_t)paragraphLevelAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return (unint64_t)-[CRLWPTextSource paragraphLevelAtParIndex:effectiveRange:](self->_source, "paragraphLevelAtParIndex:effectiveRange:", a3, a4);
}

- (unint64_t)listStartAtParIndex:(unint64_t)a3
{
  return (unint64_t)-[CRLWPTextSource listStartAtParIndex:](self->_source, "listStartAtParIndex:", a3);
}

- (unint64_t)listStartAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return (unint64_t)-[CRLWPTextSource listStartAtParIndex:effectiveRange:](self->_source, "listStartAtParIndex:effectiveRange:", a3, a4);
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtParIndex:(int64_t)a3
{
  return -[CRLWPTextSource isWritingDirectionRightToLeftForParagraphAtParIndex:](self->_source, "isWritingDirectionRightToLeftForParagraphAtParIndex:", a3);
}

- (_NSRange)textRangeForParagraphAtIndex:(int64_t)a3
{
  id v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[CRLWPTextSource textRangeForParagraphAtIndex:](self->_source, "textRangeForParagraphAtIndex:", a3);
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (int64_t)nextCharacterIndex:(int64_t)a3
{
  return (int64_t)-[CRLWPTextSource nextCharacterIndex:](self->_source, "nextCharacterIndex:", a3);
}

- (_NSRange)textRangeForParagraphAtCharIndex:(int64_t)a3
{
  id v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[CRLWPTextSource textRangeForParagraphAtIndex:](self->_source, "textRangeForParagraphAtIndex:", -[CRLWPTypesetterTextSource paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:", a3));
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (int64_t)previousCharacterIndex:(int64_t)a3
{
  return (int64_t)-[CRLWPTextSource previousCharacterIndex:](self->_source, "previousCharacterIndex:", a3);
}

- (void)smartFieldDidChange:(id)a3
{
  -[CRLWPTextSource smartFieldDidChange:](self->_source, "smartFieldDidChange:", a3);
}

- (id)stringEquivalentFromRange:(_NSRange)a3
{
  return -[CRLWPTextSource stringEquivalentFromRange:](self->_source, "stringEquivalentFromRange:", a3.location, a3.length);
}

- (_NSRange)rangeByExpandingToIncludePartialWords:(_NSRange)a3
{
  id v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[CRLWPTextSource rangeByExpandingToIncludePartialWords:](self->_source, "rangeByExpandingToIncludePartialWords:", a3.location, a3.length);
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (BOOL)hasSmartFieldsInRange:(_NSRange)a3
{
  return -[CRLWPTextSource hasSmartFieldsInRange:](self->_source, "hasSmartFieldsInRange:", a3.location, a3.length);
}

- (unint64_t)paragraphCount
{
  return (unint64_t)-[CRLWPTextSource paragraphCount](self->_source, "paragraphCount");
}

- (BOOL)allowsTypographicalFractions
{
  return -[CRLWPTextSource allowsTypographicalFractions](self->_source, "allowsTypographicalFractions");
}

- (BOOL)isAllWhitespaceInRange:(_NSRange)a3
{
  return -[CRLWPTextSource isAllWhitespaceInRange:](self->_source, "isAllWhitespaceInRange:", a3.location, a3.length);
}

- (id)languageForTextRange:(_NSRange)a3 useStringTokenizer:(BOOL)a4 useDocumentLanguage:(BOOL)a5
{
  return -[CRLWPTextSource languageForTextRange:useStringTokenizer:useDocumentLanguage:](self->_source, "languageForTextRange:useStringTokenizer:useDocumentLanguage:", a3.location, a3.length, a4, a5);
}

- (void).cxx_destruct
{
  unint64_t *begin;
  unint64_t *v4;
  unint64_t *v5;

  objc_storeStrong((id *)&self->_rangeMap, 0);
  objc_storeStrong((id *)&self->_source, 0);
  begin = self->_bidiDirectionMarkIsRTLVector.__begin_;
  if (begin)
    operator delete(begin);
  v4 = self->_bidiCharIndexes.__begin_;
  if (v4)
  {
    self->_bidiCharIndexes.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_spaceCharIndexes.__begin_;
  if (v5)
  {
    self->_spaceCharIndexes.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
