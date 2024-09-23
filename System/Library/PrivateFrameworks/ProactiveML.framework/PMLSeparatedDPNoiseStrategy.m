@implementation PMLSeparatedDPNoiseStrategy

- (PMLSeparatedDPNoiseStrategy)initWithPFLIdentifier:(const char *)a3
{
  PMLSeparatedDPNoiseStrategy *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PMLSeparatedDPNoiseStrategy;
  result = -[PMLSeparatedDPNoiseStrategy init](&v5, sel_init);
  if (result)
    result->_pflIdentifier = a3;
  return result;
}

- (void)addNoiseToSparseMatrix:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (void)addNoiseToSparseVector:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (BOOL)scaleAndAddNoiseToDenseVector:(id)a3 usingNorm:(BOOL)a4 scaleFactor:(float *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  const char *pflIdentifier;
  uint64_t (*v11)(uint64_t, uint64_t, const char *);
  char v12;
  NSObject *v13;
  BOOL result;
  void *v15;
  void *v16;
  uint8_t buf[8];
  uint64_t v18;
  void *(*v19)(_QWORD *);
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;

  v7 = objc_retainAutorelease(a3);
  v8 = objc_msgSend(v7, "mutablePtr");
  v9 = objc_msgSend(v7, "count");
  pflIdentifier = self->_pflIdentifier;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v11 = (uint64_t (*)(uint64_t, uint64_t, const char *))getPFLPrivatizeSymbolLoc_ptr;
  v25 = getPFLPrivatizeSymbolLoc_ptr;
  if (!getPFLPrivatizeSymbolLoc_ptr)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __getPFLPrivatizeSymbolLoc_block_invoke;
    v20 = &unk_24D3DB8C0;
    v21 = &v22;
    __getPFLPrivatizeSymbolLoc_block_invoke(buf);
    v11 = (uint64_t (*)(uint64_t, uint64_t, const char *))v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (v11)
  {
    v12 = v11(v8, v9, pflIdentifier);
    if ((v12 & 1) != 0)
    {
      *a5 = 1.0;
    }
    else
    {
      PML_LogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2159BB000, v13, OS_LOG_TYPE_ERROR, "PFLPrivatize call failed", buf, 2u);
      }

    }
    return v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_Bool soft_PFLPrivatize(float *, size_t, const char *)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PMLSeparatedDPNoiseStrategy.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (id)toPlistWithChunks:(id)a3
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (PMLSeparatedDPNoiseStrategy)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  id v9;
  PMLSeparatedDPNoiseStrategy *v10;
  void *v12;
  objc_class *v13;
  void *v14;

  v7 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PFL_ID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSeparatedDPNoiseStrategy.m"), 85, CFSTR("Can't instantiate %@. Missing %@ dependency."), v14, CFSTR("PFL_ID"));

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PFL_ID"));
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = -[PMLSeparatedDPNoiseStrategy initWithPFLIdentifier:](self, "initWithPFLIdentifier:", objc_msgSend(v9, "UTF8String"));

  return v10;
}

+ (id)getPFLIdentifier:(id)a3
{
  if (objc_msgSend(CFSTR("QuickResponsesClassification"), "isEqualToString:", a3))
    return CFSTR("com.apple.proactive.responses");
  else
    return CFSTR("com.apple.proactive.fia.phone.en");
}

@end
