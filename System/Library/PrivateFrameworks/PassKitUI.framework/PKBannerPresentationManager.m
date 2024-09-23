@implementation PKBannerPresentationManager

- (id)_source
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0D01070], "bannerSourceForDestination:forRequesterIdentifier:", *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 24));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v3;

    objc_msgSend(*(id *)(a1 + 32), "setDelegate:", a1);
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 8);
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 134218240;
      v10 = v6;
      v11 = 2048;
      v12 = v7;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKBannerPresentationManager (%lld): source created %p.", (uint8_t *)&v9, 0x16u);
    }

    v2 = *(void **)(a1 + 32);
  }
  return v2;
}

+ (id)_managerForDestination:(int64_t)a3 withProvider:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id result;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;

  v5 = a4;
  if (a3 || !v5)
  {
    __break(1u);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PKBannerPresentationManager__managerForDestination_withProvider___block_invoke;
    block[3] = &unk_1E3E62010;
    v19 = 0;
    a3 = (int64_t)v5;
    v18 = (id)a3;
    if (_MergedGlobals_685 == -1)
      goto LABEL_4;
  }
  dispatch_once(&_MergedGlobals_685, block);
LABEL_4:
  if (!qword_1ED06C800)
  {
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend((id)qword_1ED06C800, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == (void *)a3)
  {
    v7 = (void *)qword_1ED06C800;
LABEL_8:
    v8 = v7;

    return v8;
  }
  v10 = (void *)MEMORY[0x1E0C99DA0];
  v11 = *MEMORY[0x1E0C99768];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ED06C800, "provider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "raise:format:", v11, CFSTR("PKBannerPresentationManager: cannot register provider %@ for destination %ld - already registered provider %@ previously."), v13, 0, v16);

  __break(1u);
  return result;
}

void __67__PKBannerPresentationManager__managerForDestination_withProvider___block_invoke(uint64_t a1)
{
  PKBannerPresentationManager *v2;
  void *v3;
  int64_t v4;
  id v5;
  PKBannerPresentationManager *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *requesterIdentifier;
  void *v11;
  objc_super v12;

  v2 = [PKBannerPresentationManager alloc];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  if (v2)
  {
    v12.receiver = v2;
    v12.super_class = (Class)PKBannerPresentationManager;
    v6 = (PKBannerPresentationManager *)objc_msgSendSuper2(&v12, sel_init);
    v2 = v6;
    if (v6)
    {
      v6->_destination = v4;
      objc_storeStrong((id *)&v6->_provider, v3);
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      requesterIdentifier = v2->_requesterIdentifier;
      v2->_requesterIdentifier = (NSString *)v9;

    }
  }

  v11 = (void *)qword_1ED06C800;
  qword_1ED06C800 = (uint64_t)v2;

}

- (PKBannerPresentationManager)init
{

  return 0;
}

- (id)_createPresentableWithConfiguration:(id)a3
{
  id v4;
  PKBannerPresentable *v5;
  PKBannerPresentationManager *v6;
  id result;
  id v8;
  PKBannerPresentationManager *v9;
  uint64_t v10;
  id factory;
  uint64_t v12;
  id didStartHandler;
  uint64_t v14;
  id didFinishHandler;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *requestIdentifier;
  objc_super v20;

  v4 = a3;
  v5 = [PKBannerPresentable alloc];
  v6 = self;
  result = v4;
  v8 = result;
  if (!v5)
    goto LABEL_5;
  if (v6)
  {
    v20.receiver = v5;
    v20.super_class = (Class)PKBannerPresentable;
    v9 = -[PKBannerPresentationManager init](&v20, sel_init);
    v5 = (PKBannerPresentable *)v9;
    if (v9)
    {
      v9->_destination = (int64_t)v6;
      objc_msgSend(v8, "factory");
      v10 = objc_claimAutoreleasedReturnValue();
      factory = v5->_factory;
      v5->_factory = (id)v10;

      objc_msgSend(v8, "didStartHandler");
      v12 = objc_claimAutoreleasedReturnValue();
      didStartHandler = v5->_didStartHandler;
      v5->_didStartHandler = (id)v12;

      objc_msgSend(v8, "didFinishHandler");
      v14 = objc_claimAutoreleasedReturnValue();
      didFinishHandler = v5->_didFinishHandler;
      v5->_didFinishHandler = (id)v14;

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      requestIdentifier = v5->_requestIdentifier;
      v5->_requestIdentifier = (NSString *)v18;

    }
LABEL_5:

    return v5;
  }
  __break(1u);
  return result;
}

