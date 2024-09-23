@implementation CRLWPStorageSanitizer

+ (id)filterText:(id)a3
{
  return objc_msgSend(a1, "filterText:removingAttachments:", a3, 1);
}

+ (id)filterText:(id)a3 removingAttachments:(BOOL)a4
{
  return _objc_msgSend(a1, "filterText:removingAttachments:removingControlCharacters:", a3, a4, 1);
}

+ (id)filterText:(id)a3 removingAttachments:(BOOL)a4 removingControlCharacters:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL4 v42;
  _BOOL4 v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  unsigned __int8 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  id v62;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (qword_101415040 != -1)
    dispatch_once(&qword_101415040, &stru_101242CD0);
  v62 = (id)qword_101415020;
  if (!v6 || !v5)
  {
    if (v6 || v5)
    {
      if (!v6 || v5)
        goto LABEL_12;
      v9 = &qword_101415038;
    }
    else
    {
      v9 = &qword_101415030;
    }
  }
  else
  {
    v9 = &qword_101415028;
  }
  v10 = (id)*v9;

  v62 = v10;
LABEL_12:
  objc_opt_class(NSAttributedString, v8);
  v12 = sub_100221D0C(v11, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v15 = v13;
  if (v13)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "string"));
  }
  else
  {
    objc_opt_class(NSString, v14);
    v18 = sub_100221D0C(v17, v7);
    v16 = objc_claimAutoreleasedReturnValue(v18);
  }
  v19 = (void *)v16;
  if (!v16)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242CF0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E09BCC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242D10);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPStorageSanitizer filterText:removingAttachments:removingControlCharacters:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPStorageSanitizer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 103, 0, "invalid nil value for '%{public}s'", "theStr");

  }
  v23 = v7;
  v61 = v23;
  v24 = 0;
  while (objc_msgSend(v19, "length"))
  {
    if (objc_msgSend(v19, "characterAtIndex:", 0) != 65279)
      break;
    if ((v24 & 1) == 0)
    {
      objc_opt_class(NSAttributedString, v25);
      if ((objc_opt_isKindOfClass(v61, v26) & 1) != 0)
      {
        v27 = objc_msgSend(v61, "mutableCopy");

        v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mutableString"));
        v23 = v27;
        v19 = (void *)v28;
      }
      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v19));

        v27 = v29;
        v19 = v27;
      }

      v23 = v27;
    }
    v24 = 1;
    objc_msgSend(v23, "replaceCharactersInRange:withString:", 0, 1, &stru_1012A72B0);
  }
  v60 = v15;
  if (objc_msgSend(v19, "length"))
  {
    v30 = 0;
    do
    {
      v31 = (char *)objc_msgSend(v19, "length");
      v32 = (uint64_t)&v31[-v30];
      v33 = objc_msgSend(v19, "rangeOfCharacterFromSet:options:range:", v62, 0, v30, &v31[-v30]);
      v35 = v34;
      v36 = sub_1001DB728((uint64_t)v33, v19, v30, v32, 0xD800uLL, 0x400uLL);
      v38 = v37;
      v39 = sub_1001DB728(v36, v19, v30, v32, 0xDC00uLL, 0x400uLL);
      if (v36 >= (unint64_t)v33 || v36 >= v39)
      {
        v42 = v39 < (unint64_t)v33;
        v43 = v39 < v36;
        if (v42 && v43)
          v38 = v40;
        else
          v38 = v35;
        if (v42 && v43)
          v36 = v39;
        else
          v36 = (unint64_t)v33;
      }
      else if (v36 + 1 < (unint64_t)objc_msgSend(v19, "length")
             && (objc_msgSend(v19, "characterAtIndex:", v36 + 1) & 0xFC00) == 0xDC00)
      {
        v44 = (char *)objc_msgSend(v19, "length");
        if (v36 + 2 <= (unint64_t)v44)
          v45 = v44;
        else
          v45 = (char *)(v36 + 2);
        if (v36 + 2 >= (unint64_t)v44)
          v36 = (unint64_t)v44;
        else
          v36 += 2;
        v46 = &v45[-v36];
        goto LABEL_65;
      }
      if (v36 == 0x7FFFFFFFFFFFFFFFLL || v38 == 0)
        break;
      v49 = (char *)objc_msgSend(v19, "length");
      if ((v24 & 1) == 0)
      {
        objc_opt_class(NSAttributedString, v48);
        if ((objc_opt_isKindOfClass(v61, v50) & 1) != 0)
        {
          v51 = objc_msgSend(v61, "mutableCopy");

          v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "mutableString"));
          v23 = v51;
          v19 = (void *)v52;
        }
        else
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v19));

          v51 = v53;
          v19 = v51;
        }

        v23 = v51;
      }
      v46 = &v49[-v36 - v38];
      objc_msgSend(v23, "replaceCharactersInRange:withString:", v36, v38, &stru_1012A72B0);
      v24 = 1;
LABEL_65:
      v30 = v36;
    }
    while (v46);
  }
  if (v60)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "string"));
    v55 = objc_msgSend(v19, "isEqualToString:", v54);

    if ((v55 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242D30);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E09B30();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242D50);
      v56 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPStorageSanitizer filterText:removingAttachments:removingControlCharacters:]"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPStorageSanitizer.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v57, v58, 208, 0, "Internal inconsistency in attributed string");

    }
  }

  return v23;
}

+ (id)filterMarkAttributes:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_opt_class(NSAttributedString, v4);
  v6 = sub_100221D0C(v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "mutableCopy");

  v9 = v3;
  if (objc_msgSend(v8, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributesAtIndex:effectiveRange:", 0, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", NSUnderlineStyleAttributeName));
    if (objc_msgSend(v11, "integerValue"))
    {
      objc_msgSend(v8, "removeAttribute:range:", NSUnderlineStyleAttributeName, 0, objc_msgSend(v8, "length"));
      objc_msgSend(v8, "removeAttribute:range:", NSUnderlineColorAttributeName, 0, objc_msgSend(v8, "length"));
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", NSBackgroundColorAttributeName));

    if (v12)
      objc_msgSend(v8, "removeAttribute:range:", NSBackgroundColorAttributeName, 0, objc_msgSend(v8, "length"));
    v9 = v8;

  }
  return v9;
}

@end
