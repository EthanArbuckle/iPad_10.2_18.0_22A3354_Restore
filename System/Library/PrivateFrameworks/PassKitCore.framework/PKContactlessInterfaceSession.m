@implementation PKContactlessInterfaceSession

- (PKContactlessInterfaceSession)initWithInternalSession:(id)a3 targetQueue:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  dispatch_queue_t v12;
  void *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  unint64_t v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "nfSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stsSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_6;
  PKGetClassNFLoyaltyAndPaymentSession();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0;
    goto LABEL_7;
  }
  PKGetClassNFDigitalCarKeySession();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = 1;
  else
LABEL_6:
    v10 = 2;
LABEL_7:
  self->_sessionType = v10;
  v19.receiver = self;
  v19.super_class = (Class)PKContactlessInterfaceSession;
  v11 = -[PKPaymentSession initWithInternalSession:targetQueue:](&v19, sel_initWithInternalSession_targetQueue_, v6, v7);
  if (v11)
  {
    v12 = dispatch_queue_create("com.apple.passkit.contactlessInterfaceSession.callbackQueue", 0);
    v13 = (void *)*((_QWORD *)v11 + 18);
    *((_QWORD *)v11 + 18) = v12;

    if (v7)
      dispatch_set_target_queue(*((dispatch_object_t *)v11 + 18), v7);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.walletTransactionSignal.background", v14);
    v16 = (void *)*((_QWORD *)v11 + 19);
    *((_QWORD *)v11 + 19) = v15;

    v17 = *((_QWORD *)v11 + 21);
    if (v17 == 2)
    {
      objc_msgSend(v9, "setDelegate:", v11);
    }
    else if (v17 <= 1)
    {
      objc_msgSend(v8, "setDelegate:", v11);
      objc_msgSend(v8, "setSessionDelegate:", v11);
    }

  }
  return (PKContactlessInterfaceSession *)v11;
}

- (void)invalidateSessionWithCompletion:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PKContactlessInterfaceSession_invalidateSessionWithCompletion___block_invoke;
  v6[3] = &unk_1E2AC0C58;
  v6[4] = self;
  v4 = a3;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v6);
  v5.receiver = self;
  v5.super_class = (Class)PKContactlessInterfaceSession;
  -[PKPaymentSession invalidateSessionWithCompletion:](&v5, sel_invalidateSessionWithCompletion_, v4);

}

void __65__PKContactlessInterfaceSession_invalidateSessionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 161));
  if ((v4 & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 162))
    {
      if (*(_QWORD *)(v5 + 40))
      {
        v7 = v3;
        v6 = objc_msgSend(*(id *)(v5 + 32), "count");
        v3 = v7;
        if (v6)
        {
          objc_msgSend(*(id *)(a1 + 32), "_endPersistentCardEmulationForPaymentPass:paymentApplications:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
          v3 = v7;
        }
      }
    }
  }

}

- (BOOL)activatePaymentApplication:(id)a3 forPaymentPass:(id)a4 markAsDefault:(BOOL)a5
{
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a3)
  {
    v12 = a3;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = a3;
    objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
    a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = -[PKContactlessInterfaceSession activatePaymentApplications:forPaymentPass:](self, "activatePaymentApplications:forPaymentPass:", a3, v7, v12, v13);

  return v10;
}

- (BOOL)activatePaymentApplication:(id)a3 forPaymentPass:(id)a4
{
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    v11 = a3;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = a3;
    objc_msgSend(v7, "arrayWithObjects:count:", &v11, 1);
    a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v9 = -[PKContactlessInterfaceSession _activatePaymentApplications:forPaymentPass:forceReactivation:](self, "_activatePaymentApplications:forPaymentPass:forceReactivation:", a3, v6, 0, v11, v12);

  return v9;
}

- (BOOL)activatePaymentApplications:(id)a3 forPaymentPass:(id)a4
{
  return -[PKContactlessInterfaceSession _activatePaymentApplications:forPaymentPass:forceReactivation:](self, "_activatePaymentApplications:forPaymentPass:forceReactivation:", a3, a4, 0);
}

- (BOOL)_activatePaymentApplications:(id)a3 forPaymentPass:(id)a4 forceReactivation:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  BOOL v13;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  _QWORD v24[3];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v8 = a3;
  v9 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v10 = objc_msgSend(v8, "count");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__PKContactlessInterfaceSession__activatePaymentApplications_forPaymentPass_forceReactivation___block_invoke;
  v15[3] = &unk_1E2AC0CA0;
  v15[4] = self;
  v18 = v24;
  v23 = a5;
  v11 = v8;
  v16 = v11;
  v19 = &v26;
  v20 = &v30;
  v21 = &v34;
  v22 = v10;
  v12 = v9;
  v17 = v12;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v15);
  v13 = *((_BYTE *)v35 + 24) && *((_BYTE *)v31 + 24) || *((_BYTE *)v27 + 24) != 0;

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v13;
}

void __95__PKContactlessInterfaceSession__activatePaymentApplications_forPaymentPass_forceReactivation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  char v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id obj;
  id obja;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  void *v80;
  void *v81;
  _QWORD v82[7];
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint8_t v92[128];
  uint8_t buf[4];
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v64 = a2;
  v65 = a1;
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 80))
  {
    v4 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
    goto LABEL_78;
  }
  if (!*(_BYTE *)(a1 + 96) && (unint64_t)(*(_QWORD *)(v3 + 128) - 1) <= 1)
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(id *)(v3 + 32);
    v7 = v5;
    if (v6 == v7)
    {

LABEL_17:
      v4 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      goto LABEL_78;
    }
    v8 = v7;
    v9 = objc_msgSend(v6, "count");
    if (v9 == objc_msgSend(v8, "count"))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      obj = v6;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, buf, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v88;
        v13 = MEMORY[0x1E0C809B0];
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v88 != v12)
              objc_enumerationMutation(obj);
            v15 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i);
            v83 = 0;
            v84 = &v83;
            v85 = 0x2020000000;
            v86 = 0;
            v82[0] = v13;
            v82[1] = 3221225472;
            v82[2] = __PKPaymentApplicationsArrayMatch_block_invoke;
            v82[3] = &unk_1E2AC1058;
            v82[4] = v10;
            v82[5] = v15;
            v82[6] = &v83;
            objc_msgSend(v8, "enumerateObjectsUsingBlock:", v82);
            v16 = *((unsigned __int8 *)v84 + 24);
            _Block_object_dispose(&v83, 8);
            if (!v16)
            {

              goto LABEL_20;
            }
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, buf, 16);
          if (v11)
            continue;
          break;
        }
      }

      goto LABEL_17;
    }

  }
LABEL_20:
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(_QWORD *)(v17 + 168);
  switch(v18)
  {
    case 2:
      obja = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(*(id *)(a1 + 48), "isIdentityPass"))
      {
        if (objc_msgSend(*(id *)(a1 + 48), "isHybridIdentityPass"))
          v23 = 5;
        else
          v23 = 2;
      }
      else
      {
        v23 = 3;
      }
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v66 = *(id *)(a1 + 40);
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
      if (v68)
      {
        v67 = *(_QWORD *)v77;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v77 != v67)
            {
              v32 = v31;
              objc_enumerationMutation(v66);
              v31 = v32;
            }
            v69 = v31;
            v33 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v31);
            objc_msgSend(v33, "applicationIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v33, "paymentType") == 1005)
            {
              v35 = (void *)objc_msgSend(objc_alloc((Class)getSTSCredentialClass[0]()), "initWithType:identifier:subIdentifier:", v23, v34, 0);
              objc_msgSend(obja, "addObject:", v35);
            }
            else
            {
              v74 = 0u;
              v75 = 0u;
              v72 = 0u;
              v73 = 0u;
              objc_msgSend(v33, "subcredentials");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v91, 16);
              if (v36)
              {
                v37 = *(_QWORD *)v73;
                do
                {
                  for (j = 0; j != v36; ++j)
                  {
                    if (*(_QWORD *)v73 != v37)
                      objc_enumerationMutation(v35);
                    v39 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
                    v40 = objc_alloc((Class)getSTSCredentialClass[0]());
                    objc_msgSend(v39, "identifier");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    v42 = (void *)objc_msgSend(v40, "initWithType:identifier:subIdentifier:", v23, v34, v41);

                    objc_msgSend(obja, "addObject:", v42);
                  }
                  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v91, 16);
                }
                while (v36);
              }
            }

            v31 = v69 + 1;
          }
          while (v69 + 1 != v68);
          v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
        }
        while (v68);
      }

      v43 = objc_msgSend(obja, "count");
      if ((unint64_t)(v43 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v94 = v23;
          v95 = 2048;
          v96 = v43;
          _os_log_impl(&dword_18FC92000, v44, OS_LOG_TYPE_DEFAULT, "Invalid credentials count for STS session: (t: %lu, n: %lu)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v65 + 72) + 8) + 24) = 0;
      }
      objc_msgSend(v64, "stsSession");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(obja, "copy");
      objc_msgSend(v45, "setActiveCredentials:", v46);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v65 + 80) + 8) + 24) = v22 == 0;
      if (!v22)
      {
        v4 = 0;
LABEL_76:

        a1 = v65;
        v17 = *(_QWORD *)(v65 + 32);
        goto LABEL_77;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v94 = (uint64_t)obja;
        v95 = 2112;
        v96 = (uint64_t)v22;
        _os_log_impl(&dword_18FC92000, v47, OS_LOG_TYPE_DEFAULT, "Could not activate credentials %@ with error %@", buf, 0x16u);
      }
      v4 = 0;
LABEL_75:

      goto LABEL_76;
    case 1:
      v24 = *(_QWORD *)(a1 + 88);
      if (v24 == 1)
      {
        objc_msgSend(*(id *)(a1 + 40), "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "subcredentials");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");
        if (v27 == 1)
        {
          objc_msgSend(*(id *)(a1 + 32), "_appletForPaymentApplication:inInternalSession:", v25, v64);
          obja = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "anyObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          PKLogFacilityTypeGetObject(6uLL);
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v94 = v27;
            _os_log_impl(&dword_18FC92000, v48, OS_LOG_TYPE_DEFAULT, "Invalid credentials count for Car Key session: %lu", buf, 0xCu);
          }

          v22 = 0;
          obja = 0;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        }

      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v94 = v24;
          _os_log_impl(&dword_18FC92000, v30, OS_LOG_TYPE_DEFAULT, "Invalid applications count for Car Key session: %lu", buf, 0xCu);
        }

        v22 = 0;
        obja = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      }
      objc_msgSend(v64, "nfSession");
      v47 = objc_claimAutoreleasedReturnValue();
      v80 = 0;
      v49 = -[NSObject setActiveApplet:key:outError:](v47, "setActiveApplet:key:outError:", obja, v22, &v80);
      v50 = v80;
      goto LABEL_74;
    case 0:
      v19 = *(_QWORD *)(a1 + 88);
      if (v19 == 1)
      {
        objc_msgSend(*(id *)(a1 + 40), "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_appletForPaymentApplication:inInternalSession:", v20, v64);
        obja = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "subcredentials");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count"))
        {
          objc_msgSend(v21, "pk_setBySafelyApplyingBlock:", &__block_literal_global_9);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v94 = v19;
          _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Invalid applications count for Loyalty Payment session: %lu", buf, 0xCu);
        }

        v22 = 0;
        obja = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      }
      objc_msgSend(v64, "nfSession");
      v47 = objc_claimAutoreleasedReturnValue();
      v81 = 0;
      v49 = -[NSObject setActivePaymentApplet:keys:error:](v47, "setActivePaymentApplet:keys:error:", obja, v22, &v81);
      v50 = v81;
LABEL_74:
      v4 = v50;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v49;
      goto LABEL_75;
  }
  v4 = 0;
LABEL_77:
  *(_BYTE *)(v17 + 164) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 163) = 0;
LABEL_78:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v94 = v52;
      v53 = "Activating Payment Applications: %@";
LABEL_88:
      _os_log_impl(&dword_18FC92000, v51, OS_LOG_TYPE_DEFAULT, v53, buf, 0xCu);
      goto LABEL_89;
    }
    goto LABEL_89;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      PKLogFacilityTypeGetObject(6uLL);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v54 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v94 = v54;
        v53 = "Activating Payment Applications (deferred): %@";
        goto LABEL_88;
      }
LABEL_89:

      v56 = objc_msgSend(*(id *)(v65 + 40), "copy");
      v57 = *(_QWORD *)(v65 + 32);
      v58 = *(void **)(v57 + 32);
      *(_QWORD *)(v57 + 32) = v56;

      objc_storeStrong((id *)(*(_QWORD *)(v65 + 32) + 40), *(id *)(v65 + 48));
      if (objc_msgSend(*(id *)(*(_QWORD *)(v65 + 32) + 32), "count")
        || objc_msgSend(*(id *)(*(_QWORD *)(v65 + 32) + 48), "count"))
      {
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v65 + 64) + 8) + 24))
          objc_msgSend(*(id *)(v65 + 32), "setState:", 1);
      }
      else
      {
        objc_msgSend(*(id *)(v65 + 32), "setState:", 0);
      }
      goto LABEL_94;
    }
LABEL_86:
    PKLogFacilityTypeGetObject(6uLL);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v55 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v94 = v55;
      v53 = "Skipping Activatation of Payment Applications: %@";
      goto LABEL_88;
    }
    goto LABEL_89;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    goto LABEL_86;
  PKLogFacilityTypeGetObject(6uLL);
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v60 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v94 = v60;
    v95 = 2112;
    v96 = (uint64_t)v4;
    _os_log_impl(&dword_18FC92000, v59, OS_LOG_TYPE_DEFAULT, "Failed to Activate Payment Applications: %@, Error: %@", buf, 0x16u);
  }

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v65 + 72) + 8) + 24))
  {
    v61 = *(_QWORD *)(v65 + 32);
    v62 = *(void **)(v61 + 32);
    *(_QWORD *)(v61 + 32) = 0;

    v63 = *(void **)(*(_QWORD *)(v65 + 32) + 40);
    *(_QWORD *)(*(_QWORD *)(v65 + 32) + 40) = 0;

  }
LABEL_94:

}

uint64_t __95__PKContactlessInterfaceSession__activatePaymentApplications_forPaymentPass_forceReactivation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (BOOL)activateValueAddedServicePasses:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v5 = objc_msgSend(v4, "count");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__PKContactlessInterfaceSession_activateValueAddedServicePasses___block_invoke;
  v18[3] = &unk_1E2AC0CC8;
  v9 = v6;
  v19 = v9;
  v10 = v7;
  v20 = v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v18);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __65__PKContactlessInterfaceSession_activateValueAddedServicePasses___block_invoke_110;
  v14[3] = &unk_1E2AC0D88;
  v14[4] = self;
  v17 = &v21;
  v11 = v9;
  v15 = v11;
  v12 = v10;
  v16 = v12;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v14);
  LOBYTE(self) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)self;
}

void __65__PKContactlessInterfaceSession_activateValueAddedServicePasses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFData *v8;
  void *v9;
  void *v10;
  const __CFData *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFData *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "nfcPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v3;
    objc_msgSend(v5, "passTypeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "SHA256Hash");
    v8 = (const __CFData *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "nfcPayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataUsingEncoding:", 4);
    v11 = (const __CFData *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "nfcPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encryptionPublicKeyData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v5, "nfcPayload");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (const __CFData *)PKCreateEncryptedPassPayload((const __CFData *)objc_msgSend(v14, "encryptionPublicKeyData"), v11, v8, 0);

    }
    else
    {
      v15 = v11;
    }
    v16 = objc_alloc_init((Class)PKGetClassNFValueAddedServiceCard());
    objc_msgSend(v16, "setIdentifier:", v8);
    objc_msgSend(v16, "setData:", v15);
    objc_msgSend(v16, "setUserInterventionRequired:", 0);
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setToken:", v17);

    PKLogFacilityTypeGetObject(6uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "passTypeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serialNumber");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "data");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138413058;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      v29 = 2048;
      v30 = objc_msgSend(v22, "length");
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Activating NFC Pass: %@(%@)/%@ with Message of Size: %tu", (uint8_t *)&v23, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  }
}

