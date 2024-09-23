@implementation VMUScanOverlay

+ (BOOL)foundationHasNSSliceMemoryOptimization
{
  if (foundationHasNSSliceMemoryOptimization_onceToken != -1)
    dispatch_once(&foundationHasNSSliceMemoryOptimization_onceToken, &__block_literal_global_5);
  return foundationHasNSSliceMemoryOptimization_foundationHasNSSliceMemoryOptimization;
}

objc_class *__56__VMUScanOverlay_foundationHasNSSliceMemoryOptimization__block_invoke()
{
  objc_class *result;

  result = objc_getClass("NSConcreteHashTable");
  if (result)
  {
    result = class_getInstanceVariable(result, "slice");
    if (result)
    {
      result = (objc_class *)ivar_getTypeEncoding(result);
      if (result)
      {
        result = (objc_class *)strstr((char *)result, "acquisitionProps");
        if (result)
          foundationHasNSSliceMemoryOptimization_foundationHasNSSliceMemoryOptimization = 1;
      }
    }
  }
  return result;
}

+ (id)defaultOverlay
{
  return (id)objc_msgSend(a1, "defaultOverlayWithScanner:", 0);
}

+ (id)defaultOverlayWithScanner:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VMUScanOverlay_defaultOverlayWithScanner___block_invoke;
  block[3] = &unk_1E4E01628;
  v9 = v3;
  v4 = defaultOverlayWithScanner__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&defaultOverlayWithScanner__onceToken, block);
  v6 = (id)defaultOverlayWithScanner__s_defaultOverlay;

  return v6;
}

void __44__VMUScanOverlay_defaultOverlayWithScanner___block_invoke(uint64_t a1)
{
  VMUScanOverlay *v1;
  void *v2;

  v1 = -[VMUScanOverlay initWithScanner:]([VMUScanOverlay alloc], "initWithScanner:", *(_QWORD *)(a1 + 32));
  v2 = (void *)defaultOverlayWithScanner__s_defaultOverlay;
  defaultOverlayWithScanner__s_defaultOverlay = (uint64_t)v1;

}

- (VMUScanOverlay)initWithScanner:(id)a3
{
  id v4;
  VMUScanOverlay *v5;
  VMUScanOverlay *v6;
  uint64_t v7;
  NSMutableArray *rules;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v4 = a3;
  if (getenv("DT_NO_SCAN_OVERLAY"))
  {
    v5 = 0;
  }
  else
  {
    v43.receiver = self;
    v43.super_class = (Class)VMUScanOverlay;
    v6 = -[VMUScanOverlay init](&v43, sel_init);
    if (v6)
    {
      v7 = objc_opt_new();
      rules = v6->_rules;
      v6->_rules = (NSMutableArray *)v7;

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E4E206B8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E4E206D0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __34__VMUScanOverlay_initWithScanner___block_invoke;
      v39[3] = &unk_1E4E016A0;
      v12 = v9;
      v40 = v12;
      v41 = v10;
      v42 = &unk_1E4E206E8;
      v13 = v10;
      v31 = (void *)MEMORY[0x1A85A995C](v39);
      objc_msgSend(v12, "setByAddingObject:", CFSTR("libswiftCore.dylib"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "swiftRuntimeInfoStableABI");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(v4, "objectIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "swiftRuntimeInfoPreABI");
        v18 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v15, "swiftRuntimeInfoStableABI");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v4, "objectIdentifier");
        v21 = v12;
        v22 = v13;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "swiftRuntimeInfoPreABI");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v22;
        v12 = v21;
        v11 = MEMORY[0x1E0C809B0];
      }
      else
      {
        v24 = 0;
      }

      v32[0] = v11;
      v32[1] = 3221225472;
      v32[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_4;
      v32[3] = &unk_1E4E01A10;
      v33 = &unk_1E4E20790;
      v34 = v15;
      v35 = v18;
      v36 = v24;
      v37 = v14;
      v38 = v31;
      v25 = v31;
      v26 = v14;
      v27 = v24;
      v28 = v18;
      v29 = v15;
      -[VMUScanOverlay addMetadataRefinementRule:](v6, "addMetadataRefinementRule:", v32);

    }
    self = v6;
    v5 = self;
  }

  return v5;
}

