@implementation PMLMultiLabelEspressoClassifier

- (unint64_t)outputDimension
{
  return self->_outputNumReplyClasses;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)PMLMultiLabelEspressoClassifier;
  -[PMLMultiLabelEspressoClassifier dealloc](&v3, sel_dealloc);
}

- (PMLMultiLabelEspressoClassifier)initWithEspressoContext:(void *)a3 espressoPlan:(void *)a4 espressoModel:(id)a5 inputNumParameters:(unint64_t)a6 outputNumReplyClasses:(unint64_t)a7
{
  uint64_t v9;
  void *var0;
  PMLMultiLabelEspressoClassifier *result;
  objc_super v14;

  v9 = *(_QWORD *)&a5.var1;
  var0 = a5.var0;
  v14.receiver = self;
  v14.super_class = (Class)PMLMultiLabelEspressoClassifier;
  result = -[PMLMultiLabelEspressoClassifier init](&v14, sel_init);
  if (result)
  {
    result->_espressoPlan = a4;
    result->_espressoContext = a3;
    result->_espressoModel.plan = var0;
    *(_QWORD *)&result->_espressoModel.network_index = v9;
    result->_outputNumReplyClasses = a7;
    result->_inputNumParameters = a6;
  }
  return result;
}

- (id)predict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  int v13;
  NSObject *v14;
  uint32_t v15;
  int v16;
  double v17;
  int v18;
  id v19;
  unint64_t v21;
  void *v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  int v26;
  _OWORD v27[10];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x2199EA600]();
  objc_msgSend(CFSTR("inputSequence"), "cStringUsingEncoding:", 4);
  v7 = espresso_network_bind_buffer();
  if (v7)
  {
    v8 = v7;
    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v27[0]) = 138412546;
      *(_QWORD *)((char *)v27 + 4) = CFSTR("inputSequence");
      WORD6(v27[0]) = 1024;
      *(_DWORD *)((char *)v27 + 14) = v8;
      v10 = "Could not bind the input buffer to layer %@ in espresso plan, status code %d";
      v11 = (uint8_t *)v27;
LABEL_7:
      v14 = v9;
      v15 = 18;
LABEL_8:
      _os_log_fault_impl(&dword_2159BB000, v14, OS_LOG_TYPE_FAULT, v10, v11, v15);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  objc_msgSend(v4, "sparseVectorToDense:length:", 0, self->_inputNumParameters);
  v28 = 0;
  memset(v27, 0, sizeof(v27));
  objc_msgSend(CFSTR("outputLabels"), "cStringUsingEncoding:", 4);
  v12 = espresso_network_bind_buffer();
  if (v12)
  {
    v13 = v12;
    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = CFSTR("outputLabels");
      v25 = 1024;
      v26 = v13;
      v10 = "Could not bind the output buffer to layer %@ in espresso plan, status code %d";
      v11 = buf;
      goto LABEL_7;
    }
LABEL_11:

    objc_autoreleasePoolPop(v6);
    v19 = 0;
    goto LABEL_12;
  }
  v16 = espresso_plan_execute_sync();
  if (v16)
  {
    v18 = v16;
    PML_LogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = v18;
    v10 = "Could not execute espresso plan, status code %d";
    v11 = buf;
    v14 = v9;
    v15 = 8;
    goto LABEL_8;
  }
  if (self->_outputNumReplyClasses)
  {
    v21 = 0;
    do
    {
      LODWORD(v17) = *(_DWORD *)(*(_QWORD *)&v27[0] + 4 * v21);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v22);

      ++v21;
    }
    while (self->_outputNumReplyClasses > v21);
  }
  objc_autoreleasePoolPop(v6);
  v19 = v5;
LABEL_12:

  return v19;
}

+ (id)makeStringForShape:(unint64_t)a3[10]
{
  void *v4;
  uint64_t i;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "appendString:", CFSTR("{"));
  for (i = 0; i != 10; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR(" %zu"), a3[i]);
  objc_msgSend(v4, "appendString:", CFSTR(" }"));
  return v4;
}

