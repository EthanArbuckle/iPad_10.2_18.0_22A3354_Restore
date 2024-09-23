@implementation STLocationSharingModificationClient

- (STLocationSharingModificationClient)init
{
  STLocationSharingModificationClient *v2;
  uint64_t v3;
  STManagementState *managementState;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STLocationSharingModificationClient;
  v2 = -[STLocationSharingModificationClient init](&v6, sel_init);
  v3 = objc_opt_new();
  managementState = v2->_managementState;
  v2->_managementState = (STManagementState *)v3;

  return v2;
}

- (void)isLocationSharingModificationAllowedForUserID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[STLocationSharingModificationClient managementState](self, "managementState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dsid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __103__STLocationSharingModificationClient_isLocationSharingModificationAllowedForUserID_completionHandler___block_invoke;
  v11[3] = &unk_1E9371E80;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "isLocationSharingModificationAllowedForDSID:completionHandler:", v9, v11);

}

void __103__STLocationSharingModificationClient_isLocationSharingModificationAllowedForUserID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
    (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, objc_msgSend(a2, "BOOLValue"), a3);
  else
    (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, 1, a3);

}

- (void)setLocationSharingModificationAllowed:(BOOL)a3 forUserID:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  -[STLocationSharingModificationClient managementState](self, "managementState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dsid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __105__STLocationSharingModificationClient_setLocationSharingModificationAllowed_forUserID_completionHandler___block_invoke;
  v13[3] = &unk_1E9370BE0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v10, "setLocationSharingModificationAllowed:forDSID:completionHandler:", v6, v11, v13);

}

uint64_t __105__STLocationSharingModificationClient_setLocationSharingModificationAllowed_forUserID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (STManagementState)managementState
{
  return (STManagementState *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managementState, 0);
}

@end
