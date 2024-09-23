@implementation TUIElementSmartGridAdornments

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL____TUIElementSmartGridAdornmentConsuming;
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v9 = a5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_7D8C;
  v12[3] = &unk_23D728;
  v13 = a6;
  v14 = v9;
  v10 = v9;
  v11 = v13;
  objc_msgSend(v11, "enumerateChildrenOfNode:block:", a3.var0, v12);

}

@end
