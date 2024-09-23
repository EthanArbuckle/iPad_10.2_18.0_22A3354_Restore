@implementation PTPersonSemanticsNetwork

- (id)inRGBA
{
  return self->_inRGBA;
}

- (id)espressoFileURLFor:(id)a3 prefix:(id)a4 chipId:(id)a5
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@.%@.espresso.net"), a3, a4, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

    if (v7)
      v8 = v5;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (PTPersonSemanticsNetwork)initWithMetalContext:(id)a3 effectUtil:(id)a4 sharedResources:(id)a5
{
  id v9;
  id v10;
  id v11;
  PTPersonSemanticsNetwork *v12;
  PTPersonSemanticsNetwork *v13;
  NSString *inRGBAName;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  PTPersonSemanticsNetwork *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *executor;
  PTEspressoGenericExecutor *v38;
  PTMetalContext *metalContext;
  void *v40;
  void *v41;
  uint64_t v42;
  PTEspressoGenericExecutor *v43;
  PTEspressoGenericExecutor *v44;
  uint64_t v45;
  MTLTexture *inRGBA;
  uint64_t v47;
  MTLTexture *outSkinMask;
  uint64_t v49;
  MTLTexture *outPersonMask;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
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
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v82;
  id v83;
  void *v84;
  id v85;
  uint64_t v86;
  void *v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  objc_super v93;
  _QWORD v94[2];
  NSString *v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v93.receiver = self;
  v93.super_class = (Class)PTPersonSemanticsNetwork;
  v12 = -[PTPersonSemanticsNetwork init](&v93, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_metalContext, a3);
    kdebug_trace();
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      _PTLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
        -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:].cold.8();
      v31 = 0;
      goto LABEL_54;
    }
    PTKTraceInit();
    objc_storeStrong((id *)&v13->_effectUtil, a4);
    inRGBAName = v13->_inRGBAName;
    v13->_inRGBAName = (NSString *)CFSTR("image__Placeholder__0");

    FTGetChipIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTPersonSemanticsNetwork espressoFileURLFor:prefix:chipId:](v13, "espressoFileURLFor:prefix:chipId:", CFSTR("/System/Library/ImagingNetworks"), CFSTR("personsemantics-preview-lowfps"), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    -[PTPersonSemanticsNetwork espressoFileURLFor:prefix:chipId:](v13, "espressoFileURLFor:prefix:chipId:", CFSTR("/System/Library/ImagingNetworks"), CFSTR("personsemantics-preview"), v15);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!(v16 | v17))
    {
      v87 = v15;
      v82 = v11;
      _PTLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:].cold.7();
      v83 = v10;
      v85 = v9;

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "contentsOfDirectoryAtPath:error:", CFSTR("/System/Library/ImagingNetworks"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
      if (!v22)
      {
        v24 = 0;
        v16 = 0;
        goto LABEL_26;
      }
      v23 = v22;
      v24 = 0;
      v16 = 0;
      v25 = *(_QWORD *)v90;
      while (1)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v90 != v25)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
          if (objc_msgSend(v27, "hasSuffix:", CFSTR(".espresso.net")))
          {
            if (objc_msgSend(v27, "containsString:", CFSTR("personsemantics-preview-lowfps")))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/System/Library/ImagingNetworks"), v27);
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = (void *)v16;
              v16 = v28;
            }
            else
            {
              if (!objc_msgSend(v27, "containsString:", CFSTR("personsemantics-preview")))
                continue;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/System/Library/ImagingNetworks"), v27);
              v30 = objc_claimAutoreleasedReturnValue();
              v29 = v24;
              v24 = (void *)v30;
            }

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
        if (!v23)
        {
LABEL_26:

          v10 = v83;
          v9 = v85;
          v11 = v82;
          v15 = v87;
          v32 = v24;
          goto LABEL_27;
        }
      }
    }
    v32 = (void *)v17;
