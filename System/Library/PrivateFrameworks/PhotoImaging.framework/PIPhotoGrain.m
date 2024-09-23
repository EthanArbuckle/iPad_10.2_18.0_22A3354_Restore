@implementation PIPhotoGrain

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  uint64_t v22;
  _QWORD v23[4];
  _QWORD v24[6];

  v24[4] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0C9DE30];
  v22 = *MEMORY[0x1E0C9DF38];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  v23[1] = CFSTR("inputLevel");
  v3 = *MEMORY[0x1E0C9DE58];
  v18[0] = *MEMORY[0x1E0C9DE60];
  v2 = v18[0];
  v18[1] = v3;
  v21[0] = &unk_1E5051A58;
  v21[1] = &unk_1E5051A68;
  v5 = *MEMORY[0x1E0C9DE68];
  v19 = *MEMORY[0x1E0C9DE10];
  v4 = v19;
  v20 = v5;
  v6 = *MEMORY[0x1E0C9DE90];
  v21[2] = &unk_1E5051A58;
  v21[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v18, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v7;
  v23[2] = CFSTR("inputAmount");
  v16[0] = v2;
  v16[1] = v3;
  v17[0] = &unk_1E5051A58;
  v17[1] = &unk_1E5051A68;
  v8 = *MEMORY[0x1E0C9DE40];
  v16[2] = v4;
  v16[3] = v8;
  v17[2] = &unk_1E5051A68;
  v17[3] = &unk_1E5051A58;
  v16[4] = v5;
  v17[4] = *MEMORY[0x1E0C9DED0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v9;
  v23[3] = CFSTR("inputPhase");
  v14[0] = v2;
  v14[1] = v3;
  v15[0] = &unk_1E5051A58;
  v15[1] = &unk_1E5051A68;
  v14[2] = v4;
  v14[3] = v5;
  v15[2] = &unk_1E5051A68;
  v15[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)outputImage
{
  void *v3;
  float v4;
  float v5;
  float v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  -[PIPhotoGrain inputLevel](self, "inputLevel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  v6 = exp2f((float)(v5 * 10.0) + -3.0) * 100.0;
  -[PIPhotoGrain inputAmount](self, "inputAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  -[PIPhotoGrain inputPhase](self, "inputPhase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  -[PIPhotoGrain inputImage](self, "inputImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("inputISO");
  *(float *)&v14 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v23[1] = CFSTR("inputAmount");
  LODWORD(v16) = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v17;
  v23[2] = CFSTR("inputSeed");
  LODWORD(v18) = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPhotoGrain"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (NSNumber)inputLevel
{
  return self->_inputLevel;
}

- (void)setInputLevel:(id)a3
{
  objc_storeStrong((id *)&self->_inputLevel, a3);
}

- (NSNumber)inputAmount
{
  return self->_inputAmount;
}

- (void)setInputAmount:(id)a3
{
  objc_storeStrong((id *)&self->_inputAmount, a3);
}

- (NSNumber)inputPhase
{
  return self->_inputPhase;
}

- (void)setInputPhase:(id)a3
{
  objc_storeStrong((id *)&self->_inputPhase, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputPhase, 0);
  objc_storeStrong((id *)&self->_inputAmount, 0);
  objc_storeStrong((id *)&self->_inputLevel, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
