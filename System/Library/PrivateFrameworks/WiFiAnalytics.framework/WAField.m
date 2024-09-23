@implementation WAField

- (WAField)initWithType:(int64_t)a3 isRepeatable:(BOOL)a4 andKey:(id)a5 andTypeInfoForRepeatableSubmessage:(id)a6
{
  double v6;
  uint64_t v8;
  uint64_t v9;

  LODWORD(v6) = 0;
  LOBYTE(v9) = 0;
  LODWORD(v8) = 0;
  return -[WAField initWithType:isRepeatable:key:repeatableValues:doubleValue:floatValue:int32Value:int64Value:uint32Val:uint64Value:BOOLValue:stringValue:bytesValue:subMessageValue:andTypeInfoForRepeatableSubmessage:](self, "initWithType:isRepeatable:key:repeatableValues:doubleValue:floatValue:int32Value:int64Value:uint32Val:uint64Value:BOOLValue:stringValue:bytesValue:subMessageValue:andTypeInfoForRepeatableSubmessage:", a3, a4, a5, 0, 0, 0, 0.0, v6, v8, 0, v9, 0, 0, 0, a6);
}

- (WAField)initWithType:(int64_t)a3 isRepeatable:(BOOL)a4 key:(id)a5 repeatableValues:(id)a6 doubleValue:(double)a7 floatValue:(float)a8 int32Value:(int)a9 int64Value:(int64_t)a10 uint32Val:(unsigned int)a11 uint64Value:(unint64_t)a12 BOOLValue:(BOOL)a13 stringValue:(id)a14 bytesValue:(id)a15 subMessageValue:(id)a16 andTypeInfoForRepeatableSubmessage:(id)a17
{
  uint64_t v17;
  _BOOL4 v19;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  WAField *v29;
  WAField *v30;
  uint64_t v31;
  NSString *key;
  uint64_t v33;
  NSString *typeInfoForRepeatableSubmessage;
  double v35;
  void *v36;
  id v37;
  NSObject *p_super;
  uint64_t v39;
  void *v40;
  NSObject *v42;
  id v44;
  objc_super v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v17 = *(_QWORD *)&a9;
  v19 = a4;
  v50 = *MEMORY[0x24BDAC8D0];
  v24 = a5;
  v44 = a6;
  v25 = a14;
  v26 = a15;
  v27 = a16;
  v28 = a17;
  v45.receiver = self;
  v45.super_class = (Class)WAField;
  v29 = -[WAField init](&v45, sel_init);
  v30 = v29;
  if (!v29)
  {
    p_super = 0;
LABEL_21:
    v36 = v44;
    goto LABEL_22;
  }
  if (!a3 || !v24)
  {
    WALogCategoryDefaultHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v47 = "-[WAField initWithType:isRepeatable:key:repeatableValues:doubleValue:floatValue:int32Value:int64Value:uint32"
            "Val:uint64Value:BOOLValue:stringValue:bytesValue:subMessageValue:andTypeInfoForRepeatableSubmessage:]";
      v48 = 1024;
      v49 = 40;
      _os_log_impl(&dword_212581000, v42, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: didn't get required arguments", buf, 0x12u);
    }

    p_super = &v30->super;
    v30 = 0;
    goto LABEL_21;
  }
  v29->_type = a3;
  v29->_isRepeatable = v19;
  v31 = objc_msgSend(v24, "mutableCopy");
  key = v30->_key;
  v30->_key = (NSString *)v31;

  v33 = objc_msgSend(v28, "mutableCopy");
  typeInfoForRepeatableSubmessage = v30->_typeInfoForRepeatableSubmessage;
  v30->_typeInfoForRepeatableSubmessage = (NSString *)v33;

  if (!v19)
  {
    switch(a3)
    {
      case 1:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a7);
        v39 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 2:
        *(float *)&v35 = a8;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v35);
        v39 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 3:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
        v39 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 4:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a10);
        v39 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 5:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a11);
        v39 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 6:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a12);
        v39 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 7:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a13);
        v39 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 8:
        v40 = v25;
        goto LABEL_18;
      case 9:
        v40 = v26;
LABEL_18:
        v39 = objc_msgSend(v40, "mutableCopy", a10);
        goto LABEL_20;
      case 10:
        v39 = objc_msgSend(v27, "copy");
LABEL_20:
        p_super = v30->_value;
        v30->_value = (id)v39;
        break;
      default:
        WALogCategoryDefaultHandle();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v47 = "-[WAField initWithType:isRepeatable:key:repeatableValues:doubleValue:floatValue:int32Value:int64Value:ui"
                "nt32Val:uint64Value:BOOLValue:stringValue:bytesValue:subMessageValue:andTypeInfoForRepeatableSubmessage:]";
          v48 = 1024;
          v49 = 83;
          _os_log_impl(&dword_212581000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:[WAField init] Unhandled field type", buf, 0x12u);
        }
        break;
    }
    goto LABEL_21;
  }
  v36 = v44;
  v37 = v44;
  p_super = v30->_value;
  v30->_value = v37;
LABEL_22:

  return v30;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSMutableArray)repeatableValues
{
  id v3;

  if (-[WAField isRepeatable](self, "isRepeatable"))
    v3 = self->_value;
  else
    v3 = 0;
  return (NSMutableArray *)v3;
}

- (double)doubleValue
{
  double result;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 1)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
    {
      objc_msgSend(self->_value, "doubleValue");
      return result;
    }
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446722;
      v13 = "-[WAField doubleValue]";
      v14 = 1024;
      *(_DWORD *)v15 = 112;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v8;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single double value from a repeatable field (this field is a %@)", (uint8_t *)&v12, 0x1Cu);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 1, 1);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446978;
      v13 = "-[WAField doubleValue]";
      v14 = 1024;
      *(_DWORD *)v15 = 111;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get double value from field of wrong type (this field is a %@). Field key: %@", (uint8_t *)&v12, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 1, 1);
  }
  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    *(_QWORD *)v15 = v11;
    _os_log_fault_impl(&dword_212581000, v9, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v12, 0x16u);

  }
  return 0.0;
}

