@implementation VMUClassInfo

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 4);
}

+ (id)_genericBlockByrefInfo
{
  if (+[VMUClassInfo _genericBlockByrefInfo]::onceToken != -1)
    dispatch_once(&+[VMUClassInfo _genericBlockByrefInfo]::onceToken, &__block_literal_global_10);
  return (id)+[VMUClassInfo _genericBlockByrefInfo]::s_genericBlockByrefInfo;
}

void __38__VMUClassInfo__genericBlockByrefInfo__block_invoke()
{
  VMUClassInfo *v0;
  void *v1;

  v0 = -[VMUClassInfo initWithClassName:binaryPath:type:]([VMUClassInfo alloc], "initWithClassName:binaryPath:type:", CFSTR("__NSExactBlockVariable__"), CFSTR("/usr/lib/system/libsystem_blocks.dylib"), 0x80000000);
  v1 = (void *)+[VMUClassInfo _genericBlockByrefInfo]::s_genericBlockByrefInfo;
  +[VMUClassInfo _genericBlockByrefInfo]::s_genericBlockByrefInfo = (uint64_t)v0;

}

- (void)_processARRLayout:(const char *)a3 scanType:(unsigned int)a4
{
  const char *v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v8;
  int v9;
  unsigned int remotePointerSize;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;

  if (a3)
  {
    v4 = a3;
    v5 = *(unsigned __int8 *)a3;
    if (*a3)
    {
      v6 = *(_QWORD *)&a4;
      v8 = 0;
      v9 = 0;
      remotePointerSize = self->_remotePointerSize;
      do
      {
        v11 = v5 & 0xF;
        v12 = v9 + (v5 >> 4);
        if (v8 < self->_ivarCount)
        {
          v13 = self->_superclassOffset + v12 * remotePointerSize;
          do
          {
            if (objc_msgSend(self->_localIvarList[v8], "offset") >= v13 + remotePointerSize * v11)
              break;
            if (objc_msgSend(self->_localIvarList[v8], "offset") >= v13)
              objc_msgSend(self->_localIvarList[v8], "setScanType:", v6);
            ++v8;
          }
          while (v8 < self->_ivarCount);
          v8 = v8;
        }
        v9 = v12 + v11;
        v14 = *(unsigned __int8 *)++v4;
        v5 = v14;
      }
      while (v14);
    }
  }
}

- (void)_parseIvarsAndLayouts
{
  if (-[VMUClassInfo isARR](self, "isARR"))
  {
    -[VMUClassInfo _processARRLayout:scanType:](self, "_processARRLayout:scanType:", self->_strongLayout, 2);
    -[VMUClassInfo _processARRLayout:scanType:](self, "_processARRLayout:scanType:", self->_weakLayout, 4);
  }
}

- (void)_demangleClassName
{
  NSString **p_remoteClassName;
  void *v3;
  void *v4;

  if (self->_remoteType == 8)
  {
    p_remoteClassName = &self->_remoteClassName;
    demangleSwiftClassName(-[NSString UTF8String](self->_remoteClassName, "UTF8String"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      objc_storeStrong((id *)p_remoteClassName, v3);
      v3 = v4;
    }

  }
}

- (void)_setClassNameWithAddress:(unint64_t)a3 targetTask:(id)a4
{
  void *v6;
  uint64_t v7;
  NSString *v8;
  NSString *remoteClassName;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "memoryCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "peekStringAtAddress:", a3);

  if (v7)
  {
    v8 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v7);
    remoteClassName = self->_remoteClassName;
    self->_remoteClassName = v8;

    -[VMUClassInfo _demangleClassName](self, "_demangleClassName");
  }

}

- (NSString)displayName
{
  uint64_t v2;

  v2 = 64;
  if (!self->_displayName)
    v2 = 56;
  return (NSString *)*(id *)((char *)&self->super.isa + v2);
}

- (void)_setDisplayName:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *displayName;
  NSString *v7;

  v4 = (NSString *)a3;
  if (self->_displayName != v4)
  {
    v7 = v4;
    v5 = (NSString *)-[NSString copy](v4, "copy");
    displayName = self->_displayName;
    self->_displayName = v5;

    v4 = v7;
  }

}

- (void)_setBinaryPath:(id)a3 sanitize:(BOOL)a4
{
  _BOOL4 v4;
  NSString *v6;
  NSString *v7;
  NSString *remoteBinaryPath;
  NSString *v9;

  v4 = a4;
  v6 = (NSString *)a3;
  if (self->_remoteBinaryPath != v6)
  {
    v9 = v6;
    if (v4)
    {
      VMUSanitizePath(v6);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v6;
    }
    remoteBinaryPath = self->_remoteBinaryPath;
    self->_remoteBinaryPath = v7;

    v6 = v9;
  }

}

- (void)_setSuperclassInfo:(id)a3
{
  VMUClassInfo *v5;
  unsigned int superclassOffset;
  unsigned int v7;
  unsigned int v8;
  unsigned int instanceSize;
  VMUClassInfo *v10;

  v5 = (VMUClassInfo *)a3;
  if (self->_superclassLayout != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_superclassLayout, a3);
    superclassOffset = self->_superclassOffset;
    v7 = -[VMUClassInfo instanceSize](v10, "instanceSize");
    if (superclassOffset <= v7)
      v8 = v7;
    else
      v8 = superclassOffset;
    instanceSize = self->_instanceSize;
    if (instanceSize <= v8)
      instanceSize = v8;
    self->_superclassOffset = v8;
    self->_instanceSize = instanceSize;
    v5 = v10;
  }

}

- (void)_setIsCoreMediaFigObject:(BOOL)a3
{
  self->_isCoreMediaFigObject = a3;
}

- (void)_setDefaultScanType:(unsigned int)a3
{
  self->_defaultScanType = a3;
}

- (unsigned)defaultScanType
{
  return self->_defaultScanType;
}

- (void)_setInstanceSize:(unsigned int)a3
{
  self->_instanceSize = a3;
}

- (void)_setIsRootClass:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_ro_flags = self->_ro_flags & 0xFFFFFFFD | v3;
}

- (void)_setInfoType:(unsigned int)a3
{
  self->_remoteType = a3;
}

- (BOOL)hasVariantLayout
{
  char hasVariantLayout;

  hasVariantLayout = self->_hasVariantLayout;
  if (!hasVariantLayout)
  {
    hasVariantLayout = 1;
    if (!self->_variantEvaluators)
    {
      if (-[VMUClassInfo hasVariantLayout](self->_superclassLayout, "hasVariantLayout"))
        hasVariantLayout = 1;
      else
        hasVariantLayout = -1;
    }
    self->_hasVariantLayout = hasVariantLayout;
  }
  return hasVariantLayout == 1;
}

- (BOOL)hasSpecificLayout
{
  char hasSpecificLayout;
  const char *v5;

  hasSpecificLayout = self->_hasSpecificLayout;
  if (!hasSpecificLayout)
  {
    if (-[VMUClassInfo hasVariantLayout](self, "hasVariantLayout")
      || -[VMUClassInfo hasSpecificLayout](self->_superclassLayout, "hasSpecificLayout"))
    {
      hasSpecificLayout = 1;
    }
    else
    {
      hasSpecificLayout = 1;
      if (self->_remoteType != 0x80000000)
      {
        v5 = -[NSString UTF8String](self->_remoteClassName, "UTF8String");
        if (!v5)
          v5 = "";
        if (!strcmp(v5, "NSBlock"))
          hasSpecificLayout = 1;
        else
          hasSpecificLayout = -1;
      }
    }
    self->_hasSpecificLayout = hasSpecificLayout;
  }
  return hasSpecificLayout == 1;
}

+ (VMUClassInfo)classInfoWithClassName:(id)a3 binaryPath:(id)a4 type:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClassName:binaryPath:type:", v8, v9, v5);

  return (VMUClassInfo *)v10;
}

- (VMUClassInfo)initWithClassName:(id)a3 binaryPath:(id)a4 type:(unsigned int)a5
{
  id v8;
  id v9;
  VMUClassInfo *v10;
  uint64_t v11;
  NSString *remoteClassName;
  uint64_t v13;
  NSString *remoteBinaryPath;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VMUClassInfo;
  v10 = -[VMUClassInfo init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    remoteClassName = v10->_remoteClassName;
    v10->_remoteClassName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    remoteBinaryPath = v10->_remoteBinaryPath;
    v10->_remoteBinaryPath = (NSString *)v13;

    v10->_remotePointerSize = 8;
    v10->_defaultScanType = 1;
    v10->_remoteType = a5;
  }

  return v10;
}

- (VMUClassInfo)initWithClosureContext:(unint64_t)a3 typeInfo:(swift_typeinfo *)a4 infoMap:(id)a5 swiftFieldMetadataContext:(libSwiftRemoteMirrorWrapper *)a6
{
  VMUClassInfo *v10;
  VMUClassInfo *v11;
  NSString *remoteClassName;
  void *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  unsigned int v18;
  unint64_t v19;
  uint64_t v20;
  id *localIvarList;
  id v22;
  id v24;
  char v25;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;
  objc_super v29;

  v24 = a5;
  v29.receiver = self;
  v29.super_class = (Class)VMUClassInfo;
  v10 = -[VMUClassInfo init](&v29, sel_init);
  v11 = v10;
  if (v10)
  {
    remoteClassName = v10->_remoteClassName;
    v10->_remoteClassName = (NSString *)CFSTR("Closure context");

    v11->_remotePointerSize = 8;
    *(_QWORD *)&v11->_defaultScanType = 0x4000000001;
    v11->_instanceSize = a4->var1;
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1)
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
    if (debugSwiftSubfieldIsEnabled::isEnabled)
      _debugSwiftAsyncPrintf(0, "Getting fields for closure context at %p\n", (const void *)a3);
    v13 = (void *)objc_opt_new();
    if (a4->var4)
    {
      v14 = 0;
      while (1)
      {
        v27 = 0u;
        v28 = 0u;
        vmu_swift_reflection_childOfInstance((uint64_t)a6->var0, a3, v14, (uint64_t)&v27);
        if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken != -1)
          dispatch_once(&_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken, &__block_literal_global_412);
        if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled)
        {
          v26[0] = v27;
          v26[1] = v28;
          _debugSwiftSubfieldDumpSwiftChildInfo(1, "childOfInstance()", (uint64_t)v26, (uint64_t)a6->var0);
        }
        if (DWORD2(v27) < 2 * v11->_remotePointerSize)
          break;
        v25 = 0;
        _createFieldInfoFromChild((uint64_t *)a6, (const char *)v27, DWORD2(v27), SHIDWORD(v27), v28, *((uint64_t *)&v28 + 1), v24, v11->_remoteClassName, &v25, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v13, "addObject:", v15);
        }
        else if (v25)
        {
          goto LABEL_26;
        }

        v14 = (v14 + 1);
        if (v14 >= a4->var4)
          goto LABEL_27;
      }
      if (debugSwiftSubfieldIsEnabled::dispatchToken != -1)
        dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
      if (debugSwiftSubfieldIsEnabled::isEnabled)
      {
        v16 = " (VERY BAD)";
        if (!DWORD2(v27))
          v16 = "";
        v17 = (const char *)v27;
        if (!(_QWORD)v27)
          v17 = "?";
        _debugSwiftAsyncPrintf(1, "nonsensically small offset for field \"%s\" of +%u%s; ignoring all fields in this closure context\n",
          v17,
          DWORD2(v27),
          v16);
      }
LABEL_26:
      objc_msgSend(v13, "removeAllObjects");
    }
LABEL_27:
    v18 = objc_msgSend(v13, "count");
    v11->_ivarCount = v18;
    if (v18)
    {
      v11->_localIvarList = (id *)malloc_type_calloc(v18 + 1, 8uLL, 0x80040B8603338uLL);
      if (v11->_ivarCount)
      {
        v19 = 0;
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v19);
          v20 = objc_claimAutoreleasedReturnValue();
          localIvarList = v11->_localIvarList;
          v22 = localIvarList[v19];
          localIvarList[v19] = (id)v20;

          ++v19;
        }
        while (v19 < v11->_ivarCount);
      }
    }
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1)
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
    if (debugSwiftSubfieldIsEnabled::isEnabled)
      _debugSwiftAsyncPrintf(0, "\n");

  }
  return v11;
}

- (id)initSwiftClassWithName:(id)a3 classInfoType:(unsigned int)a4 size:(unint64_t)a5
{
  unsigned int v5;
  id v9;
  VMUClassInfo *v10;
  VMUClassInfo *v11;
  void **p_remoteClassName;
  void *v13;
  objc_super v15;

  v5 = a5;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VMUClassInfo;
  v10 = -[VMUClassInfo init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    p_remoteClassName = (void **)&v10->_remoteClassName;
    objc_storeStrong((id *)&v10->_remoteClassName, a3);
    if (!v9 && a4 == 64)
    {
      v13 = *p_remoteClassName;
      *p_remoteClassName = CFSTR("malloc-block (possibly Swift)");

    }
    v11->_remotePointerSize = 8;
    v11->_defaultScanType = 1;
    v11->_remoteType = a4;
    v11->_instanceSize = v5;
  }

  return v11;
}

- (unsigned)_objcABIFromObjectIdentifier:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "objcABI");
  }
  else
  {
    if (-[VMUClassInfo _objcABIFromObjectIdentifier:]::onceToken != -1)
      dispatch_once(&-[VMUClassInfo _objcABIFromObjectIdentifier:]::onceToken, &__block_literal_global_39);
    v5 = -[VMUClassInfo _objcABIFromObjectIdentifier:]::analysisProcessObjcABI;
  }

  return v5;
}

uint64_t __45__VMUClassInfo__objcABIFromObjectIdentifier___block_invoke()
{
  void *v0;
  int *v1;

  v0 = dlopen("/usr/lib/libobjc.A.dylib", 17);
  v1 = (int *)dlsym(v0, "objc_class_abi_version");
  if (v1)
    -[VMUClassInfo _objcABIFromObjectIdentifier:]::analysisProcessObjcABI = *v1;
  return dlclose(v0);
}

