@implementation CRLWPMutableRangeArray

- (void)clear
{
  self->super._rangeVector.__end_ = self->super._rangeVector.__begin_;
}

- (void)removeRangesInRange:(_NSRange)a3
{
  _NSRange *begin;
  _NSRange *end;
  _NSRange *v6;
  _NSRange *v7;
  int64_t v8;

  if (a3.length)
  {
    begin = self->super._rangeVector.__begin_;
    end = self->super._rangeVector.__end_;
    v6 = &begin[a3.location];
    v7 = &begin[a3.location + a3.length];
    v8 = (char *)end - (char *)v7;
    if (end != v7)
      memmove(&begin[a3.location], v7, (char *)end - (char *)v7);
    self->super._rangeVector.__end_ = (_NSRange *)((char *)v6 + v8);
  }
}

- (void)concatenateRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  __compressed_pair<_NSRange *, std::allocator<_NSRange>> *p_end_cap;
  _NSRange *value;
  _NSRange *end;
  _NSRange *v9;
  vector<_NSRange, std::allocator<_NSRange>> *p_rangeVector;
  _NSRange *begin;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  _NSRange *v17;
  _NSRange *v18;

  length = a3.length;
  location = a3.location;
  p_end_cap = &self->super._rangeVector.__end_cap_;
  value = self->super._rangeVector.__end_cap_.__value_;
  end = self->super._rangeVector.__end_;
  if (end >= value)
  {
    p_rangeVector = &self->super._rangeVector;
    begin = self->super._rangeVector.__begin_;
    v12 = end - begin;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60)
      sub_100007810();
    v14 = (char *)value - (char *)begin;
    if (v14 >> 3 > v13)
      v13 = v14 >> 3;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
      v15 = 0xFFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    if (v15)
    {
      v16 = (char *)sub_10001FB2C((uint64_t)p_end_cap, v15);
      begin = self->super._rangeVector.__begin_;
      end = self->super._rangeVector.__end_;
    }
    else
    {
      v16 = 0;
    }
    v17 = (_NSRange *)&v16[16 * v12];
    v18 = (_NSRange *)&v16[16 * v15];
    v17->location = location;
    v17->length = length;
    v9 = v17 + 1;
    if (end != begin)
    {
      do
      {
        v17[-1] = end[-1];
        --v17;
        --end;
      }
      while (end != begin);
      begin = p_rangeVector->__begin_;
    }
    self->super._rangeVector.__begin_ = v17;
    self->super._rangeVector.__end_ = v9;
    self->super._rangeVector.__end_cap_.__value_ = v18;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = a3;
    v9 = end + 1;
  }
  self->super._rangeVector.__end_ = v9;
}

- (void)insertRange:(_NSRange)a3 atIndex:(unint64_t)a4
{
  _NSRange v4;

  v4 = a3;
  sub_10001F4DC((uint64_t)&self->super._rangeVector, (char *)&self->super._rangeVector.__begin_[a4], (char *)&v4);
}

