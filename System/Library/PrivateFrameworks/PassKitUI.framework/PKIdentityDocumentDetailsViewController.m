@implementation PKIdentityDocumentDetailsViewController

- (PKIdentityDocumentDetailsViewController)initWithPass:(id)a3 dataProvider:(id)a4 detailViewStyle:(int64_t)a5
{
  id v9;
  id v10;
  PKIdentityDocumentDetailsViewController *v11;
  PKIdentityDocumentDetailsViewController *v12;
  unint64_t v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKIdentityDocumentDetailsViewController;
  v11 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v16, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1), 8);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_pass, a3);
    v12->_detailViewStyle = a5;
    objc_storeStrong((id *)&v12->_dataProvider, a4);
    v12->_inBridge = v12->_detailViewStyle == 2;
    v13 = -[PKSecureElementPass identityType](v12->_pass, "identityType");
    if (v13 > 3)
    {
      v14 = 0;
    }
    else
    {
      PKLocalizedIdentityString(&off_1E3E68018[v13]->isa);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PKIdentityDocumentDetailsViewController setTitle:](v12, "setTitle:", v14);

  }
  return v12;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD *v33;
  id v34;
  _QWORD v35[9];
  id v36;
  _QWORD v37[6];
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD *v41;
  uint8_t *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD *v47;
  _QWORD *v48;
  id v49;
  id location;
  _QWORD v51[3];
  char v52;
  _QWORD v53[3];
  char v54;
  _QWORD v55[3];
  char v56;
  _QWORD v57[3];
  char v58;
  _QWORD v59[5];
  id v60;
  uint8_t buf[8];
  uint8_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    -[PKSecureElementPass devicePaymentApplications](self->_pass, "devicePaymentApplications");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v68;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v68 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v9, "paymentType") == 1002)
          {
            objc_msgSend(v9, "subcredentials");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "anyObject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "identifier");
            v6 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
        }
        v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

    if (objc_msgSend(v6, "length"))
    {
      *(_QWORD *)buf = 0;
      v62 = buf;
      v63 = 0x3032000000;
      v64 = __Block_byref_object_copy__10;
      v65 = __Block_byref_object_dispose__10;
      v66 = 0;
      v59[0] = 0;
      v59[1] = v59;
      v59[2] = 0x3032000000;
      v59[3] = __Block_byref_object_copy__10;
      v59[4] = __Block_byref_object_dispose__10;
      v60 = 0;
      v57[0] = 0;
      v57[1] = v57;
      v57[2] = 0x2020000000;
      v58 = 0;
      v55[0] = 0;
      v55[1] = v55;
      v55[2] = 0x2020000000;
      v56 = 0;
      v53[0] = 0;
      v53[1] = v53;
      v53[2] = 0x2020000000;
      v54 = 0;
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      v52 = 0;
      v12 = objc_alloc_init(MEMORY[0x1E0D66B90]);
      v13 = objc_alloc(MEMORY[0x1E0D168D0]);
      v71 = *MEMORY[0x1E0D6A1C0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithPartitions:", v14);

      objc_initWeak(&location, self);
      v16 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke;
      v44[3] = &unk_1E3E67E18;
      v17 = v15;
      v45 = v17;
      v18 = v6;
      v46 = v18;
      objc_copyWeak(&v49, &location);
      v47 = v57;
      v48 = v55;
      objc_msgSend(v12, "addOperation:", v44);
      v38[0] = v16;
      v38[1] = 3221225472;
      v38[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_67;
      v38[3] = &unk_1E3E67E18;
      objc_copyWeak(&v43, &location);
      v41 = v57;
      v19 = v17;
      v39 = v19;
      v20 = v18;
      v40 = v20;
      v42 = buf;
      objc_msgSend(v12, "addOperation:", v38);
      v37[0] = v16;
      v37[1] = 3221225472;
      v37[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_70;
      v37[3] = &unk_1E3E67E68;
      v37[4] = v57;
      v37[5] = v51;
      objc_msgSend(v12, "addOperation:", v37);
      v35[0] = v16;
      v35[1] = 3221225472;
      v35[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_74;
      v35[3] = &unk_1E3E67F30;
      objc_copyWeak(&v36, &location);
      v35[4] = v57;
      v35[5] = buf;
      v35[6] = v51;
      v35[7] = v59;
      v35[8] = v53;
      objc_msgSend(v12, "addOperation:", v35);
      v30[0] = v16;
      v30[1] = 3221225472;
      v30[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_95;
      v30[3] = &unk_1E3E66DD8;
      v21 = v19;
      v31 = v21;
      v32 = v20;
      v33 = v59;
      objc_copyWeak(&v34, &location);
      objc_msgSend(v12, "addOperation:", v30);
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v16;
      v26[1] = 3221225472;
      v26[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_5;
      v26[3] = &unk_1E3E67FD0;
      v28 = v55;
      v27 = v4;
      v29 = v53;
      v23 = (id)objc_msgSend(v12, "evaluateWithInput:completion:", v22, v26);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v36);

      objc_destroyWeak(&v43);
      objc_destroyWeak(&v49);

      objc_destroyWeak(&location);
      _Block_object_dispose(v51, 8);
      _Block_object_dispose(v53, 8);
      _Block_object_dispose(v55, 8);
      _Block_object_dispose(v57, 8);
      _Block_object_dispose(v59, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "No subcredential in a pass expecting at least one.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKIdentityDocumentDetailsErrorDomain"), 0, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v25);

    }
  }

}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2;
  v14[3] = &unk_1E3E67DC8;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  v17 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v10, "propertiesOfCredential:completion:", v11, v14);

  objc_destroyWeak(&v18);
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void (*v12)(void);
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Could not recover credential properties with error %@", (uint8_t *)&v13, 0xCu);
      }

    }
    objc_msgSend(v5, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v9, "payloadProtectionPolicy") == 1;

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(v5, "options");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "presentmentAuthPolicy") == 2)
        v11 = objc_msgSend(v5, "hasUsablePresentmentAuthPolicy") ^ 1;
      else
        v11 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11;

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v12();

}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_67(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v9 = *(void **)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_68;
      v13[3] = &unk_1E3E67DF0;
      v15 = v7;
      v11 = v6;
      v12 = *(_QWORD *)(a1 + 56);
      v14 = v11;
      v16 = v12;
      objc_msgSend(v9, "payloadAuthACLForCredential:completion:", v10, v13);

    }
    else
    {
      (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
    }
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }

}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_68(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void (*v9)(void);
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!v6 || v7)
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Could not recover the auth ACL with error %@", (uint8_t *)&v11, 0xCu);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_70(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D168C0]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_72;
    v12[3] = &unk_1E3E67E40;
    v10 = *(_QWORD *)(a1 + 40);
    v13 = v9;
    v16 = v10;
    v15 = v8;
    v14 = v6;
    v11 = v9;
    objc_msgSend(v11, "globalAuthACLWithCompletion:", v12);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_72(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Could not fetch global ACL with error %@", (uint8_t *)&v9, 0xCu);
    }

  }
  if (v5)
    v8 = objc_msgSend(v5, "aclType") == 2;
  else
    v8 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_74(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, id, _QWORD);
  id *v10;
  id WeakRetained;
  void *v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void (**v17)(id, id, _QWORD);
  id v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void (**v24)(_QWORD);
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  void (**v29)(id, id, _QWORD);
  id v30;
  uint64_t v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  __int128 v36;
  uint64_t v37;
  _QWORD *v38;
  __int128 *p_buf;
  id v40[2];
  _QWORD v41[3];
  char v42;
  uint64_t v43;
  __int128 buf;
  uint64_t v45;
  void *(*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v12 = WeakRetained;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    || (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) ? (v13 = WeakRetained == 0) : (v13 = 1), v13))
  {
    v9[2](v9, v8, 0);
  }
  else
  {
    v43 = 0;
    v14 = (void *)SecAccessControlCreateFromData();
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Using custom ACL for ID details", (uint8_t *)&buf, 2u);
      }

      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2020000000;
      v42 = 0;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__75;
      v47 = __Block_byref_object_dispose__76;
      v48 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_77;
      aBlock[3] = &unk_1E3E67EB8;
      aBlock[1] = 3221225472;
      objc_copyWeak(v40, (id *)(a1 + 72));
      v17 = v9;
      v35 = v17;
      v18 = v8;
      v34 = v18;
      v20 = *(_QWORD *)(a1 + 64);
      v19 = (_QWORD *)(a1 + 64);
      v36 = *((_OWORD *)v19 - 1);
      v37 = v20;
      v38 = v41;
      v40[1] = v14;
      p_buf = &buf;
      v21 = _Block_copy(aBlock);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_92;
      v27[3] = &unk_1E3E67F08;
      objc_copyWeak(&v32, v10);
      v29 = v17;
      v22 = v18;
      v23 = *v19;
      v28 = v22;
      v31 = v23;
      v24 = v21;
      v30 = v24;
      v25 = _Block_copy(v27);
      v26 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v25;

      v24[2](v24);
      objc_destroyWeak(&v32);

      objc_destroyWeak(v40);
      _Block_object_dispose(&buf, 8);

      _Block_object_dispose(v41, 8);
    }
    else
    {
      if (v16)
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = 0;
        _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Could not create access control ref from provided data with error %@", (uint8_t *)&buf, 0xCu);
      }

      v9[2](v9, v8, 1);
    }
  }

}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_77(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 88);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v5 = (void *)WeakRetained[147];
    WeakRetained[147] = v4;

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v20 = &unk_1E3FACEF8;
      PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_PASSCODE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18[0] = &unk_1E3FACF10;
      PKLocalizedIdentityString(CFSTR("IDENTITY_DETAILS_PROMPT_MESSAGE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = &unk_1E3FACF28;
      v19[0] = v6;
      PKLocalizedIdentityString(CFSTR("IDENTITY_DETAILS_PROMPT_TITLE"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = (void *)WeakRetained[147];
    v10 = *(_QWORD *)(a1 + 96);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_89;
    v12[3] = &unk_1E3E67E90;
    objc_copyWeak(&v17, v2);
    v14 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 32);
    v11 = *(_OWORD *)(a1 + 72);
    v15 = *(_OWORD *)(a1 + 56);
    v16 = v11;
    objc_msgSend(v9, "evaluateAccessControl:operation:options:reply:", v10, 4, v7, v12);

    objc_destroyWeak(&v17);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_89(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  BOOL v8;
  int v9;
  void (*v10)(void);
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  v7 = WeakRetained;
  if (!WeakRetained)
  {
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_30:
    v10();
    goto LABEL_31;
  }
  if (a2)
    v8 = v5 == 0;
  else
    v8 = 0;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(WeakRetained[147], "externalizedContext");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v11);
  if (v9)
    goto LABEL_13;
  if (!v5)
    goto LABEL_29;
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v5;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Failed to auth to view details with error %@", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(v5, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)*MEMORY[0x1E0CC1280];
  v11 = v13;
  v15 = v14;
  if (v11 == v15)
  {

  }
  else
  {
    v16 = v15;
    if (!v11 || !v15)
    {

LABEL_13:
LABEL_29:
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      goto LABEL_30;
    }
    v17 = objc_msgSend(v11, "isEqualToString:", v15);

    if (!v17)
      goto LABEL_29;
  }
  if (objc_msgSend(v5, "code") == -2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    goto LABEL_29;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) || objc_msgSend(v5, "code") != -8)
    goto LABEL_29;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) + 16))();
