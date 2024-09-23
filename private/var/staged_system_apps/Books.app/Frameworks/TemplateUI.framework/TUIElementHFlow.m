@implementation TUIElementHFlow

+ (id)supportedAttributes
{
  if (qword_2CB4F0 != -1)
    dispatch_once(&qword_2CB4F0, &stru_240118);
  return (id)qword_2CB4E8;
}

+ (id)containerAttributes
{
  if (qword_2CB500 != -1)
    dispatch_once(&qword_2CB500, &stru_240138);
  return (id)qword_2CB4F8;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIHFlowBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 96, var0));
  objc_msgSend(v9, "setHalign:", +[TUIBox halignFromString:](TUIBox, "halignFromString:", v10));

  v11 = objc_msgSend(v8, "lengthForAttribute:node:", 101, var0);
  objc_msgSend(v9, "setHspacing:", v11, v12);
  v13 = objc_msgSend(v8, "lengthForAttribute:node:", 221, var0);
  objc_msgSend(v9, "setVspacing:", v13, v14);
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 120, var0));

  objc_msgSend(v9, "setLayoutMode:", +[TUIBox layoutModeFromString:](TUIBox, "layoutModeFromString:", v15));
}

@end
