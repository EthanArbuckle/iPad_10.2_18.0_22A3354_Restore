@implementation VFXCommonProfileProgramGeneratorMetal

- (int)profile
{
  return 0;
}

- (void)_loadSourceCode
{
  NSString *originalLightingSourceCode;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  NSArray *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSString *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  const char *v161;
  NSUInteger v162;
  const char *v163;
  NSArray *v164;
  const char *v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t j;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  NSArray *v181;
  NSArray *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  _BYTE v207[128];
  _QWORD v208[22];
  _BYTE v209[128];
  _QWORD v210[5];

  v210[3] = *MEMORY[0x1E0C80C00];
  originalLightingSourceCode = (NSString *)sub_1B19B83D4(CFSTR("CFX-Lighting.metal"));
  self->_originalLightingSourceCode = originalLightingSourceCode;
  if (!originalLightingSourceCode)
  {
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v5, v6, v7, v8, v9, v10, (uint64_t)"_originalLightingSourceCode");
    originalLightingSourceCode = self->_originalLightingSourceCode;
  }
  v11 = (void *)MEMORY[0x1E0CB3B18];
  v12 = objc_msgSend_rangeOfString_(originalLightingSourceCode, v4, (uint64_t)CFSTR("__SurfaceExtraDecl__"), v6);
  v14 = objc_msgSend_valueWithRange_(v11, v13, v12, (uint64_t)v13);
  v15 = (void *)MEMORY[0x1E0CB3B18];
  v18 = objc_msgSend_rangeOfString_(self->_originalLightingSourceCode, v16, (uint64_t)CFSTR("__LightModifierExtraDecl__"), v17);
  v20 = objc_msgSend_valueWithRange_(v15, v19, v18, (uint64_t)v19);
  v21 = (void *)MEMORY[0x1E0CB3B18];
  v24 = objc_msgSend_rangeOfString_(self->_originalLightingSourceCode, v22, (uint64_t)CFSTR("__DoLightModifier__"), v23);
  v210[0] = v14;
  v210[1] = v20;
  v210[2] = objc_msgSend_valueWithRange_(v21, v25, v24, (uint64_t)v25);
  v27 = (NSArray *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v26, (uint64_t)v210, 3);
  self->_lightingInjectionPointRanges = v27;
  v203 = 0u;
  v204 = 0u;
  v205 = 0u;
  v206 = 0u;
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v203, (uint64_t)v209, 16);
  if (v29)
  {
    v33 = v29;
    v34 = *(_QWORD *)v204;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v204 != v34)
          objc_enumerationMutation(v27);
        objc_msgSend_rangeValue(*(void **)(*((_QWORD *)&v203 + 1) + 8 * i), v30, v31, v32);
        if (!v30)
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. range not found"), v31, v32, v36, v37, v38, v39, (uint64_t)"range.rangeValue.length > 0");
      }
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v203, (uint64_t)v209, 16);
    }
    while (v33);
  }
  v40 = (NSString *)sub_1B19B83D4(CFSTR("CFX-CommonProfile.metal"));
  self->_originalSourceCode = v40;
  v41 = (void *)MEMORY[0x1E0CB3B18];
  v44 = objc_msgSend_rangeOfString_(v40, v42, (uint64_t)CFSTR("#import \"vfx_metal\"), v43);
  v198 = objc_msgSend_valueWithRange_(v41, v45, v44, (uint64_t)v45);
  v46 = (void *)MEMORY[0x1E0CB3B18];
  v49 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v47, (uint64_t)CFSTR("#import \"vfx_util.h\"), v48);
  v197 = objc_msgSend_valueWithRange_(v46, v50, v49, (uint64_t)v50);
  v51 = (void *)MEMORY[0x1E0CB3B18];
  v54 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v52, (uint64_t)CFSTR("#import \"CFX-PBR.metal\"), v53);
  v196 = objc_msgSend_valueWithRange_(v51, v55, v54, (uint64_t)v55);
  v56 = (void *)MEMORY[0x1E0CB3B18];
  v59 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v57, (uint64_t)CFSTR("#import \"vfx_tessellation.h\"), v58);
  v195 = objc_msgSend_valueWithRange_(v56, v60, v59, (uint64_t)v60);
  v61 = (void *)MEMORY[0x1E0CB3B18];
  v64 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v62, (uint64_t)CFSTR("__TexcoordDecl__"), v63);
  v194 = objc_msgSend_valueWithRange_(v61, v65, v64, (uint64_t)v65);
  v66 = (void *)MEMORY[0x1E0CB3B18];
  v69 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v67, (uint64_t)CFSTR("__ExtraVaryingsDecl__"), v68);
  v193 = objc_msgSend_valueWithRange_(v66, v70, v69, (uint64_t)v70);
  v71 = (void *)MEMORY[0x1E0CB3B18];
  v74 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v72, (uint64_t)CFSTR("__ShaderModifiersDecl__"), v73);
  v192 = objc_msgSend_valueWithRange_(v71, v75, v74, (uint64_t)v75);
  v76 = (void *)MEMORY[0x1E0CB3B18];
  v79 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v77, (uint64_t)CFSTR("#import \"CFX-Lighting.metal\"), v78);
  v191 = objc_msgSend_valueWithRange_(v76, v80, v79, (uint64_t)v80);
  v81 = (void *)MEMORY[0x1E0CB3B18];
  v84 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v82, (uint64_t)CFSTR("__OpenSubdivDeclPerGeometry__"), v83);
  v190 = objc_msgSend_valueWithRange_(v81, v85, v84, (uint64_t)v85);
  v86 = (void *)MEMORY[0x1E0CB3B18];
  v89 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v87, (uint64_t)CFSTR("__OpenSubdivDeclPerPatchType__"), v88);
  v189 = objc_msgSend_valueWithRange_(v86, v90, v89, (uint64_t)v90);
  v91 = (void *)MEMORY[0x1E0CB3B18];
  v94 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v92, (uint64_t)CFSTR("__OpenSubdivDeclShared__"), v93);
  v188 = objc_msgSend_valueWithRange_(v91, v95, v94, (uint64_t)v95);
  v96 = (void *)MEMORY[0x1E0CB3B18];
  v99 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v97, (uint64_t)CFSTR("__VertexExtraArguments__"), v98);
  v187 = objc_msgSend_valueWithRange_(v96, v100, v99, (uint64_t)v100);
  v101 = (void *)MEMORY[0x1E0CB3B18];
  v104 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v102, (uint64_t)CFSTR("__VertexDoVertexOnlyTexcoord__"), v103);
  v186 = objc_msgSend_valueWithRange_(v101, v105, v104, (uint64_t)v105);
  v106 = (void *)MEMORY[0x1E0CB3B18];
  v109 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v107, (uint64_t)CFSTR("__DoGeometryModifier__"), v108);
  v185 = objc_msgSend_valueWithRange_(v106, v110, v109, (uint64_t)v110);
  v111 = (void *)MEMORY[0x1E0CB3B18];
  v114 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v112, (uint64_t)CFSTR("__VertexDoLighting__"), v113);
  v184 = objc_msgSend_valueWithRange_(v111, v115, v114, (uint64_t)v115);
  v116 = (void *)MEMORY[0x1E0CB3B18];
  v119 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v117, (uint64_t)CFSTR("__VertexDoTexcoord__"), v118);
  v183 = objc_msgSend_valueWithRange_(v116, v120, v119, (uint64_t)v120);
  v121 = (void *)MEMORY[0x1E0CB3B18];
  v124 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v122, (uint64_t)CFSTR("__FragmentExtraArguments__"), v123);
  v126 = objc_msgSend_valueWithRange_(v121, v125, v124, (uint64_t)v125);
  v127 = (void *)MEMORY[0x1E0CB3B18];
  v130 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v128, (uint64_t)CFSTR("__FragmentDoTexcoord__"), v129);
  v132 = objc_msgSend_valueWithRange_(v127, v131, v130, (uint64_t)v131);
  v133 = (void *)MEMORY[0x1E0CB3B18];
  v136 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v134, (uint64_t)CFSTR("__DoSurfaceModifier__"), v135);
  v138 = objc_msgSend_valueWithRange_(v133, v137, v136, (uint64_t)v137);
  v139 = (void *)MEMORY[0x1E0CB3B18];
  v142 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v140, (uint64_t)CFSTR("__LightModifierCopyDecl__"), v141);
  v144 = objc_msgSend_valueWithRange_(v139, v143, v142, (uint64_t)v143);
  v145 = (void *)MEMORY[0x1E0CB3B18];
  v148 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v146, (uint64_t)CFSTR("__FragmentDoLighting__"), v147);
  v150 = objc_msgSend_valueWithRange_(v145, v149, v148, (uint64_t)v149);
  v151 = (void *)MEMORY[0x1E0CB3B18];
  v154 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v152, (uint64_t)CFSTR("__DoFragmentModifier__"), v153);
  v156 = objc_msgSend_valueWithRange_(v151, v155, v154, (uint64_t)v155);
  v159 = objc_msgSend_rangeOfString_(self->_originalSourceCode, v157, (uint64_t)CFSTR("} commonprofile_io;"), v158);
  v161 = &v160[v159];
  v162 = objc_msgSend_rangeOfString_options_range_(self->_originalSourceCode, v160, (uint64_t)CFSTR("typedef struct {"), 4, 0, &v160[v159]);
  self->_commonProfileIORange.location = v162;
  self->_commonProfileIORange.length = (NSUInteger)&v161[-v162];
  v208[0] = v198;
  v208[1] = v197;
  v208[2] = v196;
  v208[3] = v195;
  v208[4] = v194;
  v208[5] = v193;
  v208[6] = v192;
  v208[7] = v191;
  v208[8] = v190;
  v208[9] = v189;
  v208[10] = v188;
  v208[11] = v187;
  v208[12] = v186;
  v208[13] = v185;
  v208[14] = v184;
  v208[15] = v183;
  v208[16] = v126;
  v208[17] = v132;
  v208[18] = v138;
  v208[19] = v144;
  v208[20] = v150;
  v208[21] = v156;
  v164 = (NSArray *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v163, (uint64_t)v208, 22);
  self->_injectionPointRanges = v164;
  v199 = 0u;
  v200 = 0u;
  v201 = 0u;
  v202 = 0u;
  v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(v164, v165, (uint64_t)&v199, (uint64_t)v207, 16);
  if (v166)
  {
    v174 = v166;
    v175 = *(_QWORD *)v200;
    do
    {
      for (j = 0; j != v174; ++j)
      {
        if (*(_QWORD *)v200 != v175)
          objc_enumerationMutation(v164);
        objc_msgSend_rangeValue(*(void **)(*((_QWORD *)&v199 + 1) + 8 * j), v167, v168, v169);
        if (!v167)
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. range not found"), v168, v169, v177, v178, v179, v180, (uint64_t)"range.rangeValue.length > 0");
      }
      v174 = objc_msgSend_countByEnumeratingWithState_objects_count_(v164, v167, (uint64_t)&v199, (uint64_t)v207, 16);
    }
    while (v174);
  }
  if (!self->_originalSourceCode)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v168, v169, v170, v171, v172, v173, (uint64_t)"_originalSourceCode");
  v181 = self->_lightingInjectionPointRanges;
  v182 = self->_injectionPointRanges;
}

