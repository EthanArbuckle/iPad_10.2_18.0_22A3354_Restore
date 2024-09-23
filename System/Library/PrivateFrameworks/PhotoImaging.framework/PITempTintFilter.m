@implementation PITempTintFilter

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[7];
  _QWORD v17[7];
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[6];
  uint64_t v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[5];

  v28[3] = *MEMORY[0x1E0C80C00];
  v27[0] = *MEMORY[0x1E0C9DE30];
  v2 = *MEMORY[0x1E0C9DF40];
  v26[0] = *MEMORY[0x1E0C9DF00];
  v26[1] = v2;
  v26[2] = *MEMORY[0x1E0C9DF30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  v27[1] = CFSTR("inputTemperature");
  v4 = *MEMORY[0x1E0C9DE50];
  v18[0] = *MEMORY[0x1E0C9DE10];
  v3 = v18[0];
  v18[1] = v4;
  v24[0] = &unk_1E5051B48;
  v24[1] = &unk_1E5051B58;
  v6 = *MEMORY[0x1E0C9DE60];
  v19 = *MEMORY[0x1E0C9DE48];
  v5 = v19;
  v20 = v6;
  v24[2] = &unk_1E5051B68;
  v24[3] = &unk_1E5051B78;
  v8 = *MEMORY[0x1E0C9DE40];
  v21 = *MEMORY[0x1E0C9DE58];
  v7 = v21;
  v22 = v8;
  v24[4] = &unk_1E5051B88;
  v24[5] = &unk_1E5051B48;
  v23 = *MEMORY[0x1E0C9DE68];
  v9 = v23;
  v25 = *MEMORY[0x1E0C9DED0];
  v10 = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v18, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = CFSTR("inputTint");
  v28[1] = v11;
  v16[0] = v3;
  v16[1] = v4;
  v17[0] = &unk_1E5051B98;
  v17[1] = &unk_1E5051BA8;
  v16[2] = v5;
  v16[3] = v6;
  v17[2] = &unk_1E5051BB8;
  v17[3] = &unk_1E5051BC8;
  v16[4] = v7;
  v16[5] = v8;
  v17[4] = &unk_1E5051BD8;
  v17[5] = &unk_1E5051B98;
  v16[6] = v9;
  v17[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)outputImage
{
  void *v3;
  void *v4;
  NSObject *v6;
  void *v7;
  const void **v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->_inputImage)
  {
    NUAssertLogger_4917();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputImage cannot be nil"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v7;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v19, 0xCu);

    }
    v8 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4917();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v16 = v14;
        objc_msgSend(v15, "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v14;
        v21 = 2114;
        v22 = v18;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v19, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v13;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v19, 0xCu);

    }
    _NUAssertFailHandler();
  }
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIColorMatrix"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", self->_inputImage, CFSTR("inputImage"));
  -[PITempTintFilter setInputVectorsForFilter:](self, "setInputVectorsForFilter:", v3);
  objc_msgSend(v3, "outputImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setInputVectorsForFilter:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __double2 v14;
  double sinval;
  double cosval;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  char v27;
  int v28;
  double v29;
  double v30;
  __double2 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  _OWORD v48[4];
  uint64_t v49;
  float64x2_t v50;
  double v51;
  float64x2_t v52;
  double v53;
  float64x2_t v54;
  double v55;
  _OWORD v56[4];
  uint64_t v57;
  double v58;
  uint64_t v59;
  double v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  double v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  -[PITempTintFilter inputTemperature](self, "inputTemperature");
  v5 = v4;
  -[PITempTintFilter inputTint](self, "inputTint");
  v7 = v6;
  v58 = 0.0;
  v59 = 0;
  v60 = 0.0;
  v8 = 2000.0;
  if (v5 >= 2000.0)
    v8 = v5;
  if (v8 <= 50000.0)
    v9 = v8;
  else
    v9 = 50000.0;
  if (v7 <= 0.0)
  {
    v30 = 1000.0 / v9;
    v31 = __sincos_stret(v30 * (v30 * v30) * 49.864+ 1000.0 / v9 * (v30 * (v30 * v30)) * -36.855+ v30 * v30 * -19.656+ v30 * -0.5063+ -0.2464);
    sinval = v31.__sinval;
    cosval = v31.__cosval;
  }
  else
  {
    *(_QWORD *)&v61 = 0;
    *(_QWORD *)&v56[0] = 0;
    GUTemp_to_xy((double *)&v61, (double *)v56, v9);
    v10 = *(double *)v56 * 12.0 + *(double *)&v61 * -2.0 + 3.0;
    v11 = *(double *)&v61 * 4.0 / v10;
    v12 = *(double *)v56 * 6.0 / v10;
    v13 = 1000.0 / v9;
    v14 = __sincos_stret(v13 * (v13 * v13) * 49.864+ 1000.0 / v9 * (v13 * (v13 * v13)) * -36.855+ v13 * v13 * -19.656+ v13 * -0.5063+ -0.2464);
    sinval = v14.__sinval;
    cosval = v14.__cosval;
    v17 = 0;
    v18 = 150.0;
    v19 = 1.0;
    v20 = 1.0;
    while (1)
    {
      v21 = v11 - v14.__cosval * 150.0 * v20 / 3000.0;
      v22 = v12 - v14.__sinval * 150.0 * v20 / 3000.0;
      if (v22 <= v21 * -0.1 + 0.4
        && (v23 = v21 * 3.0,
            v24 = v21 * 2.0 + 4.0 + v22 * -8.0,
            v25 = v23 / v24,
            v26 = (v22 + v22) / v24,
            v25 + v26 <= 1.0)
        && v26 <= (1.039 - v25) * 0.86)
      {
        v28 = 0;
        v18 = v20 * 150.0;
        v27 = 1;
      }
      else
      {
        v27 = 0;
        v28 = 1;
      }
      if (v17)
        v27 = 0;
      if ((v27 & 1) != 0 || v17 > 0xF)
        break;
      v29 = -v19;
      if (!v28)
        v29 = v19;
      v20 = v20 + v29;
      ++v17;
      v19 = v19 * 0.5;
    }
    v7 = v7 * (v18 / 150.0);
  }
  *(_QWORD *)&v61 = 0;
  *(_QWORD *)&v56[0] = 0;
  v32 = 150.0;
  if (v7 <= 150.0)
    v32 = v7;
  if (v32 >= -150.0)
    v33 = v32;
  else
    v33 = -150.0;
  GUTemp_to_xy((double *)&v61, (double *)v56, v9);
  v34 = *(double *)v56 * 12.0 + *(double *)&v61 * -2.0 + 3.0;
  v35 = *(double *)&v61 * 4.0 / v34 - cosval * v33 / 3000.0;
  v36 = *(double *)v56 * 6.0 / v34 - sinval * v33 / 3000.0;
  v37 = v35 * 2.0 + 4.0 + v36 * -8.0;
  v38 = (v36 + v36) / v37;
  if (v38 >= 1.0e-20)
  {
    v39 = v35 * 3.0 / v37;
    v58 = v39 / v38;
    v59 = 0x3FF0000000000000;
    v60 = (1.0 - v39) / v38 + -1.0;
  }
  v57 = 0;
  memset(v56, 0, sizeof(v56));
  GUGetAdaptationMatrix(&v58, (double *)v56);
  v49 = 0;
  memset(v48, 0, sizeof(v48));
  v66 = xmmword_1A64DDDB0;
  v67 = 0x3FF16CC7D1EF8103;
  v65 = 0.0;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  GUGetAdaptationMatrix((double *)&v66, (double *)&v61);
  v50 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_1A64DDDC0, *((double *)&v61 + 1)), (float64x2_t)xmmword_1A64DDDD0, *(double *)&v61), (float64x2_t)xmmword_1A64DDDE0, *(double *)&v62);
  v51 = *((double *)&v61 + 1) * 0.0959986815 + *(double *)&v61 * 0.193244099 + *(double *)&v62 * 0.957493343;
  v52 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_1A64DDDC0, *(double *)&v63), (float64x2_t)xmmword_1A64DDDD0, *((double *)&v62 + 1)), (float64x2_t)xmmword_1A64DDDE0, *((double *)&v63 + 1));
  v53 = *(double *)&v63 * 0.0959986815 + *((double *)&v62 + 1) * 0.193244099 + *((double *)&v63 + 1) * 0.957493343;
  v54 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_1A64DDDC0, *((double *)&v64 + 1)), (float64x2_t)xmmword_1A64DDDD0, *(double *)&v64), (float64x2_t)xmmword_1A64DDDE0, v65);
  v55 = *((double *)&v64 + 1) * 0.0959986815 + *(double *)&v64 * 0.193244099 + v65 * 0.957493343;
  GUInvertMatrix(v50.f64, (double *)v48);
  v65 = 1.0;
  v61 = 0x3FF0000000000000uLL;
  v62 = 0uLL;
  v63 = 0x3FF0000000000000uLL;
  v64 = 0uLL;
  GUMatrixMatrix((double *)&v61, v50.f64, (double *)&v61);
  GUMatrixMatrix((double *)&v61, (double *)v56, (double *)&v61);
  GUMatrixMatrix((double *)&v61, (double *)v48, (double *)&v61);
  v40 = v62;
  v41 = v63;
  v42 = v64;
  v43 = v65;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v61, *(double *)&v62, 0.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", *((double *)&v40 + 1), v41, 0.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v42, v43, 0.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setValue:forKey:", v44, CFSTR("inputRVector"));
  objc_msgSend(v47, "setValue:forKey:", v45, CFSTR("inputGVector"));
  objc_msgSend(v47, "setValue:forKey:", v46, CFSTR("inputBVector"));

}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (double)inputTemperature
{
  return self->_inputTemperature;
}

- (void)setInputTemperature:(double)a3
{
  self->_inputTemperature = a3;
}

- (double)inputTint
{
  return self->_inputTint;
}

- (void)setInputTint:(double)a3
{
  self->_inputTint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
