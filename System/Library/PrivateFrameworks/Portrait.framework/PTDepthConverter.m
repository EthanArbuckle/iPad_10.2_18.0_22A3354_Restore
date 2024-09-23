@implementation PTDepthConverter

- (PTDepthConverter)initWithMetalContext:(id)a3
{
  id v5;
  PTDepthConverter *v6;
  PTDepthConverter *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  MTLRenderPipelineState *disparityToDepth;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  MTLRenderPipelineState *thresholdedDisparityToDepth;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  MTLRenderPipelineState *segmentationToDepth;
  uint64_t v49;
  MTLRenderPassDescriptor *GBufferRenderPassDescriptor;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  MTLDepthStencilState *depthStencilState;
  PTDepthConverter *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSObject *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  NSObject *v123;
  NSObject *v124;
  id v125;
  objc_super v126;

  v5 = a3;
  v126.receiver = self;
  v126.super_class = (Class)PTDepthConverter;
  v6 = -[PTDepthConverter init](&v126, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    objc_msgSend(v5, "functionWithName:withConstants:", CFSTR("disparityToDepthVert"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v5, "functionWithName:withConstants:", CFSTR("disparityToDepthFrag"), 0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = v9;
        v11 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
        if (!v11)
        {
          _PTLogSystem();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            -[PTDepthConverter initWithMetalContext:].cold.9(v12, v13, v14, v15, v16, v17, v18, v19);

        }
        objc_msgSend(v11, "setVertexFunction:", v8);
        objc_msgSend(v11, "setFragmentFunction:", v10);
        objc_msgSend(v11, "setDepthAttachmentPixelFormat:", 260);
        objc_msgSend(v5, "pipelineLibrary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setPipelineLibrary:", v20);

        objc_msgSend(v5, "device");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = 0;
        v22 = objc_msgSend(v21, "newRenderPipelineStateWithDescriptor:error:", v11, &v125);
        v23 = v125;
        disparityToDepth = v7->_disparityToDepth;
        v7->_disparityToDepth = (MTLRenderPipelineState *)v22;

        if (v7->_disparityToDepth)
        {
          objc_msgSend(v5, "functionWithName:withConstants:", CFSTR("thresholdedDisparityToDepthFrag"), 0);
          v25 = objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            _PTLogSystem();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              -[PTDepthConverter initWithMetalContext:].cold.2(v10, v85, v86, v87, v88, v89, v90, v91);
            goto LABEL_34;
          }
          if (!v11)
          {
            _PTLogSystem();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              -[PTDepthConverter initWithMetalContext:].cold.9(v26, v27, v28, v29, v30, v31, v32, v33);

          }
          objc_msgSend(v11, "setFragmentFunction:", v25);
          objc_msgSend(v5, "device");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = v23;
          v35 = objc_msgSend(v34, "newRenderPipelineStateWithDescriptor:error:", v11, &v124);
          v36 = v124;

          thresholdedDisparityToDepth = v7->_thresholdedDisparityToDepth;
          v7->_thresholdedDisparityToDepth = (MTLRenderPipelineState *)v35;

          if (v7->_thresholdedDisparityToDepth)
          {
            objc_msgSend(v5, "functionWithName:withConstants:", CFSTR("segmentationToDepthFrag"), 0);
            v10 = objc_claimAutoreleasedReturnValue();

            if (v10)
            {
              if (!v11)
              {
                _PTLogSystem();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  -[PTDepthConverter initWithMetalContext:].cold.9(v38, v39, v40, v41, v42, v43, v44, v45);

              }
              objc_msgSend(v11, "setFragmentFunction:", v10);
              objc_msgSend(v5, "device");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = v36;
              v47 = objc_msgSend(v46, "newRenderPipelineStateWithDescriptor:error:", v11, &v123);
              v23 = v123;

              segmentationToDepth = v7->_segmentationToDepth;
              v7->_segmentationToDepth = (MTLRenderPipelineState *)v47;

              if (v7->_segmentationToDepth)
              {
                v49 = objc_opt_new();
                GBufferRenderPassDescriptor = v7->_GBufferRenderPassDescriptor;
                v7->_GBufferRenderPassDescriptor = (MTLRenderPassDescriptor *)v49;

                -[MTLRenderPassDescriptor depthAttachment](v7->_GBufferRenderPassDescriptor, "depthAttachment");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setClearDepth:", 1.0);

                -[MTLRenderPassDescriptor depthAttachment](v7->_GBufferRenderPassDescriptor, "depthAttachment");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "setLoadAction:", 2);

                -[MTLRenderPassDescriptor depthAttachment](v7->_GBufferRenderPassDescriptor, "depthAttachment");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "setStoreAction:", 1);

                -[MTLRenderPassDescriptor stencilAttachment](v7->_GBufferRenderPassDescriptor, "stencilAttachment");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "setClearStencil:", 0);

                -[MTLRenderPassDescriptor stencilAttachment](v7->_GBufferRenderPassDescriptor, "stencilAttachment");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "setLoadAction:", 0);

                -[MTLRenderPassDescriptor stencilAttachment](v7->_GBufferRenderPassDescriptor, "stencilAttachment");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "setStoreAction:", 0);

                -[MTLRenderPassDescriptor stencilAttachment](v7->_GBufferRenderPassDescriptor, "stencilAttachment");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "setTexture:", 0);

                v58 = (void *)objc_opt_new();
                objc_msgSend(v58, "setDepthCompareFunction:", 7);
                objc_msgSend(v58, "setDepthWriteEnabled:", 1);
                objc_msgSend(v5, "device");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = objc_msgSend(v59, "newDepthStencilStateWithDescriptor:", v58);
                depthStencilState = v7->_depthStencilState;
                v7->_depthStencilState = (MTLDepthStencilState *)v60;

                if (v7->_depthStencilState)
                {
                  v62 = v7;
                }
                else
                {
                  _PTLogSystem();
                  v114 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
                    -[PTDepthConverter initWithMetalContext:].cold.8(v114, v115, v116, v117, v118, v119, v120, v121);

                  v62 = 0;
                }

                goto LABEL_48;
              }
              _PTLogSystem();
              v77 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                -[PTDepthConverter initWithMetalContext:].cold.7(v77, v107, v108, v109, v110, v111, v112, v113);
              goto LABEL_31;
            }
            _PTLogSystem();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              -[PTDepthConverter initWithMetalContext:].cold.2(v10, v100, v101, v102, v103, v104, v105, v106);
            v62 = 0;
          }
          else
          {
            _PTLogSystem();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              -[PTDepthConverter initWithMetalContext:].cold.5(v92, v93, v94, v95, v96, v97, v98, v99);

            v62 = 0;
            v10 = v25;
          }
          v23 = v36;
          goto LABEL_48;
        }
        _PTLogSystem();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          -[PTDepthConverter initWithMetalContext:].cold.3(v77, v78, v79, v80, v81, v82, v83, v84);
