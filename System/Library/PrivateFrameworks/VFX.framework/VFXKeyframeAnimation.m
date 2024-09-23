@implementation VFXKeyframeAnimation

- (void)dealloc
{
  __CFXKeyframedAnimation *cfxAnimation;
  objc_super v4;

  cfxAnimation = self->_cfxAnimation;
  if (cfxAnimation)
  {
    CFRelease(cfxAnimation);
    self->_cfxAnimation = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation dealloc](&v4, sel_dealloc);
}

- (void)_convertToCA
{
  __CFXKeyframedAnimation *cfxAnimation;
  uint64_t v4;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  BOOL v35;
  unsigned int v36;
  float v37;
  float v38;
  float v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  _BOOL4 v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  double v68;
  double *v69;
  double *v70;
  double v71;
  double v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  unsigned int v84;
  double v85;
  double v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  VFXKeyframeAnimation *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unsigned int v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t *v137;
  double v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  VFXKeyframeAnimation *v150;
  unsigned int v151;
  CFTypeRef v152;
  double v153;
  _OWORD __dst[4];
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  self->_caReady = 1;
  cfxAnimation = self->_cfxAnimation;
  if (cfxAnimation)
  {
    v150 = self;
    v152 = CFRetain(cfxAnimation);
    v11 = sub_1B18072BC((uint64_t)v152, v4, v5, v6, v7, v8, v9, v10);
    v151 = sub_1B17F53FC(v11, v12, v13, v14, v15, v16, v17, v18);
    v26 = sub_1B17F53B4(v11, v19, v20, v21, v22, v23, v24, v25);
    v27 = v26;
    v30 = (void *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v28, v26, v29);
    v33 = (void *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v31, v26, v32);
    v34 = sub_1B17F5F34(v11);
    if (v26)
      v35 = !v34;
    else
      v35 = 1;
    if (!v35)
    {
      v36 = 0;
      do
      {
        v37 = sub_1B17F5F54(v11, v36);
        v38 = sub_1B17F5F60(v11, v36);
        v39 = sub_1B17F5F6C(v11, v36);
        v43 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v40, v41, v42, v37);
        objc_msgSend_addObject_(0, v44, v43, v45);
        v49 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v46, v47, v48, v38);
        objc_msgSend_addObject_(0, v50, v49, v51);
        v55 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v52, v53, v54, v39);
        objc_msgSend_addObject_(0, v56, v55, v57);
        ++v36;
      }
      while ((_DWORD)v27 != v36);
    }
    memset(__dst, 0, sizeof(__dst));
    v58 = sub_1B17F5F78(v11);
    if ((_DWORD)v27 && v58)
    {
      v66 = 0;
      v67 = 1;
      v68 = 0.0;
      do
      {
        v153 = v68;
        v69 = (double *)sub_1B17F5FAC(v11, v66);
        v70 = (double *)sub_1B17F5F98(v11, v66);
        if ((v67 & 1) == 0)
        {
          LODWORD(v71) = HIDWORD(v153);
          LODWORD(v72) = HIDWORD(*(_QWORD *)v69);
          v73 = objc_msgSend_functionWithControlPoints__::(MEMORY[0x1E0CD27D0], v59, v60, v61, v153, v71, *v69, v72);
          objc_msgSend_addObject_(0, v74, v73, v75);
        }
        v67 = 0;
        v68 = *v70;
        ++v66;
      }
      while (v27 != v66);
    }
    *(float *)&v83 = sub_1B185D118((uint64_t)v152, (uint64_t)v59, v60, v61, v62, v63, v64, v65);
    if ((_DWORD)v27)
    {
      v84 = 0;
      if (*(float *)&v83 == 0.0)
        *(float *)&v83 = 1.0;
      v85 = *(float *)&v83;
      while (1)
      {
        v86 = sub_1B17F5444(v11, v84, v77, v78, v79, v80, v81, v82);
        sub_1B17F54AC(v11, v84, __dst, v87, v88, v89, v90, v91);
        v95 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v92, v93, v94, v86 / v85);
        objc_msgSend_addObject_(v30, v96, v95, v97);
        v101 = sub_1B19BA16C((double *)__dst, (const char *)v151, v100, v98, v99);
        if (!v101)
          break;
        objc_msgSend_addObject_(v33, v102, v101, v103);
        if ((_DWORD)v27 == ++v84)
          goto LABEL_20;
      }
      v104 = v150;

      goto LABEL_29;
    }
