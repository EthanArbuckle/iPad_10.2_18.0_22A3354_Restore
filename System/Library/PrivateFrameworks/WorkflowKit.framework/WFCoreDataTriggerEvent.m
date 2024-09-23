@implementation WFCoreDataTriggerEvent

- (id)descriptor
{
  WFTriggerEvent *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  WFTriggerEvent *v10;

  v3 = [WFTriggerEvent alloc];
  -[WFCoreDataTriggerEvent identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataTriggerEvent trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataTriggerEvent eventInfo](self, "eventInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFCoreDataTriggerEvent confirmed](self, "confirmed");
  -[WFCoreDataTriggerEvent dateCreated](self, "dateCreated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFTriggerEvent initWithIdentifier:triggerID:eventInfo:confirmed:dateCreated:](v3, "initWithIdentifier:triggerID:eventInfo:confirmed:dateCreated:", v4, v6, v7, v8, v9);

  return v10;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("TriggerEvent"));
}

@end
