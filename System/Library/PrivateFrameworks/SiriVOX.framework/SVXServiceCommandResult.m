@implementation SVXServiceCommandResult

- (BOOL)handleResultUsingIgnoredBlock:(id)a3 successBlock:(id)a4 failureBlock:(id)a5 commandBlock:(id)a6
{
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  void (**v12)(id, int64_t, NSString *);
  id v13;
  void *v14;
  BOOL v15;
  void *v16;

  v10 = (void (**)(_QWORD))a3;
  v11 = (void (**)(_QWORD))a4;
  v12 = (void (**)(id, int64_t, NSString *))a5;
  v13 = a6;
  v14 = v13;
  switch(self->_type)
  {
    case 0:
      if (v10)
        v10[2](v10);
      goto LABEL_13;
    case 1:
      if (v12)
        v12[2](v12, self->_failureErrorCode, self->_failureReason);
      goto LABEL_13;
    case 2:
      if (v11)
        v11[2](v11);
      goto LABEL_13;
    case 3:
      if (v13)
        (*((void (**)(id, SAAceCommand *))v13 + 2))(v13, self->_command);
      goto LABEL_13;
    case 4:
      -[SVXServiceCommandResult _optimalResult](self, "_optimalResult");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleResultUsingIgnoredBlock:successBlock:failureBlock:commandBlock:", v10, v11, v12, v14);

LABEL_13:
      v15 = 1;
      break;
    default:
      v15 = 0;
      break;
  }

  return v15;
}

- (id)_initWithType:(int64_t)a3 failureErrorCode:(int64_t)a4 failureReason:(id)a5 command:(id)a6 results:(id)a7
{
  id v12;
  id v13;
  id v14;
  SVXServiceCommandResult *v15;
  SVXServiceCommandResult *v16;
  uint64_t v17;
  NSString *failureReason;
  uint64_t v19;
  SAAceCommand *command;
  uint64_t v21;
  NSArray *results;
  objc_super v24;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SVXServiceCommandResult;
  v15 = -[SVXServiceCommandResult init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    v15->_failureErrorCode = a4;
    v17 = objc_msgSend(v12, "copy");
    failureReason = v16->_failureReason;
    v16->_failureReason = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    command = v16->_command;
    v16->_command = (SAAceCommand *)v19;

    v21 = objc_msgSend(v14, "copy");
    results = v16->_results;
    v16->_results = (NSArray *)v21;

  }
  return v16;
}

- (id)_optimalResult
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  SVXServiceCommandResult *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_type != 4)
  {
    v12 = self;
    return v12;
  }
  if (!-[NSArray count](self->_results, "count"))
  {
    +[SVXServiceCommandResult resultIgnored](SVXServiceCommandResult, "resultIgnored");
    v12 = (SVXServiceCommandResult *)objc_claimAutoreleasedReturnValue();
    return v12;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_results;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "_optimalResult", (_QWORD)v14);
        v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (!v6 || v9[1] > v6[1])
        {
          v11 = v9;

          v6 = v11;
        }

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
}

+ (id)resultIgnored
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithType:failureErrorCode:failureReason:command:results:", 0, 0, 0, 0, 0);
}

+ (id)resultSuccess
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithType:failureErrorCode:failureReason:command:results:", 2, 0, 0, 0, 0);
}

+ (id)resultFailureWithErrorCode:(int64_t)a3 reason:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithType:failureErrorCode:failureReason:command:results:", 1, a3, v5, 0, 0);

  return v6;
}

+ (SVXServiceCommandResult)resultWithCommand:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithType:failureErrorCode:failureReason:command:results:", 3, 0, 0, v3, 0);

  return (SVXServiceCommandResult *)v4;
}

+ (SVXServiceCommandResult)resultWithResults:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithType:failureErrorCode:failureReason:command:results:", 4, 0, 0, 0, v3);

  return (SVXServiceCommandResult *)v4;
}

@end
