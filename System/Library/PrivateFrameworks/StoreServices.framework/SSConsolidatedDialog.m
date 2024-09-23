@implementation SSConsolidatedDialog

- (id)copyWithZone:(_NSZone *)a3
{
  SSConsolidatedDialog *v5;
  uint64_t v6;
  NSString *cancelLabel;
  uint64_t v8;
  NSString *reason;
  uint64_t v10;
  NSString *title;

  v5 = objc_alloc_init(SSConsolidatedDialog);
  v6 = -[NSString copyWithZone:](self->_cancelLabel, "copyWithZone:", a3);
  cancelLabel = v5->_cancelLabel;
  v5->_cancelLabel = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  reason = v5->_reason;
  v5->_reason = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  title = v5->_title;
  v5->_title = (NSString *)v10;

  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_cancelLabel);
  SSXPCDictionarySetObject(v3, "1", self->_reason);
  SSXPCDictionarySetObject(v3, "2", self->_title);
  return v3;
}

- (SSConsolidatedDialog)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSConsolidatedDialog *v6;
  uint64_t v8;
  uint64_t v9;
  NSString *cancelLabel;
  uint64_t v11;
  uint64_t v12;
  NSString *reason;
  uint64_t v14;
  uint64_t v15;
  NSString *title;
  objc_super v17;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v17.receiver = self;
    v17.super_class = (Class)SSConsolidatedDialog;
    v6 = -[SSConsolidatedDialog init](&v17, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      cancelLabel = v6->_cancelLabel;
      v6->_cancelLabel = (NSString *)v9;

      v11 = objc_opt_class();
      v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      reason = v6->_reason;
      v6->_reason = (NSString *)v12;

      v14 = objc_opt_class();
      v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
      title = v6->_title;
      v6->_title = (NSString *)v15;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (NSString)cancelLabel
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCancelLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_cancelLabel, 0);
}

@end
