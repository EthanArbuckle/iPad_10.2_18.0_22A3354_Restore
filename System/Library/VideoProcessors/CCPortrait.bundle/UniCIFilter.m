@implementation UniCIFilter

- (UniCIFilter)init
{
  UniCIFilter *v2;
  const char *v3;
  UniCIFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UniCIFilter;
  v2 = -[UniKernel init](&v6, sel_init);
  v4 = v2;
  if (v2)
    objc_msgSend_setFilter_(v2, v3, 0);
  return v4;
}

- (UniCIFilter)initWithDevice:(id)a3
{
  id v4;
  UniCIFilter *v5;
  const char *v6;
  UniCIFilter *v7;
  const char *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UniCIFilter;
  v5 = -[UniKernel init](&v10, sel_init);
  v7 = v5;
  if (v5)
  {
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);
    objc_msgSend_setFilter_(v7, v8, 0);
  }

  return v7;
}

- (id)run:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  id v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  id v43;
  const char *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id v72;
  const char *v73;
  void *v74;
  id v76;
  void *v77;
  id v78;
  _QWORD v79[2];
  uint64_t v80;
  _QWORD v81[2];
  CGRect v82;
  CGRect v83;

  v81[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v76 = v4;
  if (v4)
  {
    v9 = v4;
  }
  else
  {
    objc_msgSend_device(self, v5, v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend_newCommandQueue(v10, v11, v12);

  }
  objc_msgSend_commandBuffer(v9, v7, v8, v76);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputs(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v16, v17, *MEMORY[0x24BDBF9C8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    sub_24B6F082C();
  if (qword_2579AEB98 != -1)
    dispatch_once(&qword_2579AEB98, &unk_251C8F950);
  v21 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend_device(self, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueWithNonretainedObject_(v21, v23, (uint64_t)v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (id)qword_2579AEB90;
  objc_sync_enter(v25);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_2579AEB90, v26, (uint64_t)v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    v30 = (void *)MEMORY[0x24BDBF648];
    objc_msgSend_device(self, v27, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = *MEMORY[0x24BDBF858];
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v34;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)v81, &v80, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contextWithMTLDevice_options_(v30, v37, (uint64_t)v31, v36);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setObject_forKeyedSubscript_((void *)qword_2579AEB90, v38, (uint64_t)v29, v24);
  }
  objc_sync_exit(v25);

  if (!v29)
    sub_24B6F0854();
  objc_msgSend__mtlTextureForImage_(UniKernel, v39, (uint64_t)v18);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v40;
  if (!v40)
    sub_24B6F087C();
  if ((objc_msgSend_conformsToProtocol_(v40, v41, (uint64_t)&unk_2579B9140) & 1) == 0)
    sub_24B6F08CC();
  v43 = objc_alloc(MEMORY[0x24BDBF680]);
  v46 = (void *)objc_msgSend_initWithMTLTexture_commandBuffer_(v43, v44, (uint64_t)v42, v13);
  if (v46)
  {
    objc_msgSend__ciImageForInput_(self, v45, (uint64_t)v18);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v48)
      sub_24B6F08A4();
    objc_msgSend_setColorSpace_(v46, v47, 0);
    objc_msgSend_setClamped_(v46, v49, 0);
    v52 = objc_msgSend_width(v42, v50, v51);
    v55 = objc_msgSend_height(v42, v53, v54);
    objc_msgSend_extent(v48, v56, v57);
    v83.origin.x = v58;
    v83.origin.y = v59;
    v83.size.width = v60;
    v83.size.height = v61;
    v82.size.width = (double)(unint64_t)v52;
    v82.size.height = (double)(unint64_t)v55;
    v82.origin.x = 0.0;
    v82.origin.y = 0.0;
    if (!CGRectEqualToRect(v82, v83))
    {
      v64 = objc_msgSend_width(v42, v62, v63);
      v67 = objc_msgSend_height(v42, v65, v66);
      objc_msgSend_imageByCroppingToRect_(v48, v68, v69, 0.0, 0.0, (double)(unint64_t)v64, (double)(unint64_t)v67);
      v70 = objc_claimAutoreleasedReturnValue();

      v48 = (void *)v70;
    }
    v78 = 0;
    v71 = (id)objc_msgSend_startTaskToRender_toDestination_error_(v29, v62, (uint64_t)v48, v46, &v78);
    v72 = v78;
    v79[0] = v13;
    v79[1] = v42;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v73, (uint64_t)v79, 2);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v74 = 0;
  }

  return v74;
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
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  NSObject *v59;
  NSString *v60;
  NSString *v61;
  Class v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t j;
  uint64_t v82;
  void *v83;
  const char *v84;
  void *v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  id v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  const char *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  NSObject *v117;
  const char *v119;
  id v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint8_t buf[4];
  const char *v136;
  __int16 v137;
  uint64_t v138;
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;

  v141 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7 = (void *)objc_msgSend_copy(self, v5, v6);
  objc_msgSend_inputs(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)CFSTR("name"));
  v12 = objc_claimAutoreleasedReturnValue();

  if (!v12)
    sub_24B6F08F4();
  objc_msgSend_filterWithName_(MEMORY[0x24BDBF658], v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFilter_(v7, v15, (uint64_t)v14);

  objc_msgSend_filter(v7, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    sub_24B6F091C();
  v119 = (const char *)v12;
  v120 = v4;

  objc_msgSend_filter(v7, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDefaults(v21, v22, v23);

  v24 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend_filter(v7, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputKeys(v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v24, v31, (uint64_t)v30);
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setWithSet_(MEMORY[0x24BDBCEF0], v32, (uint64_t)v124);
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_filter(v7, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attributes(v36, v37, v38);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v126 = v7;
  objc_msgSend_inputs(v7, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v131, v140, 16);
  v45 = (void *)v33;
  v122 = (void *)v33;
  if (v43)
  {
    v46 = v43;
    v47 = *(_QWORD *)v132;
    v48 = *MEMORY[0x24BDBF9C8];
    v121 = *MEMORY[0x24BDBF6A0];
    v125 = v41;
    while (2)
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v132 != v47)
          objc_enumerationMutation(v41);
        v50 = *(char **)(*((_QWORD *)&v131 + 1) + 8 * i);
        if ((objc_msgSend_isEqualToString_(v50, v44, (uint64_t)CFSTR("name")) & 1) == 0
          && (objc_msgSend_isEqualToString_(v50, v44, v48) & 1) == 0)
        {
          if ((objc_msgSend_containsObject_(v124, v44, (uint64_t)v50) & 1) == 0)
          {
            uni_logger_api();
            v59 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              v105 = 0;
              v72 = v126;
              v116 = (char *)v119;
              v73 = v120;
              goto LABEL_44;
            }
            v116 = (char *)v119;
            sub_24B6F0A38((uint64_t)v50, v119);
            goto LABEL_43;
          }
          objc_msgSend_inputs(v126, v51, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v53, v54, (uint64_t)v50);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_objectForKeyedSubscript_(v123, v56, (uint64_t)v50);
          v59 = objc_claimAutoreleasedReturnValue();
          if (v59)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend_objectForKeyedSubscript_(v59, v57, v121);
              v60 = (NSString *)objc_claimAutoreleasedReturnValue();
              v61 = v60;
              if (v60)
                v62 = NSClassFromString(v60);
              else
                v62 = 0;
              if ((Class)objc_opt_class() == v62 || (Class)objc_opt_class() == v62)
              {
                objc_msgSend__ciImageForInput_(v126, v63, (uint64_t)v55);
                v64 = objc_claimAutoreleasedReturnValue();

                v55 = (void *)v64;
              }

              v45 = v122;
            }
          }
          if (!v55)
          {
            uni_logger_api();
            v117 = objc_claimAutoreleasedReturnValue();
            v116 = (char *)v119;
            if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
              sub_24B6F0994((uint64_t)v119, v50);

LABEL_43:
            v105 = 0;
            v72 = v126;
            v73 = v120;
            goto LABEL_44;
          }
          objc_msgSend_filter(v126, v57, v58);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setValue_forKey_(v65, v66, (uint64_t)v55, v50);

          objc_msgSend_removeObject_(v45, v67, (uint64_t)v50);
          v41 = v125;
        }
      }
      v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v131, v140, 16);
      if (v46)
        continue;
      break;
    }
  }

  v72 = v126;
  v73 = v120;
  if (objc_msgSend_count(v45, v68, v69))
  {
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v74 = v45;
    v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v75, (uint64_t)&v127, v139, 16);
    if (v76)
    {
      v79 = v76;
      v80 = *(_QWORD *)v128;
      do
      {
        for (j = 0; j != v79; ++j)
        {
          if (*(_QWORD *)v128 != v80)
            objc_enumerationMutation(v74);
          v82 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * j);
          objc_msgSend_filter(v72, v77, v78);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_valueForKey_(v83, v84, v82);
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          uni_logger_api();
          v86 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
          {
            v89 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend_filter(v72, v87, v88);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = (void *)objc_opt_class();
            objc_msgSend_description(v91, v92, v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v89, v95, (uint64_t)CFSTR("Using default value (%@) for key %@ because it was not set explicitly on filter %@"), v85, v82, v94);
            v96 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v99 = objc_msgSend_UTF8String(v96, v97, v98);
            *(_DWORD *)buf = 136446466;
            v136 = "-[UniCIFilter outputImage:]";
            v137 = 2080;
            v138 = v99;
            _os_log_impl(&dword_24B6B5000, v86, OS_LOG_TYPE_INFO, "%{public}s %s", buf, 0x16u);

            v72 = v126;
          }

        }
        v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v77, (uint64_t)&v127, v139, 16);
      }
      while (v79);
    }

    v73 = v120;
    v45 = v122;
  }
  objc_msgSend_filter(v72, v70, v71);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outputImage(v100, v101, v102);
  v103 = objc_claimAutoreleasedReturnValue();

  if (!v103)
    sub_24B6F0944();
  v125 = (void *)v103;
  objc_msgSend_imageWithCIImage_(UniImage, v104, v103);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputs(v72, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v108, v109, *MEMORY[0x24BDBF9C8]);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_(v105, v111, (uint64_t)v110);

  objc_msgSend_setKernel_(v105, v112, (uint64_t)v72);
  objc_msgSend_texture(v105, v113, v114);
  v115 = objc_claimAutoreleasedReturnValue();
  if (!v115)
    sub_24B6F096C();
  v59 = v115;
  v116 = (char *)v119;
