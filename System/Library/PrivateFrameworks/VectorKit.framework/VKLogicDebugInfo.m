@implementation VKLogicDebugInfo

- (VKLogicDebugInfo)initWithName:(id)a3 identifier:(unint64_t)a4
{
  id v6;
  VKLogicDebugInfo *v7;
  uint64_t v8;
  NSString *name;
  VKLogicDebugInfo *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VKLogicDebugInfo;
  v7 = -[VKLogicDebugInfo init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_identifier = a4;
    v10 = v7;
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
