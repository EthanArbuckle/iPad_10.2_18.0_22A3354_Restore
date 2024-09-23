BOOL enableFGBlur(int a1)
{
  return a1 > 0;
}

id sub_24B6B81BC(__int16 a1)
{
  uint64_t v1;
  _WORD *v2;
  _WORD *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  _WORD *v14;
  _WORD *v15;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  _QWORD v44[3];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v1 = (unsigned __int16)(3 * a1 * a1);
  v2 = malloc_type_malloc(8 * v1, 0xCB4280B1uLL);
  v3 = malloc_type_malloc(4 * v1, 0xF417B6FBuLL);
  if (!v2)
    sub_24B6ED5C0();
  v5 = v3;
  if (!v3)
    sub_24B6ED5E8();
  if ((_DWORD)v1)
  {
    v6 = 0;
    _S0 = (float)v1;
    __asm
    {
      FCVT            H0, S0
      FCVT            S0, H0
    }
    _S0 = 3.0 / _S0;
    __asm { FCVT            H0, S0 }
    v14 = v3 + 1;
    v15 = v2 + 2;
    __asm { FCVT            S14, H0 }
    do
    {
      _S0 = (float)(unsigned __int16)v6;
      __asm
      {
        FCVT            H0, S0
        FCVT            S0, H0
      }
      _S1 = floorf(sqrtf((float)(_S0 + 0.5) / 3.0));
      __asm
      {
        FCVT            H1, S1
        FCVT            S1, H1
      }
      _S0 = _S0 + (float)((float)(_S1 * -3.0) * _S1);
      __asm { FCVT            H0, S0 }
      _S2 = (float)(_S1 * 6.0) + 3.0;
      __asm
      {
        FCVT            H2, S2
        FCVT            S2, H2
      }
      _S2 = 1.0 / _S2;
      __asm
      {
        FCVT            H2, S2
        FCVT            S3, H2
        FCVT            S0, H0
      }
      _S0 = (float)(_S3 + _S3) * _S0;
      __asm { FCVT            H0, S0 }
      _S3 = _S1 * _S1;
      __asm { FCVT            H3, S3 }
      _S1 = (float)(_S1 + 1.0) * (float)(_S1 + 1.0);
      __asm
      {
        FCVT            H1, S1
        FCVT            S3, H3
      }
      _S3 = _S14 * _S3;
      __asm
      {
        FCVT            H3, S3
        FCVT            S1, H1
      }
      _S1 = _S14 * _S1;
      __asm { FCVT            H1, S1 }
      *(v15 - 2) = LOWORD(_S3);
      *(v15 - 1) = LOWORD(_S1);
      *v15 = LOWORD(_S2);
      v15[1] = 0;
      __asm { FCVT            D0, H0 }
      _KR00_16 = __sincos_stret(_D0 * 3.14159265);
      __asm { FCVT            H1, D1 }
      *(v14 - 1) = _H1;
      __asm { FCVT            H0, D0 }
      *v14 = _H0;
      ++v6;
      v14 += 2;
      v15 += 4;
    }
    while (v1 != v6);
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v4, (uint64_t)v2, 8 * v1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v39, (uint64_t)v5, 4 * v1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  free(v2);
  free(v5);
  v44[0] = v38;
  v44[1] = v40;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v41, (uint64_t)v44, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

void sub_24B6B84B8()
{
  id v0;
  const char *v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  void *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  id v35;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  v35 = (id)objc_msgSend_initWithSuiteName_(v0, v1, (uint64_t)CFSTR("com.apple.coremedia"));
  objc_msgSend_dictionaryRepresentation(v35, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("hairnetModelPath"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)qword_2544D9C90;
  qword_2544D9C90 = (uint64_t)v4;

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_fileExistsAtPath_(v10, v11, qword_2544D9C90);
  v15 = (void *)qword_2544D9C90;
  if (v14)
  {
    v16 = (const char *)objc_msgSend_UTF8String((void *)qword_2544D9C90, v12, v13);
    printf("Using Hairnet model at: %s\n", v16);
  }
  else
  {
    qword_2544D9C90 = 0;

  }
  if (!qword_2544D9C90)
  {
    objc_msgSend_pathFromBaseName_(EspressoWrapper, v17, (uint64_t)CFSTR("hairnet-v1"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)qword_2544D9C90;
    qword_2544D9C90 = v18;

    v23 = objc_msgSend_fileExistsAtPath_(v10, v20, qword_2544D9C90);
    v24 = (void *)qword_2544D9C90;
    if (v23)
    {
      v25 = (const char *)objc_msgSend_UTF8String((void *)qword_2544D9C90, v21, v22);
      printf("Using Hairnet model at: %s\n", v25);
    }
    else
    {
      qword_2544D9C90 = 0;

    }
    if (!qword_2544D9C90)
    {
      v26 = (void *)MEMORY[0x24BDD1488];
      v27 = objc_opt_class();
      objc_msgSend_bundleForClass_(v26, v28, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pathForResource_ofType_(v29, v30, (uint64_t)CFSTR("model_quantized.espresso"), CFSTR("net"));
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)qword_2544D9C90;
      qword_2544D9C90 = v31;

      if (objc_msgSend_fileExistsAtPath_(v10, v33, qword_2544D9C90))
      {
        puts("Using Hairnet model in CCPortrait.bundle");
      }
      else
      {
        v34 = (void *)qword_2544D9C90;
        qword_2544D9C90 = 0;

      }
      if (!qword_2544D9C90)
        puts("Hairnet model not found.");
    }
  }

}

CGFloat sub_24B6B8C70(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, void *a7)
{
  void *v11;
  const char *v12;
  uint64_t v13;
  float v14;
  float v15;
  CGRect v17;

  if ((_DWORD)a6 != 2)
  {
    objc_msgSend_objectForKeyedSubscript_(a7, a6, (uint64_t)CFSTR("SparseRenderer::kPreFilterRadius"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v11, v12, v13);
    v15 = v14;

    v17.origin.x = a1;
    v17.origin.y = a2;
    v17.size.width = a3;
    v17.size.height = a4;
    *(_QWORD *)&a1 = (unint64_t)CGRectInset(v17, (float)-v15, 0.0);
  }
  return a1;
}

CGFloat sub_24B6B8D20(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, void *a7)
{
  void *v11;
  const char *v12;
  uint64_t v13;
  float v14;
  float v15;
  CGRect v17;

  if ((_DWORD)a6 != 2)
  {
    objc_msgSend_objectForKeyedSubscript_(a7, a6, (uint64_t)CFSTR("SparseRenderer::kPreFilterRadius"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v11, v12, v13);
    v15 = v14;

    v17.origin.x = a1;
    v17.origin.y = a2;
    v17.size.width = a3;
    v17.size.height = a4;
    *(_QWORD *)&a1 = (unint64_t)CGRectInset(v17, 0.0, (float)-v15);
  }
  return a1;
}

CGFloat sub_24B6B8DD0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6)
{
  CGAffineTransform v11;
  CGRect v12;

  if (!a6)
  {
    CGAffineTransformMakeScale(&v11, 2.0, 2.0);
    v12.origin.x = a1;
    v12.origin.y = a2;
    v12.size.width = a3;
    v12.size.height = a4;
    *(_QWORD *)&a1 = (unint64_t)CGRectApplyAffineTransform(v12, &v11);
  }
  return a1;
}

CGFloat sub_24B6B8E54(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, void *a9)
{
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGAffineTransform *v37;
  double v39;
  double v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGRect v43;

  v14 = a9;
  objc_msgSend_objectAtIndexedSubscript_(v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v16, v17, v18);
  v39 = v20;
  v40 = v19;

  objc_msgSend_objectAtIndexedSubscript_(v14, v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v22, v23, v24);
  v26 = v25;
  v28 = v27;

  objc_msgSend_objectAtIndexedSubscript_(v14, v29, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CGRectValue(v30, v31, v32);
  v34 = v33;
  v36 = v35;

  if (a6 != 2)
  {
    if (a6 == 1)
    {
      CGAffineTransformMakeScale(&v41, v26 / v34, v28 / v36);
      v37 = &v41;
    }
    else
    {
      if (a6)
        return *MEMORY[0x24BDBF070];
      CGAffineTransformMakeScale(&v42, v40 / v34, v39 / v36);
      v37 = &v42;
    }
    v43.origin.x = a1;
    v43.origin.y = a2;
    v43.size.width = a3;
    v43.size.height = a4;
    *(_QWORD *)&a1 = (unint64_t)CGRectApplyAffineTransform(v43, v37);
  }
  return a1;
}

CGFloat sub_24B6B8FB4(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, void *a9)
{
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGAffineTransform *v37;
  double v39;
  double v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGRect v43;

  v14 = a9;
  objc_msgSend_objectAtIndexedSubscript_(v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v16, v17, v18);
  v39 = v20;
  v40 = v19;

  objc_msgSend_objectAtIndexedSubscript_(v14, v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v22, v23, v24);
  v26 = v25;
  v28 = v27;

  objc_msgSend_objectAtIndexedSubscript_(v14, v29, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CGRectValue(v30, v31, v32);
  v34 = v33;
  v36 = v35;

  if (a6 != 2)
  {
    if (a6 == 1)
    {
      CGAffineTransformMakeScale(&v41, v26 / v34, v28 / v36);
      v37 = &v41;
    }
    else
    {
      if (a6)
        return *MEMORY[0x24BDBF070];
      CGAffineTransformMakeScale(&v42, v40 / v34, v39 / v36);
      v37 = &v42;
    }
    v43.origin.x = a1;
    v43.origin.y = a2;
    v43.size.width = a3;
    v43.size.height = a4;
    *(_QWORD *)&a1 = (unint64_t)CGRectApplyAffineTransform(v43, v37);
  }
  return a1;
}

CGFloat sub_24B6B9114(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, void *a9)
{
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGAffineTransform v32;
  CGRect v33;

  v14 = a9;
  objc_msgSend_objectAtIndexedSubscript_(v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v16, v17, v18);
  v20 = v19;
  v22 = v21;

  objc_msgSend_objectAtIndexedSubscript_(v14, v23, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CGRectValue(v24, v25, v26);
  v28 = v27;
  v30 = v29;

  if (a6 != 1)
  {
    if (a6)
    {
      return *MEMORY[0x24BDBF070];
    }
    else
    {
      CGAffineTransformMakeScale(&v32, v20 / v28, v22 / v30);
      v33.origin.x = a1;
      v33.origin.y = a2;
      v33.size.width = a3;
      v33.size.height = a4;
      *(_QWORD *)&a1 = (unint64_t)CGRectApplyAffineTransform(v33, &v32);
    }
  }
  return a1;
}

double sub_24B6B922C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, uint64_t a8, void *a9)
{
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  __int16 v20;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v35;
  float v36;
  CGFloat v37;
  const char *v38;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v15 = a9;
  objc_msgSend_objectForKeyedSubscript_(a7, v16, (uint64_t)CFSTR("SparseRenderer::kMaxBlur_ushort"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_unsignedShortValue(v17, v18, v19);

  _H14 = v20;
  objc_msgSend_objectAtIndexedSubscript_(v15, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v23, v24, v25);
  v27 = v26;
  v29 = v28;

  __asm { FCVT            S0, H14 }
  if (v27 >= v29)
    v35 = v27;
  else
    v35 = v29;
  v36 = v35;
  v37 = (float)-(float)(_S0 * v36);
  v57.origin.x = a1;
  v57.origin.y = a2;
  v57.size.width = a3;
  v57.size.height = a4;
  v58 = CGRectInset(v57, v37, v37);
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;
  if (a6 == 2)
  {
    objc_msgSend_objectAtIndexedSubscript_(v15, v38, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v43, v44, v45);
    v47 = v46;
    v49 = v48;

    CGAffineTransformMakeScale(&v56, 1.0 / v27, 1.0 / v29);
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    v60 = CGRectApplyAffineTransform(v59, &v56);
    v50 = v60.origin.x;
    v51 = v60.origin.y;
    v52 = v60.size.width;
    v53 = v60.size.height;
    CGAffineTransformMakeScale(&v55, v47, v49);
    v61.origin.x = v50;
    v61.origin.y = v51;
    v61.size.width = v52;
    v61.size.height = v53;
    *(_QWORD *)&x = (unint64_t)CGRectApplyAffineTransform(v61, &v55);
  }

  return x;
}

double sub_24B6B93D4(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, uint64_t a8, void *a9)
{
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  __int16 v20;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v35;
  float v36;
  CGFloat v37;
  const char *v38;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v15 = a9;
  objc_msgSend_objectForKeyedSubscript_(a7, v16, (uint64_t)CFSTR("SparseRenderer::kMaxBlur_ushort"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_unsignedShortValue(v17, v18, v19);

  _H14 = v20;
  objc_msgSend_objectAtIndexedSubscript_(v15, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v23, v24, v25);
  v27 = v26;
  v29 = v28;

  __asm { FCVT            S0, H14 }
  if (v27 >= v29)
    v35 = v27;
  else
    v35 = v29;
  v36 = v35;
  v37 = (float)-(float)(_S0 * v36);
  v57.origin.x = a1;
  v57.origin.y = a2;
  v57.size.width = a3;
  v57.size.height = a4;
  v58 = CGRectInset(v57, v37, v37);
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;
  if (a6 == 1)
  {
    objc_msgSend_objectAtIndexedSubscript_(v15, v38, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v43, v44, v45);
    v47 = v46;
    v49 = v48;

    CGAffineTransformMakeScale(&v56, 1.0 / v27, 1.0 / v29);
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    v60 = CGRectApplyAffineTransform(v59, &v56);
    v50 = v60.origin.x;
    v51 = v60.origin.y;
    v52 = v60.size.width;
    v53 = v60.size.height;
    CGAffineTransformMakeScale(&v55, v47, v49);
    v61.origin.x = v50;
    v61.origin.y = v51;
    v61.size.width = v52;
    v61.size.height = v53;
    *(_QWORD *)&x = (unint64_t)CGRectApplyAffineTransform(v61, &v55);
  }

  return x;
}

double sub_24B6B957C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, uint64_t a8, void *a9)
{
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  __int16 v20;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v35;
  float v36;
  CGFloat v37;
  const char *v38;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v15 = a9;
  objc_msgSend_objectForKeyedSubscript_(a7, v16, (uint64_t)CFSTR("SparseRenderer::kMaxBlur_ushort"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_unsignedShortValue(v17, v18, v19);

  _H14 = v20;
  objc_msgSend_objectAtIndexedSubscript_(v15, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v23, v24, v25);
  v27 = v26;
  v29 = v28;

  __asm { FCVT            S0, H14 }
  if (v27 >= v29)
    v35 = v27;
  else
    v35 = v29;
  v36 = v35;
  v37 = (float)-(float)(_S0 * v36);
  v57.origin.x = a1;
  v57.origin.y = a2;
  v57.size.width = a3;
  v57.size.height = a4;
  v58 = CGRectInset(v57, v37, v37);
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;
  if (a6 == 1)
  {
    objc_msgSend_objectAtIndexedSubscript_(v15, v38, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v43, v44, v45);
    v47 = v46;
    v49 = v48;

    CGAffineTransformMakeScale(&v56, 1.0 / v27, 1.0 / v29);
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    v60 = CGRectApplyAffineTransform(v59, &v56);
    v50 = v60.origin.x;
    v51 = v60.origin.y;
    v52 = v60.size.width;
    v53 = v60.size.height;
    CGAffineTransformMakeScale(&v55, v47, v49);
    v61.origin.x = v50;
    v61.origin.y = v51;
    v61.size.width = v52;
    v61.size.height = v53;
    *(_QWORD *)&x = (unint64_t)CGRectApplyAffineTransform(v61, &v55);
  }

  return x;
}

CGFloat sub_24B6B9724(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, void *a7)
{
  void *v11;
  const char *v12;
  uint64_t v13;
  float v14;
  float v15;
  CGRect v17;

  if ((_DWORD)a6 != 1)
  {
    objc_msgSend_objectForKeyedSubscript_(a7, a6, (uint64_t)CFSTR("SparseRenderer::kAntiAliasRadius"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v11, v12, v13);
    v15 = v14;

    v17.origin.x = a1;
    v17.origin.y = a2;
    v17.size.width = a3;
    v17.size.height = a4;
    *(_QWORD *)&a1 = (unint64_t)CGRectInset(v17, (float)-v15, 0.0);
  }
  return a1;
}

CGFloat sub_24B6B97D4(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, void *a7)
{
  void *v11;
  const char *v12;
  uint64_t v13;
  float v14;
  float v15;
  CGRect v17;

  if ((_DWORD)a6 != 1)
  {
    objc_msgSend_objectForKeyedSubscript_(a7, a6, (uint64_t)CFSTR("SparseRenderer::kAntiAliasRadius"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v11, v12, v13);
    v15 = v14;

    v17.origin.x = a1;
    v17.origin.y = a2;
    v17.size.width = a3;
    v17.size.height = a4;
    *(_QWORD *)&a1 = (unint64_t)CGRectInset(v17, 0.0, (float)-v15);
  }
  return a1;
}

double sub_24B6B9884(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, void *a10)
{
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  float v20;
  float v21;
  const char *v22;
  uint64_t v23;
  float v24;
  float v25;
  double result;
  CGRect v27;

  v15 = a10;
  objc_msgSend_objectForKeyedSubscript_(a8, v16, (uint64_t)CFSTR("inputBlurRadius"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v17, v18, v19);
  v21 = v20;
  objc_msgSend_floatValue(v15, v22, v23);
  v25 = v24;

  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v27, (float)((float)(v21 * -3.0) * v25), 0.0);
  return result;
}

double sub_24B6B9928(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, void *a10)
{
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  float v20;
  float v21;
  const char *v22;
  uint64_t v23;
  float v24;
  float v25;
  double result;
  CGRect v27;

  v15 = a10;
  objc_msgSend_objectForKeyedSubscript_(a8, v16, (uint64_t)CFSTR("inputBlurRadius"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v17, v18, v19);
  v21 = v20;
  objc_msgSend_floatValue(v15, v22, v23);
  v25 = v24;

  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v27, 0.0, (float)((float)(v21 * -3.0) * v25));
  return result;
}

CGFloat sub_24B6B99CC(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6)
{
  CGAffineTransform v11;
  CGRect v12;

  if (a6 == 1)
  {
    CGAffineTransformMakeScale(&v11, 2.0, 2.0);
    v12.origin.x = a1;
    v12.origin.y = a2;
    v12.size.width = a3;
    v12.size.height = a4;
    *(_QWORD *)&a1 = (unint64_t)CGRectApplyAffineTransform(v12, &v11);
  }
  return a1;
}

CGFloat sub_24B6B9A54(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18;
  id v19;
  id v20;
  id v21;
  CGAffineTransform v23;
  CGRect v24;

  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  if (a6 == 2)
    goto LABEL_5;
  if (a6 != 1)
  {
    if (!a6)
    {
      CGAffineTransformMakeScale(&v23, 0.5, 0.5);
      v24.origin.x = a1;
      v24.origin.y = a2;
      v24.size.width = a3;
      v24.size.height = a4;
      *(_QWORD *)&a1 = (unint64_t)CGRectApplyAffineTransform(v24, &v23);
      goto LABEL_6;
    }
LABEL_5:
    a1 = *MEMORY[0x24BDBF070];
  }
LABEL_6:

  return a1;
}

CGFloat sub_24B6B9B58(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, unsigned int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18;
  id v19;
  id v20;
  const char *v21;
  id v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGAffineTransform *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGRect v41;

  v18 = a7;
  v19 = a8;
  v20 = a9;
  v22 = a10;
  if (a6 == 3)
  {
    CGAffineTransformMakeScale(&v40, 0.5, 0.5);
    v30 = &v40;
LABEL_8:
    v41.origin.x = a1;
    v41.origin.y = a2;
    v41.size.width = a3;
    v41.size.height = a4;
    *(_QWORD *)&a1 = (unint64_t)CGRectApplyAffineTransform(v41, v30);
    goto LABEL_9;
  }
  if (a6 != 2)
  {
    if ((a6 & 0x80000000) != 0)
    {
      v27 = *(double *)(MEMORY[0x24BDBF070] + 16);
      v29 = *(double *)(MEMORY[0x24BDBF070] + 24);
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(v20, v21, a6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CGRectValue(v23, v24, v25);
      v27 = v26;
      v29 = v28;

    }
    objc_msgSend_objectAtIndexedSubscript_(v20, v21, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v31, v32, v33);
    v35 = v34;
    v37 = v36;

    CGAffineTransformMakeScale(&v39, v27 / v35, v29 / v37);
    v30 = &v39;
    goto LABEL_8;
  }
LABEL_9:

  return a1;
}

double sub_24B6BB644(void *a1)
{
  id v1;
  const char *v2;
  const char *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;

  v1 = a1;
  if (objc_msgSend_conformsToProtocol_(v1, v2, (uint64_t)&unk_2579B9140))
  {
    v5 = v1;
    v8 = (double)(unint64_t)objc_msgSend_width(v5, v6, v7);
    objc_msgSend_height(v5, v9, v10);

  }
  else
  {
    objc_msgSend_extent(v1, v3, v4);
    v8 = v11;
  }

  return v8;
}

void sub_24B6BC988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a60, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24B6BC9EC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_24B6BC9FC(uint64_t a1)
{

}

id sub_24B6BCA04(_QWORD *a1)
{
  uint64_t v1;

  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = (*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) & 1) == 0;
  if (*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
    v1 = a1[6];
  else
    v1 = a1[5];
  return *(id *)(*(_QWORD *)(v1 + 8) + 40);
}

id sub_24B6BCA44(void *a1, double a2, double a3, float a4, float a5)
{
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  double v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  double v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  id v41;
  _QWORD v43[4];
  _QWORD v44[5];

  v44[4] = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  objc_msgSend_extent(v9, v10, v11);
  v13 = a2 / v12;
  objc_msgSend_extent(v9, v14, v15);
  v19 = a3 / v18;
  if (fabs(v13 + -1.0) >= 0.0001 || fabs(v19 + -1.0) >= 0.0001)
  {
    objc_msgSend_imageByClampingToExtent(v9, v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v43[0] = CFSTR("inputScale");
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v21, v22, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v23;
    v43[1] = CFSTR("inputAspectRatio");
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v24, v25, v13 / v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v26;
    v43[2] = CFSTR("inputB");
    *(float *)&v27 = a4;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v28, v29, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v30;
    v43[3] = CFSTR("inputC");
    *(float *)&v31 = a5;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v32, v33, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v34;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)v44, v43, 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingFilter_withInputParameters_(v20, v37, (uint64_t)CFSTR("CIBicubicScaleTransform"), v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_imageByCroppingToRect_(v38, v39, v40, 0.0, 0.0, a2, a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
      sub_24B6EDB80();
  }
  v41 = v9;

  return v41;
}

double sub_24B6BE988(void *a1)
{
  id v1;
  const char *v2;
  const char *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  double v11;

  v1 = a1;
  if (objc_msgSend_conformsToProtocol_(v1, v2, (uint64_t)&unk_2579B9140))
  {
    v5 = v1;
    objc_msgSend_width(v5, v6, v7);
    objc_msgSend_height(v5, v8, v9);

    v10 = 0.0;
  }
  else
  {
    objc_msgSend_extent(v1, v3, v4);
    v10 = v11;
  }

  return v10;
}

void sub_24B6BF680()
{
  id v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  v2 = (void *)objc_msgSend_initWithSuiteName_(v0, v1, (uint64_t)CFSTR("com.apple.coremedia"));
  if (v2)
  {
    v12 = v2;
    objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("sdof_max_nrings"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v11 = v8;
        dword_2579AEA38 = objc_msgSend_intValue(v8, v9, v10);

      }
    }

    v2 = v12;
  }

}

BOOL sub_24B6BF704(const CGImageMetadata *a1, void *a2, _DWORD *a3)
{
  id v5;
  CGImageMetadataTag *v6;
  CGImageMetadataTag *v7;
  CFTypeID v8;
  BOOL v9;
  const char *v10;
  uint64_t v11;
  _BOOL8 v12;

  v5 = a2;
  if (a3 && (*a3 = 0, (v6 = sub_24B6BF78C(a1, v5)) != 0))
  {
    v7 = v6;
    v8 = CFGetTypeID(v6);
    v9 = v8 == CFStringGetTypeID();
    v12 = v9;
    if (v9)
      *a3 = objc_msgSend_intValue(v7, v10, v11);
    CFRelease(v7);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

CGImageMetadataTag *sub_24B6BF78C(const CGImageMetadata *a1, void *a2)
{
  const __CFString *v3;
  __CFString *v4;
  CGImageMetadataTag *v5;
  CGImageMetadataTag *v6;
  CGImageMetadataTag *v7;
  CGImageMetadataTag *v8;
  CFTypeID v9;
  CFTypeID TypeID;

  v3 = a2;
  v4 = (__CFString *)v3;
  v5 = 0;
  if (a1 && v3)
  {
    v6 = CGImageMetadataCopyTagWithPath(a1, 0, v3);
    if (!v6)
    {
LABEL_7:
      v5 = 0;
      goto LABEL_8;
    }
    v7 = v6;
    v8 = (CGImageMetadataTag *)CGImageMetadataTagCopyValue(v6);
    if (!v8 || (v5 = v8, v9 = CFGetTypeID(v8), TypeID = CFStringGetTypeID(), CFRelease(v7), v7 = v5, v9 != TypeID))
    {
      CFRelease(v7);
      goto LABEL_7;
    }
  }
LABEL_8:

  return v5;
}

BOOL sub_24B6BF828(const CGImageMetadata *a1, void *a2, _DWORD *a3)
{
  id v5;
  CGImageMetadataTag *v6;
  CGImageMetadataTag *v7;
  CFTypeID v8;
  BOOL v9;
  const char *v10;
  uint64_t v11;
  _BOOL8 v12;
  int v13;

  v5 = a2;
  if (a3 && (*a3 = 0, (v6 = sub_24B6BF78C(a1, v5)) != 0))
  {
    v7 = v6;
    v8 = CFGetTypeID(v6);
    v9 = v8 == CFStringGetTypeID();
    v12 = v9;
    if (v9)
    {
      objc_msgSend_floatValue(v7, v10, v11);
      *a3 = v13;
    }
    CFRelease(v7);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_24B6BF8B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_24B6C1674()
{
  id v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  v2 = (void *)objc_msgSend_initWithSuiteName_(v0, v1, (uint64_t)CFSTR("com.apple.coremedia"));
  v12 = v2;
  if (v2)
  {
    objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("maxBlurmapSize"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v11 = v8;
        qword_2579AEA40 = objc_msgSend_unsignedLongValue(v8, v9, v10);

      }
    }
  }
  else
  {
    v7 = 0;
  }

}

double sub_24B6C22B4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;

  objc_msgSend_objectAtIndexedSubscript_(a5, a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v5, v6, v7);
  v9 = v8;

  return v9;
}

double sub_24B6C2318(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  id v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  float v41;
  double v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  float v47;
  double v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  float v53;
  double v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  float v59;
  double v60;
  const char *v61;
  uint64_t v62;
  unint64_t v63;
  const char *v64;
  uint64_t v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  CGAffineTransform v81;
  _OWORD v82[3];
  uint64_t v83;
  CGRect v84;
  CGRect v85;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14 = a6;
  if (a2)
  {
    if (!v11)
      sub_24B6EE350();
    objc_msgSend_objectForKeyedSubscript_(v11, v13, (uint64_t)CFSTR("inputParams"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      sub_24B6EE378();
    v16 = (void *)v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_length(v16, v17, v18) != 56)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        sub_24B6EE4D8();
    }
    if (objc_msgSend_count(v12, v19, v20) != 2)
      sub_24B6EE4B0();
    objc_msgSend_objectAtIndexedSubscript_(v12, v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v22, v23, v24);
    v26 = v25;
    v28 = v27;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v16, v29, (uint64_t)CFSTR("height"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
        sub_24B6EE3A0();

      objc_msgSend_objectForKeyedSubscript_(v16, v31, (uint64_t)CFSTR("width"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
        sub_24B6EE3C8();

      objc_msgSend_objectForKeyedSubscript_(v16, v33, (uint64_t)CFSTR("left"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
        sub_24B6EE3F0();

      objc_msgSend_objectForKeyedSubscript_(v16, v35, (uint64_t)CFSTR("top"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
        sub_24B6EE418();

      objc_msgSend_objectForKeyedSubscript_(v16, v37, (uint64_t)CFSTR("left"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v38, v39, v40);
      v42 = v41;
      objc_msgSend_objectForKeyedSubscript_(v16, v43, (uint64_t)CFSTR("top"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v44, v45, v46);
      v48 = v47;
      objc_msgSend_objectForKeyedSubscript_(v16, v49, (uint64_t)CFSTR("width"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v50, v51, v52);
      v54 = v53;
      objc_msgSend_objectForKeyedSubscript_(v16, v55, (uint64_t)CFSTR("height"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v56, v57, v58);
      v60 = v59;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v16, v64, v65) == 56)
      {
        v83 = 0;
        memset(v82, 0, sizeof(v82));
        v66 = v16;
        v69 = objc_msgSend_length(v66, v67, v68);
        objc_msgSend_getBytes_range_(v66, v70, (uint64_t)v82, 0, v69);

        v42 = *(float *)v82;
        v48 = *((float *)v82 + 1);
        v54 = *((float *)v82 + 2);
        v60 = *((float *)v82 + 3);
      }
      else
      {
        uni_logger_api();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          sub_24B6EE440(v71, v72, v73, v74, v75, v76, v77, v78);

        v54 = 0.100000001;
        v42 = 0.449999988;
        v48 = 0.449999988;
        v60 = 0.100000001;
      }
    }
    CGAffineTransformMakeScale(&v81, v26, v28);
    v84.origin.x = v42;
    v84.origin.y = v48;
    v84.size.width = v54;
    v84.size.height = v60;
    v85 = CGRectApplyAffineTransform(v84, &v81);
    v63 = (unint64_t)CGRectInset(v85, -1.0, -1.0);
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v12, v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v16, v61, v62);
  }
  v79 = *(double *)&v63;

  return v79;
}

double sub_24B6C26B8(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  id v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  float v41;
  double v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  float v47;
  double v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  float v53;
  double v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  float v59;
  double v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  double v64;
  double v65;
  const char *v66;
  uint64_t v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  id v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  int v89;
  uint64_t v90;
  int32x2_t *v91;
  float32x2_t v92;
  float32x2_t v93;
  float32x2_t v94;
  unsigned int v95;
  int8x8_t v96;
  double y;
  double x;
  double width;
  double height;
  double v102;
  double v103;
  CGAffineTransform v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14 = a6;
  if (a2)
  {
    if (!v11)
      sub_24B6EE500();
    objc_msgSend_objectForKeyedSubscript_(v11, v13, (uint64_t)CFSTR("inputParams"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      sub_24B6EE528();
    v16 = (void *)v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_length(v16, v17, v18) != 56)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        sub_24B6EE688();
    }
    if (objc_msgSend_count(v12, v19, v20) != 2)
      sub_24B6EE660();
    objc_msgSend_objectAtIndexedSubscript_(v12, v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v22, v23, v24);
    v26 = v25;
    v28 = v27;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v16, v29, (uint64_t)CFSTR("height"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
        sub_24B6EE550();

      objc_msgSend_objectForKeyedSubscript_(v16, v31, (uint64_t)CFSTR("width"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
        sub_24B6EE578();

      objc_msgSend_objectForKeyedSubscript_(v16, v33, (uint64_t)CFSTR("left"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
        sub_24B6EE5A0();

      objc_msgSend_objectForKeyedSubscript_(v16, v35, (uint64_t)CFSTR("top"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
        sub_24B6EE5C8();

      objc_msgSend_objectForKeyedSubscript_(v16, v37, (uint64_t)CFSTR("left"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v38, v39, v40);
      v42 = v41;
      objc_msgSend_objectForKeyedSubscript_(v16, v43, (uint64_t)CFSTR("top"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v44, v45, v46);
      v48 = v47;
      objc_msgSend_objectForKeyedSubscript_(v16, v49, (uint64_t)CFSTR("width"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v50, v51, v52);
      v54 = v53;
      objc_msgSend_objectForKeyedSubscript_(v16, v55, (uint64_t)CFSTR("height"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v56, v57, v58);
      v60 = v59;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v16, v66, v67) == 56)
      {
        *(_QWORD *)&v108 = 0;
        v106 = 0u;
        v107 = 0u;
        v105 = 0u;
        v68 = v16;
        v71 = objc_msgSend_length(v68, v69, v70);
        objc_msgSend_getBytes_range_(v68, v72, (uint64_t)&v105, 0, v71);

        v42 = *(float *)&v105;
        v48 = *((float *)&v105 + 1);
        v54 = *((float *)&v105 + 2);
        v60 = *((float *)&v105 + 3);
      }
      else
      {
        uni_logger_api();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          sub_24B6EE5F0(v73, v74, v75, v76, v77, v78, v79, v80);

        v60 = 0.0;
        v54 = 0.0;
        v48 = 0.0;
        v42 = 0.0;
      }
    }
    objc_msgSend_objectForKeyedSubscript_(v11, v61, (uint64_t)CFSTR("inputEyes"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v81)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v81, v82, v83) == 72)
      {
        v102 = v28;
        v103 = v26;
        v84 = v81;
        v109 = 0;
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v87 = objc_msgSend_length(v84, v85, v86);
        objc_msgSend_getBytes_range_(v84, v88, (uint64_t)&v105, 0, v87);
        v89 = v109;
        if ((int)v109 < 1)
        {
          height = v60;
          width = v54;
          y = v48;
          x = v42;
        }
        else
        {
          v90 = 0;
          do
          {
            v91 = (int32x2_t *)&v105 + v90;
            v92 = (float32x2_t)*v91;
            v93 = (float32x2_t)v91[4];
            v94 = (float32x2_t)vzip2_s32((int32x2_t)v93, *v91);
            if ((vcgt_f32(v93, (float32x2_t)*v91).u8[0] & 1) != 0)
              v95 = -1;
            else
              v95 = 0;
            v96 = vbsl_s8((int8x8_t)vdup_n_s32(v95), (int8x8_t)v92, (int8x8_t)v93);
            y = *(float *)&v96.i32[1];
            x = *(float *)v96.i32;
            width = fabsf(vsub_f32(v93, v92).f32[0]);
            height = fabsf(vsub_f32(v94, (float32x2_t)vdup_lane_s32((int32x2_t)v94, 1)).f32[0]);
            if (v90)
            {
              v110.origin.x = v42;
              v110.origin.y = v48;
              v110.size.width = v54;
              v110.size.height = v60;
              v114.origin.x = x;
              v114.origin.y = y;
              v114.size.width = width;
              v114.size.height = height;
              v111 = CGRectUnion(v110, v114);
              x = v111.origin.x;
              y = v111.origin.y;
              width = v111.size.width;
              height = v111.size.height;
              v89 = v109;
            }
            ++v90;
            v42 = x;
            v48 = y;
            v54 = width;
            v60 = height;
          }
          while (v90 < v89);
        }

        v60 = height;
        v54 = width;
        v48 = y;
        v42 = x;
        v28 = v102;
        v26 = v103;
      }
    }
    CGAffineTransformMakeScale(&v104, v26, v28);
    v112.origin.x = v42;
    v112.origin.y = v48;
    v112.size.width = v54;
    v112.size.height = v60;
    v113 = CGRectApplyAffineTransform(v112, &v104);
    *(_QWORD *)&v65 = (unint64_t)CGRectInset(v113, -1.0, -1.0);

  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v12, v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v16, v62, v63);
    v65 = v64;
  }

  return v65;
}

double sub_24B6C2BD0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  const char *v21;
  uint64_t v22;
  float v23;
  CGFloat v24;
  const char *v25;
  uint64_t v26;
  float v27;
  float v28;
  double v29;
  CGAffineTransform v31;
  CGRect v32;

  v7 = a2;
  v8 = a6;
  objc_msgSend_objectAtIndexedSubscript_(a5, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v10, v11, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend_floatValue(v8, v21, v22);
  v24 = (float)(1.0 / v23);
  objc_msgSend_floatValue(v8, v25, v26);
  v28 = v27;

  CGAffineTransformMakeScale(&v31, v24, (float)(1.0 / v28));
  v32.origin.x = v14;
  v32.origin.y = v16;
  v32.size.width = v18;
  v32.size.height = v20;
  *(_QWORD *)&v29 = (unint64_t)CGRectApplyAffineTransform(v32, &v31);

  return v29;
}

void sub_24B6C2CE4()
{
  id v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  v2 = (void *)objc_msgSend_initWithSuiteName_(v0, v1, (uint64_t)CFSTR("com.apple.coremedia"));
  if (v2)
  {
    v12 = v2;
    objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("fullRect"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v11 = v8;
        byte_2579AEB70 = objc_msgSend_BOOLValue(v8, v9, v10);

      }
    }

    v2 = v12;
  }

}

double sub_24B6C2D68(double a1, uint64_t a2, int a3, void *a4, void *a5, void *a6, void *a7)
{
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  CGFloat y;
  double x;
  CGFloat height;
  CGFloat width;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  float v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  float v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  BOOL v52;
  CGFloat v53;
  CGFloat v54;
  BOOL v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  BOOL v60;
  CGFloat v63;
  CGFloat v64;
  float v65;
  float v66;
  float v67;
  float v68;
  _OWORD v69[12];
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (!v12)
    sub_24B6EE6B0();
  v16 = v14;
  objc_msgSend_objectForKeyedSubscript_(v12, v15, (uint64_t)CFSTR("faceParams"));
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
    sub_24B6EE6D8();
  v18 = (void *)v17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    sub_24B6EE728();
  memset(v69, 0, sizeof(v69));
  if (byte_2579AEB70)
  {
    objc_msgSend_objectAtIndexedSubscript_(v13, v19, a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v21, v22, v23);
    v25 = v24;

  }
  else
  {
    if (objc_msgSend_length(v18, v19, v20) != 192)
      sub_24B6EE700();
    objc_msgSend_getBytes_length_(v18, v26, (uint64_t)v69, 192);
    x = *MEMORY[0x24BDBF070];
    y = *(double *)(MEMORY[0x24BDBF070] + 8);
    width = *(double *)(MEMORY[0x24BDBF070] + 16);
    height = *(double *)(MEMORY[0x24BDBF070] + 24);
    objc_msgSend_objectAtIndexedSubscript_(v13, v31, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v32, v33, v34);
    v36 = v35;
    v66 = v36;

    objc_msgSend_objectAtIndexedSubscript_(v13, v37, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v38, v39, v40);
    v42 = v41;
    v65 = v42;

    v43 = 0;
    v44 = 0;
    v45 = 1.0;
    do
    {
      v46 = *(float *)(((unint64_t)v69 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3))) + 0x40);
      v47 = *(float *)(((unint64_t)v69 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3))) + 0x50);
      v48 = *(float *)(((unint64_t)v69 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3))) + 0x60);
      v49 = *(float *)(((unint64_t)v69 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3))) + 0x10);
      v50 = *(float *)(((unint64_t)v69 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3))) + 0x20);
      v67 = v49;
      v68 = v50;
      if (v46 <= v45)
      {
        v51 = *(float *)(((unint64_t)v69 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3))) + 0x30);
        v52 = v51 < 0.0 || v51 > v45;
        if (!v52 && v46 >= 0.0)
        {
          v53 = x;
          v54 = y;
          v63 = width;
          v64 = height;
          v70.origin.x = (float)(v51 * v66);
          v70.origin.y = (float)(v46 * v65);
          v70.size.width = 0.0;
          v70.size.height = 0.0;
          v71 = CGRectInset(v70, -0.5, -0.5);
          x = v71.origin.x;
          y = v71.origin.y;
          width = v71.size.width;
          height = v71.size.height;
          if (v43)
          {
            ++v43;
            v72.origin.x = v53;
            v72.origin.y = v54;
            v72.size.width = v63;
            v72.size.height = v64;
            v82.origin.x = x;
            v82.origin.y = y;
            v82.size.width = width;
            v82.size.height = height;
            v73 = CGRectUnion(v72, v82);
            x = v73.origin.x;
            y = v73.origin.y;
            width = v73.size.width;
            height = v73.size.height;
          }
          else
          {
            v43 = 1;
          }
          v45 = 1.0;
          v49 = v67;
          v50 = v68;
        }
      }
      if (v48 > v45 || (v47 >= 0.0 ? (v55 = v47 > v45) : (v55 = 1), v55 || v48 < 0.0))
      {
        v59 = height;
        v58 = width;
        v57 = y;
        v56 = x;
      }
      else
      {
        v74.origin.x = (float)(v47 * v66);
        v74.origin.y = (float)(v48 * v65);
        v74.size.width = 0.0;
        v74.size.height = 0.0;
        v75 = CGRectInset(v74, -0.5, -0.5);
        v56 = v75.origin.x;
        v57 = v75.origin.y;
        v58 = v75.size.width;
        v59 = v75.size.height;
        if (v43)
        {
          ++v43;
          v76.origin.x = x;
          v76.origin.y = y;
          v76.size.width = width;
          v76.size.height = height;
          v83.origin.x = v56;
          v83.origin.y = v57;
          v83.size.width = v58;
          v83.size.height = v59;
          v77 = CGRectUnion(v76, v83);
          v56 = v77.origin.x;
          v57 = v77.origin.y;
          v58 = v77.size.width;
          v59 = v77.size.height;
        }
        else
        {
          v43 = 1;
        }
        v45 = 1.0;
        v49 = v67;
        v50 = v68;
      }
      if (v50 > v45 || (v49 >= 0.0 ? (v60 = v49 > v45) : (v60 = 1), v60 || v50 < 0.0))
      {
        height = v59;
        width = v58;
        y = v57;
        x = v56;
      }
      else
      {
        v78.origin.x = (float)(v49 * v66);
        v78.origin.y = (float)(v50 * v65);
        v78.size.width = 0.0;
        v78.size.height = 0.0;
        v79 = CGRectInset(v78, -0.5, -0.5);
        x = v79.origin.x;
        y = v79.origin.y;
        width = v79.size.width;
        height = v79.size.height;
        if (v43)
        {
          ++v43;
          v80.origin.x = v56;
          v80.origin.y = v57;
          v80.size.width = v58;
          v80.size.height = v59;
          v84.origin.x = x;
          v84.origin.y = y;
          v84.size.width = width;
          v84.size.height = height;
          v81 = CGRectUnion(v80, v84);
          x = v81.origin.x;
          y = v81.origin.y;
          width = v81.size.width;
          height = v81.size.height;
        }
        else
        {
          v43 = 1;
        }
        v45 = 1.0;
      }
      ++v44;
    }
    while (v44 != 4);
    if (v43)
      v25 = x;
    else
      v25 = a1;
  }

  return v25;
}

CGFloat sub_24B6C31B0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, uint64_t a7, void *a8, void *a9)
{
  int v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGRect v37;

  v9 = (int)a6;
  if (a6 <= 1)
  {
    objc_msgSend_objectAtIndexedSubscript_(a9, a6, a6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v10, v11, v12);
LABEL_14:
    a1 = v13;
    goto LABEL_15;
  }
  objc_msgSend_objectForKeyedSubscript_(a8, a6, (uint64_t)CFSTR("params"));
  v18 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v18;
  if ((v9 - 3) > 1)
    goto LABEL_12;
  if (!v18)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_length(v10, v19, v20) != 160)
    goto LABEL_12;
  v23 = objc_msgSend_length(v10, v21, v22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          0,
          0,
          0,
          0);
  objc_msgSend_getBytes_range_(v10, v24, (uint64_t)&v34, 0, v23);
  if (v9 == 3)
  {
    _H0 = WORD2(v36);
    __asm { FCVT            S0, H0 }
    if (_S0 <= 0.0)
      goto LABEL_11;
  }
  if (v9 != 4)
    goto LABEL_12;
  _H0 = WORD2(v35);
  __asm { FCVT            S0, H0 }
  if (_S0 <= 0.0)
  {
LABEL_11:
    a1 = *MEMORY[0x24BDBF090];
  }
  else
  {
LABEL_12:
    if (v9 == 3)
    {
      v37.origin.x = a1;
      v37.origin.y = a2;
      v37.size.width = a3;
      v37.size.height = a4;
      *(_QWORD *)&v13 = (unint64_t)CGRectInset(v37, -3.0, -3.0);
      goto LABEL_14;
    }
  }
LABEL_15:

  return a1;
}

CGFloat sub_24B6C333C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, unsigned int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18;
  id v19;
  id v20;
  const char *v21;
  id v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  CGRect v28;

  v18 = a7;
  v19 = a8;
  v20 = a9;
  v22 = a10;
  if (a6 > 1)
  {
    if (a6 - 3 <= 1)
    {
      v28.origin.x = a1;
      v28.origin.y = a2;
      v28.size.width = a3;
      v28.size.height = a4;
      *(_QWORD *)&a1 = (unint64_t)CGRectInset(v28, -3.0, -3.0);
    }
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v20, v21, a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v23, v24, v25);
    a1 = v26;

  }
  return a1;
}

double sub_24B6C3464(double a1, uint64_t a2, int a3, void *a4, void *a5, void *a6, void *a7)
{
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  float v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  float v42;
  CGFloat v43;
  CGFloat v44;
  uint64_t v45;
  uint64_t v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  BOOL v52;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL v57;
  unint64_t v58;
  CGFloat v61;
  CGFloat v62;
  float v63;
  float v64;
  _OWORD v65[12];
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (!v12)
    sub_24B6EE750();
  v16 = v14;
  objc_msgSend_objectForKeyedSubscript_(v12, v15, (uint64_t)CFSTR("inputParams"));
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
    sub_24B6EE778();
  v18 = (void *)v17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    sub_24B6EE7C8();
  memset(v65, 0, sizeof(v65));
  if (byte_2579AEB70)
  {
    objc_msgSend_objectAtIndexedSubscript_(v13, v19, a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v21, v22, v23);
    v25 = v24;

  }
  else
  {
    if (objc_msgSend_length(v18, v19, v20) != 192)
      sub_24B6EE7A0();
    objc_msgSend_getBytes_length_(v18, v26, (uint64_t)v65, 192);
    v28 = *MEMORY[0x24BDBF070];
    v27 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v29 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v30 = *(double *)(MEMORY[0x24BDBF070] + 24);
    objc_msgSend_objectAtIndexedSubscript_(v13, v31, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v32, v33, v34);
    v36 = v35;
    v64 = v36;

    objc_msgSend_objectAtIndexedSubscript_(v13, v37, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v38, v39, v40);
    v42 = v41;
    v63 = v42;

    v43 = v30;
    v44 = v29;
    v45 = 0;
    v46 = 0;
    v47 = 1.0;
    do
    {
      v48 = *(float *)(((unint64_t)v65 & 0xFFFFFFFFFFFFFFF3 | (4 * (v46 & 3))) + 0x40);
      v49 = *(float *)(((unint64_t)v65 & 0xFFFFFFFFFFFFFFF3 | (4 * (v46 & 3))) + 0x50);
      v50 = *(float *)(((unint64_t)v65 & 0xFFFFFFFFFFFFFFF3 | (4 * (v46 & 3))) + 0x60);
      if (v48 > v47
        || ((v51 = *(float *)(((unint64_t)v65 & 0xFFFFFFFFFFFFFFF3 | (4 * (v46 & 3))) + 0x30), v51 >= 0.0)
          ? (v52 = v51 > v47)
          : (v52 = 1),
            v52 || v48 < 0.0))
      {
        height = v43;
        width = v44;
        y = v27;
        x = v28;
      }
      else
      {
        v61 = v43;
        v62 = v44;
        v66.origin.x = (float)(v51 * v64);
        v66.origin.y = (float)(v48 * v63);
        v66.size.width = 0.0;
        v66.size.height = 0.0;
        v67 = CGRectInset(v66, -0.5, -0.5);
        x = v67.origin.x;
        y = v67.origin.y;
        width = v67.size.width;
        height = v67.size.height;
        if (v45)
        {
          ++v45;
          v68.origin.x = v28;
          v68.origin.y = v27;
          v68.size.height = v61;
          v68.size.width = v62;
          v75.origin.x = x;
          v75.origin.y = y;
          v75.size.width = width;
          v75.size.height = height;
          v69 = CGRectUnion(v68, v75);
          x = v69.origin.x;
          y = v69.origin.y;
          width = v69.size.width;
          height = v69.size.height;
        }
        else
        {
          v45 = 1;
        }
        v47 = 1.0;
      }
      if (v50 > v47 || (v49 >= 0.0 ? (v57 = v49 > v47) : (v57 = 1), v57 || v50 < 0.0))
      {
        v43 = height;
        v44 = width;
        v27 = y;
        v28 = x;
      }
      else
      {
        v70.origin.x = (float)(v49 * v64);
        v70.origin.y = (float)(v50 * v63);
        v70.size.width = 0.0;
        v70.size.height = 0.0;
        v71 = CGRectInset(v70, -0.5, -0.5);
        v28 = v71.origin.x;
        v27 = v71.origin.y;
        v44 = v71.size.width;
        v43 = v71.size.height;
        if (v45)
        {
          ++v45;
          v72.origin.x = x;
          v72.origin.y = y;
          v72.size.width = width;
          v72.size.height = height;
          v76.origin.x = v28;
          v76.origin.y = v27;
          v76.size.width = v44;
          v76.size.height = v43;
          v73 = CGRectUnion(v72, v76);
          v28 = v73.origin.x;
          v27 = v73.origin.y;
          v44 = v73.size.width;
          v43 = v73.size.height;
        }
        else
        {
          v45 = 1;
        }
        v47 = 1.0;
      }
      ++v46;
    }
    while (v46 != 4);
    v74.origin.x = v28;
    v74.origin.y = v27;
    v74.size.width = v44;
    v74.size.height = v43;
    v58 = (unint64_t)CGRectInset(v74, -1.0, -1.0);
    if (v45)
      v25 = *(double *)&v58;
    else
      v25 = a1;
  }

  return v25;
}

double sub_24B6C3818(double a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;

  if (!(_DWORD)a3)
  {
    objc_msgSend_objectAtIndexedSubscript_(a6, a3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v7, v8, v9);
    a1 = v10;

  }
  return a1;
}

CGFloat sub_24B6C3894(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6)
{
  CGAffineTransform v11;
  CGRect v12;

  if (!a6)
  {
    CGAffineTransformMakeScale(&v11, 2.0, 2.0);
    v12.origin.x = a1;
    v12.origin.y = a2;
    v12.size.width = a3;
    v12.size.height = a4;
    *(_QWORD *)&a1 = (unint64_t)CGRectApplyAffineTransform(v12, &v11);
  }
  return a1;
}

double sub_24B6C3918(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  void *v12;
  const char *v13;
  uint64_t v14;
  float v15;
  float v16;
  double result;
  CGRect v18;

  objc_msgSend_objectForKeyedSubscript_(a8, a6, (uint64_t)CFSTR("windowSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v12, v13, v14);
  v16 = v15;

  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v18, (float)(v16 + -1.0) * -0.5, 0.0);
  return result;
}

double sub_24B6C39A4(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  void *v12;
  const char *v13;
  uint64_t v14;
  float v15;
  float v16;
  double result;
  CGRect v18;

  objc_msgSend_objectForKeyedSubscript_(a8, a6, (uint64_t)CFSTR("windowSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v12, v13, v14);
  v16 = v15;

  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v18, 0.0, (float)(v16 + -1.0) * -0.5);
  return result;
}

double sub_24B6C3A30(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  void *v12;
  const char *v13;
  uint64_t v14;
  float v15;
  float v16;
  double result;
  CGRect v18;

  objc_msgSend_objectForKeyedSubscript_(a8, a6, (uint64_t)CFSTR("windowSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v12, v13, v14);
  v16 = v15;

  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v18, (float)(v16 + -1.0) * -0.5, 0.0);
  return result;
}

double sub_24B6C3ABC(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  void *v12;
  const char *v13;
  uint64_t v14;
  float v15;
  float v16;
  double result;
  CGRect v18;

  objc_msgSend_objectForKeyedSubscript_(a8, a6, (uint64_t)CFSTR("windowSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v12, v13, v14);
  v16 = v15;

  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v18, 0.0, (float)(v16 + -1.0) * -0.5);
  return result;
}

double sub_24B6C3B48(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  void *v12;
  const char *v13;
  uint64_t v14;
  float v15;
  float v16;
  double result;
  CGRect v18;

  objc_msgSend_objectForKeyedSubscript_(a8, a6, (uint64_t)CFSTR("windowSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v12, v13, v14);
  v16 = v15;

  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v18, (float)(v16 + -1.0) * -0.5, 0.0);
  return result;
}

double sub_24B6C3BD4(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  void *v12;
  const char *v13;
  uint64_t v14;
  float v15;
  float v16;
  double result;
  CGRect v18;

  objc_msgSend_objectForKeyedSubscript_(a8, a6, (uint64_t)CFSTR("windowSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v12, v13, v14);
  v16 = v15;

  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v18, 0.0, (float)(v16 + -1.0) * -0.5);
  return result;
}

double sub_24B6C3C60(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, uint64_t a7, void *a8)
{
  void *v12;
  const char *v13;
  uint64_t v14;
  float v15;
  float v16;
  double result;
  CGRect v18;

  objc_msgSend_objectForKeyedSubscript_(a8, a6, (uint64_t)CFSTR("windowSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v12, v13, v14);
  v16 = v15;

  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v18, 0.0, (float)(v16 + -1.0) * -0.5);
  return result;
}

double sub_24B6C3CEC(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  float v19;
  CGFloat v20;
  const char *v21;
  uint64_t v22;
  float v23;
  double v24;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;

  v12 = a8;
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)CFSTR("inputScaleX"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v15, (uint64_t)CFSTR("inputScaleY"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_floatValue(v14, v17, v18);
  v20 = 1.0 / v19;
  objc_msgSend_floatValue(v16, v21, v22);
  CGAffineTransformMakeScale(&v26, v20, 1.0 / v23);
  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  v28 = CGRectApplyAffineTransform(v27, &v26);
  *(_QWORD *)&v24 = (unint64_t)CGRectInset(v28, -2.0, -2.0);

  return v24;
}

double sub_24B6C3DF0(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

id sub_24B6C3F48(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  void *v11;

  v4 = a2;
  if (v4)
  {
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v3, 125, a1, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5)
    {
      objc_msgSend_setUsage_(v5, v6, 19);
      v10 = (void *)objc_msgSend_newTextureWithDescriptor_(v4, v8, (uint64_t)v7);
      if (v10)
      {
        objc_msgSend_imageWithMTLTexture_(UniImage, v9, (uint64_t)v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

double sub_24B6C4D1C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, void *a10)
{
  id v15;
  const char *v16;
  uint64_t v17;
  float v18;
  float v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  float v24;
  float v25;
  double result;
  CGRect v27;

  v15 = a7;
  objc_msgSend_floatValue(a10, v16, v17);
  v19 = v18;
  objc_msgSend_objectForKeyedSubscript_(v15, v20, (uint64_t)CFSTR("DisparityRefinement::kRadius"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_floatValue(v21, v22, v23);
  v25 = v24;

  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v27, (float)-(float)(v19 * v25), 0.0);
  return result;
}

CGFloat sub_24B6C4DBC(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, uint64_t a8, uint64_t a9, void *a10)
{
  id v15;
  const char *v16;
  uint64_t v17;
  float v18;
  float v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  float v24;
  float v25;
  CGRect v27;

  if (a6 == 1)
  {
    v15 = a7;
    objc_msgSend_floatValue(a10, v16, v17);
    v19 = v18;
    objc_msgSend_objectForKeyedSubscript_(v15, v20, (uint64_t)CFSTR("DisparityRefinement::kRadius"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_floatValue(v21, v22, v23);
    v25 = v24;

    v27.origin.x = a1;
    v27.origin.y = a2;
    v27.size.width = a3;
    v27.size.height = a4;
    *(_QWORD *)&a1 = (unint64_t)CGRectInset(v27, 0.0, (float)-(float)(v19 * v25));
  }
  return a1;
}

CGFloat sub_24B6C4E88(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGAffineTransform *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGRect v53;

  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  if (!v20)
    sub_24B6EEAE8();
  v24 = v21;
  if (objc_msgSend_count(v20, v22, v23) != 3)
    sub_24B6EEB80();
  if (a6 != 2)
  {
    if (a6 == 1)
    {
      CGAffineTransformMakeScale(&v51, 2.0, 2.0);
      v41 = &v51;
      goto LABEL_8;
    }
    if (!a6)
    {
      objc_msgSend_objectAtIndexedSubscript_(v20, v25, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CGRectValue(v26, v27, v28);
      v30 = v29;
      v32 = v31;

      objc_msgSend_objectAtIndexedSubscript_(v20, v33, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CGRectValue(v34, v35, v36);
      v38 = v37;
      v40 = v39;

      CGAffineTransformMakeScale(&v52, v38 / v30, v40 / v32);
      v41 = &v52;
LABEL_8:
      v53.origin.x = a1;
      v53.origin.y = a2;
      v53.size.width = a3;
      v53.size.height = a4;
      *(_QWORD *)&a1 = (unint64_t)CGRectApplyAffineTransform(v53, v41);
      goto LABEL_12;
    }
    uni_logger_api();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      sub_24B6EEB10(v42, v43, v44, v45, v46, v47, v48, v49);

  }
LABEL_12:

  return a1;
}

double sub_24B6C502C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  float v33;
  float v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  unsigned int v45;
  float v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  float v52;
  float v53;
  const char *v54;
  float v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  double v60;
  double v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  CGFloat v77;
  CGFloat v78;
  double v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  CGFloat rect;
  CGAffineTransform v90;
  int v91;
  CGRect v92;
  CGRect v93;

  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  if (!v19)
    sub_24B6EEBA8();
  v23 = v21;
  objc_msgSend_objectForKeyedSubscript_(v19, v22, (uint64_t)CFSTR("outputDimension"));
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
    sub_24B6EEBD0();
  v25 = (void *)v24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    sub_24B6EEC90();
  if (!v20 || objc_msgSend_count(v20, v26, v27) != 2)
    sub_24B6EEBF8();
  v91 = 0;
  objc_msgSend_getBytes_length_(v25, v28, (uint64_t)&v91, 4);
  objc_msgSend_objectForKeyedSubscript_(v18, v29, (uint64_t)CFSTR("DisparityRefinement::kRadius"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v30, v31, v32);
  v34 = v33;

  objc_msgSend_objectForKeyedSubscript_(v18, v35, (uint64_t)CFSTR("DisparityRefinement::kOuterSamplingRadius_ushort"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  _H0 = objc_msgSend_unsignedShortValue(v36, v37, v38);
  __asm { FCVT            S8, H0 }

  LOWORD(v45) = v91;
  v46 = v34 * (float)v45;
  objc_msgSend_objectAtIndexedSubscript_(v20, v47, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v48, v49, v50);
  v52 = v51;
  v53 = v46 / v52;

  v55 = v53 * _S8;
  if (a6 == 1)
  {
    objc_msgSend_objectAtIndexedSubscript_(v20, v54, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v62, v63, v64);
    v66 = v65;
    rect = a4;
    v68 = v67;

    objc_msgSend_objectAtIndexedSubscript_(v20, v69, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v70, v71, v72);
    v74 = v73;
    v76 = v75;

    v77 = v74 / v66;
    v78 = v76 / v68;
    CGAffineTransformMakeScale(&v90, v77, v78);
    v92.origin.x = a1;
    v92.origin.y = a2;
    v92.size.width = a3;
    v92.size.height = rect;
    v93 = CGRectApplyAffineTransform(v92, &v90);
    *(CGRect *)&v57 = CGRectInset(v93, v77 * (float)-v55, v78 * (float)-v55);
    v56 = -2.5;
    v61 = -2.5;
    goto LABEL_10;
  }
  if (!a6)
  {
    v56 = (float)-v55;
    v57 = a1;
    v58 = a2;
    v59 = a3;
    v60 = a4;
    v61 = v56;
LABEL_10:
    *(_QWORD *)&v79 = (unint64_t)CGRectInset(*(CGRect *)&v57, v56, v61);
    goto LABEL_14;
  }
  uni_logger_api();
  v80 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    sub_24B6EEC20(v80, v81, v82, v83, v84, v85, v86, v87);

  v79 = *MEMORY[0x24BDBF070];
LABEL_14:

  return v79;
}

CGFloat sub_24B6C52F0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18;
  id v19;
  id v20;
  const char *v21;
  id v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  CGRect v28;

  v18 = a7;
  v19 = a8;
  v20 = a9;
  v22 = a10;
  if (a6)
  {
    if ((a6 & 0xFFFFFFFD) == 1)
    {
      v28.origin.x = a1;
      v28.origin.y = a2;
      v28.size.width = a3;
      v28.size.height = a4;
      *(_QWORD *)&a1 = (unint64_t)CGRectInset(v28, -2.0, -2.0);
    }
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v20, v21, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v23, v24, v25);
    a1 = v26;

  }
  return a1;
}

double sub_24B6C53F4(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, int a6, void *a7, void *a8, void *a9, void *a10)
{
  id v18;
  id v19;
  id v20;
  const char *v21;
  id v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  double v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  CGFloat v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  double v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGAffineTransform v54;
  CGRect v55;
  CGRect v56;

  v18 = a7;
  v19 = a8;
  v20 = a9;
  v22 = a10;
  if (a6 == 1)
  {
    objc_msgSend_objectAtIndexedSubscript_(v20, v21, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v28, v29, v30);
    v32 = v31;
    objc_msgSend_objectAtIndexedSubscript_(v20, v33, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v34, v35, v36);
    v38 = v32 / v37;

    objc_msgSend_objectAtIndexedSubscript_(v20, v39, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v40, v41, v42);
    v44 = v43;
    objc_msgSend_objectAtIndexedSubscript_(v20, v45, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CGRectValue(v46, v47, v48);
    v50 = v44 / v49;

    CGAffineTransformMakeScale(&v54, v38, v50);
    v55.origin.x = a1;
    v55.origin.y = a2;
    v55.size.width = a3;
    v55.size.height = a4;
    v56 = CGRectApplyAffineTransform(v55, &v54);
    v51 = -2.0;
    v52 = -2.0;
LABEL_7:
    *(_QWORD *)&v27 = (unint64_t)CGRectInset(v56, v51, v52);
    goto LABEL_8;
  }
  if (a6)
  {
    if ((a6 & 0xFFFFFFFE) != 2)
      abort();
    v51 = -2.0;
    v52 = -2.0;
    v56.origin.x = a1;
    v56.origin.y = a2;
    v56.size.width = a3;
    v56.size.height = a4;
    goto LABEL_7;
  }
  objc_msgSend_objectAtIndexedSubscript_(v20, v21, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v23, v24, v25);
  v27 = v26;

LABEL_8:
  return v27;
}

double sub_24B6C55C8(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -5.0, -1.0);
  return result;
}

double sub_24B6C55D4(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -5.0);
  return result;
}

double sub_24B6C55E0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  float v14;
  CGFloat v15;
  double result;
  CGRect v17;

  objc_msgSend_floatValue(a10, a6, a7);
  v15 = (float)-ceilf(v14 * 4.0);
  v17.origin.x = a1;
  v17.origin.y = a2;
  v17.size.width = a3;
  v17.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v17, v15, 0.0);
  return result;
}

double sub_24B6C5640(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, const char *a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  float v14;
  CGFloat v15;
  double result;
  CGRect v17;

  objc_msgSend_floatValue(a10, a6, a7);
  v15 = (float)-ceilf(v14 * 4.0);
  v17.origin.x = a1;
  v17.origin.y = a2;
  v17.size.width = a3;
  v17.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v17, 0.0, v15);
  return result;
}

void sub_24B6C7420()
{
  id v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  v2 = (void *)objc_msgSend_initWithSuiteName_(v0, v1, (uint64_t)CFSTR("com.apple.coremedia"));
  if (v2)
  {
    v12 = v2;
    objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("useEyeSLM"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v11 = v8;
        byte_2579AEB78 = 1;
        byte_2579AEB79 = objc_msgSend_BOOLValue(v8, v9, v10);

      }
    }

    v2 = v12;
  }

}

void sub_24B6C99F4()
{
  id v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  v2 = (void *)objc_msgSend_initWithSuiteName_(v0, v1, (uint64_t)CFSTR("com.apple.coremedia"));
  if (v2)
  {
    v12 = v2;
    objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("useGlasses"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v11 = v8;
        byte_2579AEA48 = objc_msgSend_BOOLValue(v8, v9, v10);

      }
    }

    v2 = v12;
  }

}

void sub_24B6CBC40()
{
  id v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  v2 = (void *)objc_msgSend_initWithSuiteName_(v0, v1, (uint64_t)CFSTR("com.apple.coremedia"));
  if (v2)
  {
    v12 = v2;
    objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("crispHair"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v11 = v8;
        byte_2579AEB80 = 1;
        byte_2579AEB81 = objc_msgSend_BOOLValue(v8, v9, v10);

      }
    }

    v2 = v12;
  }

}

void sub_24B6CBCD0()
{
  id v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  char isEqual;
  const char *v11;
  const char *v12;
  const char *v13;
  id v14;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  v2 = (void *)objc_msgSend_initWithSuiteName_(v0, v1, (uint64_t)CFSTR("com.apple.coremedia"));
  if (v2)
  {
    v14 = v2;
    objc_msgSend_dictionaryRepresentation(v2, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("doHairnet"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v8, v9, MEMORY[0x24BDBD1C8]);
    }
    else
    {
      v8 = 0;
      isEqual = objc_msgSend_isEqual_(0, v6, MEMORY[0x24BDBD1C8]);
    }
    if ((isEqual & 1) != 0
      || (objc_msgSend_isEqual_(v8, v11, (uint64_t)&unk_251C9CC60) & 1) != 0
      || objc_msgSend_isEqual_(v8, v11, (uint64_t)CFSTR("1")))
    {
      byte_2579AEB88 = 121;
    }
    if ((objc_msgSend_isEqual_(v8, v11, MEMORY[0x24BDBD1C0]) & 1) != 0
      || (objc_msgSend_isEqual_(v8, v12, (uint64_t)&unk_251C9CC30) & 1) != 0
      || objc_msgSend_isEqual_(v8, v13, (uint64_t)CFSTR("0")))
    {
      byte_2579AEB88 = 110;
    }

    v2 = v14;
  }

}

void sub_24B6CC480(uint64_t a1, void *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sortedArrayUsingComparator_(a2, (const char *)a2, (uint64_t)&unk_251C8F888);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v35, v39, 16);
  if (!v5)
  {
    v34 = 0;
LABEL_13:
    memset_pattern16((void *)(a1 + 64 * v34), &unk_24B6F56B0, ((unint64_t)(3 - v34) << 6) + 64);
    goto LABEL_14;
  }
  v8 = v5;
  v9 = 0;
  v10 = *(_QWORD *)v36;
  do
  {
    v11 = 0;
    v12 = v9;
    v13 = v9;
    v14 = 4 * v9;
    do
    {
      if (*(_QWORD *)v36 != v10)
        objc_enumerationMutation(v3);
      if (v13 + v11 <= 3)
      {
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
        v16 = (_QWORD *)(a1 + 16 * v14);
        objc_msgSend_centerPos(v15, v6, v7);
        *v16 = v17;
        v16[1] = v18;
        v19 = (_QWORD *)(a1 + 16 * (v14 + 1));
        objc_msgSend_leftEyeCenterPos(v15, v20, v21);
        *v19 = v22;
        v19[1] = v23;
        v24 = (_QWORD *)(a1 + 16 * (v14 + 2));
        objc_msgSend_rightEyeCenterPos(v15, v25, v26);
        *v24 = v27;
        v24[1] = v28;
        v29 = (_QWORD *)(a1 + 16 * (v14 + 3));
        objc_msgSend_chinCenterPos(v15, v30, v31);
        *v29 = v32;
        v29[1] = v33;
      }
      ++v11;
      v14 += 4;
    }
    while (v8 != v11);
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v35, v39, 16);
    v9 = v13 + v11;
  }
  while (v8);
  v34 = v12 + v11;
  if (v12 + (int)v11 <= 3)
    goto LABEL_13;
LABEL_14:

}

BOOL sub_24B6CD06C(uint64_t a1, char a2)
{
  return *(float *)(a1 + 4 * (a2 & 3) + 48) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 64) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 80) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 96) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 16) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 32) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 112) != -1.0
      && *(float *)(a1 + 4 * (a2 & 3) + 128) != -1.0;
}

uint64_t sub_24B6CD134(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v4 = a3;
  v5 = a2;
  objc_msgSend_leftEyeCenterPos(v5, v6, v7);
  v9 = v8;
  v11 = v10;
  objc_msgSend_rightEyeCenterPos(v5, v12, v13);
  v15 = v14;
  v17 = v16;

  objc_msgSend_leftEyeCenterPos(v4, v18, v19);
  v21 = v20;
  v23 = v22;
  objc_msgSend_rightEyeCenterPos(v4, v24, v25);
  v27 = v26;
  v29 = v28;

  v30 = (v9 - v15) * (v9 - v15) + (v11 - v17) * (v11 - v17);
  v31 = (v21 - v27) * (v21 - v27) + (v23 - v29) * (v23 - v29);
  if (v30 > v31)
    return -1;
  else
    return v30 < v31;
}

void sub_24B6CE8D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_24B6CE910(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  const char *v18;
  uint64_t v19;
  double v20;
  CGFloat v21;
  const char *v22;
  void *v23;
  CGAffineTransform v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDBF660];
  v2 = a1;
  objc_msgSend_metalTexture(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDBF8E8];
  v26[0] = *MEMORY[0x24BDBF8F8];
  v26[1] = v6;
  v27[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)v27, v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageWithMTLTexture_options_(v1, v12, (uint64_t)v5, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_region(v2, v14, v15);
  v17 = v16;
  objc_msgSend_region(v2, v18, v19);
  v21 = v20;

  CGAffineTransformMakeTranslation(&v25, v17, v21);
  objc_msgSend_imageByApplyingTransform_(v13, v22, (uint64_t)&v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

CFTypeRef sub_24B6CEA5C(size_t a1, const char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  void *v11;
  const char *v12;
  const __CFDictionary *v13;
  CVPixelBufferRef v14;
  CFTypeRef result;
  CVPixelBufferRef v16;
  uint64_t v17;
  _QWORD v18[3];

  v6 = 0;
  v18[2] = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BDC5668];
  v8 = *MEMORY[0x24BDC56B8];
  v9 = 1;
  do
  {
    v10 = v9;
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], a2, 1278226536, 0, v7, v8, MEMORY[0x24BDBD1B8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)v18, &v17, 2);
    v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CVPixelBufferCreate(0, a1, (size_t)a2, 0x4C303068u, v13, &v16);
    v14 = v16;

    *(_QWORD *)(a3 + 8 * v6) = v14;
    result = CFAutorelease(v14);
    v9 = 0;
    v6 = 1;
  }
  while ((v10 & 1) != 0);
  return result;
}

id sub_24B6CEB90(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  char v7;
  __IOSurface *IOSurface;
  id v9;
  void *v10;
  size_t Width;
  size_t Height;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  const char *v21;

  v3 = a1;
  v4 = (void *)objc_opt_new();
  v5 = 0;
  v6 = 1;
  do
  {
    v7 = v6;
    IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(a2 + 8 * v5));
    v9 = v3;
    if (IOSurfaceGetPixelFormat(IOSurface) != 1278226536)
      sub_24B6EF6CC();
    v10 = (void *)MEMORY[0x24BDDD740];
    Width = IOSurfaceGetWidth(IOSurface);
    Height = IOSurfaceGetHeight(IOSurface);
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v10, v13, 25, Width, Height, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_usage(v14, v15, v16);
    objc_msgSend_setUsage_(v14, v18, v17 | 3);
    v20 = (void *)objc_msgSend_newTextureWithDescriptor_iosurface_plane_(v9, v19, (uint64_t)v14, IOSurface, 0);

    objc_msgSend_addObject_(v4, v21, (uint64_t)v20);
    v6 = 0;
    v5 = 1;
  }
  while ((v7 & 1) != 0);

  return v4;
}

id sub_24B6CECB0(void *a1, const char *a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  CGAffineTransform v18;

  objc_msgSend_imageByClampingToExtent(a1, a2, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeTranslation(&v18, -a4, -a5);
  objc_msgSend_imageByApplyingTransform_(v11, v12, (uint64_t)&v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_imageByCroppingToRect_(v13, v14, v15, 0.0, 0.0, a6, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id sub_24B6CED4C(void *a1)
{
  id v1;
  const char *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double x;
  double y;
  double width;
  double height;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  uint64_t v37;
  CGAffineTransform v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[3];
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v41[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend_kernelWithName_(CoreImageOnlyLibrary, v2, (uint64_t)CFSTR("ccp_interleavedToPlanar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_msgSend_extent(v1, v3, v4), !CGRectIsInfinite(v42)))
  {
    objc_msgSend_extent(v1, v6, v7);
    v10 = v9;
    objc_msgSend_extent(v1, v11, v12);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    CGAffineTransformMakeScale(&v38, 1.0, 3.0);
    v43.origin.x = v14;
    v43.origin.y = v16;
    v43.size.width = v18;
    v43.size.height = v20;
    v44 = CGRectApplyAffineTransform(v43, &v38);
    x = v44.origin.x;
    y = v44.origin.y;
    width = v44.size.width;
    height = v44.size.height;
    v41[0] = v1;
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v25, v26, v10, MEMORY[0x24BDAC760], 3221225472, sub_24B6CFAEC, &unk_251C8F8D0, *(_QWORD *)&v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v27;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v28, (uint64_t)v41, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *MEMORY[0x24BDBF9C0];
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v30, *MEMORY[0x24BDBF8D0]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v31;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v32, (uint64_t)&v40, &v39, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_roiCallback_arguments_options_(v5, v34, (uint64_t)&v37, v29, v33, x, y, width, height);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v1 = v35;
    v8 = v1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id sub_24B6CEF78(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v2, (uint64_t)CFSTR("to_range_m1_p1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v1, v4, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v19[0] = v1;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, (uint64_t)v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_applyWithExtent_arguments_(v3, v16, (uint64_t)v15, v7, v9, v11, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void sub_24B6CF070(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  id v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  id v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v32[0] = CFSTR("inputRVector");
  v8 = (void *)MEMORY[0x24BDBF690];
  v9 = a4;
  v10 = a3;
  v11 = a2;
  objc_msgSend_vectorWithX_Y_Z_W_(v8, v12, v13, 1.0, 0.0, 0.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v14;
  v32[1] = CFSTR("inputGVector");
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x24BDBF690], v15, v16, 1.0, 0.0, 0.0, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v17;
  v32[2] = CFSTR("inputBVector");
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x24BDBF690], v18, v19, 1.0, 0.0, 0.0, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v20;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v21, (uint64_t)v33, v32, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByApplyingFilter_withInputParameters_(v11, v23, (uint64_t)CFSTR("CIColorMatrix"), v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc(MEMORY[0x24BDBF680]);
  v27 = (void *)objc_msgSend_initWithMTLTexture_commandBuffer_(v25, v26, (uint64_t)v10, v9);

  objc_msgSend_setFlipped_(v27, v28, 1);
  objc_msgSend_setColorSpace_(v27, v29, 0);
  v31 = (id)objc_msgSend_startTaskToRender_toDestination_error_(v7, v30, (uint64_t)v24, v27, 0);

}

void sub_24B6CF254(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  SEL v7;
  const char *v8;

  v3 = a2;
  uni_logger_api();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_24B6EF6F4(v4, v5, v6);

  v7 = NSSelectorFromString(CFSTR("setError:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_performSelector_withObject_(*(void **)(a1 + 32), v8, (uint64_t)v7, v3);

}

void sub_24B6CF2DC(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  objc_msgSend_internalCommandQueue(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(v4, v5, v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_commit(v13, v7, v8);
  objc_msgSend_waitUntilCompleted(v13, v9, v10);
  objc_msgSend_clearCaches(*(void **)(a1 + 32), v11, v12);

}

id ApplyHairnetProcessor(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  id v19;
  double v20;
  double v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  const char *v36;
  void *v37;
  const char *v38;
  id v39;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v19 = a7;
  if (v13 && v14 && v16 && v17)
  {
    LODWORD(v20) = *(_DWORD *)(a6 + 56);
    LODWORD(v21) = *(_DWORD *)(a6 + 60);
    objc_msgSend_apply_sdof_mask_alpha_chromaWeight_chromaBlurSigma_model_(ApplyHairnetModel, v18, (uint64_t)v13, v15, v16, v14, v17, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
      sub_24B6EF7E4();
    v24 = (void *)v22;
    objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v23, (uint64_t)CFSTR("divide_alpha"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_extent(v24, v26, v27);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v41[0] = v24;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v36, (uint64_t)v41, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_arguments_(v25, v38, (uint64_t)v37, v29, v31, v33, v35);
    v39 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = v15;
  }

  return v39;
}

void sub_24B6CFB04(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_24B6CFB14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_24B6D2098(uint64_t a1, unsigned __int16 a2, unsigned __int16 a3, _DWORD *a4)
{
  unint64_t v4;
  int v5;
  int v6;
  int v7;
  BOOL v8;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;

  v4 = ((unint64_t)*(unsigned int *)(a1 + 8) + 0x7FFFFFFF0) >> 3;
  if ((v4 & 0x80000000) == 0)
    v5 = ((unint64_t)*(unsigned int *)(a1 + 8) + 0x7FFFFFFF0) >> 3;
  else
    v5 = v4 + 1;
  v6 = v5 >> 1;
  v7 = *(unsigned __int16 *)(a1 + 8 * (v5 >> 1) + 16);
  v8 = v7 != a2;
  if (v7 != a2 && (int)v4 >= 2)
  {
    v10 = 0;
    v11 = v4 - 1;
    do
    {
      if ((__int16)v7 <= (__int16)a2)
      {
        if ((__int16)v7 < (__int16)a2)
        {
          v10 = v6 + 1;
          v12 = v11 + v6 + 1;
          if (v12 + 1 >= 0)
            v13 = v12 + 1;
          else
            v13 = v12 + 2;
          v6 = v13 >> 1;
          if (*(__int16 *)(a1 + 8 * v6 + 16) <= (__int16)v7)
            return 4294867295;
          v7 = *(unsigned __int16 *)(a1 + 8 * v6 + 16);
        }
      }
      else
      {
        if (*(__int16 *)(a1 + 8 * ((v6 + v10) / 2) + 16) >= (__int16)v7)
          return 4294867295;
        v11 = v6 - 1;
        v7 = *(unsigned __int16 *)(a1 + 8 * ((v6 + v10) / 2) + 16);
        v6 = (v6 + v10) / 2;
      }
      v8 = v7 != a2;
    }
    while (v7 != a2 && v10 < v11);
  }
  v14 = 4294867292;
  if (v8)
    return 4294867294;
  if (*(__int16 *)(a1 + 8 * v6 + 18) != a3)
    return 4294867293;
  if (a3 - 1 <= 1)
  {
    v14 = 0;
    *a4 = *(_DWORD *)(a1 + 8 * v6 + 20);
  }
  return v14;
}

void sub_24B6D21C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id createInpaintingMask(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, float *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  unint64_t v35;
  const char *v36;
  float v37;
  uint64_t v38;
  float v39;
  float v40;
  unint64_t v41;
  double v42;
  float v43;
  const char *v44;
  double v45;
  float v46;
  const char *v47;
  double v48;
  float v49;
  const char *v50;
  double v51;
  float v52;
  const char *v53;
  double v54;
  float v55;
  const char *v56;
  double v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  const char *v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  NSObject *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  float v77;
  id v78;
  const char *v79;
  void *v80;
  unint64_t v81;
  unint64_t v82;
  void *v83;
  const char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  float v91;
  float v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  unint64_t v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  unint64_t v101;
  _BOOL4 v102;
  double v103;
  double v104;
  const char *v105;
  double v106;
  double v107;
  const char *v108;
  double v109;
  double v110;
  const char *v111;
  double v112;
  double v113;
  const char *v114;
  double v115;
  double v116;
  const char *v117;
  double v118;
  double v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  float v126;
  float v127;
  float v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float v134;
  float v135;
  float v136;
  float v137;
  double v138;
  double v139;
  double v140;
  float v141;
  float v142;
  const char *v143;
  uint64_t v144;
  float v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  void *v153;
  const char *v154;
  void *v155;
  const char *v156;
  void *v157;
  const char *v158;
  void *v159;
  const char *v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  uint64_t v165;
  id v166;
  const char *v167;
  void *v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  const char *v181;
  void *v182;
  const char *v183;
  void *v184;
  const char *v185;
  void *v186;
  const char *v187;
  void *v188;
  id v189;
  const char *v190;
  void *v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  void *v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  const char *v203;
  uint64_t v204;
  double x;
  double y;
  double width;
  double height;
  const char *v209;
  void *v210;
  const char *v211;
  void *v212;
  const char *v213;
  void *v214;
  const char *v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  float v220;
  id v221;
  const char *v222;
  uint64_t v223;
  double v224;
  double v225;
  const char *v226;
  uint64_t v227;
  const char *v228;
  double v229;
  double v230;
  id v231;
  void *v232;
  double v233;
  int v234;
  void *v235;
  const char *v236;
  const char *v237;
  const char *v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  double v243;
  double v244;
  double v245;
  double v246;
  void *v247;
  const char *v248;
  void *v249;
  const char *v250;
  void *v251;
  const char *v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  void *v256;
  void *v257;
  int v258;
  int v259;
  id v260;
  const char *v261;
  void *v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  void *v266;
  double v267;
  double v268;
  double v269;
  double v270;
  double v271;
  double v272;
  double v273;
  double v274;
  const char *v275;
  uint64_t v276;
  void *v277;
  double v278;
  const char *v279;
  uint64_t v280;
  void *v281;
  const char *v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  unint64_t v286;
  void *v287;
  const char *v288;
  void *v289;
  const char *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  uint64_t v303;
  void *v304;
  void *v305;
  float v306;
  id v307;
  const char *v308;
  uint64_t v309;
  void *v310;
  uint64_t v311;
  id v312;
  void *v313;
  const char *v314;
  void *v315;
  const char *v316;
  void *v317;
  const char *v318;
  void *v319;
  const char *v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  unsigned int v332;
  void *v333;
  float v334;
  void *v335;
  void *v336;
  float v337;
  void *v338;
  float v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  float *v344;
  float v345;
  double v346;
  void *v347;
  double v348;
  float v349;
  double v350;
  double v351;
  void *v352;
  void *v353;
  float v354;
  _BOOL4 v355;
  unsigned int v356;
  void *v357;
  CGAffineTransform buf;
  void *v359;
  void *v360;
  _QWORD v361[4];
  CGRect v362;
  CGRect v363;
  CGRect v364;

  v361[2] = *MEMORY[0x24BDAC8D0];
  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v329 = v13;
  objc_msgSend_extent(v13, v19, v20);
  v22 = v21;
  v24 = v23;
  v25 = v18;
  v27 = v25;
  v343 = v17;
  v344 = a7;
  if (v25)
  {
    objc_msgSend_objectForKeyedSubscript_(v25, v26, (uint64_t)CFSTR("lEye"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v27, v29, (uint64_t)CFSTR("rEye"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v27, v31, (uint64_t)CFSTR("chin"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_count(v28, v33, v34);
    v37 = 1.0;
    if (v35 >= 2)
    {
      v38 = 0;
      v39 = v24;
      v40 = v22;
      v41 = v35 >> 1;
      v37 = 0.0;
      v354 = v39 / v40;
      do
      {
        objc_msgSend_valueAtIndex_(v28, v36, v38);
        v43 = v42;
        objc_msgSend_valueAtIndex_(v28, v44, v38 + 1);
        *(float *)&v45 = v45;
        v46 = v354 * *(float *)&v45;
        objc_msgSend_valueAtIndex_(v30, v47, v38);
        v49 = v48;
        objc_msgSend_valueAtIndex_(v30, v50, v38 + 1);
        *(float *)&v51 = v51;
        v52 = v354 * *(float *)&v51;
        objc_msgSend_valueAtIndex_(v32, v53, v38);
        v55 = v54;
        objc_msgSend_valueAtIndex_(v32, v56, v38 + 1);
        *(float *)&v57 = v57;
        v58 = v354 * *(float *)&v57;
        v59 = hypotf(v43 - v49, v46 - v52);
        v60 = v37;
        v61 = v59 + v59;
        v62 = hypotf(v43 - v55, v46 - v58);
        v37 = fmaxf(v60, fmaxf(fmaxf(v61, v62), hypotf(v49 - v55, v52 - v58)) * 4.0);
        v38 += 2;
        --v41;
      }
      while (v41);
    }

    v17 = v343;
    a7 = v344;
  }
  else
  {
    v37 = 1.0;
  }

  objc_msgSend_extent(v17, v63, v64);
  v66 = v65;
  v68 = v67;
  sub_24B6D3288(v14, v65, v67);
  v336 = (void *)objc_claimAutoreleasedReturnValue();

  sub_24B6D3288(v15, v66, v68);
  v328 = (void *)objc_claimAutoreleasedReturnValue();

  v350 = v66;
  v351 = v68;
  if (v16)
  {
    sub_24B6D3288(v16, v66, v68);
    v327 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    uni_logger_api();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.a) = 136446210;
      *(_QWORD *)((char *)&buf.a + 4) = "createInpaintingMask";
      _os_log_impl(&dword_24B6B5000, v69, OS_LOG_TYPE_INFO, "%{public}s Note: glasses matte is nil and will be treated as if it contains all zeros.", (uint8_t *)&buf, 0xCu);
    }

    v327 = 0;
  }
  sub_24B6D3388(v17, a7[1]);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v17, v71, v72);
  v74 = v73;
  v76 = v75;
  v77 = a7[11];
  v345 = a7[12];
  v78 = v27;
  v80 = v78;
  v81 = 0x24BDBC000;
  v82 = 0x24BDBC000;
  v330 = v78;
  v331 = v70;
  if (v27)
  {
    objc_msgSend_objectForKeyedSubscript_(v78, v79, (uint64_t)CFSTR("lEye"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v80, v84, (uint64_t)CFSTR("rEye"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v80, v86, (uint64_t)CFSTR("chin"));
    v87 = objc_claimAutoreleasedReturnValue();
    v347 = (void *)v87;
    if (v77 <= 0.0)
    {
      v27 = 0;
    }
    else
    {
      v90 = (void *)v87;
      v91 = v74;
      v337 = v91;
      v92 = v76;
      v339 = v92;
      objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v88, v89);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend_count(v83, v94, v95);
      v341 = v85;
      if (v96 >= 2)
      {
        v334 = v77;
        v100 = 0;
        v101 = v96 >> 1;
        v333 = (void *)*MEMORY[0x24BDBF9C0];
        v332 = *MEMORY[0x24BDBF8D0];
        v102 = v345 > 1.0;
        if (v345 < 0.001)
          v102 = 1;
        v355 = v102;
        v335 = v83;
        do
        {
          objc_msgSend_valueAtIndex_(v83, v97, v100);
          v104 = v103;
          objc_msgSend_valueAtIndex_(v83, v105, v100 + 1);
          v107 = v106;
          objc_msgSend_valueAtIndex_(v85, v108, v100);
          v110 = v109;
          objc_msgSend_valueAtIndex_(v85, v111, v100 + 1);
          v113 = v112;
          objc_msgSend_valueAtIndex_(v90, v114, v100);
          v116 = v115;
          objc_msgSend_valueAtIndex_(v90, v117, v100 + 1);
          v119 = v118;
          objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v120, (uint64_t)CFSTR("ellipse"));
          v121 = objc_claimAutoreleasedReturnValue();
          if (!v121)
            sub_24B6F05D4();
          v124 = (void *)v121;
          if (v355)
          {
            objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v122, v123);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v126 = v104;
            v127 = v107;
            v128 = v110;
            v129 = v113;
            v130 = v116;
            v131 = v37;
            v132 = v337 * v130;
            v133 = v119;
            v134 = v339 * v133;
            v135 = (float)(v132 + (float)((float)(v334 * (float)((float)(v337 * v126) - (float)(v337 * v128))) * 0.5))
                 - v132;
            v136 = (float)(v134 + (float)((float)(v334 * (float)((float)(v339 * v127) - (float)(v339 * v129))) * 0.5))
                 - v134;
            v137 = hypotf(v135, v136);
            v138 = (float)(v132 - v137);
            v139 = (float)(v134 - v137);
            v140 = v137 + v137;
            v141 = (float)(v135 * (float)(v345 * v137)) / v137;
            v142 = (float)(v136 * (float)(v345 * v137)) / v137;
            objc_msgSend_vectorWithX_Y_(MEMORY[0x24BDBF690], v143, v144, (float)(v132 + v141), (float)(v134 + v142));
            v352 = (void *)objc_claimAutoreleasedReturnValue();
            v145 = v132 - v141;
            v37 = v131;
            objc_msgSend_vectorWithX_Y_(MEMORY[0x24BDBF690], v146, v147, v145, (float)(v134 - v142));
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&buf.a = v352;
            *(_QWORD *)&buf.b = v148;
            objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v149, v150, v140);
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&buf.c = v151;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v152, (uint64_t)&buf, 3);
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            v360 = v333;
            objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v154, v332);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v361[0] = v155;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v156, (uint64_t)v361, &v360, 1);
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_applyWithExtent_arguments_options_(v124, v158, (uint64_t)v153, v157, v138, v139, v140, v140);
            v125 = (void *)objc_claimAutoreleasedReturnValue();

            v90 = v347;
            v83 = v335;

            v85 = v341;
          }

          sub_24B6D352C(v93, v125);
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          v100 += 2;
          v93 = v99;
          --v101;
        }
        while (v101);
      }
      else
      {
        v99 = v93;
      }
      objc_msgSend_blackImage(MEMORY[0x24BDBF660], v97, v98);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByCompositingOverImage_(v99, v160, (uint64_t)v159);
      v161 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_imageByCroppingToRect_(v161, v162, v163, 0.0, 0.0, v337, v339);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v85 = v341;
      a7 = v344;
      v80 = v330;
      v70 = v331;
      v82 = 0x24BDBC000uLL;
      v81 = 0x24BDBC000uLL;
    }

  }
  sub_24B6D352C(v328, v27);
  v164 = (void *)objc_claimAutoreleasedReturnValue();

  sub_24B6D3734(v164, v70);
  v165 = objc_claimAutoreleasedReturnValue();

  v166 = v329;
  if (!v166)
    sub_24B6F04BC();
  v168 = v166;
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v167, (uint64_t)CFSTR("makeGrey"));
  v169 = objc_claimAutoreleasedReturnValue();
  if (!v169)
    sub_24B6F04E4();
  v172 = (void *)v169;
  v340 = (void *)v165;
  v342 = v27;
  objc_msgSend_extent(v168, v170, v171);
  v174 = v173;
  v176 = v175;
  v178 = v177;
  v180 = v179;
  *(_QWORD *)&buf.a = v168;
  objc_msgSend_arrayWithObjects_count_(*(void **)(v81 + 3632), v181, (uint64_t)&buf, 1);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v353 = (void *)*MEMORY[0x24BDBF9C0];
  v360 = (void *)*MEMORY[0x24BDBF9C0];
  v356 = *MEMORY[0x24BDBF8D0];
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v183, *MEMORY[0x24BDBF8D0]);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v361[0] = v184;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(*(void **)(v82 + 3696), v185, (uint64_t)v361, &v360, 1);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_arguments_options_(v172, v187, (uint64_t)v182, v186, v174, v176, v178, v180);
  v188 = (void *)objc_claimAutoreleasedReturnValue();

  v189 = v188;
  if (!v189)
    sub_24B6F050C();
  v191 = v189;
  objc_msgSend_kernelWithName_(CoreImageOnlyLibrary, v190, (uint64_t)CFSTR("sobelGrey"));
  v192 = objc_claimAutoreleasedReturnValue();
  if (!v192)
    sub_24B6F0534();
  v195 = (void *)v192;
  v348 = fmax(v350, v351);
  objc_msgSend_extent(v191, v193, v194);
  v197 = v196;
  v346 = v198;
  v200 = v199;
  v202 = v201;
  objc_msgSend_extent(v191, v203, v204);
  v363 = CGRectInset(v362, -1.0, -1.0);
  x = v363.origin.x;
  y = v363.origin.y;
  width = v363.size.width;
  height = v363.size.height;
  *(_QWORD *)&buf.a = v191;
  objc_msgSend_arrayWithObjects_count_(*(void **)(v81 + 3632), v209, (uint64_t)&buf, 1);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v360 = v353;
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v211, v356);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v361[0] = v212;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(*(void **)(v82 + 3696), v213, (uint64_t)v361, &v360, 1);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_roiCallback_arguments_options_(v195, v215, (uint64_t)&unk_251C8F910, v210, v214, x, y, width, height);
  v216 = (void *)objc_claimAutoreleasedReturnValue();

  v364.origin.x = v197;
  v364.origin.y = v346;
  v364.size.width = v200;
  v364.size.height = v202;
  if (!CGRectIsInfinite(v364))
  {
    objc_msgSend_imageByCroppingToRect_(v216, v217, v218, v197, v346, v200, v202);
    v219 = objc_claimAutoreleasedReturnValue();

    v216 = (void *)v219;
  }
  v220 = v348;

  v221 = v216;
  objc_msgSend_extent(v221, v222, v223);
  v225 = v350 / v224;
  objc_msgSend_extent(v221, v226, v227);
  v230 = v351 / v229;
  v338 = v168;
  if (fabs(v225 + -1.0) >= 0.0001 || fabs(v230 + -1.0) >= 0.0001)
  {
    v233 = fmax(v225, v230);
    if (v233 <= 1.0)
    {
      v234 = 0;
      while (v233 <= 0.5)
      {
        v233 = v233 + v233;
        v225 = v225 + v225;
        v230 = v230 + v230;
        ++v234;
      }
      v349 = v348;
      objc_msgSend_kernelWithName_(CoreImageOnlyLibrary, v228, (uint64_t)CFSTR("downByTwoRMax"));
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCanReduceOutputChannels_(v235, v236, 1);
      objc_msgSend_setPreservesRange_(v235, v237, 1);
      objc_msgSend_imageByClampingToExtent(v221, v238, v239);
      v240 = (void *)objc_claimAutoreleasedReturnValue();

      if (v234)
      {
        v243 = *MEMORY[0x24BDBF028];
        v244 = *(double *)(MEMORY[0x24BDBF028] + 8);
        v245 = *(double *)(MEMORY[0x24BDBF028] + 16);
        v246 = *(double *)(MEMORY[0x24BDBF028] + 24);
        do
        {
          v361[0] = v240;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v241, (uint64_t)v361, 1);
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          v359 = v353;
          objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v248, v356);
          v249 = (void *)objc_claimAutoreleasedReturnValue();
          v360 = v249;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(*(void **)(v82 + 3696), v250, (uint64_t)&v360, &v359, 1);
          v251 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_applyWithExtent_roiCallback_arguments_options_(v235, v252, (uint64_t)&unk_251C8F930, v247, v251, v243, v244, v245, v246);
          v253 = (void *)objc_claimAutoreleasedReturnValue();

          v82 = 0x24BDBC000;
          v240 = v253;
          --v234;
        }
        while (v234);
      }
      else
      {
        v253 = v240;
      }
      if (fabs(v225 + -1.0) >= 0.0001 || fabs(v230 + -1.0) >= 0.0001)
      {
        CGAffineTransformMakeScale(&buf, v225, v230);
        objc_msgSend_imageByApplyingTransform_(v253, v254, (uint64_t)&buf);
        v255 = objc_claimAutoreleasedReturnValue();

        v253 = (void *)v255;
      }
      a7 = v344;
      v81 = 0x24BDBC000uLL;
      v220 = v349;
      objc_msgSend_imageByCroppingToRect_(v253, v241, v242, 0.0, 0.0, v350, v351);
      v256 = (void *)objc_claimAutoreleasedReturnValue();

      v231 = v256;
      v232 = v231;
    }
    else
    {
      sub_24B6D3288(v221, v350, v351);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      v231 = v221;
    }
  }
  else
  {
    v231 = v221;
    v232 = v231;
  }

  sub_24B6D390C(v336, v37 * (float)(a7[2] * v220));
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v259 = *((_DWORD *)a7 + 3);
  v258 = *((_DWORD *)a7 + 4);
  v260 = v257;
  if (!v260)
    sub_24B6F055C();
  v262 = v260;
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v261, (uint64_t)CFSTR("threshold_between"));
  v263 = objc_claimAutoreleasedReturnValue();
  if (!v263)
    sub_24B6F0584();
  v266 = (void *)v263;
  objc_msgSend_extent(v262, v264, v265);
  v268 = v267;
  v270 = v269;
  v272 = v271;
  v274 = v273;
  *(_QWORD *)&buf.a = v262;
  LODWORD(v267) = v259;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v275, v276, v267);
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf.b = v277;
  LODWORD(v278) = v258;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v279, v280, v278);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf.c = v281;
  objc_msgSend_arrayWithObjects_count_(*(void **)(v81 + 3632), v282, (uint64_t)&buf, 3);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v360 = v353;
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v284, v356);
  v285 = objc_claimAutoreleasedReturnValue();
  v286 = v82;
  v287 = (void *)v285;
  v361[0] = v285;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(*(void **)(v286 + 3696), v288, (uint64_t)v361, &v360, 1);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_arguments_options_(v266, v290, (uint64_t)v283, v289, v268, v270, v272, v274);
  v291 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v291)
    sub_24B6F05AC();

  v292 = v343;
  sub_24B6D3A54(v343, v37 * (float)(v344[9] * v220));
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6D3388(v293, v344[10]);
  v294 = (void *)objc_claimAutoreleasedReturnValue();

  sub_24B6D390C(v340, v37 * (float)(v344[5] * v220));
  v295 = (void *)objc_claimAutoreleasedReturnValue();

  sub_24B6D3B08(v295, v344[6]);
  v296 = (void *)objc_claimAutoreleasedReturnValue();

  v297 = v327;
  if (v327)
  {
    sub_24B6D3A54(v327, v37 * (float)(v344[7] * v220));
    v298 = (void *)objc_claimAutoreleasedReturnValue();

    sub_24B6D3B08(v298, v344[8]);
    v297 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v357 = v296;
  sub_24B6D3734(v291, v296);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6D3CAC(v294);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6D3734(v299, v300);
  v301 = (void *)objc_claimAutoreleasedReturnValue();

  if (v297)
  {
    sub_24B6D3CAC(v297);
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6D3734(v301, v302);
    v303 = objc_claimAutoreleasedReturnValue();

    v301 = (void *)v303;
  }
  sub_24B6D3B08(v232, *v344);
  v304 = (void *)objc_claimAutoreleasedReturnValue();

  sub_24B6D3734(v304, v301);
  v305 = (void *)objc_claimAutoreleasedReturnValue();

  v306 = v344[13] * v220;
  v307 = v305;
  v310 = v307;
  v311 = (2 * vcvtms_s32_f32(v306 * 0.5)) | 1;
  if ((int)v311 > 2)
  {
    objc_msgSend_imageByClampingToExtent(v307, v308, v309);
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    v361[0] = CFSTR("inputWidth");
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v314, v311);
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf.a = v315;
    v361[1] = CFSTR("inputHeight");
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v316, v311);
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf.b = v317;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v318, (uint64_t)&buf, v361, 2);
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingFilter_withInputParameters_(v313, v320, (uint64_t)CFSTR("CIMorphologyRectangleMaximum"), v319);
    v321 = (void *)objc_claimAutoreleasedReturnValue();

    v292 = v343;
    objc_msgSend_extent(v310, v322, v323);
    objc_msgSend_imageByCroppingToRect_(v321, v324, v325);
    v312 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v312 = v307;
  }

  return v312;
}

id sub_24B6D3288(void *a1, double a2, double a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  id v21;
  CGAffineTransform v23;

  v5 = a1;
  objc_msgSend_extent(v5, v6, v7);
  v9 = a2 / v8;
  objc_msgSend_extent(v5, v10, v11);
  v15 = a3 / v14;
  if (fabs(v9 + -1.0) >= 0.0001 || fabs(v15 + -1.0) >= 0.0001)
  {
    objc_msgSend_imageByClampingToExtent(v5, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    CGAffineTransformMakeScale(&v23, v9, v15);
    objc_msgSend_imageByApplyingTransform_(v16, v17, (uint64_t)&v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_imageByCroppingToRect_(v18, v19, v20, 0.0, 0.0, a2, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (!v5)
      sub_24B6F05FC();
  }
  v21 = v5;

  return v21;
}

id sub_24B6D3388(void *a1, float a2)
{
  id v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (!v3)
    sub_24B6F0624();
  v5 = v3;
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v4, (uint64_t)CFSTR("threshold_lt"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    sub_24B6F064C();
  v9 = (void *)v6;
  objc_msgSend_extent(v5, v7, v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v32[0] = v5;
  *(float *)&v10 = a2;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v18, v19, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v20;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v21, (uint64_t)v32, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x24BDBF9C0];
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v23, *MEMORY[0x24BDBF8D0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v24;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v25, (uint64_t)&v31, &v30, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_arguments_options_(v9, v27, (uint64_t)v22, v26, v11, v13, v15, v17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
    sub_24B6F0674();

  return v28;
}

id sub_24B6D352C(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  const char *v15;
  uint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double x;
  double y;
  double width;
  double height;
  const char *v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  uint64_t v33;
  const char *v34;
  void *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[3];
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v44[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend_extent(v3, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend_extent(v4, v15, v16);
  v49.origin.x = v17;
  v49.origin.y = v18;
  v49.size.width = v19;
  v49.size.height = v20;
  v45.origin.x = v8;
  v45.origin.y = v10;
  v45.size.width = v12;
  v45.size.height = v14;
  v46 = CGRectUnion(v45, v49);
  x = v46.origin.x;
  y = v46.origin.y;
  width = v46.size.width;
  height = v46.size.height;
  if (CGRectIsEmpty(v46))
  {
    objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v25, v26);
    v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v31 = v27;
    goto LABEL_8;
  }
  objc_msgSend_extent(v3, v25, v26);
  if (CGRectIsEmpty(v47))
  {
    v27 = v4;
    goto LABEL_7;
  }
  objc_msgSend_extent(v4, v28, v29);
  if (CGRectIsEmpty(v48))
  {
    v27 = v3;
    goto LABEL_7;
  }
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v30, (uint64_t)CFSTR("orMasks"));
  v33 = objc_claimAutoreleasedReturnValue();
  if (!v33)
    sub_24B6F069C();
  v35 = (void *)v33;
  v44[0] = v3;
  v44[1] = v4;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v34, (uint64_t)v44, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = *MEMORY[0x24BDBF9C0];
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v37, *MEMORY[0x24BDBF8D0]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v38;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v39, (uint64_t)&v43, &v42, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_arguments_options_(v35, v41, (uint64_t)v36, v40, x, y, width, height);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v31;
}

id sub_24B6D3734(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  const char *v15;
  uint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double x;
  double y;
  double width;
  double height;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v38;
  void *v39;
  _QWORD v40[3];
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v40[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend_extent(v3, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend_extent(v4, v15, v16);
  v43.origin.x = v17;
  v43.origin.y = v18;
  v43.size.width = v19;
  v43.size.height = v20;
  v41.origin.x = v8;
  v41.origin.y = v10;
  v41.size.width = v12;
  v41.size.height = v14;
  v42 = CGRectIntersection(v41, v43);
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  if (CGRectIsEmpty(v42))
  {
    objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v25, (uint64_t)CFSTR("andMasks"));
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
      sub_24B6F06C4();
    v30 = (void *)v28;
    v40[0] = v3;
    v40[1] = v4;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v29, (uint64_t)v40, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *MEMORY[0x24BDBF9C0];
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v32, *MEMORY[0x24BDBF8D0]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v33;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v34, (uint64_t)&v39, &v38, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_arguments_options_(v30, v36, (uint64_t)v31, v35, x, y, width, height);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v27;
}

id sub_24B6D390C(void *a1, float a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  double i;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  CGAffineTransform v30;
  CGAffineTransform v31;

  v3 = a1;
  v6 = v3;
  for (i = 1.0; a2 >= 16.0; a2 = a2 * 0.5)
    i = i + i;
  objc_msgSend_extent(v3, v4, v5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend_imageByClampingToExtent(v6, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  CGAffineTransformMakeScale(&v31, 1.0 / i, 1.0 / i);
  objc_msgSend_imageByApplyingTransform_highQualityDownsample_(v18, v19, (uint64_t)&v31, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_imageByApplyingGaussianBlurWithSigma_(v20, v21, v22, a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  CGAffineTransformMakeScale(&v30, i, i);
  objc_msgSend_imageByApplyingTransform_(v23, v24, (uint64_t)&v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_imageByCroppingToRect_(v25, v26, v27, v9, v11, v13, v15);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
    sub_24B6F06EC();
  return v28;
}

id sub_24B6D3A54(void *a1, float a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;

  v3 = a1;
  objc_msgSend_extent(v3, v4, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend_imageByClampingToExtent(v3, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_imageByApplyingGaussianBlurWithSigma_(v16, v17, v18, a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_imageByCroppingToRect_(v19, v20, v21, v7, v9, v11, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    sub_24B6F0714();
  return v22;
}

id sub_24B6D3B08(void *a1, float a2)
{
  id v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (!v3)
    sub_24B6F073C();
  v5 = v3;
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v4, (uint64_t)CFSTR("threshold_gt"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    sub_24B6F0764();
  v9 = (void *)v6;
  objc_msgSend_extent(v5, v7, v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v32[0] = v5;
  *(float *)&v10 = a2;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v18, v19, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v20;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v21, (uint64_t)v32, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x24BDBF9C0];
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v23, *MEMORY[0x24BDBF8D0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v24;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v25, (uint64_t)&v31, &v30, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_arguments_options_(v9, v27, (uint64_t)v22, v26, v11, v13, v15, v17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
    sub_24B6F078C();

  return v28;
}

id sub_24B6D3CAC(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (!v1)
    sub_24B6F07B4();
  v3 = v1;
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v2, (uint64_t)CFSTR("invertMask"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    sub_24B6F07DC();
  v7 = (void *)v4;
  objc_msgSend_extent(v3, v5, v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v27[0] = v3;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v16, (uint64_t)v27, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v18, *MEMORY[0x24BDBF8D0], *MEMORY[0x24BDBF9C0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v19;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v20, (uint64_t)&v26, &v25, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_arguments_options_(v7, v22, (uint64_t)v17, v21, v9, v11, v13, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    sub_24B6F0804();

  return v23;
}

double sub_24B6D3E20(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

double sub_24B6D3E2C(double a1, double a2, double a3, double a4)
{
  double result;
  CGRect v5;

  v5.origin.x = a1 + a1;
  v5.origin.y = a2 + a2;
  v5.size.width = a3 + a3;
  v5.size.height = a4 + a4;
  *(_QWORD *)&result = (unint64_t)CGRectIntegral(v5);
  return result;
}

void sub_24B6D42C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24B6D42E4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_2579AEB90;
  qword_2579AEB90 = v3;

}

void sub_24B6D4EB4(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

void sub_24B6D5454(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24B6D5468(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_2579AEBA8;
  qword_2579AEBA8 = v3;

}

id sub_24B6D5494(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v7)
    sub_24B6F0BF4();
  v8 = v7;
  objc_sync_enter(v8);
  v9 = (void *)MEMORY[0x24BDD16E0];
  v12 = objc_msgSend_registryID(v6, v10, v11);
  objc_msgSend_numberWithUnsignedLongLong_(v9, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v17, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD16E0];
    v22 = objc_msgSend_registryID(v6, v20, v21);
    objc_msgSend_numberWithUnsignedLongLong_(v19, v23, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v8, v25, (uint64_t)v16, v24);

    if (!v16)
      __assert_rtn("findObjectInCache", "UniDeviceCache.m", 36, "deviceDict");
  }
  objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  return v26;
}

void sub_24B6D55D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24B6D5C50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24B6D5C6C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_2579AEBB8;
  qword_2579AEBB8 = v3;

}

void sub_24B6D5EB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_24B6D5ED0()
{
  if (qword_2544D9CE8 != -1)
    dispatch_once(&qword_2544D9CE8, &unk_251C8F9B0);
  return (id)qword_2544D9D18;
}

void sub_24B6D6110(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24B6D6424(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24B6D6458(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_2544D9D18;
  qword_2544D9D18 = v3;

}

void sub_24B6D651C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  id *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = objc_opt_class();
  objc_msgSend_bundleForClass_(v2, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v6 = (id *)(a1 + 40);
  objc_msgSend_URLForResource_withExtension_(v5, v8, v7, CFSTR("metallib"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_2544D9CC0;
  qword_2544D9CC0 = v9;

  if (!qword_2544D9CC0)
  {
    uni_logger_compile();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_24B6F0E28(v6);

  }
}

void sub_24B6D68D8(uint64_t a1, const char *a2)
{
  void *v3;
  id *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  objc_msgSend_bundleForClass_(MEMORY[0x24BDD1488], a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v4 = (id *)(a1 + 32);
  objc_msgSend_URLForResource_withExtension_(v3, v6, v5, CFSTR("metallib"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_2579AEBC0;
  qword_2579AEBC0 = v7;

  if (!qword_2579AEBC0)
  {
    uni_logger_compile();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_24B6F1034(v4);

  }
}

void sub_24B6D6C10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_24B6D6C30(id *a1)
{
  return objc_retainAutorelease(*a1);
}

void sub_24B6D7A30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24B6D7A48(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  objc_msgSend_mapTableWithKeyOptions_valueOptions_(MEMORY[0x24BDD1650], a2, 5, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_2544D9CD8;
  qword_2544D9CD8 = v2;

}

void sub_24B6D8DC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_24B6D8E20()
{
  id v0;
  void *v1;
  const char *v2;
  const char *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)qword_2544D9CD0;
  qword_2544D9CD0 = (uint64_t)v0;

  objc_msgSend_setName_((void *)qword_2544D9CD0, v2, (uint64_t)CFSTR("com.apple.ccportrait.EspressoWrapper.nscache"));
  objc_msgSend_setCountLimit_((void *)qword_2544D9CD0, v3, 8);
  return MEMORY[0x24BEDD108](qword_2544D9CD0, sel_setEvictsObjectsWhenApplicationEntersBackground_, 1);
}

void sub_24B6D92B4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t context;
  uint64_t plan;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;

  if ((objc_msgSend_built(*(void **)(a1 + 32), a2, a3) & 1) == 0)
  {
    context = espresso_create_context();
    if (context || (context = espresso_create_context()) != 0)
    {
      plan = espresso_create_plan();
      if (plan)
      {
        v6 = plan;
        if (espresso_plan_submit_set_multiple_buffering()
          || (objc_msgSend_path(*(void **)(a1 + 32), v7, v8),
              v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
              objc_msgSend_UTF8String(v9, v10, v11),
              v12 = espresso_plan_add_network(),
              v9,
              v12)
          || espresso_plan_build())
        {
          syslog(3, "r==ESPRESSO_STATUS_SUCCESS is false. (%s) at %s:%d");
        }
        else
        {
          objc_msgSend_setPlanIdx_(*(void **)(a1 + 32), v13, 0);
          objc_msgSend_setPlan_(*(void **)(a1 + 32), v14, v6);
          objc_msgSend_setCtx_(*(void **)(a1 + 32), v15, context);
          objc_msgSend_setBuilt_(*(void **)(a1 + 32), v16, 1);
        }
      }
      else
      {
        syslog(3, "plan is false. (%s) at %s:%d");
      }
    }
    else
    {
      syslog(3, "ctx is false. (%s) at %s:%d");
    }
  }
}

void sub_24B6D9698(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v4;

  if (a2)
  {
    v2 = *(int *)(a2 + 4);
    if ((_DWORD)v2)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], (const char *)a2, (uint64_t)CFSTR("com.apple.unified_rendering"), v2, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }
}

void sub_24B6DC61C(void *a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend_kernel(a1, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_msgSend_containsObject_(v5, v9, (uint64_t)v10) & 1) == 0)
    {
      objc_msgSend_addObject_(v5, v11, (uint64_t)v10);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend_inputs(v10, v12, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v27, v31, 16);
      if (v16)
      {
        v19 = v16;
        v20 = *(_QWORD *)v28;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v28 != v20)
              objc_enumerationMutation(v14);
            v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v21);
            objc_msgSend_inputs(v10, v17, v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v23, v24, v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              sub_24B6DC61C(v25, v5, v8);

            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v27, v31, 16);
        }
        while (v19);
      }

      objc_msgSend_addPointer_(v8, v26, (uint64_t)v10);
    }

  }
}

uint64_t sub_24B6DC7CC(void *a1)
{
  id v1;
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  int isEqualToString;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  int v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  int v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  void *v56;
  const char *v57;
  int v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  void *v63;
  const char *v64;
  int v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  const char *v71;
  int v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  void *v77;
  const char *v78;
  int v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  void *v84;
  const char *v85;
  int v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  void *v91;
  const char *v92;
  int v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  void *v98;
  const char *v99;
  int v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  void *v105;
  const char *v106;
  int v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  void *v112;
  const char *v113;
  int v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  void *v119;
  const char *v120;
  int v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  void *v126;
  const char *v127;
  int v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  void *v133;
  const char *v134;
  int v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  void *v140;
  const char *v141;
  int v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  void *v147;
  const char *v148;
  int v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  void *v154;
  const char *v155;
  int v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  void *v161;
  const char *v162;
  int v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  void *v168;
  const char *v169;
  int v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  void *v175;
  const char *v176;
  int v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  void *v182;
  const char *v183;
  int v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  void *v189;
  const char *v190;
  int v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  void *v196;
  const char *v197;
  int v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  void *v203;
  const char *v204;
  int v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  void *v210;
  const char *v211;
  int v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  void *v217;
  const char *v218;
  int v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  const char *v223;
  void *v224;
  const char *v225;
  int v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  void *v231;
  const char *v232;
  int v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  void *v238;
  const char *v239;
  int v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  const char *v244;
  void *v245;
  const char *v246;
  int v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  const char *v251;
  void *v252;
  const char *v253;
  int v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  const char *v258;
  void *v259;
  const char *v260;
  int v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  void *v266;
  const char *v267;
  int v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  const char *v272;
  void *v273;
  const char *v274;
  int v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  void *v280;
  const char *v281;
  int v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  const char *v286;
  void *v287;
  const char *v288;
  int v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  const char *v293;
  void *v294;
  const char *v295;
  int v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  const char *v300;
  void *v301;
  const char *v302;
  int v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  const char *v307;
  void *v308;
  const char *v309;
  int v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  const char *v314;
  void *v315;
  const char *v316;
  int v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  const char *v321;
  void *v322;
  const char *v323;
  int v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  const char *v328;
  void *v329;
  const char *v330;
  int v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  const char *v335;
  void *v336;
  const char *v337;
  int v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  const char *v342;
  void *v343;
  const char *v344;
  int v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  const char *v349;
  void *v350;
  const char *v351;
  int v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  const char *v356;
  void *v357;
  const char *v358;
  int v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  const char *v363;
  void *v364;
  const char *v365;
  int v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  const char *v370;
  void *v371;
  const char *v372;
  int v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  const char *v377;
  void *v378;
  const char *v379;
  int v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  const char *v384;
  void *v385;
  const char *v386;
  int v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  const char *v391;
  void *v392;
  const char *v393;
  int v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  const char *v398;
  void *v399;
  const char *v400;
  int v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  const char *v405;
  void *v406;
  const char *v407;
  int v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  const char *v412;
  void *v413;
  const char *v414;
  int v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  const char *v419;
  void *v420;
  const char *v421;
  int v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  const char *v426;
  void *v427;
  const char *v428;
  int v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  const char *v433;
  void *v434;
  const char *v435;
  int v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  const char *v440;
  void *v441;
  const char *v442;
  int v443;

  v1 = a1;
  if (v1)
  {
    v2 = objc_opt_class();
    if (v2 == objc_opt_class())
    {
      objc_msgSend_mk(v1, v3, v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend_mk(v1, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_label(v20, v21, v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_msgSend_length(CFSTR("run kernel: modify_blurmap_apply"), v23, v24);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: modify_blurmap_apply"), v26, 12, v25 - 12);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v9, v28, (uint64_t)v27);

        if (isEqualToString)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: modify_blurmap_apply";
LABEL_142:
          v15 = _os_activity_create(&dword_24B6B5000, v14, v13, OS_ACTIVITY_FLAG_DEFAULT);

          goto LABEL_143;
        }
        v32 = objc_msgSend_length(CFSTR("run kernel: modify_blurmap_glasses_apply"), v30, v31);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: modify_blurmap_glasses_apply"), v33, 12, v32 - 12);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend_isEqualToString_(v9, v35, (uint64_t)v34);

        if (v36)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: modify_blurmap_glasses_apply";
          goto LABEL_142;
        }
        v39 = objc_msgSend_length(CFSTR("run kernel: threshold_hard_apply"), v37, v38);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: threshold_hard_apply"), v40, 12, v39 - 12);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend_isEqualToString_(v9, v42, (uint64_t)v41);

        if (v43)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: threshold_hard_apply";
          goto LABEL_142;
        }
        v47 = objc_msgSend_length(CFSTR("run kernel: map_linear_apply"), v44, v45);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: map_linear_apply"), v48, 12, v47 - 12);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend_isEqualToString_(v9, v50, (uint64_t)v49);

        if (v51)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: map_linear_apply";
          goto LABEL_142;
        }
        v54 = objc_msgSend_length(CFSTR("run kernel: map_linear_no_secondary_tex_apply"), v52, v53);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: map_linear_no_secondary_tex_apply"), v55, 12, v54 - 12);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend_isEqualToString_(v9, v57, (uint64_t)v56);

        if (v58)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: map_linear_no_secondary_tex_apply";
          goto LABEL_142;
        }
        v61 = objc_msgSend_length(CFSTR("run kernel: disparity_refinement_bicubic_upscale"), v59, v60);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: disparity_refinement_bicubic_upscale"), v62, 12, v61 - 12);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend_isEqualToString_(v9, v64, (uint64_t)v63);

        if (v65)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: disparity_refinement_bicubic_upscale";
          goto LABEL_142;
        }
        v68 = objc_msgSend_length(CFSTR("run kernel: disparity_refinement_slm_passthrough"), v66, v67);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: disparity_refinement_slm_passthrough"), v69, 12, v68 - 12);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend_isEqualToString_(v9, v71, (uint64_t)v70);

        if (v72)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: disparity_refinement_slm_passthrough";
          goto LABEL_142;
        }
        v75 = objc_msgSend_length(CFSTR("run kernel: disparity_refinement_calcweightsX"), v73, v74);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: disparity_refinement_calcweightsX"), v76, 12, v75 - 12);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend_isEqualToString_(v9, v78, (uint64_t)v77);

        if (v79)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: disparity_refinement_calcweightsX";
          goto LABEL_142;
        }
        v82 = objc_msgSend_length(CFSTR("run kernel: disparity_refinement_calcweightsY"), v80, v81);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: disparity_refinement_calcweightsY"), v83, 12, v82 - 12);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend_isEqualToString_(v9, v85, (uint64_t)v84);

        if (v86)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: disparity_refinement_calcweightsY";
          goto LABEL_142;
        }
        v89 = objc_msgSend_length(CFSTR("run kernel: disparity_refinement_preproc"), v87, v88);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: disparity_refinement_preproc"), v90, 12, v89 - 12);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend_isEqualToString_(v9, v92, (uint64_t)v91);

        if (v93)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: disparity_refinement_preproc";
          goto LABEL_142;
        }
        v96 = objc_msgSend_length(CFSTR("run kernel: disparity_refinement_sample"), v94, v95);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: disparity_refinement_sample"), v97, 12, v96 - 12);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend_isEqualToString_(v9, v99, (uint64_t)v98);

        if (v100)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: disparity_refinement_sample";
          goto LABEL_142;
        }
        v103 = objc_msgSend_length(CFSTR("run kernel: disparity_refinement_antialias"), v101, v102);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: disparity_refinement_antialias"), v104, 12, v103 - 12);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = objc_msgSend_isEqualToString_(v9, v106, (uint64_t)v105);

        if (v107)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: disparity_refinement_antialias";
          goto LABEL_142;
        }
        v110 = objc_msgSend_length(CFSTR("run kernel: facemask_calc"), v108, v109);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: facemask_calc"), v111, 12, v110 - 12);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = objc_msgSend_isEqualToString_(v9, v113, (uint64_t)v112);

        if (v114)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: facemask_calc";
          goto LABEL_142;
        }
        v117 = objc_msgSend_length(CFSTR("run kernel: facemask_apply"), v115, v116);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: facemask_apply"), v118, 12, v117 - 12);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = objc_msgSend_isEqualToString_(v9, v120, (uint64_t)v119);

        if (v121)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: facemask_apply";
          goto LABEL_142;
        }
        v124 = objc_msgSend_length(CFSTR("run kernel: fpDisparityRefinementPreprocessing"), v122, v123);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: fpDisparityRefinementPreprocessing"), v125, 12, v124 - 12);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = objc_msgSend_isEqualToString_(v9, v127, (uint64_t)v126);

        if (v128)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: fpDisparityRefinementPreprocessing";
          goto LABEL_142;
        }
        v131 = objc_msgSend_length(CFSTR("run kernel: fp_slm_calc"), v129, v130);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: fp_slm_calc"), v132, 12, v131 - 12);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = objc_msgSend_isEqualToString_(v9, v134, (uint64_t)v133);

        if (v135)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: fp_slm_calc";
          goto LABEL_142;
        }
        v138 = objc_msgSend_length(CFSTR("run kernel: fp_slm_calc_eyes"), v136, v137);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: fp_slm_calc_eyes"), v139, 12, v138 - 12);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = objc_msgSend_isEqualToString_(v9, v141, (uint64_t)v140);

        if (v142)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: fp_slm_calc_eyes";
          goto LABEL_142;
        }
        v145 = objc_msgSend_length(CFSTR("run kernel: segmentation_fusion_apply"), v143, v144);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: segmentation_fusion_apply"), v146, 12, v145 - 12);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = objc_msgSend_isEqualToString_(v9, v148, (uint64_t)v147);

        if (v149)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: segmentation_fusion_apply";
          goto LABEL_142;
        }
        v152 = objc_msgSend_length(CFSTR("run kernel: slm_shiftmap_calcminmax"), v150, v151);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: slm_shiftmap_calcminmax"), v153, 12, v152 - 12);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        v156 = objc_msgSend_isEqualToString_(v9, v155, (uint64_t)v154);

        if (v156)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: slm_shiftmap_calcminmax";
          goto LABEL_142;
        }
        v159 = objc_msgSend_length(CFSTR("run kernel: slm_calc"), v157, v158);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: slm_calc"), v160, 12, v159 - 12);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = objc_msgSend_isEqualToString_(v9, v162, (uint64_t)v161);

        if (v163)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: slm_calc";
          goto LABEL_142;
        }
        v166 = objc_msgSend_length(CFSTR("run kernel: slm_calc_eyes"), v164, v165);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: slm_calc_eyes"), v167, 12, v166 - 12);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        v170 = objc_msgSend_isEqualToString_(v9, v169, (uint64_t)v168);

        if (v170)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: slm_calc_eyes";
          goto LABEL_142;
        }
        v173 = objc_msgSend_length(CFSTR("run kernel: eye_protection_face_calc"), v171, v172);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: eye_protection_face_calc"), v174, 12, v173 - 12);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v177 = objc_msgSend_isEqualToString_(v9, v176, (uint64_t)v175);

        if (v177)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: eye_protection_face_calc";
          goto LABEL_142;
        }
        v180 = objc_msgSend_length(CFSTR("run kernel: eye_protection_glasses_face_calc"), v178, v179);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: eye_protection_glasses_face_calc"), v181, 12, v180 - 12);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        v184 = objc_msgSend_isEqualToString_(v9, v183, (uint64_t)v182);

        if (v184)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: eye_protection_glasses_face_calc";
          goto LABEL_142;
        }
        v187 = objc_msgSend_length(CFSTR("run kernel: crispHair_BlurX"), v185, v186);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: crispHair_BlurX"), v188, 12, v187 - 12);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        v191 = objc_msgSend_isEqualToString_(v9, v190, (uint64_t)v189);

        if (v191)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: crispHair_BlurX";
          goto LABEL_142;
        }
        v194 = objc_msgSend_length(CFSTR("run kernel: crispHair_BlurY"), v192, v193);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: crispHair_BlurY"), v195, 12, v194 - 12);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        v198 = objc_msgSend_isEqualToString_(v9, v197, (uint64_t)v196);

        if (v198)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: crispHair_BlurY";
          goto LABEL_142;
        }
        v201 = objc_msgSend_length(CFSTR("run kernel: crispHair_expandedDispX"), v199, v200);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: crispHair_expandedDispX"), v202, 12, v201 - 12);
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        v205 = objc_msgSend_isEqualToString_(v9, v204, (uint64_t)v203);

        if (v205)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: crispHair_expandedDispX";
          goto LABEL_142;
        }
        v208 = objc_msgSend_length(CFSTR("run kernel: crispHair_expandedDispY"), v206, v207);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: crispHair_expandedDispY"), v209, 12, v208 - 12);
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        v212 = objc_msgSend_isEqualToString_(v9, v211, (uint64_t)v210);

        if (v212)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: crispHair_expandedDispY";
          goto LABEL_142;
        }
        v215 = objc_msgSend_length(CFSTR("run kernel: crispHairDownsamplingSingle"), v213, v214);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: crispHairDownsamplingSingle"), v216, 12, v215 - 12);
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        v219 = objc_msgSend_isEqualToString_(v9, v218, (uint64_t)v217);

        if (v219)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: crispHairDownsamplingSingle";
          goto LABEL_142;
        }
        v222 = objc_msgSend_length(CFSTR("run kernel: blurmap_x_smoothing"), v220, v221);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: blurmap_x_smoothing"), v223, 12, v222 - 12);
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        v226 = objc_msgSend_isEqualToString_(v9, v225, (uint64_t)v224);

        if (v226)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: blurmap_x_smoothing";
          goto LABEL_142;
        }
        v229 = objc_msgSend_length(CFSTR("run kernel: blurmap_y_smoothing"), v227, v228);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: blurmap_y_smoothing"), v230, 12, v229 - 12);
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        v233 = objc_msgSend_isEqualToString_(v9, v232, (uint64_t)v231);

        if (v233)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: blurmap_y_smoothing";
          goto LABEL_142;
        }
        v236 = objc_msgSend_length(CFSTR("run kernel: blurmap_x_smoothing_scaled"), v234, v235);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: blurmap_x_smoothing_scaled"), v237, 12, v236 - 12);
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        v240 = objc_msgSend_isEqualToString_(v9, v239, (uint64_t)v238);

        if (v240)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: blurmap_x_smoothing_scaled";
          goto LABEL_142;
        }
        v243 = objc_msgSend_length(CFSTR("run kernel: blurmap_y_smoothing_scaled"), v241, v242);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: blurmap_y_smoothing_scaled"), v244, 12, v243 - 12);
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        v247 = objc_msgSend_isEqualToString_(v9, v246, (uint64_t)v245);

        if (v247)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: blurmap_y_smoothing_scaled";
          goto LABEL_142;
        }
        v250 = objc_msgSend_length(CFSTR("run kernel: blurmap_x_smoothing_unbiased"), v248, v249);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: blurmap_x_smoothing_unbiased"), v251, 12, v250 - 12);
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        v254 = objc_msgSend_isEqualToString_(v9, v253, (uint64_t)v252);

        if (v254)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: blurmap_x_smoothing_unbiased";
          goto LABEL_142;
        }
        v257 = objc_msgSend_length(CFSTR("run kernel: blurmap_y_smoothing_unbiased"), v255, v256);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: blurmap_y_smoothing_unbiased"), v258, 12, v257 - 12);
        v259 = (void *)objc_claimAutoreleasedReturnValue();
        v261 = objc_msgSend_isEqualToString_(v9, v260, (uint64_t)v259);

        if (v261)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: blurmap_y_smoothing_unbiased";
          goto LABEL_142;
        }
        v264 = objc_msgSend_length(CFSTR("run kernel: blurmap_x_smoothing_scaled_unbiased"), v262, v263);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: blurmap_x_smoothing_scaled_unbiased"), v265, 12, v264 - 12);
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        v268 = objc_msgSend_isEqualToString_(v9, v267, (uint64_t)v266);

        if (v268)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: blurmap_x_smoothing_scaled_unbiased";
          goto LABEL_142;
        }
        v271 = objc_msgSend_length(CFSTR("run kernel: blurmap_y_smoothing_scaled_unbiased"), v269, v270);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: blurmap_y_smoothing_scaled_unbiased"), v272, 12, v271 - 12);
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        v275 = objc_msgSend_isEqualToString_(v9, v274, (uint64_t)v273);

        if (v275)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: blurmap_y_smoothing_scaled_unbiased";
          goto LABEL_142;
        }
        v278 = objc_msgSend_length(CFSTR("run kernel: sparserendering_preprocess"), v276, v277);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_preprocess"), v279, 12, v278 - 12);
        v280 = (void *)objc_claimAutoreleasedReturnValue();
        v282 = objc_msgSend_isEqualToString_(v9, v281, (uint64_t)v280);

        if (v282)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_preprocess";
          goto LABEL_142;
        }
        v285 = objc_msgSend_length(CFSTR("run kernel: sparserendering_preprocess_scaled"), v283, v284);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_preprocess_scaled"), v286, 12, v285 - 12);
        v287 = (void *)objc_claimAutoreleasedReturnValue();
        v289 = objc_msgSend_isEqualToString_(v9, v288, (uint64_t)v287);

        if (v289)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_preprocess_scaled";
          goto LABEL_142;
        }
        v292 = objc_msgSend_length(CFSTR("run kernel: sparserendering_prefilter_x"), v290, v291);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_prefilter_x"), v293, 12, v292 - 12);
        v294 = (void *)objc_claimAutoreleasedReturnValue();
        v296 = objc_msgSend_isEqualToString_(v9, v295, (uint64_t)v294);

        if (v296)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_prefilter_x";
          goto LABEL_142;
        }
        v299 = objc_msgSend_length(CFSTR("run kernel: sparserendering_prefilter_y"), v297, v298);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_prefilter_y"), v300, 12, v299 - 12);
        v301 = (void *)objc_claimAutoreleasedReturnValue();
        v303 = objc_msgSend_isEqualToString_(v9, v302, (uint64_t)v301);

        if (v303)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_prefilter_y";
          goto LABEL_142;
        }
        v306 = objc_msgSend_length(CFSTR("run kernel: sparserendering_sample_withAlpha"), v304, v305);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_sample_withAlpha"), v307, 12, v306 - 12);
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        v310 = objc_msgSend_isEqualToString_(v9, v309, (uint64_t)v308);

        if (v310)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_sample_withAlpha";
          goto LABEL_142;
        }
        v313 = objc_msgSend_length(CFSTR("run kernel: sparserendering_sample_noAlpha"), v311, v312);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_sample_noAlpha"), v314, 12, v313 - 12);
        v315 = (void *)objc_claimAutoreleasedReturnValue();
        v317 = objc_msgSend_isEqualToString_(v9, v316, (uint64_t)v315);

        if (v317)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_sample_noAlpha";
          goto LABEL_142;
        }
        v320 = objc_msgSend_length(CFSTR("run kernel: sparserendering_antialias_x"), v318, v319);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_antialias_x"), v321, 12, v320 - 12);
        v322 = (void *)objc_claimAutoreleasedReturnValue();
        v324 = objc_msgSend_isEqualToString_(v9, v323, (uint64_t)v322);

        if (v324)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_antialias_x";
          goto LABEL_142;
        }
        v327 = objc_msgSend_length(CFSTR("run kernel: sparserendering_antialias_y"), v325, v326);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_antialias_y"), v328, 12, v327 - 12);
        v329 = (void *)objc_claimAutoreleasedReturnValue();
        v331 = objc_msgSend_isEqualToString_(v9, v330, (uint64_t)v329);

        if (v331)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_antialias_y";
          goto LABEL_142;
        }
        v334 = objc_msgSend_length(CFSTR("run kernel: sparserendering_yuv_out_1"), v332, v333);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_yuv_out_1"), v335, 12, v334 - 12);
        v336 = (void *)objc_claimAutoreleasedReturnValue();
        v338 = objc_msgSend_isEqualToString_(v9, v337, (uint64_t)v336);

        if (v338)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_yuv_out_1";
          goto LABEL_142;
        }
        v341 = objc_msgSend_length(CFSTR("run kernel: sparserendering_yuv_out_2"), v339, v340);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_yuv_out_2"), v342, 12, v341 - 12);
        v343 = (void *)objc_claimAutoreleasedReturnValue();
        v345 = objc_msgSend_isEqualToString_(v9, v344, (uint64_t)v343);

        if (v345)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_yuv_out_2";
          goto LABEL_142;
        }
        v348 = objc_msgSend_length(CFSTR("run kernel: sparserendering_extractY"), v346, v347);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_extractY"), v349, 12, v348 - 12);
        v350 = (void *)objc_claimAutoreleasedReturnValue();
        v352 = objc_msgSend_isEqualToString_(v9, v351, (uint64_t)v350);

        if (v352)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_extractY";
          goto LABEL_142;
        }
        v355 = objc_msgSend_length(CFSTR("run kernel: sparserendering_sample_noAlpha_ray"), v353, v354);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_sample_noAlpha_ray"), v356, 12, v355 - 12);
        v357 = (void *)objc_claimAutoreleasedReturnValue();
        v359 = objc_msgSend_isEqualToString_(v9, v358, (uint64_t)v357);

        if (v359)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_sample_noAlpha_ray";
          goto LABEL_142;
        }
        v362 = objc_msgSend_length(CFSTR("run kernel: sparserendering_add_noise"), v360, v361);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_add_noise"), v363, 12, v362 - 12);
        v364 = (void *)objc_claimAutoreleasedReturnValue();
        v366 = objc_msgSend_isEqualToString_(v9, v365, (uint64_t)v364);

        if (v366)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_add_noise";
          goto LABEL_142;
        }
        v369 = objc_msgSend_length(CFSTR("run kernel: sparserendering_blend_raytraced"), v367, v368);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_blend_raytraced"), v370, 12, v369 - 12);
        v371 = (void *)objc_claimAutoreleasedReturnValue();
        v373 = objc_msgSend_isEqualToString_(v9, v372, (uint64_t)v371);

        if (v373)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_blend_raytraced";
          goto LABEL_142;
        }
        v376 = objc_msgSend_length(CFSTR("run kernel: disparity_refinement_extract_positive_blur_values"), v374, v375);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: disparity_refinement_extract_positive_blur_values"), v377, 12, v376 - 12);
        v378 = (void *)objc_claimAutoreleasedReturnValue();
        v380 = objc_msgSend_isEqualToString_(v9, v379, (uint64_t)v378);

        if (v380)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: disparity_refinement_extract_positive_blur_values";
          goto LABEL_142;
        }
        v383 = objc_msgSend_length(CFSTR("run kernel: disparity_refinement_extract_negative_blur_values"), v381, v382);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: disparity_refinement_extract_negative_blur_values"), v384, 12, v383 - 12);
        v385 = (void *)objc_claimAutoreleasedReturnValue();
        v387 = objc_msgSend_isEqualToString_(v9, v386, (uint64_t)v385);

        if (v387)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: disparity_refinement_extract_negative_blur_values";
          goto LABEL_142;
        }
        v390 = objc_msgSend_length(CFSTR("run kernel: sparserendering_antialias_x_4chan"), v388, v389);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_antialias_x_4chan"), v391, 12, v390 - 12);
        v392 = (void *)objc_claimAutoreleasedReturnValue();
        v394 = objc_msgSend_isEqualToString_(v9, v393, (uint64_t)v392);

        if (v394)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_antialias_x_4chan";
          goto LABEL_142;
        }
        v397 = objc_msgSend_length(CFSTR("run kernel: sparserendering_antialias_y_4chan"), v395, v396);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_antialias_y_4chan"), v398, 12, v397 - 12);
        v399 = (void *)objc_claimAutoreleasedReturnValue();
        v401 = objc_msgSend_isEqualToString_(v9, v400, (uint64_t)v399);

        if (v401)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_antialias_y_4chan";
          goto LABEL_142;
        }
        v404 = objc_msgSend_length(CFSTR("run kernel: sparserendering_add_noise_only"), v402, v403);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sparserendering_add_noise_only"), v405, 12, v404 - 12);
        v406 = (void *)objc_claimAutoreleasedReturnValue();
        v408 = objc_msgSend_isEqualToString_(v9, v407, (uint64_t)v406);

        if (v408)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sparserendering_add_noise_only";
          goto LABEL_142;
        }
        v411 = objc_msgSend_length(CFSTR("run kernel: median3x3_oneChannel"), v409, v410);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: median3x3_oneChannel"), v412, 12, v411 - 12);
        v413 = (void *)objc_claimAutoreleasedReturnValue();
        v415 = objc_msgSend_isEqualToString_(v9, v414, (uint64_t)v413);

        if (v415)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: median3x3_oneChannel";
          goto LABEL_142;
        }
        v418 = objc_msgSend_length(CFSTR("run kernel: median3x3_twoChannel"), v416, v417);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: median3x3_twoChannel"), v419, 12, v418 - 12);
        v420 = (void *)objc_claimAutoreleasedReturnValue();
        v422 = objc_msgSend_isEqualToString_(v9, v421, (uint64_t)v420);

        if (v422)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: median3x3_twoChannel";
          goto LABEL_142;
        }
        v425 = objc_msgSend_length(CFSTR("run kernel: sobel_oneChannel"), v423, v424);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sobel_oneChannel"), v426, 12, v425 - 12);
        v427 = (void *)objc_claimAutoreleasedReturnValue();
        v429 = objc_msgSend_isEqualToString_(v9, v428, (uint64_t)v427);

        if (v429)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sobel_oneChannel";
          goto LABEL_142;
        }
        v432 = objc_msgSend_length(CFSTR("run kernel: sobel_yChannel_Thresholded"), v430, v431);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: sobel_yChannel_Thresholded"), v433, 12, v432 - 12);
        v434 = (void *)objc_claimAutoreleasedReturnValue();
        v436 = objc_msgSend_isEqualToString_(v9, v435, (uint64_t)v434);

        if (v436)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: sobel_yChannel_Thresholded";
          goto LABEL_142;
        }
        v439 = objc_msgSend_length(CFSTR("run kernel: blendBackgroundBlur"), v437, v438);
        objc_msgSend_substringWithRange_(CFSTR("run kernel: blendBackgroundBlur"), v440, 12, v439 - 12);
        v441 = (void *)objc_claimAutoreleasedReturnValue();
        v443 = objc_msgSend_isEqualToString_(v9, v442, (uint64_t)v441);

        if (v443)
        {
          uni_activity();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = "run kernel: blendBackgroundBlur";
          goto LABEL_142;
        }
