@implementation ATXInfoTimelineEntryRelevance

+ (id)relevanceWithScore:(double)a3 duration:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithScore:duration:", a3, a4);
}

- (ATXInfoTimelineEntryRelevance)initWithScore:(double)a3 duration:(double)a4
{
  ATXInfoTimelineEntryRelevance *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXInfoTimelineEntryRelevance;
  result = -[ATXInfoTimelineEntryRelevance init](&v7, sel_init);
  if (result)
  {
    result->_score = a3;
    result->_duration = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double score;
  id v5;

  score = self->_score;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("score"), score);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);

}

- (ATXInfoTimelineEntryRelevance)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  ATXInfoTimelineEntryRelevance *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score"));
  v6 = v5;
  objc_msgSend(v4, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ATXInfoTimelineEntryRelevance initWithCoder:].cold.2(v4);
  }
  else
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v9 = v8;
    objc_msgSend(v4, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      self = -[ATXInfoTimelineEntryRelevance initWithScore:duration:](self, "initWithScore:duration:", v6, v9);
      v11 = self;
      goto LABEL_8;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ATXInfoTimelineEntryRelevance initWithCoder:].cold.1(v4);
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (double)score
{
  return self->_score;
}

- (double)duration
{
  return self->_duration;
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1AA841000, MEMORY[0x1E0C81028], v2, "ATXInfoTimelineEntryRelevance: error decoding %@ - %@", v3, v4, v5, v6, 2u);

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

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1AA841000, MEMORY[0x1E0C81028], v2, "ATXInfoTimelineEntryRelevance: error decoding %@ - %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
