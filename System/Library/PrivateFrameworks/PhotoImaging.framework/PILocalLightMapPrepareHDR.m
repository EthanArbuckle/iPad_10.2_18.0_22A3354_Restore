@implementation PILocalLightMapPrepareHDR

+ (id)customAttributes
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  _QWORD v19[2];
  _QWORD v20[3];
  _QWORD v21[5];

  v21[3] = *MEMORY[0x1E0C80C00];
  v20[0] = *MEMORY[0x1E0C9DE30];
  v2 = *MEMORY[0x1E0C9DF30];
  v19[0] = *MEMORY[0x1E0C9DF00];
  v19[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v3;
  v20[1] = CFSTR("inputLightMapWidth");
  v5 = *MEMORY[0x1E0C9DE10];
  v15[0] = *MEMORY[0x1E0C9DE50];
  v4 = v15[0];
  v15[1] = v5;
  v18[0] = &unk_1E5051E88;
  v18[1] = &unk_1E5051E88;
  v7 = *MEMORY[0x1E0C9DE90];
  v8 = *MEMORY[0x1E0C9DE08];
  v16 = *MEMORY[0x1E0C9DE68];
  v6 = v16;
  v17 = v8;
  v18[2] = v7;
  v18[3] = CFSTR("NSNumber");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v15, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  v20[2] = CFSTR("inputLightMapHeight");
  v13[0] = v4;
  v13[1] = v5;
  v14[0] = &unk_1E5051E88;
  v14[1] = &unk_1E5051E88;
  v13[2] = v6;
  v13[3] = v8;
  v14[2] = v7;
  v14[3] = CFSTR("NSNumber");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)outputImage
{
  NSData *inputLightMap;
  void *v4;
  void *v5;
  CIImage *inputGuideImage;
  uint64_t v7;

  inputLightMap = self->inputLightMap;
  if (inputLightMap)
  {
    _lightMapImageFromData(inputLightMap, self->inputLightMapWidth, self->inputLightMapHeight);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    inputGuideImage = self->inputGuideImage;
    if (inputGuideImage)
    {
      _scaledLightMapImage(v4, inputGuideImage);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputGuideImage, 0);
  objc_storeStrong((id *)&self->inputLightMapHeight, 0);
  objc_storeStrong((id *)&self->inputLightMapWidth, 0);
  objc_storeStrong((id *)&self->inputLightMap, 0);
}

@end
