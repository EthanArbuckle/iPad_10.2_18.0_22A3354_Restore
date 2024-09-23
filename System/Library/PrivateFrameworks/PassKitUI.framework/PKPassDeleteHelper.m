@implementation PKPassDeleteHelper

+ (void)presentDeleteBarcodePassAlertForPass:(id)a3 withHandler:(id)a4 presentingViewController:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (PKStoreDemoModeEnabled())
  {
    v10 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedString(CFSTR("REMOVE_SHEET_DEMO_MODE_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("REMOVE_SHEET_DEMO_MODE_BUTTON"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v15);

    objc_msgSend(v9, "presentViewController:animated:completion:", v12, 1, 0);
  }
  else
  {
    PKLocalizedString(CFSTR("REMOVE_SHEET_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("REMOVE_SHEET_CANCEL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("REMOVE_SHEET_CONFIRM"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v16, 1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v19);

    v20 = (void *)MEMORY[0x1E0DC3448];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __96__PKPassDeleteHelper_presentDeleteBarcodePassAlertForPass_withHandler_presentingViewController___block_invoke;
    v23[3] = &unk_1E3E61798;
    v24 = v8;
    v25 = v7;
    v21 = v9;
    v26 = v21;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v17, 2, v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v22);

    objc_msgSend(v21, "presentViewController:animated:completion:", v18, 1, 0);
  }

}

void *__96__PKPassDeleteHelper_presentDeleteBarcodePassAlertForPass_withHandler_presentingViewController___block_invoke(_QWORD *a1)
{
  void *result;

  result = (void *)a1[4];
  if (result)
    return (void *)objc_msgSend(result, "handleDeletePassRequestWithPass:forViewController:", a1[5], a1[6]);
  return result;
}

+ (void)deletePaymentPassAlertCopyForPass:(id)a3 webService:(id)a4 paymentServiceDataProvider:(id)a5 isBridge:(BOOL)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  id v42;
  BOOL v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD *v47;
  _QWORD v48[4];
  id v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD *v64;
  _QWORD v65[4];
  id v66;
  id v67;
  _QWORD *v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;
  _QWORD v73[5];
  id v74;
  _QWORD v75[5];
  id v76;
  _QWORD v77[5];
  id v78;
  _QWORD v79[5];
  id v80;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = __Block_byref_object_copy__1;
  v79[4] = __Block_byref_object_dispose__1;
  v80 = 0;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x3032000000;
  v77[3] = __Block_byref_object_copy__1;
  v77[4] = __Block_byref_object_dispose__1;
  v78 = 0;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  v75[3] = __Block_byref_object_copy__1;
  v75[4] = __Block_byref_object_dispose__1;
  v76 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3032000000;
  v73[3] = __Block_byref_object_copy__1;
  v73[4] = __Block_byref_object_dispose__1;
  v74 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3032000000;
  v71[3] = __Block_byref_object_copy__1;
  v71[4] = __Block_byref_object_dispose__1;
  v72 = 0;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = __Block_byref_object_copy__1;
  v69[4] = __Block_byref_object_dispose__1;
  v70 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke;
  v65[3] = &unk_1E3E63610;
  v17 = v11;
  v66 = v17;
  v18 = v12;
  v67 = v18;
  v68 = v79;
  objc_msgSend(v15, "addOperation:", v65);
  v61[0] = v16;
  v61[1] = 3221225472;
  v61[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_3;
  v61[3] = &unk_1E3E63610;
  v19 = v13;
  v62 = v19;
  v20 = v17;
  v63 = v20;
  v64 = v77;
  objc_msgSend(v15, "addOperation:", v61);
  v57[0] = v16;
  v57[1] = 3221225472;
  v57[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_5;
  v57[3] = &unk_1E3E63610;
  v21 = v19;
  v58 = v21;
  v22 = v20;
  v59 = v22;
  v60 = v71;
  objc_msgSend(v15, "addOperation:", v57);
  v53[0] = v16;
  v53[1] = 3221225472;
  v53[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_7;
  v53[3] = &unk_1E3E63610;
  v23 = v21;
  v54 = v23;
  v24 = v22;
  v55 = v24;
  v56 = v69;
  objc_msgSend(v15, "addOperation:", v53);
  v48[0] = v16;
  v48[1] = 3221225472;
  v48[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_9;
  v48[3] = &unk_1E3E636B0;
  v25 = v24;
  v49 = v25;
  v50 = v69;
  v51 = v71;
  v52 = v75;
  objc_msgSend(v15, "addOperation:", v48);
  v44[0] = v16;
  v44[1] = 3221225472;
  v44[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_10;
  v44[3] = &unk_1E3E63610;
  v26 = v25;
  v45 = v26;
  v27 = v18;
  v46 = v27;
  v47 = v73;
  objc_msgSend(v15, "addOperation:", v44);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v16;
  v34[1] = 3221225472;
  v34[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_12;
  v34[3] = &unk_1E3E63728;
  v42 = a1;
  v29 = v26;
  v35 = v29;
  v38 = v79;
  v30 = v23;
  v36 = v30;
  v39 = v75;
  v40 = v77;
  v41 = v73;
  v43 = a6;
  v31 = v14;
  v37 = v31;
  v32 = (id)objc_msgSend(v15, "evaluateWithInput:completion:", v28, v34);

  _Block_object_dispose(v69, 8);
  _Block_object_dispose(v71, 8);

  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);

  _Block_object_dispose(v77, 8);
  _Block_object_dispose(v79, 8);

}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "associatedAccountServiceAccountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "targetDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_2;
    v10[3] = &unk_1E3E635E8;
    v13 = *(_QWORD *)(a1 + 48);
    v12 = v7;
    v11 = v6;
    objc_msgSend(v9, "accountWithIdentifier:completion:", v8, v10);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "devicePrimaryPaymentApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_4;
    v13[3] = &unk_1E3E63638;
    v11 = *(void **)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 48);
    v14 = v8;
    v15 = v11;
    v17 = v7;
    v16 = v6;
    v12 = v8;
    objc_msgSend(v9, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v10, v12, v13);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

uint64_t __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_4(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "transitPassPropertiesWithPaymentApplication:pass:", a1[4], a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[8] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_6;
    v10[3] = &unk_1E3E63660;
    v13 = *(_QWORD *)(a1 + 48);
    v12 = v7;
    v11 = v6;
    objc_msgSend(v8, "balancesForPaymentPassWithUniqueIdentifier:completion:", v9, v10);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_8;
    v10[3] = &unk_1E3E63688;
    v13 = *(_QWORD *)(a1 + 48);
    v12 = v7;
    v11 = v6;
    objc_msgSend(v8, "plansForPaymentPassWithUniqueIdentifier:completion:", v9, v10);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void (**v6)(id, id, _QWORD);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "isStoredValuePass")
    && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count")
     || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count")))
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", *(_QWORD *)(a1 + 32));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDynamicBalances:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "updateWithDynamicCommutePlans:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  v6[2](v6, v10, 0);

}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(*(id *)(a1 + 32), "hasMerchantTokens") & 1) != 0)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D675B0]);
    objc_msgSend(v8, "setPass:", *(_QWORD *)(a1 + 32));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_11;
    v10[3] = &unk_1E3E636D8;
    v9 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v12 = v7;
    v11 = v6;
    objc_msgSend(v9, "retrieveMerchantTokensWithRequest:completion:", v8, v10);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_12(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_13;
  block[3] = &unk_1E3E63700;
  v11 = *(_QWORD *)(a1 + 88);
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 56);
  v5 = v2;
  v8 = v3;
  v6 = *(id *)(a1 + 40);
  v9 = *(_OWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 80);
  v12 = *(_BYTE *)(a1 + 96);
  v7 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_13(uint64_t a1)
{
  uint64_t v2;

  LOBYTE(v2) = *(_BYTE *)(a1 + 96);
  return objc_msgSend(*(id *)(a1 + 88), "deletePaymentPassAlertCopyForPass:withAccount:paymentServiceDataProvider:transitBalanceModel:transitPassProperties:merchantTokensResponse:fkInstitution:isBridge:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), 0, v2, *(_QWORD *)(a1 + 48));
}

+ (BOOL)hasPositiveBalanceForTransitPassProperties:(id)a3 transitBalanceModel:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;

  v5 = a4;
  objc_msgSend(a3, "balanceAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (objc_msgSend(MEMORY[0x1E0CB3598], "zero"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "compare:", v7),
        v8,
        v9 == -1))
  {
    v10 = 1;
  }
  else
  {
    v10 = objc_msgSend(v5, "hasPositiveBalance");
  }

  return v10;
}

