@implementation _TUIFeedCaptureDynamicState

- (_TUIFeedCaptureDynamicState)initWithValue:(id)a3 kind:(id)a4 instance:(id)a5 parameters:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _TUIFeedCaptureDynamicState *v15;
  _TUIFeedCaptureDynamicState *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_TUIFeedCaptureDynamicState;
  v15 = -[_TUIFeedCaptureDynamicState init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_value, a3);
    objc_storeStrong((id *)&v16->_kind, a4);
    objc_storeStrong((id *)&v16->_instance, a5);
    objc_storeStrong((id *)&v16->_parameters, a6);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  NSString *kind;
  NSObject *instance;
  NSObject *parameters;
  unsigned __int8 v12;

  v4 = a3;
  v6 = objc_opt_class(_TUIFeedCaptureDynamicState, v5);
  v7 = TUIDynamicCast(v6, v4);
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(v7);

  if (v8
    && ((kind = self->_kind, kind == (NSString *)v8[2]) || -[NSString isEqualToString:](kind, "isEqualToString:"))
    && ((instance = self->_instance, instance == v8[3])
     || -[NSObject isEqual:](instance, "isEqual:")))
  {
    parameters = self->_parameters;
    if (parameters == v8[4])
      v12 = 1;
    else
      v12 = -[NSObject isEqual:](parameters, "isEqual:");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_kind, "hash");
  v4 = (unint64_t)-[NSObject hash](self->_instance, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSObject hash](self->_parameters, "hash");
}

- (TUIDynamicProviding)value
{
  return self->_value;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSObject)instance
{
  return self->_instance;
}

- (NSObject)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
