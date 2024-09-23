@implementation PVSaturationZebraEffect

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = CFSTR("effect.video.filter");
  v13[0] = CFSTR("FFEffectProperty_DisplayName");
  v13[1] = CFSTR("FFEffectProperty_Category");
  v14[0] = v6;
  v14[1] = CFSTR("Helium");
  v13[2] = CFSTR("FFEffectProperty_EffectType");
  v14[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVEffect registerEffectClass:forEffectID:withProperties:](PVEffect, "registerEffectClass:forEffectID:withProperties:", objc_opt_class(), v5, v8);
  v11[0] = CFSTR("displayName");
  v11[1] = CFSTR("contentGroup");
  v12[0] = v6;
  v12[1] = CFSTR("BuiltIn");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVContentRegistry sharedInstance](PVContentRegistry, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerContentClass:forID:type:withProperties:", objc_opt_class(), v5, v7, v9);

}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HgcZebraStripe **v6;
  HgcZebraStripe **v9;
  void *v10;
  int v11;
  HgcOverexposureCheck *v12;
  __n128 v13;
  __n128 v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int32 *v19;
  unsigned __int32 *v20;
  float *v21;
  HgcZebraStripe *v22;
  void *v23;
  void *v24;
  __n128 v25;
  CGColorSpace *v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __n128 v30;
  void *v31;
  void *v32;
  float v33;
  float v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  void *v40;
  float v41;
  float v42;
  float v43;
  HGNode *v44;
  __int128 v45;
  unint64_t v46;
  __n128 v47;
  uint64_t v48;
  unint64_t v49;
  unsigned __int32 v50;
  unint64_t v51;
  unsigned int v52;
  HGNode *v53;

  v9 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v53);
  PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isRec2020LinearColorSpace");

  v12 = (HgcOverexposureCheck *)HGObject::operator new(0x1A0uLL);
  HgcOverexposureCheck::HgcOverexposureCheck(v12);
  (*(void (**)(HgcOverexposureCheck *, _QWORD, HGNode *))(*(_QWORD *)v12 + 120))(v12, 0, v53);
  if ((v15 & 1) == 0
  {
    -[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::chromaticitiesSDR = kPCChromaticities_ITU_R709_2;
    *(_OWORD *)algn_1EF0748B0 = *(_OWORD *)&qword_1B3058B18;
  }
  if ((v16 & 1) == 0
  {
    -[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::chromaticitiesHDR = kPCChromaticities_ITU_R2020;
    unk_1EF0748D8 = *(_OWORD *)&dword_1B3058B98;
  }
  if ((v17 & 1) == 0
  {
    PCGetLuminanceCoefficients((float *)&-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::chromaticitiesSDR, -[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsSDR);
  }
  if ((v18 & 1) == 0
  {
    PCGetLuminanceCoefficients((float *)&-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::chromaticitiesHDR, -[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsHDR);
  }
  if (v11)
    v19 = (unsigned __int32 *)-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsHDR;
  else
    v19 = (unsigned __int32 *)-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsSDR;
  v13.n128_u32[0] = *v19;
  v20 = (unsigned __int32 *)&-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsHDR[1];
  if (!v11)
    v20 = (unsigned __int32 *)&-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsSDR[1];
  v21 = &-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsHDR[2];
  if (!v11)
    v21 = &-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsSDR[2];
  v14.n128_u32[0] = *v20;
  (*(void (**)(HgcOverexposureCheck *, _QWORD, __n128, __n128, float, float))(*(_QWORD *)v12 + 96))(v12, 0, v13, v14, *v21, 0.0);
  v22 = (HgcZebraStripe *)HGObject::operator new(0x1A0uLL);
  HgcZebraStripe::HgcZebraStripe(v22);
  (*(void (**)(HgcZebraStripe *, _QWORD, HGNode *))(*(_QWORD *)v22 + 120))(v22, 0, v53);
  (*(void (**)(HgcZebraStripe *, uint64_t, HgcOverexposureCheck *))(*(_QWORD *)v22 + 120))(v22, 1, v12);
  -[NSLock lock](self->super.super._inspectablePropertiesLock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("SaturationZebraColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23)
  {
    v47 = (__n128)xmmword_1B304FAB0;
    if (!v11)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(v23, "SIMDFloat4Value");
  v47 = v25;
  if (v11)
  {
LABEL_16:
    v26 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "cgColorSpace");

    v49 = v47.n128_u64[0];
    v50 = v47.n128_u32[2];
    v48 = 2;
    PCColorUtil::transform((PCToneMapMethod *)&v48, (uint64_t *)&v49, (uint64_t)v26, 0, v28, 1, (uint64_t)&v51);
    v46 = v51;
    *(_QWORD *)&v29 = __PAIR64__(HIDWORD(v51), v52);
    v45 = v29;
    CGColorSpaceRelease(v26);
    v30.n128_u64[0] = v46;
    v30.n128_u64[1] = __PAIR64__(v47.n128_u32[3], v45);
    v47 = v30;
  }
LABEL_17:
  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("SaturationZebraLineWidth"), v45);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    objc_msgSend(v31, "floatValue");
    v34 = v33;
  }
  else
  {
    v34 = 3.0;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("SaturationZebraThresholdOffset"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    objc_msgSend(v35, "floatValue");
    v38 = v37;
  }
  else
  {
    v38 = 0.05;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("SaturationZebraSpacing"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  v41 = v34;
  if (v39)
  {
    objc_msgSend(v39, "floatValue");
    v41 = v42;
  }
  -[NSLock unlock](self->super.super._inspectablePropertiesLock, "unlock");
  v43 = 1.0;
  if (v11)
    v43 = 12.0;
  (*(void (**)(HgcZebraStripe *, uint64_t, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 1, v43 - v38, 0.0, 0.0, 0.0);
  (*(void (**)(HgcZebraStripe *, uint64_t, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 2, v34, 0.0, 0.0, 0.0);
  (*(void (**)(HgcZebraStripe *, uint64_t, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 3, v41, 0.0, 0.0, 0.0);
  (*(void (**)(HgcZebraStripe *, _QWORD, __n128, float, float, float))(*(_QWORD *)v22 + 96))(v22, 0, v47, v47.n128_f32[1], v47.n128_f32[2], v47.n128_f32[3]);
  *v9 = v22;

  (*(void (**)(HgcOverexposureCheck *))(*(_QWORD *)v12 + 24))(v12);
  v44 = v53;
  if (v53)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(_QWORD *)v53 + 24))(v53);
  return (HGRef<HGNode>)v44;
}

@end
