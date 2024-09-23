@implementation PIRadialGradient

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];
  _QWORD v31[6];
  _QWORD v32[8];

  v32[6] = *MEMORY[0x1E0C80C00];
  v31[0] = *MEMORY[0x1E0C9DE30];
  v2 = *MEMORY[0x1E0C9DF40];
  v30[0] = *MEMORY[0x1E0C9DF18];
  v30[1] = v2;
  v30[2] = *MEMORY[0x1E0C9DF30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v19;
  v31[1] = *MEMORY[0x1E0C9E1B8];
  v4 = *MEMORY[0x1E0C9DEB8];
  v5 = *MEMORY[0x1E0C9DE10];
  v28[0] = *MEMORY[0x1E0C9DE68];
  v3 = v28[0];
  v28[1] = v5;
  v29[0] = v4;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.0, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v17;
  v31[2] = CFSTR("inputPoint0");
  v26[1] = v5;
  v27[0] = v4;
  v26[0] = v3;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 50.0, 50.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v6;
  v31[3] = CFSTR("inputPoint1");
  v24[1] = v5;
  v25[0] = v4;
  v24[0] = v3;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 250.0, 250.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v8;
  v31[4] = CFSTR("inputColor0");
  v9 = *MEMORY[0x1E0C9DE80];
  v22[1] = v5;
  v23[0] = v9;
  v22[0] = v3;
  objc_msgSend(MEMORY[0x1E0C9DD80], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v11;
  v31[5] = CFSTR("inputColor1");
  v20[1] = v5;
  v21[0] = v9;
  v20[0] = v3;
  objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)outputImage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  float64x2_t v24;
  float64_t v25;
  double v26;
  float64x2_t v27;
  float64_t v28;
  double v29;
  float64x2_t v30;
  float64_t v31;
  float64x2_t v32;
  float64x2_t v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  float64_t v43;
  float64_t v44;
  float64x2_t v45;
  float64_t v46;
  float64x2_t v47;
  _QWORD v48[5];
  _QWORD v49[7];

  v49[5] = *MEMORY[0x1E0C80C00];
  -[PIRadialGradient inputColor0](self, "inputColor0");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C9DD80], "whiteColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[PIRadialGradient inputColor1](self, "inputColor1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  -[PIRadialGradient inputCenter](self, "inputCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.0, 0.0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  -[PIRadialGradient inputPoint0](self, "inputPoint0");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 50.0, 50.0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  -[PIRadialGradient inputPoint1](self, "inputPoint1");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 250.0, 250.0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;

  objc_msgSend(v14, "X");
  v46 = v23;
  objc_msgSend(v14, "Y");
  v24.f64[0] = v46;
  v24.f64[1] = v25;
  v47 = v24;
  objc_msgSend(v18, "X");
  v44 = v26;
  objc_msgSend(v18, "Y");
  v27.f64[0] = v44;
  v27.f64[1] = v28;
  v45 = v27;
  objc_msgSend(v22, "X");
  v43 = v29;
  objc_msgSend(v22, "Y");
  v30.f64[0] = v43;
  v30.f64[1] = v31;
  v32 = vsubq_f64(v45, v47);
  v33 = vsubq_f64(v30, v47);
  v34 = sqrt(vaddvq_f64(vmulq_f64(v33, v33)));
  v35 = (void *)MEMORY[0x1E0C9DDB8];
  v36 = *MEMORY[0x1E0C9E1B8];
  v49[0] = v14;
  v48[0] = v36;
  v48[1] = CFSTR("inputRadius0");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqrt(vaddvq_f64(vmulq_f64(v32, v32))));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v37;
  v48[2] = CFSTR("inputRadius1");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v38;
  v49[3] = v6;
  v48[3] = CFSTR("inputColor0");
  v48[4] = CFSTR("inputColor1");
  v49[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "filterWithName:withInputParameters:", CFSTR("CIRadialGradient"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "outputImage");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (CIVector)inputCenter
{
  return self->_inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_storeStrong((id *)&self->_inputCenter, a3);
}

- (CIVector)inputPoint0
{
  return self->_inputPoint0;
}

- (void)setInputPoint0:(id)a3
{
  objc_storeStrong((id *)&self->_inputPoint0, a3);
}

- (CIVector)inputPoint1
{
  return self->_inputPoint1;
}

- (void)setInputPoint1:(id)a3
{
  objc_storeStrong((id *)&self->_inputPoint1, a3);
}

- (CIColor)inputColor0
{
  return self->_inputColor0;
}

- (void)setInputColor0:(id)a3
{
  objc_storeStrong((id *)&self->_inputColor0, a3);
}

- (CIColor)inputColor1
{
  return self->_inputColor1;
}

- (void)setInputColor1:(id)a3
{
  objc_storeStrong((id *)&self->_inputColor1, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputColor1, 0);
  objc_storeStrong((id *)&self->_inputColor0, 0);
  objc_storeStrong((id *)&self->_inputPoint1, 0);
  objc_storeStrong((id *)&self->_inputPoint0, 0);
  objc_storeStrong((id *)&self->_inputCenter, 0);
}

@end
