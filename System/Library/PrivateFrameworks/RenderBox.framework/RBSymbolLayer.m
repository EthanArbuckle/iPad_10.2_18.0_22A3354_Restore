@implementation RBSymbolLayer

- (RBSymbolLayer)init
{
  RBSymbolLayer *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RBSymbolLayer;
  result = -[RBSymbolLayer init](&v8, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *((_OWORD *)result + 5) = _Q0;
    *((_QWORD *)result + 12) = 0;
    *((_QWORD *)result + 13) = 0;
  }
  return result;
}

- (RBSymbolLayer)initWithCoder:(id)a3
{
  RBSymbolLayer *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RBSymbolLayer;
  result = -[RBSymbolLayer initWithCoder:](&v9, sel_initWithCoder_, a3);
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *((_OWORD *)result + 5) = _Q0;
    *((_QWORD *)result + 12) = 0;
    *((_QWORD *)result + 13) = 0;
  }
  return result;
}

- (RBSymbolLayer)initWithLayer:(id)a3
{
  RBSymbolLayer *v4;
  RBSymbolLayer *v5;
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RBSymbolLayer;
  v4 = -[RBSymbolLayer initWithLayer:](&v12, sel_initWithLayer_);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)*((_QWORD *)a3 + 4);
    v7 = (void *)*((_QWORD *)v4 + 4);
    if (v7 != v6)
    {

      *((_QWORD *)v5 + 4) = v6;
    }
    v8 = *((_OWORD *)a3 + 6);
    *((_OWORD *)v5 + 5) = *((_OWORD *)a3 + 5);
    *((_OWORD *)v5 + 6) = v8;
    *((_DWORD *)v5 + 19) = *((_DWORD *)a3 + 19);
    v9 = (void *)*((_QWORD *)a3 + 5);
    v10 = (void *)*((_QWORD *)v5 + 5);
    if (v10 != v9)
    {

      *((_QWORD *)v5 + 5) = v9;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[RBSymbolAnimator removeObserver:](*((_QWORD *)self + 4), (uint64_t)self);
  +[CALayer cancelAnimation:](MEMORY[0x24BDE56D0], self);
  v3.receiver = self;
  v3.super_class = (Class)RBSymbolLayer;
  -[RBSymbolLayer dealloc](&v3, sel_dealloc);
}

- (RBSymbolAnimator)animator
{
  return (RBSymbolAnimator *)*((_QWORD *)self + 4);
}

