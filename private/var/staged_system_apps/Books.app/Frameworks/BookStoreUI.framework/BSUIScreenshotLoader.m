@implementation BSUIScreenshotLoader

- (BSUIScreenshotLoader)initWithScreenshots:(id)a3
{
  id v4;
  BSUIScreenshotLoader *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *screenshotsCache;
  NSMutableArray *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *screenshotURLs;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BSUIScreenshotLoader;
  v5 = -[BSUIScreenshotLoader init](&v22, "init");
  if (v5)
  {
    v6 = objc_opt_new(NSMutableDictionary);
    screenshotsCache = v5->_screenshotsCache;
    v5->_screenshotsCache = v6;

    v8 = objc_opt_new(NSMutableArray);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13), "url", (_QWORD)v18));
          -[NSMutableArray addObject:](v8, "addObject:", v14);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

    v15 = (NSArray *)-[NSMutableArray copy](v8, "copy");
    screenshotURLs = v5->_screenshotURLs;
    v5->_screenshotURLs = v15;

  }
  return v5;
}

- (void)startLoading
{
  char *i;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  id location;

  objc_initWeak(&location, self);
  for (i = 0; ; ++i)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotLoader screenshotURLs](self, "screenshotURLs"));
    v5 = (char *)objc_msgSend(v4, "count");

    if (i >= v5)
      break;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotLoader screenshotURLs](self, "screenshotURLs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", i));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotLoader delegate](self, "delegate"));
    objc_msgSend(v8, "screenshotLoader:willLoadImageAtIndex:fromURL:", self, i, v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1AE8C;
    v12[3] = &unk_2E4970;
    objc_copyWeak(v14, &location);
    v10 = v7;
    v13 = v10;
    v14[1] = i;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataTaskWithURL:completionHandler:", v10, v12));

    objc_msgSend(v11, "resume");
    objc_destroyWeak(v14);

  }
  objc_destroyWeak(&location);
}

- (id)imageForScreenshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotLoader screenshotsCache](self, "screenshotsCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));
  return v7;
}

- (BSUIScreenshotLoaderDelegate)delegate
{
  return (BSUIScreenshotLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)screenshotURLs
{
  return self->_screenshotURLs;
}

- (void)setScreenshotURLs:(id)a3
{
  objc_storeStrong((id *)&self->_screenshotURLs, a3);
}

- (NSMutableDictionary)screenshotsCache
{
  return self->_screenshotsCache;
}

- (void)setScreenshotsCache:(id)a3
{
  objc_storeStrong((id *)&self->_screenshotsCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshotsCache, 0);
  objc_storeStrong((id *)&self->_screenshotURLs, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
