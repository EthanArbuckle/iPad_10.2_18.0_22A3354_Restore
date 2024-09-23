@implementation _SVXDeviceSetupContextMutation

- (_SVXDeviceSetupContextMutation)init
{
  return -[_SVXDeviceSetupContextMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXDeviceSetupContextMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXDeviceSetupContextMutation *v6;
  _SVXDeviceSetupContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeviceSetupContextMutation;
  v6 = -[_SVXDeviceSetupContextMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setFlowScene:(id)a3
{
  objc_storeStrong((id *)&self->_flowScene, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void)setBeginDate:(id)a3
{
  objc_storeStrong((id *)&self->_beginDate, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (id)generate
{
  SVXDeviceSetupContext *baseModel;
  SVXDeviceSetupContext *v4;
  SVXDeviceSetupContext *v5;
  unint64_t timestamp;
  SVXDeviceSetupOptions *v7;
  SVXDeviceSetupOptions *v8;
  SVXDeviceSetupFlowScene *v9;
  SVXDeviceSetupFlowScene *v10;
  NSDate *v11;
  NSDate *v12;
  NSDate *v13;
  NSDate *v14;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXDeviceSetupContext initWithTimestamp:options:flowScene:beginDate:endDate:]([SVXDeviceSetupContext alloc], "initWithTimestamp:options:flowScene:beginDate:endDate:", self->_timestamp, self->_options, self->_flowScene, self->_beginDate, self->_endDate);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXDeviceSetupContext *)-[SVXDeviceSetupContext copy](baseModel, "copy");
LABEL_5:
    v5 = v4;
    return v5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    timestamp = self->_timestamp;
    if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
      goto LABEL_8;
LABEL_10:
    -[SVXDeviceSetupContext options](self->_baseModel, "options");
    v7 = (SVXDeviceSetupOptions *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  timestamp = -[SVXDeviceSetupContext timestamp](baseModel, "timestamp");
  if ((*(_BYTE *)&self->_mutationFlags & 4) == 0)
    goto LABEL_10;
LABEL_8:
  v7 = self->_options;
LABEL_11:
  v8 = v7;
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v9 = self->_flowScene;
  }
  else
  {
    -[SVXDeviceSetupContext flowScene](self->_baseModel, "flowScene");
    v9 = (SVXDeviceSetupFlowScene *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v11 = self->_beginDate;
  }
  else
  {
    -[SVXDeviceSetupContext beginDate](self->_baseModel, "beginDate");
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v13 = self->_endDate;
  }
  else
  {
    -[SVXDeviceSetupContext endDate](self->_baseModel, "endDate");
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  v5 = -[SVXDeviceSetupContext initWithTimestamp:options:flowScene:beginDate:endDate:]([SVXDeviceSetupContext alloc], "initWithTimestamp:options:flowScene:beginDate:endDate:", timestamp, v8, v10, v12, v13);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_flowScene, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