LABEL_31:

}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_92(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v4 = (void *)WeakRetained[147];
    WeakRetained[147] = v3;

    v13[0] = &unk_1E3FACEF8;
    PKLocalizedIdentityString(CFSTR("PRESENTMENT_FOOTER_PASSCODE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = &unk_1E3FACF40;
    v14[0] = v5;
    v14[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)WeakRetained[147];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_94;
    v8[3] = &unk_1E3E67EE0;
    v12 = *(_QWORD *)(a1 + 56);
    v10 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v7, "evaluatePolicy:options:reply:", 2, v6, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_94(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a2 && !a3)
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(a1[5] + 16))(a1[5], a1[4], 1);
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_95(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  PKISO_ViewableElements();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_3;
  v16[3] = &unk_1E3E67FA8;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  v14 = v9;
  v18 = v14;
  v15 = v8;
  v17 = v15;
  objc_msgSend(v10, "elementsOfCredential:elementIdentifiers:authData:completion:", v11, v12, v13, v16);

  objc_destroyWeak(&v19);
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  id v10;
  void (**v11)(void *, _QWORD);
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  id *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD aBlock[4];
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (v6 || !WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v6;
      _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "Could not get identity elements from credential with error %@", buf, 0xCu);
    }

    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_96;
    aBlock[3] = &unk_1E3E67F80;
    v10 = v5;
    v28 = v10;
    v11 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v12 = *MEMORY[0x1E0D6A350];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A350]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v31[0] = v12;
      v11[2](v11, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v15;
      v31[1] = *MEMORY[0x1E0D6A348];
      ((void (*)(void (**)(void *, _QWORD)))v11[2])(v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v9;
      v24[1] = 3221225472;
      v24[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_3_101;
      v24[3] = &unk_1E3E618A0;
      v18 = &v26;
      v26 = a1[5];
      v19 = &v25;
      v25 = a1[4];
      objc_msgSend(v8, "_formatDataElementsForISO23220:withCompletion:", v17, v24);
    }
    else
    {
      v29[0] = *MEMORY[0x1E0D6A2C8];
      ((void (*)(void (**)(void *, _QWORD)))v11[2])(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v15;
      v29[1] = *MEMORY[0x1E0D6A2C0];
      ((void (*)(void (**)(void *, _QWORD)))v11[2])(v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_4;
      v21[3] = &unk_1E3E618A0;
      v18 = &v23;
      v23 = a1[5];
      v19 = &v22;
      v22 = a1[4];
      objc_msgSend(v8, "_formatDataElementsForISO18013:withCompletion:", v17, v21);
    }

  }
}

id __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_96(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_98;
  v10[3] = &unk_1E3E67F58;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_98(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "elementIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

uint64_t __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_3_101(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_5(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = v6;
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v8 = a1[4];
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = 1;
  }
  else if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v8 = a1[4];
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = 2;
  }
  else
  {
    v11 = objc_msgSend(v6, "isCanceled");
    v8 = a1[4];
    if (!v11)
    {
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
      goto LABEL_8;
    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = 0;
  }
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PKIdentityDocumentDetailsErrorDomain"), v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);

LABEL_8:
}

- (void)_formatDataElementsForISO18013:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PKIdentityDocumentDataElement *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  PKIdentityDocumentDataElement *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  PKIdentityDocumentDataElement *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  PKIdentityDocumentDataElement *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  NSObject *v68;
  const char *v69;
  void *v70;
  void *v71;
  PKIdentityDocumentDataElement *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;
  void *v86;
  void *v87;
  NSObject *v88;
  id v89;
  uint64_t v90;
  unint64_t v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  PKIdentityDocumentDataElement *v104;
  void *v105;
  uint64_t v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  __CFString *v111;
  __CFString *v112;
  __CFString *v113;
  PKIdentityDocumentDataElement *v114;
  void *v115;
  void *v116;
  PKIdentityDocumentDataElement *v117;
  void *v118;
  void *v119;
  void *v120;
  __objc2_class **v121;
  PKIdentityDocumentDataElement *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  id v127;
  uint64_t v128;
  void *v129;
  void *v130;
  NSObject *v131;
  NSObject *v132;
  id v133;
  uint64_t v134;
  uint64_t i;
  void *v136;
  NSObject *v137;
  id v138;
  void *v139;
  uint64_t v140;
  NSObject *v141;
  void *v142;
  id v143;
  id v144;
  id v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  uint64_t j;
  void *v156;
  NSObject *v157;
  uint64_t v158;
  void *v159;
  NSObject *v160;
  uint64_t v161;
  id v162;
  void *v163;
  uint64_t v164;
  void *v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  uint64_t k;
  void *v172;
  NSObject *v173;
  uint64_t v174;
  id v175;
  void *v176;
  uint64_t v177;
  NSObject *v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  void *v188;
  void *v189;
  id v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  __CFString *v200;
  void *v201;
  id v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  id v211;
  id v212;
  id v214;
  id v215;
  void *v216;
  id v217;
  id v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  NSObject *v223;
  void *v224;
  void *v225;
  void *v226;
  id v227;
  uint64_t v228;
  uint64_t v229;
  NSObject *v230;
  uint64_t v231;
  NSObject *v232;
  id v233;
  _QWORD block[5];
  id v235;
  id v236;
  id v237;
  id v238;
  id v239;
  id v240;
  id v241;
  id v242;
  id v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  _BYTE v256[128];
  _BYTE v257[128];
  uint8_t v258[128];
  uint8_t buf[4];
  id v260;
  uint64_t v261;

  v261 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v202 = a4;
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D6A2C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = v5;
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D6A2C0]);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc(MEMORY[0x1E0DC3870]);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D6A2D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "initWithData:", v10);

  v212 = v7;
  v205 = (void *)v11;
  if (v11)
  {
    v12 = -[PKIdentityDocumentDataElement initWithImage:]([PKIdentityDocumentDataElement alloc], "initWithImage:", v11);
    objc_msgSend(v7, "addObject:", v12);
  }
  else
  {
    v12 = 0;
  }
  v215 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D6A250]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pk_zString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D6A2A0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pk_zString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v203 = v18;
  v204 = v15;
  if (objc_msgSend(v15, "length") || objc_msgSend(v18, "length"))
  {
    v19 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    if (objc_msgSend(v15, "length"))
      objc_msgSend(v19, "setGivenName:", v15);
    if (objc_msgSend(v18, "length"))
      objc_msgSend(v19, "setFamilyName:", v18);
    v20 = objc_alloc_init(MEMORY[0x1E0CB3858]);
    v21 = [PKIdentityDocumentDataElement alloc];
    PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_NAME"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringFromPersonNameComponents:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PKIdentityDocumentDataElement initWithLocalizedLabel:text:](v21, "initWithLocalizedLabel:text:", v22, v23);

    objc_msgSend(v215, "addObject:", v24);
    v12 = (PKIdentityDocumentDataElement *)v24;
  }
  v25 = objc_alloc_init(MEMORY[0x1E0C97378]);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D6A1F8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringValue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pk_zString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setStreet:", v28);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D6A218]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringValue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "pk_zString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCity:", v31);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D6A220]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringValue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "pk_zString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setISOCountryCode:", v34);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D6A2D8]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringValue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "pk_zString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v34;
  v200 = v38;
  if (v38 == CFSTR("US")
    || (v39 = v38) != 0
    && (v40 = -[__CFString caseInsensitiveCompare:](v38, "caseInsensitiveCompare:", CFSTR("US")), v39,
                                                                                                  !v40))
  {
    if (objc_msgSend(v37, "length") == 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "invertedSet");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v37, "rangeOfCharacterFromSet:", v42) == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v37, "substringToIndex:", 5);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "pk_zString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "substringFromIndex:", 5);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "pk_zString");
        v46 = v25;
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_ZIP_CODE_US_9_DIGITS"), CFSTR("%@%@"), v44, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "pk_zString");
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v37;
        v37 = (void *)v49;

        v25 = v46;
      }

    }
  }
  objc_msgSend(v25, "setPostalCode:", v37);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D6A2F8]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "stringValue");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "pk_zString");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setState:", v53);

  objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v25, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = v25;
  if (objc_msgSend(v54, "length"))
  {
    v55 = [PKIdentityDocumentDataElement alloc];
    PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_ADDRESS"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[PKIdentityDocumentDataElement initWithLocalizedLabel:text:](v55, "initWithLocalizedLabel:text:", v56, v54);

    v58 = v215;
    objc_msgSend(v215, "addObject:", v57);
    v12 = (PKIdentityDocumentDataElement *)v57;
  }
  else
  {
    v58 = v215;
  }
  _PKAddDateToElements(v6, v58, *MEMORY[0x1E0D6A228], CFSTR("DRIVER_LICENSE_DOB"));
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D6A200]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "numberValue");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v198 = v54;
  v210 = v60;
  if (v60)
  {
    if ((objc_msgSend(v60, "pk_isNotANumber") & 1) != 0)
    {
      PKLogFacilityTypeGetObject();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v260 = v60;
        _os_log_impl(&dword_19D178000, v61, OS_LOG_TYPE_DEFAULT, "Age in years is not a number %@", buf, 0xCu);
      }

    }
    else
    {
      v62 = [PKIdentityDocumentDataElement alloc];
      PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_AGE"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", v210, 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = -[PKIdentityDocumentDataElement initWithLocalizedLabel:text:](v62, "initWithLocalizedLabel:text:", v63, v64);

      objc_msgSend(v215, "addObject:", v65);
      v12 = (PKIdentityDocumentDataElement *)v65;
    }
  }
  v214 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v216, "objectForKey:", *MEMORY[0x1E0D6A2F0]);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "numberValue");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    if ((objc_msgSend(v67, "pk_isNotANumber") & 1) != 0)
    {
      PKLogFacilityTypeGetObject();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v260 = v67;
        v69 = "Sex is not a number %@";
LABEL_35:
        _os_log_impl(&dword_19D178000, v68, OS_LOG_TYPE_DEFAULT, v69, buf, 0xCu);
        goto LABEL_36;
      }
      goto LABEL_36;
    }
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D6A2E8]);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "numberValue");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v67)
    {
LABEL_37:
      v71 = 0;
      goto LABEL_39;
    }
    if ((objc_msgSend(v67, "pk_isNotANumber") & 1) != 0)
    {
      PKLogFacilityTypeGetObject();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v260 = v67;
        v69 = "Sex(AAMVA) is not a number %@";
        goto LABEL_35;
      }
