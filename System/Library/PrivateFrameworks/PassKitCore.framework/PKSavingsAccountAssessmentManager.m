@implementation PKSavingsAccountAssessmentManager

- (PKSavingsAccountAssessmentManager)initWithType:(int64_t)a3
{
  PKSavingsAccountAssessmentManager *v4;
  PKSavingsAccountAssessmentManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKSavingsAccountAssessmentManager;
  v4 = -[PKSavingsAccountAssessmentManager init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    -[PKSavingsAccountAssessmentManager _restartODIAssessment](v4, "_restartODIAssessment");
  }
  return v5;
}

- (void)updateAssessmentType:(int64_t)a3
{
  self->_type = a3;
  -[PKSavingsAccountAssessmentManager provideSessionFeedbackDiscarded](self, "provideSessionFeedbackDiscarded");
  -[PKSavingsAccountAssessmentManager _restartODIAssessment](self, "_restartODIAssessment");
}

- (void)waitForAssessmentWithCompletion:(id)a3
{
  id v4;
  PKODIServiceProviderAssessment *odiServiceProviderAssessment;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  odiServiceProviderAssessment = self->_odiServiceProviderAssessment;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PKSavingsAccountAssessmentManager_waitForAssessmentWithCompletion___block_invoke;
  v7[3] = &unk_1E2AD44C8;
  v8 = v4;
  v6 = v4;
  -[PKODIAssessment waitForAssessmentWithContinueBlock:](odiServiceProviderAssessment, "waitForAssessmentWithContinueBlock:", v7);

}

void __69__PKSavingsAccountAssessmentManager_waitForAssessmentWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PKSavingsAccountAssessmentManager_waitForAssessmentWithCompletion___block_invoke_2;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __69__PKSavingsAccountAssessmentManager_waitForAssessmentWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)provideSessionFeedbackDiscarded
{
  -[PKODIAssessment provideSessionFeedback:](self->_odiServiceProviderAssessment, "provideSessionFeedback:", 1);
}

- (void)provideSessionFeedbackIngested
{
  -[PKODIAssessment provideSessionFeedback:](self->_odiServiceProviderAssessment, "provideSessionFeedback:", 0);
}

- (int64_t)type
{
  return self->_type;
}

- (void)_restartODIAssessment
{
  void *v3;
  void *v4;
  char v5;
  PKODIServiceProviderAssessment *v6;
  void *v7;
  PKODIServiceProviderAssessment *v8;
  PKODIServiceProviderAssessment *odiServiceProviderAssessment;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;

  -[PKSavingsAccountAssessmentManager _serviceProviderIdentifierForAssessmentType](self, "_serviceProviderIdentifierForAssessmentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v21 = v3;
    -[PKODIServiceProviderAssessment serviceIdentifier](self->_odiServiceProviderAssessment, "serviceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v21, "isEqualToString:", v4);

    v3 = v21;
    if ((v5 & 1) == 0)
    {
      v6 = [PKODIServiceProviderAssessment alloc];
      PKPassKitCoreBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PKODIServiceProviderAssessment initWithServiceProviderIdentifier:locationBundle:](v6, "initWithServiceProviderIdentifier:locationBundle:", v21, v7);
      odiServiceProviderAssessment = self->_odiServiceProviderAssessment;
      self->_odiServiceProviderAssessment = v8;

      -[PKODIAssessment startAssessment](self->_odiServiceProviderAssessment, "startAssessment");
      +[PKAppleAccountManager sharedInstance](PKAppleAccountManager, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appleAccountInformation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      +[PKAppleAccountManager sharedInstance](PKAppleAccountManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appleAccountInformation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "aaDSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "firstName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "primaryEmailAddress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v19 = v18;
      if (v14)
        objc_msgSend(v18, "setObject:forKey:", v14, *MEMORY[0x1E0D176A0]);
      if (v15)
        objc_msgSend(v19, "setObject:forKey:", v15, *MEMORY[0x1E0D17698]);
      if (v16)
        objc_msgSend(v19, "setObject:forKey:", v16, *MEMORY[0x1E0D176B8]);
      if (v17)
        objc_msgSend(v19, "setObject:forKey:", v17, *MEMORY[0x1E0D17688]);
      v20 = objc_alloc_init(MEMORY[0x1E0D17580]);
      objc_msgSend(v20, "setAttributes:", v19);
      -[PKODIAssessment updateAssessment:](self->_odiServiceProviderAssessment, "updateAssessment:", v20);
      -[PKODIAssessment computeAssessment](self->_odiServiceProviderAssessment, "computeAssessment");

      v3 = v21;
    }
  }

}

- (id)_serviceProviderIdentifierForAssessmentType
{
  unint64_t type;
  id *v3;

  type = self->_type;
  if (type > 8)
    v3 = (id *)MEMORY[0x1E0D177A0];
  else
    v3 = (id *)qword_1E2ADBAB0[type];
  return *v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiServiceProviderAssessment, 0);
}

@end
