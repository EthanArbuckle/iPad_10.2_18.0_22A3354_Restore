@implementation SUControllerProgress

- (SUControllerProgress)init
{
  SUControllerProgress *v2;
  uint64_t v3;
  NSString *phase;
  NSString *actionText;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUControllerProgress;
  v2 = -[SUControllerProgress init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@"), CFSTR("None"));
    phase = v2->_phase;
    v2->_phase = (NSString *)v3;

    v2->_portionComplete = -1.0;
    v2->_isDone = 0;
    actionText = v2->_actionText;
    v2->_estimatedTimeRemaining = -1.0;
    v2->_actionText = 0;

    v2->_isStalled = 0;
  }
  return v2;
}

- (SUControllerProgress)initWithPhase:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6
{
  id v10;
  SUControllerProgress *v11;
  uint64_t v12;
  NSString *phase;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUControllerProgress;
  v11 = -[SUControllerProgress init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@"), v10);
    phase = v11->_phase;
    v11->_phase = (NSString *)v12;

    v11->_portionComplete = a4;
    v11->_estimatedTimeRemaining = a5;
    v11->_isDone = a6;
  }

  return v11;
}

- (SUControllerProgress)initWithCoder:(id)a3
{
  id v4;
  SUControllerProgress *v5;
  uint64_t v6;
  NSString *phase;
  float v8;
  float v9;
  uint64_t v10;
  NSString *actionText;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUControllerProgress;
  v5 = -[SUControllerProgress init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phase"));
    v6 = objc_claimAutoreleasedReturnValue();
    phase = v5->_phase;
    v5->_phase = (NSString *)v6;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("portionComplete"));
    v5->_portionComplete = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("estimatedTimeRemaining"));
    v5->_estimatedTimeRemaining = v9;
    v5->_isDone = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDone"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionText"));
    v10 = objc_claimAutoreleasedReturnValue();
    actionText = v5->_actionText;
    v5->_actionText = (NSString *)v10;

    v5->_isStalled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isStalled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SUControllerProgress phase](self, "phase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("phase"));

  -[SUControllerProgress portionComplete](self, "portionComplete");
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("portionComplete"));
  -[SUControllerProgress estimatedTimeRemaining](self, "estimatedTimeRemaining");
  *(float *)&v5 = v5;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("estimatedTimeRemaining"), v5);
  objc_msgSend(v7, "encodeBool:forKey:", -[SUControllerProgress isDone](self, "isDone"), CFSTR("isDone"));
  -[SUControllerProgress actionText](self, "actionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("actionText"));

  objc_msgSend(v7, "encodeBool:forKey:", -[SUControllerProgress isStalled](self, "isStalled"), CFSTR("isStalled"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  int v12;
  float v13;
  double v14;
  int v15;

  v6 = a6;
  v10 = a3;
  -[SUControllerProgress phase](self, "phase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12
    && (-[SUControllerProgress portionComplete](self, "portionComplete"), v13 == a4)
    && (-[SUControllerProgress estimatedTimeRemaining](self, "estimatedTimeRemaining"), v14 == a5))
  {
    v15 = -[SUControllerProgress isDone](self, "isDone") ^ v6 ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6 actionText:(id)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  int v15;
  float v16;
  double v17;
  char v18;

  v7 = a6;
  v12 = a7;
  v13 = a3;
  -[SUControllerProgress phase](self, "phase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (v15
    && (-[SUControllerProgress portionComplete](self, "portionComplete"), v16 == a4)
    && (-[SUControllerProgress estimatedTimeRemaining](self, "estimatedTimeRemaining"), v17 == a5)
    && -[SUControllerProgress isDone](self, "isDone") == v7)
  {
    v18 = objc_msgSend(v12, "isEqualToString:", v12);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)sameProgress:(id)a3 portion:(float)a4 remaining:(double)a5 isDone:(BOOL)a6 actionText:(id)a7 isStalled:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v14;
  id v15;
  void *v16;
  int v17;
  float v18;
  double v19;
  char v20;

  v8 = a8;
  v9 = a6;
  v14 = a7;
  v15 = a3;
  -[SUControllerProgress phase](self, "phase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if (v17
    && (-[SUControllerProgress portionComplete](self, "portionComplete"), v18 == a4)
    && (-[SUControllerProgress estimatedTimeRemaining](self, "estimatedTimeRemaining"), v19 == a5)
    && -[SUControllerProgress isDone](self, "isDone") == v9
    && -[SUControllerProgress isStalled](self, "isStalled") == v8)
  {
    v20 = objc_msgSend(v14, "isEqualToString:", v14);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)copy
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SUControllerProgress *v4;
  SUControllerProgress *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  _BOOL4 v15;
  char v16;
  void *v18;
  void *v19;

  v4 = (SUControllerProgress *)a3;
  if (v4 == self)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SUControllerProgress phase](v5, "phase");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUControllerProgress phase](self, "phase");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isEqualToString:", v7))
        goto LABEL_8;
      -[SUControllerProgress portionComplete](v5, "portionComplete");
      v9 = v8;
      -[SUControllerProgress portionComplete](self, "portionComplete");
      if (v9 != v10)
        goto LABEL_8;
      -[SUControllerProgress estimatedTimeRemaining](v5, "estimatedTimeRemaining");
      v12 = v11;
      -[SUControllerProgress estimatedTimeRemaining](self, "estimatedTimeRemaining");
      if (v12 == v13
        && (v14 = -[SUControllerProgress isDone](v5, "isDone"), v14 == -[SUControllerProgress isDone](self, "isDone"))
        && (v15 = -[SUControllerProgress isStalled](v5, "isStalled"),
            v15 == -[SUControllerProgress isStalled](self, "isStalled")))
      {
        -[SUControllerProgress actionText](v5, "actionText");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUControllerProgress actionText](self, "actionText");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v18, "isEqualToString:", v19);

      }
      else
      {
LABEL_8:
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  -[SUControllerProgress actionText](self, "actionText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[SUControllerProgress phase](self, "phase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUControllerProgress portionComplete](self, "portionComplete");
  v7 = v6;
  -[SUControllerProgress estimatedTimeRemaining](self, "estimatedTimeRemaining");
  v9 = v8;
  v10 = CFSTR("NO");
  if (-[SUControllerProgress isDone](self, "isDone"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[SUControllerProgress isStalled](self, "isStalled"))
    v10 = CFSTR("YES");
  if (v3)
  {
    -[SUControllerProgress actionText](self, "actionText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Phase: %@\nPortion complete: %f\nEstimated time remaining: %f\nIs done: %@\nIs stalled: %@\nActionText: %@"), v5, *(_QWORD *)&v7, v9, v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Phase: %@\nPortion complete: %f\nEstimated time remaining: %f\nIs done: %@\nIs stalled: %@"), v5, *(_QWORD *)&v7, v9, v11, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

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

- (float)portionComplete
{
  return self->_portionComplete;
}

- (void)setPortionComplete:(float)a3
{
  self->_portionComplete = a3;
}

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (void)setEstimatedTimeRemaining:(double)a3
{
  self->_estimatedTimeRemaining = a3;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (NSString)actionText
{
  return self->_actionText;
}

- (void)setActionText:(id)a3
{
  objc_storeStrong((id *)&self->_actionText, a3);
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (void)setIsStalled:(BOOL)a3
{
  self->_isStalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionText, 0);
  objc_storeStrong((id *)&self->_phase, 0);
}

@end
