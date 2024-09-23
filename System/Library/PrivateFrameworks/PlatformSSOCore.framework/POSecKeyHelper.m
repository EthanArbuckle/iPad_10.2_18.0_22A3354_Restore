@implementation POSecKeyHelper

+ (__SecKey)createUserSEPSigningKeyForAlgorithm:(id)a3
{
  return (__SecKey *)objc_msgSend(a1, "createUserSEPSigningKeyForAlgorithm:userPresence:currentSet:", a3, 0, 0);
}

+ (__SecKey)createUserSEPSigningKeyForAlgorithm:(id)a3 userPresence:(BOOL)a4 currentSet:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SecAccessControlRef v11;
  void *v12;
  uint64_t BiometryCurrentSet;
  id v14;
  void *v15;
  uint64_t Companion;
  void *v17;
  uint64_t KofN;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  int v25;
  id v26;
  void *v27;
  id v28;
  CFErrorRef v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const __CFDictionary *v40;
  id v41;
  void *v43;
  void *v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  CFErrorRef error;
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[2];
  const __CFString *v56;
  const __CFString *v57;
  void *v58;
  const __CFString *v59;
  _QWORD v60[3];

  v5 = a5;
  v6 = a4;
  v60[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  error = 0;
  v59 = CFSTR("osgn");
  v56 = CFSTR("com.apple.PlatformSSO.auth");
  v57 = CFSTR("cag");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x24BDE8F98], 0x40000000uLL, &error);
  if (!v11)
  {
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke;
    v49[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v49[4] = error;
    v14 = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke((uint64_t)v49);
    goto LABEL_38;
  }
  SecAccessControlSetConstraints();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      BiometryCurrentSet = SecAccessConstraintCreateBiometryCurrentSet();
    else
      BiometryCurrentSet = SecAccessConstraintCreateBiometryAny();
    v15 = (void *)BiometryCurrentSet;
    if (!BiometryCurrentSet)
    {
      CFRelease(v11);
      v23 = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_7();

LABEL_26:
      v11 = 0;
      goto LABEL_38;
    }
    Companion = SecAccessConstraintCreateCompanion();
    v17 = (void *)Companion;
    if (Companion)
    {
      v55[0] = v15;
      v55[1] = Companion;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
      KofN = SecAccessConstraintCreateKofN();
      v19 = (void *)KofN;
      if (KofN)
      {
        v44 = (void *)KofN;
        SecAccessControlGetConstraint();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v43, "mutableCopy");
        v21 = v20;
        if (v20)
          v22 = v20;
        else
          v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v27 = v22;

        v19 = v44;
        objc_msgSend(v27, "addEntriesFromDictionary:", v44);
        if ((SecAccessControlAddConstraintForOperation() & 1) != 0)
        {
          v25 = 0;
        }
        else
        {
          CFRelease(v11);
          v47[0] = MEMORY[0x24BDAC760];
          v47[1] = 3221225472;
          v47[2] = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_18;
          v47[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v47[4] = error;
          v28 = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_18((uint64_t)v47);
          v11 = 0;
          v25 = 1;
        }

      }
      else
      {
        CFRelease(v11);
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_14;
        v48[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v48[4] = error;
        v26 = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_14((uint64_t)v48);
        v11 = 0;
        v25 = 1;
      }

    }
    else
    {
      CFRelease(v11);
      v24 = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_10();
      v11 = 0;
      v25 = 1;
    }

    if (v25)
      goto LABEL_26;
  }
  SecAccessControlSetProtection();
  v29 = error;
  if (error)
  {
    if (v11)
    {
      CFRelease(v11);
      v29 = error;
    }
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_21;
    v46[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v46[4] = v29;
    v30 = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_21((uint64_t)v46);
    goto LABEL_26;
  }
  v31 = (id)*MEMORY[0x24BDE9060];
  if ((objc_msgSend(v7, "isEqualToNumber:", 0x251520F48) & 1) == 0)
  {
    if ((objc_msgSend(v7, "isEqualToNumber:", 0x251520F60) & 1) != 0)
    {
      v32 = &unk_251520F00;
      goto LABEL_33;
    }
    if (objc_msgSend(v7, "isEqualToNumber:", 0x251520F78))
    {
      v33 = (id)*MEMORY[0x24BDE9070];

      v32 = &unk_251520EE8;
      v31 = v33;
      goto LABEL_33;
    }
  }
  v32 = &unk_251520EE8;
LABEL_33:
  v34 = *MEMORY[0x24BDE9048];
  v53[0] = *MEMORY[0x24BDE9050];
  v53[1] = v34;
  v54[0] = v31;
  v54[1] = v32;
  v35 = *MEMORY[0x24BDE8F70];
  v36 = *MEMORY[0x24BDE9158];
  v53[2] = *MEMORY[0x24BDE8F60];
  v53[3] = v36;
  v37 = *MEMORY[0x24BDE9160];
  v54[2] = v35;
  v54[3] = v37;
  v53[4] = *MEMORY[0x24BDE9468];
  v38 = *MEMORY[0x24BDE8F48];
  v51[0] = *MEMORY[0x24BDE9018];
  v51[1] = v38;
  v52[0] = MEMORY[0x24BDBD1C0];
  v52[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v54[4] = v39;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 5);
  v40 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (v11)
    CFRelease(v11);
  v11 = SecKeyCreateRandomKey(v40, &error);
  if (!v11)
  {
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_26;
    v45[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v45[4] = error;
    v41 = __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_26((uint64_t)v45);
  }

LABEL_38:
  return v11;
}

id __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecAccessControlCreateWithFlags."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_7()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error with SecAccessConstraintCreateBiometry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POSecKeyHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_10()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error with SecAccessConstraintCreateCompanion."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POSecKeyHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_14(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecAccessConstraintCreateKofN."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_18(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error adding biometric constraint."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_21(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecAccessControlSetProtection."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __78__POSecKeyHelper_createUserSEPSigningKeyForAlgorithm_userPresence_currentSet___block_invoke_26(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecKeyCreateRandomKey."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

+ (__SecKey)createSEPSigningKeyForAlgorithm:(id)a3 shared:(BOOL)a4
{
  return (__SecKey *)objc_msgSend(a1, "createSEPSigningKeyForAlgorithm:shared:preboot:", a3, a4, 0);
}

+ (__SecKey)createSEPSigningKeyForAlgorithm:(id)a3 shared:(BOOL)a4 preboot:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SecAccessControlRef v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFDictionary *v32;
  id v33;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  CFErrorRef error;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[6];
  _QWORD v42[6];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[5];
  _QWORD v46[5];
  const __CFString *v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  error = 0;
  v50 = CFSTR("osgn");
  v47 = CFSTR("com.apple.PlatformSSO.auth");
  v48 = CFSTR("cag");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x24BDE8F80];
  v11 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x24BDE8F80], 0x40000000uLL, &error);
  if (!v11)
  {
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke;
    v37[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v37[4] = error;
    v13 = __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke((uint64_t)v37);
    goto LABEL_17;
  }
  SecAccessControlSetProtection();
  if (error)
  {
    CFRelease(v11);
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke_29;
    v36[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v36[4] = error;
    v12 = __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke_29((uint64_t)v36);
    v11 = 0;
    goto LABEL_17;
  }
  SecAccessControlSetConstraints();
  v14 = (id)*MEMORY[0x24BDE9060];
  if ((objc_msgSend(v6, "isEqualToNumber:", 0x251520F48) & 1) == 0)
  {
    if ((objc_msgSend(v6, "isEqualToNumber:", 0x251520F60) & 1) != 0)
    {
      v15 = &unk_251520F00;
      goto LABEL_11;
    }
    if (objc_msgSend(v6, "isEqualToNumber:", 0x251520F78))
    {
      v16 = (id)*MEMORY[0x24BDE9070];

      v15 = &unk_251520EE8;
      v14 = v16;
      goto LABEL_11;
    }
  }
  v15 = &unk_251520EE8;
LABEL_11:
  v17 = *MEMORY[0x24BDE9048];
  if (a4)
  {
    v41[0] = *MEMORY[0x24BDE9050];
    v41[1] = v17;
    v42[0] = v14;
    v42[1] = v15;
    v18 = *MEMORY[0x24BDE9158];
    v41[2] = *MEMORY[0x24BDE8F60];
    v41[3] = v18;
    v19 = *MEMORY[0x24BDE9160];
    v42[2] = v10;
    v42[3] = v19;
    v20 = *MEMORY[0x24BDE9540];
    v42[4] = MEMORY[0x24BDBD1C8];
    v21 = *MEMORY[0x24BDE9468];
    v41[4] = v20;
    v41[5] = v21;
    v22 = *MEMORY[0x24BDE8F48];
    v39[0] = *MEMORY[0x24BDE9018];
    v39[1] = v22;
    v40[0] = MEMORY[0x24BDBD1C0];
    v40[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = v23;
    v24 = (void *)MEMORY[0x24BDBCE70];
    v25 = v42;
    v26 = v41;
    v27 = 6;
  }
  else
  {
    v45[0] = *MEMORY[0x24BDE9050];
    v45[1] = v17;
    v46[0] = v14;
    v46[1] = v15;
    v28 = *MEMORY[0x24BDE8F70];
    v29 = *MEMORY[0x24BDE9158];
    v45[2] = *MEMORY[0x24BDE8F60];
    v45[3] = v29;
    v30 = *MEMORY[0x24BDE9160];
    v46[2] = v28;
    v46[3] = v30;
    v45[4] = *MEMORY[0x24BDE9468];
    v31 = *MEMORY[0x24BDE8F48];
    v43[0] = *MEMORY[0x24BDE9018];
    v43[1] = v31;
    v44[0] = MEMORY[0x24BDBD1C0];
    v44[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v23;
    v24 = (void *)MEMORY[0x24BDBCE70];
    v25 = v46;
    v26 = v45;
    v27 = 5;
  }
  objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, v27);
  v32 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  CFRelease(v11);
  v11 = SecKeyCreateRandomKey(v32, &error);
  if (!v11)
  {
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke_30;
    v35[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v35[4] = error;
    v33 = __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke_30((uint64_t)v35);
  }

LABEL_17:
  return v11;
}

id __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecAccessControlCreateWithFlags."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke_29(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecAccessControlSetProtection."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __65__POSecKeyHelper_createSEPSigningKeyForAlgorithm_shared_preboot___block_invoke_30(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecKeyCreateRandomKey."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

+ (__SecKey)createSEPEncryptionKeyForAlgorithm:(id)a3 shared:(BOOL)a4
{
  return (__SecKey *)objc_msgSend(a1, "createSEPEncryptionKeyForAlgorithm:shared:preboot:", a3, a4, 0);
}

+ (__SecKey)createSEPEncryptionKeyForAlgorithm:(id)a3 shared:(BOOL)a4 preboot:(BOOL)a5
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  SecAccessControlRef v19;
  SecAccessControlRef v20;
  void *v21;
  id v22;
  __SecKey *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const __CFDictionary *v43;
  id v44;
  id v46;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  CFErrorRef error;
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[6];
  _QWORD v59[6];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[5];
  _QWORD v63[5];
  const __CFString *v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  const __CFString *v77;
  void *v78;
  _QWORD v79[6];
  _QWORD v80[6];
  const __CFString *v81;
  const __CFString *v82;
  _QWORD v83[3];

  v5 = a5;
  v83[1] = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  error = 0;
  v81 = CFSTR("com.apple.PlatformSSO.auth");
  v82 = CFSTR("cag");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v81, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v83, &v82, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("cisp"));

    v7 = v8;
  }
  v50 = v7;
  v80[0] = v7;
  v79[0] = CFSTR("ock");
  v79[1] = CFSTR("oece");
  v76 = CFSTR("com.apple.PlatformSSO.auth");
  v77 = CFSTR("cag");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v76, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v49;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v48;
  v79[2] = CFSTR("oecd");
  v74 = CFSTR("cag");
  v73 = CFSTR("com.apple.PlatformSSO.auth");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v73, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v10;
  v79[3] = CFSTR("oe");
  v70 = CFSTR("com.apple.PlatformSSO.auth");
  v71 = CFSTR("cag");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v70, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v80[3] = v12;
  v79[4] = CFSTR("od");
  v67 = CFSTR("com.apple.PlatformSSO.auth");
  v68 = CFSTR("cag");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v67, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v80[4] = v14;
  v79[5] = CFSTR("osgn");
  v64 = CFSTR("com.apple.PlatformSSO.auth");
  v65 = CFSTR("cag");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v80[5] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *MEMORY[0x24BDE8F80];
  v19 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x24BDE8F80], 0x40000000uLL, &error);
  if (!v19)
  {
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke;
    v54[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v54[4] = error;
    v24 = __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke((uint64_t)v54);
    v23 = 0;
    v21 = v51;
    goto LABEL_16;
  }
  v20 = v19;
  SecAccessControlSetProtection();
  v21 = v51;
  if (error)
  {
    CFRelease(v20);
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke_33;
    v53[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v53[4] = error;
    v22 = __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke_33((uint64_t)v53);
    v23 = 0;
    goto LABEL_16;
  }
  v25 = v17;
  SecAccessControlSetConstraints();
  v26 = (id)*MEMORY[0x24BDE9060];
  if ((objc_msgSend(v51, "isEqualToNumber:", 0x251520F48) & 1) == 0
    && (objc_msgSend(v51, "isEqualToNumber:", 0x251520F60) & 1) == 0)
  {
    if ((objc_msgSend(v51, "isEqualToNumber:", 0x251520F78) & 1) != 0)
    {
      v27 = &unk_251520F00;
      goto LABEL_10;
    }
    if (objc_msgSend(v51, "isEqualToNumber:", 0x251520F90))
    {
      v46 = (id)*MEMORY[0x24BDE9098];

      v27 = &unk_251520EE8;
      v26 = v46;
      goto LABEL_10;
    }
  }
  v27 = &unk_251520EE8;
LABEL_10:
  v28 = *MEMORY[0x24BDE9048];
  if (a4)
  {
    v58[0] = *MEMORY[0x24BDE9050];
    v58[1] = v28;
    v59[0] = v26;
    v59[1] = v27;
    v29 = *MEMORY[0x24BDE9158];
    v58[2] = *MEMORY[0x24BDE8F60];
    v58[3] = v29;
    v30 = *MEMORY[0x24BDE9160];
    v59[2] = v18;
    v59[3] = v30;
    v31 = *MEMORY[0x24BDE9540];
    v59[4] = MEMORY[0x24BDBD1C8];
    v32 = *MEMORY[0x24BDE9468];
    v58[4] = v31;
    v58[5] = v32;
    v33 = *MEMORY[0x24BDE8F48];
    v56[0] = *MEMORY[0x24BDE9018];
    v56[1] = v33;
    v57[0] = MEMORY[0x24BDBD1C0];
    v57[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v59[5] = v34;
    v35 = (void *)MEMORY[0x24BDBCE70];
    v36 = v59;
    v37 = v58;
    v38 = 6;
  }
  else
  {
    v62[0] = *MEMORY[0x24BDE9050];
    v62[1] = v28;
    v63[0] = v26;
    v63[1] = v27;
    v39 = *MEMORY[0x24BDE8F70];
    v40 = *MEMORY[0x24BDE9158];
    v62[2] = *MEMORY[0x24BDE8F60];
    v62[3] = v40;
    v41 = *MEMORY[0x24BDE9160];
    v63[2] = v39;
    v63[3] = v41;
    v62[4] = *MEMORY[0x24BDE9468];
    v42 = *MEMORY[0x24BDE8F48];
    v60[0] = *MEMORY[0x24BDE9018];
    v60[1] = v42;
    v61[0] = MEMORY[0x24BDBD1C0];
    v61[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v63[4] = v34;
    v35 = (void *)MEMORY[0x24BDBCE70];
    v36 = v63;
    v37 = v62;
    v38 = 5;
  }
  objc_msgSend(v35, "dictionaryWithObjects:forKeys:count:", v36, v37, v38);
  v43 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  CFRelease(v20);
  v23 = SecKeyCreateRandomKey(v43, &error);
  if (!v23)
  {
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke_34;
    v52[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v52[4] = error;
    v44 = __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke_34((uint64_t)v52);
  }

  v17 = v25;
LABEL_16:

  return v23;
}

id __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecAccessControlCreateWithFlags."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke_33(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecAccessControlSetProtection."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __68__POSecKeyHelper_createSEPEncryptionKeyForAlgorithm_shared_preboot___block_invoke_34(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecKeyCreateRandomKey."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

+ (__SecKey)createEncryptionKeyForAlgorithm:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  __SecKey *v10;
  id v11;
  _QWORD v13[5];
  CFErrorRef error;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  error = 0;
  v4 = (id)*MEMORY[0x24BDE9060];
  if ((objc_msgSend(v3, "isEqualToNumber:", 0x251520F48) & 1) != 0
    || (objc_msgSend(v3, "isEqualToNumber:", 0x251520F60) & 1) != 0)
  {
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isEqualToNumber:", 0x251520F78) & 1) != 0)
  {
    v5 = &unk_251520F00;
    goto LABEL_8;
  }
  if (!objc_msgSend(v3, "isEqualToNumber:", 0x251520F90))
  {
LABEL_7:
    v5 = &unk_251520EE8;
  }
  else
  {
    v6 = (id)*MEMORY[0x24BDE9098];

    v5 = &unk_251520EE8;
    v4 = v6;
  }
LABEL_8:
  v7 = *MEMORY[0x24BDE9048];
  v15[0] = *MEMORY[0x24BDE9050];
  v15[1] = v7;
  v16[0] = v4;
  v16[1] = v5;
  v8 = *MEMORY[0x24BDE9528];
  v15[2] = *MEMORY[0x24BDE9018];
  v15[3] = v8;
  v16[2] = MEMORY[0x24BDBD1C0];
  v16[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = SecKeyCreateRandomKey(v9, &error);
  if (!v10)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __50__POSecKeyHelper_createEncryptionKeyForAlgorithm___block_invoke;
    v13[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v13[4] = error;
    v11 = __50__POSecKeyHelper_createEncryptionKeyForAlgorithm___block_invoke((uint64_t)v13);
  }

  return v10;
}

id __50__POSecKeyHelper_createEncryptionKeyForAlgorithm___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecKeyCreateRandomKey."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

+ (BOOL)checkIfBiometricConstraintsForSigningForKey:(__SecKey *)a3
{
  CFDictionaryRef v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  v4 = SecKeyCopyAttributes(a3);
  -[__CFDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x24BDE8F48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(a1, "checkIfBiometricConstraintsForSigning:", v5);
  else
    v6 = 0;

  return v6;
}

+ (BOOL)checkIfBiometricConstraintsForSigning:(__SecAccessControl *)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  SecAccessControlGetConstraint();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbio"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cwtch"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  return v6;
}

+ (id)dataForKey:(__SecKey *)a3
{
  CFDictionaryRef v3;
  void *v4;

  if (a3)
  {
    v3 = SecKeyCopyAttributes(a3);
    -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x24BDE9178]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)dataForEphemeralKey:(__SecKey *)a3
{
  if (a3)
    return SecKeyCopyExternalRepresentation(a3, 0);
  else
    return 0;
}

+ (__SecKey)keyForData:(id)a3
{
  return (__SecKey *)objc_msgSend(a1, "keyForData:context:", a3, 0);
}

+ (__SecKey)keyForData:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFData *v12;
  __SecKey *v13;
  id v14;
  _QWORD v16[5];
  CFErrorRef error;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  PO_LOG_POSecKeyHelper();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[POSecKeyHelper keyForData:context:].cold.1();

  if (v5)
  {
    error = 0;
    v8 = *MEMORY[0x24BDE9160];
    v9 = *MEMORY[0x24BDE9178];
    v18[0] = *MEMORY[0x24BDE9158];
    v18[1] = v9;
    v19[0] = v8;
    v19[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (v6)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDE9500]);
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v12 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v13 = SecKeyCreateWithData(v12, (CFDictionaryRef)v11, &error);
    if (!v13)
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __37__POSecKeyHelper_keyForData_context___block_invoke;
      v16[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v16[4] = error;
      v14 = __37__POSecKeyHelper_keyForData_context___block_invoke((uint64_t)v16);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __37__POSecKeyHelper_keyForData_context___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecKeyCreateWithData."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

+ (__SecKey)systemKeyForData:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const __CFDictionary *v6;
  id v7;
  __SecKey *v8;
  id v9;
  _QWORD v11[5];
  CFErrorRef error;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  PO_LOG_POSecKeyHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[POSecKeyHelper systemKeyForData:].cold.1();

  if (v3)
  {
    error = 0;
    v5 = *MEMORY[0x24BDE9178];
    v13[0] = *MEMORY[0x24BDE9158];
    v13[1] = v5;
    v14[0] = *MEMORY[0x24BDE9160];
    v14[1] = v3;
    v13[2] = *MEMORY[0x24BDE9540];
    v14[2] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x24BDBCE50]);

    v8 = SecKeyCreateWithData((CFDataRef)v7, v6, &error);
    if (!v8)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __35__POSecKeyHelper_systemKeyForData___block_invoke;
      v11[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v11[4] = error;
      v9 = __35__POSecKeyHelper_systemKeyForData___block_invoke((uint64_t)v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __35__POSecKeyHelper_systemKeyForData___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecKeyCreateWithData for system key."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

+ (__SecKey)ephemeralKeyForData:(id)a3
{
  const __CFData *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  __SecKey *v8;
  id v9;
  _QWORD v11[5];
  CFErrorRef error;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v3 = (const __CFData *)a3;
  PO_LOG_POSecKeyHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[POSecKeyHelper ephemeralKeyForData:].cold.1();

  if (v3)
  {
    error = 0;
    v5 = *MEMORY[0x24BDE9028];
    v13[0] = *MEMORY[0x24BDE9050];
    v13[1] = v5;
    v6 = *MEMORY[0x24BDE9030];
    v14[0] = *MEMORY[0x24BDE9060];
    v14[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = SecKeyCreateWithData(v3, v7, &error);
    if (!v8)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __38__POSecKeyHelper_ephemeralKeyForData___block_invoke;
      v11[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v11[4] = error;
      v9 = __38__POSecKeyHelper_ephemeralKeyForData___block_invoke((uint64_t)v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __38__POSecKeyHelper_ephemeralKeyForData___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecKeyCreateWithData for ephemeral key."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

+ (__SecKey)ephemeralPublicKeyForData:(id)a3
{
  const __CFData *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  __SecKey *v8;
  id v9;
  _QWORD v11[5];
  CFErrorRef error;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v3 = (const __CFData *)a3;
  PO_LOG_POSecKeyHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[POSecKeyHelper ephemeralPublicKeyForData:].cold.1();

  if (v3)
  {
    error = 0;
    v5 = *MEMORY[0x24BDE9028];
    v13[0] = *MEMORY[0x24BDE9050];
    v13[1] = v5;
    v6 = *MEMORY[0x24BDE9038];
    v14[0] = *MEMORY[0x24BDE9060];
    v14[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = SecKeyCreateWithData(v3, v7, &error);
    if (!v8)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __44__POSecKeyHelper_ephemeralPublicKeyForData___block_invoke;
      v11[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v11[4] = error;
      v9 = __44__POSecKeyHelper_ephemeralPublicKeyForData___block_invoke((uint64_t)v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __44__POSecKeyHelper_ephemeralPublicKeyForData___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecKeyCreateWithData for ephemeral public key."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

+ (__SecKey)ephemeralX25529PublicKeyForData:(id)a3
{
  const __CFData *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  __SecKey *v8;
  id v9;
  _QWORD v11[5];
  CFErrorRef error;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v3 = (const __CFData *)a3;
  PO_LOG_POSecKeyHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[POSecKeyHelper ephemeralX25529PublicKeyForData:].cold.1();

  if (v3)
  {
    error = 0;
    v5 = *MEMORY[0x24BDE9028];
    v13[0] = *MEMORY[0x24BDE9050];
    v13[1] = v5;
    v6 = *MEMORY[0x24BDE9038];
    v14[0] = *MEMORY[0x24BDE9098];
    v14[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = SecKeyCreateWithData(v3, v7, &error);
    if (!v8)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __50__POSecKeyHelper_ephemeralX25529PublicKeyForData___block_invoke;
      v11[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v11[4] = error;
      v9 = __50__POSecKeyHelper_ephemeralX25529PublicKeyForData___block_invoke((uint64_t)v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __50__POSecKeyHelper_ephemeralX25529PublicKeyForData___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecKeyCreateWithData for ephemeral public key."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

+ (id)dataForCertificate:(__SecCertificate *)a3
{
  if (a3)
    return SecCertificateCopyData(a3);
  else
    return 0;
}

+ (__SecCertificate)certificateForData:(id)a3
{
  __SecCertificate *result;

  result = 0;
  if (a3)
    return SecCertificateCreateWithData(0, (CFDataRef)a3);
  return result;
}

+ (__SecIdentity)identityForKey:(__SecKey *)a3 andCertificate:(__SecCertificate *)a4
{
  if (!a3 || !a4)
    return 0;
  SecCFAllocatorZeroize();
  return (__SecIdentity *)SecIdentityCreate();
}

+ (BOOL)evaluateTrustForCertificates:(id)a3 rootCertificates:(id)a4
{
  id v5;
  const __CFArray *v6;
  const __CFArray *v7;
  SecPolicyRef BasicX509;
  OSStatus v9;
  id v10;
  OSStatus v11;
  id v12;
  OSStatus v13;
  id v14;
  BOOL v15;
  _BOOL4 v17;
  id v18;
  _QWORD v19[5];
  CFErrorRef error;
  _QWORD v21[4];
  OSStatus v22;
  _QWORD v23[4];
  OSStatus v24;
  _QWORD v25[4];
  OSStatus v26;
  SecTrustRef trust;

  v5 = a3;
  v6 = (const __CFArray *)a4;
  v7 = v6;
  trust = 0;
  if (!v5 || !-[__CFArray count](v6, "count"))
    goto LABEL_13;
  BasicX509 = SecPolicyCreateBasicX509();
  v9 = SecTrustCreateWithCertificates(v5, BasicX509, &trust);
  if (BasicX509)
    CFRelease(BasicX509);
  if (v9)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke;
    v25[3] = &__block_descriptor_36_e14___NSError_8__0l;
    v26 = v9;
    v10 = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke((uint64_t)v25);
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v11 = SecTrustSetAnchorCertificates(trust, v7);
  if (v11)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_53;
    v23[3] = &__block_descriptor_36_e14___NSError_8__0l;
    v24 = v11;
    v12 = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_53((uint64_t)v23);
    goto LABEL_11;
  }
  v13 = SecTrustSetAnchorCertificatesOnly(trust, 1u);
  if (v13)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_56;
    v21[3] = &__block_descriptor_36_e14___NSError_8__0l;
    v22 = v13;
    v14 = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_56((uint64_t)v21);
LABEL_11:
    if (trust)
      CFRelease(trust);
    goto LABEL_13;
  }
  error = 0;
  v17 = SecTrustEvaluateWithError(trust, &error);
  if (v17)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_59;
    v19[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v19[4] = error;
    v18 = __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_59((uint64_t)v19);
  }
  if (trust)
  {
    CFRelease(trust);
    trust = 0;
  }
  v15 = !v17;
LABEL_14:

  return v15;
}

id __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error with SecTrustCreateWithCertificates."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke_cold_1((uint64_t)v2, a1);

  return v2;
}

id __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_53(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error with SecTrustSetAnchorCertificates."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke_cold_1((uint64_t)v2, a1);

  return v2;
}

id __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_56(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error with SecTrustSetAnchorCertificatesOnly."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke_cold_1((uint64_t)v2, a1);

  return v2;
}

id __64__POSecKeyHelper_evaluateTrustForCertificates_rootCertificates___block_invoke_59(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error with SecTrustEvaluateWithError."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POSecKeyHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

+ (BOOL)isSEPKey:(__SecKey *)a3
{
  CFDictionaryRef v3;
  void *v4;
  char v5;

  if (!a3)
    return 0;
  v3 = SecKeyCopyAttributes(a3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x24BDE9158]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE9160]) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDE9170]);

  return v5;
}

+ (BOOL)isEncryptionAlgorithm:(id)a3 validForKey:(__SecKey *)a4
{
  id v5;
  CFDictionaryRef v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  uint64_t *v12;
  BOOL v13;

  v5 = a3;
  v6 = SecKeyCopyAttributes(a4);
  -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x24BDE9050]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x24BDE9048]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDE9058]))
  {
    objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDE9098]);
LABEL_4:
    v11 = objc_msgSend(v8, "intValue");
    if (v11 == 384)
    {
LABEL_8:
      v12 = &POEncryptionAlgorithmHPKE_P384_SHA384_AES_GCM_256;
      goto LABEL_11;
    }
    if (v11 == 256)
    {
      if ((objc_msgSend(v5, "isEqualToNumber:", 0x251520F48) & 1) != 0
        || (objc_msgSend(v5, "isEqualToNumber:", 0x251520F60) & 1) != 0)
      {
        goto LABEL_12;
      }
      goto LABEL_8;
    }
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  v9 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDE9060]);
  v10 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDE9098]);
  if (v9)
    goto LABEL_4;
  if (!v10)
    goto LABEL_13;
  v12 = &POEncryptionAlgorithmHPKE_Curve25519_SHA256_ChachaPoly;
LABEL_11:
  if ((objc_msgSend(v5, "isEqualToNumber:", *v12) & 1) == 0)
    goto LABEL_13;
LABEL_12:
  v13 = 1;
LABEL_14:

  return v13;
}

+ (BOOL)_verifyCurve25519SigningKey:(__SecKey *)a3
{
  _TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519 *v4;

  v4 = objc_alloc_init(_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519);
  LOBYTE(a3) = -[POCryptoKitAlgorithmCurve25519 verifyKey:](v4, "verifyKey:", a3);

  return (char)a3;
}

+ (BOOL)_verifyCurve25519EncryptionKey:(__SecKey *)a3
{
  _TtC15PlatformSSOCore18POCurve25519Verify *v4;

  v4 = objc_alloc_init(_TtC15PlatformSSOCore18POCurve25519Verify);
  LOBYTE(a3) = -[POCurve25519Verify verifyKey:](v4, "verifyKey:", a3);

  return (char)a3;
}

+ (BOOL)verifyKey:(__SecKey *)a3
{
  __SecKey *v3;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  const __CFString **v12;
  const __CFData *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  CFDataRef Signature;
  NSObject *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  _QWORD v23[4];
  NSObject *v24;
  uint8_t v25[16];
  uint8_t buf[8];

  v3 = a3;
  if (a3)
  {
    v5 = SecKeyCopyAttributes(a3);
    -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x24BDE9050]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x24BDE9048]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDE9058]) & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDE9060]);
    v9 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDE9098]);
    v10 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDE9070]);
    if (v8)
    {
      v11 = objc_msgSend(v7, "intValue");
      if (v11 == 256)
      {
        v12 = (const __CFString **)MEMORY[0x24BDE92B0];
        goto LABEL_20;
      }
      if (v11 == 384)
      {
        v12 = (const __CFString **)MEMORY[0x24BDE92B8];
LABEL_20:
        v14 = *v12;
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dataUsingEncoding:", 4);
        v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)buf = 0;
        Signature = SecKeyCreateSignature(v3, v14, v13, (CFErrorRef *)buf);
        if (Signature)
        {
          PO_LOG_POSecKeyHelper();
          v18 = objc_claimAutoreleasedReturnValue();
          LOBYTE(v3) = 1;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v25 = 0;
            _os_log_impl(&dword_24440D000, v18, OS_LOG_TYPE_INFO, "key is valid", v25, 2u);
          }
        }
        else
        {
          v18 = *(NSObject **)buf;
          v19 = objc_msgSend(*(id *)buf, "code");
          LOBYTE(v3) = v19 == -1004;
          if (v19 == -1004)
          {
            PO_LOG_POSecKeyHelper();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v25 = 0;
              _os_log_impl(&dword_24440D000, v21, OS_LOG_TYPE_INFO, "key is valid", v25, 2u);
            }
          }
          else
          {
            v23[0] = MEMORY[0x24BDAC760];
            v23[1] = 3221225472;
            v23[2] = __28__POSecKeyHelper_verifyKey___block_invoke;
            v23[3] = &unk_2514FF9D0;
            v24 = v18;
            v20 = __28__POSecKeyHelper_verifyKey___block_invoke((uint64_t)v23);
            v21 = v24;
          }

        }
        goto LABEL_29;
      }