void __34__VMUScanOverlay_initWithScanner___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD v10[4];
  id v11;
  id v12;
  int v13;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A85A9758]();
  objc_msgSend(v3, "binaryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "className");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "binaryName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

    if ((_DWORD)v7)
    {
      if (v6 && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6) & 1) == 0)
      {
        v9 = objc_msgSend(v3, "pointerSize");
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_2;
        v10[3] = &unk_1E4E01678;
        v11 = *(id *)(a1 + 48);
        v12 = v3;
        v13 = v9;
        objc_msgSend(v12, "mutateTypeFieldsWithBlock:", v10);

      }
    }
  }

  objc_autoreleasePoolPop(v4);
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
        objc_msgSend(v3, "ivarName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = objc_msgSend(v10, "isEqualToString:", v9);

        if ((_DWORD)v9)
        {
          v11 = (void *)objc_msgSend(v3, "mutableCopy");
          objc_msgSend(v11, "setScanType:", 4);
          v12 = *(void **)(a1 + 40);
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_3;
          v18[3] = &unk_1E4E01650;
          v19 = v3;
          v20 = *(_DWORD *)(a1 + 48);
          objc_msgSend(v12, "addVariant:forField:withEvaluator:", v11, v19, v18);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "ivarName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isEqualToString:", CFSTR("_bytes")))
    goto LABEL_13;
  v14 = objc_msgSend(v3, "scanType");

  if (v14 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "displayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingString:", CFSTR(" (Bytes Storage)"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "binaryPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUMutableClassInfo, "classInfoWithClassName:binaryPath:type:", v13, v16, 16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setDefaultScanType:", 1);
    objc_msgSend(v3, "setDestinationLayout:", v17);

LABEL_13:
  }

}

uint64_t __34__VMUScanOverlay_initWithScanner___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t (*v9)(void);
  uint64_t *v10;
  uint64_t v11;
  unsigned int *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "offset");
  LODWORD(a1) = *(_DWORD *)(a1 + 40);
  v8 = v7;
  v9 = (uint64_t (*)(void))v8[2];
  if ((_DWORD)a1 == 8)
  {
    v10 = (uint64_t *)v9();
    if (v10)
    {
      v11 = *v10;
      goto LABEL_7;
    }
  }
  else
  {
    v12 = (unsigned int *)v9();
    if (v12)
    {
      v11 = *v12;
      goto LABEL_7;
    }
  }
  v11 = 0;