- (void)_displayBanner
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  const void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  int v50;
  id v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[2];
  uint64_t (*v57)(uint64_t);
  void *v58;
  _QWORD *v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint8_t v64[4];
  id v65;
  __int16 v66;
  id v67;
  _BYTE buf[24];
  void *v69;
  id v70;
  _QWORD *v71;
  uint64_t v72;
  CGSize v73;
  CGSize v74;
  CGSize v75;

  v72 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a1[5];
    v3 = (void *)a1[2];
    if (v2)
    {
      if (!objc_msgSend(v3, "shouldRevokeCurrentRequestForManager:", a1))
        return;
      v4 = a1[5];
      if (v4)
        v5 = *(id *)(v4 + 8);
      else
        v5 = 0;
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = a1[1];
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v5;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKBannerPresentationManager (%lld): revoking current presentable %p as requested by provider.", buf, 0x16u);
      }

      objc_msgSend(v5, "revoke");
      goto LABEL_18;
    }
    objc_msgSend(v3, "nextRequestForManager:", a1);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)a1[5];
    a1[5] = v8;

    v10 = a1[5];
    if (!v10)
      return;
    v11 = *(id *)(v10 + 8);
    if (!v11 || (v5 = v11, *((_QWORD **)v11 + 1) != a1))
      __break(1u);
    v12 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v57 = __45__PKBannerPresentationManager__displayBanner__block_invoke;
    v58 = &unk_1E3E775F0;
    v59 = a1;
    v13 = v56;
    if (*((_BYTE *)v5 + 24) || *((_BYTE *)v5 + 25))
    {
      PKLogFacilityTypeGetObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v5;
        _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): error - reused presentable.", buf, 0xCu);
      }

      ((void (*)(_QWORD *, id, _QWORD))v57)(v13, v5, 0);
      goto LABEL_17;
    }
    *((_BYTE *)v5 + 24) = 1;
    v15 = _Block_copy(*((const void **)v5 + 7));
    *(_QWORD *)buf = v12;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __43__PKBannerPresentable__postWithCompletion___block_invoke;
    v69 = &unk_1E3E775C8;
    v16 = v15;
    v70 = v16;
    v71 = v13;
    v17 = _Block_copy(buf);
    v18 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v17;

    v19 = -[PKBannerPresentationManager _source](*((_QWORD *)v5 + 1));
    v20 = (const void *)*((_QWORD *)v5 + 4);
    if (!v20)
    {
      PKLogFacilityTypeGetObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v64 = 134217984;
        v65 = v5;
        _os_log_impl(&dword_19D178000, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): error - missing view controller factory.", v64, 0xCu);
      }
      v23 = 0;
