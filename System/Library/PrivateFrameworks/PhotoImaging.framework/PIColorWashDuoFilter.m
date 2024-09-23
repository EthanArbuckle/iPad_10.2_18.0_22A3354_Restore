@implementation PIColorWashDuoFilter

+ (id)colorWashKernels
{
  return +[PIColorWashFilter colorWashKernels](PIColorWashFilter, "colorWashKernels");
}

+ (id)iptColorWashDuoKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ipt_color_wash_duo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)iptColorWashDuoFixedKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ipt_color_wash_duo_fixed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)iptColorWashDuoVariableKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ipt_color_wash_duo_variable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hueChromaColorWashDuoKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ipt_hue_chroma_color_wash_duo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hueChromaColorWashDuoFixedKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ipt_hue_chroma_color_wash_duo_fixed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hueChromaColorWashDuoVariableKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ipt_hue_chroma_color_wash_duo_variable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)rgbColorWashDuoKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("rgb_color_wash_duo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)rgbColorWashDuoFixedKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("rgb_color_wash_duo_fixed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)rgbColorWashDuoVariableKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorWashKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("rgb_color_wash_duo_variable"));
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
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("inputShadowColor");
  v3 = *MEMORY[0x1E0C9DEB0];
  v4 = *MEMORY[0x1E0C9DE10];
  v16[0] = *MEMORY[0x1E0C9DE68];
  v2 = v16[0];
  v16[1] = v4;
  v17[0] = v3;
  objc_msgSend(MEMORY[0x1E0C9DD80], "blueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  v18[1] = CFSTR("inputHighlightColor");
  v14[1] = v4;
  v15[0] = v3;
  v14[0] = v2;
  objc_msgSend(MEMORY[0x1E0C9DD80], "yellowColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = CFSTR("inputMode");
  v19[1] = v8;
  v12[0] = CFSTR("PIAttributeAvailableModes");
  v12[1] = v4;
  v13[0] = &unk_1E5058E00;
  v13[1] = CFSTR("IPT");
  v12[2] = v2;
  v13[2] = CFSTR("PIAttributeTypeMode");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v94;
  void *v95;
  void *v96;
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[5];

  v99[3] = *MEMORY[0x1E0C80C00];
  -[PIColorWashDuoFilter inputImage](self, "inputImage");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[PIColorWashDuoFilter inputShadowColor](self, "inputShadowColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C9DD80], "blueColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;

    -[PIColorWashDuoFilter inputHighlightColor](self, "inputHighlightColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C9DD80], "blueColor");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    -[PIColorWashDuoFilter inputMode](self, "inputMode");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (__CFString *)v14;
    else
      v16 = CFSTR("IPT");
    v17 = v16;

    if (-[__CFString hasPrefix:](v17, "hasPrefix:", CFSTR("IPT")))
    {
      v96 = v9;
      objc_msgSend(MEMORY[0x1E0D75170], "colorWithCGColor:", objc_msgSend(v9, "cgColor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D75170], "colorWithCGColor:", objc_msgSend(v13, "cgColor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imageByUnpremultiplyingAlpha");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PIIPTHueChromaFilter convertRGBImageToIPT:](PIIPTHueChromaFilter, "convertRGBImageToIPT:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v95 = v13;
      if (-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("IPTFixed")))
      {
        objc_msgSend((id)objc_opt_class(), "iptColorWashDuoFixedKernel");
        v22 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("IPTVariable"));
        v26 = (void *)objc_opt_class();
        if (v25)
          objc_msgSend(v26, "iptColorWashDuoVariableKernel");
        else
          objc_msgSend(v26, "iptColorWashDuoKernel");
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v30 = (void *)v22;
      objc_msgSend(v4, "extent");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v99[0] = v21;
      v39 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v18, "luma");
      v41 = v40;
      objc_msgSend(v18, "pt");
      v43 = v42;
      objc_msgSend(v18, "pt");
      objc_msgSend(v39, "vectorWithX:Y:Z:", v41, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v99[1] = v45;
      v46 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v19, "luma");
      v48 = v47;
      objc_msgSend(v19, "pt");
      v50 = v49;
      objc_msgSend(v19, "pt");
      objc_msgSend(v46, "vectorWithX:Y:Z:", v48, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v99[2] = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 3);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "applyWithExtent:arguments:", v53, v32, v34, v36, v38);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      +[PIIPTHueChromaFilter convertIPTImageToRGB:](PIIPTHueChromaFilter, "convertIPTImageToRGB:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "imageByPremultiplyingAlpha");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_35:
      v13 = v95;
      v9 = v96;
LABEL_40:

      return v8;
    }
    if (-[__CFString hasPrefix:](v17, "hasPrefix:", CFSTR("HueChroma")))
    {
      v96 = v9;
      objc_msgSend(MEMORY[0x1E0D75170], "colorWithCGColor:", objc_msgSend(v9, "cgColor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D75170], "colorWithCGColor:", objc_msgSend(v13, "cgColor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imageByUnpremultiplyingAlpha");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[PIIPTHueChromaFilter convertRGBImageToHueChroma:](PIIPTHueChromaFilter, "convertRGBImageToHueChroma:", v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("HueChromaFixed")))
      {
        objc_msgSend((id)objc_opt_class(), "hueChromaColorWashDuoFixedKernel");
        v24 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("HueChromaVariable"));
        v29 = (void *)objc_opt_class();
        if (v28)
          objc_msgSend(v29, "hueChromaColorWashDuoVariableKernel");
        else
          objc_msgSend(v29, "hueChromaColorWashDuoKernel");
        v24 = objc_claimAutoreleasedReturnValue();
      }
      v30 = (void *)v24;
      objc_msgSend(v18, "hue");
      v57 = v56;
      objc_msgSend(v19, "hue");
      v59 = v58;
      v60 = v58 - v57;
      v61 = 360.0;
      v62 = vabdd_f64(v59, v57);
      v95 = v13;
      if (fabs(v60 + 360.0) < v62 || (v61 = -360.0, fabs(v60 + -360.0) < v62))
        v59 = v59 + v61;
      objc_msgSend(v4, "extent");
      v94 = v63;
      v65 = v64;
      v67 = v66;
      v69 = v68;
      v98[0] = v21;
      v70 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v18, "luma");
      v72 = v71;
      objc_msgSend(v18, "chroma");
      objc_msgSend(v70, "vectorWithX:Y:Z:", v72, v57 * 3.14159265 / 180.0, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v98[1] = v74;
      v75 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v19, "luma");
      v77 = v76;
      objc_msgSend(v19, "chroma");
      objc_msgSend(v75, "vectorWithX:Y:Z:", v77, v59 * 3.14159265 / 180.0, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v98[2] = v79;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 3);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "applyWithExtent:arguments:", v80, v94, v65, v67, v69);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      +[PIIPTHueChromaFilter convertHueChromaImageToRGB:](PIIPTHueChromaFilter, "convertHueChromaImageToRGB:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "imageByPremultiplyingAlpha");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_35;
    }
    if (-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("RGB")))
    {
      objc_msgSend((id)objc_opt_class(), "rgbColorWashDuoKernel");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else if (-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("RGBFixed")))
    {
      objc_msgSend((id)objc_opt_class(), "rgbColorWashDuoFixedKernel");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("RGBVariable")))
      {
        v18 = 0;
        goto LABEL_39;
      }
      objc_msgSend((id)objc_opt_class(), "rgbColorWashDuoVariableKernel");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v27;
LABEL_39:
    objc_msgSend(v4, "imageByUnpremultiplyingAlpha");
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v83, "extent");
    v85 = v84;
    v87 = v86;
    v89 = v88;
    v91 = v90;
    v97[0] = v83;
    v97[1] = v9;
    v97[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 3);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "applyWithExtent:arguments:", v92, v85, v87, v89, v91);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "imageByPremultiplyingAlpha");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v83;
    goto LABEL_40;
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

- (CIColor)inputShadowColor
{
  return self->_inputShadowColor;
}

- (void)setInputShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_inputShadowColor, a3);
}

- (CIColor)inputHighlightColor
{
  return self->_inputHighlightColor;
}

- (void)setInputHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_inputHighlightColor, a3);
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
  objc_storeStrong((id *)&self->_inputHighlightColor, 0);
  objc_storeStrong((id *)&self->_inputShadowColor, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
