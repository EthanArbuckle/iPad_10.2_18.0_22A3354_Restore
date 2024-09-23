@implementation VFXMTLLibraryManager

- (VFXMTLLibraryManager)initWithDevice:(id)a3
{
  VFXMTLLibraryManager *v4;
  VFXMTLLibraryManager *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  VFXMTLLibrary *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  MTLLibrary *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  objc_super v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v67.receiver = self;
  v67.super_class = (Class)VFXMTLLibraryManager;
  v4 = -[VFXMTLLibraryManager init](&v67, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_device = (MTLDevice *)a3;
    v6 = (void *)MEMORY[0x1E0CB34D0];
    v7 = objc_opt_class();
    v10 = (void *)objc_msgSend_bundleForClass_(v6, v8, v7, v9);
    v12 = objc_msgSend_pathForResource_ofType_(v10, v11, (uint64_t)CFSTR("default"), (uint64_t)CFSTR("metallib"));
    v13 = [VFXMTLLibrary alloc];
    v5->_frameworkLibrary = (VFXMTLLibrary *)objc_msgSend_initWithPath_manager_(v13, v14, v12, (uint64_t)v5);
    v5->_availableLibraries = (NSMapTable *)(id)objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v15, v16, v17);
    v5->_availableCompiledLibraries = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
    v5->_availableCompiledLibrariesLock._os_unfair_lock_opaque = 0;
    v5->_deviceQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.vfx.device", 0);
    v5->_shaderCompilationGroup = (OS_dispatch_group *)dispatch_group_create();
    v21 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v18, v19, v20);
    v26 = (void *)objc_msgSend_URLForResource_withExtension_(v21, v22, (uint64_t)CFSTR("vfx"), (uint64_t)CFSTR("metallib"));
    if (!v26)
    {
      v26 = (void *)sub_1B17A02A8();
      if (!v26)
      {
        v27 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v23, v24, v25);
        v26 = (void *)objc_msgSend_URLForResource_withExtension_(v27, v28, (uint64_t)CFSTR("default"), (uint64_t)CFSTR("metallib"));
      }
    }
    v66 = 0;
    v29 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v23, v24, v25);
    v33 = objc_msgSend_path(v26, v30, v31, v32);
    if (objc_msgSend_fileExistsAtPath_(v29, v34, v33, v35))
    {
      v37 = (MTLLibrary *)objc_msgSend_newLibraryWithURL_error_(v5->_device, v36, (uint64_t)v26, (uint64_t)&v66);
      v5->_commonProfileCacheLibrary = v37;
      if (v37)
      {
        v45 = (void *)objc_msgSend_functionNames(v37, v38, v39, v40);
        v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v62, (uint64_t)v68, 16);
        if (v48)
        {
          v52 = v48;
          v53 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v52; ++i)
            {
              if (*(_QWORD *)v63 != v53)
                objc_enumerationMutation(v45);
              v55 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
              if ((objc_msgSend_hasPrefix_(v55, v49, (uint64_t)CFSTR("commonprofile_vert"), v51) & 1) != 0
                || objc_msgSend_hasPrefix_(v55, v49, (uint64_t)CFSTR("commonprofile_frag"), v51))
              {
                v56 = (void *)objc_msgSend_newFunctionWithName_(v5->_commonProfileCacheLibrary, v49, (uint64_t)v55, v51);
                objc_msgSend_setObject_forKeyedSubscript_(v46, v57, (uint64_t)v56, (uint64_t)v55);

              }
            }
            v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v49, (uint64_t)&v62, (uint64_t)v68, 16);
          }
          while (v52);
        }
        if (objc_msgSend_count(v46, v49, v50, v51))
        {
          v5->_commonProfilePrecompiledFunctions = (NSDictionary *)objc_msgSend_copy(v46, v58, v59, v60);
        }
        else
        {

          v5->_commonProfileCacheLibrary = 0;
        }

      }
      else
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: Failed to load common profile chache library : %@"), v39, v40, v41, v42, v43, v44, v66);
      }
    }
  }
  return v5;
}

- (id)hotReloadableLibrary
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_availableCompiledLibraries);

  dispatch_release((dispatch_object_t)self->_deviceQueue);
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLLibraryManager;
  -[VFXMTLLibraryManager dealloc](&v3, sel_dealloc);
}