LABEL_44:

  return v105;
}

- (id)outputImageArray
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_inputs(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v4, *MEMORY[0x24BDBF9C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mtlTextureForImage_(UniKernel, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    sub_24B6F0ADC();
  rootTexture(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, (uint64_t)v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)inputImageArray
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!self->filter)
    sub_24B6F0B04();
  objc_msgSend_inputNameArray(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCEB8];
  v8 = objc_msgSend_count(v4, v6, v7);
  objc_msgSend_arrayWithCapacity_(v5, v9, v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v4;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v27, v31, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v10);
        objc_msgSend_valueForKey_(self->filter, v13, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend__mtlTextureForImage_(UniKernel, v17, (uint64_t)v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            rootTexture(v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v26, v22, (uint64_t)v21);

          }
        }

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v27, v31, 16);
    }
    while (v14);
  }

  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v23, (uint64_t)v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)inputNameArray
{
  uint64_t v2;
  CIFilter *filter;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  const char *v17;
  NSString *v18;
  NSString *v19;
  Class v20;
  const char *v21;
  const char *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  filter = self->filter;
  if (!filter)
    sub_24B6F0B2C();
  objc_msgSend_attributes(filter, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v5, v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v4;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v26, v30, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v27;
    v13 = *MEMORY[0x24BDBF6A0];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v7);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v7, v10, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_objectForKeyedSubscript_(v16, v17, v13);
            v18 = (NSString *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18)
              v20 = NSClassFromString(v18);
            else
              v20 = 0;
            if ((Class)objc_opt_class() == v20 || (Class)objc_opt_class() == v20)
              objc_msgSend_addObject_(v25, v21, v15);

          }
        }

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v26, v30, 16);
    }
    while (v11);
  }

  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v22, (uint64_t)v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)outputNameArray
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDBF9C8];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CIFilter)filter
{
  return self->filter;
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->filter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->filter, 0);
}

@end
