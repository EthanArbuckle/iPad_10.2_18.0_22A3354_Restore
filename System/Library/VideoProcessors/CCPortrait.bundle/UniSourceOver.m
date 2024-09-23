@implementation UniSourceOver

- (UniSourceOver)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UniSourceOver;
  return -[UniKernel init](&v3, sel_init);
}

- (UniSourceOver)initWithDevice:(id)a3
{
  id v4;
  UniSourceOver *v5;
  const char *v6;
  UniSourceOver *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UniSourceOver;
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
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  double v49;
  unint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  double v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  void *v63;
  void *v65;
  void *v66;
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];

  v70[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_inputs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v7, v8, *MEMORY[0x24BDBF960]);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend__mtlTextureForImage_(UniKernel, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    sub_24B6F2AA4();
  v14 = v11;
  v66 = (void *)v9;
  objc_msgSend_device(v11, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v15;
  if (v4)
    v18 = v4;
  else
    v18 = (id)objc_msgSend_newCommandQueue(v15, v16, v17);
  v21 = v18;
  objc_msgSend_commandBuffer(v18, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_opt_class();
  objc_msgSend_description(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v22, v27, (uint64_t)v26);

  objc_msgSend_inputs(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v30, v31, (uint64_t)CFSTR("inputBlitImage"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__mtlTextureForImage_(UniKernel, v33, (uint64_t)v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputs(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v37, v38, (uint64_t)CFSTR("destOrigin"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_blitCommandEncoder(v22, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v69, 0, sizeof(v69));
  v68[0] = objc_msgSend_width(v34, v43, v44);
  v68[1] = objc_msgSend_height(v34, v45, v46);
  v68[2] = 1;
  objc_msgSend_X(v39, v47, v48);
  v50 = (unint64_t)v49;
  v53 = objc_msgSend_height(v14, v51, v52);
  objc_msgSend_Y(v39, v54, v55);
  v67[0] = v50;
  v67[1] = v53 - (objc_msgSend_height(v34, v57, v58) + (unint64_t)v56);
  v67[2] = 0;
  objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(v42, v59, (uint64_t)v34, 0, 0, v69, v68, v14, 0, 0, v67);
  objc_msgSend_endEncoding(v42, v60, v61);
  v70[0] = v22;
  v70[1] = v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v62, (uint64_t)v70, 2);
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
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  float v36;
  float v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  CGFloat v43;
  const char *v44;
  uint64_t v45;
  double v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  const char *v52;
  uint64_t v53;
  double v54;
  CGFloat v55;
  const char *v56;
  uint64_t v57;
  double v58;
  const char *v59;
  const char *v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  const char *v74;
  uint64_t v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  UniImage *v89;
  const char *v90;
  void *v91;
  const char *v92;
  void *v93;
  const char *v94;
  void *v96;
  CGAffineTransform v97;
  CGAffineTransform v98;
  CGAffineTransform v99;
  CGAffineTransform v100;
  uint64_t v101;
  _QWORD v102[3];
  CGRect v103;
  CGRect v104;

  v102[1] = *MEMORY[0x24BDAC8D0];
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
    sub_24B6F2ACC();
  v96 = v4;
  v16 = v15;
  objc_msgSend_inputs(v7, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v19, v20, (uint64_t)CFSTR("inputBlitImage"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__ciImageForInput_(v7, v22, (uint64_t)v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputs(v7, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v26, v27, (uint64_t)CFSTR("destOrigin"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(v7, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v31, v32, (uint64_t)CFSTR("_scale"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v36 = 1.0;
    if (v33)
    {
      objc_msgSend_floatValue(v33, v34, v35);
      v36 = v37;
    }
    CGAffineTransformMakeScale(&v100, 1.0, -1.0);
    objc_msgSend_imageByApplyingTransform_(v23, v38, (uint64_t)&v100);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v39, v40, v41);
    v43 = -v42;
    objc_msgSend_extent(v39, v44, v45);
    CGAffineTransformMakeTranslation(&v99, v43, -v46);
    objc_msgSend_imageByApplyingTransform_(v39, v47, (uint64_t)&v99);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = v36;
    if (v36 != 1.0)
    {
      CGAffineTransformMakeScale(&v98, v36, v36);
      objc_msgSend_imageByApplyingTransform_(v48, v52, (uint64_t)&v98);
      v53 = objc_claimAutoreleasedReturnValue();

      v48 = (void *)v53;
    }
    objc_msgSend_X(v28, v49, v50);
    v55 = v54 * v51;
    objc_msgSend_Y(v28, v56, v57);
    CGAffineTransformMakeTranslation(&v97, v55, v58 * v51);
    objc_msgSend_imageByApplyingTransform_(v48, v59, (uint64_t)&v97);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v101 = *MEMORY[0x24BDBF928];
    v102[0] = v16;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v60, (uint64_t)v102, &v101, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingFilter_withInputParameters_(v23, v62, (uint64_t)CFSTR("CISourceOverCompositing"), v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_extent(v63, v64, v65);
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v73 = v72;
    objc_msgSend_extent(v16, v74, v75);
    v104.origin.x = v76;
    v104.origin.y = v77;
    v104.size.width = v78;
    v104.size.height = v79;
    v103.origin.x = v67;
    v103.origin.y = v69;
    v103.size.width = v71;
    v103.size.height = v73;
    if (!CGRectEqualToRect(v103, v104))
    {
      objc_msgSend_extent(v16, v34, v80);
      objc_msgSend_imageByCroppingToRect_(v63, v81, v82);
      v83 = objc_claimAutoreleasedReturnValue();

      v63 = (void *)v83;
    }
    if (!v63)
      goto LABEL_14;
  }
  else
  {
    v63 = v16;
  }
  objc_msgSend_imageWithCIImage_(UniImage, v34, (uint64_t)v63);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v84)
  {
LABEL_14:
    v89 = [UniImage alloc];
    v86 = (void *)objc_msgSend_initWithKernel_(v89, v90, (uint64_t)v7);
    goto LABEL_15;
  }
  v86 = v84;
  objc_msgSend_setKernel_(v84, v85, (uint64_t)v7);
LABEL_15:
  objc_msgSend_inputs(v7, v87, v88);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v91, v92, v11);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_(v86, v94, (uint64_t)v93);

  return v86;
}

- (id)inputNameArray
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDBF960];
  v3[1] = CFSTR("inputBlitImage");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)outputNameArray
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDBF960];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
