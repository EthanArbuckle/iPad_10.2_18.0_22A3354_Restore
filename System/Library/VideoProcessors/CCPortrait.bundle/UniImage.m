@implementation UniImage

- (CIImage)image
{
  return self->image;
}

- (MTLTexture)texture
{
  return self->texture;
}

- (MTLCommandBuffer)buffer
{
  return self->buffer;
}

- (UniKernel)kernel
{
  return self->kernel;
}

- (UniImage)initWithKernel:(id)a3
{
  id v5;
  UniImage *v6;
  UniImage *v7;
  CIImage *image;
  MTLTexture *texture;
  MTLCommandBuffer *buffer;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UniImage;
  v6 = -[UniImage init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->kernel, a3);
    image = v7->image;
    v7->image = 0;

    texture = v7->texture;
    v7->texture = 0;

    buffer = v7->buffer;
    v7->buffer = 0;

  }
  return v7;
}

- (UniImage)initWithCIImage:(id)a3
{
  id v5;
  UniImage *v6;
  UniImage *v7;
  MTLTexture *texture;
  UniKernel *kernel;
  MTLCommandBuffer *buffer;
  UniImage *v11;
  objc_super v13;

  v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)UniImage;
    v6 = -[UniImage init](&v13, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->image, a3);
      texture = v7->texture;
      v7->texture = 0;

      kernel = v7->kernel;
      v7->kernel = 0;

      buffer = v7->buffer;
      v7->buffer = 0;

    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (UniImage)imageWithCIImage:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *v6;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc((Class)objc_opt_class());
    v6 = (void *)objc_msgSend_initWithCIImage_(v4, v5, (uint64_t)v3);

  }
  else
  {
    v6 = 0;
  }
  return (UniImage *)v6;
}

- (UniImage)initWithMTLTexture:(id)a3
{
  id v5;
  UniImage *v6;
  UniImage *v7;
  const char *v8;
  uint64_t v9;
  CIImage *image;
  UniKernel *kernel;
  MTLCommandBuffer *buffer;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UniImage;
  v6 = -[UniImage init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->texture, a3);
    objc_msgSend_imageWithMTLTexture_options_(MEMORY[0x24BDBF660], v8, (uint64_t)v7->texture, MEMORY[0x24BDBD1B8]);
    v9 = objc_claimAutoreleasedReturnValue();
    image = v7->image;
    v7->image = (CIImage *)v9;

    kernel = v7->kernel;
    v7->kernel = 0;

    buffer = v7->buffer;
    v7->buffer = 0;

  }
  return v7;
}

+ (UniImage)imageWithMTLTexture:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)objc_msgSend_initWithMTLTexture_(v4, v5, (uint64_t)v3);

  return (UniImage *)v6;
}

- (UniImage)initWithObject:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  UniImage *v10;
  UniImage *v11;

  v4 = a3;
  v6 = v4;
  if (!v4)
    goto LABEL_10;
  if (!objc_msgSend_conformsToProtocol_(v4, v5, (uint64_t)&unk_2579B9140))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend_initWithCIImage_(self, v9, (uint64_t)v6);
      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v6;
      goto LABEL_7;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  v8 = (void *)objc_msgSend_initWithMTLTexture_(self, v7, (uint64_t)v6);
LABEL_6:
  v10 = v8;
  self = v10;
LABEL_7:
  v11 = v10;
LABEL_11:

  return v11;
}

+ (UniImage)imageWithObject:(id)a3
{
  id v3;
  UniImage *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = [UniImage alloc];
  v6 = (void *)objc_msgSend_initWithObject_(v4, v5, (uint64_t)v3);

  return (UniImage *)v6;
}

