@implementation VFXPrefabUpdater

- (void)_associate:(id)a3 with:(id)a4
{
  CFDictionarySetValue(self->_srcToDst, a3, a4);
  CFDictionarySetValue(self->_dstToSrc, a4, a3);
}

- (BOOL)_dstHasAssociatedNode:(id)a3
{
  return CFDictionaryGetValue(self->_dstToSrc, a3) != 0;
}

- (id)_dstAssociatedNode:(id)a3
{
  return (id)CFDictionaryGetValue(self->_dstToSrc, a3);
}

- (id)_srcAssociatedNode:(id)a3
{
  return (id)CFDictionaryGetValue(self->_srcToDst, a3);
}

- (void)addOperation:(int64_t)a3 src:(id)a4 dst:(id)a5
{
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  VFXPrefabUpdateOperation *v17;

  v17 = objc_alloc_init(VFXPrefabUpdateOperation);
  objc_msgSend_setSource_(v17, v9, (uint64_t)a4, v10);
  objc_msgSend_setDestination_(v17, v11, (uint64_t)a5, v12);
  objc_msgSend_setOperation_(v17, v13, a3, v14);
  objc_msgSend_addObject_(self->_operations, v15, (uint64_t)v17, v16);

}

- (void)_syncNode:(id)a3 with:(id)a4
{
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;

  if ((self->_importOptions & 2) != 0 && self->_rootSrc != a4 && self->_rootDst != a3)
  {
    objc_msgSend_transform(a4, a2, (uint64_t)a3, (uint64_t)a4);
    v37 = v8;
    v38 = v7;
    v39 = v10;
    v40 = v9;
    objc_msgSend_transform(a3, v11, v12, v13);
    if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v38, v14), (int8x16_t)vceqq_f32(v37, v15)), vandq_s8((int8x16_t)vceqq_f32(v40, v16), (int8x16_t)vceqq_f32(v39, v17)))) & 0x80000000) == 0)objc_msgSend_addOperation_src_dst_(self, a2, 2, (uint64_t)a4, a3);
  }
  if ((self->_importOptions & 0x20) != 0
    && (objc_msgSend_camera(a4, a2, (uint64_t)a3, (uint64_t)a4) || objc_msgSend_camera(a3, a2, v18, v19)))
  {
    objc_msgSend_addOperation_src_dst_(self, a2, 5, (uint64_t)a4, a3);
  }
  if ((self->_importOptions & 4) != 0
    && (objc_msgSend_model(a4, a2, (uint64_t)a3, (uint64_t)a4) || objc_msgSend_model(a3, a2, v20, v21)))
  {
    objc_msgSend_addOperation_src_dst_(self, a2, 3, (uint64_t)a4, a3);
  }
  if ((self->_importOptions & 0x10) != 0
    && (objc_msgSend_light(a4, a2, (uint64_t)a3, (uint64_t)a4) || objc_msgSend_light(a3, a2, v22, v23)))
  {
    objc_msgSend_addOperation_src_dst_(self, a2, 4, (uint64_t)a4, a3);
  }
  if ((self->_importOptions & 8) != 0)
  {
    v24 = (void *)objc_msgSend_animationKeys(a4, a2, (uint64_t)a3, (uint64_t)a4);
    if (objc_msgSend_count(v24, v25, v26, v27)
      || (v30 = (void *)objc_msgSend_animationKeys(a3, a2, v28, v29), objc_msgSend_count(v30, v31, v32, v33)))
    {
      objc_msgSend_addOperation_src_dst_(self, a2, 7, (uint64_t)a4, a3);
    }
  }
  if ((self->_importOptions & 0x40) != 0
    && (objc_msgSend_model(a4, a2, (uint64_t)a3, (uint64_t)a4) || objc_msgSend_model(a3, v34, v35, v36)))
  {
    objc_msgSend_addOperation_src_dst_(self, v34, 6, (uint64_t)a4, a3);
  }
}

- (id)_findAssociatedNode:(id)a3 inSubtree:(id)a4 ignoring:(id)a5
{
  id v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *AssociatedNode_inSubtree_ignoring;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a4 == a5)
    return 0;
  v6 = a4;
  v9 = (void *)objc_msgSend_name(a4, a2, (uint64_t)a3, (uint64_t)a4);
  v13 = objc_msgSend_name(a3, v10, v11, v12);
  if (objc_msgSend_isEqualToString_(v9, v14, v13, v15)
    && !objc_msgSend__dstHasAssociatedNode_(self, v16, (uint64_t)v6, v18))
  {
    return v6;
  }
  if (!objc_msgSend_name(a3, v16, v17, v18))
    return 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = (void *)objc_msgSend_childNodes(v6, v19, v20, v21, 0);
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v31, (uint64_t)v35, 16);
  if (!v24)
    return 0;
  v26 = v24;
  v27 = *(_QWORD *)v32;
  while (2)
  {
    for (i = 0; i != v26; ++i)
    {
      if (*(_QWORD *)v32 != v27)
        objc_enumerationMutation(v22);
      AssociatedNode_inSubtree_ignoring = (void *)objc_msgSend__findAssociatedNode_inSubtree_ignoring_(self, v25, (uint64_t)a3, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), a5);
      if (AssociatedNode_inSubtree_ignoring)
        return AssociatedNode_inSubtree_ignoring;
    }
    v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v31, (uint64_t)v35, 16);
    v6 = 0;
    if (v26)
      continue;
    break;
  }
  return v6;
}

