@implementation GUBWBilateralConvolution

+ (id)BWBilateralKernels
{
  if (BWBilateralKernels_onceToken != -1)
    dispatch_once(&BWBilateralKernels_onceToken, &__block_literal_global_100);
  return (id)BWBilateralKernels_BWBilateralKernels;
}

+ (id)bilateralLoop2Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "BWBilateralKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bilateralLoop2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bilateralLoop5Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "BWBilateralKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bilateralLoop5"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bilateralLoop11Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "BWBilateralKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bilateralLoop11"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __46__GUBWBilateralConvolution_BWBilateralKernels__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelsDictionaryWithString:", &cfstr_KernelVec4Bila);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BWBilateralKernels_BWBilateralKernels;
  BWBilateralKernels_BWBilateralKernels = v0;

}

- (CGRect)bilateralROI:(int64_t)a3 destRect:(CGRect)a4 userInfo:(id)a5
{
  return CGRectInset(a4, -4.0, -4.0);
}

- (id)doBilateralLoop:(id)a3 points:(id)a4 weights:(id)a5 slope:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  double v22;
  void *v23;
  float v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  float v29;
  double v30;
  float v31;
  double v32;
  float v33;
  double v34;
  float v35;
  void *v36;
  void *v37;
  void *v38;
  float v39;
  double v40;
  void *v41;
  float v42;
  double v43;
  void *v44;
  float v45;
  double v46;
  void *v47;
  float v48;
  void *v49;
  void *v50;
  void *v51;
  float v52;
  double v53;
  void *v54;
  float v55;
  double v56;
  id v57;
  void *v58;
  void *v59;
  float v60;
  double v61;
  void *v62;
  float v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[5];
  _QWORD v75[4];
  _QWORD v76[3];
  _QWORD v77[5];

  v77[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(a4, "count");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "doubleValue");
  v16 = v15;

  objc_msgSend(v14, "numberWithDouble:", -v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __65__GUBWBilateralConvolution_doBilateralLoop_points_weights_slope___block_invoke;
  v74[3] = &unk_1E50166A0;
  v74[4] = self;
  v18 = (void *)MEMORY[0x1A85C0174](v74);
  switch(v13)
  {
    case 11:
      v75[0] = v10;
      v75[1] = v17;
      v73 = v17;
      v28 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v11, "objectAtIndex:", 0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "floatValue");
      v30 = v29;
      objc_msgSend(v11, "objectAtIndex:", 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "floatValue");
      v32 = v31;
      objc_msgSend(v11, "objectAtIndex:", 2);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "floatValue");
      v34 = v33;
      objc_msgSend(v11, "objectAtIndex:", 3);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "floatValue");
      objc_msgSend(v28, "vectorWithX:Y:Z:W:", v30, v32, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v75[2] = v36;
      v37 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v11, "objectAtIndex:", 5);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "floatValue");
      v40 = v39;
      objc_msgSend(v11, "objectAtIndex:", 6);
      v72 = v18;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "floatValue");
      v43 = v42;
      objc_msgSend(v11, "objectAtIndex:", 7);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "floatValue");
      v46 = v45;
      objc_msgSend(v11, "objectAtIndex:", 9);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "floatValue");
      objc_msgSend(v37, "vectorWithX:Y:Z:W:", v40, v43, v46, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v75[3] = v49;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v73;
      v18 = v72;

      objc_msgSend((id)objc_opt_class(), "bilateralLoop11Kernel");
      v27 = objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      v76[0] = v10;
      v76[1] = v17;
      v50 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v11, "objectAtIndex:", 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "floatValue");
      v53 = v52;
      objc_msgSend(v11, "objectAtIndex:", 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "floatValue");
      v56 = v55;
      objc_msgSend(v11, "objectAtIndex:", 2);
      v57 = v10;
      v58 = v18;
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "floatValue");
      v61 = v60;
      objc_msgSend(v11, "objectAtIndex:", 3);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "floatValue");
      objc_msgSend(v50, "vectorWithX:Y:Z:W:", v53, v56, v61, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v76[2] = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v58;
      v10 = v57;

      objc_msgSend((id)objc_opt_class(), "bilateralLoop5Kernel");
      v27 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      v77[0] = v10;
      v77[1] = v17;
      v19 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v11, "objectAtIndex:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v21;
      objc_msgSend(v11, "objectAtIndex:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      objc_msgSend(v19, "vectorWithX:Y:", v22, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v77[2] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "bilateralLoop2Kernel");
      v27 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v26 = 0;
      v66 = 0;
      goto LABEL_9;
  }
  v65 = (void *)v27;
  objc_msgSend(v10, "extent");
  objc_msgSend(v65, "applyWithExtent:roiCallback:arguments:", v18, v26);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v66;
}

- (id)outputImage
{
  NSUInteger v3;
  NSUInteger v4;
  BOOL v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;

  v3 = -[NSArray count](self->_inputPoints, "count");
  v4 = -[NSArray count](self->_inputWeights, "count");
  if (v3)
    v5 = v4 == v3;
  else
    v5 = 0;
  if (v5)
  {
    -[NSNumber floatValue](self->_inputEdgeDetail, "floatValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", __exp10(v7 + -3.0) * -200.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:", self->_inputImage);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GUBWBilateralConvolution doBilateralLoop:points:weights:slope:](self, "doBilateralLoop:points:weights:slope:", v9, self->_inputPoints, self->_inputWeights, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)inputPoints
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputPoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSArray)inputWeights
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputWeights:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)inputEdgeDetail
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputEdgeDetail:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)inputBorder
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputBorder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBorder, 0);
  objc_storeStrong((id *)&self->_inputEdgeDetail, 0);
  objc_storeStrong((id *)&self->_inputWeights, 0);
  objc_storeStrong((id *)&self->_inputPoints, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

uint64_t __65__GUBWBilateralConvolution_doBilateralLoop_points_weights_slope___block_invoke(uint64_t a1, int a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "bilateralROI:destRect:userInfo:", a2, 0);
}

@end
