@implementation VMAudioParameter

- (VMAudioParameter)initWithName:(id)a3 defaultValue:(float)a4 min:(float)a5 max:(float)a6 internalAddress:(int)a7 graphName:(id)a8
{
  id v15;
  id v16;
  VMAudioParameter *v17;
  VMAudioParameter *v18;
  objc_super v20;

  v15 = a3;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)VMAudioParameter;
  v17 = -[VMAudioParameter init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    v18->_defaultValue = a4;
    v18->_min = a5;
    v18->_max = a6;
    v18->_internalAddress = a7;
    objc_storeStrong((id *)&v18->_graphName, a8);
  }

  return v18;
}

+ (id)parameterWithName:(id)a3 defaultValue:(float)a4 min:(float)a5 max:(float)a6 internalAddress:(int)a7 graphName:(id)a8
{
  uint64_t v8;
  id v13;
  id v14;
  VMAudioParameter *v15;
  double v16;
  double v17;
  double v18;
  VMAudioParameter *v19;

  v8 = *(_QWORD *)&a7;
  v13 = a8;
  v14 = a3;
  v15 = [VMAudioParameter alloc];
  *(float *)&v16 = a4;
  *(float *)&v17 = a5;
  *(float *)&v18 = a6;
  v19 = -[VMAudioParameter initWithName:defaultValue:min:max:internalAddress:graphName:](v15, "initWithName:defaultValue:min:max:internalAddress:graphName:", v14, v8, v13, v16, v17, v18);

  return v19;
}

- (float)currentValue
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioParameter name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v4));

  if (v5)
    objc_msgSend(v5, "floatValue");
  else
    -[VMAudioParameter defaultValue](self, "defaultValue");
  v7 = v6;

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (float)defaultValue
{
  return self->_defaultValue;
}

- (float)min
{
  return self->_min;
}

- (float)max
{
  return self->_max;
}

- (int)address
{
  return self->_address;
}

- (void)setAddress:(int)a3
{
  self->_address = a3;
}

- (float)value
{
  return self->_value;
}

- (int)internalAddress
{
  return self->_internalAddress;
}

- (void)setInternalAddress:(int)a3
{
  self->_internalAddress = a3;
}

- (NSString)graphName
{
  return self->_graphName;
}

- (void)setGraphName:(id)a3
{
  objc_storeStrong((id *)&self->_graphName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
