@implementation VFXMTLResourceManager

+ (void)unregisterManagerForDevice:(id)a3
{
  const char *v4;
  uint64_t v5;

  os_unfair_lock_lock((os_unfair_lock_t)&dword_1EEF66218);
  objc_msgSend_removeObjectForKey_((void *)qword_1ED4CEEE0, v4, (uint64_t)a3, v5);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1EEF66218);
}

- (VFXMTLResourceManager)initWithDevice:(id)a3
{
  VFXMTLResourceManager *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  VFXMTLLibraryManager *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  VFXMTLBufferAllocator *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)VFXMTLResourceManager;
  v4 = -[VFXMTLResourceManager init](&v48, sel_init);
  v5 = (uint64_t)v4;
  if (v4)
  {
    v4->_device = (MTLDevice *)a3;
    if (sub_1B17A0090())
    {
      v9 = (void *)objc_msgSend_newCommandQueue(a3, v6, v7, v8);
      if (!v9)
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: VFXMTLResourceManager initWithDevice : cannot create a command queue. Bailing out."), v11, v12, v13, v14, v15, v16, (uint64_t)v48.receiver);
        return 0;
      }
      *(_QWORD *)(v5 + 16) = v9;
      objc_msgSend_setLabel_(v9, v10, (uint64_t)CFSTR("com.apple.vfx"), v12);
    }
    v17 = [VFXMTLLibraryManager alloc];
    *(_QWORD *)(v5 + 32) = objc_msgSend_initWithDevice_(v17, v18, *(_QWORD *)(v5 + 8), v19);
    v20 = malloc_type_calloc(0x358uLL, 1uLL, 0x743B6DA0uLL);
    *(_QWORD *)(v5 + 24) = v20;
    objc_msgSend__setEngineStats_(*(void **)(v5 + 32), v21, (uint64_t)v20, v22);
    *(_QWORD *)(v5 + 40) = objc_alloc_init(VFXMTLShaderBindingsGenerator);
    v23 = objc_alloc(MEMORY[0x1E0CC6C40]);
    *(_QWORD *)(v5 + 544) = objc_msgSend_initWithDevice_(v23, v24, *(_QWORD *)(v5 + 8), v25);
    v26 = [VFXMTLBufferAllocator alloc];
    *(_QWORD *)(v5 + 64) = objc_msgSend_initWithDevice_fixedSizeElement_buffersize_name_(v26, v27, *(_QWORD *)(v5 + 8), 304, 0x40000, CFSTR("VFXMaterialData"));
    *(_QWORD *)(v5 + 48) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
    *(_DWORD *)(v5 + 56) = 0;
    *(_DWORD *)(v5 + 80) = 0;
    *(_DWORD *)(v5 + 96) = 0;
    *(_DWORD *)(v5 + 112) = 0;
    *(_DWORD *)(v5 + 176) = 0;
    *(_DWORD *)(v5 + 128) = 0;
    *(_DWORD *)(v5 + 144) = 0;
    *(_DWORD *)(v5 + 160) = 0;
    *(_DWORD *)(v5 + 208) = 0;
    *(_DWORD *)(v5 + 272) = 0;
    *(_DWORD *)(v5 + 288) = 0;
    *(_DWORD *)(v5 + 304) = 0;
    *(_DWORD *)(v5 + 368) = 0;
    *(_DWORD *)(v5 + 320) = 0;
    *(_DWORD *)(v5 + 336) = 0;
    *(_DWORD *)(v5 + 352) = 0;
    *(_DWORD *)(v5 + 192) = 0;
    *(_DWORD *)(v5 + 224) = 0;
    *(_DWORD *)(v5 + 240) = 0;
    *(_DWORD *)(v5 + 256) = 0;
    *(_DWORD *)(v5 + 384) = 0;
    *(_DWORD *)(v5 + 400) = 0;
    *(_DWORD *)(v5 + 416) = 0;
    *(_QWORD *)(v5 + 424) = objc_alloc_init(VFXMTLShadableKey);
    *(_QWORD *)(v5 + 432) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_DWORD *)(v5 + 440) = 0;
    v31 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v28, v29, v30);
    objc_msgSend_addObserver_selector_name_object_(v31, v32, v5, (uint64_t)sel__meshSourceWillDie_, CFSTR("kCFXNotificationMeshSourceWillDie"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v33, v5, (uint64_t)sel__meshElementWillDie_, CFSTR("kCFXNotificationMeshElementWillDie"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v34, v5, (uint64_t)sel__meshWillDie_, CFSTR("kCFXNotificationMeshWillDie"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v35, v5, (uint64_t)sel__imageWillDie_, CFSTR("kCFXNotificationImageWillDie"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v36, v5, (uint64_t)sel__imageProxyWillDie_, CFSTR("kCFXNotificationImageProxyWillDie"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v37, v5, (uint64_t)sel__programWillDie_, CFSTR("kCFXNotificationProgramWillDie"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v38, v5, (uint64_t)sel__passWillDie_, CFSTR("kCFXNotificationPassWillDie"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v39, v5, (uint64_t)sel__materialWillDie_, CFSTR("kCFXNotificationMaterialWillDie"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v40, v5, (uint64_t)sel__modelWillDie_, CFSTR("kCFXNotificationGeometryWillDie"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v41, v5, (uint64_t)sel__morphWillDie_, CFSTR("kCFXNotificationMorphWillDie"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v42, v5, (uint64_t)sel__skinWillDie_, CFSTR("kCFXNotificationSkinWillDie"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v43, v5, (uint64_t)sel__deformerStackWillDie_, CFSTR("kCFXNotificationDeformerStackWillDie"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v44, v5, (uint64_t)sel__deformerStackDidChange_, CFSTR("kCFXNotificationDeformerStackDidChange"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v45, v5, (uint64_t)sel__programHashCodeWillDie_, CFSTR("kCFXNotificationProgramHashCodeWillDie"), 0);
    objc_msgSend_addObserver_selector_name_object_(v31, v46, v5, (uint64_t)sel__precomputedLightingEnvironmentWillDie_, CFSTR("kCFXNotificationPrecomputedLightingEnvironmentWillDie"), 0);
    *(_QWORD *)(v5 + 464) = sub_1B181DE74(CFSTR("vfx_debug_vert"), CFSTR("vfx_debug_frag"));
    *(_QWORD *)(v5 + 472) = sub_1B181DE74(CFSTR("debug_post_tessellation_vert"), CFSTR("vfx_debug_frag"));
    *(_QWORD *)(v5 + 480) = sub_1B181DE74(CFSTR("vfx_debug_vert"), CFSTR("debug_isolate_frag"));
    sub_1B194F7E4((const void *)v5, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))sub_1B18F9260, CFSTR("kCFXNotificationRasterizerStatesDidDie"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return (VFXMTLResourceManager *)v5;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  __CFXFXProgram *defaultProgram;
  __CFXFXProgram *defaultProgramForTessellation;
  __CFXFXProgram *isolateProgram;
  const char *v11;
  uint64_t v12;
  objc_super v13;

  v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  self->_availableLightingSystemReflectionProbeTextures.registry = 0;
  self->_availableIrradianceTextures.registry = 0;

  self->_availableRadianceTextures.registry = 0;
  self->_availableIESTextures.registry = 0;

  self->_availableImages.registry = 0;
  self->_availableImageProxy.registry = 0;

  self->_availableSamplers.registry = 0;
  self->_availableMeshes.registry = 0;

  self->_availableDeformerStacks.registry = 0;
  self->_availableSkinDeformerReadOnlyBuffers.registry = 0;

  self->_availableMorphDeformerReadOnlyBuffers.registry = 0;
  self->_availableTessellators.registry = 0;

  self->_availableComputePipelines.registry = 0;
  self->_availableComputePipelinesWithStageDescriptor.registry = 0;

  self->_availableColorMatchingComputePipelines.registry = 0;
  self->_availableBuffers.registry = 0;

  self->_availableMeshSources.registry = 0;
  self->_availableMeshElements.registry = 0;

  self->_availableRasterizerStates.registry = 0;
  self->_availableWireframeMaterials.registry = 0;

  self->_availableOpenSubdivComputeEvaluators.registry = 0;
  self->_availableShadables.registry = 0;
  CFRelease(self->_availablePipelineStates);

  defaultProgram = self->_defaultProgram;
  if (defaultProgram)
  {
    CFRelease(defaultProgram);
    self->_defaultProgram = 0;
  }
  defaultProgramForTessellation = self->_defaultProgramForTessellation;
  if (defaultProgramForTessellation)
  {
    CFRelease(defaultProgramForTessellation);
    self->_defaultProgramForTessellation = 0;
  }
  isolateProgram = self->_isolateProgram;
  if (isolateProgram)
  {
    CFRelease(isolateProgram);
    self->_isolateProgram = 0;
  }

  free(self->__engineStats);
  self->__engineStats = 0;

  objc_msgSend_unregisterManagerForDevice_(VFXMTLResourceManager, v11, (uint64_t)self->_device, v12);
  v13.receiver = self;
  v13.super_class = (Class)VFXMTLResourceManager;
  -[VFXMTLResourceManager dealloc](&v13, sel_dealloc);
}

- (void)_meshSourceWillDie:(id)a3
{
  uint64_t v3;
  const __CFNumber *v5;
  const char *v6;
  uint64_t v7;
  uint64_t valuePtr;

  valuePtr = 0;
  v5 = (const __CFNumber *)objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  CFNumberGetValue(v5, kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableMeshSources.lock);
  objc_msgSend_removeObjectForKey_(self->_availableMeshSources.registry, v6, valuePtr, v7);
  os_unfair_lock_unlock(&self->_availableMeshSources.lock);
}

- (void)_meshElementWillDie:(id)a3
{
  uint64_t v3;
  const __CFNumber *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSMapTable *registry;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t valuePtr;

  valuePtr = 0;
  v5 = (const __CFNumber *)objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  CFNumberGetValue(v5, kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableMeshElements.lock);
  v8 = objc_msgSend_objectForKey_(self->_availableMeshElements.registry, v6, valuePtr, v7);
  v9 = (void *)sub_1B1956188(v8);
  if (!objc_msgSend_decrementUsedCount(v9, v10, v11, v12))
  {
    os_unfair_lock_lock(&self->_availableBuffers.lock);
    registry = self->_availableBuffers.registry;
    v16 = (void *)sub_1B1956188(v8);
    v20 = objc_msgSend_dataSource(v16, v17, v18, v19);
    objc_msgSend_removeObjectForKey_(registry, v21, v20, v22);
    os_unfair_lock_unlock(&self->_availableBuffers.lock);
  }
  objc_msgSend_removeObjectForKey_(self->_availableMeshElements.registry, v13, valuePtr, v14);
  os_unfair_lock_unlock(&self->_availableMeshElements.lock);
}

- (void)_meshWillDie:(id)a3
{
  uint64_t v3;
  const __CFNumber *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSMapTable *registry;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSMapTable *v14;
  const char *v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint64_t valuePtr;

  valuePtr = 0;
  v5 = (const __CFNumber *)objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  CFNumberGetValue(v5, kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableMeshes.lock);
  objc_msgSend_removeObjectForKey_(self->_availableMeshes.registry, v6, valuePtr, v7);
  objc_msgSend_removeObjectForKey_(self->_availableMeshes.registry, v8, valuePtr | 1, v9);
  os_unfair_lock_unlock(&self->_availableMeshes.lock);
  os_unfair_lock_lock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
  registry = self->_availableSkinDeformerReadOnlyBuffers.registry;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1B18F9694;
  v18[3] = &unk_1E63D8F30;
  v18[4] = valuePtr;
  objc_msgSend_vfx_enumerateKeysAndValuesUsingBlock_(registry, v12, (uint64_t)v18, v13);
  os_unfair_lock_unlock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
  os_unfair_lock_lock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
  v14 = self->_availableMorphDeformerReadOnlyBuffers.registry;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = sub_1B18F96CC;
  v17[3] = &unk_1E63D8F30;
  v17[4] = valuePtr;
  objc_msgSend_vfx_enumerateKeysAndValuesUsingBlock_(v14, v15, (uint64_t)v17, v16);
  os_unfair_lock_unlock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
}

- (void)_morphWillDie:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v5 = objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
  objc_msgSend_removeObjectForKey_(self->_availableMorphDeformerReadOnlyBuffers.registry, v6, v5, v7);
  os_unfair_lock_unlock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
}

- (void)_programHashCodeWillDie:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v5 = objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_availableWireframeMaterials.lock);
  objc_msgSend_removeObjectForKey_(self->_availableWireframeMaterials.registry, v6, v5, v7);
  os_unfair_lock_unlock(&self->_availableWireframeMaterials.lock);
}

- (void)_skinWillDie:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v5 = objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
  objc_msgSend_removeObjectForKey_(self->_availableSkinDeformerReadOnlyBuffers.registry, v6, v5, v7);
  os_unfair_lock_unlock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
}

- (void)_deformerStackWillDie:(id)a3
{
  os_unfair_lock_s *p_lock;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;

  p_lock = &self->_availableDeformerStacks.lock;
  os_unfair_lock_lock(&self->_availableDeformerStacks.lock);
  v9 = objc_msgSend_object(a3, v6, v7, v8);
  objc_msgSend_removeObjectForKey_(self->_availableDeformerStacks.registry, v10, v9, v11);
  objc_msgSend_removeObjectForKey_(self->_availableDeformerStacks.registry, v12, v9 | 1, v13);
  os_unfair_lock_unlock(p_lock);
}

- (void)_deformerStackDidChange:(id)a3
{
  os_unfair_lock_s *p_lock;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  _BOOL4 v19;
  NSMapTable *registry;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;

  p_lock = &self->_availableDeformerStacks.lock;
  os_unfair_lock_lock(&self->_availableDeformerStacks.lock);
  v9 = objc_msgSend_object(a3, v6, v7, v8);
  v19 = sub_1B19988A4((_QWORD *)v9, v10, v11, v12, v13, v14, v15, v16);
  registry = self->_availableDeformerStacks.registry;
  v21 = v9 | 1;
  if (v19)
  {
    v22 = objc_msgSend_objectForKey_(registry, v17, v9, v18);
    v25 = objc_msgSend_objectForKey_(self->_availableDeformerStacks.registry, v23, v21, v24);
    sub_1B187139C(v22);
    sub_1B187139C(v25);
  }
  else
  {
    objc_msgSend_removeObjectForKey_(registry, v17, v9, v18);
    objc_msgSend_removeObjectForKey_(self->_availableDeformerStacks.registry, v26, v9 | 1, v27);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_imageWillDie:(id)a3
{
  uint64_t v3;
  const __CFNumber *v5;
  const char *v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t valuePtr;

  valuePtr = 0;
  v5 = (const __CFNumber *)objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  CFNumberGetValue(v5, kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableImages.lock);
  for (i = 0; i != 16; ++i)
  {
    v9 = 0xC6A4A7935BD1E995
       * ((0xC6A4A7935BD1E995 * (i ^ 0x1A929E4D6F47A654 ^ valuePtr)) ^ ((0xC6A4A7935BD1E995
                                                                           * (i ^ 0x1A929E4D6F47A654 ^ valuePtr)) >> 47));
    v10 = v9 ^ (v9 >> 47);
    v11 = objc_msgSend_objectForKey_(self->_availableImages.registry, v6, v10, v7);
    if (v11)
    {
      v12 = v11;
      os_unfair_lock_lock(&self->_availableIrradianceTextures.lock);
      objc_msgSend_removeObjectForKey_(self->_availableIrradianceTextures.registry, v13, v12, v14);
      os_unfair_lock_unlock(&self->_availableIrradianceTextures.lock);
      os_unfair_lock_lock(&self->_availableRadianceTextures.lock);
      objc_msgSend_removeObjectForKey_(self->_availableRadianceTextures.registry, v15, v12, v16);
      os_unfair_lock_unlock(&self->_availableRadianceTextures.lock);
      objc_msgSend_removeObjectForKey_(self->_availableImages.registry, v17, v10, v18);
    }
  }
  os_unfair_lock_unlock(&self->_availableImages.lock);
}

- (void)_imageProxyWillDie:(id)a3
{
  uint64_t v3;
  const __CFNumber *v5;
  const char *v6;
  uint64_t v7;
  uint64_t valuePtr;

  valuePtr = 0;
  v5 = (const __CFNumber *)objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  CFNumberGetValue(v5, kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableImageProxy.lock);
  objc_msgSend_removeObjectForKey_(self->_availableImageProxy.registry, v6, valuePtr, v7);
  os_unfair_lock_unlock(&self->_availableImageProxy.lock);
}

- (void)_precomputedLightingEnvironmentWillDie:(id)a3
{
  uint64_t v3;
  const __CFNumber *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t valuePtr;

  valuePtr = 0;
  v5 = (const __CFNumber *)objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  CFNumberGetValue(v5, kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableIrradianceTextures.lock);
  objc_msgSend_removeObjectForKey_(self->_availableIrradianceTextures.registry, v6, valuePtr, v7);
  os_unfair_lock_unlock(&self->_availableIrradianceTextures.lock);
  os_unfair_lock_lock(&self->_availableRadianceTextures.lock);
  objc_msgSend_removeObjectForKey_(self->_availableRadianceTextures.registry, v8, valuePtr, v9);
  os_unfair_lock_unlock(&self->_availableRadianceTextures.lock);
}

- (void)_rasterizerStateDidDie:(const void *)a3
{
  uint64_t v3;

  objc_msgSend_removeObjectForKey_(self->_availableRasterizerStates.registry, a2, (uint64_t)a3, v3);
}

- (void)_removeMatchingProgram:(__CFXFXProgram *)a3 pass:(__CFXFXPass *)a4
{
  os_unfair_lock_s *p_availablePipelineStatesLock;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const void *ValueAtIndex;
  id v10;
  _QWORD context[2];
  CFArrayRef theArray;

  context[0] = a3;
  context[1] = a4;
  theArray = 0;
  p_availablePipelineStatesLock = &self->_availablePipelineStatesLock;
  os_unfair_lock_lock(&self->_availablePipelineStatesLock);
  CFDictionaryApplyFunction(self->_availablePipelineStates, (CFDictionaryApplierFunction)sub_1B18F9B9C, context);
  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      v7 = Count;
      for (i = 0; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
        v10 = (id)(id)CFDictionaryGetValue(self->_availablePipelineStates, ValueAtIndex);
        CFDictionaryRemoveValue(self->_availablePipelineStates, ValueAtIndex);
      }
    }
    CFRelease(theArray);
  }
  os_unfair_lock_unlock(p_availablePipelineStatesLock);
}

- (void)_programWillDie:(id)a3
{
  uint64_t v3;
  const __CFNumber *v5;
  NSMapTable *registry;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  const char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t valuePtr;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  v5 = (const __CFNumber *)objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  CFNumberGetValue(v5, kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableShadables.lock);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  registry = self->_availableShadables.registry;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(registry, v7, (uint64_t)&v27, (uint64_t)v33, 16);
  if (v8)
  {
    v11 = v8;
    v12 = 0;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(registry);
        v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (*(_QWORD *)(*(_QWORD *)(v15 + 24) + 16) == valuePtr)
        {
          if (!v12)
            v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend_addObject_(v12, v9, v15, v10);
        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(registry, v9, (uint64_t)&v27, (uint64_t)v33, 16);
    }
    while (v11);
    if (v12)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v9, (uint64_t)&v23, (uint64_t)v32, 16);
      if (v16)
      {
        v19 = v16;
        v20 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v24 != v20)
              objc_enumerationMutation(v12);
            objc_msgSend_removeObjectForKey_(self->_availableShadables.registry, v17, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), v18);
          }
          v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v17, (uint64_t)&v23, (uint64_t)v32, 16);
        }
        while (v19);
      }

    }
  }
  os_unfair_lock_unlock(&self->_availableShadables.lock);
  objc_msgSend__removeMatchingProgram_pass_(self, v22, valuePtr, 0);
}

- (void)_passWillDie:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  os_unfair_lock_s *p_lock;
  NSMapTable *registry;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  const char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  p_lock = &self->_availableShadables.lock;
  os_unfair_lock_lock(&self->_availableShadables.lock);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  registry = self->_availableShadables.registry;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(registry, v8, (uint64_t)&v28, (uint64_t)v33, 16);
  if (v9)
  {
    v12 = v9;
    v13 = 0;
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(registry);
        v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (*(_QWORD *)(*(_QWORD *)(v16 + 24) + 24) == v5)
        {
          if (!v13)
            v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend_addObject_(v13, v10, v16, v11);
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(registry, v10, (uint64_t)&v28, (uint64_t)v33, 16);
    }
    while (v12);
    p_lock = &self->_availableShadables.lock;
    if (v13)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v10, (uint64_t)&v24, (uint64_t)v32, 16);
      if (v17)
      {
        v20 = v17;
        v21 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v25 != v21)
              objc_enumerationMutation(v13);
            objc_msgSend_removeObjectForKey_(self->_availableShadables.registry, v18, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j), v19);
          }
          v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v18, (uint64_t)&v24, (uint64_t)v32, 16);
        }
        while (v20);
      }

    }
  }
  os_unfair_lock_unlock(p_lock);
  objc_msgSend__removeMatchingProgram_pass_(self, v23, 0, v5);
}

