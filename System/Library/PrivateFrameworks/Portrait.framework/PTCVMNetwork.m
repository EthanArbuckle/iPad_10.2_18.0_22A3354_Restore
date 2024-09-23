@implementation PTCVMNetwork

- (PTCVMNetwork)initWithMetalContext:(id)a3 colorSize:(id *)a4 effectUtil:(id)a5 util:(id)a6 useHighResNetwork:(BOOL)a7 sharedResources:(id)a8
{
  _BOOL4 v9;
  id v15;
  PTCVMNetwork *v16;
  PTCVMNetwork *v17;
  uint64_t v18;
  uint64_t v19;
  PTCVMNetwork *v20;
  char Bool;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  PTCVMNetwork *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  unint64_t var0;
  unint64_t var1;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSString *inRGBAName;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  PTEspressoGenericExecutor *v69;
  PTMetalContext *metalContext;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  PTEspressoGenericExecutor *v76;
  PTEspressoGenericExecutor *executor;
  NSObject *v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  MTLTexture *inRGBA;
  unint64_t v89;
  uint64_t v90;
  MTLTexture **disparityInOut;
  uint64_t inDispIndex;
  MTLTexture *v93;
  uint64_t v94;
  uint64_t outDispIndex;
  MTLTexture *v96;
  void *v97;
  uint64_t v98;
  MTLTexture *inRGBARotated;
  void *v100;
  uint64_t v101;
  MTLTexture *outDisparityRotated;
  NSObject *v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  NSString *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  PTEspressoGenericExecutor *v147;
  void *v148;
  unint64_t v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  void *v156;
  id v157;
  id v158;
  id v159;
  id v160;
  objc_super v161;
  objc_super v162;
  _BYTE buf[24];
  uint64_t v164;
  __int16 v165;
  void *v166;
  __int16 v167;
  uint64_t v168;
  __int16 v169;
  uint64_t v170;
  __int16 v171;
  uint64_t v172;
  __int16 v173;
  uint64_t v174;
  __int16 v175;
  uint64_t v176;
  _QWORD v177[2];
  void *v178;
  _QWORD v179[4];

  v9 = a7;
  v179[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v159 = a5;
  v158 = a6;
  v160 = a8;
  v162.receiver = self;
  v162.super_class = (Class)PTCVMNetwork;
  v16 = -[PTCVMNetwork init](&v162, sel_init);
  if (v16)
  {
    v17 = v16;
    v157 = v15;
    if (v9)
      v18 = 3;
    else
      v18 = 2;
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    *(_QWORD *)&buf[16] = a4->var2;
    v19 = -[PTCVMNetwork getLayoutFromSize:](v16, "getLayoutFromSize:", buf);
    kdebug_trace();
    v161.receiver = v17;
    v161.super_class = (Class)PTCVMNetwork;
    v20 = -[PTCVMNetwork init](&v161, sel_init);
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      _PTLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      v22 = v160;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[PTCVMNetwork initWithMetalContext:colorSize:effectUtil:util:useHighResNetwork:sharedResources:].cold.9(v24, v28, v29, v30, v31, v32, v33, v34);
      v25 = 0;
      v15 = v157;
      v27 = v158;
      v26 = v159;
      goto LABEL_63;
    }
    PTKTraceInit();
    objc_storeStrong((id *)&v20->_metalContext, a3);
    v20->_useHighResNetwork = v9;
    objc_storeStrong((id *)&v20->_effectUtil, a5);
    objc_storeStrong((id *)&v20->_util, a6);
    v20->_frameId = 0;
    *(_QWORD *)&v20->_outDispIndex = 1;
    Bool = PTDefaultsPublicGetBool(CFSTR("harvesting.enabled"), 0);
    v22 = v160;
    if ((Bool & 1) != 0)
    {
      v154 = 0;
      v23 = 0;
      v24 = 0;
    }
    else
    {
      v154 = objc_opt_new();
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFCDF0]), "initWithInputPrioritization:andParameters:", v18, v154);
      if (!v35)
      {
        _PTLogSystem();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[PTCVMNetwork initWithMetalContext:colorSize:effectUtil:util:useHighResNetwork:sharedResources:].cold.8(v23, v57, v58, v59, v60, v61, v62, v63);
        v64 = 0;
        v24 = 0;
        v25 = 0;
        v15 = v157;
        v27 = v158;
        v26 = v159;
        v65 = (void *)v154;
        goto LABEL_62;
      }
      v24 = v35;
      -[NSObject inferenceDescriptor](v35, "inferenceDescriptor");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    var0 = a4->var0;
    var1 = a4->var1;
    v151 = var0;
    -[NSObject configurationNameForLayout:](v23, "configurationNameForLayout:", v19);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject networkURL](v23, "networkURL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "absoluteString");
    v40 = objc_claimAutoreleasedReturnValue();

    v155 = (void *)v40;
    v156 = v38;
    if (!v40)
    {
      _PTLogSystem();
      v49 = objc_claimAutoreleasedReturnValue();
      v15 = v157;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        -[PTCVMNetwork initWithMetalContext:colorSize:effectUtil:util:useHighResNetwork:sharedResources:].cold.1(v49, v50, v51, v52, v53, v54, v55, v56);
      v25 = 0;
      goto LABEL_61;
    }
    -[NSObject colorInput](v23, "colorInput");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "name");
    v42 = objc_claimAutoreleasedReturnValue();
    inRGBAName = v20->_inRGBAName;
    v20->_inRGBAName = (NSString *)v42;

    -[NSObject prevDisparityInput](v23, "prevDisparityInput");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "name");
    v153 = objc_claimAutoreleasedReturnValue();

    -[NSObject disparityOutput](v23, "disparityOutput");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "name");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v157;
    if ((Bool & 1) != 0)
    {
LABEL_31:
      executor = v20->_executor;
      if (!executor)
      {
        _PTLogSystem();
        v78 = objc_claimAutoreleasedReturnValue();
        v49 = v153;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          -[PTCVMNetwork initWithMetalContext:colorSize:effectUtil:util:useHighResNetwork:sharedResources:].cold.2(v78, v80, v81, v82, v83, v84, v85, v86);
        v25 = 0;
        goto LABEL_60;
      }
      -[PTEspressoGenericExecutor networkVersion](executor, "networkVersion");
      v78 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqualToString:](v78, "isEqualToString:", CFSTR("bkkidb647v_iteration_105001")))
      {
        v79 = 4;
      }
      else
      {
        if (!-[NSObject isEqualToString:](v78, "isEqualToString:", CFSTR("a9mp7cfxah_iteration_45000")))
        {
          v20->_networkVersionID = 0;
LABEL_41:
          -[PTEspressoGenericExecutor getInputResourceWithName:](v20->_executor, "getInputResourceWithName:", v20->_inRGBAName);
          v87 = objc_claimAutoreleasedReturnValue();
          inRGBA = v20->_inRGBA;
          v20->_inRGBA = (MTLTexture *)v87;

          if (v20->_inRGBA)
          {
            v89 = var1;
            -[PTEspressoGenericExecutor getInputResourceWithName:](v20->_executor, "getInputResourceWithName:", v153);
            v90 = objc_claimAutoreleasedReturnValue();
            disparityInOut = v20->_disparityInOut;
            inDispIndex = v20->_inDispIndex;
            v93 = v20->_disparityInOut[inDispIndex];
            v20->_disparityInOut[inDispIndex] = (MTLTexture *)v90;

            if (v20->_disparityInOut[v20->_inDispIndex])
            {
              -[PTEspressoGenericExecutor getOutputResourceWithName:](v20->_executor, "getOutputResourceWithName:", v46);
              v94 = objc_claimAutoreleasedReturnValue();
              outDispIndex = v20->_outDispIndex;
              v96 = disparityInOut[outDispIndex];
              disparityInOut[outDispIndex] = (MTLTexture *)v94;

              if (disparityInOut[v20->_outDispIndex])
              {
                v148 = v46;
                if (v151 >= v89)
                  goto LABEL_47;
                -[PTMetalContext textureUtil](v20->_metalContext, "textureUtil");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "createWithWidth:height:pixelFormat:", -[MTLTexture height](v20->_inRGBA, "height"), -[MTLTexture width](v20->_inRGBA, "width"), -[MTLTexture pixelFormat](v20->_inRGBA, "pixelFormat"));
                v98 = objc_claimAutoreleasedReturnValue();
                inRGBARotated = v20->_inRGBARotated;
                v20->_inRGBARotated = (MTLTexture *)v98;

                if (v20->_inRGBARotated)
                {
                  -[PTMetalContext textureUtil](v20->_metalContext, "textureUtil");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v100, "createWithWidth:height:pixelFormat:", -[MTLTexture height](v20->_disparityInOut[1], "height"), -[MTLTexture width](v20->_disparityInOut[1], "width"), -[MTLTexture pixelFormat](v20->_disparityInOut[1], "pixelFormat"));
                  v101 = objc_claimAutoreleasedReturnValue();
                  outDisparityRotated = v20->_outDisparityRotated;
                  v20->_outDisparityRotated = (MTLTexture *)v101;

                  if (!v20->_outDisparityRotated)
                  {
                    _PTLogSystem();
                    v134 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                      -[PTCVMNetwork initWithMetalContext:colorSize:effectUtil:util:useHighResNetwork:sharedResources:].cold.7(v134, v135, v136, v137, v138, v139, v140, v141);

                    v25 = 0;
                    goto LABEL_50;
                  }
LABEL_47:
                  _PTLogSystem();
                  v103 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
                  {
                    v142 = v20->_inRGBAName;
                    v152 = -[MTLTexture width](v20->_inRGBA, "width");
                    v150 = -[MTLTexture height](v20->_inRGBA, "height");
                    v143 = -[MTLTexture width](v20->_disparityInOut[1], "width");
                    v144 = -[MTLTexture height](v20->_disparityInOut[1], "height");
                    v145 = -[MTLTexture width](v20->_disparityInOut[0], "width");
                    v146 = -[MTLTexture height](v20->_disparityInOut[0], "height");
                    *(_DWORD *)buf = 138414338;
                    *(_QWORD *)&buf[4] = v142;
                    v22 = v160;
                    *(_WORD *)&buf[12] = 2048;
                    *(_QWORD *)&buf[14] = v152;
                    *(_WORD *)&buf[22] = 2048;
                    v164 = v150;
                    v165 = 2112;
                    v166 = v148;
                    v167 = 2048;
                    v168 = v143;
                    v169 = 2048;
                    v170 = v144;
                    v15 = v157;
                    v171 = 2112;
                    v172 = v153;
                    v173 = 2048;
                    v174 = v145;
                    v175 = 2048;
                    v176 = v146;
                    _os_log_debug_impl(&dword_1C9281000, v103, OS_LOG_TYPE_DEBUG, "Init disparity network: %@ (%lux%lu) %@ (%lux%lu) %@ (%lux%lu)", buf, 0x5Cu);
                  }

                  -[PTCVMNetwork reset](v20, "reset");
                  -[MTLTexture width](disparityInOut[v20->_outDispIndex], "width");
                  -[MTLTexture height](disparityInOut[v20->_outDispIndex], "height");
                  -[MTLTexture pixelFormat](disparityInOut[v20->_outDispIndex], "pixelFormat");
                  kdebug_trace();
                  v25 = v20;
LABEL_50:
                  v49 = v153;
                  v46 = v148;
LABEL_60:

LABEL_61:
                  v27 = v158;
                  v26 = v159;
                  v65 = (void *)v154;

                  v64 = v23;
LABEL_62:

LABEL_63:
                  goto LABEL_64;
                }
                _PTLogSystem();
                v104 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                  -[PTCVMNetwork initWithMetalContext:colorSize:effectUtil:util:useHighResNetwork:sharedResources:].cold.6(v104, v126, v127, v128, v129, v130, v131, v132);
              }
              else
              {
                _PTLogSystem();
                v104 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                  -[PTCVMNetwork initWithMetalContext:colorSize:effectUtil:util:useHighResNetwork:sharedResources:].cold.5(v104, v119, v120, v121, v122, v123, v124, v125);
              }
            }
            else
            {
              _PTLogSystem();
              v104 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                -[PTCVMNetwork initWithMetalContext:colorSize:effectUtil:util:useHighResNetwork:sharedResources:].cold.4(v104, v112, v113, v114, v115, v116, v117, v118);
            }
          }
          else
          {
            _PTLogSystem();
            v104 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              -[PTCVMNetwork initWithMetalContext:colorSize:effectUtil:util:useHighResNetwork:sharedResources:].cold.3(v104, v105, v106, v107, v108, v109, v110, v111);
          }

          v25 = 0;
          v49 = v153;
          goto LABEL_60;
        }
        v79 = 7;
      }
      v20->_networkVersionID = v79;
      goto LABEL_41;
    }
    v47 = v46;
    objc_msgSend(v160, "effectNetworkConfig");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = var1;
    if (v38 != v48)
    {
      objc_msgSend(v160, "effectNetworkConfig");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v38, "isEqualToString:", v46) & 1) == 0)
      {

LABEL_29:
        v147 = [PTEspressoGenericExecutor alloc];
        metalContext = v20->_metalContext;
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v155);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v179[0] = v20->_inRGBAName;
        v179[1] = v153;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v179, 2);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = v47;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v178, 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v177[0] = v153;
        v177[1] = v47;
        v22 = v160;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 2);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:](v147, "initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:", metalContext, v71, v72, v73, v74, 0, v156);
        v76 = v20->_executor;
        v20->_executor = (PTEspressoGenericExecutor *)v75;

        v15 = v157;
        v46 = v47;

        objc_msgSend(v160, "setEffectNetwork:", v20->_executor);
        objc_msgSend(v160, "setEffectNetworkConfig:", v156);
        objc_msgSend(v160, "setEffectNetworkPath:", v155);
        goto LABEL_30;
      }
    }
    objc_msgSend(v160, "effectNetworkPath");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v155, "isEqualToString:", v66);

    if (v156 == v48)
    {

      if (!v67)
        goto LABEL_29;
    }
    else
    {

      if ((v67 & 1) == 0)
        goto LABEL_29;
    }
    objc_msgSend(v160, "effectNetwork");
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = v20->_executor;
    v20->_executor = (PTEspressoGenericExecutor *)v68;

    v46 = v47;
