@implementation VFXAnimation

+ (id)animationWithMDLTransform:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_transformAnimation(a3, a2, (uint64_t)a3, v3);
  return (id)objc_msgSend_animationWithCAAnimation_(VFXAnimation, v5, v4, v6);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXAnimation *animationRef;
  id animationDidStart;
  id animationDidStop;
  __CFXAnimation *v12;
  objc_super v13;

  animationRef = self->_animationRef;
  if (animationRef)
    sub_1B193E768((uint64_t)animationRef, 0, v2, v3, v4, v5, v6, v7);

  animationDidStart = self->_animationDidStart;
  if (animationDidStart)
    _Block_release(animationDidStart);
  animationDidStop = self->_animationDidStop;
  if (animationDidStop)
    _Block_release(animationDidStop);
  v12 = self->_animationRef;
  if (v12)
  {
    CFRelease(v12);
    self->_animationRef = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)VFXAnimation;
  -[VFXAnimation dealloc](&v13, sel_dealloc);
}

- (VFXAnimation)initWithCFXAnimation:(__CFXAnimation *)a3
{
  VFXAnimation *v4;
  const char *v5;
  uint64_t v6;
  VFXAnimation *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VFXAnimation;
  v4 = -[VFXAnimation init](&v12, sel_init);
  v7 = v4;
  if (v4)
  {
    v4->_userInfoLock._os_unfair_lock_opaque = 0;
    objc_msgSend__setAnimationRef_(v4, v5, (uint64_t)a3, v6);
    objc_msgSend__syncObjCModel(v7, v8, v9, v10);
    v7->_didMutate = 0;
  }
  return v7;
}

- (VFXAnimation)initWithCAAnimation:(id)a3
{
  VFXAnimation *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  VFXAnimation *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
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
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  float v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  float v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  objc_super v77;

  v77.receiver = self;
  v77.super_class = (Class)VFXAnimation;
  v4 = -[VFXAnimation init](&v77, sel_init);
  v8 = v4;
  if (v4)
  {
    v4->_userInfoLock._os_unfair_lock_opaque = 0;
    v4->_userAnimation = (id)objc_msgSend_copy(a3, v5, v6, v7);
    objc_msgSend_duration(a3, v9, v10, v11);
    v8->_duration = v12;
    objc_msgSend_repeatCount(a3, v13, v14, v15);
    v8->_repeatCount = v16;
    v8->_autoreverses = objc_msgSend_autoreverses(a3, v17, v18, v19);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8->_additive = objc_msgSend_isAdditive(a3, v20, v21, v22);
      v8->_cumulative = objc_msgSend_isCumulative(a3, v23, v24, v25);
      v29 = (void *)objc_msgSend_keyPath(a3, v26, v27, v28);
      v8->_keyPath = (NSString *)objc_msgSend_copy(v29, v30, v31, v32);
    }
    v8->_removedOnCompletion = objc_msgSend_isRemovedOnCompletion(a3, v20, v21, v22);
    objc_msgSend_beginTime(a3, v33, v34, v35);
    v8->_beginTime = v36;
    objc_msgSend_timeOffset(a3, v37, v38, v39);
    v8->_timeOffset = v40;
    objc_msgSend_fadeInDuration(a3, v41, v42, v43);
    v8->_fadeInDuration = v44;
    objc_msgSend_fadeOutDuration(a3, v45, v46, v47);
    v8->_fadeOutDuration = v48;
    v52 = objc_msgSend_fillMode(a3, v49, v50, v51);
    v56 = *MEMORY[0x1E0CD2B58];
    v57 = v52 == *MEMORY[0x1E0CD2B58] || objc_msgSend_fillMode(a3, v53, v54, v55) == *MEMORY[0x1E0CD2B60];
    v8->_fillForward = v57;
    v65 = objc_msgSend_fillMode(a3, v53, v54, v55) == v56
       || objc_msgSend_fillMode(a3, v58, v59, v60) == *MEMORY[0x1E0CD2B50];
    v8->_fillBackward = v65;
    if (v8->_animationEvents)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. _animationEvents should be nil"), v59, v60, v61, v62, v63, v64, (uint64_t)"_animationEvents == NULL");
    v66 = (void *)objc_msgSend_animationEvents(a3, v58, v59, v60);
    v8->_animationEvents = (NSArray *)objc_msgSend_copy(v66, v67, v68, v69);
    v73 = objc_msgSend_timingFunction(a3, v70, v71, v72);
    v8->_timingFunction = (VFXTimingFunction *)(id)objc_msgSend_functionWithCAMediaTimingFunction_(VFXTimingFunction, v74, v73, v75);
    v8->_didMutate = 0;
  }
  return v8;
}

+ (id)animationWithCFXAnimation:(__CFXAnimation *)a3
{
  VFXAnimation *v4;
  const char *v5;
  uint64_t v6;

  v4 = [VFXAnimation alloc];
  return (id)objc_msgSend_initWithCFXAnimation_(v4, v5, (uint64_t)a3, v6);
}

