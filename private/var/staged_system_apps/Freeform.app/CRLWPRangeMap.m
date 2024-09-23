@implementation CRLWPRangeMap

- (CRLWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedPairIndexes:(const void *)a4
{
  NSUInteger length;
  NSUInteger location;
  CRLWPRangeMap *v7;
  CRLWPRangeMap *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _CRLWPCharIndexAndAffinity *begin;
  _CRLWPCharIndexAndAffinity *end;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  _DWORD *v20;
  _DWORD *v21;

  length = a3.length;
  location = a3.location;
  v7 = -[CRLWPRangeMap initWithSubRange:unmappedIndexes:affinity:](self, "initWithSubRange:unmappedIndexes:affinity:", a3.location, a3.length, a4, 0);
  v8 = v7;
  if (v7)
  {
    v7->_subRange.location = location;
    v7->_subRange.length = length;
    v9 = *((_QWORD *)a4 + 1) - *(_QWORD *)a4;
    if ((v9 & 8) != 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C000);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E182A0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C020);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap initWithSubRange:unmappedPairIndexes:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 31, 0, "expected an even number of indexes");

    }
    begin = v8->_unmappedIndexes.__begin_;
    end = v8->_unmappedIndexes.__end_;
    v15 = (end - begin) >> 4;
    if (v15 != v9 >> 3 || v9 >> 3 != (v8->_mappedIndexes.__end_ - v8->_mappedIndexes.__begin_) >> 4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C040);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E18220();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C060);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap initWithSubRange:unmappedPairIndexes:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 32, 0, "index vector size is wrong");

      begin = v8->_unmappedIndexes.__begin_;
      end = v8->_unmappedIndexes.__end_;
      v15 = (end - begin) >> 4;
    }
    if (end != begin)
    {
      v19 = 0;
      v20 = (_DWORD *)((char *)v8->_mappedIndexes.__begin_ + 24);
      v21 = (_DWORD *)((char *)begin + 24);
      do
      {
        *(v21 - 4) = 2;
        *v21 = 1;
        v21 += 8;
        *(v20 - 4) = 2;
        *v20 = 1;
        v20 += 8;
        v19 += 2;
      }
      while (v19 < v15);
    }
  }
  return v8;
}

- (CRLWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedIndexes:(const void *)a4 isBackwardAffinities:(const void *)a5
{
  NSUInteger length;
  NSUInteger location;
  CRLWPRangeMap *v9;
  CRLWPRangeMap *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int *v21;
  int v22;

  length = a3.length;
  location = a3.location;
  v9 = -[CRLWPRangeMap initWithSubRange:unmappedIndexes:affinity:](self, "initWithSubRange:unmappedIndexes:affinity:", a3.location, a3.length, a4, 0);
  v10 = v9;
  if (v9)
  {
    v9->_subRange.location = location;
    v9->_subRange.length = length;
    v12 = *(_QWORD *)a4;
    v11 = *((_QWORD *)a4 + 1);
    v13 = (v11 - *(_QWORD *)a4) >> 3;
    if (v13 != (v9->_unmappedIndexes.__end_ - v9->_unmappedIndexes.__begin_) >> 4
      || v13 != (v9->_mappedIndexes.__end_ - v9->_mappedIndexes.__begin_) >> 4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C080);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E18320();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C0A0);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap initWithSubRange:unmappedIndexes:isBackwardAffinities:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 52, 0, "index vector size is wrong");

    }
    if (v11 != v12)
    {
      v17 = 0;
      v18 = *(_QWORD *)a5;
      if (v13 <= 1)
        v19 = 1;
      else
        v19 = v13;
      v20 = (int *)((char *)v10->_unmappedIndexes.__begin_ + 8);
      v21 = (int *)((char *)v10->_mappedIndexes.__begin_ + 8);
      do
      {
        if (((*(_QWORD *)(v18 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v17) & 1) != 0)
          v22 = 1;
        else
          v22 = 2;
        *v20 = v22;
        v20 += 4;
        *v21 = v22;
        v21 += 4;
        ++v17;
      }
      while (v19 != v17);
    }
  }
  return v10;
}

