@implementation SRUIFPlatformHostingInstrumentationHandler

- (SRUIFPlatformHostingInstrumentationHandler)init
{
  SRUIFPlatformHostingInstrumentationHandler *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *machAbsoluteForAppearances;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRUIFPlatformHostingInstrumentationHandler;
  v2 = -[SRUIFPlatformHostingInstrumentationHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    machAbsoluteForAppearances = v2->_machAbsoluteForAppearances;
    v2->_machAbsoluteForAppearances = v3;

  }
  return v2;
}

- (void)hostingBringUpProcessedWithTurnIdenitfier:(id)a3
{
  objc_storeStrong((id *)&self->_bringUpTurnIdentifier, a3);
  -[SRUIFPlatformHostingInstrumentationHandler _computeStateAndInstrumentIfNecessaryForEvent:](self, "_computeStateAndInstrumentIfNecessaryForEvent:", 0);
  -[SRUIFPlatformHostingInstrumentationHandler _computeStateAndInstrumentIfNecessaryForEvent:](self, "_computeStateAndInstrumentIfNecessaryForEvent:", 1);
}

- (void)hostingDismissalProcessedWithTurnIdenitfier:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalTurnIdentifier, a3);
  -[SRUIFPlatformHostingInstrumentationHandler _computeStateAndInstrumentIfNecessaryForEvent:](self, "_computeStateAndInstrumentIfNecessaryForEvent:", 2);
  -[SRUIFPlatformHostingInstrumentationHandler _computeStateAndInstrumentIfNecessaryForEvent:](self, "_computeStateAndInstrumentIfNecessaryForEvent:", 3);
}

- (void)appearanceDidChange:(unint64_t)a3 machAbsoluteTime:(unint64_t)a4
{
  NSMutableDictionary *machAbsoluteForAppearances;
  void *v7;
  void *v8;

  machAbsoluteForAppearances = self->_machAbsoluteForAppearances;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](machAbsoluteForAppearances, "setObject:forKey:", v7, v8);

  -[SRUIFPlatformHostingInstrumentationHandler _computeStateAndInstrumentIfNecessaryForEvent:](self, "_computeStateAndInstrumentIfNecessaryForEvent:", a3);
}

- (void)_computeStateAndInstrumentIfNecessaryForEvent:(unint64_t)a3
{
  NSMutableDictionary *machAbsoluteForAppearances;
  void *v6;
  AFAnalyticsTurnBasedInstrumentationContext *dismissalTurnIdentifier;
  AFAnalyticsTurnBasedInstrumentationContext *v8;
  NSMutableDictionary *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  machAbsoluteForAppearances = self->_machAbsoluteForAppearances;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](machAbsoluteForAppearances, "objectForKeyedSubscript:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (a3 > 1)
  {
    dismissalTurnIdentifier = self->_dismissalTurnIdentifier;
    if (!dismissalTurnIdentifier)
      goto LABEL_3;
  }
  else
  {
    dismissalTurnIdentifier = self->_bringUpTurnIdentifier;
    if (!dismissalTurnIdentifier)
    {
LABEL_3:
      v8 = 0;
      goto LABEL_11;
    }
  }
  v8 = dismissalTurnIdentifier;
  if (v13)
  {
    -[SRUIFPlatformHostingInstrumentationHandler _instrumentForappearanceEvent:turn:machAbolsuteTime:](self, "_instrumentForappearanceEvent:turn:machAbolsuteTime:", a3, v8, objc_msgSend(v13, "longLongValue"));
    v9 = self->_machAbsoluteForAppearances;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);

    if (a3 == 1)
    {
      v11 = 16;
    }
    else
    {
      if (a3 != 3)
        goto LABEL_11;
      v11 = 24;
    }
    v12 = *(Class *)((char *)&self->super.isa + v11);
    *(Class *)((char *)&self->super.isa + v11) = 0;

  }
LABEL_11:

}

- (void)_instrumentForappearanceEvent:(unint64_t)a3 turn:(id)a4 machAbolsuteTime:(unint64_t)a5
{
  id v8;
  id v9;
  objc_class *v10;
  objc_class *v11;
  id v12;
  id WeakRetained;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  switch(a3)
  {
    case 0uLL:
      v9 = objc_alloc_init(MEMORY[0x24BE95BB0]);
      v10 = (objc_class *)MEMORY[0x24BE95BC0];
      goto LABEL_5;
    case 1uLL:
      v9 = objc_alloc_init(MEMORY[0x24BE95BB0]);
      v11 = (objc_class *)MEMORY[0x24BE95BB8];
      goto LABEL_7;
    case 2uLL:
      v9 = objc_alloc_init(MEMORY[0x24BE95BC8]);
      v10 = (objc_class *)MEMORY[0x24BE95BD8];
LABEL_5:
      v12 = objc_alloc_init(v10);
      objc_msgSend(v12, "setExists:", 1);
      objc_msgSend(v9, "setStartedOrChanged:", v12);
      goto LABEL_8;
    case 3uLL:
      v9 = objc_alloc_init(MEMORY[0x24BE95BC8]);
      v11 = (objc_class *)MEMORY[0x24BE95BD0];
LABEL_7:
      v12 = objc_alloc_init(v11);
      objc_msgSend(v12, "setExists:", 1);
      objc_msgSend(v9, "setEnded:", v12);
LABEL_8:

      if (v9)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_testDelegate);

        if (WeakRetained)
        {
          v14 = objc_loadWeakRetained((id *)&self->_testDelegate);
          objc_msgSend(v14, "handler:requestToInstrumentEvent:turn:machAbsoluteTime:", self, v9, v8, a5);

        }
        else
        {
          v15 = (void *)*MEMORY[0x24BE08FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            objc_msgSend(v8, "turnIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "formattedText");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = 136315906;
            v20 = "-[SRUIFPlatformHostingInstrumentationHandler _instrumentForappearanceEvent:turn:machAbolsuteTime:]";
            v21 = 2112;
            v22 = v9;
            v23 = 2112;
            v24 = v17;
            v25 = 2112;
            v26 = v18;
            _os_log_impl(&dword_219F26000, v16, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", (uint8_t *)&v19, 0x2Au);

          }
          objc_msgSend(v8, "emitInstrumentation:machAbsoluteTime:", v9, a5);
        }

      }
      break;
    default:
      break;
  }

}

- (SRUIFPlatformHostingInstrumentationHandlerDelegate)testDelegate
{
  return (SRUIFPlatformHostingInstrumentationHandlerDelegate *)objc_loadWeakRetained((id *)&self->_testDelegate);
}

- (void)setTestDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_testDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testDelegate);
  objc_storeStrong((id *)&self->_dismissalTurnIdentifier, 0);
  objc_storeStrong((id *)&self->_bringUpTurnIdentifier, 0);
  objc_storeStrong((id *)&self->_machAbsoluteForAppearances, 0);
}

@end
