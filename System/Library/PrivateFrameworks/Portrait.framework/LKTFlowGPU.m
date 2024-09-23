@implementation LKTFlowGPU

- (void)setUseNonLocalRegularization:(BOOL)a3
{
  self->_useNonLocalRegularization = a3;
}

- (void)setPreset:(int64_t)a3
{
  int v3;
  id v4;

  switch(a3)
  {
    case 0:
      -[LKTFlowGPU _setDefaultParameters](self, "_setDefaultParameters");
      return;
    case 1:
      v3 = 1;
      goto LABEL_6;
    case 2:
      v3 = 3;
      goto LABEL_6;
    case 3:
      v3 = 5;
LABEL_6:
      self->_nwarpings = v3;
      self->_useNonLocalRegularization = 0;
      break;
    case 4:
      self->_nwarpings = 6;
      self->_useNonLocalRegularization = 1;
      *(_QWORD *)&self->_nlreg_radius = 0x200000004;
      *(_QWORD *)&self->_nlreg_sigma_l = 0x4040000040C00000;
      self->_nlreg_sigma_w = 0.25;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Invalid parameter"), CFSTR("Unknown preset"), 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v4);
  }
}

- (void)setNeedConversionBGRA2YUVA:(BOOL)a3
{
  self->_needConversionBGRA2YUVA = a3;
}

- (void)setIsInverse:(BOOL)a3
{
  self->_isInverse = a3;
}

- (void)setIsBidirectional:(BOOL)a3
{
  self->_isBidirectional = a3;
}

- (LKTFlowGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 nscales:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v11;
  LKTFlowGPU *v12;
  LKTFlowGPU *v13;
  int v14;
  int v15;
  NSObject *v16;
  LKTFlowGPU *v17;
  NSObject *v18;
  objc_super v20;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v11 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LKTFlowGPU;
  v12 = -[LKTFlowGPU init](&v20, sel_init);
  v13 = v12;
  if (!v12)
  {
LABEL_7:
    v13 = v13;
    v17 = v13;
    goto LABEL_11;
  }
  if (((v7 | v8) & 1) == 0)
  {
    objc_storeStrong((id *)&v12->_metalContext, a3);
    -[LKTFlowGPU _setDefaultParameters](v13, "_setDefaultParameters");
    -[LKTFlowGPU _initMemory:height:nscales:](v13, "_initMemory:height:nscales:", v8, v7, v6);
    v14 = -[LKTFlowGPU _setupPipelines](v13, "_setupPipelines");
    v15 = -[LKTFlowGPU _setupBuffer](v13, "_setupBuffer") | v14;
    -[LKTFlowGPU reset](v13, "reset");
    if (v15)
    {
      _PTLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[LKTFlowGPU initWithMetalContext:width:height:nscales:].cold.1();

      v13 = 0;
    }
    goto LABEL_7;
  }
  _PTLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[LKTFlowGPU initWithMetalContext:width:height:nscales:].cold.2();

  v17 = 0;
LABEL_11:

  return v17;
}

- (void)reset
{
  *(_WORD *)self->_indexUpdated = 0;
  *(_QWORD *)&self->_current_frame_index = 0;
}