- (float)floatValue
{
  float result;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 2)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
    {
      objc_msgSend(self->_value, "floatValue");
      return result;
    }
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446722;
      v13 = "-[WAField floatValue]";
      v14 = 1024;
      *(_DWORD *)v15 = 121;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v8;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single float value from a repeatable field (this field is a %@)", (uint8_t *)&v12, 0x1Cu);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 1, 2);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446978;
      v13 = "-[WAField floatValue]";
      v14 = 1024;
      *(_DWORD *)v15 = 120;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get float value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v12, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 2, 1);
  }
  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    *(_QWORD *)v15 = v11;
    _os_log_fault_impl(&dword_212581000, v9, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v12, 0x16u);

  }
  return 0.0;
}

- (int)int32Value
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 3)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
      return objc_msgSend(self->_value, "intValue");
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446722;
      v13 = "-[WAField int32Value]";
      v14 = 1024;
      *(_DWORD *)v15 = 130;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v8;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single int32 value from a repeatable field (this field is a %@)", (uint8_t *)&v12, 0x1Cu);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 1, 5);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446978;
      v13 = "-[WAField int32Value]";
      v14 = 1024;
      *(_DWORD *)v15 = 129;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get int32 value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v12, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 3, 1);
  }
  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    *(_QWORD *)v15 = v11;
    _os_log_fault_impl(&dword_212581000, v9, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v12, 0x16u);

  }
  return 0;
}

- (int64_t)int64Value
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 4)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
      return objc_msgSend(self->_value, "longLongValue");
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446722;
      v13 = "-[WAField int64Value]";
      v14 = 1024;
      *(_DWORD *)v15 = 139;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v8;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single int64 value from a repeatable field (this field is a %@)", (uint8_t *)&v12, 0x1Cu);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 1, 4);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446978;
      v13 = "-[WAField int64Value]";
      v14 = 1024;
      *(_DWORD *)v15 = 138;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get int64 value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v12, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 4, 1);
  }
  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    *(_QWORD *)v15 = v11;
    _os_log_fault_impl(&dword_212581000, v9, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v12, 0x16u);

  }
  return 0;
}

- (unsigned)uint32Value
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 5)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
      return objc_msgSend(self->_value, "unsignedIntValue");
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446722;
      v13 = "-[WAField uint32Value]";
      v14 = 1024;
      *(_DWORD *)v15 = 148;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v8;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single uint32 value from a repeatable field (this field is a %@)", (uint8_t *)&v12, 0x1Cu);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 1, 5);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446978;
      v13 = "-[WAField uint32Value]";
      v14 = 1024;
      *(_DWORD *)v15 = 147;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get uint32 value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v12, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 5, 1);
  }
  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    *(_QWORD *)v15 = v11;
    _os_log_fault_impl(&dword_212581000, v9, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v12, 0x16u);

  }
  return 0;
}

- (unint64_t)uint64Value
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 6)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
      return objc_msgSend(self->_value, "unsignedLongLongValue");
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446722;
      v13 = "-[WAField uint64Value]";
      v14 = 1024;
      *(_DWORD *)v15 = 157;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v8;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single uint64 value from a repeatable field (this field is a %@)", (uint8_t *)&v12, 0x1Cu);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 1, 6);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446978;
      v13 = "-[WAField uint64Value]";
      v14 = 1024;
      *(_DWORD *)v15 = 156;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get uint64 value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v12, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 6, 1);
  }
  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    *(_QWORD *)v15 = v11;
    _os_log_fault_impl(&dword_212581000, v9, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v12, 0x16u);

  }
  return 0;
}

- (BOOL)BOOLValue
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 7)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
      return objc_msgSend(self->_value, "BOOLValue");
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446722;
      v13 = "-[WAField BOOLValue]";
      v14 = 1024;
      *(_DWORD *)v15 = 166;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v8;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single BOOL value from a repeatable field (this field is a %@)", (uint8_t *)&v12, 0x1Cu);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 1, 7);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446978;
      v13 = "-[WAField BOOLValue]";
      v14 = 1024;
      *(_DWORD *)v15 = 165;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get BOOL value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v12, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 7, 1);
  }
  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    *(_QWORD *)v15 = v11;
    _os_log_fault_impl(&dword_212581000, v9, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v12, 0x16u);

  }
  return 0;
}

- (NSString)stringValue
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 8)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
      return (NSString *)self->_value;
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446722;
      v13 = "-[WAField stringValue]";
      v14 = 1024;
      *(_DWORD *)v15 = 175;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v8;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single string value from a repeatable field (this field is a %@)", (uint8_t *)&v12, 0x1Cu);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 1, 8);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446978;
      v13 = "-[WAField stringValue]";
      v14 = 1024;
      *(_DWORD *)v15 = 174;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get string value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v12, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 8, 1);
  }
  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    *(_QWORD *)v15 = v11;
    _os_log_fault_impl(&dword_212581000, v9, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v12, 0x16u);

  }
  return (NSString *)0;
}

- (NSData)bytesValue
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 9)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
      return (NSData *)self->_value;
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446722;
      v13 = "-[WAField bytesValue]";
      v14 = 1024;
      *(_DWORD *)v15 = 184;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v8;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single bytes value from a repeatable field (this field is a %@)", (uint8_t *)&v12, 0x1Cu);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 1, 9);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446978;
      v13 = "-[WAField bytesValue]";
      v14 = 1024;
      *(_DWORD *)v15 = 183;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get bytes value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v12, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 9, 1);
  }
  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    *(_QWORD *)v15 = v11;
    _os_log_fault_impl(&dword_212581000, v9, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v12, 0x16u);

  }
  return (NSData *)0;
}

