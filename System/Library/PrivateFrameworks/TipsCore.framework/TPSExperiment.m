@implementation TPSExperiment

- (int64_t)camp
{
  return self->_camp;
}

- (BOOL)updateWithExperimentDictionary:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  double v8;
  NSObject *v10;
  double holdoutAllocation;
  NSObject *v12;
  BOOL v13;
  int v15;
  int64_t v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "TPSSafeIntegerForKey:", CFSTR("id"));
    if (self->_identifier != v6)
    {
      v7 = v6;
      self->_identifier = v6;
      objc_msgSend(v5, "TPSSafeDoubleForKey:", CFSTR("holdoutAllocation"));
      if (v8 > 1.0 || v8 < 0.0)
        v8 = 0.0;
      self->_holdoutAllocation = v8;
      +[TPSLogger data](TPSLogger, "data");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        holdoutAllocation = self->_holdoutAllocation;
        v15 = 134218240;
        v16 = v7;
        v17 = 2048;
        v18 = holdoutAllocation;
        _os_log_impl(&dword_19A906000, v10, OS_LOG_TYPE_DEFAULT, "Update experiment to identifier %zd, holdoutAllocation %.2f", (uint8_t *)&v15, 0x16u);
      }

      if (self->_camp)
      {
        self->_camp = 1;
        +[TPSLogger data](TPSLogger, "data");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_19A906000, v12, OS_LOG_TYPE_DEFAULT, "Experiment changes after camp has been assigned, rolling user back to all content group", (uint8_t *)&v15, 2u);
        }

      }
      goto LABEL_17;
    }
  }
  else if (self->_camp != 1)
  {
    self->_holdoutAllocation = 0.0;
    self->_camp = 1;
LABEL_17:
    -[TPSExperiment updateCampIfNeeded](self, "updateCampIfNeeded");
    v13 = 1;
    goto LABEL_18;
  }
  v13 = 0;
LABEL_18:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSExperiment)init
{
  TPSExperiment *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPSExperiment;
  result = -[TPSExperiment init](&v3, sel_init);
  if (result)
  {
    result->_holdoutAllocation = 0.0;
    result->_camp = 0;
    result->_identifier = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (TPSExperiment)initWithCoder:(id)a3
{
  id v4;
  TPSExperiment *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int64_t identifier;
  int64_t camp;
  objc_super v13;
  uint8_t buf[4];
  int64_t v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSExperiment;
  v5 = -[TPSExperiment init](&v13, sel_init);
  if (v5)
  {
    v5->_identifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("id"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("holdoutAllocation"));
    v5->_holdoutAllocation = v6;
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("camp"));
    if (v7 > 2)
      v8 = 1;
    else
      v8 = v7;
    v5->_camp = v8;
    +[TPSLogger data](TPSLogger, "data");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      identifier = v5->_identifier;
      camp = v5->_camp;
      *(_DWORD *)buf = 134218240;
      v15 = identifier;
      v16 = 2048;
      v17 = camp;
      _os_log_impl(&dword_19A906000, v9, OS_LOG_TYPE_DEFAULT, "Current experiment %zd, user camp %zd", buf, 0x16u);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", identifier, CFSTR("id"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_camp, CFSTR("camp"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("holdoutAllocation"), self->_holdoutAllocation);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setCamp:", self->_camp);
  objc_msgSend(v4, "setHoldoutAllocation:", self->_holdoutAllocation);
  return v4;
}

- (BOOL)updateCampIfNeeded
{
  void *v3;
  void *v4;
  int64_t v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  int64_t camp;
  int64_t v10;
  double v11;
  NSObject *v12;
  int v14;
  double v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[TPSDefaultsManager holdoutGroup](TPSDefaultsManager, "holdoutGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
    v6 = v5;
    if (v5 == self->_camp)
    {
      v7 = 0;
    }
    else
    {
      self->_camp = v5;
      +[TPSLogger data](TPSLogger, "data");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 134217984;
        v15 = *(double *)&v6;
        _os_log_impl(&dword_19A906000, v8, OS_LOG_TYPE_DEFAULT, "Camp overrode to %zd", (uint8_t *)&v14, 0xCu);
      }

      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
    v6 = 1;
  }
  camp = self->_camp;
  if (!camp)
  {
    if (self->_holdoutAllocation != 0.0)
    {
      v11 = (double)(arc4random_uniform(0x64u) + 1) / 100.0;
      if (v11 <= self->_holdoutAllocation)
        v6 = 2;
      +[TPSLogger data](TPSLogger, "data");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 134218240;
        v15 = v11;
        v16 = 2048;
        v17 = v6;
        _os_log_impl(&dword_19A906000, v12, OS_LOG_TYPE_DEFAULT, "Experiment dice roll %.2f, user camp %zd", (uint8_t *)&v14, 0x16u);
      }

    }
    if (v6 > 2)
      v10 = 1;
    else
      v10 = v6;
    goto LABEL_20;
  }
  if (camp >= 3)
  {
    v10 = 1;
LABEL_20:
    self->_camp = v10;
    v7 = 1;
  }

  return v7;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v7.receiver = self;
  v7.super_class = (Class)TPSExperiment;
  -[TPSExperiment debugDescription](&v7, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %zd\n"), CFSTR("id"), self->_identifier);
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %zd\n"), CFSTR("camp"), self->_camp);
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %.2f\n"), CFSTR("holdoutAllocation"), *(_QWORD *)&self->_holdoutAllocation);
  return v5;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (double)holdoutAllocation
{
  return self->_holdoutAllocation;
}

- (void)setHoldoutAllocation:(double)a3
{
  self->_holdoutAllocation = a3;
}

- (void)setCamp:(int64_t)a3
{
  self->_camp = a3;
}

@end
