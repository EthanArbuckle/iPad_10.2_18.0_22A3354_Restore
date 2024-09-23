@implementation SCICUNumberFormatter

- (id)formattedCount:(int64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCICUNumberFormatter formattedCount:withLocale:](self, "formattedCount:withLocale:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)formattedCount:(int64_t)a3 withLocale:(id)a4
{
  return -[SCICUNumberFormatter formattedCount:withLocale:longform:](self, "formattedCount:withLocale:longform:", a3, a4, 0);
}

- (id)formattedCount:(int64_t)a3 withLocale:(id)a4 longform:(BOOL)a5
{
  return -[SCICUNumberFormatter formattedCount:withLocale:longform:compactDisplay:](self, "formattedCount:withLocale:longform:compactDisplay:", a3, a4, a5, 0);
}

- (id)formattedCount:(int64_t)a3 withLocale:(id)a4 longform:(BOOL)a5 compactDisplay:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;

  v6 = a6;
  v7 = a5;
  objc_msgSend(a4, "localeIdentifier");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = formattedCountWithLocale(a3, objc_msgSend(v9, "UTF8String"), v7, v6);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    free(v10);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end
