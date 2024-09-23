@implementation SUOperationProgress

- (SUOperationProgress)initWithCoder:(id)a3
{
  id v4;
  SUOperationProgress *v5;
  void *v6;

  v4 = a3;
  v5 = -[SUOperationProgress init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phase"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUOperationProgress setPhase:](v5, "setPhase:", v6);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("percentComplete"));
    -[SUOperationProgress setPercentComplete:](v5, "setPercentComplete:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("normalizedPercentComplete"));
    -[SUOperationProgress setNormalizedPercentComplete:](v5, "setNormalizedPercentComplete:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeRemaining"));
    -[SUOperationProgress setTimeRemaining:](v5, "setTimeRemaining:");
    -[SUOperationProgress setIsDone:](v5, "setIsDone:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDone")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SUOperationProgress phase](self, "phase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("phase"));

  -[SUOperationProgress percentComplete](self, "percentComplete");
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("percentComplete"));
  -[SUOperationProgress normalizedPercentComplete](self, "normalizedPercentComplete");
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("normalizedPercentComplete"));
  -[SUOperationProgress timeRemaining](self, "timeRemaining");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timeRemaining"));
  objc_msgSend(v5, "encodeBool:forKey:", -[SUOperationProgress isDone](self, "isDone"), CFSTR("isDone"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SUOperationProgress phase](self, "phase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhase:", v5);

  -[SUOperationProgress percentComplete](self, "percentComplete");
  objc_msgSend(v4, "setPercentComplete:");
  -[SUOperationProgress normalizedPercentComplete](self, "normalizedPercentComplete");
  objc_msgSend(v4, "setNormalizedPercentComplete:");
  -[SUOperationProgress timeRemaining](self, "timeRemaining");
  objc_msgSend(v4, "setTimeRemaining:");
  objc_msgSend(v4, "setIsDone:", -[SUOperationProgress isDone](self, "isDone"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUOperationProgress phase](self, "phase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16F0];
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[SUOperationProgress percentComplete](self, "percentComplete");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringFromNumber:numberStyle:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16F0];
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[SUOperationProgress normalizedPercentComplete](self, "normalizedPercentComplete");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringFromNumber:numberStyle:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD16F0];
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[SUOperationProgress timeRemaining](self, "timeRemaining");
  *(float *)&v15 = v15;
  objc_msgSend(v14, "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringFromNumber:numberStyle:", v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n            \tPhase: %@\n            \tPercentComplete: %@\n            \tNormalizedPercentComplete: %@\n            \tTimeRemaining: %@"), v4, v8, v12, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSString)phase
{
  return self->_phase;
}

- (void)setPhase:(id)a3
{
  objc_storeStrong((id *)&self->_phase, a3);
}

- (float)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(float)a3
{
  self->_percentComplete = a3;
}

- (float)normalizedPercentComplete
{
  return self->_normalizedPercentComplete;
}

- (void)setNormalizedPercentComplete:(float)a3
{
  self->_normalizedPercentComplete = a3;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phase, 0);
}

@end
