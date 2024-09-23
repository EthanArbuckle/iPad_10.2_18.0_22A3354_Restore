@implementation UIAlertController

+ (id)rc_OKAlertControllerWithTitle:(id)a3 message:(id)a4 handler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1001B2BC0, 0));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100062568;
  v14[3] = &unk_1001AC630;
  v15 = v7;
  v11 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v14));
  objc_msgSend(v8, "addAction:", v12);

  return v8;
}

+ (id)rc_alertControllerWithTitle:(id)a3 message:(id)a4 buttons:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id obj;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("title")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("style")));
        v16 = objc_msgSend(v15, "integerValue");

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("action")));
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10006277C;
        v22[3] = &unk_1001AC630;
        v23 = v17;
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, v16, v22));
        objc_msgSend(v8, "addAction:", v19);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  return v8;
}

- (void)rc_showInMainWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootViewController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentedViewController"));
  if (v6)
    v7 = v6;
  else
    v7 = v9;
  v8 = v7;

  objc_msgSend(v8, "presentViewController:animated:completion:", self, 1, 0);
}

@end
