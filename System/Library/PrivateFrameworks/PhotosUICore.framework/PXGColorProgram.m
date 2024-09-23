@implementation PXGColorProgram

- (PXGColorProgram)initWithContext:(id)a3 sourceColorSpace:(CGColorSpace *)a4 destinationColorSpace:(CGColorSpace *)a5 flags:(unint64_t)a6
{
  id v12;
  PXGColorProgram *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v12 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXGColorProgram;
  v13 = -[PXGColorProgram init](&v19, sel_init);
  if (!v13)
    goto LABEL_7;
  objc_msgSend(v12, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (a4)
      goto LABEL_4;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PXGColorProgram.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceColorSpace != nil"));

    if (a5)
      goto LABEL_5;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PXGColorProgram.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context.device != nil"));

  if (!a4)
    goto LABEL_9;
LABEL_4:
  if (a5)
    goto LABEL_5;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PXGColorProgram.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationColorSpace != nil"));

LABEL_5:
  objc_storeStrong((id *)&v13->_metalRenderContext, a3);
  v13->_sourceColorSpace = CGColorSpaceRetain(a4);
  v13->_destinationColorSpace = CGColorSpaceRetain(a5);
  v13->_flags = a6;
  if (!-[PXGColorProgram _generateProgram](v13, "_generateProgram"))
  {

    v13 = 0;
  }
LABEL_7:

  return v13;
}

- (PXGColorProgram)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGColorProgram.m"), 114, CFSTR("%s is not available as initializer"), "-[PXGColorProgram init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_sourceColorSpace);
  CGColorSpaceRelease(self->_destinationColorSpace);
  free(self->_trc_lut_widths);
  v3.receiver = self;
  v3.super_class = (Class)PXGColorProgram;
  -[PXGColorProgram dealloc](&v3, sel_dealloc);
}

- (BOOL)needsHDRToSDRConversion
{
  return !CGColorSpaceUsesITUR_2100TF(-[PXGColorProgram destinationColorSpace](self, "destinationColorSpace"))
      && CGColorSpaceUsesITUR_2100TF(-[PXGColorProgram sourceColorSpace](self, "sourceColorSpace"));
}

- (BOOL)_generateProgram
{
  uint64_t v3;
  uint64_t v4;
  const __CFDictionary *v5;
  CGColorSpace *v6;
  uint64_t v7;
  CGColorSpace *sourceColorSpace;
  uint64_t v9;
  CGColorConversionInfoRef v10;
  CGColorConversionInfoRef v11;
  size_t NumberOfComponents;
  uint64_t v13;
  NSObject *v14;
  CGColorSpace *v15;
  CGColorSpace *destinationColorSpace;
  BOOL v17;
  NSObject *v18;
  size_t v19;
  CGColorSpace *v20;
  uint8_t buf[4];
  size_t v23;
  __int16 v24;
  CGColorSpace *v25;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  if (-[PXGColorProgram needsHDRToSDRConversion](self, "needsHDRToSDRConversion"))
  {
    v3 = *MEMORY[0x1E0C9AE40];
    v26[0] = CFSTR("kCGPQEETF3DLut");
    v26[1] = CFSTR("kCGHLGSceneMapping3DLut");
    v27[0] = v3;
    v27[1] = v3;
    v4 = *MEMORY[0x1E0C9AE50];
    v26[2] = CFSTR("kCGApplyToneMappingForBT2100");
    v26[3] = CFSTR("kCGHDRMediaReferenceWhite");
    v27[2] = v4;
    v27[3] = &unk_1E53F10E8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXGColorProgram destinationColorSpace](self, "destinationColorSpace");
    v7 = MEMORY[0x1A85CCEEC](12);
    if ((MEMORY[0x1A85CCE38](v6, v7) & 1) == 0)
    {
      sourceColorSpace = self->_sourceColorSpace;
      v9 = MEMORY[0x1A85CCEEC](11);
      v10 = CGColorConversionInfoCreateFromList(v5, sourceColorSpace, kCGColorConversionTransformFromSpace, kCGRenderingIntentDefault, v9, 2, 0, self->_destinationColorSpace, 1, 0, 0);
      goto LABEL_6;
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = CGColorConversionInfoCreateFromList(v5, self->_sourceColorSpace, kCGColorConversionTransformFromSpace, kCGRenderingIntentDefault, self->_destinationColorSpace, 1, 0, 0);
LABEL_6:
  v11 = v10;
  if (!v10)
  {
    PXGTungstenGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = self->_sourceColorSpace;
      destinationColorSpace = self->_destinationColorSpace;
      *(_DWORD *)buf = 138412546;
      v23 = (size_t)v15;
      v24 = 2112;
      v25 = destinationColorSpace;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Unable to create colorConversionInfo from %@ -> %@", buf, 0x16u);
    }

    goto LABEL_20;
  }
  NumberOfComponents = CGColorSpaceGetNumberOfComponents(self->_sourceColorSpace);
  if (NumberOfComponents == 1)
  {
    v13 = 256;
    goto LABEL_16;
  }
  if (NumberOfComponents == 4)
  {
    v13 = 5;
    goto LABEL_16;
  }
  if (NumberOfComponents != 3)
  {
    PXGTungstenGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = CGColorSpaceGetNumberOfComponents(self->_sourceColorSpace);
      v20 = self->_sourceColorSpace;
      *(_DWORD *)buf = 134218242;
      v23 = v19;
      v24 = 2112;
      v25 = v20;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "Unsupported number of components:%zu of colorSpace:%@", buf, 0x16u);
    }

    CFRelease(v11);
