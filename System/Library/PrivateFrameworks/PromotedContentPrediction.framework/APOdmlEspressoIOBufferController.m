@implementation APOdmlEspressoIOBufferController

- (APOdmlEspressoIOBufferController)initWithRequiredFeatures:(id)a3 recipe:(id)a4
{
  id v6;
  APOdmlEspressoIOBufferController *v7;
  APOdmlEspressoIOBufferController *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSArray *v27;
  unint64_t i;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  BOOL v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  NSArray *weightBuffers;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v42 = a4;
  v47.receiver = self;
  v47.super_class = (Class)APOdmlEspressoIOBufferController;
  v7 = -[APOdmlEspressoIOBufferController init](&v47, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_recipe, a4);
    v8->_pTTR = ($FD4688982923A924290ECB669CAF1EC2 *)malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
    v8->_loss = ($FD4688982923A924290ECB669CAF1EC2 *)malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
    v8->_isTraining = ($FD4688982923A924290ECB669CAF1EC2 *)malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
    v8->_learningRate = ($FD4688982923A924290ECB669CAF1EC2 *)malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v12 = v6;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v43, v48, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v44;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v44 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v16);
          v18 = malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
          objc_msgSend_valueWithPointer_(MEMORY[0x1E0CB3B18], v19, (uint64_t)v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v11, v21, (uint64_t)v20, v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v22, (uint64_t)&v43, v48, 16);
      }
      while (v14);
    }

    objc_storeStrong((id *)&v8->_inputBuffers, v11);
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v23, v24);
    v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; ++i)
    {
      objc_msgSend_recipe(v8, v25, v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_weightNames(v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = i < objc_msgSend_count(v32, v33, v34);

      if (!v35)
        break;
      v36 = malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
      objc_msgSend_valueWithPointer_(MEMORY[0x1E0CB3B18], v37, (uint64_t)v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v27, v39, (uint64_t)v38);

    }
    weightBuffers = v8->_weightBuffers;
    v8->_weightBuffers = v27;

  }
  return v8;
}

