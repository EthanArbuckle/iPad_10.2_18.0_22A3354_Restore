@implementation PXGFloatValuesColorLookupCube

- (PXGFloatValuesColorLookupCube)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGColorLookupCube.m"), 45, CFSTR("%s is not available as initializer"), "-[PXGFloatValuesColorLookupCube init]");

  abort();
}

- (PXGFloatValuesColorLookupCube)initWithEdgeSize:(int64_t)a3 colorValuesData:(const float *)a4 length:(unint64_t)a5 identifier:(id)a6
{
  id v11;
  PXGFloatValuesColorLookupCube *v12;
  PXGFloatValuesColorLookupCube *v13;
  float *v14;
  objc_super v16;

  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PXGFloatValuesColorLookupCube;
  v12 = -[PXGFloatValuesColorLookupCube init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    -[PXGColorLookupCube setEdgeSize:](v12, "setEdgeSize:", a3);
    v14 = (float *)malloc_type_malloc(4 * a5, 0xF58F3ED2uLL);
    v13->_colorValuesData = v14;
    memcpy(v14, a4, 4 * a5);
    v13->_length = a5;
    objc_storeStrong((id *)&v13->_identifier, a6);
  }

  return v13;
}

- (PXGFloatValuesColorLookupCube)initWithData:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v8;
  PXGFloatValuesColorLookupCube *v9;
  void *v10;
  uint64_t v11;
  PXGFloatValuesColorLookupCube *v12;
  _QWORD v14[5];
  _QWORD v15[4];
  PXGFloatValuesColorLookupCube *v16;
  objc_super v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  if (a4)
  {
    if (a4 != 1)
      goto LABEL_7;
    v17.receiver = self;
    v17.super_class = (Class)PXGFloatValuesColorLookupCube;
    v9 = -[PXGFloatValuesColorLookupCube init](&v17, sel_init);
    v10 = (void *)objc_opt_class();
    v11 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __59__PXGFloatValuesColorLookupCube_initWithData_format_error___block_invoke;
    v15[3] = &unk_251A6E210;
    a4 = v9;
    v16 = (PXGFloatValuesColorLookupCube *)a4;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __59__PXGFloatValuesColorLookupCube_initWithData_format_error___block_invoke_2;
    v14[3] = &unk_251A6E238;
    v14[4] = &v18;
    if ((objc_msgSend(v10, "_parseLUTData:resultHandler:errorHandler:", v8, v15, v14) & 1) == 0)
    {

      a4 = 0;
    }
    self = v16;
  }

  self = (PXGFloatValuesColorLookupCube *)a4;
