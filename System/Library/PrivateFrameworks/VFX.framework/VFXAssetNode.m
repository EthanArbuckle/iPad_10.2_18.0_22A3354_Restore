@implementation VFXAssetNode

- (VFXAssetNode)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXAssetNode;
  return -[VFXAssetNode init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXAssetNode;
  -[VFXAssetNode dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v5[16] = self->_isGroup;
  v5[17] = self->_prefab;
  v9 = objc_msgSend_name(self, v6, v7, v8);
  objc_msgSend_setName_(v5, v10, v9, v11);
  v15 = (void *)objc_msgSend_asset(self, v12, v13, v14);
  *((_QWORD *)v5 + 1) = objc_msgSend_copyWithZone_(v15, v16, (uint64_t)a3, v17);
  return v5;
}

- (id)clone
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_copy(self, a2, v2, v3);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = (void *)objc_msgSend_childNodes(self, v6, v7, v8, 0);
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v11)
  {
    v15 = v11;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v9);
        v18 = objc_msgSend_clone(*(void **)(*((_QWORD *)&v22 + 1) + 8 * v17), v12, v13, v14);
        objc_msgSend_addChildNode_(v5, v19, v18, v20);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v15);
  }
  return v5;
}

- (void)setRegistry:(id)a3
{
  uint64_t v3;
  VFXAssetRegistry *registry;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  registry = self->_registry;
  if (registry != a3)
  {
    v7 = objc_msgSend_world(registry, a2, (uint64_t)a3, v3);
    if (v7)
    {
      v11 = v7;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_removeWorldReference_(self->_asset, v8, v11, v10);
    }
    self->_registry = (VFXAssetRegistry *)a3;
    v12 = objc_msgSend_world(a3, v8, v9, v10);
    if (v12)
    {
      v16 = v12;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_addWorldReference_(self->_asset, v13, v16, v15);
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = (void *)objc_msgSend_childNodes(self, v13, v14, v15, 0);
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v25, (uint64_t)v29, 16);
    if (v19)
    {
      v22 = v19;
      v23 = *(_QWORD *)v26;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v26 != v23)
            objc_enumerationMutation(v17);
          objc_msgSend_setRegistry_(*(void **)(*((_QWORD *)&v25 + 1) + 8 * v24++), v20, (uint64_t)a3, v21);
        }
        while (v22 != v24);
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v25, (uint64_t)v29, 16);
      }
      while (v22);
    }
  }
}

- (id)registry
{
  return self->_registry;
}

+ (id)assetNodeWithAsset:(id)a3
{
  VFXAssetNode *v4;

  v4 = objc_alloc_init(VFXAssetNode);
  v4->_asset = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(_WORD *)&v4->_isGroup = 257;
  return v4;
}

+ (id)group
{
  id result;

  result = objc_alloc_init(VFXAssetNode);
  *((_BYTE *)result + 16) = 1;
  return result;
}

- (VFXAssetNode)parentNode
{
  return self->_parent;
}

- (NSArray)childNodes
{
  return &self->_children->super;
}

- (void)setChildNodes:(id)a3
{
  uint64_t v3;
  NSMutableArray *children;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  _QWORD *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  children = self->_children;
  if (children)
    v7 = (void *)objc_msgSend_setWithArray_(MEMORY[0x1E0C99E20], a2, (uint64_t)children, v3);
  else
    v7 = 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, a2, (uint64_t)&v32, (uint64_t)v37, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(a3);
        v14 = *(_QWORD **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend_removeObject_(v7, v9, (uint64_t)v14, v10);
        if ((VFXAssetNode *)v14[4] != self)
        {
          objc_msgSend_removeFromParent(v14, v9, v15, v10);
          v14[4] = self;
          objc_msgSend_setRegistry_(v14, v16, (uint64_t)self->_registry, v17);
        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v9, (uint64_t)&v32, (uint64_t)v37, 16);
    }
    while (v11);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v28, (uint64_t)v36, 16);
  if (v18)
  {
    v22 = v18;
    v23 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v7);
        v25 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        *(_QWORD *)(v25 + 32) = 0;
        *(_QWORD *)(v25 + 48) = 0;
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v19, (uint64_t)&v28, (uint64_t)v36, 16);
    }
    while (v22);
  }
  objc_msgSend_setupChildsArrayIfNeeded(self, v19, v20, v21);
  objc_msgSend_setArray_(self->_children, v26, (uint64_t)a3, v27);
}