- (void)_materialWillDie:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  NSMapTable *registry;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_availableShadables.lock);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  registry = self->_availableShadables.registry;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(registry, v7, (uint64_t)&v26, (uint64_t)v31, 16);
  if (v8)
  {
    v11 = v8;
    v12 = 0;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(registry);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (*(_QWORD *)(v15 + 8) == v5)
        {
          if (!v12)
            v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend_addObject_(v12, v9, v15, v10);
        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(registry, v9, (uint64_t)&v26, (uint64_t)v31, 16);
    }
    while (v11);
    if (v12)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v9, (uint64_t)&v22, (uint64_t)v30, 16);
      if (v16)
      {
        v19 = v16;
        v20 = *(_QWORD *)v23;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v23 != v20)
              objc_enumerationMutation(v12);
            objc_msgSend_removeObjectForKey_(self->_availableShadables.registry, v17, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), v18);
          }
          v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v17, (uint64_t)&v22, (uint64_t)v30, 16);
        }
        while (v19);
      }

    }
  }
  os_unfair_lock_unlock(&self->_availableShadables.lock);
}

- (void)_modelWillDie:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  NSMapTable *registry;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  const char *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_availableShadables.lock);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  registry = self->_availableShadables.registry;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(registry, v7, (uint64_t)&v28, (uint64_t)v33, 16);
  if (v8)
  {
    v11 = v8;
    v12 = 0;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(registry);
        v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (*(_QWORD *)(v15 + 16) == v5)
        {
          if (!v12)
            v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend_addObject_(v12, v9, v15, v10);
        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(registry, v9, (uint64_t)&v28, (uint64_t)v33, 16);
    }
    while (v11);
    if (v12)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v9, (uint64_t)&v24, (uint64_t)v32, 16);
      if (v16)
      {
        v19 = v16;
        v20 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v25 != v20)
              objc_enumerationMutation(v12);
            objc_msgSend_removeObjectForKey_(self->_availableShadables.registry, v17, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j), v18);
          }
          v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v17, (uint64_t)&v24, (uint64_t)v32, 16);
        }
        while (v19);
      }

    }
  }
  os_unfair_lock_unlock(&self->_availableShadables.lock);
  os_unfair_lock_lock(&self->_availableTessellators.lock);
  objc_msgSend_removeObjectForKey_(self->_availableTessellators.registry, v22, v5, v23);
  os_unfair_lock_unlock(&self->_availableTessellators.lock);
}

- (id)_bufferForMTLBuffer:(void *)a3
{
  os_unfair_lock_s *p_lock;
  const char *v6;
  uint64_t v7;
  NSMapTable *registry;
  id v9;
  const char *v10;
  VFXMTLBuffer *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  VFXMTLBuffer *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;

  p_lock = &self->_availableBuffers.lock;
  os_unfair_lock_lock(&self->_availableBuffers.lock);
  registry = self->_availableBuffers.registry;
  if (!registry)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3748]);
    registry = (NSMapTable *)objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v9, v10, 258, 0, 100);
    self->_availableBuffers.registry = registry;
  }
  v11 = (VFXMTLBuffer *)objc_msgSend_objectForKey_(registry, v6, (uint64_t)a3, v7);
  if (v11)
  {
    v15 = v11;
    objc_msgSend_incrementUsedCount(v11, v12, v13, v14);
  }
  else
  {
    v15 = objc_alloc_init(VFXMTLBuffer);
    objc_msgSend_setBuffer_(v15, v16, (uint64_t)a3, v17);
    objc_msgSend_setDataSource_(v15, v18, (uint64_t)a3, v19);
    objc_msgSend_incrementUsedCount(v15, v20, v21, v22);
    objc_msgSend_setObject_forKey_(self->_availableBuffers.registry, v23, (uint64_t)v15, (uint64_t)a3);

  }
  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)_bufferForData:(__CFData *)a3 bytesPerIndex:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  const char *v8;
  uint64_t v9;
  NSMapTable *registry;
  id v11;
  const char *v12;
  VFXMTLBuffer *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  VFXMTLBuffer *v17;
  unsigned __int8 *BytePtr;
  CFIndex Length;
  const char *v20;
  uint64_t v21;
  CFIndex v22;
  uint64_t v23;
  const char *v24;
  double v25;
  _WORD *v26;
  __int16 v27;
  __CFXEngineStats *engineStats;
  const char *v29;
  uint64_t v30;
  __CFXEngineStats *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_availableBuffers.lock;
  os_unfair_lock_lock(&self->_availableBuffers.lock);
  registry = self->_availableBuffers.registry;
  if (!registry)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3748]);
    registry = (NSMapTable *)objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v11, v12, 258, 0, 100);
    self->_availableBuffers.registry = registry;
  }
  v13 = (VFXMTLBuffer *)objc_msgSend_objectForKey_(registry, v8, (uint64_t)a3, v9);
  if (v13)
  {
    v17 = v13;
    objc_msgSend_incrementUsedCount(v13, v14, v15, v16);
  }
  else
  {
    v17 = objc_alloc_init(VFXMTLBuffer);
    BytePtr = (unsigned __int8 *)CFDataGetBytePtr(a3);
    Length = CFDataGetLength(a3);
    if (BytePtr)
    {
      v22 = Length;
      if (a4 == 1)
      {
        v23 = 2 * Length;
        v25 = MEMORY[0x1E0C80A78](Length, v20);
        if (v22)
        {
          v26 = (_WORD *)((char *)v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
          do
          {
            v27 = *BytePtr++;
            *v26++ = v27;
            --v22;
          }
          while (v22);
        }
        BytePtr = (unsigned __int8 *)objc_msgSend_newBufferWithBytes_length_options_(self->_device, v24, (uint64_t)v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), v23, 0, v25);
        engineStats = self->__engineStats;
        ++engineStats->iboCount;
        engineStats->iboMemory += v23;
        objc_msgSend_setOffset_(v17, v29, 0, v30);
      }
      else
      {
        if (Length)
          BytePtr = (unsigned __int8 *)objc_msgSend_newBufferWithBytes_length_options_(self->_device, v20, (uint64_t)BytePtr, Length, 0);
        else
          BytePtr = 0;
        v31 = self->__engineStats;
        ++v31->iboCount;
        v31->iboMemory += v22;
        objc_msgSend_setOffset_(v17, v20, 0, v21);
      }
    }
    objc_msgSend_setBuffer_(v17, v20, (uint64_t)BytePtr, v21);

    objc_msgSend_setDataSource_(v17, v32, (uint64_t)a3, v33);
    objc_msgSend_incrementUsedCount(v17, v34, v35, v36);
    objc_msgSend_setObject_forKey_(self->_availableBuffers.registry, v37, (uint64_t)v17, (uint64_t)a3);

  }
  os_unfair_lock_unlock(p_lock);
  return v17;
}

+ (void)_fillVertexDescriptor:(id)a3 withMeshSource:(__CFXMeshSource *)a4 semantic:(char)a5 inputSet:(int64_t)a6 bufferIndex:(int64_t)a7
{
  uint64_t v7;

  sub_1B18FAC48(a3, (uint64_t)a4, a5, a6, a7, a6, a7, v7);
}

+ (void)_fillVertexDescriptor:(id)a3 withSemantic:(char)a4 inputSet:(int64_t)a5 bufferIndex:(int64_t)a6 vertexFormat:(unint64_t)a7 offset:(unint64_t)a8 stride:(unint64_t)a9
{
  char v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;

  v13 = 0;
  switch(a4)
  {
    case 0:
      break;
    case 1:
      v13 = 1;
      break;
    case 2:
      v13 = 3;
      break;
    case 3:
      if (a5 == -1)
      {
        v13 = 6;
      }
      else
      {
        v13 = a5 + 6;
        if ((a5 + 6) == 14)
          goto LABEL_6;
      }
      break;
    case 4:
      v13 = 2;
      break;
    case 5:
      v13 = 4;
      break;
    case 6:
      v13 = 5;
      break;
    default:
LABEL_6:
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Semantic %d is not meant to be passed to shaders"), (uint64_t)a3, a4, a5, a6, a7, a8, (uint64_t)"attribute != kCFXVertexAttrib_None");
      v13 = 14;
      break;
  }
  v14 = a6 + 18;
  v15 = (void *)objc_msgSend_attributes(a3, a2, (uint64_t)a3, a4, a5);
  v18 = (void *)objc_msgSend_objectAtIndexedSubscript_(v15, v16, v13, v17);
  objc_msgSend_setFormat_(v18, v19, a7, v20);
  v24 = (void *)objc_msgSend_attributes(a3, v21, v22, v23);
  v27 = (void *)objc_msgSend_objectAtIndexedSubscript_(v24, v25, v13, v26);
  objc_msgSend_setOffset_(v27, v28, a8, v29);
  v33 = (void *)objc_msgSend_attributes(a3, v30, v31, v32);
  v36 = (void *)objc_msgSend_objectAtIndexedSubscript_(v33, v34, v13, v35);
  objc_msgSend_setBufferIndex_(v36, v37, v14, v38);
  v42 = (void *)objc_msgSend_layouts(a3, v39, v40, v41);
  v45 = (void *)objc_msgSend_objectAtIndexedSubscript_(v42, v43, v14, v44);
  objc_msgSend_setStride_(v45, v46, a9, v47);
  v51 = (void *)objc_msgSend_layouts(a3, v48, v49, v50);
  v54 = (void *)objc_msgSend_objectAtIndexedSubscript_(v51, v52, v14, v53);
  objc_msgSend_setStepFunction_(v54, v55, 1, v56);
}

- (void)__updateMutableMesh:(__CFXMesh *)a3 withMetalMesh:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  _QWORD v19[6];

  v11 = sub_1B18767C4((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  if (v11 != sub_1B18FD774((uint64_t)a4))
  {
    sub_1B1955D94((uint64_t)a4, v11);
    os_unfair_lock_lock(&self->_availableMeshSources.lock);
    if (!self->_availableMeshSources.registry)
    {
      v17 = objc_alloc(MEMORY[0x1E0CB3748]);
      self->_availableMeshSources.registry = (NSMapTable *)objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v17, v18, 258, 0, 100);
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1B18FB0AC;
    v19[3] = &unk_1E63D8F58;
    v19[4] = self;
    v19[5] = a4;
    sub_1B1873EE0((uint64_t)a3, 1, (uint64_t)v19, v12, v13, v14, v15, v16);
    os_unfair_lock_unlock(&self->_availableMeshSources.lock);
  }
}

- (id)renderResourceForDeformerStack:(__CFXDeformerStack *)a3 node:(__CFXNode *)a4 dataKind:(unsigned __int8)a5
{
  unint64_t v9;
  os_unfair_lock_s *p_lock;
  const char *v11;
  uint64_t v12;
  NSMapTable *registry;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;

  v9 = (a5 == 0) | (unint64_t)a3;
  p_lock = &self->_availableDeformerStacks.lock;
  os_unfair_lock_lock(&self->_availableDeformerStacks.lock);
  registry = self->_availableDeformerStacks.registry;
  if (!registry)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3748]);
    registry = (NSMapTable *)objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v14, v15, 258, 0, 100);
    self->_availableDeformerStacks.registry = registry;
  }
  v16 = (void *)objc_msgSend_objectForKey_(registry, v11, v9, v12);
  if (!v16)
  {
    v16 = sub_1B186FA7C([VFXMTLDeformerStack alloc], (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)self);
    objc_msgSend_setObject_forKey_(self->_availableDeformerStacks.registry, v17, (uint64_t)v16, v9);

  }
  os_unfair_lock_unlock(p_lock);
  return v16;
}

- (id)renderResourceForSkinner:(__CFXSkinner *)a3 baseMesh:(__CFXMesh *)a4 dataKind:(unsigned __int8)a5 provider:(id)a6
{
  int v7;
  os_unfair_lock_s *p_lock;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  const char *v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  NSMapTable *registry;
  const char *v27;
  uint64_t v28;
  void *v29;
  _QWORD v31[8];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;

  v7 = a5;
  p_lock = &self->_availableSkinDeformerReadOnlyBuffers.lock;
  os_unfair_lock_lock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
  if (!self->_availableSkinDeformerReadOnlyBuffers.registry)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3748]);
    self->_availableSkinDeformerReadOnlyBuffers.registry = (NSMapTable *)objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v12, v13, 258, 0, 100);
  }
  v14 = sub_1B17A0A4C((uint64_t)a3);
  v19 = (void *)objc_msgSend_objectForKey_(self->_availableSkinDeformerReadOnlyBuffers.registry, v15, v14, v16);
  if (!v19)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB3748]);
    v19 = (void *)objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v20, v21, 258, 0, 1);
    objc_msgSend_setObject_forKey_(self->_availableSkinDeformerReadOnlyBuffers.registry, v22, (uint64_t)v19, v14);

  }
  v23 = (v7 == 0) | (unint64_t)a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = sub_1B18FB948;
  v36 = sub_1B18FB958;
  v37 = 0;
  v37 = objc_msgSend_objectForKey_(v19, v17, v23, v18);
  if (!v33[5])
  {
    registry = self->_availableSkinDeformerReadOnlyBuffers.registry;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = sub_1B18FB964;
    v31[3] = &unk_1E63D8FD0;
    v31[6] = &v32;
    v31[7] = v14;
    v31[4] = v19;
    v31[5] = v23;
    objc_msgSend_vfx_enumerateKeysAndValuesUsingBlock_(registry, v24, (uint64_t)v31, v25);
    v28 = v33[5];
    if (!v28)
    {
      v28 = (*((uint64_t (**)(id))a6 + 2))(a6);
      v33[5] = v28;
    }
    objc_msgSend_setObject_forKey_(v19, v27, v28, v23);
  }
  os_unfair_lock_unlock(p_lock);
  v29 = (void *)v33[5];
  _Block_object_dispose(&v32, 8);
  return v29;
}

- (id)renderResourceForMorpher:(__CFXMorpher *)a3 baseMesh:(__CFXMesh *)a4 dataKind:(unsigned __int8)a5 provider:(id)a6
{
  int v7;
  os_unfair_lock_s *p_lock;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  const char *v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  NSMapTable *registry;
  const char *v27;
  uint64_t v28;
  void *v29;
  _QWORD v31[8];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;

  v7 = a5;
  p_lock = &self->_availableMorphDeformerReadOnlyBuffers.lock;
  os_unfair_lock_lock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
  if (!self->_availableMorphDeformerReadOnlyBuffers.registry)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3748]);
    self->_availableMorphDeformerReadOnlyBuffers.registry = (NSMapTable *)objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v12, v13, 258, 0, 100);
  }
  v14 = sub_1B17A0A4C((uint64_t)a3);
  v19 = (void *)objc_msgSend_objectForKey_(self->_availableMorphDeformerReadOnlyBuffers.registry, v15, v14, v16);
  if (!v19)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB3748]);
    v19 = (void *)objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v20, v21, 258, 0, 1);
    objc_msgSend_setObject_forKey_(self->_availableMorphDeformerReadOnlyBuffers.registry, v22, (uint64_t)v19, v14);

  }
  v23 = (v7 == 0) | (unint64_t)a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = sub_1B18FB948;
  v36 = sub_1B18FB958;
  v37 = 0;
  v37 = objc_msgSend_objectForKey_(v19, v17, v23, v18);
  if (!v33[5])
  {
    registry = self->_availableMorphDeformerReadOnlyBuffers.registry;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = sub_1B18FBBB4;
    v31[3] = &unk_1E63D8FD0;
    v31[6] = &v32;
    v31[7] = v14;
    v31[4] = v19;
    v31[5] = v23;
    objc_msgSend_vfx_enumerateKeysAndValuesUsingBlock_(registry, v24, (uint64_t)v31, v25);
    v28 = v33[5];
    if (!v28)
    {
      v28 = (*((uint64_t (**)(id))a6 + 2))(a6);
      v33[5] = v28;
    }
    objc_msgSend_setObject_forKey_(v19, v27, v28, v23);
  }
  os_unfair_lock_unlock(p_lock);
  v29 = (void *)v33[5];
  _Block_object_dispose(&v32, 8);
  return v29;
}

- (void)commandBufferDidCompleteWithError:(id)a3
{
  os_unfair_lock_s *p_lock;
  const char *v5;
  uint64_t v6;

  p_lock = &self->_availableDeformerStacks.lock;
  os_unfair_lock_lock(&self->_availableDeformerStacks.lock);
  objc_msgSend_vfx_enumerateKeysAndValuesUsingBlock_(self->_availableDeformerStacks.registry, v5, (uint64_t)&unk_1E63D17F0, v6);
  os_unfair_lock_unlock(p_lock);
}

- (id)defaultLightingEnvironmentIrradianceTexture
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  MTLTexture *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
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
  uint64_t v29;
  MTLTexture *defaultLightingEnvironmentIrradianceTexture;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!self->_defaultLightingEnvironmentIrradianceTexture)
  {
    v3 = (void *)MEMORY[0x1E0CB34D0];
    v4 = objc_opt_class();
    v7 = (void *)objc_msgSend_bundleForClass_(v3, v5, v4, v6);
    v9 = objc_msgSend_URLForResource_withExtension_(v7, v8, (uint64_t)CFSTR("VFXDefaultIrradiance"), (uint64_t)CFSTR("ktx"));
    v32 = *MEMORY[0x1E0CC6C08];
    v33[0] = MEMORY[0x1E0C9AAA0];
    v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v33, (uint64_t)&v32, 1);
    v13 = (MTLTexture *)objc_msgSend_newTextureUsingMTKTextureLoaderWithURL_options_(self, v12, v9, v11);
    self->_defaultLightingEnvironmentIrradianceTexture = v13;
    if (objc_msgSend_textureType(v13, v14, v15, v16) != 5)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Default irradiance texture is not valid"), v18, v19, v20, v21, v22, v23, (uint64_t)"_defaultLightingEnvironmentIrradianceTexture.textureType == MTLTextureTypeCube");
    if (objc_msgSend_pixelFormat(self->_defaultLightingEnvironmentIrradianceTexture, v17, v18, v19) != 115)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Default irradiance texture is not valid"), v24, v25, v26, v27, v28, v29, (uint64_t)"_defaultLightingEnvironmentIrradianceTexture.pixelFormat == MTLPixelFormatRGBA16Float");
  }
  defaultLightingEnvironmentIrradianceTexture = self->_defaultLightingEnvironmentIrradianceTexture;
  objc_sync_exit(self);
  return defaultLightingEnvironmentIrradianceTexture;
}

- (id)defaultLightingEnvironmentRadianceTexture
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  MTLTexture *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
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
  uint64_t v29;
  MTLTexture *defaultLightingEnvironmentRadianceTexture;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!self->_defaultLightingEnvironmentRadianceTexture)
  {
    v3 = (void *)MEMORY[0x1E0CB34D0];
    v4 = objc_opt_class();
    v7 = (void *)objc_msgSend_bundleForClass_(v3, v5, v4, v6);
    v9 = objc_msgSend_URLForResource_withExtension_(v7, v8, (uint64_t)CFSTR("VFXDefaultRadiance"), (uint64_t)CFSTR("ktx"));
    v32 = *MEMORY[0x1E0CC6C08];
    v33[0] = MEMORY[0x1E0C9AAA0];
    v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v33, (uint64_t)&v32, 1);
    v13 = (MTLTexture *)objc_msgSend_newTextureUsingMTKTextureLoaderWithURL_options_(self, v12, v9, v11);
    self->_defaultLightingEnvironmentRadianceTexture = v13;
    if (objc_msgSend_textureType(v13, v14, v15, v16) != 5)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Default radiance texture is not valid"), v18, v19, v20, v21, v22, v23, (uint64_t)"_defaultLightingEnvironmentRadianceTexture.textureType == MTLTextureTypeCube");
    if (objc_msgSend_pixelFormat(self->_defaultLightingEnvironmentRadianceTexture, v17, v18, v19) != 115)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Default radiance texture is not valid"), v24, v25, v26, v27, v28, v29, (uint64_t)"_defaultLightingEnvironmentRadianceTexture.pixelFormat == MTLPixelFormatRGBA16Float");
  }
  defaultLightingEnvironmentRadianceTexture = self->_defaultLightingEnvironmentRadianceTexture;
  objc_sync_exit(self);
  return defaultLightingEnvironmentRadianceTexture;
}

- (id)irradianceTextureForPrecomputedLightingEnvironment:(id)a3
{
  uint64_t *p_availableIrradianceTextures;
  os_unfair_lock_s *p_lock;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  p_availableIrradianceTextures = (uint64_t *)&self->_availableIrradianceTextures;
  p_lock = &self->_availableIrradianceTextures.lock;
  os_unfair_lock_lock(&self->_availableIrradianceTextures.lock);
  v9 = (void *)*p_availableIrradianceTextures;
  if (!*p_availableIrradianceTextures)
  {
    sub_1B18F8DC0(p_availableIrradianceTextures, 0);
    v9 = (void *)*p_availableIrradianceTextures;
  }
  v10 = objc_msgSend_objectForKey_(v9, v7, (uint64_t)a3, v8);
  if (v10)
  {
    v14 = (void *)v10;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v15 = objc_msgSend_irradianceData(a3, v11, v12, v13);
    v37 = *MEMORY[0x1E0CC6C08];
    v38[0] = MEMORY[0x1E0C9AAA0];
    v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v38, (uint64_t)&v37, 1);
    v14 = (void *)objc_msgSend_newTextureUsingMTKTextureLoaderWithData_options_(self, v18, v15, v17);
    if (objc_msgSend_textureType(v14, v19, v20, v21) != 5)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Pre-computed irradiance texture is not valid"), v23, v24, v25, v26, v27, v28, (uint64_t)"irradianceTexture.textureType == MTLTextureTypeCube");
    if (objc_msgSend_pixelFormat(v14, v22, v23, v24) != 115)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Pre-computed irradiance texture is not valid"), v30, v31, v32, v33, v34, v35, (uint64_t)"irradianceTexture.pixelFormat == MTLPixelFormatRGBA16Float");
    objc_msgSend_setObject_forKey_((void *)*p_availableIrradianceTextures, v29, (uint64_t)v14, (uint64_t)a3);
    os_unfair_lock_unlock(p_lock);

  }
  return v14;
}