- (id)_initWithClass:(unint64_t)a3 type:(unsigned int)a4 realizedOnly:(BOOL)a5 infoMap:(id)a6 objectIdentifier:(id)a7 reader:(id)a8
{
  VMUClassInfoMap *v13;
  id v14;
  uint64_t (**v15)(id, unint64_t, uint64_t);
  unsigned int *v16;
  libSwiftRemoteMirrorWrapper *v17;
  int v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  int v29;
  const void *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  unsigned int v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v55;
  void *v56;
  int *v57;
  unsigned int v58;
  unsigned int v59;
  unint64_t v60;
  uint64_t (**v61)(id, unint64_t, uint64_t);
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const char *v66;
  int *v67;
  int v68;
  const char *v69;
  unsigned int *LocalIvar;
  uint64_t v71;
  const char *Name;
  ptrdiff_t Offset;
  VMUMutableFieldInfo *v74;
  uint64_t v75;
  void *v76;
  int v77;
  const void *v78;
  int v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  int v92;
  unint64_t v93;
  unsigned int v94;
  void *v95;
  uint64_t v96;
  unsigned int v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _BOOL4 v102;
  objc_super v103;

  v102 = a5;
  v13 = (VMUClassInfoMap *)a6;
  v14 = a7;
  v15 = (uint64_t (**)(id, unint64_t, uint64_t))a8;
  v103.receiver = self;
  v103.super_class = (Class)VMUClassInfo;
  v16 = -[VMUClassInfo init](&v103, sel_init);
  if (!v16)
    goto LABEL_46;
  if (!v14)
    goto LABEL_44;
  v17 = (libSwiftRemoteMirrorWrapper *)objc_msgSend(v14, "swiftMirror");
  v18 = objc_msgSend(v16, "_objcABIFromObjectIdentifier:", v14);
  v16[4] = 8;
  if (!a3)
    goto LABEL_44;
  v19 = (unint64_t *)MEMORY[0x1E0C85AD8];
  if (*MEMORY[0x1E0C85AD8] >= a3 || !v15)
    goto LABEL_44;
  *((_QWORD *)v16 + 1) = a3;
  v16[10] = 1;
  v16[11] = a4;
  if (a4 == 4)
  {
    v20 = v15[2](v15, a3, 96);
    v21 = v20;
    if (*v19 >= v20)
    {
      v101 = 0;
LABEL_18:
      v16[7] = 16;
      goto LABEL_87;
    }
    v22 = *(_QWORD *)(v20 + 8);
    objc_msgSend(v14, "vmuTask");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v22;
    objc_msgSend(v16, "_setClassNameWithAddress:targetTask:", v22, v23);

    if (*((_QWORD *)v16 + 7))
    {
      v24 = objc_msgSend(v14, "figBaseObjectFinalizeAddress");
      if (v24)
      {
        objc_msgSend(v14, "vmuTask");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v25, *(_QWORD *)(v21 + 32));

        if (v26 == v24)
          *((_BYTE *)v16 + 147) = 1;
      }
      goto LABEL_18;
    }
    goto LABEL_44;
  }
  v27 = v18;
  if (a4 != 8 && a4 != 1)
  {
    v101 = 0;
    goto LABEL_87;
  }
  objc_msgSend(v14, "vmuTask");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isExclaveCore");

  if (v29)
  {
    if (a4 == 8)
    {
      v16[8] = -2147483520;
      v16[11] = 8;
      v30 = vmu_swift_reflection_interop_lookupMetadata(*(_QWORD *)objc_msgSend(v14, "swiftMirror"), (const void *)a3);
      vmu_swift_reflection_infoForMetadata(*(_QWORD *)objc_msgSend(v14, "swiftMirror"), (uint64_t)v30, v31);
    }
    goto LABEL_44;
  }
  v32 = v15[2](v15, a3, 40);
  if (!v32)
    goto LABEL_44;
  v100 = v32;
  v33 = *(_QWORD *)(v32 + 32);
  objc_msgSend(v14, "vmuTask");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v34, v33);

  if (v17)
    v36 = v17->var1 | 1;
  else
    v36 = 1;
  if ((v36 & v35) != 0)
    v16[11] = 8;
  objc_msgSend(v14, "vmuTask");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = VMUGetClassDataROofClass(v37, v15, v27, a3);

  if (!v38)
    goto LABEL_44;
  v39 = v15[2](v15, v38, 72);
  if (!v39)
    goto LABEL_44;
  v40 = *(_QWORD *)(v39 + 24);
  v41 = *(_QWORD *)(v39 + 48);
  v16[8] = *(_DWORD *)v39;
  v16[6] = *(_DWORD *)(v39 + 4);
  v96 = v39;
  v16[7] = *(_DWORD *)(v39 + 8);
  v101 = v40;
  if (v40)
  {
    objc_msgSend(v14, "vmuTask");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setClassNameWithAddress:targetTask:", v101, v42);

  }
  if (v16[11] == 8)
  {
    v43 = v15[2](v15, a3, 72);
    if (!v43)
    {
LABEL_44:

LABEL_45:
      v16 = 0;
      goto LABEL_46;
    }
    if (!*((_QWORD *)v16 + 7))
    {
      if (v17->var0)
      {
        v78 = vmu_swift_reflection_interop_lookupMetadata((uint64_t)v17->var0, (const void *)a3);
        if (v78)
        {
          v80 = vmu_swift_reflection_interop_typeRefForMetadata((uint64_t)v17->var0, (uint64_t)v78, v77);
          if (v80)
          {
            v99 = v41;
            vmu_swift_reflection_interop_copyDemangledNameForTypeRef((uint64_t)v17->var0, v80, v79);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            if (v81)
              objc_storeStrong((id *)v16 + 7, v81);

            v41 = v99;
          }
        }
      }
    }
    *((_BYTE *)v16 + 146) = (*(_BYTE *)(v43 + 40) & 2) != 0;
  }
  if (!*((_QWORD *)v16 + 7))
  {
    v44 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "typeName");
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v44, "stringWithFormat:", CFSTR("<UNNAMED_%s_class_%#llx>"), objc_msgSend(v45, "UTF8String"), a3);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)*((_QWORD *)v16 + 7);
    *((_QWORD *)v16 + 7) = v46;

  }
  v16[5] = 0;
  if (v16[11] == 8)
  {
    if (v17 && v17->var0)
    {
      _swiftFieldsForClass(*((const void **)v16 + 1), *((NSString **)v16 + 7), v17, v13);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "count");
      v16[5] = v49;
      if (v49)
      {
        *((_QWORD *)v16 + 6) = malloc_type_calloc(v49 + 1, 8uLL, 0x80040B8603338uLL);
        if (v16[5])
        {
          v50 = 0;
          do
          {
            objc_msgSend(v48, "objectAtIndexedSubscript:", v50);
            v51 = objc_claimAutoreleasedReturnValue();
            v52 = *((_QWORD *)v16 + 6);
            v53 = *(void **)(v52 + 8 * v50);
            *(_QWORD *)(v52 + 8 * v50) = v51;

            ++v50;
          }
          while (v50 < v16[5]);
        }
      }

    }
    else if ((-[VMUClassInfo _initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:]::swiftMirrorMissing & 1) == 0)
    {
      objc_msgSend(v14, "scanner");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        NSLog(CFSTR("Swift reflection is unavailable. All Swift content will be scanned conservatively."));
        NSLog(CFSTR("Weak references in Swift content may be misidentified as retaining references."));
        -[VMUClassInfo _initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:]::swiftMirrorMissing = 1;
      }
    }
  }
  objc_msgSend(v14, "vmuTask");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41 || v16[5])
    goto LABEL_82;
  v57 = (int *)v15[2](v15, v41, 48);
  if (!v57)
  {

    goto LABEL_45;
  }
  v58 = v57[1];
  v16[5] = v58;
  v92 = *v57;
  v95 = v56;
  *((_QWORD *)v16 + 6) = malloc_type_calloc(v58 + 1, 8uLL, 0x80040B8603338uLL);
  if (!v16[5])
  {
    v94 = 0;
    goto LABEL_81;
  }
  v59 = 0;
  v98 = 0;
  v94 = 0;
  v93 = v41 + 8;
  while (1)
  {
    v97 = v59;
    v60 = v93 + v59;
    v61 = v15;
    v62 = v95;
    v63 = v15[2](v61, v60, 40);
    if (!v63)
      break;
    v64 = v62;
    objc_msgSend(v62, "memoryCache");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (const char *)objc_msgSend(v65, "peekStringAtAddress:", *(_QWORD *)(v63 + 8));

    v67 = (int *)v15[2](v61, *(_QWORD *)v63, 4);
    if (v67)
      v68 = *v67;
    else
      v68 = 0;
    v69 = *(const char **)(v63 + 16);
    if (v69)
      v69 = (const char *)v15[2](v61, (unint64_t)v69, 1);
    LocalIvar = (unsigned int *)_createLocalIvar(v66, v69, v68, *(_DWORD *)(v63 + 28), 0);

    if (!LocalIvar)
      goto LABEL_80;
    v71 = LocalIvar[7];
    if ((_DWORD)v71 || v16[11] != 8)
    {
      Name = ivar_getName((Ivar)LocalIvar);
      if (!*(_QWORD *)LocalIvar || (Offset = ivar_getOffset((Ivar)LocalIvar), !(_DWORD)Offset))
      {
        if (!Name || strcmp(Name, "isa"))
          goto LABEL_70;
        Offset = 0;
      }
      v74 = -[VMUFieldInfo initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:]([VMUMutableFieldInfo alloc], "initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:", LocalIvar, v71, Offset, Name, objc_msgSend(v16, "isARR"), 1);
      v75 = *((_QWORD *)v16 + 6);
      v76 = *(void **)(v75 + 8 * v94);
      *(_QWORD *)(v75 + 8 * v94) = v74;

      ++v94;
    }
LABEL_70:
    _destroyLocalIvar((objc_ivar *)LocalIvar);
    v59 = v97 + v92;
    if (++v98 >= (unint64_t)v16[5])
      goto LABEL_81;
  }

LABEL_80:
  objc_msgSend(v16, "className");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("missing ivar at index: %d in class: %@"), v98, v82);

LABEL_81:
  v16[5] = v94;
  v56 = v95;
  *((_QWORD *)v16 + 17) = copy_remote_layout_at(*(_QWORD *)(v96 + 16), v15);
  *((_QWORD *)v16 + 16) = copy_remote_layout_at(*(_QWORD *)(v96 + 56), v15);
  objc_msgSend(v16, "_parseIvarsAndLayouts");
LABEL_82:
  if ((objc_msgSend(v16, "isRootClass") & 1) == 0)
  {
    v83 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v56, *(_QWORD *)(v100 + 8));
    if (v83)
    {
      -[VMUClassInfoMap classInfoForAddress:](v13, "classInfoForAddress:", v83);
      v84 = objc_claimAutoreleasedReturnValue();
      v85 = (void *)*((_QWORD *)v16 + 10);
      *((_QWORD *)v16 + 10) = v84;

      if (!*((_QWORD *)v16 + 10))
      {
        v86 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:", v83, 1, v102, v13, v14, v15);
        v87 = (void *)*((_QWORD *)v16 + 10);
        *((_QWORD *)v16 + 10) = v86;

      }
    }
  }

LABEL_87:
  v88 = v16[6];
  v89 = objc_msgSend(*((id *)v16 + 10), "instanceSize");
  if (v88 <= v89)
    v90 = v89;
  else
    v90 = v88;
  v91 = v16[7];
  if (v91 <= v90)
    v91 = v90;
  v16[6] = v90;
  v16[7] = v91;
  objc_msgSend(v16, "_determineBinaryPathUsingObjectIdentifier:remoteClassNameLoc:", v14, v101);
  -[VMUClassInfoMap addClassInfo:forAddress:](v13, "addClassInfo:forAddress:", v16, a3);
LABEL_46:

  return v16;
}

- (void)_determineBinaryPathUsingObjectIdentifier:(id)a3 remoteClassNameLoc:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  VMUClassInfo *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  objc_msgSend(v6, "symbolicator");
  if ((CSIsNull() & 1) == 0)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__6;
    v28 = __Block_byref_object_dispose__6;
    v29 = 0;
    if (-[VMUClassInfo infoType](self, "infoType") == 8)
    {
      -[VMUClassInfo className](self, "className");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("."));

      if (v8)
      {
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[VMUClassInfo className](self, "className");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "substringToIndex:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "moduleNameToBinaryPathDict");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v25[5];
          v25[5] = v12;

          v14 = (void *)v25[5];
          if (!v14)
          {
            v15 = objc_retainAutorelease(v10);
            objc_msgSend(v15, "UTF8String");
            CSSymbolicatorForeachSymbolOwnerWithNameAtTime();
            v16 = v25[5];
            if (!v16)
            {
              v25[5] = (uint64_t)&stru_1E4E04720;

              v16 = v25[5];
            }
            objc_msgSend(v6, "moduleNameToBinaryPathDict");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v15);

            v14 = (void *)v25[5];
          }
          if (objc_msgSend(v14, "length"))
          {
            -[VMUClassInfo _setBinaryPath:sanitize:](self, "_setBinaryPath:sanitize:", v25[5], 1);
LABEL_26:

            goto LABEL_27;
          }

        }
      }
    }
    CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
    if (CSIsNull())
    {
      if (-[NSString isEqualToString:](self->_remoteClassName, "isEqualToString:", CFSTR("CGSEventAppendix")))
      {
        CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      }
      else if (a4)
      {
        CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
      }
    }
    if ((CSIsNull() & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CSSymbolOwnerGetPath()),
          v18 = objc_claimAutoreleasedReturnValue(),
          v19 = (void *)v25[5],
          v25[5] = v18,
          v19,
          !objc_msgSend((id)v25[5], "length")))
    {
      v20 = self->_superclassLayout;
      if (v20)
      {
        v10 = v20;
        while (1)
        {
          objc_msgSend(v10, "binaryPath");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
            break;
          objc_msgSend(v10, "superclassInfo");
          v22 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v22;
          if (!v22)
            goto LABEL_27;
        }
        objc_msgSend(v10, "binaryPath");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[VMUClassInfo _setBinaryPath:sanitize:](self, "_setBinaryPath:sanitize:", v23, 0);

        goto LABEL_26;
      }
    }
    else
    {
      -[VMUClassInfo _setBinaryPath:sanitize:](self, "_setBinaryPath:sanitize:", v25[5], 1);
    }
LABEL_27:
    _Block_object_dispose(&v24, 8);

  }
}

void __77__VMUClassInfo__determineBinaryPathUsingObjectIdentifier_remoteClassNameLoc___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CSSymbolOwnerGetPath());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (VMUClassInfo)initWithClass:(unint64_t)a3 type:(unsigned int)a4 infoMap:(id)a5 objectIdentifier:(id)a6 reader:(id)a7
{
  return (VMUClassInfo *)-[VMUClassInfo _initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:](self, "_initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:", a3, *(_QWORD *)&a4, 0, a5, a6, a7);
}

- (VMUClassInfo)initWithRealizedClass:(unint64_t)a3 type:(unsigned int)a4 infoMap:(id)a5 objectIdentifier:(id)a6 reader:(id)a7
{
  return (VMUClassInfo *)-[VMUClassInfo _initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:](self, "_initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:", a3, *(_QWORD *)&a4, 1, a5, a6, a7);
}

