@implementation SUCoreProgress

- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 remaining:(double)a6
{
  return -[SUCoreProgress initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:](self, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:", a3, a4, 0, 0, 0, 0);
}

- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 remaining:(double)a6 actionText:(id)a7
{
  return -[SUCoreProgress initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:](self, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:", a3, a4, 0, 0, a7, 0);
}

- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 totalWrittenBytes:(int64_t)a6 totalExpectedBytes:(int64_t)a7 remaining:(double)a8
{
  return -[SUCoreProgress initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:](self, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:", a3, a4, a6, a7, 0, 0);
}

- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 totalWrittenBytes:(int64_t)a6 totalExpectedBytes:(int64_t)a7 remaining:(double)a8 taskDescription:(id)a9
{
  return -[SUCoreProgress initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:](self, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:actionText:taskDescription:", a3, a4, a6, a7, 0, a9);
}

- (SUCoreProgress)initWithPhase:(id)a3 isStalled:(BOOL)a4 portionComplete:(float)a5 totalWrittenBytes:(int64_t)a6 totalExpectedBytes:(int64_t)a7 remaining:(double)a8 actionText:(id)a9 taskDescription:(id)a10
{
  id v19;
  id v20;
  id v21;
  SUCoreProgress *v22;
  SUCoreProgress *v23;
  objc_super v25;

  v19 = a3;
  v20 = a9;
  v21 = a10;
  v25.receiver = self;
  v25.super_class = (Class)SUCoreProgress;
  v22 = -[SUCoreProgress init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_phase, a3);
    v23->_isStalled = a4;
    v23->_portionComplete = a5;
    v23->_totalWrittenBytes = a6;
    v23->_totalExpectedBytes = a7;
    v23->_estimatedTimeRemaining = a8;
    objc_storeStrong((id *)&v23->_actionText, a9);
    v23->_disableVerboseLogging = 0;
    objc_storeStrong((id *)&v23->_taskDescription, a10);
  }

  return v23;
}

- (SUCoreProgress)initWithCoder:(id)a3
{
  id v4;
  SUCoreProgress *v5;
  uint64_t v6;
  NSString *phase;
  float v8;
  float v9;
  uint64_t v10;
  NSString *actionText;
  uint64_t v12;
  NSString *taskDescription;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUCoreProgress;
  v5 = -[SUCoreProgress init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phase"));
    v6 = objc_claimAutoreleasedReturnValue();
    phase = v5->_phase;
    v5->_phase = (NSString *)v6;

    v5->_isStalled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isStalled"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("portionComplete"));
    v5->_portionComplete = v8;
    v5->_totalWrittenBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalWrittenBytes"));
    v5->_totalExpectedBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalExpectedBytes"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("estimatedTimeRemaining"));
    v5->_estimatedTimeRemaining = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionText"));
    v10 = objc_claimAutoreleasedReturnValue();
    actionText = v5->_actionText;
    v5->_actionText = (NSString *)v10;

    v5->_disableVerboseLogging = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableVerboseLogging"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("taskDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    taskDescription = v5->_taskDescription;
    v5->_taskDescription = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SUCoreProgress phase](self, "phase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("phase"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SUCoreProgress isStalled](self, "isStalled"), CFSTR("isStalled"));
  -[SUCoreProgress portionComplete](self, "portionComplete");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("portionComplete"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCoreProgress totalWrittenBytes](self, "totalWrittenBytes"), CFSTR("totalWrittenBytes"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCoreProgress totalExpectedBytes](self, "totalExpectedBytes"), CFSTR("totalExpectedBytes"));
  -[SUCoreProgress estimatedTimeRemaining](self, "estimatedTimeRemaining");
  *(float *)&v6 = v6;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("estimatedTimeRemaining"), v6);
  -[SUCoreProgress actionText](self, "actionText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("actionText"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SUCoreProgress disableVerboseLogging](self, "disableVerboseLogging"), CFSTR("disableVerboseLogging"));
  -[SUCoreProgress taskDescription](self, "taskDescription");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("taskDescription"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)sameProgress:(id)a3 isStalled:(BOOL)a4 portion:(float)a5 remaining:(double)a6
{
  _BOOL4 v8;
  id v10;
  void *v11;
  _BOOL4 v12;
  float v13;
  double v14;
  BOOL v15;

  v8 = a4;
  v10 = a3;
  -[SUCoreProgress phase](self, "phase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v10, v11);

  if (v12
    && -[SUCoreProgress isStalled](self, "isStalled") == v8
    && (-[SUCoreProgress portionComplete](self, "portionComplete"), v13 == a5))
  {
    -[SUCoreProgress estimatedTimeRemaining](self, "estimatedTimeRemaining");
    v15 = v14 == a6;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)sameProgress:(id)a3 isStalled:(BOOL)a4 portion:(float)a5 remaining:(double)a6 actionText:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  float v16;
  double v17;
  void *v18;
  BOOL v19;

  v9 = a4;
  v12 = a7;
  v13 = a3;
  -[SUCoreProgress phase](self, "phase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v13, v14);

  if (v15
    && -[SUCoreProgress isStalled](self, "isStalled") == v9
    && (-[SUCoreProgress portionComplete](self, "portionComplete"), v16 == a5)
    && (-[SUCoreProgress estimatedTimeRemaining](self, "estimatedTimeRemaining"), v17 == a6))
  {
    -[SUCoreProgress actionText](self, "actionText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v12, v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)copy
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SUCoreProgress *v4;
  SUCoreProgress *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;

  v4 = (SUCoreProgress *)a3;
  if (v4 == self)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SUCoreProgress phase](self, "phase");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreProgress phase](v5, "phase");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!+[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v6, v7))
        goto LABEL_13;
      v8 = -[SUCoreProgress isStalled](v5, "isStalled");
      if (v8 != -[SUCoreProgress isStalled](self, "isStalled"))
        goto LABEL_13;
      -[SUCoreProgress portionComplete](v5, "portionComplete");
      v10 = v9;
      -[SUCoreProgress portionComplete](self, "portionComplete");
      if (v10 != v11)
        goto LABEL_13;
      v12 = -[SUCoreProgress totalWrittenBytes](v5, "totalWrittenBytes");
      if (v12 == -[SUCoreProgress totalWrittenBytes](self, "totalWrittenBytes")
        && (v13 = -[SUCoreProgress totalExpectedBytes](v5, "totalExpectedBytes"),
            v13 == -[SUCoreProgress totalExpectedBytes](self, "totalExpectedBytes"))
        && (-[SUCoreProgress estimatedTimeRemaining](v5, "estimatedTimeRemaining"),
            v15 = v14,
            -[SUCoreProgress estimatedTimeRemaining](self, "estimatedTimeRemaining"),
            v15 == v16))
      {
        -[SUCoreProgress actionText](self, "actionText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreProgress actionText](v5, "actionText");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v17, v18))
        {
          -[SUCoreProgress taskDescription](self, "taskDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCoreProgress taskDescription](v5, "taskDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = +[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v19, v20);

        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
LABEL_13:
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (id)description
{
  id v3;
  void *v4;
  const __CFString *v5;
  float v6;
  double v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreProgress phase](self, "phase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreProgress isStalled](self, "isStalled"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[SUCoreProgress portionComplete](self, "portionComplete");
  v7 = v6;
  v8 = -[SUCoreProgress totalWrittenBytes](self, "totalWrittenBytes");
  v9 = -[SUCoreProgress totalExpectedBytes](self, "totalExpectedBytes");
  -[SUCoreProgress estimatedTimeRemaining](self, "estimatedTimeRemaining");
  v11 = v10;
  -[SUCoreProgress actionText](self, "actionText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreProgress disableVerboseLogging](self, "disableVerboseLogging"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  -[SUCoreProgress taskDescription](self, "taskDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[SUCoreProgress taskDescription](self, "taskDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("phase:%@ stalled:%@ portionComplete:%f totalWrittenBytes:%lld totalExpectedBytes:%lld estimatedTimeRemaining:%f actionText:%@ disableVerboseLogging:%@ CFNetworkTask:%@"), v4, v5, *(_QWORD *)&v7, v8, v9, v11, v12, v13, v15);

  }
  else
  {
    v16 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("phase:%@ stalled:%@ portionComplete:%f totalWrittenBytes:%lld totalExpectedBytes:%lld estimatedTimeRemaining:%f actionText:%@ disableVerboseLogging:%@ CFNetworkTask:%@"), v4, v5, *(_QWORD *)&v7, v8, v9, v11, v12, v13, CFSTR("NO"));
  }

  return v16;
}

- (id)summary
{
  __CFString *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  float v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  if (-[SUCoreProgress totalWrittenBytes](self, "totalWrittenBytes")
    || -[SUCoreProgress totalExpectedBytes](self, "totalExpectedBytes"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("totalWrittenBytes:%lld totalExpectedBytes:%lld "), -[SUCoreProgress totalWrittenBytes](self, "totalWrittenBytes"), -[SUCoreProgress totalExpectedBytes](self, "totalExpectedBytes"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E611E1C8;
  }
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreProgress phase](self, "phase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreProgress isStalled](self, "isStalled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[SUCoreProgress portionComplete](self, "portionComplete");
  v8 = v7;
  -[SUCoreProgress estimatedTimeRemaining](self, "estimatedTimeRemaining");
  v10 = v9;
  -[SUCoreProgress taskDescription](self, "taskDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreProgress actionText](self, "actionText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("phase:%@ stalled:%@ portionComplete:%f %@estimatedTimeRemaining:%f task:%@ actionText:%@"), v5, v6, *(_QWORD *)&v8, v3, v10, v11, v12);

  return v13;
}

- (NSString)phase
{
  return self->_phase;
}

- (void)setPhase:(id)a3
{
  objc_storeStrong((id *)&self->_phase, a3);
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (void)setIsStalled:(BOOL)a3
{
  self->_isStalled = a3;
}

- (float)portionComplete
{
  return self->_portionComplete;
}

- (void)setPortionComplete:(float)a3
{
  self->_portionComplete = a3;
}

- (int64_t)totalWrittenBytes
{
  return self->_totalWrittenBytes;
}

- (void)setTotalWrittenBytes:(int64_t)a3
{
  self->_totalWrittenBytes = a3;
}

- (int64_t)totalExpectedBytes
{
  return self->_totalExpectedBytes;
}

- (void)setTotalExpectedBytes:(int64_t)a3
{
  self->_totalExpectedBytes = a3;
}

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (void)setEstimatedTimeRemaining:(double)a3
{
  self->_estimatedTimeRemaining = a3;
}

- (NSString)actionText
{
  return self->_actionText;
}

- (void)setActionText:(id)a3
{
  objc_storeStrong((id *)&self->_actionText, a3);
}

- (BOOL)disableVerboseLogging
{
  return self->_disableVerboseLogging;
}

- (void)setDisableVerboseLogging:(BOOL)a3
{
  self->_disableVerboseLogging = a3;
}

- (NSString)taskDescription
{
  return self->_taskDescription;
}

- (void)setTaskDescription:(id)a3
{
  objc_storeStrong((id *)&self->_taskDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskDescription, 0);
  objc_storeStrong((id *)&self->_actionText, 0);
  objc_storeStrong((id *)&self->_phase, 0);
}

@end