- (int)_setupBuffer
{
  int height;
  int v4;
  uint64_t v5;
  int v6;
  MTLBuffer **Adiagb_buf;
  MTLBuffer **Ixy_buf;
  char v9;
  char v10;
  void *v11;
  uint64_t v12;
  MTLBuffer *v13;
  void *v14;
  uint64_t v15;
  MTLBuffer *v16;
  void *v17;
  MTLBuffer *v18;
  MTLBuffer *idt_buf;
  uint64_t v20;
  int v21;
  MTLTexture **G0_tex;
  MTLTexture **G1_tex;
  int32x2_t v24;
  MTLTexture **C0_tex;
  int64x2_t v26;
  int32x2_t v27;
  unint64_t v28;
  int64x2_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  MTLTexture *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  MTLTexture *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  MTLTexture *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  MTLTexture *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  MTLTexture *v51;
  NSObject *v52;
  uint64_t v53;
  char v54;
  char v55;
  void *v56;
  uint64_t v57;
  id *v58;
  id v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  id *v63;
  id v64;
  NSObject *v65;
  uint64_t v66;
  MTLTexture **v67;
  MTLTexture *v68;
  uint64_t v69;
  MTLTexture **v70;
  MTLTexture *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  MTLTexture *v77;
  uint64_t v78;
  MTLTexture *v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int32x2_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  MTLTexture *v101;
  uint64_t v102;
  MTLTexture *v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int32x2_t v119;
  NSObject *kpt_buf;
  MTLBuffer *v121;
  int64x2_t v123;
  MTLTexture **v124;
  MTLTexture **v125;
  MTLTexture *(*I_u32_alias_tex)[10];
  MTLTexture *(*I_tex)[10];
  MTLTexture **w_tex;
  MTLTexture **C1_tex;
  uint64_t v130;
  int32x2_t v131;
  uint64_t v132;
  int32x2_t v133;
  uint64_t v134;
  uint64_t v135;
  int32x2_t v136;
  void *v137;
  uint8_t buf[4];
  int v139;
  __int16 v140;
  int v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  height = (int)self->_ref_size.height;
  v4 = ((int)self->_ref_size.width + LODWORD(self->_maxThreadExecutionWidth) - 1)
     / SLODWORD(self->_maxThreadExecutionWidth)
     * LODWORD(self->_maxThreadExecutionWidth);
  v137 = (void *)objc_opt_new();
  v5 = 0;
  v6 = v4 * height;
  Adiagb_buf = self->_Adiagb_buf;
  Ixy_buf = self->_Ixy_buf;
  v9 = 1;
  while (1)
  {
    v10 = v9;
    -[PTMetalContext device](self->_metalContext, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "newBufferWithLength:options:", 8 * v6, 0);
    v13 = Adiagb_buf[v5];
    Adiagb_buf[v5] = (MTLBuffer *)v12;

    if (!Adiagb_buf[v5])
      break;
    -[PTMetalContext device](self->_metalContext, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "newBufferWithLength:options:", 2 * v6, 0);
    v16 = Ixy_buf[v5];
    Ixy_buf[v5] = (MTLBuffer *)v15;

    if (!Ixy_buf[v5])
    {
      _PTLogSystem();
      kpt_buf = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(kpt_buf, OS_LOG_TYPE_ERROR))
        -[LKTFlowGPU _setupBuffer].cold.1();
      v21 = -2;
      goto LABEL_117;
    }
    v9 = 0;
    v5 = 1;
    if ((v10 & 1) == 0)
    {
      -[PTMetalContext device](self->_metalContext, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (MTLBuffer *)objc_msgSend(v17, "newBufferWithLength:options:", 4 * v6, 0);
      idt_buf = self->_idt_buf;
      self->_idt_buf = v18;

      if (self->_idt_buf)
      {
        if (self->_nscales < 1)
        {
          v21 = 0;
        }
        else
        {
          v20 = 0;
          v21 = 0;
          G0_tex = self->_G0_tex;
          G1_tex = self->_G1_tex;
          v24 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_aux_size));
          C0_tex = self->_C0_tex;
          w_tex = self->_w_tex;
          C1_tex = self->_C1_tex;
          v26 = vcvtq_s64_f64((float64x2_t)self->_ref_size);
          v27 = vmovn_s64(v26);
          I_u32_alias_tex = self->_I_u32_alias_tex;
          I_tex = self->_I_tex;
          v124 = self->_I_u32_alias_tex[1];
          v125 = self->_I_tex[1];
          v28 = 0x1E0CC6000uLL;
          v26.i64[0] = 67109120;
          v123 = v26;
          do
          {
            v131 = v24;
            v29.i64[0] = v27.i32[0];
            v29.i64[1] = v27.i32[1];
            self->_ref_pyr_size[v20] = (CGSize)vcvtq_f64_s64(v29);
            v29.i64[0] = v24.i32[0];
            v29.i64[1] = v24.i32[1];
            self->_aux_pyr_size[v20] = (CGSize)vcvtq_f64_s64(v29);
            v134 = v27.u32[0];
            v135 = v27.u32[1];
            objc_msgSend(*(id *)(v28 + 2992), "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, *(_OWORD *)&v123);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[PTMetalContext device](self->_metalContext, "device");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v31, "supportsFamily:", 1007))
              v32 = 0;
            else
              v32 = 32;
            objc_msgSend(v30, "setResourceOptions:", v32);

            objc_msgSend(v30, "setUsage:", 3);
            -[PTMetalContext device](self->_metalContext, "device");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "newTextureWithDescriptor:", v30);
            v35 = G0_tex[v20];
            G0_tex[v20] = (MTLTexture *)v34;

            if (!G0_tex[v20])
            {
              _PTLogSystem();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v123.i32[0];
                v139 = v20;
                _os_log_error_impl(&dword_1C9281000, v36, OS_LOG_TYPE_ERROR, "_G0_tex[%i] is nil", buf, 8u);
              }

              v21 = -1;
            }
            v130 = v131.u32[0];
            objc_msgSend(v30, "setWidth:");
            v132 = v131.u32[1];
            objc_msgSend(v30, "setHeight:");
            -[PTMetalContext device](self->_metalContext, "device");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "newTextureWithDescriptor:", v30);
            v39 = G1_tex[v20];
            G1_tex[v20] = (MTLTexture *)v38;

            if (!G1_tex[v20])
            {
              _PTLogSystem();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v123.i32[0];
                v139 = v20;
                _os_log_error_impl(&dword_1C9281000, v40, OS_LOG_TYPE_ERROR, "_G1_tex[%i] is nil", buf, 8u);
              }

              v21 = -1;
            }
            if (G0_tex[v20])
              objc_msgSend(v137, "addObject:");
            if (G1_tex[v20])
              objc_msgSend(v137, "addObject:");
            objc_msgSend(v30, "setPixelFormat:", 115);
            objc_msgSend(v30, "setWidth:", v134);
            objc_msgSend(v30, "setHeight:", v135);
            -[PTMetalContext device](self->_metalContext, "device");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "newTextureWithDescriptor:", v30);
            v43 = C0_tex[v20];
            C0_tex[v20] = (MTLTexture *)v42;

            if (!C0_tex[v20])
            {
              _PTLogSystem();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v123.i32[0];
                v139 = v20;
                _os_log_error_impl(&dword_1C9281000, v44, OS_LOG_TYPE_ERROR, "_C0_tex[%i] is nil", buf, 8u);
              }

              v21 = -1;
            }
            objc_msgSend(v30, "setWidth:", v130);
            objc_msgSend(v30, "setHeight:", v132);
            -[PTMetalContext device](self->_metalContext, "device");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "newTextureWithDescriptor:", v30);
            v47 = C1_tex[v20];
            C1_tex[v20] = (MTLTexture *)v46;

            if (!C1_tex[v20])
            {
              _PTLogSystem();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v123.i32[0];
                v139 = v20;
                _os_log_error_impl(&dword_1C9281000, v48, OS_LOG_TYPE_ERROR, "_C1_tex[%i] is nil", buf, 8u);
              }

              v21 = -1;
            }
            if (C0_tex[v20])
              objc_msgSend(v137, "addObject:");
            if (C1_tex[v20])
              objc_msgSend(v137, "addObject:");
            objc_msgSend(v30, "setWidth:", v134);
            objc_msgSend(v30, "setHeight:", v135);
            objc_msgSend(v30, "setPixelFormat:", 25);
            -[PTMetalContext device](self->_metalContext, "device");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "newTextureWithDescriptor:", v30);
            v51 = w_tex[v20];
            w_tex[v20] = (MTLTexture *)v50;

            if (w_tex[v20])
            {
              objc_msgSend(v137, "addObject:");
            }
            else
            {
              _PTLogSystem();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v123.i32[0];
                v139 = v20;
                _os_log_error_impl(&dword_1C9281000, v52, OS_LOG_TYPE_ERROR, "_w_tex[%i] is nil", buf, 8u);
              }

              v21 = -1;
            }
            objc_msgSend(v30, "setPixelFormat:", 65);
            objc_msgSend(v30, "setWidth:", v134);
            objc_msgSend(v30, "setHeight:", v135);
            objc_msgSend(v30, "setUsage:", 19);
            v53 = 0;
            v54 = 1;
            do
            {
              v55 = v54;
              -[PTMetalContext device](self->_metalContext, "device");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v56, "newTextureWithDescriptor:", v30);
              v58 = (id *)&self->_uv_fwd_tex[v53][v20];
              v59 = *v58;
              *v58 = (id)v57;

              if (!*v58)
              {
                _PTLogSystem();
                v60 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109376;
                  v139 = v53;
                  v140 = 1024;
                  v141 = v20;
                  _os_log_error_impl(&dword_1C9281000, v60, OS_LOG_TYPE_ERROR, "_uv_fwd_tex[%i][%i] is nil", buf, 0xEu);
                }

                v21 = -1;
              }
              -[PTMetalContext device](self->_metalContext, "device");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = objc_msgSend(v61, "newTextureWithDescriptor:", v30);
              v63 = (id *)&self->_uv_bwd_tex[v53][v20];
              v64 = *v63;
              *v63 = (id)v62;

              if (!*v63)
              {
                _PTLogSystem();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109376;
                  v139 = v53;
                  v140 = 1024;
                  v141 = v20;
                  _os_log_error_impl(&dword_1C9281000, v65, OS_LOG_TYPE_ERROR, "_uv_bwd_tex[%i][%i] is nil", buf, 0xEu);
                }

                v21 = -1;
              }
              v66 = objc_msgSend(*v58, "newTextureViewWithPixelFormat:", 53);
              v67 = self->_uv_fwd_u32_alias_tex[v53];
              v68 = v67[v20];
              v67[v20] = (MTLTexture *)v66;

              v69 = objc_msgSend(*v63, "newTextureViewWithPixelFormat:", 53);
              v70 = self->_uv_bwd_u32_alias_tex[v53];
              v71 = v70[v20];
              v70[v20] = (MTLTexture *)v69;

              if (v20 && *v58 && *v63)
              {
                objc_msgSend(v137, "addObject:");
                objc_msgSend(v137, "addObject:", *v63);
              }
              v54 = 0;
              v53 = 1;
            }
            while ((v55 & 1) != 0);
            objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, (int)v134, (int)v135, 0);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "setUsage:", 19);
            -[PTMetalContext device](self->_metalContext, "device");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v73, "supportsFamily:", 1007))
              v74 = 0;
            else
              v74 = 32;
            objc_msgSend(v72, "setResourceOptions:", v74);

            -[PTMetalContext device](self->_metalContext, "device");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_msgSend(v75, "newTextureWithDescriptor:", v72);
            v77 = (*I_tex)[v20];
            (*I_tex)[v20] = (MTLTexture *)v76;

            v78 = -[MTLTexture newTextureViewWithPixelFormat:]((*I_tex)[v20], "newTextureViewWithPixelFormat:", 53);
            v79 = (*I_u32_alias_tex)[v20];
            (*I_u32_alias_tex)[v20] = (MTLTexture *)v78;

            v80 = v134 & 1;
            if ((int)v134 < 0)
              v80 = -v80;
            v81 = v135 & 1;
            if ((int)v135 < 0)
              v81 = -v81;
            v82 = v80 + v134;
            if (v82 >= 0)
              v83 = v82;
            else
              v83 = v82 + 1;
            v84 = v83 >> 1;
            if (v84 >= 0)
              v85 = v84 & 1;
            else
              v85 = -(v84 & 1);
            v86 = v81 + v135;
            if (v86 >= 0)
              v87 = v86;
            else
              v87 = v86 + 1;
            v88 = v87 >> 1;
            if (v88 >= 0)
              v89 = v88 & 1;
            else
              v89 = -(v88 & 1);
            v90 = v82 + 2 * v85;
            if (v90 + 1 >= 0)
              v91 = v90 + 1;
            else
              v91 = v90 + 2;
            v92 = v91 >> 1;
            v93 = v86 + 2 * v89;
            if (v93 + 1 >= 0)
              v94 = v93 + 1;
            else
              v94 = v93 + 2;
            v95.i32[0] = v92;
            v95.i32[1] = v94 >> 1;
            v136 = v95;

            objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, (int)v130, (int)v132, 0);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "setUsage:", 19);
            -[PTMetalContext device](self->_metalContext, "device");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v97, "supportsFamily:", 1007))
              v98 = 0;
            else
              v98 = 32;
            objc_msgSend(v96, "setResourceOptions:", v98);

            -[PTMetalContext device](self->_metalContext, "device");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = objc_msgSend(v99, "newTextureWithDescriptor:", v96);
            v101 = v125[v20];
            v125[v20] = (MTLTexture *)v100;

            v102 = -[MTLTexture newTextureViewWithPixelFormat:](v125[v20], "newTextureViewWithPixelFormat:", 53);
            v103 = v124[v20];
            v124[v20] = (MTLTexture *)v102;

            v104 = v130 & 1;
            if ((int)v130 < 0)
              v104 = -v104;
            v105 = v132 & 1;
            if ((int)v132 < 0)
              v105 = -v105;
            v106 = v104 + v130;
            if (v106 >= 0)
              v107 = v106;
            else
              v107 = v106 + 1;
            v108 = v107 >> 1;
            if (v108 >= 0)
              v109 = v108 & 1;
            else
              v109 = -(v108 & 1);
            v110 = v105 + v132;
            if (v110 >= 0)
              v111 = v110;
            else
              v111 = v110 + 1;
            v112 = v111 >> 1;
            if (v112 >= 0)
              v113 = v112 & 1;
            else
              v113 = -(v112 & 1);
            v114 = v106 + 2 * v109;
            if (v114 + 1 >= 0)
              v115 = v114 + 1;
            else
              v115 = v114 + 2;
            v116 = v115 >> 1;
            v117 = v110 + 2 * v113;
            if (v117 + 1 >= 0)
              v118 = v117 + 1;
            else
              v118 = v117 + 2;
            v119.i32[0] = v116;
            v119.i32[1] = v118 >> 1;
            v133 = v119;

            v27 = v136;
            v24 = v133;
            v28 = 0x1E0CC6000;
            ++v20;
            G1_tex = self->_G1_tex;
            G0_tex = self->_G0_tex;
            C0_tex = self->_C0_tex;
          }
          while (v20 < self->_nscales);
        }
        v121 = -[LKTFlowGPU newBufferWithPixelFormat:width:data:](self, "newBufferWithPixelFormat:width:data:", 115, 0x8000, 0);
        kpt_buf = self->_kpt_buf;
        self->_kpt_buf = v121;
      }
      else
      {
        _PTLogSystem();
        kpt_buf = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(kpt_buf, OS_LOG_TYPE_ERROR))
          -[LKTFlowGPU _setupBuffer].cold.1();
        v21 = -3;
      }
      goto LABEL_117;
    }
  }
  _PTLogSystem();
  kpt_buf = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(kpt_buf, OS_LOG_TYPE_ERROR))
    -[LKTFlowGPU _setupBuffer].cold.1();
  v21 = -1;