void __65__PKContactlessInterfaceSession_activateValueAddedServicePasses___block_invoke_110(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v13 = v3;
  if (*(_QWORD *)(v4 + 80) || *(_QWORD *)(v4 + 168))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(v3, "nfSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v12, "setHostCards:", *(_QWORD *)(a1 + 40));

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 48);
    *(_QWORD *)(v6 + 48) = v5;

    v8 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 56);
    *(_QWORD *)(v9 + 56) = v8;

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
      v11 = 1;
    else
      v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count") != 0;
    objc_msgSend(*(id *)(a1 + 32), "setState:", v11);
  }

}

- (BOOL)authorizeAndStartCardEmulationWithCredential:(id)a3
{
  PKContactlessInterfaceSession *v3;
  NSArray *activatedPaymentApplications;
  id v5;

  v3 = self;
  activatedPaymentApplications = self->_activatedPaymentApplications;
  v5 = a3;
  LOBYTE(v3) = -[PKContactlessInterfaceSession authorizeAndStartCardEmulationWithCredential:deferAuthorization:](v3, "authorizeAndStartCardEmulationWithCredential:deferAuthorization:", v5, -[NSArray pk_containsObjectPassingTest:](activatedPaymentApplications, "pk_containsObjectPassingTest:", &__block_literal_global_112));

  return (char)v3;
}

uint64_t __78__PKContactlessInterfaceSession_authorizeAndStartCardEmulationWithCredential___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requiresDeferredAuthorization");
}

- (BOOL)authorizeAndStartCardEmulationWithCredential:(id)a3 deferAuthorization:(BOOL)a4
{
  return -[PKContactlessInterfaceSession authorizeAndStartCardEmulationWithCredential:deferAuthorization:requiresConfirmationForHandoff:startHandoffIfPending:](self, "authorizeAndStartCardEmulationWithCredential:deferAuthorization:requiresConfirmationForHandoff:startHandoffIfPending:", a3, a4, 0, 0);
}

- (BOOL)authorizeAndStartCardEmulationWithCredential:(id)a3 deferAuthorization:(BOOL)a4 requiresConfirmationForHandoff:(BOOL)a5 startHandoffIfPending:(BOOL)a6
{
  id v10;
  id v11;
  char v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v10 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __150__PKContactlessInterfaceSession_authorizeAndStartCardEmulationWithCredential_deferAuthorization_requiresConfirmationForHandoff_startHandoffIfPending___block_invoke;
  v14[3] = &unk_1E2AC0D10;
  v14[4] = self;
  v16 = &v20;
  v17 = a6;
  v18 = a5;
  v11 = v10;
  v15 = v11;
  v19 = a4;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v14);
  v12 = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __150__PKContactlessInterfaceSession_authorizeAndStartCardEmulationWithCredential_deferAuthorization_requiresConfirmationForHandoff_startHandoffIfPending___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  _BOOL4 v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 80))
  {
    objc_msgSend((id)v4, "_endLookup");
    v4 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v4 + 120) = 0;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
    goto LABEL_4;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  switch(v15)
  {
    case 2:
      objc_msgSend(v3, "stsSession");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setActiveCredential:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v21 == 0;
      break;
    case 1:
      objc_msgSend(v3, "nfSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v17 = objc_msgSend(v16, "setActiveApplet:key:outError:", 0, 0, &v42);
      v18 = v42;
      goto LABEL_24;
    case 0:
      objc_msgSend(v3, "nfSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      v17 = objc_msgSend(v16, "setActivePaymentApplet:error:", 0, &v43);
      v18 = v43;
LABEL_24:
      v5 = v18;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v17;

      goto LABEL_5;
  }
LABEL_4:
  v5 = 0;
LABEL_5:
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v6 + 168) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && !*(_QWORD *)(v6 + 48))
  {
    objc_msgSend(v3, "nfSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v19, "setHostCards:", MEMORY[0x1E0C9AA60]);

    v6 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(a1 + 56))
  {
    if (*(_QWORD *)(v6 + 128) == 2)
    {
      if (*(_BYTE *)(v6 + 164))
      {
        objc_msgSend(v3, "stsSession");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "startHandoff");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v8 == 0;
        PKLogFacilityTypeGetObject(6uLL);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        if (v8)
        {
          if (v11)
          {
            *(_DWORD *)buf = 138412290;
            v45 = v8;
            v12 = "Contactless Interface Session: failed to start handoff with error %@";
            v13 = v10;
            v14 = 12;
LABEL_27:
            _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
          }
        }
        else if (v11)
        {
          *(_WORD *)buf = 0;
          v12 = "Contactless Interface Session: performed hand off";
          v13 = v10;
          v14 = 2;
          goto LABEL_27;
        }

        v6 = *(_QWORD *)(a1 + 32);
        goto LABEL_29;
      }
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_29:
  *(_BYTE *)(v6 + 163) = *(_BYTE *)(a1 + 57);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 164) = 0;
  v22 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  PKLogFacilityTypeGetObject(6uLL);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v9 && v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Starting Card Emulation For Transaction", buf, 2u);
    }

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
      v25 = *(void **)(a1 + 40);
    else
      v25 = 0;
    v26 = v25;
    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(_QWORD *)(v27 + 168);
    if (v28 == 2)
    {
      if (*(_BYTE *)(v27 + 163))
        v35 = *(unsigned __int8 *)(a1 + 58) | 2;
      else
        v35 = *(unsigned __int8 *)(a1 + 58);
      objc_msgSend(v3, "stsSession");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "startTransactionWithAuthorization:options:", v26, v35);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v31 == 0;
      if (v31)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v31;
          _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Could not start transaction with error %@", buf, 0xCu);
        }

      }
    }
    else
    {
      if (v28 == 1)
      {
        objc_msgSend(v3, "nfSession");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = *(unsigned __int8 *)(a1 + 58);
        v39 = v5;
        LOBYTE(v32) = objc_msgSend(v31, "startCardEmulationAuthorization:deferred:error:", v26, v34, &v39);
        v33 = v39;
      }
      else
      {
        if (v28)
        {
LABEL_52:

          v22 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          goto LABEL_53;
        }
        v29 = *(unsigned __int8 *)(a1 + 58);
        objc_msgSend(v3, "nfSession");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v29)
        {
          v41 = v5;
          LOBYTE(v32) = objc_msgSend(v30, "startDeferredCardEmulation:authorization:error:", 3, v26, &v41);
          v33 = v41;
        }
        else
        {
          v40 = v5;
          v32 = objc_msgSend(v30, "startCardEmulation:authorization:error:", 3, v26, &v40);
          v33 = v40;
        }
      }
      v37 = v33;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v32;
      v5 = v37;
    }

    goto LABEL_52;
  }
LABEL_53:
  v38 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v38)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Started Card Emulation For Transaction", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 162) = 3;
    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
  }
  else
  {
    if (v38)
    {
      *(_DWORD *)buf = 138543362;
      v45 = v5;
      _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session failed to authorize and start Card Emulation. Error: %{public}@", buf, 0xCu);
    }

    if (v5 && objc_msgSend(v5, "code") == 38)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Express transaction in progress: proceeding without card emulation...", buf, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }

}

- (void)authorize18013RequestWithDataToRelease:(id)a3 credential:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__PKContactlessInterfaceSession_authorize18013RequestWithDataToRelease_credential___block_invoke;
  v10[3] = &unk_1E2AC0D38;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v10);

}

void __83__PKContactlessInterfaceSession_authorize18013RequestWithDataToRelease_credential___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(a1 + 40));
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v8);
      if (objc_msgSend(v9, "paymentType") == 1002)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v9;

    if (!v10)
      goto LABEL_27;
    v34 = v3;
    -[NSObject subcredentials](v10, "subcredentials");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc((Class)getSTSCredentialClass[0]());
    -[NSObject applicationIdentifier](v10, "applicationIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v13;
    v32 = (void *)objc_msgSend(v14, "initWithType:identifier:subIdentifier:", 2, v15, v13);

    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "elements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v22, "elementNamespace", v32);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v23);
          v24 = (id)objc_claimAutoreleasedReturnValue();

          if (!v24)
          {
            v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v22, "elementNamespace");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v24, v25);

          }
          objc_msgSend(v22, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v26);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v19);
    }

    PKLogFacilityTypeGetObject(6uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v16;
      _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Releasing Credential For Fields %@", buf, 0xCu);
    }

    v3 = v34;
    objc_msgSend(v34, "stsSession");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(a1 + 48);
    v30 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v28, "releaseCredential:withAuthorization:iso18013Selection:", v32, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v31;
        _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Released Credential Failed with error %@", buf, 0xCu);
      }

    }
  }
  else
  {
LABEL_9:

LABEL_27:
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session authorize18013RequestWithDataToRelease Failed. No valid PKPaymentApplication is found", buf, 2u);
    }
  }

}

- (BOOL)stopCardEmulation
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PKContactlessInterfaceSession_stopCardEmulation__block_invoke;
  v4[3] = &unk_1E2AC0D60;
  v4[4] = self;
  v4[5] = &v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __50__PKContactlessInterfaceSession_stopCardEmulation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  void *v17;
  id v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  char v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 162))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Stopping Card Emulation", buf, 2u);
    }

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    if (v5 == 2)
    {
      objc_msgSend(v3, "stsSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stopTransaction");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10 == 0;
      goto LABEL_13;
    }
    if (v5 == 1)
    {
      objc_msgSend(v3, "nfSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v7 = objc_msgSend(v6, "stopCardEmulation:", &v24);
      v8 = v24;
    }
    else
    {
      if (v5)
      {
        v10 = 0;
LABEL_13:
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 162) = 0;
          v11 = *(_QWORD *)(a1 + 32);
          v12 = *(void **)(v11 + 48);
          *(_QWORD *)(v11 + 48) = 0;

          v13 = *(_QWORD *)(a1 + 32);
          v14 = *(void **)(v13 + 56);
          *(_QWORD *)(v13 + 56) = 0;

          v15 = *(_QWORD *)(a1 + 32);
          if (*(_QWORD *)(v15 + 40))
            v16 = objc_msgSend(*(id *)(v15 + 32), "count") != 0;
          else
            v16 = 0;
          objc_msgSend((id)v15, "setState:", v16);
          v19 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 161));
          if ((v19 & 1) == 0 || *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168))
            goto LABEL_23;
          objc_msgSend(v3, "nfSession");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 161);
          v23 = v10;
          v21 = objc_msgSend(v17, "enablePlasticCardMode:error:", 0, &v23);
          v18 = v23;

          atomic_store(v21 ^ 1, v20);
          v22 = *(_QWORD *)(a1 + 32);
          if (*(_QWORD *)(v22 + 40) && objc_msgSend(*(id *)(v22 + 32), "count"))
            objc_msgSend(*(id *)(a1 + 32), "_endPersistentCardEmulationForPaymentPass:paymentApplications:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
          if (v18)
          {
            if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v18;
              _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to disable Persistent Card Emulation. Error: %@", buf, 0xCu);
            }

          }
        }
        else
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v10;
            _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to stop Card Emulation. Error: %@", buf, 0xCu);
          }
          v17 = v4;
          v18 = v10;
        }

        v10 = v18;
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(v3, "nfSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v7 = objc_msgSend(v6, "stopCardEmulation:", &v25);
      v8 = v25;
    }
    v10 = v8;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;

    goto LABEL_13;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_24:

}

- (void)resetExpressState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__PKContactlessInterfaceSession_resetExpressState__block_invoke;
  v2[3] = &unk_1E2AC0C58;
  v2[4] = self;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v2);
}

void __50__PKContactlessInterfaceSession_resetExpressState__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 112);
  *(_QWORD *)(v1 + 112) = 0;

}

- (BOOL)sendRKEFunction:(id)a3 action:(id)a4 authorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (self->_sessionType == 1)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__PKContactlessInterfaceSession_sendRKEFunction_action_authorization___block_invoke;
    v13[3] = &unk_1E2AC0D88;
    v14 = v9;
    v15 = v8;
    v17 = &v18;
    v16 = v10;
    -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v13);

    v11 = *((_BYTE *)v19 + 24) != 0;
  }
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __70__PKContactlessInterfaceSession_sendRKEFunction_action_authorization___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Sending RKE action %{public}@ for function %{public}@.", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v3, "nfSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendRKEFunction:rkeAction:authorization:", a1[5], a1[4], a1[6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v8 == 0;

}

- (void)sendRKEFunction:(id)a3 action:(id)a4 withAuthorization:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (self->_sessionType == 1)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__PKContactlessInterfaceSession_sendRKEFunction_action_withAuthorization_completion___block_invoke;
    v14[3] = &unk_1E2AC0DD8;
    v15 = v10;
    v16 = v13;
    v17 = v11;
    v18 = v12;
    -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v14);

  }
}

void __85__PKContactlessInterfaceSession_sendRKEFunction_action_withAuthorization_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v14 = v5;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Sending RKE action %{public}@ for function %{public}@.", buf, 0x16u);
  }

  objc_msgSend(v3, "nfSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__PKContactlessInterfaceSession_sendRKEFunction_action_withAuthorization_completion___block_invoke_114;
  v11[3] = &unk_1E2AC0DB0;
  v10 = *(_QWORD *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v7, "sendRKEFunction:action:authorization:completion:", v8, v9, v10, v11);

}

uint64_t __85__PKContactlessInterfaceSession_sendRKEFunction_action_withAuthorization_completion___block_invoke_114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  return result;
}

- (BOOL)cancelRKEFunction:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = v4;
  v6 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (self->_sessionType == 1)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__PKContactlessInterfaceSession_cancelRKEFunction___block_invoke;
    v8[3] = &unk_1E2AC0E00;
    v10 = &v11;
    v9 = v4;
    -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v8);

    v6 = *((_BYTE *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __51__PKContactlessInterfaceSession_cancelRKEFunction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "nfSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRKEFunction:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 == 0;

}

- (BOOL)queuePersistentCardEmulation
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__PKContactlessInterfaceSession_queuePersistentCardEmulation__block_invoke;
  v4[3] = &unk_1E2AC0D60;
  v4[4] = self;
  v4[5] = &v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __61__PKContactlessInterfaceSession_queuePersistentCardEmulation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 161));
  if ((v5 & 1) == 0 && !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168))
  {
    objc_msgSend(v3, "nfSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v7 = objc_msgSend(v6, "enablePlasticCardMode:error:", 1, &v10);
    v8 = v10;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
    atomic_store(*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 161));
    if (v8)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to enable Persistent Card Emulation. Error: %@", buf, 0xCu);
      }

    }
  }

}

- (BOOL)resetPersistentCardEmulation
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__PKContactlessInterfaceSession_resetPersistentCardEmulation__block_invoke;
  v4[3] = &unk_1E2AC0D60;
  v4[4] = self;
  v4[5] = &v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __61__PKContactlessInterfaceSession_resetPersistentCardEmulation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 161));
  if ((v5 & 1) != 0 && !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168))
  {
    objc_msgSend(v3, "nfSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v7 = objc_msgSend(v6, "enablePlasticCardMode:error:", 0, &v10);
    v8 = v10;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
    atomic_store(*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 161));
    if (v8)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to disable Persistent Card Emulation. Error: %@", buf, 0xCu);
      }

    }
  }

}