LABEL_18:
      LOBYTE(v3) = 0;
LABEL_30:

      return (char)v3;
    }
    if (v10)
    {
      if (!objc_msgSend(a1, "_verifyCurve25519SigningKey:", v3))
        goto LABEL_18;
      PO_LOG_POSecKeyHelper();
      v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = 1;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
LABEL_17:
        _os_log_impl(&dword_24440D000, (os_log_t)v13, OS_LOG_TYPE_INFO, "key is valid", buf, 2u);
      }
    }
    else
    {
      if (!v9 || !objc_msgSend(a1, "_verifyCurve25519EncryptionKey:", v3))
        goto LABEL_18;
      PO_LOG_POSecKeyHelper();
      v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = 1;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        goto LABEL_17;
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  return (char)v3;
}

id __28__POSecKeyHelper_verifyKey___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1008, *(_QWORD *)(a1 + 32), CFSTR("Failed to validate key"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POSecKeyHelper();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

+ (id)printKey:(__SecKey *)a3
{
  CFDataRef v4;
  CFDataRef v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __SecKey *v14;
  CFDataRef v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  CFErrorRef error;

  error = 0;
  v4 = SecKeyCopyExternalRepresentation(a3, &error);
  v5 = v4;
  if (v4)
  {
    -[__CFData subdataWithRange:](v4, "subdataWithRange:", 1, 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFData subdataWithRange:](v5, "subdataWithRange:", 33, 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFData length](v5, "length") == 97)
    {
      -[__CFData subdataWithRange:](v5, "subdataWithRange:", 65, 32);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("EC"), CFSTR("kty"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("P-256"), CFSTR("crv"));
    objc_msgSend(v6, "psso_base64URLEncodedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("x"));

    objc_msgSend(v7, "psso_base64URLEncodedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("y"));

    if (v8)
    {
      objc_msgSend(v8, "psso_base64URLEncodedString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("d"));

    }
    v14 = SecKeyCopyPublicKey(a3);
    v15 = SecKeyCopyExternalRepresentation(v14, 0);
    if (v14)
      CFRelease(v14);
    -[__CFData psso_sha256Hash](v15, "psso_sha256Hash");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("kid"));

    v20 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v10, 1, &v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v18, 4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)keyForData:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)systemKeyForData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)ephemeralKeyForData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)ephemeralPublicKeyForData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)ephemeralX25529PublicKeyForData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