- (CGRect)extent
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  objc_msgSend_image(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_extent(self->image, v5, v6);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    objc_msgSend_texture(self, v5, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend_texture(self, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__mtlTextureForImage_(UniKernel, v19, (uint64_t)v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 && objc_msgSend_conformsToProtocol_(v20, v21, (uint64_t)&unk_2579B9140))
      {
        v12 = (double)(unint64_t)objc_msgSend_width(v20, v22, v23);
        v14 = (double)(unint64_t)objc_msgSend_height(v20, v24, v25);
        v8 = 0.0;
        v10 = 0.0;
      }
      else
      {
        v8 = *MEMORY[0x24BDBF090];
        v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
        v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
        v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
      }

    }
    else
    {
      v8 = *MEMORY[0x24BDBF090];
      v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
  }
  v26 = v8;
  v27 = v10;
  v28 = v12;
  v29 = v14;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = objc_opt_class();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p"), v4, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_texture(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_texture(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_conformsToProtocol_(v12, v13, (uint64_t)&unk_2579B9140);

    objc_msgSend_texture(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v17;
    if (v14)
      shortTextureDescription(v17);
    else
      objc_msgSend_description(v17, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v6, v22, (uint64_t)v21);

  }
  objc_msgSend_image(self, v10, v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_image(self, v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v26, v28, (uint64_t)CFSTR(" image = %@"), v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v6, v30, (uint64_t)v29);

  }
  objc_msgSend_buffer(self, v24, v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v34 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_buffer(self, v32, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v34, v36, (uint64_t)CFSTR(" buffer = %@"), v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v6, v38, (uint64_t)v37);

  }
  objc_msgSend_kernel(self, v32, v33);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v42 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_kernel(self, v40, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v42, v44, (uint64_t)CFSTR(" kernel = %@"), v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v6, v46, (uint64_t)v45);

  }
  objc_msgSend_appendString_(v6, v40, (uint64_t)CFSTR(">"));
  return v6;
}