- (CRLWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedIndexes:(const void *)a4 affinity:(int)a5
{
  NSUInteger length;
  NSUInteger location;
  CRLWPRangeMap *v9;
  CRLWPRangeMap *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  BOOL v19;
  NSUInteger v20;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  void *v28;
  _CRLWPCharIndexAndAffinity *end;
  _CRLWPCharIndexAndAffinity *value;
  _CRLWPCharIndexAndAffinity *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  _CRLWPCharIndexAndAffinity *v38;
  _CRLWPCharIndexAndAffinity *begin;
  _CRLWPCharIndexAndAffinity *v40;
  NSUInteger v41;
  _CRLWPCharIndexAndAffinity *v42;
  _CRLWPCharIndexAndAffinity *v43;
  _CRLWPCharIndexAndAffinity *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  _CRLWPCharIndexAndAffinity *v51;
  _CRLWPCharIndexAndAffinity *v52;
  _CRLWPCharIndexAndAffinity *v53;
  NSString *v54;
  void *v55;
  char *v56;
  unint64_t v58;
  vector<_CRLWPCharIndexAndAffinity, std::allocator<_CRLWPCharIndexAndAffinity>> *p_mappedIndexes;
  vector<_CRLWPCharIndexAndAffinity, std::allocator<_CRLWPCharIndexAndAffinity>> *p_unmappedIndexes;
  objc_super v61;
  uint8_t buf[4];
  unsigned int v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  int v69;
  __int16 v70;
  unint64_t v71;
  __int16 v72;
  unint64_t v73;
  __int16 v74;
  void *v75;

  length = a3.length;
  location = a3.location;
  v61.receiver = self;
  v61.super_class = (Class)CRLWPRangeMap;
  v9 = -[CRLWPRangeMap init](&v61, "init");
  v10 = v9;
  if (v9)
  {
    v9->_subRange.location = location;
    v9->_subRange.length = length;
    v12 = *(_QWORD *)a4;
    v11 = *((_QWORD *)a4 + 1);
    v13 = (v11 - *(_QWORD *)a4) >> 3;
    p_unmappedIndexes = &v9->_unmappedIndexes;
    sub_1002ABA04((void **)&v9->_unmappedIndexes.__begin_, v13);
    p_mappedIndexes = &v10->_mappedIndexes;
    sub_1002ABA04((void **)&v10->_mappedIndexes.__begin_, v13);
    v58 = v13;
    if (v11 != v12)
    {
      v14 = 0;
      if (v13 <= 1)
        v15 = 1;
      else
        v15 = v13;
      do
      {
        v16 = *(_QWORD *)(*(_QWORD *)a4 + 8 * v14);
        v17 = v10->_subRange.location;
        v18 = v10->_subRange.length;
        v19 = v16 - v17 < v18 && v16 >= v17;
        v20 = v18 + v17;
        if (!v19 && v16 != v20)
        {
          v22 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124C0C0);
          v23 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
          {
            v54 = NSStringFromRange(v10->_subRange);
            v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
            *(_DWORD *)buf = 67110658;
            v63 = v22;
            v64 = 2082;
            v65 = "-[CRLWPRangeMap initWithSubRange:unmappedIndexes:affinity:]";
            v66 = 2082;
            v67 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm";
            v68 = 1024;
            v69 = 78;
            v70 = 2048;
            v71 = v16;
            v72 = 2048;
            v73 = v58;
            v74 = 2114;
            v75 = v55;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d index is out of bounds: %lu / %lu : %{public}@ ", buf, 0x40u);

          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124C0E0);
          v24 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
          {
            v56 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v63 = v22;
            v64 = 2114;
            v65 = v56;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap initWithSubRange:unmappedIndexes:affinity:]"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"));
          v27 = NSStringFromRange(v10->_subRange);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 78, 0, "index is out of bounds: %lu / %lu : %{public}@ ", v16, v58, v28);

        }
        end = v10->_unmappedIndexes.__end_;
        value = v10->_unmappedIndexes.__end_cap_.__value_;
        if (end >= value)
        {
          v32 = (end - p_unmappedIndexes->__begin_) >> 4;
          v33 = v32 + 1;
          if ((unint64_t)(v32 + 1) >> 60)
            sub_100007810();
          v34 = value - p_unmappedIndexes->__begin_;
          if (v34 >> 3 > v33)
            v33 = v34 >> 3;
          if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0)
            v35 = 0xFFFFFFFFFFFFFFFLL;
          else
            v35 = v33;
          if (v35)
            v36 = (char *)sub_10001FB2C((uint64_t)&v10->_unmappedIndexes.__end_cap_, v35);
          else
            v36 = 0;
          v37 = &v36[16 * v32];
          *(_QWORD *)v37 = v16;
          *((_DWORD *)v37 + 2) = a5;
          *((_DWORD *)v37 + 3) = 0;
          begin = v10->_unmappedIndexes.__begin_;
          v38 = v10->_unmappedIndexes.__end_;
          v40 = (_CRLWPCharIndexAndAffinity *)v37;
          if (v38 != begin)
          {
            do
            {
              *((_OWORD *)v40 - 1) = *((_OWORD *)v38 - 1);
              v40 = (_CRLWPCharIndexAndAffinity *)((char *)v40 - 16);
              v38 = (_CRLWPCharIndexAndAffinity *)((char *)v38 - 16);
            }
            while (v38 != begin);
            v38 = p_unmappedIndexes->__begin_;
          }
          v31 = (_CRLWPCharIndexAndAffinity *)(v37 + 16);
          v10->_unmappedIndexes.__begin_ = v40;
          v10->_unmappedIndexes.__end_ = (_CRLWPCharIndexAndAffinity *)(v37 + 16);
          v10->_unmappedIndexes.__end_cap_.__value_ = (_CRLWPCharIndexAndAffinity *)&v36[16 * v35];
          if (v38)
            operator delete(v38);
        }
        else
        {
          *(_QWORD *)end = v16;
          v31 = (_CRLWPCharIndexAndAffinity *)((char *)end + 16);
          *((_DWORD *)end + 2) = a5;
          *((_DWORD *)end + 3) = 0;
        }
        v10->_unmappedIndexes.__end_ = v31;
        v41 = v16 - v10->_subRange.location + v14;
        v42 = v10->_mappedIndexes.__end_;
        v43 = v10->_mappedIndexes.__end_cap_.__value_;
        if (v42 >= v43)
        {
          v45 = (v42 - p_mappedIndexes->__begin_) >> 4;
          v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 60)
            sub_100007810();
          v47 = v43 - p_mappedIndexes->__begin_;
          if (v47 >> 3 > v46)
            v46 = v47 >> 3;
          if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0)
            v48 = 0xFFFFFFFFFFFFFFFLL;
          else
            v48 = v46;
          if (v48)
            v49 = (char *)sub_10001FB2C((uint64_t)&v10->_mappedIndexes.__end_cap_, v48);
          else
            v49 = 0;
          v50 = &v49[16 * v45];
          *(_QWORD *)v50 = v41;
          *((_DWORD *)v50 + 2) = a5;
          *((_DWORD *)v50 + 3) = 0;
          v52 = v10->_mappedIndexes.__begin_;
          v51 = v10->_mappedIndexes.__end_;
          v53 = (_CRLWPCharIndexAndAffinity *)v50;
          if (v51 != v52)
          {
            do
            {
              *((_OWORD *)v53 - 1) = *((_OWORD *)v51 - 1);
              v53 = (_CRLWPCharIndexAndAffinity *)((char *)v53 - 16);
              v51 = (_CRLWPCharIndexAndAffinity *)((char *)v51 - 16);
            }
            while (v51 != v52);
            v51 = p_mappedIndexes->__begin_;
          }
          v44 = (_CRLWPCharIndexAndAffinity *)(v50 + 16);
          v10->_mappedIndexes.__begin_ = v53;
          v10->_mappedIndexes.__end_ = (_CRLWPCharIndexAndAffinity *)(v50 + 16);
          v10->_mappedIndexes.__end_cap_.__value_ = (_CRLWPCharIndexAndAffinity *)&v49[16 * v48];
          if (v51)
            operator delete(v51);
        }
        else
        {
          *(_QWORD *)v42 = v41;
          v44 = (_CRLWPCharIndexAndAffinity *)((char *)v42 + 16);
          *((_DWORD *)v42 + 2) = a5;
          *((_DWORD *)v42 + 3) = 0;
        }
        v10->_mappedIndexes.__end_ = v44;
        ++v14;
      }
      while (v14 != v15);
    }
  }
  return v10;
}

