@implementation VFXTriggerManager

- (VFXTriggerManager)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VFXTriggerManager;
  return -[VFXTriggerManager init](&v4, sel_init, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VFXTriggerManager;
  -[VFXTriggerManager dealloc](&v2, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)triggerType:(id)a3 event:(id)a4 fromView:(id)a5
{
  MEMORY[0x1E0DE7D20](_TtC3VFX8VFXScene, sel_appendWithTrigger_event_view_inWorld_, a3, a4);
}

- (void)setWorld:(id)a3
{
  self->_world = (VFXWorld *)a3;
  MEMORY[0x1E0DE7D20](_TtC3VFX8VFXScene, sel_registerWithTriggerManager_inWorld_, self, a3);
}

- (id)world
{
  return self->_world;
}

- (void)enableTriggerTypes:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;
  __int16 v31;
  __int16 v32;

  objc_sync_enter(self);
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFFFE | objc_msgSend_containsObject_(a3, v5, (uint64_t)CFSTR("VFXTriggerTypeMouseDown"), v6);
  if (objc_msgSend_containsObject_(a3, v7, (uint64_t)CFSTR("VFXTriggerTypeMouseUp"), v8))
    v11 = 2;
  else
    v11 = 0;
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFFFD | v11;
  if (objc_msgSend_containsObject_(a3, v9, (uint64_t)CFSTR("VFXTriggerTypeMouseDragged"), v10))
    v14 = 8;
  else
    v14 = 0;
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFFF7 | v14;
  objc_msgSend_containsObject_(a3, v12, (uint64_t)CFSTR("VFXTriggerTypeMouseMoved"), v13);
  *(_WORD *)&self->_enabledTypes &= ~4u;
  if (objc_msgSend_containsObject_(a3, v15, (uint64_t)CFSTR("VFXTriggerTypeKeyDown"), v16))
    v19 = 16;
  else
    v19 = 0;
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFFEF | v19;
  if (objc_msgSend_containsObject_(a3, v17, (uint64_t)CFSTR("VFXTriggerTypeKeyUp"), v18))
    v22 = 32;
  else
    v22 = 0;
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFFDF | v22;
  if (objc_msgSend_containsObject_(a3, v20, (uint64_t)CFSTR("VFXTriggerTypeTouchBegan"), v21))
    v25 = 64;
  else
    v25 = 0;
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFFBF | v25;
  if (objc_msgSend_containsObject_(a3, v23, (uint64_t)CFSTR("VFXTriggerTypeTouchMoved"), v24))
    v28 = 128;
  else
    v28 = 0;
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFF7F | v28;
  if (objc_msgSend_containsObject_(a3, v26, (uint64_t)CFSTR("VFXTriggerTypeTouchEnded"), v27))
    v31 = 256;
  else
    v31 = 0;
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFEFF | v31;
  if (objc_msgSend_containsObject_(a3, v29, (uint64_t)CFSTR("VFXTriggerTypeTouchCanceled"), v30))
    v32 = 512;
  else
    v32 = 0;
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFDFF | v32;
  objc_sync_exit(self);
}

@end
