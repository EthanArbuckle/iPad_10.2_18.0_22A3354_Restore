@implementation TRIAllocationStatusCursor

- (TRIAllocationStatusCursor)initWithSecondsFromEpoch:(double)a3
{
  TRIAllocationStatusCursor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRIAllocationStatusCursor;
  result = -[TRIAllocationStatusCursor init](&v5, sel_init);
  if (result)
    result->_secondsFromEpoch = a3;
  return result;
}

- (NSDate)date
{
  return (NSDate *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", self->_secondsFromEpoch);
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (double *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_secondsFromEpoch);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4[1]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_secondsFromEpoch);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIAllocationStatusCursor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  TRIAllocationStatusCursor *v9;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = 0;
    +[TRIPBMessage parseFromData:error:](TRIPersistedAllocationStatusCursor, "parseFromData:error:", v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v6)
    {
      if (objc_msgSend(v6, "hasLowerBoundExclusive"))
      {
        objc_msgSend(v6, "lowerBoundExclusive");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSince1970");
        self = -[TRIAllocationStatusCursor initWithSecondsFromEpoch:](self, "initWithSecondsFromEpoch:");

        v9 = self;
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(v4, "failWithError:", v7);
    }
    v9 = 0;
    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0F50]), "initWithTimeIntervalSince1970:", self->_secondsFromEpoch);
  objc_msgSend(v5, "setLowerBoundExclusive:", v6);

  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("data"));

}

@end