LABEL_7:
  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v12 = self;
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (PXGFloatValuesColorLookupCube)initWithContentsOfURL:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  void *v10;
  PXGFloatValuesColorLookupCube *v11;

  v8 = (objc_class *)MEMORY[0x24BDBCE50];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithContentsOfURL:options:error:", v9, 1, a5);

  if (v10)
  {
    v11 = -[PXGFloatValuesColorLookupCube initWithData:format:error:](self, "initWithData:format:error:", v10, a4, a5);
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (PXGFloatValuesColorLookupCube)initWithContentsOfURL:(id)a3 usedFormat:(int64_t *)a4 error:(id *)a5
{
  PXGFloatValuesColorLookupCube *result;

  result = -[PXGFloatValuesColorLookupCube initWithContentsOfURL:format:error:](self, "initWithContentsOfURL:format:error:", a3, 1, a5);
  if (a4)
    *a4 = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_colorValuesData);
  v3.receiver = self;
  v3.super_class = (Class)PXGFloatValuesColorLookupCube;
  -[PXGFloatValuesColorLookupCube dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = self->_length ^ -[PXGColorLookupCube edgeSize](self, "edgeSize");
  return v3 ^ -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "edgeSize");
    if (v6 == -[PXGColorLookupCube edgeSize](self, "edgeSize")
      && (v7 = objc_msgSend(v5, "length"), v7 == -[PXGFloatValuesColorLookupCube length](self, "length")))
    {
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGFloatValuesColorLookupCube identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
        v10 = 1;
      else
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)shouldCache
{
  return 1;
}

- (void)smoothWithFactor:(float)a3
{
  int v5;
  float *v6;
  int v7;
  int v8;
  uint64_t v9;
  double v10;
  float v11;
  int v12;
  float32x4_t v13;
  uint64_t v14;
  float *v15;
  uint64_t v16;
  float32x4_t *v17;
  float32x4_t v18;
  float32x4_t v19;
  uint64_t v20;
  int v21;
  float32x4_t v22;
  int v23;
  uint64_t i;
  uint64_t v25;
  float32x4_t *v26;
  uint64_t v27;
  float32x4_t *v28;
  float32x4_t v29;
  float32x4_t *v30;
  float32x4_t v31;
  int v32;
  float32x4_t v33;
  uint64_t v34;
  int v35;
  uint64_t j;
  int v37;
  uint64_t v38;
  float32x4_t *v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  int v43;
  float32x4_t v44;
  float32x4_t v45;

  v5 = -[PXGColorLookupCube edgeSize](self, "edgeSize");
  v6 = -[PXGFloatValuesColorLookupCube colorValuesData](objc_retainAutorelease(self), "colorValuesData");
  v7 = v5 - 1;
  if (v5 >= 1)
  {
    v8 = 0;
    v9 = 0;
    v10 = a3 * 2.0 + 1.0;
    *(float *)&v10 = a3 / v10;
    v11 = *(float *)&v10 * -2.0 + 1.0;
    v12 = v5 * v5;
    v13 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v10, 0);
    do
    {
      v14 = 0;
      v15 = &v6[4 * v8];
      do
      {
        v16 = 0;
        v17 = (float32x4_t *)&v6[4 * (v12 * v9) + 4 * v14 * v5];
        v18 = *v17;
        v19 = *v17;
        do
        {
          v20 = v16 + 1;
          if ((int)v16 + 1 >= v7)
            v21 = v5 - 1;
          else
            v21 = v16 + 1;
          v22 = vmlaq_f32(vmulq_n_f32(v19, v11), v18, v13);
          v18 = v19;
          v19 = v17[v21];
          *(float32x4_t *)&v15[4 * v16++] = vmlaq_f32(v22, v19, v13);
        }
        while (v5 != v20);
        ++v14;
        v15 += 4 * v5;
      }
      while (v14 != v5);
      ++v9;
      v8 += v12;
    }
    while (v9 != v5);
    v23 = 0;
    for (i = 0; i != v5; ++i)
    {
      v25 = 0;
      v26 = (float32x4_t *)&v6[4 * v23];
      do
      {
        v27 = 0;
        v28 = (float32x4_t *)&v6[4 * (v12 * i) + 4 * v25];
        v29 = *v28;
        v30 = v26;
        v31 = *v28;
        do
        {
          if ((int)++v27 >= v7)
            v32 = v5 - 1;
          else
            v32 = v27;
          v33 = vmlaq_f32(vmulq_n_f32(v29, v11), v31, v13);
          v31 = v29;
          v29 = v28[v32 * v5];
          *v30 = vmlaq_f32(v33, v29, v13);
          v30 += v5;
        }
        while (v5 != v27);
        ++v25;
        ++v26;
      }
      while (v25 != v5);
      v23 += v5 * v5;
    }
    v34 = 0;
    v35 = v5 * v5;
    do
    {
      for (j = 0; j != v5; ++j)
      {
        v37 = 0;
        v38 = 0;
        v39 = (float32x4_t *)&v6[4 * v34 * v5 + 4 * j];
        v40 = *v39;
        v41 = *v39;
        do
        {
          v42 = v40;
          if ((int)++v38 >= v7)
            v43 = v5 - 1;
          else
            v43 = v38;
          v44 = vmulq_n_f32(v40, v11);
          v40 = v39[v35 * v43];
          v45 = vmlaq_f32(v44, v41, v13);
          v41 = v42;
          v39[v37] = vmlaq_f32(v45, v40, v13);
          v37 += v35;
        }
        while (v5 != v38);
      }
      ++v34;
    }
    while (v34 != v5);
  }
}