- (id)radianceTextureForPrecomputedLightingEnvironment:(id)a3
{
  uint64_t *p_availableRadianceTextures;
  os_unfair_lock_s *p_lock;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  p_availableRadianceTextures = (uint64_t *)&self->_availableRadianceTextures;
  p_lock = &self->_availableRadianceTextures.lock;
  os_unfair_lock_lock(&self->_availableRadianceTextures.lock);
  v9 = (void *)*p_availableRadianceTextures;
  if (!*p_availableRadianceTextures)
  {
    sub_1B18F8DC0(p_availableRadianceTextures, 0);
    v9 = (void *)*p_availableRadianceTextures;
  }
  v10 = objc_msgSend_objectForKey_(v9, v7, (uint64_t)a3, v8);
  if (v10)
  {
    v14 = (void *)v10;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v15 = objc_msgSend_radianceData(a3, v11, v12, v13);
    v37 = *MEMORY[0x1E0CC6C08];
    v38[0] = MEMORY[0x1E0C9AAA0];
    v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v38, (uint64_t)&v37, 1);
    v14 = (void *)objc_msgSend_newTextureUsingMTKTextureLoaderWithData_options_(self, v18, v15, v17);
    if (objc_msgSend_textureType(v14, v19, v20, v21) != 5)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Pre-computed radiance texture is not valid"), v23, v24, v25, v26, v27, v28, (uint64_t)"radianceTexture.textureType == MTLTextureTypeCube");
    if (objc_msgSend_pixelFormat(v14, v22, v23, v24) != 115)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Pre-computed radiance texture is not valid"), v30, v31, v32, v33, v34, v35, (uint64_t)"radianceTexture.pixelFormat == MTLPixelFormatRGBA16Float");
    objc_msgSend_setObject_forKey_((void *)*p_availableRadianceTextures, v29, (uint64_t)v14, (uint64_t)a3);
    os_unfair_lock_unlock(p_lock);

  }
  return v14;
}

- (id)irradianceTextureForEnvironmentTexture:(id)a3 renderContext:(id)a4 applySH:(id)a5
{
  uint64_t *p_availableIrradianceTextures;
  os_unfair_lock_s *p_lock;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;

  p_availableIrradianceTextures = (uint64_t *)&self->_availableIrradianceTextures;
  p_lock = &self->_availableIrradianceTextures.lock;
  os_unfair_lock_lock(&self->_availableIrradianceTextures.lock);
  v13 = (void *)*p_availableIrradianceTextures;
  if (!*p_availableIrradianceTextures)
  {
    sub_1B18F8DC0(p_availableIrradianceTextures, 0);
    v13 = (void *)*p_availableIrradianceTextures;
  }
  v14 = objc_msgSend_objectForKey_(v13, v11, (uint64_t)a3, v12);
  if (v14)
  {
    v16 = (void *)v14;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v17 = (void *)objc_msgSend_textureCubeDescriptorWithPixelFormat_size_mipmapped_(MEMORY[0x1E0CC6BB0], v15, 115, 64, 0);
    objc_msgSend_setUsage_(v17, v18, 1, v19);
    v23 = objc_msgSend_usage(v17, v20, v21, v22);
    objc_msgSend_setUsage_(v17, v24, v23 | 4, v25);
    objc_msgSend_setStorageMode_(v17, v26, 2, v27);
    v16 = (void *)objc_msgSend_newTextureWithDescriptor_(self, v28, (uint64_t)v17, v29);
    objc_msgSend_setObject_forKey_((void *)*p_availableIrradianceTextures, v30, (uint64_t)v16, (uint64_t)a3);
    os_unfair_lock_unlock(p_lock);

    objc_msgSend__bakeSphericalHamonicsBasedIrradianceTexture_forEnvironmentTexture_renderContext_applySH_(self, v31, (uint64_t)v16, (uint64_t)a3, a4, a5);
  }
  return v16;
}

- (void)_bakeStochasticIrradianceTexture:(id)a3 forEnvironmentTexture:(id)a4 mipmapLevelForSampling:(unint64_t)a5 renderContext:(id)a6
{
  int v7;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void **v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *EncoderAndResetCache;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void **v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  _QWORD v60[3];
  _QWORD v61[3];
  int v62;
  int v63;

  v7 = a5;
  v10 = objc_msgSend_computePipelineStateForKernel_(self, a2, (uint64_t)CFSTR("compute_diffusePreIntegrated_texture2d"), (uint64_t)a4);
  v11 = (void *)sub_1B18FD774(v10);
  v15 = objc_msgSend_threadExecutionWidth(v11, v12, v13, v14);
  v19 = objc_msgSend_maxTotalThreadsPerThreadgroup(v11, v16, v17, v18);
  v23 = vcvtms_u32_f32(sqrtf((float)v19));
  if (v15 * v15 <= v19)
    v24 = v15;
  else
    v24 = v23;
  v25 = (void **)objc_msgSend_resourceComputeEncoder(a6, v20, v21, v22, a6);
  EncoderAndResetCache = (void *)objc_msgSend_getEncoderAndResetCache(*v25, v26, v27, v28);
  objc_msgSend_setComputePipelineState_(EncoderAndResetCache, v30, (uint64_t)v11, v31);
  v35 = 0;
  v36 = v24 - 1;
  do
  {
    v37 = objc_msgSend_pixelFormat(a3, v32, v33, v34);
    v39 = (void *)objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(a3, v38, v37, 2, 0, 1, v35, 1);
    objc_msgSend_setTexture_atIndex_(EncoderAndResetCache, v40, (uint64_t)v39, 0);
    objc_msgSend_setTexture_atIndex_(EncoderAndResetCache, v41, (uint64_t)a4, 1);
    v62 = v35;
    v63 = v7;
    objc_msgSend_setBytes_length_atIndex_(EncoderAndResetCache, v42, (uint64_t)&v63, 4, 0);
    objc_msgSend_setBytes_length_atIndex_(EncoderAndResetCache, v43, (uint64_t)&v62, 4, 1);
    v47 = (v36 + objc_msgSend_width(v39, v44, v45, v46)) / v24;
    v51 = objc_msgSend_height(v39, v48, v49, v50);
    v61[0] = v47;
    v61[1] = (v36 + v51) / v24;
    v61[2] = 1;
    v60[0] = v24;
    v60[1] = v24;
    v60[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(EncoderAndResetCache, v52, (uint64_t)v61, (uint64_t)v60);

    ++v35;
  }
  while (v35 != 6);
  if ((unint64_t)objc_msgSend_mipmapLevelCount(a3, v32, v33, v34) > 1)
  {
    v56 = (void **)objc_msgSend_resourceBlitEncoder(v59, v53, v54, v55);
    sub_1B1913528(v56, a3, v57, v58);
  }
}

- (void)_bakeSphericalHamonicsBasedIrradianceTexture:(id)a3 forEnvironmentTexture:(id)a4 renderContext:(id)a5 applySH:(id)a6
{
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t i;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  _OWORD v77[6];
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  const __CFString *v92;
  __int128 v93;
  uint64_t v94;
  _QWORD v95[6];

  v11 = objc_msgSend_resourceCommandBuffer(a5, a2, (uint64_t)a3, (uint64_t)a4);
  v16 = objc_msgSend_sphericalHarmonicsForEnvironmentTexture_order_commandBuffer_(self, v12, (uint64_t)a4, 3, v11);
  if (a6)
  {
    v17 = (void *)objc_msgSend_resourceCommandBuffer(a5, v13, v14, v15);
    v95[0] = MEMORY[0x1E0C809B0];
    v95[1] = 3221225472;
    v95[2] = sub_1B19137C4;
    v95[3] = &unk_1E63D9488;
    v95[4] = v16;
    v95[5] = a6;
    objc_msgSend_addCompletedHandler_(v17, v18, (uint64_t)v95, v19);
  }
  v20 = objc_msgSend_frameworkLibrary(self->_libraryManager, v13, v14, v15);
  memset(v77, 0, sizeof(v77));
  v78 = 0;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0;
  v93 = 0u;
  v94 = 0;
  v79 = v20;
  *(_QWORD *)&v80 = objc_msgSend_pixelFormat(a3, v21, v22, v23);
  v92 = CFSTR("vfx_draw_fullscreen_quad_vertex");
  *(_QWORD *)&v93 = CFSTR("cubemap_from_sh");
  v26 = (void *)objc_msgSend_newRenderPipelineStateWithDesc_(self, v24, (uint64_t)v77, v25);
  v30 = (void *)objc_msgSend_resourceCommandBuffer(a5, v27, v28, v29);
  for (i = 0; i != 6; ++i)
  {
    v32 = objc_alloc_init(MEMORY[0x1E0CC6B50]);
    v36 = (void *)objc_msgSend_colorAttachments(v32, v33, v34, v35);
    v39 = (void *)objc_msgSend_objectAtIndexedSubscript_(v36, v37, 0, v38);
    objc_msgSend_setTexture_(v39, v40, (uint64_t)a3, v41);
    v45 = (void *)objc_msgSend_colorAttachments(v32, v42, v43, v44);
    v48 = (void *)objc_msgSend_objectAtIndexedSubscript_(v45, v46, 0, v47);
    objc_msgSend_setLevel_(v48, v49, 0, v50);
    v54 = (void *)objc_msgSend_colorAttachments(v32, v51, v52, v53);
    v57 = (void *)objc_msgSend_objectAtIndexedSubscript_(v54, v55, 0, v56);
    objc_msgSend_setSlice_(v57, v58, i, v59);
    v62 = (void *)objc_msgSend_renderCommandEncoderWithDescriptor_(v30, v60, (uint64_t)v32, v61);

    v66 = objc_msgSend_state(v26, v63, v64, v65);
    objc_msgSend_setRenderPipelineState_(v62, v67, v66, v68);
    objc_msgSend_setFragmentTexture_atIndex_(v62, v69, (uint64_t)a4, 1);
    v76 = i;
    objc_msgSend_setFragmentBuffer_offset_atIndex_(v62, v70, v16, 0, 0);
    objc_msgSend_setFragmentBytes_length_atIndex_(v62, v71, (uint64_t)&v76, 4, 1);
    objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v62, v72, 4, 0, 4);
    objc_msgSend_endEncoding(v62, v73, v74, v75);
  }

}

- (id)newRadianceTextureForEnvironmentTexture:(id)a3 engineContext:(__CFXEngineContext *)a4 cpuAccessible:(BOOL)a5 commandBuffer:(id)a6
{
  _BOOL4 v7;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  _BOOL4 v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  unint64_t v81;
  uint64_t v82;
  const char *v83;
  const char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  char v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v114;
  unint64_t v115;
  void *v116;
  uint64_t v117;
  _QWORD v118[3];
  _QWORD v119[3];
  float v120;

  v7 = a5;
  v11 = (void *)objc_msgSend_textureCubeDescriptorWithPixelFormat_size_mipmapped_(MEMORY[0x1E0CC6BB0], a2, 115, 256, 1);
  objc_msgSend_setUsage_(v11, v12, 1, v13);
  v17 = objc_msgSend_usage(v11, v14, v15, v16);
  objc_msgSend_setUsage_(v11, v18, v17 | 0x10, v19);
  v23 = objc_msgSend_usage(v11, v20, v21, v22);
  objc_msgSend_setUsage_(v11, v24, v23 | 2, v25);
  if (v7)
    objc_msgSend_setStorageMode_(v11, v26, 0, v27);
  else
    objc_msgSend_setStorageMode_(v11, v26, 2, v27);
  v115 = objc_msgSend_mipmapLevelCount(a3, v28, v29, v30);
  v114 = objc_msgSend_mipmapLevelCount(v11, v31, v32, v33);
  v37 = objc_msgSend_mipmapLevelCount(v11, v34, v35, v36);
  objc_msgSend_setMipmapLevelCount_(v11, v38, v37 - 4, v39);
  v42 = (void *)objc_msgSend_newTextureWithDescriptor_(self, v40, (uint64_t)v11, v41);
  v45 = sub_1B1815AD8((uint64_t)a4, 512);
  if (v45)
    v46 = objc_msgSend_computePipelineStateForKernel_(self, v43, (uint64_t)CFSTR("compute_specularPreIntegratedLD_texturecube"), v44);
  else
    v46 = objc_msgSend_computePipelineStateForKernel_(self, v43, (uint64_t)CFSTR("compute_specularPreIntegratedLD_texture2d"), v44);
  v47 = (void *)sub_1B18FD774(v46);
  v51 = objc_msgSend_threadExecutionWidth(v47, v48, v49, v50);
  v55 = objc_msgSend_maxTotalThreadsPerThreadgroup(v47, v52, v53, v54);
  do
  {
    v59 = v51;
    v60 = 6 * v51 * v51;
    v51 >>= 1;
  }
  while (v60 > v55);
  v61 = (void *)objc_msgSend_computeCommandEncoder(a6, v56, v57, v58);
  objc_msgSend_setComputePipelineState_(v61, v62, (uint64_t)v47, v63);
  objc_msgSend_setTexture_atIndex_(v61, v64, (uint64_t)a3, 1);
  if (objc_msgSend_mipmapLevelCount(v42, v65, v66, v67))
  {
    v71 = 0;
    v72 = 6;
    if (!v45)
      v72 = 1;
    v117 = v72;
    do
    {
      if (v115 < 2)
      {
        v116 = 0;
      }
      else
      {
        v73 = objc_msgSend_mipmapLevelCount(a3, v68, v69, v70);
        if (v73 < v114)
          v77 = -1;
        else
          v77 = v73 - v114;
        v78 = objc_msgSend_pixelFormat(a3, v74, v75, v76);
        v116 = (void *)objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(a3, v79, v78, 5, v71 + v77 + 1, 1, 0, 6);
        objc_msgSend_setTexture_atIndex_(v61, v80, (uint64_t)v116, 1);
      }
      v81 = 0;
      do
      {
        if (v45)
        {
          v82 = objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(v42, v68, 115, 5, v71, 1, 0, 6);
        }
        else
        {
          v120 = *(float *)&v81;
          objc_msgSend_setBytes_length_atIndex_(v61, v68, (uint64_t)&v120, 4, 1);
          v82 = objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(v42, v84, 115, 2, v71, 1, v81, 1);
        }
        v85 = (void *)v82;
        objc_msgSend_setTexture_atIndex_(v61, v83, v82, 0);
        v89 = objc_msgSend_mipmapLevelCount(v42, v86, v87, v88);
        LODWORD(v93) = 0;
        if (v89 >= 2)
          *(float *)&v93 = 1.0 / (float)(unint64_t)(objc_msgSend_mipmapLevelCount(v42, v90, v91, v92, v93) - 1);
        v120 = fminf(fmaxf(*(float *)&v93 * (float)v71, 0.01), 1.0);
        objc_msgSend_setBytes_length_atIndex_(v61, v90, (uint64_t)&v120, 4, 0);
        v97 = objc_msgSend_width(v85, v94, v95, v96);
        if (v59 >= v97)
          v101 = v97;
        else
          v101 = v59;
        v102 = (v101 - 1 + objc_msgSend_width(v85, v98, v99, v100)) / v101;
        v106 = objc_msgSend_height(v85, v103, v104, v105);
        v119[0] = v102;
        v119[1] = (v101 - 1 + v106) / v101;
        v119[2] = v117;
        v118[0] = v101;
        v118[1] = v101;
        v118[2] = 1;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v61, v107, (uint64_t)v119, (uint64_t)v118);

        v109 = v81++ > 4 || v45;
      }
      while ((v109 & 1) == 0);

      ++v71;
    }
    while (v71 < objc_msgSend_mipmapLevelCount(v42, v110, v111, v112));
  }
  objc_msgSend_endEncoding(v61, v68, v69, v70);
  return v42;
}

- (id)radianceTextureForEnvironmentTexture:(id)a3 engineContext:(__CFXEngineContext *)a4 commandBuffer:(id)a5
{
  uint64_t *p_availableRadianceTextures;
  os_unfair_lock_s *p_lock;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;

  p_availableRadianceTextures = (uint64_t *)&self->_availableRadianceTextures;
  p_lock = &self->_availableRadianceTextures.lock;
  os_unfair_lock_lock(&self->_availableRadianceTextures.lock);
  v13 = (void *)*p_availableRadianceTextures;
  if (!*p_availableRadianceTextures)
  {
    sub_1B18F8DC0(p_availableRadianceTextures, 0);
    v13 = (void *)*p_availableRadianceTextures;
  }
  v14 = objc_msgSend_objectForKey_(v13, v11, (uint64_t)a3, v12);
  if (v14)
  {
    v16 = (void *)v14;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v16 = (void *)objc_msgSend_newRadianceTextureForEnvironmentTexture_engineContext_cpuAccessible_commandBuffer_(self, v15, (uint64_t)a3, (uint64_t)a4, 0, a5);
    objc_msgSend_setObject_forKey_((void *)*p_availableRadianceTextures, v17, (uint64_t)v16, (uint64_t)a3);
    os_unfair_lock_unlock(p_lock);

  }
  return v16;
}

- (id)specularDFGDiffuseHammonTextureWithRenderContext:(id)a3
{
  const char *v5;
  MTLTexture *specularDFGDiffuseHammonTexture;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void **v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *EncoderAndResetCache;
  const char *v26;
  uint64_t v27;
  const char *v28;

  objc_sync_enter(self);
  specularDFGDiffuseHammonTexture = self->_specularDFGDiffuseHammonTexture;
  if (!specularDFGDiffuseHammonTexture)
  {
    v7 = (void *)objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E0CC6BB0], v5, 115, 128, 128, 0);
    objc_msgSend_setUsage_(v7, v8, 3, v9);
    objc_msgSend_setStorageMode_(v7, v10, 2, v11);
    self->_specularDFGDiffuseHammonTexture = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(self, v12, (uint64_t)v7, v13);
    v16 = objc_msgSend_computePipelineStateForKernel_(self, v14, (uint64_t)CFSTR("compute_specularPreIntegratedDFG_diffuseHammon"), v15);
    v17 = (void *)sub_1B18FD774(v16);
    v21 = (void **)objc_msgSend_resourceComputeEncoder(a3, v18, v19, v20);
    EncoderAndResetCache = (void *)objc_msgSend_getEncoderAndResetCache(*v21, v22, v23, v24);
    objc_msgSend_setComputePipelineState_(EncoderAndResetCache, v26, (uint64_t)v17, v27);
    objc_msgSend_setTexture_atIndex_(EncoderAndResetCache, v28, (uint64_t)self->_specularDFGDiffuseHammonTexture, 0);
    sub_1B18FD494((uint64_t)self, (char *)self->_specularDFGDiffuseHammonTexture, EncoderAndResetCache, v17);
    specularDFGDiffuseHammonTexture = self->_specularDFGDiffuseHammonTexture;
  }
  objc_sync_exit(self);
  return specularDFGDiffuseHammonTexture;
}

- (id)areaLightPrecomputedDataTexture
{
  const char *v3;
  MTLTexture *areaLightPrecomputedDataTexture;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  MTLTexture *v14;
  const char *v15;
  MTLTexture *v16;
  const char *v17;
  MTLTexture *v18;
  const char *v19;
  _QWORD v21[3];
  int64x2_t v22;
  uint64_t v23;
  _QWORD v24[3];
  int64x2_t v25;
  uint64_t v26;
  _QWORD v27[3];
  int64x2_t v28;
  uint64_t v29;

  objc_sync_enter(self);
  areaLightPrecomputedDataTexture = self->_areaLightPrecomputedDataTexture;
  if (!areaLightPrecomputedDataTexture)
  {
    v5 = (void *)objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E0CC6BB0], v3, 125, 64, 64, 0);
    objc_msgSend_setStorageMode_(v5, v6, 0, v7);
    objc_msgSend_setTextureType_(v5, v8, 3, v9);
    objc_msgSend_setArrayLength_(v5, v10, 3, v11);
    v14 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(self->_device, v12, (uint64_t)v5, v13);
    self->_areaLightPrecomputedDataTexture = v14;
    memset(v27, 0, sizeof(v27));
    v28 = vdupq_n_s64(0x40uLL);
    v29 = 1;
    objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(v14, v15, (uint64_t)v27, 0, 0, &unk_1B22481D0, 1024, 0x10000);
    v16 = self->_areaLightPrecomputedDataTexture;
    memset(v24, 0, sizeof(v24));
    v25 = vdupq_n_s64(0x40uLL);
    v26 = 1;
    objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(v16, v17, (uint64_t)v24, 0, 1, &unk_1B22581D0, 1024, 0x10000);
    v18 = self->_areaLightPrecomputedDataTexture;
    memset(v21, 0, sizeof(v21));
    v22 = vdupq_n_s64(0x40uLL);
    v23 = 1;
    objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(v18, v19, (uint64_t)v21, 0, 2, &unk_1B22581D0, 1024, 0x10000);
    areaLightPrecomputedDataTexture = self->_areaLightPrecomputedDataTexture;
  }
  objc_sync_exit(self);
  return areaLightPrecomputedDataTexture;
}