- (BOOL)paymentApplicationSupportsAutomaticAuthorization:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__PKContactlessInterfaceSession_paymentApplicationSupportsAutomaticAuthorization___block_invoke;
  v9[3] = &unk_1E2AC0E78;
  v11 = &v12;
  v9[4] = self;
  v5 = v4;
  v10 = v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v9);
  v6 = (void *)v13[5];
  if (v6)
    v7 = objc_msgSend(v6, "authTransientSupport") ^ 1;
  else
    LOBYTE(v7) = 0;

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __82__PKContactlessInterfaceSession_paymentApplicationSupportsAutomaticAuthorization___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_appletForPaymentApplication:inInternalSession:", *(_QWORD *)(a1 + 40), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (PKPaymentApplication)activatedPaymentApplication
{
  void *v2;
  void *v3;

  -[PKContactlessInterfaceSession activatedPaymentApplications](self, "activatedPaymentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPaymentApplication *)v3;
}

- (NSArray)activatedPaymentApplications
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__PKContactlessInterfaceSession_activatedPaymentApplications__block_invoke;
  v4[3] = &unk_1E2AC0E00;
  v4[4] = self;
  v4[5] = &v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __61__PKContactlessInterfaceSession_activatedPaymentApplications__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (PKPaymentPass)activatedPaymentPass
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PKContactlessInterfaceSession_activatedPaymentPass__block_invoke;
  v4[3] = &unk_1E2AC0E00;
  v4[4] = self;
  v4[5] = &v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (PKPaymentPass *)v2;
}

void __53__PKContactlessInterfaceSession_activatedPaymentPass__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)setState:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PKContactlessInterfaceSession_setState___block_invoke;
  v3[3] = &unk_1E2AC0E50;
  v3[4] = self;
  v3[5] = a3;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v3);
}

void __42__PKContactlessInterfaceSession_setState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[7];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v1 + 128);
  *(_QWORD *)(v1 + 128) = v2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 144);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PKContactlessInterfaceSession_setState___block_invoke_2;
  block[3] = &unk_1E2AC0E28;
  block[4] = v4;
  block[5] = v3;
  block[6] = v2;
  dispatch_async(v5, block);
}

void __42__PKContactlessInterfaceSession_setState___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contactlessInterfaceSession:didTransitionFromState:toState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)transitAppletStateForPaymentApplication:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PKContactlessInterfaceSession_transitAppletStateForPaymentApplication___block_invoke;
  v8[3] = &unk_1E2AC0E78;
  v8[4] = self;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __73__PKContactlessInterfaceSession_transitAppletStateForPaymentApplication___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (!*(_QWORD *)(a1[4] + 168))
  {
    v3 = a2;
    v4 = (void *)objc_opt_class();
    objc_msgSend(v3, "nfSession");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "transitAppletStateFromPaymentSession:forPaymentApplication:", v8, a1[5]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

+ (id)transitAppletStateFromPaymentSession:(id)a3 forPaymentApplication:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  PKFelicaAppletHistory *v11;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  PKFelicaAppletHistory *v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "applicationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appletWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "appletDataFormat");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && CFSTR("transit.felica.suica"))
      {
        if ((-[__CFString isEqual:](v9, "isEqual:", CFSTR("transit.felica.suica")) & 1) == 0)
          goto LABEL_19;
      }
      else if (v9 != CFSTR("transit.felica.suica"))
      {
        goto LABEL_19;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v26 = 0;
        objc_msgSend(v5, "felicaAppletState:error:", v8, &v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        v15 = v14;
        if (v13)
        {
          if (PKTransitDumpStates())
          {
            PKLogFacilityTypeGetObject(0xCuLL);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v6, "applicationIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v28 = v17;
              v29 = 2112;
              v30 = v13;
              _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Felica state for AID<%@>:\n%@", buf, 0x16u);

            }
          }
          v18 = -[PKFelicaAppletHistory initWithDictionary:source:]([PKFelicaAppletHistory alloc], "initWithDictionary:source:", v13, 1);
          goto LABEL_27;
        }
        if (!v14)
          goto LABEL_37;
        PKLogFacilityTypeGetObject(0xCuLL);
        v22 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        *(_DWORD *)buf = 138412290;
        v28 = v15;
        v23 = "Failed to acquire Felica state. Error: %@";
        goto LABEL_35;
      }
LABEL_19:
      if (!-[__CFString hasPrefix:](v10, "hasPrefix:", CFSTR("transit.apple"))
        || (objc_opt_respondsToSelector() & 1) == 0)
      {
        v13 = 0;
        v15 = 0;
        goto LABEL_41;
      }
      v25 = 0;
      objc_msgSend(v5, "transitAppletState:error:", v8, &v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v25;
      v15 = v19;
      if (v13)
      {
        if (PKTransitDumpStates())
        {
          PKLogFacilityTypeGetObject(0xCuLL);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "applicationIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v28 = v21;
            v29 = 2112;
            v30 = v13;
            _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Transit state for AID<%@>:\n%@", buf, 0x16u);

          }
        }
        v18 = -[PKTransitAppletHistory initWithDictionary:source:]([PKTransitAppletHistory alloc], "initWithDictionary:source:", v13, 1);
        if (v18)
        {
LABEL_27:
          v11 = v18;
LABEL_42:

          goto LABEL_10;
        }
        PKLogFacilityTypeGetObject(0xCuLL);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v13;
          _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "\tFailed to create transit history from transit state: %@", buf, 0xCu);
        }

LABEL_41:
        v11 = 0;
        goto LABEL_42;
      }
      if (!v19)
      {
LABEL_37:
        v13 = 0;
        goto LABEL_41;
      }
      PKLogFacilityTypeGetObject(0xCuLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
LABEL_36:

        goto LABEL_37;
      }
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      v23 = "Failed to acquire transit state. Error: %@";
LABEL_35:
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
      goto LABEL_36;
    }
  }
  else
  {
    v8 = 0;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (unint64_t)state
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__PKContactlessInterfaceSession_state__block_invoke;
  v4[3] = &unk_1E2AC0E00;
  v4[4] = self;
  v4[5] = &v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__PKContactlessInterfaceSession_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 128);
  return result;
}

- (BOOL)fieldPresent
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_fieldPresent);
  return v2 & 1;
}

- (BOOL)persistentCardEmulationQueued
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_persistentCardEmulation);
  return v2 & 1;
}

- (PKContactlessInterfaceSessionDelegate)delegate
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__PKContactlessInterfaceSession_delegate__block_invoke;
  v4[3] = &unk_1E2AC0E00;
  v4[4] = self;
  v4[5] = &v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (PKContactlessInterfaceSessionDelegate *)v2;
}

void __41__PKContactlessInterfaceSession_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKContactlessInterfaceSession *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PKContactlessInterfaceSession_setDelegate___block_invoke;
  v6[3] = &unk_1E2AC0EA0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v6);

}

void __45__PKContactlessInterfaceSession_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v15 = v7;
      v16 = 2114;
      v17 = v9;
      _os_log_debug_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEBUG, "PKContactlessInterfaceSession (%p): switching to delegate of kind %{public}@.", buf, 0x16u);

    }
  }
  else if (v6)
  {
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    v15 = v12;
    _os_log_debug_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEBUG, "PKContactlessInterfaceSession (%p): switching to nil delegate.", buf, 0xCu);
  }

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 136), *(id *)(a1 + 32));
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(NSObject **)(v10 + 144);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PKContactlessInterfaceSession_setDelegate___block_invoke_127;
  block[3] = &unk_1E2ABE120;
  block[4] = v10;
  dispatch_async(v11, block);

}

void __45__PKContactlessInterfaceSession_setDelegate___block_invoke_127(uint64_t a1)
{
  _BYTE *v2;
  id v3;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[160])
  {
    objc_msgSend(v2, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 160) = 0;
      objc_msgSend(v3, "contactlessInterfaceSessionHasPendingServerRequest:", *(_QWORD *)(a1 + 32));
    }

  }
}

- (BOOL)isWaitingOnConfirmationForHandoff
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__PKContactlessInterfaceSession_isWaitingOnConfirmationForHandoff__block_invoke;
  v4[3] = &unk_1E2AC0E00;
  v4[4] = self;
  v4[5] = &v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __66__PKContactlessInterfaceSession_isWaitingOnConfirmationForHandoff__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 164);
  return result;
}

- (id)_paymentApplicationForEventAppletIdentifier:(id)a3 inContext:(id)a4 withSession:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  void *v53;
  id obj;
  id obja;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activatedPaymentApplications");
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  obj = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (!obj)
  {
    v33 = 0;
    goto LABEL_55;
  }
  v44 = v8;
  v45 = v10;
  v12 = *(_QWORD *)v61;
  v49 = v9;
  v50 = *(_QWORD *)v61;
  v51 = v11;
LABEL_3:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v61 != v12)
      objc_enumerationMutation(v11);
    v14 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v13);
    objc_msgSend(v14, "applicationIdentifier", v44);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v7 && v15)
    {
      v17 = objc_msgSend(v15, "isEqual:", v7);

      if ((v17 & 1) != 0)
        goto LABEL_35;
    }
    else
    {

      if (v16 == v7)
      {
LABEL_35:
        v33 = v14;
LABEL_36:
        v8 = v44;
        v10 = v45;
        goto LABEL_55;
      }
    }
    PKLogFacilityTypeGetObject(6uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session: primary applet identifiers do not match, inspecting group AIDs...", buf, 2u);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "applicationIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appletWithIdentifier:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        break;
    }
LABEL_32:
    if (obj == (id)++v13)
    {
      obj = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      if (obj)
        goto LABEL_3;
      v33 = 0;
      goto LABEL_36;
    }
  }
  objc_msgSend(v20, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "groupMemberIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "multiSEGroupMemberIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "count"))
  {
    v24 = v23;
    objc_msgSend(v20, "groupHeadID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v46 = v21;
      objc_msgSend(v9, "appletWithIdentifier:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        v52 = v25;

        objc_msgSend(v27, "groupMemberIDs");
        v28 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "multiSEGroupMemberIDs");
        v47 = objc_claimAutoreleasedReturnValue();

        v22 = v27;
        v21 = v52;
        v24 = (void *)v47;
      }
      else
      {
        v28 = 0;
      }
    }
    else
    {
      v28 = 0;
    }

    v22 = (void *)v28;
    v23 = v24;
    v9 = v49;
    v12 = v50;
  }
  v53 = v23;
  if (objc_msgSend(v23, "count"))
  {
    v29 = v21;
    if (v22)
      v30 = (id)objc_msgSend(v22, "mutableCopy");
    else
      v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = v30;
    objc_msgSend(v30, "addObjectsFromArray:", v23);
    v32 = objc_msgSend(v31, "copy");

    v22 = (void *)v32;
    v21 = v29;
    v12 = v50;
  }
  if (!v7
    || (!v22 || (objc_msgSend(v22, "containsObject:", v7) & 1) == 0)
    && !objc_msgSend(v21, "isEqualToString:", v7))
  {

    v11 = v51;
    goto LABEL_32;
  }
  v48 = v21;
  objc_msgSend(v45, "devicePaymentApplications");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obja = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v57;
LABEL_40:
    v37 = 0;
    while (1)
    {
      if (*(_QWORD *)v57 != v36)
        objc_enumerationMutation(obja);
      v38 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v37);
      objc_msgSend(v38, "applicationIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", v7);

      if ((v40 & 1) != 0)
        break;
      if (v35 == ++v37)
      {
        v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        if (v35)
          goto LABEL_40;
        goto LABEL_46;
      }
    }
    v33 = v38;

    if (!v33)
      goto LABEL_51;
    v9 = v49;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v33, "applicationIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v65 = v41;
      v66 = 2112;
      v67 = v7;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session: Applet is member of group and actual payment application identified; aliasing (%@ ↔ %@).",
        buf,
        0x16u);

    }
    v10 = v45;
    v42 = v48;
  }
  else
  {
LABEL_46:

LABEL_51:
    v42 = v48;
    v9 = v49;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session: Applet is member of group but failed to identify actual payment application.", buf, 2u);
    }
    v33 = 0;
    v10 = v45;
  }

  v8 = v44;
  v11 = v51;
LABEL_55:

  return v33;
}

- (id)_appletForPaymentApplication:(id)a3 inInternalSession:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "applicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContactlessInterfaceSession _appletWithIdentifier:inInternalSession:](self, "_appletWithIdentifier:inInternalSession:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_appletWithIdentifier:(id)a3 inInternalSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && self->_sessionType <= 1)
  {
    objc_msgSend(v7, "nfSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appletWithIdentifier:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_filteredLoyaltyPassesFromVASTransactions:(id)a3 activatedPasses:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v30 = v5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v29 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v14, "passTypeIdentifier", v29);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "dataUsingEncoding:", 4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "SHA256Hash");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v18, v17);
          }
          objc_msgSend(v18, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v11);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = v30;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "merchant", v29);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            objc_msgSend(v7, "addObjectsFromArray:", v26);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v21);
    }

    v6 = v29;
    v5 = v30;
  }
  v27 = (void *)objc_msgSend(v7, "copy", v29);

  return v27;
}

- (void)_endPersistentCardEmulationForPaymentPass:(id)a3 paymentApplications:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *callbackQueue;
  PKContactlessInterfaceTransactionContext *v13;
  PKContactlessInterfaceTransactionContext *v14;
  PKContactlessInterfaceTransactionContext *v15;
  uint64_t v16;
  PKContactlessInterfaceTransactionContext *v17;
  NSObject *v18;
  _QWORD v19[6];
  PKContactlessInterfaceTransactionContext *v20;
  _QWORD v21[5];
  PKContactlessInterfaceTransactionContext *v22;
  _QWORD block[6];
  id v24;
  _QWORD v25[4];
  PKContactlessInterfaceTransactionContext *v26;
  id v27;
  PKContactlessInterfaceSession *v28;
  id v29;

  v6 = a3;
  v7 = a4;
  -[PKContactlessInterfaceSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke;
    v25[3] = &unk_1E2AC0EC8;
    v26 = (PKContactlessInterfaceTransactionContext *)v7;
    v27 = v6;
    v28 = self;
    v11 = v9;
    v29 = v11;
    -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v25);
    callbackQueue = self->_callbackQueue;
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke_2;
    block[3] = &unk_1E2ABE0F8;
    block[4] = v8;
    block[5] = self;
    v24 = v11;
    v13 = (PKContactlessInterfaceTransactionContext *)v11;
    dispatch_async(callbackQueue, block);

    v14 = v26;
LABEL_5:

    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = -[PKContactlessInterfaceTransactionContext initWithPaymentPass:activatedPaymentApplications:]([PKContactlessInterfaceTransactionContext alloc], "initWithPaymentPass:activatedPaymentApplications:", v6, v7);
    -[PKContactlessInterfaceTransactionContext setSuccess:](v15, "setSuccess:", 1);
    v16 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke_3;
    v21[3] = &unk_1E2AC0EA0;
    v21[4] = self;
    v17 = v15;
    v22 = v17;
    -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v21);
    v18 = self->_callbackQueue;
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke_4;
    v19[3] = &unk_1E2ABE0F8;
    v19[4] = v8;
    v19[5] = self;
    v20 = v17;
    v13 = v17;
    dispatch_async(v18, v19);

    v14 = v22;
    goto LABEL_5;
  }
LABEL_6:

}

void __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  PKContactlessInterfaceTransactionContext *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
        v8 = -[PKContactlessInterfaceTransactionContext initWithPaymentPass:activatedPaymentApplications:]([PKContactlessInterfaceTransactionContext alloc], "initWithPaymentPass:activatedPaymentApplications:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
        -[PKContactlessInterfaceTransactionContext setSuccess:](v8, "setSuccess:", 1);
        -[PKContactlessInterfaceTransactionContext setPaymentApplication:](v8, "setPaymentApplication:", v7);
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 48) + 168))
        {
          v9 = (void *)objc_opt_class();
          objc_msgSend(v12, "nfSession");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "transitAppletStateFromPaymentSession:forPaymentApplication:", v10, v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            -[PKContactlessInterfaceTransactionContext setTransitHistory:](v8, "setTransitHistory:", v11);

        }
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v8, v12);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

void __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v1, "contactlessInterfaceSession:didEndPersistentCardEmulationWithContexts:", v2, v3);

}

