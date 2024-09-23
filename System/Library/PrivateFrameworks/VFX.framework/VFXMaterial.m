@implementation VFXMaterial

- (id)_integrateModelKitComputedMaps:(id)a3 withGeometry:(id)a4 node:(id)a5 texturePathProvider:(id)a6 vertexAttributeNamed:(id)a7 materialPropertyNamed:(id)a8 filePath:(id)a9
{
  int isEqualToString;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;

  isEqualToString = objc_msgSend_isEqualToString_(a7, a2, *MEMORY[0x1E0CC7718], (uint64_t)a4);
  v19 = (void *)objc_msgSend_propertyNamed_(a3, v17, (uint64_t)a8, v18);
  if (!v19)
    return 0;
  v23 = v19;
  if (!objc_msgSend_textureSamplerValue(v19, v20, v21, v22))
    return 0;
  v27 = (void *)objc_msgSend_textureSamplerValue(v23, v24, v25, v26);
  if (!objc_msgSend_texture(v27, v28, v29, v30))
    return 0;
  if (a6)
  {
    v34 = (*((uint64_t (**)(id, id))a6 + 2))(a6, a5);
  }
  else
  {
    v38 = (void *)MEMORY[0x1E0CB3940];
    v39 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v31, v32, v33);
    v43 = objc_msgSend_UUIDString(v39, v40, v41, v42);
    v34 = objc_msgSend_stringWithFormat_(v38, v44, (uint64_t)CFSTR("/tmp/ModelKit_AO_%@.png"), v45, v43);
  }
  v46 = v34;
  if (objc_msgSend_isEqualToString_(a9, v35, (uint64_t)&stru_1E63FD500, v36))
  {
    v50 = (void *)objc_msgSend_textureSamplerValue(v23, v47, v48, v49);
    v54 = (void *)objc_msgSend_texture(v50, v51, v52, v53);
    v57 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v55, v46, v56);
    objc_msgSend_writeToURL_(v54, v58, v57, v59);
    objc_msgSend_setString_(a9, v60, v46, v61);
  }
  else
  {
    v46 = (uint64_t)a9;
  }
  v62 = (void *)objc_msgSend_modelSourcesForSemantic_(a4, v47, (uint64_t)CFSTR("kGeometrySourceSemanticTexcoord"), v49);
  v66 = objc_msgSend_count(v62, v63, v64, v65);
  v70 = v66;
  if (v66 < 1)
  {
    LODWORD(v71) = 0;
  }
  else
  {
    v71 = 0;
    v72 = v66;
    while (1)
    {
      v73 = (void *)objc_msgSend_objectAtIndexedSubscript_(v62, v67, v71, v69);
      v77 = (void *)objc_msgSend_mkSemantic(v73, v74, v75, v76);
      if ((objc_msgSend_isEqualToString_(v77, v78, (uint64_t)a7, v79) & 1) != 0)
        break;
      if (v72 == ++v71)
      {
        LODWORD(v71) = v70;
        break;
      }
    }
  }
  if (isEqualToString)
  {
    v80 = (void *)objc_msgSend_ambientOcclusion(self, v67, v68, v69);
    objc_msgSend_setMappingChannel_(v80, v81, v71, v82);
    v86 = (void *)objc_msgSend_ambientOcclusion(self, v83, v84, v85);
  }
  else
  {
    v89 = (void *)objc_msgSend_selfIllumination(self, v67, v68, v69);
    objc_msgSend_setMappingChannel_(v89, v90, v71, v91);
    v86 = (void *)objc_msgSend_selfIllumination(self, v92, v93, v94);
  }
  objc_msgSend_setContents_(v86, v87, v46, v88);
  return (id)objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v95, v46, v96);
}

+ (id)materialWithMDLMaterial:(id)a3
{
  return (id)objc_msgSend_materialWithMDLMaterial_options_(a1, a2, (uint64_t)a3, 0);
}

+ (id)materialWithMDLMaterial:(id)a3 options:(id)a4
{
  id AssociatedObject;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
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
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  _BOOL8 v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  float v70;
  double v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;

  if (!a3)
    return 0;
  AssociatedObject = objc_getAssociatedObject(a3, CFSTR("VFXMDLAssociatedObject"));
  objc_msgSend_scatteringFunction(a3, v8, v9, v10);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v15 = AssociatedObject;
  if (!AssociatedObject)
  {
    v15 = (void *)objc_msgSend_material(a1, v11, v12, v13);
    v19 = objc_msgSend_name(a3, v16, v17, v18);
    objc_msgSend_setName_(v15, v20, v19, v21);
    objc_setAssociatedObject(a3, CFSTR("VFXMDLAssociatedObject"), v15, (void *)0x301);
    objc_setAssociatedObject(v15, CFSTR("VFXMDLAssociatedObject"), a3, 0);
  }
  objc_msgSend_setShadingModel_(v15, v11, (isKindOfClass & 1) == 0, v13);
  v25 = (void *)objc_msgSend_emission(v15, v22, v23, v24);
  sub_1B183B1B8(v25, a3, 13, AssociatedObject == 0, (uint64_t)a4);
  v29 = (void *)objc_msgSend_diffuse(v15, v26, v27, v28);
  sub_1B183B1B8(v29, a3, 0, AssociatedObject == 0, (uint64_t)a4);
  v33 = (void *)objc_msgSend_specular(v15, v30, v31, v32);
  sub_1B183B1B8(v33, a3, 3, AssociatedObject == 0, (uint64_t)a4);
  v37 = (void *)objc_msgSend_reflective(v15, v34, v35, v36);
  sub_1B183B1B8(v37, a3, 32769, AssociatedObject == 0, (uint64_t)a4);
  v41 = (void *)objc_msgSend_transparent(v15, v38, v39, v40);
  sub_1B183B1B8(v41, a3, 15, AssociatedObject == 0, (uint64_t)a4);
  v45 = (void *)objc_msgSend_displacement(v15, v42, v43, v44);
  sub_1B183B1B8(v45, a3, 20, AssociatedObject == 0, (uint64_t)a4);
  v49 = (void *)objc_msgSend_normal(v15, v46, v47, v48);
  sub_1B183B1B8(v49, a3, 19, AssociatedObject == 0, (uint64_t)a4);
  v53 = (void *)objc_msgSend_ambientOcclusion(v15, v50, v51, v52);
  sub_1B183B1B8(v53, a3, 22, AssociatedObject == 0, (uint64_t)a4);
  if (objc_msgSend_materialFace(a3, v54, v55, v56) == 2)
    objc_msgSend_setDoubleSided_(v15, v57, 1, v59);
  if ((isKindOfClass & 1) != 0)
  {
    v60 = AssociatedObject == 0;
    v61 = (void *)objc_msgSend_metalness(v15, v57, v58, v59);
    sub_1B183B1B8(v61, a3, 2, v60, (uint64_t)a4);
    v65 = (void *)objc_msgSend_roughness(v15, v62, v63, v64);
    sub_1B183B1B8(v65, a3, 6, v60, (uint64_t)a4);
  }
  else
  {
    v66 = (void *)objc_msgSend_propertyWithSemantic_(a3, v57, 6, v59);
    objc_msgSend_floatValue(v66, v67, v68, v69);
    *(float *)&v71 = (float)(2.0 / (float)(v70 * v70)) + -2.0;
    objc_msgSend_setShininess_(v15, v72, v73, v74, v71);
  }
  return v15;
}

- (VFXMaterial)init
{
  VFXMaterial *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VFXMaterial;
  v2 = -[VFXMaterial init](&v15, sel_init);
  if (v2)
  {
    v3 = sub_1B1877ABC();
    v2->_material = (__CFXMaterial *)v3;
    if (v3)
      sub_1B193E768(v3, v2, v5, v6, v7, v8, v9, v10);
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6);
    objc_msgSend_makeUniqueID(v2, v11, v12, v13);
  }
  return v2;
}

- (VFXMaterial)initWithMaterialRef:(__CFXMaterial *)a3
{
  VFXMaterial *v4;
  __CFXMaterial *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)VFXMaterial;
  v4 = -[VFXMaterial init](&v20, sel_init);
  if (v4)
  {
    v5 = (__CFXMaterial *)CFRetain(a3);
    v4->_material = v5;
    if (v5)
      sub_1B193E768((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
    objc_msgSend_makeUniqueID(v4, v16, v17, v18);
  }
  return v4;
}

- (id)initPresentationMaterialWithMaterialRef:(__CFXMaterial *)a3
{
  VFXMaterial *v4;
  VFXMaterial *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXMaterial;
  v4 = -[VFXMaterial init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_isPresentationObject = 1;
    v4->_material = (__CFXMaterial *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
    v5->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (id)materialWithMaterialRef:(__CFXMaterial *)a3
{
  id result;
  id v6;
  const char *v7;
  uint64_t v8;

  result = sub_1B193E758((id *)a3);
  if (!result)
  {
    v6 = objc_alloc((Class)a1);
    return (id)objc_msgSend_initWithMaterialRef_(v6, v7, (uint64_t)a3, v8);
  }
  return result;
}

+ (id)material
{
  return objc_alloc_init((Class)a1);
}

+ (id)materialWithColor:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend_setColor_(v4, v5, (uint64_t)a3, v6);
  return v4;
}

+ (id)materialWithContents:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend_setContents_(v4, v5, (uint64_t)a3, v6);
  return v4;
}

+ (id)nullMaterial
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_nullMaterial(_VFXNullMaterial, a2, v2, v3);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFXMaterial *material;
  objc_super v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = (void *)objc_msgSend_properties(self, a2, v2, v3);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v7)
  {
    v11 = v7;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v5);
        objc_msgSend_parentWillDie_(*(void **)(*((_QWORD *)&v24 + 1) + 8 * i), v8, (uint64_t)self, v10);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v11);
  }
  if (!self->_isPresentationObject)
    objc_msgSend_ownerWillDie(self->_shadableHelper, v8, v9, v10);

  material = self->_material;
  if (material)
  {
    if (!self->_isPresentationObject)
    {
      sub_1B193E768((uint64_t)material, 0, v15, v16, v17, v18, v19, v20);
      material = self->_material;
    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1B188A084;
    v23[3] = &unk_1E63D4AB0;
    v23[4] = material;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, 0, 0, v23);
  }

  v22.receiver = self;
  v22.super_class = (Class)VFXMaterial;
  -[VFXMaterial dealloc](&v22, sel_dealloc);
}