+ (unint64_t)getNumParametersFromShape:(unint64_t)a3[10] rank:(unint64_t)a4
{
  unint64_t v4;
  unint64_t result;
  uint64_t v6;

  if (!a4)
    return 0;
  v4 = 10;
  if (a4 < 0xA)
    v4 = a4;
  result = 1;
  do
  {
    v6 = *a3++;
    result *= v6;
    --v4;
  }
  while (v4);
  return result;
}

+ (id)classifierWithEspressoModelFile:(id)a3
{
  id v3;
  uint64_t context;
  uint64_t v5;
  uint64_t plan;
  uint64_t v7;
  id v8;
  int v9;
  int v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  int v17;
  int v18;
  NSObject *v19;
  const char *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  const char *v29;
  int v30;
  int v31;
  uint8_t *v32;
  unint64_t v33;
  unint64_t v34;
  NSObject *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  unint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint8_t v44[4];
  const __CFString *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  unint64_t v51;
  _OWORD v52[5];
  uint8_t v53[32];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  _OWORD v63[5];
  uint8_t buf[32];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  context = espresso_create_context();
  if (!context)
  {
    PML_LogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v12 = "Could not create espresso context";
LABEL_22:
    v13 = v11;
    v14 = 2;
    goto LABEL_23;
  }
  v5 = context;
  plan = espresso_create_plan();
  if (!plan)
  {
    PML_LogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v12 = "Could not create espresso plan";
    goto LABEL_22;
  }
  v7 = plan;
  v8 = objc_retainAutorelease(v3);
  objc_msgSend(v8, "UTF8String");
  v9 = espresso_plan_add_network();
  if (v9)
  {
    v10 = v9;
    PML_LogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 65568;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v10;
      v12 = "Could not add espresso network from file %@ with storage type %05x, status code %d";
      v13 = v11;
      v14 = 24;
LABEL_23:
      _os_log_fault_impl(&dword_2159BB000, v13, OS_LOG_TYPE_FAULT, v12, buf, v14);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend(CFSTR("inputSequence"), "cStringUsingEncoding:", 4);
  v17 = espresso_network_declare_input();
  if (v17)
  {
    v18 = v17;
    PML_LogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = CFSTR("inputSequence");
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v18;
      v20 = "Could not declare espresso network input %@, status code %d";
LABEL_33:
      _os_log_fault_impl(&dword_2159BB000, v19, OS_LOG_TYPE_FAULT, v20, buf, 0x12u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  objc_msgSend(CFSTR("outputLabels"), "cStringUsingEncoding:", 4);
  v21 = espresso_network_declare_output();
  if (v21)
  {
    v22 = v21;
    PML_LogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = CFSTR("outputLabels");
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v22;
      v20 = "Could not declare espresso network output %@, status code %d";
      goto LABEL_33;
    }
LABEL_17:

    goto LABEL_10;
  }
  v23 = espresso_plan_build();
  if (v23)
  {
    v24 = v23;
    PML_LogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v24;
      v12 = "Could not build espresso plan, status code %d";
      v13 = v11;
      v14 = 8;
      goto LABEL_23;
    }
LABEL_9:

LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  v25 = (void *)MEMORY[0x2199EA600]();
  v73 = 0;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  memset(buf, 0, sizeof(buf));
  objc_msgSend(CFSTR("inputSequence"), "cStringUsingEncoding:", 4);
  v26 = espresso_network_bind_buffer();
  if (v26)
  {
    v27 = v26;
    PML_LogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v53 = 138412546;
      *(_QWORD *)&v53[4] = CFSTR("inputSequence");
      *(_WORD *)&v53[12] = 1024;
      *(_DWORD *)&v53[14] = v27;
      v29 = "Could not bind the input buffer to layer %@ in espresso plan during initialization, status code %d";
LABEL_30:
      v32 = v53;
LABEL_31:
      _os_log_fault_impl(&dword_2159BB000, v28, OS_LOG_TYPE_FAULT, v29, v32, 0x12u);
      goto LABEL_41;
    }
    goto LABEL_41;
  }
  memset(v63, 0, sizeof(v63));
  v30 = espresso_buffer_unpack_tensor_shape();
  if (v30)
  {
    v31 = v30;
    PML_LogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v53 = 138412546;
      *(_QWORD *)&v53[4] = CFSTR("inputSequence");
      *(_WORD *)&v53[12] = 1024;
      *(_DWORD *)&v53[14] = v31;
      v29 = "Unable to get input shape to layer %@ in espresso plan during initialization, status code %d";
      goto LABEL_30;
    }
LABEL_41:

    objc_autoreleasePoolPop(v25);
    goto LABEL_10;
  }
  v33 = 0x24D3DA000uLL;
  v34 = +[PMLMultiLabelEspressoClassifier getNumParametersFromShape:rank:](PMLMultiLabelEspressoClassifier, "getNumParametersFromShape:rank:", v63, 0);
  PML_LogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    +[PMLMultiLabelEspressoClassifier makeStringForShape:](PMLMultiLabelEspressoClassifier, "makeStringForShape:", v63);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v53 = 138413058;
    *(_QWORD *)&v53[4] = CFSTR("inputSequence");
    *(_WORD *)&v53[12] = 2048;
    *(_QWORD *)&v53[14] = 0;
    *(_WORD *)&v53[22] = 2112;
    *(_QWORD *)&v53[24] = v42;
    LOWORD(v54) = 2048;
    *(_QWORD *)((char *)&v54 + 2) = v34;
    _os_log_debug_impl(&dword_2159BB000, v35, OS_LOG_TYPE_DEBUG, "Input layer %@ has rank %zu, shape %@, num parameters %tu", v53, 0x2Au);

  }
  v62 = 0;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  memset(v53, 0, sizeof(v53));
  objc_msgSend(CFSTR("outputLabels"), "cStringUsingEncoding:", 4);
  v36 = espresso_network_bind_buffer();
  if (v36)
  {
    v37 = v36;
    PML_LogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      goto LABEL_41;
    LODWORD(v52[0]) = 138412546;
    *(_QWORD *)((char *)v52 + 4) = CFSTR("outputLabels");
    WORD6(v52[0]) = 1024;
    *(_DWORD *)((char *)v52 + 14) = v37;
    v29 = "Could not bind the output buffer to layer %@ in espresso plan during initialization, status code %d";
    v32 = (uint8_t *)v52;
    goto LABEL_31;
  }
  memset(v52, 0, sizeof(v52));
  v38 = espresso_buffer_unpack_tensor_shape();
  if (v38)
  {
    v39 = v38;
    PML_LogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      goto LABEL_41;
    *(_DWORD *)v44 = 138412546;
    v45 = CFSTR("outputLabels");
    v46 = 1024;
    LODWORD(v47) = v39;
    v29 = "Unable to get output shape to layer %@ in espresso plan during initialization, status code %d";
    v32 = v44;
    goto LABEL_31;
  }
  v40 = +[PMLMultiLabelEspressoClassifier getNumParametersFromShape:rank:](PMLMultiLabelEspressoClassifier, "getNumParametersFromShape:rank:", v52, 0);
  PML_LogHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    +[PMLMultiLabelEspressoClassifier makeStringForShape:](PMLMultiLabelEspressoClassifier, "makeStringForShape:", v52);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v44 = 138413058;
    v45 = CFSTR("outputLabels");
    v46 = 2048;
    v47 = 0;
    v48 = 2112;
    v49 = v43;
    v50 = 2048;
    v51 = v40;
    _os_log_debug_impl(&dword_2159BB000, v41, OS_LOG_TYPE_DEBUG, "Output layer %@ has rank %zu, shape %@, num parameters %tu", v44, 0x2Au);

    v33 = 0x24D3DA000;
  }

  objc_autoreleasePoolPop(v25);
  v15 = (void *)objc_msgSend(objc_alloc(*(Class *)(v33 + 1440)), "initWithEspressoContext:espressoPlan:espressoModel:inputNumParameters:outputNumReplyClasses:", v5, v7, 0, 0, v34, v40);
LABEL_11:

  return v15;
}

@end