- (id)debugQuickLookObject
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  SEL v14;
  objc_class *v15;
  void *v16;
  id v17;
  const char *v18;

  objc_msgSend_image(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_image(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_12:
      v16 = 0;
      return v16;
    }
  }
  else
  {
    objc_msgSend_texture(self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_12;
    v11 = (void *)MEMORY[0x24BDBF660];
    objc_msgSend_texture(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithMTLTexture_options_(v11, v13, (uint64_t)v12, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_12;
  }
  v14 = NSSelectorFromString(CFSTR("initWithCIImage:"));
  v15 = NSClassFromString(CFSTR("NSBitmapImageRep"));
  if (!v15)
    v15 = NSClassFromString(CFSTR("UIImage"));
  v16 = 0;
  if (v15 && v14)
  {
    v17 = [v15 alloc];
    objc_msgSend_performSelector_withObject_(v17, v18, (uint64_t)v14, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

+ (void)metalRenderImageArray:(id)a3 queue:(id)a4 waitUntilScheduled:(BOOL)a5 waitUntilCompleted:(BOOL)a6
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  const char *v33;
  id v34;
  const char *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  os_activity_t v57;
  NSObject *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  NSObject *v72;
  const char *v73;
  id v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  const char *v93;
  void *v94;
  const char *v95;
  void *v96;
  id v97;
  NSObject *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  id v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  const char *v108;
  void *v109;
  unsigned int v110;
  void *v111;
  const char *v112;
  NSObject *v113;
  id v114;
  void *v115;
  _BOOL4 v116;
  void *v117;
  void *v118;
  _BOOL4 v119;
  id obj;
  void *v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint8_t buf[4];
  uint64_t v132;
  uint8_t v133[128];
  uint8_t v134[4];
  const char *v135;
  _BYTE v136[128];
  uint64_t v137;

  v116 = a6;
  v119 = a5;
  v137 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v122 = a4;
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v8, v9);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v10, v11);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weakObjectsPointerArray(MEMORY[0x24BDD1748], v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v7, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernel(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_getRenderOrder(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v27 = v7;
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v127, v136, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v128;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v128 != v31)
          objc_enumerationMutation(v27);
        sub_24B6DC61C(*(void **)(*((_QWORD *)&v127 + 1) + 8 * i), v14, v17);
      }
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v33, (uint64_t)&v127, v136, 16);
    }
    while (v30);
  }

  v34 = v26;
  if (v34 && objc_msgSend_pointerAtIndex_(v34, v35, 0))
  {
    v115 = v23;
    v37 = (void *)objc_msgSend_pointerAtIndex_(v34, v36, 0);
    objc_msgSend_device(v37, v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    v43 = v40;
    if (!v122)
      v122 = (id)objc_msgSend_newCommandQueue(v40, v41, v42);
    v113 = v43;
    objc_opt_class();
    objc_opt_class();
    v44 = (void *)MEMORY[0x24BDBCEF0];
    v47 = objc_msgSend_count(v34, v45, v46);
    objc_msgSend_setWithCapacity_(v44, v48, v47);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v114 = v34;
    obj = v34;
    v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v123, v133, 16);
    if (v50)
    {
      v51 = v50;
      v52 = 0;
      v53 = *(_QWORD *)v124;
      do
      {
        v54 = 0;
        do
        {
          if (*(_QWORD *)v124 != v53)
            objc_enumerationMutation(obj);
          v55 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v54);
          if ((objc_opt_isKindOfClass() & 1) == 0)
            sub_24B6F1950();
          if ((sub_24B6DC7CC(v55) & 1) == 0)
          {
            uni_activity();
            v56 = objc_claimAutoreleasedReturnValue();
            v57 = _os_activity_create(&dword_24B6B5000, "kernel run", v56, OS_ACTIVITY_FLAG_DEFAULT);

          }
          uni_logger_render();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            sub_24B6F18BC(v134, v52, (uint64_t *)&v135, v58);

          objc_msgSend_run_(v55, v59, (uint64_t)v122);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v60, v61, 0);
          v62 = objc_claimAutoreleasedReturnValue();
          if (!v62)
            sub_24B6F186C();
          v63 = (void *)v62;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ((objc_msgSend_conformsToProtocol_(v63, v64, (uint64_t)&unk_2579BABE8) & 1) == 0)
              sub_24B6F1894();
            objc_msgSend_writeDebugTextures_filesWritten_(v55, v65, (uint64_t)v63, v118);
            objc_msgSend_commit(v63, v66, v67);
            if (v119)
              objc_msgSend_waitUntilScheduled(v63, v68, v69);
            if (objc_msgSend_shouldWriteDebugTextures(UniKernel, v68, v69))
              objc_msgSend_waitUntilCompleted(v63, v70, v71);
            uni_logger_render();
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
            {
              objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v73, (uint64_t)CFSTR("%@"), v55);
              v74 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v77 = objc_msgSend_UTF8String(v74, v75, v76);
              *(_DWORD *)buf = 136315138;
              v132 = v77;
              _os_log_impl(&dword_24B6B5000, v72, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);

            }
            if ((objc_msgSend_containsObject_(v121, v78, (uint64_t)v63) & 1) == 0)
            {
              objc_msgSend_addObject_(v117, v79, (uint64_t)v63);
              objc_msgSend_addObject_(v121, v80, (uint64_t)v63);
            }
            ++v52;
          }

          ++v54;
        }
        while (v51 != v54);
        v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v123, v133, 16);
      }
      while (v51);
    }

    if (v116)
    {
      objc_msgSend_lastObject(v117, v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_waitUntilCompleted(v84, v85, v86);

    }
    objc_msgSend_processInfo(MEMORY[0x24BDD1760], v82, v83);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_processName(v87, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v91 = (void *)MEMORY[0x24BDD17C8];
    v92 = getpid();
    objc_msgSend_stringWithFormat_(v91, v93, (uint64_t)CFSTR("_pid%d"), v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v94;
    v23 = v115;
    if (v90)
    {
      objc_msgSend_stringByAppendingString_(v90, v95, (uint64_t)v94);
      v97 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v97 = v94;
    }
    v99 = (void *)objc_opt_new();
    objc_msgSend_temporaryDirectory(v99, v100, v101);
    v102 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v105 = objc_msgSend_fileSystemRepresentation(v102, v103, v104);

    v106 = (void *)MEMORY[0x24BDD17C8];
    v107 = atomic_load((unsigned int *)&unk_2579AEBD0);
    objc_msgSend_stringWithFormat_(v106, v108, (uint64_t)CFSTR("/%s/%@_%d.dot"), v105, v97, v107);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    do
      v110 = __ldxr((unsigned int *)&unk_2579AEBD0);
    while (__stxr(v110 + 1, (unsigned int *)&unk_2579AEBD0));
    v111 = (void *)objc_opt_class();
    objc_msgSend__spewDot_filename_(v111, v112, (uint64_t)obj, v109);

    v98 = v113;
    v34 = v114;
  }
  else
  {
    uni_logger_api();
    v98 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v134 = 136446210;
      v135 = "+[UniImage metalRenderImageArray:queue:waitUntilScheduled:waitUntilCompleted:]";
      _os_log_impl(&dword_24B6B5000, v98, OS_LOG_TYPE_INFO, "%{public}s Nothing to do ... ", v134, 0xCu);
    }
  }

}

- (void)metalRender:(id)a3 waitUntilScheduled:(BOOL)a4 waitUntilCompleted:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  _QWORD v13[2];

  v5 = a5;
  v6 = a4;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)objc_opt_class();
  v13[0] = self;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v10, (uint64_t)v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metalRenderImageArray_queue_waitUntilScheduled_waitUntilCompleted_(v9, v12, (uint64_t)v11, v8, v6, v5);

}

- (void)metalRender
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_class();
  v7[0] = self;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v4, (uint64_t)v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metalRenderImageArray_queue_waitUntilScheduled_waitUntilCompleted_(v3, v6, (uint64_t)v5, 0, 1, 1);

}