LABEL_144:
        v46 = 0;
        goto LABEL_145;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_inputs(v1, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)CFSTR("desiredFormat"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = objc_msgSend_unsignedIntegerValue(v9, v10, v11);
          if (v12 == 70)
          {
            uni_activity();
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = "linear to sRGB texture view";
          }
          else if (v12 == 71)
          {
            uni_activity();
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = "sRGB to linear texture view";
          }
          else
          {
            uni_activity();
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = "texture view of misc type";
          }
          goto LABEL_142;
        }
      }
      goto LABEL_144;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uni_activity();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = "run kernel: Gaussian Blur";
LABEL_24:
      v9 = _os_activity_create(&dword_24B6B5000, v16, v15, OS_ACTIVITY_FLAG_DEFAULT);
LABEL_143:

      v46 = 1;
LABEL_145:

      goto LABEL_146;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uni_activity();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = "run kernel: Guided Filter";
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uni_activity();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = "run kernel: Highlight Recovery";
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uni_activity();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = "run kernel: Morphology";
      goto LABEL_24;
    }
  }
  v46 = 0;
LABEL_146:

  return v46;
}

void sub_24B6E0400(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_24B6E0430()
{
  if (qword_2544D9CF8 != -1)
    dispatch_once(&qword_2544D9CF8, &unk_251C8FB30);
  return (id)qword_2544D9CF0;
}

void sub_24B6E061C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24B6E0C90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24B6E5788(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x580], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24B6E5914(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_24B6E5924(uint64_t a1)
{

}

double sub_24B6E592C(uint64_t a1, const char *a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  double (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double);
  double v14;

  objc_msgSend_roiCallback(*(void **)(a1 + 32), a2, a3);
  v13 = (double (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double))objc_claimAutoreleasedReturnValue();
  v14 = ((double (**)(_QWORD, const char *, _QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double))v13)[2](v13, a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a4, a5, a6, a7);

  return v14;
}

void sub_24B6E65F8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_2544D9CF0;
  qword_2544D9CF0 = v3;

}

void sub_24B6E6624(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0xCu);
}

