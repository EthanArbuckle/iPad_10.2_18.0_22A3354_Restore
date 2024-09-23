@implementation __NSCFURLSessionTaskInfo

- (id)_URLToUse
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo AVURLAsset](self, "AVURLAsset"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo AVURLAsset](self, "AVURLAsset"));
    if (v4)
      goto LABEL_3;
LABEL_6:
    v7 = objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo URL](self, "URL"));
    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo downloadConfig](self, "downloadConfig"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_asset"));

  v4 = (void *)v9;
  if (!v9)
    goto LABEL_6;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v6 = objc_msgSend(v5, "isFileURL");

  if (v6)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalNetworkContentURL"));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
LABEL_8:
  v10 = (void *)v7;

  return v10;
}

- (id)_destinationURLToUse
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo temporaryDestinationURL](self, "temporaryDestinationURL"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo destinationURL](self, "destinationURL"));
  v6 = v5;

  return v6;
}

- (id)_AVAssetDownloadSessionOptions:(id)a3 config:(id)a4 asset:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CGSize v25;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo options](self, "options"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo options](self, "options"));
    v11 = objc_msgSend(v10, "mutableCopy");

  }
  else
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo assetTitle](self, "assetTitle"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, AVAssetDownloadSessionAssetNameKey);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo assetArtworkData](self, "assetArtworkData"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, AVAssetDownloadSessionAssetImageDataKey);

  v14 = v7;
  if (!v7)
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo bundleID](self, "bundleID"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, AVAssetDownloadSessionClientBundleIdentifierKey);
  if (!v7)

  if ((objc_msgSend(v8, "allowsCellularAccess") & 1) == 0)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, AVAssetDownloadSessionAllowsCellularAccessKey);
  if ((objc_msgSend(v8, "allowsExpensiveNetworkAccess") & 1) == 0)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, AVAssetDownloadSessionAllowsExpensiveNetworkAccessKey);
  if ((objc_msgSend(v8, "allowsConstrainedNetworkAccess") & 1) == 0)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, AVAssetDownloadSessionAllowsConstrainedNetworkAccessKey);
  v15 = objc_msgSend(v11, "copy");
  -[__NSCFURLSessionTaskInfo setOptions:](self, "setOptions:", v15);

  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskMinimumRequiredPresentationSizeKey")));
  v17 = v16;
  if (v16 && CGSizeMakeWithDictionaryRepresentation(v16, &v25))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", &v25, "{CGSize=dd}"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("AVAssetDownloadTaskMinimumRequiredPresentationSizeKey"));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo uniqueIdentifier](self, "uniqueIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("AVAssetDownloadSessionDebugIdentifierKey"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo retryError](self, "retryError"));
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo retryError](self, "retryError"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("AVAssetDownloadSessionRetryErrorKey"));

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo downloadConfig](self, "downloadConfig"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, CFSTR("AVAssetDownloadTaskDownloadConfigurationKey"));

  return v11;
}

@end