+ (id)_textureDescriptionForDot:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;

  v3 = a3;
  if (!v3)
    sub_24B6F1978();
  v4 = v3;
  objc_opt_class();
  v7 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_texture(v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = objc_msgSend_pixelFormat(v7, v5, v6);
  objc_msgSend_device(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = pixelFormatName(v8, v11);

  if (!v12)
    sub_24B6F19A0();
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = objc_msgSend_width(v7, v13, v14);
  v19 = objc_msgSend_height(v7, v17, v18);
  objc_msgSend_stringWithFormat_(v15, v20, (uint64_t)CFSTR("%ldx%ld\\n%s"), v16, v19, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_cleanupParameterDescription:(id)a3
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  int isEqualToString;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, (uint64_t)CFSTR("\"), &stru_251C92910);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v5, v6, (uint64_t)CFSTR("{"));

  if (isEqualToString)
  {
    objc_msgSend_stringByReplacingCharactersInRange_withString_(v3, v8, 0, 1, &stru_251C92910);
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v10;
  }
  v11 = objc_msgSend_length(v3, v8, v9);
  objc_msgSend_substringFromIndex_(v3, v12, v11 - 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_isEqualToString_(v13, v14, (uint64_t)CFSTR("}"));

  if (v15)
  {
    v18 = objc_msgSend_length(v3, v16, v17);
    objc_msgSend_stringByReplacingCharactersInRange_withString_(v3, v19, v18 - 1, 1, &stru_251C92910);
    v20 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v20;
  }
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v3, v16, (uint64_t)CFSTR(";"), &stru_251C92910);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_string(MEMORY[0x24BDD16A8], v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsSeparatedByString_(v21, v25, (uint64_t)CFSTR("\n"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_whitespaceCharacterSet(MEMORY[0x24BDD14A8], v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invertedSet(v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v33 = v26;
  v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v46, v50, 16);
  if (v35)
  {
    v37 = v35;
    v38 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v47 != v38)
          objc_enumerationMutation(v33);
        v40 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v41 = objc_msgSend_rangeOfCharacterFromSet_(v40, v36, (uint64_t)v32, (_QWORD)v46);
        if (v41 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend_substringFromIndex_(v40, v36, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(v24, v43, (uint64_t)v42);

          objc_msgSend_appendString_(v24, v44, (uint64_t)CFSTR("\\l"));
        }
      }
      v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v46, v50, 16);
    }
    while (v37);
  }

  return v24;
}

+ (id)_objectsForNames:(id)a3 forKernel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCEB8];
  v10 = objc_msgSend_count(v5, v8, v9);
  objc_msgSend_arrayWithCapacity_(v7, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v5;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v30, v34, 16);
  if (v15)
  {
    v18 = v15;
    v19 = *(_QWORD *)v31;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v13);
        v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v20);
        objc_msgSend_inputs(v6, v16, v17, (_QWORD)v30);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v22, v23, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend_conformsToProtocol_(v24, v25, (uint64_t)&unk_2579B9140);
          objc_msgSend_addObject_(v12, v26, (uint64_t)v24);
        }

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v30, v34, 16);
    }
    while (v18);
  }

  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v27, (uint64_t)v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)_orderedInputNamesForKernel:(id)a3 inputImageSet:(id)a4 outputImageSet:(id)a5 showNonImageParams:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  void *v57;
  _BOOL4 v59;
  void *v60;
  void *v61;
  id obj;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _QWORD v81[4];

  v59 = a6;
  v81[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend_inputs(v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v14, v15, v16);
  objc_msgSend_arrayWithCapacity_(v11, v18, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = v9;
  v61 = v10;
  v81[0] = v9;
  v81[1] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v20, (uint64_t)v81, 2);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v74, v80, 16);
  if (v64)
  {
    v63 = *(_QWORD *)v75;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v75 != v63)
          objc_enumerationMutation(obj);
        v65 = v24;
        v25 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v24);
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        objc_msgSend_inputs(v8, v22, v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v70, v79, 16);
        if (v28)
        {
          v31 = v28;
          v32 = *(_QWORD *)v71;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v71 != v32)
                objc_enumerationMutation(v26);
              v34 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
              objc_msgSend_inputs(v8, v29, v30);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v35, v36, v34);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              if (v37 && objc_msgSend_containsObject_(v25, v38, (uint64_t)v37))
                objc_msgSend_addObject_(v19, v39, v34);

            }
            v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v70, v79, 16);
          }
          while (v31);
        }

        v24 = v65 + 1;
      }
      while (v65 + 1 != v64);
      v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v74, v80, 16);
    }
    while (v64);
  }

  if (v59)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend_inputs(v8, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v66, v78, 16);
    if (v44)
    {
      v47 = v44;
      v48 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v67 != v48)
            objc_enumerationMutation(v42);
          v50 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j);
          objc_msgSend_inputs(v8, v45, v46);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v51, v52, v50);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v53
            && (objc_msgSend_containsObject_(v60, v54, v50) & 1) == 0
            && (objc_msgSend_containsObject_(v61, v55, v50) & 1) == 0)
          {
            objc_msgSend_addObject_(v19, v56, v50);
          }

        }
        v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v66, v78, 16);
      }
      while (v47);
    }

  }
  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v40, (uint64_t)v19);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