void sub_24B6E664C(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

uint64_t sub_24B6E6660(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_UTF8String(a1, a2, a3);
}

uint64_t sub_24B6E6668(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_UTF8String(a1, a2, a3);
}

void sub_24B6E6670(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_24B6E6698()
{
  uint64_t v0;

  return v0;
}

void sub_24B6E6B44(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  NSObject *v5;

  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id uni_logger_general()
{
  if (qword_2579AEBE0 != -1)
    dispatch_once(&qword_2579AEBE0, &unk_251C8FB50);
  return (id)qword_2579AEBD8;
}

void sub_24B6E6B94()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.unified_rendering", "general");
  v1 = (void *)qword_2579AEBD8;
  qword_2579AEBD8 = (uint64_t)v0;

}

id uni_logger_api()
{
  if (qword_2579AEBF0 != -1)
    dispatch_once(&qword_2579AEBF0, &unk_251C8FB70);
  return (id)qword_2579AEBE8;
}

void sub_24B6E6C04()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.unified_rendering", "api");
  v1 = (void *)qword_2579AEBE8;
  qword_2579AEBE8 = (uint64_t)v0;

}

id uni_logger_render()
{
  if (qword_2544D9CB0 != -1)
    dispatch_once(&qword_2544D9CB0, &unk_251C8FB90);
  return (id)qword_2544D9CA8;
}

void sub_24B6E6C74()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.unified_rendering", "render");
  v1 = (void *)qword_2544D9CA8;
  qword_2544D9CA8 = (uint64_t)v0;

}

