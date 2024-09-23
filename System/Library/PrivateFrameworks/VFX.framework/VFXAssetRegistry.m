@implementation VFXAssetRegistry

- (VFXAssetRegistry)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  VFXAssetRegistry *v5;
  VFXAssetNode *v6;
  const char *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXAssetRegistry;
  v5 = -[VFXAssetRegistry init](&v10, sel_init);
  if (v5)
  {
    v6 = (VFXAssetNode *)(id)objc_msgSend_group(VFXAssetNode, v2, v3, v4);
    v5->_root = v6;
    objc_msgSend_setRegistry_(v6, v7, (uint64_t)v5, v8);
  }
  return v5;
}

- (void)setWorld:(id)a3
{
  self->_world = (VFXWorld *)a3;
}

- (VFXWorld)world
{
  return self->_world;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_setRegistry_(self->_root, a2, 0, v2);

  self->_world = 0;
  v4.receiver = self;
  v4.super_class = (Class)VFXAssetRegistry;
  -[VFXAssetRegistry dealloc](&v4, sel_dealloc);
}

- (VFXAssetNode)rootNode
{
  return self->_root;
}

- (VFXAssetRegistry)initWithCoder:(id)a3
{
  VFXAssetRegistry *v4;
  uint64_t v5;
  const char *v6;
  VFXAssetNode *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VFXAssetRegistry;
  v4 = -[VFXAssetRegistry init](&v13, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v7 = (VFXAssetNode *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("root"));
    v8 = MEMORY[0x1E0C809B0];
    v4->_root = v7;
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = sub_1B194AD9C;
    v12[3] = &unk_1E63D9A48;
    v12[4] = v4;
    objc_msgSend_enumerateHierarchyUsingBlock_(v7, v9, (uint64_t)v12, v10);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_root, (uint64_t)CFSTR("root"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