- (unint64_t)mappedCharIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  _CRLWPCharIndexAndAffinity *begin;
  _CRLWPCharIndexAndAffinity *end;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  _CRLWPCharIndexAndAffinity *v16;
  unint64_t v17;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C100);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E183A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C120);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap mappedCharIndex:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 98, 0, "shouldn't be trying to map NSNotFound");

  }
  v8 = -[CRLWPRangeMap subRange](self, "subRange");
  -[CRLWPRangeMap subRange](self, "subRange");
  if (a3 - (unint64_t)v8 > v9)
    return 0x7FFFFFFFFFFFFFFFLL;
  begin = self->_unmappedIndexes.__begin_;
  end = self->_unmappedIndexes.__end_;
  if (end != begin)
  {
    v13 = (end - begin) >> 4;
    end = self->_unmappedIndexes.__begin_;
    do
    {
      v14 = v13 >> 1;
      v15 = (unint64_t *)((char *)end + 16 * (v13 >> 1));
      v17 = *v15;
      v16 = (_CRLWPCharIndexAndAffinity *)(v15 + 2);
      v13 += ~(v13 >> 1);
      if (v17 > a3)
        v13 = v14;
      else
        end = v16;
    }
    while (v13);
  }
  return a3 - (_QWORD)-[CRLWPRangeMap subRange](self, "subRange") + ((end - begin) >> 4);
}