id uni_logger_performance()
{
  if (qword_2579AEC00 != -1)
    dispatch_once(&qword_2579AEC00, &unk_251C8FBB0);
  return (id)qword_2579AEBF8;
}

void sub_24B6E6CE4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.unified_rendering", "performace");
  v1 = (void *)qword_2579AEBF8;
  qword_2579AEBF8 = (uint64_t)v0;

}

id uni_logger_compile()
{
  if (qword_2579AEC10 != -1)
    dispatch_once(&qword_2579AEC10, &unk_251C8FBD0);
  return (id)qword_2579AEC08;
}

void sub_24B6E6D54()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.unified_rendering", "compile");
  v1 = (void *)qword_2579AEC08;
  qword_2579AEC08 = (uint64_t)v0;

}

id uni_logger_cache()
{
  if (qword_2579AEC20 != -1)
    dispatch_once(&qword_2579AEC20, &unk_251C8FBF0);
  return (id)qword_2579AEC18;
}

void sub_24B6E6DC4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.unified_rendering", "cache");
  v1 = (void *)qword_2579AEC18;
  qword_2579AEC18 = (uint64_t)v0;

}

id uni_activity()
{
  if (qword_2544D9D28 != -1)
    dispatch_once(&qword_2544D9D28, &unk_251C8FC10);
  return (id)qword_2544D9D20;
}

