@implementation UIWindow

+ (void)music_setWantsLayoutInsetsUsingBlock:(id)a3
{
  id v3;
  objc_class *v4;
  id v5;
  _QWORD *v6;
  void (*v7)(void);
  objc_method *InstanceMethod;
  const char *TypeEncoding;
  IMP v10;
  id v11;
  _QWORD *v12;
  void (*v13)(void);
  objc_method *v14;
  const char *v15;
  IMP v16;
  id v17;
  _QWORD *v18;
  void (*v19)(void);
  objc_method *v20;
  const char *v21;
  IMP v22;
  id v23;
  _QWORD *v24;
  void (*v25)(void);
  objc_method *v26;
  const char *v27;
  IMP v28;
  objc_class *v29;
  id v30;
  _QWORD *v31;
  void (*v32)(void);
  objc_method *v33;
  const char *v34;
  IMP v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  const char *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  uint64_t *v46;
  const char *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  const char *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[4];
  id v61;
  uint64_t *v62;
  const char *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[4];
  id v69;
  uint64_t *v70;
  const char *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class(UIWindow);
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke;
  v68[3] = &unk_1339040;
  v70 = &v72;
  v71 = "layoutSubviews";
  v5 = v3;
  v69 = v5;
  v6 = objc_retainBlock(v68);
  v7 = imp_implementationWithBlock(v6);
  InstanceMethod = class_getInstanceMethod(v4, "layoutSubviews");
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  v10 = class_replaceMethod(v4, "layoutSubviews", v7, TypeEncoding);

  v73[3] = (uint64_t)v10;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_2;
  v60[3] = &unk_1339068;
  v62 = &v64;
  v63 = "traitCollectionDidChange:";
  v11 = v5;
  v61 = v11;
  v12 = objc_retainBlock(v60);
  v13 = imp_implementationWithBlock(v12);
  v14 = class_getInstanceMethod(v4, "traitCollectionDidChange:");
  v15 = method_getTypeEncoding(v14);
  v16 = class_replaceMethod(v4, "traitCollectionDidChange:", v13, v15);

  v65[3] = (uint64_t)v16;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_3;
  v52[3] = &unk_1339090;
  v54 = &v56;
  v55 = "initWithCoder:";
  v17 = v11;
  v53 = v17;
  v18 = objc_retainBlock(v52);
  v19 = imp_implementationWithBlock(v18);
  v20 = class_getInstanceMethod(v4, "initWithCoder:");
  v21 = method_getTypeEncoding(v20);
  v22 = class_replaceMethod(v4, "initWithCoder:", v19, v21);

  v57[3] = (uint64_t)v22;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_4;
  v44[3] = &unk_13390B8;
  v46 = &v48;
  v47 = "initWithFrame:";
  v23 = v17;
  v45 = v23;
  v24 = objc_retainBlock(v44);
  v25 = imp_implementationWithBlock(v24);
  v26 = class_getInstanceMethod(v4, "initWithFrame:");
  v27 = method_getTypeEncoding(v26);
  v28 = class_replaceMethod(v4, "initWithFrame:", v25, v27);

  v49[3] = (uint64_t)v28;
  if (music_setWantsLayoutInsetsUsingBlock__onceToken != -1)
    dispatch_once(&music_setWantsLayoutInsetsUsingBlock__onceToken, &__block_literal_global_1);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v29 = (objc_class *)music_setWantsLayoutInsetsUsingBlock__sPopoverViewClass;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_6;
  v36[3] = &unk_1339120;
  v38 = &v40;
  v39 = "initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:";
  v30 = v23;
  v37 = v30;
  v31 = objc_retainBlock(v36);
  v32 = imp_implementationWithBlock(v31);
  v33 = class_getInstanceMethod(v4, "initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:");
  v34 = method_getTypeEncoding(v33);
  v35 = class_replaceMethod(v29, "initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:", v32, v34);

  v41[3] = (uint64_t)v35;
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v72, 8);

}

void __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);
  uint64_t v5;
  IMP MethodImplementation;
  id v7;

  v3 = a2;
  v4 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = v3;
  if (v4)
    goto LABEL_2;
  v5 = objc_opt_class(v3);
  if (v5 == objc_opt_class(UIWindow))
  {
    MethodImplementation = class_getMethodImplementation((Class)objc_msgSend(v7, "superclass"), *(SEL *)(a1 + 48));
    if (MethodImplementation)
    {
      v4 = MethodImplementation;
LABEL_2:
      v4();
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v7, "music_setLayoutInsets:");

}

