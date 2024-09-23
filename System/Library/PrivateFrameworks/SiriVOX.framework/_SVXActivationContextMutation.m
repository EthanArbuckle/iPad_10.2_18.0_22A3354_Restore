@implementation _SVXActivationContextMutation

- (_SVXActivationContextMutation)init
{
  return -[_SVXActivationContextMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXActivationContextMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXActivationContextMutation *v6;
  _SVXActivationContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXActivationContextMutation;
  v6 = -[_SVXActivationContextMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setButtonEvent:(id)a3
{
  objc_storeStrong((id *)&self->_buttonEvent, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void)setSystemEvent:(id)a3
{
  objc_storeStrong((id *)&self->_systemEvent, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void)setRequestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_requestInfo, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x41u;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x81u;
}

- (id)generate
{
  SVXActivationContext *baseModel;
  char mutationFlags;
  SVXActivationContext *v5;
  SVXActivationContext *v6;
  int64_t source;
  unint64_t timestamp;
  SVXButtonEvent *v9;
  SVXButtonEvent *v10;
  SVXSystemEvent *v11;
  SVXSystemEvent *v12;
  SVXClientInfo *v13;
  SVXClientInfo *v14;
  AFRequestInfo *v15;
  AFRequestInfo *v16;
  NSDictionary *v17;
  NSDictionary *v18;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = -[SVXActivationContext initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:]([SVXActivationContext alloc], "initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:", self->_source, self->_timestamp, self->_buttonEvent, self->_systemEvent, self->_clientInfo, self->_requestInfo, self->_userInfo);
    goto LABEL_5;
  }
  mutationFlags = (char)self->_mutationFlags;
  if ((mutationFlags & 1) == 0)
  {
    v5 = (SVXActivationContext *)-[SVXActivationContext copy](baseModel, "copy");
LABEL_5:
    v6 = v5;
    return v6;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) == 0)
  {
    source = -[SVXActivationContext source](baseModel, "source");
    mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 4) != 0)
      goto LABEL_8;
LABEL_11:
    timestamp = -[SVXActivationContext timestamp](self->_baseModel, "timestamp");
    if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
      goto LABEL_9;
LABEL_12:
    -[SVXActivationContext buttonEvent](self->_baseModel, "buttonEvent");
    v9 = (SVXButtonEvent *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  source = self->_source;
  if ((*(_BYTE *)&self->_mutationFlags & 4) == 0)
    goto LABEL_11;
LABEL_8:
  timestamp = self->_timestamp;
  if ((mutationFlags & 8) == 0)
    goto LABEL_12;
LABEL_9:
  v9 = self->_buttonEvent;
LABEL_13:
  v10 = v9;
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v11 = self->_systemEvent;
  }
  else
  {
    -[SVXActivationContext systemEvent](self->_baseModel, "systemEvent");
    v11 = (SVXSystemEvent *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v13 = self->_clientInfo;
  }
  else
  {
    -[SVXActivationContext clientInfo](self->_baseModel, "clientInfo");
    v13 = (SVXClientInfo *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
  {
    v15 = self->_requestInfo;
  }
  else
  {
    -[SVXActivationContext requestInfo](self->_baseModel, "requestInfo");
    v15 = (AFRequestInfo *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  if ((*(_BYTE *)&self->_mutationFlags & 0x80000000) != 0)
  {
    v17 = self->_userInfo;
  }
  else
  {
    -[SVXActivationContext userInfo](self->_baseModel, "userInfo");
    v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  v6 = -[SVXActivationContext initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:]([SVXActivationContext alloc], "initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:", source, timestamp, v10, v12, v14, v16, v17);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_systemEvent, 0);
  objc_storeStrong((id *)&self->_buttonEvent, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
