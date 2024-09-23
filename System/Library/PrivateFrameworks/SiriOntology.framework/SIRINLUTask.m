@implementation SIRINLUTask

- (SIRINLUTask)initWithTask:(id)a3 score:(double)a4
{
  id v7;
  SIRINLUTask *v8;
  SIRINLUTask *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUTask;
  v8 = -[SIRINLUTask init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_task, a3);
    v9->_score = a4;
  }

  return v9;
}

- (SIRINLUTask)initWithCoder:(id)a3
{
  id v4;
  SIRINLUTask *v5;
  uint64_t v6;
  USOSerializedGraph *task;
  void *v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUTask;
  v5 = -[SIRINLUTask init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("task"));
    v6 = objc_claimAutoreleasedReturnValue();
    task = v5->_task;
    v5->_task = (USOSerializedGraph *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("score"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_score = v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SIRINLUTask task](self, "task");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("task"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("score"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  -[USOSerializedGraph printedForm](self->_task, "printedForm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v3, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{Task\n  task:\n%@\n  score: %f\n}"), v4, *(_QWORD *)&self->_score);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (USOSerializedGraph)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