void __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v4 + 168))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = *(id *)(v4 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v11 = (void *)objc_opt_class();
          objc_msgSend(v3, "nfSession", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "transitAppletStateFromPaymentSession:forPaymentApplication:", v12, v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 40), "setPaymentApplication:", v10);
          if (v13)
          {
            objc_msgSend(*(id *)(a1 + 40), "setTransitHistory:", v13);

            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

uint64_t __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contactlessInterfaceSession:didEndPersistentCardEmulationWithContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_processEndEvent:(id)a3 withPartialContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  char v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  void *v50;
  unsigned __int8 v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  int v55;
  int v57;
  int v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id obj;
  int v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  PKContactlessInterfaceSession *v76;
  __int16 v77;
  NSObject *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKContactlessInterfaceSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentApplication");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v6, "applet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = objc_claimAutoreleasedReturnValue();

    if (v8 && ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0))
    {
      PKLogFacilityTypeGetObject(6uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v76 = self;
        v77 = 2112;
        v78 = v16;
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): received event for unexpected applet identifier %@.", buf, 0x16u);
      }

      AnalyticsSendEvent();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "activatedPaymentApplications");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "valueAddedServicePasses");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "contactlessInterfaceSessionDidFail:forPaymentApplications:paymentPass:valueAddedServicePasses:", self, v18, v9, v19);
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_80;
        objc_msgSend(v7, "activatedPaymentApplications");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "valueAddedServicePasses");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "contactlessInterfaceSessionDidFail:forPaymentApplication:paymentPass:valueAddedServicePasses:", self, v19, v9, v26);

      }
      goto LABEL_80;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v76 = self;
      v77 = 2112;
      v78 = v16;
      _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): received event for unexpected applet identifier %@; dropped.",
        buf,
        0x16u);
    }
LABEL_57:

    AnalyticsSendEvent();
    goto LABEL_80;
  }
  v11 = objc_msgSend(v6, "didError");
  v12 = objc_msgSend(v6, "type");
  v13 = -[NSObject paymentType](v10, "paymentType");
  if ((unint64_t)(v13 - 1001) > 3 || v13 == 1002)
  {
    objc_msgSend(v6, "transactionIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "uppercaseString");
    v16 = objc_claimAutoreleasedReturnValue();

    if (v12 == 256)
      v24 = v11;
    else
      v24 = 1;
    if ((v24 & 1) == 0)
    {

      v16 = 0;
    }
    if ((v11 & 1) != 0)
    {
      if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v76 = self;
          v77 = 2112;
          v78 = v10;
          v79 = 1024;
          LODWORD(v80) = objc_msgSend(v6, "result");
          _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Failed Transaction for %@: result %d.", buf, 0x1Cu);
        }

        AnalyticsSendEvent();
        objc_msgSend(v8, "contactlessInterfaceSessionDidFailTransaction:forPaymentApplication:paymentPass:", self, v10, v9);
        goto LABEL_80;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v76 = self;
        v77 = 2112;
        v78 = v10;
        v79 = 1024;
        LODWORD(v80) = objc_msgSend(v6, "result");
        _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Failed Transaction for %@: result %d; dropped.",
          buf,
          0x1Cu);
      }
      goto LABEL_57;
    }
    objc_msgSend(v7, "setSuccess:", 1);
    if (v12 <= 0x22 && ((1 << v12) & 0x500000004) != 0)
    {
      -[NSObject supportsTransitHistory](v10, "supportsTransitHistory");
      v69 = 0;
      v27 = 0;
      v28 = 1;
      goto LABEL_47;
    }
    if (objc_msgSend(v9, "isTransitPass"))
      v28 = 2;
    else
      v28 = 0;
    v35 = -[NSObject supportsTransitHistory](v10, "supportsTransitHistory");
    if (v12 != 256 || (v35 & 1) != 0)
    {
      v27 = 0;
      v69 = 0;
      goto LABEL_70;
    }
    objc_msgSend(v7, "transitHistory");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36
      || (-[NSObject supportsSuica](v10, "supportsSuica") & 1) != 0
      || objc_msgSend(v6, "result") == 61443
      || objc_msgSend(v36, "source"))
    {
      v27 = 0;
      v69 = 0;
LABEL_69:

LABEL_70:
      if (v28 == 2)
      {
LABEL_71:
        if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          PKLogFacilityTypeGetObject(6uLL);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "transaction");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v76 = self;
            v77 = 2112;
            v78 = v10;
            v79 = 2112;
            v80 = v38;
            _os_log_impl(&dword_18FC92000, v37, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Successful Transaction for %@: %@.", buf, 0x20u);

          }
          AnalyticsSendEvent();
          -[PKContactlessInterfaceSession _signalWalletTransactionForContext:](self, "_signalWalletTransactionForContext:", v7);
          objc_msgSend(v8, "contactlessInterfaceSession:didFinishTransactionWithContext:", self, v7);
        }
        else
        {
          PKLogFacilityTypeGetObject(6uLL);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "transaction");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v76 = self;
            v77 = 2112;
            v78 = v10;
            v79 = 2112;
            v80 = v40;
            _os_log_impl(&dword_18FC92000, v39, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Successful Transaction for %@: %@; dropped.",
              buf,
              0x20u);

          }
          AnalyticsSendEvent();
          -[PKContactlessInterfaceSession _signalWalletTransactionForContext:](self, "_signalWalletTransactionForContext:", v7);
        }

        goto LABEL_80;
      }
LABEL_47:
      if ((objc_msgSend(v9, "isEMoneyPass") & 1) == 0)
      {
        objc_msgSend(v7, "setTransitHistory:", 0);
        +[PKPaymentTransaction paymentTransactionWithSource:](PKPaymentTransaction, "paymentTransactionWithSource:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setOriginatedByDevice:", 1);
        objc_msgSend(v29, "setTransactionType:", v28);
        v67 = v16;
        objc_msgSend(v29, "setPaymentHash:", v16);
        objc_msgSend(v29, "addUpdateReasons:", 1);
        objc_msgSend(v7, "paymentApplication");
        v30 = v27;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "dpanIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setDPANIdentifier:", v32);

        objc_msgSend(v29, "setPaymentNetworkIdentifier:", objc_msgSend(v31, "paymentNetworkIdentifier"));
        objc_msgSend(v7, "date");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setTransactionDate:", v33);

        if ((objc_msgSend(v6, "informative") & 0x100) != 0)
          v34 = 2;
        else
          v34 = 1;
        objc_msgSend(v29, "setTechnologyType:", v34);
        if (v30 && v69)
        {
          objc_msgSend(v29, "setAmount:", v69);
          objc_msgSend(v29, "setCurrencyCode:", v30);
        }
        objc_msgSend(v7, "setTransaction:", v29);

        v27 = v30;
        v16 = v67;
      }
      goto LABEL_71;
    }
    v63 = v36;
    v64 = v28;
    objc_msgSend(v36, "historyRecords");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "felicaHistoryRecord");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "transactionID");
    v62 = objc_claimAutoreleasedReturnValue();

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    obj = v41;
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    if (v70)
    {
      v61 = v9;
      v44 = 0;
      v66 = 0;
      v68 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v70; ++i)
        {
          if (*(_QWORD *)v72 != v68)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "felicaHistoryRecord", v61);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46;
          if (v46)
          {
            objc_msgSend(v46, "transactionType");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "unsignedIntegerValue");

            if (v49 == 240 || v49 == 74)
            {
              objc_msgSend(v47, "amountType");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v50, "unsignedIntegerValue");

              if (v51 != 3)
              {
                PKLogFacilityTypeGetObject(6uLL);
                v52 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v76) = v51;
                  _os_log_impl(&dword_18FC92000, v52, OS_LOG_TYPE_DEFAULT, "Invalid amount type detected for Felica transaction: %d", buf, 8u);
                }

              }
              v53 = v49;
              objc_msgSend(v47, "amount");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v54, "integerValue");

              if (v55 < 0 || v53 == 240)
                v57 = v55;
              else
                v57 = -v55;
              v66 += v57;
              v44 = 1;
            }
          }

        }
        v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
      }
      while (v70);

      if ((v44 & 1) != 0)
      {
        v58 = v66;
        if (v66 >= 0)
          v59 = v66;
        else
          v59 = -v66;
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", v59, 0, v66 >> 31);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject appletCurrencyCode](v10, "appletCurrencyCode");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          PKLogFacilityTypeGetObject(6uLL);
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v60, OS_LOG_TYPE_DEFAULT, "Felica payment transaction missing applet currency code - will be ignored.", buf, 2u);
          }

          v58 = v66;
        }
        v28 = v64;
        if (v58 < 0)
          v28 = 1;
        v9 = v61;
        goto LABEL_117;
      }
      v27 = 0;
      v69 = 0;
      v9 = v61;
    }
    else
    {

      v27 = 0;
      v69 = 0;
    }
    v28 = v64;
LABEL_117:
    v16 = v62;
    v36 = v63;

    goto LABEL_69;
  }
  if ((v11 & 1) != 0)
  {
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v76 = self;
        v77 = 2112;
        v78 = v10;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Failed Access Event for %@.", buf, 0x16u);
      }

      objc_msgSend(v8, "contactlessInterfaceSessionDidFailTransaction:forPaymentApplication:paymentPass:", self, v10, v9);
      goto LABEL_81;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v76 = self;
      v77 = 2112;
      v78 = v10;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Failed Access Event for %@; dropped.",
        buf,
        0x16u);
    }
LABEL_80:

    goto LABEL_81;
  }
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v76 = self;
      v77 = 2112;
      v78 = v10;
      _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Successful Access Event for %@.", buf, 0x16u);
    }

    objc_msgSend(v7, "setSuccess:", 1);
    -[PKContactlessInterfaceSession _signalWalletTransactionForContext:](self, "_signalWalletTransactionForContext:", v7);
    objc_msgSend(v8, "contactlessInterfaceSession:didFinishTransactionWithContext:", self, v7);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v76 = self;
      v77 = 2112;
      v78 = v10;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Successful Access Event for %@; dropped.",
        buf,
        0x16u);
    }

    objc_msgSend(v7, "setSuccess:", 1);
    -[PKContactlessInterfaceSession _signalWalletTransactionForContext:](self, "_signalWalletTransactionForContext:", v7);
  }
LABEL_81:

}

- (void)_signalWalletTransactionForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t outstandingTransactionType;
  NSObject *v11;
  void *v12;
  OS_dispatch_queue *transactionSignalQueue;
  NSObject *v14;
  __int16 v15;
  _QWORD aBlock[4];
  NSObject *v17;

  v4 = a3;
  objc_msgSend(v4, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "valueAddedServicePasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "transaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    outstandingTransactionType = self->_outstandingTransactionType;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PKContactlessInterfaceSession__signalWalletTransactionForContext___block_invoke;
    aBlock[3] = &unk_1E2AC0EF0;
    v11 = v7;
    v17 = v11;
    v12 = _Block_copy(aBlock);
    transactionSignalQueue = self->_transactionSignalQueue;
    if (v9)
      +[PKWalletTransactionSignal donateSignalForPass:transaction:queue:completion:](PKWalletTransactionSignal, "donateSignalForPass:transaction:queue:completion:", v11, v9, transactionSignalQueue, v12);
    else
      +[PKWalletTransactionSignal donateSignalForPass:transactionType:queue:completion:](PKWalletTransactionSignal, "donateSignalForPass:transactionType:queue:completion:", v11, outstandingTransactionType, transactionSignalQueue, v12);

    v14 = v17;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Unable to donate signal for nil pass!", (uint8_t *)&v15, 2u);
    }
  }

}

void __68__PKContactlessInterfaceSession__signalWalletTransactionForContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Unable to donate signal for pass %@. Error: %@", (uint8_t *)&v6, 0x16u);

    }
  }

}

- (void)loyaltyAndPaymentSessionHasPendingServerRequest:(id)a3
{
  NSObject *v4;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Received Pending Priority Session Notification...", buf, 2u);
  }

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PKContactlessInterfaceSession_loyaltyAndPaymentSessionHasPendingServerRequest___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __81__PKContactlessInterfaceSession_loyaltyAndPaymentSessionHasPendingServerRequest___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_respondsToSelector();
  v3 = *(_QWORD *)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    *(_BYTE *)(v3 + 160) = 0;
    objc_msgSend(v4, "contactlessInterfaceSessionHasPendingServerRequest:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    *(_BYTE *)(v3 + 160) = 1;
  }

}

- (void)loyaltyAndPaymentSession:(id)a3 didStartTransaction:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  kdebug_trace();
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Started Transaction Event: %@", buf, 0xCu);
  }

  AnalyticsSendEvent();
  PKTimeProfileBegin((uint64_t)v6, CFSTR("contactless_transaction"));

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didStartTransaction___block_invoke;
  v8[3] = &unk_1E2AC0EA0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v8);

}

void __78__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didStartTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = mach_absolute_time();
    if (objc_msgSend(*(id *)(a1 + 40), "paymentMode") == 2)
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(a1 + 40);
      v6 = *(NSObject **)(v4 + 144);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didStartTransaction___block_invoke_2;
      block[3] = &unk_1E2ABE0F8;
      block[4] = v4;
      v8 = v5;
      v9 = v3;
      dispatch_async(v6, block);

    }
  }

}

void __78__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didStartTransaction___block_invoke_2(id *a1)
{
  PKContactlessInterfaceTransactionContext *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1[4], "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = -[PKContactlessInterfaceTransactionContext initWithPaymentPass:activatedPaymentApplications:]([PKContactlessInterfaceTransactionContext alloc], "initWithPaymentPass:activatedPaymentApplications:", *((_QWORD *)a1[4] + 5), *((_QWORD *)a1[4] + 4));
    objc_msgSend(a1[5], "applet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = a1[4];
    objc_msgSend(a1[6], "nfSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_paymentApplicationForEventAppletIdentifier:inContext:withSession:", v4, v2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactlessInterfaceTransactionContext setPaymentApplication:](v2, "setPaymentApplication:", v7);

    objc_msgSend(v8, "contactlessInterfaceSessionDidStartTransaction:withContext:", a1[4], v2);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "contactlessInterfaceSessionDidStartTransaction:", a1[4]);
  }

}

- (void)loyaltyAndPaymentSessionDidReceiveActivityTimeout:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  PKTransactionSessionWrapper *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v7);

  -[PKContactlessInterfaceSession _sessionDidReceiveActivityTimeout:result:](self, "_sessionDidReceiveActivityTimeout:result:", v8, v6);
}

- (void)loyaltyAndPaymentSession:(id)a3 didEndTransaction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  const __CFString *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "result") != 61443)
  {
    kdebug_trace();
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Finished Transaction Event: %@", buf, 0xCu);
    }

    v9 = PKTimeProfileEnd(v8, CFSTR("contactless_transaction"), CFSTR("Transaction Event"));
    v10 = mach_absolute_time();
    v11 = PKSecondsFromMachTimeInterval(v10 - self->_transactionStartTime);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("duration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __76__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didEndTransaction___block_invoke;
    v16[3] = &unk_1E2AC0EC8;
    v16[4] = self;
    v17 = v7;
    v18 = v12;
    v19 = v6;
    v15 = v12;
    -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v16);

  }
}