LABEL_20:
    v17 = 0;
    goto LABEL_21;
  }
  v13 = 32;
LABEL_16:
  v17 = -[PXGColorProgram _compactProgramWithConversionInfo:cubeSize:cubeOnly:](self, "_compactProgramWithConversionInfo:cubeSize:cubeOnly:", v11, v13, 0);
  CFRelease(v11);
LABEL_21:

  return v17;
}

- (BOOL)_compactProgramWithConversionInfo:(CGColorConversionInfo *)a3 cubeSize:(int)a4 cubeOnly:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  _QWORD *v9;
  _BOOL4 v10;
  int v11;
  NSObject *v12;
  CGColorSpace *v13;
  CGColorSpace *v14;
  unsigned int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  int v23;
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[3];
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint8_t buf[4];
  CGColorSpace *v33;
  __int16 v34;
  CGColorSpace *v35;
  uint64_t v36;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v36 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v9 = v26;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v10 = -[PXGColorProgram needsHDRToSDRConversion](self, "needsHDRToSDRConversion");
  v21 = MEMORY[0x1E0C809B0];
  v20 = MEMORY[0x1E0C809B0];
  v19 = MEMORY[0x1E0C809B0];
  v17 = MEMORY[0x1E0C809B0];
  LOBYTE(v18) = v5;
  v11 = CGColorConversionInfoIterateFunctionsWithCallbacks();
  if ((v11 & 1) == 0)
  {
    if (!v5 && !v10)
    {
      LOBYTE(v9) = -[PXGColorProgram _compactProgramWithConversionInfo:cubeSize:cubeOnly:](self, "_compactProgramWithConversionInfo:cubeSize:cubeOnly:", a3, v6, 1, v17, 3221225472, __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_2, &unk_1E5125EB8, self, v25, &v28, v26, v24, v18, v19, 3221225472, __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_26, &unk_1E5125E90,
                     v24,
                     v25,
                     &v28,
                     v26,
                     v20,
                     3221225472,
                     __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_24,
                     &unk_1E5125E68,
                     self,
                     v24,
                     v25,
                     v22,
                     &v28,
                     v26,
                     v21,
                     3221225472,
                     __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke,
                     &unk_1E5125E40,
                     self,
                     v24,
                     v22,
                     v25);
      if (!v11)
        goto LABEL_14;
      goto LABEL_9;
    }
    PXGTungstenGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[PXGColorProgram sourceColorSpace](self, "sourceColorSpace", v17, 3221225472, __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_2, &unk_1E5125EB8, self, v25, &v28, v26, v24, v18, v19, 3221225472, __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_26, &unk_1E5125E90, v24, v25, &v28,
              v26,
              v20,
              3221225472,
              __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_24,
              &unk_1E5125E68,
              self,
              v24,
              v25,
              v22,
              &v28,
              v26,
              v21,
              3221225472,
              __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke,
              &unk_1E5125E40,
              self,
              v24,
              v22,
              v25);
      v14 = -[PXGColorProgram destinationColorSpace](self, "destinationColorSpace");
      *(_DWORD *)buf = 138412546;
      v33 = v13;
      v34 = 2112;
      v35 = v14;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Unable to create color program for %@ -> %@.", buf, 0x16u);
    }

    LOBYTE(v9) = 0;
  }
  if (!v11)
    goto LABEL_14;
