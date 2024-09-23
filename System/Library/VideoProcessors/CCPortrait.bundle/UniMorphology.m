@implementation UniMorphology

- (UniMorphology)initWithDevice:(id)a3
{
  id v4;
  UniMorphology *v5;
  const char *v6;
  UniMorphology *v7;
  const char *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UniMorphology;
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
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  int v48;
  const char *v49;
  uint64_t v50;
  float v51;
  float v52;
  objc_class *v53;
  float v54;
  id v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  const char *v62;
  void *v63;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  _QWORD v69[3];

  v69[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_inputs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v7, v8, *MEMORY[0x24BDBF960]);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v12, v13, *MEMORY[0x24BDBF9C8]);
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend__mtlTextureForImage_(UniKernel, v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v16;
  objc_msgSend__mtlTextureForImage_(UniKernel, v17, v14);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    sub_24B6EDD38();
  v21 = (void *)v18;
  if (!v18)
    sub_24B6EDD60();
  objc_msgSend_inputs(self, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v22, v23, *MEMORY[0x24BDBF978]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v27, v28, (uint64_t)CFSTR("inputDoMin"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_device(v16, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v32;
  v65 = v14;
  v67 = (void *)v9;
  if (v4)
    v36 = v4;
  else
    v36 = (id)objc_msgSend_newCommandQueue(v32, v33, v34, v14, v9);
  v39 = v36;
  objc_msgSend_commandBuffer(v36, v37, v38, v65);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_opt_class();
  objc_msgSend_description(v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v40, v45, (uint64_t)v44);

  if (v29)
  {
    v48 = objc_msgSend_BOOLValue(v29, v46, v47);
    objc_msgSend_floatValue(v24, v49, v50);
    v52 = v51;
    if (!v48)
    {
      v53 = (objc_class *)MEMORY[0x24BDDE378];
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend_floatValue(v24, v46, v47);
    v52 = v54;
  }
  v53 = (objc_class *)MEMORY[0x24BDDE380];
LABEL_11:
  v55 = [v53 alloc];
  objc_msgSend_device(v4, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend_initWithDevice_kernelWidth_kernelHeight_(v55, v59, (uint64_t)v58, (unint64_t)v52, (unint64_t)v52);

  if (!v60)
    sub_24B6EDD88();
  if (v16 == v21)
    objc_msgSend_encodeToCommandBuffer_inPlaceTexture_fallbackCopyAllocator_(v60, v61, (uint64_t)v40, &v68, 0);
  else
    objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(v60, v61, (uint64_t)v40, v16, v21);
  v69[0] = v40;
  v69[1] = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v62, (uint64_t)v69, 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  return v63;
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
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  __CFString *v24;
  __CFString *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  UniImage *v55;
  const char *v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  _QWORD v62[2];
  _QWORD v63[3];
  CGRect v64;

  v63[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend_copy(self, a2, (uint64_t)a3);
  objc_msgSend_inputs(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v7, *MEMORY[0x24BDBF960]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__ciImageForInput_(v3, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputs(v3, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v13, v14, *MEMORY[0x24BDBF978]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(v3, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v18, v19, (uint64_t)CFSTR("inputDoMin"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v10;
  if (!v23)
  {
    v45 = 0;
    goto LABEL_14;
  }
  v24 = CFSTR("CIMorphologyRectangleMinimum");
  if (v20 && !objc_msgSend_BOOLValue(v20, v21, v22))
    v24 = CFSTR("CIMorphologyRectangleMaximum");
  v25 = v24;
  objc_msgSend_floatValue(v15, v26, v27);
  if (v30 <= 0.001)
  {

    v45 = v23;
  }
  else
  {
    objc_msgSend_extent(v23, v28, v29);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    objc_msgSend_imageByClampingToExtent(v23, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v62[0] = CFSTR("inputWidth");
    v62[1] = CFSTR("inputHeight");
    v63[0] = v15;
    v63[1] = v15;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v42, (uint64_t)v63, v62, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingFilter_withInputParameters_(v41, v44, (uint64_t)v25, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v64.origin.x = v32;
    v64.origin.y = v34;
    v64.size.width = v36;
    v64.size.height = v38;
    if (!CGRectIsInfinite(v64))
    {
      objc_msgSend_imageByCroppingToRect_(v45, v46, v47, v32, v34, v36, v38);
      v48 = objc_claimAutoreleasedReturnValue();

      v45 = (void *)v48;
    }

    if (!v45)
      goto LABEL_14;
  }
  objc_msgSend_imageWithCIImage_(UniImage, v49, (uint64_t)v45);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v50)
  {
LABEL_14:
    v55 = [UniImage alloc];
    v52 = (void *)objc_msgSend_initWithKernel_(v55, v56, (uint64_t)v3);
    goto LABEL_15;
  }
  v52 = v50;
  objc_msgSend_setKernel_(v50, v51, (uint64_t)v3);
LABEL_15:
  objc_msgSend_inputs(v3, v53, v54);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v57, v58, *MEMORY[0x24BDBF9C8]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_(v52, v60, (uint64_t)v59);

  return v52;
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
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->kernelMax, 0);
  objc_storeStrong((id *)&self->kernelMin, 0);
}

@end
