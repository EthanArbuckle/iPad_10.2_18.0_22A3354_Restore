@implementation VKRecognizedText

- (VKRecognizedText)initWithFrameInfo:(id)a3 textBlockObservation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VKRecognizedText *v9;
  uint64_t v10;
  NSMutableDictionary *transcripts;
  NSMutableDictionary *v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "getCROutputRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)VKRecognizedText;
  v9 = -[VKRecognizedItem initWithFrameInfo:rectangleObservation:layoutDirection:](&v15, sel_initWithFrameInfo_rectangleObservation_layoutDirection_, v7, v6, objc_msgSend(v8, "layoutDirection"));

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    transcripts = v9->_transcripts;
    v9->_transcripts = (NSMutableDictionary *)v10;

    v12 = v9->_transcripts;
    objc_msgSend(v6, "getTranscript");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", &unk_1E9494FB8, v13);

  }
  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VKRecognizedText;
  -[VKRecognizedText description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKRecognizedText transcript](self, "transcript");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ transcript:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldAssociateWithItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKRecognizedText;
  if (-[VKRecognizedItem shouldAssociateWithItem:](&v14, sel_shouldAssociateWithItem_, v4))
  {
    v5 = objc_opt_class();
    VKDynamicCast(v5, (uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transcript");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = vcvtpd_s64_f64((double)(unint64_t)objc_msgSend(v7, "length") * 0.1);
    -[VKRecognizedText transcript](self, "transcript");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "editDistanceFromString:threshold:", v9, v8);

    v12 = v10 != 0x7FFFFFFF && v10 < v8;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)associateWithItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VKRecognizedText;
  v4 = a3;
  -[VKRecognizedItem associateWithItem:](&v12, sel_associateWithItem_, v4);
  v5 = objc_opt_class();
  VKCheckedDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "transcript", v12.receiver, v12.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_transcripts, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "integerValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_transcripts, "setObject:forKeyedSubscript:", v11, v7);

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_transcripts, "setObject:forKeyedSubscript:", &unk_1E9494FB8, v7);
  }

}

- (VNRecognizedTextObservation)observation
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_opt_class();
  v7.receiver = self;
  v7.super_class = (Class)VKRecognizedText;
  -[VKRecognizedItem observation](&v7, sel_observation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKDynamicCast(v3, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (VNRecognizedTextObservation *)v5;
}

- (NSString)transcript
{
  void *v2;
  void *v3;

  -[NSMutableDictionary keysSortedByValueUsingComparator:](self->_transcripts, "keysSortedByValueUsingComparator:", &__block_literal_global_31);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

uint64_t __30__VKRecognizedText_transcript__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcripts, 0);
}

@end
