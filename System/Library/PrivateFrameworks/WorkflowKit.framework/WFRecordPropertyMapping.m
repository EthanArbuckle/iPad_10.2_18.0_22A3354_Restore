@implementation WFRecordPropertyMapping

- (WFRecordPropertyMapping)initWithSourceObject:(id)a3 property:(id)a4 destinationObject:(id)a5 property:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFRecordPropertyMapping *v15;
  WFRecordPropertyMapping *v16;
  WFRecordPropertyMapping *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRecordPropertyMapping.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceObject"));

    if (v12)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRecordPropertyMapping.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationObject"));

      if (v14)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRecordPropertyMapping.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceProperty"));

  if (!v13)
    goto LABEL_10;
LABEL_4:
  if (v14)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRecordPropertyMapping.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationProperty"));

LABEL_5:
  v23.receiver = self;
  v23.super_class = (Class)WFRecordPropertyMapping;
  v15 = -[WFRecordPropertyMapping init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak(&v15->_sourceObject, v11);
    objc_storeStrong((id *)&v16->_sourceProperty, a4);
    objc_storeWeak(&v16->_destinationObject, v13);
    objc_storeStrong((id *)&v16->_destinationProperty, a6);
    v17 = v16;
  }

  return v16;
}

- (void)propagate
{
  -[WFRecordPropertyMapping propagate:](self, "propagate:", 0);
}

- (void)propagate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[WFRecordPropertyMapping destinationProperty](self, "destinationProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFRecordPropertyMapping propagateUsingSetter](self, "propagateUsingSetter");
  }
  else if (v3)
  {
    -[WFRecordPropertyMapping propagateUsingKVC](self, "propagateUsingKVC");
  }
}

- (void)propagateUsingKVC
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[WFRecordPropertyMapping sourceObject](self, "sourceObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecordPropertyMapping sourceProperty](self, "sourceProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFRecordPropertyMapping destinationObject](self, "destinationObject");
    v7 = objc_claimAutoreleasedReturnValue();
    -[WFRecordPropertyMapping destinationProperty](self, "destinationProperty");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setValue:forKey:](v7, "setValue:forKey:", v6, v9);

  }
  else
  {
    getWFWFRecordPropertyLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      -[WFRecordPropertyMapping sourceProperty](self, "sourceProperty");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRecordPropertyMapping sourceObject](self, "sourceObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "-[WFRecordPropertyMapping propagateUsingKVC]";
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s PROPERTY NOT SET: value nil for key: %{public}@ on %{public}@", (uint8_t *)&v13, 0x20u);

    }
  }

}

- (void)propagateUsingSetter
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  const char *v8;
  id v9;
  void *v10;
  size_t v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  size_t v34;
  _BYTE buf[12];
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[WFRecordPropertyMapping getterMethodSignature](self, "getterMethodSignature");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (objc_msgSend(v4, "methodReturnType"))
  {
    -[WFRecordPropertyMapping setterMethodSignature](self, "setterMethodSignature");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "getArgumentTypeAtIndex:", 2);

    if (v6)
    {
      -[WFRecordPropertyMapping getterMethodSignature](self, "getterMethodSignature");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = (const char *)objc_msgSend(v7, "methodReturnType");
      -[WFRecordPropertyMapping setterMethodSignature](self, "setterMethodSignature");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LODWORD(v8) = strcmp(v8, (const char *)objc_msgSend(v9, "getArgumentTypeAtIndex:", 2));

      if ((_DWORD)v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFRecordPropertyMapping sourceObject](self, "sourceObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFRecordPropertyMapping sourceProperty](self, "sourceProperty");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "getter");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFRecordPropertyMapping destinationObject](self, "destinationObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFRecordPropertyMapping destinationProperty](self, "destinationProperty");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setter");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRecordPropertyMapping.m"), 82, CFSTR("Property type mismatch between %@ - %@ and %@ - %@."), v25, v27, v30, v32);

      }
      -[WFRecordPropertyMapping getterMethodSignature](self, "getterMethodSignature");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "methodReturnLength");

      v34 = v11;
      *(_QWORD *)buf = malloc_type_malloc(v11, 0x60F72D31uLL);
      -[WFRecordPropertyMapping invokeGetterWithBuffer:length:](self, "invokeGetterWithBuffer:length:", buf, &v34);
      -[WFRecordPropertyMapping invokeSetterWithBuffer:length:](self, "invokeSetterWithBuffer:length:", buf, &v34);
      free(*(void **)buf);
      return;
    }
  }
  else
  {

  }
  getWFWFRecordPropertyLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    -[WFRecordPropertyMapping sourceObject](self, "sourceObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRecordPropertyMapping sourceProperty](self, "sourceProperty");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRecordPropertyMapping destinationObject](self, "destinationObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRecordPropertyMapping destinationProperty](self, "destinationProperty");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "-[WFRecordPropertyMapping propagateUsingSetter]";
    v36 = 2114;
    v37 = v15;
    v38 = 2114;
    v39 = v17;
    v40 = 2114;
    v41 = v20;
    v42 = 2114;
    v43 = v22;
    _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_FAULT, "%s PROPERTY NOT SET: %{public}@ - %{public}@ and %{public}@ - %{public}@. Invalid setter or getter", buf, 0x34u);

  }
}

