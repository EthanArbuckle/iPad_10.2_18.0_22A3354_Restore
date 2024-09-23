@implementation APOdmlEspressoFacade

- (APOdmlEspressoFacade)initWithEspressoNetURL:(id)a3 recipe:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  APOdmlEspressoFacade *v10;
  APOdmlEspressoFacade *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *requiredFeatures;
  APOdmlEspressoFacade *v23;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)APOdmlEspressoFacade;
  v10 = -[APOdmlEspressoFacade init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_recipe, a4);
    objc_msgSend_relativePath(v8, v12, v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend_UTF8String(v14, v15, v16);

    if ((objc_msgSend__loadEspressoNet_recipe_error_(v11, v18, v17, v9, a5) & 1) == 0)
    {
      v23 = 0;
      goto LABEL_6;
    }
    objc_msgSend__extractRequiredFeatures(v11, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    requiredFeatures = v11->_requiredFeatures;
    v11->_requiredFeatures = (NSArray *)v21;

  }
  v23 = v11;
LABEL_6:

  return v23;
}

- (BOOL)_loadEspressoNet:(const char *)a3 recipe:(id)a4 error:(id *)a5
{
  id v7;
  void *plan;
  $C4732ECC957FA13B9B3DF4A51A95735B *v9;
  int v10;
  NSObject *v11;
  uint64_t *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  BOOL v17;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  const char *v25;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  espresso_create_context();
  plan = (void *)espresso_create_plan();
  v9 = ($C4732ECC957FA13B9B3DF4A51A95735B *)malloc_type_malloc(0x10uLL, 0x10800409227ACB4uLL);
  v10 = espresso_plan_add_network();
  if (v10)
  {
    OdmlLogForCategory(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v26 = 67109120;
      LODWORD(v27) = v10;
      _os_log_impl(&dword_1B69D6000, v11, OS_LOG_TYPE_ERROR, "Failed to add network to plan with status: %d", (uint8_t *)&v26, 8u);
    }
    v12 = &kAPODMLDESPluginFailedToAddNetworkToPlan;
LABEL_9:

    objc_msgSend_setError_errorCode_(self, v16, (uint64_t)a5, *v12);
    goto LABEL_10;
  }
  v15 = espresso_network_declare_output();
  if (v15)
  {
    OdmlLogForCategory(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v26 = 136315394;
      v27 = "pTTR";
      v28 = 1024;
      v29 = v15;
      _os_log_impl(&dword_1B69D6000, v11, OS_LOG_TYPE_ERROR, "Failed to declare output %s with status: %d", (uint8_t *)&v26, 0x12u);
    }
    v12 = &kAPODMLDESPluginFailedToDeclarePTTROutput;
    goto LABEL_9;
  }
  objc_msgSend_lossName(v7, v13, v14);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = objc_msgSend_UTF8String(v19, v20, v21);

  v23 = espresso_network_declare_output();
  if (!v23)
  {
    self->_espressoNet = v9;
    self->_espressoPlan = plan;
    v17 = 1;
    goto LABEL_11;
  }
  OdmlLogForCategory(0xBuLL);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v26 = 136315394;
    v27 = (const char *)v22;
    v28 = 1024;
    v29 = v23;
    _os_log_impl(&dword_1B69D6000, v24, OS_LOG_TYPE_ERROR, "Failed to declare output %s with status: %d", (uint8_t *)&v26, 0x12u);
  }

  objc_msgSend_setError_errorCode_(self, v25, (uint64_t)a5, 8015);
LABEL_10:
  v17 = 0;
LABEL_11:

  return v17;
}

- (id)_extractRequiredFeatures
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  const char *v8;
  uint64_t input_blob_name;
  void *v10;
  const char *v11;
  void *v12;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_espressoNet(self, v4, v5);
    input_blob_name = espresso_get_input_blob_name();
    if (!input_blob_name)
      break;
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v8, input_blob_name);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v11, (uint64_t)v10);

  }
  v12 = (void *)objc_msgSend_copy(v6, v8, 0);

  return v12;
}

