@implementation SIRINLUSystemReportedFailure

- (SIRINLUSystemReportedFailure)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SIRINLUSystemReportedFailure;
  return -[SIRINLUSystemReportedFailure init](&v3, sel_init);
}

- (SIRINLUSystemReportedFailure)initWithTaskId:(id)a3 reason:(id)a4 task:(id)a5
{
  id v9;
  id v10;
  id v11;
  SIRINLUSystemReportedFailure *v12;
  SIRINLUSystemReportedFailure *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLUSystemReportedFailure;
  v12 = -[SIRINLUSystemReportedFailure init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_taskId, a3);
    objc_storeStrong((id *)&v13->_reason, a4);
    objc_storeStrong((id *)&v13->_task, a5);
  }

  return v13;
}

- (SIRINLUSystemReportedFailure)initWithCoder:(id)a3
{
  id v4;
  SIRINLUSystemReportedFailure *v5;
  uint64_t v6;
  NSUUID *taskId;
  uint64_t v8;
  USOSerializedGraph *reason;
  uint64_t v10;
  USOSerializedGraph *task;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SIRINLUSystemReportedFailure;
  v5 = -[SIRINLUSystemReportedFailure init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("taskId"));
    v6 = objc_claimAutoreleasedReturnValue();
    taskId = v5->_taskId;
    v5->_taskId = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v8 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (USOSerializedGraph *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("task"));
    v10 = objc_claimAutoreleasedReturnValue();
    task = v5->_task;
    v5->_task = (USOSerializedGraph *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SIRINLUSystemReportedFailure taskId](self, "taskId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("taskId"));

  -[SIRINLUSystemReportedFailure reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("reason"));

  -[SIRINLUSystemReportedFailure task](self, "task");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("task"));

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

  -[SIRINLUSystemReportedFailure reason](self, "reason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printedForm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SIRINLUSystemReportedFailure task](self, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "printedForm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v7, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUSystemReportedFailure taskId](self, "taskId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("{SystemReportedFailure\n  taskId: %@\n  reason:\n%@\n  task:\n%@\n}"), v10, v5, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)renderedText
{
  return self->renderedText;
}

- (void)setRenderedText:(id)a3
{
  objc_storeStrong((id *)&self->renderedText, a3);
}

- (NSUUID)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(id)a3
{
  objc_storeStrong((id *)&self->_taskId, a3);
}

- (USOSerializedGraph)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (USOSerializedGraph)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->renderedText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
