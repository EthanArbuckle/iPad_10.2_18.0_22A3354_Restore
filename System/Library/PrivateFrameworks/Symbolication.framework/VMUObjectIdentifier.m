@implementation VMUObjectIdentifier

- (unsigned)task
{
  return -[VMUTask taskPort](self->_task, "taskPort");
}

- (id)vmuTask
{
  return self->_task;
}

- (VMUObjectIdentifier)initWithTask:(unsigned int)a3 symbolicator:(_CSTypeRef)a4
{
  return -[VMUObjectIdentifier initWithTask:symbolicator:scanner:](self, "initWithTask:symbolicator:scanner:", *(_QWORD *)&a3, a4._opaque_1, a4._opaque_2, 0);
}

- (VMUObjectIdentifier)initWithVMUTask:(id)a3 symbolicator:(_CSTypeRef)a4 scanner:(id)a5
{
  id v8;
  id v9;
  VMUObjectIdentifier *v10;
  void *v11;
  id *p_task;
  void *v13;
  unsigned int FlagsForNListOnlyData;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t SymbolOwner;
  unint64_t v19;
  VMUClassInfoMap *v20;
  VMUClassInfoMap *realizedIsaToClassInfo;
  uint64_t v22;
  VMUClassInfoMap *cfTypeIDToClassInfo;
  uint64_t v24;
  VMUClassInfoMap *coreMediaFigBaseClassToClassInfo;
  uint64_t v26;
  NSHashTable *nonObjectIsaHash;
  uint64_t v28;
  NSMutableDictionary *pidToProcessNameDict;
  uint64_t v30;
  NSMutableDictionary *moduleNameToBinaryPathDict;
  uint64_t v32;
  NSMapTable *itemCountToLabelStringUniquingMap;
  uint64_t v34;
  id *labelStringUniquingMaps;
  id v36;
  NSMutableSet *v37;
  NSMutableSet *stringUniquingSet;
  void *v39;
  VMUObjectIdentifier *v40;
  uint64_t v41;
  id memoryReader;
  uint64_t v43;
  void *v44;
  char v45;
  char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (**v50)(id, _QWORD, uint64_t);
  unsigned int *v51;
  unsigned int v52;
  NSObject *v53;
  uint64_t v54;
  os_signpost_id_t v55;
  NSObject *v56;
  uint64_t v57;
  os_signpost_id_t v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  os_signpost_id_t v63;
  NSObject *v64;
  uint64_t v65;
  os_signpost_id_t v66;
  NSObject *v67;
  uint64_t v68;
  os_signpost_id_t v69;
  NSObject *v70;
  uint64_t v71;
  os_signpost_id_t v72;
  VMUObjectIdentifierDriverKitSupport *v73;
  VMUObjectIdentifierDriverKitSupport *driverKitSupport;
  NSObject *v75;
  uint64_t v76;
  os_signpost_id_t v77;
  __int16 v79;
  _QWORD v80[4];
  VMUObjectIdentifier *v81;
  objc_super v82;

  v8 = a3;
  v9 = a5;
  v82.receiver = self;
  v82.super_class = (Class)VMUObjectIdentifier;
  v10 = -[VMUObjectIdentifier init](&v82, sel_init);
  if (v10)
  {
    +[VMUDebugTimer sharedTimerIfCreated](VMUDebugTimer, "sharedTimerIfCreated");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    p_task = (id *)&v10->_task;
    objc_storeStrong((id *)&v10->_task, a3);
    -[VMUTask memoryCache](v10->_task, "memoryCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_taskIsDriverKit = objc_msgSend(v13, "isDriverKit");

    objc_storeWeak((id *)&v10->_scanner, v9);
    if (CSIsNull())
    {
      FlagsForNListOnlyData = CSSymbolicatorGetFlagsForNListOnlyData();
      if (objc_msgSend(v8, "isExclave"))
        v15 = 0;
      else
        v15 = FlagsForNListOnlyData;
      v16 = objc_msgSend(*p_task, "createSymbolicatorWithFlags:andNotification:", v15, 0);
    }
    else
    {
      v16 = CSRetain();
    }
    v10->_symbolicator._opaque_1 = v16;
    v10->_symbolicator._opaque_2 = v17;
    if (objc_msgSend(v8, "isExclaveCore"))
      SymbolOwner = CSSymbolicatorGetSymbolOwner();
    else
      SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    v10->_libobjcSymbolOwner._opaque_1 = SymbolOwner;
    v10->_libobjcSymbolOwner._opaque_2 = v19;
    v20 = objc_alloc_init(VMUClassInfoMap);
    realizedIsaToClassInfo = v10->_realizedIsaToClassInfo;
    v10->_realizedIsaToClassInfo = v20;

    v22 = objc_opt_new();
    cfTypeIDToClassInfo = v10->_cfTypeIDToClassInfo;
    v10->_cfTypeIDToClassInfo = (VMUClassInfoMap *)v22;

    v24 = objc_opt_new();
    coreMediaFigBaseClassToClassInfo = v10->_coreMediaFigBaseClassToClassInfo;
    v10->_coreMediaFigBaseClassToClassInfo = (VMUClassInfoMap *)v24;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 1282);
    v26 = objc_claimAutoreleasedReturnValue();
    nonObjectIsaHash = v10->_nonObjectIsaHash;
    v10->_nonObjectIsaHash = (NSHashTable *)v26;

    v28 = objc_opt_new();
    pidToProcessNameDict = v10->_pidToProcessNameDict;
    v10->_pidToProcessNameDict = (NSMutableDictionary *)v28;

    v30 = objc_opt_new();
    moduleNameToBinaryPathDict = v10->_moduleNameToBinaryPathDict;
    v10->_moduleNameToBinaryPathDict = (NSMutableDictionary *)v30;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    itemCountToLabelStringUniquingMap = v10->_itemCountToLabelStringUniquingMap;
    v10->_itemCountToLabelStringUniquingMap = (NSMapTable *)v32;

    v10->_labelStringUniquingMaps = (id *)malloc_type_calloc(0x200uLL, 8uLL, 0x80040B8603338uLL);
    v34 = objc_opt_new();
    labelStringUniquingMaps = v10->_labelStringUniquingMaps;
    v36 = labelStringUniquingMaps[1];
    labelStringUniquingMaps[1] = (id)v34;

    v10->_stringTypeDescriptions = (id *)malloc_type_calloc(0x200uLL, 8uLL, 0x80040B8603338uLL);
    v37 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    stringUniquingSet = v10->_stringUniquingSet;
    v10->_stringUniquingSet = v37;

    objc_msgSend(v9, "memoryCache");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39 || (objc_msgSend(*p_task, "memoryCache"), (v39 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __60__VMUObjectIdentifier_initWithVMUTask_symbolicator_scanner___block_invoke;
      v80[3] = &unk_1E4E024D8;
      v40 = v39;
      v81 = v40;
      v41 = MEMORY[0x1A85A995C](v80);
      memoryReader = v10->_memoryReader;
      v10->_memoryReader = (id)v41;

      v10->_targetProcessContainsMallocStackLoggingLiteZone = 0;
      if (objc_msgSend(v9, "zoneCount"))
      {
        v43 = 0;
        do
        {
          objc_msgSend(v9, "zoneNameForIndex:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v44, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone")))
          {
            v45 = objc_msgSend(v44, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone_Wrapper"));

            if ((v45 & 1) == 0)
            {
              v10->_targetProcessContainsMallocStackLoggingLiteZone = 1;
              break;
            }
          }
          else
          {

          }
          v43 = (v43 + 1);
        }
        while (v43 < objc_msgSend(v9, "zoneCount"));
      }
      v10->_autoreleasePoolPageLayout = -[VMUObjectIdentifier createAutoreleasePoolPageLayout](v10, "createAutoreleasePoolPageLayout");
      v10->_debugSwiftRemoteMirror = 0;
      v46 = getenv("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR");
      if (v46)
      {
        v47 = v46;
        if (!strcmp(v46, "YES") || !strcmp(v47, "1"))
          v10->_debugSwiftRemoteMirror = 1;
      }
      v10->_swiftMirror = (libSwiftRemoteMirrorWrapper *)malloc_type_calloc(1uLL, 0x18uLL, 0x102004024DAA5DEuLL);
      v48 = -[VMUObjectIdentifier addressOfSymbol:inLibrary:](v10, "addressOfSymbol:inLibrary:", "_objc_class_abi_version", "libobjc.A.dylib");
      if (v48)
      {
        v49 = v48;
        v50 = (uint64_t (**)(id, _QWORD, uint64_t))v10->_memoryReader;
        v51 = (unsigned int *)v50[2](v50, v49, 4);
        if (v51)
          v52 = *v51;
        else
          v52 = 0;

        v10->_objcABI = v52;
      }
      if (v11)
      {
        if (objc_msgSend(v11, "signpostID"))
        {
          objc_msgSend(v11, "logHandle");
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v11, "signpostID");
          if ((unint64_t)(v54 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v55 = v54;
            if (os_signpost_enabled(v53))
            {
              v79 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A4D79000, v53, OS_SIGNPOST_INTERVAL_END, v55, "initObjectIdentifier", ", (uint8_t *)&v79, 2u);
            }
          }

        }
        objc_msgSend(v11, "endEvent:", "initObjectIdentifier");
        objc_msgSend(v11, "startWithCategory:message:", "initObjectIdentifier", "loadSwiftReflectionLibraries");
        objc_msgSend(v11, "logHandle");
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v11, "signpostID");
        if ((unint64_t)(v57 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v58 = v57;
          if (os_signpost_enabled(v56))
          {
            v79 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v56, OS_SIGNPOST_INTERVAL_BEGIN, v58, "initObjectIdentifier", "loadSwiftReflectionLibraries", (uint8_t *)&v79, 2u);
          }
        }

      }
      else
      {
        objc_msgSend(0, "endEvent:", "initObjectIdentifier");
        v59 = objc_msgSend(0, "startWithCategory:message:", "initObjectIdentifier", "loadSwiftReflectionLibraries");
      }
      v60 = (void *)MEMORY[0x1A85A9758](v59);
      -[VMUObjectIdentifier loadSwiftReflectionLibraries](v10, "loadSwiftReflectionLibraries");
      objc_autoreleasePoolPop(v60);
      -[VMUObjectIdentifier _populateSwiftABIVariables](v10, "_populateSwiftABIVariables");
      if (v11)
      {
        if (objc_msgSend(v11, "signpostID"))
        {
          objc_msgSend(v11, "logHandle");
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v11, "signpostID");
          if ((unint64_t)(v62 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v63 = v62;
            if (os_signpost_enabled(v61))
            {
              v79 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A4D79000, v61, OS_SIGNPOST_INTERVAL_END, v63, "initObjectIdentifier", ", (uint8_t *)&v79, 2u);
            }
          }

        }
        objc_msgSend(v11, "endEvent:", "initObjectIdentifier");
        objc_msgSend(v11, "startWithCategory:message:", "initObjectIdentifier", "findCFTypes");
        objc_msgSend(v11, "logHandle");
        v64 = objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v11, "signpostID");
        if ((unint64_t)(v65 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v66 = v65;
          if (os_signpost_enabled(v64))
          {
            v79 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v64, OS_SIGNPOST_INTERVAL_BEGIN, v66, "initObjectIdentifier", "findCFTypes", (uint8_t *)&v79, 2u);
          }
        }

      }
      else
      {
        objc_msgSend(0, "endEvent:", "initObjectIdentifier");
        objc_msgSend(0, "startWithCategory:message:", "initObjectIdentifier", "findCFTypes");
      }
      v10->_figBaseObjectFinalizeAddress = -[VMUObjectIdentifier addressOfSymbol:inLibrary:](v10, "addressOfSymbol:inLibrary:", "_FigBaseObjectFinalize", "CoreMedia");
      -[VMUObjectIdentifier findCFTypes](v10, "findCFTypes");
      if (v11)
      {
        if (objc_msgSend(v11, "signpostID"))
        {
          objc_msgSend(v11, "logHandle");
          v67 = objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v11, "signpostID");
          if ((unint64_t)(v68 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v69 = v68;
            if (os_signpost_enabled(v67))
            {
              v79 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A4D79000, v67, OS_SIGNPOST_INTERVAL_END, v69, "initObjectIdentifier", ", (uint8_t *)&v79, 2u);
            }
          }

        }
        objc_msgSend(v11, "endEvent:", "initObjectIdentifier");
        objc_msgSend(v11, "startWithCategory:message:", "initObjectIdentifier", "findObjCAndSwiftClasses");
        objc_msgSend(v11, "logHandle");
        v70 = objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v11, "signpostID");
        if ((unint64_t)(v71 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v72 = v71;
          if (os_signpost_enabled(v70))
          {
            v79 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v70, OS_SIGNPOST_INTERVAL_BEGIN, v72, "initObjectIdentifier", "findObjCAndSwiftClasses", (uint8_t *)&v79, 2u);
          }
        }

      }
      else
      {
        objc_msgSend(0, "endEvent:", "initObjectIdentifier");
        objc_msgSend(0, "startWithCategory:message:", "initObjectIdentifier", "findObjCAndSwiftClasses");
      }
      -[VMUObjectIdentifier setupIsaTranslator](v10, "setupIsaTranslator");
      -[VMUObjectIdentifier findObjCAndSwiftClasses](v10, "findObjCAndSwiftClasses");
      -[VMUObjectIdentifier findFutureClasses](v10, "findFutureClasses");
      v10->_cfBooleanTrueAddress = -[VMUObjectIdentifier addressOfSymbol:inLibrary:](v10, "addressOfSymbol:inLibrary:", "___kCFBooleanTrue", "CoreFoundation");
      v10->_cfBooleanFalseAddress = -[VMUObjectIdentifier addressOfSymbol:inLibrary:](v10, "addressOfSymbol:inLibrary:", "___kCFBooleanFalse", "CoreFoundation");
      if (v10->_taskIsDriverKit)
      {
        v73 = -[VMUObjectIdentifierDriverKitSupport initWithObjectIdentifier:]([VMUObjectIdentifierDriverKitSupport alloc], "initWithObjectIdentifier:", v10);
        driverKitSupport = v10->_driverKitSupport;
        v10->_driverKitSupport = v73;

      }
      v10->_objectContentLevel = 1;
      if (v11 && objc_msgSend(v11, "signpostID"))
      {
        objc_msgSend(v11, "logHandle");
        v75 = objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v11, "signpostID");
        if ((unint64_t)(v76 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v77 = v76;
          if (os_signpost_enabled(v75))
          {
            v79 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A4D79000, v75, OS_SIGNPOST_INTERVAL_END, v77, "initObjectIdentifier", ", (uint8_t *)&v79, 2u);
          }
        }

      }
      objc_msgSend(v11, "endEvent:", "initObjectIdentifier");

    }
    else
    {
      v40 = v10;
      v10 = 0;
    }

  }
  return v10;
}

uint64_t __60__VMUObjectIdentifier_initWithVMUTask_symbolicator_scanner___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "peekAtAddress:size:returnsBuf:", a2, a3, &v4))
    return 0;
  else
    return v4;
}

- (VMUObjectIdentifier)initWithTask:(unsigned int)a3 symbolicator:(_CSTypeRef)a4 scanner:(id)a5
{
  unint64_t opaque_2;
  unint64_t opaque_1;
  uint64_t v7;
  id v9;
  VMUTask *v10;
  VMUObjectIdentifier *v11;

  opaque_2 = a4._opaque_2;
  opaque_1 = a4._opaque_1;
  v7 = *(_QWORD *)&a3;
  v9 = a5;
  v10 = -[VMUTask initWithTask:]([VMUTask alloc], "initWithTask:", v7);
  v11 = -[VMUObjectIdentifier initWithVMUTask:symbolicator:scanner:](self, "initWithVMUTask:symbolicator:scanner:", v10, opaque_1, opaque_2, v9);

  return v11;
}

- (void)dealloc
{
  NSMutableDictionary *libSwiftRemoteMirrors;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  uint64_t i;
  id *objCClassStructureClassInfos;
  id v12;
  unsigned int *objCClassStructureClassInfoIndexes;
  uint64_t j;
  id *labelStringUniquingMaps;
  id v16;
  id *stringTypeDescriptions;
  id v18;
  id *v19;
  id *v20;
  VMUAutoreleasePoolPageLayout *autoreleasePoolPageLayout;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[VMUObjectIdentifier destroy_libSwiftRemoteMirror](self, "destroy_libSwiftRemoteMirror");
  libSwiftRemoteMirrors = self->_libSwiftRemoteMirrors;
  if (libSwiftRemoteMirrors)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[NSMutableDictionary allValues](libSwiftRemoteMirrors, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v24;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(v4);
          dlclose((void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v8++), "pointerValue"));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v6);
    }

    v9 = self->_libSwiftRemoteMirrors;
  }
  else
  {
    v9 = 0;
  }
  self->_libSwiftRemoteMirrors = 0;

  CSRelease();
  self->_symbolicator._opaque_1 = 0;
  self->_symbolicator._opaque_2 = 0;
  if (self->_objCClassStructureClassInfos)
  {
    for (i = 0; i != 13; ++i)
    {
      objCClassStructureClassInfos = self->_objCClassStructureClassInfos;
      v12 = objCClassStructureClassInfos[i];
      objCClassStructureClassInfos[i] = 0;

    }
    free(self->_objCClassStructureClassInfos);
    self->_objCClassStructureClassInfos = 0;
  }
  objCClassStructureClassInfoIndexes = self->_objCClassStructureClassInfoIndexes;
  if (objCClassStructureClassInfoIndexes)
  {
    free(objCClassStructureClassInfoIndexes);
    self->_objCClassStructureClassInfoIndexes = 0;
  }
  for (j = 0; j != 512; ++j)
  {
    labelStringUniquingMaps = self->_labelStringUniquingMaps;
    if (labelStringUniquingMaps)
    {
      v16 = labelStringUniquingMaps[j];
      labelStringUniquingMaps[j] = 0;

    }
    stringTypeDescriptions = self->_stringTypeDescriptions;
    if (stringTypeDescriptions)
    {
      v18 = stringTypeDescriptions[j];
      stringTypeDescriptions[j] = 0;

    }
  }
  v19 = self->_labelStringUniquingMaps;
  if (v19)
  {
    free(v19);
    self->_labelStringUniquingMaps = 0;
  }
  v20 = self->_stringTypeDescriptions;
  if (v20)
  {
    free(v20);
    self->_stringTypeDescriptions = 0;
  }
  autoreleasePoolPageLayout = self->_autoreleasePoolPageLayout;
  if (autoreleasePoolPageLayout)
    free(autoreleasePoolPageLayout);
  v22.receiver = self;
  v22.super_class = (Class)VMUObjectIdentifier;
  -[VMUObjectIdentifier dealloc](&v22, sel_dealloc);
}