- (BOOL)changeEspressoBatchSize:(unint64_t)a3 error:(id *)a4
{
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t i;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  _BYTE *v21;
  int v22;
  NSObject *v23;
  const char *v24;
  void *v26;
  void *v27;
  void *__p;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34[3];
  void *v35[3];
  void *v36[3];
  void *v37[3];
  void *v38[3];
  void *v39[3];
  uint8_t buf[8];
  _BYTE *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend_setFinalBatchSize_(self, a2, a3);
  objc_msgSend_requiredFeatures(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_count(v9, v10, v11);
  sub_1B69E9610(v39, v12);
  sub_1B69E9610(v38, v12);
  sub_1B69E9610(v37, v12);
  sub_1B69E9610(v36, v12);
  sub_1B69E9610(v35, v12);
  sub_1B69E9610(v34, v12);
  v15 = malloc_type_malloc(8 * v12, 0x10040436913F5uLL);
  if (v12)
  {
    for (i = 0; i != v12; ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v9, v13, i);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15[i] = objc_msgSend_UTF8String(v17, v18, v19);
      objc_msgSend__getEspressoBlobShape_(self, v20, (uint64_t)v17);
      v21 = *(_BYTE **)buf;
      **(_QWORD **)buf = a3;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v29 = 0;
      v30 = 0;
      __p = 0;
      sub_1B69E96F8(&__p, v21, (uint64_t)v41, (v41 - v21) >> 3);
      nd_shape_to_5d_shape((uint64_t *)&__p, &v31);
      if (__p)
      {
        v29 = __p;
        operator delete(__p);
      }
      *((_DWORD *)v39[0] + i) = v31;
      *((_DWORD *)v38[0] + i) = HIDWORD(v31);
      *((_DWORD *)v37[0] + i) = v32;
      *((_DWORD *)v36[0] + i) = HIDWORD(v32);
      *((_DWORD *)v35[0] + i) = v33;
      *((_DWORD *)v34[0] + i) = HIDWORD(v33);
      if (*(_QWORD *)buf)
      {
        v41 = *(_BYTE **)buf;
        operator delete(*(void **)buf);
      }

    }
  }
  objc_msgSend_espressoNet(self, v13, v14);
  v26 = v35[0];
  v27 = v34[0];
  v22 = espresso_network_change_input_blob_shapes_seq_rank();
  free(v15);
  if (v22)
  {
    OdmlLogForCategory(0xBuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v22;
      _os_log_impl(&dword_1B69D6000, v23, OS_LOG_TYPE_ERROR, "Failed to change input shape with status: %d", buf, 8u);
    }

    objc_msgSend_setError_errorCode_(self, v24, (uint64_t)a4, 8016, v26, v27);
  }
  if (v34[0])
  {
    v34[1] = v34[0];
    operator delete(v34[0]);
  }
  if (v35[0])
  {
    v35[1] = v35[0];
    operator delete(v35[0]);
  }
  if (v36[0])
  {
    v36[1] = v36[0];
    operator delete(v36[0]);
  }
  if (v37[0])
  {
    v37[1] = v37[0];
    operator delete(v37[0]);
  }
  if (v38[0])
  {
    v38[1] = v38[0];
    operator delete(v38[0]);
  }
  if (v39[0])
  {
    v39[1] = v39[0];
    operator delete(v39[0]);
  }

  return v22 == 0;
}

- (vector<unsigned)_getEspressoBlobShape:(APOdmlEspressoFacade *)self
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  vector<unsigned long, std::allocator<unsigned long>> *result;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend_espressoNet(self, v7, v8);
  v9 = objc_retainAutorelease(v6);
  objc_msgSend_UTF8String(v9, v10, v11);
  espresso_network_query_blob_shape();
  sub_1B69DD928(retstr, 0);

  return result;
}

- (BOOL)finalizeEspressoPipeline:(id *)a3
{
  int v5;
  int v6;
  NSObject *v7;
  const char *v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend_espressoPlan(self, a2, (uint64_t)a3);
  v5 = espresso_plan_build();
  if (!v5)
    return MEMORY[0x1E0DE7D20](self, sel__prepareForTraining_, a3);
  v6 = v5;
  OdmlLogForCategory(0xBuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 67109120;
    v10[1] = v6;
    _os_log_impl(&dword_1B69D6000, v7, OS_LOG_TYPE_ERROR, "Build plan failed with status: %d", (uint8_t *)v10, 8u);
  }

  objc_msgSend_setError_errorCode_(self, v8, (uint64_t)a3, 8016);
  return 0;
}

