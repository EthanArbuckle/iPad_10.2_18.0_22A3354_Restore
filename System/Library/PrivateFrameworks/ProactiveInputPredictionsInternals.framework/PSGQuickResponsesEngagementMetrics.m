@implementation PSGQuickResponsesEngagementMetrics

- (PSGQuickResponsesEngagementMetrics)initWithLang:(id)a3 rolloutId:(id)a4 factorPackId:(id)a5 experimentId:(id)a6 treatmentId:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  PSGQuickResponsesEngagementMetrics *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_opt_new();
  v18 = -[PSGQuickResponsesEngagementMetrics initWithLang:rolloutId:factorPackId:experimentId:treatmentId:engagementDeltas:](self, "initWithLang:rolloutId:factorPackId:experimentId:treatmentId:engagementDeltas:", v16, v15, v14, v13, v12, v17);

  return v18;
}

- (PSGQuickResponsesEngagementMetrics)initWithLang:(id)a3 rolloutId:(id)a4 factorPackId:(id)a5 experimentId:(id)a6 treatmentId:(id)a7 engagementDeltas:(id)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  PSGQuickResponsesEngagementMetrics *v19;
  PSGQuickResponsesEngagementMetrics *v20;
  void *v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v15 = a3;
  v27 = a4;
  v26 = a5;
  v25 = a6;
  v16 = a7;
  v17 = a8;
  v18 = v17;
  if (v15)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSGDPDeviceMetricsCollector.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lang"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSGDPDeviceMetricsCollector.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("engagementDeltas"));

LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)PSGQuickResponsesEngagementMetrics;
  v19 = -[PSGQuickResponsesEngagementMetrics init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_lang, a3);
    objc_storeStrong((id *)&v20->_rolloutId, a4);
    objc_storeStrong((id *)&v20->_factorPackId, a5);
    objc_storeStrong((id *)&v20->_experimentId, a6);
    objc_storeStrong((id *)&v20->_treatmentId, a7);
    objc_storeStrong((id *)&v20->_engagementDeltas, a8);
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *lang;
  id v5;

  lang = self->_lang;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lang, CFSTR("lang"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rolloutId, CFSTR("rolloutId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_factorPackId, CFSTR("factorPackId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_experimentId, CFSTR("experimentId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_treatmentId, CFSTR("treatmentId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_engagementDeltas, CFSTR("engagementDeltas"));

}

- (PSGQuickResponsesEngagementMetrics)initWithCoder:(id)a3
{
  id v5;
  PSGQuickResponsesEngagementMetrics *v6;
  PSGQuickResponsesEngagementMetrics *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  PSGQuickResponsesEngagementMetrics *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *context;
  void *contexta;
  PSGQuickResponsesEngagementMetrics *v48;
  SEL v49;
  objc_super v50;
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PSGQuickResponsesEngagementMetrics;
  v6 = -[PSGQuickResponsesEngagementMetrics init](&v50, sel_init);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x24BE7A630];
    v9 = objc_opt_class();
    v10 = *MEMORY[0x24BE79A70];
    psg_default_log_handle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v9, CFSTR("lang"), v5, 1, v10, 3, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PSGDPDeviceMetricsCollector.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lang"));

    }
    v13 = (void *)MEMORY[0x24BE7A630];
    v14 = objc_opt_class();
    psg_default_log_handle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("rolloutId"), v5, 0, v10, 3, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      psg_default_log_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "error");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v52 = v34;
        _os_log_error_impl(&dword_22F6A5000, v18, OS_LOG_TYPE_ERROR, "Secure coding failure: %@", buf, 0xCu);

      }
      v19 = 0;
    }
    else
    {
      v49 = a2;
      v20 = (void *)MEMORY[0x24BE7A630];
      v21 = objc_opt_class();
      psg_default_log_handle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v21, CFSTR("factorPackId"), v5, 0, v10, 3, v22);
      v18 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        psg_default_log_handle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v5, "error");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v52 = v41;
          _os_log_error_impl(&dword_22F6A5000, v24, OS_LOG_TYPE_ERROR, "Secure coding failure: %@", buf, 0xCu);

        }
        v19 = 0;
      }
      else
      {
        v48 = v7;
        v25 = (void *)MEMORY[0x24BE7A630];
        v26 = objc_opt_class();
        psg_default_log_handle();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v26, CFSTR("experimentId"), v5, 0, v10, 3, v27);
        v24 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "error");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          psg_default_log_handle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v5, "error");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v52 = v42;
            _os_log_error_impl(&dword_22F6A5000, v29, OS_LOG_TYPE_ERROR, "Secure coding failure: %@", buf, 0xCu);

          }
          v19 = 0;
        }
        else
        {
          context = (void *)MEMORY[0x24BE7A630];
          v30 = objc_opt_class();
          psg_default_log_handle();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(context, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v30, CFSTR("treatmentId"), v5, 0, v10, 3, v31);
          v29 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "error");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            psg_default_log_handle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v5, "error");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v52 = v43;
              _os_log_error_impl(&dword_22F6A5000, v33, OS_LOG_TYPE_ERROR, "Secure coding failure: %@", buf, 0xCu);

            }
            v19 = 0;
          }
          else
          {
            v35 = (void *)MEMORY[0x24BE7A630];
            contexta = (void *)MEMORY[0x2348A15A8]();
            v36 = objc_alloc(MEMORY[0x24BDBCF20]);
            v37 = objc_opt_class();
            v38 = (void *)objc_msgSend(v36, "initWithObjects:", v37, objc_opt_class(), 0);
            objc_autoreleasePoolPop(contexta);
            psg_default_log_handle();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v38, CFSTR("engagementDeltas"), v5, 1, v10, 3, v39);
            v33 = objc_claimAutoreleasedReturnValue();

            if (!v33)
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", v49, v48, CFSTR("PSGDPDeviceMetricsCollector.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deltas"));

            }
            v19 = -[PSGQuickResponsesEngagementMetrics initWithLang:rolloutId:factorPackId:experimentId:treatmentId:engagementDeltas:](v48, "initWithLang:rolloutId:factorPackId:experimentId:treatmentId:engagementDeltas:", v12, v16, v18, v24, v29, v33);
            v48 = v19;
          }

        }
        v7 = v48;
      }

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)isEqualToQuickResponsesEngagementMetrics:(id)a3
{
  id *v4;
  NSString *lang;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *rolloutId;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSString *factorPackId;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  NSString *experimentId;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  NSString *treatmentId;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  char v29;
  char v30;
  NSMutableArray *v32;
  NSMutableArray *v33;

  v4 = (id *)a3;
  lang = self->_lang;
  v6 = (NSString *)v4[1];
  if (lang == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = lang;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_19;
  }
  rolloutId = self->_rolloutId;
  v11 = (NSString *)v4[2];
  if (rolloutId == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = rolloutId;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_19;
  }
  factorPackId = self->_factorPackId;
  v16 = (NSString *)v4[3];
  if (factorPackId == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = factorPackId;
    v19 = -[NSString isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_19;
  }
  experimentId = self->_experimentId;
  v21 = (NSString *)v4[4];
  if (experimentId == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = experimentId;
    v24 = -[NSString isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_19;
  }
  treatmentId = self->_treatmentId;
  v26 = (NSString *)v4[5];
  if (treatmentId == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = treatmentId;
    v29 = -[NSString isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
    {
LABEL_19:
      v30 = 0;
      goto LABEL_20;
    }
  }
  v32 = self->_engagementDeltas;
  v33 = v32;
  if (v32 == v4[6])
    v30 = 1;
  else
    v30 = -[NSMutableArray isEqual:](v32, "isEqual:");

LABEL_20:
  return v30;
}

- (BOOL)isEqual:(id)a3
{
  PSGQuickResponsesEngagementMetrics *v4;
  PSGQuickResponsesEngagementMetrics *v5;
  BOOL v6;

  v4 = (PSGQuickResponsesEngagementMetrics *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PSGQuickResponsesEngagementMetrics isEqualToQuickResponsesEngagementMetrics:](self, "isEqualToQuickResponsesEngagementMetrics:", v5);

  return v6;
}

- (NSString)lang
{
  return self->_lang;
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (NSString)factorPackId
{
  return self->_factorPackId;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (NSMutableArray)engagementDeltas
{
  return self->_engagementDeltas;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementDeltas, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_factorPackId, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
  objc_storeStrong((id *)&self->_lang, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
