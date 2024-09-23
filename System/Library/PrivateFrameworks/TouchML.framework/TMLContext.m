@implementation TMLContext

+ (void)initialize
{
  ((void (*)(__objc2_class *, char *))MEMORY[0x24BEDD108])(TMLRuntime, sel_bootstrap);
}

- (TMLContext)init
{
  double v2;

  return (TMLContext *)objc_msgSend_initWithOptions_(self, a2, v2, 1);
}

- (TMLContext)initWithOptions:(unint64_t)a3
{
  TMLContext *v4;
  TMLContext *v5;
  id v6;
  const char *v7;
  double v8;
  uint64_t v9;
  NSMutableDictionary *objects;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TMLContext;
  v4 = -[TMLContext init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    v6 = objc_alloc(MEMORY[0x24BDBCED8]);
    v9 = objc_msgSend_initWithCapacity_(v6, v7, v8, 16);
    objects = v5->_objects;
    v5->_objects = (NSMutableDictionary *)v9;

  }
  return v5;
}

- (void)dealloc
{
  double v2;
  objc_super v4;

  objc_msgSend_dispose(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)TMLContext;
  -[TMLContext dealloc](&v4, sel_dealloc);
}

- (void)disposeIfNecessary
{
  double v2;

  if (!self->_beingDisposed)
    objc_msgSend_dispose(self, a2, v2);
}

