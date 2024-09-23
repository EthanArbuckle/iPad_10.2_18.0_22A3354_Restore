@implementation VFXProgram

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXProgram;
  -[VFXProgram dealloc](&v3, sel_dealloc);
}

- (VFXProgram)init
{
  VFXProgram *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXProgram;
  result = -[VFXProgram init](&v3, sel_init);
  if (result)
    result->_opaque = 1;
  return result;
}

- (void)setLibrary:(id)a3
{
  id library;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;

  library = self->_library;
  if (library != a3)
  {

    self->_library = a3;
    v9 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v6, v7, v8);
    objc_msgSend_postNotificationName_object_userInfo_(v9, v10, (uint64_t)CFSTR("VFXProgramDidChangeNotification"), (uint64_t)self, 0);
  }
}

- (MTLLibrary)library
{
  return (MTLLibrary *)self->_library;
}

- (void)setName:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  if ((objc_msgSend_isEqualToString_(self->_name, a2, (uint64_t)a3, v3) & 1) == 0)
  {

    self->_name = (NSString *)objc_msgSend_copy(a3, v6, v7, v8);
  }
}

- (id)name
{
  return self->_name;
}

+ (id)program
{
  return objc_alloc_init((Class)a1);
}

+ (VFXProgram)programWithLibrary:(id)a3
{
  VFXProgram *v4;
  const char *v5;
  uint64_t v6;

  v4 = (VFXProgram *)objc_alloc_init((Class)a1);
  objc_msgSend_setLibrary_(v4, v5, (uint64_t)a3, v6);
  return v4;
}

- (void)setSourceFile:(id)a3
{
  NSString *sourceFile;

  sourceFile = self->_sourceFile;
  if (sourceFile != a3)
  {

    self->_sourceFile = (NSString *)a3;
  }
}

- (id)sourceFile
{
  return self->_sourceFile;
}

- (BOOL)isOpaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;

  if (self->_opaque != a3)
  {
    self->_opaque = a3;
    v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, a3, v3);
    objc_msgSend_postNotificationName_object_userInfo_(v5, v6, (uint64_t)CFSTR("VFXProgramDidChangeNotification"), (uint64_t)self, 0);
  }
}

- (void)setVertexFunctionName:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;

  if ((objc_msgSend_isEqualToString_(self->_vertexFunctionName, a2, (uint64_t)a3, v3) & 1) == 0)
  {

    self->_vertexFunctionName = (NSString *)objc_msgSend_copy(a3, v6, v7, v8);
    v12 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v9, v10, v11);
    objc_msgSend_postNotificationName_object_userInfo_(v12, v13, (uint64_t)CFSTR("VFXProgramDidChangeNotification"), (uint64_t)self, 0);
  }
}

- (NSString)vertexFunctionName
{
  return self->_vertexFunctionName;
}

- (void)setFragmentFunctionName:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;

  if ((objc_msgSend_isEqualToString_(self->_fragmentFunctionName, a2, (uint64_t)a3, v3) & 1) == 0)
  {

    self->_fragmentFunctionName = (NSString *)objc_msgSend_copy(a3, v6, v7, v8);
    v12 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v9, v10, v11);
    objc_msgSend_postNotificationName_object_userInfo_(v12, v13, (uint64_t)CFSTR("VFXProgramDidChangeNotification"), (uint64_t)self, 0);
  }
}

- (NSString)fragmentFunctionName
{
  return self->_fragmentFunctionName;
}

- (void)setVertexShader:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;

  if ((objc_msgSend_isEqualToString_(self->_vertexShader, a2, (uint64_t)a3, v3) & 1) == 0)
  {

    self->_vertexShader = (NSString *)objc_msgSend_copy(a3, v6, v7, v8);
    v12 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v9, v10, v11);
    objc_msgSend_postNotificationName_object_userInfo_(v12, v13, (uint64_t)CFSTR("VFXProgramDidChangeNotification"), (uint64_t)self, 0);
  }
}

- (NSString)vertexShader
{
  return self->_vertexShader;
}

- (void)setFragmentShader:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;

  if ((objc_msgSend_isEqualToString_(self->_fragmentShader, a2, (uint64_t)a3, v3) & 1) == 0)
  {

    self->_fragmentShader = (NSString *)objc_msgSend_copy(a3, v6, v7, v8);
    v12 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v9, v10, v11);
    objc_msgSend_postNotificationName_object_userInfo_(v12, v13, (uint64_t)CFSTR("VFXProgramDidChangeNotification"), (uint64_t)self, 0);
  }
}

