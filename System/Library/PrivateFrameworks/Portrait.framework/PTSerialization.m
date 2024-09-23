@implementation PTSerialization

+ (BOOL)registerSerializationClass:(Class)a3
{
  char v4;
  NSObject *v5;

  v4 = -[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EF912780);
  if ((v4 & 1) != 0)
  {
    -[objc_class registerForSerialization](a3, "registerForSerialization");
  }
  else
  {
    _PTLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[PTSerialization registerSerializationClass:].cold.1(a3, v5);

  }
  return v4;
}

+ (BOOL)isValidObject:(id)a3
{
  return objc_msgSend(a3, "conformsToProtocol:", &unk_1EF912780);
}

+ (unint64_t)sizeOfSerializedObject:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "isValidObject:", v6))
    v8 = objc_msgSend(v6, "sizeOfSerializedObjectWithOptions:", v7);
  else
    v8 = 0;

  return v8;
}

+ (id)objectFromData:(id)a3 error:(id *)a4
{
  id v6;
  PTDataByteStream *v7;
  PTAtomStream *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = -[PTDataByteStream initWithData:]([PTDataByteStream alloc], "initWithData:", v6);

  v8 = -[PTAtomStream initWithByteStream:]([PTAtomStream alloc], "initWithByteStream:", v7);
  -[PTAtomStream error](v8, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 || (v10 = (void *)objc_msgSend(a1, "classForType:", -[PTAtomStream atomType](v8, "atomType"))) == 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v10, "objectFromAtomStream:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PTAtomStream error](v8, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1, "_errorFromAtomStream:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11)
    {
      v14 = 0;
      goto LABEL_11;
    }
    objc_msgSend(a1, "_errorNotSerializable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  if (a4 && v13)
  {
    v14 = objc_retainAutorelease(v13);
    *a4 = v14;
  }
LABEL_11:

  return v11;
}

+ (id)dataFromObject:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  LODWORD(a5) = objc_msgSend(a1, "writeObject:toData:options:error:", v9, v10, v8, a5);

  if ((_DWORD)a5)
    v11 = (void *)objc_msgSend(v10, "copy");
  else
    v11 = 0;

  return v11;
}

+ (BOOL)_supportedOptions:(id)a3 forObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PTSerializationVersionKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PTSerializationVersionKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    v10 = objc_msgSend(v6, "supportsVersion:", v9);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

+ (BOOL)writeObject:(id)a3 toData:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  PTDataByteWriter *v13;
  PTAtomWriter *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(a1, "isValidObject:", v10) & 1) != 0)
  {
    if ((objc_msgSend(a1, "_supportedOptions:forObject:", v12, v10) & 1) != 0)
    {
      v13 = -[PTDataByteWriter initWithMutableData:]([PTDataByteWriter alloc], "initWithMutableData:", v11);
      v14 = -[PTAtomWriter initWithByteWriter:]([PTAtomWriter alloc], "initWithByteWriter:", v13);
      objc_msgSend(v10, "writeToAtomWriter:options:", v14, v12);
      v15 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "_errorUnsupportedVersion");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_errorNotSerializable");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v16;
  v14 = 0;
  v13 = 0;
LABEL_7:
  -[PTAtomWriter error](v14, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(a1, "_errorFromAtomWriter:", v14);
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v18;
  }
  if (a6 && v15)
    *a6 = objc_retainAutorelease(v15);

  return v15 == 0;
}

+ (void)registerTypeInfo:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  _PTLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[PTSerialization registerTypeInfo:].cold.1(v3, v4);

  os_unfair_lock_lock((os_unfair_lock_t)&sInfoForTypeLock);
  v5 = (void *)sInfoForType;
  if (!sInfoForType)
  {
    v6 = objc_opt_new();
    v7 = (void *)sInfoForType;
    sInfoForType = v6;

    v5 = (void *)sInfoForType;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, v8);

  os_unfair_lock_unlock((os_unfair_lock_t)&sInfoForTypeLock);
}

+ (id)infoForType:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  os_unfair_lock_lock((os_unfair_lock_t)&sInfoForTypeLock);
  v4 = (void *)sInfoForType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&sInfoForTypeLock);
  return v6;
}

+ (Class)classForType:(unsigned int)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "infoForType:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "providerClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

+ (void)registerType:(unsigned int)a3 providerClass:(Class)a4
{
  PTSerializationTypeInfo *v5;

  v5 = -[PTSerializationTypeInfo initWithType:providerClass:]([PTSerializationTypeInfo alloc], "initWithType:providerClass:", *(_QWORD *)&a3, a4);
  objc_msgSend(a1, "registerTypeInfo:", v5);

}

+ (id)_errorUnsupportedVersion
{
  return (id)objc_msgSend(a1, "_errorWithCode:", 1);
}

+ (id)_errorNotSerializable
{
  return (id)objc_msgSend(a1, "_errorWithCode:", 2);
}

+ (id)_errorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.portrait.serialization"), a3, 0);
}

+ (id)_errorFromAtomWriter:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_errorFromAtomError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_errorFromAtomStream:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_errorFromAtomError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_errorFromAtomError:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "code");
  if (v4)
  {
    objc_msgSend(a1, "_errorWithCode:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (void)registerSerializationClass:(objc_class *)a1 .cold.1(objc_class *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "attempt to register class %@ for serialization that does not support PTSerialization protocol", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1_1();
}

+ (void)registerTypeInfo:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromFourCharCode(objc_msgSend(a1, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1C9281000, a2, OS_LOG_TYPE_DEBUG, "registering atom type %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1_1();
}

@end