- (void)didAttachToWorld:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
  objc_msgSend_wasAddedToWorld_(v5, v6, (uint64_t)self->_world, v7);
}

- (void)didDetachFromWorld:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
  objc_msgSend_willBeRemovedFromWorld_(v5, v6, (uint64_t)self->_world, v7);
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
    v8[2] = sub_1B188A16C;
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
        v15[2] = sub_1B188A224;
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

- (void)setName:(id)a3
{
  uint64_t v3;
  uint64_t name;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[6];

  name = (uint64_t)self->_name;
  if ((unint64_t)a3 | name)
  {
    if ((objc_msgSend_isEqual_(a3, a2, name, v3) & 1) == 0)
    {

      self->_name = (NSString *)objc_msgSend_copy(a3, v7, v8, v9);
      v13 = objc_msgSend_worldRef(self, v10, v11, v12);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_1B188A2F0;
      v15[3] = &unk_1E63D53C8;
      v15[4] = self;
      v15[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
    }
  }
}

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSString *v29;

  if (!self->_isPresentationObject)
    return self->_name;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend___CFObject(self, v6, v7, v8);
  v29 = (NSString *)sub_1B193E568(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = objc_msgSend___CFObject(self, a2, (uint64_t)a3, v3);
  sub_1B193E6E0(v5, a3, v6, v7, v8, v9, v10, v11);
}

- (NSString)identifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend___CFObject(self, a2, v2, v3);
  return (NSString *)sub_1B193E67C(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (void)_syncEntityObjCModel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = objc_msgSend___CFObject(self, a2, v2, v3);

  self->_name = (NSString *)(id)sub_1B193E568(v5, v6, v7, v8, v9, v10, v11, v12);
}

- (void)makeUniqueID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = objc_msgSend___CFObject(self, a2, v2, v3);
  v8 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v5, v6, v7);
  v12 = (const void *)objc_msgSend_UUIDString(v8, v9, v10, v11);
  sub_1B193E6E0(v4, v12, v13, v14, v15, v16, v17, v18);
}

- (void)_syncObjCModel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  float *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  float *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_materialRef(self, v6, v7, v8);
  self->_cullMode = (int)sub_1B1878248(v14, v15, v16, v17, v18, v19, v20, v21);
  self->_writesToDepthBuffer = sub_1B18784E8(v14, v22, v23, v24, v25, v26, v27, v28);
  self->_readsFromDepthBuffer = sub_1B1878604(v14, v29, v30, v31, v32, v33, v34, v35);
  self->_colorBufferWriteMask = sub_1B1878538(v14, v36, v37, v38, v39, v40, v41, v42);
  self->_doubleSided = sub_1B18780F0(v14, v43, v44, v45, v46, v47, v48, v49);
  self->_fillMode = (int)sub_1B1878290(v14, v50, v51, v52, v53, v54, v55, v56);
  self->_blendMode = (int)sub_1B18782D8(v14, v57, v58, v59, v60, v61, v62, v63);
  self->_alphaCutoff = sub_1B1878320(v14, v64, v65, v66, v67, v68, v69, v70);
  v78 = (float *)sub_1B187813C(v14, v71, v72, v73, v74, v75, v76, v77);
  if (v78)
  {
    v86 = v78;
    self->_shininess = sub_1B1841434(v78, 17, v80, v81, v82, v83, v84, v85);
    self->_indexOfRefraction = sub_1B1841434(v86, 18, v87, v88, v89, v90, v91, v92);
    self->_fresnelExponent = sub_1B1841434(v86, 19, v93, v94, v95, v96, v97, v98);
    self->_transparencyMode = sub_1B1842568((uint64_t)v86, v99, v100, v101, v102, v103, v104, v105);
    v113 = sub_1B1841314((uint64_t)v86, v106, v107, v108, v109, v110, v111, v112);
    self->_shadingModel = sub_1B188A578(v113, v114, v115, v116, v117, v118, v119, v120);
    self->_litPerPixel = sub_1B1842520((uint64_t)v86, v121, v122, v123, v124, v125, v126, v127);
    self->_avoidsOverLighting = sub_1B184245C((uint64_t)v86, v128, v129, v130, v131, v132, v133, v134);
    self->_selfIlluminationOcclusion = sub_1B1842628((uint64_t)v86);
  }
  objc_msgSend__syncEntityObjCModel(self, v79, v80, v81);
  if (v13)
    sub_1B18797B4(v13, v135, v136, v137, v138, v139, v140, v141);
}

- (id)presentationMaterial
{
  VFXMaterial *v2;
  VFXMaterial *v3;
  const char *v4;
  uint64_t v5;
  id *v6;

  v2 = self;
  if (!self->_isPresentationObject)
  {
    v3 = [VFXMaterial alloc];
    v6 = (id *)(id)objc_msgSend_initPresentationMaterialWithMaterialRef_(v3, v4, (uint64_t)v2->_material, v5);

    v6[32] = v2->_shadableHelper;
    return v6;
  }
  return v2;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (__CFXMaterial)materialRef
{
  return self->_material;
}

- (__CFXCommonProfile)commonProfile
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend_materialRef(self, a2, v2, v3);
  return (__CFXCommonProfile *)sub_1B187813C(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (Class)_materialPropertyClass
{
  return (Class)objc_opt_class();
}

- (void)_setupMaterialProperty:(id *)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int isColorManaged;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  if (a3)
  {
    v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
    v15 = objc_msgSend_commonProfile(self, v7, v8, v9, 0, 0);
    if (v15)
    {
      if (&self->_diffuse == (VFXMaterialProperty **)a3)
        v22 = 1;
      else
        v22 = 20;
      if (&self->_specular == (VFXMaterialProperty **)a3)
        v22 = 2;
      if (&self->_emission == (VFXMaterialProperty **)a3)
        v22 = 0;
      if (&self->_reflective == (VFXMaterialProperty **)a3)
        v22 = 3;
      if (&self->_transparent == (VFXMaterialProperty **)a3)
        v22 = 4;
      if (&self->_multiply == (VFXMaterialProperty **)a3)
        v22 = 5;
      if (&self->_normal == (VFXMaterialProperty **)a3)
        v22 = 6;
      if (&self->_selfIllumination == (VFXMaterialProperty **)a3)
        v22 = 8;
      if (&self->_ambientOcclusion == (VFXMaterialProperty **)a3)
        v22 = 7;
      if (&self->_metalness == (VFXMaterialProperty **)a3)
        v22 = 9;
      if (&self->_roughness == (VFXMaterialProperty **)a3)
        v22 = 10;
      if (&self->_displacement == (VFXMaterialProperty **)a3)
        v22 = 16;
      if (&self->_clearCoat == (VFXMaterialProperty **)a3)
        v22 = 11;
      if (&self->_clearCoatRoughness == (VFXMaterialProperty **)a3)
        v22 = 12;
      if (&self->_clearCoatNormal == (VFXMaterialProperty **)a3)
        v22 = 13;
      if (&self->_subsurface == (VFXMaterialProperty **)a3)
        v22 = 14;
      if (&self->_subsurfaceRadius == (VFXMaterialProperty **)a3)
        v22 = 15;
      v23 = v22;
      if (v22 == 20)
      {
        v24 = 0;
      }
      else
      {
        v32 = v15;
        v33 = (uint64_t *)sub_1B1841890(v15, v22, v16, v17, v18, v19, v20, v21);
        v24 = sub_1B1841C14(v32, v23, v34, v35, v36, v37, v38, v39);
        if (v33)
          goto LABEL_46;
      }
      v33 = &v60;
      sub_1B179CD74((float *)&v60, 0.5, 0.5, 0.5, 1.0);
LABEL_46:
      v43 = objc_alloc((Class)objc_msgSend__materialPropertyClass(self, v40, v41, v42));
      v45 = (void *)objc_msgSend_initWithParent_propertyType_(v43, v44, (uint64_t)self, v23);
      *a3 = v45;
      v46 = (void *)MEMORY[0x1E0DC3658];
      isColorManaged = objc_msgSend_isColorManaged(v45, v47, v48, v49);
      v52 = objc_msgSend_vfx_colorWithCFXColor_ignoringColorSpace_(v46, v51, (uint64_t)v33, isColorManaged ^ 1u);
      objc_msgSend__setColor_(v45, v53, v52, v54);
      objc_msgSend__setCFXImageRef_(*a3, v55, v24, v56);
      objc_msgSend__setupContentsFromCFXImage(*a3, v57, v58, v59);
      if (!v14)
        return;
      goto LABEL_47;
    }
    sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: _setupMaterialProperty -- should not reach"), v16, v17, v18, v19, v20, v21, v60);
    if (v14)
LABEL_47:
      sub_1B18797B4(v14, v25, v26, v27, v28, v29, v30, v31);
  }
}

- (void)setColor:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_diffuse(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setColor_(v5, v6, (uint64_t)a3, v7);
}

- (id)color
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_diffuse(self, a2, v2, v3);
  return (id)objc_msgSend_color(v4, v5, v6, v7);
}

- (id)builtinProperties
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v9 = (void *)objc_msgSend_initWithCapacity_(v3, v4, 18, v5);
  if (self->_diffuse)
  {
    v10 = objc_msgSend_diffuse(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v11, v10, v12);
  }
  if (self->_specular)
  {
    v13 = objc_msgSend_specular(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v14, v13, v15);
  }
  if (self->_emission)
  {
    v16 = objc_msgSend_emission(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v17, v16, v18);
  }
  if (self->_transparent)
  {
    v19 = objc_msgSend_transparent(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v20, v19, v21);
  }
  if (self->_reflective)
  {
    v22 = objc_msgSend_reflective(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v23, v22, v24);
  }
  if (self->_multiply)
  {
    v25 = objc_msgSend_multiply(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v26, v25, v27);
  }
  if (self->_normal)
  {
    v28 = objc_msgSend_normal(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v29, v28, v30);
  }
  if (self->_ambientOcclusion)
  {
    v31 = objc_msgSend_ambientOcclusion(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v32, v31, v33);
  }
  if (self->_selfIllumination)
  {
    v34 = objc_msgSend_selfIllumination(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v35, v34, v36);
  }
  if (self->_metalness)
  {
    v37 = objc_msgSend_metalness(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v38, v37, v39);
  }
  if (self->_roughness)
  {
    v40 = objc_msgSend_roughness(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v41, v40, v42);
  }
  if (self->_displacement)
  {
    v43 = objc_msgSend_displacement(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v44, v43, v45);
  }
  if (self->_clearCoat)
  {
    v46 = objc_msgSend_clearCoat(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v47, v46, v48);
  }
  if (self->_clearCoatRoughness)
  {
    v49 = objc_msgSend_clearCoatRoughness(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v50, v49, v51);
  }
  if (self->_clearCoatNormal)
  {
    v52 = objc_msgSend_clearCoatNormal(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v53, v52, v54);
  }
  if (self->_subsurface)
  {
    v55 = objc_msgSend_subsurface(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v56, v55, v57);
  }
  if (self->_subsurfaceRadius)
  {
    v58 = objc_msgSend_subsurfaceRadius(self, v6, v7, v8);
    objc_msgSend_addObject_(v9, v59, v58, v60);
  }
  return v9;
}