- (void)flushRemoteMirrorMemoryCache
{
  NSMapTable *remoteAddressToLocalAddressAndSizeMap;

  remoteAddressToLocalAddressAndSizeMap = self->_swiftMirrorReaderContext.remoteAddressToLocalAddressAndSizeMap;
  if (remoteAddressToLocalAddressAndSizeMap)
  {
    NSResetMapTable(remoteAddressToLocalAddressAndSizeMap);
    NSResetMapTable(self->_swiftMirrorReaderContext.remoteStringToLengthMap);
  }
}

- (void)flushRemoteMirrorMemoryCacheEntryForAddress:(unint64_t)a3
{
  NSMapRemove(self->_swiftMirrorReaderContext.remoteAddressToLocalAddressAndSizeMap, (const void *)a3);
  NSMapRemove(self->_swiftMirrorReaderContext.remoteStringToLengthMap, (const void *)a3);
}

- (unint64_t)CFTypeCount
{
  return self->_cfClassCount;
}

- (unint64_t)ObjCclassCount
{
  return self->_objCClassCount;
}

- (unint64_t)SwiftClassCount
{
  return self->_swiftClassCount;
}

- (void)enumerateRealizedClassInfosWithBlock:(id)a3
{
  id v4;
  VMUClassInfoMap *realizedIsaToClassInfo;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    realizedIsaToClassInfo = self->_realizedIsaToClassInfo;
    v7[1] = 3221225472;
    v7[2] = __60__VMUObjectIdentifier_enumerateRealizedClassInfosWithBlock___block_invoke;
    v7[3] = &unk_1E4E029F8;
    v6 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    -[VMUClassInfoMap enumerateInfosWithBlock:](realizedIsaToClassInfo, "enumerateInfosWithBlock:", v7);

    v4 = v6;
  }

}

uint64_t __60__VMUObjectIdentifier_enumerateRealizedClassInfosWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateAllClassInfosWithBlock:(id)a3
{
  VMUClassInfoMap *v4;
  VMUClassInfoMap *unrealizedClassInfos;
  void *v6;
  VMUClassInfoMap *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a3;
  if (!self->_unrealizedClassInfos)
  {
    v4 = objc_alloc_init(VMUClassInfoMap);
    unrealizedClassInfos = self->_unrealizedClassInfos;
    self->_unrealizedClassInfos = v4;

    -[VMUObjectIdentifier findObjCAndSwiftClasses](self, "findObjCAndSwiftClasses");
  }
  -[VMUObjectIdentifier enumerateRealizedClassInfosWithBlock:](self, "enumerateRealizedClassInfosWithBlock:", v8, v8);
  v6 = v9;
  if (v9)
  {
    v7 = self->_unrealizedClassInfos;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__VMUObjectIdentifier_enumerateAllClassInfosWithBlock___block_invoke;
    v10[3] = &unk_1E4E029F8;
    v11 = v9;
    -[VMUClassInfoMap enumerateInfosWithBlock:](v7, "enumerateInfosWithBlock:", v10);

    v6 = v9;
  }

}

uint64_t __55__VMUObjectIdentifier_enumerateAllClassInfosWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)classInfoForObjectWithRange:(_VMURange)a3
{
  void *v4;
  unint64_t location;

  v4 = 0;
  if (HIDWORD(a3.location))
  {
    location = a3.location;
    if ((a3.location & 7) == 0)
    {
      if (a3.length >= 0x10)
        a3.location = 16;
      else
        a3.location = a3.length;
      -[VMUObjectIdentifier classInfoForMemory:length:remoteAddress:](self, "classInfoForMemory:length:remoteAddress:", (*((uint64_t (**)(id, unint64_t, unint64_t))self->_memoryReader + 2))(self->_memoryReader, location, a3.location), a3.length, location);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (BOOL)_isValidInstanceLength:(unint64_t)a3 expectedLength:(unint64_t)a4
{
  if (((a4 + 15) & 0xFFFFFFFFFFFFFFF0) == a3)
    return 1;
  return self->_targetProcessContainsMallocStackLoggingLiteZone && ((a4 + 23) & 0xFFFFFFFFFFFFFFF0) == a3;
}

- (id)classInfoWithNonobjectType:(id)a3 binaryPath:(id)a4
{
  return -[VMUObjectIdentifier classInfoWithNonobjectType:binaryPath:returnedClassInfoIndex:](self, "classInfoWithNonobjectType:binaryPath:returnedClassInfoIndex:", a3, a4, 0);
}

- (id)classInfoWithNonobjectType:(id)a3 binaryPath:(id)a4 returnedClassInfoIndex:(unsigned int *)a5
{
  id v8;
  id v9;
  NSMutableDictionary *nonobjectClassInfosDict;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  unsigned int v14;

  v8 = a3;
  v9 = a4;
  nonobjectClassInfosDict = self->_nonobjectClassInfosDict;
  if (!nonobjectClassInfosDict)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = self->_nonobjectClassInfosDict;
    self->_nonobjectClassInfosDict = v11;

    nonobjectClassInfosDict = self->_nonobjectClassInfosDict;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](nonobjectClassInfosDict, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", v8, v9, 16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nonobjectClassInfosDict, "setObject:forKeyedSubscript:", v13, v8);
    v14 = -[VMUClassInfoMap addClassInfo:forAddress:](self->_realizedIsaToClassInfo, "addClassInfo:forAddress:", v13, 0);
    if (a5)
      *a5 = v14;
  }

  return v13;
}

- (id)_classInfoWithPthreadType:(id)a3
{
  return -[VMUObjectIdentifier classInfoWithNonobjectType:binaryPath:](self, "classInfoWithNonobjectType:binaryPath:", a3, CFSTR("/usr/lib/libpthread.dylib"));
}

- (void)_generateClassInfosForObjCClassStructurePointerTypes
{
  uint64_t v3;
  char **v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id *objCClassStructureClassInfos;
  id v9;
  id v10;
  unsigned int v11;

  self->_objCClassStructureClassInfos = (id *)malloc_type_calloc(0xDuLL, 8uLL, 0x80040B8603338uLL);
  v3 = 0;
  self->_objCClassStructureClassInfoIndexes = (unsigned int *)malloc_type_calloc(0xDuLL, 4uLL, 0x100004052888210uLL);
  v4 = &off_1EE78B220;
  do
  {
    if (*v4)
    {
      if (*((_DWORD *)v4 - 2) == 12)
        v5 = CFSTR("/usr/lib/swift/libswiftCore.dylib");
      else
        v5 = CFSTR("/usr/lib/libobjc.A.dylib");
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VMUObjectIdentifier classInfoWithNonobjectType:binaryPath:returnedClassInfoIndex:](self, "classInfoWithNonobjectType:binaryPath:returnedClassInfoIndex:", v6, v5, &v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objCClassStructureClassInfos = self->_objCClassStructureClassInfos;
      v9 = objCClassStructureClassInfos[v3];
      objCClassStructureClassInfos[v3] = v7;
      v10 = v7;

      self->_objCClassStructureClassInfoIndexes[v3] = v11;
    }
    ++v3;
    v4 += 3;
  }
  while (v3 != 13);
}

- (unsigned)classInfoIndexForObjCClassStructurePointerType:(unsigned int)a3
{
  return self->_objCClassStructureClassInfoIndexes[a3];
}

- (id)classInfoForObjCClassStructurePointerType:(unsigned int)a3
{
  return self->_objCClassStructureClassInfos[a3];
}

- (id)classInfoForNonobjectMemory:(void *)a3 length:(unint64_t)a4
{
  int v6;
  void *v8;
  const __CFString *v9;

  v6 = *(_DWORD *)a3;
  if (a4 >= 0x100
    && (v6 == -1583242847 && !strncmp((const char *)a3 + 4, "AUTORELEASE!", 0xCuLL)
     || a4 == 10240 && *((_DWORD *)a3 + 512) == -1583242847 && !strncmp((const char *)a3 + 2052, "AUTORELEASE!", 0xCuLL)))
  {
    -[VMUObjectIdentifier classInfoWithNonobjectType:binaryPath:](self, "classInfoWithNonobjectType:binaryPath:", CFSTR("@autoreleasepool content"), CFSTR("/usr/lib/libobjc.A.dylib"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
    if (v6 <= 1330529092)
    {
      if (v6 <= 1297373248)
      {
        if (v6 == 1129202753)
        {
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:](self, "_isValidInstanceLength:expectedLength:", a4, 16))
          {
            v9 = CFSTR("pthread_condattr_t");
            goto LABEL_42;
          }
          goto LABEL_43;
        }
        if (v6 == 1129270852)
        {
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:](self, "_isValidInstanceLength:expectedLength:", a4, 48))
          {
            v9 = CFSTR("pthread_cond_t");
            goto LABEL_42;
          }
          goto LABEL_43;
        }
      }
      else
      {
        if (v6 == 1297373249)
        {
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:](self, "_isValidInstanceLength:expectedLength:", a4, 16))
          {
            v9 = CFSTR("pthread_mutexattr_t");
            goto LABEL_42;
          }
          goto LABEL_43;
        }
        if (v6 == 1297437784 || v6 == 1297437786)
        {
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:](self, "_isValidInstanceLength:expectedLength:", a4, 64))
          {
            v9 = CFSTR("pthread_mutex_t");
            goto LABEL_42;
          }
LABEL_43:
          v8 = 0;
        }
      }
    }
    else if (v6 > 1414022208)
    {
      switch(v6)
      {
        case 1414022209:
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:](self, "_isValidInstanceLength:expectedLength:", a4, 64))
          {
            v9 = CFSTR("pthread_attr_t");
            goto LABEL_42;
          }
          goto LABEL_43;
        case 1414025796:
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:](self, "_isValidInstanceLength:expectedLength:", a4, 8))
          {
            v9 = CFSTR("pthread_t");
            goto LABEL_42;
          }
          goto LABEL_43;
        case 1870030194:
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:](self, "_isValidInstanceLength:expectedLength:", a4, 40))
          {
            v9 = CFSTR("pthread_override_s");
            goto LABEL_42;
          }
          goto LABEL_43;
      }
    }
    else
    {
      switch(v6)
      {
        case 1330529093:
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:](self, "_isValidInstanceLength:expectedLength:", a4, 16))
          {
            v9 = CFSTR("pthread_once_t");
            goto LABEL_42;
          }
          goto LABEL_43;
        case 1381452865:
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:](self, "_isValidInstanceLength:expectedLength:", a4, 24))
          {
            v9 = CFSTR("pthread_rwlockattr_t");
            goto LABEL_42;
          }
          goto LABEL_43;
        case 1381452875:
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:](self, "_isValidInstanceLength:expectedLength:", a4, 200))
          {
            v9 = CFSTR("pthread_rwlock_t");
LABEL_42:
            -[VMUObjectIdentifier _classInfoWithPthreadType:](self, "_classInfoWithPthreadType:", v9);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            return v8;
          }
          goto LABEL_43;
      }
    }
  }
  return v8;
}

- (id)classInfoForCFTypeInstance:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  uint64_t Name;
  char *v18;
  char *v19;
  char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t Path;
  const char *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;

  if (a4 < 0x10)
    return 0;
  -[VMUClassInfoMap classInfoForAddress:](self->_cfTypeIDToClassInfo, "classInfoForAddress:", __CFGenericTypeID());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "isCoreMediaFigObject"))
    {
      v10 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *((_QWORD *)a3 + 3));
      if (v10)
      {
        v11 = v10;
        -[VMUClassInfoMap classInfoForAddress:](self->_coreMediaFigBaseClassToClassInfo, "classInfoForAddress:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          v40 = 0;
          -[VMUTask memoryCache](self->_task, "memoryCache");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "peekAtAddress:size:returnsBuf:", v11, 16, &v40);

          if (!v16)
          {
            if (v40)
            {
              if (-[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *(_QWORD *)(v40 + 8)))
              {
                CSSymbolicatorGetSymbolWithAddressAtTime();
                if ((CSIsNull() & 1) == 0)
                {
                  Name = CSSymbolGetName();
                  if (Name)
                  {
                    v18 = (char *)Name;
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    if (*v18 == 107)
                      v19 = v18 + 1;
                    else
                      v19 = v18;
                    v20 = strstr(v19, "_BaseClass");
                    if (!v20)
                      v20 = strstr(v19, "BaseClass");
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = v21;
                    if (v20)
                    {
                      objc_msgSend(v21, "substringToIndex:", v20 - v19);
                      v23 = objc_claimAutoreleasedReturnValue();

                      v22 = (void *)v23;
                    }
                    objc_msgSend(v9, "className");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = objc_msgSend(v24, "isEqualToString:", v22);

                    objc_msgSend(v9, "className");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = v26;
                    if (v25)
                    {
                      printFigSubclassInfo(v26, &stru_1E4E04720, v39);

                      -[VMUClassInfoMap addClassInfo:forAddress:](self->_coreMediaFigBaseClassToClassInfo, "addClassInfo:forAddress:", v9, v11);
                    }
                    else
                    {
                      v28 = objc_msgSend(v22, "hasPrefix:", v26);

                      if (v28)
                      {
                        objc_msgSend(v9, "className");
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v22, "substringFromIndex:", objc_msgSend(v29, "length"));
                        v30 = objc_claimAutoreleasedReturnValue();

                        v22 = (void *)v30;
                      }
                      objc_msgSend(v9, "className");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "stringByAppendingFormat:", CFSTR(" (%@)"), v22);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();

                      CSSymbolGetSymbolOwner();
                      Path = CSSymbolOwnerGetPath();
                      if (Path)
                        v34 = (const char *)Path;
                      else
                        v34 = "<unknown>";
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v34);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUMutableClassInfo, "classInfoWithClassName:binaryPath:type:", v32, v35, 4);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v36, "setIsCoreMediaFigObject:", 1);
                      objc_msgSend(v9, "className");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      printFigSubclassInfo(v37, v32, v39);

                      -[VMUClassInfoMap addClassInfo:forAddress:](self->_coreMediaFigBaseClassToClassInfo, "addClassInfo:forAddress:", v36, v11);
                      v22 = v32;
                      v9 = v36;
                    }

                  }
                }
              }
            }
          }
          v14 = v9;
          v9 = v14;
        }
        v38 = v14;

        v9 = v38;
      }
    }
  }
  return v9;
}

- (id)classInfoForMemory:(void *)a3 length:(unint64_t)a4
{
  return -[VMUObjectIdentifier classInfoForMemory:length:remoteAddress:](self, "classInfoForMemory:length:remoteAddress:", a3, a4, 0);
}

