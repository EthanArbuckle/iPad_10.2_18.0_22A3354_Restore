@implementation PSCalendarAuthorizationStates

void __PSCalendarAuthorizationStates_block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t authorization_right;
  void *v8;
  id *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];

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
          v9 = a1 + 6;
          goto LABEL_14;
        case 4:
          v9 = a1 + 5;
          goto LABEL_14;
        case 2:
          v9 = a1 + 4;
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
      __PSCalendarAuthorizationStates_block_invoke_cold_1(a3, v6, v11, v12, v13, v14, v15, v16);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for kTCCServiceCalendar", v17, 2u);
  }
LABEL_16:

}

void __PSCalendarAuthorizationStates_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1A3819000, a2, a3, "Error when requesting TCC for kTCCServiceCalendar error: %@", a5, a6, a7, a8, 2u);
}

@end
