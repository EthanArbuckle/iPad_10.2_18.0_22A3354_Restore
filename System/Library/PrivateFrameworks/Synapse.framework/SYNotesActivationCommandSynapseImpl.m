@implementation SYNotesActivationCommandSynapseImpl

+ (void)activateWithDomainIdentifier:(id)a3 noteIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = 0;
  if (a3 && a4)
  {
    v16[0] = a3;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = a4;
    v12 = a3;
    objc_msgSend(v10, "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    SYMakeEditNoteUserActivity(v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "_activateWithActivity:completion:", v9, v8);

}

+ (void)_activateWithActivity:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, SYNotesActivationClient *);
  SYNotesActivationClient *v7;
  NSObject *v8;

  v5 = a3;
  v6 = (void (**)(id, SYNotesActivationClient *))a4;
  if (SYIsPhone() && (SYIsQuickNoteOnPhoneEnabled() & 1) != 0)
  {
    v7 = objc_alloc_init(SYNotesActivationClient);
    -[SYNotesActivationClient activateNotesWithUserActivity:completion:](v7, "activateNotesWithUserActivity:completion:", v5, v6);
LABEL_8:

    goto LABEL_9;
  }
  v8 = os_log_create("com.apple.synapse", ");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[SYNotesActivationCommandSynapseImpl _activateWithActivity:completion:].cold.1(v8);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.synapse"), -127, 0);
    v7 = (SYNotesActivationClient *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);
    goto LABEL_8;
  }
LABEL_9:

}

+ (void)_activateWithActivity:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCC38000, log, OS_LOG_TYPE_ERROR, "Feature flag is not enabled", v1, 2u);
}

@end
