@implementation PXGPolarBlurKernel

- (PXGPolarBlurKernel)init
{
  PXGPolarBlurKernel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGPolarBlurKernel;
  result = -[PXGPolarBlurKernel init](&v3, sel_init);
  if (result)
  {
    result->_scaleFactor = 1.0;
    result->_rotationAngle = 0.0;
  }
  return result;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = fmin(fmax(a3, 0.1), 10.0);
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = fmin(fmax(a3, -6.28318531), 6.28318531);
}

- (BOOL)_encodePolarBlur:(int)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 params:(const void *)a6 length:(unint64_t)a7 commandBuffer:(id)a8
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int16 v33;

  v10 = *(_QWORD *)&a3;
  v11 = a4;
  v12 = a5;
  v13 = a8;
  v33 = v10;
  v14 = objc_alloc_init(MEMORY[0x24BDDD5A0]);
  objc_msgSend(v14, "setConstantValue:type:atIndex:", &v33, 41, 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@(%d)"), CFSTR("pxg::polar_blur"), v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXGKernel pipelineStateForFunctionWithName:constants:key:device:](PXGKernel, "pipelineStateForFunctionWithName:constants:key:device:", CFSTR("pxg::polar_blur"), v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v11;
  if (v17)
  {
    objc_msgSend(v13, "computeCommandEncoder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pushDebugGroup:", CFSTR("pxg::polar_blur"));
    objc_msgSend(v19, "setComputePipelineState:", v17);
    objc_msgSend(v19, "setTexture:atIndex:", v11, 0);
    objc_msgSend(v19, "setTexture:atIndex:", v12, 1);
    objc_msgSend(v19, "setBytes:length:atIndex:", a6, a7, 0);
    v20 = objc_msgSend(v12, "width");
    v21 = objc_msgSend(v12, "height");
    v31 = 0uLL;
    v32 = 0;
    *(_QWORD *)&v29 = v20;
    *((_QWORD *)&v29 + 1) = v21;
    v30 = 1;
    +[PXGKernel groupSizeForImageSize:pipelineState:](PXGKernel, "groupSizeForImageSize:pipelineState:", &v29, v17);
    v29 = 0uLL;
    v30 = 0;
    v27 = v31;
    v28 = v32;
    *(_QWORD *)&v25 = v20;
    *((_QWORD *)&v25 + 1) = v21;
    v26 = 1;
    +[PXGKernel gridSizeForThreadGroupSize:imageSize:](PXGKernel, "gridSizeForThreadGroupSize:imageSize:", &v27, &v25);
    v27 = v29;
    v28 = v30;
    v25 = v31;
    v26 = v32;
    objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", &v27, &v25);
    objc_msgSend(v19, "popDebugGroup");
    objc_msgSend(v19, "endEncoding");

  }
  return v17 != 0;
}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 targetScale:(double)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  float v16;
  double v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  char *v25;
  float v26;
  double v27;
  long double v28;
  double v29;
  double v30;
  double v31;
  long double v32;
  double v33;
  long double v34;
  int v35;
  __double2 v36;
  void *v37;
  int32x4_t v38;
  __int32 v39;
  int32x4_t v40;
  uint64_t *v47;
  id v48;
  void *v49;
  id v50;
  uint64_t *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64x2_t v56;
  __double2 v57;
  int32x4_t v58;
  __int32 v59;
  int32x4_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64x2_t v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  float64x2_t v72;
  float64x2_t v73;
  int8x16_t v74;
  int8x16_t v75;
  double *v76;
  _OWORD v77[3];
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  v78 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v69 = a5;
  v11 = objc_msgSend(v10, "width");
  v12 = objc_msgSend(v10, "height");
  v13 = (unint64_t)objc_msgSend(v10, "width") >> 1;
  v68 = v10;
  v14 = objc_msgSend(v10, "height");
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, v13, v14 >> 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setStorageMode:", 2);
  objc_msgSend(v15, "setUsage:", 3);
  v16 = sqrt((double)(unint64_t)(v11 * v11 + v12 * v12)) * 0.5;
  v17 = log(fmax(self->_scaleFactor, 1.0 / self->_scaleFactor));
  v18 = v17 / log((float)(2.0 / v16) + 1.0);
  v76 = (double *)self;
  v19 = self->_rotationAngle * v16 * 0.5;
  if (v19 >= v18)
    v18 = self->_rotationAngle * v16 * 0.5;
  v20 = fminf(fmaxf(v18, 1.0), 81.0);
  LODWORD(a5) = vcvtps_s32_f32(logf(fmaxf(v20, 3.0)) / 2.1972);
  if ((int)a5 <= 0)
    __assert_rtn("-[PXGPolarBlurKernel encodeToCommandBuffer:sourceTexture:destinationTexture:targetScale:]", "PXGPolarBlurKernel.m", 151, "n > 0");
  v67 = v15;
  if ((_DWORD)a5 == 1)
  {
    v22 = v9;
    v70 = 0;
    v23 = &v80;
LABEL_9:
    *(v23 - 32) = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDDE4F8], "temporaryImageWithCommandBuffer:textureDescriptor:", v9, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v21;
  if (a5 < 3)
  {
    v22 = v9;
    v23 = &v79;
    goto LABEL_9;
  }
  v22 = v9;
  objc_msgSend(MEMORY[0x24BDDE4F8], "temporaryImageWithCommandBuffer:textureDescriptor:", v9, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v21;
LABEL_10:
  v66 = (uint64_t)&v66;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v66 - v24;
  v26 = factorize((__int16)a5, 9, (uint64_t *)((char *)&v66 - v24), v20);
  v27 = v76[2];
  v28 = -0.5 / (double)(int)a5;
  v29 = v28 * v27;
  v30 = v26;
  v31 = v27 / v26;
  v32 = v76[1];
  v33 = pow(v32, v28);
  v34 = pow(v32, 1.0 / v30);
  v35 = a5 & 1;
  v36 = __sincos_stret(v29);
  v37 = 0;
  *(float *)v38.i32 = v33 * v36.__cosval;
  *(float *)&v39 = v33 * v36.__sinval;
  *(float *)v40.i32 = -*(float *)&v39;
  v40.i32[1] = v38.i32[0];
  v38.i32[1] = v39;
  v75 = (int8x16_t)vzip1q_s32(v38, v40);
  __asm { FMOV            V0.2D, #0.5 }
  v73 = _Q0;
  v74 = vextq_s8(v75, v75, 8uLL);
  __asm { FMOV            V0.2D, #1.0 }
  v72 = _Q0;
  do
  {
    if (v37)
    {
      if ((v37 & 1) == v35)
        v47 = &v79;
      else
        v47 = &v80;
      objc_msgSend((id)*(v47 - 32), "texture");
      v48 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = v68;
    }
    v49 = v48;
    if ((void *)((_DWORD)a5 - 1) == v37)
    {
      v50 = v69;
    }
    else
    {
      if ((v37 & 1) == v35)
        v51 = &v80;
      else
        v51 = &v79;
      objc_msgSend((id)*(v51 - 32), "texture");
      v50 = (id)objc_claimAutoreleasedReturnValue();
    }
    v52 = v50;
    v53 = *(__int16 *)&v25[2 * (_QWORD)v37];
    memset(v77, 0, sizeof(v77));
    v54 = objc_msgSend(v50, "width");
    v55 = objc_msgSend(v52, "height");
    v56.i64[0] = v54;
    v56.i64[1] = v55;
    *(float32x2_t *)&v77[0] = vcvt_f32_f64(vmulq_f64(vcvtq_f64_u64(v56), v73));
    *((_QWORD *)&v77[0] + 1) = v75.i64[0];
    *(_QWORD *)&v77[1] = v74.i64[0];
    v57 = __sincos_stret(v31);
    *(float *)v58.i32 = v34 * v57.__cosval;
    *(float *)&v59 = v34 * v57.__sinval;
    *(float *)v60.i32 = -*(float *)&v59;
    v60.i32[1] = v58.i32[0];
    v58.i32[1] = v59;
    *(int32x4_t *)((char *)&v77[1] + 8) = vzip1q_s32(v58, v60);
    v61 = objc_msgSend(v52, "width");
    v62 = objc_msgSend(v52, "height");
    v63.i64[0] = v61;
    v63.i64[1] = v62;
    *((float32x2_t *)&v77[2] + 1) = vcvt_f32_f64(vdivq_f64(v72, vcvtq_f64_u64(v63)));
    v34 = pow(v34, (double)(int)v53);
    v31 = v31 * (double)(int)v53;
    objc_msgSend(v76, "_encodePolarBlur:sourceTexture:destinationTexture:params:length:commandBuffer:", v53, v49, v52, v77, 48, v22);

    v37 = (char *)v37 + 1;
  }
  while (a5 != v37);
  v64 = v71;
  objc_msgSend(v71, "setReadCount:", 0);
  v65 = v70;
  objc_msgSend(v70, "setReadCount:", 0);

}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

@end
