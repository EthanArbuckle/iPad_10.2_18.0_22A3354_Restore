@implementation PKPassSnapshotCoordinator

- (PKPassSnapshotCoordinator)initWithSEIDs:(id)a3
{
  id v5;
  PKPassSnapshotCoordinator *v6;
  PKPassSnapshotCoordinator *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *backgroundQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassSnapshotCoordinator;
  v6 = -[PKPassSnapshotCoordinator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_secureElementIdentifiers, a3);
    v8 = dispatch_queue_create("com.apple.passkitui.snapshotCoordinator", 0);
    backgroundQueue = v7->_backgroundQueue;
    v7->_backgroundQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (id)cardSnapshotForSource:(id)a3 withSize:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CGImageRef v18;
  CGImage *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "passSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v9, "credential");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isIssuerProvisioningExtensionCredential"))
    {
      objc_msgSend(v14, "issuerProvisioningExtensionCredential");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "entry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_retainAutorelease(v16);
      v18 = CGImageRetain((CGImageRef)objc_msgSend(v17, "art"));
      if (v18)
      {
        v19 = v18;
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v18);
        CGImageRelease(v19);
        objc_msgSend(v9, "setPassSnapshot:", v20);
        v12 = v20;

        v13 = v12;
LABEL_14:

        goto LABEL_15;
      }

    }
    objc_msgSend(v14, "underlyingPaymentPass");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isSnapshotFetchInProgress") & 1) == 0)
    {
      if ((objc_msgSend(v21, "remoteAssetsDownloadedForSEIDs:", self->_secureElementIdentifiers) & 1) != 0
        || objc_msgSend(v14, "isLocalAppletSubcredentialPassCredential"))
      {
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __71__PKPassSnapshotCoordinator_cardSnapshotForSource_withSize_completion___block_invoke;
        v33[3] = &unk_1E3E65930;
        v22 = v9;
        v34 = v22;
        v35 = v10;
        -[PKPassSnapshotCoordinator _createPassSnapshotFromPaymentPass:withSize:completion:](self, "_createPassSnapshotFromPaymentPass:withSize:completion:", v21, v33, width, height);
        objc_msgSend(v22, "setIsSnapshotFetchInProgress:", 1);

        v23 = v34;
      }
      else
      {
        objc_msgSend(v14, "purchasedProductCredential");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v25;
        if (v25)
        {
          objc_msgSend(v25, "product");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __71__PKPassSnapshotCoordinator_cardSnapshotForSource_withSize_completion___block_invoke_2;
          v29[3] = &unk_1E3E764E8;
          v27 = v9;
          v30 = v27;
          v31 = 0;
          v32 = v10;
          objc_msgSend(v26, "thumbnailCachedImageForSize:completion:", v29, width, height);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v27, "setPassSnapshot:", v13);
            v28 = v13;
          }
          else
          {
            objc_msgSend(v27, "setIsSnapshotFetchInProgress:", 1);
          }

          if (v13)
          {

            goto LABEL_13;
          }
        }
      }

    }
    -[PKPassSnapshotCoordinator _fallbackImageForCredential:](self, "_fallbackImageForCredential:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

    v12 = 0;
    goto LABEL_14;
  }
  v12 = v11;
  v13 = v12;
LABEL_15:

  return v13;
}

void __71__PKPassSnapshotCoordinator_cardSnapshotForSource_withSize_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setPassSnapshot:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setIsSnapshotFetchInProgress:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __71__PKPassSnapshotCoordinator_cardSnapshotForSource_withSize_completion___block_invoke_2(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;

  if (a3)
  {
    if (a2)
    {
      v3 = result;
      objc_msgSend(*(id *)(result + 32), "setPassSnapshot:", *(_QWORD *)(result + 40));
      objc_msgSend(*(id *)(v3 + 32), "setIsSnapshotFetchInProgress:", 0);
      return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 48) + 16))();
    }
  }
  return result;
}

- (void)_createPassSnapshotFromPaymentPass:(id)a3 withSize:(CGSize)a4 completion:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  NSObject *backgroundQueue;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[3];
  id location[2];

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  if (v10)
  {
    if (v9)
    {
      objc_initWeak(location, self);
      backgroundQueue = self->_backgroundQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __84__PKPassSnapshotCoordinator__createPassSnapshotFromPaymentPass_withSize_completion___block_invoke;
      block[3] = &unk_1E3E79300;
      v14 = v9;
      objc_copyWeak(v16, location);
      v16[1] = *(id *)&width;
      v16[2] = *(id *)&height;
      v15 = v10;
      dispatch_async(backgroundQueue, block);

      objc_destroyWeak(v16);
      objc_destroyWeak(location);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "No payment pass to generate snapshot", (uint8_t *)location, 2u);
      }

      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

}

void __84__PKPassSnapshotCoordinator__createPassSnapshotFromPaymentPass_withSize_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  __int128 v7;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__PKPassSnapshotCoordinator__createPassSnapshotFromPaymentPass_withSize_completion___block_invoke_2;
  v3[3] = &unk_1E3E6F918;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "loadImageSetAsync:preheat:withCompletion:", 0, 1, v3);

  objc_destroyWeak(&v6);
}

void __84__PKPassSnapshotCoordinator__createPassSnapshotFromPaymentPass_withSize_completion___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;
  __int128 v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PKPassSnapshotCoordinator__createPassSnapshotFromPaymentPass_withSize_completion___block_invoke_3;
  block[3] = &unk_1E3E6F918;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v3 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v5);
}

void __84__PKPassSnapshotCoordinator__createPassSnapshotFromPaymentPass_withSize_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  PKPassView *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", *(_QWORD *)(a1 + 32), 3, 4087);
    -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v3, "snapshotOfFrontFaceWithRequestedSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    WeakRetained = v5;
  }

}

- (id)_fallbackImageForCredential:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  uint64_t v8;

  v3 = a3;
  if (!objc_msgSend(v3, "isAccountCredential"))
  {
    v8 = objc_msgSend(v3, "credentialType");

    if (v8 == 301)
    {
      v7 = CFSTR("PendingCarKeyCardArt_Small");
      return PKUIImageNamed(v7);
    }
LABEL_6:
    v7 = CFSTR("PlaceholderCardArt_Small");
    return PKUIImageNamed(v7);
  }
  objc_msgSend(v3, "accountCredential");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "feature");

  if (v6 >= 5)
    goto LABEL_6;
  v7 = off_1E3E79320[v6];
  return PKUIImageNamed(v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifiers, 0);
}

@end
