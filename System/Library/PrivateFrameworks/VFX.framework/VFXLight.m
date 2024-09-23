@implementation VFXLight

+ (VFXLight)lightWithMDLLight:(id)a3
{
  uint64_t v3;
  VFXLight *v5;
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
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
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  unint64_t v42;

  v5 = (VFXLight *)objc_msgSend_light(a1, a2, (uint64_t)a3, v3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0DC3658];
    v10 = objc_msgSend_color(a3, v6, v7, v8);
    v13 = objc_msgSend_colorWithCGColor_(v9, v11, v10, v12);
    objc_msgSend_setColor_(v5, v14, v13, v15);
    objc_msgSend_attenuationEndDistance(a3, v16, v17, v18);
    objc_msgSend_setAttenuationDistance_(v5, v19, v20, v21);
    objc_msgSend_innerConeAngle(a3, v22, v23, v24);
    objc_msgSend_setSpotInnerAngle_(v5, v25, v26, v27);
    objc_msgSend_outerConeAngle(a3, v28, v29, v30);
    objc_msgSend_setSpotOuterAngle_(v5, v31, v32, v33);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v37 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x1E0DC3658], v34, v35, v36, 0.0, 0.0, 0.0, 1.0);
      objc_msgSend_setColor_(v5, v38, v37, v39);
    }
  }
  v42 = objc_msgSend_lightType(a3, v34, v35, v36) - 1;
  if (v42 <= 3)
    objc_msgSend_setType_(v5, v40, qword_1B22469E8[v42], v41);
  return v5;
}

+ (VFXLight)lightWithMDLLightProbe:(id)a3
{
  uint64_t v3;
  VFXLight *v4;
  const char *v5;
  uint64_t v6;

  v4 = (VFXLight *)objc_msgSend_light(a1, a2, (uint64_t)a3, v3);
  objc_msgSend_setType_(v4, v5, 4, v6);
  return v4;
}

- (VFXLight)init
{
  VFXLight *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VFXLight;
  v2 = -[VFXLight init](&v12, sel_init);
  if (v2)
  {
    v3 = sub_1B185ECD0();
    v2->_light = (__CFXLight *)v3;
    if (v3)
      sub_1B193E768(v3, v2, v5, v6, v7, v8, v9, v10);
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6);
  }
  return v2;
}