- (WAMessageAWD)subMessageValue
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 10)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
      return (WAMessageAWD *)self->_value;
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446722;
      v13 = "-[WAField subMessageValue]";
      v14 = 1024;
      *(_DWORD *)v15 = 193;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v8;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get a single submessage value from a repeatable field (this field is a %@)", (uint8_t *)&v12, 0x1Cu);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 1, 10);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446978;
      v13 = "-[WAField subMessageValue]";
      v14 = 1024;
      *(_DWORD *)v15 = 192;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to get submessage value from field of wrong type (this field is a %@) Field key: %@", (uint8_t *)&v12, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 10, 1);
  }
  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    *(_QWORD *)v15 = v11;
    _os_log_fault_impl(&dword_212581000, v9, OS_LOG_TYPE_FAULT, "Failed to properly access key %@ of type %@", (uint8_t *)&v12, 0x16u);

  }
  return (WAMessageAWD *)0;
}

- (void)setDoubleValue:(double)a3
{
  void *v5;
  id value;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BYTE v18[14];
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 1)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      value = self->_value;
      self->_value = v5;

      return;
    }
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136446978;
      v16 = "-[WAField setDoubleValue:]";
      v17 = 1024;
      *(_DWORD *)v18 = 202;
      *(_WORD *)&v18[4] = 2048;
      *(double *)&v18[6] = a3;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%f) on a repeatable field (%@). Ignored.", (uint8_t *)&v15, 0x26u);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 0, 1);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136446978;
      v16 = "-[WAField setDoubleValue:]";
      v17 = 1024;
      *(_DWORD *)v18 = 201;
      *(_WORD *)&v18[4] = 2112;
      *(_QWORD *)&v18[6] = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set double value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v15, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 1, 0);
  }
  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    *(_QWORD *)v18 = v14;
    _os_log_fault_impl(&dword_212581000, v12, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v15, 0x16u);

  }
}

- (void)setFloatValue:(float)a3
{
  double v5;
  void *v6;
  id value;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  _BYTE v19[14];
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 2)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
    {
      *(float *)&v5 = a3;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      value = self->_value;
      self->_value = v6;

      return;
    }
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136446978;
      v17 = "-[WAField setFloatValue:]";
      v18 = 1024;
      *(_DWORD *)v19 = 212;
      *(_WORD *)&v19[4] = 2048;
      *(double *)&v19[6] = a3;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%f) on a repeatable field (%@). Ignored.", (uint8_t *)&v16, 0x26u);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 0, 2);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136446978;
      v17 = "-[WAField setFloatValue:]";
      v18 = 1024;
      *(_DWORD *)v19 = 211;
      *(_WORD *)&v19[4] = 2112;
      *(_QWORD *)&v19[6] = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set float value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v16, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 2, 0);
  }
  WALogCategoryDefaultHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v14;
    v18 = 2112;
    *(_QWORD *)v19 = v15;
    _os_log_fault_impl(&dword_212581000, v13, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v16, 0x16u);

  }
}

- (void)setInt32Value:(int)a3
{
  uint64_t v3;
  void *v5;
  id value;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BYTE v18[24];
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 3)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      value = self->_value;
      self->_value = v5;

      return;
    }
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136446978;
      v16 = "-[WAField setInt32Value:]";
      v17 = 1024;
      *(_DWORD *)v18 = 222;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = v3;
      *(_WORD *)&v18[10] = 2112;
      *(_QWORD *)&v18[12] = v11;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%d) on a repeatable field (%@). Ignored.", (uint8_t *)&v15, 0x22u);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 0, 3);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136446978;
      v16 = "-[WAField setInt32Value:]";
      v17 = 1024;
      *(_DWORD *)v18 = 221;
      *(_WORD *)&v18[4] = 2112;
      *(_QWORD *)&v18[6] = v8;
      *(_WORD *)&v18[14] = 2112;
      *(_QWORD *)&v18[16] = v9;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set an int32 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v15, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 3, 0);
  }
  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    *(_QWORD *)v18 = v14;
    _os_log_fault_impl(&dword_212581000, v12, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v15, 0x16u);

  }
}

- (void)setInt64Value:(int64_t)a3
{
  void *v5;
  id value;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BYTE v18[14];
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 4)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      value = self->_value;
      self->_value = v5;

      return;
    }
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136446978;
      v16 = "-[WAField setInt64Value:]";
      v17 = 1024;
      *(_DWORD *)v18 = 232;
      *(_WORD *)&v18[4] = 2048;
      *(_QWORD *)&v18[6] = a3;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%lld) on a repeatable field (%@). Ignored.", (uint8_t *)&v15, 0x26u);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 0, 4);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136446978;
      v16 = "-[WAField setInt64Value:]";
      v17 = 1024;
      *(_DWORD *)v18 = 231;
      *(_WORD *)&v18[4] = 2112;
      *(_QWORD *)&v18[6] = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set an int64 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v15, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 4, 0);
  }
  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    *(_QWORD *)v18 = v14;
    _os_log_fault_impl(&dword_212581000, v12, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v15, 0x16u);

  }
}

- (void)setUint32Value:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  id value;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BYTE v18[24];
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 5)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      value = self->_value;
      self->_value = v5;

      return;
    }
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136446978;
      v16 = "-[WAField setUint32Value:]";
      v17 = 1024;
      *(_DWORD *)v18 = 241;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = v3;
      *(_WORD *)&v18[10] = 2112;
      *(_QWORD *)&v18[12] = v11;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%u) on a repeatable field (%@). Ignored.", (uint8_t *)&v15, 0x22u);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 0, 5);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136446978;
      v16 = "-[WAField setUint32Value:]";
      v17 = 1024;
      *(_DWORD *)v18 = 240;
      *(_WORD *)&v18[4] = 2112;
      *(_QWORD *)&v18[6] = v8;
      *(_WORD *)&v18[14] = 2112;
      *(_QWORD *)&v18[16] = v9;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set uint32 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v15, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 5, 0);
  }
  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    *(_QWORD *)v18 = v14;
    _os_log_fault_impl(&dword_212581000, v12, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v15, 0x16u);

  }
}

