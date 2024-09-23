@implementation GTCaptureProgress

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureProgress)initWithCoder:(id)a3
{
  id v4;
  GTCaptureProgress *v5;
  id v6;
  uint64_t v7;
  GTCaptureDescriptor *descriptor;
  id v9;
  uint64_t v10;
  GTCaptureProgressStatistics *stats;
  GTCaptureCompletionState *v12;
  GTCaptureCompletionState *completionState;
  id v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GTCaptureProgress;
  v5 = -[GTCaptureProgress init](&v19, "init");
  if (v5)
  {
    v5->_captureState = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("captureState"));
    v5->_capturedCommandsBuffers = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("capturedCommandsBuffers"));
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GTCaptureDescriptor), CFSTR("descriptor"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    descriptor = v5->_descriptor;
    v5->_descriptor = (GTCaptureDescriptor *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GTCaptureProgressStatistics), CFSTR("stats"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    stats = v5->_stats;
    v5->_stats = (GTCaptureProgressStatistics *)v10;

    v12 = objc_opt_new(GTCaptureCompletionState);
    completionState = v5->_completionState;
    v5->_completionState = v12;

    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL), CFSTR("completionState.archiveURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[GTCaptureCompletionState setArchiveURL:](v5->_completionState, "setArchiveURL:", v15);

    v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSError), CFSTR("completionState.error"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[GTCaptureCompletionState setError:](v5->_completionState, "setError:", v17);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t captureState;
  id v5;
  void *v6;
  id v7;

  captureState = self->_captureState;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", captureState, CFSTR("captureState"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_capturedCommandsBuffers, CFSTR("capturedCommandsBuffers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptor, CFSTR("descriptor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stats, CFSTR("stats"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GTCaptureCompletionState archiveURL](self->_completionState, "archiveURL"));
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("completionState.archiveURL"));

  v7 = (id)objc_claimAutoreleasedReturnValue(-[GTCaptureCompletionState error](self->_completionState, "error"));
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("completionState.error"));

}

- (id)description
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTCaptureProgress;
  v2 = -[GTCaptureProgress description](&v6, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v3));

  return v4;
}

- (unint64_t)captureState
{
  return self->_captureState;
}

- (void)setCaptureState:(unint64_t)a3
{
  self->_captureState = a3;
}

- (GTCaptureDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (GTCaptureCompletionState)completionState
{
  return self->_completionState;
}

- (void)setCompletionState:(id)a3
{
  objc_storeStrong((id *)&self->_completionState, a3);
}

- (unint64_t)capturedCommandsBuffers
{
  return self->_capturedCommandsBuffers;
}

- (void)setCapturedCommandsBuffers:(unint64_t)a3
{
  self->_capturedCommandsBuffers = a3;
}

- (GTCaptureProgressStatistics)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
  objc_storeStrong((id *)&self->_stats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_completionState, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
