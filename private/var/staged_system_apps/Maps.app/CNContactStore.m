@implementation CNContactStore

+ (BOOL)_maps_isAuthorized
{
  void *v2;
  BOOL v3;

  v2 = (void *)tcc_identity_create(0, "com.apple.Maps");
  if (v2)
    v3 = (char *)+[CNContactStore authorizationStatusForEntityType:](CNContactStore, "authorizationStatusForEntityType:", 0)- 3 < (char *)2;
  else
    v3 = 0;

  return v3;
}

+ (void)promptForContactsAccessIfNeededBeforePerforming:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;

  v4 = a3;
  switch(+[CNContactStore authorizationStatusForEntityType:](CNContactStore, "authorizationStatusForEntityType:", 0))
  {
    case 0:
      v5 = objc_alloc_init((Class)CNContactStore);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100790FA4;
      v32[3] = &unk_1011C6660;
      v34 = a1;
      v33 = v4;
      objc_msgSend(v5, "requestAccessForEntityType:completionHandler:", 0, v32);

      break;
    case 1:
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
      break;
    case 2:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsWindow](UIApplication, "_maps_keyMapsWindow"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));

      if (v7)
      {
        v26 = 0;
        v27 = &v26;
        v28 = 0x3032000000;
        v29 = sub_100791070;
        v30 = sub_100791080;
        v31 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v7);
        v8 = objc_alloc_init((Class)UIViewController);
        objc_msgSend((id)v27[5], "setRootViewController:", v8);

        objc_msgSend((id)v27[5], "setWindowLevel:", UIWindowLevelAlert + 1.0);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("'%@' Would Like to Access Your Contacts"), CFSTR("localized string not found"), 0));

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName")));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForInfoDictionaryKey:", CFSTR("NSContactsUsageDescription")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, v14, 1));

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100791088;
        v25[3] = &unk_1011C6688;
        v25[4] = &v26;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 1, v25));

        objc_msgSend(v15, "addAction:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("[Contacts permission prompt] Settings"), CFSTR("localized string not found"), 0));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10079109C;
        v24[3] = &unk_1011C6688;
        v24[4] = &v26;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 0, v24));

        objc_msgSend(v15, "addAction:", v21);
        objc_msgSend(v15, "setPreferredAction:", v21);
        objc_msgSend((id)v27[5], "makeKeyAndVisible");
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v27[5], "rootViewController"));
        objc_msgSend(v22, "presentViewController:animated:completion:", v15, 1, 0);

        _Block_object_dispose(&v26, 8);
      }
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);

      break;
    case 3:
    case 4:
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
      break;
    default:
      break;
  }

}

@end
