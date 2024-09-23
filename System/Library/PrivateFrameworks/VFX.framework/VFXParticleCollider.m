@implementation VFXParticleCollider

- (VFXParticleCollider)initWithEntityObject:(id)a3
{
  const char *v4;
  uint64_t v5;
  VFXParticleCollider *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VFXParticleCollider;
  v6 = -[VFXParticleCollider init](&v8, sel_init);
  if (v6)
    v6->_coreHandle = (VFXCoreEntityHandle *)(id)objc_msgSend_handleWithEntityObject_(VFXCoreEntityHandle, v4, (uint64_t)a3, v5);
  return v6;
}

- (VFXParticleCollider)initWithCoreEntityHandle:(id)a3
{
  VFXParticleCollider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VFXParticleCollider;
  v4 = -[VFXParticleCollider init](&v6, sel_init);
  if (v4)
    v4->_coreHandle = (VFXCoreEntityHandle *)a3;
  return v4;
}

+ (id)presentationParticleColliderWithCoreEntityHandleRef:(__CFXCoreEntityHandle *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  VFXParticleCollider *v12;
  const char *v13;
  uint64_t v14;

  result = (id)sub_1B18F4794(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (result)
  {
    v11 = objc_msgSend_handleWithEntityObject_(VFXCoreEntityHandle, v9, (uint64_t)result, v10);
    v12 = [VFXParticleCollider alloc];
    return (id)objc_msgSend_initWithCoreEntityHandle_(v12, v13, v11, v14);
  }
  return result;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXParticleCollider;
  -[VFXParticleCollider dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: %p>"), v7, v5, self);
}

+ (id)particleColliderWithEntityObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithEntityObject_(v4, v5, (uint64_t)a3, v6);
}

- (id)tag
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_tag(self->_coreHandle, a2, v2, v3);
}

- (void)__CFObject
{
  return (void *)((uint64_t (*)(VFXCoreEntityHandle *, char *))MEMORY[0x1E0DE7D20])(self->_coreHandle, sel_handle);
}

- (__CFXWorld)worldRef
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (_QWORD *)objc_msgSend___CFObject(self, a2, v2, v3);
  return (__CFXWorld *)sub_1B17C6244(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)world
{
  uint64_t v2;
  uint64_t v3;
  id result;

  result = (id)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
    return sub_1B193E758((id *)result);
  return result;
}

- (void)wasAddedToWorld:(id)a3
{
  uint64_t v3;

  objc_msgSend_wasAddedToWorld_(self->_coreHandle, a2, (uint64_t)a3, v3);
}

- (void)willBeRemovedFromWorld:(id)a3
{
  uint64_t v3;

  objc_msgSend_willBeRemovedFromWorld_(self->_coreHandle, a2, (uint64_t)a3, v3);
}

- (__CFXCoreEntityHandle)coreEntityHandleRef
{
  return (__CFXCoreEntityHandle *)((uint64_t (*)(VFXCoreEntityHandle *, char *))MEMORY[0x1E0DE7D20])(self->_coreHandle, sel_handle);
}

- (id)coreEntityHandle
{
  return self->_coreHandle;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)objc_msgSend_copy(self->_coreHandle, a2, (uint64_t)a3, v3);
  v5 = objc_alloc((Class)objc_opt_class());
  v8 = (void *)objc_msgSend_initWithCoreEntityHandle_(v5, v6, (uint64_t)v4, v7);

  return v8;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_coreHandle, (uint64_t)CFSTR("coreHandle"));
}

- (VFXParticleCollider)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXParticleCollider *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  VFXCoreEntityHandle *v16;
  const char *v17;
  uint64_t v18;
  VFXCoreEntityHandle *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)VFXParticleCollider;
  v7 = -[VFXParticleCollider init](&v25, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    if (objc_msgSend_containsValueForKey_(a3, v11, (uint64_t)CFSTR("rootIdentifier"), v12))
    {
      v13 = objc_opt_class();
      v15 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("rootIdentifier"));
      v16 = [VFXCoreEntityHandle alloc];
      v19 = (VFXCoreEntityHandle *)objc_msgSend_initWithTag_(v16, v17, v15, v18);
    }
    else
    {
      v22 = objc_opt_class();
      v19 = (VFXCoreEntityHandle *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v23, v22, (uint64_t)CFSTR("coreHandle"));
    }
    v7->_coreHandle = v19;
    objc_msgSend_setImmediateMode_(VFXTransaction, v20, v8, v21);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