- (void)setAnimator:(id)a3
{
  os_unfair_lock_s *v5;
  id v6;

  v5 = (os_unfair_lock_s *)((char *)self + 64);
  os_unfair_lock_lock((os_unfair_lock_t)self + 16);
  v6 = (id)*((_QWORD *)self + 4);
  if (v6 == a3)
  {
    v6 = 0;
  }
  else
  {
    *((_QWORD *)self + 4) = 0;
    if (a3)
    {

      *((_QWORD *)self + 4) = a3;
    }
  }
  os_unfair_lock_unlock(v5);
  if (v6 != a3)
  {
    -[RBSymbolAnimator removeObserver:]((uint64_t)v6, (uint64_t)self);
    -[RBSymbolAnimator addObserver:]((uint64_t)a3, (uint64_t)self);
    -[RBSymbolLayer setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSymbolTransform:(id)a3
{
  double dy;
  double dx;
  double v5;
  double v6;
  os_unfair_lock_s *v8;

  dy = a3.var1.dy;
  dx = a3.var1.dx;
  v5 = a3.var0.dy;
  v6 = a3.var0.dx;
  v8 = (os_unfair_lock_s *)((char *)self + 64);
  os_unfair_lock_lock((os_unfair_lock_t)self + 16);
  if (v6 == *((double *)self + 10)
    && v5 == *((double *)self + 11)
    && dx == *((double *)self + 12)
    && dy == *((double *)self + 13))
  {
    os_unfair_lock_unlock(v8);
  }
  else
  {
    *((double *)self + 10) = v6;
    *((double *)self + 11) = v5;
    *((double *)self + 12) = dx;
    *((double *)self + 13) = dy;
    os_unfair_lock_unlock(v8);
    -[RBSymbolLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)styleResolver
{
  return (id)*((_QWORD *)self + 5);
}

- (void)setStyleResolver:(id)a3
{
  os_unfair_lock_s *v5;
  uint64_t v6;

  v5 = (os_unfair_lock_s *)((char *)self + 64);
  os_unfair_lock_lock((os_unfair_lock_t)self + 16);
  if (*((id *)self + 5) == a3)
  {
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v6 = objc_msgSend(a3, "copy");

    *((_QWORD *)self + 5) = v6;
    os_unfair_lock_unlock(v5);
    -[RBSymbolLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)resolveStyle:(unsigned int)a3 colorName:(id)a4
{
  uint64_t v5;
  void (**v6)(id, _QWORD, id);
  float v7;
  float v8;
  float v9;
  float v10;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v5 = *(_QWORD *)&a3;
  v6 = -[RBSymbolLayer styleResolver](self, "styleResolver");
  if (v6)
  {
    v6[2](v6, v5, a4);
  }
  else
  {
    v7 = -32768.0;
    v8 = -32768.0;
    v9 = -32768.0;
    v10 = -32768.0;
  }
  result.var3 = v10;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)symbolAnimatorDidChange:(id)a3
{
  -[RBSymbolLayer setNeedsLayout](self, "setNeedsLayout", a3);
  objc_msgSend((id)-[RBSymbolLayer superlayer](self, "superlayer"), "setNeedsLayout");
}

- (void)setNeedsLayout
{
  objc_super v3;

  if (!*((_DWORD *)self + 17))
  {
    +[CALayer cancelAnimation:](MEMORY[0x24BDE56D0], self);
    v3.receiver = self;
    v3.super_class = (Class)RBSymbolLayer;
    -[RBSymbolLayer setNeedsLayout](&v3, sel_setNeedsLayout);
  }
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  *((_BYTE *)self + 73) = a3;
  -[RBSymbolLayer setNeedsLayout](self, "setNeedsLayout");
  v5.receiver = self;
  v5.super_class = (Class)RBSymbolLayer;
  -[RBSymbolLayer layerDidBecomeVisible:](&v5, sel_layerDidBecomeVisible_, v3);
}

- (void)layoutSublayers
{
  double v3;

  v3 = CACurrentMediaTime();
  -[RBSymbolLayer updateForTime:]((os_unfair_lock_s *)self, v3);
}

- (void)updateForTime:(os_unfair_lock_s *)a1
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  float v7;
  int64x2_t v8;
  float64_t v9;
  double v10;
  int v11;
  id v12;
  unsigned __int8 v13;
  double v14;
  float **v15;
  float *v16;
  float *v17;
  float v18;
  float *v19;
  float *v20;
  float *v21;
  float *v22;
  BOOL v23;
  float *v24;
  float v25;
  float *v26;
  float v27;
  float *v28;
  float v29;
  uint64_t updated;
  __int128 v31;
  __int128 v32;
  _BOOL4 v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __n128 *p_dst;
  __n128 *v40;
  void *v41;
  __n128 *v42;
  __n128 *v43;
  float v44;
  float v45;
  float v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  CFTypeRef v51;
  CFTypeRef v52;
  CGColorRef ConstantColor;
  __n128 v54;
  __n128 v55;
  __n128 v56;
  unint64_t v57;
  __n128 *v58;
  __n128 *v59;
  __n128 v60;
  __n128 v61;
  __n128 v62;
  unint64_t v63;
  __n128 *v64;
  __n128 *v65;
  __n128 *v66;
  uint64_t v67;
  __n128 *v68;
  uint64_t v69;
  float v70;
  float v71;
  float v72;
  float v73;
  uint64_t v74;
  uint64_t v75;
  CGColor *v76;
  float v77;
  float v78;
  float v79;
  float v80;
  CGColorRef v81;
  __n128 *v82;
  CGColorRef v83;
  __n128 *v84;
  CGColorRef v85;
  CFTypeRef v86;
  const void *v87;
  char v88;
  CALayer *v89;
  NSArray *v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  __n128 *v95;
  id v96;
  unsigned __int8 v97;
  void *v98;
  unint64_t v99;
  __n128 *v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  __n128 *v104;
  void *v105;
  double v106;
  uint64_t v107;
  NSArray *v108;
  void *v109;
  __n128 *v110;
  void *v111;
  __n128 *v112;
  void *v113;
  unint64_t v114;
  __n128 *v115;
  unint64_t v116;
  CFTypeRef *v117;
  int v118;
  CALayer *v119;
  CALayer *v120;
  double v121;
  double v122;
  double v123;
  uint64_t v124;
  unsigned __int8 v125;
  unsigned __int8 v126;
  uint64_t *v127;
  void *v128;
  __int128 v129;
  __int128 v130;
  RB::DisplayList::State *State;
  CALayer *v132;
  uint64_t v133;
  CGColor *v134;
  __n128 v135;
  double v136;
  float v137;
  float v138;
  float v139;
  NSArray *v140;
  unint64_t i;
  CALayer *v142;
  const __CFString *colorName;
  CFStringRef colorNamea;
  os_unfair_lock_s *v145;
  __n128 v146;
  __n128 v147;
  void *v148;
  __n128 v149;
  __n128 v150;
  uint64_t v151;
  CFTypeRef cf;
  unsigned int v153;
  __n128 v154;
  __n128 v155;
  unint64_t v156;
  uint64_t v157;
  uint64_t v158;
  _QWORD v159[3];
  _QWORD v160[3];
  _QWORD v161[3];
  _QWORD v162[3];
  float64x2_t v163;
  __n128 v164;
  __n128 v165;
  _QWORD v166[3];
  float64x2_t v167;
  __n128 v168;
  __n128 v169;
  _QWORD v170[3];
  _QWORD v171[3];
  __n128 v172;
  __int128 v173;
  __int128 v174;
  CALayer *v175[2];
  _BYTE v176[32];
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  double v181;
  float v182;
  float64x2_t v183;
  float64x2_t v184;
  float64x2_t v185;
  CGRect rect2;
  double v187;
  char v188;
  __int128 v189;
  int v190;
  CFTypeRef v191;
  __n128 __dst;
  __int128 v193;
  CFTypeRef v194[2];
  CALayer **v195;
  void *v196[2];
  unint64_t v197;
  uint64_t v198;
  CGRect v199;

  v198 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = (uint64_t)a1;
    v4 = a1 + 16;
    os_unfair_lock_lock(a1 + 16);
    *(_DWORD *)(v3 + 68) = 1;
    if (*(double *)(v3 + 56) > a2)
      a2 = *(double *)(v3 + 56);
    *(double *)(v3 + 56) = a2;
    v5 = *(_QWORD *)(v3 + 32);
    if (!v5 || !*(_BYTE *)(v3 + 73))
    {
      -[RBSymbolLayer clearContents](v3);
      goto LABEL_10;
    }
    v6 = (os_unfair_lock_s *)-[RBAnimation rb_animation](v5);
    RB::Symbol::Animator::set_current_time(v6, a2);
    if (v188)
    {
      -[RBSymbolLayer clearContents](v3);
LABEL_8:
      v7 = v187 * v182;
      -[CALayer scheduleAnimation:atTime:maxVelocityInPixels:]((void *)v3, (void *)v3, v181, v7);
      -[RBSymbolAnimator unblockObservers](*(_QWORD *)(v3 + 32));
      RB::Symbol::Presentation::~Presentation((RB::Symbol::Presentation *)v176);
LABEL_10:
      *(_DWORD *)(v3 + 68) = 0;
      os_unfair_lock_unlock(v4);
      return;
    }
    v153 = -[CALayer drawingOptions](v175[0], "drawingOptions");
    v8 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v184, (float64x2_t)xmmword_209BD52A0), (int8x16_t)vceqq_f64(v183, (float64x2_t)xmmword_209BD5290)), (int8x16_t)vceqzq_f64(v185));
    v157 = v3;
    if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), (int8x16_t)v8).u64[0] & 0x8000000000000000) != 0
      && (v153 & 2) == 0
      && (RB::Symbol::Presentation::style_mask((RB::Symbol::Presentation *)v176) & 0x1000) == 0)
    {
      RB::Symbol::Presentation::template_image((uint64_t)v176, (uint64_t)&v172);
      v9 = v172.n128_f64[0];
      if (v172.n128_u64[0])
      {
        v10 = v172.n128_f64[1];
        v11 = v173;
        if (LOBYTE(v175[0][2]._attr.refcount) != 3
          || (v12 = -[NSArray objectAtIndexedSubscript:](-[CALayer sublayers](v175[0], "sublayers"), "objectAtIndexedSubscript:", 0)) == 0)
        {
          v12 = (id)objc_opt_new();
          -[CALayer configureSublayer:type:](v175[0], "configureSublayer:type:", v12, 0);
          if (color_symbols())
          {
            if ((v13 & 1) == 0
            {
            }
          }
          objc_msgSend(v12, "setContentsGravity:", *MEMORY[0x24BDE5C68]);
          objc_msgSend(v12, "setContentsSwizzle:", *MEMORY[0x24BDE5CC0]);
          objc_msgSend(v12, "setDelegate:", v175[0]);
          *(_QWORD *)&v189 = v12;
          -[CALayer setSublayers:](v175[0], "setSublayers:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v189, 1));

          if (v175[0] && LOBYTE(v175[0][2]._attr.refcount) != 3)
            LOBYTE(v175[0][2]._attr.refcount) = 3;
        }
        objc_msgSend(v12, "setContents:", *(_QWORD *)&v9);
        objc_msgSend(v12, "setContentsScale:", v10);
        LODWORD(v14) = v11;
        objc_msgSend(v12, "setOpacity:", v14);
        if (color_symbols())
        {
          -[CALayer bounds](v175[0], "bounds");
          objc_msgSend(v12, "setFrame:");
        }
        __dst = (__n128)RBColorWhite;
        LODWORD(v193) = 10;
        v194[1] = 0;
        if (RB::Symbol::ResolvedColor::begin_update((uint64_t)&__dst, 0, 0, 0))
        {
          v15 = (float **)&v179;
          if (v180)
            v15 = (float **)(v180 + 376);
          v16 = *v15;
          v17 = (float *)&v178 + 1;
          if (v180)
            v17 = (float *)(v180 + 36);
          if (v16)
            v17 = v16 + 5;
          v18 = *v17;
          if (*v17 == -32768.0)
          {
            -[CALayer resolveStyle:colorName:](v175[0], "resolveStyle:colorName:", 0, 0);
          }
          else
          {
            v19 = (float *)&v177;
            if (v180)
              v19 = (float *)(v180 + 24);
            v20 = v16 + 2;
            v21 = (float *)&v178;
            if (v180)
              v21 = (float *)(v180 + 32);
            v22 = (float *)(v180 + 28);
            if (!v180)
              v22 = (float *)&v177 + 1;
            v23 = v16 == 0;
            v24 = v16 + 4;
            if (!v16)
              v24 = v21;
            v25 = *v24;
            v26 = v16 + 3;
            if (v23)
              v26 = v22;
            v27 = *v26;
            if (v23)
              v28 = v19;
            else
              v28 = v20;
            v29 = *v28;
          }
          RB::Symbol::ResolvedColor::commit_update((uint64_t)&__dst, v29, v27, v25, v18);
        }
        v134 = (CGColor *)objc_msgSend(v12, "contentsMultiplyColor");
        if (!v134
          || (v135 = __dst, v136 = RBColorFromCGColor(v134, 0), v135.n128_f32[0] != *(float *)&v136)
          || v135.n128_f32[1] != v137
          || v135.n128_f32[2] != v138
          || v135.n128_f32[3] != v139)
        {
          objc_msgSend(v12, "setContentsMultiplyColor:", RB::Symbol::ResolvedColor::operator CGColor *((uint64_t)&__dst));
        }
        if (v194[1])
          CFRelease(v194[1]);
        goto LABEL_8;
      }
    }
    if ((v153 & 4) != 0 && (RB::Symbol::Presentation::style_mask((RB::Symbol::Presentation *)v176) & 0x1000) == 0)
    {
      *(_OWORD *)v196 = 0u;
      v197 = 2;
      updated = RBSymbolUpdateGroupCount((uint64_t)v176);
      v145 = v4;
      v173 = v31;
      v174 = v32;
      v189 = RBColorWhite;
      v190 = 10;
      v191 = 0;
      if (updated)
      {
        v33 = 0;
        v34 = 0;
        cf = 0;
        colorName = (const __CFString *)*MEMORY[0x24BDBF330];
        for (i = updated; i != v34; v33 = v34 >= i)
        {
          v35 = RBSymbolUpdateGroupSize((uint64_t)v176, v34);
          if (v35)
          {
            v36 = v35;
            LODWORD(v140) = v33;
            v37 = v196[1];
            if ((void *)v197 < (char *)v196[1] + 1)
            {
              v37 = v196[1];
              v3 = v157;
            }
            v38 = 0;
            p_dst = (__n128 *)v196[0];
            if (!v196[0])
              p_dst = &__dst;
            v40 = &p_dst[26 * (_QWORD)v37];
            v40[24] = 0u;
            v40[25] = 0u;
            v40[22] = 0u;
            v40[23] = 0u;
            v40[20] = 0u;
            v40[21] = 0u;
            v40[18] = 0u;
            v40[19] = 0u;
            v40[16] = 0u;
            v40[17] = 0u;
            v40[14] = 0u;
            v40[15] = 0u;
            v40[12] = 0u;
            v40[13] = 0u;
            v40[10] = 0u;
            v40[11] = 0u;
            v40[8] = 0u;
            v40[9] = 0u;
            v40[6] = 0u;
            v40[7] = 0u;
            v40[4] = 0u;
            v40[5] = 0u;
            v40[2] = 0u;
            v40[3] = 0u;
            *v40 = 0u;
            v40[1] = 0u;
            v40[25].n128_u64[0] = 4;
            v41 = v196[1]++;
            v42 = (__n128 *)v196[0];
            if (!v196[0])
              v42 = &__dst;
            v43 = &v42[26 * (_QWORD)v41];
            do
            {
              v171[0] = v176;
              v171[1] = v34;
              v171[2] = v38;
              v44 = RBSymbolUpdateLayerDrawingOpacity(v171);
              v170[0] = v176;
              v170[1] = v34;
              v170[2] = v38;
              v45 = RBSymbolUpdateLayerErasingOpacity(v170);
              v46 = v45;
              if (v44 > 0.0 || v45 > 0.0)
              {
                v166[0] = v176;
                v166[1] = v34;
                v166[2] = v38;
                v48 = RBSymbolUpdateLayerPath(v166, &v167, (v153 >> 2) & 2);
                v49 = v47;
                if (v48 == 1 && v47 == 0x209BD98A8)
                {
                  v4 = v145;
                  v87 = cf;
                  v88 = (char)v140;
                  goto LABEL_151;
                }
                if (v46 > 0.0)
                {
                  v51 = cf;
                  if (cf
                    || (ConstantColor = CGColorGetConstantColor(colorName)) != 0
                    && (v51 = CFRetain(ConstantColor)) != 0)
                  {
                    cf = v51;
                    v52 = CFRetain(v51);
                  }
                  else
                  {
                    cf = 0;
                    v52 = 0;
                  }
                  v163 = v167;
                  v164 = v168;
                  v165 = v169;
                  v54.n128_f64[0] = RB::operator*(&v163, (float64x2_t *)&v172);
                  v154 = v54;
                  v146 = v56;
                  v149 = v55;
                  v57 = v43[24].n128_u64[1];
                  if (v43[25].n128_u64[0] < v57 + 1)
                  {
                    v57 = v43[24].n128_u64[1];
                  }
                  v58 = (__n128 *)v43[24].n128_u64[0];
                  if (!v58)
                    v58 = v43;
                  v59 = &v58[6 * v57];
                  v59->n128_u64[0] = v48;
                  v59->n128_u64[1] = v49;
                  v59[1].n128_u64[0] = (unint64_t)v52;
                  v59[2] = v154;
                  v59[3] = v149;
                  v59[4] = v146;
                  v59[5].n128_f32[0] = v46;
                  v59[5].n128_u8[4] = 1;
                  ++v43[24].n128_u64[1];
                }
                if (v44 > 0.0)
                {
                  v163 = v167;
                  v164 = v168;
                  v165 = v169;
                  v60.n128_f64[0] = RB::operator*(&v163, (float64x2_t *)&v172);
                  v155 = v60;
                  v147 = v62;
                  v150 = v61;
                  v63 = v43[24].n128_u64[1];
                  if (v43[25].n128_u64[0] < v63 + 1)
                  {
                    v63 = v43[24].n128_u64[1];
                  }
                  v64 = (__n128 *)v43[24].n128_u64[0];
                  if (!v64)
                    v64 = v43;
                  v65 = &v64[6 * v63];
                  v65->n128_u64[0] = v48;
                  v65->n128_u64[1] = v49;
                  v65[1].n128_u64[0] = 0;
                  v65[2] = v155;
                  v65[3] = v150;
                  v65[4] = v147;
                  v65[5].n128_f32[0] = v44;
                  v65[5].n128_u8[4] = 0;
                  v66 = (__n128 *)v43[24].n128_u64[0];
                  v67 = v43[24].n128_u64[1] + 1;
                  v43[24].n128_u64[1] = v67;
                  if (v66)
                    v68 = v66;
                  else
                    v68 = v43;
                  v69 = v67;
                  v162[0] = v176;
                  v162[1] = v34;
                  v162[2] = v38;
                  v70 = RBSymbolUpdateLayerColor(v162);
                  if (v73 == -32768.0)
                  {
                    v161[0] = v176;
                    v161[1] = v34;
                    v161[2] = v38;
                    v74 = RBSymbolUpdateLayerStyle(v161);
                    if ((_DWORD)v74 == 9)
                    {
                      v160[0] = v176;
                      v160[1] = v34;
                      v160[2] = v38;
                      v75 = RBSymbolUpdateLayerColorName(v160);
                      v159[0] = v176;
                      v159[1] = v34;
                      v159[2] = v38;
                      v76 = (CGColor *)RBSymbolUpdateLayerDefaultColor(v159);
                    }
                    else
                    {
                      v75 = 0;
                      v76 = 0;
                    }
                    if (RB::Symbol::ResolvedColor::begin_update((uint64_t)&v189, v74, v75, v76))
                    {
                      if ((_DWORD)v74 == 10)
                      {
                        v77 = 1.0;
                        v78 = 1.0;
                        v79 = 1.0;
                        v80 = 1.0;
                      }
                      else
                      {
                        -[CALayer resolveStyle:colorName:](v175[0], "resolveStyle:colorName:", v74, v75);
                      }
                      RB::Symbol::ResolvedColor::commit_update((uint64_t)&v189, v77, v78, v79, v80);
                    }
                  }
                  else
                  {
                    RB::Symbol::ResolvedColor::update((uint64_t)&v189, v70, v71, v72, v73);
                  }
                  v81 = RB::Symbol::ResolvedColor::operator CGColor *((uint64_t)&v189);
                  v82 = &v68[6 * v69 - 6];
                  v85 = (CGColorRef)v82[1].n128_u64[0];
                  v84 = v82 + 1;
                  v83 = v85;
                  v3 = v157;
                  if (v85 != v81)
                  {
                    if (v83)
                      CFRelease(v83);
                    if (v81)
                      v86 = CFRetain(v81);
                    else
                      v86 = 0;
                    v84->n128_u64[0] = (unint64_t)v86;
                    v3 = v157;
                  }
                }
              }
              ++v38;
            }
            while (v36 != v38);
          }
          ++v34;
        }
      }
      else
      {
        cf = 0;
      }
      v89 = v175[0];
      if (LOBYTE(v175[0][2]._attr.refcount) == 4)
      {
        v4 = v145;
      }
      else
      {
        v4 = v145;
        -[RBSymbolLayer clearContents]((uint64_t)v175[0]);
        v89 = v175[0];
        if (v175[0] && LOBYTE(v175[0][2]._attr.refcount) != 4)
          LOBYTE(v175[0][2]._attr.refcount) = 4;
      }
      v90 = -[CALayer sublayers](v89, "sublayers", v140);
      v91 = -[NSArray count](v90, "count");
      v92 = v91;
      v140 = v90;
      v148 = v196[1];
      if (v196[1])
      {
        v142 = v89;
        v93 = 0;
        v94 = 0;
        v158 = *MEMORY[0x24BDE5A48];
        colorNamea = (CFStringRef)v91;
        do
        {
          if (v196[0])
            v95 = (__n128 *)v196[0];
          else
            v95 = &__dst;
          v156 = v93;
          if (v93 >= v92
            || (v96 = -[NSArray objectAtIndexedSubscript:](v140, "objectAtIndexedSubscript:", v93), v156 = v93 + 1, !v96))
          {
            v96 = (id)objc_msgSend(MEMORY[0x24BDE56D0], "layer", v140);
            -[CALayer configureSublayer:type:](v175[0], "configureSublayer:type:", v96, 4);
            if (color_symbols())
            {
              if ((v97 & 1) == 0
              {
              }
            }
            objc_msgSend(v96, "setDelegate:", v175[0]);
            objc_msgSend(v96, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
            -[CALayer addSublayer:](v142, "addSublayer:", v96);
          }
          if (color_symbols())
          {
            objc_msgSend(v96, "setPosition:", rect2.origin.x, rect2.origin.y);
            objc_msgSend(v96, "setBounds:", rect2.origin.x, rect2.origin.y, rect2.size.width, rect2.size.height);
          }
          v98 = (void *)objc_msgSend(v96, "sublayers", v140);
          v99 = objc_msgSend(v98, "count");
          v151 = v94;
          v100 = &v95[26 * v94];
          v101 = v100[24].n128_u64[1];
          if (v101)
          {
            v102 = 0;
            v103 = 0;
            do
            {
              if (v100[24].n128_u64[0])
                v104 = (__n128 *)v100[24].n128_u64[0];
              else
                v104 = v100;
              if (v103 >= v99 || (v105 = (void *)objc_msgSend(v98, "objectAtIndexedSubscript:", v103), ++v103, !v105))
              {
                v105 = (void *)+[RBSymbolShapeLayer layer](RBSymbolShapeLayer, "layer");
                -[CALayer configureSublayer:type:](v175[0], "configureSublayer:type:", v96, 3);
                objc_msgSend(v105, "setDelegate:", v175[0]);
                objc_msgSend(v105, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
                objc_msgSend(v96, "addSublayer:", v105);
              }
              -[RBSymbolShapeLayer setRBPath:]((uint64_t *)v105, (const CGPath *)v104[v102].n128_u64[0], v104[v102].n128_i64[1]);
              objc_msgSend(v105, "setFillColor:", v104[v102 + 1].n128_u64[0]);
              v167 = (float64x2_t)v104[v102 + 2];
              v168 = v104[v102 + 3];
              v169 = v104[v102 + 4];
              objc_msgSend(v105, "setAffineTransform:", &v167);
              LODWORD(v106) = v104[v102 + 5].n128_u32[0];
              objc_msgSend(v105, "setOpacity:", v106);
              if (v104[v102 + 5].n128_u8[4])
                v107 = v158;
              else
                v107 = 0;
              objc_msgSend(v105, "setCompositingFilter:", v107);
              v102 += 6;
              --v101;
            }
            while (v101);
          }
          else
          {
            v103 = 0;
          }
          v92 = (unint64_t)colorNamea;
          v4 = v145;
          v3 = v157;
          v93 = v156;
          while (v103 < v99)
            objc_msgSend((id)objc_msgSend(v98, "objectAtIndexedSubscript:", --v99), "removeFromSuperlayer");
          ++v94;
        }
        while ((void *)(v151 + 1) != v148);
      }
      else
      {
        v93 = 0;
      }
      if (v93 >= v92)
      {
        v88 = 1;
        v87 = cf;
      }
      else
      {
        v87 = cf;
        v108 = v140;
        do
          objc_msgSend(-[NSArray objectAtIndexedSubscript:](v108, "objectAtIndexedSubscript:", --v92, v140), "removeFromSuperlayer");
        while (v93 < v92);
        v88 = 1;
      }
LABEL_151:
      if (v87)
        CFRelease(v87);
      if (v191)
        CFRelease(v191);
      v109 = v196[0];
      if (v196[0])
        v110 = (__n128 *)v196[0];
      else
        v110 = &__dst;
      if (v196[1])
      {
        v111 = 0;
        do
        {
          v112 = &v110[26 * (_QWORD)v111];
          v113 = (void *)v112[24].n128_u64[0];
          v114 = v112[24].n128_u64[1];
          if (v113)
            v115 = (__n128 *)v112[24].n128_u64[0];
          else
            v115 = &v110[26 * (_QWORD)v111];
          if (v114)
          {
            v116 = 0;
            v117 = (CFTypeRef *)&v115[1];
            do
            {
              if (*v117)
              {
                CFRelease(*v117);
                v114 = v112[24].n128_u64[1];
              }
              ++v116;
              v117 += 12;
            }
            while (v116 < v114);
            v113 = (void *)v112[24].n128_u64[0];
          }
          if (v113)
            free(v113);
          v111 = (char *)v111 + 1;
        }
        while (v111 < v196[1]);
        v109 = v196[0];
        v3 = v157;
      }
      if (v109)
        free(v109);
      if ((v88 & 1) != 0)
        goto LABEL_8;
    }
    if ((v153 & 1) != 0)
      v118 = 2;
    else
      v118 = 1;
    if (LOBYTE(v175[0][2]._attr.refcount) == v118
      && (v119 = -[NSArray objectAtIndexedSubscript:](-[CALayer sublayers](v175[0], "sublayers"), "objectAtIndexedSubscript:", 0), (v120 = v119) != 0))
    {
      -[CALayer position](v119, "position");
      if (v122 == rect2.origin.x && v121 == rect2.origin.y)
      {
        -[CALayer bounds](v120, "bounds");
        if (CGRectEqualToRect(v199, rect2))
        {
          -[CALayer contentsScale](v120, "contentsScale");
          if (v123 == v187)
          {
LABEL_199:
            v172.n128_u64[0] = MEMORY[0x24BDAC760];
            v172.n128_u64[1] = 3221225472;
            *(_QWORD *)&v173 = ___ZN12_GLOBAL__N_17Updater13update_mergedEv_block_invoke;
            *((_QWORD *)&v173 + 1) = &__block_descriptor_40_e28____ffff_20__0I8__NSString_12l;
            *(_QWORD *)&v174 = v175;
            if ((v153 & 1) != 0)
            {
              v128 = (void *)objc_opt_new();
              objc_msgSend(v128, "setProfile:", 4);
              v193 = v129;
              *(_OWORD *)v194 = v130;
              objc_msgSend(v128, "concat:", &__dst);
              State = (RB::DisplayList::State *)RBDisplayListGetState((uint64_t)v128);
              RB::Symbol::Presentation::draw((uint64_t)v176, State, (uint64_t)&v172);
              v132 = v175[0];
              v133 = objc_msgSend(v128, "moveContents");

              v132[1]._attr.layer = (void *)v133;
              -[CALayer setNeedsDisplay](v120, "setNeedsDisplay");

              v3 = v157;
            }
            else
            {
              __dst.n128_u64[0] = MEMORY[0x24BDAC760];
              __dst.n128_u64[1] = 3221225472;
              *(_QWORD *)&v193 = ___ZN12_GLOBAL__N_17Updater13update_mergedEv_block_invoke_2;
              *((_QWORD *)&v193 + 1) = &unk_24C22B210;
              v195 = v175;
              v194[0] = v120;
              v194[1] = &v172;
              -[CALayer displayWithBounds:callback:](v120, "displayWithBounds:callback:", &__dst, rect2.origin.x, rect2.origin.y, rect2.size.width, rect2.size.height);
              if (-[CALayer needsDisplay](v120, "needsDisplay"))
                -[CALayer setContents:](v120, "setContents:", -[CALayer contents](v120, "contents"));
            }
            goto LABEL_8;
          }
        }
      }
    }
    else
    {
      v120 = (CALayer *)objc_opt_new();
      if ((v153 & 1) != 0)
        v124 = 2;
      else
        v124 = 1;
      -[CALayer configureSublayer:type:](v175[0], "configureSublayer:type:", v120, v124, v140);
      if (color_symbols())
      {
        if ((v125 & 1) == 0
        {
          v3 = v157;
        }
        if ((v126 & 1) == 0
        {
          v3 = v157;
        }
        if ((v153 & 1) != 0)
        -[CALayer setBackgroundColor:](v120, "setBackgroundColor:", *v127);
      }
      -[CALayer setOpaque:](v120, "setOpaque:", 0);
      -[CALayer setAnchorPoint:](v120, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      -[CALayer setDelegate:](v120, "setDelegate:", v175[0]);
      __dst.n128_u64[0] = (unint64_t)v120;
      -[CALayer setSublayers:](v175[0], "setSublayers:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &__dst, 1));

      if (v175[0] && LOBYTE(v175[0][2]._attr.refcount) != v118)
        LOBYTE(v175[0][2]._attr.refcount) = v118;
    }
    -[CALayer setPosition:](v120, "setPosition:", rect2.origin.x, rect2.origin.y, v140);
    -[CALayer setBounds:](v120, "setBounds:", rect2.origin.x, rect2.origin.y, rect2.size.width, rect2.size.height);
    -[CALayer setContentsScale:](v120, "setContentsScale:", v187);
    goto LABEL_199;
  }
}

- (void)clearContents
{
  if (a1 && *(_BYTE *)(a1 + 72))
  {
    objc_msgSend((id)a1, "setSublayers:", 0);

    *(_QWORD *)(a1 + 48) = 0;
    if (*(_BYTE *)(a1 + 72))
      *(_BYTE *)(a1 + 72) = 0;
  }
}

- (void)drawingContents
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    *a2 = *(id *)(a1 + 48);
    os_unfair_lock_unlock(v4);
  }
  else
  {
    *a2 = 0;
  }
}

- (id)actionForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("sublayers")) & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)RBSymbolLayer;
  return -[RBSymbolLayer actionForKey:](&v6, sel_actionForKey_, a3);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)*MEMORY[0x24BDBD430];
}

- (void)display
{
  -[RBSymbolLayer layoutSublayers](self, "layoutSublayers");
  -[RBSymbolLayer setContents:](self, "setContents:", 0);
}

- (void)renderInContext:(CGContext *)a3
{
  uint64_t v4;
  RB::Symbol::Animator *v6;
  __int128 v7;
  __int128 v8;
  RB::DisplayList::State *v9;
  uint64_t v10;
  RB::DisplayList::State *v11;
  void *v12;
  RB::DisplayList::State *State;
  __n128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[3];
  _OWORD v18[3];
  unsigned int v19;
  float v20;
  _QWORD v21[5];
  RB::Symbol::Model *v22[2];
  _DWORD v23[546];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_QWORD *)self + 4);
  if (v4)
  {
    v6 = (RB::Symbol::Animator *)-[RBAnimation rb_animation](v4);
    if (v23[212])
    {
      v15 = v7;
      v16 = v8;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __33__RBSymbolLayer_renderInContext___block_invoke;
      v21[3] = &unk_24C22B1C8;
      v21[4] = self;
      v19 = 0;
      v20 = 1.0;
      v9 = (RB::DisplayList::State *)RBDrawingStateFromCGContext(a3, &v20, &v19);
      v10 = (uint64_t)v9;
      if (v9)
      {
        v11 = RBDrawingStateBeginLayer(v9, 0);
        v18[0] = v14;
        v18[1] = v15;
        v18[2] = v16;
        RBDrawingStateConcatCTM((uint64_t)v11, (uint64_t)v18);
        RB::Symbol::Presentation::draw((uint64_t)v23, v11, (uint64_t)v21);
        RBDrawingStateDrawLayer(v10, v11, v19, v20);
      }
      else
      {
        v12 = (void *)objc_opt_new();
        objc_msgSend(v12, "setProfile:", 3);
        v17[0] = v14;
        v17[1] = v15;
        v17[2] = v16;
        objc_msgSend(v12, "concat:", v17);
        State = (RB::DisplayList::State *)RBDisplayListGetState((uint64_t)v12);
        RB::Symbol::Presentation::draw((uint64_t)v23, State, (uint64_t)v21);
        objc_msgSend(v12, "renderInContext:options:", a3, 0);

      }
    }
    RB::Symbol::Presentation::~Presentation((RB::Symbol::Presentation *)v23);
  }
}

