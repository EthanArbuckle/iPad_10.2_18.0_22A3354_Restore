@implementation UVRawXPCDecoder

- (UVRawXPCDecoder)initWithXpcDictionary:(id)a3
{
  id v5;
  UVRawXPCDecoder *v6;
  UVRawXPCDecoder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UVRawXPCDecoder;
  v6 = -[UVRawXPCDecoder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dictionary, a3);

  return v7;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  void *data;
  void *v5;
  id v6;
  size_t length;

  length = 0;
  data = (void *)xpc_dictionary_get_data(self->_dictionary, (const char *)objc_msgSend(CFSTR("data"), "UTF8String", a3, a4), &length);
  if (data)
  {
    v5 = data;
    v6 = objc_alloc(MEMORY[0x24BDBCE50]);
    data = (void *)objc_msgSend(v6, "initWithBytes:length:", v5, length);
  }
  return data;
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
