@implementation VGSkeleton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[VGSkeleton skeletonType](self, "skeletonType"), CFSTR("skeletonType"));
  -[VGSkeleton skeletonDefinition](self, "skeletonDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("skeletonDefinition"));

  -[VGSkeleton localPoses](self, "localPoses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localPoses"));

  -[VGSkeleton modelPoses](self, "modelPoses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("modelPoses"));

  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", self->_anon_40, 64);
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("rootTransform"));
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &self[1], 64);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("floorAlignedRootTransform"));
  -[VGSkeleton jointConfidence](self, "jointConfidence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("jointConfidence"));

  -[VGSkeleton debugInfo](self, "debugInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("debugInfo"));

}

- (VGSkeleton)initWithCoder:(id)a3
{
  id v4;
  VGSkeleton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  VGSkeleton *v27;
  objc_super v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)VGSkeleton;
  v5 = -[VGSkeleton init](&v29, sel_init);
  if (v5)
  {
    -[VGSkeleton setSkeletonType:](v5, "setSkeletonType:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("skeletonType")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skeletonDefinition"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGSkeleton setSkeletonDefinition:](v5, "setSkeletonDefinition:", v6);

    v7 = (void *)MEMORY[0x24BDBCF20];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("localPoses"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGSkeleton setLocalPoses:](v5, "setLocalPoses:", v10);

    v11 = (void *)MEMORY[0x24BDBCF20];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("modelPoses"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGSkeleton setModelPoses:](v5, "setModelPoses:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rootTransform"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getBytes:length:", v5->_anon_40, 64);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("floorAlignedRootTransform"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getBytes:length:", &v5[1], 64);
    v17 = (void *)MEMORY[0x24BDBCF20];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("jointConfidence"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGSkeleton setJointConfidence:](v5, "setJointConfidence:", v20);

    v21 = (void *)MEMORY[0x24BDBCF20];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("debugInfo"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGSkeleton setDebugInfo:](v5, "setDebugInfo:", v26);

    v27 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float32x4_t *v5;
  void *v6;
  void *v7;
  void *v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  char v17;
  void *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (float32x4_t *)v4;
    if (-[VGSkeleton skeletonType](self, "skeletonType") == v5->i32[2])
    {
      -[VGSkeleton skeletonDefinition](self, "skeletonDefinition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v5[1].i64[0]))
      {
        -[VGSkeleton localPoses](self, "localPoses");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqual:", v5[1].i64[1]))
        {
          -[VGSkeleton modelPoses](self, "modelPoses");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isEqual:", v5[2].i64[0])
            && (-[VGSkeleton rootTransform](self, "rootTransform"),
                (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v9, v5[4]), (int8x16_t)vceqq_f32(v10, v5[5])), vandq_s8((int8x16_t)vceqq_f32(v11, v5[6]), (int8x16_t)vceqq_f32(v12, v5[7])))) & 0x80000000) != 0)&& (-[VGSkeleton floorAlignedRootTransform](self, "floorAlignedRootTransform"), (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v13, v5[8]), (int8x16_t)vceqq_f32(v14, v5[9])), vandq_s8((int8x16_t)vceqq_f32(v15, v5[10]), (int8x16_t)vceqq_f32(v16, v5[11])))) & 0x80000000) != 0))
          {
            -[VGSkeleton jointConfidence](self, "jointConfidence");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v19, "isEqual:", v5[2].i64[1]);

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (int)skeletonType
{
  return self->_skeletonType;
}

- (void)setSkeletonType:(int)a3
{
  self->_skeletonType = a3;
}

- (VGSkeletonDefinition)skeletonDefinition
{
  return self->_skeletonDefinition;
}

- (void)setSkeletonDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_skeletonDefinition, a3);
}

- (NSArray)localPoses
{
  return self->_localPoses;
}

- (void)setLocalPoses:(id)a3
{
  objc_storeStrong((id *)&self->_localPoses, a3);
}

- (NSArray)modelPoses
{
  return self->_modelPoses;
}

- (void)setModelPoses:(id)a3
{
  objc_storeStrong((id *)&self->_modelPoses, a3);
}

- (__n128)rootTransform
{
  return a1[4];
}

- (__n128)setRootTransform:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  result[7] = a5;
  return result;
}

- (__n128)floorAlignedRootTransform
{
  return a1[8];
}

- (__n128)setFloorAlignedRootTransform:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

- (NSArray)jointConfidence
{
  return self->_jointConfidence;
}

- (void)setJointConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_jointConfidence, a3);
}

- (NSDictionary)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_jointConfidence, 0);
  objc_storeStrong((id *)&self->_modelPoses, 0);
  objc_storeStrong((id *)&self->_localPoses, 0);
  objc_storeStrong((id *)&self->_skeletonDefinition, 0);
}

@end
