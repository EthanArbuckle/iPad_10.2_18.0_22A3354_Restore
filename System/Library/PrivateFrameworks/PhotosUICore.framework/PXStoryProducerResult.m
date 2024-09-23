@implementation PXStoryProducerResult

- (PXStoryProducerResult)init
{
  PXStoryProducerResult *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryProducerResult;
  result = -[PXStoryProducerResult init](&v3, sel_init);
  if (result)
    result->_productionDuration = NAN;
  return result;
}

- (PXStoryProducerResult)initWithObject:(id)a3
{
  id v5;
  PXStoryProducerResult *v6;
  PXStoryProducerResult *v7;

  v5 = a3;
  v6 = -[PXStoryProducerResult init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_object, a3);

  return v7;
}

- (id)flags:(unint64_t)a3
{
  *((_QWORD *)self + 2) = a3;
  return self;
}

- (id)fractionCompleted:(float)a3
{
  NSNumber *v4;
  NSNumber *fractionCompleted;

  if (a3 < 1.0)
    self->_flags |= 1uLL;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fractionCompleted = self->_fractionCompleted;
  self->_fractionCompleted = v4;

  return self;
}

- (id)error:(id)a3
{
  NSError *v5;
  NSObject *v6;
  int v8;
  NSError *v9;
  __int16 v10;
  PXStoryProducerResult *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    objc_storeStrong((id *)&self->_error, a3);
    PLStoryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = self;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Producer result error: %@ %@", (uint8_t *)&v8, 0x16u);
    }

  }
  return self;
}

- (id)deliveredNowWithRequestTime:(double)a3
{
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_productionDuration = v5 - a3;
  return self;
}

- (BOOL)isDegraded
{
  return -[PXStoryProducerResult flags](self, "flags") & 1;
}

- (id)description
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  v5 = -[PXStoryProducerResult flags](self, "flags");
  -[PXStoryProducerResult object](self, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryProducerResult error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; flags: 0x%lX; object: %@, error: %@>"),
                 v4,
                 self,
                 v5,
                 v6,
                 v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryProducerResult *v4;
  PXStoryProducerResult *v5;
  id v6;
  id v7;
  int v8;
  BOOL v9;
  unint64_t v10;
  id v11;
  id v12;
  int v13;
  double v14;
  double v15;
  double v16;

  v4 = (PXStoryProducerResult *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStoryProducerResult object](self, "object");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryProducerResult object](v5, "object");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
          goto LABEL_13;
      }
      v10 = -[PXStoryProducerResult flags](self, "flags");
      if (v10 != -[PXStoryProducerResult flags](v5, "flags"))
      {
LABEL_13:
        v9 = 0;
LABEL_17:

        goto LABEL_18;
      }
      -[PXStoryProducerResult error](self, "error");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryProducerResult error](v5, "error");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {

      }
      else
      {
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
        {
          v9 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      -[PXStoryProducerResult productionDuration](self, "productionDuration");
      v15 = v14;
      -[PXStoryProducerResult productionDuration](v5, "productionDuration");
      v9 = v15 == v16;
      goto LABEL_16;
    }
    v9 = 0;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  -[PXStoryProducerResult object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[PXStoryProducerResult flags](self, "flags") ^ v4;
  -[PXStoryProducerResult error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (id)object
{
  return self->_object;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSNumber)fractionCompleted
{
  return self->_fractionCompleted;
}

- (NSError)error
{
  return self->_error;
}

- (double)productionDuration
{
  return self->_productionDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fractionCompleted, 0);
  objc_storeStrong(&self->_object, 0);
}

+ (PXStoryProducerResult)nullResult
{
  return objc_alloc_init(PXStoryProducerResult);
}

@end
