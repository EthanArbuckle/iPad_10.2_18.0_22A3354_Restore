@implementation CRJasperTest

- (BOOL)promptContinue:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[16];
  _QWORD v34[5];
  _QWORD v35[5];
  objc_super v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[4];
  _QWORD v44[2];
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  _QWORD v49[2];

  v6 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_10000B0CC;
  v41 = sub_10000B0DC;
  v42 = 0;
  v36.receiver = self;
  v36.super_class = (Class)CRJasperTest;
  v32 = a4;
  if (-[CRTest promptContinue:withContext:](&v36, "promptContinue:withContext:", v6))
  {
    v47 = CFSTR("CONTINUE");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLocalization localizedStringWithKey:](CRLocalization, "localizedStringWithKey:", CFSTR("CAMERA_CALIBRATION_CONTINUE_BUTTON_TITLE")));
    v48 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
    v49[0] = v8;
    v45 = CFSTR("CANCEL");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLocalization localizedStringWithKey:](CRLocalization, "localizedStringWithKey:", CFSTR("CAMERA_CALIBRATION_CANCEL_BUTTON_TITLE")));
    v46 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
    v49[1] = v10;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 2));

    v11 = objc_alloc((Class)ASTInstructionalPrompt);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest testId](self, "testId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLocalization localizedStringWithKey:](CRLocalization, "localizedStringWithKey:", CFSTR("CAMERA_CALIBRATION_INTRO_TITLE")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLocalization localizedStringWithKey:](CRLocalization, "localizedStringWithKey:", CFSTR("CAMERA_CALIBRATION_INTRO_BODY_1")));
    v44[0] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLocalization localizedStringWithKey:](CRLocalization, "localizedStringWithKey:", CFSTR("CAMERA_CALIBRATION_INTRO_BODY_2")));
    v44[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 2));
    v17 = objc_msgSend(v11, "initWithID:type:iconLocator:localizedTitle:localizedSubtitle:imageLocators:instructions:instructionsStyle:options:", v12, 0, CFSTR("scope"), v13, &stru_100052650, 0, v16, 0, v31);

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10000B0E4;
    v35[3] = &unk_100050CD0;
    v35[4] = &v37;
    objc_msgSend(v6, "showInstructionalPrompt:withConfirmation:", v17, v35);
    if ((objc_msgSend((id)v38[5], "isEqualToString:", CFSTR("CANCEL")) & 1) != 0)
    {
      v18 = v17;
    }
    else
    {
      v29 = objc_alloc((Class)ASTInstructionalPrompt);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRTest testId](self, "testId"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[CRLocalization localizedStringWithKey:](CRLocalization, "localizedStringWithKey:", CFSTR("CAMERA_CALIBRATION_INSTRUCTIONS_TITLE")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLocalization localizedStringWithKey:](CRLocalization, "localizedStringWithKey:", CFSTR("CAMERA_CALIBRATION_INSTRUCTIONS_1")));
      v43[0] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRLocalization localizedStringWithKey:](CRLocalization, "localizedStringWithKey:", CFSTR("CAMERA_CALIBRATION_INSTRUCTIONS_2")));
      v43[1] = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLocalization localizedStringWithKey:](CRLocalization, "localizedStringWithKey:", CFSTR("CAMERA_CALIBRATION_INSTRUCTIONS_3")));
      v43[2] = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[CRLocalization localizedStringWithKey:](CRLocalization, "localizedStringWithKey:", CFSTR("CAMERA_CALIBRATION_INSTRUCTIONS_4")));
      v43[3] = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 4));
      v18 = objc_msgSend(v29, "initWithID:type:iconLocator:localizedTitle:localizedSubtitle:imageLocators:instructions:instructionsStyle:options:", v30, 0, 0, v20, &stru_100052650, &off_100058408, v25, 1, v31);

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10000B1AC;
      v34[3] = &unk_100050CD0;
      v34[4] = &v37;
      objc_msgSend(v6, "showInstructionalPrompt:withConfirmation:", v18, v34);
      if (!objc_msgSend((id)v38[5], "isEqualToString:", CFSTR("CANCEL")))
      {
        v19 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    v26 = handleForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Cancelling test", buf, 2u);
    }

    v19 = 0;
    goto LABEL_10;
  }
  v19 = 0;
LABEL_11:
  _Block_object_dispose(&v37, 8);

  return v19;
}

@end