- (BOOL)blendWithCube:(id)a3 factor:(float)a4
{
  id v5;
  int v6;
  uint64_t v7;
  float *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  float32x4_t v12;
  uint64_t v13;
  uint64_t v14;
  float32x4_t *v15;
  float32x4_t *v16;
  float32x4_t *v17;
  float32x4_t *v18;
  uint64_t v19;
  float32x4_t v20;
  int32x2_t v22;

  v22 = *(int32x2_t *)&a4;
  v5 = a3;
  v6 = -[PXGColorLookupCube edgeSize](self, "edgeSize");
  v7 = objc_msgSend(v5, "edgeSize");
  if (v7 == v6)
  {
    v8 = -[PXGFloatValuesColorLookupCube colorValuesData](objc_retainAutorelease(self), "colorValuesData");
    v9 = objc_msgSend(objc_retainAutorelease(v5), "colorValuesData");
    if (v6 >= 1)
    {
      v10 = 0;
      v11 = 0;
      v12 = (float32x4_t)vdupq_lane_s32(v22, 0);
      v13 = 16 * v7;
      do
      {
        v14 = 0;
        v15 = (float32x4_t *)(v9 + 16 * v10);
        v16 = (float32x4_t *)&v8[4 * v10];
        do
        {
          v17 = v16;
          v18 = v15;
          v19 = v6;
          do
          {
            v20 = *v18++;
            *v17 = vmlaq_f32(*v17, vsubq_f32(v20, *v17), v12);
            ++v17;
            --v19;
          }
          while (v19);
          ++v14;
          v15 = (float32x4_t *)((char *)v15 + v13);
          v16 = (float32x4_t *)((char *)v16 + v13);
        }
        while (v14 != v6);
        ++v11;
        v10 += v6 * v6;
      }
      while (v11 != v6);
    }
  }

  return v7 == v6;
}

- (double)center
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  float32x4_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  float32x4_t v15;
  double result;

  v2 = objc_msgSend(a1, "edgeSize");
  v3 = objc_msgSend(objc_retainAutorelease(a1), "colorValuesData");
  v4 = 0;
  if (v2 >= 0)
    v5 = v2;
  else
    v5 = v2 + 1;
  v6 = (uint64_t)v5 >> 1;
  v7 = 0uLL;
  v8 = 1;
  do
  {
    v9 = 0;
    v10 = v8;
    v11 = v3 + 16 * (v2 * v2) * (v4 + v6);
    v12 = 1;
    do
    {
      v13 = v12;
      v14 = v11 + 16 * (v9 + v6) * v2;
      v7 = vaddq_f32(vaddq_f32(v7, *(float32x4_t *)(v14 + 16 * v6)), *(float32x4_t *)(v14 + 16 * (v6 + 1)));
      v9 = 1;
      v12 = 0;
    }
    while ((v13 & 1) != 0);
    v8 = 0;
    v4 = 1;
  }
  while ((v10 & 1) != 0);
  v15.i64[0] = 0x3E0000003E000000;
  v15.i64[1] = 0x3E0000003E000000;
  *(_QWORD *)&result = vmulq_f32(v7, v15).u64[0];
  return result;
}

- (id)textureData
{
  int64_t v3;
  float *v4;
  uint64_t v5;
  id v6;
  _BYTE *i;
  float v8;
  float v9;
  float v10;
  int v11;

  v3 = -[PXGColorLookupCube edgeSize](self, "edgeSize");
  v4 = -[PXGFloatValuesColorLookupCube colorValuesData](objc_retainAutorelease(self), "colorValuesData");
  v5 = 4 * v3 * v3 * v3;
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v5));
  for (i = (_BYTE *)objc_msgSend(v6, "mutableBytes"); v5; --v5)
  {
    v8 = *v4++;
    v9 = 255.0;
    v10 = (float)(v8 * 255.0) + 0.5;
    if (v10 < 255.0)
      v9 = v10;
    v11 = (int)v9;
    if (v10 < 0.0)
      LOBYTE(v11) = 0;
    *i++ = v11;
  }
  return v6;
}

