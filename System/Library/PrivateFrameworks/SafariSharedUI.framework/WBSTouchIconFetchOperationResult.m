@implementation WBSTouchIconFetchOperationResult

+ (id)resultForFetchFailureWithHost:(id)a3 pageRequestDidSucceed:(BOOL)a4 response:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  LOBYTE(v14) = 0;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTouchIcon:iconData:iconURL:host:isFavicon:pageRequestDidSucceed:response:higherPriorityIconDownloadFailedDueToNetworkError:error:", 0, 0, 0, v11, 0, 0, v10, v14, v9);

  return v12;
}

+ (id)resultWithTouchIcon:(id)a3 host:(id)a4 isFavicon:(BOOL)a5 pageRequestDidSucceed:(BOOL)a6 response:(id)a7 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;

  v9 = a6;
  v10 = a5;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  LOBYTE(v19) = a8;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTouchIcon:iconData:iconURL:host:isFavicon:pageRequestDidSucceed:response:higherPriorityIconDownloadFailedDueToNetworkError:error:", v16, 0, 0, v15, v10, v9, v14, v19, 0);

  return v17;
}

+ (id)resultWithFavicon:(id)a3 iconData:(id)a4 iconURL:(id)a5 host:(id)a6 pageRequestDidSucceed:(BOOL)a7 response:(id)a8 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;

  v9 = a7;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  LOBYTE(v22) = a9;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTouchIcon:iconData:iconURL:host:isFavicon:pageRequestDidSucceed:response:higherPriorityIconDownloadFailedDueToNetworkError:error:", v19, v18, v17, v16, 1, v9, v15, v22, 0);

  return v20;
}

- (WBSTouchIconFetchOperationResult)initWithTouchIcon:(id)a3 iconData:(id)a4 iconURL:(id)a5 host:(id)a6 isFavicon:(BOOL)a7 pageRequestDidSucceed:(BOOL)a8 response:(id)a9 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a10 error:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  WBSTouchIconFetchOperationResult *v20;
  WBSTouchIconFetchOperationResult *v21;
  uint64_t v22;
  NSString *host;
  WBSTouchIconFetchOperationResult *v24;
  id v28;
  id v29;
  objc_super v30;

  v16 = a3;
  v17 = a4;
  v29 = a5;
  v18 = a6;
  v28 = a9;
  v19 = a11;
  v30.receiver = self;
  v30.super_class = (Class)WBSTouchIconFetchOperationResult;
  v20 = -[WBSTouchIconFetchOperationResult init](&v30, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_touchIcon, a3);
    objc_storeStrong((id *)&v21->_iconData, a4);
    objc_storeStrong((id *)&v21->_iconURL, a5);
    v22 = objc_msgSend(v18, "copy");
    host = v21->_host;
    v21->_host = (NSString *)v22;

    v21->_favicon = a7;
    v21->_pageRequestDidSucceed = a8;
    objc_storeStrong((id *)&v21->_response, a9);
    v21->_higherPriorityIconDownloadFailedDueToNetworkError = a10;
    objc_storeStrong((id *)&v21->_error, a11);
    v24 = v21;
  }

  return v21;
}

- (BOOL)failedDueToUnrecoverableNetworkError
{
  BOOL v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_pageRequestDidSucceed)
    return 0;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSError underlyingErrors](self->_error, "underlyingErrors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    v7 = *MEMORY[0x1E0CB2FE0];
    v8 = *MEMORY[0x1E0CB32E8];
    v9 = *MEMORY[0x1E0C930A8];
    v22 = *MEMORY[0x1E0CCED40];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        objc_msgSend(v11, "domain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v7);

        if (v13)
        {
          if (objc_msgSend(v11, "code") == 50)
            goto LABEL_22;
          goto LABEL_15;
        }
        objc_msgSend(v11, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v8);

        if (v15)
          goto LABEL_14;
        objc_msgSend(v11, "domain");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v9);

        if (v17)
        {
          if (objc_msgSend(v11, "code") == -1003)
            goto LABEL_22;
LABEL_14:
          if (objc_msgSend(v11, "code") == -1009)
            goto LABEL_22;
          goto LABEL_15;
        }
        objc_msgSend(v11, "domain");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v22);

        if (v19 && objc_msgSend(v11, "code") == -65554)
        {
LABEL_22:
          v2 = 1;
          goto LABEL_23;
        }
LABEL_15:
        ++v10;
      }
      while (v5 != v10);
      v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v5 = v20;
    }
    while (v20);
  }
  v2 = 0;
LABEL_23:

  return v2;
}

- (UIImage)touchIcon
{
  return self->_touchIcon;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (NSString)host
{
  return self->_host;
}

- (BOOL)isFavicon
{
  return self->_favicon;
}

- (BOOL)pageRequestDidSucceed
{
  return self->_pageRequestDidSucceed;
}

- (BOOL)higherPriorityIconDownloadFailedDueToNetworkError
{
  return self->_higherPriorityIconDownloadFailedDueToNetworkError;
}

- (NSURLResponse)response
{
  return self->_response;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_touchIcon, 0);
}

@end