- (void)emptyShaderCache
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  objc_msgSend__loadSourceCode(self, v3, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)VFXCommonProfileProgramGeneratorMetal;
  -[VFXCommonProfileProgramGenerator emptyShaderCache](&v6, sel_emptyShaderCache);
}

- (id)initAllowingHotReload:(BOOL)a3
{
  VFXCommonProfileProgramGeneratorMetal *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  VFXCommonProfileProgramGeneratorMetal *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXCommonProfileProgramGeneratorMetal;
  v4 = -[VFXCommonProfileProgramGenerator init](&v10, sel_init);
  v8 = v4;
  if (v4)
  {
    v4->_allowHotReload = a3;
    objc_msgSend__loadSourceCode(v4, v5, v6, v7);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXCommonProfileProgramGeneratorMetal;
  -[VFXCommonProfileProgramGenerator dealloc](&v3, sel_dealloc);
}

- (__CFXFXProgram)_newProgramWithHashCode:(__CFXProgramHashCode *)a3 engineContext:(__CFXEngineContext *)a4 introspectionDataPtr:(void *)a5
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  __int16 v39;
  int v40;
  __int16 v41;
  char v42;
  __int16 v43;
  int v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  int v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  unint64_t v63;
  unsigned int v64;
  unint64_t v65;
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
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
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
  id v111;
  uint64_t v112;
  uint64_t v113;
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
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
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
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  __int16 v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  __int16 v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  const __CFDictionary *v190;
  const char *v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  unsigned int v202;
  const char *v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  int v212;
  int v213;
  const char *v214;
  int v215;
  const char *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  int v223;
  const __CFString *v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  unsigned int v228;
  unsigned int v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  unsigned int v233;
  unint64_t v234;
  _BOOL4 v235;
  uint64_t v236;
  _BOOL4 v237;
  int v238;
  unsigned int v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  char v246;
  uint64_t v247;
  int v248;
  const char *v249;
  uint64_t v250;
  int v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  const char *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  const char *v271;
  const char *v272;
  const char *v273;
  const char *v274;
  const __CFString *v275;
  const char *v276;
  const char *v277;
  const char *v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  const char *v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  const char *v288;
  uint64_t v289;
  const char *v290;
  const char *v291;
  const char *v292;
  const char *v293;
  uint64_t v294;
  const char *v295;
  const char *v296;
  const char *v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  const char *v309;
  const char *v310;
  const char *v311;
  const char *v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  const char *v316;
  uint64_t v317;
  const char *v318;
  uint64_t v319;
  const char *v320;
  uint64_t v321;
  const char *v322;
  uint64_t v323;
  const char *v324;
  const char *v325;
  const char *v326;
  const char *v327;
  uint64_t v328;
  const char *v329;
  const char *v330;
  uint64_t v331;
  const char *v332;
  uint64_t v333;
  const char *v334;
  uint64_t v335;
  const char *v336;
  uint64_t v337;
  const char *v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  const char *v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  const char *v346;
  uint64_t v347;
  const char *v348;
  const char *v349;
  const char *v350;
  const char *v351;
  const char *v352;
  uint64_t v353;
  const char *v354;
  uint64_t v355;
  const char *v356;
  uint64_t v357;
  const char *v358;
  uint64_t v359;
  const char *v360;
  uint64_t v361;
  const char *v362;
  const char *v363;
  const char *v364;
  int v365;
  const char *v366;
  const char *v367;
  const char *v368;
  const char *v369;
  int v370;
  const char *v371;
  const char *v372;
  const char *v373;
  int v374;
  const char *v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  const char *v379;
  uint64_t v380;
  const char *v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t i;
  const __CFString *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  __int16 v421;
  const char *v422;
  uint64_t v423;
  const char *v424;
  uint64_t v425;
  unsigned int v426;
  uint64_t v427;
  uint64_t v428;
  const char *v429;
  uint64_t v430;
  const char *v431;
  const char *v432;
  uint64_t v433;
  const char *v434;
  uint64_t v435;
  const char *v436;
  uint64_t v437;
  uint64_t j;
  int v439;
  const char *v440;
  uint64_t v441;
  const char *v442;
  const char *v443;
  void *v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  const char *v448;
  uint64_t v449;
  const char *v450;
  uint64_t v451;
  const char *v452;
  uint64_t v453;
  const __CFString *v454;
  const char *v455;
  uint64_t v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  const char *v468;
  uint64_t v469;
  const char *v470;
  uint64_t v471;
  const char *v472;
  uint64_t v473;
  const void *v474;
  const void *v475;
  const __CFString *v476;
  const char *v477;
  uint64_t v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  const __CFString *v483;
  int v484;
  const char *v485;
  uint64_t v486;
  const char *v487;
  uint64_t v488;
  const __CFString *v489;
  uint64_t v490;
  const char *v491;
  uint64_t v492;
  const char *v493;
  VFXCommonProfileProgramGeneratorMetal *v494;
  const __CFString *v495;
  int v496;
  const __CFString *v497;
  const __CFString *v498;
  const __CFString *v499;
  const __CFString *v500;
  void *v501;
  const char *v502;
  uint64_t v503;
  const char *v504;
  uint64_t v505;
  const char *v506;
  uint64_t v507;
  uint64_t v508;
  void *v509;
  const char *v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  const char *v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  void *v518;
  const char *v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  const char *v523;
  __CFString *v524;
  const char *v525;
  uint64_t v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  const char *v531;
  uint64_t v532;
  void *v533;
  const char *v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  const char *v538;
  uint64_t v539;
  void *v540;
  unsigned int v541;
  const char *v542;
  uint64_t v543;
  void *v544;
  const char *v545;
  uint64_t v546;
  uint64_t v547;
  const char *v548;
  const void *v549;
  const char *v550;
  uint64_t v551;
  uint64_t v552;
  const char *v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  const char *v562;
  uint64_t v563;
  uint64_t v564;
  const char *v565;
  const char *v566;
  uint64_t v567;
  const char *v568;
  uint64_t v569;
  const char *v570;
  uint64_t v571;
  const char *v572;
  uint64_t v573;
  void *v574;
  const char *v575;
  uint64_t v576;
  const char *v577;
  uint64_t v578;
  const char *v579;
  uint64_t v580;
  const void *v581;
  const char *v582;
  uint64_t v583;
  int v584;
  int v585;
  __CFXFXProgram *v586;
  const void *v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  uint64_t v595;
  const char *v596;
  uint64_t v597;
  uint64_t v598;
  const __CFString *v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  int v603;
  int v604;
  int v605;
  int v606;
  __int16 v607;
  char v608;
  int v609;
  int v610;
  unint64_t v611;
  int v612;
  unsigned int v613;
  __int16 v614;
  uint64_t v615;
  unsigned int v616;
  __CFXEngineContext *v617;
  int v618;
  __int16 v620;
  int v621;
  unsigned int v622;
  uint64_t v623;
  __CFXProgramHashCode *v624;
  __CFXProgramHashCode *v625;
  void *v626;
  __int128 v627;
  __int128 v628;
  __int128 v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  __int128 v634;
  __int128 v635;
  __int128 v636;
  __int128 v637;
  __int128 v638;
  __int128 v639;
  __int128 v640;
  _QWORD v641[5];
  _QWORD v642[5];
  _QWORD v643[5];
  _QWORD v644[8];
  __int128 v645;
  uint64_t v646;
  uint64_t v647;
  uint64_t v648;
  const __CFString *v649;
  const __CFString *v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  const __CFString *v654;
  uint64_t v655;
  const __CFString *v656;
  const __CFString *v657;
  _QWORD v658[3];
  _OWORD v659[16];
  _OWORD v660[16];
  _OWORD v661[16];
  uint64_t v662;

  v662 = *MEMORY[0x1E0C80C00];
  v639 = 0u;
  v640 = 0u;
  v637 = 0u;
  v638 = 0u;
  v635 = 0u;
  v636 = 0u;
  v633 = 0u;
  v634 = 0u;
  v631 = 0u;
  v632 = 0u;
  v629 = 0u;
  v630 = 0u;
  v627 = 0u;
  v628 = 0u;
  v625 = a3;
  v7 = (void *)objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], a2, 0, (uint64_t)a4, a5);
  v626 = v7;
  v10 = 0;
  if (sub_1B18B864C())
  {
    v10 = (void *)objc_msgSend_setWithCapacity_(MEMORY[0x1E0C99E20], v8, 0, v9);
    *(_QWORD *)&v627 = v10;
  }
  *(_QWORD *)&v631 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v8, 0, v9);
  *(_QWORD *)&v628 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v11, 0, v12);
  *((_QWORD *)&v628 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v13, 0, v14);
  *((_QWORD *)&v631 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v15, 0, v16);
  *(_QWORD *)&v632 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v17, 0, v18);
  *((_QWORD *)&v632 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v19, 0, v20);
  *(_QWORD *)&v633 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v21, 0, v22);
  *((_QWORD *)&v633 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v23, 0, v24);
  *((_QWORD *)&v634 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v25, 0, v26);
  *(_QWORD *)&v635 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v27, 0, v28);
  *(_QWORD *)&v636 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v29, 0, v30);
  *((_QWORD *)&v636 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v31, 0, v32);
  *(_QWORD *)&v637 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v33, 0, v34);
  *((_QWORD *)&v637 + 1) = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v35, 0, v36);
  *(_QWORD *)&v638 = objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v37, 0, v38);
  v39 = sub_1B1956EA0((uint64_t)a3);
  v40 = sub_1B1956DAC((uint64_t)a3, 6u);
  v605 = sub_1B1956DAC((uint64_t)a3, 3u);
  v608 = sub_1B1956E34((uint64_t)a3);
  v609 = sub_1B1956E4C((uint64_t)a3);
  v621 = sub_1B1956DF0((uint64_t)a3);
  v41 = sub_1B1956D98((uint64_t)a3);
  v42 = v41;
  v43 = v41;
  v616 = sub_1B1956D7C((uint64_t)a3);
  v618 = (v616 & 4) != 0 && sub_1B1815AD8((uint64_t)a4, 16);
  v606 = v40;
  v607 = sub_1B1956DA0((uint64_t)a3, 1u);
  v614 = v43;
  BYTE11(v638) = v40 | ((v43 & 0x10) >> 4);
  v44 = sub_1B1956EB0((uint64_t)a3);
  v45 = sub_1B1956EA8((uint64_t)a3);
  if (v44)
  {
    v48 = v45;
    if (!objc_msgSend_objectForKeyedSubscript_(v7, v46, (uint64_t)CFSTR("USE_POSITION"), v47))
      objc_msgSend_setObject_forKeyedSubscript_(v7, v49, (uint64_t)&unk_1E6478370, (uint64_t)CFSTR("USE_POSITION"));
    v51 = objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], v49, v48, v50);
    objc_msgSend_setObject_forKeyedSubscript_(v7, v52, v51, (uint64_t)CFSTR("USE_MULTIPLE_RENDERING"));
    v53 = sub_1B1956EBC((uint64_t)a3);
    if (v53 == 2)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v7, v46, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_VERTEX_AMPLIFICATION"));
    }
    else if (v53 == 1)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v7, v46, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_INSTANCING"));
    }
    if (v44 == 1)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v7, v46, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_LAYERED_RENDERING"));
    }
    else if (v44 == 2)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v7, v46, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_MULTIPLE_VIEWPORTS_RENDERING"));
    }
  }
  if (v10)
  {
    objc_msgSend_addObject_(v10, v46, (uint64_t)CFSTR("USE_MULTIPLE_RENDERING"), v47);
    objc_msgSend_addObject_(v10, v54, (uint64_t)CFSTR("USE_VERTEX_AMPLIFICATION"), v55);
    objc_msgSend_addObject_(v10, v56, (uint64_t)CFSTR("USE_INSTANCING"), v57);
    objc_msgSend_addObject_(v10, v58, (uint64_t)CFSTR("USE_LAYERED_RENDERING"), v59);
    objc_msgSend_addObject_(v10, v60, (uint64_t)CFSTR("USE_MULTIPLE_VIEWPORTS_RENDERING"), v61);
  }
  if (sub_1B1956E7C((uint64_t)a3))
    objc_msgSend_setObject_forKeyedSubscript_(v7, v62, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_IBL_TRANSFORM"));
  v63 = sub_1B189EAF0();
  v64 = sub_1B1957134((uint64_t)a3);
  if (v63 <= v64)
    v65 = v64;
  else
    v65 = v63;
  v620 = v39;
  if ((v44 == 2 || v44 == 1) && v65 <= 0x20001)
    v65 = 131073;
  v611 = v65;
  v617 = a4;
  v610 = sub_1B1814F00((uint64_t)a4);
  memset(v661, 0, sizeof(v661));
  v624 = a3;
  v66 = sub_1B19570B0((uint64_t)a3, 0, (uint64_t)v661, 32);
  memset(v660, 0, sizeof(v660));
  v67 = sub_1B19570B0((uint64_t)v625, 1u, (uint64_t)v660, 32);
  memset(v659, 0, sizeof(v659));
  v68 = sub_1B19570B0((uint64_t)v625, 2u, (uint64_t)v659, 32);
  *((_QWORD *)&v635 + 1) = 0;
  v75 = sub_1B19570B0((uint64_t)v625, 3u, (uint64_t)&v635 + 8, 1);
  if (v75 >= 2)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: cannot handle more than one lighting modifier"), v69, v70, v71, v72, v73, v74, v595);
    v75 = 1;
  }
  if (v66 >= 2)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: cannot handle more than one lighting modifier"), v69, v70, v71, v72, v73, v74, v595);
    v66 = 1;
  }
  if (v67 >= 2)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: cannot handle more than one lighting modifier"), v69, v70, v71, v72, v73, v74, v595);
    v67 = 1;
  }
  if (v68 >= 2)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: cannot handle more than one lighting modifier"), v69, v70, v71, v72, v73, v74, v595);
    v68 = 1;
  }
  sub_1B181A5B8(v626, (uint64_t)v661, v66, v70, v71, v72, v73, v74);
  sub_1B181A5B8(v626, (uint64_t)v660, v67, v76, v77, v78, v79, v80);
  sub_1B181A5B8(v626, (uint64_t)v659, v68, v81, v82, v83, v84, v85);
  sub_1B181A5B8(v626, (uint64_t)&v635 + 8, v75, v86, v87, v88, v89, v90);
  sub_1B17D627C((uint64_t)&v625, (uint64_t)v661, v66, v91, v92, v93, v94, v95);
  sub_1B17D627C((uint64_t)&v625, (uint64_t)v660, v67, v96, v97, v98, v99, v100);
  sub_1B17D627C((uint64_t)&v625, (uint64_t)v659, v68, v101, v102, v103, v104, v105);
  sub_1B17D627C((uint64_t)&v625, (uint64_t)&v635 + 8, v75, v106, v107, v108, v109, v110);
  v111 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  sub_1B17D61EC((uint64_t)v111, (const char *)v661, v66, v112, v113, v114, v115, v116);
  sub_1B17D61EC((uint64_t)v111, (const char *)v660, v67, v117, v118, v119, v120, v121);
  sub_1B17D61EC((uint64_t)v111, (const char *)v659, v68, v122, v123, v124, v125, v126);
  sub_1B17D61EC((uint64_t)v111, (const char *)&v635 + 8, v75, v127, v128, v129, v130, v131);
  v132 = MEMORY[0x1E0C809B0];
  v643[0] = MEMORY[0x1E0C809B0];
  v643[1] = 3221225472;
  v643[2] = sub_1B17D9904;
  v643[3] = &unk_1E63D5798;
  v643[4] = &v625;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v111, v133, (uint64_t)v643, v134);

  sub_1B181A62C((uint64_t *)v659, v68, v135, v136, v137, v138, v139, v140);
  sub_1B181A62C((uint64_t *)v660, v67, v141, v142, v143, v144, v145, v146);
  sub_1B181A62C((uint64_t *)v661, v66, v147, v148, v149, v150, v151, v152);
  sub_1B181A62C((uint64_t *)&v635 + 1, v75, v153, v154, v155, v156, v157, v158);
  if (v66)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v159, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_GEOMETRY_MODIFIER"));
    sub_1B17D9934((uint64_t)&v625, 0, (uint64_t *)v661, v161, v162, v163, v164, v165);
  }
  v166 = v614;
  if (v67)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v159, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_SURFACE_MODIFIER"));
    sub_1B17D9934((uint64_t)&v625, 1, (uint64_t *)v660, v167, v168, v169, v170, v171);
  }
  if (v68)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v159, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_FRAGMENT_MODIFIER"));
    sub_1B17D9934((uint64_t)&v625, 2, (uint64_t *)v659, v172, v173, v174, v175, v176);
  }
  v177 = v620;
  if (v75)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v159, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_LIGHT_MODIFIER"));
    sub_1B17D9934((uint64_t)&v625, 3, (uint64_t *)&v635 + 1, v178, v179, v180, v181, v182);
  }
  v183 = (uint64_t)v624;
  if ((_QWORD)v627)
  {
    objc_msgSend_addObject_((void *)v627, v159, (uint64_t)CFSTR("USE_GEOMETRY_MODIFIER"), v160);
    objc_msgSend_addObject_((void *)v627, v184, (uint64_t)CFSTR("USE_SURFACE_MODIFIER"), v185);
    objc_msgSend_addObject_((void *)v627, v186, (uint64_t)CFSTR("USE_FRAGMENT_MODIFIER"), v187);
    objc_msgSend_addObject_((void *)v627, v188, (uint64_t)CFSTR("USE_LIGHT_MODIFIER"), v189);
    v642[0] = v132;
    v642[1] = 3221225472;
    v642[2] = sub_1B17D9A34;
    v642[3] = &unk_1E63D57B8;
    v642[4] = &v625;
    sub_1B19B94DC((uint64_t)v642);
    v190 = (const __CFDictionary *)sub_1B19E0958();
    v641[0] = v132;
    v641[1] = 3221225472;
    v641[2] = sub_1B17D9A44;
    v641[3] = &unk_1E63D57D8;
    v641[4] = &v625;
    sub_1B17A04DC(v190, (uint64_t)v641);
  }
  if (objc_msgSend_objectForKeyedSubscript_(v626, v159, (uint64_t)CFSTR("USE_MODIFIER_FRAMEBUFFER_COLOR0"), v160))
  {
    if (sub_1B1815AD8((uint64_t)v617, 2048))
      objc_msgSend_setObject_forKeyedSubscript_(v626, v193, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("CFX_SUPPORTS_PROGRAMMABLE_BLENDING"));
    else
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Invalid shader modifier: programmable blending is not supported by this device"), v194, v195, v196, v197, v198, v199, v595);
  }
  if ((_QWORD)v627)
  {
    objc_msgSend_addObject_((void *)v627, v191, (uint64_t)CFSTR("USE_MODIFIER_FRAMEBUFFER_COLOR0"), v192);
    objc_msgSend_addObject_((void *)v627, v200, (uint64_t)CFSTR("CFX_SUPPORTS_PROGRAMMABLE_BLENDING"), v201);
  }
  v202 = v42 & 0xF;
  if (objc_msgSend_objectForKeyedSubscript_(v626, v191, (uint64_t)CFSTR("USE_CLIP_DISTANCE3"), v192))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v203, (uint64_t)CFSTR("4"), (uint64_t)CFSTR("USE_CLIP_DISTANCE_COUNT"));
    v207 = 4;
