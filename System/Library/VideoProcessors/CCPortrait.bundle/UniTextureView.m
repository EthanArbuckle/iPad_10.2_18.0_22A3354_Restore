@implementation UniTextureView

- (UniTextureView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UniTextureView;
  return -[UniKernel init](&v3, sel_init);
}

- (UniTextureView)initWithDevice:(id)a3
{
  id v4;
  UniTextureView *v5;
  const char *v6;
  UniTextureView *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UniTextureView;
  v5 = -[UniKernel init](&v9, sel_init);
  v7 = v5;
  if (v5)
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);

  return v7;
}

- (id)sibling:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;

  v4 = a3;
  if (!v4)
    sub_24B6F2CBC();
  v7 = v4;
  if ((objc_msgSend_usage(v4, v5, v6) & 0x10) == 0)
    sub_24B6F2CE4();
  v10 = objc_msgSend_pixelFormat(v7, v8, v9);
  if (v10 > 30)
  {
    switch(v10)
    {
      case 31:
        v13 = 30;
        goto LABEL_17;
      case 70:
        v13 = 71;
        goto LABEL_17;
      case 71:
        v13 = 70;
        goto LABEL_17;
    }
LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
  if (v10 == 10)
  {
    v13 = 11;
    goto LABEL_17;
  }
  if (v10 == 11)
  {
    v13 = 10;
    goto LABEL_17;
  }
  if (v10 != 30)
    goto LABEL_16;
  v13 = 31;
LABEL_17:
  objc_msgSend_inputs(self, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)CFSTR("desiredFormat"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = objc_msgSend_unsignedIntegerValue(v16, v17, v18);
  }
  if (!v13)
    sub_24B6F2D0C();
  objc_msgSend_parentTexture(v7, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v19;
  if (v19 && objc_msgSend_pixelFormat(v19, v20, v21) == v13)
    v23 = v22;
  else
    v23 = (id)objc_msgSend_newTextureViewWithPixelFormat_(v7, v20, v13);
  v24 = v23;

  return v24;
}

- (id)run:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  _QWORD v54[3];

  v54[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_inputs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v7, v8, *MEMORY[0x24BDBF9C8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    sub_24B6F2D34();
  objc_msgSend_device(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  if (v4)
    v16 = v4;
  else
    v16 = (id)objc_msgSend_newCommandQueue(v12, v13, v14);
  v19 = v16;
  objc_msgSend_commandBuffer(v16, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mk(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_label(v23, v24, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    objc_msgSend_mk(self, v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_label(v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLabel_(v20, v33, (uint64_t)v32);

  }
  else
  {
    v34 = (void *)objc_opt_class();
    objc_msgSend_description(v34, v35, v36);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLabel_(v20, v37, (uint64_t)v29);
  }

  objc_msgSend_inputs(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v40, v41, *MEMORY[0x24BDBF960]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__mtlTextureForImage_(UniKernel, v43, (uint64_t)v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v44)
    sub_24B6F2D5C();
  v47 = v44;
  v48 = objc_msgSend_pixelFormat(v44, v45, v46);
  if (v48 == objc_msgSend_pixelFormat(v9, v49, v50))
    sub_24B6F2D84();
  v54[0] = v20;
  v54[1] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v51, (uint64_t)v54, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
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
  objc_msgSend_objectForKeyedSubscript_(v4, v5, *MEMORY[0x24BDBF960]);
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
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  const char *v43;
  char *v44;
  const char *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  const char *v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  UniImage *v61;
  const char *v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  void *v79;
  id v80;
  _QWORD v81[2];

  v81[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7 = (void *)objc_msgSend_copy(self, v5, v6);
  objc_msgSend_inputs(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDBF960];
  objc_msgSend_objectForKeyedSubscript_(v10, v12, *MEMORY[0x24BDBF960]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__ciImageForInput_(v7, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    sub_24B6F2DAC();
  v79 = v4;
  v16 = v15;
  objc_msgSend_inputs(v7, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)CFSTR("desiredFormat"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v16;
  if (!v21)
    goto LABEL_17;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v25 = v21;
  else
    v25 = 0;
  v28 = v25;
  v29 = 0;
  if ((isKindOfClass & 1) != 0)
    v29 = objc_msgSend_unsignedIntegerValue(v21, v26, v27, v4);
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v26, (uint64_t)CFSTR("ur_sRGB_to_Linear"), v79);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v31, (uint64_t)CFSTR("ur_Linear_to_sRGB"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 == 70)
  {
    objc_msgSend_extent(v16, v32, v33);
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v80 = v16;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v54, (uint64_t)&v80, 1);
    v44 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_arguments_(v34, v55, (uint64_t)v44, v47, v49, v51, v53);
    goto LABEL_12;
  }
  if (v29 == 71)
  {
    objc_msgSend_extent(v16, v32, v33);
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v81[0] = v16;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v43, (uint64_t)v81, 1);
    v44 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_arguments_(v30, v45, (uint64_t)v44, v36, v38, v40, v42);
LABEL_12:
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  uni_logger_api();
  v44 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
    sub_24B6F2DD4((uint64_t)v21, v44);
  v23 = v16;
LABEL_16:

  if (!v23)
  {
LABEL_19:
    v61 = [UniImage alloc];
    v58 = (void *)objc_msgSend_initWithKernel_(v61, v62, (uint64_t)v7);
    goto LABEL_20;
  }
LABEL_17:
  objc_msgSend_imageWithCIImage_(UniImage, v22, (uint64_t)v23, v79);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v56)
    goto LABEL_19;
  v58 = v56;
  objc_msgSend_setKernel_(v56, v57, (uint64_t)v7);
LABEL_20:
  objc_msgSend_inputs(v7, v59, v60);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v63, v64, v11);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mtlTextureForImage_(UniKernel, v66, (uint64_t)v65);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = (uint64_t *)MEMORY[0x24BDBF9C8];
  if (v67 && objc_msgSend_conformsToProtocol_(v67, v68, (uint64_t)&unk_2579B9140))
  {
    objc_msgSend_sibling_(v7, v68, (uint64_t)v67);
    v71 = objc_claimAutoreleasedReturnValue();

    if (v71)
    {
      objc_msgSend_inputs(v7, v68, v69);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v72, v73, v71, *v70);

      v67 = (void *)v71;
    }
    else
    {
      v67 = 0;
    }
  }
  objc_msgSend_inputs(v7, v68, v69);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v74, v75, *v70);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_(v58, v77, (uint64_t)v76);

  return v58;
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

@end
