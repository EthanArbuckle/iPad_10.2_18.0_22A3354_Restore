@implementation STGenericIntent

- (STGenericIntent)initWithName:(id)a3
{
  id v5;
  STGenericIntent *v6;
  STGenericIntent *v7;
  uint64_t v8;
  NSMutableDictionary *parameters;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STGenericIntent;
  v6 = -[STGenericIntent init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
    v8 = objc_claimAutoreleasedReturnValue();
    parameters = v7->_parameters;
    v7->_parameters = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)finished
{
  if (!-[STGenericIntent finishedState](self, "finishedState"))
  {
    -[STGenericIntent setFinishedState:](self, "setFinishedState:", 1);
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_348);
  }
}

- (void)handleWithProgress:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  _QWORD v7[6];

  +[STGenericIntentHelper sharedHelper](STGenericIntentHelper, "sharedHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriResponseQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__STGenericIntent_handleWithProgress___block_invoke;
  v7[3] = &unk_24DB76870;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);

}

- (id)getDateRangeParameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[STGenericIntent parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getTopicParameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[STGenericIntent parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getPersonParameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[STGenericIntent parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getGroupParameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[STGenericIntent parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getPlacesParameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[STGenericIntent parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addParam:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[STGenericIntent parameters](self, "parameters");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, v7);

}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_utterance, CFSTR("_utterance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("_parameters"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributes, CFSTR("_attributes"));

}

- (STGenericIntent)initWithCoder:(id)a3
{
  id v4;
  STGenericIntent *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *utterance;
  uint64_t v10;
  NSString *attributes;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *parameters;
  AFSiriTask *siriTask;
  objc_super v20;
  _QWORD v21[8];

  v21[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)STGenericIntent;
  v5 = -[STGenericIntent init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_utterance"));
    v8 = objc_claimAutoreleasedReturnValue();
    utterance = v5->_utterance;
    v5->_utterance = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_attributes"));
    v10 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (NSString *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v21[4] = objc_opt_class();
    v21[5] = objc_opt_class();
    v21[6] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("parameters"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mutableCopy");
    parameters = v5->_parameters;
    v5->_parameters = (NSMutableDictionary *)v16;

    v5->_appInForeground = 1;
    siriTask = v5->_siriTask;
    v5->_siriTask = 0;

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)appInForeground
{
  return self->_appInForeground;
}

- (void)setAppInForeground:(BOOL)a3
{
  self->_appInForeground = a3;
}

- (BOOL)isLaunch
{
  return self->_isLaunch;
}

- (void)setIsLaunch:(BOOL)a3
{
  self->_isLaunch = a3;
}

- (NSMutableDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (AFSiriTask)siriTask
{
  return self->_siriTask;
}

- (void)setSiriTask:(id)a3
{
  objc_storeStrong((id *)&self->_siriTask, a3);
}

- (STGenericIntentRequest)intentRequest
{
  return self->_intentRequest;
}

- (void)setIntentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_intentRequest, a3);
}

- (BOOL)handled
{
  return self->_handled;
}

- (void)setHandled:(BOOL)a3
{
  self->_handled = a3;
}

- (BOOL)finishedState
{
  return self->_finishedState;
}

- (void)setFinishedState:(BOOL)a3
{
  self->_finishedState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentRequest, 0);
  objc_storeStrong((id *)&self->_siriTask, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __38__STGenericIntent_handleWithProgress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "siriTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "siriTask");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "intentRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseWithCode:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "completeWithResponse:", v5);

    objc_msgSend(*(id *)(a1 + 32), "setHandled:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setSiriTask:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setIntentRequest:", 0);
  }
}

void __27__STGenericIntent_finished__block_invoke()
{
  NSObject *v0;
  id v1;

  +[STGenericIntentHelper sharedHelper](STGenericIntentHelper, "sharedHelper");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "waitForIntentCompleteSemaphore");
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v0);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
