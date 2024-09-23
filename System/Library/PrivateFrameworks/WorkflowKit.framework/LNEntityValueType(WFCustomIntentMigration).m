@implementation LNEntityValueType(WFCustomIntentMigration)

- (id)wf_titleWithCustomIntentSerializedRepresentation:()WFCustomIntentMigration
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("displayString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43DF8]), "initWithKey:table:bundleURL:", v3, 0, 0);
  else
    v4 = 0;

  return v4;
}

@end
