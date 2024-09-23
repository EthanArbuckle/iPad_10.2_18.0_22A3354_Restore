@implementation SISchemaOrderedAnyEvent(Construction)

+ (id)orderedAnyEventWithAnyEvent:()Construction timestamp:clockIdentifier:
{
  id v7;
  id v8;
  SiriAnalyticsLogicalTimeStamp *v9;
  void *v10;

  v7 = a5;
  v8 = a3;
  v9 = -[SiriAnalyticsLogicalTimeStamp initWithMachAbsoluteTime:clockIdentifier:]([SiriAnalyticsLogicalTimeStamp alloc], "initWithMachAbsoluteTime:clockIdentifier:", a4, v7);

  objc_msgSend(MEMORY[0x1E0D9A460], "orderedAnyEventWithAnyEvent:timestamp:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)orderedAnyEventWithAnyEvent:()Construction timestamp:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x1E0D9A410];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v6, "loggingRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTimestamp:", v9);
  v10 = objc_alloc_init(MEMORY[0x1E0D9A460]);
  objc_msgSend(v10, "setMetadata:", v8);
  objc_msgSend(v10, "setEvent:", v7);

  return v10;
}

@end