LABEL_9:
  v15 = *((_DWORD *)v29 + 6);
  if ((_DWORD)v6 == 5 || v15 && (self->_flags & 1) != 0)
  {
    v15 |= 0x20000000u;
    *((_DWORD *)v29 + 6) = v15;
  }
  self->_opcodes = v15;
  self->_numInputs = CGColorSpaceGetNumberOfComponents(self->_sourceColorSpace);
  LOBYTE(v9) = 1;
LABEL_14:
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);
  return v9 & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *Name;
  CFStringRef v6;
  CFStringRef v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PXGColorProgram;
  -[PXGColorProgram description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  Name = (void *)CGColorSpaceGetName(-[PXGColorProgram sourceColorSpace](self, "sourceColorSpace"));
  if (!Name)
  {
    v6 = CFCopyDescription(-[PXGColorProgram sourceColorSpace](self, "sourceColorSpace"));
    Name = (void *)CFAutorelease(v6);
  }
  v7 = CGColorSpaceGetName(-[PXGColorProgram destinationColorSpace](self, "destinationColorSpace"));
  if ((self->_flags & 1) != 0)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ source:%@ destination:%@ opaque:%@>"), v4, Name, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)diagnosticDescription
{
  id v3;
  float *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  float v15;
  void *v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  float *v20;
  void *v21;
  uint64_t v22;
  float *v23;
  void *v24;
  uint64_t v25;
  float *v26;
  void *v27;
  uint64_t j;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  CFStringRef Name;
  CFTypeRef v35;
  CFStringRef v36;
  CFStringRef v37;
  void *v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  PXGColorProgram *v44;
  void *v45;
  objc_super v46;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (float *)-[MTLBuffer contents](self->_params, "contents");
  v5 = 0;
  v6 = -[PXGColorProgram numInputs](self, "numInputs");
  v7 = CFSTR("\n    %d: t[i] = t[i] < -%.5f / %.5f ? 0 : powr(%.5f * t[i] + %.5f, %.5f);");
  v8 = CFSTR("\n    %d: t[i] = t[i] < -%.5f / %.5f ? %.5f : powr(%.5f * t[i] + %.5f, %.5f) + %.5f;");
  v44 = self;
  v45 = v3;
  while (2)
  {
    v9 = v8;
    v10 = v7;
    v11 = (void *)MEMORY[0x1E0CB3940];
    PXGColorOpcodeDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v9;
    switch((int)v7)
    {
      case 0:
        goto LABEL_46;
      case 1:
        objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("c = (c.r * (%.5f,%.5f,%.5f) + c.g * (%.5f,%.5f,%.5f) + c.b * (%.5f,%.5f,%.5f) + (%.5f,%.5f,%.5f), c.a)"), *v4, v4[1], v4[2], v4[4], v4[5], v4[6], v4[8], v4[9], v4[10], v4[12], v4[13], v4[14]);
        v14 = objc_claimAutoreleasedReturnValue();

        v4 += 16;
        v6 = 3;
        goto LABEL_31;
      case 2:
        v15 = *v4;
        v4 += 4;
        objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("c = sign(c) * powr(t, %.5f);
        v14 = objc_claimAutoreleasedReturnValue();

        goto LABEL_31;
      case 3:
        objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("for each color component:"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if ((int)v6 < 1)
        {
          v13 = v16;
        }
        else
        {
          for (i = 0; i != v6; ++i)
          {
            objc_msgSend(v16, "stringByAppendingFormat:", v10, i, v4[i + 8], v4[i + 4], v4[i + 4], v4[i + 8], v4[i]);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = v13;
          }
        }
        v4 += 12;
        goto LABEL_36;
      case 4:
        objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("for each color component:"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if ((int)v6 < 1)
        {
          v13 = v18;
        }
        else
        {
          v19 = 0;
          v20 = v4 + 8;
          do
          {
            objc_msgSend(v18, "stringByAppendingFormat:", v9, v19, *v20, *(v20 - 4), v20[4], *(v20 - 4), *v20, *(v20 - 8), v20[4]);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            ++v19;
            ++v20;
            v18 = v13;
          }
          while (v6 != v19);
        }
        v4 += 16;
        v3 = v45;
        goto LABEL_36;
      case 5:
        objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("for each color component:"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if ((int)v6 < 1)
        {
          v13 = v21;
        }
        else
        {
          v22 = 0;
          v23 = v4 + 8;
          do
          {
            objc_msgSend(v21, "stringByAppendingFormat:", CFSTR("\n    %d: t[i] = t[i] < %.5f ? %.5f * t[i] : powr(%.5f * t[i] + %.5f,%.5f);"),
              v22,
              v23[8],
              v23[4],
              *(v23 - 4),
              *v23,
              *(v23 - 8));
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            ++v22;
            ++v23;
            v21 = v13;
          }
          while (v6 != v22);
        }
        v4 += 20;
        goto LABEL_43;
      case 6:
        objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("for each color component:"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if ((int)v6 < 1)
        {
          v13 = v24;
        }
        else
        {
          v25 = 0;
          v26 = v4 + 12;
          do
          {
            objc_msgSend(v24, "stringByAppendingFormat:", CFSTR("\n    %d: t[i] = t[i] < %.5f ? %.5f * t[i] + %.5f : powr(%.5f * t[i] + %.5f, %.5f) + %.5f;"),
              v25,
              v26[4],
              *v26,
              v26[12],
              *(v26 - 8),
              *(v26 - 4),
              *(v26 - 12),
              v26[8]);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            ++v25;
            ++v26;
            v24 = v13;
          }
          while (v6 != v25);
        }
        v4 += 28;
LABEL_43:
        self = v44;
        v3 = v45;
        v7 = v10;
        v8 = v9;
        goto LABEL_44;
      case 7:
        objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("for each color component:"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if ((int)v6 < 1)
        {
          v13 = v27;
        }
        else
        {
          for (j = 0; j != v6; ++j)
          {
            objc_msgSend(v27, "stringByAppendingFormat:", CFSTR("\n    %d: c[i] = colorp(color_trc.sample(lut_sampler, float2(c[i] * %.5f, %.5f)).r)"), j, v4[j], v4[j + 4]);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = v13;
          }
        }
        v4 += 8;
        v7 = v10;
        v8 = v9;
        v3 = v45;
        if (!v13)
          goto LABEL_47;
        goto LABEL_45;
      case 8:
        objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("\n    c.r = c.r * %.5f + %.5f;"), *v4, v4[1]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v29;
        v31 = CFSTR("\n    c.rgb = colorp3(color_cube.sample(lut_sampler, float3(c.r, 0.5, 0.5)).rgb);");
        goto LABEL_27;
      case 9:
        objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("\n    c.rgb = c.rgb * %.5f + %.5f;"), *v4, v4[1]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v29;
        v31 = CFSTR("\n    c.rgb = colorp3(color_cube.sample(lut_sampler, float3(c.rgb)).rgb);");
LABEL_27:
        objc_msgSend(v30, "stringByAppendingFormat:", v31);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v9;
        goto LABEL_28;
      case 10:
LABEL_28:
        v4 += 4;
        v6 = 3;
        if (!v13)
          goto LABEL_47;
        goto LABEL_45;
      case 11:
      case 12:
LABEL_44:
        if (v13)
          goto LABEL_45;
        goto LABEL_47;
      case 13:
        objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("c = hlg_luma_scaling(c, %.5f, %.5f, colorp4(%.5f, %.5f, %.5f, %.5f));"),
          *v4,
          v4[4],
          v4[8],
          v4[12],
          v4[16],
          v4[20]);
        v14 = objc_claimAutoreleasedReturnValue();

        v4 += 24;
LABEL_31:
        v13 = (void *)v14;
        goto LABEL_37;
      default:
LABEL_36:
        v7 = v10;
LABEL_37:
        v8 = v9;
        if (v13)
        {
LABEL_45:
          objc_msgSend(v3, "appendFormat:", CFSTR("  %ld: %@\n"), v5, v13);
LABEL_46:

        }
LABEL_47:
        if (++v5 != 7)
          continue;
        v32 = (void *)MEMORY[0x1E0CB3940];
        v46.receiver = self;
        v46.super_class = (Class)PXGColorProgram;
        -[PXGColorProgram description](&v46, sel_description);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        Name = CGColorSpaceGetName(-[PXGColorProgram sourceColorSpace](self, "sourceColorSpace"));
        v35 = Name;
        if (!Name)
        {
          v36 = CFCopyDescription(-[PXGColorProgram sourceColorSpace](self, "sourceColorSpace"));
          v35 = CFAutorelease(v36);
        }
        v37 = CGColorSpaceGetName(-[PXGColorProgram destinationColorSpace](self, "destinationColorSpace"));
        -[PXGColorProgram TRCLUTs](self, "TRCLUTs");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGColorProgram colorCube](self, "colorCube");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if ((self->_flags & 1) != 0)
          v40 = CFSTR("YES");
        else
          v40 = CFSTR("NO");
        v41 = v40;
        objc_msgSend(v32, "stringWithFormat:", CFSTR("<%@ source:%@ destination:%@ TRCLUTs:%@ colorCube:%@ opaque:%@ stages:\n%@>"), v33, v35, v37, v38, v39, v41, v45);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        return v42;
    }
  }
}

- (PXGMetalRenderContext)metalRenderContext
{
  return self->_metalRenderContext;
}

- (CGColorSpace)sourceColorSpace
{
  return self->_sourceColorSpace;
}

- (CGColorSpace)destinationColorSpace
{
  return self->_destinationColorSpace;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (unsigned)opcodes
{
  return self->_opcodes;
}

- (unsigned)numInputs
{
  return self->_numInputs;
}

- (unsigned)paramCount
{
  return self->_paramCount;
}

- (MTLBuffer)params
{
  return self->_params;
}

- (MTLTexture)TRCLUTs
{
  return self->_TRCLUTs;
}

- (MTLTexture)colorCube
{
  return self->_colorCube;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorCube, 0);
  objc_storeStrong((id *)&self->_TRCLUTs, 0);
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
}

uint64_t __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[16];
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a2 + 12);
  if (*(uint64_t *)(a2 + 4) > 7)
  {
    PXGTungstenGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 7;
      v3 = "Color matching limited to %d-stage, falling back to cube LUT\n";
      v4 = v2;
      v5 = 8;
LABEL_17:
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, v3, buf, v5);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (*(uint64_t *)(a2 + 28) < 1)
  {
    v9 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    do
    {
      LODWORD(v21) = 0;
      *(_OWORD *)buf = 0u;
      v20 = 0u;
      CGColorTRCGetFunction();
      v9 += *((unsigned __int8 *)off_1E50B81F8 + 2);
      ++v8;
    }
    while (*(_QWORD *)(a2 + 28) > v8);
  }
  v10 = *(_QWORD *)(a2 + 36);
  if (v10 <= 0)
    v11 = 0;
  else
    v11 = *((unsigned __int8 *)off_1E50B81F8 + 1) * (_DWORD)v10;
  v12 = v9 + v11;
  v13 = *(_QWORD *)(a2 + 44);
  if (v13 == 1)
  {
    LODWORD(v21) = 0;
    *(_OWORD *)buf = 0u;
    v20 = 0u;
    CGColorNxMTransformGetTransform();
    v12 += *((unsigned __int8 *)off_1E50B81F8 + 8);
    v13 = *(_QWORD *)(a2 + 44);
  }
  if (v13 >= 2)
  {
    PXGTungstenGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v3 = "No support for more than one NxM LUT, falling back to cube LUT\n";
      v4 = v2;
      v5 = 2;
      goto LABEL_17;
    }
LABEL_18:

    return 0;
  }
  *(_WORD *)(a1[4] + 26) = v12;
  objc_msgSend(*(id *)(a1[4] + 32), "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "newBufferWithLength:options:", 16 * v12, 0);
  v17 = a1[4];
  v18 = *(void **)(v17 + 64);
  *(_QWORD *)(v17 + 64) = v16;

  *(_DWORD *)(a1[4] + 8) = 0;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 64), "contents");
  return 1;
}