- (void)_freeLocalIvarList
{
  unint64_t v3;
  id *localIvarList;
  id v5;
  id *v6;

  if (self->_ivarCount)
  {
    v3 = 0;
    do
    {
      localIvarList = self->_localIvarList;
      v5 = localIvarList[v3];
      localIvarList[v3] = 0;

      ++v3;
    }
    while (v3 < self->_ivarCount);
  }
  v6 = self->_localIvarList;
  if (v6)
  {
    free(v6);
    self->_localIvarList = 0;
  }
}

- (void)dealloc
{
  char *weakLayout;
  char *strongLayout;
  objc_super v5;

  weakLayout = (char *)self->_weakLayout;
  if (weakLayout)
  {
    free(weakLayout);
    self->_weakLayout = 0;
  }
  strongLayout = (char *)self->_strongLayout;
  if (strongLayout)
  {
    free(strongLayout);
    self->_strongLayout = 0;
  }
  -[VMUClassInfo _freeLocalIvarList](self, "_freeLocalIvarList");
  v5.receiver = self;
  v5.super_class = (Class)VMUClassInfo;
  -[VMUClassInfo dealloc](&v5, sel_dealloc);
}

- (id)mutableCopy
{
  return -[VMUClassInfo _copyWithInstanceSize:superclassOffset:asVariant:mutable:](self, "_copyWithInstanceSize:superclassOffset:asVariant:mutable:", self->_instanceSize, self->_superclassOffset, 0, 1);
}

- (void)_identifyObjCClassStructureBlocksForIsa:(unint64_t)a3 isMetaclass:(BOOL)a4 withScanner:(id)a5 addressIdentifierBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  void (**v11)(id, unint64_t, BOOL, _BOOL8);
  unsigned int remoteType;
  void *v14;
  uint64_t (**v15)(_QWORD, _QWORD, _QWORD);
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t (**v31)(_QWORD, _QWORD, _QWORD);
  id v32;
  id v33;
  void (**v34)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v35;
  uint64_t (**v36)(_QWORD, _QWORD, _QWORD);
  VMUTaskMemoryScanner *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  uint64_t (**v43)(_QWORD, _QWORD, _QWORD);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t (**v48)(_QWORD, _QWORD, _QWORD);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t (**v53)(_QWORD, _QWORD, _QWORD);
  int v54;
  _QWORD v55[4];
  id v56;
  VMUClassInfo *v57;
  id v58;
  id v59;
  void (**v60)(id, unint64_t, BOOL, _BOOL8);
  id v61;
  BOOL v62;

  v7 = a4;
  v10 = a5;
  v11 = (void (**)(id, unint64_t, BOOL, _BOOL8))a6;
  if (a3)
  {
    remoteType = self->_remoteType;
    if (remoteType == 8 || remoteType == 1)
    {
      objc_msgSend(v10, "objectIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "memoryReader");
      v15 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v14, "objcABI");
      v16 = (_QWORD *)v15[2](v15, a3, 40);
      v17 = v16;
      if (!v16)
      {
LABEL_36:

        goto LABEL_37;
      }
      v53 = v15;
      if (!v7)
        -[VMUClassInfo _identifyObjCClassStructureBlocksForIsa:isMetaclass:withScanner:addressIdentifierBlock:](self, "_identifyObjCClassStructureBlocksForIsa:isMetaclass:withScanner:addressIdentifierBlock:", objc_msgSend(v14, "translateIsaPointer:", *v16), 1, v10, v11);
      v18 = v17[4];
      objc_msgSend(v14, "vmuTask");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v19, v18);

      v21 = objc_msgSend(v14, "swiftMirror");
      if (v21)
        v22 = *(_QWORD *)(v21 + 8) | 1;
      else
        v22 = 1;
      v11[2](v11, a3, (v22 & v20) != 0, v7);
      v23 = v20 & 0x7FFFFFFFFFF8;
      v11[2](v11, v23, 2, v7);
      objc_msgSend(v10, "setClassStructureFieldScanValueAtSourceAddress:toCorrectedAddress:", a3 + 32, v23);
      v24 = v17[2] & 0xFFFFFFFFFFFFLL;
      v11[2](v11, v24, 4, v7);
      objc_msgSend(v10, "setClassStructureFieldScanValueAtSourceAddress:toCorrectedAddress:", a3 + 16, v24);
      objc_msgSend(v14, "vmuTask");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = VMUGetClassDataExtOfClass(v25, v15, v54, a3);

      v11[2](v11, v26, 3, v7);
      objc_msgSend(v14, "vmuTask");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = VMUGetClassDataROofClass(v27, v15, v54, a3);

      objc_msgSend(v10, "vmuTask");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v28 && (objc_msgSend(v29, "addressIsInSharedCache:", v28) & 1) == 0)
        v11[2](v11, v28, 5, v7);
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __103__VMUClassInfo__identifyObjCClassStructureBlocksForIsa_isMetaclass_withScanner_addressIdentifierBlock___block_invoke;
      v55[3] = &unk_1E4E01FC8;
      v52 = v30;
      v56 = v52;
      v60 = v11;
      v62 = v7;
      v31 = v15;
      v61 = v31;
      v57 = self;
      v32 = v14;
      v58 = v32;
      v33 = v10;
      v59 = v33;
      v34 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A85A995C](v55);
      objc_msgSend(v32, "vmuTask");
      v35 = (id)objc_claimAutoreleasedReturnValue();
      v36 = v31;
      v37 = (VMUTaskMemoryScanner *)v33;
      if (v54)
      {
        v38 = _classDataExtV1ofClass(v35, v36, a3);
        if (v38)
          v39 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v35, *(_QWORD *)(v38 + 8));
        else
          v39 = 0;
        v41 = maskPointerToMethodList(a3 + 8, v39, v37);
      }
      else
      {
        v40 = _classDataRWV0ofClass(v35, v36, a3);
        if (v40)
          v41 = *(_QWORD *)(v40 + 16);
        else
          v41 = 0;
      }

      v34[2](v34, v41, 6, 7);
      objc_msgSend(v32, "vmuTask");
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v43 = v36;
      if (v54)
      {
        v44 = _classDataExtV1ofClass(v42, v43, a3);
        if (v44)
        {
          v45 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v42, *(_QWORD *)(v44 + 16));
          goto LABEL_29;
        }
      }
      else
      {
        v46 = _classDataRWV0ofClass(v42, v43, a3);
        if (v46)
        {
          v45 = *(_QWORD *)(v46 + 24);
          goto LABEL_29;
        }
      }
      v45 = 0;
LABEL_29:

      v34[2](v34, v45, 8, 9);
      objc_msgSend(v32, "vmuTask");
      v47 = (id)objc_claimAutoreleasedReturnValue();
      v48 = v43;
      if (v54)
      {
        v15 = v53;
        v49 = _classDataExtV1ofClass(v47, v48, a3);
        if (v49)
        {
          v50 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v47, *(_QWORD *)(v49 + 24));
LABEL_35:

          v34[2](v34, v50, 10, 11);
          goto LABEL_36;
        }
      }
      else
      {
        v51 = _classDataRWV0ofClass(v47, v48, a3);
        v15 = v53;
        if (v51)
        {
          v50 = *(_QWORD *)(v51 + 32);
          goto LABEL_35;
        }
      }
      v50 = 0;
      goto LABEL_35;
    }
  }
LABEL_37:

}

uint64_t __103__VMUClassInfo__identifyObjCClassStructureBlocksForIsa_isMetaclass_withScanner_addressIdentifierBlock___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  if (a2)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 32), "addressIsInSharedCache:", a2);
    if ((result & 1) == 0)
    {
      if ((a2 & 1) != 0)
      {
        v4 = a2 & 0xFFFFFFFFFFFFFFFELL;
        result = (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 64) + 16))();
        if ((_DWORD)result != -1)
        {
          result = (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 72) + 16))();
          if (result)
          {
            v5 = *(_DWORD *)result;
            if (*(_DWORD *)result)
            {
              v6 = v4 + *(unsigned int *)(*(_QWORD *)(v3 + 40) + 16);
              result = (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 72) + 16))();
              if (result)
              {
                v7 = result;
                v8 = 0;
                do
                {
                  if (*(_QWORD *)(v7 + 8 * v8))
                  {
                    result = objc_msgSend(*(id *)(v3 + 32), "addressIsInSharedCache:");
                    if ((result & 1) == 0)
                    {
                      objc_msgSend(*(id *)(v3 + 48), "vmuTask");
                      v9 = (void *)objc_claimAutoreleasedReturnValue();
                      v10 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v9, *(_QWORD *)(v7 + 8 * v8));

                      maskPointerToMethodList(v6 + (*(_DWORD *)(*(_QWORD *)(v3 + 40) + 16) * v8), v10, *(VMUTaskMemoryScanner **)(v3 + 56));
                      result = (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 64) + 16))();
                    }
                  }
                  ++v8;
                }
                while (v5 != (_DWORD)v8);
              }
            }
          }
        }
      }
      else
      {
        return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 64) + 16))();
      }
    }
  }
  return result;
}

- (void)identifyObjCClassStructureBlocksWithScanner:(id)a3 addressIdentifierBlock:(id)a4
{
  -[VMUClassInfo _identifyObjCClassStructureBlocksForIsa:isMetaclass:withScanner:addressIdentifierBlock:](self, "_identifyObjCClassStructureBlocksForIsa:isMetaclass:withScanner:addressIdentifierBlock:", self->_remoteIsa, 0, a3, a4);
}

- (void)serializeWithClassMap:(id)a3 simpleSerializer:(id)a4 version:(unsigned int)a5
{
  id v7;
  id v8;
  unint64_t v9;
  __int128 v10;
  uint64_t v11;
  unsigned int remoteType;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "serialize64:", self->_remoteIsa);
  v10 = *(_OWORD *)&self->_remotePointerSize;
  v11 = *(_QWORD *)&self->_ro_flags;
  remoteType = self->_remoteType;
  objc_msgSend(v8, "_serializeValues:count:", &v10, 7);
  if (self->_ivarCount)
  {
    v9 = 0;
    do
      objc_msgSend(v8, "serialize32:", objc_msgSend(v7, "indexForFieldInfo:", self->_localIvarList[v9++]));
    while (v9 < self->_ivarCount);
  }
  objc_msgSend(v8, "serializeString:", self->_remoteClassName);
  objc_msgSend(v8, "serializeString:", self->_displayName);
  objc_msgSend(v8, "serializeString:", self->_remoteBinaryPath);
  objc_msgSend(v8, "serialize32:", objc_msgSend(v7, "indexForClassInfo:", self->_superclassLayout));

}

