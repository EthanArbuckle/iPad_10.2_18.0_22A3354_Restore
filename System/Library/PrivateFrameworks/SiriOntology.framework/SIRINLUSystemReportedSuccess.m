@implementation SIRINLUSystemReportedSuccess

- (SIRINLUSystemReportedSuccess)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SIRINLUSystemReportedSuccess;
  return -[SIRINLUSystemReportedSuccess init](&v3, sel_init);
}

- (SIRINLUSystemReportedSuccess)initWithTaskId:(id)a3 task:(id)a4
{
  id v7;
  id v8;
  SIRINLUSystemReportedSuccess *v9;
  SIRINLUSystemReportedSuccess *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SIRINLUSystemReportedSuccess;
  v9 = -[SIRINLUSystemReportedSuccess init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_taskId, a3);
    objc_storeStrong((id *)&v10->_task, a4);
  }

  return v10;
}

- (SIRINLUSystemReportedSuccess)initWithCoder:(id)a3
{
  id v4;
  SIRINLUSystemReportedSuccess *v5;
  uint64_t v6;
  NSUUID *taskId;
  uint64_t v8;
  USOSerializedGraph *task;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUSystemReportedSuccess;
  v5 = -[SIRINLUSystemReportedSuccess init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("taskId"));
    v6 = objc_claimAutoreleasedReturnValue();
    taskId = v5->_taskId;
    v5->_taskId = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("task"));
    v8 = objc_claimAutoreleasedReturnValue();
    task = v5->_task;
    v5->_task = (USOSerializedGraph *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SIRINLUSystemReportedSuccess taskId](self, "taskId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("taskId"));

  -[SIRINLUSystemReportedSuccess task](self, "task");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("task"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SIRINLUSystemReportedSuccess task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printedForm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUSystemReportedSuccess taskId](self, "taskId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("{SystemReportedSuccess\n  taskId: %@\n  task:\n%@\n}"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->renderedText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