void __76__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didEndTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  PKContactlessInterfaceTransactionContext *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  PKFelicaAppletHistory *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  PKContactlessInterfaceTransactionContext *v34;
  NSObject *log;
  id v36;
  id v37;
  _QWORD block[5];
  id v39;
  PKContactlessInterfaceTransactionContext *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 80);
  if (!v5)
  {
    v6 = *(id *)(v4 + 40);
    v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 64);
    *(_QWORD *)(v9 + 64) = 0;

    objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
    v11 = -[PKContactlessInterfaceTransactionContext initWithPaymentPass:activatedPaymentApplications:]([PKContactlessInterfaceTransactionContext alloc], "initWithPaymentPass:activatedPaymentApplications:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    -[PKContactlessInterfaceTransactionContext setDate:](v11, "setDate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_filteredLoyaltyPassesFromVASTransactions:activatedPasses:", v8, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactlessInterfaceTransactionContext setValueAddedServicePasses:](v11, "setValueAddedServicePasses:", v12);

    -[PKContactlessInterfaceTransactionContext setValueAddedServiceTransactions:](v11, "setValueAddedServiceTransactions:", v8);
    v13 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "applet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nfSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_paymentApplicationForEventAppletIdentifier:inContext:withSession:", v15, v11, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactlessInterfaceTransactionContext setPaymentApplication:](v11, "setPaymentApplication:", v17);

    -[PKContactlessInterfaceTransactionContext paymentApplication](v11, "paymentApplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = objc_msgSend(v18, "supportsTransitHistory");
      if (objc_msgSend(*(id *)(a1 + 40), "type") == 256 && (v20 & 1) == 0)
      {
        if (objc_msgSend(v19, "supportsSuica"))
        {
          v21 = *(void **)(a1 + 56);
          objc_msgSend(v21, "activeApplet");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          objc_msgSend(v21, "felicaAppletState:error:", v22, &v42);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v42;

          v25 = 1;
          if (!v23)
            goto LABEL_16;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "felicaInfo");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0;
          v24 = 0;
          if (!v23)
          {
LABEL_16:
            v37 = v24;
            PKLogFacilityTypeGetObject(0xCuLL);
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v37;
              _os_log_impl(&dword_18FC92000, v30, OS_LOG_TYPE_DEFAULT, "\tFailed to acquire Felica state for transaction. Error: %@", buf, 0xCu);
            }

            v24 = v37;
          }
        }
        v28 = -[PKFelicaAppletHistory initWithDictionary:source:]([PKFelicaAppletHistory alloc], "initWithDictionary:source:", v23, v25);
        -[PKContactlessInterfaceTransactionContext setTransitHistory:](v11, "setTransitHistory:", v28);
        goto LABEL_20;
      }
      if (v20)
      {
        v26 = *(void **)(a1 + 56);
        objc_msgSend(v26, "activeApplet");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        objc_msgSend(v26, "transitAppletState:error:", v27, &v41);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v41;

        if (!v23)
        {
          PKLogFacilityTypeGetObject(0xCuLL);
          v28 = (PKFelicaAppletHistory *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v28->super.super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v24;
            _os_log_impl(&dword_18FC92000, &v28->super.super, OS_LOG_TYPE_DEFAULT, "\tFailed to acquire transit state for transaction. Error: %@", buf, 0xCu);
          }
          v23 = 0;
          goto LABEL_20;
        }
        v28 = -[PKTransitAppletHistory initWithDictionary:source:]([PKTransitAppletHistory alloc], "initWithDictionary:source:", v23, 1);
        if (v28)
        {
          -[PKContactlessInterfaceTransactionContext setTransitHistory:](v11, "setTransitHistory:", v28);
          if (!PKTransitDumpStates())
          {
LABEL_20:

            goto LABEL_21;
          }
          PKLogFacilityTypeGetObject(0xCuLL);
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v19, "applicationIdentifier");
            v36 = v24;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v44 = v29;
            v45 = 2112;
            v46 = v23;
            _os_log_impl(&dword_18FC92000, log, OS_LOG_TYPE_DEFAULT, "Transit state for AID<%@>:\n%@", buf, 0x16u);

            v24 = v36;
          }
        }
        else
        {
          PKLogFacilityTypeGetObject(0xCuLL);
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v23;
            _os_log_impl(&dword_18FC92000, log, OS_LOG_TYPE_DEFAULT, "\tFailed to create transit history from transit state: %@", buf, 0xCu);
          }
        }

        goto LABEL_20;
      }
    }
LABEL_21:
    v31 = *(_QWORD *)(a1 + 32);
    v32 = *(void **)(a1 + 40);
    v33 = *(NSObject **)(v31 + 144);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didEndTransaction___block_invoke_167;
    block[3] = &unk_1E2ABE0F8;
    block[4] = v31;
    v39 = v32;
    v40 = v11;
    v34 = v11;
    dispatch_async(v33, block);

    goto LABEL_22;
  }
  PKFieldPropertiesResolveSecondaryLookup(v5, *(void **)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_endLookupAndNotify");
LABEL_22:

}

uint64_t __76__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didEndTransaction___block_invoke_167(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processEndEvent:withPartialContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)loyaltyAndPaymentSession:(id)a3 didExpireTransactionForApplet:(id)a4
{
  id v6;
  id v7;
  PKTransactionSessionWrapper *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v7);

  -[PKContactlessInterfaceSession _session:didExpireTransactionForApplet:](self, "_session:didExpireTransactionForApplet:", v8, v6);
}

- (void)loyaltyAndPaymentSessionDidEndUnexpectedly:(id)a3
{
  id v4;
  PKTransactionSessionWrapper *v5;

  v4 = a3;
  v5 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v4);

  -[PKContactlessInterfaceSession _sessionDidEndUnexpectedly:](self, "_sessionDidEndUnexpectedly:", v5);
}

- (void)loyaltyAndPaymentSession:(id)a3 didPerformValueAddedServiceTransactions:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PKContactlessInterfaceSession *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session got Value Added Service Transactions: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke;
  v8[3] = &unk_1E2AC0EA0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v8);

}

void __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  PKContactlessInterfaceTransactionContext *v15;
  PKContactlessInterfaceTransactionContext *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD block[5];
  PKContactlessInterfaceTransactionContext *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v5 = *(void **)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke_2;
  v27[3] = &unk_1E2AC0F18;
  v7 = v4;
  v28 = v7;
  v29 = &v30;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v27);
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
  if (v8)
  {
    PKFieldPropertiesResolveSecondaryLookup(v8, *(void **)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_endLookupAndNotify");
  }
  else if (!*((_BYTE *)v31 + 24))
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "terminalMode");

    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count");
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke_3;
    v22[3] = &unk_1E2AC0F40;
    v22[4] = &v23;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v22);
    objc_msgSend(v3, "nfSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHostCards:", 0);

    if (v11 && v10 == 3 && *((_BYTE *)v24 + 24))
    {
      v13 = objc_msgSend(v7, "copy");
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(PKContactlessInterfaceTransactionContext **)(v14 + 64);
      *(_QWORD *)(v14 + 64) = v13;
    }
    else
    {
      v16 = -[PKContactlessInterfaceTransactionContext initWithPaymentPass:activatedPaymentApplications:]([PKContactlessInterfaceTransactionContext alloc], "initWithPaymentPass:activatedPaymentApplications:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
      -[PKContactlessInterfaceTransactionContext setValueAddedServiceTransactions:](v16, "setValueAddedServiceTransactions:", v7);
      objc_msgSend(*(id *)(a1 + 40), "_filteredLoyaltyPassesFromVASTransactions:activatedPasses:", v7, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKContactlessInterfaceTransactionContext setValueAddedServicePasses:](v16, "setValueAddedServicePasses:", v17);

      objc_msgSend(*(id *)(a1 + 40), "_signalWalletTransactionForContext:", v16);
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(NSObject **)(v18 + 144);
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke_4;
      block[3] = &unk_1E2ABE0D0;
      block[4] = v18;
      v21 = v16;
      v15 = v16;
      dispatch_async(v19, block);

    }
    _Block_object_dispose(&v23, 8);
  }

  _Block_object_dispose(&v30, 8);
}

void __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke_2(uint64_t a1, void *a2)
{
  PKValueAddedServiceTransaction *v3;
  PKValueAddedMerchant *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v3 = objc_alloc_init(PKValueAddedServiceTransaction);
  v4 = objc_alloc_init(PKValueAddedMerchant);
  objc_msgSend(v17, "merchantId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKValueAddedMerchant setIdentifier:](v4, "setIdentifier:", v5);

  -[PKValueAddedServiceTransaction setMerchant:](v3, "setMerchant:", v4);
  objc_msgSend(v17, "signupUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKValueAddedServiceTransaction setMerchantURL:](v3, "setMerchantURL:", v6);

  objc_msgSend(v17, "terminalAppVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKValueAddedServiceTransaction setTerminalApplicationVersion:](v3, "setTerminalApplicationVersion:", v7);

  objc_msgSend(v17, "terminalMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue") - 1;
  if (v9 > 7)
    v10 = 0;
  else
    v10 = qword_1904533D8[v9];
  -[PKValueAddedServiceTransaction setTerminalMode:](v3, "setTerminalMode:", v10);

  objc_msgSend(v17, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "code");
  if (v12 == 27012)
    v13 = 3;
  else
    v13 = v12 == 27267;
  if (v12 == 25223)
    v14 = 2;
  else
    v14 = v13;
  -[PKValueAddedServiceTransaction setError:](v3, "setError:", v14);

  objc_msgSend(v17, "didSucceed");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKValueAddedServiceTransaction setDidSucceed:](v3, "setDidSucceed:", objc_msgSend(v15, "BOOLValue"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKValueAddedServiceTransaction setTransactionDate:](v3, "setTransactionDate:", v16);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  if (!-[PKValueAddedServiceTransaction didSucceed](v3, "didSucceed")
    && -[PKValueAddedServiceTransaction error](v3, "error") == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

uint64_t __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "didSucceed");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session VAS transaction finished.", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "contactlessInterfaceSession:didFinishTransactionWithContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)loyaltyAndPaymentSession:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v6;
  id v7;
  PKTransactionSessionWrapper *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v7);

  -[PKContactlessInterfaceSession _session:didEnterFieldWithNotification:](self, "_session:didEnterFieldWithNotification:", v8, v6);
}

- (void)loyaltyAndPaymentSessionDidExitField:(id)a3
{
  id v4;
  PKTransactionSessionWrapper *v5;

  v4 = a3;
  v5 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v4);

  -[PKContactlessInterfaceSession _sessionDidExitField:](self, "_sessionDidExitField:", v5);
}

- (void)loyaltyAndPaymentSession:(id)a3 didSelectApplet:(id)a4
{
  id v6;
  id v7;
  PKTransactionSessionWrapper *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v7);

  -[PKContactlessInterfaceSession _session:didSelectApplet:](self, "_session:didSelectApplet:", v8, v6);
}

- (void)loyaltyAndPaymentSession:(id)a3 didSelectValueAddedService:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Did Select Value Added Service", buf, 2u);
    }

    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didSelectValueAddedService___block_invoke;
    block[3] = &unk_1E2ABE120;
    block[4] = self;
    dispatch_async(callbackQueue, block);
  }

}

void __85__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didSelectValueAddedService___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contactlessInterfaceSessionDidSelectValueAddedService:", *(_QWORD *)(a1 + 32));

}

- (void)loyaltyAndPaymentSession:(id)a3 didFailDeferredAuthorization:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PKTransactionSessionWrapper *v7;

  v4 = a4;
  v6 = a3;
  v7 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v6);

  -[PKContactlessInterfaceSession _session:didFailDeferredAuthorization:](self, "_session:didFailDeferredAuthorization:", v7, v4);
}

- (void)loyaltyAndPaymentSession:(id)a3 didFelicaStateChange:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didFelicaStateChange___block_invoke;
  v4[3] = &unk_1E2AC0C58;
  v4[4] = self;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v4, a4);
}

uint64_t __79__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didFelicaStateChange___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 120) = 1;
  return result;
}

- (void)loyaltyAndPaymentSession:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  PKTransactionSessionWrapper *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = a3;
  v10 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v9);

  -[PKContactlessInterfaceSession _session:didExpressModeStateChange:withObject:](self, "_session:didExpressModeStateChange:withObject:", v10, v5, v8);
}

- (void)session:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PKPaymentPass *v19;
  uint64_t v20;
  PKContactlessInterfaceTransactionContext *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *callbackQueue;
  PKContactlessInterfaceTransactionContext *v29;
  PKPaymentPass *v30;
  uint64_t v31;
  void *v32;
  _QWORD block[5];
  PKContactlessInterfaceTransactionContext *v34;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  if (PKGetConstantStringNF_SECURE_XPC_EVENT_KEY_EVENT_NAME_onceToken != -1)
    dispatch_once(&PKGetConstantStringNF_SECURE_XPC_EVENT_KEY_EVENT_NAME_onceToken, &__block_literal_global_71_0);
  objc_msgSend(v8, "stringWithUTF8String:", PKGetConstantStringNF_SECURE_XPC_EVENT_KEY_EVENT_NAME_constant);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.lock")) & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.unlock")))goto LABEL_13;
    v12 = 2;
  }
  PKGetConstantStringNF_DCK_EVENT_KEY_APPLET_IDENTIFIER();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v31 = v12;
    PKGetConstantStringNF_DCK_EVENT_KEY_KEY_IDENTIFIER();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = self->_activatedPaymentPass;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = -[PKContactlessInterfaceTransactionContext initWithPaymentPass:activatedPaymentApplications:]([PKContactlessInterfaceTransactionContext alloc], "initWithPaymentPass:activatedPaymentApplications:", v19, self->_activatedPaymentApplications);
    v32 = (void *)v20;
    -[PKContactlessInterfaceTransactionContext setDate:](v21, "setDate:", v20);
    -[PKContactlessInterfaceTransactionContext setAppletIdentifier:](v21, "setAppletIdentifier:", v15);
    -[PKContactlessInterfaceTransactionContext setCredentialIdentifier:](v21, "setCredentialIdentifier:", v18);
    -[PKContactlessInterfaceSession _paymentApplicationForEventAppletIdentifier:inContext:withSession:](self, "_paymentApplicationForEventAppletIdentifier:inContext:withSession:", v15, v21, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactlessInterfaceTransactionContext setPaymentApplication:](v21, "setPaymentApplication:", v22);

    -[PKContactlessInterfaceTransactionContext paymentApplication](v21, "paymentApplication");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[PKObject uniqueID](v19, "uniqueID");
      v30 = v19;
      v24 = v6;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = +[PKExpressTransactionState createForStandaloneTransaction:applicationIdentifier:keyIdentifier:passUniqueIdentifier:](PKExpressTransactionState, "createForStandaloneTransaction:applicationIdentifier:keyIdentifier:passUniqueIdentifier:", v31, v15, v18, v25);

      v6 = v24;
      v19 = v30;
    }
    else
    {
      v26 = +[PKExpressTransactionState createForStandaloneTransaction:applicationIdentifier:keyIdentifier:passUniqueIdentifier:](PKExpressTransactionState, "createForStandaloneTransaction:applicationIdentifier:keyIdentifier:passUniqueIdentifier:", v31, v15, v18, 0);
    }
    v27 = objc_msgSend(v26, "status");
    -[PKContactlessInterfaceTransactionContext setExpressState:](v21, "setExpressState:", v26);
    -[PKContactlessInterfaceTransactionContext setSuccess:](v21, "setSuccess:", v27 == 1);
    -[PKContactlessInterfaceTransactionContext setIncompatible:](v21, "setIncompatible:", v27 == 3);
    -[PKContactlessInterfaceSession _signalWalletTransactionForContext:](self, "_signalWalletTransactionForContext:", v21);
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PKContactlessInterfaceSession_session_event___block_invoke;
    block[3] = &unk_1E2ABE0D0;
    block[4] = self;
    v34 = v21;
    v29 = v21;
    dispatch_async(callbackQueue, block);

  }
LABEL_13:

}

void __47__PKContactlessInterfaceSession_session_event___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contactlessInterfaceSession:didFinishTransactionWithContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)session:(id)a3 didStartTransaction:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  kdebug_trace();
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Started Transaction Event: %@", buf, 0xCu);
  }

  AnalyticsSendEvent();
  PKTimeProfileBegin((uint64_t)v6, CFSTR("contactless_transaction"));

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PKContactlessInterfaceSession_session_didStartTransaction___block_invoke;
  v8[3] = &unk_1E2AC0EA0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v8);

}

void __61__PKContactlessInterfaceSession_session_didStartTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = mach_absolute_time();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = *(NSObject **)(v4 + 144);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PKContactlessInterfaceSession_session_didStartTransaction___block_invoke_2;
    block[3] = &unk_1E2ABE0F8;
    block[4] = v4;
    v8 = v5;
    v9 = v3;
    dispatch_async(v6, block);

  }
}

