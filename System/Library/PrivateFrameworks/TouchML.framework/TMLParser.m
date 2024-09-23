@implementation TMLParser

- (TMLParser)initWithContext:(id)a3
{
  id v5;
  TMLParser *v6;
  TMLParser *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TMLParser;
  v6 = -[TMLParser init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_strict = 1;
  }

  return v7;
}

- (void)addPreprocessorMacro:(id)a3
{
  const char *v4;
  double v5;
  NSMutableSet *preprocessorMacros;
  id v7;
  const char *v8;
  double v9;
  NSMutableSet *v10;
  NSMutableSet *v11;
  char *v12;

  v4 = (const char *)a3;
  preprocessorMacros = self->_preprocessorMacros;
  v12 = (char *)v4;
  if (!preprocessorMacros)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCEF0]);
    v10 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    v11 = self->_preprocessorMacros;
    self->_preprocessorMacros = v10;

    v4 = v12;
    preprocessorMacros = self->_preprocessorMacros;
  }
  objc_msgSend_addObject_(preprocessorMacros, v4, v5, v4);

}

- (BOOL)parseFile:(id)a3
{
  id v4;
  void *v5;
  NSString *basePath;
  NSString *v7;
  NSString *filename;
  NSString *v9;
  const char *v10;
  double v11;
  NSString *v12;
  NSString *v13;
  const char *v14;
  double v15;
  NSString *v16;
  NSString *v17;
  const char *v18;
  double v19;
  TMLParser *v20;
  const char *v21;
  double v22;
  _QWORD *v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  uint64_t v28;
  NSMutableSet *functionIdentifiers;
  NSMutableSet *v30;
  NSMutableSet *v31;
  id v32;
  const char *v33;
  double v34;
  const char *v35;
  const char *v36;
  double v37;
  NSString *v38;
  NSString *error;
  BOOL v40;
  unint64_t state;
  _QWORD v43[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x22E2E7C4C]();
  basePath = self->_basePath;
  v7 = basePath;
  filename = self->_filename;
  v9 = filename;
  objc_msgSend_stringByDeletingLastPathComponent(v4, v10, v11);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v13 = self->_basePath;
  self->_basePath = v12;

  objc_msgSend_lastPathComponent(v4, v14, v15);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  v17 = self->_filename;
  self->_filename = v16;

  if (!self->_lookaheadComplete)
  {
    v20 = [TMLParser alloc];
    v23 = (_QWORD *)objc_msgSend_initWithContext_(v20, v21, v22, 0);
    objc_msgSend_parseFunctionLookaheadWithFile_(v23, v24, v25, v4);
    v28 = v23[16];
    if (v28)
    {
      functionIdentifiers = self->_functionIdentifiers;
      if (!functionIdentifiers)
      {
        objc_msgSend_set(MEMORY[0x24BDBCEF0], v26, v27);
        v30 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        v31 = self->_functionIdentifiers;
        self->_functionIdentifiers = v30;

        functionIdentifiers = self->_functionIdentifiers;
        v28 = v23[16];
      }
      objc_msgSend_unionSet_(functionIdentifiers, v26, v27, v28);
    }
    self->_lookaheadComplete = 1;

  }
  objc_msgSend_setup(self, v18, v19);
  v32 = objc_retainAutorelease(v4);
  v35 = (const char *)objc_msgSend_UTF8String(v32, v33, v34);
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = sub_22AD2F738;
  v43[3] = &unk_24F4FE3A8;
  v43[4] = self;
  if (sub_22AD7DFDC(v35, (uint64_t)v43))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v36, v37, CFSTR("Cannot read file at path %@"), v32);
    v38 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    error = self->_error;
    self->_error = v38;

    goto LABEL_10;
  }
  state = self->_state;
  if (state && state != 18)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v36, v37, CFSTR("Premature end of file at line %d"), self->_lineNo);
    v38 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend_teardown(self, v36, v37);
  objc_storeStrong((id *)&self->_basePath, basePath);
  objc_storeStrong((id *)&self->_filename, filename);

  objc_autoreleasePoolPop(v5);
  v40 = self->_error == 0;

  return v40;
}

- (BOOL)parseString:(id)a3
{
  return ((uint64_t (*)(TMLParser *, char *))MEMORY[0x24BEDD108])(self, sel_parseString_basePath_);
}

- (BOOL)parseString:(id)a3 basePath:(id)a4
{
  double v4;

  return objc_msgSend_parseString_basePath_filename_(self, a2, v4, a3, a4, 0);
}

- (BOOL)parseString:(id)a3 basePath:(id)a4 filename:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSString *basePath;
  NSString *filename;
  const char *v13;
  double v14;
  NSString *v15;
  NSString *v16;
  const char *v17;
  void *v18;
  double v19;
  TMLParser *v20;
  const char *v21;
  double v22;
  _QWORD *v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  uint64_t v28;
  NSMutableSet *functionIdentifiers;
  NSMutableSet *v30;
  NSMutableSet *v31;
  id v32;
  const char *v33;
  double v34;
  char *v35;
  const char *v36;
  double v37;
  unint64_t state;
  NSString *v39;
  NSString *error;
  BOOL v41;
  NSString *v43;
  NSString *v44;
  _QWORD v45[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  basePath = self->_basePath;
  v44 = basePath;
  filename = self->_filename;
  v43 = filename;
  v15 = (NSString *)objc_msgSend_copy(v9, v13, v14);
  v16 = self->_basePath;
  self->_basePath = v15;

  objc_storeStrong((id *)&self->_filename, a5);
  v18 = (void *)MEMORY[0x22E2E7C4C]();
  if (!self->_lookaheadComplete)
  {
    v20 = [TMLParser alloc];
    v23 = (_QWORD *)objc_msgSend_initWithContext_(v20, v21, v22, 0);
    objc_msgSend_parseFunctionLookaheadWithString_basePath_filename_(v23, v24, v25, v8, v9, v10);
    v28 = v23[16];
    if (v28)
    {
      functionIdentifiers = self->_functionIdentifiers;
      if (!functionIdentifiers)
      {
        objc_msgSend_set(MEMORY[0x24BDBCEF0], v26, v27);
        v30 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        v31 = self->_functionIdentifiers;
        self->_functionIdentifiers = v30;

        functionIdentifiers = self->_functionIdentifiers;
        v28 = v23[16];
      }
      objc_msgSend_unionSet_(functionIdentifiers, v26, v27, v28);
    }
    self->_lookaheadComplete = 1;

  }
  objc_msgSend_setup(self, v17, v19);
  v32 = objc_retainAutorelease(v8);
  v35 = (char *)objc_msgSend_UTF8String(v32, v33, v34);
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = sub_22AD2FA44;
  v45[3] = &unk_24F4FE3A8;
  v45[4] = self;
  sub_22AD7E05C(v35, (uint64_t)v45);
  state = self->_state;
  if (state && state != 18)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v36, v37, CFSTR("Premature end of file at line %u"), self->_lineNo);
    v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v39;

  }
  objc_msgSend_teardown(self, v36, v37);
  objc_storeStrong((id *)&self->_basePath, basePath);
  objc_storeStrong((id *)&self->_filename, filename);
  objc_autoreleasePoolPop(v18);
  v41 = self->_error == 0;

  return v41;
}

- (BOOL)parseFunctionLookaheadWithFile:(id)a3
{
  id v4;
  NSString *basePath;
  NSString *v6;
  NSString *filename;
  NSString *v8;
  const char *v9;
  double v10;
  NSString *v11;
  NSString *v12;
  const char *v13;
  double v14;
  NSString *v15;
  NSString *v16;
  void *v17;
  const char *v18;
  double v19;
  TMLMetaContext *context;
  id v21;
  const char *v22;
  double v23;
  const char *v24;
  const char *v25;
  double v26;
  NSString *v27;
  NSString *error;
  unint64_t state;
  BOOL v30;
  _QWORD v32[5];

  v4 = a3;
  basePath = self->_basePath;
  v6 = basePath;
  filename = self->_filename;
  v8 = filename;
  objc_msgSend_stringByDeletingLastPathComponent(v4, v9, v10);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = self->_basePath;
  self->_basePath = v11;

  objc_msgSend_lastPathComponent(v4, v13, v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = self->_filename;
  self->_filename = v15;

  v17 = (void *)MEMORY[0x22E2E7C4C]();
  objc_msgSend_setup(self, v18, v19);
  self->_lookaheadOnly = 1;
  context = self->_context;
  self->_context = 0;
  self->_state = 19;

  v21 = objc_retainAutorelease(v4);
  v24 = (const char *)objc_msgSend_UTF8String(v21, v22, v23);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_22AD2FD0C;
  v32[3] = &unk_24F4FE3A8;
  v32[4] = self;
  if (sub_22AD7DFDC(v24, (uint64_t)v32))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v25, v26, CFSTR("Cannot read file at path %@"), v21);
    v27 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    error = self->_error;
    self->_error = v27;

    goto LABEL_6;
  }
  state = self->_state;
  if (state > 0x13 || ((1 << state) & 0xC0001) == 0)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v25, v26, CFSTR("Premature end of file at line %d"), self->_lineNo);
    v27 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
LABEL_6:
  objc_msgSend_teardown(self, v25, v26);
  objc_storeStrong((id *)&self->_basePath, basePath);
  objc_storeStrong((id *)&self->_filename, filename);
  objc_autoreleasePoolPop(v17);
  v30 = self->_error == 0;

  return v30;
}

- (BOOL)parseFunctionLookaheadWithString:(id)a3 basePath:(id)a4 filename:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSString *basePath;
  NSString *filename;
  const char *v13;
  double v14;
  NSString *v15;
  NSString *v16;
  void *v17;
  const char *v18;
  double v19;
  TMLMetaContext *context;
  id v21;
  const char *v22;
  double v23;
  char *v24;
  const char *v25;
  double v26;
  unint64_t state;
  NSString *v28;
  NSString *error;
  BOOL v30;
  NSString *v32;
  NSString *v33;
  _QWORD v34[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  basePath = self->_basePath;
  v33 = basePath;
  filename = self->_filename;
  v32 = filename;
  v15 = (NSString *)objc_msgSend_copy(v9, v13, v14);
  v16 = self->_basePath;
  self->_basePath = v15;

  objc_storeStrong((id *)&self->_filename, a5);
  v17 = (void *)MEMORY[0x22E2E7C4C]();
  objc_msgSend_setup(self, v18, v19);
  self->_lookaheadOnly = 1;
  context = self->_context;
  self->_context = 0;
  self->_state = 19;

  v21 = objc_retainAutorelease(v8);
  v24 = (char *)objc_msgSend_UTF8String(v21, v22, v23);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_22AD2FFBC;
  v34[3] = &unk_24F4FE3A8;
  v34[4] = self;
  sub_22AD7E05C(v24, (uint64_t)v34);
  state = self->_state;
  if (state > 0x13 || ((1 << state) & 0xC0001) == 0)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v25, v26, CFSTR("Premature end of file at line %u"), self->_lineNo);
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v28;

  }
  objc_msgSend_teardown(self, v25, v26);
  objc_storeStrong((id *)&self->_basePath, basePath);
  objc_storeStrong((id *)&self->_filename, filename);
  objc_autoreleasePoolPop(v17);
  v30 = self->_error == 0;

  return v30;
}

- (BOOL)parseTokens:(id)a3 startingLine:(unint64_t)a4
{
  id v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  const char *v11;
  double v12;
  unint64_t state;
  NSString *v14;
  NSString *error;
  const char *v16;
  double v17;
  BOOL v18;
  _QWORD v20[6];
  _QWORD v21[4];

  v6 = a3;
  v7 = (void *)MEMORY[0x22E2E7C4C]();
  objc_msgSend_setup(self, v8, v9);
  self->_state = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = a4;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_22AD301EC;
  v20[3] = &unk_24F4FE3D0;
  v20[4] = self;
  v20[5] = v21;
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v10, COERCE_DOUBLE(3221225472), v20);
  state = self->_state;
  if (state && state != 18)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, v12, CFSTR("Premature end of file at line %u"), self->_lineNo);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v14;

  }
  _Block_object_dispose(v21, 8);
  objc_msgSend_teardown(self, v16, v17);
  objc_autoreleasePoolPop(v7);
  v18 = self->_error == 0;

  return v18;
}

- (void)setup
{
  double v2;
  NSString *error;
  id v5;
  const char *v6;
  double v7;
  NSMutableArray *v8;
  NSMutableArray *activeTokens;
  id v10;
  const char *v11;
  double v12;
  NSMutableSet *v13;
  NSMutableSet *declarationAttributes;
  id v15;
  const char *v16;
  double v17;
  NSMutableArray *v18;
  NSMutableArray *objectStack;

  objc_msgSend_teardown(self, a2, v2);
  self->_state = 0;
  error = self->_error;
  self->_error = 0;

  self->_lineNo = 0;
  if (!self->_activeTokens)
  {
    v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v8 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v5, v6, v7, 16);
    activeTokens = self->_activeTokens;
    self->_activeTokens = v8;

  }
  if (!self->_declarationAttributes)
  {
    v10 = objc_alloc(MEMORY[0x24BDBCEF0]);
    v13 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v10, v11, v12, 4);
    declarationAttributes = self->_declarationAttributes;
    self->_declarationAttributes = v13;

  }
  if (!self->_objectStack)
  {
    v15 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v18 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v15, v16, v17, 4);
    objectStack = self->_objectStack;
    self->_objectStack = v18;

  }
}

