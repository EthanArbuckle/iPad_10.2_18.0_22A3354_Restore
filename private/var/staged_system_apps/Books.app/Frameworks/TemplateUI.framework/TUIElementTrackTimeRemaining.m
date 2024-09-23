@implementation TUIElementTrackTimeRemaining

+ (id)supportedAttributes
{
  if (qword_2CBA00 != -1)
    dispatch_once(&qword_2CBA00, &stru_242B50);
  return (id)qword_2CB9F8;
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUITrackTimeRemainingBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  TUITextContentStyler *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  var0 = a4.var0;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontSpecForNode:", var0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForAttribute:node:", 113, var0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForAttribute:node:", 150, var0));
  v14 = objc_alloc_init(TUITextContentStyler);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "colorForAttribute:node:", 30, var0));
  -[TUIBackgroundColorStyler setBackgroundColor:](v14, "setBackgroundColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "colorForAttribute:node:", 51, var0));
  -[TUITextContentStyler setTextColor:](v14, "setTextColor:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "font"));
  -[TUITextContentStyler setFont:](v14, "setFont:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "manager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dynamicRegistry"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "progressProviderForKind:", CFSTR("audiobookProgress")));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dynamicProgressForKind:instance:parameters:", CFSTR("timeRemaining"), v12, v13));
  objc_msgSend(v11, "setDynamicProgress:", v21);
  objc_msgSend(v11, "setStyle:", v14);

}

@end
