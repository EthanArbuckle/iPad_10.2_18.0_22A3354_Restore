@implementation RTIInputSystemUIClient

void __60__RTIInputSystemUIClient__initializeConnectionWithMachName___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D87CD0];
  v3 = a2;
  objc_msgSend(v2, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPerMessageAssertionAttributes:", v5);

}

- (RTIInputSystemUIClient)initWithUIHostMachName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  RTIInputSystemUIClient *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)RTIInputSystemUIClient;
  v7 = -[RTIInputSystemClient initWithMachNames:](&v9, sel_initWithMachNames_, v6);

  return v7;
}

- (void)_initializeConnectionWithMachName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  RTILogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[RTIInputSystemUIClient _initializeConnectionWithMachName:]";
    _os_log_impl(&dword_1991A8000, v5, OS_LOG_TYPE_INFO, "%s  Starting InputUI connection", (uint8_t *)&v10, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend((id)objc_opt_class(), "_serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endpointForMachName:service:instance:", v4, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D03448], "NSXPCConnectionWithEndpoint:configurator:", v8, &__block_literal_global_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIInputSystemClient _didIntializeConnection:withMachName:](self, "_didIntializeConnection:withMachName:", v9, v4);

  objc_msgSend(v9, "activate");
}

- (BOOL)_canResumeConnection
{
  return 0;
}

+ (id)_serviceName
{
  return CFSTR("com.apple.inputservice.ui");
}

@end