LABEL_117:

  return v21;
}

- (id)newBufferWithPixelFormat:(unint64_t)a3 width:(int)a4 data:(const void *)a5
{
  int v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v16;

  v8 = 1;
  switch(a3)
  {
    case 0xAuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      goto LABEL_8;
    case 0xBuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1FuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3DuLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
      goto LABEL_15;
    case 0x14uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1EuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x2BuLL:
      v8 = 2;
      goto LABEL_8;
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x40uLL:
    case 0x41uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x49uLL:
    case 0x4AuLL:
    case 0x50uLL:
    case 0x51uLL:
      goto LABEL_7;
    default:
      v9 = a3 - 90;
      if (a3 - 90 > 0x23)
        goto LABEL_14;
      if (((1 << v9) & 0x3D0E000) != 0)
      {
        v8 = 8;
      }
      else if (((1 << v9) & 0xF) != 0)
      {
LABEL_7:
        v8 = 4;
      }
      else if (((1 << v9) & 0xE00000000) != 0)
      {
        v8 = 16;
      }
      else
      {
LABEL_14:
        if (a3 != 1)
        {
LABEL_15:
          _PTLogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[LKTFlowGPU newBufferWithPixelFormat:width:data:].cold.1();

          v8 = 0;
        }
      }
LABEL_8:
      v10 = v8 * (uint64_t)a4;
      -[PTMetalContext device](self->_metalContext, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (a5)
        v13 = objc_msgSend(v11, "newBufferWithBytes:length:options:", a5, v10, 0);
      else
        v13 = objc_msgSend(v11, "newBufferWithLength:options:", v10, 0);
      v14 = (void *)v13;

      return v14;
  }
}

- (int)_setupPipelines
{
  uint64_t v3;
  int v4;
  MTLComputePipelineState **computePipelines;
  void *v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t maxThreadExecutionWidth;
  uint8_t v12[4];
  _DWORD v13[7];

  v3 = 0;
  v4 = 0;
  *(_QWORD *)&v13[5] = *MEMORY[0x1E0C80C00];
  computePipelines = self->_computePipelines;
  do
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", kKernelNames[v3]);
    -[PTMetalContext computePipelineStateFor:withConstants:](self->_metalContext, "computePipelineStateFor:withConstants:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      _PTLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[LKTFlowGPU _setupPipelines].cold.1(v12, v13, v8);

      v4 = -1;
    }
    objc_storeStrong((id *)&computePipelines[v3], v7);
    v9 = objc_msgSend(v7, "threadExecutionWidth");
    maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
    if (v9 > maxThreadExecutionWidth)
      maxThreadExecutionWidth = objc_msgSend(v7, "threadExecutionWidth");
    self->_maxThreadExecutionWidth = maxThreadExecutionWidth;

    ++v3;
  }
  while (v3 != 12);
  return v4;
}

- (void)_setDefaultParameters
{
  self->_nwarpings = 3;
  self->_useNonLocalRegularization = 0;
  *(_QWORD *)&self->_nlreg_radius = 0x200000004;
  *(_QWORD *)&self->_nlreg_sigma_l = 0x4040000040C00000;
  self->_nlreg_sigma_w = 0.25;
}

- (void)_initMemory:(int)a3 height:(int)a4 nscales:(int)a5
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v22;
  MTLTexture *uv_fwd_tex_user_ref;
  int nscales;
  id v25;

  v6 = 0;
  self->_isValid = 0;
  if (a3 >= 8 && a4 >= 8)
  {
    v6 = 0;
    v7 = a4;
    v8 = a3;
    do
    {
      v9 = (v8 & 1) + v8;
      if (v9 >= 0)
        v10 = v9;
      else
        v10 = v9 + 1;
      v11 = v10 >> 1;
      v12 = v9 + 1;
      if (v11 >= 0)
        v13 = v11 & 1;
      else
        v13 = -(v11 & 1);
      v14 = (v7 & 1) + v7;
      if (v14 >= 0)
        v15 = v14;
      else
        v15 = v14 + 1;
      v16 = v15 >> 1;
      v17 = v14 + 1;
      if (v16 >= 0)
        v18 = v16 & 1;
      else
        v18 = -(v16 & 1);
      v19 = v12 + 2 * v13;
      v8 = v19 >> 1;
      v20 = v17 + 2 * v18;
      v7 = v20 >> 1;
      ++v6;
    }
    while (v19 >= 16 && v20 > 15);
  }
  self->_ref_size.width = (double)a3;
  self->_ref_size.height = (double)a4;
  self->_aux_size.width = (double)a3;
  self->_aux_size.height = (double)a4;
  if (a5 >= 0)
    v22 = a5;
  else
    v22 = v6;
  self->_nscales = v22;
  self->_maxThreadExecutionWidth = 0;
  uv_fwd_tex_user_ref = self->_uv_fwd_tex_user_ref;
  self->_uv_fwd_tex_user_ref = 0;

  *(_QWORD *)&self->_current_frame_index = 0;
  nscales = self->_nscales;
  if (nscales > v6 || nscales >= 10)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Invalid parameter"), CFSTR("The number of scales specified is too large"), 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
}

