@implementation UniGaussianBlur

- (UniGaussianBlur)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UniGaussianBlur;
  return -[UniKernel init](&v3, sel_init);
}

- (UniGaussianBlur)initWithDevice:(id)a3
{
  id v4;
  UniGaussianBlur *v5;
  const char *v6;
  UniGaussianBlur *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UniGaussianBlur;
  v5 = -[UniKernel init](&v9, sel_init);
  v7 = v5;
  if (v5)
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);

  return v7;
}

- (id)run:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  id v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  const char *v68;
  void *v69;
  id v71;
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[3];

  v74[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v73[0] = CFSTR("name");
  v73[1] = CFSTR("inputRadius");
  v74[0] = CFSTR("MPSImageGaussianBlur");
  objc_msgSend_inputs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDBF978];
  objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x24BDBF978]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)v74, v73, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_device(v4, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_findKernel_device_(UniDeviceCache, v16, (uint64_t)v12, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_inputs(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v21, v22, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v18, v24, (uint64_t)CFSTR("GaussianBlur_sigma_%@"), v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v17, v26, (uint64_t)v25);

  if (!v17)
    sub_24B6F10AC();
  if (v4)
  {
    v31 = v4;
  }
  else
  {
    objc_msgSend_device(self, v27, v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (id)objc_msgSend_newCommandQueue(v32, v33, v34);

  }
  objc_msgSend_commandBuffer(v31, v29, v30);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mk(self, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_label(v38, v39, v40);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    objc_msgSend_mk(self, v41, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_label(v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLabel_(v35, v48, (uint64_t)v47);

  }
  else
  {
    v49 = (void *)objc_opt_class();
    objc_msgSend_description(v49, v50, v51);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLabel_(v35, v52, (uint64_t)v44);
  }

  objc_msgSend_inputs(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v55, v56, *MEMORY[0x24BDBF960]);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mtlTextureForImage_(UniKernel, v58, (uint64_t)v57);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v59;

  objc_msgSend_inputs(self, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v62, v63, *MEMORY[0x24BDBF9C8]);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mtlTextureForImage_(UniKernel, v65, (uint64_t)v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v59)
    sub_24B6F10D4();
  if (!v66)
    sub_24B6F10FC();
  if (v59 == v66)
    objc_msgSend_encodeToCommandBuffer_inPlaceTexture_fallbackCopyAllocator_(v17, v67, (uint64_t)v35, &v71, 0);
  else
    objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(v17, v67, (uint64_t)v35, v59, v66);
  v72[0] = v35;
  v72[1] = v66;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v68, (uint64_t)v72, 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  return v69;
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
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  UniImage *v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7 = (void *)objc_msgSend_copy(self, v5, v6);
  objc_msgSend_inputs(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v11, *MEMORY[0x24BDBF960]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__ciImageForInput_(v7, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    sub_24B6F1124();
  objc_msgSend_extent(v14, v15, v16);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend_imageByClampingToExtent(v14, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = *MEMORY[0x24BDBF978];
  objc_msgSend_inputs(v7, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v30, v31, v56);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v32;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v33, (uint64_t)v57, &v56, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByApplyingFilter_withInputParameters_(v27, v35, (uint64_t)CFSTR("CIGaussianBlur"), v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByCroppingToRect_(v36, v37, v38, v18, v20, v22, v24);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39
    && (objc_msgSend_imageWithCIImage_(UniImage, v40, (uint64_t)v39),
        (v41 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v43 = v41;
    objc_msgSend_setKernel_(v41, v42, (uint64_t)v7);
  }
  else
  {
    v46 = [UniImage alloc];
    v43 = (void *)objc_msgSend_initWithKernel_(v46, v47, (uint64_t)v7);
  }
  objc_msgSend_inputs(v7, v44, v45);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v48, v49, *MEMORY[0x24BDBF9C8]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_(v43, v51, (uint64_t)v50);

  objc_msgSend_texture(v43, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v54)
    sub_24B6F114C();

  return v43;
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
