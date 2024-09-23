@implementation PKIdentityAuthorizationController

- (PKIdentityAuthorizationController)init
{
  PKIdentityAuthorizationController *v2;
  NSObject *v3;
  DIIdentityAuthorizationController *v4;
  DIIdentityAuthorizationController *wrapped;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKIdentityAuthorizationController;
  v2 = -[PKIdentityAuthorizationController init](&v8, sel_init);
  PKLogFacilityTypeGetObject(0x1DuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController init", v7, 2u);
  }

  v4 = (DIIdentityAuthorizationController *)objc_alloc_init(MEMORY[0x1E0D169F8]);
  wrapped = v2->_wrapped;
  v2->_wrapped = v4;

  return v2;
}

- (void)checkCanRequestDocument:(id)descriptor completion:(void *)completion
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  DIIdentityAuthorizationController *wrapped;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v6 = descriptor;
  v7 = completion;
  PKLogFacilityTypeGetObject(0x1DuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController checkCanRequestDocument", buf, 2u);
  }

  DIIdentityDocumentDescriptorFromPKIdentityDocumentDescriptor(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    wrapped = self->_wrapped;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__PKIdentityAuthorizationController_checkCanRequestDocument_completion___block_invoke;
    v11[3] = &unk_1E2ABDDB0;
    v11[4] = self;
    v12 = v7;
    -[DIIdentityAuthorizationController checkCanRequestDocument:completion:](wrapped, "checkCanRequestDocument:completion:", v9, v11);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController checkCanRequestDocument cannot convert descriptor to underlying representation", buf, 2u);
    }

    (*((void (**)(void *, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __72__PKIdentityAuthorizationController_checkCanRequestDocument_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)requestDocument:(PKIdentityRequest *)request completion:(void *)completion
{
  PKIdentityRequest *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  DIIdentityAuthorizationController *wrapped;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v6 = request;
  v7 = completion;
  PKLogFacilityTypeGetObject(0x1DuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController requestDocumemnt", buf, 2u);
  }

  -[PKIdentityRequest asDIIdentityRequest](v6, "asDIIdentityRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  wrapped = self->_wrapped;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__PKIdentityAuthorizationController_requestDocument_completion___block_invoke;
  v12[3] = &unk_1E2AD3508;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  -[DIIdentityAuthorizationController requestDocument:completion:](wrapped, "requestDocument:completion:", v9, v12);

}

void __64__PKIdentityAuthorizationController_requestDocument_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  PKIdentityDocument *v8;
  NSObject *v9;
  void (*v10)(void);
  NSObject *v11;
  uint64_t v12;
  int v13;
  PKIdentityDocument *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    PKIdentityErrorFromDIIdentityError(v6);
    v8 = (PKIdentityDocument *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x1DuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController requestDocument returning error %@", (uint8_t *)&v13, 0xCu);
    }
LABEL_8:

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_9;
  }
  if (v5)
  {
    v8 = -[PKIdentityDocument initWithDIIdentityDocument:]([PKIdentityDocument alloc], "initWithDIIdentityDocument:", v5);
    PKLogFacilityTypeGetObject(0x1DuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController requestDocument returning successfully", (uint8_t *)&v13, 2u);
    }
    goto LABEL_8;
  }
  PKLogFacilityTypeGetObject(0x1DuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController requestDocument returned document is nil", (uint8_t *)&v13, 2u);
  }

  v12 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKIdentityErrorDomain"), 0, 0);
  v8 = (PKIdentityDocument *)objc_claimAutoreleasedReturnValue();
  v10 = *(void (**)(void))(v12 + 16);
LABEL_9:
  v10();

}

- (void)cancelRequest
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(0x1DuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKIdentityAuthorizationController cancelRequest", v4, 2u);
  }

  -[DIIdentityAuthorizationController cancelRequest](self->_wrapped, "cancelRequest");
}

- (DIIdentityAuthorizationController)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(id)a3
{
  objc_storeStrong((id *)&self->_wrapped, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapped, 0);
}

@end
