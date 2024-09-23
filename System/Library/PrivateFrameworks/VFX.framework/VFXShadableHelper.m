@implementation VFXShadableHelper

- (void)_commonInit
{
  self->_symbolToBinder = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_symbolToUnbinder = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_arguments = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
}

- (VFXShadableHelper)initWithOwner:(id)a3
{
  VFXShadableHelper *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  VFXShadableHelper *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXShadableHelper;
  v4 = -[VFXShadableHelper init](&v10, sel_init);
  v8 = v4;
  if (v4)
  {
    objc_msgSend__commonInit(v4, v5, v6, v7);
    v8->_owner = a3;
  }
  return v8;
}

- (void)ownerWillDie
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend__stopObservingProgram(self, a2, v2, v3);
  self->_owner = 0;
}

- (NSDictionary)shaderModifiersArguments
{
  return &self->_arguments->super;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  if (self->_owner)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Must call -[VFXShadableHelper ownerWillDie] before releasing it !"), v2, v3, v4, v5, v6, v7, (uint64_t)"_owner == nil");

  v9.receiver = self;
  v9.super_class = (Class)VFXShadableHelper;
  -[VFXShadableHelper dealloc](&v9, sel_dealloc);
}

- (id)owner
{
  return self->_owner;
}

- (void)_startObservingProgram
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;

  if (self->_program)
  {
    v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
    objc_msgSend_addObserver_selector_name_object_(v5, v6, (uint64_t)self, (uint64_t)sel__programDidChange_, CFSTR("VFXProgramDidChangeNotification"), self->_program);
  }
}

- (void)_stopObservingProgram
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;

  if (self->_program)
  {
    v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
    objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, (uint64_t)CFSTR("VFXProgramDidChangeNotification"), self->_program);
  }
}

- (void)setProgram:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[5];
  uint64_t v16;

  if (a3 && objc_msgSend_count(self->_shaderModifiers, a2, (uint64_t)a3, v3))
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Cannot use a program because shader modifiers are set"), (uint64_t)a3, v3, v6, v7, v8, v9, v16);
  }
  else if (self->_program != a3)
  {
    objc_msgSend__stopObservingProgram(self, a2, (uint64_t)a3, v3);

    self->_program = (VFXProgram *)a3;
    v13 = objc_msgSend_worldRef(self->_owner, v10, v11, v12);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B17C34B8;
    v15[3] = &unk_1E63D5378;
    v15[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
  }
}

- (VFXProgram)program
{
  return self->_program;
}

- (BOOL)isOpaque
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_isOpaque(self->_program, a2, v2, v3);
}

- (void)_parseAndSetShaderModifier:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
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
  const char *v46;
  _QWORD v47[5];
  _QWORD v48[6];
  _QWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend_removeAllObjects(self->_arguments, a2, (uint64_t)a3, v3);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v6, (uint64_t)&v50, (uint64_t)v54, 16);
  v15 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v16 = v7;
    v17 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v51 != v17)
          objc_enumerationMutation(a3);
        v19 = (void *)sub_1B19B93BC(*(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i), (uint64_t)v8, v9, v10, v11, v12, v13, v14);
        v49[0] = v15;
        v49[1] = 3221225472;
        v49[2] = sub_1B17C3740;
        v49[3] = &unk_1E63D54B0;
        v49[4] = self;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v19, v20, (uint64_t)v49, v21);
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v8, (uint64_t)&v50, (uint64_t)v54, 16);
    }
    while (v16);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v29 = objc_msgSend___CFObject(self->_owner, v22, v23, v24);
    v33 = objc_msgSend_worldRef(self->_owner, v30, v31, v32);
    v48[0] = v15;
    v48[1] = 3221225472;
    v48[2] = sub_1B17C37B0;
    v48[3] = &unk_1E63D5440;
    v48[4] = a3;
    v48[5] = v29;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v34, v33, (uint64_t)self, v48);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: ShaderModifiers - unkwnown supporting class '%@'"), v23, v24, v25, v26, v27, v28, (uint64_t)self->_owner);
  }
  v38 = objc_msgSend_worldRef(self->_owner, v35, v36, v37);
  if (v38)
  {
    v45 = v38;
    if (sub_1B187B004(v38, 1, v39, v40, v41, v42, v43, v44))
    {
      v47[0] = v15;
      v47[1] = 3221225472;
      v47[2] = sub_1B17C37BC;
      v47[3] = &unk_1E63D4AB0;
      v47[4] = v45;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v46, v45, (uint64_t)self, v47);
    }
  }
}

- (NSDictionary)shaderModifiers
{
  return self->_shaderModifiers;
}