- (void)teardown
{
  NSString *declarationType;
  const char *v4;
  double v5;
  NSString *methodSelector;
  NSString *lastIdent;
  TMLMetaObject *activeObject;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;

  declarationType = self->_declarationType;
  self->_declarationType = 0;

  objc_msgSend_removeAllObjects(self->_declarationAttributes, v4, v5);
  methodSelector = self->_methodSelector;
  self->_methodSelector = 0;

  lastIdent = self->_lastIdent;
  self->_lastIdent = 0;

  activeObject = self->_activeObject;
  self->_activeObject = 0;

  objc_msgSend_removeAllObjects(self->_activeTokens, v9, v10);
  objc_msgSend_removeAllObjects(self->_objectStack, v11, v12);
  objc_msgSend_commit(self->_context, v13, v14);
}

- (BOOL)consumeToken:(unint64_t)a3 text:(const char *)a4
{
  double v4;
  uint64_t v5;
  unint64_t v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  NSMutableSet *declarationAttributes;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;
  int v38;
  NSString *v39;
  NSString *lookaheadCurrentIdent;
  const char *v41;
  double v42;
  NSMutableSet *functionIdentifiers;
  NSMutableSet *v44;
  NSMutableSet *v45;
  void *v46;
  const char *v47;
  double v48;
  char isEqualToString;
  const char *v50;
  double v51;
  void *v52;
  const char *v53;
  double v54;
  const char *v55;
  double v56;
  const char *v57;
  double v58;
  NSString *v59;
  NSString *v60;
  NSString *v61;
  const char *v62;
  double v63;
  NSString *v64;
  const char *v65;
  double v66;
  void **p_lastIdent;
  const char *v68;
  double v69;
  const char *v70;
  double v71;
  NSString *v72;
  NSString *declarationType;
  const char *v74;
  double v75;
  uint64_t v76;
  const char *v77;
  double v78;
  NSString *v79;
  const char *v80;
  double v81;
  const char *v82;
  double v83;
  const char *v84;
  double v85;
  const char *v86;
  double v87;
  TMLMetaObject *v88;
  const char *v89;
  double v90;
  TMLMetaObject *v91;
  const char *v92;
  double v93;
  const char *v94;
  double v95;
  NSString *v96;
  const char *v97;
  double v98;
  NSString *v99;
  NSString *v100;
  const char *v101;
  double v102;
  const char *v103;
  double v104;
  const char *v105;
  double v106;
  TMLMetaObject *v107;
  const char *v108;
  double v109;
  TMLMetaObject *activeObject;
  NSString *lastIdent;
  const char *v112;
  double v113;
  unint64_t v114;
  const char *v115;
  double v116;
  NSString *v117;
  const char *v118;
  double v119;
  const char *v120;
  double v121;
  NSString *v122;
  NSString *methodSelector;
  unint64_t v124;
  NSString *v125;
  const char *v126;
  double v127;
  const char *v128;
  double v129;
  uint64_t v130;
  const char *v131;
  double v132;
  NSString *v133;
  NSString *v134;
  NSString *v135;
  const char *v136;
  double v137;

  if (self->_error)
    goto LABEL_2;
  switch(self->_state)
  {
    case 0uLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 > 15)
      {
        switch(a3)
        {
          case 0x10uLL:
            goto LABEL_92;
          case 0x11uLL:
            goto LABEL_107;
          case 0x13uLL:
            goto LABEL_112;
          case 0x14uLL:
            if (objc_msgSend_length(self->_lastIdent, a2, v4))
              goto LABEL_2;
            self->_state = 14;
            objc_msgSend_removeAllObjects(self->_activeTokens, v103, v104);
            objc_msgSend_consumeToken_text_(self, v105, v106, 20, a4);
            goto LABEL_182;
          default:
            return v5;
        }
      }
      if (a3 < 2)
        goto LABEL_182;
      if (a3 == 2)
      {
        v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
        if (!v5)
          return v5;
        v107 = [TMLMetaObject alloc];
        v91 = (TMLMetaObject *)objc_msgSend_initWithType_attributes_(v107, v108, v109, self->_lastIdent, self->_declarationAttributes);
LABEL_154:
        activeObject = self->_activeObject;
        self->_activeObject = v91;

        lastIdent = self->_lastIdent;
        self->_lastIdent = 0;

        v9 = 1;
      }
      else
      {
        if (a3 != 6)
          return v5;
        objc_msgSend_removeAllObjects(self->_declarationAttributes, a2, v4);
        v9 = 2;
      }
      goto LABEL_104;
    case 1uLL:
      LOBYTE(v5) = 0;
      switch(a3)
      {
        case 0uLL:
          goto LABEL_182;
        case 1uLL:
          if (!objc_msgSend_length(self->_lastIdent, a2, v4))
            goto LABEL_182;
          goto LABEL_2;
        case 2uLL:
          v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
          if (!v5)
            return v5;
          if (self->_activeObject)
            objc_msgSend_addObject_(self->_objectStack, v86, v87);
          v88 = [TMLMetaObject alloc];
          v91 = (TMLMetaObject *)objc_msgSend_initWithType_attributes_(v88, v89, v90, self->_lastIdent, 0);
          goto LABEL_154;
        case 3uLL:
          self->_state = 0;
          objc_msgSend_commitObject(self, a2, v4);
          goto LABEL_182;
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 9uLL:
          return v5;
        case 8uLL:
          v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
          if (!v5)
            return v5;
          objc_msgSend_removeAllObjects(self->_activeTokens, v92, v93);
          v9 = 3;
          goto LABEL_104;
        case 0xAuLL:
          v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
          if (!v5)
            return v5;
          v96 = self->_lastIdent;
          objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v94, v95, a4, 4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingString_(v96, v97, v98, v19);
          v99 = (NSString *)objc_claimAutoreleasedReturnValue();
          v100 = self->_lastIdent;
          self->_lastIdent = v99;
          goto LABEL_145;
        default:
          if (a3 != 19)
            return v5;
          objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, v4, a4, 4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          p_lastIdent = (void **)&self->_lastIdent;
          if (!objc_msgSend_length(self->_lastIdent, v68, v69)
            && objc_msgSend_isEqualToString_(v19, v70, v71, CFSTR("property")))
          {
            v72 = self->_lastIdent;
            self->_state = 4;
            self->_lastIdent = 0;

            declarationType = self->_declarationType;
            self->_declarationType = 0;

            objc_msgSend_removeAllObjects(self->_declarationAttributes, v74, v75);
            goto LABEL_42;
          }
          if (!objc_msgSend_length(*p_lastIdent, v70, v71)
            && objc_msgSend_isEqualToString_(v19, v112, v113, CFSTR("initializer")))
          {
            v114 = 12;
LABEL_164:
            v117 = self->_lastIdent;
            self->_state = v114;
            self->_lastIdent = 0;

LABEL_178:
            objc_msgSend_removeAllObjects(self->_activeTokens, v118, v119);
            goto LABEL_42;
          }
          if (!objc_msgSend_length(*p_lastIdent, v112, v113)
            && objc_msgSend_isEqualToString_(v19, v115, v116, CFSTR("implements")))
          {
            v114 = 13;
            goto LABEL_164;
          }
          if (!objc_msgSend_length(*p_lastIdent, v115, v116)
            && objc_msgSend_isEqualToString_(v19, v120, v121, CFSTR("signal")))
          {
            v122 = self->_lastIdent;
            self->_state = 6;
            self->_lastIdent = 0;

            methodSelector = self->_methodSelector;
            self->_methodSelector = 0;

            goto LABEL_178;
          }
          if (!objc_msgSend_length(*p_lastIdent, v120, v121)
            && ((objc_msgSend_isEqualToString_(v19, v128, v129, CFSTR("method")) & 1) != 0
             || objc_msgSend_isEqualToString_(v19, v131, v132, CFSTR("constructor"))))
          {
            v133 = self->_lastIdent;
            self->_state = 9;
            self->_lastIdent = 0;

            v134 = self->_declarationType;
            self->_declarationType = 0;

            v135 = self->_methodSelector;
            self->_methodSelector = 0;

            self->_methodDeclaration = objc_msgSend_isEqualToString_(v19, v136, v137, CFSTR("method"));
            goto LABEL_178;
          }
          if (*p_lastIdent)
          {
            objc_msgSend_stringByAppendingString_(*p_lastIdent, v128, v129, v19);
            v130 = objc_claimAutoreleasedReturnValue();
            v100 = (NSString *)*p_lastIdent;
            *p_lastIdent = (void *)v130;
LABEL_145:

          }
          else
          {
            objc_storeStrong((id *)&self->_lastIdent, v19);
          }
LABEL_42:

          break;
      }
      goto LABEL_182;
    case 2uLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 > 18)
        goto LABEL_39;
      if (!a3)
        goto LABEL_182;
      if (a3 != 7)
        return v5;
      goto LABEL_59;
    case 3uLL:
      switch(a3)
      {
        case 0uLL:
          if (objc_msgSend_count(self->_activeTokens, a2, v4))
            objc_msgSend_addToken_text_(self, v65, v66, 0, a4);
          goto LABEL_182;
        case 1uLL:
        case 3uLL:
        case 9uLL:
          if (objc_msgSend_blockValueDepth(self, a2, v4))
            goto LABEL_181;
          objc_msgSend_commitProperty(self, a2, v4);
          goto LABEL_53;
        default:
          goto LABEL_181;
      }
    case 4uLL:
      LOBYTE(v5) = 0;
      switch(a3)
      {
        case 0uLL:
          goto LABEL_182;
        case 1uLL:
        case 3uLL:
        case 9uLL:
          v5 = objc_msgSend_length(self->_declarationType, a2, v4);
          if (!v5)
            return v5;
          self->_state = 3;
          objc_msgSend_consumeToken_text_(self, v12, v13, a3, a4);
          goto LABEL_182;
        case 2uLL:
        case 4uLL:
        case 5uLL:
        case 7uLL:
          return v5;
        case 6uLL:
          if (objc_msgSend_length(self->_declarationType, a2, v4))
            goto LABEL_2;
          v9 = 5;
          goto LABEL_104;
        case 8uLL:
          v5 = objc_msgSend_length(self->_declarationType, a2, v4);
          if (!v5)
            return v5;
          self->_state = 1;
          objc_msgSend_consumeToken_text_(self, v101, v102, 8, a4);
          goto LABEL_182;
        default:
          if (a3 != 19)
            return v5;
          v76 = objc_msgSend_length(self->_declarationType, a2, v4);
          objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v77, v78, a4, 4);
          v79 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (v76)
          {
            v59 = self->_lastIdent;
            self->_lastIdent = v79;
            goto LABEL_127;
          }
          v61 = self->_declarationType;
          self->_declarationType = v79;
          break;
      }
LABEL_113:

      goto LABEL_182;
    case 5uLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 > 18)
        goto LABEL_39;
      if (!a3)
        goto LABEL_182;
      if (a3 != 7)
        return v5;
      v9 = 4;
      goto LABEL_104;
    case 6uLL:
      LOBYTE(v5) = 0;
      switch(a3)
      {
        case 0uLL:
          goto LABEL_182;
        case 1uLL:
        case 3uLL:
        case 9uLL:
          v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
          if (!v5)
            return v5;
          objc_msgSend_commitSignal(self, v14, v15);
          goto LABEL_53;
        case 2uLL:
        case 4uLL:
        case 5uLL:
        case 7uLL:
        case 8uLL:
          return v5;
        case 6uLL:
          if (!objc_msgSend_length(self->_lastIdent, a2, v4))
          {
            v124 = 7;
            goto LABEL_170;
          }
          if (objc_msgSend_count(self->_activeTokens, v82, v83))
            goto LABEL_2;
          v9 = 8;
          break;
        default:
          goto LABEL_86;
      }
      goto LABEL_104;
    case 7uLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 > 18)
        goto LABEL_39;
      goto LABEL_32;
    case 8uLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 > 18)
        goto LABEL_81;