+ (void)deletePaymentPassAlertCopyForPass:(id)a3 withAccount:(id)a4 paymentServiceDataProvider:(id)a5 transitBalanceModel:(id)a6 transitPassProperties:(id)a7 merchantTokensResponse:(id)a8 fkInstitution:(id)a9 isBridge:(BOOL)a10 completion:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  char v35;
  _QWORD v36[4];
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD *v48;
  _QWORD *v49;
  id v50;
  char v51;
  BOOL v52;
  _QWORD v53[5];
  id v54;
  _QWORD v55[5];
  id v56;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a11;
  if (PKStoreDemoModeEnabled())
  {
    PKLocalizedString(CFSTR("REMOVE_SHEET_DEMO_MODE_TITLE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v24 + 2))(v24, v25, 0, 0);
LABEL_6:

    goto LABEL_7;
  }
  if ((objc_msgSend(a1, "_canDeletePaymentPass:transitPassProperties:", v17, v21) & 1) == 0)
  {
    PKLocalizedPaymentString(CFSTR("CARD_IN_TRANSIT"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("CARD_IN_TRANSIT_MESSAGE_DELETE_CARD"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void *, _QWORD))v24 + 2))(v24, v25, v33, 0);

    goto LABEL_6;
  }
  v35 = PKUserInterfaceIdiomSupportsLargeLayouts();
  v26 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v27 = v20;
  v28 = v19;
  v29 = v26;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__1;
  v55[4] = __Block_byref_object_dispose__1;
  v56 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__1;
  v53[4] = __Block_byref_object_dispose__1;
  v54 = 0;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke;
  v40[3] = &unk_1E3E637A0;
  v34 = v27;
  v41 = v27;
  v48 = v55;
  v42 = v17;
  v49 = v53;
  v50 = a1;
  v30 = v29;
  v19 = v28;
  v43 = v21;
  v44 = v22;
  v45 = v18;
  v51 = v35;
  v46 = v28;
  v52 = a10;
  v47 = v23;
  objc_msgSend(v30, "addOperation:", v40);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_4;
  v36[3] = &unk_1E3E637F0;
  v37 = v24;
  v38 = v55;
  v39 = v53;
  v32 = (id)objc_msgSend(v30, "evaluateWithInput:completion:", v31, v36);

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v55, 8);

  v20 = v34;
