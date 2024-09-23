@implementation BEContentLayoutInfo

- (BEContentLayoutInfo)initWithOptions:(id)a3
{
  id v5;
  BEContentLayoutInfo *v6;
  BEContentLayoutInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BEContentLayoutInfo;
  v6 = -[BEContentLayoutInfo init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_options, a3);

  return v7;
}

- (id)mainFrameOnlyJavascript:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;

  if (a3)
    return 0;
  v10 = CFSTR("bookInfo");
  v4 = objc_claimAutoreleasedReturnValue(-[BEWebViewFactoryPaginationOptions jsonRepresentation](self->_options, "jsonRepresentation"));
  v5 = (void *)v4;
  v6 = &stru_38FF08;
  if (v4)
    v6 = (const __CFString *)v4;
  v11 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[content_layout_info source](content_layout_info, "source"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BESimpleTemplate javascriptStringFromJavascriptSource:replacements:](BESimpleTemplate, "javascriptStringFromJavascriptSource:replacements:", v8, v7));

  return v9;
}

- (id)mainFrameJavascriptURL:(int64_t)a3
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
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[content_layout_info sourceName](content_layout_info, "sourceName"));
    v5 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v5);

  }
  return v3;
}

- (id)anyFrameJavascript:(int64_t)a3
{
  return 0;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  return 0;
}

+ (id)javascriptForContentOptions:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_layout_info.getFramesAndPageOffsets(%@)"), v3));

  return v4;
}

+ (id)updateScriptWithOptions:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "jsonRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_layout_info.updateDocumentInfo('%@')"), v3));

  return v4;
}

+ (NSString)anchorFramesScript
{
  return (NSString *)CFSTR("__ibooks_content_layout_info._anchorFrames()");
}

+ (NSString)mediaFramesScript
{
  return (NSString *)CFSTR("__ibooks_content_layout_info._mediaFrames()");
}

+ (NSString)expandableContentFramesScript
{
  return (NSString *)CFSTR("__ibooks_content_layout_info._expandableContentFrames()");
}

+ (NSString)textContentScript
{
  return (NSString *)CFSTR("__ibooks_content_layout_info._textContent()");
}

+ (NSString)textDirectionScript
{
  return (NSString *)CFSTR("__ibooks_content_layout_info._effectiveTextDirection()");
}

+ (NSString)writingModeScript
{
  return (NSString *)CFSTR("__ibooks_content_layout_info._effectiveWritingMode()");
}

+ (NSString)scrollingElementSizeScript
{
  return (NSString *)CFSTR("__ibooks_content_layout_info._scrollingElementSize()");
}

- (BEWebViewFactoryPaginationOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