- (unint64_t)unmappedCharIndex:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  _CRLWPCharIndexAndAffinity *end;
  _CRLWPCharIndexAndAffinity *begin;
  unint64_t v10;
  _CRLWPCharIndexAndAffinity *v11;
  unint64_t v12;
  _QWORD *v13;
  _CRLWPCharIndexAndAffinity *v14;
  unint64_t v15;
  int v16;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C140);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E184A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C160);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap unmappedCharIndex:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 114, 0, "shouldn't be trying to map NSNotFound");

  }
  begin = self->_mappedIndexes.__begin_;
  end = self->_mappedIndexes.__end_;
  if (end == begin)
  {
    v11 = self->_mappedIndexes.__end_;
  }
  else
  {
    v10 = (end - begin) >> 4;
    v11 = self->_mappedIndexes.__begin_;
    do
    {
      v12 = v10 >> 1;
      v13 = (_QWORD *)((char *)v11 + 16 * (v10 >> 1));
      v15 = *v13;
      v14 = (_CRLWPCharIndexAndAffinity *)(v13 + 2);
      v10 += ~(v10 >> 1);
      if (v15 < v3)
        v11 = v14;
      else
        v10 = v12;
    }
    while (v10);
  }
  if (end == v11 || *(_QWORD *)v11 != v3)
    return (unint64_t)-[CRLWPRangeMap subRange](self, "subRange") + v3 - ((v11 - begin) >> 4);
  v16 = *((_DWORD *)v11 + 2);
  if (v16 == 2)
  {
    ++v3;
  }
  else if (v16 == 1)
  {
    --v3;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C180);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E18420();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C1A0);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap unmappedCharIndex:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 131, 0, "bad affinity");

  }
  return -[CRLWPRangeMap unmappedCharIndex:](self, "unmappedCharIndex:", v3);
}

- (unint64_t)p_extendLeftMappedIndex:(unint64_t)a3
{
  _CRLWPCharIndexAndAffinity *begin;
  _CRLWPCharIndexAndAffinity *end;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _CRLWPCharIndexAndAffinity *v9;
  unint64_t v10;

  if (a3)
  {
    begin = self->_mappedIndexes.__begin_;
    end = self->_mappedIndexes.__end_;
    v5 = a3 - 1;
    if (end != begin)
    {
      v6 = (end - begin) >> 4;
      do
      {
        v7 = v6 >> 1;
        v8 = (_QWORD *)((char *)begin + 16 * (v6 >> 1));
        v10 = *v8;
        v9 = (_CRLWPCharIndexAndAffinity *)(v8 + 2);
        v6 += ~(v6 >> 1);
        if (v10 < v5)
          begin = v9;
        else
          v6 = v7;
      }
      while (v6);
    }
    if (begin != end && *(_QWORD *)begin == v5 && *((_DWORD *)begin + 2) == 2)
      --a3;
  }
  return a3;
}

