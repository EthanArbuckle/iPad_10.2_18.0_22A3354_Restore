@implementation CRLInspectorTextFieldNumberFormatter

+ (void)initialize
{
  id v3;
  CRLInspectorTextFieldNumberFormatter *v4;
  void *v5;
  void *v6;
  void *v7;
  CRLAccessibilityValueFormat *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  CRLAccessibilityValueFormat *v13;
  CRLInspectorTextFieldNumberFormatter *v14;
  void *v15;
  void *v16;
  void *v17;
  CRLAccessibilityValueFormat *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  CRLAccessibilityValueFormat *v23;
  CRLInspectorTextFieldNumberFormatter *v24;
  void *v25;
  void *v26;
  void *v27;
  CRLAccessibilityValueFormat *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  CRLAccessibilityValueFormat *v33;
  CRLInspectorTextFieldNumberFormatter *v34;
  void *v35;
  void *v36;
  void *v37;
  CRLAccessibilityValueFormat *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  CRLAccessibilityValueFormat *v43;
  CRLInspectorTextFieldNumberFormatter *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  CRLAccessibilityValueFormat *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  CRLAccessibilityValueFormat *v55;
  CRLInspectorTextFieldNumberFormatter *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  CRLAccessibilityValueFormat *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  CRLAccessibilityValueFormat *v67;
  CRLInspectorTextFieldPointLengthFormatter *v68;
  void *v69;
  CRLInspectorTextFieldPrecisePointLengthFormatter *v70;
  void *v71;
  CRLInspectorTextFieldLengthFormatter *v72;
  void *v73;
  CRLInspectorTextFieldAngleFormatter *v74;
  void *v75;
  CRLInspectorTextFieldPercentFormatter *v76;
  void *v77;
  CRLSecondsDurationFormatter *v78;
  void *v79;
  CRLVerboseSecondsDurationFormatter *v80;
  void *v81;

  objc_opt_class(CRLInspectorTextFieldNumberFormatter, a2);
  if (v3 == a1)
  {
    v4 = objc_alloc_init(CRLInspectorTextFieldNumberFormatter);
    v5 = (void *)qword_1014159B0;
    qword_1014159B0 = (uint64_t)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("0 pt"), 0, 0));
    objc_msgSend((id)qword_1014159B0, "crl_setFormat:", v7);

    v8 = [CRLAccessibilityValueFormat alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("0"), 0, 0));
    v11 = CRLAccessibilityStringsDictKey(CFSTR("inspector.field.points"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = -[CRLAccessibilityValueFormat initWithNumberFormat:andUnitStringsDictKey:](v8, "initWithNumberFormat:andUnitStringsDictKey:", v10, v12);
    objc_msgSend((id)qword_1014159B0, "setCrlaxValueFormat:", v13);

    objc_msgSend((id)qword_1014159B0, "setCrlaxRulerUnitType:", 2);
    objc_msgSend((id)qword_1014159B0, "setLenient:", 1);
    v14 = objc_alloc_init(CRLInspectorTextFieldNumberFormatter);
    v15 = (void *)qword_1014159B8;
    qword_1014159B8 = (uint64_t)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("0.## pt"), 0, 0));
    objc_msgSend((id)qword_1014159B8, "crl_setFormat:", v17);

    v18 = [CRLAccessibilityValueFormat alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("0.##"), 0, 0));
    v21 = CRLAccessibilityStringsDictKey(CFSTR("inspector.field.points"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = -[CRLAccessibilityValueFormat initWithNumberFormat:andUnitStringsDictKey:](v18, "initWithNumberFormat:andUnitStringsDictKey:", v20, v22);
    objc_msgSend((id)qword_1014159B8, "setCrlaxValueFormat:", v23);

    objc_msgSend((id)qword_1014159B8, "setCrlaxRulerUnitType:", 2);
    objc_msgSend((id)qword_1014159B8, "setLenient:", 1);
    v24 = objc_alloc_init(CRLInspectorTextFieldNumberFormatter);
    v25 = (void *)qword_1014159C0;
    qword_1014159C0 = (uint64_t)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("0 px"), 0, 0));
    objc_msgSend((id)qword_1014159C0, "crl_setFormat:", v27);

    v28 = [CRLAccessibilityValueFormat alloc];
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("0"), 0, 0));
    v31 = CRLAccessibilityStringsDictKey(CFSTR("inspector.field.pixels"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = -[CRLAccessibilityValueFormat initWithNumberFormat:andUnitStringsDictKey:](v28, "initWithNumberFormat:andUnitStringsDictKey:", v30, v32);
    objc_msgSend((id)qword_1014159C0, "setCrlaxValueFormat:", v33);

    objc_msgSend((id)qword_1014159C0, "setCrlaxRulerUnitType:", 4);
    objc_msgSend((id)qword_1014159C0, "setLenient:", 1);
    v34 = objc_alloc_init(CRLInspectorTextFieldNumberFormatter);
    v35 = (void *)qword_1014159C8;
    qword_1014159C8 = (uint64_t)v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("0.## px"), 0, 0));
    objc_msgSend((id)qword_1014159C8, "crl_setFormat:", v37);

    v38 = [CRLAccessibilityValueFormat alloc];
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("0.##"), 0, 0));
    v41 = CRLAccessibilityStringsDictKey(CFSTR("inspector.field.pixels"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v43 = -[CRLAccessibilityValueFormat initWithNumberFormat:andUnitStringsDictKey:](v38, "initWithNumberFormat:andUnitStringsDictKey:", v40, v42);
    objc_msgSend((id)qword_1014159C8, "setCrlaxValueFormat:", v43);

    objc_msgSend((id)qword_1014159C8, "setCrlaxRulerUnitType:", 4);
    objc_msgSend((id)qword_1014159C8, "setLenient:", 1);
    v44 = objc_alloc_init(CRLInspectorTextFieldNumberFormatter);
    v45 = (void *)qword_1014159D0;
    qword_1014159D0 = (uint64_t)v44;

    v46 = (void *)qword_1014159D0;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 / 72.0));
    objc_msgSend(v46, "setMultiplier:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("0.## in"), 0, 0));
    objc_msgSend((id)qword_1014159D0, "crl_setFormat:", v49);

    v50 = [CRLAccessibilityValueFormat alloc];
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("0.##"), 0, 0));
    v53 = CRLAccessibilityStringsDictKey(CFSTR("inspector.field.inches"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = -[CRLAccessibilityValueFormat initWithNumberFormat:andUnitStringsDictKey:](v50, "initWithNumberFormat:andUnitStringsDictKey:", v52, v54);
    objc_msgSend((id)qword_1014159D0, "setCrlaxValueFormat:", v55);

    objc_msgSend((id)qword_1014159D0, "setCrlaxRulerUnitType:", 0);
    objc_msgSend((id)qword_1014159D0, "setLenient:", 1);
    v56 = objc_alloc_init(CRLInspectorTextFieldNumberFormatter);
    v57 = (void *)qword_1014159D8;
    qword_1014159D8 = (uint64_t)v56;

    v58 = (void *)qword_1014159D8;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 / 28.346457));
    objc_msgSend(v58, "setMultiplier:", v59);

    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("0.## cm"), 0, 0));
    objc_msgSend((id)qword_1014159D8, "crl_setFormat:", v61);

    v62 = [CRLAccessibilityValueFormat alloc];
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("0.##"), 0, 0));
    v65 = CRLAccessibilityStringsDictKey(CFSTR("inspector.field.centimeters"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    v67 = -[CRLAccessibilityValueFormat initWithNumberFormat:andUnitStringsDictKey:](v62, "initWithNumberFormat:andUnitStringsDictKey:", v64, v66);
    objc_msgSend((id)qword_1014159D8, "setCrlaxValueFormat:", v67);

    objc_msgSend((id)qword_1014159D8, "setCrlaxRulerUnitType:", 1);
    objc_msgSend((id)qword_1014159D8, "setLenient:", 1);
    v68 = objc_alloc_init(CRLInspectorTextFieldPointLengthFormatter);
    v69 = (void *)qword_1014159E0;
    qword_1014159E0 = (uint64_t)v68;

    objc_msgSend((id)qword_1014159E0, "setLenient:", 1);
    v70 = objc_alloc_init(CRLInspectorTextFieldPrecisePointLengthFormatter);
    v71 = (void *)qword_1014159E8;
    qword_1014159E8 = (uint64_t)v70;

    objc_msgSend((id)qword_1014159E8, "setLenient:", 1);
    v72 = objc_alloc_init(CRLInspectorTextFieldLengthFormatter);
    v73 = (void *)qword_1014159F0;
    qword_1014159F0 = (uint64_t)v72;

    objc_msgSend((id)qword_1014159F0, "setLenient:", 1);
    v74 = objc_alloc_init(CRLInspectorTextFieldAngleFormatter);
    v75 = (void *)qword_1014159F8;
    qword_1014159F8 = (uint64_t)v74;

    objc_msgSend((id)qword_1014159F8, "setLenient:", 1);
    v76 = objc_alloc_init(CRLInspectorTextFieldPercentFormatter);
    v77 = (void *)qword_101415A00;
    qword_101415A00 = (uint64_t)v76;

    objc_msgSend((id)qword_101415A00, "setLenient:", 1);
    v78 = objc_alloc_init(CRLSecondsDurationFormatter);
    v79 = (void *)qword_101415A08;
    qword_101415A08 = (uint64_t)v78;

    objc_msgSend((id)qword_101415A08, "setLenient:", 1);
    v80 = objc_alloc_init(CRLVerboseSecondsDurationFormatter);
    v81 = (void *)qword_101415A10;
    qword_101415A10 = (uint64_t)v80;

    objc_msgSend((id)qword_101415A10, "setLenient:", 1);
  }
}

+ (CRLInspectorTextFieldNumberFormatter)rulerLengthFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_1014159F0;
}

+ (CRLInspectorTextFieldNumberFormatter)pointsFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_1014159E0;
}

+ (CRLInspectorTextFieldNumberFormatter)precisePointsFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_1014159E8;
}

+ (CRLInspectorTextFieldNumberFormatter)angleFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_1014159F8;
}

+ (CRLInspectorTextFieldNumberFormatter)percentFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_101415A00;
}

+ (CRLInspectorTextFieldNumberFormatter)longDurationFormatter
{
  return 0;
}

+ (CRLInspectorTextFieldNumberFormatter)secondsFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_101415A08;
}

+ (CRLInspectorTextFieldNumberFormatter)verboseSecondsFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_101415A10;
}

+ (CRLInspectorTextFieldNumberFormatter)dateFormatter
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLInspectorTextFieldNumberFormatter;
  v4 = -[CRLInspectorTextFieldNumberFormatter copyWithZone:](&v7, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldAbstractNumberFormatter crlaxValueFormat](self, "crlaxValueFormat"));
  objc_msgSend(v4, "setCrlaxValueFormat:", v5);

  return v4;
}

@end
