@implementation _MRCMetalHybridBinarizer

- (_MRCMetalHybridBinarizer)init
{
  _MRCMetalHybridBinarizer *result;

  result = (_MRCMetalHybridBinarizer *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (_MRCMetalHybridBinarizer)initWithMetalContext:(id)a3 error:(id *)a4
{
  id v6;
  _MRCMetalHybridBinarizer *v7;
  _MRCMetalContext *v8;
  _MRCMetalContext *v9;
  const char *v10;
  _MRCMetalContext *metalContext;
  const char *v12;
  _MRCMetalContext *v13;
  uint64_t v14;
  MTLComputePipelineState *calcuateBlackPointsPipelineState;
  const char *v16;
  uint64_t v17;
  MTLComputePipelineState *fixBlackPointsPipelineState;
  const char *v19;
  uint64_t v20;
  MTLComputePipelineState *thresholdPipelineState;
  _MRCMetalHybridBinarizer *v22;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_MRCMetalHybridBinarizer;
  v7 = -[_MRCMetalHybridBinarizer init](&v24, sel_init);
  if (!v7)
    goto LABEL_9;
  if (v6)
  {
    v8 = (_MRCMetalContext *)v6;
  }
  else
  {
    v9 = [_MRCMetalContext alloc];
    v8 = (_MRCMetalContext *)objc_msgSend_initWithDevice_libraryURL_error_(v9, v10, 0, 0, a4);
  }
  metalContext = v7->_metalContext;
  v7->_metalContext = v8;

  v13 = v7->_metalContext;
  if (!v13)
    goto LABEL_10;
  v14 = objc_msgSend_newComputePipelineStateWithFunctionName_constantValues_error_(v13, v12, (uint64_t)CFSTR("_MRCMetalHybridBinarizer_calculateBlackPoints"), 0, a4);
  calcuateBlackPointsPipelineState = v7->_calcuateBlackPointsPipelineState;
  v7->_calcuateBlackPointsPipelineState = (MTLComputePipelineState *)v14;

  if (!v7->_calcuateBlackPointsPipelineState)
    goto LABEL_10;
  v17 = objc_msgSend_newComputePipelineStateWithFunctionName_constantValues_error_(v7->_metalContext, v16, (uint64_t)CFSTR("_MRCMetalHybridBinarizer_fixBlackPoints"), 0, a4);
  fixBlackPointsPipelineState = v7->_fixBlackPointsPipelineState;
  v7->_fixBlackPointsPipelineState = (MTLComputePipelineState *)v17;

  if (!v7->_fixBlackPointsPipelineState)
    goto LABEL_10;
  v20 = objc_msgSend_newComputePipelineStateWithFunctionName_constantValues_error_(v7->_metalContext, v19, (uint64_t)CFSTR("_MRCMetalHybridBinarizer_threshold"), 0, a4);
  thresholdPipelineState = v7->_thresholdPipelineState;
  v7->_thresholdPipelineState = (MTLComputePipelineState *)v20;

  if (v7->_thresholdPipelineState)
LABEL_9:
    v22 = v7;
  else
LABEL_10:
    v22 = 0;

  return v22;
}

- (id)newTextureByBinarizingPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  OSType PixelFormatType;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t v9;
  IOSurfaceRef IOSurface;
  const char *v11;
  const char *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  unint64_t v51;
  const char *v52;
  uint64_t v53;
  unint64_t v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  unint64_t v67;
  const char *v68;
  uint64_t v69;
  unint64_t v70;
  const char *v71;
  uint64_t v72;
  unint64_t v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  unint64_t v86;
  const char *v87;
  uint64_t v88;
  unint64_t v89;
  const char *v90;
  uint64_t v91;
  unint64_t v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  NSObject *v105;
  const char *v106;
  uint64_t v107;
  id v108;
  double v110;
  double v111;
  const char *v112;
  uint64_t v113;
  double v114;
  unint64_t v115;
  unint64_t v116;
  void *v117;
  unint64_t v118;
  unint64_t v119;
  void *v120;
  unint64_t v121;
  unint64_t v122;
  uint64_t v123;
  __int128 buf;
  uint64_t v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType != 875704422 && PixelFormatType != 1278226488 && PixelFormatType != 875704438)
    return 0;
  if (CVPixelBufferIsPlanar(a3))
  {
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  }
  else
  {
    WidthOfPlane = CVPixelBufferGetWidth(a3);
    HeightOfPlane = CVPixelBufferGetHeight(a3);
  }
  v9 = HeightOfPlane;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (!IOSurface)
    return 0;
  v13 = (void *)objc_msgSend_newTextureByBindingIOSurface_pixelFormat_width_height_usage_plane_error_(self->_metalContext, v11, (uint64_t)IOSurface, 13, WidthOfPlane, v9, 1, 0, 0);
  if (v13)
  {
    v14 = (WidthOfPlane + 7) >> 3;
    v15 = (v9 + 7) >> 3;
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E0CC6BB0], v12, 13, v14, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
    if (v16)
    {
      objc_msgSend_setUsage_(v16, v17, 3);
      objc_msgSend_device(self->_metalContext, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend_newTextureWithDescriptor_(v21, v22, (uint64_t)v18);

      if (v23)
      {
        objc_msgSend_device(self->_metalContext, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend_newTextureWithDescriptor_(v26, v27, (uint64_t)v18);

        if (v28)
        {
          objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E0CC6BB0], v29, 13, v14, v9, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v30;
          if (v30)
          {
            objc_msgSend_setUsage_(v30, v31, 2);
            objc_msgSend_device(self->_metalContext, v33, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)objc_msgSend_newTextureWithDescriptor_(v35, v36, (uint64_t)v32);

            if (v37)
            {
              objc_msgSend_beginCommandBuffer(self->_metalContext, v38, v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v40;
              if (v40)
              {
                objc_msgSend_computeCommandEncoder(v40, v41, v42);
                v44 = objc_claimAutoreleasedReturnValue();
                v47 = v43;
                if (v44)
                {
                  v48 = (void *)v44;
                  v117 = v37;
                  v120 = v47;
                  v118 = objc_msgSend_threadExecutionWidth(self->_calcuateBlackPointsPipelineState, v45, v46);
                  v51 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_calcuateBlackPointsPipelineState, v49, v50);
                  v54 = v51 / objc_msgSend_threadExecutionWidth(self->_calcuateBlackPointsPipelineState, v52, v53);
                  v115 = v15 - 1;
                  objc_msgSend_setComputePipelineState_(v48, v55, (uint64_t)self->_calcuateBlackPointsPipelineState);
                  objc_msgSend_setTexture_atIndex_(v48, v56, (uint64_t)v13, 0);
                  objc_msgSend_setTexture_atIndex_(v48, v57, (uint64_t)v23, 1);
                  *(_QWORD *)&buf = (v14 - 1 + v118) / v118;
                  *((_QWORD *)&buf + 1) = (v15 - 1 + v54) / v54;
                  v125 = 1;
                  v121 = v118;
                  v122 = v54;
                  v123 = 1;
                  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v48, v58, (uint64_t)&buf, &v121);
                  objc_msgSend_endEncoding(v48, v59, v60);

                  objc_msgSend_computeCommandEncoder(v120, v61, v62);
                  v63 = objc_claimAutoreleasedReturnValue();
                  if (v63)
                  {
                    v66 = (void *)v63;
                    v67 = objc_msgSend_threadExecutionWidth(self->_fixBlackPointsPipelineState, v64, v65);
                    v70 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_fixBlackPointsPipelineState, v68, v69);
                    v73 = v70 / objc_msgSend_threadExecutionWidth(self->_fixBlackPointsPipelineState, v71, v72);
                    objc_msgSend_setComputePipelineState_(v66, v74, (uint64_t)self->_fixBlackPointsPipelineState);
                    objc_msgSend_setTexture_atIndex_(v66, v75, (uint64_t)v23, 0);
                    objc_msgSend_setTexture_atIndex_(v66, v76, (uint64_t)v28, 1);
                    *(_QWORD *)&buf = (v14 - 1 + v67) / v67;
                    *((_QWORD *)&buf + 1) = (v115 + v73) / v73;
                    v125 = 1;
                    v121 = v67;
                    v122 = v73;
                    v123 = 1;
                    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v66, v77, (uint64_t)&buf, &v121);
                    objc_msgSend_endEncoding(v66, v78, v79);

                    v43 = v120;
                    objc_msgSend_computeCommandEncoder(v120, v80, v81);
                    v82 = objc_claimAutoreleasedReturnValue();
                    if (v82)
                    {
                      v85 = (void *)v82;
                      v86 = objc_msgSend_threadExecutionWidth(self->_thresholdPipelineState, v83, v84);
                      v89 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_thresholdPipelineState, v87, v88);
                      v92 = v89 / objc_msgSend_threadExecutionWidth(self->_thresholdPipelineState, v90, v91);
                      v119 = (v86 + objc_msgSend_width(v117, v93, v94) - 1) / v86;
                      v116 = (v92 + objc_msgSend_height(v117, v95, v96) - 1) / v92;
                      objc_msgSend_setComputePipelineState_(v85, v97, (uint64_t)self->_thresholdPipelineState);
                      objc_msgSend_setTexture_atIndex_(v85, v98, (uint64_t)v13, 0);
                      objc_msgSend_setTexture_atIndex_(v85, v99, (uint64_t)v28, 1);
                      objc_msgSend_setTexture_atIndex_(v85, v100, (uint64_t)v117, 2);
                      *(_QWORD *)&buf = v119;
                      *((_QWORD *)&buf + 1) = v116;
                      v125 = 1;
                      v121 = v86;
                      v122 = v92;
                      v123 = 1;
                      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v85, v101, (uint64_t)&buf, &v121);
                      objc_msgSend_endEncoding(v85, v102, v103);

                      objc_msgSend_commitCommandBufferShouldWaitUntilCompleted_(self->_metalContext, v104, 1);
                      if (qword_1EFE31840 != -1)
                        dispatch_once(&qword_1EFE31840, &unk_1E95B3428);
                      v105 = (id)qword_1EFE31838;
                      v37 = v117;
                      v43 = v120;
                      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
                      {
                        objc_msgSend_GPUEndTime(v120, v106, v107);
                        v111 = v110;
                        objc_msgSend_GPUStartTime(v120, v112, v113);
                        LODWORD(buf) = 134349056;
                        *(double *)((char *)&buf + 4) = v111 - v114;
                        _os_log_debug_impl(&dword_1D3D6B000, v105, OS_LOG_TYPE_DEBUG, "elapsedTime: %{public}.6f", (uint8_t *)&buf, 0xCu);
                      }

                      v108 = v117;
                    }
                    else
                    {
                      v108 = 0;
                      v37 = v117;
                    }
                  }
                  else
                  {
                    v108 = 0;
                    v37 = v117;
                    v43 = v120;
                  }
                }
                else
                {
                  v108 = 0;
                }
              }
              else
              {
                v108 = 0;
              }

            }
            else
            {
              v108 = 0;
            }

          }
          else
          {
            v108 = 0;
          }

        }
        else
        {
          v108 = 0;
        }

      }
      else
      {
        v108 = 0;
      }

    }
    else
    {
      v108 = 0;
    }

  }
  else
  {
    v108 = 0;
  }

  return v108;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholdPipelineState, 0);
  objc_storeStrong((id *)&self->_fixBlackPointsPipelineState, 0);
  objc_storeStrong((id *)&self->_calcuateBlackPointsPipelineState, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