LABEL_7:

}

void __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
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
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  char v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  unint64_t v58;
  int v59;
  __CFString *v60;
  void *v61;
  NSString *v62;
  uint64_t v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _QWORD aBlock[4];
  id v77;
  uint64_t v78;
  uint64_t v79;
  char v80;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "hasDeviceBoundCommutePlans"))
  {
    PKPassLocalizedStringWithFormat();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    PKPassLocalizedStringWithFormat();
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(*(id *)(a1 + 104), "hasPositiveBalanceForTransitPassProperties:transitBalanceModel:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32)))
  {
    PKLocalizedPaymentString(CFSTR("DELETE_CARD_WITH_VALUE_SHEET_TITLE"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    PKLocalizedPaymentString(CFSTR("DELETE_CARD_WITH_VALUE_SHEET_MESSAGE"));
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    if (*(_QWORD *)(a1 + 64))
    {
      PKLocalizedMerchantTokensString(CFSTR("DELETE_MERCHANT_TOKEN_CARD_APPLE_CARD_SHEET_TITLE"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      PKLocalizedMerchantTokensString(CFSTR("DELETE_MERCHANT_TOKEN_CARD_SHEET_MESSAGE"));
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (objc_msgSend(*(id *)(a1 + 104), "hasAppleCashMerchantTokenForMerchantTokensResponse:"))
    {
      objc_msgSend(*(id *)(a1 + 56), "merchantTokens");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (v32 != 1)
      {
        v46 = (void *)MEMORY[0x1E0CB3940];
        PKLocalizedMerchantTokensString(CFSTR("DELETE_MERCHANT_TOKEN_CARD_SHEET_MESSAGE"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentRecurringString(CFSTR("REMOVE_CARD_ALERT_RECURRING_MESSAGE"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", CFSTR("%@\n\n%@"), v47, v48);
        v38 = objc_claimAutoreleasedReturnValue();

        goto LABEL_33;
      }
      PKLocalizedPeerPaymentRecurringString(CFSTR("REMOVE_CARD_ALERT_MESSAGE"));
      v33 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PKLocalizedMerchantTokensString(CFSTR("DELETE_MERCHANT_TOKEN_CARD_SHEET_MESSAGE"));
      v33 = objc_claimAutoreleasedReturnValue();
    }
    v38 = v33;
LABEL_33:
    if (*(_BYTE *)(a1 + 112))
    {
      objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMerchantTokensString(CFSTR("DELETE_MERCHANT_TOKEN_CARD_SHEET_TITLE"), CFSTR("%@"), v49);
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v52 = *(void **)(v51 + 40);
      *(_QWORD *)(v51 + 40) = v50;

      v53 = *(_QWORD *)(a1 + 96);
    }
    else
    {
      v53 = *(_QWORD *)(a1 + 88);
    }
    v54 = *(_QWORD *)(v53 + 8);
    v22 = *(void **)(v54 + 40);
    *(_QWORD *)(v54 + 40) = v38;
    goto LABEL_10;
  }
  if (objc_msgSend(*(id *)(a1 + 72), "supportsTransactionsForPass:", *(_QWORD *)(a1 + 40)))
  {
    v23 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_2;
    aBlock[3] = &unk_1E3E63750;
    v80 = *(_BYTE *)(a1 + 112);
    v78 = *(_QWORD *)(a1 + 88);
    v24 = *(id *)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 96);
    v77 = v24;
    v79 = v25;
    v26 = _Block_copy(aBlock);
    v27 = *(void **)(a1 + 64);
    if (v27)
    {
      v70 = 0;
      v71 = &v70;
      v72 = 0x3032000000;
      v73 = __Block_byref_object_copy__1;
      v74 = __Block_byref_object_dispose__1;
      objc_msgSend(v27, "feature");
      PKLocalizedFeatureString();
      v75 = (id)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(*(id *)(a1 + 40), "isAppleCardPass");
      v29 = v28;
      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = v23;
        v64[1] = 3221225472;
        v64[2] = __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_3;
        v64[3] = &unk_1E3E63778;
        v69 = &v70;
        v65 = *(id *)(a1 + 64);
        v67 = v26;
        v68 = v9;
        v66 = v8;
        objc_msgSend(v30, "defaultAccountForFeature:completion:", 5, v64);

      }
      else
      {
        if (objc_msgSend(*(id *)(a1 + 64), "feature") == 3)
        {
          PKPrimaryAppleAccountEmail();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCocoonString(CFSTR("ACCOUNT_SERVICE_PASS_REMOVAL_EDUCATIONAL_MESSAGE"), CFSTR("%@"), v55);
          v56 = objc_claimAutoreleasedReturnValue();
          v57 = (void *)v71[5];
          v71[5] = v56;

        }
        (*((void (**)(void *, uint64_t))v26 + 2))(v26, v71[5]);
      }
      _Block_object_dispose(&v70, 8);

      if ((v29 & 1) != 0)
      {

        goto LABEL_12;
      }
      goto LABEL_57;
    }
    objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "supportsBarcodePayment"))
    {
      PKLocalizedAquamanString(CFSTR("DELETE_ACCOUNT_SHEET_MESSAGE"), CFSTR("%@"), v39);
      v40 = objc_claimAutoreleasedReturnValue();
LABEL_30:
      v41 = (void *)v40;
LABEL_56:
      (*((void (**)(void *, void *))v26 + 2))(v26, v41);

LABEL_57:
      goto LABEL_11;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isIdentityPass"))
    {
      v58 = objc_msgSend(*(id *)(a1 + 40), "identityType");
      if (v58 < 2)
      {
        v59 = *(unsigned __int8 *)(a1 + 113);
        v60 = CFSTR("DELETE_DL_SHEET_MESSAGE");
      }
      else if (v58 == 3)
      {
        v59 = *(unsigned __int8 *)(a1 + 113);
        v60 = CFSTR("DELETE_NID_SHEET_MESSAGE");
      }
      else
      {
        if (v58 != 2)
        {
          v41 = 0;
          goto LABEL_56;
        }
        v59 = *(unsigned __int8 *)(a1 + 113);
        v60 = CFSTR("DELETE_STATE_ID_SHEET_MESSAGE");
      }
      PKDeviceSpecificLocalizedStringKeyForKey(v60, v59);
      v62 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedIdentityString(v62, CFSTR("%@"), v39);
      v63 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v61 = *(void **)(a1 + 80);
      if (!v61)
      {
        PKLocalizedPaymentString(CFSTR("DELETE_CARD_SHEET_MESSAGE"));
        v40 = objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      objc_msgSend(v61, "name");
      v62 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedBankConnectString(CFSTR("BANK_CONNECT_DELETE_CARD_SHEET_MESSAGE"), CFSTR("%@"), v62);
      v63 = objc_claimAutoreleasedReturnValue();
    }
    v41 = (void *)v63;

    goto LABEL_56;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "areCredentialsStoredInKML")
    && objc_msgSend(*(id *)(a1 + 40), "isCarKeyPass"))
  {
    if (*(_BYTE *)(a1 + 113))
      v34 = CFSTR("CARKEY_DELETE_CARD_SHEET_TITLE_WATCH");
    else
      v34 = CFSTR("CARKEY_DELETE_CARD_SHEET_TITLE");
    PKLocalizedCredentialString(&v34->isa);
    v13 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 88);
    goto LABEL_9;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "accessType") != 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("DELETE_CARD_SHEET_TITLE"), CFSTR("%@"), v42);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v45 = *(void **)(v44 + 40);
    *(_QWORD *)(v44 + 40) = v43;

    goto LABEL_11;
  }
  PKLocalizedHomeKeyString(CFSTR("DELETE_KEY_SHEET_TITLE"));
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v37 = *(void **)(v36 + 40);
  *(_QWORD *)(v36 + 40) = v35;

  PKLocalizedHomeKeyString(CFSTR("DELETE_KEY_SHEET_MESSAGE"));
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v20 = *(_QWORD *)(a1 + 96);
LABEL_9:
  v21 = *(_QWORD *)(v20 + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v13;
LABEL_10:

LABEL_11:
  (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v8, 0);
LABEL_12:

}

void __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("DELETE_CARD_SHEET_TITLE"), CFSTR("%@"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(_QWORD *)(a1 + 48);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
  }
  v9 = *(_QWORD *)(v8 + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v3;

}

uint64_t __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "feature");
    PKLocalizedFeatureString();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_4(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  __int128 v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_5;
  block[3] = &unk_1E3E637C8;
  v3 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 1);
}

+ (void)presentDeletePaymentPassAlertForPass:(id)a3 withAccount:(id)a4 paymentServiceDataProvider:(id)a5 transitBalanceModel:(id)a6 transitPassProperties:(id)a7 fkInstitution:(id)a8 detailViewStyle:(int64_t)a9 deleteHander:(id)a10 passLibraryDataProvider:(id)a11 presentingViewController:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v16 = a3;
  v17 = a10;
  v18 = a11;
  v19 = a12;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __232__PKPassDeleteHelper_presentDeletePaymentPassAlertForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_fkInstitution_detailViewStyle_deleteHander_passLibraryDataProvider_presentingViewController___block_invoke;
  v27[3] = &unk_1E3E63840;
  v31 = v18;
  v32 = a1;
  v28 = v19;
  v29 = v16;
  v30 = v17;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v19;
  LOBYTE(v24) = a9 == 2;
  +[PKPassDeleteHelper deletePaymentPassAlertCopyForPass:withAccount:paymentServiceDataProvider:transitBalanceModel:transitPassProperties:merchantTokensResponse:fkInstitution:isBridge:completion:](PKPassDeleteHelper, "deletePaymentPassAlertCopyForPass:withAccount:paymentServiceDataProvider:transitBalanceModel:transitPassProperties:merchantTokensResponse:fkInstitution:isBridge:completion:", v22, a4, a5, a6, a7, 0, a8, v24, v27);

}

void __232__PKPassDeleteHelper_presentDeletePaymentPassAlertForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_fkInstitution_detailViewStyle_deleteHander_passLibraryDataProvider_presentingViewController___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  void *v7;
  id v8;
  id v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  v9 = a2;
  v10 = objc_msgSend(v7, "pkui_userInterfaceIdiomSupportsLargeLayouts");
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  if (a4)
  {
    PKLocalizedPaymentString(CFSTR("DELETE_CARD_SHEET_CANCEL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v14);

    v15 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("DELETE_CARD_SHEET_CONFIRM"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __232__PKPassDeleteHelper_presentDeletePaymentPassAlertForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_fkInstitution_detailViewStyle_deleteHander_passLibraryDataProvider_presentingViewController___block_invoke_2;
    v20[3] = &unk_1E3E63818;
    v25 = *(_QWORD *)(a1 + 64);
    v21 = *(id *)(a1 + 40);
    v22 = *(id *)(a1 + 48);
    v23 = *(id *)(a1 + 56);
    v24 = *(id *)(a1 + 32);
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 2, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v17);

  }
  else
  {
    PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_OK_BUTTON_TITLE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionWithTitle:style:handler:", v18, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v19);

  }
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v11, 1, 0);

}

uint64_t __232__PKPassDeleteHelper_presentDeletePaymentPassAlertForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_fkInstitution_detailViewStyle_deleteHander_passLibraryDataProvider_presentingViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 64), "deletePaymentPass:withDeleteHander:passLibraryDataProvider:presentingViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (void)presentMerchantTokenDeletePaymentPassAlertForPass:(id)a3 withAccount:(id)a4 merchantTokensResponse:(id)a5 deleteHander:(id)a6 passLibraryDataProvider:(id)a7 navigationController:(id)a8 presentingViewController:(id)a9 isBridge:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[16];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if ((objc_msgSend(v16, "hasMerchantTokens") & 1) != 0)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke;
    v25[3] = &unk_1E3E638D0;
    v26 = v22;
    v27 = v18;
    v32 = a1;
    v28 = v21;
    v29 = v16;
    v30 = v19;
    v31 = v20;
    LOBYTE(v24) = !a10;
    +[PKPassDeleteHelper deletePaymentPassAlertCopyForPass:withAccount:paymentServiceDataProvider:transitBalanceModel:transitPassProperties:merchantTokensResponse:fkInstitution:isBridge:completion:](PKPassDeleteHelper, "deletePaymentPassAlertCopyForPass:withAccount:paymentServiceDataProvider:transitBalanceModel:transitPassProperties:merchantTokensResponse:fkInstitution:isBridge:completion:", v29, v17, 0, 0, 0, v27, 0, v24, v25);

    v23 = v26;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v23, OS_LOG_TYPE_DEFAULT, "Incorrect deletePaymentPassAlert shown, this pass doesn't have any merchant tokens associated with it", buf, 2u);
    }
  }

}