- (void)setUint64Value:(unint64_t)a3
{
  void *v5;
  id value;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BYTE v18[14];
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 6)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      value = self->_value;
      self->_value = v5;

      return;
    }
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136446978;
      v16 = "-[WAField setUint64Value:]";
      v17 = 1024;
      *(_DWORD *)v18 = 251;
      *(_WORD *)&v18[4] = 2048;
      *(_QWORD *)&v18[6] = a3;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%llu) on a repeatable field (%@). Ignored.", (uint8_t *)&v15, 0x26u);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 0, 6);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136446978;
      v16 = "-[WAField setUint64Value:]";
      v17 = 1024;
      *(_DWORD *)v18 = 250;
      *(_WORD *)&v18[4] = 2112;
      *(_QWORD *)&v18[6] = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set uint64 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v15, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 6, 0);
  }
  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    *(_QWORD *)v18 = v14;
    _os_log_fault_impl(&dword_212581000, v12, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v15, 0x16u);

  }
}

- (void)setBoolValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id value;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BYTE v18[24];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 7)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      value = self->_value;
      self->_value = v5;

      return;
    }
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136446978;
      v16 = "-[WAField setBoolValue:]";
      v17 = 1024;
      *(_DWORD *)v18 = 261;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = v3;
      *(_WORD *)&v18[10] = 2112;
      *(_QWORD *)&v18[12] = v11;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%d) on a repeatable field (%@). Ignored.", (uint8_t *)&v15, 0x22u);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 0, 7);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136446978;
      v16 = "-[WAField setBoolValue:]";
      v17 = 1024;
      *(_DWORD *)v18 = 260;
      *(_WORD *)&v18[4] = 2112;
      *(_QWORD *)&v18[6] = v8;
      *(_WORD *)&v18[14] = 2112;
      *(_QWORD *)&v18[16] = v9;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set BOOL value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v15, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 7, 0);
  }
  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    *(_QWORD *)v18 = v14;
    _os_log_fault_impl(&dword_212581000, v12, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v15, 0x16u);

  }
}

- (void)setStringValue:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  _BYTE v17[14];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (-[WAField type](self, "type") == 8)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
    {
      objc_storeStrong(&self->_value, a3);
      goto LABEL_4;
    }
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136446978;
      v15 = "-[WAField setStringValue:]";
      v16 = 1024;
      *(_DWORD *)v17 = 271;
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = v5;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%@) on a repeatable field (%@). Ignored.", (uint8_t *)&v14, 0x26u);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 0, 8);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136446978;
      v15 = "-[WAField setStringValue:]";
      v16 = 1024;
      *(_DWORD *)v17 = 270;
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set string value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v14, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 8, 0);
  }
  WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v12;
    v16 = 2112;
    *(_QWORD *)v17 = v13;
    _os_log_fault_impl(&dword_212581000, v11, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v14, 0x16u);

  }
LABEL_4:

}

- (void)setBytesValue:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  _BYTE v17[14];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (-[WAField type](self, "type") == 9)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
    {
      objc_storeStrong(&self->_value, a3);
      goto LABEL_4;
    }
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136446978;
      v15 = "-[WAField setBytesValue:]";
      v16 = 1024;
      *(_DWORD *)v17 = 281;
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = v5;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%@) on a repeatable field (%@). Ignored.", (uint8_t *)&v14, 0x26u);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 0, 9);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136446978;
      v15 = "-[WAField setBytesValue:]";
      v16 = 1024;
      *(_DWORD *)v17 = 280;
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set bytes value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v14, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 9, 0);
  }
  WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v12;
    v16 = 2112;
    *(_QWORD *)v17 = v13;
    _os_log_fault_impl(&dword_212581000, v11, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v14, 0x16u);

  }
LABEL_4:

}

- (void)setSubMessageValue:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  _BYTE v17[14];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (-[WAField type](self, "type") == 10)
  {
    if (!-[WAField isRepeatable](self, "isRepeatable"))
    {
      objc_storeStrong(&self->_value, a3);
      goto LABEL_4;
    }
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136446978;
      v15 = "-[WAField setSubMessageValue:]";
      v16 = 1024;
      *(_DWORD *)v17 = 291;
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = v5;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set a single value (%@) on a repeatable field (%@). Ignored.", (uint8_t *)&v14, 0x26u);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 0, 0, 10);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136446978;
      v15 = "-[WAField setSubMessageValue:]";
      v16 = 1024;
      *(_DWORD *)v17 = 290;
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set submessage value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v14, 0x26u);

    }
    -[WAField _throwIncorrecTypeExceptionForType:isGet:](self, "_throwIncorrecTypeExceptionForType:isGet:", 10, 0);
  }
  WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v12;
    v16 = 2112;
    *(_QWORD *)v17 = v13;
    _os_log_fault_impl(&dword_212581000, v11, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v14, 0x16u);

  }
LABEL_4:

}

- (void)setRepeatableValues:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (-[WAField isRepeatable](self, "isRepeatable"))
  {
    objc_storeStrong(&self->_value, a3);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446466;
      v11 = "-[WAField setRepeatableValues:]";
      v12 = 1024;
      LODWORD(v13) = 300;
      _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to set to set repeatable values on a field that's not repeatable. Ignored", (uint8_t *)&v10, 0x12u);
    }

    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 1, 0, 0);
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      -[WAField key](self, "key");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_fault_impl(&dword_212581000, v7, OS_LOG_TYPE_FAULT, "Failed to properly set key %@ of type %@", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)addRepeatableDoubleValue:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");

  }
  else
  {
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v13 = "-[WAField addRepeatableDoubleValue:]";
      v14 = 1024;
      *(_DWORD *)v15 = 309;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable double value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);

    }
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      -[WAField key](self, "key");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      *(_QWORD *)v15 = v10;
      _os_log_fault_impl(&dword_212581000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);

    }
  }
}

