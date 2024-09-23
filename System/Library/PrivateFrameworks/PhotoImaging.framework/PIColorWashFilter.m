@implementation PIColorWashFilter

+ (id)colorWashKernels
{
  if (colorWashKernels_onceToken != -1)
    dispatch_once(&colorWashKernels_onceToken, &__block_literal_global_12955);
  return (id)colorWashKernels_kernels;
}

+ (id)hueChromaColorWashKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ipt_hue_chroma_color_wash"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hueChromaFixedColorWashKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ipt_hue_chroma_color_wash_fixed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hueChromaVariableColorWashKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ipt_hue_chroma_color_wash_variable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)colorWashFixedKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("rgb_color_wash_fixed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)colorWashVariableKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("rgb_color_wash_variable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)colorWashFixedSmoothKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("rgb_color_wash_fixed_smooth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)colorWashVariableSmoothKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("rgb_color_wash_variable_smooth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0C9E1C0];
  v3 = *MEMORY[0x1E0C9DEB0];
  v4 = *MEMORY[0x1E0C9DE10];
  v12[0] = *MEMORY[0x1E0C9DE68];
  v2 = v12[0];
  v12[1] = v4;
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0C9DD80], "magentaColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("inputMode");
  v15[0] = v6;
  v10[0] = CFSTR("PIAttributeAvailableModes");
  v10[1] = v4;
  v11[0] = &unk_1E5058DE8;
  v11[1] = CFSTR("HueChroma");
  v10[2] = v2;
  v11[2] = CFSTR("PIAttributeTypeMode");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __37__PIColorWashFilter_colorWashKernels__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelsDictionaryWithString:", &cfstr_KernelVec4IptH);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)colorWashKernels_kernels;
  colorWashKernels_kernels = v0;

}

- (id)outputImage
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  _QWORD v51[2];
  uint64_t v52;
  void *v53;
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  -[PIColorWashFilter inputImage](self, "inputImage");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[PIColorWashFilter inputColor](self, "inputColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C9DD80], "magentaColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;

    -[PIColorWashFilter inputMode](self, "inputMode");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (__CFString *)v10;
    else
      v12 = CFSTR("HueChroma");
    v13 = v12;

    if (-[__CFString hasPrefix:](v13, "hasPrefix:", CFSTR("HueChroma")))
    {
      objc_msgSend(MEMORY[0x1E0D75170], "colorWithCGColor:", objc_msgSend(v9, "cgColor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imageByUnpremultiplyingAlpha");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PIIPTHueChromaFilter convertRGBImageToHueChroma:](PIIPTHueChromaFilter, "convertRGBImageToHueChroma:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("HueChromaFixed")))
      {
        objc_msgSend((id)objc_opt_class(), "hueChromaFixedColorWashKernel");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("HueChromaVariable"));
        v20 = (void *)objc_opt_class();
        if (v19)
          objc_msgSend(v20, "hueChromaVariableColorWashKernel");
        else
          objc_msgSend(v20, "hueChromaColorWashKernel");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      v18 = (void *)v17;
      objc_msgSend(v4, "extent");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v54[0] = v16;
      v30 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v14, "luma");
      v32 = v31;
      objc_msgSend(v14, "hue");
      v34 = v33 * 3.14159265 / 180.0;
      objc_msgSend(v14, "chroma");
      objc_msgSend(v30, "vectorWithX:Y:Z:", v32, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "applyWithExtent:arguments:", v37, v23, v25, v27, v29);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      +[PIIPTHueChromaFilter convertHueChromaImageToRGB:](PIIPTHueChromaFilter, "convertHueChromaImageToRGB:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "imageByPremultiplyingAlpha");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    }
    if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("MonoLight")))
    {
      objc_msgSend(v4, "imageByApplyingFilter:", CFSTR("CIPhotoEffectMono"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithColor:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = *MEMORY[0x1E0C9E190];
      v53 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageByApplyingFilter:withInputParameters:", CFSTR("CISoftLightBlendMode"), v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_30:
      return v8;
    }
    if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("RGBFixed")))
    {
      objc_msgSend((id)objc_opt_class(), "colorWashFixedKernel");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("RGBVariable")))
    {
      objc_msgSend((id)objc_opt_class(), "colorWashVariableKernel");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("RGBFixedSmooth")))
    {
      objc_msgSend((id)objc_opt_class(), "colorWashFixedSmoothKernel");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("RGBVariableSmooth")))
      {
        v14 = 0;
        goto LABEL_29;
      }
      objc_msgSend((id)objc_opt_class(), "colorWashVariableSmoothKernel");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v21;
LABEL_29:
    objc_msgSend(v4, "imageByUnpremultiplyingAlpha");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "extent");
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v51[0] = v40;
    v51[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "applyWithExtent:arguments:", v49, v42, v44, v46, v48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "imageByPremultiplyingAlpha");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v40;
    goto LABEL_30;
  }
  v8 = 0;
  return v8;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIColor)inputColor
{
  return self->_inputColor;
}

- (void)setInputColor:(id)a3
{
  objc_storeStrong((id *)&self->_inputColor, a3);
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_inputMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_inputColor, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