LABEL_31:

LABEL_34:
        v62 = 0;
LABEL_48:

        goto LABEL_49;
      }
      _PTLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[PTDepthConverter initWithMetalContext:].cold.2(v23, v70, v71, v72, v73, v74, v75, v76);
    }
    else
    {
      _PTLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[PTDepthConverter initWithMetalContext:].cold.1(v23, v63, v64, v65, v66, v67, v68, v69);
    }
    v62 = 0;
LABEL_49:

    goto LABEL_50;
  }
  v62 = 0;
LABEL_50:

  return v62;
}

- (int)disparityToDepth:(id)a3 inBaseDisparity:(id)a4 outDepth:(id)a5 depthNearFar:(float)a6 disparityBias:(BOOL)a7 reverseZ:
{
  int v7;
  double v11;
  MTLRenderPassDescriptor *GBufferRenderPassDescriptor;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  BOOL v22;
  int v23;
  uint64_t v24;

  v24 = *(_QWORD *)&a6;
  v23 = v7;
  v22 = a7;
  if (a7)
    v11 = 0.0;
  else
    v11 = 1.0;
  GBufferRenderPassDescriptor = self->_GBufferRenderPassDescriptor;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[MTLRenderPassDescriptor depthAttachment](GBufferRenderPassDescriptor, "depthAttachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClearDepth:", v11);

  -[MTLRenderPassDescriptor depthAttachment](self->_GBufferRenderPassDescriptor, "depthAttachment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTexture:", v13);

  -[MTLRenderPassDescriptor stencilAttachment](self->_GBufferRenderPassDescriptor, "stencilAttachment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTexture:", v13);

  objc_msgSend(v15, "renderCommandEncoderWithDescriptor:", self->_GBufferRenderPassDescriptor);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setRenderPipelineState:", self->_disparityToDepth);
  objc_msgSend(v19, "setDepthStencilState:", self->_depthStencilState);
  v21 = xmmword_1C9323250;
  objc_msgSend(v19, "setVertexBytes:length:atIndex:", &v21, 16, 0);
  objc_msgSend(v19, "setFragmentTexture:atIndex:", v14, 0);

  objc_msgSend(v19, "setFragmentBytes:length:atIndex:", &v24, 8, 0);
  objc_msgSend(v19, "setFragmentBytes:length:atIndex:", &v23, 4, 1);
  objc_msgSend(v19, "setFragmentBytes:length:atIndex:", &v22, 1, 2);
  objc_msgSend(v19, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 3);
  objc_msgSend(v19, "endEncoding");

  return 0;
}