- (void)setShaderModifiers:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *shaderModifiers;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  NSDictionary *v21;
  NSDictionary *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  NSArray *v33;
  uint64_t v34;
  _QWORD v35[5];
  uint64_t v36;

  if (self->_program && objc_msgSend_count(a3, a2, (uint64_t)a3, v3))
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Cannot use shader modifiers because a program is set"), v6, v7, v8, v9, v10, v11, v36);
  }
  else
  {
    shaderModifiers = self->_shaderModifiers;
    if (shaderModifiers != a3)
    {

      if (objc_msgSend_count(a3, v13, v14, v15))
      {
        v19 = objc_alloc(MEMORY[0x1E0C99D80]);
        v21 = (NSDictionary *)objc_msgSend_initWithDictionary_copyItems_(v19, v20, (uint64_t)a3, 1);
      }
      else if (a3)
      {
        v21 = (NSDictionary *)MEMORY[0x1E0C9AA70];
      }
      else
      {
        v21 = 0;
      }
      self->_shaderModifiers = v21;
      objc_msgSend_owner(self, v16, v17, v18);
      v22 = self->_shaderModifiers;
      v23 = (void *)MEMORY[0x1E0C99DE8];
      v27 = objc_msgSend_count(v22, v24, v25, v26);
      v30 = (void *)objc_msgSend_arrayWithCapacity_(v23, v28, v27, v29);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = sub_1B17C41D0;
      v35[3] = &unk_1E63D54B0;
      v35[4] = v30;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v22, v31, (uint64_t)v35, v32);

      v33 = v30;
      self->_cfxShaderModifierCache = v33;
      MEMORY[0x1E0DE7D20](self, sel__parseAndSetShaderModifier_, v33, v34);
    }
  }
}

- (void)copyModifiersFrom:(id)a3
{
  uint64_t v3;
  void *v5;
  NSDictionary *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *shaderModifiers;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  NSDictionary *v23;
  uint64_t v24;
  uint64_t v25;

  v5 = (void *)*((_QWORD *)a3 + 4);
  v6 = (NSDictionary *)objc_msgSend_shaderModifiers(a3, a2, (uint64_t)a3, v3);
  v10 = v6;
  if (v5)
  {
    if (self->_program && objc_msgSend_count(v6, v7, v8, v9))
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Cannot use shader modifiers because a program is set"), v11, v12, v13, v14, v15, v16, v25);
    }
    else
    {
      shaderModifiers = self->_shaderModifiers;
      if (shaderModifiers != v10)
      {

        if (objc_msgSend_count(v10, v18, v19, v20))
        {
          v21 = objc_alloc(MEMORY[0x1E0C99D80]);
          v23 = (NSDictionary *)objc_msgSend_initWithDictionary_copyItems_(v21, v22, (uint64_t)v10, 1);
        }
        else if (v10)
        {
          v23 = (NSDictionary *)MEMORY[0x1E0C9AA70];
        }
        else
        {
          v23 = 0;
        }
        self->_shaderModifiers = v23;

        self->_cfxShaderModifierCache = (NSArray *)v5;
        MEMORY[0x1E0DE7D20](self, sel__parseAndSetShaderModifier_, v5, v24);
      }
    }
  }
  else
  {
    objc_msgSend_setShaderModifiers_(self, v7, (uint64_t)v6, v9);
  }
}