- (id)propertyWithName:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v6 = (void *)objc_msgSend_customMaterialProperties(self, a2, (uint64_t)a3, v3, 0);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v72, (uint64_t)v76, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v73;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v73 != v13)
        objc_enumerationMutation(v6);
      v15 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v14);
      v16 = (void *)objc_msgSend_propertyName(v15, v9, v10, v11);
      if ((objc_msgSend_isEqualToString_(v16, v17, (uint64_t)a3, v18) & 1) != 0)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v72, (uint64_t)v76, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if (objc_msgSend_isEqualToString_(a3, v9, (uint64_t)CFSTR("diffuse"), v11))
      return (id)objc_msgSend_diffuse(self, v19, v20, v21);
    if (objc_msgSend_isEqualToString_(a3, v19, (uint64_t)CFSTR("specular"), v21))
      return (id)objc_msgSend_specular(self, v23, v24, v25);
    if (objc_msgSend_isEqualToString_(a3, v23, (uint64_t)CFSTR("emission"), v25))
      return (id)objc_msgSend_emission(self, v26, v27, v28);
    if (objc_msgSend_isEqualToString_(a3, v26, (uint64_t)CFSTR("transparent"), v28))
      return (id)objc_msgSend_transparent(self, v29, v30, v31);
    if (objc_msgSend_isEqualToString_(a3, v29, (uint64_t)CFSTR("reflective"), v31))
      return (id)objc_msgSend_reflective(self, v32, v33, v34);
    if (objc_msgSend_isEqualToString_(a3, v32, (uint64_t)CFSTR("multiply"), v34))
      return (id)objc_msgSend_multiply(self, v35, v36, v37);
    if (objc_msgSend_isEqualToString_(a3, v35, (uint64_t)CFSTR("normal"), v37))
      return (id)objc_msgSend_normal(self, v38, v39, v40);
    if (objc_msgSend_isEqualToString_(a3, v38, (uint64_t)CFSTR("ambientOcclusion"), v40))
      return (id)objc_msgSend_ambientOcclusion(self, v41, v42, v43);
    if (objc_msgSend_isEqualToString_(a3, v41, (uint64_t)CFSTR("selfIllumination"), v43))
      return (id)objc_msgSend_selfIllumination(self, v44, v45, v46);
    if (objc_msgSend_isEqualToString_(a3, v44, (uint64_t)CFSTR("metalness"), v46))
      return (id)objc_msgSend_metalness(self, v47, v48, v49);
    if (objc_msgSend_isEqualToString_(a3, v47, (uint64_t)CFSTR("roughness"), v49))
      return (id)objc_msgSend_roughness(self, v50, v51, v52);
    if (objc_msgSend_isEqualToString_(a3, v50, (uint64_t)CFSTR("displacement"), v52))
      return (id)objc_msgSend_displacement(self, v53, v54, v55);
    if (objc_msgSend_isEqualToString_(a3, v53, (uint64_t)CFSTR("clearCoat"), v55))
      return (id)objc_msgSend_clearCoat(self, v56, v57, v58);
    if (objc_msgSend_isEqualToString_(a3, v56, (uint64_t)CFSTR("clearCoatRoughness"), v58))
      return (id)objc_msgSend_clearCoatRoughness(self, v59, v60, v61);
    if (objc_msgSend_isEqualToString_(a3, v59, (uint64_t)CFSTR("clearCoatNormal"), v61))
      return (id)objc_msgSend_clearCoatNormal(self, v62, v63, v64);
    if (objc_msgSend_isEqualToString_(a3, v62, (uint64_t)CFSTR("subsurface"), v64))
      return (id)objc_msgSend_subsurface(self, v65, v66, v67);
    if (!objc_msgSend_isEqualToString_(a3, v65, (uint64_t)CFSTR("subsurfaceRadius"), v67))
      return 0;
    return (id)objc_msgSend_subsurfaceRadius(self, v68, v69, v70);
  }
  return v15;
}

- (id)properties
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
  const char *v13;
  uint64_t v14;

  v5 = (void *)objc_msgSend_builtinProperties(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_customMaterialProperties(self, v6, v7, v8);
  if (objc_msgSend_count(v9, v10, v11, v12))
    return (id)objc_msgSend_arrayByAddingObjectsFromArray_(v5, v13, (uint64_t)v9, v14);
  else
    return v5;
}

- (id)_property:(id *)a3
{
  uint64_t v3;
  id result;

  if (!*a3)
    objc_msgSend__setupMaterialProperty_(self, a2, (uint64_t)a3, v3);
  result = *a3;
  if (self->_isPresentationObject)
    return (id)MEMORY[0x1E0DE7D20](result, sel_presentationMaterialProperty, a3, v3);
  return result;
}

- (VFXMaterialProperty)diffuse
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_diffuse);
}

- (VFXMaterialProperty)specular
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_specular);
}

- (VFXMaterialProperty)emission
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_emission);
}

- (VFXMaterialProperty)reflective
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_reflective);
}

- (VFXMaterialProperty)transparent
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_transparent);
}

- (VFXMaterialProperty)multiply
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_multiply);
}

- (VFXMaterialProperty)normal
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_normal);
}

- (VFXMaterialProperty)ambientOcclusion
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_ambientOcclusion);
}

- (VFXMaterialProperty)selfIllumination
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_selfIllumination);
}

- (VFXMaterialProperty)metalness
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_metalness);
}

- (VFXMaterialProperty)roughness
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_roughness);
}

- (VFXMaterialProperty)displacement
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_displacement);
}

- (VFXMaterialProperty)clearCoat
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_clearCoat);
}

- (VFXMaterialProperty)clearCoatRoughness
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_clearCoatRoughness);
}

- (VFXMaterialProperty)clearCoatNormal
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_clearCoatNormal);
}

- (VFXMaterialProperty)subsurface
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_subsurface);
}

- (VFXMaterialProperty)subsurfaceRadius
{
  return (VFXMaterialProperty *)((uint64_t (*)(VFXMaterial *, char *, VFXMaterialProperty **))MEMORY[0x1E0DE7D20])(self, sel__property_, &self->_subsurfaceRadius);
}

- (void)setTransparencyMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_transparencyMode != a3)
  {
    self->_transparencyMode = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B188AFB4;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)transparencyMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;

  if (!self->_isPresentationObject)
    return self->_transparencyMode;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    v22 = sub_1B1842568(v14, v15, v16, v17, v18, v19, v20, v21);
    if (!v13)
      return v22;
    goto LABEL_9;
  }
  v22 = 0;
  if (v13)
LABEL_9:
    sub_1B18797B4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setShininess:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_shininess != a3)
  {
    self->_shininess = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B188B0F0;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("shininess"), v9);
  }
}

- (float)shininess
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;

  if (!self->_isPresentationObject)
    return self->_shininess;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = (float *)objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    v22 = sub_1B1841434(v14, 17, v16, v17, v18, v19, v20, v21);
    if (!v13)
      return v22;
    goto LABEL_9;
  }
  v22 = 0.0;
  if (v13)
LABEL_9:
    sub_1B18797B4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setIndexOfRefraction:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_indexOfRefraction != a3)
  {
    self->_indexOfRefraction = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B188B240;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("indexOfRefraction"), v9);
  }
}

- (float)indexOfRefraction
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;

  if (!self->_isPresentationObject)
    return self->_indexOfRefraction;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = (float *)objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    v22 = sub_1B1841434(v14, 18, v16, v17, v18, v19, v20, v21);
    if (!v13)
      return v22;
    goto LABEL_9;
  }
  v22 = 0.0;
  if (v13)
LABEL_9:
    sub_1B18797B4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setFresnelExponent:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_fresnelExponent != a3)
  {
    self->_fresnelExponent = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B188B390;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("fresnelExponent"), v9);
  }
}

- (float)fresnelExponent
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;

  if (!self->_isPresentationObject)
    return self->_fresnelExponent;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = (float *)objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    v22 = sub_1B1841434(v14, 19, v16, v17, v18, v19, v20, v21);
    if (!v13)
      return v22;
    goto LABEL_9;
  }
  v22 = 0.0;
  if (v13)
LABEL_9:
    sub_1B18797B4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setSelfIlluminationOcclusion:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_selfIlluminationOcclusion != a3)
  {
    self->_selfIlluminationOcclusion = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B188B4E0;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("selfIlluminationOcclusion"), v9);
  }
}

- (float)selfIlluminationOcclusion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;

  if (!self->_isPresentationObject)
    return self->_selfIlluminationOcclusion;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    v22 = sub_1B1842628(v14);
    if (!v13)
      return v22;
    goto LABEL_9;
  }
  v22 = 0.0;
  if (v13)
LABEL_9:
    sub_1B18797B4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setBlendMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_blendMode != a3)
  {
    self->_blendMode = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B188B618;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)blendMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;

  if (!self->_isPresentationObject)
    return self->_blendMode;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_materialRef(self, v6, v7, v8);
  v29 = (int)sub_1B18782D8(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (float)alphaCutoff
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float v29;

  if (!self->_isPresentationObject)
    return self->_alphaCutoff;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_materialRef(self, v6, v7, v8);
  v29 = sub_1B1878320(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setAlphaCutoff:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_isPresentationObject || self->_alphaCutoff != a3)
  {
    self->_alphaCutoff = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B188B7BC;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("alphaCutoff"), v9);
  }
}

