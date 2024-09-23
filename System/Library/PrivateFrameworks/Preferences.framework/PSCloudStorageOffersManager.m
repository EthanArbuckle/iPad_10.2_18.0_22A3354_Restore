@implementation PSCloudStorageOffersManager

- (void)_setupFlowWithNavigationController:(id)a3 modally:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_class *v8;
  CommerceRemoteUIDelegate *v9;
  CommerceRemoteUIDelegate *commerceDelegate;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a4;
  v6 = a3;
  -[PSCloudStorageOffersManager cancelLoad](self, "cancelLoad");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v7 = (void *)getCommerceRemoteUIDelegateClass_softClass;
  v15 = getCommerceRemoteUIDelegateClass_softClass;
  if (!getCommerceRemoteUIDelegateClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getCommerceRemoteUIDelegateClass_block_invoke;
    v11[3] = &unk_1E4A65650;
    v11[4] = &v12;
    __getCommerceRemoteUIDelegateClass_block_invoke((uint64_t)v11);
    v7 = (void *)v13[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v12, 8);
  v9 = (CommerceRemoteUIDelegate *)objc_msgSend([v8 alloc], "initWithNavigationController:needsModalPresentation:", v6, v4);
  commerceDelegate = self->_commerceDelegate;
  self->_commerceDelegate = v9;

  -[CommerceRemoteUIDelegate setDelegate:](self->_commerceDelegate, "setDelegate:", self);
  -[CommerceRemoteUIDelegate setShouldOfferFamilySharePlansOnly:](self->_commerceDelegate, "setShouldOfferFamilySharePlansOnly:", -[PSCloudStorageOffersManager shouldOfferFamilySharePlansOnly](self, "shouldOfferFamilySharePlansOnly"));
  -[CommerceRemoteUIDelegate setShouldOfferDeviceOffers:](self->_commerceDelegate, "setShouldOfferDeviceOffers:", -[PSCloudStorageOffersManager shouldOfferDeviceOffers](self, "shouldOfferDeviceOffers"));
  -[CommerceRemoteUIDelegate setSkipRetryWithoutToken:](self->_commerceDelegate, "setSkipRetryWithoutToken:", -[PSCloudStorageOffersManager skipRetryWithoutToken](self, "skipRetryWithoutToken"));
  -[CommerceRemoteUIDelegate setSkipCompletionAlert:](self->_commerceDelegate, "setSkipCompletionAlert:", -[PSCloudStorageOffersManager skipCompletionAlert](self, "skipCompletionAlert"));
  -[CommerceRemoteUIDelegate setSupportsModernAlerts:](self->_commerceDelegate, "setSupportsModernAlerts:", -[PSCloudStorageOffersManager supportsModernAlerts](self, "supportsModernAlerts"));

}

- (void)beginFlowWithNavigationController:(id)a3 modally:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CommerceRemoteUIDelegate *commerceDelegate;
  _QWORD *v8;
  _Unwind_Exception *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a4;
  v6 = a3;
  -[PSCloudStorageOffersManager _setupFlowWithNavigationController:modally:](self, "_setupFlowWithNavigationController:modally:", v6, v4);
  commerceDelegate = self->_commerceDelegate;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v8 = (_QWORD *)getCommerceOffersSymbolLoc_ptr;
  v14 = getCommerceOffersSymbolLoc_ptr;
  if (!getCommerceOffersSymbolLoc_ptr)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getCommerceOffersSymbolLoc_block_invoke;
    v10[3] = &unk_1E4A65650;
    v10[4] = &v11;
    __getCommerceOffersSymbolLoc_block_invoke((uint64_t)v10);
    v8 = (_QWORD *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v8)
  {
    v9 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v9);
  }
  -[CommerceRemoteUIDelegate loadURLforKey:](commerceDelegate, "loadURLforKey:", *v8);

}

- (void)beginFlowWithNavigationController:(id)a3 purchaseToken:(id)a4 buyParameters:(id)a5 requestHeaders:(id)a6 modally:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  -[PSCloudStorageOffersManager _setupFlowWithNavigationController:modally:](self, "_setupFlowWithNavigationController:modally:", a3, v7);
  -[CommerceRemoteUIDelegate purchaseWithToken:buyParameters:requestHeaders:](self->_commerceDelegate, "purchaseWithToken:buyParameters:requestHeaders:", v14, v13, v12);

}

- (void)cancelLoad
{
  CommerceRemoteUIDelegate *commerceDelegate;

  -[CommerceRemoteUIDelegate cancelRemoteUI](self->_commerceDelegate, "cancelRemoteUI");
  commerceDelegate = self->_commerceDelegate;
  self->_commerceDelegate = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[CommerceRemoteUIDelegate cancelRemoteUI](self->_commerceDelegate, "cancelRemoteUI");
  v3.receiver = self;
  v3.super_class = (Class)PSCloudStorageOffersManager;
  -[PSCloudStorageOffersManager dealloc](&v3, sel_dealloc);
}

