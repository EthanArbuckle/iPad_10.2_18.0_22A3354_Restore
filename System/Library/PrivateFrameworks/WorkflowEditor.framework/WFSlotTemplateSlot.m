@implementation WFSlotTemplateSlot

- (WFSlotTemplateSlot)initWithLocalizedName:(id)a3 localizedPlaceholder:(id)a4 languageCode:(id)a5 identifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFSlotTemplateSlot *v15;
  uint64_t v16;
  NSString *localizedName;
  uint64_t v18;
  NSString *localizedPlaceholder;
  uint64_t v20;
  NSString *languageCode;
  WFSlotTemplateSlot *v22;
  void *v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSlotTemplateSlot.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v25.receiver = self;
  v25.super_class = (Class)WFSlotTemplateSlot;
  v15 = -[WFSlotTemplateSlot init](&v25, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    localizedName = v15->_localizedName;
    v15->_localizedName = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    localizedPlaceholder = v15->_localizedPlaceholder;
    v15->_localizedPlaceholder = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    languageCode = v15->_languageCode;
    v15->_languageCode = (NSString *)v20;

    objc_storeStrong((id *)&v15->_identifier, a6);
    v15->_userInputInsertionIndex = -1;
    v15->_enabled = 1;
    v22 = v15;
  }

  return v15;
}

- (BOOL)isPopulated
{
  void *v2;
  BOOL v3;

  -[WFSlotTemplateSlot contentAttributedString](self, "contentAttributedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)setContentAttributedString:(id)a3
{
  void *v4;
  uint64_t v5;
  NSAttributedString *v6;
  NSAttributedString *contentAttributedString;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v5 = objc_msgSend(v4, "length");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__WFSlotTemplateSlot_setContentAttributedString___block_invoke;
  v9[3] = &unk_24EE24D40;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v9);
  v6 = (NSAttributedString *)objc_msgSend(v8, "copy");
  contentAttributedString = self->_contentAttributedString;
  self->_contentAttributedString = v6;

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFSlotTemplateSlot identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  WFSlotTemplateSlot *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  BOOL v9;
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
  _BOOL4 v24;
  _BOOL4 v25;
  BOOL v26;
  int64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = (WFSlotTemplateSlot *)a3;
  if (self == v4)
  {
    v9 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    goto LABEL_10;
  }
  -[WFSlotTemplateSlot identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateSlot identifier](v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    v7 = -[WFSlotTemplateSlot isEnabled](self, "isEnabled");
    if (v7 == -[WFSlotTemplateSlot isEnabled](v4, "isEnabled"))
    {
      v8 = -[WFSlotTemplateSlot isInvalid](self, "isInvalid");
      if (v8 == -[WFSlotTemplateSlot isInvalid](v4, "isInvalid"))
      {
        -[WFSlotTemplateSlot localizedName](self, "localizedName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFSlotTemplateSlot localizedName](v4, "localizedName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 != v12)
        {
          -[WFSlotTemplateSlot localizedName](self, "localizedName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFSlotTemplateSlot localizedName](v4, "localizedName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v13, "isEqualToString:", v14))
          {
            v9 = 0;
            goto LABEL_33;
          }
          v34 = v14;
          v35 = v13;
        }
        -[WFSlotTemplateSlot localizedPlaceholder](self, "localizedPlaceholder");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFSlotTemplateSlot localizedPlaceholder](v4, "localizedPlaceholder");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 != v16)
        {
          -[WFSlotTemplateSlot localizedPlaceholder](self, "localizedPlaceholder");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFSlotTemplateSlot localizedPlaceholder](v4, "localizedPlaceholder");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v17, "isEqualToString:", v18))
          {
            v9 = 0;
LABEL_31:

LABEL_32:
            v14 = v34;
            v13 = v35;
            if (v11 == v12)
            {
LABEL_34:

              goto LABEL_7;
            }
LABEL_33:

            goto LABEL_34;
          }
          v31 = v18;
          v32 = v17;
        }
        -[WFSlotTemplateSlot contentAttributedString](self, "contentAttributedString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFSlotTemplateSlot contentAttributedString](v4, "contentAttributedString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v15;
        if (v19 != v20)
        {
          v28 = v19;
          v21 = v11;
          v22 = v16;
          -[WFSlotTemplateSlot contentAttributedString](self, "contentAttributedString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFSlotTemplateSlot contentAttributedString](v4, "contentAttributedString");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v23;
          if (!objc_msgSend(v23, "isEqualToAttributedString:"))
          {
            v9 = 0;
            v16 = v22;
            v11 = v21;
            v19 = v28;
            goto LABEL_28;
          }
          v16 = v22;
          v11 = v21;
          v19 = v28;
        }
        v24 = -[WFSlotTemplateSlot prefersNoWrapping](self, "prefersNoWrapping");
        if (v24 == -[WFSlotTemplateSlot prefersNoWrapping](v4, "prefersNoWrapping")
          && (v25 = -[WFSlotTemplateSlot standaloneTextAttachment](self, "standaloneTextAttachment"),
              v25 == -[WFSlotTemplateSlot standaloneTextAttachment](v4, "standaloneTextAttachment")))
        {
          v27 = -[WFSlotTemplateSlot userInputInsertionIndex](self, "userInputInsertionIndex");
          v9 = v27 == -[WFSlotTemplateSlot userInputInsertionIndex](v4, "userInputInsertionIndex");
          v26 = v9;
        }
        else
        {
          v9 = 0;
          v26 = 0;
        }
        if (v19 == v20)
        {

          v9 = v26;
LABEL_30:
          v17 = v32;
          v15 = v33;
          v18 = v31;
          if (v33 == v16)
            goto LABEL_32;
          goto LABEL_31;
        }
LABEL_28:

        goto LABEL_30;
      }
    }
  }
  v9 = 0;