- (void)_setAnimationRef:(__CFXAnimation *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXAnimation *animationRef;
  __CFXAnimation *v11;

  animationRef = self->_animationRef;
  if (animationRef != a3)
  {
    if (animationRef)
    {
      CFRelease(animationRef);
      self->_animationRef = 0;
    }
    if (a3)
      v11 = (__CFXAnimation *)CFRetain(a3);
    else
      v11 = 0;
    self->_animationRef = v11;
  }
  if (a3)
    sub_1B193E768((uint64_t)a3, self, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (__CFXAnimation)animationRef
{
  return self->_animationRef;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  __CFXAnimation *animationRef;
  CFTypeRef *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id animationDidStart;
  id animationDidStop;

  v11 = objc_alloc_init((Class)objc_opt_class());
  v11[30] = 0;
  animationRef = self->_animationRef;
  if (animationRef)
  {
    v13 = sub_1B185E2E8(animationRef, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend__setAnimationRef_(v11, v14, (uint64_t)v13, v15);
    if (v13)
      CFRelease(v13);
  }
  *((_QWORD *)v11 + 8) = self->_timingFunction;
  *((_QWORD *)v11 + 9) = self->_animationEvents;
  animationDidStart = self->_animationDidStart;
  if (animationDidStart)
    *((_QWORD *)v11 + 12) = _Block_copy(animationDidStart);
  animationDidStop = self->_animationDidStop;
  if (animationDidStop)
    *((_QWORD *)v11 + 13) = _Block_copy(animationDidStop);
  *((_QWORD *)v11 + 3) = *(_QWORD *)&self->_duration;
  v11[8] = LODWORD(self->_repeatCount);
  *((_QWORD *)v11 + 5) = *(_QWORD *)&self->_timeOffset;
  *((_QWORD *)v11 + 6) = *(_QWORD *)&self->_beginTime;
  *((_BYTE *)v11 + 56) = self->_autoreverses;
  *((_BYTE *)v11 + 57) = self->_removedOnCompletion;
  *((_BYTE *)v11 + 58) = self->_applyOnCompletion;
  *((_BYTE *)v11 + 59) = self->_additive;
  *((_BYTE *)v11 + 60) = self->_cumulative;
  *((_BYTE *)v11 + 61) = self->_fillForward;
  *((_BYTE *)v11 + 62) = self->_fillBackward;
  *((_QWORD *)v11 + 10) = *(_QWORD *)&self->_fadeInDuration;
  *((_QWORD *)v11 + 11) = *(_QWORD *)&self->_fadeOutDuration;
  *((_QWORD *)v11 + 17) = objc_msgSend_copy(self->_userAnimation, v16, v17, v18);
  *((_BYTE *)v11 + 144) = self->_didMutate;
  return v11;
}

- (void)_syncObjCModel
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
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
  char v70;
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
  NSArray *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  NSArray *animationEvents;
  NSArray *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  VFXTimingFunction *v105;
  const char *v106;
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

  v3 = (void *)sub_1B185D090((uint64_t)self->_animationRef);
  v6 = (void *)objc_msgSend_componentsJoinedByString_(v3, v4, (uint64_t)CFSTR("."), v5);

  self->_keyPath = (NSString *)v6;
  self->_duration = sub_1B185D118((uint64_t)self->_animationRef, v7, v8, v9, v10, v11, v12, v13);
  self->_repeatCount = sub_1B185D248((uint64_t)self->_animationRef, v14, v15, v16, v17, v18, v19, v20);
  self->_autoreverses = sub_1B185D2E8((uint64_t)self->_animationRef, v21, v22, v23, v24, v25, v26, v27);
  self->_beginTime = sub_1B18089AC((uint64_t)self->_animationRef, v28, v29, v30, v31, v32, v33, v34);
  self->_timeOffset = sub_1B185D6F0((uint64_t)self->_animationRef, v35, v36, v37, v38, v39, v40, v41);
  self->_fadeInDuration = sub_1B185D828((uint64_t)self->_animationRef, v42, v43, v44, v45, v46, v47, v48);
  self->_fadeOutDuration = sub_1B185D8C4((uint64_t)self->_animationRef, v49, v50, v51, v52, v53, v54, v55);
  self->_removedOnCompletion = sub_1B185D554((uint64_t)self->_animationRef, v56, v57, v58, v59, v60, v61, v62);
  v70 = sub_1B185DC8C((uint64_t)self->_animationRef, v63, v64, v65, v66, v67, v68, v69);
  self->_fillForward = v70 & 1;
  self->_fillBackward = (v70 & 2) != 0;
  v78 = sub_1B185DB1C((uint64_t)self->_animationRef, v71, v72, v73, v74, v75, v76, v77);
  v86 = (NSArray *)sub_1B18C1A64(v78, v79, v80, v81, v82, v83, v84, v85);
  animationEvents = self->_animationEvents;
  if (animationEvents != v86)
  {
    v95 = v86;

    self->_animationEvents = v95;
  }
  v96 = sub_1B185D3AC((uint64_t)self->_animationRef, v87, v88, v89, v90, v91, v92, v93);
  if (v96)
  {
    v104 = v96;

    v105 = [VFXTimingFunction alloc];
    self->_timingFunction = (VFXTimingFunction *)objc_msgSend_initWithTimingFunctionRef_(v105, v106, v104, v107);
  }
  self->_applyOnCompletion = sub_1B185D9C8((uint64_t)self->_animationRef, v97, v98, v99, v100, v101, v102, v103);
  self->_additive = sub_1B185D508((uint64_t)self->_animationRef, v108, v109, v110, v111, v112, v113, v114);
  self->_cumulative = sub_1B185D458((uint64_t)self->_animationRef, v115, v116, v117, v118, v119, v120, v121);
}

- (id)encodeAnimation:(id)a3
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t isRemovedOnCompletion;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t isCumulative;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t isAdditive;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  const char *v189;
  id v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  const char *v216;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  _BYTE v222[128];
  uint64_t v223;

  v223 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_duration(a3, v7, v8, v9);
  v13 = objc_msgSend_numberWithDouble_(v6, v10, v11, v12);
  objc_msgSend_setValue_forKey_(v5, v14, v13, (uint64_t)CFSTR("duration"));
  v18 = objc_msgSend_timingFunction(a3, v15, v16, v17);
  objc_msgSend_setValue_forKey_(v5, v19, v18, (uint64_t)CFSTR("timingFunction"));
  v23 = objc_msgSend_fillMode(a3, v20, v21, v22);
  objc_msgSend_setValue_forKey_(v5, v24, v23, (uint64_t)CFSTR("fillMode"));
  v25 = (void *)MEMORY[0x1E0CB37E8];
  v29 = objc_msgSend_commitsOnCompletion(a3, v26, v27, v28);
  v32 = objc_msgSend_numberWithBool_(v25, v30, v29, v31);
  objc_msgSend_setValue_forKey_(v5, v33, v32, (uint64_t)CFSTR("commitsOnCompletion"));
  v34 = (void *)MEMORY[0x1E0CB37E8];
  isRemovedOnCompletion = objc_msgSend_isRemovedOnCompletion(a3, v35, v36, v37);
  v41 = objc_msgSend_numberWithBool_(v34, v39, isRemovedOnCompletion, v40);
  objc_msgSend_setValue_forKey_(v5, v42, v41, (uint64_t)CFSTR("removedOnCompletion"));
  v43 = (void *)MEMORY[0x1E0CB37E8];
  v47 = objc_msgSend_autoreverses(a3, v44, v45, v46);
  v50 = objc_msgSend_numberWithBool_(v43, v48, v47, v49);
  objc_msgSend_setValue_forKey_(v5, v51, v50, (uint64_t)CFSTR("autoreverses"));
  v52 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_fadeInDuration(a3, v53, v54, v55);
  v59 = objc_msgSend_numberWithFloat_(v52, v56, v57, v58);
  objc_msgSend_setValue_forKey_(v5, v60, v59, (uint64_t)CFSTR("fadeInDuration"));
  v61 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_fadeOutDuration(a3, v62, v63, v64);
  v68 = objc_msgSend_numberWithFloat_(v61, v65, v66, v67);
  objc_msgSend_setValue_forKey_(v5, v69, v68, (uint64_t)CFSTR("fadeOutDuration"));
  v70 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_speed(a3, v71, v72, v73);
  v77 = objc_msgSend_numberWithFloat_(v70, v74, v75, v76);
  objc_msgSend_setValue_forKey_(v5, v78, v77, (uint64_t)CFSTR("speed"));
  v79 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_timeOffset(a3, v80, v81, v82);
  v86 = objc_msgSend_numberWithDouble_(v79, v83, v84, v85);
  objc_msgSend_setValue_forKey_(v5, v87, v86, (uint64_t)CFSTR("timeOffset"));
  v88 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_repeatCount(a3, v89, v90, v91);
  v95 = objc_msgSend_numberWithFloat_(v88, v92, v93, v94);
  objc_msgSend_setValue_forKey_(v5, v96, v95, (uint64_t)CFSTR("repeatCount"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v100 = objc_msgSend_keyPath(a3, v97, v98, v99);
    objc_msgSend_setValue_forKey_(v5, v101, v100, (uint64_t)CFSTR("keyPath"));
    v102 = (void *)MEMORY[0x1E0CB37E8];
    isCumulative = objc_msgSend_isCumulative(a3, v103, v104, v105);
    v109 = objc_msgSend_numberWithBool_(v102, v107, isCumulative, v108);
    objc_msgSend_setValue_forKey_(v5, v110, v109, (uint64_t)CFSTR("cumulative"));
    v111 = (void *)MEMORY[0x1E0CB37E8];
    isAdditive = objc_msgSend_isAdditive(a3, v112, v113, v114);
    v118 = objc_msgSend_numberWithBool_(v111, v116, isAdditive, v117);
    objc_msgSend_setValue_forKey_(v5, v119, v118, (uint64_t)CFSTR("additive"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v123 = (void *)objc_msgSend_fromValue(a3, v120, v121, v122);
    v126 = VFXDataFromValue(v123, (const char *)1, v124, v125);
    objc_msgSend_setValue_forKey_(v5, v127, v126, (uint64_t)CFSTR("from"));
    v131 = (void *)objc_msgSend_toValue(a3, v128, v129, v130);
    v134 = VFXDataFromValue(v131, (const char *)1, v132, v133);
    objc_msgSend_setValue_forKey_(v5, v135, v134, (uint64_t)CFSTR("to"));
    v139 = (void *)objc_msgSend_byValue(a3, v136, v137, v138);
    v142 = VFXDataFromValue(v139, (const char *)1, v140, v141);
    objc_msgSend_setValue_forKey_(v5, v143, v142, (uint64_t)CFSTR("by"));
    objc_msgSend_setValue_forKey_(v5, v144, (uint64_t)CFSTR("basic"), (uint64_t)CFSTR("type"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v148 = (void *)objc_msgSend_values(a3, v145, v146, v147);
    v152 = VFXDataFromArrayOfValues(v148, v149, v150, v151);
    objc_msgSend_setValue_forKey_(v5, v153, v152, (uint64_t)CFSTR("values"));
    v157 = objc_msgSend_keyTimes(a3, v154, v155, v156);
    objc_msgSend_setValue_forKey_(v5, v158, v157, (uint64_t)CFSTR("keyTimes"));
    v162 = objc_msgSend_timingFunctions(a3, v159, v160, v161);
    objc_msgSend_setValue_forKey_(v5, v163, v162, (uint64_t)CFSTR("timingFunctions"));
    v167 = objc_msgSend_tensionValues(a3, v164, v165, v166);
    objc_msgSend_setValue_forKey_(v5, v168, v167, (uint64_t)CFSTR("tensionValues"));
    v172 = objc_msgSend_continuityValues(a3, v169, v170, v171);
    objc_msgSend_setValue_forKey_(v5, v173, v172, (uint64_t)CFSTR("continuityValues"));
    v177 = objc_msgSend_biasValues(a3, v174, v175, v176);
    objc_msgSend_setValue_forKey_(v5, v178, v177, (uint64_t)CFSTR("biasValues"));
    v182 = objc_msgSend_calculationMode(a3, v179, v180, v181);
    objc_msgSend_setValue_forKey_(v5, v183, v182, (uint64_t)CFSTR("calculationMode"));
    v187 = objc_msgSend_rotationMode(a3, v184, v185, v186);
    objc_msgSend_setValue_forKey_(v5, v188, v187, (uint64_t)CFSTR("rotationMode"));
    objc_msgSend_setValue_forKey_(v5, v189, (uint64_t)CFSTR("keyframe"), (uint64_t)CFSTR("type"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v190 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v194 = (void *)objc_msgSend_animations(a3, v191, v192, v193);
    v198 = objc_msgSend_count(v194, v195, v196, v197);
    v201 = (void *)objc_msgSend_initWithCapacity_(v190, v199, v198, v200);
    v218 = 0u;
    v219 = 0u;
    v220 = 0u;
    v221 = 0u;
    v205 = (void *)objc_msgSend_animations(a3, v202, v203, v204, 0);
    v207 = objc_msgSend_countByEnumeratingWithState_objects_count_(v205, v206, (uint64_t)&v218, (uint64_t)v222, 16);
    if (v207)
    {
      v210 = v207;
      v211 = *(_QWORD *)v219;
      do
      {
        v212 = 0;
        do
        {
          if (*(_QWORD *)v219 != v211)
            objc_enumerationMutation(v205);
          v213 = objc_msgSend_encodeAnimation_(self, v208, *(_QWORD *)(*((_QWORD *)&v218 + 1) + 8 * v212), v209);
          objc_msgSend_addObject_(v201, v214, v213, v215);
          ++v212;
        }
        while (v210 != v212);
        v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v205, v208, (uint64_t)&v218, (uint64_t)v222, 16);
      }
      while (v210);
    }
    objc_msgSend_setValue_forKey_(v5, v208, (uint64_t)v201, (uint64_t)CFSTR("animations"));
    objc_msgSend_setValue_forKey_(v5, v216, (uint64_t)CFSTR("group"), (uint64_t)CFSTR("type"));

  }
  return v5;
}

- (id)decodeAnimation:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  id v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
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
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  float v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  _BYTE v225[128];
  uint64_t v226;

  v226 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("type"), v3);
  v9 = objc_msgSend_valueForKey_(a3, v7, (uint64_t)CFSTR("keyPath"), v8);
  if (objc_msgSend_isEqualToString_(v6, v10, (uint64_t)CFSTR("basic"), v11))
  {
    v14 = (void *)objc_msgSend_animationWithKeyPath_(MEMORY[0x1E0CD2710], v12, v9, v13);
    v17 = (void *)objc_msgSend_valueForKey_(a3, v15, (uint64_t)CFSTR("from"), v16);
    v21 = VFXValueFromData(v17, v18, v19, v20);
    objc_msgSend_setFromValue_(v14, v22, (uint64_t)v21, v23);
    v26 = (void *)objc_msgSend_valueForKey_(a3, v24, (uint64_t)CFSTR("to"), v25);
    v30 = VFXValueFromData(v26, v27, v28, v29);
    objc_msgSend_setToValue_(v14, v31, (uint64_t)v30, v32);
    v35 = (void *)objc_msgSend_valueForKey_(a3, v33, (uint64_t)CFSTR("by"), v34);
    v39 = VFXValueFromData(v35, v36, v37, v38);
    objc_msgSend_setByValue_(v14, v40, (uint64_t)v39, v41);
  }
  else if (objc_msgSend_isEqualToString_(v6, v12, (uint64_t)CFSTR("keyframe"), v13))
  {
    v14 = (void *)objc_msgSend_animationWithKeyPath_(MEMORY[0x1E0CD2798], v44, v9, v45);
    v48 = (void *)objc_msgSend_valueForKey_(a3, v46, (uint64_t)CFSTR("values"), v47);
    v52 = VFXArrayOfValueFromData(v48, v49, v50, v51);
    objc_msgSend_setValues_(v14, v53, (uint64_t)v52, v54);
    v57 = objc_msgSend_valueForKey_(a3, v55, (uint64_t)CFSTR("keyTimes"), v56);
    objc_msgSend_setKeyTimes_(v14, v58, v57, v59);
    v62 = objc_msgSend_valueForKey_(a3, v60, (uint64_t)CFSTR("timingFunctions"), v61);
    objc_msgSend_setTimingFunctions_(v14, v63, v62, v64);
    v67 = objc_msgSend_valueForKey_(a3, v65, (uint64_t)CFSTR("tensionValues"), v66);
    objc_msgSend_setTensionValues_(v14, v68, v67, v69);
    v72 = objc_msgSend_valueForKey_(a3, v70, (uint64_t)CFSTR("continuityValues"), v71);
    objc_msgSend_setContinuityValues_(v14, v73, v72, v74);
    v77 = objc_msgSend_valueForKey_(a3, v75, (uint64_t)CFSTR("biasValues"), v76);
    objc_msgSend_setBiasValues_(v14, v78, v77, v79);
    v82 = objc_msgSend_valueForKey_(a3, v80, (uint64_t)CFSTR("calculationMode"), v81);
    objc_msgSend_setCalculationMode_(v14, v83, v82, v84);
    v87 = objc_msgSend_valueForKey_(a3, v85, (uint64_t)CFSTR("rotationMode"), v86);
    objc_msgSend_setRotationMode_(v14, v88, v87, v89);
  }
  else if (objc_msgSend_isEqualToString_(v6, v44, (uint64_t)CFSTR("group"), v45))
  {
    v14 = (void *)objc_msgSend_animation(MEMORY[0x1E0CD2700], v42, v90, v43);
    v93 = (void *)objc_msgSend_valueForKey_(a3, v91, (uint64_t)CFSTR("animations"), v92);
    v94 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v98 = objc_msgSend_count(v93, v95, v96, v97);
    v101 = (void *)objc_msgSend_initWithCapacity_(v94, v99, v98, v100);
    v221 = 0u;
    v222 = 0u;
    v223 = 0u;
    v224 = 0u;
    v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v102, (uint64_t)&v221, (uint64_t)v225, 16);
    if (v103)
    {
      v106 = v103;
      v107 = *(_QWORD *)v222;
      do
      {
        v108 = 0;
        do
        {
          if (*(_QWORD *)v222 != v107)
            objc_enumerationMutation(v93);
          v109 = objc_msgSend_decodeAnimation_(self, v104, *(_QWORD *)(*((_QWORD *)&v221 + 1) + 8 * v108), v105);
          objc_msgSend_addObject_(v101, v110, v109, v111);
          ++v108;
        }
        while (v106 != v108);
        v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v104, (uint64_t)&v221, (uint64_t)v225, 16);
      }
      while (v106);
    }
    objc_msgSend_setAnimations_(v14, v104, (uint64_t)v101, v105);

  }
  else
  {
    v14 = 0;
  }
  v112 = (void *)objc_msgSend_valueForKey_(a3, v42, (uint64_t)CFSTR("duration"), v43);
  objc_msgSend_doubleValue(v112, v113, v114, v115);
  objc_msgSend_setDuration_(v14, v116, v117, v118);
  v121 = objc_msgSend_valueForKey_(a3, v119, (uint64_t)CFSTR("timingFunction"), v120);
  objc_msgSend_setTimingFunction_(v14, v122, v121, v123);
  v126 = objc_msgSend_valueForKey_(a3, v124, (uint64_t)CFSTR("fillMode"), v125);
  objc_msgSend_setFillMode_(v14, v127, v126, v128);
  v131 = (void *)objc_msgSend_valueForKey_(a3, v129, (uint64_t)CFSTR("commitsOnCompletion"), v130);
  v135 = objc_msgSend_BOOLValue(v131, v132, v133, v134);
  objc_msgSend_setCommitsOnCompletion_(v14, v136, v135, v137);
  v140 = (void *)objc_msgSend_valueForKey_(a3, v138, (uint64_t)CFSTR("removedOnCompletion"), v139);
  v144 = objc_msgSend_BOOLValue(v140, v141, v142, v143);
  objc_msgSend_setRemovedOnCompletion_(v14, v145, v144, v146);
  v149 = (void *)objc_msgSend_valueForKey_(a3, v147, (uint64_t)CFSTR("autoreverses"), v148);
  v153 = objc_msgSend_BOOLValue(v149, v150, v151, v152);
  objc_msgSend_setAutoreverses_(v14, v154, v153, v155);
  v158 = (void *)objc_msgSend_valueForKey_(a3, v156, (uint64_t)CFSTR("fadeInDuration"), v157);
  objc_msgSend_floatValue(v158, v159, v160, v161);
  objc_msgSend_setFadeInDuration_(v14, v162, v163, v164);
  v167 = (void *)objc_msgSend_valueForKey_(a3, v165, (uint64_t)CFSTR("fadeOutDuration"), v166);
  objc_msgSend_floatValue(v167, v168, v169, v170);
  objc_msgSend_setFadeOutDuration_(v14, v171, v172, v173);
  v176 = (void *)objc_msgSend_valueForKey_(a3, v174, (uint64_t)CFSTR("speed"), v175);
  objc_msgSend_floatValue(v176, v177, v178, v179);
  objc_msgSend_setSpeed_(v14, v180, v181, v182);
  v185 = (void *)objc_msgSend_valueForKey_(a3, v183, (uint64_t)CFSTR("timeOffset"), v184);
  objc_msgSend_floatValue(v185, v186, v187, v188);
  objc_msgSend_setTimeOffset_(v14, v190, v191, v192, v189);
  v195 = (void *)objc_msgSend_valueForKey_(a3, v193, (uint64_t)CFSTR("repeatCount"), v194);
  objc_msgSend_floatValue(v195, v196, v197, v198);
  objc_msgSend_setRepeatCount_(v14, v199, v200, v201);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v204 = (void *)objc_msgSend_valueForKey_(a3, v202, (uint64_t)CFSTR("cumulative"), v203);
    v208 = objc_msgSend_BOOLValue(v204, v205, v206, v207);
    objc_msgSend_setCumulative_(v14, v209, v208, v210);
    v213 = (void *)objc_msgSend_valueForKey_(a3, v211, (uint64_t)CFSTR("additive"), v212);
    v217 = objc_msgSend_BOOLValue(v213, v214, v215, v216);
    objc_msgSend_setAdditive_(v14, v218, v217, v219);
  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  const char *v24;
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
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t isRemovedOnCompletion;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t isAppliedOnCompletion;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t isAdditive;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t isCumulative;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  float v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  float v85;
  const char *v86;
  uint64_t v87;
  const char *v88;

  v6 = objc_msgSend_caAnimation(self, a2, (uint64_t)a3, v3);
  v9 = (const char *)objc_msgSend_encodeAnimation_(self, v7, v6, v8);
  sub_1B18BDAB8(a3, v9, (uint64_t)CFSTR("animation"));
  v13 = objc_msgSend_keyPath(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(a3, v14, v13, (uint64_t)CFSTR("keyPath"));
  objc_msgSend_duration(self, v15, v16, v17);
  objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("duration"), v19);
  objc_msgSend_repeatCount(self, v20, v21, v22);
  objc_msgSend_encodeDouble_forKey_(a3, v24, (uint64_t)CFSTR("repeatCount"), v25, v23);
  objc_msgSend_timeOffset(self, v26, v27, v28);
  objc_msgSend_encodeDouble_forKey_(a3, v29, (uint64_t)CFSTR("timeOffset"), v30);
  objc_msgSend_beginTime(self, v31, v32, v33);
  objc_msgSend_encodeDouble_forKey_(a3, v34, (uint64_t)CFSTR("beginTime"), v35);
  v39 = objc_msgSend_autoreverses(self, v36, v37, v38);
  objc_msgSend_encodeBool_forKey_(a3, v40, v39, (uint64_t)CFSTR("autoreverses"));
  isRemovedOnCompletion = objc_msgSend_isRemovedOnCompletion(self, v41, v42, v43);
  objc_msgSend_encodeBool_forKey_(a3, v45, isRemovedOnCompletion, (uint64_t)CFSTR("removedOnCompletion"));
  isAppliedOnCompletion = objc_msgSend_isAppliedOnCompletion(self, v46, v47, v48);
  objc_msgSend_encodeBool_forKey_(a3, v50, isAppliedOnCompletion, (uint64_t)CFSTR("applyOnCompletion"));
  isAdditive = objc_msgSend_isAdditive(self, v51, v52, v53);
  objc_msgSend_encodeBool_forKey_(a3, v55, isAdditive, (uint64_t)CFSTR("additive"));
  isCumulative = objc_msgSend_isCumulative(self, v56, v57, v58);
  objc_msgSend_encodeBool_forKey_(a3, v60, isCumulative, (uint64_t)CFSTR("cumulative"));
  v64 = objc_msgSend_fillsForward(self, v61, v62, v63);
  objc_msgSend_encodeBool_forKey_(a3, v65, v64, (uint64_t)CFSTR("fillForward"));
  v69 = objc_msgSend_fillsBackward(self, v66, v67, v68);
  objc_msgSend_encodeBool_forKey_(a3, v70, v69, (uint64_t)CFSTR("fillBackward"));
  v74 = objc_msgSend_timingFunction(self, v71, v72, v73);
  objc_msgSend_encodeObject_forKey_(a3, v75, v74, (uint64_t)CFSTR("timingFunction"));
  objc_msgSend_fadeInDuration(self, v76, v77, v78);
  objc_msgSend_encodeDouble_forKey_(a3, v80, (uint64_t)CFSTR("fadeInDuration"), v81, v79);
  objc_msgSend_fadeOutDuration(self, v82, v83, v84);
  objc_msgSend_encodeDouble_forKey_(a3, v86, (uint64_t)CFSTR("fadeOutDuration"), v87, v85);
  if (self->_userInfo)
  {
    os_unfair_lock_lock(&self->_userInfoLock);
    objc_msgSend_encodeObject_forKey_(a3, v88, (uint64_t)self->_userInfo, (uint64_t)CFSTR("userInfo"));
    os_unfair_lock_unlock(&self->_userInfoLock);
  }
}

- (VFXAnimation)initWithCoder:(id)a3
{
  VFXAnimation *v4;
  VFXAnimation *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  double v27;
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
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
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
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  double v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  double v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  objc_super v100;
  _QWORD v101[2];

  v101[1] = *MEMORY[0x1E0C80C00];
  v100.receiver = self;
  v100.super_class = (Class)VFXAnimation;
  v4 = -[VFXAnimation init](&v100, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_userInfoLock._os_unfair_lock_opaque = 0;
    v6 = (void *)sub_1B18BECA4();
    v101[0] = objc_opt_class();
    v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v101, 1);
    v11 = (void *)objc_msgSend_setByAddingObjectsFromArray_(v6, v9, v8, v10);
    v12 = sub_1B18BDB20(a3, (uint64_t)CFSTR("animation"), v11);
    if (v12)
    {
      v5->_userAnimation = (id)objc_msgSend_decodeAnimation_(v5, v13, v12, v14);
      v15 = objc_opt_class();
      v17 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, (uint64_t)CFSTR("keyPath"));
      objc_msgSend_setKeyPath_(v5, v18, v17, v19);
      objc_msgSend_decodeDoubleForKey_(a3, v20, (uint64_t)CFSTR("duration"), v21);
      objc_msgSend_setDuration_(v5, v22, v23, v24);
      objc_msgSend_decodeDoubleForKey_(a3, v25, (uint64_t)CFSTR("repeatCount"), v26);
      *(float *)&v27 = v27;
      objc_msgSend_setRepeatCount_(v5, v28, v29, v30, v27);
      objc_msgSend_decodeDoubleForKey_(a3, v31, (uint64_t)CFSTR("timeOffset"), v32);
      objc_msgSend_setTimeOffset_(v5, v33, v34, v35);
      objc_msgSend_decodeDoubleForKey_(a3, v36, (uint64_t)CFSTR("beginTime"), v37);
      objc_msgSend_setBeginTime_(v5, v38, v39, v40);
      v43 = objc_msgSend_decodeBoolForKey_(a3, v41, (uint64_t)CFSTR("autoreverses"), v42);
      objc_msgSend_setAutoreverses_(v5, v44, v43, v45);
      v48 = objc_msgSend_decodeBoolForKey_(a3, v46, (uint64_t)CFSTR("appliedOnCompletion"), v47);
      objc_msgSend_setAppliedOnCompletion_(v5, v49, v48, v50);
      v53 = objc_msgSend_decodeBoolForKey_(a3, v51, (uint64_t)CFSTR("removedOnCompletion"), v52);
      objc_msgSend_setRemovedOnCompletion_(v5, v54, v53, v55);
      v58 = objc_msgSend_decodeBoolForKey_(a3, v56, (uint64_t)CFSTR("additive"), v57);
      objc_msgSend_setAdditive_(v5, v59, v58, v60);
      v63 = objc_msgSend_decodeBoolForKey_(a3, v61, (uint64_t)CFSTR("cumulative"), v62);
      objc_msgSend_setCumulative_(v5, v64, v63, v65);
      v68 = objc_msgSend_decodeBoolForKey_(a3, v66, (uint64_t)CFSTR("fillForward"), v67);
      objc_msgSend_setFillsForward_(v5, v69, v68, v70);
      v73 = objc_msgSend_decodeBoolForKey_(a3, v71, (uint64_t)CFSTR("fillBackward"), v72);
      objc_msgSend_setFillsBackward_(v5, v74, v73, v75);
      v76 = objc_opt_class();
      v78 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v77, v76, (uint64_t)CFSTR("timingFunction"));
      objc_msgSend_setTimingFunction_(v5, v79, v78, v80);
      objc_msgSend_decodeDoubleForKey_(a3, v81, (uint64_t)CFSTR("fadeInDuration"), v82);
      *(float *)&v83 = v83;
      objc_msgSend_setFadeInDuration_(v5, v84, v85, v86, v83);
      objc_msgSend_decodeDoubleForKey_(a3, v87, (uint64_t)CFSTR("fadeOutDuration"), v88);
      *(float *)&v89 = v89;
      objc_msgSend_setFadeOutDuration_(v5, v90, v91, v92, v89);
      v93 = sub_1B18BDC88();
      v95 = (void *)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v94, v93, (uint64_t)CFSTR("userInfo"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_userInfo = (NSMutableDictionary *)objc_msgSend_mutableCopy(v95, v96, v97, v98);
      v5->_didMutate = 0;
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)animationNamed:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id result;
  uint64_t v17;

  v6 = (void *)VFXGetResourceBundle((uint64_t)a1, a2, (uint64_t)a3, v3);
  v10 = objc_msgSend_pathExtension(a3, v7, v8, v9);
  v15 = objc_msgSend_stringByDeletingPathExtension(a3, v11, v12, v13);
  if (v10)
    result = (id)objc_msgSend_URLForResource_withExtension_(v6, v14, v15, v10);
  else
    result = (id)objc_msgSend_URLForResource_withExtension_(v6, v14, v15, (uint64_t)CFSTR("vfx-anim"));
  if (result)
    return (id)MEMORY[0x1E0DE7D20](a1, sel_animationWithContentsOfURL_, result, v17);
  return result;
}

+ (id)animationFromWorld:(id)a3
{
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
  const char *v15;
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
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  _QWORD v35[6];
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;

  v5 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, (uint64_t)a3, v3);
  v36 = 0;
  v37 = (double *)&v36;
  v38 = 0x2020000000;
  v39 = 0;
  v9 = (void *)objc_msgSend_rootNode(a3, v6, v7, v8);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_1B18C5054;
  v35[3] = &unk_1E63D8758;
  v35[4] = v5;
  v35[5] = &v36;
  objc_msgSend_enumerateHierarchyUsingBlock_(v9, v10, (uint64_t)v35, v11);
  if (objc_msgSend_count(v5, v12, v13, v14))
  {
    if (objc_msgSend_count(v5, v15, v16, v17) == 1)
    {
      v21 = objc_msgSend_objectAtIndexedSubscript_(v5, v18, 0, v20);
      v24 = objc_msgSend_animationWithCAAnimation_(VFXAnimation, v22, v21, v23);
    }
    else
    {
      v26 = (void *)objc_msgSend_animation(MEMORY[0x1E0CD2700], v18, v19, v20);
      objc_msgSend_setAnimations_(v26, v27, (uint64_t)v5, v28);
      objc_msgSend_setDuration_(v26, v29, v30, v31, v37[3]);
      v24 = objc_msgSend_animationWithCAAnimation_(VFXAnimation, v32, (uint64_t)v26, v33);
    }
    v25 = (void *)v24;
  }
  else
  {
    v25 = 0;
  }
  _Block_object_dispose(&v36, 8);
  return v25;
}

+ (id)animationWithContentsOfURL:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v28;
  uint64_t v29;
  void *v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend_dataWithContentsOfURL_(MEMORY[0x1E0C99D50], a2, (uint64_t)a3, v3);
  v31 = 0;
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = (void *)MEMORY[0x1E0C99E60];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v32, 3);
  v13 = objc_msgSend_setWithArray_(v8, v11, v10, v12);
  v18 = (void *)objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v7, v14, v13, v6, &v31);
  if (v31)
  {
    objc_msgSend_description(v31, v15, v16, v17);
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Loading animation %@ failed with %@"), v19, v20, v21, v22, v23, v24, (uint64_t)a3);
  }
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (id)objc_msgSend_animationFromWorld_(a1, v25, (uint64_t)v18, v26);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (id)objc_msgSend_animationWithCAAnimation_(VFXAnimation, v28, (uint64_t)v18, v29);
  }
  return v18;
}