- (void)setShadingModel:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_shadingModel != a3)
  {
    self->_shadingModel = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B188B874;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (unint64_t)shadingModel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  if (!self->_isPresentationObject)
    return self->_shadingModel;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_commonProfile(self, v6, v7, v8);
  v22 = sub_1B1841314(v14, v15, v16, v17, v18, v19, v20, v21);
  v37 = sub_1B188A578(v22, v23, v24, v25, v26, v27, v28, v29);
  if (v13)
    sub_1B18797B4(v13, v30, v31, v32, v33, v34, v35, v36);
  return v37;
}

- (void)setLitPerPixel:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_litPerPixel != a3)
  {
    self->_litPerPixel = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B188B9DC;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("litPerPixel"), v8);
  }
}

- (BOOL)isLitPerPixel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  if (!self->_isPresentationObject)
    return self->_litPerPixel;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    v22 = sub_1B1842520(v14, v15, v16, v17, v18, v19, v20, v21);
    if (!v13)
      return v22;
    goto LABEL_9;
  }
  v22 = 0;
  if (v13)
LABEL_9:
    sub_1B18797B4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setAvoidsOverLighting:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_avoidsOverLighting != a3)
  {
    self->_avoidsOverLighting = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B188BB1C;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)avoidsOverLighting
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  if (!self->_isPresentationObject)
    return self->_avoidsOverLighting;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_commonProfile(self, v6, v7, v8);
  if (v14)
  {
    v22 = sub_1B184245C(v14, v15, v16, v17, v18, v19, v20, v21);
    if (!v13)
      return v22;
    goto LABEL_9;
  }
  v22 = 0;
  if (v13)
LABEL_9:
    sub_1B18797B4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v22;
}

- (void)setWritesToDepthBuffer:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_writesToDepthBuffer != a3)
  {
    self->_writesToDepthBuffer = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B188BC58;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)writesToDepthBuffer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (!self->_isPresentationObject)
    return self->_writesToDepthBuffer;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5)
    return sub_1B18784E8((uint64_t)self->_material, v6, v7, v8, v9, v10, v11, v12);
  v13 = v5;
  sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v21 = sub_1B18784E8((uint64_t)self->_material, v14, v15, v16, v17, v18, v19, v20);
  sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

- (void)setColorBufferWriteMask:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_colorBufferWriteMask != a3)
  {
    self->_colorBufferWriteMask = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B188BD78;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)colorBufferWriteMask
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (!self->_isPresentationObject)
    return self->_colorBufferWriteMask;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5)
    return sub_1B1878538((uint64_t)self->_material, v6, v7, v8, v9, v10, v11, v12);
  v13 = v5;
  sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v21 = sub_1B1878538((uint64_t)self->_material, v14, v15, v16, v17, v18, v19, v20);
  sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

- (void)setReadsFromDepthBuffer:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_readsFromDepthBuffer != a3)
  {
    self->_readsFromDepthBuffer = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B188BE9C;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)readsFromDepthBuffer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (!self->_isPresentationObject)
    return self->_readsFromDepthBuffer;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5)
    return sub_1B1878604((uint64_t)self->_material, v6, v7, v8, v9, v10, v11, v12);
  v13 = v5;
  sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v21 = sub_1B1878604((uint64_t)self->_material, v14, v15, v16, v17, v18, v19, v20);
  sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

- (id)contents
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  if (!self->_diffuse)
  {
    objc_msgSend__setupMaterialProperty_(self, v6, (uint64_t)&self->_diffuse, v8);
    if (!v13)
      return (id)objc_msgSend_contents(self->_diffuse, v6, v7, v8);
    goto LABEL_5;
  }
  if (v13)
LABEL_5:
    sub_1B18797B4(v13, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  return (id)objc_msgSend_contents(self->_diffuse, v6, v7, v8);
}

- (void)setContents:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_diffuse(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setContents_(v5, v6, (uint64_t)a3, v7);
}

- (void)setDoubleSided:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_doubleSided != a3)
  {
    self->_doubleSided = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B188C060;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("doubleSided"), v8);
  }
}

- (BOOL)isDoubleSided
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (!self->_isPresentationObject)
    return self->_doubleSided;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5)
    return sub_1B18780F0((uint64_t)self->_material, v6, v7, v8, v9, v10, v11, v12);
  v13 = v5;
  sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v21 = sub_1B18780F0((uint64_t)self->_material, v14, v15, v16, v17, v18, v19, v20);
  sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

- (void)setCullMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_cullMode != a3)
  {
    self->_cullMode = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B188C190;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("cullMode"), v8);
  }
}

- (int64_t)cullMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (!self->_isPresentationObject)
    return self->_cullMode;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5)
    return (int)sub_1B1878248((uint64_t)self->_material, v6, v7, v8, v9, v10, v11, v12);
  v13 = v5;
  sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v21 = (int)sub_1B1878248((uint64_t)self->_material, v14, v15, v16, v17, v18, v19, v20);
  sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

- (void)setFillMode:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_fillMode != a3)
  {
    self->_fillMode = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B188C2B8;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("fillMode"), v8);
  }
}

- (unint64_t)fillMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (!self->_isPresentationObject)
    return self->_fillMode;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5)
    return (int)sub_1B1878290((uint64_t)self->_material, v6, v7, v8, v9, v10, v11, v12);
  v13 = v5;
  sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v21 = (int)sub_1B1878290((uint64_t)self->_material, v14, v15, v16, v17, v18, v19, v20);
  sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v8 = (void *)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: %p"), v7, v5, self);
  v12 = (void *)objc_msgSend_name(self, v9, v10, v11);
  if (objc_msgSend_length(v12, v13, v14, v15))
  {
    v19 = objc_msgSend_name(self, v16, v17, v18);
    objc_msgSend_appendFormat_(v8, v20, (uint64_t)CFSTR(" '%@'"), v21, v19);
  }
  v22 = (void *)objc_msgSend_properties(self, v16, v17, v18);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v37, (uint64_t)v41, 16);
  if (v24)
  {
    v28 = v24;
    v29 = 0;
    v30 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(v22);
        v32 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if ((objc_msgSend__hasDefaultValues(v32, v25, v26, v27) & 1) == 0)
        {
          v33 = objc_msgSend_propertyName(v32, v25, v26, v27);
          objc_msgSend_appendFormat_(v8, v34, (uint64_t)CFSTR("\n  %@=%@"), v35, v33, v32);
          v29 = 1;
        }
      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v37, (uint64_t)v41, 16);
    }
    while (v28);
    if ((v29 & 1) != 0)
      objc_msgSend_appendString_(v8, v25, (uint64_t)CFSTR("\n"), v27);
  }
  objc_msgSend_appendString_(v8, v25, (uint64_t)CFSTR(">"), v27);
  return (NSString *)v8;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4
{
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_msgSend_materialPropertyName(a4, a2, (uint64_t)a3, (uint64_t)a4);
  v10 = (void *)objc_msgSend_stringWithFormat_(v6, v8, (uint64_t)CFSTR("%@.%@"), v9, CFSTR("commonProfile"), v7);
  if (objc_msgSend_isEqualToString_(a3, v11, (uint64_t)CFSTR("color"), v12)
    || objc_msgSend_isEqualToString_(a3, v13, (uint64_t)CFSTR("contents"), v14)
    || objc_msgSend_isEqualToString_(a3, v13, (uint64_t)CFSTR("content"), v14))
  {
    v15 = (__CFString *)objc_msgSend_stringByAppendingString_(v10, v13, (uint64_t)CFSTR(".color"), v14);
  }
  else
  {
    v15 = (__CFString *)objc_msgSend_stringByAppendingFormat_(v10, v13, (uint64_t)CFSTR(".%@"), v14, a3);
  }
  return sub_1B18C2DEC(self, v15, v16, v17);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  id result;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;

  result = (id)objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4);
  if (result)
  {
    if (self->_shadableHelper)
    {
      os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
      v12 = objc_msgSend_objectForKey_(self->_valuesForUndefinedKeys, v10, (uint64_t)a3, v11);
      os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
      if (!v12)
      {
        v19 = sub_1B18C1F14(a4);
        if ((_DWORD)v19)
        {
          v28 = sub_1B19BA26C(v19, v20, v21, v22, v23, v24, v25, v26, v27);
          v32 = objc_msgSend_worldRef(self, v29, v30, v31);
          if (v32)
          {
            v40 = v32;
            sub_1B187973C(v32, (uint64_t)v33, v34, v35, v36, v37, v38, v39);
            objc_msgSend_begin(VFXTransaction, v41, v42, v43);
            objc_msgSend_setImmediateMode_(VFXTransaction, v44, 1, v45);
            objc_msgSend_setValue_forUndefinedKey_(self, v46, v28, (uint64_t)a3);
            objc_msgSend_commitImmediate(VFXTransaction, v47, v48, v49);
            sub_1B18797B4(v40, v50, v51, v52, v53, v54, v55, v56);
          }
          else
          {
            objc_msgSend_begin(VFXTransaction, v33, v34, v35);
            objc_msgSend_setImmediateMode_(VFXTransaction, v57, 1, v58);
            objc_msgSend_setValue_forUndefinedKey_(self, v59, v28, (uint64_t)a3);
            objc_msgSend_commitImmediate(VFXTransaction, v60, v61, v62);
          }
        }
        else
        {
          sub_1B17C4408(0, (uint64_t)CFSTR("Warning: can't prepare shadable animation with path %@"), v21, v22, v23, v24, v25, v26, (uint64_t)a3);
        }
      }
    }
    result = sub_1B18C2DEC(self, (__CFString *)a3, v8, v9);
    if (!result)
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Material : %@ is not an animatable path"), v13, v14, v15, v16, v17, v18, (uint64_t)a3);
      return 0;
    }
  }
  return result;
}

- (void)__CFObject
{
  return self->_material;
}

- (__CFXAnimationManager)animationManager
{
  uint64_t v2;
  uint64_t v3;
  __CFXAnimationManager *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = (__CFXAnimationManager *)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
    return (__CFXAnimationManager *)sub_1B187A97C((uint64_t)result, v5, v6, v7, v8, v9, v10, v11);
  return result;
}

- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_animationsLock;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  BOOL v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (!a4)
    return 0;
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v10 = (void *)objc_msgSend_objectForKey_(self->_animations, v8, (uint64_t)a4, v9);
  v16 = objc_msgSend_animation(v10, v11, v12, v13) == (_QWORD)a3;
  if (v16)
  {
    objc_msgSend_removeObjectForKey_(self->_animations, v14, (uint64_t)a4, v15);
    v20 = (_QWORD *)objc_msgSend___CFObject(self, v17, v18, v19);
    if ((sub_1B193EBA0(v20) & 1) == 0)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. __removeAnimationForKey: cftype is not an entity"), v21, v22, v23, v24, v25, v26, (uint64_t)"CFTypeIsCFXEntity(cfObject)");
    sub_1B193F164(v20, a4, 1, v22, v23, v24, v25, v26);
  }
  os_unfair_lock_unlock(p_animationsLock);
  return v16;
}

- (void)addAnimationPlayer:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  VFXOrderedDictionary *animations;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  _QWORD v22[7];

  if (a3)
  {
    v9 = (uint64_t)a4;
    if (!a4)
    {
      v11 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, 0);
      v9 = objc_msgSend_UUIDString(v11, v12, v13, v14);
    }
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (!animations)
    {
      animations = objc_alloc_init(VFXOrderedDictionary);
      self->_animations = animations;
    }
    objc_msgSend_setObject_forKey_(animations, v15, (uint64_t)a3, v9);
    os_unfair_lock_unlock(&self->_animationsLock);
    v20 = objc_msgSend_worldRef(self, v17, v18, v19);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1B188C8E8;
    v22[3] = &unk_1E63D5350;
    v22[4] = a3;
    v22[5] = self;
    v22[6] = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v22);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: attempt to add a null animation player on %@"), 0, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  if (a3)
  {
    v9 = (uint64_t)a4;
    v10 = (uint64_t)a3;
    if (!a4)
    {
      v11 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, 0);
      v9 = objc_msgSend_UUIDString(v11, v12, v13, v14);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = objc_msgSend_animationWithCAAnimation_(VFXAnimation, v15, v10, v16);
    v17 = (void *)objc_msgSend_animationPlayerWithVFXAnimation_(VFXAnimationPlayer, v15, v10, v16);
    objc_msgSend_addAnimationPlayer_forKey_(self, v18, (uint64_t)v17, v9);
    objc_msgSend_play(v17, v19, v20, v21);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: attempt to add a null animation on %@"), 0, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)addAnimation:(id)a3
{
  objc_msgSend_addAnimation_forKey_(self, a2, (uint64_t)a3, 0);
}

- (void)removeAllAnimations
{
  os_unfair_lock_s *p_animationsLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[5];

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v4, v5, v6);
  os_unfair_lock_unlock(p_animationsLock);
  v10 = objc_msgSend_worldRef(self, v7, v8, v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1B188CAB8;
  v12[3] = &unk_1E63D5378;
  v12[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
}

- (void)removeAllAnimationsWithBlendOutDuration:(float)a3
{
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[5];
  float v15;

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v6, v7, v8);
  os_unfair_lock_unlock(p_animationsLock);
  v12 = objc_msgSend_worldRef(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1B188CB64;
  v14[3] = &unk_1E63D53A0;
  v14[4] = self;
  v15 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
}

- (void)removeAnimationForKey:(id)a3
{
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[6];

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v6, (uint64_t)a3, v7);
    os_unfair_lock_unlock(p_animationsLock);
    v11 = objc_msgSend_worldRef(self, v8, v9, v10);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1B188CC20;
    v13[3] = &unk_1E63D53C8;
    v13[4] = self;
    v13[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
  }
}

- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4
{
  os_unfair_lock_s *p_animationsLock;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[6];
  float v16;

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v8, (uint64_t)a3, v9);
    os_unfair_lock_unlock(p_animationsLock);
    v13 = objc_msgSend_worldRef(self, v10, v11, v12);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B188CCE4;
    v15[3] = &unk_1E63D53F0;
    v15[4] = self;
    v15[5] = a3;
    v16 = a4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
  }
}

- (NSArray)animationKeys
{
  os_unfair_lock_s *p_animationsLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v7 = (NSArray *)objc_msgSend_allKeys(self->_animations, v4, v5, v6);
  os_unfair_lock_unlock(p_animationsLock);
  if (objc_msgSend_count(v7, v8, v9, v10))
    return v7;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_syncObjCAnimations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFDictionary *v33;
  uint64_t v34;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(VFXOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  v17 = (const void *)objc_msgSend___CFObject(self, v14, v15, v16);
  if (v17)
  {
    v25 = (uint64_t)v17;
    if ((sub_1B193EBA0(v17) & 1) == 0)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. sync animations: cftype is not an entity"), v27, v28, v29, v30, v31, v32, (uint64_t)"CFTypeIsCFXEntity(cfObject)");
    v33 = sub_1B193EF14(v25, v26, v27, v28, v29, v30, v31, v32);
    if (v33)
    {
      v34 = (uint64_t)v33;
      os_unfair_lock_lock(&self->_animationsLock);
      sub_1B18C00E8(v34, (uint64_t)sub_1B18C2084, (uint64_t)self->_animations);
      os_unfair_lock_unlock(&self->_animationsLock);
    }
  }
  if (v13)
    sub_1B18797B4(v13, v18, v19, v20, v21, v22, v23, v24);
}

- (id)_vfxAnimationForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  VFXOrderedDictionary *animations;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
    {
      v9 = (void *)objc_msgSend_objectForKey_(animations, v6, (uint64_t)v3, v7);
      v3 = (id)objc_msgSend_animation(v9, v10, v11, v12);
    }
    else
    {
      v3 = 0;
    }
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_copyAnimationsFrom:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
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
  v6 = (void *)objc_msgSend_animationKeys(a3, a2, (uint64_t)a3, v3, 0);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v6);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v15 = (void *)objc_msgSend_animationPlayerForKey_(a3, v9, v14, v10);
        v19 = (void *)objc_msgSend_copy(v15, v16, v17, v18);
        objc_msgSend_addAnimationPlayer_forKey_(self, v20, (uint64_t)v19, v14);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v11);
  }
}

- (id)animationPlayerForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  VFXOrderedDictionary *animations;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
      v3 = (id)objc_msgSend_objectForKey_(animations, v6, (uint64_t)v3, v7);
    else
      v3 = 0;
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a5;
  v7 = a3;
  v9 = objc_msgSend___CFObject(self, a2, a3, (uint64_t)a4);
  if (v9)
  {
    v13 = (void *)v9;
    v14 = objc_msgSend_animationManager(self, v10, v11, v12);
    if (v14)
    {
      v15 = v14;
      v16 = CACurrentMediaTime();
      sub_1B17F41C0(v15, v13, a4, v7, v5, v17, v18, v19, v16);
    }
  }
}

- (id)_vfxBindings
{
  return self->_bindings;
}

- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  CFXBinding *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  NSMutableDictionary *bindings;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  _QWORD v29[17];

  if (self != a4)
  {
    v29[15] = v6;
    v29[16] = v7;
    v13 = objc_alloc_init(CFXBinding);
    objc_msgSend_setSourceObject_(v13, v14, (uint64_t)a4, v15);
    objc_msgSend_setKeyPathDst_(v13, v16, (uint64_t)a3, v17);
    objc_msgSend_setKeyPathSrc_(v13, v18, (uint64_t)a5, v19);
    objc_msgSend_setOptions_(v13, v20, (uint64_t)a6, v21);
    bindings = self->_bindings;
    if (!bindings)
    {
      bindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_bindings = bindings;
    }
    objc_msgSend_setValue_forKey_(bindings, v22, (uint64_t)v13, (uint64_t)a3);

    v27 = objc_msgSend_worldRef(self, v24, v25, v26);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1B188D1C4;
    v29[3] = &unk_1E63D5418;
    v29[4] = self;
    v29[5] = a4;
    v29[6] = a3;
    v29[7] = a5;
    v29[8] = a6;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v28, v27, (uint64_t)self, v29);
  }
}

- (void)unbindAnimatablePath:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[6];

  objc_msgSend_removeObjectForKey_(self->_bindings, a2, (uint64_t)a3, v3);
  if (!objc_msgSend_count(self->_bindings, v6, v7, v8))
  {

    self->_bindings = 0;
  }
  v12 = objc_msgSend_worldRef(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1B188D2F0;
  v14[3] = &unk_1E63D53C8;
  v14[4] = self;
  v14[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
}

- (void)removeAllBindings
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];

  self->_bindings = 0;
  v6 = objc_msgSend_worldRef(self, v3, v4, v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B188D39C;
  v8[3] = &unk_1E63D5378;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)_setAttributes:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_msgSend_allKeys(a3, a2, (uint64_t)a3, v3, 0);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v6);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v15 = objc_msgSend_valueForKey_(a3, v9, v14, v10);
        objc_msgSend_setValue_forKey_(self, v16, v15, v14);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v11);
  }
}

