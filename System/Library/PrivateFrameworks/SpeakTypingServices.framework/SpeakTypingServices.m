BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

uint64_t _AXSLetterFeedbackEnabled()
{
  return MEMORY[0x24BED2308]();
}

uint64_t _AXSPhoneticFeedbackEnabled()
{
  return MEMORY[0x24BED2388]();
}

uint64_t _AXSWordFeedbackEnabled()
{
  return MEMORY[0x24BED2648]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         v17[3] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v9 = a3;
    -[SpeakTypingServices speakTypingClient](self, "speakTypingClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE003A0];
    v17[0] = v9;
    v16[0] = v11;
    v16[1] = CFSTR("AXSpeakTypingPayloadKeyVolume");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    v16[2] = CFSTR("AXSpeakTypingPayloadKeyRate");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v14, 6, 0, 0);
  }
  return a3 != 0;
}

- (BOOL)notifySpeakServicesForSpeakAutoCorrections:(id)a3 forCurrentInputMode:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a4;
  v7 = v6;
  if (a3)
  {
    if (!v6)
      v7 = &stru_24DBBF5A8;
    v8 = a3;
    -[SpeakTypingServices speakTypingClient](self, "speakTypingClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = *MEMORY[0x24BE003A0];
    v12[1] = CFSTR("AXSpeakTypingPayloadKeyLanguage");
    v13[0] = v8;
    v13[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v10, 4, 0, 0);
  }

  return a3 != 0;
}

- (BOOL)notifySpeakServicesToFeedbackQuickTypePrediction:(id)a3 forCurrentInputMode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (UIAccessibilityIsVoiceOverRunning() || !objc_msgSend(v6, "length"))
  {
    v10 = 0;
  }
  else
  {
    -[SpeakTypingServices speakTypingClient](self, "speakTypingClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = *MEMORY[0x24BE00398];
    v12[1] = CFSTR("AXSpeakTypingPayloadKeyLanguage");
    v13[0] = v6;
    v13[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v9, 3, 0, 0);

    v10 = 1;
  }

  return v10;
}

- (id)_clientIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SpeakTypingClientIdentifier-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)initializeServerConnection
{
  id v3;
  void *v4;
  AXUIClient *v5;
  AXUIClient *speakTypingClient;

  if (!self->_speakTypingClient)
  {
    v3 = objc_alloc(MEMORY[0x24BDFF8F0]);
    -[SpeakTypingServices _clientIdentifier](self, "_clientIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (AXUIClient *)objc_msgSend(v3, "initWithIdentifier:serviceBundleName:", v4, CFSTR("SpeakServer"));
    speakTypingClient = self->_speakTypingClient;
    self->_speakTypingClient = v5;

    -[AXUIClient setDelegate:](self->_speakTypingClient, "setDelegate:", self);
    -[AXUIClient sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:](self->_speakTypingClient, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", MEMORY[0x24BDBD1B8], 14, 0, 0);
  }
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  _QWORD block[5];

  if (self->_speakTypingClient == a3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__SpeakTypingServices_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke;
    block[3] = &unk_24DBBF4A8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __81__SpeakTypingServices_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "speakTypingClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setSpeakTypingClient:", 0);
  if (_AXSWordFeedbackEnabled()
    || _AXSLetterFeedbackEnabled()
    || _AXSPhoneticFeedbackEnabled()
    || (objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "speakCorrectionsEnabled"),
        v3,
        v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "initializeServerConnection");
  }
}

- (void)setSpeakTypingClient:(id)a3
{
  objc_storeStrong((id *)&self->_speakTypingClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakTypingClient, 0);
}

@end
