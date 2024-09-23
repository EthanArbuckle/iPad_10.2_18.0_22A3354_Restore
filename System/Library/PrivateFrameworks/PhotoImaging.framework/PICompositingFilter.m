@implementation PICompositingFilter

+ (id)availableBlendModes
{
  if (availableBlendModes_onceToken != -1)
    dispatch_once(&availableBlendModes_onceToken, &__block_literal_global_16022);
  return (id)availableBlendModes_blendModes;
}

+ (id)blendKernelForBlendMode:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C9DD70], "valueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)customAttributes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[2];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  uint64_t v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v20[0] = *MEMORY[0x1E0C9DE30];
  v19 = *MEMORY[0x1E0C9DF10];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v2;
  v20[1] = *MEMORY[0x1E0C9E200];
  v3 = *MEMORY[0x1E0C9DE58];
  v14[0] = *MEMORY[0x1E0C9DE60];
  v14[1] = v3;
  v18[0] = &unk_1E5051FB8;
  v18[1] = &unk_1E5051FC8;
  v5 = *MEMORY[0x1E0C9DE40];
  v15 = *MEMORY[0x1E0C9DE10];
  v4 = v15;
  v16 = v5;
  v18[2] = &unk_1E5051FC8;
  v18[3] = &unk_1E5051FB8;
  v17 = *MEMORY[0x1E0C9DE68];
  v6 = v17;
  v18[4] = *MEMORY[0x1E0C9DED0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v14, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  v20[2] = CFSTR("inputBlendMode");
  v13[0] = CFSTR("PIAttributeTypeMode");
  objc_msgSend((id)objc_opt_class(), "availableBlendModes", v6, CFSTR("PIAttributeAvailableModes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  v13[1] = v8;
  v13[2] = CFSTR("sourceOver");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __42__PICompositingFilter_availableBlendModes__block_invoke()
{
  void *v0;

  v0 = (void *)availableBlendModes_blendModes;
  availableBlendModes_blendModes = (uint64_t)&unk_1E5058E30;

}

- (id)outputImage
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  -[PICompositingFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[PICompositingFilter inputBackgroundImage](self, "inputBackgroundImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {

    if (!v5)
    {
      -[PICompositingFilter inputImage](self, "inputImage");
      return (id)objc_claimAutoreleasedReturnValue();
    }
    -[PICompositingFilter inputBlendMode](self, "inputBlendMode");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("sourceOver");
    if (v6)
      v8 = (__CFString *)v6;
    v9 = v8;

    objc_msgSend((id)objc_opt_class(), "blendKernelForBlendMode:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositingFilter inputImage](self, "inputImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PICompositingFilter inputBackgroundImage](self, "inputBackgroundImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applyWithForeground:background:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      -[PICompositingFilter inputImage](self, "inputImage");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v15;

    if (v5)
    {
      -[PICompositingFilter inputIntensity](self, "inputIntensity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[PICompositingFilter inputBackgroundImage](self, "inputBackgroundImage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *MEMORY[0x1E0C9E270];
        v25[0] = v5;
        v20 = *MEMORY[0x1E0C9E278];
        v24[0] = v19;
        v24[1] = v20;
        -[PICompositingFilter inputIntensity](self, "inputIntensity");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "imageByApplyingFilter:withInputParameters:", CFSTR("CIDissolveTransition"), v22);
        v23 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v23;
      }
    }

  }
  return v5;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)inputBackgroundImage
{
  return self->_inputBackgroundImage;
}

- (void)setInputBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputBackgroundImage, a3);
}

- (NSNumber)inputIntensity
{
  return self->_inputIntensity;
}

- (void)setInputIntensity:(id)a3
{
  objc_storeStrong((id *)&self->_inputIntensity, a3);
}

- (NSString)inputBlendMode
{
  return self->_inputBlendMode;
}

- (void)setInputBlendMode:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlendMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBlendMode, 0);
  objc_storeStrong((id *)&self->_inputIntensity, 0);
  objc_storeStrong((id *)&self->_inputBackgroundImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
