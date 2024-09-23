@implementation GeoRequestResponseLogBundleIdAlertController

+ (id)alertControllerWithBundleId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Edit"), 0, 1));
  objc_initWeak(&location, v8);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_10026D65C;
  v23[4] = sub_10026D66C;
  v24 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[2] = sub_10026D674;
  v19[3] = &unk_1011AE470;
  v19[1] = 3221225472;
  objc_copyWeak(&v22, &location);
  v9 = v6;
  v20 = v9;
  v21 = v23;
  objc_msgSend(v8, "addTextFieldWithConfigurationHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
  objc_msgSend(v8, "addAction:", v10);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10026D708;
  v15[3] = &unk_1011AE498;
  objc_copyWeak(&v18, &location);
  v11 = v7;
  v16 = v11;
  v17 = v23;
  v12 = objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Save"), 0, v15));
  v13 = v8[1];
  v8[1] = (id)v12;

  objc_msgSend(v8[1], "setEnabled:", 0);
  objc_msgSend(v8, "addAction:", v8[1]);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  _Block_object_dispose(v23, 8);

  objc_destroyWeak(&location);
  return v8;
}

- (void)_textFieldValueDidChange:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  -[UIAlertAction setEnabled:](self->_action, "setEnabled:", objc_msgSend(v4, "length") != 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
}

@end
