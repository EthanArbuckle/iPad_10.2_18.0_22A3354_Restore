@implementation CRLWPGrammarResults

- (void)addResult:(id)a3 forRange:(_NSRange)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLWPGrammarResults;
  -[CRLWPCheckingResults addResult:forRange:](&v4, "addResult:forRange:", a3, a4.location, a4.length);
}

- (id)grammarResultForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  NSUInteger v11;
  void *v12;
  uint64_t v13;
  double v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  double v21;
  objc_class *v22;
  objc_class *v23;
  void *v24;
  id v25;
  int v26;
  NSObject *v27;
  void *v28;

  *a4 = (_NSRange)xmmword_100EEE418;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPCheckingResults ranges](self, "ranges"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPCheckingResults results](self, "results"));
  if (objc_msgSend(v7, "rangeCount"))
  {
    v9 = 0;
    while (1)
    {
      v10 = objc_msgSend(v7, "rangeAtIndex:", v9);
      if (a3 >= (unint64_t)v10 && a3 - (unint64_t)v10 < v11)
        break;
      if (++v9 >= (unint64_t)objc_msgSend(v7, "rangeCount"))
        goto LABEL_6;
    }
    a4->location = (NSUInteger)v10;
    a4->length = v11;
    if ((unint64_t)objc_msgSend(v8, "count") <= v9)
    {
      v26 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101253A48);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E24100(v26, v27);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101253A68);
      v28 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v28, v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPGrammarResults grammarResultForCharIndex:outRange:]"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSpellingResults.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v24, 185, 0, "No grammar error found for range");
      v12 = 0;
    }
    else
    {
      *(_QWORD *)&v14 = objc_opt_class(CRLPair, v13).n128_u64[0];
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9, v14));
      v18 = sub_1002223BC(v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

      *(_QWORD *)&v21 = objc_opt_class(NSDictionary, v20).n128_u64[0];
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "first", v21));
      v25 = sub_1002223BC(v23, v24);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v25);
    }

  }
  else
  {
LABEL_6:
    v12 = 0;
  }

  return v12;
}

@end