LABEL_7:

LABEL_10:
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WFSlotTemplateSlot localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateSlot localizedPlaceholder](self, "localizedPlaceholder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateSlot languageCode](self, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateSlot identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithLocalizedName:localizedPlaceholder:languageCode:identifier:", v5, v6, v7, v8);

  -[WFSlotTemplateSlot contentAttributedString](self, "contentAttributedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentAttributedString:", v10);

  objc_msgSend(v9, "setEnabled:", -[WFSlotTemplateSlot isEnabled](self, "isEnabled"));
  objc_msgSend(v9, "setInvalid:", -[WFSlotTemplateSlot isInvalid](self, "isInvalid"));
  objc_msgSend(v9, "setPrefersNoWrapping:", -[WFSlotTemplateSlot prefersNoWrapping](self, "prefersNoWrapping"));
  objc_msgSend(v9, "setStandaloneTextAttachment:", -[WFSlotTemplateSlot standaloneTextAttachment](self, "standaloneTextAttachment"));
  objc_msgSend(v9, "setUserInputInsertionIndex:", -[WFSlotTemplateSlot userInputInsertionIndex](self, "userInputInsertionIndex"));
  return v9;
}

- (WFSlotIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedPlaceholder
{
  return self->_localizedPlaceholder;
}

- (void)setLocalizedPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (NSAttributedString)contentAttributedString
{
  return self->_contentAttributedString;
}

- (BOOL)prefersNoWrapping
{
  return self->_prefersNoWrapping;
}

- (void)setPrefersNoWrapping:(BOOL)a3
{
  self->_prefersNoWrapping = a3;
}

- (BOOL)standaloneTextAttachment
{
  return self->_standaloneTextAttachment;
}

- (void)setStandaloneTextAttachment:(BOOL)a3
{
  self->_standaloneTextAttachment = a3;
}

- (int64_t)userInputInsertionIndex
{
  return self->_userInputInsertionIndex;
}

- (void)setUserInputInsertionIndex:(int64_t)a3
{
  self->_userInputInsertionIndex = a3;
}

- (BOOL)preferContextMenu
{
  return self->_preferContextMenu;
}

- (void)setPreferContextMenu:(BOOL)a3
{
  self->_preferContextMenu = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAttributedString, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_localizedPlaceholder, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __49__WFSlotTemplateSlot_setContentAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__WFSlotTemplateSlot_setContentAttributedString___block_invoke_2;
  v8[3] = &unk_24EE24D18;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  v10 = a3;
  v11 = a4;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __49__WFSlotTemplateSlot_setContentAttributedString___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *MEMORY[0x24BEBB318];
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BEBB318]))
  {
    v7 = v5;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    v10 = (void *)objc_msgSend(v9, "copy");
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setContainingSlotIdentifier:", v11);

      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v6, v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v12, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

+ (id)slotWithLocalizedName:(id)a3 localizedPlaceholder:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  WFSlotIdentifier *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  v12 = -[WFSlotIdentifier initWithKey:]([WFSlotIdentifier alloc], "initWithKey:", v8);

  v13 = (void *)objc_msgSend(v11, "initWithLocalizedName:localizedPlaceholder:languageCode:identifier:", v10, v9, 0, v12);
  return v13;
}

