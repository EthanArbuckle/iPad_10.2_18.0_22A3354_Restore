@implementation WFLocationAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)name
{
  return WFLocalizedString(CFSTR("Location"));
}

- (id)icon
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B70], "workflowKitImageNamed:", CFSTR("Location"));
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("your location"), CFSTR("your location"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)status
{
  int v3;
  void *v4;

  v3 = -[WFLocationAccessResource authorizationStatus](self, "authorizationStatus");
  if (!v3)
  {
    -[WFLocationAccessResource workflow](self, "workflow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = WFCLLocationManagerAuthorizationStatusForWorkflowEnvironment(objc_msgSend(v4, "environment"));

  }
  if ((v3 - 1) > 3)
    return 1;
  else
    return qword_1C1B47DC8[v3 - 1];
}

- (void)setWorkflow:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  objc_storeWeak((id *)&self->_workflow, a3);
  -[WFLocationAccessResource workflow](self, "workflow");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "environment");
  WFCLLocationManagerWithOptions(v4, self, MEMORY[0x1E0C80D38]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationAccessResource setLocationManager:](self, "setLocationManager:", v5);

}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WFLocationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  block[3] = &unk_1E7AF8378;
  v11 = v6;
  v12 = v7;
  block[4] = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)finishMakingAvailableWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v4 = a3;
  v9 = a4;
  -[WFLocationAccessResource locationManager](self, "locationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopUpdatingLocation");

  -[WFResource refreshAvailabilityWithForcedNotification](self, "refreshAvailabilityWithForcedNotification");
  -[WFLocationAccessResource makeAvailableCompletionHandler](self, "makeAvailableCompletionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFLocationAccessResource makeAvailableCompletionHandler](self, "makeAvailableCompletionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _BOOL8, id))v8)[2](v8, v4, v9);

  }
  -[WFLocationAccessResource setMakeAvailableCompletionHandler:](self, "setMakeAvailableCompletionHandler:", 0);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  -[WFLocationAccessResource finishMakingAvailableWithSuccess:error:](self, "finishMakingAvailableWithSuccess:error:", 0, a4);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  -[WFLocationAccessResource finishMakingAvailableWithSuccess:error:](self, "finishMakingAvailableWithSuccess:error:", 1, 0);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  _BOOL8 v4;

  -[WFLocationAccessResource setAuthorizationStatus:](self, "setAuthorizationStatus:", objc_msgSend(a3, "authorizationStatus"));
  if (-[WFLocationAccessResource authorizationStatus](self, "authorizationStatus"))
  {
    v4 = -[WFLocationAccessResource authorizationStatus](self, "authorizationStatus") == 3
      || -[WFLocationAccessResource authorizationStatus](self, "authorizationStatus") == 4;
    -[WFLocationAccessResource finishMakingAvailableWithSuccess:error:](self, "finishMakingAvailableWithSuccess:error:", v4, 0);
  }
}

- (id)workflow
{
  return objc_loadWeakRetained((id *)&self->_workflow);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (id)makeAvailableCompletionHandler
{
  return self->_makeAvailableCompletionHandler;
}

- (void)setMakeAvailableCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int)a3
{
  self->_authorizationStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_makeAvailableCompletionHandler, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_destroyWeak((id *)&self->_workflow);
}

void __77__WFLocationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "setMakeAvailableCompletionHandler:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 40), "isRunningWithSiriUI"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7CF0]), "initWithNeedsPreciseLocation:", 1);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __77__WFLocationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
    v5[3] = &unk_1E7AEF348;
    v3 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "performSiriRequest:completionHandler:", v2, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "locationManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestWhenInUseAuthorization");

  }
}

void __77__WFLocationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v8;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(v4, "didAuthorize");
  objc_msgSend(v8, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "finishMakingAvailableWithSuccess:error:", v6, v7);
}

@end
