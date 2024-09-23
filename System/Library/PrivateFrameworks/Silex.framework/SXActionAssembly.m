@implementation SXActionAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  id v74;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254F03AA0, &__block_literal_global_73);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerProtocol:factory:", &unk_254F61BF0, &__block_literal_global_85_0);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:factory:", objc_opt_class(), &__block_literal_global_88);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "withConfiguration:", &__block_literal_global_90_0);

  objc_msgSend(v3, "publicContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "registerProtocol:factory:", &unk_254F401C8, &__block_literal_global_111);

  objc_msgSend(v3, "publicContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "registerProtocol:factory:", &unk_254F142D0, &__block_literal_global_118);

  objc_msgSend(v3, "publicContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerProtocol:factory:", &unk_254F7CEE8, &__block_literal_global_121);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "inScope:", 2);

  objc_msgSend(v3, "privateContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerClass:factory:", objc_opt_class(), &__block_literal_global_124_1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v19, "withConfiguration:", &__block_literal_global_126_1);

  objc_msgSend(v3, "publicContainer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "registerProtocol:factory:", &unk_254F53C10, &__block_literal_global_136_0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "withConfiguration:", &__block_literal_global_139);

  objc_msgSend(v3, "privateContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v24, "registerProtocol:factory:", &unk_254F180A0, &__block_literal_global_149_1);

  objc_msgSend(v3, "privateContainer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v26, "registerClass:factory:", objc_opt_class(), &__block_literal_global_165);

  objc_msgSend(v3, "privateContainer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v28, "registerClass:factory:", objc_opt_class(), &__block_literal_global_189);

  objc_msgSend(v3, "privateContainer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend(v30, "registerClass:factory:", objc_opt_class(), &__block_literal_global_195);

  objc_msgSend(v3, "publicContainer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (id)objc_msgSend(v32, "registerClass:factory:", objc_opt_class(), &__block_literal_global_204_1);

  objc_msgSend(v3, "publicContainer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (id)objc_msgSend(v34, "registerClass:factory:", objc_opt_class(), &__block_literal_global_209);

  objc_msgSend(v3, "publicContainer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (id)objc_msgSend(v36, "registerClass:factory:", objc_opt_class(), &__block_literal_global_211);

  objc_msgSend(v3, "publicContainer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (id)objc_msgSend(v38, "registerClass:factory:", objc_opt_class(), &__block_literal_global_216);

  objc_msgSend(v3, "publicContainer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)objc_msgSend(v40, "registerClass:factory:", objc_opt_class(), &__block_literal_global_219);

  objc_msgSend(v3, "publicContainer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (id)objc_msgSend(v42, "registerProtocol:factory:", &unk_254F3E4D0, &__block_literal_global_224_0);

  objc_msgSend(v3, "privateContainer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (id)objc_msgSend(v44, "registerProtocol:factory:", &unk_254F049D8, &__block_literal_global_227);

  objc_msgSend(v3, "privateContainer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (id)objc_msgSend(v46, "registerClass:factory:", objc_opt_class(), &__block_literal_global_231_1);

  objc_msgSend(v3, "privateContainer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (id)objc_msgSend(v48, "registerClass:factory:", objc_opt_class(), &__block_literal_global_233_1);

  objc_msgSend(v3, "privateContainer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (id)objc_msgSend(v50, "registerClass:factory:", objc_opt_class(), &__block_literal_global_235_0);

  objc_msgSend(v3, "privateContainer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (id)objc_msgSend(v52, "registerClass:factory:", objc_opt_class(), &__block_literal_global_237_0);

  objc_msgSend(v3, "privateContainer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (id)objc_msgSend(v54, "registerClass:factory:", objc_opt_class(), &__block_literal_global_242_0);

  objc_msgSend(v3, "privateContainer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (id)objc_msgSend(v56, "registerClass:factory:", objc_opt_class(), &__block_literal_global_244_0);

  objc_msgSend(v3, "privateContainer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (id)objc_msgSend(v58, "registerClass:factory:", objc_opt_class(), &__block_literal_global_246_0);

  objc_msgSend(v3, "privateContainer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (id)objc_msgSend(v60, "registerClass:factory:", objc_opt_class(), &__block_literal_global_248_0);

  objc_msgSend(v3, "privateContainer");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (id)objc_msgSend(v62, "registerClass:factory:", objc_opt_class(), &__block_literal_global_250);

  objc_msgSend(v3, "privateContainer");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (id)objc_msgSend(v64, "registerClass:factory:", objc_opt_class(), &__block_literal_global_252);

  objc_msgSend(v3, "privateContainer");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (id)objc_msgSend(v66, "registerClass:factory:", objc_opt_class(), &__block_literal_global_254);

  objc_msgSend(v3, "privateContainer");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (id)objc_msgSend(v68, "registerClass:factory:", objc_opt_class(), &__block_literal_global_256_0);

  objc_msgSend(v3, "publicContainer");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (id)objc_msgSend(v70, "registerProtocol:factory:", &unk_254F2FF90, &__block_literal_global_258);

  objc_msgSend(v3, "privateContainer");
  v74 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v74, "registerClass:factory:", objc_opt_class(), &__block_literal_global_261);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (id)objc_msgSend(v72, "inScope:", 2);

}

SXPostActionHandlerManager *__35__SXActionAssembly_loadInRegistry___block_invoke_7()
{
  return objc_alloc_init(SXPostActionHandlerManager);
}

SXActionManager *__35__SXActionAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SXActionManager *v3;
  void *v4;
  void *v5;
  void *v6;
  SXActionManager *v7;

  v2 = a2;
  v3 = [SXActionManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F53C10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F180A0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F7CEE8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXActionManager initWithActionActivityManager:viewManager:postActionHandlerManager:](v3, "initWithActionActivityManager:viewManager:postActionHandlerManager:", v4, v5, v6);
  return v7;
}

id __35__SXActionAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SXActionEngine *__35__SXActionAssembly_loadInRegistry___block_invoke_3()
{
  return objc_alloc_init(SXActionEngine);
}

void __35__SXActionAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerFactory:URLHost:", v9, CFSTR("link"));
  objc_msgSend(v4, "registerFactory:additionType:", v9, objc_opt_class());
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerFactory:URLHost:", v6, CFSTR("email"));
  objc_msgSend(v4, "registerFactory:additionType:", v6, objc_opt_class());
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerFactory:URLHost:", v7, CFSTR("phone-number"));
  objc_msgSend(v4, "registerFactory:additionType:", v7, objc_opt_class());
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "registerFactory:URLHost:", v8, CFSTR("calendar-event"));
  objc_msgSend(v4, "registerFactory:additionType:", v8, objc_opt_class());

}

SXURLActionFactory *__35__SXActionAssembly_loadInRegistry___block_invoke_5()
{
  return objc_alloc_init(SXURLActionFactory);
}

id __35__SXActionAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SXActionSerializationManager *__35__SXActionAssembly_loadInRegistry___block_invoke_8()
{
  return objc_alloc_init(SXActionSerializationManager);
}

void __35__SXActionAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerSerializer:actionType:", v6, CFSTR("link"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerSerializer:actionType:", v7, CFSTR("email"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerSerializer:actionType:", v8, CFSTR("phone_number"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerSerializer:actionType:", v9, CFSTR("calendar"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerSerializer:actionType:", v10, CFSTR("webcal"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerSerializer:actionType:", v11, CFSTR("bookmark"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerSerializer:actionType:", v12, CFSTR("subscribe"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "registerSerializer:actionType:", v13, CFSTR("close"));
}

SXActionActivityManager *__35__SXActionAssembly_loadInRegistry___block_invoke_10()
{
  return objc_alloc_init(SXActionActivityManager);
}

void __35__SXActionAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerActionActivityProvider:actionType:", v6, CFSTR("link"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerActionActivityProvider:actionType:", v7, CFSTR("email"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerActionActivityProvider:actionType:", v8, CFSTR("phone_number"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerActionActivityProvider:actionType:", v9, CFSTR("calendar"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerActionActivityProvider:actionType:", v10, CFSTR("webcal"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerActionActivityProvider:actionType:", v11, CFSTR("bookmark"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerActionActivityProvider:actionType:", v12, CFSTR("subscribe"));

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "registerActionActivityProvider:actionType:", v13, CFSTR("close"));
}

SXActionViewManager *__35__SXActionAssembly_loadInRegistry___block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  SXActionViewManager *v3;
  void *v4;
  SXActionViewManager *v5;

  v2 = a2;
  v3 = [SXActionViewManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F40D68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXActionViewManager initWithViewControllerPresenting:](v3, "initWithViewControllerPresenting:", v4);
  return v5;
}

SXLinkActionActivityProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  SXLinkActionActivityProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SXLinkActionActivityProvider *v8;

  v2 = a2;
  v3 = [SXLinkActionActivityProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91D88);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91E50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F1A9C0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F2FF90);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SXLinkActionActivityProvider initWithURLHandler:URLPreviewing:host:URLQualifier:](v3, "initWithURLHandler:URLPreviewing:host:URLQualifier:", v4, v5, v6, v7);
  return v8;
}

SXEmailActionActivityProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  SXEmailActionActivityProvider *v3;
  void *v4;
  SXEmailActionActivityProvider *v5;

  v2 = a2;
  v3 = [SXEmailActionActivityProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91F08);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXEmailActionActivityProvider initWithMailPresenter:](v3, "initWithMailPresenter:", v4);
  return v5;
}

SXPhoneNumberActionActivityProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  SXPhoneNumberActionActivityProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  SXPhoneNumberActionActivityProvider *v7;

  v2 = a2;
  v3 = [SXPhoneNumberActionActivityProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F1A9C0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91FC8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F685B0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXPhoneNumberActionActivityProvider initWithHost:messagePresenter:deviceCapabilities:](v3, "initWithHost:messagePresenter:deviceCapabilities:", v4, v5, v6);
  return v7;
}

SXCalendarEventActionActivityProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  SXCalendarEventActionActivityProvider *v3;
  void *v4;
  void *v5;
  SXCalendarEventActionActivityProvider *v6;

  v2 = a2;
  v3 = [SXCalendarEventActionActivityProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F049D8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F1A9C0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXCalendarEventActionActivityProvider initWithCalendarPresenter:host:](v3, "initWithCalendarPresenter:host:", v4, v5);
  return v6;
}

SXWebCalActionActivityProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_17()
{
  return objc_alloc_init(SXWebCalActionActivityProvider);
}

id *__35__SXActionAssembly_loadInRegistry___block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  SXBookmarkActionActivityProvider *v3;
  void *v4;
  id *v5;

  v2 = a2;
  v3 = [SXBookmarkActionActivityProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F2FB38);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXBookmarkActionActivityProvider initWithBookmarkManager:]((id *)&v3->super.isa, v4);
  return v5;
}

SXSubscribeActionActivityProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_19(uint64_t a1, void *a2)
{
  id v2;
  SXSubscribeActionActivityProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  SXSubscribeActionActivityProvider *v7;

  v2 = a2;
  v3 = [SXSubscribeActionActivityProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F7C5D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F40D68);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F03AA0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXSubscribeActionActivityProvider initWithHandler:viewControllerPresenting:actionManager:](v3, "initWithHandler:viewControllerPresenting:actionManager:", v4, v5, v6);
  return v7;
}

id *__35__SXActionAssembly_loadInRegistry___block_invoke_20(uint64_t a1, void *a2)
{
  id v2;
  SXCloseActionActivityProvider *v3;
  void *v4;
  void *v5;
  id *v6;

  v2 = a2;
  v3 = [SXCloseActionActivityProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F40D68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3E4D0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXCloseActionActivityProvider initWithViewControllerPresenting:handler:]((id *)&v3->super.isa, v4, v5);
  return v6;
}

SXCloseActionHandler *__35__SXActionAssembly_loadInRegistry___block_invoke_21()
{
  return objc_alloc_init(SXCloseActionHandler);
}

SXCalendarPresenter *__35__SXActionAssembly_loadInRegistry___block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  SXCalendarPresenter *v3;
  void *v4;
  void *v5;
  SXCalendarPresenter *v6;

  v2 = a2;
  v3 = [SXCalendarPresenter alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F40D68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXCalendarPresenter initWithViewControllerPresenting:eventStoreProvider:](v3, "initWithViewControllerPresenting:eventStoreProvider:", v4, v5);
  return v6;
}

SXLinkActionFactory *__35__SXActionAssembly_loadInRegistry___block_invoke_23(uint64_t a1, void *a2)
{
  id v2;
  SXLinkActionFactory *v3;
  void *v4;
  SXLinkActionFactory *v5;

  v2 = a2;
  v3 = [SXLinkActionFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F401C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXLinkActionFactory initWithURLActionFactory:](v3, "initWithURLActionFactory:", v4);
  return v5;
}

SXEmailActionFactory *__35__SXActionAssembly_loadInRegistry___block_invoke_24()
{
  return objc_alloc_init(SXEmailActionFactory);
}

SXPhoneNumberActionFactory *__35__SXActionAssembly_loadInRegistry___block_invoke_25()
{
  return objc_alloc_init(SXPhoneNumberActionFactory);
}

SXCalendarEventActionFactory *__35__SXActionAssembly_loadInRegistry___block_invoke_26(uint64_t a1, void *a2)
{
  id v2;
  SXCalendarEventActionFactory *v3;
  void *v4;
  SXCalendarEventActionFactory *v5;

  v2 = a2;
  v3 = [SXCalendarEventActionFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F69A40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXCalendarEventActionFactory initWithDateParser:](v3, "initWithDateParser:", v4);
  return v5;
}

SXLinkActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_27()
{
  return objc_alloc_init(SXLinkActionSerializer);
}

SXEmailActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_28()
{
  return objc_alloc_init(SXEmailActionSerializer);
}

SXPhoneNumberActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_29()
{
  return objc_alloc_init(SXPhoneNumberActionSerializer);
}

SXCalendarEventActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_30()
{
  return objc_alloc_init(SXCalendarEventActionSerializer);
}

SXWebCalActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_31()
{
  return objc_alloc_init(SXWebCalActionSerializer);
}

SXBookmarkActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_32()
{
  return objc_alloc_init(SXBookmarkActionSerializer);
}

SXSubscribeActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_33()
{
  return objc_alloc_init(SXSubscribeActionSerializer);
}

SXCloseActionSerializer *__35__SXActionAssembly_loadInRegistry___block_invoke_34()
{
  return objc_alloc_init(SXCloseActionSerializer);
}

SXLinkActionURLQualifier *__35__SXActionAssembly_loadInRegistry___block_invoke_35()
{
  return objc_alloc_init(SXLinkActionURLQualifier);
}

SXEventStoreProvider *__35__SXActionAssembly_loadInRegistry___block_invoke_36()
{
  return objc_alloc_init(SXEventStoreProvider);
}

@end