- (int)setOutputTexUVForward:(id)a3 backward:(id)a4
{
  MTLTexture *v6;
  MTLTexture *v7;
  MTLTexture *uv_fwd_tex_user_ref;
  MTLTexture *v9;
  MTLTexture *uv_bwd_tex_user_ref;

  v6 = (MTLTexture *)a3;
  v7 = (MTLTexture *)a4;
  uv_fwd_tex_user_ref = self->_uv_fwd_tex_user_ref;
  self->_uv_fwd_tex_user_ref = v6;
  v9 = v6;

  uv_bwd_tex_user_ref = self->_uv_bwd_tex_user_ref;
  self->_uv_bwd_tex_user_ref = v7;

  self->_isValid = v9 != 0;
  return 0;
}

- (int)setOutputTexUV:(id)a3
{
  return -[LKTFlowGPU setOutputTexUVForward:backward:](self, "setOutputTexUVForward:backward:", a3, 0);
}

- (BOOL)isBidirectional
{
  return self->_uv_bwd_tex_user_ref != 0;
}

- (MTLBuffer)keypoints
{
  return self->_kpt_buf;
}

- (int)estimateFlowFromTexReference:(id)a3 target:(id)a4 commandBuffer:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_isValid && !self->_streamFrameCount)
  {
    -[LKTFlowGPU _zeroFlowWithCommandBuffer:uv_tex:](self, "_zeroFlowWithCommandBuffer:uv_tex:", v10, self->_w_tex[self->_nscales + 9]);
    if (-[LKTFlowGPU isBidirectional](self, "isBidirectional"))
      -[LKTFlowGPU _zeroFlowWithCommandBuffer:uv_tex:](self, "_zeroFlowWithCommandBuffer:uv_tex:", v10, self->_uv_fwd_tex[1][self->_nscales + 9]);
    -[LKTFlowGPU _createImagePyramidWithCommandBuffer:in_tex:I_idx:](self, "_createImagePyramidWithCommandBuffer:in_tex:I_idx:", v10, v8, 0);
    -[LKTFlowGPU _createImagePyramidWithCommandBuffer:in_tex:I_idx:](self, "_createImagePyramidWithCommandBuffer:in_tex:I_idx:", v10, v9, 1);
    *(_QWORD *)&self->_current_frame_index = 0;
    if (-[LKTFlowGPU isBidirectional](self, "isBidirectional"))
      -[LKTFlowGPU _computeOpticalFlowBidirectional:](self, "_computeOpticalFlowBidirectional:", v10);
    else
      -[LKTFlowGPU _computeOpticalFlow:computeFeatureI0:computeFeatureI1:](self, "_computeOpticalFlow:computeFeatureI0:computeFeatureI1:", v10, 1, 1);
    v11 = 0;
  }
  else
  {
    v11 = -12782;
  }

  return v11;
}

- (int)estimateFlowStreamTex:(id)a3 index:(int)a4 doOpticalFlow:(BOOL)a5 commandBuffer:(id)a6
{
  int v7;
  id v10;
  id v11;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  if (self->_isValid)
  {
    -[LKTFlowGPU _createImagePyramidWithCommandBuffer:in_tex:I_idx:](self, "_createImagePyramidWithCommandBuffer:in_tex:I_idx:", v11, v10, self->_isInverse ^ a4);
    *(_QWORD *)&self->_current_frame_index = a4 ^ 1u;
    if (v7)
    {
      -[LKTFlowGPU _zeroFlowWithCommandBuffer:uv_tex:](self, "_zeroFlowWithCommandBuffer:uv_tex:", v11, self->_w_tex[self->_nscales + 9]);
      if (-[LKTFlowGPU isBidirectional](self, "isBidirectional"))
      {
        -[LKTFlowGPU _zeroFlowWithCommandBuffer:uv_tex:](self, "_zeroFlowWithCommandBuffer:uv_tex:", v11, self->_uv_fwd_tex[1][self->_nscales + 9]);
        -[LKTFlowGPU _computeOpticalFlowBidirectional:](self, "_computeOpticalFlowBidirectional:", v11);
      }
      else
      {
        -[LKTFlowGPU _computeOpticalFlow:computeFeatureI0:computeFeatureI1:](self, "_computeOpticalFlow:computeFeatureI0:computeFeatureI1:", v11, 1, 1);
      }
      v7 = 0;
    }
    else
    {
      self->_indexUpdated[a4] = 0;
    }
  }
  else
  {
    v7 = -12782;
  }

  return v7;
}

- (int)estimateFlowStreamTex:(id)a3 commandBuffer:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  int streamFrameCount;
  int v11;
  int v12;

  v6 = a3;
  v7 = a4;
  if (self->_isValid)
  {
    v8 = self->_streamFrameCount & 1;
    if (self->_streamFrameCount >= 0)
      v9 = v8;
    else
      v9 = -v8;
    -[LKTFlowGPU _createImagePyramidWithCommandBuffer:in_tex:I_idx:](self, "_createImagePyramidWithCommandBuffer:in_tex:I_idx:", v7, v6, v9);
    streamFrameCount = self->_streamFrameCount;
    self->_streamFrameCount = streamFrameCount + 1;
    v11 = (streamFrameCount + 1) & 1;
    if (streamFrameCount < -1)
      v11 = -v11;
    self->_current_frame_index = v11;
    if (streamFrameCount >= 1)
    {
      -[LKTFlowGPU _zeroFlowWithCommandBuffer:uv_tex:](self, "_zeroFlowWithCommandBuffer:uv_tex:", v7, self->_w_tex[self->_nscales + 9]);
      if (-[LKTFlowGPU isBidirectional](self, "isBidirectional"))
      {
        -[LKTFlowGPU _zeroFlowWithCommandBuffer:uv_tex:](self, "_zeroFlowWithCommandBuffer:uv_tex:", v7, self->_uv_fwd_tex[1][self->_nscales + 9]);
        -[LKTFlowGPU _computeOpticalFlowBidirectional:](self, "_computeOpticalFlowBidirectional:", v7);
      }
      else
      {
        -[LKTFlowGPU _computeOpticalFlow:computeFeatureI0:computeFeatureI1:](self, "_computeOpticalFlow:computeFeatureI0:computeFeatureI1:", v7, 1, 1);
      }
    }
    v12 = 0;
  }
  else
  {
    v12 = -12782;
  }

  return v12;
}

- (int)computeKeypointsFromTexForwardFlow:(id)a3 backwardFlow:(id)a4 bidirectionalError:(float)a5 blockSize:(int)a6 outNumKeypoints:(unsigned __int16 *)a7 commandBuffer:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  double v17;

  v9 = *(_QWORD *)&a6;
  v14 = a8;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v14, "setLabel:", CFSTR("LKT::KeypointsFromFlow"));
  *(float *)&v17 = a5;
  -[LKTFlowGPU _enqueueKeypointsFromFlowWithCommandBuffer:in_uv_fwd_tex:in_uv_bwd_tex:out_kpt_buf:block_size:bidirectional_error:out_num_keypoints:](self, "_enqueueKeypointsFromFlowWithCommandBuffer:in_uv_fwd_tex:in_uv_bwd_tex:out_kpt_buf:block_size:bidirectional_error:out_num_keypoints:", v14, v16, v15, self->_kpt_buf, v9, a7, v17);

  return 0;
}

