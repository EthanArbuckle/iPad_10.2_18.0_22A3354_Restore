@implementation BETriggerJS

- (id)mainFrameOnlyJavascript:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
    return (id)objc_claimAutoreleasedReturnValue(+[epub_trigger source](epub_trigger, "source", v3, v4));
  else
    return 0;
}

- (id)mainFrameJavascriptURL:(int64_t)a3
{
  void *v3;
  id v4;
  void *v5;

  if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[epub_trigger sourceName](epub_trigger, "sourceName"));
    v4 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)anyFrameJavascript:(int64_t)a3
{
  return 0;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  return 0;
}

@end