LABEL_32:
      if (!a3)
        goto LABEL_182;
      if (a3 != 7)
        return v5;
      v9 = 6;
      goto LABEL_104;
    case 9uLL:
      LOBYTE(v5) = 0;
      switch(a3)
      {
        case 0uLL:
          goto LABEL_182;
        case 1uLL:
        case 3uLL:
        case 9uLL:
          v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
          if (!v5)
            return v5;
          objc_msgSend_commitMethod(self, v16, v17);
          goto LABEL_53;
        case 2uLL:
        case 4uLL:
        case 5uLL:
        case 7uLL:
        case 8uLL:
          return v5;
        case 6uLL:
          if (!objc_msgSend_length(self->_lastIdent, a2, v4))
          {
            v124 = 10;
LABEL_170:
            self->_state = v124;
            v125 = self->_methodSelector;
            self->_methodSelector = 0;

            objc_msgSend_removeAllObjects(self->_declarationAttributes, v126, v127);
            goto LABEL_182;
          }
          if (objc_msgSend_count(self->_activeTokens, v84, v85))
            goto LABEL_2;
          v9 = 11;
          goto LABEL_104;
        default:
LABEL_86:
          if (a3 != 18)
          {
            if (a3 != 19)
              return v5;
            if (objc_msgSend_length(self->_lastIdent, a2, v4))
            {
              if (objc_msgSend_length(self->_declarationType, a2, v4))
                goto LABEL_2;
              objc_storeStrong((id *)&self->_declarationType, self->_lastIdent);
            }
LABEL_112:
            objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, v4, a4, 4);
            v60 = (NSString *)objc_claimAutoreleasedReturnValue();
            v61 = self->_lastIdent;
            self->_lastIdent = v60;
            goto LABEL_113;
          }
          v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
          if (!v5)
            return v5;
          if (!self->_methodSelector)
          {
            objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v62, v63, a4, 4);
            v64 = (NSString *)objc_claimAutoreleasedReturnValue();
            v61 = self->_methodSelector;
            self->_methodSelector = v64;
            goto LABEL_113;
          }
          break;
      }
      goto LABEL_2;
    case 0xAuLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 <= 18)
        goto LABEL_44;
LABEL_39:
      if (a3 != 21)
      {
        if (a3 != 19)
          return v5;
        declarationAttributes = self->_declarationAttributes;
        objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, v4, a4, 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(declarationAttributes, v20, v21, v19);
        goto LABEL_42;
      }
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, v4, a4, 4);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v46, v47, v48, CFSTR(","));

      if ((isEqualToString & 1) == 0)
        goto LABEL_2;
      goto LABEL_182;
    case 0xBuLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 <= 18)
      {
LABEL_44:
        if (!a3)
          goto LABEL_182;
        if (a3 == 7)
        {
          v9 = 9;
          goto LABEL_104;
        }
        return v5;
      }
LABEL_81:
      if (a3 != 21)
      {
LABEL_82:
        if (a3 != 19)
          return v5;
LABEL_83:
        objc_msgSend_addToken_text_(self, a2, v4, 19, a4);
        goto LABEL_182;
      }
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, v4, a4, 4);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v52, v53, v54, CFSTR(",")) & 1) != 0)
      {
        objc_msgSend_addToken_text_(self, v55, v56, 21, a4);

        goto LABEL_182;
      }

      goto LABEL_2;
    case 0xCuLL:
      switch(a3)
      {
        case 0uLL:
          goto LABEL_182;
        case 1uLL:
        case 3uLL:
        case 9uLL:
          v5 = objc_msgSend_count(self->_activeTokens, a2, v4);
          if (!v5)
            return v5;
          objc_msgSend_commitInitializer(self, v22, v23);
          break;
        default:
          goto LABEL_181;
      }
      goto LABEL_53;
    case 0xDuLL:
      LOBYTE(v5) = 0;
      switch(a3)
      {
        case 0uLL:
          goto LABEL_182;
        case 1uLL:
        case 3uLL:
        case 9uLL:
          v5 = objc_msgSend_count(self->_activeTokens, a2, v4);
          if (!v5)
            return v5;
          objc_msgSend_commitImplements(self, v24, v25);
          break;
        case 2uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
          return v5;
        default:
          goto LABEL_82;
      }
LABEL_53:
      self->_state = 1;
      if (a3 == 3)
        objc_msgSend_consumeToken_text_(self, v10, v11, 3, a4);
      goto LABEL_182;
    case 0xEuLL:
      if (a3 != 3)
        goto LABEL_181;
      v5 = objc_msgSend_blockValueDepth(self, a2, v4);
      if (!v5)
        return v5;
      if (v5 != 1)
        goto LABEL_181;
      objc_msgSend_addToken_text_(self, a2, v4, 3, a4);
      objc_msgSend_commitFunction(self, v26, v27);
LABEL_59:
      self->_state = 0;
      goto LABEL_182;
    case 0xFuLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 > 13)
      {
        switch(a3)
        {
          case 0xEuLL:
          case 0x13uLL:
          case 0x15uLL:
            goto LABEL_181;
          case 0x10uLL:
            if (objc_msgSend_count(self->_activeTokens, a2, v4))
              goto LABEL_2;
            objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v28, v29, a4, 4);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend_isEqualToString_(v30, v31, v32, CFSTR("@macro")) & 1) != 0
              || (objc_msgSend_isEqualToString_(v30, v33, v34, CFSTR("@ifdef")) & 1) != 0
              || (objc_msgSend_isEqualToString_(v30, v33, v34, CFSTR("@ifndef")) & 1) != 0)
            {
              objc_msgSend_addToken_text_(self, v33, v34, 16, a4);
              self->_state = 16;

              goto LABEL_182;
            }

            break;
          default:
            return v5;
        }
        goto LABEL_181;
      }
      if (!a3)
        goto LABEL_182;
      if (a3 == 1 || a3 == 9)
      {
LABEL_101:
        objc_msgSend_commitPragma(self, a2, v4);
        goto LABEL_102;
      }
      return v5;
    case 0x10uLL:
      if (a3 != 16)
        goto LABEL_181;
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, v4, a4, 4);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend_isEqualToString_(v35, v36, v37, CFSTR("@end"));

      if (!v38)
        goto LABEL_181;
      objc_msgSend_addToken_text_(self, a2, v4, 16, a4);
      goto LABEL_101;
    case 0x11uLL:
      if ((uint64_t)a3 <= 15)
      {
        if (!a3)
          goto LABEL_182;
        if (a3 == 1 || a3 == 9)
        {
          objc_msgSend_commitMacro(self, a2, v4);
LABEL_102:
          v9 = 19;
          if (!self->_lookaheadOnly)
            v9 = 0;
LABEL_104:
          self->_state = v9;
LABEL_182:
          LOBYTE(v5) = self->_error == 0;
          return v5;
        }
LABEL_181:
        objc_msgSend_addToken_text_(self, a2, v4, a3, a4);
        goto LABEL_182;
      }
      LOBYTE(v5) = 0;
      if (a3 != 16 && a3 != 20)
      {
        if (a3 == 17 && objc_msgSend_count(self->_activeTokens, a2, v4))
        {
LABEL_2:
          LOBYTE(v5) = 0;
          return v5;
        }
        goto LABEL_181;
      }
      return v5;
    case 0x13uLL:
      switch(a3)
      {
        case 0x10uLL:
LABEL_92:
          self->_state = 15;
          objc_msgSend_removeAllObjects(self->_activeTokens, a2, v4);
          objc_msgSend_consumeToken_text_(self, v50, v51, 16, a4);
          goto LABEL_182;
        case 0x11uLL:
LABEL_107:
          self->_state = 17;
          objc_msgSend_removeAllObjects(self->_activeTokens, a2, v4);
          objc_msgSend_consumeToken_text_(self, v57, v58, 17, a4);
          goto LABEL_182;
        case 0x12uLL:
          goto LABEL_181;
        case 0x13uLL:
          if (self->_lookaheadInFunction && !self->_lookaheadCurrentIdent)
          {
            objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, v4, a4, 4);
            v39 = (NSString *)objc_claimAutoreleasedReturnValue();
            lookaheadCurrentIdent = self->_lookaheadCurrentIdent;
            self->_lookaheadCurrentIdent = v39;

            functionIdentifiers = self->_functionIdentifiers;
            if (!functionIdentifiers)
            {
              objc_msgSend_set(MEMORY[0x24BDBCEF0], v41, v42);
              v44 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
              v45 = self->_functionIdentifiers;
              self->_functionIdentifiers = v44;

              functionIdentifiers = self->_functionIdentifiers;
            }
            objc_msgSend_addObject_(functionIdentifiers, v41, v42, self->_lookaheadCurrentIdent);
          }
          goto LABEL_83;
        case 0x14uLL:
          if (objc_msgSend_blockValueDepth(self, a2, v4))
          {
            objc_msgSend_addToken_text_(self, v80, v81, 20, a4);
            goto LABEL_182;
          }
          self->_lookaheadInFunction = 1;
          goto LABEL_160;
        default:
          if (a3 != 3)
            goto LABEL_181;
          if (self->_lookaheadInFunction && objc_msgSend_blockValueDepth(self, a2, v4) == 1)
          {
            self->_lookaheadInFunction = 0;
            v59 = self->_lookaheadCurrentIdent;
            self->_lookaheadCurrentIdent = 0;
LABEL_127:

LABEL_160:
            objc_msgSend_removeAllObjects(self->_activeTokens, v80, v81);
          }
          else
          {
            objc_msgSend_addToken_text_(self, a2, v4, 3, a4);
          }
          break;
      }
      goto LABEL_182;
    default:
      goto LABEL_182;
  }
}

- (void)addToken:(unint64_t)a3 text:(const char *)a4
{
  double v4;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  NSMutableArray *activeTokens;
  TMLParserToken *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  id v28;

  objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, v4, a4, 4);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 22)
  {
    objc_msgSend_newlineCharacterSet(MEMORY[0x24BDD14A8], v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_rangeOfCharacterFromSet_(v28, v10, v11, v9);

    v15 = objc_msgSend_length(v28, v13, v14);
    objc_msgSend_substringWithRange_(v28, v16, v17, v12 + 1, v15 - 2 * v12 - 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v19, v20, CFSTR("'%@'"), v18);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 14;
  }
  activeTokens = self->_activeTokens;
  v22 = [TMLParserToken alloc];
  v25 = (void *)objc_msgSend_initWithToken_text_(v22, v23, v24, a3, v28);
  objc_msgSend_addObject_(activeTokens, v26, v27, v25);

}

