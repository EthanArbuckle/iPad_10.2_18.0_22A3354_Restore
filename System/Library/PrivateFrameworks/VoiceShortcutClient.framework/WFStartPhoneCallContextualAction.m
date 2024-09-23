@implementation WFStartPhoneCallContextualAction

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
  -[WFStartPhoneCallContextualAction person](self, "person");
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
    -[WFStartPhoneCallContextualAction person](self, "person");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(":%@"), v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (WFStartPhoneCallContextualAction)initWithPerson:(id)a3 serializedRepresentation:(id)a4 namedQueryInfo:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  WFContextualActionParameter *v20;
  void *v21;
  void *v22;
  WFContextualActionIcon *v23;
  WFContextualActionIcon *v24;
  void *v25;
  void *v26;
  WFContextualActionIcon *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  WFStartPhoneCallContextualAction *v32;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  objc_super v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v37 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStartPhoneCallContextualAction.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFStartPhoneCallContextualAction.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serializedRepresentation"));

LABEL_3:
  objc_msgSend(v9, "nameComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "givenName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v9, "displayName");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  if (!objc_msgSend(v15, "length"))
  {
    objc_msgSend(v9, "displayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(v9, "personHandle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "value");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v15 = v19;
    }

    v15 = v18;
  }
  v20 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFContactContentItem"), v15, CFSTR("WFCallContact"), v10);
  objc_msgSend(v9, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_imageData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [WFContextualActionIcon alloc];
  v24 = v23;
  v36 = v10;
  if (v22)
  {
    objc_msgSend(v9, "image");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_imageData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[WFContextualActionIcon initWithImageData:scale:displayStyle:](v24, "initWithImageData:scale:displayStyle:", v26, 1, 2.0);

  }
  else
  {
    v27 = -[WFContextualActionIcon initWithSystemName:](v23, "initWithSystemName:", CFSTR("person.fill"));
  }
  v39[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Call %@"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Start Call"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContextualActionIcon iconWithApplicationBundleIdentifier:](WFContextualActionIcon, "iconWithApplicationBundleIdentifier:", CFSTR("com.apple.mobilephone"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38.receiver = self;
  v38.super_class = (Class)WFStartPhoneCallContextualAction;
  v32 = -[WFTopHitItemContextualAction initWithItem:identifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:primaryColor:icon:accessoryIcon:namedQueryInfo:](&v38, sel_initWithItem_identifier_wfActionIdentifier_associatedAppBundleIdentifier_parameters_displayFormatString_title_subtitleFormatString_primaryColor_icon_accessoryIcon_namedQueryInfo_, v9, CFSTR("com.apple.mobilephone.call"), CFSTR("com.apple.mobilephone.call"), CFSTR("com.apple.mobilephone"), v28, v29, v30, v15, 4, v27, v31, v37);

  return v32;
}

+ (void)getTopHitContextualActionsWithLimit:(int64_t)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("TopHitItemContextualActionError"), 0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v7);

}

@end