void __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(id, _QWORD, id);
  uint64_t v7;
  IMP MethodImplementation;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(void (**)(id, _QWORD, id))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6)
  {
    v6(v9, *(_QWORD *)(a1 + 48), v5);
  }
  else
  {
    v7 = objc_opt_class(v9);
    if (v7 == objc_opt_class(UIWindow))
    {
      MethodImplementation = class_getMethodImplementation((Class)objc_msgSend(v9, "superclass"), *(SEL *)(a1 + 48));
      if (MethodImplementation)
        ((void (*)(id, _QWORD, id))MethodImplementation)(v9, *(_QWORD *)(a1 + 48), v5);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v9, "music_setLayoutInsets:");

}

id __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t (*v7)(id, _QWORD, id);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IMP MethodImplementation;

  v5 = a2;
  v6 = a3;
  v7 = *(uint64_t (**)(id, _QWORD, id))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v7)
  {
    v8 = v7(v5, *(_QWORD *)(a1 + 48), v6);
LABEL_3:
    v9 = objc_claimAutoreleasedReturnValue(v8);

    v5 = (id)v9;
    goto LABEL_5;
  }
  v10 = objc_opt_class(v5);
  if (v10 == objc_opt_class(UIWindow))
  {
    MethodImplementation = class_getMethodImplementation((Class)objc_msgSend(v5, "superclass"), *(SEL *)(a1 + 48));
    if (MethodImplementation)
    {
      v8 = ((uint64_t (*)(id, _QWORD, id))MethodImplementation)(v5, *(_QWORD *)(a1 + 48), v6);
      goto LABEL_3;
    }
  }
LABEL_5:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v5, "music_setLayoutInsets:");

  return v5;
}

id __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_4(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  void *v12;
  uint64_t (*v13)(id, _QWORD, double, double, double, double);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  IMP MethodImplementation;

  v11 = a2;
  v12 = v11;
  v13 = *(uint64_t (**)(id, _QWORD, double, double, double, double))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                             + 24);
  if (v13)
  {
    v14 = v13(v11, *(_QWORD *)(a1 + 48), a3, a4, a5, a6);
LABEL_3:
    v15 = objc_claimAutoreleasedReturnValue(v14);

    v12 = (void *)v15;
    goto LABEL_5;
  }
  v16 = objc_opt_class(v11);
  if (v16 == objc_opt_class(UIWindow))
  {
    MethodImplementation = class_getMethodImplementation((Class)objc_msgSend(v12, "superclass"), *(SEL *)(a1 + 48));
    if (MethodImplementation)
    {
      v14 = ((uint64_t (*)(void *, _QWORD, double, double, double, double))MethodImplementation)(v12, *(_QWORD *)(a1 + 48), a3, a4, a5, a6);
      goto LABEL_3;
    }
  }
LABEL_5:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v12, "music_setLayoutInsets:");
  return v12;
}

void __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_5(id a1)
{
  music_setWantsLayoutInsetsUsingBlock__sPopoverViewClass = (uint64_t)NSClassFromString(CFSTR("_UIPopoverView"));
}

id __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  id v17;
  void *v18;
  uint64_t (*v19)(id, _QWORD, uint64_t, uint64_t, uint64_t, double, double, double, double);
  uint64_t v20;
  uint64_t v21;
  IMP MethodImplementation;

  v17 = a2;
  v18 = v17;
  v19 = *(uint64_t (**)(id, _QWORD, uint64_t, uint64_t, uint64_t, double, double, double, double))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v19)
  {
    v20 = v19(v17, *(_QWORD *)(a1 + 48), a3, a4, a5, a6, a7, a8, a9);
LABEL_3:
    v21 = objc_claimAutoreleasedReturnValue(v20);

    v18 = (void *)v21;
    goto LABEL_5;
  }
  if (objc_opt_class(v17) == music_setWantsLayoutInsetsUsingBlock__sPopoverViewClass)
  {
    MethodImplementation = class_getMethodImplementation((Class)objc_msgSend(v18, "superclass"), *(SEL *)(a1 + 48));
    if (MethodImplementation)
    {
      v20 = ((uint64_t (*)(void *, _QWORD, uint64_t, uint64_t, uint64_t, double, double, double, double))MethodImplementation)(v18, *(_QWORD *)(a1 + 48), a3, a4, a5, a6, a7, a8, a9);
      goto LABEL_3;
    }
  }
LABEL_5:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v18, "music_setLayoutInsets:");
  return v18;
}

@end
