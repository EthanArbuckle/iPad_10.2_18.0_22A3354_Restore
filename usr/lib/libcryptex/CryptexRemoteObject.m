@implementation CryptexRemoteObject

- (CryptexRemoteObject)initWithDesc:(id)a3
{
  id v4;
  CryptexRemoteObject *v5;
  const char *string;
  char *v7;
  const char *v8;
  char *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CryptexRemoteObject;
  v5 = -[CryptexRemoteObject init](&v11, sel_init);
  string = xpc_dictionary_get_string(v4, "remote-cryptex-identifier");
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v7 = strdup(string);
      if (v7)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v7 = strdup(string);
    if (!v7)
      -[CryptexRemoteObject initWithDesc:].cold.1(string);
  }
  v5->_identifier = v7;
  v8 = xpc_dictionary_get_string(v4, "remote-cryptex-version");
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v9 = strdup(v8);
      if (v9)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v9 = strdup(v8);
    if (!v9)
      -[CryptexRemoteObject initWithDesc:].cold.1(v8);
  }
  v5->_version = v9;

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_identifier);
  self->_identifier = 0;
  free(self->_version);
  self->_version = 0;
  v3.receiver = self;
  v3.super_class = (Class)CryptexRemoteObject;
  -[CryptexRemoteObject dealloc](&v3, sel_dealloc);
}

- (char)identifier
{
  return self->_identifier;
}

- (char)version
{
  return self->_version;
}

- (void)initWithDesc:(const char *)a1 .cold.1(const char *a1)
{
  _QWORD *v1;
  _OWORD *v2;
  int *v3;

  OUTLINED_FUNCTION_7_0(a1);
  *v1 = 0;
  *v2 = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  OUTLINED_FUNCTION_2_0();
  v3 = __error();
  OUTLINED_FUNCTION_4(v3);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

@end