+ (id)animationWithCAAnimation:(id)a3
{
  VFXAnimation *v4;
  const char *v5;
  uint64_t v6;

  v4 = [VFXAnimation alloc];
  return (id)objc_msgSend_initWithCAAnimation_(v4, v5, (uint64_t)a3, v6);
}

- (void)prepareWithTarget:(id)a3 implicitDuration:(double)a4
{
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v16;
  _WORD *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (!self->_animationRef)
  {
    v16 = (void *)objc_msgSend_caAnimation(self, a2, (uint64_t)a3, v4);
    if (v16)
    {
      v17 = sub_1B18C2990(v16, a3);
      if (!v17)
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: failed to convert CAAnimation to VFXAnimation"), v19, v20, v21, v22, v23, v24, v29);
        return;
      }
      objc_msgSend__setAnimationRef_(self, v18, (uint64_t)v17, v20);
      objc_msgSend__syncObjCModel(self, v25, v26, v27);
    }
  }
  objc_msgSend_duration(self, a2, (uint64_t)a3, v4);
  if (v14 == 0.0)
  {
    if (a4 == 0.0)
    {
      sub_1B17C4408(0, (uint64_t)CFSTR("Warning: default duration is zero - using default transaction duration"), v8, v9, v10, v11, v12, v13, v28);
      a4 = 0.25;
    }
    objc_msgSend_setDuration_(self, v7, v8, v9, a4);
  }
}

