@implementation SVXTaskContext

- (SVXTaskContext)initWithOrigin:(int64_t)a3 timestamp:(unint64_t)a4 sessionUUID:(id)a5 requestUUID:(id)a6 aceId:(id)a7 refId:(id)a8 dialogIdentifier:(id)a9 dialogPhase:(id)a10 isUUFR:(BOOL)a11 listensAfterSpeaking:(BOOL)a12 listenAfterSpeakingBehavior:(id)a13 activationContext:(id)a14 deactivationContext:(id)a15 error:(id)a16
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  SVXTaskContext *v26;
  SVXTaskContext *v27;
  uint64_t v28;
  NSUUID *sessionUUID;
  uint64_t v30;
  NSUUID *requestUUID;
  uint64_t v32;
  NSString *aceId;
  uint64_t v34;
  NSString *refId;
  uint64_t v36;
  NSString *dialogIdentifier;
  uint64_t v38;
  NSString *dialogPhase;
  uint64_t v40;
  SAUIListenAfterSpeakingBehavior *listenAfterSpeakingBehavior;
  uint64_t v42;
  SVXActivationContext *activationContext;
  uint64_t v44;
  SVXDeactivationContext *deactivationContext;
  uint64_t v46;
  NSError *error;
  id v52;
  id v53;
  id v54;
  objc_super v55;

  v19 = a5;
  v20 = a6;
  v21 = a7;
  v54 = a8;
  v53 = a9;
  v52 = a10;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v25 = a16;
  v55.receiver = self;
  v55.super_class = (Class)SVXTaskContext;
  v26 = -[SVXTaskContext init](&v55, sel_init);
  v27 = v26;
  if (v26)
  {
    v26->_origin = a3;
    v26->_timestamp = a4;
    v28 = objc_msgSend(v19, "copy");
    sessionUUID = v27->_sessionUUID;
    v27->_sessionUUID = (NSUUID *)v28;

    v30 = objc_msgSend(v20, "copy");
    requestUUID = v27->_requestUUID;
    v27->_requestUUID = (NSUUID *)v30;

    v32 = objc_msgSend(v21, "copy");
    aceId = v27->_aceId;
    v27->_aceId = (NSString *)v32;

    v34 = objc_msgSend(v54, "copy");
    refId = v27->_refId;
    v27->_refId = (NSString *)v34;

    v36 = objc_msgSend(v53, "copy");
    dialogIdentifier = v27->_dialogIdentifier;
    v27->_dialogIdentifier = (NSString *)v36;

    v38 = objc_msgSend(v52, "copy");
    dialogPhase = v27->_dialogPhase;
    v27->_dialogPhase = (NSString *)v38;

    v27->_isUUFR = a11;
    v27->_listensAfterSpeaking = a12;
    v40 = objc_msgSend(v22, "copy");
    listenAfterSpeakingBehavior = v27->_listenAfterSpeakingBehavior;
    v27->_listenAfterSpeakingBehavior = (SAUIListenAfterSpeakingBehavior *)v40;

    v42 = objc_msgSend(v23, "copy");
    activationContext = v27->_activationContext;
    v27->_activationContext = (SVXActivationContext *)v42;

    v44 = objc_msgSend(v24, "copy");
    deactivationContext = v27->_deactivationContext;
    v27->_deactivationContext = (SVXDeactivationContext *)v44;

    v46 = objc_msgSend(v25, "copy");
    error = v27->_error;
    v27->_error = (NSError *)v46;

  }
  return v27;
}