- (void)addRepeatableFloatValue:(float)a3
{
  double v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  _BYTE v16[14];
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 2)
  {
    *(float *)&v5 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");

  }
  else
  {
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v14 = "-[WAField addRepeatableFloatValue:]";
      v15 = 1024;
      *(_DWORD *)v16 = 318;
      *(_WORD *)&v16[4] = 2112;
      *(_QWORD *)&v16[6] = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable float value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);

    }
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      -[WAField key](self, "key");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v10;
      v15 = 2112;
      *(_QWORD *)v16 = v11;
      _os_log_fault_impl(&dword_212581000, v9, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);

    }
  }
}

- (void)addRepeatableInt32Value:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");

  }
  else
  {
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v13 = "-[WAField addRepeatableInt32Value:]";
      v14 = 1024;
      *(_DWORD *)v15 = 327;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable int32 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);

    }
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      -[WAField key](self, "key");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      *(_QWORD *)v15 = v10;
      _os_log_fault_impl(&dword_212581000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);

    }
  }
}

- (void)addRepeatableInt64Value:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");

  }
  else
  {
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v13 = "-[WAField addRepeatableInt64Value:]";
      v14 = 1024;
      *(_DWORD *)v15 = 336;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable int64 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);

    }
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      -[WAField key](self, "key");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      *(_QWORD *)v15 = v10;
      _os_log_fault_impl(&dword_212581000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);

    }
  }
}

- (void)addRepeatableUInt32Value:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");

  }
  else
  {
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v13 = "-[WAField addRepeatableUInt32Value:]";
      v14 = 1024;
      *(_DWORD *)v15 = 345;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable uint32 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);

    }
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      -[WAField key](self, "key");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      *(_QWORD *)v15 = v10;
      _os_log_fault_impl(&dword_212581000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);

    }
  }
}

- (void)addRepeatableUInt64Value:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");

  }
  else
  {
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v13 = "-[WAField addRepeatableUInt64Value:]";
      v14 = 1024;
      *(_DWORD *)v15 = 354;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable uint64 value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);

    }
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      -[WAField key](self, "key");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      *(_QWORD *)v15 = v10;
      _os_log_fault_impl(&dword_212581000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);

    }
  }
}

- (void)addRepeatableBoolValue:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  if (-[WAField type](self, "type") == 7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[WAField _addRepeatableValue:](self, "_addRepeatableValue:");

  }
  else
  {
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v13 = "-[WAField addRepeatableBoolValue:]";
      v14 = 1024;
      *(_DWORD *)v15 = 363;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable BOOL value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", buf, 0x26u);

    }
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      -[WAField key](self, "key");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      *(_QWORD *)v15 = v10;
      _os_log_fault_impl(&dword_212581000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", buf, 0x16u);

    }
  }
}

- (void)addRepeatableString:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  _BYTE v14[14];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    if (-[WAField type](self, "type") == 8)
    {
      -[WAField _addRepeatableValue:](self, "_addRepeatableValue:", v4);
      goto LABEL_4;
    }
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136446978;
      v12 = "-[WAField addRepeatableString:]";
      v13 = 1024;
      *(_DWORD *)v14 = 373;
      *(_WORD *)&v14[4] = 2112;
      *(_QWORD *)&v14[6] = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable string value on a WAField instance that's not of that type (type is %@). Set was ignored . Field key: %@", (uint8_t *)&v11, 0x26u);

      goto LABEL_9;
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136446722;
      v12 = "-[WAField addRepeatableString:]";
      v13 = 1024;
      *(_DWORD *)v14 = 372;
      *(_WORD *)&v14[4] = 2112;
      *(_QWORD *)&v14[6] = v6;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add nil string value - preventing crash by bailing but DATA LOSS HAS LIKELY OCCURRED as the caller meant to add something. Field key: %@", (uint8_t *)&v11, 0x1Cu);
LABEL_9:

    }
  }

  WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    *(_QWORD *)v14 = v10;
    _os_log_fault_impl(&dword_212581000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", (uint8_t *)&v11, 0x16u);

  }
LABEL_4:

}

- (void)addRepeatableBytes:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  _BYTE v14[14];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    if (-[WAField type](self, "type") == 9)
    {
      -[WAField _addRepeatableValue:](self, "_addRepeatableValue:", v4);
      goto LABEL_4;
    }
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136446978;
      v12 = "-[WAField addRepeatableBytes:]";
      v13 = 1024;
      *(_DWORD *)v14 = 383;
      *(_WORD *)&v14[4] = 2112;
      *(_QWORD *)&v14[6] = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable bytes value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v11, 0x26u);

      goto LABEL_9;
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136446722;
      v12 = "-[WAField addRepeatableBytes:]";
      v13 = 1024;
      *(_DWORD *)v14 = 382;
      *(_WORD *)&v14[4] = 2112;
      *(_QWORD *)&v14[6] = v6;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add nil bytes value - preventing crash by bailing but DATA LOSS HAS LIKELY OCCURRED as the caller meant to add something. Field key: %@", (uint8_t *)&v11, 0x1Cu);
LABEL_9:

    }
  }

  WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    *(_QWORD *)v14 = v10;
    _os_log_fault_impl(&dword_212581000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", (uint8_t *)&v11, 0x16u);

  }
LABEL_4:

}

- (void)addRepeatableSubMessageValue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  _BYTE v14[14];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    if (-[WAField type](self, "type") == 10)
    {
      -[WAField _addRepeatableValue:](self, "_addRepeatableValue:", v4);
      goto LABEL_4;
    }
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAField key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136446978;
      v12 = "-[WAField addRepeatableSubMessageValue:]";
      v13 = 1024;
      *(_DWORD *)v14 = 393;
      *(_WORD *)&v14[4] = 2112;
      *(_QWORD *)&v14[6] = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable submessage value on a WAField instance that's not of that type (type is %@). Set was ignored. Field key: %@", (uint8_t *)&v11, 0x26u);

      goto LABEL_9;
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136446722;
      v12 = "-[WAField addRepeatableSubMessageValue:]";
      v13 = 1024;
      *(_DWORD *)v14 = 392;
      *(_WORD *)&v14[4] = 2112;
      *(_QWORD *)&v14[6] = v6;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add nil submessage value - preventing crash by bailing but DATA LOSS HAS LIKELY OCCURRED as the caller meant to add something. Field key: %@", (uint8_t *)&v11, 0x1Cu);
