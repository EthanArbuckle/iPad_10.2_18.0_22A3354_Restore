@implementation _UIFeedbackLibraryPattern

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return CFSTR("library");
}

+ (id)feedbackPatternWithLibraryKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLibraryKey:", v4);

  return v5;
}

- (_UIFeedbackLibraryPattern)initWithLibraryKey:(id)a3
{
  id v5;
  _UIFeedbackLibraryPattern *v6;
  _UIFeedbackLibraryPattern *v7;
  _UIFeedbackLibraryPattern *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackLibraryPattern;
  v6 = -[_UIFeedback init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryKey, a3);
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
  v7.super_class = (Class)_UIFeedbackLibraryPattern;
  if (-[_UIFeedback isEqual:](&v7, sel_isEqual_, v4))
    v5 = -[NSString isEqual:](self->_libraryKey, "isEqual:", v4[16]);
  else
    v5 = 0;

  return v5;
}

- (_UIFeedbackLibraryPattern)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  _UIFeedbackLibraryPattern *v5;
  uint64_t v6;
  NSString *libraryKey;
  _UIFeedbackLibraryPattern *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackLibraryPattern;
  v5 = -[_UIFeedback initWithDictionaryRepresentation:](&v10, sel_initWithDictionaryRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("libraryKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    libraryKey = v5->_libraryKey;
    v5->_libraryKey = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFeedbackLibraryPattern;
  -[_UIFeedback dictionaryRepresentation](&v6, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_libraryKey, CFSTR("libraryKey"));
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

- (CHHapticPattern)pattern
{
  CHHapticPattern *pattern;
  void *v4;
  id v5;
  NSString *libraryKey;
  CHHapticPattern *v7;
  id v8;
  CHHapticPattern *v9;
  unint64_t v10;
  NSObject *v11;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 buf;
  Class (*v19)(uint64_t);
  void *v20;
  uint64_t *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  pattern = self->_pattern;
  if (!pattern)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v4 = (void *)qword_1ECD7B138;
    v17 = qword_1ECD7B138;
    if (!qword_1ECD7B138)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v19 = __getCHHapticPatternClass_block_invoke_0;
      v20 = &unk_1E16B14C0;
      v21 = &v14;
      __getCHHapticPatternClass_block_invoke_0((uint64_t)&buf);
      v4 = (void *)v15[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v14, 8);
    libraryKey = self->_libraryKey;
    v13 = 0;
    objc_msgSend(v5, "patternForKey:error:", libraryKey, &v13);
    v7 = (CHHapticPattern *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v9 = self->_pattern;
    self->_pattern = v7;

    if (v8 && !_UIFeedbackLoggingDisabled)
    {
      v10 = qword_1ECD7B130;
      if (!qword_1ECD7B130)
      {
        v10 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&qword_1ECD7B130);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "failed loading haptic library pattern: %@", (uint8_t *)&buf, 0xCu);
      }
    }

    pattern = self->_pattern;
  }
  return pattern;
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (NSString)libraryKey
{
  return self->_libraryKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern, 0);
  objc_storeStrong((id *)&self->_libraryKey, 0);
}

@end