- (id)_findChild:(id)a3 inChildrenOf:(id)a4 index:(unint64_t)a5
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id result;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;

  v7 = objc_msgSend_name(a3, a2, (uint64_t)a3, (uint64_t)a4);
  result = (id)objc_msgSend_childNodeWithName_(a4, v8, v7, v9);
  if (!result)
  {
    v14 = (void *)objc_msgSend_childNodes(a4, v11, v12, v13);
    if (objc_msgSend_count(v14, v15, v16, v17) <= a5)
    {
      return 0;
    }
    else
    {
      v21 = (void *)objc_msgSend_childNodes(a4, v18, v19, v20);
      return (id)objc_msgSend_objectAtIndexedSubscript_(v21, v22, a5, v23);
    }
  }
  return result;
}

- (void)associateNodeTree:(id)a3 withNodeTree:(id)a4 root:(id)a5
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedNode_inSubtree_ignoring;
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
  uint64_t i;
  uint64_t v25;
  uint64_t Child_inChildrenOf_index;
  const char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend__srcAssociatedNode_(self, a2, (uint64_t)a3, (uint64_t)a4))
  {
    AssociatedNode_inSubtree_ignoring = 0;
  }
  else if (objc_msgSend_name(a3, v9, v10, v11)
         || objc_msgSend_name(a4, v13, v14, v15)
         || (objc_msgSend__dstHasAssociatedNode_(self, v13, (uint64_t)a4, v16) & 1) != 0)
  {
    AssociatedNode_inSubtree_ignoring = objc_msgSend__findAssociatedNode_inSubtree_ignoring_(self, v13, (uint64_t)a3, (uint64_t)a4, 0);
    if (AssociatedNode_inSubtree_ignoring
      || (AssociatedNode_inSubtree_ignoring = objc_msgSend__findAssociatedNode_inSubtree_ignoring_(self, v9, (uint64_t)a3, (uint64_t)a5, a4)) != 0)
    {
      objc_msgSend__associate_with_(self, v9, (uint64_t)a3, AssociatedNode_inSubtree_ignoring);
    }
  }
  else
  {
    objc_msgSend__associate_with_(self, v13, (uint64_t)a3, (uint64_t)a4);
    AssociatedNode_inSubtree_ignoring = (uint64_t)a4;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = (void *)objc_msgSend_childNodes(a3, v9, v10, v11, 0);
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v19)
  {
    v21 = v19;
    v22 = 0;
    v23 = *(_QWORD *)v29;
    if (!AssociatedNode_inSubtree_ignoring)
      AssociatedNode_inSubtree_ignoring = (uint64_t)a4;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v17);
        v25 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        Child_inChildrenOf_index = objc_msgSend__findChild_inChildrenOf_index_(self, v20, v25, AssociatedNode_inSubtree_ignoring, v22 + i);
        if (Child_inChildrenOf_index)
          objc_msgSend_associateNodeTree_withNodeTree_root_(self, v27, v25, Child_inChildrenOf_index, a5);
        else
          objc_msgSend_associateNodeTree_withNodeTree_root_(self, v27, v25, (uint64_t)a4, a5);
      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v28, (uint64_t)v32, 16);
      v22 += i;
    }
    while (v21);
  }
}

- (void)collectOrphanNodes:(id)a3 dst:(id)a4
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B198C570;
  v10[3] = &unk_1E63D80A0;
  v10[4] = self;
  objc_msgSend_enumerateHierarchyUsingBlock_(a3, a2, (uint64_t)v10, (uint64_t)a4);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_1B198C5D4;
  v9[3] = &unk_1E63D80A0;
  v9[4] = self;
  objc_msgSend_enumerateHierarchyUsingBlock_(a4, v7, (uint64_t)v9, v8);
}