- (VMUClassInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 error:(id *)a6
{
  id v10;
  id v11;
  VMUClassInfo *v12;
  unsigned int *p_ivarCount;
  unsigned int *p_instanceSize;
  uint64_t v15;
  id v16;
  VMUClassInfo *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  VMUFieldInfo *v25;
  id *localIvarList;
  id v27;
  uint64_t v28;
  NSString *remoteClassName;
  uint64_t v30;
  NSString *displayName;
  uint64_t v32;
  NSString *remoteBinaryPath;
  uint64_t v34;
  uint64_t v35;
  VMUClassInfo *superclassLayout;
  unsigned int superclassOffset;
  int *v39;
  int v40;
  int v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  unsigned int *LocalIvar;
  uint64_t v46;
  ptrdiff_t Offset;
  uint64_t v48;
  id *v49;
  id v50;
  VMUMutableFieldInfo *v51;
  uint64_t v52;
  uint64_t v53;
  objc_super v54;
  _QWORD v55[8];

  v55[7] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v54.receiver = self;
  v54.super_class = (Class)VMUClassInfo;
  v12 = -[VMUClassInfo init](&v54, sel_init);
  if (!v12)
    goto LABEL_29;
  v53 = 0;
  if (!a6)
    a6 = (id *)&v53;
  v12->_remoteIsa = objc_msgSend(v10, "deserialize64WithError:", a6);
  if (*a6)
    goto LABEL_8;
  p_ivarCount = &v12->_ivarCount;
  v55[0] = &v12->_remotePointerSize;
  v55[1] = &v12->_ivarCount;
  p_instanceSize = &v12->_instanceSize;
  v55[2] = &v12->_superclassOffset;
  v55[3] = &v12->_instanceSize;
  v55[4] = &v12->_ro_flags;
  v55[5] = &v12->_rw_flags;
  v55[6] = &v12->_remoteType;
  v15 = objc_msgSend(v10, "_deserializeValues:error:", 7, a6);
  v16 = *a6;
  if (*a6)
    goto LABEL_8;
  do
  {
    *(_DWORD *)v55[(_QWORD)v16] = *(_DWORD *)(v15 + 4 * (_QWORD)v16);
    v16 = (char *)v16 + 1;
  }
  while (v16 != (id)7);
  if (*a6)
    goto LABEL_8;
  v12->_localIvarList = (id *)malloc_type_calloc(*p_ivarCount + 1, 8uLL, 0x80040B8603338uLL);
  if (a5 < 4)
  {
    if (a5 == 3)
    {
      if (*p_ivarCount)
      {
        v24 = 0;
        do
        {
          v25 = -[VMUFieldInfo initWithSerializer:classMap:version:error:]([VMUFieldInfo alloc], "initWithSerializer:classMap:version:error:", v10, v11, 3, a6);
          localIvarList = v12->_localIvarList;
          v27 = localIvarList[v24];
          localIvarList[v24] = v25;

          if (*a6)
            goto LABEL_8;
        }
        while (++v24 < (unint64_t)*p_ivarCount);
      }
    }
    else
    {
      superclassOffset = *p_instanceSize;
      if (*p_instanceSize <= v12->_superclassOffset)
        superclassOffset = v12->_superclassOffset;
      *p_instanceSize = superclassOffset;
      v12->_weakLayout = (const char *)objc_msgSend(v10, "copyDeserializedNullTerminatedBytesWithError:", a6);
      if (*a6)
        goto LABEL_8;
      v12->_strongLayout = (const char *)objc_msgSend(v10, "copyDeserializedNullTerminatedBytesWithError:", a6);
      if (*a6)
        goto LABEL_8;
      if (*p_ivarCount)
      {
        v52 = 0;
        do
        {
          v39 = (int *)objc_msgSend(v10, "_deserializeValues:error:", 2, a6);
          if (*a6)
            goto LABEL_8;
          v40 = *v39;
          v41 = v39[1];
          v42 = objc_msgSend(v10, "copyDeserializedNullTerminatedBytesWithError:", a6);
          if (*a6)
            goto LABEL_8;
          v43 = (const char *)v42;
          v44 = (const char *)objc_msgSend(v10, "copyDeserializedNullTerminatedBytesWithError:", a6);
          if (*a6)
            goto LABEL_8;
          LocalIvar = (unsigned int *)_createLocalIvar(v43, v44, v40, v41, 1);
          v51 = [VMUMutableFieldInfo alloc];
          v46 = LocalIvar[7];
          Offset = ivar_getOffset((Ivar)LocalIvar);
          v48 = -[VMUFieldInfo initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:](v51, "initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:", LocalIvar, v46, Offset, ivar_getName((Ivar)LocalIvar), -[VMUClassInfo isARR](v12, "isARR"), v12->_remotePointerSize == 8);
          v49 = v12->_localIvarList;
          v50 = v49[v52];
          v49[v52] = (id)v48;

          _destroyLocalIvar((objc_ivar *)LocalIvar);
        }
        while (++v52 < (unint64_t)v12->_ivarCount);
      }
      -[VMUClassInfo _parseIvarsAndLayouts](v12, "_parseIvarsAndLayouts");
    }
  }
  else if (*p_ivarCount)
  {
    v18 = 0;
    v19 = 0;
    do
    {
      v20 = objc_msgSend(v10, "deserialize32WithError:", a6);
      if (*a6)
        goto LABEL_8;
      v21 = v20;
      v22 = (void *)MEMORY[0x1A85A9758]();
      objc_msgSend(v11, "fieldInfoForIndex:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        objc_storeStrong(&v12->_localIvarList[v19++], v23);
      else
        NSLog(CFSTR("Bad field index in document"));

      objc_autoreleasePoolPop(v22);
    }
    while (++v18 < *p_ivarCount);
  }
  v28 = objc_msgSend(v10, "copyDeserializedStringWithError:", a6);
  remoteClassName = v12->_remoteClassName;
  v12->_remoteClassName = (NSString *)v28;

  if (!*a6)
  {
    if (a5 < 3
      || (v30 = objc_msgSend(v10, "copyDeserializedStringWithError:", a6),
          displayName = v12->_displayName,
          v12->_displayName = (NSString *)v30,
          displayName,
          !*a6))
    {
      v32 = objc_msgSend(v10, "copyDeserializedStringWithError:", a6);
      remoteBinaryPath = v12->_remoteBinaryPath;
      v12->_remoteBinaryPath = (NSString *)v32;

      if (!*a6)
      {
        v34 = objc_msgSend(v10, "deserialize32WithError:", a6);
        if (!*a6)
        {
          objc_msgSend(v11, "classInfoForIndex:", v34);
          v35 = objc_claimAutoreleasedReturnValue();
          superclassLayout = v12->_superclassLayout;
          v12->_superclassLayout = (VMUClassInfo *)v35;

          v12->_defaultScanType = 1;
          -[VMUClassInfo _demangleClassName](v12, "_demangleClassName");
LABEL_29:
          v17 = v12;
          goto LABEL_30;
        }
      }
    }
  }
LABEL_8:
  v17 = 0;
LABEL_30:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[VMUClassInfo encodeWithCoder:]", "VMUClassInfo.mm", 2014, "0");
}

- (VMUClassInfo)initWithCoder:(id)a3
{
  NSCoder *v4;
  VMUClassInfo *v5;
  VMUClassInfo *v6;
  VMUClassInfo *v7;
  unsigned int instanceSize;
  unint64_t v9;
  NSCoder *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  _QWORD *v15;
  _DWORD *v16;
  VMUMutableFieldInfo *v17;
  uint64_t v18;
  ptrdiff_t Offset;
  uint64_t v20;
  id *localIvarList;
  id v22;
  uint64_t v23;
  NSString *remoteClassName;
  uint64_t v25;
  NSString *remoteBinaryPath;
  uint64_t v27;
  VMUClassInfo *superclassLayout;
  objc_super v30;
  int v31;
  int v32;

  v4 = (NSCoder *)a3;
  v30.receiver = self;
  v30.super_class = (Class)VMUClassInfo;
  v5 = -[VMUClassInfo init](&v30, sel_init);
  v6 = v5;
  v7 = v5;
  if (v5)
  {
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "Q", &v5->_remoteIsa, 8);
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "I");
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "I", &v6->_ivarCount, 4);
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "I", &v6->_superclassOffset, 4);
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "I", &v6->_instanceSize, 4);
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "I", &v6->_ro_flags, 4);
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "I", &v6->_rw_flags, 4);
    -[NSCoder decodeValueOfObjCType:at:size:](v4, "decodeValueOfObjCType:at:size:", "i", &v6->_remoteType, 4);
    instanceSize = v6->_instanceSize;
    if (instanceSize <= v6->_superclassOffset)
      instanceSize = v6->_superclassOffset;
    v6->_instanceSize = instanceSize;
    v7->_weakLayout = (const char *)_decodeNullTerminatedBytes(v4);
    v7->_strongLayout = (const char *)_decodeNullTerminatedBytes(v4);
    v7->_localIvarList = (id *)malloc_type_calloc(v7->_ivarCount + 1, 8uLL, 0x80040B8603338uLL);
    if (v7->_ivarCount)
    {
      v9 = 0;
      do
      {
        v10 = v4;
        v32 = 0;
        -[NSCoder decodeValueOfObjCType:at:size:](v10, "decodeValueOfObjCType:at:size:", "I", &v32, 4);
        v11 = _decodeNullTerminatedBytes(v10);
        v12 = _decodeNullTerminatedBytes(v10);
        v31 = 0;
        -[NSCoder decodeValueOfObjCType:at:size:](v10, "decodeValueOfObjCType:at:size:", "I", &v31, 4);
        v13 = v31;
        v14 = v32;
        v15 = malloc_type_malloc(0x28uLL, 0x1050040749D65F6uLL);
        v15[1] = v11;
        v15[2] = v12;
        v16 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
        *v15 = v16;
        *v16 = v14;
        *((_DWORD *)v15 + 7) = v13;
        *((_BYTE *)v15 + 32) = 1;

        v17 = [VMUMutableFieldInfo alloc];
        v18 = *((unsigned int *)v15 + 7);
        Offset = ivar_getOffset((Ivar)v15);
        v20 = -[VMUFieldInfo initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:](v17, "initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:", v15, v18, Offset, ivar_getName((Ivar)v15), -[VMUClassInfo isARR](v7, "isARR"), v6->_remotePointerSize == 8);
        localIvarList = v7->_localIvarList;
        v22 = localIvarList[v9];
        localIvarList[v9] = (id)v20;

        _destroyLocalIvar((objc_ivar *)v15);
        ++v9;
      }
      while (v9 < v7->_ivarCount);
    }
    -[VMUClassInfo _parseIvarsAndLayouts](v7, "_parseIvarsAndLayouts");
    -[NSCoder decodeObject](v4, "decodeObject");
    v23 = objc_claimAutoreleasedReturnValue();
    remoteClassName = v7->_remoteClassName;
    v7->_remoteClassName = (NSString *)v23;

    -[NSCoder decodeObject](v4, "decodeObject");
    v25 = objc_claimAutoreleasedReturnValue();
    remoteBinaryPath = v7->_remoteBinaryPath;
    v7->_remoteBinaryPath = (NSString *)v25;

    -[NSCoder decodeObject](v4, "decodeObject");
    v27 = objc_claimAutoreleasedReturnValue();
    superclassLayout = v7->_superclassLayout;
    v7->_superclassLayout = (VMUClassInfo *)v27;

    v7->_defaultScanType = 1;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_remoteClassName, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  VMUClassInfo *v5;
  VMUClassInfo *v6;
  VMUClassInfo *v7;
  uint64_t v8;
  unint64_t remoteIsa;
  char v10;
  unsigned int remoteType;
  NSString *remoteClassName;
  NSString *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = (VMUClassInfo *)a3;
  v6 = v5;
  if (v5 == self)
  {
    v10 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        v8 = -[VMUClassInfo remoteIsa](v7, "remoteIsa");
        remoteIsa = self->_remoteIsa;
        if (remoteIsa | v8)
        {
          v10 = remoteIsa == v8;
LABEL_19:

          goto LABEL_20;
        }
        remoteType = self->_remoteType;
        if (remoteType != -[VMUClassInfo infoType](v7, "infoType"))
        {
          v10 = 0;
          goto LABEL_19;
        }
        remoteClassName = self->_remoteClassName;
        -[VMUClassInfo className](v7, "className");
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (remoteClassName == v13
          || (v14 = self->_remoteClassName,
              -[VMUClassInfo className](v7, "className"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[NSString isEqualToString:](v14, "isEqualToString:", v3)))
        {
          -[VMUClassInfo binaryPath](self, "binaryPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[VMUClassInfo binaryPath](v7, "binaryPath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15 == v16)
          {

            v10 = 1;
          }
          else
          {
            -[VMUClassInfo binaryPath](self, "binaryPath");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[VMUClassInfo binaryPath](v7, "binaryPath");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v17, "isEqualToString:", v18);

          }
          if (remoteClassName == v13)
            goto LABEL_18;
        }
        else
        {
          v10 = 0;
        }

LABEL_18:
        goto LABEL_19;
      }
    }
    v10 = 0;
  }
LABEL_20:

  return v10;
}

- (void)_logDescriptionWithSuperclasses:(BOOL)a3 indentation:(int)a4 toLogger:(id)a5
{
  _BOOL4 v6;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  NSString *displayName;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  id v17;
  uint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  const char *v21;
  const char *v22;
  void *v23;
  VMUClassInfo *superclassLayout;
  unsigned int v25;
  unsigned int v26;
  unint64_t v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void (**v40)(id, void *);

  v6 = a3;
  v40 = (void (**)(id, void *))a5;
  v36 = a4;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), -[VMUClassInfo instanceSize](self, "instanceSize"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = "";
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("instance size %d, allocation size %d"), -[VMUClassInfo instanceSize](self, "instanceSize"), malloc_good_size(-[VMUClassInfo instanceSize](self, "instanceSize")));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = "Class: ";
  }
  v10 = (void *)v8;
  v11 = (void *)MEMORY[0x1E0CB3940];
  -[VMUClassInfo className](self, "className");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v6;
  v38 = v10;
  displayName = self->_displayName;
  if (displayName)
    v13 = " as '";
  else
    v13 = "";
  v14 = -[NSString UTF8String](displayName, "UTF8String");
  if (v14)
    v15 = (const char *)v14;
  else
    v15 = "";
  if (self->_displayName)
    v16 = "'";
  else
    v16 = "";
  -[VMUClassInfo typeName](self, "typeName");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v17, "UTF8String");
  v19 = -[VMUClassInfo isARR](self, "isARR");
  v20 = -[VMUClassInfo hasSpecificLayout](self, "hasSpecificLayout");
  v21 = "MRC";
  if (v19)
    v21 = "ARC";
  v22 = ", Specific";
  if (!v20)
    v22 = "";
  v37 = (2 * v36);
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%*s'%@'%s%s%s [%@] - %s, %s%s {"), v37, v9, v39, v13, v15, v16, v38, v18, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2](v40, v23);

  if (v35)
  {
    superclassLayout = self->_superclassLayout;
    if (superclassLayout)
      -[VMUClassInfo _logDescriptionWithSuperclasses:indentation:toLogger:](superclassLayout, "_logDescriptionWithSuperclasses:indentation:toLogger:", 1, (v36 + 1), v40);
  }
  v25 = -[VMUClassInfo instanceSize](self->_superclassLayout, "instanceSize");
  if (self->_ivarCount)
  {
    v26 = v25;
    v27 = 0;
    do
    {
      v28 = objc_msgSend(self->_localIvarList[v27], "offset");
      v29 = objc_msgSend(self->_localIvarList[v27], "offset");
      if (v29 >= v26)
        v30 = v26;
      else
        v30 = v29;
      v31 = v28 - v30;
      if ((_DWORD)v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%*s<< %u alignment bytes >>"), (v37 + 3), ", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v40[2](v40, v32);

      }
      _formatIvar((VMUFieldInfo *)self->_localIvarList[v27], (v37 + 5));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v40[2](v40, v33);

      LODWORD(v33) = objc_msgSend(self->_localIvarList[v27], "offset");
      v26 = objc_msgSend(self->_localIvarList[v27++], "size") + (_DWORD)v33;
    }
    while (v27 < self->_ivarCount);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%*s}"), v37, ");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2](v40, v34);

}

- (void)enumerateSublayoutsForSize:(unsigned int)a3 withBlock:(id)a4
{
  unint64_t v7;

  -[VMUClassInfo enumerateSublayoutsForSize:withBlock:](self->_superclassLayout, "enumerateSublayoutsForSize:withBlock:");
  if (self->_ivarCount)
  {
    v7 = 0;
    do
      -[VMUFieldInfo enumerateSublayoutsForSize:parentOffset:remotePointerSize:withBlock:]((uint64_t)self->_localIvarList[v7++], a3, 0, self->_remotePointerSize, (uint64_t)a4);
    while (v7 < self->_ivarCount);
  }
}

- (id)_copyWithInstanceSize:(unsigned int)a3 superclassOffset:(unsigned int)a4 asVariant:(BOOL)a5 mutable:(BOOL)a6
{
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  char *v12;
  char *v13;
  unint64_t remoteIsa;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  id *localIvarList;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  VMUClassInfo *v26;
  VMUClassInfo *genericLayout;

  v7 = a6;
  v8 = a5;
  v12 = (char *)objc_alloc_init((Class)objc_opt_class());
  v13 = v12;
  if (v8)
    remoteIsa = 0;
  else
    remoteIsa = self->_remoteIsa;
  *((_QWORD *)v12 + 1) = remoteIsa;
  *((_DWORD *)v12 + 4) = self->_remotePointerSize;
  *((_DWORD *)v12 + 5) = self->_ivarCount;
  if (self->_ivarCount)
  {
    v15 = (void *)MEMORY[0x1A85A9758]();
    *((_QWORD *)v13 + 6) = malloc_type_calloc(self->_ivarCount + 1, 8uLL, 0x80040B8603338uLL);
    if (self->_ivarCount)
    {
      v16 = 0;
      v17 = 0;
      do
      {
        localIvarList = self->_localIvarList;
        v19 = localIvarList[v16];
        if (v7)
        {
          v6 = (void *)objc_msgSend(localIvarList[v16], "mutableCopy");
          v19 = v6;
        }
        objc_storeStrong((id *)(*((_QWORD *)v13 + 6) + v16 * 8), v19);
        if (v7)

        ++v17;
        ++v16;
      }
      while (v17 < self->_ivarCount);
    }
    objc_autoreleasePoolPop(v15);
  }
  *((_DWORD *)v13 + 6) = a4;
  *((_DWORD *)v13 + 7) = a3;
  *((_DWORD *)v13 + 8) = self->_ro_flags;
  *(_QWORD *)(v13 + 36) = *(_QWORD *)&self->_rw_flags;
  *((_DWORD *)v13 + 11) = self->_remoteType;
  v20 = -[NSString copy](self->_remoteClassName, "copy");
  v21 = (void *)*((_QWORD *)v13 + 7);
  *((_QWORD *)v13 + 7) = v20;

  v22 = -[NSString copy](self->_displayName, "copy");
  v23 = (void *)*((_QWORD *)v13 + 8);
  *((_QWORD *)v13 + 8) = v22;

  v24 = -[NSString copy](self->_remoteBinaryPath, "copy");
  v25 = (void *)*((_QWORD *)v13 + 9);
  *((_QWORD *)v13 + 9) = v24;

  objc_storeStrong((id *)v13 + 10, self->_superclassLayout);
  if (v8)
    v26 = self;
  else
    v26 = 0;
  if (self->_genericLayout)
    genericLayout = self->_genericLayout;
  else
    genericLayout = v26;
  objc_storeStrong((id *)v13 + 11, genericLayout);
  v13[146] = self->_usesSwiftRefcounting;
  return v13;
}

