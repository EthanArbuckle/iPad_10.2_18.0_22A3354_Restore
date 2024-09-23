@implementation TMLSignalHandlerFunction

- (TMLSignalHandlerFunction)initWithSignalName:(id)a3 functionName:(id)a4 body:(id)a5
{
  id v8;
  const char *v9;
  TMLSignalHandlerFunction *v10;
  double v11;
  uint64_t v12;
  NSString *signalName;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TMLSignalHandlerFunction;
  v10 = -[TMLFunction initWithName:body:](&v15, sel_initWithName_body_, a4, a5);
  if (v10)
  {
    v12 = objc_msgSend_copy(v8, v9, v11);
    signalName = v10->_signalName;
    v10->_signalName = (NSString *)v12;

  }
  return v10;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5;
  const char *v6;
  const char *v7;
  const char *v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  const char *v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  const char *v18;
  id v19;

  v5 = sub_22AD3C9EC((uint64_t)a3);
  v7 = (const char *)objc_msgSend_UTF8String(self->_signalName, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  objc_msgSend_functionName(self, v8, v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12);
  *(_QWORD *)&a3[1].var1 = strdup(v13);

  objc_msgSend_functionBody(self, v14, v15);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (const char *)objc_msgSend_UTF8String(v19, v16, v17);
  a3[1].var2 = (ProtobufCMessageUnknownField *)strdup(v18);

}

+ (id)decode:(const ProtobufCMessage *)a3
{
  double v3;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  id v13;
  const char *v14;
  double v15;
  void *v16;

  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, v3, a3[1].var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v7, v8, *(_QWORD *)&a3[1].var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v10, v11, a3[1].var2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc((Class)a1);
  v16 = (void *)objc_msgSend_initWithSignalName_functionName_body_(v13, v14, v15, v6, v9, v12);

  return v16;
}

- (NSString)signalName
{
  return self->_signalName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalName, 0);
}

@end