void __61__PKContactlessInterfaceSession_session_didStartTransaction___block_invoke_2(id *a1)
{
  PKContactlessInterfaceTransactionContext *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1[4], "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = -[PKContactlessInterfaceTransactionContext initWithPaymentPass:activatedPaymentApplications:]([PKContactlessInterfaceTransactionContext alloc], "initWithPaymentPass:activatedPaymentApplications:", *((_QWORD *)a1[4] + 5), *((_QWORD *)a1[4] + 4));
    objc_msgSend(a1[5], "applet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = a1[4];
    objc_msgSend(a1[6], "nfSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_paymentApplicationForEventAppletIdentifier:inContext:withSession:", v4, v2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactlessInterfaceTransactionContext setPaymentApplication:](v2, "setPaymentApplication:", v7);

    objc_msgSend(v8, "contactlessInterfaceSessionDidStartTransaction:withContext:", a1[4], v2);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "contactlessInterfaceSessionDidStartTransaction:", a1[4]);
  }

}

- (void)session:(id)a3 didEndTransaction:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  const __CFString *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  kdebug_trace();
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Finished Transaction Event: %@", buf, 0xCu);
  }

  v7 = PKTimeProfileEnd(v6, CFSTR("contactless_transaction"), CFSTR("Transaction Event"));
  v8 = mach_absolute_time();
  v9 = PKSecondsFromMachTimeInterval(v8 - self->_transactionStartTime);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__PKContactlessInterfaceSession_session_didEndTransaction___block_invoke;
  v15[3] = &unk_1E2AC0D38;
  v15[4] = self;
  v16 = v5;
  v17 = v10;
  v13 = v10;
  v14 = v5;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v15);

}

void __59__PKContactlessInterfaceSession_session_didEndTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  PKContactlessInterfaceTransactionContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  PKContactlessInterfaceTransactionContext *v18;
  _QWORD block[5];
  PKContactlessInterfaceTransactionContext *v20;
  id v21;
  id v22;
  id v23;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 80);
  if (v5)
  {
    PKFieldPropertiesResolveSecondaryLookup(v5, *(void **)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_endLookupAndNotify");
  }
  else
  {
    v6 = *(id *)(v4 + 40);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
    v7 = -[PKContactlessInterfaceTransactionContext initWithPaymentPass:activatedPaymentApplications:]([PKContactlessInterfaceTransactionContext alloc], "initWithPaymentPass:activatedPaymentApplications:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    -[PKContactlessInterfaceTransactionContext setDate:](v7, "setDate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "applet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v3, "nfSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_paymentApplicationForEventAppletIdentifier:inContext:withSession:", v9, v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactlessInterfaceTransactionContext setPaymentApplication:](v7, "setPaymentApplication:", v12);

    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v15 = *(NSObject **)(v13 + 144);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PKContactlessInterfaceSession_session_didEndTransaction___block_invoke_2;
    block[3] = &unk_1E2AC0F68;
    block[4] = v13;
    v20 = v7;
    v21 = v14;
    v22 = v6;
    v23 = v9;
    v16 = v9;
    v17 = v6;
    v18 = v7;
    dispatch_async(v15, block);

  }
}

void __59__PKContactlessInterfaceSession_session_didEndTransaction___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  unint64_t v5;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "paymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 64);
      v19 = 138412290;
      v20 = v9;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Received an Unexpected Applet Identifier: %@", (uint8_t *)&v19, 0xCu);
    }

    AnalyticsSendEvent();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "activatedPaymentApplications");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "valueAddedServicePasses");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "contactlessInterfaceSessionDidFail:forPaymentApplications:paymentPass:valueAddedServicePasses:", v10, v11, v12, v13);

    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_22;
      v15 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "activatedPaymentApplications");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "valueAddedServicePasses");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "contactlessInterfaceSessionDidFail:forPaymentApplication:paymentPass:valueAddedServicePasses:", v15, v16, v17, v18);

    }
    goto LABEL_22;
  }
  v4 = objc_msgSend(*(id *)(a1 + 48), "didError");
  v5 = objc_msgSend(v3, "paymentType") - 1001;
  if (v5 <= 3 && v5 != 1)
  {
    if ((v4 & 1) != 0)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v3;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Reported Failed Access Event (Payment Application: %@)", (uint8_t *)&v19, 0xCu);
      }

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v2, "contactlessInterfaceSessionDidFailTransaction:forPaymentApplication:paymentPass:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 56));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setSuccess:", 1);
      PKLogFacilityTypeGetObject(6uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v3;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Reported Successful Access Event (Payment Application: %@)", (uint8_t *)&v19, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_signalWalletTransactionForContext:", *(_QWORD *)(a1 + 40));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v2, "contactlessInterfaceSession:didFinishTransactionWithContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
  }
LABEL_22:

}

- (void)session:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v6;
  id v7;
  PKTransactionSessionWrapper *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v7);

  -[PKContactlessInterfaceSession _session:didEnterFieldWithNotification:](self, "_session:didEnterFieldWithNotification:", v8, v6);
}

- (void)sessionDidExitField:(id)a3
{
  id v4;
  PKTransactionSessionWrapper *v5;

  v4 = a3;
  v5 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v4);

  -[PKContactlessInterfaceSession _sessionDidExitField:](self, "_sessionDidExitField:", v5);
}

- (void)session:(id)a3 didSelectApplet:(id)a4
{
  id v6;
  id v7;
  PKTransactionSessionWrapper *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v7);

  -[PKContactlessInterfaceSession _session:didSelectApplet:](self, "_session:didSelectApplet:", v8, v6);
}

- (void)session:(id)a3 didExpireTransactionForApplet:(id)a4
{
  id v6;
  id v7;
  PKTransactionSessionWrapper *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v7);

  -[PKContactlessInterfaceSession _session:didExpireTransactionForApplet:](self, "_session:didExpireTransactionForApplet:", v8, v6);
}

- (void)sessionDidEndUnexpectedly:(id)a3
{
  id v4;
  PKTransactionSessionWrapper *v5;

  v4 = a3;
  v5 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v4);

  -[PKContactlessInterfaceSession _sessionDidEndUnexpectedly:](self, "_sessionDidEndUnexpectedly:", v5);
}

- (void)sessionDidFailDeferredAuthorization:(id)a3
{
  id v4;
  PKTransactionSessionWrapper *v5;

  v4 = a3;
  v5 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v4);

  -[PKContactlessInterfaceSession _session:didFailDeferredAuthorization:](self, "_session:didFailDeferredAuthorization:", v5, 1);
}

- (void)sessionDidReceiveActivityTimeout:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  PKTransactionSessionWrapper *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v7);

  -[PKContactlessInterfaceSession _sessionDidReceiveActivityTimeout:result:](self, "_sessionDidReceiveActivityTimeout:result:", v8, v6);
}

- (void)session:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  PKTransactionSessionWrapper *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = a3;
  v10 = -[PKTransactionSessionWrapper initWithNFSession:]([PKTransactionSessionWrapper alloc], "initWithNFSession:", v9);

  -[PKContactlessInterfaceSession _session:didExpressModeStateChange:withObject:](self, "_session:didExpressModeStateChange:withObject:", v10, v5, v8);
}

- (void)stsSession:(id)a3 didReceiveFieldNotification:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  kdebug_trace();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PKContactlessInterfaceSession_stsSession_didReceiveFieldNotification___block_invoke;
  v7[3] = &unk_1E2AC0EA0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v7);

}

void __72__PKContactlessInterfaceSession_stsSession_didReceiveFieldNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  _BOOL4 CanLookupSecondaryProperties;
  id *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104));
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 40);
    v13 = 138412290;
    v14 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Did Enter Field: %@", (uint8_t *)&v13, 0xCu);
  }

  +[PKFieldProperties fieldPropertiesForSTSFieldNotification:](PKFieldProperties, "fieldPropertiesForSTSFieldNotification:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v7)
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session did identify field properties: %@", (uint8_t *)&v13, 0xCu);
    }

    v8 = objc_msgSend(v6, "terminalType");
    if (v8 >= 6)
    {
      __break(1u);
      return;
    }
    v9 = dword_190453418[v8];
  }
  else
  {
    if (v7)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session did not identify field properties", (uint8_t *)&v13, 2u);
    }

    v9 = PKWalletTransactionTypeForSTSTerminalType(objc_msgSend(*(id *)(a1 + 40), "terminalType"));
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 184) = v9;
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v10 + 128) != 2)
  {
    objc_storeStrong((id *)(v10 + 80), v6);
    CanLookupSecondaryProperties = PKFieldPropertiesCanLookupSecondaryProperties(*(void **)(*(_QWORD *)(a1 + 32) + 80));
    v12 = *(id **)(a1 + 32);
    if (CanLookupSecondaryProperties)
    {
      objc_msgSend(v12[10], "setSecondaryPropertiesRequired:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_startLookup");
    }
    else
    {
      objc_msgSend(v12, "_endLookupAndNotify");
    }
  }

}

- (void)stsSession:(id)a3 didStartTransaction:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  kdebug_trace();
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "credential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Started Transaction Event: %@, credential: %@", buf, 0x16u);

  }
  AnalyticsSendEvent();
  PKTimeProfileBegin((uint64_t)v6, CFSTR("contactless_transaction"));

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__PKContactlessInterfaceSession_stsSession_didStartTransaction___block_invoke;
  v9[3] = &unk_1E2AC0EA0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v9);

}

void __64__PKContactlessInterfaceSession_stsSession_didStartTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = mach_absolute_time();
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v4 = *(NSObject **)(v2 + 144);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__PKContactlessInterfaceSession_stsSession_didStartTransaction___block_invoke_2;
    v5[3] = &unk_1E2ABE0D0;
    v5[4] = v2;
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

void __64__PKContactlessInterfaceSession_stsSession_didStartTransaction___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  PKContactlessInterfaceTransactionContext *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    v4 = -[PKContactlessInterfaceTransactionContext initWithPaymentPass:activatedPaymentApplications:]([PKContactlessInterfaceTransactionContext alloc], "initWithPaymentPass:activatedPaymentApplications:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(*(id *)(a1 + 40), "credential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v3, "devicePaymentApplications", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (PKPaymentApplicationMatchesSTSEventCredential(v11, v5))
          {
            -[PKContactlessInterfaceTransactionContext setPaymentApplication:](v4, "setPaymentApplication:", v11);
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

    objc_msgSend(v2, "contactlessInterfaceSessionDidStartTransaction:withContext:", *(_QWORD *)(a1 + 32), v4);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "contactlessInterfaceSessionDidStartTransaction:", *(_QWORD *)(a1 + 32));
  }

}

- (void)stsSession:(id)a3 didEndTransaction:(id)a4
{
  PKPaymentPass *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  PKPaymentPass *v11;
  PKContactlessInterfaceTransactionContext *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  PKPaymentPass *v24;
  id *v25;
  PKPaymentPass *v26;
  PKContactlessInterfaceTransactionContext *v27;
  NSObject *callbackQueue;
  PKPaymentPass *v29;
  PKContactlessInterfaceTransactionContext *v30;
  void *v31;
  PKPaymentPass *v32;
  _QWORD block[5];
  PKContactlessInterfaceTransactionContext *v34;
  PKPaymentPass *v35;
  _QWORD v36[5];
  PKPaymentPass *v37;
  PKContactlessInterfaceTransactionContext *v38;
  PKPaymentPass *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  const __CFString *v44;
  void *v45;
  uint8_t v46[128];
  uint8_t buf[4];
  PKPaymentPass *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = (PKPaymentPass *)a4;
  kdebug_trace();
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Finished Transaction Event: %@", buf, 0xCu);
  }

  v7 = PKTimeProfileEnd(v6, CFSTR("contactless_transaction"), CFSTR("Transaction Event"));
  v8 = mach_absolute_time();
  v9 = PKSecondsFromMachTimeInterval(v8 - self->_transactionStartTime);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = self->_activatedPaymentPass;
  v12 = -[PKContactlessInterfaceTransactionContext initWithPaymentPass:activatedPaymentApplications:]([PKContactlessInterfaceTransactionContext alloc], "initWithPaymentPass:activatedPaymentApplications:", v11, self->_activatedPaymentApplications);
  v31 = (void *)v10;
  -[PKContactlessInterfaceTransactionContext setDate:](v12, "setDate:", v10);
  v32 = v5;
  -[PKPaymentPass credential](v5, "credential");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[PKSecureElementPass devicePaymentApplications](v11, "devicePaymentApplications");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (PKPaymentApplicationMatchesSTSEventCredential(v19, v13))
        {
          -[PKContactlessInterfaceTransactionContext setPaymentApplication:](v12, "setPaymentApplication:", v19);
          goto LABEL_13;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_13:

  -[PKContactlessInterfaceTransactionContext paymentApplication](v12, "paymentApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v44 = CFSTR("duration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __62__PKContactlessInterfaceSession_stsSession_didEndTransaction___block_invoke;
    v36[3] = &unk_1E2AC0EC8;
    v36[4] = self;
    v23 = (id *)&v37;
    v24 = v32;
    v25 = (id *)&v38;
    v37 = v32;
    v38 = v12;
    v39 = v11;
    v26 = v11;
    v27 = v12;
    -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v36);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v11;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session: STS event does not match active pass %@", buf, 0xCu);
    }

    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__PKContactlessInterfaceSession_stsSession_didEndTransaction___block_invoke_182;
    block[3] = &unk_1E2ABE0F8;
    v23 = (id *)&v34;
    block[4] = self;
    v34 = v12;
    v25 = (id *)&v35;
    v35 = v11;
    v29 = v11;
    v30 = v12;
    dispatch_async(callbackQueue, block);
    v24 = v32;
  }

}

void __62__PKContactlessInterfaceSession_stsSession_didEndTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 144);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __62__PKContactlessInterfaceSession_stsSession_didEndTransaction___block_invoke_2;
  v5[3] = &unk_1E2AC0F90;
  v5[1] = 3221225472;
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  dispatch_async(v4, v5);

}

void __62__PKContactlessInterfaceSession_stsSession_didEndTransaction___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  PKPaymentTransaction *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "status"))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "paymentApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Reported Failed Transaction Event (Payment Application: %@)", (uint8_t *)&v13, 0xCu);

    }
    if (objc_msgSend(*(id *)(a1 + 40), "status") == 4)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v2, "contactlessInterfaceSessionDidReceiveUntrustedTerminal:", *(_QWORD *)(a1 + 32));
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "paymentApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "contactlessInterfaceSessionDidFailTransaction:forPaymentApplication:paymentPass:", v11, v12, *(_QWORD *)(a1 + 56));

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
    objc_msgSend(*(id *)(a1 + 48), "setSuccess:", 1);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 176))
    {
      v5 = objc_alloc_init(PKPaymentTransaction);
      -[PKPaymentTransaction setTransactionSource:](v5, "setTransactionSource:", 1);
      -[PKPaymentTransaction setTransactionType:](v5, "setTransactionType:", 15);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setTransactionDate:](v5, "setTransactionDate:", v6);

      -[PKPaymentTransaction setTransactionStatus:](v5, "setTransactionStatus:", 1);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setIdentifier:](v5, "setIdentifier:", v8);

      -[PKPaymentTransaction setOriginatedByDevice:](v5, "setOriginatedByDevice:", 1);
      -[PKPaymentTransaction setReleasedData:](v5, "setReleasedData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
      -[PKPaymentTransaction setHasNotificationServiceData:](v5, "setHasNotificationServiceData:", 1);
      objc_msgSend(*(id *)(a1 + 48), "setTransaction:", v5);

    }
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "paymentApplication");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Reported Successful Transaction Event (Payment Application: %@)", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_signalWalletTransactionForContext:", *(_QWORD *)(a1 + 48));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "contactlessInterfaceSession:didFinishTransactionWithContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

}

void __62__PKContactlessInterfaceSession_stsSession_didEndTransaction___block_invoke_182(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "activatedPaymentApplications");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactlessInterfaceSessionDidFail:forPaymentApplications:paymentPass:valueAddedServicePasses:", v2, v3, *(_QWORD *)(a1 + 48), 0);
LABEL_5:

    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "activatedPaymentApplications");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactlessInterfaceSessionDidFail:forPaymentApplication:paymentPass:valueAddedServicePasses:", v4, v5, *(_QWORD *)(a1 + 48), 0);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)stsSessionDidEndUnexpectedly:(id)a3 errorCode:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = a4;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session did end unexpectedly, error: %lu", (uint8_t *)&v10, 0xCu);
  }

  -[PKContactlessInterfaceSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = 1;
    switch(a4)
    {
      case 3uLL:
        break;
      case 4uLL:
        v9 = 3;
        goto LABEL_8;
      case 5uLL:
        goto LABEL_8;
      case 6uLL:
        v9 = 2;
        goto LABEL_8;
      default:
        v9 = 0;
LABEL_8:
        objc_msgSend(v8, "contactlessInterfaceSessionDidTerminate:withErrorCode:", self, v9);
        break;
    }
  }

}

