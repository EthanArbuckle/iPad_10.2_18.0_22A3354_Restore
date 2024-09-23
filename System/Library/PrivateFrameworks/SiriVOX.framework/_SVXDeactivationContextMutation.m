@implementation _SVXDeactivationContextMutation

- (_SVXDeactivationContextMutation)init
{
  return -[_SVXDeactivationContextMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXDeactivationContextMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXDeactivationContextMutation *v6;
  _SVXDeactivationContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeactivationContextMutation;
  v6 = -[_SVXDeactivationContextMutation init](&v9, sel_init);
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

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x41u;
}

- (id)generate
{
  SVXDeactivationContext *baseModel;
  char mutationFlags;
  SVXDeactivationContext *v5;
  SVXDeactivationContext *v6;
  int64_t source;
  unint64_t timestamp;
  SVXButtonEvent *v9;
  SVXButtonEvent *v10;
  SVXClientInfo *v11;
  SVXClientInfo *v12;
  NSDictionary *v13;
  NSDictionary *v14;
  SVXDeactivationOptions *v15;
  SVXDeactivationOptions *v16;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = -[SVXDeactivationContext initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:]([SVXDeactivationContext alloc], "initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:", self->_source, self->_timestamp, self->_buttonEvent, self->_clientInfo, self->_userInfo, self->_options);
    goto LABEL_5;
  }
  mutationFlags = (char)self->_mutationFlags;
  if ((mutationFlags & 1) == 0)
  {
    v5 = (SVXDeactivationContext *)-[SVXDeactivationContext copy](baseModel, "copy");
LABEL_5:
    v6 = v5;
    return v6;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) == 0)
  {
    source = -[SVXDeactivationContext source](baseModel, "source");
    mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 4) != 0)
      goto LABEL_8;
LABEL_11:
    timestamp = -[SVXDeactivationContext timestamp](self->_baseModel, "timestamp");
    if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
      goto LABEL_9;
LABEL_12:
    -[SVXDeactivationContext buttonEvent](self->_baseModel, "buttonEvent");
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
    v11 = self->_clientInfo;
  }
  else
  {
    -[SVXDeactivationContext clientInfo](self->_baseModel, "clientInfo");
    v11 = (SVXClientInfo *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v13 = self->_userInfo;
  }
  else
  {
    -[SVXDeactivationContext userInfo](self->_baseModel, "userInfo");
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
  {
    v15 = self->_options;
  }
  else
  {
    -[SVXDeactivationContext options](self->_baseModel, "options");
    v15 = (SVXDeactivationOptions *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  v6 = -[SVXDeactivationContext initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:]([SVXDeactivationContext alloc], "initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:", source, timestamp, v10, v12, v14, v15);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_buttonEvent, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
