@implementation PISegmentationInwardFillProcessor

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x1E0C9E080];
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  char v15;

  v8 = a5;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metalCommandBuffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metalTexture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metalTexture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  v14 = v13 || v12 == 0;
  v15 = v14;
  if (v14)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Metal unavailable"), 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[PIParallaxInwardFillKernel fillSourceTexture:intoDestinationTexture:withCommandBuffer:](PIParallaxInwardFillKernel, "fillSourceTexture:intoDestinationTexture:withCommandBuffer:", v11, v12, v10);
  }

  return v15 ^ 1;
}

@end