LABEL_9:

    }
  }

  WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    -[WAField key](self, "key");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    -[WAField _ownTypeAsString](self, "_ownTypeAsString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    *(_QWORD *)v14 = v10;
    _os_log_fault_impl(&dword_212581000, v8, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", (uint8_t *)&v11, 0x16u);

  }
LABEL_4:

}

- (void)_addRepeatableValue:(id)a3
{
  id v4;
  id v5;
  id value;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _WORD v15[17];

  *(_QWORD *)&v15[13] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WAField isRepeatable](self, "isRepeatable"))
  {
    if (!self->_value || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      value = self->_value;
      self->_value = v5;

    }
    objc_msgSend(self->_value, "addObject:", v4);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WAField key](self, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136446722;
      v13 = "-[WAField _addRepeatableValue:]";
      v14 = 1024;
      *(_DWORD *)v15 = 402;
      v15[2] = 2112;
      *(_QWORD *)&v15[3] = v8;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to add a repeatable values to a field that's not repeatable. This action was ignored. Key: %@", (uint8_t *)&v12, 0x1Cu);

    }
    -[WAField _throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:](self, "_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:isGet:forType:", 1, 0, 0);
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      -[WAField key](self, "key");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      -[WAField _ownTypeAsString](self, "_ownTypeAsString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      *(_QWORD *)v15 = v11;
      _os_log_fault_impl(&dword_212581000, v9, OS_LOG_TYPE_FAULT, "Failed to properly add key %@ of type %@", (uint8_t *)&v12, 0x16u);

    }
  }

}

- (WAField)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Please use the init defined in the header for this class"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v20 = (void *)MEMORY[0x24BDD1620];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;
  v21 = v15;
  objc_msgSend(v20, "unarchivedObjectOfClasses:fromData:error:", v13, v14, &v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v21;

  if (v17)
  {
    WALogCategoryDefaultHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v24 = "-[WAField copyWithZone:]";
      v25 = 1024;
      v26 = 420;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAMessageAWD copyWithZone failed, unarchive/archive error: %@", buf, 0x1Cu);
    }

  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *typeInfoForRepeatableSubmessage;
  id value;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isRepeatable, CFSTR("_isRepeatable"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_key, CFSTR("_key"));
  typeInfoForRepeatableSubmessage = self->_typeInfoForRepeatableSubmessage;
  if (typeInfoForRepeatableSubmessage)
    objc_msgSend(v6, "encodeObject:forKey:", typeInfoForRepeatableSubmessage, CFSTR("_typeInfoForRepeatableSubmessage"));
  value = self->_value;
  if (value)
    objc_msgSend(v6, "encodeObject:forKey:", value, CFSTR("_value"));

}