void sub_24B6E6E34()
{
  os_activity_t v0;
  void *v1;

  v0 = _os_activity_create(&dword_24B6B5000, "com.apple.unified_rendering", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
  v1 = (void *)qword_2544D9D20;
  qword_2544D9D20 = (uint64_t)v0;

}

id sub_24B6E72A4(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDD16E0];
    v2 = a1;
    objc_msgSend_extent(v2, v3, v4);
    objc_msgSend_numberWithDouble_(v1, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v7;
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_extent(v2, v9, v10);
    objc_msgSend_numberWithDouble_(v8, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v14;
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_extent(v2, v16, v17);
    objc_msgSend_numberWithDouble_(v15, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v21;
    v22 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_extent(v2, v23, v24);
    v26 = v25;

    objc_msgSend_numberWithDouble_(v22, v27, v28, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v29;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v30, (uint64_t)v33, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v31;
}

void sub_24B6E8428(void *a1@<X0>, uint64_t *a2@<X8>)
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a1;
  if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend_count(v20, v3, v4) == 3)
  {
    objc_msgSend_objectAtIndexedSubscript_(v20, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_unsignedIntegerValue(v6, v7, v8);
    objc_msgSend_objectAtIndexedSubscript_(v20, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_unsignedIntegerValue(v11, v12, v13);
    objc_msgSend_objectAtIndexedSubscript_(v20, v15, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_unsignedIntegerValue(v16, v17, v18);
    *a2 = v9;
    a2[1] = v14;
    a2[2] = v19;

  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }

}

id sub_24B6E87EC(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (!v1)
    sub_24B6F2A7C();
  v3 = v1;
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v1, v2, (uint64_t)CFSTR("\n"), &stru_251C92910);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_24B6E9C90(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t sub_24B6EA8EC()
{
  return 1;
}

void sub_24B6EA8F4(void *a1, uint64_t a2, void *a3)
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  uint64_t v66;
  const char *v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t isDepthTexture;
  const char *v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  const char *v89;
  void *v90;
  uint64_t v91;
  const char *v92;
  void *v93;
  const char *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  const char *v100;
  id v101;

  v101 = a3;
  objc_msgSend_name(a1, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v101, v7, (uint64_t)v6, CFSTR("name"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  v11 = objc_msgSend_type(a1, v9, v10);
  objc_msgSend_numberWithUnsignedInteger_(v8, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v101, v14, (uint64_t)v13, CFSTR("type"));

  v15 = (void *)MEMORY[0x24BDD16E0];
  v18 = objc_msgSend_access(a1, v16, v17);
  objc_msgSend_numberWithUnsignedInteger_(v15, v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v101, v21, (uint64_t)v20, CFSTR("access"));

  v22 = (void *)MEMORY[0x24BDD16E0];
  v25 = objc_msgSend_index(a1, v23, v24);
  objc_msgSend_numberWithUnsignedInteger_(v22, v26, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v101, v28, (uint64_t)v27, CFSTR("index"));

  v31 = objc_msgSend_type(a1, v29, v30);
  switch(v31)
  {
    case 2:
      v65 = (void *)MEMORY[0x24BDD16E0];
      v66 = objc_msgSend_textureType(a1, v32, v33);
      objc_msgSend_numberWithUnsignedInteger_(v65, v67, v66);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v101, v69, (uint64_t)v68, CFSTR("textureType"));

      v70 = (void *)MEMORY[0x24BDD16E0];
      v73 = objc_msgSend_textureDataType(a1, v71, v72);
      objc_msgSend_numberWithUnsignedInteger_(v70, v74, v73);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v101, v76, (uint64_t)v75, CFSTR("textureDataType"));

      v77 = (void *)MEMORY[0x24BDD16E0];
      isDepthTexture = objc_msgSend_isDepthTexture(a1, v78, v79);
      objc_msgSend_numberWithBool_(v77, v81, isDepthTexture);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v101, v83, (uint64_t)v82, CFSTR("isDepthTexture"));

      v84 = (void *)MEMORY[0x24BDD16E0];
      v87 = objc_msgSend_arrayLength(a1, v85, v86);
      objc_msgSend_numberWithUnsignedInteger_(v84, v88, v87);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v101, v89, (uint64_t)v63, CFSTR("arrayLength"));
      goto LABEL_10;
    case 1:
      v90 = (void *)MEMORY[0x24BDD16E0];
      v91 = objc_msgSend_threadgroupMemoryAlignment(a1, v32, v33);
      objc_msgSend_numberWithUnsignedInteger_(v90, v92, v91);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v101, v94, (uint64_t)v93, CFSTR("threadgroupMemoryAlignment"));

      v95 = (void *)MEMORY[0x24BDD16E0];
      v98 = objc_msgSend_threadgroupMemoryDataSize(a1, v96, v97);
      objc_msgSend_numberWithUnsignedInteger_(v95, v99, v98);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v101, v100, (uint64_t)v63, CFSTR("threadgroupMemoryDataSize"));
      goto LABEL_10;
    case 0:
      v34 = (void *)MEMORY[0x24BDD16E0];
      v35 = objc_msgSend_bufferAlignment(a1, v32, v33);
      objc_msgSend_numberWithUnsignedInteger_(v34, v36, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v101, v38, (uint64_t)v37, CFSTR("bufferAlignment"));

      v39 = (void *)MEMORY[0x24BDD16E0];
      v42 = objc_msgSend_bufferDataSize(a1, v40, v41);
      objc_msgSend_numberWithUnsignedInteger_(v39, v43, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v101, v45, (uint64_t)v44, CFSTR("bufferDataSize"));

      v46 = (void *)MEMORY[0x24BDD16E0];
      v49 = objc_msgSend_bufferDataType(a1, v47, v48);
      objc_msgSend_numberWithUnsignedInteger_(v46, v50, v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v101, v52, (uint64_t)v51, CFSTR("bufferDataType"));

      objc_msgSend_bufferStructType(a1, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        objc_msgSend_bufferStructType(a1, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_encodeObject_forKey_(v101, v59, (uint64_t)v58, CFSTR("bufferStructType"));

      }
      objc_msgSend_bufferPointerType(a1, v56, v57);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
      {
        objc_msgSend_bufferPointerType(a1, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_encodeObject_forKey_(v101, v64, (uint64_t)v63, CFSTR("bufferPointerType"));
LABEL_10:

      }
      break;
  }

}

URMTLArgument *sub_24B6EAC7C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  URMTLArgument *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  URMTLArgument *v90;

  v4 = a3;
  v5 = objc_alloc_init(URMTLArgument);
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v5, v10, (uint64_t)v9);

  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v6, CFSTR("type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_unsignedIntegerValue(v12, v13, v14);
  objc_msgSend_setType_(v5, v16, v15);

  objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v6, CFSTR("access"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_unsignedIntegerValue(v18, v19, v20);
  objc_msgSend_setAccess_(v5, v22, v21);

  objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v6, CFSTR("index"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_unsignedIntegerValue(v24, v25, v26);
  objc_msgSend_setIndex_(v5, v28, v27);

  v31 = objc_msgSend_type(v5, v29, v30);
  if (v31 == 2)
  {
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v6, CFSTR("textureType"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend_unsignedIntegerValue(v58, v59, v60);
    objc_msgSend_setTextureType_(v5, v62, v61);

    objc_msgSend_decodeObjectOfClass_forKey_(v4, v63, v6, CFSTR("textureDataType"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend_unsignedIntegerValue(v64, v65, v66);
    objc_msgSend_setTextureDataType_(v5, v68, v67);

    objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v6, CFSTR("isDepthTexture"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend_BOOLValue(v70, v71, v72);
    objc_msgSend_setIsDepthTexture_(v5, v74, v73);

    objc_msgSend_decodeObjectOfClass_forKey_(v4, v75, v6, CFSTR("arrayLength"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend_unsignedIntegerValue(v56, v76, v77);
    objc_msgSend_setArrayLength_(v5, v79, v78);
  }
  else if (v31 == 1)
  {
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v6, CFSTR("threadgroupMemoryAlignment"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend_unsignedIntegerValue(v80, v81, v82);
    objc_msgSend_setThreadgroupMemoryAlignment_(v5, v84, v83);

    objc_msgSend_decodeObjectOfClass_forKey_(v4, v85, v6, CFSTR("threadgroupMemoryDataSize"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend_unsignedIntegerValue(v56, v86, v87);
    objc_msgSend_setThreadgroupMemoryDataSize_(v5, v89, v88);
  }
  else
  {
    if (v31)
    {
      v90 = 0;
      goto LABEL_9;
    }
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v6, CFSTR("bufferAlignment"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_unsignedIntegerValue(v33, v34, v35);
    objc_msgSend_setBufferAlignment_(v5, v37, v36);

    objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v6, CFSTR("bufferDataSize"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend_unsignedIntegerValue(v39, v40, v41);
    objc_msgSend_setBufferDataSize_(v5, v43, v42);

    objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v6, CFSTR("bufferDataType"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_unsignedIntegerValue(v45, v46, v47);
    objc_msgSend_setBufferDataType_(v5, v49, v48);

    v50 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, CFSTR("bufferStructType"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBufferStructType_(v5, v53, (uint64_t)v52);

    v54 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, CFSTR("bufferPointerType"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBufferPointerType_(v5, v57, (uint64_t)v56);
  }

  v90 = v5;
LABEL_9:

  return v90;
}

uint64_t sub_24B6EAFF4()
{
  return 1;
}

void sub_24B6EAFFC(void *a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t IsArgumentBuffer;
  const char *v37;
  const char *v38;
  id v39;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  v8 = objc_msgSend_elementType(a1, v6, v7);
  objc_msgSend_numberWithUnsignedInteger_(v4, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)v10, CFSTR("elementType"));

  v12 = (void *)MEMORY[0x24BDD16E0];
  v15 = objc_msgSend_access(a1, v13, v14);
  objc_msgSend_numberWithUnsignedInteger_(v12, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v18, (uint64_t)v17, CFSTR("access"));

  v19 = (void *)MEMORY[0x24BDD16E0];
  v22 = objc_msgSend_alignment(a1, v20, v21);
  objc_msgSend_numberWithUnsignedInteger_(v19, v23, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v25, (uint64_t)v24, CFSTR("alignment"));

  v26 = (void *)MEMORY[0x24BDD16E0];
  v29 = objc_msgSend_dataSize(a1, v27, v28);
  objc_msgSend_numberWithUnsignedInteger_(v26, v30, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v32, (uint64_t)v31, CFSTR("dataSize"));

  v33 = (void *)MEMORY[0x24BDD16E0];
  IsArgumentBuffer = objc_msgSend_elementIsArgumentBuffer(a1, v34, v35);
  objc_msgSend_numberWithBool_(v33, v37, IsArgumentBuffer);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v38, (uint64_t)v39, CFSTR("elementIsArgumentBuffer"));

}

URMTLPointerType *sub_24B6EB150(void *a1, uint64_t a2, void *a3)
{
  id v4;
  URMTLPointerType *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;

  v4 = a3;
  v5 = objc_alloc_init(URMTLPointerType);
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("elementType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_unsignedIntegerValue(v8, v9, v10);
  objc_msgSend_setElementType_(v5, v12, v11);

  objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v6, CFSTR("access"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_unsignedIntegerValue(v14, v15, v16);
  objc_msgSend_setAccess_(v5, v18, v17);

  objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v6, CFSTR("alignment"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_unsignedIntegerValue(v20, v21, v22);
  objc_msgSend_setAlignment_(v5, v24, v23);

  objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v6, CFSTR("dataSize"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_unsignedIntegerValue(v26, v27, v28);
  objc_msgSend_setDataSize_(v5, v30, v29);

  objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v6, CFSTR("elementIsArgumentBuffer"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_msgSend_BOOLValue(v32, v33, v34);
  objc_msgSend_setElementIsArgumentBuffer_(v5, v36, v35);

  return v5;
}

uint64_t sub_24B6EB2A8()
{
  return 1;
}

void sub_24B6EB2B0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  URMTLStructMemberInternal *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_members(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCEB8];
  v11 = objc_msgSend_count(v7, v9, v10);
  objc_msgSend_arrayWithCapacity_(v8, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v14 = v7;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v41, v45, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v42;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v19);
        v21 = objc_alloc_init(URMTLStructMemberInternal);
        objc_msgSend_name(v20, v22, v23, (_QWORD)v41);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setName_(v21, v25, (uint64_t)v24);

        v28 = objc_msgSend_offset(v20, v26, v27);
        objc_msgSend_setOffset_(v21, v29, v28);
        v32 = objc_msgSend_dataType(v20, v30, v31);
        objc_msgSend_setDataType_(v21, v33, v32);
        v36 = objc_msgSend_argumentIndex(v20, v34, v35);
        objc_msgSend_setArgumentIndex_(v21, v37, v36);
        objc_msgSend_addObject_(v13, v38, (uint64_t)v21);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v39, (uint64_t)&v41, v45, 16);
    }
    while (v17);
  }

  objc_msgSend_encodeObject_forKey_(v4, v40, (uint64_t)v13, CFSTR("members"));
}

URMTLStructType *sub_24B6EB478(void *a1, uint64_t a2, void *a3)
{
  id v4;
  URMTLStructType *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;

  v4 = a3;
  v5 = objc_alloc_init(URMTLStructType);
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("members"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setMembers_(v5, v9, (uint64_t)v8);
  return v5;
}

id tmpTexturesFromTexture(void *a1, unsigned int a2, uint64_t a3)
{
  const char *v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  void *v48;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a1;
  if (a2)
  {
    objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v5, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_device(v6, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bufferOffset(v6, v11, v12);
    v13 = (void *)MEMORY[0x24BDDD740];
    v16 = objc_msgSend_width(v6, v14, v15);
    v19 = objc_msgSend_height(v6, v17, v18);
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v13, v20, a3, v16, v19, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsage_(v21, v22, 19);
    v24 = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(v10, v23, a3);
    MTLPixelFormatGetInfoForDevice();
    objc_msgSend_width(v6, v25, v26, 0, 0, 0);
    v29 = ((v24 - 1) & -v24) * objc_msgSend_height(v6, v27, v28);
    if (v29 * (unint64_t)a2 > objc_msgSend_allocatedSize(v6, v30, v31))
    {
      uni_logger_performance();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446722;
        v51 = "tmpTexturesFromTexture";
        v52 = 2048;
        v53 = objc_msgSend_allocatedSize(v6, v33, v34);
        v54 = 2048;
        v55 = v29;
        _os_log_impl(&dword_24B6B5000, v32, OS_LOG_TYPE_INFO, "%{public}s Insufficient backing size = %ld need %ld", buf, 0x20u);
      }

    }
    do
    {
      uni_logger_performance();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_description(v21, v40, v41);
        v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v38 = objc_msgSend_UTF8String(v35, v36, v37);
        *(_DWORD *)buf = 136446466;
        v51 = "tmpTexturesFromTexture";
        v52 = 2080;
        v53 = v38;
        _os_log_debug_impl(&dword_24B6B5000, v39, OS_LOG_TYPE_DEBUG, "%{public}s Creating texture at runtime %s", buf, 0x16u);

      }
      v43 = (void *)objc_msgSend_newTextureWithDescriptor_(v10, v42, (uint64_t)v21);
      objc_msgSend_imageWithMTLTexture_(UniImage, v44, (uint64_t)v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v7, v46, (uint64_t)v45);

      --a2;
    }
    while (a2);
    objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v47, (uint64_t)v7);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v48 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v48;
}

uint64_t sub_24B6EBA18(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a3)
    return objc_msgSend_setObject_forKey_(a1, a2, a3);
  else
    return objc_msgSend_removeObjectForKey_(a1, a2, a4);
}

id loadBMTL(uint64_t a1, void *a2, _DWORD *a3)
{
  id v5;
  const char *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  unsigned int *v14;
  const char *v15;
  uint64_t v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  _QWORD v30[6];

  v5 = a2;
  objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v6, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_dataWithContentsOfURL_(MEMORY[0x24BDBCE50], v7, (uint64_t)v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
      goto LABEL_7;
    v11 = objc_retainAutorelease(v9);
    v14 = (unsigned int *)objc_msgSend_bytes(v11, v12, v13);
    if (!v14)
      goto LABEL_7;
    v17 = v14;
    v19 = *v14;
    v18 = v14[1];
    v21 = v14[2];
    v20 = v14[3];
    if (a3)
      *a3 = v20;
    if (objc_msgSend_length(v11, v15, v16) >= (unint64_t)(v20 * v18) + 16)
    {
      objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v22, v21, v19, v18, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v25;
      if (v25)
      {
        objc_msgSend_setUsage_(v25, v26, 19);
        v23 = (void *)objc_msgSend_newTextureWithDescriptor_(v5, v28, (uint64_t)v27);
        memset(v30, 0, 24);
        v30[3] = v19;
        v30[4] = v18;
        v30[5] = 1;
        objc_msgSend_replaceRegion_mipmapLevel_withBytes_bytesPerRow_(v23, v29, (uint64_t)v30, 0, v17 + 4, v20);
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
LABEL_7:
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

id getTextureDataAsBuffer(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  _QWORD v37[3];
  _QWORD v38[3];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  if (!a1)
    return 0;
  v1 = a1;
  objc_msgSend_device(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  objc_msgSend_device(v1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pixelFormat(v1, v8, v9);
  MTLPixelFormatGetInfoForDevice();

  objc_msgSend_width(v1, v10, v11);
  objc_msgSend_height(v1, v12, v13);
  v15 = (void *)objc_msgSend_newBufferWithLength_options_(v4, v14, 0, 0);
  v18 = (void *)objc_msgSend_newCommandQueue(v4, v16, v17);
  objc_msgSend_commandBuffer(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_blitCommandEncoder(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v38, 0, sizeof(v38));
  v37[0] = objc_msgSend_width(v1, v25, v26);
  v37[1] = objc_msgSend_height(v1, v27, v28);
  v37[2] = 1;
  objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_(v24, v29, (uint64_t)v1, 0, 0, v38, v37, v15, 0, 0, 0);

  objc_msgSend_endEncoding(v24, v30, v31);
  objc_msgSend_commit(v21, v32, v33);
  objc_msgSend_waitUntilCompleted(v21, v34, v35);

  return v15;
}

void writeTextureAs2DBMTL(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  _DWORD *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  int v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  void *v34;
  const char *v35;

  v3 = a2;
  v4 = a1;
  getTextureDataAsBuffer(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v4, v6, v7, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pixelFormat(v4, v9, v10);
  MTLPixelFormatGetInfoForDevice();

  objc_msgSend_width(v4, v11, v12);
  objc_msgSend_height(v4, v13, v14);
  v15 = objc_alloc(MEMORY[0x24BDBCEC8]);
  v17 = objc_retainAutorelease((id)objc_msgSend_initWithLength_(v15, v16, 16));
  v20 = (_DWORD *)objc_msgSend_mutableBytes(v17, v18, v19);
  *v20 = objc_msgSend_width(v4, v21, v22);
  v20[1] = objc_msgSend_height(v4, v23, v24);
  v27 = objc_msgSend_pixelFormat(v4, v25, v26);

  v20[2] = v27;
  v20[3] = 0;
  v28 = objc_retainAutorelease(v5);
  v31 = objc_msgSend_contents(v28, v29, v30);
  objc_msgSend_replaceBytesInRange_withBytes_(v17, v32, 16, 0, v31);
  objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v33, (uint64_t)v3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_writeToURL_atomically_(v17, v35, (uint64_t)v34, 0);
}

id createSimilarTexture(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  _BOOL8 v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;

  v3 = a1;
  v6 = v3;
  v7 = 0;
  if (v3 && a2)
  {
    v8 = (void *)MEMORY[0x24BDDD740];
    v9 = objc_msgSend_width(v3, v4, v5);
    v12 = objc_msgSend_height(v6, v10, v11);
    v15 = (unint64_t)objc_msgSend_mipmapLevelCount(v6, v13, v14) > 1;
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v8, v16, a2, v9, v12, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    if (v17)
    {
      objc_msgSend_setUsage_(v17, v18, 19);
      objc_msgSend_device(v6, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend_newTextureWithDescriptor_(v22, v23, (uint64_t)v19);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

id MTLDataTypeAsString(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  id v9;
  void *v10;
  _QWORD v12[99];
  _QWORD v13[100];

  v13[99] = *MEMORY[0x24BDAC8D0];
  v12[0] = &unk_251C9CD38;
  v12[1] = &unk_251C9CD50;
  v13[0] = CFSTR("MTLDataTypeNone");
  v13[1] = CFSTR("MTLDataTypeStruct");
  v12[2] = &unk_251C9CD68;
  v12[3] = &unk_251C9CD80;
  v13[2] = CFSTR("MTLDataTypeArray");
  v13[3] = CFSTR("MTLDataTypeFloat");
  v12[4] = &unk_251C9CD98;
  v12[5] = &unk_251C9CDB0;
  v13[4] = CFSTR("MTLDataTypeFloat2");
  v13[5] = CFSTR("MTLDataTypeFloat3");
  v12[6] = &unk_251C9CDC8;
  v12[7] = &unk_251C9CDE0;
  v13[6] = CFSTR("MTLDataTypeFloat4");
  v13[7] = CFSTR("MTLDataTypeFloat2x2");
  v12[8] = &unk_251C9CDF8;
  v12[9] = &unk_251C9CE10;
  v13[8] = CFSTR("MTLDataTypeFloat2x3");
  v13[9] = CFSTR("MTLDataTypeFloat2x4");
  v12[10] = &unk_251C9CE28;
  v12[11] = &unk_251C9CE40;
  v13[10] = CFSTR("MTLDataTypeFloat3x2");
  v13[11] = CFSTR("MTLDataTypeFloat3x3");
  v12[12] = &unk_251C9CE58;
  v12[13] = &unk_251C9CE70;
  v13[12] = CFSTR("MTLDataTypeFloat3x4");
  v13[13] = CFSTR("MTLDataTypeFloat4x2");
  v12[14] = &unk_251C9CE88;
  v12[15] = &unk_251C9CEA0;
  v13[14] = CFSTR("MTLDataTypeFloat4x3");
  v13[15] = CFSTR("MTLDataTypeFloat4x4");
  v12[16] = &unk_251C9CEB8;
  v12[17] = &unk_251C9CED0;
  v13[16] = CFSTR("MTLDataTypeHalf");
  v13[17] = CFSTR("MTLDataTypeHalf2");
  v12[18] = &unk_251C9CEE8;
  v12[19] = &unk_251C9CF00;
  v13[18] = CFSTR("MTLDataTypeHalf3");
  v13[19] = CFSTR("MTLDataTypeHalf4");
  v12[20] = &unk_251C9CF18;
  v12[21] = &unk_251C9CF30;
  v13[20] = CFSTR("MTLDataTypeHalf2x2");
  v13[21] = CFSTR("MTLDataTypeHalf2x3");
  v12[22] = &unk_251C9CF48;
  v12[23] = &unk_251C9CF60;
  v13[22] = CFSTR("MTLDataTypeHalf2x4");
  v13[23] = CFSTR("MTLDataTypeHalf3x2");
  v12[24] = &unk_251C9CF78;
  v12[25] = &unk_251C9CF90;
  v13[24] = CFSTR("MTLDataTypeHalf3x3");
  v13[25] = CFSTR("MTLDataTypeHalf3x4");
  v12[26] = &unk_251C9CFA8;
  v12[27] = &unk_251C9CFC0;
  v13[26] = CFSTR("MTLDataTypeHalf4x2");
  v13[27] = CFSTR("MTLDataTypeHalf4x3");
  v12[28] = &unk_251C9CFD8;
  v12[29] = &unk_251C9CFF0;
  v13[28] = CFSTR("MTLDataTypeHalf4x4");
  v13[29] = CFSTR("MTLDataTypeInt");
  v12[30] = &unk_251C9D008;
  v12[31] = &unk_251C9D020;
  v13[30] = CFSTR("MTLDataTypeInt2");
  v13[31] = CFSTR("MTLDataTypeInt3");
  v12[32] = &unk_251C9D038;
  v12[33] = &unk_251C9D050;
  v13[32] = CFSTR("MTLDataTypeInt4");
  v13[33] = CFSTR("MTLDataTypeUInt");
  v12[34] = &unk_251C9D068;
  v12[35] = &unk_251C9D080;
  v13[34] = CFSTR("MTLDataTypeUInt2");
  v13[35] = CFSTR("MTLDataTypeUInt3");
  v12[36] = &unk_251C9D098;
  v12[37] = &unk_251C9D0B0;
  v13[36] = CFSTR("MTLDataTypeUInt4");
  v13[37] = CFSTR("MTLDataTypeShort");
  v12[38] = &unk_251C9D0C8;
  v12[39] = &unk_251C9D0E0;
  v13[38] = CFSTR("MTLDataTypeShort2");
  v13[39] = CFSTR("MTLDataTypeShort3");
  v12[40] = &unk_251C9D0F8;
  v12[41] = &unk_251C9D110;
  v13[40] = CFSTR("MTLDataTypeShort4");
  v13[41] = CFSTR("MTLDataTypeUShort");
  v12[42] = &unk_251C9D128;
  v12[43] = &unk_251C9D140;
  v13[42] = CFSTR("MTLDataTypeUShort2");
  v13[43] = CFSTR("MTLDataTypeUShort3");
  v12[44] = &unk_251C9D158;
  v12[45] = &unk_251C9D170;
  v13[44] = CFSTR("MTLDataTypeUShort4");
  v13[45] = CFSTR("MTLDataTypeChar");
  v12[46] = &unk_251C9D188;
  v12[47] = &unk_251C9D1A0;
  v13[46] = CFSTR("MTLDataTypeChar2");
  v13[47] = CFSTR("MTLDataTypeChar3");
  v12[48] = &unk_251C9D1B8;
  v12[49] = &unk_251C9D1D0;
  v13[48] = CFSTR("MTLDataTypeChar4");
  v13[49] = CFSTR("MTLDataTypeUChar");
  v12[50] = &unk_251C9D1E8;
  v12[51] = &unk_251C9D200;
  v13[50] = CFSTR("MTLDataTypeUChar2");
  v13[51] = CFSTR("MTLDataTypeUChar3");
  v12[52] = &unk_251C9D218;
  v12[53] = &unk_251C9D230;
  v13[52] = CFSTR("MTLDataTypeUChar4");
  v13[53] = CFSTR("MTLDataTypeBool");
  v12[54] = &unk_251C9D248;
  v12[55] = &unk_251C9D260;
  v13[54] = CFSTR("MTLDataTypeBool2");
  v13[55] = CFSTR("MTLDataTypeBool3");
  v12[56] = &unk_251C9D278;
  v12[57] = &unk_251C9D290;
  v13[56] = CFSTR("MTLDataTypeBool4");
  v13[57] = CFSTR("MTLDataTypeTexture");
  v12[58] = &unk_251C9D2A8;
  v12[59] = &unk_251C9D2C0;
  v13[58] = CFSTR("MTLDataTypeSampler");
  v13[59] = CFSTR("MTLDataTypePointer");
  v12[60] = &unk_251C9D2D8;
  v12[61] = &unk_251C9D2F0;
  v13[60] = CFSTR("MTLDataTypeRenderPipeline");
  v13[61] = CFSTR("MTLDataTypeIndirectCommandBuffer");
  v12[62] = &unk_251C9D308;
  v12[63] = &unk_251C9D320;
  v13[62] = CFSTR("MTLDataTypeVisibleFunctionTable");
  v13[63] = CFSTR("MTLDataTypePrivateIndirectArgument");
  v12[64] = &unk_251C9D338;
  v13[64] = CFSTR("MTLDataTypePrivateVoid");
  v12[65] = &unk_251C9D350;
  v13[65] = CFSTR("MTLDataTypeLong");
  v12[66] = &unk_251C9D368;
  v13[66] = CFSTR("MTLDataTypeLong2");
  v12[67] = &unk_251C9D380;
  v13[67] = CFSTR("MTLDataTypeLong3");
  v12[68] = &unk_251C9D398;
  v13[68] = CFSTR("MTLDataTypeLong4");
  v12[69] = &unk_251C9D3B0;
  v13[69] = CFSTR("MTLDataTypeULong");
  v12[70] = &unk_251C9D3C8;
  v13[70] = CFSTR("MTLDataTypeULong2");
  v12[71] = &unk_251C9D3E0;
  v13[71] = CFSTR("MTLDataTypeULong3");
  v12[72] = &unk_251C9D3F8;
  v13[72] = CFSTR("MTLDataTypeULong4");
  v12[73] = &unk_251C9D410;
  v13[73] = CFSTR("MTLDataTypeDouble");
  v12[74] = &unk_251C9D428;
  v13[74] = CFSTR("MTLDataTypeDouble2");
  v12[75] = &unk_251C9D440;
  v13[75] = CFSTR("MTLDataTypeDouble3");
  v12[76] = &unk_251C9D458;
  v13[76] = CFSTR("MTLDataTypeDouble4");
  v12[77] = &unk_251C9D470;
  v13[77] = CFSTR("MTLDataTypeFloat8");
  v12[78] = &unk_251C9D488;
  v13[78] = CFSTR("MTLDataTypeFloat16");
  v12[79] = &unk_251C9D4A0;
  v13[79] = CFSTR("MTLDataTypeHalf8");
  v12[80] = &unk_251C9D4B8;
  v13[80] = CFSTR("MTLDataTypeHalf16");
  v12[81] = &unk_251C9D4D0;
  v13[81] = CFSTR("MTLDataTypeInt8");
  v12[82] = &unk_251C9D4E8;
  v13[82] = CFSTR("MTLDataTypeInt16");
  v12[83] = &unk_251C9D500;
  v13[83] = CFSTR("MTLDataTypeUInt8");
  v12[84] = &unk_251C9D518;
  v13[84] = CFSTR("MTLDataTypeUInt16");
  v12[85] = &unk_251C9D530;
  v13[85] = CFSTR("MTLDataTypeShort8");
  v12[86] = &unk_251C9D548;
  v13[86] = CFSTR("MTLDataTypeShort16");
  v12[87] = &unk_251C9D560;
  v13[87] = CFSTR("MTLDataTypeUShort8");
  v12[88] = &unk_251C9D578;
  v13[88] = CFSTR("MTLDataTypeUShort16");
  v12[89] = &unk_251C9D590;
  v13[89] = CFSTR("MTLDataTypeChar8");
  v12[90] = &unk_251C9D5A8;
  v13[90] = CFSTR("MTLDataTypeChar16");
  v12[91] = &unk_251C9D5C0;
  v13[91] = CFSTR("MTLDataTypeUChar8");
  v12[92] = &unk_251C9D5D8;
  v13[92] = CFSTR("MTLDataTypeUChar16");
  v12[93] = &unk_251C9D5F0;
  v13[93] = CFSTR("MTLDataTypeLong8");
  v12[94] = &unk_251C9D608;
  v13[94] = CFSTR("MTLDataTypeLong16");
  v12[95] = &unk_251C9D620;
  v13[95] = CFSTR("MTLDataTypeULong8");
  v12[96] = &unk_251C9D638;
  v13[96] = CFSTR("MTLDataTypeULong16");
  v12[97] = &unk_251C9D650;
  v13[97] = CFSTR("MTLDataTypeDouble8");
  v12[98] = &unk_251C9D668;
  v13[98] = CFSTR("MTLDataTypeDouble16");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v13, v12, 99);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v4, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("MTLDataType(%lu) (unknown type)"), a1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

BOOL isSupportedType(uint64_t a1)
{
  _BOOL8 result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = 0;
  v4 = 0;
  if ((unint64_t)(a1 - 3) < 0x36)
    return 1;
  v2 = numComponentsForType(a1, &v4, &v3);
  result = 0;
  if (v2)
  {
    if (v4)
      return v3 != 0;
  }
  return result;
}

uint64_t numComponentsForType(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  result = 0;
  if (a2 && a3)
  {
    v5 = 0;
    *a2 = 0;
    v6 = 81;
    v7 = 45;
    v8 = 37;
    v9 = 8;
    v10 = 29;
    v11 = 4;
    result = 1;
    switch(a1)
    {
      case 3:
      case 16:
      case 29:
      case 33:
      case 37:
      case 41:
      case 45:
      case 49:
      case 53:
      case 81:
      case 85:
      case 89:
        goto LABEL_7;
      case 4:
      case 17:
      case 30:
      case 34:
      case 38:
      case 42:
      case 46:
      case 50:
      case 54:
      case 82:
      case 86:
      case 90:
        --a1;
        result = 2;
        goto LABEL_7;
      case 5:
      case 18:
      case 31:
      case 35:
      case 39:
      case 43:
      case 47:
      case 51:
      case 55:
      case 83:
      case 87:
      case 91:
        a1 -= 2;
        result = 3;
        goto LABEL_7;
      case 6:
      case 19:
      case 32:
      case 36:
      case 40:
      case 44:
      case 48:
      case 52:
      case 56:
      case 84:
      case 88:
      case 92:
        result = 4;
        a1 -= 3;
LABEL_7:
        *a2 = a1;
        if (a1 > 36)
        {
          v13 = a1 - 45;
          if ((unint64_t)(a1 - 45) <= 0x2C)
          {
            if (((1 << v13) & 0x111) != 0)
            {
LABEL_50:
              v12 = 1;
              goto LABEL_60;
            }
            if (((1 << v13) & 0x11000000000) != 0 || a1 == 89)
            {
LABEL_59:
              v12 = 8;
              goto LABEL_60;
            }
          }
          if (a1 == 37 || (v5 = result, a1 == 41))
          {
LABEL_44:
            v12 = 2;
LABEL_60:
            *a3 = v12;
            return result;
          }
        }
        else
        {
          v12 = 4;
          if (a1 <= 28)
          {
            if (a1 == 3)
              goto LABEL_60;
            v5 = result;
            if (a1 != 16)
              goto LABEL_21;
            goto LABEL_44;
          }
          if (a1 == 29)
            goto LABEL_60;
          v5 = result;
          if (a1 == 33)
            goto LABEL_60;
        }
LABEL_21:
        v12 = 0;
        result = v5;
        goto LABEL_60;
      case 7:
        goto LABEL_31;
      case 8:
      case 10:
        v11 = 6;
        goto LABEL_31;
      case 9:
      case 13:
      case 93:
        v11 = 8;
        goto LABEL_31;
      case 11:
        v11 = 9;
        goto LABEL_31;
      case 12:
      case 14:
        v11 = 12;
        goto LABEL_31;
      case 15:
      case 94:
        v11 = 16;
LABEL_31:
        *a2 = 3;
        v12 = 4;
        result = v11;
        goto LABEL_60;
      case 20:
        goto LABEL_33;
      case 21:
      case 23:
        v11 = 6;
        goto LABEL_33;
      case 22:
      case 26:
      case 95:
        v11 = 8;
        goto LABEL_33;
      case 24:
        v11 = 9;
        goto LABEL_33;
      case 25:
      case 27:
        v11 = 12;
        goto LABEL_33;
      case 28:
      case 96:
        v11 = 16;
LABEL_33:
        *a2 = 16;
        result = v11;
        goto LABEL_44;
      case 97:
        goto LABEL_38;
      case 98:
        v9 = 16;
        v10 = 29;
        goto LABEL_38;
      case 99:
        v9 = 8;
        goto LABEL_37;
      case 100:
        v9 = 16;
LABEL_37:
        v10 = 33;
LABEL_38:
        *a2 = v10;
        v12 = 4;
        result = v9;
        goto LABEL_60;
      case 101:
        goto LABEL_43;
      case 102:
        v9 = 16;
        v8 = 37;
        goto LABEL_43;
      case 103:
        v9 = 8;
        goto LABEL_42;
      case 104:
        v9 = 16;
LABEL_42:
        v8 = 41;
LABEL_43:
        *a2 = v8;
        result = v9;
        goto LABEL_44;
      case 105:
        goto LABEL_49;
      case 106:
        v9 = 16;
        v7 = 45;
        goto LABEL_49;
      case 107:
        v9 = 8;
        goto LABEL_48;
      case 108:
        v9 = 16;
LABEL_48:
        v7 = 49;
LABEL_49:
        *a2 = v7;
        result = v9;
        goto LABEL_50;
      case 109:
        goto LABEL_55;
      case 110:
        v9 = 16;
        v6 = 81;
        goto LABEL_55;
      case 111:
        v9 = 8;
        goto LABEL_54;
      case 112:
        v9 = 16;
LABEL_54:
        v6 = 85;
LABEL_55:
        *a2 = v6;
        goto LABEL_58;
      case 113:
        goto LABEL_57;
      case 114:
        v9 = 16;
LABEL_57:
        *a2 = 89;
LABEL_58:
        result = v9;
        goto LABEL_59;
      default:
        goto LABEL_21;
    }
  }
  return result;
}

void packSingleValue(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  int v13;
  char v14;
  __int16 v15;
  uint64_t v16;
  int v17;
  uint64_t v23;
  char *v24;

  v9 = a1;
  v12 = v9;
  if (a4 > 44)
  {
    if (a4 <= 80)
    {
      switch(a4)
      {
        case '-':
          v14 = objc_msgSend_charValue(v9, v10, v11);
          break;
        case '1':
          v14 = objc_msgSend_unsignedCharValue(v9, v10, v11);
          break;
        case '5':
          v14 = objc_msgSend_BOOLValue(v9, v10, v11);
          break;
        default:
          goto LABEL_32;
      }
      *(_BYTE *)(a5 + a3 + a2) = v14;
      goto LABEL_35;
    }
    switch(a4)
    {
      case 'Q':
        v23 = objc_msgSend_longValue(v9, v10, v11);
        break;
      case 'U':
        v23 = objc_msgSend_unsignedLongValue(v9, v10, v11);
        break;
      case 'Y':
        objc_msgSend_doubleValue(v9, v10, v11);
        *(_QWORD *)(a5 + a3 + 8 * a2) = v16;
        goto LABEL_35;
      default:
        goto LABEL_32;
    }
    *(_QWORD *)(a5 + a3 + 8 * a2) = v23;
    goto LABEL_35;
  }
  if (a4 <= 32)
  {
    switch(a4)
    {
      case 3:
        objc_msgSend_floatValue(v9, v10, v11);
        *(_DWORD *)(a5 + a3 + 4 * a2) = v17;
        goto LABEL_35;
      case 16:
        objc_msgSend_floatValue(v9, v10, v11);
        __asm { FCVT            H0, S0 }
        *(_WORD *)(a5 + a3 + 2 * a2) = _S0;
        goto LABEL_35;
      case 29:
        v13 = objc_msgSend_intValue(v9, v10, v11);
LABEL_26:
        *(_DWORD *)(a5 + a3 + 4 * a2) = v13;
        goto LABEL_35;
    }
    goto LABEL_32;
  }
  switch(a4)
  {
    case '!':
      v13 = objc_msgSend_unsignedIntValue(v9, v10, v11);
      goto LABEL_26;
    case '%':
      v15 = objc_msgSend_shortValue(v9, v10, v11);
      goto LABEL_28;
    case ')':
      v15 = objc_msgSend_unsignedShortValue(v9, v10, v11);
LABEL_28:
      *(_WORD *)(a5 + a3 + 2 * a2) = v15;
      goto LABEL_35;
  }
LABEL_32:
  uni_logger_api();
  v24 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
    sub_24B6F2E9C(a4, v24);

LABEL_35:
}

uint64_t pixelFormatName(uint64_t a1, void *a2)
{
  const char *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;

  v4 = a2;
  if (!v4)
  {
    objc_msgSend_metalDevice(MEMORY[0x24BE11A10], v2, v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
      return 0;
  }
  MTLPixelFormatGetInfoForDevice();
  v5 = 14;

  return v5;
}

__CFString *shortTextureDescription(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  __CFString *v19;

  v1 = a1;
  v3 = v1;
  if (v1)
  {
    if ((objc_msgSend_conformsToProtocol_(v1, v2, (uint64_t)&unk_2579B9140) & 1) == 0)
      sub_24B6F2F4C();
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = objc_msgSend_width(v3, v4, v5);
    v10 = objc_msgSend_height(v3, v8, v9);
    v13 = objc_msgSend_pixelFormat(v3, v11, v12);
    objc_msgSend_device(v3, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = pixelFormatName(v13, v16);
    objc_msgSend_stringWithFormat_(v6, v18, (uint64_t)CFSTR(" <texture = %p, width = %ld, height = %ld, format = %s>"), v3, v7, v10, v17);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = CFSTR("<texture: nil>");
  }

  return v19;
}

void triggerProgrammaticCapture(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  const char *v8;
  char started;
  id v10;
  NSObject *v11;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDDD500];
  v2 = a1;
  objc_msgSend_sharedCaptureManager(v1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDDD4F8]);
  objc_msgSend_setCaptureObject_(v6, v7, (uint64_t)v2);

  v17 = 0;
  started = objc_msgSend_startCaptureWithDescriptor_error_(v5, v8, (uint64_t)v6, &v17);
  v10 = v17;
  if ((started & 1) == 0)
  {
    uni_logger_api();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("Failed to start capture, error %@"), v10);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = objc_msgSend_UTF8String(v13, v14, v15);
      *(_DWORD *)buf = 136446466;
      v19 = "triggerProgrammaticCapture";
      v20 = 2080;
      v21 = v16;
      _os_log_impl(&dword_24B6B5000, v11, OS_LOG_TYPE_INFO, "%{public}s %s", buf, 0x16u);

    }
  }

}

void stopProgrammaticCapture(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_sharedCaptureManager(MEMORY[0x24BDDD500], a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopCapture(v5, v3, v4);

}

id parseTXTFile(uint64_t a1, const char *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  BOOL v9;
  id v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  id v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  double v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  id v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  const char *v48;
  const char *v49;
  void *v50;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  id v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@/%@"), a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v3, (uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0;
  objc_msgSend_stringWithContentsOfURL_encoding_error_(MEMORY[0x24BDD17C8], v5, (uint64_t)v4, 4, &v69);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v69;

  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v6, v8, (uint64_t)CFSTR("'"), CFSTR("\""));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_dataUsingEncoding_(v11, v12, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v68 = 0;
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v13, (uint64_t)v14, 0, &v68);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v68;
      if (v15)
      {
        v18 = (void *)MEMORY[0x24BDBCED8];
        v19 = objc_msgSend_count(v15, v16, v17);
        objc_msgSend_dictionaryWithCapacity_(v18, v20, v19);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v21 = v15;
        v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v64, v71, 16);
        if (v58)
        {
          v56 = v4;
          v57 = *(_QWORD *)v65;
          v54 = v7;
          v55 = v11;
          v52 = v15;
          v53 = v14;
LABEL_10:
          v24 = 0;
          v26 = v58;
          v25 = v59;
          v27 = v57;
          while (1)
          {
            if (*(_QWORD *)v65 != v27)
              objc_enumerationMutation(v21);
            v28 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v24);
            objc_msgSend_objectForKeyedSubscript_(v21, v23, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = objc_retainAutorelease(v29);
              v33 = (const char *)objc_msgSend_UTF8String(v30, v31, v32);
              v34 = (void *)MEMORY[0x24BDD16E0];
              v35 = atof(v33);
              objc_msgSend_numberWithDouble_(v34, v36, v37, v35);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v25, v39, (uint64_t)v38, v28);

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v41 = v29;
                  v60 = 0u;
                  v61 = 0u;
                  v62 = 0u;
                  v63 = 0u;
                  v42 = v41;
                  v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v60, v70, 16);
                  if (v44)
                  {
                    v45 = v44;
                    v46 = *(_QWORD *)v61;
                    while (2)
                    {
                      for (i = 0; i != v45; ++i)
                      {
                        if (*(_QWORD *)v61 != v46)
                          objc_enumerationMutation(v42);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {

                          v25 = v59;
                          goto LABEL_34;
                        }
                      }
                      v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v48, (uint64_t)&v60, v70, 16);
                      if (v45)
                        continue;
                      break;
                    }
                  }

                  v25 = v59;
                  objc_msgSend_setObject_forKeyedSubscript_(v59, v49, (uint64_t)v42, v28);

                  v27 = v57;
                  v26 = v58;
                  goto LABEL_28;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
LABEL_34:

                  v10 = 0;
                  v50 = v25;
                  v11 = v55;
                  v4 = v56;
                  v14 = v53;
                  v7 = v54;
                  v15 = v52;
                  goto LABEL_35;
                }
              }
              objc_msgSend_setObject_forKeyedSubscript_(v25, v40, (uint64_t)v29, v28);
            }
LABEL_28:

            if (++v24 == v26)
            {
              v11 = v55;
              v4 = v56;
              v14 = v53;
              v7 = v54;
              v15 = v52;
              v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v64, v71, 16);
              if (v58)
                goto LABEL_10;
              break;
            }
          }
        }

        v50 = v59;
        v10 = v59;
LABEL_35:

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v7 = 0;
      v10 = 0;
    }

    v6 = v11;
    goto LABEL_38;
  }
  v10 = 0;
LABEL_38:

  return v10;
}

id rootTexture(void *a1)
{
  return a1;
}

uint64_t convertFloatToF16AsUshort(float _S0)
{
  __asm { FCVT            H0, S0 }
  return _H0;
}

void sub_24B6ED458()
{
  __assert_rtn("-[ApplyBlurmap initWithMetalQueue:]", "ApplyBlurmap.m", 575, "self");
}

void sub_24B6ED480()
{
  __assert_rtn("-[ApplyBlurmap initWithMetalQueue:]", "ApplyBlurmap.m", 621, "bundle");
}

void sub_24B6ED4A8()
{
  __assert_rtn("-[ApplyBlurmap initWithMetalQueue:]", "ApplyBlurmap.m", 624, "_library");
}

void sub_24B6ED4D0()
{
  __assert_rtn("-[ApplyBlurmap initWithMetalQueue:]", "ApplyBlurmap.m", 627, "_segmentArray");
}

void sub_24B6ED4F8()
{
  __assert_rtn("-[ApplyBlurmap initWithMetalQueue:]", "ApplyBlurmap.m", 633, "_fgSegmentArray");
}

void sub_24B6ED520()
{
  __assert_rtn("-[ApplyBlurmap initWithMetalQueue:]", "ApplyBlurmap.m", 635, "[_fgSegmentArray[0] isKindOfClass:[NSData class]] && [_fgSegmentArray[1] isKindOfClass:[NSData class]]");
}

void sub_24B6ED548()
{
  __assert_rtn("-[ApplyBlurmap initWithMetalQueue:]", "ApplyBlurmap.m", 634, "(2 == [_fgSegmentArray count])");
}

void sub_24B6ED570()
{
  __assert_rtn("-[ApplyBlurmap initWithMetalQueue:]", "ApplyBlurmap.m", 629, "[_segmentArray[0] isKindOfClass:[NSData class]] && [_segmentArray[1] isKindOfClass:[NSData class]]");
}

void sub_24B6ED598()
{
  __assert_rtn("-[ApplyBlurmap initWithMetalQueue:]", "ApplyBlurmap.m", 628, "(2 == [_segmentArray count])");
}

void sub_24B6ED5C0()
{
  __assert_rtn("sparserendering_precalcLUTs", "ApplyBlurmap.m", 532, "segmentStepLUT");
}

void sub_24B6ED5E8()
{
  __assert_rtn("sparserendering_precalcLUTs", "ApplyBlurmap.m", 533, "segmentBaseVecLUT");
}

void sub_24B6ED610()
{
  __assert_rtn("-[ApplyBlurmap setOptions:isPrewarm:]", "ApplyBlurmap.m", 756, "config_params");
}

void sub_24B6ED638()
{
  __assert_rtn("-[ApplyBlurmap setOptions:isPrewarm:]", "ApplyBlurmap.m", 837, "_fgSegmentArray");
}

void sub_24B6ED660()
{
  __assert_rtn("-[ApplyBlurmap setOptions:isPrewarm:]", "ApplyBlurmap.m", 839, "[_fgSegmentArray[0] isKindOfClass:[NSData class]] && [_fgSegmentArray[1] isKindOfClass:[NSData class]]");
}

void sub_24B6ED688()
{
  __assert_rtn("-[ApplyBlurmap setOptions:isPrewarm:]", "ApplyBlurmap.m", 838, "(2 == [_fgSegmentArray count])");
}

void sub_24B6ED6B0()
{
  __assert_rtn("-[ApplyBlurmap setOptions:isPrewarm:]", "ApplyBlurmap.m", 823, "_segmentArray");
}

void sub_24B6ED6D8()
{
  __assert_rtn("-[ApplyBlurmap setOptions:isPrewarm:]", "ApplyBlurmap.m", 825, "[_segmentArray[0] isKindOfClass:[NSData class]] && [_segmentArray[1] isKindOfClass:[NSData class]]");
}

void sub_24B6ED700()
{
  __assert_rtn("-[ApplyBlurmap setOptions:isPrewarm:]", "ApplyBlurmap.m", 824, "(2 == [_segmentArray count])");
}

void sub_24B6ED728()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1179, "_preprocess");
}

void sub_24B6ED750()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1185, "_preprocessScaled");
}

void sub_24B6ED778()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1191, "_highlightRecovery");
}

void sub_24B6ED7A0()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1193, "_prefilterX");
}

void sub_24B6ED7C8()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1196, "_prefilterY");
}

void sub_24B6ED7F0()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1201, "_sparseNoAlpha");
}

void sub_24B6ED818()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1206, "_sparseNoAlphaRayFg");
}

void sub_24B6ED840()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1211, "_sparseWithAlpha");
}

void sub_24B6ED868()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1214, "_gainmapMultiply");
}