- (void)dispose
{
  double v2;
  NSMutableArray *signalHandlers;
  NSMutableSet *contextObjects;
  const char *v6;
  NSMutableSet *v7;
  NSMutableDictionary *objects;
  const char *v9;
  double v10;
  JSContext *jsContext;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *apiObject;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  NSString *apiObjectKey;
  TMLMetaContext *metaContext;
  _QWORD v38[5];

  self->_beingDisposed = 1;
  if (self->_jsContext)
    objc_msgSend_callFunction_arguments_(self, a2, v2, CFSTR("onunload"), 0);
  objc_msgSend_makeObjectsPerformSelector_(self->_signalHandlers, a2, v2, sel_detach);
  signalHandlers = self->_signalHandlers;
  self->_signalHandlers = 0;

  contextObjects = self->_contextObjects;
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = sub_22AD46C14;
  v38[3] = &unk_24F5009B0;
  v38[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(contextObjects, v6, COERCE_DOUBLE(3221225472), v38);
  v7 = self->_contextObjects;
  self->_contextObjects = 0;

  objects = self->_objects;
  self->_objects = 0;

  jsContext = self->_jsContext;
  if (self->_apiObject && jsContext)
  {
    objc_msgSend_valueWithUndefinedInContext_(MEMORY[0x24BDDA730], v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(self->_apiObject, v13, v14, CFSTR("_$ctxs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isArray(v15, v16, v17))
    {
      objc_msgSend_toArray(v15, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      apiObject = (void *)objc_msgSend_mutableCopy(v20, v21, v22);

      objc_msgSend_removeObject_(apiObject, v24, v25, self);
      if (objc_msgSend_count(apiObject, v26, v27))
      {
        objc_msgSend_valueWithObject_inContext_(MEMORY[0x24BDDA730], v28, v29, apiObject, self->_jsContext);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(self->_apiObject, v31, v32, v30, CFSTR("_$ctxs"));

LABEL_10:
        jsContext = self->_jsContext;
        goto LABEL_11;
      }
      objc_msgSend_setObject_forKeyedSubscript_(self->_apiObject, v28, v29, v12, CFSTR("_$ctxs"));

    }
    objc_msgSend_globalObject(self->_jsContext, v18, v19);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v33, v34, v35, v12, self->_apiObjectKey);

    apiObjectKey = self->_apiObjectKey;
    self->_apiObjectKey = 0;

    apiObject = self->_apiObject;
    self->_apiObject = 0;
    goto LABEL_10;
  }
LABEL_11:
  self->_jsContext = 0;

  metaContext = self->_metaContext;
  self->_metaContext = 0;

}

- (id)apiObject
{
  return self->_apiObject;
}

- (BOOL)valid
{
  return self->_metaContext != 0;
}

- (id)metaContext
{
  return self->_metaContext;
}

- (BOOL)raiseException:(id)a3
{
  NSException *v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  BOOL v10;
  void *v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;

  v5 = (NSException *)a3;
  if (self->_jsEvaluationException == v5)
    goto LABEL_5;
  objc_storeStrong((id *)&self->_jsEvaluationException, a3);
  if ((objc_msgSend_valid(self, v6, v7) & 1) == 0)
  {
    v11 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v11, v13, v14, CFSTR("Disposed TML context"), v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v18, v19, v20, v15);

LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v10 = 1;
LABEL_6:

  return v10;
}

- (void)resetJSException
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  int isEqualToString;
  const char *v8;
  double v9;

  objc_msgSend_name(self->_jsEvaluationException, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v4, v5, v6, CFSTR("TMLJSException"));

  if (isEqualToString)
    objc_msgSend_resetException(self, v8, v9);
}

- (void)resetException
{
  NSException *jsEvaluationException;

  jsEvaluationException = self->_jsEvaluationException;
  self->_jsEvaluationException = 0;

}

- (void)raiseJSException:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  id v32;
  const char *v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;
  const __CFString *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, v6, CFSTR("stack"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_toString(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsSeparatedByString_(v10, v11, v12, CFSTR("\n"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_mutableCopy(v13, v14, v15);

  if (v16)
  {
    objc_msgSend_firstObject(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_objectForKeyedSubscript_(v4, v21, v22, CFSTR("line"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_toString(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v20, v27, v28, CFSTR("%@:#%@"), v19, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_replaceObjectAtIndex_withObject_(v16, v30, v31, 0, v29);

  }
  v32 = objc_alloc(MEMORY[0x24BDBCE88]);
  objc_msgSend_toString(v4, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = CFSTR("stack");
  v45[0] = v16;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v36, v37, v45, &v44, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend_initWithName_reason_userInfo_(v32, v39, v40, CFSTR("TMLJSException"), v35, v38);
  objc_msgSend_raiseException_(self, v42, v43, v41);

}

- (BOOL)loadSource:(id)a3
{
  double v3;

  return objc_msgSend_loadSource_path_(self, a2, v3, a3, 0);
}

- (BOOL)loadSourceFromPath:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;

  v4 = (void *)MEMORY[0x24BDBCE50];
  v5 = a3;
  objc_msgSend_dataWithContentsOfFile_(v4, v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend_loadSource_path_(self, v9, v10, v8, v5);

  return (char)self;
}

- (BOOL)loadSource:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  objc_msgSend_loadMetaContextWithSource_path_options_(v8, v9, v10, v6, v7, self->_options);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_storeStrong((id *)&self->_metaContext, v11);
    objc_msgSend_initizalizeContext(self, v12, v13);
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)initializeWithCloneContext:(id)a3
{
  const char *v4;
  double v5;
  TMLMetaContext *v6;
  TMLMetaContext *metaContext;
  const char *v8;
  double v9;
  JSContext *v10;
  JSContext *jsContext;
  const char *v12;
  double v13;
  JSValue *v14;
  JSValue *apiObject;
  const char *v16;
  double v17;
  NSString *v18;
  NSString *apiObjectKey;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  id v33;

  v33 = a3;
  objc_msgSend_metaContext(v33, v4, v5);
  v6 = (TMLMetaContext *)objc_claimAutoreleasedReturnValue();
  metaContext = self->_metaContext;
  self->_metaContext = v6;

  self->_options |= 8uLL;
  objc_msgSend_jsContext(v33, v8, v9);
  v10 = (JSContext *)objc_claimAutoreleasedReturnValue();
  jsContext = self->_jsContext;
  self->_jsContext = v10;

  objc_msgSend_apiObject(v33, v12, v13);
  v14 = (JSValue *)objc_claimAutoreleasedReturnValue();
  apiObject = self->_apiObject;
  self->_apiObject = v14;

  objc_msgSend_apiObjectKey(v33, v16, v17);
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  apiObjectKey = self->_apiObjectKey;
  self->_apiObjectKey = v18;

  objc_msgSend_initizalizeContext(self, v20, v21);
  objc_msgSend_jsContext(v33, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
    objc_msgSend_setJsContext_(v33, v25, v26, self->_jsContext);
  objc_msgSend_apiObject(v33, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
    objc_msgSend_setApiObject_(v33, v28, v29, self->_apiObject);
  objc_msgSend_apiObjectKey(v33, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
    objc_msgSend_setApiObjectKey_(v33, v31, v32, self->_apiObjectKey);

}

+ (id)loadMetaContextWithSource:(id)a3 path:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v7;
  id v8;
  const char *v9;
  double v10;
  const char *v11;
  void *v12;
  double v13;
  TMLMetaContext *v14;
  void *v15;
  const char *v16;
  double v17;
  TMLParser *v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  id v25;
  const char *v26;
  double v27;
  const char *v28;
  void *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  char v37;
  void *v38;
  void *v39;
  const char *v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend_decode_(TMLModelSerialize, v9, v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if ((v5 & 4) != 0)
    {
      v14 = objc_alloc_init(TMLMetaContext);
      v18 = [TMLParser alloc];
      v15 = (void *)objc_msgSend_initWithContext_(v18, v19, v20, v14);
      objc_msgSend_addPreprocessorMacro_(v15, v21, v22, CFSTR("TARGET_OS_IPHONE"));
      objc_msgSend_addPreprocessorMacro_(v15, v23, v24, CFSTR("TARGET_OS_IOS"));
      v25 = objc_alloc(MEMORY[0x24BDD17C8]);
      v29 = (void *)objc_msgSend_initWithData_encoding_(v25, v26, v27, v7, 4);
      if (v29)
      {
        objc_msgSend_stringByDeletingLastPathComponent(v8, v28, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastPathComponent(v8, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend_parseString_basePath_filename_(v15, v35, v36, v29, v31, v34);

        if ((v37 & 1) != 0)
        {

LABEL_11:
          goto LABEL_12;
        }
      }
      v38 = (void *)MEMORY[0x24BDBCE88];
      objc_msgSend_error(v15, v28, v30);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v38, v40, v41, CFSTR("TMLRuntimeException"), v39, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_raiseException_(TMLExceptionHandler, v43, v44, v42);

      v15 = v14;
LABEL_10:
      v14 = 0;
      goto LABEL_11;
    }
LABEL_5:
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v11, v13, CFSTR("TMLRuntimeException"), CFSTR("Malformed format error"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raiseException_(TMLExceptionHandler, v16, v17, v15);
    goto LABEL_10;
  }
  objc_msgSend_deserializeFromData_(TMLMetaContext, v11, v13, v12);
  v14 = (TMLMetaContext *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_5;
LABEL_12:

  return v14;
}

+ (BOOL)loadClasses:(id)a3
{
  double v3;

  return objc_msgSend_loadClasses_path_(a1, a2, v3, a3, 0);
}

+ (BOOL)loadClassesFromPath:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;

  v4 = (void *)MEMORY[0x24BDBCE50];
  v5 = a3;
  objc_msgSend_dataWithContentsOfFile_(v4, v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend_loadClasses_path_(a1, v9, v10, v8, v5);

  return (char)a1;
}

+ (BOOL)loadClasses:(id)a3 path:(id)a4
{
  id v5;
  id v6;
  TMLContext *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  char Source_path;

  v5 = a4;
  v6 = a3;
  v7 = [TMLContext alloc];
  v10 = (void *)objc_msgSend_initWithOptions_(v7, v8, v9, 3);
  Source_path = objc_msgSend_loadSource_path_(v10, v11, v12, v6, v5);

  return Source_path;
}

+ (Class)createClassFromPath:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  TMLCloneContext *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *Class;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  objc_class *v24;

  v4 = (void *)MEMORY[0x24BDBCE50];
  v5 = a3;
  objc_msgSend_dataWithContentsOfFile_(v4, v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loadMetaContextWithSource_path_options_(a1, v9, v10, v8, v5, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [TMLCloneContext alloc];
  v15 = (void *)objc_msgSend_initWithMetaContext_(v12, v13, v14, v11);
  Class = (void *)objc_msgSend_createClass_(TMLRuntime, v16, v17, v15);
  objc_msgSend_currentContext(TMLJSEnvironment, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectReference_(v21, v22, v23, Class);

  v24 = Class;
  return v24;
}

+ (id)cloneContext:(id)a3 objects:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_22AD47700;
  v15[3] = &unk_24F4FE128;
  v9 = v8;
  v16 = v9;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v10, v11, v15);

  objc_msgSend_initializeWithCloneContext_(v9, v12, v13, v7);
  return v9;
}

- (NSObject)rootObject
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;

  objc_msgSend_rootObject(self->_metaContext, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectWithIdentifier_(self, v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSDictionary)allObjects
{
  double v2;

  return (NSDictionary *)(id)objc_msgSend_copy(self->_objects, a2, v2);
}

- (id)existingObjectWithIdentifier:(id)a3
{
  double v3;
  void *v4;
  const char *v5;
  double v6;
  uint64_t v7;

  objc_msgSend_objectForKeyedSubscript_(self->_objects, a2, v3, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_object(v4, v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (void)addObjectReference:(id)a3
{
  double v3;

  objc_msgSend_addObject_(self->_contextObjects, a2, v3, a3);
}

- (id)objectWithIdentifier:(id)a3
{
  double v3;

  return (id)objc_msgSend_objectWithIdentifier_unwrapWeak_(self, a2, v3, a3, 1);
}

- (id)objectWithIdentifierNoCreate:(id)a3
{
  return (id)((uint64_t (*)(TMLContext *, char *))MEMORY[0x24BEDD108])(self, sel_objectWithIdentifier_unwrapWeak_createIfMissing_);
}

- (id)objectWithIdentifier:(id)a3 unwrapWeak:(BOOL)a4
{
  return (id)((uint64_t (*)(TMLContext *, char *))MEMORY[0x24BEDD108])(self, sel_objectWithIdentifier_unwrapWeak_createIfMissing_);
}

- (id)objectWithIdentifier:(id)a3 unwrapWeak:(BOOL)a4 createIfMissing:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  const char *v9;
  double v10;
  const char *v11;
  void *v12;
  double v13;
  BOOL v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  uint64_t v35;
  void *v37;
  void *v38;
  const char *v39;
  double v40;
  id v41;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_objects, v9, v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v14 = 1;
  else
    v14 = !v5;
  if (!v14)
  {
    objc_msgSend_objects(self->_metaContext, v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v16, v17, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend_createObjectFromMetaObject_parent_(self, v19, v20, v18, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend_findParentForObjectWithIdentifier_(self->_metaContext, v19, v20, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v21;
    if (v21
      && (objc_msgSend_identifier(v21, v22, v23),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_objectWithIdentifier_(self, v26, v27, v25),
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          v28,
          v25,
          v28))
    {
      objc_msgSend_objectForKeyedSubscript_(self->_objects, v29, v30, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_10;
    }
    else
    {

    }
    v37 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v31, v32, CFSTR("Unknown object identifier %@"), v8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v37, v39, v40, CFSTR("TMLRuntimeException"), v38, 0);
    v41 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v41);
  }
LABEL_11:
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_object(v12, v33, v34);
      v35 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v35;
    }
  }

  return v12;
}

- (id)objectsOfType:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  TMLContext *v18;
  id v19;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_objects(self->_metaContext, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_22AD47AA4;
  v16[3] = &unk_24F5009D8;
  v17 = v4;
  v18 = self;
  v9 = v5;
  v19 = v9;
  v10 = v4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v8, v11, v12, v16);

  v13 = v19;
  v14 = v9;

  return v14;
}

- (id)createObjectFromMetaObject:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  void *v21;
  double v22;
  _QWORD *v23;
  const char *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  void *v39;
  id v41;
  const char *v42;
  double v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  id v49;
  const char *v50;
  double v51;
  void *v52;
  void *v53;
  const char *v54;
  double v55;
  const char *v56;
  double v57;
  void *v58;
  uint64_t v59;
  id v60;
  id v61;
  const char *v62;
  double v63;
  const char *v64;
  double v65;
  void *v66;
  const char *v67;
  double v68;
  void *v69;
  const char *v70;
  double v71;
  void *v72;
  const char *v73;
  double v74;
  void *v75;
  id v76;
  const char *v77;
  double v78;
  const char *v79;
  double v80;
  int v81;
  const char *v82;
  double v83;
  const char *v84;
  double v85;
  const char *v86;
  double v87;
  void *v88;
  id v89;
  id v90;
  const char *v91;
  double v92;
  const char *v93;
  double v94;
  const char *v95;
  double v96;
  void *v97;
  const char *v98;
  double v99;
  char isEqualToString;
  const char *v101;
  double v102;
  const char *v103;
  double v104;
  id *v105;
  void *v106;
  void *v107;
  id v108;
  _BOOL4 v109;
  _QWORD v110[4];
  id v111;
  id v112;
  id v113;
  TMLContext *v114;
  _QWORD v115[5];
  id v116;
  _QWORD v117[4];
  id v118;
  id v119;
  _QWORD v120[5];
  id v121;

  v6 = a3;
  v7 = a4;
  objc_msgSend_identifier(v6, v8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_initializer(v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(self->_objects, v14, v15, v10);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v19 = (void *)v16;
    v109 = 0;
  }
  else
  {
    objc_msgSend_type(v6, v17, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v13 != 0;
    if (v13)
    {
      v120[0] = MEMORY[0x24BDAC760];
      v120[1] = 3221225472;
      v120[2] = sub_22AD480A8;
      v120[3] = &unk_24F500A00;
      v23 = v120;
      v120[4] = self;
      v105 = &v121;
      v121 = v13;
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend_createObjectWithIdentifier_ofType_initializer_parentObject_(TMLRuntime, v20, v22, v10, v21, v23, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = v19;
    v46 = v41;
    if (objc_msgSend_length(v10, v42, v43))
    {
      v46 = v41;
      if (objc_msgSend_containsObject_(self->_weakObjectIdentifiers, v44, v45, v10))
      {
        objc_opt_class();
        v46 = v41;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v47, v48, v41);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      objc_msgSend_setObject_forKeyedSubscript_(self->_objects, v47, v48, v46, v10);
    }
    v106 = v41;
    v107 = v13;
    v49 = v46;
    objc_opt_class();
    v52 = v49;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_object(v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend_implements(v6, v50, v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_makeObject_implementProtocols_(TMLRuntime, v54, v55, v52, v53);

    objc_msgSend_declarations(v6, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = MEMORY[0x24BDAC760];
    v117[0] = MEMORY[0x24BDAC760];
    v117[1] = 3221225472;
    v117[2] = sub_22AD480F0;
    v117[3] = &unk_24F500A28;
    v60 = v52;
    v118 = v60;
    v61 = v10;
    v119 = v61;
    objc_msgSend_enumerateObjectsUsingBlock_(v58, v62, v63, v117);

    objc_msgSend_properties(v6, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_propertyKeys(v6, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyProperties_inOrder_toObject_(self, v70, v71, v66, v69, v60);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objects(v6, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v115[0] = v59;
    v115[1] = 3221225472;
    v115[2] = sub_22AD48258;
    v115[3] = &unk_24F500A50;
    v115[4] = self;
    v76 = v60;
    v116 = v76;
    objc_msgSend_enumerateObjectsUsingBlock_(v75, v77, v78, v115);

    if (v72)
      objc_msgSend_setTMLValue_forKeyPath_(v76, v79, v80, v72, CFSTR("tmlState"));
    v108 = v7;
    if (!v61)
    {
      objc_msgSend_tmlIdentifier(v76, v79, v80);
      v61 = (id)objc_claimAutoreleasedReturnValue();
    }
    v81 = objc_msgSend_setTMLOwnerContext_(v76, v79, v80, self);
    objc_msgSend_addObject_(self->_contextObjects, v82, v83, v49);
    objc_msgSend_addMetaObject_(v76, v84, v85, v6);
    objc_msgSend_signalHandlers(v6, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = v59;
    v110[1] = 3221225472;
    v110[2] = sub_22AD48280;
    v110[3] = &unk_24F500A98;
    v89 = v76;
    v111 = v89;
    v90 = v6;
    v112 = v90;
    v10 = v61;
    v113 = v10;
    v114 = self;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v88, v91, v92, v110);

    objc_msgSend_tmlMakeJSObjectClass(v89, v93, v94);
    if (v81)
    {
      objc_msgSend_type(v90, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v97, v98, v99, CFSTR("Category"));

      if ((isEqualToString & 1) == 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend_tmlObjectCompleted(v89, v101, v102);
        objc_msgSend_emitTMLSignal_withArguments_(v89, v101, v102, CFSTR("initialize"), 0);
      }
    }

    objc_msgSend_didCreateObject_(self, v103, v104, v89);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v107;
    v26 = v108;
    if (v109)
      goto LABEL_9;
    goto LABEL_10;
  }
LABEL_8:
  v26 = v7;
  v27 = v13;
  v28 = (void *)MEMORY[0x24BDBCE88];
  v29 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_reason(v19, v24, v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v29, v31, v32, CFSTR("Unable create object with identifier %@.\nRoot cause: %@"), v10, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v28, v34, v35, CFSTR("TMLRuntimeException"), v33, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raiseException_(TMLExceptionHandler, v37, v38, v36);

  v39 = 0;
  if (v109)
LABEL_9:

LABEL_10:
  return v39;
}

- (id)applyProperties:(id)a3 inOrder:(id)a4 toObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  double v18;
  id v19;
  _QWORD v21[4];
  id v22;
  TMLContext *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_tmlDefaultState(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_22AD489F0;
  v31 = sub_22AD48A00;
  v32 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_22AD48A08;
  v21[3] = &unk_24F500AC0;
  v14 = v8;
  v22 = v14;
  v23 = self;
  v15 = v10;
  v24 = v15;
  v16 = v13;
  v25 = v16;
  v26 = &v27;
  objc_msgSend_enumerateObjectsUsingBlock_(v9, v17, v18, v21);
  v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v19;
}

- (void)makeWeakObjectWithIdentifier:(id)a3
{
  const char *v4;
  double v5;
  NSMutableSet *weakObjectIdentifiers;
  id v7;
  const char *v8;
  double v9;
  NSMutableSet *v10;
  NSMutableSet *v11;
  char *v12;

  v4 = (const char *)a3;
  weakObjectIdentifiers = self->_weakObjectIdentifiers;
  v12 = (char *)v4;
  if (!weakObjectIdentifiers)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCEF0]);
    v10 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    v11 = self->_weakObjectIdentifiers;
    self->_weakObjectIdentifiers = v10;

    v4 = v12;
    weakObjectIdentifiers = self->_weakObjectIdentifiers;
  }
  objc_msgSend_addObject_(weakObjectIdentifiers, v4, v5, v4);

}

- (void)addObject:(id)a3 withIdentifier:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  void *v10;
  double v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  int isEqual;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  void *v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  id v31;
  void *v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  void *v47;
  const char *v48;
  double v49;
  id v50;
  id v51;
  const __CFString *v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[3];

  v55[2] = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  v6 = a4;
  objc_msgSend_objectForKeyedSubscript_(self->_objects, v7, v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend_object(v51, v12, v13),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          isEqual = objc_msgSend_isEqual_(v10, v15, v16, v14),
          v14,
          isEqual))
    {
      objc_msgSend_setObject_forKeyedSubscript_(self->_objects, v12, v13, v51, v6);
      objc_msgSend_removeObject_(self->_contextObjects, v18, v19, v10);
      objc_msgSend_addObject_(self->_contextObjects, v20, v21, v51);
    }
    else if ((objc_msgSend_isEqual_(v10, v12, v13, v51) & 1) == 0)
    {
      v24 = (void *)MEMORY[0x24BDBCE88];
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v22, v23, CFSTR("Object with identifier %@ already exists in the context"), v6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = CFSTR("existing");
      v54[1] = CFSTR("object");
      v55[0] = v10;
      v55[1] = v51;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, v27, v55, v54, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v24, v29, v30, CFSTR("TMLRuntimeException"), v25, v28);
      v31 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v31);
    }
  }
  else
  {
    if (self->_initialized)
    {
      objc_msgSend_classForObject_(TMLRuntime, v9, v11, v51);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        v39 = (void *)MEMORY[0x24BDBCE88];
        v40 = (void *)MEMORY[0x24BDD17C8];
        v41 = objc_opt_class();
        objc_msgSend_stringWithFormat_(v40, v42, v43, CFSTR("Attempt to add object of undeclared class %@"), v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = CFSTR("object");
        v53 = v51;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v45, v46, &v53, &v52, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_exceptionWithName_reason_userInfo_(v39, v48, v49, CFSTR("TMLRuntimeException"), v44, v47);
        v50 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v50);
      }
    }
    objc_msgSend_setTmlIdentifier_(v51, v9, v11, v6);
    objc_msgSend_setObject_forKeyedSubscript_(self->_objects, v33, v34, v51, v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_object(v51, v35, v36);
      v37 = objc_claimAutoreleasedReturnValue();

      v38 = (void *)v37;
    }
    else
    {
      v38 = v51;
    }
    v51 = v38;
    objc_msgSend_tmlMakeJSObjectClass(v38, v35, v36);
  }

}

- (void)requireModule:(id)a3
{
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  char v9;
  const char *v10;
  double v11;
  NSMutableSet *requires;
  id v13;
  const char *v14;
  double v15;
  NSMutableSet *v16;
  NSMutableSet *v17;
  id v18;

  v18 = a3;
  objc_msgSend_defaultModules(TMLJSEnvironment, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_containsObject_(v6, v7, v8, v18);

  if ((v9 & 1) == 0)
  {
    requires = self->_requires;
    if (!requires)
    {
      v13 = objc_alloc(MEMORY[0x24BDBCEF0]);
      v16 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v13, v14, v15, 4);
      v17 = self->_requires;
      self->_requires = v16;

      requires = self->_requires;
    }
    objc_msgSend_addObject_(requires, v10, v11, v18);
  }

}

- (id)processValue:(id)a3 ofType:(unint64_t)a4 selfValue:(id)a5
{
  id v8;
  id v9;
  id v11;
  id v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  uint64_t v18;
  const char *v19;
  double v20;
  void *v21;
  id v22;
  char isKindOfClass;
  const char *v24;
  double v25;
  id v26;
  const char *v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  const char *v32;
  double v33;
  TMLExpressionReactiveValue *v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  void *v42;
  TMLExpressionReactiveValue *v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  void *v49;
  const char *v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, void *);
  void *v55;
  TMLContext *v56;
  id v57;
  id v58;
  id v59;
  id from;
  id location;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_initWeak(&location, a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v8;
    v12 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend_bindings(v11, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_count(v15, v16, v17);
    v21 = (void *)objc_msgSend_initWithCapacity_(v12, v19, v20, v18);

    objc_initWeak(&from, self);
    v22 = objc_loadWeakRetained(&location);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v26 = objc_loadWeakRetained(&location);
      objc_msgSend_tmlParent(v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak(&location, v29);

    }
    objc_msgSend_bindings(v11, v24, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = MEMORY[0x24BDAC760];
    v53 = 3221225472;
    v54 = sub_22AD4939C;
    v55 = &unk_24F500B10;
    objc_copyWeak(&v58, &location);
    v56 = self;
    v31 = v21;
    v57 = v31;
    objc_copyWeak(&v59, &from);
    objc_msgSend_enumerateObjectsUsingBlock_(v30, v32, v33, &v52);

    v34 = [TMLExpressionReactiveValue alloc];
    objc_msgSend_expressionText(v11, v35, v36, v52, v53, v54, v55, v56);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend_initWithExpression_context_bindings_valueType_(v34, v38, v39, v37, self, v31, a4);

    objc_destroyWeak(&v59);
    objc_destroyWeak(&v58);
    objc_destroyWeak(&from);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_3:
      v9 = v8;
      goto LABEL_4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_createObjectFromMetaObject_parent_(self, v40, v41, v8, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = [TMLExpressionReactiveValue alloc];
      objc_msgSend_referenceForTarget_(TMLReference, v44, v45, v42);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = v46;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v47, v48, v62, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend_initWithExpression_context_bindings_valueType_(v43, v50, v51, CFSTR("$(0)"), self, v49, a4);

    }
    else
    {
      v9 = 0;
    }
  }
LABEL_4:
  objc_destroyWeak(&location);

  return v9;
}

+ (void)addGloballyRequiredModules:(id)a3
{
  ((void (*)(__objc2_class *, char *))MEMORY[0x24BEDD108])(TMLJSEnvironment, sel_addToDefaultModules_);
}

- (void)attachToAPIObject
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_objectForKeyedSubscript_(self->_apiObject, a2, v2, CFSTR("_$ctxs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isArray(v4, v5, v6))
  {
    objc_msgSend_toArray(v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObject_(v9, v10, v11, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_valueWithObject_inContext_(MEMORY[0x24BDDA730], v13, v14, v12, self->_jsContext);
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDDA730];
    v21[0] = self;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v7, v8, v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithObject_inContext_(v15, v16, v17, v12, self->_jsContext);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_apiObject, v19, v20, v18, CFSTR("_$ctxs"));

}

- (void)initializeJSContext
{
  double v2;
  JSContext *v4;
  JSContext *jsContext;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  JSValue *v10;
  JSValue *apiObject;
  const char *v12;
  double v13;
  NSString *v14;
  NSString *apiObjectKey;
  JSValue *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  NSMutableSet *requires;
  void *v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  id v38;
  _QWORD v39[5];

  if (self->_apiObject)
  {
    objc_msgSend_attachToAPIObject(self, a2, v2);
  }
  else
  {
    objc_msgSend_createJSContextWithRuntimeContext_(TMLJSEnvironment, a2, v2, self);
    v4 = (JSContext *)objc_claimAutoreleasedReturnValue();
    jsContext = self->_jsContext;
    self->_jsContext = v4;

    objc_msgSend_setExceptionHandler_(self->_jsContext, v6, v7, &unk_24F500B30);
    objc_msgSend_valueWithNewObjectInContext_(MEMORY[0x24BDDA730], v8, v9, self->_jsContext);
    v10 = (JSValue *)objc_claimAutoreleasedReturnValue();
    apiObject = self->_apiObject;
    self->_apiObject = v10;

    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, v13, CFSTR("api%p"), self);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    apiObjectKey = self->_apiObjectKey;
    self->_apiObjectKey = v14;

    v16 = self->_apiObject;
    objc_msgSend_globalObject(self->_jsContext, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v19, v20, v21, v16, self->_apiObjectKey);

    objc_msgSend_attachToAPIObject(self, v22, v23);
    if (objc_msgSend_count(self->_requires, v24, v25))
    {
      requires = self->_requires;
      objc_msgSend_requires(self->_metaContext, v26, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setByAddingObjectsFromSet_(requires, v30, v31, v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (id)objc_msgSend_mutableCopy(v32, v33, v34);

    }
    else
    {
      objc_msgSend_requires(self->_metaContext, v26, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (id)objc_msgSend_mutableCopy(v29, v35, v36);
    }

    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = sub_22AD498D0;
    v39[3] = &unk_24F500B58;
    v39[4] = self;
    objc_msgSend_enumerateObjectsUsingBlock_(v38, v37, COERCE_DOUBLE(3221225472), v39);

  }
}

+ (void)initializeJSContext:(id)a3
{
  const char *v3;
  double v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  id v17;

  v17 = a3;
  objc_msgSend_setObject_forKeyedSubscript_(v17, v3, v4, &unk_24F500B98, CFSTR("$"));
  objc_msgSend_setObject_forKeyedSubscript_(v17, v5, v6, &unk_24F500BB8, CFSTR("get"));
  objc_msgSend_setObject_forKeyedSubscript_(v17, v7, v8, &unk_24F500BB8, CFSTR("$$"));
  objc_msgSend_setObject_forKeyedSubscript_(v17, v9, v10, &unk_24F500BF8, CFSTR("$ctor$"));
  objc_msgSend_setObject_forKeyedSubscript_(v17, v11, v12, &unk_24F500C38, CFSTR("$new$"));
  objc_msgSend_setObject_forKeyedSubscript_(v17, v13, v14, &unk_24F500C58, CFSTR("trycatch"));
  objc_msgSend_setObject_forKeyedSubscript_(v17, v15, v16, &unk_24F500C78, CFSTR("currentContext"));

}

- (void)initizalizeContext
{
  double v2;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  unint64_t options;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  id v20;
  const char *v21;
  double v22;
  NSMutableSet *v23;
  NSMutableSet *contextObjects;
  id v25;
  const char *v26;
  double v27;
  NSMutableArray *v28;
  NSMutableArray *signalHandlers;
  JSValue *apiObject;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;
  const char *v38;
  double v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  const char *v50;
  double v51;
  const char *v52;
  double v53;
  const char *v54;
  double v55;
  const char *v56;
  double v57;
  id v58;
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];

  objc_msgSend_commit(self->_metaContext, a2, v2);
  objc_msgSend_requires(self->_metaContext, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v7, v8, &unk_24F500CB8);

  options = self->_options;
  if ((options & 1) != 0)
  {
    objc_msgSend_protocols(self->_metaContext, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v12, v13, v14, &unk_24F500CF8);

    objc_msgSend_classes(self->_metaContext, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v17, v18, v19, &unk_24F500D38);

    options = self->_options;
  }
  if ((~(_BYTE)options & 3) != 0)
  {
    v20 = objc_alloc(MEMORY[0x24BDBCEF0]);
    v23 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v20, v21, v22, 16);
    contextObjects = self->_contextObjects;
    self->_contextObjects = v23;

    v25 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v28 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v25, v26, v27, 32);
    signalHandlers = self->_signalHandlers;
    self->_signalHandlers = v28;

    apiObject = self->_apiObject;
    objc_msgSend_initializeJSContext(self, v31, v32);
    objc_msgSend_sharedInstance(TMLApplication, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_withIdentifier_(self, v36, v37, v35, CFSTR("application"));

    v40 = MEMORY[0x24BDAC760];
    if (!apiObject)
    {
      objc_msgSend_functions(self->_metaContext, v38, v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v40;
      v61[1] = 3221225472;
      v61[2] = sub_22AD4A214;
      v61[3] = &unk_24F500D60;
      v61[4] = self;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v41, v42, COERCE_DOUBLE(3221225472), v61);

    }
    self->_initialized = 1;
    v58 = (id)objc_msgSend_copy(self->_objects, v38, v39);
    objc_msgSend_categories(self->_metaContext, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v40;
    v60[1] = 3221225472;
    v60[2] = sub_22AD4A3A4;
    v60[3] = &unk_24F500D88;
    v60[4] = self;
    objc_msgSend_enumerateObjectsUsingBlock_(v45, v46, v47, v60);

    v59[0] = v40;
    v59[1] = 3221225472;
    v59[2] = sub_22AD4A424;
    v59[3] = &unk_24F4FE128;
    v59[4] = self;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v58, v48, v49, v59);
    objc_msgSend_callFunction_arguments_(self, v50, v51, CFSTR("onload"), 0);
    objc_msgSend_removeClasses(self->_metaContext, v52, v53);
    if ((self->_options & 8) == 0)
    {
      objc_msgSend_removeFunctions(self->_metaContext, v54, v55);
      objc_msgSend_removeCategories(self->_metaContext, v56, v57);
    }

  }
}

- (id)evaluateExpression:(id)a3 ofType:(unint64_t)a4 withBindings:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  NSException *jsEvaluationException;
  NSException *v17;
  NSException *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  char isEqualToString;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  TMLContext *v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v8 = a3;
  v9 = a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_22AD489F0;
  v38 = sub_22AD48A00;
  v39 = 0;
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = sub_22AD4A738;
  v29 = &unk_24F500DB0;
  v30 = self;
  v10 = v9;
  v31 = v10;
  v11 = v8;
  v32 = v11;
  v33 = &v34;
  objc_msgSend_runInContext_block_(TMLJSEnvironment, v12, v13, self, &v26);
  jsEvaluationException = self->_jsEvaluationException;
  if (jsEvaluationException)
  {
    v17 = jsEvaluationException;
    v18 = self->_jsEvaluationException;
    self->_jsEvaluationException = 0;

    objc_msgSend_name(v17, v19, v20, v26, v27, v28, v29, v30, v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v21, v22, v23, CFSTR("TMLJSException"));

    if ((isEqualToString & 1) == 0)
      objc_exception_throw(objc_retainAutorelease(v17));
  }
  else
  {
    objc_msgSend_convertJsValue_toType_(TMLJSEnvironment, v14, v15, v35[5], a4, v26, v27, v28, v29, v30, v31);
    v17 = (NSException *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v34, 8);
  return v17;
}

- (void)callFunction:(id)a3 arguments:(id)a4
{
  double v4;
  id v5;

  v5 = (id)objc_msgSend_callFunction_arguments_returnType_(self, a2, v4, a3, a4, 1);
}

- (id)callFunction:(id)a3 arguments:(id)a4 returnType:(unint64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  NSException *jsEvaluationException;
  NSException *v20;
  NSException *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  objc_msgSend_objectForKeyedSubscript_(self->_apiObject, v10, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isObject(v12, v13, v14))
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_22AD489F0;
    v31 = sub_22AD48A00;
    v32 = 0;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_22AD4A9C8;
    v23[3] = &unk_24F500DD8;
    v26 = &v27;
    v24 = v12;
    v25 = v9;
    objc_msgSend_runInContext_block_(TMLJSEnvironment, v15, v16, self, v23);
    jsEvaluationException = self->_jsEvaluationException;
    if (jsEvaluationException)
    {
      v20 = jsEvaluationException;
      v21 = self->_jsEvaluationException;
      self->_jsEvaluationException = 0;

    }
    else
    {
      objc_msgSend_convertJsValue_toType_(TMLJSEnvironment, v17, v18, v28[5], a5);
      v20 = (NSException *)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)currentContext
{
  double v2;

  return (id)objc_msgSend_currentContext(TMLJSEnvironment, a2, v2);
}

- (id)didCreateObject:(id)a3
{
  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requires, 0);
  objc_storeStrong((id *)&self->_apiObjectKey, 0);
  objc_storeStrong((id *)&self->_apiObject, 0);
  objc_storeStrong((id *)&self->_jsEvaluationException, 0);
  objc_storeStrong((id *)&self->_currentEvaluationBindings, 0);
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_storeStrong((id *)&self->_signalHandlers, 0);
  objc_storeStrong((id *)&self->_weakObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_contextObjects, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_metaContext, 0);
}

@end
