@implementation NSError

+ (id)naq_errorFailedValidationForIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  __CFString *v11;

  if (a3)
    v4 = (__CFString *)a3;
  else
    v4 = &stru_1000041A8;
  v10 = CFSTR("identifier");
  v11 = v4;
  v5 = v4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NAQNewsPreviewErrorDomain"), 1, v7));

  return v8;
}

+ (id)naq_errorFailedUnexpectedArticleLoadedWithIdentifier:(id)a3 expectedIdentifier:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];

  if (a3)
    v6 = (__CFString *)a3;
  else
    v6 = &stru_1000041A8;
  v15[0] = CFSTR("identifier");
  v15[1] = CFSTR("expectedIdentifier");
  if (a4)
    v7 = (__CFString *)a4;
  else
    v7 = &stru_1000041A8;
  v16[0] = v6;
  v16[1] = v7;
  v8 = v7;
  v9 = v6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NAQNewsPreviewErrorDomain"), 2, v12));

  return v13;
}

@end
