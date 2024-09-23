@implementation ATXShortcutsEditorSessionMetadata

- (ATXShortcutsEditorSessionMetadata)initWithNumStepsInShortcutAtStart:(unint64_t)a3
{
  ATXShortcutsEditorSessionMetadata *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXShortcutsEditorSessionMetadata;
  result = -[ATXShortcutsEditorSessionMetadata init](&v5, sel_init);
  if (result)
    result->_numStepsInShortcutAtStart = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t numStepsInShortcutAtStart;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  numStepsInShortcutAtStart = self->_numStepsInShortcutAtStart;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", numStepsInShortcutAtStart);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("numStepsInShortcutAtStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numStepsInShortcutAtEnd);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("numStepsInShortcutAtEnd"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_stepWasManuallyAdded);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("stepWasManuallyAdded"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLastSession);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("isLastSession"));

}

- (ATXShortcutsEditorSessionMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  ATXShortcutsEditorSessionMetadata *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_feedback();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("numStepsInShortcutAtStart"), v4, 1, CFSTR("com.apple.ATXFeedbackSessionMetadata"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || (objc_msgSend(v4, "error"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v22, !v22))
  {
    v9 = (void *)MEMORY[0x1E0D81610];
    v10 = objc_opt_class();
    __atxlog_handle_feedback();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("numStepsInShortcutAtEnd"), v4, 1, CFSTR("com.apple.ATXFeedbackSessionMetadata"), -1, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v4, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        __atxlog_handle_feedback();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[ATXShortcutsEditorSessionMetadata initWithCoder:].cold.3(v4);
        v21 = 0;
        goto LABEL_23;
      }
    }
    v13 = (void *)MEMORY[0x1E0D81610];
    v14 = objc_opt_class();
    __atxlog_handle_feedback();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("stepWasManuallyAdded"), v4, 1, CFSTR("com.apple.ATXFeedbackSessionMetadata"), -1, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    if (v16 || (objc_msgSend(v4, "error"), v24 = (void *)objc_claimAutoreleasedReturnValue(), v24, !v24))
    {
      v17 = (void *)MEMORY[0x1E0D81610];
      v18 = objc_opt_class();
      __atxlog_handle_feedback();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v18, CFSTR("isLastSession"), v4, 1, CFSTR("com.apple.ATXFeedbackSessionMetadata"), -1, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      if (v20
        || (objc_msgSend(v4, "error"), v25 = (void *)objc_claimAutoreleasedReturnValue(), v25, !v25))
      {
        self = -[ATXShortcutsEditorSessionMetadata initWithNumStepsInShortcutAtStart:](self, "initWithNumStepsInShortcutAtStart:", objc_msgSend(v8, "unsignedIntegerValue"));
        -[ATXShortcutsEditorSessionMetadata setNumStepsInShortcutAtEnd:](self, "setNumStepsInShortcutAtEnd:", -[NSObject unsignedIntegerValue](v12, "unsignedIntegerValue"));
        -[ATXShortcutsEditorSessionMetadata setStepWasManuallyAdded:](self, "setStepWasManuallyAdded:", -[NSObject BOOLValue](v16, "BOOLValue"));
        -[ATXShortcutsEditorSessionMetadata setIsLastSession:](self, "setIsLastSession:", -[NSObject BOOLValue](v20, "BOOLValue"));
        v21 = self;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      __atxlog_handle_feedback();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[ATXShortcutsEditorSessionMetadata initWithCoder:].cold.1(v4);

    }
    else
    {
      __atxlog_handle_feedback();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[ATXShortcutsEditorSessionMetadata initWithCoder:].cold.2(v4);
    }
    v21 = 0;
    goto LABEL_22;
  }
  __atxlog_handle_feedback();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[ATXShortcutsEditorSessionMetadata initWithCoder:].cold.4(v4);
  v21 = 0;
LABEL_24:

  return v21;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;

  v2 = self->_numStepsInShortcutAtEnd - self->_numStepsInShortcutAtStart + 32 * self->_numStepsInShortcutAtStart;
  v3 = self->_stepWasManuallyAdded - v2 + 32 * v2;
  return self->_isLastSession - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXShortcutsEditorSessionMetadata *v4;
  ATXShortcutsEditorSessionMetadata *v5;
  BOOL v6;

  v4 = (ATXShortcutsEditorSessionMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXShortcutsEditorSessionMetadata isEqualToATXShortcutsEditorSessionMetadata:](self, "isEqualToATXShortcutsEditorSessionMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToATXShortcutsEditorSessionMetadata:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;

  v4 = (unsigned __int8 *)a3;
  v5 = *(_OWORD *)&self->_numStepsInShortcutAtStart == *((_OWORD *)v4 + 1)
    && self->_stepWasManuallyAdded == v4[8]
    && self->_isLastSession == v4[9];

  return v5;
}

- (NSString)description
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1AF421DC4](self, a2);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@: \nnumStepsInShortcutAtStart: %lu \nnumStepsInShortcutAtEnd: %lu \nstepWasManaullyAdded: %{BOOL}d \nisLastSession: %{BOOL}d \n"), v6, self->_numStepsInShortcutAtStart, self->_numStepsInShortcutAtEnd, self->_stepWasManuallyAdded, self->_isLastSession);

  objc_autoreleasePoolPop(v3);
  return (NSString *)v7;
}

- (unint64_t)numStepsInShortcutAtStart
{
  return self->_numStepsInShortcutAtStart;
}

- (void)setNumStepsInShortcutAtStart:(unint64_t)a3
{
  self->_numStepsInShortcutAtStart = a3;
}

- (unint64_t)numStepsInShortcutAtEnd
{
  return self->_numStepsInShortcutAtEnd;
}

- (void)setNumStepsInShortcutAtEnd:(unint64_t)a3
{
  self->_numStepsInShortcutAtEnd = a3;
}

- (BOOL)stepWasManuallyAdded
{
  return self->_stepWasManuallyAdded;
}

- (void)setStepWasManuallyAdded:(BOOL)a3
{
  self->_stepWasManuallyAdded = a3;
}

- (BOOL)isLastSession
{
  return self->_isLastSession;
}

- (void)setIsLastSession:(BOOL)a3
{
  self->_isLastSession = a3;
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_9(&dword_1AA841000, v2, v3, "Unable to deserialize boxedIsLastSession in ATXFeedbackSessionMetadata. Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithCoder:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_9(&dword_1AA841000, v2, v3, "Unable to deserialize boxedStepWasManuallyAdded in ATXFeedbackSessionMetadata. Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithCoder:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_9(&dword_1AA841000, v2, v3, "Unable to deserialize boxedNumStepsInShortcutAtEnd in ATXFeedbackSessionMetadata. Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithCoder:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_9(&dword_1AA841000, v2, v3, "Unable to deserialize numStepsInShortcutAtStart in ATXFeedbackSessionMetadata. Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
