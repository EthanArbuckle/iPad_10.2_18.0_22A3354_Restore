@implementation CRLPasteboardObjectReadAssistantHelper

+ (id)contentDescriptionFromPasteboard:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  uint64_t v23;
  const __CFString *v24;

  v3 = a3;
  if (objc_msgSend(v3, "containsNativePasteboardTypes"))
  {
    v24 = CFSTR("com.apple.freeform.CRLDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    v5 = objc_msgSend(v3, "containsPasteboardTypes:", v4);

    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataForPasteboardType:", CFSTR("com.apple.freeform.CRLDescription")));
      if (v7)
      {
        v23 = 0;
        *(_QWORD *)&v8 = objc_opt_class(NSDictionary, v6).n128_u64[0];
        v10 = v9;
        v22 = 0;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v7, 0, &v23, &v22, v8));
        v12 = v22;
        v13 = sub_100221D0C(v10, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

        if (v14)
        {
          if (v23 == 200)
          {
LABEL_25:

            goto LABEL_26;
          }

          if (qword_10147E368 != -1)
            dispatch_once(&qword_10147E368, &stru_101243E50);
          v15 = off_1013D9068;
          if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
            sub_100E0B8F4(&v23, v15);
        }
        else
        {
          if (qword_10147E368 != -1)
            dispatch_once(&qword_10147E368, &stru_101243E30);
          v20 = off_1013D9068;
          if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
            sub_100E0B804(v20, v12);
        }
      }
      else
      {
        v16 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101243DF0);
        v17 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E0B74C(v16, v17);
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101243E10);
        v18 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE81F0(v18, v16);
        v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardObjectReadAssistantHelper contentDescriptionFromPasteboard:]"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardObjectReadAssistantHelper.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v19, 18, 0, "invalid nil value for '%{public}s'", "data");

      }
      v14 = 0;
      goto LABEL_25;
    }
  }
  v14 = 0;
LABEL_26:

  return v14;
}

@end