- (int)_computeOpticalFlow:(id)a3 computeFeatureI0:(BOOL)a4 computeFeatureI1:(BOOL)a5
{
  int nscales;
  uint64_t v7;
  uint64_t v8;
  MTLTexture *(*uv_fwd_tex)[10];
  int v10;
  MTLTexture *v11;
  int nwarpings;
  int v13;
  MTLTexture *v14;
  int v15;
  MTLTexture **p_uv_fwd_tex_user_ref;
  MTLTexture *v17;
  MTLTexture *v18;
  MTLTexture **v19;
  MTLTexture *(*I_tex)[10];
  _BOOL4 v23;
  _BOOL4 v24;
  MTLTexture *v25;
  MTLTexture *v26;
  MTLTexture **C1_tex;
  MTLTexture **G1_tex;
  MTLTexture **C0_tex;
  MTLTexture **G0_tex;
  id v31;

  v23 = a4;
  v24 = a5;
  v31 = a3;
  nscales = self->_nscales;
  v7 = (nscales - 1);
  if (nscales >= 1)
  {
    v8 = 0;
    I_tex = self->_I_tex;
    G0_tex = self->_G0_tex;
    G1_tex = self->_G1_tex;
    C0_tex = self->_C0_tex;
    uv_fwd_tex = self->_uv_fwd_tex;
    C1_tex = self->_C1_tex;
    v10 = nscales - 1;
    do
    {
      v11 = I_tex[self->_current_frame_index][v7];
      v26 = I_tex[self->_current_frame_index ^ 1][v7];
      if (v23)
      {
        -[LKTFlowGPU _computeFeaturesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesWithCommandBuffer:in_tex:out_tex:", v31, v11, G0_tex[v7]);
        -[LKTFlowGPU _computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:", v31, G0_tex[v7], C0_tex[v7]);
      }
      if (v24)
      {
        -[LKTFlowGPU _computeFeaturesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesWithCommandBuffer:in_tex:out_tex:", v31, v26, G1_tex[v7]);
        -[LKTFlowGPU _computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:", v31, G1_tex[v7], C1_tex[v7]);
      }
      nwarpings = self->_nwarpings;
      if (nwarpings < 1)
      {
        v14 = 0;
      }
      else
      {
        v25 = v11;
        v13 = 0;
        v14 = 0;
        do
        {
          v15 = v13 + 1;
          if (v7
            || v15 != nwarpings
            || (p_uv_fwd_tex_user_ref = &self->_uv_fwd_tex_user_ref, self->_useNonLocalRegularization))
          {
            p_uv_fwd_tex_user_ref = &uv_fwd_tex[v8 ^ 1][v7];
          }
          v17 = *p_uv_fwd_tex_user_ref;
          if (self->_useNonLocalRegularization && v15 == self->_nwarpings)
          {
            v18 = self->_w_tex[v7];

            v14 = v18;
          }
          -[LKTFlowGPU _doSolverWithCommandBuffer:scale:in_uv_tex:in_G0_tex:in_G1_tex:in_C0_tex:in_C1_tex:out_uv_tex:out_w_tex:](self, "_doSolverWithCommandBuffer:scale:in_uv_tex:in_G0_tex:in_G1_tex:in_C0_tex:in_C1_tex:out_uv_tex:out_w_tex:", v31, v7, uv_fwd_tex[v8][v10], G0_tex[v7], G1_tex[v7], C0_tex[v7], C1_tex[v7], v17, v14);
          v8 ^= 1uLL;

          nwarpings = self->_nwarpings;
          ++v13;
          v10 = v7;
        }
        while (v13 < nwarpings);
        v10 = v7;
        v11 = v25;
      }
      if (self->_useNonLocalRegularization)
      {
        v19 = &uv_fwd_tex[v8 ^ 1][v7];
        if (!v7)
          v19 = &self->_uv_fwd_tex_user_ref;
        -[LKTFlowGPU _doNLRegularizationWithCommandBuffer:in_uv_tex:join_tex:w_tex:out_uv_tex:](self, "_doNLRegularizationWithCommandBuffer:in_uv_tex:join_tex:w_tex:out_uv_tex:", v31, self->_uv_fwd_u32_alias_tex[v8][v7], self->_I_u32_alias_tex[self->_current_frame_index][v7], v14, *v19);
        v8 ^= 1uLL;
      }

    }
    while (v7-- > 0);
  }

  return 0;
}

- (int)_computeOpticalFlowBidirectional:(id)a3
{
  uint64_t v4;
  MTLTexture *v5;
  MTLTexture *v6;
  uint64_t nscales;
  uint64_t v8;
  int v9;
  MTLTexture *v10;
  MTLTexture *v11;
  int v12;
  MTLTexture *v13;
  MTLTexture *v14;
  uint64_t v15;
  BOOL v16;
  MTLTexture **p_uv_bwd_tex_user_ref;
  MTLTexture *v18;
  MTLTexture *v19;
  MTLTexture *v20;
  MTLTexture **v21;
  BOOL v22;
  MTLTexture **p_uv_fwd_tex_user_ref;
  MTLTexture *v24;
  MTLTexture *v25;
  MTLTexture *(*I_tex)[10];
  MTLTexture *v28;
  MTLTexture *v29;
  uint64_t v30;
  MTLTexture *(*uv_fwd_tex)[10];
  MTLTexture *(*uv_bwd_tex)[10];
  int v33;
  int v34;
  uint64_t v35;
  MTLTexture **C1_tex;
  MTLTexture **C0_tex;
  MTLTexture **G1_tex;
  MTLTexture **G0_tex;
  id v40;
  MTLTexture *v41;
  MTLTexture *v42;
  MTLTexture *v43;
  MTLTexture *v44;
  MTLTexture *v45;
  MTLTexture *v46;
  uint64_t v47;

  v40 = a3;
  v4 = self->_nscales - 1;
  uv_fwd_tex = self->_uv_fwd_tex;
  v5 = self->_uv_fwd_tex[0][v4];
  uv_bwd_tex = self->_uv_bwd_tex;
  v6 = self->_uv_bwd_tex[0][v4];
  nscales = self->_nscales;
  if ((int)nscales >= 1)
  {
    v8 = 0;
    I_tex = self->_I_tex;
    G1_tex = self->_G1_tex;
    G0_tex = self->_G0_tex;
    C1_tex = self->_C1_tex;
    C0_tex = self->_C0_tex;
    v34 = v4;
    v33 = v4;
    do
    {
      v9 = nscales - 1;
      v10 = I_tex[self->_current_frame_index][(nscales - 1)];
      v11 = I_tex[self->_current_frame_index ^ 1][(nscales - 1)];
      v29 = v10;
      -[LKTFlowGPU _computeFeaturesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesWithCommandBuffer:in_tex:out_tex:", v40, v10, G0_tex[(nscales - 1)]);
      v28 = v11;
      -[LKTFlowGPU _computeFeaturesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesWithCommandBuffer:in_tex:out_tex:", v40, v11, G1_tex[(nscales - 1)]);
      -[LKTFlowGPU _computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:", v40, G0_tex[v9], C0_tex[v9]);
      -[LKTFlowGPU _computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:", v40, G1_tex[v9], C1_tex[v9]);
      v30 = nscales;
      if (self->_nwarpings >= 1)
      {
        v12 = 0;
        v35 = (nscales - 1);
        do
        {
          if (((v12 + 1) & 1) != 0)
          {
            v45 = G0_tex[v35];
            v44 = G1_tex[v35];
            v43 = C0_tex[v35];
            v41 = C1_tex[v35];
            v21 = uv_fwd_tex[v8];
            v13 = v21[v34];
            v47 = v8 ^ 1;
            v14 = uv_fwd_tex[v8 ^ 1][v35];
            v15 = nscales - 1;
            v22 = (_DWORD)nscales != 1 || v12 + 3 <= self->_nwarpings;
            p_uv_fwd_tex_user_ref = &v21[v35];
            if (!v22)
              p_uv_fwd_tex_user_ref = &self->_uv_fwd_tex_user_ref;
            v24 = *p_uv_fwd_tex_user_ref;
            v25 = v6;
            v20 = v24;

            v46 = v20;
            v34 = nscales - 1;
            v42 = v25;
            v19 = v25;
          }
          else
          {
            v45 = G1_tex[v35];
            v44 = G0_tex[v35];
            v43 = C1_tex[v35];
            v41 = C0_tex[v35];
            v13 = (*uv_bwd_tex)[v33];
            v14 = self->_uv_bwd_tex[1][v35];
            v15 = nscales - 1;
            v16 = (_DWORD)nscales != 1 || v12 + 3 <= self->_nwarpings;
            p_uv_bwd_tex_user_ref = &self->_uv_bwd_tex_user_ref;
            if (v16)
              p_uv_bwd_tex_user_ref = &(*uv_bwd_tex)[(nscales - 1)];
            v18 = *p_uv_bwd_tex_user_ref;
            v19 = v5;
            v20 = v18;

            v47 = v8 ^ 1;
            v42 = v20;
            v33 = nscales - 1;
            v46 = v19;
          }
          -[LKTFlowGPU _enqueueFlowConsistencyWithCommandBuffer:in_uv0_tex:in_uv1_tex:out_uv_tex:](self, "_enqueueFlowConsistencyWithCommandBuffer:in_uv0_tex:in_uv1_tex:out_uv_tex:", v40, v19, v13, v14);
          -[LKTFlowGPU _doSolverWithCommandBuffer:scale:in_uv_tex:in_G0_tex:in_G1_tex:in_C0_tex:in_C1_tex:out_uv_tex:out_w_tex:](self, "_doSolverWithCommandBuffer:scale:in_uv_tex:in_G0_tex:in_G1_tex:in_C0_tex:in_C1_tex:out_uv_tex:out_w_tex:", v40, v15, v14, v45, v44, v43, v41, v20, 0);

          ++v12;
          v5 = v46;
          v8 = v47;
          v6 = v42;
        }
        while (v12 < self->_nwarpings);
      }

      --nscales;
    }
    while (v30 > 1);
  }

  return 0;
}

- (int)_createImagePyramidWithCommandBuffer:(id)a3 in_tex:(id)a4 I_idx:(int)a5
{
  id v8;
  id v9;
  _BOOL4 needConversionBGRA2YUVA;
  void *v11;
  void *v12;
  id *v13;
  _QWORD *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD v24[3];
  __int128 v25;
  uint64_t v26;
  _QWORD v27[3];

  v8 = a3;
  v9 = a4;
  needConversionBGRA2YUVA = self->_needConversionBGRA2YUVA;
  objc_msgSend(v8, "computeCommandEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = (id *)self->_I_tex[a5];
  if (needConversionBGRA2YUVA)
  {
    objc_msgSend(v11, "setComputePipelineState:", self->_computePipelines[0]);
    objc_msgSend(v12, "setTexture:atIndex:", v9, 0);
    objc_msgSend(v12, "setTexture:atIndex:", *v13, 1);
    v27[0] = (int)objc_msgSend(v9, "width");
    v27[1] = (int)objc_msgSend(v9, "height");
    v27[2] = 1;
    v25 = xmmword_1C9322A40;
    v26 = 1;
    v14 = v27;
  }
  else
  {
    objc_msgSend(v11, "setComputePipelineState:", self->_computePipelines[11]);
    objc_msgSend(v12, "setTexture:atIndex:", v9, 0);
    objc_msgSend(v12, "setTexture:atIndex:", *v13, 1);
    v15 = (int)objc_msgSend(*v13, "width");
    v16 = objc_msgSend(*v13, "height");
    v24[0] = v15;
    v24[1] = v16;
    v24[2] = 1;
    v25 = xmmword_1C9322A40;
    v26 = 1;
    v14 = v24;
  }
  objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", v14, &v25);
  objc_msgSend(v12, "endEncoding");

  if (self->_nscales >= 2)
  {
    v17 = 0;
    v18 = (char *)self + 80 * a5;
    do
    {
      v19 = &v18[8 * v17];
      v20 = *((_QWORD *)v19 + 56);
      v21 = *((id *)v19 + 55);
      -[LKTFlowGPU _downscale2XWithCommandBuffer:in_tex:out_tex:](self, "_downscale2XWithCommandBuffer:in_tex:out_tex:", v8, v21, v20);

      v22 = v17 + 2;
      ++v17;
    }
    while (v22 < self->_nscales);
  }

  return 0;
}

- (int)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  _QWORD v12[3];

  v6 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setComputePipelineState:", self->_computePipelines[1]);
  objc_msgSend(v7, "setTexture:atIndex:", v6, 0);
  v8 = (int)objc_msgSend(v6, "width");
  LODWORD(self) = objc_msgSend(v6, "height");

  v12[0] = v8;
  v12[1] = (int)self;
  v12[2] = 1;
  v10 = xmmword_1C9322A40;
  v11 = 1;
  objc_msgSend(v7, "dispatchThreads:threadsPerThreadgroup:", v12, &v10);
  objc_msgSend(v7, "endEncoding");

  return 0;
}

- (int)_downscale2XWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_computePipelines[2]);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
  v11 = (int)objc_msgSend(v8, "width");
  LODWORD(a3) = objc_msgSend(v8, "height");

  v15[0] = v11;
  v15[1] = (int)a3;
  v15[2] = 1;
  v13 = xmmword_1C9322A40;
  v14 = 1;
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v10, "endEncoding");

  return 0;
}

- (int)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_computePipelines[3]);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);

  v11 = (int)objc_msgSend(v9, "width");
  LODWORD(a3) = objc_msgSend(v9, "height");

  v15[0] = v11;
  v15[1] = (int)a3;
  v15[2] = 1;
  v13 = xmmword_1C9322A40;
  v14 = 1;
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v10, "endEncoding");

  return 0;
}

- (int)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_computePipelines[4]);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);

  v11 = (int)objc_msgSend(v9, "width");
  LODWORD(a3) = objc_msgSend(v9, "height");

  v15[0] = v11;
  v15[1] = (int)a3;
  v15[2] = 1;
  v13 = xmmword_1C9322A40;
  v14 = 1;
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v10, "endEncoding");

  return 0;
}