- (id)description
{
  return -[SVXTaskContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t origin;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  objc_super v14;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v14.receiver = self;
  v14.super_class = (Class)SVXTaskContext;
  -[SVXTaskContext description](&v14, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  origin = self->_origin;
  if (origin > 0xC)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_24D24C6E0[origin];
  v8 = v7;
  v9 = v8;
  v10 = CFSTR("YES");
  if (self->_isUUFR)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (!self->_listensAfterSpeaking)
    v10 = CFSTR("NO");
  v12 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {origin = %@, timestamp = %llu, sessionUUID = %@, requestUUID = %@, aceId = %@, refId = %@, dialogIdentifier = %@, dialogPhase = %@, isUUFR = %@, listensAfterSpeaking = %@, listenAfterSpeakingBehavior = %@, activationContext = %@, deactivationContext = %@, error = %@}"), v5, v8, *(_OWORD *)&self->_timestamp, *(_OWORD *)&self->_requestUUID, *(_OWORD *)&self->_refId, self->_dialogPhase, v11, v10, self->_listenAfterSpeakingBehavior, self->_activationContext, self->_deactivationContext, self->_error);

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_origin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[NSUUID hash](self->_sessionUUID, "hash");
  v8 = v7 ^ -[NSUUID hash](self->_requestUUID, "hash");
  v9 = v8 ^ -[NSString hash](self->_aceId, "hash");
  v10 = v6 ^ v9 ^ -[NSString hash](self->_refId, "hash");
  v11 = -[NSString hash](self->_dialogIdentifier, "hash");
  v12 = v11 ^ -[NSString hash](self->_dialogPhase, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUUFR);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_listensAfterSpeaking);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  v17 = -[SAUIListenAfterSpeakingBehavior hash](self->_listenAfterSpeakingBehavior, "hash");
  v18 = v17 ^ -[SVXActivationContext hash](self->_activationContext, "hash");
  v19 = v18 ^ -[SVXDeactivationContext hash](self->_deactivationContext, "hash");
  v20 = v16 ^ v19 ^ -[NSError hash](self->_error, "hash");

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  SVXTaskContext *v4;
  SVXTaskContext *v5;
  int64_t origin;
  unint64_t timestamp;
  _BOOL4 isUUFR;
  _BOOL4 listensAfterSpeaking;
  NSUUID *v10;
  NSUUID *sessionUUID;
  NSUUID *v12;
  NSUUID *requestUUID;
  NSString *v14;
  NSString *aceId;
  NSString *v16;
  NSString *refId;
  NSString *v18;
  NSString *dialogIdentifier;
  NSString *v20;
  NSString *dialogPhase;
  SAUIListenAfterSpeakingBehavior *v22;
  SAUIListenAfterSpeakingBehavior *listenAfterSpeakingBehavior;
  SVXActivationContext *v24;
  SVXActivationContext *activationContext;
  SVXDeactivationContext *v26;
  SVXDeactivationContext *deactivationContext;
  NSError *v28;
  NSError *error;
  NSError *v30;
  int v31;
  BOOL v32;
  SVXActivationContext *v34;
  SAUIListenAfterSpeakingBehavior *v35;

  v4 = (SVXTaskContext *)a3;
  if (self == v4)
  {
    v32 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      origin = self->_origin;
      if (origin == -[SVXTaskContext origin](v5, "origin")
        && (timestamp = self->_timestamp, timestamp == -[SVXTaskContext timestamp](v5, "timestamp"))
        && (isUUFR = self->_isUUFR, isUUFR == -[SVXTaskContext isUUFR](v5, "isUUFR"))
        && (listensAfterSpeaking = self->_listensAfterSpeaking,
            listensAfterSpeaking == -[SVXTaskContext listensAfterSpeaking](v5, "listensAfterSpeaking")))
      {
        -[SVXTaskContext sessionUUID](v5, "sessionUUID");
        v10 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        sessionUUID = self->_sessionUUID;
        if (sessionUUID == v10 || -[NSUUID isEqual:](sessionUUID, "isEqual:", v10))
        {
          -[SVXTaskContext requestUUID](v5, "requestUUID");
          v12 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          requestUUID = self->_requestUUID;
          if (requestUUID == v12 || -[NSUUID isEqual:](requestUUID, "isEqual:", v12))
          {
            -[SVXTaskContext aceId](v5, "aceId");
            v14 = (NSString *)objc_claimAutoreleasedReturnValue();
            aceId = self->_aceId;
            if (aceId == v14 || -[NSString isEqual:](aceId, "isEqual:", v14))
            {
              -[SVXTaskContext refId](v5, "refId");
              v16 = (NSString *)objc_claimAutoreleasedReturnValue();
              refId = self->_refId;
              if (refId == v16 || -[NSString isEqual:](refId, "isEqual:", v16))
              {
                -[SVXTaskContext dialogIdentifier](v5, "dialogIdentifier");
                v18 = (NSString *)objc_claimAutoreleasedReturnValue();
                dialogIdentifier = self->_dialogIdentifier;
                if (dialogIdentifier == v18 || -[NSString isEqual:](dialogIdentifier, "isEqual:", v18))
                {
                  -[SVXTaskContext dialogPhase](v5, "dialogPhase");
                  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
                  dialogPhase = self->_dialogPhase;
                  if (dialogPhase == v20 || -[NSString isEqual:](dialogPhase, "isEqual:", v20))
                  {
                    -[SVXTaskContext listenAfterSpeakingBehavior](v5, "listenAfterSpeakingBehavior");
                    v22 = (SAUIListenAfterSpeakingBehavior *)objc_claimAutoreleasedReturnValue();
                    listenAfterSpeakingBehavior = self->_listenAfterSpeakingBehavior;
                    if (listenAfterSpeakingBehavior == v22
                      || -[SAUIListenAfterSpeakingBehavior isEqual:](listenAfterSpeakingBehavior, "isEqual:", v22))
                    {
                      v35 = v22;
                      -[SVXTaskContext activationContext](v5, "activationContext");
                      v24 = (SVXActivationContext *)objc_claimAutoreleasedReturnValue();
                      activationContext = self->_activationContext;
                      if (activationContext == v24
                        || -[SVXActivationContext isEqual:](activationContext, "isEqual:", v24))
                      {
                        -[SVXTaskContext deactivationContext](v5, "deactivationContext", v24);
                        v26 = (SVXDeactivationContext *)objc_claimAutoreleasedReturnValue();
                        deactivationContext = self->_deactivationContext;
                        if (deactivationContext == v26
                          || -[SVXDeactivationContext isEqual:](deactivationContext, "isEqual:", v26))
                        {
                          -[SVXTaskContext error](v5, "error");
                          v28 = (NSError *)objc_claimAutoreleasedReturnValue();
                          error = self->_error;
                          v32 = 1;
                          if (error != v28)
                          {
                            v30 = v28;
                            v31 = -[NSError isEqual:](error, "isEqual:", v28);
                            v28 = v30;
                            if (!v31)
                              v32 = 0;
                          }

                        }
                        else
                        {
                          v32 = 0;
                        }

                        v24 = v34;
                      }
                      else
                      {
                        v32 = 0;
                      }

                      v22 = v35;
                    }
                    else
                    {
                      v32 = 0;
                    }

                  }
                  else
                  {
                    v32 = 0;
                  }

                }
                else
                {
                  v32 = 0;
                }

              }
              else
              {
                v32 = 0;
              }

            }
            else
            {
              v32 = 0;
            }

          }
          else
          {
            v32 = 0;
          }

        }
        else
        {
          v32 = 0;
        }

      }
      else
      {
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }
  }

  return v32;
}

- (SVXTaskContext)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  SVXTaskContext *v25;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::origin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::sessionUUID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::requestUUID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::aceId"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::refId"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::dialogIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::dialogPhase"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::isUUFR"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::listensAfterSpeaking"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::listenAfterSpeakingBehavior"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::activationContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::deactivationContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXTaskContext::error"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v17) = v11;
  LOBYTE(v17) = v9;
  v25 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:](self, "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", v23, v22, v19, v18, v21, v20, v6, v7, v17, v12, v13, v14, v15);

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t origin;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  origin = self->_origin;
  v10 = a3;
  objc_msgSend(v4, "numberWithInteger:", origin);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("SVXTaskContext::origin"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("SVXTaskContext::timestamp"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_sessionUUID, CFSTR("SVXTaskContext::sessionUUID"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_requestUUID, CFSTR("SVXTaskContext::requestUUID"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_aceId, CFSTR("SVXTaskContext::aceId"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_refId, CFSTR("SVXTaskContext::refId"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_dialogIdentifier, CFSTR("SVXTaskContext::dialogIdentifier"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_dialogPhase, CFSTR("SVXTaskContext::dialogPhase"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUUFR);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("SVXTaskContext::isUUFR"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_listensAfterSpeaking);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("SVXTaskContext::listensAfterSpeaking"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_listenAfterSpeakingBehavior, CFSTR("SVXTaskContext::listenAfterSpeakingBehavior"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_activationContext, CFSTR("SVXTaskContext::activationContext"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_deactivationContext, CFSTR("SVXTaskContext::deactivationContext"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_error, CFSTR("SVXTaskContext::error"));

}

- (int64_t)origin
{
  return self->_origin;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (NSString)aceId
{
  return self->_aceId;
}

- (NSString)refId
{
  return self->_refId;
}

- (NSString)dialogIdentifier
{
  return self->_dialogIdentifier;
}

- (NSString)dialogPhase
{
  return self->_dialogPhase;
}

- (BOOL)isUUFR
{
  return self->_isUUFR;
}

- (BOOL)listensAfterSpeaking
{
  return self->_listensAfterSpeaking;
}

- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior
{
  return self->_listenAfterSpeakingBehavior;
}

- (SVXActivationContext)activationContext
{
  return self->_activationContext;
}

- (SVXDeactivationContext)deactivationContext
{
  return self->_deactivationContext;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_deactivationContext, 0);
  objc_storeStrong((id *)&self->_activationContext, 0);
  objc_storeStrong((id *)&self->_listenAfterSpeakingBehavior, 0);
  objc_storeStrong((id *)&self->_dialogPhase, 0);
  objc_storeStrong((id *)&self->_dialogIdentifier, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_aceId, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXTaskContextMutation *);
  _SVXTaskContextMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXTaskContextMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXTaskContextMutation initWithBaseModel:]([_SVXTaskContextMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXTaskContextMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXTaskContext copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXTaskContextMutation *);
  _SVXTaskContextMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXTaskContextMutation *))a3;
  v4 = objc_alloc_init(_SVXTaskContextMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXTaskContextMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