- (unint64_t)blockValueDepth
{
  NSMutableArray *activeTokens;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  activeTokens = self->_activeTokens;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_22AD31160;
  v5[3] = &unk_24F4FE3F8;
  v5[4] = &v6;
  objc_msgSend_enumerateObjectsUsingBlock_(activeTokens, a2, COERCE_DOUBLE(3221225472), v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)commitObject
{
  double v2;
  const char *v4;
  double v5;
  TMLMetaObject *v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  TMLMetaObject *activeObject;
  void *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  NSString *v21;
  NSString *error;
  TMLMetaObject *v23;
  void *v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  uint64_t v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  uint64_t v37;

  if (objc_msgSend_count(self->_objectStack, a2, v2))
  {
    objc_msgSend_lastObject(self->_objectStack, v4, v5);
    v6 = (TMLMetaObject *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeLastObject(self->_objectStack, v7, v8);
    objc_msgSend_addObject_(v6, v9, v10, self->_activeObject);
    self->_state = 1;
    activeObject = self->_activeObject;
    self->_activeObject = v6;
LABEL_3:

    return;
  }
  objc_msgSend_identifier(self->_activeObject, v4, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_length(v12, v13, v14);

  if (!v15)
  {
    if (self->_strict)
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_type(self->_activeObject, v16, v17);
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v18, v19, v20, CFSTR("Missing id property for object of type %@ at line %u"), v37, self->_lineNo);
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v21;

      activeObject = (TMLMetaObject *)v37;
      goto LABEL_3;
    }
    v23 = self->_activeObject;
    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_type(v23, v16, v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objects(self->_context, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_count(v28, v29, v30);
    objc_msgSend_stringWithFormat_(v24, v32, v33, CFSTR("%@-%ld"), v25, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_(v23, v35, v36, CFSTR("id"), v34);

  }
  objc_msgSend_addObject_(self->_context, v16, v17, self->_activeObject);
}

- (void)commitProperty
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  BOOL v13;
  NSString *declarationType;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  NSString *v22;
  NSString *error;
  const char *v24;
  uint64_t v25;
  double v26;
  NSMutableArray *activeTokens;
  void *v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  const char *v36;
  double v37;
  uint64_t v38;
  const char *v39;
  double v40;
  id v41;
  const char *v42;
  double v43;
  void *v44;
  NSString *v45;
  uint64_t v46;
  const char *v47;
  double v48;
  void *v49;
  const char *v50;
  double v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  double v55;
  void *v56;
  const char *v57;
  double v58;
  int v59;
  NSString *v60;
  uint64_t v61;
  const char *v62;
  double v63;
  void *v64;
  const char *v65;
  double v66;
  void *v67;
  const char *v68;
  double v69;
  void *v70;
  const char *v71;
  double v72;
  void *v73;
  const char *v74;
  double v75;
  void *v76;
  NSString *v77;
  const char *v78;
  double v79;
  uint64_t v80;
  const char *v81;
  double v82;
  void *v83;
  const char *v84;
  double v85;
  void *v86;
  const char *v87;
  double v88;
  void *v89;
  const char *v90;
  double v91;
  void *v92;
  const char *v93;
  double v94;
  uint64_t v95;
  const char *v96;
  double v97;
  void *v98;
  const char *v99;
  void *v100;
  const char *v101;
  double v102;
  uint64_t v103;
  const char *v104;
  double v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t i;
  void *v109;
  const char *v110;
  double v111;
  void *v112;
  NSString *lastIdent;
  const char *v114;
  double v115;
  void *v116;
  const char *v117;
  double v118;
  const char *v119;
  double v120;
  const char *v121;
  double v122;
  int v123;
  void *v124;
  void *v125;
  const char *v126;
  double v127;
  int v128;
  const char *v129;
  double v130;
  uint64_t v131;
  const char *v132;
  double v133;
  void *v134;
  const char *v135;
  double v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  double v140;
  int isEqualToString;
  const char *v142;
  double v143;
  uint64_t v144;
  void *v145;
  TMLSignalHandlerFunction *v146;
  const char *v147;
  double v148;
  void *v149;
  const char *v150;
  double v151;
  void *v152;
  NSString *v153;
  const char *v154;
  double v155;
  NSString *v156;
  NSString *v157;
  id v158;
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _BYTE v164[128];
  uint64_t v165;

  v165 = *MEMORY[0x24BDAC8D0];
  if (!self->_lastIdent)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_type(self->_activeObject, a2, v2);
    v158 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v19, v20, v21, CFSTR("Missing property name for type %@ at line %d"), v158, self->_lineNo);
LABEL_7:
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v22;

    return;
  }
  objc_msgSend_lastObject(self->_activeTokens, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_token(v4, v5, v6);

  if (!v7)
    objc_msgSend_removeLastObject(self->_activeTokens, v8, v9);
  v11 = objc_msgSend_length(self->_declarationType, v8, v9);
  v13 = v11 != 0;
  if (v11)
  {
    objc_msgSend_addPropertyDeclaration_typeName_attributes_(self->_activeObject, v10, v12, self->_lastIdent, self->_declarationType, self->_declarationAttributes);
    declarationType = self->_declarationType;
    self->_declarationType = 0;

    objc_msgSend_removeAllObjects(self->_declarationAttributes, v15, v16);
    goto LABEL_9;
  }
  if (!objc_msgSend_count(self->_activeTokens, v10, v12))
  {
    v112 = (void *)MEMORY[0x24BDD17C8];
    lastIdent = self->_lastIdent;
    objc_msgSend_type(self->_activeObject, v17, v18);
    v158 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v112, v114, v115, CFSTR("Missing value for property '%@' of type %@ at line %d"), lastIdent, v158, self->_lineNo);
    goto LABEL_7;
  }
LABEL_9:
  v25 = objc_msgSend_count(self->_activeTokens, v17, v18);
  activeTokens = self->_activeTokens;
  if (v25 == 1)
  {
    objc_msgSend_objectAtIndexedSubscript_(activeTokens, v24, v26, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    switch(objc_msgSend_token(v28, v29, v30))
    {
      case 11:
        v34 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_text(v28, v31, v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend_integerValue(v35, v36, v37);
        objc_msgSend_numberWithInteger_(v34, v39, v40, v38);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      case 12:
        v116 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_text(v28, v31, v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_floatValue(v35, v117, v118);
        objc_msgSend_numberWithFloat_(v116, v119, v120);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      case 13:
        objc_msgSend_text(v28, v31, v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = objc_msgSend_BOOLValue(v35, v121, v122);
        v124 = (void *)MEMORY[0x24BDBD1C0];
        if (v123)
          v124 = (void *)MEMORY[0x24BDBD1C8];
        v41 = v124;
LABEL_34:
        v33 = v41;

        goto LABEL_48;
      case 14:
        objc_msgSend_text(v28, v31, v32);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = objc_msgSend_characterAtIndex_(v125, v126, v127, 0);
        v131 = objc_msgSend_length(v125, v129, v130);
        objc_msgSend_substringWithRange_(v125, v132, v133, 1, v131 - 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v128 == 34)
        {
          v134 = (void *)objc_opt_class();
          objc_msgSend_unescapeString_(v134, v135, v136, v33);
          v137 = objc_claimAutoreleasedReturnValue();

          v33 = (void *)v137;
        }
        goto LABEL_48;
      case 15:
        break;
      case 19:
        objc_msgSend_text(v28, v31, v32);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v138, v139, v140, CFSTR("null"));

        if (isEqualToString)
        {
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v142, v143);
          v144 = objc_claimAutoreleasedReturnValue();
LABEL_45:
          v33 = (void *)v144;
          goto LABEL_48;
        }
        if ((objc_msgSend_isEqualToString_(self->_lastIdent, v142, v143, CFSTR("id")) & 1) != 0
          || (objc_msgSend_isEqualToString_(self->_lastIdent, v31, v32, CFSTR("superclass")) & 1) != 0
          || objc_msgSend_isEqualToString_(self->_lastIdent, v31, v32, CFSTR("nativeclass")))
        {
          objc_msgSend_text(v28, v31, v32);
          v144 = objc_claimAutoreleasedReturnValue();
          goto LABEL_45;
        }
        break;
      default:
        goto LABEL_48;
    }
  }
  else
  {
    if (!objc_msgSend_count(activeTokens, v24, v26))
    {
      if (v11)
      {
LABEL_51:
        objc_msgSend_removeAllObjects(self->_activeTokens, v42, v43);
        v33 = self->_lastIdent;
        self->_lastIdent = 0;
        goto LABEL_53;
      }
LABEL_52:
      v152 = (void *)MEMORY[0x24BDD17C8];
      v153 = self->_lastIdent;
      objc_msgSend_type(self->_activeObject, v42, v43);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v152, v154, v155, CFSTR("Unrecognized value for '%@' of type %@ at line %d"), v153, v33, self->_lineNo);
      v156 = (NSString *)objc_claimAutoreleasedReturnValue();
      v157 = self->_error;
      self->_error = v156;

      goto LABEL_53;
    }
    if (qword_255B51AD8 != -1)
      dispatch_once(&qword_255B51AD8, &unk_24F4FE418);
    v44 = (void *)qword_255B51AE0;
    v45 = self->_lastIdent;
    v46 = objc_msgSend_length(v45, v42, v43);
    objc_msgSend_firstMatchInString_options_range_(v44, v47, v48, v45, 0, 0, v46);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend_firstObject(self->_activeTokens, v31, v32);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend_token(v49, v50, v51);

      if (v52 == 2
        || (objc_msgSend_firstObject(self->_activeTokens, v31, v32),
            v53 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_text(v53, v54, v55),
            v56 = (void *)objc_claimAutoreleasedReturnValue(),
            v59 = objc_msgSend_isEqualToString_(v56, v57, v58, CFSTR("function")),
            v56,
            v53,
            v59))
      {
        v60 = self->_lastIdent;
        v61 = objc_msgSend_rangeAtIndex_(v28, v31, v32, 3);
        objc_msgSend_substringWithRange_(v60, v62, v63, v61, v62);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringWithRange_(v64, v65, v66, 0, 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v67, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringFromIndex_(v64, v71, v72, 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v70, v74, v75, v73);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        v77 = self->_lastIdent;
        v80 = objc_msgSend_rangeAtIndex_(v28, v78, v79, 1);
        objc_msgSend_substringWithRange_(v77, v81, v82, v80, v81);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v83, v84, v85, v76);
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_signalDeclaration_(self->_activeObject, v87, v88, v86);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_parameters(v89, v90, v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend_count(v92, v93, v94);

        if (v95)
        {
          v159 = v76;
          objc_msgSend_set(MEMORY[0x24BDBCEF0], v96, v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v160 = 0u;
          v161 = 0u;
          v162 = 0u;
          v163 = 0u;
          objc_msgSend_parameters(v89, v99, 0.0);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v101, v102, &v160, v164, 16);
          if (v103)
          {
            v106 = v103;
            v107 = *(_QWORD *)v161;
            do
            {
              for (i = 0; i != v106; ++i)
              {
                if (*(_QWORD *)v161 != v107)
                  objc_enumerationMutation(v100);
                objc_msgSend_propertyName(*(void **)(*((_QWORD *)&v160 + 1) + 8 * i), v104, v105);
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v98, v110, v111, v109);

              }
              v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v104, v105, &v160, v164, 16);
            }
            while (v106);
          }

          v76 = v159;
        }
        else
        {
          v98 = 0;
        }
        objc_msgSend_compileFunction_bodyOnly_localVars_(self, v96, v97, self->_activeTokens, 0, v98);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = [TMLSignalHandlerFunction alloc];
        v149 = (void *)objc_msgSend_initWithSignalName_functionName_body_(v146, v147, v148, v76, self->_lastIdent, v145);
        objc_msgSend_addSignalHandler_signalTarget_(self->_activeObject, v150, v151, v149, v86);

        v33 = 0;
        v13 = 1;
        goto LABEL_48;
      }
    }
  }
  objc_msgSend_compileExpression_(self, v31, v32, self->_activeTokens);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_error)
  {
LABEL_48:

    if (v33)
    {
      objc_msgSend_addProperty_value_(self->_activeObject, v42, v43, self->_lastIdent, v33);

      goto LABEL_51;
    }
    if (v13)
      goto LABEL_51;
    goto LABEL_52;
  }

LABEL_53:
}

- (void)commitInitializer
{
  NSMutableArray *activeTokens;
  TMLParserToken *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  NSMutableArray *v10;
  TMLParserToken *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  TMLMetaObject *activeObject;
  TMLValueExpression *v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  id v31;

  activeTokens = self->_activeTokens;
  v4 = [TMLParserToken alloc];
  v7 = (void *)objc_msgSend_initWithToken_text_(v4, v5, v6, 19, CFSTR("$ctor"));
  objc_msgSend_insertObject_atIndex_(activeTokens, v8, v9, v7, 0);

  v10 = self->_activeTokens;
  v11 = [TMLParserToken alloc];
  v14 = (void *)objc_msgSend_initWithToken_text_(v11, v12, v13, 10, CFSTR("."));
  objc_msgSend_insertObject_atIndex_(v10, v15, v16, v14, 1);

  objc_msgSend_compileFunction_bodyOnly_(self, v17, v18, self->_activeTokens, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_options_range_(v19, v20, v21, CFSTR("$ctor.$"), CFSTR("$ctor$"), 0, 0, 7);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  activeObject = self->_activeObject;
  v23 = [TMLValueExpression alloc];
  v26 = (void *)objc_msgSend_initWithExpressionText_bindings_(v23, v24, v25, v31, &unk_24F534B60);
  objc_msgSend_setInitializer_(activeObject, v27, v28, v26);

  objc_msgSend_removeAllObjects(self->_activeTokens, v29, v30);
}

- (void)commitImplements
{
  NSMutableArray *activeTokens;
  const char *v4;
  double v5;
  _QWORD v6[5];

  activeTokens = self->_activeTokens;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_22AD31C20;
  v6[3] = &unk_24F4FE440;
  v6[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(activeTokens, a2, COERCE_DOUBLE(3221225472), v6);
  objc_msgSend_removeAllObjects(self->_activeTokens, v4, v5);
}

- (void)commitFunction
{
  double v2;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  void *v15;
  TMLMetaContext *context;
  TMLFunction *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  NSString *error;
  NSString *v26;
  uint64_t v27;

  if ((unint64_t)objc_msgSend_count(self->_activeTokens, a2, v2) >= 7
    && (objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v4, v5, 2),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend_token(v6, v7, v8),
        v6,
        v9 == 19))
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v4, v5, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_text(v10, v11, v12);
    v27 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_compileFunction_bodyOnly_(self, v13, v14, self->_activeTokens, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    context = self->_context;
    v17 = [TMLFunction alloc];
    v20 = (void *)objc_msgSend_initWithName_body_(v17, v18, v19, v27, v15);
    objc_msgSend_addFunction_(context, v21, v22, v20);

    objc_msgSend_removeAllObjects(self->_activeTokens, v23, v24);
    error = (NSString *)v27;
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v4, v5, CFSTR("Incomplete function at line %d"), self->_lineNo);
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v26;
  }

}

