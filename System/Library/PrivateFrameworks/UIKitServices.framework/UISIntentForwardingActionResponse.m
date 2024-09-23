@implementation UISIntentForwardingActionResponse

- (UISIntentForwardingActionResponse)initWithIntentForwardingActionResponse:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  UISIntentForwardingActionResponse *v8;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D22FF0]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("INIntentForwardingActionResponseObjectKey"));
  objc_msgSend(v6, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v7, 4);

  v8 = -[BSActionResponse initWithInfo:error:](self, "initWithInfo:error:", v5, 0);
  return v8;
}

+ (id)responseWithIntentForwardingActionResponse:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIntentForwardingActionResponse:", v4);

  return v5;
}

- (UISIntentForwardingActionResponse)initWithIntentResponse:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  UISIntentForwardingActionResponse *v8;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D22FF0]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("INIntentResponseObjectKey"));
  objc_msgSend(v6, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v7, 2);

  v8 = -[BSActionResponse initWithInfo:error:](self, "initWithInfo:error:", v5, 0);
  return v8;
}

+ (id)responseWithIntentResponse:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIntentResponse:", v4);

  return v5;
}

- (INIntentResponse)intentResponse
{
  INIntentResponse *cachedIntentResponse;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  INIntentResponse *v9;
  INIntentResponse *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  cachedIntentResponse = self->_cachedIntentResponse;
  if (!cachedIntentResponse)
  {
    -[BSActionResponse info](self, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForSetting:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      NSLog(CFSTR("%s: Invalid UISIntentForwardingActionResponse object does not have data: %@"), "-[UISIntentForwardingActionResponse intentResponse]", self);
      return (INIntentResponse *)0;
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, 0);
    objc_msgSend(v6, "setRequiresSecureCoding:", 1);
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v7 = (void *)getINIntentResponseClass_softClass;
    v16 = getINIntentResponseClass_softClass;
    if (!getINIntentResponseClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getINIntentResponseClass_block_invoke;
      v12[3] = &unk_1E2CAF658;
      v12[4] = &v13;
      __getINIntentResponseClass_block_invoke((uint64_t)v12);
      v7 = (void *)v14[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v8, CFSTR("INIntentResponseObjectKey"));
    v9 = (INIntentResponse *)objc_claimAutoreleasedReturnValue();
    v10 = self->_cachedIntentResponse;
    self->_cachedIntentResponse = v9;

    objc_msgSend(v6, "finishDecoding");
    cachedIntentResponse = self->_cachedIntentResponse;
  }
  return cachedIntentResponse;
}

- (INIntentForwardingActionResponse)intentForwardingActionResponse
{
  INIntentForwardingActionResponse *cachedIntentForwardingActionResponse;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  INIntentForwardingActionResponse *v9;
  INIntentForwardingActionResponse *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  cachedIntentForwardingActionResponse = self->_cachedIntentForwardingActionResponse;
  if (!cachedIntentForwardingActionResponse)
  {
    -[BSActionResponse info](self, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForSetting:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      NSLog(CFSTR("%s: Invalid UISIntentForwardingActionResponse object does not have data: %@"), "-[UISIntentForwardingActionResponse intentForwardingActionResponse]", self);
      return (INIntentForwardingActionResponse *)0;
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, 0);
    objc_msgSend(v6, "setRequiresSecureCoding:", 1);
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v7 = (void *)getINIntentForwardingActionResponseClass_softClass;
    v16 = getINIntentForwardingActionResponseClass_softClass;
    if (!getINIntentForwardingActionResponseClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getINIntentForwardingActionResponseClass_block_invoke;
      v12[3] = &unk_1E2CAF658;
      v12[4] = &v13;
      __getINIntentForwardingActionResponseClass_block_invoke((uint64_t)v12);
      v7 = (void *)v14[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v8, CFSTR("INIntentForwardingActionResponseObjectKey"));
    v9 = (INIntentForwardingActionResponse *)objc_claimAutoreleasedReturnValue();
    v10 = self->_cachedIntentForwardingActionResponse;
    self->_cachedIntentForwardingActionResponse = v9;

    objc_msgSend(v6, "finishDecoding");
    cachedIntentForwardingActionResponse = self->_cachedIntentForwardingActionResponse;
  }
  return cachedIntentForwardingActionResponse;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("intent forwarding action response");
  if (a3 != 4)
    v3 = 0;
  if (a3 == 2)
    return CFSTR("intent response");
  else
    return (id)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIntentForwardingActionResponse, 0);
  objc_storeStrong((id *)&self->_cachedIntentResponse, 0);
}

@end
