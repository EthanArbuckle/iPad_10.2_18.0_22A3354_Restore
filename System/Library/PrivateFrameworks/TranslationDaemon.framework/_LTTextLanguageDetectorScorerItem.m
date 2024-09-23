@implementation _LTTextLanguageDetectorScorerItem

- (_LTTextLanguageDetectorScorerItem)initWithLocale:(id)a3 confidence:(double)a4 wordCount:(int64_t)a5
{
  id v9;
  _LTTextLanguageDetectorScorerItem *v10;
  NSObject *v11;
  NSObject *v12;
  _LTTextLanguageDetectorScorerItem *v13;
  NSObject *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTTextLanguageDetectorScorerItem;
  v10 = -[_LTTextLanguageDetectorScorerItem init](&v17, sel_init);
  if (!v10)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v11 = _LTOSLogLID();
  v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v12, OS_LOG_TYPE_INFO, "nil locale encountered in scorable item init; will ignore this item",
        buf,
        2u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v15 = v12;
    objc_msgSend(v9, "localeIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v16;
    v20 = 2048;
    v21 = a4;
    v22 = 2048;
    v23 = a5;
    _os_log_debug_impl(&dword_2491B9000, v15, OS_LOG_TYPE_DEBUG, "new scoring item locale: %{public}@; confidence: %f; words: %ld",
      buf,
      0x20u);

  }
  objc_storeStrong((id *)&v10->_locale, a3);
  v10->_confidence = a4;
  v10->_wordCount = a5;
  v13 = v10;
LABEL_9:

  return v13;
}

- (double)score
{
  return self->_confidence * (double)self->_wordCount;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (double)confidence
{
  return self->_confidence;
}

- (int64_t)wordCount
{
  return self->_wordCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