BOOL __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_24(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  __int128 v12;
  uint64_t v13;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[16];

  CGColorTRCGetFunction();
  v9 = *((unsigned __int8 *)off_1E50B81F8 + 2);
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) < a4)
    a4 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (a4 >= 1)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0uLL;
    while (1)
    {
      v13 = *(_QWORD *)(a5 + 8 * v10);
      if (v13 < 0)
      {
        switch((int)v9)
        {
          case 1:
            goto LABEL_17;
          case 2:
            goto LABEL_16;
          case 3:
            goto LABEL_15;
          case 4:
            goto LABEL_14;
          case 5:
            goto LABEL_13;
          case 6:
            goto LABEL_12;
          case 7:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10 + 96) = 0;
LABEL_12:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10 + 80) = 0;
LABEL_13:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10 + 64) = 0;
LABEL_14:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10 + 48) = 0;
LABEL_15:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10 + 32) = 0;
LABEL_16:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10 + 16) = 1065353216;
LABEL_17:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10) = 1065353216;
            break;
          default:
            break;
        }
      }
      else
      {
        if (v13 >= *(_QWORD *)(a2 + 28))
          return v11;
        v16 = v12;
        v17 = v12;
        CGColorTRCGetFunction();
        if (v10 && (_DWORD)v16)
        {
          PXGTungstenGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "TRCs are not the same for each color channel, falling back to cube LUT\n", buf, 2u);
          }

          return v11;
        }
        switch((int)v9)
        {
          case 1:
            goto LABEL_25;
          case 2:
            goto LABEL_24;
          case 3:
            goto LABEL_23;
          case 4:
            goto LABEL_22;
          case 5:
            goto LABEL_21;
          case 6:
            goto LABEL_20;
          case 7:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10 + 96) = HIDWORD(v17);
