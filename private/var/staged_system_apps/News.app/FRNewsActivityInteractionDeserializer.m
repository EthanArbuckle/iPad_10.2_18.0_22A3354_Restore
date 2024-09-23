@implementation FRNewsActivityInteractionDeserializer

- (id)activityDataForIntent:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v5 = objc_opt_class(TodayIntent, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v7 = objc_msgSend(objc_alloc((Class)TSNewsActivityData), "initWithActivity:identifier:", 4, CFSTR("foryoufeed"));
  }
  else
  {
    v8 = objc_opt_class(TagIntent, v6);
    if ((objc_opt_isKindOfClass(v3, v8) & 1) != 0)
    {
      v9 = v3;
      v10 = objc_alloc((Class)TSNewsActivityData);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tag"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v13 = (void *)objc_opt_new(TSFeedViewContext);
      v7 = objc_msgSend(v10, "initWithActivity:identifier:object:", 2, v12, v13);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

@end
