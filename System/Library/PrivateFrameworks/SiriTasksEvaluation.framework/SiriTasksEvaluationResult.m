@implementation SiriTasksEvaluationResult

- (SiriTasksEvaluationResult)initWithTaskId:(id)a3 isEffectiveTask:(BOOL)a4 isSuccessfulTask:(BOOL)a5
{
  id v9;
  SiriTasksEvaluationResult *v10;
  SiriTasksEvaluationResult *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SiriTasksEvaluationResult;
  v10 = -[SiriTasksEvaluationResult init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_taskId, a3);
    v11->_isEffectiveTask = a4;
    v11->_isSuccessfulTask = a5;
  }

  return v11;
}

- (SiriTasksEvaluationResult)initWithJSONData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SiriTasksEvaluationResult *v7;
  uint64_t v9;
  id v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = v5;
  if (!v4)
  {
    NSLog(CFSTR("Error deserializing the json: %@"), v5);
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = objc_opt_class();
    NSLog(CFSTR("Got an invalid json object: %@"), v9);
    goto LABEL_6;
  }
  self = -[SiriTasksEvaluationResult initWithDictionary:](self, "initWithDictionary:", v4);
  v7 = self;
LABEL_7:

  return v7;
}

- (SiriTasksEvaluationResult)initWithDictionary:(id)a3
{
  id v4;
  SiriTasksEvaluationResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SiriTasksEvaluationResult *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriTasksEvaluationResult;
  v5 = -[SiriTasksEvaluationResult init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SiriTasksEvaluationResult setTaskId:](v5, "setTaskId:", v7);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEffectiveTask"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[SiriTasksEvaluationResult setIsEffectiveTask:](v5, "setIsEffectiveTask:", objc_msgSend(v8, "BOOLValue"));
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSuccessfulTask"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          -[SiriTasksEvaluationResult setIsSuccessfulTask:](v5, "setIsSuccessfulTask:", objc_msgSend(v9, "BOOLValue"));
          v10 = v5;
        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)toJSON
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v11[0] = self->_taskId;
  v10[0] = CFSTR("taskId");
  v10[1] = CFSTR("isEffectiveTask");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEffectiveTask);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = CFSTR("isSuccessfulTask");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSuccessfulTask);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 0, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);

  return v7;
}

- (NSString)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(id)a3
{
  objc_storeStrong((id *)&self->_taskId, a3);
}

- (BOOL)isEffectiveTask
{
  return self->_isEffectiveTask;
}

- (void)setIsEffectiveTask:(BOOL)a3
{
  self->_isEffectiveTask = a3;
}

- (BOOL)isSuccessfulTask
{
  return self->_isSuccessfulTask;
}

- (void)setIsSuccessfulTask:(BOOL)a3
{
  self->_isSuccessfulTask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskId, 0);
}

@end