LABEL_27:
    v33 = (void *)v16;
    if (v16 || (v33 = v32) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v33);
      v34 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "segmentationNetwork");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(v11, "segmentationNetwork");
        v36 = objc_claimAutoreleasedReturnValue();
        executor = v13->_executor;
        v13->_executor = (PTEspressoGenericExecutor *)v36;
      }
      else
      {
        v84 = v32;
        v86 = v16;
        v88 = v15;
        +[PTInference ANEConfigForAsynchronousWork](PTInference, "ANEConfigForAsynchronousWork");
        executor = (void *)objc_claimAutoreleasedReturnValue();
        v38 = [PTEspressoGenericExecutor alloc];
        metalContext = v13->_metalContext;
        v95 = v13->_inRGBAName;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v94[0] = CFSTR("skin:0");
        v94[1] = CFSTR("person:0");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[PTEspressoGenericExecutor initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:](v38, "initWithMetalContext:url:inputNames:outputNames:tensorSwapNames:reshapeNetworkSize:configuration:ANEConfig:", metalContext, v34, v40, v41, 0, 0, 0, executor);
        v43 = v13->_executor;
        v13->_executor = (PTEspressoGenericExecutor *)v42;

        if (!v13->_executor)
        {
          _PTLogSystem();
          v59 = objc_claimAutoreleasedReturnValue();
          v32 = v84;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:].cold.2(v59, v60, v61, v62, v63, v64, v65, v66);

          v31 = 0;
          v16 = v86;
          v15 = v88;
          goto LABEL_53;
        }
        objc_msgSend(v11, "setSegmentationNetwork:");
        v16 = v86;
        v15 = v88;
        v32 = v84;
      }

      kdebug_trace();
      v44 = v13->_executor;
      if (v44)
      {
        -[PTEspressoGenericExecutor getInputResourceWithName:](v44, "getInputResourceWithName:", v13->_inRGBAName);
        v45 = objc_claimAutoreleasedReturnValue();
        inRGBA = v13->_inRGBA;
        v13->_inRGBA = (MTLTexture *)v45;

        if (v13->_inRGBA)
        {
          -[PTEspressoGenericExecutor getOutputResourceWithName:](v13->_executor, "getOutputResourceWithName:", CFSTR("skin:0"));
          v47 = objc_claimAutoreleasedReturnValue();
          outSkinMask = v13->_outSkinMask;
          v13->_outSkinMask = (MTLTexture *)v47;

          if (v13->_outSkinMask)
          {
            -[PTEspressoGenericExecutor getOutputResourceWithName:](v13->_executor, "getOutputResourceWithName:", CFSTR("person:0"));
            v49 = objc_claimAutoreleasedReturnValue();
            outPersonMask = v13->_outPersonMask;
            v13->_outPersonMask = (MTLTexture *)v49;

            if (v13->_outPersonMask)
            {
              v31 = v13;
LABEL_53:

LABEL_54:
              goto LABEL_55;
            }
            _PTLogSystem();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:].cold.6(v51, v74, v75, v76, v77, v78, v79, v80);
          }
          else
          {
            _PTLogSystem();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:].cold.5(v51, v67, v68, v69, v70, v71, v72, v73);
          }
        }
        else
        {
          _PTLogSystem();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:].cold.4(v51, v52, v53, v54, v55, v56, v57, v58);
        }
      }
      else
      {
        _PTLogSystem();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:].cold.3();
      }

    }
    else
    {
      _PTLogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:].cold.1();
    }
    v31 = 0;
    goto LABEL_53;
  }
  v31 = 0;
LABEL_55:

  return v31;
}

- (id)outSkinMask
{
  return self->_outSkinMask;
}

- (id)outPersonMask
{
  return self->_outPersonMask;
}

- (unsigned)executeNetwork:(id)a3
{
  id v4;
  PTEspressoGenericExecutor *executor;
  _QWORD v7[5];

  v4 = a3;
  kdebug_trace();
  executor = self->_executor;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__PTPersonSemanticsNetwork_executeNetwork___block_invoke;
  v7[3] = &unk_1E822A100;
  v7[4] = self;
  LODWORD(self) = -[PTEspressoGenericExecutor executeAsync:metalContext:](executor, "executeAsync:metalContext:", v7, v4);

  return self;
}

void __43__PTPersonSemanticsNetwork_executeNetwork___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "commandQueue");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hash");
  kdebug_trace();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectUtil, 0);
  objc_storeStrong((id *)&self->_inRGBAName, 0);
  objc_storeStrong((id *)&self->_outPersonMask, 0);
  objc_storeStrong((id *)&self->_outSkinMask, 0);
  objc_storeStrong((id *)&self->_inRGBA, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_executor, 0);
}

- (void)initWithMetalContext:effectUtil:sharedResources:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "personsemantics not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 sharedResources:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:effectUtil:sharedResources:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Error PTEspressoGenericExecutor init nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 sharedResources:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 sharedResources:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 sharedResources:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:effectUtil:sharedResources:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Cannot find personsemantics network. Using file search to find network", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithMetalContext:effectUtil:sharedResources:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "ANE not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end