- (id)renderResourceForProgramDesc:(id *)a3 renderPassDescriptor:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXFXProgram *var0;
  __CFXFXPass *var3;
  _QWORD *var5;
  __CFXBlendStates *var6;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int var11;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  unsigned __int8 v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  const void *v117;
  os_unfair_lock_s *p_availablePipelineStatesLock;
  void *Value;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  $FA47EB92040BDE94132BF6335E7008C0 var15;
  unint64_t var16;
  __int128 v148;
  __int128 v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v162;
  uint64_t v163;
  VFXMTLResourceManager *v164;
  _QWORD *v165;
  id var1;
  _BYTE __dst[328];
  _OWORD __src[21];
  _QWORD v169[2];
  __int128 v170;
  _OWORD v171[4];
  __int128 v172;
  __int128 v173;

  var0 = a3->var0;
  var3 = a3->var3;
  var5 = a3->var5;
  var6 = a3->var6;
  v15 = a3->var15.var0;
  v165 = var5;
  var1 = a3->var15.var1;
  v172 = 0u;
  v173 = 0u;
  memset(v171, 0, sizeof(v171));
  v170 = 0u;
  if (v15)
    v16 = (uint64_t)sub_1B1955A0C(var5, a2, (uint64_t)a3, (uint64_t)a4);
  else
    v16 = sub_1B1955904((uint64_t)var5, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  v169[0] = v16;
  if (!v16)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v17, v18, v19, v20, v21, v22, (uint64_t)"localHash.vertexDescriptorHash");
  v23 = 0;
  v169[1] = sub_1B181DE6C((uint64_t)var0);
  *((_QWORD *)&v170 + 1) = var3;
  LOBYTE(v171[0]) = v15;
  do
  {
    v27 = (void *)objc_msgSend_colorAttachments(a4, v24, v25, v26);
    v30 = (void *)objc_msgSend_objectAtIndexedSubscript_(v27, v28, v23, v29);
    v34 = (void *)objc_msgSend_texture(v30, v31, v32, v33);
    *((_QWORD *)v171 + ++v23) = objc_msgSend_pixelFormat(v34, v35, v36, v37);
  }
  while (v23 != 8);
  v38 = (void *)objc_msgSend_depthAttachment(a4, v24, v25, v26);
  v42 = (void *)objc_msgSend_texture(v38, v39, v40, v41);
  *((_QWORD *)&v172 + 1) = objc_msgSend_pixelFormat(v42, v43, v44, v45);
  v49 = (void *)objc_msgSend_stencilAttachment(a4, v46, v47, v48);
  v53 = (void *)objc_msgSend_texture(v49, v50, v51, v52);
  *(_QWORD *)&v173 = objc_msgSend_pixelFormat(v53, v54, v55, v56);
  BYTE8(v173) = a3->var9;
  var11 = a3->var11;
  if (var11 <= 1)
    LOBYTE(var11) = 1;
  BYTE10(v173) = var11;
  v61 = (void *)objc_msgSend_colorAttachments(a4, v57, v58, v59);
  v64 = (void *)objc_msgSend_objectAtIndexedSubscript_(v61, v62, 0, v63);
  v68 = (void *)objc_msgSend_texture(v64, v65, v66, v67);
  v72 = objc_msgSend_sampleCount(v68, v69, v70, v71);
  if (v72 <= 1)
    v76 = 1;
  else
    v76 = v72;
  v77 = (void *)objc_msgSend_depthAttachment(a4, v73, v74, v75);
  v81 = (void *)objc_msgSend_texture(v77, v78, v79, v80);
  v85 = objc_msgSend_sampleCount(v81, v82, v83, v84);
  if (v76 <= v85)
    v76 = v85;
  v89 = (void *)objc_msgSend_stencilAttachment(a4, v86, v87, v88);
  v93 = (void *)objc_msgSend_texture(v89, v90, v91, v92);
  v97 = objc_msgSend_sampleCount(v93, v94, v95, v96);
  v101 = v76;
  if (v76 <= v97)
    v101 = v97;
  BYTE9(v173) = v101;
  v102 = (void *)objc_msgSend_colorAttachments(a4, v98, v99, v100);
  v105 = (void *)objc_msgSend_objectAtIndexedSubscript_(v102, v103, 0, v104);
  v109 = (void *)objc_msgSend_texture(v105, v106, v107, v108);
  v113 = objc_msgSend_pixelFormat(v109, v110, v111, v112);
  v114 = (uint64_t)var6;
  if (!v113)
    v114 = sub_1B18A7C20();
  v115 = 0;
  *(_QWORD *)&v170 = v114;
  BYTE11(v173) = a3->var8;
  v116 = 0x5253C9ADE8F4CA80;
  do
  {
    v116 = 0xC6A4A7935BD1E995
         * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * v169[v115]) ^ ((0xC6A4A7935BD1E995 * v169[v115]) >> 47))) ^ v116);
    ++v115;
  }
  while (v115 != 16);
  v117 = (const void *)((0xC6A4A7935BD1E995 * (v116 ^ (v116 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v116 ^ (v116 >> 47))) >> 47));
  p_availablePipelineStatesLock = &self->_availablePipelineStatesLock;
  os_unfair_lock_lock(&self->_availablePipelineStatesLock);
  Value = (void *)CFDictionaryGetValue(self->_availablePipelineStates, v117);
  if (Value)
  {
    v126 = Value;
LABEL_33:
    os_unfair_lock_unlock(p_availablePipelineStatesLock);
    return v126;
  }
  v164 = self;
  v127 = sub_1B181E40C((uint64_t)var0, 0, v120, v121, v122, v123, v124, v125);
  if (v127)
  {
    v134 = v127;
    v163 = sub_1B181E40C((uint64_t)var0, 1, v128, v129, v130, v131, v132, v133);
    v142 = sub_1B181E6D8((uint64_t)var0, v135, v136, v137, v138, v139, v140, v141);
    memset(&__src[17], 0, 56);
    var15 = a3->var15;
    __src[4] = *(_OWORD *)&a3->var8;
    __src[5] = var15;
    var16 = a3->var16;
    v148 = *(_OWORD *)&a3->var2;
    __src[0] = *(_OWORD *)&a3->var0;
    __src[1] = v148;
    v149 = *(_OWORD *)&a3->var6;
    __src[2] = *(_OWORD *)&a3->var4;
    __src[3] = v149;
    *(_OWORD *)((char *)&__src[11] + 8) = 0u;
    *(_OWORD *)((char *)&__src[10] + 8) = 0u;
    *(_OWORD *)((char *)&__src[9] + 8) = 0u;
    *(_OWORD *)((char *)&__src[8] + 8) = 0u;
    *(_OWORD *)((char *)&__src[7] + 8) = 0u;
    *(_OWORD *)((char *)&__src[6] + 8) = 0u;
    *(_QWORD *)&__src[6] = var16;
    *((_QWORD *)&__src[12] + 1) = var6;
    *(_QWORD *)&__src[13] = a3->var8;
    *((_QWORD *)&__src[13] + 1) = *(_QWORD *)&__src[13];
    *(_QWORD *)&__src[14] = *(_QWORD *)&__src[13];
    *((_QWORD *)&__src[14] + 1) = *(_QWORD *)&__src[13];
    *(_QWORD *)&__src[15] = *(_QWORD *)&__src[13];
    *((_QWORD *)&__src[15] + 1) = *(_QWORD *)&__src[13];
    __src[16] = *(unint64_t *)&__src[13];
    LOBYTE(__src[17]) = a3->var9;
    *((_QWORD *)&__src[17] + 1) = v142;
    if (v15)
      v150 = (uint64_t)sub_1B19559E4(v165, v143, v144, v145);
    else
      v150 = sub_1B18FD780((uint64_t)v165);
    *(_QWORD *)&__src[18] = v150;
    *((_QWORD *)&__src[18] + 1) = v134;
    *(_QWORD *)&__src[19] = v163;
    *((_QWORD *)&__src[19] + 1) = var1;
    LOBYTE(__src[20]) = a3->var13;
    *(_WORD *)((char *)&__src[20] + 1) = 256;
    BYTE3(__src[20]) = 1;
    sub_1B1954D58((uint64_t)&__src[7], a4, v151, v152);
    memcpy(__dst, __src, sizeof(__dst));
    v126 = (void *)objc_msgSend_newRenderPipelineStateWithDesc_(v164, v153, (uint64_t)__dst, v154);
    if (!v126)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v155, v156, v157, v158, v159, v160, (uint64_t)"renderPipeline");
    CFDictionarySetValue(v164->_availablePipelineStates, v117, v126);

    goto LABEL_33;
  }
  if ((byte_1EEF66598 & 1) == 0)
  {
    byte_1EEF66598 = 1;
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Metal renderer does not support nil vertex function name"), v128, v129, v130, v131, v132, v133, v162);
  }
  os_unfair_lock_unlock(&self->_availablePipelineStatesLock);
  return 0;
}

- (__CFXFXProgram)defaultProgramUsingTessellation:(BOOL)a3
{
  int *v3;

  v3 = &OBJC_IVAR___VFXMTLResourceManager__defaultProgram;
  if (a3)
    v3 = &OBJC_IVAR___VFXMTLResourceManager__defaultProgramForTessellation;
  return *(__CFXFXProgram **)((char *)&self->super.isa + *v3);
}

- (void)_createPipelineStateWithDescriptor:(id)a3 desc:(id *)a4 pipeline:(id)a5
{
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  MTLDevice *device;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  _QWORD v24[6];
  _QWORD v25[8];
  _BYTE v26[328];
  _QWORD v27[2];
  void (*v28)(uint64_t, const char *, void *, uint64_t);
  void *v29;
  id v30;
  id v31;
  _BYTE v32[328];
  _QWORD __dst[41];

  memcpy(__dst, a4, sizeof(__dst));
  sub_1B1954E40((uint64_t)__dst);
  v9 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v28 = sub_1B19445C8;
  v29 = &unk_1E63D9930;
  memcpy(v32, a4, sizeof(v32));
  v30 = a5;
  v31 = a3;
  ++self->__engineStats->renderPipelineCount;
  if (a4->var11 - 1 >= 2)
  {
    if (a4->var11)
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unknown compilation mode %d"), v11, v12, v13, v14, v15, v16, a4->var11);
    }
    else
    {
      __dst[0] = 0;
      if (a4->var13)
      {
        v23 = 0;
        v21 = (void *)objc_msgSend_newRenderPipelineStateWithDescriptor_options_reflection_error_(self->_device, v10, (uint64_t)a3, 3, &v23, __dst);
        ((void (*)(_QWORD *, void *, _QWORD))v28)(v27, v21, __dst[0]);
        if (v21)
          objc_msgSend_generateBindingsForPipeline_withReflection_program_material_geometry_pass_(self->_bindingsGenerator, v22, (uint64_t)a5, v23, a4->var0.var0, a4->var0.var1, a4->var0.var2, a4->var0.var3);
      }
      else
      {
        v21 = (void *)objc_msgSend_newRenderPipelineStateWithDescriptor_error_(self->_device, v10, (uint64_t)a3, (uint64_t)__dst);
        ((void (*)(_QWORD *, void *, _QWORD))v28)(v27, v21, __dst[0]);
      }

    }
  }
  else
  {
    v17 = objc_msgSend_shaderCompilationGroup(self->_libraryManager, v10, v11, v12);
    dispatch_group_enter(v17);
    device = self->_device;
    if (a4->var13)
    {
      v25[0] = v9;
      v25[1] = 3221225472;
      v25[2] = sub_1B19446E4;
      v25[3] = &unk_1E63D9980;
      memcpy(v26, a4, sizeof(v26));
      v25[4] = self;
      v25[5] = a5;
      v25[6] = v17;
      v25[7] = v27;
      objc_msgSend_newRenderPipelineStateWithDescriptor_options_completionHandler_(device, v20, (uint64_t)a3, 3, v25);
    }
    else
    {
      v24[0] = v9;
      v24[1] = 3221225472;
      v24[2] = sub_1B1944860;
      v24[3] = &unk_1E63D99A8;
      v24[4] = v17;
      v24[5] = v27;
      objc_msgSend_newRenderPipelineStateWithDescriptor_completionHandler_(device, v18, (uint64_t)a3, (uint64_t)v24);
    }
  }
}

- (id)newRenderPipelineStateWithDesc:(id *)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  VFXMTLRenderPipeline *v11;
  const char *v12;
  VFXMTLLibraryManager *libraryManager;
  $FA47EB92040BDE94132BF6335E7008C0 var15;
  __int128 v15;
  __int128 v16;
  const char *v17;
  _QWORD v19[6];
  _BYTE v20[328];
  _OWORD __dst[21];

  if (a3->var1)
  {
    objc_msgSend_hotReloadableLibrary(self->_libraryManager, a2, (uint64_t)a3, v3);
    memcpy(__dst, a3, 0x148uLL);
    v9 = sub_1B19441AC((uint64_t)__dst, v6, v7, v8);
    if (v9)
    {
      v10 = (uint64_t)v9;
      v11 = objc_alloc_init(VFXMTLRenderPipeline);
      memcpy(__dst, a3, 0x148uLL);
      objc_msgSend__createPipelineStateWithDescriptor_desc_pipeline_(self, v12, v10, (uint64_t)__dst, v11);
      ++self->__engineStats->prgCount;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v11 = objc_alloc_init(VFXMTLRenderPipeline);
    memcpy(__dst, a3, 0x148uLL);
    sub_1B1954E40((uint64_t)__dst);
    libraryManager = self->_libraryManager;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1B1944A10;
    v19[3] = &unk_1E63D99D0;
    memcpy(v20, a3, sizeof(v20));
    v19[4] = self;
    v19[5] = v11;
    var15 = a3->var0.var15;
    __dst[4] = *(_OWORD *)&a3->var0.var8;
    __dst[5] = var15;
    *(_QWORD *)&__dst[6] = a3->var0.var16;
    v15 = *(_OWORD *)&a3->var0.var2;
    __dst[0] = *(_OWORD *)&a3->var0.var0;
    __dst[1] = v15;
    v16 = *(_OWORD *)&a3->var0.var6;
    __dst[2] = *(_OWORD *)&a3->var0.var4;
    __dst[3] = v16;
    objc_msgSend_libraryForProgramDesc_completionHandler_(libraryManager, v17, (uint64_t)__dst, (uint64_t)v19);
  }
  return v11;
}

- (id)_newComputeDescriptorForPipelineDesc:(id *)a3 library:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void (**var3)(id, void *, id);
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  v5 = objc_msgSend_newFunctionWithName_constants_library_(self, a2, (uint64_t)a3->var0, (uint64_t)a3->var1, a4);
  if (!v5)
    return 0;
  v6 = (void *)v5;
  v7 = objc_alloc_init(MEMORY[0x1E0CC6A80]);
  objc_msgSend_setComputeFunction_(v7, v8, (uint64_t)v6, v9);

  var3 = (void (**)(id, void *, id))a3->var3;
  if (var3)
    var3[2](var3, v6, a3->var2);
  if (a3->var7)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CC6B20]);
    objc_msgSend_setFunctions_(v13, v14, (uint64_t)a3->var7, v15);
    objc_msgSend_setLinkedFunctions_(v7, v16, (uint64_t)v13, v17);
  }
  objc_msgSend_setThreadGroupSizeIsMultipleOfThreadExecutionWidth_(v7, v10, a3->var4, v11);
  objc_msgSend_setStageInputDescriptor_(v7, v18, (uint64_t)a3->var2, v19);
  return v7;
}

- (void)_configureComputePipeline:(id)a3 withDescriptor:(id)a4
{
  double v7;
  const char *v8;
  char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;

  v18 = 0;
  ++self->__engineStats->computePipelineCount;
  v7 = CACurrentMediaTime();
  prof_beginFlame((uint64_t)"configure compute pipeline", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLResourceManager+Compilation.m", 570);
  v9 = (char *)objc_msgSend_newComputePipelineStateWithDescriptor_options_reflection_error_(self->_device, v8, (uint64_t)a4, 0, 0, &v18);
  self->__engineStats->computePipelineCompilationTime = CACurrentMediaTime()
                                                      - v7
                                                      + self->__engineStats->computePipelineCompilationTime;
  prof_endFlame();
  if (v9)
  {
    v17 = (char *)objc_msgSend_computeFunction(a4, v10, v11, v12);
    sub_1B19558A4(a3, v17);
    sub_1B1955890(a3, v9);

  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Failed creating ComputePipelineState, error: %@"), v11, v12, v13, v14, v15, v16, v18);
  }
}

- (id)newComputePipelineStateForDesc:(id *)a3 library:(id)a4
{
  __int128 v5;
  uint64_t v6;
  void *v7;
  VFXMTLComputePipeline *v8;
  const char *v9;
  _OWORD v11[3];

  v5 = *(_OWORD *)&a3->var2;
  v11[0] = *(_OWORD *)&a3->var0;
  v11[1] = v5;
  v11[2] = *(_OWORD *)&a3->var4;
  v6 = objc_msgSend__newComputeDescriptorForPipelineDesc_library_(self, a2, (uint64_t)v11, (uint64_t)a4);
  if (!v6)
    return 0;
  v7 = (void *)v6;
  v8 = objc_alloc_init(VFXMTLComputePipeline);
  objc_msgSend__configureComputePipeline_withDescriptor_(self, v9, (uint64_t)v8, (uint64_t)v7);

  return v8;
}

- (id)computePipelineStateForKernel:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__computePipelineStateForKernel_constants_constantsHash_threadGroupSizeIsMultipleOfThreadExecutionWidth_, a3, 0);
}

- (id)computePipelineStateForKernel:(id)a3 threadGroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__computePipelineStateForKernel_constants_constantsHash_threadGroupSizeIsMultipleOfThreadExecutionWidth_, a3, 0);
}

- (id)computePipelineStateForKernel:(id)a3 constants:(id)a4 constantsHash:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__computePipelineStateForKernel_constants_constantsHash_threadGroupSizeIsMultipleOfThreadExecutionWidth_, a3, a4);
}

- (id)_computePipelineStateForKernel:(id)a3 constants:(id)a4 constantsHash:(id)a5 threadGroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a6
{
  uint64_t *p_availableComputePipelines;
  os_unfair_lock_s *p_lock;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  _QWORD v32[4];
  BOOL v33;
  __int16 v34;
  int v35;
  char v36;
  uint64_t v37;

  p_availableComputePipelines = (uint64_t *)&self->_availableComputePipelines;
  p_lock = &self->_availableComputePipelines.lock;
  os_unfair_lock_lock(&self->_availableComputePipelines.lock);
  if (*p_availableComputePipelines)
  {
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    sub_1B18F8DC0(p_availableComputePipelines, 1);
    if (!a4)
      goto LABEL_7;
  }
  if (!a5)
  {
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Caching requires a constant hash to be provided when using constants"), v14, v15, v16, v17, v18, v19, (uint64_t)"constants == nil || constantsHash != nil");
    v20 = (uint64_t)a3;
    v23 = objc_msgSend_objectForKey_((void *)*p_availableComputePipelines, v21, (uint64_t)a3, v22);
    goto LABEL_10;
  }
LABEL_7:
  v20 = (uint64_t)a3;
  if (a5)
    v20 = objc_msgSend_stringByAppendingString_(a3, v13, (uint64_t)a5, v15);
  v23 = objc_msgSend_objectForKey_((void *)*p_availableComputePipelines, v13, v20, v15);
LABEL_10:
  v27 = (void *)v23;
  if (!v23)
  {
    v36 = 0;
    v35 = 0;
    v28 = objc_msgSend_frameworkLibrary(self->_libraryManager, v24, v25, v26);
    v32[0] = a3;
    v32[1] = a4;
    v32[2] = 0;
    v32[3] = 0;
    v33 = a6;
    v34 = 0;
    v37 = 0;
    v27 = (void *)objc_msgSend_newComputePipelineStateForDesc_library_(self, v29, (uint64_t)v32, v28);
    if (v27)
    {
      objc_msgSend_setObject_forKey_((void *)*p_availableComputePipelines, v30, (uint64_t)v27, v20);

    }
  }
  os_unfair_lock_unlock(p_lock);
  return v27;
}