- (BOOL)_prepareForTraining:(id *)a3
{
  APOdmlEspressoIOBufferController *v5;
  const char *v6;
  APOdmlEspressoIOBufferController *v7;
  APOdmlEspressoIOBufferController *bufferController;
  const char *v9;
  char v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;

  v5 = [APOdmlEspressoIOBufferController alloc];
  v7 = (APOdmlEspressoIOBufferController *)objc_msgSend_initWithRequiredFeatures_recipe_(v5, v6, (uint64_t)self->_requiredFeatures, self->_recipe);
  bufferController = self->_bufferController;
  self->_bufferController = v7;

  v10 = objc_msgSend_bindBuffersTo_error_(self->_bufferController, v9, (uint64_t)self->_espressoNet, a3);
  objc_msgSend_setEspressoNetworkFunction(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setErrorPtr_toError_(self, v14, (uint64_t)a3, v13);
  if (v13)
    v10 = 0;

  return v10;
}

- (id)setEspressoNetworkFunction
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t *v16;
  int v17;
  const char *v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  const char *v23;
  int v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend_espressoNet(self, a2, v2);
  objc_msgSend_recipe(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_functionInitName(v6, v7, v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v9, v10, v11);
  v12 = espresso_network_set_function_name();

  if (v12)
  {
    OdmlLogForCategory(0xBuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v25 = 67109120;
      v26 = v12;
      _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_ERROR, "Failed to set subnetwork function name with status: %d", (uint8_t *)&v25, 8u);
    }
    v16 = &kAPODMLDESPluginSubnetworkNameFail;
  }
  else
  {
    objc_msgSend_espressoPlan(self, v13, v14);
    v17 = espresso_plan_execute_sync();
    if (v17)
    {
      v20 = v17;
      OdmlLogForCategory(0xBuLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v25 = 67109120;
        v26 = v20;
        _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_ERROR, "Failed to execute sync with status: %d", (uint8_t *)&v25, 8u);
      }
      v16 = &kAPODMLDESPluginExecuteSyncFail;
    }
    else
    {
      objc_msgSend_espressoNet(self, v18, v19);
      get_main_function_name();
      v21 = espresso_network_set_function_name();
      if (!v21)
        return 0;
      v22 = v21;
      OdmlLogForCategory(0xBuLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v25 = 67109120;
        v26 = v22;
        _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_ERROR, "Failed to set main function name with status: %d", (uint8_t *)&v25, 8u);
      }
      v16 = &kAPODMLDESPluginMainFunctionNameFail;
    }
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v23, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), *v16, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)retrieveWeights:(id *)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  BOOL v12;
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
  char *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  float **v35;
  std::string *p_p;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  unint64_t i;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  BOOL v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  double v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  NSObject *v89;
  const char *v90;
  std::string __p;
  uint8_t v94[8];
  void *v95;
  char v96;
  uint8_t buf[4];
  std::string *v98;
  uint64_t v99;

  v4 = 0;
  v5 = 0;
  v99 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    objc_msgSend_recipe(self, a2, (uint64_t)a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_weightNames(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v4 < objc_msgSend_count(v9, v10, v11);

    if (!v12)
      break;
    objc_msgSend_recipe(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_weightNames(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v18, v19, v4);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = (char *)objc_msgSend_UTF8String(v20, v21, v22);
    sub_1B69E954C(v94, v23);

    OdmlLogForCategory(0xBuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_bufferController(self, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_weightBuffers(v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v30, v31, v4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (float **)objc_msgSend_bufferPointer(v32, v33, v34);
      print_espresso_buffer((char *)v94, v35, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      v98 = p_p;
      _os_log_impl(&dword_1B69D6000, v24, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);

    }
    objc_msgSend_bufferController(self, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_weightBuffers(v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v42, v43, v4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_bufferPointer(v44, v45, v46);
    v49 = objc_msgSend_numWeightsInBuffer_(self, v48, v47);

    if (v96 < 0)
      operator delete(*(void **)v94);
    v5 += v49;
    ++v4;
  }
  if (v5)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(__p.__r_.__value_.__l.__data_) = 0;
    sub_1B69E9770(v94, v5, &__p);
    for (i = 0; ; ++i)
    {
      objc_msgSend_recipe(self, v51, v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_weightNames(v54, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = i < objc_msgSend_count(v57, v58, v59);

      if (!v60)
        break;
      objc_msgSend_bufferController(self, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_weightBuffers(v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v66, v67, i);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend_bufferPointer(v68, v69, v70);
      v73 = objc_msgSend_numWeightsInBuffer_(self, v72, v71);

      if (v73)
      {
        for (j = 0; j != v73; ++j)
        {
          v75 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend_bufferController(self, v51, v52);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_weightBuffers(v76, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v79, v80, i);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v84) = *(_DWORD *)(*(_QWORD *)objc_msgSend_bufferPointer(v81, v82, v83) + 4 * j);
          objc_msgSend_numberWithFloat_(v75, v85, v86, v84);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v50, v88, (uint64_t)v87);

        }
      }
    }
    if (*(_QWORD *)v94)
    {
      v95 = *(void **)v94;
      operator delete(*(void **)v94);
    }
  }
  else
  {
    OdmlLogForCategory(0xBuLL);
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v94 = 0;
      _os_log_impl(&dword_1B69D6000, v89, OS_LOG_TYPE_ERROR, "Failed to find any weight.", v94, 2u);
    }

    objc_msgSend_setError_errorCode_(self, v90, (uint64_t)a3, 8029);
    v50 = 0;
  }
  return v50;
}

- (id)retrieveWeights2D:(id *)a3
{
  const char *v4;
  uint64_t v5;
  unint64_t i;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t j;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  id v48;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, (uint64_t)a3);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_recipe(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_weightNames(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_count(v10, v11, v12);

    if (i >= v13)
      break;
    objc_msgSend_bufferController(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_weightBuffers(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v19, v20, i);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_bufferPointer(v21, v22, v23);
    v26 = objc_msgSend_numWeightsInBuffer_(self, v25, v24);

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v27, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      for (j = 0; j != v26; ++j)
      {
        v33 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_bufferController(self, v29, v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_weightBuffers(v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v37, v38, i);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v42) = *(_DWORD *)(*(_QWORD *)objc_msgSend_bufferPointer(v39, v40, v41) + 4 * j);
        objc_msgSend_numberWithFloat_(v33, v43, v44, v42);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v31, v46, (uint64_t)v45);

      }
    }
    objc_msgSend_addObject_(v48, v29, (uint64_t)v31);

  }
  return v48;
}

- (unint64_t)numWeightsInBuffer:(id *)a3
{
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t *v15;
  unint64_t *v16;

  objc_msgSend_bufferController(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend_getEspressoBufferShape_(v4, v5, (uint64_t)a3);
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }

  v7 = (char *)v16 - (char *)v15;
  if (v16 != v15)
  {
    v8 = *v15;
    if ((unint64_t)v7 >= 9)
    {
      v9 = v7 >> 3;
      if (v15[(v7 >> 3) - 1] >= 2)
      {
        if (v9 <= 2)
          v9 = 2;
        v10 = v9 - 1;
        v11 = v15 + 1;
        do
        {
          v13 = *v11++;
          v12 = v13;
          if (v13 <= 1)
            v12 = 1;
          v8 *= v12;
          --v10;
        }
        while (v10);
      }
    }
    goto LABEL_15;
  }
  v8 = 0;
  if (v16)
LABEL_15:
    operator delete(v15);
  return v8;
}

- (id)computeClientPttr:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
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
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  _DWORD *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;

  v6 = a3;
  objc_msgSend_bufferController(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  **(_DWORD **)objc_msgSend_isTraining(v9, v10, v11) = 0;

  objc_msgSend_bufferController(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_copy(v6, v15, v16);
  v20 = objc_msgSend_espressoNet(self, v18, v19);
  LOBYTE(a4) = objc_msgSend_setInputData_batchSize_network_reportMissingFeature_error_(v14, v21, (uint64_t)v17, 1, v20, 0, a4);

  if ((a4 & 1) != 0)
  {
    objc_msgSend_espressoPlan(self, v22, v23);
    espresso_plan_execute_sync();
    objc_msgSend_bufferController(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_DWORD **)objc_msgSend_pTTR(v26, v27, v28);

    LODWORD(v30) = *v29;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v31, v32, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__checkModelOutput_(self, v34, (uint64_t)v33);
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void)_checkModelOutput:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  float v21;
  float v22;
  const char *v23;
  uint64_t v24;
  float v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  float v31;
  float v32;
  const char *v33;
  uint64_t v34;
  float v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  id v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  float v53;
  float v54;
  const char *v55;
  uint64_t v56;
  float v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v72 = a3;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v4, v5);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v71, v6, (uint64_t)CFSTR("modelOutput"), CFSTR("featureName"));
  if (v72)
  {
    objc_msgSend_stringValue(v72, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v71, v10, (uint64_t)v9, CFSTR("featureValue"));

    objc_msgSend_recipe(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rangeBoundaryForOutput_(v13, v14, 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_recipe(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rangeBoundaryForOutput_(v17, v18, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      objc_msgSend_floatValue(v72, v19, v20);
      v22 = v21;
      objc_msgSend_floatValue(v68, v23, v24);
      if (v22 < v25)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v19, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 8040, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend_copy(v71, v27, v28);
        objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsModelTraining, v30, (uint64_t)v26, v29);

      }
    }
    if (v70)
    {
      objc_msgSend_floatValue(v72, v19, v20);
      v32 = v31;
      objc_msgSend_floatValue(v70, v33, v34);
      if (v32 > v35)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v19, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 8039, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend_copy(v71, v37, v38);
        objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsModelTraining, v40, (uint64_t)v36, v39);

      }
    }
    objc_msgSend_recipe(self, v19, v20, v68);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sentinelValuesForOutput(v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v45 = v44;
    v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v73, v77, 16);
    if (v49)
    {
      v50 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v74 != v50)
            objc_enumerationMutation(v45);
          v52 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_msgSend_floatValue(v72, v47, v48);
          v54 = v53;
          objc_msgSend_floatValue(v52, v55, v56);
          if (v54 == v57)
          {
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v47, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 8041, 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = (void *)objc_msgSend_copy(v71, v59, v60);
            objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsModelTraining, v62, (uint64_t)v58, v61);

          }
        }
        v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v73, v77, 16);
      }
      while (v49);
    }

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v7, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 8041, 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend_copy(v71, v64, v65);
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsModelTraining, v67, (uint64_t)v63, v66);

  }
}