- (void)_applyExtendedLayout:(const char *)a3 withSize:(unsigned int)a4
{
  uint64_t v7;
  unsigned int superclassOffset;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t ivarCount;
  unsigned int v13;
  id *v14;
  id *v15;
  unsigned int i;
  VMUMutableFieldInfo *v17;
  VMUMutableFieldInfo *v18;
  id *localIvarList;
  uint64_t v20;
  id v21;
  VMUMutableFieldInfo *v22;
  unsigned int remotePointerSize;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unsigned int v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;

  if (a3)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v7 = MEMORY[0x1E0C809B0];
    v33 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __46__VMUClassInfo__applyExtendedLayout_withSize___block_invoke;
    v29[3] = &unk_1E4E01FF0;
    v29[4] = &v30;
    _processExtendedLayout((unint64_t)a3, v29);
    superclassOffset = self->_superclassOffset;
    v9 = a4 >= superclassOffset;
    v10 = a4 - superclassOffset;
    if (v9)
    {
      v11 = v10 / self->_remotePointerSize;
      if (*((_DWORD *)v31 + 6) > v11)
        v11 = *((_DWORD *)v31 + 6);
      *((_DWORD *)v31 + 6) = v11;
      ivarCount = self->_ivarCount;
      v13 = v11 + 1;
      v14 = (id *)malloc_type_realloc(self->_localIvarList, 8 * (ivarCount + v11 + 1), 0x80040B8603338uLL);
      v15 = v14;
      if (v14)
      {
        bzero(&v14[ivarCount], 8 * v13);
        self->_localIvarList = v15;
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v28 = self->_superclassOffset;
        v24[0] = v7;
        v24[1] = 3221225472;
        v24[2] = __46__VMUClassInfo__applyExtendedLayout_withSize___block_invoke_2;
        v24[3] = &unk_1E4E02018;
        v24[4] = self;
        v24[5] = &v25;
        _processExtendedLayout((unint64_t)a3, v24);
        for (i = self->_ivarCount; i < *((_DWORD *)v31 + 6); ++i)
        {
          v17 = [VMUMutableFieldInfo alloc];
          v18 = -[VMUFieldInfo initWithName:type:scan:offset:size:](v17, "initWithName:type:scan:offset:size:", CFSTR("[capture]"), 0, 1, *((unsigned int *)v26 + 6), self->_remotePointerSize);
          -[VMUMutableFieldInfo setIsCapture:](v18, "setIsCapture:", 1);
          localIvarList = self->_localIvarList;
          v20 = self->_ivarCount;
          v21 = localIvarList[v20];
          localIvarList[v20] = v18;
          v22 = v18;

          remotePointerSize = self->_remotePointerSize;
          ++self->_ivarCount;
          *((_DWORD *)v26 + 6) += remotePointerSize;

        }
        _Block_object_dispose(&v25, 8);
      }
      else
      {
        self->_localIvarList = 0;
      }
    }
    _Block_object_dispose(&v30, 8);
  }
}

uint64_t __46__VMUClassInfo__applyExtendedLayout_withSize___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a4;
  return result;
}

void __46__VMUClassInfo__applyExtendedLayout_withSize___block_invoke_2(uint64_t a1, uint64_t a2, int a3, int a4)
{
  int v4;
  const __CFString *v8;
  VMUMutableFieldInfo *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  VMUMutableFieldInfo *v14;

  if (a4)
  {
    v4 = a4;
    if (a3)
      v8 = CFSTR("[__block capture]");
    else
      v8 = CFSTR("[capture]");
    do
    {
      v9 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", v8, 0, a2, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16));
      -[VMUMutableFieldInfo setIsCapture:](v9, "setIsCapture:", 1);
      if (a3)
        -[VMUMutableFieldInfo setIsByref:](v9, "setIsByref:", 1);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(v10 + 48);
      v12 = *(unsigned int *)(v10 + 20);
      v13 = *(void **)(v11 + 8 * v12);
      *(_QWORD *)(v11 + 8 * v12) = v9;
      v14 = v9;

      ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 20);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);

      --v4;
    }
    while (v4);
  }
}

- (id)instanceSpecificInfoForObject:(unint64_t)a3 ofSize:(unsigned int)a4 memoryReader:(id)a5
{
  -[VMUClassInfo instanceSpecificInfoForObject:ofSize:withScanner:memoryReader:](self, "instanceSpecificInfoForObject:ofSize:withScanner:memoryReader:", a3, *(_QWORD *)&a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)instanceSpecificInfoForObject:(unint64_t)a3 ofSize:(unsigned int)a4 withScanner:(id)a5 memoryReader:(id)a6
{
  uint64_t v9;
  VMUClassInfo *v11;
  uint64_t v12;
  uint64_t v13;
  VMUClassInfo *v14;
  NSMutableArray *variantEvaluators;
  uint64_t v17;
  int v18;
  NSMutableArray *complexVariantEvaluators;
  int v20;
  uint64_t v21;
  void (**v22)(_QWORD);
  void *v23;
  VMUClassInfo *v24;
  void (**v25)(_QWORD);
  unint64_t v26;
  unsigned __int8 *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unsigned int v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  unint64_t v40;
  unsigned int v41;
  uint64_t v42;
  VMUClassInfo *v43;
  VMUClassInfo *v44;
  unsigned int remoteType;
  int *v46;
  int v47;
  unint64_t v48;
  unsigned int remotePointerSize;
  id v50;
  void *v51;
  uint64_t (*v52)(id, unint64_t, uint64_t);
  _QWORD *v53;
  uint64_t v54;
  int *v55;
  int v56;
  unsigned int *v57;
  uint64_t v58;
  unsigned int v59;
  int v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  id v64;
  void *v65;
  uint64_t (*v66)(id, unint64_t, uint64_t);
  unint64_t *v67;
  unint64_t v68;
  _DWORD *v69;
  unsigned int v70;
  uint64_t v71;
  unsigned int v72;
  unsigned int v73;
  int v74;
  uint64_t v75;
  unsigned int *v76;
  unsigned int v77;
  unsigned int *v78;
  void *v79;
  uint64_t v80;
  unsigned int v81;
  id v82;
  void *v83;
  uint64_t (*v84)(id, uint64_t, uint64_t);
  unint64_t *v85;
  unint64_t v86;
  unsigned int *v87;
  void *v88;
  VMUClassInfo *v89;
  _BYTE *v90;
  unsigned int v91;
  _QWORD v92[5];
  VMUClassInfo *v93;
  uint64_t *v94;
  _DWORD *v95;
  uint64_t v96;
  unint64_t v97;
  id v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  _QWORD v105[6];
  _QWORD v106[7];
  uint64_t v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  _QWORD v112[7];
  _DWORD *v113;

  if (a6)
  {
    if (!self->_genericLayout)
    {
      v9 = *(_QWORD *)&a4;
      if (-[VMUClassInfo hasSpecificLayout](self, "hasSpecificLayout"))
      {
        v11 = self->_superclassLayout;
        v12 = -[VMUClassInfo hasVariantLayout](self->_superclassLayout, "hasVariantLayout");
        if ((_DWORD)v12)
        {
          -[VMUClassInfo instanceSpecificInfoForObject:ofSize:withScanner:memoryReader:](self->_superclassLayout, "instanceSpecificInfoForObject:ofSize:withScanner:memoryReader:", a3, v9, a5, a6);
          v13 = objc_claimAutoreleasedReturnValue();

          v11 = (VMUClassInfo *)v13;
          goto LABEL_10;
        }
        if (self->_variantEvaluators || self->_complexVariantEvaluators)
        {
LABEL_10:
          v113 = 0;
          variantEvaluators = self->_variantEvaluators;
          v17 = MEMORY[0x1E0C809B0];
          v112[0] = MEMORY[0x1E0C809B0];
          v112[1] = 3221225472;
          v112[2] = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_2;
          v112[3] = &__block_descriptor_56_e48_B16__0___B__Q__VMUTaskMemoryScanner_____v__QQ__8lu40l8u48l8;
          v112[4] = a3;
          v112[5] = a5;
          v112[6] = a6;
          v18 = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke(v12, variantEvaluators, &v113, v112);
          v108 = 0;
          v109 = &v108;
          v110 = 0x2020000000;
          v111 = 0;
          v111 = objc_msgSend(CFSTR("seed"), "hash");
          v107 = 0;
          complexVariantEvaluators = self->_complexVariantEvaluators;
          v106[0] = v17;
          v106[1] = 3221225472;
          v106[2] = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_3;
          v106[3] = &unk_1E4E02060;
          v106[5] = a3;
          v106[6] = a6;
          v106[4] = &v108;
          v20 = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke(v111, complexVariantEvaluators, &v107, v106);
          v105[0] = v17;
          v105[1] = 3221225472;
          v105[2] = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_4;
          v105[3] = &__block_descriptor_48_e5_v8__0l;
          v105[4] = v113;
          v105[5] = v107;
          v21 = MEMORY[0x1A85A995C](v105);
          v22 = (void (**)(_QWORD))v21;
          if (((v18 | v20) & 1) == 0 && v11 == self->_superclassLayout)
          {
            (*(void (**)(uint64_t))(v21 + 16))(v21);
            v14 = self;
LABEL_31:

            _Block_object_dispose(&v108, 8);
LABEL_32:

            return v14;
          }
          v99 = 0;
          v100 = &v99;
          v101 = 0x3032000000;
          v102 = __Block_byref_object_copy__6;
          v103 = __Block_byref_object_dispose__6;
          v104 = 0;
          v23 = (void *)MEMORY[0x1A85A9758]();
          v92[0] = v17;
          v92[1] = 3221225472;
          v92[2] = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_5;
          v92[3] = &unk_1E4E020F8;
          v92[4] = self;
          v94 = &v99;
          v95 = v113;
          v96 = v107;
          v97 = a3;
          v98 = a6;
          v24 = v11;
          v93 = v24;
          v25 = (void (**)(_QWORD))MEMORY[0x1A85A995C](v92);
          if (!v113)
          {
            v26 = 0;
            goto LABEL_22;
          }
          v26 = 0;
          v27 = (unsigned __int8 *)v113 + 3;
          v28 = (*v113 + 7);
          v29 = (v28 >> 3) + 4;
          v30 = (v28 >> 3) + 8;
          do
          {
            v31 = *(v27 - 3) + 16 * v26;
            v32 = *(v27 - 2)
                + 16
                * ((v31 ^ ((unint64_t)(v31 & 0xF0000000) >> 24)) & ~(unint64_t)(v31 & 0xF0000000));
            v33 = *(v27 - 1)
                + 16
                * ((v32 ^ ((unint64_t)(v32 & 0xF0000000) >> 24)) & ~(unint64_t)(v32 & 0xF0000000));
            v34 = *v27;
            v27 += 4;
            v35 = v34
                + 16
                * ((v33 ^ ((unint64_t)(v33 & 0xF0000000) >> 24)) & ~(unint64_t)(v33 & 0xF0000000));
            v26 = (v35 ^ ((unint64_t)(v35 & 0xF0000000) >> 24)) & ~(unint64_t)(v35 & 0xF0000000);
            v30 -= 4;
          }
          while (v30 > 7);
          if (v30 != 5)
          {
            if (v30 != 6)
            {
              if (v30 != 7)
              {
LABEL_22:
                v39 = v109;
                v40 = v26 + 37 * v109[3];
                v109[3] = v40;
                if (v24 == self->_superclassLayout)
                {
                  v42 = 0;
                }
                else
                {
                  v41 = objc_msgSend(a5, "_indexForClassInfo:", v24);
                  v39 = v109;
                  v40 = v109[3];
                  v42 = v41;
                }
                v39[3] = v42 + 37 * v40;
                objc_msgSend(a5, "_cachedVariantForGenericInfo:variantKey:", self);
                v14 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
                if (v14)
                {
                  v22[2](v22);
                  v43 = v14;
                }
                else
                {
                  v25[2](v25);
                  objc_msgSend(a5, "_registerVariant:forGenericInfo:variantKey:", v100[5], self, v109[3]);
                }

                objc_autoreleasePoolPop(v23);
                if (!v14)
                {
                  v22[2](v22);
                  v14 = (VMUClassInfo *)(id)v100[5];
                }
                _Block_object_dispose(&v99, 8);

                goto LABEL_31;
              }
              v36 = *((unsigned __int8 *)v113 + v29 - 3) + 16 * v26;
              v26 = (v36 ^ ((unint64_t)(v36 & 0xF0000000) >> 24)) & ~(unint64_t)(v36 & 0xF0000000);
            }
            v37 = *((unsigned __int8 *)v113 + v29 - 2) + 16 * v26;
            v26 = (v37 ^ ((unint64_t)(v37 & 0xF0000000) >> 24)) & ~(unint64_t)(v37 & 0xF0000000);
          }
          v38 = *((unsigned __int8 *)v113 + v29 - 1) + 16 * v26;
          v26 = (v38 ^ ((unint64_t)(v38 & 0xF0000000) >> 24)) & ~(unint64_t)(v38 & 0xF0000000);
          goto LABEL_22;
        }
        v44 = self;
        remoteType = v44->_remoteType;
        if (remoteType != 0x80000000)
        {
          if (remoteType == 8 || remoteType == 1)
          {
            v46 = (int *)(*((uint64_t (**)(id, unint64_t, uint64_t))a6 + 2))(a6, a3 + 8, 4);
            if (v46)
            {
              v47 = *v46;
              if (*v46 >> 30 == 3)
              {
                v48 = a3 + 24;
                remotePointerSize = v44->_remotePointerSize;
                v50 = a6;
                v51 = v50;
                v52 = (uint64_t (*)(id, unint64_t, uint64_t))*((_QWORD *)a6 + 2);
                if (remotePointerSize == 8)
                {
                  v53 = (_QWORD *)v52(v50, v48, 8);
                  v54 = v53 ? *v53 : 0;
                }
                else
                {
                  v69 = (_DWORD *)v52(v50, v48, 4);
                  v70 = v69 ? *v69 : 0;
                  v54 = v70;
                }

                if (v54)
                {
                  objc_msgSend(a5, "_cachedVariantForGenericInfo:variantKey:", v44, v54);
                  v14 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();

                  if (v14)
                    goto LABEL_32;
                  if ((v47 & 0x2000000) != 0)
                    v75 = 40;
                  else
                    v75 = 24;
                  v76 = (unsigned int *)(*((uint64_t (**)(void *, uint64_t, uint64_t))a6 + 2))(v51, v54 + 8, 4);
                  if (v76)
                  {
                    v77 = *v76;
                    if (*v76 > v9)
                    {
                      v14 = v44;
                      goto LABEL_32;
                    }
                  }
                  else
                  {
                    v77 = 0;
                  }
                  v91 = v77;
                  v14 = -[VMUClassInfo _copyWithInstanceSize:superclassOffset:asVariant:mutable:](v44, "_copyWithInstanceSize:superclassOffset:asVariant:mutable:");
                  v80 = v75 + v54;
                  v81 = v44->_remotePointerSize;
                  v82 = v51;
                  v83 = v82;
                  v84 = (uint64_t (*)(id, uint64_t, uint64_t))*((_QWORD *)a6 + 2);
                  if (v81 == 8)
                  {
                    v85 = (unint64_t *)v84(v82, v80, 8);
                    if (v85)
                    {
                      v86 = *v85;
LABEL_90:

                      if (v86 > 0xFFF)
                      {
                        v88 = (void *)copy_remote_layout_at(v86, v83);
                        -[VMUClassInfo _applyExtendedLayout:withSize:](v14, "_applyExtendedLayout:withSize:", v88, v91);
                        if (v88)
                          free(v88);
                      }
                      else
                      {
                        -[VMUClassInfo _applyExtendedLayout:withSize:](v14, "_applyExtendedLayout:withSize:", v86, v91);
                      }
                      objc_msgSend(a5, "_registerVariant:forGenericInfo:variantKey:", v14, v44, v54);
                      goto LABEL_32;
                    }
                  }
                  else
                  {
                    v87 = (unsigned int *)v84(v82, v80, 4);
                    if (v87)
                    {
                      v86 = *v87;
                      goto LABEL_90;
                    }
                  }
                  v86 = 0;
                  goto LABEL_90;
                }
              }
            }
          }
LABEL_74:
          v14 = v44;
          goto LABEL_32;
        }
        v55 = (int *)(*((uint64_t (**)(id, unint64_t, uint64_t))a6 + 2))(a6, a3 + 16, 4);
        if (v55)
          v56 = *v55;
        else
          v56 = 0;
        v57 = (unsigned int *)(*((uint64_t (**)(id, unint64_t, uint64_t))a6 + 2))(a6, a3 + 20, 4);
        if (v57)
        {
          v58 = *v57;
          if (v58 > v9)
            goto LABEL_74;
        }
        else
        {
          v58 = 0;
        }
        v59 = v44->_remotePointerSize;
        v60 = 2 * v59;
        v61 = 2 * v59 + 8;
        v62 = v56 & 0xF0000000;
        if ((v56 & 0xF0000000) == 0)
        {
          v14 = -[VMUClassInfo _copyWithInstanceSize:superclassOffset:asVariant:mutable:](v44, "_copyWithInstanceSize:superclassOffset:asVariant:mutable:", v58, (v60 + 8), 1, 0);

          goto LABEL_32;
        }
        if (v62 != 0x10000000)
        {
          v71 = v58 | v56 & 0xF2000000;
          objc_msgSend(a5, "_cachedVariantForGenericInfo:variantKey:", v44, v71);
          v14 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            if ((v56 & 0x2000000) != 0)
              v61 = (v61 + 2 * v44->_remotePointerSize);
            v72 = (v62 - 0x20000000) >> 28;
            if (v72 == 1)
            {
              v74 = 1;
              v73 = 256;
            }
            else if (v72 == 2)
            {
              v73 = 1;
              v74 = 1;
            }
            else
            {
              v74 = 0;
              v73 = 32;
            }
            v89 = -[VMUClassInfo _copyWithInstanceSize:superclassOffset:asVariant:mutable:](v44, "_copyWithInstanceSize:superclassOffset:asVariant:mutable:", v58, v61, 1, 0);
            v14 = v89;
            if (v74)
            {
              -[VMUClassInfo _applyExtendedLayout:withSize:](v89, "_applyExtendedLayout:withSize:", v73, v58);
            }
            else
            {
              v90 = malloc_type_calloc(1uLL, 2uLL, 0xFB333CDFuLL);
              *v90 = v73;
              -[VMUClassInfo _applyExtendedLayout:withSize:](v14, "_applyExtendedLayout:withSize:", v90, v58);
              free(v90);
            }
            objc_msgSend(a5, "_registerVariant:forGenericInfo:variantKey:", v14, v44, v71);
          }
          goto LABEL_32;
        }
        v63 = v61 + (v60 & (v56 << 6 >> 31));
        v64 = a6;
        v65 = v64;
        v66 = (uint64_t (*)(id, unint64_t, uint64_t))*((_QWORD *)a6 + 2);
        if (v59 == 8)
        {
          v67 = (unint64_t *)v66(v64, v63 + a3, 8);
          if (v67)
          {
            v68 = *v67;
            goto LABEL_78;
          }
        }
        else
        {
          v78 = (unsigned int *)v66(v64, v63 + a3, 4);
          if (v78)
          {
            v68 = *v78;
            goto LABEL_78;
          }
        }
        v68 = 0;
LABEL_78:

        v14 = -[VMUClassInfo _copyWithInstanceSize:superclassOffset:asVariant:mutable:](v44, "_copyWithInstanceSize:superclassOffset:asVariant:mutable:", v58, (v44->_remotePointerSize + v63), 1, 0);
        if (v68 > 0xFFF)
        {
          v79 = (void *)copy_remote_layout_at(v68, v65);
          -[VMUClassInfo _applyExtendedLayout:withSize:](v14, "_applyExtendedLayout:withSize:", v79, v58);
          if (v79)
            free(v79);
        }
        else
        {
          -[VMUClassInfo _applyExtendedLayout:withSize:](v14, "_applyExtendedLayout:withSize:", v68, v58);
        }
        goto LABEL_32;
      }
    }
  }
  v14 = self;
  return v14;
}