- (id)_classInfoForMemory:(void *)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 remoteAddress:(unint64_t)a6
{
  VMUTask *task;
  uint64_t v12;
  uint64_t (**isaTranslator)(id, id, uint64_t);
  unint64_t v14;
  const void *v15;
  VMUClassInfo *v16;
  BOOL v17;
  id WeakRetained;
  int v20;
  void *v21;
  void *v22;
  int v23;
  VMUClassInfo *v24;
  void *v25;
  uint64_t v26;
  uint64_t SymbolWithAddress;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  char HaveGenericCaptures;
  VMUMutableClassInfo *v36;
  VMUClassInfoMap *realizedIsaToClassInfo;
  libSwiftRemoteMirrorWrapper *swiftMirror;
  uint64_t v39;
  id v40;
  const char *Name;
  void *v42;
  uint64_t Path;
  __CFString *v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  int v48;
  __int128 v49;
  int v50;
  uint64_t v51;

  task = self->_task;
  v12 = *(_QWORD *)((char *)a3 + a5);
  isaTranslator = (uint64_t (**)(id, id, uint64_t))self->_isaTranslator;
  if (isaTranslator)
    v12 = isaTranslator[2](isaTranslator, self->_memoryReader, v12);
  v14 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)task, v12);
  v15 = (const void *)v14;
  if (a5 || v14 != self->_coreFoundationCFTypeIsa)
  {
    if (HIDWORD(v14))
      v17 = (v14 & 7) == 0;
    else
      v17 = 0;
    if (!v17)
      goto LABEL_10;
    -[VMUClassInfoMap classInfoForAddress:](self->_realizedIsaToClassInfo, "classInfoForAddress:", v14);
    v16 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
LABEL_17:
      if (-[VMUClassInfo ivarCount](v16, "ivarCount"))
        goto LABEL_18;
      -[VMUClassInfo className](v16, "className");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("__SwiftValue")))
      {

      }
      else
      {
        -[VMUClassInfo className](v16, "className");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("_SwiftValue"));

        if (!v23)
        {
LABEL_18:
          if (-[VMUClassInfo instanceSize](v16, "instanceSize") > a4)
          {

            v16 = 0;
          }
          return v16;
        }
      }
      v24 = [VMUClassInfo alloc];
      -[VMUClassInfo className](v16, "className");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[VMUClassInfo initSwiftClassWithName:classInfoType:size:](v24, "initSwiftClassWithName:classInfoType:size:", v25, 64, a4);

      v16 = (VMUClassInfo *)v26;
      goto LABEL_11;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
    v20 = objc_msgSend(WeakRetained, "addressIsInDataSegment:", v15);

    if (!v20)
    {
LABEL_10:
      v16 = 0;
      goto LABEL_11;
    }
    if (v15 == (const void *)self->_lastCPlusPlusIsa)
    {
      v16 = self->_lastCPlusPlusClassInfo;
      if (!v16)
        goto LABEL_11;
      goto LABEL_17;
    }
    if (NSHashGet(self->_nonObjectIsaHash, v15))
      goto LABEL_59;
    CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
    if (!CSSymbolOwnerUsesCPlusPlus()
      || (SymbolWithAddress = CSSymbolOwnerGetSymbolWithAddress(), v29 = v28, (CSIsNull() & 1) != 0))
    {
LABEL_32:
      v16 = 0;
      goto LABEL_33;
    }
    if (self->_taskIsDriverKit)
    {
      -[VMUObjectIdentifierDriverKitSupport classInfoForDriverKitMemory:length:atOffset:translatedIsa:symbol:](self->_driverKitSupport, "classInfoForDriverKitMemory:length:atOffset:translatedIsa:symbol:", a3, a4, a5, v15, SymbolWithAddress, v29);
      v16 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
      if (-[VMUClassInfo infoType](v16, "infoType") == 128)
        -[VMUClassInfoMap addClassInfo:forAddress:](self->_realizedIsaToClassInfo, "addClassInfo:forAddress:", v16, v15);
    }
    else
    {
      Name = (const char *)CSSymbolGetName();
      v16 = (VMUClassInfo *)Name;
      if (!Name)
        goto LABEL_33;
      if (strncmp(Name, "vtable for ", 0xBuLL))
        goto LABEL_32;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)&v16->_remoteIsa + 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      VMUSimplifyCPlusPlusSymbolName(v42);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      Path = CSSymbolOwnerGetPath();
      if (Path)
      {
        v45 = MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CSSymbolOwnerGetPath());
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = &stru_1E4E04720;
      }
      +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", v46, v44, 2, v45);
      v16 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
      if (Path)

      -[VMUClassInfoMap addClassInfo:forAddress:](self->_realizedIsaToClassInfo, "addClassInfo:forAddress:", v16, v15);
    }
LABEL_33:
    if (!a5 && !v16)
    {
      if (!-[VMUObjectIdentifier hasSwiftContent](self, "hasSwiftContent"))
        goto LABEL_58;
      if (!-[VMUObjectIdentifier hasSwiftReflection](self, "hasSwiftReflection"))
      {
        v16 = -[VMUClassInfo initSwiftClassWithName:classInfoType:size:]([VMUClassInfo alloc], "initSwiftClassWithName:classInfoType:size:", 0, 64, a4);
        goto LABEL_57;
      }
      v30 = objc_loadWeakRetained((id *)&self->_scanner);
      v31 = objc_msgSend(v30, "validateAddressRangeForSwiftRemoteMirror:allowUnusedSplitLibs:", v15, 8, 0);

      if (!v31)
      {
LABEL_58:
        NSHashInsert(self->_nonObjectIsaHash, v15);
LABEL_59:
        v16 = 0;
LABEL_60:
        self->_lastCPlusPlusIsa = (unint64_t)v15;
        objc_storeStrong((id *)&self->_lastCPlusPlusClassInfo, v16);
        if (!v16)
          goto LABEL_11;
        goto LABEL_17;
      }
      v51 = 0;
      -[VMUTask memoryCache](self->_task, "memoryCache");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "readPointerAt:value:", v15, &v51);

      v16 = 0;
      if (v51 == 1024)
      {
        self->_swiftMirrorReaderContext.needToValidateAddressRange = 1;
        v49 = 0uLL;
        v50 = 0;
        vmu_swift_reflection_infoForInstance((uint64_t)self->_swiftMirror->var0, a6, (uint64_t)&v49);
        v16 = 0;
        if ((_DWORD)v49 == 18)
        {
          if (_classInfoForMemory_length_atOffset_remoteAddress__onceToken != -1)
            dispatch_once(&_classInfoForMemory_length_atOffset_remoteAddress__onceToken, &__block_literal_global_14);
          v33 = objc_loadWeakRetained((id *)&self->_scanner);
          objc_msgSend(v33, "memoryCache");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          HaveGenericCaptures = closureContextMayHaveGenericCaptures((uint64_t)v15, v34);

          if ((HaveGenericCaptures & 1) != 0
            || (v36 = [VMUMutableClassInfo alloc],
                realizedIsaToClassInfo = self->_realizedIsaToClassInfo,
                swiftMirror = self->_swiftMirror,
                v47 = v49,
                v48 = v50,
                (v39 = -[VMUClassInfo initWithClosureContext:typeInfo:infoMap:swiftFieldMetadataContext:](v36, "initWithClosureContext:typeInfo:infoMap:swiftFieldMetadataContext:", a6, &v47, realizedIsaToClassInfo, swiftMirror)) == 0))
          {
            v16 = (VMUClassInfo *)(id)_classInfoForMemory_length_atOffset_remoteAddress__closureContextWithUnknownLayoutClassInfo;
          }
          else
          {
            v16 = (VMUClassInfo *)v39;
            v40 = objc_loadWeakRetained((id *)&self->_scanner);
            objc_msgSend(v40, "applyTypeOverlayToMutableInfo:", v16);

          }
          -[VMUClassInfoMap addClassInfo:forAddress:](self->_realizedIsaToClassInfo, "addClassInfo:forAddress:", v16, v15);
        }
        self->_swiftMirrorReaderContext.needToValidateAddressRange = 0;
      }
      VMUClearCrashReporterInfo();
    }
LABEL_57:
    if (v16)
      goto LABEL_60;
    goto LABEL_58;
  }
  -[VMUObjectIdentifier classInfoForCFTypeInstance:length:remoteAddress:](self, "classInfoForCFTypeInstance:length:remoteAddress:", a3, a4, a6);
  v16 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  if (!a5 && !v16)
  {
    -[VMUObjectIdentifier classInfoForNonobjectMemory:length:](self, "classInfoForNonobjectMemory:length:", a3, a4);
    v16 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
  }
  if (v16)
    goto LABEL_18;
  return v16;
}

void __73__VMUObjectIdentifier__classInfoForMemory_length_atOffset_remoteAddress___block_invoke()
{
  VMUClassInfo *v0;
  void *v1;

  v0 = -[VMUClassInfo initWithClassName:binaryPath:type:]([VMUClassInfo alloc], "initWithClassName:binaryPath:type:", CFSTR("Closure context (unknown layout)"), 0, 64);
  v1 = (void *)_classInfoForMemory_length_atOffset_remoteAddress__closureContextWithUnknownLayoutClassInfo;
  _classInfoForMemory_length_atOffset_remoteAddress__closureContextWithUnknownLayoutClassInfo = (uint64_t)v0;

}

- (id)classInfoForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v7;

  if ((unint64_t)a3 >> 32)
  {
    v7 = 0;
    if (a4 >= 8 && (a3 & 7) == 0)
    {
      -[VMUObjectIdentifier _classInfoForMemory:length:atOffset:remoteAddress:](self, "_classInfoForMemory:length:atOffset:remoteAddress:", a3, a4, 0, a5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        if (self->_taskIsDriverKit)
        {
          -[VMUObjectIdentifierDriverKitSupport driverKitClassInfoForMemory:length:remoteAddress:](self->_driverKitSupport, "driverKitClassInfoForMemory:length:remoteAddress:", a3, a4, a5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_returnFaultedClass:(unint64_t)a3 ofType:(unsigned int)a4
{
  uint64_t v4;
  VMUClassInfoMap *realizedIsaToClassInfo;
  VMUClassInfoMap *v8;
  VMUClassInfo *v9;
  VMUClassInfo *v10;
  VMUClassInfoMap *unrealizedClassInfos;
  void *v13;
  int v14;

  v4 = *(_QWORD *)&a4;
  if (a4 == 4)
    realizedIsaToClassInfo = 0;
  else
    realizedIsaToClassInfo = self->_realizedIsaToClassInfo;
  v8 = realizedIsaToClassInfo;
  -[VMUClassInfoMap classInfoForAddress:](v8, "classInfoForAddress:", a3);
  v9 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if ((_DWORD)v4 != 1
      || (unrealizedClassInfos = self->_unrealizedClassInfos) == 0
      || (-[VMUClassInfoMap classInfoForAddress:](unrealizedClassInfos, "classInfoForAddress:", a3),
          (v9 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v9 = -[VMUClassInfo initWithRealizedClass:type:infoMap:objectIdentifier:reader:]([VMUClassInfo alloc], "initWithRealizedClass:type:infoMap:objectIdentifier:reader:", a3, v4, v8, self, self->_memoryReader);
      if (!v9 && (_DWORD)v4 == 1 && self->_unrealizedClassInfos)
        v9 = -[VMUClassInfo initWithClass:type:infoMap:objectIdentifier:reader:]([VMUClassInfo alloc], "initWithClass:type:infoMap:objectIdentifier:reader:", a3, 1, self->_unrealizedClassInfos, self, self->_memoryReader);
      if (-[VMUClassInfo infoType](v9, "infoType") == 1)
      {
        if (self->_coreFoundationCFTypeIsa
          || (-[VMUClassInfo className](v9, "className"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("__NSCFType")),
              v13,
              !v14))
        {
          ++self->_objCClassCount;
        }
        else
        {
          self->_coreFoundationCFTypeIsa = a3;
        }
      }
      else if (-[VMUClassInfo infoType](v9, "infoType") == 8)
      {
        ++self->_swiftClassCount;
      }
      else if (-[VMUClassInfo infoType](v9, "infoType") == 4)
      {
        ++self->_cfClassCount;
      }
    }
  }
  v10 = v9;

  return v10;
}

- (void)_faultClass:(unint64_t)a3 ofType:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v7 = (void *)MEMORY[0x1A85A9758](self, a2);
  v8 = -[VMUObjectIdentifier _returnFaultedClass:ofType:](self, "_returnFaultedClass:ofType:", a3, v4);
  objc_autoreleasePoolPop(v7);
}

- (void)findCFTypes_version1
{
  uint64_t SymbolOwner;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;

  if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore"))
    SymbolOwner = CSSymbolicatorGetSymbolOwner();
  else
    SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  v5 = SymbolOwner;
  v6 = v4;
  v13 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"___CFRuntimeClassTableCount", SymbolOwner, v4, 4uLL, &v13);
  if (v13)
  {
    v7 = _map_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"___CFRuntimeClassTables", v5, v6, 8 * v13);
    if (!v7)
      v7 = _map_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"___CFRuntimeClassTable", v5, v6, 8 * v13);
    if (v7)
    {
      v8 = v13;
      if (v13 >= 1)
      {
        v9 = 0;
        do
        {
          v10 = *(_QWORD *)(v7 + 8 * v9);
          if (v10)
          {
            v11 = (void *)MEMORY[0x1A85A9758]();
            -[VMUObjectIdentifier _returnFaultedClass:ofType:](self, "_returnFaultedClass:ofType:", v10, 4);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[VMUClassInfoMap addClassInfo:forAddress:](self->_cfTypeIDToClassInfo, "addClassInfo:forAddress:", v12, v9);
            -[VMUClassInfoMap addClassInfo:forAddress:](self->_realizedIsaToClassInfo, "addClassInfo:forAddress:", v12, v10);

            objc_autoreleasePoolPop(v11);
            v8 = v13;
          }
          ++v9;
        }
        while (v9 < v8);
      }
    }
  }
}

- (void)findCFTypes_version2
{
  uint64_t v3;
  void *v4;
  VMUTask *task;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[3];
  int v11;
  _QWORD v12[5];

  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke;
  v12[3] = &unk_1E4E02A20;
  v12[4] = self;
  v4 = (void *)MEMORY[0x1A85A995C](v12, a2);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  task = self->_task;
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke_2;
  v7[3] = &unk_1E4E02A70;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = v10;
  withPeekFunctionForVMUTask(task, v7);

  _Block_object_dispose(v10, 8);
}

uint64_t __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isExclaveCore"))
    CSSymbolicatorGetSymbolOwner();
  else
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  CSSymbolOwnerGetSymbolWithName();
  return CSSymbolGetRange();
}

uint64_t __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[6];

  v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD *))_vmu__CFRuntimeEnumerateClassTable;
  v5 = objc_msgSend(*(id *)(a1[4] + 8), "taskPort");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke_3;
  v9[3] = &unk_1E4E02A48;
  v6 = a1[5];
  v7 = a1[6];
  v9[4] = a1[4];
  v9[5] = v7;
  return v4(v5, v6, a2, v9);
}

void __43__VMUObjectIdentifier_findCFTypes_version2__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  if (a2)
  {
    v4 = (void *)MEMORY[0x1A85A9758]();
    objc_msgSend(*(id *)(a1 + 32), "_returnFaultedClass:ofType:", a2, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "addClassInfo:forAddress:", v5, *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "addClassInfo:forAddress:", v5, a2);
    }

    objc_autoreleasePoolPop(v4);
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (void)findCFTypes
{
  if (findCFTypes_onceToken != -1)
    dispatch_once(&findCFTypes_onceToken, &__block_literal_global_92);
  if (_vmu__CFRuntimeEnumerateClassTable)
    -[VMUObjectIdentifier findCFTypes_version2](self, "findCFTypes_version2");
  else
    -[VMUObjectIdentifier findCFTypes_version1](self, "findCFTypes_version1");
}

void *__34__VMUObjectIdentifier_findCFTypes__block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/System/Library/Frameworks/CoreFoundation.framework/CoreFoundation", 1);
  if (result)
  {
    v1 = result;
    _vmu__CFRuntimeEnumerateClassTable = dlsym(result, "__CFRuntimeEnumerateClassTable");
    return (void *)dlclose(v1);
  }
  return result;
}

- (void)_findObjCAndSwiftClassesFromClass:(unint64_t)a3 recursionDepth:(unsigned int)a4
{
  uint64_t SiblingOfClass;
  uint64_t v6;
  void *v7;
  uint64_t SubclassOfClass;

  if (a3)
  {
    SiblingOfClass = a3;
    v6 = a4 + 1;
    do
    {
      if ((VMUIsMetaclass(self->_task, self->_memoryReader, self->_objcABI, SiblingOfClass) & 1) == 0)
      {
        -[VMUClassInfoMap classInfoForAddress:](self->_realizedIsaToClassInfo, "classInfoForAddress:", SiblingOfClass);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          return;
        -[VMUObjectIdentifier _faultClass:ofType:](self, "_faultClass:ofType:", SiblingOfClass, 1);
        SubclassOfClass = VMUGetFirstSubclassOfClass(self->_task, self->_memoryReader, self->_objcABI, SiblingOfClass);
        if (SubclassOfClass)
          -[VMUObjectIdentifier _findObjCAndSwiftClassesFromClass:recursionDepth:](self, "_findObjCAndSwiftClassesFromClass:recursionDepth:", SubclassOfClass, v6);
      }
      SiblingOfClass = VMUGetNextSiblingOfClass(self->_task, self->_memoryReader, self->_objcABI, SiblingOfClass);
    }
    while (SiblingOfClass);
  }
}

- (void)findObjCAndSwiftClasses
{
  uint64_t *v3;
  uint64_t i;
  uint64_t Path;
  const char *v6;
  VMUClassInfo *v7;
  void *v8;
  VMUClassInfo *v9;
  VMUClassInfo *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  _QWORD v12[5];
  VMUClassInfo *v13;
  const char *v14;

  -[VMUObjectIdentifier addressOfSymbol:inLibrary:](self, "addressOfSymbol:inLibrary:", "_firstRealizedClass", "libobjc.A.dylib");
  v3 = (uint64_t *)(*((uint64_t (**)(void))self->_memoryReader + 2))();
  if (v3)
  {
    for (i = *v3; i; i = VMUGetNextSiblingOfClass(self->_task, self->_memoryReader, self->_objcABI, i))
      -[VMUObjectIdentifier _findObjCAndSwiftClassesFromClass:recursionDepth:](self, "_findObjCAndSwiftClassesFromClass:recursionDepth:", i, 0);
  }
  if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore"))
  {
    CSSymbolicatorGetSymbolOwner();
    Path = CSSymbolOwnerGetPath();
    if (Path)
      v6 = (const char *)Path;
    else
      v6 = "<unknown>";
    v7 = [VMUClassInfo alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VMUClassInfo initWithClassName:binaryPath:type:](v7, "initWithClassName:binaryPath:type:", CFSTR("NSBlock"), v8, 1);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__VMUObjectIdentifier_findObjCAndSwiftClasses__block_invoke;
    v12[3] = &unk_1E4E02AB8;
    v13 = v9;
    v14 = v6;
    v12[4] = self;
    v10 = v9;
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85A995C](v12);
    ((void (**)(_QWORD, const char *, const __CFString *))v11)[2](v11, "__NSConcreteStackBlock", CFSTR("__NSStackBlock__"));
    ((void (**)(_QWORD, const char *, const __CFString *))v11)[2](v11, "__NSConcreteMallocBlock", CFSTR("__NSMallocBlock__"));
    ((void (**)(_QWORD, const char *, const __CFString *))v11)[2](v11, "__NSConcreteGlobalBlock", CFSTR("__NSGlobalBlock__"));
    ((void (**)(_QWORD, const char *, const __CFString *))v11)[2](v11, "__NSConcreteWeakBlockVariable", CFSTR("__NSWeakBlockVariable__"));

  }
}