- (id)computeAccuracyAndLoss:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  float v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  char v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  float v47;
  float v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  double v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  unint64_t v60;
  uint64_t v61;
  _QWORD v62[3];

  v62[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_bufferController(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  **(_DWORD **)objc_msgSend_isTraining(v9, v10, v11) = 0;

  v14 = objc_msgSend_finalBatchSize(self, v12, v13);
  v17 = objc_msgSend_count(v6, v15, v16);
  v21 = 0.0;
  v22 = 0.0;
  v60 = v17 / v14;
  if (v14 > v17)
  {
LABEL_11:
    *(float *)&v20 = v21 / (float)v60;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v18, v19, v20);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v52;
    *(float *)&v53 = v22 / (float)v60;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v54, v55, v53);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v56;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v57, (uint64_t)v62, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
    v24 = 0;
    v25 = v17 / v14;
    if (v60 <= 1)
      v25 = 1;
    v61 = v25;
    while (1)
    {
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v18, v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v23;
      v29 = v14;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v6, v26, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v27, v31, (uint64_t)v30);

        ++v28;
        --v29;
      }
      while (v29);
      objc_msgSend_bufferController(self, v26, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend_copy(v27, v34, v35);
      v39 = objc_msgSend_espressoNet(self, v37, v38);
      v41 = objc_msgSend_setInputData_batchSize_network_reportMissingFeature_error_(v33, v40, (uint64_t)v36, v14, v39, 0, a4);

      if ((v41 & 1) == 0)
        break;
      objc_msgSend_espressoPlan(self, v42, v43);
      espresso_plan_execute_sync();
      objc_msgSend_accuracyInBatchWithError_(self, v44, (uint64_t)a4);
      v48 = v47;
      if (a4)
      {
        if (*a4)
          break;
      }
      objc_msgSend_bufferController(self, v45, v46);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v21 + v48;
      v22 = v22 + **(float **)objc_msgSend_loss(v49, v50, v51);

      ++v24;
      v23 += v14;
      if (v24 == v61)
        goto LABEL_11;
    }

    v58 = 0;
  }

  return v58;
}