void __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke(id *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  id *v20;
  id *v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v7 = a1[4];
  v8 = a3;
  v9 = a2;
  v10 = objc_msgSend(v7, "pkui_userInterfaceIdiomSupportsLargeLayouts");
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  if (!a4)
  {
    PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_OK_BUTTON_TITLE"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionWithTitle:style:handler:", v24, 0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v25);

    goto LABEL_15;
  }
  PKLocalizedPaymentString(CFSTR("DELETE_CARD_SHEET_CANCEL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, &__block_literal_global_20);
  v38 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "merchantTokens");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  v16 = MEMORY[0x1E0C809B0];
  if (v15 != 1)
  {

    goto LABEL_7;
  }
  v17 = objc_msgSend(a1[10], "hasAppleCashMerchantTokenForMerchantTokensResponse:", a1[5]);

  if (!v17)
  {
LABEL_7:
    v26 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedMerchantTokensString(CFSTR("DELETE_MERCHANT_TOKEN_CARD_SHEET_VIEW_AUTOMATIC_PAYMENTS"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v16;
    v49[1] = 3221225472;
    v49[2] = __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_6;
    v49[3] = &unk_1E3E638A8;
    v20 = &v50;
    v50 = a1[7];
    v21 = &v51;
    v51 = a1[5];
    v22 = &v52;
    v52 = a1[4];
    v53 = a1[6];
    objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 0, v49);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v53;
    goto LABEL_8;
  }
  v18 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPeerPaymentRecurringString(CFSTR("REMOVE_CARD_ALERT_BUTTON_VIEW_CASH_PAYMENTS"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v16;
  v54[1] = 3221225472;
  v54[2] = __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_3;
  v54[3] = &unk_1E3E61798;
  v20 = &v55;
  v55 = a1[5];
  v21 = &v56;
  v56 = a1[4];
  v22 = &v57;
  v57 = a1[6];
  objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, v54);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  v28 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedMerchantTokensString(CFSTR("DELETE_MERCHANT_TOKEN_CARD_SHEET_CONFIRM"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v16;
  v41 = 3221225472;
  v42 = __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_7;
  v43 = &unk_1E3E63818;
  v48 = a1[10];
  v44 = a1[7];
  v45 = a1[8];
  v46 = a1[9];
  v47 = a1[4];
  objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 2, &v40);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v31 = v30;
  else
    v31 = v23;
  if (v10)
    v32 = v23;
  else
    v32 = v30;
  objc_msgSend(v11, "addAction:", v31, v38, v40, v41, v42, v43);
  objc_msgSend(v11, "addAction:", v32);
  objc_msgSend(v11, "addAction:", v39);
  objc_msgSend(v11, "setPreferredAction:", v30);

LABEL_15:
  v33 = (void *)MEMORY[0x1E0D66A58];
  v60[0] = *MEMORY[0x1E0D69910];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *MEMORY[0x1E0D68F50];
  v58[0] = *MEMORY[0x1E0D68AA0];
  v58[1] = v35;
  v36 = *MEMORY[0x1E0D68FB0];
  v59[0] = *MEMORY[0x1E0D68C50];
  v59[1] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "subjects:sendEvent:", v34, v37);

  objc_msgSend(a1[4], "presentViewController:animated:completion:", v11, 1, 0);
}

void __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[3];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0D66A58];
  v8[0] = *MEMORY[0x1E0D69910];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0D68B18];
  v3 = *MEMORY[0x1E0D68858];
  v6[0] = *MEMORY[0x1E0D68AA0];
  v6[1] = v3;
  v4 = *MEMORY[0x1E0D688E8];
  v7[0] = v2;
  v7[1] = v4;
  v6[2] = *MEMORY[0x1E0D68F50];
  v7[2] = *MEMORY[0x1E0D68FB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "subjects:sendEvent:", v1, v5);

}