LABEL_60:
    v615 = v207;
    goto LABEL_61;
  }
  if (objc_msgSend_objectForKeyedSubscript_(v626, v203, (uint64_t)CFSTR("USE_CLIP_DISTANCE2"), v204))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v208, (uint64_t)CFSTR("3"), (uint64_t)CFSTR("USE_CLIP_DISTANCE_COUNT"));
    v207 = 3;
    goto LABEL_60;
  }
  if (objc_msgSend_objectForKeyedSubscript_(v626, v208, (uint64_t)CFSTR("USE_CLIP_DISTANCE1"), v209))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v210, (uint64_t)CFSTR("2"), (uint64_t)CFSTR("USE_CLIP_DISTANCE_COUNT"));
    v207 = 2;
    goto LABEL_60;
  }
  if (objc_msgSend_objectForKeyedSubscript_(v626, v210, (uint64_t)CFSTR("USE_CLIP_DISTANCE0"), v211))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v205, (uint64_t)CFSTR("1"), (uint64_t)CFSTR("USE_CLIP_DISTANCE_COUNT"));
    v207 = 1;
    goto LABEL_60;
  }
  v615 = 0;
LABEL_61:
  if (v202 == 3)
  {
    v212 = 0;
    v213 = 1;
    BYTE11(v638) = 1;
  }
  else
  {
    v212 = 0;
    if ((v614 & 0xD) != 0)
      v213 = v621;
    else
      v213 = 0;
    if (v202 == 1 && v213)
    {
      v212 = sub_1B1956DBC((uint64_t)v624, 2u);
      v213 = 1;
    }
  }
  if (objc_msgSend_objectForKeyedSubscript_(v626, v205, (uint64_t)CFSTR("USE_SPECULAR"), v206))
    v215 = 1;
  else
    v215 = v212;
  if (v215 == 1)
  {
    if (BYTE11(v638))
      objc_msgSend_setObject_forKeyedSubscript_(v626, v214, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_VIEW"));
    else
      objc_msgSend_setObject_forKeyedSubscript_(v626, v214, (uint64_t)&unk_1E6478370, (uint64_t)CFSTR("USE_VIEW"));
    if (BYTE11(v638))
      objc_msgSend_setObject_forKeyedSubscript_(v626, v216, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_SHININESS"));
    else
      objc_msgSend_setObject_forKeyedSubscript_(v626, v216, (uint64_t)&unk_1E6478370, (uint64_t)CFSTR("USE_SHININESS"));
  }
  BYTE10(v638) = 0;
  WORD4(v638) = 0;
  HIDWORD(v638) = 0;
  BYTE8(v640) = 1;
  v223 = sub_1B1956DFC((uint64_t)v624);
  v224 = CFSTR("USE_CONSTANT");
  if (!v202 || v202 == 2)
    goto LABEL_83;
  if (v202 == 4)
  {
    v224 = CFSTR("USE_SHADOWONLY");
LABEL_83:
    objc_msgSend_setObject_forKeyedSubscript_(v626, v217, (uint64_t)&stru_1E63FD500, (uint64_t)v224);
  }
  v612 = v213;
  v613 = v202;
  if (!v213)
    goto LABEL_178;
  if (*((_QWORD *)&v635 + 1))
  {
    v225 = sub_1B19B932C(*((uint64_t *)&v635 + 1), (uint64_t)v217, v218, (uint64_t)v224, v219, v220, v221, v222);
    if (v225)
      objc_msgSend_appendString_((void *)v635, v217, v225, v226);
  }
  if (v202 == 3)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v217, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_PBR"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v227, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_VIEW"));
  }
  v228 = sub_1B1956E2C((uint64_t)v624);
  v229 = sub_1B1956D84((uint64_t)v624);
  if (!v229)
    goto LABEL_168;
  v603 = v223;
  v604 = v215;
  v231 = 0;
  v232 = v229;
  v622 = v228;
  do
  {
    if (((v228 >> v231) & 1) != 0)
    {
      v233 = sub_1B1956D8C((uint64_t)v625, (unsigned __int16)v231);
      v234 = v233;
      v235 = (v233 & 6) == 2 && (v233 >> 3) & 1;
      v236 = (v233 >> 15) & 7;
      v237 = v236 > 1 && (v233 >> 19) & 1;
      v238 = v233 & 7;
      if ((v233 & 7) != 0)
      {
        v239 = v233;
        sub_1B1956D98((uint64_t)v625);
        if (v235)
        {
          if (BYTE11(v638))
            v242 = 184;
          else
            v242 = 176;
          objc_msgSend_appendFormat_(*(__CFXProgramHashCode **)((char *)&v625 + v242), v240, (uint64_t)CFSTR(", texture2d<half> u_goboTexture%d\n"), v241, v231);
          v595 = v231;
          objc_msgSend_appendFormat_(*(__CFXProgramHashCode **)((char *)&v625 + v242), v243, (uint64_t)CFSTR(", sampler u_goboTexture%dSampler\n"), v244);
        }
        v245 = (v234 >> 7) & 7;
        if (v238 == 2)
        {
          v246 = (v234 & 0x10) != 0 || v235;
        }
        else
        {
          if (v238 == 5)
          {
            if (v245 == 4)
              objc_msgSend_appendFormat_(*((void **)&v637 + 1), v240, (uint64_t)CFSTR(", device packed_float2* u_areaPolygonPositions%d\n"), v241, v231);
          }
          else if (v238 == 6)
          {
            objc_msgSend_appendFormat_(*((void **)&v637 + 1), v240, (uint64_t)CFSTR(", texture2d<half> u_iesTexture%d\n"), v241, v231);
          }
          v246 = 1;
        }
        v247 = (v239 >> 10) & 0x1F;
        BYTE8(v638) |= v246;
        BYTE9(v638) |= (v234 & 0x10) >> 4;
        v248 = HIDWORD(v638);
        if (HIDWORD(v638) <= v247)
          v248 = v247;
        HIDWORD(v638) = v248;
        if (sub_1B1956EB0((uint64_t)v625))
        {
          v251 = sub_1B1956EBC((uint64_t)v625);
          if (v251 == 1)
          {
            if (BYTE11(v638))
              v259 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v252, (uint64_t)CFSTR("USE_MULTIPLE_RENDERING * %d + in.sliceIndex"), v254, v231);
            else
              v259 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v252, (uint64_t)CFSTR("USE_MULTIPLE_RENDERING * %d + out.sliceIndex"), v254, v231);
          }
          else if (v251 == 2)
          {
            v259 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v252, (uint64_t)CFSTR("USE_MULTIPLE_RENDERING * %d + amplificationID"), v254, v231);
          }
          else
          {
            sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Multiple rendering is lacking a multiple output vertex streams generator"), v253, v254, v255, v256, v257, v258, v595);
            v259 = 0;
          }
        }
        else
        {
          v259 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v249, (uint64_t)CFSTR("%d"), v250, v231);
        }
        switch(v238)
        {
          case 1:
            if ((v234 & 0x10) != 0 && BYTE8(v640))
              objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_omni(vfx_lights[%@], %s, u_shadowKernel, %d);\n"),
                v262,
                v259,
                "u_shadowTexture",
                v247,
                v598,
                v601,
                v602);
            else
              objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_omni(vfx_lights[%@]);\n"),
                v262,
                v259,
                v596,
                v597,
                v598,
                v601,
                v602);
            goto LABEL_153;
          case 2:
            if (v235)
            {
              objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_directional(vfx_lights[%@], u_goboTexture%d, u_goboTexture%dSampler);\n"),
                v262,
                v259,
                v231,
                v231,
                v598,
                v601,
                v602);
