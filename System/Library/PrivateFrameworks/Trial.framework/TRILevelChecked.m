@implementation TRILevelChecked

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapped, 0);
}

- (id)directoryValue
{
  int v4;
  void *v6;
  void *v7;

  v4 = -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase");
  if (v4 == 101 || v4 == 0)
  {
    -[TRILevel directoryValue](self->_wrapped, "directoryValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRILevelChecked.m"), 154, CFSTR("requested directoryValue, but TRILevel contained type (%u) is not Directory"), -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase"));

    v7 = 0;
  }
  return v7;
}

+ (id)wrapLevel:(id)a3
{
  id v5;
  TRILevelChecked *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRILevelChecked.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("level"));

  }
  v6 = -[TRILevelChecked initWithLevel:]([TRILevelChecked alloc], "initWithLevel:", v5);

  return v6;
}

- (TRILevelChecked)initWithLevel:(id)a3
{
  id v5;
  TRILevelChecked *v6;
  TRILevelChecked *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRILevelChecked;
  v6 = -[TRILevelChecked init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrapped, a3);

  return v7;
}

- (id)fileValue
{
  int v4;
  void *v6;
  void *v7;

  v4 = -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase");
  if (v4 == 100 || v4 == 0)
  {
    -[TRILevel fileValue](self->_wrapped, "fileValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRILevelChecked.m"), 141, CFSTR("requested fileValue, but TRILevel contained type (%u) is not File"), -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase"));

    v7 = 0;
  }
  return v7;
}

- (BOOL)BOOLeanValue
{
  int v4;
  void *v6;

  v4 = -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase");
  if (v4 == 10 || v4 == 0)
    return -[TRILevel BOOLeanValue](self->_wrapped, "BOOLeanValue");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRILevelChecked.m"), 50, CFSTR("requested BOOLeanValue, but TRILevel contained type (%u) is not Boolean"), -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase"));

  return 0;
}

- (int64_t)longValue
{
  int v4;
  void *v6;

  v4 = -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase");
  if (v4 == 13 || v4 == 0)
    return -[TRILevel longValue](self->_wrapped, "longValue");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRILevelChecked.m"), 89, CFSTR("requested longValue, but TRILevel contained type (%u) is not Long"), -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase"));

  return 0;
}

- (id)stringValue
{
  int v4;
  void *v6;
  void *v7;

  v4 = -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase");
  if (v4 == 11 || v4 == 0)
  {
    -[TRILevel stringValue](self->_wrapped, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRILevelChecked.m"), 63, CFSTR("requested stringValue, but TRILevel contained type (%u) is not String"), -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase"));

    v7 = 0;
  }
  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_wrapped;
}

- (int)intValue
{
  int v4;
  void *v6;

  v4 = -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase");
  if (v4 == 12 || v4 == 0)
    return -[TRILevel intValue](self->_wrapped, "intValue");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRILevelChecked.m"), 76, CFSTR("requested intValue, but TRILevel contained type (%u) is not Int"), -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase"));

  return 0;
}

- (float)floatValue
{
  int v4;
  void *v6;
  float result;

  v4 = -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase");
  if (v4 == 14 || v4 == 0)
  {
    -[TRILevel floatValue](self->_wrapped, "floatValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRILevelChecked.m"), 102, CFSTR("requested floatValue, but TRILevel contained type (%u) is not Float"), -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase"));

    return 0.0;
  }
  return result;
}

- (double)doubleValue
{
  int v4;
  void *v6;
  double result;

  v4 = -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase");
  if (v4 == 15 || v4 == 0)
  {
    -[TRILevel doubleValue](self->_wrapped, "doubleValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRILevelChecked.m"), 115, CFSTR("requested doubleValue, but TRILevel contained type (%u) is not Double"), -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase"));

    return 0.0;
  }
  return result;
}

- (id)binaryValue
{
  void *v4;
  void *v5;

  if ((-[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase") | 0x10) == 0x10)
  {
    -[TRILevel binaryValue](self->_wrapped, "binaryValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRILevelChecked.m"), 128, CFSTR("requested binaryValue, but TRILevel contained type (%u) is not Binary"), -[TRILevel levelOneOfCase](self->_wrapped, "levelOneOfCase"));

    v4 = 0;
  }
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[TRILevel description](self->_wrapped, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[TRILevelChecked] %@"), v4);

  return v5;
}

@end
