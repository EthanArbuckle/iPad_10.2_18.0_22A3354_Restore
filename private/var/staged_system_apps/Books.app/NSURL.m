@implementation NSURL

- (id)httpURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSURL *v10;
  id v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
  if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("http")))
  {

    goto LABEL_7;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
  v5 = objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("https"));

  if (!v5)
  {
LABEL_7:
    v10 = self;
    return v10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
  v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("itms-books"));

  if (!v7)
  {
    v11 = objc_alloc_init((Class)NSURLComponents);
    v12 = v11;
    v13 = CFSTR("http");
LABEL_10:
    objc_msgSend(v11, "setScheme:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
    objc_msgSend(v12, "setHost:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
    objc_msgSend(v12, "setPath:", v15);

    v10 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URL"));
    return v10;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self, "scheme"));
  v9 = objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("itms-bookss"));

  if (!v9)
  {
    v11 = objc_alloc_init((Class)NSURLComponents);
    v12 = v11;
    v13 = CFSTR("https");
    goto LABEL_10;
  }
  v10 = 0;
  return v10;
}

@end
