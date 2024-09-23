@implementation WFFaceTimeContextualAction

- (id)uniqueIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[WFContextualAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFaceTimeContextualAction person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(":%@"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFFaceTimeContextualAction person](self, "person");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(":%@"), v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (WFFaceTimeContextualAction)initWithPerson:(id)a3 type:(unint64_t)a4 callTypeSerializedRepresentation:(id)a5 personSerializedRepresentation:(id)a6 namedQueryInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  WFContextualActionParameter *v27;
  void *v28;
  void *v29;
  WFContextualActionIcon *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  WFContextualActionParameter *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  WFFaceTimeContextualAction *v55;
  __CFString *v56;
  WFContextualActionParameter *v57;
  objc_super v58;
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v52 = a7;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFaceTimeContextualAction.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("callTypeSerializedRepresentation"));

    if (v14)
      goto LABEL_4;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFaceTimeContextualAction.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  if (!v13)
    goto LABEL_28;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFaceTimeContextualAction.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personSerializedRepresentation"));

LABEL_4:
  v15 = CFSTR("Video");
  if (a4 == 1)
    v15 = CFSTR("Audio");
  v16 = v15;
  WFLocalizedString(v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nameComponents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "givenName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(v12, "displayName");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;

  v56 = v16;
  if (!objc_msgSend(v22, "length"))
  {
    objc_msgSend(v12, "displayName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(v12, "personHandle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "value");
      v25 = (id)objc_claimAutoreleasedReturnValue();

      v22 = v26;
      v16 = v56;
    }

    v22 = v25;
  }
  v57 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), v17, CFSTR("WFFaceTimeType"), v13);
  v50 = v22;
  v27 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFContactContentItem"), v22, CFSTR("WFFaceTimeContact"), v14);
  objc_msgSend(v12, "image");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_imageData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = [WFContextualActionIcon alloc];
    objc_msgSend(v12, "image");
    v31 = a4;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_imageData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[WFContextualActionIcon initWithImageData:scale:displayStyle:](v30, "initWithImageData:scale:displayStyle:", v33, 1, 2.0);

    a4 = v31;
  }
  else
  {
    v34 = 0;
  }
  v53 = v14;
  v51 = (void *)v17;
  v35 = (void *)v34;
  if (a4 == 1)
  {
    +[WFDevice currentDevice](WFDevice, "currentDevice");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "idiom");

    if (v38 == 1)
    {
      +[WFContextualActionIcon iconWithImageName:](WFContextualActionIcon, "iconWithImageName:", CFSTR("Phone"));
      v39 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v40 = (void *)v39;
      goto LABEL_26;
    }
    v36 = CFSTR("com.apple.mobilephone");
LABEL_24:
    +[WFContextualActionIcon iconWithApplicationBundleIdentifier:](WFContextualActionIcon, "iconWithApplicationBundleIdentifier:", v36);
    v39 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (!a4)
  {
    v36 = CFSTR("com.apple.facetime");
    goto LABEL_24;
  }
  v40 = 0;
LABEL_26:
  objc_msgSend(CFSTR("com.apple.facetime.facetime"), "stringByAppendingFormat:", CFSTR(":%@"), v16);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v57;
  v59[1] = v27;
  v42 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("%@ Call %@"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("FaceTime"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v58.receiver = self;
  v58.super_class = (Class)WFFaceTimeContextualAction;
  v55 = -[WFTopHitItemContextualAction initWithItem:identifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:primaryColor:icon:accessoryIcon:namedQueryInfo:](&v58, sel_initWithItem_identifier_wfActionIdentifier_associatedAppBundleIdentifier_parameters_displayFormatString_title_subtitleFormatString_primaryColor_icon_accessoryIcon_namedQueryInfo_, v12, v41, CFSTR("com.apple.facetime.facetime"), CFSTR("com.apple.facetime"), v43, v44, v45, v50, 4, v35, v40, v52);

  return v55;
}

@end