- (void)setMinimumLanguageVersion:(id)a3
{
  NSNumber *minimumLanguageVersion;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  minimumLanguageVersion = self->_minimumLanguageVersion;
  if (minimumLanguageVersion != a3)
  {

    self->_minimumLanguageVersion = (NSNumber *)a3;
    v9 = objc_msgSend_worldRef(self->_owner, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B17C3AC0;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (NSNumber)minimumLanguageVersion
{
  return self->_minimumLanguageVersion;
}

- (void)_programDidChange:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  v6 = objc_msgSend_worldRef(self->_owner, a2, (uint64_t)a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B17C3BE4;
  v8[3] = &unk_1E63D53C8;
  v8[4] = a3;
  v8[5] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (__CFXFXRenderGraph)_renderGraph
{
  uint64_t v2;
  uint64_t v3;
  __CFXFXRenderGraph *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = (__CFXFXRenderGraph *)objc_msgSend_materialRef(self->_owner, a2, v2, v3);
  if (result)
    return (__CFXFXRenderGraph *)sub_1B18786DC((uint64_t)result, v5, v6, v7, v8, v9, v10, v11);
  return result;
}

- (void)_setCFXProgram
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t IfNeeded;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int isOpaque;
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
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const void *v46;
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
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
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
  const void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const void *v81;
  _QWORD *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
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
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _QWORD v117[5];

  IfNeeded = objc_msgSend_materialRefCreateIfNeeded(self->_owner, a2, v2, v3);
  if (!IfNeeded)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v6, v7, v8, v9, v10, v11, (uint64_t)"mat");
  if (self->_program)
  {
    v13 = (_QWORD *)sub_1B18D623C(1uLL);
    sub_1B18788CC(IfNeeded, v13, v14, v15, v16, v17, v18, v19);
    isOpaque = objc_msgSend_isOpaque(self, v20, v21, v22);
    sub_1B18D6F9C((uint64_t)v13, isOpaque, v24, v25, v26, v27, v28, v29);
    CFRelease(v13);
    if (sub_1B18D63A8((uint64_t)v13, v30, v31, v32, v33, v34, v35, v36) < 1)
    {
      v46 = (const void *)sub_1B19ACAD0();
      sub_1B18D62F4(v13, v46, v67, v68, v69, v70, v71, v72, v116);
      CFRelease(v46);
    }
    else
    {
      v46 = (const void *)sub_1B18D6464((uint64_t)v13, 0, v37, v38, v39, v40, v41, v42);
    }
    v73 = (const void *)objc_msgSend_vertexFunctionName(self->_program, v43, v44, v45);
    v77 = (const void *)objc_msgSend_fragmentFunctionName(self->_program, v74, v75, v76);
    v81 = (const void *)objc_msgSend_library(self->_program, v78, v79, v80);
    v82 = sub_1B181E01C(v73, v77, v81);
    v86 = (void *)objc_msgSend__bufferBindings(self->_program, v83, v84, v85);
    v117[0] = MEMORY[0x1E0C809B0];
    v117[1] = 3221225472;
    v117[2] = sub_1B17C3E74;
    v117[3] = &unk_1E63D54D0;
    v117[4] = v82;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v86, v87, (uint64_t)v117, v88);
    sub_1B181E834((uint64_t)v82, 1, v89, v90, v91, v92, v93, v94);
    sub_1B19ACEC0((uint64_t)v46, 2, v95, v96, v97, v98, v99, v100);
    sub_1B19ACDB0((uint64_t)v46, v82, v101, v102, v103, v104, v105, v106);
    CFRelease(v82);
    sub_1B1878850(IfNeeded, v107, v108, v109, v110, v111, v112, v113);
    MEMORY[0x1E0DE7D20](self, sel__setCFXProgramDelegate, v114, v115);
  }
  else
  {
    if (objc_msgSend__renderGraph(self, v5, v6, v7))
      sub_1B18788CC(IfNeeded, 0, v47, v48, v49, v50, v51, v52);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v60 = (_QWORD *)objc_msgSend_geometryRef(self->_owner, v53, v54, v55);
      sub_1B17A2148(v60, 0, v61, v62, v63, v64, v65, v66);
    }
    sub_1B1878850(IfNeeded, (uint64_t)v53, v54, v55, v56, v57, v58, v59);
  }
}

- (void)__CFObject
{
  uint64_t v2;
  uint64_t v3;

  return (void *)objc_msgSend___CFObject(self->_owner, a2, v2, v3);
}

- (void)_customEncodingOfVFXShadableHelper:(id)a3
{
  id owner;

  owner = self->_owner;
  if (owner)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)owner, (uint64_t)CFSTR("owner"));
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  VFXProgram *program;
  NSDictionary *shaderModifiers;
  NSNumber *minimumLanguageVersion;

  objc_msgSend__customEncodingOfVFXShadableHelper_(self, a2, (uint64_t)a3, v3);
  program = self->_program;
  if (program)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)program, (uint64_t)CFSTR("program"));
  shaderModifiers = self->_shaderModifiers;
  if (shaderModifiers)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)shaderModifiers, (uint64_t)CFSTR("shaderModifiers"));
  minimumLanguageVersion = self->_minimumLanguageVersion;
  if (minimumLanguageVersion)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)minimumLanguageVersion, (uint64_t)CFSTR("minimumLanguageVersion"));
}

- (VFXShadableHelper)initWithCoder:(id)a3
{
  VFXShadableHelper *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  VFXShadableHelper *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  objc_super v41;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)VFXShadableHelper;
  v4 = -[VFXShadableHelper init](&v41, sel_init);
  v8 = v4;
  if (v4)
  {
    objc_msgSend__commonInit(v4, v5, v6, v7);
    v12 = objc_msgSend_immediateMode(VFXTransaction, v9, v10, v11);
    objc_msgSend_setImmediateMode_(VFXTransaction, v13, 1, v14);
    v15 = sub_1B18BDC88();
    v17 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v16, v15, (uint64_t)CFSTR("owner"));
    v8->_owner = (id)v17;
    if (v17)
    {
      v20 = objc_opt_class();
      v22 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v21, v20, (uint64_t)CFSTR("program"));
      objc_msgSend_setProgram_(v8, v23, v22, v24);
      v25 = (void *)MEMORY[0x1E0C99E60];
      v42[0] = objc_opt_class();
      v42[1] = objc_opt_class();
      v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v26, (uint64_t)v42, 2);
      v30 = objc_msgSend_setWithArray_(v25, v28, v27, v29);
      v32 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v31, v30, (uint64_t)CFSTR("shaderModifiers"));
      objc_msgSend_setShaderModifiers_(v8, v33, v32, v34);
      v35 = objc_opt_class();
      v37 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v36, v35, (uint64_t)CFSTR("minimumLanguageVersion"));
      objc_msgSend_setMinimumLanguageVersion_(v8, v38, v37, v39);
    }
    objc_msgSend_setImmediateMode_(VFXTransaction, v18, v12, v19);
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