- (void)setupChildsArrayIfNeeded
{
  if (!self->_children)
    self->_children = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

- (void)addChildNode:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  if (*((_QWORD *)a3 + 4))
    objc_msgSend_removeFromParent(a3, a2, (uint64_t)a3, v3);
  *((_QWORD *)a3 + 4) = self;
  objc_msgSend_setRegistry_(a3, a2, (uint64_t)self->_registry, v3);
  objc_msgSend_setupChildsArrayIfNeeded(self, v6, v7, v8);
  objc_msgSend_addObject_(self->_children, v9, (uint64_t)a3, v10);
}

- (void)insertChildNode:(id)a3 atIndex:(unint64_t)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  if (*((_QWORD *)a3 + 4))
    objc_msgSend_removeFromParent(a3, a2, (uint64_t)a3, a4);
  objc_msgSend_setRegistry_(a3, a2, (uint64_t)self->_registry, a4);
  *((_QWORD *)a3 + 4) = self;
  objc_msgSend_setupChildsArrayIfNeeded(self, v7, v8, v9);
  objc_msgSend_insertObject_atIndex_(self->_children, v10, (uint64_t)a3, a4);
}

- (void)_removeChild:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_setRegistry_(a3, a2, 0, v3);
  objc_msgSend_removeObject_(self->_children, v6, (uint64_t)a3, v7);
}

- (void)removeFromParent
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_parentNode(self, a2, v2, v3);
  objc_msgSend__removeChild_(v5, v6, (uint64_t)self, v7);
  self->_parent = 0;
}

- (BOOL)_enumerateChildNodesUsingBlock:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  (*((void (**)(id, VFXAssetNode *, char *))a3 + 2))(a3, self, &v21);
  if (!v21)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (void *)objc_msgSend_childNodes(self, v5, v6, v7, 0);
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v17, (uint64_t)v22, 16);
    if (v11)
    {
      v14 = v11;
      v15 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v9);
          v21 = objc_msgSend__enumerateChildNodesUsingBlock_(*(void **)(*((_QWORD *)&v17 + 1) + 8 * i), v12, (uint64_t)a3, v13);
          if ((v21 & 1) != 0)
            return 1;
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v17, (uint64_t)v22, 16);
        if (v14)
          continue;
        break;
      }
    }
  }
  return v21 != 0;
}

- (void)enumerateChildNodesUsingBlock:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_msgSend_childNodes(self, a2, (uint64_t)a3, v3, 0);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v14;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v5);
      if ((objc_msgSend__enumerateChildNodesUsingBlock_(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v12), v8, (uint64_t)a3, v9) & 1) != 0)break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, (uint64_t)v17, 16);
        if (v10)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (void)enumerateHierarchyUsingBlock:(id)a3
{
  const char *v5;
  uint64_t v6;
  char v7;

  v7 = 0;
  (*((void (**)(id, VFXAssetNode *, char *))a3 + 2))(a3, self, &v7);
  if (!v7)
    objc_msgSend_enumerateChildNodesUsingBlock_(self, v5, (uint64_t)a3, v6);
}

- (id)childNodeWithAssetName:(id)a3
{
  uint64_t v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_1B194A614;
  v11 = sub_1B194A624;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1B194A630;
  v6[3] = &unk_1E63D9A20;
  v6[4] = a3;
  v6[5] = &v7;
  objc_msgSend_enumerateChildNodesUsingBlock_(self, a2, (uint64_t)v6, v3);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)childNodeWithName:(id)a3
{
  uint64_t v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_1B194A614;
  v11 = sub_1B194A624;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1B194A73C;
  v6[3] = &unk_1E63D9A20;
  v6[4] = a3;
  v6[5] = &v7;
  objc_msgSend_enumerateChildNodesUsingBlock_(self, a2, (uint64_t)v6, v3);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)enclosingPrefab
{
  uint64_t v2;
  uint64_t v3;
  VFXAssetNode *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  while (1)
  {
    v4 = self;
    if (!self || (objc_msgSend_isPrefab(self, a2, v2, v3) & 1) != 0)
      break;
    self = (VFXAssetNode *)objc_msgSend_parentNode(v4, v5, v6, v7);
  }
  return v4;
}

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;
  id asset;

  asset = self->_asset;
  if (asset)
    return (NSString *)objc_msgSend_name(asset, a2, v2, v3);
  else
    return self->_name;
}

