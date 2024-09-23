@implementation VSAppDocumentControllerFactory

+ (id)appDocumentControllerForAppDocument:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  __objc2_class *v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "templateElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "vs_elementType");

  switch(v7)
  {
    case 161:
      v8 = VSCredentialEntryAppDocumentController;
      goto LABEL_11;
    case 162:
      v8 = VSAutoAuthenticationAppDocumentController;
      goto LABEL_11;
    case 163:
      v8 = VSWebAuthenticationAppDocumentController;
      goto LABEL_11;
    case 164:
      v8 = VSOnscreenCodeAuthenticationAppDocumentController;
      goto LABEL_11;
    case 165:
      v8 = VSTwoFactorEntryAppDocumentController;
LABEL_11:
      v11 = (void *)objc_msgSend([v8 alloc], "initWithAppDocument:", v5);
      v10 = 0;
      if (a4)
        goto LABEL_12;
      goto LABEL_13;
    default:
      VSErrorLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[VSAppDocumentControllerFactory appDocumentControllerForAppDocument:error:].cold.1(v9);

      VSPrivateError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      if (!a4)
        goto LABEL_13;
LABEL_12:
      *a4 = objc_retainAutorelease(v10);
LABEL_13:

      return v11;
  }
}

+ (void)appDocumentControllerForAppDocument:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2303C5000, log, OS_LOG_TYPE_ERROR, "VSAppDocumentControllerFactory: Unknown template element", v1, 2u);
}

@end