- (void)stsSession:(id)a3 didReceiveActivityTimeout:(id)a4
{
  id v6;
  id v7;
  PKTransactionSessionWrapper *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKTransactionSessionWrapper initWithSTSSession:]([PKTransactionSessionWrapper alloc], "initWithSTSSession:", v7);

  -[PKContactlessInterfaceSession _sessionDidReceiveActivityTimeout:result:](self, "_sessionDidReceiveActivityTimeout:result:", v8, v6);
}

- (void)stsSession:(id)a3 didChangeExpressModeWithInfo:(id)a4
{
  id v6;
  uint64_t v7;
  PKTransactionSessionWrapper *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = objc_msgSend(a4, "state");
  switch((int)v7)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      goto LABEL_2;
    case 9:
    case 10:
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session dropping lock / unlock event.", v10, 2u);
      }

      break;
    default:
      v7 = 0;
LABEL_2:
      v8 = -[PKTransactionSessionWrapper initWithSTSSession:]([PKTransactionSessionWrapper alloc], "initWithSTSSession:", v6);
      -[PKContactlessInterfaceSession _session:didExpressModeStateChange:withObject:](self, "_session:didExpressModeStateChange:withObject:", v8, v7, 0);

      break;
  }

}

- (void)stsSession:(id)a3 didExpireTransaction:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  PKTransactionSessionWrapper *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("N");
    if (v4)
      v8 = CFSTR("Y");
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session didExpireTransaction: %@", (uint8_t *)&v10, 0xCu);
  }

  if (v4)
  {
    v9 = -[PKTransactionSessionWrapper initWithSTSSession:]([PKTransactionSessionWrapper alloc], "initWithSTSSession:", v6);
    -[PKContactlessInterfaceSession _session:didExpireTransactionForApplet:](self, "_session:didExpireTransactionForApplet:", v9, 0);

  }
}

- (void)stsSession:(id)a3 didReceive18013Requests:(id)a4 readerAuthInfo:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *k;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  id v30;
  id v31;
  void *v32;
  BOOL v33;
  int v34;
  id v35;
  id v36;
  id v37;
  id v38;
  PKContactlessInterfaceSession *v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSArray *obj;
  id obja;
  _QWORD v47[4];
  id v48;
  PKContactlessInterfaceSession *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v8 = a4;
  v38 = a5;
  kdebug_trace();
  PKLogFacilityTypeGetObject(6uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v72 = v8;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Received ISO18013 Requests %@", buf, 0xCu);
  }
  v42 = v8;

  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v39 = self;
  obj = self->_activatedPaymentApplications;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v64 != v13)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "subcredentials", v38);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v60;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v60 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "pk_safelyAddObject:", v20);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
          }
          while (v17);
        }

      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    }
    while (v12);
  }

  v44 = (void *)objc_msgSend(v10, "copy");
  v57 = 0u;
  v58 = 0u;
  v56 = 0u;
  v55 = 0u;
  v41 = v42;
  obja = (id)objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
  v21 = 0;
  if (obja)
  {
    v43 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != obja; k = (char *)k + 1)
      {
        if (*(_QWORD *)v56 != v43)
          objc_enumerationMutation(v41);
        v23 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)k);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v24 = v44;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v52;
          while (2)
          {
            for (m = 0; m != v26; ++m)
            {
              if (*(_QWORD *)v52 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * m);
              objc_msgSend(v23, "credentialIdentifier", v38);
              v30 = (id)objc_claimAutoreleasedReturnValue();
              v31 = v29;
              v32 = v31;
              if (v30 == v31)
              {

LABEL_39:
                v35 = v23;

                v21 = v35;
                goto LABEL_40;
              }
              if (v31)
                v33 = v30 == 0;
              else
                v33 = 1;
              if (v33)
              {

              }
              else
              {
                v34 = objc_msgSend(v30, "isEqualToString:", v31);

                if (v34)
                  goto LABEL_39;
              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
            if (v26)
              continue;
            break;
          }
        }
LABEL_40:

      }
      obja = (id)objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    }
    while (obja);
  }

  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __83__PKContactlessInterfaceSession_stsSession_didReceive18013Requests_readerAuthInfo___block_invoke;
  v47[3] = &unk_1E2AC0D38;
  v48 = v21;
  v49 = v39;
  v50 = v38;
  v36 = v38;
  v37 = v21;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](v39, "performBlockAsyncOnInternalSession:", v47);

}

void __83__PKContactlessInterfaceSession_stsSession_didReceive18013Requests_readerAuthInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(NSObject **)(v5 + 144);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__PKContactlessInterfaceSession_stsSession_didReceive18013Requests_readerAuthInfo___block_invoke_190;
    block[3] = &unk_1E2ABE0F8;
    block[4] = v5;
    v11 = v4;
    v12 = *(id *)(a1 + 48);
    dispatch_async(v6, block);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Stopping Transaction", buf, 2u);
    }

    objc_msgSend(v3, "stsSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopTransaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Could Not Stop Transaction with Error %@", buf, 0xCu);
      }

    }
  }

}

void __83__PKContactlessInterfaceSession_stsSession_didReceive18013Requests_readerAuthInfo___block_invoke_190(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contactlessInterfaceSession:didReceive18013Request:readerAuthInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)stsSessionRequestHandoffConfirmation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session: Requested handoff confirmation", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PKContactlessInterfaceSession_stsSessionRequestHandoffConfirmation___block_invoke;
  v7[3] = &unk_1E2AC0EA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v7);

}

void __70__PKContactlessInterfaceSession_stsSessionRequestHandoffConfirmation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 163))
  {
    *(_BYTE *)(v4 + 164) = 1;
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session waiting to confirm handoff", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "startHandoff");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v5;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session: failed to start handoff with error %@", buf, 0xCu);
      }

      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(NSObject **)(v7 + 144);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__PKContactlessInterfaceSession_stsSessionRequestHandoffConfirmation___block_invoke_193;
      block[3] = &unk_1E2ABE120;
      block[4] = v7;
      dispatch_async(v8, block);
    }
  }

}

void __70__PKContactlessInterfaceSession_stsSessionRequestHandoffConfirmation___block_invoke_193(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
    objc_msgSend(v4, "contactlessInterfaceSessionDidFailTransaction:forPaymentApplication:paymentPass:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  }
}

- (void)handleSessionSuspended:(id)a3 withToken:(id)a4
{
  id v5;
  NSObject *callbackQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  callbackQueue = self->_callbackQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PKContactlessInterfaceSession_handleSessionSuspended_withToken___block_invoke;
  v8[3] = &unk_1E2ABE0D0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(callbackQueue, v8);

}

void __66__PKContactlessInterfaceSession_handleSessionSuspended_withToken___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contactlessInterfaceSession:didSuspendWithToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)handleSessionResumed:(id)a3
{
  NSObject *callbackQueue;
  _QWORD block[5];

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PKContactlessInterfaceSession_handleSessionResumed___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __54__PKContactlessInterfaceSession_handleSessionResumed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contactlessInterfaceSessionDidResume:", *(_QWORD *)(a1 + 32));

}

- (void)_session:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  kdebug_trace();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PKContactlessInterfaceSession__session_didEnterFieldWithNotification___block_invoke;
  v7[3] = &unk_1E2AC0EA0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v7);

}

void __72__PKContactlessInterfaceSession__session_didEnterFieldWithNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  unint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 CanLookupSecondaryProperties;
  id *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104));
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 40);
    v14 = 138412290;
    v15 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Did Enter Field: %@", (uint8_t *)&v14, 0xCu);
  }

  +[PKFieldProperties fieldPropertiesForFieldNotification:](PKFieldProperties, "fieldPropertiesForFieldNotification:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v7)
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session did identify field properties: %@", (uint8_t *)&v14, 0xCu);
    }

    v8 = objc_msgSend(v6, "terminalType");
    if (v8 < 6)
    {
      v9 = &dword_190453418[v8];
      goto LABEL_12;
    }
LABEL_17:
    __break(1u);
  }
  if (v7)
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session did not identify field properties", (uint8_t *)&v14, 2u);
  }

  v10 = objc_msgSend(*(id *)(a1 + 40), "notificationType");
  if ((unint64_t)(v10 - 1) >= 3)
    goto LABEL_17;
  v9 = (_DWORD *)((char *)&unk_190453430 + 4 * v10 - 4);
LABEL_12:
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 184) = *v9;
  v11 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v11 + 128) != 2)
  {
    objc_storeStrong((id *)(v11 + 80), v6);
    CanLookupSecondaryProperties = PKFieldPropertiesCanLookupSecondaryProperties(*(void **)(*(_QWORD *)(a1 + 32) + 80));
    v13 = *(id **)(a1 + 32);
    if (CanLookupSecondaryProperties)
    {
      objc_msgSend(v13[10], "setSecondaryPropertiesRequired:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_startLookup");
    }
    else
    {
      objc_msgSend(v13, "_endLookupAndNotify");
    }
  }

}

- (void)_sessionDidExitField:(id)a3
{
  _QWORD v4[5];

  kdebug_trace();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PKContactlessInterfaceSession__sessionDidExitField___block_invoke;
  v4[3] = &unk_1E2AC0C58;
  v4[4] = self;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v4);
}

void __54__PKContactlessInterfaceSession__sessionDidExitField___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104);
  while (1)
  {
    v3 = __ldaxr(v2);
    if (v3 != 1)
      break;
    if (!__stlxr(0, v2))
    {
      v4 = 1;
      goto LABEL_6;
    }
  }
  v4 = 0;
  __clrex();
LABEL_6:
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = 0;

  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v8)
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v9 = "Contactless Interface Session Did Exit Field";
  }
  else
  {
    if (!v8)
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v9 = "Contactless Interface Session Did Exit Field (unbalanced)";
  }
  _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
LABEL_12:

  v10 = *(_QWORD **)(a1 + 32);
  if (v10[10])
    objc_msgSend(v10, "_endLookup");
  if (v4)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(NSObject **)(v11 + 144);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__PKContactlessInterfaceSession__sessionDidExitField___block_invoke_198;
    block[3] = &unk_1E2ABE120;
    block[4] = v11;
    dispatch_async(v12, block);
  }
}

void __54__PKContactlessInterfaceSession__sessionDidExitField___block_invoke_198(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contactlessInterfaceSessionDidExitField:", *(_QWORD *)(a1 + 32));

}

- (void)_session:(id)a3 didSelectApplet:(id)a4
{
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[16];

  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("325041592E5359532E4444463031"));

  if (v6)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Did Select Payment (PPSE)", buf, 2u);
    }

    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PKContactlessInterfaceSession__session_didSelectApplet___block_invoke;
    block[3] = &unk_1E2ABE120;
    block[4] = self;
    dispatch_async(callbackQueue, block);
  }
}

void __58__PKContactlessInterfaceSession__session_didSelectApplet___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contactlessInterfaceSessionDidSelectPayment:", *(_QWORD *)(a1 + 32));

}

- (void)_session:(id)a3 didExpireTransactionForApplet:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__PKContactlessInterfaceSession__session_didExpireTransactionForApplet___block_invoke;
  v4[3] = &unk_1E2AC0C58;
  v4[4] = self;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v4, a4);
}

void __72__PKContactlessInterfaceSession__session_didExpireTransactionForApplet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  unsigned __int8 v8;
  uint64_t v9;
  id v10;
  unsigned __int8 *v11;
  void *v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Timed Out (Payment Applications: %@)", buf, 0xCu);
  }

  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v8 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 161));
  if ((v8 & 1) != 0)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v9 + 168))
    {
      v10 = 0;
    }
    else
    {
      v11 = (unsigned __int8 *)(v9 + 161);
      objc_msgSend(v3, "nfSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v13 = objc_msgSend(v12, "enablePlasticCardMode:error:", 0, &v21);
      v10 = v21;
      atomic_store(v13 ^ 1, v11);

      if (v10)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v10;
          _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to disable Persistent Card Emulation. Error: %@", buf, 0xCu);
        }

      }
    }
    if (v6 && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
      objc_msgSend(*(id *)(a1 + 32), "_endPersistentCardEmulationForPaymentPass:paymentApplications:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

  }
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(NSObject **)(v14 + 144);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__PKContactlessInterfaceSession__session_didExpireTransactionForApplet___block_invoke_203;
  v18[3] = &unk_1E2ABE0F8;
  v18[4] = v14;
  v19 = v6;
  v20 = v7;
  v16 = v7;
  v17 = v6;
  dispatch_async(v15, v18);

}

void __72__PKContactlessInterfaceSession__session_didExpireTransactionForApplet___block_invoke_203(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "contactlessInterfaceSessionDidTimeout:forPaymentApplications:paymentPass:valueAddedServicePasses:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v2 + 32), "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactlessInterfaceSessionDidTimeout:forPaymentApplication:paymentPass:valueAddedServicePasses:", v2, v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)_sessionDidEndUnexpectedly:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__PKContactlessInterfaceSession__sessionDidEndUnexpectedly___block_invoke;
  v3[3] = &unk_1E2AC0C58;
  v3[4] = self;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v3);
}

void __60__PKContactlessInterfaceSession__sessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unsigned __int8 v3;
  char v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Ended Unexpectedly", buf, 2u);
  }

  v3 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 161));
  v4 = v3 & 1;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 144);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__PKContactlessInterfaceSession__sessionDidEndUnexpectedly___block_invoke_208;
  v11[3] = &unk_1E2AC0FB8;
  v14 = v4;
  v11[4] = v7;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, v11);

}

void __60__PKContactlessInterfaceSession__sessionDidEndUnexpectedly___block_invoke_208(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  PKContactlessInterfaceTransactionContext *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PKContactlessInterfaceTransactionContext *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v3 + 162))
    {
      if (*(_QWORD *)(a1 + 40) && objc_msgSend(*(id *)(v3 + 32), "count"))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v18 = v2;
          v4 = (PKContactlessInterfaceTransactionContext *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v5 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v6)
          {
            v7 = v6;
            v8 = *(_QWORD *)v20;
            do
            {
              v9 = 0;
              do
              {
                if (*(_QWORD *)v20 != v8)
                  objc_enumerationMutation(v5);
                v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9);
                v11 = -[PKContactlessInterfaceTransactionContext initWithPaymentPass:activatedPaymentApplications:]([PKContactlessInterfaceTransactionContext alloc], "initWithPaymentPass:activatedPaymentApplications:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
                -[PKContactlessInterfaceTransactionContext setSuccess:](v11, "setSuccess:", 1);
                -[PKContactlessInterfaceTransactionContext setPaymentApplication:](v11, "setPaymentApplication:", v10);
                -[PKContactlessInterfaceTransactionContext addObject:](v4, "addObject:", v11);

                ++v9;
              }
              while (v7 != v9);
              v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            }
            while (v7);
          }

          v12 = *(_QWORD *)(a1 + 32);
          v13 = (void *)-[PKContactlessInterfaceTransactionContext copy](v4, "copy");
          v2 = v18;
          objc_msgSend(v18, "contactlessInterfaceSession:didEndPersistentCardEmulationWithContexts:", v12, v13);

        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_17;
          v4 = -[PKContactlessInterfaceTransactionContext initWithPaymentPass:activatedPaymentApplications:]([PKContactlessInterfaceTransactionContext alloc], "initWithPaymentPass:activatedPaymentApplications:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
          -[PKContactlessInterfaceTransactionContext setSuccess:](v4, "setSuccess:", 1);
          -[PKContactlessInterfaceTransactionContext activatedPaymentApplications](v4, "activatedPaymentApplications");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKContactlessInterfaceTransactionContext setPaymentApplication:](v4, "setPaymentApplication:", v15);

          objc_msgSend(v2, "contactlessInterfaceSession:didEndPersistentCardEmulationWithContext:", *(_QWORD *)(a1 + 32), v4);
        }

      }
    }
  }