- (BOOL)bindBuffersTo:(id *)a3 error:(id *)a4
{
  unint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  const char *v32;
  id v33;
  BOOL result;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t isTraining;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  const char *v84;
  void *v85;
  const char *v86;
  id *v87;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t v93[128];
  uint8_t buf[4];
  int v95;
  uint64_t v96;

  v87 = a4;
  v5 = 0;
  v96 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    objc_msgSend_recipe(self, a2, (uint64_t)a3, v87);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_weightNames(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_count(v9, v10, v11);

    if (v5 >= v12)
      break;
    objc_msgSend_recipe(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_weightNames(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v18, v19, v5);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend_UTF8String(v20, v21, v22);
    objc_msgSend_weightBuffers(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v25, v26, v5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bufferPointer(v27, v28, v29);
    v30 = espresso_network_bind_buffer_to_global();

    ++v5;
    if (v30)
    {
      OdmlLogForCategory(0xBuLL);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v95 = v30;
        _os_log_impl(&dword_1B69D6000, v31, OS_LOG_TYPE_ERROR, "Failed initialize weights with status: %d", buf, 8u);
      }

      if (v87)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v32, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 8025, 0);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        result = 0;
        *v87 = v33;
        return result;
      }
      return 0;
    }
  }
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  objc_msgSend_inputBuffers(self, v13, v14);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v89, v93, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v90;
    while (2)
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v90 != v40)
          objc_enumerationMutation(v35);
        v42 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
        objc_msgSend_inputBuffers(self, v37, v38);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v43, v44, v42);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend_bufferPointer(v45, v46, v47);

        if ((objc_msgSend__bindBuffer_espressoNet_bufferName_bufferType_(self, v49, v48, a3, v42, 0) & 1) == 0)
        {
          objc_msgSend_errorForFeatureNotBinded_(MEMORY[0x1E0CB35C8], v37, v42);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__setErrorPtr_toError_(self, v86, (uint64_t)v87, v85);

          return 0;
        }
      }
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v37, (uint64_t)&v89, v93, 16);
      if (v39)
        continue;
      break;
    }
  }

  v52 = objc_msgSend_pTTR(self, v50, v51);
  if ((objc_msgSend__bindBuffer_espressoNet_bufferName_bufferType_(self, v53, v52, a3, CFSTR("pTTR"), 1) & 1) != 0)
  {
    v56 = objc_msgSend_loss(self, v54, v55);
    objc_msgSend_recipe(self, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lossName(v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v56) = objc_msgSend__bindBuffer_espressoNet_bufferName_bufferType_(self, v63, v56, a3, v62, 1);

    if ((v56 & 1) != 0)
    {
      isTraining = objc_msgSend_isTraining(self, v64, v65);
      objc_msgSend_recipe(self, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_isTrainingName(v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(isTraining) = objc_msgSend__bindBuffer_espressoNet_bufferName_bufferType_(self, v73, isTraining, a3, v72, 2);

      if ((isTraining & 1) != 0)
      {
        v76 = objc_msgSend_learningRate(self, v74, v75);
        objc_msgSend_recipe(self, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_learningRateName(v79, v80, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v76) = objc_msgSend__bindBuffer_espressoNet_bufferName_bufferType_(self, v83, v76, a3, v82, 2);

        if ((v76 & 1) != 0)
          return 1;
        objc_msgSend__setError_errorCode_(self, v84, (uint64_t)v87, 8024);
      }
      else
      {
        objc_msgSend__setError_errorCode_(self, v74, (uint64_t)v87, 8023);
      }
    }
    else
    {
      objc_msgSend__setError_errorCode_(self, v64, (uint64_t)v87, 8022);
    }
  }
  else
  {
    objc_msgSend__setError_errorCode_(self, v54, (uint64_t)v87, 8021);
  }
  return 0;
}

- (BOOL)_bindBuffer:(id *)a3 espressoNet:(id *)a4 bufferName:(id)a5 bufferType:(int)a6
{
  id v7;
  const char *v8;
  uint64_t v9;
  int v10;
  BOOL v11;

  v7 = objc_retainAutorelease(a5);
  objc_msgSend_UTF8String(v7, v8, v9);
  if (a6 < 2)
  {
    v10 = espresso_network_bind_buffer();
  }
  else if (a6 == 2)
  {
    v10 = espresso_network_bind_buffer_to_global();
  }
  else
  {
    v10 = -1;
  }
  v11 = v10 == 0;

  return v11;
}

- (BOOL)setInputData:(id)a3 batchSize:(unint64_t)a4 network:(id *)a5 reportMissingFeature:(BOOL)a6 error:(id *)a7
{
  const char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  _BOOL4 v27;
  const char *v28;
  void *v29;
  const char *v30;
  char v31;
  unint64_t v33;
  BOOL v34;
  _BOOL4 v36;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v36 = a6;
  v44 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v33 = a4;
  if (a4)
  {
    v34 = 0;
    v12 = 0;
    v13 = 0uLL;
    do
    {
      v41 = v13;
      v42 = v13;
      v39 = v13;
      v40 = v13;
      objc_msgSend_inputBuffers(self, v9, v10, v33);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v14;
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v39, v43, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v40;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v40 != v18)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend_objectAtIndexedSubscript_(v11, v16, v12);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_features(v21, v22, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v24, v25, v20);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26 == 0;

            if (v27)
            {
              if (v36)
                objc_msgSend_reportMissingFeatureError_(self, v28, v20);
              if (!objc_msgSend_imputeFeature_network_offsetIndex_error_(self, v28, v20, a5, v12, a7))
              {
LABEL_18:

                goto LABEL_19;
              }
            }
            else
            {
              objc_msgSend_objectAtIndexedSubscript_(v11, v28, v12);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend_setFeatureDataForRow_offsetIndex_featureName_error_(self, v30, (uint64_t)v29, v12, v20, a7);

              if ((v31 & 1) == 0)
                goto LABEL_18;
            }
          }
          v14 = obj;
          v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v39, v43, 16);
          if (v17)
            continue;
          break;
        }
      }

      v34 = ++v12 >= v33;
      v13 = 0uLL;
    }
    while (v12 != v33);
  }
  v34 = 1;
LABEL_19:

  return v34;
}

