@implementation PSGetAuthorizationStatesForService

void __PSGetAuthorizationStatesForService_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t authorization_right;
  void *v8;
  id *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    tcc_authorization_record_get_subject_identity();
    v6 = objc_claimAutoreleasedReturnValue();
    authorization_right = tcc_authorization_record_get_authorization_right();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", tcc_identity_get_identifier(), 4);
    if (v8)
    {
      switch(authorization_right)
      {
        case 0:
          v9 = (id *)(a1 + 48);
          goto LABEL_14;
        case 3:
          v9 = (id *)(a1 + 40);
          goto LABEL_14;
        case 2:
          v9 = (id *)(a1 + 32);
LABEL_14:
          objc_msgSend(*v9, "addObject:", v8);
          break;
      }
    }

    goto LABEL_16;
  }
  _PSLoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __PSGetAuthorizationStatesForService_block_invoke_cold_1(a1, a3, v6);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 56);
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for service: %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_16:

}

void __PSGetAuthorizationStatesForService_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1A3819000, log, OS_LOG_TYPE_ERROR, "Error when requesting TCC for service: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

@end
