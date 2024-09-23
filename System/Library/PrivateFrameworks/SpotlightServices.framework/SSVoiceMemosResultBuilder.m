@implementation SSVoiceMemosResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.VoiceMemos");
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSVoiceMemosResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSVoiceMemosResultBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSVoiceMemosResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v10, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60D0], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVoiceMemosResultBuilder setCreationDate:](v5, "setCreationDate:", v6);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA61A8], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVoiceMemosResultBuilder setDurationInSeconds:](v5, "setDurationInSeconds:", v7);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA68B8], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVoiceMemosResultBuilder setTranscription:](v5, "setTranscription:", v8);

  }
  return v5;
}

- (id)buildTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[SSVoiceMemosResultBuilder transcription](self, "transcription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[SSVoiceMemosResultBuilder transcription](self, "transcription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder buildHighlightedTextWithString:includeQuotes:](self, "buildHighlightedTextWithString:includeQuotes:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setMaxLines:", 2);
    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSVoiceMemosResultBuilder;
    -[SSResultBuilder buildTitle](&v8, sel_buildTitle);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)buildDescriptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (SSSnippetModernizationEnabled())
  {
    v3 = (void *)objc_opt_new();
    -[SSVoiceMemosResultBuilder transcription](self, "transcription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      v25.receiver = self;
      v25.super_class = (Class)SSVoiceMemosResultBuilder;
      -[SSResultBuilder buildTitle](&v25, sel_buildTitle);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

    }
    -[SSVoiceMemosResultBuilder creationDate](self, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[SSVoiceMemosResultBuilder creationDate](self, "creationDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSDateFormatManager dynamicMediumStringFromDate:](SSDateFormatManager, "dynamicMediumStringFromDate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);

    }
    -[SSVoiceMemosResultBuilder durationInSeconds](self, "durationInSeconds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SSVoiceMemosResultBuilder durationInSeconds](self, "durationInSeconds");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v14 = round(v13);

      v15 = (void *)objc_opt_new();
      v16 = v15;
      if (v14 < 60.0)
        v17 = 192;
      else
        v17 = 224;
      if (v14 < 60.0)
        v18 = 0x10000;
      else
        v18 = 65538;
      objc_msgSend(v15, "setAllowedUnits:", v17);
      objc_msgSend(v16, "setZeroFormattingBehavior:", v18);
      objc_msgSend(v16, "stringFromTimeInterval:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v19);

    }
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" · "));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SSVoiceMemosResultBuilder;
    -[SSResultBuilder buildDescriptions](&v24, sel_buildDescriptions);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v22;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSNumber)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void)setDurationInSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_durationInSeconds, a3);
}

- (NSString)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
  objc_storeStrong((id *)&self->_transcription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcription, 0);
  objc_storeStrong((id *)&self->_durationInSeconds, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
