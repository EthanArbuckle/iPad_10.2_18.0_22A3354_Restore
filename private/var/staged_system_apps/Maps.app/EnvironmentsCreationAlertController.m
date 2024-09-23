@implementation EnvironmentsCreationAlertController

+ (id)alertControllerWithMessage:(id)a3 nameSelectionHandler:(id)a4
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:nameSelectionHandler:", CFSTR("Add Custom Configuration"), a3, a4);
}

+ (id)alertControllerWithTitle:(id)a3 message:(id)a4 nameSelectionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1));
  objc_initWeak(&location, v11);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_10067F3AC;
  v26[4] = sub_10067F3BC;
  v27 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[2] = sub_10067F3C4;
  v24[3] = &unk_1011BF860;
  v24[1] = 3221225472;
  objc_copyWeak(&v25, &location);
  v24[4] = v26;
  objc_msgSend(v11, "addTextFieldWithConfigurationHandler:", v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
  objc_msgSend(v11, "addAction:", v12);

  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_10067F44C;
  v20 = &unk_1011AE498;
  objc_copyWeak(&v23, &location);
  v13 = v10;
  v21 = v13;
  v22 = v26;
  v14 = objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Create"), 0, &v17));
  v15 = v11[1];
  v11[1] = (id)v14;

  objc_msgSend(v11[1], "setEnabled:", 0, v17, v18, v19, v20);
  objc_msgSend(v11, "addAction:", v11[1]);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  _Block_object_dispose(v26, 8);

  objc_destroyWeak(&location);
  return v11;
}

- (void)_textFieldValueDidChange:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  -[UIAlertAction setEnabled:](self->_createAction, "setEnabled:", objc_msgSend(v4, "length") != 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createAction, 0);
}

@end