- (void)_copyAttributes:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
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
  v6 = (void *)objc_msgSend_allKeys(a3, a2, (uint64_t)a3, v3, 0);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v6);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v15 = (void *)objc_msgSend_valueForKey_(a3, v9, v14, v10);
        v19 = (void *)objc_msgSend_copy(v15, v16, v17, v18);
        objc_msgSend_setValue_forKey_(self, v20, (uint64_t)v19, v14);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v11);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t isLitPerPixel;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t isDoubleSided;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t i;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  id v147;
  const char *v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  const char *v163;
  const char *v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v170;
  uint64_t v171;
  _QWORD v172[2];

  v172[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  v13 = objc_msgSend_name(self, v10, v11, v12);
  objc_msgSend_setName_(v4, v14, v13, v15);
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v19 = (void *)objc_msgSend_mutableCopy(self->_valuesForUndefinedKeys, v16, v17, v18);
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
  objc_msgSend__copyAttributes_(v4, v20, (uint64_t)v19, v21);

  objc_msgSend_shininess(self, v22, v23, v24);
  objc_msgSend_setShininess_(v4, v25, v26, v27);
  v31 = objc_msgSend_transparencyMode(self, v28, v29, v30);
  objc_msgSend_setTransparencyMode_(v4, v32, v31, v33);
  v37 = objc_msgSend_shadingModel(self, v34, v35, v36);
  objc_msgSend_setShadingModel_(v4, v38, v37, v39);
  isLitPerPixel = objc_msgSend_isLitPerPixel(self, v40, v41, v42);
  objc_msgSend_setLitPerPixel_(v4, v44, isLitPerPixel, v45);
  isDoubleSided = objc_msgSend_isDoubleSided(self, v46, v47, v48);
  objc_msgSend_setDoubleSided_(v4, v50, isDoubleSided, v51);
  v55 = objc_msgSend_cullMode(self, v52, v53, v54);
  objc_msgSend_setCullMode_(v4, v56, v55, v57);
  v61 = objc_msgSend_program(self, v58, v59, v60);
  objc_msgSend_setProgram_(v4, v62, v61, v63);
  v67 = objc_msgSend_avoidsOverLighting(self, v64, v65, v66);
  objc_msgSend_setAvoidsOverLighting_(v4, v68, v67, v69);
  v73 = objc_msgSend_fillMode(self, v70, v71, v72);
  objc_msgSend_setFillMode_(v4, v74, v73, v75);
  objc_msgSend_fresnelExponent(self, v76, v77, v78);
  objc_msgSend_setFresnelExponent_(v4, v79, v80, v81);
  v85 = objc_msgSend_writesToDepthBuffer(self, v82, v83, v84);
  objc_msgSend_setWritesToDepthBuffer_(v4, v86, v85, v87);
  v91 = objc_msgSend_readsFromDepthBuffer(self, v88, v89, v90);
  objc_msgSend_setReadsFromDepthBuffer_(v4, v92, v91, v93);
  v97 = objc_msgSend_colorBufferWriteMask(self, v94, v95, v96);
  objc_msgSend_setColorBufferWriteMask_(v4, v98, v97, v99);
  v103 = objc_msgSend_blendMode(self, v100, v101, v102);
  objc_msgSend_setBlendMode_(v4, v104, v103, v105);
  objc_msgSend_alphaCutoff(self, v106, v107, v108);
  objc_msgSend_setAlphaCutoff_(v4, v109, v110, v111);
  v115 = (void *)objc_msgSend_properties(self, v112, v113, v114);
  v119 = objc_msgSend_count(v115, v116, v117, v118);
  if (v119)
  {
    v123 = v119;
    for (i = 0; i != v123; ++i)
    {
      v125 = (void *)objc_msgSend_objectAtIndex_(v115, v120, i, v122);
      v129 = objc_msgSend_propertyName(v125, v126, v127, v128);
      v139 = (void *)objc_msgSend_propertyWithName_(v4, v130, v129, v131);
      if (!v139 && (byte_1EEF65EF8 & 1) == 0)
      {
        byte_1EEF65EF8 = 1;
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: missing target material description"), v133, v134, v135, v136, v137, v138, v170);
      }
      objc_msgSend_copyPropertiesFrom_(v139, v132, (uint64_t)v125, v134);
    }
  }
  if (objc_msgSend_behaviorGraph(self, v120, v121, v122))
  {
    v143 = (void *)objc_msgSend_behaviorGraph(self, v140, v141, v142);
    v147 = (id)objc_msgSend_copy(v143, v144, v145, v146);
    objc_msgSend_setBehaviorGraph_(v4, v148, (uint64_t)v147, v149);
    v153 = (void *)objc_msgSend_behaviorGraph(v4, v150, v151, v152);
    v157 = (void *)objc_msgSend_entityObject(v153, v154, v155, v156);
    v171 = objc_msgSend_identifier(self, v158, v159, v160);
    v172[0] = v4;
    v162 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v161, (uint64_t)v172, (uint64_t)&v171, 1);
    objc_msgSend_updateBridgedReferencesWithBridgeable_objectByIdentifier_(v157, v163, (uint64_t)v4, v162);
  }
  objc_msgSend__copyAnimationsFrom_(v4, v140, (uint64_t)self, v142);
  objc_msgSend_copyShaderModifiersAndLanguageVersionFrom_(v4, v164, (uint64_t)self, v165);
  objc_msgSend_commitImmediate(VFXTransaction, v166, v167, v168);
  return v4;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (__CFXMaterial)materialRefCreateIfNeeded
{
  return self->_material;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (id)valueForUndefinedKey:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  void *v33;
  const char *v35;
  uint64_t v36;
  id v37;

  if (self->_isPresentationObject)
  {
    v5 = sub_1B19C1A30(self->_material, (CFStringRef)a3, 0);
    if (v5)
    {
      v13 = v5;
      if (sub_1B19C4614((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12))
      {
        v21 = (double *)sub_1B19C4614((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
        v29 = (const char *)sub_1B19C4770((uint64_t)v13, v22, v23, v24, v25, v26, v27, v28);
        v33 = (void *)sub_1B19BA16C(v21, v29, v32, v30, v31);
        CFRelease(v13);
        return v33;
      }
      CFRelease(v13);
    }
  }
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v37 = (id)objc_msgSend_objectForKey_(self->_valuesForUndefinedKeys, v35, (uint64_t)a3, v36);
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
  return v37;
}

- (void)_shadableSetValue:(id)a3 forUndefinedKey:(id)a4
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  char isKindOfClass;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSMutableDictionary *valuesForUndefinedKeys;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  id v27;
  char v28;
  const char *v29;
  _UNKNOWN **v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[8];
  _QWORD v78[7];
  _QWORD cf[2];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v10 = (id)objc_msgSend_objectForKey_(self->_valuesForUndefinedKeys, v8, (uint64_t)a4, v9);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
    objc_msgSend_willChangeValueForKey_(self, v14, (uint64_t)CFSTR("customMaterialProperties"), v15);
    objc_msgSend_willChangeValueForKey_(self, v16, (uint64_t)CFSTR("customMaterialAttributes"), v17);
    os_unfair_lock_lock(p_valuesForUndefinedKeysLock);
  }
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  if (a3)
  {
    if (!valuesForUndefinedKeys)
    {
      valuesForUndefinedKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_valuesForUndefinedKeys = valuesForUndefinedKeys;
    }
    objc_msgSend_setObject_forKey_(valuesForUndefinedKeys, v11, (uint64_t)a3, (uint64_t)a4);
  }
  else
  {
    objc_msgSend_removeObjectForKey_(valuesForUndefinedKeys, v11, (uint64_t)a4, v12);
  }
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend_didChangeValueForKey_(self, v19, (uint64_t)CFSTR("customMaterialProperties"), v21);
    objc_msgSend_didChangeValueForKey_(self, v22, (uint64_t)CFSTR("customMaterialAttributes"), v23);
  }
  v24 = objc_msgSend___CFObject(self, v19, v20, v21);
  objc_opt_class();
  v27 = a4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_unlinkCustomPropertyWithParent_(v10, v25, (uint64_t)self, v26);
    v27 = 0;
  }

  objc_opt_class();
  v28 = objc_opt_isKindOfClass();
  v30 = &off_1E636B000;
  v31 = MEMORY[0x1E0C809B0];
  if ((v28 & 1) != 0)
  {
    objc_msgSend_linkCustomPropertyWithParent_andCustomName_(a3, v29, (uint64_t)self, (uint64_t)a4);
    v35 = (const void *)objc_msgSend_materialProperty(a3, v32, v33, v34);
    if (v35)
      v39 = (uint64_t)CFRetain(v35);
    else
      v39 = 0;
    v27 = 0;
  }
  else
  {
    v39 = sub_1B19BA44C(self, a4);
    if (!v39)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = (uint64_t)sub_1B19BA12C(a3, v61, v62, v63);
        if (!v39)
          goto LABEL_20;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v39 = 0;
          goto LABEL_20;
        }
        cf[0] = sub_1B18BCF20(a3, 0);
        cf[1] = v64;
        v39 = sub_1B191E290(9, 1, v65, v66, v67, v68, v69, v70);
        sub_1B191E4F4(v39, cf, v71, v72, v73, v74, v75, v76);
        if (!v39)
          goto LABEL_20;
      }
    }
    if (!v10)
    {
      v44 = sub_1B191E464(v39, (uint64_t)v36, v37, v38, v40, v41, v42, v43);
      v52 = sub_1B191E394(v44, v45, v46, v47, v48, v49, v50, v51);
      v56 = objc_msgSend_worldRef(self, v53, v54, v55);
      v78[0] = v31;
      v78[1] = 3221225472;
      v78[2] = sub_1B188DCDC;
      v78[3] = &unk_1E63D7D70;
      v78[4] = a4;
      v78[5] = v24;
      v78[6] = v52;
      v30 = &off_1E636B000;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v57, v56, (uint64_t)self, v78);
    }
  }
LABEL_20:
  v58 = v30[223];
  v59 = objc_msgSend_worldRef(self, v36, v37, v38);
  v77[0] = v31;
  v77[1] = 3221225472;
  v77[2] = sub_1B188DD1C;
  v77[3] = &unk_1E63D7D98;
  v77[6] = v39;
  v77[7] = v24;
  v77[4] = a4;
  v77[5] = a3;
  objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(v58, v60, v59, (uint64_t)self, v27, v77);
}

