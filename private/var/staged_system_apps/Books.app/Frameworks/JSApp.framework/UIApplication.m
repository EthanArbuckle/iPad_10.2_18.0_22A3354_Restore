@implementation UIApplication

- (void)jsa_openExternalURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v15 = a3;
  v14 = a4;
  v8 = a5;
  v13 = v8;
  if (_UIApplicationIsExtension())
  {
    v9 = objc_retainBlock(v8);
    v10 = v9;
    if (v9)
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIApplication methodSignatureForSelector:](self, "methodSignatureForSelector:", "openURL:options:completionHandler:"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v11));

    objc_msgSend(v12, "setSelector:", "openURL:options:completionHandler:");
    objc_msgSend(v12, "setTarget:", self);
    objc_msgSend(v12, "setArgument:atIndex:", &v15, 2);
    objc_msgSend(v12, "setArgument:atIndex:", &v14, 3);
    objc_msgSend(v12, "setArgument:atIndex:", &v13, 4);
    objc_msgSend(v12, "invoke");

    v8 = v13;
  }

}

+ (id)jsa_sharedApplicationIfNotExtension
{
  return (id)_sSo13UIApplicationC5JSAppE20sharedIfNotExtensionABSgvgZ_0();
}

@end