- (void)commitPragma
{
  double v2;
  void *v4;
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
  id v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  NSMutableArray *activeTokens;
  id v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  uint64_t v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  NSMutableArray *v43;
  const char *v44;
  double v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  const char *v50;
  double v51;
  void *v52;
  const char *v53;
  double v54;
  void *v55;
  const char *v56;
  double v57;
  char isEqualToString;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;
  const char *v64;
  double v65;
  const char *v66;
  double v67;
  const char *v68;
  double v69;
  void *v70;
  const char *v71;
  double v72;
  uint64_t v73;
  const char *v74;
  double v75;
  void *v76;
  const char *v77;
  double v78;
  uint64_t v79;
  const char *v80;
  double v81;
  id v82;
  const char *v83;
  double v84;
  uint64_t v85;
  const char *v86;
  double v87;
  void *v88;
  NSMutableArray *v89;
  id v90;
  const char *v91;
  double v92;
  const char *v93;
  double v94;
  const char *v95;
  double v96;
  const char *v97;
  double v98;
  const char *v99;
  double v100;
  NSString *basePath;
  NSString *filename;
  NSString *v103;
  NSString *error;
  const char *v105;
  double v106;
  const char *v107;
  double v108;
  NSMutableDictionary *v109;
  NSMutableDictionary *macros;
  void *v111;
  const char *v112;
  double v113;
  id v114;
  _QWORD v115[4];
  id v116;
  _QWORD v117[5];
  id v118;
  _QWORD v119[4];
  id v120;
  TMLParser *v121;
  id v122;

  objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, a2, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_text(v4, v5, v6);
  v114 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_isEqualToString_(v114, v7, v8, CFSTR("@include")))
  {
    if (objc_msgSend_isEqualToString_(v114, v9, v10, CFSTR("@export")))
    {
      v15 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v18 = (void *)objc_msgSend_initWithCapacity_(v15, v16, v17, 4);
      objc_msgSend_removeObjectAtIndex_(self->_activeTokens, v19, v20, 0);
      activeTokens = self->_activeTokens;
      v119[0] = MEMORY[0x24BDAC760];
      v119[1] = 3221225472;
      v119[2] = sub_22AD322EC;
      v119[3] = &unk_24F4FE468;
      v120 = v18;
      v121 = self;
      v122 = v114;
      v22 = v18;
      objc_msgSend_enumerateObjectsUsingBlock_(activeTokens, v23, v24, v119);
      objc_msgSend_addExports_(self->_context, v25, v26, v22);

LABEL_38:
      goto LABEL_39;
    }
    if (objc_msgSend_isEqualToString_(v114, v13, v14, CFSTR("@require")))
    {
      objc_msgSend_removeObjectAtIndex_(self->_activeTokens, v41, v42, 0);
      v43 = self->_activeTokens;
      v117[0] = MEMORY[0x24BDAC760];
      v117[1] = 3221225472;
      v117[2] = sub_22AD323C8;
      v117[3] = &unk_24F4FE490;
      v117[4] = self;
      v118 = v114;
      objc_msgSend_enumerateObjectsUsingBlock_(v43, v44, v45, v117);

LABEL_39:
      objc_msgSend_removeAllObjects(self->_activeTokens, v46, v47);
      goto LABEL_40;
    }
    if ((objc_msgSend_isEqualToString_(v114, v41, v42, CFSTR("@macro")) & 1) == 0
      && (objc_msgSend_isEqualToString_(v114, v48, v49, CFSTR("@ifdef")) & 1) == 0
      && !objc_msgSend_isEqualToString_(v114, v48, v49, CFSTR("@ifndef")))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], (const char *)v114, v49, CFSTR("Unsupported pragma %@ at line %d"), v114, self->_lineNo);
      goto LABEL_29;
    }
    if ((unint64_t)objc_msgSend_count(self->_activeTokens, v48, v49) <= 1)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v50, v51, CFSTR("Missing macro name at line %d"), self->_lineNo);
      goto LABEL_29;
    }
    objc_msgSend_lastObject(self->_activeTokens, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_text(v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v55, v56, v57, CFSTR("@end"));

    if ((isEqualToString & 1) == 0)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v59, v60, CFSTR("Missing macro end at line %d"), self->_lineNo);
      goto LABEL_29;
    }
    objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v59, v60, 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_text(v61, v62, v63);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_removeObjectsInRange_(self->_activeTokens, v64, v65, 0, 3);
    objc_msgSend_removeLastObject(self->_activeTokens, v66, v67);
    objc_msgSend_firstObject(self->_activeTokens, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend_token(v70, v71, v72);

    if (v73 == 1)
      objc_msgSend_removeObjectAtIndex_(self->_activeTokens, v74, v75, 0);
    objc_msgSend_lastObject(self->_activeTokens, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend_token(v76, v77, v78);

    if (v79 == 1)
      objc_msgSend_removeLastObject(self->_activeTokens, v80, v81);
    v82 = objc_alloc(MEMORY[0x24BDD16A8]);
    v85 = objc_msgSend_count(self->_activeTokens, v83, v84);
    v88 = (void *)objc_msgSend_initWithCapacity_(v82, v86, v87, 10 * v85);
    v89 = self->_activeTokens;
    v115[0] = MEMORY[0x24BDAC760];
    v115[1] = 3221225472;
    v115[2] = sub_22AD324A8;
    v115[3] = &unk_24F4FE440;
    v90 = v88;
    v116 = v90;
    objc_msgSend_enumerateObjectsUsingBlock_(v89, v91, v92, v115);
    if (objc_msgSend_isEqualToString_(v114, v93, v94, CFSTR("@ifdef")))
    {
      if (objc_msgSend_containsObject_(self->_preprocessorMacros, v95, v96, v22))
      {
        objc_msgSend_removeAllObjects(self->_activeTokens, v97, v98);
        basePath = self->_basePath;
        filename = self->_filename;
        if (self->_lookaheadOnly)
        {
          objc_msgSend_parseFunctionLookaheadWithString_basePath_filename_(self, v99, v100, v90, basePath, filename);
          goto LABEL_37;
        }
LABEL_33:
        objc_msgSend_parseString_basePath_filename_(self, v99, v100, v90, basePath, filename);
      }
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v114, v95, v96, CFSTR("@ifndef")))
      {
        if (!self->_macros)
        {
          v109 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
          macros = self->_macros;
          self->_macros = v109;

        }
        objc_msgSend_macroTextWithMacroText_basePath_filename_(TMLMacroText, v105, v106, v90, self->_basePath, self->_filename);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(self->_macros, v112, v113, v111, v22);

        goto LABEL_37;
      }
      if ((objc_msgSend_containsObject_(self->_preprocessorMacros, v105, v106, v22) & 1) == 0)
      {
        objc_msgSend_removeAllObjects(self->_activeTokens, v107, v108);
        basePath = self->_basePath;
        filename = self->_filename;
        goto LABEL_33;
      }
    }
LABEL_37:

    goto LABEL_38;
  }
  if ((unint64_t)objc_msgSend_count(self->_activeTokens, v9, v10) > 1)
  {
    if (!self->_basePath)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, v12, CFSTR("Include pragma is invalid for source at line %d"), self->_lineNo);
      goto LABEL_29;
    }
    objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v11, v12, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_text(v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend_length(v30, v31, v32);
    objc_msgSend_substringWithRange_(v30, v34, v35, 1, v33 - 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringByAppendingPathComponent_(self->_basePath, v37, v38, v36);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (self->_lookaheadOnly)
      objc_msgSend_parseFunctionLookaheadWithFile_(self, v39, v40, v22);
    else
      objc_msgSend_parseFile_(self, v39, v40, v22);
    goto LABEL_38;
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], (const char *)v114, v12, CFSTR("Missing argument for pragma %@ at line %d"), v114, self->_lineNo);
LABEL_29:
  v103 = (NSString *)objc_claimAutoreleasedReturnValue();
  error = self->_error;
  self->_error = v103;

LABEL_40:
}

- (void)commitMacro
{
  double v2;
  void *v4;
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
  const char *v20;
  double v21;
  id v22;
  const char *v23;
  id v24;
  const char *v25;
  double v26;
  void *v27;
  NSMutableArray *activeTokens;
  uint64_t v29;
  id v30;
  id v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  NSString *v36;
  NSString *error;
  NSString *v38;
  NSString *v39;
  void *v40;
  const char *v41;
  double v42;
  NSString *v43;
  const char *v44;
  double v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  void *v50;
  const char *v51;
  double v52;
  void *v53;
  const char *v54;
  double v55;
  const char *v56;
  double v57;
  const char *v58;
  double v59;
  _QWORD v60[4];
  NSString *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;

  objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, a2, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_text(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringFromIndex_(v7, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(self->_macros, v11, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_macroText(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_mutableCopy(v16, v17, v18);

  if (v19)
  {
    v22 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v71 = 0;
    v72 = &v71;
    v73 = 0x2020000000;
    v74 = 0;
    v67 = 0;
    v68 = &v67;
    v69 = 0x2020000000;
    v70 = 0;
    objc_msgSend_removeObjectAtIndex_(self->_activeTokens, v23, COERCE_DOUBLE(0x2020000000), 0);
    v24 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v27 = (void *)objc_msgSend_initWithObjects_(v24, v25, v26, &stru_24F505EA8, 0);
    activeTokens = self->_activeTokens;
    v29 = MEMORY[0x24BDAC760];
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = sub_22AD32820;
    v62[3] = &unk_24F4FE4B8;
    v65 = &v71;
    v30 = v22;
    v63 = v30;
    v66 = &v67;
    v31 = v27;
    v64 = v31;
    objc_msgSend_enumerateObjectsUsingBlock_(activeTokens, v32, v33, v62);
    if (v72[3] || v68[3])
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v34, v35, CFSTR("Invalid macro argument %@ at line %d"), v10, self->_lineNo);
      v36 = (NSString *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v36;
    }
    else
    {
      v40 = (void *)objc_msgSend_copy(v30, v34, v35);
      objc_msgSend_addObject_(v31, v41, v42, v40);

      v60[0] = v29;
      v60[1] = 3221225472;
      v60[2] = sub_22AD3295C;
      v60[3] = &unk_24F4FE4E0;
      v43 = v19;
      v61 = v43;
      objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v31, v44, v45, 2, v60);
      objc_msgSend_removeAllObjects(self->_activeTokens, v46, v47);
      if (self->_lookaheadOnly)
      {
        objc_msgSend_basePath(v13, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_filename(v13, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_parseFunctionLookaheadWithString_basePath_filename_(self, v54, v55, v43, v50, v53);
      }
      else
      {
        objc_msgSend_basePath(v13, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_filename(v13, v56, v57);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_parseString_basePath_filename_(self, v58, v59, v43, v50, v53);
      }

      error = v61;
    }

    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(&v71, 8);

  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v20, v21, CFSTR("Undeclared macro %@ at line %d"), v10, self->_lineNo);
    v38 = (NSString *)objc_claimAutoreleasedReturnValue();
    v39 = self->_error;
    self->_error = v38;

  }
}

- (void)commitSignal
{
  id v3;
  const char *v4;
  double v5;
  unint64_t v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  TMLPropertyDescriptor *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  uint64_t v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  void *error;
  const char *v40;
  double v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  char isEqualToString;
  const char *v48;
  double v49;
  TMLMetaObject *activeObject;
  NSString *lastIdent;
  const char *v52;
  double v53;
  const __CFString *declarationType;
  NSString *v55;
  NSString *methodSelector;
  uint64_t v57;
  const char *v58;
  double v59;
  void *v60;
  const char *v61;
  double v62;
  const char *v63;
  double v64;
  const char *v65;
  double v66;
  NSString *v67;
  NSString *v68;
  NSString *v69;
  NSString *v70;
  id v71;

  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v6 = objc_msgSend_count(self->_activeTokens, v4, v5);
  v71 = (id)objc_msgSend_initWithCapacity_(v3, v7, v8, v6 >> 1);
  if ((unint64_t)objc_msgSend_count(self->_activeTokens, v9, v10) < 2)
  {
LABEL_10:
    activeObject = self->_activeObject;
    lastIdent = self->_lastIdent;
    if (objc_msgSend_length(self->_declarationType, v11, v12))
      declarationType = (const __CFString *)self->_declarationType;
    else
      declarationType = CFSTR("void");
    methodSelector = self->_methodSelector;
    v57 = objc_msgSend_length(methodSelector, v52, v53);
    objc_msgSend_substringWithRange_(methodSelector, v58, v59, 10, v57 - 11);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSignalDeclaration_returnType_parameters_methodSelector_attributes_(activeObject, v61, v62, lastIdent, declarationType, v71, v60, self->_declarationAttributes);

    objc_msgSend_removeAllObjects(self->_activeTokens, v63, v64);
    objc_msgSend_removeAllObjects(self->_declarationAttributes, v65, v66);
    v67 = self->_methodSelector;
    self->_methodSelector = 0;

    v68 = self->_lastIdent;
    self->_lastIdent = 0;

    v14 = self->_declarationType;
    self->_declarationType = 0;
    goto LABEL_17;
  }
  v13 = 0;
  while (1)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v15, v16, v13 + 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_token(v14, v18, v19) != 19 || objc_msgSend_token(v17, v20, v21) != 19)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v20, v21, CFSTR("Malformed signal parameters declaration at line %d"), self->_lineNo);
      v55 = (NSString *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v55;
      goto LABEL_16;
    }
    v22 = [TMLPropertyDescriptor alloc];
    objc_msgSend_text(v17, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_text(v14, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend_initWithName_typeName_attributes_(v22, v29, v30, v25, v28, 0);
    objc_msgSend_addObject_(v71, v32, v33, v31);

    v34 = v13 + 2;
    if (v13 + 2 < (unint64_t)objc_msgSend_count(self->_activeTokens, v35, v36))
      break;
LABEL_9:

    v13 = v34;
    if ((unint64_t)(objc_msgSend_count(self->_activeTokens, v48, v49) - v34) <= 1)
      goto LABEL_10;
  }
  objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v37, v38, v13 + 2);
  error = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_token(error, v40, v41) == 21)
  {
    objc_msgSend_text(error, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v44, v45, v46, CFSTR(","));

    if ((isEqualToString & 1) != 0)
    {
      v34 = v13 + 3;

      goto LABEL_9;
    }
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v42, v43, CFSTR("Malformed signal parameters declaration at line %d"), self->_lineNo);
  v69 = (NSString *)objc_claimAutoreleasedReturnValue();
  v70 = self->_error;
  self->_error = v69;

LABEL_16:
LABEL_17:

}

- (void)commitMethod
{
  id v3;
  const char *v4;
  double v5;
  unint64_t v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  uint64_t v13;
  void *error;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  TMLPropertyDescriptor *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  uint64_t v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  char isEqualToString;
  const char *v48;
  double v49;
  NSString *methodSelector;
  uint64_t v51;
  const char *v52;
  double v53;
  NSString *v54;
  NSString *v55;
  const char *v56;
  double v57;
  TMLMetaObject *activeObject;
  NSString *lastIdent;
  const char *v60;
  double v61;
  const char *v62;
  double v63;
  NSString *v64;
  const char *v65;
  double v66;
  NSString *v67;
  const char *v68;
  double v69;
  NSString *v70;
  NSString *v71;
  NSString *v72;
  NSString *v73;
  id v74;

  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v6 = objc_msgSend_count(self->_activeTokens, v4, v5);
  v74 = (id)objc_msgSend_initWithCapacity_(v3, v7, v8, v6 >> 1);
  if ((unint64_t)objc_msgSend_count(self->_activeTokens, v9, v10) < 2)
  {
LABEL_10:
    methodSelector = self->_methodSelector;
    v51 = objc_msgSend_length(methodSelector, v11, v12);
    objc_msgSend_substringWithRange_(methodSelector, v52, v53, 10, v51 - 11);
    v54 = (NSString *)objc_claimAutoreleasedReturnValue();
    v55 = self->_methodSelector;
    self->_methodSelector = v54;

    if (self->_methodDeclaration)
    {
      activeObject = self->_activeObject;
      lastIdent = self->_lastIdent;
      if (objc_msgSend_length(self->_declarationType, v56, v57))
        objc_msgSend_addMethodDeclaration_returnType_parameters_methodSelector_attributes_(activeObject, v60, v61, lastIdent, self->_declarationType, v74, self->_methodSelector, self->_declarationAttributes);
      else
        objc_msgSend_addMethodDeclaration_returnType_parameters_methodSelector_attributes_(activeObject, v60, v61, lastIdent, CFSTR("void"), v74, self->_methodSelector, self->_declarationAttributes);
    }
    else
    {
      if (objc_msgSend_length(self->_declarationType, v56, v57))
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v65, v66, CFSTR("Malformed constructor declaration at line %d"), self->_lineNo);
        v67 = (NSString *)objc_claimAutoreleasedReturnValue();
        error = self->_error;
        self->_error = v67;
        goto LABEL_20;
      }
      objc_msgSend_addConstructorDeclaration_parameters_methodSelector_attributes_(self->_activeObject, v65, v66, self->_lastIdent, v74, self->_methodSelector, self->_declarationAttributes);
    }
    objc_msgSend_removeAllObjects(self->_activeTokens, v62, v63);
    objc_msgSend_removeAllObjects(self->_declarationAttributes, v68, v69);
    v70 = self->_methodSelector;
    self->_methodSelector = 0;

    v71 = self->_lastIdent;
    self->_lastIdent = 0;

    error = self->_declarationType;
    self->_declarationType = 0;
    goto LABEL_20;
  }
  v13 = 0;
  while (1)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v11, v12, v13);
    error = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v15, v16, v13 + 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_token(error, v18, v19) != 19 || objc_msgSend_token(v17, v20, v21) != 19)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v20, v21, CFSTR("Malformed signal parameters declaration at line %d"), self->_lineNo);
      v64 = (NSString *)objc_claimAutoreleasedReturnValue();
      v39 = self->_error;
      self->_error = v64;
      goto LABEL_19;
    }
    v22 = [TMLPropertyDescriptor alloc];
    objc_msgSend_text(v17, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_text(error, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend_initWithName_typeName_attributes_(v22, v29, v30, v25, v28, 0);
    objc_msgSend_addObject_(v74, v32, v33, v31);

    v34 = v13 + 2;
    if (v13 + 2 < (unint64_t)objc_msgSend_count(self->_activeTokens, v35, v36))
      break;
LABEL_9:

    v13 = v34;
    if ((unint64_t)(objc_msgSend_count(self->_activeTokens, v48, v49) - v34) <= 1)
      goto LABEL_10;
  }
  objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v37, v38, v13 + 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_token(v39, v40, v41) == 21)
  {
    objc_msgSend_text(v39, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v44, v45, v46, CFSTR(","));

    if ((isEqualToString & 1) != 0)
    {
      v34 = v13 + 3;

      goto LABEL_9;
    }
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v42, v43, CFSTR("Malformed signal parameters declaration at line %d"), self->_lineNo);
  v72 = (NSString *)objc_claimAutoreleasedReturnValue();
  v73 = self->_error;
  self->_error = v72;