uint64_t __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke(uint64_t a1, void *a2, _QWORD *a3, void *a4)
{
  id v6;
  unsigned int (**v7)(id, void *);
  unsigned int v8;
  _DWORD *v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;

  v6 = a2;
  v7 = a4;
  if (v6
    && (v8 = objc_msgSend(v6, "count"),
        v9 = malloc_type_calloc(1uLL, ((v8 + 7) >> 3) + 4, 0xFF42C4F3uLL),
        *v9 = v8,
        *a3 = v9,
        v8))
  {
    v10 = 0;
    v11 = 0;
    v12 = v8;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7[2](v7, v13))
      {
        v11 = 1;
        if (v10 < *(unsigned int *)*a3)
          *(_BYTE *)((v10 >> 3) + *a3 + 4) |= 1 << (v10 & 7);
      }

      ++v10;
    }
    while (v12 != v10);
  }
  else
  {
    v11 = 0;
  }

  return v11 & 1;
}

uint64_t __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a2 + 16))(a2, a1[4], a1[5], a1[6]);
}

uint64_t __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  v4 = 0;
  result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t *))(a2 + 16))(a2, a1[5], a1[6], &v4);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v4 + 37 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

void __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_4(uint64_t a1)
{
  free(*(void **)(a1 + 32));
  free(*(void **)(a1 + 40));
}

uint64_t __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  char *v12;
  unsigned int v13;
  unsigned int v14;
  BOOL v15;
  unsigned int *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  char *v23;
  unsigned int v24;
  unsigned int v25;
  _QWORD v27[2];
  void (*v28)(_QWORD *, unsigned int);
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  void (*v35)(uint64_t, unsigned int);
  void *v36;
  uint64_t v37;
  uint64_t v38;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyWithInstanceSize:superclassOffset:asVariant:mutable:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 28), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 24), 1, 1);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(unsigned int **)(a1 + 56);
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v35 = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_6;
    v36 = &unk_1E4E020A8;
    v7 = *(_QWORD *)(a1 + 48);
    v37 = *(_QWORD *)(a1 + 32);
    v38 = v7;
    v8 = v34;
    v9 = *v5;
    if (*v5)
    {
      v10 = 0;
      v11 = 1;
      do
      {
        v12 = (char *)v5 + (v10 >> 3);
        v13 = v12[4];
        v14 = v11;
        if (v12[4])
        {
          do
          {
            if ((v13 & 1) != 0)
              v35((uint64_t)v8, v14 - 1);
            if (v13 < 2)
              break;
            v13 >>= 1;
            v15 = v14++ >= v9;
          }
          while (!v15);
        }
        v10 += 8;
        v11 += 8;
      }
      while (v10 < v9);
    }

  }
  v16 = *(unsigned int **)(a1 + 64);
  if (v16)
  {
    v27[0] = v6;
    v27[1] = 3221225472;
    v28 = __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_7;
    v29 = &unk_1E4E020D0;
    v17 = *(_QWORD *)(a1 + 48);
    v30 = *(_QWORD *)(a1 + 32);
    v31 = v17;
    v18 = *(_QWORD *)(a1 + 80);
    v32 = *(_QWORD *)(a1 + 72);
    v33 = v18;
    v19 = v27;
    v20 = *v16;
    if (*v16)
    {
      v21 = 0;
      v22 = 1;
      do
      {
        v23 = (char *)v16 + (v21 >> 3);
        v24 = v23[4];
        v25 = v22;
        if (v23[4])
        {
          do
          {
            if ((v24 & 1) != 0)
              v28(v19, v25 - 1);
            if (v24 < 2)
              break;
            v24 >>= 1;
            v15 = v25++ >= v20;
          }
          while (!v15);
        }
        v21 += 8;
        v22 += 8;
      }
      while (v21 < v20);
    }

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setSuperclassInfo:", *(_QWORD *)(a1 + 40));
}

void __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_6(uint64_t a1, unsigned int a2)
{
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectAtIndexedSubscript:", a2);
  v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __78__VMUClassInfo_instanceSpecificInfoForObject_ofSize_withScanner_memoryReader___block_invoke_7(_QWORD *a1, unsigned int a2)
{
  id v3;

  objc_msgSend(*(id *)(a1[4] + 120), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), a1[6], a1[7]);

}

- (void)enumerateStoredEntriesForObject:(unint64_t)a3 ofSize:(unsigned int)a4 externalValues:(id)a5 block:(id)a6
{
  void (**v10)(id, _QWORD, uint64_t, uint64_t);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  id v40;
  unsigned int v41;
  void (**v42)(id, _QWORD, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[8];
  unsigned int v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v40 = a5;
  v10 = (void (**)(id, _QWORD, uint64_t, uint64_t))a6;
  if (self->_remoteType == 32)
  {
    v42 = v10;
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__6;
    v56 = __Block_byref_object_dispose__6;
    v57 = 0;
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __76__VMUClassInfo_enumerateStoredEntriesForObject_ofSize_externalValues_block___block_invoke;
    v50[3] = &unk_1E4E02120;
    v51 = a4;
    v50[4] = &v62;
    v50[5] = &v52;
    v50[6] = &v58;
    v50[7] = a3;
    -[VMUClassInfo enumerateAllFieldsWithBlock:](self, "enumerateAllFieldsWithBlock:", v50);
    v39 = a3;
    v41 = a4;
    if (v40)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v11 = v40;
      v12 = 0;
      v13 = 0;
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
      if (v14)
      {
        v43 = 0;
        v44 = 0;
        v15 = 0;
        v45 = 0;
        v16 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v47 != v16)
              objc_enumerationMutation(v11);
            v18 = *(id *)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(v18, "field");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isStorageImplPointer");

            if (v20)
            {
              v12 = objc_msgSend(v18, "value");
            }
            else
            {
              objc_msgSend(v18, "field");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "isStorageBitmapPointer");

              if (v22)
              {
                v13 = objc_msgSend(v18, "value");
              }
              else
              {
                objc_msgSend(v18, "field");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "isKeysPointer");

                if (v24)
                {
                  v44 = objc_msgSend(v18, "value");
                }
                else
                {
                  objc_msgSend(v18, "field");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "isValuesPointer");

                  if (v26)
                  {
                    v43 = objc_msgSend(v18, "value");
                  }
                  else if (v15
                         || (objc_msgSend(v18, "field"),
                             v27 = (void *)objc_claimAutoreleasedReturnValue(),
                             v28 = objc_msgSend(v27, "isKeyField"),
                             v27,
                             !v28))
                  {
                    if (!v45)
                    {
                      objc_msgSend(v18, "field");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      v30 = objc_msgSend(v29, "isValueField");

                      if (v30)
                      {
                        objc_msgSend(v18, "field");
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v45 = 0;
                      }
                    }
                  }
                  else
                  {
                    objc_msgSend(v18, "field");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                }
              }
            }

          }
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
        }
        while (v14);
      }
      else
      {
        v43 = 0;
        v44 = 0;
        v15 = 0;
        v45 = 0;
      }

    }
    else
    {
      v12 = 0;
      v13 = 0;
      v43 = 0;
      v44 = 0;
      v15 = 0;
      v45 = 0;
    }
    if (v53[5])
    {
      v31 = *((unsigned int *)v59 + 6);
      if ((_DWORD)v31)
      {
        if (v63[3])
        {
          v32 = 1;
          do
          {
            if (objc_msgSend((id)v53[5], "size") + v31 > v41)
              break;
            v42[2](v42, v53[5], v31, objc_msgSend((id)v53[5], "size"));
            v31 = objc_msgSend((id)v53[5], "stride") + v31;
          }
          while (v63[3] > (unint64_t)v32++);
        }
      }
    }
    if (v12 && v63[3])
    {
      v34 = 0;
      v35 = 0;
      v36 = v43 - v12;
      v37 = v44 - v12;
      v38 = v13 - v12;
      while ((v34 & 7) != 0)
      {
        if ((v35 & 1) != 0)
          goto LABEL_43;
LABEL_47:
        v35 >>= 1;
        v37 += objc_msgSend(v15, "stride");
        v36 += objc_msgSend(v45, "stride");
        if (++v34 >= (unint64_t)v63[3])
          goto LABEL_48;
      }
      if (v38 >= v41)
        goto LABEL_48;
      v35 = *(unsigned __int8 *)(v39 + v38++);
      if ((v35 & 1) == 0)
        goto LABEL_47;
LABEL_43:
      if (v37 + (unint64_t)objc_msgSend(v15, "size") <= v41)
        ((void (**)(id, void *, uint64_t, uint64_t))v42)[2](v42, v15, v37, objc_msgSend(v15, "size"));
      if (v36 + (unint64_t)objc_msgSend(v45, "size") <= v41)
        ((void (**)(id, void *, uint64_t, uint64_t))v42)[2](v42, v45, v36, objc_msgSend(v45, "size"));
      goto LABEL_47;
    }