LABEL_7:

  if (v11)
  {
    objc_msgSend(v6, "classInfoForObjectAtAddress:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "className");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v14, "isEqualToString:", CFSTR("NSWeakObjectValue")) ^ 1;
  }

  return v11;
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  int isSwiftRootClass;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  VMUMutableFieldInfo *v35;
  VMUMutableFieldInfo *v36;
  VMUMutableFieldInfo *v37;
  void *v38;
  id v39;
  unsigned int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  __CFString *v51;
  __CFString *v52;
  void *v53;
  int v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  int v66;
  void *v67;
  int v68;
  void *v69;
  int v70;
  void *v71;
  int v72;
  void *v73;
  int v74;
  void *v75;
  int v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  int v89;
  void *v90;
  int v91;
  void *v92;
  int v93;
  void *v94;
  int v95;
  void *v96;
  int v97;
  void *v98;
  int v99;
  void *v100;
  int v101;
  void *v102;
  int v103;
  void *v104;
  int v105;
  void *v106;
  int v107;
  void *v108;
  int v109;
  void *v110;
  int v111;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  int v116;
  uint64_t v117;
  VMUMutableFieldInfo *v118;
  VMUMutableFieldInfo *v119;
  VMUMutableFieldInfo *v120;
  VMUMutableFieldInfo *v121;
  void *v122;
  void *v123;
  int v124;
  void *v125;
  int v126;
  VMUMutableFieldInfo *v127;
  VMUMutableFieldInfo *v128;
  VMUMutableFieldInfo *v129;
  void *v130;
  _QWORD v131[4];
  id v132;
  uint64_t *v133;
  _QWORD v134[4];
  id v135;
  uint64_t *v136;
  _QWORD v137[4];
  id v138;
  uint64_t *v139;
  _QWORD v140[4];
  unsigned int v141;
  int v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id from;
  id location;
  _QWORD v153[7];
  _QWORD v154[5];

  v154[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "infoType") == 1
    || objc_msgSend(v3, "infoType") == 8
    || objc_msgSend(v3, "infoType") == 64
    || objc_msgSend(v3, "infoType") == 128)
  {
    v4 = (void *)MEMORY[0x1A85A9758]();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "className");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_1E4E04720;
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v3, "setDisplayName:", v9);
    if (objc_msgSend(v3, "infoType") == 8
      || objc_msgSend(v3, "infoType") == 64
      || _isSwiftRootClass(v3))
    {
      objc_msgSend(v3, "className");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "hasPrefix:", CFSTR("__")) & 1) != 0)
      {
        objc_msgSend(v3, "binaryPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hasSuffix:", CFSTR("libswiftCore.dylib"));

        if (v12)
        {
          objc_msgSend(v3, "className");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "substringFromIndex:", 2);
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
      }
      else
      {

      }
      objc_msgSend(*(id *)(a1 + 40), "vmuTask");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isExclaveCore"))
      {
LABEL_21:

LABEL_22:
        v20 = *(void **)(a1 + 48);
        v19 = *(void **)(a1 + 56);
        v21 = *(void **)(a1 + 40);
        objc_initWeak(&location, v3);
        v22 = v20;
        v23 = v19;
        objc_initWeak(&from, v21);
        v24 = objc_loadWeakRetained(&location);
        if (objc_msgSend(v24, "infoType") == 64)
        {

        }
        else
        {
          v25 = objc_loadWeakRetained(&location);
          isSwiftRootClass = _isSwiftRootClass(v25);

          if (isSwiftRootClass)
          {
            v27 = objc_loadWeakRetained(&location);
            v143 = MEMORY[0x1E0C809B0];
            v144 = 3221225472;
            v145 = (uint64_t)___variantForSwiftClass_block_invoke;
            v146 = &unk_1E4E01A38;
            objc_copyWeak(&v148, &location);
            v147 = v22;
            objc_msgSend(v27, "mutateTypeFieldsWithBlock:", &v143);

            objc_destroyWeak(&v148);
LABEL_27:
            objc_destroyWeak(&from);

            objc_destroyWeak(&location);
LABEL_28:

            objc_autoreleasePoolPop(v4);
            goto LABEL_29;
          }
        }
        v28 = objc_loadWeakRetained(&location);
        v143 = MEMORY[0x1E0C809B0];
        v144 = 3221225472;
        v145 = (uint64_t)___variantForSwiftClass_block_invoke_2;
        v146 = &unk_1E4E01B00;
        v147 = v22;
        objc_copyWeak(&v149, &location);
        v148 = v23;
        objc_copyWeak(&v150, &from);
        objc_msgSend(v28, "mutateTypeFieldsRecursivelyWithBlock:", &v143);

        objc_destroyWeak(&v150);
        objc_destroyWeak(&v149);

        goto LABEL_27;
      }
      objc_msgSend(v3, "className");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("Swift.__"));

      if (!v16)
        goto LABEL_22;
      objc_msgSend(v3, "className");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "substringFromIndex:", 8);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v17 = (void *)v14;
      objc_msgSend(CFSTR("Swift."), "stringByAppendingString:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setDisplayName:", v18);

      goto LABEL_21;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "taskIsDriverKit")
      && objc_msgSend(v3, "infoType") == 128)
    {
      goto LABEL_28;
    }
    if ((objc_msgSend(v3, "isARR") & 1) != 0)
      goto LABEL_28;
    v29 = *(void **)(a1 + 64);
    objc_msgSend(v3, "binaryName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = objc_msgSend(v29, "containsObject:", v30);

    if (!(_DWORD)v29)
      goto LABEL_28;
    objc_msgSend(v3, "className");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("_CFXNotificationRegistrationContainer"));

    if (v32)
    {
      v33 = objc_msgSend(v3, "pointerSize");
      objc_msgSend(v3, "firstFieldWithName:", CFSTR("_children"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("_children.elements"), CFSTR("^v"), 2, objc_msgSend(v34, "offset"), v33);
        v36 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("_children.singleChildKey"), CFSTR("^v"), 1, objc_msgSend(v34, "offset") + v33, v33);
        v37 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("_children.callbacks"), CFSTR("^v"), 2, objc_msgSend(v34, "offset") + 2 * (_DWORD)v33, v33);
        v154[0] = v35;
        v154[1] = v36;
        v154[2] = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 3);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "replaceField:withFields:", v34, v38);

        v39 = -[VMUFieldInfo mutableCopy](v36, "mutableCopy");
        objc_msgSend(v39, "setScanType:", 4);
        v40 = -[VMUFieldInfo offset](v37, "offset");
        v140[0] = MEMORY[0x1E0C809B0];
        v140[1] = 3221225472;
        v140[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_5;
        v140[3] = &__block_descriptor_40_e45_B32__0Q8__VMUTaskMemoryScanner_16____v__QQ_24l;
        v141 = v40;
        v142 = v33;
        objc_msgSend(v3, "addVariant:forField:withEvaluator:", v39, v36, v140);

      }
      goto LABEL_42;
    }
    objc_msgSend(v3, "className");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "isEqualToString:", CFSTR("__NSCFDictionary")))
    {

LABEL_41:
      _variantForCFBasicHash(v3);
LABEL_42:
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      goto LABEL_28;
    }
    objc_msgSend(v3, "className");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("__NSCFSet"));

    if (v43)
      goto LABEL_41;
    objc_msgSend(v3, "className");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("__NSCFString"));

    if (v45)
    {
      _destinationLayoutStorageVariant(v3, 16, CFSTR("content"), 0, &stru_1E4E04720);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addVariant:forField:withEvaluator:", v46, 0, &__block_literal_global_236);
      objc_msgSend(v3, "setVariantScanType:withEvaluator:", 0, &__block_literal_global_237);

      goto LABEL_42;
    }
    objc_msgSend(v3, "className");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("NSConcreteHashTable"));

    if (v48
      || (objc_msgSend(v3, "className"),
          v49 = (void *)objc_claimAutoreleasedReturnValue(),
          v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("NSConcretePointerArray")),
          v49,
          v50))
    {
      v51 = CFSTR("slice");
      v52 = CFSTR("Object");
LABEL_48:
      _variantForNSSlice(v3, v51, v52);
      goto LABEL_42;
    }
    objc_msgSend(v3, "className");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("NSConcreteMapTable"));

    if (v54)
    {
      _variantForNSSlice(v3, CFSTR("keys"), CFSTR("Key"));
      v51 = CFSTR("values");
      v52 = CFSTR("Value");
      goto LABEL_48;
    }
    objc_msgSend(v3, "className");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("_CFXNotificationRegistrationBase"));

    if (v56)
    {
      v57 = &__block_literal_global_252;
      goto LABEL_61;
    }
    objc_msgSend(v3, "className");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("_NSThreadData"));

    if (v59)
    {
      v57 = &__block_literal_global_255;
      goto LABEL_61;
    }
    objc_msgSend(v3, "className");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("_CFXNotificationObserverRegistration"));

    if (v61)
    {
      v57 = &__block_literal_global_258;
      goto LABEL_61;
    }
    objc_msgSend(v3, "className");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v62, "isEqualToString:", CFSTR("_CFXNotificationObjectRegistration")))
    {

LABEL_60:
      v57 = &__block_literal_global_265;
      goto LABEL_61;
    }
    objc_msgSend(v3, "className");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "isEqualToString:", CFSTR("_CFXNotificationObjcObserverRegistration"));

    if (v64)
      goto LABEL_60;
    objc_msgSend(v3, "className");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "isEqualToString:", CFSTR("__NSObserver"));

    if (v66)
    {
      v57 = &__block_literal_global_270;
      goto LABEL_61;
    }
    objc_msgSend(v3, "className");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "isEqualToString:", CFSTR("_NSBindingInfo"));

    if (v68)
    {
      v57 = &__block_literal_global_275;
      goto LABEL_61;
    }
    objc_msgSend(v3, "className");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "isEqualToString:", CFSTR("_NSModelObservingTracker"));

    if (v70)
    {
      v57 = &__block_literal_global_280;
      goto LABEL_61;
    }
    objc_msgSend(v3, "className");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "isEqualToString:", CFSTR("__NSOperationInternal"));

    if (v72)
    {
      v57 = &__block_literal_global_285;
      goto LABEL_61;
    }
    objc_msgSend(v3, "className");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "isEqualToString:", CFSTR("NSKeyValueObservance"));

    if (v74)
    {
      v57 = &__block_literal_global_292;
      goto LABEL_61;
    }
    objc_msgSend(v3, "className");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "isEqualToString:", CFSTR("__NSSingleObjectArrayI"));

    if (v76)
    {
      v57 = &__block_literal_global_295;
      goto LABEL_61;
    }
    objc_msgSend(v3, "className");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "isEqualToString:", CFSTR("__NSSingleObjectSetI"));

    if (v78)
    {
      v57 = &__block_literal_global_296;
      goto LABEL_61;
    }
    objc_msgSend(v3, "className");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v79, "isEqualToString:", CFSTR("__NSArrayM")))
    {

    }
    else
    {
      objc_msgSend(v3, "className");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v80, "isEqualToString:", CFSTR("__NSFrozenArrayM"));

      if (!v81)
      {
        objc_msgSend(v3, "className");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v82, "isEqualToString:", CFSTR("__NSDictionaryM")))
        {

        }
        else
        {
          objc_msgSend(v3, "className");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = objc_msgSend(v83, "isEqualToString:", CFSTR("__NSFrozenDictionaryM"));

          if (!v84)
          {
            objc_msgSend(v3, "className");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v85, "isEqualToString:", CFSTR("__NSSetM")))
            {

            }
            else
            {
              objc_msgSend(v3, "className");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = objc_msgSend(v86, "isEqualToString:", CFSTR("__NSFrozenSetM"));

              if (!v87)
              {
                objc_msgSend(v3, "className");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = objc_msgSend(v88, "isEqualToString:", CFSTR("__NSArrayI"));

                if (v89)
                {
                  objc_msgSend(v3, "setDefaultScanType:", 2);
                  goto LABEL_42;
                }
                objc_msgSend(v3, "className");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                v91 = objc_msgSend(v90, "isEqualToString:", CFSTR("NSResponder"));

                if (v91)
                {
                  v57 = &__block_literal_global_315;
                }
                else
                {
                  objc_msgSend(v3, "className");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  v93 = objc_msgSend(v92, "isEqualToString:", CFSTR("NSMenuItem"));

                  if (v93)
                  {
                    v57 = &__block_literal_global_320;
                  }
                  else
                  {
                    objc_msgSend(v3, "className");
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    v95 = objc_msgSend(v94, "isEqualToString:", CFSTR("NSActionCell"));

                    if (v95)
                    {
                      v57 = &__block_literal_global_329;
                    }
                    else
                    {
                      objc_msgSend(v3, "className");
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      v97 = objc_msgSend(v96, "isEqualToString:", CFSTR("NSCellAuxiliary"));

                      if (v97)
                      {
                        v57 = &__block_literal_global_334;
                      }
                      else
                      {
                        objc_msgSend(v3, "className");
                        v98 = (void *)objc_claimAutoreleasedReturnValue();
                        v99 = objc_msgSend(v98, "isEqualToString:", CFSTR("NSMenu"));

                        if (v99)
                        {
                          v57 = &__block_literal_global_339;
                        }
                        else
                        {
                          objc_msgSend(v3, "className");
                          v100 = (void *)objc_claimAutoreleasedReturnValue();
                          v101 = objc_msgSend(v100, "isEqualToString:", CFSTR("NSLayoutConstraint"));

                          if (v101)
                          {
                            v57 = &__block_literal_global_344;
                          }
                          else
                          {
                            objc_msgSend(v3, "className");
                            v102 = (void *)objc_claimAutoreleasedReturnValue();
                            v103 = objc_msgSend(v102, "isEqualToString:", CFSTR("NSLayoutAnchor"));

                            if (v103)
                            {
                              v57 = &__block_literal_global_353;
                            }
                            else
                            {
                              objc_msgSend(v3, "className");
                              v104 = (void *)objc_claimAutoreleasedReturnValue();
                              v105 = objc_msgSend(v104, "isEqualToString:", CFSTR("NSView"));

                              if (v105)
                              {
                                v57 = &__block_literal_global_358;
                              }
                              else
                              {
                                objc_msgSend(v3, "className");
                                v106 = (void *)objc_claimAutoreleasedReturnValue();
                                v107 = objc_msgSend(v106, "isEqualToString:", CFSTR("_NSViewAuxiliary"));

                                if (v107)
                                {
                                  v57 = &__block_literal_global_369;
                                }
                                else
                                {
                                  objc_msgSend(v3, "className");
                                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                                  v109 = objc_msgSend(v108, "isEqualToString:", CFSTR("NSTextInputContext"));

                                  if (v109)
                                  {
                                    v57 = &__block_literal_global_372;
                                  }
                                  else
                                  {
                                    objc_msgSend(v3, "className");
                                    v110 = (void *)objc_claimAutoreleasedReturnValue();
                                    v111 = objc_msgSend(v110, "isEqualToString:", CFSTR("NSWeakObjectValue"));

                                    if (v111)
                                    {
                                      v57 = &__block_literal_global_375;
                                    }
                                    else
                                    {
                                      objc_msgSend(v3, "className");
                                      v112 = (void *)objc_claimAutoreleasedReturnValue();
                                      v113 = objc_msgSend(v112, "isEqualToString:", CFSTR("NSAccessibilityWeakReferenceContainer"));

                                      if (!v113)
                                      {
                                        objc_msgSend(v3, "className");
                                        v114 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (objc_msgSend(v114, "isEqualToString:", CFSTR("NSInputStream")))
                                        {

                                        }
                                        else
                                        {
                                          objc_msgSend(v3, "className");
                                          v115 = (void *)objc_claimAutoreleasedReturnValue();
                                          v116 = objc_msgSend(v115, "isEqualToString:", CFSTR("NSOutputStream"));

                                          if (!v116)
                                          {
                                            objc_msgSend(v3, "displayName");
                                            v123 = (void *)objc_claimAutoreleasedReturnValue();
                                            v124 = objc_msgSend(v123, "isEqualToString:", CFSTR("__SwiftNativeNSError"));

                                            if (v124)
                                            {
                                              objc_msgSend(v3, "setInfoType:", 8);
                                              goto LABEL_28;
                                            }
                                            objc_msgSend(v3, "className");
                                            v125 = (void *)objc_claimAutoreleasedReturnValue();
                                            v126 = objc_msgSend(v125, "isEqualToString:", CFSTR("_NSKVODeallocSentinel"));

                                            if (!v126)
                                              goto LABEL_42;
                                            v57 = &__block_literal_global_407;
                                            goto LABEL_61;
                                          }
                                        }
                                        objc_msgSend(v3, "firstFieldWithName:", CFSTR("_reserved"));
                                        v130 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (v130)
                                        {
                                          v117 = objc_msgSend(v3, "pointerSize");
                                          v129 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("error"), CFSTR("^v"), 1, (3 * v117), v117);
                                          v128 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("client"), CFSTR("^{_CFStreamClient=}"), 1, (4 * v117), v117);
                                          v127 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("info"), CFSTR("^v"), 1, (5 * v117), v117);
                                          v118 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("callBacks"), CFSTR("^{_CFStreamCallBacks=}"), 1, (6 * v117), v117);
                                          v119 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("streamLock"), CFSTR("^v"), 1, (7 * v117), v117);
                                          v120 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("previousRunloopsAndModes"), CFSTR("^v"), 1, (8 * v117), v117);
                                          v121 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("queue"), CFSTR("^v"), 1, (9 * v117), v117);
                                          v153[0] = v129;
                                          v153[1] = v128;
                                          v153[2] = v127;
                                          v153[3] = v118;
                                          v153[4] = v119;
                                          v153[5] = v120;
                                          v153[6] = v121;
                                          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 7);
                                          v122 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v3, "replaceField:withFields:", v130, v122);

                                        }
                                        goto LABEL_42;
                                      }
                                      v57 = &__block_literal_global_380;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
LABEL_61:
                objc_msgSend(v3, "mutateTypeFieldsWithBlock:", v57);
                goto LABEL_42;
              }
            }
            v143 = 0;
            v144 = (uint64_t)&v143;
            v145 = 0x2020000000;
            LOBYTE(v146) = 0;
            v131[0] = MEMORY[0x1E0C809B0];
            v131[1] = 3221225472;
            v131[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_21;
            v131[3] = &unk_1E4E018C8;
            v132 = v3;
            v133 = &v143;
            objc_msgSend(v132, "mutateTypeFieldsWithBlock:", v131);

LABEL_80:
            _Block_object_dispose(&v143, 8);
            goto LABEL_42;
          }
        }
        v143 = 0;
        v144 = (uint64_t)&v143;
        v145 = 0x2020000000;
        LOBYTE(v146) = 0;
        v134[0] = MEMORY[0x1E0C809B0];
        v134[1] = 3221225472;
        v134[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_20;
        v134[3] = &unk_1E4E018C8;
        v135 = v3;
        v136 = &v143;
        objc_msgSend(v135, "mutateTypeFieldsWithBlock:", v134);

        goto LABEL_80;
      }
    }
    v143 = 0;
    v144 = (uint64_t)&v143;
    v145 = 0x2020000000;
    LOBYTE(v146) = 0;
    v137[0] = MEMORY[0x1E0C809B0];
    v137[1] = 3221225472;
    v137[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_19;
    v137[3] = &unk_1E4E018C8;
    v138 = v3;
    v139 = &v143;
    objc_msgSend(v138, "mutateTypeFieldsWithBlock:", v137);

    goto LABEL_80;
  }