- (int)_doSolverWithCommandBuffer:(id)a3 scale:(int)a4 in_uv_tex:(id)a5 in_G0_tex:(id)a6 in_G1_tex:(id)a7 in_C0_tex:(id)a8 in_C1_tex:(id)a9 out_uv_tex:(id)a10 out_w_tex:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  unsigned int v22;
  const float *v28;
  float32x2_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  id v36;
  _QWORD v37[3];
  _QWORD v38[3];
  __int128 v39;
  uint64_t v40;
  _QWORD v41[3];
  _DWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  float32x2_t v46;
  uint64_t v47;
  uint64_t v48;
  _DWORD v49[3];

  v35 = a11;
  v17 = a10;
  v36 = a9;
  v34 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  LODWORD(a5) = objc_msgSend(v17, "width");
  LODWORD(a3) = objc_msgSend(v17, "height");
  v22 = ((int)a5 + LODWORD(self->_maxThreadExecutionWidth) - 1)
      / SLODWORD(self->_maxThreadExecutionWidth)
      * LODWORD(self->_maxThreadExecutionWidth);
  v49[0] = 1065353216;
  __asm { FMOV            V0.2S, #1.0 }
  v48 = _D0;
  +[LKTFlowGPU _computeScalingFactor:dst_tex:scale_xy_inv:coeff:](LKTFlowGPU, "_computeScalingFactor:dst_tex:scale_xy_inv:coeff:", v20, v17, &v48, v49);
  v42[0] = (_DWORD)a5;
  v42[1] = (_DWORD)a3;
  v43 = v22;
  v44 = v48;
  v45 = 0;
  v28 = (const float *)v49;
  v29 = vld1_dup_f32(v28);
  v46 = v29;
  v47 = 0;
  objc_msgSend(v21, "computeCommandEncoder");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setComputePipelineState:", self->_computePipelines[5]);
  objc_msgSend(v30, "setTexture:atIndex:", v20, 0);
  objc_msgSend(v30, "setTexture:atIndex:", v19, 1);

  objc_msgSend(v30, "setTexture:atIndex:", v18, 2);
  objc_msgSend(v30, "setTexture:atIndex:", v34, 3);

  objc_msgSend(v30, "setTexture:atIndex:", v36, 4);
  objc_msgSend(v30, "setBuffer:offset:atIndex:", self->_Adiagb_buf[0], 0, 0);
  objc_msgSend(v30, "setBuffer:offset:atIndex:", self->_Ixy_buf[0], 0, 1);
  objc_msgSend(v30, "setBuffer:offset:atIndex:", self->_idt_buf, 0, 2);
  objc_msgSend(v30, "setBytes:length:atIndex:", v42, 48, 3);
  v41[0] = (int)a5;
  v41[1] = (int)a3;
  v41[2] = 1;
  v39 = xmmword_1C9322A40;
  v40 = 1;
  objc_msgSend(v30, "dispatchThreads:threadsPerThreadgroup:", v41, &v39);
  objc_msgSend(v30, "endEncoding");

  objc_msgSend(v21, "computeCommandEncoder");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setComputePipelineState:", self->_computePipelines[6]);
  objc_msgSend(v31, "setBuffer:offset:atIndex:", self->_Adiagb_buf[0], 0, 0);
  objc_msgSend(v31, "setBuffer:offset:atIndex:", self->_Ixy_buf[0], 0, 1);
  objc_msgSend(v31, "setBuffer:offset:atIndex:", self->_Adiagb_buf[1], 0, 2);
  objc_msgSend(v31, "setBuffer:offset:atIndex:", self->_Ixy_buf[1], 0, 3);
  objc_msgSend(v31, "setBytes:length:atIndex:", v42, 48, 4);
  v38[0] = (int)a5;
  v38[1] = (int)a3;
  v38[2] = 1;
  v39 = xmmword_1C9322A40;
  v40 = 1;
  objc_msgSend(v31, "dispatchThreads:threadsPerThreadgroup:", v38, &v39);
  objc_msgSend(v31, "endEncoding");

  objc_msgSend(v21, "computeCommandEncoder");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "setComputePipelineState:", self->_computePipelines[7]);
  objc_msgSend(v32, "setBuffer:offset:atIndex:", self->_Adiagb_buf[1], 0, 0);
  objc_msgSend(v32, "setBuffer:offset:atIndex:", self->_Ixy_buf[1], 0, 1);
  objc_msgSend(v32, "setBuffer:offset:atIndex:", self->_idt_buf, 0, 2);
  objc_msgSend(v32, "setTexture:atIndex:", v20, 0);

  objc_msgSend(v32, "setTexture:atIndex:", v17, 1);
  objc_msgSend(v32, "setTexture:atIndex:", v35, 2);

  objc_msgSend(v32, "setBytes:length:atIndex:", v42, 48, 3);
  v37[0] = (int)a5;
  v37[1] = (int)a3;
  v37[2] = 1;
  v39 = xmmword_1C9322A40;
  v40 = 1;
  objc_msgSend(v32, "dispatchThreads:threadsPerThreadgroup:", v37, &v39);
  objc_msgSend(v32, "endEncoding");

  return 0;
}

