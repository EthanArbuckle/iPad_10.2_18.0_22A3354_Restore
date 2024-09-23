@implementation _OUCamera

- (_OUCamera)initWithDictionary:(id)a3
{
  id v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int128 v18;
  int v19;
  id v20;
  void *v21;
  float v22;
  void *v23;
  float v24;
  id v25;
  NSArray *v26;
  NSArray *v27;
  BOOL v28;
  void *v29;
  BOOL v30;
  int v32;
  __int128 v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_OUCamera;
  v5 = -[_OUCamera init](&v34, sel_init);
  if (!v5)
    goto LABEL_24;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intrinsic"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (!v7)
    goto LABEL_18;
  v8 = v7;
  if (objc_msgSend(v8, "count") != 3)
  {

LABEL_17:
    goto LABEL_18;
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    *(_QWORD *)&v33 = v14;
    objc_msgSend(v10, "objectAtIndexedSubscript:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v32 = v16;
    objc_msgSend(v11, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v18 = v33;
    DWORD1(v18) = v32;
    DWORD2(v18) = v19;
    *(_OWORD *)&v5[16 * i + 32] = v18;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image_resolution"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v20;
  else
    v8 = 0;

  if (!v8 || objc_msgSend(v8, "count") != 2)
    goto LABEL_17;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  *((double *)v5 + 1) = v22;

  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  *((double *)v5 + 2) = v24;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pose"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = (NSArray *)v25;
  else
    v26 = 0;

  if (v26)
  {
    v28 = float4x4FromNSArray(v26, (simd_float4x4 *)(v5 + 144));

    if (v28)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transform"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_cast<NSArray>(v29);
      v27 = (NSArray *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        goto LABEL_25;
      v30 = float4x4FromNSArray(v27, (simd_float4x4 *)(v5 + 80));

      if (v30)
      {
LABEL_24:
        v27 = v5;
        goto LABEL_25;
      }
    }
  }
LABEL_18:
  v27 = 0;
LABEL_25:

  return (_OUCamera *)v27;
}

- (__n128)transform
{
  return a1[5];
}

- (__n128)setTransform:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  return result;
}

- (__n128)intrinsics
{
  return a1[2];
}

- (__n128)setIntrinsics:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  return result;
}

- (CGSize)imageResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_imageResolution.width;
  height = self->_imageResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageResolution:(CGSize)a3
{
  self->_imageResolution = a3;
}

- (__n128)pose
{
  return a1[9];
}

- (__n128)setPose:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (__n128)initWithIntrinsic:(__n128)a3 transform:(__n128)a4
{
  _OUCamera *v8;
  __n128 result;
  objc_super v17;

  v17.receiver = a1;
  v17.super_class = (Class)_OUCamera;
  v8 = -[_OUCamera init](&v17, sel_init);
  if (v8)
  {
    *(__n128 *)v8->_anon_20 = a2;
    *(__n128 *)&v8->_anon_20[16] = a3;
    *(__n128 *)&v8->_anon_20[32] = a4;
    *(__n128 *)v8->_anon_50 = a5;
    *(__n128 *)&v8->_anon_50[16] = a6;
    *(__n128 *)&v8->_anon_50[32] = a7;
    result = a8;
    *(__n128 *)&v8->_anon_50[48] = a8;
  }
  return result;
}

@end
