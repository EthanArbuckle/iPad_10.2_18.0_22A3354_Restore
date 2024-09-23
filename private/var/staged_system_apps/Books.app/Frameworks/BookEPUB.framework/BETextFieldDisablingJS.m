@implementation BETextFieldDisablingJS

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
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[textfield_disabling source](textfield_disabling, "source", v3, v4));
  return v5;
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
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[textfield_disabling sourceName](textfield_disabling, "sourceName"));
    v5 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v5);

  }
  return v3;
}

@end
