@implementation CRLBezierPathBooleanOperationInputPathMap

- (int64_t)elementCount
{
  return ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4;
}

- (id)copyWithElementsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CRLBezierPathBooleanOperationInputPathMap *v6;
  CRLBezierPathBooleanOperationInputPathMap *v7;
  __int128 *begin;
  uint64_t v9;
  NSUInteger v10;
  void *v11;
  unsigned int v13;
  NSObject *v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned int v26;
  NSObject *v27;
  int64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CKRecordID v37;
  Swift::String v38;
  int64_t v39;
  int64_t v40;
  _BYTE buf[28];
  __int16 v42;
  int v43;
  __int16 v44;
  NSUInteger v45;
  __int16 v46;
  int64_t v47;

  length = a3.length;
  location = a3.location;
  v6 = objc_alloc_init(CRLBezierPathBooleanOperationInputPathMap);
  v7 = v6;
  if (v6 != self)
  {
    v6->_BOOLeanSubpathIndexToInputBezierPathIndex.__table_.__p3_.__value_ = self->_BOOLeanSubpathIndexToInputBezierPathIndex.__table_.__p3_.__value_;
    sub_10032D544(&v6->_BOOLeanSubpathIndexToInputBezierPathIndex.__table_.__bucket_list_.__ptr_.__value_, (_QWORD *)self->_BOOLeanSubpathIndexToInputBezierPathIndex.__table_.__p1_.__value_.__next_, 0);
  }
  if (length)
  {
    begin = (__int128 *)self->_points.__begin_;
    v9 = (char *)self->_points.__end_ - (char *)begin;
    if (location >= v9 >> 4)
    {
      v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101251B30);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v15 = ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4;
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v13;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "-[CRLBezierPathBooleanOperationInputPathMap copyWithElementsInRange:]";
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm";
        v42 = 1024;
        v43 = 703;
        v44 = 2048;
        v45 = location;
        v46 = 2048;
        v47 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Start of range (%zu) must be in bounds [0, %zu).", buf, 0x36u);
      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101251B50);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v39 = ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4;
      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Start of range (%zu) must be in bounds [0, %zu).", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[CRLBezierPathBooleanOperationInputPathMap copyWithElementsInRange:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathBooleanOperationInputPathMap copyWithElementsInRange:]"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 703, 1, "Start of range (%zu) must be in bounds [0, %zu).", location, ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4, 703, location, v39);
    }
    else
    {
      v10 = location + length;
      if (location + length <= v9 >> 4)
      {
        memset(buf, 0, 24);
        sub_10032DB54(buf, &begin[location], &begin[v10], length);
        v11 = v7->_points.__begin_;
        if (v11)
        {
          v7->_points.__end_ = v11;
          operator delete(v11);
          v7->_points.__begin_ = 0;
          v7->_points.__end_ = 0;
          v7->_points.__end_cap_.__value_ = 0;
        }
        *(_OWORD *)&v7->_points.__begin_ = *(_OWORD *)buf;
        v7->_points.__end_cap_.__value_ = *(void **)&buf[16];
        return v7;
      }
      v26 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101251B70);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v28 = ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4;
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v26;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "-[CRLBezierPathBooleanOperationInputPathMap copyWithElementsInRange:]";
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm";
        v42 = 1024;
        v43 = 704;
        v44 = 2048;
        v45 = v10;
        v46 = 2048;
        v47 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d End of range (%zu) must be in bounds [0, %zu].", buf, 0x36u);
      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101251B90);
      v29 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v40 = ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4;
      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d End of range (%zu) must be in bounds [0, %zu].", v30, v31, v32, v33, v34, v35, v36, (uint64_t)"-[CRLBezierPathBooleanOperationInputPathMap copyWithElementsInRange:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathBooleanOperationInputPathMap copyWithElementsInRange:]"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 704, 1, "End of range (%zu) must be in bounds [0, %zu].", v10, ((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 4, 704, v10, v40);
    }

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v37, v38);
    abort();
  }
  return v7;
}

- (int64_t)inputPathIndexForOutputElementIndex:(int64_t)a3 outInputT:(double *)a4
{
  char *begin;
  double *v5;
  unint64_t v6;
  _QWORD *v7;
  unint64_t v9;

  begin = (char *)self->_points.__begin_;
  if (a3 >= (unint64_t)(((char *)self->_points.__end_ - (char *)begin) >> 4))
    sub_100194D18();
  v5 = (double *)&begin[16 * a3];
  v6 = *(_QWORD *)v5;
  if (a4)
  {
    *a4 = v5[1];
    v9 = v6;
    if (v6 == -1)
    {
      *a4 = 0.0;
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v9 = *(_QWORD *)v5;
    if (v6 == -1)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  v7 = sub_10001DF18(&self->_BOOLeanSubpathIndexToInputBezierPathIndex.__table_.__bucket_list_.__ptr_.__value_, &v9);
  if (!v7)
    sub_10001E2D0("unordered_map::at: key not found");
  return v7[3];
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v3, "appendFormat:", CFSTR("CRLBezierPathBooleanOperationInputPathMap <%p>"), self);
  v4 = -[CRLBezierPathBooleanOperationInputPathMap elementCount](self, "elementCount");
  v5 = v4;
  if (v4)
  {
    if (v4 >= 1)
    {
      v6 = 0;
      do
      {
        v9 = 0x7FF8000000000000;
        v7 = -[CRLBezierPathBooleanOperationInputPathMap inputPathIndexForOutputElementIndex:outInputT:](self, "inputPathIndexForOutputElementIndex:outInputT:", v6, &v9);
        objc_msgSend(v3, "appendFormat:", CFSTR("\n  %zu: %zu @ %f"), v6++, v7, v9);
      }
      while (v5 != v6);
    }
  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR(" - empty"));
  }
  return v3;
}

- (void).cxx_destruct
{
  void *begin;

  begin = self->_points.__begin_;
  if (begin)
  {
    self->_points.__end_ = begin;
    operator delete(begin);
  }
  sub_10001E288((uint64_t)&self->_BOOLeanSubpathIndexToInputBezierPathIndex);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
