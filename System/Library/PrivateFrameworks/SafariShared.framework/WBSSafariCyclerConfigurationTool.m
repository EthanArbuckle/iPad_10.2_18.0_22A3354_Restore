@implementation WBSSafariCyclerConfigurationTool

- (WBSSafariCyclerConfigurationTool)init
{
  WBSSafariCyclerConfigurationTool *v2;
  WBSCyclerServiceProxy *v3;
  WBSCyclerServiceProxy *cyclerProxy;
  uint64_t v5;
  WBSSafariCyclerConfigurationTool *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBSSafariCyclerConfigurationTool;
  v2 = -[WBSSafariCyclerConfigurationTool init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WBSCyclerServiceProxy);
    cyclerProxy = v2->_cyclerProxy;
    v2->_cyclerProxy = v3;

    objc_initWeak(&location, v2);
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__WBSSafariCyclerConfigurationTool_init__block_invoke;
    v10[3] = &unk_1E4B2BC78;
    objc_copyWeak(&v11, &location);
    -[WBSCyclerServiceProxy setConnectionInvalidationHandler:](v2->_cyclerProxy, "setConnectionInvalidationHandler:", v10);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __40__WBSSafariCyclerConfigurationTool_init__block_invoke_2;
    v8[3] = &unk_1E4B3EE80;
    objc_copyWeak(&v9, &location);
    -[WBSCyclerServiceProxy setErrorHandler:](v2->_cyclerProxy, "setErrorHandler:", v8);
    v6 = v2;
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __40__WBSSafariCyclerConfigurationTool_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_errorWithCode:", 4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_exitWithError:", v2);

    WeakRetained = v3;
  }

}

void __40__WBSSafariCyclerConfigurationTool_init__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_exitWithError:", v5);

}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arguments");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v8, "count") > 1)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSafariCyclerConfigurationTool _commandWithName:](self, "_commandWithName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v8, "subarrayWithRange:", 2, objc_msgSend(v8, "count") - 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "invokeWithParameters:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_8;
    }
    else
    {
      -[WBSSafariCyclerConfigurationTool _printUsage](self, "_printUsage");
    }
    -[WBSSafariCyclerConfigurationTool _exitWithError:](self, "_exitWithError:", 0);
LABEL_8:

    goto LABEL_9;
  }
  -[WBSSafariCyclerConfigurationTool _printUsage](self, "_printUsage");
  -[WBSSafariCyclerConfigurationTool _exitWithError:](self, "_exitWithError:", 0);
LABEL_9:

}

- (id)_supportedCommands
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WBSSafariCyclerConfigurationTool__supportedCommands__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  if (_supportedCommands_onceToken != -1)
    dispatch_once(&_supportedCommands_onceToken, block);
  return (id)_supportedCommands_commands;
}