- (id)createTextureWithContext:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[6];

  v4 = a3;
  v5 = -[PXGColorLookupCube edgeSize](self, "edgeSize");
  -[PXGFloatValuesColorLookupCube textureData](self, "textureData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDDD740]);
  objc_msgSend(v7, "setTextureType:", 7);
  objc_msgSend(v7, "setWidth:", v5);
  objc_msgSend(v7, "setHeight:", v5);
  objc_msgSend(v7, "setDepth:", v5);
  objc_msgSend(v7, "setPixelFormat:", 70);
  objc_msgSend(v7, "setUsage:", 1);
  objc_msgSend(v7, "setResourceOptions:", 0);
  v8 = (void *)objc_msgSend(v4, "newTextureWithDescriptor:", v7);
  v9 = objc_retainAutorelease(v6);
  v11[3] = v5;
  v11[4] = v5;
  v11[5] = v5;
  objc_msgSend(v4, "copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:", objc_msgSend(v9, "bytes", 0, 0, 0), v8, v11, objc_msgSend(v9, "length"), 4 * v5, 4 * v5 * v5);

  return v8;
}

- (float)colorValuesData
{
  return self->_colorValuesData;
}

- (unint64_t)length
{
  return self->_length;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __59__PXGFloatValuesColorLookupCube_initWithData_format_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id obj;

  v10 = *(void **)(a1 + 32);
  v11 = a2;
  objc_msgSend(v10, "setEdgeSize:", a4);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = a5;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = a6;
  obj = (id)objc_msgSend(v11, "copy");

  v12 = obj;
  if (!obj)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    a6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a6, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), v12);
  v13 = obj;
  if (!obj)
  {

    v13 = 0;
  }

}