LABEL_17:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "contactlessInterfaceSessionDidTerminate:", *(_QWORD *)(a1 + 32));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "contactlessInterfaceSessionDidFail:forPaymentApplications:paymentPass:valueAddedServicePasses:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v16 + 32), "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "contactlessInterfaceSessionDidFail:forPaymentApplication:paymentPass:valueAddedServicePasses:", v16, v17, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)_session:(id)a3 didFailDeferredAuthorization:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR(" Not");
    if (v4)
      v8 = &stru_1E2ADF4C0;
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Did%@ Fail Authorization", buf, 0xCu);
  }

  if (v4)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PKContactlessInterfaceSession__session_didFailDeferredAuthorization___block_invoke;
    block[3] = &unk_1E2ABE120;
    block[4] = self;
    dispatch_async(callbackQueue, block);
  }

}

void __71__PKContactlessInterfaceSession__session_didFailDeferredAuthorization___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contactlessInterfaceSessionDidFailDeferredAuthorization:", *(_QWORD *)(a1 + 32));

}

- (void)_sessionDidReceiveActivityTimeout:(id)a3 result:(id)a4
{
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Received Transaction Activity Timeout.", buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__PKContactlessInterfaceSession__sessionDidReceiveActivityTimeout_result___block_invoke;
  v6[3] = &unk_1E2AC0C58;
  v6[4] = self;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v6);
}

void __74__PKContactlessInterfaceSession__sessionDidReceiveActivityTimeout_result___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 80))
  {
    v2 = *(NSObject **)(v1 + 144);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PKContactlessInterfaceSession__sessionDidReceiveActivityTimeout_result___block_invoke_2;
    block[3] = &unk_1E2ABE120;
    block[4] = v1;
    dispatch_async(v2, block);
  }
}

void __74__PKContactlessInterfaceSession__sessionDidReceiveActivityTimeout_result___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contactlessInterfaceSessionDidReceiveActivityTimeout:", *(_QWORD *)(a1 + 32));

}

- (void)_session:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  unsigned int v14;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__PKContactlessInterfaceSession__session_didExpressModeStateChange_withObject___block_invoke;
  v11[3] = &unk_1E2AC1008;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v13 = v7;
  v9 = v7;
  v10 = v8;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v11);

}

void __79__PKContactlessInterfaceSession__session_didExpressModeStateChange_withObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  int v36;
  char v37;
  BOOL v38;
  char v39;
  char v40;
  uint8_t buf[4];
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 56);
    *(_DWORD *)buf = 67109120;
    v42 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Received Express Mode State: %u", buf, 8u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 112);
  v8 = *(id *)(v6 + 40);
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  v10 = v9;
  v40 = 0;
  switch(*(_DWORD *)(a1 + 56))
  {
    case 1:
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
        goto LABEL_22;
      v11 = +[PKExpressTransactionState createForExpressType:](PKExpressTransactionState, "createForExpressType:", 0);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 112);
      *(_QWORD *)(v12 + 112) = v11;

      v14 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
      v15 = 0;
      v16 = 1;
      v10 = v14;
      goto LABEL_24;
    case 2:
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
        goto LABEL_22;
      v17 = 1;
      goto LABEL_21;
    case 3:
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
        goto LABEL_22;
      v17 = 2;
      goto LABEL_21;
    case 4:
      v18 = *(_QWORD **)(a1 + 32);
      if (!v18[14])
        goto LABEL_22;
      v15 = (void *)objc_msgSend(v18, "_createExpressTransactionForState:pass:paymentApplications:date:shouldGenerateTransaction:withSession:", v10, v8, v18[4], *(_QWORD *)(a1 + 40), &v40, *(_QWORD *)(a1 + 48));
      objc_msgSend(v10, "resolve");
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(v19 + 112);
      *(_QWORD *)(v19 + 112) = 0;

      v16 = 1;
      goto LABEL_24;
    case 5:
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "API CONTRACT VIOLATION: NFLoyaltyAndPaymentSession returned NFExpressModeStateServiceRequested.", buf, 2u);
      }

      goto LABEL_22;
    case 6:
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
        goto LABEL_22;
      v17 = 4;
      goto LABEL_21;
    case 7:
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
        goto LABEL_22;
      v17 = 512;
      goto LABEL_21;
    case 8:
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
        goto LABEL_22;
      v17 = 256;
LABEL_21:
      v16 = objc_msgSend(v9, "receiveEvents:", v17);
      break;
    case 9:
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
      if (v26)
      {
        v16 = objc_msgSend(v9, "receiveEvents:", 1024);
      }
      else
      {
        v27 = +[PKExpressTransactionState createForExpressType:](PKExpressTransactionState, "createForExpressType:", 0);
        v28 = *(_QWORD *)(a1 + 32);
        v29 = *(void **)(v28 + 112);
        *(_QWORD *)(v28 + 112) = v27;

        v30 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
        v16 = objc_msgSend(v30, "receiveEvents:", 1024);
        objc_msgSend(v30, "resolve");
        v31 = *(_QWORD *)(a1 + 32);
        v32 = *(void **)(v31 + 112);
        *(_QWORD *)(v31 + 112) = 0;

        v10 = v30;
      }
      v15 = 0;
      if (!v26)
        v16 = 1;
      goto LABEL_24;
    default:
LABEL_22:
      v16 = 0;
      break;
  }
  v15 = 0;
LABEL_24:
  if (objc_msgSend(v10, "isProcessing"))
  {
    v21 = objc_msgSend(v10, "copy");

    v10 = (void *)v21;
  }
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(NSObject **)(v22 + 144);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __79__PKContactlessInterfaceSession__session_didExpressModeStateChange_withObject___block_invoke_219;
  v33[3] = &unk_1E2AC0FE0;
  v37 = v40;
  v33[4] = v22;
  v34 = v15;
  v38 = v7 != 0;
  v39 = v16;
  v35 = v10;
  v36 = *(_DWORD *)(a1 + 56);
  v24 = v10;
  v25 = v15;
  dispatch_async(v23, v33);

}

void __79__PKContactlessInterfaceSession__session_didExpressModeStateChange_withObject___block_invoke_219(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 60))
    goto LABEL_22;
  v3 = *(_QWORD *)(a1 + 40);
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 && v2)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Created Express Transaction (Payment Applications: %@)", (uint8_t *)&v10, 0xCu);
    }

    AnalyticsSendEvent();
    objc_msgSend(*(id *)(a1 + 32), "_signalWalletTransactionForContext:", *(_QWORD *)(a1 + 40));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "contactlessInterfaceSession:didFinishTransactionWithContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    goto LABEL_22;
  }
  if (v5)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Failed to handle Express Mode Exit. Dropping!!", (uint8_t *)&v10, 2u);
  }

  if (*(_BYTE *)(a1 + 61))
  {
    if (*(_QWORD *)(a1 + 40))
      goto LABEL_18;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      v7 = "\tAID mismatch (this should happen extremely rarely).";
LABEL_16:
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    v7 = "\tUnmatched Express Mode exited...";
    goto LABEL_16;
  }

LABEL_18:
  if (!v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "\tLost delegate before delivery of Express Mode Exit state.", (uint8_t *)&v10, 2u);
    }

  }
LABEL_22:
  if (*(_BYTE *)(a1 + 62))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v2, "contactlessInterfaceSession:didReceiveExpressTransactionState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
    else
    {
      v8 = *(_DWORD *)(a1 + 56) - 1;
      if (v8 > 7)
        v9 = 0;
      else
        v9 = qword_190453440[v8];
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v2, "contactlessInterfaceSession:didReceiveExpressState:expressTransactionEvent:", *(_QWORD *)(a1 + 32), v9, objc_msgSend(*(id *)(a1 + 48), "receivedEvents"));
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v2, "contactlessInterfaceSession:didReceiveExpressState:", *(_QWORD *)(a1 + 32), v9);
      }
    }
  }

}

- (id)_createExpressTransactionForState:(id)a3 pass:(id)a4 paymentApplications:(id)a5 date:(id)a6 shouldGenerateTransaction:(BOOL *)a7 withSession:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  unint64_t sessionType;
  void *v23;
  id v24;
  int v25;
  NSObject *v26;
  PKContactlessInterfaceTransactionContext *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id *v36;
  id v37;
  id v38;
  int v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = objc_msgSend(v14, "status");
  if (v14)
    v20 = v19 == 1;
  else
    v20 = 0;
  v21 = v20;
  *a7 = v21;
  if (v20)
  {
    sessionType = self->_sessionType;
    if (sessionType >= 2)
    {
      v24 = 0;
      v39 = 0;
      v25 = sessionType == 2;
    }
    else
    {
      objc_msgSend(v18, "nfSession");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activeApplet");
      v24 = (id)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __135__PKContactlessInterfaceSession__createExpressTransactionForState_pass_paymentApplications_date_shouldGenerateTransaction_withSession___block_invoke;
        v40[3] = &unk_1E2AC1030;
        v36 = &v41;
        v24 = v24;
        v41 = v24;
        v25 = objc_msgSend(v16, "pk_containsObjectPassingTest:", v40);
        v39 = 1;
      }
      else
      {
        v39 = 0;
        v25 = 0;
      }
    }
    v28 = -[PKContactlessInterfaceTransactionContext initWithPaymentPass:activatedPaymentApplications:]([PKContactlessInterfaceTransactionContext alloc], "initWithPaymentPass:activatedPaymentApplications:", v15, self->_activatedPaymentApplications);
    if (v25)
    {
      v38 = v16;
      objc_msgSend(v18, "nfSession");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(v24, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKContactlessInterfaceSession _paymentApplicationForEventAppletIdentifier:inContext:withSession:](self, "_paymentApplicationForEventAppletIdentifier:inContext:withSession:", v30, v28, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[NSArray firstObject](self->_activatedPaymentApplications, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[PKContactlessInterfaceTransactionContext setSuccess:](v28, "setSuccess:", 1);
      -[PKContactlessInterfaceTransactionContext setIncompatible:](v28, "setIncompatible:", 0);
      v37 = v17;
      -[PKContactlessInterfaceTransactionContext setDate:](v28, "setDate:", v17);
      -[PKContactlessInterfaceTransactionContext setPaymentApplication:](v28, "setPaymentApplication:", v31);
      objc_msgSend(v31, "applicationIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uniqueID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "associateWithApplicationIdentifier:keyIdentifier:terminalReaderIdentifier:passUniqueIdentifier:", v32, 0, 0, v33);

      -[PKContactlessInterfaceTransactionContext setExpressState:](v28, "setExpressState:", v14);
      if (v29)
      {
        objc_msgSend((id)objc_opt_class(), "transitAppletStateFromPaymentSession:forPaymentApplication:", v29, v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
          -[PKContactlessInterfaceTransactionContext setTransitHistory:](v28, "setTransitHistory:", v34);

      }
      v17 = v37;
      v16 = v38;
    }
    if (v39)

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v43 = objc_msgSend(v14, "receivedEvents");
      _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session not generating transaction because missing prerequisite express activity. Activity: %lu", buf, 0xCu);
    }

    v28 = 0;
  }

  return v28;
}

uint64_t __135__PKContactlessInterfaceSession__createExpressTransactionForState_pass_paymentApplications_date_shouldGenerateTransaction_withSession___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
    v6 = objc_msgSend(v3, "isEqual:", v4);
  else
    v6 = v3 == (void *)v4;

  return v6;
}

- (void)_startLookup
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__PKContactlessInterfaceSession__startLookup__block_invoke;
  v2[3] = &unk_1E2AC0C58;
  v2[4] = self;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v2);
}

void __45__PKContactlessInterfaceSession__startLookup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char started;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  char v14;
  char v15;
  uint8_t buf[16];

  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Starting Field Properties Lookup", buf, 2u);
  }

  v15 = 0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 168);
  switch(v6)
  {
    case 0:
      v10 = *(void **)(v5 + 80);
      objc_msgSend(v3, "nfSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      started = PKFieldPropertiesStartSecondaryLookup(v10, v8, &v15);
LABEL_8:
      v11 = started;

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = v15;
      if ((v11 & 1) != 0)
        goto LABEL_16;
      goto LABEL_15;
    case 2:
      v12 = *(_QWORD *)(v5 + 80);
      objc_msgSend(v3, "nfSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v15 = 0;

      v14 = v15;
      v5 = *(_QWORD *)(a1 + 32);
      break;
    case 1:
      v7 = *(void **)(v5 + 80);
      objc_msgSend(v3, "nfSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      started = PKFieldPropertiesStartSecondaryLookup(v7, v8, &v15);
      goto LABEL_8;
    default:
      v14 = 0;
      break;
  }
  *(_BYTE *)(v5 + 88) = v14;
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "_endLookupAndNotify");
LABEL_16:

}

- (void)_endLookupAndNotify
{
  PKFieldProperties *fieldPropertiesToLookup;
  PKFieldProperties *v4;
  NSObject *v5;
  NSObject *callbackQueue;
  PKFieldProperties *v7;
  _QWORD v8[5];
  PKFieldProperties *v9;
  uint8_t buf[4];
  PKFieldProperties *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  fieldPropertiesToLookup = self->_fieldPropertiesToLookup;
  v4 = fieldPropertiesToLookup;
  -[PKContactlessInterfaceSession _endLookup](self, "_endLookup");
  objc_storeStrong((id *)&self->_fieldProperties, fieldPropertiesToLookup);
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Contactless Interface Did Enter Field With Properties: %@", buf, 0xCu);
  }

  callbackQueue = self->_callbackQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PKContactlessInterfaceSession__endLookupAndNotify__block_invoke;
  v8[3] = &unk_1E2ABE0D0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(callbackQueue, v8);

}

void __52__PKContactlessInterfaceSession__endLookupAndNotify__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contactlessInterfaceSessionDidEnterField:withProperties:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_endLookup
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__PKContactlessInterfaceSession__endLookup__block_invoke;
  v2[3] = &unk_1E2AC0C58;
  v2[4] = self;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v2);
}

void __43__PKContactlessInterfaceSession__endLookup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Ending Lookup & Stopping Card Emulation", buf, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  if (v6)
  {
    *(_QWORD *)(v5 + 80) = 0;

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    objc_msgSend(v3, "nfSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      v14 = 0;
      v10 = (id *)&v14;
    }
    else
    {
      v15 = 0;
      v10 = (id *)&v15;
    }
    objc_msgSend(v8, "stopCardEmulation:", v10, v14, v15);
    v11 = *v10;

    if (v11)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed to stop Card Emulation: %@", buf, 0xCu);
      }

    }
    v12 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v12 + 168))
    {
      objc_msgSend(v3, "nfSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHostCards:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));

      v12 = *(_QWORD *)(a1 + 32);
    }
    if (*(_BYTE *)(v12 + 88))
    {
      *(_BYTE *)(v12 + 88) = 0;
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
        objc_msgSend(*(id *)(a1 + 32), "_activatePaymentApplications:forPaymentPass:forceReactivation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 1);
    }

  }
}

- (NSArray)activatedValueAddedServicePasses
{
  return self->_activatedValueAddedServicePasses;
}

- (PKFieldProperties)fieldProperties
{
  return self->_fieldProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataToRelease, 0);
  objc_storeStrong((id *)&self->_transactionSignalQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expressTransactionState, 0);
  objc_storeStrong((id *)&self->_fieldPropertiesToLookup, 0);
  objc_storeStrong((id *)&self->_fieldProperties, 0);
  objc_storeStrong((id *)&self->_valueAddedServiceTransactions, 0);
  objc_storeStrong((id *)&self->_activatedHostCards, 0);
  objc_storeStrong((id *)&self->_activatedValueAddedServicePasses, 0);
  objc_storeStrong((id *)&self->_activatedPaymentPass, 0);
  objc_storeStrong((id *)&self->_activatedPaymentApplications, 0);
}

@end