void sub_24B6ED890()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1217, "_gainmapMultiply");
}

void sub_24B6ED8B8()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1220, "_antialiasX");
}

void sub_24B6ED8E0()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1223, "_antialiasY");
}

void sub_24B6ED908()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1226, "_antialiasRGBAX");
}

void sub_24B6ED930()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1229, "_antialiasRGBAY");
}

void sub_24B6ED958()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1232, "_addNoiseOnly");
}

void sub_24B6ED980()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1236, "_yuv1");
}

void sub_24B6ED9A8()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1246, "_yuv2");
}

void sub_24B6ED9D0()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1250, "_localContrast");
}

void sub_24B6ED9F8()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1254, "_extractPositiveBlurValues");
}

void sub_24B6EDA20()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1259, "_extractNegativeBlurValues");
}

void sub_24B6EDA48()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1264, "_morphology");
}

void sub_24B6EDA70()
{
  __assert_rtn("-[ApplyBlurmap loadShaders]", "ApplyBlurmap.m", 1267, "_blendRaytraced");
}

void sub_24B6EDA98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6BF8B0(&dword_24B6B5000, a1, a3, "%{public}s Unable to get headroom from inputGainmap.", a5, a6, a7, a8, 2u);
}

void sub_24B6EDB0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6BF8B0(&dword_24B6B5000, a1, a3, "%{public}s Gainmap version or FlexMap version is invalid for a v7+ SDOF config.", a5, a6, a7, a8, 2u);
}

void sub_24B6EDB80()
{
  __assert_rtn("scaleToSize", "ApplyBlurmap.m", 89, "image");
}

void sub_24B6EDBA8()
{
  __assert_rtn("-[ApplyBlurmap applyHairnetUsingConfig:hairnetParams:inputImage:inputBackBlurImage:inputBlurMap:inputAlpha:scale:coreImageRender:version:context:captureFolderMiscPath:]", "ApplyBlurmap.m", 2290, "[inputBlurMap isKindOfClass:[CIImage class]]");
}

void sub_24B6EDBD0()
{
  __assert_rtn("-[ApplyBlurmap applyForegroundUsingConfig:image:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputIntermediate:inputHalfRes1:inputHalfRes2:inputHalfResRG:outputLuma:outputChroma:scale:coreImageRender:version:context:captureFolderMiscPath:]", "ApplyBlurmap.m", 2453, "imageRayFg");
}

void sub_24B6EDBF8()
{
  __assert_rtn("-[ApplyBlurmap applyForegroundUsingConfig:image:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputIntermediate:inputHalfRes1:inputHalfRes2:inputHalfResRG:outputLuma:outputChroma:scale:coreImageRender:version:context:captureFolderMiscPath:]", "ApplyBlurmap.m", 2464, "imageRayFg");
}

void sub_24B6EDC20()
{
  __assert_rtn("-[ApplyBlurmap applyForegroundUsingConfig:image:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputIntermediate:inputHalfRes1:inputHalfRes2:inputHalfResRG:outputLuma:outputChroma:scale:coreImageRender:version:context:captureFolderMiscPath:]", "ApplyBlurmap.m", 2474, "imageRayFg");
}

void sub_24B6EDC48()
{
  __assert_rtn("-[ApplyBlurmap applyForegroundUsingConfig:image:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputIntermediate:inputHalfRes1:inputHalfRes2:inputHalfResRG:outputLuma:outputChroma:scale:coreImageRender:version:context:captureFolderMiscPath:]", "ApplyBlurmap.m", 2492, "image");
}

void sub_24B6EDC70()
{
  __assert_rtn("-[ApplyBlurmap applyForegroundUsingConfig:image:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputIntermediate:inputHalfRes1:inputHalfRes2:inputHalfResRG:outputLuma:outputChroma:scale:coreImageRender:version:context:captureFolderMiscPath:]", "ApplyBlurmap.m", 2547, "image");
}

void sub_24B6EDC98()
{
  __assert_rtn("-[ApplyBlurmap applyForegroundUsingConfig:image:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputIntermediate:inputHalfRes1:inputHalfRes2:inputHalfResRG:outputLuma:outputChroma:scale:coreImageRender:version:context:captureFolderMiscPath:]", "ApplyBlurmap.m", 2554, "image");
}

void sub_24B6EDCC0()
{
  __assert_rtn("-[ApplyBlurmap applyForegroundUsingConfig:image:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputIntermediate:inputHalfRes1:inputHalfRes2:inputHalfResRG:outputLuma:outputChroma:scale:coreImageRender:version:context:captureFolderMiscPath:]", "ApplyBlurmap.m", 2510, "image");
}

void sub_24B6EDCE8()
{
  __assert_rtn("-[ApplyBlurmap applyForegroundUsingConfig:image:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputIntermediate:inputHalfRes1:inputHalfRes2:inputHalfResRG:outputLuma:outputChroma:scale:coreImageRender:version:context:captureFolderMiscPath:]", "ApplyBlurmap.m", 2527, "image");
}

void sub_24B6EDD10()
{
  __assert_rtn("-[ApplyBlurmap applyForegroundUsingConfig:image:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputIntermediate:inputHalfRes1:inputHalfRes2:inputHalfResRG:outputLuma:outputChroma:scale:coreImageRender:version:context:captureFolderMiscPath:]", "ApplyBlurmap.m", 2483, "imageRayFg");
}

void sub_24B6EDD38()
{
  __assert_rtn("-[UniMorphology run:]", "UniMorphology.m", 39, "inputTexture");
}

void sub_24B6EDD60()
{
  __assert_rtn("-[UniMorphology run:]", "UniMorphology.m", 40, "outputTexture");
}

void sub_24B6EDD88()
{
  __assert_rtn("-[UniMorphology run:]", "UniMorphology.m", 63, "kernel");
}

void sub_24B6EDDB0()
{
  __assert_rtn("-[MakeBlurMap setOptions:isPrewarm:]", "MakeBlurMap.m", 816, "config_params");
}

void sub_24B6EDDD8()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 878, "self");
}

void sub_24B6EDE00()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 883, "bundle");
}

void sub_24B6EDE28()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 886, "_library");
}

void sub_24B6EDE50()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 888, "_slmMinMax");
}

void sub_24B6EDE78()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 895, "_slmCalc");
}

void sub_24B6EDEA0()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 955, "_slmCalcEyes");
}

void sub_24B6EDEC8()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1056, "_passthrough");
}

void sub_24B6EDEF0()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1065, "_extractPositiveBlurValues");
}

void sub_24B6EDF18()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1070, "_insertPositiveBlurValues");
}

void sub_24B6EDF40()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1074, "_thresholdHard");
}

void sub_24B6EDF68()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1087, "_gaussian");
}

void sub_24B6EDF90()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1090, "_mapLinear");
}

void sub_24B6EDFB8()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1099, "_mapLinearNoSecondary");
}

void sub_24B6EDFE0()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1124, "_eyeProtectionFace");
}

void sub_24B6EE008()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1126, "_eyeProtectionGlassesFace");
}

void sub_24B6EE030()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1184, "_modifyBlurmap");
}

void sub_24B6EE058()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1227, "_modifyBlurmapGlasses");
}

void sub_24B6EE080()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1263, "_segmentationFusion");
}

void sub_24B6EE0A8()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1271, "_faceMaskCalc");
}

void sub_24B6EE0D0()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1321, "_faceMaskApply");
}

