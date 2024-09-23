@implementation PUIContactsAuthorizationStatesForService

void __PUIContactsAuthorizationStatesForService_block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  _PUILoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __PUIContactsAuthorizationStatesForService_block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 56);
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_1DB1FB000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for service: %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_16:

}

void __PUIContactsAuthorizationStatesForService_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1DB1FB000, v0, v1, "Error when requesting TCC for service: %@ error: %@");
  OUTLINED_FUNCTION_2_0();
}

@end