- (WAField)initWithCoder:(id)a3
{
  id v4;
  WAField *v5;
  uint64_t v6;
  NSString *key;
  uint64_t v8;
  NSString *typeInfoForRepeatableSubmessage;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  id value;
  uint64_t v21;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WAField;
  v5 = -[WAField init](&v24, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    v5->_isRepeatable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isRepeatable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_key"));
    v6 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_typeInfoForRepeatableSubmessage"));
    v8 = objc_claimAutoreleasedReturnValue();
    typeInfoForRepeatableSubmessage = v5->_typeInfoForRepeatableSubmessage;
    v5->_typeInfoForRepeatableSubmessage = (NSString *)v8;

    if (v5->_isRepeatable)
    {
      v23 = (void *)MEMORY[0x24BDBCF20];
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      v14 = objc_opt_class();
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      objc_msgSend(v23, "setWithObjects:", v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("_value"));
      v19 = objc_claimAutoreleasedReturnValue();
      value = v5->_value;
      v5->_value = (id)v19;

    }
    else
    {
      switch(-[WAField type](v5, "type"))
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_value"));
          v21 = objc_claimAutoreleasedReturnValue();
          v18 = v5->_value;
          v5->_value = (id)v21;
          break;
        default:
          WALogCategoryDefaultHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v26 = "-[WAField initWithCoder:]";
            v27 = 1024;
            v28 = 472;
            _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: unexpected type", buf, 0x12u);
          }
          break;
      }
    }

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  void *v10;
  int v11;
  int v12;
  unint64_t v13;
  _BOOL4 v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  int64_t v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  _BOOL4 v31;
  int64_t v32;
  void *v33;
  _BOOL4 v34;
  uint64_t v35;
  void *v36;
  _BOOL4 v37;
  uint64_t v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  uint64_t v45;
  void *v46;
  _BOOL4 v47;
  uint64_t v48;
  void *v49;
  _BOOL4 v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  uint8_t buf[4];
  const char *v87;
  __int16 v88;
  int v89;
  __int16 v90;
  int64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  if (!-[WAField type](self, "type"))
    return CFSTR("No type, likely not initialized");
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAField key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAField _ownTypeAsString](self, "_ownTypeAsString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ - %@: "), v4, v5);

  if (-[WAField isRepeatable](self, "isRepeatable"))
  {
    -[WAField repeatableValues](self, "repeatableValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
      v8 = CFSTR("[\r");
    else
      v8 = CFSTR("[]");
    objc_msgSend(v3, "appendString:", v8);
  }
  v9 = 0;
  while (1)
  {
    if (-[WAField isRepeatable](self, "isRepeatable"))
    {
      -[WAField repeatableValues](self, "repeatableValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      v12 = v11 >= 10 ? 10 : v11;
      v13 = v12;
    }
    else
    {
      v13 = 1;
    }
    v14 = -[WAField isRepeatable](self, "isRepeatable");
    if (v9 >= v13)
      break;
    if (v14)
      objc_msgSend(v3, "appendString:", CFSTR("          "));
    switch(-[WAField type](self, "type"))
    {
      case 1:
        v15 = (void *)MEMORY[0x24BDD17C8];
        v16 = -[WAField isRepeatable](self, "isRepeatable");
        v17 = self;
        if (v16)
        {
          -[WAField repeatableValues](self, "repeatableValues");
          v85 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v85, "objectAtIndexedSubscript:", v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v17;
        }
        objc_msgSend(v17, "doubleValue");
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%f"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v19);

        if (v16)
        {

          v20 = v85;
          goto LABEL_70;
        }
        goto LABEL_71;
      case 2:
        v22 = (void *)MEMORY[0x24BDD17C8];
        v23 = -[WAField isRepeatable](self, "isRepeatable");
        v24 = self;
        if (v23)
        {
          -[WAField repeatableValues](self, "repeatableValues");
          v84 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v84, "objectAtIndexedSubscript:", v9);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = v24;
        }
        objc_msgSend(v24, "floatValue");
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%f"), v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v26);

        if (v23)
        {

          v20 = v84;
          goto LABEL_70;
        }
        goto LABEL_71;
      case 3:
        v27 = (void *)MEMORY[0x24BDD17C8];
        v28 = -[WAField isRepeatable](self, "isRepeatable");
        if (v28)
        {
          -[WAField repeatableValues](self, "repeatableValues");
          v83 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v83, "objectAtIndexedSubscript:", v9);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v78, "intValue");
        }
        else
        {
          v29 = -[WAField int32Value](self, "int32Value");
        }
        objc_msgSend(v27, "stringWithFormat:", CFSTR("%d"), v29);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v52);

        if (v28)
        {

          v20 = v83;
          goto LABEL_70;
        }
        goto LABEL_71;
      case 4:
        v30 = (void *)MEMORY[0x24BDD17C8];
        v31 = -[WAField isRepeatable](self, "isRepeatable");
        if (v31)
        {
          -[WAField repeatableValues](self, "repeatableValues");
          v82 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v82, "objectAtIndexedSubscript:", v9);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (int)objc_msgSend(v75, "intValue");
        }
        else
        {
          v32 = -[WAField int64Value](self, "int64Value");
        }
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%lld"), v32);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v53);

        if (v31)
        {

          v20 = v82;
          goto LABEL_70;
        }
        goto LABEL_71;
      case 5:
        v33 = (void *)MEMORY[0x24BDD17C8];
        v34 = -[WAField isRepeatable](self, "isRepeatable");
        if (v34)
        {
          -[WAField repeatableValues](self, "repeatableValues");
          v81 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v81, "objectAtIndexedSubscript:", v9);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v73, "unsignedIntValue");
        }
        else
        {
          v35 = -[WAField uint32Value](self, "uint32Value");
        }
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%u"), v35);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v54);

        if (v34)
        {

          v20 = v81;
          goto LABEL_70;
        }
        goto LABEL_71;
      case 6:
        v36 = (void *)MEMORY[0x24BDD17C8];
        v37 = -[WAField isRepeatable](self, "isRepeatable");
        if (v37)
        {
          -[WAField repeatableValues](self, "repeatableValues");
          v80 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v80, "objectAtIndexedSubscript:", v9);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v71, "unsignedLongLongValue");
        }
        else
        {
          v38 = -[WAField uint64Value](self, "uint64Value");
        }
        objc_msgSend(v36, "stringWithFormat:", CFSTR("%llu"), v38);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v55);

        if (v37)
        {

          v20 = v80;
          goto LABEL_70;
        }
        goto LABEL_71;
      case 7:
        v39 = (void *)MEMORY[0x24BDD17C8];
        v40 = -[WAField isRepeatable](self, "isRepeatable");
        v41 = self;
        if (v40)
        {
          -[WAField repeatableValues](self, "repeatableValues");
          v77 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v77, "objectAtIndexedSubscript:", v9);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v41;
        }
        objc_msgSend(v39, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v41, "BOOLValue"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v42);

        if (v40)
        {

          v20 = v77;
          goto LABEL_70;
        }
        goto LABEL_71;
      case 8:
        v43 = (void *)MEMORY[0x24BDD17C8];
        v44 = -[WAField isRepeatable](self, "isRepeatable");
        if (v44)
        {
          -[WAField repeatableValues](self, "repeatableValues");
          v74 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v74, "objectAtIndexedSubscript:", v9);
          v45 = objc_claimAutoreleasedReturnValue();
          v66 = (void *)v45;
        }
        else
        {
          -[WAField stringValue](self, "stringValue");
          v45 = objc_claimAutoreleasedReturnValue();
          v69 = v45;
        }
        objc_msgSend(v43, "stringWithFormat:", CFSTR("%@"), v45);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v56);

        if (v44)
        {

          v20 = v74;
        }
        else
        {
          v20 = v69;
        }
        goto LABEL_70;
      case 9:
        v46 = (void *)MEMORY[0x24BDD17C8];
        v47 = -[WAField isRepeatable](self, "isRepeatable");
        if (v47)
        {
          -[WAField repeatableValues](self, "repeatableValues");
          v72 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v72, "objectAtIndexedSubscript:", v9);
          v48 = objc_claimAutoreleasedReturnValue();
          v64 = (void *)v48;
        }
        else
        {
          -[WAField bytesValue](self, "bytesValue");
          v48 = objc_claimAutoreleasedReturnValue();
          v67 = v48;
        }
        objc_msgSend(v46, "stringWithFormat:", CFSTR("%@"), v48);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v57);

        if (v47)
        {

          v20 = v72;
        }
        else
        {
          v20 = v67;
        }
        goto LABEL_70;
      case 10:
        v49 = (void *)MEMORY[0x24BDD17C8];
        v50 = -[WAField isRepeatable](self, "isRepeatable");
        if (v50)
        {
          -[WAField repeatableValues](self, "repeatableValues");
          v70 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v70, "objectAtIndexedSubscript:", v9);
          v51 = objc_claimAutoreleasedReturnValue();
          v63 = (void *)v51;
        }
        else
        {
          -[WAField subMessageValue](self, "subMessageValue");
          v51 = objc_claimAutoreleasedReturnValue();
          v65 = v51;
        }
        objc_msgSend(v49, "stringWithFormat:", CFSTR("%@"), v51);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v58);

        if (v50)
        {

          v20 = v70;
        }
        else
        {
          v20 = v65;
        }
        goto LABEL_70;
      default:
        WALogCategoryDefaultHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = -[WAField type](self, "type");
          *(_DWORD *)buf = 136446722;
          v87 = "-[WAField description]";
          v88 = 1024;
          v89 = 542;
          v90 = 2048;
          v91 = v21;
          _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: Unhandled type: %ld", buf, 0x1Cu);
        }