LABEL_19:
LABEL_20:

}

- (id)compileExpression:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  unint64_t v7;
  const char *v8;
  double v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  const char *v20;
  TMLMetaContext *v21;
  id v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  void *v32;
  id v33;
  const char *v34;
  double v35;
  uint64_t v36;
  const char *v37;
  double v38;
  void *v39;
  id v40;
  const char *v41;
  double v42;
  void *v43;
  id v44;
  const char *v45;
  double v46;
  void *v47;
  void *v48;
  const char *v49;
  double v50;
  void *v51;
  void *v52;
  const char *v53;
  double v54;
  void *v55;
  const char *v56;
  double v57;
  void *v58;
  TMLJSScope *v59;
  const char *v60;
  double v61;
  const char *v62;
  double v63;
  id v64;
  id v65;
  id v66;
  id v67;
  const char *v68;
  double v69;
  const char *v70;
  double v71;
  const char *v72;
  double v73;
  uint64_t v74;
  const char *v75;
  double v76;
  const char *v77;
  double v78;
  void *v79;
  const char *v80;
  double v81;
  TMLValueExpression *v82;
  const char *v83;
  double v84;
  const char *v85;
  double v86;
  uint64_t v87;
  NSString *v89;
  NSString *error;
  _QWORD v91[4];
  id v92;
  id v93;
  id v94;
  TMLParser *v95;
  id v96;
  id v97;
  _QWORD *v98;
  uint64_t *v99;
  _QWORD v100[3];
  char v101;
  _QWORD v102[5];
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  char v106;

  v4 = a3;
  v7 = objc_msgSend_count(v4, v5, v6);
  v10 = MEMORY[0x24BDAC760];
  if (v7 >= 3)
  {
    objc_msgSend_firstObject(v4, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_token(v11, v12, v13) == 19)
    {
      objc_msgSend_lastObject(v4, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend_token(v16, v17, v18);

      if (v19 == 3)
      {
        v103 = 0;
        v104 = &v103;
        v105 = 0x2020000000;
        v106 = 0;
        v102[0] = v10;
        v102[1] = 3221225472;
        v102[2] = sub_22AD333B4;
        v102[3] = &unk_24F4FE3F8;
        v102[4] = &v103;
        objc_msgSend_enumerateObjectsUsingBlock_(v4, v20, COERCE_DOUBLE(3221225472), v102);
        if (*((_BYTE *)v104 + 24))
        {
          v21 = objc_alloc_init(TMLMetaContext);
          v22 = objc_alloc((Class)objc_opt_class());
          v25 = (void *)objc_msgSend_initWithContext_(v22, v23, v24, v21);
          objc_msgSend_setStrict_(v25, v26, v27, 0);
          if ((objc_msgSend_parseTokens_startingLine_(v25, v28, v29, v4, 0) & 1) != 0)
          {
            objc_msgSend_rootObject(v21, v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend_error(v25, v30, v31);
            v89 = (NSString *)objc_claimAutoreleasedReturnValue();
            error = self->_error;
            self->_error = v89;

            v32 = 0;
          }

          _Block_object_dispose(&v103, 8);
          goto LABEL_17;
        }
        _Block_object_dispose(&v103, 8);
      }
    }
    else
    {

    }
  }
  v33 = objc_alloc(MEMORY[0x24BDD16A8]);
  v36 = objc_msgSend_count(v4, v34, v35);
  v39 = (void *)objc_msgSend_initWithCapacity_(v33, v37, v38, 5 * v36);
  v40 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v43 = (void *)objc_msgSend_initWithCapacity_(v40, v41, v42, 4);
  v44 = objc_alloc(MEMORY[0x24BDD16A8]);
  v47 = (void *)objc_msgSend_initWithCapacity_(v44, v45, v46, 64);
  v48 = (void *)objc_opt_class();
  objc_msgSend_transformObjectCreation_(v48, v49, v50, v4);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)objc_opt_class();
  objc_msgSend_transformFunction_(v52, v53, v54, v51);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_array(MEMORY[0x24BDBCEB8], v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_alloc_init(TMLJSScope);
  objc_msgSend_setType_(v59, v60, v61, 0);
  objc_msgSend_addObject_(v58, v62, v63, v59);
  v103 = 0;
  v104 = &v103;
  v105 = 0x2020000000;
  v106 = 0;
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x2020000000;
  v101 = 0;
  v91[0] = v10;
  v91[1] = 3221225472;
  v91[2] = sub_22AD3344C;
  v91[3] = &unk_24F4FE508;
  v4 = v55;
  v92 = v4;
  v64 = v39;
  v93 = v64;
  v65 = v47;
  v94 = v65;
  v95 = self;
  v98 = v100;
  v66 = v58;
  v96 = v66;
  v99 = &v103;
  v67 = v43;
  v97 = v67;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v68, v69, v91);
  if (objc_msgSend_length(v65, v70, v71))
  {
    v74 = objc_msgSend_count(v67, v72, v73);
    objc_msgSend_appendFormat_(v64, v75, v76, CFSTR("$(%u)"), v74);
    v79 = (void *)objc_msgSend_copy(v65, v77, v78);
    objc_msgSend_addObject_(v67, v80, v81, v79);

  }
  if (self->_error)
  {
    v32 = 0;
  }
  else
  {
    v82 = [TMLValueExpression alloc];
    if (objc_msgSend_count(v67, v83, v84))
      v87 = objc_msgSend_initWithExpressionText_bindings_(v82, v85, v86, v64, v67);
    else
      v87 = objc_msgSend_initWithExpressionText_bindings_(v82, v85, v86, v64, 0);
    v32 = (void *)v87;
  }

  _Block_object_dispose(v100, 8);
  _Block_object_dispose(&v103, 8);

LABEL_17:
  return v32;
}