LABEL_29:

}

BOOL __34__VMUScanOverlay_initWithScanner___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  _QWORD *v7;
  uint64_t (*v8)(void);
  uint64_t *v9;
  uint64_t v10;
  _DWORD *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(_QWORD *, uint64_t, uint64_t);
  uint64_t *v16;
  uint64_t v17;
  unsigned int *v18;

  v6 = a3;
  v7 = a4;
  v8 = (uint64_t (*)(void))v7[2];
  if (*(_DWORD *)(a1 + 36) != 8)
  {
    v11 = (_DWORD *)v8();
    if (!v11)
      goto LABEL_7;
    v10 = *v11;
    if (!*v11)
      goto LABEL_7;
LABEL_9:
    v13 = *(unsigned int *)(a1 + 36);
    v14 = v10 + v13;
    v15 = (uint64_t (*)(_QWORD *, uint64_t, uint64_t))v7[2];
    if ((_DWORD)v13 == 8)
    {
      v16 = (uint64_t *)v15(v7, v14, 8);
      if (v16)
      {
        v17 = *v16;
LABEL_15:
        v12 = v17 == 0;
        goto LABEL_16;
      }
    }
    else
    {
      v18 = (unsigned int *)v15(v7, v14, 4);
      if (v18)
      {
        v17 = *v18;
        goto LABEL_15;
      }
    }
    v17 = 0;
    goto LABEL_15;
  }
  v9 = (uint64_t *)v8();
  if (v9)
  {
    v10 = *v9;
    if (*v9)
      goto LABEL_9;
  }
