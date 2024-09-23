@implementation TSUExtendedAttribute

+ (id)extendedAttributeWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:value:", v7, v6);

  return v8;
}

+ (id)extendedAttributeFromPath:(id)a3 name:(id)a4 options:(int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initFromPath:name:options:error:", v11, v10, v7, a6);

  return v12;
}

- (TSUExtendedAttribute)init
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUExtendedAttribute init]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUExtendedAttribute.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 24, 0, "Do not call method");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[TSUExtendedAttribute init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (TSUExtendedAttribute)initWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  TSUExtendedAttribute *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSData *value;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSUExtendedAttribute;
  v8 = -[TSUExtendedAttribute init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    value = v8->_value;
    v8->_value = (NSData *)v11;

  }
  return v8;
}

- (id)initFromPath:(id)a3 name:(id)a4 options:(int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  uint64_t v11;
  TSUExtendedAttribute *v12;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  if (v11)
  {
    self = (TSUExtendedAttribute *)-[TSUExtendedAttribute initFromPathFileSystemRepresentation:name:forRemoval:options:error:](self, "initFromPathFileSystemRepresentation:name:forRemoval:options:error:", v11, v10, 0, v7, a6);
    v12 = self;
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", 2, 0);
    v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)initFromPathFileSystemRepresentation:(const char *)a3 name:(id)a4 forRemoval:(BOOL)a5 options:(int)a6 error:(id *)a7
{
  _BOOL4 v9;
  id v12;
  const char *v13;
  TSUExtendedAttribute *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  ssize_t v18;
  size_t v19;
  void *v20;
  void *v21;
  ssize_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v9 = a5;
  v12 = objc_retainAutorelease(a4);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  if (!v13)
  {
    if (!a7)
      goto LABEL_21;
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = 22;
LABEL_16:
    objc_msgSend(v15, "tsu_fileReadPOSIXErrorWithNumber:userInfo:", v16, 0);
    v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v9)
  {
    self = -[TSUExtendedAttribute initWithName:value:](self, "initWithName:value:", v12, 0);
    v14 = self;
    goto LABEL_22;
  }
  v17 = v13;
  v18 = getxattr(a3, v13, 0, 0, 0, a6);
  if (v18 == -1)
  {
    if (!a7)
      goto LABEL_21;
    v26 = (void *)MEMORY[0x24BDD1540];
    v16 = *__error();
    v15 = v26;
    goto LABEL_16;
  }
  v19 = v18;
  v20 = malloc_type_malloc(v18, 0xB14D187EuLL);
  if (!v20)
  {
    if (a7)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v16 = 12;
      goto LABEL_16;
    }
LABEL_21:
    v14 = 0;
    goto LABEL_22;
  }
  v21 = v20;
  v22 = getxattr(a3, v17, v20, v19, 0, a6);
  if (v22 == -1)
  {
    if (TSUDefaultCat_init_token == -1)
    {
      if (!a7)
      {
LABEL_20:
        free(v21);
        goto LABEL_21;
      }
    }
    else
    {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_33);
      if (!a7)
        goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (v22 != v19)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUExtendedAttribute initFromPathFileSystemRepresentation:name:forRemoval:options:error:]");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUExtendedAttribute.m");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 79, 0, "Unexpected result.");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v21, v19, 1);
  self = -[TSUExtendedAttribute initWithName:value:](self, "initWithName:value:", v12, v25);

  v14 = self;
LABEL_22:

  return v14;
}

void __91__TSUExtendedAttribute_initFromPathFileSystemRepresentation_name_forRemoval_options_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (BOOL)shouldPreserveForIntent:(unsigned int)a3
{
  const char *v4;

  v4 = -[NSString UTF8String](self->_name, "UTF8String");
  if (v4)
    LOBYTE(v4) = xattr_preserve_for_intent(v4, a3) != 0;
  return (char)v4;
}

- (BOOL)setAttributeToPath:(id)a3 options:(int)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v8;

  v6 = *(_QWORD *)&a4;
  v8 = objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  if (v8)
    return -[TSUExtendedAttribute setAttributeToPathFileSystemRepresentation:options:error:](self, "setAttributeToPathFileSystemRepresentation:options:error:", v8, v6, a5);
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", 2, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setAttributeToPathFileSystemRepresentation:(const char *)a3 options:(int)a4 error:(id *)a5
{
  const char *v9;
  const char *v10;
  NSData *value;
  const void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  BOOL result;
  void *v17;
  id v18;

  v9 = -[NSString UTF8String](self->_name, "UTF8String");
  if (v9)
  {
    v10 = v9;
    value = self->_value;
    if (!value)
    {
      if (!strcmp(v10, "com.apple.quarantine"))
        return 1;
      v13 = removexattr(a3, v10, a4);
LABEL_9:
      if (v13 != -1)
        return 1;
      if (a5)
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        v15 = *__error();
        v14 = v17;
        goto LABEL_13;
      }
      return 0;
    }
    v12 = -[NSData bytes](value, "bytes");
    if (v12)
    {
      v13 = setxattr(a3, v10, v12, -[NSData length](self->_value, "length"), 0, a4);
      goto LABEL_9;
    }
  }
  if (a5)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = 22;
LABEL_13:
    objc_msgSend(v14, "tsu_fileReadPOSIXErrorWithNumber:userInfo:", v15, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a5 = v18;
    return result;
  }
  return 0;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return -[NSData hash](self->_value, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *name;
  uint64_t v8;
  NSData *value;
  uint64_t v10;
  char v11;

  v4 = a3;
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    name = self->_name;
    objc_msgSend(v6, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)name | v8 && !-[NSString isEqual:](name, "isEqual:", v8))
    {
      v11 = 0;
    }
    else
    {
      value = self->_value;
      objc_msgSend(v6, "value");
      v10 = objc_claimAutoreleasedReturnValue();
      if ((unint64_t)value | v10)
        v11 = -[NSData isEqual:](value, "isEqual:", v10);
      else
        v11 = 1;

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p name='%@' value=%@>"), v5, self, self->_name, self->_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