void sub_24B6EE0F8()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1331, "_sparseRenderingPreprocessingScaled");
}

void sub_24B6EE120()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1340, "_guidedFilter");
}

void sub_24B6EE148()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1346, "_fpDisparityRefinementPreprocessing");
}

void sub_24B6EE170()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1348, "_crispHairBlurX");
}

void sub_24B6EE198()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1354, "_crispHairBlurY");
}

void sub_24B6EE1C0()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1361, "_crispHairBlurSingleX");
}

void sub_24B6EE1E8()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1367, "_crispHairBlurSingleY");
}

void sub_24B6EE210()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1375, "_crispHairExpandedDisparityX");
}

void sub_24B6EE238()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1381, "_crispHairExpandedDisparityY");
}

void sub_24B6EE260()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1388, "_crispHairExpandedDisparitySingleY");
}

void sub_24B6EE288()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1395, "_crispHairDownsamplingSingle");
}

void sub_24B6EE2B0()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1406, "_blendBackgroundBlur");
}

void sub_24B6EE2D8()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1411, "_thresholdedSobel");
}

void sub_24B6EE300()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1421, "_morphology");
}

void sub_24B6EE328()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]", "MakeBlurMap.m", 1338, "_guidedFilter");
}

void sub_24B6EE350()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_2", "MakeBlurMap.m", 905, "params");
}

void sub_24B6EE378()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_2", "MakeBlurMap.m", 907, "inputParams");
}

void sub_24B6EE3A0()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_2", "MakeBlurMap.m", 920, "inputParams[@\"height\"]");
}

void sub_24B6EE3C8()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_2", "MakeBlurMap.m", 921, "inputParams[@\"width\"]");
}

void sub_24B6EE3F0()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_2", "MakeBlurMap.m", 922, "inputParams[@\"left\"]");
}

void sub_24B6EE418()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_2", "MakeBlurMap.m", 923, "inputParams[@\"top\"]");
}

void sub_24B6EE440(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6BF8B0(&dword_24B6B5000, a1, a3, "%{public}s Unable to extract focus rect for ROI method for slm calculator; aborting",
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_24B6CD1F8();
}

void sub_24B6EE4B0()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_2", "MakeBlurMap.m", 910, "2 == [imageExtents count]");
}

void sub_24B6EE4D8()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_2", "MakeBlurMap.m", 908, "([inputParams isKindOfClass:[NSData class]] && ((NSData *)inputParams).length == sizeof(simple_lens_model_params_t)) || [inputParams isKindOfClass:[NSDictionary class]]");
}

void sub_24B6EE500()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke", "MakeBlurMap.m", 965, "params");
}

void sub_24B6EE528()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke", "MakeBlurMap.m", 967, "inputParams");
}

void sub_24B6EE550()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke", "MakeBlurMap.m", 980, "inputParams[@\"height\"]");
}

void sub_24B6EE578()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke", "MakeBlurMap.m", 981, "inputParams[@\"width\"]");
}

void sub_24B6EE5A0()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke", "MakeBlurMap.m", 982, "inputParams[@\"left\"]");
}

void sub_24B6EE5C8()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke", "MakeBlurMap.m", 983, "inputParams[@\"top\"]");
}

void sub_24B6EE5F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6BF8B0(&dword_24B6B5000, a1, a3, "%{public}s Unable to extract focus rect for ROI method for slm eye calculator; aborting",
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_24B6CD1F8();
}

void sub_24B6EE660()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke", "MakeBlurMap.m", 970, "2 == [imageExtents count]");
}

void sub_24B6EE688()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke", "MakeBlurMap.m", 968, "([inputParams isKindOfClass:[NSData class]] && ((NSData *)inputParams).length == sizeof(simple_lens_model_params_t)) || [inputParams isKindOfClass:[NSDictionary class]]");
}

void sub_24B6EE6B0()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_5", "MakeBlurMap.m", 1130, "params");
}

void sub_24B6EE6D8()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_5", "MakeBlurMap.m", 1132, "data");
}

void sub_24B6EE700()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_5", "MakeBlurMap.m", 1140, "[data length] == sizeof(face_mask_params_t)");
}

void sub_24B6EE728()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_5", "MakeBlurMap.m", 1133, "[data isKindOfClass:[NSData class]]");
}

void sub_24B6EE750()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_9", "MakeBlurMap.m", 1274, "params");
}

void sub_24B6EE778()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_9", "MakeBlurMap.m", 1276, "data");
}

void sub_24B6EE7A0()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_9", "MakeBlurMap.m", 1284, "[data length] == sizeof(face_mask_params_t)");
}

void sub_24B6EE7C8()
{
  __assert_rtn("-[MakeBlurMap initWithMetalQueue:]_block_invoke_9", "MakeBlurMap.m", 1277, "[data isKindOfClass:[NSData class]]");
}

void sub_24B6EE7F0()
{
  __assert_rtn("-[MakeBlurMap allocateResourcesForShiftMapWidth:shiftMapHeight:]", "MakeBlurMap.m", 1454, "_minMaxTex");
}

void sub_24B6EE818()
{
  __assert_rtn("-[MakeBlurMap allocateResourcesForShiftMapWidth:shiftMapHeight:]", "MakeBlurMap.m", 1456, "_outputParamsImage");
}

void sub_24B6EE840()
{
  __assert_rtn("-[MakeBlurMap allocateResourcesForShiftMapWidth:shiftMapHeight:]", "MakeBlurMap.m", 1459, "_faceParamsTex");
}

void sub_24B6EE868()
{
  __assert_rtn("-[MakeBlurMap allocateResourcesForShiftMapWidth:shiftMapHeight:]", "MakeBlurMap.m", 1461, "_eyeProtectionFacesTex");
}

void sub_24B6EE890()
{
  __assert_rtn("-[MakeBlurMap allocateResourcesForShiftMapWidth:shiftMapHeight:]", "MakeBlurMap.m", 1464, "_faceMaskOutputParamsTex");
}

void sub_24B6EE8B8()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1578, "_calcWeightsX");
}

void sub_24B6EE8E0()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1587, "_calcWeightsY");
}

void sub_24B6EE908()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1598, "_preprocessing");
}

void sub_24B6EE930()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1629, "_sample");
}

void sub_24B6EE958()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1680, "_antialias");
}

void sub_24B6EE980()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1692, "_antialiasWithForegroundBlur");
}

void sub_24B6EE9A8()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1716, "_blurmap_x_smoothing");
}

void sub_24B6EE9D0()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1719, "_blurmap_y_smoothing");
}

void sub_24B6EE9F8()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1722, "_blurmap_x_smoothing_scaled");
}

void sub_24B6EEA20()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1725, "_blurmap_y_smoothing_scaled");
}

void sub_24B6EEA48()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1729, "_blurmap_x_smoothing_unbiased");
}

void sub_24B6EEA70()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1732, "_blurmap_y_smoothing_unbiased");
}

void sub_24B6EEA98()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1735, "_blurmap_x_smoothing_scaled_unbiased");
}

void sub_24B6EEAC0()
{
  __assert_rtn("-[MakeBlurMap loadShaders]", "MakeBlurMap.m", 1738, "_blurmap_y_smoothing_scaled_unbiased");
}

void sub_24B6EEAE8()
{
  __assert_rtn("-[MakeBlurMap loadShaders]_block_invoke", "MakeBlurMap.m", 1604, "imageExtents");
}

void sub_24B6EEB10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6BF8B0(&dword_24B6B5000, a1, a3, "%{public}s Invalid ROI callback index for preprocessing filter; aborting",
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_24B6CD1F8();
}

void sub_24B6EEB80()
{
  __assert_rtn("-[MakeBlurMap loadShaders]_block_invoke", "MakeBlurMap.m", 1605, "3 == [imageExtents count]");
}

void sub_24B6EEBA8()
{
  __assert_rtn("-[MakeBlurMap loadShaders]_block_invoke", "MakeBlurMap.m", 1634, "params");
}

void sub_24B6EEBD0()
{
  __assert_rtn("-[MakeBlurMap loadShaders]_block_invoke", "MakeBlurMap.m", 1636, "data");
}

void sub_24B6EEBF8()
{
  __assert_rtn("-[MakeBlurMap loadShaders]_block_invoke", "MakeBlurMap.m", 1638, "imageExtents && 2 == [imageExtents count]");
}

void sub_24B6EEC20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6BF8B0(&dword_24B6B5000, a1, a3, "%{public}s Invalid ROI callback index for sampling filter; aborting",
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_24B6CD1F8();
}

void sub_24B6EEC90()
{
  __assert_rtn("-[MakeBlurMap loadShaders]_block_invoke", "MakeBlurMap.m", 1637, "[data isKindOfClass:[NSData class]]");
}

void sub_24B6EECB8(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = 136446978;
  v3 = "-[MakeBlurMap performDisparityRefinementViaMatting:inputShiftmap:focusRect:inputLuma:inputChroma:simpleLensModelC"
       "alculatorImage:disparityConfigIndex:outputRefinedImage:tmpRGB:tmpDisparity:tmpRGBA:SDOFVersion:mattingParams:context:]";
  v4 = 2080;
  v5 = "Invalid config index for disparity refinement: ";
  v6 = 1024;
  v7 = a1;
  v8 = 2080;
  v9 = "; must be in 1..6 range";
  _os_log_error_impl(&dword_24B6B5000, a2, OS_LOG_TYPE_ERROR, "%{public}s %s%d%s", (uint8_t *)&v2, 0x26u);
}

void sub_24B6EED64()
{
  __assert_rtn("-[MakeBlurMap performDisparityRefinementViaMatting:inputShiftmap:focusRect:inputLuma:inputChroma:simpleLensModelCalculatorImage:disparityConfigIndex:outputRefinedImage:tmpRGB:tmpDisparity:tmpRGBA:SDOFVersion:mattingParams:context:]", "MakeBlurMap.m", 1995, "preprocessedShiftmap");
}

void sub_24B6EED8C()
{
  __assert_rtn("-[MakeBlurMap performDisparityRefinementViaMatting:inputShiftmap:focusRect:inputLuma:inputChroma:simpleLensModelCalculatorImage:disparityConfigIndex:outputRefinedImage:tmpRGB:tmpDisparity:tmpRGBA:SDOFVersion:mattingParams:context:]", "MakeBlurMap.m", 2035, "scaledSegmentation");
}

void sub_24B6EEDB4()
{
  __assert_rtn("-[MakeBlurMap performDisparityRefinementViaMatting:inputShiftmap:focusRect:inputLuma:inputChroma:simpleLensModelCalculatorImage:disparityConfigIndex:outputRefinedImage:tmpRGB:tmpDisparity:tmpRGBA:SDOFVersion:mattingParams:context:]", "MakeBlurMap.m", 2012, "CGRectEqualToRect(rgbColorGuide.extent, outputRefinedImage.extent)");
}

void sub_24B6EEDDC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6BF8B0(&dword_24B6B5000, a1, a3, "%{public}s Matting params are missing.", a5, a6, a7, a8, 2u);
  sub_24B6CD1F8();
}

void sub_24B6EEE4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6BF8B0(&dword_24B6B5000, a1, a3, "%{public}s Disparity config must be set to 65535 if you want to use a plist entry for matting params.", a5, a6, a7, a8, 2u);
  sub_24B6CD1F8();
}

void sub_24B6EEEBC()
{
  __assert_rtn("-[MakeBlurMap performSLMCalculatorUsingParams:inputShiftMap:faceMaskParams:version:context:isFGBlurEnabled:]", "MakeBlurMap.m", 2279, "inputShiftMap");
}

void sub_24B6EEEE4()
{
  __assert_rtn("-[MakeBlurMap performSLMCalculatorUsingParams:inputShiftMap:faceMaskParams:version:context:isFGBlurEnabled:]", "MakeBlurMap.m", 2280, "simpleLensParams");
}

void sub_24B6EEF0C()
{
  __assert_rtn("-[MakeBlurMap performSLMCalculatorUsingParams:inputShiftMap:faceMaskParams:version:context:isFGBlurEnabled:]", "MakeBlurMap.m", 2291, "minMaxImage");
}

void sub_24B6EEF34()
{
  __assert_rtn("-[MakeBlurMap performSLMCalculatorUsingParams:inputShiftMap:faceMaskParams:version:context:isFGBlurEnabled:]", "MakeBlurMap.m", 2372, "slmImage");
}

void sub_24B6EEF5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6BF8B0(&dword_24B6B5000, a1, a3, "%{public}s Either model texture or large source texture are nil when attempting to scale.", a5, a6, a7, a8, 2u);
  sub_24B6CD1F8();
}

void sub_24B6EEFCC(void *a1, char *a2, uint64_t a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_description(a1, a2, a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = 136446466;
  v8 = "-[MakeBlurMap _smallerTextureFromTexture:modelTexture:targetSize:numTextures:pixelFormat:]";
  v9 = 2080;
  v10 = objc_msgSend_UTF8String(v4, v5, v6);
  _os_log_debug_impl(&dword_24B6B5000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "%{public}s Unable to create texture %s", (uint8_t *)&v7, 0x16u);

}

void sub_24B6EF07C()
{
  __assert_rtn("findMostProminentFace", "MakeBlurMap.m", 635, "config_params");
}

void sub_24B6EF0A4()
{
  __assert_rtn("findMostProminentFace", "MakeBlurMap.m", 636, "faceParams");
}

void sub_24B6EF0CC()
{
  __assert_rtn("-[MakeBlurMap enqueueRefinementUsingParams:maskParams:inputBlurMap:inputAlpha:inputHair:inputGlasses:inputAlphaMaskDelta:inputHairMaskDelta:inputBlurRefineIntermediate:outputBlurMap:scale:inputsAlreadyScaled:context:]", "MakeBlurMap.m", 2868, "tmpTextures && tmpTextures.count == numTexturesNeeded");
}

void sub_24B6EF0F4()
{
  __assert_rtn("-[MakeBlurMap enqueueRefinementUsingParams:maskParams:inputBlurMap:inputAlpha:inputHair:inputGlasses:inputAlphaMaskDelta:inputHairMaskDelta:inputBlurRefineIntermediate:outputBlurMap:scale:inputsAlreadyScaled:context:]", "MakeBlurMap.m", 2838, "CGSizeEqualToSize(expectedSize, outputBlurMapSize)");
}

void sub_24B6EF11C()
{
  __assert_rtn("-[MakeBlurMap performCrispHairRefinementWithParams:alpha:disparity:tmpImage0:tmpImage1:tmpImage2:editTimeRender:context:]", "MakeBlurMap.m", 3031, "CGRectEqualToRect( alpha.extent, disparity.extent)");
}

void sub_24B6EF144()
{
  __assert_rtn("-[MakeBlurMap createBlurMapUsingMetadata:simulatedAperture:focusWindow:focalLengthInPixels:normalizedFocalLength:facePoints:maxBlur:inputScale:inputsAlreadyScaled:inputShiftMap:inputSegmentation:inputHair:inputGlasses:inputImageLuma:inputImageChroma:inputFaceMaskAdjBlur:inputWeightsX:inputWeightsY:inputPreproc:inputSampledD:inputDisparityRefineBlur:inputAlphaMaskDelta:inputHairMaskDelta:inputBlurRefineIntermediate:resultAdjBlurMap:coreImageRender:context:captureFolderMiscPath:]", "MakeBlurMap.m", 3320, "slmImage");
}

void sub_24B6EF16C()
{
  __assert_rtn("-[MakeBlurMap createBlurMapUsingMetadata:simulatedAperture:focusWindow:focalLengthInPixels:normalizedFocalLength:facePoints:maxBlur:inputScale:inputsAlreadyScaled:inputShiftMap:inputSegmentation:inputHair:inputGlasses:inputImageLuma:inputImageChroma:inputFaceMaskAdjBlur:inputWeightsX:inputWeightsY:inputPreproc:inputSampledD:inputDisparityRefineBlur:inputAlphaMaskDelta:inputHairMaskDelta:inputBlurRefineIntermediate:resultAdjBlurMap:coreImageRender:context:captureFolderMiscPath:]", "MakeBlurMap.m", 3343, "image");
}

void sub_24B6EF194()
{
  __assert_rtn("-[MakeBlurMap createBlurMapUsingMetadata:simulatedAperture:focusWindow:focalLengthInPixels:normalizedFocalLength:facePoints:maxBlur:inputScale:inputsAlreadyScaled:inputShiftMap:inputSegmentation:inputHair:inputGlasses:inputImageLuma:inputImageChroma:inputFaceMaskAdjBlur:inputWeightsX:inputWeightsY:inputPreproc:inputSampledD:inputDisparityRefineBlur:inputAlphaMaskDelta:inputHairMaskDelta:inputBlurRefineIntermediate:resultAdjBlurMap:coreImageRender:context:captureFolderMiscPath:]", "MakeBlurMap.m", 3434, "slmImage");
}

void sub_24B6EF1BC()
{
  __assert_rtn("-[MakeBlurMap createBlurMapUsingMetadata:simulatedAperture:focusWindow:focalLengthInPixels:normalizedFocalLength:facePoints:maxBlur:inputScale:inputsAlreadyScaled:inputShiftMap:inputSegmentation:inputHair:inputGlasses:inputImageLuma:inputImageChroma:inputFaceMaskAdjBlur:inputWeightsX:inputWeightsY:inputPreproc:inputSampledD:inputDisparityRefineBlur:inputAlphaMaskDelta:inputHairMaskDelta:inputBlurRefineIntermediate:resultAdjBlurMap:coreImageRender:context:captureFolderMiscPath:]", "MakeBlurMap.m", 3424, "image");
}

void sub_24B6EF1E4()
{
  __assert_rtn("-[MakeBlurMap createBlurMapUsingMetadata:simulatedAperture:focusWindow:focalLengthInPixels:normalizedFocalLength:facePoints:maxBlur:inputScale:inputsAlreadyScaled:inputShiftMap:inputSegmentation:inputHair:inputGlasses:inputImageLuma:inputImageChroma:inputFaceMaskAdjBlur:inputWeightsX:inputWeightsY:inputPreproc:inputSampledD:inputDisparityRefineBlur:inputAlphaMaskDelta:inputHairMaskDelta:inputBlurRefineIntermediate:resultAdjBlurMap:coreImageRender:context:captureFolderMiscPath:]", "MakeBlurMap.m", 3281, "inputSegmentationAtDisparityRes");
}

void sub_24B6EF20C()
{
  __assert_rtn("-[MakeBlurMap createBlurMapUsingMetadata:simulatedAperture:focusWindow:focalLengthInPixels:normalizedFocalLength:facePoints:maxBlur:inputScale:inputsAlreadyScaled:inputShiftMap:inputSegmentation:inputHair:inputGlasses:inputImageLuma:inputImageChroma:inputFaceMaskAdjBlur:inputWeightsX:inputWeightsY:inputPreproc:inputSampledD:inputDisparityRefineBlur:inputAlphaMaskDelta:inputHairMaskDelta:inputBlurRefineIntermediate:resultAdjBlurMap:coreImageRender:context:captureFolderMiscPath:]", "MakeBlurMap.m", 3289, "inputSegmentationAtDisparityRes");
}

void sub_24B6EF234(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24B6B5000, log, OS_LOG_TYPE_ERROR, "Reference dimensions of Camera Calibration Data inconsistent with Intrinsic Matrix", v1, 2u);
}

void sub_24B6EF274()
{
  __assert_rtn("-[MakeBlurMap enqueueBlurMapGenerationUsingArgs:]", "MakeBlurMap.m", 3756, "inputShiftmap");
}

void sub_24B6EF29C()
{
  __assert_rtn("-[MakeBlurMap enqueueBlurMapGenerationUsingArgs:]", "MakeBlurMap.m", 3757, "inputDisparityRefineBlur");
}

void sub_24B6EF2C4()
{
  __assert_rtn("-[MakeBlurMap enqueueBlurMapGenerationUsingArgs:]", "MakeBlurMap.m", 3758, "inputPreproc");
}

void sub_24B6EF2EC()
{
  __assert_rtn("-[MakeBlurMap enqueueBlurMapGenerationUsingArgs:]", "MakeBlurMap.m", 3759, "inputAlphaMaskDelta");
}

void sub_24B6EF314()
{
  __assert_rtn("-[MakeBlurMap enqueueBlurMapGenerationUsingArgs:]", "MakeBlurMap.m", 3760, "inputHairMaskDelta");
}

void sub_24B6EF33C()
{
  __assert_rtn("-[MakeBlurMap enqueueBlurMapGenerationUsingArgs:]", "MakeBlurMap.m", 3761, "inputImageLuma");
}

void sub_24B6EF364()
{
  __assert_rtn("-[MakeBlurMap enqueueBlurMapGenerationUsingArgs:]", "MakeBlurMap.m", 3762, "inputImageChroma");
}

void sub_24B6EF38C()
{
  __assert_rtn("-[MakeBlurMap enqueueBlurMapGenerationUsingArgs:]", "MakeBlurMap.m", 3763, "resultAdjBlurMap");
}

void sub_24B6EF3B4()
{
  __assert_rtn("-[MakeBlurMap enqueueBlurMapGenerationUsingArgs:]", "MakeBlurMap.m", 3764, "inputSegmentation");
}

void sub_24B6EF3DC()
{
  __assert_rtn("-[MakeBlurMap enqueueBlurMapGenerationUsingArgs:]", "MakeBlurMap.m", 3765, "inputHair");
}

void sub_24B6EF404()
{
  __assert_rtn("+[ApplyHairnetModel processWithInputs:arguments:output:error:]", "HairnetProcessor.m", 268, "outputSPI.metalTexture");
}

void sub_24B6EF42C()
{
  __assert_rtn("blur", "HairnetProcessor.m", 137, "image");
}

void sub_24B6EF454(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136446210;
  v4 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_24B6CFB14(&dword_24B6B5000, a1, a3, "%{public}s could not execute the Hairnet model.", (uint8_t *)&v3);
}

void sub_24B6EF4CC(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_24B6CFB04(&dword_24B6B5000, (int)a2, a3, "%{public}s could not bind 'output_residual' to the Hairnet model.", a1);
}

void sub_24B6EF50C(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_24B6CFB04(&dword_24B6B5000, (int)a2, a3, "%{public}s could not bind 'input_alpha' to the Hairnet model.", a1);
}

void sub_24B6EF54C(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_24B6CFB04(&dword_24B6B5000, (int)a2, a3, "%{public}s could not bind 'input_mask' to the Hairnet model.", a1);
}

void sub_24B6EF58C(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_24B6CFB04(&dword_24B6B5000, (int)a2, a3, "%{public}s could not bind 'input_corrupted' to the Hairnet model.", a1);
}

void sub_24B6EF5CC(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_24B6CFB04(&dword_24B6B5000, (int)a2, a3, "%{public}s could not bind 'input_ref' to the Hairnet model.", a1);
}

void sub_24B6EF60C(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_24B6CFB04(&dword_24B6B5000, (int)a2, a3, "%{public}s could not build the Hairnet model.", a1);
}

void sub_24B6EF64C(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_24B6CFB04(&dword_24B6B5000, (int)a2, a3, "%{public}s could not create the output CVPixelBuffer for the Hairnet model.", a1);
}

void sub_24B6EF68C(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]";
  sub_24B6CFB04(&dword_24B6B5000, (int)a2, a3, "%{public}s could not create an input CVPixelBuffer for the Hairnet model.", a1);
}

void sub_24B6EF6CC()
{
  __assert_rtn("CreateMTLTexture", "HairnetProcessor.m", 73, "IOSurfaceGetPixelFormat(pb) == kCVPixelFormatType_OneComponent16Half");
}

void sub_24B6EF6F4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136446210;
  v4 = "+[ApplyHairnetModel processWithInputs:arguments:output:error:]_block_invoke";
  sub_24B6CFB14(&dword_24B6B5000, a1, a3, "%{public}s failed to execute the Hairnet model.", (uint8_t *)&v3);
}

void sub_24B6EF76C()
{
  __assert_rtn("invertMask", "HairnetProcessor.m", 60, "image");
}

void sub_24B6EF794()
{
  __assert_rtn("invertMask", "HairnetProcessor.m", 62, "kernel");
}

void sub_24B6EF7BC()
{
  __assert_rtn("invertMask", "HairnetProcessor.m", 66, "image");
}

void sub_24B6EF7E4()
{
  __assert_rtn("ApplyHairnetProcessor", "HairnetProcessor.m", 724, "modelOut");
}

void sub_24B6EF80C(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = 7;
  _os_log_debug_impl(&dword_24B6B5000, log, OS_LOG_TYPE_DEBUG, "Missing FG/BG Dilation size param, using default = %d", (uint8_t *)v1, 8u);
}

void sub_24B6EF888()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_24B6D21FC();
  sub_24B6D21C4(&dword_24B6B5000, v0, v1, "Missing FG/BG Threshold param, using default = %g", v2, v3, v4, v5, v6);
  sub_24B6CD1F8();
}

void sub_24B6EF8F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing FG Dead Zone offset param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6EF95C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_24B6D21D4();
  sub_24B6D21C4(&dword_24B6B5000, v0, v1, "Missing FG Blur Clamp param, using default = %g", v2, v3, v4, v5, v6);
  sub_24B6CD1F8();
}

void sub_24B6EF9C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_24B6D21D4();
  sub_24B6D21C4(&dword_24B6B5000, v0, v1, "Missing FG Blur Scale param, using default = %g", v2, v3, v4, v5, v6);
  sub_24B6CD1F8();
}

void sub_24B6EFA24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing CI bicubic downsample param C, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6EFA90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing CI bicubic downsample param B, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6EFAF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing FG Anti-Aliasing radius, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6EFB64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_24B6D220C();
  sub_24B6D21C4(&dword_24B6B5000, v0, v1, "Missing FG weight smoothstep end param, using default = %g", v2, v3, v4, v5, v6);
  sub_24B6CD1F8();
}

void sub_24B6EFBD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing FG weight smoothstep start param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6EFC3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing FG alpha smoothstep end param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6EFCA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing FG alpha smoothstep start param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6EFD10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_24B6D21D4();
  sub_24B6D21C4(&dword_24B6B5000, v0, v1, "Missing FG hit threshold param, using default = %g", v2, v3, v4, v5, v6);
  sub_24B6CD1F8();
}

void sub_24B6EFD74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_24B6D21D4();
  sub_24B6D21C4(&dword_24B6B5000, v0, v1, "Missing FG trace step scale param, using default = %g", v2, v3, v4, v5, v6);
  sub_24B6CD1F8();
}

void sub_24B6EFDD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing hairnet chroma blur sigma param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6EFE44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing hairnet chroma weight param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6EFEB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing hairnet mask final dilation param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6EFF28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_24B6D220C();
  sub_24B6D21C4(&dword_24B6B5000, v0, v1, "Missing hairnet mask beard oval eccentricity param, using default = %g", v2, v3, v4, v5, v6);
  sub_24B6CD1F8();
}

void sub_24B6EFF94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing hairnet mask beard oval width factor param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6F0000()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_24B6D21FC();
  sub_24B6D21C4(&dword_24B6B5000, v0, v1, "Missing hairnet mask blur map sharp threshold param, using default = %g", v2, v3, v4, v5, v6);
  sub_24B6CD1F8();
}

void sub_24B6F006C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing hairnet mask blur map blur sigma param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6F00E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_24B6D21FC();
  sub_24B6D21C4(&dword_24B6B5000, v0, v1, "Missing hairnet mask glasses threshold param, using default = %g", v2, v3, v4, v5, v6);
  sub_24B6CD1F8();
}

void sub_24B6F014C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing hairnet mask glasses blur sigma param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6F01C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing hairnet mask hair threshold param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6F0234()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_24B6D21E4();
  sub_24B6D21C4(&dword_24B6B5000, v0, v1, "Missing hairnet mask hair blur sigma param, using default = %g", v2, v3, v4, v5, v6);
  sub_24B6CD1F8();
}

void sub_24B6F0298()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_24B6D220C();
  sub_24B6D21C4(&dword_24B6B5000, v0, v1, "Missing hairnet mask alpha threshold high param, using default = %g", v2, v3, v4, v5, v6);
  sub_24B6CD1F8();
}

void sub_24B6F0304(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing hairnet mask alpha threshold low param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6F0378()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_24B6D21E4();
  sub_24B6D21C4(&dword_24B6B5000, v0, v1, "Missing hairnet mask alpha blur sigma param, using default = %g", v2, v3, v4, v5, v6);
  sub_24B6CD1F8();
}

void sub_24B6F03DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing hairnet mask blur map threshold param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6F0450(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6D21C4(&dword_24B6B5000, a1, a3, "Missing hairnet mask gmac threshold param, using default = %g", a5, a6, a7, a8, 0);
  sub_24B6CD1F8();
}

void sub_24B6F04BC()
{
  __assert_rtn("makeGrey", "InpaintingMask.m", 46, "image");
}

void sub_24B6F04E4()
{
  __assert_rtn("makeGrey", "InpaintingMask.m", 48, "kernel");
}

void sub_24B6F050C()
{
  __assert_rtn("sobel", "InpaintingMask.m", 57, "image");
}

void sub_24B6F0534()
{
  __assert_rtn("sobel", "InpaintingMask.m", 59, "kernel");
}

void sub_24B6F055C()
{
  __assert_rtn("threshold_between", "InpaintingMask.m", 230, "image");
}

void sub_24B6F0584()
{
  __assert_rtn("threshold_between", "InpaintingMask.m", 232, "kernel");
}

void sub_24B6F05AC()
{
  __assert_rtn("threshold_between", "InpaintingMask.m", 236, "image");
}

void sub_24B6F05D4()
{
  __assert_rtn("makeEllipse", "InpaintingMask.m", 145, "kernel");
}

void sub_24B6F05FC()
{
  __assert_rtn("scaleToSize", "InpaintingMask.m", 314, "image");
}

void sub_24B6F0624()
{
  __assert_rtn("threshold_less_than", "InpaintingMask.m", 243, "image");
}

void sub_24B6F064C()
{
  __assert_rtn("threshold_less_than", "InpaintingMask.m", 245, "kernel");
}

void sub_24B6F0674()
{
  __assert_rtn("threshold_less_than", "InpaintingMask.m", 249, "image");
}

void sub_24B6F069C()
{
  __assert_rtn("orMasks", "InpaintingMask.m", 133, "kernel");
}

void sub_24B6F06C4()
{
  __assert_rtn("andMasks", "InpaintingMask.m", 112, "kernel");
}

void sub_24B6F06EC()
{
  __assert_rtn("blurFaster", "InpaintingMask.m", 294, "image");
}

void sub_24B6F0714()
{
  __assert_rtn("blur", "InpaintingMask.m", 271, "image");
}

void sub_24B6F073C()
{
  __assert_rtn("threshold_larger_than", "InpaintingMask.m", 214, "image");
}

void sub_24B6F0764()
{
  __assert_rtn("threshold_larger_than", "InpaintingMask.m", 216, "kernel");
}

void sub_24B6F078C()
{
  __assert_rtn("threshold_larger_than", "InpaintingMask.m", 220, "image");
}

void sub_24B6F07B4()
{
  __assert_rtn("invertMask", "InpaintingMask.m", 255, "image");
}

void sub_24B6F07DC()
{
  __assert_rtn("invertMask", "InpaintingMask.m", 257, "kernel");
}

void sub_24B6F0804()
{
  __assert_rtn("invertMask", "InpaintingMask.m", 261, "image");
}

void sub_24B6F082C()
{
  __assert_rtn("-[UniCIFilter run:]", "UniCIFilter.m", 61, "outputImageValue");
}

void sub_24B6F0854()
{
  __assert_rtn("-[UniCIFilter run:]", "UniCIFilter.m", 81, "context");
}

void sub_24B6F087C()
{
  __assert_rtn("-[UniCIFilter run:]", "UniCIFilter.m", 84, "t");
}

void sub_24B6F08A4()
{
  __assert_rtn("-[UniCIFilter run:]", "UniCIFilter.m", 96, "outputImage");
}

void sub_24B6F08CC()
{
  __assert_rtn("-[UniCIFilter run:]", "UniCIFilter.m", 85, "[t conformsToProtocol:@protocol(MTLTexture)]");
}

void sub_24B6F08F4()
{
  __assert_rtn("-[UniCIFilter outputImage:]", "UniCIFilter.m", 130, "filterName");
}

void sub_24B6F091C()
{
  __assert_rtn("-[UniCIFilter outputImage:]", "UniCIFilter.m", 133, "k.filter");
}

void sub_24B6F0944()
{
  __assert_rtn("-[UniCIFilter outputImage:]", "UniCIFilter.m", 193, "oImage");
}

void sub_24B6F096C()
{
  __assert_rtn("-[UniCIFilter outputImage:]", "UniCIFilter.m", 199, "u.texture");
}

void sub_24B6F0994(uint64_t a1, const char *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@ Unable to get value for key %@"));
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v2, v3, v4);
  sub_24B6D4EC8();
  sub_24B6D4EB4(&dword_24B6B5000, v5, v6, "%{public}s %s", v7, v8, v9, v10, a1, (uint64_t)a2, 2u);

  sub_24B6D4EDC();
}

void sub_24B6F0A38(uint64_t a1, const char *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Don't know how to set key %@ on filter %@"));
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v2, v3, v4);
  sub_24B6D4EC8();
  sub_24B6D4EB4(&dword_24B6B5000, v5, v6, "%{public}s %s", v7, v8, v9, v10, a1, (uint64_t)a2, 2u);

  sub_24B6D4EDC();
}