- (id)computePipelineStateForKernel:(id)a3 withStageDescriptor:(id)a4 stageDescriptorUpdateBlock:(id)a5 constants:(id)a6 constantsHash:(id)a7
{
  uint64_t *p_availableComputePipelinesWithStageDescriptor;
  os_unfair_lock_s *p_lock;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t Object;
  uint64_t v43;
  uint64_t UniqueStageDescriptor;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  id v61;
  id v62;
  id v63;
  _BYTE v64[11];
  int v65;
  char v66;
  uint64_t v67;

  p_availableComputePipelinesWithStageDescriptor = (uint64_t *)&self->_availableComputePipelinesWithStageDescriptor;
  p_lock = &self->_availableComputePipelinesWithStageDescriptor.lock;
  os_unfair_lock_lock(&self->_availableComputePipelinesWithStageDescriptor.lock);
  if (*p_availableComputePipelinesWithStageDescriptor)
  {
    if (!a6)
      goto LABEL_7;
  }
  else
  {
    sub_1B18F8DC0(p_availableComputePipelinesWithStageDescriptor, 1);
    if (!a6)
      goto LABEL_7;
  }
  if (!a7)
  {
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Caching requires a constant hash to be provided when using constants"), v16, v17, v18, v19, v20, v21, (uint64_t)"constants == nil || constantsHash != nil");
    v22 = (uint64_t)a3;
    v25 = objc_msgSend_objectForKey_((void *)*p_availableComputePipelinesWithStageDescriptor, v23, (uint64_t)a3, v24);
    goto LABEL_10;
  }
LABEL_7:
  v22 = (uint64_t)a3;
  if (a7)
    v22 = objc_msgSend_stringByAppendingString_(a3, v15, (uint64_t)a7, v17);
  v25 = objc_msgSend_objectForKey_((void *)*p_availableComputePipelinesWithStageDescriptor, v15, v22, v17);
LABEL_10:
  v33 = (void *)v25;
  if (v25)
  {
    if (a4)
      goto LABEL_12;
  }
  else
  {
    v33 = (void *)objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], v26, 10, v28);
    objc_msgSend_setObject_forKey_((void *)*p_availableComputePipelinesWithStageDescriptor, v34, (uint64_t)v33, v22);
    if (a4)
    {
LABEL_12:
      if (!a5)
        goto LABEL_18;
      goto LABEL_16;
    }
  }
  sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v27, v28, v29, v30, v31, v32, (uint64_t)"stageDescriptor");
  if (!a5)
  {
LABEL_18:
    UniqueStageDescriptor = objc_msgSend_getUniqueStageDescriptor_(self, v26, (uint64_t)a4, v28);
    v50 = (void *)objc_msgSend_objectForKey_(v33, v45, UniqueStageDescriptor, v46);
    if (!v50)
    {
      v66 = 0;
      v65 = 0;
      v51 = objc_msgSend_frameworkLibrary(self->_libraryManager, v47, v48, v49);
      v61 = a3;
      v62 = a6;
      v63 = a4;
      memset(v64, 0, sizeof(v64));
      v67 = 0;
      v50 = (void *)objc_msgSend_newComputePipelineStateForDesc_library_(self, v52, (uint64_t)&v61, v51);
      if (v50)
      {
        objc_msgSend_setObject_forKey_(v33, v53, (uint64_t)v50, UniqueStageDescriptor);
LABEL_23:

        goto LABEL_24;
      }
    }
    goto LABEL_24;
  }
LABEL_16:
  if (objc_msgSend_count(v33, v26, v27, v28))
  {
    v38 = (void *)objc_msgSend_allValues(v33, v35, v36, v37);
    Object = objc_msgSend_firstObject(v38, v39, v40, v41);
    v43 = sub_1B18FD780(Object);
    (*((void (**)(id, uint64_t, id))a5 + 2))(a5, v43, a4);
    goto LABEL_18;
  }
  v66 = 0;
  v65 = 0;
  v54 = objc_msgSend_frameworkLibrary(self->_libraryManager, v35, v36, v37);
  v61 = a3;
  v62 = a6;
  v63 = a4;
  *(_QWORD *)v64 = a5;
  *(_WORD *)&v64[8] = 0;
  v64[10] = 0;
  v67 = 0;
  v50 = (void *)objc_msgSend_newComputePipelineStateForDesc_library_(self, v55, (uint64_t)&v61, v54);
  if (v50)
  {
    v58 = objc_msgSend_getUniqueStageDescriptor_(self, v56, (uint64_t)a4, v57);
    objc_msgSend_setObject_forKey_(v33, v59, (uint64_t)v50, v58);
    goto LABEL_23;
  }
LABEL_24:
  os_unfair_lock_unlock(p_lock);
  return v50;
}

- (id)getUniqueStageDescriptor:(id)a3
{
  os_unfair_lock_s *p_stageDescriptorsLock;
  NSMutableArray *availableStageDescriptors;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  p_stageDescriptorsLock = &self->_stageDescriptorsLock;
  os_unfair_lock_lock(&self->_stageDescriptorsLock);
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  availableStageDescriptors = self->_availableStageDescriptors;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(availableStageDescriptors, v7, (uint64_t)&v137, (uint64_t)v141, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v138;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v138 != v13)
          objc_enumerationMutation(availableStageDescriptors);
        v15 = 0;
        v16 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
        while (1)
        {
          v17 = (void *)objc_msgSend_attributes(v16, v9, v10, v11);
          v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(v17, v18, v15, v19);
          v24 = objc_msgSend_format(v20, v21, v22, v23);
          v28 = (void *)objc_msgSend_attributes(a3, v25, v26, v27);
          v31 = (void *)objc_msgSend_objectAtIndexedSubscript_(v28, v29, v15, v30);
          if (v24 != objc_msgSend_format(v31, v32, v33, v34))
            break;
          v35 = (void *)objc_msgSend_attributes(v16, v9, v10, v11);
          v38 = (void *)objc_msgSend_objectAtIndexedSubscript_(v35, v36, v15, v37);
          v42 = objc_msgSend_offset(v38, v39, v40, v41);
          v46 = (void *)objc_msgSend_attributes(a3, v43, v44, v45);
          v49 = (void *)objc_msgSend_objectAtIndexedSubscript_(v46, v47, v15, v48);
          if (v42 != objc_msgSend_offset(v49, v50, v51, v52))
            break;
          v53 = (void *)objc_msgSend_attributes(v16, v9, v10, v11);
          v56 = (void *)objc_msgSend_objectAtIndexedSubscript_(v53, v54, v15, v55);
          v60 = objc_msgSend_bufferIndex(v56, v57, v58, v59);
          v64 = (void *)objc_msgSend_attributes(a3, v61, v62, v63);
          v67 = (void *)objc_msgSend_objectAtIndexedSubscript_(v64, v65, v15, v66);
          if (v60 != objc_msgSend_bufferIndex(v67, v68, v69, v70))
            break;
          if (++v15 == 31)
          {
            v71 = 0;
            while (1)
            {
              v72 = (void *)objc_msgSend_layouts(v16, v9, v10, v11);
              v75 = (void *)objc_msgSend_objectAtIndexedSubscript_(v72, v73, v71, v74);
              v79 = objc_msgSend_stride(v75, v76, v77, v78);
              v83 = (void *)objc_msgSend_layouts(a3, v80, v81, v82);
              v86 = (void *)objc_msgSend_objectAtIndexedSubscript_(v83, v84, v71, v85);
              if (v79 != objc_msgSend_stride(v86, v87, v88, v89))
                goto LABEL_18;
              v90 = (void *)objc_msgSend_layouts(v16, v9, v10, v11);
              v93 = (void *)objc_msgSend_objectAtIndexedSubscript_(v90, v91, v71, v92);
              v97 = objc_msgSend_stepFunction(v93, v94, v95, v96);
              v101 = (void *)objc_msgSend_layouts(a3, v98, v99, v100);
              v104 = (void *)objc_msgSend_objectAtIndexedSubscript_(v101, v102, v71, v103);
              if (v97 != objc_msgSend_stepFunction(v104, v105, v106, v107))
                goto LABEL_18;
              v108 = (void *)objc_msgSend_layouts(v16, v9, v10, v11);
              v111 = (void *)objc_msgSend_objectAtIndexedSubscript_(v108, v109, v71, v110);
              v115 = objc_msgSend_stepRate(v111, v112, v113, v114);
              v119 = (void *)objc_msgSend_layouts(a3, v116, v117, v118);
              v122 = (void *)objc_msgSend_objectAtIndexedSubscript_(v119, v120, v71, v121);
              if (v115 != objc_msgSend_stepRate(v122, v123, v124, v125))
                goto LABEL_18;
              if (++v71 == 31)
              {
                v126 = objc_msgSend_indexType(v16, v9, v10, v11);
                if (v126 != objc_msgSend_indexType(a3, v127, v128, v129))
                  goto LABEL_18;
                v130 = objc_msgSend_indexBufferIndex(v16, v9, v10, v11);
                if (v130 != objc_msgSend_indexBufferIndex(a3, v131, v132, v133))
                  goto LABEL_18;
                if (v16)
                  goto LABEL_23;
                goto LABEL_22;
              }
            }
          }
        }
LABEL_18:
        ;
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(availableStageDescriptors, v9, (uint64_t)&v137, (uint64_t)v141, 16);
    }
    while (v12);
  }
LABEL_22:
  v16 = (void *)objc_msgSend_copy(a3, v9, v10, v11);
  objc_msgSend_addObject_(self->_availableStageDescriptors, v134, (uint64_t)v16, v135);

LABEL_23:
  os_unfair_lock_unlock(p_stageDescriptorsLock);
  return v16;
}

- (id)newFunctionWithName:(id)a3 constants:(id)a4 library:(id)a5
{
  void *v5;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;

  v5 = a5;
  if (!a5)
    v5 = (void *)objc_msgSend_frameworkLibrary(self->_libraryManager, a2, (uint64_t)a3, (uint64_t)a4);
  v9 = (void *)objc_msgSend_functionDescriptor(MEMORY[0x1E0CC6AB0], a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_setName_(v9, v10, (uint64_t)a3, v11);
  objc_msgSend_setConstantValues_(v9, v12, (uint64_t)a4, v13);
  v26 = 0;
  v18 = (void *)objc_msgSend_newFunctionWithDescriptor_error_(v5, v14, (uint64_t)v9, (uint64_t)&v26);
  if (!v18 && v5 != (void *)objc_msgSend_hotReloadableLibrary(self->_libraryManager, v15, v16, v17))
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Failed to create compute function '%@', error: %@"), v19, v20, v21, v22, v23, v24, (uint64_t)a3);
  return v18;
}

- (id)newComputePipelineStateWithFunctionName:(id)a3
{
  uint64_t v3;
  uint64_t v6;

  v6 = objc_msgSend_frameworkLibrary(self->_libraryManager, a2, (uint64_t)a3, v3);
  return (id)MEMORY[0x1E0DE7D20](self, sel_newComputePipelineStateWithFunctionName_library_constantValues_linkedFunctions_, a3, v6);
}

- (id)newComputePipelineStateWithFunctionName:(id)a3 library:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_newComputePipelineStateWithFunctionName_library_constantValues_linkedFunctions_, a3, a4);
}

- (id)newComputePipelineStateWithFunctionName:(id)a3 constantValues:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend_frameworkLibrary(self->_libraryManager, a2, (uint64_t)a3, (uint64_t)a4);
  return (id)MEMORY[0x1E0DE7D20](self, sel_newComputePipelineStateWithFunctionName_library_constantValues_linkedFunctions_, a3, v6);
}

- (id)newComputePipelineStateWithFunctionName:(id)a3 constantValues:(id)a4 linkedFunctions:(id)a5
{
  uint64_t v7;

  v7 = objc_msgSend_frameworkLibrary(self->_libraryManager, a2, (uint64_t)a3, (uint64_t)a4);
  return (id)MEMORY[0x1E0DE7D20](self, sel_newComputePipelineStateWithFunctionName_library_constantValues_linkedFunctions_, a3, v7);
}

- (id)newComputePipelineStateWithFunctionName:(id)a3 library:(id)a4 constantValues:(id)a5 linkedFunctions:(id)a6
{
  _QWORD v7[3];
  _QWORD v8[3];

  v7[0] = a3;
  v7[1] = a5;
  v7[2] = 0;
  v8[0] = 0;
  *(_DWORD *)((char *)v8 + 7) = 0;
  v8[2] = a6;
  return (id)objc_msgSend_newComputePipelineStateForDesc_library_(self, a2, (uint64_t)v7, (uint64_t)a4);
}

- (id)colorMatchingComputePipelineStateForSourceColorSpace:(CGColorSpace *)a3 destinationColorSpace:(CGColorSpace *)a4 renderContext:(id)a5
{
  return (id)objc_msgSend_colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType_pixelBufferYCbCrMatrix_pixelBufferColorPrimaries_pixelBufferTransferFunction_sourceColorSpace_destinationColorSpace_renderContext_(self, a2, 0xFFFFFFFFLL, 0, 0, 0, a3, a4, a5);
}

- (id)colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:(unsigned int)a3 pixelBufferYCbCrMatrix:(id)a4 pixelBufferColorPrimaries:(id)a5 pixelBufferTransferFunction:(id)a6 sourceColorSpace:(CGColorSpace *)a7 destinationColorSpace:(CGColorSpace *)a8 renderContext:(id)a9
{
  uint64_t *p_availableColorMatchingComputePipelines;
  os_unfair_lock_s *p_lock;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  id v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int v44;
  id v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  int v70;
  const char *v71;
  uint64_t v72;
  BOOL v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  CFStringRef *v88;
  const char *v89;
  CGColorSpace *v90;
  const char *v91;
  const char *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  const char *v101;
  const char *v102;
  const char *v103;
  const char *v104;
  const char *v105;
  const char *v106;
  const char *v107;
  const char *v108;
  const char *v109;
  const char *v110;
  const char *v111;
  const char *v112;
  const char *v113;
  const char *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  int v121;
  int v122;
  int v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _OWORD v131[2];

  p_availableColorMatchingComputePipelines = (uint64_t *)&self->_availableColorMatchingComputePipelines;
  p_lock = &self->_availableColorMatchingComputePipelines.lock;
  os_unfair_lock_lock(&self->_availableColorMatchingComputePipelines.lock);
  v20 = (void *)*p_availableColorMatchingComputePipelines;
  if (!*p_availableColorMatchingComputePipelines)
  {
    sub_1B18F8DC0(p_availableColorMatchingComputePipelines, 1);
    v20 = (void *)*p_availableColorMatchingComputePipelines;
  }
  v23 = (void *)objc_msgSend_objectForKey_(v20, v18, (uint64_t)a8, v19);
  if (!v23)
  {
    v24 = objc_alloc(MEMORY[0x1E0CB3748]);
    v23 = (void *)objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v24, v25, 0, 0, 1);
    objc_msgSend_setObject_forKey_((void *)*p_availableColorMatchingComputePipelines, v26, (uint64_t)v23, (uint64_t)a8);

  }
  v29 = (void *)objc_msgSend_objectForKey_(v23, v21, (uint64_t)a7, v22);
  if (!v29)
  {
    v30 = objc_alloc(MEMORY[0x1E0CB3748]);
    v29 = (void *)objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v30, v31, 0, 0, 1);
    objc_msgSend_setObject_forKey_(v23, v32, (uint64_t)v29, (uint64_t)a7);

  }
  v33 = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v27, a3 != -1, v28);
  v43 = (void *)objc_msgSend_objectForKey_(v29, v34, v33, v35);
  if (!v43)
  {
    if (a3 == -1)
    {
      v130 = 0u;
      v131[0] = 0u;
      v128 = 0u;
      v129 = 0u;
      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      sub_1B179DAE0(a7, (uint64_t)a8, &v124);
      v45 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      objc_msgSend_setConstantValue_type_withName_(v45, v46, (uint64_t)&v124, 53, CFSTR("needsInputTRC"));
      objc_msgSend_setConstantValue_type_withName_(v45, v47, (uint64_t)&v124 + 1, 53, CFSTR("needsColorMatrix"));
      objc_msgSend_setConstantValue_type_withName_(v45, v48, (uint64_t)&v124 + 2, 53, CFSTR("needsOutputTRC"));
      objc_msgSend_setConstantValue_type_withName_(v45, v49, (uint64_t)&v124 + 4, 29, CFSTR("inputTRC_type"));
      objc_msgSend_setConstantValue_type_withName_(v45, v50, (uint64_t)&v124 + 8, 3, CFSTR("inputTRC_gamma"));
      objc_msgSend_setConstantValue_type_withName_(v45, v51, (unint64_t)&v124 | 0xC, 3, CFSTR("inputTRC_a"));
      objc_msgSend_setConstantValue_type_withName_(v45, v52, (uint64_t)&v125, 3, CFSTR("inputTRC_b"));
      objc_msgSend_setConstantValue_type_withName_(v45, v53, (uint64_t)&v125 + 4, 3, CFSTR("inputTRC_c"));
      objc_msgSend_setConstantValue_type_withName_(v45, v54, (uint64_t)&v125 + 8, 3, CFSTR("inputTRC_d"));
      objc_msgSend_setConstantValue_type_withName_(v45, v55, (uint64_t)&v125 + 12, 3, CFSTR("inputTRC_e"));
      objc_msgSend_setConstantValue_type_withName_(v45, v56, (uint64_t)&v126, 3, CFSTR("inputTRC_f"));
      objc_msgSend_setConstantValue_type_withName_(v45, v57, (uint64_t)&v127, 5, CFSTR("colorMatrixColumn0"));
      objc_msgSend_setConstantValue_type_withName_(v45, v58, (uint64_t)&v128, 5, CFSTR("colorMatrixColumn1"));
      objc_msgSend_setConstantValue_type_withName_(v45, v59, (uint64_t)&v129, 5, CFSTR("colorMatrixColumn2"));
      objc_msgSend_setConstantValue_type_withName_(v45, v60, (uint64_t)&v130, 29, CFSTR("outputTRC_type"));
      objc_msgSend_setConstantValue_type_withName_(v45, v61, (uint64_t)&v130 + 4, 3, CFSTR("outputTRC_gamma"));
      objc_msgSend_setConstantValue_type_withName_(v45, v62, (uint64_t)&v130 + 8, 3, CFSTR("outputTRC_a"));
      objc_msgSend_setConstantValue_type_withName_(v45, v63, (uint64_t)&v130 + 12, 3, CFSTR("outputTRC_b"));
      objc_msgSend_setConstantValue_type_withName_(v45, v64, (uint64_t)v131, 3, CFSTR("outputTRC_c"));
      objc_msgSend_setConstantValue_type_withName_(v45, v65, (uint64_t)v131 + 4, 3, CFSTR("outputTRC_d"));
      objc_msgSend_setConstantValue_type_withName_(v45, v66, (uint64_t)v131 + 8, 3, CFSTR("outputTRC_e"));
      objc_msgSend_setConstantValue_type_withName_(v45, v67, (uint64_t)v131 + 12, 3, CFSTR("outputTRC_f"));
      v69 = objc_msgSend_newComputePipelineStateWithFunctionName_constantValues_(self, v68, (uint64_t)CFSTR("color_matching_kernel"), (uint64_t)v45);
LABEL_45:
      v43 = (void *)v69;

      v118 = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v116, a3 != -1, v117);
      objc_msgSend_setObject_forKey_(v29, v119, (uint64_t)v43, v118);

      goto LABEL_46;
    }
    if ((int)a3 <= 875704949)
    {
      switch(a3)
      {
        case 0x34323066u:
          v70 = 1;
          break;
        case 0x34323076u:
          v70 = 0;
          break;
        case 0x34323266u:
          v44 = 2;
LABEL_24:
          v70 = 1;
          goto LABEL_26;
        default:
          goto LABEL_25;
      }
      v44 = 1;
      goto LABEL_26;
    }
    switch(a3)
    {
      case 0x34323276u:
        v70 = 0;
        v44 = 2;
        goto LABEL_26;
      case 0x34343466u:
        v44 = 3;
        goto LABEL_24;
      case 0x34343476u:
        v70 = 0;
        v44 = 3;
        goto LABEL_26;
    }
LABEL_25:
    LOBYTE(v124) = HIBYTE(a3);
    BYTE1(v124) = BYTE2(a3);
    BYTE2(v124) = BYTE1(a3);
    *(_WORD *)((char *)&v124 + 3) = a3;
    sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unsupported pixel buffer format %s"), v37, v38, v39, v40, v41, v42, (uint64_t)&v124);
    v70 = 0;
    v44 = 0;
LABEL_26:
    v121 = v44;
    if (objc_msgSend_isEqualToString_(a4, v36, *MEMORY[0x1E0CA8F18], v38))
    {
      v73 = v70 == 0;
      v74 = 3;
    }
    else if (objc_msgSend_isEqualToString_(a4, v71, *MEMORY[0x1E0CA8F10], v72))
    {
      v73 = v70 == 0;
      v74 = 1;
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(a4, v71, *MEMORY[0x1E0CA8F00], v72))
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unsupported pixel buffer YCbCr matrix %@"), v75, v72, v76, v77, v78, v79, (uint64_t)a4);
        v80 = 0;
        goto LABEL_35;
      }
      v73 = v70 == 0;
      v74 = 5;
    }
    if (v73)
      v80 = v74;
    else
      v80 = v74 + 1;
