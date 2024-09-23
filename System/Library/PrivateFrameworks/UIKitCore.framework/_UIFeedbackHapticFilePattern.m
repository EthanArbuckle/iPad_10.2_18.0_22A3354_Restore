@implementation _UIFeedbackHapticFilePattern

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return CFSTR("ahap");
}

+ (id)feedbackPatternFromFile:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFileURL:", v4);

  return v5;
}

- (_UIFeedbackHapticFilePattern)initWithFileURL:(id)a3
{
  id v5;
  _UIFeedbackHapticFilePattern *v6;
  _UIFeedbackHapticFilePattern *v7;
  _UIFeedbackHapticFilePattern *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackHapticFilePattern;
  v6 = -[_UIFeedback init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileURL, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIFeedbackHapticFilePattern;
  if (-[_UIFeedback isEqual:](&v7, sel_isEqual_, v4))
    v5 = -[NSURL isEqual:](self->_fileURL, "isEqual:", v4[17]);
  else
    v5 = 0;

  return v5;
}

- (_UIFeedbackHapticFilePattern)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  _UIFeedbackHapticFilePattern *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *fileURL;
  _UIFeedbackHapticFilePattern *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIFeedbackHapticFilePattern;
  v5 = -[_UIFeedback initWithDictionaryRepresentation:](&v12, sel_initWithDictionaryRepresentation_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:encodingInvalidCharacters:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFeedbackHapticFilePattern;
  -[_UIFeedback dictionaryRepresentation](&v7, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSURL absoluteString](self->_fileURL, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("fileURL"));

  return v4;
}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  void *v2;
  _BOOL4 v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_feedbackSupportLevel") > 1;

  return 2 * v3;
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
