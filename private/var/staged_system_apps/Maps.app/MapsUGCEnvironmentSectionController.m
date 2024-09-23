@implementation MapsUGCEnvironmentSectionController

- (MapsUGCEnvironmentSectionController)initWithSubmissionURL:(unint64_t)a3 lookupURL:(unint64_t)a4
{
  MapsUGCEnvironmentSectionController *v6;
  uint64_t v7;
  NSDictionary *environmentURLs;
  objc_super v10;
  _QWORD v11[4];
  _QWORD v12[4];

  v10.receiver = self;
  v10.super_class = (Class)MapsUGCEnvironmentSectionController;
  v6 = -[MapsUGCEnvironmentSectionController init](&v10, "init");
  if (v6)
  {
    v11[0] = CFSTR("Staging");
    v11[1] = CFSTR("Prod");
    v12[0] = CFSTR("https://sundew-staging.geo.apple.com/");
    v12[1] = CFSTR("https://sundew.ls.apple.com/");
    v11[2] = CFSTR("Dev");
    v11[3] = CFSTR("QA1");
    v12[2] = CFSTR("https://sundew-dev.geo.apple.com/");
    v12[3] = CFSTR("https://sundew-qa1.geo.apple.com/");
    v7 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));
    environmentURLs = v6->_environmentURLs;
    v6->_environmentURLs = (NSDictionary *)v7;

    -[MapsUGCEnvironmentSectionController setSubmissionURL:](v6, "setSubmissionURL:", a3);
    -[MapsUGCEnvironmentSectionController setLookupURL:](v6, "setLookupURL:", a4);
  }
  return v6;
}

- (void)appendEnvironmentSectionToDebugController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004B8BA8;
  v6[3] = &unk_1011B4F90;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v5 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("Environments"), v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (id)selectedEnvironmentURLWithSubmissionURL:(id)a3 lookupURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUGCEnvironmentSectionController environmentURLs](self, "environmentURLs", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allValues"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (-[MapsUGCEnvironmentSectionController environmentIsSelectedWithBaseURL:submissionURL:lookupURL:](self, "environmentIsSelectedWithBaseURL:submissionURL:lookupURL:", v14, v6, v7))
        {
          v15 = v14;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)environmentIsSelectedWithBaseURL:(id)a3 submissionURL:(id)a4 lookupURL:(id)a5
{
  id v6;
  void *v7;
  unsigned __int8 v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingString:", CFSTR("v1/feedback/submission.arpc")));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  return v8;
}

- (NSDictionary)environmentURLs
{
  return self->_environmentURLs;
}

- (void)setEnvironmentURLs:(id)a3
{
  objc_storeStrong((id *)&self->_environmentURLs, a3);
}

- (unint64_t)submissionURL
{
  return self->_submissionURL;
}

- (void)setSubmissionURL:(unint64_t)a3
{
  self->_submissionURL = a3;
}

- (unint64_t)lookupURL
{
  return self->_lookupURL;
}

- (void)setLookupURL:(unint64_t)a3
{
  self->_lookupURL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentURLs, 0);
}

@end