void __46__VMUObjectIdentifier_findObjCAndSwiftClasses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  VMUMutableClassInfo *v7;
  void *v8;
  VMUMutableClassInfo *v9;
  id v10;

  v10 = a3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "addressOfSymbol:inLibrary:", a2, "libclosure.dylib");
  if (v5)
  {
    v6 = v5;
    v7 = [VMUMutableClassInfo alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VMUClassInfo initWithClassName:binaryPath:type:](v7, "initWithClassName:binaryPath:type:", v10, v8, 1);

    -[VMUMutableClassInfo setSuperclassInfo:](v9, "setSuperclassInfo:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "addClassInfo:forAddress:", v9, v6);
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 256);

  }
}

- (void)findFutureClasses
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v7;
  uint64_t v8;

  v8 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"__ZL22future_named_class_map", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v8);
  if (v8)
  {
    v3 = (*((uint64_t (**)(void))self->_memoryReader + 2))();
    if (v3)
    {
      if (*(_DWORD *)(v3 + 8))
      {
        v4 = (*(_DWORD *)(v3 + 12) + 1);
        v5 = (*((uint64_t (**)(id, _QWORD, uint64_t))self->_memoryReader + 2))(self->_memoryReader, *(_QWORD *)(v3 + 16), 16 * v4);
        if (v5 && (_DWORD)v4 != 0)
        {
          v7 = (_QWORD *)(v5 + 8);
          do
          {
            if (*(v7 - 1) != -1)
              -[VMUObjectIdentifier _faultClass:ofType:](self, "_faultClass:ofType:", *v7, 8);
            v7 += 2;
            --v4;
          }
          while (v4);
        }
      }
    }
  }
}

- (VMUAutoreleasePoolPageLayout)createAutoreleasePoolPageLayout
{
  VMUAutoreleasePoolPageLayout *v3;

  v3 = (VMUAutoreleasePoolPageLayout *)malloc_type_calloc(1uLL, 0x20uLL, 0x1000040244176AFuLL);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_autoreleasepoolpage_next_offset", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 4uLL, v3);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_autoreleasepoolpage_parent_offset", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 4uLL, &v3->var1);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_autoreleasepoolpage_begin_offset", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 4uLL, &v3->var2);
  if (!v3->var2)
    v3->var2 = 56;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_autoreleasepoolpage_ptr_mask", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v3->var3);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_autoreleasepoolpage_child_offset", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 4uLL, &v3->var4);
  return v3;
}

- (void)setupIsaTranslator
{
  uint64_t Range;
  VMUTask *v4;
  VMUTask *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id isaTranslator;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  VMUTask *v18;
  _QWORD v19[4];
  VMUTask *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[11];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_indexed_isa_magic_mask", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v32);
  v31 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_indexed_isa_magic_value", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v31);
  v30 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_indexed_isa_index_mask", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v30);
  v29 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_indexed_isa_index_shift", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v29);
  CSSymbolOwnerGetSymbolWithMangledName();
  Range = CSSymbolGetRange();
  v28 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_indexed_classes_count", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v28);
  v27 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_isa_class_mask", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v27);
  v26 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_isa_magic_mask", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v26);
  v25 = 0;
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_isa_magic_value", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &v25);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_taggedpointer_mask", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &self->_taggedPointerMask);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_taggedpointer_obfuscator", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, &self->_taggedPointerObfuscator);
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_tag60_permutations", self->_libobjcSymbolOwner._opaque_1, self->_libobjcSymbolOwner._opaque_2, 8uLL, self->_taggedPointerPermutations);
  v4 = self->_task;
  v5 = v4;
  v6 = v32;
  if (v32 && (v7 = v31) != 0 && (v8 = v30) != 0 && (v9 = v29) != 0 && Range && (v10 = v28) != 0)
  {
    self->_fragileNonPointerIsas = 1;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke;
    v24[3] = &__block_descriptor_88_e20_Q24__0____v__QQ_8Q16l;
    v24[4] = v27;
    v24[5] = v8;
    v24[6] = v6;
    v24[7] = v7;
    v24[8] = v9;
    v24[9] = v10;
    v24[10] = Range;
    v11 = (void *)MEMORY[0x1A85A995C](v24);
    isaTranslator = self->_isaTranslator;
    self->_isaTranslator = v11;
  }
  else if (v27 && v26)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke_2;
    v19[3] = &unk_1E4E02B00;
    v21 = v27;
    v22 = v26;
    v23 = v25;
    v20 = v4;
    v13 = (void *)MEMORY[0x1A85A995C](v19);
    v14 = self->_isaTranslator;
    self->_isaTranslator = v13;

    isaTranslator = v20;
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke_3;
    v17[3] = &unk_1E4E02B28;
    v18 = v4;
    v15 = (void *)MEMORY[0x1A85A995C](v17);
    v16 = self->_isaTranslator;
    self->_isaTranslator = v15;

    isaTranslator = v18;
  }

}

unint64_t __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke(_QWORD *a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t *v9;

  v5 = a2;
  v6 = v5;
  if ((a3 & ~a1[4]) != 0)
  {
    v7 = a1[5];
    if ((a3 & ~v7) != 0)
    {
      if ((a1[6] & a3) == a1[7]
        && (v8 = (v7 & a3) >> a1[8], v8 <= a1[9])
        && (v9 = (unint64_t *)(*((uint64_t (**)(id, unint64_t, uint64_t))v5 + 2))(v5, a1[10] + 8 * v8, 8)) != 0)
      {
        a3 = *v9;
      }
      else
      {
        a3 = 0;
      }
    }
  }

  return a3;
}

uint64_t __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke_2(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = a1[5];
  if ((a3 & ~v3) == 0)
    return a3;
  if ((a1[6] & a3) == a1[7])
    return v3 & a3;
  return -[VMUTask ptrauthStripDataPointer:](a1[4], a3);
}

uint64_t __41__VMUObjectIdentifier_setupIsaTranslator__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[VMUTask ptrauthStripDataPointer:](*(_QWORD *)(a1 + 32), a3);
}

- (unint64_t)translateIsaPointer:(unint64_t)a3
{
  uint64_t (**isaTranslator)(id, id, unint64_t);

  isaTranslator = (uint64_t (**)(id, id, unint64_t))self->_isaTranslator;
  if (isaTranslator)
    return isaTranslator[2](isaTranslator, self->_memoryReader, a3);
  else
    return a3;
}

- (_VMURange)vmRegionRangeForAddress:(unint64_t)a3
{
  VMUNonOverlappingRangeArray *targetProcessVMranges;
  VMUNonOverlappingRangeArray *v6;
  VMUNonOverlappingRangeArray *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  _VMURange result;

  targetProcessVMranges = self->_targetProcessVMranges;
  if (!targetProcessVMranges)
  {
    task_find_all_malloc_regions(self->_task);
    v6 = (VMUNonOverlappingRangeArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_targetProcessVMranges;
    self->_targetProcessVMranges = v6;

    targetProcessVMranges = self->_targetProcessVMranges;
  }
  v8 = -[VMURangeArray rangeForLocation:](targetProcessVMranges, "rangeForLocation:", a3);
  v10 = v9;
  if (!v9)
  {
    v18 = a3;
    v17 = 0;
    v16 = 9999;
    -[VMUTask memoryCache](self->_task, "memoryCache", 0, 0, 0, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "machVMRegionRecurseSubmapShortInfo64onAddress:size:nestingDepth:info:", &v18, &v17, &v16, &v15);

    if (!v12)
    {
      v8 = v18;
      v10 = v17;
      -[VMUNonOverlappingRangeArray mergeRange:](self->_targetProcessVMranges, "mergeRange:", v18, v17);
    }
  }
  v13 = v8;
  v14 = v10;
  result.length = v14;
  result.location = v13;
  return result;
}

- (unint64_t)addressOfSymbol:(const char *)a3 inLibrary:(const char *)a4
{
  if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore"))
    CSSymbolicatorGetSymbolOwner();
  else
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  if (*a3 != 95 || (CSSymbolOwnerGetSymbolWithMangledName(), CSIsNull()))
    CSSymbolOwnerGetSymbolWithName();
  return CSSymbolGetRange();
}

- (_CSTypeRef)symbolForAddress:(unint64_t)a3
{
  unint64_t SymbolWithAddressAtTime;
  unint64_t v4;
  _CSTypeRef result;

  SymbolWithAddressAtTime = CSSymbolicatorGetSymbolWithAddressAtTime();
  result._opaque_2 = v4;
  result._opaque_1 = SymbolWithAddressAtTime;
  return result;
}

- (id)osMajorMinorVersionString
{
  return &stru_1E4E04720;
}

- (void)buildIsaToObjectLabelHandlerMap
{
  void *v3;
  NSMapTable *v4;
  NSMapTable *isaToObjectLabelHandlerMap;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  VMUClassInfoMap *realizedIsaToClassInfo;
  id v15;
  _QWORD v16[4];
  id v17;
  VMUObjectIdentifier *v18;
  _QWORD v19[4];
  id v20;

  v3 = (void *)MEMORY[0x1A85A9758](self, a2);
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 514, 0);
  v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  isaToObjectLabelHandlerMap = self->_isaToObjectLabelHandlerMap;
  self->_isaToObjectLabelHandlerMap = v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.Symbolication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUObjectIdentifier osMajorMinorVersionString](self, "osMajorMinorVersionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("VMUObjectLabelHandlers"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:", v8, CFSTR("plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (objc_msgSend(v6, "pathForResource:ofType:", CFSTR("VMUObjectLabelHandlers"), CFSTR("plist")),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v9);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 514);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __54__VMUObjectIdentifier_buildIsaToObjectLabelHandlerMap__block_invoke;
      v19[3] = &unk_1E4E02B50;
      v13 = v11;
      v20 = v13;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v19);
      realizedIsaToClassInfo = self->_realizedIsaToClassInfo;
      v16[0] = v12;
      v16[1] = 3221225472;
      v16[2] = __54__VMUObjectIdentifier_buildIsaToObjectLabelHandlerMap__block_invoke_2;
      v16[3] = &unk_1E4E02B78;
      v17 = v13;
      v18 = self;
      v15 = v13;
      -[VMUClassInfoMap enumerateInfosWithBlock:](realizedIsaToClassInfo, "enumerateInfosWithBlock:", v16);

    }
    else
    {
      NSLog(CFSTR("Symbolication: could not read object label handler plist from %@"), v9);
    }

  }
  else
  {
    NSLog(CFSTR("Symbolication: could not find object label handler plist %@.plist"), CFSTR("VMUObjectLabelHandlers"));
  }

  objc_autoreleasePoolPop(v3);
}

void __54__VMUObjectIdentifier_buildIsaToObjectLabelHandlerMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSString *v6;
  SEL v7;
  SEL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "stringByAppendingString:", CFSTR("length:remoteAddress:"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = NSSelectorFromString(v6);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v5, "objectForKey:", CFSTR("Classes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v14);
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

void __54__VMUObjectIdentifier_buildIsaToObjectLabelHandlerMap__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  Class Class;
  VMUObjectLabelHandlerInfo *v10;
  id v11;

  v5 = a3;
  if (a2)
  {
    v11 = v5;
    objc_msgSend(v5, "className");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
    if (v7)
    {
      v8 = (const char *)v7;
      if (objc_msgSend(v11, "infoType") == 1)
      {
        Class = objc_getClass((const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
        if (Class)
          goto LABEL_7;
      }
      if (objc_msgSend(v11, "infoType") != 1)
      {
        Class = 0;
LABEL_7:
        v10 = objc_alloc_init(VMUObjectLabelHandlerInfo);
        objc_storeStrong((id *)&v10->_className, v6);
        v10->_localClass = Class;
        v10->_handlerSelector = v8;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 320), "setObject:forKey:", v10, a2);

      }
    }

    v5 = v11;
  }

}

- (_QWORD)objectLabelHandlerForRemoteIsa:(_QWORD *)a1
{
  _QWORD *v3;
  void *v4;

  if (a1)
  {
    v3 = a1;
    v4 = (void *)a1[40];
    if (!v4)
    {
      objc_msgSend(v3, "buildIsaToObjectLabelHandlerMap");
      v4 = (void *)v3[40];
    }
    objc_msgSend(v4, "objectForKey:", a2);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)_remoteAddressIsOKtoRead:(unint64_t)a3
{
  unsigned int objectContentLevel;

  objectContentLevel = self->_objectContentLevel;
  if (objectContentLevel == 3)
    return 1;
  if (objectContentLevel == 2)
    return -[VMURangeArray containsLocation:](self->_readonlyRegionRanges, "containsLocation:", a3);
  return 0;
}

- (id)labelForTaggedPointer:(void *)a3
{
  uint64_t v5;
  unint64_t taggedPointerObfuscator;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  if (self->_objectContentLevel != 3 || !-[VMUObjectIdentifier isTaggedPointer:](self, "isTaggedPointer:"))
    goto LABEL_14;
  v5 = 0;
  taggedPointerObfuscator = self->_taggedPointerObfuscator;
  if ((~(unint64_t)a3 & 0xC000000000000007) == 0)
    taggedPointerObfuscator = 0;
  v7 = taggedPointerObfuscator ^ (unint64_t)a3;
  do
  {
    if ((v7 & 7) == self->_taggedPointerPermutations[v5])
      break;
    ++v5;
  }
  while (v5 != 7);
  v8 = v5 | v7 & 0xFFFFFFFFFFFFFFF8;
  v9 = *MEMORY[0x1E0DE7C58] ^ v8;
  if ((~v9 & 0xC000000000000007) != 0)
    v8 = v9 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v9 & 7));
  switch(v5)
  {
    case 6:
      -[VMUObjectIdentifier labelForNSDate:length:remoteAddress:](self, "labelForNSDate:length:remoteAddress:", v8, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      return v10;
    case 3:
      -[VMUObjectIdentifier labelForNSNumber:length:remoteAddress:](self, "labelForNSNumber:length:remoteAddress:", v8, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      return v10;
    case 2:
      -[VMUObjectIdentifier uniquifyStringLabel:stringType:printDetail:](self, "uniquifyStringLabel:stringType:printDetail:", v8, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_14:
      v10 = 0;
      break;
  }
  return v10;
}

- (id)classNameForTaggedPointer:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = 0;
  v4 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)a3 & 0xC000000000000007) == 0)
    v4 = 0;
  v5 = v4 ^ (unint64_t)a3;
  do
  {
    if ((v5 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v3))
      break;
    ++v3;
  }
  while (v3 != 7);
  v6 = v3 | v5;
  v7 = v3 & 7;
  v8 = (v6 >> 55) + 8;
  if (v7 == 7)
    v7 = v8;
  if (v7 > 6)
    return 0;
  else
    return *(&off_1E4E02D70 + v7);
}

- (BOOL)isTaggedPointer:(void *)a3
{
  return (self->_taggedPointerMask & (unint64_t)a3) != 0;
}

- (unint64_t)countFromPointerInAutoreleasePool:(void *)a3
{
  unint64_t var3;

  var3 = self->_autoreleasePoolPageLayout->var3;
  if (!var3)
    return 0;
  if ((var3 & 0xF00000000000000) != 0)
    return ((unint64_t)a3 >> 44) & 0xFF0 | ((unint64_t)a3 >> 60);
  return (unint64_t)a3 >> 48;
}

- (id)uniquifyStringLabel:(id)a3 stringType:(int)a4 printDetail:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  int v9;
  int v10;
  __int16 v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  int v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  id *labelStringUniquingMaps;
  const __CFString *v22;
  void *v23;
  void *v24;
  id *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;

  v5 = a5;
  v8 = a3;
  v9 = a4 & 0x40;
  if (v5)
    v10 = a4;
  else
    v10 = 0;
  if (v5)
    v11 = a4;
  else
    v11 = a4 & 0x40;
  v12 = self->_labelStringUniquingMaps[v10];
  v13 = self->_stringTypeDescriptions[v10];
  if (!v12)
  {
    v14 = v10;
    if (!v10)
    {
      v20 = (void *)objc_opt_new();
      labelStringUniquingMaps = self->_labelStringUniquingMaps;
      v12 = v20;
      v16 = *labelStringUniquingMaps;
      labelStringUniquingMaps[v14] = v12;
LABEL_34:

      goto LABEL_35;
    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = v15;
    v17 = v11 & 7;
    if (v17 == 2)
    {
      v22 = CFSTR("has-length-byte");
LABEL_29:
      objc_msgSend(v16, "addObject:", v22);
      goto LABEL_30;
    }
    if (v17 == 4)
    {
      if ((v11 & 0x80) != 0)
        objc_msgSend(v15, "addObject:", CFSTR("immortal"));
      if ((v11 & 0x100) == 0)
        goto LABEL_30;
      v22 = CFSTR("short");
      goto LABEL_29;
    }
    if (v17 != 3)
    {
LABEL_30:
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR(" "));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v23, "length"))
      {
        objc_storeStrong(&self->_stringTypeDescriptions[v14], v23);
        v24 = (void *)objc_opt_new();
        v25 = self->_labelStringUniquingMaps;
        v26 = v24;
        v12 = v26;
      }
      else
      {

        v27 = self->_labelStringUniquingMaps[1];
        v25 = self->_labelStringUniquingMaps;
        v26 = v27;
        v12 = v26;
        v23 = 0;
      }
      v28 = v25[v14];
      v25[v14] = v26;

      v13 = v23;
      goto LABEL_34;
    }
    if (v9)
    {
      v19 = CFSTR("constant");
    }
    else
    {
      if ((v11 & 0x28) == 0
        || ((v11 & 8) != 0 ? (v18 = CFSTR("mutable")) : (v18 = CFSTR("immutable")),
            objc_msgSend(v15, "addObject:", v18),
            (v11 & 0x20) == 0))
      {
LABEL_27:
        if ((v11 & 0x10) != 0)
        {
          v22 = CFSTR("Unicode");
          goto LABEL_29;
        }
        goto LABEL_30;
      }
      v19 = CFSTR("non-inline");
    }
    objc_msgSend(v16, "addObject:", v19);
    goto LABEL_27;
  }
