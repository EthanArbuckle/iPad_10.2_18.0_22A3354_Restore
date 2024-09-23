@implementation OU3DObject

- (__n64)dimensions
{
  int v2;
  __n64 result;
  NSArray *v4;
  char v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;

  v2 = objc_msgSend(a1, "hasBoxesDict:", CFSTR("rawdetection"));
  result.n64_u64[0] = 0;
  if (v2)
  {
    objc_msgSend(a1[3], "objectForKeyedSubscript:", CFSTR("rawdetection"), 0.0);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = box3dFromNSArray(v4, (box3d *)&v11);

    result.n64_u64[0] = 0;
    if ((v5 & 1) != 0)
    {
      v6 = vsubq_f32(v12, v13);
      v7 = vmulq_f32(v6, v6);
      v8 = vsubq_f32(v11, v12);
      v9 = vmulq_f32(v8, v8);
      LODWORD(v10) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).u32[0];
      result.n64_f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0]);
      result.n64_u32[1] = sqrtf(v10);
    }
  }
  return result;
}

- (double)transform
{
  int v2;
  float32x4_t v3;
  NSArray *v4;
  int v5;
  uint64_t i;
  uint64_t v7;
  float32x4_t v8;
  int32x4_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x4_t v12;
  float32x4_t v13;
  int32x4_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x4_t v17;
  float32x4_t v18;
  int32x4_t v19;
  int8x16_t v20;
  float32x4_t v21;
  float32x4_t v23[8];
  _OWORD v24[4];
  __int128 v25;

  v2 = objc_msgSend(a1, "hasBoxesDict:", CFSTR("rawdetection"));
  v3.i64[0] = 0;
  if (v2)
  {
    objc_msgSend(a1[3], "objectForKeyedSubscript:", CFSTR("rawdetection"), 0.0);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = box3dFromNSArray(v4, (box3d *)v23);

    v3 = 0uLL;
    if (v5)
    {
      for (i = 0; i != 8; ++i)
        v3 = vaddq_f32(v3, v23[i]);
      v7 = 0;
      v8 = vsubq_f32(v23[1], v23[2]);
      v9 = (int32x4_t)vmulq_f32(v8, v8);
      v9.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v9, 2), vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v9.i8, 1))).u32[0];
      v10 = vrsqrte_f32((float32x2_t)v9.u32[0]);
      v11 = vmul_f32(v10, vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(v10, v10)));
      v12 = vmulq_n_f32(v8, vmul_f32(v11, vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(v11, v11))).f32[0]);
      v13 = vsubq_f32(v23[4], v23[0]);
      v14 = (int32x4_t)vmulq_f32(v13, v13);
      v14.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v14, 2), vadd_f32(*(float32x2_t *)v14.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v14.i8, 1))).u32[0];
      v15 = vrsqrte_f32((float32x2_t)v14.u32[0]);
      v16 = vmul_f32(v15, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(v15, v15)));
      v17.i64[0] = 0x3E0000003E000000;
      v17.i64[1] = 0x3E0000003E000000;
      v18 = vmulq_n_f32(v13, vmul_f32(v16, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(v16, v16))).f32[0]);
      v19 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v12, (int32x4_t)v12), (int8x16_t)v12, 0xCuLL), vnegq_f32(v18)), v12, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v18, (int32x4_t)v18), (int8x16_t)v18, 0xCuLL));
      v20 = vextq_s8((int8x16_t)vuzp1q_s32(v19, v19), (int8x16_t)v19, 0xCuLL);
      v12.i32[3] = 0;
      v20.i32[3] = 0;
      v18.i32[3] = 0;
      v21 = vmulq_f32(v3, v17);
      v21.i32[3] = 1.0;
      v24[0] = v12;
      v24[1] = v20;
      v24[2] = v18;
      v24[3] = xmmword_229560490;
      do
      {
        *(__int128 *)((char *)&v25 + v7 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_2295604A0, COERCE_FLOAT(v24[v7])), (float32x4_t)xmmword_2295604B0, *(float32x2_t *)&v24[v7], 1), (float32x4_t)xmmword_2295604C0, (float32x4_t)v24[v7], 2), v21, (float32x4_t)v24[v7], 3);
        ++v7;
      }
      while (v7 != 4);
      v3.i64[0] = v25;
    }
  }
  return *(double *)v3.i64;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 56), self->type);
  objc_storeStrong((id *)(v4 + 64), self->identifier);
  objc_storeStrong((id *)(v4 + 72), self->parent_id);
  *(float *)(v4 + 52) = self->confidence;
  v5 = -[NSArray copy](self->logits, "copy");
  v6 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v5;

  v7 = -[NSArray copy](self->embedding2d, "copy");
  v8 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v7;

  v9 = -[NSArray copy](self->embedding3d, "copy");
  v10 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v9;

  objc_storeStrong((id *)(v4 + 104), self->corners_status);
  objc_storeStrong((id *)(v4 + 112), self->edges_status);
  *(_OWORD *)(v4 + 144) = *(_OWORD *)self->color;
  v11 = -[NSMutableDictionary mutableCopy](self->_groups, "mutableCopy");
  v12 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v11;

  v13 = -[NSMutableDictionary mutableCopy](self->_parts, "mutableCopy");
  v14 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v13;

  v15 = -[NSMutableDictionary mutableCopy](self->_boxesDict, "mutableCopy");
  v16 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v15;

  *(_BYTE *)(v4 + 48) = self->status;
  objc_storeStrong((id *)(v4 + 128), self->detection_source);
  objc_storeStrong((id *)(v4 + 136), self->cadModelName);
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OU3DObject)initWithCoder:(id)a3
{
  id v4;
  OU3DObject *v5;
  uint64_t v6;
  NSString *type;
  uint64_t v8;
  NSString *detection_source;
  uint64_t v10;
  NSUUID *identifier;
  uint64_t v12;
  NSUUID *parent_id;
  float v14;
  uint64_t v15;
  NSArray *logits;
  uint64_t v17;
  NSArray *embedding2d;
  uint64_t v19;
  NSArray *embedding3d;
  uint64_t v21;
  NSArray *corners_status;
  uint64_t v23;
  NSArray *edges_status;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSMutableDictionary *groups;
  void *v38;
  void *v39;
  uint64_t v40;
  NSMutableDictionary *parts;
  void *v42;
  void *v43;
  uint64_t v44;
  NSMutableDictionary *boxesDict;
  uint64_t v46;
  NSString *cadModelName;
  OU3DObject *v48;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)OU3DObject;
  v5 = -[OU3DObject init](&v50, sel_init);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v6 = objc_claimAutoreleasedReturnValue();
  type = v5->type;
  v5->type = (NSString *)v6;

  if ((isValidType(v5->type) & 1) != 0
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detectionsource")),
        v8 = objc_claimAutoreleasedReturnValue(),
        detection_source = v5->detection_source,
        v5->detection_source = (NSString *)v8,
        detection_source,
        isValidODSourceType(v5->detection_source)))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->identifier;
    v5->identifier = (NSUUID *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parent_id"));
    v12 = objc_claimAutoreleasedReturnValue();
    parent_id = v5->parent_id;
    v5->parent_id = (NSUUID *)v12;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("confidence"));
    v5->confidence = v14;
    v5->status = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logits"));
    v15 = objc_claimAutoreleasedReturnValue();
    logits = v5->logits;
    v5->logits = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("embedding2d"));
    v17 = objc_claimAutoreleasedReturnValue();
    embedding2d = v5->embedding2d;
    v5->embedding2d = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("embedding3d"));
    v19 = objc_claimAutoreleasedReturnValue();
    embedding3d = v5->embedding3d;
    v5->embedding3d = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("corners_status"));
    v21 = objc_claimAutoreleasedReturnValue();
    corners_status = v5->corners_status;
    v5->corners_status = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("edges_status"));
    v23 = objc_claimAutoreleasedReturnValue();
    edges_status = v5->edges_status;
    v5->edges_status = (NSArray *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_OWORD *)v5->color = *(_OWORD *)objc_msgSend(v25, "bytes");
    v26 = (void *)MEMORY[0x24BDBCF20];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x24BDBCF20];
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, v31, v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("groups"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "mutableCopy");

    v36 = objc_msgSend(v35, "mutableCopy");
    groups = v5->_groups;
    v5->_groups = (NSMutableDictionary *)v36;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("parts"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "mutableCopy");

    v40 = objc_msgSend(v39, "mutableCopy");
    parts = v5->_parts;
    v5->_parts = (NSMutableDictionary *)v40;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("boxes_dict"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "mutableCopy");

    v44 = objc_msgSend(v43, "mutableCopy");
    boxesDict = v5->_boxesDict;
    v5->_boxesDict = (NSMutableDictionary *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cadmodelname"));
    v46 = objc_claimAutoreleasedReturnValue();
    cadModelName = v5->cadModelName;
    v5->cadModelName = (NSString *)v46;

    v48 = v5;
  }
  else
  {
    v48 = 0;
  }

  return v48;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->type, CFSTR("type"));
  objc_msgSend(v6, "encodeObject:forKey:", self->detection_source, CFSTR("detectionsource"));
  objc_msgSend(v6, "encodeObject:forKey:", self->identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->parent_id, CFSTR("parent_id"));
  *(float *)&v4 = self->confidence;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("confidence"), v4);
  objc_msgSend(v6, "encodeObject:forKey:", self->logits, CFSTR("logits"));
  objc_msgSend(v6, "encodeObject:forKey:", self->embedding2d, CFSTR("embedding2d"));
  objc_msgSend(v6, "encodeObject:forKey:", self->embedding3d, CFSTR("embedding3d"));
  objc_msgSend(v6, "encodeObject:forKey:", self->corners_status, CFSTR("corners_status"));
  objc_msgSend(v6, "encodeObject:forKey:", self->edges_status, CFSTR("edges_status"));
  objc_msgSend(v6, "encodeBool:forKey:", self->status, CFSTR("status"));
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", self->color, 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("color"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_groups, CFSTR("groups"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_parts, CFSTR("parts"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_boxesDict, CFSTR("boxes_dict"));
  objc_msgSend(v6, "encodeObject:forKey:", self->cadModelName, CFSTR("cadmodelname"));

}

