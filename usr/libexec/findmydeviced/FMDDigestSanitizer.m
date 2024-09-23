@implementation FMDDigestSanitizer

+ (id)_digestObject:(id)a3 withExclusionKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7 && objc_msgSend(v7, "count"))
    {
      v10 = objc_opt_class(NSDictionary, v9);
      if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
      {
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sanitizeDictionary:withExclusionKeys:", v6, v8));
LABEL_10:
        v13 = v12;
        goto LABEL_11;
      }
      v14 = objc_opt_class(NSArray, v11);
      if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0)
      {
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sanitizeArray:withExclusionKeys:", v6, v8));
        goto LABEL_10;
      }
    }
    v12 = v6;
    goto LABEL_10;
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)_sanitizeDictionary:(id)a3 withExclusionKeys:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  NSMutableDictionary *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002B3A4;
  v12[3] = &unk_1002C22F8;
  v14 = objc_opt_new(NSMutableDictionary);
  v15 = a1;
  v13 = v6;
  v8 = v14;
  v9 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);

  v10 = -[NSMutableDictionary copy](v8, "copy");
  return v10;
}

+ (id)_sanitizeArray:(id)a3 withExclusionKeys:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  NSMutableArray *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002B4F8;
  v12[3] = &unk_1002C2320;
  v14 = objc_opt_new(NSMutableArray);
  v15 = a1;
  v13 = v6;
  v8 = v14;
  v9 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v10 = -[NSMutableArray copy](v8, "copy");
  return v10;
}

@end
