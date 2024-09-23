@implementation PUEditPluginActionActivity

- (PUEditPluginActionActivity)initWithPlugin:(id)a3 systemImageName:(id)a4
{
  id v6;
  PUEditPluginActionActivity *v7;
  uint64_t v8;
  NSString *internalSystemImageName;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUEditPluginActionActivity;
  v7 = -[PUEditPluginActivity initWithPlugin:](&v11, sel_initWithPlugin_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    internalSystemImageName = v7->_internalSystemImageName;
    v7->_internalSystemImageName = (NSString *)v8;

  }
  return v7;
}

- (id)_systemImageName
{
  return self->_internalSystemImageName;
}

- (NSString)internalSystemImageName
{
  return self->_internalSystemImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSystemImageName, 0);
}

+ (int64_t)activityCategory
{
  return 0;
}

@end