- (BOOL)hasBoxesDict:(id)a3
{
  id v4;
  NSMutableDictionary *boxesDict;
  void *v6;
  char v7;

  v4 = a3;
  boxesDict = self->_boxesDict;
  if (boxesDict)
  {
    -[NSMutableDictionary allKeys](boxesDict, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)getDimension:(id)a3 dim:
{
  float32x4_t *v3;
  float32x4_t *v4;
  id v6;
  NSArray *v7;
  int v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;

  v4 = v3;
  v6 = a3;
  if (-[OU3DObject hasBoxesDict:](self, "hasBoxesDict:", v6))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_boxesDict, "objectForKeyedSubscript:", v6);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = box3dFromNSArray(v7, (box3d *)&v17);

    if (v8)
    {
      v9 = vsubq_f32(v18, v19);
      v10 = vmulq_f32(v9, v9);
      v11 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1)));
      v12 = vsubq_f32(v17, v18);
      v13 = vmulq_f32(v12, v12);
      v11.f32[0] = sqrtf(v11.f32[0]);
      v14 = vsubq_f32(v17, v20);
      v15 = vmulq_f32(v14, v14);
      v11.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).f32[0]);
      v11.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0]);
      *v4 = v11;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
    *v4 = 0u;
  }

  return v8;
}