- (int)thresholdedDisparityToDepth:(id)a3 inBaseDisparity:(id)a4 outDepth:(id)a5 depthNearFar:(BOOL)a6 segmentationDepthNearFar:(id)a7 disparityThresholdNearFar:reverseZ:useDisparityBuffer:cropRect:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  double v15;
  MTLRenderPassDescriptor *GBufferRenderPassDescriptor;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v28 = v8;
  v29 = v7;
  v27 = v9;
  v26 = a6;
  v25 = v10;
  if (a6)
    v15 = 0.0;
  else
    v15 = 1.0;
  GBufferRenderPassDescriptor = self->_GBufferRenderPassDescriptor;
  v17 = a7;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[MTLRenderPassDescriptor depthAttachment](GBufferRenderPassDescriptor, "depthAttachment", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClearDepth:", v15);

  -[MTLRenderPassDescriptor depthAttachment](self->_GBufferRenderPassDescriptor, "depthAttachment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTexture:", v18);

  objc_msgSend(v20, "renderCommandEncoderWithDescriptor:", self->_GBufferRenderPassDescriptor);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setRenderPipelineState:", self->_thresholdedDisparityToDepth);
  objc_msgSend(v23, "setDepthStencilState:", self->_depthStencilState);
  objc_msgSend(v23, "setVertexBytes:length:atIndex:", &v25, 16, 0);
  objc_msgSend(v23, "setFragmentTexture:atIndex:", v19, 0);

  objc_msgSend(v23, "setFragmentBytes:length:atIndex:", &v29, 8, 0);
  objc_msgSend(v23, "setFragmentBytes:length:atIndex:", &v28, 8, 1);
  objc_msgSend(v23, "setFragmentBytes:length:atIndex:", &v27, 8, 2);
  objc_msgSend(v23, "setFragmentBytes:length:atIndex:", &v26, 1, 3);
  objc_msgSend(v23, "setFragmentBuffer:offset:atIndex:", v17, 0, 4);

  objc_msgSend(v23, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 3);
  objc_msgSend(v23, "endEncoding");

  return 0;
}

- (int)segmentationToDepth:(id)a3 inSegmentation:(id)a4 inAlphaMask:(id)a5 outDepth:(id)a6 depthNearFar:(BOOL)a7 segmentationDepthNearFar:(float)a8 reverseZ:threshold:cropRect:
{
  uint64_t v8;
  int v9;
  __int128 v10;
  double v15;
  MTLRenderPassDescriptor *GBufferRenderPassDescriptor;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  int v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;

  v28 = v8;
  v29 = *(_QWORD *)&a8;
  v27 = a7;
  v26 = v9;
  v25 = v10;
  if (a7)
    v15 = 0.0;
  else
    v15 = 1.0;
  GBufferRenderPassDescriptor = self->_GBufferRenderPassDescriptor;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[MTLRenderPassDescriptor depthAttachment](GBufferRenderPassDescriptor, "depthAttachment", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClearDepth:", v15);

  -[MTLRenderPassDescriptor depthAttachment](self->_GBufferRenderPassDescriptor, "depthAttachment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTexture:", v17);

  objc_msgSend(v20, "renderCommandEncoderWithDescriptor:", self->_GBufferRenderPassDescriptor);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setRenderPipelineState:", self->_segmentationToDepth);
  objc_msgSend(v23, "setDepthStencilState:", self->_depthStencilState);
  objc_msgSend(v23, "setVertexBytes:length:atIndex:", &v25, 16, 0);
  objc_msgSend(v23, "setFragmentTexture:atIndex:", v19, 0);

  objc_msgSend(v23, "setFragmentTexture:atIndex:", v18, 1);
  objc_msgSend(v23, "setFragmentBytes:length:atIndex:", &v29, 8, 0);
  objc_msgSend(v23, "setFragmentBytes:length:atIndex:", &v28, 8, 1);
  objc_msgSend(v23, "setFragmentBytes:length:atIndex:", &v27, 1, 2);
  objc_msgSend(v23, "setFragmentBytes:length:atIndex:", &v26, 4, 3);
  objc_msgSend(v23, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 3);
  objc_msgSend(v23, "endEncoding");

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentationToDepth, 0);
  objc_storeStrong((id *)&self->_thresholdedDisparityToDepth, 0);
  objc_storeStrong((id *)&self->_disparityToDepth, 0);
  objc_storeStrong((id *)&self->_depthStencilState, 0);
  objc_storeStrong((id *)&self->_GBufferRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