LABEL_35:
  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v8);
    if (v5)
    {
      if (v9)
      {
        v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:  \"%@\"), CFSTR("constant"), v8, v36);
      }
      else
      {
        v31 = objc_msgSend(v8, "length");
        v32 = objc_alloc(MEMORY[0x1E0CB3940]);
        if (v13)
          v33 = objc_msgSend(v32, "initWithFormat:", CFSTR("length: %lu  %@:  \"%@\"), v31, v13, v8);
        else
          v33 = objc_msgSend(v32, "initWithFormat:", CFSTR("length: %lu  \"%@\"), v31, v8, v36);
      }
    }
    else
    {
      v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("\"%@\"), v8, v35, v36);
    }
    v29 = (void *)v33;
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v33, v30);

  }
  return v29;
}

- (id)labelForNSString:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForNSString:mappedSize:remoteAddress:printDetail:](self, "labelForNSString:mappedSize:remoteAddress:printDetail:", a3, a4, a5, 1);
}

- (id)labelForNSString:(void *)a3 mappedSize:(unint64_t)a4 remoteAddress:(unint64_t)a5 printDetail:(BOOL)a6
{
  _BOOL8 v6;
  void *v8;
  __CFString *v9;
  unsigned int v11;

  v6 = a6;
  v11 = 0;
  stringFromMappedNSCFString(self->_task, (uint64_t)a3, a4, a5, self->_readonlyRegionRanges, (int *)&v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[VMUObjectIdentifier uniquifyStringLabel:stringType:printDetail:](self, "uniquifyStringLabel:stringType:printDetail:", v8, v11, v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_objectContentLevel == 2)
  {
    v9 = 0;
  }
  else
  {
    v9 = CFSTR("<couldn't read content>");
  }

  return v9;
}

- (id)labelForNSCFStringAtRemoteAddress:(unint64_t)a3 printDetail:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t (**isaTranslator)(id, id, uint64_t);
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t *v17;

  v4 = a4;
  v17 = 0;
  -[VMUTask memoryCache](self->_task, "memoryCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "tryPeekAtAddress:outPtr:", a3, &v17);

  v9 = 0;
  if (v8 >= 0x10)
  {
    v10 = *v17;
    isaTranslator = (uint64_t (**)(id, id, uint64_t))self->_isaTranslator;
    if (isaTranslator)
      v10 = isaTranslator[2](isaTranslator, self->_memoryReader, v10);
    -[VMUObjectIdentifier objectLabelHandlerForRemoteIsa:](self, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12 && *(char **)(v12 + 24) == sel_labelForNSString_length_remoteAddress_)
    {
      -[VMUObjectIdentifier labelForNSString:mappedSize:remoteAddress:printDetail:](self, "labelForNSString:mappedSize:remoteAddress:printDetail:", v17, v8, a3, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  if (-[VMUObjectIdentifier isTaggedPointer:](self, "isTaggedPointer:", a3))
  {
    -[VMUObjectIdentifier labelForTaggedPointer:](self, "labelForTaggedPointer:", a3);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v9;
  }
  v15 = v14;

  return v15;
}

- (id)labelForNSTaggedPointerStringCStringContainer:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v6;
  void *v7;

  if (self->_objectContentLevel == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)a3 + 8, a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[VMUObjectIdentifier uniquifyStringLabel:stringType:printDetail:](self, "uniquifyStringLabel:stringType:printDetail:", v6, 1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)labelForNSConcreteAttributedString:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForNSCFStringAtRemoteAddress:printDetail:](self, "labelForNSCFStringAtRemoteAddress:printDetail:", *((_QWORD *)a3 + 1), 0, a5);
}

- (id)labelForSwiftStringStorage:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  _BOOL4 v8;
  void *v9;
  _BYTE *v10;
  void *v11;

  v8 = -[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", a5);
  v9 = 0;
  if (a4 >= 0x20 && v8)
  {
    v10 = memchr((char *)a3 + 32, 0, a4 - 32);
    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", (char *)a3 + 32, v10 - ((_BYTE *)a3 + 32), 4, 0);
      -[VMUObjectIdentifier uniquifyStringLabel:stringType:printDetail:](self, "uniquifyStringLabel:stringType:printDetail:", v11, 4, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
  }
  return v9;
}

- (id)labelForNSURL:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  -[VMUObjectIdentifier labelForObjectOfClass:atOffset:ofObject:withLength:](self, "labelForObjectOfClass:atOffset:ofObject:withLength:", CFSTR("NSURL"), 32, a3, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Base URL: %@;  "), v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E4E04720;
  }
  -[VMUObjectIdentifier labelForNSCFStringAtRemoteAddress:printDetail:](self, "labelForNSCFStringAtRemoteAddress:printDetail:", *((_QWORD *)a3 + 3), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)labelForNSPathStore2:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v7;
  void *v8;

  if (-[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", a5, a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUObjectIdentifier uniquifyStringLabel:stringType:printDetail:](self, "uniquifyStringLabel:stringType:printDetail:", v7, 1, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)labelForCFBundle:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[VMUObjectIdentifier labelForObjectOfClass:atOffset:ofObject:withLength:](self, "labelForObjectOfClass:atOffset:ofObject:withLength:", CFSTR("NSURL"), 16, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("\"file://")))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "substringFromIndex:", 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("\"%@"), v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)labelForNSBundle:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;

  -[VMUObjectIdentifier labelForObjectOfClass:atOffset:ofObject:withLength:](self, "labelForObjectOfClass:atOffset:ofObject:withLength:", CFSTR("CFBundle"), 16, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[VMUObjectIdentifier labelForObjectOfClass:atOffset:ofObject:withLength:](self, "labelForObjectOfClass:atOffset:ofObject:withLength:", CFSTR("NSPathStore2"), 48, a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v9, "rangeOfString:", CFSTR("\")));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
  }
  return v8;
}

- (id)labelForNSNumber:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  CFNumberType Type;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  if (self->_objectContentLevel == 3 && (Type = CFNumberGetType((CFNumberRef)a3), (unint64_t)(Type - 1) <= 5))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = labelForNSNumber_length_remoteAddress__kNSNumberTypeStrings[Type];
    objc_msgSend(a3, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("type %s  value: %@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableSet member:](self->_stringUniquingSet, "member:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      -[NSMutableSet addObject:](self->_stringUniquingSet, "addObject:", v11);
      v12 = v11;
    }

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)formattedDateLabel:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)formattedDateLabel__dateFormatter;
  if (!formattedDateLabel__dateFormatter)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v6 = (void *)formattedDateLabel__dateFormatter;
    formattedDateLabel__dateFormatter = (uint64_t)v5;

    objc_msgSend((id)formattedDateLabel__dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
    v4 = (void *)formattedDateLabel__dateFormatter;
  }
  return (id)objc_msgSend(v4, "stringFromDate:", a3);
}

- (id)labelForNSDate:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v5;

  if (self->_objectContentLevel == 3)
  {
    -[VMUObjectIdentifier formattedDateLabel:](self, "formattedDateLabel:", a3, a4, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)labelForItemCount:(int64_t)a3
{
  void *v5;

  if (self->_objectContentLevel == 3)
  {
    -[NSMapTable objectForKey:](self->_itemCountToLabelStringUniquingMap, "objectForKey:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("item count: %ld"), a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](self->_itemCountToLabelStringUniquingMap, "setObject:forKey:", v5, a3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)labelForNSArray:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForItemCount:](self, "labelForItemCount:", CFArrayGetCount((CFArrayRef)a3));
}

- (id)labelForNSDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForItemCount:](self, "labelForItemCount:", objc_msgSend(a3, "count"));
}

- (id)labelForNSCFDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v9;

  if (objectIsDeallocatingOrDeallocated((_BOOL8)a3))
  {
    v9 = 0;
  }
  else
  {
    -[VMUObjectIdentifier labelForNSDictionary:length:remoteAddress:](self, "labelForNSDictionary:length:remoteAddress:", a3, a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)labelForNSConcreteHashTable:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForItemCount:](self, "labelForItemCount:", objc_msgSend(a3, "count"));
}

- (id)labelForNSSet:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForItemCount:](self, "labelForItemCount:", objc_msgSend(a3, "count"));
}