LABEL_35:
    v130 = 0u;
    v131[0] = 0u;
    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    if (objc_msgSend_isEqualToString_(a5, v71, *MEMORY[0x1E0CA8D88], v72)
      && (objc_msgSend_isEqualToString_(a6, v81, *MEMORY[0x1E0CA8EB0], v82) & 1) != 0)
    {
      v88 = (CFStringRef *)MEMORY[0x1E0C9D9D0];
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(a5, v81, *MEMORY[0x1E0CA8D98], v82)
        || !objc_msgSend_isEqualToString_(a6, v89, *MEMORY[0x1E0CA8EB0], v82))
      {
        goto LABEL_43;
      }
      v88 = (CFStringRef *)MEMORY[0x1E0C9D900];
    }
    if (*v88)
    {
      v90 = CGColorSpaceCreateWithName(*v88);
      sub_1B179DAE0(v90, (uint64_t)a8, &v124);
      CFRelease(v90);
LABEL_44:
      v45 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      objc_msgSend_setConstantValue_type_withName_(v45, v91, (uint64_t)&v124, 53, CFSTR("needsInputTRC"));
      objc_msgSend_setConstantValue_type_withName_(v45, v92, (uint64_t)&v124 + 1, 53, CFSTR("needsColorMatrix"));
      objc_msgSend_setConstantValue_type_withName_(v45, v93, (uint64_t)&v124 + 2, 53, CFSTR("needsOutputTRC"));
      objc_msgSend_setConstantValue_type_withName_(v45, v94, (uint64_t)&v124 + 4, 29, CFSTR("inputTRC_type"));
      objc_msgSend_setConstantValue_type_withName_(v45, v95, (uint64_t)&v124 + 8, 3, CFSTR("inputTRC_gamma"));
      objc_msgSend_setConstantValue_type_withName_(v45, v96, (unint64_t)&v124 | 0xC, 3, CFSTR("inputTRC_a"));
      objc_msgSend_setConstantValue_type_withName_(v45, v97, (uint64_t)&v125, 3, CFSTR("inputTRC_b"));
      objc_msgSend_setConstantValue_type_withName_(v45, v98, (uint64_t)&v125 + 4, 3, CFSTR("inputTRC_c"));
      objc_msgSend_setConstantValue_type_withName_(v45, v99, (uint64_t)&v125 + 8, 3, CFSTR("inputTRC_d"));
      objc_msgSend_setConstantValue_type_withName_(v45, v100, (uint64_t)&v125 + 12, 3, CFSTR("inputTRC_e"));
      objc_msgSend_setConstantValue_type_withName_(v45, v101, (uint64_t)&v126, 3, CFSTR("inputTRC_f"));
      objc_msgSend_setConstantValue_type_withName_(v45, v102, (uint64_t)&v127, 5, CFSTR("colorMatrixColumn0"));
      objc_msgSend_setConstantValue_type_withName_(v45, v103, (uint64_t)&v128, 5, CFSTR("colorMatrixColumn1"));
      objc_msgSend_setConstantValue_type_withName_(v45, v104, (uint64_t)&v129, 5, CFSTR("colorMatrixColumn2"));
      objc_msgSend_setConstantValue_type_withName_(v45, v105, (uint64_t)&v130, 29, CFSTR("outputTRC_type"));
      objc_msgSend_setConstantValue_type_withName_(v45, v106, (uint64_t)&v130 + 4, 3, CFSTR("outputTRC_gamma"));
      objc_msgSend_setConstantValue_type_withName_(v45, v107, (uint64_t)&v130 + 8, 3, CFSTR("outputTRC_a"));
      objc_msgSend_setConstantValue_type_withName_(v45, v108, (uint64_t)&v130 + 12, 3, CFSTR("outputTRC_b"));
      objc_msgSend_setConstantValue_type_withName_(v45, v109, (uint64_t)v131, 3, CFSTR("outputTRC_c"));
      objc_msgSend_setConstantValue_type_withName_(v45, v110, (uint64_t)v131 + 4, 3, CFSTR("outputTRC_d"));
      objc_msgSend_setConstantValue_type_withName_(v45, v111, (uint64_t)v131 + 8, 3, CFSTR("outputTRC_e"));
      objc_msgSend_setConstantValue_type_withName_(v45, v112, (uint64_t)v131 + 12, 3, CFSTR("outputTRC_f"));
      v122 = v80;
      v123 = v121;
      objc_msgSend_setConstantValue_type_withName_(v45, v113, (uint64_t)&v123, 29, CFSTR("biPlanarTextureChromaSubsampling"));
      objc_msgSend_setConstantValue_type_withName_(v45, v114, (uint64_t)&v122, 29, CFSTR("biPlanarTextureYCbCrMatrix"));
      v69 = objc_msgSend_newComputePipelineStateWithFunctionName_constantValues_(self, v115, (uint64_t)CFSTR("color_matching_kernel_biplanar"), (uint64_t)v45);
      goto LABEL_45;
    }
LABEL_43:
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Could not create color space from %@ and %@"), v83, v82, v84, v85, v86, v87, (uint64_t)a5);
    goto LABEL_44;
  }
LABEL_46:
  os_unfair_lock_unlock(p_lock);
  return v43;
}

- (BOOL)hasCommonProfilePrecompiledFunctions
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_commonProfileCacheLibrary(self->_libraryManager, a2, v2, v3) != 0;
}

- (id)computeEvaluatorWithContext:(MTLContext *)a3 srcDesc:(const BufferDescriptor *)a4 dstDesc:(const BufferDescriptor *)a5 duDesc:(const BufferDescriptor *)a6 dvDesc:(const BufferDescriptor *)a7
{
  unint64_t v12;
  unint64_t v13;
  uint64_t *p_availableOpenSubdivComputeEvaluators;
  os_unfair_lock_s *p_lock;
  const char *v16;
  uint64_t v17;
  void *v18;
  VFXMTLOpenSubdivComputeEvaluator *v19;
  uint64_t v20;
  const char *v21;

  v12 = 0xC6A4A7935BD1E995
      * ((0xC6A4A7935BD1E995
        * ((0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995 * *(_QWORD *)&a4->var1) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)&a4->var1) >> 47))) ^ 0x4FB7DAE84DD6F2FCLL)) ^ a5->var2);
  v13 = (0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) >> 47);
  p_availableOpenSubdivComputeEvaluators = (uint64_t *)&self->_availableOpenSubdivComputeEvaluators;
  p_lock = &self->_availableOpenSubdivComputeEvaluators.lock;
  os_unfair_lock_lock(&self->_availableOpenSubdivComputeEvaluators.lock);
  v18 = (void *)*p_availableOpenSubdivComputeEvaluators;
  if (!*p_availableOpenSubdivComputeEvaluators)
  {
    sub_1B18F8DC0(p_availableOpenSubdivComputeEvaluators, 0);
    v18 = (void *)*p_availableOpenSubdivComputeEvaluators;
  }
  v19 = (VFXMTLOpenSubdivComputeEvaluator *)objc_msgSend_objectForKey_(v18, v16, v13, v17);
  if (!v19)
  {
    v19 = objc_alloc_init(VFXMTLOpenSubdivComputeEvaluator);
    v20 = sub_1B2213DFC((uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, &a3->var0);
    if (v19)
      v19->_computeEvaluator = (MTLComputeEvaluator *)v20;
    objc_msgSend_setObject_forKey_((void *)*p_availableOpenSubdivComputeEvaluators, v21, (uint64_t)v19, v13);

  }
  os_unfair_lock_unlock(p_lock);
  return v19;
}

- (id)copyTextureByConvertingToCubeMapIfApplicable:(id)a3 engineContext:(__CFXEngineContext *)a4 needsMipmap:(BOOL)a5
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v6 = objc_msgSend_width(a3, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6 != 2 * objc_msgSend_height(a3, v7, v8, v9))
    return a3;
  v13 = objc_msgSend_pixelFormat(a3, v10, v11, v12);
  if (v13 == 115 || v13 == 125)
    v15 = 115;
  else
    v15 = 70;
  return (id)MEMORY[0x1E0DE7D20](self, sel_newCubemapTextureForLatlongTexture_pixelFormat_engineContext_needsMipmap_, a3, v15);
}

- (id)newTextureWithDescriptor:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;

  if (objc_msgSend_pixelFormat(a3, a2, (uint64_t)a3, v3))
  {
    v16 = (void *)objc_msgSend_newTextureWithDescriptor_(self->_device, v6, (uint64_t)a3, v8);
    if (v16)
    {
      ++self->__engineStats->texCount;
      v17 = objc_msgSend_width(a3, v13, v14, v15);
      v21 = objc_msgSend_height(a3, v18, v19, v20) * v17;
      v25 = v21 * objc_msgSend_depth(a3, v22, v23, v24);
      objc_msgSend_pixelFormat(a3, v26, v27, v28);
      self->__engineStats->texMemory += (unint64_t)(v25 * sub_1B189D6D0()) >> 3;
    }
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Asking to created a texture with an invalid format!"), v7, v8, v9, v10, v11, v12, v30);
    return 0;
  }
  return v16;
}

- (id)newTextureUsingMTKTextureLoaderWithURL:(id)a3 options:(id)a4
{
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;

  v7 = objc_alloc(MEMORY[0x1E0CC6C40]);
  v8 = sub_1B18FD774((uint64_t)self);
  v18 = (void *)objc_msgSend_initWithDevice_(v7, v9, v8, v10);
  if (!v18)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v12, v13, v14, v15, v16, v17, (uint64_t)"loader");
  v31 = 0;
  v19 = (void *)objc_msgSend_newTextureWithContentsOfURL_options_error_(v18, v11, (uint64_t)a3, (uint64_t)a4, &v31);

  if (v31)
  {
    v23 = objc_msgSend_localizedDescription(v31, v20, v21, v22);
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Failed to load image with error %@"), v24, v25, v26, v27, v28, v29, v23);
    return 0;
  }
  return v19;
}

- (id)newTextureUsingMTKTextureLoaderWithData:(id)a3 options:(id)a4
{
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;

  v7 = objc_alloc(MEMORY[0x1E0CC6C40]);
  v8 = sub_1B18FD774((uint64_t)self);
  v18 = (void *)objc_msgSend_initWithDevice_(v7, v9, v8, v10);
  if (!v18)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v12, v13, v14, v15, v16, v17, (uint64_t)"loader");
  v31 = 0;
  v19 = (void *)objc_msgSend_newTextureWithData_options_error_(v18, v11, (uint64_t)a3, (uint64_t)a4, &v31);

  if (v31)
  {
    v23 = objc_msgSend_localizedDescription(v31, v20, v21, v22);
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Failed to load image with error %@"), v24, v25, v26, v27, v28, v29, v23);
    return 0;
  }
  return v19;
}

- (void)_enqueueCopyFromTexture:(id)a3 toTexture:(id)a4 blitEncoder:(VFXMTLBlitCommandEncoder *)a5 generateMipMaps:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a6;
  v10 = objc_msgSend_width(a3, a2, (uint64_t)a3, (uint64_t)a4);
  if (v10 == objc_msgSend_width(a4, v11, v12, v13))
  {
    v17 = objc_msgSend_height(a3, v14, v15, v16);
    if (v17 == objc_msgSend_height(a4, v18, v19, v20))
    {
      v24 = objc_msgSend_depth(a3, v21, v22, v23);
      if (v24 == objc_msgSend_depth(a4, v25, v26, v27))
      {
        sub_1B199D54C((void **)&a5->_encoder, a3, 0, a4, 0);
        if (v6)
          sub_1B1913528((void **)&a5->_encoder, a4, v28, v29);
      }
    }
  }
}

- (id)_textureDescriptorFromImage:(__CFXImage *)a3 needsMipMap:(BOOL)a4 textureOptions:(int)a5
{
  char v5;
  _BOOL4 v6;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int32x2_t v40;
  int32x2_t v41;
  int32x2_t v42;
  float v43;
  const char *v44;
  uint64_t v45;
  float v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  float v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  CGContext *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  CGContext *v101;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  float v121;

  v5 = a5;
  v6 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
  v17 = sub_1B180B014((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);
  v25 = sub_1B189CF64(v17, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_setTextureType_(v9, v26, v25, v27);
  v28 = 1;
  objc_msgSend_setUsage_(v9, v29, 1, v30);
  objc_msgSend_setStorageMode_(v9, v31, 0, v32);
  v42 = sub_1B180AF58((uint64_t)a3, v33, v34, v35, v36, v37, v38, v39);
  v121 = *(float *)&v42.i32[1];
  if (*(float *)v42.i32 >= 1.0)
    v43 = *(float *)v42.i32;
  else
    v43 = 1.0;
  objc_msgSend_setWidth_(v9, *(const char **)&v40, (unint64_t)v43, *(_QWORD *)&v41);
  v46 = v121;
  if (v121 < 1.0)
    v46 = 1.0;
  objc_msgSend_setHeight_(v9, v44, (unint64_t)v46, v45);
  v54 = sub_1B180AFC8((uint64_t)a3, v47, v48, v49, v50, v51, v52, v53);
  objc_msgSend_setDepth_(v9, v55, v54, v56);
  if (v6)
  {
    v60 = objc_msgSend_width(v9, v57, v58, v59);
    v64 = fmax((double)v60, (double)objc_msgSend_height(v9, v61, v62, v63));
    v28 = (int)(float)(floorf(log2f(v64)) + 1.0);
  }
  objc_msgSend_setMipmapLevelCount_(v9, v57, v28, v59);
  if ((unint64_t)objc_msgSend_mipmapLevelCount(v9, v65, v66, v67) >= 2
    && objc_msgSend_textureType(v9, v68, v69, v70) == 5)
  {
    v74 = objc_msgSend_usage(v9, v71, v72, v73);
    objc_msgSend_setUsage_(v9, v75, v74 | 0x10, v76);
  }
  v77 = sub_1B1809424((uint64_t)a3);
  if (v77)
  {
    v84 = v77;
    v85 = *(unsigned __int8 *)(v77 + 10);
    v86 = sub_1B180B770((uint64_t)a3, 0);
    objc_msgSend_setMipmapLevelCount_(v9, v87, v86, v88);
    v89 = *(unsigned int *)(v84 + 24);
    if ((v5 & 1) != 0 || v85)
      v90 = VFXMTLPixelFormatNonSRGBVariant(v89);
    else
      v90 = VFXMTLPixelFormatSRGBVariant(v89);
    objc_msgSend_setPixelFormat_(v9, v91, v90, v92);
  }
  else
  {
    v93 = (CGContext *)sub_1B180ADA4((uint64_t)a3, 1, v78, v79, v80, v81, v82, v83);
    if (v93)
    {
      v101 = v93;
      BitsPerComponent = CGBitmapContextGetBitsPerComponent(v93);
      BitsPerPixel = CGBitmapContextGetBitsPerPixel(v101);
      v104 = BitsPerPixel / BitsPerComponent;
      v105 = sub_1B189D308(BitsPerPixel / BitsPerComponent, BitsPerComponent, v101, v5);
      objc_msgSend_setPixelFormat_(v9, v106, v105, v107);
      if (v104 == 1 && j__objc_msgSend_supportsTextureSwizzle(self->_device, v108, v109, v110))
        objc_msgSend_setSwizzle_(v9, v111, 16908802, v112);
      CGContextRelease(v101);
    }
    else
    {
      v114 = sub_1B1809180((uint64_t)a3, v94, v95, v96, v97, v98, v99, v100);
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Cannot load image %@. Using dummy texture."), v115, v116, v117, v118, v119, v120, v114);
      return 0;
    }
  }
  return v9;
}

- (BOOL)_copyImage:(__CFXImage *)a3 toTexture:(id)a4 desc:(id)a5 textureOptions:(int)a6 needsMipMapGeneration:(BOOL)a7
{
  uint64_t v7;
  BOOL v8;
  __CFXImage *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CFIndex i;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const __CFData *ValueAtIndex;
  CFIndex Length;
  const UInt8 *BytePtr;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  unsigned int v60;
  float v61;
  uint64_t v62;
  unint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  size_t v70;
  _QWORD *v71;
  unsigned int v72;
  uint64_t v73;
  size_t v74;
  uint64_t v75;
  unint64_t v76;
  __CFXImage *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  CGContext *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *Data;
  size_t BytesPerRow;
  size_t BitsPerComponent;
  size_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  size_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unsigned __int8 j;
  uint64_t k;
  const __CFData *v138;
  uint64_t v139;
  const char *v140;
  CFIndex m;
  const __CFArray *v143;
  uint64_t v144;
  BOOL v145;
  float v146;
  const UInt8 *v147;
  unsigned int v148;
  uint64_t v149;
  unsigned int v150;
  _QWORD v151[6];
  _QWORD v152[13];
  _QWORD v153[7];
  _QWORD v154[13];
  _QWORD v155[12];
  int v156;
  _BYTE v157[9];

  v8 = a7;
  v11 = a3;
  v150 = sub_1B180B014((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, *(uint64_t *)&a6, a7, v7);
  v12 = sub_1B1809424((uint64_t)v11);
  if (!v12)
  {
    v89 = (CGContext *)sub_1B180ADA4((uint64_t)v11, 1, v14, v15, v16, v17, v18, v19);
    if (!v89)
    {
      v90 = sub_1B1809180((uint64_t)v11, v82, v83, v84, v85, v86, v87, v88);
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Cannot load image %@. Texture will be garbage."), v91, v92, v93, v94, v95, v96, v90);
    }
    v149 = (uint64_t)v11;
    Data = CGBitmapContextGetData(v89);
    if (!Data)
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: CFXRendererCreateTextureWithImage : error while getting bitmap bytes"), v97, v98, v99, v100, v101, v102, v144);
      if (v89)
      {
        CFRelease(v89);
        v89 = 0;
      }
    }
    BytesPerRow = CGBitmapContextGetBytesPerRow(v89);
    BitsPerComponent = CGBitmapContextGetBitsPerComponent(v89);
    v106 = (CGBitmapContextGetBitsPerPixel(v89) / BitsPerComponent * BitsPerComponent) >> 3;
    v110 = v106 * objc_msgSend_width(a5, v107, v108, v109);
    v114 = objc_msgSend_width(a5, v111, v112, v113);
    v118 = objc_msgSend_height(a5, v115, v116, v117);
    if (v150 == 2)
    {
      v126 = objc_msgSend_width(a5, v119, v120, v121);
      v130 = objc_msgSend_depth(a5, v127, v128, v129);
      v153[0] = MEMORY[0x1E0C809B0];
      v153[1] = 3221225472;
      v153[2] = sub_1B199DF4C;
      v153[3] = &unk_1E63DA3D0;
      v153[4] = a5;
      v153[5] = a4;
      v153[6] = v110;
      sub_1B180B534(2, v126, v130, BytesPerRow, v110, v106, (uint64_t)Data, (uint64_t)v153, v144);
      if (!v89)
        return v8;
    }
    else
    {
      v131 = v118;
      if (sub_1B1809FF4(v149, (uint64_t)v119, v120, v121, v122, v123, v124, v125))
      {
        v135 = objc_msgSend_width(a5, v132, v133, v134);
        v152[0] = MEMORY[0x1E0C809B0];
        v152[1] = 3221225472;
        v152[2] = sub_1B199DFD4;
        v152[3] = &unk_1E63DA3A8;
        memset(&v152[6], 0, 24);
        v152[9] = v114;
        v152[10] = v131;
        v152[11] = 1;
        v152[12] = v110;
        v152[4] = a4;
        v152[5] = a5;
        sub_1B180B26C(v150, v135, BytesPerRow, v110, v106, (uint64_t)Data, (uint64_t)v152);
        if (!v89)
          return v8;
      }
      else
      {
        memset(v151, 0, 24);
        v151[3] = v114;
        v151[4] = v131;
        v151[5] = 1;
        v139 = objc_msgSend_height(a5, v132, v133, v134);
        objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(a4, v140, (uint64_t)v151, 0, 0, Data, v110, v139 * v110);
        if (!v89)
          return v8;
      }
    }
    CFRelease(v89);
    return v8;
  }
  v20 = v12;
  v21 = sub_1B1809FF4((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);
  v29 = sub_1B180B0A8((uint64_t)v11, v22, v23, v24, v25, v26, v27, v28);
  v157[0] = 0;
  v148 = sub_1B180B770((uint64_t)v11, v157);
  if (v148 > (unint64_t)objc_msgSend_mipmapLevelCount(a5, v30, v31, v32))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Too many mip level loaded"), v34, v35, v36, v37, v38, v39, (uint64_t)"loadedMipMapCount <= desc.mipmapLevelCount");
  v145 = v8;
  if (v21)
  {
    if (v29)
    {
      if (v148)
      {
        for (i = 0; i != v148; ++i)
        {
          v41 = objc_msgSend_width(a5, v33, v34, v35);
          v45 = objc_msgSend_height(a5, v42, v43, v44);
          ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v20 + 32), i);
          Length = CFDataGetLength(ValueAtIndex);
          BytePtr = CFDataGetBytePtr(ValueAtIndex);
          v59 = sub_1B18097E8((uint64_t)v11, v49, v50, v51, v52, v53, v54, v55);
          v61 = (float)Length;
          if (*(unsigned __int8 *)(v20 + 7) < 2u)
          {
            v76 = (unint64_t)*(unsigned __int8 *)(v20 + 4) >> 3;
            v146 = *(float *)&v59;
            v147 = BytePtr;
            v77 = v11;
            v78 = objc_msgSend_width(a5, v56, v57, v58) * v76;
            v69 = objc_msgSend_width(a5, v79, v80, v81);
            v154[0] = MEMORY[0x1E0C809B0];
            v154[1] = 3221225472;
            v154[2] = sub_1B199DED0;
            v154[3] = &unk_1E63DA3A8;
            memset(&v154[6], 0, 24);
            v154[9] = v41;
            v154[10] = v45;
            v154[11] = 1;
            v154[12] = v78;
            v154[4] = a4;
            v154[5] = a5;
            v71 = v154;
            v72 = v150;
            v73 = (uint64_t)(float)(v61 / v146);
            v70 = v78;
            v11 = v77;
            v74 = v76;
            v75 = (uint64_t)v147;
          }
          else
          {
            LOBYTE(v60) = *(_BYTE *)(v20 + 8);
            v62 = (uint64_t)(float)((float)(v61 / *((float *)&v59 + 1)) * (float)v60);
            v63 = (unint64_t)*(unsigned __int8 *)(v20 + 4) >> 3;
            LODWORD(v63) = objc_msgSend_width(a5, v56, v57, v58) / (unint64_t)*(unsigned __int8 *)(v20 + 7) * v63;
            v67 = objc_msgSend_height(a5, v64, v65, v66);
            v68 = *(unsigned __int8 *)(v20 + 8);
            v155[0] = MEMORY[0x1E0C809B0];
            v155[1] = 3221225472;
            v155[2] = sub_1B199DE7C;
            v155[3] = &unk_1E63DA380;
            memset(&v155[5], 0, 24);
            v155[4] = a4;
            v155[8] = v41;
            v155[9] = v45;
            v69 = v67 / v68;
            v70 = v63;
            v156 = v63;
            v155[10] = 1;
            v155[11] = v67 / v68;
            v71 = v155;
            v72 = v150;
            v73 = v62;
            v74 = 0;
            v75 = (uint64_t)BytePtr;
          }
          sub_1B180B26C(v72, v69, v73, v70, v74, v75, (uint64_t)v71);
        }
      }
    }
    else if (v157[0])
    {
      if (v148)
      {
        for (j = 0; j < v148; ++j)
        {
          for (k = 0; k != 6; ++k)
          {
            v138 = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v20 + 32), 6 * j + k);
            sub_1B199CF18(a4, a5, k, j, v138, v20);
          }
        }
      }
    }
    else
    {
      for (m = 0; m != 6; ++m)
      {
        v143 = (const __CFArray *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v20 + 32), m);
        sub_1B199D044(a4, a5, m, v143, v20);
      }
    }
  }
  else
  {
    sub_1B199D044(a4, a5, 0, *(CFArrayRef *)(v20 + 32), v20);
  }
  v8 = v148 < 2 && v145;
  if (!a4)
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: unknown compression format"), v34, v35, v36, v37, v38, v39, v144);
  return v8;
}

