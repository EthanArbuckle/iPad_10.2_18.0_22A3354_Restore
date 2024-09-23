@implementation TUIElementGrid

+ (id)supportedAttributes
{
  if (qword_2CB7B8 != -1)
    dispatch_once(&qword_2CB7B8, &stru_242278);
  return (id)qword_2CB7B0;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIGridBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  double v9;
  double v10;
  id v11;

  var0 = a4.var0;
  v8 = a5;
  v11 = a3;
  objc_msgSend(v8, "insetsForAttribute:node:", 112, var0);
  objc_msgSend(v11, "setInsets:");
  objc_msgSend(v11, "setColumns:", (unint64_t)fmax((double)(uint64_t)objc_msgSend(v8, "integerForAttribute:withDefault:node:", 52, 1, var0), 1.0));
  objc_msgSend(v8, "floatForAttribute:node:", 193, var0);
  v10 = v9;

  objc_msgSend(v11, "setSpacing:", v10);
}

@end