- (void)commerceDelegate:(id)a3 willPresentObjectModel:(id)a4 page:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  id WeakRetained;
  char v31;
  id v32;
  id v33;
  id v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  PSCloudStorageOffersManager *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v39 = a5;
  if (-[PSCloudStorageOffersManager requiredStorageThreshold](self, "requiredStorageThreshold"))
  {
    v40 = self;
    v33 = v9;
    v34 = v8;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v39, "tableViewOM");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v11;
    v37 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    v12 = 0;
    if (v37)
    {
      v36 = *(_QWORD *)v46;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v46 != v36)
            objc_enumerationMutation(obj);
          v38 = v13;
          v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v13);
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v14, "rows");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v42 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
                objc_msgSend(v20, "attributes");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("totalStorage"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (v23 = strtoull((const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"), 0, 0),
                      v23 < -[PSCloudStorageOffersManager requiredStorageThreshold](v40, "requiredStorageThreshold")))
                {
                  objc_msgSend(v20, "setEnabled:", 0);
                  if (objc_msgSend(v20, "isSelected"))
                  {
                    objc_msgSend(v20, "attributes");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("radioGroup"));
                    v25 = objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v20, "setSelected:", 0);
                    v12 = (void *)v25;
                  }
                }
                else
                {
                  objc_msgSend(v20, "attributes");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("radioGroup"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v27, "isEqualToString:", v12);

                  if (v28)
                  {
                    objc_msgSend(v39, "tableViewOM");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setSelectedRadioGroupRow:", v20);

                    v12 = 0;
                  }
                }

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            }
            while (v17);
          }

          v13 = v38 + 1;
        }
        while (v38 + 1 != v37);
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v37);
    }

    v9 = v33;
    v8 = v34;
    self = v40;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v31 = objc_opt_respondsToSelector();

  if ((v31 & 1) != 0)
  {
    v32 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v32, "manager:willPresentViewController:", self, v39);

  }
}

- (void)commerceDelegate:(id)a3 loadDidFailWithError:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  NSLog(CFSTR("Error loading commerce pane: %@"), v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "manager:loadDidFailWithError:", self, v8);

  }
}

- (void)commerceDelegateDidCancel:(id)a3
{
  PSCloudStorageOffersManagerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v9[16];
  uint8_t buf[16];

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  _PSLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "calling delegate managerDidCancel:", buf, 2u);
    }

    v7 = objc_loadWeakRetained((id *)p_delegate);
    -[NSObject managerDidCancel:](v7, "managerDidCancel:", self);
  }
  else if (v8)
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "client did not implement managerDidCancel: -- will not be notified", v9, 2u);
  }

}

- (void)commerceDelegate:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  _PSLoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) != 0)
  {
    if (v11)
    {
      v13 = 138543362;
      v14 = v7;
      _os_log_impl(&dword_1A3819000, v10, OS_LOG_TYPE_DEFAULT, "calling delegate manager:didCompleteWithError:%{public}@", (uint8_t *)&v13, 0xCu);
    }

    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "manager:didCompleteWithError:", self, v7);

  }
  else
  {
    if (v11)
    {
      v13 = 138543362;
      v14 = v7;
      _os_log_impl(&dword_1A3819000, v10, OS_LOG_TYPE_DEFAULT, "client did not implement manager:didCompleteWithError: (error:%{public}@)", (uint8_t *)&v13, 0xCu);
    }

    -[PSCloudStorageOffersManager commerceDelegateDidCancel:](self, "commerceDelegateDidCancel:", v6);
  }

}

- (PSCloudStorageOffersManagerDelegate)delegate
{
  return (PSCloudStorageOffersManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)requiredStorageThreshold
{
  return self->_requiredStorageThreshold;
}

- (void)setRequiredStorageThreshold:(unint64_t)a3
{
  self->_requiredStorageThreshold = a3;
}

- (BOOL)shouldOfferFamilySharePlansOnly
{
  return self->_shouldOfferFamilySharePlansOnly;
}

- (void)setShouldOfferFamilySharePlansOnly:(BOOL)a3
{
  self->_shouldOfferFamilySharePlansOnly = a3;
}

- (BOOL)shouldOfferDeviceOffers
{
  return self->_shouldOfferDeviceOffers;
}

- (void)setShouldOfferDeviceOffers:(BOOL)a3
{
  self->_shouldOfferDeviceOffers = a3;
}

- (BOOL)skipRetryWithoutToken
{
  return self->_skipRetryWithoutToken;
}

- (void)setSkipRetryWithoutToken:(BOOL)a3
{
  self->_skipRetryWithoutToken = a3;
}

- (BOOL)skipCompletionAlert
{
  return self->_skipCompletionAlert;
}

- (void)setSkipCompletionAlert:(BOOL)a3
{
  self->_skipCompletionAlert = a3;
}

- (BOOL)supportsModernAlerts
{
  return self->_supportsModernAlerts;
}

- (void)setSupportsModernAlerts:(BOOL)a3
{
  self->_supportsModernAlerts = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_commerceDelegate, 0);
}

@end