- (void)addRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  vector<_NSRange, std::allocator<_NSRange>> *p_rangeVector;
  char *end;
  _NSRange *begin;
  unint64_t v9;
  _NSRange *v10;
  unint64_t v11;
  _NSRange *v12;
  _NSRange *v13;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v16;
  _NSRange *v17;
  unint64_t v18;
  _NSRange *v19;
  _NSRange *v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  _NSRange *value;
  _NSRange *v25;
  _NSRange *v26;
  _NSRange *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  NSRange v33;
  NSRange v34;
  uint64_t v36;
  NSRange *v37;
  int v38;
  NSUInteger v39;
  _NSRange *v40;
  size_t v41;
  _NSRange *v42;
  NSRange *v43;
  _NSRange *v44;
  _NSRange *v45;
  _NSRange *v46;
  _NSRange *v47;
  int v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  NSRange v55;
  uint8_t buf[24];
  NSRange v57;
  NSRange v58;
  NSRange v59;
  NSRange v60;
  NSRange v61;
  NSRange v62;
  NSRange v63;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
    return;
  length = a3.length;
  location = a3.location;
  if (-[CRLWPRangeArray rangeCount](self, "rangeCount"))
  {
    if (!length)
      return;
    v55.location = location;
    v55.length = length;
    begin = self->super._rangeVector.__begin_;
    end = (char *)self->super._rangeVector.__end_;
    p_rangeVector = &self->super._rangeVector;
    if (end == (char *)begin)
    {
      LODWORD(v15) = 0;
      v17 = self->super._rangeVector.__begin_;
      v22 = length;
      v23 = location;
    }
    else
    {
      v9 = (end - (char *)begin) >> 4;
      v10 = self->super._rangeVector.__begin_;
      do
      {
        v11 = v9 >> 1;
        v12 = &v10[v9 >> 1];
        v14 = v12->location;
        v13 = v12 + 1;
        v9 += ~(v9 >> 1);
        if (v14 < location)
          v10 = v13;
        else
          v9 = v11;
      }
      while (v9);
      v15 = end - (char *)v10;
      if (end == (char *)v10)
      {
        v22 = length;
        v23 = location;
        v17 = self->super._rangeVector.__end_;
        v10 = v17;
      }
      else
      {
        v16 = v15 >> 4;
        v17 = v10;
        do
        {
          v18 = v16 >> 1;
          v19 = &v17[v16 >> 1];
          v21 = v19->location;
          v20 = v19 + 1;
          v16 += ~(v16 >> 1);
          if (v21 < location + length)
            v17 = v20;
          else
            v16 = v18;
        }
        while (v16);
        v57.location = location;
        v57.length = length;
        if (sub_1001E966C(v57, *v10, 1) == 0x7FFFFFFFFFFFFFFFLL)
        {
          LODWORD(v15) = 0;
          v22 = length;
          v23 = location;
        }
        else
        {
          v58.location = location;
          v58.length = length;
          v33 = NSUnionRange(v58, *v10);
          v23 = v33.location;
          v22 = v33.length;
          v55 = v33;
          LODWORD(v15) = 1;
        }
      }
      if (v10 != begin)
      {
        v54 = v15;
        v59.location = v23;
        v59.length = v22;
        if (sub_1001E966C(v59, v10[-1], 1) == 0x7FFFFFFFFFFFFFFFLL)
        {
          p_rangeVector = &self->super._rangeVector;
          LODWORD(v15) = v54;
        }
        else
        {
          v60.location = v23;
          v60.length = v22;
          v34 = NSUnionRange(v60, v10[-1]);
          v23 = v34.location;
          v22 = v34.length;
          v55 = v34;
          LODWORD(v15) = 1;
          --v10;
          p_rangeVector = &self->super._rangeVector;
        }
        goto LABEL_36;
      }
    }
    v10 = begin;
LABEL_36:
    v36 = v17 == (_NSRange *)end && v17 != begin;
    v37 = &v17[v36 << 63 >> 63];
    if (v37 == (NSRange *)end
      || (v61.location = v23,
          v61.length = v22,
          v38 = v15,
          v39 = sub_1001E966C(v61, *v37, 1),
          LODWORD(v15) = v38,
          v39 == 0x7FFFFFFFFFFFFFFFLL))
    {
      if (!(_DWORD)v15)
        goto LABEL_66;
    }
    else
    {
      v63 = *v37++;
      v62.location = v23;
      v62.length = v22;
      v55 = NSUnionRange(v62, v63);
    }
    if (v10 >= v37)
    {
      if (v37 < v10)
      {
        v44 = self->super._rangeVector.__end_;
        v41 = (char *)v44 - (char *)v10;
        if (v44 != v10)
          memmove(v37, v10, (char *)v44 - (char *)v10);
        v10 = v37;
        goto LABEL_65;
      }
      if (v10 == (_NSRange *)end)
        goto LABEL_67;
      v43 = v10 + 1;
      v47 = self->super._rangeVector.__end_;
      v41 = (char *)v47 - (char *)&v10[1];
      if (v47 == &v10[1])
        goto LABEL_65;
      v42 = v10;
    }
    else
    {
      v40 = self->super._rangeVector.__end_;
      v41 = (char *)v40 - (char *)v37;
      if (v40 == v37)
      {
LABEL_65:
        self->super._rangeVector.__end_ = (_NSRange *)((char *)v10 + v41);
LABEL_66:
        end = (char *)v10;
LABEL_67:
        sub_10001F4DC((uint64_t)p_rangeVector, end, (char *)&v55);
        if (!-[CRLWPRangeArray containsRange:](self, "containsRange:", location, length))
        {
          v48 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125E028);
          v49 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E3482C(v48, v49);
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125E048);
          v50 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR))
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100E02830(v51, buf, v48, (os_log_t)v50);
          }

          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPMutableRangeArray addRange:]"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeArray.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v52, v53, 438, 0, "addRange failure");

        }
        return;
      }
      v42 = v10;
      v43 = v37;
    }
    memmove(v42, v43, v41);
    goto LABEL_65;
  }
  value = self->super._rangeVector.__end_cap_.__value_;
  v25 = self->super._rangeVector.__end_;
  if (v25 >= value)
  {
    v27 = self->super._rangeVector.__begin_;
    v28 = v25 - v27;
    v29 = v28 + 1;
    if ((unint64_t)(v28 + 1) >> 60)
      sub_100007810();
    v30 = (char *)value - (char *)v27;
    if (v30 >> 3 > v29)
      v29 = v30 >> 3;
    if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0)
      v31 = 0xFFFFFFFFFFFFFFFLL;
    else
      v31 = v29;
    if (v31)
    {
      v32 = (char *)sub_10001FB2C((uint64_t)&self->super._rangeVector.__end_cap_, v31);
      v27 = self->super._rangeVector.__begin_;
      v25 = self->super._rangeVector.__end_;
    }
    else
    {
      v32 = 0;
    }
    v45 = (_NSRange *)&v32[16 * v28];
    v46 = (_NSRange *)&v32[16 * v31];
    v45->location = location;
    v45->length = length;
    v26 = v45 + 1;
    if (v25 != v27)
    {
      do
      {
        v45[-1] = v25[-1];
        --v45;
        --v25;
      }
      while (v25 != v27);
      v27 = self->super._rangeVector.__begin_;
    }
    self->super._rangeVector.__begin_ = v45;
    self->super._rangeVector.__end_ = v26;
    self->super._rangeVector.__end_cap_.__value_ = v46;
    if (v27)
      operator delete(v27);
  }
  else
  {
    v25->location = location;
    v25->length = length;
    v26 = v25 + 1;
  }
  self->super._rangeVector.__end_ = v26;
}

