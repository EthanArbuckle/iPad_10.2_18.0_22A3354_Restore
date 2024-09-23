@implementation CoreLocation_TMLModule

+ (BOOL)loadModule
{
  char v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AD4D1C0;
  block[3] = &unk_24F4FCF78;
  block[4] = &v5;
  if (qword_255B51BD0 != -1)
    dispatch_once(&qword_255B51BD0, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)initializeJSContext:(id)a3
{
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  id v24;

  v24 = a3;
  objc_msgSend_defineConstants_(a1, v4, v5, v24);
  objc_msgSend_setObject_forKeyedSubscript_(v24, v6, v7, &unk_24F5011A0, CFSTR("CLLocationCoordinate2DMake"));
  objc_msgSend_setObject_forKeyedSubscript_(v24, v8, v9, &unk_24F5011A0, CFSTR("CLLocationCoordinate"));
  objc_msgSend_setObject_forKeyedSubscript_(v24, v10, v11, &unk_24F5011E0, CFSTR("CLLocationCoordinate2DIsValid"));
  objc_msgSend_objectForKeyedSubscript_(v24, v12, v13, CFSTR("CLLocationCoordinate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v14, v15, v16, &unk_24F501220, CFSTR("latitude"));

  objc_msgSend_objectForKeyedSubscript_(v24, v17, v18, CFSTR("CLLocationCoordinate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v19, v20, v21, &unk_24F501240, CFSTR("longitude"));

  objc_msgSend_setObject_forKeyedSubscript_(v24, v22, v23, &unk_24F501260, CFSTR("CLLocation"));
}

+ (void)defineConstants:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  const char *v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  const char *v20;
  void *v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  const char *v26;
  void *v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  const char *v32;
  void *v33;
  const char *v34;
  double v35;
  const char *v36;
  double v37;
  const char *v38;
  void *v39;
  const char *v40;
  double v41;
  const char *v42;
  double v43;
  const char *v44;
  double v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  const char *v50;
  double v51;
  const char *v52;
  double v53;
  const char *v54;
  double v55;
  const char *v56;
  double v57;
  const char *v58;
  double v59;
  const char *v60;
  double v61;
  const char *v62;
  double v63;
  const char *v64;
  void *v65;
  const char *v66;
  double v67;
  const char *v68;
  double v69;
  const char *v70;
  void *v71;
  const char *v72;
  double v73;
  const char *v74;
  double v75;
  const char *v76;
  void *v77;
  const char *v78;
  double v79;
  const char *v80;
  double v81;
  id v82;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  v82 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v7, *MEMORY[0x24BDBFB30]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDDA600];
  objc_msgSend_setObject_forKeyedSubscript_(v82, v10, v11, v8, *MEMORY[0x24BDDA600]);

  objc_msgSend_defineProperty_descriptor_(v4, v12, v13, CFSTR("kCLLocationAccuracyBestForNavigation"), v82);
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v14, *MEMORY[0x24BDBFB28]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v82, v16, v17, v15, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, CFSTR("kCLLocationAccuracyBest"), v82);
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v20, *MEMORY[0x24BDBFB58]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v82, v22, v23, v21, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v24, v25, CFSTR("kCLLocationAccuracyNearestTenMeters"), v82);
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v26, *MEMORY[0x24BDBFB40]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v82, v28, v29, v27, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v30, v31, CFSTR("kCLLocationAccuracyHundredMeters"), v82);
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v32, *MEMORY[0x24BDBFB48]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v82, v34, v35, v33, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v36, v37, CFSTR("kCLLocationAccuracyKilometer"), v82);
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v38, *MEMORY[0x24BDBFB68]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v82, v40, v41, v39, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v42, v43, CFSTR("kCLLocationAccuracyThreeKilometers"), v82);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v44, v45, &unk_24F532C58, v9);
  objc_msgSend_defineProperty_descriptor_(v4, v46, v47, CFSTR("kCLAuthorizationStatusNotDetermined"), v82);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v48, v49, &unk_24F532C70, v9);
  objc_msgSend_defineProperty_descriptor_(v4, v50, v51, CFSTR("kCLAuthorizationStatusRestricted"), v82);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v52, v53, &unk_24F532C88, v9);
  objc_msgSend_defineProperty_descriptor_(v4, v54, v55, CFSTR("kCLAuthorizationStatusDenied"), v82);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v56, v57, &unk_24F532CA0, v9);
  objc_msgSend_defineProperty_descriptor_(v4, v58, v59, CFSTR("kCLAuthorizationStatusAuthorizedAlways"), v82);
  objc_msgSend_setObject_forKeyedSubscript_(v82, v60, v61, &unk_24F532CB8, v9);
  objc_msgSend_defineProperty_descriptor_(v4, v62, v63, CFSTR("kCLAuthorizationStatusAuthorizedWhenInUse"), v82);
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v64, *MEMORY[0x24BDBFA20]);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v82, v66, v67, v65, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v68, v69, CFSTR("CLLocationDistanceMax"), v82);
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v70, *MEMORY[0x24BDBFA28]);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v82, v72, v73, v71, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v74, v75, CFSTR("CLTimeIntervalMax"), v82);
  objc_msgSend_valueWithMKCoordinate_(MEMORY[0x24BDD1968], v76, *MEMORY[0x24BDBFB70], *(double *)(MEMORY[0x24BDBFB70] + 8));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v82, v78, v79, v77, v9);

  objc_msgSend_defineProperty_descriptor_(v4, v80, v81, CFSTR("kCLLocationCoordinate2DInvalid"), v82);
}

@end
