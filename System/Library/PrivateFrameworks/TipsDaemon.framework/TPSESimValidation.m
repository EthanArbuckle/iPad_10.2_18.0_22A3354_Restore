@implementation TPSESimValidation

- (void)validateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v5 = (void *)getCTCellularPlanManagerClass_softClass;
  v15 = getCTCellularPlanManagerClass_softClass;
  if (!getCTCellularPlanManagerClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getCTCellularPlanManagerClass_block_invoke;
    v11[3] = &unk_1EA1DF510;
    v11[4] = &v12;
    __getCTCellularPlanManagerClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v6, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, (objc_msgSend(v7, "getSupportedFlowTypes") == 0) ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue"), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[TPSESimValidation validateWithCompletion:].cold.1(self, v10);

    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);
  }

}

- (void)validateWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "%@ - error initializing cellular plan manager", (uint8_t *)&v4, 0xCu);

}

@end