LABEL_153:
              v228 = v622;
              break;
            }
            if ((v234 & 0x10) == 0)
            {
              objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_directional(vfx_lights[%@]);\n"),
                v262,
                v259,
                v596,
                v597,
                v598,
                v601,
                v602);
              goto LABEL_153;
            }
            if (v236 >= 2)
            {
              v267 = "true";
              if ((v234 & 0x40000) != 0)
                v268 = "true";
              else
                v268 = "false";
              if (!v237)
                v267 = "false";
              objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_directional(vfx_lights[%@], %s, %d, %s, u_shadowKernel, %d, %s);\n"),
                v262,
                v259,
                "u_shadowTexture",
                v236,
                v268,
                v247,
                v267);
              goto LABEL_153;
            }
            v228 = v622;
            if (v247 < 2)
            {
              v596 = "u_shadowTexture";
              objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_directional(vfx_lights[%@], %s);\n"),
                v262,
                v259);
            }
            else
            {
              v596 = "u_shadowTexture";
              v597 = v247;
              objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_directional(vfx_lights[%@], %s, u_shadowKernel, %d);\n"),
                v262,
                v259);
            }
            break;
          case 3:
            if (v235)
            {
              objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_spot(vfx_lights[%@], u_goboTexture%d, u_goboTexture%dSampler);\n"),
                v262,
                v259,
                v231,
                v231,
                v598,
                v601,
                v602);
            }
            else if ((v234 & 0x10) != 0)
            {
              objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_spot(vfx_lights[%@], %s, u_shadowKernel, %d);\n"),
                v262,
                v259,
                "u_shadowTexture",
                v247,
                v598,
                v601,
                v602);
            }
            else
            {
              objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_spot(vfx_lights[%@]);\n"),
                v262,
                v259,
                v596,
                v597,
                v598,
                v601,
                v602);
            }
            goto LABEL_153;
          case 5:
            v228 = v622;
            switch((int)v245)
            {
              case 0:
                objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_area_line(vfx_lights[%@], u_areaLightBakedDataTexture);\n"),
                  v262,
                  v259);
                break;
              case 1:
                objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_area_rectangle(vfx_lights[%@], u_areaLightBakedDataTexture);\n"),
                  v262,
                  v259);
                break;
              case 2:
                objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_area_ellipse(vfx_lights[%@], u_areaLightBakedDataTexture);\n"),
                  v262,
                  v259);
                break;
              case 3:
                objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_area_ellipsoid(vfx_lights[%@], u_areaLightBakedDataTexture);\n"),
                  v262,
                  v259);
                break;
              case 4:
                v596 = (const char *)v231;
                objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_area_polygon(vfx_lights[%@], u_areaLightBakedDataTexture, u_areaPolygonPositions%d);\n"),
                  v262,
                  v259);
                break;
              default:
                goto LABEL_154;
            }
            break;
          case 6:
            if ((v234 & 0x10) != 0)
              objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_ies(vfx_lights[%@], u_iesTexture%d, %s, u_shadowKernel, %d);\n"),
                v262,
                v259,
                v231,
                "u_shadowTexture",
                v247,
                v601,
                v602);
            else
              objc_msgSend_appendFormat_(*((void **)&v634 + 1), v260, (uint64_t)CFSTR("\t_lightingContribution.add_ies(vfx_lights[%@], u_iesTexture%d);\n"),
                v262,
                v259,
                v231,
                v597,
                v598,
                v601,
                v602);
            goto LABEL_153;
          default:
            sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Infinite lights can only be dir or unranged omni"), v261, v262, v263, v264, v265, v266, (uint64_t)"0");
            goto LABEL_153;
        }
      }
    }
LABEL_154:
    ++v231;
  }
  while (v232 != v231);
  v269 = 0;
  v183 = (uint64_t)v624;
  v177 = v620;
  v166 = v614;
  v202 = v613;
  v223 = v603;
  v215 = v604;
  while ((sub_1B1956D8C((uint64_t)v625, (unsigned __int16)v269) & 0x10) == 0)
  {
    if (v232 == ++v269)
      goto LABEL_168;
  }
  objc_msgSend_appendFormat_(*((void **)&v637 + 1), v230, (uint64_t)CFSTR(", depth2d<float> u_shadowTexture\n"), v270);
LABEL_168:
  objc_msgSend_setObject_forKeyedSubscript_(v626, v230, (uint64_t)CFSTR("1"), (uint64_t)CFSTR("CFX_USE_ATLAS_FOR_SHADOW_MAP"));
  objc_msgSend_setObject_forKeyedSubscript_(v626, v271, (uint64_t)CFSTR("uchar"), (uint64_t)CFSTR("CFXLightIndexType"));
  objc_msgSend_setObject_forKeyedSubscript_(v626, v272, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("CFX_USE_TEXTURE_FOR_LIGHT_INDICES"));
  v213 = v612;
  if (sub_1B1956E14(v183))
  {
    if (sub_1B1815AD8((uint64_t)v617, 256))
      objc_msgSend_setObject_forKeyedSubscript_(v626, v274, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("CFX_SUPPORT_CUBE_ARRAY"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v274, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("CFX_USE_REFLECTION_PROBES"));
  }
  if (*((_QWORD *)&v635 + 1))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v273, (uint64_t)CFSTR("VFXShadingModelCustom"), (uint64_t)CFSTR("LIGHTING_MODEL"));
  }
  else
  {
    v275 = sub_1B1841124(v202);
    objc_msgSend_setObject_forKeyedSubscript_(v626, v276, (uint64_t)v275, (uint64_t)CFSTR("LIGHTING_MODEL"));
  }
  if ((sub_1B1956E08(v183) & 1) != 0 || sub_1B1956E14(v183))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v217, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_CLUSTERED_LIGHTING"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v277, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_POSITION"));
  }
