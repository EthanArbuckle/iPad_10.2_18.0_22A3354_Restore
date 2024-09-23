@implementation PGPhotosChallengePrecisionRecallByReasonMetricEvent

- (NSArray)payloads
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void **v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v12;
  objc_super v13;
  objc_super v14;
  objc_super v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v15.receiver = self;
    v15.super_class = (Class)PGPhotosChallengePrecisionRecallByReasonMetricEvent;
    -[PGPhotosChallengeMetricEvent payload](&v15, sel_payload);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v4;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = (void **)v19;
LABEL_8:
    objc_msgSend(v6, "arrayWithObjects:count:", v7, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = objc_opt_class();
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "PGPhotosChallengePrecisionRecallByReasonMetricEvent: evaluation object is the wrong type (%@)", buf, 0xCu);

    }
    v14.receiver = self;
    v14.super_class = (Class)PGPhotosChallengePrecisionRecallByReasonMetricEvent;
    -[PGPhotosChallengeMetricEvent payload](&v14, sel_payload);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v4;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = &v16;
    goto LABEL_8;
  }
  v13.receiver = self;
  v13.super_class = (Class)PGPhotosChallengePrecisionRecallByReasonMetricEvent;
  -[PGPhotosChallengePrecisionRecallByReasonMetricEvent self](&v13, sel_self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPhotosChallengeMetricEvent preparePayloadForPrecisionRecallEval:withEvaluations:](self, "preparePayloadForPrecisionRecallEval:withEvaluations:", v4, v3);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v10 = (void *)v5;

  return (NSArray *)v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPhotosChallengeMetricEvent identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPhotosChallengePrecisionRecallByReasonMetricEvent payloads](self, "payloads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@:\nIdentifier:%@\nPayloads:%@"), v4, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

@end
