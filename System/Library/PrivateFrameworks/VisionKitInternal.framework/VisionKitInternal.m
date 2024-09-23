_VKStickerEffectViewInternal *VKInternalStickerEffectViewWithDevice(void *a1)
{
  id v1;
  _VKStickerEffectViewInternal *v2;

  v1 = a1;
  v2 = -[_VKStickerEffectViewInternal initWithDevice:]([_VKStickerEffectViewInternal alloc], "initWithDevice:", v1);

  return v2;
}

uint64_t VKStickerEffectViewExtraScaleToIncludeStroke(uint64_t a1)
{
  return +[_VKStickerEffectViewInternal extraScaleToIncludeStrokeWithEffectType:bounds:](_VKStickerEffectViewInternal, "extraScaleToIncludeStrokeWithEffectType:bounds:", a1);
}

uint64_t vk_isCameraApp()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.camera"));

  return v2;
}

uint64_t vk_isPhotosApp()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

  return v2;
}

uint64_t sub_249D6FBE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_249D6FBF0()
{
  uint64_t v0;

  sub_249D71404(v0 + 16);
  return swift_deallocClassInstance();
}

id sub_249D6FC14()
{
  id v0;
  double v1;
  double v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5760]), sel_init);
  objc_msgSend(v0, sel_setStiffness_, 39.4784176);
  objc_msgSend(v0, sel_stiffness);
  v2 = sqrt(v1);
  objc_msgSend(v0, sel_setDamping_, v2 + v2);
  v3 = v0;
  v4 = (void *)sub_249D8B924();
  objc_msgSend(v3, sel_setFromValue_, v4);

  v5 = v3;
  v6 = (void *)sub_249D8B924();
  objc_msgSend(v5, sel_setToValue_, v6);

  v7 = v5;
  objc_msgSend(v7, sel_settlingDuration);
  objc_msgSend(v7, sel_setDuration_);

  return v7;
}

uint64_t sub_249D6FD10(_QWORD *a1, uint64_t a2)
{
  return sub_249D6FD28(a1, a2) & 1;
}

uint64_t sub_249D6FD28(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = MEMORY[0x24BD03EB0](*a1 + 16);
  if (result)
  {
    v4 = result;
    swift_unknownObjectRelease();
    return v4 == a2;
  }
  return result;
}

uint64_t sub_249D6FD74()
{
  uint64_t result;

  type metadata accessor for StickerEffectMotionManager();
  swift_allocObject();
  result = sub_249D6FDAC();
  qword_2578D4680 = result;
  return result;
}

uint64_t sub_249D6FDAC()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  id v4;

  *(_BYTE *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_BYTE *)(v0 + 48) = 1;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 0;
  *(_BYTE *)(v0 + 80) = 1;
  *(_QWORD *)(v0 + 88) = 0;
  *(_BYTE *)(v0 + 96) = 1;
  *(_QWORD *)(v0 + 104) = sub_249D6FC14();
  *(_QWORD *)(v0 + 112) = 0x3FF0000000000000;
  *(_QWORD *)(v0 + 120) = 0;
  *(_BYTE *)(v0 + 128) = 1;
  *(_QWORD *)(v0 + 136) = MEMORY[0x24BEE4AF8];
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC1400]), sel_init);
  *(_QWORD *)(v0 + 16) = v1;
  if (v1)
    objc_msgSend(v1, sel_setDeviceMotionUpdateInterval_, 0.0166666667);
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_defaultCenter);
  objc_msgSend(v3, sel_addObserver_selector_name_object_, v0, sel_backgroundFrom_, *MEMORY[0x24BEBDF98], 0);

  v4 = objc_msgSend(v2, sel_defaultCenter);
  objc_msgSend(v4, sel_addObserver_selector_name_object_, v0, sel_foregroundFrom_, *MEMORY[0x24BEBE008], 0);

  return v0;
}

void sub_249D6FEE4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int isUniquelyReferenced_nonNull_bridgeObject;
  unint64_t v24;
  int v25;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[6];

  v1 = v0;
  v2 = (unint64_t *)(v0 + 136);
  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 136);
  if (v3 >> 62)
    goto LABEL_76;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v4)
  {
    v5 = 0;
    while (1)
    {
      if ((v3 & 0xC000000000000001) != 0)
      {
        v6 = MEMORY[0x24BD038A4](v5, v3);
      }
      else
      {
        v6 = *(_QWORD *)(v3 + 8 * v5 + 32);
        swift_retain();
      }
      v7 = MEMORY[0x24BD03EB0](v6 + 16);
      swift_release();
      swift_unknownObjectRelease();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
          __break(1u);
        }
        else if (!(*v2 >> 62))
        {
          if (v15 == *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_12;
          goto LABEL_20;
        }
        swift_bridgeObjectRetain();
        v32 = sub_249D8BA08();
        swift_bridgeObjectRelease();
        if (v15 == v32)
          goto LABEL_12;
LABEL_20:
        v16 = v5 + 5;
        while (2)
        {
          v3 = v16 - 4;
          v17 = *v2;
          if ((*v2 & 0xC000000000000001) != 0)
          {
            v18 = MEMORY[0x24BD038A4](v16 - 4);
          }
          else
          {
            if ((v3 & 0x8000000000000000) != 0)
              goto LABEL_66;
            if (v3 >= *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_67;
            v18 = *(_QWORD *)(v17 + 8 * v16);
            swift_retain();
          }
          v19 = MEMORY[0x24BD03EB0](v18 + 16);
          swift_release();
          swift_unknownObjectRelease();
          if (!v19)
            goto LABEL_46;
          if (v3 == v5)
            goto LABEL_45;
          v20 = *v2;
          if ((*v2 & 0xC000000000000001) != 0)
          {
            v21 = MEMORY[0x24BD038A4](v5, *v2);
            v20 = *v2;
            if ((*v2 & 0xC000000000000001) == 0)
              goto LABEL_31;
          }
          else
          {
            if (v5 < 0)
              goto LABEL_70;
            if ((unint64_t)v5 >= *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_71;
            v21 = *(_QWORD *)(v20 + 8 * v5 + 32);
            swift_retain();
            if ((v20 & 0xC000000000000001) == 0)
            {
LABEL_31:
              if ((v3 & 0x8000000000000000) != 0)
                goto LABEL_72;
              if (v3 >= *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
                goto LABEL_73;
              v22 = *(_QWORD *)(v20 + 8 * v16);
              swift_retain();
LABEL_34:
              isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
              *v2 = v20;
              if (!isUniquelyReferenced_nonNull_bridgeObject
                || (v20 & 0x8000000000000000) != 0
                || (v20 & 0x4000000000000000) != 0)
              {
                sub_249D718A4(v20);
              }
              *(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20) = v22;
              swift_release();
              sub_249D8B900();
              v24 = *v2;
              v25 = swift_isUniquelyReferenced_nonNull_bridgeObject();
              *v2 = v24;
              if (!v25 || (v24 & 0x8000000000000000) != 0 || (v24 & 0x4000000000000000) != 0)
                sub_249D718A4(v24);
              if ((v3 & 0x8000000000000000) != 0)
                goto LABEL_74;
              if (v3 >= *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
                goto LABEL_75;
              *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 8 * v16) = v21;
              swift_release();
              sub_249D8B900();
LABEL_45:
              if (__OFADD__(v5++, 1))
                goto LABEL_69;
LABEL_46:
              v27 = v16 - 3;
              if (__OFADD__(v3, 1))
                goto LABEL_68;
              if (*v2 >> 62)
              {
                swift_bridgeObjectRetain();
                v28 = sub_249D8BA08();
                swift_bridgeObjectRelease();
              }
              else
              {
                v28 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10);
              }
              ++v16;
              if (v27 == v28)
                goto LABEL_12;
              continue;
            }
          }
          break;
        }
        v22 = MEMORY[0x24BD038A4](v16 - 4, v20);
        v20 = *v2;
        goto LABEL_34;
      }
      v8 = v5 + 1;
      if (__OFADD__(v5, 1))
        break;
      ++v5;
      if (v8 == v4)
        goto LABEL_10;
    }
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    swift_bridgeObjectRetain();
    v4 = sub_249D8BA08();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  if (*v2 >> 62)
    goto LABEL_80;
  v5 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_12:
  while (!(*v2 >> 62))
  {
    v9 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v9 >= v5)
      goto LABEL_14;
LABEL_79:
    __break(1u);
LABEL_80:
    swift_bridgeObjectRetain();
    v5 = sub_249D8BA08();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v9 = sub_249D8BA08();
  swift_bridgeObjectRelease();
  if (v9 < v5)
    goto LABEL_79;
LABEL_14:
  sub_249D7190C(v5, v9);
  swift_endAccess();
  v10 = *(void **)(v1 + 16);
  if (v10)
  {
    v11 = *(_BYTE *)(v1 + 24);
    v12 = v10;
    v13 = v12;
    if ((v11 & 1) != 0)
      goto LABEL_16;
    if (objc_msgSend(v12, sel_isDeviceMotionActive))
    {
      if (*v2 >> 62)
      {
        swift_bridgeObjectRetain();
        v33 = sub_249D8BA08();
        swift_bridgeObjectRelease();
        if (v33)
          goto LABEL_58;
      }
      else if (*(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_58;
      }
LABEL_16:
      objc_msgSend(v13, sel_stopDeviceMotionUpdates);
      v14 = *(_BYTE *)(v1 + 48);
      *(_OWORD *)(v1 + 64) = *(_OWORD *)(v1 + 32);
      *(_BYTE *)(v1 + 80) = v14;
      *(CFTimeInterval *)(v1 + 88) = CACurrentMediaTime();
      *(_BYTE *)(v1 + 96) = 0;
      *(_QWORD *)(v1 + 32) = 0;
      *(_QWORD *)(v1 + 40) = 0;
      *(_BYTE *)(v1 + 48) = 1;
    }
    else
    {
LABEL_58:
      if ((*(_BYTE *)(v1 + 24) & 1) == 0 && (objc_msgSend(v13, sel_isDeviceMotionActive) & 1) == 0)
      {
        v29 = *v2;
        if (v29 >> 62)
        {
          swift_bridgeObjectRetain();
          v34 = sub_249D8BA08();
          swift_bridgeObjectRelease();
          if (!v34)
            goto LABEL_63;
        }
        else if (!*(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          goto LABEL_63;
        }
        v30 = objc_msgSend((id)objc_opt_self(), sel_mainQueue);
        v35[4] = sub_249D71C04;
        v35[5] = v1;
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 1107296256;
        v35[2] = sub_249D704C4;
        v35[3] = &block_descriptor;
        v31 = _Block_copy(v35);
        swift_retain();
        swift_release();
        objc_msgSend(v13, sel_startDeviceMotionUpdatesToQueue_withHandler_, v30, v31);

        _Block_release(v31);
        v13 = v30;
      }
    }
LABEL_63:

  }
}

void sub_249D704C4(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_249D70548(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = sub_249D8B7B0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249D8B798();
  *(_BYTE *)(a1 + 24) = a4;
  swift_retain();
  sub_249D6FEE4();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_249D705F0(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  double v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unsigned int v15;
  unsigned int v16;
  float32_t v17;
  char v18;
  char v19;
  char v20;
  char v21;
  unsigned int v22;
  float32x4_t v23;
  float32x4_t v24;
  float v25;
  float32x4_t v26;
  int8x16_t v27;
  float32x2_t v28;
  float32x4_t v29;
  unsigned __int32 v30;
  float32x2_t v31;
  float32x2_t v32;
  int32x4_t v33;
  int8x16_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  uint64_t v38;
  uint64_t v39;
  float32x4_t v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  float v45;
  float32x4_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  float32x4_t v50;
  int32x4_t v51;
  float32x4_t v52;
  int8x16_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  float v64;
  float v65;
  float32x4_t v66;
  float32x4_t v67;
  int32x4_t v68;
  int8x16_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float v74;
  BOOL v75;
  float v77;
  int v80;
  uint64_t v81;
  uint64_t v82;
  float32x4_t v83;
  float32x4_t v84;
  int32x4_t v85;
  int8x16_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  float32x4_t v92;
  int8x16_t v93;
  float32x2_t v94;
  float32x4_t v95;
  unsigned __int32 v96;
  float32x2_t v97;
  float32x2_t v98;
  int32x4_t v99;
  int8x16_t v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  float v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  float32x4_t v110;
  float32x4_t v111;
  float32x4_t v112;
  float32x4_t v113;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v4 = result;
    v5 = CACurrentMediaTime();
    v6 = objc_msgSend(a2, sel_attitude);
    objc_msgSend(v6, sel_quaternion);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    *(float *)&v15 = v8;
    *(float *)&v16 = v10;
    v17 = v12;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v24.i64[0] = __PAIR64__(v16, v15);
    *(float *)&v22 = v14;
    v24.f32[2] = v17;
    v106 = (float32x4_t)xmmword_249D8C500;
    v23 = vmulq_f32(v24, (float32x4_t)xmmword_249D8C500);
    v24.i32[3] = v22;
    v25 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1))).f32[0];
    v26.f32[0] = 0.0 * v25;
    v26.f32[1] = 0.0 * v25;
    v26.i64[1] = __PAIR64__(v22, LODWORD(v25));
    v27 = (int8x16_t)vmulq_f32(v26, v26);
    v28 = vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v27, v27, 8uLL));
    if (vaddv_f32(v28) == 0.0)
    {
      v29 = (float32x4_t)xmmword_249D8C510;
    }
    else
    {
      v30 = vadd_f32(v28, (float32x2_t)vdup_lane_s32((int32x2_t)v28, 1)).u32[0];
      v31 = vrsqrte_f32((float32x2_t)v30);
      v32 = vmul_f32(v31, vrsqrts_f32((float32x2_t)v30, vmul_f32(v31, v31)));
      v29 = vmulq_f32(vmulq_n_f32(v26, vmul_f32(v32, vrsqrts_f32((float32x2_t)v30, vmul_f32(v32, v32))).f32[0]), (float32x4_t)xmmword_249D8C520);
    }
    v33 = (int32x4_t)vnegq_f32(v24);
    v34 = (int8x16_t)vtrn2q_s32((int32x4_t)v24, vtrn1q_s32((int32x4_t)v24, v33));
    v35 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v24, (int8x16_t)v33, 8uLL), *(float32x2_t *)v29.f32, 1), (float32x4_t)vextq_s8(v34, v34, 8uLL), v29.f32[0]);
    v36 = (float32x4_t)vrev64q_s32((int32x4_t)v24);
    v36.i32[0] = v33.i32[1];
    v36.i32[3] = v33.i32[2];
    v37 = vaddq_f32(v35, vmlaq_laneq_f32(vmulq_laneq_f32(v24, v29, 3), v36, v29, 2));
    if ((*(_BYTE *)(v4 + 48) & 1) != 0)
    {
      *(float32x4_t *)(v4 + 32) = v37;
      *(_BYTE *)(v4 + 48) = 0;
      v38 = v37.i64[1];
      v39 = v37.i64[0];
    }
    else
    {
      v39 = *(_QWORD *)(v4 + 32);
      v38 = *(_QWORD *)(v4 + 40);
    }
    v40.i64[0] = v39;
    v40.i64[1] = v38;
    v112 = v40;
    v107 = v37;
    if ((*(_BYTE *)(v4 + 80) & 1) == 0 && (*(_BYTE *)(v4 + 96) & 1) == 0)
    {
      v110 = *(float32x4_t *)(v4 + 64);
      v41 = v5 - *(double *)(v4 + 88);
      v42 = *(void **)(v4 + 104);
      objc_msgSend(v42, sel_duration, 0, 1065353216);
      v44 = fmin(fmax(v41 / v43, 0.0), 1.0);
      *(float *)&v44 = v44;
      objc_msgSend(v42, sel__solveForInput_, v44);
      simd_slerp(v110, v112, v45);
      v112 = v46;
    }
    swift_beginAccess();
    v47 = *(_QWORD *)(v4 + 136);
    if (v47 >> 62)
    {
      swift_bridgeObjectRetain();
      result = sub_249D8BA08();
      v48 = result;
    }
    else
    {
      v48 = *(_QWORD *)((v47 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
    }
    if (v48)
    {
      if (v48 >= 1)
      {
        v49 = 0;
        v50 = vmulq_f32(v112, (float32x4_t)xmmword_249D8C520);
        v51 = (int32x4_t)vnegq_f32(v50);
        v52 = (float32x4_t)vrev64q_s32((int32x4_t)v50);
        v53 = (int8x16_t)vtrn2q_s32((int32x4_t)v50, vtrn1q_s32((int32x4_t)v50, v51));
        v52.i32[0] = v51.i32[1];
        v52.i32[3] = v51.i32[2];
        v113 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v50, v107, 3), v52, v107, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v50, (int8x16_t)v51, 8uLL), *(float32x2_t *)v107.f32, 1), (float32x4_t)vextq_s8(v53, v53, 8uLL), v107.f32[0]));
        v108 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v113, 2);
        v109 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v113.f32, 0);
        while (1)
        {
          if ((v47 & 0xC000000000000001) != 0)
          {
            v54 = MEMORY[0x24BD038A4](v49, v47);
          }
          else
          {
            v54 = *(_QWORD *)(v47 + 8 * v49 + 32);
            swift_retain();
          }
          v55 = MEMORY[0x24BD03EB0](v54 + 16);
          if (v55)
            break;
          swift_release();
LABEL_18:
          if (v48 == ++v49)
            goto LABEL_57;
        }
        v56 = (_BYTE *)v55;
        v111 = *(float32x4_t *)(v55 + OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation);
        *(float32x4_t *)(v55 + OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation) = v113;
        v57 = (void *)MEMORY[0x24BD03EB0](v55 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve);
        if (!v57)
          goto LABEL_27;
        v58 = v57;
        objc_msgSend(v57, sel__horizontalVelocity);
        v60 = fabs(v59);
        objc_msgSend(v58, sel__verticalVelocity);
        v62 = v61;

        v63 = fabs(v62);
        if (v60 > v63)
          v63 = v60;
        v64 = v63;
        if (v64 != 0.0)
        {
          v75 = v64 >= 0.0 && v64 < 0.2;
          v66 = v111;
          if (v75)
          {
            *(float *)&v80 = 0.01;
          }
          else
          {
            if (v64 < 0.2 || v64 >= 0.5)
            {
              v77 = 100.0;
              if (v64 >= 100.0 || v64 < 1.0)
                v77 = 0.004;
              if (v64 >= 0.5 && v64 < 1.0)
                v65 = 0.1;
              else
                v65 = v77;
              goto LABEL_28;
            }
            *(float *)&v80 = 0.05;
          }
          v65 = *(float *)&v80;
        }
        else
        {
LABEL_27:
          v65 = 0.003;
          v66 = v111;
        }
LABEL_28:
        v67 = vmulq_f32(v66, (float32x4_t)xmmword_249D8C520);
        v68 = (int32x4_t)vnegq_f32(v67);
        v69 = (int8x16_t)vtrn2q_s32((int32x4_t)v67, vtrn1q_s32((int32x4_t)v67, v68));
        v70 = vmlaq_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v67, (int8x16_t)v68, 8uLL), *(float32x2_t *)v113.f32, 1), (float32x4_t)vextq_s8(v69, v69, 8uLL), v109);
        v71 = (float32x4_t)vrev64q_s32((int32x4_t)v67);
        v71.i32[0] = v68.i32[1];
        v71.i32[3] = v68.i32[2];
        v72 = vaddq_f32(vmlaq_f32(vmulq_laneq_f32(v67, v113, 3), v71, v108), v70);
        v73 = vmulq_f32(v72, v72);
        v74 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v73, 2), vaddq_f32(v73, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v73.f32, 1))).f32[0]), v72.f32[3]);
        if (fabsf(v74 + v74) >= v65)
        {
          v56[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
          if (!*(_QWORD *)&v56[OBJC_IVAR____VKStickerEffectViewInternal_displayLink])
            objc_msgSend(v56, sel_setNeedsLayout);
        }
        if (!*(_QWORD *)&v56[OBJC_IVAR____VKStickerEffectViewInternal_displayLink]
          && (v56[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] & 1) != 0)
        {
          objc_msgSend(v56, sel_setNeedsLayout);
        }
        swift_release();
        swift_unknownObjectRelease();
        goto LABEL_18;
      }
      __break(1u);
      goto LABEL_73;
    }
LABEL_57:
    result = swift_bridgeObjectRelease();
    if ((*(_BYTE *)(v4 + 48) & 1) != 0)
    {
LABEL_73:
      __break(1u);
      return result;
    }
    v81 = *(_QWORD *)(v4 + 32);
    v82 = *(_QWORD *)(v4 + 40);
    v83.i64[0] = v81;
    v83.i64[1] = v82;
    v84 = vmulq_f32(v83, (float32x4_t)xmmword_249D8C520);
    v85 = (int32x4_t)vnegq_f32(v84);
    v86 = (int8x16_t)vtrn2q_s32((int32x4_t)v84, vtrn1q_s32((int32x4_t)v84, v85));
    v87 = (float32x4_t)vrev64q_s32((int32x4_t)v84);
    v87.i32[0] = v85.i32[1];
    v87.i32[3] = v85.i32[2];
    v88 = vaddq_f32(vmlaq_f32(vmulq_laneq_f32(v84, v107, 3), v87, (float32x4_t)vdupq_laneq_s32((int32x4_t)v107, 2)), vmlaq_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v84, (int8x16_t)v85, 8uLL), *(float32x2_t *)v107.f32, 1), (float32x4_t)vextq_s8(v86, v86, 8uLL), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v107.f32, 0)));
    v89 = vmulq_f32(v88, v106);
    v90 = vaddq_f32(v89, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v89.f32, 1));
    v91 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v89, 2);
    v90.f32[0] = vaddq_f32(v91, v90).f32[0];
    v91.f32[0] = 0.0 * v90.f32[0];
    v92.i64[0] = vdupq_lane_s32(*(int32x2_t *)v91.f32, 0).u64[0];
    v92.i64[1] = __PAIR64__(v88.u32[3], v90.u32[0]);
    v93 = (int8x16_t)vmulq_f32(v92, v92);
    v94 = vadd_f32(*(float32x2_t *)v93.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v93, v93, 8uLL));
    if (vaddv_f32(v94) == 0.0)
    {
      v95 = (float32x4_t)xmmword_249D8C510;
    }
    else
    {
      v96 = vadd_f32(v94, (float32x2_t)vdup_lane_s32((int32x2_t)v94, 1)).u32[0];
      v97 = vrsqrte_f32((float32x2_t)v96);
      v98 = vmul_f32(v97, vrsqrts_f32((float32x2_t)v96, vmul_f32(v97, v97)));
      v95 = vmulq_f32(vmulq_n_f32(v92, vmul_f32(v98, vrsqrts_f32((float32x2_t)v96, vmul_f32(v98, v98))).f32[0]), (float32x4_t)xmmword_249D8C520);
    }
    v99 = (int32x4_t)vnegq_f32(v95);
    v100 = (int8x16_t)vtrn2q_s32((int32x4_t)v95, vtrn1q_s32((int32x4_t)v95, v99));
    v101 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v95, (int8x16_t)v99, 8uLL), *(float32x2_t *)v88.f32, 1), (float32x4_t)vextq_s8(v100, v100, 8uLL), v88.f32[0]);
    v102 = (float32x4_t)vrev64q_s32((int32x4_t)v95);
    v102.i32[0] = v99.i32[1];
    v102.i32[3] = v99.i32[2];
    v103 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v95, v88, 3), v102, v88, 2), v101);
    v104 = vmulq_f32(v103, v103);
    v105 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v104, 2), vaddq_f32(v104, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v104.f32, 1))).f32[0]), v103.f32[3]);
    if (fabsf(v105 + v105) <= 0.62832)
    {
      if ((*(_BYTE *)(v4 + 128) & 1) != 0)
        return swift_release();
      *(_QWORD *)(v4 + 120) = 0;
    }
    else
    {
      if ((*(_BYTE *)(v4 + 128) & 1) != 0)
      {
        *(double *)(v4 + 120) = v5;
        *(_BYTE *)(v4 + 128) = 0;
        return swift_release();
      }
      if (v5 - *(double *)(v4 + 120) <= 1.0)
        return swift_release();
      *(_QWORD *)(v4 + 64) = v81;
      *(_QWORD *)(v4 + 72) = v82;
      *(_BYTE *)(v4 + 80) = 0;
      *(CFTimeInterval *)(v4 + 88) = CACurrentMediaTime();
      *(_BYTE *)(v4 + 96) = 0;
      *(_QWORD *)(v4 + 32) = 0;
      *(_QWORD *)(v4 + 40) = 0;
      *(_BYTE *)(v4 + 48) = 1;
      *(_QWORD *)(v4 + 120) = 0;
    }
    *(_BYTE *)(v4 + 128) = 1;
    return swift_release();
  }
  return result;
}

uint64_t sub_249D70D1C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StickerEffectMotionManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for StickerEffectMotionManager.WeakObserver()
{
  return objc_opt_self();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_249D721B8(a1, &qword_2578D3C38);
}

uint64_t sub_249D70DB4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_249D70DD4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_249D721B8(a1, &qword_2578D3C40);
}

void type metadata accessor for MTLPixelFormat(uint64_t a1)
{
  sub_249D721B8(a1, &qword_2578D3C48);
}

void type metadata accessor for StickerShaderIridescence(uint64_t a1)
{
  sub_249D721B8(a1, &qword_2578D3C50);
}

void type metadata accessor for simd_quatf(uint64_t a1)
{
  sub_249D721B8(a1, &qword_2578D3C58);
}

void type metadata accessor for VKIStickerEffectType(uint64_t a1)
{
  sub_249D721B8(a1, &qword_2578D3C60);
}

uint64_t initializeBufferWithCopyOfBuffer for StickerComicRenderer.Parameters(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_249D70E9C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_249D70EBC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_249D721B8(a1, &qword_2578D3C68);
}

BOOL sub_249D70EFC(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_249D70F10()
{
  sub_249D72088(&qword_2578D3CC8, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C920);
  return sub_249D8BA50();
}

uint64_t sub_249D70F50()
{
  sub_249D72088(&qword_2578D3CC8, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C920);
  return sub_249D8BA44();
}

uint64_t sub_249D70F94()
{
  sub_249D72088((unint64_t *)&qword_2578D3D00, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C964);
  return sub_249D8B7BC();
}

void sub_249D70FD4(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

id sub_249D70FDC()
{
  id *v0;

  return *v0;
}

uint64_t sub_249D70FE4@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

_QWORD *sub_249D70FEC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_249D71000(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_249D71030(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_249D71044(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

uint64_t sub_249D71058(uint64_t a1)
{
  MEMORY[0x24BD03DD8](&unk_249D8CA74, a1);
  return sub_249D8B840();
}

uint64_t sub_249D71094()
{
  MEMORY[0x24BD03DD8](&unk_249D8CA74);
  return sub_249D8B834();
}

uint64_t sub_249D710DC(uint64_t a1, uint64_t a2)
{
  sub_249D8BA8C();
  MEMORY[0x24BD03DD8](&unk_249D8CA74, a2);
  sub_249D8B834();
  return sub_249D8BAA4();
}

_QWORD *sub_249D71134@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_249D71144(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_DWORD *sub_249D71150@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_249D71160(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_249D7116C()
{
  return sub_249D8B8C4();
}

uint64_t sub_249D7117C()
{
  sub_249D72088((unint64_t *)&qword_2578D3D00, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C964);
  return sub_249D8B7F8();
}

uint64_t sub_249D711BC()
{
  sub_249D72088((unint64_t *)&qword_2578D3D00, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C964);
  return sub_249D8B7D4();
}

uint64_t sub_249D711FC(void *a1)
{
  id v2;

  sub_249D72088((unint64_t *)&qword_2578D3D00, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C964);
  v2 = a1;
  return sub_249D8B7C8();
}

uint64_t sub_249D71260()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_249D8B99C();

  return v2;
}

uint64_t sub_249D71294()
{
  sub_249D72088((unint64_t *)&qword_2578D3D00, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C964);
  return sub_249D8B7EC();
}

uint64_t sub_249D712E4()
{
  sub_249D8BA8C();
  sub_249D8B8AC();
  return sub_249D8BAA4();
}

_QWORD *sub_249D71340@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_249D7134C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24BD03DD8](&unk_249D8CA74, a3);
  return sub_249D8B828();
}

uint64_t sub_249D71398()
{
  sub_249D72088((unint64_t *)&qword_2578D3D00, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C964);
  return sub_249D8B7E0();
}

BOOL sub_249D713F0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_249D71404(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_249D71428(uint64_t (*a1)(uint64_t *), uint64_t a2)
{
  unint64_t *v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  char v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int isUniquelyReferenced_nonNull_bridgeObject;
  unint64_t v20;
  int v21;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = v2;
  v7 = *v2;
  swift_bridgeObjectRetain();
  v8 = sub_249D71788(a1, a2, v7);
  v10 = v9;
  swift_bridgeObjectRelease();
  if (v3)
    return v8;
  if ((v10 & 1) == 0)
  {
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_54;
    if (*v4 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      v26 = sub_249D8BA08();
      swift_bridgeObjectRelease();
      if (v11 != v26)
        goto LABEL_6;
    }
    else if (v11 != *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      v11 = v8 + 5;
      v28 = a2;
      while (1)
      {
        v12 = v11 - 4;
        v13 = *v4;
        if ((*v4 & 0xC000000000000001) != 0)
        {
          v14 = MEMORY[0x24BD038A4](v11 - 4);
        }
        else
        {
          if ((v12 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_45:
            __break(1u);
LABEL_46:
            __break(1u);
LABEL_47:
            __break(1u);
LABEL_48:
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
            goto LABEL_55;
          }
          if (v12 >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_45;
          v14 = *(_QWORD *)(v13 + 8 * v11);
          swift_retain();
        }
        v29 = v14;
        v15 = a1(&v29);
        swift_release();
        if ((v15 & 1) == 0)
          break;
LABEL_32:
        v23 = v11 - 3;
        if (__OFADD__(v12, 1))
          goto LABEL_46;
        if (*v4 >> 62)
        {
          swift_bridgeObjectRetain();
          v24 = sub_249D8BA08();
          swift_bridgeObjectRelease();
        }
        else
        {
          v24 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        ++v11;
        if (v23 == v24)
          return v8;
      }
      if (v12 == v8)
      {
LABEL_31:
        if (__OFADD__(v8++, 1))
          goto LABEL_47;
        goto LABEL_32;
      }
      v16 = *v4;
      if ((*v4 & 0xC000000000000001) != 0)
      {
        v17 = MEMORY[0x24BD038A4](v8, *v4);
        v16 = *v4;
        if ((*v4 & 0xC000000000000001) == 0)
        {
LABEL_17:
          if ((v12 & 0x8000000000000000) != 0)
            goto LABEL_50;
          if (v12 >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_51;
          v18 = *(_QWORD *)(v16 + 8 * v11);
          swift_retain();
          goto LABEL_20;
        }
      }
      else
      {
        if ((v8 & 0x8000000000000000) != 0)
          goto LABEL_48;
        if (v8 >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_49;
        v17 = *(_QWORD *)(v16 + 8 * v8 + 32);
        swift_retain();
        if ((v16 & 0xC000000000000001) == 0)
          goto LABEL_17;
      }
      v18 = MEMORY[0x24BD038A4](v11 - 4, v16);
      v16 = *v4;
LABEL_20:
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *v4 = v16;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v16 & 0x8000000000000000) != 0
        || (v16 & 0x4000000000000000) != 0)
      {
        sub_249D718A4(v16);
      }
      *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 8 * v8 + 0x20) = v18;
      swift_release();
      sub_249D8B900();
      v20 = *v4;
      v21 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *v4 = v20;
      if (!v21 || (v20 & 0x8000000000000000) != 0 || (v20 & 0x4000000000000000) != 0)
        sub_249D718A4(v20);
      a2 = v28;
      if ((v12 & 0x8000000000000000) != 0)
        goto LABEL_52;
      if (v12 >= *(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_53;
      *(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 8 * v11) = v17;
      swift_release();
      sub_249D8B900();
      goto LABEL_31;
    }
    return v8;
  }
  if (!(*v4 >> 62))
    return *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v27 = sub_249D8BA08();
  swift_bridgeObjectRelease();
  return v27;
}

uint64_t sub_249D71788(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v12;

  if (a3 >> 62)
    goto LABEL_14;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v7 = 0;
  if (v6)
  {
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        v8 = MEMORY[0x24BD038A4](v7, a3);
      }
      else
      {
        v8 = *(_QWORD *)(a3 + 8 * v7 + 32);
        swift_retain();
      }
      v12 = v8;
      v9 = a1(&v12);
      swift_release();
      if (v3 || (v9 & 1) != 0)
        break;
      v10 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_14:
        swift_bridgeObjectRetain();
        v6 = sub_249D8BA08();
        swift_bridgeObjectRelease();
        v7 = 0;
        if (!v6)
          return v7;
      }
      else
      {
        ++v7;
        if (v10 == v6)
          return 0;
      }
    }
  }
  return v7;
}

void sub_249D718A4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_249D8BA08();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x24BD038B0);
}

uint64_t sub_249D7190C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_249D8BA08();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_31;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_249D8BA08();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_249D8BA08();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_34;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_36;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x24BD038B0](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  type metadata accessor for StickerEffectMotionManager.WeakObserver();
  swift_arrayDestroy();
  if (!v5)
    return sub_249D8B900();
  if (!(*v3 >> 62))
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = v15 - v2;
    if (!__OFSUB__(v15, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v22 = sub_249D8BA08();
  swift_bridgeObjectRelease();
  v16 = v22 - v2;
  if (__OFSUB__(v22, v2))
    goto LABEL_40;
LABEL_21:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16])
      memmove(v14, v17, 8 * v16);
    if (!(*v3 >> 62))
    {
      v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v19;
        return sub_249D8B900();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v23 = sub_249D8BA08();
    swift_bridgeObjectRelease();
    v19 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_249D8BA20();
  __break(1u);
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

id sub_249D71C20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id result;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_249D8B870();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_249D8B894();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = *(id *)(v1 + 16);
  if (result)
  {
    result = objc_msgSend(result, sel_deviceMotion);
    if (result)
    {
      v11 = result;
      sub_249D71E68();
      v19 = v3;
      v18 = sub_249D8B96C();
      v12 = swift_allocObject();
      swift_weakInit();
      v13 = swift_allocObject();
      *(_QWORD *)(v13 + 16) = v12;
      *(_QWORD *)(v13 + 24) = v11;
      aBlock[4] = sub_249D71EF4;
      aBlock[5] = v13;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_249D82804;
      aBlock[3] = &block_descriptor_6;
      v14 = _Block_copy(aBlock);
      swift_retain();
      v15 = v11;
      sub_249D8B87C();
      v20 = MEMORY[0x24BEE4AF8];
      sub_249D72088((unint64_t *)&unk_2578D43A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D3C80);
      sub_249D71F3C();
      sub_249D8B9B4();
      v16 = (void *)v18;
      MEMORY[0x24BD03850](0, v9, v5, v14);
      _Block_release(v14);

      (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      swift_release();
      return (id)swift_release();
    }
  }
  return result;
}

unint64_t sub_249D71E68()
{
  unint64_t result;

  result = qword_2578D3C70;
  if (!qword_2578D3C70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2578D3C70);
  }
  return result;
}

uint64_t sub_249D71EA4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_249D71EC8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_249D71EF4()
{
  uint64_t v0;

  return sub_249D705F0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD03DC0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_249D71F3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578D43B0;
  if (!qword_2578D43B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2578D3C80);
    result = MEMORY[0x24BD03DD8](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2578D43B0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD03DCC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void simd_slerp(float32x4_t a1, float32x4_t a2, float a3)
{
  float32x4_t v3;
  float32x4_t v4;

  v3 = vmulq_f32(a1, a2);
  v4 = (float32x4_t)vextq_s8((int8x16_t)v3, (int8x16_t)v3, 8uLL);
  *(float32x2_t *)v3.f32 = vadd_f32(*(float32x2_t *)v3.f32, *(float32x2_t *)v4.f32);
  v3.f32[0] = vaddv_f32(*(float32x2_t *)v3.f32);
  v4.i32[0] = 0;
  _simd_slerp_internal(a1, (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v3, v4)), 0), (int8x16_t)vnegq_f32(a2), (int8x16_t)a2), a3);
}

void type metadata accessor for CFDictionary(uint64_t a1)
{
  sub_249D721B8(a1, &qword_2578D3C90);
}

void type metadata accessor for CGColorSpace(uint64_t a1)
{
  sub_249D721B8(a1, &qword_2578D3C98);
}

void type metadata accessor for CVBuffer(uint64_t a1)
{
  sub_249D721B8(a1, &qword_2578D3CA0);
}

void type metadata accessor for MTLCommandBufferError(uint64_t a1)
{
  sub_249D721B8(a1, &qword_2578D3CA8);
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_249D721B8(a1, &qword_2578D3CB0);
}

uint64_t sub_249D7205C()
{
  return sub_249D72088(&qword_2578D3CB8, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C838);
}

uint64_t sub_249D72088(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24BD03DD8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_249D720C8()
{
  return sub_249D72088(&qword_2578D3CC0, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C864);
}

uint64_t sub_249D720F4()
{
  return sub_249D72088(&qword_2578D3CC8, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C920);
}

uint64_t sub_249D72120()
{
  return sub_249D72088(&qword_2578D3CD0, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C8EC);
}

uint64_t sub_249D7214C()
{
  return sub_249D72088(&qword_2578D3CD8, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C8A8);
}

uint64_t sub_249D72178()
{
  return sub_249D72088(&qword_2578D3CE0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_249D8CA0C);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_249D721B8(a1, &qword_2578D3D18);
}

void sub_249D721B8(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_249D721FC()
{
  return sub_249D72088(&qword_2578D3CE8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_249D8C9D0);
}

unint64_t sub_249D7222C()
{
  unint64_t result;

  result = qword_2578D3CF0;
  if (!qword_2578D3CF0)
  {
    result = MEMORY[0x24BD03DD8](MEMORY[0x24BEE1EC8], MEMORY[0x24BEE1E88]);
    atomic_store(result, (unint64_t *)&qword_2578D3CF0);
  }
  return result;
}

uint64_t sub_249D72270()
{
  return sub_249D72088(&qword_2578D3CF8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_249D8CA48);
}

uint64_t sub_249D7229C()
{
  return sub_249D72088((unint64_t *)&qword_2578D3D00, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C964);
}

uint64_t sub_249D722C8()
{
  return sub_249D72088((unint64_t *)&qword_2578D3D08, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_249D8CAA0);
}

uint64_t sub_249D722F4()
{
  return sub_249D72088(&qword_2578D3D10, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_249D8C80C);
}

void _simd_slerp_internal(float32x4_t a1, float32x4_t a2, float a3)
{
  float v5;
  float32x4_t v6;
  int8x16_t v7;
  float32x4_t v8;
  int8x16_t v9;
  float v10;
  float v11;
  float v12;

  v5 = 1.0 - a3;
  v6 = vsubq_f32(a1, a2);
  v7 = (int8x16_t)vmulq_f32(v6, v6);
  v8 = vaddq_f32(a1, a2);
  v9 = (int8x16_t)vmulq_f32(v8, v8);
  v10 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL)))));
  v11 = v10 + v10;
  if ((float)(v10 + v10) != 0.0)
    sinf(v11);
  if ((float)(v5 * v11) != 0.0)
    sinf(v5 * v11);
  v12 = v11 * a3;
  if (v12 != 0.0)
    sinf(v12);
}

uint64_t VKIStickerEffectType.description.getter(unint64_t a1)
{
  if (a1 > 4)
    return 0x6E776F6E6B6E75;
  else
    return *(_QWORD *)&aNone[8 * a1];
}

uint64_t sub_249D724E4()
{
  unint64_t *v0;

  return VKIStickerEffectType.description.getter(*v0);
}

uint64_t sub_249D72530()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_type;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_249D725BC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____VKStickerEffectInternal_type);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D72604())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_249D726E0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0 + OBJC_IVAR____VKStickerEffectInternal_type);
  swift_beginAccess();
  if (*v1 > 4uLL)
    return 0x6E776F6E6B6E75;
  else
    return *(_QWORD *)&aNone[8 * *v1];
}

uint64_t sub_249D727A4()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isStroked);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_249D72830(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectInternal_isStroked);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D72878())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_249D72900()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_strokeRadius;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_249D72994(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_strokeRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D729E4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_249D72A6C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_249D72B00(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D72B50())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_249D72BD8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_249D72C6C(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D72CBC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_249D72D44()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_249D72DD0(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D72E18())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_249D72EA0()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isPuffy);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_249D72F2C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectInternal_isPuffy);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D72F74())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_249D72FFC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_normalsRadius;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_249D73090(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_normalsRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D730E0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_249D73168()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_249D731F4(int a1)
{
  uint64_t v1;
  _DWORD *v3;
  uint64_t result;

  v3 = (_DWORD *)(v1 + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D7323C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_249D732C8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_249D73354(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D7339C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_249D73424()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isBrushed);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_249D734B0(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectInternal_isBrushed);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D734F8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_249D73580()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_249D7360C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D73654())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_249D736DC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_shadowRadius;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_249D73770(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_shadowRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D737C0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_249D73848()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_shadowAlpha;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_249D738DC(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_shadowAlpha);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D7392C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_249D739B4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_shadowOffset;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_249D73A48(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____VKStickerEffectInternal_shadowOffset);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D73A98())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_249D73B20()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_shadowParallax;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_249D73BB4(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____VKStickerEffectInternal_shadowParallax);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D73C04())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_249D73C8C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_249D73D20(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D73D70())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_249D73DF8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_249D73E8C(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D73EDC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_249D73F64()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isComicEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_249D73FF0(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectInternal_isComicEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D74038())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_249D7407C()
{
  double result;

  byte_2578D4688 = 0;
  unk_2578D468C = xmmword_249D8CB10;
  result = 5.23869072e-11;
  unk_2578D469C = 0x3DCCCCCD3F000000;
  qword_2578D46A8 = 6;
  return result;
}

double sub_249D740AC()
{
  double result;

  byte_2578D46B0 = 1;
  unk_2578D46B4 = xmmword_249D8CB20;
  result = 5.23869072e-11;
  unk_2578D46C4 = 0x3DCCCCCD3F000000;
  qword_2578D46D0 = 6;
  return result;
}

uint64_t sub_249D74104()
{
  uint64_t v0;
  float *v1;
  float *v2;
  _BOOL8 v3;
  _DWORD *v4;
  _BYTE *v5;
  _BYTE *v6;
  _QWORD *v8;

  v1 = (float *)(v0 + OBJC_IVAR____VKStickerEffectInternal_shadowAlpha);
  swift_beginAccess();
  if (*v1 == 0.0
    || (v2 = (float *)(v0 + OBJC_IVAR____VKStickerEffectInternal_shadowRadius), swift_beginAccess(), *v2 == 0.0))
  {
    v3 = 0;
  }
  else
  {
    v8 = (_QWORD *)(v0 + OBJC_IVAR____VKStickerEffectInternal_shadowParallax);
    swift_beginAccess();
    v3 = COERCE_FLOAT(*v8) != 0.0 || COERCE_FLOAT(HIDWORD(*v8)) != 0.0;
  }
  v4 = (_DWORD *)(v0 + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  swift_beginAccess();
  if (*v4)
    return 1;
  v5 = (_BYTE *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isPuffy);
  swift_beginAccess();
  if ((*v5 & 1) != 0)
    return 1;
  v6 = (_BYTE *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isBrushed);
  swift_beginAccess();
  if (*v6 == 1)
    return 1;
  return v3;
}

uint64_t sub_249D74290()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_249D7431C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D74364())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

__n128 sub_249D743A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __n128 result;
  uint64_t v4;

  if (qword_2578D3BC8 != -1)
    swift_once();
  v1 = qword_2578D46A8;
  v2 = v0 + OBJC_IVAR____VKStickerEffectInternal_comicParameters;
  result = (__n128)unk_2578D468C;
  v4 = unk_2578D469C;
  *(_BYTE *)v2 = byte_2578D4688;
  *(__n128 *)(v2 + 4) = result;
  *(_QWORD *)(v2 + 20) = v4;
  *(_QWORD *)(v2 + 32) = v1;
  return result;
}

__n128 sub_249D7449C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __n128 result;
  uint64_t v4;

  if (qword_2578D3BD0 != -1)
    swift_once();
  v1 = qword_2578D46D0;
  v2 = v0 + OBJC_IVAR____VKStickerEffectInternal_comicParameters;
  result = (__n128)unk_2578D46B4;
  v4 = unk_2578D46C4;
  *(_BYTE *)v2 = byte_2578D46B0;
  *(__n128 *)(v2 + 4) = result;
  *(_QWORD *)(v2 + 20) = v4;
  *(_QWORD *)(v2 + 32) = v1;
  return result;
}

id static StickerEffect.effectWithType(_:)(uint64_t a1)
{
  uint64_t *v1;

  switch(a1)
  {
    case 1:
      if (qword_2578D3BE0 != -1)
        swift_once();
      v1 = &qword_2578D3E48;
      break;
    case 2:
      if (qword_2578D3BE8 != -1)
        swift_once();
      v1 = &qword_2578D3E50;
      break;
    case 3:
      if (qword_2578D3BF0 != -1)
        swift_once();
      v1 = &qword_2578D3E58;
      break;
    case 4:
      if (qword_2578D3BF8 != -1)
        swift_once();
      v1 = &qword_2578D3E60;
      break;
    default:
      if (qword_2578D3BD8 != -1)
        swift_once();
      v1 = &qword_2578D3E40;
      break;
  }
  return (id)*v1;
}

uint64_t sub_249D746C4()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t result;

  v0 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  v1 = &v0[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
  swift_beginAccess();
  *v1 = 0;
  v2 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowRadius];
  swift_beginAccess();
  *(_DWORD *)v2 = 0;
  v3 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowAlpha];
  swift_beginAccess();
  *(_DWORD *)v3 = 0;
  v4 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowOffset];
  swift_beginAccess();
  *(_QWORD *)v4 = 0;
  v5 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowParallax];
  swift_beginAccess();
  *(_QWORD *)v5 = 0;
  v6 = &v0[OBJC_IVAR____VKStickerEffectInternal_type];
  result = swift_beginAccess();
  *(_QWORD *)v6 = 0;
  qword_2578D3E40 = (uint64_t)v0;
  return result;
}

id StickerEffect.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static StickerEffect.none.getter()
{
  return sub_249D74E10(&qword_2578D3BD8, (id *)&qword_2578D3E40);
}

uint64_t sub_249D74840()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t result;

  v0 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  v1 = &v0[OBJC_IVAR____VKStickerEffectInternal_isStroked];
  swift_beginAccess();
  *v1 = 1;
  v2 = &v0[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
  swift_beginAccess();
  *v2 = 0;
  v3 = &v0[OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier];
  swift_beginAccess();
  *(_DWORD *)v3 = 1075838976;
  v4 = &v0[OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier];
  swift_beginAccess();
  *(_DWORD *)v4 = 1075838976;
  v5 = &v0[OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier];
  swift_beginAccess();
  *(_DWORD *)v5 = 0x40000000;
  v6 = &v0[OBJC_IVAR____VKStickerEffectInternal_type];
  result = swift_beginAccess();
  *(_QWORD *)v6 = 1;
  qword_2578D3E48 = (uint64_t)v0;
  return result;
}

id static StickerEffect.stroke.getter()
{
  return sub_249D74E10(&qword_2578D3BE0, (id *)&qword_2578D3E48);
}

char *sub_249D749A4()
{
  char *result;

  result = sub_249D749C0();
  qword_2578D3E50 = (uint64_t)result;
  return result;
}

char *sub_249D749C0()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;

  v0 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  v1 = &v0[OBJC_IVAR____VKStickerEffectInternal_isStroked];
  swift_beginAccess();
  *v1 = 0;
  v2 = &v0[OBJC_IVAR____VKStickerEffectInternal_isComicEnabled];
  swift_beginAccess();
  *v2 = 1;
  v3 = &v0[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
  swift_beginAccess();
  *v3 = 0;
  v4 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowRadius];
  swift_beginAccess();
  *(_DWORD *)v4 = 0;
  v5 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowAlpha];
  swift_beginAccess();
  *(_DWORD *)v5 = 0;
  v6 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowOffset];
  swift_beginAccess();
  *(_QWORD *)v6 = 0;
  v7 = &v0[OBJC_IVAR____VKStickerEffectInternal_shadowParallax];
  swift_beginAccess();
  *(_QWORD *)v7 = 0;
  v8 = &v0[OBJC_IVAR____VKStickerEffectInternal_type];
  swift_beginAccess();
  *(_QWORD *)v8 = 2;
  return v0;
}

id static StickerEffect.comic.getter()
{
  return sub_249D74E10(&qword_2578D3BE8, (id *)&qword_2578D3E50);
}

uint64_t sub_249D74B70()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  uint64_t result;

  v0 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  v1 = &v0[OBJC_IVAR____VKStickerEffectInternal_isStroked];
  swift_beginAccess();
  *v1 = 0;
  v2 = &v0[OBJC_IVAR____VKStickerEffectInternal_isPuffy];
  swift_beginAccess();
  *v2 = 1;
  v3 = &v0[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
  swift_beginAccess();
  *v3 = 0;
  v4 = &v0[OBJC_IVAR____VKStickerEffectInternal_type];
  result = swift_beginAccess();
  *(_QWORD *)v4 = 3;
  qword_2578D3E58 = (uint64_t)v0;
  return result;
}

id static StickerEffect.puffy.getter()
{
  return sub_249D74E10(&qword_2578D3BF0, (id *)&qword_2578D3E58);
}

char *sub_249D74C88()
{
  char *result;

  result = sub_249D74CA4();
  qword_2578D3E60 = (uint64_t)result;
  return result;
}

char *sub_249D74CA4()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;

  v0 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  v1 = &v0[OBJC_IVAR____VKStickerEffectInternal_isStroked];
  swift_beginAccess();
  *v1 = 1;
  v2 = &v0[OBJC_IVAR____VKStickerEffectInternal_iridescence];
  swift_beginAccess();
  *(_DWORD *)v2 = 3;
  v3 = &v0[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
  swift_beginAccess();
  *v3 = 0;
  v4 = &v0[OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier];
  swift_beginAccess();
  *(_DWORD *)v4 = 0x40000000;
  v5 = &v0[OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier];
  swift_beginAccess();
  *(_DWORD *)v5 = 0x40000000;
  v6 = &v0[OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier];
  swift_beginAccess();
  *(_DWORD *)v6 = 0x40000000;
  v7 = &v0[OBJC_IVAR____VKStickerEffectInternal_type];
  swift_beginAccess();
  *(_QWORD *)v7 = 4;
  return v0;
}

id static StickerEffect.iridescent.getter()
{
  return sub_249D74E10(&qword_2578D3BF8, (id *)&qword_2578D3E60);
}

id sub_249D74E10(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

id sub_249D74E64(uint64_t a1, uint64_t a2, _QWORD *a3, id *a4)
{
  if (*a3 != -1)
    swift_once();
  return *a4;
}

id StickerEffect.init()()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  char *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  objc_super v9;

  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_type] = 0;
  v0[OBJC_IVAR____VKStickerEffectInternal_isStroked] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_strokeRadius] = 1023745720;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius] = 994352038;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier] = 1065353216;
  v0[OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier] = 0;
  v0[OBJC_IVAR____VKStickerEffectInternal_isPuffy] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_normalsRadius] = 1021396910;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_iridescence] = 0;
  v0[OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke] = 0;
  v0[OBJC_IVAR____VKStickerEffectInternal_isBrushed] = 0;
  v0[OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_shadowRadius] = 1017370378;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_shadowAlpha] = 1046562734;
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_shadowOffset] = 0xBBA3D70A00000000;
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_shadowParallax] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier] = 1065353216;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier] = 1065353216;
  v0[OBJC_IVAR____VKStickerEffectInternal_isComicEnabled] = 0;
  v1 = OBJC_IVAR____VKStickerEffectInternal_comicParameters;
  v2 = qword_2578D3BC8;
  v3 = v0;
  if (v2 != -1)
    swift_once();
  v4 = &v3[v1];
  v5 = qword_2578D46A8;
  v6 = unk_2578D468C;
  v7 = unk_2578D469C;
  *v4 = byte_2578D4688;
  *(_OWORD *)(v4 + 4) = v6;
  *(_QWORD *)(v4 + 20) = v7;
  *((_QWORD *)v4 + 4) = v5;
  v3[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled] = 1;

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for StickerEffect();
  return objc_msgSendSuper2(&v9, sel_init);
}

id StickerEffect.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerEffect();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StickerEffect()
{
  return objc_opt_self();
}

uint64_t sub_249D750E8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____VKStickerEffectInternal_type);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_249D75138(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____VKStickerEffectInternal_type);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_249D75184@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_isStroked, a2);
}

uint64_t sub_249D75190(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_isStroked);
}

float sub_249D7519C@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_strokeRadius, a2);
}

uint64_t sub_249D751A8(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_4Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_strokeRadius);
}

float sub_249D751B4@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius, a2);
}

uint64_t sub_249D751C0(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_4Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius);
}

float sub_249D751CC@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier, a2);
}

uint64_t sub_249D751D8(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_4Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier);
}

uint64_t sub_249D751E4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier, a2);
}

uint64_t sub_249D751F0(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier);
}

uint64_t sub_249D751FC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_isPuffy, a2);
}

uint64_t sub_249D75208(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_isPuffy);
}

float sub_249D75214@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_normalsRadius, a2);
}

uint64_t sub_249D75220(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_4Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_normalsRadius);
}

uint64_t sub_249D7522C@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  _DWORD *v3;
  uint64_t result;

  v3 = (_DWORD *)(*a1 + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_249D7527C(int *a1, _QWORD *a2)
{
  int v2;
  _DWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_DWORD *)(*a2 + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_249D752C8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke, a2);
}

uint64_t sub_249D752D4(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke);
}

uint64_t sub_249D752E0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_isBrushed, a2);
}

uint64_t sub_249D752EC(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_isBrushed);
}

uint64_t sub_249D752F8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke, a2);
}

uint64_t sub_249D75304(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke);
}

float sub_249D75310@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_shadowRadius, a2);
}

uint64_t sub_249D7531C(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_4Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_shadowRadius);
}

float sub_249D75328@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_shadowAlpha, a2);
}

uint64_t sub_249D75334(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_4Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_shadowAlpha);
}

double sub_249D75340@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_27Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_shadowOffset, a2);
}

uint64_t sub_249D7534C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_28Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_shadowOffset);
}

double sub_249D75358@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_27Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_shadowParallax, a2);
}

double keypath_get_27Tm@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  double *v4;
  double result;

  v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  result = *v4;
  *a3 = *(_QWORD *)v4;
  return result;
}

uint64_t sub_249D753B0(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_28Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_shadowParallax);
}

uint64_t keypath_set_28Tm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

float sub_249D7540C@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier, a2);
}

uint64_t sub_249D75418(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_4Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier);
}

float sub_249D75424@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier, a2);
}

float keypath_get_3Tm@<S0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _DWORD *a3@<X8>)
{
  float *v4;
  float result;

  v4 = (float *)(*a1 + *a2);
  swift_beginAccess();
  result = *v4;
  *a3 = *(_DWORD *)v4;
  return result;
}

uint64_t sub_249D7547C(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_4Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier);
}

uint64_t keypath_set_4Tm(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  int v5;
  _DWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_DWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t sub_249D754D8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_isComicEnabled, a2);
}

uint64_t sub_249D754E4(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_isComicEnabled);
}

uint64_t sub_249D754F0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled, a2);
}

uint64_t keypath_get_1Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _BYTE *a3@<X8>)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_249D75548(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled);
}

uint64_t keypath_set_2Tm(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_BYTE *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t method lookup function for StickerEffect()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StickerEffect.type.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of StickerEffect.type.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of StickerEffect.type.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of StickerEffect.isStroked.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of StickerEffect.isStroked.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of StickerEffect.isStroked.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of StickerEffect.strokeRadius.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of StickerEffect.strokeRadius.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of StickerEffect.strokeRadius.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of StickerEffect.strokeBlurRadius.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of StickerEffect.strokeBlurRadius.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of StickerEffect.strokeBlurRadius.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of StickerEffect.smallStrokeRadiusMultiplier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of StickerEffect.smallStrokeRadiusMultiplier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of StickerEffect.smallStrokeRadiusMultiplier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of StickerEffect.forceSmallStrokeRadiusMultiplier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of StickerEffect.forceSmallStrokeRadiusMultiplier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of StickerEffect.forceSmallStrokeRadiusMultiplier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of StickerEffect.isPuffy.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of StickerEffect.isPuffy.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of StickerEffect.isPuffy.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of StickerEffect.normalsRadius.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of StickerEffect.normalsRadius.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of StickerEffect.normalsRadius.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of StickerEffect.iridescence.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of StickerEffect.iridescence.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of StickerEffect.iridescence.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of StickerEffect.applyIridescenceBeforeStroke.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of StickerEffect.applyIridescenceBeforeStroke.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of StickerEffect.applyIridescenceBeforeStroke.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of StickerEffect.isBrushed.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of StickerEffect.isBrushed.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of StickerEffect.isBrushed.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of StickerEffect.applyBrushBeforeStroke.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of StickerEffect.applyBrushBeforeStroke.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of StickerEffect.applyBrushBeforeStroke.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of StickerEffect.shadowRadius.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of StickerEffect.shadowRadius.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of StickerEffect.shadowRadius.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of StickerEffect.shadowAlpha.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of StickerEffect.shadowAlpha.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x238))();
}

uint64_t dispatch thunk of StickerEffect.shadowAlpha.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of StickerEffect.shadowOffset.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x248))();
}

uint64_t dispatch thunk of StickerEffect.shadowOffset.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x250))();
}

uint64_t dispatch thunk of StickerEffect.shadowOffset.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x258))();
}

uint64_t dispatch thunk of StickerEffect.shadowParallax.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x260))();
}

uint64_t dispatch thunk of StickerEffect.shadowParallax.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x268))();
}

uint64_t dispatch thunk of StickerEffect.shadowParallax.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of StickerEffect.smallShadowSizeMultiplier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x278))();
}

uint64_t dispatch thunk of StickerEffect.smallShadowSizeMultiplier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x280))();
}

uint64_t dispatch thunk of StickerEffect.smallShadowSizeMultiplier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x288))();
}

uint64_t dispatch thunk of StickerEffect.smallShadowAlphaMultiplier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x290))();
}

uint64_t dispatch thunk of StickerEffect.smallShadowAlphaMultiplier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x298))();
}

uint64_t dispatch thunk of StickerEffect.smallShadowAlphaMultiplier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of StickerEffect.isComicEnabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of StickerEffect.isComicEnabled.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of StickerEffect.isComicEnabled.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of StickerEffect.requiresDeviceMotion.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of StickerEffect.isCurlEnabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of StickerEffect.isCurlEnabled.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of StickerEffect.isCurlEnabled.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of StickerEffect.applyComicParameters()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of StickerEffect.applyComicInkParameters()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x300))();
}

id sub_249D75C90(void *a1)
{
  uint64_t v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = vcvt_f32_f64(*(float64x2_t *)(v1 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size));
  return objc_msgSend(a1, sel_setFragmentBytes_length_atIndex_, v3, 8, 0);
}

id sub_249D75D04()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerComicColorStrokeShader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicColorStrokeShader()
{
  return objc_opt_self();
}

id sub_249D75D54(void *a1)
{
  return sub_249D75E28(a1, &OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassOneShader_sigma, &OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassOneShader_sigmaColor);
}

id sub_249D75DA8()
{
  return sub_249D75EC4(type metadata accessor for StickerComicBFBlurPassOneShader);
}

uint64_t type metadata accessor for StickerComicBFBlurPassOneShader()
{
  return objc_opt_self();
}

id sub_249D75DD4(void *a1)
{
  return sub_249D75E28(a1, &OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassTwoShader_sigma, &OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassTwoShader_sigmaColor);
}

id sub_249D75E28(void *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  float v4;
  float v5;
  float32x2_t v6;
  _DWORD v8[2];
  float32x2_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(double *)(v3 + *a2);
  v5 = *(double *)(v3 + *a3);
  v6 = vcvt_f32_f64(*(float64x2_t *)(v3 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size));
  *(float *)v8 = v4;
  *(float *)&v8[1] = v5;
  v9 = v6;
  return objc_msgSend(a1, sel_setFragmentBytes_length_atIndex_, v8, 16, 0);
}

id sub_249D75EB8()
{
  return sub_249D75EC4(type metadata accessor for StickerComicBFBlurPassTwoShader);
}

id sub_249D75EC4(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicBFBlurPassTwoShader()
{
  return objc_opt_self();
}

uint64_t sub_249D75F14(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t ObjCClassFromMetadata;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id v20[2];

  v3 = v1;
  v20[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (qword_2578D3BD8 != -1)
    swift_once();
  v5 = (void *)qword_2578D3E40;
  *(_QWORD *)(v1 + 16) = a1;
  *(_OWORD *)(v1 + 32) = xmmword_249D8C530;
  *(_QWORD *)(v1 + 48) = 0;
  *(_QWORD *)(v1 + 56) = v5;
  *(_DWORD *)(v1 + 64) = 1065353216;
  *(_QWORD *)(v1 + 72) = 0x3F0000003F000000;
  *(_DWORD *)(v1 + 80) = 1065353216;
  *(_OWORD *)(v1 + 88) = 0u;
  *(_OWORD *)(v1 + 104) = 0u;
  *(_OWORD *)(v1 + 120) = 0u;
  *(_OWORD *)(v1 + 136) = 0u;
  *(_OWORD *)(v1 + 152) = 0u;
  *(_OWORD *)(v1 + 168) = 0u;
  type metadata accessor for StickerEffectRenderer();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = (void *)objc_opt_self();
  v8 = v5;
  swift_unknownObjectRetain();
  v9 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v20[0] = 0;
  v10 = objc_msgSend(a1, sel_newDefaultLibraryWithBundle_error_, v9, v20);

  v11 = v20[0];
  if (v10)
  {
    *(_QWORD *)(v3 + 24) = v10;
    type metadata accessor for StickerShaderAlphaToLumaGenerator();
    swift_allocObject();
    swift_unknownObjectRetain();
    v12 = v11;
    swift_unknownObjectRetain();
    v13 = sub_249D7A79C(a1, v10);
    v14 = v2 == 0;
    if (!v2)
    {
      *(_QWORD *)(v3 + 184) = v13;
      type metadata accessor for StickerShaderStrokeGenerator();
      swift_allocObject();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      *(_QWORD *)(v3 + 192) = sub_249D8A6E0(a1, v10);
      type metadata accessor for StickerShaderNormalGenerator();
      swift_allocObject();
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      *(_QWORD *)(v3 + 200) = sub_249D79930(a1, v10);
      type metadata accessor for StickerShaderShadowGenerator();
      v18 = swift_allocObject();
      *(_DWORD *)(v18 + 24) = 1036831949;
      *(_QWORD *)(v18 + 32) = 0;
      *(_QWORD *)(v18 + 40) = 0;
      *(_QWORD *)(v18 + 48) = 0;
      *(_QWORD *)(v18 + 56) = 10;
      *(_QWORD *)(v18 + 16) = a1;
      *(_QWORD *)(v3 + 208) = v18;
      type metadata accessor for StickerComicRenderer();
      swift_allocObject();
      v19 = swift_unknownObjectRetain();
      *(_QWORD *)(v3 + 216) = StickerComicRenderer.init(device:)(v19);
      return v3;
    }
    swift_unknownObjectRelease();
  }
  else
  {
    v15 = v20[0];
    sub_249D8B81C();

    swift_willThrow();
    v14 = 0;
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v16 = *(void **)(v3 + 48);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v14)
    swift_release();
  swift_deallocPartialClassInstance();
  return v3;
}

void sub_249D762FC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char *v9;
  id v10;
  int64_t v11;
  __CVBuffer *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  int8x16_t v20;
  __n64 v21;
  unint64_t v22;
  __n64 *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  float *v31;
  float v32;
  float v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  CVPixelBufferRef v37;
  float v38;
  uint64_t v39;
  int v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v54;
  char v55[4];
  __int128 v56;
  uint64_t v57;
  uint64_t v58;

  v5 = *(void **)(v3 + 48);
  if (!v5)
    return;
  v6 = v3;
  v54 = v4;
  v9 = (char *)*(id *)(v3 + 56);
  v10 = v5;
  v12 = (__CVBuffer *)sub_249D776F8(v10, a2, a3);
  v13 = v11;
  v14 = *(void **)(v3 + 136);
  if (!v14)
  {
    v37 = sub_249D77F6C(v10, v12, v11, *(void **)(v3 + 16));
    if (v4)
      goto LABEL_23;
    v54 = 0;
    *(_QWORD *)(v3 + 136) = v37;
    swift_unknownObjectRelease();
    *(_QWORD *)(v3 + 152) = 0;
    swift_unknownObjectRelease();
    *(_QWORD *)(v3 + 160) = 0;
    swift_unknownObjectRelease();
    *(_QWORD *)(v3 + 176) = 0;
    swift_unknownObjectRelease();
    *(_QWORD *)(v3 + 168) = 0;
    swift_unknownObjectRelease();
    v14 = *(void **)(v3 + 136);
    if (!v14)
    {
LABEL_23:

      return;
    }
  }
  v52 = v10;
  if (*(_QWORD *)(v3 + 144)
    || (v15 = &v9[OBJC_IVAR____VKStickerEffectInternal_isComicEnabled], swift_beginAccess(), (*v15 & 1) == 0))
  {
    swift_unknownObjectRetain();
  }
  else
  {
    v16 = (void *)objc_opt_self();
    swift_unknownObjectRetain();
    v17 = objc_msgSend(v16, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, v12, v13, 0);
    objc_msgSend(v17, sel_setStorageMode_, 2);
    objc_msgSend(v17, sel_setUsage_, 5);
    *(_QWORD *)(v6 + 144) = objc_msgSend(*(id *)(v6 + 16), sel_newTextureWithDescriptor_, v17);
    swift_unknownObjectRelease();
    v18 = *(void **)(v6 + 144);
    if (!v18)
    {

      swift_unknownObjectRelease();
      return;
    }
    v19 = *(_QWORD *)&v9[OBJC_IVAR____VKStickerEffectInternal_comicParameters + 32];
    v55[0] = v9[OBJC_IVAR____VKStickerEffectInternal_comicParameters];
    v56 = *(_OWORD *)&v9[OBJC_IVAR____VKStickerEffectInternal_comicParameters + 4];
    v57 = *(_QWORD *)&v9[OBJC_IVAR____VKStickerEffectInternal_comicParameters + 20];
    v58 = v19;
    swift_unknownObjectRetain();
    swift_retain();
    sub_249D7C014(v14, v18, v55, a1, v20);
    if (v54)
    {

      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

      swift_release();
      return;
    }
    swift_unknownObjectRelease();

    swift_release();
  }
  v21.n64_u64[0] = sub_249D7865C(*(_QWORD *)(v6 + 56), (uint64_t)v12, v13, a2, a3, *(float *)(v6 + 64)).n64_u64[0];
  v22 = v21.n64_u64[0];
  if (!*(_QWORD *)(v6 + 152))
  {
    v23 = *(__n64 **)(v6 + 184);
    v23[7].n64_u64[0] = v21.n64_u64[0];
    v23[6].n64_u64[0] = (unint64_t)v14;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    v24 = *(_QWORD **)(v6 + 184);
    v26 = v24[8];
    v25 = v24[9];
    v24[8] = a2;
    v24[9] = a3;
    if (v26 != a2 || v25 != a3)
    {
      v24[10] = 0;
      swift_unknownObjectRelease();
    }
    swift_retain();
    sub_249D7AB8C(a1);
    v28 = v27;
    swift_release();
    *(_QWORD *)(v6 + 152) = v28;
    swift_unknownObjectRelease();
    *(_QWORD *)(v6 + 160) = 0;
    swift_unknownObjectRelease();
  }
  v29 = &v9[OBJC_IVAR____VKStickerEffectInternal_isStroked];
  swift_beginAccess();
  if (*v29 == 1 && !*(_QWORD *)(v6 + 160))
  {
    v38 = sub_249D8B2BC((uint64_t)v9, a2, a3, *(float *)(v6 + 64));
    v39 = *(_QWORD *)(v6 + 192);
    *(_QWORD *)(v39 + 64) = v22;
    *(float *)(v39 + 48) = v38;
    *(_DWORD *)(v39 + 52) = v40;
    *(_QWORD *)(v39 + 56) = *(_QWORD *)(v6 + 152);
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    v41 = *(_QWORD **)(v6 + 192);
    v43 = v41[9];
    v42 = v41[10];
    v41[9] = a2;
    v41[10] = a3;
    if (v43 != a2 || v42 != a3)
    {
      v41[12] = 0;
      swift_unknownObjectRelease();
    }
    swift_retain();
    sub_249D8AB5C(a1);
    v45 = v44;
    swift_release();
    *(_QWORD *)(v6 + 160) = v45;
    swift_unknownObjectRelease();
    *(_QWORD *)(v6 + 176) = 0;
    swift_unknownObjectRelease();
    *(_QWORD *)(v6 + 168) = 0;
    swift_unknownObjectRelease();
    if (*(_QWORD *)(v6 + 176))
      goto LABEL_30;
    goto LABEL_17;
  }
  if (!*(_QWORD *)(v6 + 176))
  {
LABEL_17:
    v30 = *(_QWORD *)(v6 + 208);
    v31 = (float *)&v9[OBJC_IVAR____VKStickerEffectInternal_shadowRadius];
    swift_beginAccess();
    v32 = *v31;
    v33 = *(float *)(v30 + 24);
    *(float *)(v30 + 24) = *v31;
    if (v32 != v33)
    {
      v34 = *(void **)(v30 + 48);
      *(_QWORD *)(v30 + 48) = 0;

    }
    v35 = *(_QWORD *)(v6 + 160);
    if (!v35)
    {
      v35 = *(_QWORD *)(v6 + 152);
      swift_unknownObjectRetain();
    }
    swift_unknownObjectRetain();
    swift_retain();
    sub_249D7A364(v35);
    swift_release();
    swift_retain();
    v36 = sub_249D7A3D4((uint64_t)a1);
    swift_release();
    *(_QWORD *)(v6 + 176) = v36;
    swift_unknownObjectRelease();
    *(_QWORD *)(v6 + 168) = 0;
    swift_unknownObjectRelease();
  }
LABEL_30:
  v46 = &v9[OBJC_IVAR____VKStickerEffectInternal_isPuffy];
  swift_beginAccess();
  if (*v46 == 1 && !*(_QWORD *)(v6 + 168))
  {
    v47 = *(_QWORD *)(v6 + 200);
    v48 = &v9[OBJC_IVAR____VKStickerEffectInternal_normalsRadius];
    swift_beginAccess();
    *(_DWORD *)(v47 + 48) = *(_DWORD *)v48;
    v49 = *(_QWORD *)(v47 + 56);
    *(_QWORD *)(v47 + 56) = *(_QWORD *)(v6 + 152);
    swift_unknownObjectRetain_n();
    swift_retain();
    sub_249D798E0(v49);
    swift_release();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_retain();
    sub_249D79D34(a1);
    v51 = v50;
    swift_release();

    swift_unknownObjectRelease();
    *(_QWORD *)(v6 + 168) = v51;
    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
}

unint64_t sub_249D76918(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578D4218);
  v2 = sub_249D8BA14();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_249D787A0(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_249D76F48(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_249D787E8(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_249D76A30(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578D4208);
  v2 = (_QWORD *)sub_249D8BA14();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    result = sub_249D76F48((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v4 += 2;
    v2[2] = v12;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_249D76B2C()
{
  uint64_t v0;
  void *v1;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v1 = *(void **)(v0 + 48);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_249D76BE4()
{
  sub_249D76B2C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StickerEffectRenderer()
{
  return objc_opt_self();
}

void destroy for StickerEffectRenderer.Parameters(uint64_t a1)
{

}

uint64_t initializeWithCopy for StickerEffectRenderer.Parameters(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 16);
  v4 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  v5 = v3;
  v6 = v4;
  return a1;
}

uint64_t assignWithCopy for StickerEffectRenderer.Parameters(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(void **)(a1 + 16);
  v5 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v5;

  v7 = *(void **)(a2 + 24);
  v8 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  v9 = v7;

  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy52_16(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for StickerEffectRenderer.Parameters(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;

  v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for StickerEffectRenderer.Parameters(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 52))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StickerEffectRenderer.Parameters(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 52) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 52) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StickerEffectRenderer.Parameters()
{
  return &type metadata for StickerEffectRenderer.Parameters;
}

_QWORD *sub_249D76E3C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D4230);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_249D77110(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_249D76F48(uint64_t a1)
{
  uint64_t v2;

  sub_249D8BA8C();
  type metadata accessor for CFString(0);
  sub_249D72088(&qword_2578D4210, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_249D8CA74);
  sub_249D8B834();
  v2 = sub_249D8BAA4();
  return sub_249D76FD0(a1, v2);
}

unint64_t sub_249D76FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for CFString(0);
    v6 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    sub_249D72088(&qword_2578D4210, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_249D8CA74);
    v7 = v6;
    v8 = sub_249D8B828();

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = sub_249D8B828();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

char *sub_249D77110(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_249D8BA20();
  __break(1u);
  return result;
}

_QWORD *sub_249D771F8()
{
  _QWORD *v0;
  _BYTE *v1;
  _QWORD *result;
  int64_t v3;
  int64_t v4;
  _QWORD *v5;
  float v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  float v23;
  uint64_t v24;
  int64_t v25;
  void *v26;
  id v33;
  unint64_t v34;
  void *v35;
  id v36;
  unint64_t v37;
  id v38;
  float v39;
  _QWORD v40[4];
  uint64_t v41;
  _QWORD v42[4];

  v1 = (_BYTE *)(v0[7] + OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled);
  result = (_QWORD *)swift_beginAccess();
  if (*v1 != 1)
  {
    v0[11] = 4;
    v26 = (void *)v0[2];
    __asm { FMOV            V0.2S, #-1.0 }
    v42[0] = _D0;
    v42[1] = 0xBF8000003F800000;
    __asm { FMOV            V8.2S, #1.0 }
    v42[2] = 0x3F800000BF800000;
    v42[3] = _D8;
    v33 = objc_msgSend(v26, sel_newBufferWithBytes_length_options_, v42, 32, 0);
    if (!v33
      || (v0[12] = v33,
          swift_unknownObjectRelease(),
          v40[0] = 0x3F80000000000000,
          v40[1] = _D8,
          v40[2] = 0,
          v40[3] = 1065353216,
          (v33 = objc_msgSend(v26, sel_newBufferWithBytes_length_options_, v40, 32, 0)) == 0))
    {
LABEL_38:
      type metadata accessor for MTLCommandBufferError((uint64_t)v33);
      v41 = 1;
      sub_249D883F8(MEMORY[0x24BEE4AF8]);
      sub_249D72088((unint64_t *)&qword_2578D3D00, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C964);
      sub_249D8B804();
      return (_QWORD *)swift_willThrow();
    }
    v0[13] = v33;
    return (_QWORD *)swift_unknownObjectRelease();
  }
  v3 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
  v4 = v3 + 2;
  if (!__OFADD__(v3, 2))
  {
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v6 = 0.0;
    v7 = 1;
    v39 = -1.0;
    v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)result || (v9 = v5[3], v10 = v9 >> 1, (uint64_t)(v9 >> 1) < v4))
      {
        if (v3 <= v4)
          v11 = v4;
        else
          v11 = v3;
        result = sub_249D76E3C(result, v11, 1, v5);
        v5 = result;
        v9 = result[3];
        v10 = v9 >> 1;
      }
      v12 = v5[2];
      v13 = v12 + 1;
      if (v10 <= v12)
      {
        result = sub_249D76E3C((_QWORD *)(v9 > 1), v12 + 1, 1, v5);
        v5 = result;
        v9 = result[3];
        v10 = v9 >> 1;
      }
      *(float *)&v14 = v39;
      v5[2] = v13;
      v5[v12 + 4] = __PAIR64__(-1.0, LODWORD(v39));
      v15 = v12 + 2;
      if ((uint64_t)v10 < v15)
      {
        result = sub_249D76E3C((_QWORD *)(v9 > 1), v15, 1, v5);
        *(float *)&v14 = v39;
        v5 = result;
      }
      HIDWORD(v14) = 1.0;
      v5[2] = v15;
      v5[v13 + 4] = v14;
      v16 = v8[2];
      v17 = v16 + 2;
      if (__OFADD__(v16, 2))
      {
        __break(1u);
        goto LABEL_42;
      }
      result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)result || (v18 = v8[3], v19 = v18 >> 1, (uint64_t)(v18 >> 1) < v17))
      {
        if (v16 <= v17)
          v20 = v16 + 2;
        else
          v20 = v16;
        result = sub_249D76E3C(result, v20, 1, v8);
        v8 = result;
        v18 = result[3];
        v19 = v18 >> 1;
      }
      v21 = v8[2];
      v22 = v21 + 1;
      if (v19 <= v21)
      {
        result = sub_249D76E3C((_QWORD *)(v18 > 1), v21 + 1, 1, v8);
        v8 = result;
        v18 = result[3];
        v19 = v18 >> 1;
      }
      v23 = v6 / 200.0;
      *(float *)&v24 = v6 / 200.0;
      HIDWORD(v24) = 1.0;
      v8[2] = v22;
      v8[v21 + 4] = v24;
      v25 = v21 + 2;
      if ((uint64_t)v19 < v25)
      {
        result = sub_249D76E3C((_QWORD *)(v18 > 1), v25, 1, v8);
        v23 = v6 / 200.0;
        v8 = result;
      }
      v8[2] = v25;
      v8[v22 + 4] = LODWORD(v23);
      if (v7 == 201)
        break;
      v6 = (float)v7;
      v39 = (float)((float)(v6 + v6) / 200.0) + -1.0;
      v3 = v5[2];
      ++v7;
      v4 = v3 + 2;
      if (__OFADD__(v3, 2))
        goto LABEL_42;
    }
    v0[11] = v5[2];
    v34 = v5[2];
    if (v34 >> 60)
      goto LABEL_43;
    v35 = (void *)v0[2];
    v36 = objc_msgSend(v35, sel_newBufferWithBytes_length_options_, v5 + 4, 8 * v34, 0);
    swift_bridgeObjectRelease();
    if (!v36)
    {
      swift_bridgeObjectRelease();
      v33 = 0;
      goto LABEL_38;
    }
    v0[12] = v36;
    swift_unknownObjectRetain();
    result = (_QWORD *)swift_unknownObjectRelease();
    v37 = v8[2];
    if (v37 >> 60)
      goto LABEL_44;
    v38 = objc_msgSend(v35, sel_newBufferWithBytes_length_options_, v8 + 4, 8 * v37, 0);
    swift_bridgeObjectRelease();
    if (v38)
    {
      swift_unknownObjectRelease();
      v0[13] = v38;
    }
    else
    {
      type metadata accessor for MTLCommandBufferError(0);
      v41 = 1;
      sub_249D883F8(MEMORY[0x24BEE4AF8]);
      sub_249D72088((unint64_t *)&qword_2578D3D00, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C964);
      sub_249D8B804();
      swift_willThrow();
    }
    return (_QWORD *)swift_unknownObjectRelease();
  }
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
  return result;
}

id sub_249D776F8(void *a1, uint64_t a2, uint64_t a3)
{
  double v6;
  double v7;
  id result;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;

  objc_msgSend(a1, sel_size);
  v7 = v6;
  result = objc_msgSend(a1, sel_scale);
  v10 = v7 * v9;
  if ((~COERCE__INT64(v7 * v9) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v10 >= 9.22337204e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  objc_msgSend(a1, sel_size);
  v12 = v11;
  result = objc_msgSend(a1, sel_scale);
  v14 = v12 * v13;
  if ((~*(_QWORD *)&v14 & 0x7FF0000000000000) == 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v14 <= -9.22337204e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v14 >= 9.22337204e18)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v15 = (float)((float)(uint64_t)v14 / (float)(uint64_t)v10) / (float)((float)a3 / (float)a2);
  v16 = 1.0;
  v17 = 1.0 / v15;
  if (v15 <= 1.0)
  {
    v17 = 1.0;
    v16 = v15;
  }
  v18 = ceilf(v17 * (float)a2);
  if ((~LODWORD(v18) & 0x7F800000) == 0)
    goto LABEL_22;
  if (v18 <= -9.2234e18)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v18 >= 9.2234e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v19 = ceilf(v16 * (float)a3);
  if ((~LODWORD(v19) & 0x7F800000) == 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v19 <= -9.2234e18)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v19 < 9.2234e18)
    return (id)(uint64_t)v18;
LABEL_27:
  __break(1u);
  return result;
}

void sub_249D778BC(void *a1, void *a2, uint64_t a3)
{
  char *v6;
  int *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  int v45;
  char v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)(a3 + OBJC_IVAR____VKStickerEffectInternal_isStroked);
  swift_beginAccess();
  v46 = *v6;
  v7 = (int *)(a3 + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  swift_beginAccess();
  v45 = *v7;
  v8 = (char *)(a3 + OBJC_IVAR____VKStickerEffectInternal_isPuffy);
  swift_beginAccess();
  v44 = *v8;
  v9 = (char *)(a3 + OBJC_IVAR____VKStickerEffectInternal_isBrushed);
  swift_beginAccess();
  v43 = *v9;
  v10 = (char *)(a3 + OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke);
  swift_beginAccess();
  v42 = *v10;
  v11 = (char *)(a3 + OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke);
  swift_beginAccess();
  v41 = *v11;
  v12 = (char *)(a3 + OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled);
  swift_beginAccess();
  v40 = *v12;
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDD5A0]), sel_init);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v46, 53, 0);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v45, 29, 1);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v44, 53, 2);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v43, 53, 3);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v42, 53, 4);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v41, 53, 5);
  objc_msgSend(v13, sel_setConstantValue_type_atIndex_, &v40, 53, 6);
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDD6B8]), sel_init);
  v15 = (void *)sub_249D8B8B8();
  v39 = 0;
  v16 = objc_msgSend(a2, sel_newFunctionWithName_constantValues_error_, v15, v13, &v39);

  if (!v16
    || (v17 = v39,
        objc_msgSend(v14, sel_setVertexFunction_, v16),
        swift_unknownObjectRelease(),
        v18 = (void *)sub_249D8B8B8(),
        v39 = 0,
        v19 = objc_msgSend(a2, sel_newFunctionWithName_constantValues_error_, v18, v13, &v39),
        v18,
        !v19))
  {
LABEL_13:
    v38 = v39;
    sub_249D8B81C();

    swift_willThrow();
    return;
  }
  v20 = v39;
  objc_msgSend(v14, sel_setFragmentFunction_, v19);
  swift_unknownObjectRelease();
  v21 = objc_msgSend(v14, sel_colorAttachments);
  v22 = objc_msgSend(v21, sel_objectAtIndexedSubscript_, 0);

  if (!v22)
  {
    __break(1u);
    goto LABEL_15;
  }
  objc_msgSend(v22, sel_setPixelFormat_, 80);

  v23 = objc_msgSend(v14, sel_colorAttachments);
  v24 = objc_msgSend(v23, sel_objectAtIndexedSubscript_, 0);

  if (!v24)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  objc_msgSend(v24, sel_setBlendingEnabled_, 1);

  v25 = objc_msgSend(v14, sel_colorAttachments);
  v26 = objc_msgSend(v25, sel_objectAtIndexedSubscript_, 0);

  if (!v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  objc_msgSend(v26, sel_setRgbBlendOperation_, 0);

  v27 = objc_msgSend(v14, sel_colorAttachments);
  v28 = objc_msgSend(v27, sel_objectAtIndexedSubscript_, 0);

  if (!v28)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  objc_msgSend(v28, sel_setSourceRGBBlendFactor_, 4);

  v29 = objc_msgSend(v14, sel_colorAttachments);
  v30 = objc_msgSend(v29, sel_objectAtIndexedSubscript_, 0);

  if (!v30)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  objc_msgSend(v30, sel_setDestinationRGBBlendFactor_, 5);

  v31 = objc_msgSend(v14, sel_colorAttachments);
  v32 = objc_msgSend(v31, sel_objectAtIndexedSubscript_, 0);

  if (!v32)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  objc_msgSend(v32, sel_setAlphaBlendOperation_, 0);

  v33 = objc_msgSend(v14, sel_colorAttachments);
  v34 = objc_msgSend(v33, sel_objectAtIndexedSubscript_, 0);

  if (!v34)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  objc_msgSend(v34, sel_setSourceAlphaBlendFactor_, 1);

  v35 = objc_msgSend(v14, sel_colorAttachments);
  v36 = objc_msgSend(v35, sel_objectAtIndexedSubscript_, 0);

  if (v36)
  {
    objc_msgSend(v36, sel_setDestinationAlphaBlendFactor_, 5);

    objc_msgSend(v14, sel_setDepthAttachmentPixelFormat_, 252);
    v39 = 0;
    if (objc_msgSend(a1, sel_newRenderPipelineStateWithDescriptor_error_, v14, &v39))
    {
      v37 = v39;

      return;
    }
    goto LABEL_13;
  }
LABEL_21:
  __break(1u);
}

CVPixelBufferRef sub_249D77F6C(void *a1, CVPixelBufferRef a2, int64_t a3, void *a4)
{
  CGColorSpaceRef DeviceRGB;
  const __CFAllocator *v9;
  CVReturn v10;
  CVMetalTextureCacheRef v11;
  BOOL v12;
  CVReturn v13;
  uint64_t v14;
  uint64_t inited;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __CVBuffer *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  const __CFDictionary *v33;
  uint64_t v34;
  void *v35;
  id v36;
  const __CFDictionary *v37;
  CVReturn v38;
  CVReturn v39;
  __CVPixelBufferPool *v40;
  CVReturn v41;
  void *BaseAddress;
  void *v43;
  size_t BytesPerRow;
  CGContext *v45;
  CGContext *v46;
  double v47;
  double v48;
  CVReturn v49;
  CVPixelBufferRef v50;
  __CVBuffer *v51;
  __CVBuffer *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  id v59;
  int64_t v60;
  int64_t v61;
  CVMetalTextureCacheRef textureCache;
  CGColorSpaceRef v63;
  const __CFAllocator *v64;
  CGContext *v65;
  CVMetalTextureRef textureOut;
  CVPixelBufferRef pixelBufferOut;
  CVPixelBufferPoolRef poolOut;
  CVMetalTextureCacheRef cacheOut[3];

  cacheOut[1] = *(CVMetalTextureCacheRef *)MEMORY[0x24BDAC8D0];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  cacheOut[0] = 0;
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a4, 0, cacheOut);
  v11 = cacheOut[0];
  if (v10)
    v12 = 1;
  else
    v12 = cacheOut[0] == 0;
  if (v12)
  {
    v13 = v10;
    sub_249D7875C();
    swift_allocError();
    *(_DWORD *)v14 = v13;
    *(_BYTE *)(v14 + 4) = 0;
    swift_willThrow();

LABEL_31:
    return a2;
  }
  v59 = a1;
  v63 = DeviceRGB;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D4270);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_249D8CCB0;
  v16 = (void *)*MEMORY[0x24BDC5708];
  v17 = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDC5708];
  *(_QWORD *)(inited + 40) = a2;
  v61 = (int64_t)a2;
  a2 = (CVPixelBufferRef)*MEMORY[0x24BDC5650];
  *(_QWORD *)(inited + 64) = v17;
  *(_QWORD *)(inited + 72) = a2;
  v60 = a3;
  *(_QWORD *)(inited + 80) = a3;
  v18 = (void *)*MEMORY[0x24BDC56B8];
  *(_QWORD *)(inited + 104) = v17;
  *(_QWORD *)(inited + 112) = v18;
  v19 = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 120) = 1111970369;
  v64 = v9;
  v20 = (void *)*MEMORY[0x24BDC55E8];
  *(_QWORD *)(inited + 144) = v19;
  *(_QWORD *)(inited + 152) = v20;
  v21 = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 160) = 1;
  v22 = (void *)*MEMORY[0x24BDC55E0];
  *(_QWORD *)(inited + 184) = v21;
  *(_QWORD *)(inited + 192) = v22;
  *(_BYTE *)(inited + 200) = 1;
  v23 = (void *)*MEMORY[0x24BDC5690];
  *(_QWORD *)(inited + 224) = v21;
  *(_QWORD *)(inited + 232) = v23;
  *(_BYTE *)(inited + 240) = 1;
  v24 = (void *)*MEMORY[0x24BDC5668];
  *(_QWORD *)(inited + 264) = v21;
  *(_QWORD *)(inited + 272) = v24;
  textureCache = v11;
  v25 = v16;
  v26 = a2;
  v27 = v18;
  v28 = v20;
  v29 = v22;
  v30 = v23;
  v31 = v24;
  v32 = sub_249D76918(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(inited + 304) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D41F0);
  *(_QWORD *)(inited + 280) = v32;
  sub_249D76918(inited);
  type metadata accessor for CFString(0);
  sub_249D72088((unint64_t *)&qword_2578D3D08, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_249D8CAA0);
  v33 = (const __CFDictionary *)sub_249D8B8A0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578D4200);
  v34 = swift_initStackObject();
  *(_OWORD *)(v34 + 16) = xmmword_249D8CCC0;
  v35 = (void *)*MEMORY[0x24BDC56E0];
  *(_QWORD *)(v34 + 32) = *MEMORY[0x24BDC56E0];
  *(_QWORD *)(v34 + 40) = 1;
  v36 = v35;
  sub_249D76A30(v34);
  v37 = (const __CFDictionary *)sub_249D8B8A0();
  swift_bridgeObjectRelease();
  poolOut = 0;
  v38 = CVPixelBufferPoolCreate(v64, v37, v33, &poolOut);
  v39 = v38;
  if (v38 || !poolOut)
  {
    sub_249D7875C();
    swift_allocError();
    *(_DWORD *)v53 = v39;
    *(_BYTE *)(v53 + 4) = 0;
    swift_willThrow();

LABEL_30:
    goto LABEL_31;
  }
  pixelBufferOut = 0;
  v40 = poolOut;
  v41 = CVPixelBufferPoolCreatePixelBuffer(v64, v40, &pixelBufferOut);
  if (v41 || !pixelBufferOut)
  {
    sub_249D7875C();
    swift_allocError();
    *(_DWORD *)v54 = v41;
    *(_BYTE *)(v54 + 4) = 0;
    swift_willThrow();
LABEL_28:

LABEL_29:
    goto LABEL_30;
  }
  a2 = pixelBufferOut;
  CVPixelBufferLockBaseAddress(a2, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(a2);
  if (!BaseAddress)
  {
    sub_249D7875C();
    swift_allocError();
    *(_DWORD *)v55 = 0;
LABEL_27:
    *(_BYTE *)(v55 + 4) = 1;
    swift_willThrow();

    goto LABEL_28;
  }
  v43 = BaseAddress;
  BytesPerRow = CVPixelBufferGetBytesPerRow(a2);
  v45 = CGBitmapContextCreate(v43, v61, v60, 8uLL, BytesPerRow, v63, 0x2002u);
  if (!v45)
  {
    sub_249D7875C();
    swift_allocError();
    *(_DWORD *)v55 = 1;
    goto LABEL_27;
  }
  v46 = v45;
  v47 = (double)v60;
  CGContextTranslateCTM(v45, 0.0, (double)v60);
  CGContextScaleCTM(v46, 1.0, -1.0);
  UIGraphicsPushContext(v46);
  v48 = (double)v61;
  objc_msgSend(v59, sel_drawInRect_, 0.0, 0.0, (double)v61, (double)v60);
  UIGraphicsPopContext();
  CVPixelBufferUnlockBaseAddress(a2, 0);
  textureOut = 0;
  if ((double)v61 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v48 >= 9.22337204e18)
  {
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if ((*(_QWORD *)&v48 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(_QWORD *)&v47 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_38;
  }
  if (v47 <= -9.22337204e18)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
  }
  if (v47 >= 9.22337204e18)
    goto LABEL_40;
  v49 = CVMetalTextureCacheCreateTextureFromImage(v64, textureCache, a2, 0, MTLPixelFormatBGRA8Unorm, (uint64_t)v48, (uint64_t)v47, 0, &textureOut);
  if (v49 || !textureOut)
  {
    sub_249D7875C();
    swift_allocError();
    *(_DWORD *)v57 = v49;
    *(_BYTE *)(v57 + 4) = 0;
    swift_willThrow();

LABEL_35:
    goto LABEL_29;
  }
  v65 = v46;
  v50 = a2;
  v51 = textureOut;
  v52 = (__CVBuffer *)CVMetalTextureGetTexture(v51);
  if (!v52)
  {
    sub_249D7875C();
    swift_allocError();
    *(_DWORD *)v58 = 2;
    *(_BYTE *)(v58 + 4) = 1;
    swift_willThrow();

    goto LABEL_35;
  }
  a2 = v52;

  return a2;
}

__n64 sub_249D7865C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, float a6)
{
  float v12;
  float v13;
  float v14;
  float v15;
  int32x2_t v16;
  int32x2_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float v25;
  float v26;
  float v27;
  __n64 result;

  v12 = sub_249D8B2BC(a1, a4, a5, a6);
  v14 = v13;
  v15 = sub_249D7A5F4(a1, a4, a5, a6);
  v18 = (float)((float)a3 / (float)a2) / (float)((float)a5 / (float)a4);
  v19 = 1.0 / v18;
  if (v18 <= 1.0)
    v19 = 1.0;
  v20 = fabsf(*(float *)v16.i32);
  v21 = fabsf(*(float *)v17.i32);
  v23 = vabs_f32((float32x2_t)vzip2_s32(v16, v17));
  v22 = (float32x2_t)vdup_lane_s32((int32x2_t)v23, 0);
  v22.f32[0] = v20;
  v23.f32[0] = v21;
  if (v18 > 1.0)
    v18 = 1.0;
  v24 = vadd_f32(v22, v23);
  if (v24.f32[0] <= v24.f32[1])
    v24.f32[0] = v24.f32[1];
  v25 = 1.0 - (float)((float)(v15 + v24.f32[0]) + (float)(v15 + v24.f32[0]));
  v26 = 1.0 - (float)((float)(v12 + v14) + (float)(v12 + v14));
  v27 = v26 * v18;
  result.n64_f32[0] = v25 * (float)(v26 * v19);
  result.n64_f32[1] = v25 * v27;
  return result;
}

unint64_t sub_249D7875C()
{
  unint64_t result;

  result = qword_2578D41E0;
  if (!qword_2578D41E0)
  {
    result = MEMORY[0x24BD03DD8](&unk_249D8CE10, &type metadata for StickerEffectRenderer.TextureError);
    atomic_store(result, (unint64_t *)&qword_2578D41E0);
  }
  return result;
}

uint64_t sub_249D787A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D4220);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_249D787E8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

float sub_249D787F8(uint64_t a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  float v10;
  int32x2_t v11;
  float v12;
  int32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;

  sub_249D8B2BC(a1, a5, a6, a2);
  v10 = sub_249D7A5F4(a1, a5, a6, a2);
  v12 = fabsf(*(float *)v11.i32);
  v14 = vabs_f32((float32x2_t)vzip2_s32(v11, v13));
  v15 = (float32x2_t)vdup_lane_s32((int32x2_t)v14, 0);
  v15.f32[0] = v12;
  v14.i32[0] = fabsf(*(float *)v13.i32);
  v16 = vadd_f32(v15, v14);
  if (v16.f32[0] <= v16.f32[1])
    v16.f32[0] = v16.f32[1];
  return 1.0 - (float)((float)(v10 + v16.f32[0]) + (float)(v10 + v16.f32[0]));
}

void sub_249D788EC(__n128 *a1, void *a2, id a3)
{
  uint64_t v3;
  id v6;
  id v7;
  char *v8;
  void *v9;
  char *v10;
  float v11;
  id v12;
  char *v13;
  char *v14;
  int v15;
  char *v16;
  char *v17;
  int v18;
  char *v19;
  float *v20;
  float v21;
  float *v22;
  char *v23;
  int v24;
  char *v25;
  float *v26;
  float v27;
  float *v28;
  float *v29;
  float v30;
  float *v31;
  float32x2_t *v32;
  float32x2_t v33;
  float32x2_t *v34;
  float32x2_t v35;
  int32x2_t v36;
  float32x2_t *v37;
  int32x2_t v38;
  void *v39;
  id v40;
  char *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  BOOL v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  __n128 v55;
  id v56;
  char *v57;
  char *v58;
  uint64_t v59;
  id v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  id v86;
  float v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  int v94;
  __int128 v95;
  unint64_t v96;
  unsigned __int32 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  void *v124;
  uint64_t v125;
  id v126;
  void *v127;
  uint64_t v128;
  _OWORD v129[4];
  unint64_t v130;
  unsigned __int32 v131;
  unint64_t v132;
  int v133;
  uint64_t v134;
  uint64_t v135;
  float v136;
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(a3, sel_width);
  v126 = a3;
  v7 = objc_msgSend(a3, sel_height);
  v9 = *(void **)(v3 + 48);
  v8 = *(char **)(v3 + 56);
  v10 = (char *)a1[1].n128_u64[1];
  v127 = v9;
  v128 = (uint64_t)v7;
  v124 = v8;
  if (v10 == v8)
  {
    v40 = v9;
    v41 = v8;
    v39 = (void *)a1[1].n128_u64[0];
    if (!v39)
      goto LABEL_31;
  }
  else
  {
    v11 = *(float *)(v3 + 64);
    *(_QWORD *)(v3 + 112) = 0;
    v12 = v9;
    v13 = v8;
    swift_unknownObjectRelease();
    *(_QWORD *)(v3 + 120) = 0;
    swift_unknownObjectRelease();
    v14 = &v10[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
    swift_beginAccess();
    v15 = *v14;
    v16 = &v13[OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled];
    swift_beginAccess();
    if (v15 != *v16)
    {
      *(_QWORD *)(v3 + 96) = 0;
      swift_unknownObjectRelease();
      *(_QWORD *)(v3 + 104) = 0;
      swift_unknownObjectRelease();
    }
    v17 = &v10[OBJC_IVAR____VKStickerEffectInternal_isStroked];
    swift_beginAccess();
    v18 = *v17;
    v19 = &v13[OBJC_IVAR____VKStickerEffectInternal_isStroked];
    swift_beginAccess();
    if (v18 != *v19
      || (v20 = (float *)&v10[OBJC_IVAR____VKStickerEffectInternal_strokeRadius],
          swift_beginAccess(),
          v21 = *v20,
          v22 = (float *)&v13[OBJC_IVAR____VKStickerEffectInternal_strokeRadius],
          swift_beginAccess(),
          v21 != *v22)
      || a1[2].n128_f32[0] != v11)
    {
      *(_QWORD *)(v3 + 152) = 0;
      swift_unknownObjectRelease();
      *(_QWORD *)(v3 + 160) = 0;
      swift_unknownObjectRelease();
      *(_QWORD *)(v3 + 176) = 0;
      swift_unknownObjectRelease();
      *(_QWORD *)(v3 + 168) = 0;
      swift_unknownObjectRelease();
    }
    v23 = &v10[OBJC_IVAR____VKStickerEffectInternal_isComicEnabled];
    swift_beginAccess();
    v24 = *v23;
    v25 = &v13[OBJC_IVAR____VKStickerEffectInternal_isComicEnabled];
    swift_beginAccess();
    if (v24 != *v25
      || v10[OBJC_IVAR____VKStickerEffectInternal_comicParameters] != v13[OBJC_IVAR____VKStickerEffectInternal_comicParameters])
    {
      *(_QWORD *)(v3 + 144) = 0;
      swift_unknownObjectRelease();
    }
    v26 = (float *)&v10[OBJC_IVAR____VKStickerEffectInternal_normalsRadius];
    swift_beginAccess();
    v27 = *v26;
    v28 = (float *)&v13[OBJC_IVAR____VKStickerEffectInternal_normalsRadius];
    swift_beginAccess();
    v9 = v127;
    if (v27 != *v28)
    {
      *(_QWORD *)(v3 + 168) = 0;
      swift_unknownObjectRelease();
    }
    v29 = (float *)&v10[OBJC_IVAR____VKStickerEffectInternal_shadowRadius];
    swift_beginAccess();
    v30 = *v29;
    v31 = (float *)&v13[OBJC_IVAR____VKStickerEffectInternal_shadowRadius];
    swift_beginAccess();
    if (v30 != *v31)
      goto LABEL_19;
    v32 = (float32x2_t *)&v10[OBJC_IVAR____VKStickerEffectInternal_shadowOffset];
    swift_beginAccess();
    v33 = *v32;
    v34 = (float32x2_t *)&v13[OBJC_IVAR____VKStickerEffectInternal_shadowParallax];
    swift_beginAccess();
    v35 = *v34;
    v36 = vceq_f32(v33, *v34);
    if ((v36.i8[0] & 1) == 0
      || (v36.i8[4] & 1) == 0
      || (v37 = (float32x2_t *)&v10[OBJC_IVAR____VKStickerEffectInternal_shadowParallax],
          swift_beginAccess(),
          v38 = vceq_f32(*v37, v35),
          (v38.i8[0] & 1) == 0)
      || (v38.i8[4] & 1) == 0
      || a1[2].n128_f32[0] != v11)
    {
LABEL_19:
      *(_QWORD *)(v3 + 152) = 0;
      swift_unknownObjectRelease();
      *(_QWORD *)(v3 + 160) = 0;
      swift_unknownObjectRelease();
      *(_QWORD *)(v3 + 176) = 0;
      swift_unknownObjectRelease();
    }
    v39 = (void *)a1[1].n128_u64[0];
    if (!v39)
      goto LABEL_31;
  }
  v42 = v39;
  v44 = sub_249D776F8(v42, (uint64_t)v6, v128);
  v45 = *(void **)(v3 + 136);
  if (v45 && (v46 = v43, v44 == objc_msgSend(v45, sel_width)) && *(_QWORD *)(v3 + 136))
  {
    v47 = objc_msgSend((id)swift_unknownObjectRetain(), sel_height);
    swift_unknownObjectRelease();

    v48 = v46 == v47;
    v9 = v127;
    if (v48)
      goto LABEL_31;
  }
  else
  {

  }
  *(_QWORD *)(v3 + 136) = 0;
  swift_unknownObjectRelease();
  *(_QWORD *)(v3 + 144) = 0;
  swift_unknownObjectRelease();
LABEL_31:
  v49 = objc_msgSend(v126, sel_width);
  v50 = *(void **)(v3 + 176);
  if (!v50
    || v49 != objc_msgSend(v50, sel_width)
    || (v51 = objc_msgSend(v126, sel_height), (v52 = *(void **)(v3 + 176)) == 0)
    || v51 != objc_msgSend(v52, sel_height))
  {
    *(_QWORD *)(v3 + 152) = 0;
    swift_unknownObjectRelease();
    *(_QWORD *)(v3 + 160) = 0;
    swift_unknownObjectRelease();
    *(_QWORD *)(v3 + 168) = 0;
    swift_unknownObjectRelease();
    *(_QWORD *)(v3 + 176) = 0;
    swift_unknownObjectRelease();
  }
  if (v39)
  {
    if (!v9 || v39 != v9)
      goto LABEL_41;
  }
  else if (v9)
  {
LABEL_41:
    *(_QWORD *)(v3 + 136) = 0;
    swift_unknownObjectRelease();
    *(_QWORD *)(v3 + 144) = 0;
    swift_unknownObjectRelease();
    *(_QWORD *)(v3 + 152) = 0;
    swift_unknownObjectRelease();
    *(_QWORD *)(v3 + 160) = 0;
    swift_unknownObjectRelease();
    *(_QWORD *)(v3 + 168) = 0;
    swift_unknownObjectRelease();
    *(_QWORD *)(v3 + 176) = 0;
    swift_unknownObjectRelease();
  }
  v53 = *(void **)(v3 + 48);
  v54 = *(void **)(v3 + 56);
  v55 = a1[1];
  *(__n128 *)(v3 + 32) = *a1;
  *(__n128 *)(v3 + 48) = v55;
  *(__n128 *)(v3 + 64) = a1[2];
  *(_DWORD *)(v3 + 80) = a1[3].n128_u32[0];
  v56 = v39;
  v57 = v10;

  if (*(_QWORD *)(v3 + 96) && *(_QWORD *)(v3 + 104))
  {
    v58 = v57;
    v59 = v125;
    v60 = (id)v128;
  }
  else
  {
    v61 = v57;
    sub_249D771F8();
    v59 = v125;
    v60 = (id)v128;
    if (v125)
    {

LABEL_60:
      return;
    }
  }
  v62 = *(_QWORD *)(v3 + 112);
  if (v62)
    goto LABEL_48;
  sub_249D778BC(*(void **)(v3 + 16), *(void **)(v3 + 24), (uint64_t)v57);
  if (v59)
  {

    goto LABEL_60;
  }
  *(_QWORD *)(v3 + 112) = v64;
  swift_unknownObjectRelease();
  v62 = *(_QWORD *)(v3 + 112);
  if (!v62)
  {

LABEL_73:
    v80 = 1;
LABEL_74:
    LOBYTE(v129[0]) = v80;
    return;
  }
LABEL_48:
  v63 = *(_QWORD *)(v3 + 120);
  if (v63)
  {
    swift_unknownObjectRetain();
  }
  else
  {
    v65 = *(void **)(v3 + 16);
    v66 = objc_allocWithZone(MEMORY[0x24BDDD590]);
    swift_unknownObjectRetain();
    v67 = objc_msgSend(v66, sel_init);
    objc_msgSend(v67, sel_setDepthCompareFunction_, 3);
    objc_msgSend(v67, sel_setDepthWriteEnabled_, 1);
    v68 = objc_msgSend(v65, sel_newDepthStencilStateWithDescriptor_, v67);

    *(_QWORD *)(v3 + 120) = v68;
    swift_unknownObjectRelease();
    v63 = *(_QWORD *)(v3 + 120);
    if (!v63)
    {

      goto LABEL_72;
    }
  }
  v69 = *(void **)(v3 + 128);
  if (v69)
  {
    swift_unknownObjectRetain();
    if (v6 == objc_msgSend(v69, sel_width))
    {
      v70 = *(void **)(v3 + 128);
      if (v70)
      {
        if (v60 == objc_msgSend(v70, sel_height))
        {
          v71 = *(_QWORD *)(v3 + 128);
          if (v71)
            goto LABEL_58;
          goto LABEL_66;
        }
      }
    }
  }
  else
  {
    swift_unknownObjectRetain();
  }
  v72 = *(void **)(v3 + 16);
  v73 = objc_msgSend((id)objc_opt_self(), sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 252, v6, v60, 0);
  v74 = v57;
  v75 = v62;
  v76 = v63;
  v77 = v73;
  if (objc_msgSend(v72, sel_supportsFamily_, 1001))
    v78 = 3;
  else
    v78 = 2;
  objc_msgSend(v77, sel_setStorageMode_, v78);
  objc_msgSend(v77, sel_setUsage_, 4);
  v79 = objc_msgSend(v72, sel_newTextureWithDescriptor_, v77);

  v63 = v76;
  v62 = v75;
  v57 = v74;
  *(_QWORD *)(v3 + 128) = v79;
  swift_unknownObjectRelease();
  v71 = *(_QWORD *)(v3 + 128);
  if (!v71)
  {
LABEL_66:

    swift_unknownObjectRelease();
LABEL_72:
    swift_unknownObjectRelease();
    goto LABEL_73;
  }
LABEL_58:
  swift_unknownObjectRetain();
  sub_249D762FC(a2, (uint64_t)v6, v128);
  if (v59)
  {

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_60;
  }
  if (*(_QWORD *)(v3 + 144))
  {
    v122 = *(id *)(v3 + 144);
    goto LABEL_77;
  }
  if (!*(_QWORD *)(v3 + 136))
  {

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_72;
  }
  v122 = *(id *)(v3 + 136);
  swift_unknownObjectRetain();
LABEL_77:
  v121 = v63;
  if (*(_QWORD *)(v3 + 160))
  {
    v81 = *(_QWORD *)(v3 + 160);
    goto LABEL_81;
  }
  if (!*(_QWORD *)(v3 + 152))
  {
    swift_unknownObjectRetain();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_72;
  }
  v81 = swift_unknownObjectRetain();
LABEL_81:
  v120 = v81;
  if (*(_QWORD *)(v3 + 168))
  {
    v82 = *(_QWORD *)(v3 + 168);
    v83 = *(_QWORD *)(v3 + 176);
    if (v83)
      goto LABEL_83;
    goto LABEL_94;
  }
  if (!*(_QWORD *)(v3 + 152))
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_72;
  }
  v82 = *(_QWORD *)(v3 + 152);
  swift_unknownObjectRetain();
  v83 = *(_QWORD *)(v3 + 176);
  if (!v83)
  {
LABEL_94:
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v80 = 1;
    goto LABEL_74;
  }
LABEL_83:
  v119 = v71;
  v84 = v83;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v85 = objc_msgSend(v122, sel_width);
  v86 = objc_msgSend(v122, sel_height);
  v87 = a1[2].n128_f32[0];
  v116 = (uint64_t)v86;
  v117 = (uint64_t)v85;
  v88 = sub_249D7865C((uint64_t)v57, (uint64_t)v85, (uint64_t)v86, (uint64_t)v6, v128, v87).n64_u64[0];
  v118 = (uint64_t)v6;
  sub_249D7A5F4((uint64_t)v57, (uint64_t)v6, v128, v87);
  v90 = v89;
  v92 = v91;
  v94 = v93;
  *(double *)&v95 = MEMORY[0x24BD03814](*a1);
  v96 = a1[2].n128_u64[1];
  v97 = a1[3].n128_u32[0];
  v129[0] = v95;
  v129[1] = v98;
  v129[2] = v99;
  v129[3] = v100;
  v130 = v96;
  v131 = v97;
  v132 = v88;
  v133 = v94;
  v134 = v90;
  v135 = v92;
  v136 = 1.0 / (float)v128;
  v101 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDD690]), sel_init);
  v102 = objc_msgSend(v101, sel_colorAttachments);
  v103 = objc_msgSend(v102, sel_objectAtIndexedSubscript_, 0);

  if (!v103)
  {
    __break(1u);
    goto LABEL_99;
  }
  objc_msgSend(v103, sel_setLoadAction_, 2);

  v104 = objc_msgSend(v101, sel_colorAttachments);
  v105 = objc_msgSend(v104, sel_objectAtIndexedSubscript_, 0);

  if (!v105)
  {
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  objc_msgSend(v105, sel_setClearColor_, 0.0, 0.0, 0.0, 0.0);

  v106 = objc_msgSend(v101, sel_colorAttachments);
  v107 = objc_msgSend(v106, sel_objectAtIndexedSubscript_, 0);

  if (!v107)
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  objc_msgSend(v107, sel_setTexture_, v126);

  v108 = objc_msgSend(v101, sel_depthAttachment);
  if (!v108)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  v109 = v108;
  objc_msgSend(v108, sel_setLoadAction_, 2);

  v110 = objc_msgSend(v101, sel_depthAttachment);
  if (!v110)
  {
LABEL_102:
    __break(1u);
    goto LABEL_103;
  }
  v111 = v110;
  objc_msgSend(v110, sel_setClearDepth_, 1.0);

  v112 = objc_msgSend(v101, sel_depthAttachment);
  if (v112)
  {
    v113 = v112;
    objc_msgSend(v112, sel_setTexture_, v119);

    v114 = objc_msgSend(a2, sel_renderCommandEncoderWithDescriptor_, v101);
    if (v114)
    {
      v115 = v114;
      objc_msgSend(v114, sel_setRenderPipelineState_, v62, v116, v117);
      objc_msgSend(v115, sel_setDepthStencilState_, v121);
      objc_msgSend(v115, sel_setVertexBuffer_offset_atIndex_, *(_QWORD *)(v3 + 96), 0, 0);
      objc_msgSend(v115, sel_setVertexBuffer_offset_atIndex_, *(_QWORD *)(v3 + 104), 0, 1);
      objc_msgSend(v115, sel_setVertexBytes_length_atIndex_, v129, 128, 2);
      objc_msgSend(v115, sel_setFragmentBytes_length_atIndex_, v129, 128, 0);
      objc_msgSend(v115, sel_setFragmentTexture_atIndex_, v122, 0);
      objc_msgSend(v115, sel_setFragmentTexture_atIndex_, v120, 1);
      objc_msgSend(v115, sel_setFragmentTexture_atIndex_, v82, 2);
      objc_msgSend(v115, sel_setFragmentTexture_atIndex_, v84, 3);
      objc_msgSend(v115, sel_drawPrimitives_vertexStart_vertexCount_, 4, 0, *(_QWORD *)(v3 + 88));
      objc_msgSend(v115, sel_endEncoding);
      swift_unknownObjectRelease();
    }
    sub_249D787F8((uint64_t)v57, v87, v117, v116, v118, v128);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v80 = 0;
    goto LABEL_74;
  }
LABEL_103:
  __break(1u);
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for StickerEffectRenderer.TextureError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for StickerEffectRenderer.TextureError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_249D79890(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_249D798B0(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for StickerEffectRenderer.TextureError()
{
  return &type metadata for StickerEffectRenderer.TextureError;
}

uint64_t sub_249D798E0(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[7];
  if (!v2)
  {
    if (!result)
      return result;
LABEL_6:
    v1[8] = 0;
    swift_unknownObjectRelease();
    v1[9] = 0;
    swift_unknownObjectRelease();
    v1[10] = 0;
    return swift_unknownObjectRelease();
  }
  if (!result || v2 != result)
    goto LABEL_6;
  return result;
}

_QWORD *sub_249D79930(void *a1, void *a2)
{
  uint64_t v2;
  _QWORD *v3;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v22;
  id v23;
  id v25;
  id v26;
  id v27;
  int v28;
  id v30;
  _QWORD v31[4];
  _QWORD v32[5];

  v3 = (_QWORD *)v2;
  v32[4] = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)(v2 + 48) = 1022739087;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_QWORD *)(v2 + 96) = 125;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  v6 = objc_allocWithZone(MEMORY[0x24BDDD6B8]);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = objc_msgSend(v6, sel_init);
  v8 = (void *)sub_249D8B8B8();
  v9 = objc_msgSend(a2, sel_newFunctionWithName_, v8);

  objc_msgSend(v7, sel_setVertexFunction_, v9);
  swift_unknownObjectRelease();
  v10 = (void *)sub_249D8B8B8();
  v11 = objc_msgSend(a2, sel_newFunctionWithName_, v10);

  objc_msgSend(v7, sel_setFragmentFunction_, v11);
  swift_unknownObjectRelease();
  v12 = objc_msgSend(v7, sel_colorAttachments);
  v13 = objc_msgSend(v12, sel_objectAtIndexedSubscript_, 0);

  if (!v13)
    __break(1u);
  objc_msgSend(v13, sel_setPixelFormat_, v3[12]);

  v30 = 0;
  v14 = objc_msgSend(a1, sel_newRenderPipelineStateWithDescriptor_error_, v7, &v30);
  v15 = v14;
  v16 = v30;
  if (!v14)
  {
    v27 = v30;
    sub_249D8B81C();

LABEL_8:
    swift_willThrow();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v28 = 0;
    goto LABEL_9;
  }
  v3[11] = v14;
  __asm { FMOV            V8.2S, #1.0 }
  v32[0] = 0x3F80000000000000;
  v32[1] = _D8;
  v32[2] = 0;
  v32[3] = 1065353216;
  v22 = v16;
  v23 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v32, 32, 0);
  if (!v23)
  {
    type metadata accessor for MTLCommandBufferError(0);
    sub_249D883F8(MEMORY[0x24BEE4AF8]);
    sub_249D7A31C();
    sub_249D8B804();
    goto LABEL_8;
  }
  v3[5] = v23;
  __asm { FMOV            V0.2S, #-1.0 }
  v31[0] = _D0;
  v31[1] = 0xBF8000003F800000;
  v31[2] = 0x3F800000BF800000;
  v31[3] = _D8;
  v25 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v31, 32, 0);
  if (v25)
  {
    v26 = v25;

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v3[4] = v26;
    return v3;
  }
  type metadata accessor for MTLCommandBufferError(0);
  v28 = 1;
  sub_249D883F8(MEMORY[0x24BEE4AF8]);
  sub_249D7A31C();
  sub_249D8B804();
  swift_willThrow();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
LABEL_9:
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v28)
    swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v15)
    swift_unknownObjectRelease();
  type metadata accessor for StickerShaderNormalGenerator();
  swift_deallocPartialClassInstance();
  return v3;
}

void sub_249D79D34(void *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  float v17;
  float v18;
  id v19;
  double v20;
  id v21;
  float i;
  id v23;
  double v24;
  id v25;
  float v26;
  float v27;
  id v28;
  id v29;
  int64x2_t v30;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  float32x2_t v43;
  float v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(v1 + 56);
  if (v2)
  {
    v4 = *(_QWORD *)(v1 + 64);
    swift_unknownObjectRetain();
    if (!v4)
    {
      v5 = objc_msgSend(v2, sel_width);
      v6 = objc_msgSend(v2, sel_height);
      v7 = (void *)objc_opt_self();
      v8 = objc_msgSend(v7, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 55, v5, v6, 0);
      objc_msgSend(v8, sel_setUsage_, 7);
      objc_msgSend(v8, sel_setStorageMode_, 2);
      v9 = *(void **)(v1 + 16);
      *(_QWORD *)(v1 + 64) = objc_msgSend(v9, sel_newTextureWithDescriptor_, v8);
      swift_unknownObjectRelease();
      *(_QWORD *)(v1 + 72) = objc_msgSend(v9, sel_newTextureWithDescriptor_, v8);
      swift_unknownObjectRelease();
      v10 = objc_msgSend(v7, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, *(_QWORD *)(v1 + 96), v5, v6, 0);
      objc_msgSend(v10, sel_setUsage_, 7);
      objc_msgSend(v10, sel_setStorageMode_, 2);
      v11 = objc_msgSend(v9, sel_newTextureWithDescriptor_, v10);

      *(_QWORD *)(v1 + 80) = v11;
      swift_unknownObjectRelease();
      v4 = *(_QWORD *)(v1 + 64);
      if (!v4)
        goto LABEL_16;
    }
    v12 = *(void **)(v1 + 72);
    if (v12)
    {
      v13 = *(void **)(v1 + 80);
      if (v13)
      {
        v14 = *(_QWORD *)(v1 + 16);
        v15 = objc_allocWithZone(MEMORY[0x24BDDE3F0]);
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        v16 = objc_msgSend(v15, sel_initWithDevice_, v14);
        v17 = *(float *)(v1 + 48);
        v42 = v13;
        v18 = v17 * (float)(uint64_t)objc_msgSend(v13, sel_width);
        if (v18 >= 1.0)
        {
          v19 = objc_allocWithZone(MEMORY[0x24BDDE3C8]);
          *(float *)&v20 = v18;
          v21 = objc_msgSend(v19, sel_initWithDevice_sigma_, v14, v20);
          objc_msgSend(v21, sel_setEdgeMode_, 1);
          objc_msgSend(v21, sel_encodeToCommandBuffer_sourceTexture_destinationTexture_, a1, v2, v4);
          objc_msgSend(v16, sel_encodeToCommandBuffer_primaryTexture_secondaryTexture_destinationTexture_, a1, v4, v2, v12);

          for (i = v18 * 0.5; i >= 1.0; i = i * 0.5)
          {
            v23 = objc_allocWithZone(MEMORY[0x24BDDE3C8]);
            *(float *)&v24 = i;
            v25 = objc_msgSend(v23, sel_initWithDevice_sigma_, v14, v24);
            objc_msgSend(v25, sel_setEdgeMode_, 1);
            objc_msgSend(v25, sel_encodeToCommandBuffer_sourceTexture_destinationTexture_, a1, v12, v4);
            objc_msgSend(v16, sel_encodeToCommandBuffer_primaryTexture_secondaryTexture_destinationTexture_, a1, v4, v2, v12);

          }
        }
        v26 = *(float *)(v1 + 48);
        v27 = v26 * (float)(uint64_t)objc_msgSend(v42, sel_width);
        v28 = objc_msgSend(v42, sel_width);
        v29 = objc_msgSend(v42, sel_height);
        v30.i64[0] = (uint64_t)v28;
        v30.i64[1] = (uint64_t)v29;
        __asm { FMOV            V1.2S, #1.0 }
        v43 = vdiv_f32(_D1, vcvt_f32_f64(vcvtq_f64_s64(v30)));
        v44 = v27;
        v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDD690]), sel_init);
        v37 = objc_msgSend(v36, sel_colorAttachments);
        v38 = objc_msgSend(v37, sel_objectAtIndexedSubscript_, 0);

        if (v38)
        {
          objc_msgSend(v38, sel_setTexture_, v42);

          v39 = objc_msgSend(a1, sel_renderCommandEncoderWithDescriptor_, v36);
          if (v39)
          {
            v40 = v39;
            objc_msgSend(v39, sel_setRenderPipelineState_, *(_QWORD *)(v1 + 88));
            objc_msgSend(v40, sel_setVertexBuffer_offset_atIndex_, *(_QWORD *)(v1 + 32), 0, 0);
            objc_msgSend(v40, sel_setVertexBuffer_offset_atIndex_, *(_QWORD *)(v1 + 40), 0, 1);
            if (v18 < 1.0)
              v41 = v2;
            else
              v41 = v12;
            objc_msgSend(v40, sel_setFragmentTexture_atIndex_, v41, 0);
            objc_msgSend(v40, sel_setFragmentBytes_length_atIndex_, &v43, 16, 0);
            objc_msgSend(v40, sel_drawPrimitives_vertexStart_vertexCount_, 4, 0, 4);
            objc_msgSend(v40, sel_endEncoding);
            swift_unknownObjectRelease();
          }
          swift_unknownObjectRelease();

          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
        }
        else
        {
          __break(1u);
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    else
    {
LABEL_16:
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_249D7A280()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_249D7A2DC()
{
  sub_249D7A280();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StickerShaderNormalGenerator()
{
  return objc_opt_self();
}

unint64_t sub_249D7A31C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578D3D00;
  if (!qword_2578D3D00)
  {
    type metadata accessor for MTLCommandBufferError(255);
    result = MEMORY[0x24BD03DD8](&unk_249D8C964, v1);
    atomic_store(result, (unint64_t *)&qword_2578D3D00);
  }
  return result;
}

uint64_t sub_249D7A364(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  BOOL v4;

  v3 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v1 + 32) = a1;
  if (swift_unknownObjectRetain())
  {
    if (v3)
      v4 = a1 == v3;
    else
      v4 = 0;
    if (!v4)
      goto LABEL_9;
  }
  else if (v3)
  {
LABEL_9:
    *(_QWORD *)(v1 + 40) = 0;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_249D7A3D4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v4;
  id v5;
  id v6;
  float v7;
  id v8;
  void *v9;
  float v10;
  uint64_t v11;
  id v12;
  double v13;
  id v14;
  void *v15;
  void *v16;

  v2 = *(void **)(v1 + 32);
  if (!v2)
    return 0;
  v4 = *(_QWORD *)(v1 + 40);
  swift_unknownObjectRetain();
  if (v4)
    goto LABEL_4;
  v5 = objc_msgSend((id)objc_opt_self(), sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, *(_QWORD *)(v1 + 56), objc_msgSend(v2, sel_width), objc_msgSend(v2, sel_height), 0);
  objc_msgSend(v5, sel_setUsage_, 7);
  objc_msgSend(v5, sel_setStorageMode_, 2);
  v6 = objc_msgSend(*(id *)(v1 + 16), sel_newTextureWithDescriptor_, v5);

  *(_QWORD *)(v1 + 40) = v6;
  swift_unknownObjectRelease();
  v4 = *(_QWORD *)(v1 + 40);
  if (v4)
  {
LABEL_4:
    v7 = *(float *)(v1 + 24);
    v8 = objc_msgSend((id)swift_unknownObjectRetain(), sel_width);
    v9 = *(void **)(v1 + 48);
    if (v9)
      goto LABEL_5;
    v10 = (float)(v7 * (float)(uint64_t)v8) / 3.0349;
    v11 = *(_QWORD *)(v1 + 16);
    v12 = objc_allocWithZone(MEMORY[0x24BDDE3C8]);
    *(float *)&v13 = v10;
    v14 = objc_msgSend(v12, sel_initWithDevice_sigma_, v11, v13);
    v15 = *(void **)(v1 + 48);
    *(_QWORD *)(v1 + 48) = v14;

    v16 = *(void **)(v1 + 48);
    if (!v16)
      goto LABEL_9;
    objc_msgSend(v16, sel_setEdgeMode_, 1);
    v9 = *(void **)(v1 + 48);
    if (v9)
    {
LABEL_5:
      objc_msgSend(v9, sel_encodeToCommandBuffer_sourceTexture_destinationTexture_, a1, v2, v4);
    }
    else
    {
LABEL_9:
      swift_unknownObjectRelease();
      v4 = 0;
    }
  }
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_249D7A598()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StickerShaderShadowGenerator()
{
  return objc_opt_self();
}

float sub_249D7A5F4(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  uint64_t v5;
  float v6;
  float v7;
  float *v8;
  float *v9;
  float v10;
  float v12;

  if (a3 <= a2)
    v5 = a2;
  else
    v5 = a3;
  v6 = fminf(fmaxf((float)((float)((float)v5 / a4) + -30.0) / 90.0, 0.0), 1.0);
  v7 = (float)(v6 * v6) * (float)((float)(v6 * -2.0) + 3.0);
  v8 = (float *)(a1 + OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier);
  swift_beginAccess();
  v12 = *v8 + (float)(v7 * (float)(1.0 - *v8));
  swift_beginAccess();
  v9 = (float *)(a1 + OBJC_IVAR____VKStickerEffectInternal_shadowRadius);
  swift_beginAccess();
  v10 = v12 * *v9;
  swift_beginAccess();
  swift_beginAccess();
  swift_beginAccess();
  return v10;
}

_QWORD *sub_249D7A79C(void *a1, void *a2)
{
  uint64_t v2;
  _QWORD *v3;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  id v26;
  id v27;
  int v28;
  id v30;
  _QWORD v31[4];
  _QWORD v32[5];

  v3 = (_QWORD *)v2;
  v32[4] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(v2 + 48) = 0;
  __asm { FMOV            V8.2S, #1.0 }
  *(_QWORD *)(v2 + 56) = _D8;
  *(_QWORD *)(v2 + 72) = 0;
  *(_QWORD *)(v2 + 80) = 0;
  *(_QWORD *)(v2 + 64) = 0;
  *(_OWORD *)(v2 + 96) = xmmword_249D8CF80;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  v11 = objc_allocWithZone(MEMORY[0x24BDDD6B8]);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v12 = objc_msgSend(v11, sel_init);
  v13 = (void *)sub_249D8B8B8();
  v14 = objc_msgSend(a2, sel_newFunctionWithName_, v13);

  objc_msgSend(v12, sel_setVertexFunction_, v14);
  swift_unknownObjectRelease();
  v15 = (void *)sub_249D8B8B8();
  v16 = objc_msgSend(a2, sel_newFunctionWithName_, v15);

  objc_msgSend(v12, sel_setFragmentFunction_, v16);
  swift_unknownObjectRelease();
  v17 = objc_msgSend(v12, sel_colorAttachments);
  v18 = objc_msgSend(v17, sel_objectAtIndexedSubscript_, 0);

  if (!v18)
    __break(1u);
  objc_msgSend(v18, sel_setPixelFormat_, v3[13]);

  v30 = 0;
  v19 = objc_msgSend(a1, sel_newRenderPipelineStateWithDescriptor_error_, v12, &v30);
  v20 = v19;
  v21 = v30;
  if (!v19)
  {
    v27 = v30;
    sub_249D8B81C();

LABEL_8:
    swift_willThrow();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v28 = 0;
    goto LABEL_9;
  }
  v3[11] = v19;
  v32[0] = 0x3F80000000000000;
  v32[1] = _D8;
  v32[2] = 0;
  v32[3] = 1065353216;
  v22 = v21;
  v23 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v32, 32, 0);
  if (!v23)
  {
    type metadata accessor for MTLCommandBufferError(0);
    sub_249D883F8(MEMORY[0x24BEE4AF8]);
    sub_249D7A31C();
    sub_249D8B804();
    goto LABEL_8;
  }
  v3[5] = v23;
  __asm { FMOV            V0.2S, #-1.0 }
  v31[0] = _D0;
  v31[1] = 0xBF8000003F800000;
  v31[2] = 0x3F800000BF800000;
  v31[3] = _D8;
  v25 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v31, 32, 0);
  if (v25)
  {
    v26 = v25;

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v3[4] = v26;
    return v3;
  }
  type metadata accessor for MTLCommandBufferError(0);
  v28 = 1;
  sub_249D883F8(MEMORY[0x24BEE4AF8]);
  sub_249D7A31C();
  sub_249D8B804();
  swift_willThrow();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
LABEL_9:
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v28)
    swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v20)
    swift_unknownObjectRelease();
  type metadata accessor for StickerShaderAlphaToLumaGenerator();
  swift_deallocPartialClassInstance();
  return v3;
}

void sub_249D7AB8C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(v1 + 48);
  if (v2)
  {
    v4 = *(_QWORD *)(v1 + 80);
    if (v4)
    {
      swift_unknownObjectRetain();
    }
    else
    {
      v5 = (void *)objc_opt_self();
      v6 = *(_QWORD *)(v1 + 104);
      v7 = *(_QWORD *)(v1 + 64);
      v8 = *(_QWORD *)(v1 + 72);
      swift_unknownObjectRetain();
      v9 = objc_msgSend(v5, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, v6, v7, v8, 0);
      objc_msgSend(v9, sel_setUsage_, 7);
      objc_msgSend(v9, sel_setStorageMode_, 2);
      v10 = objc_msgSend(*(id *)(v1 + 16), sel_newTextureWithDescriptor_, v9);

      *(_QWORD *)(v1 + 80) = v10;
      swift_unknownObjectRelease();
      v4 = *(_QWORD *)(v1 + 80);
      if (!v4)
      {
LABEL_10:
        swift_unknownObjectRelease();
        return;
      }
    }
    v11 = objc_allocWithZone(MEMORY[0x24BDDD690]);
    swift_unknownObjectRetain();
    v12 = objc_msgSend(v11, sel_init);
    v13 = objc_msgSend(v12, sel_colorAttachments);
    v14 = objc_msgSend(v13, sel_objectAtIndexedSubscript_, 0);

    if (v14)
    {
      objc_msgSend(v14, sel_setTexture_, v4);

      v15 = objc_msgSend(a1, sel_renderCommandEncoderWithDescriptor_, v12);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)(v1 + 56);
        v18 = 1061158912;
        v19 = v17;
        objc_msgSend(v15, sel_setRenderPipelineState_, *(_QWORD *)(v1 + 88));
        objc_msgSend(v16, sel_setVertexBuffer_offset_atIndex_, *(_QWORD *)(v1 + 32), 0, 0);
        objc_msgSend(v16, sel_setVertexBuffer_offset_atIndex_, *(_QWORD *)(v1 + 40), 0, 1);
        objc_msgSend(v16, sel_setFragmentTexture_atIndex_, v2, 0);
        objc_msgSend(v16, sel_setFragmentBytes_length_atIndex_, &v18, 16, 0);
        objc_msgSend(v16, sel_drawPrimitives_vertexStart_vertexCount_, 4, 0, 4);
        objc_msgSend(v16, sel_endEncoding);
        swift_unknownObjectRelease();
      }

      goto LABEL_10;
    }
    __break(1u);
  }
}

uint64_t sub_249D7AE2C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_249D7AE78()
{
  sub_249D7AE2C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StickerShaderAlphaToLumaGenerator()
{
  return objc_opt_self();
}

id sub_249D7AEB8(void *a1)
{
  return sub_249D7AF7C(a1, &OBJC_IVAR____TtC17VisionKitInternal24StickerComicStrokeShader_sigma);
}

id sub_249D7AF04()
{
  return sub_249D75EC4(type metadata accessor for StickerComicStrokeShader);
}

uint64_t type metadata accessor for StickerComicStrokeShader()
{
  return objc_opt_self();
}

id sub_249D7AF30(void *a1)
{
  return sub_249D7AF7C(a1, &OBJC_IVAR____TtC17VisionKitInternal32StickerComicStrokeAndBlendShader_sigma);
}

id sub_249D7AF7C(void *a1, _QWORD *a2)
{
  uint64_t v2;
  float v3;
  float32x2_t v5;
  float v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *(double *)(v2 + *a2);
  v5 = vcvt_f32_f64(*(float64x2_t *)(v2 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size));
  v6 = v3;
  return objc_msgSend(a1, sel_setFragmentBytes_length_atIndex_, &v5, 16, 0);
}

id sub_249D7B000()
{
  return sub_249D75EC4(type metadata accessor for StickerComicStrokeAndBlendShader);
}

uint64_t type metadata accessor for StickerComicStrokeAndBlendShader()
{
  return objc_opt_self();
}

uint64_t StickerComicRenderer.__allocating_init(device:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  StickerComicRenderer.init(device:)(a1);
  return v2;
}

uint64_t sub_249D7B078(unint64_t a1)
{
  uint64_t v2;

  if (!(a1 >> 62))
    return *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v2 = sub_249D8BA08();
  swift_bridgeObjectRelease();
  return v2;
}

VisionKitInternal::StickerComicRenderer::Style_optional __swiftcall StickerComicRenderer.Style.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (VisionKitInternal::StickerComicRenderer::Style_optional)rawValue;
}

uint64_t StickerComicRenderer.Style.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_249D7B0F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_249D7B110()
{
  sub_249D8BA8C();
  sub_249D8BA98();
  return sub_249D8BAA4();
}

uint64_t sub_249D7B154()
{
  return sub_249D8BA98();
}

uint64_t sub_249D7B17C()
{
  sub_249D8BA8C();
  sub_249D8BA98();
  return sub_249D8BAA4();
}

_QWORD *sub_249D7B1BC@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_249D7B1DC(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void StickerComicRenderer.Parameters.style.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *StickerComicRenderer.Parameters.style.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*StickerComicRenderer.Parameters.style.modify())()
{
  return nullsub_1;
}

float StickerComicRenderer.Parameters.smooth.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 4);
}

void StickerComicRenderer.Parameters.smooth.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 4) = a1;
}

uint64_t (*StickerComicRenderer.Parameters.smooth.modify())()
{
  return nullsub_1;
}

float StickerComicRenderer.Parameters.brightness.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 8);
}

void StickerComicRenderer.Parameters.brightness.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 8) = a1;
}

uint64_t (*StickerComicRenderer.Parameters.brightness.modify())()
{
  return nullsub_1;
}

float StickerComicRenderer.Parameters.loose.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 12);
}

void StickerComicRenderer.Parameters.loose.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 12) = a1;
}

uint64_t (*StickerComicRenderer.Parameters.loose.modify())()
{
  return nullsub_1;
}

float StickerComicRenderer.Parameters.param1.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 16);
}

void StickerComicRenderer.Parameters.param1.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 16) = a1;
}

uint64_t (*StickerComicRenderer.Parameters.param1.modify())()
{
  return nullsub_1;
}

float StickerComicRenderer.Parameters.param2.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 20);
}

void StickerComicRenderer.Parameters.param2.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 20) = a1;
}

uint64_t (*StickerComicRenderer.Parameters.param2.modify())()
{
  return nullsub_1;
}

float StickerComicRenderer.Parameters.param3.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 24);
}

void StickerComicRenderer.Parameters.param3.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 24) = a1;
}

uint64_t (*StickerComicRenderer.Parameters.param3.modify())()
{
  return nullsub_1;
}

uint64_t StickerComicRenderer.Parameters.quantizeLevels.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t StickerComicRenderer.Parameters.quantizeLevels.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*StickerComicRenderer.Parameters.quantizeLevels.modify())()
{
  return nullsub_1;
}

BOOL static StickerComicRenderer.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t StickerComicRenderer.Error.hash(into:)()
{
  return sub_249D8BA98();
}

uint64_t StickerComicRenderer.Error.hashValue.getter()
{
  sub_249D8BA8C();
  sub_249D8BA98();
  return sub_249D8BAA4();
}

_QWORD *sub_249D7B374(void *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t ObjCClassFromMetadata;
  id v6;
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  char *v11;
  id v12;
  objc_class *v13;
  char *v14;
  objc_class *v15;
  char *v16;
  char *v17;
  char *v18;
  id v19;
  char *v20;
  char *v21;
  char *v22;
  id v23;
  id v24;
  id v25;
  char *v26;
  char *v27;
  objc_class *v29;
  _QWORD *v30;
  id v31[2];

  v3 = v1;
  v31[1] = *(id *)MEMORY[0x24BDAC8D0];
  type metadata accessor for StickerComicRenderer();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v31[0] = 0;
  v7 = objc_msgSend(a1, sel_newDefaultLibraryWithBundle_error_, v6, v31);

  v8 = v31[0];
  if (!v7)
  {
    v12 = v31[0];
    sub_249D8B81C();

    swift_willThrow();
    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  v30 = v3;
  v9 = (objc_class *)type metadata accessor for StickerComicSobelShader();
  objc_allocWithZone(v9);
  v10 = v8;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v11 = sub_249D8A344(a1, v7);
  if (v2)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v3 = v30;
LABEL_6:
    type metadata accessor for StickerComicRenderer.Shaders();
    swift_deallocPartialClassInstance();
    return v3;
  }
  v30[2] = v11;
  v13 = (objc_class *)type metadata accessor for StickerComicGaussBlurExpressShader();
  v14 = (char *)objc_allocWithZone(v13);
  *(_QWORD *)&v14[OBJC_IVAR____TtC17VisionKitInternal34StickerComicGaussBlurExpressShader_sigma] = 0x3FE0000000000000;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v29 = v13;
  v30[3] = sub_249D8A344(a1, v7);
  v15 = (objc_class *)type metadata accessor for StickerComicGaussBlurExpressPassTwoShader();
  v16 = (char *)objc_allocWithZone(v15);
  *(_QWORD *)&v16[OBJC_IVAR____TtC17VisionKitInternal41StickerComicGaussBlurExpressPassTwoShader_sigma] = 0x3FE0000000000000;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[4] = sub_249D8A344(a1, v7);
  v17 = (char *)objc_allocWithZone((Class)type metadata accessor for StickerComicBFBlurPassOneShader());
  *(_QWORD *)&v17[OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassOneShader_sigmaColor] = 0;
  *(_QWORD *)&v17[OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassOneShader_sigma] = 0;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[5] = sub_249D8A344(a1, v7);
  v18 = (char *)objc_allocWithZone((Class)type metadata accessor for StickerComicBFBlurPassTwoShader());
  *(_QWORD *)&v18[OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassTwoShader_sigmaColor] = 0;
  *(_QWORD *)&v18[OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassTwoShader_sigma] = 0;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[6] = sub_249D8A344(a1, v7);
  v19 = objc_allocWithZone((Class)type metadata accessor for StickerComicVignetteAndQuantizeShader());
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[7] = sub_249D8B470(a1, v7);
  v20 = (char *)objc_allocWithZone((Class)type metadata accessor for StickerComicEdgesShader());
  *(_QWORD *)&v20[OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_threshold] = 0x3FE0000000000000;
  *(_QWORD *)&v20[OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_preThreshold] = 0x3FE0000000000000;
  *(_QWORD *)&v20[OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_sigma] = 0;
  *(_QWORD *)&v20[OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_mode] = 0;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[9] = sub_249D8A344(a1, v7);
  v21 = (char *)objc_allocWithZone((Class)type metadata accessor for StickerComicStrokeShader());
  *(_QWORD *)&v21[OBJC_IVAR____TtC17VisionKitInternal24StickerComicStrokeShader_sigma] = 0;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[10] = sub_249D8A344(a1, v7);
  v22 = (char *)objc_allocWithZone((Class)type metadata accessor for StickerComicStrokeAndBlendShader());
  *(_QWORD *)&v22[OBJC_IVAR____TtC17VisionKitInternal32StickerComicStrokeAndBlendShader_sigma] = 0;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[11] = sub_249D8A344(a1, v7);
  v23 = objc_allocWithZone((Class)type metadata accessor for StickerComicColorStrokeShader());
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[8] = sub_249D8A344(a1, v7);
  v24 = objc_allocWithZone((Class)type metadata accessor for StickerComicLookupFilterShader());
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[12] = sub_249D8A344(a1, v7);
  v25 = objc_allocWithZone(v9);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[13] = sub_249D8A344(a1, v7);
  v26 = (char *)objc_allocWithZone(v29);
  *(_QWORD *)&v26[OBJC_IVAR____TtC17VisionKitInternal34StickerComicGaussBlurExpressShader_sigma] = 0x3FE0000000000000;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v30[14] = sub_249D8A344(a1, v7);
  v27 = (char *)objc_allocWithZone(v15);
  *(_QWORD *)&v27[OBJC_IVAR____TtC17VisionKitInternal41StickerComicGaussBlurExpressPassTwoShader_sigma] = 0x3FE0000000000000;
  v3 = v30;
  v30[15] = sub_249D8A344(a1, v7);
  return v3;
}

id *sub_249D7BE80()
{
  id *v0;

  return v0;
}

uint64_t sub_249D7BF04()
{
  sub_249D7BE80();
  return swift_deallocClassInstance();
}

uint64_t StickerComicRenderer.init(device:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  v3 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 32) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 40) = v3;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_QWORD *)(v1 + 16) = a1;
  type metadata accessor for StickerComicRenderer.Shaders();
  swift_allocObject();
  v4 = (void *)swift_unknownObjectRetain();
  v5 = sub_249D7B374(v4);
  if (v2)
  {
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for StickerComicRenderer();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)(v1 + 24) = v5;
  }
  return v1;
}

uint64_t type metadata accessor for StickerComicRenderer.Shaders()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for StickerComicRenderer()
{
  return objc_opt_self();
}

uint64_t sub_249D7C014(void *a1, void *a2, char *a3, void *a4, int8x16_t a5)
{
  uint64_t v5;
  char v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  char *v17;
  char v18;
  char *v19;
  uint64_t v21;
  _BYTE v22[4];
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;

  v9 = *a3;
  v10 = *((_DWORD *)a3 + 1);
  v11 = *((_DWORD *)a3 + 2);
  v12 = *((_DWORD *)a3 + 3);
  v13 = *((_DWORD *)a3 + 4);
  v14 = *((_DWORD *)a3 + 5);
  v15 = *((_DWORD *)a3 + 6);
  v16 = *((_QWORD *)a3 + 4);
  v22[0] = *a3;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  if ((sub_249D81E50((uint64_t)v22, a5) & 1) == 0)
  {
    v18 = 0;
LABEL_8:
    sub_249D81EC0();
    swift_allocError();
    *v19 = v18;
    return swift_willThrow();
  }
  if (objc_msgSend(a1, sel_pixelFormat) != (id)80 || objc_msgSend(a2, sel_pixelFormat) != (id)80)
  {
    v18 = 1;
    goto LABEL_8;
  }
  if ((v9 & 1) != 0)
    v17 = 0;
  else
    v17 = (char *)sub_249D816F8();
  v22[0] = v9;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  sub_249D81F04(a1, (uint64_t)v22);
  v22[0] = v9;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  sub_249D7C1DC(v22, (char **)a1, (uint64_t)a2, v17, a4);
  swift_beginAccess();
  v21 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v5 + 32) = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)(v5 + 40) = v21;
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_249D7C1DC(_BYTE *a1, char **a2, uint64_t a3, char *a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char **v8;
  unint64_t v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  char **v54;
  char *v55;
  double v56;
  double v57;
  void *v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  void *v70;
  id v72;
  id v73;
  uint64_t v74;
  char **v75;
  unint64_t v76;
  double v77;
  double v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  double v87;
  double v88;
  void *v89;
  id v91;
  id v92;
  uint64_t v93;
  char **v94;
  char *v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  double v100;
  double v101;
  void *v102;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  char **v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  void *v115;
  id v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char **v122;
  unint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  double v127;
  double v128;
  void *v129;
  id v131;
  id v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  double v141;
  double v142;
  void *v143;
  id v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  double v153;
  double v154;
  void *v155;
  id v157;
  id v158;
  uint64_t v159;
  unint64_t v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  double v164;
  double v165;
  void *v166;
  id v168;
  id v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char **v174;
  unint64_t v175;
  uint64_t v176;
  unint64_t v177;
  uint64_t v178;
  double v179;
  double v180;
  void *v181;
  id v183;
  id v184;
  uint64_t v185;
  unint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  uint64_t v190;
  unint64_t v191;
  uint64_t v192;
  unint64_t v193;
  uint64_t v194;
  double v195;
  double v196;
  void *v197;
  id v199;
  id v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  uint64_t v204;
  unint64_t v205;
  uint64_t v206;
  double v207;
  double v208;
  void *v209;
  id v211;
  id v212;
  uint64_t v213;
  char **v214;
  unint64_t v215;
  uint64_t v216;
  unint64_t v217;
  uint64_t v218;
  double v219;
  double v220;
  void *v221;
  id v223;
  id v224;
  uint64_t v225;
  unint64_t v226;
  uint64_t v227;
  uint64_t v228;
  unint64_t v229;
  uint64_t v230;
  unint64_t v231;
  uint64_t v232;
  double v233;
  double v234;
  void *v235;
  id v237;
  id v238;
  uint64_t v239;
  unint64_t v240;
  uint64_t v241;
  char **v242;
  unint64_t v243;
  uint64_t v244;
  unint64_t v245;
  uint64_t v246;
  double v247;
  double v248;
  void *v249;
  id v251;
  id v252;
  uint64_t v253;
  char **v254;
  unint64_t v255;
  uint64_t v256;
  unint64_t v257;
  uint64_t v258;
  double v259;
  double v260;
  void *v261;
  id v263;
  id v264;
  uint64_t v265;
  char **v266;
  unint64_t v267;
  uint64_t v268;
  unint64_t v269;
  uint64_t v270;
  double v271;
  double v272;
  void *v273;
  id v275;
  id v276;
  uint64_t v277;
  unint64_t v278;
  uint64_t v279;
  unint64_t v280;
  uint64_t v281;
  double v282;
  double v283;
  void *v284;
  id v286;
  id v287;
  uint64_t v288;
  char **v289;
  unint64_t v290;
  uint64_t v291;
  unint64_t v292;
  uint64_t v293;
  double v294;
  double v295;
  void *v296;
  id v298;
  id v299;
  uint64_t v300;
  unint64_t v301;
  uint64_t v302;
  unint64_t v303;
  uint64_t v304;
  unint64_t v305;
  uint64_t v306;
  double v307;
  double v308;
  void *v309;
  id v311;
  id v312;
  uint64_t v313;
  uint64_t v314;
  unint64_t v315;
  uint64_t v316;
  unint64_t v317;
  uint64_t v318;
  double v319;
  double v320;
  void *v321;
  id v323;
  id v324;
  uint64_t v325;
  unint64_t v326;
  uint64_t v327;
  unint64_t v328;
  uint64_t v329;
  double v330;
  double v331;
  void *v332;
  id v334;
  id v335;
  uint64_t v336;
  unint64_t v337;
  uint64_t v338;
  char *v339;
  uint64_t v340;
  unint64_t v341;
  uint64_t v342;
  unint64_t v343;
  uint64_t v344;
  unint64_t v345;
  uint64_t v346;
  double v347;
  double v348;
  void *v349;
  id v351;
  id v352;
  uint64_t v353;
  unint64_t v354;
  uint64_t v355;
  double v356;
  double v357;
  void *v358;
  id v360;
  id v361;
  uint64_t v362;
  unint64_t v363;
  uint64_t v364;
  double v365;
  double v366;
  void *v367;
  id v369;
  id v370;
  uint64_t v371;
  unint64_t v372;
  uint64_t v373;
  double v374;
  double v375;
  void *v376;
  id v378;
  id v379;
  uint64_t v380;
  unint64_t v381;
  uint64_t v382;
  double v383;
  double v384;
  void *v385;
  id v387;
  id v388;
  uint64_t v389;
  unint64_t v390;
  uint64_t v391;
  double v392;
  double v393;
  void *v394;
  id v396;
  id v397;
  uint64_t v398;
  unint64_t v399;
  uint64_t v400;
  unint64_t v401;
  uint64_t v402;
  double v403;
  double v404;
  void *v405;
  id v407;
  id v408;
  uint64_t v409;
  unint64_t v410;
  uint64_t v411;
  double v412;
  double v413;
  void *v414;
  id v416;
  id v417;
  uint64_t v418;
  uint64_t v419;
  unint64_t v420;
  uint64_t v421;
  uint64_t v422;
  char **v423;
  unint64_t v424;
  uint64_t v425;
  double v426;
  double v427;
  void *v428;
  id v430;
  id v431;
  uint64_t v432;
  unint64_t v433;
  uint64_t v434;
  double v435;
  double v436;
  void *v437;
  id v439;
  id v440;
  uint64_t v441;
  unint64_t v442;
  uint64_t v443;
  double v444;
  double v445;
  void *v446;
  id v448;
  id v449;
  uint64_t v450;
  unint64_t v451;
  uint64_t v452;
  unint64_t v453;
  uint64_t v454;
  double v455;
  double v456;
  void *v457;
  id v459;
  id v460;
  uint64_t v461;
  unint64_t v462;
  uint64_t v463;
  uint64_t result;
  unint64_t v465;
  uint64_t v466;
  double v467;
  double v468;
  void *v469;
  id v471;
  id v472;
  uint64_t v473;
  uint64_t v474;
  unint64_t v475;
  uint64_t v476;
  double v477;
  double v478;
  void *v479;
  id v481;
  id v482;
  uint64_t v483;
  unint64_t v484;
  uint64_t v485;
  double v486;
  double v487;
  void *v488;
  id v490;
  id v491;
  uint64_t v492;
  char **v493;
  uint64_t v494;
  char *v495;
  _QWORD *v498;

  v7 = v5;
  v498 = *(_QWORD **)(v5 + 24);
  v8 = (char **)(v5 + 40);
  if ((*a1 & 1) == 0)
  {
    v495 = a4;
    swift_beginAccess();
    while (1)
    {
      v9 = (unint64_t)*v8;
      if ((unint64_t)*v8 >> 62)
        break;
      if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 0)
        goto LABEL_50;
LABEL_20:
      v18 = *(double *)(v7 + 48);
      v17 = *(double *)(v7 + 56);
      v19 = (void *)objc_opt_self();
      if (v18 <= -9.22337204e18)
        goto LABEL_724;
      if (v18 >= 9.22337204e18)
        goto LABEL_726;
      if ((*(_QWORD *)&v18 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v17 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_728;
      }
      if (v17 <= -9.22337204e18)
        goto LABEL_730;
      if (v17 >= 9.22337204e18)
        goto LABEL_732;
      v20 = objc_msgSend(v19, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v18, (uint64_t)v17, 0);
      objc_msgSend(v20, sel_setUsage_, 5);
      v6 = (uint64_t)objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v20);

      if (v6)
      {
        swift_beginAccess();
        v21 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v21);
        if (*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8)
                                                                                            + 0x18) >> 1)
          sub_249D8B90C();
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
    }
    swift_bridgeObjectRetain();
    v22 = sub_249D8BA08();
    swift_bridgeObjectRelease();
    if (v22 <= 0)
      goto LABEL_20;
LABEL_50:
    v9 = (unint64_t)*v8;
    if (((unint64_t)*v8 & 0xC000000000000001) != 0)
      goto LABEL_945;
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v32 = *(_QWORD *)(v9 + 32);
      swift_unknownObjectRetain();
      goto LABEL_53;
    }
    __break(1u);
LABEL_947:
    swift_bridgeObjectRetain();
    v33 = MEMORY[0x24BD038A4](1, v9);
    swift_bridgeObjectRelease();
    while (1)
    {
      v9 = (unint64_t)*v8;
      if ((unint64_t)*v8 >> 62)
      {
        swift_bridgeObjectRetain();
        v46 = sub_249D8BA08();
        swift_bridgeObjectRelease();
        if (v46 > 0)
        {
LABEL_102:
          v9 = (unint64_t)*v8;
          if (((unint64_t)*v8 & 0xC000000000000001) != 0)
            goto LABEL_951;
          if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            v54 = *(char ***)(v9 + 32);
            swift_unknownObjectRetain();
            goto LABEL_105;
          }
          __break(1u);
LABEL_953:
          swift_bridgeObjectRetain();
          v75 = (char **)MEMORY[0x24BD038A4](0, v9);
          swift_bridgeObjectRelease();
LABEL_136:
          sub_249D8A1C0(v6, v75, a5);
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          v63 = v498[4];
          v76 = 0xC3E0000000000001;
          v24 = 0x7FF0000000000000;
          while (2)
          {
            v9 = (unint64_t)*v8;
            if (!((unint64_t)*v8 >> 62))
            {
              if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 0)
                break;
              goto LABEL_139;
            }
            swift_bridgeObjectRetain();
            v82 = sub_249D8BA08();
            swift_bridgeObjectRelease();
            if (v82 <= 0)
            {
LABEL_139:
              v78 = *(double *)(v7 + 48);
              v77 = *(double *)(v7 + 56);
              v79 = (void *)objc_opt_self();
              if (v78 <= -9.22337204e18)
                goto LABEL_754;
              if (v78 >= 9.22337204e18)
                goto LABEL_756;
              if ((*(_QWORD *)&v78 & 0x7FF0000000000000) == 0x7FF0000000000000
                || (*(_QWORD *)&v77 & 0x7FF0000000000000) == 0x7FF0000000000000)
              {
                goto LABEL_758;
              }
              if (v77 <= -9.22337204e18)
                goto LABEL_761;
              if (v77 >= 9.22337204e18)
                goto LABEL_762;
              v80 = objc_msgSend(v79, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v78, (uint64_t)v77, 0);
              objc_msgSend(v80, sel_setUsage_, 5);
              v6 = (uint64_t)objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v80);

              if (v6)
              {
                swift_beginAccess();
                v81 = swift_unknownObjectRetain();
                MEMORY[0x24BD037C0](v81);
                if (*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                  sub_249D8B90C();
                sub_249D8B918();
                sub_249D8B900();
                swift_endAccess();
                swift_unknownObjectRelease();
              }
              continue;
            }
            break;
          }
          v9 = (unint64_t)*v8;
          v494 = v63;
          if (((unint64_t)*v8 & 0xC000000000000001) != 0)
            goto LABEL_957;
          if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            v6 = *(_QWORD *)(v9 + 32);
            swift_unknownObjectRetain();
            goto LABEL_153;
          }
          __break(1u);
LABEL_959:
          swift_bridgeObjectRetain();
          v94 = (char **)MEMORY[0x24BD038A4](1, v76);
          swift_bridgeObjectRelease();
LABEL_169:
          sub_249D8A1C0(v63, v94, a5);
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          v95 = (char *)v498[5];
          v9 = (unint64_t)*v8;
          v96 = swift_bridgeObjectRetain();
          v97 = sub_249D7B078(v96);
          swift_bridgeObjectRelease();
          if (v97 <= 1)
          {
            v24 = 0xC3E0000000000001;
            v6 = 0x43E0000000000000;
            do
            {
              v101 = *(double *)(v7 + 48);
              v100 = *(double *)(v7 + 56);
              v102 = (void *)objc_opt_self();
              if (v101 <= -9.22337204e18)
                goto LABEL_773;
              if (v101 >= 9.22337204e18)
                goto LABEL_775;
              if ((*(_QWORD *)&v101 & 0x7FF0000000000000) == 0x7FF0000000000000
                || (*(_QWORD *)&v100 & 0x7FF0000000000000) == 0x7FF0000000000000)
              {
                goto LABEL_776;
              }
              if (v100 <= -9.22337204e18)
                goto LABEL_777;
              if (v100 >= 9.22337204e18)
                goto LABEL_781;
              v104 = objc_msgSend(v102, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v101, (uint64_t)v100, 0);
              objc_msgSend(v104, sel_setUsage_, 5);
              v105 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v104);

              if (v105)
              {
                swift_beginAccess();
                v106 = swift_unknownObjectRetain();
                MEMORY[0x24BD037C0](v106);
                v63 = *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10);
                sub_249D81E24(v63);
                sub_249D8B918();
                sub_249D8B900();
                swift_endAccess();
                swift_unknownObjectRelease();
              }
              v9 = (unint64_t)*v8;
              v98 = swift_bridgeObjectRetain();
              v99 = sub_249D7B078(v98);
              swift_bridgeObjectRelease();
            }
            while (v99 < 2);
          }
          v9 = (unint64_t)*v8;
          v495 = v95;
          if (((unint64_t)*v8 & 0xC000000000000001) != 0)
            goto LABEL_963;
          if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
          {
            v63 = *(_QWORD *)(v9 + 40);
            swift_unknownObjectRetain();
            goto LABEL_201;
          }
          __break(1u);
LABEL_965:
          swift_bridgeObjectRetain();
          v6 = MEMORY[0x24BD038A4](1, v9);
          swift_bridgeObjectRelease();
          v9 = (unint64_t)*v8;
LABEL_221:
          v134 = swift_bridgeObjectRetain();
          v135 = sub_249D7B078(v134);
          swift_bridgeObjectRelease();
          if (v135 <= 0)
          {
            v24 = 0x43E0000000000000;
            v63 = 0x7FF0000000000000;
            do
            {
              v366 = *(double *)(v7 + 48);
              v365 = *(double *)(v7 + 56);
              v367 = (void *)objc_opt_self();
              if (v366 <= -9.22337204e18)
                goto LABEL_835;
              if (v366 >= 9.22337204e18)
                goto LABEL_836;
              if ((*(_QWORD *)&v366 & 0x7FF0000000000000) == 0x7FF0000000000000
                || (*(_QWORD *)&v365 & 0x7FF0000000000000) == 0x7FF0000000000000)
              {
                goto LABEL_840;
              }
              if (v365 <= -9.22337204e18)
                goto LABEL_841;
              if (v365 >= 9.22337204e18)
                goto LABEL_842;
              v369 = objc_msgSend(v367, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v366, (uint64_t)v365, 0);
              objc_msgSend(v369, sel_setUsage_, 5);
              v370 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v369);

              if (v370)
              {
                swift_beginAccess();
                v371 = swift_unknownObjectRetain();
                MEMORY[0x24BD037C0](v371);
                sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
                sub_249D8B918();
                sub_249D8B900();
                swift_endAccess();
                swift_unknownObjectRelease();
              }
              v9 = (unint64_t)*v8;
              v363 = swift_bridgeObjectRetain();
              v364 = sub_249D7B078(v363);
              swift_bridgeObjectRelease();
            }
            while (v364 < 1);
          }
          v107 = (uint64_t)*v8;
          if (((unint64_t)*v8 & 0xC000000000000001) != 0)
            goto LABEL_969;
          v9 = v494;
          if (*(_QWORD *)((v107 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            v136 = *(_QWORD *)(v107 + 32);
            swift_unknownObjectRetain();
            goto LABEL_225;
          }
          __break(1u);
LABEL_971:
          swift_bridgeObjectRetain();
          v148 = MEMORY[0x24BD038A4](2, v9);
          swift_bridgeObjectRelease();
          v9 = (unint64_t)*v8;
LABEL_241:
          v149 = swift_bridgeObjectRetain();
          v150 = sub_249D7B078(v149);
          swift_bridgeObjectRelease();
          if (v150 <= 1)
          {
            v6 = 0xC3E0000000000001;
            v107 = 0x7FF0000000000000;
            do
            {
              v154 = *(double *)(v7 + 48);
              v153 = *(double *)(v7 + 56);
              v155 = (void *)objc_opt_self();
              if (v154 <= -9.22337204e18)
                goto LABEL_793;
              if (v154 >= 9.22337204e18)
                goto LABEL_794;
              if ((*(_QWORD *)&v154 & 0x7FF0000000000000) == 0x7FF0000000000000
                || (*(_QWORD *)&v153 & 0x7FF0000000000000) == 0x7FF0000000000000)
              {
                goto LABEL_797;
              }
              if (v153 <= -9.22337204e18)
                goto LABEL_798;
              if (v153 >= 9.22337204e18)
                goto LABEL_799;
              v157 = objc_msgSend(v155, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v154, (uint64_t)v153, 0);
              objc_msgSend(v157, sel_setUsage_, 5);
              v158 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v157);

              if (v158)
              {
                swift_beginAccess();
                v159 = swift_unknownObjectRetain();
                MEMORY[0x24BD037C0](v159);
                v63 = *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10);
                sub_249D81E24(v63);
                sub_249D8B918();
                sub_249D8B900();
                swift_endAccess();
                swift_unknownObjectRelease();
              }
              v9 = (unint64_t)*v8;
              v151 = swift_bridgeObjectRetain();
              v152 = sub_249D7B078(v151);
              swift_bridgeObjectRelease();
            }
            while (v152 < 2);
          }
          v9 = (unint64_t)*v8;
          v495 = (char *)v148;
          if (((unint64_t)*v8 & 0xC000000000000001) != 0)
            goto LABEL_975;
          if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
          {
            v63 = *(_QWORD *)(v9 + 40);
            swift_unknownObjectRetain();
            goto LABEL_273;
          }
          __break(1u);
LABEL_977:
          __break(1u);
LABEL_978:
          swift_bridgeObjectRetain();
          v173 = MEMORY[0x24BD038A4](0, v107);
          swift_bridgeObjectRelease();
          v24 = (uint64_t)v495;
LABEL_277:
          sub_249D8A014(v24, (char **)v63, v173, a5);
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          v174 = (char **)v498[9];
          v9 = (unint64_t)*v8;
          v175 = swift_bridgeObjectRetain();
          v176 = sub_249D7B078(v175);
          swift_bridgeObjectRelease();
          if (v176 <= 1)
          {
            v63 = 0xC3E0000000000001;
            v107 = 0x7FF0000000000000;
            do
            {
              v180 = *(double *)(v7 + 48);
              v179 = *(double *)(v7 + 56);
              v181 = (void *)objc_opt_self();
              if (v180 <= -9.22337204e18)
                goto LABEL_803;
              if (v180 >= 9.22337204e18)
                goto LABEL_804;
              if ((*(_QWORD *)&v180 & 0x7FF0000000000000) == 0x7FF0000000000000
                || (*(_QWORD *)&v179 & 0x7FF0000000000000) == 0x7FF0000000000000)
              {
                goto LABEL_805;
              }
              if (v179 <= -9.22337204e18)
                goto LABEL_806;
              if (v179 >= 9.22337204e18)
                goto LABEL_807;
              v183 = objc_msgSend(v181, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v180, (uint64_t)v179, 0);
              objc_msgSend(v183, sel_setUsage_, 5);
              v184 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v183);

              if (v184)
              {
                swift_beginAccess();
                v185 = swift_unknownObjectRetain();
                MEMORY[0x24BD037C0](v185);
                v24 = *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10);
                sub_249D81E24(v24);
                sub_249D8B918();
                sub_249D8B900();
                swift_endAccess();
                swift_unknownObjectRelease();
              }
              v9 = (unint64_t)*v8;
              v177 = swift_bridgeObjectRetain();
              v178 = sub_249D7B078(v177);
              swift_bridgeObjectRelease();
            }
            while (v178 < 2);
          }
          v9 = (unint64_t)*v8;
          a2 = v174;
          if (((unint64_t)*v8 & 0xC000000000000001) != 0)
            goto LABEL_984;
          if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
          {
            v202 = *(_QWORD *)(v9 + 40);
            swift_unknownObjectRetain();
            goto LABEL_318;
          }
          __break(1u);
LABEL_986:
          swift_bridgeObjectRetain();
          v214 = (char **)MEMORY[0x24BD038A4](2, v9);
          swift_bridgeObjectRelease();
LABEL_334:
          sub_249D8A1C0(v494, v214, a5);
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          a2 = (char **)v498[13];
          v9 = (unint64_t)*v8;
          v215 = swift_bridgeObjectRetain();
          v216 = sub_249D7B078(v215);
          swift_bridgeObjectRelease();
          if (v216 > 1)
          {
LABEL_367:
            v9 = (unint64_t)*v8;
            if (((unint64_t)*v8 & 0xC000000000000001) == 0)
            {
              if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
              {
                v494 = *(_QWORD *)(v9 + 40);
                swift_unknownObjectRetain();
                goto LABEL_370;
              }
              __break(1u);
LABEL_994:
              swift_bridgeObjectRetain();
              v242 = (char **)MEMORY[0x24BD038A4](0, v9);
              swift_bridgeObjectRelease();
LABEL_374:
              sub_249D8A1C0(v494, v242, a5);
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              a2 = (char **)v498[14];
              v9 = (unint64_t)*v8;
              v243 = swift_bridgeObjectRetain();
              v244 = sub_249D7B078(v243);
              swift_bridgeObjectRelease();
              if (v244 <= 3)
              {
                do
                {
                  v248 = *(double *)(v7 + 48);
                  v247 = *(double *)(v7 + 56);
                  v249 = (void *)objc_opt_self();
                  if (v248 <= -9.22337204e18)
                    goto LABEL_828;
                  if (v248 >= 9.22337204e18)
                    goto LABEL_829;
                  if ((*(_QWORD *)&v248 & 0x7FF0000000000000) == 0x7FF0000000000000
                    || (*(_QWORD *)&v247 & 0x7FF0000000000000) == 0x7FF0000000000000)
                  {
                    goto LABEL_830;
                  }
                  if (v247 <= -9.22337204e18)
                    goto LABEL_831;
                  if (v247 >= 9.22337204e18)
                    goto LABEL_832;
                  v251 = objc_msgSend(v249, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v248, (uint64_t)v247, 0);
                  objc_msgSend(v251, sel_setUsage_, 5);
                  v252 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v251);

                  if (v252)
                  {
                    swift_beginAccess();
                    v253 = swift_unknownObjectRetain();
                    MEMORY[0x24BD037C0](v253);
                    sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
                    sub_249D8B918();
                    sub_249D8B900();
                    swift_endAccess();
                    swift_unknownObjectRelease();
                  }
                  v9 = (unint64_t)*v8;
                  v245 = swift_bridgeObjectRetain();
                  v246 = sub_249D7B078(v245);
                  swift_bridgeObjectRelease();
                }
                while (v246 < 4);
              }
              v9 = (unint64_t)*v8;
              if (((unint64_t)*v8 & 0xC000000000000001) != 0)
                goto LABEL_998;
              if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 3uLL)
              {
                v494 = *(_QWORD *)(v9 + 56);
                swift_unknownObjectRetain();
                goto LABEL_394;
              }
              __break(1u);
LABEL_1000:
              swift_bridgeObjectRetain();
              v266 = (char **)MEMORY[0x24BD038A4](1, v9);
              swift_bridgeObjectRelease();
LABEL_410:
              sub_249D8A1C0(v494, v266, a5);
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              a2 = (char **)v498[15];
              v9 = (unint64_t)*v8;
              v267 = swift_bridgeObjectRetain();
              v268 = sub_249D7B078(v267);
              swift_bridgeObjectRelease();
              if (v268 <= 1)
              {
                do
                {
                  v272 = *(double *)(v7 + 48);
                  v271 = *(double *)(v7 + 56);
                  v273 = (void *)objc_opt_self();
                  if (v272 <= -9.22337204e18)
                    goto LABEL_848;
                  if (v272 >= 9.22337204e18)
                    goto LABEL_849;
                  if ((*(_QWORD *)&v272 & 0x7FF0000000000000) == 0x7FF0000000000000
                    || (*(_QWORD *)&v271 & 0x7FF0000000000000) == 0x7FF0000000000000)
                  {
                    goto LABEL_850;
                  }
                  if (v271 <= -9.22337204e18)
                    goto LABEL_851;
                  if (v271 >= 9.22337204e18)
                    goto LABEL_852;
                  v275 = objc_msgSend(v273, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v272, (uint64_t)v271, 0);
                  objc_msgSend(v275, sel_setUsage_, 5);
                  v276 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v275);

                  if (v276)
                  {
                    swift_beginAccess();
                    v277 = swift_unknownObjectRetain();
                    MEMORY[0x24BD037C0](v277);
                    sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
                    sub_249D8B918();
                    sub_249D8B900();
                    swift_endAccess();
                    swift_unknownObjectRelease();
                  }
                  v9 = (unint64_t)*v8;
                  v269 = swift_bridgeObjectRetain();
                  v270 = sub_249D7B078(v269);
                  swift_bridgeObjectRelease();
                }
                while (v270 < 2);
              }
              v9 = (unint64_t)*v8;
              if (((unint64_t)*v8 & 0xC000000000000001) != 0)
                goto LABEL_1002;
              if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
              {
                v494 = *(_QWORD *)(v9 + 40);
                swift_unknownObjectRetain();
                goto LABEL_426;
              }
              __break(1u);
LABEL_1004:
              swift_bridgeObjectRetain();
              v289 = (char **)MEMORY[0x24BD038A4](3, v9);
              swift_bridgeObjectRelease();
LABEL_442:
              sub_249D8A1C0(v494, v289, a5);
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              a2 = (char **)v498[8];
              v9 = *(_QWORD *)v24;
              v290 = swift_bridgeObjectRetain();
              v291 = sub_249D7B078(v290);
              swift_bridgeObjectRelease();
              if (v291 <= 1)
              {
                do
                {
                  v295 = *(double *)(v7 + 64);
                  v294 = *(double *)(v7 + 72);
                  v296 = (void *)objc_opt_self();
                  if (v295 <= -9.22337204e18)
                    goto LABEL_868;
                  if (v295 >= 9.22337204e18)
                    goto LABEL_869;
                  if ((*(_QWORD *)&v295 & 0x7FF0000000000000) == 0x7FF0000000000000
                    || (*(_QWORD *)&v294 & 0x7FF0000000000000) == 0x7FF0000000000000)
                  {
                    goto LABEL_870;
                  }
                  if (v294 <= -9.22337204e18)
                    goto LABEL_871;
                  if (v294 >= 9.22337204e18)
                    goto LABEL_872;
                  v298 = objc_msgSend(v296, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v295, (uint64_t)v294, 0);
                  objc_msgSend(v298, sel_setUsage_, 5);
                  v299 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v298);

                  if (v299)
                  {
                    swift_beginAccess();
                    v300 = swift_unknownObjectRetain();
                    MEMORY[0x24BD037C0](v300);
                    sub_249D81E24(*(_QWORD *)((*(_QWORD *)v24 & 0xFFFFFFFFFFFFF8) + 0x10));
                    sub_249D8B918();
                    sub_249D8B900();
                    swift_endAccess();
                    swift_unknownObjectRelease();
                  }
                  v9 = *(_QWORD *)v24;
                  v292 = swift_bridgeObjectRetain();
                  v293 = sub_249D7B078(v292);
                  swift_bridgeObjectRelease();
                }
                while (v293 < 2);
              }
              v9 = *(_QWORD *)v24;
              if ((*(_QWORD *)v24 & 0xC000000000000001) != 0)
                goto LABEL_1006;
              if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
              {
                v494 = *(_QWORD *)(v9 + 40);
                swift_unknownObjectRetain();
                goto LABEL_458;
              }
              __break(1u);
LABEL_1008:
              swift_bridgeObjectRetain();
              v493 = (char **)MEMORY[0x24BD038A4](0, v9);
              swift_bridgeObjectRelease();
LABEL_462:
              v9 = (unint64_t)*v8;
              v303 = swift_bridgeObjectRetain();
              v304 = sub_249D7B078(v303);
              swift_bridgeObjectRelease();
              if (v304 <= 1)
              {
                do
                {
                  v308 = *(double *)(v7 + 48);
                  v307 = *(double *)(v7 + 56);
                  v309 = (void *)objc_opt_self();
                  if (v308 <= -9.22337204e18)
                    goto LABEL_878;
                  if (v308 >= 9.22337204e18)
                    goto LABEL_879;
                  if ((*(_QWORD *)&v308 & 0x7FF0000000000000) == 0x7FF0000000000000
                    || (*(_QWORD *)&v307 & 0x7FF0000000000000) == 0x7FF0000000000000)
                  {
                    goto LABEL_880;
                  }
                  if (v307 <= -9.22337204e18)
                    goto LABEL_881;
                  if (v307 >= 9.22337204e18)
                    goto LABEL_882;
                  v311 = objc_msgSend(v309, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v308, (uint64_t)v307, 0);
                  objc_msgSend(v311, sel_setUsage_, 5);
                  v312 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v311);

                  if (v312)
                  {
                    swift_beginAccess();
                    v313 = swift_unknownObjectRetain();
                    MEMORY[0x24BD037C0](v313);
                    sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
                    sub_249D8B918();
                    sub_249D8B900();
                    swift_endAccess();
                    swift_unknownObjectRelease();
                  }
                  v9 = (unint64_t)*v8;
                  v305 = swift_bridgeObjectRetain();
                  v306 = sub_249D7B078(v305);
                  swift_bridgeObjectRelease();
                }
                while (v306 < 2);
              }
              v9 = (unint64_t)*v8;
              if (((unint64_t)*v8 & 0xC000000000000001) != 0)
                goto LABEL_1010;
              if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
              {
                v314 = *(_QWORD *)(v9 + 40);
                swift_unknownObjectRetain();
                goto LABEL_478;
              }
              __break(1u);
LABEL_1012:
              swift_bridgeObjectRetain();
              v494 = MEMORY[0x24BD038A4](1, v9);
              swift_bridgeObjectRelease();
              v9 = (unint64_t)*v8;
LABEL_494:
              v326 = swift_bridgeObjectRetain();
              v327 = sub_249D7B078(v326);
              swift_bridgeObjectRelease();
              if (v327 <= 2)
              {
                do
                {
                  v331 = *(double *)(v7 + 48);
                  v330 = *(double *)(v7 + 56);
                  v332 = (void *)objc_opt_self();
                  if (v331 <= -9.22337204e18)
                    goto LABEL_898;
                  if (v331 >= 9.22337204e18)
                    goto LABEL_899;
                  if ((*(_QWORD *)&v331 & 0x7FF0000000000000) == 0x7FF0000000000000
                    || (*(_QWORD *)&v330 & 0x7FF0000000000000) == 0x7FF0000000000000)
                  {
                    goto LABEL_900;
                  }
                  if (v330 <= -9.22337204e18)
                    goto LABEL_901;
                  if (v330 >= 9.22337204e18)
                    goto LABEL_902;
                  v334 = objc_msgSend(v332, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v331, (uint64_t)v330, 0);
                  objc_msgSend(v334, sel_setUsage_, 5);
                  v335 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v334);

                  if (v335)
                  {
                    swift_beginAccess();
                    v336 = swift_unknownObjectRetain();
                    MEMORY[0x24BD037C0](v336);
                    sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
                    sub_249D8B918();
                    sub_249D8B900();
                    swift_endAccess();
                    swift_unknownObjectRelease();
                  }
                  v9 = (unint64_t)*v8;
                  v328 = swift_bridgeObjectRetain();
                  v329 = sub_249D7B078(v328);
                  swift_bridgeObjectRelease();
                }
                while (v329 < 3);
              }
              v9 = (unint64_t)*v8;
              if (((unint64_t)*v8 & 0xC000000000000001) != 0)
                goto LABEL_1014;
              if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 2uLL)
              {
                v493 = *(char ***)(v9 + 48);
                swift_unknownObjectRetain();
                goto LABEL_510;
              }
              __break(1u);
LABEL_1016:
              swift_bridgeObjectRetain();
              v340 = MEMORY[0x24BD038A4](0, v9);
              swift_bridgeObjectRelease();
              v339 = v495;
LABEL_514:
              sub_249D8A014(v494, v493, v340, a5);
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              if (v339)
              {
                a2 = (char **)v498[11];
                swift_unknownObjectRetain();
                v9 = *(_QWORD *)v24;
                v341 = swift_bridgeObjectRetain();
                v342 = sub_249D7B078(v341);
                swift_bridgeObjectRelease();
                if (v342 <= 0)
                {
                  do
                  {
                    v478 = *(double *)(v7 + 64);
                    v477 = *(double *)(v7 + 72);
                    v479 = (void *)objc_opt_self();
                    if (v478 <= -9.22337204e18)
                      goto LABEL_923;
                    if (v478 >= 9.22337204e18)
                      goto LABEL_924;
                    if ((*(_QWORD *)&v478 & 0x7FF0000000000000) == 0x7FF0000000000000
                      || (*(_QWORD *)&v477 & 0x7FF0000000000000) == 0x7FF0000000000000)
                    {
                      goto LABEL_925;
                    }
                    if (v477 <= -9.22337204e18)
                      goto LABEL_926;
                    if (v477 >= 9.22337204e18)
                      goto LABEL_927;
                    v481 = objc_msgSend(v479, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v478, (uint64_t)v477, 0);
                    objc_msgSend(v481, sel_setUsage_, 5);
                    v482 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v481);

                    if (v482)
                    {
                      swift_beginAccess();
                      v483 = swift_unknownObjectRetain();
                      MEMORY[0x24BD037C0](v483);
                      sub_249D81E24(*(_QWORD *)((*(_QWORD *)v24 & 0xFFFFFFFFFFFFF8) + 0x10));
                      sub_249D8B918();
                      sub_249D8B900();
                      swift_endAccess();
                      swift_unknownObjectRelease();
                    }
                    v9 = *(_QWORD *)v24;
                    v475 = swift_bridgeObjectRetain();
                    v476 = sub_249D7B078(v475);
                    swift_bridgeObjectRelease();
                  }
                  while (v476 < 1);
                }
                v9 = *(_QWORD *)v24;
                if ((*(_QWORD *)v24 & 0xC000000000000001) != 0)
                  goto LABEL_1018;
                if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
                {
                  v494 = *(_QWORD *)(v9 + 32);
                  swift_unknownObjectRetain();
                  goto LABEL_519;
                }
                __break(1u);
                goto LABEL_1020;
              }
              v498 = (_QWORD *)v498[11];
              v9 = (unint64_t)*v8;
              v451 = swift_bridgeObjectRetain();
              v452 = sub_249D7B078(v451);
              swift_bridgeObjectRelease();
              if (v452 <= 1)
              {
                do
                {
                  v456 = *(double *)(v7 + 48);
                  v455 = *(double *)(v7 + 56);
                  v457 = (void *)objc_opt_self();
                  if (v456 <= -9.22337204e18)
                    goto LABEL_933;
                  if (v456 >= 9.22337204e18)
                    goto LABEL_934;
                  if ((*(_QWORD *)&v456 & 0x7FF0000000000000) == 0x7FF0000000000000
                    || (*(_QWORD *)&v455 & 0x7FF0000000000000) == 0x7FF0000000000000)
                  {
                    goto LABEL_935;
                  }
                  if (v455 <= -9.22337204e18)
                    goto LABEL_936;
                  if (v455 >= 9.22337204e18)
                    goto LABEL_937;
                  v459 = objc_msgSend(v457, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v456, (uint64_t)v455, 0);
                  objc_msgSend(v459, sel_setUsage_, 5);
                  v460 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v459);

                  if (v460)
                  {
                    swift_beginAccess();
                    v461 = swift_unknownObjectRetain();
                    MEMORY[0x24BD037C0](v461);
                    sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
                    sub_249D8B918();
                    sub_249D8B900();
                    swift_endAccess();
                    swift_unknownObjectRelease();
                  }
                  v9 = (unint64_t)*v8;
                  v453 = swift_bridgeObjectRetain();
                  v454 = sub_249D7B078(v453);
                  swift_bridgeObjectRelease();
                }
                while (v454 < 2);
              }
              v9 = (unint64_t)*v8;
              if (((unint64_t)*v8 & 0xC000000000000001) != 0)
                goto LABEL_1026;
              if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
              {
                v8 = *(char ***)(v9 + 40);
                swift_unknownObjectRetain();
                goto LABEL_680;
              }
              __break(1u);
LABEL_1028:
              swift_bridgeObjectRetain();
              v474 = MEMORY[0x24BD038A4](1, v9);
              swift_bridgeObjectRelease();
LABEL_696:
              sub_249D8A014(a3, v8, v474, a5);
LABEL_697:
              swift_unknownObjectRelease();
              return swift_unknownObjectRelease();
            }
LABEL_992:
            swift_bridgeObjectRetain();
            v494 = MEMORY[0x24BD038A4](1, v9);
            swift_bridgeObjectRelease();
LABEL_370:
            v9 = *(_QWORD *)v24;
            v240 = swift_bridgeObjectRetain();
            v241 = sub_249D7B078(v240);
            swift_bridgeObjectRelease();
            if (v241 <= 0)
            {
              do
              {
                v427 = *(double *)(v7 + 64);
                v426 = *(double *)(v7 + 72);
                v428 = (void *)objc_opt_self();
                if (v427 <= -9.22337204e18)
                  goto LABEL_893;
                if (v427 >= 9.22337204e18)
                  goto LABEL_894;
                if ((*(_QWORD *)&v427 & 0x7FF0000000000000) == 0x7FF0000000000000
                  || (*(_QWORD *)&v426 & 0x7FF0000000000000) == 0x7FF0000000000000)
                {
                  goto LABEL_895;
                }
                if (v426 <= -9.22337204e18)
                  goto LABEL_896;
                if (v426 >= 9.22337204e18)
                  goto LABEL_897;
                v430 = objc_msgSend(v428, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v427, (uint64_t)v426, 0);
                objc_msgSend(v430, sel_setUsage_, 5);
                v431 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v430);

                if (v431)
                {
                  swift_beginAccess();
                  v432 = swift_unknownObjectRetain();
                  MEMORY[0x24BD037C0](v432);
                  sub_249D81E24(*(_QWORD *)((*(_QWORD *)v24 & 0xFFFFFFFFFFFFF8) + 0x10));
                  sub_249D8B918();
                  sub_249D8B900();
                  swift_endAccess();
                  swift_unknownObjectRelease();
                }
                v9 = *(_QWORD *)v24;
                v424 = swift_bridgeObjectRetain();
                v425 = sub_249D7B078(v424);
                swift_bridgeObjectRelease();
              }
              while (v425 < 1);
            }
            v9 = *(_QWORD *)v24;
            if ((*(_QWORD *)v24 & 0xC000000000000001) != 0)
              goto LABEL_994;
            if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              v242 = *(char ***)(v9 + 32);
              swift_unknownObjectRetain();
              goto LABEL_374;
            }
            __break(1u);
LABEL_996:
            swift_bridgeObjectRetain();
            v254 = (char **)MEMORY[0x24BD038A4](1, v9);
            swift_bridgeObjectRelease();
LABEL_390:
            sub_249D8A1C0(a3, v254, a5);
            return swift_unknownObjectRelease();
          }
          while (1)
          {
            v220 = *(double *)(v7 + 48);
            v219 = *(double *)(v7 + 56);
            v221 = (void *)objc_opt_self();
            if (v220 <= -9.22337204e18)
              break;
            if (v220 >= 9.22337204e18)
              goto LABEL_819;
            if ((*(_QWORD *)&v220 & 0x7FF0000000000000) == 0x7FF0000000000000
              || (*(_QWORD *)&v219 & 0x7FF0000000000000) == 0x7FF0000000000000)
            {
              goto LABEL_820;
            }
            if (v219 <= -9.22337204e18)
              goto LABEL_821;
            if (v219 >= 9.22337204e18)
              goto LABEL_822;
            v223 = objc_msgSend(v221, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v220, (uint64_t)v219, 0);
            objc_msgSend(v223, sel_setUsage_, 5);
            v224 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v223);

            if (v224)
            {
              swift_beginAccess();
              v225 = swift_unknownObjectRetain();
              MEMORY[0x24BD037C0](v225);
              sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
              sub_249D8B918();
              sub_249D8B900();
              swift_endAccess();
              swift_unknownObjectRelease();
            }
            v9 = (unint64_t)*v8;
            v217 = swift_bridgeObjectRetain();
            v218 = sub_249D7B078(v217);
            swift_bridgeObjectRelease();
            if (v218 >= 2)
              goto LABEL_367;
          }
LABEL_818:
          __break(1u);
LABEL_819:
          __break(1u);
LABEL_820:
          __break(1u);
LABEL_821:
          __break(1u);
LABEL_822:
          __break(1u);
LABEL_823:
          __break(1u);
LABEL_824:
          __break(1u);
LABEL_825:
          __break(1u);
LABEL_826:
          __break(1u);
LABEL_827:
          __break(1u);
LABEL_828:
          __break(1u);
LABEL_829:
          __break(1u);
LABEL_830:
          __break(1u);
LABEL_831:
          __break(1u);
LABEL_832:
          __break(1u);
LABEL_833:
          __break(1u);
LABEL_834:
          __break(1u);
LABEL_835:
          __break(1u);
LABEL_836:
          __break(1u);
LABEL_837:
          __break(1u);
LABEL_838:
          __break(1u);
LABEL_839:
          __break(1u);
LABEL_840:
          __break(1u);
LABEL_841:
          __break(1u);
LABEL_842:
          __break(1u);
LABEL_843:
          __break(1u);
LABEL_844:
          __break(1u);
LABEL_845:
          __break(1u);
LABEL_846:
          __break(1u);
LABEL_847:
          __break(1u);
LABEL_848:
          __break(1u);
LABEL_849:
          __break(1u);
LABEL_850:
          __break(1u);
LABEL_851:
          __break(1u);
LABEL_852:
          __break(1u);
LABEL_853:
          __break(1u);
LABEL_854:
          __break(1u);
LABEL_855:
          __break(1u);
LABEL_856:
          __break(1u);
LABEL_857:
          __break(1u);
LABEL_858:
          __break(1u);
LABEL_859:
          __break(1u);
LABEL_860:
          __break(1u);
LABEL_861:
          __break(1u);
LABEL_862:
          __break(1u);
LABEL_863:
          __break(1u);
LABEL_864:
          __break(1u);
LABEL_865:
          __break(1u);
LABEL_866:
          __break(1u);
LABEL_867:
          __break(1u);
LABEL_868:
          __break(1u);
LABEL_869:
          __break(1u);
LABEL_870:
          __break(1u);
LABEL_871:
          __break(1u);
LABEL_872:
          __break(1u);
LABEL_873:
          __break(1u);
LABEL_874:
          __break(1u);
LABEL_875:
          __break(1u);
LABEL_876:
          __break(1u);
LABEL_877:
          __break(1u);
LABEL_878:
          __break(1u);
LABEL_879:
          __break(1u);
LABEL_880:
          __break(1u);
LABEL_881:
          __break(1u);
LABEL_882:
          __break(1u);
LABEL_883:
          __break(1u);
LABEL_884:
          __break(1u);
LABEL_885:
          __break(1u);
LABEL_886:
          __break(1u);
LABEL_887:
          __break(1u);
LABEL_888:
          __break(1u);
LABEL_889:
          __break(1u);
LABEL_890:
          __break(1u);
LABEL_891:
          __break(1u);
LABEL_892:
          __break(1u);
LABEL_893:
          __break(1u);
LABEL_894:
          __break(1u);
LABEL_895:
          __break(1u);
LABEL_896:
          __break(1u);
LABEL_897:
          __break(1u);
LABEL_898:
          __break(1u);
LABEL_899:
          __break(1u);
LABEL_900:
          __break(1u);
LABEL_901:
          __break(1u);
LABEL_902:
          __break(1u);
LABEL_903:
          __break(1u);
LABEL_904:
          __break(1u);
LABEL_905:
          __break(1u);
LABEL_906:
          __break(1u);
LABEL_907:
          __break(1u);
LABEL_908:
          __break(1u);
LABEL_909:
          __break(1u);
LABEL_910:
          __break(1u);
LABEL_911:
          __break(1u);
LABEL_912:
          __break(1u);
LABEL_913:
          __break(1u);
LABEL_914:
          __break(1u);
LABEL_915:
          __break(1u);
LABEL_916:
          __break(1u);
LABEL_917:
          __break(1u);
LABEL_918:
          __break(1u);
LABEL_919:
          __break(1u);
LABEL_920:
          __break(1u);
LABEL_921:
          __break(1u);
LABEL_922:
          __break(1u);
LABEL_923:
          __break(1u);
LABEL_924:
          __break(1u);
LABEL_925:
          __break(1u);
LABEL_926:
          __break(1u);
LABEL_927:
          __break(1u);
LABEL_928:
          __break(1u);
LABEL_929:
          __break(1u);
LABEL_930:
          __break(1u);
LABEL_931:
          __break(1u);
LABEL_932:
          __break(1u);
LABEL_933:
          __break(1u);
LABEL_934:
          __break(1u);
LABEL_935:
          __break(1u);
LABEL_936:
          __break(1u);
LABEL_937:
          __break(1u);
LABEL_938:
          __break(1u);
LABEL_939:
          __break(1u);
LABEL_940:
          __break(1u);
LABEL_941:
          __break(1u);
LABEL_942:
          __break(1u);
LABEL_943:
          swift_bridgeObjectRetain();
          v23 = MEMORY[0x24BD038A4](0, v9);
          swift_bridgeObjectRelease();
LABEL_35:
          sub_249D8A1C0(v23, a2, a5);
          swift_unknownObjectRelease();
          v6 = 0xC3E0000000000001;
          v24 = 0x7FF0000000000000;
          while (2)
          {
            v9 = (unint64_t)*v8;
            if (!((unint64_t)*v8 >> 62))
            {
              if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1)
                break;
              goto LABEL_38;
            }
            swift_bridgeObjectRetain();
            v31 = sub_249D8BA08();
            swift_bridgeObjectRelease();
            if (v31 <= 1)
            {
LABEL_38:
              v26 = *(double *)(v7 + 48);
              v25 = *(double *)(v7 + 56);
              v27 = (void *)objc_opt_self();
              if (v26 <= -9.22337204e18)
                goto LABEL_733;
              if (v26 >= 9.22337204e18)
                goto LABEL_735;
              if ((*(_QWORD *)&v26 & 0x7FF0000000000000) == 0x7FF0000000000000
                || (*(_QWORD *)&v25 & 0x7FF0000000000000) == 0x7FF0000000000000)
              {
                goto LABEL_736;
              }
              if (v25 <= -9.22337204e18)
                goto LABEL_739;
              if (v25 >= 9.22337204e18)
                goto LABEL_741;
              v28 = objc_msgSend(v27, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v26, (uint64_t)v25, 0);
              objc_msgSend(v28, sel_setUsage_, 5);
              v29 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v28);

              if (v29)
              {
                swift_beginAccess();
                v30 = swift_unknownObjectRetain();
                MEMORY[0x24BD037C0](v30);
                if (*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                  sub_249D8B90C();
                sub_249D8B918();
                sub_249D8B900();
                swift_endAccess();
                swift_unknownObjectRelease();
              }
              continue;
            }
            break;
          }
          v9 = (unint64_t)*v8;
          if (((unint64_t)*v8 & 0xC000000000000001) == 0)
          {
            if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
            {
              v33 = *(_QWORD *)(v9 + 40);
              swift_unknownObjectRetain();
              continue;
            }
            __break(1u);
            goto LABEL_949;
          }
          goto LABEL_947;
        }
      }
      else if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 0)
      {
        goto LABEL_102;
      }
      v42 = *(double *)(v7 + 48);
      v41 = *(double *)(v7 + 56);
      v43 = (void *)objc_opt_self();
      if (v42 <= -9.22337204e18)
        goto LABEL_743;
      if (v42 >= 9.22337204e18)
        goto LABEL_745;
      if ((*(_QWORD *)&v42 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v41 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_747;
      }
      if (v41 <= -9.22337204e18)
        goto LABEL_749;
      if (v41 >= 9.22337204e18)
        goto LABEL_751;
      v44 = objc_msgSend(v43, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v42, (uint64_t)v41, 0);
      objc_msgSend(v44, sel_setUsage_, 5);
      v6 = (uint64_t)objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v44);

      if (v6)
      {
        swift_beginAccess();
        v45 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v45);
        if (*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8)
                                                                                            + 0x18) >> 1)
          sub_249D8B90C();
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
    }
  }
  swift_beginAccess();
  while (1)
  {
    v9 = (unint64_t)*v8;
    if ((unint64_t)*v8 >> 62)
      break;
    if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 0)
      goto LABEL_32;
LABEL_5:
    v11 = *(double *)(v7 + 48);
    v10 = *(double *)(v7 + 56);
    v12 = (void *)objc_opt_self();
    if (v11 <= -9.22337204e18)
    {
      __break(1u);
LABEL_724:
      __break(1u);
LABEL_725:
      __break(1u);
LABEL_726:
      __break(1u);
LABEL_727:
      __break(1u);
LABEL_728:
      __break(1u);
LABEL_729:
      __break(1u);
LABEL_730:
      __break(1u);
LABEL_731:
      __break(1u);
LABEL_732:
      __break(1u);
LABEL_733:
      __break(1u);
LABEL_734:
      __break(1u);
LABEL_735:
      __break(1u);
LABEL_736:
      __break(1u);
LABEL_737:
      __break(1u);
LABEL_738:
      __break(1u);
LABEL_739:
      __break(1u);
LABEL_740:
      __break(1u);
LABEL_741:
      __break(1u);
LABEL_742:
      __break(1u);
LABEL_743:
      __break(1u);
LABEL_744:
      __break(1u);
LABEL_745:
      __break(1u);
LABEL_746:
      __break(1u);
LABEL_747:
      __break(1u);
LABEL_748:
      __break(1u);
LABEL_749:
      __break(1u);
LABEL_750:
      __break(1u);
LABEL_751:
      __break(1u);
LABEL_752:
      __break(1u);
LABEL_753:
      __break(1u);
LABEL_754:
      __break(1u);
LABEL_755:
      __break(1u);
LABEL_756:
      __break(1u);
LABEL_757:
      __break(1u);
LABEL_758:
      __break(1u);
LABEL_759:
      __break(1u);
LABEL_760:
      __break(1u);
LABEL_761:
      __break(1u);
LABEL_762:
      __break(1u);
      goto LABEL_763;
    }
    if (v11 >= 9.22337204e18)
      goto LABEL_725;
    if ((*(_QWORD *)&v11 & 0x7FF0000000000000) == 0x7FF0000000000000
      || (*(_QWORD *)&v10 & 0x7FF0000000000000) == 0x7FF0000000000000)
    {
      goto LABEL_727;
    }
    if (v10 <= -9.22337204e18)
      goto LABEL_729;
    if (v10 >= 9.22337204e18)
      goto LABEL_731;
    v13 = objc_msgSend(v12, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v11, (uint64_t)v10, 0);
    objc_msgSend(v13, sel_setUsage_, 5);
    v14 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v13);

    if (v14)
    {
      swift_beginAccess();
      v15 = swift_unknownObjectRetain();
      MEMORY[0x24BD037C0](v15);
      if (*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8)
                                                                                          + 0x18) >> 1)
        sub_249D8B90C();
      sub_249D8B918();
      sub_249D8B900();
      swift_endAccess();
      swift_unknownObjectRelease();
    }
  }
  swift_bridgeObjectRetain();
  v16 = sub_249D8BA08();
  swift_bridgeObjectRelease();
  if (v16 <= 0)
    goto LABEL_5;
LABEL_32:
  v9 = (unint64_t)*v8;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
    goto LABEL_943;
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v23 = *(_QWORD *)(v9 + 32);
    swift_unknownObjectRetain();
    goto LABEL_35;
  }
  __break(1u);
LABEL_945:
  swift_bridgeObjectRetain();
  v32 = MEMORY[0x24BD038A4](0, v9);
  swift_bridgeObjectRelease();
LABEL_53:
  sub_249D8A1C0(v32, a2, a5);
  swift_unknownObjectRelease();
  v33 = v498[3];
  v24 = 0x7FF0000000000000;
  while (2)
  {
    v9 = (unint64_t)*v8;
    if (!((unint64_t)*v8 >> 62))
    {
      if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1)
        break;
      goto LABEL_56;
    }
    swift_bridgeObjectRetain();
    v40 = sub_249D8BA08();
    swift_bridgeObjectRelease();
    if (v40 <= 1)
    {
LABEL_56:
      v35 = *(double *)(v7 + 48);
      v34 = *(double *)(v7 + 56);
      v36 = (void *)objc_opt_self();
      if (v35 <= -9.22337204e18)
        goto LABEL_734;
      if (v35 >= 9.22337204e18)
        goto LABEL_737;
      if ((*(_QWORD *)&v35 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v34 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_738;
      }
      if (v34 <= -9.22337204e18)
        goto LABEL_740;
      if (v34 >= 9.22337204e18)
        goto LABEL_742;
      v37 = objc_msgSend(v36, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v35, (uint64_t)v34, 0);
      objc_msgSend(v37, sel_setUsage_, 5);
      v38 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v37);

      if (v38)
      {
        swift_beginAccess();
        v39 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v39);
        if (*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8)
                                                                                            + 0x18) >> 1)
          sub_249D8B90C();
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      continue;
    }
    break;
  }
  v9 = (unint64_t)*v8;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
  {
LABEL_949:
    swift_bridgeObjectRetain();
    v6 = MEMORY[0x24BD038A4](1, v9);
    swift_bridgeObjectRelease();
    while (1)
    {
LABEL_88:
      v9 = (unint64_t)*v8;
      if ((unint64_t)*v8 >> 62)
      {
        swift_bridgeObjectRetain();
        v53 = sub_249D8BA08();
        swift_bridgeObjectRelease();
        if (v53 > 0)
        {
LABEL_133:
          v9 = (unint64_t)*v8;
          if (((unint64_t)*v8 & 0xC000000000000001) != 0)
            goto LABEL_953;
          if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            v75 = *(char ***)(v9 + 32);
            swift_unknownObjectRetain();
            goto LABEL_136;
          }
          __break(1u);
LABEL_955:
          swift_bridgeObjectRetain();
          v63 = MEMORY[0x24BD038A4](0, v9);
          swift_bridgeObjectRelease();
          v9 = (unint64_t)*v8;
LABEL_120:
          v64 = swift_bridgeObjectRetain();
          v65 = sub_249D7B078(v64);
          swift_bridgeObjectRelease();
          if (v65 > 1)
          {
LABEL_166:
            v76 = (unint64_t)*v8;
            if (((unint64_t)*v8 & 0xC000000000000001) != 0)
              goto LABEL_959;
            v9 = (unint64_t)v495;
            if (*(_QWORD *)((v76 & 0xFFFFFFFFFFFFF8) + 0x10) <= 1uLL)
            {
              __break(1u);
              goto LABEL_962;
            }
            v94 = *(char ***)(v76 + 40);
            swift_unknownObjectRetain();
            goto LABEL_169;
          }
          v24 = 0xC3E0000000000001;
          while (1)
          {
            v69 = *(double *)(v7 + 48);
            v68 = *(double *)(v7 + 56);
            v70 = (void *)objc_opt_self();
            if (v69 <= -9.22337204e18)
              break;
            if (v69 >= 9.22337204e18)
              goto LABEL_765;
            if ((*(_QWORD *)&v69 & 0x7FF0000000000000) == 0x7FF0000000000000
              || (*(_QWORD *)&v68 & 0x7FF0000000000000) == 0x7FF0000000000000)
            {
              goto LABEL_766;
            }
            if (v68 <= -9.22337204e18)
              goto LABEL_767;
            if (v68 >= 9.22337204e18)
              goto LABEL_771;
            v72 = objc_msgSend(v70, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v69, (uint64_t)v68, 0);
            objc_msgSend(v72, sel_setUsage_, 5);
            v73 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v72);

            if (v73)
            {
              swift_beginAccess();
              v74 = swift_unknownObjectRetain();
              MEMORY[0x24BD037C0](v74);
              v6 = *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10);
              sub_249D81E24(v6);
              sub_249D8B918();
              sub_249D8B900();
              swift_endAccess();
              swift_unknownObjectRelease();
            }
            v9 = (unint64_t)*v8;
            v66 = swift_bridgeObjectRetain();
            v67 = sub_249D7B078(v66);
            swift_bridgeObjectRelease();
            if (v67 >= 2)
              goto LABEL_166;
          }
LABEL_763:
          __break(1u);
LABEL_764:
          __break(1u);
LABEL_765:
          __break(1u);
LABEL_766:
          __break(1u);
LABEL_767:
          __break(1u);
LABEL_768:
          __break(1u);
LABEL_769:
          __break(1u);
LABEL_770:
          __break(1u);
LABEL_771:
          __break(1u);
LABEL_772:
          __break(1u);
LABEL_773:
          __break(1u);
LABEL_774:
          __break(1u);
LABEL_775:
          __break(1u);
LABEL_776:
          __break(1u);
LABEL_777:
          __break(1u);
LABEL_778:
          __break(1u);
LABEL_779:
          __break(1u);
LABEL_780:
          __break(1u);
LABEL_781:
          __break(1u);
LABEL_782:
          __break(1u);
LABEL_783:
          __break(1u);
LABEL_784:
          __break(1u);
LABEL_785:
          __break(1u);
LABEL_786:
          __break(1u);
LABEL_787:
          __break(1u);
LABEL_788:
          __break(1u);
LABEL_789:
          __break(1u);
LABEL_790:
          __break(1u);
LABEL_791:
          __break(1u);
LABEL_792:
          __break(1u);
LABEL_793:
          __break(1u);
LABEL_794:
          __break(1u);
LABEL_795:
          __break(1u);
LABEL_796:
          __break(1u);
LABEL_797:
          __break(1u);
LABEL_798:
          __break(1u);
LABEL_799:
          __break(1u);
LABEL_800:
          __break(1u);
LABEL_801:
          __break(1u);
LABEL_802:
          __break(1u);
LABEL_803:
          __break(1u);
LABEL_804:
          __break(1u);
LABEL_805:
          __break(1u);
LABEL_806:
          __break(1u);
LABEL_807:
          __break(1u);
LABEL_808:
          __break(1u);
LABEL_809:
          __break(1u);
LABEL_810:
          __break(1u);
LABEL_811:
          __break(1u);
LABEL_812:
          __break(1u);
LABEL_813:
          __break(1u);
LABEL_814:
          __break(1u);
LABEL_815:
          __break(1u);
LABEL_816:
          __break(1u);
LABEL_817:
          __break(1u);
          goto LABEL_818;
        }
      }
      else if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 0)
      {
        goto LABEL_133;
      }
      v48 = *(double *)(v7 + 48);
      v47 = *(double *)(v7 + 56);
      v49 = (void *)objc_opt_self();
      if (v48 <= -9.22337204e18)
        goto LABEL_744;
      if (v48 >= 9.22337204e18)
        goto LABEL_746;
      if ((*(_QWORD *)&v48 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v47 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_748;
      }
      if (v47 <= -9.22337204e18)
        goto LABEL_750;
      if (v47 >= 9.22337204e18)
        goto LABEL_752;
      v50 = objc_msgSend(v49, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v48, (uint64_t)v47, 0);
      objc_msgSend(v50, sel_setUsage_, 5);
      v51 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v50);

      if (v51)
      {
        swift_beginAccess();
        v52 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v52);
        if (*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFFF8)
                                                                                            + 0x18) >> 1)
          sub_249D8B90C();
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
    }
  }
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    v6 = *(_QWORD *)(v9 + 40);
    swift_unknownObjectRetain();
    goto LABEL_88;
  }
  __break(1u);
LABEL_951:
  swift_bridgeObjectRetain();
  v54 = (char **)MEMORY[0x24BD038A4](0, v9);
  swift_bridgeObjectRelease();
LABEL_105:
  sub_249D8A1C0(v33, v54, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v55 = (char *)v498[4];
  v24 = 0xC3E0000000000001;
  v6 = 0x43E0000000000000;
  while (2)
  {
    v9 = (unint64_t)*v8;
    if (!((unint64_t)*v8 >> 62))
    {
      if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 0)
        break;
      goto LABEL_108;
    }
    swift_bridgeObjectRetain();
    v62 = sub_249D8BA08();
    swift_bridgeObjectRelease();
    if (v62 <= 0)
    {
LABEL_108:
      v57 = *(double *)(v7 + 48);
      v56 = *(double *)(v7 + 56);
      v58 = (void *)objc_opt_self();
      if (v57 <= -9.22337204e18)
        goto LABEL_753;
      if (v57 >= 9.22337204e18)
        goto LABEL_755;
      if ((*(_QWORD *)&v57 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v56 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_757;
      }
      if (v56 <= -9.22337204e18)
        goto LABEL_759;
      if (v56 >= 9.22337204e18)
        goto LABEL_760;
      v59 = objc_msgSend(v58, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v57, (uint64_t)v56, 0);
      objc_msgSend(v59, sel_setUsage_, 5);
      v60 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v59);

      if (v60)
      {
        swift_beginAccess();
        v61 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v61);
        sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      continue;
    }
    break;
  }
  v9 = (unint64_t)*v8;
  v495 = v55;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
    goto LABEL_955;
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v63 = *(_QWORD *)(v9 + 32);
    swift_unknownObjectRetain();
    goto LABEL_120;
  }
  __break(1u);
LABEL_957:
  swift_bridgeObjectRetain();
  v6 = MEMORY[0x24BD038A4](0, v9);
  swift_bridgeObjectRelease();
  v9 = (unint64_t)*v8;
LABEL_153:
  v83 = swift_bridgeObjectRetain();
  v84 = sub_249D7B078(v83);
  swift_bridgeObjectRelease();
  if (v84 <= 1)
  {
    v24 = 0x43E0000000000000;
    do
    {
      v88 = *(double *)(v7 + 48);
      v87 = *(double *)(v7 + 56);
      v89 = (void *)objc_opt_self();
      if (v88 <= -9.22337204e18)
        goto LABEL_764;
      if (v88 >= 9.22337204e18)
        goto LABEL_768;
      if ((*(_QWORD *)&v88 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v87 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_769;
      }
      if (v87 <= -9.22337204e18)
        goto LABEL_770;
      if (v87 >= 9.22337204e18)
        goto LABEL_772;
      v91 = objc_msgSend(v89, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v88, (uint64_t)v87, 0);
      objc_msgSend(v91, sel_setUsage_, 5);
      v92 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v91);

      if (v92)
      {
        swift_beginAccess();
        v93 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v93);
        sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = (unint64_t)*v8;
      v85 = swift_bridgeObjectRetain();
      v86 = sub_249D7B078(v85);
      swift_bridgeObjectRelease();
    }
    while (v86 < 2);
  }
  v107 = (uint64_t)*v8;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v108 = (char **)MEMORY[0x24BD038A4](1, v107);
    swift_bridgeObjectRelease();
LABEL_185:
    sub_249D8A1C0(v6, v108, a5);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v63 = v498[5];
    v9 = (unint64_t)*v8;
    v109 = swift_bridgeObjectRetain();
    v110 = sub_249D7B078(v109);
    swift_bridgeObjectRelease();
    if (v110 <= 1)
    {
      v107 = 0xC3E0000000000001;
      v24 = 0x43E0000000000000;
      do
      {
        v114 = *(double *)(v7 + 48);
        v113 = *(double *)(v7 + 56);
        v115 = (void *)objc_opt_self();
        if (v114 <= -9.22337204e18)
          goto LABEL_774;
        if (v114 >= 9.22337204e18)
          goto LABEL_778;
        if ((*(_QWORD *)&v114 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(_QWORD *)&v113 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_779;
        }
        if (v113 <= -9.22337204e18)
          goto LABEL_780;
        if (v113 >= 9.22337204e18)
          goto LABEL_782;
        v117 = objc_msgSend(v115, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v114, (uint64_t)v113, 0);
        objc_msgSend(v117, sel_setUsage_, 5);
        v6 = (uint64_t)objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v117);

        if (v6)
        {
          swift_beginAccess();
          v118 = swift_unknownObjectRetain();
          MEMORY[0x24BD037C0](v118);
          sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
          sub_249D8B918();
          sub_249D8B900();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        v9 = (unint64_t)*v8;
        v111 = swift_bridgeObjectRetain();
        v112 = sub_249D7B078(v111);
        swift_bridgeObjectRelease();
      }
      while (v112 < 2);
    }
    v9 = (unint64_t)*v8;
    v494 = v63;
    if (((unint64_t)*v8 & 0xC000000000000001) != 0)
      goto LABEL_965;
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
    {
      v6 = *(_QWORD *)(v9 + 40);
      swift_unknownObjectRetain();
      goto LABEL_221;
    }
    __break(1u);
    goto LABEL_967;
  }
  v9 = v494;
  if (*(_QWORD *)((v107 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
  {
    v108 = *(char ***)(v107 + 40);
    swift_unknownObjectRetain();
    goto LABEL_185;
  }
LABEL_962:
  __break(1u);
LABEL_963:
  swift_bridgeObjectRetain();
  v63 = MEMORY[0x24BD038A4](1, v9);
  swift_bridgeObjectRelease();
  v9 = (unint64_t)*v8;
LABEL_201:
  v119 = swift_bridgeObjectRetain();
  v120 = sub_249D7B078(v119);
  swift_bridgeObjectRelease();
  if (v120 <= 0)
  {
    v24 = 0xC3E0000000000001;
    do
    {
      v357 = *(double *)(v7 + 48);
      v356 = *(double *)(v7 + 56);
      v358 = (void *)objc_opt_self();
      if (v357 <= -9.22337204e18)
        goto LABEL_833;
      if (v357 >= 9.22337204e18)
        goto LABEL_834;
      if ((*(_QWORD *)&v357 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v356 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_837;
      }
      if (v356 <= -9.22337204e18)
        goto LABEL_838;
      if (v356 >= 9.22337204e18)
        goto LABEL_839;
      v360 = objc_msgSend(v358, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v357, (uint64_t)v356, 0);
      objc_msgSend(v360, sel_setUsage_, 5);
      v361 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v360);

      if (v361)
      {
        swift_beginAccess();
        v362 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v362);
        v6 = *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10);
        sub_249D81E24(v6);
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = (unint64_t)*v8;
      v354 = swift_bridgeObjectRetain();
      v355 = sub_249D7B078(v354);
      swift_bridgeObjectRelease();
    }
    while (v355 < 1);
  }
  v107 = (uint64_t)*v8;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
  {
LABEL_967:
    swift_bridgeObjectRetain();
    v121 = MEMORY[0x24BD038A4](0, v107);
    swift_bridgeObjectRelease();
LABEL_205:
    sub_249D8A014(v63, a2, v121, a5);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v122 = (char **)v498[6];
    v9 = (unint64_t)*v8;
    v123 = swift_bridgeObjectRetain();
    v124 = sub_249D7B078(v123);
    swift_bridgeObjectRelease();
    if (v124 <= 2)
    {
      v63 = 0xC3E0000000000001;
      v6 = 0x43E0000000000000;
      v107 = 0x7FF0000000000000;
      do
      {
        v128 = *(double *)(v7 + 48);
        v127 = *(double *)(v7 + 56);
        v129 = (void *)objc_opt_self();
        if (v128 <= -9.22337204e18)
          goto LABEL_783;
        if (v128 >= 9.22337204e18)
          goto LABEL_784;
        if ((*(_QWORD *)&v128 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(_QWORD *)&v127 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_785;
        }
        if (v127 <= -9.22337204e18)
          goto LABEL_786;
        if (v127 >= 9.22337204e18)
          goto LABEL_791;
        v131 = objc_msgSend(v129, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v128, (uint64_t)v127, 0);
        objc_msgSend(v131, sel_setUsage_, 5);
        v132 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v131);

        if (v132)
        {
          swift_beginAccess();
          v133 = swift_unknownObjectRetain();
          MEMORY[0x24BD037C0](v133);
          v24 = *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10);
          sub_249D81E24(v24);
          sub_249D8B918();
          sub_249D8B900();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        v9 = (unint64_t)*v8;
        v125 = swift_bridgeObjectRetain();
        v126 = sub_249D7B078(v125);
        swift_bridgeObjectRelease();
      }
      while (v126 < 3);
    }
    v9 = (unint64_t)*v8;
    a2 = v122;
    if (((unint64_t)*v8 & 0xC000000000000001) != 0)
      goto LABEL_971;
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 2uLL)
    {
      v148 = *(_QWORD *)(v9 + 48);
      swift_unknownObjectRetain();
      goto LABEL_241;
    }
    __break(1u);
    goto LABEL_973;
  }
  if (*(_QWORD *)((v107 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v121 = *(_QWORD *)(v107 + 32);
    swift_unknownObjectRetain();
    goto LABEL_205;
  }
  __break(1u);
LABEL_969:
  swift_bridgeObjectRetain();
  v136 = MEMORY[0x24BD038A4](0, v107);
  swift_bridgeObjectRelease();
LABEL_225:
  sub_249D8A014(v6, a2, v136, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  a2 = (char **)v498[6];
  v9 = (unint64_t)*v8;
  v137 = swift_bridgeObjectRetain();
  v138 = sub_249D7B078(v137);
  swift_bridgeObjectRelease();
  if (v138 <= 2)
  {
    v107 = 0xC3E0000000000001;
    v6 = 0x43E0000000000000;
    v24 = 0x7FF0000000000000;
    do
    {
      v142 = *(double *)(v7 + 48);
      v141 = *(double *)(v7 + 56);
      v143 = (void *)objc_opt_self();
      if (v142 <= -9.22337204e18)
        goto LABEL_787;
      if (v142 >= 9.22337204e18)
        goto LABEL_788;
      if ((*(_QWORD *)&v142 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v141 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_789;
      }
      if (v141 <= -9.22337204e18)
        goto LABEL_790;
      if (v141 >= 9.22337204e18)
        goto LABEL_792;
      v145 = objc_msgSend(v143, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v142, (uint64_t)v141, 0);
      objc_msgSend(v145, sel_setUsage_, 5);
      v146 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v145);

      if (v146)
      {
        swift_beginAccess();
        v147 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v147);
        sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = (unint64_t)*v8;
      v139 = swift_bridgeObjectRetain();
      v140 = sub_249D7B078(v139);
      swift_bridgeObjectRelease();
    }
    while (v140 < 3);
  }
  v9 = (unint64_t)*v8;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
  {
LABEL_973:
    swift_bridgeObjectRetain();
    v63 = MEMORY[0x24BD038A4](2, v9);
    swift_bridgeObjectRelease();
    v9 = (unint64_t)*v8;
LABEL_257:
    v160 = swift_bridgeObjectRetain();
    v161 = sub_249D7B078(v160);
    swift_bridgeObjectRelease();
    if (v161 <= 1)
    {
      v107 = 0xC3E0000000000001;
      v24 = 0x7FF0000000000000;
      do
      {
        v165 = *(double *)(v7 + 48);
        v164 = *(double *)(v7 + 56);
        v166 = (void *)objc_opt_self();
        if (v165 <= -9.22337204e18)
          goto LABEL_795;
        if (v165 >= 9.22337204e18)
          goto LABEL_796;
        if ((*(_QWORD *)&v165 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(_QWORD *)&v164 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_800;
        }
        if (v164 <= -9.22337204e18)
          goto LABEL_801;
        if (v164 >= 9.22337204e18)
          goto LABEL_802;
        v168 = objc_msgSend(v166, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v165, (uint64_t)v164, 0);
        objc_msgSend(v168, sel_setUsage_, 5);
        v169 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v168);

        if (v169)
        {
          swift_beginAccess();
          v170 = swift_unknownObjectRetain();
          MEMORY[0x24BD037C0](v170);
          sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
          sub_249D8B918();
          sub_249D8B900();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        v9 = (unint64_t)*v8;
        v162 = swift_bridgeObjectRetain();
        v163 = sub_249D7B078(v162);
        swift_bridgeObjectRelease();
      }
      while (v163 < 2);
    }
    v9 = (unint64_t)*v8;
    v494 = v63;
    if (((unint64_t)*v8 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      v6 = MEMORY[0x24BD038A4](1, v9);
      swift_bridgeObjectRelease();
      v9 = (unint64_t)*v8;
    }
    else
    {
      if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) <= 1uLL)
        goto LABEL_977;
      v6 = *(_QWORD *)(v9 + 40);
      swift_unknownObjectRetain();
    }
    v186 = swift_bridgeObjectRetain();
    v187 = sub_249D7B078(v186);
    swift_bridgeObjectRelease();
    if (v187 <= 0)
    {
      v24 = 0x43E0000000000000;
      v63 = 0x7FF0000000000000;
      do
      {
        v384 = *(double *)(v7 + 48);
        v383 = *(double *)(v7 + 56);
        v385 = (void *)objc_opt_self();
        if (v384 <= -9.22337204e18)
          goto LABEL_859;
        if (v384 >= 9.22337204e18)
          goto LABEL_864;
        if ((*(_QWORD *)&v384 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(_QWORD *)&v383 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_865;
        }
        if (v383 <= -9.22337204e18)
          goto LABEL_866;
        if (v383 >= 9.22337204e18)
          goto LABEL_867;
        v387 = objc_msgSend(v385, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v384, (uint64_t)v383, 0);
        objc_msgSend(v387, sel_setUsage_, 5);
        v388 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v387);

        if (v388)
        {
          swift_beginAccess();
          v389 = swift_unknownObjectRetain();
          MEMORY[0x24BD037C0](v389);
          sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
          sub_249D8B918();
          sub_249D8B900();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        v9 = (unint64_t)*v8;
        v381 = swift_bridgeObjectRetain();
        v382 = sub_249D7B078(v381);
        swift_bridgeObjectRelease();
      }
      while (v382 < 1);
    }
    v9 = (unint64_t)*v8;
    if (((unint64_t)*v8 & 0xC000000000000001) != 0)
      goto LABEL_980;
    v107 = v494;
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v188 = *(_QWORD *)(v9 + 32);
      swift_unknownObjectRetain();
      goto LABEL_298;
    }
    __break(1u);
    goto LABEL_982;
  }
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 2uLL)
  {
    v63 = *(_QWORD *)(v9 + 48);
    swift_unknownObjectRetain();
    goto LABEL_257;
  }
  __break(1u);
LABEL_975:
  swift_bridgeObjectRetain();
  v63 = MEMORY[0x24BD038A4](1, v9);
  swift_bridgeObjectRelease();
  v9 = (unint64_t)*v8;
LABEL_273:
  v171 = swift_bridgeObjectRetain();
  v172 = sub_249D7B078(v171);
  swift_bridgeObjectRelease();
  if (v172 <= 0)
  {
    do
    {
      v375 = *(double *)(v7 + 48);
      v374 = *(double *)(v7 + 56);
      v376 = (void *)objc_opt_self();
      if (v375 <= -9.22337204e18)
        goto LABEL_858;
      if (v375 >= 9.22337204e18)
        goto LABEL_860;
      if ((*(_QWORD *)&v375 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v374 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_861;
      }
      if (v374 <= -9.22337204e18)
        goto LABEL_862;
      if (v374 >= 9.22337204e18)
        goto LABEL_863;
      v378 = objc_msgSend(v376, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v375, (uint64_t)v374, 0);
      objc_msgSend(v378, sel_setUsage_, 5);
      v379 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v378);

      if (v379)
      {
        swift_beginAccess();
        v380 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v380);
        v6 = *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10);
        sub_249D81E24(v6);
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = (unint64_t)*v8;
      v372 = swift_bridgeObjectRetain();
      v373 = sub_249D7B078(v372);
      swift_bridgeObjectRelease();
    }
    while (v373 < 1);
  }
  v107 = (uint64_t)*v8;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
    goto LABEL_978;
  v9 = (unint64_t)a2;
  v24 = (uint64_t)v495;
  if (*(_QWORD *)((v107 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v173 = *(_QWORD *)(v107 + 32);
    swift_unknownObjectRetain();
    goto LABEL_277;
  }
  __break(1u);
LABEL_980:
  swift_bridgeObjectRetain();
  v188 = MEMORY[0x24BD038A4](0, v9);
  swift_bridgeObjectRelease();
  v107 = v494;
LABEL_298:
  sub_249D8A014(v107, (char **)v6, v188, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  a2 = (char **)v498[7];
  v24 = v7 + 32;
  swift_beginAccess();
  v9 = *(_QWORD *)(v7 + 32);
  v189 = swift_bridgeObjectRetain();
  v190 = sub_249D7B078(v189);
  swift_bridgeObjectRelease();
  if (v190 <= 0)
  {
    v107 = 0xC3E0000000000001;
    v63 = 0x7FF0000000000000;
    do
    {
      v393 = *(double *)(v7 + 64);
      v392 = *(double *)(v7 + 72);
      v394 = (void *)objc_opt_self();
      if (v393 <= -9.22337204e18)
        goto LABEL_873;
      if (v393 >= 9.22337204e18)
        goto LABEL_874;
      if ((*(_QWORD *)&v393 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v392 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_875;
      }
      if (v392 <= -9.22337204e18)
        goto LABEL_876;
      if (v392 >= 9.22337204e18)
        goto LABEL_877;
      v396 = objc_msgSend(v394, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v393, (uint64_t)v392, 0);
      objc_msgSend(v396, sel_setUsage_, 5);
      v397 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v396);

      if (v397)
      {
        swift_beginAccess();
        v398 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v398);
        sub_249D81E24(*(_QWORD *)((*(_QWORD *)v24 & 0xFFFFFFFFFFFFF8) + 0x10));
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = *(_QWORD *)v24;
      v390 = swift_bridgeObjectRetain();
      v391 = sub_249D7B078(v390);
      swift_bridgeObjectRelease();
    }
    while (v391 < 1);
  }
  v9 = *(_QWORD *)v24;
  if ((*(_QWORD *)v24 & 0xC000000000000001) != 0)
  {
LABEL_982:
    swift_bridgeObjectRetain();
    v494 = MEMORY[0x24BD038A4](0, v9);
    swift_bridgeObjectRelease();
LABEL_302:
    v9 = (unint64_t)*v8;
    v191 = swift_bridgeObjectRetain();
    v192 = sub_249D7B078(v191);
    swift_bridgeObjectRelease();
    if (v192 <= 2)
    {
      do
      {
        v196 = *(double *)(v7 + 48);
        v195 = *(double *)(v7 + 56);
        v197 = (void *)objc_opt_self();
        if (v196 <= -9.22337204e18)
          goto LABEL_808;
        if (v196 >= 9.22337204e18)
          goto LABEL_809;
        if ((*(_QWORD *)&v196 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(_QWORD *)&v195 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_810;
        }
        if (v195 <= -9.22337204e18)
          goto LABEL_811;
        if (v195 >= 9.22337204e18)
          goto LABEL_812;
        v199 = objc_msgSend(v197, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v196, (uint64_t)v195, 0);
        objc_msgSend(v199, sel_setUsage_, 5);
        v200 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v199);

        if (v200)
        {
          swift_beginAccess();
          v201 = swift_unknownObjectRetain();
          MEMORY[0x24BD037C0](v201);
          sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
          sub_249D8B918();
          sub_249D8B900();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        v9 = (unint64_t)*v8;
        v193 = swift_bridgeObjectRetain();
        v194 = sub_249D7B078(v193);
        swift_bridgeObjectRelease();
      }
      while (v194 < 3);
    }
    v9 = (unint64_t)*v8;
    if (((unint64_t)*v8 & 0xC000000000000001) != 0)
      goto LABEL_986;
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 2uLL)
    {
      v214 = *(char ***)(v9 + 48);
      swift_unknownObjectRetain();
      goto LABEL_334;
    }
    __break(1u);
    goto LABEL_988;
  }
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v494 = *(_QWORD *)(v9 + 32);
    swift_unknownObjectRetain();
    goto LABEL_302;
  }
  __break(1u);
LABEL_984:
  swift_bridgeObjectRetain();
  v202 = MEMORY[0x24BD038A4](1, v9);
  swift_bridgeObjectRelease();
  v9 = (unint64_t)*v8;
LABEL_318:
  v203 = swift_bridgeObjectRetain();
  v204 = sub_249D7B078(v203);
  swift_bridgeObjectRelease();
  if (v204 <= 2)
  {
    v107 = 0x7FF0000000000000;
    do
    {
      v208 = *(double *)(v7 + 48);
      v207 = *(double *)(v7 + 56);
      v209 = (void *)objc_opt_self();
      if (v208 <= -9.22337204e18)
        goto LABEL_813;
      if (v208 >= 9.22337204e18)
        goto LABEL_814;
      if ((*(_QWORD *)&v208 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v207 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_815;
      }
      if (v207 <= -9.22337204e18)
        goto LABEL_816;
      if (v207 >= 9.22337204e18)
        goto LABEL_817;
      v211 = objc_msgSend(v209, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v208, (uint64_t)v207, 0);
      objc_msgSend(v211, sel_setUsage_, 5);
      v212 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v211);

      if (v212)
      {
        swift_beginAccess();
        v213 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v213);
        v63 = *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10);
        sub_249D81E24(v63);
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = (unint64_t)*v8;
      v205 = swift_bridgeObjectRetain();
      v206 = sub_249D7B078(v205);
      swift_bridgeObjectRelease();
    }
    while (v206 < 3);
  }
  v9 = (unint64_t)*v8;
  v495 = (char *)v202;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
  {
LABEL_988:
    swift_bridgeObjectRetain();
    v63 = MEMORY[0x24BD038A4](2, v9);
    swift_bridgeObjectRelease();
    v9 = (unint64_t)*v8;
LABEL_350:
    v226 = swift_bridgeObjectRetain();
    v227 = sub_249D7B078(v226);
    swift_bridgeObjectRelease();
    if (v227 <= 0)
    {
      do
      {
        v413 = *(double *)(v7 + 48);
        v412 = *(double *)(v7 + 56);
        v414 = (void *)objc_opt_self();
        if (v413 <= -9.22337204e18)
          goto LABEL_883;
        if (v413 >= 9.22337204e18)
          goto LABEL_884;
        if ((*(_QWORD *)&v413 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(_QWORD *)&v412 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_885;
        }
        if (v412 <= -9.22337204e18)
          goto LABEL_886;
        if (v412 >= 9.22337204e18)
          goto LABEL_887;
        v416 = objc_msgSend(v414, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v413, (uint64_t)v412, 0);
        objc_msgSend(v416, sel_setUsage_, 5);
        v417 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v416);

        if (v417)
        {
          swift_beginAccess();
          v418 = swift_unknownObjectRetain();
          MEMORY[0x24BD037C0](v418);
          sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
          sub_249D8B918();
          sub_249D8B900();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        v9 = (unint64_t)*v8;
        v410 = swift_bridgeObjectRetain();
        v411 = sub_249D7B078(v410);
        swift_bridgeObjectRelease();
      }
      while (v411 < 1);
    }
    v107 = (uint64_t)*v8;
    if (((unint64_t)*v8 & 0xC000000000000001) != 0)
      goto LABEL_990;
    v9 = (unint64_t)a2;
    v24 = (uint64_t)v495;
    if (*(_QWORD *)((v107 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v228 = *(_QWORD *)(v107 + 32);
      swift_unknownObjectRetain();
      goto LABEL_354;
    }
    __break(1u);
    goto LABEL_992;
  }
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 2uLL)
  {
    v63 = *(_QWORD *)(v9 + 48);
    swift_unknownObjectRetain();
    goto LABEL_350;
  }
  __break(1u);
LABEL_990:
  swift_bridgeObjectRetain();
  v228 = MEMORY[0x24BD038A4](0, v107);
  swift_bridgeObjectRelease();
  v24 = (uint64_t)v495;
LABEL_354:
  sub_249D8A014(v24, (char **)v63, v228, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v9 = (unint64_t)*v8;
  v229 = swift_bridgeObjectRetain();
  v230 = sub_249D7B078(v229);
  swift_bridgeObjectRelease();
  if (v230 <= 1)
  {
    do
    {
      v234 = *(double *)(v7 + 48);
      v233 = *(double *)(v7 + 56);
      v235 = (void *)objc_opt_self();
      if (v234 <= -9.22337204e18)
        goto LABEL_823;
      if (v234 >= 9.22337204e18)
        goto LABEL_824;
      if ((*(_QWORD *)&v234 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v233 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_825;
      }
      if (v233 <= -9.22337204e18)
        goto LABEL_826;
      if (v233 >= 9.22337204e18)
        goto LABEL_827;
      v237 = objc_msgSend(v235, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v234, (uint64_t)v233, 0);
      objc_msgSend(v237, sel_setUsage_, 5);
      v238 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v237);

      if (v238)
      {
        swift_beginAccess();
        v239 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v239);
        v24 = *(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10);
        sub_249D81E24(v24);
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = (unint64_t)*v8;
      v231 = swift_bridgeObjectRetain();
      v232 = sub_249D7B078(v231);
      swift_bridgeObjectRelease();
    }
    while (v232 < 2);
  }
  v9 = (unint64_t)*v8;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
    goto LABEL_996;
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
  {
    v254 = *(char ***)(v9 + 40);
    swift_unknownObjectRetain();
    goto LABEL_390;
  }
  __break(1u);
LABEL_998:
  swift_bridgeObjectRetain();
  v494 = MEMORY[0x24BD038A4](3, v9);
  swift_bridgeObjectRelease();
  v9 = (unint64_t)*v8;
LABEL_394:
  v255 = swift_bridgeObjectRetain();
  v256 = sub_249D7B078(v255);
  swift_bridgeObjectRelease();
  if (v256 <= 1)
  {
    do
    {
      v260 = *(double *)(v7 + 48);
      v259 = *(double *)(v7 + 56);
      v261 = (void *)objc_opt_self();
      if (v260 <= -9.22337204e18)
        goto LABEL_843;
      if (v260 >= 9.22337204e18)
        goto LABEL_844;
      if ((*(_QWORD *)&v260 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v259 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_845;
      }
      if (v259 <= -9.22337204e18)
        goto LABEL_846;
      if (v259 >= 9.22337204e18)
        goto LABEL_847;
      v263 = objc_msgSend(v261, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v260, (uint64_t)v259, 0);
      objc_msgSend(v263, sel_setUsage_, 5);
      v264 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v263);

      if (v264)
      {
        swift_beginAccess();
        v265 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v265);
        sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = (unint64_t)*v8;
      v257 = swift_bridgeObjectRetain();
      v258 = sub_249D7B078(v257);
      swift_bridgeObjectRelease();
    }
    while (v258 < 2);
  }
  v9 = (unint64_t)*v8;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
    goto LABEL_1000;
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
  {
    v266 = *(char ***)(v9 + 40);
    swift_unknownObjectRetain();
    goto LABEL_410;
  }
  __break(1u);
LABEL_1002:
  swift_bridgeObjectRetain();
  v494 = MEMORY[0x24BD038A4](1, v9);
  swift_bridgeObjectRelease();
  v9 = (unint64_t)*v8;
LABEL_426:
  v278 = swift_bridgeObjectRetain();
  v279 = sub_249D7B078(v278);
  swift_bridgeObjectRelease();
  if (v279 <= 3)
  {
    do
    {
      v283 = *(double *)(v7 + 48);
      v282 = *(double *)(v7 + 56);
      v284 = (void *)objc_opt_self();
      if (v283 <= -9.22337204e18)
        goto LABEL_853;
      if (v283 >= 9.22337204e18)
        goto LABEL_854;
      if ((*(_QWORD *)&v283 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v282 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_855;
      }
      if (v282 <= -9.22337204e18)
        goto LABEL_856;
      if (v282 >= 9.22337204e18)
        goto LABEL_857;
      v286 = objc_msgSend(v284, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v283, (uint64_t)v282, 0);
      objc_msgSend(v286, sel_setUsage_, 5);
      v287 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v286);

      if (v287)
      {
        swift_beginAccess();
        v288 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v288);
        sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = (unint64_t)*v8;
      v280 = swift_bridgeObjectRetain();
      v281 = sub_249D7B078(v280);
      swift_bridgeObjectRelease();
    }
    while (v281 < 4);
  }
  v9 = (unint64_t)*v8;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
    goto LABEL_1004;
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 3uLL)
  {
    v289 = *(char ***)(v9 + 56);
    swift_unknownObjectRetain();
    goto LABEL_442;
  }
  __break(1u);
LABEL_1006:
  swift_bridgeObjectRetain();
  v494 = MEMORY[0x24BD038A4](1, v9);
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)v24;
LABEL_458:
  v301 = swift_bridgeObjectRetain();
  v302 = sub_249D7B078(v301);
  swift_bridgeObjectRelease();
  if (v302 <= 0)
  {
    do
    {
      v436 = *(double *)(v7 + 64);
      v435 = *(double *)(v7 + 72);
      v437 = (void *)objc_opt_self();
      if (v436 <= -9.22337204e18)
        goto LABEL_903;
      if (v436 >= 9.22337204e18)
        goto LABEL_904;
      if ((*(_QWORD *)&v436 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v435 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_905;
      }
      if (v435 <= -9.22337204e18)
        goto LABEL_906;
      if (v435 >= 9.22337204e18)
        goto LABEL_907;
      v439 = objc_msgSend(v437, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v436, (uint64_t)v435, 0);
      objc_msgSend(v439, sel_setUsage_, 5);
      v440 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v439);

      if (v440)
      {
        swift_beginAccess();
        v441 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v441);
        sub_249D81E24(*(_QWORD *)((*(_QWORD *)v24 & 0xFFFFFFFFFFFFF8) + 0x10));
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = *(_QWORD *)v24;
      v433 = swift_bridgeObjectRetain();
      v434 = sub_249D7B078(v433);
      swift_bridgeObjectRelease();
    }
    while (v434 < 1);
  }
  v9 = *(_QWORD *)v24;
  if ((*(_QWORD *)v24 & 0xC000000000000001) != 0)
    goto LABEL_1008;
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v493 = *(char ***)(v9 + 32);
    swift_unknownObjectRetain();
    goto LABEL_462;
  }
  __break(1u);
LABEL_1010:
  swift_bridgeObjectRetain();
  v314 = MEMORY[0x24BD038A4](1, v9);
  swift_bridgeObjectRelease();
LABEL_478:
  sub_249D8A014(v494, v493, v314, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  a2 = (char **)v498[9];
  v9 = (unint64_t)*v8;
  v315 = swift_bridgeObjectRetain();
  v316 = sub_249D7B078(v315);
  swift_bridgeObjectRelease();
  if (v316 <= 1)
  {
    do
    {
      v320 = *(double *)(v7 + 48);
      v319 = *(double *)(v7 + 56);
      v321 = (void *)objc_opt_self();
      if (v320 <= -9.22337204e18)
        goto LABEL_888;
      if (v320 >= 9.22337204e18)
        goto LABEL_889;
      if ((*(_QWORD *)&v320 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v319 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_890;
      }
      if (v319 <= -9.22337204e18)
        goto LABEL_891;
      if (v319 >= 9.22337204e18)
        goto LABEL_892;
      v323 = objc_msgSend(v321, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v320, (uint64_t)v319, 0);
      objc_msgSend(v323, sel_setUsage_, 5);
      v324 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v323);

      if (v324)
      {
        swift_beginAccess();
        v325 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v325);
        sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = (unint64_t)*v8;
      v317 = swift_bridgeObjectRetain();
      v318 = sub_249D7B078(v317);
      swift_bridgeObjectRelease();
    }
    while (v318 < 2);
  }
  v9 = (unint64_t)*v8;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
    goto LABEL_1012;
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
  {
    v494 = *(_QWORD *)(v9 + 40);
    swift_unknownObjectRetain();
    goto LABEL_494;
  }
  __break(1u);
LABEL_1014:
  swift_bridgeObjectRetain();
  v493 = (char **)MEMORY[0x24BD038A4](2, v9);
  swift_bridgeObjectRelease();
  v9 = (unint64_t)*v8;
LABEL_510:
  v337 = swift_bridgeObjectRetain();
  v338 = sub_249D7B078(v337);
  swift_bridgeObjectRelease();
  if (v338 <= 0)
  {
    do
    {
      v445 = *(double *)(v7 + 48);
      v444 = *(double *)(v7 + 56);
      v446 = (void *)objc_opt_self();
      if (v445 <= -9.22337204e18)
        goto LABEL_908;
      if (v445 >= 9.22337204e18)
        goto LABEL_909;
      if ((*(_QWORD *)&v445 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v444 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_910;
      }
      if (v444 <= -9.22337204e18)
        goto LABEL_911;
      if (v444 >= 9.22337204e18)
        goto LABEL_912;
      v448 = objc_msgSend(v446, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v445, (uint64_t)v444, 0);
      objc_msgSend(v448, sel_setUsage_, 5);
      v449 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v448);

      if (v449)
      {
        swift_beginAccess();
        v450 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v450);
        sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = (unint64_t)*v8;
      v442 = swift_bridgeObjectRetain();
      v443 = sub_249D7B078(v442);
      swift_bridgeObjectRelease();
    }
    while (v443 < 1);
  }
  v9 = (unint64_t)*v8;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
    goto LABEL_1016;
  v339 = v495;
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v340 = *(_QWORD *)(v9 + 32);
    swift_unknownObjectRetain();
    goto LABEL_514;
  }
  __break(1u);
LABEL_1018:
  swift_bridgeObjectRetain();
  v494 = MEMORY[0x24BD038A4](0, v9);
  swift_bridgeObjectRelease();
LABEL_519:
  v9 = (unint64_t)*v8;
  v343 = swift_bridgeObjectRetain();
  v344 = sub_249D7B078(v343);
  swift_bridgeObjectRelease();
  if (v344 <= 1)
  {
    do
    {
      v348 = *(double *)(v7 + 48);
      v347 = *(double *)(v7 + 56);
      v349 = (void *)objc_opt_self();
      if (v348 <= -9.22337204e18)
        goto LABEL_913;
      if (v348 >= 9.22337204e18)
        goto LABEL_914;
      if ((*(_QWORD *)&v348 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v347 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_915;
      }
      if (v347 <= -9.22337204e18)
        goto LABEL_916;
      if (v347 >= 9.22337204e18)
        goto LABEL_917;
      v351 = objc_msgSend(v349, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v348, (uint64_t)v347, 0);
      objc_msgSend(v351, sel_setUsage_, 5);
      v352 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v351);

      if (v352)
      {
        swift_beginAccess();
        v353 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v353);
        sub_249D81E24(*(_QWORD *)(((unint64_t)*v8 & 0xFFFFFFFFFFFFF8) + 0x10));
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = (unint64_t)*v8;
      v345 = swift_bridgeObjectRetain();
      v346 = sub_249D7B078(v345);
      swift_bridgeObjectRelease();
    }
    while (v346 < 2);
  }
  v9 = (unint64_t)*v8;
  if (((unint64_t)*v8 & 0xC000000000000001) != 0)
  {
LABEL_1020:
    swift_bridgeObjectRetain();
    v8 = (char **)MEMORY[0x24BD038A4](1, v9);
    swift_bridgeObjectRelease();
LABEL_595:
    v9 = *(_QWORD *)v24;
    v399 = swift_bridgeObjectRetain();
    v400 = sub_249D7B078(v399);
    swift_bridgeObjectRelease();
    if (v400 <= 1)
    {
      do
      {
        v404 = *(double *)(v7 + 64);
        v403 = *(double *)(v7 + 72);
        v405 = (void *)objc_opt_self();
        if (v404 <= -9.22337204e18)
          goto LABEL_918;
        if (v404 >= 9.22337204e18)
          goto LABEL_919;
        if ((*(_QWORD *)&v404 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (*(_QWORD *)&v403 & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_920;
        }
        if (v403 <= -9.22337204e18)
          goto LABEL_921;
        if (v403 >= 9.22337204e18)
          goto LABEL_922;
        v407 = objc_msgSend(v405, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v404, (uint64_t)v403, 0);
        objc_msgSend(v407, sel_setUsage_, 5);
        v408 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v407);

        if (v408)
        {
          swift_beginAccess();
          v409 = swift_unknownObjectRetain();
          MEMORY[0x24BD037C0](v409);
          sub_249D81E24(*(_QWORD *)((*(_QWORD *)v24 & 0xFFFFFFFFFFFFF8) + 0x10));
          sub_249D8B918();
          sub_249D8B900();
          swift_endAccess();
          swift_unknownObjectRelease();
        }
        v9 = *(_QWORD *)v24;
        v401 = swift_bridgeObjectRetain();
        v402 = sub_249D7B078(v401);
        swift_bridgeObjectRelease();
      }
      while (v402 < 2);
    }
    v9 = *(_QWORD *)v24;
    if ((*(_QWORD *)v24 & 0xC000000000000001) != 0)
      goto LABEL_1022;
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
    {
      v419 = *(_QWORD *)(v9 + 40);
      swift_unknownObjectRetain();
      goto LABEL_623;
    }
    __break(1u);
LABEL_1024:
    swift_bridgeObjectRetain();
    v423 = (char **)MEMORY[0x24BD038A4](0, v9);
    swift_bridgeObjectRelease();
    v422 = (uint64_t)v495;
LABEL_627:
    sub_249D8A014(a3, v423, v422, a5);
    goto LABEL_697;
  }
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
  {
    v8 = *(char ***)(v9 + 40);
    swift_unknownObjectRetain();
    goto LABEL_595;
  }
  __break(1u);
LABEL_1022:
  swift_bridgeObjectRetain();
  v419 = MEMORY[0x24BD038A4](1, v9);
  swift_bridgeObjectRelease();
LABEL_623:
  sub_249D8A014(v494, v8, v419, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v8 = (char **)v498[12];
  v9 = *(_QWORD *)v24;
  v420 = swift_bridgeObjectRetain();
  v421 = sub_249D7B078(v420);
  swift_bridgeObjectRelease();
  if (v421 <= 0)
  {
    do
    {
      v487 = *(double *)(v7 + 64);
      v486 = *(double *)(v7 + 72);
      v488 = (void *)objc_opt_self();
      if (v487 <= -9.22337204e18)
        goto LABEL_928;
      if (v487 >= 9.22337204e18)
        goto LABEL_929;
      if ((*(_QWORD *)&v487 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v486 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_930;
      }
      if (v486 <= -9.22337204e18)
        goto LABEL_931;
      if (v486 >= 9.22337204e18)
        goto LABEL_932;
      v490 = objc_msgSend(v488, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v487, (uint64_t)v486, 0);
      objc_msgSend(v490, sel_setUsage_, 5);
      v491 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v490);

      if (v491)
      {
        swift_beginAccess();
        v492 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v492);
        sub_249D81E24(*(_QWORD *)((*(_QWORD *)v24 & 0xFFFFFFFFFFFFF8) + 0x10));
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = *(_QWORD *)v24;
      v484 = swift_bridgeObjectRetain();
      v485 = sub_249D7B078(v484);
      swift_bridgeObjectRelease();
    }
    while (v485 < 1);
  }
  v9 = *(_QWORD *)v24;
  if ((*(_QWORD *)v24 & 0xC000000000000001) != 0)
    goto LABEL_1024;
  v422 = (uint64_t)v495;
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v423 = *(char ***)(v9 + 32);
    swift_unknownObjectRetain();
    goto LABEL_627;
  }
  __break(1u);
LABEL_1026:
  swift_bridgeObjectRetain();
  v8 = (char **)MEMORY[0x24BD038A4](1, v9);
  swift_bridgeObjectRelease();
LABEL_680:
  v9 = *(_QWORD *)v24;
  v462 = swift_bridgeObjectRetain();
  v463 = sub_249D7B078(v462);
  result = swift_bridgeObjectRelease();
  if (v463 <= 1)
  {
    do
    {
      v468 = *(double *)(v7 + 64);
      v467 = *(double *)(v7 + 72);
      v469 = (void *)objc_opt_self();
      if (v468 <= -9.22337204e18)
        goto LABEL_938;
      if (v468 >= 9.22337204e18)
        goto LABEL_939;
      if ((*(_QWORD *)&v468 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v467 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_940;
      }
      if (v467 <= -9.22337204e18)
        goto LABEL_941;
      if (v467 >= 9.22337204e18)
        goto LABEL_942;
      v471 = objc_msgSend(v469, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, (uint64_t)v468, (uint64_t)v467, 0);
      objc_msgSend(v471, sel_setUsage_, 5);
      v472 = objc_msgSend(*(id *)(v7 + 16), sel_newTextureWithDescriptor_, v471);

      if (v472)
      {
        swift_beginAccess();
        v473 = swift_unknownObjectRetain();
        MEMORY[0x24BD037C0](v473);
        sub_249D81E24(*(_QWORD *)((*(_QWORD *)v24 & 0xFFFFFFFFFFFFF8) + 0x10));
        sub_249D8B918();
        sub_249D8B900();
        swift_endAccess();
        swift_unknownObjectRelease();
      }
      v9 = *(_QWORD *)v24;
      v465 = swift_bridgeObjectRetain();
      v466 = sub_249D7B078(v465);
      result = swift_bridgeObjectRelease();
    }
    while (v466 < 2);
  }
  v9 = *(_QWORD *)v24;
  if ((*(_QWORD *)v24 & 0xC000000000000001) != 0)
    goto LABEL_1028;
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) > 1uLL)
  {
    v474 = *(_QWORD *)(v9 + 40);
    swift_unknownObjectRetain();
    goto LABEL_696;
  }
  __break(1u);
  return result;
}

id sub_249D816F8()
{
  uint64_t v0;
  CGColorSpaceRef DeviceRGB;
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  const __CFAllocator *v12;
  CVReturn v13;
  CVMetalTextureCacheRef v14;
  uint64_t inited;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  const __CFDictionary *v35;
  uint64_t v36;
  void *v37;
  id v38;
  const __CFDictionary *v39;
  CVReturn v40;
  CVPixelBufferPoolRef v41;
  __CVPixelBufferPool *v42;
  CVReturn v43;
  CVPixelBufferRef v44;
  __CVBuffer *v45;
  void *BaseAddress;
  void *v47;
  size_t BytesPerRow;
  CGContext *v49;
  double v50;
  CGContext *v51;
  double v52;
  CVReturn v53;
  CVMetalTextureRef v54;
  __CVBuffer *v55;
  id v56;
  int64_t v58;
  int64_t v59;
  void *v60;
  CGColorSpaceRef v61;
  CVMetalTextureCacheRef textureCache;
  CVMetalTextureRef textureOut;
  CVPixelBufferRef pixelBufferOut;
  CVPixelBufferPoolRef poolOut;
  CVMetalTextureCacheRef cacheOut[3];

  cacheOut[1] = *(CVMetalTextureCacheRef *)MEMORY[0x24BDAC8D0];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_249D8B8B8();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_, v2);

  if (!v3)
  {

    return 0;
  }
  objc_msgSend(v3, sel_size);
  v5 = v4;
  objc_msgSend(v3, sel_scale);
  v7 = v5 * v6;
  if ((~COERCE__INT64(v5 * v6) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_34;
  }
  if (v7 <= -9.22337204e18)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v7 >= 9.22337204e18)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  objc_msgSend(v3, sel_size);
  v9 = v8;
  objc_msgSend(v3, sel_scale);
  v11 = v9 * v10;
  if ((~*(_QWORD *)&v11 & 0x7FF0000000000000) == 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  if (v11 <= -9.22337204e18)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v11 >= 9.22337204e18)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  cacheOut[0] = 0;
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v13 = CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, *(id *)(v0 + 16), 0, cacheOut);
  v14 = cacheOut[0];
  if (v13 || !cacheOut[0])
  {

    return 0;
  }
  v60 = v3;
  v61 = DeviceRGB;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D4270);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_249D8CCB0;
  v16 = (void *)*MEMORY[0x24BDC5708];
  v17 = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDC5708];
  *(_QWORD *)(inited + 40) = (uint64_t)v7;
  v59 = (uint64_t)v7;
  v18 = (void *)*MEMORY[0x24BDC5650];
  *(_QWORD *)(inited + 64) = v17;
  *(_QWORD *)(inited + 72) = v18;
  v58 = (uint64_t)v11;
  *(_QWORD *)(inited + 80) = (uint64_t)v11;
  v19 = (void *)*MEMORY[0x24BDC56B8];
  *(_QWORD *)(inited + 104) = v17;
  *(_QWORD *)(inited + 112) = v19;
  v20 = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 120) = 1111970369;
  v21 = (void *)*MEMORY[0x24BDC55E8];
  *(_QWORD *)(inited + 144) = v20;
  *(_QWORD *)(inited + 152) = v21;
  v22 = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 160) = 1;
  v23 = (void *)*MEMORY[0x24BDC55E0];
  *(_QWORD *)(inited + 184) = v22;
  *(_QWORD *)(inited + 192) = v23;
  *(_BYTE *)(inited + 200) = 1;
  v24 = (void *)*MEMORY[0x24BDC5690];
  *(_QWORD *)(inited + 224) = v22;
  *(_QWORD *)(inited + 232) = v24;
  *(_BYTE *)(inited + 240) = 1;
  v25 = (void *)*MEMORY[0x24BDC5668];
  *(_QWORD *)(inited + 264) = v22;
  *(_QWORD *)(inited + 272) = v25;
  textureCache = v14;
  v26 = v16;
  v27 = v18;
  v28 = v19;
  v29 = v21;
  v30 = v23;
  v31 = v24;
  v32 = v25;
  sub_249D76918(MEMORY[0x24BEE4AF8]);
  type metadata accessor for CFString(0);
  sub_249D82670();
  v33 = sub_249D8B8A0();
  swift_bridgeObjectRelease();
  type metadata accessor for CFDictionary(0);
  *(_QWORD *)(inited + 304) = v34;
  *(_QWORD *)(inited + 280) = v33;
  sub_249D76918(inited);
  v35 = (const __CFDictionary *)sub_249D8B8A0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578D4200);
  v36 = swift_initStackObject();
  *(_OWORD *)(v36 + 16) = xmmword_249D8CCC0;
  v37 = (void *)*MEMORY[0x24BDC56E0];
  *(_QWORD *)(v36 + 32) = *MEMORY[0x24BDC56E0];
  *(_QWORD *)(v36 + 40) = 1;
  v38 = v37;
  sub_249D76A30(v36);
  v39 = (const __CFDictionary *)sub_249D8B8A0();
  swift_bridgeObjectRelease();
  poolOut = 0;
  v40 = CVPixelBufferPoolCreate(v12, v39, v35, &poolOut);
  v41 = poolOut;
  if (v40 || !poolOut)
  {

    return 0;
  }
  pixelBufferOut = 0;
  v42 = poolOut;
  v43 = CVPixelBufferPoolCreatePixelBuffer(v12, v42, &pixelBufferOut);
  v44 = pixelBufferOut;
  if (v43 || !pixelBufferOut)
  {

    return 0;
  }
  v45 = pixelBufferOut;
  CVPixelBufferLockBaseAddress(v45, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(v45);
  if (!BaseAddress
    || (v47 = BaseAddress,
        BytesPerRow = CVPixelBufferGetBytesPerRow(v45),
        (v49 = CGBitmapContextCreate(v47, v59, v58, 8uLL, BytesPerRow, v61, 0x2002u)) == 0))
  {

    return 0;
  }
  v50 = (double)v58;
  v51 = v49;
  CGContextTranslateCTM(v49, 0.0, (double)v58);
  CGContextScaleCTM(v51, 1.0, -1.0);
  UIGraphicsPushContext(v51);
  v52 = (double)v59;
  objc_msgSend(v60, sel_drawInRect_, 0.0, 0.0, (double)v59, (double)v58);
  UIGraphicsPopContext();
  CVPixelBufferUnlockBaseAddress(v45, 0);
  textureOut = 0;
  if ((double)v59 <= -9.22337204e18)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (v52 >= 9.22337204e18)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if ((*(_QWORD *)&v52 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(_QWORD *)&v50 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_41;
  }
  if (v50 <= -9.22337204e18)
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
  }
  if (v50 >= 9.22337204e18)
    goto LABEL_43;
  v53 = CVMetalTextureCacheCreateTextureFromImage(v12, textureCache, v45, 0, MTLPixelFormatBGRA8Unorm, v59, v58, 0, &textureOut);
  v54 = textureOut;
  if (v53 || !textureOut)
  {

    return 0;
  }
  v55 = textureOut;
  v56 = CVMetalTextureGetTexture(v55);

  return v56;
}

uint64_t StickerComicRenderer.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t StickerComicRenderer.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_249D81E24(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_249D8B90C();
  return result;
}

uint64_t sub_249D81E50(uint64_t a1, int8x16_t a2)
{
  float32x4_t v2;
  float32x4_t v3;
  int8x8_t v9;
  int32x4_t v10;
  uint8x8_t v11;
  __int32 v12;
  uint16x4_t v13;

  a2.i64[0] = *(_QWORD *)(a1 + 4);
  v2 = *(float32x4_t *)(a1 + 12);
  v3 = (float32x4_t)vextq_s8((int8x16_t)v2, a2, 8uLL);
  a2.i64[1] = *(_QWORD *)(a1 + 12);
  __asm { FMOV            V3.4S, #1.0 }
  v9 = vmovn_s16((int16x8_t)vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32((float32x4_t)a2, _Q3), (int16x8_t)vcgtq_f32(v3, (float32x4_t)xmmword_249D8D0B0))));
  v10 = (int32x4_t)vmvnq_s8((int8x16_t)vcgtq_f32((float32x4_t)xmmword_249D8D0B0, v3));
  v9.i16[3] = vmovn_s16(vmovn_hight_s32(*(int16x4_t *)&v10, v10)).i16[3];
  v11 = (uint8x8_t)vcltz_s8(vshl_n_s8(v9, 7uLL));
  v11.i8[0] = vminv_u8(v11);
  v12 = v11.i32[0];
  v13 = (uint16x4_t)vmovn_s32(vcltzq_f32(v2));
  v13.i16[0] = vmaxv_u16(v13);
  return v12 & ~v13.i32[0] & 1;
}

unint64_t sub_249D81EC0()
{
  unint64_t result;

  result = qword_2578D4250;
  if (!qword_2578D4250)
  {
    result = MEMORY[0x24BD03DD8](&protocol conformance descriptor for StickerComicRenderer.Error, &type metadata for StickerComicRenderer.Error);
    atomic_store(result, (unint64_t *)&qword_2578D4250);
  }
  return result;
}

uint64_t sub_249D81F04(void *a1, uint64_t a2)
{
  uint64_t v2;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *v49;

  v5 = *(float *)(a2 + 4);
  v4 = *(float *)(a2 + 8);
  v7 = *(float *)(a2 + 12);
  v6 = *(float *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = (double)(uint64_t)objc_msgSend(a1, sel_width);
  v10 = objc_msgSend(a1, sel_height);
  v11 = v9 * 0.76;
  v12 = (double)(uint64_t)v10 * 0.76;
  if (v12 >= v9 * 0.76)
    v13 = v9 * 0.76;
  else
    v13 = (double)(uint64_t)v10 * 0.76;
  if (v11 > v12)
    v14 = v9 * 0.76;
  else
    v14 = (double)(uint64_t)v10 * 0.76;
  if (v13 > 720.0)
  {
    v15 = 720.0 / v13;
LABEL_11:
    v12 = v12 * v15;
    v11 = v11 * v15;
    goto LABEL_12;
  }
  if (v14 < 140.0)
  {
    v15 = 140.0 / v14;
    goto LABEL_11;
  }
LABEL_12:
  *(double *)(v2 + 64) = v11;
  *(double *)(v2 + 72) = v12;
  v16 = (float)((float)(v5 + v5) + 1.0);
  *(double *)(v2 + 48) = v11 / v16;
  *(double *)(v2 + 56) = v12 / v16;
  v17 = *(_QWORD **)(v2 + 24);
  v18 = v17[5];
  *(_QWORD *)(v18 + OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassOneShader_sigmaColor) = 0x3FBBC408E0000000;
  *(_QWORD *)(v18 + OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassOneShader_sigma) = 0x401A0A4260000000;
  v19 = v17[6];
  *(_QWORD *)(v19 + OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassTwoShader_sigmaColor) = 0x3FBBC408E0000000;
  *(_QWORD *)(v19 + OBJC_IVAR____TtC17VisionKitInternal31StickerComicBFBlurPassTwoShader_sigma) = 0x401A0A4260000000;
  v20 = v17[7];
  *(_QWORD *)(v20 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteStart) = 0x3FD3333333333333;
  *(_QWORD *)(v20 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteEnd) = 0x3FE999999999999ALL;
  *(_QWORD *)(v20 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_mode) = 0;
  if ((v8 & 0x8000000000000000) != 0 || HIDWORD(v8))
  {
    result = sub_249D8B9F0();
    __break(1u);
  }
  else
  {
    *(float *)(v20 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_numLevels) = (float)v8;
    v21 = 1.0 / (float)v8;
    if (!v8)
      v21 = 0.0;
    *(float *)(v20 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_numLevelsRecip) = v21;
    v22 = v17[9];
    *(double *)(v22 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_sigma) = (float)(1.0 - v4) * 3.807
                                                                                          + 1.6;
    v23 = OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_preThreshold;
    *(_QWORD *)(v22 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_preThreshold) = 0x3FF0000000000000;
    *(_QWORD *)(v22 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_mode) = 0;
    v24 = v17[10];
    *(double *)(v24 + OBJC_IVAR____TtC17VisionKitInternal24StickerComicStrokeShader_sigma) = v7 * 12.0 + 4.0;
    v25 = v17[11];
    *(double *)(v25 + OBJC_IVAR____TtC17VisionKitInternal32StickerComicStrokeAndBlendShader_sigma) = v7 * 32.0 + 4.8;
    v26 = v7 * 6.0 + 2.340625;
    v27 = v17[3];
    *(double *)(v27 + OBJC_IVAR____TtC17VisionKitInternal34StickerComicGaussBlurExpressShader_sigma) = v26;
    v28 = v17[4];
    *(double *)(v28 + OBJC_IVAR____TtC17VisionKitInternal41StickerComicGaussBlurExpressPassTwoShader_sigma) = v26;
    v29 = v17[14];
    *(_QWORD *)(v29 + OBJC_IVAR____TtC17VisionKitInternal34StickerComicGaussBlurExpressShader_sigma) = 0x4001800000000000;
    v30 = v17[15];
    *(_QWORD *)(v30 + OBJC_IVAR____TtC17VisionKitInternal41StickerComicGaussBlurExpressPassTwoShader_sigma) = 0x4001800000000000;
    *(double *)(v22 + v23) = v6 * -0.65 + 1.0;
    v31 = *(_QWORD *)(v2 + 64);
    v32 = *(_QWORD *)(v2 + 72);
    v33 = (_QWORD *)(v24 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v33 = v31;
    v33[1] = v32;
    v34 = (_QWORD *)(v25 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v34 = v31;
    v34[1] = v32;
    v35 = (_QWORD *)(v20 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v35 = v31;
    v35[1] = v32;
    v36 = (_QWORD *)(v17[8] + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v36 = v31;
    v36[1] = v32;
    v37 = (_QWORD *)(v17[12] + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v37 = v31;
    v37[1] = v32;
    v38 = *(_QWORD *)(v2 + 48);
    v39 = *(_QWORD *)(v2 + 56);
    result = OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size;
    v41 = (_QWORD *)(v17[2] + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v41 = v38;
    v41[1] = v39;
    v42 = (_QWORD *)(v18 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v42 = v38;
    v42[1] = v39;
    v43 = (_QWORD *)(v19 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v43 = v38;
    v43[1] = v39;
    v44 = (_QWORD *)(v22 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v44 = v38;
    v44[1] = v39;
    v45 = (_QWORD *)(v27 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v45 = v38;
    v45[1] = v39;
    v46 = (_QWORD *)(v28 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v46 = v38;
    v46[1] = v39;
    v47 = (_QWORD *)(v29 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v47 = v38;
    v47[1] = v39;
    v48 = (_QWORD *)(v30 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v48 = v38;
    v48[1] = v39;
    v49 = (_QWORD *)(v17[13] + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size);
    *v49 = v38;
    v49[1] = v39;
  }
  return result;
}

unint64_t sub_249D8235C()
{
  unint64_t result;

  result = qword_2578D4258;
  if (!qword_2578D4258)
  {
    result = MEMORY[0x24BD03DD8](&protocol conformance descriptor for StickerComicRenderer.Style, &type metadata for StickerComicRenderer.Style);
    atomic_store(result, (unint64_t *)&qword_2578D4258);
  }
  return result;
}

unint64_t sub_249D823A4()
{
  unint64_t result;

  result = qword_2578D4260;
  if (!qword_2578D4260)
  {
    result = MEMORY[0x24BD03DD8](&protocol conformance descriptor for StickerComicRenderer.Error, &type metadata for StickerComicRenderer.Error);
    atomic_store(result, (unint64_t *)&qword_2578D4260);
  }
  return result;
}

uint64_t method lookup function for StickerComicRenderer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StickerComicRenderer.__allocating_init(device:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of StickerComicRenderer.process(inputTexture:outputTexture:parameters:commandBuffer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for StickerComicRenderer.Style()
{
  return &type metadata for StickerComicRenderer.Style;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for StickerComicRenderer.Parameters(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[40])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for StickerComicRenderer.Parameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for StickerComicRenderer.Parameters()
{
  return &type metadata for StickerComicRenderer.Parameters;
}

uint64_t _s17VisionKitInternal20StickerComicRendererC5StyleOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s17VisionKitInternal20StickerComicRendererC5StyleOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_249D825DC + 4 * byte_249D8D0F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_249D82610 + 4 * byte_249D8D0F0[v4]))();
}

uint64_t sub_249D82610(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249D82618(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249D82620);
  return result;
}

uint64_t sub_249D8262C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249D82634);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_249D82638(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249D82640(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249D8264C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_249D82654(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for StickerComicRenderer.Error()
{
  return &type metadata for StickerComicRenderer.Error;
}

unint64_t sub_249D82670()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578D3D08;
  if (!qword_2578D3D08)
  {
    type metadata accessor for CFString(255);
    result = MEMORY[0x24BD03DD8](&unk_249D8CAA0, v1);
    atomic_store(result, (unint64_t *)&qword_2578D3D08);
  }
  return result;
}

uint64_t sub_249D826C0(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  uint64_t v15;

  if (a3 >> 62)
  {
LABEL_17:
    swift_bridgeObjectRetain();
    v5 = sub_249D8BA08();
    if (v5)
      goto LABEL_3;
  }
  else
  {
    v5 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      v6 = 4;
      do
      {
        v7 = v6 - 4;
        if ((a3 & 0xC000000000000001) != 0)
        {
          v8 = MEMORY[0x24BD038A4](v6 - 4, a3);
          v9 = v6 - 3;
          if (__OFADD__(v7, 1))
            goto LABEL_16;
        }
        else
        {
          v8 = *(_QWORD *)(a3 + 8 * v6);
          swift_retain();
          v9 = v6 - 3;
          if (__OFADD__(v7, 1))
          {
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
        }
        v15 = v8;
        v10 = a1(&v15);
        if (v3)
        {
          swift_bridgeObjectRelease();
          swift_release();
          return v12 & 1;
        }
        v11 = v10;
        swift_release();
        if ((v11 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v12 = 1;
          return v12 & 1;
        }
        ++v6;
      }
      while (v9 != v5);
    }
  }
  swift_bridgeObjectRelease();
  v12 = 0;
  return v12 & 1;
}

id sub_249D82808()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_mapTableWithKeyOptions_valueOptions_, 5, 0);
  qword_2578D46D8 = (uint64_t)result;
  return result;
}

id sub_249D82848()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_weakObjectsHashTable);
  qword_2578D4288 = (uint64_t)result;
  return result;
}

void sub_249D82880(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  char v8;
  void *v9;
  id v10;

  v2 = v1;
  v4 = v1 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve;
  v5 = MEMORY[0x24BD03EB0](v1 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve);
  if (!v5)
  {
    if (!a1)
      return;
LABEL_6:
    v6 = a1;
    objc_msgSend(v6, sel__removeScrollViewScrollObserver_, v2);
    if (qword_2578D3C08 != -1)
      swift_once();
    objc_msgSend((id)qword_2578D4288, sel_removeObject_, v6);
    goto LABEL_9;
  }
  v6 = (id)v5;
  if (a1)
  {
    sub_249D88F7C(0, &qword_2578D43B8);
    a1 = a1;
    v7 = v6;
    v8 = sub_249D8B990();

    if ((v8 & 1) != 0)
      return;
    goto LABEL_6;
  }
LABEL_9:

  v9 = (void *)MEMORY[0x24BD03EB0](v4);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, sel__addScrollViewScrollObserver_, v2);
    if (qword_2578D3C08 != -1)
      swift_once();
    objc_msgSend((id)qword_2578D4288, sel_addObject_, v10);

  }
}

void sub_249D82A04(double a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  CATransform3D v6;

  *(double *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_requiredScale) = a1;
  v2 = OBJC_IVAR____VKStickerEffectViewInternal_appliedScale;
  if (a1 > 0.0 && *(double *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_appliedScale) != a1)
  {
    *(double *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_appliedScale) = a1;
    v4 = (void *)objc_opt_self();
    objc_msgSend(v4, sel_begin);
    objc_msgSend(v4, sel_setDisableActions_, 1);
    v5 = *(void **)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer);
    CATransform3DMakeScale(&v6, 1.0 / *(double *)(v1 + v2), 1.0 / *(double *)(v1 + v2), 1.0);
    objc_msgSend(v5, sel_setSublayerTransform_, &v6);
    objc_msgSend(v4, sel_commit);
  }
}

void sub_249D82AF0(char a1)
{
  _BYTE *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  if (v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive] == (a1 & 1))
    return;
  v2 = OBJC_IVAR____VKStickerEffectViewInternal_displayLink;
  v3 = *(void **)&v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLink];
  if (!v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive])
  {
    if (!v3)
    {
      v13 = 0;
      goto LABEL_13;
    }
LABEL_11:
    v14 = (void *)objc_opt_self();
    v15 = v3;
    v16 = objc_msgSend(v14, sel_mainRunLoop);
    objc_msgSend(v15, sel_removeFromRunLoop_forMode_, v16, *MEMORY[0x24BDBCB80]);

    v13 = *(void **)&v1[v2];
LABEL_13:
    *(_QWORD *)&v1[v2] = 0;
    goto LABEL_14;
  }
  if (v3)
    goto LABEL_11;
  v4 = objc_msgSend(v1, sel_window);
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, sel_screen);

    v5 = objc_msgSend(v6, sel_displayLinkWithTarget_selector_, v1, sel__internalUpdateFromDisplayLink_);
  }
  v7 = *(void **)&v1[v2];
  *(_QWORD *)&v1[v2] = v5;

  v8 = *(void **)&v1[v2];
  if (v8)
  {
    v9 = v8;
    sub_249D8B948();
    objc_msgSend(v9, sel_setPreferredFrameRateRange_);

    v10 = *(void **)&v1[v2];
    if (v10)
    {
      v11 = (void *)objc_opt_self();
      v12 = v10;
      v17 = objc_msgSend(v11, sel_mainRunLoop);
      objc_msgSend(v12, sel_addToRunLoop_forMode_, v17, *MEMORY[0x24BDBCB80]);

      v13 = v17;
LABEL_14:

    }
  }
}

void sub_249D82CEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  if (qword_2578D3BC0 != -1)
    swift_once();
  v1 = qword_2578D4680;
  if (*(_BYTE *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_motionActive) == 1)
  {
    sub_249D886C8(v0, qword_2578D4680);
    return;
  }
  MEMORY[0x24BDAC7A8]();
  v6[2] = v0;
  v6[3] = &off_251B358A0;
  swift_beginAccess();
  v2 = sub_249D71428(sub_249D89CD8, (uint64_t)v6);
  v3 = v2;
  v4 = *(_QWORD *)(v1 + 136);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_249D8BA08();
    swift_bridgeObjectRelease();
    if (v5 >= v3)
      goto LABEL_7;
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5 >= v2)
    {
LABEL_7:
      sub_249D7190C(v3, v5);
      swift_endAccess();
      sub_249D6FEE4();
      return;
    }
  }
  __break(1u);
}

id sub_249D82E4C()
{
  id result;

  result = sub_249D82E94(27.4155678);
  qword_2578D4290 = (uint64_t)result;
  return result;
}

id sub_249D82E70()
{
  id result;

  result = sub_249D82E94(15.4212569);
  qword_2578D4298 = (uint64_t)result;
  return result;
}

id sub_249D82E94(double a1)
{
  id v2;
  double v3;
  double v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5760]), sel_init);
  objc_msgSend(v2, sel_setStiffness_, a1);
  objc_msgSend(v2, sel_stiffness);
  v4 = sqrt(v3);
  objc_msgSend(v2, sel_setDamping_, v4 + v4);
  v5 = v2;
  objc_msgSend(v5, sel_settlingDuration);
  objc_msgSend(v5, sel_setDuration_);

  v6 = *MEMORY[0x24BDE5D18];
  v7 = (void *)objc_opt_self();
  v8 = v5;
  v9 = objc_msgSend(v7, sel_functionWithName_, v6);
  objc_msgSend(v8, sel_setTimingFunction_, v9);

  return v8;
}

id sub_249D82FA0(__n128 a1)
{
  _BYTE *v1;
  uint64_t v2;
  __int128 v3;
  BOOL v4;
  float v5;
  float v6;
  id result;
  __int128 v8;
  __n128 v9;

  v2 = 0;
  v3 = *(_OWORD *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation];
  while (1)
  {
    v8 = v3;
    v5 = *(float *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3)));
    v9 = a1;
    v6 = *(float *)((unint64_t)&v9 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3)));
    v4 = v5 == v6;
    if (v2 == 3)
      break;
    while (1)
    {
      ++v2;
      if (v4)
        break;
      if (v2 == 3)
        goto LABEL_8;
      v4 = 0;
    }
  }
  if (v5 != v6)
  {
LABEL_8:
    v1[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
    if (!*(_QWORD *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLink])
      return objc_msgSend(v1, sel_setNeedsLayout);
  }
  return result;
}

uint64_t sub_249D83094()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_249D83120(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D83168())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void static StickerEffectView.extraScaleToIncludeStroke(withEffectType:bounds:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  sub_249D887F0(a1, a4, a5);
}

uint64_t sub_249D8320C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_249D83298(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_249D832E0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

float sub_249D83368()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____VKStickerEffectViewInternal_curlPosition;
  swift_beginAccess();
  return *(float *)v1;
}

id sub_249D833F0(float a1)
{
  _BYTE *v1;
  float *v3;
  id result;
  float v5;

  v3 = (float *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_curlPosition];
  result = (id)swift_beginAccess();
  v5 = *v3;
  *v3 = a1;
  if (v5 != a1)
  {
    v1[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
    if (!*(_QWORD *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLink])
      return objc_msgSend(v1, sel_setNeedsLayout);
  }
  return result;
}

void (*sub_249D83484(_QWORD *a1))(id **a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _DWORD *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____VKStickerEffectViewInternal_curlPosition;
  v3[3] = v1;
  v3[4] = v4;
  v5 = (_DWORD *)(v1 + v4);
  swift_beginAccess();
  *((_DWORD *)v3 + 10) = *v5;
  return sub_249D834F0;
}

void sub_249D834F0(id **a1)
{
  id *v1;
  float v2;
  char *v3;
  id v4;
  float v5;
  _BYTE *v6;

  v1 = *a1;
  v2 = *((float *)*a1 + 10);
  v4 = (*a1)[3];
  v3 = (char *)(*a1)[4];
  v5 = *(float *)&v3[(_QWORD)v4];
  *(float *)&v3[(_QWORD)v4] = v2;
  if (v2 != v5)
  {
    v6 = v1[3];
    v6[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
    if (!*(_QWORD *)&v6[OBJC_IVAR____VKStickerEffectViewInternal_displayLink])
      objc_msgSend(v1[3], sel_setNeedsLayout);
  }
  free(v1);
}

id sub_249D835A8()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  return *v1;
}

void sub_249D83634(void *a1)
{
  _BYTE *v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)&v1[OBJC_IVAR____VKStickerEffectViewInternal_effect];
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;
  if (v4 != a1)
  {
    sub_249D861A8();
    v1[OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress] = 0;
    v1[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
    if (!*(_QWORD *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLink])
      objc_msgSend(v1, sel_setNeedsLayout);
  }

}

void (*sub_249D836E8(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  void **v4;
  void *v5;
  id v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = (void **)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  v5 = *v4;
  v3[3] = *v4;
  v6 = v5;
  return sub_249D8375C;
}

void sub_249D8375C(void **a1, char a2)
{
  void *v2;
  id v3;
  id *v4;

  v2 = *a1;
  v4 = (id *)((char *)*a1 + 24);
  v3 = *v4;
  if ((a2 & 1) != 0)
  {
    sub_249D83634(v3);

  }
  else
  {
    sub_249D83634(v3);
  }
  free(v2);
}

uint64_t sub_249D838A0()
{
  uint64_t v0;
  id v1;

  type metadata accessor for StickerEffect();
  v0 = swift_dynamicCastClass();
  if (v0)
  {
    v1 = (id)v0;
    swift_unknownObjectRetain();
  }
  else
  {
    if (qword_2578D3BD8 != -1)
      swift_once();
    v1 = (id)qword_2578D3E40;
  }
  sub_249D83634(v1);
  return swift_unknownObjectRelease();
}

uint64_t sub_249D83930()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  type metadata accessor for StickerEffect();
  v0 = swift_dynamicCastClass();
  if (v0)
  {
    v1 = (id)v0;
    swift_unknownObjectRetain_n();
  }
  else
  {
    v2 = qword_2578D3BD8;
    swift_unknownObjectRetain();
    if (v2 != -1)
      swift_once();
    v1 = (id)qword_2578D3E40;
  }
  sub_249D83634(v1);
  return swift_unknownObjectRelease();
}

void (*sub_249D839D0(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  void **v4;
  void *v5;
  id v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = (void **)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  v5 = *v4;
  v3[3] = *v4;
  v6 = v5;
  return sub_249D83A44;
}

void sub_249D83A44(void **a1, char a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;

  v3 = *a1;
  type metadata accessor for StickerEffect();
  v4 = swift_dynamicCastClass();
  v5 = (id)v4;
  if ((a2 & 1) != 0)
  {
    if (v4)
    {
      swift_unknownObjectRetain_n();
    }
    else
    {
      v6 = qword_2578D3BD8;
      swift_unknownObjectRetain();
      if (v6 != -1)
        swift_once();
      v5 = (id)qword_2578D3E40;
    }
    sub_249D83634(v5);
    swift_unknownObjectRelease();
  }
  else
  {
    if (v4)
    {
      swift_unknownObjectRetain();
    }
    else
    {
      if (qword_2578D3BD8 != -1)
        swift_once();
      v5 = (id)qword_2578D3E40;
    }
    sub_249D83634(v5);
  }
  swift_unknownObjectRelease();
  free(v3);
}

void *sub_249D83BB0()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_249D83C7C(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;
  sub_249D83D5C((uint64_t)v4);

}

void sub_249D83CE8(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;
  sub_249D83D5C((uint64_t)v4);

}

void sub_249D83D5C(uint64_t a1)
{
  _BYTE *v1;
  uint64_t *v3;
  uint64_t v4;
  void *v5;

  v3 = (uint64_t *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_image];
  swift_beginAccess();
  v4 = *v3;
  if (*v3)
  {
    if (a1 && v4 == a1)
      return;
  }
  else if (!a1)
  {
    return;
  }
  v5 = *(void **)&v1[OBJC_IVAR____VKStickerEffectViewInternal_metalLayer];
  objc_msgSend(v5, sel_setHidden_, v4 == 0);
  if ((objc_msgSend(v5, sel_isHidden) & 1) == 0)
  {
    v1[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
    if (!*(_QWORD *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLink])
      objc_msgSend(v1, sel_setNeedsLayout);
  }
  sub_249D861A8();
}

void (*sub_249D83E30(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  void *v6;
  id v7;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____VKStickerEffectViewInternal_image;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (void **)(v1 + v4);
  swift_beginAccess();
  v6 = *v5;
  v3[3] = *v5;
  v7 = v6;
  return sub_249D83EA4;
}

void sub_249D83EA4(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v2 = *(void **)a1;
  v4 = (void **)(*(_QWORD *)a1 + 24);
  v3 = *v4;
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v7 = *(void **)(v6 + v5);
  *(_QWORD *)(v6 + v5) = *v4;
  if ((a2 & 1) != 0)
  {
    v8 = v3;
    sub_249D83D5C((uint64_t)v7);

    v7 = *v4;
  }
  else
  {
    v9 = v3;
    sub_249D83D5C((uint64_t)v7);

  }
  free(v2);
}

uint64_t sub_249D83F70()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_isPaused);
  swift_beginAccess();
  return *v1;
}

void sub_249D84024(char a1)
{
  uint64_t v1;
  int v3;
  _BYTE *v4;
  int v5;

  v3 = a1 & 1;
  v4 = (_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_isPaused);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;
  if (v5 != v3)
    sub_249D861A8();
}

void sub_249D84088(unsigned __int8 *a1, _QWORD *a2)
{
  int v2;
  _BYTE *v3;
  int v4;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____VKStickerEffectViewInternal_isPaused);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  if (v2 != v4)
    sub_249D861A8();
}

void (*sub_249D840EC(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _BYTE *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____VKStickerEffectViewInternal_isPaused;
  v3[3] = v1;
  v3[4] = v4;
  v5 = (_BYTE *)(v1 + v4);
  swift_beginAccess();
  *((_BYTE *)v3 + 40) = *v5;
  return sub_249D84158;
}

void sub_249D84158(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;

  v1 = *(void **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v4 = *(unsigned __int8 *)(*(_QWORD *)a1 + 40);
  v5 = *(unsigned __int8 *)(v3 + v2);
  *(_BYTE *)(v3 + v2) = v4;
  if (v4 != v5)
    sub_249D861A8();
  free(v1);
}

uint64_t sub_249D841EC()
{
  char *v0;
  void *v1;
  id *v2;
  id v3;
  uint64_t v5;

  v1 = v0;
  sub_249D8B9C0();
  sub_249D8B8DC();
  v5 = *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_instanceNumber];
  sub_249D8BA2C();
  sub_249D8B8DC();
  swift_bridgeObjectRelease();
  sub_249D8B8DC();
  v2 = (id *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_effect];
  swift_beginAccess();
  v3 = objc_msgSend(*v2, sel_description, v5);
  sub_249D8B8C4();

  sub_249D8B8DC();
  swift_bridgeObjectRelease();
  sub_249D8B8DC();
  swift_beginAccess();
  sub_249D8B8DC();
  swift_bridgeObjectRelease();
  sub_249D8B8DC();
  objc_msgSend(v1, sel_bounds);
  type metadata accessor for CGRect(0);
  sub_249D8B9E4();
  sub_249D8B8DC();
  swift_beginAccess();
  sub_249D8B8DC();
  swift_bridgeObjectRelease();
  return 0;
}

char *StickerEffectView.__allocating_init(device:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return StickerEffectView.init(device:)(a1);
}

char *StickerEffectView.init(device:)(void *a1)
{
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  objc_class *v19;
  char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  char *v40;
  void *v41;
  char *v42;
  void *v43;
  char *v44;
  void *v45;
  char *v46;
  void *v47;
  uint64_t v49;
  void *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  void *v56;
  uint64_t v57;
  objc_super v58;
  uint64_t v59;

  v56 = a1;
  v57 = sub_249D8B954();
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v51 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_249D8B960();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249D8B894();
  MEMORY[0x24BDAC7A8]();
  v8 = &v1[OBJC_IVAR____VKStickerEffectViewInternal_logger];
  v9 = v1;
  v55 = v8;
  sub_249D8B858();
  v53 = OBJC_IVAR____VKStickerEffectViewInternal_instanceLabel;
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_instanceLabel) = 0;
  v10 = OBJC_IVAR____VKStickerEffectViewInternal_metalLayer;
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5708]), sel_init);
  v54 = v10;
  *(_QWORD *)((char *)v9 + v10) = v11;
  v12 = OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer;
  *(_QWORD *)((char *)v9 + v12) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE56D0]), sel_init);
  *((_BYTE *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_needsRender) = 1;
  *((_BYTE *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress) = 0;
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount) = 0;
  v51 = (char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve;
  v52 = v12;
  swift_unknownObjectWeakInit();
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_requiredScale) = 0x3FF0000000000000;
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_appliedScale) = 0x3FF0000000000000;
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_strokeScale) = 0x3FF0000000000000;
  v13 = OBJC_IVAR____VKStickerEffectViewInternal_renderQueue;
  sub_249D88F7C(0, (unint64_t *)&qword_2578D3C70);
  sub_249D8B888();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5758], v4);
  v59 = MEMORY[0x24BEE4AF8];
  sub_249D72088(&qword_2578D4318, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578D4320);
  sub_249D88F3C(&qword_2578D4328, &qword_2578D4320);
  sub_249D8B9B4();
  *(_QWORD *)((char *)v9 + v13) = sub_249D8B984();
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_renderer) = 0;
  v14 = OBJC_IVAR____VKStickerEffectViewInternal_displayLink;
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_displayLink) = 0;
  v15 = qword_2578D4280;
  if (__OFADD__(qword_2578D4280, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  ++qword_2578D4280;
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_instanceNumber) = v15;
  *((_BYTE *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive) = 0;
  *((_BYTE *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_motionActive) = 0;
  *(_OWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation) = xmmword_249D8C530;
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_settlingDuration1) = 0x3FF3333333333333;
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_settlingDuration2) = 0x3FF999999999999ALL;
  *(_OWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_settlingStartAngle) = xmmword_249D8D3B0;
  *(_OWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_settlingEndAngle) = xmmword_249D8C530;
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime) = 0;
  *(_OWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation) = xmmword_249D8C530;
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_screenCenterDuration) = 0x3FD999999999999ALL;
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter) = 0x3F0000003F000000;
  *((_BYTE *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke) = 1;
  *((_BYTE *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion) = 1;
  *(_DWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_curlPosition) = 1065353216;
  v3 = (char *)OBJC_IVAR____VKStickerEffectViewInternal_effect;
  *(_QWORD *)&v3[(_QWORD)v9] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  v7 = (char *)OBJC_IVAR____VKStickerEffectViewInternal_image;
  *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_image) = 0;
  *((_BYTE *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_isPaused) = 0;
  if (qword_2578D3C00 != -1)
LABEL_9:
    swift_once();
  v16 = (void *)qword_2578D46D8;
  v17 = v56;
  v18 = objc_msgSend((id)qword_2578D46D8, sel_objectForKey_, v56);
  if (v18 || (v18 = objc_msgSend(v17, sel_newCommandQueue), objc_msgSend(v16, sel_setObject_forKey_, v18, v17), v18))
  {
    *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_device) = v17;
    *(_QWORD *)((char *)v9 + OBJC_IVAR____VKStickerEffectViewInternal_commandQueue) = v18;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();

    v19 = (objc_class *)type metadata accessor for StickerEffectView();
    v58.receiver = v9;
    v58.super_class = v19;
    v20 = (char *)objc_msgSendSuper2(&v58, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v20, sel_setClipsToBounds_, 0);
    v21 = OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer;
    v22 = *(void **)&v20[OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer];
    objc_msgSend(v22, sel_setMasksToBounds_, 0);
    v23 = v22;
    v24 = objc_msgSend(v20, sel_layer);
    objc_msgSend(v24, sel_bounds);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    objc_msgSend(v23, sel_setFrame_, v26, v28, v30, v32);
    v33 = objc_msgSend(v20, sel_layer);
    objc_msgSend(v33, sel_addSublayer_, *(_QWORD *)&v20[v21]);

    v34 = OBJC_IVAR____VKStickerEffectViewInternal_metalLayer;
    v35 = *(void **)&v20[OBJC_IVAR____VKStickerEffectViewInternal_metalLayer];
    objc_msgSend(v35, sel_setDevice_, v17);
    objc_msgSend(v35, sel_setHidden_, 1);
    objc_msgSend(v35, sel_setOpaque_, 0);
    v36 = *(void **)&v20[v21];
    v37 = v35;
    objc_msgSend(v36, sel_bounds);
    objc_msgSend(v37, sel_setFrame_);

    v38 = *(void **)&v20[v34];
    objc_msgSend(v38, sel_setPresentsWithTransaction_, 1);
    objc_msgSend(*(id *)&v20[v21], sel_addSublayer_, v38);
    v39 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v40 = v20;
    v41 = (void *)sub_249D8B8B8();
    objc_msgSend(v39, sel_addObserver_selector_name_object_, v40, sel_scrollViewWillChange_, v41, 0);

    v42 = v40;
    v43 = (void *)sub_249D8B8B8();
    objc_msgSend(v39, sel_addObserver_selector_name_object_, v42, sel_scrollViewDidChange_, v43, 0);

    v44 = v42;
    v45 = (void *)sub_249D8B8B8();
    objc_msgSend(v39, sel_addObserver_selector_name_object_, v44, sel_scrollViewWillChange_, v45, 0);

    v46 = v44;
    v47 = (void *)sub_249D8B8B8();
    objc_msgSend(v39, sel_addObserver_selector_name_object_, v46, sel_scrollViewDidChange_, v47, 0);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    v49 = sub_249D8B864();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v49 - 8) + 8))(v55, v49);

    swift_unknownObjectWeakDestroy();
    swift_release();

    v50 = *(void **)&v7[(_QWORD)v9];
    type metadata accessor for StickerEffectView();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v46;
}

id StickerEffectView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_249D84DF4()
{
  char *v0;
  char *v1;
  id v2;
  char *v3;
  uint64_t v4;
  void *v5;
  id v6;
  char v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13[24];
  uint64_t v14;

  v1 = v0;
  sub_249D8B7A4();
  if (!v14)
  {
    sub_249D89608((uint64_t)v13);
    return;
  }
  sub_249D88F7C(0, &qword_2578D43B8);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v2 = v12;
    if (objc_msgSend(v0, sel_isDescendantOfView_, v12))
    {
      v3 = &v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve];
      v4 = MEMORY[0x24BD03EB0](&v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve]);
      if (v4)
      {
        v5 = (void *)v4;
        v6 = v12;
        v7 = sub_249D8B990();

        if ((v7 & 1) != 0)
        {

          v8 = *(_QWORD *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount];
          v9 = __OFADD__(v8, 1);
          v10 = v8 + 1;
          if (v9)
            __break(1u);
          else
            *(_QWORD *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount] = v10;
          return;
        }
      }
      *(_QWORD *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount] = 0;
      v11 = (void *)MEMORY[0x24BD03EB0](v3);
      swift_unknownObjectWeakAssign();
      v2 = v12;
      sub_249D82880(v11);

    }
  }
}

void sub_249D84F5C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BYTE v13[24];
  uint64_t v14;

  v1 = v0;
  sub_249D8B7A4();
  if (v14)
  {
    sub_249D88F7C(0, &qword_2578D43B8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v2 = v12;
      v3 = v0 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve;
      v4 = MEMORY[0x24BD03EB0](v0 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve);
      if (!v4)
        goto LABEL_7;
      v5 = (void *)v4;
      v2 = v12;
      v6 = sub_249D8B990();

      if ((v6 & 1) == 0)
        goto LABEL_7;
      v7 = OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount;
      v8 = *(_QWORD *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount);
      v9 = v8 < 1;
      v10 = v8 - 1;
      if (!v9)
      {
        *(_QWORD *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount) = v10;
LABEL_7:

        return;
      }
      v11 = (void *)MEMORY[0x24BD03EB0](v3);
      swift_unknownObjectWeakAssign();
      sub_249D82880(v11);

      *(_QWORD *)(v1 + v7) = 0;
    }
  }
  else
  {
    sub_249D89608((uint64_t)v13);
  }
}

uint64_t sub_249D85094(void *a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v12;

  v6 = sub_249D8B7B0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249D8B798();
  v10 = a1;
  a4(v9);

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_249D85134()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive) & 1) == 0)
  {
    v1 = *(void **)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_displayLink);
    v2 = v1;
    sub_249D865DC(v1);
    v4 = v3;

    *(_QWORD *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter) = v4;
    sub_249D861A8();
  }
}

id sub_249D852EC()
{
  char *v0;
  id *v1;
  objc_super v3;

  v1 = (id *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_image];
  swift_beginAccess();
  if (*v1)
    return objc_msgSend(*v1, sel_size);
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for StickerEffectView();
  return objc_msgSendSuper2(&v3, sel_intrinsicContentSize);
}

void sub_249D8535C()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v26;
  CGRect v27;
  CGRect v28;

  v26.receiver = v0;
  v26.super_class = (Class)type metadata accessor for StickerEffectView();
  objc_msgSendSuper2(&v26, sel_layoutSubviews);
  v1 = (void *)objc_opt_self();
  objc_msgSend(v1, sel_begin);
  objc_msgSend(v1, sel_setDisableActions_, 1);
  v2 = *(void **)&v0[OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer];
  v3 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v3, sel_bounds);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(v2, sel_setFrame_, v5, v7, v9, v11);
  v12 = *(void **)&v0[OBJC_IVAR____VKStickerEffectViewInternal_metalLayer];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v12, sel_setFrame_);
  v13 = objc_msgSend(v0, sel_window);
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(v13, sel_screen);

    objc_msgSend(v15, sel_nativeScale);
    v17 = v16;

  }
  else
  {
    v17 = 0.0;
  }
  objc_msgSend(v12, sel_bounds);
  v18 = v17 * CGRectGetWidth(v27);
  objc_msgSend(v12, sel_bounds);
  v19 = v17 * CGRectGetHeight(v28);
  if (v18 * v19 > 2359296.0)
  {
    v20 = 2359296.0 / (v18 * v19);
    v18 = v18 * v20;
    v19 = v19 * v20;
  }
  v21 = floor(v18);
  v22 = floor(v19);
  objc_msgSend(v12, sel_drawableSize);
  if (v21 != v24 || v22 != v23)
  {
    objc_msgSend(v12, sel_setDrawableSize_, v21, v22);
    objc_msgSend(v12, sel_setContentsScale_, v17);
    v0[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
  }
  objc_msgSend(v1, sel_commit);
  if (!*(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_displayLink]
    && *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_renderer]
    && v0[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] == 1
    && (v0[OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress] & 1) == 0)
  {
    v0[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 0;
    sub_249D86810();
  }
}

void sub_249D85610()
{
  char *v0;
  uint64_t v1;
  char **v2;
  uint64_t v3;
  char *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  char *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  _QWORD *v27;
  char *v28;
  char **v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  _QWORD aBlock[6];
  objc_super v35;

  v1 = sub_249D8B870();
  v2 = *(char ***)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (_QWORD *)sub_249D8B894();
  v6 = *(v5 - 1);
  MEMORY[0x24BDAC7A8]();
  v32 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for StickerEffectView();
  v35.receiver = v0;
  v35.super_class = v8;
  objc_msgSendSuper2(&v35, sel_didMoveToWindow);
  v0[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
  if (!*(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_displayLink])
    objc_msgSend(v0, sel_setNeedsLayout);
  sub_249D861A8();
  v9 = objc_msgSend(v0, sel_window);

  if (!v9
    || (v10 = &v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve],
        v11 = (void *)MEMORY[0x24BD03EB0](&v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve]),
        v11,
        v11))
  {
    v12 = objc_msgSend(v0, sel_window);

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BD03EB0](&v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserve]);
      swift_unknownObjectWeakAssign();
      sub_249D82880(v13);

      *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount] = 0;
    }
    goto LABEL_25;
  }
  v31 = v6;
  if (qword_2578D3C08 != -1)
    goto LABEL_21;
  while (1)
  {
    v14 = objc_msgSend((id)qword_2578D4288, sel_allObjects);
    sub_249D88F7C(0, &qword_2578D43B8);
    v15 = sub_249D8B8F4();

    if (v15 >> 62)
      break;
    v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v16)
      goto LABEL_23;
LABEL_10:
    v27 = v5;
    v28 = v4;
    v29 = v2;
    v30 = v1;
    v1 = 4;
    v2 = &selRef_defaultCenter;
    while (1)
    {
      v17 = (v15 & 0xC000000000000001) != 0
          ? (_QWORD *)MEMORY[0x24BD038A4](v1 - 4, v15)
          : *(id *)(v15 + 8 * v1);
      v5 = v17;
      v4 = (char *)(v1 - 3);
      if (__OFADD__(v1 - 4, 1))
        break;
      if (objc_msgSend(v0, sel_isDescendantOfView_, v17))
      {
        swift_bridgeObjectRelease();
        v18 = (void *)MEMORY[0x24BD03EB0](v10);
        swift_unknownObjectWeakAssign();
        v19 = v5;
        sub_249D82880(v18);

        goto LABEL_19;
      }

      ++v1;
      if (v4 == (char *)v16)
      {
        swift_bridgeObjectRelease();
LABEL_19:
        v2 = v29;
        v1 = v30;
        v5 = v27;
        v4 = v28;
        goto LABEL_24;
      }
    }
    __break(1u);
LABEL_21:
    swift_once();
  }
  swift_bridgeObjectRetain();
  v16 = sub_249D8BA08();
  swift_bridgeObjectRelease();
  if (v16)
    goto LABEL_10;
LABEL_23:
  swift_bridgeObjectRelease();
LABEL_24:
  v6 = v31;
LABEL_25:
  v20 = objc_msgSend(v0, sel_window);

  if (v20)
  {
    if (!*(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_renderer])
    {
      v31 = v6;
      v21 = *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_device];
      v22 = swift_allocObject();
      *(_QWORD *)(v22 + 16) = v21;
      *(_QWORD *)(v22 + 24) = v0;
      aBlock[4] = sub_249D88F1C;
      aBlock[5] = v22;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_249D82804;
      aBlock[3] = &block_descriptor_0;
      v23 = _Block_copy(aBlock);
      swift_unknownObjectRetain();
      v24 = v0;
      v25 = v32;
      sub_249D8B87C();
      v33 = MEMORY[0x24BEE4AF8];
      sub_249D72088((unint64_t *)&unk_2578D43A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D3C80);
      sub_249D88F3C((unint64_t *)&qword_2578D43B0, (uint64_t *)&unk_2578D3C80);
      sub_249D8B9B4();
      MEMORY[0x24BD03850](0, v25, v4, v23);
      _Block_release(v23);
      ((void (*)(char *, uint64_t))v2[1])(v4, v1);
      (*(void (**)(char *, _QWORD *))(v31 + 8))(v25, v5);
      swift_release();
    }
  }
}

uint64_t sub_249D85AB4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[7];

  v3 = sub_249D8B870();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_249D8B894();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for StickerEffectRenderer();
  swift_allocObject();
  v11 = (void *)swift_unknownObjectRetain();
  v12 = sub_249D75F14(v11);
  sub_249D88F7C(0, (unint64_t *)&qword_2578D3C70);
  v21 = sub_249D8B96C();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = v12;
  aBlock[4] = sub_249D89C1C;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_249D82804;
  aBlock[3] = &block_descriptor_44;
  v14 = _Block_copy(aBlock);
  v20 = v4;
  v15 = v14;
  v16 = a2;
  swift_retain();
  swift_release();
  sub_249D8B87C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_249D72088((unint64_t *)&unk_2578D43A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D3C80);
  sub_249D88F3C((unint64_t *)&qword_2578D43B0, (uint64_t *)&unk_2578D3C80);
  sub_249D8B9B4();
  v17 = (void *)v21;
  MEMORY[0x24BD03850](0, v10, v6, v15);
  _Block_release(v15);
  swift_release();

  (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

id sub_249D85D2C(_BYTE *a1, uint64_t a2)
{
  id result;

  *(_QWORD *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_renderer] = a2;
  swift_retain();
  result = (id)swift_release();
  a1[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
  if (!*(_QWORD *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_displayLink])
    return objc_msgSend(a1, sel_setNeedsLayout);
  return result;
}

uint64_t sub_249D85DA0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id StickerEffectView.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v15;
  uint64_t v16;
  objc_super v17;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_249D8B870();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v16 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_249D8B894();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v10, sel_removeObserver_, v1);

  sub_249D88F7C(0, (unint64_t *)&qword_2578D3C70);
  v11 = (void *)sub_249D8B96C();
  aBlock[4] = sub_249D86040;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_249D82804;
  aBlock[3] = &block_descriptor_3;
  v12 = _Block_copy(aBlock);
  sub_249D8B87C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_249D72088((unint64_t *)&unk_2578D43A0, v3, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D3C80);
  sub_249D88F3C((unint64_t *)&qword_2578D43B0, (uint64_t *)&unk_2578D3C80);
  sub_249D8B9B4();
  MEMORY[0x24BD03850](0, v9, v5, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v13 = (objc_class *)type metadata accessor for StickerEffectView();
  v17.receiver = v15;
  v17.super_class = v13;
  return objc_msgSendSuper2(&v17, sel_dealloc);
}

void sub_249D86040()
{
  if (qword_2578D3BC0 != -1)
    swift_once();
  sub_249D6FEE4();
}

void sub_249D861A8()
{
  _BYTE *v0;
  _BYTE *v1;
  id v2;
  _BYTE *v3;
  BOOL v4;
  char v5;
  char v6;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_window);

  if (v2
    && (v3 = &v1[OBJC_IVAR____VKStickerEffectViewInternal_isPaused], swift_beginAccess(), (*v3 & 1) == 0)
    && (swift_beginAccess(), (sub_249D74104() & 1) != 0))
  {
    v4 = CACurrentMediaTime() < *(double *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime] + 1.2 + 1.6;
    v5 = 1;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  v6 = v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive];
  v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive] = v4;
  sub_249D82AF0(v6);
  v1[OBJC_IVAR____VKStickerEffectViewInternal_motionActive] = v5;
  sub_249D82CEC();
}

void sub_249D862B8()
{
  uint64_t v0;

  *(CFTimeInterval *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime) = CACurrentMediaTime();
  sub_249D861A8();
}

void sub_249D86320(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  float v12;
  float v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float32x4_t v18;
  __n128 v19;
  __int128 v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  simd_quatf v25;

  v2 = OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress) & 1) == 0)
  {
    objc_msgSend(a1, sel_targetTimestamp);
    v4 = v3;
    if (qword_2578D3C10 != -1)
      swift_once();
    objc_msgSend((id)qword_2578D4290, sel_settlingDuration);
    v6 = v5;
    if (qword_2578D3C18 != -1)
      swift_once();
    v7 = (void *)qword_2578D4298;
    objc_msgSend((id)qword_2578D4298, sel_settlingDuration);
    v9 = v8;
    v10 = OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime;
    v11 = (v4 - *(double *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime)) / v6;
    *(float *)&v11 = v11;
    *(float *)&v11 = fminf(fmaxf(*(float *)&v11, 0.0), 1.0);
    objc_msgSend((id)qword_2578D4290, sel__solveForInput_, v11);
    v13 = v12;
    v14 = (v4 - *(double *)(v1 + v10) + -1.2) / v9;
    *(float *)&v14 = v14;
    *(float *)&v14 = fminf(fmaxf(*(float *)&v14, 0.0), 1.0);
    objc_msgSend(v7, sel__solveForInput_, v14);
    if (v15 <= 0.985)
      v16 = v15;
    else
      v16 = 1.0;
    if (v13 <= 0.999)
      v17 = v13;
    else
      v17 = 1.0;
    v25 = *(simd_quatf *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_settlingEndAngle);
    simd_slerp((float32x4_t)v25, *(float32x4_t *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_settlingStartAngle), v17);
    simd_slerp(v18, (float32x4_t)v25, v16);
    v19 = *(__n128 *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation);
    *(_OWORD *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation) = v20;
    sub_249D82FA0(v19);
    v21 = *(void **)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_displayLink);
    v22 = v21;
    sub_249D865DC(v21);
    v24 = v23;

    *(_QWORD *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter) = v24;
    if (CACurrentMediaTime() >= *(double *)(v1 + v10) + 1.2 + 1.6)
      sub_249D861A8();
    if (*(_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_needsRender) == 1 && (*(_BYTE *)(v1 + v2) & 1) == 0)
    {
      *(_BYTE *)(v1 + OBJC_IVAR____VKStickerEffectViewInternal_needsRender) = 0;
      sub_249D86810();
    }
  }
}

void sub_249D865DC(void *a1)
{
  char *v1;
  id v3;
  void *v4;
  id v5;
  id v6;
  double MidX;
  double MidY;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float32x2_t v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float32_t v23;
  double v24;
  float32x2_t v25;
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v3 = objc_msgSend(v1, sel_window);
  if (!v3)
  {
    v14 = (float32x2_t)0x3F0000003F000000;
    v15 = 1.0;
    if (!a1)
      return;
    goto LABEL_11;
  }
  v4 = v3;
  v5 = objc_msgSend(v1, sel_layer);
  v6 = objc_msgSend(v5, sel_presentationLayer);

  if (v6)
  {
    objc_msgSend(v6, sel_bounds);
    MidX = CGRectGetMidX(v27);
    objc_msgSend(v6, sel_bounds);
    MidY = CGRectGetMidY(v28);
    v9 = objc_msgSend(v4, sel_layer);
    objc_msgSend(v6, sel_convertPoint_toLayer_, v9, MidX, MidY);
    v11 = v10;
    v13 = v12;

  }
  else
  {
    objc_msgSend(v1, sel_bounds);
    v16 = CGRectGetMidX(v29);
    objc_msgSend(v1, sel_bounds);
    objc_msgSend(v1, sel_convertPoint_toCoordinateSpace_, v4, v16, CGRectGetMidY(v30));
    v11 = v17;
    v13 = v18;
  }
  objc_msgSend(v4, sel_bounds);
  v20 = v19;
  v22 = v21;

  v14.f32[0] = v11 / v20;
  v23 = v13 / v22;
  v14.f32[1] = v23;
  if (v20 > v22)
    v24 = v20;
  else
    v24 = v22;
  v15 = 1.0 / v24;
  if (a1)
  {
LABEL_11:
    if (v1[OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive] == 1)
    {
      v25 = vsub_f32(v14, *(float32x2_t *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter]);
      if (v15 < sqrtf(vaddv_f32(vmul_f32(v25, v25))))
      {
        v26 = a1;
        objc_msgSend(v26, sel_targetTimestamp);
        objc_msgSend(v26, sel_timestamp);

      }
    }
  }
}

void sub_249D86810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  void **v6;
  void *v7;
  void **v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  __int32 *v16;
  uint64_t v17;
  int32x4_t v18;
  int8x16_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32_t v22;
  __int32 v23;
  uint64_t v24;
  float32x4_t *v25;
  uint64_t v26;
  void *v27;
  id v28;
  float32x4_t v29;
  float32x4_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[6];

  v1 = sub_249D8B870();
  v34 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_249D8B894();
  v32 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = *(_QWORD *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_commandQueue);
  v30 = *(float32x4_t *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation);
  v29 = *(float32x4_t *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation);
  v6 = (void **)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  v7 = *v6;
  v8 = (void **)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  v9 = *v8;
  v10 = *(void **)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_metalLayer);
  v11 = v7;
  v12 = v9;
  objc_msgSend(v10, sel_contentsScale);
  v14 = v13;
  v15 = *(_QWORD *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter);
  v16 = (__int32 *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_curlPosition);
  swift_beginAccess();
  if (*v6 && (v17 = *(_QWORD *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_renderer)) != 0)
  {
    v18 = (int32x4_t)vnegq_f32(v29);
    v19 = (int8x16_t)vtrn2q_s32((int32x4_t)v29, vtrn1q_s32((int32x4_t)v29, v18));
    v20 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v29, (int8x16_t)v18, 8uLL), *(float32x2_t *)v30.f32, 1), (float32x4_t)vextq_s8(v19, v19, 8uLL), v30.f32[0]);
    v21 = (float32x4_t)vrev64q_s32((int32x4_t)v29);
    v21.i32[0] = v18.i32[1];
    v21.i32[3] = v18.i32[2];
    v29 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v29, v30, 3), v21, v30, 2), v20);
    v23 = *v16;
    *(_BYTE *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress) = 1;
    v30.i64[0] = *(_QWORD *)(v0 + OBJC_IVAR____VKStickerEffectViewInternal_renderQueue);
    v24 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v25 = (float32x4_t *)swift_allocObject();
    v26 = v31;
    v25[1].i64[0] = v24;
    v25[1].i64[1] = v26;
    v25[2].i64[0] = v17;
    v25[3] = v29;
    v25[4].i64[0] = (uint64_t)v7;
    v25[4].i64[1] = (uint64_t)v12;
    v22 = v14;
    v25[5].f32[0] = v22;
    v25[5].i64[1] = v15;
    v25[6].i32[0] = v23;
    aBlock[4] = sub_249D89C8C;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_249D82804;
    aBlock[3] = &block_descriptor_53;
    v27 = _Block_copy(aBlock);
    swift_retain_n();
    v29.i64[0] = (uint64_t)v12;
    v28 = v11;
    swift_retain();
    swift_unknownObjectRetain();
    sub_249D8B87C();
    v35 = MEMORY[0x24BEE4AF8];
    sub_249D72088((unint64_t *)&unk_2578D43A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D3C80);
    sub_249D88F3C((unint64_t *)&qword_2578D43B0, (uint64_t *)&unk_2578D3C80);
    sub_249D8B9B4();
    MEMORY[0x24BD03850](0, v5, v3, v27);
    _Block_release(v27);
    swift_release();

    (*(void (**)(char *, uint64_t))(v34 + 8))(v3, v1);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v33);
    swift_release();
    swift_release();
  }
  else
  {

  }
}

void sub_249D86C30(uint64_t a1, void *a2, uint64_t a3, __n128 *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  id v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD aBlock[7];

  v7 = sub_249D8B870();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_249D8B894();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v15 = MEMORY[0x24BD03EB0](a1 + 16);
  if (v15)
  {
    v16 = (void *)v15;
    v42 = v11;
    v17 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v15
                                                                + OBJC_IVAR____VKStickerEffectViewInternal_metalLayer), sel_nextDrawable));
    if (v17)
    {
      v18 = v17;
      v19 = objc_msgSend(a2, sel_commandBuffer);
      if (v19)
      {
        v20 = v19;
        v41 = v8;
        sub_249D788EC(a4, v19, objc_msgSend(v18, sel_texture));
        v22 = v21;
        v40 = v18;
        swift_unknownObjectRelease();
        objc_msgSend(v20, sel_commit);
        objc_msgSend(v20, sel_waitUntilScheduled);
        v23 = objc_msgSend(v20, sel_error);
        if (v23)
        {
          v24 = v23;
          v25 = sub_249D8B84C();
          v26 = sub_249D8B930();
          if (os_log_type_enabled(v25, v26))
          {
            v27 = (uint8_t *)swift_slowAlloc();
            v28 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v27 = 138412290;
            v29 = v24;
            v30 = _swift_stdlib_bridgeErrorToNSError();
            aBlock[0] = v30;
            sub_249D8B9A8();
            *v28 = v30;

            _os_log_impl(&dword_249D6E000, v25, v26, "Error in commandBuffer rendering sticker effect, bailing %@", v27, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D4520);
            swift_arrayDestroy();
            MEMORY[0x24BD03E5C](v28, -1, -1);
            MEMORY[0x24BD03E5C](v27, -1, -1);
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();

          }
          else
          {
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();

          }
        }
        else
        {
          if ((v22 & 0x100000000) != 0)
            v31 = 1.0;
          else
            v31 = *(float *)&v22;
          sub_249D88F7C(0, (unint64_t *)&qword_2578D3C70);
          v38 = sub_249D8B96C();
          v32 = swift_allocObject();
          swift_unknownObjectWeakInit();
          v33 = swift_allocObject();
          v39 = v20;
          v34 = v40;
          *(_QWORD *)(v33 + 16) = v32;
          *(_QWORD *)(v33 + 24) = v34;
          *(double *)(v33 + 32) = v31;
          *(_DWORD *)(v33 + 40) = 1065353216;
          aBlock[4] = sub_249D89CC8;
          aBlock[5] = v33;
          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_249D82804;
          aBlock[3] = &block_descriptor_60;
          v35 = _Block_copy(aBlock);
          swift_unknownObjectRetain();
          swift_release();
          sub_249D8B87C();
          aBlock[0] = MEMORY[0x24BEE4AF8];
          sub_249D72088((unint64_t *)&unk_2578D43A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D3C80);
          sub_249D88F3C((unint64_t *)&qword_2578D43B0, (uint64_t *)&unk_2578D3C80);
          sub_249D8B9B4();
          v36 = (void *)v38;
          MEMORY[0x24BD03850](0, v14, v10, v35);
          _Block_release(v35);

          swift_unknownObjectRelease();
          swift_unknownObjectRelease();

          (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v7);
          (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v42);
        }
      }
      else
      {

        swift_unknownObjectRelease();
      }
    }
    else
    {

    }
  }
}

void sub_249D87134(uint64_t a1, void *a2, double a3, float a4)
{
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  void *v10;

  v7 = a1 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x24BD03EB0](v7);
  if (v8)
  {
    v9 = (_BYTE *)v8;
    v10 = (void *)objc_opt_self();
    objc_msgSend(v10, sel_begin);
    objc_msgSend(v10, sel_setDisableActions_, 1);
    objc_msgSend(a2, sel_present);
    v9[OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress] = 0;
    sub_249D82A04(a3);
    *(double *)&v9[OBJC_IVAR____VKStickerEffectViewInternal_strokeScale] = a4;
    objc_msgSend(v10, sel_commit);

  }
}

void sub_249D87210(void (*a1)(_QWORD, _QWORD), uint64_t a2)
{
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void **v12;
  void *v13;
  float32x4_t v14;
  float32x4_t v15;
  int32x4_t v16;
  int8x16_t v17;
  float32x4_t v18;
  float32x4_t v19;
  void **v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  double v26;
  float v27;
  uint64_t v28;
  char *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(_QWORD, _QWORD);
  void *v35;
  id v36;
  id v37;
  char *v38;
  id v39;
  void *v40;
  uint64_t v41;
  float32x4_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(_QWORD, _QWORD);
  uint64_t v48;
  _QWORD aBlock[6];

  v47 = a1;
  v4 = sub_249D8B870();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_249D8B894();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (void **)&v2[OBJC_IVAR____VKStickerEffectViewInternal_image];
  swift_beginAccess();
  v13 = *v12;
  if (*v12)
  {
    v14 = *(float32x4_t *)&v2[OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation];
    v15 = *(float32x4_t *)&v2[OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation];
    v16 = (int32x4_t)vnegq_f32(v15);
    v17 = (int8x16_t)vtrn2q_s32((int32x4_t)v15, vtrn1q_s32((int32x4_t)v15, v16));
    v18 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v15, (int8x16_t)v16, 8uLL), *(float32x2_t *)v14.f32, 1), (float32x4_t)vextq_s8(v17, v17, 8uLL), v14.f32[0]);
    v19 = (float32x4_t)vrev64q_s32((int32x4_t)v15);
    v19.i32[0] = v16.i32[1];
    v19.i32[3] = v16.i32[2];
    v42 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v15, v14, 3), v19, v14, 2), v18);
    v20 = (void **)&v2[OBJC_IVAR____VKStickerEffectViewInternal_effect];
    swift_beginAccess();
    v46 = v8;
    v21 = *v20;
    v22 = *(void **)&v2[OBJC_IVAR____VKStickerEffectViewInternal_metalLayer];
    v23 = v13;
    v45 = v9;
    v24 = v23;
    v25 = v21;
    objc_msgSend(v22, sel_contentsScale);
    v27 = v26;
    v28 = *(_QWORD *)&v2[OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter];
    v29 = &v2[OBJC_IVAR____VKStickerEffectViewInternal_curlPosition];
    swift_beginAccess();
    v30 = *(_DWORD *)v29;
    v31 = *(_QWORD *)&v2[OBJC_IVAR____VKStickerEffectViewInternal_renderer];
    v44 = v5;
    v32 = *(_QWORD *)&v2[OBJC_IVAR____VKStickerEffectViewInternal_instanceNumber];
    v43 = *(_QWORD *)&v2[OBJC_IVAR____VKStickerEffectViewInternal_renderQueue];
    v33 = swift_allocObject();
    *(_QWORD *)(v33 + 16) = v31;
    *(_QWORD *)(v33 + 24) = v2;
    *(_QWORD *)(v33 + 32) = v24;
    *(float32x4_t *)(v33 + 48) = v42;
    *(_QWORD *)(v33 + 64) = v13;
    *(_QWORD *)(v33 + 72) = v25;
    *(float *)(v33 + 80) = v27;
    *(_QWORD *)(v33 + 88) = v28;
    *(_DWORD *)(v33 + 96) = v30;
    v34 = v47;
    *(_QWORD *)(v33 + 104) = v32;
    *(_QWORD *)(v33 + 112) = v34;
    *(_QWORD *)(v33 + 120) = a2;
    aBlock[4] = sub_249D8906C;
    aBlock[5] = v33;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_249D82804;
    aBlock[3] = &block_descriptor_9;
    v35 = _Block_copy(aBlock);
    swift_retain_n();
    v36 = v24;
    v37 = v25;
    v38 = v2;
    swift_retain();
    v39 = v36;
    sub_249D8B87C();
    v48 = MEMORY[0x24BEE4AF8];
    sub_249D72088((unint64_t *)&unk_2578D43A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D3C80);
    sub_249D88F3C((unint64_t *)&qword_2578D43B0, (uint64_t *)&unk_2578D3C80);
    sub_249D8B9B4();
    MEMORY[0x24BD03850](0, v11, v7, v35);
    _Block_release(v35);
    swift_release();

    (*(void (**)(char *, uint64_t))(v44 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v11, v46);
    swift_release();
  }
  else
  {
    sub_249D89024();
    v40 = (void *)swift_allocError();
    *(_DWORD *)v41 = 3;
    *(_BYTE *)(v41 + 4) = 1;
    v47(0, v40);

  }
}

void sub_249D87614(uint64_t a1, uint64_t a2, void *a3, __n128 *a4, uint64_t a5, void (*a6)(_QWORD, _QWORD), uint64_t a7)
{
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  __n64 v21;
  float v22;
  float v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t inited;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  unint64_t v45;
  const __CFDictionary *v46;
  uint64_t v47;
  void *v48;
  id v49;
  const __CFDictionary *v50;
  const __CFAllocator *v51;
  CVReturn v52;
  __CVPixelBufferPool *v53;
  CVReturn v54;
  void *v55;
  __CVBuffer *v56;
  CVReturn v57;
  __CVBuffer *v58;
  __CVMetalTextureCache *v59;
  CVReturn v60;
  BOOL v61;
  CVReturn v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  __CVBuffer *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  void (*v77)(_QWORD, _QWORD);
  void *v78;
  __CVBuffer *v79;
  CGColorSpace *v80;
  id v81;
  __CVBuffer *v82;
  CVBufferRef buffer;
  __n128 *v84;
  size_t v85;
  size_t v86;
  uint64_t v87;
  void (*v88)(_QWORD, _QWORD);
  __CVMetalTextureCache *v89;
  uint64_t v90;
  CGColorSpaceRef DeviceRGB;
  _QWORD aBlock[8];
  CVMetalTextureRef textureOut;
  CVMetalTextureCacheRef cacheOut;
  CVPixelBufferRef pixelBufferOut;
  CVPixelBufferPoolRef poolOut[48];

  poolOut[46] = *(CVPixelBufferPoolRef *)MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v87 = a2;
  }
  else
  {
    type metadata accessor for StickerEffectRenderer();
    swift_allocObject();
    v66 = (void *)swift_unknownObjectRetain();
    sub_249D75F14(v66);
    v87 = a2;
  }
  swift_retain();
  objc_msgSend(a3, sel_size);
  v13 = v12;
  objc_msgSend(a3, sel_scale);
  v15 = v13 * v14;
  if ((~COERCE__INT64(v13 * v14) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_44;
  }
  if (v15 <= -9.22337204e18)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (v15 >= 9.22337204e18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  objc_msgSend(a3, sel_size);
  v17 = v16;
  objc_msgSend(a3, sel_scale);
  v19 = v17 * v18;
  if ((~*(_QWORD *)&v19 & 0x7FF0000000000000) == 0)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if (v19 <= -9.22337204e18)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (v19 >= 9.22337204e18)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  v20 = (uint64_t)v19;
  v21.n64_u64[0] = sub_249D7865C(a4[1].n128_i64[1], (uint64_t)v15, v20, (uint64_t)v15, v20, a4[2].n128_f32[0]).n64_u64[0];
  v22 = (float)(uint64_t)v15 / v21.n64_f32[0];
  if (v22 <= -9.2234e18)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  if (v22 >= 9.2234e18)
  {
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  v23 = (float)v20 / v21.n64_f32[1];
  if ((LODWORD(v22) & 0x7F800000) == 0x7F800000
    || (COERCE_UNSIGNED_INT((float)v20 / v21.n64_f32[1]) & 0x7F800000) == 2139095040)
  {
    goto LABEL_51;
  }
  if (v23 <= -9.2234e18)
  {
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
  }
  if (v23 >= 9.2234e18)
    goto LABEL_53;
  v84 = a4;
  v88 = a6;
  v90 = a7;
  v25 = (uint64_t)v22;
  v26 = (uint64_t)v23;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D4270);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_249D8CCB0;
  v28 = (void *)*MEMORY[0x24BDC5708];
  v29 = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDC5708];
  *(_QWORD *)(inited + 40) = v25;
  v85 = v25;
  v30 = (void *)*MEMORY[0x24BDC5650];
  *(_QWORD *)(inited + 64) = v29;
  *(_QWORD *)(inited + 72) = v30;
  v86 = v26;
  *(_QWORD *)(inited + 80) = v26;
  v31 = (void *)*MEMORY[0x24BDC56B8];
  *(_QWORD *)(inited + 104) = v29;
  *(_QWORD *)(inited + 112) = v31;
  v32 = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 120) = 1111970369;
  v33 = (void *)*MEMORY[0x24BDC55E8];
  *(_QWORD *)(inited + 144) = v32;
  *(_QWORD *)(inited + 152) = v33;
  v34 = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 160) = 1;
  v35 = (void *)*MEMORY[0x24BDC55E0];
  *(_QWORD *)(inited + 184) = v34;
  *(_QWORD *)(inited + 192) = v35;
  *(_BYTE *)(inited + 200) = 1;
  v36 = (void *)*MEMORY[0x24BDC5690];
  *(_QWORD *)(inited + 224) = v34;
  *(_QWORD *)(inited + 232) = v36;
  *(_BYTE *)(inited + 240) = 1;
  v37 = (void *)*MEMORY[0x24BDC5668];
  *(_QWORD *)(inited + 264) = v34;
  *(_QWORD *)(inited + 272) = v37;
  v38 = v28;
  v39 = v30;
  v40 = v31;
  v41 = v33;
  v42 = v35;
  v43 = v36;
  v44 = v37;
  v45 = sub_249D76918(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(inited + 304) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D41F0);
  *(_QWORD *)(inited + 280) = v45;
  sub_249D76918(inited);
  type metadata accessor for CFString(0);
  sub_249D72088((unint64_t *)&qword_2578D3D08, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_249D8CAA0);
  v46 = (const __CFDictionary *)sub_249D8B8A0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578D4200);
  v47 = swift_initStackObject();
  *(_OWORD *)(v47 + 16) = xmmword_249D8CCC0;
  v48 = (void *)*MEMORY[0x24BDC56E0];
  *(_QWORD *)(v47 + 32) = *MEMORY[0x24BDC56E0];
  *(_QWORD *)(v47 + 40) = 1;
  v49 = v48;
  sub_249D76A30(v47);
  v50 = (const __CFDictionary *)sub_249D8B8A0();
  swift_bridgeObjectRelease();
  poolOut[0] = 0;
  v51 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v52 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v50, v46, poolOut);
  if (v52 || !poolOut[0])
  {
    sub_249D89024();
    v63 = (void *)swift_allocError();
    *(_DWORD *)v65 = v52;
    *(_BYTE *)(v65 + 4) = 0;
    swift_willThrow();

    swift_release();
LABEL_40:

    goto LABEL_41;
  }
  pixelBufferOut = 0;
  v53 = poolOut[0];
  v54 = CVPixelBufferPoolCreatePixelBuffer(v51, v53, &pixelBufferOut);
  if (v54 || !pixelBufferOut)
  {
    sub_249D89024();
    v63 = (void *)swift_allocError();
    *(_DWORD *)v67 = v54;
    *(_BYTE *)(v67 + 4) = 0;
    swift_willThrow();

    swift_release();
LABEL_39:

    goto LABEL_40;
  }
  cacheOut = 0;
  v55 = *(void **)(v87 + OBJC_IVAR____VKStickerEffectViewInternal_device);
  v56 = pixelBufferOut;
  v57 = CVMetalTextureCacheCreate(v51, 0, v55, 0, &cacheOut);
  if (v57 || !cacheOut)
  {
    sub_249D89024();
    v63 = (void *)swift_allocError();
    *(_DWORD *)v68 = v57;
    *(_BYTE *)(v68 + 4) = 0;
    swift_willThrow();

    swift_release();
LABEL_38:

    goto LABEL_39;
  }
  textureOut = 0;
  v58 = v56;
  v59 = cacheOut;
  v60 = CVMetalTextureCacheCreateTextureFromImage(v51, v59, v58, 0, MTLPixelFormatBGRA8Unorm, v85, v86, 0, &textureOut);
  if (v60)
    v61 = 1;
  else
    v61 = textureOut == 0;
  if (v61)
  {
    v62 = v60;
    sub_249D89024();
    v63 = (void *)swift_allocError();
    *(_DWORD *)v64 = v62;
    *(_BYTE *)(v64 + 4) = 0;
    swift_willThrow();

LABEL_37:
    swift_release();

    goto LABEL_38;
  }
  buffer = v58;
  v69 = textureOut;
  v70 = CVMetalTextureGetTexture(v69);
  if (!v70)
  {
    sub_249D89024();
    v63 = (void *)swift_allocError();
    *(_DWORD *)v74 = 2;
    *(_BYTE *)(v74 + 4) = 1;
    swift_willThrow();

    goto LABEL_37;
  }
  v71 = v70;
  v82 = v69;
  CVBufferSetAttachment(buffer, (CFStringRef)*MEMORY[0x24BDC5410], DeviceRGB, kCVAttachmentMode_ShouldPropagate);
  v72 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v87
                                                              + OBJC_IVAR____VKStickerEffectViewInternal_commandQueue), sel_commandBuffer));
  if (v72)
  {
    v73 = v72;
    swift_retain();
    sub_249D788EC(v84, v73, v71);
    swift_release();
    v76 = swift_allocObject();
    v77 = v88;
    v89 = v59;
    *(_QWORD *)(v76 + 16) = v77;
    *(_QWORD *)(v76 + 24) = v90;
    *(_QWORD *)(v76 + 32) = buffer;
    *(_QWORD *)(v76 + 40) = v85;
    *(_QWORD *)(v76 + 48) = v86;
    *(_QWORD *)(v76 + 56) = DeviceRGB;
    *(_DWORD *)(v76 + 64) = 8194;
    *(_QWORD *)(v76 + 72) = a3;
    aBlock[4] = sub_249D89B74;
    aBlock[5] = v76;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_249D88258;
    aBlock[3] = &block_descriptor_38;
    v78 = _Block_copy(aBlock);
    v79 = buffer;
    swift_retain();
    v80 = DeviceRGB;
    v81 = a3;
    swift_release();
    objc_msgSend(v73, sel_addCompletedHandler_, v78);
    _Block_release(v78);
    objc_msgSend(v73, sel_commit);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_release();
    return;
  }
  type metadata accessor for MTLCommandBufferError(0);
  aBlock[6] = 1;
  sub_249D883F8(MEMORY[0x24BEE4AF8]);
  sub_249D72088((unint64_t *)&qword_2578D3D00, (uint64_t (*)(uint64_t))type metadata accessor for MTLCommandBufferError, (uint64_t)&unk_249D8C964);
  sub_249D8B804();
  v63 = (void *)aBlock[0];
  swift_willThrow();
  swift_unknownObjectRelease();

  swift_release();
LABEL_41:
  v75 = v63;
  v88(0, v63);

}

void sub_249D88020(void *a1, void (*a2)(id, void *), uint64_t a3, __CVBuffer *a4, size_t a5, size_t a6, CGColorSpace *a7, uint32_t a8, void *a9)
{
  id v15;
  id v16;
  void *BaseAddress;
  size_t BytesPerRow;
  CGContext *v19;
  CGContext *v20;
  CGImageRef Image;
  CGImageRef v22;
  CGImage *v23;
  double v24;
  double v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;

  v15 = objc_msgSend(a1, sel_error);
  if (!v15)
  {
    CVPixelBufferLockBaseAddress(a4, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(a4);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
    v19 = CGBitmapContextCreate(BaseAddress, a5, a6, 8uLL, BytesPerRow, a7, a8);
    if (v19)
    {
      v20 = v19;
      Image = CGBitmapContextCreateImage(v19);
      if (Image)
      {
        v22 = Image;
        CVPixelBufferUnlockBaseAddress(a4, 0);
        v23 = v22;
        objc_msgSend(a9, sel_scale);
        v25 = v24;
        v26 = objc_msgSend(a9, sel_imageOrientation);
        v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCGImage_scale_orientation_, v23, v26, v25);

        v32 = v27;
        a2(v27, 0);

        goto LABEL_3;
      }
      sub_249D89024();
      v28 = (void *)swift_allocError();
      *(_DWORD *)v30 = 3;
      *(_BYTE *)(v30 + 4) = 1;
      swift_willThrow();

    }
    else
    {
      sub_249D89024();
      v28 = (void *)swift_allocError();
      *(_DWORD *)v29 = 1;
      *(_BYTE *)(v29 + 4) = 1;
      swift_willThrow();
    }
    v31 = v28;
    a2(0, v28);

    return;
  }
  v16 = v15;
  v32 = v15;
  a2(0, v16);
LABEL_3:

}

uint64_t sub_249D88258(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_249D882F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_249D8B810();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

id StickerEffectView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void StickerEffectView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t sub_249D883F8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578D44B0);
  v2 = sub_249D8BA14();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_249D89BA8(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_249D88520(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_249D787E8(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_249D88520(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_249D8BA8C();
  sub_249D8B8D0();
  v4 = sub_249D8BAA4();
  return sub_249D88584(a1, a2, v4);
}

unint64_t sub_249D88584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_249D8BA38() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_249D8BA38() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_249D8BA38() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

void sub_249D886C8(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  v4 = (_QWORD *)(a2 + 136);
  swift_beginAccess();
  v5 = *(_QWORD *)(a2 + 136);
  v9[2] = a1;
  v9[3] = &off_251B358A0;
  swift_bridgeObjectRetain();
  v6 = sub_249D826C0(sub_249D89CD8, (uint64_t)v9, v5);
  swift_bridgeObjectRelease();
  if ((v6 & 1) == 0)
  {
    type metadata accessor for StickerEffectMotionManager.WeakObserver();
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 24) = 0;
    swift_unknownObjectWeakInit();
    *(_QWORD *)(v7 + 24) = &off_251B358A0;
    swift_unknownObjectWeakAssign();
    v8 = swift_beginAccess();
    MEMORY[0x24BD037C0](v8);
    if (*(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_249D8B90C();
    sub_249D8B918();
    sub_249D8B900();
    swift_endAccess();
    sub_249D6FEE4();
  }
}

void sub_249D887F0(uint64_t a1, double a2, double a3)
{
  uint64_t *v5;

  if (a1 < 0)
  {
    sub_249D8B9F0();
    __break(1u);
    JUMPOUT(0x249D88A40);
  }
  switch(a1)
  {
    case 1:
      if (qword_2578D3BE0 != -1)
        swift_once();
      v5 = &qword_2578D3E48;
      break;
    case 2:
      if (qword_2578D3BE8 != -1)
        swift_once();
      v5 = &qword_2578D3E50;
      break;
    case 3:
      if (qword_2578D3BF0 != -1)
        swift_once();
      v5 = &qword_2578D3E58;
      break;
    case 4:
      if (qword_2578D3BF8 != -1)
        swift_once();
      v5 = &qword_2578D3E60;
      break;
    default:
      if (qword_2578D3BD8 != -1)
        goto LABEL_29;
      goto LABEL_4;
  }
  while (1)
  {
    if (a2 <= -9.22337204e18)
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    if (a2 >= 9.22337204e18)
      goto LABEL_25;
    if ((*(_QWORD *)&a2 & 0x7FF0000000000000) == 0x7FF0000000000000
      || (*(_QWORD *)&a3 & 0x7FF0000000000000) == 0x7FF0000000000000)
    {
      goto LABEL_26;
    }
    if (a3 > -9.22337204e18)
      break;
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    swift_once();
LABEL_4:
    v5 = &qword_2578D3E40;
  }
  if (a3 >= 9.22337204e18)
    goto LABEL_28;
  sub_249D8B2BC(*v5, (uint64_t)a2, (uint64_t)a3, 1.0);
}

uint64_t type metadata accessor for StickerEffectView()
{
  uint64_t result;

  result = qword_2578D4430;
  if (!qword_2578D4430)
    return swift_getSingletonMetadata();
  return result;
}

void _s17VisionKitInternal17StickerEffectViewC5coderACSgSo7NSCoderC_tcfc_0()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v1 = v0;
  sub_249D8B954();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  v3 = sub_249D8B960();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249D8B894();
  MEMORY[0x24BDAC7A8]();
  v13[0] = 0x8000000249D8D3A0;
  sub_249D8B858();
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_instanceLabel] = 0;
  v7 = OBJC_IVAR____VKStickerEffectViewInternal_metalLayer;
  *(_QWORD *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5708]), sel_init);
  v8 = OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer;
  *(_QWORD *)&v0[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE56D0]), sel_init);
  v0[OBJC_IVAR____VKStickerEffectViewInternal_needsRender] = 1;
  v0[OBJC_IVAR____VKStickerEffectViewInternal_renderInProgress] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_scrollViewToObserveCount] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_requiredScale] = 0x3FF0000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_appliedScale] = 0x3FF0000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_strokeScale] = 0x3FF0000000000000;
  v9 = OBJC_IVAR____VKStickerEffectViewInternal_renderQueue;
  sub_249D88F7C(0, (unint64_t *)&qword_2578D3C70);
  sub_249D8B888();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5758], v3);
  v13[1] = MEMORY[0x24BEE4AF8];
  sub_249D72088(&qword_2578D4318, v2, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578D4320);
  sub_249D88F3C(&qword_2578D4328, &qword_2578D4320);
  sub_249D8B9B4();
  *(_QWORD *)&v0[v9] = sub_249D8B984();
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_renderer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_displayLink] = 0;
  v10 = qword_2578D4280;
  v11 = qword_2578D4280 + 1;
  if (__OFADD__(qword_2578D4280, 1))
    __break(1u);
  qword_2578D4280 = v11;
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_instanceNumber] = v10;
  v0[OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive] = 0;
  v0[OBJC_IVAR____VKStickerEffectViewInternal_motionActive] = 0;
  *(_OWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation] = xmmword_249D8C530;
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_settlingDuration1] = 0x3FF3333333333333;
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_settlingDuration2] = 0x3FF999999999999ALL;
  *(_OWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_settlingStartAngle] = xmmword_249D8D3B0;
  *(_OWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_settlingEndAngle] = xmmword_249D8C530;
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime] = 0;
  *(_OWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation] = xmmword_249D8C530;
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_screenCenterDuration] = 0x3FD999999999999ALL;
  *(_QWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter] = 0x3F0000003F000000;
  v0[OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke] = 1;
  v0[OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion] = 1;
  *(_DWORD *)&v0[OBJC_IVAR____VKStickerEffectViewInternal_curlPosition] = 1065353216;
  v12 = OBJC_IVAR____VKStickerEffectViewInternal_effect;
  *(_QWORD *)&v1[v12] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerEffect()), sel_init);
  *(_QWORD *)&v1[OBJC_IVAR____VKStickerEffectViewInternal_image] = 0;
  v1[OBJC_IVAR____VKStickerEffectViewInternal_isPaused] = 0;

  sub_249D8B9FC();
  __break(1u);
}

uint64_t sub_249D88EF0()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_249D88F1C()
{
  uint64_t v0;

  return sub_249D85AB4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_249D88F3C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BD03DD8](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_249D88F7C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void _s17VisionKitInternal17StickerEffectViewC23resetRestingOrientationyyFZ_0()
{
  uint64_t v0;
  char v1;

  if (qword_2578D3BC0 != -1)
    swift_once();
  v0 = qword_2578D4680;
  v1 = *(_BYTE *)(qword_2578D4680 + 48);
  *(_OWORD *)(qword_2578D4680 + 64) = *(_OWORD *)(qword_2578D4680 + 32);
  *(_BYTE *)(v0 + 80) = v1;
  *(CFTimeInterval *)(v0 + 88) = CACurrentMediaTime();
  *(_BYTE *)(v0 + 96) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_BYTE *)(v0 + 48) = 1;
}

unint64_t sub_249D89024()
{
  unint64_t result;

  result = qword_2578D43C0;
  if (!qword_2578D43C0)
  {
    result = MEMORY[0x24BD03DD8](&unk_249D8D490, &type metadata for StickerEffectView.SnapshotError);
    atomic_store(result, (unint64_t *)&qword_2578D43C0);
  }
  return result;
}

uint64_t sub_249D89070@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke, a2);
}

uint64_t sub_249D8907C(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke);
}

uint64_t sub_249D89088@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion, a2);
}

uint64_t sub_249D89094(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion);
}

float sub_249D890A0@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  float *v3;
  float result;

  v3 = (float *)(*a1 + OBJC_IVAR____VKStickerEffectViewInternal_curlPosition);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_DWORD *)v3;
  return result;
}

id sub_249D890F0(float *a1)
{
  return sub_249D833F0(*a1);
}

id sub_249D89114@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_249D89164(id *a1)
{
  sub_249D83634(*a1);
}

id sub_249D8918C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_249D891E0@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_249D89234@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____VKStickerEffectViewInternal_isPaused, a2);
}

uint64_t sub_249D89244()
{
  return type metadata accessor for StickerEffectView();
}

uint64_t sub_249D8924C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_249D8B864();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

uint64_t method lookup function for StickerEffectView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StickerEffectView.boundsIncludeStroke.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x310))();
}

uint64_t dispatch thunk of StickerEffectView.boundsIncludeStroke.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x318))();
}

uint64_t dispatch thunk of StickerEffectView.boundsIncludeStroke.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x320))();
}

uint64_t dispatch thunk of StickerEffectView.reRenderOnMotion.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x328))();
}

uint64_t dispatch thunk of StickerEffectView.reRenderOnMotion.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x330))();
}

uint64_t dispatch thunk of StickerEffectView.reRenderOnMotion.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x338))();
}

uint64_t dispatch thunk of StickerEffectView.curlPosition.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x340))();
}

uint64_t dispatch thunk of StickerEffectView.curlPosition.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x348))();
}

uint64_t dispatch thunk of StickerEffectView.curlPosition.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x350))();
}

uint64_t dispatch thunk of StickerEffectView.effect.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x358))();
}

uint64_t dispatch thunk of StickerEffectView.effect.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x360))();
}

uint64_t dispatch thunk of StickerEffectView.effect.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x368))();
}

uint64_t dispatch thunk of StickerEffectView._effect.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x370))();
}

uint64_t dispatch thunk of StickerEffectView._effect.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x378))();
}

uint64_t dispatch thunk of StickerEffectView._effect.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x380))();
}

uint64_t dispatch thunk of StickerEffectView.image.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x388))();
}

uint64_t dispatch thunk of StickerEffectView.image.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x390))();
}

uint64_t dispatch thunk of StickerEffectView.image.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x398))();
}

uint64_t dispatch thunk of StickerEffectView.isPaused.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3A0))();
}

uint64_t dispatch thunk of StickerEffectView.isPaused.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3A8))();
}

uint64_t dispatch thunk of StickerEffectView.isPaused.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3B0))();
}

uint64_t dispatch thunk of StickerEffectView.__allocating_init(device:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 952))();
}

uint64_t dispatch thunk of StickerEffectView._observeScrollViewDidScroll(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3D0))();
}

uint64_t dispatch thunk of StickerEffectView.playSettlingAnimation()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F0))();
}

uint64_t dispatch thunk of StickerEffectView.snapshot(completionHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x420))();
}

ValueMetadata *type metadata accessor for StickerEffectView.SnapshotError()
{
  return &type metadata for StickerEffectView.SnapshotError;
}

uint64_t sub_249D89608(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D44A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_249D89648(char *a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void **v12;
  void *v13;
  float32x4_t v14;
  float32x4_t v15;
  int32x4_t v16;
  int8x16_t v17;
  float32x4_t v18;
  float32x4_t v19;
  void **v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  double v27;
  float v28;
  uint64_t v29;
  char *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  char *v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  float32x4_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD aBlock[6];

  v4 = sub_249D8B870();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_249D8B894();
  v50 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a2;
  v12 = (void **)&a1[OBJC_IVAR____VKStickerEffectViewInternal_image];
  swift_beginAccess();
  v13 = *v12;
  if (*v12)
  {
    v14 = *(float32x4_t *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_deviceOrientation];
    v15 = *(float32x4_t *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_settlingOrientation];
    v16 = (int32x4_t)vnegq_f32(v15);
    v17 = (int8x16_t)vtrn2q_s32((int32x4_t)v15, vtrn1q_s32((int32x4_t)v15, v16));
    v18 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v15, (int8x16_t)v16, 8uLL), *(float32x2_t *)v14.f32, 1), (float32x4_t)vextq_s8(v17, v17, 8uLL), v14.f32[0]);
    v19 = (float32x4_t)vrev64q_s32((int32x4_t)v15);
    v19.i32[0] = v16.i32[1];
    v19.i32[3] = v16.i32[2];
    v45 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v15, v14, 3), v19, v14, 2), v18);
    v20 = (void **)&a1[OBJC_IVAR____VKStickerEffectViewInternal_effect];
    swift_beginAccess();
    v47 = v4;
    v21 = *v20;
    v22 = *(void **)&a1[OBJC_IVAR____VKStickerEffectViewInternal_metalLayer];
    v23 = v13;
    v49 = v5;
    v24 = v23;
    _Block_copy(a2);
    v25 = v21;
    v48 = v8;
    v26 = v25;
    objc_msgSend(v22, sel_contentsScale);
    v28 = v27;
    v29 = *(_QWORD *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter];
    v30 = &a1[OBJC_IVAR____VKStickerEffectViewInternal_curlPosition];
    swift_beginAccess();
    v31 = *(_DWORD *)v30;
    v32 = *(_QWORD *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_renderer];
    v33 = *(_QWORD *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_instanceNumber];
    v46 = *(_QWORD *)&a1[OBJC_IVAR____VKStickerEffectViewInternal_renderQueue];
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = v32;
    *(_QWORD *)(v34 + 24) = a1;
    *(_QWORD *)(v34 + 32) = v24;
    *(float32x4_t *)(v34 + 48) = v45;
    *(_QWORD *)(v34 + 64) = v13;
    *(_QWORD *)(v34 + 72) = v26;
    *(float *)(v34 + 80) = v28;
    *(_QWORD *)(v34 + 88) = v29;
    *(_DWORD *)(v34 + 96) = v31;
    *(_QWORD *)(v34 + 104) = v33;
    *(_QWORD *)(v34 + 112) = sub_249D89AC8;
    *(_QWORD *)(v34 + 120) = v11;
    aBlock[4] = sub_249D8906C;
    aBlock[5] = v34;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_249D82804;
    aBlock[3] = &block_descriptor_32;
    v35 = _Block_copy(aBlock);
    swift_retain_n();
    v36 = v24;
    v37 = v26;
    v38 = a1;
    swift_retain();
    v39 = v36;
    sub_249D8B87C();
    v51 = MEMORY[0x24BEE4AF8];
    sub_249D72088((unint64_t *)&unk_2578D43A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578D3C80);
    sub_249D88F3C((unint64_t *)&qword_2578D43B0, (uint64_t *)&unk_2578D3C80);
    v40 = v47;
    sub_249D8B9B4();
    MEMORY[0x24BD03850](0, v10, v7, v35);
    _Block_release(v35);
    swift_release();

    (*(void (**)(char *, uint64_t))(v49 + 8))(v7, v40);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v10, v48);
    swift_release();
  }
  else
  {
    sub_249D89024();
    v41 = (void *)swift_allocError();
    *(_DWORD *)v42 = 3;
    *(_BYTE *)(v42 + 4) = 1;
    _Block_copy(a2);
    v43 = (void *)sub_249D8B810();
    ((void (**)(_QWORD, _QWORD, void *))a2)[2](a2, 0, v43);

  }
  return swift_release();
}

uint64_t sub_249D89AA4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_249D89AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_249D882F8(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t objectdestroy_5Tm()
{
  id *v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_249D89B20()
{
  uint64_t v0;

  sub_249D87614(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), (__n128 *)(v0 + 48), *(_QWORD *)(v0 + 104), *(void (**)(_QWORD, _QWORD))(v0 + 112), *(_QWORD *)(v0 + 120));
}

uint64_t sub_249D89B38()
{
  id *v0;

  swift_release();

  return swift_deallocObject();
}

void sub_249D89B74(void *a1)
{
  uint64_t v1;

  sub_249D88020(a1, *(void (**)(id, void *))(v1 + 16), *(_QWORD *)(v1 + 24), *(__CVBuffer **)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(CGColorSpace **)(v1 + 56), *(_DWORD *)(v1 + 64), *(void **)(v1 + 72));
}

uint64_t sub_249D89BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578D44B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_249D89BF0()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

id sub_249D89C1C()
{
  uint64_t v0;

  return sub_249D85D2C(*(_BYTE **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_249D89C24()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_249D89C48()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

void sub_249D89C8C()
{
  uint64_t v0;

  sub_249D86C30(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), (__n128 *)(v0 + 48));
}

uint64_t sub_249D89C9C()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_249D89CC8()
{
  uint64_t v0;

  sub_249D87134(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(double *)(v0 + 32), *(float *)(v0 + 40));
}

uint64_t sub_249D89CD8(_QWORD *a1)
{
  uint64_t v1;

  return sub_249D6FD10(a1, *(_QWORD *)(v1 + 16)) & 1;
}

id sub_249D89D2C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerComicLookupFilterShader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicLookupFilterShader()
{
  return objc_opt_self();
}

id sub_249D89D7C(void *a1)
{
  return sub_249D7AF7C(a1, &OBJC_IVAR____TtC17VisionKitInternal34StickerComicGaussBlurExpressShader_sigma);
}

id sub_249D89DC8()
{
  return sub_249D75EC4(type metadata accessor for StickerComicGaussBlurExpressShader);
}

uint64_t type metadata accessor for StickerComicGaussBlurExpressShader()
{
  return objc_opt_self();
}

id sub_249D89DF4(void *a1)
{
  return sub_249D7AF7C(a1, &OBJC_IVAR____TtC17VisionKitInternal41StickerComicGaussBlurExpressPassTwoShader_sigma);
}

id sub_249D89E40()
{
  return sub_249D75EC4(type metadata accessor for StickerComicGaussBlurExpressPassTwoShader);
}

uint64_t type metadata accessor for StickerComicGaussBlurExpressPassTwoShader()
{
  return objc_opt_self();
}

void sub_249D89E6C(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDD690]), sel_init);
  v6 = objc_msgSend(v5, sel_colorAttachments);
  v7 = objc_msgSend(v6, sel_objectAtIndexedSubscript_, 0);

  if (!v7)
  {
    __break(1u);
    goto LABEL_8;
  }
  objc_msgSend(v7, sel_setTexture_, a1);

  v8 = objc_msgSend(v5, sel_colorAttachments);
  v9 = objc_msgSend(v8, sel_objectAtIndexedSubscript_, 0);

  if (!v9)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  objc_msgSend(v9, sel_setLoadAction_, 2);

  v10 = objc_msgSend(v5, sel_colorAttachments);
  v11 = objc_msgSend(v10, sel_objectAtIndexedSubscript_, 0);

  if (!v11)
  {
LABEL_9:
    __break(1u);
    return;
  }
  objc_msgSend(v11, sel_setClearColor_, 0.0, 0.0, 0.0, 0.0);

  v12 = objc_msgSend(a2, sel_renderCommandEncoderWithDescriptor_, v5);
  if (v12)
    objc_msgSend(v12, sel_setRenderPipelineState_, *(_QWORD *)(v2 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_pipelineState));

}

void sub_249D8A014(uint64_t a1, char **a2, uint64_t a3, void *a4)
{
  _QWORD *v4;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  sub_249D89E6C(a1, a4);
  if (!v7)
    return;
  v8 = v7;
  objc_msgSend(v7, sel_setFragmentTexture_atIndex_, a2, 0);
  objc_msgSend(v8, sel_setFragmentTexture_atIndex_, a3, 1);
  if (qword_2578D3C28 != -1)
    swift_once();
  v9 = *(_QWORD *)(qword_2578D4718 + 16);
  if (v9 >> 61)
  {
    __break(1u);
    goto LABEL_11;
  }
  a2 = &selRef_defaultCenter;
  objc_msgSend(v8, sel_setVertexBytes_length_atIndex_, qword_2578D4718 + 32, 4 * v9, 0);
  if (qword_2578D3C20 != -1)
LABEL_11:
    swift_once();
  v10 = qword_2578D4710;
  v11 = *(_QWORD *)(qword_2578D4710 + 16);
  if (v11 >> 61)
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(v8, a2[36], qword_2578D4710 + 32, 4 * v11, 1);
    v12 = *(_QWORD *)(v10 + 16);
    if (!(v12 >> 61))
    {
      objc_msgSend(v8, a2[36], v10 + 32, 4 * v12, 2);
      (*(void (**)(void *))((*MEMORY[0x24BEE4EA0] & *v4) + 0x98))(v8);
      objc_msgSend(v8, sel_drawPrimitives_vertexStart_vertexCount_, 4, 0, 4);
      objc_msgSend(v8, sel_endEncoding);
      swift_unknownObjectRelease();
      return;
    }
  }
  __break(1u);
}

void sub_249D8A1C0(uint64_t a1, char **a2, void *a3)
{
  _QWORD *v3;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;

  sub_249D89E6C(a1, a3);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setFragmentTexture_atIndex_, a2, 0);
    if (qword_2578D3C28 != -1)
      swift_once();
    v7 = *(_QWORD *)(qword_2578D4718 + 16);
    if (v7 >> 61)
    {
      __break(1u);
    }
    else
    {
      a2 = &selRef_defaultCenter;
      objc_msgSend(v6, sel_setVertexBytes_length_atIndex_, qword_2578D4718 + 32, 4 * v7, 0);
      if (qword_2578D3C20 == -1)
        goto LABEL_6;
    }
    swift_once();
LABEL_6:
    v8 = *(_QWORD *)(qword_2578D4710 + 16);
    if (v8 >> 61)
    {
      __break(1u);
    }
    else
    {
      objc_msgSend(v6, a2[36], qword_2578D4710 + 32, 4 * v8, 1);
      (*(void (**)(void *))((*MEMORY[0x24BEE4EA0] & *v3) + 0x98))(v6);
      objc_msgSend(v6, sel_drawPrimitives_vertexStart_vertexCount_, 4, 0, 4);
      objc_msgSend(v6, sel_endEncoding);
      swift_unknownObjectRelease();
    }
  }
}

void sub_249D8A31C()
{
  qword_2578D4710 = (uint64_t)&unk_251B357D0;
}

void sub_249D8A330()
{
  qword_2578D4718 = (uint64_t)&unk_251B35790;
}

char *sub_249D8A344(void *a1, void *a2)
{
  char *v2;
  char *v5;
  char *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  objc_super v19;
  id v20[2];

  v20[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = &v2[OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = v2;
  v7 = (void *)sub_249D8B8B8();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(a2, sel_newFunctionWithName_, v7);

  v9 = (void *)sub_249D8B8B8();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(a2, sel_newFunctionWithName_, v9);

  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDD6B8]), sel_init);
  objc_msgSend(v11, sel_setVertexFunction_, v8);
  objc_msgSend(v11, sel_setFragmentFunction_, v10);
  v12 = objc_msgSend(v11, sel_colorAttachments);
  v13 = objc_msgSend(v12, sel_objectAtIndexedSubscript_, 0);

  if (!v13)
    __break(1u);
  objc_msgSend(v13, sel_setPixelFormat_, 80);

  v20[0] = 0;
  v14 = objc_msgSend(a1, sel_newRenderPipelineStateWithDescriptor_error_, v11, v20);
  if (v14)
  {
    v15 = v14;
    v16 = v20[0];
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    *(_QWORD *)&v6[OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_pipelineState] = v15;
    v19.receiver = v6;
    v19.super_class = (Class)type metadata accessor for StickerComicShaderBase();
    v6 = (char *)objc_msgSendSuper2(&v19, sel_init);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    v17 = v20[0];
    sub_249D8B81C();

    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    type metadata accessor for StickerComicShaderBase();
    swift_deallocPartialClassInstance();
  }
  return v6;
}

id sub_249D8A5FC()
{
  return sub_249D75EC4(type metadata accessor for StickerComicShaderBase);
}

uint64_t type metadata accessor for StickerComicShaderBase()
{
  return objc_opt_self();
}

id sub_249D8A638()
{
  return sub_249D75EC4(type metadata accessor for StickerComicOneInputShader);
}

uint64_t type metadata accessor for StickerComicOneInputShader()
{
  return objc_opt_self();
}

id sub_249D8A664()
{
  return sub_249D75EC4(type metadata accessor for StickerComicTwoInputShader);
}

uint64_t type metadata accessor for StickerComicTwoInputShader()
{
  return objc_opt_self();
}

id sub_249D8A690()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerComicSobelShader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicSobelShader()
{
  return objc_opt_self();
}

_QWORD *sub_249D8A6E0(void *a1, void *a2)
{
  uint64_t v2;
  _QWORD *v3;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  id v26;
  id v27;
  int v28;
  id v30;
  _QWORD v31[4];
  _QWORD v32[5];

  v3 = (_QWORD *)v2;
  v32[4] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = 0;
  __asm { FMOV            V8.2S, #1.0 }
  *(_QWORD *)(v2 + 64) = _D8;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 112) = xmmword_249D8D660;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  v11 = objc_allocWithZone(MEMORY[0x24BDDD6B8]);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v12 = objc_msgSend(v11, sel_init);
  v13 = (void *)sub_249D8B8B8();
  v14 = objc_msgSend(a2, sel_newFunctionWithName_, v13);

  objc_msgSend(v12, sel_setVertexFunction_, v14);
  swift_unknownObjectRelease();
  v15 = (void *)sub_249D8B8B8();
  v16 = objc_msgSend(a2, sel_newFunctionWithName_, v15);

  objc_msgSend(v12, sel_setFragmentFunction_, v16);
  swift_unknownObjectRelease();
  v17 = objc_msgSend(v12, sel_colorAttachments);
  v18 = objc_msgSend(v17, sel_objectAtIndexedSubscript_, 0);

  if (!v18)
    __break(1u);
  objc_msgSend(v18, sel_setPixelFormat_, v3[14]);

  v30 = 0;
  v19 = objc_msgSend(a1, sel_newRenderPipelineStateWithDescriptor_error_, v12, &v30);
  v20 = v19;
  v21 = v30;
  if (!v19)
  {
    v27 = v30;
    sub_249D8B81C();

LABEL_8:
    swift_willThrow();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v28 = 0;
    goto LABEL_9;
  }
  v3[13] = v19;
  v32[0] = 0x3F80000000000000;
  v32[1] = _D8;
  v32[2] = 0;
  v32[3] = 1065353216;
  v22 = v21;
  v23 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v32, 32, 0);
  if (!v23)
  {
    type metadata accessor for MTLCommandBufferError(0);
    sub_249D883F8(MEMORY[0x24BEE4AF8]);
    sub_249D7A31C();
    sub_249D8B804();
    goto LABEL_8;
  }
  v3[5] = v23;
  __asm { FMOV            V0.2S, #-1.0 }
  v31[0] = _D0;
  v31[1] = 0xBF8000003F800000;
  v31[2] = 0x3F800000BF800000;
  v31[3] = _D8;
  v25 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, v31, 32, 0);
  if (v25)
  {
    v26 = v25;

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v3[4] = v26;
    return v3;
  }
  type metadata accessor for MTLCommandBufferError(0);
  v28 = 1;
  sub_249D883F8(MEMORY[0x24BEE4AF8]);
  sub_249D7A31C();
  sub_249D8B804();
  swift_willThrow();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
LABEL_9:
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v28)
    swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v20)
    swift_unknownObjectRelease();
  type metadata accessor for StickerShaderStrokeGenerator();
  swift_deallocPartialClassInstance();
  return v3;
}

uint64_t sub_249D8AADC()
{
  uint64_t v0;

  v0 = sub_249D8B864();
  __swift_allocate_value_buffer(v0, qword_2578D4610);
  __swift_project_value_buffer(v0, (uint64_t)qword_2578D4610);
  return sub_249D8B858();
}

void sub_249D8AB5C(void *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  float v20;
  float v21;
  id v22;
  double v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  float v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  id v38;
  float v40[2];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(v1 + 56);
  if (!v2)
    return;
  v3 = *(void **)(v1 + 96);
  if (v3)
  {
    swift_unknownObjectRetain();
    if (objc_msgSend(v3, sel_width) == *(id *)(v1 + 72))
    {
      v4 = *(void **)(v1 + 96);
      if (v4)
      {
        if (objc_msgSend(v4, sel_height) == *(id *)(v1 + 80))
        {
          v5 = *(_QWORD *)(v1 + 96);
          if (v5)
            goto LABEL_7;
LABEL_15:
          swift_unknownObjectRelease();
          return;
        }
      }
    }
  }
  else
  {
    swift_unknownObjectRetain();
  }
  v9 = objc_msgSend((id)objc_opt_self(), sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), 0);
  objc_msgSend(v9, sel_setUsage_, 7);
  objc_msgSend(v9, sel_setStorageMode_, 2);
  v10 = objc_msgSend(*(id *)(v1 + 16), sel_newTextureWithDescriptor_, v9);

  *(_QWORD *)(v1 + 96) = v10;
  swift_unknownObjectRelease();
  v5 = *(_QWORD *)(v1 + 96);
  if (!v5)
    goto LABEL_15;
LABEL_7:
  v6 = *(void **)(v1 + 88);
  if (v6)
  {
    swift_unknownObjectRetain();
    if (objc_msgSend(v6, sel_width) == *(id *)(v1 + 72))
    {
      v7 = *(void **)(v1 + 88);
      if (v7)
      {
        if (objc_msgSend(v7, sel_height) == *(id *)(v1 + 80))
        {
          v8 = *(void **)(v1 + 88);
          if (!v8)
            goto LABEL_34;
          goto LABEL_18;
        }
      }
    }
  }
  else
  {
    swift_unknownObjectRetain();
  }
  v11 = objc_msgSend((id)objc_opt_self(), sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, *(_QWORD *)(v1 + 120), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), 0);
  objc_msgSend(v11, sel_setUsage_, 7);
  objc_msgSend(v11, sel_setStorageMode_, 2);
  v12 = objc_msgSend(*(id *)(v1 + 16), sel_newTextureWithDescriptor_, v11);

  *(_QWORD *)(v1 + 88) = v12;
  swift_unknownObjectRelease();
  v8 = *(void **)(v1 + 88);
  if (!v8)
  {
LABEL_34:
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return;
  }
LABEL_18:
  v13 = objc_msgSend((id)swift_unknownObjectRetain(), sel_width);
  v14 = objc_msgSend(v8, sel_height);
  if ((uint64_t)v14 <= (uint64_t)v13)
    v15 = (uint64_t)v13;
  else
    v15 = (uint64_t)v14;
  v16 = *(_QWORD *)(v1 + 16);
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDE3C0]), sel_initWithDevice_, v16);
  v18 = objc_msgSend(v2, sel_width);
  if (v18 != objc_msgSend(v8, sel_width) || (v19 = objc_msgSend(v2, sel_height), v19 != objc_msgSend(v8, sel_height)))
  {
    if (qword_2578D3C30 != -1)
      swift_once();
    v34 = sub_249D8B864();
    __swift_project_value_buffer(v34, (uint64_t)qword_2578D4610);
    v35 = sub_249D8B84C();
    v36 = sub_249D8B930();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_249D6E000, v35, v36, "Source texture size (maskTexture) does not match destination texture (distanceTexture)", v37, 2u);
      MEMORY[0x24BD03E5C](v37, -1, -1);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

      return;
    }

    swift_unknownObjectRelease();
    goto LABEL_34;
  }
  objc_msgSend(v17, sel_encodeToCommandBuffer_sourceTexture_destinationTexture_, a1, v2, v8);
  v20 = (float)v15;
  v21 = (float)(*(float *)(v1 + 52) * (float)v15) / 3.0349;
  v22 = objc_allocWithZone(MEMORY[0x24BDDE3C8]);
  *(float *)&v23 = v21;
  v38 = objc_msgSend(v22, sel_initWithDevice_sigma_, v16, v23);
  objc_msgSend(v38, sel_encodeToCommandBuffer_sourceTexture_destinationTexture_, a1, v8, v2);
  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDD690]), sel_init);
  v25 = objc_msgSend(v24, sel_colorAttachments);
  v26 = objc_msgSend(v25, sel_objectAtIndexedSubscript_, 0);

  if (!v26)
  {
    __break(1u);
    goto LABEL_37;
  }
  objc_msgSend(v26, sel_setClearColor_, 0.0, 0.0, 0.0, 0.0);

  v27 = objc_msgSend(v24, sel_colorAttachments);
  v28 = objc_msgSend(v27, sel_objectAtIndexedSubscript_, 0);

  if (!v28)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  objc_msgSend(v28, sel_setLoadAction_, 2);

  v29 = objc_msgSend(v24, sel_colorAttachments);
  v30 = objc_msgSend(v29, sel_objectAtIndexedSubscript_, 0);

  if (!v30)
  {
LABEL_38:
    __break(1u);
    return;
  }
  objc_msgSend(v30, sel_setTexture_, v5);

  v31 = objc_msgSend(a1, sel_renderCommandEncoderWithDescriptor_, v24);
  if (v31)
  {
    v32 = v31;
    v33 = *(float *)(v1 + 48) * v20;
    v40[0] = v33 + -1.0;
    v40[1] = v33;
    objc_msgSend(v31, sel_setRenderPipelineState_, *(_QWORD *)(v1 + 104));
    objc_msgSend(v32, sel_setVertexBuffer_offset_atIndex_, *(_QWORD *)(v1 + 32), 0, 0);
    objc_msgSend(v32, sel_setVertexBuffer_offset_atIndex_, *(_QWORD *)(v1 + 40), 0, 1);
    objc_msgSend(v32, sel_setFragmentTexture_atIndex_, v2, 0);
    objc_msgSend(v32, sel_setFragmentBytes_length_atIndex_, v40, 8, 0);
    objc_msgSend(v32, sel_drawPrimitives_vertexStart_vertexCount_, 4, 0, 4);
    objc_msgSend(v32, sel_endEncoding);
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

uint64_t sub_249D8B1C0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_249D8B214()
{
  sub_249D8B1C0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StickerShaderStrokeGenerator()
{
  return objc_opt_self();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_249D8B26C(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

float sub_249D8B2BC(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  _BYTE *v8;
  float v9;
  uint64_t v10;
  float v11;
  float v12;
  float *v13;
  float v14;
  float v15;
  _BYTE *v16;
  float *v17;

  v8 = (_BYTE *)(a1 + OBJC_IVAR____VKStickerEffectInternal_isStroked);
  swift_beginAccess();
  v9 = 0.0;
  if (*v8 == 1)
  {
    if (a3 <= a2)
      v10 = a2;
    else
      v10 = a3;
    v11 = fminf(fmaxf((float)((float)((float)v10 / a4) + -30.0) / 90.0, 0.0), 1.0);
    v12 = (float)(v11 * v11) * (float)((float)(v11 * -2.0) + 3.0);
    v13 = (float *)(a1 + OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier);
    swift_beginAccess();
    v14 = *v13;
    v15 = *v13 + (float)(v12 * (float)(1.0 - *v13));
    v16 = (_BYTE *)(a1 + OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier);
    swift_beginAccess();
    if (*v16)
      v15 = v14;
    v17 = (float *)(a1 + OBJC_IVAR____VKStickerEffectInternal_strokeRadius);
    swift_beginAccess();
    v9 = v15 * *v17;
    swift_beginAccess();
  }
  return v9;
}

uint64_t sub_249D8B440()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StickerShaderGenerator()
{
  return objc_opt_self();
}

char *sub_249D8B470(void *a1, void *a2)
{
  uint64_t v2;
  _QWORD *v8;

  *(_QWORD *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_mode) = 0;
  __asm { FMOV            V0.2D, #0.5 }
  *(_OWORD *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteCenter) = _Q0;
  v8 = (_QWORD *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteColor);
  *v8 = 0;
  v8[1] = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteStart) = 0x3FD3333333333333;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteEnd) = 0x3FE8000000000000;
  *(_DWORD *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_numLevels) = 1086324736;
  *(_DWORD *)(v2 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_numLevelsRecip) = 1042983595;
  return sub_249D8A344(a1, a2);
}

id sub_249D8B52C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  float32x2_t v4;
  float v5;
  float v6;
  int v7;
  int v8;
  int v10;
  float32x2_t v11;
  __int128 v12;
  float v13;
  float v14;
  int v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_mode);
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (v2 > 0x7FFFFFFF)
    goto LABEL_5;
  v3 = *(_OWORD *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteColor);
  v4 = vcvt_f32_f64(*(float64x2_t *)(v1
                                   + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteCenter));
  v5 = *(double *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteStart);
  v6 = *(double *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_vignetteEnd);
  v7 = *(_DWORD *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_numLevels);
  v8 = *(_DWORD *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_numLevelsRecip);
  v10 = *(_QWORD *)(v1 + OBJC_IVAR____TtC17VisionKitInternal37StickerComicVignetteAndQuantizeShader_mode);
  v11 = v4;
  v12 = v3;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  return objc_msgSend(a1, sel_setFragmentBytes_length_atIndex_, &v10, 48, 0);
}

id sub_249D8B61C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerComicVignetteAndQuantizeShader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicVignetteAndQuantizeShader()
{
  return objc_opt_self();
}

id sub_249D8B66C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  float v3;
  float v4;
  float v5;
  float32x2_t v7;
  float v8;
  float v9;
  int v10;
  float v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_mode);
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (v2 > 0x7FFFFFFF)
    goto LABEL_5;
  v3 = *(double *)(v1 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_threshold);
  v4 = *(double *)(v1 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_preThreshold);
  v5 = *(double *)(v1 + OBJC_IVAR____TtC17VisionKitInternal23StickerComicEdgesShader_sigma);
  v7 = vcvt_f32_f64(*(float64x2_t *)(v1 + OBJC_IVAR____TtC17VisionKitInternal22StickerComicShaderBase_size));
  v8 = v4;
  v9 = v3;
  v10 = v2;
  v11 = v5;
  return objc_msgSend(a1, sel_setFragmentBytes_length_atIndex_, &v7, 24, 0);
}

id sub_249D8B748()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerComicEdgesShader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StickerComicEdgesShader()
{
  return objc_opt_self();
}

uint64_t sub_249D8B798()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_249D8B7A4()
{
  return MEMORY[0x24BDCB910]();
}

uint64_t sub_249D8B7B0()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_249D8B7BC()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_249D8B7C8()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_249D8B7D4()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_249D8B7E0()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_249D8B7EC()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_249D8B7F8()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_249D8B804()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_249D8B810()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_249D8B81C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_249D8B828()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_249D8B834()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_249D8B840()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_249D8B84C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_249D8B858()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_249D8B864()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_249D8B870()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_249D8B87C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_249D8B888()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_249D8B894()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_249D8B8A0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_249D8B8AC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_249D8B8B8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_249D8B8C4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_249D8B8D0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_249D8B8DC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_249D8B8E8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_249D8B8F4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_249D8B900()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_249D8B90C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_249D8B918()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_249D8B924()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_249D8B930()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_249D8B93C()
{
  return MEMORY[0x24BEE79B8]();
}

uint64_t sub_249D8B948()
{
  return MEMORY[0x24BEE5CA8]();
}

uint64_t sub_249D8B954()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_249D8B960()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_249D8B96C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_249D8B978()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_249D8B984()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_249D8B990()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_249D8B99C()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_249D8B9A8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_249D8B9B4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_249D8B9C0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_249D8B9CC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_249D8B9D8()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_249D8B9E4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_249D8B9F0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_249D8B9FC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_249D8BA08()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_249D8BA14()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_249D8BA20()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_249D8BA2C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_249D8BA38()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_249D8BA44()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_249D8BA50()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_249D8BA5C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_249D8BA68()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_249D8BA74()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_249D8BA80()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_249D8BA8C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_249D8BA98()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_249D8BAA4()
{
  return MEMORY[0x24BEE4328]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC5180](buffer, key, value, *(_QWORD *)&attachmentMode);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x24BDC51F8](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x24BDC5200](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x24BDC5210](image);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x24BDC5318](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5320](allocator, pixelBufferPool, pixelBufferOut);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x24BEBE2B8]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x24BEBE2C0](context);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

