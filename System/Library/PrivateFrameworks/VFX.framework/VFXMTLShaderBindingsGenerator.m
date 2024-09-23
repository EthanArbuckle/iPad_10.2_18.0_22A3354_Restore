@implementation VFXMTLShaderBindingsGenerator

+ (void)allocateRegistry
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;

  if (qword_1ED4CEEE8)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. You can't allocate a registry twice"), v2, v3, v4, v5, v6, v7, (uint64_t)"__semanticRegistry == NULL");
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  qword_1ED4CEEE8 = objc_msgSend_initWithCapacity_(v8, v9, 0, v10);
  v11 = objc_alloc(MEMORY[0x1E0C99E08]);
  qword_1ED4CEED8 = objc_msgSend_initWithCapacity_(v11, v12, 0, v13);
}

+ (void)deallocateRegistry
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v8 = (void *)qword_1ED4CEEE8;
  if (!qword_1ED4CEEE8)
  {
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. You can't deallocate a registry that wasn't allocated"), v2, v3, v4, v5, v6, v7, (uint64_t)"__semanticRegistry != NULL");
    v8 = (void *)qword_1ED4CEEE8;
  }

  qword_1ED4CEEE8 = 0;
  qword_1ED4CEED8 = 0;
}

+ (void)registerSemantic:(id)a3 withBlock:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;

  if (objc_msgSend_objectForKey_((void *)qword_1ED4CEEE8, a2, (uint64_t)a3, (uint64_t)a4))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. You can't register twice the same semantic"), v6, v7, v8, v9, v10, v11, (uint64_t)"[__semanticRegistry objectForKey:semanticName] == nil");
  v12 = (void *)qword_1ED4CEEE8;
  v13 = _Block_copy(a4);
  objc_msgSend_setObject_forKey_(v12, v14, (uint64_t)v13, (uint64_t)a3);
}

+ (void)registerArgument:(id)a3 frequency:(int)a4 block:(id)a5
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  VFXMTLArgumentBinder *v14;
  const char *v15;
  id v16;
  const char *v17;

  v6 = *(_QWORD *)&a4;
  if (objc_msgSend_objectForKey_((void *)qword_1ED4CEED8, a2, (uint64_t)a3, *(uint64_t *)&a4))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. You can't register twice the same argument name"), v8, v9, v10, v11, v12, v13, (uint64_t)"[__argumentRegistry objectForKey:argumentName] == nil");
  v14 = [VFXMTLArgumentBinder alloc];
  v16 = (id)objc_msgSend_initWithBlock_frequency_needsRenderResource_(v14, v15, (uint64_t)a5, v6, 0);
  objc_msgSend_setObject_forKey_((void *)qword_1ED4CEED8, v17, (uint64_t)v16, (uint64_t)a3);
}

+ (void)registerArgument:(id)a3 frequency:(int)a4 needsRenderResource:(BOOL)a5 block:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  VFXMTLArgumentBinder *v16;
  const char *v17;
  id v18;
  const char *v19;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  if (objc_msgSend_objectForKey_((void *)qword_1ED4CEED8, a2, (uint64_t)a3, *(uint64_t *)&a4))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. You can't register twice the same argument name"), v10, v11, v12, v13, v14, v15, (uint64_t)"[__argumentRegistry objectForKey:argumentName] == nil");
  v16 = [VFXMTLArgumentBinder alloc];
  v18 = (id)objc_msgSend_initWithBlock_frequency_needsRenderResource_(v16, v17, (uint64_t)a6, v8, v7);
  objc_msgSend_setObject_forKey_((void *)qword_1ED4CEED8, v19, (uint64_t)v18, (uint64_t)a3);
}

+ (void)registerUserBlockTrampoline:(id)a3
{
  qword_1ED4CEEF8 = (uint64_t)_Block_copy(a3);
}

+ (void)registerShadableArgumentBindingBlockForBuffers:(id)a3 textures:(id)a4 samplers:(id)a5
{
  qword_1ED4CEF00 = (uint64_t)_Block_copy(a3);
  qword_1ED4CEF10 = (uint64_t)_Block_copy(a4);
  qword_1ED4CEF18 = (uint64_t)_Block_copy(a5);
}

