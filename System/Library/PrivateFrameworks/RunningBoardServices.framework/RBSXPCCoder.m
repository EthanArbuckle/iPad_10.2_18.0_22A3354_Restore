@implementation RBSXPCCoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unarchiver, 0);
  objc_storeStrong((id *)&self->_archiver, 0);
  objc_storeStrong((id *)&self->_codingContext, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

+ (id)coderWithMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessage:", v4);

  return v5;
}

- (RBSXPCCoder)initWithMessage:(id)a3
{
  id v6;
  void *v7;
  RBSXPCCoder *v8;
  RBSXPCCoder *v9;
  uint64_t v10;
  OS_xpc_object *xpcConnection;
  OS_xpc_object *v12;
  void *v14;
  objc_super v15;

  v6 = a3;
  v7 = v6;
  if (v6 && MEMORY[0x194019424](v6) != MEMORY[0x1E0C812F8])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSXPCCoder.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!message || (xpc_get_type(message) == XPC_TYPE_DICTIONARY)"));

  }
  v15.receiver = self;
  v15.super_class = (Class)RBSXPCCoder;
  v8 = -[RBSXPCCoder init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_finalized = 0;
    if (v7)
    {
      objc_storeStrong((id *)&v8->_message, a3);
      xpc_dictionary_get_remote_connection(v7);
      v10 = objc_claimAutoreleasedReturnValue();
      xpcConnection = v9->_xpcConnection;
      v9->_xpcConnection = (OS_xpc_object *)v10;
    }
    else
    {
      v12 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
      xpcConnection = v9->_message;
      v9->_message = v12;
    }

  }
  return v9;
}