LABEL_36:

      goto LABEL_37;
    }
  }
  SexDisplayableValueFromInteger(objc_msgSend(v67, "unsignedIntegerValue"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
  v197 = v67;
  v199 = v37;
  v196 = v71;
  if (objc_msgSend(v71, "length"))
  {
    v72 = [PKIdentityDocumentDataElement alloc];
    PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_SEX"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = -[PKIdentityDocumentDataElement initWithLocalizedLabel:text:](v72, "initWithLocalizedLabel:text:", v73, v71);

    objc_msgSend(v214, "addObject:", v74);
    v12 = (PKIdentityDocumentDataElement *)v74;
  }
  v75 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "localeIdentifier");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "componentsFromLocaleIdentifier:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)objc_msgSend(v78, "mutableCopy");

  -[PKSecureElementPass issuerCountryCode](self->_pass, "issuerCountryCode");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setObject:forKey:", v80, *MEMORY[0x1E0C997B0]);

  v195 = v79;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v79);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v194);
  v82 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v82, "setLocale:", v81);
  objc_msgSend(v82, "setNumberStyle:", 0);
  v83 = objc_alloc_init(MEMORY[0x1E0CB3760]);
  v208 = (void *)v81;
  objc_msgSend(v83, "setLocale:", v81);
  v192 = v83;
  objc_msgSend(v83, "setNumberFormatter:", v82);
  v84 = objc_alloc_init(MEMORY[0x1E0CB3728]);
  objc_msgSend(v84, "setUnitStyle:", 1);
  objc_msgSend(v84, "setForPersonHeightUse:", 1);
  v207 = v84;
  v193 = v82;
  objc_msgSend(v84, "setNumberFormatter:", v82);
  v85 = *MEMORY[0x1E0D6A270];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D6A270]);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "numberValue");
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  v209 = v6;
  v191 = v87;
  if (v87)
  {
    if ((objc_msgSend(v87, "pk_isNotANumber") & 1) != 0)
    {
      PKLogFacilityTypeGetObject();
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "objectForKey:", v85);
        v89 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v260 = v89;
        _os_log_impl(&dword_19D178000, v88, OS_LOG_TYPE_DEFAULT, "Height is not a number %@", buf, 0xCu);

      }
    }
    else
    {
      v90 = objc_msgSend(v87, "unsignedIntegerValue");
      if ((unint64_t)(v90 - 1) > 0x3E6)
      {
        PKLogFacilityTypeGetObject();
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v88, OS_LOG_TYPE_DEFAULT, "Height is not a valid number", buf, 2u);
        }
      }
      else
      {
        v91 = v90;
        v92 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3AD8], "centimeters");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v92, "initWithDoubleValue:unit:", v93, (double)v91);

        if ((objc_msgSend(v208, "usesMetricSystem") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject measurementByConvertingToUnit:](v88, "measurementByConvertingToUnit:", v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3AD8], "inches");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject measurementByConvertingToUnit:](v88, "measurementByConvertingToUnit:", v96);
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          v97 = objc_alloc(MEMORY[0x1E0CB3758]);
          objc_msgSend(v94, "doubleValue");
          v99 = round(v98);
          objc_msgSend(MEMORY[0x1E0CB3AD8], "inches");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = (void *)objc_msgSend(v97, "initWithDoubleValue:unit:", v100, v99);

          objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "measurementByConvertingToUnit:", v102);
          v95 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v95, "doubleValue");
        objc_msgSend(v207, "stringFromMeters:");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = [PKIdentityDocumentDataElement alloc];
        PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_HEIGHT"));
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = -[PKIdentityDocumentDataElement initWithLocalizedLabel:text:](v104, "initWithLocalizedLabel:text:", v105, v103);

        objc_msgSend(v214, "addObject:", v106);
        v12 = (PKIdentityDocumentDataElement *)v106;
      }
    }

  }
  _PKAddStringToElements(v6, v214, *MEMORY[0x1E0D6A248], CFSTR("DRIVER_LICENSE_EYE_COLOR"));
  _PKAddStringToElements(v6, v214, *MEMORY[0x1E0D6A268], CFSTR("DRIVER_LICENSE_HAIR_COLOR"));
  v190 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v107 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  _PKAddStringToElements(v6, v107, *MEMORY[0x1E0D6A278], CFSTR("DRIVER_LICENSE_ID_NUMBER"));
  _PKAddStringToElements(v6, v107, *MEMORY[0x1E0D6A280], CFSTR("DRIVER_LICENSE_ISSUING_AUTHORITY"));
  _PKAddDateToElements(v6, v107, *MEMORY[0x1E0D6A290], CFSTR("DRIVER_LICENSE_ID_ISSUE_DATE"));
  v108 = v6;
  v109 = v107;
  _PKAddDateToElements(v108, v107, *MEMORY[0x1E0D6A240], CFSTR("DRIVER_LICENSE_ID_EXPIRATION_DATE"));
  objc_msgSend(v216, "objectForKey:", *MEMORY[0x1E0D6A2E0]);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "stringValue");
  v111 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v112 = v111;
  v113 = CFSTR("DRIVER_LICENSE_ATTRIBUTE_YES");
  if (v111 != CFSTR("F"))
  {
    if (v111)
    {
      if (!objc_msgSend(CFSTR("F"), "isEqualToString:", v111))
        v113 = CFSTR("DRIVER_LICENSE_ATTRIBUTE_NO");
    }
    else
    {
      v113 = CFSTR("DRIVER_LICENSE_ATTRIBUTE_NO");
    }
  }

  v114 = [PKIdentityDocumentDataElement alloc];
  PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_REAL_ID"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedIdentityString(&v113->isa);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = -[PKIdentityDocumentDataElement initWithLocalizedLabel:text:](v114, "initWithLocalizedLabel:text:", v115, v116);

  objc_msgSend(v109, "addObject:", v117);
  objc_msgSend(v216, "objectForKey:", *MEMORY[0x1E0D6A308]);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "numberValue");
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  v189 = v119;
  if (objc_msgSend(v119, "isEqualToNumber:", &unk_1E3FACF58))
  {
    PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_ATTRIBUTE_YES"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = off_1E3E1B000;
    v122 = [PKIdentityDocumentDataElement alloc];
    PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_VETERAN"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = -[PKIdentityDocumentDataElement initWithLocalizedLabel:text:](v122, "initWithLocalizedLabel:text:", v123, v120);

    objc_msgSend(v109, "addObject:", v124);
    v117 = (PKIdentityDocumentDataElement *)v124;
  }
  else
  {
    v121 = off_1E3E1B000;
  }
  v125 = v212;
  v126 = v215;
  v211 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v127 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v227 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v216, "objectForKey:", *MEMORY[0x1E0D6A230]);
  v128 = objc_claimAutoreleasedReturnValue();
  v188 = (void *)v128;
  if (v128)
  {
    v129 = (void *)v128;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v129, "performSelector:", sel_arrayValue);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_69:
        v132 = v211;
        v252 = 0u;
        v253 = 0u;
        v254 = 0u;
        v255 = 0u;
        v133 = v130;
        v229 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v252, v258, 16);
        if (!v229)
        {
          v230 = v132;
          goto LABEL_139;
        }
        v134 = *(_QWORD *)v253;
        v230 = v132;
        v217 = v127;
        v218 = v133;
        v223 = v132;
        v228 = *(_QWORD *)v253;
        while (1)
        {
          for (i = 0; i != v229; i = v161 + 1)
          {
            if (*(_QWORD *)v253 != v134)
              objc_enumerationMutation(v133);
            v231 = i;
            v136 = *(void **)(*((_QWORD *)&v252 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v136, "objectForKey:", CFSTR("vehicle_category_code"));
              v137 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v232 = v137;
              if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSObject length](v137, "length"))
              {
                v138 = objc_alloc(v121[174]);
                PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_DRIVING_CLASS"));
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                v140 = objc_msgSend(v138, "initWithLocalizedLabel:text:", v139, v137);

                v132 = v223;
                -[NSObject addObject:](v230, "addObject:", v140);
                v117 = (PKIdentityDocumentDataElement *)v140;
                goto LABEL_105;
              }
              objc_msgSend(v136, "objectForKey:", CFSTR("domestic_vehicle_class"));
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v142, "objectForKey:", CFSTR("domestic_vehicle_class_code"));
                v143 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v143 = 0;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v143, "length"))
              {
                v159 = v143;
                PKLogFacilityTypeGetObject();
                v160 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v260 = v142;
                  _os_log_impl(&dword_19D178000, v160, OS_LOG_TYPE_DEFAULT, "Invalid vehicle class: %@", buf, 0xCu);
                }

