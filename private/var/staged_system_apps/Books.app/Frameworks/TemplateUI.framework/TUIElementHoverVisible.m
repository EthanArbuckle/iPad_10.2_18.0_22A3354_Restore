@implementation TUIElementHoverVisible

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIHoverVisibleBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 138, a4.var0));
  objc_msgSend(v16, "setRegionName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 225, a4.var0));
  v11 = v10;
  v12 = v11;
  if (qword_2CB6F0 == -1)
  {
    if (!v11)
    {
LABEL_6:
      v15 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_2CB6F0, &stru_2414B8);
    if (!v12)
      goto LABEL_6;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB6E8, "objectForKeyedSubscript:", v12));
  if (!v13)
    goto LABEL_6;
  v14 = v13;
  v15 = objc_msgSend(v13, "unsignedIntegerValue");

LABEL_7:
  objc_msgSend(v16, "setWhenUnavailable:", v15);

}

@end