- (float)accuracyInBatchWithError:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  _QWORD *v30;
  float v31;
  unint64_t v32;
  uint64_t v33;
  int v34;
  unint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  float *v39;
  float *v40;
  float *v41;
  float v42;
  uint64_t v43;
  float *v44;
  float v45;
  float v46;
  float v47;
  void *v48;
  const char *v49;
  unint64_t *__p;
  uint64_t v52;

  objc_msgSend_bufferController(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bufferController(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_pTTR(v8, v9, v10);
  if (v5)
  {
    objc_msgSend_getEspressoBufferShape_(v5, v12, v11);
  }
  else
  {
    __p = 0;
    v52 = 0;
  }

  objc_msgSend_bufferController(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputBuffers(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)CFSTR("Tapped"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend_bufferController(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputBuffers(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)CFSTR("Tap"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v30 = (_QWORD *)objc_msgSend_bufferPointer(v20, v21, v22);
  if (v30)
  {
    v31 = 0.0;
    if ((unint64_t)(v52 - (_QWORD)__p) >= 0x10)
    {
      v32 = *__p;
      if (*__p)
      {
        v33 = 0;
        v34 = 0;
        v35 = __p[1];
        do
        {
          objc_msgSend_bufferController(self, v28, v29);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (float *)(*(_QWORD *)objc_msgSend_pTTR(v36, v37, v38) + 4 * v33 * v35);

          if (v35 >= 2)
          {
            v41 = v39 + 1;
            v42 = *v39;
            v43 = 4 * v35 - 4;
            v40 = v39;
            v44 = v39 + 1;
            do
            {
              v45 = *v44++;
              v46 = v45;
              if (v42 < v45)
              {
                v42 = v46;
                v40 = v41;
              }
              v41 = v44;
              v43 -= 4;
            }
            while (v43);
          }
          else
          {
            v40 = v39;
          }
          if (((unint64_t)((char *)v40 - (char *)v39) >> 2) == llroundf(*(float *)(*v30 + 4 * v33)))
            ++v34;
          ++v33;
        }
        while (v33 != v32);
        v47 = (float)v34;
      }
      else
      {
        v47 = 0.0;
      }
      v31 = v47 / (float)v32;
    }
  }
  else
  {
    objc_msgSend_errorForFeatureNotBinded_(MEMORY[0x1E0CB35C8], v28, (uint64_t)CFSTR("Tapped"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setErrorPtr_toError_(self, v49, (uint64_t)a3, v48);

    v31 = 0.0;
  }

  if (__p)
    operator delete(__p);
  return v31;
}

- (BOOL)trainWithTrainingSet:(id)a3 error:(id *)a4
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  int v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL4 v46;
  const char *v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  int v67;
  float v68;
  float v69;
  NSObject *v70;
  NSObject *v71;
  const char *v72;
  unint64_t v74;
  BOOL v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BOOL4 v79;
  unint64_t v81;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  double v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v4 = a3;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v83, v93, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v84 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend_logTrainingRowFeatures_(APOdmlLogUtility, v6, *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i));
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v83, v93, 16);
    }
    while (v7);
  }

  objc_msgSend__preTrainingSetup(self, v10, v11);
  v81 = objc_msgSend_finalBatchSize(self, v12, v13);
  v76 = objc_msgSend_count(v4, v14, v15);
  objc_msgSend_recipe(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localIterationsCount(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend_unsignedIntegerValue(v21, v22, v23);

  v26 = (void *)objc_msgSend_mutableCopy(v4, v24, v25);
  objc_msgSend_printDESRecordRowOrder_iterationNumber_(APOdmlLogUtility, v27, (uint64_t)v26, &unk_1E6A33C30);
  if (v74)
  {
    v75 = 0;
    v30 = v76 / v81;
    if (v76 / v81 <= 1)
      v30 = 1;
    v77 = 0;
    v78 = v30;
    v31 = 1;
    while (1)
    {
      objc_msgSend_recipe(self, v28, v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shouldShuffle(v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend_BOOLValue(v35, v36, v37);

      if (v38)
      {
        objc_msgSend_shuffle(v26, v28, v29);
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v39, v77);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_printDESRecordRowOrder_iterationNumber_(APOdmlLogUtility, v41, (uint64_t)v26, v40);

      }
      if (v81 <= v76)
        break;
      v42 = v31;
LABEL_32:
      v31 = v42;
      v75 = ++v77 >= v74;
      if (v77 == v74)
        goto LABEL_33;
    }
    v43 = 0;
    v44 = 0;
    v46 = __ROR8__(0xCCCCCCCCCCCCCCCDLL * v77, 1) < 0x199999999999999AuLL || v77 == v74 - 1;
    v79 = v46;
    while (1)
    {
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v28, v29);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v43;
      v50 = v81;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v26, v47, v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v48, v52, (uint64_t)v51);

        ++v49;
        --v50;
      }
      while (v50);
      objc_msgSend_bufferController(self, v47, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)objc_msgSend_copy(v48, v55, v56);
      v60 = objc_msgSend_espressoNet(self, v58, v59);
      v62 = objc_msgSend_setInputData_batchSize_network_reportMissingFeature_error_(v54, v61, (uint64_t)v57, v81, v60, v31 & 1, a4);

      if ((v62 & 1) == 0)
        break;
      v67 = objc_msgSend__executeEspressoPlan(self, v63, v64);
      if (v67)
      {
        OdmlLogForCategory(0xBuLL);
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v88 = v77;
          v89 = 1024;
          LODWORD(v90) = v67;
          _os_log_impl(&dword_1B69D6000, v71, OS_LOG_TYPE_ERROR, "Failed to execute espresso plan for iter %zu due to %d.", buf, 0x12u);
        }

        objc_msgSend_setError_errorCode_(self, v72, (uint64_t)a4, 8027);
        break;
      }
      objc_msgSend__retrieveLossValue(self, v65, v66);
      if (v79)
      {
        v69 = v68;
        OdmlLogForCategory(0xBuLL);
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          v88 = v77;
          v89 = 2048;
          v90 = v44;
          v91 = 2048;
          v92 = v69;
          _os_log_impl(&dword_1B69D6000, v70, OS_LOG_TYPE_DEFAULT, "iter %04lu batch_num %04lu:\t loss = %f\n", buf, 0x20u);
        }

      }
      LOBYTE(v31) = 0;
      v42 = 0;
      ++v44;
      v43 += v81;
      if (v44 == v78)
        goto LABEL_32;
    }

  }
  else
  {
LABEL_33:
    v75 = 1;
  }

  return v75;
}