- (id)decodeStringForKey:(id)a3
{
  OS_xpc_object *codingContext;
  OS_xpc_object *v5;
  id v6;
  const char *v7;
  void *v8;
  void *v9;

  codingContext = self->_codingContext;
  if (!codingContext)
    codingContext = self->_message;
  v5 = codingContext;
  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  RBSXPCDictionaryGetValue(v5, v7, MEMORY[0x1E0C81390]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", xpc_string_get_string_ptr(v8));
  else
    v9 = 0;

  return v9;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (RBSAtomicGetFlag((unsigned int *)&self->_finalized))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSXPCCoder.m"), 139, CFSTR("cannot continue encoding after finalizing"));

    if (v7)
      goto LABEL_3;
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSXPCCoder.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

LABEL_3:
  if (v10)
    _RBSXPCEncodeObjectForKey(self, v10, v7);

}

- (unint64_t)decodeUInt64ForKey:(id)a3
{
  unint64_t result;
  const char *v5;
  OS_xpc_object *codingContext;
  OS_xpc_object *v7;
  uint64_t uint64;

  result = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (result)
  {
    v5 = (const char *)result;
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    v7 = codingContext;
    uint64 = xpc_dictionary_get_uint64(v7, v5);

    return uint64;
  }
  return result;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  uint64_t v4;
  const char *v5;
  OS_xpc_object *codingContext;
  OS_xpc_object *v7;
  BOOL v8;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (v4)
  {
    v5 = (const char *)v4;
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    v7 = codingContext;
    v8 = xpc_dictionary_get_BOOL(v7, v5);

    LOBYTE(v4) = v8;
  }
  return v4;
}

- (id)_finishCoding
{
  NSKeyedArchiver *archiver;
  void *v4;
  OS_xpc_object *message;
  id v6;
  NSKeyedArchiver *v7;

  if (RBSAtomicSetFlag(1u, (unsigned int *)&self->_finalized))
  {
    archiver = self->_archiver;
    if (archiver)
    {
      -[NSKeyedArchiver encodedData](archiver, "encodedData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "length"))
      {
        message = self->_message;
        v6 = objc_retainAutorelease(v4);
        xpc_dictionary_set_data(message, "bsx_archive", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
      }
      v7 = self->_archiver;
      self->_archiver = 0;

    }
  }
  return self->_message;
}

- (BOOL)containsValueForKey:(id)a3
{
  OS_xpc_object *codingContext;
  OS_xpc_object *v5;
  id v6;
  const char *v7;
  void *v8;

  codingContext = self->_codingContext;
  if (!codingContext)
    codingContext = self->_message;
  v5 = codingContext;
  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  RBSXPCDictionaryGetValue(v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (id)decodeCollectionOfClass:(Class)a3 containingClass:(Class)a4 forKey:(id)a5
{
  return _BSXPCDecodeObjectForKey(self, a5, a3, (uint64_t *)a4);
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  int64_t result;
  const char *v5;
  OS_xpc_object *codingContext;
  OS_xpc_object *v7;
  int64_t int64;

  result = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (result)
  {
    v5 = (const char *)result;
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    v7 = codingContext;
    int64 = xpc_dictionary_get_int64(v7, v5);

    return int64;
  }
  return result;
}

- (void)dealloc
{
  NSKeyedArchiver *archiver;
  NSKeyedArchiver *v4;
  NSKeyedUnarchiver *unarchiver;
  NSKeyedUnarchiver *v6;
  void *v8;
  objc_super v9;

  if (self->_codingContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSXPCCoder.m"), 114, CFSTR("cannot dealloc while the coding context is in flight"));

  }
  archiver = self->_archiver;
  if (archiver)
  {
    -[NSKeyedArchiver finishEncoding](archiver, "finishEncoding");
    v4 = self->_archiver;
    self->_archiver = 0;

  }
  unarchiver = self->_unarchiver;
  if (unarchiver)
  {
    -[NSKeyedUnarchiver finishDecoding](unarchiver, "finishDecoding");
    v6 = self->_unarchiver;
    self->_unarchiver = 0;

  }
  v9.receiver = self;
  v9.super_class = (Class)RBSXPCCoder;
  -[RBSXPCCoder dealloc](&v9, sel_dealloc);
}

- (id)decodeXPCObjectOfType:(_xpc_type_s *)a3 forKey:(id)a4
{
  id v6;
  id class4NSXPC;
  void *v8;

  v6 = a4;
  if (a3)
  {
    class4NSXPC = (id)xpc_get_class4NSXPC();
  }
  else
  {
    NSClassFromString(CFSTR("OS_xpc_object"));
    class4NSXPC = (id)objc_claimAutoreleasedReturnValue();
  }
  -[RBSXPCCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", class4NSXPC, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  return _BSXPCDecodeObjectForKey(self, a4, a3, 0);
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  uint64_t v6;
  const char *v7;
  OS_xpc_object *codingContext;
  OS_xpc_object *v9;

  v6 = objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  if (v6)
  {
    v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    v9 = codingContext;
    xpc_dictionary_set_int64(v9, v7, a3);

  }
}

- (RBSXPCCoder)init
{
  return -[RBSXPCCoder initWithMessage:](self, "initWithMessage:", 0);
}

- (void)encodeUInt64:(unint64_t)a3 forKey:(id)a4
{
  uint64_t v6;
  const char *v7;
  OS_xpc_object *codingContext;
  OS_xpc_object *v9;

  v6 = objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  if (v6)
  {
    v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    v9 = codingContext;
    xpc_dictionary_set_uint64(v9, v7, a3);

  }
}

- (void)encodeCollection:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (v9 && (_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSXPCCoder.m"), 148, CFSTR("Collection class %@ not supported"), objc_msgSend(v9, "classForCoder"));

  }
  -[RBSXPCCoder encodeObject:forKey:](self, "encodeObject:forKey:", v9, v7);

}

- (id)decodeDictionaryOfClass:(Class)a3 forKey:(id)a4
{
  id v6;
  objc_class *v7;
  void *v8;

  v6 = a4;
  v7 = (objc_class *)objc_opt_class();
  _BSXPCDecodeObjectForKey(self, v6, v7, (uint64_t *)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeDictionary:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  id v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = v12;
  v9 = v7;
  if (v12)
  {
    v10 = _NSIsNSDictionary();
    v8 = v12;
    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSXPCCoder.m"), 153, CFSTR("Object is not an NSDictionary"));

      v8 = v12;
    }
  }
  -[RBSXPCCoder encodeObject:forKey:](self, "encodeObject:forKey:", v8, v9);

}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  OS_xpc_object *codingContext;
  id v7;
  const char *v8;
  OS_xpc_object *v9;

  codingContext = self->_codingContext;
  if (!codingContext)
    codingContext = self->_message;
  v9 = codingContext;
  v7 = objc_retainAutorelease(a4);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");

  RBSSerializeDoubleToXPCDictionaryWithKey(v9, v8, a3);
}

- (double)decodeDoubleForKey:(id)a3
{
  OS_xpc_object *codingContext;
  OS_xpc_object *v5;
  id v6;
  const char *v7;
  double v8;

  codingContext = self->_codingContext;
  if (!codingContext)
    codingContext = self->_message;
  v5 = codingContext;
  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  v8 = RBSDeserializeDoubleFromXPCDictionaryWithKey(v5, v7);
  return v8;
}

+ (id)coder
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMessage:", 0);
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  uint64_t v6;
  const char *v7;
  OS_xpc_object *codingContext;
  OS_xpc_object *v9;

  v6 = objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  if (v6)
  {
    v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    v9 = codingContext;
    xpc_dictionary_set_BOOL(v9, v7, a3);

  }
}

- (void)_removeValueForKey:(id)a3
{
  OS_xpc_object *codingContext;
  OS_xpc_object *v5;
  id v6;
  const char *v7;
  OS_xpc_object *v8;
  void *v9;
  void *v10;
  void *v11;
  OS_xpc_object *xdict;

  if (a3)
  {
    codingContext = self->_codingContext;
    if (!codingContext)
      codingContext = self->_message;
    v5 = codingContext;
    v6 = objc_retainAutorelease(a3);
    v7 = (const char *)objc_msgSend(v6, "UTF8String");

    v8 = v5;
    xdict = v8;
    if (v7)
    {
      if (v8)
      {
        xpc_dictionary_get_value(v8, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          xpc_dictionary_set_value(xdict, v7, 0);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void RBSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable __strong, xpc_type_t _Nullable)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("RBSXPCUtilities_Project.h"), 123, CFSTR("key must not be nil"));

    }
  }
}

- (id)_implicitDecodeXPCObjectForKey:(id)a3
{
  OS_xpc_object *codingContext;
  OS_xpc_object *v5;
  id v6;
  const char *v7;
  void *v8;
  id v9;
  id v10;

  codingContext = self->_codingContext;
  if (!codingContext)
    codingContext = self->_message;
  v5 = codingContext;
  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  RBSXPCDictionaryGetValue(v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (NSClassFromString(CFSTR("OS_xpc_object")),
        v9 = (id)objc_claimAutoreleasedReturnValue(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSXPCCoder)initWithRBSXPCCoder:(id)a3
{
  void *v4;
  RBSXPCCoder *v5;

  objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("message"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RBSXPCCoder initWithMessage:](self, "initWithMessage:", v4);

  return v5;
}

- (OS_xpc_object)message
{
  return self->_message;
}

- (OS_xpc_object)XPCConnection
{
  return self->_xpcConnection;
}

+ (id)rbs_testEncode:(id)a3 andDecodeOfExpectedClass:(Class)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  +[RBSXPCCoder coder](RBSXPCCoder, "coder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("RBSUnitTesting"));

  objc_msgSend(v6, "createMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSXPCCoder coderWithMessage:](RBSXPCCoder, "coderWithMessage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "decodeObjectOfClass:forKey:", a4, CFSTR("RBSUnitTesting"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)rbs_testNSEncode:(id)a3 andDecodeOfExpectedClass:(Class)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B30], "_testEncodeAndDecodeObject:allowedClass:", a3, a4);
}

@end
