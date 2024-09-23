@implementation VFXLayerAsset

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXLayerAsset;
  -[VFXFileAsset dealloc](&v3, sel_dealloc);
}

- (id)world
{
  return self->_world;
}

- (void)addWorldReference:(id)a3
{
  self->_world = (VFXWorld *)a3;
}

- (void)removeWorldReference:(id)a3
{
  self->_world = 0;
}

- (id)stateController
{
  id result;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  result = self->_stateController;
  if (!result)
  {
    v4 = objc_alloc(MEMORY[0x1E0CD2868]);
    v8 = objc_msgSend_rootLayer(self, v5, v6, v7);
    result = (id)objc_msgSend_initWithLayer_(v4, v9, v8, v10);
    self->_stateController = (CAStateController *)result;
  }
  return result;
}

- (void)updateActiveState
{
  uint64_t v2;
  uint64_t v3;
  VFXWorld *world;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  world = self->_world;
  if (world)
  {
    v6 = (void *)objc_msgSend_clock(world, a2, v2, v3);
    objc_msgSend_speed(v6, v7, v8, v9);
  }
  if (self->_activeStateName)
  {
    v10 = (void *)objc_msgSend_rootLayer(self, a2, v2, v3);
    v13 = objc_msgSend_stateWithName_(v10, v11, (uint64_t)self->_activeStateName, v12);
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend_stateController(self, a2, v2, v3);
  v18 = objc_msgSend_rootLayer(self, v15, v16, v17);
  MEMORY[0x1E0DE7D20](v14, sel_setState_ofLayer_transitionSpeed_, v13, v18);
}

- (CALayer)rootLayer
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  if (!self->_loaded)
  {
    self->_loaded = 1;
    v5 = (void *)objc_msgSend_world(self, a2, v2, v3);
    v12 = (void *)objc_msgSend_assetPathResolver(v5, v6, v7, v8);
    if (!v12)
    {
      v13 = (void *)objc_msgSend_valueForKey_(VFXTransaction, v9, (uint64_t)CFSTR("VFXWorldLoadingContextKey"), v11);
      v12 = (void *)objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("VFXWorldLoaderAssetPathResolver"), v15);
    }
    v16 = objc_msgSend_filename(self, v9, v10, v11);
    v19 = objc_msgSend_absoluteURLForAssetPath_(v12, v17, v16, v18);
    if (v19)
    {
      v23 = (void *)objc_msgSend_packageWithContentsOfURL_type_options_error_(MEMORY[0x1E0CD27F8], v20, v19, *MEMORY[0x1E0CD3078], 0, 0);
      self->_rootLayer = (CALayer *)(id)objc_msgSend_rootLayer(v23, v24, v25, v26);
    }
    objc_msgSend_updateActiveState(self, v20, v21, v22);
  }
  return self->_rootLayer;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VFXLayerAsset;
  v4 = -[VFXFileAsset copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[64] = self->_loaded;
  *((_QWORD *)v4 + 9) = self->_rootLayer;
  *((_QWORD *)v4 + 10) = self->_stateController;
  return v4;
}

- (id)activeStateName
{
  return self->_activeStateName;
}

- (void)setActiveStateName:(id)a3
{
  NSString *activeStateName;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  activeStateName = self->_activeStateName;
  if (activeStateName != a3)
  {

    self->_activeStateName = (NSString *)a3;
    objc_msgSend_updateActiveState(self, v6, v7, v8);
  }
}

- (VFXLayerAsset)initWithCoder:(id)a3
{
  VFXLayerAsset *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VFXLayerAsset;
  v4 = -[VFXFileAsset initWithCoder:](&v11, sel_initWithCoder_);
  if (v4)
  {
    v5 = objc_opt_class();
    v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("activeStateName"));
    objc_msgSend_setActiveStateName_(v4, v8, v7, v9);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t active;
  const char *v10;
  objc_super v11;

  if (objc_msgSend_activeStateName(self, a2, (uint64_t)a3, v3))
  {
    active = objc_msgSend_activeStateName(self, v6, v7, v8);
    objc_msgSend_encodeObject_forKey_(a3, v10, active, (uint64_t)CFSTR("activeStateName"));
  }
  v11.receiver = self;
  v11.super_class = (Class)VFXLayerAsset;
  -[VFXFileAsset encodeWithCoder:](&v11, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setRootLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