- (VFXLight)initWithLightRef:(__CFXLight *)a3
{
  VFXLight *v4;
  __CFXLight *v5;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VFXLight;
  v4 = -[VFXLight init](&v17, sel_init);
  if (v4)
  {
    v5 = (__CFXLight *)CFRetain(a3);
    v4->_light = v5;
    if (v5)
      sub_1B193E768((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
  }
  return v4;
}

- (id)initPresentationLightWithLightRef:(__CFXLight *)a3
{
  VFXLight *v4;
  VFXLight *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXLight;
  v4 = -[VFXLight init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 16) |= 1u;
    v4->_light = (__CFXLight *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (__CFXLight)lightRef
{
  return self->_light;
}

+ (id)light
{
  return objc_alloc_init((Class)a1);
}

+ (VFXLight)lightWithLightRef:(__CFXLight *)a3
{
  VFXLight *result;
  id v6;
  const char *v7;
  uint64_t v8;

  result = (VFXLight *)sub_1B193E758((id *)a3);
  if (!result)
  {
    v6 = objc_alloc((Class)a1);
    return (VFXLight *)(id)objc_msgSend_initWithLightRef_(v6, v7, (uint64_t)a3, v8);
  }
  return result;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXLight *light;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  objc_super v14;
  _QWORD v15[5];

  light = self->_light;
  if (light)
  {
    if ((*((_BYTE *)self + 16) & 1) == 0)
    {
      sub_1B193E768((uint64_t)light, 0, v2, v3, v4, v5, v6, v7);
      light = self->_light;
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B18839AC;
    v15[3] = &unk_1E63D4AB0;
    v15[4] = light;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, 0, v15);
  }

  objc_msgSend_parentWillDie_(self->_gobo, v10, (uint64_t)self, v11);
  objc_msgSend_parentWillDie_(self->_probeEnvironment, v12, (uint64_t)self, v13);

  v14.receiver = self;
  v14.super_class = (Class)VFXLight;
  -[VFXLight dealloc](&v14, sel_dealloc);
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = (void *)objc_msgSend_name(self, a2, v2, v3);
  v9 = objc_msgSend_length(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v11);
  if (v9)
  {
    v16 = objc_msgSend_name(self, v12, v13, v14);
    v26 = objc_msgSend_type(self, v17, v18, v19);
    return (NSString *)objc_msgSend_stringWithFormat_(v10, v20, (uint64_t)CFSTR("<%@: %p '%@' | type=%d>"), v21, v15, self, v16, v26);
  }
  else
  {
    v25 = objc_msgSend_type(self, v12, v13, v14);
    return (NSString *)objc_msgSend_stringWithFormat_(v10, v23, (uint64_t)CFSTR("<%@: %p | type=%d>"), v24, v15, self, v25);
  }
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
      v15[2] = sub_1B1883AFC;
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
  NSString *v5;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_name;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  v15 = objc_msgSend___CFObject(self, v7, v8, v9);
  v5 = (NSString *)sub_1B193E568(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14)
    sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v5;
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

- (id)identifier
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
  return sub_1B193E67C(v4, v5, v6, v7, v8, v9, v10, v11);
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
  uint64_t v21;
  const char *v22;
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
  char v59;
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
  uint64_t v111;
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
  VFXMaterialProperty *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  VFXMaterialProperty *v129;
  const char *v130;
  __int128 v131;
  const char *v132;
  uint64_t v133;
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
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
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
  char v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
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
  char v199;
  char v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  VFXMaterialProperty *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  VFXMaterialProperty *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  _OWORD v269[3];
  __int128 v270;
  float32x4_t v271;
  __int128 v272;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  self->_type = (int)sub_1B186064C((uint64_t)self->_light, v6, v7, v8, v9, v10, v11, v12);
  v21 = sub_1B185F68C((uint64_t)self->_light, v14, v15, v16, v17, v18, v19, v20);

  self->_color = (id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v22, v21, v23);
  self->_intensity = sub_1B185FEC0((uint64_t)self->_light, v24, v25, v26, v27, v28, v29, v30);
  self->_temperature = sub_1B18605AC((uint64_t)self->_light, v31, v32, v33, v34, v35, v36, v37);
  self->_shadowIntensity = sub_1B185F6D4((uint64_t)self->_light, v38, v39, v40, v41, v42, v43, v44);
  if (sub_1B185F4D4((uint64_t)self->_light, v45, v46, v47, v48, v49, v50, v51))
    v59 = 2;
  else
    v59 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFD | v59;
  self->_shadowMapSize = (CGSize)vcvtq_f64_f32(COERCE_FLOAT32X2_T(sub_1B1860108((uint64_t)self->_light, v52, v53, v54, v55, v56, v57, v58)));
  self->_shadowRadius = sub_1B185F578((uint64_t)self->_light, v60, v61, v62, v63, v64, v65, v66);
  self->_zNear = sub_1B1860734((uint64_t)self->_light, v67, v68, v69, v70, v71, v72, v73);
  self->_zFar = sub_1B1860694((uint64_t)self->_light, v74, v75, v76, v77, v78, v79, v80);
  self->_shadowBias = sub_1B1860068((uint64_t)self->_light, v81, v82, v83, v84, v85, v86, v87);
  self->_spotInnerAngle = sub_1B185FC40((uint64_t)self->_light, v88, v89, v90, v91, v92, v93, v94);
  self->_spotOuterAngle = sub_1B186045C((uint64_t)self->_light, v95, v96, v97, v98, v99, v100, v101);
  self->_spotFalloffExponent = sub_1B185FA20((uint64_t)self->_light, v102, v103, v104, v105, v106, v107, v108);
  *(&self->_spotFalloffExponent + 1) = sub_1B186038C((uint64_t)self->_light, v109, v110, v111, v112, v113, v114, v115);

  v122 = (VFXMaterialProperty *)sub_1B185F064((uint64_t)self->_light, 0, v116, v117, v118, v119, v120, v121);
  if (v122)
  {
    v129 = [VFXMaterialProperty alloc];
    v122 = (VFXMaterialProperty *)objc_msgSend_initWithParent_propertyType_(v129, v130, (uint64_t)self, 21);
  }
  self->_gobo = v122;
  v271 = 0u;
  v272 = 0u;
  v270 = 0u;
  sub_1B1860FEC((uint64_t)self->_light, v123, v124, v125, v126, v127, v128, (uint64_t)&v270);
  self->_areaType = v270;
  v131 = v270;
  *(float32x4_t *)self->_areaExtents = vaddq_f32(v271, v271);
  v269[0] = v131;
  v269[1] = v271;
  v269[2] = v272;
  self->_areaPolygonVertices = (NSArray *)sub_1B1883F58((uint64_t)v269, v132, v133, v134);
  self->_drawsArea = sub_1B1860E14((uint64_t)self->_light, v135, v136, v137, v138, v139, v140, v141);
  self->_doubleSided = sub_1B1860F8C((uint64_t)self->_light, v142, v143, v144, v145, v146, v147, v148);
  self->_categoryBitMask = sub_1B185FE0C((uint64_t)self->_light, v149, v150, v151, v152, v153, v154, v155);
  self->_orthographicScale = sub_1B185FFC8((uint64_t)self->_light, v156, v157, v158, v159, v160, v161, v162);
  self->_shadowSampleCount = sub_1B18602B0((uint64_t)self->_light, v163, v164, v165, v166, v167, v168, v169);
  if (sub_1B18622E8((uint64_t)self->_light, v170, v171, v172, v173, v174, v175, v176))
    v177 = 32;
  else
    v177 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xDF | v177;
  self->_maximumShadowDistance = sub_1B18624C4((uint64_t)self->_light);
  self->_shadowCascadeCount = sub_1B185F610((uint64_t)self->_light, v178, v179, v180, v181, v182, v183, v184);
  self->_shadowCascadeSplittingFactor = sub_1B1862520((uint64_t)self->_light, v185, v186, v187, v188, v189, v190, v191);
  if (sub_1B18627C0((uint64_t)self->_light, v192, v193, v194, v195, v196, v197, v198))
    v199 = 64;
  else
    v199 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xBF | v199;
  if (sub_1B1862870((uint64_t)self->_light))
    v200 = 0x80;
  else
    v200 = 0;
  *((_BYTE *)self + 16) = v200 & 0x80 | *((_BYTE *)self + 16) & 0x7F;

  v207 = (VFXMaterialProperty *)sub_1B185F0C8((uint64_t)self->_light, 0, v201, v202, v203, v204, v205, v206);
  if (v207)
  {
    v215 = [VFXMaterialProperty alloc];
    v207 = (VFXMaterialProperty *)objc_msgSend_initWithParent_propertyType_(v215, v216, (uint64_t)self, 24);
  }
  self->_probeEnvironment = v207;
  self->_probeType = sub_1B1861474((uint64_t)self->_light, v208, v209, v210, v211, v212, v213, v214);
  self->_probeUpdateType = sub_1B18615F0((uint64_t)self->_light, v217, v218, v219, v220, v221, v222, v223);
  self->_parallaxCorrectionEnabled = sub_1B18616A4((uint64_t)self->_light, v224, v225, v226, v227, v228, v229, v230);
  *(__n128 *)&self->_probeExtents[7] = sub_1B18618E0((__n128 *)self->_light, v231, v232, v233, v234, v235, v236, v237);
  *(__n128 *)&self->_probeOffset[7] = sub_1B1861998((__n128 *)self->_light, v238, v239, v240, v241, v242, v243, v244);
  *(__n128 *)&self->_parallaxExtentsFactor[7] = sub_1B1861818((__n128 *)self->_light, v245, v246, v247, v248, v249, v250, v251);
  *(__n128 *)&self->_parallaxCenterOffset[7] = sub_1B1861764((__n128 *)self->_light, v252, v253, v254, v255, v256, v257, v258);
  objc_msgSend__syncEntityObjCModel(self, v259, v260, v261);
  if (v13)
    sub_1B18797B4(v13, v262, v263, v264, v265, v266, v267, v268);
}

- (id)presentationLight
{
  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (id)((uint64_t (*)(__objc2_class *, char *, _QWORD))MEMORY[0x1E0DE7D20])(VFXLight, sel_presentationLightWithLightRef_, *((_QWORD *)self + 1));
  return self;
}

+ (id)presentationLightWithLightRef:(__CFXLight *)a3
{
  VFXLight *v4;
  const char *v5;
  uint64_t v6;

  v4 = [VFXLight alloc];
  return (id)objc_msgSend_initPresentationLightWithLightRef_(v4, v5, (uint64_t)a3, v6);
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (__CFXWorld)worldRef
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (_QWORD *)objc_msgSend___CFObject(self, a2, v2, v3);
  return (__CFXWorld *)sub_1B17C6244(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)world
{
  uint64_t v2;
  uint64_t v3;
  id result;

  result = (id)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
    return sub_1B193E758((id *)result);
  return result;
}

- (void)__CFObject
{
  return self->_light;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4
{
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;

  if (self->_gobo != a4)
    return 0;
  v6 = (__CFString *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@.%@"), (uint64_t)a4, CFSTR("gobo"), a3);
  return sub_1B18C2DEC(self, v6, v7, v8);
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
    v22[2] = sub_1B18842D4;
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
  v12[2] = sub_1B18844A4;
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
  v14[2] = sub_1B1884550;
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
    v13[2] = sub_1B188460C;
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
    v15[2] = sub_1B18846D0;
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
    v29[2] = sub_1B1884BB0;
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
  v14[2] = sub_1B1884CDC;
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
  v8[2] = sub_1B1884D88;
  v8[3] = &unk_1E63D5378;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (BOOL)rawFloat3ForKey:(id)a3 value:
{
  uint64_t v3;
  _OWORD *v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int isEqualToString;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = (_OWORD *)v3;
  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("areaExtents"), v3))
  {
    objc_msgSend_areaExtents(self, v7, v8, v9);
LABEL_11:
    *v4 = v10;
    LOBYTE(isEqualToString) = 1;
    return isEqualToString;
  }
  if (objc_msgSend_isEqualToString_(a3, v7, (uint64_t)CFSTR("probeExtents"), v9))
  {
    objc_msgSend_probeExtents(self, v11, v12, v13);
    goto LABEL_11;
  }
  if (objc_msgSend_isEqualToString_(a3, v11, (uint64_t)CFSTR("probeOffset"), v13))
  {
    objc_msgSend_probeOffset(self, v14, v15, v16);
    goto LABEL_11;
  }
  if (objc_msgSend_isEqualToString_(a3, v14, (uint64_t)CFSTR("parallaxExtentsFactor"), v16))
  {
    objc_msgSend_parallaxExtentsFactor(self, v17, v18, v19);
    goto LABEL_11;
  }
  isEqualToString = objc_msgSend_isEqualToString_(a3, v17, (uint64_t)CFSTR("parallaxCenterOffset"), v19);
  if (isEqualToString)
  {
    objc_msgSend_parallaxCenterOffset(self, v21, v22, v23);
    goto LABEL_11;
  }
  return isEqualToString;
}

- (id)_valueForSimdVectorKeyPath:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  int v24;
  void *v25;
  uint64_t v26;

  v25 = 0;
  v26 = 0;
  sub_1B18BCE30(a3, (char *)&v26, (uint64_t *)&v25, v3);
  if (qword_1EEF65EF0 != -1)
    dispatch_once(&qword_1EEF65EF0, &unk_1E63D0DF0);
  if (!v25)
    return 0;
  if (!objc_msgSend_containsObject_((void *)qword_1EEF65EE8, v5, (uint64_t)v25, v6))
    return 0;
  v24 = 0;
  v23 = 0;
  if (!objc_msgSend_rawFloat3ForKey_value_(self, v7, v26, (uint64_t)&v23))
    return 0;
  if (objc_msgSend_isEqualToString_(v25, v8, (uint64_t)CFSTR("x"), v9))
  {
    LODWORD(v13) = v23;
    return (id)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v10, v11, v12, v13);
  }
  if (objc_msgSend_isEqualToString_(v25, v10, (uint64_t)CFSTR("y"), v12))
  {
    LODWORD(v18) = HIDWORD(v23);
    return (id)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v15, v16, v17, v18);
  }
  if (!objc_msgSend_isEqualToString_(v25, v15, (uint64_t)CFSTR("z"), v17))
    return 0;
  LODWORD(v22) = v24;
  return (id)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v19, v20, v21, v22);
}

- (id)valueForKeyPath:(id)a3
{
  uint64_t v3;
  id result;
  objc_super v7;

  if (!a3)
    return 0;
  result = (id)objc_msgSend__valueForSimdVectorKeyPath_(self, a2, (uint64_t)a3, v3);
  if (!result)
  {
    v7.receiver = self;
    v7.super_class = (Class)VFXLight;
    return -[VFXLight valueForKeyPath:](&v7, sel_valueForKeyPath_, a3);
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  const char *v11;
  uint64_t v12;
  objc_super v13;

  if (objc_msgSend_isEqual_(a3, a2, (uint64_t)CFSTR("color"), (uint64_t)a4))
  {
    objc_msgSend_setColor_(self, v11, (uint64_t)a4, v12);
  }
  else if ((objc_msgSend_isEqual_(a3, v11, (uint64_t)CFSTR("image"), v12) & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXLight;
    -[VFXLight observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5, a6);
  }
}

- (id)valueForKey:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v26;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("areaExtents"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_areaExtents(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("probeExtents"), v8))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_probeExtents(self, v13, v14, v15);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v13, (uint64_t)CFSTR("probeOffset"), v15))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_probeOffset(self, v16, v17, v18);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v16, (uint64_t)CFSTR("parallaxCenterOffset"), v18))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_parallaxCenterOffset(self, v19, v20, v21);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v19, (uint64_t)CFSTR("parallaxExtentsFactor"), v21))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_parallaxExtentsFactor(self, v22, v23, v24);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  v26.receiver = self;
  v26.super_class = (Class)VFXLight;
  return -[VFXLight valueForKey:](&v26, sel_valueForKey_, a3);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
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
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v37;

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("areaExtents"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setAreaExtents_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, (uint64_t)CFSTR("probeExtents"), v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setProbeExtents_(self, v16, v17, v18);
  }
  else if (objc_msgSend_isEqualToString_(a4, v13, (uint64_t)CFSTR("probeOffset"), v15))
  {
    objc_msgSend_VFXFloat3Value(a3, v19, v20, v21);
    objc_msgSend_setProbeOffset_(self, v22, v23, v24);
  }
  else if (objc_msgSend_isEqualToString_(a4, v19, (uint64_t)CFSTR("parallaxCenterOffset"), v21))
  {
    objc_msgSend_VFXFloat3Value(a3, v25, v26, v27);
    objc_msgSend_setParallaxCenterOffset_(self, v28, v29, v30);
  }
  else if (objc_msgSend_isEqualToString_(a4, v25, (uint64_t)CFSTR("parallaxExtentsFactor"), v27))
  {
    objc_msgSend_VFXFloat3Value(a3, v31, v32, v33);
    objc_msgSend_setParallaxExtentsFactor_(self, v34, v35, v36);
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)VFXLight;
    -[VFXLight setValue:forKey:](&v37, sel_setValue_forKey_, a3, a4);
  }
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B18C2DEC(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
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
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
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
  const char *v73;
  uint64_t v74;
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
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
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
  const char *v103;
  uint64_t v104;
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
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
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
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t updated;
  const char *v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  v13 = objc_msgSend_color(self, v10, v11, v12);
  objc_msgSend_setColor_(v4, v14, v13, v15);
  v19 = objc_msgSend_name(self, v16, v17, v18);
  objc_msgSend_setName_(v4, v20, v19, v21);
  v25 = objc_msgSend_type(self, v22, v23, v24);
  objc_msgSend_setType_(v4, v26, v25, v27);
  objc_msgSend_temperature(self, v28, v29, v30);
  objc_msgSend_setTemperature_(v4, v31, v32, v33);
  objc_msgSend_intensity(self, v34, v35, v36);
  objc_msgSend_setIntensity_(v4, v37, v38, v39);
  objc_msgSend_shadowIntensity(self, v40, v41, v42);
  objc_msgSend_setShadowIntensity_(v4, v43, v44, v45);
  objc_msgSend_shadowMapSize(self, v46, v47, v48);
  objc_msgSend_setShadowMapSize_(v4, v49, v50, v51);
  objc_msgSend_shadowRadius(self, v52, v53, v54);
  objc_msgSend_setShadowRadius_(v4, v55, v56, v57);
  v61 = objc_msgSend_castsShadow(self, v58, v59, v60);
  objc_msgSend_setCastsShadow_(v4, v62, v61, v63);
  v67 = objc_msgSend_shadowSampleCount(self, v64, v65, v66);
  objc_msgSend_setShadowSampleCount_(v4, v68, v67, v69);
  objc_msgSend_shadowBias(self, v70, v71, v72);
  objc_msgSend_setShadowBias_(v4, v73, v74, v75);
  objc_msgSend_orthographicScale(self, v76, v77, v78);
  objc_msgSend_setOrthographicScale_(v4, v79, v80, v81);
  objc_msgSend_zNear(self, v82, v83, v84);
  objc_msgSend_setZNear_(v4, v85, v86, v87);
  objc_msgSend_zFar(self, v88, v89, v90);
  objc_msgSend_setZFar_(v4, v91, v92, v93);
  v97 = objc_msgSend_categoryBitMask(self, v94, v95, v96);
  objc_msgSend_setCategoryBitMask_(v4, v98, v97, v99);
  objc_msgSend_attenuationDistance(self, v100, v101, v102);
  objc_msgSend_setAttenuationDistance_(v4, v103, v104, v105);
  objc_msgSend_spotInnerAngle(self, v106, v107, v108);
  objc_msgSend_setSpotInnerAngle_(v4, v109, v110, v111);
  objc_msgSend_spotOuterAngle(self, v112, v113, v114);
  objc_msgSend_setSpotOuterAngle_(v4, v115, v116, v117);
  objc_msgSend_maximumShadowDistance(self, v118, v119, v120);
  objc_msgSend_setMaximumShadowDistance_(v4, v121, v122, v123);
  v127 = objc_msgSend_sampleDistributedShadowMaps(self, v124, v125, v126);
  objc_msgSend_setSampleDistributedShadowMaps_(v4, v128, v127, v129);
  v133 = objc_msgSend_forcesBackFaceCasters(self, v130, v131, v132);
  objc_msgSend_setForcesBackFaceCasters_(v4, v134, v133, v135);
  v139 = objc_msgSend_automaticallyAdjustsShadowProjection(self, v136, v137, v138);
  objc_msgSend_setAutomaticallyAdjustsShadowProjection_(v4, v140, v139, v141);
  v145 = objc_msgSend_shadowCascadeCount(self, v142, v143, v144);
  objc_msgSend_setShadowCascadeCount_(v4, v146, v145, v147);
  objc_msgSend_shadowCascadeSplittingFactor(self, v148, v149, v150);
  objc_msgSend_setShadowCascadeSplittingFactor_(v4, v151, v152, v153);
  if (self->_gobo)
  {
    v157 = (void *)objc_msgSend_gobo(v4, v154, v155, v156);
    objc_msgSend_copyPropertiesFrom_(v157, v158, (uint64_t)self->_gobo, v159);
  }
  v160 = objc_msgSend_IESProfile(self, v154, v155, v156);
  objc_msgSend_setIESProfile_(v4, v161, v160, v162);
  v166 = objc_msgSend_areaType(self, v163, v164, v165);
  objc_msgSend_setAreaType_(v4, v167, v166, v168);
  objc_msgSend_areaExtents(self, v169, v170, v171);
  objc_msgSend_setAreaExtents_(v4, v172, v173, v174);
  v178 = objc_msgSend_areaPolygonVertices(self, v175, v176, v177);
  objc_msgSend_setAreaPolygonVertices_(v4, v179, v178, v180);
  v184 = objc_msgSend_drawsArea(self, v181, v182, v183);
  objc_msgSend_setDrawsArea_(v4, v185, v184, v186);
  v190 = objc_msgSend_doubleSided(self, v187, v188, v189);
  objc_msgSend_setDoubleSided_(v4, v191, v190, v192);
  v196 = objc_msgSend_probeType(self, v193, v194, v195);
  objc_msgSend_setProbeType_(v4, v197, v196, v198);
  updated = objc_msgSend_probeUpdateType(self, v199, v200, v201);
  objc_msgSend_setProbeUpdateType_(v4, v203, updated, v204);
  objc_msgSend_probeExtents(self, v205, v206, v207);
  objc_msgSend_setProbeExtents_(v4, v208, v209, v210);
  objc_msgSend_probeOffset(self, v211, v212, v213);
  objc_msgSend_setProbeOffset_(v4, v214, v215, v216);
  v220 = objc_msgSend_parallaxCorrectionEnabled(self, v217, v218, v219);
  objc_msgSend_setParallaxCorrectionEnabled_(v4, v221, v220, v222);
  v226 = objc_msgSend_sphericalHarmonicsCoefficients(self, v223, v224, v225);
  objc_msgSend_setSphericalHarmonicsCoefficients_(v4, v227, v226, v228);
  if (self->_probeEnvironment)
  {
    v232 = (void *)objc_msgSend_probeEnvironment(v4, v229, v230, v231);
    objc_msgSend_copyPropertiesFrom_(v232, v233, (uint64_t)self->_probeEnvironment, v234);
  }
  objc_msgSend__copyAnimationsFrom_(v4, v229, (uint64_t)self, v231);
  objc_msgSend_commitImmediate(VFXTransaction, v235, v236, v237);
  return v4;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (NSData)sphericalHarmonicsCoefficients
{
  return self->_sphericalHarmonics;
}

- (void)setSphericalHarmonicsCoefficients:(id)a3
{
  NSData *sphericalHarmonics;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[6];

  sphericalHarmonics = self->_sphericalHarmonics;
  if (sphericalHarmonics != a3)
  {

    self->_sphericalHarmonics = (NSData *)objc_msgSend_copy(a3, v6, v7, v8);
    v12 = objc_msgSend_worldRef(self, v9, v10, v11);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B1885718;
    v14[3] = &unk_1E63D53C8;
    v14[4] = self;
    v14[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
  }
}

- (BOOL)shouldBakeDirectLighting
{
  return (*((unsigned __int8 *)self + 16) >> 3) & 1;
}

- (void)setShouldBakeDirectLighting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xF7 | v3;
}

- (BOOL)shouldBakeIndirectLighting
{
  return (*((unsigned __int8 *)self + 16) >> 4) & 1;
}

- (void)setShouldBakeIndirectLighting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xEF | v3;
}

