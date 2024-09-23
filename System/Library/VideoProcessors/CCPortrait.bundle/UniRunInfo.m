@implementation UniRunInfo

- (id)_init
{
  UniRunInfo *v2;
  UniRunInfo *v3;
  MTLBuffer *indirectBuffer;
  NSNumber *indirectBufferOffset;
  NSArray *threadsPerThreadgroup;
  NSArray *v7;
  NSArray *threadsPerGrid;
  NSArray *threadgroupsPerGrid;
  NSArray *extent;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UniRunInfo;
  v2 = -[UniRunInfo init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    indirectBuffer = v2->_indirectBuffer;
    v2->_indirectBuffer = 0;

    indirectBufferOffset = v3->_indirectBufferOffset;
    v3->_indirectBufferOffset = 0;

    threadsPerThreadgroup = v3->_threadsPerThreadgroup;
    v7 = (NSArray *)MEMORY[0x24BDBD1A8];
    v3->_threadsPerThreadgroup = (NSArray *)MEMORY[0x24BDBD1A8];

    threadsPerGrid = v3->_threadsPerGrid;
    v3->_threadsPerGrid = v7;

    threadgroupsPerGrid = v3->_threadgroupsPerGrid;
    v3->_threadgroupsPerGrid = 0;

    objc_storeWeak((id *)&v3->_image, 0);
    extent = v3->_extent;
    v3->_extent = v7;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v12 = (void *)objc_msgSend__init(v7, v8, v9);
  if (v12)
  {
    objc_msgSend_indirectBuffer(self, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIndirectBuffer_(v12, v14, (uint64_t)v13);

    objc_msgSend_image(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setImage_(v12, v18, (uint64_t)v17);

    objc_msgSend_indirectBufferOffset(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIndirectBufferOffset_(v12, v22, (uint64_t)v21);

    objc_msgSend_threadsPerGrid(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setThreadsPerGrid_(v12, v26, (uint64_t)v25);

    objc_msgSend_threadsPerThreadgroup(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setThreadsPerThreadgroup_(v12, v30, (uint64_t)v29);

    objc_msgSend_threadgroupsPerGrid(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setThreadgroupsPerGrid_(v12, v34, (uint64_t)v33);

    objc_msgSend_extent(self, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExtent_(v12, v38, (uint64_t)v37);

  }
  return v12;
}

- (UniRunInfo)initWithImage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  UniRunInfo *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  unint64_t v48;
  const char *v49;
  uint64_t v50;
  unint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  _QWORD v64[3];
  _QWORD v65[4];

  v65[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = (UniRunInfo *)objc_msgSend__init(self, v5, v6);
  if (v9)
  {
    objc_msgSend_texture(v4, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernel(v4, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v16 = (void *)v13;
      objc_msgSend_kernel(v4, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mk(v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && v20)
      {
        objc_msgSend_setImage_(v9, v21, (uint64_t)v4);
        objc_msgSend_setIndirectBuffer_(v9, v22, 0);
        objc_msgSend_setIndirectBufferOffset_(v9, v23, 0);
        v24 = (void *)MEMORY[0x24BDD16E0];
        v27 = objc_msgSend_width(v10, v25, v26);
        objc_msgSend_numberWithUnsignedInteger_(v24, v28, v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = v29;
        v30 = (void *)MEMORY[0x24BDD16E0];
        v33 = objc_msgSend_height(v10, v31, v32);
        objc_msgSend_numberWithUnsignedInteger_(v30, v34, v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v65[1] = v35;
        v65[2] = &unk_251C9CD20;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v36, (uint64_t)v65, 3);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setThreadsPerGrid_(v9, v38, (uint64_t)v37);

        v39 = (void *)MEMORY[0x24BDD16E0];
        v42 = objc_msgSend_threadExecutionWidth(v20, v40, v41);
        objc_msgSend_numberWithUnsignedInteger_(v39, v43, v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = v44;
        v45 = (void *)MEMORY[0x24BDD16E0];
        v48 = objc_msgSend_maxTotalThreadsPerThreadgroup(v20, v46, v47);
        v51 = objc_msgSend_threadExecutionWidth(v20, v49, v50);
        objc_msgSend_numberWithUnsignedInteger_(v45, v52, v48 / v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v64[1] = v53;
        v64[2] = &unk_251C9CD20;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v54, (uint64_t)v64, 3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setThreadsPerThreadgroup_(v9, v56, (uint64_t)v55);

        objc_msgSend_setThreadgroupsPerGrid_(v9, v57, 0);
        objc_msgSend_image(v4, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        sub_24B6E72A4(v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setExtent_(v9, v62, (uint64_t)v61);

        goto LABEL_8;
      }
    }
    else
    {
      v20 = 0;
    }

    v9 = 0;
  }
LABEL_8:

  return v9;
}

- (UniRunInfo)initWithImageDiv2:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  UniRunInfo *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  unint64_t v27;
  const char *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  unint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  unint64_t v48;
  const char *v49;
  uint64_t v50;
  unint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  _QWORD v64[3];
  _QWORD v65[4];

  v65[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = (UniRunInfo *)objc_msgSend__init(self, v5, v6);
  if (v9)
  {
    objc_msgSend_texture(v4, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernel(v4, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v16 = (void *)v13;
      objc_msgSend_kernel(v4, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mk(v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && v20)
      {
        objc_msgSend_setImage_(v9, v21, (uint64_t)v4);
        objc_msgSend_setIndirectBuffer_(v9, v22, 0);
        objc_msgSend_setIndirectBufferOffset_(v9, v23, 0);
        v24 = (void *)MEMORY[0x24BDD16E0];
        v27 = objc_msgSend_width(v10, v25, v26);
        objc_msgSend_numberWithUnsignedInteger_(v24, v28, v27 >> 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = v29;
        v30 = (void *)MEMORY[0x24BDD16E0];
        v33 = objc_msgSend_height(v10, v31, v32);
        objc_msgSend_numberWithUnsignedInteger_(v30, v34, v33 >> 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v65[1] = v35;
        v65[2] = &unk_251C9CD20;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v36, (uint64_t)v65, 3);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setThreadsPerGrid_(v9, v38, (uint64_t)v37);

        v39 = (void *)MEMORY[0x24BDD16E0];
        v42 = objc_msgSend_threadExecutionWidth(v20, v40, v41);
        objc_msgSend_numberWithUnsignedInteger_(v39, v43, v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = v44;
        v45 = (void *)MEMORY[0x24BDD16E0];
        v48 = objc_msgSend_maxTotalThreadsPerThreadgroup(v20, v46, v47);
        v51 = objc_msgSend_threadExecutionWidth(v20, v49, v50);
        objc_msgSend_numberWithUnsignedInteger_(v45, v52, v48 / v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v64[1] = v53;
        v64[2] = &unk_251C9CD20;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v54, (uint64_t)v64, 3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setThreadsPerThreadgroup_(v9, v56, (uint64_t)v55);

        objc_msgSend_setThreadgroupsPerGrid_(v9, v57, 0);
        objc_msgSend_image(v4, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        sub_24B6E72A4(v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setExtent_(v9, v62, (uint64_t)v61);

        goto LABEL_8;
      }
    }
    else
    {
      v20 = 0;
    }

    v9 = 0;
  }
LABEL_8:

  return v9;
}

- (UniRunInfo)initWithThreadgroupsPerGrid:(id *)a3 threadsPerThreadGroup:(id *)a4
{
  UniRunInfo *v6;
  const char *v7;
  UniRunInfo *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  unint64_t var0;
  unint64_t var1;
  unint64_t var2;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = (UniRunInfo *)objc_msgSend__init(self, a2, (uint64_t)a3);
  v8 = v6;
  if (v6)
  {
    objc_msgSend_setImage_(v6, v7, 0);
    objc_msgSend_setIndirectBuffer_(v8, v9, 0);
    objc_msgSend_setIndirectBufferOffset_(v8, v10, 0);
    v11 = MEMORY[0x24BDBD1A8];
    objc_msgSend_setThreadsPerGrid_(v8, v12, MEMORY[0x24BDBD1A8]);
    var0 = a4->var0;
    var1 = a4->var1;
    var2 = a4->var2;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v16, var0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v18, var1, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v19;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v20, var2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v21;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v22, (uint64_t)&v39, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setThreadsPerThreadgroup_(v8, v24, (uint64_t)v23);
    v25 = a3->var0;
    v26 = a3->var1;
    v27 = a3->var2;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v28, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v30, v26, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v31;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v32, v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v33;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v34, (uint64_t)&v39, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setThreadgroupsPerGrid_(v8, v36, (uint64_t)v35);
    objc_msgSend_setExtent_(v8, v37, v11);
  }
  return v8;
}

- (void)setCoreImageOutputExtent:(CGRect)a3
{
  uint64_t v3;
  double height;
  double width;
  double y;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  _QWORD v21[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  v21[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, v3, a3.origin.x);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v9, v10, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v11;
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v12, v13, width);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v14;
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v15, v16, height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, (uint64_t)v21, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExtent_(self, v20, (uint64_t)v19);

}

- (UniRunInfo)initWithGridSize:(id *)a3 threadsPerThreadGroup:(id *)a4
{
  UniRunInfo *v6;
  const char *v7;
  UniRunInfo *v8;
  const char *v9;
  const char *v10;
  unint64_t var0;
  unint64_t var1;
  unint64_t var2;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = (UniRunInfo *)objc_msgSend__init(self, a2, (uint64_t)a3);
  v8 = v6;
  if (v6)
  {
    objc_msgSend_setImage_(v6, v7, 0);
    objc_msgSend_setIndirectBuffer_(v8, v9, 0);
    objc_msgSend_setIndirectBufferOffset_(v8, v10, 0);
    var0 = a3->var0;
    var1 = a3->var1;
    var2 = a3->var2;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v14, var0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v16, var1, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v17;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v18, var2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v19;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v20, (uint64_t)&v38, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setThreadsPerGrid_(v8, v22, (uint64_t)v21);
    v23 = a4->var0;
    v24 = a4->var1;
    v25 = a4->var2;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v26, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v28, v24, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v29;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v30, v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v31;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v32, (uint64_t)&v38, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setThreadsPerThreadgroup_(v8, v34, (uint64_t)v33);
    objc_msgSend_setThreadgroupsPerGrid_(v8, v35, 0);
    objc_msgSend_setExtent_(v8, v36, MEMORY[0x24BDBD1A8]);
  }
  return v8;
}

- (UniRunInfo)initWithGridSize:(id *)a3 kernel:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  UniRunInfo *v11;
  void *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  unint64_t var0;
  unint64_t var1;
  unint64_t var2;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  unint64_t v37;
  const char *v38;
  uint64_t v39;
  unint64_t v40;
  const char *v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  _QWORD v49[3];
  _QWORD v50[4];

  v50[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v11 = (UniRunInfo *)objc_msgSend__init(self, v7, v8);
  if (v11)
  {
    objc_msgSend_mk(v6, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setImage_(v11, v13, 0);
    objc_msgSend_setIndirectBuffer_(v11, v14, 0);
    objc_msgSend_setIndirectBufferOffset_(v11, v15, 0);
    var0 = a3->var0;
    var1 = a3->var1;
    var2 = a3->var2;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v19, var0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v20;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v21, var1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v22;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v23, var2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v24;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v25, (uint64_t)v50, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setThreadsPerGrid_(v11, v27, (uint64_t)v26);
    v28 = (void *)MEMORY[0x24BDD16E0];
    v31 = objc_msgSend_threadExecutionWidth(v12, v29, v30);
    objc_msgSend_numberWithUnsignedInteger_(v28, v32, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v33;
    v34 = (void *)MEMORY[0x24BDD16E0];
    v37 = objc_msgSend_maxTotalThreadsPerThreadgroup(v12, v35, v36);
    v40 = objc_msgSend_threadExecutionWidth(v12, v38, v39);
    objc_msgSend_numberWithUnsignedInteger_(v34, v41, v37 / v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v42;
    v49[2] = &unk_251C9CD20;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v43, (uint64_t)v49, 3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setThreadsPerThreadgroup_(v11, v45, (uint64_t)v44);

    objc_msgSend_setThreadgroupsPerGrid_(v11, v46, 0);
    objc_msgSend_setExtent_(v11, v47, MEMORY[0x24BDBD1A8]);

  }
  return v11;
}

- (UniRunInfo)initWithExtent:(CGRect)a3
{
  uint64_t v3;
  double height;
  double width;
  double y;
  double x;
  UniRunInfo *v8;
  const char *v9;
  UniRunInfo *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  _QWORD v33[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v33[4] = *MEMORY[0x24BDAC8D0];
  v8 = (UniRunInfo *)objc_msgSend__init(self, a2, v3);
  v10 = v8;
  if (v8)
  {
    objc_msgSend_setImage_(v8, v9, 0);
    objc_msgSend_setIndirectBuffer_(v10, v11, 0);
    objc_msgSend_setIndirectBufferOffset_(v10, v12, 0);
    v13 = MEMORY[0x24BDBD1A8];
    objc_msgSend_setThreadsPerGrid_(v10, v14, MEMORY[0x24BDBD1A8]);
    objc_msgSend_setThreadsPerThreadgroup_(v10, v15, v13);
    objc_msgSend_setThreadgroupsPerGrid_(v10, v16, v13);
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v17, v18, x);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v19;
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v20, v21, y);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v22;
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v23, v24, width);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v25;
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v26, v27, height);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v28;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v29, (uint64_t)v33, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExtent_(v10, v31, (uint64_t)v30);

  }
  return v10;
}

- (UniRunInfo)initWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  id v8;
  UniRunInfo *v9;
  const char *v10;
  UniRunInfo *v11;
  const char *v12;
  void *v13;
  const char *v14;
  unint64_t var0;
  unint64_t var1;
  unint64_t var2;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  UniRunInfo *v32;
  objc_super v34;
  _QWORD v35[4];

  v35[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (v8 && a5->var0 && a5->var1 && a5->var2)
  {
    v34.receiver = self;
    v34.super_class = (Class)UniRunInfo;
    v9 = -[UniRunInfo init](&v34, sel_init);
    v11 = v9;
    if (v9)
    {
      objc_msgSend_setIndirectBuffer_(v9, v10, (uint64_t)v8);
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v12, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setIndirectBufferOffset_(v11, v14, (uint64_t)v13);

      var0 = a5->var0;
      var1 = a5->var1;
      var2 = a5->var2;
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v18, var0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v19;
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v20, var1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v21;
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v22, var2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v23;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v24, (uint64_t)v35, 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setThreadsPerThreadgroup_(v11, v26, (uint64_t)v25);
      v27 = MEMORY[0x24BDBD1A8];
      objc_msgSend_setThreadsPerGrid_(v11, v28, MEMORY[0x24BDBD1A8]);
      objc_msgSend_setThreadgroupsPerGrid_(v11, v29, v27);
      objc_msgSend_setImage_(v11, v30, 0);
      objc_msgSend_setExtent_(v11, v31, v27);
    }
    self = v11;
    v32 = self;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)getThreadsPerThreadgroup
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  unsigned int v20;
  id v21;

  if (self[1].var1
    && (v4 = self,
        objc_opt_class(),
        self = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_opt_isKindOfClass(),
        (self & 1) != 0)
    && (self = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend_count((void *)v4[1].var1, v5, v6),
        self == ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)3))
  {
    objc_msgSend_objectAtIndexedSubscript_((void *)v4[1].var1, v7, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_unsignedIntValue(v21, v8, v9);
    objc_msgSend_objectAtIndexedSubscript_((void *)v4[1].var1, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_unsignedIntValue(v12, v13, v14);
    objc_msgSend_objectAtIndexedSubscript_((void *)v4[1].var1, v16, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_unsignedIntValue(v17, v18, v19);
    retstr->var0 = v10;
    retstr->var1 = v15;
    retstr->var2 = v20;

  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)getThreadgroupsPerGrid
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  unsigned int v20;
  id v21;

  if (self[2].var0
    && (v4 = self,
        objc_opt_class(),
        self = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_opt_isKindOfClass(),
        (self & 1) != 0)
    && (self = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend_count((void *)v4[2].var0, v5, v6),
        self == ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)3))
  {
    objc_msgSend_objectAtIndexedSubscript_((void *)v4[2].var0, v7, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_unsignedIntValue(v21, v8, v9);
    objc_msgSend_objectAtIndexedSubscript_((void *)v4[2].var0, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_unsignedIntValue(v12, v13, v14);
    objc_msgSend_objectAtIndexedSubscript_((void *)v4[2].var0, v16, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_unsignedIntValue(v17, v18, v19);
    retstr->var0 = v10;
    retstr->var1 = v15;
    retstr->var2 = v20;

  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return self;
}

- (void)dispatchOn:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  MTLBuffer *indirectBuffer;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;

  v4 = a3;
  if (v4)
  {
    v31 = 0uLL;
    v32 = 0;
    sub_24B6E8428(self->_threadsPerThreadgroup, (uint64_t *)&v31);
    v7 = v31;
    if (!(_QWORD)v31)
      sub_24B6F2914();
    v8 = *((_QWORD *)&v31 + 1);
    if (!*((_QWORD *)&v31 + 1))
      sub_24B6F293C();
    if (!v32)
      sub_24B6F2964();
    indirectBuffer = self->_indirectBuffer;
    if (indirectBuffer)
    {
      v10 = objc_msgSend_unsignedIntegerValue(self->_indirectBufferOffset, v5, v6);
      v29 = v31;
      v30 = v32;
      objc_msgSend_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_(v4, v11, (uint64_t)indirectBuffer, v10, &v29);
    }
    else
    {
      v29 = 0uLL;
      v30 = 0;
      sub_24B6E8428(self->_threadsPerGrid, (uint64_t *)&v29);
      v27 = 0uLL;
      v28 = 0;
      sub_24B6E8428(self->_threadgroupsPerGrid, (uint64_t *)&v27);
      v14 = v29;
      if (!((unint64_t)v29 | (unint64_t)v27))
        sub_24B6F298C();
      v15 = *((_QWORD *)&v29 + 1);
      if (!(*((_QWORD *)&v29 + 1) | *((_QWORD *)&v27 + 1)))
        sub_24B6F29B4();
      if (!(v30 | v28))
        sub_24B6F29DC();
      if ((_QWORD)v27 && *((_QWORD *)&v27 + 1) && v28)
      {
        v25 = v27;
        v26 = v28;
        objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v4, v12, (uint64_t)&v25, &v23, v21[0], v21[1], v21[2], v22[0], v22[1], v22[2], v31, v32);
      }
      else
      {
        if (!(_QWORD)v29)
          sub_24B6F2A04();
        if (!*((_QWORD *)&v29 + 1))
          sub_24B6F2A2C();
        if (!v30)
          sub_24B6F2A54();
        objc_msgSend_device(v4, v12, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend_supportsNonUniformThreadgroupSize(v16, v17, v18);

        if (v19)
        {
          v25 = v29;
          v26 = v30;
          v23 = v31;
          v24 = v32;
          objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v4, v20, (uint64_t)&v25, &v23);
        }
        else
        {
          objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v4, v20, (uint64_t)v22, v21, v7, v8, 1, (v7 + v14 - 1) / v7, (v8 + v15 - 1) / v8, 1, v23, v24);
        }
      }
    }
  }

}

- (CGRect)outputExtent
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  float v9;
  double v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  float v15;
  double v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  float v21;
  double v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  float v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  if (self->_extent
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend_count(self->_extent, v3, v4) == 4)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_extent, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v6, v7, v8);
    v10 = v9;
    objc_msgSend_objectAtIndexedSubscript_(self->_extent, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v12, v13, v14);
    v16 = v15;
    objc_msgSend_objectAtIndexedSubscript_(self->_extent, v17, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v18, v19, v20);
    v22 = v21;
    objc_msgSend_objectAtIndexedSubscript_(self->_extent, v23, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v24, v25, v26);
    v28 = v27;

  }
  else
  {
    v10 = *MEMORY[0x24BDBF070];
    v16 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v22 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v28 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  v29 = v10;
  v30 = v16;
  v31 = v22;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void **p_threadsPerGrid;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v34[3];
  uint64_t v35[3];

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = objc_opt_class();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("\n\t\t<%@ <%p>: \n"), v4, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!self->_indirectBuffer)
  {
    memset(v35, 0, sizeof(v35));
    p_threadsPerGrid = (void **)&self->_threadsPerGrid;
    sub_24B6E8428(self->_threadsPerGrid, v35);
    memset(v34, 0, sizeof(v34));
    sub_24B6E8428(self->_threadgroupsPerGrid, v34);
    objc_msgSend_appendString_(v8, v14, (uint64_t)CFSTR("\t\t\tthreadPerThreadGroup = "));
    objc_msgSend_description(self->_threadsPerThreadgroup, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6E87EC(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v8, v19, (uint64_t)v18);

    objc_msgSend_appendString_(v8, v20, (uint64_t)CFSTR("\n"));
    if (v35[0])
    {
      objc_msgSend_appendString_(v8, v21, (uint64_t)CFSTR("\t\t\tgridSize = "));
    }
    else
    {
      if (!v34[0])
      {
LABEL_8:
        objc_msgSend_appendString_(v8, v21, (uint64_t)CFSTR("\t\t\tciExtent = "));
        objc_msgSend_description(self->_extent, v28, v29);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        sub_24B6E87EC(v11);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v8, v31, (uint64_t)v30);

        goto LABEL_9;
      }
      p_threadsPerGrid = (void **)&self->_threadgroupsPerGrid;
      objc_msgSend_appendString_(v8, v21, (uint64_t)CFSTR("\t\t\tthreadgroupsPerGrid = "));
    }
    objc_msgSend_description(*p_threadsPerGrid, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6E87EC(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v8, v26, (uint64_t)v25);

    objc_msgSend_appendString_(v8, v27, (uint64_t)CFSTR("\n"));
    goto LABEL_8;
  }
  objc_msgSend_appendString_(v6, v7, (uint64_t)CFSTR("\t\t\tindirectBuffer: "));
  objc_msgSend_description(self->_indirectBuffer, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v8, v12, (uint64_t)v11);
LABEL_9:

  objc_msgSend_appendString_(v8, v32, (uint64_t)CFSTR("\n\t\t>\n"));
  return v8;
}

- (id)debugQuickLookObject
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend_image(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    objc_msgSend_debugQuickLookObject(v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MTLBuffer)indirectBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIndirectBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (UniImage)image
{
  return (UniImage *)objc_loadWeakRetained((id *)&self->_image);
}

- (void)setImage:(id)a3
{
  objc_storeWeak((id *)&self->_image, a3);
}

- (NSNumber)indirectBufferOffset
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIndirectBufferOffset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)threadsPerThreadgroup
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setThreadsPerThreadgroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)threadsPerGrid
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setThreadsPerGrid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)threadgroupsPerGrid
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setThreadgroupsPerGrid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)extent
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExtent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extent, 0);
  objc_storeStrong((id *)&self->_threadgroupsPerGrid, 0);
  objc_storeStrong((id *)&self->_threadsPerGrid, 0);
  objc_storeStrong((id *)&self->_threadsPerThreadgroup, 0);
  objc_storeStrong((id *)&self->_indirectBufferOffset, 0);
  objc_destroyWeak((id *)&self->_image);
  objc_storeStrong((id *)&self->_indirectBuffer, 0);
}

@end
