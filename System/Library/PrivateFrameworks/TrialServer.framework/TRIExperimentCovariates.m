@implementation TRIExperimentCovariates

- (TRIExperimentCovariates)initWithExperimentRecord:(id)a3
{
  id v5;
  TRIExperimentCovariates *v6;
  TRIExperimentCovariates *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIExperimentCovariates;
  v6 = -[TRIExperimentCovariates init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_experimentRecord, a3);

  return v7;
}

- (id)tri_contextValueWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[TRIExperimentCovariates dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The experiment covariates do not contain the key %@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exceptionWithName:reason:userInfo:", CFSTR("KeyNotFoundException"), v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v10);
  }

  return v6;
}

- (id)dictionary
{
  TRIExperimentCovariates *v2;
  NSDictionary *dictionary;
  void *v4;
  uint64_t v5;
  NSDictionary *v6;
  NSDictionary *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  dictionary = v2->_dictionary;
  if (!dictionary)
  {
    v9 = CFSTR("IsActivated");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TRIExperimentCovariates _isExperimentActivated:](v2, "_isExperimentActivated:", v2->_experimentRecord));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_dictionary;
    v2->_dictionary = (NSDictionary *)v5;

    dictionary = v2->_dictionary;
  }
  v7 = dictionary;
  objc_sync_exit(v2);

  return v7;
}

- (unint64_t)_isExperimentActivated:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "status") == 1 || objc_msgSend(v3, "status") == 3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_experimentRecord, 0);
}

@end
