@implementation HighlightRecoveryProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  char v42;
  unsigned int v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend_objectAtIndexedSubscript_(v10, v11, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v10, v12, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_metalCommandBuffer(v8, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metalTexture(v51, v16, v17);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metalTexture(v8, v18, v19);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_metalTexture(v50, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v23, (uint64_t)CFSTR("dynamicParams"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v24, (uint64_t)CFSTR("iterations"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend_intValue(v49, v25, v26);
  objc_msgSend_objectForKeyedSubscript_(v9, v27, (uint64_t)CFSTR("tileSize"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_intValue(v46, v28, v29);
  objc_msgSend_objectForKeyedSubscript_(v9, v30, (uint64_t)CFSTR("scanKernel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v32, (uint64_t)CFSTR("diffuseKernel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v34, (uint64_t)CFSTR("copyBackKernel"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v36, (uint64_t)CFSTR("copyKernel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v38, (uint64_t)CFSTR("constants"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 1;
  LOBYTE(v44) = objc_msgSend_runHighlightRecoveryWithInputTexture_outputTexture_temporaryTexture_dynamicParams_iterations_tileSize_scanKernel_diffuseKernel_copyBackKernel_copyKernel_commandBuffer_constants_forCoreImage_(UniHighlightRecovery, v40, (uint64_t)v48, v47, v22, v45, v44, v43, v31, v33, v35, v37, v15, v39, v42);

  return v44;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x24BDBF8C0];
}

+ (int)outputFormat
{
  return *MEMORY[0x24BDBF8C0];
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

@end
