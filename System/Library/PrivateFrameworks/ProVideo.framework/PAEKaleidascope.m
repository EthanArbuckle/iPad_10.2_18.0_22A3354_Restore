@implementation PAEKaleidascope

- (PAEKaleidascope)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEKaleidascope;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAEKaleidascope;
  -[PAESharedDefaultBase addParameters](&v7, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v4, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Kaleidascope::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Kaleidascope::Segment Angle"), 0, 0), 2, 0, 22.5, 0.0, 6.28318531);
    objc_msgSend(v4, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Kaleidascope::Offset Angle"), 0, 0), 3, 0, 0.785398163, 0.0, 6.28318531);
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Kaleidascope::Allow Partial"), 0, 0), 4, 0, 33);
  }
  return 1;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  int v9;
  __int128 v10;
  _OWORD v12[3];

  v9 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  if (v9)
  {
    v10 = *(_OWORD *)&a5->var2;
    v12[0] = *(_OWORD *)&a5->var0.var0;
    v12[1] = v10;
    v12[2] = *(_OWORD *)&a5->var4;
    LOBYTE(v9) = -[PAEKaleidascope canThrowRenderOutputHe:withInput:withInfo:](self, "canThrowRenderOutputHe:withInput:withInfo:", a3, a4, v12);
  }
  return v9;
}