LABEL_48:

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    v10 = v42;
  }

}

void __76__VMUClassInfo_enumerateStoredEntriesForObject_ofSize_externalValues_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isArraySize")
    && (unint64_t)objc_msgSend(v5, "offset") + 8 <= *(unsigned int *)(a1 + 64))
  {
    v4 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(v4
                                                                            + objc_msgSend(v5, "offset"));
  }
  else if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
         && objc_msgSend(v5, "isArrayEntries"))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "offset");
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (void)enumerateExternalValuesFromObject:(unint64_t)a3 withSize:(unsigned int)a4 block:(id)a5
{
  void (**v8)(id, _QWORD, void *);
  void *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  VMUFieldValue *v15;
  VMUFieldValue *v16;
  void (**v17)(id, _QWORD, void *);

  v8 = (void (**)(id, _QWORD, void *))a5;
  if (self->_remoteType == 32)
  {
    v17 = v8;
    v9 = (void *)objc_opt_new();
    if (self->_ivarCount)
    {
      v10 = 0;
      v11 = 0;
      v12 = a4;
      do
      {
        v13 = self->_localIvarList[v10];
        if (((objc_msgSend(v13, "isStorageImplPointer") & 1) != 0
           || (objc_msgSend(v13, "isStorageBitmapPointer") & 1) != 0
           || (objc_msgSend(v13, "isKeysPointer") & 1) != 0
           || objc_msgSend(v13, "isValuesPointer"))
          && (unint64_t)objc_msgSend(v13, "offset") + 8 <= v12)
        {
          v14 = *(_QWORD *)(a3 + objc_msgSend(v13, "offset"));
          v15 = -[VMUFieldValue initWithField:value:]([VMUFieldValue alloc], "initWithField:value:", v13, v14);
          objc_msgSend(v9, "addObject:", v15);
          if (objc_msgSend(v13, "isStorageImplPointer"))
            v11 = v14;

        }
        if ((objc_msgSend(v13, "isKeyField") & 1) != 0 || objc_msgSend(v13, "isValueField"))
        {
          v16 = -[VMUFieldValue initWithField:value:]([VMUFieldValue alloc], "initWithField:value:", v13, 0);
          objc_msgSend(v9, "addObject:", v16);

        }
        ++v10;
      }
      while (v10 < self->_ivarCount);
      if (v11 && objc_msgSend(v9, "count"))
        v17[2](v17, v11, v9);
    }

    v8 = v17;
  }

}

- (VMUClassInfo)genericInfo
{
  if (self->_genericLayout)
    self = self->_genericLayout;
  return self;
}

- (unsigned)_totalIvarCount
{
  unsigned int ivarCount;

  ivarCount = self->_ivarCount;
  return -[VMUClassInfo _totalIvarCount](self->_superclassLayout, "_totalIvarCount") + ivarCount;
}

- (unsigned)_ivarGapForClass
{
  void *v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;
  unsigned int v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[VMUClassInfo superclassInfo](self, "superclassInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "instanceSize");

  v15 = v4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __32__VMUClassInfo__ivarGapForClass__block_invoke;
  v11[3] = &unk_1E4E02148;
  v11[4] = &v16;
  v11[5] = &v12;
  -[VMUClassInfo enumerateTypeFieldsWithBlock:](self, "enumerateTypeFieldsWithBlock:", v11);
  v5 = -[VMUClassInfo instanceSize](self, "instanceSize");
  v6 = *((_DWORD *)v13 + 6);
  v7 = v5 >= v6;
  v8 = v5 - v6;
  if (!v7)
    v8 = 0;
  v9 = *((_DWORD *)v17 + 6) + v8;
  *((_DWORD *)v17 + 6) = v9;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

void __32__VMUClassInfo__ivarGapForClass__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "offset");
  v4 = objc_msgSend(v7, "offset");
  v5 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v4 < v5)
    v5 = v4;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v3 - v5;
  v6 = objc_msgSend(v7, "offset");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "size") + v6;

}

- (unsigned)ivarGapForClassHierarchy
{
  unsigned int v3;
  VMUClassInfo *v4;
  VMUClassInfo *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  VMUClassInfo *v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;

  v3 = -[VMUClassInfo pointerSize](self, "pointerSize");
  v4 = self;
  v5 = v4;
  v6 = 0;
  if (v4)
  {
    v7 = 0;
    v8 = 0;
    v9 = -v3;
    v10 = (v3 - 1) & 0xFFFFFFFC;
    v11 = v4;
    do
    {
      v12 = -[VMUClassInfo _ivarGapForClass](v11, "_ivarGapForClass");
      -[VMUClassInfo superclassInfo](v11, "superclassInfo");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v12 + v7;
      if ((v10 & (v12 + v7)) != 0)
        v15 = 0;
      else
        v15 = v8;
      if (v8)
        v7 = 0;
      else
        v7 = v10 & (v12 + v7);
      if (v8)
        v16 = v15;
      else
        v16 = 0;
      if (v11 == v5)
        v17 = -1;
      else
        v17 = v9;
      v18 = v14 & v17;
      if (v11 == v5)
        v8 = v7;
      else
        v8 = 0;
      v6 = v18 + v6 - v16;

      v11 = (VMUClassInfo *)v13;
    }
    while (v13);
  }
  v19 = malloc_good_size(-[VMUClassInfo instanceSize](v5, "instanceSize"));
  return v19 - malloc_good_size(-[VMUClassInfo instanceSize](v5, "instanceSize") - v6);
}

- (void)enumerateClassHierarchyWithBlock:(id)a3
{
  void (**v4)(id, VMUClassInfo *);

  v4 = (void (**)(id, VMUClassInfo *))a3;
  -[VMUClassInfo enumerateClassHierarchyWithBlock:](self->_superclassLayout, "enumerateClassHierarchyWithBlock:");
  v4[2](v4, self);

}

- (void)enumerateAllFieldsWithBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[VMUClassInfo enumerateAllFieldsWithBlock:](self->_superclassLayout, "enumerateAllFieldsWithBlock:");
  -[VMUClassInfo enumerateTypeFieldsWithBlock:](self, "enumerateTypeFieldsWithBlock:", v4);

}

- (void)enumerateTypeFieldsWithBlock:(id)a3
{
  void (**v4)(id, id, uint64_t, char *);
  unsigned int v5;
  unsigned int ivarCount;
  uint64_t v7;
  uint64_t v8;
  char v10;

  v4 = (void (**)(id, id, uint64_t, char *))a3;
  v10 = 0;
  v5 = -[VMUClassInfo _totalIvarCount](self, "_totalIvarCount");
  ivarCount = self->_ivarCount;
  if (ivarCount)
  {
    v7 = 0;
    v8 = v5 - ivarCount;
    do
      v4[2](v4, self->_localIvarList[v7], v8 + v7, &v10);
    while (++v7 < (unint64_t)self->_ivarCount && v10 == 0);
  }

}

- (_QWORD)enumerateAllPointerFieldsWithBlock:(_QWORD *)result
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  unsigned int v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v22;
  int v23;

  if (result)
  {
    v2 = result;
    result = (_QWORD *)-[VMUClassInfo enumerateAllPointerFieldsWithBlock:](result[10], a2);
    if (*((_DWORD *)v2 + 5))
    {
      v3 = 0;
      do
      {
        v4 = *(void **)(v2[6] + 8 * v3);
        v5 = objc_msgSend(v4, "offset") % *((_DWORD *)v2 + 4);
        v6 = objc_msgSend(v4, "offset");
        v22 = v3;
        if (v5)
        {
          v7 = *((_DWORD *)v2 + 4);
          v8 = objc_msgSend(v4, "offset");
          v6 += v7 + v8 / *((_DWORD *)v2 + 4) * *((_DWORD *)v2 + 4) - v8;
        }
        v9 = objc_msgSend(v4, "offset");
        result = (_QWORD *)objc_msgSend(v4, "size");
        v10 = (_DWORD)result + v9;
        while (*((_DWORD *)v2 + 4) + v6 <= v10)
        {
          v11 = v6 - objc_msgSend(v4, "offset");
          v23 = 0;
          result = (id)objc_msgSend(v4, "getLeafFieldAtOffset:leafOffset:", v11, &v23);
          if (result)
          {
            v12 = result;
            v13 = v23 + v6;
            v14 = objc_msgSend(result, "size");
            v15 = v23;
            if ((v13 + v14) % *((_DWORD *)v2 + 4))
            {
              v16 = objc_msgSend(v12, "size");
              v17 = *((_DWORD *)v2 + 4);
              v18 = v23 + v6;
              v19 = objc_msgSend(v12, "size");
              v6 += v15
                  + v16
                  + v17
                  + (v18 + v19) / *((_DWORD *)v2 + 4) * *((_DWORD *)v2 + 4)
                  - (v18
                   + v19);
            }
            else
            {
              v6 += v15 + objc_msgSend(v12, "size");
            }
            result = (_QWORD *)objc_msgSend(v12, "scanType");
            if ((_DWORD)result == 1)
            {
              result = (_QWORD *)objc_msgSend(v12, "scannableSize");
              if (result >= *((_DWORD *)v2 + 4))
              {
                if (*((_DWORD *)v2 + 11) == 8
                  || (result = (_QWORD *)objc_msgSend(v12, "typeNameMayDescribeReferencedAllocation"), (_DWORD)result))
                {
                  v20 = objc_msgSend(v12, "offset");
                  result = (_QWORD *)objc_msgSend(v12, "size");
                  if (((_DWORD)result + v20) > *((_DWORD *)v2 + 7))
                    break;
                  result = (_QWORD *)(*(uint64_t (**)(uint64_t, void *, void *, uint64_t))(a2 + 16))(a2, v4, v12, v11);
                }
              }
            }
          }
          else
          {
            v6 += *((_DWORD *)v2 + 4);
          }
        }
        v3 = v22 + 1;
      }
      while (v22 + 1 < (unint64_t)*((unsigned int *)v2 + 5));
    }
  }
  return result;
}

- (void)enumerateScanningLocationsForSize:(unsigned int)a3 withBlock:(id)a4
{
  id v6;
  unsigned int superclassOffset;
  uint64_t v8;
  int v9;
  unsigned int instanceSize;
  unsigned int remotePointerSize;
  uint64_t v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned int defaultScanType;
  char v25;
  unsigned __int8 v26;
  char v27;
  id v28;
  int v29;
  signed int v30;
  int v31;

  v6 = a4;
  if (self->_remoteType != 32)
  {
    superclassOffset = self->_superclassOffset;
    if (superclassOffset >= a3)
      v8 = a3;
    else
      v8 = superclassOffset;
    -[VMUClassInfo enumerateScanningLocationsForSize:withBlock:](self->_superclassLayout, "enumerateScanningLocationsForSize:withBlock:", v8, v6);
    if (self->_ivarCount)
      v9 = objc_msgSend(*self->_localIvarList, "offset");
    else
      v9 = 0x7FFFFFFF;
    instanceSize = self->_instanceSize;
    v30 = instanceSize;
    if (instanceSize <= a3)
      instanceSize = a3;
    remotePointerSize = self->_remotePointerSize;
    v12 = (remotePointerSize + self->_superclassOffset - 1) & -remotePointerSize;
    v29 = instanceSize - remotePointerSize;
    if ((int)v12 <= (int)(instanceSize - remotePointerSize))
    {
      v13 = 0;
      v14 = 0;
      v28 = v6;
      while (1)
      {
        v15 = (void *)MEMORY[0x1A85A9758]();
        if ((int)v12 >= v9)
        {
          do
          {
            v16 = v14;
            v14 = self->_localIvarList[v13];

            v17 = objc_msgSend(v14, "offset");
            v18 = objc_msgSend(v14, "scannableSize");
            if (++v13 >= self->_ivarCount)
              v9 = 0x7FFFFFFF;
            else
              v9 = objc_msgSend(self->_localIvarList[v13], "offset");
          }
          while ((int)v12 >= v9);
          v30 = v18 + v17;
        }
        v19 = objc_msgSend(v14, "offset");
        v31 = 0;
        objc_msgSend(v14, "getLeafFieldAtOffset:leafOffset:", (v12 - v19), &v31);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30 < (signed int)(self->_remotePointerSize + v12)
          || v14
          && (v21 = objc_msgSend(v14, "offset"),
              v22 = v31,
              v23 = v22 + v21 + objc_msgSend(v20, "size"),
              v6 = v28,
              v23 < self->_remotePointerSize + (int)v12))
        {
          if ((int)v12 >= (signed int)self->_instanceSize)
          {
            defaultScanType = self->_defaultScanType;
            if (defaultScanType)
            {
              if (defaultScanType == 1)
                remotePointerSize = 1;
              (*((void (**)(id, _QWORD, uint64_t))v6 + 2))(v6, 0, v12);
              v25 = 0;
              v6 = v28;
            }
            else
            {
              v25 = 1;
            }
            goto LABEL_31;
          }
        }
        else
        {
          if (v20)
            v26 = objc_msgSend(v20, "scanType");
          else
            v26 = self->_defaultScanType;
          (*((void (**)(id, void *, uint64_t, _QWORD))v6 + 2))(v6, v20, v12, v26);
        }
        v25 = 0;
LABEL_31:

        objc_autoreleasePoolPop(v15);
        v12 = remotePointerSize + v12;
        if ((int)v12 > v29)
          v27 = 1;
        else
          v27 = v25;
        if ((v27 & 1) != 0)
        {

          break;
        }
      }
    }
  }

}

- (id)fieldAtOrBeforeOffset:(unsigned int)a3
{
  id v4;
  _QWORD v5[5];
  unsigned int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (self->_instanceSize < a3)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__VMUClassInfo_fieldAtOrBeforeOffset___block_invoke;
  v5[3] = &unk_1E4E02170;
  v6 = a3;
  v5[4] = &v7;
  -[VMUClassInfo enumerateAllFieldsWithBlock:](self, "enumerateAllFieldsWithBlock:", v5);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __38__VMUClassInfo_fieldAtOrBeforeOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unsigned int v7;
  unsigned int v8;
  id v9;

  v9 = a2;
  v7 = objc_msgSend(v9, "offset");
  v8 = *(_DWORD *)(a1 + 40);
  if (v7)
  {
    if (v7 <= v8)
    {
LABEL_3:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      goto LABEL_7;
    }
  }
  else if (!v8)
  {
    goto LABEL_3;
  }
  if (v7 > v8)
    *a4 = 1;
LABEL_7:

}

