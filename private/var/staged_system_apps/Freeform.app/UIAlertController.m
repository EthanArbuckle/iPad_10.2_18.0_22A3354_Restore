@implementation UIAlertController

- (NSArray)crl_actions
{
  return -[UIAlertController actions](self, "actions");
}

- (void)crl_setActions:(id)a3
{
  -[UIAlertController _setActions:](self, "_setActions:", a3);
}

- (UIViewController)crl_contentViewController
{
  return (UIViewController *)-[UIAlertController contentViewController](self, "contentViewController");
}

- (void)crl_setContentViewController:(id)a3
{
  -[UIAlertController setContentViewController:](self, "setContentViewController:", a3);
}

- (void)crl_dismissWithAction:(id)a3
{
  -[UIAlertController _dismissWithAction:](self, "_dismissWithAction:", a3);
}

+ (id)crl_alertControllerWithError:(id)a3
{
  return objc_msgSend(a1, "crl_alertControllerWithError:preferredStyle:completion:", a3, 1, 0);
}

+ (id)crl_alertControllerWithError:(id)a3 preferredStyle:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  void *v12;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedRecoveryOptions"));
  v11 = objc_msgSend(v10, "count") == 0;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "crl_alertControllerWithError:preferredStyle:additionalActions:usesOKButton:completion:", v9, a4, 0, v11, v8));
  return v12;
}

+ (id)crl_alertControllerWithError:(id)a3 preferredStyle:(int64_t)a4 additionalActions:(id)a5 usesOKButton:(BOOL)a6 completion:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  _BOOL4 v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v43;
  int64_t v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  id obj;
  void *v49;
  id v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  id v59;
  void *v60;
  id v61;
  char *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];

  v46 = a6;
  v11 = a3;
  v43 = a5;
  v50 = a7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crl_localizedAlertTitle"));
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription", v43));
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crl_localizedAlertMessage"));
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedFailureReason"));
  v19 = v18;

  v47 = v15;
  v44 = a4;
  v45 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v15, v19, a4));
  objc_msgSend(v20, "crl_updateWithInternalTimestampAndError:", v11);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recoveryAttempter"));
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v51 = v11;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedRecoveryOptions"));
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v21)
  {
    v22 = v21;
    v23 = 0;
    v24 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v64 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_10008EFBC;
        v58[3] = &unk_1012326B8;
        v58[4] = v49;
        v27 = v51;
        v62 = (char *)i + v23;
        v59 = v27;
        v60 = v20;
        v61 = v50;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v26, 0, v58));
        objc_msgSend(v20, "addAction:", v28);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      v23 += (uint64_t)i;
    }
    while (v22);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v29 = v43;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(_QWORD *)v55 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(v20, "addAction:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j), v43);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v31);
  }

  v34 = v44 == 1 && v46;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v43));
  v36 = v35;
  if (v46)
    v37 = CFSTR("OK");
  else
    v37 = CFSTR("Cancel");
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", v37, 0, 0));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10008F014;
  v52[3] = &unk_1012326E0;
  v53 = v50;
  v39 = v50;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v38, !v34, v52));

  objc_msgSend(v20, "addAction:", v40);
  if (v46)
    objc_msgSend(v20, "setPreferredAction:", v40);
  v41 = v20;

  return v41;
}

- (void)p_didPresentErrorWithRecovery:(BOOL)a3 contextInfo:(void *)a4
{
  byte_101414CD4 = a3;
}

- (void)crl_addSimpleOKButtonWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK"), 0, 0));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v6, 1, v4));

  -[UIAlertController addAction:](self, "addAction:", v7);
}

+ (id)crl_progressAlertControllerWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5 progress:(id)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v8 = a4;
  if (!a3)
  {
    v9 = 0;
    v11 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v8 = v13;
LABEL_6:
  v14 = a6;
  v15 = sub_1005A7C78(v9, v11, v12, (uint64_t)v8, a5, v14);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v11);
  return v15;
}

@end
