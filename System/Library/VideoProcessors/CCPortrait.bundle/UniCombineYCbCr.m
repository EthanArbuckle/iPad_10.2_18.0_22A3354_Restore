@implementation UniCombineYCbCr

- (UniCombineYCbCr)init
{
  abort();
}

- (UniCombineYCbCr)initWithDevice:(id)a3
{
  id v4;
  UniCombineYCbCr *v5;
  const char *v6;
  UniCombineYCbCr *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UniCombineYCbCr;
  v5 = -[UniKernel init](&v9, sel_init);
  v7 = v5;
  if (v5)
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);

  return v7;
}

- (id)run:(id)a3
{
  void *v3;
  const char *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_null(MEMORY[0x24BDBCEF8], a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v4, (uint64_t)v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  UniImage *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;

  v4 = a3;
  v7 = (void *)objc_msgSend_copy(self, v5, v6);
  objc_msgSend_inputs(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v11, *MEMORY[0x24BDBF960]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__ciImageForInput_(v7, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    sub_24B6F0B54();
  objc_msgSend_inputs(v7, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)CFSTR("inputChroma"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__ciImageForInput_(v7, v20, (uint64_t)v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    sub_24B6F0B7C();
  objc_msgSend_imageWithYImage_CrCbImage_CrCbScale_matrix_fullRange_colorSpace_(MEMORY[0x24BDBF660], v22, (uint64_t)v14, v21, 2, 709, 1, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24
    && (objc_msgSend_imageWithCIImage_(UniImage, v23, (uint64_t)v24),
        (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v27 = v25;
    objc_msgSend_setKernel_(v25, v26, (uint64_t)v7);
  }
  else
  {
    v30 = [UniImage alloc];
    v27 = (void *)objc_msgSend_initWithKernel_(v30, v31, (uint64_t)v7);
  }
  objc_msgSend_inputs(v7, v28, v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v32, v33, *MEMORY[0x24BDBF9C8]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_(v27, v35, (uint64_t)v34);

  objc_msgSend_texture(v27, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
    sub_24B6F0BA4();

  return v27;
}

- (id)inputNameArray
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDBF960];
  v3[1] = CFSTR("inputChroma");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v3, 2);
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
