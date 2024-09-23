@implementation VFXPrefabAsset

- (NSString)identifier
{
  uint64_t v2;

  return (NSString *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%p"), v2, self->_rootNode);
}

+ (id)prefabWithRootNode:(id)a3
{
  VFXPrefabAsset *v4;

  v4 = objc_alloc_init(VFXPrefabAsset);
  v4->_rootNode = (VFXNode *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXPrefabAsset;
  -[VFXPrefabAsset dealloc](&v3, sel_dealloc);
}

- (VFXNode)rootNode
{
  return self->_rootNode;
}

- (void)setRootNode:(id)a3
{
  VFXNode *rootNode;

  rootNode = self->_rootNode;
  if (rootNode != a3)
  {

    self->_rootNode = (VFXNode *)a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  VFXPrefabAsset *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_alloc_init(VFXPrefabAsset);
  v4->_rootNode = (VFXNode *)(id)objc_msgSend_rootNode(self, v5, v6, v7);
  return v4;
}

- (VFXPrefabAsset)initWithCoder:(id)a3
{
  VFXPrefabAsset *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXPrefabAsset;
  v4 = -[VFXPrefabAsset init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_rootNode = (VFXNode *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("rootNode"));
    v7 = objc_opt_class();
    v4->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, (uint64_t)CFSTR("name"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_rootNode, (uint64_t)CFSTR("rootNode"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_name, (uint64_t)CFSTR("name"));
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

@end