+ (id)transformFunction:(id)a3
{
  double v3;
  void *v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  char v10;
  unint64_t i;
  void *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  void *v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  uint64_t v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  char isBuiltinObject;
  const char *v50;
  double v51;
  const char *v52;
  double v53;
  void *v54;
  const char *v55;
  double v56;
  const char *v57;
  double v58;
  const char *v59;
  double v60;
  unint64_t v61;
  unint64_t v62;
  TMLParserToken *v63;
  const char *v64;
  double v65;
  void *v66;
  const char *v67;
  double v68;
  TMLParserToken *v69;
  const char *v70;
  double v71;
  void *v72;
  const char *v73;
  double v74;
  TMLParserToken *v75;
  const char *v76;
  double v77;
  void *v78;
  const char *v79;
  double v80;
  TMLParserToken *v81;
  void *v82;
  const char *v83;
  double v84;
  void *v85;
  const char *v86;
  double v87;
  void *v88;
  const char *v89;
  double v90;
  void *v91;
  const char *v92;
  double v93;
  void *v94;
  const char *v95;
  double v96;
  TMLParserToken *v97;
  const char *v98;
  double v99;
  const char *v100;
  double v101;
  unint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  double v106;
  uint64_t v107;
  void *v109;
  id v110;
  id v111;
  unint64_t v112;

  v5 = (void *)objc_msgSend_mutableCopy(a3, a2, v3);
  if (objc_msgSend_count(v5, v6, v7))
  {
    v10 = 0;
    for (i = 0; i < objc_msgSend_count(v5, v18, v19); ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v5, v8, v9, i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend_token(v12, v13, v14);
      if (!v15)
      {
        if ((v10 & 1) != 0)
        {
          objc_msgSend_objectAtIndexedSubscript_(v5, v16, v17, i - 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_text(v20, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (i + 1 >= objc_msgSend_count(v5, v24, v25))
          {
            v31 = 0;
          }
          else
          {
            objc_msgSend_objectAtIndexedSubscript_(v5, v26, v27, i + 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_text(v28, v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if ((sub_22AD33964(v23) & 1) == 0 && (sub_22AD33964(v31) & 1) == 0)
            objc_msgSend_removeObjectAtIndex_(v5, v59, v60, i--);

          v10 = 1;
        }
        else
        {
          v10 = 0;
        }
        goto LABEL_7;
      }
      if (v15 != 6)
      {
        if (v15 == 2)
          v10 = 1;
        goto LABEL_7;
      }
      if (i >= 3)
      {
        objc_msgSend_objectAtIndexedSubscript_(v5, v16, v17, i - 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_token(v32, v33, v34) == 10)
        {
          v112 = i - 1;
          objc_msgSend_objectAtIndexedSubscript_(v5, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend_token(v37, v38, v39);

          if (v40 == 19)
          {
            objc_msgSend_objectAtIndexedSubscript_(v5, v41, v42, i - 3);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_text(v43, v44, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            isBuiltinObject = objc_msgSend_isBuiltinObject_(a1, v47, v48, v46);

            if ((isBuiltinObject & 1) == 0)
            {
              if (objc_msgSend_token(v43, v50, v51) == 19)
              {
                objc_msgSend_text(v43, v52, v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend_isEqualToString_(v54, v55, v56, CFSTR("$ctor")) & 1) != 0)
                {

                  goto LABEL_27;
                }
                if ((uint64_t)(i - 4) < 0)
                  goto LABEL_40;
                v109 = v54;
                v111 = a1;
                v102 = i;
                while (1)
                {
                  v103 = v102 - 4;
                  objc_msgSend_objectAtIndexedSubscript_(v5, v57, v58, v102 - 4);
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  v107 = objc_msgSend_token(v104, v105, v106);

                  if (v107)
                  {
                    if (v107 != 10)
                      break;
                  }
                  --v102;
                  if (v103 <= 0)
                  {
                    v54 = v109;
                    a1 = v111;
                    goto LABEL_40;
                  }
                }
                v54 = v109;
                a1 = v111;
                if (v107 == 15)
                {

                  if (v102 == 0x8000000000000003)
                    goto LABEL_41;
LABEL_27:
                  v61 = sub_22AD33E04(v5, i);
                  if (v61 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v62 = v61;
                    v110 = a1;
                    if (v61 != i + 1)
                    {
                      v63 = [TMLParserToken alloc];
                      v66 = (void *)objc_msgSend_initWithToken_text_(v63, v64, v65, 21, CFSTR("]"));
                      objc_msgSend_insertObject_atIndex_(v5, v67, v68, v66, v62);

                      v69 = [TMLParserToken alloc];
                      v72 = (void *)objc_msgSend_initWithToken_text_(v69, v70, v71, 21, CFSTR("["));
                      objc_msgSend_insertObject_atIndex_(v5, v73, v74, v72, i + 1);

                      v75 = [TMLParserToken alloc];
                      v78 = (void *)objc_msgSend_initWithToken_text_(v75, v76, v77, 21, CFSTR(","));
                      objc_msgSend_insertObject_atIndex_(v5, v79, v80, v78, i + 1);

                    }
                    v81 = [TMLParserToken alloc];
                    v82 = (void *)MEMORY[0x24BDD17C8];
                    objc_msgSend_objectAtIndexedSubscript_(v5, v83, v84, v112);
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_text(v85, v86, v87);
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_stringWithFormat_(v82, v89, v90, CFSTR("'%@'"), v88);
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    v94 = (void *)objc_msgSend_initWithToken_text_(v81, v92, v93, 14, v91);
                    objc_msgSend_insertObject_atIndex_(v5, v95, v96, v94, i + 1);

                    v97 = [TMLParserToken alloc];
                    v54 = (void *)objc_msgSend_initWithToken_text_(v97, v98, v99, 19, CFSTR("$"));
                    objc_msgSend_replaceObjectAtIndex_withObject_(v5, v100, v101, v112, v54);
                    a1 = v110;
                    goto LABEL_40;
                  }
                }
                else
                {
LABEL_40:

                }
              }
              else if (objc_msgSend_token(v43, v52, v53) == 15)
              {
                goto LABEL_27;
              }
            }
LABEL_41:

          }
        }
        else
        {

        }
      }
LABEL_7:

    }
  }
  return v5;
}

+ (id)transformAccessors:(id)a3
{
  double v3;
  void *v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  void *v35;
  const char *v36;
  double v37;
  int v38;
  void *v39;
  const char *v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  void *v48;
  const char *v49;
  double v50;
  uint64_t v51;
  const char *v52;
  double v53;
  const char *v54;
  double v55;
  void *v56;
  const char *v57;
  double v58;
  void *v59;
  const char *v60;
  double v61;
  const char *v62;
  double v63;
  void *v64;
  const char *v65;
  double v66;
  void *v67;
  const char *v68;
  double v69;
  int isEqualToString;
  TMLParserToken *v71;
  const char *v72;
  double v73;
  TMLParserToken *v74;
  const char *v75;
  double v76;
  TMLParserToken *v77;
  const char *v78;
  double v79;
  void *v80;
  const char *v81;
  double v82;
  void *v83;
  TMLParserToken *v84;
  const char *v85;
  double v86;
  void *v87;
  const char *v88;
  double v89;
  void *v90;
  const char *v91;
  double v92;
  uint64_t v93;
  const char *v94;
  double v95;
  const char *v96;
  double v97;
  TMLParserToken *v98;
  const char *v99;
  double v100;
  TMLParserToken *v101;
  const char *v102;
  double v103;
  TMLParserToken *v104;
  const char *v105;
  double v106;
  const char *v107;
  double v108;
  TMLParserToken *v109;
  const char *v110;
  double v111;
  TMLParserToken *v112;
  const char *v113;
  double v114;
  TMLParserToken *v115;
  const char *v116;
  double v117;
  void *v118;
  const char *v119;
  double v120;
  void *v121;
  const char *v122;
  double v123;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  _QWORD v130[6];
  _QWORD v131[5];

  v131[4] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend_mutableCopy(a3, a2, v3);
  if (objc_msgSend_count(v4, v5, v6))
  {
    v9 = 0;
    v10 = 0;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v4, v7, v8, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend_token(v12, v13, v14);
      if (v15 > 9)
      {
        if (v15 == 10)
        {
          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
            v11 = v10;
          goto LABEL_34;
        }
        if (v15 != 19)
          goto LABEL_19;
        objc_msgSend_text(v12, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v18, v19, v20, CFSTR("$")))
        {

LABEL_18:
          v10 -= v11 != 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:
          if (v11 != 0x7FFFFFFFFFFFFFFFLL && v10 - v11 >= 2)
          {
            v128 = v11 + 1;
            v129 = v10 - v11 - 1;
            objc_msgSend_subarrayWithRange_(v4, v16, v17);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_valueForKey_(v39, v40, v41, CFSTR("text"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_componentsJoinedByString_(v42, v43, v44, &stru_24F505EA8);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_objectAtIndexedSubscript_(v4, v46, v47, v11 - 1);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend_token(v48, v49, v50);

            if (v51 == 15)
            {
              v127 = v45;
              if (v10 + 2 < objc_msgSend_count(v4, v52, v53))
              {
                objc_msgSend_objectAtIndexedSubscript_(v4, v54, v55, v10 + 1);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_text(v56, v57, v58);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend_isEqualToString_(v59, v60, v61, CFSTR("$")) & 1) != 0)
                {
                  objc_msgSend_objectAtIndexedSubscript_(v4, v62, v63, v10 + 2);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_text(v64, v65, v66);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  isEqualToString = objc_msgSend_isEqualToString_(v67, v68, v69, CFSTR("("));

                  if (isEqualToString)
                  {
                    v71 = [TMLParserToken alloc];
                    v126 = (void *)objc_msgSend_initWithToken_text_(v71, v72, v73, 19, CFSTR("$$_"));
                    v131[0] = v126;
                    v74 = [TMLParserToken alloc];
                    v125 = (void *)objc_msgSend_initWithToken_text_(v74, v75, v76, 21, CFSTR("("));
                    v131[1] = v125;
                    v77 = [TMLParserToken alloc];
                    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v78, v79, CFSTR("'%@'"), v127);
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    v83 = (void *)objc_msgSend_initWithToken_text_(v77, v81, v82, 14, v80);
                    v131[2] = v83;
                    v84 = [TMLParserToken alloc];
                    v87 = (void *)objc_msgSend_initWithToken_text_(v84, v85, v86, 21, CFSTR(")"));
                    v131[3] = v87;
                    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v88, v89, v131, 4);
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_replaceObjectsInRange_withObjectsFromArray_(v4, v91, v92, v128, v129, v90);
                    v93 = 6;
                    goto LABEL_38;
                  }
                }
                else
                {

                }
              }
              v98 = [TMLParserToken alloc];
              v126 = (void *)objc_msgSend_initWithToken_text_(v98, v99, v100, 19, CFSTR("$$"));
              v130[0] = v126;
              v101 = [TMLParserToken alloc];
              v125 = (void *)objc_msgSend_initWithToken_text_(v101, v102, v103, 21, CFSTR("("));
              v130[1] = v125;
              v104 = [TMLParserToken alloc];
              objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v105, v106, CFSTR("'%@'"), v127);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = (void *)objc_msgSend_initWithToken_text_(v104, v107, v108, 14, v80);
              v130[2] = v83;
              v109 = [TMLParserToken alloc];
              v87 = (void *)objc_msgSend_initWithToken_text_(v109, v110, v111, 21, CFSTR(")"));
              v130[3] = v87;
              v112 = [TMLParserToken alloc];
              v90 = (void *)objc_msgSend_initWithToken_text_(v112, v113, v114, 10, CFSTR("."));
              v130[4] = v90;
              v115 = [TMLParserToken alloc];
              v118 = (void *)objc_msgSend_initWithToken_text_(v115, v116, v117, 19, CFSTR("_"));
              v130[5] = v118;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v119, v120, v130, 6);
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_replaceObjectsInRange_withObjectsFromArray_(v4, v122, v123, v128, v129, v121);

              v93 = 7;
LABEL_38:

              v10 = v11 + v93;
              v45 = v127;
            }

          }
          v11 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_34;
        }
        objc_msgSend_text(v12, v21, v22);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend_isEqualToString_(v35, v36, v37, CFSTR("tmlState"));

        if (v38)
          goto LABEL_18;
      }
      else
      {
        if (v15)
        {
          if (v15 == 2)
            goto LABEL_33;
          goto LABEL_19;
        }
        if ((v9 & 1) != 0)
        {
          objc_msgSend_objectAtIndexedSubscript_(v4, v16, v17, v10 - 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_text(v23, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 + 1 >= objc_msgSend_count(v4, v27, v28))
          {
            v34 = 0;
          }
          else
          {
            objc_msgSend_objectAtIndexedSubscript_(v4, v29, v30, v10 + 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_text(v31, v32, v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if ((sub_22AD33964(v26) & 1) == 0 && (sub_22AD33964(v34) & 1) == 0)
            objc_msgSend_removeObjectAtIndex_(v4, v94, v95, v10--);

LABEL_33:
          v9 = 1;
          goto LABEL_34;
        }
        v9 = 0;
      }
LABEL_34:

      ++v10;
    }
    while (v10 < objc_msgSend_count(v4, v96, v97));
  }
  return v4;
}

+ (id)transformObjectCreation:(id)a3
{
  const char *v3;
  double v4;
  void *v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void **p_cache;
  uint64_t v16;
  void *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  unint64_t v23;
  const char *v24;
  double v25;
  id v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  id v35;
  const char *v36;
  double v37;
  uint64_t v38;
  const char *v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  id v47;
  const char *v48;
  double v49;
  void *v50;
  id v51;
  const char *v52;
  double v53;
  void *v54;
  id v55;
  const char *v56;
  double v57;
  void *v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;
  void **v64;
  void *v65;
  const char *v66;
  double v67;
  unint64_t v68;
  void *v69;
  void *v70;
  const char *v71;
  double v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  double v76;
  const char *v77;
  double v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  double v82;
  id v83;
  const char *v84;
  double v85;
  id v86;
  void *v87;
  const char *v88;
  double v89;
  const char *v90;
  double v91;
  const char *v92;
  double v93;
  void *v94;
  id v95;
  const char *v96;
  double v97;
  void **v98;
  void *v99;
  id v100;
  const char *v101;
  double v102;
  void *v103;
  const char *v104;
  double v105;
  void *v106;
  const char *v107;
  double v108;
  void *v109;
  const char *v110;
  double v111;
  id v112;
  const char *v113;
  double v114;
  void *v115;
  const char *v116;
  double v117;
  id v118;
  const char *v119;
  double v120;
  void *v121;
  const char *v122;
  double v123;
  id v124;
  const char *v125;
  double v126;
  void *v127;
  const char *v128;
  double v129;
  const char *v130;
  double v131;
  const char *v132;
  double v133;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  uint64_t v139;
  void *v140;
  unsigned int v141;
  uint64_t v142;
  _QWORD v143[4];
  _QWORD v144[4];

  v144[3] = *MEMORY[0x24BDAC8D0];
  v138 = a3;
  v5 = (void *)objc_msgSend_mutableCopy(v138, v3, v4);
  if (objc_msgSend_count(v5, v6, v7))
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    p_cache = TMLBlockSignalHandler.cache;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    v137 = v5;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v5, v8, v9, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend_token(v17, v18, v19);
      if (v20 == 6)
      {
        if ((v10 & 1) != 0)
        {
          if (!v12)
          {
            v79 = v11;
            objc_msgSend_objectAtIndexedSubscript_(v5, v21, v22, v14 - 1);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_token(v80, v81, v82) == 19)
            {
              v83 = objc_alloc((Class)(p_cache + 228));
              v142 = v16;
              v140 = (void *)objc_msgSend_initWithToken_text_(v83, v84, v85, 21, CFSTR(","));
              v143[0] = v140;
              v86 = objc_alloc((Class)(p_cache + 228));
              v87 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend_text(v80, v88, v89);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringWithFormat_(v87, v90, v91, CFSTR("'%@'"), v136);
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = (void *)objc_msgSend_initWithToken_text_(v86, v92, v93, 14, v135);
              v143[1] = v94;
              v95 = objc_alloc((Class)(p_cache + 228));
              v98 = p_cache;
              v99 = (void *)objc_msgSend_initWithToken_text_(v95, v96, v97, 21, CFSTR(","));
              v143[2] = v99;
              v100 = objc_alloc((Class)(v98 + 228));
              v103 = (void *)objc_msgSend_initWithToken_text_(v100, v101, v102, 4, CFSTR("["));
              v143[3] = v103;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v104, v105, v143, 4);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObjectsFromArray_(v13, v107, v108, v106);

              v16 = v142;
              p_cache = v98;

              v79 = 1;
            }

            v12 = 1;
            v10 = 1;
            v11 = v79;
            goto LABEL_27;
          }
          ++v12;
LABEL_16:
          objc_msgSend_addObject_(v13, v21, v22, v17);
          goto LABEL_26;
        }
        goto LABEL_20;
      }
      if (v20 == 7)
        break;
      if (v20 != 23)
      {
        if ((v10 & 1) != 0)
        {
          if ((v11 & 1) != 0)
          {
            objc_msgSend_addObject_(v13, v21, v22, v17);
            v11 = 1;
          }
          else
          {
            v11 = 0;
          }
          goto LABEL_26;
        }
LABEL_20:
        v10 = 0;
        goto LABEL_27;
      }
      if ((v10 & 1) == 0)
      {
        v139 = v12;
        v141 = v11;
        objc_msgSend_text(v17, v21, v22);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringFromIndex_(v41, v42, v43, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend_array(MEMORY[0x24BDBCEB8], v45, v46);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v47 = objc_alloc((Class)(p_cache + 228));
        v50 = (void *)objc_msgSend_initWithToken_text_(v47, v48, v49, 19, CFSTR("$new$"));
        v144[0] = v50;
        v51 = objc_alloc((Class)(p_cache + 228));
        v54 = (void *)objc_msgSend_initWithToken_text_(v51, v52, v53, 6, CFSTR("("));
        v144[1] = v54;
        v55 = objc_alloc((Class)(p_cache + 228));
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v56, v57, CFSTR("'%@'"), v44);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = (void *)objc_msgSend_initWithToken_text_(v55, v59, v60, 14, v58);
        v144[2] = v61;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v62, v63, v144, 3);
        v64 = p_cache;
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v13, v66, v67, v65);

        p_cache = v64;
        v10 = 1;
        v16 = v14;
        v11 = v141;
        v12 = v139;
        v5 = v137;
        goto LABEL_27;
      }
      v23 = sub_22AD33E04(v138, v14);
      if (v23 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v26 = objc_alloc((Class)(p_cache + 228));
        objc_msgSend_text(v17, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend_initWithToken_text_(v26, v30, v31, 14, v29);
        objc_msgSend_addObject_(v13, v33, v34, v32);

LABEL_26:
        v10 = 1;
        goto LABEL_27;
      }
      v68 = v23;
      objc_msgSend_subarrayWithRange_(v5, v24, v25, v14, v23 - v14 + 1);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = (void *)objc_opt_class();
      objc_msgSend_transformObjectCreation_(v70, v71, v72, v69);
      v73 = v12;
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v13, v75, v76, v74);

      v12 = v73;
      v10 = 1;
      v14 = v68;
LABEL_27:

      if (++v14 >= objc_msgSend_count(v5, v77, v78))
        goto LABEL_35;
    }
    if ((v10 & 1) != 0)
    {
      if (!--v12)
      {
        v35 = objc_alloc((Class)(p_cache + 228));
        if ((v11 & 1) != 0)
        {
          v38 = objc_msgSend_initWithToken_text_(v35, v36, v37, 5, CFSTR("]"));
        }
        else
        {
          v109 = (void *)objc_msgSend_initWithToken_text_(v35, v36, v37, 21, CFSTR(","));
          objc_msgSend_addObject_(v13, v110, v111, v109);

          v112 = objc_alloc((Class)(p_cache + 228));
          v115 = (void *)objc_msgSend_initWithToken_text_(v112, v113, v114, 14, CFSTR("'init'"));
          objc_msgSend_addObject_(v13, v116, v117, v115);

          v118 = objc_alloc((Class)(p_cache + 228));
          v121 = (void *)objc_msgSend_initWithToken_text_(v118, v119, v120, 21, CFSTR(","));
          objc_msgSend_addObject_(v13, v122, v123, v121);

          v124 = objc_alloc((Class)(p_cache + 228));
          v38 = objc_msgSend_initWithToken_text_(v124, v125, v126, 14, CFSTR("nil"));
        }
        v127 = (void *)v38;
        objc_msgSend_addObject_(v13, v39, v40, v38);

        objc_msgSend_addObject_(v13, v128, v129, v17);
        objc_msgSend_replaceObjectsInRange_withObjectsFromArray_(v5, v130, v131, v16, v14 - v16 + 1, v13);
        v14 = objc_msgSend_count(v13, v132, v133) + v16;

        v13 = 0;
        v12 = 0;
        v11 = 0;
        v10 = 0;
        v16 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_27;
      }
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  v13 = 0;
LABEL_35:

  return v5;
}

