@implementation TRIAllocationStatus

- (TRIAllocationStatus)initWithType:(unsigned __int8)a3 date:(id)a4
{
  id v7;
  TRIAllocationStatus *v8;
  TRIAllocationStatus *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TRIAllocationStatus;
  v8 = -[TRIAllocationStatus init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_date, a4);
  }

  return v9;
}

- (BOOL)isEqualToStatus:(id)a3
{
  return self->_type == *((unsigned __int8 *)a3 + 8)
      && -[NSDate isEqualToDate:](self->_date, "isEqualToDate:", *((_QWORD *)a3 + 2));
}

- (unint64_t)hash
{
  unsigned int type;
  double v3;

  type = self->_type;
  -[NSDate timeIntervalSinceReferenceDate](self->_date, "timeIntervalSinceReferenceDate");
  return (unint64_t)v3 + 37 * type;
}

+ (id)_defaultProvider
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v9;

  v3 = a1;
  objc_sync_enter(v3);
  v4 = (void *)_sharedDefaultProvider;
  if (!_sharedDefaultProvider)
  {
    v5 = objc_opt_new();
    v6 = (void *)_sharedDefaultProvider;
    _sharedDefaultProvider = v5;

    v4 = (void *)_sharedDefaultProvider;
    if (!_sharedDefaultProvider)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("TRIAllocationStatusProvider.m"), 683, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_sharedDefaultProvider"));

      v4 = (void *)_sharedDefaultProvider;
    }
  }
  v7 = v4;
  objc_sync_exit(v3);

  return v7;
}

+ (void)resetDefaultProvider
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)_sharedDefaultProvider;
  _sharedDefaultProvider = 0;

  objc_sync_exit(obj);
}

+ (id)notificationNameForDeploymentEnvironment:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  TRIDeploymentEnvironment_EnumDescriptor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textFormatNameForValue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(CFSTR("com.apple.trial.status."), "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)syncProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)activeExperimentInformationWithError:(id *)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_defaultProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeExperimentInformationWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)activeBMLTInformationWithError:(id *)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_defaultProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeBMLTInformationWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sampleAllocationStatuses:(id)a3 correlationId:(id)a4 nrSamples:(unsigned int)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1A1AC6B8C]();
  if (objc_msgSend(v9, "count") <= (unint64_t)a5)
  {
    v17 = v9;
  }
  else
  {
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v10, "dataUsingEncoding:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "triSha256");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v13, "length") <= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIAllocationStatusProvider.m"), 728, CFSTR("Digest too small for correlation ID: %@"), v10);

      }
      v14 = objc_retainAutorelease(v13);
      v15 = *(_QWORD *)objc_msgSend(v14, "bytes");
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81608]), "initWithSeed:", v15);

    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v9, "_pas_shuffledArrayUsingRng:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subarrayWithRange:", 0, a5);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_autoreleasePoolPop(v11);

  return v17;
}

+ (id)getDateFromCursor:(id)a3
{
  return (id)objc_msgSend(a3, "date");
}

+ (id)categoricalValueForExperimentAllocationStatus:(unsigned __int8)a3
{
  if ((a3 - 1) > 8)
    return CFSTR("experiment-state-unknown");
  else
    return off_1E3BFFAD8[(char)(a3 - 1)];
}

+ (id)categoricalValueForRolloutAllocationStatus:(unsigned __int8)a3
{
  if ((a3 - 1) > 7u)
    return CFSTR("rollout-state-unknown");
  else
    return off_1E3BFFB20[(char)(a3 - 1)];
}

+ (id)internalToExternalStatusMapping
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E3C19550;
  v3[1] = &unk_1E3C19568;
  v4[0] = &unk_1E3C19550;
  v4[1] = &unk_1E3C19568;
  v3[2] = &unk_1E3C19580;
  v4[2] = &unk_1E3C19580;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (TRIAllocationStatus)initWithCoder:(id)a3
{
  TRIAllocationStatus *result;

  result = (TRIAllocationStatus *)a3;
  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (unsigned)type
{
  return self->_type;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