LABEL_105:
                v134 = v228;
                v161 = v231;
LABEL_133:

                continue;
              }
              v144 = v143;
              v145 = objc_alloc(v121[174]);
              PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_DRIVING_CLASS"));
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              v222 = v144;
              v147 = objc_msgSend(v145, "initWithLocalizedLabel:text:", v146, v144);

              v148 = (uint64_t)v121;
              v224 = (void *)v147;
              -[NSObject addObject:](v230, "addObject:", v147);
              objc_msgSend(v136, "objectForKey:", CFSTR("domestic_vehicle_restrictions"));
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v226 = v149;
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_107;
              v250 = 0u;
              v251 = 0u;
              v248 = 0u;
              v249 = 0u;
              v150 = v149;
              v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v248, v257, 16);
              if (!v151)
              {

                goto LABEL_107;
              }
              v152 = v151;
              v219 = v142;
              v153 = 0;
              v154 = *(_QWORD *)v249;
              do
              {
                for (j = 0; j != v152; ++j)
                {
                  if (*(_QWORD *)v249 != v154)
                    objc_enumerationMutation(v150);
                  v156 = *(void **)(*((_QWORD *)&v248 + 1) + 8 * j);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && (objc_msgSend(v156, "objectForKey:", CFSTR("domestic_vehicle_restriction_code")),
                        v157 = (id)objc_claimAutoreleasedReturnValue(),
                        v157,
                        v157))
                  {
                    if (v153)
                    {
                      objc_msgSend(v153, "stringByAppendingFormat:", CFSTR(", %@"), v157);
                      v158 = objc_claimAutoreleasedReturnValue();

                      v153 = (void *)v158;
                    }
                    else
                    {
                      v157 = v157;
                      v153 = v157;
                    }
                  }
                  else
                  {
                    PKLogFacilityTypeGetObject();
                    v157 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v260 = v156;
                      _os_log_impl(&dword_19D178000, v157, OS_LOG_TYPE_DEFAULT, "Invalid vehicle restrictions: %@", buf, 0xCu);
                    }
                  }

                }
                v152 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v248, v257, 16);
              }
              while (v152);

              v148 = 0x1E3E1B000;
              v127 = v217;
              v142 = v219;
              if (!v153)
              {
LABEL_107:
                PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_DRIVING_NO_RESTRICTIONS"));
                v153 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v162 = objc_alloc(*(Class *)(v148 + 1392));
              PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_DRIVING_RESTRICTIONS"));
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              v164 = objc_msgSend(v162, "initWithLocalizedLabel:text:", v163, v153);

              v221 = (void *)v164;
              -[NSObject addObject:](v230, "addObject:", v164);
              objc_msgSend(v136, "objectForKey:", CFSTR("domestic_vehicle_endorsements"));
              v165 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v225 = v165;
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_126;
              v246 = 0u;
              v247 = 0u;
              v244 = 0u;
              v245 = 0u;
              v166 = v165;
              v167 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v244, v256, 16);
              if (!v167)
              {

                goto LABEL_126;
              }
              v168 = v167;
              v220 = v142;
              v169 = 0;
              v170 = *(_QWORD *)v245;
              do
              {
                for (k = 0; k != v168; ++k)
                {
                  if (*(_QWORD *)v245 != v170)
                    objc_enumerationMutation(v166);
                  v172 = *(void **)(*((_QWORD *)&v244 + 1) + 8 * k);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && (objc_msgSend(v172, "objectForKey:", CFSTR("domestic_vehicle_endorsement_code")),
                        v173 = (id)objc_claimAutoreleasedReturnValue(),
                        v173,
                        v173))
                  {
                    if (v169)
                    {
                      objc_msgSend(v169, "stringByAppendingFormat:", CFSTR(", %@"), v173);
                      v174 = objc_claimAutoreleasedReturnValue();

                      v169 = (void *)v174;
                    }
                    else
                    {
                      v173 = v173;
                      v169 = v173;
                    }
                  }
                  else
                  {
                    PKLogFacilityTypeGetObject();
                    v173 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v260 = v172;
                      _os_log_impl(&dword_19D178000, v173, OS_LOG_TYPE_DEFAULT, "Invalid vehicle endorsements: %@", buf, 0xCu);
                    }
                  }

                }
                v168 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v244, v256, 16);
              }
              while (v168);

              v148 = 0x1E3E1B000;
              v127 = v217;
              v142 = v220;
              if (!v169)
              {
LABEL_126:
                PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_DRIVING_NO_RESTRICTIONS"));
                v169 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v121 = (__objc2_class **)v148;
              v175 = objc_alloc(*(Class *)(v148 + 1392));
              PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_DRIVING_ENDORSEMENTS"));
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              v177 = objc_msgSend(v175, "initWithLocalizedLabel:text:", v176, v169);

              v117 = (PKIdentityDocumentDataElement *)v177;
              -[NSObject addObject:](v230, "addObject:", v177);

              v133 = v218;
              v132 = v223;
              v134 = v228;
              v141 = v232;
              goto LABEL_128;
            }
            PKLogFacilityTypeGetObject();
            v141 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v260 = v136;
              _os_log_impl(&dword_19D178000, v141, OS_LOG_TYPE_DEFAULT, "Invalid driving privilege: %@", buf, 0xCu);
            }