+ (id)slotWithLocalizedName:(id)a3 localizedPlaceholder:(id)a4 languageCode:(id)a5 key:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  WFSlotIdentifier *v15;
  void *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc((Class)a1);
  v15 = -[WFSlotIdentifier initWithKey:]([WFSlotIdentifier alloc], "initWithKey:", v10);

  v16 = (void *)objc_msgSend(v14, "initWithLocalizedName:localizedPlaceholder:languageCode:identifier:", v13, v12, v11, v15);
  return v16;
}

- (void)populateWithString:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v5);
    -[WFSlotTemplateSlot populateWithAttributedString:](self, "populateWithAttributedString:", v4);

  }
  else
  {
    -[WFSlotTemplateSlot populateWithAttributedString:](self, "populateWithAttributedString:", 0);
  }

}

- (void)populateWithAttributedString:(id)a3
{
  -[WFSlotTemplateSlot setContentAttributedString:](self, "setContentAttributedString:", a3);
  -[WFSlotTemplateSlot setStandaloneTextAttachment:](self, "setStandaloneTextAttachment:", 0);
}

- (void)populateWithIcon:(id)a3 string:(id)a4
{
  id v6;
  id v7;
  WFSlotTemplateImageAttachment *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDD1688]);
  if (v13)
  {
    v8 = -[WFSlotTemplateImageAttachment initWithData:ofType:]([WFSlotTemplateImageAttachment alloc], "initWithData:ofType:", 0, 0);
    objc_msgSend(v13, "platformImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateImageAttachment setImage:](v8, "setImage:", v9);

    objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v10);

    if (v6)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR(" "));
      objc_msgSend(v7, "appendAttributedString:", v11);

LABEL_5:
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v6);
      objc_msgSend(v7, "appendAttributedString:", v12);

    }
  }
  else if (v6)
  {
    goto LABEL_5;
  }
  -[WFSlotTemplateSlot setContentAttributedString:](self, "setContentAttributedString:", v7);
  -[WFSlotTemplateSlot setStandaloneTextAttachment:](self, "setStandaloneTextAttachment:", 0);

}

- (void)populateWithVariable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  WFVariableAttachment *v10;

  v4 = a3;
  v10 = -[WFVariableAttachment initWithVariable:]([WFVariableAttachment alloc], "initWithVariable:", v4);
  -[WFSlotTemplateSlot identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariableAttachment setContainingSlotIdentifier:](v10, "setContainingSlotIdentifier:", v5);

  -[WFVariableAttachment setStandalone:](v10, "setStandalone:", 1);
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEC4758]))
    goto LABEL_4;
  -[WFSlotTemplateSlot localizedName](self, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[WFSlotTemplateSlot localizedName](self, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFVariableAttachment setOverrideVariableName:](v10, "setOverrideVariableName:", v6);
LABEL_4:

  }
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateSlot setContentAttributedString:](self, "setContentAttributedString:", v9);

  -[WFSlotTemplateSlot setStandaloneTextAttachment:](self, "setStandaloneTextAttachment:", 1);
}

- (void)populateWithVariableString:(id)a3 askVariableName:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  objc_msgSend(a3, "attributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "mutableCopy");

  v8 = *MEMORY[0x24BEBB318];
  v9 = objc_msgSend(v11, "length");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __86__WFSlotTemplateSlot_WFVariableUtilities__populateWithVariableString_askVariableName___block_invoke;
  v12[3] = &unk_24EE24D68;
  v12[4] = self;
  v13 = v6;
  v10 = v6;
  objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v9, 0, v12);
  -[WFSlotTemplateSlot setContentAttributedString:](self, "setContentAttributedString:", v11);
  -[WFSlotTemplateSlot setStandaloneTextAttachment:](self, "setStandaloneTextAttachment:", 0);

}

void __86__WFSlotTemplateSlot_WFVariableUtilities__populateWithVariableString_askVariableName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContainingSlotIdentifier:", v3);

    objc_msgSend(v7, "variable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEC4758]);

    if (v6)
      objc_msgSend(v7, "setOverrideVariableName:", *(_QWORD *)(a1 + 40));
  }

}

+ (id)addingSlotWithKey:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x24BEBB4B8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithData:ofType:", 0, 0);
  objc_msgSend(MEMORY[0x24BEC14F0], "configurationWithPointSize:", 20.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14E0], "systemImageNamed:configuration:renderingMode:", CFSTR("plus"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithRenderingMode:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "platformImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v10);

  objc_msgSend(a1, "slotWithLocalizedName:localizedPlaceholder:languageCode:key:", 0, 0, 0, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentAttributedString:", v12);

  return v11;
}

@end
