@implementation VSAppDescriptionValueType

void __VSAppDescriptionValueType_block_invoke()
{
  uint64_t v0;
  void *v1;

  __VSAppDescriptionValueType_block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSAppDescriptionValueType___vs_lazy_init_variable;
  VSAppDescriptionValueType___vs_lazy_init_variable = v0;

}

id __VSAppDescriptionValueType_block_invoke_2()
{
  id v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v0 = objc_alloc_init(MEMORY[0x24BDF8CB8]);
  objc_msgSend(v0, "setImplementationClass:", objc_opt_class());
  v1 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v2 = (void *)MEMORY[0x24BDF8CC0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("displayName"), 2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v4);

  v5 = (void *)MEMORY[0x24BDF8CC0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("adamID"), 2, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v7);

  v8 = (void *)MEMORY[0x24BDF8CC0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("buyParams"), 2, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v10);

  v11 = (void *)MEMORY[0x24BDF8CC0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("bundleID"), 2, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v13);

  v14 = (void *)MEMORY[0x24BDF8CC0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("sellerName"), 2, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v16);

  v17 = (void *)MEMORY[0x24BDF8CC0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("externalVersionID"), 2, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v19);

  v20 = (void *)MEMORY[0x24BDF8CC0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("icon"), 2, v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v22);

  v23 = (void *)MEMORY[0x24BDF8CC0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("appStoreURL"), 2, v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v25);

  v26 = (void *)MEMORY[0x24BDF8CC0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("privacyPolicyEndpointURL"), 2, v27, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v28);

  v29 = (void *)MEMORY[0x24BDF8CC0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("licenseAgreementEndpointURL"), 2, v30, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v31);

  v32 = (void *)MEMORY[0x24BDF8CC0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("rating"), 2, v33, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v34);

  v35 = (void *)MEMORY[0x24BDF8CC0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("contentRank"), 2, v36, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v37);

  objc_msgSend(MEMORY[0x24BDF8CC0], "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("offersInAppPurchases"), 0, 0, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v38);

  objc_msgSend(MEMORY[0x24BDF8CC0], "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("appType"), 1, 0, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v39);

  objc_msgSend(MEMORY[0x24BDF8CC0], "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("defaultAppForProvider"), 0, 0, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v40);

  v41 = (void *)MEMORY[0x24BDF8CC0];
  v42 = (void *)MEMORY[0x24BDBCF20];
  v43 = objc_opt_class();
  objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("deviceFamilies"), 2, v44, MEMORY[0x24BDBD1A8]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v45);

  v46 = (void *)MEMORY[0x24BDF8CC0];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "valueTypePropertyWithName:kind:allowedClasses:initialValue:", CFSTR("visionOSCompatible"), 2, v47, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v48);

  objc_msgSend(v0, "setProperties:", v1);
  return v0;
}

@end