LABEL_70:

LABEL_71:
        if (-[WAField isRepeatable](self, "isRepeatable"))
          objc_msgSend(v3, "appendString:", CFSTR(",\r"));
        if (v9 == 9)
          objc_msgSend(v3, "appendString:", CFSTR("          ...\r"));
        ++v9;
        break;
    }
  }
  if (v14)
  {
    -[WAField repeatableValues](self, "repeatableValues");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "count");

    if (v60)
      objc_msgSend(v3, "appendString:", CFSTR("     ]"));
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  return v61;
}

- (id)_typeAsString:(int64_t)a3
{
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0:
      v6 = CFSTR("[NO TYPE INFO]");
      goto LABEL_15;
    case 1:
      v6 = CFSTR("double");
      goto LABEL_15;
    case 2:
      v6 = CFSTR("float");
      goto LABEL_15;
    case 3:
      v6 = CFSTR("int32");
      goto LABEL_15;
    case 4:
      v6 = CFSTR("int64");
      goto LABEL_15;
    case 5:
      v6 = CFSTR("uint32");
      goto LABEL_15;
    case 6:
      v6 = CFSTR("uint64");
      goto LABEL_15;
    case 7:
      v6 = CFSTR("BOOL");
      goto LABEL_15;
    case 8:
      v6 = CFSTR("string");
      goto LABEL_15;
    case 9:
      v6 = CFSTR("bytes");
      goto LABEL_15;
    case 10:
      if (-[WAField isRepeatable](self, "isRepeatable"))
      {
        -[NSString componentsSeparatedByString:](self->_typeInfoForRepeatableSubmessage, "componentsSeparatedByString:", CFSTR("^^"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      if (-[WAField isRepeatable](self, "isRepeatable"))
      {
        -[WAField repeatableValues](self, "repeatableValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x24BDD17C8];
        if (v11)
        {
          -[WAField repeatableValues](self, "repeatableValues");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "key");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[WAField repeatableValues](self, "repeatableValues");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("Repeatable submessage with key: %@, count: %lu"), v15, objc_msgSend(v16, "count"), v18);
        }
        else
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[WAField repeatableValues](self, "repeatableValues");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("Repeatable submessage, key: %@ original classname: %@ first instance: %@"), v13, v14, v16);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("%@"), v17);

      }
      else
      {
        -[WAField subMessageValue](self, "subMessageValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "key");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("%@"), v11);
      }

      return v5;
    default:
      WALogCategoryDefaultHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v20 = "-[WAField _typeAsString:]";
        v21 = 1024;
        v22 = 600;
        v23 = 2048;
        v24 = -[WAField type](self, "type");
        _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: Unhandled type: %ld", buf, 0x1Cu);
      }

      v6 = CFSTR("[UNDETERMINED TYPE]");
LABEL_15:
      objc_msgSend(v5, "appendString:", v6);
      return v5;
  }
}

- (id)_ownTypeAsString
{
  return -[WAField _typeAsString:](self, "_typeAsString:", -[WAField type](self, "type"));
}

- (void)_throwIncorrecTypeExceptionForType:(int64_t)a3 isGet:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  if (a4)
    v8 = CFSTR("GET");
  else
    v8 = CFSTR("SET");
  -[WAField _typeAsString:](self, "_typeAsString:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAField _ownTypeAsString](self, "_ownTypeAsString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAField key](self, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Attempt to %@ %@ value on a field that's a %@. Field Key: %@"), v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)_throwIncorrectRepeatableStateExceptionAsFieldShouldBeRepeatable:(BOOL)a3 isGet:(BOOL)a4 forType:(int64_t)a5
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  v7 = (void *)MEMORY[0x24BDBCE88];
  v8 = *MEMORY[0x24BDBCAB0];
  v9 = (void *)MEMORY[0x24BDD17C8];
  if (a4)
    v10 = CFSTR("GET");
  else
    v10 = CFSTR("SET");
  -[WAField _typeAsString:](self, "_typeAsString:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAField key](self, "key");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v5)
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Attempt to %@ a single value on a field that holds repeatable values. Type: %@ field key: %@"), v10, v11, v12);
  else
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Attempt to %@ a repeatable value on a field that should contain a single value. Type: %@ field key: %@"), v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v14, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v15);
}

- (BOOL)isNumerical
{
  return (unint64_t)(-[WAField type](self, "type") - 1) < 7;
}

- (void)setTypeInformationForRepeatableSubmessage:(id)a3
{
  objc_storeStrong((id *)&self->_typeInfoForRepeatableSubmessage, a3);
}

- (id)typeInformationForRepeatableSubmessage
{
  return self->_typeInfoForRepeatableSubmessage;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)isRepeatable
{
  return self->_isRepeatable;
}

- (void)setIsRepeatable:(BOOL)a3
{
  self->_isRepeatable = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_typeInfoForRepeatableSubmessage, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
