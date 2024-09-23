@implementation WFCoreDataRunEvent

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("ShortcutRunEvent"));
}

- (id)descriptor
{
  WFWorkflowRunEvent *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFWorkflowRunEvent *v11;

  v3 = [WFWorkflowRunEvent alloc];
  -[WFCoreDataRunEvent identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataRunEvent shortcut](self, "shortcut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataRunEvent source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataRunEvent date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataRunEvent trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFWorkflowRunEvent initWithIdentifier:workflow:source:date:triggerID:outcome:](v3, "initWithIdentifier:workflow:source:date:triggerID:outcome:", v4, v6, v7, v8, v10, (int)-[WFCoreDataRunEvent outcome](self, "outcome"));

  return v11;
}

@end