- (int)_enqueueFlowConsistencyWithCommandBuffer:(id)a3 in_uv0_tex:(id)a4 in_uv1_tex:(id)a5 out_uv_tex:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  const float *v20;
  float32x2_t v21;
  float32x2_t v22;
  void *v23;
  uint64_t v24;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[3];
  _DWORD v29[2];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  float32x2_t v33;
  float32x2_t v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  LODWORD(a4) = objc_msgSend(v10, "width");
  v14 = objc_msgSend(v10, "height");
  __asm { FMOV            V0.2S, #1.0 }
  v37 = _D0;
  v38 = _D0;
  v36 = 1065353216;
  v35 = 1065353216;
  +[LKTFlowGPU _computeScalingFactor:dst_tex:scale_xy_inv:coeff:](LKTFlowGPU, "_computeScalingFactor:dst_tex:scale_xy_inv:coeff:", v12, v10, &v38, &v36);
  +[LKTFlowGPU _computeScalingFactor:dst_tex:scale_xy_inv:coeff:](LKTFlowGPU, "_computeScalingFactor:dst_tex:scale_xy_inv:coeff:", v11, v10, &v37, &v35);
  v30 = 0;
  v29[0] = (_DWORD)a4;
  v29[1] = v14;
  v31 = v38;
  v32 = v37;
  v20 = (const float *)&v36;
  v21 = vld1_dup_f32(v20);
  v22 = vld1_dup_f32((const float *)&v35);
  v33 = v21;
  v34 = v22;
  objc_msgSend(v13, "computeCommandEncoder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setComputePipelineState:", self->_computePipelines[8]);
  objc_msgSend(v23, "setTexture:atIndex:", v12, 0);

  objc_msgSend(v23, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v23, "setTexture:atIndex:", v10, 2);
  objc_msgSend(v23, "setBytes:length:atIndex:", v29, 48, 0);
  v24 = (int)objc_msgSend(v10, "width");
  LODWORD(v11) = objc_msgSend(v10, "height");

  v28[0] = v24;
  v28[1] = (int)v11;
  v28[2] = 1;
  v26 = xmmword_1C9322A40;
  v27 = 1;
  objc_msgSend(v23, "dispatchThreads:threadsPerThreadgroup:", v28, &v26);
  objc_msgSend(v23, "endEncoding");

  return 0;
}

- (int)_enqueueKeypointsFromFlowWithCommandBuffer:(id)a3 in_uv_fwd_tex:(id)a4 in_uv_bwd_tex:(id)a5 out_kpt_buf:(id)a6 block_size:(int)a7 bidirectional_error:(float)a8 out_num_keypoints:(unsigned __int16 *)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  int v21;
  void *v22;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[3];
  int v27;
  __int16 v28;
  __int16 v29;
  uint64_t v30;

  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (int)objc_msgSend(v18, "width") / a7;
  v21 = (int)objc_msgSend(v18, "height") / a7;
  v27 = a7;
  v29 = v21;
  v28 = v20;
  v30 = LODWORD(a8);
  objc_msgSend(v19, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setComputePipelineState:", self->_computePipelines[9]);
  objc_msgSend(v22, "setTexture:atIndex:", v18, 0);

  objc_msgSend(v22, "setTexture:atIndex:", v17, 1);
  objc_msgSend(v22, "setBuffer:offset:atIndex:", v16, 0, 0);

  objc_msgSend(v22, "setBytes:length:atIndex:", &v27, 16, 1);
  v26[0] = v20;
  v26[1] = v21;
  v26[2] = 1;
  v24 = xmmword_1C9322A40;
  v25 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v26, &v24);
  objc_msgSend(v22, "endEncoding");
  *a9 = v21 * v20;

  return 0;
}