LABEL_128:

            v161 = v231;
            if (-[NSObject count](v132, "count"))
            {
              v232 = v127;

            }
            else
            {
              v232 = v230;
            }
            if (objc_msgSend(v127, "count"))
            {
              v230 = v227;
              goto LABEL_133;
            }
            v230 = v232;
          }
          v229 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v252, v258, 16);
          if (!v229)
          {
LABEL_139:

            v125 = v212;
            v126 = v215;
            goto LABEL_140;
          }
        }
      }

      PKLogFacilityTypeGetObject();
      v131 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v260 = 0;
        _os_log_impl(&dword_19D178000, v131, OS_LOG_TYPE_DEFAULT, "Invalid driving privileges: %@", buf, 0xCu);
      }

    }
    v130 = 0;
    goto LABEL_69;
  }
LABEL_140:
  v178 = MEMORY[0x1E0C80D38];
  v179 = MEMORY[0x1E0C80D38];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKIdentityDocumentDetailsViewController__formatDataElementsForISO18013_withCompletion___block_invoke;
  block[3] = &unk_1E3E67FF8;
  block[4] = self;
  v233 = v125;
  v235 = v233;
  v180 = v126;
  v236 = v180;
  v181 = v214;
  v237 = v181;
  v182 = v190;
  v238 = v182;
  v183 = v109;
  v239 = v183;
  v184 = v211;
  v240 = v184;
  v185 = v127;
  v241 = v185;
  v186 = v227;
  v242 = v186;
  v187 = v202;
  v243 = v187;
  dispatch_async(v178, block);

}

