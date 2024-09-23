@implementation VFXCommonProfileProgramGenerator

- (VFXCommonProfileProgramGenerator)init
{
  VFXCommonProfileProgramGenerator *v2;
  VFXCommonProfileProgramGenerator *v3;
  const __CFAllocator *v4;
  const CFDictionaryValueCallBacks *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXCommonProfileProgramGenerator;
  v2 = -[VFXCommonProfileProgramGenerator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_programMutex._os_unfair_lock_opaque = 0;
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    v2->_shaders = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v3->_trackedResourcesToHashcode = CFDictionaryCreateMutable(v4, 0, 0, v5);
    sub_1B194F7E4(v3, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))sub_1B181A04C, CFSTR("kCFXNotificationProfileWillDie"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    sub_1B194F7E4(v3, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))sub_1B181A0B0, CFSTR("kCFXShadableDidChange"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)dealloc
{
  __CFDictionary *shaders;
  __CFDictionary *trackedResourcesToHashcode;
  objc_super v5;

  sub_1B194F838(self, CFSTR("kCFXNotificationProfileWillDie"), 0);
  shaders = self->_shaders;
  if (shaders)
  {
    CFRelease(shaders);
    self->_shaders = 0;
  }
  trackedResourcesToHashcode = self->_trackedResourcesToHashcode;
  if (trackedResourcesToHashcode)
  {
    CFRelease(trackedResourcesToHashcode);
    self->_trackedResourcesToHashcode = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)VFXCommonProfileProgramGenerator;
  -[VFXCommonProfileProgramGenerator dealloc](&v5, sel_dealloc);
}

- (int)profile
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Invalid CommonProfile generator"), v2, v3, v4, v5, v6, v7, vars0);
  return -1;
}

- (void)emptyShaderCache
{
  CFDictionaryRemoveAllValues(self->_shaders);
  CFDictionaryRemoveAllValues(self->_trackedResourcesToHashcode);
}

+ (id)generatorWithProfile:(int)a3 allowingHotReload:(BOOL)a4
{
  _BOOL8 v4;
  VFXCommonProfileProgramGeneratorMetal *v7;
  const char *v8;
  uint64_t v9;

  v4 = a4;
  objc_sync_enter(a1);
  if (!a3 && !qword_1EEFD4CF8[0])
  {
    v7 = [VFXCommonProfileProgramGeneratorMetal alloc];
    qword_1EEFD4CF8[0] = objc_msgSend_initAllowingHotReload_(v7, v8, v4, v9);
  }
  objc_sync_exit(a1);
  return (id)qword_1EEFD4CF8[a3];
}

- (__CFXFXProgram)programWithHashCode:(__CFXProgramHashCode *)a3 engineContext:(__CFXEngineContext *)a4 trackedResource:(id)a5 introspectionDataPtr:(void *)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  CFSetRef *Value;
  CFSetRef *v20;
  int v21;
  _BOOL4 v22;
  __CFXFXProgram *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  VFXCommonProfileProgramCache *v37;
  void *Mutable;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CFStringRef v47;
  void *context;
  uint8_t v49[16];
  uint8_t buf[16];

  v11 = sub_1B1956DDC((uint64_t)a3);
  if (v11)
  {
    v18 = (const __CFString *)v11;
    os_unfair_lock_lock(&self->_programMutex);
    Value = (CFSetRef *)CFDictionaryGetValue(self->_shaders, v18);
    if (Value)
    {
      v20 = Value;
      v21 = CFSetContainsValue(Value[2], a5);
      v22 = v21 == 0;
      if (!v21)
        CFSetAddValue(v20[2], a5);
      v23 = (__CFXFXProgram *)v20[1];
    }
    else
    {
      context = (void *)MEMORY[0x1B5E23520]();
      v24 = sub_1B17C439C();
      v25 = os_signpost_id_generate(v24);
      v26 = sub_1B17C439C();
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v28 = v26;
        if (os_signpost_enabled(v26))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v25, "GenerateShader", ", buf, 2u);
        }
      }
      v23 = (__CFXFXProgram *)objc_msgSend__newProgramWithHashCode_engineContext_introspectionDataPtr_(self, v27, (uint64_t)a3, (uint64_t)a4, a6);
      v29 = sub_1B17C439C();
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v30 = v29;
        if (os_signpost_enabled(v29))
        {
          *(_WORD *)v49 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B178D000, v30, OS_SIGNPOST_INTERVAL_END, v25, "GenerateShader", ", v49, 2u);
        }
      }
      objc_autoreleasePoolPop(context);
      if (!v23)
      {
        v47 = CFCopyDescription(a3);
        sub_1B17C4408(0, (uint64_t)CFSTR("Warning: Failed to create program for hashcode %@: %@"), v40, v41, v42, v43, v44, v45, (uint64_t)v18);
        CFRelease(v47);
LABEL_23:
        os_unfair_lock_unlock(&self->_programMutex);
        return v23;
      }
      sub_1B193E5B0((uint64_t)v23, v18, v31, v32, v33, v34, v35, v36);
      v37 = objc_alloc_init(VFXCommonProfileProgramCache);
      v37->_program = (__CFXFXProgram *)CFRetain(v23);
      CFSetAddValue(v37->_owners, a5);
      CFDictionarySetValue(self->_shaders, v18, v37);

      CFRelease(v23);
      v22 = 1;
    }
    if (v22 && v23 != 0)
    {
      Mutable = (void *)CFDictionaryGetValue(self->_trackedResourcesToHashcode, a5);
      if (!Mutable)
      {
        Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        CFDictionarySetValue(self->_trackedResourcesToHashcode, a5, Mutable);
        CFRelease(Mutable);
      }
      CFArrayAppendValue((CFMutableArrayRef)Mutable, v18);
    }
    goto LABEL_23;
  }
  sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v12, v13, v14, v15, v16, v17, (uint64_t)"hashcode");
  return 0;
}

- (void)releaseProgramForResource:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFArray *Value;
  const __CFArray *v11;
  CFIndex Count;
  CFIndex v13;
  CFIndex i;
  const void *ValueAtIndex;
  CFMutableSetRef *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFMutableSetRef *v23;
  uint64_t v24;

  if (!a3)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), 0, v3, v4, v5, v6, v7, (uint64_t)"trackedResource");
  os_unfair_lock_lock(&self->_programMutex);
  Value = (const __CFArray *)CFDictionaryGetValue(self->_trackedResourcesToHashcode, a3);
  if (Value)
  {
    v11 = Value;
    Count = CFArrayGetCount(Value);
    if (Count >= 1)
    {
      v13 = Count;
      for (i = 0; i != v13; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v11, i);
        v16 = (CFMutableSetRef *)CFDictionaryGetValue(self->_shaders, ValueAtIndex);
        if (v16)
        {
          v23 = v16;
          CFSetRemoveValue(v16[2], a3);
          if (!CFSetGetCount(v23[2]))
            CFDictionaryRemoveValue(self->_shaders, ValueAtIndex);
        }
        else if ((byte_1EEF657C8 & 1) == 0)
        {
          byte_1EEF657C8 = 1;
          sub_1B17C4408(16, (uint64_t)CFSTR("Error: CFXCommonProfileProgramReleaseHashCode can't find cache for tracked resource"), v17, v18, v19, v20, v21, v22, v24);
        }
      }
    }
  }
  CFDictionaryRemoveValue(self->_trackedResourcesToHashcode, a3);
  os_unfair_lock_unlock(&self->_programMutex);
}

@end
