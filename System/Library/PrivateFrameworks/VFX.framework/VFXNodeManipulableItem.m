@implementation VFXNodeManipulableItem

+ (id)nodeManipulatorItemWithNode:(id)a3 screenSize:(float)a4
{
  VFXNodeManipulableItem *v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v6 = objc_alloc_init(VFXNodeManipulableItem);
  *(float *)&v7 = a4;
  objc_msgSend_setScreenSize_(v6, v8, v9, v10, v7);
  objc_msgSend_setNode_(v6, v11, (uint64_t)a3, v12);
  return v6;
}

- (uint64_t)transform
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (void *)objc_msgSend_node(a1, a2, a3, a4);
  v8 = (void *)objc_msgSend_presentationNode(v4, v5, v6, v7);
  return objc_msgSend_transform(v8, v9, v10, v11);
}

- (__n128)draggedTransform
{
  return a1[7];
}

- (void)initializeDraggedTransform
{
  uint64_t v2;
  uint64_t v3;
  VFXNodeManipulableItem *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v4 = self + 1;
  v5 = (void *)objc_msgSend_node(self, a2, v2, v3);
  objc_msgSend_transform(v5, v6, v7, v8);
  *(_OWORD *)&v4->super.super.isa = v9;
  *(_OWORD *)&v4->super.node = v10;
  *(_OWORD *)&v4->super.elementIndex = v11;
  *(_OWORD *)v4->_anon_30 = v12;
}

- (uint64_t)setTransform:(uint64_t)a3
{
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v13;
  double v14;
  double v15;
  double v16;

  v16 = a8.n128_f64[0];
  v14 = a6.n128_f64[0];
  v15 = a7.n128_f64[0];
  v13 = a5.n128_f64[0];
  a1[7] = a5;
  a1[8] = a6;
  a1[9] = a7;
  a1[10] = a8;
  v8 = (void *)objc_msgSend_node(a1, a2, a3, a4);
  return objc_msgSend_setTransform_(v8, v9, v10, v11, v13, v14, v15, v16);
}

- (uint64_t)worldTransform
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (void *)objc_msgSend_node(a1, a2, a3, a4);
  v8 = (void *)objc_msgSend_presentationNode(v4, v5, v6, v7);
  return objc_msgSend_worldTransform(v8, v9, v10, v11);
}

- (uint64_t)setWorldTransform:(uint64_t)a3
{
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v9 = (void *)objc_msgSend_node(a1, a2, a3, a4);
  if (objc_msgSend_parentNode(v9, v10, v11, v12))
  {
    v16 = (void *)objc_msgSend_node(a1, v13, v14, v15);
    v20 = (void *)objc_msgSend_parentNode(v16, v17, v18, v19);
    objc_msgSend_convertTransform_fromNode_(v20, v21, 0, v22, a5, a6, a7, a8);
  }
  else
  {
    v26 = a8;
    v24 = a6;
    v25 = a7;
    v23 = a5;
  }
  return objc_msgSend_setTransform_(a1, v13, v14, v15, v23, v24, v25, v26);
}

- (uint64_t)scale
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (void *)objc_msgSend_node(a1, a2, a3, a4);
  v8 = (void *)objc_msgSend_presentationNode(v4, v5, v6, v7);
  return objc_msgSend_scale(v8, v9, v10, v11);
}

- (id)parentItem
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id result;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;

  v5 = (void *)objc_msgSend_node(self, a2, v2, v3);
  result = (id)objc_msgSend_parentNode(v5, v6, v7, v8);
  if (result)
  {
    v13 = (void *)objc_msgSend_node(self, v10, v11, v12);
    v17 = objc_msgSend_parentNode(v13, v14, v15, v16);
    objc_msgSend_screenSize(self, v18, v19, v20);
    return (id)objc_msgSend_nodeManipulatorItemWithNode_screenSize_(VFXNodeManipulableItem, v21, v17, v22);
  }
  return result;
}

- (id)cloneForManipulators
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
  uint64_t v12;
  float v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;

  v5 = (void *)objc_msgSend_node(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_clone(v5, v6, v7, v8);
  objc_msgSend_opacity(v9, v10, v11, v12);
  *(float *)&v14 = v13 * 0.5;
  objc_msgSend_setOpacity_(v9, v15, v16, v17, v14);
  objc_msgSend_setGizmo_(v9, v18, 1, v19);
  v23 = (void *)objc_msgSend_node(self, v20, v21, v22);
  objc_msgSend_convertTransform_toNode_(v23, v24, 0, v25, *(double *)&VFXMatrix4Identity, unk_1B2247DB0, 0.0, unk_1B2247DD0);
  objc_msgSend_setTransform_(v9, v26, v27, v28);
  objc_msgSend_screenSize(self, v29, v30, v31);
  return (id)objc_msgSend_nodeManipulatorItemWithNode_screenSize_(VFXNodeManipulableItem, v32, (uint64_t)v9, v33);
}

+ (void)addItems:(id)a3 toWorld:(id)a4
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, a2, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(a3);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        v14 = (void *)objc_msgSend_rootNode(a4, v7, v8, v9);
        v18 = objc_msgSend_node(v13, v15, v16, v17);
        objc_msgSend_addChildNode_(v14, v19, v18, v20);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v7, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v10);
  }
}

+ (void)removeItemsFromWorld:(id)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, a2, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v4)
  {
    v8 = v4;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(a3);
        v11 = (void *)objc_msgSend_node(*(void **)(*((_QWORD *)&v15 + 1) + 8 * v10), v5, v6, v7);
        objc_msgSend_removeFromParentNode(v11, v12, v13, v14);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v5, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v8);
  }
}

- (void)validateClone
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = (void *)objc_msgSend_node(self, a2, v2, v3);
  objc_msgSend_setGizmo_(v5, v6, 0, v7);
  v11 = (void *)objc_msgSend_node(self, v8, v9, v10);
  objc_msgSend_opacity(v11, v12, v13, v14);
  *(float *)&v16 = v15 + v15;
  objc_msgSend_setOpacity_(v11, v17, v18, v19, v16);
}

@end
