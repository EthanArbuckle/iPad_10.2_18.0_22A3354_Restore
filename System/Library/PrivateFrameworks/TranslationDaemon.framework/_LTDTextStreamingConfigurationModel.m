@implementation _LTDTextStreamingConfigurationModel

- (_LTDTextStreamingConfigurationModel)initWithDictionary:(id)a3
{
  id v4;
  _LTDTextStreamingConfigurationModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _LTDTextStreamingConfigurationModel *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_LTDTextStreamingConfigurationModel;
  v5 = -[_LTDTextStreamingConfigurationModel init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TextStreaming"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MinTimeBetweenTranslations"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MinTimeBetweenTranslations"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)objc_opt_new();
    }
    v9 = v8;
    objc_msgSend(v8, "doubleValue");
    v5->_minTimeBetweenTranslations = v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MaxTimeBetweenTranslations"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MaxTimeBetweenTranslations"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)objc_opt_new();
    }
    v13 = v12;
    objc_msgSend(v12, "doubleValue");
    v5->_maxTimeBetweenTranslations = v14;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UserIdleTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UserIdleTime"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (void *)objc_opt_new();
    }
    v17 = v16;
    objc_msgSend(v16, "doubleValue");
    v5->_userIdleTime = v18;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MaxPartialTranslationAttempts"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MaxPartialTranslationAttempts"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = (void *)objc_opt_new();
    }
    v21 = v20;
    v5->_maxPartialTranslationAttempts = objc_msgSend(v20, "integerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MinNumberOfCharactersForTranslation"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MinNumberOfCharactersForTranslation"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = (void *)objc_opt_new();
    }
    v24 = v23;
    v5->_minNumberOfCharactersForTranslation = objc_msgSend(v23, "integerValue");

    v25 = v5;
  }

  return v5;
}

- (double)minTimeBetweenTranslations
{
  return self->_minTimeBetweenTranslations;
}

- (double)maxTimeBetweenTranslations
{
  return self->_maxTimeBetweenTranslations;
}

- (double)userIdleTime
{
  return self->_userIdleTime;
}

- (int64_t)maxPartialTranslationAttempts
{
  return self->_maxPartialTranslationAttempts;
}

- (int64_t)minNumberOfCharactersForTranslation
{
  return self->_minNumberOfCharactersForTranslation;
}

@end