- (unint64_t)p_extendRightMappedIndex:(unint64_t)a3
{
  _CRLWPCharIndexAndAffinity *begin;
  _CRLWPCharIndexAndAffinity *end;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _CRLWPCharIndexAndAffinity *v9;
  unint64_t v10;

  begin = self->_mappedIndexes.__begin_;
  end = self->_mappedIndexes.__end_;
  v5 = a3 + 1;
  if (end != begin)
  {
    v6 = (end - begin) >> 4;
    do
    {
      v7 = v6 >> 1;
      v8 = (_QWORD *)((char *)begin + 16 * (v6 >> 1));
      v10 = *v8;
      v9 = (_CRLWPCharIndexAndAffinity *)(v8 + 2);
      v6 += ~(v6 >> 1);
      if (v10 < v5)
        begin = v9;
      else
        v6 = v7;
    }
    while (v6);
  }
  if (begin != end && *(_QWORD *)begin == v5 && *((_DWORD *)begin + 2) == 1)
    ++a3;
  return a3;
}

- (_NSRange)mappedCharRange:(_NSRange)a3
{
  NSUInteger length;
  unint64_t location;
  NSUInteger v6;
  id v7;
  id v8;
  NSUInteger v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  NSString *v22;
  void *v23;
  NSUInteger v24;
  NSUInteger v25;
  NSString *v26;
  NSString *v27;
  void *v28;
  void *v29;
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
  __int16 v40;
  uint64_t v41;
  NSRange v42;
  NSRange v43;
  NSRange v44;
  NSRange v45;
  NSRange v46;
  _NSRange result;
  NSRange v48;

  length = a3.length;
  location = a3.location;
  v48.location = (NSUInteger)-[CRLWPRangeMap subRange](self, "subRange");
  v48.length = v6;
  v42.location = location;
  v42.length = length;
  if (NSIntersectionRange(v42, v48).length)
  {
    v7 = -[CRLWPRangeMap subRange](self, "subRange");
    if (location <= (unint64_t)v7)
      v8 = v7;
    else
      v8 = (id)location;
    v9 = -[CRLWPRangeMap p_extendLeftMappedIndex:](self, "p_extendLeftMappedIndex:", -[CRLWPRangeMap mappedCharIndex:](self, "mappedCharIndex:", v8));
    v10 = (char *)-[CRLWPRangeMap subRange](self, "subRange");
    v12 = &v10[v11];
    if ((unint64_t)&v10[v11] >= location + length)
      v12 = (char *)(location + length);
    v13 = (char *)-[CRLWPRangeMap p_extendRightMappedIndex:](self, "p_extendRightMappedIndex:", -[CRLWPRangeMap mappedCharIndex:](self, "mappedCharIndex:", v12 - 1))- v9+ 1;
  }
  else if (location >= (unint64_t)-[CRLWPRangeMap subRange](self, "subRange"))
  {
    -[CRLWPRangeMap subRange](self, "subRange");
    v13 = 0;
    v9 = v14 + ((self->_mappedIndexes.__end_ - self->_mappedIndexes.__begin_) >> 4);
  }
  else
  {
    v9 = 0;
    v13 = 0;
  }
  if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C1C0);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      v45.location = location;
      v45.length = length;
      v26 = NSStringFromRange(v45);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v46.location = v9;
      v46.length = (NSUInteger)v13;
      v27 = NSStringFromRange(v46);
      *(_DWORD *)buf = 67110402;
      v31 = v15;
      v32 = 2082;
      v33 = "-[CRLWPRangeMap mappedCharRange:]";
      v34 = 2082;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm";
      v36 = 1024;
      v37 = 191;
      v38 = 2114;
      v39 = v29;
      v40 = 2114;
      v41 = objc_claimAutoreleasedReturnValue(v27);
      v28 = (void *)v41;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Bad range mapping: %{public}@ -> %{public}@", buf, 0x36u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C1E0);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRangeMap mappedCharRange:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeMap.mm"));
    v43.location = location;
    v43.length = length;
    v20 = NSStringFromRange(v43);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v44.location = v9;
    v44.length = (NSUInteger)v13;
    v22 = NSStringFromRange(v44);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 191, 0, "Bad range mapping: %{public}@ -> %{public}@", v21, v23);

  }
  if ((unint64_t)v13 <= 0x7FFFFFFFFFFFFFFELL)
    v24 = v9;
  else
    v24 = 0x7FFFFFFFFFFFFFFFLL;
  if ((unint64_t)v13 <= 0x7FFFFFFFFFFFFFFELL)
    v25 = (NSUInteger)v13;
  else
    v25 = 0;
  result.length = v25;
  result.location = v24;
  return result;
}

