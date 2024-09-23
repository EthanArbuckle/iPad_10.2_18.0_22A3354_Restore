@implementation SiriTaskConfiguration

- (SiriTaskConfiguration)initWithJSONData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SiriTaskConfiguration *v7;
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
  self = -[SiriTaskConfiguration initWithDictionary:](self, "initWithDictionary:", v4);
  v7 = self;
LABEL_7:

  return v7;
}

- (SiriTaskConfiguration)initWithDictionary:(id)a3
{
  id v4;
  SiriTaskConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SiriTaskConfiguration *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SiriTaskConfiguration;
  v5 = -[SiriTaskConfiguration init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SiriTaskConfiguration setEventTime:](v5, "setEventTime:", v7);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        -[SiriTaskConfiguration setTaskName:](v5, "setTaskName:", v9);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskType"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v11 = (void *)objc_msgSend(v10, "copy");
          -[SiriTaskConfiguration setTaskType:](v5, "setTaskType:", v11);

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minDurationInSeconds"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            -[SiriTaskConfiguration setMinDurationInSeconds:](v5, "setMinDurationInSeconds:", (int)objc_msgSend(v12, "intValue"));
            v13 = v5;
          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(id)a3
{
  objc_storeStrong((id *)&self->_eventTime, a3);
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setTaskName:(id)a3
{
  objc_storeStrong((id *)&self->_taskName, a3);
}

- (NSString)taskType
{
  return self->_taskType;
}

- (void)setTaskType:(id)a3
{
  objc_storeStrong((id *)&self->_taskType, a3);
}

- (int64_t)minDurationInSeconds
{
  return self->_minDurationInSeconds;
}

- (void)setMinDurationInSeconds:(int64_t)a3
{
  self->_minDurationInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskType, 0);
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_eventTime, 0);
}

@end
