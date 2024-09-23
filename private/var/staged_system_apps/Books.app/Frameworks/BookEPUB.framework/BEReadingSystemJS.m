@implementation BEReadingSystemJS

- (BEReadingSystemJS)initWithPaginationMode:(unint64_t)a3
{
  BEReadingSystemJS *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BEReadingSystemJS;
  result = -[BEReadingSystemJS init](&v5, "init");
  if (result)
    result->_paginationMode = a3;
  return result;
}

- (id)_layoutStyleForPaginationMode:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("scrolling");
  else
    return *(&off_378A00 + a3 - 1);
}

- (id)_supportsTouchEvents
{
  return CFSTR("true");
}

- (id)_supportsMouseEvents
{
  return CFSTR("false");
}

- (id)_scriptReplacements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BEReadingSystemJS _layoutStyleForPaginationMode:](self, "_layoutStyleForPaginationMode:", self->_paginationMode));
  v9[0] = v3;
  v8[0] = CFSTR("layoutStyle");
  v8[1] = CFSTR("touchEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BEReadingSystemJS _supportsTouchEvents](self, "_supportsTouchEvents"));
  v9[1] = v4;
  v8[2] = CFSTR("mouseEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEReadingSystemJS _supportsMouseEvents](self, "_supportsMouseEvents"));
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 3));

  return v6;
}

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
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[reading_system source](reading_system, "source"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEReadingSystemJS _scriptReplacements](self, "_scriptReplacements"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BESimpleTemplate javascriptStringFromJavascriptSource:replacements:](BESimpleTemplate, "javascriptStringFromJavascriptSource:replacements:", v5, v6));

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
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[reading_system sourceName](reading_system, "sourceName"));
    v5 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v5);

  }
  return v3;
}

- (unint64_t)paginationMode
{
  return self->_paginationMode;
}

- (void)setPaginationMode:(unint64_t)a3
{
  self->_paginationMode = a3;
}

@end
