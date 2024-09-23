@implementation TMLProtocolDescriptor

- (TMLProtocolDescriptor)initWithName:(id)a3 implementsProtocols:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  TMLProtocolDescriptor *v9;
  double v10;
  uint64_t v11;
  NSString *protocolName;
  const char *v13;
  double v14;
  uint64_t v15;
  NSSet *implementsProtocols;
  NSMutableDictionary *v17;
  NSMutableDictionary *signals;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TMLProtocolDescriptor;
  v9 = -[TMLProtocolDescriptor init](&v20, sel_init);
  if (v9)
  {
    v11 = objc_msgSend_copy(v6, v8, v10);
    protocolName = v9->_protocolName;
    v9->_protocolName = (NSString *)v11;

    v15 = objc_msgSend_copy(v7, v13, v14);
    implementsProtocols = v9->_implementsProtocols;
    v9->_implementsProtocols = (NSSet *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    signals = v9->_signals;
    v9->_signals = v17;

  }
  return v9;
}

- (void)addSignal:(id)a3
{
  NSMutableDictionary *signals;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  signals = self->_signals;
  v4 = a3;
  objc_msgSend_signalName(v4, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(signals, v7, v8, v4, v9);

}

- (Protocol)objcProtocol
{
  double v2;
  Protocol *objcProtocol;
  uint64_t v5;
  uint64_t v6;
  Protocol *v7;

  objcProtocol = self->_objcProtocol;
  if (!objcProtocol)
  {
    v5 = objc_msgSend_length(self->_objcProtocolName, a2, v2);
    v6 = 40;
    if (!v5)
      v6 = 8;
    NSProtocolFromString(*(NSString **)((char *)&self->super.isa + v6));
    objcProtocol = (Protocol *)objc_claimAutoreleasedReturnValue();
    v7 = self->_objcProtocol;
    self->_objcProtocol = objcProtocol;

  }
  return objcProtocol;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  TMLProtocolDescriptor *v5;
  TMLProtocolDescriptor *v6;
  NSString *protocolName;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  NSSet *implementsProtocols;
  const char *v16;
  NSSet *v17;
  double v18;
  NSSet *v19;
  const char *v20;
  double v21;
  char isEqualToDictionary;
  NSMutableDictionary *signals;
  void *v24;
  const char *v25;
  double v26;

  v5 = (TMLProtocolDescriptor *)a3;
  if (self == v5)
  {
    isEqualToDictionary = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      protocolName = self->_protocolName;
      objc_msgSend_protocolName(v6, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqualToString_(protocolName, v11, v12, v10))
      {
        isEqualToDictionary = 0;
LABEL_13:

        goto LABEL_14;
      }
      implementsProtocols = self->_implementsProtocols;
      objc_msgSend_implementsProtocols(v6, v13, v14);
      v17 = (NSSet *)objc_claimAutoreleasedReturnValue();
      if (implementsProtocols == v17
        || (v19 = self->_implementsProtocols,
            objc_msgSend_implementsProtocols(v6, v16, v18),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_isEqualToSet_(v19, v20, v21, v3)))
      {
        signals = self->_signals;
        objc_msgSend_signals(v6, v16, v18);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToDictionary = objc_msgSend_isEqualToDictionary_(signals, v25, v26, v24);

        if (implementsProtocols == v17)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        isEqualToDictionary = 0;
      }

      goto LABEL_12;
    }
    isEqualToDictionary = 0;
  }
LABEL_14:

  return isEqualToDictionary;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5;
  const char *v6;
  const char *v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  ProtobufCMessageDescriptor *objcProtocolName;
  const char *v19;
  void *v20;
  const char *v21;
  double v22;
  uint64_t v23;
  const char *v24;
  double v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];

  v5 = sub_22AD3C574((uint64_t)a3);
  v7 = (const char *)objc_msgSend_UTF8String(self->_protocolName, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  objc_msgSend_allObjects(self->_implementsProtocols, v8, v9);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_count(v26, v10, v11);
  *(_QWORD *)&a3[1].var1 = v12;
  if (v12)
    v12 = (uint64_t)malloc_type_malloc(8 * v12, 0x10040436913F5uLL);
  v15 = MEMORY[0x24BDAC760];
  a3[1].var2 = (ProtobufCMessageUnknownField *)v12;
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = sub_22AD45F44;
  v28[3] = &unk_24F500948;
  v28[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v26, v13, v14, v28);
  objcProtocolName = (ProtobufCMessageDescriptor *)self->_objcProtocolName;
  if (objcProtocolName)
  {
    v19 = (const char *)objc_msgSend_UTF8String(objcProtocolName, v16, v17);
    objcProtocolName = (ProtobufCMessageDescriptor *)strdup(v19);
  }
  a3[2].var0 = objcProtocolName;
  objc_msgSend_allValues(self->_signals, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_count(v20, v21, v22);
  *(_QWORD *)&a3[2].var1 = v23;
  if (v23)
    v23 = (uint64_t)malloc_type_malloc(8 * v23, 0x2004093837F09uLL);
  a3[2].var2 = (ProtobufCMessageUnknownField *)v23;
  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = sub_22AD45F80;
  v27[3] = &unk_24F500968;
  v27[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v20, v24, v25, v27);

}

+ (id)decode:(const ProtobufCMessage *)a3
{
  double v3;
  const char *v6;
  void *v7;
  double v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  unint64_t v13;
  void *v14;
  const char *v15;
  double v16;
  id v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;

  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, v3, a3[1].var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)&a3[1].var1)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCEF0]);
    v12 = (void *)objc_msgSend_initWithCapacity_(v9, v10, v11, *(_QWORD *)&a3[1].var1);
  }
  else
  {
    v12 = 0;
  }
  if (*(_QWORD *)&a3[1].var1)
  {
    v13 = 0;
    do
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v6, v8, *((_QWORD *)a3[1].var2 + v13));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v12, v15, v16, v14);

      ++v13;
    }
    while (v13 < *(_QWORD *)&a3[1].var1);
  }
  v17 = objc_alloc((Class)a1);
  v20 = (void *)objc_msgSend_copy(v12, v18, v19);
  v23 = (void *)objc_msgSend_initWithName_implementsProtocols_(v17, v21, v22, v7, v20);

  if (a3[2].var0)
  {
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObjcProtocolName_(v23, v27, v28, v26);

  }
  if (*(_QWORD *)&a3[2].var1)
  {
    v29 = 0;
    do
    {
      v30 = *((_QWORD *)a3[2].var2 + v29);
      v31 = (void *)objc_opt_class();
      objc_msgSend_decode_(v31, v32, v33, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addSignal_(v23, v35, v36, v34);

      ++v29;
    }
    while (v29 < *(_QWORD *)&a3[2].var1);
  }

  return v23;
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (NSSet)implementsProtocols
{
  return self->_implementsProtocols;
}

- (NSDictionary)signals
{
  return &self->_signals->super;
}

- (NSString)objcProtocolName
{
  return self->_objcProtocolName;
}

- (void)setObjcProtocolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objcProtocolName, 0);
  objc_storeStrong((id *)&self->_objcProtocol, 0);
  objc_storeStrong((id *)&self->_signals, 0);
  objc_storeStrong((id *)&self->_implementsProtocols, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
}

@end