- (id)labelForNSCFSet:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v9;

  if (objectIsDeallocatingOrDeallocated((_BOOL8)a3))
  {
    v9 = 0;
  }
  else
  {
    -[VMUObjectIdentifier labelForNSSet:length:remoteAddress:](self, "labelForNSSet:length:remoteAddress:", a3, a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)labelForNSData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  VMUTask *task;
  VMURangeArray *readonlyRegionRanges;
  id WeakRetained;
  void *v10;

  task = self->_task;
  readonlyRegionRanges = self->_readonlyRegionRanges;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  stringFromMappedNSCFData(task, (unint64_t *)a3, a5, readonlyRegionRanges, 0, 1, WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)labelForNSConcreteData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  int v7;
  VMUTask *task;
  VMURangeArray *readonlyRegionRanges;
  id WeakRetained;
  void *v11;

  v7 = *((_DWORD *)a3 + 2) & 1;
  task = self->_task;
  readonlyRegionRanges = self->_readonlyRegionRanges;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  stringFromMappedNSCFData(task, (unint64_t *)a3, a5, readonlyRegionRanges, v7, 0, WeakRetained);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)labelForNSConcreteMutableData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  VMUTask *task;
  VMURangeArray *readonlyRegionRanges;
  id WeakRetained;
  void *v10;

  task = self->_task;
  readonlyRegionRanges = self->_readonlyRegionRanges;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  stringFromMappedNSCFData(task, (unint64_t *)a3, a5, readonlyRegionRanges, 0, 0, WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)labelForNSInlineData:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  VMUTask *task;
  VMURangeArray *readonlyRegionRanges;
  id WeakRetained;
  void *v10;

  task = self->_task;
  readonlyRegionRanges = self->_readonlyRegionRanges;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  stringFromMappedNSCFData(task, (unint64_t *)a3, a5, readonlyRegionRanges, 1, 0, WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)labelForCoreMediaFigObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v16;
  void *v17;
  int v18;
  void *v21;
  int v22;
  uint64_t v23;
  BOOL v24;
  unint64_t v25;
  const char *v26;
  _QWORD *v27;
  uint64_t v28;

  v8 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *((_QWORD *)a3 + 3));
  if (HIDWORD(v8))
    v9 = (v8 & 7) == 0;
  else
    v9 = 0;
  if (!v9)
    goto LABEL_20;
  v10 = v8;
  v28 = 0;
  -[VMUTask memoryCache](self->_task, "memoryCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "peekAtAddress:size:returnsBuf:", v10, 16, &v28);

  v12 = 0;
  if ((_DWORD)v10)
    v13 = 1;
  else
    v13 = v28 == 0;
  if (!v13)
  {
    v14 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *(_QWORD *)(v28 + 8));
    if (HIDWORD(v14))
      v15 = (v14 & 7) == 0;
    else
      v15 = 0;
    if (!v15)
      goto LABEL_20;
    v16 = v14;
    v27 = 0;
    -[VMUTask memoryCache](self->_task, "memoryCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "peekAtAddress:size:returnsBuf:", v16, 8, &v27);

    v12 = 0;
    if (!v18 && v27 != 0)
    {
      if ((unint64_t)(*v27 - 1025) < 0xFFFFFFFFFFFFFC03)
      {
LABEL_20:
        v12 = 0;
        return v12;
      }
      -[VMUTask memoryCache](self->_task, "memoryCache");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "peekAtAddress:size:returnsBuf:", v16, 88, &v27);

      v12 = 0;
      if (!v22 && v27)
      {
        v23 = v27[10];
        if (!v23)
          goto LABEL_20;
        v12 = 0;
        v24 = __CFADD__(v23, 32);
        v25 = v23 + 32;
        if (!v24 && a4 > v25)
        {
          v26 = (char *)a3 + v25;
          if (!v26)
            goto LABEL_20;
          v12 = (void *)strnlen(v26, a4 - v25);
          if (v12)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("label: %.*s"), v12, v26);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
  }
  return v12;
}

- (id)labelForOSDispatchMach:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  const char *label;
  void *v7;
  char *v8;
  __CFString *v9;
  const char *Name;
  const char *v11;
  uint64_t v13;

  label = dispatch_queue_get_label((dispatch_queue_t)a3);
  if (label)
  {
    if (!-[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", label))
    {
      v9 = 0;
      return v9;
    }
    -[VMUTask memoryCache](self->_task, "memoryCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (char *)objc_msgSend(v7, "peekStringAtAddress:", label);

  }
  else
  {
    v8 = 0;
  }
  if (!v8)
    v8 = "";
  if (!strncmp(v8, "com.apple.xpc.anonymous", 0x17uLL))
  {
    v9 = CFSTR("anonymous");
    return v9;
  }
  if (!strstr(v8, ".peer.0x"))
  {
    CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
    Name = (const char *)CSSymbolOwnerGetName();
    if (!Name || (v11 = Name, !strcmp(Name, "CoreFoundation")))
    {
      if (!strncmp(v8, "com.apple.CFNetwork", 0x13uLL))
      {
        v11 = "CFNetwork";
      }
      else if (!strncmp(v8, "com.apple.CF", 0xCuLL))
      {
        v11 = "CoreFoundation";
      }
      else
      {
        if (strncmp(v8, "com.apple.lsd", 0xDuLL))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%s\"), v8, v13);
LABEL_22:
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          return v9;
        }
        v11 = "LaunchServices";
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%s\" (from %s)"), v8, v11);
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (id)labelForOSDispatchQueue:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v6;
  unsigned int v7;
  unint64_t v8;
  id v9;
  void *v10;
  int relative_priority_ptr;

  -[VMUObjectIdentifier labelForOSDispatchMach:length:remoteAddress:](self, "labelForOSDispatchMach:length:remoteAddress:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    relative_priority_ptr = 0;
    HIDWORD(v8) = dispatch_queue_get_qos_class((dispatch_queue_t)a3, &relative_priority_ptr) - 9;
    LODWORD(v8) = HIDWORD(v8);
    v7 = v8 >> 2;
    if (v7 <= 6 && ((0x5Du >> v7) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  QOS %s"), v6, off_1E4E02DA8[v7]);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v6;
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)labelForOSLog:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  unint64_t v7;
  void *v8;
  const char *v9;
  size_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD block[5];

  if (self->_objectContentLevel != 3)
    goto LABEL_10;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__VMUObjectIdentifier_labelForOSLog_length_remoteAddress___block_invoke;
  block[3] = &unk_1E4E01628;
  block[4] = self;
  if (labelForOSLog_length_remoteAddress__onceToken != -1)
    dispatch_once(&labelForOSLog_length_remoteAddress__onceToken, block);
  if (labelForOSLog_length_remoteAddress__libtraceVersion > 0x41A
    || (v7 = *((_QWORD *)a3 + 5), !(v7 >> 28)))
  {
    v7 = *((_QWORD *)a3 + 3);
    if (!(v7 >> 28))
      goto LABEL_10;
  }
  -[VMUTask memoryCache](self->_task, "memoryCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const char *)objc_msgSend(v8, "peekStringAtAddress:", v7 + 4);

  if (!v9)
    goto LABEL_10;
  v10 = strlen(v9);
  -[VMUTask memoryCache](self->_task, "memoryCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "peekStringAtAddress:", v7 + v10 + 5);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%s:%s]"), v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_10:
    v13 = 0;
  }
  return v13;
}

uint64_t __58__VMUObjectIdentifier_labelForOSLog_length_remoteAddress___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isExclaveCore"))
    CSSymbolicatorGetSymbolOwner();
  else
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  result = CSSymbolOwnerGetVersion();
  if (result)
  {
    result = atoi((const char *)result);
    labelForOSLog_length_remoteAddress__libtraceVersion = result;
  }
  return result;
}

- (id)noLabelForOSXPCObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v9;

  if (noLabelForOSXPCObject_length_remoteAddress__onceToken != -1)
    dispatch_once(&noLabelForOSXPCObject_length_remoteAddress__onceToken, &__block_literal_global_258_0);
  if (noLabelForOSXPCObject_length_remoteAddress__shouldGetLabelForAllOSXPCObjects == 1)
  {
    -[VMUObjectIdentifier labelForOSXPCObject:length:remoteAddress:](self, "labelForOSXPCObject:length:remoteAddress:", a3, a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

const char *__66__VMUObjectIdentifier_noLabelForOSXPCObject_length_remoteAddress___block_invoke()
{
  const char *result;

  result = getenv("SYMBOLICATION_LABELS_FOR_ALL_OSXPCOBJECTS");
  if (result)
  {
    result = (const char *)strcmp(result, "YES");
    if (!(_DWORD)result)
      noLabelForOSXPCObject_length_remoteAddress__shouldGetLabelForAllOSXPCObjects = 1;
  }
  return result;
}

- (id)labelForOSXPCDictionary:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v7;
  xpc_connection_t remote_connection;
  xpc_connection_t v9;
  VMUTaskMemoryScanner **p_scanner;
  id v11;
  uint64_t v12;
  id WeakRetained;
  void *v14;

  if (labelForOSXPCDictionary_length_remoteAddress__onceToken != -1)
    dispatch_once(&labelForOSXPCDictionary_length_remoteAddress__onceToken, &__block_literal_global_260);
  if (labelForOSXPCDictionary_length_remoteAddress___xpc_dictionary_get_transaction
    && labelForOSXPCDictionary_length_remoteAddress___xpc_dictionary_get_transaction(a3))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Request/Reply message for active transaction with "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    if (!remote_connection
      || (v9 = remote_connection,
          p_scanner = &self->_scanner,
          v11 = objc_loadWeakRetained((id *)p_scanner),
          v12 = objc_msgSend(v11, "nodeForAddress:", v9),
          v11,
          (_DWORD)v12 == -1))
    {
      objc_msgSend(v7, "appendString:", CFSTR("<unknown connection>"));
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)p_scanner);
      objc_msgSend(WeakRetained, "labelForNode:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "appendString:", v14);
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void *__68__VMUObjectIdentifier_labelForOSXPCDictionary_length_remoteAddress___block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/usr/lib/system/libxpc.dylib", 16);
  if (result)
  {
    v1 = result;
    labelForOSXPCDictionary_length_remoteAddress___xpc_dictionary_get_transaction = (uint64_t (*)(_QWORD))dlsym(result, "_xpc_dictionary_get_transaction");
    return (void *)dlclose(v1);
  }
  return result;
}

- (id)labelForOSXPCObject:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v5;
  void *v6;
  void *v7;

  if (self->_objectContentLevel != 3)
    return 0;
  v5 = xpc_inspect_copy_description();
  if (!v5)
    return 0;
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  free(v6);
  return v7;
}

uint64_t __64__VMUObjectIdentifier_labelForOSXPCObject_length_remoteAddress___block_invoke(uint64_t a1, void *a2, uint64_t a3, size_t a4)
{
  const void *v6;

  v6 = (const void *)(*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
  if (!v6)
    return 1;
  memcpy(a2, v6, a4);
  return 0;
}

- (id)labelForOSTransaction:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v5;
  uint64_t return_address;
  BOOL v10;
  int v11;
  double v12;
  id WeakRetained;
  uint64_t v14;
  unint64_t v15;
  unint64_t description;
  char *v17;
  void *v18;
  unint64_t v19;
  char *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  if (self->_objectContentLevel == 1)
  {
    v5 = 0;
    return v5;
  }
  if (labelForOSTransaction_length_remoteAddress__onceToken != -1)
    dispatch_once(&labelForOSTransaction_length_remoteAddress__onceToken, &__block_literal_global_269);
  if (labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_return_address)
    return_address = labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_return_address(a3);
  else
    return_address = 0;
  if (labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_timestamp)
    v10 = dword_1EE78B58C == 0;
  else
    v10 = 1;
  v11 = !v10;
  v12 = 0.0;
  if (!v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
    v14 = objc_msgSend(WeakRetained, "suspendTimeContinuous");
    if (!v14)
      v14 = mach_continuous_approximate_time();

    v15 = v14 * labelForOSTransaction_length_remoteAddress__info / dword_1EE78B58C;
    v12 = (double)(v15 - labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_timestamp(a3))
        / 1000000000.0;
  }
  if (!labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_description)
  {
    if (self->_objectContentLevel == 3)
    {
      v20 = (char *)os_transaction_copy_description();
      v21 = 1;
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  description = labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_description(a3);
  v17 = (char *)description;
  if (description < (unint64_t)a3
    || (unint64_t)a3 + a4 <= description
    || (v18 = malloc_type_malloc(a4, 0xC1884B20uLL),
        memcpy(v18, a3, a4),
        v19 = labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_description(v18),
        free(v18),
        v17 == (char *)v19))
  {
    if (v17 && -[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", v17))
    {
      -[VMUTask memoryCache](self->_task, "memoryCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (char *)objc_msgSend(v22, "peekStringAtAddress:", v17);

      v21 = 0;
      goto LABEL_33;
    }
LABEL_32:
    v21 = 0;
    v20 = 0;
    goto LABEL_33;
  }
  v20 = 0;
  v21 = 0;
  if ((unint64_t)v18 <= v19 && (unint64_t)v18 + a4 > v19)
  {
    v21 = 0;
    if (self->_objectContentLevel == 3)
      v20 = v17;
    else
      v20 = 0;
  }
LABEL_33:
  if (return_address)
    v23 = v11;
  else
    v23 = 0;
  if (v23 != 1)
  {
    if (v11)
    {
      v27 = "";
      if (v20)
        v27 = v20;
      v28 = 3;
      if (self->_objectContentLevel != 3)
        v28 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%.*f seconds] %s"), v28, *(_QWORD *)&v12, v27);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v20)
      {
        v5 = 0;
        if (!v21)
          return v5;
        goto LABEL_52;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v29;
    if (!v21)
      return v5;
LABEL_52:
    free(v20);
    return v5;
  }
  -[VMUObjectIdentifier symbolForRemoteAddress:](self, "symbolForRemoteAddress:", return_address - 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = "";
  if (v20)
    v25 = v20;
  v26 = 3;
  if (self->_objectContentLevel != 3)
    v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%.*f seconds] \"%s\"  Created at: %@"), v26, *(_QWORD *)&v12, v25, v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    goto LABEL_52;
  return v5;
}

void *__66__VMUObjectIdentifier_labelForOSTransaction_length_remoteAddress___block_invoke()
{
  void *result;
  void *v1;

  mach_timebase_info((mach_timebase_info_t)&labelForOSTransaction_length_remoteAddress__info);
  result = dlopen("/usr/lib/system/libxpc.dylib", 16);
  if (result)
  {
    v1 = result;
    labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_timestamp = (uint64_t (*)(_QWORD))dlsym(result, "os_transaction_get_timestamp");
    labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_description = (uint64_t (*)(_QWORD))dlsym(v1, "os_transaction_get_description");
    labelForOSTransaction_length_remoteAddress___vmu_os_transaction_get_return_address = (uint64_t (*)(_QWORD))dlsym(v1, "os_transaction_get_ra");
    return (void *)dlclose(v1);
  }
  return result;
}

- (id)labelFor_NSActivityAssertion:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForNSCFStringAtRemoteAddress:printDetail:](self, "labelForNSCFStringAtRemoteAddress:printDetail:", *((_QWORD *)a3 + 2), 0, a5);
}

- (id)labelFor_RBSAssertionDescriptor:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;

  if (a4 < 0x20)
    return 0;
  -[VMUObjectIdentifier labelForNSCFStringAtRemoteAddress:printDetail:](self, "labelForNSCFStringAtRemoteAddress:printDetail:", *((_QWORD *)a3 + 3), 0, a5, v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_findOffsetsInOSXPCConnection:(void *)a3 length:(unint64_t)a4
{
  BOOL v4;
  VMUTaskMemoryScanner **p_scanner;
  unsigned int i;
  unint64_t v10;
  id WeakRetained;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  unint64_t v18;

  if (self->_osDispatchMachOffsetInOSXPCConnection)
    v4 = 0;
  else
    v4 = a4 >= 0x10;
  if (v4)
  {
    p_scanner = &self->_scanner;
    for (i = 24; ; i += 8)
    {
      v10 = *(_QWORD *)((char *)a3 + i - 16);
      if (HIDWORD(v10) && (*(_QWORD *)((_BYTE *)a3 + i - 16) & 7) == 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)p_scanner);
        v13 = objc_msgSend(WeakRetained, "nodeForAddress:", v10);

        if ((_DWORD)v13 != -1)
        {
          v14 = objc_loadWeakRetained((id *)p_scanner);
          v15 = v14;
          if (v14)
            objc_msgSend(v14, "nodeDetails:", v13);

          objc_msgSend(0, "className");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("OS_dispatch_mach"));

          if ((v17 & 1) != 0)
            break;
        }
      }
      v18 = i;
      if (v18 > a4)
        return;
    }
    self->_osDispatchMachOffsetInOSXPCConnection = i - 16;
  }
}

- (id)labelForOSXPCConnection:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t osDispatchMachOffsetInOSXPCConnection;
  __CFString *v9;
  uint64_t pid;
  uint64_t v11;
  NSMutableDictionary *pidToProcessNameDict;
  void *v13;
  __CFString *v14;
  VMUProcInfo *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;

  osDispatchMachOffsetInOSXPCConnection = self->_osDispatchMachOffsetInOSXPCConnection;
  if (!(_DWORD)osDispatchMachOffsetInOSXPCConnection
    && (-[VMUObjectIdentifier _findOffsetsInOSXPCConnection:length:](self, "_findOffsetsInOSXPCConnection:length:", a3, a4, a5), osDispatchMachOffsetInOSXPCConnection = self->_osDispatchMachOffsetInOSXPCConnection, !(_DWORD)osDispatchMachOffsetInOSXPCConnection)|| (-[VMUObjectIdentifier labelForObjectOfClass:atOffset:ofObject:withLength:](self, "labelForObjectOfClass:atOffset:ofObject:withLength:", CFSTR("OS_dispatch_mach"), osDispatchMachOffsetInOSXPCConnection, a3, a4), (v9 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = CFSTR("<couldn't read name>");
  }
  pid = xpc_connection_get_pid((xpc_connection_t)a3);
  if ((_DWORD)pid)
  {
    v11 = pid;
    pidToProcessNameDict = self->_pidToProcessNameDict;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", pid);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](pidToProcessNameDict, "objectForKeyedSubscript:", v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = -[VMUProcInfo initWithPid:]([VMUProcInfo alloc], "initWithPid:", v11);
      -[VMUProcInfo name](v15, "name");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = CFSTR("<unknown>");
      if (v16)
        v18 = (__CFString *)v16;
      v14 = v18;

      v19 = self->_pidToProcessNameDict;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v14, v20);

    }
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = objc_retainAutorelease(v14);
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ pid %u [%s]"), v9, v11, -[__CFString UTF8String](v22, "UTF8String"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR(" [no process]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)labelForOSXPCActivity:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = *((_QWORD *)a3 + 3);
  if (v5
    && -[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", *((_QWORD *)a3 + 3), a4, a5)
    && (-[VMUTask memoryCache](self->_task, "memoryCache"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "peekStringAtAddress:", v5),
        v7,
        v8))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)labelForProtocol:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v7 = *((_QWORD *)a3 + 10);
  if (v7)
  {
    if (-[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", *((_QWORD *)a3 + 10), a4, a5))
    {
      -[VMUTask memoryCache](self->_task, "memoryCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "peekStringAtAddress:", v7);

      if (v9)
        goto LABEL_7;
    }
  }
  v10 = *((_QWORD *)a3 + 1);
  if (v10
    && -[VMUObjectIdentifier _remoteAddressIsOKtoRead:](self, "_remoteAddressIsOKtoRead:", v10, a4, a5)
    && (-[VMUTask memoryCache](self->_task, "memoryCache"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v11, "peekStringAtAddress:", v10),
        v11,
        v9))
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)labelForNSXPCInterface:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = (id)objc_msgSend(a3, "protocol");
  if (v6)
  {
    -[VMUObjectIdentifier labelForMallocBlock:](self, "labelForMallocBlock:", v6, 88);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Protocol: %@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)labelForNSXPCConnection:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t block;
  uint64_t v25;
  ptrdiff_t (*v26)(uint64_t);
  void *v27;
  void *v28;

  block = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __68__VMUObjectIdentifier_labelForNSXPCConnection_length_remoteAddress___block_invoke;
  v27 = &__block_descriptor_40_e5_v8__0l;
  v28 = a3;
  if (labelForNSXPCConnection_length_remoteAddress__onceToken != -1)
    dispatch_once(&labelForNSXPCConnection_length_remoteAddress__onceToken, &block);
  v7 = *(_QWORD *)((char *)a3 + labelForNSXPCConnection_length_remoteAddress__offsetOfRemoteObjectInterface);
  v8 = (objc_class *)objc_opt_class();
  -[VMUObjectIdentifier labelForMallocBlock:](self, "labelForMallocBlock:", v7, class_getInstanceSize(v8));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)((char *)a3 + labelForNSXPCConnection_length_remoteAddress__offsetOfConnection);
  WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);

  if (!WeakRetained
    || (v12 = objc_loadWeakRetained((id *)&self->_scanner),
        v13 = objc_msgSend(v12, "nodeForAddress:", v10),
        v12,
        (_DWORD)v13 == -1))
  {
    v17 = 0;
  }
  else
  {
    v14 = objc_loadWeakRetained((id *)&self->_scanner);
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "nodeDetails:", v13);
      v16 = v22 & 0xFFFFFFFFFFFFFFFLL;
    }
    else
    {
      v16 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
    }

    -[VMUObjectIdentifier labelForMallocBlock:](self, "labelForMallocBlock:", v10, v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  if (v9 | v17)
  {
    if (!v9)
      v9 = (uint64_t)CFSTR("Protocol: <couldn't read name>");
    if (v17)
      v18 = (__CFString *)v17;
    else
      v18 = &stru_1E4E04720;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  Connection: %@"), v9, v18, v21, v22, v23, block, v25, v26, v27, v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  return v19;
}

ptrdiff_t __68__VMUObjectIdentifier_labelForNSXPCConnection_length_remoteAddress___block_invoke(uint64_t a1)
{
  objc_class *Class;
  objc_ivar *InstanceVariable;
  objc_ivar *v3;
  objc_ivar *v4;
  ptrdiff_t result;

  Class = object_getClass(*(id *)(a1 + 32));
  InstanceVariable = class_getInstanceVariable(Class, "_connection");
  labelForNSXPCConnection_length_remoteAddress__offsetOfConnection = ivar_getOffset(InstanceVariable);
  if (!labelForNSXPCConnection_length_remoteAddress__offsetOfConnection)
  {
    v3 = class_getInstanceVariable(Class, "_xconnection");
    labelForNSXPCConnection_length_remoteAddress__offsetOfConnection = ivar_getOffset(v3);
  }
  v4 = class_getInstanceVariable(Class, "_remoteObjectInterface");
  result = ivar_getOffset(v4);
  labelForNSXPCConnection_length_remoteAddress__offsetOfRemoteObjectInterface = result;
  return result;
}

- (id)labelFor__NSMallocBlock__:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier symbolForRemoteAddress:](self, "symbolForRemoteAddress:", -[VMUTask ptrauthStripDataPointer:]((uint64_t)self->_task, *((_QWORD *)a3 + 2)));
}

- (id)symbolForRemoteAddress:(unint64_t)a3
{
  void *v4;
  uint64_t Name;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t BaseAddress;
  __CFString *v10;
  uint64_t Path;

  CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
  if ((CSIsNull() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    Name = CSSymbolOwnerGetName();
    if (Name)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("<unknown-binary>");
    }
    CSSymbolOwnerGetSymbolWithAddress();
    if ((CSIsNull() & 1) != 0
      || (v7 = CSSymbolGetName()) == 0
      || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7),
          (v8 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      BaseAddress = CSSymbolOwnerGetBaseAddress();
      if (BaseAddress)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown-symbol> %#qx + %qu"), BaseAddress, a3 - BaseAddress);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = CFSTR("???");
      }
    }
    CSSymbolOwnerGetSourceInfoWithAddress();
    if ((CSIsNull() & 1) != 0)
    {
      v10 = &stru_1E4E04720;
    }
    else
    {
      Path = CSSourceInfoGetPath();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %s:%u"), Path, CSSourceInfoGetLineNumber());
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  %@  %#qx%@"), v6, v8, a3, v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)labelForClassDataRO:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v5;

  if (self->_objectContentLevel == 3)
  {
    VMUGetClassNameFromClassDataRO(self->_task, self->_memoryReader, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)labelForClassDataRW:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v5;

  if (self->_objectContentLevel == 3)
  {
    VMUGetClassNameFromClassDataRW(self->_task, self->_memoryReader, self->_objcABI, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)labelForClassDataExtRW:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v5;

  if (self->_objectContentLevel == 3)
  {
    VMUGetClassNameFromClassDataExtRW(self->_task, self->_memoryReader, self->_objcABI, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)labelForClassStructure:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  void *v7;

  if (self->_objectContentLevel == 3)
  {
    VMUGetClassNameFromClassStructure(self->_task, self->_memoryReader, self->_objcABI, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      VMUGetClassNameFromClassStructure(self->_task, self->_memoryReader, self->_objcABI, a5 + 16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)labelForMallocBlock:(_VMURange)a3
{
  unsigned int objectContentLevel;
  const __CFString *v4;
  __CFString *v5;

  if (a3.location == self->_cfBooleanTrueAddress)
  {
    objectContentLevel = self->_objectContentLevel;
    v4 = CFSTR("YES");
  }
  else
  {
    if (a3.location != self->_cfBooleanFalseAddress)
    {
      -[VMUObjectIdentifier labelForMallocBlock:usingHandlerBlock:](self, "labelForMallocBlock:usingHandlerBlock:", a3.location, a3.length, 0);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    objectContentLevel = self->_objectContentLevel;
    v4 = CFSTR("NO");
  }
  if (objectContentLevel == 3)
    v5 = (__CFString *)v4;
  else
    v5 = 0;
  return v5;
}

- (id)labelForMallocBlock:(_VMURange)a3 usingHandlerBlock:(id)a4
{
  size_t length;
  unint64_t location;
  _QWORD *memoryReader;
  uint64_t (*v8)(_QWORD *, unint64_t, size_t);
  id v9;
  unsigned __int8 *v10;
  void *v11;

  length = a3.length;
  location = a3.location;
  memoryReader = self->_memoryReader;
  v8 = (uint64_t (*)(_QWORD *, unint64_t, size_t))memoryReader[2];
  v9 = a4;
  v10 = (unsigned __int8 *)v8(memoryReader, location, length);
  -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:usingHandlerBlock:]((uint64_t)self, v10, length, location, 0, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)labelForMemory:(size_t)a3 length:(uint64_t)a4 remoteAddress:(void *)a5 classInfo:(void *)a6 usingHandlerBlock:
{
  id v11;
  void (**v12)(id, id, unsigned __int8 *, size_t, _QWORD);
  void *v13;
  void *v14;
  id v15;
  id v16;
  id *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unsigned __int8 *v31;
  const void *v33;
  _QWORD *v34;
  unsigned __int8 *v35;
  void *v36;
  unsigned int v37;

  v11 = a5;
  v12 = a6;
  v13 = 0;
  if (a1 && a2)
  {
    if ((*(_DWORD *)(a1 + 180) & 0xFFFFFFFE) == 2)
    {
      v14 = (void *)MEMORY[0x1A85A9758]();
      if (!*(_QWORD *)(a1 + 320))
        objc_msgSend((id)a1, "buildIsaToObjectLabelHandlerMap");
      if (objc_msgSend(v11, "remoteIsa"))
      {
        v15 = v11;
      }
      else
      {
        objc_msgSend((id)a1, "classInfoForMemory:length:remoteAddress:", a2, a3, a4);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v15;
      if (v15)
      {
        if (objc_msgSend(v15, "instanceSize") > a3)
        {
LABEL_12:
          v13 = 0;
LABEL_55:

LABEL_62:
          objc_autoreleasePoolPop(v14);
          goto LABEL_63;
        }
        if (!v11)
          goto LABEL_38;
        goto LABEL_22;
      }
      if (!v11)
        goto LABEL_29;
      v17 = *(id **)(a1 + 232);
      if (v17)
      {
        if (*v17 == v11 || v17[1] == v11)
        {
          objc_msgSend((id)a1, "labelForClassStructure:length:remoteAddress:", a2, a3, a4);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        if (v17[2] == v11)
        {
          objc_msgSend((id)a1, "labelForClassDataRW:length:remoteAddress:", a2, a3, a4);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        if (v17[3] == v11)
        {
          objc_msgSend((id)a1, "labelForClassDataExtRW:length:remoteAddress:", a2, a3, a4);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        if (v17[5] == v11)
        {
          objc_msgSend((id)a1, "labelForClassDataRO:length:remoteAddress:", a2, a3, a4);
          v18 = objc_claimAutoreleasedReturnValue();
LABEL_34:
          v13 = (void *)v18;
          goto LABEL_55;
        }
      }
LABEL_22:
      v36 = v14;
      if (v16 != v11)
      {
        objc_msgSend(v11, "className");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19
          && ((objc_msgSend(v19, "hasSuffix:", CFSTR(" (malloc)")) & 1) != 0
           || (objc_msgSend(v20, "hasSuffix:", CFSTR(" (char[])")) & 1) != 0
           || (objc_msgSend(v11, "isDerivedFromStackBacktrace") & 1) != 0))
        {

          if (v16)
          {
            v11 = 0;
            goto LABEL_38;
          }
LABEL_29:
          if (!objc_msgSend((id)a1, "_remoteAddressIsOKtoRead:", a4))
          {
            v13 = 0;
LABEL_60:
            v26 = 0;
            v11 = 0;
            goto LABEL_61;
          }
          v37 = 0;
          stringFromBytes(a2, a3, (int *)&v37);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend((id)a1, "uniquifyStringLabel:stringType:printDetail:", v21, v37, 1);
            v22 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (!objc_msgSend((id)a1, "isTaggedPointer:", a2))
            {
              v13 = 0;
              goto LABEL_59;
            }
            objc_msgSend((id)a1, "labelForTaggedPointer:", a2);
            v22 = objc_claimAutoreleasedReturnValue();
          }
          v13 = (void *)v22;
LABEL_59:

          goto LABEL_60;
        }
        objc_msgSend(v16, "className");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v20, "isEqualToString:", v23);

        if (!v24)
        {
          v13 = 0;
          v14 = v36;
          goto LABEL_55;
        }
      }
      if (!v16)
      {
        v13 = 0;
        v26 = 0;
        v14 = v36;
        goto LABEL_61;
      }
      v14 = v36;
LABEL_38:
      if (objc_msgSend(v16, "isCoreMediaFigObject"))
      {
        objc_msgSend((id)a1, "labelForCoreMediaFigObject:length:remoteAddress:", a2, a3, a4);
        v25 = objc_claimAutoreleasedReturnValue();
LABEL_42:
        v13 = (void *)v25;
        v26 = 0;
LABEL_61:

        goto LABEL_62;
      }
      if (*(_BYTE *)(a1 + 68))
      {
        objc_msgSend(*(id *)(a1 + 456), "labelForDriverKitMemory:length:remoteAddress:class:", a2, a3, a4, v16);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_42;
      }
      v27 = objc_msgSend(v16, "remoteIsa");
      -[VMUObjectIdentifier objectLabelHandlerForRemoteIsa:]((_QWORD *)a1, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (_QWORD *)v28;
      if (v28)
      {
        v30 = *(_QWORD *)(v28 + 16);
        if (v30)
        {
          if (v27 == v30 && (!*(_BYTE *)(a1 + 288) || *(_QWORD *)a2 == v27))
          {
            v35 = 0;
          }
          else
          {
            if (labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock__onceToken != -1)
              dispatch_once(&labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock__onceToken, &__block_literal_global_317);
            v31 = (unsigned __int8 *)((uint64_t (*)(_QWORD, size_t))labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock__located_class_createInstance)(v29[2], a3 - objc_msgSend(v16, "instanceSize"));
            if (!v31)
              goto LABEL_53;
            v35 = v31;
            if (malloc_size(v31) < a3)
              goto LABEL_53;
            v33 = a2 + 8;
            a2 = v35;
            memcpy(v35 + 8, v33, a3 - 8);
          }
        }
        else
        {
          v35 = 0;
        }
        v34 = v29;
        v26 = v34;
        if (v12)
          v12[2](v12, v34, a2, a3, a4);
        else
          objc_msgSend((id)a1, (SEL)v34[3], a2, a3, a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
          free(v35);

        goto LABEL_61;
      }
LABEL_53:

      goto LABEL_12;
    }
    v13 = 0;
  }
LABEL_63:

  return v13;
}

- (id)labelForObjectOfClass:(id)a3 atOffset:(unsigned int)a4 ofObject:(void *)a5 withLength:(unint64_t)a6
{
  id v10;
  uint64_t v11;
  id WeakRetained;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  VMUObjectIdentifier *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v10 = a3;
  if ((unint64_t)a4 + 8 > a6)
    goto LABEL_10;
  v11 = *(_QWORD *)((char *)a5 + a4);
  if (!v11)
    goto LABEL_10;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);

  if (!WeakRetained)
    goto LABEL_10;
  v13 = objc_loadWeakRetained((id *)&self->_scanner);
  v14 = objc_msgSend(v13, "nodeForAddress:", v11);

  if ((_DWORD)v14 == -1)
    goto LABEL_10;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v15 = objc_loadWeakRetained((id *)&self->_scanner);
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "nodeDetails:", v14);
  }
  else
  {
    v23 = 0;
    v24 = 0;
    v25 = 0;
  }

  v17 = v24 & 0xFFFFFFFFFFFFFFFLL;
  if ((v24 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __74__VMUObjectIdentifier_labelForObjectOfClass_atOffset_ofObject_withLength___block_invoke;
    v20[3] = &unk_1E4E02CB0;
    v21 = v10;
    v22 = self;
    -[VMUObjectIdentifier labelForMallocBlock:usingHandlerBlock:](self, "labelForMallocBlock:usingHandlerBlock:", v11, v17, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_10:
    v18 = 0;
  }

  return v18;
}

id __74__VMUObjectIdentifier_labelForObjectOfClass_atOffset_ofObject_withLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9;
  void *v10;

  v9 = a2;
  if (objc_msgSend(*((id *)v9 + 1), "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), *((SEL *)v9 + 3), a3, a4, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void *__87__VMUObjectIdentifier_labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock___block_invoke()
{
  void *result;

  result = dlsym((void *)0xFFFFFFFFFFFFFFFFLL, "class_createInstance");
  labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock__located_class_createInstance = result;
  return result;
}

- (id)labelForMemory:(void *)a3 length:(unint64_t)a4
{
  return -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:usingHandlerBlock:]((uint64_t)self, (unsigned __int8 *)a3, a4, 0, 0, 0);
}

- (id)labelForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  return -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:usingHandlerBlock:]((uint64_t)self, (unsigned __int8 *)a3, a4, a5, 0, 0);
}

- (id)labelForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5 classInfo:(id)a6
{
  return -[VMUObjectIdentifier labelForMemory:length:remoteAddress:classInfo:usingHandlerBlock:]((uint64_t)self, (unsigned __int8 *)a3, a4, a5, a6, 0);
}

- (_CSTypeRef)_symbolicator
{
  unint64_t opaque_2;
  unint64_t opaque_1;
  _CSTypeRef result;

  opaque_2 = self->_symbolicator._opaque_2;
  opaque_1 = self->_symbolicator._opaque_1;
  result._opaque_2 = opaque_2;
  result._opaque_1 = opaque_1;
  return result;
}

- (id)_scanner
{
  return objc_loadWeakRetained((id *)&self->_scanner);
}

- (BOOL)_dlopenLibSwiftRemoteMirrorFromDir:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *libSwiftRemoteMirrors;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4
    || (v27 = 0u,
        v28 = 0u,
        v25 = 0u,
        v26 = 0u,
        (v5 = objc_msgSend(&unk_1E4E20760, "countByEnumeratingWithState:objects:count:", &v25, v29, 16)) == 0))
  {
    v7 = 0;
    goto LABEL_26;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v26;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(&unk_1E4E20760);
      objc_msgSend(v4, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v9));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      libSwiftRemoteMirrors = self->_libSwiftRemoteMirrors;
      if (libSwiftRemoteMirrors)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](libSwiftRemoteMirrors, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          goto LABEL_9;
      }
      v13 = objc_retainAutorelease(v10);
      v14 = (const char *)objc_msgSend(v13, "UTF8String");
      if (v14)
      {
        v15 = v14;
        if (access(v14, 4))
        {
          if (self->_debugSwiftRemoteMirror)
          {
            v24 = *__error();
            NSLog(CFSTR("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Unable to access %@ with errno: %d"), v13, v24);
          }
        }
        else
        {
          v16 = dlopen(v15, 1);
          if (v16)
          {
            v17 = v16;
            if (!self->_libSwiftRemoteMirrors)
            {
              v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
              v19 = self->_libSwiftRemoteMirrors;
              self->_libSwiftRemoteMirrors = v18;

            }
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_libSwiftRemoteMirrors, "setObject:forKeyedSubscript:", v20, v13);

            if (self->_debugSwiftRemoteMirror)
              NSLog(CFSTR("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Successfully dlopened %@"), v13);
LABEL_9:
            v7 = 1;
            goto LABEL_14;
          }
          if (self->_debugSwiftRemoteMirror)
            NSLog(CFSTR("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Failed to dlopen %@"), v13, v23);
        }
      }
LABEL_14:

      ++v9;
    }
    while (v6 != v9);
    v21 = objc_msgSend(&unk_1E4E20760, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    v6 = v21;
  }
  while (v21);
LABEL_26:

  return v7 & 1;
}

- (BOOL)_dlopenLibSwiftRemoteMirrorNearLibSwiftCore
{
  BOOL v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  CSSymbolicatorForeachSymbolOwnerWithNameAtTime();
  v2 = *((_DWORD *)v5 + 6) == *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v8, 8);
  return v2;
}

void __66__VMUObjectIdentifier__dlopenLibSwiftRemoteMirrorNearLibSwiftCore__block_invoke(uint64_t a1)
{
  uint64_t Path;
  void *v3;
  void *v4;
  char v5;
  id *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  Path = CSSymbolOwnerGetPath();
  if (Path)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Path);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByDeletingLastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("/usr/lib/swift"));
      v6 = *(id **)(a1 + 32);
      if ((v5 & 1) != 0)
      {
        if ((objc_msgSend(v6, "_dlopenLibSwiftRemoteMirrorFromDir:", v4) & 1) == 0)
        {
          v7 = (void *)MEMORY[0x1E0CB3940];
          v14[0] = CFSTR("/System/Cryptexes/OS/");
          v14[1] = v4;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
          v8 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "pathWithComponents:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v8) = objc_msgSend(*(id *)(a1 + 32), "_dlopenLibSwiftRemoteMirrorFromDir:", v9);
          if ((v8 & 1) == 0)
            goto LABEL_19;
        }
        goto LABEL_18;
      }
      WeakRetained = objc_loadWeakRetained(v6 + 7);
      objc_msgSend(WeakRetained, "executablePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByDeletingLastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && objc_msgSend(v12, "length"))
      {
        if (!objc_msgSend(v4, "hasPrefix:", v12))
        {

          if ((objc_msgSend(*(id *)(a1 + 32), "_dlopenLibSwiftRemoteMirrorFromDir:", v4) & 1) == 0)
          {
            objc_msgSend(v4, "stringByDeletingLastPathComponent");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
            {
              v4 = 0;
              goto LABEL_19;
            }
            if ((objc_msgSend(*(id *)(a1 + 32), "_dlopenLibSwiftRemoteMirrorFromDir:", v13) & 1) != 0)
            {
              v4 = v13;
            }
            else
            {
              objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("Resources"));
              v4 = (void *)objc_claimAutoreleasedReturnValue();

              if (!objc_msgSend(*(id *)(a1 + 32), "_dlopenLibSwiftRemoteMirrorFromDir:", v4))
                goto LABEL_19;
            }
          }
LABEL_18:
          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          goto LABEL_19;
        }
        NSLog(&CFSTR("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: libswiftCore is in App bundle. Its corresponding remote mirror m"
                     "ay not be in the trust cache. Skipping.").isa);
      }

    }
LABEL_19:

  }
}

- (BOOL)_dlopenLibSwiftRemoteMirrorNearExecutable
{
  id WeakRetained;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scanner);
  objc_msgSend(WeakRetained, "executablePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "stringByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (-[VMUObjectIdentifier _dlopenLibSwiftRemoteMirrorFromDir:](self, "_dlopenLibSwiftRemoteMirrorFromDir:", v5))
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(v5, "stringByDeletingLastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Resources"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = -[VMUObjectIdentifier _dlopenLibSwiftRemoteMirrorFromDir:](self, "_dlopenLibSwiftRemoteMirrorFromDir:", v5);
        }
        else
        {
          v6 = 0;
          v5 = 0;
        }
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

- (BOOL)_dlopenLibSwiftRemoteMirror
{
  BOOL v4;
  DIR *v5;
  DIR *v6;
  BOOL v7;
  dirent *v8;
  char *d_name;
  void *v10;
  void *v11;
  void *v12;

  if (-[VMUTask isExclave](self->_task, "isExclave"))
    return -[VMUObjectIdentifier _dlopenLibSwiftRemoteMirrorFromDir:](self, "_dlopenLibSwiftRemoteMirrorFromDir:", CFSTR("/usr/lib/swift"));
  if (-[VMUObjectIdentifier _dlopenLibSwiftRemoteMirrorNearLibSwiftCore](self, "_dlopenLibSwiftRemoteMirrorNearLibSwiftCore"))
  {
    return 1;
  }
  if (access("/Developer/usr/lib/swift", 5))
    return 0;
  v5 = opendir("/Developer/usr/lib/swift");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  do
  {
    v8 = readdir(v6);
    v4 = v8 != 0;
    if (!v8)
      break;
    if (v8->d_type == 4)
    {
      d_name = v8->d_name;
      if (v8->d_name[0] != 46)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Developer/usr/lib/swift");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", d_name);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = -[VMUObjectIdentifier _dlopenLibSwiftRemoteMirrorFromDir:](self, "_dlopenLibSwiftRemoteMirrorFromDir:", v12);
      }
    }
  }
  while (!v7);
  closedir(v6);
  return v4;
}

