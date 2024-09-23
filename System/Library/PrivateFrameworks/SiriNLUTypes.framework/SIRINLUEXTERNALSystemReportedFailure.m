@implementation SIRINLUEXTERNALSystemReportedFailure

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALSystemReportedFailure;
  -[SIRINLUEXTERNALSystemReportedFailure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALSystemReportedFailure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALUUID *taskId;
  void *v5;
  SIRINLUEXTERNALUsoGraph *reason;
  void *v7;
  SIRINLUEXTERNALUsoGraph *task;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  taskId = self->_taskId;
  if (taskId)
  {
    -[SIRINLUEXTERNALUUID dictionaryRepresentation](taskId, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("task_id"));

  }
  reason = self->_reason;
  if (reason)
  {
    -[SIRINLUEXTERNALUsoGraph dictionaryRepresentation](reason, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("reason"));

  }
  task = self->_task;
  if (task)
  {
    -[SIRINLUEXTERNALUsoGraph dictionaryRepresentation](task, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("task"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSystemReportedFailureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_taskId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_reason)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_task)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_taskId)
  {
    objc_msgSend(v4, "setTaskId:");
    v4 = v5;
  }
  if (self->_reason)
  {
    objc_msgSend(v5, "setReason:");
    v4 = v5;
  }
  if (self->_task)
  {
    objc_msgSend(v5, "setTask:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALUUID copyWithZone:](self->_taskId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[SIRINLUEXTERNALUsoGraph copyWithZone:](self->_reason, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[SIRINLUEXTERNALUsoGraph copyWithZone:](self->_task, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALUUID *taskId;
  SIRINLUEXTERNALUsoGraph *reason;
  SIRINLUEXTERNALUsoGraph *task;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((taskId = self->_taskId, !((unint64_t)taskId | v4[3]))
     || -[SIRINLUEXTERNALUUID isEqual:](taskId, "isEqual:"))
    && ((reason = self->_reason, !((unint64_t)reason | v4[1]))
     || -[SIRINLUEXTERNALUsoGraph isEqual:](reason, "isEqual:")))
  {
    task = self->_task;
    if ((unint64_t)task | v4[2])
      v8 = -[SIRINLUEXTERNALUsoGraph isEqual:](task, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SIRINLUEXTERNALUUID hash](self->_taskId, "hash");
  v4 = -[SIRINLUEXTERNALUsoGraph hash](self->_reason, "hash") ^ v3;
  return v4 ^ -[SIRINLUEXTERNALUsoGraph hash](self->_task, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALUUID *taskId;
  uint64_t v6;
  SIRINLUEXTERNALUsoGraph *reason;
  uint64_t v8;
  SIRINLUEXTERNALUsoGraph *task;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  taskId = self->_taskId;
  v6 = v4[3];
  v11 = v4;
  if (taskId)
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALUUID mergeFrom:](taskId, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SIRINLUEXTERNALSystemReportedFailure setTaskId:](self, "setTaskId:");
  }
  v4 = v11;
LABEL_7:
  reason = self->_reason;
  v8 = v4[1];
  if (reason)
  {
    if (!v8)
      goto LABEL_13;
    -[SIRINLUEXTERNALUsoGraph mergeFrom:](reason, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[SIRINLUEXTERNALSystemReportedFailure setReason:](self, "setReason:");
  }
  v4 = v11;
LABEL_13:
  task = self->_task;
  v10 = v4[2];
  if (task)
  {
    if (v10)
    {
      -[SIRINLUEXTERNALUsoGraph mergeFrom:](task, "mergeFrom:");
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[SIRINLUEXTERNALSystemReportedFailure setTask:](self, "setTask:");
    goto LABEL_18;
  }

}

- (SIRINLUEXTERNALUUID)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(id)a3
{
  objc_storeStrong((id *)&self->_taskId, a3);
}

- (SIRINLUEXTERNALUsoGraph)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (SIRINLUEXTERNALUsoGraph)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