uint64_t __89__PKIdentityDocumentDetailsViewController__formatDataElementsForISO18013_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1096);
  *(_QWORD *)(v3 + 1096) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1104);
  *(_QWORD *)(v6 + 1104) = v5;

  v8 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 1112);
  *(_QWORD *)(v9 + 1112) = v8;

  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 1120);
  *(_QWORD *)(v12 + 1120) = v11;

  v14 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 1128);
  *(_QWORD *)(v15 + 1128) = v14;

  v17 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 1136);
  *(_QWORD *)(v18 + 1136) = v17;

  v20 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 1144);
  *(_QWORD *)(v21 + 1144) = v20;

  v23 = objc_msgSend(*(id *)(a1 + 96), "copy");
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 1152);
  *(_QWORD *)(v24 + 1152) = v23;

  if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "reloadData");

  }
  result = *(_QWORD *)(a1 + 104);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_formatDataElementsForISO23220:(id)a3 withCompletion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PKIdentityDocumentDataElement *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  PKIdentityDocumentDataElement *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  PKIdentityDocumentDataElement *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  PKIdentityDocumentDataElement *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  PKIdentityDocumentDataElement *v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v55;
  void *v56;
  _QWORD block[5];
  id v58;
  id v59;
  id v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v53 = a4;
  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D6A350]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D6A348]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0DC3870]);
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D6A358]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "initWithData:", v13);

  v56 = (void *)v14;
  if (v14)
  {
    v15 = -[PKIdentityDocumentDataElement initWithImage:]([PKIdentityDocumentDataElement alloc], "initWithImage:", v14);
    objc_msgSend(v7, "addObject:", v15);
  }
  else
  {
    v15 = 0;
  }
  v55 = v7;
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D6A330]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pk_zString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v18;
  if (objc_msgSend(v18, "length"))
  {
    v19 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v19, "setFamilyName:", v18);
    v20 = objc_alloc_init(MEMORY[0x1E0CB3858]);
    v21 = [PKIdentityDocumentDataElement alloc];
    PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_NAME"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringFromPersonNameComponents:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PKIdentityDocumentDataElement initWithLocalizedLabel:text:](v21, "initWithLocalizedLabel:text:", v22, v23);

    objc_msgSend(v8, "addObject:", v24);
    v15 = (PKIdentityDocumentDataElement *)v24;
  }
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D6A340]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "pk_zString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v27, "length"))
  {
    v28 = [PKIdentityDocumentDataElement alloc];
    PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_ADDRESS"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PKIdentityDocumentDataElement initWithLocalizedLabel:text:](v28, "initWithLocalizedLabel:text:", v29, v27);

    objc_msgSend(v8, "addObject:", v30);
    v15 = (PKIdentityDocumentDataElement *)v30;
  }
  _PKAddDateToElements(v9, v8, *MEMORY[0x1E0D6A328], CFSTR("DRIVER_LICENSE_DOB"));
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D6A320]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "numberValue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v27;
  if (v32)
  {
    if ((objc_msgSend(v32, "pk_isNotANumber", v27, v51) & 1) != 0)
    {
      PKLogFacilityTypeGetObject();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v32;
        _os_log_impl(&dword_19D178000, v33, OS_LOG_TYPE_DEFAULT, "Age in years is not a number %@", buf, 0xCu);
      }

    }
    else
    {
      v34 = [PKIdentityDocumentDataElement alloc];
      PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_AGE"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", v32, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[PKIdentityDocumentDataElement initWithLocalizedLabel:text:](v34, "initWithLocalizedLabel:text:", v35, v36);

      objc_msgSend(v8, "addObject:", v37);
      v15 = (PKIdentityDocumentDataElement *)v37;
    }
  }
  v38 = v9;
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D6A360], v49);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "numberValue");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  SexDisplayableValueFromInteger(objc_msgSend(v40, "unsignedIntegerValue"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "length"))
  {
    v42 = [PKIdentityDocumentDataElement alloc];
    PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_SEX"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[PKIdentityDocumentDataElement initWithLocalizedLabel:text:](v42, "initWithLocalizedLabel:text:", v43, v41);

    objc_msgSend(v8, "addObject:", v44);
    v15 = (PKIdentityDocumentDataElement *)v44;
  }
  _PKAddStringToElements(v10, v52, *MEMORY[0x1E0D6A338], CFSTR("NATIONAL_ID_JP_INDIVIDUAL_NUMBER"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKIdentityDocumentDetailsViewController__formatDataElementsForISO23220_withCompletion___block_invoke;
  block[3] = &unk_1E3E669B8;
  block[4] = self;
  v58 = v55;
  v59 = v8;
  v60 = v52;
  v61 = v53;
  v45 = v53;
  v46 = v52;
  v47 = v8;
  v48 = v55;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __89__PKIdentityDocumentDetailsViewController__formatDataElementsForISO23220_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1096);
  *(_QWORD *)(v3 + 1096) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1104);
  *(_QWORD *)(v6 + 1104) = v5;

  v8 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 1112);
  *(_QWORD *)(v9 + 1112) = v8;

  if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadData");

  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKIdentityDocumentDetailsViewController;
  -[PKSectionTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKIdentityDocumentDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PortraitCellIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("DataElementCellIdentifier"));
  objc_msgSend(v3, "reloadData");

}