uint64_t __33__RBSymbolLayer_renderInContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolveStyle:colorName:", a2, a3);
}

- (void)configureSublayer:(id)a3 type:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v7 = -[RBSymbolLayer delegate](self, "delegate");
  if (v7)
  {
    v8 = (void *)v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "rbSymbolLayer:configureSublayer:type:", self, a3, v4);
  }
}

- (id)RBLayerDefaultDevice:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = -[RBSymbolLayer delegate](self, "delegate");
  if (v4 && (v5 = (void *)v4, (objc_opt_respondsToSelector() & 1) != 0))
    return (id)objc_msgSend(v5, "RBLayerDefaultDevice:", a3);
  else
    return 0;
}

- ($4C453035CF9D444C7FDAB91FAAAE42FC)symbolTransform
{
  double v2;
  double v3;
  double v4;
  double v5;
  $4C453035CF9D444C7FDAB91FAAAE42FC result;

  v2 = *((double *)self + 10);
  v3 = *((double *)self + 11);
  v4 = *((double *)self + 12);
  v5 = *((double *)self + 13);
  result.var1.dy = v5;
  result.var1.dx = v4;
  result.var0.dy = v3;
  result.var0.dx = v2;
  return result;
}

- (unsigned)drawingOptions
{
  return *((_DWORD *)self + 19);
}

- (void)setDrawingOptions:(unsigned int)a3
{
  *((_DWORD *)self + 19) = a3;
}

- (void).cxx_destruct
{

}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_DWORD *)self + 16) = 0;
  *((_DWORD *)self + 17) = 0;
  return self;
}

@end