- (void)invokeGetterWithBuffer:(void *)a3 length:(unint64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0C99DB8];
  -[WFRecordPropertyMapping getterMethodSignature](self, "getterMethodSignature", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invocationWithMethodSignature:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSelector:", -[WFRecordPropertyMapping getterSelector](self, "getterSelector"));
  -[WFRecordPropertyMapping sourceObject](self, "sourceObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invokeWithTarget:", v8);

  objc_msgSend(v9, "getReturnValue:", *a3);
}

- (void)invokeSetterWithBuffer:(void *)a3 length:(unint64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0C99DB8];
  -[WFRecordPropertyMapping setterMethodSignature](self, "setterMethodSignature", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invocationWithMethodSignature:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSelector:", -[WFRecordPropertyMapping setterSelector](self, "setterSelector"));
  objc_msgSend(v9, "setArgument:atIndex:", *a3, 2);
  -[WFRecordPropertyMapping destinationObject](self, "destinationObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invokeWithTarget:", v8);

}

- (SEL)getterSelector
{
  void *v2;
  NSString *v3;
  const char *v4;

  -[WFRecordPropertyMapping sourceProperty](self, "sourceProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getter");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = NSSelectorFromString(v3);

  return v4;
}

- (id)getterMethodSignature
{
  void *v3;
  void *v4;

  -[WFRecordPropertyMapping sourceObject](self, "sourceObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "methodSignatureForSelector:", -[WFRecordPropertyMapping getterSelector](self, "getterSelector"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SEL)setterSelector
{
  void *v2;
  NSString *v3;
  const char *v4;

  -[WFRecordPropertyMapping destinationProperty](self, "destinationProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setter");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = NSSelectorFromString(v3);

  return v4;
}

- (id)setterMethodSignature
{
  void *v3;
  void *v4;

  -[WFRecordPropertyMapping destinationObject](self, "destinationObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "methodSignatureForSelector:", -[WFRecordPropertyMapping setterSelector](self, "setterSelector"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    -[WFRecordPropertyMapping sourceObject](self, "sourceObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sourceObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      -[WFRecordPropertyMapping sourceProperty](self, "sourceProperty");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sourceProperty");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqual:", v11))
      {
        -[WFRecordPropertyMapping destinationObject](self, "destinationObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "destinationObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqual:", v13))
        {
          -[WFRecordPropertyMapping destinationProperty](self, "destinationProperty");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "destinationProperty");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v16, "isEqual:", v14);

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[WFRecordPropertyMapping sourceObject](self, "sourceObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFRecordPropertyMapping sourceProperty](self, "sourceProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[WFRecordPropertyMapping destinationObject](self, "destinationObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[WFRecordPropertyMapping destinationProperty](self, "destinationProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)sourceObject
{
  return objc_loadWeakRetained(&self->_sourceObject);
}

- (void)setSourceObject:(id)a3
{
  objc_storeWeak(&self->_sourceObject, a3);
}

- (WFRecordProperty)sourceProperty
{
  return self->_sourceProperty;
}

- (void)setSourceProperty:(id)a3
{
  objc_storeStrong((id *)&self->_sourceProperty, a3);
}

- (id)destinationObject
{
  return objc_loadWeakRetained(&self->_destinationObject);
}

- (void)setDestinationObject:(id)a3
{
  objc_storeWeak(&self->_destinationObject, a3);
}

- (WFRecordProperty)destinationProperty
{
  return self->_destinationProperty;
}

- (void)setDestinationProperty:(id)a3
{
  objc_storeStrong((id *)&self->_destinationProperty, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationProperty, 0);
  objc_destroyWeak(&self->_destinationObject);
  objc_storeStrong((id *)&self->_sourceProperty, 0);
  objc_destroyWeak(&self->_sourceObject);
}

@end