void sub_24B6F0ADC()
{
  __assert_rtn("-[UniCIFilter outputImageArray]", "UniCIFilter.m", 207, "outputTexture");
}

void sub_24B6F0B04()
{
  __assert_rtn("-[UniCIFilter inputImageArray]", "UniCIFilter.m", 214, "filter");
}

void sub_24B6F0B2C()
{
  __assert_rtn("-[UniCIFilter inputNameArray]", "UniCIFilter.m", 234, "filter");
}

void sub_24B6F0B54()
{
  __assert_rtn("-[UniCombineYCbCr outputImage:]", "UniCombineYCbCr.m", 44, "lumaImage");
}

void sub_24B6F0B7C()
{
  __assert_rtn("-[UniCombineYCbCr outputImage:]", "UniCombineYCbCr.m", 46, "chromaImage");
}

void sub_24B6F0BA4()
{
  __assert_rtn("-[UniCombineYCbCr outputImage:]", "UniCombineYCbCr.m", 66, "u.texture");
}

void sub_24B6F0BCC()
{
  __assert_rtn("+[UniDeviceCache bufferFromData:device:]", "UniDeviceCache.m", 68, "buffer");
}

void sub_24B6F0BF4()
{
  __assert_rtn("findObjectInCache", "UniDeviceCache.m", 27, "cache");
}

void sub_24B6F0C1C()
{
  __assert_rtn("+[UniDeviceCache findKernel:device:]", "UniDeviceCache.m", 93, "name");
}

void sub_24B6F0C44()
{
  __assert_rtn("+[UniDeviceCache findKernel:device:]", "UniDeviceCache.m", 101, "sigma > 0.0001f");
}

void sub_24B6F0C6C()
{
  __assert_rtn("+[UniDeviceCache findKernel:device:]", "UniDeviceCache.m", 170, "k");
}

void sub_24B6F0C94()
{
  __assert_rtn("+[UniDeviceCache findKernel:device:]", "UniDeviceCache.m", 159, "descriptor");
}

void sub_24B6F0CBC()
{
  __assert_rtn("+[UniDeviceCache findKernel:device:]", "UniDeviceCache.m", 163, "k");
}

void sub_24B6F0CE4()
{
  __assert_rtn("+[UniDeviceCache findKernel:device:]", "UniDeviceCache.m", 123, "[key isEqualToString:@\"name\"] || [key isEqualToString:@\"imageExtents\"] || [key isEqualToString:@\"iterations\"] || [allkeys containsObject:key]");
}

void sub_24B6F0D0C(uint64_t a1, char *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Don't know how to handle MPS filter with name %@"), a1);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_DWORD *)buf = 136446466;
  v7 = "+[UniDeviceCache findKernel:device:]";
  v8 = 2080;
  v9 = objc_msgSend_UTF8String(v3, v4, v5);
  _os_log_error_impl(&dword_24B6B5000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%{public}s %s", buf, 0x16u);

}

void sub_24B6F0DD8()
{
  __assert_rtn("+[UniDeviceCache findComputeKernel:library:pipelineLibrary:constants:]", "UniDeviceCache.m", 209, "k");
}

void sub_24B6F0E00()
{
  __assert_rtn("+[UniDeviceCache findComputeKernel:library:constants:]", "UniDeviceCache.m", 241, "k");
}

void sub_24B6F0E28(id *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = sub_24B6D6C30(a1);
  objc_msgSend_UTF8String(v1, v2, v3);
  sub_24B6D6C3C();
  sub_24B6D6C10(&dword_24B6B5000, v4, v5, "%{public}s Failed finding the Metal library for %s", v6, v7, v8, v9, 2u);
  sub_24B6D6C24();
}

void sub_24B6F0EA0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "CI Metal library does not contain ANY functions; this is likely a problem.";
  sub_24B6CFB14(&dword_24B6B5000, a1, a3, "%s", (uint8_t *)&v3);
}

void sub_24B6F0F18(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_description(a2, (const char *)a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6D6C10(&dword_24B6B5000, v3, v4, "Error creating CIKernel: %@, err:%@", v5, v6, v7, v8, 2u);

}

void sub_24B6F0FB8(void *a1, NSObject *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a1);
  v7 = 136315138;
  v8 = objc_msgSend_UTF8String(v3, v4, v5);
  sub_24B6CFB14(&dword_24B6B5000, a2, v6, "CoreImage Metal library does not contain function for name: %s", (uint8_t *)&v7);
  sub_24B6D6C24();
}

void sub_24B6F1034(id *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = sub_24B6D6C30(a1);
  objc_msgSend_UTF8String(v1, v2, v3);
  sub_24B6D6C3C();
  sub_24B6D6C10(&dword_24B6B5000, v4, v5, "%{public}s Failed finding the Metal library for %s", v6, v7, v8, v9, 2u);
  sub_24B6D6C24();
}

void sub_24B6F10AC()
{
  __assert_rtn("-[UniGaussianBlur run:]", "UniGaussianBlur.m", 47, "blur");
}

void sub_24B6F10D4()
{
  __assert_rtn("-[UniGaussianBlur run:]", "UniGaussianBlur.m", 56, "inputTexture");
}

void sub_24B6F10FC()
{
  __assert_rtn("-[UniGaussianBlur run:]", "UniGaussianBlur.m", 57, "outputTexture");
}

void sub_24B6F1124()
{
  __assert_rtn("-[UniGaussianBlur outputImage:]", "UniGaussianBlur.m", 78, "baseImage");
}

void sub_24B6F114C()
{
  __assert_rtn("-[UniGaussianBlur outputImage:]", "UniGaussianBlur.m", 98, "u.texture");
}

void sub_24B6F1174()
{
  __assert_rtn("+[GuidedFilterProcessor formatForInputAtIndex:]", "UniGuidedFilter.m", 67, "0");
}

void sub_24B6F119C()
{
  __assert_rtn("+[GuidedFilterProcessor roiForInput:arguments:outputRect:]", "UniGuidedFilter.m", 93, "arguments[@\"imageExtents\"]");
}

void sub_24B6F11C4()
{
  __assert_rtn("+[GuidedFilterProcessor roiForInput:arguments:outputRect:]", "UniGuidedFilter.m", 94, "[arguments[@\"imageExtents\"] count] > (NSUInteger)input");
}

void sub_24B6F11EC(uint64_t a1, NSObject *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_class();
  objc_msgSend_description(v3, v4, v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = 136446466;
  v11 = "-[UniGuidedFilter initWithDevice:]";
  v12 = 2080;
  v13 = objc_msgSend_UTF8String(v6, v7, v8);
  sub_24B6D8DC0(&dword_24B6B5000, a2, v9, "%{public}s Unable to load bundle for class: %s and hence associated function: _combineRGBAndAlpha", (uint8_t *)&v10);

  sub_24B6D6C24();
}

void sub_24B6F1294()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136446466;
  sub_24B6D8DCC();
  sub_24B6D8DC0(&dword_24B6B5000, v0, v1, "%{public}s Error = %@", (uint8_t *)v2);
}

void sub_24B6F1308(uint64_t a1, NSObject *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8[6];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_class();
  objc_msgSend_description(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136446466;
  sub_24B6D8DCC();
  sub_24B6D8DC0(&dword_24B6B5000, a2, v7, "%{public}s Unable to load library for class %@ and hence associated function: _combineRGBAndAlpha", (uint8_t *)v8);

  sub_24B6D6C24();
}

void sub_24B6F139C()
{
  __assert_rtn("-[UniGuidedFilter initWithDevice:]", "UniGuidedFilter.m", 164, "function");
}

void sub_24B6F13C4()
{
  __assert_rtn("-[UniGuidedFilter _combineRGB:weights:tmpRGBA:rgbWeight:buffer:]", "UniGuidedFilter.m", 194, "rgbTexture");
}

void sub_24B6F13EC()
{
  __assert_rtn("-[UniGuidedFilter _combineRGB:weights:tmpRGBA:rgbWeight:buffer:]", "UniGuidedFilter.m", 195, "weights");
}

void sub_24B6F1414()
{
  __assert_rtn("-[UniGuidedFilter _combineRGB:weights:tmpRGBA:rgbWeight:buffer:]", "UniGuidedFilter.m", 203, "output");
}

void sub_24B6F143C()
{
  __assert_rtn("-[UniGuidedFilter run:]", "UniGuidedFilter.m", 233, "sourceTexture");
}

void sub_24B6F1464()
{
  __assert_rtn("-[UniGuidedFilter run:]", "UniGuidedFilter.m", 234, "guidanceTexture");
}

void sub_24B6F148C()
{
  __assert_rtn("-[UniGuidedFilter run:]", "UniGuidedFilter.m", 235, "weightsTexture");
}

void sub_24B6F14B4()
{
  __assert_rtn("-[UniGuidedFilter run:]", "UniGuidedFilter.m", 236, "destinationCoefficientsTexture");
}

void sub_24B6F14DC()
{
  __assert_rtn("-[UniGuidedFilter run:]", "UniGuidedFilter.m", 248, "newGuide");
}

void sub_24B6F1504()
{
  __assert_rtn("-[UniGuidedFilter run:]", "UniGuidedFilter.m", 265, "guidedFilter");
}

void sub_24B6F152C()
{
  __assert_rtn("-[UniGuidedFilter outputImage:]", "UniGuidedFilter.m", 302, "source");
}

void sub_24B6F1554()
{
  __assert_rtn("-[UniGuidedFilter outputImage:]", "UniGuidedFilter.m", 303, "guidance");
}

void sub_24B6F157C()
{
  __assert_rtn("-[UniGuidedFilter outputImage:]", "UniGuidedFilter.m", 304, "weights");
}

void sub_24B6F15A4()
{
  __assert_rtn("-[UniGuidedFilter outputImage:]", "UniGuidedFilter.m", 315, "ck");
}

void sub_24B6F15CC()
{
  __assert_rtn("-[UniGuidedFilter outputImage:]", "UniGuidedFilter.m", 320, "guidance");
}

void sub_24B6F15F4()
{
  __assert_rtn("-[UniGuidedFilter outputImage:]", "UniGuidedFilter.m", 351, "oImage");
}

void sub_24B6F161C()
{
  __assert_rtn("-[UniGuidedFilter outputImage:]", "UniGuidedFilter.m", 354, "u.texture");
}

void sub_24B6F1644(uint64_t a1, char *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Error running guided filter: %@"), a1);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = 136446466;
  v8 = "-[UniGuidedFilter outputImage:]";
  v9 = 2080;
  v10 = objc_msgSend_UTF8String(v3, v4, v5);
  sub_24B6D8DC0(&dword_24B6B5000, a2, v6, "%{public}s %s", (uint8_t *)&v7);

}

void sub_24B6F1704()
{
  __assert_rtn("+[UniHighlightRecovery runHighlightRecoveryWithInputTexture:outputTexture:temporaryTexture:dynamicParams:iterations:tileSize:scanKernel:diffuseKernel:copyBackKernel:copyKernel:commandBuffer:constants:forCoreImage:]", "UniHighlightRecovery.m", 314, "temporaryTexture");
}

void sub_24B6F172C()
{
  __assert_rtn("+[UniHighlightRecovery runHighlightRecoveryWithInputTexture:outputTexture:temporaryTexture:dynamicParams:iterations:tileSize:scanKernel:diffuseKernel:copyBackKernel:copyKernel:commandBuffer:constants:forCoreImage:]", "UniHighlightRecovery.m", 315, "halfResTex1.width <= temporaryTexture.width");
}

void sub_24B6F1754()
{
  __assert_rtn("+[UniHighlightRecovery runHighlightRecoveryWithInputTexture:outputTexture:temporaryTexture:dynamicParams:iterations:tileSize:scanKernel:diffuseKernel:copyBackKernel:copyKernel:commandBuffer:constants:forCoreImage:]", "UniHighlightRecovery.m", 316, "halfResTex1.height <= temporaryTexture.height");
}

void sub_24B6F177C()
{
  __assert_rtn("+[UniHighlightRecovery runHighlightRecoveryWithInputTexture:outputTexture:temporaryTexture:dynamicParams:iterations:tileSize:scanKernel:diffuseKernel:copyBackKernel:copyKernel:commandBuffer:constants:forCoreImage:]", "UniHighlightRecovery.m", 369, "[dynamicParams length] == sizeof(params)");
}

void sub_24B6F17A4()
{
  __assert_rtn("+[UniHighlightRecovery runHighlightRecoveryWithInputTexture:outputTexture:temporaryTexture:dynamicParams:iterations:tileSize:scanKernel:diffuseKernel:copyBackKernel:copyKernel:commandBuffer:constants:forCoreImage:]", "UniHighlightRecovery.m", 347, "MTLPixelFormatFlagsIsCompressed != (halfResTex2Info.flags & MTLPixelFormatFlagsIsCompressed)");
}

void sub_24B6F17CC()
{
  __assert_rtn("+[UniHighlightRecovery runHighlightRecoveryWithInputTexture:outputTexture:temporaryTexture:dynamicParams:iterations:tileSize:scanKernel:diffuseKernel:copyBackKernel:copyKernel:commandBuffer:constants:forCoreImage:]", "UniHighlightRecovery.m", 343, "MTLPixelFormatFlagsIsCompressed != (halfResTex1Info.flags & MTLPixelFormatFlagsIsCompressed)");
}

void sub_24B6F17F4()
{
  __assert_rtn("+[UniHighlightRecovery runHighlightRecoveryWithInputTexture:outputTexture:temporaryTexture:dynamicParams:iterations:tileSize:scanKernel:diffuseKernel:copyBackKernel:copyKernel:commandBuffer:constants:forCoreImage:]", "UniHighlightRecovery.m", 317, "halfResTex1.pixelFormat == temporaryTexture.pixelFormat");
}

void sub_24B6F181C()
{
  __assert_rtn("+[UniHighlightRecovery generateCIImage:]", "UniHighlightRecovery.m", 547, "oImage");
}

void sub_24B6F1844()
{
  __assert_rtn("-[UniHighlightRecovery outputImage:]", "UniHighlightRecovery.m", 566, "u.texture");
}

void sub_24B6F186C()
{
  __assert_rtn("+[UniImage metalRenderImageArray:queue:waitUntilScheduled:waitUntilCompleted:]", "UniImage.m", 463, "b");
}

void sub_24B6F1894()
{
  __assert_rtn("+[UniImage metalRenderImageArray:queue:waitUntilScheduled:waitUntilCompleted:]", "UniImage.m", 466, "skipMetalNode || [b conformsToProtocol:@protocol(MTLCommandBuffer)]");
}

void sub_24B6F18BC(uint8_t *a1, const char *a2, uint64_t *a3, NSObject *a4)
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Running %lu'th kernel"), a2);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend_UTF8String(v7, v8, v9);
  *(_DWORD *)a1 = 136315138;
  *a3 = v10;
  _os_log_debug_impl(&dword_24B6B5000, a4, OS_LOG_TYPE_DEBUG, "%s", a1, 0xCu);

}

void sub_24B6F1950()
{
  __assert_rtn("+[UniImage metalRenderImageArray:queue:waitUntilScheduled:waitUntilCompleted:]", "UniImage.m", 445, "[k isKindOfClass:uniKernelClass]");
}

void sub_24B6F1978()
{
  __assert_rtn("+[UniImage _textureDescriptionForDot:]", "UniImage.m", 545, "image");
}

void sub_24B6F19A0()
{
  __assert_rtn("+[UniImage _textureDescriptionForDot:]", "UniImage.m", 553, "formatName");
}

void sub_24B6F19C8()
{
  __assert_rtn("+[UniImage _stringForObject:objectToStringMap:]", "UniImage.m", 676, "mapTable");
}

void sub_24B6F19F0()
{
  __assert_rtn("-[UniImage coreImageRender:]", "UniImage.m", 872, "self.kernel");
}

void sub_24B6F1A18()
{
  __assert_rtn("-[UniImage coreImageRender:]", "UniImage.m", 879, "t");
}

void sub_24B6F1A40()
{
  __assert_rtn("-[UniImage coreImageRender:subRect:outputTexture:]", "UniImage.m", 905, "self.kernel");
}

void sub_24B6F1A68()
{
  __assert_rtn("-[UniImage coreImageRender:subRect:outputTexture:]", "UniImage.m", 911, "t");
}

void sub_24B6F1A90(uint64_t a1, const char *a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint8_t v14;

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("For function %@ you need to set the following function constants as well: %@"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sub_24B6E6660(v3, v4, v5);
  sub_24B6E6680();
  sub_24B6E6624(&dword_24B6B5000, v6, v7, "%s", v8, v9, v10, v11, a1, (uint64_t)a2, v14);

  sub_24B6D4EDC();
}

void sub_24B6F1B24()
{
  __assert_rtn("-[UniKernelInternal _dictToConstants:functionConstants:name:]", "UniKernel.m", 151, "n && [n isKindOfClass:[NSNumber class]]");
}

void sub_24B6F1B4C()
{
  __assert_rtn("-[UniKernelInternal _dictToConstants:functionConstants:name:]", "UniKernel.m", 155, "a && [a isKindOfClass:[NSArray class]] && a.count == nComp");
}

void sub_24B6F1B74()
{
  __assert_rtn("-[UniKernelInternal initWithName:metalLibrary:coreImageLibrary:pipelineLibrary:constants:]", "UniKernel.m", 237, "function");
}

void sub_24B6F1B9C(uint64_t a1, const char *a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v13;
  uint8_t v14;

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Error creating function: %@"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sub_24B6E6660(v3, v4, v5);
  sub_24B6E6680();
  sub_24B6E6624(&dword_24B6B5000, v6, v7, "%s", v8, v9, v10, v11, a1, v13, v14);

  sub_24B6D4EDC();
}

void sub_24B6F1C30()
{
  __assert_rtn("-[UniKernelInternal initWithName:metalLibrary:coreImageLibrary:pipelineLibrary:constants:]", "UniKernel.m", 272, "self.arguments");
}

void sub_24B6F1C58(uint64_t a1, const char *a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v13;
  uint8_t v14;

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("missing some struct parameters: %@"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sub_24B6E6660(v3, v4, v5);
  sub_24B6E6680();
  sub_24B6E6624(&dword_24B6B5000, v6, v7, "%s", v8, v9, v10, v11, a1, v13, v14);

  sub_24B6D4EDC();
}

void sub_24B6F1CEC()
{
  __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 759, "n && [n isKindOfClass:[NSNumber class]]");
}

void sub_24B6F1D14()
{
  __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 760, "encoder");
}

void sub_24B6F1D3C()
{
  __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 764, "cType && 1 == strlen(cType)");
}

void sub_24B6F1D64(char *a1, NSObject *a2)
{
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 136446466;
  v4 = "-[UniKernel _setNumber:forEncoder:atIndex:]";
  v5 = 1024;
  v6 = v2;
  _os_log_error_impl(&dword_24B6B5000, a2, OS_LOG_TYPE_ERROR, "%{public}s Unable to set obj-c value for this type of NSNumber: %c", (uint8_t *)&v3, 0x12u);
  sub_24B6CD1F8();
}

void sub_24B6F1DEC()
{
  __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 804, "[n longValue] <= 0x7fffffff");
}

void sub_24B6F1E14()
{
  __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 809, "[n longLongValue] <= 0x7fffffff");
}

void sub_24B6F1E3C()
{
  __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 818, "[n unsignedLongValue] <= 0xffffffffU");
}

void sub_24B6F1E64()
{
  __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 823, "[n unsignedLongLongValue] <= 0xffffffffU");
}

void sub_24B6F1E8C()
{
  __assert_rtn("-[UniKernel run:]", "UniKernel.m", 1297, "ri");
}

void sub_24B6F1EB4()
{
  __assert_rtn("-[UniKernel run:]", "UniKernel.m", 1130, "MTLArgumentAccessReadWrite != arg.access");
}

void sub_24B6F1EDC()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  sub_24B6E66A4();
  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_name(v3, v4, v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (void *)sub_24B6E6698();
  objc_msgSend_kernel(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mk(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_label(v12, v13, v14);
  objc_claimAutoreleasedReturnValue();
  sub_24B6E668C();
  objc_msgSend_stringWithFormat_(v2, v15, (uint64_t)CFSTR("Unable to set object on encoder for argument %@ on kernel %@"));
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sub_24B6E6668(v16, v17, v18);
  sub_24B6D4EC8();
  sub_24B6E664C(&dword_24B6B5000, v19, v20, "%{public}s %s", v21, v22, v23, v24, v25, v26, 2u);

  sub_24B6E6638();
}

void sub_24B6F1FC0()
{
  __assert_rtn("-[UniKernel run:]", "UniKernel.m", 1216, "((id<MTLBuffer>)data).length == [arg bufferDataSize]");
}

void sub_24B6F1FE8()
{
  __assert_rtn("-[UniKernel run:]", "UniKernel.m", 1223, "cachedBuffer");
}

void sub_24B6F2010()
{
  __assert_rtn("-[UniKernel run:]", "UniKernel.m", 1220, "data.length == [arg bufferDataSize]");
}

void sub_24B6F2038()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  sub_24B6E66A4();
  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_name(v3, v4, v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (void *)sub_24B6E6698();
  objc_msgSend_kernel(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mk(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_label(v12, v13, v14);
  objc_claimAutoreleasedReturnValue();
  sub_24B6E668C();
  objc_msgSend_stringWithFormat_(v2, v15, (uint64_t)CFSTR("Expected either NSData, a MTLBuffer or a NSDictionary for argument %@ on kernel %@"));
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sub_24B6E6668(v16, v17, v18);
  sub_24B6D4EC8();
  sub_24B6E664C(&dword_24B6B5000, v19, v20, "%{public}s %s", v21, v22, v23, v24, v25, v26, 2u);

  sub_24B6E6638();
}

void sub_24B6F211C()
{
  __assert_rtn("-[UniKernel run:]", "UniKernel.m", 1241, "cachedBuffer");
}

void sub_24B6F2144()
{
  __assert_rtn("-[UniKernel run:]", "UniKernel.m", 1271, "allocSize>0");
}

void sub_24B6F216C()
{
  __assert_rtn("-[UniKernel run:]", "UniKernel.m", 1266, "[threadgroupMemoryLength isKindOfClass:[NSNumber class]]");
}

void sub_24B6F2194(uint64_t a1, NSObject *a2)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "Don't know how to handle mtl pixel format ";
  v5 = 2048;
  v6 = a1;
  v7 = 2080;
  v8 = pixelFormatName(a1, 0);
  _os_log_error_impl(&dword_24B6B5000, a2, OS_LOG_TYPE_ERROR, "%s%lu (%s)", (uint8_t *)&v3, 0x20u);
  sub_24B6D4EDC();
}

void sub_24B6F223C()
{
  __assert_rtn("+[UniKernel _outputTextureForTexture:force:]", "UniKernel.m", 1471, "MTLTextureUsagePixelFormatView == (texture.usage & MTLTextureUsagePixelFormatView)");
}

void sub_24B6F2264()
{
  __assert_rtn("+[UniKernel _outputTextureForTexture:force:]", "UniKernel.m", 1494, "MTLPixelFormatInvalid != newFormat");
}

void sub_24B6F228C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6E6670(&dword_24B6B5000, a1, a3, "Unable to get CIImage for inputImage", a5, a6, a7, a8, 0);
}

void sub_24B6F22C0()
{
  __assert_rtn("-[UniKernel _intputOrOutputNameArray:]", "UniKernel.m", 1609, "arg.name");
}

void sub_24B6F22E8(void *a1, const char *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18[6];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_kernel(a1, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mk(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_label(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v13, (uint64_t)CFSTR("output texture %@ missing for kernel %@"), a2, v12);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v14, v15, v16);
  v18[0] = 136446466;
  sub_24B6D4EC8();
  sub_24B6D8DC0(&dword_24B6B5000, a3, v17, "%{public}s %s", (uint8_t *)v18);

  sub_24B6E6638();
}

void sub_24B6F23D0()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  sub_24B6E66A4();
  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_name(v3, v4, v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (void *)sub_24B6E6698();
  objc_msgSend_kernel(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mk(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_label(v12, v13, v14);
  objc_claimAutoreleasedReturnValue();
  sub_24B6E668C();
  objc_msgSend_stringWithFormat_(v2, v15, (uint64_t)CFSTR("output buffer %@ missing for kernel %@"));
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sub_24B6E6668(v16, v17, v18);
  sub_24B6D4EC8();
  sub_24B6E664C(&dword_24B6B5000, v19, v20, "%{public}s %s", v21, v22, v23, v24, v25, v26, 2u);

  sub_24B6E6638();
}

void sub_24B6F24B4()
{
  __assert_rtn("-[UniKernel _findOutputRect]", "UniKernel.m", 1714, "self.kernel");
}

void sub_24B6F24DC()
{
  __assert_rtn("-[UniKernel _findOutputRect]", "UniKernel.m", 1715, "self.kernel.arguments");
}

void sub_24B6F2504(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = a1;
  sub_24B6CFB14(&dword_24B6B5000, a2, a3, "Argument at index %lu for kernel not set; returning empty image",
    (uint8_t *)&v3);
  sub_24B6CD1F8();
}

void sub_24B6F256C(uint64_t a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 136315394;
  *(_QWORD *)(a2 + 4) = "unable to create object for argument with name ";
  *(_WORD *)(a2 + 12) = 2080;
  *(_QWORD *)(a2 + 14) = a1;
  sub_24B6D8DC0(&dword_24B6B5000, a3, (uint64_t)a3, "%s%s", (uint8_t *)a2);

}

void sub_24B6F25CC(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = a1;
  sub_24B6CFB14(&dword_24B6B5000, a2, a3, "%s", (uint8_t *)&v3);
  sub_24B6CD1F8();
}

void sub_24B6F2634(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24B6E6670(&dword_24B6B5000, a1, a3, "Unhandled argument type by Core Image", a5, a6, a7, a8, 0);
}

void sub_24B6F2668()
{
  __assert_rtn("+[UniKernel generateCIImage:]", "UniKernel.m", 1787, "outImage");
}

void sub_24B6F2690()
{
  __assert_rtn("-[UniKernel outputImage:]", "UniKernel.m", 2223, "k");
}

void sub_24B6F26B8()
{
  __assert_rtn("-[UniKernel outputImage:]", "UniKernel.m", 2232, "outputImages && outputImages.count > 0 && outputImages[0]");
}

void sub_24B6F26E0()
{
  __assert_rtn("-[UniKernel outputImage:]", "UniKernel.m", 2252, "u");
}

void sub_24B6F2708()
{
  __assert_rtn("-[UniKernel outputImage:]", "UniKernel.m", 2255, "u.texture && ([u.texture conformsToProtocol:@protocol(MTLTexture)] || [u.texture isKindOfClass:[UniImage class]])");
}

void sub_24B6F2730(uint8_t *a1, id a2, uint64_t *a3, NSObject *a4)
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = objc_retainAutorelease(a2);
  v10 = objc_msgSend_UTF8String(v7, v8, v9);
  *(_DWORD *)a1 = 136315138;
  *a3 = v10;
  _os_log_error_impl(&dword_24B6B5000, a4, OS_LOG_TYPE_ERROR, "Don't know how to set value for key %s because it is nil", a1, 0xCu);
}

void sub_24B6F279C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 136446466;
  v6 = "-[UniLibrary initWithDevice:metalOnly:]";
  v7 = 2080;
  v8 = objc_msgSend_UTF8String(0, a2, a3);
  sub_24B6E6B44(&dword_24B6B5000, v3, v4, "%{public}s Unable to open %s metal libary", (uint8_t *)&v5);
}

void sub_24B6F2830(uint64_t a1, const char *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Error compiling library: %@"), a1);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = 136446466;
  v8 = "-[UniLibrary initWithDevice:metalOnly:]";
  v9 = 2080;
  v10 = objc_msgSend_UTF8String(v2, v3, v4);
  sub_24B6E6B44(&dword_24B6B5000, v5, v6, "%{public}s %s", (uint8_t *)&v7);

}

void sub_24B6F28EC()
{
  __assert_rtn("-[UniLibrary initWithDevice:metalOnly:]", "UniLibrary.m", 35, "self.coreImageLibrary");
}

void sub_24B6F2914()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 268, "0 != threadsPerThreadGroup.width");
}

void sub_24B6F293C()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 269, "0 != threadsPerThreadGroup.height");
}

void sub_24B6F2964()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 270, "0 != threadsPerThreadGroup.depth");
}

void sub_24B6F298C()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 280, "0 != threadsPerGrid.width || 0 != threadgroupsPerGrid.width");
}

void sub_24B6F29B4()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 281, "0 != threadsPerGrid.height || 0 != threadgroupsPerGrid.height");
}

void sub_24B6F29DC()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 282, "0 != threadsPerGrid.depth || 0 != threadgroupsPerGrid.depth");
}

void sub_24B6F2A04()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 285, "0 != threadsPerGrid.width");
}

void sub_24B6F2A2C()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 286, "0 != threadsPerGrid.height");
}

void sub_24B6F2A54()
{
  __assert_rtn("-[UniRunInfo dispatchOn:]", "UniRunInfo.m", 287, "0 != threadsPerGrid.depth");
}

void sub_24B6F2A7C()
{
  __assert_rtn("removeNewlinesFromString", "UniRunInfo.m", 349, "s");
}

void sub_24B6F2AA4()
{
  __assert_rtn("-[UniSourceOver run:]", "UniSourceOver.m", 38, "inputTexture");
}

void sub_24B6F2ACC()
{
  __assert_rtn("-[UniSourceOver outputImage:]", "UniSourceOver.m", 81, "baseImage");
}

void sub_24B6F2AF4()
{
  __assert_rtn("-[UniScaleImage run:]", "UniScaleImage.m", 43, "inputTexture");
}

void sub_24B6F2B1C()
{
  __assert_rtn("-[UniScaleImage run:]", "UniScaleImage.m", 44, "outputTexture");
}

void sub_24B6F2B44()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v0 = (void *)objc_opt_class();
  objc_msgSend_description(v0, v1, v2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v3, v4, v5);
  objc_msgSend_UTF8String(CFSTR("bilinearResampling"), v6, v7);
  sub_24B6E9C90(&dword_24B6B5000, v8, v9, "%{public}s Unable to load bundle for class: %s and hence associated function: %s", v10, v11, v12, v13, 2u);

  sub_24B6E9CA4();
}

void sub_24B6F2BFC(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend_functionNames(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v3, v4, v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v6, v7, v8);
  sub_24B6E9C90(&dword_24B6B5000, v9, v10, "%{public}s Unable to create function %@; must be one of %s",
    v11,
    v12,
    v13,
    v14,
    2u);

  sub_24B6E9CA4();
}

void sub_24B6F2CBC()
{
  __assert_rtn("-[UniTextureView sibling:]", "UniTextureView.m", 51, "texture");
}

void sub_24B6F2CE4()
{
  __assert_rtn("-[UniTextureView sibling:]", "UniTextureView.m", 52, "MTLTextureUsagePixelFormatView == (texture.usage & MTLTextureUsagePixelFormatView)");
}

void sub_24B6F2D0C()
{
  __assert_rtn("-[UniTextureView sibling:]", "UniTextureView.m", 101, "MTLPixelFormatInvalid != newFormat");
}

void sub_24B6F2D34()
{
  __assert_rtn("-[UniTextureView run:]", "UniTextureView.m", 123, "texture");
}

void sub_24B6F2D5C()
{
  __assert_rtn("-[UniTextureView run:]", "UniTextureView.m", 145, "t");
}

void sub_24B6F2D84()
{
  __assert_rtn("-[UniTextureView run:]", "UniTextureView.m", 146, "t.pixelFormat != texture.pixelFormat");
}

void sub_24B6F2DAC()
{
  __assert_rtn("-[UniTextureView outputImage:]", "UniTextureView.m", 167, "baseImage");
}

void sub_24B6F2DD4(uint64_t a1, char *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Unsupported desired format for use with Core Image: %@"), a1);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_DWORD *)buf = 136446466;
  v7 = "-[UniTextureView outputImage:]";
  v8 = 2080;
  v9 = objc_msgSend_UTF8String(v3, v4, v5);
  _os_log_error_impl(&dword_24B6B5000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%{public}s %s", buf, 0x16u);

}

void sub_24B6F2E9C(uint64_t a1, char *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  MTLDataTypeAsString(a1, a2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = 136446466;
  v7 = "packSingleValue";
  v8 = 2080;
  v9 = objc_msgSend_UTF8String(v3, v4, v5);
  _os_log_error_impl(&dword_24B6B5000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%{public}s Don't know how to pack object of type %s", (uint8_t *)&v6, 0x16u);

}

void sub_24B6F2F4C()
{
  __assert_rtn("shortTextureDescription", "Utils.m", 697, "[texture conformsToProtocol:@protocol(MTLTexture)]");
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x24BDBD8C8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

CGImageMetadataTagRef CGImageMetadataCopyTagWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CGImageMetadataTagRef)MEMORY[0x24BDD90B0](metadata, parent, path);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x24BDD9120](tag);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x24BDDD388]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x24BDAD250](a1);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x24BE2FB00]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x24BE2FB18]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x24BE2FB38]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x24BE2FBA0]();
}

uint64_t espresso_network_query_blob_shape()
{
  return MEMORY[0x24BE2FC40]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x24BE2FC70]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x24BE2FC80]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x24BE2FC90]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x24BE2FCA0]();
}

uint64_t espresso_plan_submit()
{
  return MEMORY[0x24BE2FCD0]();
}

uint64_t espresso_plan_submit_set_multiple_buffering()
{
  return MEMORY[0x24BE2FCD8]();
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x24BDAE280](a1);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

float hypotf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE840](a1, a2);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

