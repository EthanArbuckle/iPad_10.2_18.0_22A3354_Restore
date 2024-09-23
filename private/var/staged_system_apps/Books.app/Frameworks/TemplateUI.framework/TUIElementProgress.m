@implementation TUIElementProgress

+ (id)supportedAttributes
{
  if (qword_2CB200 != -1)
    dispatch_once(&qword_2CB200, &stru_23DC70);
  return (id)qword_2CB1F8;
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIProgressBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9;
  uint64_t var0;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a5;
  v9 = a6;
  var0 = a4.var0;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringForAttribute:node:", 116, a4.var0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForAttribute:node:", 113, var0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForAttribute:node:", 150, var0));
  if (v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "manager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dynamicRegistry"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "progressProviderForKind:", v12));

  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dynamicProgressForKind:instance:parameters:", v12, v13, v14));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringForAttribute:node:", 158, var0));
  objc_msgSend(v11, "setProgressId:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringForAttribute:node:", 159, var0));
  objc_msgSend(v11, "setProgressMode:", v20);

  objc_msgSend(v22, "floatForAttribute:node:", 157, var0);
  objc_msgSend(v11, "setProgress:");
  objc_msgSend(v11, "setDynamicProgress:", v18);
  objc_msgSend(v11, "setPaused:", objc_msgSend(v22, "BOOLForAttribute:node:", 160, var0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "colorForAttribute:node:", 51, var0));
  objc_msgSend(v11, "setColor:", v21);

}

@end