void __54__WBSSafariCyclerConfigurationTool__supportedCommands__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _WBSSafariCyclerConfigurationCommand *v4;
  _WBSSafariCyclerConfigurationCommand *v5;
  _WBSSafariCyclerConfigurationCommand *v6;
  _WBSSafariCyclerConfigurationCommand *v7;
  _WBSSafariCyclerConfigurationCommand *v8;
  _WBSSafariCyclerConfigurationCommand *v9;
  _WBSSafariCyclerConfigurationCommand *v10;
  _WBSSafariCyclerConfigurationCommand *v11;
  _WBSSafariCyclerConfigurationCommand *v12;
  _WBSSafariCyclerConfigurationCommand *v13;
  _WBSSafariCyclerConfigurationCommand *v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_supportedCommands_commands;
  _supportedCommands_commands = v2;

  v14 = -[_WBSSafariCyclerConfigurationCommand initWithName:help:]([_WBSSafariCyclerConfigurationCommand alloc], "initWithName:help:", CFSTR("test"), CFSTR("Shortcut to run either the sync or migration tests, if you don't need any special options"));
  -[_WBSSafariCyclerConfigurationCommand setUsage:](v14, "setUsage:", CFSTR("[sync|tab-sync|dav-sync|migration]"));
  -[_WBSSafariCyclerConfigurationCommand setTarget:](v14, "setTarget:", *(_QWORD *)(a1 + 32));
  -[_WBSSafariCyclerConfigurationCommand setAction:](v14, "setAction:", sel__runTest_);
  -[_WBSSafariCyclerConfigurationCommand setArgumentCount:](v14, "setArgumentCount:", 1);
  objc_msgSend((id)_supportedCommands_commands, "addObject:", v14);
  v13 = -[_WBSSafariCyclerConfigurationCommand initWithName:help:]([_WBSSafariCyclerConfigurationCommand alloc], "initWithName:help:", CFSTR("start"), CFSTR("Start the cycler, or restart it if it's already running."));
  -[_WBSSafariCyclerConfigurationCommand setTarget:](v13, "setTarget:", *(_QWORD *)(a1 + 32));
  -[_WBSSafariCyclerConfigurationCommand setAction:](v13, "setAction:", sel__startCycler_);
  objc_msgSend((id)_supportedCommands_commands, "addObject:", v13);
  v12 = -[_WBSSafariCyclerConfigurationCommand initWithName:help:]([_WBSSafariCyclerConfigurationCommand alloc], "initWithName:help:", CFSTR("stop"), CFSTR("Stop the cycler if it's running."));
  -[_WBSSafariCyclerConfigurationCommand setTarget:](v12, "setTarget:", *(_QWORD *)(a1 + 32));
  -[_WBSSafariCyclerConfigurationCommand setAction:](v12, "setAction:", sel__stopCycler_);
  objc_msgSend((id)_supportedCommands_commands, "addObject:", v12);
  v4 = -[_WBSSafariCyclerConfigurationCommand initWithName:help:]([_WBSSafariCyclerConfigurationCommand alloc], "initWithName:help:", CFSTR("resume"), CFSTR("Resume a test that has been stopped (either manually or because of a test failure)"));
  -[_WBSSafariCyclerConfigurationCommand setTarget:](v4, "setTarget:", *(_QWORD *)(a1 + 32));
  -[_WBSSafariCyclerConfigurationCommand setAction:](v4, "setAction:", sel__resumeCycler_);
  objc_msgSend((id)_supportedCommands_commands, "addObject:", v4);
  v5 = -[_WBSSafariCyclerConfigurationCommand initWithName:help:]([_WBSSafariCyclerConfigurationCommand alloc], "initWithName:help:", CFSTR("set"), CFSTR("Set cycler configuration options."));
  -[_WBSSafariCyclerConfigurationCommand setUsage:](v5, "setUsage:", CFSTR("<key> <value>\nValid keys:\n    test-suite            The name of the test suite class to run\n    seed                  The seed to use for random number generation\n    maximum-iterations    The maximum iterations to run. Defaults to 0 (no maximum)"));
  -[_WBSSafariCyclerConfigurationCommand setTarget:](v5, "setTarget:", *(_QWORD *)(a1 + 32));
  -[_WBSSafariCyclerConfigurationCommand setAction:](v5, "setAction:", sel__setConfigurationOption_);
  -[_WBSSafariCyclerConfigurationCommand setArgumentCount:](v5, "setArgumentCount:", 2);
  objc_msgSend((id)_supportedCommands_commands, "addObject:", v5);
  v6 = -[_WBSSafariCyclerConfigurationCommand initWithName:help:]([_WBSSafariCyclerConfigurationCommand alloc], "initWithName:help:", CFSTR("send-request"), CFSTR("Send a request to an ongoing test"));
  -[_WBSSafariCyclerConfigurationCommand setUsage:](v6, "setUsage:", CFSTR("<request string>"));
  -[_WBSSafariCyclerConfigurationCommand setTarget:](v6, "setTarget:", *(_QWORD *)(a1 + 32));
  -[_WBSSafariCyclerConfigurationCommand setAction:](v6, "setAction:", sel__sendRequestToTest_);
  -[_WBSSafariCyclerConfigurationCommand setArgumentCount:](v6, "setArgumentCount:", 1);
  objc_msgSend((id)_supportedCommands_commands, "addObject:", v6);
  v7 = -[_WBSSafariCyclerConfigurationCommand initWithName:help:]([_WBSSafariCyclerConfigurationCommand alloc], "initWithName:help:", CFSTR("configure-device"), CFSTR("Configure the device to run the cycler (must be run as root)"));
  -[_WBSSafariCyclerConfigurationCommand setTarget:](v7, "setTarget:", *(_QWORD *)(a1 + 32));
  -[_WBSSafariCyclerConfigurationCommand setAction:](v7, "setAction:", sel__configureDevice_);
  objc_msgSend((id)_supportedCommands_commands, "addObject:", v7);
  v8 = -[_WBSSafariCyclerConfigurationCommand initWithName:help:]([_WBSSafariCyclerConfigurationCommand alloc], "initWithName:help:", CFSTR("status"), CFSTR("Display the current status of the cycler"));
  -[_WBSSafariCyclerConfigurationCommand setTarget:](v8, "setTarget:", *(_QWORD *)(a1 + 32));
  -[_WBSSafariCyclerConfigurationCommand setAction:](v8, "setAction:", sel__fetchStatus_);
  objc_msgSend((id)_supportedCommands_commands, "addObject:", v8);
  v9 = -[_WBSSafariCyclerConfigurationCommand initWithName:help:]([_WBSSafariCyclerConfigurationCommand alloc], "initWithName:help:", CFSTR("logs"), CFSTR("Display logs from the ongoing or last run test"));
  -[_WBSSafariCyclerConfigurationCommand setTarget:](v9, "setTarget:", *(_QWORD *)(a1 + 32));
  -[_WBSSafariCyclerConfigurationCommand setAction:](v9, "setAction:", sel__fetchLogs_);
  objc_msgSend((id)_supportedCommands_commands, "addObject:", v9);
  v10 = -[_WBSSafariCyclerConfigurationCommand initWithName:help:]([_WBSSafariCyclerConfigurationCommand alloc], "initWithName:help:", CFSTR("error"), CFSTR("Display information about the last error encountered"));
  -[_WBSSafariCyclerConfigurationCommand setTarget:](v10, "setTarget:", *(_QWORD *)(a1 + 32));
  -[_WBSSafariCyclerConfigurationCommand setAction:](v10, "setAction:", sel__fetchLastError_);
  objc_msgSend((id)_supportedCommands_commands, "addObject:", v10);
  v11 = -[_WBSSafariCyclerConfigurationCommand initWithName:help:]([_WBSSafariCyclerConfigurationCommand alloc], "initWithName:help:", CFSTR("wait"), CFSTR("Wait for the cycler to finish running"));
  -[_WBSSafariCyclerConfigurationCommand setTarget:](v11, "setTarget:", *(_QWORD *)(a1 + 32));
  -[_WBSSafariCyclerConfigurationCommand setAction:](v11, "setAction:", sel__waitForCyclerToFinish_);
  objc_msgSend((id)_supportedCommands_commands, "addObject:", v11);

}