- (id)firstFieldWithName:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__VMUClassInfo_firstFieldWithName___block_invoke;
  v8[3] = &unk_1E4E02198;
  v9 = v4;
  v10 = &v11;
  v5 = v4;
  -[VMUClassInfo enumerateAllFieldsWithBlock:](self, "enumerateAllFieldsWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __35__VMUClassInfo_firstFieldWithName___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "ivarName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_adjustInstanceSize
{
  unsigned int ivarCount;
  int v4;
  unsigned int v5;
  id v6;

  ivarCount = self->_ivarCount;
  if (ivarCount)
  {
    v6 = self->_localIvarList[ivarCount - 1];
    v4 = objc_msgSend(v6, "offset");
    v5 = objc_msgSend(v6, "size") + v4;
    if (self->_instanceSize < v5)
      self->_instanceSize = v5;

  }
}

- (void)_addFields:(id)a3
{
  unsigned int v4;
  uint64_t ivarCount;
  id *v6;
  id *v7;
  id v8;
  _QWORD v9[5];
  int v10;

  v8 = a3;
  v4 = objc_msgSend(v8, "count");
  ivarCount = self->_ivarCount;
  v6 = (id *)malloc_type_realloc(self->_localIvarList, 8 * (ivarCount + v4), 0x80040B8603338uLL);
  v7 = v6;
  if (v6)
  {
    bzero(&v6[ivarCount], 8 * v4);
    self->_localIvarList = v7;
    self->_ivarCount += v4;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __27__VMUClassInfo__addFields___block_invoke;
    v9[3] = &unk_1E4E021C0;
    v9[4] = self;
    v10 = ivarCount;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
    -[VMUClassInfo _adjustInstanceSize](self, "_adjustInstanceSize");
  }
  else
  {
    self->_localIvarList = 0;
  }

}

void __27__VMUClassInfo__addFields___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 8 * (*(unsigned int *)(a1 + 40) + a3)), a2);
}

- (void)_replaceField:(id)a3 withFields:(id)a4
{
  id v6;
  uint64_t v7;
  unsigned int v8;
  id *localIvarList;
  unsigned int v10;
  uint64_t ivarCount;
  id *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  int v16;

  v14 = a3;
  v6 = a4;
  if (self->_ivarCount)
  {
    v7 = 0;
    while (!objc_msgSend(self->_localIvarList[v7], "isEqual:", v14))
    {
      if (++v7 >= (unint64_t)self->_ivarCount)
        goto LABEL_13;
    }
    v8 = objc_msgSend(v6, "count");
    localIvarList = self->_localIvarList;
    v10 = v8 - 1;
    if (v8 > 1)
    {
      ivarCount = self->_ivarCount;
      v12 = (id *)malloc_type_realloc(self->_localIvarList, 8 * (ivarCount + v10), 0x80040B8603338uLL);
      localIvarList = v12;
      if (!v12)
      {
        self->_localIvarList = 0;
        goto LABEL_13;
      }
      bzero(&v12[ivarCount], 8 * (v8 - 1));
      self->_localIvarList = localIvarList;
    }
    self->_ivarCount += v10;
    v13 = localIvarList[v7];
    localIvarList[v7] = 0;

    if (v8 != 1)
    {
      memmove(&self->_localIvarList[v8] + v7, &self->_localIvarList[v7 + 1], 8 * (self->_ivarCount - v8 - v7));
      if (v8)
        bzero(&self->_localIvarList[v7], 8 * v8);
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41__VMUClassInfo__replaceField_withFields___block_invoke;
    v15[3] = &unk_1E4E021C0;
    v15[4] = self;
    v16 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);
  }
LABEL_13:

}

void __41__VMUClassInfo__replaceField_withFields___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 8 * (*(unsigned int *)(a1 + 40) + a3)), a2);
}

- (void)_replaceFieldRecursively:(id)a3 atOffset:(unsigned int)a4 withField:(id)a5
{
  id v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  unsigned int v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  if (self->_ivarCount)
  {
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = self->_localIvarList[v9];
      v12 = objc_msgSend(v11, "offset");
      if (a4 - (unint64_t)v12 < objc_msgSend(v11, "size"))
        break;

      ++v10;
      ++v9;
      if (v10 >= self->_ivarCount)
        goto LABEL_12;
    }
    if (objc_msgSend(v11, "offset") == a4 && objc_msgSend(v11, "isEqual:", v14))
    {
      objc_storeStrong(&self->_localIvarList[v9], a5);
    }
    else
    {
      objc_msgSend(v11, "subFieldArray");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        objc_msgSend(v11, "replaceFieldRecursively:atOffset:withField:", v14, a4 - objc_msgSend(v11, "offset"), v8);
    }

  }
LABEL_12:

}

- (void)_setFields:(id)a3
{
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;
  id *localIvarList;
  id v8;
  id v9;

  v9 = a3;
  -[VMUClassInfo _freeLocalIvarList](self, "_freeLocalIvarList");
  v4 = objc_msgSend(v9, "count");
  self->_ivarCount = v4;
  if (v4)
  {
    self->_localIvarList = (id *)malloc_type_calloc(v4 + 1, 8uLL, 0x80040B8603338uLL);
    if (self->_ivarCount)
    {
      v5 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
        v6 = objc_claimAutoreleasedReturnValue();
        localIvarList = self->_localIvarList;
        v8 = localIvarList[v5];
        localIvarList[v5] = (id)v6;

        ++v5;
      }
      while (v5 < self->_ivarCount);
    }
  }
  -[VMUClassInfo _adjustInstanceSize](self, "_adjustInstanceSize");

}

- (void)_addVariantAction:(id)a3 withEvaluator:(id)a4
{
  id v6;
  NSMutableArray *variantEvaluators;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *variantActions;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  variantEvaluators = self->_variantEvaluators;
  if (!variantEvaluators)
  {
    v8 = (NSMutableArray *)objc_opt_new();
    v9 = self->_variantEvaluators;
    self->_variantEvaluators = v8;

    v10 = (NSMutableArray *)objc_opt_new();
    variantActions = self->_variantActions;
    self->_variantActions = v10;

    variantEvaluators = self->_variantEvaluators;
  }
  *(_WORD *)&self->_hasSpecificLayout = 257;
  v12 = (void *)MEMORY[0x1A85A995C](v6);
  -[NSMutableArray addObject:](variantEvaluators, "addObject:", v12);

  v13 = self->_variantActions;
  v14 = (void *)MEMORY[0x1A85A995C](v15);
  -[NSMutableArray addObject:](v13, "addObject:", v14);

}

- (void)_addComplexAction:(id)a3 withEvaluator:(id)a4
{
  id v6;
  NSMutableArray *complexVariantEvaluators;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *complexVariantActions;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  complexVariantEvaluators = self->_complexVariantEvaluators;
  if (!complexVariantEvaluators)
  {
    v8 = (NSMutableArray *)objc_opt_new();
    v9 = self->_complexVariantEvaluators;
    self->_complexVariantEvaluators = v8;

    v10 = (NSMutableArray *)objc_opt_new();
    complexVariantActions = self->_complexVariantActions;
    self->_complexVariantActions = v10;

    complexVariantEvaluators = self->_complexVariantEvaluators;
  }
  *(_WORD *)&self->_hasSpecificLayout = 257;
  v12 = (void *)MEMORY[0x1A85A995C](v6);
  -[NSMutableArray addObject:](complexVariantEvaluators, "addObject:", v12);

  v13 = self->_complexVariantActions;
  v14 = (void *)MEMORY[0x1A85A995C](v15);
  -[NSMutableArray addObject:](v13, "addObject:", v14);

}

+ (id)descriptionForTypeEncoding:(const char *)a3 ivarName:(const char *)a4
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  descriptionForTypeEncoding((unsigned __int8 *)a3, (uint64_t)a4);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_1E4E04720;
  v6 = v4;

  return v6;
}

- (void)_setIsa:(unint64_t)a3
{
  self->_remoteIsa = a3;
}

- (NSString)binaryName
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[NSString lastPathComponent](self->_remoteBinaryPath, "lastPathComponent");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("<unknown>");
  v4 = v2;

  return v4;
}

- (NSString)typeName
{
  signed int remoteType;
  NSString *result;

  remoteType = self->_remoteType;
  if (remoteType > 15)
  {
    if (remoteType > 63)
    {
      if (remoteType != 64)
      {
        if (remoteType == 128)
          return (NSString *)CFSTR("OSObj");
        return (NSString *)CFSTR("<unknown>");
      }
    }
    else
    {
      if (remoteType == 16)
        return (NSString *)CFSTR("C");
      if (remoteType != 32)
        return (NSString *)CFSTR("<unknown>");
    }
    return (NSString *)CFSTR("Swift");
  }
  result = (NSString *)CFSTR("ObjC");
  switch(remoteType)
  {
    case 0:
      result = (NSString *)&stru_1E4E04720;
      break;
    case 1:
      return result;
    case 2:
      result = (NSString *)CFSTR("C++");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return (NSString *)CFSTR("<unknown>");
    case 4:
      result = (NSString *)CFSTR("CFType");
      break;
    case 8:
      return (NSString *)CFSTR("Swift");
    default:
      if (remoteType != 0x80000000)
        return (NSString *)CFSTR("<unknown>");
      break;
  }
  return result;
}

- (unsigned)infoType
{
  return self->_remoteType;
}

- (NSString)fullIvarDescription
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__VMUClassInfo_fullIvarDescription__block_invoke;
  v6[3] = &unk_1E4E021E8;
  v4 = v3;
  v7 = v4;
  -[VMUClassInfo _logDescriptionWithSuperclasses:indentation:toLogger:](self, "_logDescriptionWithSuperclasses:indentation:toLogger:", 1, 0, v6);

  return (NSString *)v4;
}

uint64_t __35__VMUClassInfo_fullIvarDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@\n"), a2);
}

- (NSString)shortIvarDescription
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__VMUClassInfo_shortIvarDescription__block_invoke;
  v6[3] = &unk_1E4E021E8;
  v4 = v3;
  v7 = v4;
  -[VMUClassInfo _logDescriptionWithSuperclasses:indentation:toLogger:](self, "_logDescriptionWithSuperclasses:indentation:toLogger:", 0, 0, v6);

  return (NSString *)v4;
}

uint64_t __36__VMUClassInfo_shortIvarDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@\n"), a2);
}

- (id)scanDescriptionWithSize:(unsigned int)a3
{
  void *v5;
  id v6;
  uint64_t *v7;
  unsigned int superclassOffset;
  unsigned int remotePointerSize;
  unsigned int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  const char *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __40__VMUClassInfo_scanDescriptionWithSize___block_invoke;
  v19 = &unk_1E4E02198;
  v6 = v5;
  v20 = v6;
  v21 = &v22;
  -[VMUClassInfo enumerateAllFieldsWithBlock:](self, "enumerateAllFieldsWithBlock:", &v16);
  v7 = v23;
  superclassOffset = *((_DWORD *)v23 + 6);
  if (superclassOffset <= self->_superclassOffset)
    superclassOffset = self->_superclassOffset;
  *((_DWORD *)v23 + 6) = superclassOffset;
  remotePointerSize = self->_remotePointerSize;
  v10 = remotePointerSize - 1;
  v11 = -remotePointerSize;
  *((_DWORD *)v7 + 6) = (v10 + superclassOffset) & v11;
  v12 = (self->_instanceSize + v10) & v11;
  *((_DWORD *)v7 + 6) = v12;
  if (v12 + 8 <= a3)
  {
    if (objc_msgSend(v6, "length"))
      objc_msgSend(v6, "appendString:", CFSTR("\n"));
    v13 = *((unsigned int *)v23 + 6);
    v14 = VMUScanTypeScanDescription(self->_defaultScanType);
    objc_msgSend(v6, "appendFormat:", CFSTR("%+*d: <extra space>[%u] (%s)"), 3, v13, a3 - v13, v14, v16, v17, v18, v19);
  }

  _Block_object_dispose(&v22, 8);
  return v6;
}

void __40__VMUClassInfo_scanDescriptionWithSize___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  VMUFieldInfo *v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  v3 = *(void **)(a1 + 32);
  _formatIvar(v5, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  LODWORD(v4) = -[VMUFieldInfo offset](v5, "offset");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[VMUFieldInfo size](v5, "size") + (_DWORD)v4;

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VMUClassInfo;
  -[VMUClassInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUClassInfo fullIvarDescription](self, "fullIvarDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@  %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_displayName)
  {
    -[VMUClassInfo displayName](self, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUClassInfo className](self, "className");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUClassInfo type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUClassInfo binaryName](self, "binaryName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)  %@  %@"), v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VMUClassInfo className](self, "className");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUClassInfo type](self, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUClassInfo binaryName](self, "binaryName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@  %@  %@"), v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v9 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)VMUClassInfo;
  -[VMUClassInfo description](&v13, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@  %@"), v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isARR
{
  return LOBYTE(self->_ro_flags) >> 7;
}

- (BOOL)isRealized
{
  return self->_rw_flags >> 31;
}

- (BOOL)isMetaClass
{
  return self->_ro_flags & 1;
}

- (BOOL)isRootClass
{
  return (LOBYTE(self->_ro_flags) >> 1) & 1;
}

- (BOOL)hasCppConstructorOrDestructor
{
  return (LOBYTE(self->_ro_flags) >> 2) & 1;
}

+ (unint64_t)sizeofClassStructure
{
  return 40;
}

- (unsigned)instanceSize
{
  return self->_instanceSize;
}

- (unint64_t)remoteIsa
{
  return self->_remoteIsa;
}

- (NSString)binaryPath
{
  return self->_remoteBinaryPath;
}

- (NSString)className
{
  return self->_remoteClassName;
}

- (VMUClassInfo)superclassInfo
{
  return self->_superclassLayout;
}

- (unsigned)pointerSize
{
  return self->_remotePointerSize;
}

- (BOOL)usesSwiftRefcounting
{
  return self->_usesSwiftRefcounting;
}

- (unsigned)ivarCount
{
  return self->_ivarCount;
}

- (unsigned)superclassOffset
{
  return self->_superclassOffset;
}

- (BOOL)isCoreMediaFigObject
{
  return self->_isCoreMediaFigObject;
}

- (BOOL)isDerivedFromStackBacktrace
{
  return self->_isDerivedFromStackBacktrace;
}

- (void)setIsDerivedFromStackBacktrace:(BOOL)a3
{
  self->_isDerivedFromStackBacktrace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complexVariantActions, 0);
  objc_storeStrong((id *)&self->_complexVariantEvaluators, 0);
  objc_storeStrong((id *)&self->_variantActions, 0);
  objc_storeStrong((id *)&self->_variantEvaluators, 0);
  objc_storeStrong((id *)&self->_genericLayout, 0);
  objc_storeStrong((id *)&self->_superclassLayout, 0);
  objc_storeStrong((id *)&self->_remoteBinaryPath, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_remoteClassName, 0);
}

@end