- (float)_retrieveLossValue
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  float v6;

  objc_msgSend_bufferController(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = **(float **)objc_msgSend_loss(v3, v4, v5);

  return v6;
}

- (void)_preTrainingSetup
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v20;
  id v21;

  objc_msgSend_recipe(self, a2, v2);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_learningRate(v20, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v6, v7, v8);
  v10 = v9;
  objc_msgSend_bufferController(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  **(_DWORD **)objc_msgSend_learningRate(v13, v14, v15) = v10;

  objc_msgSend_bufferController(self, v16, v17);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  **(_DWORD **)objc_msgSend_isTraining(v21, v18, v19) = 1065353216;

}

- (int)_executeEspressoPlan
{
  uint64_t v2;

  objc_msgSend_espressoPlan(self, a2, v2);
  return espresso_plan_execute_sync();
}

- (BOOL)setError:(id *)a3 errorCode:(int64_t)a4
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

- (void)dealloc
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  objc_msgSend_espressoPlan(self, a2, v2);
  espresso_plan_destroy();
  v6 = (void *)objc_msgSend_espressoNet(self, v4, v5);
  free(v6);
  v7.receiver = self;
  v7.super_class = (Class)APOdmlEspressoFacade;
  -[APOdmlEspressoFacade dealloc](&v7, sel_dealloc);
}

- (NSArray)requiredFeatures
{
  return self->_requiredFeatures;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)espressoNet
{
  return self->_espressoNet;
}

- (void)espressoPlan
{
  return self->_espressoPlan;
}

- (APOdmlRecipe)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_recipe, a3);
}

- (APOdmlEspressoIOBufferController)bufferController
{
  return self->_bufferController;
}

- (void)setBufferController:(id)a3
{
  objc_storeStrong((id *)&self->_bufferController, a3);
}

- (unint64_t)finalBatchSize
{
  return self->_finalBatchSize;
}

- (void)setFinalBatchSize:(unint64_t)a3
{
  self->_finalBatchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferController, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_requiredFeatures, 0);
}

@end
