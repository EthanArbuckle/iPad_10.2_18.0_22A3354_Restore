@implementation RTLearnedPlaceVersions

- (void)setInferredVersion:(id)a3
{
  RTLearnedPlace *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  RTLearnedPlace *inferredVersion;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (RTLearnedPlace *)a3;
  -[RTLearnedPlace identifier](v4, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceVersions existingVersion](self, "existingVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSObject isEqual:](v5, "isEqual:", v7);
  if (!v4 || v8)
  {

LABEL_7:
    goto LABEL_8;
  }
  -[RTLearnedPlaceVersions existingVersion](self, "existingVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[RTLearnedPlaceVersions setInferredVersion:]";
      v17 = 1024;
      v18 = 104;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [inferredVersion.identifier isEqual:self.existingVersion.identifier] || inferredVersion == nil || self.existingVersion == nil (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }
    goto LABEL_7;
  }
LABEL_8:
  v10 = -[RTLearnedPlace type](v4, "type");
  -[RTLearnedPlaceVersions truthfulCounterpart](self, "truthfulCounterpart");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = -[NSObject type](v11, "type");
  if (!v4 || v10 == v12)
  {
LABEL_13:

    goto LABEL_14;
  }
  -[RTLearnedPlaceVersions truthfulCounterpart](self, "truthfulCounterpart");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[RTLearnedPlaceVersions setInferredVersion:]";
      v17 = 1024;
      v18 = 107;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredVersion.type == self.truthfulCounterpart.type || inferredVersion == nil || self.truthfulCounterpart == nil (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }
    goto LABEL_13;
  }
LABEL_14:
  inferredVersion = self->_inferredVersion;
  self->_inferredVersion = v4;

}

- (void)setExistingVersion:(id)a3
{
  RTLearnedPlace *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  RTLearnedPlace *existingVersion;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (RTLearnedPlace *)a3;
  -[RTLearnedPlaceVersions inferredVersion](self, "inferredVersion");
  v5 = objc_claimAutoreleasedReturnValue();
  -[NSObject identifier](v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlace identifier](v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {

LABEL_7:
    goto LABEL_8;
  }
  -[RTLearnedPlaceVersions inferredVersion](self, "inferredVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[RTLearnedPlaceVersions setExistingVersion:]";
      v12 = 1024;
      v13 = 116;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [self.inferredVersion.identifier isEqual:existingVersion.identifier] || self.inferredVersion == nil || existingVersion == nil (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }
    goto LABEL_7;
  }
LABEL_8:
  existingVersion = self->_existingVersion;
  self->_existingVersion = v4;

}

- (void)setTruthfulCounterpart:(id)a3
{
  RTLearnedPlace *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  RTLearnedPlace *truthfulCounterpart;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (RTLearnedPlace *)a3;
  -[RTLearnedPlaceVersions inferredVersion](self, "inferredVersion");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[NSObject type](v5, "type");
  if (v6 == -[RTLearnedPlace type](v4, "type"))
  {
LABEL_6:

    goto LABEL_7;
  }
  -[RTLearnedPlaceVersions inferredVersion](self, "inferredVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[RTLearnedPlaceVersions setTruthfulCounterpart:]";
      v11 = 1024;
      v12 = 125;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.inferredVersion.type == truthfulCounterpart.type || self.inferredVersion == nil || truthfulCounterpart == nil (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }
    goto LABEL_6;
  }
LABEL_7:
  truthfulCounterpart = self->_truthfulCounterpart;
  self->_truthfulCounterpart = v4;

}

- (id)trueVersion
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[RTLearnedPlaceVersions existingVersion](self, "existingVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "typeSource") & 6;

  if (v4)
  {
    -[RTLearnedPlaceVersions existingVersion](self, "existingVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[RTLearnedPlaceVersions inferredVersion](self, "inferredVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "typeSource") & 6;

    if (v7)
    {
      -[RTLearnedPlaceVersions inferredVersion](self, "inferredVersion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  -[RTLearnedPlaceVersions inferredVersion](self, "inferredVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInferredVersion:", v5);

  -[RTLearnedPlaceVersions existingVersion](self, "existingVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExistingVersion:", v6);

  -[RTLearnedPlaceVersions truthfulCounterpart](self, "truthfulCounterpart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTruthfulCounterpart:", v7);

  return v4;
}

- (RTLearnedPlace)inferredVersion
{
  return self->_inferredVersion;
}

- (RTLearnedPlace)existingVersion
{
  return self->_existingVersion;
}

- (RTLearnedPlace)truthfulCounterpart
{
  return self->_truthfulCounterpart;
}

- (BOOL)isRotted
{
  return self->_isRotted;
}

- (void)setIsRotted:(BOOL)a3
{
  self->_isRotted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truthfulCounterpart, 0);
  objc_storeStrong((id *)&self->_existingVersion, 0);
  objc_storeStrong((id *)&self->_inferredVersion, 0);
}

@end