- (id)customMaterialPropertyNames
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *valuesForUndefinedKeys;
  const char *v13;
  uint64_t v14;
  _QWORD v16[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  v11 = (void *)objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1B188DE14;
  v16[3] = &unk_1E63D54B0;
  v16[4] = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(valuesForUndefinedKeys, v13, (uint64_t)v16, v14);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (id)customMaterialProperties
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  v11 = (void *)objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  v15 = (void *)objc_msgSend_allKeys(self->_valuesForUndefinedKeys, v12, v13, v14);
  v18 = (void *)objc_msgSend_sortedArrayUsingComparator_(v15, v16, (uint64_t)&unk_1E63D0E10, v17);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v20)
  {
    v23 = v20;
    v24 = *(_QWORD *)v29;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v18);
        v26 = objc_msgSend_valueForKey_(self->_valuesForUndefinedKeys, v21, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v25), v22);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_addObject_(v11, v21, v26, v22);
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v28, (uint64_t)v32, 16);
    }
    while (v23);
  }
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (id)customMaterialAttributeNames
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *valuesForUndefinedKeys;
  const char *v13;
  uint64_t v14;
  _QWORD v16[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  v11 = (void *)objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1B188E088;
  v16[3] = &unk_1E63D54B0;
  v16[4] = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(valuesForUndefinedKeys, v13, (uint64_t)v16, v14);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (id)customMaterialAttributes
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *valuesForUndefinedKeys;
  const char *v13;
  uint64_t v14;
  _QWORD v16[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  v11 = (void *)objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1B188E230;
  v16[3] = &unk_1E63D54B0;
  v16[4] = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(valuesForUndefinedKeys, v13, (uint64_t)v16, v14);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (void)_setupShadableHelperIfNeeded
{
  VFXShadableHelper *v3;
  const char *v4;
  uint64_t v5;

  if (!self->_shadableHelper)
  {
    v3 = [VFXShadableHelper alloc];
    self->_shadableHelper = (VFXShadableHelper *)objc_msgSend_initWithOwner_(v3, v4, (uint64_t)self, v5);
  }
}

- (id)__shadableHelper
{
  return self->_shadableHelper;
}

- (VFXProgram)program
{
  uint64_t v2;
  uint64_t v3;

  return (VFXProgram *)objc_msgSend_program(self->_shadableHelper, a2, v2, v3);
}

- (void)setShaderModifiers:(id)a3
{
  uint64_t v3;

  if (a3)
    objc_msgSend__setupShadableHelperIfNeeded(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setShaderModifiers_(self->_shadableHelper, a2, (uint64_t)a3, v3);
}

- (void)copyShaderModifiersAndLanguageVersionFrom:(id)a3
{
  uint64_t v3;
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
  const char *v16;
  uint64_t v17;

  if (objc_msgSend_shaderModifiers(a3, a2, (uint64_t)a3, v3))
    objc_msgSend__setupShadableHelperIfNeeded(self, v6, v7, v8);
  v9 = (void *)objc_msgSend___shadableHelper(a3, v6, v7, v8);
  objc_msgSend_copyModifiersFrom_(self->_shadableHelper, v10, (uint64_t)v9, v11);
  v15 = objc_msgSend_minimumLanguageVersion(v9, v12, v13, v14);
  objc_msgSend_setMinimumLanguageVersion_(self->_shadableHelper, v16, v15, v17);
}

- (NSDictionary)shaderModifiers
{
  uint64_t v2;
  uint64_t v3;

  return (NSDictionary *)objc_msgSend_shaderModifiers(self->_shadableHelper, a2, v2, v3);
}

- (void)setMinimumLanguageVersion:(id)a3
{
  uint64_t v3;

  if (a3)
    objc_msgSend__setupShadableHelperIfNeeded(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setMinimumLanguageVersion_(self->_shadableHelper, a2, (uint64_t)a3, v3);
}

- (NSNumber)minimumLanguageVersion
{
  uint64_t v2;
  uint64_t v3;

  return (NSNumber *)objc_msgSend_minimumLanguageVersion(self->_shadableHelper, a2, v2, v3);
}

- (id)shaderModifiersArguments
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_shaderModifiersArguments(self->_shadableHelper, a2, v2, v3);
}

- (id)shaderModifiersArgumentWithName:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_shaderModifiersArguments(self->_shadableHelper, a2, (uint64_t)a3, v3);
  return (id)objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)a3, v7);
}

- (void)setProgram:(id)a3
{
  uint64_t v3;
  id v5;
  VFXShadableHelper *shadableHelper;

  if (a3)
  {
    v5 = a3;
    objc_msgSend__setupShadableHelperIfNeeded(self, a2, (uint64_t)a3, v3);
    shadableHelper = self->_shadableHelper;
    a3 = v5;
  }
  else
  {
    shadableHelper = self->_shadableHelper;
  }
  objc_msgSend_setProgram_(shadableHelper, a2, (uint64_t)a3, v3);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__shadableSetValue_forUndefinedKey_, a3, a4);
}

- (void)setBehaviorGraph:(id)a3
{
  uint64_t v3;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  _QWORD v22[6];

  v6 = (id)objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
  if (v6 != a3)
  {
    v10 = v6;
    v11 = objc_msgSend_world(self, v7, v8, v9);
    if (v11)
    {
      v14 = v11;
      objc_msgSend_willBeRemovedFromWorld_(v10, v12, v11, v13);

      self->_behaviorGraph = (VFXBehaviorGraph *)a3;
      objc_msgSend_wasAddedToWorld_(a3, v15, v14, v16);
    }
    else
    {

      self->_behaviorGraph = (VFXBehaviorGraph *)a3;
    }
    v20 = objc_msgSend_worldRef(self, v17, v18, v19);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1B188E4E0;
    v22[3] = &unk_1E63D53C8;
    v22[4] = self;
    v22[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v22);
  }
}

- (VFXBehaviorGraph)behaviorGraph
{
  VFXBehaviorGraph *result;

  result = self->_behaviorGraph;
  if (self->_isPresentationObject)
    return (VFXBehaviorGraph *)((uint64_t (*)(VFXBehaviorGraph *, char *))MEMORY[0x1E0DE7D20])(result, sel_presentationBehaviorGraph);
  return result;
}

- (void)_customDecodingOfVFXMaterial:(id)a3
{
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v9 = objc_msgSend_setWithObject_(v5, v7, v6, v8);
  v10 = sub_1B18BE224();
  v12 = (void *)objc_msgSend_vfx_decodeDictionaryWithKeysOfClasses_objectsOfClasses_forKey_(a3, v11, v9, v10, CFSTR("valuesForUndefinedKeys"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = (id)objc_msgSend_mutableCopy(v12, v13, v14, v15);
    objc_msgSend__setAttributes_(self, v17, (uint64_t)v16, v18);
  }
}

- (void)_customEncodingOfVFXMaterial:(id)a3
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  const char *v6;
  NSMutableDictionary *valuesForUndefinedKeys;

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  if (valuesForUndefinedKeys)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)valuesForUndefinedKeys, (uint64_t)CFSTR("valuesForUndefinedKeys"));
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
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
  uint64_t i;
  void *v18;
  uint64_t v19;
  const char *v20;
  NSString *name;
  double v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  unint64_t shadingModel;
  const char *v34;
  VFXShadableHelper *shadableHelper;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  double v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  VFXBehaviorGraph *behaviorGraph;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (self->_isPresentationObject)
    objc_msgSend__syncObjCModel(self, a2, (uint64_t)a3, v3);
  objc_msgSend__customEncodingOfVFXMaterial_(self, a2, (uint64_t)a3, v3);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v9 = (void *)objc_msgSend_builtinProperties(self, v6, v7, v8, 0);
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v51, (uint64_t)v55, 16);
  if (v11)
  {
    v15 = v11;
    v16 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v52 != v16)
          objc_enumerationMutation(v9);
        v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        if ((objc_msgSend__hasDefaultValues(v18, v12, v13, v14) & 1) == 0)
        {
          v19 = objc_msgSend_propertyName(v18, v12, v13, v14);
          objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)v18, v19);
        }
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v51, (uint64_t)v55, 16);
    }
    while (v15);
  }
  name = self->_name;
  objc_opt_class();
  sub_1B18BEC8C(a3, (const char *)name);
  *(float *)&v22 = self->_shininess;
  objc_msgSend_encodeFloat_forKey_(a3, v23, (uint64_t)CFSTR("shininess"), v24, v22);
  if (self->_alphaCutoff != -1.0)
    objc_msgSend_encodeFloat_forKey_(a3, v25, (uint64_t)CFSTR("alphaCutoff"), v26);
  *(float *)&v27 = self->_indexOfRefraction;
  objc_msgSend_encodeFloat_forKey_(a3, v25, (uint64_t)CFSTR("indexOfRefraction"), v26, v27);
  *(float *)&v28 = self->_fresnelExponent;
  objc_msgSend_encodeFloat_forKey_(a3, v29, (uint64_t)CFSTR("fresnelExponent"), v30, v28);
  objc_msgSend_encodeInteger_forKey_(a3, v31, self->_transparencyMode, (uint64_t)CFSTR("transparencyMode"));
  shadingModel = self->_shadingModel;
  if (shadingModel)
    objc_msgSend_encodeInteger_forKey_(a3, v32, shadingModel, (uint64_t)CFSTR("shadingModel"));
  objc_msgSend_encodeInteger_forKey_(a3, v32, self->_cullMode, (uint64_t)CFSTR("cullMode"));
  shadableHelper = self->_shadableHelper;
  if (shadableHelper)
    objc_msgSend_encodeObject_forKey_(a3, v34, (uint64_t)shadableHelper, (uint64_t)CFSTR("shadableHelper"));
  objc_msgSend_encodeBool_forKey_(a3, v34, self->_litPerPixel, (uint64_t)CFSTR("litPerPixel"));
  objc_msgSend_encodeBool_forKey_(a3, v36, self->_doubleSided, (uint64_t)CFSTR("doubleSided"));
  objc_msgSend_encodeBool_forKey_(a3, v37, self->_avoidsOverLighting, (uint64_t)CFSTR("avoidsOverLighting"));
  objc_msgSend_encodeBool_forKey_(a3, v38, self->_writesToDepthBuffer, (uint64_t)CFSTR("writesToDepthBuffer"));
  objc_msgSend_encodeBool_forKey_(a3, v39, self->_readsFromDepthBuffer, (uint64_t)CFSTR("readsFromDepthBuffer"));
  objc_msgSend_encodeInteger_forKey_(a3, v40, self->_colorBufferWriteMask, (uint64_t)CFSTR("colorBufferWriteMask"));
  objc_msgSend_encodeInteger_forKey_(a3, v41, qword_1B2246FA8[self->_fillMode], (uint64_t)CFSTR("fillMode"));
  objc_msgSend_encodeInteger_forKey_(a3, v42, self->_blendMode, (uint64_t)CFSTR("blendMode"));
  *(float *)&v43 = self->_selfIlluminationOcclusion;
  objc_msgSend_encodeFloat_forKey_(a3, v44, (uint64_t)CFSTR("selfIlluminationOcclusion"), v45, v43);
  behaviorGraph = self->_behaviorGraph;
  if (behaviorGraph)
    objc_msgSend_encodeObject_forKey_(a3, v46, (uint64_t)behaviorGraph, (uint64_t)CFSTR("behaviorGraph"));
  sub_1B18BD9B8(a3, self, (uint64_t)behaviorGraph, v47);
  sub_1B18BDCC8(a3, self, v49, v50);
}