- (id)_commandWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WBSSafariCyclerConfigurationTool _supportedCommands](self, "_supportedCommands", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "caseInsensitiveCompare:", v4);

        if (!v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_printUsage
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  const char *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  puts("Usage: safaricyclerctl <subcommand>\n");
  puts("Subcommands:");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[WBSSafariCyclerConfigurationTool _supportedCommands](self, "_supportedCommands");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "name");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v10 = (const char *)objc_msgSend(v9, "UTF8String");
        objc_msgSend(v8, "help");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        printf("    %s\t\t%s\n", v10, (const char *)objc_msgSend(v11, "UTF8String"));

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)_exitWithError:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(v3, "description");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("Error: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

    LODWORD(v3) = 1;
  }
  exit((int)v3);
}

- (id)_errorWithCode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  -[WBSSafariCyclerConfigurationTool _descriptionForErrorCode:](self, "_descriptionForErrorCode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WBSSafariCyclerConfigurationToolErrorDomain"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_descriptionForErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("A logging plist already exists; not overwriting it");
  else
    return off_1E4B3F2D8[a3 - 1];
}

- (void)_runTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WBSCyclerServiceProxy *cyclerProxy;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(&unk_1E4B877B0, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[WBSSafariCyclerConfigurationTool _errorWithCode:](self, "_errorWithCode:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSafariCyclerConfigurationTool _exitWithError:](self, "_exitWithError:", v8);

  }
  cyclerProxy = self->_cyclerProxy;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__WBSSafariCyclerConfigurationTool__runTest___block_invoke;
  v11[3] = &unk_1E4B3F240;
  objc_copyWeak(&v13, &location);
  v10 = v6;
  v12 = v10;
  -[WBSCyclerServiceProxy setValue:forConfigurationKey:reply:](cyclerProxy, "setValue:forConfigurationKey:reply:", v7, CFSTR("test-suite"), v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __45__WBSSafariCyclerConfigurationTool__runTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void (**v6)(_QWORD, _QWORD);
  _QWORD v7[5];

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
      objc_msgSend(WeakRetained, "_exitWithError:", v3);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__WBSSafariCyclerConfigurationTool__runTest___block_invoke_2;
    v7[3] = &unk_1E4B2B7F8;
    v7[4] = v5;
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8599ED0](v7);
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("sync")))
      objc_msgSend(v5[1], "setValue:forConfigurationKey:reply:", CFSTR("1"), CFSTR("enable-cloudkit"), v6);
    else
      v6[2](v6, 0);

  }
}