- (id)_elementsForSection:(unint64_t)a3
{
  if (a3 > 7)
    return 0;
  else
    return objc_autoreleaseReturnValue(objc_retain(*(id *)((char *)&self->super.super.super.super.super.isa
                                                         + *off_1E3E68038[a3])));
}

- (id)_elementAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  -[PKIdentityDocumentDetailsViewController _elementsForSection:](self, "_elementsForSection:", -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v4, "section")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  if (objc_msgSend(v5, "count") <= v6)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  void *v3;
  BOOL v4;

  -[PKIdentityDocumentDetailsViewController _elementsForSection:](self, "_elementsForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PKIdentityDocumentDetailsViewController _elementsForSection:](self, "_elementsForSection:", -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  -[PKIdentityDocumentDetailsViewController _elementAtIndexPath:](self, "_elementAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "type") == 1)
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PortraitCellIdentifier"), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setImage:", v12);

      objc_msgSend(v11, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
    }
    else
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("DataElementCellIdentifier"), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v13);

      objc_msgSend(v9, "attributedText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v9, "attributedText");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSecondaryAttributedText:", v15);
      }
      else
      {
        objc_msgSend(v9, "text");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSecondaryText:", v15);
      }

      objc_msgSend(v11, "textProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0DC1350];
      v18 = *MEMORY[0x1E0DC4B10];
      objc_msgSend(v6, "traitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "preferredFontForTextStyle:compatibleWithTraitCollection:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFont:", v20);

      objc_msgSend(v11, "secondaryTextProperties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0DC1350];
      v23 = *MEMORY[0x1E0DC4A88];
      objc_msgSend(v6, "traitCollection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "preferredFontForTextStyle:compatibleWithTraitCollection:", v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFont:", v25);

      objc_msgSend(v11, "secondaryTextProperties");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setNumberOfLines:", 0);

      objc_msgSend(v11, "setDirectionalLayoutMargins:", 8.0, 0.0, 8.0, 0.0);
      objc_msgSend(v11, "setAxesPreservingSuperviewLayoutMargins:", 1);
      objc_msgSend(v11, "setTextToSecondaryTextVerticalPadding:", 4.0);
      LODWORD(v26) = self->_inBridge;
      objc_msgSend(v11, "textProperties");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v26)
      {
        PKBridgeAltTextColor();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setColor:", v28);

        objc_msgSend(v11, "secondaryTextProperties");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        PKBridgeTextColor();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setColor:", v30);

        objc_msgSend(v11, "secondaryTextProperties");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setColor:", v31);

      objc_msgSend(v10, "setContentConfiguration:", v11);
      objc_msgSend(v10, "contentView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  double v5;

  -[PKIdentityDocumentDetailsViewController _elementAtIndexPath:](self, "_elementAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") == 1)
    v5 = 80.0;
  else
    v5 = *MEMORY[0x1E0DC53D8];

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unint64_t v4;
  __CFString *v5;
  void *v6;

  v4 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (v4 == 5)
  {
    v5 = CFSTR("DRIVER_LICENSE_DRIVING_PRIVILEGES");
  }
  else
  {
    if (v4 != 3)
    {
      v6 = 0;
      return v6;
    }
    v5 = CFSTR("DRIVER_LICENSE_ID_INFORMATION");
  }
  PKLocalizedIdentityString(&v5->isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_drivingPrivilegesElements3, 0);
  objc_storeStrong((id *)&self->_drivingPrivilegesElements2, 0);
  objc_storeStrong((id *)&self->_drivingPrivilegesElements1, 0);
  objc_storeStrong((id *)&self->_idInfoElements, 0);
  objc_storeStrong((id *)&self->_additionalElements, 0);
  objc_storeStrong((id *)&self->_personalElements, 0);
  objc_storeStrong((id *)&self->_criticalElements, 0);
  objc_storeStrong((id *)&self->_portraitElements, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
