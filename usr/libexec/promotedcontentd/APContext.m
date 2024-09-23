@implementation APContext

- (id)contextJSONForRequest:(id)a3 andPlacementType:(int64_t)a4
{
  id v6;
  APContextTransformer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = -[APContextTransformer initWithContext:contentIdentifier:placementType:]([APContextTransformer alloc], "initWithContext:contentIdentifier:placementType:", self, v6, a4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APContextTransformer transformedContext](v7, "transformedContext"));
  v9 = (void *)APLegacyNewsContextKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "jsonStringWithOptions:", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", v10));

  return v11;
}

- (unint64_t)adPosition
{
  void *v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v14;
  int v15;
  NSObject *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContext supplementalContext](self, "supplementalContext"));

  if (!v3)
  {
    v7 = APLogForCategory(21);
    v5 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Missing supplemental context.", (uint8_t *)&v15, 2u);
    }
    goto LABEL_11;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APContext supplementalContext](self, "supplementalContext"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", APSupplementalContextPlacementKey));

  if (!-[NSObject length](v5, "length"))
  {
    v8 = APLogForCategory(21);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

LABEL_11:
      v6 = 0;
      goto LABEL_12;
    }
    LOWORD(v15) = 0;
    v10 = "Can't find 'header.placement' in supplemental context.";
    v11 = v9;
    v12 = 2;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
    goto LABEL_10;
  }
  if ((-[NSObject isEqualToString:](v5, "isEqualToString:", APSupplementalContextInFeedKey) & 1) == 0)
  {
    if ((-[NSObject isEqualToString:](v5, "isEqualToString:", APSupplementalContextBetweenArticleKey) & 1) != 0)
    {
      v6 = 3;
      goto LABEL_12;
    }
    if ((-[NSObject isEqualToString:](v5, "isEqualToString:", APSupplementalContextInArticleKey) & 1) != 0)
    {
      v6 = 2;
      goto LABEL_12;
    }
    if ((-[NSObject isEqualToString:](v5, "isEqualToString:", APSupplementalContextVideoInArticleKey) & 1) != 0)
    {
      v6 = 4;
      goto LABEL_12;
    }
    if ((-[NSObject isEqualToString:](v5, "isEqualToString:", APSupplementalContextNativeInFeedKey) & 1) != 0)
    {
      v6 = 5;
      goto LABEL_12;
    }
    if ((-[NSObject isEqualToString:](v5, "isEqualToString:", APSupplementalContextNativeInArticleKey) & 1) != 0)
    {
      v6 = 6;
      goto LABEL_12;
    }
    if ((-[NSObject isEqualToString:](v5, "isEqualToString:", APSupplementalContextVideoInFeedKey) & 1) != 0)
    {
      v6 = 7;
      goto LABEL_12;
    }
    v14 = APLogForCategory(21);
    v9 = objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v15 = 138543362;
    v16 = v5;
    v10 = "Unknown 'header.placement' value: %{public}@";
    v11 = v9;
    v12 = 12;
    goto LABEL_9;
  }
  v6 = 1;
LABEL_12:

  return v6;
}

@end