LABEL_7:
  v12 = 0;
LABEL_16:

  return v12;
}

uint64_t __34__VMUScanOverlay_initWithScanner___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a2, 16);
  if (result)
    return !stringHasInlineContents(result);
  return result;
}

uint64_t __34__VMUScanOverlay_initWithScanner___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a2, 16);
  if (result)
    return stringHasInlineContents(result);
  return result;
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_parent"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_target"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 2);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_observer"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 0);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_object"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("object"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_retainedController"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 2);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_14(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_modelObserver"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_15(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("__outerOp"));

  if (v3)
    objc_msgSend(v6, "setScanType:", 4);
  objc_msgSend(v6, "ivarName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("__completion"));

  if (v5)
    objc_msgSend(v6, "setScanType:", 2);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_16(uint64_t a1, void *a2)
{
  void *v2;
  char v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "scanType") == 1)
  {
    objc_msgSend(v4, "ivarName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_context"));

    if ((v3 & 1) == 0)
      objc_msgSend(v4, "setScanType:", 4);
  }

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_17(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_object"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 2);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_18(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("element"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 2);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_19(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "ivarName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("_list")))
  {

LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(" (Storage)"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "binaryPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUMutableClassInfo, "classInfoWithClassName:binaryPath:type:", v7, v8, 16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setDefaultScanType:", 2);
    objc_msgSend(v10, "setDestinationLayout:", v9);
    objc_msgSend(v10, "setScanType:", 2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

    goto LABEL_5;
  }
  objc_msgSend(v10, "ivarName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("storage"));

  if (v5)
    goto LABEL_4;
LABEL_5:

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_20(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  const __CFString *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "ivarName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("_objs"));

  if ((v4 & 1) != 0)
  {
    v5 = CFSTR(" (Value Storage)");
    v6 = 1;
  }
  else
  {
    objc_msgSend(v15, "ivarName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", CFSTR("_keys"));

    if (v6)
      v5 = CFSTR(" (Key Storage)");
    else
      v5 = 0;
  }
  objc_msgSend(v15, "ivarName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("storage"));

  if ((v9 & 1) != 0 || v6)
  {
    if (v9)
      v10 = CFSTR(" (Storage)");
    else
      v10 = v5;
    objc_msgSend(*(id *)(a1 + 32), "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "binaryPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUMutableClassInfo, "classInfoWithClassName:binaryPath:type:", v12, v13, 16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setDefaultScanType:", 2);
    objc_msgSend(v15, "setDestinationLayout:", v14);
    objc_msgSend(v15, "setScanType:", 2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_21(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "ivarName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("_objs")))
  {

LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(" (Storage)"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "binaryPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUMutableClassInfo, "classInfoWithClassName:binaryPath:type:", v7, v8, 16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setDefaultScanType:", 2);
    objc_msgSend(v10, "setDestinationLayout:", v9);
    objc_msgSend(v10, "setScanType:", 2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

    goto LABEL_5;
  }
  objc_msgSend(v10, "ivarName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("storage"));

  if (v5)
    goto LABEL_4;
LABEL_5:

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_22(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_nextResponder"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_23(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_repObject"));

  if (v3)
    objc_msgSend(v8, "setScanType:", 2);
  objc_msgSend(v8, "ivarName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("_submenu"));

  if (v5)
    objc_msgSend(v8, "setScanType:", 2);
  objc_msgSend(v8, "ivarName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("_menu"));

  if (v7)
    objc_msgSend(v8, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_24(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_controlView"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_25(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("controlView"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_26(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_supermenu"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_27(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_container"));

  if (v3)
    objc_msgSend(v8, "setScanType:", 4);
  objc_msgSend(v8, "ivarName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("_firstItem"));

  if (v5)
    objc_msgSend(v8, "setScanType:", 4);
  objc_msgSend(v8, "ivarName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("_secondItem"));

  if (v7)
    objc_msgSend(v8, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_28(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_referenceItem"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_29(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_superview"));

  if (v3)
    objc_msgSend(v10, "setScanType:", 4);
  objc_msgSend(v10, "ivarName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("_window"));

  if (v5)
    objc_msgSend(v10, "setScanType:", 4);
  objc_msgSend(v10, "ivarName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("_viewController"));

  if (v7)
    objc_msgSend(v10, "setScanType:", 8);
  objc_msgSend(v10, "ivarName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("_ancestorWithLayerForLastLayerGeometryUpdate"));

  if (v9)
    objc_msgSend(v10, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_30(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_viewController"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_31(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_client"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_32(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_value"));

  if (v3)
    objc_msgSend(v6, "setScanType:", 4);
  objc_msgSend(v6, "ivarName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("_object"));

  if (v5)
    objc_msgSend(v6, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_33(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_weakReference"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 4);

}

void __34__VMUScanOverlay_initWithScanner___block_invoke_34(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "ivarName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_observedObject"));

  if (v3)
    objc_msgSend(v4, "setScanType:", 8);

}

- (void)addMetadataRefinementRule:(id)a3
{
  NSMutableArray *rules;
  id v4;

  rules = self->_rules;
  v4 = (id)MEMORY[0x1A85A995C](a3, a2);
  -[NSMutableArray addObject:](rules, "addObject:", v4);

}

- (NSArray)refinementRules
{
  return &self->_rules->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
}

@end
