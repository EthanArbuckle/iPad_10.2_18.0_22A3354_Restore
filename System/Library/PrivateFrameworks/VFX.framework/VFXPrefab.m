@implementation VFXPrefab

- (VFXPrefab)initWithAsset:(id)a3
{
  VFXPrefab *v4;
  const char *v5;
  uint64_t v6;
  VFXPrefab *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VFXPrefab;
  v4 = -[VFXPrefab init](&v9, sel_init);
  v7 = v4;
  if (v4)
    objc_msgSend_setSource_(v4, v5, (uint64_t)a3, v6);
  return v7;
}

+ (id)prefabWithAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc((Class)objc_opt_class());
  return (id)objc_msgSend_initWithAsset_(v4, v5, (uint64_t)a3, v6);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXPrefab;
  -[VFXPrefab dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  VFXPrefab *v4;
  const char *v5;
  uint64_t v6;

  v4 = [VFXPrefab alloc];
  return (id)objc_msgSend_initWithAsset_(v4, v5, (uint64_t)self->_source, v6);
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
  return (id)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: %p source=%@>"), v7, v5, self, self->_source);
}

- (id)reload:(id)a3 options:(unint64_t)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  VFXPrefabUpdater *v19;
  const char *v20;
  const char *v21;

  v7 = (void *)objc_msgSend_source(self, a2, (uint64_t)a3, a4);
  v11 = (void *)objc_msgSend_rootNode(v7, v8, v9, v10);
  v15 = (void *)objc_msgSend_clone(v11, v12, v13, v14);
  v18 = v15;
  if (!a3 || (a4 & 0x80) != 0)
  {
    objc_msgSend_setPrefab_(v15, v16, (uint64_t)self, v17);
    if (a3 && v18)
      objc_msgSend_copyWithOptions_to_(a3, v21, 0, (uint64_t)v18);
  }
  else
  {
    v19 = objc_alloc_init(VFXPrefabUpdater);
    objc_msgSend_updatePrefab_withNewPrefab_options_(v19, v20, (uint64_t)a3, (uint64_t)v18, a4);
    return 0;
  }
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  VFXPrefabAsset *source;

  source = self->_source;
  if (source)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)source, (uint64_t)CFSTR("source"));
}

- (VFXPrefab)initWithCoder:(id)a3
{
  VFXPrefab *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)VFXPrefab;
  v4 = -[VFXPrefab init](&v16, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v17, 1);
    v10 = objc_msgSend_setWithArray_(v5, v8, v7, v9);
    v12 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v11, v10, (uint64_t)CFSTR("source"));
    objc_msgSend_setSource_(v4, v13, v12, v14);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VFXPrefabAsset)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
