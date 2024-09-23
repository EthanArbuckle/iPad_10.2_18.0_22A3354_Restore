@implementation VFXCoreAsset

- (BOOL)isTextureSource
{
  return self->_isTextureSource;
}

- (void)setIsTextureSource:(BOOL)a3
{
  self->_isTextureSource = a3;
}

- (VFXCoreAsset)initWithEntityObject:(id)a3
{
  const char *v4;
  uint64_t v5;
  VFXCoreAsset *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VFXCoreAsset;
  v6 = -[VFXCoreAsset init](&v8, sel_init);
  if (v6)
    v6->_entityHandle = (VFXCoreEntityHandle *)(id)objc_msgSend_handleWithEntityObject_(VFXCoreEntityHandle, v4, (uint64_t)a3, v5);
  return v6;
}

+ (id)assetWithEntityObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithEntityObject_(v4, v5, (uint64_t)a3, v6);
}

- (NSString)identifier
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_tag(self->_entityHandle, a2, v2, v3);
}

- (id)entityTag
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_tag(self->_entityHandle, a2, v2, v3);
}

- (id)entityObject
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_entityObject(self->_entityHandle, a2, v2, v3);
}

- (void)setEntityHandle:(id)a3
{
  VFXCoreEntityHandle *entityHandle;

  entityHandle = self->_entityHandle;
  if (entityHandle != a3)
  {

    self->_entityHandle = (VFXCoreEntityHandle *)a3;
  }
}

- (void)resolveTag:(id)a3 remap:(id)a4
{
  objc_msgSend_resolveTag_remap_(self->_entityHandle, a2, (uint64_t)a3, (uint64_t)a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXCoreAsset;
  -[VFXCoreAsset dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t isTextureSource;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v8 = objc_msgSend_name(self, v5, v6, v7);
  objc_msgSend_setName_(v4, v9, v8, v10);
  isTextureSource = objc_msgSend_isTextureSource(self, v11, v12, v13);
  objc_msgSend_setIsTextureSource_(v4, v15, isTextureSource, v16);
  v20 = (id)objc_msgSend_copy(self->_entityHandle, v17, v18, v19);
  objc_msgSend_setEntityHandle_(v4, v21, (uint64_t)v20, v22);
  return v4;
}

- (VFXBehaviorGraph)behaviorGraph
{
  uint64_t v2;
  uint64_t v3;
  VFXBehaviorGraph *result;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  result = self->_behaviorGraph;
  if (!result)
  {
    if (objc_msgSend_entityObject(self->_entityHandle, a2, v2, v3))
    {
      v9 = objc_msgSend_entityObject(self->_entityHandle, v6, v7, v8);
      result = (VFXBehaviorGraph *)(id)objc_msgSend_behaviorGraphWithEntityObject_(VFXBehaviorGraph, v10, v9, v11);
      self->_behaviorGraph = result;
    }
    else
    {
      return self->_behaviorGraph;
    }
  }
  return result;
}

- (void)didAttachToWorld:(id)a3
{
  uint64_t v3;

  objc_msgSend_wasAddedToWorld_(self->_entityHandle, a2, (uint64_t)a3, v3);
}

- (void)didDetachFromWorld:(id)a3
{
  uint64_t v3;

  objc_msgSend_willBeRemovedFromWorld_(self->_entityHandle, a2, (uint64_t)a3, v3);
}

- (void)addWorldReference:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  _QWORD v8[5];

  if (self->_world == a3)
  {
    ++self->_worldReferenceCounter;
  }
  else
  {
    self->_world = (VFXWorld *)a3;
    self->_worldReferenceCounter = 1;
    objc_msgSend_didAttachToWorld_(self, a2, (uint64_t)a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B194B080;
    v8[3] = &unk_1E63D7D48;
    v8[4] = a3;
    objc_msgSend_enumerateDependencies_(self, v6, (uint64_t)v8, v7);
  }
}

- (void)removeWorldReference:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXWorld *world;
  unsigned int worldReferenceCounter;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  _QWORD v15[5];

  world = self->_world;
  if (!a3 || world == a3)
  {
    worldReferenceCounter = self->_worldReferenceCounter;
    if (worldReferenceCounter)
    {
      v12 = worldReferenceCounter - 1;
      self->_worldReferenceCounter = v12;
      if (!v12)
      {
        objc_msgSend_didDetachFromWorld_(self, a2, (uint64_t)world, v3);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = sub_1B194B138;
        v15[3] = &unk_1E63D7D48;
        v15[4] = a3;
        objc_msgSend_enumerateDependencies_(self, v13, (uint64_t)v15, v14);
        self->_world = 0;
      }
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Over-detach of instance %@ from world %@"), (uint64_t)world, v3, v4, v5, v6, v7, (uint64_t)self);
    }
  }
}

- (id)world
{
  return self->_world;
}

- (__CFXWorld)worldRef
{
  uint64_t v2;
  uint64_t v3;

  return (__CFXWorld *)objc_msgSend___CFObject(self->_world, a2, v2, v3);
}

- (VFXCoreAsset)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  VFXCoreAsset *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  VFXCoreEntityHandle *v10;
  const char *v11;
  uint64_t v12;
  VFXCoreEntityHandle *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VFXCoreAsset;
  v6 = -[VFXCoreAsset init](&v24, sel_init);
  if (v6)
  {
    if (objc_msgSend_containsValueForKey_(a3, v4, (uint64_t)CFSTR("entityTag"), v5))
    {
      v7 = objc_opt_class();
      v9 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, (uint64_t)CFSTR("entityTag"));
      v10 = [VFXCoreEntityHandle alloc];
      v13 = (VFXCoreEntityHandle *)objc_msgSend_initWithTag_(v10, v11, v9, v12);
    }
    else
    {
      v14 = objc_opt_class();
      v13 = (VFXCoreEntityHandle *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("entityHandle"));
    }
    v6->_entityHandle = v13;
    v16 = objc_opt_class();
    v6->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, (uint64_t)CFSTR("name"));
    v20 = objc_msgSend_decodeBoolForKey_(a3, v18, (uint64_t)CFSTR("isTextureSource"), v19);
    objc_msgSend_setIsTextureSource_(v6, v21, v20, v22);
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  VFXCoreEntityHandle *entityHandle;
  NSString *name;
  uint64_t isTextureSource;
  const char *v9;

  entityHandle = self->_entityHandle;
  if (entityHandle)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)entityHandle, (uint64_t)CFSTR("entityHandle"));
  name = self->_name;
  if (name)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)name, (uint64_t)CFSTR("name"));
  isTextureSource = objc_msgSend_isTextureSource(self, a2, (uint64_t)name, v3);
  objc_msgSend_encodeBool_forKey_(a3, v9, isTextureSource, (uint64_t)CFSTR("isTextureSource"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setBehaviorGraph:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
