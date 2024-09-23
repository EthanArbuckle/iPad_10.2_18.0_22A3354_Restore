@implementation TRITreatmentBaseTask

- (TRITreatmentBaseTask)initWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRITreatmentBaseTask *v12;
  TRITreatmentBaseTask *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITreatmentBaseTask.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment"));

  }
  if ((objc_msgSend(v9, "hasDeploymentId") & 1) != 0)
  {
    if (v10)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITreatmentBaseTask.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment.hasDeploymentId"));

    if (v10)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITreatmentBaseTask.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentId"));

LABEL_5:
  v18.receiver = self;
  v18.super_class = (Class)TRITreatmentBaseTask;
  v12 = -[TRIExperimentBaseTask initWithExperiment:](&v18, sel_initWithExperiment_, v9);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_treatmentId, a4);
    objc_storeStrong((id *)&v13->_taskAttributing, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  TRITreatmentBaseTask *v4;
  TRITreatmentBaseTask *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (TRITreatmentBaseTask *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TRITreatmentBaseTask;
    if (-[TRIExperimentBaseTask isEqual:](&v13, sel_isEqual_, v4))
    {
      v5 = v4;
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITreatmentBaseTask treatmentId](v5, "treatmentId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8)
      {
        -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRITreatmentBaseTask taskAttributing](v5, "taskAttributing");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TRITreatmentBaseTask;
  v3 = -[TRIExperimentBaseTask hash](&v10, sel_hash);
  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");

  }
  else
  {
    v6 = 0;
  }

  -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") + 37 * (v6 + 37 * v3);

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortDesc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@,%@,%@>"), v4, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)metrics
{
  return 0;
}

- (id)dimensions
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v2 = (void *)MEMORY[0x1E0C99DE8];
  v10.receiver = self;
  v10.super_class = (Class)TRITreatmentBaseTask;
  -[TRIExperimentBaseTask dimensions](&v10, sel_dimensions);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = v3;
  else
    v5 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v2, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)trialSystemTelemetry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TRITreatmentBaseTask;
  -[TRIExperimentBaseTask trialSystemTelemetry](&v9, sel_trialSystemTelemetry);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = (void *)objc_opt_new();
  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ensureExperimentFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientTreatmentId:", v4);

  -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "mergeFrom:", v7);
  return v3;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (TRITaskAttributing)taskAttributing
{
  return self->_taskAttributing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskAttributing, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
}

@end