LABEL_178:
  if ((_QWORD)v627)
  {
    objc_msgSend_addObject_((void *)v627, v217, (uint64_t)CFSTR("USE_PBR"), (uint64_t)v224);
    objc_msgSend_addObject_((void *)v627, v278, (uint64_t)CFSTR("USE_SHADOWONLY"), v279);
    objc_msgSend_addObject_((void *)v627, v280, (uint64_t)CFSTR("CFX_USE_TEXTURE_FOR_LIGHT_INDICES"), v281);
    objc_msgSend_addObject_((void *)v627, v282, (uint64_t)CFSTR("CFX_SUPPORT_CUBE_ARRAY"), v283);
    objc_msgSend_addObject_((void *)v627, v284, (uint64_t)CFSTR("CFX_USE_REFLECTION_PROBES"), v285);
    objc_msgSend_addObject_((void *)v627, v286, (uint64_t)CFSTR("LIGHTING_MODEL"), v287);
    objc_msgSend_addObject_((void *)v627, v288, (uint64_t)CFSTR("USE_CLUSTERED_LIGHTING"), v289);
  }
  if (v202 == 2 && (v166 & 0x280) != 0)
    BYTE11(v638) = 1;
  if (sub_1B1956E70(v183))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v290, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_FOG"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v291, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_POSITION"));
  }
  if ((v213 & ((v177 & 8) >> 3)) == 1)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v290, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_SSAO"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v292, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_POSITION"));
  }
  if (sub_1B1956DBC(v183, 0x12u)
    && sub_1B1956DBC(v183, 0x13u)
    && sub_1B1956DBC(v183, 3u))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v293, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_FRESNEL"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v295, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_VIEW"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v296, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_NORMAL"));
  }
  if ((v213 & ((v166 & 0x40) != 0)) == 1)
    objc_msgSend_setObject_forKeyedSubscript_(v626, v293, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("AVOID_OVERLIGHTING"));
  if (v223)
    objc_msgSend_setObject_forKeyedSubscript_(v626, v293, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_AMBIENT_LIGHTING"));
  if ((_QWORD)v627)
  {
    objc_msgSend_addObject_((void *)v627, v293, (uint64_t)CFSTR("USE_FOG"), v294);
    objc_msgSend_addObject_((void *)v627, v297, (uint64_t)CFSTR("USE_SSAO"), v298);
    objc_msgSend_addObject_((void *)v627, v299, (uint64_t)CFSTR("USE_FRESNEL"), v300);
    objc_msgSend_addObject_((void *)v627, v301, (uint64_t)CFSTR("AVOID_OVERLIGHTING"), v302);
    objc_msgSend_addObject_((void *)v627, v303, (uint64_t)CFSTR("USE_AMBIENT_LIGHTING"), v304);
  }
  if (v213)
  {
    v305 = sub_1B1956E20(v183);
    if ((_DWORD)v305)
    {
      v308 = objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], v306, v305, v307);
      objc_msgSend_setObject_forKeyedSubscript_(v626, v309, v308, (uint64_t)CFSTR("USE_PROBES_LIGHTING"));
    }
    objc_msgSend_setObject_forKeyedSubscript_(v626, v306, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_LIGHTING"));
    if (BYTE11(v638))
    {
      objc_msgSend_setObject_forKeyedSubscript_(v626, v310, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_PER_PIXEL_LIGHTING"));
      objc_msgSend_setObject_forKeyedSubscript_(v626, v311, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_NORMAL"));
      if (((BYTE8(v638) == 0) & ~v215) == 0)
        objc_msgSend_setObject_forKeyedSubscript_(v626, v293, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_POSITION"));
      if (BYTE10(v638))
        objc_msgSend_setObject_forKeyedSubscript_(v626, v293, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_MODULATE"));
    }
    else
    {
      objc_msgSend_setObject_forKeyedSubscript_(v626, v310, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_PER_VERTEX_LIGHTING"));
      if (!objc_msgSend_objectForKeyedSubscript_(v626, v312, (uint64_t)CFSTR("USE_NORMAL"), v313))
        objc_msgSend_setObject_forKeyedSubscript_(v626, v314, (uint64_t)&unk_1E6478370, (uint64_t)CFSTR("USE_NORMAL"));
      if (!objc_msgSend_objectForKeyedSubscript_(v626, v314, (uint64_t)CFSTR("USE_VIEW"), v315))
        objc_msgSend_setObject_forKeyedSubscript_(v626, v316, (uint64_t)&unk_1E6478370, (uint64_t)CFSTR("USE_VIEW"));
      if (!objc_msgSend_objectForKeyedSubscript_(v626, v316, (uint64_t)CFSTR("USE_POSITION"), v317))
        objc_msgSend_setObject_forKeyedSubscript_(v626, v293, (uint64_t)&unk_1E6478370, (uint64_t)CFSTR("USE_POSITION"));
    }
  }
  if ((_QWORD)v627)
  {
    objc_msgSend_addObject_((void *)v627, v293, (uint64_t)CFSTR("USE_PROBES_LIGHTING"), v294);
    objc_msgSend_addObject_((void *)v627, v318, (uint64_t)CFSTR("USE_LIGHTING"), v319);
    objc_msgSend_addObject_((void *)v627, v320, (uint64_t)CFSTR("USE_PER_PIXEL_LIGHTING"), v321);
    objc_msgSend_addObject_((void *)v627, v322, (uint64_t)CFSTR("USE_PER_VERTEX_LIGHTING"), v323);
  }
  if (sub_1B1956E64(v183))
    objc_msgSend_setObject_forKeyedSubscript_(v626, v324, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("HAS_NORMAL"));
  if ((v616 & 2) != 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v324, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("HAS_VERTEX_COLOR"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v325, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_VERTEX_COLOR"));
  }
  if (sub_1B1956E88(v183))
    objc_msgSend_setObject_forKeyedSubscript_(v626, v326, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_INSTANCING"));
  if (sub_1B1956E94(v183))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v327, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_POSITION"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v329, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_POINT_RENDERING"));
    if ((v177 & 0x20) != 0)
      goto LABEL_221;
LABEL_225:
    if ((v177 & 4) == 0)
      goto LABEL_226;
LABEL_222:
    objc_msgSend_setObject_forKeyedSubscript_(v626, v327, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_LASTFRAMETRANSFORM"));
    if ((v177 & 0x800) == 0)
      goto LABEL_228;
LABEL_227:
    objc_msgSend_setObject_forKeyedSubscript_(v626, v327, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_MOTIONBLUR"));
    goto LABEL_228;
  }
  if ((v177 & 0x20) == 0)
    goto LABEL_225;
LABEL_221:
  objc_msgSend_setObject_forKeyedSubscript_(v626, v327, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("DISABLE_SPECULAR"));
  if ((v177 & 4) != 0)
    goto LABEL_222;
LABEL_226:
  if ((v177 & 0x800) != 0)
    goto LABEL_227;
LABEL_228:
  if ((_QWORD)v627)
  {
    objc_msgSend_addObject_((void *)v627, v327, (uint64_t)CFSTR("HAS_NORMAL"), v328);
    objc_msgSend_addObject_((void *)v627, v330, (uint64_t)CFSTR("HAS_VERTEX_COLOR"), v331);
    objc_msgSend_addObject_((void *)v627, v332, (uint64_t)CFSTR("USE_VERTEX_COLOR"), v333);
    objc_msgSend_addObject_((void *)v627, v334, (uint64_t)CFSTR("USE_INSTANCING"), v335);
    objc_msgSend_addObject_((void *)v627, v336, (uint64_t)CFSTR("USE_POINT_RENDERING"), v337);
    objc_msgSend_addObject_((void *)v627, v338, (uint64_t)CFSTR("DISABLE_LINEAR_RENDERING"), v339);
    objc_msgSend_addObject_((void *)v627, v340, (uint64_t)CFSTR("DISABLE_SPECULAR"), v341);
    objc_msgSend_addObject_((void *)v627, v342, (uint64_t)CFSTR("USE_SKINNING"), v343);
    objc_msgSend_addObject_((void *)v627, v344, (uint64_t)CFSTR("USE_MOTIONBLUR"), v345);
    objc_msgSend_addObject_((void *)v627, v346, (uint64_t)CFSTR("USE_LASTFRAMETRANSFORM"), v347);
  }
  if ((v177 & 0x40) != 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v327, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_COLOR1_OUTPUT"));
    if ((v177 & 1) != 0)
      goto LABEL_246;
LABEL_232:
    if ((v177 & 2) == 0)
      goto LABEL_233;
LABEL_247:
    objc_msgSend_setObject_forKeyedSubscript_(v626, v327, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_REFLECTANCE_ROUGHNESS_OUTPUT"));
    if ((v177 & 0x80) != 0)
      goto LABEL_248;
LABEL_234:
    if ((v177 & 0x10) == 0)
      goto LABEL_235;
LABEL_249:
    objc_msgSend_setObject_forKeyedSubscript_(v626, v327, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_OUTLINE"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v367, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_MODELTRANSFORM"));
    if ((v177 & 0x200) != 0)
    {
LABEL_236:
      objc_msgSend_setObject_forKeyedSubscript_(v626, v327, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_NORMAL"));
      objc_msgSend_setObject_forKeyedSubscript_(v626, v348, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_POSITION"));
      objc_msgSend_setObject_forKeyedSubscript_(v626, v349, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_MODELTRANSFORM"));
      objc_msgSend_setObject_forKeyedSubscript_(v626, v350, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_GBUFFER_OUTPUT"));
      objc_msgSend_setObject_forKeyedSubscript_(v626, v351, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_LASTFRAMETRANSFORM"));
    }
  }
  else
  {
    if ((v177 & 1) == 0)
      goto LABEL_232;
LABEL_246:
    objc_msgSend_setObject_forKeyedSubscript_(v626, v327, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_NORMAL"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v366, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_NORMALS_OUTPUT"));
    if ((v177 & 2) != 0)
      goto LABEL_247;
LABEL_233:
    if ((v177 & 0x80) == 0)
      goto LABEL_234;
LABEL_248:
    objc_msgSend_setObject_forKeyedSubscript_(v626, v327, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_RADIANCE_OUTPUT"));
    if ((v177 & 0x10) != 0)
      goto LABEL_249;
LABEL_235:
    if ((v177 & 0x200) != 0)
      goto LABEL_236;
  }
  if ((_QWORD)v627)
  {
    objc_msgSend_addObject_((void *)v627, v327, (uint64_t)CFSTR("USE_COLOR1_OUTPUT"), v328);
    objc_msgSend_addObject_((void *)v627, v352, (uint64_t)CFSTR("USE_NORMALS_OUTPUT"), v353);
    objc_msgSend_addObject_((void *)v627, v354, (uint64_t)CFSTR("USE_REFLECTANCE_ROUGHNESS_OUTPUT"), v355);
    objc_msgSend_addObject_((void *)v627, v356, (uint64_t)CFSTR("USE_RADIANCE_OUTPUT"), v357);
    objc_msgSend_addObject_((void *)v627, v358, (uint64_t)CFSTR("USE_OUTLINE"), v359);
    objc_msgSend_addObject_((void *)v627, v360, (uint64_t)CFSTR("USE_GBUFFER_OUTPUT"), v361);
  }
  if (sub_1B1956DAC(v183, 7u))
  {
    sub_1B17D8B40((uint64_t)&v625, 7u, 7, 1);
    objc_msgSend_setObject_forKeyedSubscript_(v626, v362, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_AMBIENTOCCLUSION_MAP"));
  }
  sub_1B17D8B40((uint64_t)&v625, 1u, 1, 1);
  sub_1B17D8B40((uint64_t)&v625, 2u, 2, v215 | v605);
  sub_1B17D8B40((uint64_t)&v625, 8u, 8, 1);
  sub_1B17D8B40((uint64_t)&v625, 0, 0, 1);
  sub_1B17D8B40((uint64_t)&v625, 5u, 5, 1);
  sub_1B17D8B40((uint64_t)&v625, 6u, 6, v606);
  if (BYTE8(v627))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v363, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_TANGENT"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v364, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_BITANGENT"));
  }
  sub_1B17D8B40((uint64_t)&v625, 9u, 9, v202 == 3);
  sub_1B17D8B40((uint64_t)&v625, 0xAu, 10, v202 == 3);
  if (v202 == 3)
    v365 = sub_1B1956DBC(v183, 0xBu);
  else
    v365 = 0;
  sub_1B17D8B40((uint64_t)&v625, 0xBu, 11, v365);
  sub_1B17D8B40((uint64_t)&v625, 0xCu, 12, v365);
  sub_1B17D8B40((uint64_t)&v625, 0xDu, 13, v365);
  if (BYTE8(v627))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v368, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_TANGENT"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v369, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_BITANGENT"));
  }
  if (v202 == 3)
    v370 = sub_1B1956DBC(v183, 0xEu);
  else
    v370 = 0;
  sub_1B17D8B40((uint64_t)&v625, 0xEu, 14, v370);
  sub_1B17D8B40((uint64_t)&v625, 0xFu, 15, v370);
  sub_1B17D8B40((uint64_t)&v625, 3u, 3, 1);
  if (BYTE8(v627))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v371, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_VIEW"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v372, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_NORMAL"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v373, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_POSITION"));
  }
  v374 = sub_1B1956DBC(v183, 4u);
  sub_1B17D8B40((uint64_t)&v625, 4u, 4, v374);
  if (v202 == 3)
    objc_msgSend_setObject_forKeyedSubscript_(v626, v375, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_PBR_TRANSPARENCY"));
  if ((v166 & 0x7800) == 0x1000 || (v166 & 0x20) != 0)
    objc_msgSend_setObject_forKeyedSubscript_(v626, v375, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_DOUBLE_SIDED"));
  if ((v608 & 1) == 0)
    objc_msgSend_setObject_forKeyedSubscript_(v626, v375, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_NODE_OPACITY"));
  if ((v607 & 0x200) != 0)
    objc_msgSend_setObject_forKeyedSubscript_(v626, v375, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("DIFFUSE_PREMULTIPLIED"));
  if ((_QWORD)v627)
  {
    objc_msgSend_addObject_((void *)v627, v375, (uint64_t)CFSTR("LOCK_AMBIENT_WITH_DIFFUSE"), v376);
    objc_msgSend_addObject_((void *)v627, v377, (uint64_t)CFSTR("USE_DOUBLE_SIDED"), v378);
    objc_msgSend_addObject_((void *)v627, v379, (uint64_t)CFSTR("USE_TRANSPARENT"), v380);
    objc_msgSend_addObject_((void *)v627, v381, (uint64_t)CFSTR("USE_PBR_TRANSPARENCY"), v382);
    objc_msgSend_addObject_((void *)v627, v383, (uint64_t)CFSTR("USE_PBR_LAMBERTIAN_REFLECTION"), v384);
    objc_msgSend_addObject_((void *)v627, v385, (uint64_t)CFSTR("USE_NODE_OPACITY"), v386);
    objc_msgSend_addObject_((void *)v627, v387, (uint64_t)CFSTR("DIFFUSE_PREMULTIPLIED"), v388);
  }
  v389 = sub_1B1956FAC(v183);
  if (v389 >= 1)
  {
    v397 = v389;
    for (i = 0; i != v397; ++i)
    {
      v399 = sub_1B1956F30(v183, i, v391, v392, v393, v394, v395, v396);
      v406 = sub_1B1956F70(v183, i, v400, v401, v402, v403, v404, v405);
      if (v406 != -1)
      {
        v407 = v406;
        objc_msgSend_appendFormat_((void *)v631, v390, (uint64_t)CFSTR("    float2 %@Texcoord;\n"), v392, v399);
        objc_msgSend_appendFormat_(*((void **)&v633 + 1), v408, (uint64_t)CFSTR("    _surface.%@Texcoord = in.texcoord%d;\n"),
          v409,
          v399,
          v407);
      }
    }
  }
  if (v609)
    objc_msgSend_setObject_forKeyedSubscript_(v626, v390, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_ALPHA_CUTOFF"));
  if ((_QWORD)v627)
    objc_msgSend_addObject_((void *)v627, v390, (uint64_t)CFSTR("USE_ALPHA_CUTOFF"), v392);
  v410 = sub_1B1956EC8((uint64_t)v625);
  if (v410)
  {
    v418 = v410;
    if (v410 < 1)
    {
      v420 = 0;
    }
    else
    {
      v419 = 0;
      v420 = 0;
      do
      {
        v421 = sub_1B1956EDC((uint64_t)v625, v419, v412, v413, v414, v415, v416, v417);
        objc_msgSend_appendFormat_(*((void **)&v631 + 1), v422, (uint64_t)CFSTR("float2 texcoord%d;\n"), v423, v419);
        if (HIBYTE(v421) == 255)
        {
          v426 = v421;
          objc_msgSend_appendFormat_(*((void **)&v632 + 1), v424, (uint64_t)CFSTR("out.texcoord%d = _geometry.texcoords[%d].xy;\n"),
            v425,
            v419,
            v421,
            v597);
        }
        else
        {
          v427 = v634;
          LODWORD(v634) = v634 + 1;
          v426 = v421;
          objc_msgSend_appendFormat_(*((void **)&v632 + 1), v424, (uint64_t)CFSTR("out.texcoord%d = (vfx_commonprofile.textureTransforms[%d] * float4(_geometry.texcoords[%d], 0., 1.)).xy;\n"),
            v425,
            v419,
            v427,
            v421);
        }
        if (v426 <= 7)
          objc_msgSend_setObject_forKeyedSubscript_(v626, v411, (uint64_t)&stru_1E63FD500, (uint64_t)off_1E63D5818[v426]);
        if (v420 <= v426 + 1)
          v420 = v426 + 1;
        ++v419;
      }
      while (v418 != v419);
    }
    objc_msgSend_setObject_forKeyedSubscript_(v626, v411, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_TEXCOORD"));
    v183 = (uint64_t)v624;
    v213 = v612;
  }
  else
  {
    v420 = 0;
  }
  if ((_DWORD)v634)
  {
    v428 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v411, v634, v413);
    objc_msgSend_setObject_forKeyedSubscript_(v626, v429, v428, (uint64_t)CFSTR("TEXTURE_TRANSFORM_COUNT"));
  }
  v430 = objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v411, v420, v413);
  objc_msgSend_setObject_forKeyedSubscript_(v626, v431, v430, (uint64_t)CFSTR("kVFXTexcoordCount"));
  if ((_QWORD)v627)
  {
    objc_msgSend_addObject_((void *)v627, v432, (uint64_t)CFSTR("USE_TEXCOORD"), v433);
    objc_msgSend_addObject_((void *)v627, v434, (uint64_t)CFSTR("TEXTURE_TRANSFORM_COUNT"), v435);
    for (j = 0; j != 8; ++j)
      objc_msgSend_addObject_((void *)v627, v436, (uint64_t)off_1E63D5818[j], v437);
  }
  v439 = sub_1B1956DAC(v183, 0x10u);
  sub_1B17D8B40((uint64_t)&v625, 0x10u, 16, v439);
  if (v439)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v440, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_NORMAL"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v442, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_TANGENT"));
    objc_msgSend_setObject_forKeyedSubscript_(v626, v443, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_BITANGENT"));
  }
  v444 = (void *)objc_msgSend_objectForKeyedSubscript_(v626, v440, (uint64_t)CFSTR("USE_VIEW"), v441);
  if (objc_msgSend_intValue(v444, v445, v446, v447) == 2)
    objc_msgSend_setObject_forKeyedSubscript_(v626, v448, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_POSITION"));
  if (objc_msgSend_objectForKeyedSubscript_(v626, v448, (uint64_t)CFSTR("USE_NORMAL"), v449)
    && !objc_msgSend_objectForKeyedSubscript_(v626, v450, (uint64_t)CFSTR("HAS_NORMAL"), v451))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v450, (uint64_t)&unk_1E6478388, (uint64_t)CFSTR("USE_POSITION"));
  }
  v454 = CFSTR("USE_MODELVIEWTRANSFORM");
  if (!objc_msgSend_objectForKeyedSubscript_(v626, v450, (uint64_t)CFSTR("USE_POSITION"), v451)
    && !objc_msgSend_objectForKeyedSubscript_(v626, v452, (uint64_t)CFSTR("USE_INSTANCING"), v453))
  {
    v454 = CFSTR("USE_MODELVIEWPROJECTIONTRANSFORM");
  }
  objc_msgSend_setObject_forKeyedSubscript_(v626, v452, (uint64_t)&stru_1E63FD500, (uint64_t)v454);
  if (objc_msgSend_objectForKeyedSubscript_(v626, v455, (uint64_t)CFSTR("USE_NORMAL"), v456)
    || objc_msgSend_objectForKeyedSubscript_(v626, v457, (uint64_t)CFSTR("USE_TANGENT"), v458)
    || objc_msgSend_objectForKeyedSubscript_(v626, v457, (uint64_t)CFSTR("USE_BITANGENT"), v459))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v457, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_MODELVIEWTRANSFORM"));
  }
  if (objc_msgSend_length((void *)v628, v457, v460, v461))
    objc_msgSend_setObject_forKeyedSubscript_(v626, v462, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_SHADER_MODIFIERS"));
  if (objc_msgSend_length((void *)v631, v462, v463, v464))
    objc_msgSend_setObject_forKeyedSubscript_(v626, v465, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_SURFACE_EXTRA_DECL"));
  if (objc_msgSend_length((void *)v638, v465, v466, v467))
    objc_msgSend_setObject_forKeyedSubscript_(v626, v468, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_EXTRA_VARYINGS"));
  if ((_QWORD)v627)
  {
    objc_msgSend_addObject_((void *)v627, v468, (uint64_t)CFSTR("USE_SHADER_MODIFIERS"), v469);
    objc_msgSend_addObject_((void *)v627, v470, (uint64_t)CFSTR("USE_SURFACE_EXTRA_DECL"), v471);
    objc_msgSend_addObject_((void *)v627, v472, (uint64_t)CFSTR("USE_EXTRA_VARYINGS"), v473);
  }
  v474 = sub_1B19B83D4(CFSTR("vfx_metal"));
  v475 = sub_1B19B83D4(CFSTR("vfx_util.h"));
  if (v613 == 3)
    v476 = (const __CFString *)sub_1B19B83D4(CFSTR("CFX-PBR.metal"));
  else
    v476 = &stru_1E63FD500;
  sub_1B17D63A4((void **)&v625, v618, v183);
  if (objc_msgSend_objectForKeyedSubscript_(v626, v477, (uint64_t)CFSTR("HAS_NORMAL"), v478)
    || objc_msgSend_objectForKeyedSubscript_(v626, v479, (uint64_t)CFSTR("USE_OPENSUBDIV"), v480))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v479, (uint64_t)CFSTR("1"), (uint64_t)CFSTR("HAS_OR_GENERATES_NORMAL"));
  }
  v483 = &stru_1E63FD500;
  if (v618)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v626, v479, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_TESSELLATION"));
    v483 = (const __CFString *)sub_1B19B83D4(CFSTR("vfx_tessellation.h"));
    v484 = (v616 >> 3) & 3;
    if (v484 == 1)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v626, v479, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("TESSELLATION_SMOOTHING_MODE_PN_TRIANGLE"));
    }
    else if (v484 == 2)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v626, v479, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("TESSELLATION_SMOOTHING_MODE_PHONG"));
    }
  }
  if ((_QWORD)v627)
  {
    sub_1B195BB08((void *)v627, v479, v481, v482);
    objc_msgSend_addObject_((void *)v627, v485, (uint64_t)CFSTR("HAS_OR_GENERATES_NORMAL"), v486);
    objc_msgSend_addObject_((void *)v627, v487, (uint64_t)CFSTR("USE_TESSELLATION"), v488);
  }
  v658[0] = v631;
  v658[1] = v636;
  if (*((_QWORD *)&v630 + 1))
    v489 = (const __CFString *)*((_QWORD *)&v630 + 1);
  else
    v489 = &stru_1E63FD500;
  v658[2] = v489;
  v490 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v479, (uint64_t)v658, 3);
  v492 = objc_msgSend_vfx_stringByReplacingCharactersInRanges_withStrings_(self->_originalLightingSourceCode, v491, (uint64_t)self->_lightingInjectionPointRanges, v490);
  v644[0] = v474;
  v494 = self;
  v644[1] = v475;
  v644[2] = v476;
  v644[3] = v483;
  v644[4] = *((_QWORD *)&v631 + 1);
  v644[5] = v638;
  v644[6] = v628;
  v644[7] = v492;
  v645 = v639;
  v646 = v640;
  v647 = v637;
  if ((_QWORD)v629)
    v495 = (const __CFString *)v629;
  else
    v495 = &stru_1E63FD500;
  v648 = v633;
  v649 = v495;
  if (BYTE11(v638))
    v496 = v213 ^ 1;
  else
    v496 = 1;
  v497 = (const __CFString *)*((_QWORD *)&v634 + 1);
  if ((v213 & (BYTE11(v638) == 0)) != 0)
    v498 = (const __CFString *)*((_QWORD *)&v634 + 1);
  else
    v498 = &stru_1E63FD500;
  v650 = v498;
  v651 = *((_QWORD *)&v632 + 1);
  v652 = *((_QWORD *)&v637 + 1);
  v653 = *((_QWORD *)&v633 + 1);
  v499 = (const __CFString *)*((_QWORD *)&v629 + 1);
  if (!*((_QWORD *)&v629 + 1))
    v499 = &stru_1E63FD500;
  v654 = v499;
  v655 = *((_QWORD *)&v636 + 1);
  if (v496)
    v497 = &stru_1E63FD500;
  if ((_QWORD)v630)
    v500 = (const __CFString *)v630;
  else
    v500 = &stru_1E63FD500;
  v656 = v497;
  v657 = v500;
  v501 = (void *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v493, (uint64_t)v644, 22);
  v503 = objc_msgSend_vfx_stringByReplacingCharactersInRanges_withStrings_(self->_originalSourceCode, v502, (uint64_t)self->_injectionPointRanges, (uint64_t)v501);
  v505 = objc_msgSend_splitInputOutputStructsIfNeededForSourceCode_generatedFromReplacementStrings_perPixelLighting_clipDistanceCount_(self, v504, v503, (uint64_t)v501, BYTE11(v638), v615);
  if (sub_1B18B864C())
  {
    v623 = v505;
    v509 = (void *)objc_msgSend_mutableCopy(v501, v506, v507, v508);
    v513 = objc_msgSend_count(self->_injectionPointRanges, v510, v511, v512);
    if (v513)
    {
      v516 = v513;
      v517 = 0;
      while (1)
      {
        v518 = (void *)objc_msgSend_objectAtIndexedSubscript_(v494->_injectionPointRanges, v514, v517, v515);
        v522 = objc_msgSend_rangeValue(v518, v519, v520, v521);
        v524 = (__CFString *)objc_msgSend_substringWithRange_(v494->_originalSourceCode, v523, v522, (uint64_t)v523);
        if (!objc_msgSend_hasPrefix_(v524, v525, (uint64_t)CFSTR("#import"), v526))
          break;
        if ((objc_msgSend_containsString_(v524, v527, (uint64_t)CFSTR("CFX-Lighting.metal"), v529) & 1) == 0)
        {
          v530 = objc_msgSend_objectAtIndexedSubscript_(v501, v514, v517, v515);
          v533 = (void *)MEMORY[0x1E0CB3940];
          v599 = v524;
          goto LABEL_362;
        }
LABEL_367:
        if (v516 == ++v517)
          goto LABEL_368;
      }
      if (objc_msgSend_length((void *)v640, v527, v528, v529)
        && objc_msgSend_containsString_(v524, v534, (uint64_t)CFSTR("__OpenSubdivDeclShared__"), v536))
      {
        v530 = objc_msgSend_objectAtIndexedSubscript_(v501, v534, v517, v536);
        v533 = (void *)MEMORY[0x1E0CB3940];
        v599 = CFSTR("#generate \"__OpenSubdivDeclShared__.metal\");
LABEL_362:
        v537 = objc_msgSend_stringWithFormat_(v533, v531, (uint64_t)CFSTR("%@%@\n%@%@\n%@"), v532, CFSTR("#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), v530, CFSTR("#else // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), v599, CFSTR("#endif // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"));
      }
      else
      {
        if (!objc_msgSend_length(*((void **)&v639 + 1), v534, v535, v536)
          || !objc_msgSend_containsString_(v524, v514, (uint64_t)CFSTR("__OpenSubdivDeclPerPatchType__"), v515))
        {
          goto LABEL_367;
        }
        v539 = objc_msgSend_objectAtIndexedSubscript_(v501, v514, v517, v515);
        v540 = (void *)MEMORY[0x1E0CB3940];
        v541 = sub_1B1956ED0((uint64_t)v624);
        v600 = objc_msgSend_stringWithFormat_(v540, v542, (uint64_t)CFSTR("#generate \"__OpenSubdivDeclShared__patchType%d.metal\"), v543, v541);
        v544 = v540;
        v494 = self;
        v537 = objc_msgSend_stringWithFormat_(v544, v545, (uint64_t)CFSTR("%@%@\n%@%@\n%@"), v546, CFSTR("#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), v539, CFSTR("#else // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), v600, CFSTR("#endif // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"));
      }
      objc_msgSend_setObject_atIndexedSubscript_(v509, v538, v537, v517);
      goto LABEL_367;
    }
LABEL_368:
    v547 = objc_msgSend_vfx_stringByReplacingCharactersInRanges_withStrings_(v494->_originalSourceCode, v514, (uint64_t)v494->_injectionPointRanges, (uint64_t)v509);
    v549 = (const void *)objc_msgSend_splitInputOutputStructsIfNeededForSourceCode_generatedFromReplacementStrings_perPixelLighting_clipDistanceCount_(v494, v548, v547, (uint64_t)v509, BYTE11(v638), v615);

    v505 = v623;
    v183 = (uint64_t)v624;
  }
  else
  {
    v549 = 0;
  }
  if (objc_msgSend_length((void *)v637, v506, v507, v508))
    objc_msgSend_setObject_forKeyedSubscript_(v626, v550, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_VERTEX_EXTRA_ARGUMENTS"));
  if (objc_msgSend_length(*((void **)&v637 + 1), v550, v551, v552))
    objc_msgSend_setObject_forKeyedSubscript_(v626, v553, (uint64_t)&stru_1E63FD500, (uint64_t)CFSTR("USE_FRAGMENT_EXTRA_ARGUMENTS"));
  objc_msgSend_setObject_forKeyedSubscript_(v626, v553, (uint64_t)&unk_1E6478370, (uint64_t)CFSTR("METAL"));
  v561 = sub_1B1814B88((uint64_t)v617, v554, v555, v556, v557, v558, v559, v560);
  if ((v620 & 0x400) != 0)
  {
    v564 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v562, v561, v563);
    objc_msgSend_setObject_forKeyedSubscript_(v626, v565, v564, (uint64_t)CFSTR("DEBUG_PIXEL"));
  }
  if ((_QWORD)v627)
  {
    objc_msgSend_addObject_((void *)v627, v562, (uint64_t)CFSTR("USE_VERTEX_EXTRA_ARGUMENTS"), v563);
    objc_msgSend_addObject_((void *)v627, v566, (uint64_t)CFSTR("USE_FRAGMENT_EXTRA_ARGUMENTS"), v567);
    objc_msgSend_addObject_((void *)v627, v568, (uint64_t)CFSTR("USE_ARGUMENT_BUFFERS"), v569);
    objc_msgSend_addObject_((void *)v627, v570, (uint64_t)CFSTR("USE_REVERSE_Z"), v571);
    objc_msgSend_addObject_((void *)v627, v572, (uint64_t)CFSTR("DEBUG_PIXEL"), v573);
  }
  v574 = (void *)objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v562, 0, v563);
  objc_msgSend_appendString_(v574, v575, (uint64_t)CFSTR("////////////////////////////////////////////////\n"), v576);
  objc_msgSend_appendFormat_(v574, v577, (uint64_t)CFSTR("// CommonProfile Shader v%d\n"), v578, 2);
  v581 = (const void *)objc_msgSend_stringByAppendingString_(v574, v579, v505, v580);
  if (sub_1B18B864C())
    v549 = (const void *)objc_msgSend_stringByAppendingString_(v574, v582, (uint64_t)v549, v583);
  v584 = 131074;
  if (v611 > 0x20002)
    v584 = v611;
  if (v610)
    v585 = v584;
  else
    v585 = v611;
  v586 = (__CFXFXProgram *)sub_1B181E12C(CFSTR("commonprofile_vert"), CFSTR("commonprofile_frag"), v581, v549, v626, (const void *)v627, v585, 0);
  v587 = (const void *)sub_1B1956DDC(v183);
  sub_1B181DDF4((uint64_t)v586, v587, v588, v589, v590, v591, v592, v593);
  return v586;
}

- (id)splitInputOutputStructsIfNeededForSourceCode:(id)a3 generatedFromReplacementStrings:(id)a4 perPixelLighting:(BOOL)a5 clipDistanceCount:(unint64_t)a6
{
  _BOOL4 v8;
  NSUInteger v9;
  NSArray *injectionPointRanges;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  uint64_t v83;
  uint64_t v84;
  _QWORD v85[8];
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  const char *v89;
  _NSRange commonProfileIORange;
  _QWORD v91[6];
  _QWORD v92[6];
  _QWORD v93[4];
  _QWORD v94[6];

  v94[4] = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    v8 = a5;
    v9 = self->_commonProfileIORange.length + self->_commonProfileIORange.location;
    v86 = 0;
    v87 = &v86;
    v88 = 0x3010000000;
    v89 = "";
    commonProfileIORange = self->_commonProfileIORange;
    injectionPointRanges = self->_injectionPointRanges;
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = sub_1B17D92BC;
    v85[3] = &unk_1E63D5778;
    v85[4] = self;
    v85[5] = a4;
    v85[6] = &v86;
    v85[7] = v9;
    objc_msgSend_enumerateObjectsUsingBlock_(injectionPointRanges, a2, (uint64_t)v85, (uint64_t)a4);
    v13 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("    float clipDistance [[clip_distance]] [%d];\n} commonprofile_io_vert;\n\n"),
            v12,
            a6);
    v15 = (void *)objc_msgSend_substringWithRange_(a3, v14, v87[4], v87[5]);
    v19 = objc_msgSend_length(v15, v16, v17, v18);
    v21 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v15, v20, v19 - 19, 19, v13);
    v22 = v87[4];
    v23 = v87[5];
    v27 = objc_msgSend_length(a3, v24, v25, v26);
    v28 = v23 + v22;
    v30 = objc_msgSend_rangeOfString_options_range_(a3, v29, (uint64_t)CFSTR("vertex commonprofile_io"), 0, v23 + v22, v27 - (v23 + v22));
    v32 = (uint64_t)v31;
    v35 = objc_msgSend_length(a3, v31, v33, v34);
    v40 = objc_msgSend_rangeOfString_options_range_(a3, v36, (uint64_t)CFSTR("commonprofile_io out;"),
            0,
            v30 + v32,
            v35 - (v30 + v32));
    v41 = v37;
    if (v8)
    {
      v42 = (uint64_t)v37;
      v43 = objc_msgSend_length(a3, v37, v38, v39);
      v45 = objc_msgSend_rangeOfString_options_range_(a3, v44, (uint64_t)CFSTR("commonprofile_io out;"),
              0,
              v28,
              v43 - v28);
      v47 = (uint64_t)v46;
      v94[0] = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v46, v87[4], 0);
      v94[1] = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v48, v45, v47);
      v94[2] = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v49, v30, v32);
      v94[3] = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v50, v40, v42);
      v52 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v51, (uint64_t)v94, 4);
      v93[0] = v21;
      v93[1] = CFSTR("commonprofile_io_vert out;");
      v93[2] = CFSTR("vertex commonprofile_io_vert");
      v93[3] = CFSTR("commonprofile_io_vert out;");
      v54 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v53, (uint64_t)v93, 4);
    }
    else
    {
      v56 = objc_msgSend_length(a3, v37, v38, v39);
      v58 = objc_msgSend_rangeOfString_options_range_(a3, v57, (uint64_t)CFSTR("commonprofile_io out;"),
              0,
              v28,
              v56 - v28);
      v60 = (uint64_t)v59;
      v83 = v40;
      v84 = (uint64_t)v41;
      v63 = objc_msgSend_length(a3, v59, v61, v62);
      v65 = objc_msgSend_rangeOfString_options_range_(a3, v64, (uint64_t)CFSTR("commonprofile_io in;"),
              0,
              v28,
              v63 - v28);
      v67 = (uint64_t)v66;
      v70 = objc_msgSend_length(a3, v66, v68, v69);
      v72 = objc_msgSend_rangeOfString_options_range_(a3, v71, (uint64_t)CFSTR("commonprofile_io io"), 0, v28, v70 - v28);
      v74 = (uint64_t)v73;
      v92[0] = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v73, v87[4], 0);
      v92[1] = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v75, v58, v60);
      v92[2] = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v76, v65, v67);
      v92[3] = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v77, v72, v74);
      v92[4] = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v78, v30, v32);
      v92[5] = objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v79, v83, v84);
      v52 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v80, (uint64_t)v92, 6);
      v91[0] = v21;
      v91[1] = CFSTR("commonprofile_io_vert out;");
      v91[2] = CFSTR("commonprofile_io_vert in;");
      v91[3] = CFSTR("commonprofile_io_vert io");
      v91[4] = CFSTR("vertex commonprofile_io_vert");
      v91[5] = CFSTR("commonprofile_io_vert out;");
      v54 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v81, (uint64_t)v91, 6);
    }
    a3 = (id)objc_msgSend_vfx_stringByReplacingCharactersInRanges_withStrings_(a3, v55, v52, v54);
    _Block_object_dispose(&v86, 8);
  }
  return a3;
}