LABEL_20:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10 + 80) = DWORD2(v17);
LABEL_21:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10 + 64) = DWORD1(v17);
LABEL_22:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10 + 48) = v17;
LABEL_23:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10 + 32) = HIDWORD(v16);
LABEL_24:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10 + 16) = DWORD2(v16);
LABEL_25:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 4 * v10) = DWORD1(v16);
            break;
          default:
            break;
        }
        v12 = 0uLL;
      }
      v11 = a4 <= ++v10;
      if (v10 == a4)
        goto LABEL_30;
    }
  }
  v11 = 1;
LABEL_30:
  *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) |= 2 << *(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
  *(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24) += 4;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += 16 * v9;
  return v11;
}

uint64_t __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_26(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  CGColorMatrixGetMatrix();
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = *(_QWORD *)(a2 + 20);
  **(_DWORD **)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 4) = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 8) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 16) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 20) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 24) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 28) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 32) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 36) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 40) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 44) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 48) = 0;
  v4 = *((unsigned __int8 *)off_1E50B81F8 + 1);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 52) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 56) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + 60) = 0;
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) |= 1 << *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += 4;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += 16 * v4;
  return 1;
}

uint64_t __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _OWORD v10[2];
  int buf;
  uint8_t buf_4[8];
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a2 + 68) + 8 * a4))
  {
    memset(v10, 0, 20);
    CGColorNxMTransformGetTransform();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (*(_QWORD *)(v5 + 24))
    {
      PXGTungstenGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        buf = 138412290;
        *(_QWORD *)buf_4 = v7;
        _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "%@ num_components != lut.nInputs", (uint8_t *)&buf, 0xCu);
      }

      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    }
    *(_QWORD *)(v5 + 24) = *(_QWORD *)((char *)v10 + 12);
    PXGTungstenGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      buf = 134218240;
      *(_QWORD *)buf_4 = 0;
      v13 = 2048;
      v14 = *(_QWORD *)((char *)v10 + 12);
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "%zux%zu LUT not supported.\n", (uint8_t *)&buf, 0x16u);
    }

  }
  return 0;
}

@end