- (int)_populateSwiftReflectionInfo:(SwiftReflectionInteropContext *)a3
{
  int v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[VMUTask createSymbolicatorWithFlags:andNotification:](self->_task, "createSymbolicatorWithFlags:andNotification:", CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData(), 0);
  CSSymbolicatorForeachSymbolOwnerAtTime();
  CSRelease();
  v3 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __52__VMUObjectIdentifier__populateSwiftReflectionInfo___block_invoke(uint64_t a1)
{
  unint64_t BaseAddress;
  uint64_t result;

  BaseAddress = CSSymbolOwnerGetBaseAddress();
  result = vmu_swift_reflection_addImage(*(int **)(a1 + 40), BaseAddress);
  if ((_DWORD)result)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)_populateSwiftABIVariables
{
  uint64_t *swiftMirror;
  uint64_t v4;
  uint64_t SymbolOwner;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore"))
  {
    swiftMirror = (uint64_t *)self->_swiftMirror;
    v4 = 2;
LABEL_8:
    swiftMirror[1] = v4;
    goto LABEL_10;
  }
  if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore"))
    SymbolOwner = CSSymbolicatorGetSymbolOwner();
  else
    SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  v7 = SymbolOwner;
  v8 = v6;
  if ((CSIsNull() & 1) != 0)
  {
    swiftMirror = (uint64_t *)self->_swiftMirror;
    v4 = 1;
    goto LABEL_8;
  }
  _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"_objc_debug_swift_stable_abi_bit", v7, v8, 8uLL, &self->_swiftMirror->var1);
  swiftMirror = (uint64_t *)self->_swiftMirror;
LABEL_10:
  if (*swiftMirror)
    vmu_swift_reflection_interop_setClassIsSwiftMask(*swiftMirror, swiftMirror[1]);
}