- (id)userAnimation
{
  if (*((_QWORD *)self + 17))
    return (id)*((_QWORD *)self + 17);
  return self;
}

- (CAAnimation)caAnimation
{
  _BOOL4 didMutate;
  CAAnimation *userAnimation;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFXAnimation *animationRef;
  id v15;
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
  uint64_t v31;
  const char *v32;
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
  uint64_t isRemovedOnCompletion;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t isAppliedOnCompletion;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  const char *v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v89;

  didMutate = self->_didMutate;
  self->_didMutate = 0;
  userAnimation = (CAAnimation *)self->_userAnimation;
  if (didMutate || userAnimation == 0)
  {
    objc_sync_enter(self);
    userAnimation = (CAAnimation *)self->_caAnimationCache;
    objc_sync_exit(self);
    if (didMutate || userAnimation == 0)
    {
      animationRef = self->_animationRef;
      if (animationRef)
      {
        userAnimation = (CAAnimation *)sub_1B18C2BB4(animationRef);
      }
      else
      {
        v15 = self->_userAnimation;
        if (!v15)
        {
          sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: VFXAnimation to CAAnimation: no animation data"), v7, v8, v9, v10, v11, v12, v89);
          return 0;
        }
        userAnimation = (CAAnimation *)(id)objc_msgSend_copy(v15, v6, v7, v8);
        objc_msgSend_duration(self, v16, v17, v18);
        objc_msgSend_setDuration_(userAnimation, v19, v20, v21);
        objc_msgSend_repeatCount(self, v22, v23, v24);
        objc_msgSend_setRepeatCount_(userAnimation, v25, v26, v27);
        v31 = objc_msgSend_autoreverses(self, v28, v29, v30);
        objc_msgSend_setAutoreverses_(userAnimation, v32, v31, v33);
        objc_msgSend_beginTime(self, v34, v35, v36);
        objc_msgSend_setBeginTime_(userAnimation, v37, v38, v39);
        objc_msgSend_timeOffset(self, v40, v41, v42);
        objc_msgSend_setTimeOffset_(userAnimation, v43, v44, v45);
        objc_msgSend_fadeInDuration(self, v46, v47, v48);
        objc_msgSend_setFadeInDuration_(userAnimation, v49, v50, v51);
        objc_msgSend_fadeOutDuration(self, v52, v53, v54);
        objc_msgSend_setFadeOutDuration_(userAnimation, v55, v56, v57);
        isRemovedOnCompletion = objc_msgSend_isRemovedOnCompletion(self, v58, v59, v60);
        objc_msgSend_setRemovedOnCompletion_(userAnimation, v62, isRemovedOnCompletion, v63);
        isAppliedOnCompletion = objc_msgSend_isAppliedOnCompletion(self, v64, v65, v66);
        objc_msgSend_setCommitsOnCompletion_(userAnimation, v68, isAppliedOnCompletion, v69);
        v73 = objc_msgSend_fillsForward(self, v70, v71, v72);
        v77 = objc_msgSend_fillsBackward(self, v74, v75, v76);
        v80 = (uint64_t *)MEMORY[0x1E0CD2B58];
        if (!v73)
          v80 = (uint64_t *)MEMORY[0x1E0CD2B50];
        v81 = (uint64_t *)MEMORY[0x1E0CD2B60];
        if (!v73)
          v81 = (uint64_t *)MEMORY[0x1E0CD2B68];
        if (!v77)
          v80 = v81;
        objc_msgSend_setFillMode_(userAnimation, v78, *v80, v79);
        v85 = objc_msgSend_animationEvents(self, v82, v83, v84);
        objc_msgSend_setAnimationEvents_(userAnimation, v86, v85, v87);
      }
      objc_sync_enter(self);

      self->_caAnimationCache = userAnimation;
      objc_sync_exit(self);
    }
  }
  return userAnimation;
}