void __59__PXGFloatValuesColorLookupCube_initWithData_format_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (BOOL)_parseLUTData:(id)a3 resultHandler:(id)a4 errorHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  float *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  unint64_t v21;
  void *v22;
  BOOL v23;
  float v24;
  int v25;
  unint64_t v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  void *context;
  void *v39;
  float v40;
  unint64_t v41;
  float v42;
  void *v43;
  void *v44;
  void (**v45)(id, void *, uint64_t, uint64_t, void *, uint64_t);
  id v46;
  float v47;
  unint64_t v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v7 = a3;
  v45 = (void (**)(id, void *, uint64_t, uint64_t, void *, uint64_t))a4;
  v8 = a5;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  v58 = 0;
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __74__PXGFloatValuesColorLookupCube__parseLUTData_resultHandler_errorHandler___block_invoke;
  v50[3] = &unk_251A6E260;
  v52 = &v53;
  v9 = v8;
  v51 = v9;
  v10 = MEMORY[0x2495B0BB0](v50);
  v11 = (void (**)(_QWORD))v10;
  if (v7)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    v43 = (void *)v12;
    if (v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", v12);
      v30 = 0x7FFFFFFFFFFFFFFFLL;
      v48 = 0;
      v49 = 0x7FFFFFFFFFFFFFFFLL;
      v47 = 0.0;
      v42 = 0.0;
      context = (void *)MEMORY[0x2495B0A48]();
      v39 = 0;
      v14 = 0;
      v29 = 0;
      v44 = 0;
      v15 = 0;
      v16 = 0;
      LODWORD(v41) = 1.0;
      HIDWORD(v41) = 1.0;
      v17 = 0.0;
      v18 = 0.0;
      v40 = 1.0;
      v36 = 0.0;
      v37 = 1.0;
      v34 = 0.0;
      v35 = 1.0;
      v32 = 0.0;
      v33 = 1.0;
      while (2)
      {
        while (2)
        {
          v19 = v42;
LABEL_5:
          v20 = 1.0 / (float)(*((float *)&v41 + 1) - v19);
LABEL_6:
          v21 = v14;
          while (1)
          {
            if ((objc_msgSend(v13, "isAtEnd") & 1) != 0)
              goto LABEL_43;
            if (!objc_msgSend(v13, "scanString:intoString:", CFSTR("#"), 0))
              break;
            objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "scanUpToCharactersFromSet:intoString:", v22, 0);

          }
          if (objc_msgSend(v13, "scanString:intoString:", CFSTR("TITLE"), 0))
          {
            if (objc_msgSend(v13, "scanString:intoString:", CFSTR("\"), 0))
            {
              v46 = 0;
              v25 = objc_msgSend(v13, "scanUpToString:intoString:", CFSTR("\"), &v46);
              v31 = v46;
              if (v25 && objc_msgSend(v13, "scanString:intoString:", CFSTR("\"), 0))
              {

                v39 = v31;
                v14 = v21;
                continue;
              }
              v28 = v31;
            }
            else
            {
              v28 = 0;
            }
            v11[2](v11);

            goto LABEL_43;
          }
          break;
        }
        v14 = v21;
        if (objc_msgSend(v13, "scanString:intoString:", CFSTR("DOMAIN_MIN"), 0))
        {
          if (objc_msgSend(v13, "scanFloat:", (char *)&v48 + 4)
            && objc_msgSend(v13, "scanFloat:", &v48)
            && objc_msgSend(v13, "scanFloat:", &v47))
          {
            v26 = v48;
            LODWORD(v42) = HIDWORD(v26);
            LODWORD(v17) = v26;
            v18 = v47;
            continue;
          }
        }
        else if (objc_msgSend(v13, "scanString:intoString:", CFSTR("DOMAIN_MAX"), 0))
        {
          if (objc_msgSend(v13, "scanFloat:", (char *)&v48 + 4)
            && objc_msgSend(v13, "scanFloat:", &v48)
            && objc_msgSend(v13, "scanFloat:", &v47))
          {
            v41 = v48;
            v40 = v47;
            v19 = v42;
            goto LABEL_5;
          }
        }
        else if (objc_msgSend(v13, "scanString:intoString:", CFSTR("LUT_3D_SIZE"), 0))
        {
          v30 = 3;
          if ((objc_msgSend(v13, "scanInteger:", &v49) & 1) != 0)
            continue;
        }
        else if (objc_msgSend(v13, "scanFloat:", (char *)&v48 + 4)
               && objc_msgSend(v13, "scanFloat:", &v48)
               && objc_msgSend(v13, "scanFloat:", &v47))
        {
          if (v44)
          {
LABEL_21:
            if (v15 < v14)
            {
              *v16 = v36 + (float)(*((float *)&v48 + 1) * v37);
              v24 = v32 + (float)(v47 * v33);
              v16[1] = v34 + (float)(*(float *)&v48 * v35);
              v16[2] = v24;
              v16[3] = 1.0;
              ++v15;
              v16 += 4;
              if (v15 != v14)
                goto LABEL_6;
              if (objc_msgSend(v13, "isAtEnd"))
              {
                v45[2](v45, v39, v30, v49, v44, v29);
                v44 = 0;
                v23 = 1;
                goto LABEL_44;
              }
            }
            break;
          }
          v44 = 0;
          v23 = 0;
          if (v30 == 3 && v49 >= 1)
          {
            v14 = v49 * v49 * v49;
            v44 = malloc_type_malloc(16 * v14, 0x100004052888210uLL);
            v29 = 4 * v14;
            v36 = v20 * (float)-v42;
            v37 = v20;
            v34 = (float)(1.0 / (float)(*(float *)&v41 - v17)) * (float)-v17;
            v35 = 1.0 / (float)(*(float *)&v41 - v17);
            v32 = (float)(1.0 / (float)(v40 - v18)) * (float)-v18;
            v33 = 1.0 / (float)(v40 - v18);
            v16 = (float *)v44;
            goto LABEL_21;
          }
LABEL_44:
          objc_autoreleasePoolPop(context);
          free(v44);

          goto LABEL_45;
        }
        break;
      }
      v11[2](v11);
LABEL_43:
      v23 = 0;
      goto LABEL_44;
    }
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v54[5]);
    v23 = 0;
LABEL_45:

    goto LABEL_46;
  }
  (*(void (**)(uint64_t))(v10 + 16))(v10);
  v23 = 0;
LABEL_46:

  _Block_object_dispose(&v53, 8);
  return v23;
}

uint64_t __74__PXGFloatValuesColorLookupCube__parseLUTData_resultHandler_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1540], "px_genericErrorWithDebugDescription:", CFSTR("Malformed color cube LUT"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