+ (id)hashCodeForSource:(id)a3 macros:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  char *v27;
  uint8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;
  int8x16_t v31;
  uint8x16_t v32;
  int8x16_t v33;
  int8x16_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CC_SHA256_CTX c;
  _QWORD data[8];
  char v42;
  unsigned __int8 md[32];
  _BYTE v44[128];
  uint64_t v45;
  int8x16x2_t v46;

  v45 = *MEMORY[0x1E0C80C00];
  CC_SHA256_Init(&c);
  sub_1B19B9800((uint64_t)a3, (uint64_t)&c);
  v9 = (void *)objc_msgSend_allKeys(a4, v6, v7, v8);
  v12 = (void *)objc_msgSend_sortedArrayUsingSelector_(v9, v10, (uint64_t)sel_compare_, v11);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v36, (uint64_t)v44, 16);
  if (v14)
  {
    v17 = v14;
    v18 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v12);
        v20 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        v21 = (void *)objc_msgSend_objectForKeyedSubscript_(a4, v15, v20, v16);
        sub_1B19B9800(v20, (uint64_t)&c);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          sub_1B19B9800((uint64_t)v21, (uint64_t)&c);
        }
        else
        {
          data[0] = 0;
          data[0] = objc_msgSend_hash(v21, v22, v23, v24);
          CC_SHA256_Update(&c, data, 8u);
        }
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v36, (uint64_t)v44, 16);
    }
    while (v17);
  }
  CC_SHA256_Final(md, &c);
  v26 = 0;
  v27 = (char *)data;
  v28.i64[0] = 0xA0A0A0A0A0A0A0A0;
  v28.i64[1] = 0xA0A0A0A0A0A0A0A0;
  v29.i64[0] = 0x3737373737373737;
  v29.i64[1] = 0x3737373737373737;
  v30.i64[0] = 0x3030303030303030;
  v30.i64[1] = 0x3030303030303030;
  v31.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v31.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  v32.i64[0] = 0xA0A0A0A0A0A0A0ALL;
  v32.i64[1] = 0xA0A0A0A0A0A0A0ALL;
  do
  {
    v33 = *(int8x16_t *)&md[v26];
    v46.val[0] = (int8x16_t)vsraq_n_u8((uint8x16_t)vbslq_s8((int8x16_t)vcgtq_u8(v28, (uint8x16_t)v33), v30, v29), (uint8x16_t)v33, 4uLL);
    v34 = vandq_s8(v33, v31);
    v46.val[1] = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8(v32, (uint8x16_t)v34), v30, v29), v34);
    vst2q_s8(v27, v46);
    v27 += 32;
    v26 += 16;
  }
  while (v26 != 32);
  v42 = 0;
  return (id)objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v25, (uint64_t)data, 1);
}

- (id)device
{
  return self->_device;
}

- (void)clearCompiledLibraries
{
  os_unfair_lock_s *p_availableCompiledLibrariesLock;

  p_availableCompiledLibrariesLock = &self->_availableCompiledLibrariesLock;
  os_unfair_lock_lock(&self->_availableCompiledLibrariesLock);
  CFDictionaryRemoveAllValues(self->_availableCompiledLibraries);
  os_unfair_lock_unlock(p_availableCompiledLibrariesLock);
}

- (id)frameworkLibrary
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_library(self->_frameworkLibrary, a2, v2, v3);
}

- (id)defaultLibrary
{
  uint64_t v2;
  uint64_t v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B18F6628;
  block[3] = &unk_1E63D6D80;
  block[4] = self;
  if (qword_1EEF661F0 != -1)
    dispatch_once(&qword_1EEF661F0, block);
  return (id)objc_msgSend_library(self->_defaultLibrary, a2, v2, v3);
}

- (id)commonProfileCacheLibrary
{
  return self->_commonProfileCacheLibrary;
}

- (id)shaderCompilationGroup
{
  return self->_shaderCompilationGroup;
}