- (VFXMaterial)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXMaterial *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
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
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  VFXShadableHelper *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  objc_super v193;

  v193.receiver = self;
  v193.super_class = (Class)VFXMaterial;
  v7 = -[VFXMaterial init](&v193, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v11 = sub_1B1877ABC();
    v7->_material = (__CFXMaterial *)v11;
    if (v11)
      sub_1B193E768(v11, v7, v13, v14, v15, v16, v17, v18);
    objc_msgSend__syncObjCModel(v7, v12, v13, v14);
    v7->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    objc_msgSend__customDecodingOfVFXMaterial_(v7, v19, (uint64_t)a3, v20);
    if (objc_msgSend_containsValueForKey_(a3, v21, (uint64_t)CFSTR("diffuse"), v22))
    {
      v25 = objc_opt_class();
      v7->_diffuse = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v26, v25, (uint64_t)CFSTR("diffuse"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v23, (uint64_t)CFSTR("specular"), v24))
    {
      v29 = objc_opt_class();
      v7->_specular = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v30, v29, (uint64_t)CFSTR("specular"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v27, (uint64_t)CFSTR("emission"), v28))
    {
      v33 = objc_opt_class();
      v7->_emission = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v34, v33, (uint64_t)CFSTR("emission"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v31, (uint64_t)CFSTR("transparent"), v32))
    {
      v37 = objc_opt_class();
      v7->_transparent = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v38, v37, (uint64_t)CFSTR("transparent"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v35, (uint64_t)CFSTR("reflective"), v36))
    {
      v41 = objc_opt_class();
      v7->_reflective = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v42, v41, (uint64_t)CFSTR("reflective"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v39, (uint64_t)CFSTR("multiply"), v40))
    {
      v45 = objc_opt_class();
      v7->_multiply = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v46, v45, (uint64_t)CFSTR("multiply"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v43, (uint64_t)CFSTR("normal"), v44))
    {
      v49 = objc_opt_class();
      v7->_normal = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v50, v49, (uint64_t)CFSTR("normal"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v47, (uint64_t)CFSTR("ambientOcclusion"), v48))
    {
      v53 = objc_opt_class();
      v7->_ambientOcclusion = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v54, v53, (uint64_t)CFSTR("ambientOcclusion"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v51, (uint64_t)CFSTR("selfIllumination"), v52))
    {
      v57 = objc_opt_class();
      v7->_selfIllumination = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v58, v57, (uint64_t)CFSTR("selfIllumination"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v55, (uint64_t)CFSTR("metalness"), v56))
    {
      v61 = objc_opt_class();
      v7->_metalness = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v62, v61, (uint64_t)CFSTR("metalness"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v59, (uint64_t)CFSTR("roughness"), v60))
    {
      v65 = objc_opt_class();
      v7->_roughness = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v66, v65, (uint64_t)CFSTR("roughness"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v63, (uint64_t)CFSTR("displacement"), v64))
    {
      v69 = objc_opt_class();
      v7->_displacement = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v70, v69, (uint64_t)CFSTR("displacement"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v67, (uint64_t)CFSTR("clearCoat"), v68))
    {
      v73 = objc_opt_class();
      v7->_clearCoat = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v74, v73, (uint64_t)CFSTR("clearCoat"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v71, (uint64_t)CFSTR("clearCoatRoughness"), v72))
    {
      v77 = objc_opt_class();
      v7->_clearCoatRoughness = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v78, v77, (uint64_t)CFSTR("clearCoatRoughness"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v75, (uint64_t)CFSTR("clearCoatNormal"), v76))
    {
      v81 = objc_opt_class();
      v7->_clearCoatNormal = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v82, v81, (uint64_t)CFSTR("clearCoatNormal"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v79, (uint64_t)CFSTR("subsurface"), v80))
    {
      v85 = objc_opt_class();
      v7->_subsurface = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v86, v85, (uint64_t)CFSTR("subsurface"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v83, (uint64_t)CFSTR("subsurfaceRadius"), v84))
    {
      v89 = objc_opt_class();
      v7->_subsurfaceRadius = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v90, v89, (uint64_t)CFSTR("subsurfaceRadius"));
    }
    if (objc_msgSend_containsValueForKey_(a3, v87, (uint64_t)CFSTR("alphaCutoff"), v88))
    {
      objc_msgSend_decodeFloatForKey_(a3, v91, (uint64_t)CFSTR("alphaCutoff"), v92);
      objc_msgSend_setAlphaCutoff_(v7, v93, v94, v95);
    }
    v96 = objc_opt_class();
    v98 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v97, v96, (uint64_t)CFSTR("name"));
    objc_msgSend_setName_(v7, v99, v98, v100);
    objc_msgSend_decodeFloatForKey_(a3, v101, (uint64_t)CFSTR("shininess"), v102);
    objc_msgSend_setShininess_(v7, v103, v104, v105);
    objc_msgSend_decodeFloatForKey_(a3, v106, (uint64_t)CFSTR("indexOfRefraction"), v107);
    objc_msgSend_setIndexOfRefraction_(v7, v108, v109, v110);
    objc_msgSend_decodeFloatForKey_(a3, v111, (uint64_t)CFSTR("fresnelExponent"), v112);
    objc_msgSend_setFresnelExponent_(v7, v113, v114, v115);
    v118 = objc_msgSend_decodeIntegerForKey_(a3, v116, (uint64_t)CFSTR("transparencyMode"), v117);
    objc_msgSend_setTransparencyMode_(v7, v119, v118, v120);
    v123 = objc_msgSend_decodeIntegerForKey_(a3, v121, (uint64_t)CFSTR("shadingModel"), v122);
    objc_msgSend_setShadingModel_(v7, v124, v123, v125);
    v128 = objc_msgSend_decodeIntegerForKey_(a3, v126, (uint64_t)CFSTR("cullMode"), v127);
    objc_msgSend_setCullMode_(v7, v129, v128, v130);
    v131 = objc_opt_class();
    v133 = (VFXShadableHelper *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v132, v131, (uint64_t)CFSTR("shadableHelper"));
    v7->_shadableHelper = v133;
    if ((VFXMaterial *)objc_msgSend_owner(v133, v134, v135, v136) != v7)
    {

      v7->_shadableHelper = 0;
    }
    v139 = objc_msgSend_decodeBoolForKey_(a3, v137, (uint64_t)CFSTR("litPerPixel"), v138);
    objc_msgSend_setLitPerPixel_(v7, v140, v139, v141);
    v144 = objc_msgSend_decodeBoolForKey_(a3, v142, (uint64_t)CFSTR("doubleSided"), v143);
    objc_msgSend_setDoubleSided_(v7, v145, v144, v146);
    v149 = objc_msgSend_decodeBoolForKey_(a3, v147, (uint64_t)CFSTR("avoidsOverLighting"), v148);
    objc_msgSend_setAvoidsOverLighting_(v7, v150, v149, v151);
    v154 = objc_msgSend_decodeBoolForKey_(a3, v152, (uint64_t)CFSTR("writesToDepthBuffer"), v153);
    objc_msgSend_setWritesToDepthBuffer_(v7, v155, v154, v156);
    if (objc_msgSend_containsValueForKey_(a3, v157, (uint64_t)CFSTR("colorBufferWriteMask"), v158))
    {
      v161 = objc_msgSend_decodeIntegerForKey_(a3, v159, (uint64_t)CFSTR("colorBufferWriteMask"), v160);
      objc_msgSend_setColorBufferWriteMask_(v7, v162, v161, v163);
    }
    v164 = objc_msgSend_decodeBoolForKey_(a3, v159, (uint64_t)CFSTR("readsFromDepthBuffer"), v160);
    objc_msgSend_setReadsFromDepthBuffer_(v7, v165, v164, v166);
    v169 = objc_msgSend_decodeIntegerForKey_(a3, v167, (uint64_t)CFSTR("fillMode"), v168);
    v172 = 2;
    if (v169 < 2)
      v172 = v169;
    objc_msgSend_setFillMode_(v7, v170, qword_1B2246FB8[v172 & ~(v172 >> 63)], v171);
    v175 = objc_msgSend_decodeIntegerForKey_(a3, v173, (uint64_t)CFSTR("blendMode"), v174);
    objc_msgSend_setBlendMode_(v7, v176, v175, v177);
    objc_msgSend_decodeFloatForKey_(a3, v178, (uint64_t)CFSTR("selfIlluminationOcclusion"), v179);
    objc_msgSend_setSelfIlluminationOcclusion_(v7, v180, v181, v182);
    if (objc_msgSend_containsValueForKey_(a3, v183, (uint64_t)CFSTR("behaviorGraph"), v184))
    {
      v185 = objc_opt_class();
      v187 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v186, v185, (uint64_t)CFSTR("behaviorGraph"));
      objc_msgSend_setBehaviorGraph_(v7, v188, v187, v189);
    }
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    sub_1B18BDA00(a3, v7);
    sub_1B18BDFA4(a3, v7);
    objc_msgSend_setImmediateMode_(VFXTransaction, v190, v8, v191);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugQuickLookObjectWithAssetPathResolver:(id)a3
{
  uint64_t v3;
  double v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  LODWORD(v4) = 1.0;
  v7 = (void *)objc_msgSend_sphereWithRadius_(VFXParametricModel, a2, (uint64_t)a3, v3, v4);
  v11 = (id)objc_msgSend_copy(self, v8, v9, v10);
  objc_msgSend_setFirstMaterial_(v7, v12, (uint64_t)v11, v13);
  return (id)MEMORY[0x1E0DE7D20](v7, sel_debugQuickLookObjectWithAssetPathResolver_, a3, v14);
}

- (id)debugQuickLookObject
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = (void *)objc_msgSend_world(self, a2, v2, v3);
  v9 = objc_msgSend_assetPathResolver(v5, v6, v7, v8);
  return (id)MEMORY[0x1E0DE7D20](self, sel_debugQuickLookObjectWithAssetPathResolver_, v9, v10);
}

- (id)debugQuickLookData
{
  uint64_t v2;
  uint64_t v3;
  UIImage *v4;

  v4 = (UIImage *)objc_msgSend_debugQuickLookObject(self, a2, v2, v3);
  return UIImagePNGRepresentation(v4);
}

- (NSArray)bridgedComponentNames
{
  return (NSArray *)(id)sub_1B2228AAC();
}

@end
