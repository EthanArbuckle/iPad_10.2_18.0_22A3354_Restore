@implementation UniScaleImage

- (UniScaleImage)initWithDevice:(id)a3
{
  id v4;
  UniScaleImage *v5;
  const char *v6;
  UniScaleImage *v7;
  const char *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UniScaleImage;
  v5 = -[UniKernel init](&v10, sel_init);
  v7 = v5;
  if (v5)
  {
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);
    objc_msgSend__loadShaders_(v7, v8, (uint64_t)v4);
  }

  return v7;
}

- (id)run:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v64;
  int64x2_t v65;
  uint64_t v66;
  _QWORD v67[3];
  _QWORD v68[3];

  v68[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_inputs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v7, v8, *MEMORY[0x24BDBF960]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v12, v13, *MEMORY[0x24BDBF9C8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__mtlTextureForImage_(UniKernel, v15, (uint64_t)v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mtlTextureForImage_(UniKernel, v17, (uint64_t)v14);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    sub_24B6F2AF4();
  v21 = (void *)v18;
  if (!v18)
    sub_24B6F2B1C();
  objc_msgSend_device(v16, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v22;
  if (v4)
    v25 = v4;
  else
    v25 = (id)objc_msgSend_newCommandQueue(v22, v23, v24);
  v28 = v25;
  objc_msgSend_commandBuffer(v25, v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_opt_class();
  objc_msgSend_description(v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v29, v34, (uint64_t)v33);

  if (self->_downsampleRGBA)
  {
    v37 = objc_msgSend_width(v16, v35, v36);
    if (v37 == objc_msgSend_width(v21, v38, v39)
      && (v42 = objc_msgSend_height(v16, v40, v41), v42 == objc_msgSend_height(v21, v43, v44)))
    {
      objc_msgSend_blitCommandEncoder(v29, v40, v41);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_copyFromTexture_toTexture_(v45, v46, (uint64_t)v16, v21);
      objc_msgSend_endEncoding(v45, v47, v48);

    }
    else
    {
      objc_msgSend_computeCommandEncoder(v29, v40, v41);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setComputePipelineState_(v50, v51, (uint64_t)self->_downsampleRGBA);
      objc_msgSend_setTexture_atIndex_(v50, v52, (uint64_t)v16, 0);
      objc_msgSend_setTexture_atIndex_(v50, v53, (uint64_t)v21, 1);
      v67[0] = (unint64_t)(objc_msgSend_width(v21, v54, v55) + 15) >> 4;
      v67[1] = (unint64_t)(objc_msgSend_height(v21, v56, v57) + 15) >> 4;
      v67[2] = 1;
      v65 = vdupq_n_s64(0x10uLL);
      v66 = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v50, v58, (uint64_t)v67, &v65);
      objc_msgSend_endEncoding(v50, v59, v60);

    }
    v61 = v64;
    v68[0] = v29;
    v68[1] = v21;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v49, (uint64_t)v68, 2);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v62 = 0;
    v61 = v64;
  }

  return v62;
}

- (CGRect)extentForImage
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
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
  double v21;
  double v22;
  CGRect result;

  objc_msgSend_inputs(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v5, *MEMORY[0x24BDBF9C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__ciImageForInput_(self, v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_extent(v8, v9, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)outputImage:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  double v19;
  CGFloat v20;
  const char *v21;
  uint64_t v22;
  CGFloat v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  UniImage *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  CGAffineTransform v39;
  CGAffineTransform v40;

  v3 = (void *)objc_msgSend_copy(self, a2, (uint64_t)a3);
  objc_msgSend_inputs(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v7, *MEMORY[0x24BDBF960]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__ciImageForInput_(v3, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputs(v3, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v13, v14, *MEMORY[0x24BDBF988]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v10;
  if (!v18)
  {
    v25 = 0;
    goto LABEL_9;
  }
  memset(&v40, 0, sizeof(v40));
  objc_msgSend_X(v15, v16, v17);
  v20 = v19;
  objc_msgSend_Y(v15, v21, v22);
  CGAffineTransformMakeScale(&v40, v20, v23);
  v39 = v40;
  if (CGAffineTransformIsIdentity(&v39))
  {
    v25 = v18;
    objc_msgSend_imageWithCIImage_(UniImage, v24, (uint64_t)v18);
    goto LABEL_7;
  }
  v39 = v40;
  objc_msgSend_imageByApplyingTransform_highQualityDownsample_(v18, v24, (uint64_t)&v39, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
LABEL_9:
    v32 = [UniImage alloc];
    v29 = (void *)objc_msgSend_initWithKernel_(v32, v33, (uint64_t)v3);
    goto LABEL_10;
  }
  objc_msgSend_imageWithCIImage_(UniImage, v26, (uint64_t)v25);
LABEL_7:
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
    goto LABEL_9;
  v29 = v27;
  objc_msgSend_setKernel_(v27, v28, (uint64_t)v3);
LABEL_10:
  objc_msgSend_inputs(v3, v30, v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v34, v35, *MEMORY[0x24BDBF9C8]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_(v29, v37, (uint64_t)v36);

  return v29;
}

- (id)inputNameArray
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDBF960];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)outputNameArray
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDBF9C8];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)_loadShaders:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  int v29;
  void *v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  MTLComputePipelineState *downsampleRGBA;
  MTLComputePipelineState *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  id v43;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = objc_opt_class();
  objc_msgSend_bundleForClass_(v5, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v8)
  {
    objc_msgSend_pathForResource_ofType_(v8, v9, (uint64_t)CFSTR("default"), CFSTR("metallib"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v13 = (void *)objc_msgSend_newLibraryWithFile_error_(v4, v12, (uint64_t)v11, &v43);
    v14 = v43;
    objc_msgSend_resourcePath(v10, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend__identifyGPU_(self, v18, (uint64_t)v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)v17;
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v20, (uint64_t)CFSTR("%@/%@"), v17, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v14;
    v23 = (void *)objc_msgSend_newPipelineLibraryWithFilePath_error_(v4, v22, (uint64_t)v21, &v42);
    v24 = v42;

    if (v13)
    {
      v26 = objc_msgSend_newFunctionWithName_(v13, v25, (uint64_t)CFSTR("bilinearResampling"));
      if (!v26)
      {
        uni_logger_api();
        v27 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
          sub_24B6F2BFC(v13, v27, v28);

        __assert_rtn("-[UniScaleImage _loadShaders:]", "UniScaleImage.m", 162, "function");
      }
      v30 = (void *)v26;
      v39 = v11;
      v31 = (void *)objc_opt_new();
      objc_msgSend_setPipelineLibrary_(v31, v32, (uint64_t)v23);
      objc_msgSend_setComputeFunction_(v31, v33, (uint64_t)v30);
      v41 = v24;
      v37 = (MTLComputePipelineState *)objc_msgSend_newComputePipelineStateWithDescriptor_error_(v4, v34, (uint64_t)v31, &v41);
      v38 = v41;

      downsampleRGBA = self->_downsampleRGBA;
      self->_downsampleRGBA = v37;

      v11 = v39;
      v29 = 0;
      v24 = v38;
    }
    else
    {
      v29 = -1;
    }

  }
  else
  {
    uni_logger_api();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_24B6F2B44();
    v29 = -1;
  }

  return v29;
}

- (id)_identifyGPU:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  char v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  __CFString *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  char v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  char v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;

  v3 = a3;
  objc_msgSend_name(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_containsString_(v6, v7, (uint64_t)CFSTR("Apple")))
  {
    v15 = &stru_251C92910;
LABEL_14:

    goto LABEL_15;
  }
  NSSelectorFromString(CFSTR("architecture"));
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend_architecture(v3, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v6, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, (uint64_t)CFSTR("applegpu_"), &stru_251C92910);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_revision(v6, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_containsString_(v18, v19, (uint64_t)CFSTR("A")) & 1) != 0)
    {
      v21 = 0;
    }
    else if (objc_msgSend_containsString_(v15, v20, (uint64_t)CFSTR("g16p")))
    {
      objc_msgSend_revision(v6, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_containsString_(v24, v25, (uint64_t)CFSTR("B0")) ^ 1;

    }
    else
    {
      v21 = 1;
    }

    v27 = objc_msgSend_containsString_(v15, v26, (uint64_t)CFSTR("g17p"));
    if ((v21 & 1) == 0 && (v27 & 1) == 0)
    {
      v30 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_revision(v6, v28, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lowercaseString(v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v30, v35, (uint64_t)CFSTR("%@_%@"), v15, v34);
      v36 = objc_claimAutoreleasedReturnValue();

      v15 = (__CFString *)v36;
    }

    goto LABEL_14;
  }
  v15 = &stru_251C92910;
LABEL_15:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downsampleRGBA, 0);
}

@end