- (VFXMTLShaderBindingsGenerator)init
{
  VFXMTLShaderBindingsGenerator *v2;
  VFXMTLShaderBindingsGenerator *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)VFXMTLShaderBindingsGenerator;
  v2 = -[VFXMTLShaderBindingsGenerator init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_generateLock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc(MEMORY[0x1E0C99E08]);
    v3->_passBindings = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v4, v5, 16, v6);
    v7 = objc_alloc(MEMORY[0x1E0C99E08]);
    v3->_nodeBindings = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v7, v8, 16, v9);
    v10 = objc_alloc(MEMORY[0x1E0C99E08]);
    v3->_frameBindings = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v10, v11, 16, v12);
    v13 = objc_alloc(MEMORY[0x1E0C99E08]);
    v3->_shadableBindings = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v13, v14, 16, v15);
    v16 = objc_alloc(MEMORY[0x1E0C99E08]);
    v3->_lightBindings = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v16, v17, 16, v18);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLShaderBindingsGenerator;
  -[VFXMTLShaderBindingsGenerator dealloc](&v3, sel_dealloc);
}

- (int64_t)_searchBindings:(id)a3 forArgumentNamed:(id)a4 type:(int64_t)a5
{
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, a2, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v28;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v13)
        objc_enumerationMutation(a3);
      v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v14);
      v16 = (void *)objc_msgSend_name(v15, v9, v10, v11);
      if (objc_msgSend_isEqualToString_(v16, v17, (uint64_t)a4, v18))
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v9, (uint64_t)&v27, (uint64_t)v31, 16);
        if (v12)
          goto LABEL_3;
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    if (objc_msgSend_type(v15, v9, v10, v11) == a5)
      return objc_msgSend_index(v15, v19, v20, v21);
    sub_1B17C4408(0, (uint64_t)CFSTR("Warning: arguments named %@ is reserved for type %d"), v20, v21, v22, v23, v24, v25, (uint64_t)a4);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_parseBindings:(id)a3 function:(id)a4 renderPipeline:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  VFXMTLSemanticResourceBinding *v111;
  VFXMTLSemanticResourceBinding *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  char v160;
  $E8FEF9D34A3DFDCB69CDC2374B44012F *p_indices;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  char v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  NSMutableDictionary *nodeBindings;
  VFXMTLSemanticResourceBinding *v177;
  id obj;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *__na;
  size_t __n;
  uint64_t __nb;
  NSDictionary *__nc;
  int v187;
  VFXMTLShaderBindingsGenerator *v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  void *__src;
  _BYTE *v195;
  uint64_t v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _BYTE v201[128];
  _BYTE v202[128];
  uint64_t v203;

  v203 = *MEMORY[0x1E0C80C00];
  if (!a4)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), (uint64_t)a3, 0, (uint64_t)a5, v5, v6, v7, (uint64_t)"function");
  v11 = objc_msgSend_functionType(a4, a2, (uint64_t)a3, (uint64_t)a4, a5);
  v187 = sub_1B189DABC(v11, v12, v13, v14, v15, v16, v17, v18);
  self->_current.stage = v187;
  v188 = self;
  self->_current.bindings = (NSArray *)a3;
  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v19, (uint64_t)&v197, (uint64_t)v202, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v198;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v198 != v24)
          objc_enumerationMutation(a3);
        v26 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * v25);
        if (objc_msgSend_isUsed(v26, v20, v21, v22))
        {
          if (objc_msgSend_type(v26, v20, v21, v22) != 3)
          {
            if (objc_msgSend_type(v26, v20, v21, v22)
              || (v27 = (void *)objc_msgSend_name(v26, v20, v21, v22),
                  (objc_msgSend_hasPrefix_(v27, v28, (uint64_t)CFSTR("vertexBuffer."), v29) & 1) == 0))
            {
              v30 = (void *)objc_msgSend_name(v26, v20, v21, v22);
              if ((objc_msgSend_isEqualToString_(v30, v31, (uint64_t)CFSTR("osdIndicesBuffer"), v32) & 1) == 0)
              {
                v33 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                if ((objc_msgSend_isEqualToString_(v33, v34, (uint64_t)CFSTR("osdTessellationLevel"), v35) & 1) == 0)
                {
                  v36 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                  if ((objc_msgSend_isEqualToString_(v36, v37, (uint64_t)CFSTR("osdVertexBuffer"), v38) & 1) == 0)
                  {
                    v39 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                    if ((objc_msgSend_isEqualToString_(v39, v40, (uint64_t)CFSTR("osdFaceVaryingData"), v41) & 1) == 0)
                    {
                      v42 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                      if ((objc_msgSend_isEqualToString_(v42, v43, (uint64_t)CFSTR("osdFaceVaryingIndices"), v44) & 1) == 0)
                      {
                        v45 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                        if ((objc_msgSend_isEqualToString_(v45, v46, (uint64_t)CFSTR("osdFaceVaryingPatchParams"), v47) & 1) == 0)
                        {
                          v48 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                          if ((objc_msgSend_isEqualToString_(v48, v49, (uint64_t)CFSTR("osdFaceVaryingPatchArray"), v50) & 1) == 0)
                          {
                            v51 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                            if ((objc_msgSend_isEqualToString_(v51, v52, (uint64_t)CFSTR("osdFaceVaryingChannelCount"), v53) & 1) == 0)
                            {
                              v54 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                              if ((objc_msgSend_isEqualToString_(v54, v55, (uint64_t)CFSTR("osdFaceVaryingChannelDescriptors"), v56) & 1) == 0)
                              {
                                v57 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                                if ((objc_msgSend_isEqualToString_(v57, v58, (uint64_t)CFSTR("osdFaceVaryingPatchArrayIndex"), v59) & 1) == 0)
                                {
                                  v60 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                                  if ((objc_msgSend_isEqualToString_(v60, v61, (uint64_t)CFSTR("osdFaceVaryingChannelsPackedData"), v62) & 1) == 0)
                                  {
                                    v63 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                                    if ((objc_msgSend_isEqualToString_(v63, v64, (uint64_t)CFSTR("vertexBuffer"), v65) & 1) == 0)
                                    {
                                      v66 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                                      if ((objc_msgSend_isEqualToString_(v66, v67, (uint64_t)CFSTR("indexBuffer"), v68) & 1) == 0)
                                      {
                                        v69 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                                        if ((objc_msgSend_isEqualToString_(v69, v70, (uint64_t)CFSTR("patchParamBuffer"), v71) & 1) == 0)
                                        {
                                          v72 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                                          if ((objc_msgSend_isEqualToString_(v72, v73, (uint64_t)CFSTR("perPatchVertexBuffer"), v74) & 1) == 0)
                                          {
                                            v75 = (void *)objc_msgSend_name(v26, v20, v21, v22);
                                            if ((objc_msgSend_isEqualToString_(v75, v76, (uint64_t)CFSTR("patchTessBuffer"), v77) & 1) == 0)
                                            {
                                              __na = (void *)qword_1ED4CEED8;
                                              v78 = objc_msgSend_name(v26, v20, v21, v22);
                                              v81 = objc_msgSend_objectForKeyedSubscript_(__na, v79, v78, v80);
                                              if (v81)
                                              {
                                                objc_msgSend_addResourceBindingsForArgument_frequency_needsRenderResource_block_(v188, v82, (uint64_t)v26, *(unsigned int *)(v81 + 16), *(unsigned __int8 *)(v81 + 20), *(_QWORD *)(v81 + 8));
                                                goto LABEL_60;
                                              }
                                              if (objc_msgSend_type(v26, v82, v83, v84))
                                              {
                                                if (objc_msgSend_type(v26, v85, v86, v87) == 2 && v188->_current.pass)
                                                {
LABEL_33:
                                                  if ((objc_msgSend_addPassResourceBindingsForArgument_(v188, v20, (uint64_t)v26, v22) & 1) != 0)goto LABEL_60;
                                                }
LABEL_34:
                                                v88 = objc_msgSend_type(v26, v20, v21, v22);
                                                objc_msgSend_addResourceBindingsForArgument_frequency_needsRenderResource_block_(v188, v89, (uint64_t)v26, 2, 1, qword_1ED4CEF00[v88]);
                                                goto LABEL_60;
                                              }
                                              v90 = (void *)objc_msgSend_name(v26, v85, v86, v87);
                                              if ((objc_msgSend_isEqualToString_(v90, v91, (uint64_t)CFSTR("vfx_node"), v92) & 1) != 0|| (v96 = (void *)objc_msgSend_name(v26, v93, v94, v95), (objc_msgSend_isEqualToString_(v96, v97, (uint64_t)CFSTR("vfx_nodes"), v98) & 1) != 0)|| (v99 = (void *)objc_msgSend_name(v26, v93, v94, v95), objc_msgSend_isEqualToString_(v99, v100, (uint64_t)CFSTR("vfx_lights"), v101)))
                                              {
                                                nodeBindings = v188->_nodeBindings;
                                                v102 = (void *)objc_msgSend_name(v26, v93, v94, v95);
                                                if (objc_msgSend_isEqualToString_(v102, v103, (uint64_t)CFSTR("vfx_lights"), v104))nodeBindings = v188->_lightBindings;
                                                v108 = objc_msgSend_name(v26, v105, v106, v107);
                                                v111 = (VFXMTLSemanticResourceBinding *)objc_msgSend_objectForKeyedSubscript_(nodeBindings, v109, v108, v110);
                                                v177 = v111;
                                                if (v111)
                                                {
                                                  v112 = v111;
                                                }
                                                else
                                                {
                                                  v177 = objc_alloc_init(VFXMTLSemanticResourceBinding);
                                                  objc_msgSend_setBinding_(v177, v116, (uint64_t)v26, v117);
                                                  if (objc_msgSend_bufferDataType(v26, v118, v119, v120) == 1)
                                                  {
                                                    __src = 0;
                                                    v195 = 0;
                                                    v196 = 0;
                                                    v190 = 0u;
                                                    v191 = 0u;
                                                    v192 = 0u;
                                                    v193 = 0u;
                                                    v121 = (void *)objc_msgSend_bufferStructType(v26, v113, v114, v115);
                                                    obj = (id)objc_msgSend_members(v121, v122, v123, v124);
                                                    v180 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v125, (uint64_t)&v190, (uint64_t)v201, 16);
                                                    if (v180)
                                                    {
                                                      v179 = *(_QWORD *)v191;
                                                      do
                                                      {
                                                        for (__n = 0; __n != v180; ++__n)
                                                        {
                                                          if (*(_QWORD *)v191 != v179)
                                                            objc_enumerationMutation(obj);
                                                          v181 = (void *)qword_1ED4CEEE8;
                                                          v182 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * __n);
                                                          v129 = objc_msgSend_name(v182, v126, v127, v128);
                                                          v132 = objc_msgSend_objectForKeyedSubscript_(v181, v130, v129, v131);
                                                          if (v132)
                                                          {
                                                            v189 = (unint64_t)v132;
                                                            DWORD2(v189) = objc_msgSend_offset(v182, v133, v134, v135);
                                                            HIDWORD(v189) = sub_1B198F738(v182, v136, v137, v138);
                                                            sub_1B198FF58(&__src, &v189);
                                                          }
                                                          else
                                                          {
                                                            v139 = objc_msgSend_name(v182, v133, v134, v135);
                                                            sub_1B17C4408(0, (uint64_t)CFSTR("Warning: unknown member in vfx automated buffer : %@"), v140, v141, v142, v143, v144, v145, v139);
                                                          }
                                                        }
                                                        v180 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v126, (uint64_t)&v190, (uint64_t)v201, 16);
                                                      }
                                                      while (v180);
                                                    }
                                                    objc_msgSend_setSemanticsCount_(v177, v126, (v195 - (_BYTE *)__src) >> 4, v128);
                                                    if (objc_msgSend_semanticsCount(v177, v146, v147, v148))
                                                    {
                                                      __nb = 16 * objc_msgSend_semanticsCount(v177, v149, v150, v151);
                                                      v177->_semantics = ($416A025297F085A8C4D13FE1DBBBD127 *)malloc_type_malloc(__nb, 0xAF09B7ADuLL);
                                                      memcpy(v177->_semantics, __src, __nb);
                                                      v155 = objc_msgSend_bufferDataSize(v26, v152, v153, v154);
                                                      objc_msgSend_setBufferSize_(v177, v156, v155, v157);
                                                    }
                                                    v158 = objc_msgSend_name(v26, v149, v150, v151);
                                                    objc_msgSend_setObject_forKeyedSubscript_(nodeBindings, v159, (uint64_t)v177, v158);
                                                    if (__src)
                                                    {
                                                      v195 = __src;
                                                      operator delete(__src);
                                                    }
                                                  }
                                                }
                                                v160 = objc_msgSend_index(v26, v113, v114, v115);
                                                p_indices = &v177->super._indices;
                                                if (v187)
                                                  p_indices = ($E8FEF9D34A3DFDCB69CDC2374B44012F *)&v177->super._indices.fragmentIndex;
                                                p_indices->vertexIndex = v160;

                                              }
                                              else if (objc_msgSend_bufferDataType(v26, v93, v94, v95) == 1
                                                     && ((v165 = (void *)objc_msgSend_name(v26, v162, v163, v164),
                                                          (objc_msgSend_isEqualToString_(v165, v166, (uint64_t)CFSTR("vfx_frame"), v167) & 1) != 0)|| (v168 = (void *)objc_msgSend_name(v26, v162, v163, v164), objc_msgSend_isEqualToString_(v168, v169, (uint64_t)CFSTR("vfx_frame_multi"), v170))))
                                              {
                                                v171 = objc_msgSend_index(v26, v162, v163, v164);
                                                if (v187)
                                                  v188->_worldBuffer.fragmentIndex = v171;
                                                else
                                                  v188->_worldBuffer.vertexIndex = v171;
                                              }
                                              else
                                              {
                                                __nc = v188->_current.customBlocks;
                                                v172 = objc_msgSend_name(v26, v162, v163, v164);
                                                v20 = (const char *)objc_msgSend_objectForKey_(__nc, v173, v172, v174);
                                                if (!v20)
                                                {
                                                  if (v188->_current.pass
                                                    && objc_msgSend_bufferDataType(v26, 0, v21, v22) == 1)
                                                  {
                                                    goto LABEL_33;
                                                  }
                                                  goto LABEL_34;
                                                }
                                                (*(void (**)(uint64_t, const char *, void *, VFXMTLShaderBindingsGenerator *))(qword_1ED4CEEF8 + 16))(qword_1ED4CEEF8, v20, v26, v188);
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_60:
        ++v25;
      }
      while (v25 != v23);
      v175 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v20, (uint64_t)&v197, (uint64_t)v202, 16);
      v23 = v175;
    }
    while (v175);
  }
}

- (void)generateBindingsForPipeline:(id)a3 withReflection:(id)a4 program:(__CFXFXProgram *)a5 material:(__CFXMaterial *)a6 geometry:(__CFXGeometry *)a7 pass:(__CFXFXPass *)a8
{
  os_unfair_lock_s *p_generateLock;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;

  p_generateLock = &self->_generateLock;
  os_unfair_lock_lock(&self->_generateLock);
  self->_current.customBlocks = (NSDictionary *)sub_1B181E720((uint64_t)a5, v15, v16, v17, v18, v19, v20, v21);
  self->_current.pass = a8;
  if (a6)
    sub_1B1878184((uint64_t)a6, (uint64_t)v22, v23, v24, v25, v26, v27, v28);
  self->_worldBuffer = ($E8FEF9D34A3DFDCB69CDC2374B44012F)-1;
  if (objc_msgSend_vertexFunction(a3, v22, v23, v24))
  {
    v32 = objc_msgSend_vertexBindings(a4, v29, v30, v31);
    v36 = objc_msgSend_vertexFunction(a3, v33, v34, v35);
    objc_msgSend__parseBindings_function_renderPipeline_(self, v37, v32, v36, a3);
  }
  if (objc_msgSend_fragmentFunction(a3, v29, v30, v31))
  {
    v41 = objc_msgSend_fragmentBindings(a4, v38, v39, v40);
    v45 = objc_msgSend_fragmentFunction(a3, v42, v43, v44);
    objc_msgSend__parseBindings_function_renderPipeline_(self, v46, v41, v45, a3);
  }
  if (self->_worldBuffer.vertexIndex != 255
    || self->_worldBuffer.fragmentIndex != 255)
  {
    *((_WORD *)a3 + 4) = self->_worldBuffer;
  }
  if (objc_msgSend_count(self->_frameBindings, v38, v39, v40))
  {
    v50 = objc_msgSend_allValues(self->_frameBindings, v47, v48, v49);
    objc_msgSend_setFrameBufferBindings_(a3, v51, v50, v52);
    objc_msgSend_removeAllObjects(self->_frameBindings, v53, v54, v55);
  }
  if (objc_msgSend_count(self->_nodeBindings, v47, v48, v49))
  {
    v59 = objc_msgSend_allValues(self->_nodeBindings, v56, v57, v58);
    objc_msgSend_setNodeBufferBindings_(a3, v60, v59, v61);
    objc_msgSend_removeAllObjects(self->_nodeBindings, v62, v63, v64);
  }
  if (objc_msgSend_count(self->_passBindings, v56, v57, v58))
  {
    v68 = objc_msgSend_allValues(self->_passBindings, v65, v66, v67);
    objc_msgSend_setPassBufferBindings_(a3, v69, v68, v70);
    objc_msgSend_removeAllObjects(self->_passBindings, v71, v72, v73);
  }
  if (objc_msgSend_count(self->_shadableBindings, v65, v66, v67))
  {
    v77 = objc_msgSend_allValues(self->_shadableBindings, v74, v75, v76);
    objc_msgSend_setShadableBufferBindings_(a3, v78, v77, v79);
    objc_msgSend_removeAllObjects(self->_shadableBindings, v80, v81, v82);
  }
  if (objc_msgSend_count(self->_lightBindings, v74, v75, v76))
  {
    v86 = objc_msgSend_allValues(self->_lightBindings, v83, v84, v85);
    objc_msgSend_setLightBufferBindings_(a3, v87, v86, v88);
    objc_msgSend_removeAllObjects(self->_lightBindings, v89, v90, v91);
  }
  v92 = objc_msgSend_vertexBindings(a4, v83, v84, v85);
  v96 = objc_msgSend_vertexFunction(a3, v93, v94, v95);
  objc_msgSend__computeUsageForBindings_function_(a3, v97, v92, v96);
  v101 = objc_msgSend_fragmentBindings(a4, v98, v99, v100);
  v105 = objc_msgSend_fragmentFunction(a3, v102, v103, v104);
  objc_msgSend__computeUsageForBindings_function_(a3, v106, v101, v105);
  os_unfair_lock_unlock(p_generateLock);
}

- (id)_dictionaryForFrequency:(int)a3
{
  void *v3;

  if (a3 <= 3)
    return *(Class *)((char *)&self->super.isa + qword_1B2268B30[a3]);
  return v3;
}

- (void)_checkForAssociatedSamplerOnBinding:(id)a3 argument:(id)a4
{
  void *v6;
  const char *v7;
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
  int stage;

  v6 = (void *)objc_msgSend_name(a4, a2, (uint64_t)a3, (uint64_t)a4);
  v9 = objc_msgSend_stringByAppendingString_(v6, v7, (uint64_t)CFSTR("Sampler"), v8);
  v11 = objc_msgSend__searchBindings_forArgumentNamed_type_(self, v10, (uint64_t)self->_current.bindings, v9, 3);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    stage = self->_current.stage;
    if (stage == 1)
    {
      *((_BYTE *)a3 + 12) = v11;
    }
    else if (stage)
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: invalid program stage %d"), v12, v13, v14, v15, v16, v17, self->_current.stage);
    }
    else
    {
      *((_BYTE *)a3 + 11) = v11;
    }
  }
}

- (void)addResourceBindingsForArgument:(id)a3 frequency:(int)a4 needsRenderResource:(BOOL)a5 block:(id)a6
{
  _BOOL8 v7;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  VFXMTLResourceBinding *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  VFXMTLResourceBinding *v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  int stage;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;

  v7 = a5;
  v10 = (void *)objc_msgSend__dictionaryForFrequency_(self, a2, *(uint64_t *)&a4, *(uint64_t *)&a4);
  v14 = objc_msgSend_name(a3, v11, v12, v13);
  v17 = (VFXMTLResourceBinding *)objc_msgSend_objectForKeyedSubscript_(v10, v15, v14, v16);
  if (v17)
  {
    v21 = v17;
    v22 = objc_msgSend_type(v17, v18, v19, v20);
    if (v22 != objc_msgSend_type(a3, v23, v24, v25))
    {
      objc_msgSend_type(a3, v26, v27, v28);
      objc_msgSend_type(v21, v29, v30, v31);
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Argument with the same name cannot have different types (%d != %d)"), v32, v33, v34, v35, v36, v37, (uint64_t)"bufferBinding.type == argument.type");
    }
    if ((id)objc_msgSend_bindBlock(v21, v26, v27, v28) != a6)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Argument with the same name cannot have different blocks"), v39, v40, v41, v42, v43, v44, (uint64_t)"(VFXArgumentBindingBlock)bufferBinding.bindBlock == block");
  }
  else
  {
    v21 = objc_alloc_init(VFXMTLResourceBinding);
    objc_msgSend_setBindBlock_(v21, v45, (uint64_t)a6, v46);
    objc_msgSend_setNeedsRenderResource_(v21, v47, v7, v48);
    objc_msgSend_setBinding_(v21, v49, (uint64_t)a3, v50);
    v54 = objc_msgSend_name(a3, v51, v52, v53);
    objc_msgSend_setObject_forKeyedSubscript_(v10, v55, (uint64_t)v21, v54);

  }
  stage = self->_current.stage;
  if (stage == 1)
  {
    v21->_indices.fragmentIndex = objc_msgSend_index(a3, v38, v39, v40);
  }
  else if (stage)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: invalid program stage %d"), v39, v40, v41, v42, v43, v44, self->_current.stage);
  }
  else
  {
    v21->_indices.vertexIndex = objc_msgSend_index(a3, v38, v39, v40);
  }
  if (objc_msgSend_type(a3, v57, v58, v59) == 2)
    objc_msgSend__checkForAssociatedSamplerOnBinding_argument_(self, v60, (uint64_t)v21, (uint64_t)a3);
}

- (BOOL)addPassResourceBindingsForArgument:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  VFXMTLPassResourceBinding *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  VFXMTLPassResourceBinding *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  int stage;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  __CFXFXPass *pass;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __CFXFXPassInput *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t i;
  void *v101;
  __CFXFXPass *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  __int16 *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
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
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  int v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  int v156;
  _BYTE *v157;
  _BYTE *v158;
  int64_t v159;
  unint64_t v160;
  uint64_t v161;
  char *v162;
  char *v163;
  char *v164;
  char *v165;
  char *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  size_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  void *v178;
  id v179;
  void **p_isa;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  void *__src;
  _BYTE *v186;
  unint64_t v187;
  _BYTE v188[128];
  uint64_t v189;

  v189 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend__dictionaryForFrequency_(self, a2, 3, v3);
  v10 = objc_msgSend_name(a3, v7, v8, v9);
  v13 = (VFXMTLPassResourceBinding *)objc_msgSend_objectForKeyedSubscript_(v6, v11, v10, v12);
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Argument with the same name cannot have different class type"), v15, v16, v17, v18, v19, v20, (uint64_t)"[bufferBinding isKindOfClass:[VFXMTLPassResourceBinding class]]");
    v21 = objc_msgSend_type(v13, v14, v15, v16);
    if (v21 != objc_msgSend_type(a3, v22, v23, v24))
    {
      objc_msgSend_type(a3, v25, v26, v27);
      objc_msgSend_type(v13, v28, v29, v30);
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Argument with the same name cannot have different types (%d != %d)"), v31, v32, v33, v34, v35, v36, (uint64_t)"bufferBinding.type == argument.type");
    }
    v44 = v13;
    if (objc_msgSend_bindBlock(v13, v25, v26, v27))
    {
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Argument with the same name cannot have different blocks"), v38, v39, v40, v41, v42, v43, (uint64_t)"(VFXArgumentBindingBlock)bufferBinding.bindBlock == nil");
      v44 = v13;
    }
  }
  else
  {
    v44 = objc_alloc_init(VFXMTLPassResourceBinding);
    objc_msgSend_setBindBlock_(v44, v45, 0, v46);
    objc_msgSend_setNeedsRenderResource_(v44, v47, 0, v48);
    objc_msgSend_setBinding_(v44, v49, (uint64_t)a3, v50);
  }
  stage = self->_current.stage;
  if (stage == 1)
  {
    v44->super._indices.fragmentIndex = objc_msgSend_index(a3, v37, v38, v39);
  }
  else if (stage)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: invalid program stage %d"), v38, v39, v40, v41, v42, v43, self->_current.stage);
  }
  else
  {
    v44->super._indices.vertexIndex = objc_msgSend_index(a3, v37, v38, v39);
  }
  if (objc_msgSend_type(a3, v52, v53, v54) == 2)
  {
    if (v13)
    {
LABEL_18:
      objc_msgSend__checkForAssociatedSamplerOnBinding_argument_(self, v55, (uint64_t)v44, (uint64_t)a3);
      goto LABEL_20;
    }
    pass = self->_current.pass;
    v59 = (void *)objc_msgSend_name(a3, v55, v56, v57);
    v66 = (__CFXFXPassInput *)sub_1B19AE654((uint64_t)pass, v59, v60, v61, v62, v63, v64, v65);
    if (v66)
    {
      v44->_samplerInput = v66;
      goto LABEL_18;
    }
  }
  else
  {
    if (objc_msgSend_type(a3, v55, v56, v57))
    {
LABEL_20:
      if (v13)
      {
LABEL_22:
        LOBYTE(v66) = 1;
        return (char)v66;
      }
LABEL_21:
      v70 = objc_msgSend_name(a3, v67, v68, v69);
      objc_msgSend_setObject_forKeyedSubscript_(v6, v71, (uint64_t)v44, v70);
      goto LABEL_22;
    }
    if (objc_msgSend_bufferDataType(a3, v67, v68, v69) != 1)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Only supports pass buffer arguments as struct"), v73, v74, v75, v76, v77, v78, (uint64_t)"((id <MTLBufferBinding>)argument).bufferDataType == MTLDataTypeStruct");
    if (v13)
    {
      v79 = objc_msgSend_bufferSize(v44, v72, v73, v74);
      if (v79 != objc_msgSend_bufferDataSize(a3, v80, v81, v82))
        sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. buffers of the same name in different stages need to have the same type"), v83, v84, v85, v86, v87, v88, (uint64_t)"(NSUInteger)bufferBinding.bufferSize == ((id<MTLBufferBinding>)argument).bufferDataSize");
      goto LABEL_22;
    }
    v179 = a3;
    p_isa = (void **)&v44->super.super.isa;
    v178 = v6;
    __src = 0;
    v186 = 0;
    v187 = 0;
    v181 = 0u;
    v182 = 0u;
    v183 = 0u;
    v184 = 0u;
    v89 = (void *)objc_msgSend_bufferStructType(a3, v72, v73, v74);
    v93 = (void *)objc_msgSend_members(v89, v90, v91, v92);
    v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v94, (uint64_t)&v181, (uint64_t)v188, 16);
    if (v98)
    {
      v99 = *(_QWORD *)v182;
      do
      {
        for (i = 0; i != v98; ++i)
        {
          if (*(_QWORD *)v182 != v99)
            objc_enumerationMutation(v93);
          v101 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * i);
          v102 = self->_current.pass;
          v103 = (void *)objc_msgSend_name(v101, (const char *)v95, v96, v97);
          v110 = (__int16 *)sub_1B19AE654((uint64_t)v102, v103, v104, v105, v106, v107, v108, v109);
          if (v110)
          {
            v111 = (void *)objc_msgSend_arrayType(v101, (const char *)v95, v96, v97);
            if (objc_msgSend_dataType(v101, v112, v113, v114) == 2
              && (v118 = objc_msgSend_elementType(v111, v115, v116, v117),
                  v118 == sub_1B189D608(v110[10], v119, v120, v121, v122, v123, v124, v125))
              || (v126 = objc_msgSend_dataType(v101, v115, v116, v117),
                  v126 == sub_1B189D608(v110[10], v127, v128, v129, v130, v131, v132, v133))
              && *((_QWORD *)v110 + 3) == 1)
            {
              v137 = objc_msgSend_offset(v101, v115, v116, v117);
              if (v111)
              {
                objc_msgSend_arrayLength(v111, v134, v135, v136);
                v141 = objc_msgSend_elementType(v111, v138, v139, v140);
                v142 = sub_1B189D6C0(v141);
                v146 = objc_msgSend_arrayLength(v111, v143, v144, v145);
                v147 = *((_QWORD *)v110 + 3);
                if (v146 < v147)
                  LODWORD(v147) = v146;
              }
              else
              {
                v155 = objc_msgSend_dataType(v101, v134, v135, v136);
                v142 = sub_1B189D6C0(v155);
                v147 = *((_QWORD *)v110 + 3);
              }
              v156 = v142 * v147;
              v157 = v186;
              if ((unint64_t)v186 >= v187)
              {
                v159 = (v186 - (_BYTE *)__src) >> 4;
                v160 = v159 + 1;
                if ((unint64_t)(v159 + 1) >> 60)
                  abort();
                v161 = v187 - (_QWORD)__src;
                if ((uint64_t)(v187 - (_QWORD)__src) >> 3 > v160)
                  v160 = v161 >> 3;
                if ((unint64_t)v161 >= 0x7FFFFFFFFFFFFFF0)
                  v95 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v95 = v160;
                if (v95)
                  v162 = (char *)sub_1B17F7824((uint64_t)&v187, v95);
                else
                  v162 = 0;
                v163 = &v162[16 * v159];
                *(_QWORD *)v163 = v110;
                *((_DWORD *)v163 + 2) = v137;
                *((_DWORD *)v163 + 3) = v156;
                v165 = (char *)__src;
                v164 = v186;
                v166 = v163;
                if (v186 != __src)
                {
                  do
                  {
                    *((_OWORD *)v166 - 1) = *((_OWORD *)v164 - 1);
                    v166 -= 16;
                    v164 -= 16;
                  }
                  while (v164 != v165);
                  v164 = (char *)__src;
                }
                v158 = v163 + 16;
                __src = v166;
                v186 = v163 + 16;
                v187 = (unint64_t)&v162[16 * v95];
                if (v164)
                  operator delete(v164);
              }
              else
              {
                *(_QWORD *)v186 = v110;
                v158 = v157 + 16;
                *((_DWORD *)v157 + 2) = v137;
                *((_DWORD *)v157 + 3) = v156;
              }
              v186 = v158;
            }
            else
            {
              v148 = objc_msgSend_name(v101, v115, v116, v117);
              sub_1B17C4408(0, (uint64_t)CFSTR("Warning: struct member does not match pass description : %@"), v149, v150, v151, v152, v153, v154, v148);
            }
          }
        }
        v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, (const char *)v95, (uint64_t)&v181, (uint64_t)v188, 16);
      }
      while (v98);
    }
    if (v186 != __src)
    {
      v44 = (VFXMTLPassResourceBinding *)p_isa;
      objc_msgSend_setInputsCount_(p_isa, (const char *)v95, (v186 - (_BYTE *)__src) >> 4, v97);
      v6 = v178;
      a3 = v179;
      v170 = 16 * objc_msgSend_inputsCount(p_isa, v167, v168, v169);
      p_isa[6] = malloc_type_malloc(v170, 0x3707311FuLL);
      memcpy(p_isa[6], __src, v170);
      v174 = objc_msgSend_bufferDataSize(v179, v171, v172, v173);
      objc_msgSend_setBufferSize_(p_isa, v175, v174, v176);
      if (__src)
      {
        v186 = __src;
        operator delete(__src);
      }
      goto LABEL_21;
    }
    if (v186)
      operator delete(v186);
    LOBYTE(v66) = 0;
  }
  return (char)v66;
}

@end