- (BOOL)canThrowRenderOutputHe:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  float v20;
  int v21;
  int v22;
  float v23;
  HGGLNode *v24;
  float v25;
  float v26;
  int32x2_t v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  double v33;
  float v34;
  float v35;
  double v36;
  double v37;
  double v38;
  double v39;
  unint64_t v40;
  int32x2_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  int8x8_t v49;
  int8x8_t v50;
  int8x16_t v51;
  int8x8_t v52;
  int32x4_t v53;
  int8x16_t v54;
  uint64_t v55;
  float32x2_t v56;
  float32x2_t v57;
  uint64_t v58;
  float32x2_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  float v63;
  float v64;
  float v65;
  __float2 v66;
  __float2 v67;
  __float2 v68;
  __float2 v69;
  __n128 v70;
  __n128 v71;
  __n128 v72;
  float v73;
  float v74;
  float v75;
  __n128 v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  __float2 v82;
  __float2 v83;
  unsigned __int32 v84;
  double v85;
  float v86;
  unsigned __int32 v87;
  double v88;
  int v89;
  float v90;
  float v91;
  float v92;
  float v93;
  BOOL v94;
  float v95;
  float v96;
  __float2 v97;
  __float2 v98;
  __float2 v99;
  __n128 v100;
  __n128 v101;
  __n128 v102;
  float v103;
  float v104;
  __n128 v105;
  float v106;
  float v107;
  __n128 v108;
  __n128 v109;
  float v110;
  float v111;
  __n128 v112;
  uint64_t v113;
  float v115;
  float v116;
  float v117;
  float v118;
  unsigned __int32 v119;
  float v120;
  float v121;
  double v122;
  unsigned __int32 v123;
  double v124;
  float v125;
  float v126;
  float v127;
  double v128;
  unsigned __int32 v129;
  float v130;
  float v131;
  double v132;
  double v133;
  float v134;
  float v135;
  float v136;
  double v137;
  double v138;
  uint64_t v139;
  double v140[5];
  double v141;
  char v142;
  double v143;
  double v144;
  double v145;
  double v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  uint64_t v151;
  _QWORD v152[4];
  _OWORD v153[2];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = (void *)v9;
    v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
    if (v9)
    {
      v11 = (void *)v9;
      v151 = 0;
      v149 = 0u;
      v150 = 0u;
      v147 = 0u;
      v148 = 0u;
      if (a4)
        objc_msgSend(a4, "imageInfo");
      v12 = objc_msgSend(a4, "width");
      v13 = objc_msgSend(a4, "height");
      var1 = a5->var0.var1;
      v145 = 0.0;
      v146 = 0.0;
      -[PAESharedDefaultBase getPoint:fromParm:atTime:withImage:](self, "getPoint:fromParm:atTime:withImage:", &v145, 1, var1, a3);
      v16 = v145;
      v15 = v146;
      if (objc_msgSend(v11, "versionAtCreation"))
        v17 = 1.0 - v15;
      else
        v17 = v15;
      v144 = 0.0;
      objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v144, 2, var1);
      v143 = 0.0;
      objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v143, 3, var1);
      v142 = 0;
      objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v142, 4, var1);
      v18 = objc_msgSend(a4, "width");
      v19 = objc_msgSend(a4, "height");
      if (v144 <= 0.0628318531)
        v20 = 100.0;
      else
        v20 = 3.14159265 / v144;
      v21 = vcvtps_s32_f32(v20);
      if (v21 <= 1)
        v22 = 1;
      else
        v22 = v21;
      if (v142)
        v23 = v20;
      else
        v23 = (float)v22;
      if (v23 >= 0.501)
      {
        v24 = (HGGLNode *)HGObject::operator new(0x1B0uLL);
        HGGLNode::HGGLNode(v24, 0);
        HGGLNode::hglClearToBlack(v24);
        HGGLNode::hglMatrixMode(v24, 5890);
        v25 = (float)v12 * -0.5;
        v26 = (float)v13 * -0.5;
        HGGLNode::hglTranslatef(v24, v25, v26, 0.0);
        -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
        *(float *)v27.i32 = v143;
        v28 = v16 * (double)v18;
        v29 = v17 * (double)v19;
        v30 = v16 * (float)v12;
        v31 = v17 * (float)v13;
        v134 = v31 - (float)((float)v13 * 0.5);
        v135 = v30 - (float)((float)v12 * 0.5);
        v32 = v28 - (v25 + (float)((float)v12 * 0.5)) * 0.5;
        v120 = v32;
        v33 = v29 - ((float)((float)v13 * 0.5) + v26) * 0.5;
        *(float *)&v33 = v33;
        v117 = *(float *)&v33;
        v34 = (float)((float)v12 * 0.5) - v25;
        v35 = (float)((float)v13 * 0.5) - v26;
        v36 = v34;
        v137 = v141;
        v138 = v140[0];
        v39 = v34 / v140[0];
        *(float *)&v39 = v39;
        v37 = v35;
        v38 = v35 / v141;
        *(float *)&v38 = v38;
        *(float *)&v39 = sqrtf((float)(*(float *)&v39 * *(float *)&v39) + (float)(*(float *)&v38 * *(float *)&v38));
        v136 = *(float *)&v39 + *(float *)&v39;
        if (v23 >= 2.0)
        {
          v115 = 6.2832 / (float)(v23 + v23);
          v80 = v115 + *(float *)v27.i32;
          v116 = v143;
          v81 = v143;
          v82 = __sincosf_stret(v81);
          v83 = __sincosf_stret(v80);
          HGGLNode::hglBegin((const char **)v24, 4);
          *(float *)&v129 = v120 / v34;
          *(float *)&v84 = (v140[0] * (float)(v82.__cosval * v136) + v120) / v36;
          v85 = v140[0] * (float)(v83.__cosval * v136) + v120;
          v86 = (v117 - v141 * (float)(v82.__sinval * v136)) / v37;
          v121 = v86;
          v123 = v84;
          *(float *)&v87 = v85 / v36;
          *(float *)&v85 = (v117 - v141 * (float)(v83.__sinval * v136)) / v37;
          v118 = *(float *)&v85;
          v119 = v87;
          v133 = v135;
          v88 = v134;
          v89 = 1;
          v125 = v117 / v35;
          v90 = v116;
          do
          {
            v91 = v115 * (float)(v89 - 1);
            v92 = v115 * (float)v89;
            v93 = v115 * (float)(v89 + 1);
            if (v93 <= 6.2832)
            {
              v94 = v22 == 1;
            }
            else
            {
              v92 = (float)(v91 + 6.2832) * 0.5;
              v94 = 1;
            }
            if (v94)
              v93 = 0.0;
            v95 = v92 + v90;
            v96 = v93 + v90;
            v97 = __sincosf_stret(v91 + v90);
            v98 = __sincosf_stret(v95);
            v99 = __sincosf_stret(v96);
            v100.n128_u32[0] = 1.0;
            v101.n128_f64[0] = HGGLNode::hglColor4f(v24, v100, 1.0, 1.0, 1.0);
            v101.n128_u32[0] = v129;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v101, v125);
            HGGLNode::hglVertex3f((float32x4_t **)v24, v135, v134, 0.0);
            v102.n128_u32[0] = v123;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v102, v121);
            v103 = v140[0] * (float)(v136 * v97.__cosval) + v133;
            v104 = v141 * (float)(v136 * v97.__sinval) + v88;
            HGGLNode::hglVertex3f((float32x4_t **)v24, v103, v104, 0.0);
            v105.n128_u32[0] = v119;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v105, v118);
            v106 = v140[0] * (float)(v136 * v98.__cosval) + v133;
            v107 = v141 * (float)(v136 * v98.__sinval) + v88;
            HGGLNode::hglVertex3f((float32x4_t **)v24, v106, v107, 0.0);
            v108.n128_u32[0] = v129;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v108, v125);
            HGGLNode::hglVertex3f((float32x4_t **)v24, v135, v134, 0.0);
            v109.n128_u32[0] = v123;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v109, v121);
            v110 = v140[0] * (float)(v136 * v99.__cosval) + v133;
            v111 = v141 * (float)(v136 * v99.__sinval) + v88;
            HGGLNode::hglVertex3f((float32x4_t **)v24, v110, v111, 0.0);
            v112.n128_u32[0] = v119;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v112, v118);
            HGGLNode::hglVertex3f((float32x4_t **)v24, v106, v107, 0.0);
            v89 += 2;
            --v22;
            v90 = v116;
          }
          while (v22);
        }
        else
        {
          v40 = 0;
          *(float *)&v39 = 6.2832 / v23;
          *(float *)&v38 = (float)(6.2832 / v23) * 0.5;
          if (v23 <= 1.0)
            *(float *)&v33 = (float)(6.2832 / v23) * 0.5;
          else
            *(float *)&v33 = 6.2832 / v23;
          v41.i32[1] = 1065353216;
          v42 = vmulq_n_f32((float32x4_t)xmmword_1B304FD40, *(float *)&v33 * 0.25);
          v43 = vmulq_n_f32((float32x4_t)xmmword_1B304FD40, (float)(6.2832 - *(float *)&v33) * 0.25);
          v44 = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v33, 0), v43);
          v43.f32[0] = 6.2832 - *(float *)&v38;
          v45 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v38, 0);
          v46 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 0);
          *(float *)v41.i32 = 6.2832 - *(float *)&v39;
          v47 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v39, 0);
          v48 = (float32x4_t)vdupq_lane_s32(v41, 0);
          v153[0] = v42;
          v153[1] = v44;
          v49 = (int8x8_t)vdup_n_s16(v23 > 1.0);
          v50 = vmvn_s8(v49);
          do
          {
            v51 = (int8x16_t)v153[v40 / 2];
            v52 = (int8x8_t)vmovn_s32(vcgtq_f32(v45, (float32x4_t)v51));
            v53 = vcgtq_f32(v47, (float32x4_t)v51);
            v54 = (int8x16_t)vmulq_n_f32(vdivq_f32(vsubq_f32((float32x4_t)v51, v47), v48), *(float *)&v39);
            *(int8x16_t *)&v152[v40] = vbslq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vand_s8(vorr_s8(v50, vand_s8(v49, (int8x8_t)vmovn_s32(v53))), v52)), 0x1FuLL)), v51, vbslq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vorr_s8(v49, v52)), 0x1FuLL)), vbslq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32(
                                                            (int32x4_t)vmovl_u16((uint16x4_t)vand_s8(v49, (int8x8_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)v53)))), 0x1FuLL)), vbslq_s8((int8x16_t)vcgtq_f32(v45, (float32x4_t)v54), v54, (int8x16_t)vsubq_f32(v47, (float32x4_t)v54)), (int8x16_t)vsubq_f32(v47, (float32x4_t)v51)), (int8x16_t)vsubq_f32(v47, vaddq_f32(v45, vmulq_n_f32(vdivq_f32(vsubq_f32((float32x4_t)v51, v45), v46), *(float *)&v38)))));
            v40 += 2;
          }
          while (v40 != 4);
          v55 = 0;
          v56 = (float32x2_t)vdup_lane_s32(v27, 0);
          do
          {
            v57 = vadd_f32(*(float32x2_t *)((char *)v153 + v55 * 8), v56);
            v126 = v57.f32[0];
            v130 = fmodf(v57.f32[1], 6.2832);
            *(float *)&v58 = fmodf(v126, 6.2832);
            *((float *)&v58 + 1) = v130;
            *(_QWORD *)((char *)v153 + v55 * 8) = v58;
            v59 = vadd_f32((float32x2_t)v152[v55], v56);
            v127 = v59.f32[0];
            v131 = fmodf(v59.f32[1], 6.2832);
            *(float *)&v60 = fmodf(v127, 6.2832);
            *((float *)&v60 + 1) = v131;
            v152[v55++] = v60;
          }
          while (v55 != 4);
          HGGLNode::hglBegin((const char **)v24, 4);
          v61 = 0;
          v122 = v134;
          v124 = v135;
          v132 = v120;
          v128 = v117;
          while (v61 != 8)
          {
            v62 = ((_BYTE)v61 + 1) & 7;
            v63 = *((float *)v153 + v62);
            v64 = *((float *)v152 + v61);
            v65 = *((float *)v152 + v62);
            v66 = __sincosf_stret(*((float *)v153 + v61));
            v67 = __sincosf_stret(v63);
            v68 = __sincosf_stret(v64);
            v69 = __sincosf_stret(v65);
            v70.n128_u32[0] = 1.0;
            v71.n128_f64[0] = HGGLNode::hglColor4f(v24, v70, 1.0, 1.0, 1.0);
            v71.n128_f32[0] = v120;
            HGGLNode::hglTexCoord2f((__n128 **)v24, v71, v117);
            HGGLNode::hglVertex3f((float32x4_t **)v24, v135, v134, 0.0);
            v72.n128_f64[0] = v138 * (float)(v136 * v68.__cosval) + v132;
            v72.n128_f32[0] = v72.n128_f64[0];
            v73 = v128 - v137 * (float)(v136 * v68.__sinval);
            HGGLNode::hglTexCoord2f((__n128 **)v24, v72, v73);
            v74 = v138 * (float)(v136 * v66.__cosval) + v124;
            v75 = v137 * (float)(v136 * v66.__sinval) + v122;
            HGGLNode::hglVertex3f((float32x4_t **)v24, v74, v75, 0.0);
            v76.n128_f64[0] = v138 * (float)(v136 * v69.__cosval) + v132;
            v76.n128_f32[0] = v76.n128_f64[0];
            v77 = v128 - v137 * (float)(v136 * v69.__sinval);
            HGGLNode::hglTexCoord2f((__n128 **)v24, v76, v77);
            v78 = v138 * (float)(v136 * v67.__cosval) + v124;
            v79 = v137 * (float)(v136 * v67.__sinval) + v122;
            ++v61;
            HGGLNode::hglVertex3f((float32x4_t **)v24, v78, v79, 0.0);
          }
        }
        HGGLNode::hglEnd((HGRasterizer **)v24);
        if (a4)
        {
          objc_msgSend(a4, "heliumRef");
          v139 = *(_QWORD *)&v153[0];
          if (*(_QWORD *)&v153[0])
            (*(void (**)(_QWORD))(**(_QWORD **)&v153[0] + 16))(*(_QWORD *)&v153[0]);
        }
        else
        {
          *(_QWORD *)&v153[0] = 0;
          v139 = 0;
        }
        -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v139, a4, a4);
        v113 = v152[0];
        if (*(_QWORD *)&v153[0] == v152[0])
        {
          if (*(_QWORD *)&v153[0])
            (*(void (**)(void))(**(_QWORD **)&v153[0] + 24))();
        }
        else
        {
          if (*(_QWORD *)&v153[0])
          {
            (*(void (**)(void))(**(_QWORD **)&v153[0] + 24))();
            v113 = v152[0];
          }
          *(_QWORD *)&v153[0] = v113;
          v152[0] = 0;
        }
        if (v139)
          (*(void (**)(uint64_t))(*(_QWORD *)v139 + 24))(v139);
        (*(void (**)(HGGLNode *, _QWORD, _QWORD))(*(_QWORD *)v24 + 120))(v24, 0, *(_QWORD *)&v153[0]);
        (*(void (**)(HGGLNode *, _QWORD, uint64_t))(*(_QWORD *)v24 + 136))(v24, 0, 2);
        v152[0] = v24;
        (*(void (**)(HGGLNode *))(*(_QWORD *)v24 + 16))(v24);
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", v152, a4, a3);
        objc_msgSend(a3, "setHeliumRef:", v152);
        if (v152[0])
          (*(void (**)(_QWORD))(*(_QWORD *)v152[0] + 24))(v152[0]);
        if (*(_QWORD *)&v153[0])
          (*(void (**)(_QWORD))(**(_QWORD **)&v153[0] + 24))(*(_QWORD *)&v153[0]);
        (*(void (**)(HGGLNode *))(*(_QWORD *)v24 + 24))(v24);
      }
      else
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v140[0] = 0.0;
        objc_msgSend(a3, "setHeliumRef:", v140);
        if (v140[0] != 0.0)
          (*(void (**)(double))(**(_QWORD **)&v140[0] + 24))(COERCE_DOUBLE(*(_QWORD *)&v140[0]));
      }
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  *a5 = 0;
  *a6 = 0;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

@end