- (_NSRange)unmappedCharRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  NSUInteger v7;
  char *v8;
  char *v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = -[CRLWPRangeMap unmappedCharIndex:](self, "unmappedCharIndex:");
  v7 = v6;
  if (length)
    v8 = (char *)-[CRLWPRangeMap unmappedCharIndex:](self, "unmappedCharIndex:", length + location - 1) + 1;
  else
    v8 = (char *)v6;
  if (v7 <= (unint64_t)v8)
    v9 = v8;
  else
    v9 = (char *)v7;
  if (v7 >= (unint64_t)v8)
    v10 = (NSUInteger)v8;
  else
    v10 = v7;
  v11 = (NSUInteger)&v9[-v10];
  result.length = v11;
  result.location = v10;
  return result;
}

- (void)adjustByDelta:(int64_t)a3 startingAt:(unint64_t)a4
{
  _CRLWPCharIndexAndAffinity *begin;
  _CRLWPCharIndexAndAffinity *end;

  if ((unint64_t)-[CRLWPRangeMap subRange](self, "subRange") >= a4)
    self->_subRange.location += a3;
  begin = self->_unmappedIndexes.__begin_;
  end = self->_unmappedIndexes.__end_;
  while (begin != end)
  {
    if (*(_QWORD *)begin >= a4)
      *(_QWORD *)begin += a3;
    begin = (_CRLWPCharIndexAndAffinity *)((char *)begin + 16);
  }
}

- (_NSRange)subRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_subRange.length;
  location = self->_subRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSubRange:(_NSRange)a3
{
  self->_subRange = a3;
}

- (vector<_CRLWPCharIndexAndAffinity,)unmappedIndexes
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<_CRLWPCharIndexAndAffinity, std::allocator<_CRLWPCharIndexAndAffinity>> *)sub_1002AC894(retstr, self->_unmappedIndexes.__begin_, (uint64_t)self->_unmappedIndexes.__end_, (self->_unmappedIndexes.__end_- self->_unmappedIndexes.__begin_) >> 4);
}

- (void)setUnmappedIndexes:()vector<_CRLWPCharIndexAndAffinity
{
  char *p_unmappedIndexes;

  p_unmappedIndexes = (char *)&self->_unmappedIndexes;
  if (p_unmappedIndexes != (char *)a3)
    sub_10001FB60(p_unmappedIndexes, (char *)a3->__begin_, (uint64_t)a3->__end_, (a3->__end_ - a3->__begin_) >> 4);
}

- (vector<_CRLWPCharIndexAndAffinity,)mappedIndexes
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<_CRLWPCharIndexAndAffinity, std::allocator<_CRLWPCharIndexAndAffinity>> *)sub_1002AC894(retstr, self->_mappedIndexes.__begin_, (uint64_t)self->_mappedIndexes.__end_, (self->_mappedIndexes.__end_- self->_mappedIndexes.__begin_) >> 4);
}

- (void)setMappedIndexes:()vector<_CRLWPCharIndexAndAffinity
{
  char *p_mappedIndexes;

  p_mappedIndexes = (char *)&self->_mappedIndexes;
  if (p_mappedIndexes != (char *)a3)
    sub_10001FB60(p_mappedIndexes, (char *)a3->__begin_, (uint64_t)a3->__end_, (a3->__end_ - a3->__begin_) >> 4);
}

- (void).cxx_destruct
{
  _CRLWPCharIndexAndAffinity *begin;
  _CRLWPCharIndexAndAffinity *v4;

  begin = self->_mappedIndexes.__begin_;
  if (begin)
  {
    self->_mappedIndexes.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_unmappedIndexes.__begin_;
  if (v4)
  {
    self->_unmappedIndexes.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end