- (void)removeRange:(_NSRange)a3
{
  vector<_NSRange, std::allocator<_NSRange>> *p_rangeVector;
  _NSRange *end;
  _NSRange *begin;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  NSUInteger *v12;
  char *v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange *v16;
  unint64_t v17;
  _NSRange *v18;
  _NSRange *v19;
  NSUInteger location;
  unint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  BOOL v25;
  NSUInteger v26;
  NSUInteger length;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v34;
  NSUInteger v35;
  int64_t v36;
  _NSRange v37;

  if (!a3.length)
    return;
  begin = self->super._rangeVector.__begin_;
  end = self->super._rangeVector.__end_;
  p_rangeVector = &self->super._rangeVector;
  v7 = (char *)end - (char *)begin;
  if (end == begin)
  {
    v15 = a3.location + a3.length;
    v16 = begin;
  }
  else
  {
    v8 = v7 >> 4;
    v9 = v7 >> 4;
    v10 = (char *)begin;
    do
    {
      v11 = v9 >> 1;
      v12 = (NSUInteger *)&v10[16 * (v9 >> 1)];
      v14 = *v12;
      v13 = (char *)(v12 + 2);
      v9 += ~(v9 >> 1);
      if (v14 > a3.location)
        v9 = v11;
      else
        v10 = v13;
    }
    while (v9);
    v15 = a3.location + a3.length;
    v16 = begin;
    do
    {
      v17 = v8 >> 1;
      v18 = &v16[v8 >> 1];
      location = v18->location;
      v19 = v18 + 1;
      v8 += ~(v8 >> 1);
      if (location < v15)
        v16 = v19;
      else
        v8 = v17;
    }
    while (v8);
    if (v10 != (char *)begin)
    {
      begin = (_NSRange *)(v10 - 16);
      v21 = *((_QWORD *)v10 - 2);
      v22 = a3.location - v21;
      if (a3.location < v21 || (v23 = *((_QWORD *)v10 - 1), v22 >= v23))
      {
        begin = (_NSRange *)v10;
      }
      else
      {
        if (a3.location != v21)
        {
          *((_QWORD *)v10 - 1) = v22;
          begin = (_NSRange *)v10;
        }
        if (v15 >= v21 && v15 - v21 < v23)
        {
          v24 = v23 + v21;
          v25 = v15 >= v23 + v21;
          if (v15 <= v23 + v21)
            v26 = v23 + v21;
          else
            v26 = a3.location + a3.length;
          if (!v25)
            v24 = a3.location + a3.length;
          v37.location = v24;
          v37.length = v26 - v24;
          if (a3.location == v21)
            *begin = v37;
          else
            sub_10001F4DC((uint64_t)p_rangeVector, v10, (char *)&v37);
          return;
        }
      }
    }
  }
  if (v16 != end)
  {
    length = v16->length;
    if (v15 > v16->location && v15 - v16->location < length)
    {
      v29 = length + v16->location;
      if (v15 <= v29)
        v30 = length + v16->location;
      else
        v30 = v15;
      if (v15 < v29)
        v29 = v15;
      v16->location = v29;
      v16->length = v30 - v29;
    }
  }
  if (begin != v16)
  {
    v31 = v16[-1].location;
    v32 = v16[-1].length;
    if (v15 >= v31 && v15 - v31 < v32)
    {
      v34 = v32 + v31;
      if (v15 <= v34)
        v35 = v34;
      else
        v35 = v15;
      if (v15 >= v34)
        v15 = v34;
      v16[-1].location = v15;
      v16[-1].length = v35 - v15;
      --v16;
    }
    if (begin != v16)
    {
      v36 = (char *)end - (char *)v16;
      if (end != v16)
        memmove(begin, v16, (char *)end - (char *)v16);
      self->super._rangeVector.__end_ = (_NSRange *)((char *)begin + v36);
    }
  }
}

