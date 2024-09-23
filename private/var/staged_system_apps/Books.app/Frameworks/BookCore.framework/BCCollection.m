@implementation BCCollection

+ (id)titleForDefaultCollectionID:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_30D638;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_30D638, &stru_28DBF0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_30D630, "objectForKeyedSubscript:", v4));

  return v5;
}

+ (id)identifierForMyBooksCollection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeStoreAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "username"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bu_sha1"));

  if (v6)
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("My_Books_Collection_"), "stringByAppendingString:", v6));
  else
    v7 = CFSTR("My_Books_Collection_");

  return v7;
}

+ (id)uniqueTitleForMyBooksCollection:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;

  v3 = a3;
  v4 = IMCommonCoreBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("My Books"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  v7 = IMCommonCoreBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("My Books %lu"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  if (objc_msgSend(v3, "count") == (id)-1)
  {
LABEL_8:
    v12 = v6;
  }
  else
  {
    v10 = 0;
    while (1)
    {
      v11 = v10
          ? (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v10))
          : v6;
      v12 = v11;
      if ((objc_msgSend(v3, "bu_containsLocalizedStringCaseInsensitive:", v11) & 1) == 0)
        break;

      if (++v10 >= (unint64_t)objc_msgSend(v3, "count") + 1)
        goto LABEL_8;
    }

  }
  return v12;
}

+ (id)sortKeyForDefaultCollectionID:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_30D648;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_30D648, &stru_28DC10);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_30D640, "objectForKeyedSubscript:", v4));

  return v5;
}

@end
