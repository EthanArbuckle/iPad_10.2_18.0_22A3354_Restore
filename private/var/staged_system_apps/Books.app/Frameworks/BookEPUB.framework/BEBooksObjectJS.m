@implementation BEBooksObjectJS

- (id)mainFrameOnlyJavascript:(int64_t)a3
{
  return 0;
}

- (id)mainFrameJavascriptURL:(int64_t)a3
{
  return 0;
}

- (id)anyFrameJavascript:(int64_t)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ibooks_object source](ibooks_object, "source"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BESimpleTemplate javascriptStringFromJavascriptSource:replacements:](BESimpleTemplate, "javascriptStringFromJavascriptSource:replacements:", v4, 0));

  }
  return v3;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ibooks_object sourceName](ibooks_object, "sourceName"));
    v5 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v5);

  }
  return v3;
}

@end
