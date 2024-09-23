@implementation _SVXTaskContextMutation

- (_SVXTaskContextMutation)init
{
  return -[_SVXTaskContextMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXTaskContextMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXTaskContextMutation *v6;
  _SVXTaskContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXTaskContextMutation;
  v6 = -[_SVXTaskContextMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (void)setAceId:(id)a3
{
  objc_storeStrong((id *)&self->_aceId, a3);
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (void)setRefId:(id)a3
{
  objc_storeStrong((id *)&self->_refId, a3);
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (void)setDialogIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_dialogIdentifier, a3);
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (void)setDialogPhase:(id)a3
{
  objc_storeStrong((id *)&self->_dialogPhase, a3);
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (void)setIsUUFR:(BOOL)a3
{
  self->_isUUFR = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (void)setListensAfterSpeaking:(BOOL)a3
{
  self->_listensAfterSpeaking = a3;
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (void)setListenAfterSpeakingBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_listenAfterSpeakingBehavior, a3);
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (void)setActivationContext:(id)a3
{
  objc_storeStrong((id *)&self->_activationContext, a3);
  *(_WORD *)&self->_mutationFlags |= 0x1001u;
}

- (void)setDeactivationContext:(id)a3
{
  objc_storeStrong((id *)&self->_deactivationContext, a3);
  *(_WORD *)&self->_mutationFlags |= 0x2001u;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
  *(_WORD *)&self->_mutationFlags |= 0x4001u;
}

- (id)generate
{
  SVXTaskContext *baseModel;
  __int16 mutationFlags;
  uint64_t v5;
  SVXTaskContext *v6;
  SVXTaskContext *v7;
  NSUUID *v8;
  NSUUID *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  __int16 v16;
  BOOL isUUFR;
  BOOL listensAfterSpeaking;
  SAUIListenAfterSpeakingBehavior *v19;
  SAUIListenAfterSpeakingBehavior *v20;
  SVXActivationContext *v21;
  SVXActivationContext *v22;
  SVXDeactivationContext *v23;
  SVXDeactivationContext *v24;
  NSError *v25;
  NSError *v26;
  uint64_t v28;
  NSString *v29;
  NSString *v30;
  NSUUID *v31;
  unint64_t timestamp;
  NSUUID *v33;
  int64_t origin;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v6 = [SVXTaskContext alloc];
    LOWORD(v28) = *(_WORD *)&self->_isUUFR;
    v5 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:](v6, "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", self->_origin, self->_timestamp, self->_sessionUUID, self->_requestUUID, self->_aceId, self->_refId, self->_dialogIdentifier, self->_dialogPhase, v28, self->_listenAfterSpeakingBehavior, self->_activationContext, self->_deactivationContext, self->_error);
    goto LABEL_5;
  }
  mutationFlags = (__int16)self->_mutationFlags;
  if ((mutationFlags & 1) == 0)
  {
    v5 = -[SVXTaskContext copy](baseModel, "copy");
LABEL_5:
    v7 = (SVXTaskContext *)v5;
    return v7;
  }
  if ((mutationFlags & 2) == 0)
  {
    origin = -[SVXTaskContext origin](baseModel, "origin");
    mutationFlags = (__int16)self->_mutationFlags;
    if ((mutationFlags & 4) != 0)
      goto LABEL_8;
LABEL_11:
    timestamp = -[SVXTaskContext timestamp](self->_baseModel, "timestamp");
    if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
      goto LABEL_9;
    goto LABEL_12;
  }
  origin = self->_origin;
  if ((mutationFlags & 4) == 0)
    goto LABEL_11;
LABEL_8:
  timestamp = self->_timestamp;
  if ((mutationFlags & 8) != 0)
  {
LABEL_9:
    v8 = self->_sessionUUID;
    goto LABEL_13;
  }
LABEL_12:
  -[SVXTaskContext sessionUUID](self->_baseModel, "sessionUUID");
  v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v33 = v8;
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v9 = self->_requestUUID;
  }
  else
  {
    -[SVXTaskContext requestUUID](self->_baseModel, "requestUUID");
    v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  v31 = v9;
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v10 = self->_aceId;
  }
  else
  {
    -[SVXTaskContext aceId](self->_baseModel, "aceId");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v30 = v10;
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v11 = self->_refId;
  }
  else
  {
    -[SVXTaskContext refId](self->_baseModel, "refId");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v29 = v11;
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v12 = self->_dialogIdentifier;
  }
  else
  {
    -[SVXTaskContext dialogIdentifier](self->_baseModel, "dialogIdentifier");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v14 = self->_dialogPhase;
  }
  else
  {
    -[SVXTaskContext dialogPhase](self->_baseModel, "dialogPhase");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  v16 = (__int16)self->_mutationFlags;
  if ((v16 & 0x200) == 0)
  {
    isUUFR = -[SVXTaskContext isUUFR](self->_baseModel, "isUUFR");
    v16 = (__int16)self->_mutationFlags;
    if ((v16 & 0x400) != 0)
      goto LABEL_30;
LABEL_33:
    listensAfterSpeaking = -[SVXTaskContext listensAfterSpeaking](self->_baseModel, "listensAfterSpeaking");
    if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
      goto LABEL_31;
LABEL_34:
    -[SVXTaskContext listenAfterSpeakingBehavior](self->_baseModel, "listenAfterSpeakingBehavior");
    v19 = (SAUIListenAfterSpeakingBehavior *)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  isUUFR = self->_isUUFR;
  if ((*(_WORD *)&self->_mutationFlags & 0x400) == 0)
    goto LABEL_33;
LABEL_30:
  listensAfterSpeaking = self->_listensAfterSpeaking;
  if ((v16 & 0x800) == 0)
    goto LABEL_34;
LABEL_31:
  v19 = self->_listenAfterSpeakingBehavior;
LABEL_35:
  v20 = v19;
  if ((*(_WORD *)&self->_mutationFlags & 0x1000) != 0)
  {
    v21 = self->_activationContext;
  }
  else
  {
    -[SVXTaskContext activationContext](self->_baseModel, "activationContext");
    v21 = (SVXActivationContext *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;
  if ((*(_WORD *)&self->_mutationFlags & 0x2000) != 0)
  {
    v23 = self->_deactivationContext;
  }
  else
  {
    -[SVXTaskContext deactivationContext](self->_baseModel, "deactivationContext");
    v23 = (SVXDeactivationContext *)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;
  if ((*(_WORD *)&self->_mutationFlags & 0x4000) != 0)
  {
    v25 = self->_error;
  }
  else
  {
    -[SVXTaskContext error](self->_baseModel, "error");
    v25 = (NSError *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;
  BYTE1(v28) = listensAfterSpeaking;
  LOBYTE(v28) = isUUFR;
  v7 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:]([SVXTaskContext alloc], "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", origin, timestamp, v33, v31, v30, v29, v13, v15, v28, v20, v22, v24, v25);

  return v7;
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
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
