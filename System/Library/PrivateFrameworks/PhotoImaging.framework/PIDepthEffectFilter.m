@implementation PIDepthEffectFilter

- (id)outputImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[PIDepthEffectFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIDepthEffectApplyBlurMap"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIDepthEffectFilter inputImage](self, "inputImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, *MEMORY[0x1E0C9E1F8]);

  -[PIDepthEffectFilter inputBlurMap](self, "inputBlurMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, CFSTR("inputBlurMap"));

  -[PIDepthEffectFilter inputMatte](self, "inputMatte");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v7, CFSTR("inputMatteImage"));

  -[PIDepthEffectFilter inputScale](self, "inputScale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v8, *MEMORY[0x1E0C9E268]);

  -[PIDepthEffectFilter inputLumaNoiseScale](self, "inputLumaNoiseScale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v9, CFSTR("inputLumaNoiseScale"));

  -[PIDepthEffectFilter inputShape](self, "inputShape");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v10, CFSTR("inputShape"));

  -[PIDepthEffectFilter inputAperture](self, "inputAperture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v11, CFSTR("inputAperture"));

  -[PIDepthEffectFilter inputDepthMetadata](self, "inputDepthMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v12, CFSTR("inputAuxDataMetadata"));

  -[PIDepthEffectFilter inputGainMap](self, "inputGainMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIDepthEffectFilter inputGainMapIsLinear](self, "inputGainMapIsLinear");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if ((v15 & 1) == 0)
  {
    objc_msgSend(v13, "_imageByApplyingGamma:", 0.454545455);
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v16;
  }
  -[PIDepthEffectFilter inputGainMapMetadata](self, "inputGainMapMetadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v25 = *MEMORY[0x1E0CBC6D0];
    v26[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageBySettingPropertiesNoCopy:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v19;
  }
  objc_msgSend(v4, "setValue:forKey:", v13, CFSTR("inputGainMap"));
  -[PIDepthEffectFilter inputBestHairQuality](self, "inputBestHairQuality");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v20, CFSTR("inputBestHairQuality"));

  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "portraitDisableFuzzball");

  if (v22)
    objc_msgSend(v4, "setValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("inputBestHairQuality"));
  objc_msgSend(v4, "outputImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)inputMatte
{
  return self->_inputMatte;
}

- (void)setInputMatte:(id)a3
{
  objc_storeStrong((id *)&self->_inputMatte, a3);
}

- (CIImage)inputBlurMap
{
  return self->_inputBlurMap;
}

- (void)setInputBlurMap:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlurMap, a3);
}

- (CIImage)inputGainMap
{
  return self->_inputGainMap;
}

- (void)setInputGainMap:(id)a3
{
  objc_storeStrong((id *)&self->_inputGainMap, a3);
}

- (NSNumber)inputGainMapIsLinear
{
  return self->_inputGainMapIsLinear;
}

- (void)setInputGainMapIsLinear:(id)a3
{
  objc_storeStrong((id *)&self->_inputGainMapIsLinear, a3);
}

- (NSNumber)inputAperture
{
  return self->_inputAperture;
}

- (void)setInputAperture:(id)a3
{
  objc_storeStrong((id *)&self->_inputAperture, a3);
}

- (id)inputShape
{
  return self->_inputShape;
}

- (void)setInputShape:(id)a3
{
  objc_storeStrong(&self->_inputShape, a3);
}

- (id)inputDepthMetadata
{
  return self->_inputDepthMetadata;
}

- (void)setInputDepthMetadata:(id)a3
{
  objc_storeStrong(&self->_inputDepthMetadata, a3);
}

- (id)inputGainMapMetadata
{
  return self->_inputGainMapMetadata;
}

- (void)setInputGainMapMetadata:(id)a3
{
  objc_storeStrong(&self->_inputGainMapMetadata, a3);
}

- (NSNumber)inputScale
{
  return self->_inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_storeStrong((id *)&self->_inputScale, a3);
}

- (NSNumber)inputLumaNoiseScale
{
  return self->_inputLumaNoiseScale;
}

- (void)setInputLumaNoiseScale:(id)a3
{
  objc_storeStrong((id *)&self->_inputLumaNoiseScale, a3);
}

- (NSNumber)inputBestHairQuality
{
  return self->_inputBestHairQuality;
}

- (void)setInputBestHairQuality:(id)a3
{
  objc_storeStrong((id *)&self->_inputBestHairQuality, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBestHairQuality, 0);
  objc_storeStrong((id *)&self->_inputLumaNoiseScale, 0);
  objc_storeStrong((id *)&self->_inputScale, 0);
  objc_storeStrong(&self->_inputGainMapMetadata, 0);
  objc_storeStrong(&self->_inputDepthMetadata, 0);
  objc_storeStrong(&self->_inputShape, 0);
  objc_storeStrong((id *)&self->_inputAperture, 0);
  objc_storeStrong((id *)&self->_inputGainMapIsLinear, 0);
  objc_storeStrong((id *)&self->_inputGainMap, 0);
  objc_storeStrong((id *)&self->_inputBlurMap, 0);
  objc_storeStrong((id *)&self->_inputMatte, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
