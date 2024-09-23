@implementation WFConfiguredStaccatoIntentAction

- (WFConfiguredStaccatoIntentAction)initWithIntent:(id)a3 named:(id)a4 previewIcon:(id)a5 appShortcutIdentifier:(id)a6 templateParameterValues:(id)a7 contextualParameters:(id)a8 shortcutsMetadata:(id)a9
{
  NSDictionary *v15;
  WFConfiguredStaccatoIntentAction *v16;
  NSDictionary *templateParameterValues;
  objc_super v19;

  v15 = (NSDictionary *)a7;
  v19.receiver = self;
  v19.super_class = (Class)WFConfiguredStaccatoIntentAction;
  v16 = -[WFConfiguredSystemIntentAction initWithIntent:named:previewIcon:appShortcutIdentifier:contextualParameters:shortcutsMetadata:](&v19, sel_initWithIntent_named_previewIcon_appShortcutIdentifier_contextualParameters_shortcutsMetadata_, a3, a4, a5, a6, a8, a9);
  templateParameterValues = v16->_templateParameterValues;
  v16->_templateParameterValues = v15;

  return v16;
}

- (WFConfiguredStaccatoIntentAction)initWithCoder:(id)a3
{
  id v4;
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
  WFConfiguredStaccatoIntentAction *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previewIcon"));
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appShortcutIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("templateParameterValues"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E60];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("contextualParameters"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcutsMetadata"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if (v6 && v5)
  {
    v18 = (void *)v20;
    self = -[WFConfiguredStaccatoIntentAction initWithIntent:named:previewIcon:appShortcutIdentifier:templateParameterValues:contextualParameters:shortcutsMetadata:](self, "initWithIntent:named:previewIcon:appShortcutIdentifier:templateParameterValues:contextualParameters:shortcutsMetadata:", v6, v5, v20, v7, v11, v15, v16);
    v17 = self;
  }
  else
  {
    v18 = (void *)v20;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFConfiguredStaccatoIntentAction;
  v4 = a3;
  -[WFConfiguredSystemIntentAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFConfiguredStaccatoAction sectionIdentifier](self, "sectionIdentifier", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sectionIdentifier"));

  -[WFConfiguredStaccatoIntentAction templateParameterValues](self, "templateParameterValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("templateParameterValues"));

}

- (BOOL)isEqual:(id)a3
{
  WFConfiguredStaccatoIntentAction *v4;
  WFConfiguredStaccatoIntentAction *v5;
  WFConfiguredStaccatoIntentAction *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (WFConfiguredStaccatoIntentAction *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v14.receiver = self,
             v14.super_class = (Class)WFConfiguredStaccatoIntentAction,
             -[WFConfiguredSystemIntentAction isEqual:](&v14, sel_isEqual_, v5)))
  {
    v6 = v5;
    -[WFConfiguredStaccatoIntentAction templateParameterValues](self, "templateParameterValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfiguredStaccatoIntentAction templateParameterValues](v6, "templateParameterValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
      v12 = 1;
    }
    else
    {
      v12 = 0;
      if (v9 && v10)
        v12 = objc_msgSend(v9, "isEqual:", v10);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  objc_super v11;

  v3 = (void *)objc_opt_new();
  v11.receiver = self;
  v11.super_class = (Class)WFConfiguredStaccatoIntentAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFConfiguredSystemIntentAction hash](&v11, sel_hash));
  -[WFConfiguredStaccatoAction sectionIdentifier](self, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combine:", v5);

  -[WFConfiguredStaccatoIntentAction templateParameterValues](self, "templateParameterValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "combine:", v7);

  v9 = objc_msgSend(v3, "finalize");
  return v9;
}

- (NSDictionary)templateParameterValues
{
  return self->_templateParameterValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateParameterValues, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