- (BOOL)getTransform:(id)a3 transform:(id *)a4
{
  id v6;
  NSArray *v7;
  int v8;
  uint64_t v9;
  float32x4_t v10;
  uint64_t v11;
  float32x4_t v12;
  int32x4_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x4_t v16;
  float32x4_t v17;
  int32x4_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x4_t v21;
  float32x4_t v22;
  int32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  _OWORD v35[4];
  _OWORD v36[4];

  v6 = a3;
  if (-[OU3DObject hasBoxesDict:](self, "hasBoxesDict:", v6))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_boxesDict, "objectForKeyedSubscript:", v6);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = box3dFromNSArray(v7, (box3d *)&v31);

    if (v8)
    {
      v9 = 0;
      v10 = 0uLL;
      do
      {
        v10 = vaddq_f32(v10, *(float32x4_t *)((char *)&v31 + v9));
        v9 += 16;
      }
      while (v9 != 128);
      v11 = 0;
      v12 = vsubq_f32(v32, v33);
      v13 = (int32x4_t)vmulq_f32(v12, v12);
      v13.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v13, 2), vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.i8, 1))).u32[0];
      v14 = vrsqrte_f32((float32x2_t)v13.u32[0]);
      v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v14, v14)));
      v16 = vmulq_n_f32(v12, vmul_f32(v15, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v15, v15))).f32[0]);
      v17 = vsubq_f32(v31, v32);
      v18 = (int32x4_t)vmulq_f32(v17, v17);
      v18.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v18, 2), vadd_f32(*(float32x2_t *)v18.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v18.i8, 1))).u32[0];
      v19 = vrsqrte_f32((float32x2_t)v18.u32[0]);
      v20 = vmul_f32(v19, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v19, v19)));
      v21 = vmulq_n_f32(v17, vmul_f32(v20, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v20, v20))).f32[0]);
      v22 = vsubq_f32(v34, v31);
      v23 = (int32x4_t)vmulq_f32(v22, v22);
      v23.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v23, 2), vadd_f32(*(float32x2_t *)v23.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v23.i8, 1))).u32[0];
      *(float32x2_t *)v18.i8 = vrsqrte_f32((float32x2_t)v23.u32[0]);
      *(float32x2_t *)v18.i8 = vmul_f32(*(float32x2_t *)v18.i8, vrsqrts_f32((float32x2_t)v23.u32[0], vmul_f32(*(float32x2_t *)v18.i8, *(float32x2_t *)v18.i8)));
      v24.i64[0] = 0x3E0000003E000000;
      v24.i64[1] = 0x3E0000003E000000;
      v25 = vmulq_n_f32(v22, vmul_f32(*(float32x2_t *)v18.i8, vrsqrts_f32((float32x2_t)v23.u32[0], vmul_f32(*(float32x2_t *)v18.i8, *(float32x2_t *)v18.i8))).f32[0]);
      v16.i32[3] = 0;
      v21.i32[3] = 0;
      v25.i32[3] = 0;
      v26 = vmulq_f32(v10, v24);
      v26.i32[3] = 1.0;
      v35[0] = v16;
      v35[1] = v21;
      v35[2] = v25;
      v35[3] = xmmword_229560490;
      do
      {
        v36[v11] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_2295604A0, COERCE_FLOAT(v35[v11])), (float32x4_t)xmmword_2295604B0, *(float32x2_t *)&v35[v11], 1), (float32x4_t)xmmword_2295604C0, (float32x4_t)v35[v11], 2), v26, (float32x4_t)v35[v11], 3);
        ++v11;
      }
      while (v11 != 4);
      v27 = v36[1];
      v28 = v36[2];
      v29 = v36[3];
      *(_OWORD *)a4 = v36[0];
      *((_OWORD *)a4 + 1) = v27;
      *((_OWORD *)a4 + 2) = v28;
      *((_OWORD *)a4 + 3) = v29;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSUUID *parent_id;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->type, CFSTR("type"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->detection_source, CFSTR("detectionsource"));
  -[NSUUID UUIDString](self->identifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("identifier"));

  parent_id = self->parent_id;
  if (parent_id)
  {
    -[NSUUID UUIDString](self->parent_id, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("parent_id"));
  if (parent_id)

  *(float *)&v7 = self->confidence;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("confidence"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->logits, CFSTR("logits"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->embedding2d, CFSTR("embedding2d"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->embedding3d, CFSTR("embedding3d"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->corners_status, CFSTR("corners_status"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->edges_status, CFSTR("edges_status"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->status);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("status"));

  v18 = *(_OWORD *)self->color;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  HIDWORD(v11) = DWORD1(v18);
  LODWORD(v11) = DWORD1(v18);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v18), DWORD2(v18))));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v18), HIDWORD(v18))));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("color"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_groups, CFSTR("groups"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_parts, CFSTR("parts"));
  if (-[NSMutableDictionary count](self->_boxesDict, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_boxesDict, CFSTR("boxes_dict"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->cadModelName, CFSTR("cadmodelname"));
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (OU3DObject)init
{
  OU3DObject *v2;
  uint64_t v3;
  NSMutableDictionary *groups;
  uint64_t v5;
  NSMutableDictionary *parts;
  uint64_t v7;
  NSMutableDictionary *boxesDict;
  NSMutableArray *v9;
  NSMutableArray *corners_history;
  NSMutableArray *v11;
  NSMutableArray *refined_box_history;
  int v13;
  OU3DObjectCorner *v14;
  NSString *cadModelName;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)OU3DObject;
  v2 = -[OU3DObject init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    groups = v2->_groups;
    v2->_groups = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    parts = v2->_parts;
    v2->_parts = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    boxesDict = v2->_boxesDict;
    v2->_boxesDict = (NSMutableDictionary *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    corners_history = v2->_corners_history;
    v2->_corners_history = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    refined_box_history = v2->_refined_box_history;
    v2->_refined_box_history = v11;

    v13 = 8;
    do
    {
      v14 = objc_alloc_init(OU3DObjectCorner);
      -[NSMutableArray addObject:](v2->_corners_history, "addObject:", v14);

      --v13;
    }
    while (v13);
    cadModelName = v2->cadModelName;
    v2->cadModelName = 0;

  }
  return v2;
}

- (OU3DObject)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  OU3DObject *v5;
  OU3DObject *v6;
  id v7;
  NSString *v8;
  NSString *type;
  NSString *v10;
  char valid;
  id v12;
  NSString *v13;
  NSString *detection_source;
  NSString *v15;
  char v16;
  void *v17;
  uint64_t v18;
  NSUUID *identifier;
  void *v20;
  uint64_t v21;
  NSUUID *parent_id;
  id v23;
  id v24;
  void *v25;
  void *v26;
  float v27;
  void *v28;
  uint64_t v29;
  NSArray *logits;
  uint64_t v31;
  NSArray *v32;
  void *v33;
  uint64_t v34;
  NSArray *embedding2d;
  uint64_t v36;
  NSArray *v37;
  void *v38;
  uint64_t v39;
  NSArray *embedding3d;
  uint64_t v41;
  NSArray *v42;
  void *v43;
  uint64_t v44;
  NSArray *corners_status;
  uint64_t v46;
  NSArray *v47;
  void *v48;
  uint64_t v49;
  NSArray *edges_status;
  uint64_t v51;
  NSArray *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSMutableDictionary *groups;
  uint64_t v58;
  NSMutableDictionary *v59;
  void *v60;
  uint64_t v61;
  NSMutableDictionary *parts;
  uint64_t v63;
  NSMutableDictionary *v64;
  void *v65;
  uint64_t v66;
  NSMutableDictionary *boxesDict;
  uint64_t v68;
  NSMutableDictionary *v69;
  void *v70;
  uint64_t v71;
  NSString *cadModelName;
  OU3DObject *v73;
  objc_super v75;

  v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)OU3DObject;
  v5 = -[OU3DObject init](&v75, sel_init);
  v6 = v5;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = (NSString *)v7;
  else
    v8 = 0;

  if (!v8)
    goto LABEL_39;
  type = v5->type;
  v5->type = v8;
  v10 = v8;

  valid = isValidType(v5->type);
  if ((valid & 1) == 0)
    goto LABEL_39;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detectionsource"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = (objc_opt_isKindOfClass() & 1) != 0 ? (NSString *)v12 : 0;

  if (!v13)
    goto LABEL_39;
  detection_source = v5->detection_source;
  v5->detection_source = v13;
  v15 = v13;

  v16 = isValidODSourceType(v5->detection_source);
  if ((v16 & 1) == 0)
    goto LABEL_39;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_39;
  v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v17);
  identifier = v5->identifier;
  v5->identifier = (NSUUID *)v18;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parent_id"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v20);
    parent_id = v5->parent_id;
    v5->parent_id = (NSUUID *)v21;
  }
  else
  {
    parent_id = v5->parent_id;
    v5->parent_id = 0;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v24 = (objc_opt_isKindOfClass() & 1) != 0 ? v23 : 0;

  if (!v24)
    goto LABEL_39;
  v5->status = objc_msgSend(v24, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidence"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_cast<NSNumber>(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v26, "floatValue");
    v5->confidence = v27;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logits"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_cast<NSArray<NSNumber *>>(v28);
    v29 = objc_claimAutoreleasedReturnValue();
    logits = v5->logits;
    v5->logits = (NSArray *)v29;

    if (!v5->logits)
    {
      v31 = objc_opt_new();
      v32 = v5->logits;
      v5->logits = (NSArray *)v31;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("embedding2d"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_cast<NSArray<NSArray*<NSNumber *>>>(v33);
    v34 = objc_claimAutoreleasedReturnValue();
    embedding2d = v5->embedding2d;
    v5->embedding2d = (NSArray *)v34;

    if (!v5->embedding2d)
    {
      v36 = objc_opt_new();
      v37 = v5->embedding2d;
      v5->embedding2d = (NSArray *)v36;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("embedding3d"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_cast<NSArray<NSNumber *>>(v38);
    v39 = objc_claimAutoreleasedReturnValue();
    embedding3d = v5->embedding3d;
    v5->embedding3d = (NSArray *)v39;

    if (!v5->embedding3d)
    {
      v41 = objc_opt_new();
      v42 = v5->embedding3d;
      v5->embedding3d = (NSArray *)v41;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("corners_status"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_cast<NSArray<NSNumber *>>(v43);
    v44 = objc_claimAutoreleasedReturnValue();
    corners_status = v5->corners_status;
    v5->corners_status = (NSArray *)v44;

    if (!v5->corners_status)
    {
      v46 = objc_opt_new();
      v47 = v5->corners_status;
      v5->corners_status = (NSArray *)v46;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("edges_status"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_cast<NSArray<NSNumber *>>(v48);
    v49 = objc_claimAutoreleasedReturnValue();
    edges_status = v5->edges_status;
    v5->edges_status = (NSArray *)v49;

    if (!v5->edges_status)
    {
      v51 = objc_opt_new();
      v52 = v5->edges_status;
      v5->edges_status = (NSArray *)v51;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("color"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_cast<NSArray>(v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
      float4FromNSArray(v54, v5->color);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groups"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_cast<NSMutableDictionary>(v55);
    v56 = objc_claimAutoreleasedReturnValue();
    groups = v5->_groups;
    v5->_groups = (NSMutableDictionary *)v56;

    if (!v5->_groups)
    {
      v58 = objc_opt_new();
      v59 = v5->_groups;
      v5->_groups = (NSMutableDictionary *)v58;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parts"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_cast<NSMutableDictionary>(v60);
    v61 = objc_claimAutoreleasedReturnValue();
    parts = v5->_parts;
    v5->_parts = (NSMutableDictionary *)v61;

    if (!v5->_parts)
    {
      v63 = objc_opt_new();
      v64 = v5->_parts;
      v5->_parts = (NSMutableDictionary *)v63;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("boxes_dict"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_cast<NSMutableDictionary>(v65);
    v66 = objc_claimAutoreleasedReturnValue();
    boxesDict = v5->_boxesDict;
    v5->_boxesDict = (NSMutableDictionary *)v66;

    if (!v5->_boxesDict)
    {
      v68 = objc_opt_new();
      v69 = v5->_boxesDict;
      v5->_boxesDict = (NSMutableDictionary *)v68;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cadmodelname"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_cast<NSString>(v70);
    v71 = objc_claimAutoreleasedReturnValue();
    cadModelName = v5->cadModelName;
    v5->cadModelName = (NSString *)v71;

    v73 = v5;
  }
  else
  {
LABEL_39:
    v73 = 0;
  }

  return v73;
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;
  float32x4_t v6;
  void *v7;
  float32x4_t v9;
  __int128 v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  __int128 v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[OU3DObject getTransform:transform:](self, "getTransform:transform:", CFSTR("rawdetection"), &v15);
  v9 = v15;
  v11 = v16;
  v12 = v18;
  v13 = v17;
  v14 = 0uLL;
  -[OU3DObject getDimension:dim:](self, "getDimension:dim:", CFSTR("rawdetection"), &v14);
  v10 = v14;
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NSUUID UUIDString](self->identifier, "UUIDString");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "UTF8String");
  v6 = vaddq_f32(v12, vmlaq_f32(vmlaq_f32(vmulq_f32(v9, (float32x4_t)0), (float32x4_t)0, v11), (float32x4_t)0, v13));
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<OU3DObject> [id=%s conf=%0.2f] %@ { position = < %.2f , %.2f , %.2f > dimension = < %.2f x %.2f x %.2f > color = < r=%.2f , g=%.2f , b=%.2f , a=%.2f > }"), v5, self->confidence, self->type, v6.f32[0], v6.f32[1], v6.f32[2], *(float *)&v10, *((float *)&v10 + 1), *((float *)&v10 + 2), *(float *)self->color, *(float *)&self->color[4], *(float *)&self->color[8], *(float *)&self->color[12]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addGroupId:(int)a3 forGroupType:(id)a4
{
  uint64_t v4;
  void *v6;
  NSString *v7;

  v4 = *(_QWORD *)&a3;
  v7 = (NSString *)a4;
  if (isValidGroupType(v7))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groups, "setObject:forKeyedSubscript:", v6, v7);

  }
}

- (void)addBoxesDict:(const box3d *)a3 forDictKey:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[9];

  v16[8] = *MEMORY[0x24BDAC8D0];
  v15 = a4;
  float3ToNSArray(*(__n128 *)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  float3ToNSArray(*((__n128 *)a3 + 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  float3ToNSArray(*((__n128 *)a3 + 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  float3ToNSArray(*((__n128 *)a3 + 3));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v9;
  float3ToNSArray(*((__n128 *)a3 + 4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v10;
  float3ToNSArray(*((__n128 *)a3 + 5));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v11;
  float3ToNSArray(*((__n128 *)a3 + 6));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v12;
  float3ToNSArray(*((__n128 *)a3 + 7));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_boxesDict, "setObject:forKeyedSubscript:", v14, v15);
}

- (void)addObjectPartAttribute:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parts, "setObject:forKeyedSubscript:", v4, v5);

}

- (void)removeObjectPartAttribute:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_parts, "removeObjectForKey:", a3);
}

- (void)addRefinedBoxToHistory:(id)a3
{
  -[NSMutableArray addObject:](self->_refined_box_history, "addObject:", a3);
}

- (void)updateObjectEmbedding2d:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t i;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  NSArray *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSArray *embedding2d;

  v4 = a3;
  if (!-[NSArray count](self->embedding2d, "count"))
  {
    v8 = (void *)objc_opt_new();
    v20 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v8, "addObject:", v20);

    v21 = (NSArray *)objc_msgSend(v8, "copy");
LABEL_14:
    embedding2d = self->embedding2d;
    self->embedding2d = v21;

    goto LABEL_15;
  }
  -[NSArray objectAtIndexedSubscript:](self->embedding2d, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "count");

  if (v6 == v7)
  {
    v8 = (void *)-[NSArray mutableCopy](self->embedding2d, "mutableCopy");
    for (i = 0; objc_msgSend(v4, "count") > i; ++i)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v13 = v12;

      objc_msgSend(v4, "objectAtIndex:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v16 = v15;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 >= v16)
        *(float *)&v18 = v13;
      else
        *(float *)&v18 = v16;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "replaceObjectAtIndex:withObject:", i, v19);

    }
    v21 = (NSArray *)objc_msgSend(v8, "copy");
    goto LABEL_14;
  }
  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[OU3DObject updateObjectEmbedding2d:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

LABEL_15:
}

- (void)updateObjectEmbedding3d:(id)a3
{
  id v4;
  NSUInteger v5;
  NSArray *v6;
  NSArray *embedding3d;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  if (-[NSArray count](self->embedding3d, "count")
    && (v5 = -[NSArray count](self->embedding3d, "count"), v5 != objc_msgSend(v4, "count")))
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[OU3DObject updateObjectEmbedding3d:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  else
  {
    v6 = (NSArray *)objc_msgSend(v4, "mutableCopy");
    embedding3d = self->embedding3d;
    self->embedding3d = v6;

  }
}

- (int)getFrameIndexOfLastRefine
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!-[NSMutableArray count](self->_refined_box_history, "count"))
    return -1;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableArray reverseObjectEnumerator](self->_refined_box_history, "reverseObjectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "refinedBox");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v7, "refinedBox");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "count") == 8;

          if (v10)
          {
            v11 = objc_msgSend(v7, "frameIndex");
            goto LABEL_14;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = -1;
LABEL_14:

  return v11;
}

- (void)removeBoxesDict:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_boxesDict, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[NSMutableDictionary removeObjectForKey:](self->_boxesDict, "removeObjectForKey:", v5);

}

- (void)clearGroupInfo:(id)a3
{
  NSString *v4;

  v4 = (NSString *)a3;
  if (isValidGroupType(v4))
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groups, "setObject:forKeyedSubscript:", 0, v4);

}

- (NSString)type
{
  return self->type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->type, a3);
}

- (NSUUID)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->identifier, a3);
}

- (NSUUID)parent_id
{
  return self->parent_id;
}

- (void)setParent_id:(id)a3
{
  objc_storeStrong((id *)&self->parent_id, a3);
}

- (float)confidence
{
  return self->confidence;
}

- (void)setConfidence:(float)a3
{
  self->confidence = a3;
}

- (NSArray)logits
{
  return self->logits;
}

- (void)setLogits:(id)a3
{
  objc_storeStrong((id *)&self->logits, a3);
}

- (NSArray)embedding2d
{
  return self->embedding2d;
}

- (void)setEmbedding2d:(id)a3
{
  objc_storeStrong((id *)&self->embedding2d, a3);
}

- (NSArray)embedding3d
{
  return self->embedding3d;
}

- (void)setEmbedding3d:(id)a3
{
  objc_storeStrong((id *)&self->embedding3d, a3);
}

- (NSArray)corners_status
{
  return self->corners_status;
}

- (void)setCorners_status:(id)a3
{
  objc_storeStrong((id *)&self->corners_status, a3);
}

- (NSArray)edges_status
{
  return self->edges_status;
}

- (void)setEdges_status:(id)a3
{
  objc_storeStrong((id *)&self->edges_status, a3);
}

- (NSArray)faces_status
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFaces_status:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (__n128)color
{
  return a1[9];
}

- (void)setColor:(OU3DObject *)self
{
  __int128 v2;

  *(_OWORD *)self->color = v2;
}

- (BOOL)status
{
  return self->status;
}

- (void)setStatus:(BOOL)a3
{
  self->status = a3;
}

- (NSString)detection_source
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDetection_source:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)cadModelName
{
  return self->cadModelName;
}

- (void)setCadModelName:(id)a3
{
  objc_storeStrong((id *)&self->cadModelName, a3);
}

- (NSDictionary)parts
{
  return &self->_parts->super;
}

- (void)setParts:(id)a3
{
  objc_storeStrong((id *)&self->_parts, a3);
}

- (NSDictionary)groups
{
  return &self->_groups->super;
}

- (NSDictionary)boxesDict
{
  return &self->_boxesDict->super;
}

- (NSArray)corners_history
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCorners_history:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)refined_box_history
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRefined_box_history:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cadModelName, 0);
  objc_storeStrong((id *)&self->detection_source, 0);
  objc_storeStrong((id *)&self->faces_status, 0);
  objc_storeStrong((id *)&self->edges_status, 0);
  objc_storeStrong((id *)&self->corners_status, 0);
  objc_storeStrong((id *)&self->embedding3d, 0);
  objc_storeStrong((id *)&self->embedding2d, 0);
  objc_storeStrong((id *)&self->logits, 0);
  objc_storeStrong((id *)&self->parent_id, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->type, 0);
  objc_storeStrong((id *)&self->_refined_box_history, 0);
  objc_storeStrong((id *)&self->_corners_history, 0);
  objc_storeStrong((id *)&self->_boxesDict, 0);
  objc_storeStrong((id *)&self->_parts, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

- (BOOL)runIsValidType:(id)a3
{
  return isValidType((NSString *)a3);
}

- (void)updateObjectEmbedding2d:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2294C8000, a1, a3, "The 2d object embedding has inconsistent dimensions.", a5, a6, a7, a8, 0);
}

- (void)updateObjectEmbedding3d:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2294C8000, a1, a3, "The 3d object embedding has inconsistent dimensions.", a5, a6, a7, a8, 0);
}

@end