LABEL_20:
    v104 = v150;
    objc_msgSend_setKeyTimes_(v150, v76, (uint64_t)v30, v78, v83);
    objc_msgSend_setValues_(v150, v105, (uint64_t)v33, v106);
    objc_msgSend_setContinuityValues_(v150, v107, 0, v108);
    objc_msgSend_setTensionValues_(v150, v109, 0, v110);
    objc_msgSend_setBiasValues_(v150, v111, 0, v112);
    objc_msgSend_setTimingFunctions_(v150, v113, 0, v114);
    v122 = sub_1B17F58D8(v11, v115, v116, v117, v118, v119, v120, v121);
    if (sub_1B17F582C(v11, v123, v124, v125, v126, v127, v128, v129) == 1)
    {
      v137 = (uint64_t *)MEMORY[0x1E0CD2948];
      if (v122 == 2)
        v137 = (uint64_t *)MEMORY[0x1E0CD2928];
    }
    else
    {
      if (v122 > 2)
      {
LABEL_27:
        v138 = sub_1B17F519C(v11, (uint64_t)v130, v131, v132, v133, v134, v135, v136);
        objc_msgSend_setDuration_(v150, v139, v140, v141, v138);
        sub_1B18C84B0(v150, (uint64_t)v152, v142, v143, v144, v145, v146, v147);
LABEL_29:
        objc_msgSend_setCfxAnimation_(v104, v148, (uint64_t)v152, v149);
        CFRelease(v152);
        return;
      }
      v137 = (uint64_t *)qword_1E63D87C0[v122];
    }
    objc_msgSend_setCalculationMode_(v150, v130, *v137, v132);
    goto LABEL_27;
  }
}

- (void)_clearCFXCache
{
  uint64_t v2;
  uint64_t v3;
  __CFXKeyframedAnimation *cfxAnimation;

  if (!self->_caReady)
    objc_msgSend__convertToCA(self, a2, v2, v3);
  cfxAnimation = self->_cfxAnimation;
  if (cfxAnimation)
    CFRelease(cfxAnimation);
  self->_cfxAnimation = 0;
}

