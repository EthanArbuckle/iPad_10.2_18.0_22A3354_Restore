@implementation VFXSourceRendererRegistry

- (VFXSourceRendererRegistry)init
{
  VFXSourceRendererRegistry *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VFXSourceRendererRegistry;
  v2 = -[VFXSourceRendererRegistry init](&v4, sel_init);
  if (v2)
    v2->_registry = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  return v2;
}

- (void)dealloc
{
  __CFDictionary *registry;
  objc_super v4;

  registry = self->_registry;
  if (registry)
    CFRelease(registry);
  v4.receiver = self;
  v4.super_class = (Class)VFXSourceRendererRegistry;
  -[VFXSourceRendererRegistry dealloc](&v4, sel_dealloc);
}

+ (id)sharedRegistry
{
  if (qword_1ED4CF790 != -1)
    dispatch_once(&qword_1ED4CF790, &unk_1E63D0E90);
  return (id)qword_1ED4CF798;
}

- (void)rendererDidChange:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  if (pthread_main_np())
  {
    v7 = objc_msgSend_layer(a3, v4, v5, v6);
    v11 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v8, v9, v10);
    objc_msgSend_postNotificationName_object_(v11, v12, (uint64_t)CFSTR("VFXLayerTreeDidChange"), v7);
  }
  else
  {
    objc_msgSend_begin(MEMORY[0x1E0CD28B0], v4, v5, v6);
    objc_msgSend_activateBackground_(MEMORY[0x1E0CD28B0], v13, 1, v14);
    v18 = objc_msgSend_layer(a3, v15, v16, v17);
    v22 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v19, v20, v21);
    objc_msgSend_postNotificationName_object_(v22, v23, (uint64_t)CFSTR("VFXLayerTreeDidChange"), v18);
    objc_msgSend_commit(MEMORY[0x1E0CD28B0], v24, v25, v26);
  }
}

- (id)sourceRendererForEngineContext:(__CFXEngineContext *)a3 source:(id)a4 textureSource:(id)a5 targetTexture:(id)a6
{
  void *Value;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  id v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  id v46;
  const __CFString *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EEF65F40);
  Value = (void *)CFDictionaryGetValue(self->_registry, a4);
  if (Value)
    goto LABEL_15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_14:
    Value = 0;
    goto LABEL_15;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v18 = (void *)objc_msgSend_valueForKey_(a4, v11, (uint64_t)CFSTR("VFXIsBackingViewAsMaterialPropertyTag"), v13);
    if (!objc_msgSend_BOOLValue(v18, v19, v20, v21))
      goto LABEL_9;
    v48 = CFSTR("kCARendererFlags");
    v49[0] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v22, 3, v23);
    v14 = (void *)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)v49, (uint64_t)&v48, 1);
    if (!v14)
      goto LABEL_9;
LABEL_8:
    v25 = (id)objc_msgSend_mutableCopy(v14, v15, v16, v17);
    goto LABEL_10;
  }
  v14 = (void *)objc_msgSend_rendererOptions(a4, v11, v12, v13);
  if (v14)
    goto LABEL_8;
LABEL_9:
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
LABEL_10:
  v26 = v25;
  if (!a6)
  {

    goto LABEL_14;
  }
  v27 = sub_1B179D1E8();
  objc_msgSend_setObject_forKeyedSubscript_(v26, v28, v27, *MEMORY[0x1E0CD3088]);
  v36 = (void *)sub_1B1813BC4((uint64_t)a3, v29, v30, v31, v32, v33, v34, v35);
  v40 = objc_msgSend_commandQueue(v36, v37, v38, v39);
  objc_msgSend_setObject_forKeyedSubscript_(v26, v41, v40, *MEMORY[0x1E0CD3090]);
  objc_msgSend_setObject_forKeyedSubscript_(v26, v42, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD3080]);
  Value = (void *)objc_msgSend_rendererWithMTLTexture_options_(MEMORY[0x1E0CD2820], v43, (uint64_t)a6, (uint64_t)v26);
  objc_msgSend_setDelegate_(Value, v44, (uint64_t)self, v45);

  if (Value)
    CFDictionarySetValue(self->_registry, a4, Value);
LABEL_15:
  v46 = Value;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EEF65F40);
  return Value;
}

- (void)removeSourceRenderersForSource:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EEF65F40);
  CFDictionaryRemoveValue(self->_registry, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EEF65F40);
}

@end
