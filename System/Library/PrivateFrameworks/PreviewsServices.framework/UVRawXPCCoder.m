@implementation UVRawXPCCoder

- (UVRawXPCCoder)initWithXpcDictionary:(id)a3
{
  id v5;
  UVRawXPCCoder *v6;
  UVRawXPCCoder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UVRawXPCCoder;
  v6 = -[UVRawXPCCoder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dictionary, a3);

  return v7;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  OS_xpc_object *dictionary;
  id v5;
  const char *v6;
  id v7;
  const void *v8;
  size_t v9;

  dictionary = self->_dictionary;
  v5 = a3;
  v6 = (const char *)objc_msgSend(CFSTR("data"), "UTF8String");
  v7 = objc_retainAutorelease(v5);
  v8 = (const void *)objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  xpc_dictionary_set_data(dictionary, v6, v8, v9);
}

- (OS_xpc_object)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