- (int)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7
{
  __int128 v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  __int128 v29;
  uint64_t v30;
  _QWORD v31[3];
  _QWORD v32[2];
  __int128 v33;

  v32[1] = 0;
  v32[0] = *(_QWORD *)&self->_nlreg_radius;
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)&v17 = vdiv_f32(_D1, vadd_f32(*(float32x2_t *)&self->_nlreg_sigma_l, *(float32x2_t *)&self->_nlreg_sigma_l));
  DWORD2(v17) = DWORD1(v17);
  *((float *)&v17 + 3) = 1.0 / (float)(self->_nlreg_sigma_w + self->_nlreg_sigma_w);
  v33 = v17;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setComputePipelineState:", self->_computePipelines[10]);
  objc_msgSend(v22, "setTexture:atIndex:", v21, 0);
  objc_msgSend(v22, "setTexture:atIndex:", v20, 1);

  objc_msgSend(v22, "setTexture:atIndex:", v19, 2);
  objc_msgSend(v22, "setTexture:atIndex:", v18, 3);

  objc_msgSend(v22, "setBytes:length:atIndex:", v32, 32, 0);
  v23 = objc_msgSend(v21, "width");
  if (v23 >= 0)
    v24 = v23;
  else
    v24 = v23 + 1;
  v25 = (uint64_t)v24 >> 1;
  v26 = objc_msgSend(v21, "height");

  if (v26 >= 0)
    v27 = v26;
  else
    v27 = v26 + 1;
  v31[0] = v25;
  v31[1] = (uint64_t)v27 >> 1;
  v31[2] = 1;
  v29 = xmmword_1C9322A40;
  v30 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v31, &v29);
  objc_msgSend(v22, "endEncoding");

  return 0;
}

+ (void)_computeScalingFactor:(id)a1 dst_tex:(SEL)a2 scale_xy_inv:(id)a3 coeff:(id)a4
{
  uint64_t *v4;
  float *v5;
  float *v6;
  uint64_t *v7;
  id v9;
  float v10;
  float v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  uint64_t v17;
  uint64_t v18;
  float v24;
  id v25;

  v6 = v5;
  v7 = v4;
  v25 = a3;
  v9 = a4;
  v10 = (float)(unint64_t)objc_msgSend(v9, "width");
  v11 = v10 / (float)(unint64_t)objc_msgSend(v25, "width");
  v12 = objc_msgSend(v9, "height");
  v13 = objc_msgSend(v25, "height");
  LODWORD(v14) = 1.5;
  *(float *)&v15 = (float)v12 / (float)v13;
  if (v11 <= 1.5 || *(float *)&v15 <= 1.5)
  {
    v17 = objc_msgSend(v9, "width", v14, v15);
    if (v17 != objc_msgSend(v25, "width") || (v18 = objc_msgSend(v9, "height"), v18 != objc_msgSend(v25, "height")))
      +[LKTFlowGPU _computeScalingFactor:dst_tex:scale_xy_inv:coeff:].cold.1();
    __asm { FMOV            V0.2S, #1.0 }
    v24 = 1.0;
  }
  else
  {
    _D0 = 0x3F0000003F000000;
    v24 = 2.0;
  }
  *v6 = v24;
  *v7 = _D0;

}

- (BOOL)isValid
{
  return self->_isValid;
}

- (BOOL)needConversionBGRA2YUVA
{
  return self->_needConversionBGRA2YUVA;
}

- (CGSize)ref_size
{
  double width;
  double height;
  CGSize result;

  width = self->_ref_size.width;
  height = self->_ref_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)aux_size
{
  double width;
  double height;
  CGSize result;

  width = self->_aux_size.width;
  height = self->_aux_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int)nscales
{
  return self->_nscales;
}

- (int)streamFrameCount
{
  return self->_streamFrameCount;
}

- (int)nwarpings
{
  return self->_nwarpings;
}

- (void)setNwarpings:(int)a3
{
  self->_nwarpings = a3;
}

- (BOOL)useNonLocalRegularization
{
  return self->_useNonLocalRegularization;
}

- (int)nlreg_radius
{
  return self->_nlreg_radius;
}

- (void)setNlreg_radius:(int)a3
{
  self->_nlreg_radius = a3;
}

- (int)nlreg_padding
{
  return self->_nlreg_padding;
}

- (void)setNlreg_padding:(int)a3
{
  self->_nlreg_padding = a3;
}

- (float)nlreg_sigma_l
{
  return self->_nlreg_sigma_l;
}

- (void)setNlreg_sigma_l:(float)a3
{
  self->_nlreg_sigma_l = a3;
}

- (float)nlreg_sigma_c
{
  return self->_nlreg_sigma_c;
}

- (void)setNlreg_sigma_c:(float)a3
{
  self->_nlreg_sigma_c = a3;
}

- (float)nlreg_sigma_w
{
  return self->_nlreg_sigma_w;
}

- (void)setNlreg_sigma_w:(float)a3
{
  self->_nlreg_sigma_w = a3;
}

- (BOOL)isInverse
{
  return self->_isInverse;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t n;
  uint64_t ii;
  uint64_t jj;
  uint64_t kk;
  uint64_t mm;
  uint64_t nn;
  uint64_t i1;
  uint64_t i2;
  uint64_t i3;
  uint64_t i4;

  objc_storeStrong((id *)&self->_kpt_buf, 0);
  objc_storeStrong((id *)&self->_uv_bwd_tex_user_ref, 0);
  objc_storeStrong((id *)&self->_uv_fwd_tex_user_ref, 0);
  for (i = 0; i != -20; --i)
    objc_storeStrong((id *)&self->_uv_bwd_u32_alias_tex[1][i + 9], 0);
  for (j = 0; j != -20; --j)
    objc_storeStrong((id *)&self->_uv_fwd_u32_alias_tex[1][j + 9], 0);
  for (k = 0; k != -20; --k)
    objc_storeStrong((id *)&self->_uv_bwd_tex[1][k + 9], 0);
  for (m = 0; m != -20; --m)
    objc_storeStrong((id *)&self->_uv_fwd_tex[1][m + 9], 0);
  for (n = 0; n != -10; --n)
    objc_storeStrong((id *)&self->_w_tex[n + 9], 0);
  objc_storeStrong((id *)&self->_idt_buf, 0);
  for (ii = 0; ii != -2; --ii)
    objc_storeStrong((id *)&self->_Ixy_buf[ii + 1], 0);
  for (jj = 0; jj != -2; --jj)
    objc_storeStrong((id *)&self->_Adiagb_buf[jj + 1], 0);
  for (kk = 0; kk != -10; --kk)
    objc_storeStrong((id *)&self->_C1_tex[kk + 9], 0);
  for (mm = 0; mm != -10; --mm)
    objc_storeStrong((id *)&self->_C0_tex[mm + 9], 0);
  for (nn = 0; nn != -10; --nn)
    objc_storeStrong((id *)&self->_G1_tex[nn + 9], 0);
  for (i1 = 0; i1 != -10; --i1)
    objc_storeStrong((id *)&self->_G0_tex[i1 + 9], 0);
  for (i2 = 0; i2 != -20; --i2)
    objc_storeStrong((id *)&self->_I_u32_alias_tex[1][i2 + 9], 0);
  for (i3 = 0; i3 != -20; --i3)
    objc_storeStrong((id *)&self->_I_tex[1][i3 + 9], 0);
  for (i4 = 104; i4 != 8; i4 -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i4), 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:width:height:nscales:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "LKTFlowGPU Init failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithMetalContext:width:height:nscales:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Odd image dimensions are not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)newBufferWithPixelFormat:width:data:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Unidentified Metal format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)_setupPipelines
{
  *(_DWORD *)buf = 136315138;
  *a2 = "computePipeline";
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", buf, 0xCu);
}

- (void)_setupBuffer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "newBufferWithLength failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

+ (void)_computeScalingFactor:dst_tex:scale_xy_inv:coeff:.cold.1()
{
  __assert_rtn("+[LKTFlowGPU _computeScalingFactor:dst_tex:scale_xy_inv:coeff:]", "LKTFlowGPU.m", 1304, "(dst_tex.width == src_tex.width) && (dst_tex.height == src_tex.height)");
}

@end