uint64_t __45__WBSSafariCyclerConfigurationTool__runTest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v6[5];

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_exitWithError:", a2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__WBSSafariCyclerConfigurationTool__runTest___block_invoke_3;
  v6[3] = &unk_1E4B2B7F8;
  v6[4] = v3;
  return objc_msgSend(v4, "startCyclingFromBeginning:reply:", 1, v6);
}

uint64_t __45__WBSSafariCyclerConfigurationTool__runTest___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exitWithError:", a2);
}

- (void)_startCycler:(id)a3
{
  id v4;
  WBSCyclerServiceProxy *cyclerProxy;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__WBSSafariCyclerConfigurationTool__startCycler___block_invoke;
  v6[3] = &unk_1E4B3EE80;
  objc_copyWeak(&v7, &location);
  -[WBSCyclerServiceProxy startCyclingFromBeginning:reply:](cyclerProxy, "startCyclingFromBeginning:reply:", 1, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __49__WBSSafariCyclerConfigurationTool__startCycler___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_exitWithError:", v3);

}

- (void)_stopCycler:(id)a3
{
  id v4;
  WBSCyclerServiceProxy *cyclerProxy;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__WBSSafariCyclerConfigurationTool__stopCycler___block_invoke;
  v6[3] = &unk_1E4B3EE80;
  objc_copyWeak(&v7, &location);
  -[WBSCyclerServiceProxy stopCyclingWithReply:](cyclerProxy, "stopCyclingWithReply:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __48__WBSSafariCyclerConfigurationTool__stopCycler___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_exitWithError:", v3);

}

- (void)_resumeCycler:(id)a3
{
  id v4;
  WBSCyclerServiceProxy *cyclerProxy;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__WBSSafariCyclerConfigurationTool__resumeCycler___block_invoke;
  v6[3] = &unk_1E4B3EE80;
  objc_copyWeak(&v7, &location);
  -[WBSCyclerServiceProxy startCyclingFromBeginning:reply:](cyclerProxy, "startCyclingFromBeginning:reply:", 0, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __50__WBSSafariCyclerConfigurationTool__resumeCycler___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_exitWithError:", v3);

}

- (void)_setConfigurationOption:(id)a3
{
  id v4;
  WBSCyclerServiceProxy *cyclerProxy;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__WBSSafariCyclerConfigurationTool__setConfigurationOption___block_invoke;
  v8[3] = &unk_1E4B3EE80;
  objc_copyWeak(&v9, &location);
  -[WBSCyclerServiceProxy setValue:forConfigurationKey:reply:](cyclerProxy, "setValue:forConfigurationKey:reply:", v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __60__WBSSafariCyclerConfigurationTool__setConfigurationOption___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_exitWithError:", v3);

}

- (void)_sendRequestToTest:(id)a3
{
  id v4;
  WBSCyclerServiceProxy *cyclerProxy;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__WBSSafariCyclerConfigurationTool__sendRequestToTest___block_invoke;
  v7[3] = &unk_1E4B3EE80;
  objc_copyWeak(&v8, &location);
  -[WBSCyclerServiceProxy sendRequestToTestSuite:reply:](cyclerProxy, "sendRequestToTestSuite:reply:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __55__WBSSafariCyclerConfigurationTool__sendRequestToTest___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_exitWithError:", v3);

}

- (void)_configureDevice:(id)a3
{
  void *v4;
  int v5;
  WBSSafariCyclerConfigurationTool *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/Library/Preferences/Logging/Subsystems/com.apple.SafariShared.plist"));

  if (v5)
  {
    v6 = self;
    v7 = 0;
  }
  else
  {
    if ((objc_msgSend(&unk_1E4B87800, "writeToFile:atomically:", CFSTR("/Library/Preferences/Logging/Subsystems/com.apple.SafariShared.plist"), 1) & 1) != 0)
    {
      -[WBSSafariCyclerConfigurationTool _exitWithError:](self, "_exitWithError:", 0);
      return;
    }
    v6 = self;
    v7 = 1;
  }
  -[WBSSafariCyclerConfigurationTool _errorWithCode:](v6, "_errorWithCode:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSafariCyclerConfigurationTool _exitWithError:](self, "_exitWithError:", v8);

}

- (void)_fetchStatus:(id)a3
{
  id v4;
  WBSCyclerServiceProxy *cyclerProxy;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__WBSSafariCyclerConfigurationTool__fetchStatus___block_invoke;
  v6[3] = &unk_1E4B3F268;
  objc_copyWeak(&v7, &location);
  -[WBSCyclerServiceProxy fetchStatusWithReply:](cyclerProxy, "fetchStatusWithReply:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __49__WBSSafariCyclerConfigurationTool__fetchStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  double v12;
  id v13;

  v13 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = WeakRetained;
      v8 = v5;
    }
    else
    {
      if (objc_msgSend(v13, "isConnectedToTestTarget"))
        v9 = "Yes";
      else
        v9 = "No";
      printf("Connected to test target: %s\n", v9);
      objc_msgSend(v13, "activeTestSuiteName");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      printf("Active test suite: %s\n", (const char *)objc_msgSend(v10, "UTF8String"));

      printf("Seed: %lu\n", objc_msgSend(v13, "seed"));
      if (objc_msgSend(v13, "isRunning"))
        v11 = "Yes";
      else
        v11 = "No";
      printf("Running test: %s\n", v11);
      printf("Number of iterations: %lu\n", objc_msgSend(v13, "iterationCount"));
      objc_msgSend(v13, "executionTime");
      printf("Length of execution: %f seconds\n", v12);
      v7 = WeakRetained;
      v8 = 0;
    }
    objc_msgSend(v7, "_exitWithError:", v8);
  }

}

- (void)_fetchLogs:(id)a3
{
  id v4;
  WBSCyclerServiceProxy *cyclerProxy;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__WBSSafariCyclerConfigurationTool__fetchLogs___block_invoke;
  v6[3] = &unk_1E4B3F290;
  objc_copyWeak(&v7, &location);
  -[WBSCyclerServiceProxy fetchLogsWithReply:](cyclerProxy, "fetchLogsWithReply:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __47__WBSSafariCyclerConfigurationTool__fetchLogs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      v9 = v6;
    }
    else
    {
      puts("Cycler logs:");
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = v5;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v10);
            v15 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14));
            puts((const char *)objc_msgSend(v15, "UTF8String", (_QWORD)v16));
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v12);
      }

      WeakRetained = v8;
      v9 = 0;
    }
    objc_msgSend(WeakRetained, "_exitWithError:", v9, (_QWORD)v16);
  }

}