- (id)newCubemapTextureForLatlongTexture:(id)a3 pixelFormat:(unint64_t)a4 engineContext:(__CFXEngineContext *)a5 needsMipmap:(BOOL)a6
{
  _BOOL8 v6;
  unint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  const char *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void **v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *EncoderAndResetCache;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void **v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE v57[48];
  uint64_t v58;

  v6 = a6;
  v58 = *MEMORY[0x1E0C80C00];
  v11 = objc_msgSend_width(a3, a2, (uint64_t)a3, a4);
  if (v11 >> 1 >= 0x800)
    v13 = (void *)objc_msgSend_textureCubeDescriptorWithPixelFormat_size_mipmapped_(MEMORY[0x1E0CC6BB0], v12, a4, 2048, v6);
  else
    v13 = (void *)objc_msgSend_textureCubeDescriptorWithPixelFormat_size_mipmapped_(MEMORY[0x1E0CC6BB0], v12, a4, v11 >> 1, v6);
  v16 = v13;
  objc_msgSend_setUsage_(v13, v14, 19, v15);
  objc_msgSend_setStorageMode_(v16, v17, 2, v18);
  v21 = (void *)objc_msgSend_newTextureWithDescriptor_(self, v19, (uint64_t)v16, v20);
  v29 = (void *)sub_1B1813BC4((uint64_t)a5, v22, v23, v24, v25, v26, v27, v28);
  v30 = sub_1B1815AD8((uint64_t)a5, 512);
  v33 = v30;
  if (v30)
    v34 = objc_msgSend_computePipelineStateForKernel_(self, v31, (uint64_t)CFSTR("compute_cube_from_equi"), v32);
  else
    v34 = objc_msgSend_computePipelineStateForKernel_(self, v31, (uint64_t)CFSTR("compute_cube_from_equi_views"), v32);
  v35 = (void *)sub_1B18FD774(v34);
  v39 = (void **)objc_msgSend_resourceComputeEncoder(v29, v36, v37, v38);
  EncoderAndResetCache = (void *)objc_msgSend_getEncoderAndResetCache(*v39, v40, v41, v42);
  objc_msgSend_setComputePipelineState_(EncoderAndResetCache, v44, (uint64_t)v35, v45);
  objc_msgSend_setTexture_atIndex_(EncoderAndResetCache, v46, (uint64_t)a3, 0);
  if (v33)
  {
    objc_msgSend_setTexture_atIndex_(EncoderAndResetCache, v47, (uint64_t)v21, 1);
  }
  else
  {
    sub_1B199CEAC(v21, 0, (uint64_t)v57, v48);
    objc_msgSend_setTextures_withRange_(EncoderAndResetCache, v49, (uint64_t)v57, 1, 6);
  }
  sub_1B18FD568((uint64_t)self, (char *)v21, EncoderAndResetCache, v35);
  if (v6)
  {
    v53 = (void **)objc_msgSend_resourceBlitEncoder(v29, v50, v51, v52);
    sub_1B1913528(v53, v21, v54, v55);
  }
  return v21;
}

- (id)latlongTextureForCubemap:(id)a3 pixelFormat:(unint64_t)a4 renderContext:(id)a5 needsMipmap:(BOOL)a6
{
  _BOOL8 v6;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void **v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *EncoderAndResetCache;
  const char *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void **v52;
  uint64_t v53;
  uint64_t v54;
  int64x2_t v56;
  uint64_t v57;
  _QWORD v58[3];

  v6 = a6;
  v11 = (void *)MEMORY[0x1E0CC6BB0];
  v12 = 2 * objc_msgSend_width(a3, a2, (uint64_t)a3, a4);
  v16 = objc_msgSend_height(a3, v13, v14, v15);
  v18 = (void *)objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v11, v17, a4, v12, v16, v6);
  objc_msgSend_setUsage_(v18, v19, 3, v20);
  objc_msgSend_setStorageMode_(v18, v21, 2, v22);
  v25 = (id)objc_msgSend_newTextureWithDescriptor_(self, v23, (uint64_t)v18, v24);
  v28 = objc_msgSend_computePipelineStateForKernel_(self, v26, (uint64_t)CFSTR("compute_equi_from_cube"), v27);
  v29 = sub_1B18FD774(v28);
  v33 = (void **)objc_msgSend_resourceComputeEncoder(a5, v30, v31, v32);
  EncoderAndResetCache = (void *)objc_msgSend_getEncoderAndResetCache(*v33, v34, v35, v36);
  objc_msgSend_setComputePipelineState_(EncoderAndResetCache, v38, v29, v39);
  objc_msgSend_setTexture_atIndex_(EncoderAndResetCache, v40, (uint64_t)a3, 0);
  objc_msgSend_setTexture_atIndex_(EncoderAndResetCache, v41, (uint64_t)v25, 1);
  v58[0] = objc_msgSend_width(v18, v42, v43, v44);
  v58[1] = objc_msgSend_height(v18, v45, v46, v47);
  v58[2] = 1;
  v56 = vdupq_n_s64(1uLL);
  v57 = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(EncoderAndResetCache, v48, (uint64_t)v58, (uint64_t)&v56);
  if (v6)
  {
    v52 = (void **)objc_msgSend_resourceBlitEncoder(a5, v49, v50, v51);
    sub_1B1913528(v52, v25, v53, v54);
  }
  return v25;
}

- (id)unstageTexture:(id)a3 commandBuffer:(id)a4
{
  id v5;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v66;
  uint64_t v67;

  v5 = a3;
  if (objc_msgSend_storageMode(a3, a2, (uint64_t)a3, (uint64_t)a4) == 2)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
    v11 = objc_msgSend_textureType(v5, v8, v9, v10);
    objc_msgSend_setTextureType_(v7, v12, v11, v13);
    v17 = objc_msgSend_pixelFormat(v5, v14, v15, v16);
    objc_msgSend_setPixelFormat_(v7, v18, v17, v19);
    v23 = objc_msgSend_width(v5, v20, v21, v22);
    objc_msgSend_setWidth_(v7, v24, v23, v25);
    v29 = objc_msgSend_height(v5, v26, v27, v28);
    objc_msgSend_setHeight_(v7, v30, v29, v31);
    v35 = objc_msgSend_depth(v5, v32, v33, v34);
    objc_msgSend_setDepth_(v7, v36, v35, v37);
    v41 = objc_msgSend_mipmapLevelCount(v5, v38, v39, v40);
    objc_msgSend_setMipmapLevelCount_(v7, v42, v41, v43);
    objc_msgSend_setUsage_(v7, v44, 0, v45);
    objc_msgSend_setStorageMode_(v7, v46, 0, v47);
    v50 = (void *)objc_msgSend_newTextureWithDescriptor_(self->_device, v48, (uint64_t)v7, v49);
    v66 = 0;
    v67 = 0;
    sub_1B1792B08(&v66, a4, 0, v51, v52, v53, v54, v55);
    sub_1B199E4B0(&v66, v5, v50, v56);
    v64 = v66;
    if (!v66)
    {
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v58, v59, v60, v61, v62, v63, (uint64_t)"_encoder != nil");
      v64 = v66;
    }
    objc_msgSend_endEncoding(v64, v57, v58, v59);
    v66 = 0;
    v67 = 0;
    return v50;
  }
  return v5;
}

- (id)renderResourceForAsset:(void *)a3 withEngineContext:(__CFXEngineContext *)a4 entityCache:(int64_t *)a5 isFallback:(BOOL *)a6 isDynamic:(BOOL *)a7
{
  uint64_t v7;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  id result;

  v11 = sub_1B1813884((uint64_t)a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, v7);
  v12 = *a5;
  v20 = sub_1B187AA20(v11, v13, v14, v15, v16, v17, v18, v19);
  v24 = (void *)sub_1B181FEE0(v20);
  if (!v12)
  {
    v25 = objc_msgSend_entityTag(a3, v21, v22, v23);
    result = (id)objc_msgSend_entityWithTag_(v24, v26, v25, v27);
    if (!result)
      return result;
    v12 = (int64_t)result;
    *a5 = (int64_t)result;
  }
  return (id)MEMORY[0x1E0DE7D20](v24, sel_textureForEntity_isFallback_isDynamic_, v12, a6);
}

- (id)renderResourceForMaterialProperty:(__CFXMaterialProperty *)a3 withEngineContext:(__CFXEngineContext *)a4 didFallbackToDefaultTexture:(BOOL *)a5 isDynamic:(BOOL *)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *isDynamic;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
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
  void *var4;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  if (a5)
  {
    *a5 = 1;
    v13 = sub_1B1842E08((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7);
    if (v13)
    {
      isDynamic = (void *)v13;
      *a5 = 0;
      return isDynamic;
    }
  }
  else
  {
    isDynamic = (void *)sub_1B1842E08((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, 0, (uint64_t)a6, v6, v7);
    if (isDynamic)
      return isDynamic;
  }
  v22 = sub_1B1842D3C((uint64_t)a3, v14, v15, v16, v17, v18, v19, v20);
  if (v22)
  {
    v30 = v22;
    v32 = sub_1B1842028((uint64_t)a3, v23, v24, v25, v26, v27, v28, v29);
    if (!v32)
      v32 = sub_1B180CF10();
    isDynamic = (void *)objc_msgSend_renderResourceForImageProxy_sampler_engineContext_didFallbackToDefaultTexture_(self, v31, v30, v32, a4, a5);
    if (isDynamic)
      return isDynamic;
  }
  v34 = sub_1B1841C84((uint64_t)a3, v23, v24, v25, v26, v27, v28, v29);
  if (!v34)
  {
    isDynamic = (void *)sub_1B184293C((uint64_t)a3, v35, v36, v37, v38, v39, v40, v41);
    if (isDynamic)
    {
      v53 = sub_1B1842A50((uint64_t)a3, v46, v47, v48, v49, v50, v51, v52);
      v78 = v53;
      isDynamic = (void *)objc_msgSend_renderResourceForAsset_withEngineContext_entityCache_isFallback_isDynamic_(self, v54, (uint64_t)isDynamic, (uint64_t)a4, &v78, a5, a6);
      if (isDynamic && !v53)
        sub_1B1842AC0((uint64_t)a3, v78, v55, v56, v57, v58, v59, v60);
      if (sub_1B1843540((uint64_t)a3) == 24)
      {
        var4 = a3->var4;
        if (var4 != isDynamic)
        {
          if (var4)
          {
            CFRelease(var4);
            a3->var4 = 0;
          }
          if (isDynamic)
            v69 = (void *)CFRetain(isDynamic);
          else
            v69 = 0;
          a3->var4 = v69;
          v70 = sub_1B1813884((uint64_t)a4, v61, v62, v63, v64, v65, v66, v67);
          sub_1B187BFC4(v70, v71, v72, v73, v74, v75, v76, v77);
        }
      }
    }
    return isDynamic;
  }
  v42 = v34;
  v43 = sub_1B1842028((uint64_t)a3, v35, v36, v37, v38, v39, v40, v41);
  v44 = sub_1B1843134((uint64_t)a3);
  return (id)objc_msgSend_renderResourceForImage_sampler_options_engineContext_didFallbackToDefaultTexture_(self, v45, v42, v43, v44, a4, a5);
}

- (id)renderResourceForImageProxy:(__CFXImageProxy *)a3 sampler:(__CFXTextureSampler *)a4 engineContext:(__CFXEngineContext *)a5 didFallbackToDefaultTexture:(BOOL *)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *p_availableImageProxy;
  os_unfair_lock_s *p_lock;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void **v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  __int16 v50;

  if (!a3)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), 0, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7, (uint64_t)"sourceImage");
  p_availableImageProxy = (uint64_t *)&self->_availableImageProxy;
  p_lock = &self->_availableImageProxy.lock;
  os_unfair_lock_lock(p_lock);
  v17 = (void *)*p_availableImageProxy;
  if (!*p_availableImageProxy)
  {
    sub_1B18F8DC0(p_availableImageProxy, 0);
    v17 = (void *)*p_availableImageProxy;
  }
  v23 = (const void *)objc_msgSend_objectForKey_(v17, v15, (uint64_t)a3, v16);
  if (!v23)
  {
    v24 = sub_1B181F11C((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v18, v19, v20, v21, v22);
    if (!v24)
    {
      os_unfair_lock_unlock(p_lock);
      v26 = 0;
      goto LABEL_17;
    }
    v23 = (const void *)v24;
    *(_QWORD *)(v24 + 40) = a3;
    objc_msgSend_setObject_forKey_((void *)*p_availableImageProxy, v25, v24, (uint64_t)a3);
    CFRelease(v23);
  }
  v50 = 257;
  v26 = (void *)sub_1B181F4A8((uint64_t)v23, (uint64_t)a5, (uint64_t)a4, (uint64_t)&v50, v19, v20, v21, v22);
  os_unfair_lock_unlock(p_lock);
  if (v26)
  {
    if (a4 && (_BYTE)v50 && HIBYTE(v50) && sub_1B180CE80((uint64_t)a4, v27, v28, v29, v30, v31, v32, v33))
    {
      v41 = (void *)sub_1B1813BC4((uint64_t)a5, v34, v35, v36, v37, v38, v39, v40);
      v45 = (void **)objc_msgSend_resourceBlitEncoder(v41, v42, v43, v44);
      sub_1B1913528(v45, v26, v46, v47);
    }
    if (a6)
    {
      v48 = 0;
LABEL_19:
      *a6 = v48;
      return v26;
    }
    return v26;
  }
LABEL_17:
  if (a6)
  {
    v48 = 1;
    goto LABEL_19;
  }
  return v26;
}

- (id)renderResourceForImage:(__CFXImage *)a3 sampler:(__CFXTextureSampler *)a4 options:(int)a5 engineContext:(__CFXEngineContext *)a6 didFallbackToDefaultTexture:(BOOL *)a7
{
  uint64_t v7;
  uint64_t v10;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  $7A989303777397D6B69F819F3873BC2B *p_availableImages;
  const char *v18;
  uint64_t v19;
  NSMapTable *registry;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  MTLTexture *defaultTexture;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  MTLTexture *v47;
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
  const char *v59;
  const char *v60;
  MTLTexture *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  MTLTexture *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void **v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  const char *v88;
  BOOL v89;
  void *v91;
  void *v92;
  uint64_t v93;

  v10 = *(_QWORD *)&a5;
  if (!a3)
  {
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), 0, (uint64_t)a4, *(uint64_t *)&a5, (uint64_t)a6, (uint64_t)a7, v7, (uint64_t)"sourceImage");
    if (!a4)
      goto LABEL_6;
LABEL_5:
    if (sub_1B180CE80((uint64_t)a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, *(uint64_t *)&a5, (uint64_t)a6, (uint64_t)a7, v7))goto LABEL_8;
    goto LABEL_6;
  }
  if (a4)
    goto LABEL_5;
LABEL_6:
  if ((v10 & 4) == 0)
  {
    v14 = 0;
    goto LABEL_9;
  }
LABEL_8:
  v10 = v10 | 4;
  v14 = 1;
LABEL_9:
  v15 = 0xC6A4A7935BD1E995
      * ((0xC6A4A7935BD1E995 * ((unint64_t)a3 ^ 0x1A929E4D6F47A654 ^ v10)) ^ ((0xC6A4A7935BD1E995 * ((unint64_t)a3 ^ 0x1A929E4D6F47A654 ^ v10)) >> 47));
  v16 = v15 ^ (v15 >> 47);
  p_availableImages = &self->_availableImages;
  os_unfair_lock_lock(&self->_availableImages.lock);
  registry = self->_availableImages.registry;
  if (!registry)
  {
    sub_1B18F8DC0((uint64_t *)&self->_availableImages, 0);
    registry = p_availableImages->registry;
  }
  v21 = objc_msgSend_objectForKey_(registry, v18, v16, v19);
  if (v21)
  {
    defaultTexture = (MTLTexture *)v21;
    goto LABEL_28;
  }
  v30 = sub_1B1813BC4((uint64_t)a6, v22, v23, v24, v25, v26, v27, v28);
  sub_1B180A6A8((uint64_t)a3, v31, v32, v33);
  v92 = (void *)v30;
  if (sub_1B180A390((uint64_t)a3))
  {
    v41 = sub_1B180A3A0((uint64_t)a3, (uint64_t)v34, v35, v36, v37, v38, v39, v40);
    v45 = VFXGetResourceBundle(v41, v42, v43, v44);
    v93 = 0;
    defaultTexture = (MTLTexture *)objc_msgSend_newTextureWithName_scaleFactor_bundle_options_error_(self->_mtkTextureLoader, v46, v41, v45, MEMORY[0x1E0C9AA70], &v93, 1.0);
    v47 = defaultTexture;
    if (!defaultTexture)
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Failed to load texture named %@ : %@"), v49, v50, v51, v52, v53, v54, v41);
LABEL_27:
      defaultTexture = self->_defaultTexture;
      v83 = (void *)objc_msgSend_resourceManagerMonitor(v92, v48, v55, v56);
      v86 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v84, (uint64_t)CFSTR("Unable to find texture for source %@"), v85, a3);
      objc_msgSend_renderContext_didFallbackToDefaultTextureForSource_message_(v83, v87, (uint64_t)v92, (uint64_t)a3, v86);
      objc_msgSend_setObject_forKey_(p_availableImages->registry, v88, (uint64_t)defaultTexture, v16);
      goto LABEL_28;
    }
  }
  else
  {
    if ((v10 & 2) != 0 && sub_1B180AF30((uint64_t)a3, (uint64_t)v34, v35, v36, v37, v38, v39, v40))
    {
      v57 = objc_msgSend__textureDescriptorFromImage_needsMipMap_textureOptions_(self, v34, (uint64_t)a3, 0, v10);
      if (!v57)
        goto LABEL_27;
      v58 = v57;
      v91 = (void *)objc_msgSend_newTextureWithDescriptor_(self->_device, v48, v57, v56);
      objc_msgSend__copyImage_toTexture_desc_textureOptions_needsMipMapGeneration_(self, v59, (uint64_t)a3, (uint64_t)v91, v58, v10, 0);
      defaultTexture = (MTLTexture *)objc_msgSend_copyTextureByConvertingToCubeMapIfApplicable_engineContext_needsMipmap_(self, v60, (uint64_t)v91, (uint64_t)a6, v14);
      v61 = defaultTexture;

    }
    else
    {
      v69 = objc_msgSend__textureDescriptorFromImage_needsMipMap_textureOptions_(self, v34, (uint64_t)a3, v14, v10);
      if (!v69)
        goto LABEL_27;
      v70 = v69;
      defaultTexture = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(self, v48, v69, v56);
      v71 = defaultTexture;
      LODWORD(v14) = objc_msgSend__copyImage_toTexture_desc_textureOptions_needsMipMapGeneration_(self, v72, (uint64_t)a3, (uint64_t)defaultTexture, v70, v10, v14);
    }
    sub_1B180AE38((uint64_t)a3, v62, v63, v64, v65, v66, v67, v68);
    if (!defaultTexture)
      goto LABEL_27;
  }
  objc_msgSend_setObject_forKey_(p_availableImages->registry, v48, (uint64_t)defaultTexture, v16);
  if ((_DWORD)v14)
  {
    if (sub_1B180B770((uint64_t)a3, 0) <= 1)
    {
      v76 = objc_msgSend_pixelFormat(defaultTexture, v73, v74, v75);
      if (sub_1B189D204(v76))
      {
        v80 = (void **)objc_msgSend_resourceBlitEncoder(v92, v77, v78, v79);
        sub_1B1913528(v80, defaultTexture, v81, v82);
      }
    }
  }
LABEL_28:
  os_unfair_lock_unlock(&self->_availableImages.lock);
  if (a7)
  {
    v89 = self->_defaultTexture1D == defaultTexture
       || self->_defaultTexture == defaultTexture
       || self->_defaultTexture3D == defaultTexture;
    *a7 = v89;
  }
  return defaultTexture;
}