- (void)replaceRangeAtIndex:(unint64_t)a3 withRange:(_NSRange)a4
{
  self->super._rangeVector.__begin_[a3] = a4;
}

- (_NSRange)replacedTextAtRange:(_NSRange)a3 delta:(int64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  _NSRange *begin;
  _NSRange *v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  _NSRange *end;
  int64_t v26;
  unint64_t v27;
  unint64_t v28;
  unsigned int v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  _NSRange *v34;
  char *v35;
  unint64_t v36;
  NSUInteger v37;
  NSUInteger v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  int64_t v42;
  uint8_t buf[4];
  unsigned int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v8 = -[CRLWPRangeArray rangeCount](self, "rangeCount");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = length - a4 + location;
    v41 = -a4;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v14 = a4;
    v42 = a4;
    while (1)
    {
      begin = self->super._rangeVector.__begin_;
      v16 = &begin[v10];
      v18 = v16->location;
      v17 = v16->length;
      v19 = v17 + v16->location;
      if (v19 >= location)
      {
        if (location <= v18)
        {
          if (v11 >= v19)
          {
            end = self->super._rangeVector.__end_;
            v26 = (char *)end - (char *)&v16[1];
            if (end != &v16[1])
            {
              v27 = v12;
              v28 = v13;
              memmove(v16, &v16[1], (char *)end - (char *)&v16[1]);
              v13 = v28;
              v12 = v27;
              v14 = v42;
            }
            self->super._rangeVector.__end_ = (_NSRange *)((char *)v16 + v26);
            --v9;
            if (v12 == 0x7FFFFFFFFFFFFFFFLL)
              v13 = v10 + 1;
            else
              ++v13;
            if (v12 == 0x7FFFFFFFFFFFFFFFLL)
              v12 = v10;
            goto LABEL_44;
          }
          if (v11 <= v18)
          {
            if (v14 < 0 && v18 < v41)
            {
              v39 = v13;
              v40 = v12;
              v29 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10125E068);
              v30 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109890;
                v44 = v29;
                v45 = 2082;
                v46 = "-[CRLWPMutableRangeArray replacedTextAtRange:delta:]";
                v47 = 2082;
                v48 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeArray.mm";
                v49 = 1024;
                v50 = 536;
                _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d bad location", buf, 0x22u);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10125E088);
              v31 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
              {
                v35 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                *(_DWORD *)buf = 67109378;
                v44 = v29;
                v45 = 2114;
                v46 = v35;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v31, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              }
              v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPMutableRangeArray replacedTextAtRange:delta:]"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRangeArray.mm"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 536, 0, "bad location");

              begin = self->super._rangeVector.__begin_;
              v14 = v42;
              v13 = v39;
              v12 = v40;
            }
            v21 = v18 + v14;
          }
          else
          {
            v21 = v19 + v14;
            if (location <= v21)
              v22 = v21;
            else
              v22 = location;
            if (location < v21)
              v21 = location;
            v17 = v22 - v21;
          }
          v34 = &begin[v10];
          v34->location = v21;
          v34->length = v17;
        }
        else
        {
          if (v11 >= v19)
          {
            if (v18 <= location)
              v23 = location;
            else
              v23 = v16->location;
            if (v18 >= location)
              v24 = location;
            else
              v24 = v16->location;
            v20 = v23 - v24;
            v16->location = v24;
          }
          else
          {
            v20 = v17 + v14;
          }
          v16->length = v20;
        }
      }
      ++v10;
LABEL_44:
      if (v10 >= v9)
        goto LABEL_47;
    }
  }
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_47:
  if (v12 <= v13)
    v36 = v13;
  else
    v36 = v12;
  if (v12 >= v13)
    v37 = v13;
  else
    v37 = v12;
  v38 = v36 - v37;
  result.length = v38;
  result.location = v37;
  return result;
}

- (void)unionWith:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = (char *)objc_msgSend(v8, "rangeCount");
  if (v4)
  {
    v5 = 0;
    do
    {
      v6 = objc_msgSend(v8, "rangeAtIndex:", v5);
      -[CRLWPMutableRangeArray addRange:](self, "addRange:", v6, v7);
      ++v5;
    }
    while (v4 != v5);
  }

}

- (void)subtract:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (-[CRLWPRangeArray rangeCount](self, "rangeCount"))
  {
    v4 = (char *)objc_msgSend(v8, "rangeCount");
    if (v4)
    {
      v5 = 0;
      do
      {
        v6 = objc_msgSend(v8, "rangeAtIndex:", v5);
        -[CRLWPMutableRangeArray removeRange:](self, "removeRange:", v6, v7);
        ++v5;
      }
      while (v4 != v5);
    }
  }

}

@end
