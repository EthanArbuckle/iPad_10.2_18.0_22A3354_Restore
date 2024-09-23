@implementation SIRINLUUserStatedTask

- (SIRINLUUserStatedTask)initWithTask:(id)a3
{
  id v5;
  SIRINLUUserStatedTask *v6;
  SIRINLUUserStatedTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUUserStatedTask;
  v6 = -[SIRINLUUserStatedTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_task, a3);
    objc_storeStrong((id *)&v7->_goal, a3);
  }

  return v7;
}

- (SIRINLUUserStatedTask)initWithGoal:(id)a3
{
  id v5;
  SIRINLUUserStatedTask *v6;
  SIRINLUUserStatedTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUUserStatedTask;
  v6 = -[SIRINLUUserStatedTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_task, a3);
    objc_storeStrong((id *)&v7->_goal, a3);
  }

  return v7;
}

- (SIRINLUUserStatedTask)initWithCoder:(id)a3
{
  id v4;
  SIRINLUUserStatedTask *v5;
  uint64_t v6;
  USOSerializedGraph *task;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUUserStatedTask;
  v5 = -[SIRINLUUserStatedTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("task"));
    v6 = objc_claimAutoreleasedReturnValue();
    task = v5->_task;
    v5->_task = (USOSerializedGraph *)v6;

    objc_storeStrong((id *)&v5->_goal, v5->_task);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SIRINLUUserStatedTask task](self, "task");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("task"));

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SIRINLUUserStatedTask task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printedForm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v3, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{UserStatedTask\n  task:\n%@\n}"), v4);
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

- (USOSerializedGraph)goal
{
  return self->_goal;
}

- (void)setGoal:(id)a3
{
  objc_storeStrong((id *)&self->_goal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
