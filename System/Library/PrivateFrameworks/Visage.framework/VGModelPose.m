@implementation VGModelPose

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  VGModelPose *v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDBCE50];
  v4 = self + 1;
  v5 = a3;
  objc_msgSend(v3, "dataWithBytes:length:", v4, 64);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("modelPose"));

}

- (VGModelPose)initWithCoder:(id)a3
{
  id v4;
  VGModelPose *v5;
  void *v6;
  VGModelPose *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VGModelPose;
  v5 = -[VGModelPose init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelPose"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getBytes:length:", &v5[1], 64);
    v7 = v5;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float32x4_t *v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  unsigned int v10;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (float32x4_t *)v4;
    -[VGModelPose modelPose](self, "modelPose");
    v16 = v7;
    v17 = v6;
    v18 = v9;
    v19 = v8;
    v12 = v5[2];
    v13 = v5[1];
    v14 = v5[4];
    v15 = v5[3];

    v10 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v17, v13), (int8x16_t)vceqq_f32(v16, v12)), vandq_s8((int8x16_t)vceqq_f32(v19, v15), (int8x16_t)vceqq_f32(v18, v14)))) >> 31;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (__n128)modelPose
{
  return a1[1];
}

- (__n128)setModelPose:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  return result;
}

@end