+ (id)transformBreakpoints:(id)a3 lineNo:(int)a4 filename:(id)a5
{
  uint64_t v5;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  unint64_t i;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  int isEqualToString;
  unint64_t v30;
  const char *v31;
  double v32;
  unint64_t v33;
  void *v34;
  TMLParserToken *v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  TMLParserToken *v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  const char *v47;
  double v48;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v10 = (void *)objc_msgSend_mutableCopy(a3, v8, v9);
  if (objc_msgSend_count(v10, v11, v12))
  {
    for (i = 0; i < objc_msgSend_count(v10, v47, v48); ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v10, v13, v14, i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_token(v16, v17, v18) == 19)
      {
        objc_msgSend_text(v16, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v21, v22, v23, CFSTR("breakpoint")))
        {

LABEL_7:
          v30 = sub_22AD33E04(v10, i);
          if (v30 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v33 = v30;
            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v31, v32, CFSTR("'%@:%d'"), v7, v5);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = [TMLParserToken alloc];
            v38 = (void *)objc_msgSend_initWithToken_text_(v35, v36, v37, 21, CFSTR(","));
            objc_msgSend_insertObject_atIndex_(v10, v39, v40, v38, v33);

            v41 = [TMLParserToken alloc];
            v44 = (void *)objc_msgSend_initWithToken_text_(v41, v42, v43, 14, v34);
            objc_msgSend_insertObject_atIndex_(v10, v45, v46, v44, v33 + 1);

            i = v33 + 2;
          }
          goto LABEL_9;
        }
        objc_msgSend_text(v16, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v26, v27, v28, CFSTR("nslog"));

        if (isEqualToString)
          goto LABEL_7;
      }
LABEL_9:

    }
  }

  return v10;
}

+ (id)varsInCurrentScope:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  void *v6;
  id v7;
  const char *v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v3;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, v9, &v22, v26, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v7);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend_vars(v16, v11, v12, (_QWORD)v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend_vars(v16, v11, v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v6, v19, v20, v18);

        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, v12, &v22, v26, 16);
    }
    while (v13);
  }

  return v6;
}

- (id)compileFunction:(id)a3 bodyOnly:(BOOL)a4
{
  double v4;

  return (id)objc_msgSend_compileFunction_bodyOnly_localVars_(self, a2, v4, a3, a4, 0);
}

- (id)compileFunction:(id)a3 bodyOnly:(BOOL)a4 localVars:(id)a5
{
  id v8;
  id v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  id v26;
  const char *v27;
  double v28;
  uint64_t v29;
  const char *v30;
  double v31;
  void *v32;
  id v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  const char *v45;
  double v46;
  void *v47;
  id v48;
  _QWORD v50[4];
  id v51;
  TMLParser *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD v61[3];
  char v62;
  _QWORD v63[3];
  char v64;
  _QWORD v65[3];
  BOOL v66;
  _QWORD v67[3];
  char v68;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_class();
  objc_msgSend_transformObjectCreation_(v10, v11, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_class();
  objc_msgSend_transformFunction_(v14, v15, v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_opt_class();
  objc_msgSend_transformAccessors_(v18, v19, v20, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_opt_class();
  objc_msgSend_transformBreakpoints_lineNo_filename_(v22, v23, v24, v21, self->_lineNo, self->_filename);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc(MEMORY[0x24BDD16A8]);
  v29 = objc_msgSend_count(v25, v27, v28);
  v32 = (void *)objc_msgSend_initWithCapacity_(v26, v30, v31, 5 * v29);
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v66 = a4;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v64 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  v62 = 0;
  v33 = objc_alloc(MEMORY[0x24BDBCEF0]);
  v36 = (void *)objc_msgSend_initWithCapacity_(v33, v34, v35, 4);
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = sub_22AD34F64;
  v50[3] = &unk_24F4FE530;
  v57 = v65;
  v40 = v36;
  v58 = v67;
  v51 = v40;
  v52 = self;
  v41 = v25;
  v53 = v41;
  v42 = v32;
  v54 = v42;
  v59 = v61;
  v43 = v39;
  v55 = v43;
  v60 = v63;
  v44 = v8;
  v56 = v44;
  objc_msgSend_enumerateObjectsUsingBlock_(v41, v45, v46, v50);
  v47 = v56;
  v48 = v42;

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);

  return v48;
}

+ (id)previousNonSpaceToken:(id)a3
{
  double v3;
  void *v4;
  const char *v5;
  double v6;
  const char *v7;
  void *v8;
  double v9;
  const char *v10;
  double v11;
  uint64_t v12;

  objc_msgSend_reverseObjectEnumerator(a3, a2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nextObject(v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    do
    {
      if (objc_msgSend_token(v8, v7, v9) && objc_msgSend_token(v8, v10, v11) != 1)
        break;
      objc_msgSend_nextObject(v4, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
    while (v12);
  }

  return v8;
}

+ (id)unescapeString:(id)a3
{
  double v3;
  void *v4;
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
  __CFString *v16;
  const char *v17;
  double v18;
  uint64_t v19;

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, v3, CFSTR("\\n"), CFSTR("\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v4, v5, v6, CFSTR("\\t"), CFSTR("\t"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v7, v8, v9, CFSTR("\\\\"), CFSTR("\\"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v11, v12, CFSTR("\\\"), CFSTR("\"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (__CFString *)objc_msgSend_mutableCopy(v13, v14, v15);
  if (CFStringTransform(v16, 0, CFSTR("Any-Hex/Java"), 1u))
  {
    v19 = objc_msgSend_copy(v16, v17, v18);

    v13 = (void *)v19;
  }

  return v13;
}

+ (BOOL)isBuiltinObject:(id)a3
{
  uint64_t v3;
  const char *v4;
  id v5;
  double v6;
  char v7;

  v3 = qword_255B51AF0;
  v5 = a3;
  if (v3 != -1)
    dispatch_once(&qword_255B51AF0, &unk_24F4FE550);
  v7 = objc_msgSend_containsObject_((void *)qword_255B51AE8, v4, v6, v5);

  return v7;
}

- (NSString)error
{
  return self->_error;
}

- (BOOL)strict
{
  return self->_strict;
}

- (void)setStrict:(BOOL)a3
{
  self->_strict = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lookaheadCurrentIdent, 0);
  objc_storeStrong((id *)&self->_functionIdentifiers, 0);
  objc_storeStrong((id *)&self->_preprocessorMacros, 0);
  objc_storeStrong((id *)&self->_macros, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_objectStack, 0);
  objc_storeStrong((id *)&self->_activeObject, 0);
  objc_storeStrong((id *)&self->_activeTokens, 0);
  objc_storeStrong((id *)&self->_methodSelector, 0);
  objc_storeStrong((id *)&self->_declarationAttributes, 0);
  objc_storeStrong((id *)&self->_declarationType, 0);
  objc_storeStrong((id *)&self->_lastIdent, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