- (NSString)fragmentShader
{
  return self->_fragmentShader;
}

- (void)setSemantic:(id)a3 forSymbol:(id)a4 options:(id)a5
{
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (!self->_semanticInfos)
    self->_semanticInfos = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_msgSend_infoWithSemantic_options_(VFXProgramSemanticInfo, a2, (uint64_t)a3, (uint64_t)a5);
  objc_msgSend_setValue_forKey_(self->_semanticInfos, v10, v9, (uint64_t)a4);
  v14 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v11, v12, v13);
  v18 = CFSTR("parameter");
  v19[0] = a4;
  v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v19, (uint64_t)&v18, 1);
  objc_msgSend_postNotificationName_object_userInfo_(v14, v17, (uint64_t)CFSTR("VFXProgramDidChangeNotification"), (uint64_t)self, v16);
}

- (id)semanticForSymbol:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_valueForKey_(self->_semanticInfos, a2, (uint64_t)a3, v3);
  return (id)objc_msgSend_semantic(v4, v5, v6, v7);
}

- (id)_optionsForSymbol:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_valueForKey_(self->_semanticInfos, a2, (uint64_t)a3, v3);
  return (id)objc_msgSend_options(v4, v5, v6, v7);
}

- (id)_allSymbolsWithVFXSemantic
{
  uint64_t v2;
  uint64_t v3;
  id result;

  result = self->_semanticInfos;
  if (result)
    return (id)objc_msgSend_allKeys(result, a2, v2, v3);
  return result;
}

- (void)setSemanticInfos:(id)a3
{
  uint64_t v3;
  NSMutableDictionary *semanticInfos;
  const char *v7;
  uint64_t v8;

  semanticInfos = self->_semanticInfos;
  if (semanticInfos)
  {
    objc_msgSend_removeAllObjects(semanticInfos, a2, (uint64_t)a3, v3);
    if (!a3)
      return;
    goto LABEL_3;
  }
  self->_semanticInfos = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a3)
LABEL_3:
    objc_msgSend_addEntriesFromDictionary_(self->_semanticInfos, v7, (uint64_t)a3, v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v8 = objc_msgSend_vertexShader(self, v5, v6, v7);
  objc_msgSend_setVertexShader_(v4, v9, v8, v10);
  v14 = objc_msgSend_vertexFunctionName(self, v11, v12, v13);
  objc_msgSend_setVertexFunctionName_(v4, v15, v14, v16);
  v20 = objc_msgSend_fragmentFunctionName(self, v17, v18, v19);
  objc_msgSend_setFragmentFunctionName_(v4, v21, v20, v22);
  v26 = objc_msgSend_fragmentShader(self, v23, v24, v25);
  objc_msgSend_setFragmentShader_(v4, v27, v26, v28);
  v32 = objc_msgSend_name(self, v29, v30, v31);
  objc_msgSend_setName_(v4, v33, v32, v34);
  objc_msgSend_setSemanticInfos_(v4, v35, (uint64_t)self->_semanticInfos, v36);
  return v4;
}

- (id)_bufferBindings
{
  return self->_bufferBindings;
}

