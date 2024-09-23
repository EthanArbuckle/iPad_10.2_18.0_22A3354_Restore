@implementation SFSuggestionEngagementFeedback(VisualIntelligence)

- (id)VI_searchSuggestionFactory
{
  return objc_getAssociatedObject(a1, (const void *)SearchSuggestionFactoryKey);
}

- (void)setVI_searchSuggestionFactory:()VisualIntelligence
{
  const void *v4;
  id v5;

  v4 = (const void *)SearchSuggestionFactoryKey;
  v5 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, v4, v5, (void *)3);

}

- (id)VI_searchSuggestionForSuggestionType:()VisualIntelligence
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(a1, "VI_searchSuggestionFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "VI_searchSuggestionFactory");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D467C000, v8, OS_LOG_TYPE_ERROR, "searchSuggestionFactory was not set on SFSuggestionEngagementFeedback instance", v10, 2u);
      }

    }
    v7 = (void *)objc_msgSend(a1, "copy");
    objc_msgSend(v7, "setSuggestion:", v4);

  }
  return v7;
}

@end