- (id)defaultTexture
{
  uint64_t *p_availableImages;
  const char *v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  MTLTexture *defaultTexture;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  os_unfair_lock_t p_lock;
  _QWORD v29[7];

  v29[6] = *MEMORY[0x1E0C80C00];
  p_availableImages = (uint64_t *)&self->_availableImages;
  p_lock = &self->_availableImages.lock;
  os_unfair_lock_lock(&self->_availableImages.lock);
  if (!*p_availableImages)
    sub_1B18F8DC0(p_availableImages, 0);
  if (!self->_defaultTexture)
  {
    v6 = (void *)objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E0CC6BB0], v4, 70, 4, 4, 1, p_lock);
    objc_msgSend_setUsage_(v6, v7, 1, v8);
    objc_msgSend_setStorageMode_(v6, v9, 0, v10);
    self->_defaultTexture = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(self, v11, (uint64_t)v6, v12);
    v16 = objc_msgSend_mipmapLevelCount(v6, v13, v14, v15);
    if (v16)
    {
      v18 = 4;
      v19 = 1;
      do
      {
        MEMORY[0x1E0C80A78](v16, v17);
        v21 = (char *)&v29[-1] - v20;
        memset((char *)&v29[-1] - v20, 255, 4 * v18 * v18);
        defaultTexture = self->_defaultTexture;
        memset(v29, 0, 24);
        v29[3] = v18;
        v29[4] = v18;
        v29[5] = 1;
        objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(defaultTexture, v23, (uint64_t)v29, v19 - 1, 0, v21, 4 * v18, 4 * v18 * v18);
        v16 = objc_msgSend_mipmapLevelCount(v6, v24, v25, v26);
        if (v19 >= v16)
          break;
        ++v19;
        v27 = v18 > 1;
        v18 >>= 1;
      }
      while (v27);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return self->_defaultTexture;
}

- (id)defaultTexture1D
{
  uint64_t *p_availableImages;
  os_unfair_lock_s *p_lock;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  MTLTexture *v15;
  uint64_t v16;
  MTLTexture *defaultTexture1D;
  const char *v18;
  _QWORD v20[3];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_availableImages = (uint64_t *)&self->_availableImages;
  p_lock = &self->_availableImages.lock;
  os_unfair_lock_lock(&self->_availableImages.lock);
  if (!*p_availableImages)
    sub_1B18F8DC0(p_availableImages, 0);
  if (!self->_defaultTexture1D)
  {
    v6 = (void *)objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E0CC6BB0], v5, 70, 4, 1, 0);
    objc_msgSend_setTextureType_(v6, v7, 0, v8);
    objc_msgSend_setUsage_(v6, v9, 1, v10);
    objc_msgSend_setStorageMode_(v6, v11, 0, v12);
    v15 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(self, v13, (uint64_t)v6, v14);
    self->_defaultTexture1D = v15;
    MEMORY[0x1E0C80A78](v15, v16);
    defaultTexture1D = self->_defaultTexture1D;
    memset(v20, 0, sizeof(v20));
    v21 = xmmword_1B2268BB0;
    v22 = 1;
    objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(defaultTexture1D, v18, (uint64_t)v20, 0, 0, -1, -1);
  }
  os_unfair_lock_unlock(p_lock);
  return self->_defaultTexture1D;
}

- (id)defaultCubeTexture
{
  uint64_t *p_availableImages;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  const char *v21;
  uint64_t i;
  MTLTexture *defaultCubeTexture;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  os_unfair_lock_t p_lock;
  void *v29;
  _QWORD v30[7];

  v30[6] = *MEMORY[0x1E0C80C00];
  p_availableImages = (uint64_t *)&self->_availableImages;
  p_lock = &self->_availableImages.lock;
  os_unfair_lock_lock(&self->_availableImages.lock);
  if (!*p_availableImages)
    sub_1B18F8DC0(p_availableImages, 0);
  if (!self->_defaultCubeTexture)
  {
    v5 = (void *)objc_msgSend_textureCubeDescriptorWithPixelFormat_size_mipmapped_(MEMORY[0x1E0CC6BB0], v4, 70, 4, 1);
    objc_msgSend_setUsage_(v5, v6, 1, v7);
    objc_msgSend_setStorageMode_(v5, v8, 0, v9);
    self->_defaultCubeTexture = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(self, v10, (uint64_t)v5, v11);
    v29 = v5;
    v15 = objc_msgSend_mipmapLevelCount(v5, v12, v13, v14);
    if (v15)
    {
      v17 = 0;
      v18 = 4;
      do
      {
        MEMORY[0x1E0C80A78](v15, v16);
        v20 = (char *)&v27 - v19;
        bzero((char *)&v27 - v19, 4 * v18 * v18);
        for (i = 0; i != 6; ++i)
        {
          defaultCubeTexture = self->_defaultCubeTexture;
          memset(v30, 0, 24);
          v30[3] = v18;
          v30[4] = v18;
          v30[5] = 1;
          objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(defaultCubeTexture, v21, (uint64_t)v30, v17, i, v20, 4 * v18, 4 * v18 * v18);
        }
        ++v17;
        v18 >>= 1;
        v15 = objc_msgSend_mipmapLevelCount(v29, v21, v24, v25);
      }
      while (v17 < v15);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return self->_defaultCubeTexture;
}

- (id)defaultTexture3D
{
  VFXMTLResourceManager *v2;
  uint64_t *p_availableImages;
  os_unfair_lock_s *p_lock;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  char *v62;
  unint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  _QWORD v80[2];
  os_unfair_lock_s *v81;
  char *v82;
  uint64_t v83;
  VFXMTLResourceManager *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  _QWORD v88[7];

  v2 = self;
  v88[6] = *MEMORY[0x1E0C80C00];
  p_availableImages = (uint64_t *)&self->_availableImages;
  p_lock = &self->_availableImages.lock;
  os_unfair_lock_lock(&self->_availableImages.lock);
  if (!*p_availableImages)
    sub_1B18F8DC0(p_availableImages, 0);
  v5 = 512;
  if (!v2->_defaultTexture3D)
  {
    v81 = p_lock;
    v6 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
    objc_msgSend_setPixelFormat_(v6, v7, 70, v8);
    objc_msgSend_setWidth_(v6, v9, 16, v10);
    objc_msgSend_setHeight_(v6, v11, 16, v12);
    objc_msgSend_setDepth_(v6, v13, 16, v14);
    objc_msgSend_setTextureType_(v6, v15, 7, v16);
    objc_msgSend_setMipmapLevelCount_(v6, v17, 1, v18);
    objc_msgSend_setStorageMode_(v6, v19, 0, v20);
    objc_msgSend_setUsage_(v6, v21, 1, v22);
    v2->_defaultTexture3D = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v2, v23, (uint64_t)v6, v24);
    v28 = 4 * objc_msgSend_width(v6, v25, v26, v27);
    v32 = objc_msgSend_height(v6, v29, v30, v31);
    v80[1] = v80;
    v85 = v28 * v32;
    v34 = MEMORY[0x1E0C80A78](v32, v33);
    v86 = (char *)v80 - v35;
    if (objc_msgSend_depth(v6, v36, v37, v38, v34))
    {
      v87 = 0;
      v82 = v86 + 3;
      v83 = 512;
      v84 = v2;
      do
      {
        v42 = objc_msgSend_depth(v6, v39, v40, v41);
        if (objc_msgSend_height(v6, v43, v44, v45))
        {
          v49 = 0;
          v50 = v82;
          v51 = 255 * v87 / (unint64_t)(v42 - 1);
          do
          {
            v52 = objc_msgSend_height(v6, v46, v47, v48);
            if (objc_msgSend_width(v6, v53, v54, v55))
            {
              v59 = 0;
              v60 = 0;
              v61 = v52 - 1;
              v62 = v50;
              v63 = 255 * v49 / v61;
              do
              {
                *(v62 - 3) = v59 / (objc_msgSend_width(v6, v56, v57, v58) - 1);
                *(v62 - 2) = v63;
                *(v62 - 1) = v51;
                *v62 = -1;
                v62 += 4;
                ++v60;
                v59 += 255;
              }
              while (v60 < objc_msgSend_width(v6, v64, v65, v66));
            }
            ++v49;
            v50 += v28;
          }
          while (v49 < objc_msgSend_height(v6, v56, v57, v58));
        }
        v5 = v83;
        v2 = v84;
        v67 = *(Class *)((char *)&v84->super.isa + v83);
        v68 = objc_msgSend_width(v6, v46, v47, v48);
        v72 = objc_msgSend_height(v6, v69, v70, v71);
        v88[0] = 0;
        v88[1] = 0;
        v73 = v87;
        v88[2] = v87;
        v88[3] = v68;
        v88[4] = v72;
        v88[5] = 1;
        objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(v67, v74, (uint64_t)v88, 0, 0, v86, v28, v85);
        v78 = objc_msgSend_depth(v6, v75, v76, v77);
        v87 = v73 + 1;
      }
      while (v73 + 1 < v78);
    }
    p_lock = v81;
  }
  os_unfair_lock_unlock(p_lock);
  return *(Class *)((char *)&v2->super.isa + v5);
}

- (id)defaultTextureForTextureType:(unint64_t)a3
{
  uint64_t v3;

  if (a3 == 7)
    return (id)((uint64_t (*)(VFXMTLResourceManager *, char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel_defaultTexture3D, 7);
  if (a3)
    return (id)objc_msgSend_defaultTexture(self, a2, a3, v3);
  return (id)((uint64_t (*)(VFXMTLResourceManager *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_defaultTexture1D, 0);
}

- (id)iesTextureForProfile:(void *)a3 renderContext:(id)a4
{
  uint64_t *p_availableIESTextures;
  os_unfair_lock_s *p_lock;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  int16x4_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  _QWORD v35[3];
  __int128 v36;
  uint64_t v37;

  p_availableIESTextures = (uint64_t *)&self->_availableIESTextures;
  p_lock = &self->_availableIESTextures.lock;
  os_unfair_lock_lock(&self->_availableIESTextures.lock);
  v10 = (void *)*p_availableIESTextures;
  if (!*p_availableIESTextures)
  {
    sub_1B18F8DC0(p_availableIESTextures, 1);
    v10 = (void *)*p_availableIESTextures;
  }
  v11 = objc_msgSend_objectForKey_(v10, v8, (uint64_t)a3, v9);
  if (v11)
  {
    v15 = (void *)v11;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v16 = j__objc_msgSend__infoHangle(a3, v12, v13, v14);
    CACurrentMediaTime();
    v17 = sub_1B189D6D0();
    v18 = v17 >> 3 << 8;
    v19 = v17 >> 3 << 12;
    v20 = (int16x4_t *)malloc_type_malloc(v19, 0x892A58AEuLL);
    v21 = sub_1B189D6D0();
    sub_1B18D503C(v16, v20, 256, 16, 1, v21 >> 3, v22, v23);
    v25 = (void *)objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E0CC6BB0], v24, 25, 256, 16, 0);
    objc_msgSend_setStorageMode_(v25, v26, 0, v27);
    objc_msgSend_setUsage_(v25, v28, 1, v29);
    v15 = (void *)objc_msgSend_newTextureWithDescriptor_(self->_device, v30, (uint64_t)v25, v31);
    memset(v35, 0, sizeof(v35));
    v36 = xmmword_1B2268BC0;
    v37 = 1;
    objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(v15, v32, (uint64_t)v35, 0, 0, v20, v18, v19);
    free(v20);
    objc_msgSend_setObject_forKey_((void *)*p_availableIESTextures, v33, (uint64_t)v15, (uint64_t)a3);
    os_unfair_lock_unlock(p_lock);

  }
  return v15;
}

- (void)colorMatchSourceTexture:(id)a3 sourceColorSpace:(CGColorSpace *)a4 destinationColorSpace:(CGColorSpace *)a5 destinationTexture:(id)a6 renderContext:(id)a7
{
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;

  v10 = objc_msgSend_colorMatchingComputePipelineStateForSourceColorSpace_destinationColorSpace_renderContext_(self, a2, (uint64_t)a4, (uint64_t)a5, a7);
  v14 = (void **)objc_msgSend_resourceComputeEncoder(a7, v11, v12, v13);
  v15 = sub_1B18FD774(v10);
  objc_msgSend_setComputePipelineState_(*v14, v16, v15, v17);
  objc_msgSend_setTexture_atIndex_(*v14, v18, (uint64_t)a3, 0);
  objc_msgSend_setTexture_atIndex_(*v14, v19, (uint64_t)a6, 1);
  objc_msgSend_dispatchOnTexture2D_(*v14, v20, (uint64_t)a3, v21);
}

- (void)colorMatchBiPlanarPixelBufferWithFormatType:(unsigned int)a3 pixelBufferYCbCrMatrix:(id)a4 pixelBufferColorPrimaries:(id)a5 pixelBufferTransferFunction:(id)a6 sourceTextureY:(id)a7 sourceTextureCbCr:(id)a8 sourceColorSpace:(CGColorSpace *)a9 destinationColorSpace:(CGColorSpace *)a10 destinationTexture:(id)a11 renderContext:(id)a12
{
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;

  v14 = objc_msgSend_colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType_pixelBufferYCbCrMatrix_pixelBufferColorPrimaries_pixelBufferTransferFunction_sourceColorSpace_destinationColorSpace_renderContext_(self, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, a6, a9, a10, a12);
  v18 = (void **)objc_msgSend_resourceComputeEncoder(a12, v15, v16, v17);
  v19 = sub_1B18FD774(v14);
  objc_msgSend_setComputePipelineState_(*v18, v20, v19, v21);
  objc_msgSend_setTexture_atIndex_(*v18, v22, (uint64_t)a7, 0);
  objc_msgSend_setTexture_atIndex_(*v18, v23, (uint64_t)a8, 1);
  objc_msgSend_setTexture_atIndex_(*v18, v24, (uint64_t)a11, 2);
  objc_msgSend_dispatchOnTexture2D_(*v18, v25, (uint64_t)a11, v26);
}

- (id)shFromCPU:(id)a3 commandBuffer:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  size_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  size_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  size_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  unsigned int v103;
  _QWORD v105[6];
  _QWORD v106[6];
  _QWORD v107[6];
  _OWORD v108[7];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend_unstageTexture_commandBuffer_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v9 = 0;
  memset(v108, 0, 108);
  while (1)
  {
    v10 = objc_msgSend_pixelFormat(v8, v5, v6, v7);
    if ((v10 & 0xFFFFFFFFFFFFFFFELL) != 0x46)
      break;
    v18 = 4 * objc_msgSend_width(v8, v11, v12, v13);
    v22 = v18 * objc_msgSend_height(v8, v19, v20, v21);
    v23 = malloc_type_calloc(v22, 1uLL, 0xC2DD4C7BuLL);
    v27 = objc_msgSend_width(v8, v24, v25, v26);
    v31 = objc_msgSend_height(v8, v28, v29, v30);
    memset(v107, 0, 24);
    v107[3] = v27;
    v107[4] = v31;
    v107[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_(v8, v32, (uint64_t)v23, v18, v22, v107, 0, v9);
    v36 = objc_msgSend_width(v8, v33, v34, v35);
    v40 = objc_msgSend_height(v8, v37, v38, v39);
    v41 = malloc_type_calloc(v40 * v36, 0x10uLL, 0x1000040451B5BE8uLL);
    LODWORD(v27) = 16 * objc_msgSend_width(v8, v42, v43, v44);
    v48 = objc_msgSend_width(v8, v45, v46, v47);
    v52 = objc_msgSend_height(v8, v49, v50, v51);
    sub_1B19CDC5C((uint64_t)v41, v27, (uint64_t)v23, v18, v48, v52);
LABEL_7:
    free(v23);
LABEL_9:
    v103 = objc_msgSend_width(v8, v86, v87, v88);
    sub_1B19CD948((uint64_t)v41, v103, v9, 3, (uint64_t)v108);
    free(v41);
    if (++v9 == 6)
      return (id)objc_msgSend_newBufferWithBytes_length_options_(self->_device, v5, (uint64_t)v108, 108, 0);
  }
  if (v10 == 125)
  {
    v89 = 16 * objc_msgSend_width(v8, v11, v12, v13);
    v93 = v89 * objc_msgSend_height(v8, v90, v91, v92);
    v41 = malloc_type_calloc(v93, 1uLL, 0xF0602C20uLL);
    v97 = objc_msgSend_width(v8, v94, v95, v96);
    v101 = objc_msgSend_height(v8, v98, v99, v100);
    memset(v105, 0, 24);
    v105[3] = v97;
    v105[4] = v101;
    v105[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_(v8, v102, (uint64_t)v41, v89, v93, v105, 0, v9);
    goto LABEL_9;
  }
  if (v10 == 115)
  {
    v53 = 8 * objc_msgSend_width(v8, v11, v12, v13);
    v57 = v53 * objc_msgSend_height(v8, v54, v55, v56);
    v23 = malloc_type_calloc(v57, 1uLL, 0x5A62EA3uLL);
    v61 = objc_msgSend_width(v8, v58, v59, v60);
    v65 = objc_msgSend_height(v8, v62, v63, v64);
    memset(v106, 0, 24);
    v106[3] = v61;
    v106[4] = v65;
    v106[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_(v8, v66, (uint64_t)v23, v53, v57, v106, 0, v9);
    v70 = objc_msgSend_width(v8, v67, v68, v69);
    v74 = objc_msgSend_height(v8, v71, v72, v73);
    v41 = malloc_type_calloc(v74 * v70, 0x10uLL, 0x1000040451B5BE8uLL);
    LODWORD(v61) = 16 * objc_msgSend_width(v8, v75, v76, v77);
    v81 = objc_msgSend_width(v8, v78, v79, v80);
    v85 = objc_msgSend_height(v8, v82, v83, v84);
    sub_1B19CDDA4((uint64_t)v41, v61, (uint64_t)v23, v53, v81, v85);
    goto LABEL_7;
  }
  sub_1B17C4408(16, (uint64_t)CFSTR("Error: format %lu not supported for SH generation"), v12, v13, v14, v15, v16, v17, v10);
  return 0;
}

- (id)sphericalHarmonicsForEnvironmentTexture:(id)a3 order:(unint64_t)a4 commandBuffer:(id)a5
{
  unint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  const char *v51;
  unint64_t v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  int64x2_t v82;
  __int128 v83;
  uint64_t v84;

  v9 = a4 * a4;
  v10 = (id)objc_msgSend_newBufferWithLength_options_(self->_device, a2, 12 * a4 * a4, 0);
  v13 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("compute_sh%d_from_cubemap_threadgroup_mem"), v12, a4);
  v16 = objc_msgSend_computePipelineStateForKernel_(self, v14, v13, v15);
  v20 = sub_1B18FD774(v16);
  v21 = (void *)v20;
  if (!v20)
  {
    v22 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v17, (uint64_t)CFSTR("compute_sh%d_from_cubemap"), v19, a4);
    v25 = objc_msgSend_computePipelineStateForKernel_(self, v23, v22, v24);
    v21 = (void *)sub_1B18FD774(v25);
  }
  v26 = (void *)objc_msgSend_computeCommandEncoder(a5, v17, v18, v19);
  objc_msgSend_setComputePipelineState_(v26, v27, (uint64_t)v21, v28);
  v72 = (uint64_t)v10;
  if ((unint64_t)objc_msgSend_mipmapLevelCount(a3, v29, v30, v31) >= 0xA)
  {
    v35 = objc_msgSend_mipmapLevelCount(a3, v32, v33, v34);
    v39 = 9;
    if (v35 > 9)
      v39 = v35;
    v40 = v39 - 9;
    v41 = objc_msgSend_pixelFormat(a3, v36, v37, v38);
    a3 = (id)objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(a3, v42, v41, 5, v40, 1, 0, 6);
  }
  objc_msgSend_setTexture_atIndex_(v26, v32, (uint64_t)a3, 0);
  if (v20)
  {
    v44 = (void *)objc_msgSend_newBufferWithLength_options_(self->_device, v43, 72 * v9, 32);
    objc_msgSend_setBuffer_offset_atIndex_(v26, v45, (uint64_t)v44, 0, 1);
    v46 = (16 * v9);
    v50 = objc_msgSend_threadExecutionWidth(v21, v47, v48, v49);
    v52 = 0x7FFF / v46;
    if (v50 < v52)
      v52 = v50;
    if (v52 >= 0x40)
      v53 = 64;
    else
      v53 = v52;
    objc_msgSend_setThreadgroupMemoryLength_atIndex_(v26, v51, v53 * v46, 0);
    v83 = xmmword_1B2247980;
    v84 = 1;
    v81 = v53;
    v82 = vdupq_n_s64(1uLL);
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v26, v54, (uint64_t)&v83, (uint64_t)&v81);
    v57 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v55, (uint64_t)CFSTR("sum_sh%d"), v56, a4);
    v60 = objc_msgSend_computePipelineStateForKernel_(self, v58, v57, v59);
    v61 = sub_1B18FD774(v60);
    objc_msgSend_setComputePipelineState_(v26, v62, v61, v63);
    v64 = (void *)v72;
    objc_msgSend_setBuffer_offset_atIndex_(v26, v65, v72, 0, 0);
    v80 = 1;
    v79 = xmmword_1B2268F10;
    v78 = 1;
    v77 = xmmword_1B2268F10;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v26, v66, (uint64_t)&v79, (uint64_t)&v77);

  }
  else
  {
    v64 = (void *)v72;
    objc_msgSend_setBuffer_offset_atIndex_(v26, v43, v72, 0, 0);
    v76 = 1;
    v75 = xmmword_1B2268F10;
    v74 = 1;
    v73 = xmmword_1B2268F10;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v26, v70, (uint64_t)&v75, (uint64_t)&v73);
  }
  objc_msgSend_endEncoding(v26, v67, v68, v69);
  return v64;
}

@end