+ (id)_stringForObject:(id)a3 objectToStringMap:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  id v15;

  v5 = a3;
  v6 = a4;
  if (!v6)
    sub_24B6F19C8();
  v8 = v6;
  objc_msgSend_objectForKey_(v6, v7, (uint64_t)v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = objc_msgSend_count(v8, v9, v10);
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("%ld"), v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v14, (uint64_t)v11, v5);
  }
  v15 = v11;

  return v15;
}

- (id)coreImageRender:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  void *v27;
  id v28;
  const char *v29;
  id v30;
  id v32;
  id v33;

  v4 = a3;
  objc_msgSend_image(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_texture(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernel(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    sub_24B6F19F0();

  objc_msgSend__mtlTextureForImage_(UniKernel, v14, (uint64_t)v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if (v4 && v15 && v7)
  {
    objc_msgSend__outputTextureForTexture_force_(UniKernel, v16, (uint64_t)v15, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
      sub_24B6F1A18();
    v19 = (void *)v18;
    v20 = objc_alloc(MEMORY[0x24BDBF680]);
    v22 = (void *)objc_msgSend_initWithMTLTexture_commandBuffer_(v20, v21, (uint64_t)v19, 0);
    v24 = v22;
    if (v22)
    {
      objc_msgSend_setColorSpace_(v22, v23, 0);
      objc_msgSend_setClamped_(v24, v25, 0);
      v33 = 0;
      objc_msgSend_startTaskToRender_toDestination_error_(v4, v26, (uint64_t)v7, v24, &v33);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v33;
      v32 = v28;
      objc_msgSend_waitUntilCompletedAndReturnError_(v27, v29, (uint64_t)&v32);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v32;

    }
    else
    {
      v17 = 0;
    }

  }
  return v17;
}

- (id)coreImageRender:(id)a3 subRect:(CGRect)a4 outputTexture:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  CGFloat v35;
  const char *v36;
  uint64_t v37;
  double v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  id v43;
  const char *v44;
  id v45;
  id v47;
  id v48;
  CGAffineTransform v49;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  objc_msgSend_image(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByCroppingToRect_(v15, v16, v17, x, y, width, height);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_kernel(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
    sub_24B6F1A40();

  v23 = 0;
  if (v11 && v12 && v18)
  {
    objc_msgSend__outputTextureForTexture_force_(UniKernel, v22, (uint64_t)v12, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
      sub_24B6F1A68();
    v25 = (void *)v24;
    v26 = objc_alloc(MEMORY[0x24BDBF680]);
    v28 = (void *)objc_msgSend_initWithMTLTexture_commandBuffer_(v26, v27, (uint64_t)v25, 0);
    v30 = v28;
    if (v28)
    {
      objc_msgSend_setColorSpace_(v28, v29, 0);
      objc_msgSend_setClamped_(v30, v31, 0);
      objc_msgSend_extent(v18, v32, v33);
      v35 = -v34;
      objc_msgSend_extent(v18, v36, v37);
      CGAffineTransformMakeTranslation(&v49, v35, -v38);
      objc_msgSend_imageByApplyingTransform_(v18, v39, (uint64_t)&v49);
      v40 = objc_claimAutoreleasedReturnValue();

      v48 = 0;
      objc_msgSend_startTaskToRender_toDestination_error_(v11, v41, v40, v30, &v48);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v48;
      v47 = v43;
      objc_msgSend_waitUntilCompletedAndReturnError_(v42, v44, (uint64_t)&v47);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v47;

      v18 = (void *)v40;
    }
    else
    {
      v23 = 0;
    }

  }
  return v23;
}

- (void)setTexture:(id)a3
{
  objc_storeStrong((id *)&self->texture, a3);
}

- (void)setKernel:(id)a3
{
  objc_storeStrong((id *)&self->kernel, a3);
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->buffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->buffer, 0);
  objc_storeStrong((id *)&self->kernel, 0);
  objc_storeStrong((id *)&self->texture, 0);
  objc_storeStrong((id *)&self->image, 0);
}

@end
