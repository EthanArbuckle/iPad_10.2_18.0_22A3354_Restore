@implementation SDOFHighlightRecovery

- (id)outputImage
{
  uint64_t v2;
  float v4;
  float v5;
  const char *v6;
  CIImage *v7;
  void *v8;
  NSNumber *inputIterations;
  NSData *inputDynamicParams;
  NSNumber *inputTileSize;
  MTLComputePipelineState *inputScanKernel;
  MTLComputePipelineState *inputDiffuseKernel;
  MTLComputePipelineState *inputCopyBackKernel;
  MTLComputePipelineState *inputCopyKernel;
  NSDictionary *inputConstants;
  void *v17;
  CIImage *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double width;
  double height;
  const char *v31;
  uint64_t v32;
  double v33;
  CGFloat v34;
  const char *v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  float v48;
  double v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  const char *v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  CGAffineTransform v78;
  CGAffineTransform v79;
  CGAffineTransform v80;
  _QWORD v81[2];
  _QWORD v82[8];
  _QWORD v83[9];
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v83[8] = *MEMORY[0x24BDAC8D0];
  if (!self->inputImage)
  {
    objc_msgSend_emptyImage(MEMORY[0x24BDBF660], a2, v2);
    v7 = (CIImage *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v4 = 1.0;
  if (!self->inputScale)
  {
    objc_msgSend_floatValue(0, a2, v2);
    v4 = v5;
  }
  if (roundf(v4 * (float)(int)objc_msgSend_intValue(self->inputIterations, a2, v2)) == 0.0)
  {
    v7 = self->inputImage;
LABEL_7:
    v8 = v7;
    return v8;
  }
  inputIterations = self->inputIterations;
  v82[0] = CFSTR("iterations");
  v82[1] = CFSTR("dynamicParams");
  inputDynamicParams = self->inputDynamicParams;
  v83[0] = inputIterations;
  v83[1] = inputDynamicParams;
  inputTileSize = self->inputTileSize;
  v82[2] = CFSTR("tileSize");
  v82[3] = CFSTR("scanKernel");
  inputScanKernel = self->inputScanKernel;
  v83[2] = inputTileSize;
  v83[3] = inputScanKernel;
  inputDiffuseKernel = self->inputDiffuseKernel;
  v82[4] = CFSTR("diffuseKernel");
  v82[5] = CFSTR("copyBackKernel");
  inputCopyBackKernel = self->inputCopyBackKernel;
  v83[4] = inputDiffuseKernel;
  v83[5] = inputCopyBackKernel;
  inputCopyKernel = self->inputCopyKernel;
  v82[6] = CFSTR("copyKernel");
  v82[7] = CFSTR("constants");
  inputConstants = self->inputConstants;
  v83[6] = inputCopyKernel;
  v83[7] = inputConstants;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v6, (uint64_t)v83, v82, 8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->inputImage;
  objc_msgSend_extent(v18, v19, v20);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  memset(&v80, 0, sizeof(v80));
  CGAffineTransformMakeScale(&v80, 1.0 / v4, 1.0 / v4);
  v79 = v80;
  v84.origin.x = v22;
  v84.origin.y = v24;
  v84.size.width = v26;
  v84.size.height = v28;
  v85 = CGRectApplyAffineTransform(v84, &v79);
  v86 = CGRectIntegral(v85);
  width = v86.size.width;
  height = v86.size.height;
  objc_msgSend_extent(v18, v31, v32, v86.origin.x, v86.origin.y);
  v34 = width / v33;
  objc_msgSend_extent(v18, v35, v36);
  CGAffineTransformMakeScale(&v79, v34, height / v37);
  v80 = v79;
  if (v4 != 1.0)
  {
    objc_msgSend_imageByClampingToExtent(v18, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = v80;
    objc_msgSend_imageByApplyingTransform_highQualityDownsample_(v40, v41, (uint64_t)&v79, 1);
    v18 = (CIImage *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v42, (uint64_t)v17);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v43, v44, (uint64_t)&unk_251C9D778, CFSTR("scale"));
    v45 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_floatValue(self->inputIterations, v46, v47);
    *(float *)&v49 = v48 / v4;
    objc_msgSend_numberWithFloat_(v45, v50, v51, v49);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v43, v53, (uint64_t)v52, CFSTR("iterations"));

    v17 = v43;
  }
  objc_msgSend_clearImage(MEMORY[0x24BDBF660], v38, v39);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByInsertingIntermediate_(v54, v55, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_extent(v18, v57, v58);
  v60 = v59;
  v62 = v61;
  v64 = v63;
  v66 = v65;
  v81[0] = v18;
  v81[1] = v56;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v67, (uint64_t)v81, 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_inputs_arguments_error_(HighlightRecoveryProcessor, v69, (uint64_t)v68, v17, 0, v60, v62, v64, v66);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != 1.0)
  {
    CGAffineTransformMakeScale(&v78, v4, v4);
    objc_msgSend_imageByApplyingTransform_highQualityDownsample_(v70, v73, (uint64_t)&v78, 1);
    v74 = objc_claimAutoreleasedReturnValue();

    v70 = (void *)v74;
  }
  objc_msgSend_extent(self->inputImage, v71, v72);
  objc_msgSend_imageByCroppingToRect_(v70, v75, v76);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputIterations
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputIterations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)inputTileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputTileSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSData)inputDynamicParams
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputDynamicParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (MTLComputePipelineState)inputScanKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputScanKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (MTLComputePipelineState)inputDiffuseKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInputDiffuseKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (MTLComputePipelineState)inputCopyBackKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInputCopyBackKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (MTLComputePipelineState)inputCopyKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInputCopyKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDictionary)inputConstants
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInputConstants:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputConstants, 0);
  objc_storeStrong((id *)&self->inputCopyKernel, 0);
  objc_storeStrong((id *)&self->inputCopyBackKernel, 0);
  objc_storeStrong((id *)&self->inputDiffuseKernel, 0);
  objc_storeStrong((id *)&self->inputScanKernel, 0);
  objc_storeStrong((id *)&self->inputDynamicParams, 0);
  objc_storeStrong((id *)&self->inputTileSize, 0);
  objc_storeStrong((id *)&self->inputIterations, 0);
  objc_storeStrong((id *)&self->inputScale, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