LABEL_33:

      v31 = (void *)*((_QWORD *)v5 + 5);
      if (v31)
      {
        objc_msgSend(v23, "presentationSize");
        v33 = v32;
        v35 = v34;
        objc_msgSend(v23, "containerSize");
        objc_msgSend(v31, "preferredContentSizeWithPresentationSize:containerSize:", v33, v35, v36, v37);
        v39 = v38;
        v41 = v40;
        objc_msgSend(*((id *)v5 + 5), "preferredContentSize");
        v43 = v42;
        v45 = v44;
        PKLogFacilityTypeGetObject();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG);
        if (v43 == v39 && v45 == v41)
        {
          if (v47)
          {
            v74.width = v43;
            v74.height = v45;
            NSStringFromCGSize(v74);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v64 = 134218242;
            v65 = v5;
            v66 = 2112;
            v67 = v54;
            _os_log_debug_impl(&dword_19D178000, v46, OS_LOG_TYPE_DEBUG, "PKBannerPresentable (%p): using existing preferred content size - %@.", v64, 0x16u);

          }
        }
        else
        {
          if (v47)
          {
            v75.width = v39;
            v75.height = v41;
            NSStringFromCGSize(v75);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v64 = 134218242;
            v65 = v5;
            v66 = 2112;
            v67 = v55;
            _os_log_debug_impl(&dword_19D178000, v46, OS_LOG_TYPE_DEBUG, "PKBannerPresentable (%p): overriding preferred content size - %@.", v64, 0x16u);

          }
          objc_msgSend(*((id *)v5 + 5), "setPreferredContentSize:", v39, v41);
        }
        objc_msgSend(*((id *)v5 + 5), "setPresentable:", v5);
        if (*((_BYTE *)v5 + 25))
        {
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v64 = 134217984;
            v65 = v5;
            _os_log_impl(&dword_19D178000, v46, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): revoked before posting.", v64, 0xCu);
          }

          goto LABEL_63;
        }
        if (v39 > 0.0 && v41 > 0.0 || (SBSIsSystemApertureAvailable() & 1) != 0)
        {
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            v48 = (void *)*((_QWORD *)v5 + 5);
            *(_DWORD *)v64 = 134218240;
            v65 = v5;
            v66 = 2048;
            v67 = v48;
            _os_log_impl(&dword_19D178000, v46, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): posting with %p...", v64, 0x16u);
          }

          v62 = *MEMORY[0x1E0DACA38];
          v63 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = 0;
          v50 = objc_msgSend(v19, "postPresentable:options:userInfo:error:", v5, 1, v49, &v60);
          v51 = v60;

          v52 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
          if (v50)
          {
            if (v52)
            {
              *(_DWORD *)v64 = 134217984;
              v65 = v5;
              _os_log_impl(&dword_19D178000, v46, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): posted.", v64, 0xCu);
            }

            *((_BYTE *)v5 + 26) = 1;
          }
          else
          {
            if (v52)
            {
              *(_DWORD *)v64 = 134218242;
              v65 = v5;
              v66 = 2112;
              v67 = v51;
              _os_log_impl(&dword_19D178000, v46, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): failed to post - %@.", v64, 0x16u);
            }

            -[PKBannerPresentable _revoke]((uint64_t)v5);
          }

          goto LABEL_63;
        }
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v73.width = v39;
          v73.height = v41;
          NSStringFromCGSize(v73);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v64 = 134218242;
          v65 = v5;
          v66 = 2112;
          v67 = v53;
          _os_log_impl(&dword_19D178000, v46, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): invalid size %@ requested.", v64, 0x16u);

        }
      }
      -[PKBannerPresentable _revoke]((uint64_t)v5);
LABEL_63:

LABEL_17:
LABEL_18:

      return;
    }
    v21 = (uint64_t)_Block_copy(v20);
    v22 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = 0;

    v61 = 0;
    objc_msgSend(v19, "layoutDescriptionWithError:", &v61);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v61;
    if (v23)
    {
      v25 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v21 + 16))(v21, objc_msgSend(v19, "destination"), v23);
      v26 = (void *)*((_QWORD *)v5 + 5);
      *((_QWORD *)v5 + 5) = v25;

      if (*((_QWORD *)v5 + 5))
      {
LABEL_32:

        goto LABEL_33;
      }
      PKLogFacilityTypeGetObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v64 = 134217984;
        v65 = v5;
        v28 = "PKBannerPresentable (%p): error - missing view controller.";
        v29 = v27;
        v30 = 12;
LABEL_30:
        _os_log_impl(&dword_19D178000, v29, OS_LOG_TYPE_DEFAULT, v28, v64, v30);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v64 = 134218242;
        v65 = v5;
        v66 = 2112;
        v67 = v24;
        v28 = "PKBannerPresentable (%p): error - missing layout description - %@.";
        v29 = v27;
        v30 = 22;
        goto LABEL_30;
      }
    }

    goto LABEL_32;
  }
}

- (id)_currentRequest
{
  return self->_request;
}

uint64_t __45__PKBannerPresentationManager__displayBanner__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return -[PKBannerPresentationManager _displayBanner](*(_QWORD *)(a1 + 32));
}

- (void)bannerSourceDidInvalidate:(id)a3
{
  NSObject *v4;
  int64_t destination;
  _QWORD block[5];
  uint8_t buf[4];
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    destination = self->_destination;
    *(_DWORD *)buf = 134217984;
    v8 = destination;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "PKBannerPresentationManager (%lld): source invalidated.", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PKBannerPresentationManager_bannerSourceDidInvalidate___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __57__PKBannerPresentationManager_bannerSourceDidInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v4)
    -[PKBannerPresentable _revoke](*(_QWORD *)(v4 + 8));
}

- (id)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_requesterIdentifier, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