- (void)collectShaderForProgram:(__CFXFXProgram *)a3 hashCode:(id)a4 newVertexFunctionName:(id)a5 newFragmentFunctionName:(id)a6 sourceCodeBlock:(id)a7 additionalFileBlock:(id)a8
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const __CFString *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  id v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t i;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t j;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  __CFXFXProgram *v147;
  uint64_t v151;
  void *v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _BYTE v161[128];
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v11 = (void *)sub_1B181E600((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8);
  v147 = a3;
  v19 = (void *)sub_1B181E5B8((uint64_t)a3, v12, v13, v14, v15, v16, v17, v18);
  v23 = objc_msgSend_length(v19, v20, v21, v22);
  v27 = (void *)objc_msgSend_mutableCopy(v19, v24, v25, v26);
  objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v27, v28, (uint64_t)CFSTR("commonprofile_vert"), (uint64_t)a5, 0, 0, v23);
  objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v27, v29, (uint64_t)CFSTR("commonprofile_frag"), (uint64_t)a6, 0, 0, v23);
  v33 = objc_msgSend_length(v27, v30, v31, v32);
  v35 = objc_msgSend_rangeOfString_options_range_(v27, v34, (uint64_t)CFSTR("#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), 2, 0, v33);
  v152 = v27;
  if (v35 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v37 = v35;
    while (1)
    {
      v38 = (uint64_t)&v36[v37];
      v39 = objc_msgSend_rangeOfString_options_range_(v27, v36, (uint64_t)CFSTR("#else // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), 2, &v36[v37], v33 - (_QWORD)&v36[v37]);
      v41 = (uint64_t)&v40[v39];
      v42 = objc_msgSend_rangeOfString_options_range_(v27, v40, (uint64_t)CFSTR("#endif // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), 2, &v40[v39], v33 - (_QWORD)&v40[v39]);
      v151 = (uint64_t)v43;
      v44 = (void *)objc_msgSend_substringWithRange_(v27, v43, v41, v42 - v41);
      if (objc_msgSend_hasPrefix_(v44, v45, (uint64_t)CFSTR("#import"), v46))
        break;
      v64 = &stru_1E63FD500;
      if (objc_msgSend_hasPrefix_(v44, v47, (uint64_t)CFSTR("#generate"), v48))
      {
        v68 = objc_msgSend_rangeOfString_(v44, v66, (uint64_t)CFSTR("\"), v67);
        v71 = (void *)objc_msgSend_substringFromIndex_(v44, v69, v68 + 1, v70);
        v74 = objc_msgSend_rangeOfString_(v71, v72, (uint64_t)CFSTR("\"), v73);
        v77 = objc_msgSend_substringToIndex_(v71, v75, v74, v76);
        v61 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v78, (uint64_t)CFSTR("_import/%@"), v79, v77);
        v64 = (const __CFString *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v80, (uint64_t)CFSTR("#import \"%@\"), v81, v61);
        v65 = objc_msgSend_substringWithRange_(v152, v82, v38, v39 - v38);
        goto LABEL_7;
      }
LABEL_8:
      v27 = v152;
      objc_msgSend_replaceCharactersInRange_withString_(v152, v66, v42, v151, &stru_1E63FD500);
      objc_msgSend_replaceCharactersInRange_withString_(v152, v83, v41, v42 - v41, v64);
      objc_msgSend_replaceCharactersInRange_withString_(v152, v84, v37, v41 - v37, &stru_1E63FD500);
      v33 = objc_msgSend_length(v152, v85, v86, v87);
      v37 = objc_msgSend_rangeOfString_options_range_(v152, v88, (uint64_t)CFSTR("#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"), 2, 0, v33);
      if (v37 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_9;
    }
    v49 = objc_msgSend_rangeOfString_(v44, v47, (uint64_t)CFSTR("\"), v48);
    v52 = (void *)objc_msgSend_substringFromIndex_(v44, v50, v49 + 1, v51);
    v55 = objc_msgSend_rangeOfString_(v52, v53, (uint64_t)CFSTR("\"), v54);
    v58 = (void *)objc_msgSend_substringToIndex_(v52, v56, v55, v57);
    v61 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v59, (uint64_t)CFSTR("_import/%@"), v60, v58);
    v64 = (const __CFString *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v62, (uint64_t)CFSTR("#import \"%@\"), v63, v61);
    v65 = (uint64_t)sub_1B19B83D4(v58);
LABEL_7:
    (*((void (**)(id, uint64_t, uint64_t))a8 + 2))(a8, v65, v61);
    goto LABEL_8;
  }
LABEL_9:
  v89 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_insertString_atIndex_(v27, v90, (uint64_t)CFSTR("\n"), 0);
  v94 = (void *)objc_msgSend_allKeys(v11, v91, v92, v93);
  v97 = (void *)objc_msgSend_sortedArrayUsingSelector_(v94, v95, (uint64_t)sel_compare_, v96);
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v101 = (void *)objc_msgSend_reverseObjectEnumerator(v97, v98, v99, v100);
  v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v101, v102, (uint64_t)&v157, (uint64_t)v162, 16);
  if (v103)
  {
    v111 = v103;
    v112 = *(_QWORD *)v158;
    do
    {
      for (i = 0; i != v111; ++i)
      {
        if (*(_QWORD *)v158 != v112)
          objc_enumerationMutation(v101);
        v114 = *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * i);
        v115 = (void *)objc_msgSend_objectForKeyedSubscript_(v11, v104, v114, v106);
        v118 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v116, (uint64_t)CFSTR("#define %@ %@\n"), v117, v114, v115, v147);
        objc_msgSend_insertString_atIndex_(v152, v119, v118, 0);
        if (objc_msgSend_isEqual_(v115, v120, (uint64_t)&stru_1E63FD500, v121))
          objc_msgSend_appendFormat_(v89, v122, (uint64_t)CFSTR(" -D%@"), v123, v114, v146);
        else
          objc_msgSend_appendFormat_(v89, v122, (uint64_t)CFSTR(" -D%@=%@"), v123, v114, v115);
      }
      v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v101, v104, (uint64_t)&v157, (uint64_t)v162, 16);
    }
    while (v111);
  }
  v124 = (void *)sub_1B181E648((uint64_t)v147, (uint64_t)v104, v105, v106, v107, v108, v109, v110);
  if (objc_msgSend_count(v124, v125, v126, v127))
  {
    v131 = (void *)objc_msgSend_allObjects(v124, v128, v129, v130);
    v134 = (void *)objc_msgSend_sortedArrayUsingSelector_(v131, v132, (uint64_t)sel_compare_, v133);
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v138 = (void *)objc_msgSend_reverseObjectEnumerator(v134, v135, v136, v137);
    v140 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v139, (uint64_t)&v153, (uint64_t)v161, 16);
    if (v140)
    {
      v141 = v140;
      v142 = *(_QWORD *)v154;
      do
      {
        for (j = 0; j != v141; ++j)
        {
          if (*(_QWORD *)v154 != v142)
            objc_enumerationMutation(v138);
          v144 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * j);
          if (!objc_msgSend_objectForKeyedSubscript_(v11, v128, v144, v130))
            objc_msgSend_appendFormat_(v89, v128, (uint64_t)CFSTR(" -U%@"), v130, v144);
        }
        v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v128, (uint64_t)&v153, (uint64_t)v161, 16);
      }
      while (v141);
    }
  }
  v145 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v128, (uint64_t)CFSTR("_unifdef/%@.h"), v130, a4);
  (*((void (**)(id, id, uint64_t))a8 + 2))(a8, v89, v145);

  (*((void (**)(id, void *))a7 + 2))(a7, v152);
}

@end