- (id)diffOld:(id)a3 withNew:(id)a4 options:(unint64_t)a5
{
  char v5;
  const char *v9;
  const char *v10;
  const char *v11;

  v5 = a5;
  self->_importOptions = (a5 >> 4) & 4 | a5;
  self->_rootSrc = (VFXNode *)a4;
  self->_rootDst = (VFXNode *)a3;
  self->_operations = (NSMutableArray *)objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, (uint64_t)a3, (uint64_t)a4);
  self->_srcToDst = CFDictionaryCreateMutable(0, 0, 0, 0);
  self->_dstToSrc = CFDictionaryCreateMutable(0, 0, 0, 0);
  objc_msgSend__associate_with_(self, v9, (uint64_t)a4, (uint64_t)a3);
  objc_msgSend_associateNodeTree_withNodeTree_root_(self, v10, (uint64_t)a4, (uint64_t)a3, a3);
  CFDictionaryApplyFunction(self->_srcToDst, (CFDictionaryApplierFunction)sub_1B198C714, self);
  if ((v5 & 1) != 0)
    objc_msgSend_collectOrphanNodes_dst_(self, v11, (uint64_t)a4, (uint64_t)a3);
  CFRelease(self->_srcToDst);
  CFRelease(self->_dstToSrc);
  self->_srcToDst = 0;
  self->_dstToSrc = 0;
  return self->_operations;
}

- (void)applyDiff:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t j;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  id obj;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  NSLog(CFSTR("DIFF--------------"), a2);
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = a3;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v4, (uint64_t)&v83, (uint64_t)v88, 16);
  if (v5)
  {
    v9 = v5;
    v10 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v84 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        v13 = objc_msgSend_operation(v12, v6, v7, v8);
        v17 = objc_msgSend_source(v12, v14, v15, v16);
        v21 = objc_msgSend_destination(v12, v18, v19, v20);
        NSLog(CFSTR("%d: %@ %@"), v13, v17, v21);
        v25 = (void *)objc_msgSend_destination(v12, v22, v23, v24);
        v29 = (void *)objc_msgSend_source(v12, v26, v27, v28);
        switch(objc_msgSend_operation(v12, v30, v31, v32))
        {
          case 0:
            objc_msgSend_addChildNode_(v25, v6, (uint64_t)v29, v8);
            break;
          case 1:
            objc_msgSend_removeFromParentNode(v25, v6, v7, v8);
            break;
          case 2:
            objc_msgSend_transform(v29, v6, v7, v8);
            objc_msgSend_setTransform_(v25, v36, v37, v38);
            break;
          case 3:
            v39 = (void *)objc_msgSend_model(v25, v6, v7, v8);
            v43 = objc_msgSend_materials(v39, v40, v41, v42);
            v47 = objc_msgSend_model(v29, v44, v45, v46);
            objc_msgSend_setModel_(v25, v48, v47, v49);
            if (v43)
              goto LABEL_15;
            break;
          case 4:
            v33 = objc_msgSend_light(v29, v6, v7, v8);
            objc_msgSend_setLight_(v25, v34, v33, v35);
            break;
          case 5:
            v50 = objc_msgSend_camera(v29, v6, v7, v8);
            objc_msgSend_setCamera_(v25, v51, v50, v52);
            break;
          case 6:
            v53 = (void *)objc_msgSend_model(v29, v6, v7, v8);
            v43 = objc_msgSend_materials(v53, v54, v55, v56);
LABEL_15:
            v57 = (void *)objc_msgSend_model(v25, v6, v7, v8);
            objc_msgSend_setMaterials_(v57, v58, v43, v59);
            break;
          case 7:
            objc_msgSend_removeAllAnimations(v25, v6, v7, v8);
            v81 = 0u;
            v82 = 0u;
            v79 = 0u;
            v80 = 0u;
            v63 = (void *)objc_msgSend_source(v12, v60, v61, v62);
            v67 = (void *)objc_msgSend_animationKeys(v63, v64, v65, v66);
            v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v79, (uint64_t)v87, 16);
            if (v69)
            {
              v70 = v69;
              v71 = *(_QWORD *)v80;
              do
              {
                for (j = 0; j != v70; ++j)
                {
                  if (*(_QWORD *)v80 != v71)
                    objc_enumerationMutation(v67);
                  v73 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j);
                  v74 = (void *)objc_msgSend_source(v12, v6, v7, v8);
                  v77 = objc_msgSend_animationPlayerForKey_(v74, v75, v73, v76);
                  if (v77)
                    objc_msgSend_addAnimationPlayer_forKey_(v25, v6, v77, v73);
                }
                v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v6, (uint64_t)&v79, (uint64_t)v87, 16);
              }
              while (v70);
            }
            break;
          default:
            continue;
        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v83, (uint64_t)v88, 16);
    }
    while (v9);
  }
}

- (void)updatePrefab:(id)a3 withNewPrefab:(id)a4 options:(unint64_t)a5
{
  uint64_t v6;
  uint64_t v7;

  v6 = objc_msgSend_diffOld_withNew_options_(self, a2, (uint64_t)a3, (uint64_t)a4, a5);
  MEMORY[0x1E0DE7D20](self, sel_applyDiff_, v6, v7);
}

@end
