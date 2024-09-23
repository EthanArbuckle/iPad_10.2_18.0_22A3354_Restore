@implementation _PIDynamicGuidedProcessorKernel

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  void *v19;
  int v20;
  int v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "metalCommandBuffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "region");
  v16 = (unint64_t)v15;
  objc_msgSend(v13, "region");
  v18 = (unint64_t)v17;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("guidedFilterEpsilon"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "floatValue");
  v21 = v20;

  LOBYTE(v31) = 1;
  LODWORD(v22) = v21;
  objc_msgSend(MEMORY[0x1E0CC6E98], "filterDescriptorWithWidth:height:arrayLength:kernelSpatialDiameter:kernelTemporalDiameter:epsilon:sourceChannels:guideChannels:preallocateIntermediates:", v16, v18, 1, 3, 1, 1, v22, 3, v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E90]), "initWithDevice:filterDescriptor:", v12, v23);
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v13, "metalTexture");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v27);

  objc_msgSend(v8, "metalTexture");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "addObject:", v28);
  objc_msgSend(v14, "metalTexture");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeToCommandBuffer:sourceTextureArray:guidanceTexture:constraintsTextureArray:numberOfIterations:destinationTextureArray:", v11, v25, v29, 0, 1, v26);

  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (int)outputFormat
{
  return *MEMORY[0x1E0C9E098];
}

+ (int)formatForInputAtIndex:(int)a3
{
  int *v3;

  if (a3)
  {
    if (a3 != 1)
      __assert_rtn("+[_PIDynamicGuidedProcessorKernel formatForInputAtIndex:]", "PIParallaxStyleRecipe.m", 720, "0");
    v3 = (int *)MEMORY[0x1E0C9E000];
  }
  else
  {
    v3 = (int *)MEMORY[0x1E0C9E098];
  }
  return *v3;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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

  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageExtents"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    __assert_rtn("+[_PIDynamicGuidedProcessorKernel roiForInput:arguments:outputRect:]", "PIParallaxStyleRecipe.m", 731, "arguments[@\"imageExtents\"]");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageExtents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v8, "count") <= a3)
    __assert_rtn("+[_PIDynamicGuidedProcessorKernel roiForInput:arguments:outputRect:]", "PIParallaxStyleRecipe.m", 732, "(int)[(NSArray *)arguments[@\"imageExtents\"] count] > input");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("imageExtents"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "CGRectValue");
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

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

@end
