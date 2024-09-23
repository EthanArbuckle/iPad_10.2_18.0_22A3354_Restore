@implementation BSUIElementFamilyProfileImage

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  if (qword_32BF40 != -1)
    dispatch_once(&qword_32BF40, &stru_2E4048);
  return (id)qword_32BF38;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(BSUIFamilyProfileImageBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  id v10;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "floatForAttribute:node:", 60, var0);
  objc_msgSend(v9, "setCornerRadius:");
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 213, var0));

  objc_msgSend(v9, "setUrlString:", v10);
}

@end
