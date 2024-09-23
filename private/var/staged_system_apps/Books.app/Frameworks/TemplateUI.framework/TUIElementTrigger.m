@implementation TUIElementTrigger

+ (id)supportedAttributes
{
  if (qword_2CB618 != -1)
    dispatch_once(&qword_2CB618, &stru_240F08);
  return (id)qword_2CB610;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUITriggerBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  void *v10;
  id v11;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "floatForAttribute:node:", 210, var0);
  objc_msgSend(v9, "setAnchorOffset:");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 138, var0));
  objc_msgSend(v9, "setName:", v10);

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 141, var0));
  objc_msgSend(v9, "setObservationMode:", +[TUITriggerBox observationModeFromString:](TUITriggerBox, "observationModeFromString:", v11));

}

+ (BOOL)instantiateChildren
{
  return 0;
}

@end