void __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_3(id *a1)
{
  void *v2;
  void *v3;
  PKMerchantTokenDetailViewController *v4;
  PKMerchantTokenDetailViewController *v5;
  _QWORD v6[4];
  id v7;
  PKMerchantTokenDetailViewController *v8;

  objc_msgSend(a1[4], "merchantTokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[PKMerchantTokenDetailViewController initWithMerchantToken:]([PKMerchantTokenDetailViewController alloc], "initWithMerchantToken:", v3);
  if (objc_msgSend(a1[5], "conformsToProtocol:", &unk_1EE5D9CA8))
    -[PKMerchantTokenDetailViewController setDelegate:](v4, "setDelegate:", a1[5]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_4;
  v6[3] = &unk_1E3E619E0;
  v7 = a1[6];
  v8 = v4;
  v5 = v4;
  -[PKMerchantTokenDetailViewController preflightWithCompletion:](v5, "preflightWithCompletion:", v6);

}

void __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_4(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_5;
  v2[3] = &unk_1E3E61388;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);
}

void __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  PKMerchantTokensViewController *v7;
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D66A58];
  v10[0] = *MEMORY[0x1E0D69910];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D68B18];
  v5 = *MEMORY[0x1E0D68858];
  v8[0] = *MEMORY[0x1E0D68AA0];
  v8[1] = v5;
  v9[0] = v4;
  v9[1] = CFSTR("learnMore");
  v8[2] = *MEMORY[0x1E0D68F50];
  v9[2] = *MEMORY[0x1E0D68FB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subjects:sendEvent:", v3, v6);

  v7 = -[PKMerchantTokensViewController initWithPass:merchantTokensResponse:]([PKMerchantTokensViewController alloc], "initWithPass:merchantTokensResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 48), "conformsToProtocol:", &unk_1EE5FF828))
    -[PKMerchantTokensViewController setDelegate:](v7, "setDelegate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "pushViewController:animated:", v7, 1);

}

uint64_t __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D66A58];
  v10[0] = *MEMORY[0x1E0D69910];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D68B18];
  v5 = *MEMORY[0x1E0D68858];
  v8[0] = *MEMORY[0x1E0D68AA0];
  v8[1] = v5;
  v9[0] = v4;
  v9[1] = CFSTR("confirmRemoveCard");
  v8[2] = *MEMORY[0x1E0D68F50];
  v9[2] = *MEMORY[0x1E0D68FB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subjects:sendEvent:", v3, v6);

  return objc_msgSend(*(id *)(a1 + 64), "deletePaymentPass:withDeleteHander:passLibraryDataProvider:presentingViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (void)deletePaymentPass:(id)a3 withDeleteHander:(id)a4 passLibraryDataProvider:(id)a5 presentingViewController:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v10 && (objc_msgSend(v10, "handleDeletePassRequestWithPass:forViewController:", v9, v12) & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(v11, "removePass:", v9);
    objc_msgSend(v12, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewControllers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      objc_msgSend(v12, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v17, "popViewControllerAnimated:", 1);

    }
    else
    {
      objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);
    }

    v13 = 0;
  }
  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D683F8], &unk_1E3FAEB18);
  v19 = objc_msgSend(v9, "hasMerchantTokens");
  v20 = (void *)MEMORY[0x1E0D66A58];
  if (v19)
  {
    v36[0] = *MEMORY[0x1E0D69910];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (uint64_t *)MEMORY[0x1E0D68928];
    if (!v13)
      v22 = (uint64_t *)MEMORY[0x1E0D68920];
    v23 = *v22;
    v24 = *MEMORY[0x1E0D68F50];
    v34[0] = *MEMORY[0x1E0D68AA0];
    v34[1] = v24;
    v25 = *MEMORY[0x1E0D68FB0];
    v35[0] = v23;
    v35[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "subjects:sendEvent:", v21, v26);
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0D66A58], "subjectToReportDashboardAnalyticsForPass:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v27 = (void *)MEMORY[0x1E0D66A58];
    v28 = (uint64_t *)MEMORY[0x1E0D68928];
    if (!v13)
      v28 = (uint64_t *)MEMORY[0x1E0D68920];
    v29 = *v28;
    v30 = *MEMORY[0x1E0D68F50];
    v32[0] = *MEMORY[0x1E0D68AA0];
    v32[1] = v30;
    v31 = *MEMORY[0x1E0D68FB0];
    v33[0] = v29;
    v33[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "subject:sendEvent:", v21, v26);
    goto LABEL_16;
  }
LABEL_17:

}

+ (BOOL)_canDeletePaymentPass:(id)a3 transitPassProperties:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  const __CFString *v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "devicePrimaryContactlessPaymentApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "state");

  v8 = 1;
  if (v7 <= 0xF && ((1 << v7) & 0x83DE) != 0 && v5 && objc_msgSend(v5, "isEnRoute"))
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Pass can not be deleted as it is en route", (uint8_t *)&v13, 2u);
    }

    v8 = 0;
  }
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v8)
      v11 = CFSTR("YES");
    v13 = 138543618;
    v14 = v11;
    v15 = 2050;
    v16 = v7;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Pass deletion allowed: %{public}@ for state: %{public}lu", (uint8_t *)&v13, 0x16u);
  }

  return v8;
}

+ (BOOL)hasAppleCashMerchantTokenForMerchantTokensResponse:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "merchantTokens", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isAppleCashPaymentToken") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

@end