- (BOOL)imputeFeature:(id)a3 network:(id *)a4 offsetIndex:(unint64_t)a5 error:(id *)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *__p;
  uint64_t v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend_inputBuffers(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (uint64_t *)objc_msgSend_bufferPointer(v14, v15, v16);

  objc_msgSend_getEspressoBufferShape_(self, v18, (uint64_t)v17);
  v19 = *(_QWORD *)(v28 - 8);
  if (v19)
  {
    v20 = __p;
    v21 = *v17;
    if (v19 == 1)
      *(_DWORD *)(v21 + 4 * a5) = 2143289344;
    else
      memset_pattern16((void *)(v21 + 4 * v19 * a5), &unk_1B6A04100, 4 * v19);
LABEL_9:
    operator delete(v20);
    goto LABEL_10;
  }
  OdmlLogForCategory(0xBuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v9;
    _os_log_impl(&dword_1B69D6000, v22, OS_LOG_TYPE_ERROR, "Unable to resolve feature name %@", buf, 0xCu);
  }

  objc_msgSend_errorForFeatureNotFound_(MEMORY[0x1E0CB35C8], v23, (uint64_t)v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setErrorPtr_toError_(self, v25, (uint64_t)a6, v24);

  v20 = __p;
  if (__p)
    goto LABEL_9;
LABEL_10:

  return v19 != 0;
}

- (BOOL)setFeatureDataForRow:(id)a3 offsetIndex:(unint64_t)a4 featureName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  _QWORD *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  int v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  int v51;
  NSObject *v52;
  const char *v53;
  void *v54;
  const char *v55;
  NSObject *v56;
  const char *v58;
  const char *v59;
  unint64_t v61;
  uint64_t v62;
  void *__p;
  uint64_t v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  unint64_t v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend_features(v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_count(v16, v17, v18);

  if (v19)
  {
    objc_msgSend_inputBuffers(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (_QWORD *)objc_msgSend_bufferPointer(v24, v25, v26);
    v61 = a4;

    objc_msgSend_getEspressoBufferShape_(self, v28, (uint64_t)v27);
    v31 = *(_QWORD *)(v64 - 8);
    v32 = v19 == v31;
    if (v19 == v31)
    {
      if (v19 >= 2)
      {
        v33 = 0;
        v34 = 4 * v19 * v61;
        do
        {
          objc_msgSend_features(v10, v29, v30, v61);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v35, v36, (uint64_t)v11);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v37, v38, v33);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_floatValue(v39, v40, v41);
          *(_DWORD *)(*v27 + v34 + 4 * v33) = v42;

          ++v33;
        }
        while (v19 != v33);
LABEL_16:
        if (__p)
          operator delete(__p);
        goto LABEL_18;
      }
      objc_msgSend_features(v10, v29, v30, v61);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v43, v44, (uint64_t)v11);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_floatValue(v48, v49, v50);
      *(_DWORD *)(*v27 + 4 * v62) = v51;
    }
    else
    {
      OdmlLogForCategory(0xBuLL);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v66 = v11;
        v67 = 2048;
        v68 = v19;
        v69 = 2048;
        v70 = v31;
        _os_log_impl(&dword_1B69D6000, v56, OS_LOG_TYPE_ERROR, "Device has feature %@ with size %lu but model expects size %lu", buf, 0x20u);
      }

      objc_msgSend_errorForFeatureShapeMismatch_(MEMORY[0x1E0CB35C8], v58, (uint64_t)v11);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__setErrorPtr_toError_(self, v59, (uint64_t)a6, v48);
    }

    goto LABEL_16;
  }
  OdmlLogForCategory(0xBuLL);
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v66 = v11;
    _os_log_impl(&dword_1B69D6000, v52, OS_LOG_TYPE_ERROR, "Unable to resolve feature name %@", buf, 0xCu);
  }

  objc_msgSend_errorForFeatureNotFound_(MEMORY[0x1E0CB35C8], v53, (uint64_t)v11);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setErrorPtr_toError_(self, v55, (uint64_t)a6, v54);

  v32 = 0;
LABEL_18:

  return v32;
}

- (BOOL)_setError:(id *)a3 errorCode:(int64_t)a4
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), a4, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3 != 0;
}

- (BOOL)_setErrorPtr:(id *)a3 toError:(id)a4
{
  if (a3)
    *a3 = objc_retainAutorelease(a4);
  return a3 != 0;
}

- (void)reportMissingFeatureError:(id)a3
{
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  id v13;

  v13 = a3;
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v3, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 8038, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v7, v8, (uint64_t)v13, CFSTR("featureName"));
  v11 = (void *)objc_msgSend_copy(v7, v9, v10);
  objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsModelTraining, v12, (uint64_t)v4, v11);

}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *isTraining;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  objc_super v29;
  uint8_t buf[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend_pTTR(self, a2, v2);
  free(v4);
  v7 = (void *)objc_msgSend_loss(self, v5, v6);
  free(v7);
  isTraining = (void *)objc_msgSend_isTraining(self, v8, v9);
  free(isTraining);
  v13 = (void *)objc_msgSend_learningRate(self, v11, v12);
  free(v13);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend_weightBuffers(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v31, v35, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v32;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v16);
        v23 = (void *)objc_msgSend_bufferPointer(*(void **)(*((_QWORD *)&v31 + 1) + 8 * v22), v18, v19);
        if (v23)
        {
          free(v23);
        }
        else
        {
          OdmlLogForCategory(0xBuLL);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B69D6000, v24, OS_LOG_TYPE_ERROR, "Weight buffer is released too early.", buf, 2u);
          }

        }
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v31, v35, 16);
    }
    while (v20);
  }

  objc_msgSend_inputBuffers(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v27, v28, (uint64_t)&unk_1E6A29380);

  v29.receiver = self;
  v29.super_class = (Class)APOdmlEspressoIOBufferController;
  -[APOdmlEspressoIOBufferController dealloc](&v29, sel_dealloc);
}

- (vector<unsigned)getEspressoBufferShape:(APOdmlEspressoIOBufferController *)self
{
  espresso_buffer_unpack_tensor_shape();
  return (vector<unsigned long, std::allocator<unsigned long>> *)sub_1B69DD928(retstr, 0);
}

- (NSDictionary)inputBuffers
{
  return self->_inputBuffers;
}

- ($FD4688982923A924290ECB669CAF1EC2)pTTR
{
  return self->_pTTR;
}

- ($FD4688982923A924290ECB669CAF1EC2)loss
{
  return self->_loss;
}

- ($FD4688982923A924290ECB669CAF1EC2)isTraining
{
  return self->_isTraining;
}

- ($FD4688982923A924290ECB669CAF1EC2)learningRate
{
  return self->_learningRate;
}

- (NSArray)weightBuffers
{
  return self->_weightBuffers;
}

- (APOdmlRecipe)recipe
{
  return self->_recipe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_weightBuffers, 0);
  objc_storeStrong((id *)&self->_inputBuffers, 0);
}

@end
