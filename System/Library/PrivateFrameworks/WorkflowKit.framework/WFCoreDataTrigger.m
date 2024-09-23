@implementation WFCoreDataTrigger

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Trigger"));
}

- (id)descriptor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  int v9;
  int v10;
  char v11;
  void *v12;
  WFConfiguredTrigger *v13;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  WFConfiguredTrigger *v19;

  v19 = [WFConfiguredTrigger alloc];
  -[WFCoreDataTrigger identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataTrigger shortcut](self, "shortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workflowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataTrigger trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[WFCoreDataTrigger shouldPrompt](self, "shouldPrompt");
  v6 = -[WFCoreDataTrigger shouldNotify](self, "shouldNotify");
  v7 = -[WFCoreDataTrigger shouldRecur](self, "shouldRecur");
  v8 = -[WFCoreDataTrigger enabled](self, "enabled");
  v9 = -[WFCoreDataTrigger source](self, "source");
  v10 = -[WFCoreDataTrigger notificationLevel](self, "notificationLevel");
  v11 = -[WFCoreDataTrigger editableShortcut](self, "editableShortcut");
  -[WFCoreDataTrigger selectedEntryMetadata](self, "selectedEntryMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE4(v16) = v11;
  HIDWORD(v15) = v9;
  LODWORD(v16) = v10;
  LOBYTE(v15) = v8;
  v13 = -[WFConfiguredTrigger initWithIdentifier:workflowID:trigger:shouldPrompt:shouldNotify:shouldRecur:enabled:triggerSource:notificationLevel:editableShortcut:selectedEntryMetadata:](v19, "initWithIdentifier:workflowID:trigger:shouldPrompt:shouldNotify:shouldRecur:enabled:triggerSource:notificationLevel:editableShortcut:selectedEntryMetadata:", v18, v4, v5, v17, v6, v7, v15, v16, v12);

  return v13;
}

- (id)trigger
{
  void *v2;
  void *v3;

  -[WFCoreDataTrigger data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFTrigger triggerWithSerializedData:](WFTrigger, "triggerWithSerializedData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)recordPropertyMap
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("triggerData");
  v4[0] = CFSTR("data");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