- (void)setName:(id)a3
{
  uint64_t v3;
  id asset;
  NSString *name;

  asset = self->_asset;
  if (asset)
  {
    objc_msgSend_setName_(asset, a2, (uint64_t)a3, v3);
  }
  else
  {
    name = self->_name;
    if (name != a3)
    {

      self->_name = (NSString *)a3;
    }
  }
}

- (VFXAsset)asset
{
  return (VFXAsset *)self->_asset;
}

- (BOOL)isGroup
{
  uint64_t v2;
  uint64_t v3;

  return self->_isGroup || objc_msgSend_count(self->_children, a2, v2, v3) != 0;
}

- (BOOL)isPrefab
{
  return self->_prefab;
}

- (VFXAssetNode)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  VFXAssetNode *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  uint64_t v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _QWORD v47[2];
  _QWORD v48[9];

  v48[8] = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)VFXAssetNode;
  v6 = -[VFXAssetNode init](&v45, sel_init);
  if (!v6)
    return v6;
  v6->_isGroup = objc_msgSend_decodeBoolForKey_(a3, v4, (uint64_t)CFSTR("isGroup"), v5);
  v6->_prefab = objc_msgSend_decodeBoolForKey_(a3, v7, (uint64_t)CFSTR("isPrefab"), v8);
  if (v6->_isGroup)
  {
    v9 = objc_opt_class();
    v6->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, (uint64_t)CFSTR("name"));
  }
  v11 = (void *)MEMORY[0x1E0C99E60];
  v48[0] = objc_opt_class();
  v48[1] = objc_opt_class();
  v48[2] = objc_opt_class();
  v48[3] = objc_opt_class();
  v48[4] = objc_opt_class();
  v48[5] = objc_opt_class();
  v48[6] = objc_opt_class();
  v48[7] = objc_opt_class();
  v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v48, 8);
  v16 = objc_msgSend_setWithArray_(v11, v14, v13, v15);
  v6->_asset = (id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v17, v16, (uint64_t)CFSTR("asset"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v18 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;

    v18 = (id)objc_msgSend_mesh(v6->_asset, v19, v20, v21);
  }
  v6->_asset = v18;
LABEL_9:
  v22 = (void *)MEMORY[0x1E0C99E60];
  v47[0] = objc_opt_class();
  v47[1] = objc_opt_class();
  v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v23, (uint64_t)v47, 2);
  v27 = objc_msgSend_setWithArray_(v22, v25, v24, v26);
  v29 = (void *)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v28, v27, (uint64_t)CFSTR("childNodes"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v41, (uint64_t)v46, 16);
  if (v31)
  {
    v35 = v31;
    v36 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(v29);
        v38 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if ((objc_msgSend_isGroup(v38, v32, v33, v34) & 1) != 0 || objc_msgSend_asset(v38, v32, v39, v34))
          objc_msgSend_addChildNode_(v6, v32, (uint64_t)v38, v34);
      }
      v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v41, (uint64_t)v46, 16);
    }
    while (v35);
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  id asset;
  NSMutableArray *children;

  if (self->_isGroup)
  {
    objc_msgSend_encodeBool_forKey_(a3, a2, 1, (uint64_t)CFSTR("isGroup"));
    objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_name, (uint64_t)CFSTR("name"));
    if (self->_prefab)
      objc_msgSend_encodeBool_forKey_(a3, a2, 1, (uint64_t)CFSTR("isPrefab"));
  }
  asset = self->_asset;
  if (asset)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)asset, (uint64_t)CFSTR("asset"));
  children = self->_children;
  if (children)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)children, (uint64_t)CFSTR("childNodes"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