LABEL_30:
    var1 = v149;
    goto LABEL_31;
  }
  v25 = 0;
  v27 = v158;
  v26 = v159;
  v22 = v160;
LABEL_64:

  return v25;
}

- (void)reset
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[PTMetalContext commandQueue](self->_metalContext, "commandQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _PTLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PTEffect updateEffectDelegate:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  -[PTEffectUtil clearTexture:outTex:](self->_effectUtil, "clearTexture:outTex:", v4, self->_disparityInOut[self->_inDispIndex]);
  -[PTEffectUtil clearTexture:outTex:](self->_effectUtil, "clearTexture:outTex:", v4, self->_disparityInOut[self->_outDispIndex]);
  objc_msgSend(v4, "commit");
  objc_msgSend(v4, "waitUntilScheduled");

}

- (id)outDisparity
{
  MTLTexture *outDisparityRotated;

  outDisparityRotated = self->_outDisparityRotated;
  if (!outDisparityRotated)
    outDisparityRotated = self->_disparityInOut[self->_outDispIndex];
  return outDisparityRotated;
}

- (BOOL)rotated
{
  return self->_outDisparityRotated != 0;
}

- (id)networkVersionString
{
  void *v2;
  uint64_t networkVersionID;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  networkVersionID = self->_networkVersionID;
  -[PTEspressoGenericExecutor networkVersion](self->_executor, "networkVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("CVM %i (%@)"), networkVersionID, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)getLayoutFromSize:(id *)a3
{
  uint64_t v3;
  unint64_t result;
  float v5;
  float v6;

  v3 = 0;
  result = 255;
  v5 = 3.4028e38;
  do
  {
    v6 = vabds_f32(flt_1C93230C0[v3], (float)a3->var0 / (float)a3->var1);
    if (v6 < v5)
    {
      result = qword_1C93230D0[v3];
      v5 = v6;
    }
    ++v3;
  }
  while (v3 != 4);
  return result;
}

- (void)bindColorInputPixelBuffer:(__CVBuffer *)a3
{
  MTLTexture *v5;
  MTLTexture *inRGBA;
  id v7;

  self->_inputPixelBuffer = a3;
  if (a3)
  {
    -[PTMetalContext device](self->_metalContext, "device");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[PTPixelBufferUtil createTextureFromPixelBuffer:device:](PTPixelBufferUtil, "createTextureFromPixelBuffer:device:", a3, v7);
    v5 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    inRGBA = self->_inRGBA;
    self->_inRGBA = v5;

  }
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_inRGBAAppleDepthRunner);
  CVPixelBufferRelease(self->_outDisparityAppleDepthRunner);
  CVPixelBufferRelease(self->_inTemporalDisparityAppleDepthRunner);
  v3.receiver = self;
  v3.super_class = (Class)PTCVMNetwork;
  -[PTCVMNetwork dealloc](&v3, sel_dealloc);
}

- (id)inRGBA
{
  MTLTexture *inRGBARotated;

  inRGBARotated = self->_inRGBARotated;
  if (!inRGBARotated)
    inRGBARotated = self->_inRGBA;
  return inRGBARotated;
}

- (id)inPrevDisparity
{
  return self->_disparityInOut[self->_inDispIndex];
}

- (unsigned)executeNetwork:(int64_t)a3
{
  unsigned int v4;
  int v5;
  NSObject *v6;
  int frameId;
  int v8;
  BOOL v9;
  int v10;
  int v11;
  void *v12;
  PTEspressoGenericExecutor *executor;
  unsigned int v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  PTUtil *util;
  void *v25;
  _QWORD v27[5];

  self->_frameIndex = a3;
  if (self->_inputPixelBuffer)
  {
    v4 = -[PTEspressoGenericExecutor bindInputResourceWithName:to:](self->_executor, "bindInputResourceWithName:to:", self->_inRGBAName);
    if (v4)
    {
      v5 = v4;
      _PTLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[PTCVMNetwork executeNetwork:].cold.2(v5, v6);

    }
  }
  -[PTEspressoGenericExecutor tensorSwap:](self->_executor, "tensorSwap:", self->_frameId);
  frameId = self->_frameId;
  v8 = frameId & 1;
  if (frameId < 0)
    v8 = -v8;
  v9 = __OFADD__(frameId, 1);
  v10 = frameId + 1;
  v11 = v10 & 1;
  if (v10 < 0 != v9)
    v11 = -v11;
  self->_outDispIndex = v11;
  self->_inDispIndex = v8;
  self->_frameId = v10;
  PTDefaultsGetDictionary();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCVMNetwork dumpNetworkInputWithDefaults:](self, "dumpNetworkInputWithDefaults:", v12);
  -[MTLTexture width](self->_disparityInOut[self->_outDispIndex], "width");
  -[MTLTexture height](self->_disparityInOut[self->_outDispIndex], "height");
  kdebug_trace();
  executor = self->_executor;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __31__PTCVMNetwork_executeNetwork___block_invoke;
  v27[3] = &unk_1E822A100;
  v27[4] = self;
  v14 = -[PTEspressoGenericExecutor executeAsync:](executor, "executeAsync:", v27);
  -[PTCVMNetwork dumpNetworkOutputWithDefaults:](self, "dumpNetworkOutputWithDefaults:", v12);
  if (self->_outDisparityRotated)
  {
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      _PTLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PTCVMNetwork executeNetwork:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    }
    util = self->_util;
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTUtil rotateTexture:inTex:outTex:rotationDegrees:](util, "rotateTexture:inTex:outTex:rotationDegrees:", v25, self->_disparityInOut[self->_outDispIndex], self->_outDisparityRotated, 4294967206);

    -[PTMetalContext commit](self->_metalContext, "commit");
  }

  return v14;
}

uint64_t __31__PTCVMNetwork_executeNetwork___block_invoke()
{
  return kdebug_trace();
}

- (BOOL)highResNetwork
{
  return self->_useHighResNetwork;
}

- (int)networkVersionID
{
  return self->_networkVersionID;
}

+ (id)lastNetworkVersion
{
  return CFSTR("N/A");
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_effectUtil, 0);
  objc_storeStrong((id *)&self->_inRGBAName, 0);
  objc_storeStrong((id *)&self->_outDisparityRotated, 0);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_disparityInOut[i + 1], 0);
  objc_storeStrong((id *)&self->_inRGBARotated, 0);
  objc_storeStrong((id *)&self->_inRGBA, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_reinjectDisparity, 0);
  objc_storeStrong((id *)&self->_executor, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Network not found", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Error PTEspressoGenericExecutor init nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 effectUtil:(uint64_t)a5 util:(uint64_t)a6 useHighResNetwork:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "ANE not found", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)executeNetwork:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)executeNetwork:(int)a1 .cold.2(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "status";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "Assertion failed %s %i", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

@end
