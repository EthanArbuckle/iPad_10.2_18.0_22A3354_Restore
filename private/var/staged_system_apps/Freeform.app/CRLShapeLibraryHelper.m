@implementation CRLShapeLibraryHelper

+ (id)keywordsByCapitalizingLowercasedKeywords:(id)a3 locale:(id)a4
{
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B0FC8;
  v9[3] = &unk_101234010;
  v10 = a4;
  v11 = a1;
  v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "crl_arrayByMappingObjectsUsingBlock:", v9));

  return v7;
}

+ (id)keywordByCapitalizingLowercasedKeyword:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v6 = a4;
  if (qword_101414D28 != -1)
    dispatch_once(&qword_101414D28, &stru_101234030);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseStringWithLocale:", v7));
  v9 = objc_msgSend(v8, "isEqualToString:", v5);

  if (v9)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_1000B11D0;
    v23 = sub_1000B11E0;
    v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_101414D30, "objectForKey:", v5));
    v10 = (void *)v20[5];
    if (!v10)
    {
      v11 = objc_msgSend(v5, "length");
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000B11E8;
      v15[3] = &unk_101234058;
      v18 = &v19;
      v12 = v5;
      v16 = v12;
      v17 = v6;
      objc_msgSend(v12, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 3, v15);
      objc_msgSend((id)qword_101414D30, "setObject:forKey:", v20[5], v12);

      v10 = (void *)v20[5];
    }
    v13 = v10;

    _Block_object_dispose(&v19, 8);
    v5 = v13;
  }

  return v5;
}

+ (BOOL)shouldAddBaseShapeNameAndKeywordsForLocale:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "locale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localeIdentifier"));

  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("en")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000B134C;
    v7[3] = &unk_101234080;
    v8 = v4;
    v5 = objc_msgSend(&off_1012CAB88, "crl_containsObjectPassingTest:", v7);

  }
  return v5;
}

@end