- (void)handleBindingOfBufferNamed:(id)a3 frequency:(int64_t)a4 usingBlock:(id)a5
{
  NSMutableDictionary *bufferBindings;
  VFXBufferBinding *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  VFXBufferBinding *v31;

  bufferBindings = self->_bufferBindings;
  if (a5)
  {
    if (!bufferBindings)
      self->_bufferBindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = objc_alloc_init(VFXBufferBinding);
    objc_msgSend_setName_(v10, v11, (uint64_t)a3, v12);
    objc_msgSend_setFrequency_(v10, v13, a4, v14);
    v15 = _Block_copy(a5);
    objc_msgSend_setBlock_(v10, v16, (uint64_t)v15, v17);
    objc_msgSend_setValue_forKey_(self->_bufferBindings, v18, (uint64_t)v10, (uint64_t)a3);

    v22 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v19, v20, v21);
    objc_msgSend_postNotificationName_object_userInfo_(v22, v23, (uint64_t)CFSTR("VFXProgramDidChangeNotification"), (uint64_t)self, 0);
  }
  else
  {
    objc_msgSend_removeObjectForKey_(bufferBindings, a2, (uint64_t)a3, a4);
    v31 = objc_alloc_init(VFXBufferBinding);
    objc_msgSend_setName_(v31, v24, (uint64_t)a3, v25);
    v29 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v26, v27, v28);
    objc_msgSend_postNotificationName_object_userInfo_(v29, v30, (uint64_t)CFSTR("VFXProgramDidChangeNotification"), (uint64_t)self, 0);

  }
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)setSemantic:(id)a3 forSymbol:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_setSemantic_forSymbol_options_, a3, a4);
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (VFXProgramDelegate)delegate
{
  return (VFXProgramDelegate *)self->_delegate;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  NSString *vertexShader;
  NSString *fragmentShader;
  NSString *vertexFunctionName;
  NSString *sourceFile;
  NSString *fragmentFunctionName;
  NSString *name;
  NSMutableDictionary *semanticInfos;

  objc_msgSend__customEncodingOfVFXProgram_(self, a2, (uint64_t)a3, v3);
  vertexShader = self->_vertexShader;
  if (vertexShader)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)vertexShader, (uint64_t)CFSTR("vertexShader"));
  fragmentShader = self->_fragmentShader;
  if (fragmentShader)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)fragmentShader, (uint64_t)CFSTR("fragmentShader"));
  vertexFunctionName = self->_vertexFunctionName;
  if (vertexFunctionName)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)vertexFunctionName, (uint64_t)CFSTR("vertexFunctionName"));
  sourceFile = self->_sourceFile;
  if (sourceFile)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)sourceFile, (uint64_t)CFSTR("sourceFile"));
  fragmentFunctionName = self->_fragmentFunctionName;
  if (fragmentFunctionName)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)fragmentFunctionName, (uint64_t)CFSTR("fragmentFunctionName"));
  name = self->_name;
  if (name)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)name, (uint64_t)CFSTR("name"));
  semanticInfos = self->_semanticInfos;
  if (semanticInfos)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)semanticInfos, (uint64_t)CFSTR("semanticInfos"));
  objc_msgSend_encodeBool_forKey_(a3, v6, self->_opaque, (uint64_t)CFSTR("opaque"));
}

- (VFXProgram)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXProgram *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  objc_super v60;

  v60.receiver = self;
  v60.super_class = (Class)VFXProgram;
  v7 = -[VFXProgram init](&v60, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXProgram_(v7, v11, (uint64_t)a3, v12);
    v13 = objc_opt_class();
    v15 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("vertexShader"));
    objc_msgSend_setVertexShader_(v7, v16, v15, v17);
    v18 = objc_opt_class();
    v20 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v19, v18, (uint64_t)CFSTR("fragmentShader"));
    objc_msgSend_setFragmentShader_(v7, v21, v20, v22);
    v23 = objc_opt_class();
    v25 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v24, v23, (uint64_t)CFSTR("vertexFunctionName"));
    objc_msgSend_setVertexFunctionName_(v7, v26, v25, v27);
    v28 = objc_opt_class();
    v30 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v29, v28, (uint64_t)CFSTR("fragmentFunctionName"));
    objc_msgSend_setFragmentFunctionName_(v7, v31, v30, v32);
    v33 = objc_opt_class();
    v35 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v34, v33, (uint64_t)CFSTR("sourceFile"));
    objc_msgSend_setSourceFile_(v7, v36, v35, v37);
    v38 = objc_opt_class();
    v40 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v39, v38, (uint64_t)CFSTR("name"));
    objc_msgSend_setName_(v7, v41, v40, v42);
    v43 = (void *)sub_1B18BECA4();
    v44 = objc_opt_class();
    v47 = objc_msgSend_setByAddingObject_(v43, v45, v44, v46);
    v49 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v48, v47, (uint64_t)CFSTR("semanticInfos"));
    objc_msgSend_setSemanticInfos_(v7, v50, v49, v51);
    v54 = objc_msgSend_decodeBoolForKey_(a3, v52, (uint64_t)CFSTR("opaque"), v53);
    objc_msgSend_setOpaque_(v7, v55, v54, v56);
    objc_msgSend_setImmediateMode_(VFXTransaction, v57, v8, v58);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
