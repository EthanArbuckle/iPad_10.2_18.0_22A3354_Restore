@implementation WFInputtedState

- (WFInputtedState)initWithParameterKey:(id)a3 parameterState:(id)a4
{
  id v6;
  id v7;
  WFInputtedState *v8;
  uint64_t v9;
  NSString *parameterKey;
  WFInputtedState *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFInputtedState;
  v8 = -[WFInputtedState init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    parameterKey = v8->_parameterKey;
    v8->_parameterKey = (NSString *)v9;

    objc_storeStrong((id *)&v8->_parameterState, a4);
    v11 = v8;
  }

  return v8;
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (void)setParameterKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (WFParameterState)parameterState
{
  return self->_parameterState;
}

- (void)setParameterState:(id)a3
{
  objc_storeStrong((id *)&self->_parameterState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterState, 0);
  objc_storeStrong((id *)&self->_parameterKey, 0);
}

@end
