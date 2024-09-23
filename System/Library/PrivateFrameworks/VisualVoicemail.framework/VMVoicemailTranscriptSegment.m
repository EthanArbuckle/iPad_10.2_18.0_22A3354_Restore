@implementation VMVoicemailTranscriptSegment

- (VMVoicemailTranscriptSegment)init
{
  -[VMVoicemailTranscriptSegment doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (VMVoicemailTranscriptSegment)initWithTranscriptionSegment:(id)a3 confidenceThreshold:(float)a4
{
  id v6;
  VMVoicemailTranscriptSegment *v7;
  float v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  NSString *substring;
  NSUInteger v13;
  double v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VMVoicemailTranscriptSegment;
  v7 = -[VMVoicemailTranscriptSegment init](&v16, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "confidence");
    v7->_confidence = v8;
    v9 = 3;
    if (v8 < a4)
      v9 = 1;
    if (v8 == 0.0)
      v9 = 0;
    v7->_confidenceRating = v9;
    objc_msgSend(v6, "duration");
    v7->_duration = v10;
    objc_msgSend(v6, "substring");
    v11 = objc_claimAutoreleasedReturnValue();
    substring = v7->_substring;
    v7->_substring = (NSString *)v11;

    v7->_substringRange.location = objc_msgSend(v6, "substringRange");
    v7->_substringRange.length = v13;
    objc_msgSend(v6, "timestamp");
    v7->_timestamp = v14;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[VMVoicemailTranscriptSegment confidence](self, "confidence");
  *(_DWORD *)(v5 + 8) = v6;
  *(_QWORD *)(v5 + 40) = -[VMVoicemailTranscriptSegment confidenceRating](self, "confidenceRating");
  -[VMVoicemailTranscriptSegment duration](self, "duration");
  *(_QWORD *)(v5 + 24) = v7;
  -[VMVoicemailTranscriptSegment substring](self, "substring");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  *(_QWORD *)(v5 + 48) = -[VMVoicemailTranscriptSegment substringRange](self, "substringRange");
  *(_QWORD *)(v5 + 56) = v11;
  -[VMVoicemailTranscriptSegment timestamp](self, "timestamp");
  *(_QWORD *)(v5 + 32) = v12;
  return (id)v5;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)MEMORY[0x24BDBCE60];
  -[VMVoicemailTranscriptSegment timestamp](self, "timestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1968];
  v6 = -[VMVoicemailTranscriptSegment substringRange](self, "substringRange");
  objc_msgSend(v5, "valueWithRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = objc_opt_class();
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[VMVoicemailTranscriptSegment confidence](self, "confidence");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VMVoicemailTranscriptSegment confidenceRating](self, "confidenceRating"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[VMVoicemailTranscriptSegment duration](self, "duration");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemailTranscriptSegment substring](self, "substring");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@ %p timestampDate=%@, confidence=%@, confidenceRating=%@, duration=%@, substring=%@, substringRange=%@>"), v10, self, v4, v12, v13, v15, v16, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  float confidence;
  id v5;
  void *v6;
  double v7;
  unint64_t confidenceRating;
  void *v9;
  double duration;
  void *v11;
  NSString *substring;
  void *v13;
  void *v14;
  void *v15;
  double timestamp;
  id v17;

  confidence = self->_confidence;
  v5 = a3;
  NSStringFromSelector(sel_confidence);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = confidence;
  objc_msgSend(v5, "encodeFloat:forKey:", v6, v7);

  confidenceRating = self->_confidenceRating;
  NSStringFromSelector(sel_confidenceRating);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", confidenceRating, v9);

  duration = self->_duration;
  NSStringFromSelector(sel_duration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeDouble:forKey:", v11, duration);

  substring = self->_substring;
  NSStringFromSelector(sel_substring);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", substring, v13);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", self->_substringRange.location, self->_substringRange.length);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_substringRange);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, v15);

  timestamp = self->_timestamp;
  NSStringFromSelector(sel_timestamp);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeDouble:forKey:", v17, timestamp);

}

- (VMVoicemailTranscriptSegment)initWithCoder:(id)a3
{
  id v4;
  VMVoicemailTranscriptSegment *v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *substring;
  uint64_t v17;
  void *v18;
  void *v19;
  NSUInteger v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VMVoicemailTranscriptSegment;
  v5 = -[VMVoicemailTranscriptSegment init](&v22, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_confidence);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", v6);
    v5->_confidence = v7;

    NSStringFromSelector(sel_confidenceRating);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_confidenceRating = objc_msgSend(v4, "decodeIntegerForKey:", v8);

    NSStringFromSelector(sel_duration);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v9);
    v5->_duration = v10;

    NSStringFromSelector(sel_timestamp);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v11);
    v5->_timestamp = v12;

    v13 = objc_opt_class();
    NSStringFromSelector(sel_substring);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    substring = v5->_substring;
    v5->_substring = (NSString *)v15;

    v17 = objc_opt_class();
    NSStringFromSelector(sel_substringRange);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_substringRange.location = objc_msgSend(v19, "rangeValue");
    v5->_substringRange.length = v20;

  }
  return v5;
}

- (NSString)substring
{
  return self->_substring;
}

- (_NSRange)substringRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_substringRange.length;
  location = self->_substringRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (float)confidence
{
  return self->_confidence;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (unint64_t)confidenceRating
{
  return self->_confidenceRating;
}

- (void)setConfidenceRating:(unint64_t)a3
{
  self->_confidenceRating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substring, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2116D5000, a2, a3, "Decoding timestamp as a double failed due to the following exception: %@", a5, a6, a7, a8, 2u);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2116D5000, a2, a3, "Decoding duration as a double failed due to the following exception: %@", a5, a6, a7, a8, 2u);
}

@end