- (id)values
{
  uint64_t v2;
  uint64_t v3;
  objc_super v6;

  if (!self->_caReady)
    objc_msgSend__convertToCA(self, a2, v2, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  return -[VFXKeyframeAnimation values](&v6, sel_values);
}

- (void)setValues:(id)a3
{
  uint64_t v3;
  objc_super v6;

  if (self->_cfxAnimation)
    objc_msgSend__clearCFXCache(self, a2, (uint64_t)a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setValues:](&v6, sel_setValues_, a3);
}

- (id)keyTimes
{
  uint64_t v2;
  uint64_t v3;
  objc_super v6;

  if (!self->_caReady)
    objc_msgSend__convertToCA(self, a2, v2, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  return -[VFXKeyframeAnimation keyTimes](&v6, sel_keyTimes);
}

- (void)setKeyTimes:(id)a3
{
  uint64_t v3;
  objc_super v6;

  if (self->_cfxAnimation)
    objc_msgSend__clearCFXCache(self, a2, (uint64_t)a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setKeyTimes:](&v6, sel_setKeyTimes_, a3);
}

- (id)timingFunctions
{
  uint64_t v2;
  uint64_t v3;
  objc_super v6;

  if (!self->_caReady)
    objc_msgSend__convertToCA(self, a2, v2, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  return -[VFXKeyframeAnimation timingFunctions](&v6, sel_timingFunctions);
}

- (void)setTimingFunctions:(id)a3
{
  uint64_t v3;
  objc_super v6;

  if (self->_cfxAnimation)
    objc_msgSend__clearCFXCache(self, a2, (uint64_t)a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setTimingFunctions:](&v6, sel_setTimingFunctions_, a3);
}

- (id)tensionValues
{
  uint64_t v2;
  uint64_t v3;
  objc_super v6;

  if (!self->_caReady)
    objc_msgSend__convertToCA(self, a2, v2, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  return -[VFXKeyframeAnimation tensionValues](&v6, sel_tensionValues);
}

- (void)setTensionValues:(id)a3
{
  uint64_t v3;
  objc_super v6;

  if (self->_cfxAnimation)
    objc_msgSend__clearCFXCache(self, a2, (uint64_t)a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setTensionValues:](&v6, sel_setTensionValues_, a3);
}

- (id)continuityValues
{
  uint64_t v2;
  uint64_t v3;
  objc_super v6;

  if (!self->_caReady)
    objc_msgSend__convertToCA(self, a2, v2, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  return -[VFXKeyframeAnimation continuityValues](&v6, sel_continuityValues);
}

- (void)setContinuityValues:(id)a3
{
  uint64_t v3;
  objc_super v6;

  if (self->_cfxAnimation)
    objc_msgSend__clearCFXCache(self, a2, (uint64_t)a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setContinuityValues:](&v6, sel_setContinuityValues_, a3);
}

- (id)biasValues
{
  uint64_t v2;
  uint64_t v3;
  objc_super v6;

  if (!self->_caReady)
    objc_msgSend__convertToCA(self, a2, v2, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  return -[VFXKeyframeAnimation biasValues](&v6, sel_biasValues);
}

- (void)setBiasValues:(id)a3
{
  uint64_t v3;
  objc_super v6;

  if (self->_cfxAnimation)
    objc_msgSend__clearCFXCache(self, a2, (uint64_t)a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setBiasValues:](&v6, sel_setBiasValues_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFTypeRef *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  objc_super v28;

  if (self->_caReady || !self->_cfxAnimation)
  {
    v28.receiver = self;
    v28.super_class = (Class)VFXKeyframeAnimation;
    return -[VFXKeyframeAnimation copyWithZone:](&v28, sel_copyWithZone_, a3);
  }
  else
  {
    v4 = objc_alloc_init((Class)objc_opt_class());
    v12 = sub_1B185E2E8(self->_cfxAnimation, v5, v6, v7, v8, v9, v10, v11);
    objc_msgSend_setCfxAnimation_(v4, v13, (uint64_t)v12, v14);
    CFRelease(v12);
    v18 = objc_msgSend_keyPath(self, v15, v16, v17);
    objc_msgSend_setKeyPath_(v4, v19, v18, v20);
    v24 = objc_msgSend_delegate(self, v21, v22, v23);
    objc_msgSend_setDelegate_(v4, v25, v24, v26);
  }
  return v4;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  objc_super v15;

  if (self->_caReady)
  {
    v15.receiver = self;
    v15.super_class = (Class)VFXKeyframeAnimation;
    return -[VFXKeyframeAnimation description](&v15, sel_description);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_duration(self, a2, v2, v3);
    v8 = v7;
    v12 = objc_msgSend_keyPath(self, v9, v10, v11);
    return (id)objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("VFXKeyframeAnimation %p (duration=%f, keyPath:%@)"), v14, self, v8, v12);
  }
}

- (__CFXKeyframedAnimation)cfxAnimation
{
  return self->_cfxAnimation;
}

- (void)setCfxAnimation:(__CFXKeyframedAnimation *)a3
{
  __CFXKeyframedAnimation *cfxAnimation;
  __CFXKeyframedAnimation *v6;

  cfxAnimation = self->_cfxAnimation;
  if (cfxAnimation != a3)
  {
    if (cfxAnimation)
    {
      CFRelease(cfxAnimation);
      self->_cfxAnimation = 0;
    }
    if (a3)
      v6 = (__CFXKeyframedAnimation *)CFRetain(a3);
    else
      v6 = 0;
    self->_cfxAnimation = v6;
  }
}

- (void)setDuration:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 caReady;
  __CFXKeyframedAnimation *cfxAnimation;
  float v13;
  float v14;
  objc_super v15;

  caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation)
    {
      v13 = a3;
      sub_1B185D0C4((uint64_t)cfxAnimation, v13, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
    }
  }
  else if (cfxAnimation)
  {
    v14 = a3;
    sub_1B185D0C4((uint64_t)cfxAnimation, v14, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
    return;
  }
  v15.receiver = self;
  v15.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setDuration:](&v15, sel_setDuration_, a3);
}

- (double)duration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double result;
  objc_super v9;

  if (self->_cfxAnimation)
    return sub_1B185D118((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation duration](&v9, sel_duration);
  return result;
}

- (void)setKeyPath:(id)a3
{
  const __CFString *v5;
  objc_super v6;

  if (!self->_cfxAnimation)
    goto LABEL_5;
  v5 = sub_1B17A02B4((const __CFString *)a3);
  sub_1B185D040((uint64_t)self->_cfxAnimation, v5);
  if (v5)
    CFRelease(v5);
  if (self->_caReady)
  {
LABEL_5:
    v6.receiver = self;
    v6.super_class = (Class)VFXKeyframeAnimation;
    -[VFXKeyframeAnimation setKeyPath:](&v6, sel_setKeyPath_, a3);
  }
}

- (id)keyPath
{
  __CFXKeyframedAnimation *cfxAnimation;
  const __CFArray *v4;
  objc_super v6;

  cfxAnimation = self->_cfxAnimation;
  if (cfxAnimation)
  {
    v4 = (const __CFArray *)sub_1B185D090((uint64_t)cfxAnimation);
    if (v4)
      return sub_1B17A02D0(v4);
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  return -[VFXKeyframeAnimation keyPath](&v6, sel_keyPath);
}

- (void)setRepeatCount:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFXKeyframedAnimation *cfxAnimation;
  double v12;
  objc_super v13;

  cfxAnimation = self->_cfxAnimation;
  if (cfxAnimation)
    sub_1B185D1F4((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
  if (self->_caReady)
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXKeyframeAnimation;
    *(float *)&v12 = a3;
    -[VFXKeyframeAnimation setRepeatCount:](&v13, sel_setRepeatCount_, v12);
  }
}

- (float)repeatCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float result;
  objc_super v9;

  if (self->_cfxAnimation)
    return sub_1B185D248((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation repeatCount](&v9, sel_repeatCount);
  return result;
}

- (void)setRepeatDuration:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v7;

  if (self->_cfxAnimation)
    objc_msgSend__clearCFXCache(self, a2, v3, v4);
  v7.receiver = self;
  v7.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setRepeatDuration:](&v7, sel_setRepeatDuration_, a3);
}

- (double)repeatDuration
{
  uint64_t v2;
  uint64_t v3;
  double result;
  objc_super v6;

  if (!self->_caReady)
    objc_msgSend__convertToCA(self, a2, v2, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation repeatDuration](&v6, sel_repeatDuration);
  return result;
}

- (void)setAutoreverses:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  _BOOL4 caReady;
  __CFXKeyframedAnimation *cfxAnimation;
  objc_super v12;

  v8 = a3;
  caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation)
      sub_1B185D290((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
  }
  else if (cfxAnimation)
  {
    sub_1B185D290((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
    return;
  }
  v12.receiver = self;
  v12.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setAutoreverses:](&v12, sel_setAutoreverses_, v8);
}

- (BOOL)autoreverses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  if (self->_cfxAnimation)
    return sub_1B185D2E8((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)VFXKeyframeAnimation;
  return -[VFXKeyframeAnimation autoreverses](&v9, sel_autoreverses);
}

- (void)setTimeOffset:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 caReady;
  __CFXKeyframedAnimation *cfxAnimation;
  objc_super v13;

  caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation)
      sub_1B185D69C((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
  }
  else if (cfxAnimation)
  {
    sub_1B185D69C((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
    return;
  }
  v13.receiver = self;
  v13.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setTimeOffset:](&v13, sel_setTimeOffset_, a3);
}

- (double)timeOffset
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double result;
  objc_super v9;

  if (self->_cfxAnimation)
    return sub_1B185D6F0((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation timeOffset](&v9, sel_timeOffset);
  return result;
}

- (void)setSpeed:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 caReady;
  __CFXKeyframedAnimation *cfxAnimation;
  double v13;
  objc_super v14;

  caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation)
      sub_1B185D738((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
  }
  else if (cfxAnimation)
  {
    sub_1B185D738((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
    return;
  }
  v14.receiver = self;
  v14.super_class = (Class)VFXKeyframeAnimation;
  *(float *)&v13 = a3;
  -[VFXKeyframeAnimation setSpeed:](&v14, sel_setSpeed_, v13);
}

- (float)speed
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float result;
  objc_super v9;

  if (self->_cfxAnimation)
    return sub_1B185D78C((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation speed](&v9, sel_speed);
  return result;
}

- (void)setFadeInDuration:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 caReady;
  __CFXKeyframedAnimation *cfxAnimation;
  double v13;
  objc_super v14;

  caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation)
      sub_1B185D7D4((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
  }
  else if (cfxAnimation)
  {
    sub_1B185D7D4((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
    return;
  }
  v14.receiver = self;
  v14.super_class = (Class)VFXKeyframeAnimation;
  *(float *)&v13 = a3;
  -[CAAnimation setFadeInDuration:](&v14, sel_setFadeInDuration_, v13);
}

- (float)fadeInDuration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float result;
  objc_super v9;

  if (self->_cfxAnimation)
    return sub_1B185D828((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)VFXKeyframeAnimation;
  -[CAAnimation fadeInDuration](&v9, sel_fadeInDuration);
  return result;
}

- (void)setFadeOutDuration:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 caReady;
  __CFXKeyframedAnimation *cfxAnimation;
  double v13;
  objc_super v14;

  caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation)
      sub_1B185D870((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
  }
  else if (cfxAnimation)
  {
    sub_1B185D870((uint64_t)cfxAnimation, a3, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
    return;
  }
  v14.receiver = self;
  v14.super_class = (Class)VFXKeyframeAnimation;
  *(float *)&v13 = a3;
  -[CAAnimation setFadeOutDuration:](&v14, sel_setFadeOutDuration_, v13);
}

- (float)fadeOutDuration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float result;
  objc_super v9;

  if (self->_cfxAnimation)
    return sub_1B185D8C4((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)VFXKeyframeAnimation;
  -[CAAnimation fadeOutDuration](&v9, sel_fadeOutDuration);
  return result;
}

- (void)setRemovedOnCompletion:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  _BOOL4 caReady;
  __CFXKeyframedAnimation *cfxAnimation;
  objc_super v12;

  v8 = a3;
  caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation)
      sub_1B185D5A0((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
  }
  else if (cfxAnimation)
  {
    sub_1B185D5A0((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
    return;
  }
  v12.receiver = self;
  v12.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setRemovedOnCompletion:](&v12, sel_setRemovedOnCompletion_, v8);
}

- (BOOL)isRemovedOnCompletion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  if (self->_cfxAnimation)
    return sub_1B185D554((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)VFXKeyframeAnimation;
  return -[VFXKeyframeAnimation isRemovedOnCompletion](&v9, sel_isRemovedOnCompletion);
}

- (void)setCommitsOnCompletion:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  _BOOL4 caReady;
  __CFXKeyframedAnimation *cfxAnimation;
  objc_super v12;

  v8 = a3;
  caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation)
      sub_1B185D90C(cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
  }
  else if (cfxAnimation)
  {
    sub_1B185D90C(cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
    return;
  }
  v12.receiver = self;
  v12.super_class = (Class)VFXKeyframeAnimation;
  -[CAAnimation setCommitsOnCompletion:](&v12, sel_setCommitsOnCompletion_, v8);
}

- (BOOL)commitsOnCompletion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  if (self->_cfxAnimation)
    return sub_1B185D9C8((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)VFXKeyframeAnimation;
  return -[CAAnimation commitsOnCompletion](&v9, sel_commitsOnCompletion);
}

- (void)setFillMode:(id)a3
{
  uint64_t v3;
  __CFXKeyframedAnimation *cfxAnimation;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  cfxAnimation = self->_cfxAnimation;
  if (self->_caReady)
  {
    if (cfxAnimation)
    {
      v7 = sub_1B18C16BC((uint64_t)a3, a2, (uint64_t)a3, v3);
      sub_1B185DCD8((uint64_t)cfxAnimation, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else if (cfxAnimation)
  {
    v14 = sub_1B18C16BC((uint64_t)a3, a2, (uint64_t)a3, v3);
    sub_1B185DCD8((uint64_t)cfxAnimation, v14, v15, v16, v17, v18, v19, v20);
    return;
  }
  v21.receiver = self;
  v21.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setFillMode:](&v21, sel_setFillMode_, a3);
}

- (id)fillMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  if (self->_cfxAnimation)
  {
    v8 = sub_1B185DC8C((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
    return (id)sub_1B18C1790(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VFXKeyframeAnimation;
    return -[VFXKeyframeAnimation fillMode](&v17, sel_fillMode);
  }
}

- (void)setAnimationEvents:(id)a3
{
  uint64_t v3;
  __CFXKeyframedAnimation *cfxAnimation;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_super v22;

  cfxAnimation = self->_cfxAnimation;
  if (self->_caReady)
  {
    if (cfxAnimation)
    {
      v7 = sub_1B18C18CC(a3, a2, (uint64_t)a3, v3);
      sub_1B185DB64((uint64_t)cfxAnimation, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else if (cfxAnimation)
  {
    v14 = sub_1B18C18CC(a3, a2, (uint64_t)a3, v3);
    sub_1B185DB64((uint64_t)cfxAnimation, v14, v15, v16, v17, v18, v19, v20);
    return;
  }
  v21 = (void *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  v22.receiver = self;
  v22.super_class = (Class)VFXKeyframeAnimation;
  -[CAAnimation setAnimationEvents:](&v22, sel_setAnimationEvents_, v21);

}

- (id)animationEvents
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  if (self->_cfxAnimation)
  {
    v8 = sub_1B185DB1C((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
    return sub_1B18C1A64(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VFXKeyframeAnimation;
    return -[CAAnimation animationEvents](&v17, sel_animationEvents);
  }
}

- (void)setTimingFunction:(id)a3
{
  __CFXKeyframedAnimation *cfxAnimation;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  cfxAnimation = self->_cfxAnimation;
  if (self->_caReady)
  {
    if (cfxAnimation)
    {
      v6 = sub_1B1881E78(a3, a2);
      sub_1B185D334((uint64_t)cfxAnimation, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else if (cfxAnimation)
  {
    v13 = sub_1B1881E78(a3, a2);
    sub_1B185D334((uint64_t)cfxAnimation, v13, v14, v15, v16, v17, v18, v19);
    return;
  }
  v20.receiver = self;
  v20.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setTimingFunction:](&v20, sel_setTimingFunction_, a3);
}

- (id)timingFunction
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  if (self->_cfxAnimation)
  {
    result = (id)sub_1B185D3AC((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
    if (result)
      return (id)sub_1B1881EFC((uint64_t)result, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VFXKeyframeAnimation;
    return -[VFXKeyframeAnimation timingFunction](&v16, sel_timingFunction);
  }
  return result;
}

- (void)setAdditive:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  _BOOL4 caReady;
  __CFXKeyframedAnimation *cfxAnimation;
  objc_super v12;

  v8 = a3;
  caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation)
      sub_1B185D3F4((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
  }
  else if (cfxAnimation)
  {
    sub_1B185D3F4((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
    return;
  }
  v12.receiver = self;
  v12.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setAdditive:](&v12, sel_setAdditive_, v8);
}

- (BOOL)isAdditive
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  if (self->_cfxAnimation)
    return sub_1B185D508((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)VFXKeyframeAnimation;
  return -[VFXKeyframeAnimation isAdditive](&v9, sel_isAdditive);
}

- (void)setCumulative:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  _BOOL4 caReady;
  __CFXKeyframedAnimation *cfxAnimation;
  objc_super v12;

  v8 = a3;
  caReady = self->_caReady;
  cfxAnimation = self->_cfxAnimation;
  if (caReady)
  {
    if (cfxAnimation)
      sub_1B185D4A4((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
  }
  else if (cfxAnimation)
  {
    sub_1B185D4A4((uint64_t)cfxAnimation, a3, a3, v3, v4, v5, v6, v7);
    return;
  }
  v12.receiver = self;
  v12.super_class = (Class)VFXKeyframeAnimation;
  -[VFXKeyframeAnimation setCumulative:](&v12, sel_setCumulative_, v8);
}

- (BOOL)isCumulative
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  if (self->_cfxAnimation)
    return sub_1B185D458((uint64_t)self->_cfxAnimation, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)VFXKeyframeAnimation;
  return -[VFXKeyframeAnimation isCumulative](&v9, sel_isCumulative);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
