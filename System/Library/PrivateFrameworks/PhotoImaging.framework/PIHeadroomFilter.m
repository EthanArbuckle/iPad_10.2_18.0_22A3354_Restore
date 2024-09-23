@implementation PIHeadroomFilter

- (id)outputImage
{
  void *v3;
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  CGColor *CopyWithAlpha;
  _BOOL4 v57;
  CGFloat v58;
  CGColor *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  double v63;
  CGColor *v64;
  CGColor *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  double v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  id v98;
  void *v99;
  void *v100;
  CGFloat alpha;
  void *alphaa;
  double v103;
  void *v104;
  double v105;
  void *v106;
  CGFloat v107;
  void *v108;
  double v109;
  void *v110;
  void *v111;
  uint64_t v112;
  CGAffineTransform v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD v116[5];
  _QWORD v117[5];
  _QWORD v118[2];
  _QWORD v119[4];

  v119[2] = *MEMORY[0x1E0C80C00];
  +[PIHeadroomSettings sharedInstance](PIHeadroomSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blurRadius");
  v5 = v4;
  objc_msgSend(v3, "blurMaskTopLocation");
  v7 = v6;
  objc_msgSend(v3, "falloffHeight");
  v9 = v8;
  objc_msgSend(v3, "gradientHeight");
  v11 = v10;
  objc_msgSend(v3, "gradientWhite");
  v90 = v12;
  objc_msgSend(v3, "highKeyGradientWhite");
  v89 = v13;
  objc_msgSend(v3, "bottomGradientAlpha");
  alpha = v14;
  objc_msgSend(v3, "bottomGradientTopLocation");
  v103 = v15;
  objc_msgSend(v3, "bottomGradientBottomLocation");
  v105 = v16;
  objc_msgSend(v3, "topGradientAlpha");
  v107 = v17;
  objc_msgSend(v3, "topGradientTopLocation");
  v109 = v18;
  objc_msgSend(v3, "topGradientBottomLocation");
  v20 = v19;
  v21 = objc_msgSend(v3, "useSoftLightBlendingModeForTopGradient");
  -[CIImage extent](self->_inputImage, "extent");
  v23 = v22;
  v24 = self->_extendedRect.size.height - v22;
  -[CIImage extent](self->_inputImage, "extent");
  v26 = v25;
  -[CIImage imageByCroppingToRect:](self->_inputImage, "imageByCroppingToRect:", 0.0, v27 - v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "imageByApplyingOrientation:", 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "extent");
  CGAffineTransformMakeTranslation(&v113, 0.0, v23 - v30);
  objc_msgSend(v29, "imageByApplyingTransform:", &v113);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "imageByCompositingOverImage:", self->_inputImage);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (self->_useBlur)
  {
    v91 = v20;
    v97 = v21;
    v99 = v31;
    v100 = v28;
    objc_msgSend(MEMORY[0x1E0D52068], "extendedSRGBColorSpace");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "CGColorSpace");

    objc_msgSend(v33, "imageByColorMatchingWorkingSpaceToColorSpace:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C9DDB8], "linearGradientFilter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v9 * v23;
    v39 = v23 - v9 * v23;
    objc_msgSend(v37, "setPoint0:", 0.0, v39);
    objc_msgSend(v37, "setPoint1:", 0.0, v23 + v24 * (1.0 - v7));
    objc_msgSend(MEMORY[0x1E0C9DD80], "clearColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setColor0:", v40);

    objc_msgSend(MEMORY[0x1E0C9DD80], "greenColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setColor1:", v41);

    v96 = v37;
    objc_msgSend(v37, "outputImage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v35;
    objc_msgSend(v42, "imageByColorMatchingWorkingSpaceToColorSpace:", v35);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = v24 + v38;
    v95 = v43;
    objc_msgSend(v43, "imageByCroppingToRect:", 0.0, v39, self->_extendedRect.size.width, v24 + v38);
    v45 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "imageByCroppingToRect:", 0.0, v39, self->_extendedRect.size.width, v24 + v38);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "imageByClampingToExtent");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = (void *)v45;
    v119[0] = v45;
    v48 = *MEMORY[0x1E0C9E258];
    v118[0] = CFSTR("inputMask");
    v118[1] = v48;
    v49 = (void *)MEMORY[0x1E0CB37E8];
    -[PIHeadroomFilter renderScale](self, "renderScale");
    objc_msgSend(v49, "numberWithDouble:", (v5 + v5) * v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v119[1] = v51;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v118, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMaskedVariableBlur"), v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v46;
    objc_msgSend(v46, "extent");
    objc_msgSend(v53, "imageByCroppingToRect:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v92 = v54;
    v98 = v36;
    objc_msgSend(v54, "imageByCompositingOverImage:", v36);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIHeadroomFilter primaryGradientColor](self, "primaryGradientColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)objc_msgSend(v55, "CGColor"), alpha);

    if (!CopyWithAlpha)
    {
      v57 = -[PIHeadroomFilter useHighKeyStyle](self, "useHighKeyStyle");
      v58 = v90;
      if (v57)
        v58 = v89;
      CopyWithAlpha = CGColorCreateGenericGrayGamma2_2(v58, 1.0);
    }
    v59 = CGColorCreateCopyWithAlpha(CopyWithAlpha, 0.0);
    objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithCGColor:", CopyWithAlpha);
    v60 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithCGColor:", v59);
    v61 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDB8], "linearGradientFilter");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v23 + v24;
    objc_msgSend(v62, "setPoint0:", 0.0, v63 + -(v103 * v44) * v11);
    objc_msgSend(v62, "setPoint1:", 0.0, v39 + v44 * (1.0 - v11 * v105));
    v106 = (void *)v60;
    objc_msgSend(v62, "setColor0:", v60);
    v104 = (void *)v61;
    objc_msgSend(v62, "setColor1:", v61);
    v64 = CGColorCreateCopyWithAlpha(CopyWithAlpha, v107);
    v65 = CGColorCreateCopyWithAlpha(v64, 0.0);
    objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithCGColor:", v64);
    v66 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithCGColor:", v65);
    v67 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDB8], "linearGradientFilter");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setPoint0:", 0.0, v63 + -(v109 * v44) * v11);
    objc_msgSend(v68, "setPoint1:", 0.0, v39 + v44 * (1.0 - v11 * v91));
    v110 = (void *)v66;
    objc_msgSend(v68, "setColor0:", v66);
    v108 = (void *)v67;
    objc_msgSend(v68, "setColor1:", v67);
    CGColorRelease(CopyWithAlpha);
    CGColorRelease(v59);
    CGColorRelease(v64);
    CGColorRelease(v65);
    objc_msgSend(v62, "outputImage");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "imageByCroppingToRect:", 0.0, v39, v26, v44);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "outputImage");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "imageByCroppingToRect:", 0.0, v39, v26, v44);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v70, "imageByColorMatchingWorkingSpaceToColorSpace:", v112);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v72, "imageByColorMatchingWorkingSpaceToColorSpace:", v112);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PIHeadroomFilter isInactive](self, "isInactive"))
    {
      v116[0] = CFSTR("inputRVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.406691223, 0.114257611, 0.0115343947, 0.0);
      alphaa = (void *)objc_claimAutoreleasedReturnValue();
      v117[0] = alphaa;
      v116[1] = CFSTR("inputGVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0339641571, 0.487021983, 0.0115343947, 0.0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v117[1] = v75;
      v116[2] = CFSTR("inputBVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0339641571, 0.114257611, 0.384298772, 0.0);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v117[2] = v76;
      v116[3] = CFSTR("inputAVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v117[3] = v77;
      v116[4] = CFSTR("inputBiasVector");
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v117[4] = v78;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 5);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v73, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v79);
      v80 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v74, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v79);
      v81 = objc_claimAutoreleasedReturnValue();

      v73 = (void *)v80;
      v74 = (void *)v81;
    }
    v31 = v99;
    v28 = v100;
    objc_msgSend(v73, "imageByCompositingOverImage:", v111);
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = (void *)v82;
    if (v97)
    {
      v114 = *MEMORY[0x1E0C9E190];
      v115 = v82;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "imageByApplyingFilter:withInputParameters:", CFSTR("CISoftLightBlendMode"), v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v74, "imageByCompositingOverImage:", v82);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v85, "imageByColorMatchingColorSpaceToWorkingSpace:", v112);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v86 = v98;
  }
  else
  {
    v86 = v32;
    v87 = v86;
  }

  return v87;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CGRect)extendedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_extendedRect.origin.x;
  y = self->_extendedRect.origin.y;
  width = self->_extendedRect.size.width;
  height = self->_extendedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setExtendedRect:(CGRect)a3
{
  self->_extendedRect = a3;
}

- (BOOL)useBlur
{
  return self->_useBlur;
}

- (void)setUseBlur:(BOOL)a3
{
  self->_useBlur = a3;
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (void)setIsInactive:(BOOL)a3
{
  self->_isInactive = a3;
}

- (BOOL)useHighKeyStyle
{
  return self->_useHighKeyStyle;
}

- (void)setUseHighKeyStyle:(BOOL)a3
{
  self->_useHighKeyStyle = a3;
}

- (PFParallaxColor)primaryGradientColor
{
  return self->_primaryGradientColor;
}

- (void)setPrimaryGradientColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryGradientColor, a3);
}

- (double)renderScale
{
  return self->_renderScale;
}

- (void)setRenderScale:(double)a3
{
  self->_renderScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryGradientColor, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