- (void)loadSwiftReflectionLibraries
{
  char *v3;
  const char *v4;
  char *v5;
  int v6;
  int *ReflectionContext;
  uint64_t v8;
  NSMutableDictionary *libSwiftRemoteMirrors;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t SymbolOwner;
  uint64_t v12;
  uint64_t v13;
  libSwiftRemoteMirrorWrapper *swiftMirror;
  _QWORD v15[5];
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  _CSTypeRef symbolicator;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  int v26;
  uint64_t v27;
  id v28;
  id v29;

  v3 = getenv("SYMBOLICATION_NO_SWIFT_REMOTE_MIRROR");
  if (!v3 || (v4 = v3, strcmp(v3, "YES")) && strcmp(v4, "1"))
  {
    v5 = getenv("SYMBOLICATION_LOG_SWIFT_REMOTE_MIRROR_MEMORY_READS");
    if (v5)
      v6 = atoi(v5);
    else
      v6 = 0;
    symbolicator = self->_symbolicator;
    v22 = MEMORY[0x1A85A995C](self->_memoryReader);
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 259);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 1282);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v27 = 0;
    v26 = v6;
    objc_initWeak(&v28, self);
    objc_copyWeak(&v29, (id *)&self->_scanner);
    __copy_assignment_8_8_t0w16_sb16_s24_s32_t40w16_w56_w64((uint64_t)&self->_swiftMirrorReaderContext, (uint64_t)&symbolicator);
    ReflectionContext = (int *)vmu_swift_reflection_createReflectionContext((uint64_t)&self->_swiftMirrorReaderContext, (uint64_t)_query_data_layout_function, 0, (uint64_t)_read_bytes_function, (uint64_t)_get_string_length, (uint64_t)_get_symbol_address);
    v8 = MEMORY[0x1E0C809B0];
    if (ReflectionContext)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 0;
      -[VMUObjectIdentifier _dlopenLibSwiftRemoteMirror](self, "_dlopenLibSwiftRemoteMirror");
      libSwiftRemoteMirrors = self->_libSwiftRemoteMirrors;
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __51__VMUObjectIdentifier_loadSwiftReflectionLibraries__block_invoke;
      v16[3] = &unk_1E4E02D28;
      v16[5] = &v17;
      v16[6] = ReflectionContext;
      v16[4] = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](libSwiftRemoteMirrors, "enumerateKeysAndObjectsUsingBlock:", v16);
      if (!*((_DWORD *)v18 + 6))
      {
        vmu_swift_reflection_destroyReflectionContext(ReflectionContext);
        ReflectionContext = 0;
      }
      _Block_object_dispose(&v17, 8);
      if (ReflectionContext
        && !-[VMUObjectIdentifier _populateSwiftReflectionInfo:](self, "_populateSwiftReflectionInfo:", ReflectionContext))
      {
        vmu_swift_reflection_destroyReflectionContext(ReflectionContext);
        ReflectionContext = 0;
      }
    }
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __51__VMUObjectIdentifier_loadSwiftReflectionLibraries__block_invoke_2;
    v15[3] = &unk_1E4E01F38;
    v15[4] = self;
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85A995C](v15);
    if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore"))
    {
      SymbolOwner = CSSymbolicatorGetSymbolOwner();
    }
    else
    {
      CSSymbolicatorForeachSymbolOwnerWithNameAtTime();
      SymbolOwner = CSSymbolicatorGetAOutSymbolOwner();
    }
    v10[2](v10, SymbolOwner, v12);
    -[VMUObjectIdentifier _loadSwiftAsyncTaskAndSlabRecognitionInfo](self, "_loadSwiftAsyncTaskAndSlabRecognitionInfo");
    if (ReflectionContext)
    {
      v13 = vmu_swift_reflection_interop_typeRefForMangledTypeName((uint64_t)ReflectionContext, (uint64_t)"_$sBb", 5);
      swiftMirror = self->_swiftMirror;
      if (v13)
        swiftMirror->var2 = v13;
      else
        swiftMirror->var2 = 0;
    }
    else
    {
      swiftMirror = self->_swiftMirror;
    }
    swiftMirror->var0 = (SwiftReflectionInteropContext *)ReflectionContext;

    __destructor_8_sb16_s24_s32_w56_w64((id *)&symbolicator);
  }
}

void __51__VMUObjectIdentifier_loadSwiftReflectionLibraries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (vmu_swift_reflection_interop_addLibrary(*(_QWORD **)(a1 + 48), (void *)objc_msgSend(a3, "pointerValue")))
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 176))
      NSLog(CFSTR("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Loaded Swift Remote Mirror from %@"), v5);
  }
  else if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 176))
  {
    NSLog(CFSTR("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: swift_reflection_interop_addLibrary failed for %@"), v5);
  }

}

void __51__VMUObjectIdentifier_loadSwiftReflectionLibraries__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Path;
  const char *v7;
  VMUSwiftRuntimeInfo *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  VMUSwiftRuntimeInfo *obj;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 176))
  {
    Path = CSSymbolOwnerGetPath();
    v7 = "<unavailable>";
    if (Path)
      v7 = (const char *)Path;
    NSLog(CFSTR("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: loading info for Swift runtime at %s"), v7);
  }
  v8 = -[VMUSwiftRuntimeInfo initWithSwiftCore:memoryReader:task:]([VMUSwiftRuntimeInfo alloc], "initWithSwiftCore:memoryReader:task:", a2, a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  if (v8)
  {
    obj = v8;
    v9 = -[VMUSwiftRuntimeInfo runtimeHasStableABI](v8, "runtimeHasStableABI");
    v10 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      if (*(_QWORD *)(v10 + 160))
      {
        v8 = obj;
        if (*(_BYTE *)(v10 + 176))
        {
          NSLog(CFSTR("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Runtime with stable ABI has already been loaded, ignoring this other one."), obj);
LABEL_14:
          v8 = obj;
        }
      }
      else
      {
        objc_storeStrong((id *)(v10 + 160), obj);
        v8 = obj;
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 176))
        {
          NSLog(CFSTR("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Runtime with stable ABI has been loaded"), v12);
          goto LABEL_14;
        }
      }
    }
    else
    {
      objc_storeStrong((id *)(v10 + 168), obj);
      v8 = obj;
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 176))
      {
        NSLog(CFSTR("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: Runtime pre-dating the stable ABI has been loaded"), v11);
        goto LABEL_14;
      }
    }
  }

}

- (void)_loadSwiftAsyncTaskAndSlabRecognitionInfo
{
  char *v3;
  const char *v4;
  uint64_t SymbolOwner;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  _DWORD *Range;
  unint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;

  v3 = getenv("DT_SKIP_PRECISE_SCANNING_SWIFT_ASYNC_ALLOCATIONS");
  if (!v3 || (v4 = v3, strcmp(v3, "YES")) && strcmp(v4, "1"))
  {
    if (-[VMUTask isExclaveCore](self->_task, "isExclaveCore"))
      SymbolOwner = CSSymbolicatorGetSymbolOwner();
    else
      SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    v7 = SymbolOwner;
    v8 = v6;
    if (CSIsNull())
    {
      if (!_debugSwiftAsyncPrintfIsEnabled())
        return;
      v9 = "libswift_Concurrency";
      goto LABEL_20;
    }
    CSSymbolicatorCreateWithTask();
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    CSSymbolOwnerGetSymbolWithMangledName();
    if (CSIsNull())
    {
      CSRelease();
LABEL_18:
      if (!_debugSwiftAsyncPrintfIsEnabled())
        return;
      v9 = "libswiftRemoteMirror version or it wasn't new enough";
      goto LABEL_20;
    }
    Range = (_DWORD *)CSSymbolGetRange();
    CSRelease();
    if (!Range || *Range <= 2u)
      goto LABEL_18;
    v16 = 0;
    _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"__swift_concurrency_debug_asyncTaskMetadata", v7, v8, 8uLL, &v16);
    v15 = 0;
    _copy_remote_mangled_symbol_value(self->_memoryReader, (uint64_t)"__swift_concurrency_debug_asyncTaskSlabMetadata", v7, v8, 8uLL, &v15);
    if (v16 && (v11 = v15) != 0)
    {
      self->_swiftConcurrencyDebugAsyncTaskMetadataIsa = v16;
      self->_swiftConcurrencyDebugAsyncTaskSlabMetadataIsa = v11;
      if (CSSymbolOwnerGetPath())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CSSymbolOwnerGetPath());
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = &stru_1E4E04720;
      }
      +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUMutableClassInfo, "classInfoWithClassName:binaryPath:type:", CFSTR("AsyncTask"), v12, 8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDisplayName:", CFSTR("Task stack"));
      objc_msgSend(v13, "setDefaultScanType:", 1);
      objc_msgSend(v13, "setIsRootClass:", 1);
      -[VMUClassInfoMap addClassInfo:forAddress:](self->_realizedIsaToClassInfo, "addClassInfo:forAddress:", v13, self->_swiftConcurrencyDebugAsyncTaskMetadataIsa);
      +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUMutableClassInfo, "classInfoWithClassName:binaryPath:type:", CFSTR("AsyncTask Slab"), v12, 8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDisplayName:", CFSTR("Task stack"));
      objc_msgSend(v14, "setDefaultScanType:", 1);
      objc_msgSend(v14, "setIsRootClass:", 1);
      -[VMUClassInfoMap addClassInfo:forAddress:](self->_realizedIsaToClassInfo, "addClassInfo:forAddress:", v14, self->_swiftConcurrencyDebugAsyncTaskSlabMetadataIsa);

    }
    else if (_debugSwiftAsyncPrintfIsEnabled())
    {
      v9 = "pseudo-isas for AsyncTasks and Slabs";
LABEL_20:
      _debugSwiftAsyncPrintf(0, "Won't attempt precise Swift Concurrency allocation scanning because couldn't find %s\n", v9);
    }
  }
}

- (void)destroy_libSwiftRemoteMirror
{
  int **swiftMirror;
  NSMapTable *remoteAddressToLocalAddressAndSizeMap;
  _OWORD v5[4];
  uint64_t v6;

  swiftMirror = (int **)self->_swiftMirror;
  if (swiftMirror)
  {
    if (*swiftMirror)
    {
      vmu_swift_reflection_destroyReflectionContext(*swiftMirror);
      swiftMirror = (int **)self->_swiftMirror;
    }
    free(swiftMirror);
    self->_swiftMirror = 0;
  }
  remoteAddressToLocalAddressAndSizeMap = self->_swiftMirrorReaderContext.remoteAddressToLocalAddressAndSizeMap;
  if (remoteAddressToLocalAddressAndSizeMap)
    NSResetMapTable(remoteAddressToLocalAddressAndSizeMap);
  v6 = 0;
  memset(v5, 0, sizeof(v5));
  __copy_assignment_8_8_t0w16_sb16_s24_s32_t40w16_w56_w64((uint64_t)&self->_swiftMirrorReaderContext, (uint64_t)v5);
  __destructor_8_sb16_s24_s32_w56_w64((id *)v5);
}

- (BOOL)hasSwiftContent
{
  return self->_swiftRuntimeInfoStableABI || self->_swiftRuntimeInfoPreABI != 0;
}

- (BOOL)hasSwiftReflection
{
  return self->_swiftMirror->var0 != 0;
}

- (VMUObjectIdentifier)initWithTask:(unsigned int)a3
{
  return -[VMUObjectIdentifier initWithTask:symbolicator:](self, "initWithTask:symbolicator:", *(_QWORD *)&a3, 0, 0);
}

- (unsigned)objectContentLevel
{
  return self->_objectContentLevel;
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  self->_objectContentLevel = a3;
}

- (VMURangeArray)readonlyRegionRanges
{
  return self->_readonlyRegionRanges;
}

- (void)setReadonlyRegionRanges:(id)a3
{
  objc_storeStrong((id *)&self->_readonlyRegionRanges, a3);
}

- (id)memoryReader
{
  return self->_memoryReader;
}

- (VMUClassInfoMap)realizedClasses
{
  return self->_realizedIsaToClassInfo;
}

- (VMUSwiftRuntimeInfo)swiftRuntimeInfoPreABI
{
  return self->_swiftRuntimeInfoPreABI;
}

- (VMUSwiftRuntimeInfo)swiftRuntimeInfoStableABI
{
  return self->_swiftRuntimeInfoStableABI;
}

- (libSwiftRemoteMirrorWrapper)swiftMirror
{
  return self->_swiftMirror;
}

- (unint64_t)taggedPointerMask
{
  return self->_taggedPointerMask;
}

- (_CSTypeRef)symbolicator
{
  unint64_t opaque_2;
  unint64_t opaque_1;
  _CSTypeRef result;

  opaque_2 = self->_symbolicator._opaque_2;
  opaque_1 = self->_symbolicator._opaque_1;
  result._opaque_2 = opaque_2;
  result._opaque_1 = opaque_1;
  return result;
}

- (_CSTypeRef)libobjcSymbolOwner
{
  unint64_t opaque_2;
  unint64_t opaque_1;
  _CSTypeRef result;

  opaque_2 = self->_libobjcSymbolOwner._opaque_2;
  opaque_1 = self->_libobjcSymbolOwner._opaque_1;
  result._opaque_2 = opaque_2;
  result._opaque_1 = opaque_1;
  return result;
}

- (unsigned)objcABI
{
  return self->_objcABI;
}

- (unint64_t)figBaseObjectFinalizeAddress
{
  return self->_figBaseObjectFinalizeAddress;
}

- (BOOL)taskIsDriverKit
{
  return self->_taskIsDriverKit;
}

- (VMUAutoreleasePoolPageLayout)autoreleasePoolPageLayout
{
  return self->_autoreleasePoolPageLayout;
}

- (VMUTaskMemoryScanner)scanner
{
  return (VMUTaskMemoryScanner *)objc_loadWeakRetained((id *)&self->_scanner);
}

- (NSMutableDictionary)moduleNameToBinaryPathDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 368, 1);
}

- (unint64_t)swiftConcurrencyDebugAsyncTaskMetadataIsa
{
  return self->_swiftConcurrencyDebugAsyncTaskMetadataIsa;
}

- (unint64_t)swiftConcurrencyDebugAsyncTaskSlabMetadataIsa
{
  return self->_swiftConcurrencyDebugAsyncTaskSlabMetadataIsa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driverKitSupport, 0);
  objc_storeStrong((id *)&self->_targetProcessVMranges, 0);
  objc_storeStrong((id *)&self->_moduleNameToBinaryPathDict, 0);
  objc_storeStrong((id *)&self->_pidToProcessNameDict, 0);
  objc_storeStrong((id *)&self->_stringUniquingSet, 0);
  objc_storeStrong((id *)&self->_itemCountToLabelStringUniquingMap, 0);
  objc_storeStrong((id *)&self->_isaToObjectLabelHandlerMap, 0);
  objc_storeStrong((id *)&self->_nonObjectIsaHash, 0);
  objc_storeStrong((id *)&self->_lastCPlusPlusClassInfo, 0);
  objc_storeStrong(&self->_isaTranslator, 0);
  objc_storeStrong((id *)&self->_nonobjectClassInfosDict, 0);
  objc_storeStrong((id *)&self->_coreMediaFigBaseClassToClassInfo, 0);
  objc_storeStrong((id *)&self->_cfTypeIDToClassInfo, 0);
  objc_storeStrong((id *)&self->_unrealizedClassInfos, 0);
  objc_storeStrong((id *)&self->_realizedIsaToClassInfo, 0);
  objc_storeStrong((id *)&self->_readonlyRegionRanges, 0);
  objc_storeStrong((id *)&self->_swiftRuntimeInfoPreABI, 0);
  objc_storeStrong((id *)&self->_swiftRuntimeInfoStableABI, 0);
  objc_storeStrong((id *)&self->_libSwiftRemoteMirrors, 0);
  __destructor_8_sb16_s24_s32_w56_w64((id *)&self->_swiftMirrorReaderContext);
  objc_destroyWeak((id *)&self->_scanner);
  objc_storeStrong(&self->_memoryReader, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