- (void)_updateProbeStamp
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  _QWORD v7[5];

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1B18857F0;
  v7[3] = &unk_1E63D5378;
  v7[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, v5, (uint64_t)self, v7);
}

- (float)attenuationDistance
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_spotInnerAngle;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B185FC40((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B185FC40((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setAttenuationDistance:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_spotInnerAngle != a3)
  {
    self->_spotInnerAngle = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B188590C;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("attenuationDistance"), v9);
  }
}

- (BOOL)isBaked
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  int v5;
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
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = *((unsigned __int8 *)self + 16);
  if ((v4 & 1) != 0)
  {
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      v15 = v7;
      sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
      v23 = sub_1B185FC88((uint64_t)self->_light, v16, v17, v18, v19, v20, v21, v22);
      sub_1B18797B4(v15, v24, v25, v26, v27, v28, v29, v30);
      LOBYTE(v5) = v23;
    }
    else
    {
      LOBYTE(v5) = sub_1B185FC88((uint64_t)self->_light, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    return (v4 >> 2) & 1;
  }
  return v5;
}

- (void)setBaked:(BOOL)a3
{
  uint64_t v3;
  char v4;
  char v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = *((_BYTE *)self + 16);
  if (((((v4 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v7 = 4;
    else
      v7 = 0;
    *((_BYTE *)self + 16) = v4 & 0xFB | v7;
    v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B1885A34;
    v10[3] = &unk_1E63D5328;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (BOOL)castsShadow
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  int v5;
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
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = *((unsigned __int8 *)self + 16);
  if ((v4 & 1) != 0)
  {
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      v15 = v7;
      sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
      v23 = sub_1B185F4D4((uint64_t)self->_light, v16, v17, v18, v19, v20, v21, v22);
      sub_1B18797B4(v15, v24, v25, v26, v27, v28, v29, v30);
      LOBYTE(v5) = v23;
    }
    else
    {
      LOBYTE(v5) = sub_1B185F4D4((uint64_t)self->_light, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    return (v4 >> 1) & 1;
  }
  return v5;
}

- (void)setCastsShadow:(BOOL)a3
{
  uint64_t v3;
  char v4;
  char v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = *((_BYTE *)self + 16);
  if (((((v4 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v7 = 2;
    else
      v7 = 0;
    *((_BYTE *)self + 16) = v4 & 0xFD | v7;
    v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B1885B5C;
    v10[3] = &unk_1E63D5328;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (unint64_t)categoryBitMask
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_categoryBitMask;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B185FE0C((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B185FE0C((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setCategoryBitMask:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_categoryBitMask != a3)
  {
    self->_categoryBitMask = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1885C68;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (id)color
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_color;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v15 = sub_1B185F68C((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v5 = (void *)sub_1B18BCF74(v15, v16, v17, v18);
  if (v14)
    sub_1B18797B4(v14, v19, v20, v21, v22, v23, v24, v25);
  return v5;
}

- (void)setColor:(id)a3
{
  id color;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  color = self->_color;
  if (color != a3)
  {

    self->_color = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B1885D7C;
    v11[3] = &unk_1E63D53C8;
    v11[4] = a3;
    v11[5] = self;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, CFSTR("color"), v11);
  }
}

- (double)extendedLinearSRGBColor
{
  const void *v4;

  v4 = (const void *)objc_msgSend_color(a1, a2, a3, a4);
  return COERCE_DOUBLE(sub_1B18BCF20(v4, 0));
}

- (void)setExtendedLinearSRGBColor:(VFXLight *)self
{
  __int128 v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[0] = 0;
  v10[1] = 0;
  sub_1B179CD74((float *)v10, *(float *)&v2, *((float *)&v2 + 1), *((float *)&v2 + 2), 1.0);
  v7 = sub_1B18BCF74((uint64_t)v10, v4, v5, v6);
  objc_msgSend_setColor_(self, v8, v7, v9);
}

- (float)intensity
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_intensity;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B185FEC0((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B185FEC0((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setIntensity:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_intensity != a3)
  {
    self->_intensity = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B1885F44;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("intensity"), v9);
  }
}

- (float)orthographicScale
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_orthographicScale;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B185FFC8((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B185FFC8((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setOrthographicScale:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_orthographicScale != a3)
  {
    self->_orthographicScale = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B1886068;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("orthographicScale"), v9);
  }
}

- (float)shadowBias
{
  uint64_t v2;
  uint64_t v3;
  double v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v5 = sub_1B1860068((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
      sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
    }
    else
    {
      return sub_1B1860068((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    return self->_shadowBias;
  }
  return v5;
}

- (void)setShadowBias:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  double v6;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  float v11;

  v6 = a3;
  if (self->_shadowBias != v6)
  {
    self->_shadowBias = v6;
    v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B188618C;
    v10[3] = &unk_1E63D53A0;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("shadowBias"), v10);
  }
}

- (float)shadowIntensity
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_shadowIntensity;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B185F6D4((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B185F6D4((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setShadowIntensity:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];

  if (self->_shadowIntensity != a3)
  {
    self->_shadowIntensity = a3;
    v6 = objc_msgSend_worldRef(self, a2, v3, v4);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B18862A4;
    v8[3] = &unk_1E63D5378;
    v8[4] = self;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("shadowIntensity"), v8);
  }
}

- (CGSize)shadowMapSize
{
  uint64_t v2;
  uint64_t v3;
  CGSize shadowMapSize;
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
  uint64_t v21;
  double height;
  CGSize v23;
  CGSize result;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
    shadowMapSize = (CGSize)vcvtq_f64_f32(COERCE_FLOAT32X2_T(sub_1B1860108((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13)));
    if (v14)
    {
      v23 = shadowMapSize;
      sub_1B18797B4(v14, v15, v16, v17, v18, v19, v20, v21);
      shadowMapSize = v23;
    }
  }
  else
  {
    shadowMapSize = self->_shadowMapSize;
  }
  height = shadowMapSize.height;
  result.width = shadowMapSize.width;
  result.height = height;
  return result;
}

- (void)setShadowMapSize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  int32x2_t v6;
  int64x2_t v7;
  CGFloat height;
  float64x2_t v9;
  int32x2_t v10;
  int8x8_t v12;
  int8x8_t v13;
  int8x8_t v14;
  int8x8_t v15;
  int8x8_t v16;
  int32x2_t v17;
  uint64x2_t v18;
  uint64_t v19;
  const char *v20;
  _QWORD v21[5];

  v5 = a3.width <= 0.0;
  if (a3.height <= 0.0)
    v5 = 1;
  v6 = vdup_n_s32(v5);
  v7.i64[0] = v6.u32[0];
  v7.i64[1] = v6.u32[1];
  height = a3.height;
  v9 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v7, 0x3FuLL)), (int8x16_t)vdupq_n_s64(0x4090000000000000uLL), (int8x16_t)a3);
  v10 = vmovn_s64(vceqq_f64(v9, (float64x2_t)self->_shadowMapSize));
  if ((v10.i32[0] & v10.i32[1] & 1) == 0)
  {
    v12 = (int8x8_t)vadd_s32(vmovn_s64((int64x2_t)vcvtq_u64_f64(v9)), (int32x2_t)-1);
    v13 = vorr_s8((int8x8_t)vshr_n_u32((uint32x2_t)v12, 1uLL), v12);
    v14 = vorr_s8((int8x8_t)vshr_n_u32((uint32x2_t)v13, 2uLL), v13);
    v15 = vorr_s8((int8x8_t)vshr_n_u32((uint32x2_t)v14, 4uLL), v14);
    v16 = vorr_s8((int8x8_t)vshr_n_u32((uint32x2_t)v15, 8uLL), v15);
    v17 = vadd_s32((int32x2_t)vorr_s8((int8x8_t)vshr_n_u32((uint32x2_t)v16, 0x10uLL), v16), (int32x2_t)0x100000001);
    v18.i64[0] = v17.u32[0];
    v18.i64[1] = v17.u32[1];
    self->_shadowMapSize = (CGSize)vcvtq_f64_u64(v18);
    v19 = objc_msgSend_worldRef(self, a2, v3, v4);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1B1886430;
    v21[3] = &unk_1E63D5378;
    v21[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v20, v19, (uint64_t)self, v21);
  }
}

- (float)shadowRadius
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_shadowRadius;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B185F578((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B185F578((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setShadowRadius:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_shadowRadius != a3)
  {
    self->_shadowRadius = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B1886554;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("shadowRadius"), v9);
  }
}

- (unint64_t)shadowSampleCount
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_shadowSampleCount;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B18602B0((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v5 = sub_1B18602B0((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setShadowSampleCount:(unint64_t)a3
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (a3 >= 0x40)
    v4 = 64;
  else
    v4 = a3;
  if (v4 != self->_shadowSampleCount)
  {
    self->_shadowSampleCount = v4;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1886668;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = v4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)spotFalloffExponent
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return *(&self->_spotFalloffExponent + 1);
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B186038C((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B186038C((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setSpotFalloffExponent:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (*(&self->_spotFalloffExponent + 1) != a3)
  {
    *(&self->_spotFalloffExponent + 1) = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B188678C;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("spotFalloffExponent"), v9);
  }
}

- (float)spotInnerAngle
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_spotOuterAngle;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B186045C((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B186045C((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setSpotInnerAngle:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_spotOuterAngle != a3)
  {
    self->_spotOuterAngle = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18868B0;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("spotInnerAngle"), v9);
  }
}

- (float)spotOuterAngle
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_spotFalloffExponent;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B185FA20((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B185FA20((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setSpotOuterAngle:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_spotFalloffExponent != a3)
  {
    self->_spotFalloffExponent = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18869D4;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("spotOuterAngle"), v9);
  }
}

- (float)temperature
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_temperature;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B18605AC((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B18605AC((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setTemperature:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_temperature != a3)
  {
    self->_temperature = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B1886AF8;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("temperature"), v9);
  }
}

- (void)_resyncObjCModelOfPerTypeParametersWithOldType:(int)a3
{
  __int128 v4;
  unsigned int type;
  float intensity;
  float v7;

  self->_spotOuterAngle = 45.0;
  self->_spotFalloffExponent = 60.0;
  *((_DWORD *)&self->_spotFalloffExponent + 1) = 0x40000000;
  self->_drawsArea = 1;
  self->_doubleSided = 0;
  *(_QWORD *)&v4 = 0x3F0000003F000000;
  *((_QWORD *)&v4 + 1) = 0x3F0000003F000000;
  *(_OWORD *)self->_areaExtents = v4;
  self->_areaType = 1;
  self->_probeType = 0;
  self->_probeUpdateType = 0;
  self->_parallaxCorrectionEnabled = 0;
  *(_OWORD *)&self->_probeExtents[7] = xmmword_1B2246DF0;
  *(_OWORD *)&self->_probeOffset[7] = xmmword_1B2246DE0;
  *(_OWORD *)&self->_parallaxExtentsFactor[7] = xmmword_1B2246E10;
  *(_OWORD *)&self->_parallaxCenterOffset[7] = xmmword_1B2246E00;
  type = self->_type;
  intensity = self->_intensity;
  v7 = intensity / sub_1B185EA08(a3);
  self->_intensity = v7 * sub_1B185EA08(type);

  self->_IESProfile = 0;
}

- (int64_t)type
{
  uint64_t v2;
  uint64_t v3;
  int64_t v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_type;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return (int)sub_1B186064C((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v5 = (int)sub_1B186064C((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setType:(int64_t)a3
{
  uint64_t v3;
  int64_t type;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[6];

  type = self->_type;
  if (type != a3)
  {
    self->_type = a3;
    objc_msgSend__resyncObjCModelOfPerTypeParametersWithOldType_(self, a2, type, v3);
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1B1886D24;
    v12[3] = &unk_1E63D5440;
    v12[4] = self;
    v12[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
  }
}

- (float)zFar
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_zFar;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1860694((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1860694((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setZFar:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  double v6;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  float v11;

  v6 = a3;
  if (self->_zFar != v6)
  {
    self->_zFar = v6;
    v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B1887040;
    v10[3] = &unk_1E63D53A0;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("zFar"), v10);
  }
}

- (float)zNear
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_zNear;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1860734((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1860734((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setZNear:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  double v6;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  float v11;

  v6 = a3;
  if (self->_zNear != v6)
  {
    self->_zNear = v6;
    v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B188716C;
    v10[3] = &unk_1E63D53A0;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("zNear"), v10);
  }
}

- (unint64_t)shadowCascadeCount
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v5 = sub_1B185F610((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
      sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
    }
    else
    {
      return sub_1B185F610((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    return self->_shadowCascadeCount;
  }
  return v5;
}

- (void)setShadowCascadeCount:(unint64_t)a3
{
  uint64_t v3;
  unsigned __int8 v5;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  unsigned __int8 v9;

  if (self->_shadowCascadeCount != a3)
  {
    if ((a3 & 0xFC) != 0)
      v5 = 4;
    else
      v5 = a3;
    self->_shadowCascadeCount = v5;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1887288;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = v5;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)automaticallyAdjustsShadowProjection
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  int v5;
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
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = *((unsigned __int8 *)self + 16);
  if ((v4 & 1) != 0)
  {
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      v15 = v7;
      sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
      v23 = sub_1B18622E8((uint64_t)self->_light, v16, v17, v18, v19, v20, v21, v22);
      sub_1B18797B4(v15, v24, v25, v26, v27, v28, v29, v30);
      LOBYTE(v5) = v23;
    }
    else
    {
      LOBYTE(v5) = sub_1B18622E8((uint64_t)self->_light, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    return (v4 >> 5) & 1;
  }
  return v5;
}

- (void)setAutomaticallyAdjustsShadowProjection:(BOOL)a3
{
  uint64_t v3;
  char v4;
  char v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = *((_BYTE *)self + 16);
  if (((((v4 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v7 = 32;
    else
      v7 = 0;
    *((_BYTE *)self + 16) = v4 & 0xDF | v7;
    v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B18873B0;
    v10[3] = &unk_1E63D5328;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (float)maximumShadowDistance
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_maximumShadowDistance;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B18624C4((uint64_t)self->_light);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v15 = sub_1B18624C4((uint64_t)self->_light);
  sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
  return v15;
}

- (void)setMaximumShadowDistance:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  float v5;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  v5 = a3;
  LOBYTE(a3) = self->_shadowCascadeCount;
  if ((float)LODWORD(a3) != v5)
  {
    self->_maximumShadowDistance = v5;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18874D8;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = v5;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (BOOL)forcesBackFaceCasters
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  int v5;
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
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = *((unsigned __int8 *)self + 16);
  if ((v4 & 1) != 0)
  {
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      v15 = v7;
      sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
      v23 = sub_1B18627C0((uint64_t)self->_light, v16, v17, v18, v19, v20, v21, v22);
      sub_1B18797B4(v15, v24, v25, v26, v27, v28, v29, v30);
      LOBYTE(v5) = v23;
    }
    else
    {
      LOBYTE(v5) = sub_1B18627C0((uint64_t)self->_light, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    return (v4 >> 6) & 1;
  }
  return v5;
}

- (void)setForcesBackFaceCasters:(BOOL)a3
{
  uint64_t v3;
  char v4;
  char v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = *((_BYTE *)self + 16);
  if (((((v4 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v7 = 64;
    else
      v7 = 0;
    *((_BYTE *)self + 16) = v4 & 0xBF | v7;
    v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B1887600;
    v10[3] = &unk_1E63D5328;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (BOOL)sampleDistributedShadowMaps
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = *((unsigned __int8 *)self + 16);
  if ((v4 & 1) != 0)
  {
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v7)
    {
      v15 = v7;
      sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
      v16 = sub_1B1862870((uint64_t)self->_light);
      sub_1B18797B4(v15, v17, v18, v19, v20, v21, v22, v23);
      LOBYTE(v5) = v16;
    }
    else
    {
      LOBYTE(v5) = sub_1B1862870((uint64_t)self->_light);
    }
  }
  else
  {
    return v4 >> 7;
  }
  return v5;
}

- (void)setSampleDistributedShadowMaps:(BOOL)a3
{
  uint64_t v3;
  unsigned int v4;
  char v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = *((unsigned __int8 *)self + 16);
  if (a3 != v4 >> 7)
  {
    if (a3)
      v7 = 0x80;
    else
      v7 = 0;
    *((_BYTE *)self + 16) = v7 & 0x80 | v4 & 0x7F;
    v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B188771C;
    v10[3] = &unk_1E63D5328;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (float)shadowCascadeSplittingFactor
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_shadowCascadeSplittingFactor;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1862520((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1862520((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setShadowCascadeSplittingFactor:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  double v6;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  float v11;

  v6 = a3;
  if (self->_shadowCascadeSplittingFactor != v6)
  {
    self->_shadowCascadeSplittingFactor = v6;
    v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B1887840;
    v10[3] = &unk_1E63D53A0;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (float)_shadowCascadeDebugFactor
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_cascadeDebugFactor;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1862618((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1862618((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)set_shadowCascadeDebugFactor:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  double v6;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  float v11;

  v6 = a3;
  if (self->_cascadeDebugFactor != v6)
  {
    self->_cascadeDebugFactor = v6;
    v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B188796C;
    v10[3] = &unk_1E63D53A0;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("shadowCascadeDebugFactor"), v10);
  }
}

- (int64_t)probeType
{
  uint64_t v2;
  uint64_t v3;
  int64_t v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_probeType;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1861474((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v5 = sub_1B1861474((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setProbeType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_probeType != a3)
  {
    self->_probeType = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1887A78;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)probeUpdateType
{
  uint64_t v2;
  uint64_t v3;
  int64_t v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_probeUpdateType;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B18615F0((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v5 = sub_1B18615F0((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setProbeUpdateType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_probeUpdateType != a3)
  {
    self->_probeUpdateType = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1887B84;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)parallaxCorrectionEnabled
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_parallaxCorrectionEnabled;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B18616A4((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B18616A4((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setParallaxCorrectionEnabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_parallaxCorrectionEnabled != a3)
  {
    self->_parallaxCorrectionEnabled = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1887C94;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (double)parallaxCenterOffset
{
  __int128 v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v30;

  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v30 = sub_1B1861764((__n128 *)*(_QWORD *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(_QWORD *)&v5 = v30;
    }
    else
    {
      *(_QWORD *)&v5 = sub_1B1861764((__n128 *)*(_QWORD *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    v5 = *(_OWORD *)(a1 + 240);
  }
  return *(double *)&v5;
}

- (void)setParallaxCenterOffset:(VFXLight *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  uint32x4_t v5;
  uint64_t v7;
  const char *v8;
  float32x4_t v9;
  _QWORD v10[4];
  float32x4_t v11;
  VFXLight *v12;

  v5 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_parallaxCenterOffset[7], v4));
  v5.i32[3] = v5.i32[2];
  if ((vmaxvq_u32(v5) & 0x80000000) != 0)
  {
    *(float32x4_t *)&self->_parallaxCenterOffset[7] = v4;
    v9 = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B1887DB4;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v10);
  }
}

- (double)parallaxExtentsFactor
{
  __int128 v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v30;

  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v30 = sub_1B1861818((__n128 *)*(_QWORD *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(_QWORD *)&v5 = v30;
    }
    else
    {
      *(_QWORD *)&v5 = sub_1B1861818((__n128 *)*(_QWORD *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    v5 = *(_OWORD *)(a1 + 224);
  }
  return *(double *)&v5;
}

- (void)setParallaxExtentsFactor:(VFXLight *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  uint32x4_t v5;
  uint64_t v7;
  const char *v8;
  float32x4_t v9;
  _QWORD v10[4];
  float32x4_t v11;
  VFXLight *v12;

  v5 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_parallaxExtentsFactor[7], v4));
  v5.i32[3] = v5.i32[2];
  if ((vmaxvq_u32(v5) & 0x80000000) != 0)
  {
    *(float32x4_t *)&self->_parallaxExtentsFactor[7] = v4;
    v9 = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B1887ED4;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v10);
  }
}

- (double)probeExtents
{
  __int128 v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v30;

  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v30 = sub_1B18618E0((__n128 *)*(_QWORD *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(_QWORD *)&v5 = v30;
    }
    else
    {
      *(_QWORD *)&v5 = sub_1B18618E0((__n128 *)*(_QWORD *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    v5 = *(_OWORD *)(a1 + 192);
  }
  return *(double *)&v5;
}

- (void)setProbeExtents:(VFXLight *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  uint32x4_t v5;
  uint64_t v7;
  const char *v8;
  float32x4_t v9;
  _QWORD v10[4];
  float32x4_t v11;
  VFXLight *v12;

  v5 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_probeExtents[7], v4));
  v5.i32[3] = v5.i32[2];
  if ((vmaxvq_u32(v5) & 0x80000000) != 0)
  {
    *(float32x4_t *)&self->_probeExtents[7] = v4;
    v9 = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B1887FF4;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v10);
  }
}

- (double)probeOffset
{
  __int128 v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v30;

  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v30 = sub_1B1861998((__n128 *)*(_QWORD *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(_QWORD *)&v5 = v30;
    }
    else
    {
      *(_QWORD *)&v5 = sub_1B1861998((__n128 *)*(_QWORD *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    v5 = *(_OWORD *)(a1 + 208);
  }
  return *(double *)&v5;
}

- (void)setProbeOffset:(VFXLight *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  uint32x4_t v5;
  uint64_t v7;
  const char *v8;
  float32x4_t v9;
  _QWORD v10[4];
  float32x4_t v11;
  VFXLight *v12;

  v5 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_probeOffset[7], v4));
  v5.i32[3] = v5.i32[2];
  if ((vmaxvq_u32(v5) & 0x80000000) != 0)
  {
    *(float32x4_t *)&self->_probeOffset[7] = v4;
    v9 = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B1888114;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v10);
  }
}

- (VFXMaterialProperty)probeEnvironment
{
  uint64_t v2;
  uint64_t v3;
  VFXMaterialProperty *result;
  VFXMaterialProperty *v6;
  const char *v7;

  result = self->_probeEnvironment;
  if (!result)
  {
    v6 = [VFXMaterialProperty alloc];
    result = (VFXMaterialProperty *)objc_msgSend_initWithParent_propertyType_(v6, v7, (uint64_t)self, 24);
    self->_probeEnvironment = result;
  }
  if ((*((_BYTE *)self + 16) & 1) != 0)
    return (VFXMaterialProperty *)MEMORY[0x1E0DE7D20](result, sel_presentationMaterialProperty, v2, v3);
  return result;
}

- (int64_t)areaType
{
  uint64_t v2;
  uint64_t v3;
  int64_t v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v29[48];

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_areaType;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    v14 = v6;
    sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
    sub_1B1860FEC((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, (uint64_t)v29);
    v5 = v29[0];
    sub_1B18797B4(v14, v21, v22, v23, v24, v25, v26, v27);
  }
  else
  {
    sub_1B1860FEC((uint64_t)self->_light, v8, v9, v10, v11, v12, v13, (uint64_t)v29);
    return v29[0];
  }
  return v5;
}

- (void)setAreaType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  _QWORD v7[5];

  if (self->_areaType != a3)
  {
    self->_areaType = a3;
    v5 = objc_msgSend_worldRef(self, a2, a3, v3);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1B1888278;
    v7[3] = &unk_1E63D5378;
    v7[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, v5, (uint64_t)self, v7);
  }
}

- (double)areaExtents
{
  __int128 v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v30;

  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v30 = sub_1B1860EB4((__n128 *)*(_QWORD *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(_QWORD *)&v5 = v30;
    }
    else
    {
      *(_QWORD *)&v5 = sub_1B1860EB4((__n128 *)*(_QWORD *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    v5 = *(_OWORD *)(a1 + 320);
  }
  return *(double *)&v5;
}

- (void)setAreaExtents:(VFXLight *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  uint32x4_t v5;
  uint64_t v7;
  const char *v8;
  float32x4_t v9;
  _QWORD v10[4];
  float32x4_t v11;
  VFXLight *v12;

  v5 = (uint32x4_t)vceqq_f32(*(float32x4_t *)self->_areaExtents, v4);
  v5.i32[3] = v5.i32[2];
  if ((vminvq_u32(v5) & 0x80000000) == 0)
  {
    *(float32x4_t *)self->_areaExtents = v4;
    v9 = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B18883C4;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v10);
  }
}

- (BOOL)drawsArea
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_drawsArea;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1860E14((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1860E14((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setDrawsArea:(BOOL)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[5];
  BOOL v12;

  if (objc_msgSend_drawsArea(self, a2, a3, v3) != a3)
  {
    self->_drawsArea = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18884D8;
    v11[3] = &unk_1E63D5328;
    v11[4] = self;
    v12 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (BOOL)doubleSided
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_doubleSided;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B1860F8C((uint64_t)self->_light, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B1860F8C((uint64_t)self->_light, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setDoubleSided:(BOOL)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[5];
  BOOL v12;

  if (objc_msgSend_doubleSided(self, a2, a3, v3) != a3)
  {
    self->_doubleSided = a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18885EC;
    v11[3] = &unk_1E63D5328;
    v11[4] = self;
    v12 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (NSArray)areaPolygonVertices
{
  uint64_t v2;
  uint64_t v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_areaPolygonVertices;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  sub_1B1860FEC((uint64_t)self->_light, v8, v9, v10, v11, v12, v13, (uint64_t)&v27);
  v26[0] = v27;
  v26[1] = v28;
  v26[2] = v29;
  v5 = (NSArray *)sub_1B1883F58((uint64_t)v26, v15, v16, v17);
  if (v14)
    sub_1B18797B4(v14, v18, v19, v20, v21, v22, v23, v24);
  return v5;
}

- (void)setAreaPolygonVertices:(id)a3
{
  NSArray *areaPolygonVertices;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[5];

  areaPolygonVertices = self->_areaPolygonVertices;
  if (areaPolygonVertices != a3)
  {

    self->_areaPolygonVertices = (NSArray *)objc_msgSend_copy(a3, v6, v7, v8);
    v12 = objc_msgSend_worldRef(self, v9, v10, v11);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B1888728;
    v14[3] = &unk_1E63D5378;
    v14[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
  }
}

- (BOOL)hasGobo
{
  return self->_gobo != 0;
}

- (VFXMaterialProperty)gobo
{
  uint64_t v2;
  uint64_t v3;
  VFXMaterialProperty *result;
  VFXMaterialProperty *v6;
  const char *v7;

  result = self->_gobo;
  if (!result)
  {
    v6 = [VFXMaterialProperty alloc];
    result = (VFXMaterialProperty *)objc_msgSend_initWithParent_propertyType_(v6, v7, (uint64_t)self, 21);
    self->_gobo = result;
  }
  if ((*((_BYTE *)self + 16) & 1) != 0)
    return (VFXMaterialProperty *)MEMORY[0x1E0DE7D20](result, sel_presentationMaterialProperty, v2, v3);
  return result;
}

- (id)IESProfile
{
  return self->_IESProfile;
}

- (void)setIESProfile:(id)a3
{
  VFXIESProfile *IESProfile;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  IESProfile = self->_IESProfile;
  if (IESProfile != a3)
  {

    self->_IESProfile = (VFXIESProfile *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B1888844;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (void)_customEncodingOfVFXLight:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  double v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  float v35;
  float v36;
  float v37;
  double maximumShadowDistance;
  const char *v39;
  const char *v40;
  double shadowCascadeSplittingFactor;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  const char *v46;

  objc_msgSend_attenuationDistance(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeFloat_forKey_(a3, v6, (uint64_t)CFSTR("attenuationDistance"), v7);
  objc_msgSend_spotInnerAngle(self, v8, v9, v10);
  objc_msgSend_encodeFloat_forKey_(a3, v11, (uint64_t)CFSTR("spotInnerAngle"), v12);
  objc_msgSend_spotOuterAngle(self, v13, v14, v15);
  objc_msgSend_encodeFloat_forKey_(a3, v16, (uint64_t)CFSTR("spotOuterAngle"), v17);
  objc_msgSend_encodeInteger_forKey_(a3, v18, self->_categoryBitMask, (uint64_t)CFSTR("lightCategoryBitMask"));
  LODWORD(v19) = *((_DWORD *)&self->_spotFalloffExponent + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v20, (uint64_t)CFSTR("spotFallOffExponent"), v21, v19);
  if (self->_type == 4)
  {
    objc_msgSend_encodeInt_forKey_(a3, v22, LODWORD(self->_probeType), (uint64_t)CFSTR("probeType"));
    objc_msgSend_encodeInt_forKey_(a3, v24, LODWORD(self->_probeUpdateType), (uint64_t)CFSTR("probeUpdateType"));
    objc_msgSend_encodeBool_forKey_(a3, v25, self->_parallaxCorrectionEnabled, (uint64_t)CFSTR("parallaxCorrectionEnabled"));
    LODWORD(v26) = *(_DWORD *)&self->_probeExtents[7];
    objc_msgSend_encodeFloat_forKey_(a3, v27, (uint64_t)CFSTR("probeExtentsX"), v28, v26);
    LODWORD(v29) = *(_DWORD *)&self->_probeExtents[11];
    objc_msgSend_encodeFloat_forKey_(a3, v30, (uint64_t)CFSTR("probeExtentsY"), v31, v29);
    LODWORD(v32) = *(_DWORD *)&self->_probeExtents[15];
    objc_msgSend_encodeFloat_forKey_(a3, v33, (uint64_t)CFSTR("probeExtentsZ"), v34, v32);
    if (COERCE_FLOAT(*(_OWORD *)&self->_probeOffset[7]) == 0.0)
    {
      LODWORD(v35) = HIDWORD(*(_QWORD *)&self->_probeOffset[7]);
    }
    else
    {
      objc_msgSend_encodeFloat_forKey_(a3, v22, (uint64_t)CFSTR("probeOffsetX"), v23);
      v35 = *(float *)&self->_probeOffset[11];
    }
    if (v35 != 0.0)
      objc_msgSend_encodeFloat_forKey_(a3, v22, (uint64_t)CFSTR("probeOffsetY"), v23);
    if (*(float *)&self->_probeOffset[15] != 0.0)
      objc_msgSend_encodeFloat_forKey_(a3, v22, (uint64_t)CFSTR("probeOffsetZ"), v23);
    if (COERCE_FLOAT(*(_OWORD *)&self->_parallaxCenterOffset[7]) == 0.0)
    {
      LODWORD(v36) = HIDWORD(*(_QWORD *)&self->_parallaxCenterOffset[7]);
    }
    else
    {
      objc_msgSend_encodeFloat_forKey_(a3, v22, (uint64_t)CFSTR("parallaxOffsetX"), v23);
      v36 = *(float *)&self->_parallaxCenterOffset[11];
    }
    if (v36 != 0.0)
      objc_msgSend_encodeFloat_forKey_(a3, v22, (uint64_t)CFSTR("parallaxOffsetY"), v23);
    if (*(float *)&self->_parallaxCenterOffset[15] != 0.0)
      objc_msgSend_encodeFloat_forKey_(a3, v22, (uint64_t)CFSTR("parallaxOffsetZ"), v23);
    if (COERCE_FLOAT(*(_OWORD *)&self->_parallaxExtentsFactor[7]) == 1.0)
    {
      LODWORD(v37) = HIDWORD(*(_QWORD *)&self->_parallaxExtentsFactor[7]);
    }
    else
    {
      objc_msgSend_encodeFloat_forKey_(a3, v22, (uint64_t)CFSTR("parallaxExtentsFactorX"), v23);
      v37 = *(float *)&self->_parallaxExtentsFactor[11];
    }
    if (v37 != 1.0)
      objc_msgSend_encodeFloat_forKey_(a3, v22, (uint64_t)CFSTR("parallaxExtentsFactorY"), v23);
    if (*(float *)&self->_parallaxExtentsFactor[15] != 1.0)
      objc_msgSend_encodeFloat_forKey_(a3, v22, (uint64_t)CFSTR("parallaxExtentsFactorZ"), v23);
  }
  maximumShadowDistance = self->_maximumShadowDistance;
  *(float *)&maximumShadowDistance = maximumShadowDistance;
  objc_msgSend_encodeFloat_forKey_(a3, v22, (uint64_t)CFSTR("maximumShadowDistance"), v23, maximumShadowDistance);
  objc_msgSend_encodeBool_forKey_(a3, v39, (*((unsigned __int8 *)self + 16) >> 5) & 1, (uint64_t)CFSTR("autoShadowProjection"));
  objc_msgSend_encodeInt_forKey_(a3, v40, self->_shadowCascadeCount, (uint64_t)CFSTR("shadowCascadeCount"));
  shadowCascadeSplittingFactor = self->_shadowCascadeSplittingFactor;
  *(float *)&shadowCascadeSplittingFactor = shadowCascadeSplittingFactor;
  objc_msgSend_encodeFloat_forKey_(a3, v42, (uint64_t)CFSTR("shadowCascadeSplittingFactor"), v43, shadowCascadeSplittingFactor);
  objc_msgSend_encodeBool_forKey_(a3, v44, (*((unsigned __int8 *)self + 16) >> 6) & 1, (uint64_t)CFSTR("forcesBackFaceCasters"));
  objc_msgSend_encodeBool_forKey_(a3, v45, *((unsigned __int8 *)self + 16) >> 7, (uint64_t)CFSTR("sampleDistributedShadowMaps"));
  objc_msgSend_encodeInt32_forKey_(a3, v46, 1, (uint64_t)CFSTR("version"));
}

- (void)_customDecodingOfVFXLight:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
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
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  int v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
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
  const char *v59;
  uint64_t v60;

  if (objc_msgSend_containsValueForKey_(a3, a2, (uint64_t)CFSTR("attenuationDistance"), v3))
  {
    objc_msgSend_decodeFloatForKey_(a3, v6, (uint64_t)CFSTR("attenuationDistance"), v7);
    objc_msgSend_setAttenuationDistance_(self, v8, v9, v10);
  }
  objc_msgSend_decodeFloatForKey_(a3, v6, (uint64_t)CFSTR("spotInnerAngle"), v7);
  objc_msgSend_setSpotInnerAngle_(self, v11, v12, v13);
  objc_msgSend_decodeFloatForKey_(a3, v14, (uint64_t)CFSTR("spotOuterAngle"), v15);
  objc_msgSend_setSpotOuterAngle_(self, v16, v17, v18);
  if (objc_msgSend_containsValueForKey_(a3, v19, (uint64_t)CFSTR("maximumShadowDistance"), v20))
  {
    objc_msgSend_decodeFloatForKey_(a3, v21, (uint64_t)CFSTR("maximumShadowDistance"), v22);
    objc_msgSend_setMaximumShadowDistance_(self, v23, v24, v25);
  }
  if (objc_msgSend_containsValueForKey_(a3, v21, (uint64_t)CFSTR("autoShadowProjection"), v22))
  {
    v28 = objc_msgSend_decodeBoolForKey_(a3, v26, (uint64_t)CFSTR("autoShadowProjection"), v27);
    objc_msgSend_setAutomaticallyAdjustsShadowProjection_(self, v29, v28, v30);
  }
  if (objc_msgSend_containsValueForKey_(a3, v26, (uint64_t)CFSTR("forcesBackFaceCasters"), v27))
  {
    v33 = objc_msgSend_decodeBoolForKey_(a3, v31, (uint64_t)CFSTR("forcesBackFaceCasters"), v32);
    objc_msgSend_setForcesBackFaceCasters_(self, v34, v33, v35);
  }
  if (objc_msgSend_containsValueForKey_(a3, v31, (uint64_t)CFSTR("sampleDistributedShadowMaps"), v32))
  {
    v38 = objc_msgSend_decodeBoolForKey_(a3, v36, (uint64_t)CFSTR("sampleDistributedShadowMaps"), v37);
    objc_msgSend_setSampleDistributedShadowMaps_(self, v39, v38, v40);
  }
  if (objc_msgSend_containsValueForKey_(a3, v36, (uint64_t)CFSTR("shadowCascadeCount"), v37))
  {
    v43 = objc_msgSend_decodeIntForKey_(a3, v41, (uint64_t)CFSTR("shadowCascadeCount"), v42);
    objc_msgSend_setShadowCascadeCount_(self, v44, v43, v45);
  }
  if (objc_msgSend_containsValueForKey_(a3, v41, (uint64_t)CFSTR("shadowCascadeSplittingFactor"), v42))
  {
    objc_msgSend_decodeFloatForKey_(a3, v46, (uint64_t)CFSTR("shadowCascadeSplittingFactor"), v47);
    objc_msgSend_setShadowCascadeSplittingFactor_(self, v48, v49, v50);
  }
  if (objc_msgSend_containsValueForKey_(a3, v46, (uint64_t)CFSTR("spotFallOffExponent"), v47))
  {
    objc_msgSend_decodeFloatForKey_(a3, v51, (uint64_t)CFSTR("spotFallOffExponent"), v52);
    objc_msgSend_setSpotFalloffExponent_(self, v53, v54, v55);
  }
  if (objc_msgSend_containsValueForKey_(a3, v51, (uint64_t)CFSTR("lightCategoryBitMask"), v52))
  {
    v58 = objc_msgSend_decodeIntegerForKey_(a3, v56, (uint64_t)CFSTR("lightCategoryBitMask"), v57);
    objc_msgSend_setCategoryBitMask_(self, v59, v58, v60);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  NSData *sphericalHarmonics;
  NSString *name;
  int64_t type;
  const char *color;
  double v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  double zNear;
  const char *v34;
  uint64_t v35;
  double zFar;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  VFXMaterialProperty *gobo;
  VFXIESProfile *IESProfile;
  double v44;
  const char *v45;
  uint64_t v46;
  double v47;
  const char *v48;
  uint64_t v49;
  double v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  VFXMaterialProperty *probeEnvironment;
  uint64_t v59;
  uint64_t v60;

  if ((*((_BYTE *)self + 16) & 1) != 0)
    objc_msgSend__syncObjCModel(self, a2, (uint64_t)a3, v3);
  objc_msgSend__customEncodingOfVFXLight_(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeInt_forKey_(a3, v6, (*((unsigned __int8 *)self + 16) >> 1) & 1, (uint64_t)CFSTR("castsShadow"));
  objc_msgSend_encodeInt_forKey_(a3, v7, (*((unsigned __int8 *)self + 16) >> 2) & 1, (uint64_t)CFSTR("baked"));
  objc_msgSend_encodeInt_forKey_(a3, v8, (*((unsigned __int8 *)self + 16) >> 3) & 1, (uint64_t)CFSTR("shouldBakeDirectLighting"));
  objc_msgSend_encodeInt_forKey_(a3, v9, (*((unsigned __int8 *)self + 16) >> 4) & 1, (uint64_t)CFSTR("shouldBakeIndirectLighting"));
  sphericalHarmonics = self->_sphericalHarmonics;
  if (sphericalHarmonics)
    objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)sphericalHarmonics, (uint64_t)CFSTR("sphericalHarmonics"));
  name = self->_name;
  if (name)
    objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)name, (uint64_t)CFSTR("name"));
  type = self->_type;
  if (type)
    objc_msgSend_encodeInt_forKey_(a3, v10, type, (uint64_t)CFSTR("lightType"));
  color = (const char *)self->_color;
  if (color)
  {
    sub_1B18BDAB8(a3, color, (uint64_t)CFSTR("color"));
    sub_1B18BD07C(a3, self->_color, (uint64_t)CFSTR("vfxcolor"));
  }
  *(float *)&v12 = self->_shadowIntensity;
  objc_msgSend_encodeFloat_forKey_(a3, color, (uint64_t)CFSTR("shadowIntensity"), v11, v12);
  *(float *)&v17 = self->_shadowRadius;
  objc_msgSend_encodeFloat_forKey_(a3, v18, (uint64_t)CFSTR("shadowRadius"), v19, v17);
  objc_msgSend_encodeDouble_forKey_(a3, v20, (uint64_t)CFSTR("intensity"), v21, self->_intensity);
  objc_msgSend_encodeDouble_forKey_(a3, v22, (uint64_t)CFSTR("temperature"), v23, self->_temperature);
  *(float *)&v24 = self->_orthographicScale;
  objc_msgSend_encodeFloat_forKey_(a3, v25, (uint64_t)CFSTR("orthographicScale"), v26, v24);
  objc_msgSend_encodeInteger_forKey_(a3, v27, self->_shadowSampleCount, (uint64_t)CFSTR("shadowSampleCount"));
  v31 = objc_msgSend_valueWithCGSize_(MEMORY[0x1E0CB3B18], v28, v29, v30, self->_shadowMapSize.width, self->_shadowMapSize.height);
  objc_msgSend_encodeObject_forKey_(a3, v32, v31, (uint64_t)CFSTR("shadowMapSize"));
  zNear = self->_zNear;
  *(float *)&zNear = zNear;
  objc_msgSend_encodeFloat_forKey_(a3, v34, (uint64_t)CFSTR("zNear"), v35, zNear);
  zFar = self->_zFar;
  *(float *)&zFar = zFar;
  objc_msgSend_encodeFloat_forKey_(a3, v37, (uint64_t)CFSTR("zFar"), v38, zFar);
  objc_msgSend_encodeDouble_forKey_(a3, v39, (uint64_t)CFSTR("shadowBias"), v40, self->_shadowBias);
  gobo = self->_gobo;
  if (gobo)
    objc_msgSend_encodeObject_forKey_(a3, v41, (uint64_t)gobo, (uint64_t)CFSTR("gobo"));
  IESProfile = self->_IESProfile;
  if (IESProfile)
    objc_msgSend_encodeObject_forKey_(a3, v41, (uint64_t)IESProfile, (uint64_t)CFSTR("IESProfile"));
  objc_msgSend_encodeInteger_forKey_(a3, v41, self->_areaType, (uint64_t)CFSTR("areaType"));
  LODWORD(v44) = *(_DWORD *)self->_areaExtents;
  objc_msgSend_encodeFloat_forKey_(a3, v45, (uint64_t)CFSTR("areaExtentsX"), v46, v44);
  LODWORD(v47) = *(_DWORD *)&self->_areaExtents[4];
  objc_msgSend_encodeFloat_forKey_(a3, v48, (uint64_t)CFSTR("areaExtentsY"), v49, v47);
  LODWORD(v50) = *(_DWORD *)&self->_areaExtents[8];
  objc_msgSend_encodeFloat_forKey_(a3, v51, (uint64_t)CFSTR("areaExtentsZ"), v52, v50);
  objc_msgSend_encodeObject_forKey_(a3, v53, (uint64_t)self->_areaPolygonVertices, (uint64_t)CFSTR("areaPolygonVertices"));
  objc_msgSend_encodeBool_forKey_(a3, v54, self->_drawsArea, (uint64_t)CFSTR("drawsArea"));
  objc_msgSend_encodeBool_forKey_(a3, v55, self->_doubleSided, (uint64_t)CFSTR("doubleSided"));
  probeEnvironment = self->_probeEnvironment;
  if (probeEnvironment)
    objc_msgSend_encodeObject_forKey_(a3, v56, (uint64_t)probeEnvironment, (uint64_t)CFSTR("probeEnvironment"));
  sub_1B18BD9B8(a3, self, (uint64_t)probeEnvironment, v57);
  sub_1B18BDCC8(a3, self, v59, v60);
}

- (VFXLight)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXLight *v7;
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
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  _BOOL8 v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  _BOOL8 v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  _BOOL8 v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  _BOOL8 v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  int v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  int v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  unsigned int v77;
  const char *v78;
  uint64_t v79;
  unsigned int v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  unsigned int v88;
  const char *v89;
  uint64_t v90;
  unsigned int v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  unsigned int v99;
  const char *v100;
  uint64_t v101;
  unsigned int v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  int v117;
  const char *v119;
  uint64_t v120;
  unsigned int v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  double v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  double v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  double v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  const char *v193;
  const char *v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  unsigned int v210;
  const char *v211;
  uint64_t v212;
  unsigned int v213;
  const char *v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  const char *v244;
  uint64_t v245;
  unsigned int v247;
  unsigned int v248;
  unsigned int v249;
  unsigned int v250;
  unsigned int v251;
  unsigned int v252;
  unsigned int v253;
  double v254;
  unsigned int v255;
  objc_super v256;

  v256.receiver = self;
  v256.super_class = (Class)VFXLight;
  v7 = -[VFXLight init](&v256, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v11 = sub_1B185ECD0();
    v7->_light = (__CFXLight *)v11;
    if (v11)
      sub_1B193E768(v11, v7, v13, v14, v15, v16, v17, v18);
    objc_msgSend__syncObjCModel(v7, v12, v13, v14);
    v19 = objc_opt_class();
    v21 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, (uint64_t)CFSTR("type"));
    if (v21)
      v26 = sub_1B18BCF84(v21, v22, v23, v24);
    else
      v26 = (int)objc_msgSend_decodeIntForKey_(a3, v22, (uint64_t)CFSTR("lightType"), v24);
    objc_msgSend_setType_(v7, v25, v26, v27);
    objc_msgSend__customDecodingOfVFXLight_(v7, v28, (uint64_t)a3, v29);
    v32 = objc_msgSend_decodeIntForKey_(a3, v30, (uint64_t)CFSTR("castsShadow"), v31) != 0;
    objc_msgSend_setCastsShadow_(v7, v33, v32, v34);
    v37 = objc_msgSend_decodeIntForKey_(a3, v35, (uint64_t)CFSTR("baked"), v36) != 0;
    objc_msgSend_setBaked_(v7, v38, v37, v39);
    v42 = objc_msgSend_decodeIntForKey_(a3, v40, (uint64_t)CFSTR("shouldBakeDirectLighting"), v41) != 0;
    objc_msgSend_setShouldBakeDirectLighting_(v7, v43, v42, v44);
    v47 = objc_msgSend_decodeIntForKey_(a3, v45, (uint64_t)CFSTR("shouldBakeIndirectLighting"), v46) != 0;
    objc_msgSend_setShouldBakeIndirectLighting_(v7, v48, v47, v49);
    v50 = objc_opt_class();
    v52 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v51, v50, (uint64_t)CFSTR("sphericalHarmonics"));
    objc_msgSend_set_sphericalHarmonics_(v7, v53, v52, v54);
    v55 = objc_opt_class();
    v57 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v56, v55, (uint64_t)CFSTR("name"));
    objc_msgSend_setName_(v7, v58, v57, v59);
    if (v7->_type == 4)
    {
      v62 = objc_msgSend_decodeIntForKey_(a3, v60, (uint64_t)CFSTR("probeType"), v61);
      objc_msgSend_setProbeType_(v7, v63, v62, v64);
      v67 = objc_msgSend_decodeIntForKey_(a3, v65, (uint64_t)CFSTR("probeUpdateType"), v66);
      objc_msgSend_setProbeUpdateType_(v7, v68, v67, v69);
      v72 = objc_msgSend_decodeBoolForKey_(a3, v70, (uint64_t)CFSTR("parallaxCorrectionEnabled"), v71);
      objc_msgSend_setParallaxCorrectionEnabled_(v7, v73, v72, v74);
      objc_msgSend_decodeFloatForKey_(a3, v75, (uint64_t)CFSTR("probeExtentsX"), v76);
      v251 = v77;
      objc_msgSend_decodeFloatForKey_(a3, v78, (uint64_t)CFSTR("probeExtentsY"), v79);
      v247 = v80;
      objc_msgSend_decodeFloatForKey_(a3, v81, (uint64_t)CFSTR("probeExtentsZ"), v82);
      objc_msgSend_setProbeExtents_(v7, v83, v84, v85, COERCE_DOUBLE(__PAIR64__(v247, v251)));
      objc_msgSend_decodeFloatForKey_(a3, v86, (uint64_t)CFSTR("probeOffsetX"), v87);
      v252 = v88;
      objc_msgSend_decodeFloatForKey_(a3, v89, (uint64_t)CFSTR("probeOffsetX"), v90);
      v248 = v91;
      objc_msgSend_decodeFloatForKey_(a3, v92, (uint64_t)CFSTR("probeOffsetX"), v93);
      objc_msgSend_setProbeOffset_(v7, v94, v95, v96, COERCE_DOUBLE(__PAIR64__(v248, v252)));
      objc_msgSend_decodeFloatForKey_(a3, v97, (uint64_t)CFSTR("parallaxOffsetX"), v98);
      v253 = v99;
      objc_msgSend_decodeFloatForKey_(a3, v100, (uint64_t)CFSTR("parallaxOffsetY"), v101);
      v249 = v102;
      objc_msgSend_decodeFloatForKey_(a3, v103, (uint64_t)CFSTR("parallaxOffsetZ"), v104);
      objc_msgSend_setParallaxCenterOffset_(v7, v105, v106, v107, COERCE_DOUBLE(__PAIR64__(v249, v253)));
      if (objc_msgSend_containsValueForKey_(a3, v108, (uint64_t)CFSTR("parallaxExtentsFactorX"), v109))
      {
        objc_msgSend_decodeFloatForKey_(a3, v110, (uint64_t)CFSTR("parallaxExtentsFactorX"), v111);
        __asm { FMOV            V1.4S, #1.0 }
        LODWORD(_Q1) = v117;
        *(_QWORD *)&v254 = _Q1;
      }
      else
      {
        __asm { FMOV            V0.4S, #1.0 }
        *(_QWORD *)&v254 = _Q0;
      }
      if (objc_msgSend_containsValueForKey_(a3, v110, (uint64_t)CFSTR("parallaxExtentsFactorY"), v111))
      {
        objc_msgSend_decodeFloatForKey_(a3, v119, (uint64_t)CFSTR("parallaxExtentsFactorY"), v120);
        *(_QWORD *)&v254 = __PAIR64__(v121, LODWORD(v254));
      }
      if (objc_msgSend_containsValueForKey_(a3, v119, (uint64_t)CFSTR("parallaxExtentsFactorZ"), v120))
        objc_msgSend_decodeFloatForKey_(a3, v122, (uint64_t)CFSTR("parallaxExtentsFactorZ"), v124);
      objc_msgSend_setParallaxExtentsFactor_(v7, v122, v123, v124, v254);
    }
    if (objc_msgSend_containsValueForKey_(a3, v60, (uint64_t)CFSTR("vfxcolor"), v61))
    {
      v125 = sub_1B18BD108(a3, CFSTR("vfxcolor"));
    }
    else
    {
      v128 = (void *)MEMORY[0x1E0C99E60];
      v129 = objc_opt_class();
      v132 = (void *)objc_msgSend_setWithObject_(v128, v130, v129, v131);
      v125 = sub_1B18BDB20(a3, (uint64_t)CFSTR("color"), v132);
    }
    objc_msgSend_setColor_(v7, v126, v125, v127);
    objc_msgSend_decodeFloatForKey_(a3, v133, (uint64_t)CFSTR("shadowIntensity"), v134);
    objc_msgSend_setShadowIntensity_(v7, v135, v136, v137);
    objc_msgSend_decodeFloatForKey_(a3, v138, (uint64_t)CFSTR("shadowRadius"), v139);
    objc_msgSend_setShadowRadius_(v7, v140, v141, v142);
    if (objc_msgSend_containsValueForKey_(a3, v143, (uint64_t)CFSTR("intensity"), v144))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v145, (uint64_t)CFSTR("intensity"), v146);
      *(float *)&v147 = v147;
      objc_msgSend_setIntensity_(v7, v148, v149, v150, v147);
    }
    if (objc_msgSend_containsValueForKey_(a3, v145, (uint64_t)CFSTR("temperature"), v146))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v151, (uint64_t)CFSTR("temperature"), v152);
      *(float *)&v153 = v153;
      objc_msgSend_setTemperature_(v7, v154, v155, v156, v153);
    }
    objc_msgSend_decodeFloatForKey_(a3, v151, (uint64_t)CFSTR("orthographicScale"), v152);
    objc_msgSend_setOrthographicScale_(v7, v157, v158, v159);
    v162 = objc_msgSend_decodeIntegerForKey_(a3, v160, (uint64_t)CFSTR("shadowSampleCount"), v161);
    objc_msgSend_setShadowSampleCount_(v7, v163, v162, v164);
    v165 = objc_opt_class();
    v167 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v166, v165, (uint64_t)CFSTR("shadowMapSize"));
    objc_msgSend_CGSizeValue(v167, v168, v169, v170);
    objc_msgSend_setShadowMapSize_(v7, v171, v172, v173);
    objc_msgSend_decodeFloatForKey_(a3, v174, (uint64_t)CFSTR("zNear"), v175);
    objc_msgSend_setZNear_(v7, v176, v177, v178);
    objc_msgSend_decodeFloatForKey_(a3, v179, (uint64_t)CFSTR("zFar"), v180);
    objc_msgSend_setZFar_(v7, v181, v182, v183);
    objc_msgSend_decodeDoubleForKey_(a3, v184, (uint64_t)CFSTR("shadowBias"), v185);
    *(float *)&v186 = v186;
    objc_msgSend_setShadowBias_(v7, v187, v188, v189, v186);
    v190 = objc_opt_class();
    v7->_gobo = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v191, v190, (uint64_t)CFSTR("gobo"));
    v192 = objc_opt_class();
    v7->_probeEnvironment = (VFXMaterialProperty *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v193, v192, (uint64_t)CFSTR("probeEnvironment"));
    if (objc_msgSend_containsValueForKey_(a3, v194, (uint64_t)CFSTR("IESProfile"), v195))
    {
      v198 = objc_opt_class();
      v200 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v199, v198, (uint64_t)CFSTR("IESProfile"));
      objc_msgSend_setIESProfile_(v7, v201, v200, v202);
    }
    if (objc_msgSend_containsValueForKey_(a3, v196, (uint64_t)CFSTR("areaType"), v197))
    {
      v205 = objc_msgSend_decodeIntegerForKey_(a3, v203, (uint64_t)CFSTR("areaType"), v204);
      objc_msgSend_setAreaType_(v7, v206, v205, v207);
      objc_msgSend_decodeFloatForKey_(a3, v208, (uint64_t)CFSTR("areaExtentsX"), v209);
      v255 = v210;
      objc_msgSend_decodeFloatForKey_(a3, v211, (uint64_t)CFSTR("areaExtentsY"), v212);
      v250 = v213;
      objc_msgSend_decodeFloatForKey_(a3, v214, (uint64_t)CFSTR("areaExtentsZ"), v215);
      objc_msgSend_setAreaExtents_(v7, v216, v217, v218, COERCE_DOUBLE(__PAIR64__(v250, v255)));
      v219 = objc_opt_class();
      v221 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v220, v219, (uint64_t)CFSTR("areaPolygonVertices"));
      objc_msgSend_setAreaPolygonVertices_(v7, v222, v221, v223);
      v226 = objc_msgSend_decodeBoolForKey_(a3, v224, (uint64_t)CFSTR("drawsArea"), v225);
      objc_msgSend_setDrawsArea_(v7, v227, v226, v228);
      v231 = objc_msgSend_decodeBoolForKey_(a3, v229, (uint64_t)CFSTR("doubleSided"), v230);
      objc_msgSend_setDoubleSided_(v7, v232, v231, v233);
    }
    else
    {
      objc_msgSend_setAreaType_(v7, v203, 4, v204);
      __asm { FMOV            V0.4S, #1.0 }
      objc_msgSend_setAreaExtents_(v7, v235, v236, v237, *(double *)&_Q0);
      objc_msgSend_setAreaPolygonVertices_(v7, v238, 0, v239);
      objc_msgSend_setDrawsArea_(v7, v240, 1, v241);
      objc_msgSend_setDoubleSided_(v7, v242, 0, v243);
    }
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    sub_1B18BDA00(a3, v7);
    sub_1B18BDFA4(a3, v7);
    objc_msgSend_setImmediateMode_(VFXTransaction, v244, v8, v245);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