- (void)__CFObject
{
  return self->_animationRef;
}

- (void)setKeyPath:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[6];

  self->_keyPath = (NSString *)objc_msgSend_copy(a3, v5, v6, v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend_setKeyPath_(self->_userAnimation, v8, (uint64_t)self->_keyPath, v9);
  if (self->_animationRef)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B18C56B0;
    v10[3] = &unk_1E63D53C8;
    v10[4] = a3;
    v10[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, 0, (uint64_t)self, v10);
  }
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (double)duration
{
  return self->_duration;
}

- (void)_didMutate
{
  self->_didMutate = 1;
}

- (void)setDuration:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  _QWORD v8[6];

  if (self->_duration != a3)
  {
    self->_duration = a3;
    objc_msgSend__didMutate(self, a2, v3, v4);
    if (self->_animationRef)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_1B18C57B0;
      v8[3] = &unk_1E63D5440;
      v8[4] = self;
      *(double *)&v8[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, 0, (uint64_t)self, v8);
    }
  }
}

- (float)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  _QWORD v8[5];
  float v9;

  if (self->_repeatCount != a3)
  {
    self->_repeatCount = a3;
    objc_msgSend__didMutate(self, a2, v3, v4);
    if (self->_animationRef)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_1B18C5868;
      v8[3] = &unk_1E63D53A0;
      v8[4] = self;
      v9 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, 0, (uint64_t)self, v8);
    }
  }
}

