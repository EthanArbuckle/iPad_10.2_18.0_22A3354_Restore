@implementation UniDeviceCache

+ (id)bufferFromData:(id)a3 device:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  const char *v8;
  void *v9;
  NSObject *v10;
  os_activity_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;

  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_11;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = 0;
  if (!v6 || (isKindOfClass & 1) == 0)
    goto LABEL_12;
  if (!objc_msgSend_conformsToProtocol_(v6, v8, (uint64_t)&unk_2579BA5C8))
  {
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  if (qword_2579AEBA0 != -1)
    dispatch_once(&qword_2579AEBA0, &unk_251C8F970);
  sub_24B6D5494(v5, v6, (void *)qword_2579AEBA8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    uni_activity();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = _os_activity_create(&dword_24B6B5000, "create buffer", v10, OS_ACTIVITY_FLAG_DEFAULT);

    v12 = objc_retainAutorelease(v5);
    v15 = objc_msgSend_bytes(v12, v13, v14);
    v18 = objc_msgSend_length(v12, v16, v17);
    v20 = objc_msgSend_newBufferWithBytes_length_options_(v6, v19, v15, v18, 0);
    if (!v20)
      sub_24B6F0BCC();
    v9 = (void *)v20;
    v21 = (id)qword_2579AEBA8;
    objc_sync_enter(v21);
    v22 = (void *)qword_2579AEBA8;
    v23 = (void *)MEMORY[0x24BDD16E0];
    v26 = objc_msgSend_registryID(v6, v24, v25);
    objc_msgSend_numberWithUnsignedLongLong_(v23, v27, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v22, v29, (uint64_t)v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      __assert_rtn("+[UniDeviceCache bufferFromData:device:]", "UniDeviceCache.m", 71, "deviceDict");
    objc_msgSend_setObject_forKeyedSubscript_(v30, v31, (uint64_t)v9, v12);

    objc_sync_exit(v21);
  }
LABEL_12:

  return v9;
}

+ (id)findKernel:(id)a3 device:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  float v16;
  float v17;
  id v18;
  double v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  objc_class *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  char *v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  const char *v47;
  id v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  unint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  double v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  int v88;
  int v89;
  void *v90;
  id v91;
  const char *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  void *v98;
  void *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
LABEL_12:
    v9 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = 0;
  if (v6 && (isKindOfClass & 1) != 0)
  {
    if (objc_msgSend_conformsToProtocol_(v6, v8, (uint64_t)&unk_2579BA5C8))
    {
      if (qword_2579AEBB0 != -1)
        dispatch_once(&qword_2579AEBB0, &unk_251C8F990);
      objc_msgSend_objectForKeyedSubscript_(v5, v10, (uint64_t)CFSTR("name"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v99)
        sub_24B6F0C1C();
      sub_24B6D5494(v5, v6, (void *)qword_2579AEBB8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        goto LABEL_22;
      if (objc_msgSend_isEqualToString_(v99, v11, (uint64_t)CFSTR("MPSImageGaussianBlur")))
      {
        objc_msgSend_objectForKeyedSubscript_(v5, v12, (uint64_t)CFSTR("inputRadius"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_floatValue(v13, v14, v15);
        v17 = v16;

        if (v17 <= 0.0001)
          sub_24B6F0C44();
        v18 = objc_alloc(MEMORY[0x24BDDE3C8]);
        *(float *)&v19 = v17;
        v21 = (void *)objc_msgSend_initWithDevice_sigma_(v18, v20, (uint64_t)v6, v19);
      }
      else
      {
        if (objc_msgSend_isEqualToString_(v99, v12, (uint64_t)CFSTR("MPSImageAreaMin")))
        {
          objc_msgSend_objectForKeyedSubscript_(v5, v23, (uint64_t)CFSTR("radius"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend_unsignedIntValue(v24, v25, v26);

          v28 = (objc_class *)MEMORY[0x24BDDE380];
        }
        else
        {
          if (!objc_msgSend_isEqualToString_(v99, v23, (uint64_t)CFSTR("MPSImageAreaMax")))
          {
            if (!objc_msgSend_isEqualToString_(v99, v29, (uint64_t)CFSTR("MPSImageSpatioTemporalGuidedFilter")))
            {
              uni_logger_api();
              v35 = (char *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
                sub_24B6F0D0C((uint64_t)v99, v35);
              v9 = 0;
              goto LABEL_21;
            }
            objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v47, (uint64_t)&unk_251C9D730);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = 0u;
            v103 = 0u;
            v100 = 0u;
            v101 = 0u;
            v48 = v5;
            v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v100, v104, 16);
            if (v51)
            {
              v52 = *(_QWORD *)v101;
              do
              {
                for (i = 0; i != v51; ++i)
                {
                  if (*(_QWORD *)v101 != v52)
                    objc_enumerationMutation(v48);
                  v54 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
                  if ((objc_msgSend_isEqualToString_(v54, v50, (uint64_t)CFSTR("name")) & 1) == 0
                    && (objc_msgSend_isEqualToString_(v54, v50, (uint64_t)CFSTR("imageExtents")) & 1) == 0
                    && (objc_msgSend_isEqualToString_(v54, v50, (uint64_t)CFSTR("iterations")) & 1) == 0
                    && (objc_msgSend_containsObject_(v98, v50, (uint64_t)v54) & 1) == 0)
                  {
                    sub_24B6F0CE4();
                  }
                }
                v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v50, (uint64_t)&v100, v104, 16);
              }
              while (v51);
            }

            objc_msgSend_objectForKeyedSubscript_(v48, v55, (uint64_t)CFSTR("subsampleFactor"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            if (v56)
            {
              objc_msgSend_objectForKeyedSubscript_(v48, v57, (uint64_t)CFSTR("subsampleFactor"));
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = objc_msgSend_unsignedIntegerValue(v58, v59, v60);

            }
            else
            {
              v61 = 8;
            }
            objc_msgSend_objectForKeyedSubscript_(v48, v57, (uint64_t)CFSTR("width"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (v62)
            {
              objc_msgSend_objectForKeyedSubscript_(v48, v63, (uint64_t)CFSTR("width"));
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = objc_msgSend_unsignedIntegerValue(v64, v65, v66);

              v68 = v67 / v61;
            }
            else
            {
              v68 = 252;
            }
            objc_msgSend_objectForKeyedSubscript_(v48, v63, (uint64_t)CFSTR("height"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            if (v69)
            {
              objc_msgSend_objectForKeyedSubscript_(v48, v70, (uint64_t)CFSTR("height"));
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = objc_msgSend_unsignedIntegerValue(v71, v72, v73);

              v75 = v74 / v61;
            }
            else
            {
              v75 = 189;
            }
            objc_msgSend_objectForKeyedSubscript_(v48, v70, (uint64_t)CFSTR("spatialDiameter"));
            v76 = (void *)objc_claimAutoreleasedReturnValue();

            if (v76)
            {
              objc_msgSend_objectForKeyedSubscript_(v48, v77, (uint64_t)CFSTR("spatialDiameter"));
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = objc_msgSend_unsignedIntegerValue(v78, v79, v80);

            }
            else
            {
              v81 = 5;
            }
            objc_msgSend_objectForKeyedSubscript_(v48, v77, (uint64_t)CFSTR("epsilon"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            if (v82)
            {
              objc_msgSend_objectForKeyedSubscript_(v48, v83, (uint64_t)CFSTR("epsilon"));
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_floatValue(v85, v86, v87);
              v89 = v88;

            }
            else
            {
              v89 = 953267991;
            }
            LODWORD(v84) = v89;
            objc_msgSend_filterDescriptorWithWidth_height_arrayLength_kernelSpatialDiameter_kernelTemporalDiameter_epsilon_sourceChannels_guideChannels_preallocateIntermediates_(MEMORY[0x24BDDE410], v83, v68, v75, 1, v81, 1, 1, v84, 4, 1);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v90)
              sub_24B6F0C94();
            v91 = objc_alloc(MEMORY[0x24BDDE408]);
            v93 = (void *)objc_msgSend_initWithDevice_filterDescriptor_(v91, v92, (uint64_t)v6, v90);
            v9 = v93;
            if (!v93)
              sub_24B6F0CBC();
            v96 = objc_msgSend_options(v93, v94, v95);
            objc_msgSend_setOptions_(v9, v97, v96 | 1);

LABEL_19:
            v35 = (char *)(id)qword_2579AEBB8;
            objc_sync_enter(v35);
            v36 = (void *)qword_2579AEBB8;
            v37 = (void *)MEMORY[0x24BDD16E0];
            v40 = objc_msgSend_registryID(v6, v38, v39);
            objc_msgSend_numberWithUnsignedLongLong_(v37, v41, v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v36, v43, (uint64_t)v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v44)
              __assert_rtn("+[UniDeviceCache findKernel:device:]", "UniDeviceCache.m", 173, "deviceDict");
            objc_msgSend_setObject_forKeyedSubscript_(v44, v45, (uint64_t)v9, v5);

            objc_sync_exit(v35);
LABEL_21:

LABEL_22:
            goto LABEL_23;
          }
          objc_msgSend_objectForKeyedSubscript_(v5, v29, (uint64_t)CFSTR("radius"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend_unsignedIntValue(v30, v31, v32);

          v28 = (objc_class *)MEMORY[0x24BDDE378];
        }
        v33 = [v28 alloc];
        v21 = (void *)objc_msgSend_initWithDevice_kernelWidth_kernelHeight_(v33, v34, (uint64_t)v6, v27, v27);
      }
      v9 = v21;
      objc_msgSend_setEdgeMode_(v21, v22, 1);
      if (!v9)
        sub_24B6F0C6C();
      goto LABEL_19;
    }
    goto LABEL_12;
  }
LABEL_23:

  return v9;
}

+ (id)findComputeKernel:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 constants:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  UniKernel *v22;
  const char *v23;
  id v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  sub_24B6D5ED0();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_2544D9D18;
  qword_2544D9D18 = v13;

  v39[0] = CFSTR("name");
  v39[1] = CFSTR("constants");
  v16 = (id)MEMORY[0x24BDBD1B8];
  if (v12)
    v16 = v12;
  v40[0] = v9;
  v40[1] = v16;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v40, v39, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v10, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6D5494(v17, v20, (void *)qword_2544D9D18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    v22 = [UniKernel alloc];
    v21 = (void *)objc_msgSend_initWithName_metalLibrary_coreImageLibrary_pipelineLibrary_constants_(v22, v23, (uint64_t)v9, v10, 0, v11, v12);
    if (!v21)
      sub_24B6F0DD8();
    v24 = (id)qword_2544D9D18;
    objc_sync_enter(v24);
    v25 = (void *)qword_2544D9D18;
    v26 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_device(v10, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_registryID(v29, v30, v31);
    objc_msgSend_numberWithUnsignedLongLong_(v26, v33, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v25, v35, (uint64_t)v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
      __assert_rtn("+[UniDeviceCache findComputeKernel:library:pipelineLibrary:constants:]", "UniDeviceCache.m", 212, "deviceDict");
    objc_msgSend_setObject_forKeyedSubscript_(v36, v37, (uint64_t)v21, v17);

    objc_sync_exit(v24);
  }

  return v21;
}

+ (id)findComputeKernel:(id)a3 library:(id)a4 constants:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;
  void *v20;
  void *v21;
  UniKernel *v22;
  const char *v23;
  id v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_library(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  sub_24B6D5ED0();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)qword_2544D9D18;
  qword_2544D9D18 = v16;

  v36[0] = CFSTR("name");
  v36[1] = CFSTR("constants");
  v19 = (id)MEMORY[0x24BDBD1B8];
  if (v9)
    v19 = v9;
  v37[0] = v7;
  v37[1] = v19;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v18, (uint64_t)v37, v36, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6D5494(v20, v15, (void *)qword_2544D9D18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v22 = [UniKernel alloc];
    v21 = (void *)objc_msgSend_initWithName_library_constants_(v22, v23, (uint64_t)v7, v8, v9);
    if (!v21)
      sub_24B6F0E00();
    v24 = (id)qword_2544D9D18;
    objc_sync_enter(v24);
    v25 = (void *)qword_2544D9D18;
    v26 = (void *)MEMORY[0x24BDD16E0];
    v29 = objc_msgSend_registryID(v15, v27, v28);
    objc_msgSend_numberWithUnsignedLongLong_(v26, v30, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v25, v32, (uint64_t)v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
      __assert_rtn("+[UniDeviceCache findComputeKernel:library:constants:]", "UniDeviceCache.m", 244, "deviceDict");
    objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)v21, v20);

    objc_sync_exit(v24);
  }

  return v21;
}

+ (void)clearAllCaches
{
  NSObject *v2;
  os_activity_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  const char *v29;
  uint64_t v30;
  const char *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _QWORD v47[3];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  uni_activity();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = _os_activity_create(&dword_24B6B5000, "clearAllCaches", v2, OS_ACTIVITY_FLAG_DEFAULT);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = qword_2579AEBB8;
  if (!qword_2579AEBB8)
    v5 = MEMORY[0x24BDBD1B8];
  v6 = qword_2579AEBA8;
  if (!qword_2579AEBA8)
    v6 = MEMORY[0x24BDBD1B8];
  v47[0] = v5;
  v47[1] = v6;
  v7 = qword_2544D9D18;
  if (!qword_2544D9D18)
    v7 = MEMORY[0x24BDBD1B8];
  v47[2] = v7;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v4, (uint64_t)v47, 3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v41, v48, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(obj);
        v12 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_sync_enter(v12);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend_allValues(v12, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v37, v46, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v38 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend_removeAllObjects(v20, v21, v22);
            }
            v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v21, (uint64_t)&v37, v46, 16);
          }
          while (v17);
        }

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v23 = v12;
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v33, v45, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v34;
          while (2)
          {
            for (k = 0; k != v26; ++k)
            {
              if (*(_QWORD *)v34 != v27)
                objc_enumerationMutation(v23);
              if (*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k))
              {

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend_removeAllObjects(v23, v29, v30);
                goto LABEL_32;
              }
            }
            v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v33, v45, 16);
            if (v26)
              continue;
            break;
          }
        }

LABEL_32:
        objc_sync_exit(v23);

      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v41, v48, 16);
    }
    while (v9);
  }

}

@end
