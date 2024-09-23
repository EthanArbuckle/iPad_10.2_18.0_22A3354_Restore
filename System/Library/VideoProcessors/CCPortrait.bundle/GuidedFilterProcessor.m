@implementation GuidedFilterProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v6;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend_metalCommandBuffer(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_findKernel_device_(UniDeviceCache, v18, (uint64_t)v10, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v44 = v17;
    objc_msgSend_objectAtIndexedSubscript_(v9, v19, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_metalTexture(v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v45 = v9;
    objc_msgSend_objectAtIndexedSubscript_(v9, v25, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_metalTexture(v26, v27, v28);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_metalTexture(v11, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)v24;
    v48[0] = v24;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v32, (uint64_t)v48, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v34, (uint64_t)CFSTR("iterations"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      objc_msgSend_objectForKeyedSubscript_(v10, v35, (uint64_t)CFSTR("iterations"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_unsignedIntegerValue(v6, v37, v38);
    }
    else
    {
      v39 = 50;
    }
    v47 = v31;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v35, (uint64_t)&v47, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeToCommandBuffer_sourceTextureArray_guidanceTexture_constraintsTextureArray_numberOfIterations_destinationTextureArray_(v20, v41, (uint64_t)v14, v33, v46, 0, v39, v40);

    if (v36)
    v17 = v44;
    v9 = v45;
  }

  return v20 != 0;
}

+ (int)formatForInputAtIndex:(int)a3
{
  int *v3;

  if (a3)
  {
    if (a3 != 1)
      sub_24B6F1174();
    v3 = (int *)MEMORY[0x24BDBF868];
  }
  else
  {
    v3 = (int *)MEMORY[0x24BDBF8D0];
  }
  return *v3;
}

+ (int)outputFormat
{
  return *MEMORY[0x24BDBF8D0];
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  v6 = a4;
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CFSTR("imageExtents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    sub_24B6F119C();

  objc_msgSend_objectForKeyedSubscript_(v6, v9, (uint64_t)CFSTR("imageExtents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v10, v11, v12) <= (unint64_t)a3)
    sub_24B6F11C4();

  objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)CFSTR("imageExtents"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v14, v15, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CGRectValue(v16, v17, v18);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

@end
