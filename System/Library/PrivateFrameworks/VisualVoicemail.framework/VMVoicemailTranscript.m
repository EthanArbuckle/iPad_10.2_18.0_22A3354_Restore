@implementation VMVoicemailTranscript

- (VMVoicemailTranscript)init
{
  VMVoicemailTranscript *v2;
  VMVoicemailTranscript *v3;
  NSString *transcriptionString;
  NSArray *segments;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VMVoicemailTranscript;
  v2 = -[VMVoicemailTranscript init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_confidence = 0.0;
    v2->_confidenceRating = 0;
    transcriptionString = v2->_transcriptionString;
    v2->_transcriptionString = (NSString *)&stru_24CC5C1A0;

    segments = v3->_segments;
    v3->_segments = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v3;
}

- (VMVoicemailTranscript)initWithTranscription:(id)a3
{
  id v4;
  VMVoicemailTranscript *v5;
  VMVoicemailTranscript *v6;
  uint64_t v7;
  NSString *transcriptionString;
  id v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  uint64_t i;
  uint64_t v20;
  VMVoicemailTranscriptSegment *v21;
  double v22;
  VMVoicemailTranscriptSegment *v23;
  float v24;
  uint64_t v25;
  NSArray *segments;
  float confidence;
  uint64_t v28;
  float v29;
  float v30;
  float v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)VMVoicemailTranscript;
  v5 = -[VMVoicemailTranscript init](&v37, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_confidence = 0.0;
    v5->_confidenceRating = 0;
    objc_msgSend(v4, "formattedString");
    v7 = objc_claimAutoreleasedReturnValue();
    transcriptionString = v6->_transcriptionString;
    v6->_transcriptionString = (NSString *)v7;

    v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v4, "segments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    +[VMConfiguration confidenceSegmentThreshold](VMConfiguration, "confidenceSegmentThreshold");
    v13 = v12;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v4, "segments", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v34;
      v18 = 0.0;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v14);
          v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v21 = [VMVoicemailTranscriptSegment alloc];
          LODWORD(v22) = v13;
          v23 = -[VMVoicemailTranscriptSegment initWithTranscriptionSegment:confidenceThreshold:](v21, "initWithTranscriptionSegment:confidenceThreshold:", v20, v22);
          -[VMVoicemailTranscriptSegment confidence](v23, "confidence");
          v18 = v18 + v24;
          objc_msgSend(v11, "addObject:", v23);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v16);
    }
    else
    {
      v18 = 0.0;
    }

    v25 = objc_msgSend(v11, "copy");
    segments = v6->_segments;
    v6->_segments = (NSArray *)v25;

    if (v18 == 0.0)
    {
      confidence = v6->_confidence;
    }
    else
    {
      confidence = v18 / (float)-[NSArray count](v6->_segments, "count");
      v6->_confidence = confidence;
    }
    if (confidence == 0.0)
    {
      v28 = 0;
    }
    else
    {
      +[VMConfiguration confidenceLowQualityThreshold](VMConfiguration, "confidenceLowQualityThreshold");
      if (confidence >= v29)
      {
        v28 = 3;
      }
      else
      {
        v30 = v6->_confidence;
        +[VMConfiguration confidenceThreshold](VMConfiguration, "confidenceThreshold");
        v28 = 2;
        if (v30 < v31)
          v28 = 1;
      }
    }
    v6->_confidenceRating = v28;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[VMVoicemailTranscript confidence](self, "confidence");
  *(_DWORD *)(v5 + 8) = v6;
  *(_QWORD *)(v5 + 32) = -[VMVoicemailTranscript confidenceRating](self, "confidenceRating");
  -[VMVoicemailTranscript segments](self, "segments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  -[VMVoicemailTranscript transcriptionString](self, "transcriptionString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  return (id)v5;
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
  NSArray *segments;
  void *v11;
  NSString *transcriptionString;
  id v13;

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

  segments = self->_segments;
  NSStringFromSelector(sel_segments);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", segments, v11);

  transcriptionString = self->_transcriptionString;
  NSStringFromSelector(sel_transcriptionString);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", transcriptionString, v13);

}

- (VMVoicemailTranscript)initWithCoder:(id)a3
{
  id v4;
  VMVoicemailTranscript *v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *segments;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSString *transcriptionString;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VMVoicemailTranscript;
  v5 = -[VMVoicemailTranscript init](&v20, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_confidence);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", v6);
    v5->_confidence = v7;

    NSStringFromSelector(sel_confidenceRating);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_confidenceRating = objc_msgSend(v4, "decodeIntegerForKey:", v8);

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_segments);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    segments = v5->_segments;
    v5->_segments = (NSArray *)v13;

    v15 = objc_opt_class();
    NSStringFromSelector(sel_transcriptionString);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    transcriptionString = v5->_transcriptionString;
    v5->_transcriptionString = (NSString *)v17;

  }
  return v5;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  float v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("=====================================================\n"));
  -[VMVoicemailTranscript transcriptionString](self, "transcriptionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("=====================================================\n"));
  objc_msgSend(v3, "appendString:", CFSTR("Comprised of:\n"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VMVoicemailTranscript segments](self, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "debugDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[VMVoicemailTranscript confidence](self, "confidence");
  objc_msgSend(v3, "appendFormat:", CFSTR("With an overall confidence of %f (rating:%lu)"), v11, -[VMVoicemailTranscript confidenceRating](self, "confidenceRating"));
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (id)archivedData
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", self);
}

- (NSString)transcriptionString
{
  return self->_transcriptionString;
}

- (NSArray)segments
{
  return self->_segments;
}

- (float)confidence
{
  return self->_confidence;
}

- (unint64_t)confidenceRating
{
  return self->_confidenceRating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_transcriptionString, 0);
}

@end