- (void)_fetchLastError:(id)a3
{
  id v4;
  WBSCyclerServiceProxy *cyclerProxy;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__WBSSafariCyclerConfigurationTool__fetchLastError___block_invoke;
  v6[3] = &unk_1E4B3EE80;
  objc_copyWeak(&v7, &location);
  -[WBSCyclerServiceProxy fetchLastErrorWithReply:](cyclerProxy, "fetchLastErrorWithReply:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __52__WBSSafariCyclerConfigurationTool__fetchLastError___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "description");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    puts((const char *)objc_msgSend(v4, "UTF8String"));

    objc_msgSend(WeakRetained, "_exitWithError:", 0);
  }

}

- (void)_waitForCyclerToFinish:(id)a3
{
  id v4;
  WBSCyclerServiceProxy *cyclerProxy;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  cyclerProxy = self->_cyclerProxy;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__WBSSafariCyclerConfigurationTool__waitForCyclerToFinish___block_invoke;
  v6[3] = &unk_1E4B3F268;
  objc_copyWeak(&v7, &location);
  -[WBSCyclerServiceProxy fetchStatusWithReply:](cyclerProxy, "fetchStatusWithReply:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __59__WBSSafariCyclerConfigurationTool__waitForCyclerToFinish___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_msgSend(WeakRetained, "_exitWithError:", v6);
    }
    else
    {
      if ((objc_msgSend(v5, "isRunning") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __59__WBSSafariCyclerConfigurationTool__waitForCyclerToFinish___block_invoke_2;
        v11[3] = &unk_1E4B3F2B8;
        v11[4] = v8;
        v10 = (id)objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.SafariShared.Cycler.DidFinishRunningTest"), 0, 0, v11);
      }
      else
      {
        objc_msgSend(v8, "_errorWithCode:", 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_exitWithError:", v9);
      }

    }
  }

}

void __59__WBSSafariCyclerConfigurationTool__waitForCyclerToFinish___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorDomain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v3, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("errorLocalizedDescription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v5, v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_exitWithError:", v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cyclerProxy, 0);
}

@end