- (float)repeatDuration
{
  uint64_t v2;
  uint64_t v3;
  double v5;
  double v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  float result;

  objc_msgSend_duration(self, a2, v2, v3);
  v6 = v5;
  objc_msgSend_repeatCount(self, v7, v8, v9);
  result = v6 * v10;
  if (self->_autoreverses)
    return result + result;
  return result;
}

- (void)setRepeatDuration:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  double duration;
  double v6;

  if (a3 != 0.0)
  {
    duration = self->_duration;
    if (duration != 0.0)
    {
      v6 = a3 / duration;
      *(float *)&v6 = v6;
      if (self->_autoreverses)
        *(float *)&v6 = *(float *)&v6 * 0.5;
      objc_msgSend_setRepeatCount_(self, a2, v3, v4, v6);
    }
  }
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  _QWORD v8[6];

  if (self->_timeOffset != a3)
  {
    self->_timeOffset = a3;
    objc_msgSend__didMutate(self, a2, v3, v4);
    if (self->_animationRef)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_1B18C59A8;
      v8[3] = &unk_1E63D5440;
      v8[4] = self;
      *(double *)&v8[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, 0, (uint64_t)self, v8);
    }
  }
}

- (double)beginTime
{
  return self->_beginTime;
}

- (void)setBeginTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  _QWORD v8[6];

  if (self->_beginTime != a3)
  {
    self->_beginTime = a3;
    objc_msgSend__didMutate(self, a2, v3, v4);
    if (self->_animationRef)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_1B18C5A5C;
      v8[3] = &unk_1E63D5440;
      v8[4] = self;
      *(double *)&v8[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, 0, (uint64_t)self, v8);
    }
  }
}

