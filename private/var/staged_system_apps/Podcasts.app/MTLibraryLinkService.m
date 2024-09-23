@implementation MTLibraryLinkService

- (MTLibraryLinkService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLibraryLinkService;
  return -[MTLibraryLinkService init](&v3, "init");
}

+ (BOOL)shouldFollowRedirects
{
  return 0;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "syncStringForKey:", kBagKeyLibraryLinkURL));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLibraryLinkService requestParams](self, "requestParams"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pf_URLByAppendingQueryString:", v6));

  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(objc_alloc((Class)NSURLRequest), "initWithURL:", v7);

  return v8;
}

- (void)performRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTLibraryLinkService urlRequest](self, "urlRequest"));
  -[MTLibraryLinkService performUrlRequest:callback:](self, "performUrlRequest:callback:", v5, v4);

}

- (void)requestWithParams:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  -[MTLibraryLinkService setRequestParams:](self, "setRequestParams:", a3);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10012CD98;
  v8[3] = &unk_1004AB280;
  v9 = v6;
  v7 = v6;
  -[MTLibraryLinkService performRequest:](self, "performRequest:", v8);

}

- (void)updateAdamIdForPodcast:(id)a3 withFeedURLs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (objc_msgSend(v7, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));

      if (v9)
      {
        v15[0] = CFSTR("podcastUrl");
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
        v15[1] = CFSTR("suppressRedirectToSearch");
        v16[0] = v10;
        v16[1] = CFSTR("true");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10012D014;
        v12[3] = &unk_1004ABED8;
        v13 = v6;
        v14 = v8;
        -[MTLibraryLinkService requestWithParams:callback:](self, "requestWithParams:callback:", v11, v12);

      }
    }
  }

}

- (NSDictionary)requestParams
{
  return self->_requestParams;
}

- (void)setRequestParams:(id)a3
{
  objc_storeStrong((id *)&self->_requestParams, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestParams, 0);
}

@end
