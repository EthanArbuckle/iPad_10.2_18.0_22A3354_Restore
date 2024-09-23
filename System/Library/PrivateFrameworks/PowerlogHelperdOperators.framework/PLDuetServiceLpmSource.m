@implementation PLDuetServiceLpmSource

- (PLDuetServiceLpmSource)init
{
  PLDuetServiceLpmSource *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLDuetServiceLpmSource;
    self = -[PLDuetServiceLpmSource init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

+ (id)entryEventForwardDefinitionLpmSourceInformation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1EA1DB058;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("Source");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("LpmEnabled");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)stopService
{
  -[PLDuetServiceLpmSource setDuetService:](self, "setDuetService:", 0);
}

- (void)initOperatorDependanciesLpmSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = a3;
  if (v4 && !+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    -[PLDuetServiceLpmSource setDuetService:](self, "setDuetService:", v4);
    v5 = objc_alloc(MEMORY[0x1E0D80090]);
    -[PLDuetServiceLpmSource duetService](self, "duetService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__PLDuetServiceLpmSource_initOperatorDependanciesLpmSource___block_invoke;
    v13[3] = &unk_1EA16CF18;
    v13[4] = self;
    v8 = (void *)objc_msgSend(v5, "initWithOperator:withRegistration:withBlock:", v6, &unk_1EA1DA4E8, v13);
    -[PLDuetServiceLpmSource setLpmEnabledXPCListener:](self, "setLpmEnabledXPCListener:", v8);

    v9 = objc_alloc(MEMORY[0x1E0D80090]);
    -[PLDuetServiceLpmSource duetService](self, "duetService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __60__PLDuetServiceLpmSource_initOperatorDependanciesLpmSource___block_invoke_2;
    v12[3] = &unk_1EA16CF18;
    v12[4] = self;
    v11 = (void *)objc_msgSend(v9, "initWithOperator:withRegistration:withBlock:", v10, &unk_1EA1DA510, v12);
    -[PLDuetServiceLpmSource setLpmDisabledXPCListener:](self, "setLpmDisabledXPCListener:", v11);

  }
}

uint64_t __60__PLDuetServiceLpmSource_initOperatorDependanciesLpmSource___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveLpmSourceInfoWithPayload:withFlag:", a5, 1);
}

uint64_t __60__PLDuetServiceLpmSource_initOperatorDependanciesLpmSource___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveLpmSourceInfoWithPayload:withFlag:", a5, 0);
}

- (void)didReceiveLpmSourceInfoWithPayload:(id)a3 withFlag:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  void *v21;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    -[PLDuetServiceLpmSource duetService](self, "duetService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      PLLogDuetServiceLpmSource();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLDuetServiceLpmSource didReceiveLpmSourceInfoWithPayload:withFlag:].cold.1((uint64_t)v6, v8);

      v9 = objc_alloc(MEMORY[0x1E0D7FFB0]);
      +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("LpmSourceInformation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithEntryKey:", v10);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("source"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("Source"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("LpmEnabled"));

      -[PLDuetServiceLpmSource duetService](self, "duetService");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[PLDuetServiceLpmSource duetService](self, "duetService");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logEntry:", v11);

      }
      v16 = (void *)objc_opt_new();
      if ((_DWORD)v4 == 1)
        v17 = CFSTR("lpm.enabledCount.");
      else
        v17 = CFSTR("lpm.disabledCount.");
      if ((_DWORD)v4 == 1)
        v18 = CFSTR("enabled");
      else
        v18 = CFSTR("disabled");
      objc_msgSend(CFSTR("com.apple.power."), "stringByAppendingString:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("state"));
      MEMORY[0x1DF0A3E7C](objc_msgSend(v19, "stringByAppendingString:", v12), 1);
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("source"));
      v21 = v16;
      v20 = v16;
      AnalyticsSendEventLazy();

    }
  }

}

id __70__PLDuetServiceLpmSource_didReceiveLpmSourceInfoWithPayload_withFlag___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (PLService)duetService
{
  return (PLService *)objc_loadWeakRetained((id *)&self->_duetService);
}

- (void)setDuetService:(id)a3
{
  objc_storeWeak((id *)&self->_duetService, a3);
}

- (PLXPCListenerOperatorComposition)lpmEnabledXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLpmEnabledXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PLXPCListenerOperatorComposition)lpmDisabledXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLpmDisabledXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lpmDisabledXPCListener, 0);
  objc_storeStrong((id *)&self->_lpmEnabledXPCListener, 0);
  objc_destroyWeak((id *)&self->_duetService);
}

- (void)didReceiveLpmSourceInfoWithPayload:(uint64_t)a1 withFlag:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "didReceiveLpmSourceInfoWithPayload payload=%@", (uint8_t *)&v2, 0xCu);
}

@end