- (BOOL)autoreverses
{
  return self->_autoreverses;
}

- (void)setAutoreverses:(BOOL)a3
{
  uint64_t v3;
  const char *v6;
  _QWORD v7[5];
  BOOL v8;

  if (self->_autoreverses != a3)
  {
    self->_autoreverses = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = sub_1B18C5B08;
      v7[3] = &unk_1E63D5328;
      v7[4] = self;
      v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (BOOL)fillsForward
{
  return self->_fillForward;
}

- (void)setFillsForward:(BOOL)a3
{
  uint64_t v3;
  const char *v6;
  _QWORD v7[5];
  BOOL v8;

  if (self->_fillForward != a3)
  {
    self->_fillForward = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = sub_1B18C5BB4;
      v7[3] = &unk_1E63D5328;
      v7[4] = self;
      v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (BOOL)fillsBackward
{
  return self->_fillBackward;
}

- (void)setFillsBackward:(BOOL)a3
{
  uint64_t v3;
  const char *v6;
  _QWORD v7[5];
  BOOL v8;

  if (self->_fillBackward != a3)
  {
    self->_fillBackward = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = sub_1B18C5C88;
      v7[3] = &unk_1E63D5328;
      v7[4] = self;
      v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (VFXTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  VFXTimingFunction *timingFunction;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[6];

  timingFunction = self->_timingFunction;
  if (timingFunction != a3)
  {

    self->_timingFunction = (VFXTimingFunction *)a3;
    objc_msgSend__didMutate(self, v6, v7, v8);
    if (self->_animationRef)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = sub_1B18C5D64;
      v10[3] = &unk_1E63D53C8;
      v10[4] = a3;
      v10[5] = self;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, 0, (uint64_t)self, v10);
    }
  }
}

- (BOOL)isRemovedOnCompletion
{
  return self->_removedOnCompletion;
}

- (void)setRemovedOnCompletion:(BOOL)a3
{
  uint64_t v3;
  const char *v6;
  _QWORD v7[5];
  BOOL v8;

  if (self->_removedOnCompletion != a3)
  {
    self->_removedOnCompletion = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = sub_1B18C5E2C;
      v7[3] = &unk_1E63D5328;
      v7[4] = self;
      v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (BOOL)isAppliedOnCompletion
{
  return self->_applyOnCompletion;
}

- (void)setAppliedOnCompletion:(BOOL)a3
{
  uint64_t v3;
  const char *v6;
  _QWORD v7[5];
  BOOL v8;

  if (self->_applyOnCompletion != a3)
  {
    self->_applyOnCompletion = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = sub_1B18C5ED8;
      v7[3] = &unk_1E63D5328;
      v7[4] = self;
      v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (id)animationDidStart
{
  return self->_animationDidStart;
}

- (void)setAnimationDidStart:(id)a3
{
  id animationDidStart;
  _QWORD v6[5];

  animationDidStart = self->_animationDidStart;
  if (animationDidStart)
    _Block_release(animationDidStart);
  self->_animationDidStart = 0;
  if (a3)
    self->_animationDidStart = _Block_copy(a3);
  if (self->_animationRef)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1B18C5F8C;
    v6[3] = &unk_1E63D5378;
    v6[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v6);
  }
}

- (id)animationDidStop
{
  return self->_animationDidStop;
}

- (void)setAnimationDidStop:(id)a3
{
  id animationDidStop;
  _QWORD v6[5];

  animationDidStop = self->_animationDidStop;
  if (animationDidStop)
    _Block_release(animationDidStop);
  self->_animationDidStop = 0;
  if (a3)
    self->_animationDidStop = _Block_copy(a3);
  if (self->_animationRef)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1B18C6140;
    v6[3] = &unk_1E63D5378;
    v6[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v6);
  }
}

- (NSArray)animationEvents
{
  return self->_animationEvents;
}

- (void)setAnimationEvents:(id)a3
{
  NSArray *animationEvents;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[6];

  animationEvents = self->_animationEvents;
  if (animationEvents != a3)
  {

    self->_animationEvents = (NSArray *)a3;
    objc_msgSend__didMutate(self, v6, v7, v8);
    if (self->_animationRef)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = sub_1B18C6548;
      v10[3] = &unk_1E63D53C8;
      v10[4] = self;
      v10[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, 0, (uint64_t)self, v10);
    }
  }
}

- (void)setFadeInDuration:(float)a3
{
  ((void (*)(VFXAnimation *, char *))MEMORY[0x1E0DE7D20])(self, sel_setBlendInDuration_);
}

- (float)fadeInDuration
{
  return self->_fadeInDuration;
}

- (double)blendInDuration
{
  return self->_fadeInDuration;
}

- (void)setBlendInDuration:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  _QWORD v8[6];

  if (self->_fadeInDuration != a3)
  {
    self->_fadeInDuration = a3;
    objc_msgSend__didMutate(self, a2, v3, v4);
    if (self->_animationRef)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_1B18C6628;
      v8[3] = &unk_1E63D5440;
      v8[4] = self;
      *(double *)&v8[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, 0, (uint64_t)self, v8);
    }
  }
}

- (float)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(float)a3
{
  ((void (*)(VFXAnimation *, char *))MEMORY[0x1E0DE7D20])(self, sel_setBlendOutDuration_);
}

- (double)blendOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setBlendOutDuration:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  _QWORD v8[6];

  if (self->_fadeOutDuration != a3)
  {
    self->_fadeOutDuration = a3;
    objc_msgSend__didMutate(self, a2, v3, v4);
    if (self->_animationRef)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_1B18C66F4;
      v8[3] = &unk_1E63D5440;
      v8[4] = self;
      *(double *)&v8[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, 0, (uint64_t)self, v8);
    }
  }
}

- (BOOL)isAdditive
{
  return self->_additive;
}

- (void)setAdditive:(BOOL)a3
{
  uint64_t v3;
  const char *v6;
  _QWORD v7[5];
  BOOL v8;

  if (self->_additive != a3)
  {
    self->_additive = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = sub_1B18C67A4;
      v7[3] = &unk_1E63D5328;
      v7[4] = self;
      v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (BOOL)isCumulative
{
  return self->_cumulative;
}

- (void)setCumulative:(BOOL)a3
{
  uint64_t v3;
  const char *v6;
  _QWORD v7[5];
  BOOL v8;

  if (self->_cumulative != a3)
  {
    self->_cumulative = a3;
    objc_msgSend__didMutate(self, a2, a3, v3);
    if (self->_animationRef)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = sub_1B18C6890;
      v7[3] = &unk_1E63D5328;
      v7[4] = self;
      v8 = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, 0, (uint64_t)self, v7);
    }
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  os_unfair_lock_s *p_userInfoLock;
  const char *v8;
  uint64_t v9;
  NSMutableDictionary *userInfo;

  p_userInfoLock = &self->_userInfoLock;
  os_unfair_lock_lock(&self->_userInfoLock);
  userInfo = self->_userInfo;
  if (!a3 || userInfo)
  {
    if (!a3)
    {
      objc_msgSend_removeObjectForKey_(userInfo, v8, (uint64_t)a4, v9);
      goto LABEL_7;
    }
  }
  else
  {
    userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_userInfo = userInfo;
  }
  objc_msgSend_setValue_forKey_(userInfo, v8, (uint64_t)a3, (uint64_t)a4);
LABEL_7:
  os_unfair_lock_unlock(p_userInfoLock);
}

- (id)valueForUndefinedKey:(id)a3
{
  os_unfair_lock_s *p_userInfoLock;
  const char *v6;
  uint64_t v7;
  id v8;

  p_userInfoLock = &self->_userInfoLock;
  os_unfair_lock_lock(&self->_userInfoLock);
  v8 = (id)objc_msgSend_valueForKey_(self->_userInfo, v6, (uint64_t)a3, v7);
  os_unfair_lock_unlock(p_userInfoLock);
  return v8;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  float duration;
  const char *v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  duration = self->_duration;
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v7, (uint64_t)CFSTR("<%@: %p, keyPath=%@ duration=%f repeatCount=%f>"), v8, v5, self, self->_keyPath, duration, self->_repeatCount);
}

- (void)_optimizeKeyframesWithTarget:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFXAnimation *animationRef;
  uint64_t v12;

  objc_msgSend_prepareWithTarget_implicitDuration_(self, a2, (uint64_t)a3, v3, 0.0);
  animationRef = self->_animationRef;
  if (animationRef)
  {
    sub_1B18C6A70(animationRef);
    self->_didMutate = 1;

    self->_userAnimation = 0;
  }
  else
  {
    sub_1B17C4408(0, (uint64_t)CFSTR("Warning: failed to optimize keyframes"), v5, v6, v7, v8, v9, v10, v12);
  }
}

- (id)subAnimations
{
  __CFXAnimation *animationRef;
  CFTypeID v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFXAnimation *v12;
  CFIndex v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  CFIndex i;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CFTypeRef *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;

  animationRef = self->_animationRef;
  if (!animationRef)
    return 0;
  v4 = CFGetTypeID(animationRef);
  if (v4 != sub_1B18FF324())
    return 0;
  v12 = self->_animationRef;
  v13 = sub_1B18FF4FC((uint64_t)v12, v5, v6, v7, v8, v9, v10, v11);
  v22 = (void *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v14, v13, v15);
  if (v13 >= 1)
  {
    for (i = 0; i != v13; ++i)
    {
      v24 = sub_1B18FF544((uint64_t)v12, i, v16, v17, v18, v19, v20, v21);
      v32 = sub_1B185E2E8(v24, v25, v26, v27, v28, v29, v30, v31);
      v35 = objc_msgSend_animationWithCFXAnimation_(VFXAnimation, v33, (uint64_t)v32, v34);
      objc_msgSend_addObject_(v22, v36, v35, v37);
      CFRelease(v32);
    }
  }
  return v22;
}

@end