- (void)waitForShadersCompilation
{
  dispatch_group_wait((dispatch_group_t)self->_shaderCompilationGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_setEngineStats:(__CFXEngineStats *)a3
{
  self->__engineStats = a3;
}

- (id)deviceQueue
{
  return self->_deviceQueue;
}

- (id)libraryForFile:(id)a3
{
  NSObject *deviceQueue;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_1B18F675C;
  v11 = sub_1B18F676C;
  v12 = 0;
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B18F6778;
  block[3] = &unk_1E63D8DD8;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(deviceQueue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)libraryForSourceCode:(id)a3 options:(id)a4
{
  uint64_t v7;
  const char *v8;
  const void *v9;
  void *Value;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v7 = objc_msgSend_preprocessorMacros(a4, a2, (uint64_t)a3, (uint64_t)a4);
  v9 = (const void *)objc_msgSend_hashCodeForSource_macros_(VFXMTLLibraryManager, v8, (uint64_t)a3, v7);
  os_unfair_lock_lock(&self->_availableCompiledLibrariesLock);
  Value = (void *)CFDictionaryGetValue(self->_availableCompiledLibraries, v9);
  if (!Value)
  {
    v20 = 0;
    ++self->__engineStats->onlineShaderCount;
    v11 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"newLibraryWithSource", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLLibraryManager.mm", 467);
    Value = (void *)objc_msgSend_newLibraryWithSource_options_error_(self->_device, v12, (uint64_t)a3, (uint64_t)a4, &v20);
    self->__engineStats->onlineShaderCompilationTime = CACurrentMediaTime()
                                                     - v11
                                                     + self->__engineStats->onlineShaderCompilationTime;
    prof_endFlame();
    if (Value)
    {
      CFDictionarySetValue(self->_availableCompiledLibraries, v9, Value);

    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Compilation failed %@"), v13, v14, v15, v16, v17, v18, v20);
    }
  }
  os_unfair_lock_unlock(&self->_availableCompiledLibrariesLock);
  return Value;
}

- (void)libraryForProgramDesc:(id *)a3 completionHandler:(id)a4
{
  __CFXFXProgram *var0;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(id, MTLLibrary *, _QWORD);
  MTLLibrary *commonProfileCacheLibrary;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const void *v30;
  MTLLibrary *Value;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int v77;
  uint64_t v78;
  id v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  NSObject *v86;
  os_signpost_id_t v87;
  NSObject *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  uint64_t v97;
  $FA47EB92040BDE94132BF6335E7008C0 var15;
  unint64_t var16;
  __int128 v100;
  __int128 v101;
  int var13;
  MTLDevice *v103;
  const char *v104;
  void *v105;
  MTLDevice *device;
  const void *v107;
  _QWORD v108[6];
  _QWORD v109[6];
  _QWORD v110[2];
  void (*v111)(uint64_t, const char *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v112;
  uint64_t v113;
  VFXMTLLibraryManager *v114;
  const void *v115;
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  $FA47EB92040BDE94132BF6335E7008C0 v122;
  unint64_t v123;
  uint64_t v124;
  os_signpost_id_t v125;
  int v126;
  _QWORD block[9];
  uint8_t buf[8];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  var0 = a3->var0;
  v8 = sub_1B181E7E0((uint64_t)a3->var0);
  if (v8)
  {
    v16 = (void (*)(id, MTLLibrary *, _QWORD))*((_QWORD *)a4 + 2);
    commonProfileCacheLibrary = (MTLLibrary *)v8;
LABEL_3:
    v18 = a4;
LABEL_4:
    v16(v18, commonProfileCacheLibrary, 0);
    return;
  }
  v19 = sub_1B181E570((uint64_t)var0, v9, v10, v11, v12, v13, v14, v15);
  if (!v19)
  {
    if (sub_1B181E7E8((uint64_t)a3->var0, v20, v21, v22, v23, v24, v25, v26))
      v35 = objc_msgSend_defaultLibrary(self, v32, v33, v34);
    else
      v35 = objc_msgSend_frameworkLibrary(self, v32, v33, v34);
    commonProfileCacheLibrary = (MTLLibrary *)v35;
    goto LABEL_15;
  }
  v27 = v19;
  v28 = sub_1B181E600((uint64_t)var0, v20, v21, v22, v23, v24, v25, v26);
  v30 = (const void *)objc_msgSend_hashCodeForSource_macros_(VFXMTLLibraryManager, v29, v27, v28);
  os_unfair_lock_lock(&self->_availableCompiledLibrariesLock);
  Value = (MTLLibrary *)CFDictionaryGetValue(self->_availableCompiledLibraries, v30);
  os_unfair_lock_unlock(&self->_availableCompiledLibrariesLock);
  if (Value)
  {
    v16 = (void (*)(id, MTLLibrary *, _QWORD))*((_QWORD *)a4 + 2);
    v18 = a4;
    commonProfileCacheLibrary = Value;
    goto LABEL_4;
  }
  v36 = sub_1B18B864C();
  v42 = objc_msgSend_count(self->_commonProfilePrecompiledFunctions, v37, v38, v39);
  if (!v42 && !v36)
  {
    v107 = 0;
    v43 = 0;
    goto LABEL_21;
  }
  v43 = (const void *)objc_msgSend_stringByAppendingString_(CFSTR("commonprofile_vert"), v40, (uint64_t)v30, v41);
  v107 = (const void *)objc_msgSend_stringByAppendingString_(CFSTR("commonprofile_frag"), v44, (uint64_t)v30, v45);
  if (v42)
  {
    if (objc_msgSend_objectForKeyedSubscript_(self->_commonProfilePrecompiledFunctions, v46, (uint64_t)v43, v47)
      && objc_msgSend_objectForKeyedSubscript_(self->_commonProfilePrecompiledFunctions, v48, (uint64_t)v107, v50))
    {
      sub_1B181E4E8((uint64_t)var0, 0, v43, v50, v51, v52, v53, v54);
      sub_1B181E4E8((uint64_t)var0, 1, v107, v55, v56, v57, v58, v59);
      sub_1B181E45C(var0, self->_commonProfileCacheLibrary, v60, v61, v62, v63, v64, v65);
      commonProfileCacheLibrary = self->_commonProfileCacheLibrary;
LABEL_15:
      v16 = (void (*)(id, MTLLibrary *, _QWORD))*((_QWORD *)a4 + 2);
      goto LABEL_3;
    }
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Failed to find pre-compiled combination %@ + %@"), v49, v50, v51, v52, v53, v54, (uint64_t)v43);
  }
LABEL_21:
  if (v36)
  {
    v66 = sub_1B17A024C();
    if (v66)
    {
      v67 = v66;
      if (qword_1EEF66200 != -1)
        dispatch_once(&qword_1EEF66200, &unk_1E63D10F0);
      CFRetain(var0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B18F6E6C;
      block[3] = &unk_1E63D8E50;
      block[4] = v67;
      block[5] = v30;
      block[6] = v43;
      block[7] = v107;
      block[8] = var0;
      dispatch_async((dispatch_queue_t)qword_1EEF661F8, block);
    }
  }
  v68 = sub_1B17A0A4C((uint64_t)var0);
  v69 = sub_1B189EAF0();
  v77 = sub_1B181E690((uint64_t)var0, v70, v71, v72, v73, v74, v75, v76);
  if (v69 <= v77)
    v78 = v77;
  else
    v78 = v69;
  v79 = objc_alloc_init(MEMORY[0x1E0CC6A68]);
  objc_msgSend_setPreprocessorMacros_(v79, v80, v28, v81);
  objc_msgSend_setLanguageVersion_(v79, v82, v78, v83);
  objc_msgSend_setAdditionalCompilerArguments_(v79, v84, (uint64_t)CFSTR(" -w "), v85);
  v86 = sub_1B17C439C();
  v87 = os_signpost_id_generate(v86);
  v88 = sub_1B17C439C();
  if (v87 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v96 = v88;
    if (os_signpost_enabled(v88))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = (_DWORD)var0;
      _os_signpost_emit_with_name_impl(&dword_1B178D000, v96, OS_SIGNPOST_INTERVAL_BEGIN, v87, "CompileShader", "programID=%d", buf, 8u);
    }
  }
  v97 = MEMORY[0x1E0C809B0];
  v110[0] = MEMORY[0x1E0C809B0];
  v110[1] = 3221225472;
  v111 = sub_1B18F70C4;
  v112 = &unk_1E63D8E78;
  var15 = a3->var15;
  v121 = *(_OWORD *)&a3->var8;
  v122 = var15;
  var16 = a3->var16;
  v100 = *(_OWORD *)&a3->var2;
  v117 = *(_OWORD *)&a3->var0;
  v118 = v100;
  v101 = *(_OWORD *)&a3->var4;
  v120 = *(_OWORD *)&a3->var6;
  v119 = v101;
  v123 = var16;
  v124 = v68;
  v113 = v27;
  v114 = self;
  v115 = v30;
  v116 = a4;
  v125 = v87;
  v126 = (int)var0;
  ++self->__engineStats->onlineShaderCount;
  var13 = a3->var13;
  if (a3->var13)
  {
    if (var13 == 2)
    {
      device = self->_device;
      v108[0] = v97;
      v108[1] = 3221225472;
      v108[2] = sub_1B18F72E4;
      v108[3] = &unk_1E63D8EC8;
      v108[4] = self;
      v108[5] = v110;
      objc_msgSend_newLibraryWithSource_options_completionHandler_(device, v89, v27, (uint64_t)v79, v108);
    }
    else if (var13 == 1)
    {
      dispatch_group_enter((dispatch_group_t)self->_shaderCompilationGroup);
      v103 = self->_device;
      v109[0] = v97;
      v109[1] = 3221225472;
      v109[2] = sub_1B18F7250;
      v109[3] = &unk_1E63D8EC8;
      v109[4] = self;
      v109[5] = v110;
      objc_msgSend_newLibraryWithSource_options_completionHandler_(v103, v104, v27, (uint64_t)v79, v109);
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unknown compilation mode %d"), v90, v91, v92, v93, v94, v95, a3->var13);
    }
  }
  else
  {
    *(_QWORD *)buf = 0;
    v105 = (void *)objc_msgSend_newLibraryWithSource_options_error_(self->_device, v89, v27, (uint64_t)v79, buf);
    ((void (*)(_QWORD *, void *, _QWORD))v111)(v110, v105, *(_QWORD *)buf);

  }
}

@end
