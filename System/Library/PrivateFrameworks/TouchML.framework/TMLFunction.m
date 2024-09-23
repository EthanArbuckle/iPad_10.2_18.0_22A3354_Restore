@implementation TMLFunction

- (TMLFunction)initWithName:(id)a3 body:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  TMLFunction *v9;
  double v10;
  uint64_t v11;
  NSString *functionName;
  const char *v13;
  double v14;
  uint64_t v15;
  NSString *functionBody;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TMLFunction;
  v9 = -[TMLFunction init](&v18, sel_init);
  if (v9)
  {
    v11 = objc_msgSend_copy(v6, v8, v10);
    functionName = v9->_functionName;
    v9->_functionName = (NSString *)v11;

    v15 = objc_msgSend_copy(v7, v13, v14);
    functionBody = v9->_functionBody;
    v9->_functionBody = (NSString *)v15;

  }
  return v9;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5;
  const char *v6;
  const char *v7;
  const char *v8;
  double v9;
  const char *v10;

  v5 = sub_22AD3C918((uint64_t)a3);
  v7 = (const char *)objc_msgSend_UTF8String(self->_functionName, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  v10 = (const char *)objc_msgSend_UTF8String(self->_functionBody, v8, v9);
  *(_QWORD *)&a3[1].var1 = strdup(v10);
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  double v3;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;

  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, v3, a3[1].var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v7, v8, *(_QWORD *)&a3[1].var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc((Class)a1);
  v13 = (void *)objc_msgSend_initWithName_body_(v10, v11, v12, v6, v9);

  return v13;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (NSString)functionBody
{
  return self->_functionBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionBody, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
}

@end
