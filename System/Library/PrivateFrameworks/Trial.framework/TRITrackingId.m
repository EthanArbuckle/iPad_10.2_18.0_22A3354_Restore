@implementation TRITrackingId

+ (id)trackingIdWithProjectId:(int)a3 paths:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  +[TRILogTreatmentReader readerWithProjectId:paths:](TRILogTreatmentReader, "readerWithProjectId:paths:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "treatments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(a1, "trackingIdWithProjectId:paths:treatments:", v4, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)trackingIdWithProjectId:(int)a3 paths:(id)a4 treatments:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  TRITrackingId *v9;
  void *v10;
  void *v11;
  void *v12;
  TRITrackingId *v13;

  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = a4;
  v9 = [TRITrackingId alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRISubjectProvider defaultProviderWithPaths:](TRISubjectProvider, "defaultProviderWithPaths:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[TRITrackingId initWithUUID:time:treatments:subjectProvider:projectId:](v9, "initWithUUID:time:treatments:subjectProvider:projectId:", v10, v11, v7, v12, v6);
  return v13;
}

- (TRITrackingId)initWithUUID:(id)a3 time:(id)a4 treatments:(id)a5 subjectProvider:(id)a6 projectId:(int)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TRITrackingId *v17;
  TRITrackingId *v18;
  id v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)TRITrackingId;
  v17 = -[TRITrackingId init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_uuid, a3);
    objc_storeStrong((id *)&v18->_time, a4);
    objc_storeStrong((id *)&v18->_treatments, a5);
    objc_storeStrong((id *)&v18->_subjectProvider, a6);
    v18->_projectId = a7;
    v19 = -[TRISubjectProvider subject](v18->_subjectProvider, "subject");
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatments, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_subjectProvider, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

- (TRITrackingId)initWithUUID:(id)a3 time:(id)a4 treatments:(id)a5 subject:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TRITrackingId *v15;
  TRITrackingId *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TRITrackingId;
  v15 = -[TRITrackingId init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uuid, a3);
    objc_storeStrong((id *)&v16->_time, a4);
    objc_storeStrong((id *)&v16->_treatments, a5);
    objc_storeStrong((id *)&v16->_subject, a6);
  }

  return v16;
}

- (TRISubject)subject
{
  TRISubject *subject;

  subject = self->_subject;
  if (subject)
    return subject;
  -[TRISubjectProvider subjectWithProjectId:](self->_subjectProvider, "subjectWithProjectId:", self->_projectId);
  return (TRISubject *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[TRITrackingId uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqual:", v7))
    {
      v19 = 0;
LABEL_23:

      goto LABEL_24;
    }
    -[TRITrackingId time](self, "time");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    v10 = v9;
    objc_msgSend(v5, "time");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    if (vabdd_f64(v10, v12) >= 0.001)
    {
      v19 = 0;
LABEL_22:

      goto LABEL_23;
    }
    -[TRITrackingId subject](self, "subject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isEqual:", v14))
    {
      v19 = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[TRITrackingId treatments](self, "treatments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(v5, "treatments");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        v24 = 0;
        v19 = 1;
        goto LABEL_19;
      }
    }
    v25 = v15;
    -[TRITrackingId treatments](self, "treatments");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(v5, "treatments");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v23 = (void *)v18;
        -[TRITrackingId treatments](self, "treatments");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "treatments");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v22, "isEqualToArray:", v21);

        goto LABEL_16;
      }

    }
    v19 = 0;
LABEL_16:
    v15 = v25;
    if (v25)
    {
LABEL_20:

      goto LABEL_21;
    }
LABEL_19:

    goto LABEL_20;
  }
  v19 = 0;
LABEL_24:

  return v19;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TRITrackingId uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[TRITrackingId uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("uuid"));

  -[TRITrackingId time](self, "time");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("time"));

  -[TRITrackingId subject](self, "subject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("subject"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[TRITrackingId treatments](self, "treatments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", v8 != 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("hasTreatments"));

  -[TRITrackingId treatments](self, "treatments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TRITrackingId treatments](self, "treatments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("treatments"));

  }
}

- (TRITrackingId)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  TRITrackingId *v15;
  uint8_t v17[8];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasTreatments"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "BOOLValue"))
    {
      v10 = (void *)MEMORY[0x1E0C99E60];
      v18[0] = objc_opt_class();
      v18[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("treatments"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_11;
    }
    else
    {
      v13 = 0;
      if (!v5)
        goto LABEL_11;
    }
    if (v6 && v7 && (!objc_msgSend(v9, "BOOLValue") || v13))
    {
      v15 = -[TRITrackingId initWithUUID:time:treatments:subject:]([TRITrackingId alloc], "initWithUUID:time:treatments:subject:", v5, v6, v13, v7);
      goto LABEL_14;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_11:
  TRILogCategory_ClientFramework();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    _os_log_error_impl(&dword_19B89C000, v14, OS_LOG_TYPE_ERROR, "failed to decode tracking id, some fields were nil", v17, 2u);
  }

  v15 = 0;
LABEL_14:

  return v15;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TRITrackingId uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Trial tracking id %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDate)time
{
  return self->_time;
}

- (NSArray)treatments
{
  return self->_treatments;
}

@end
