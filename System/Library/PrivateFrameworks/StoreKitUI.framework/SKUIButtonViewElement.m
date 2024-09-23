@implementation SKUIButtonViewElement

- (SKUIButtonViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SKUIButtonViewElement *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  NSString *sizeVariant;
  uint64_t v26;
  NSString *confirmationText;
  void *v28;
  SKUIStoreIdentifier *v29;
  SKUIStoreIdentifier *storeIdentifier;
  uint64_t v31;
  SKUIViewElementText *buttonText;
  uint64_t v33;
  NSString *bundleIdentifier;
  void *v35;
  void *v36;
  uint64_t v37;
  NSString *badgeResourceName;
  void *v39;
  int v40;
  void *v41;
  __CFString *v42;
  NSString *variantIdentifier;
  uint64_t v44;
  uint64_t v45;
  NSString *playItemIdentifier;
  uint64_t v47;
  NSString *toggledText;
  uint64_t v49;
  NSString *nonToggledText;
  float v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSString *toggleItemIdentifier;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  __CFString *v76;
  _QWORD v77[5];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  objc_super v82;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v12)
        -[SKUIButtonViewElement initWithDOMElement:parent:elementFactory:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  v82.receiver = self;
  v82.super_class = (Class)SKUIButtonViewElement;
  v20 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v82, sel_initWithDOMElement_parent_elementFactory_, v9, v10, v11);
  if (v20)
  {
    v70 = v11;
    v71 = v10;
    objc_msgSend(v9, "getAttribute:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20->_buttonViewType = SKUIButtonViewTypeForString(v21);

    objc_msgSend(v9, "getAttribute:", CFSTR("sub-type"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("toggle"));

    v20->_buttonViewSubType = v23;
    objc_msgSend(v9, "getAttribute:", CFSTR("size-variant"));
    v24 = objc_claimAutoreleasedReturnValue();
    sizeVariant = v20->_sizeVariant;
    v20->_sizeVariant = (NSString *)v24;

    objc_msgSend(v9, "getAttribute:", CFSTR("confirm-text"));
    v26 = objc_claimAutoreleasedReturnValue();
    confirmationText = v20->_confirmationText;
    v20->_confirmationText = (NSString *)v26;

    objc_msgSend(v9, "getAttribute:", CFSTR("data-content-id"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v20->_itemIdentifier = objc_msgSend(v28, "longLongValue");

    v29 = -[SKUIStoreIdentifier initWithLongLong:]([SKUIStoreIdentifier alloc], "initWithLongLong:", v20->_itemIdentifier);
    storeIdentifier = v20->_storeIdentifier;
    v20->_storeIdentifier = v29;

    objc_storeStrong((id *)&v20->_xml, a3);
    v78 = 0;
    v79 = &v78;
    v80 = 0x2020000000;
    v81 = 0;
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __66__SKUIButtonViewElement_initWithDOMElement_parent_elementFactory___block_invoke;
    v77[3] = &unk_1E73A01D0;
    v77[4] = &v78;
    -[SKUIViewElement enumerateChildrenUsingBlock:](v20, "enumerateChildrenUsingBlock:", v77);
    if (!*((_BYTE *)v79 + 24))
    {
      -[SKUIButtonViewElement _parseButtonText](v20, "_parseButtonText");
      v31 = objc_claimAutoreleasedReturnValue();
      buttonText = v20->_buttonText;
      v20->_buttonText = (SKUIViewElementText *)v31;

    }
    objc_msgSend(v9, "getAttribute:", CFSTR("data-feed-url"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v74, "length"))
      -[SKUIStoreIdentifier setPodcastFeedURLIdentifier:](v20->_storeIdentifier, "setPodcastFeedURLIdentifier:", v74);
    objc_msgSend(v9, "getAttribute:", CFSTR("bundle-id"));
    v33 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v20->_bundleIdentifier;
    v20->_bundleIdentifier = (NSString *)v33;

    if (-[NSString length](v20->_bundleIdentifier, "length"))
      -[SKUIStoreIdentifier setBundleIdentifier:](v20->_storeIdentifier, "setBundleIdentifier:", v20->_bundleIdentifier);
    objc_msgSend(v9, "getAttribute:", CFSTR("selected"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v20->_selected = objc_msgSend(v35, "BOOLValue");

    objc_msgSend(v9, "getAttribute:", CFSTR("badge"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
    {
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v72);
      objc_msgSend(v36, "host");
      v37 = objc_claimAutoreleasedReturnValue();
      badgeResourceName = v20->_badgeResourceName;
      v20->_badgeResourceName = (NSString *)v37;

    }
    objc_msgSend(v9, "getAttribute:", CFSTR("disabled"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v39;
    if (objc_msgSend(v39, "length"))
      v40 = objc_msgSend(v39, "BOOLValue") ^ 1;
    else
      LOBYTE(v40) = -1;
    v20->_enabled = v40;
    objc_msgSend(v9, "getAttribute:", CFSTR("data-type"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getAttribute:", CFSTR("data-variant"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "length"))
    {
      v76 = v41;
      if ((-[__CFString isEqualToString:](v76, "isEqualToString:", CFSTR("redownload")) & 1) != 0
        || (-[__CFString isEqualToString:](v76, "isEqualToString:", CFSTR("get")) & 1) != 0
        || (-[__CFString isEqualToString:](v76, "isEqualToString:", CFSTR("preorder")) & 1) != 0
        || (-[__CFString isEqualToString:](v76, "isEqualToString:", CFSTR("purchased")) & 1) != 0)
      {

      }
      else
      {
        v68 = -[__CFString isEqualToString:](v76, "isEqualToString:", CFSTR("update"));

        if (!v68)
          goto LABEL_26;
      }
      v76 = CFSTR("buy");
    }
    else
    {
      v76 = 0;
    }

LABEL_26:
    if (objc_msgSend(v75, "length") && !objc_msgSend(v75, "isEqualToString:", CFSTR("PLUS")))
    {
      if (v76 && v75)
      {
        v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), v76, v75, v69);
        variantIdentifier = v20->_variantIdentifier;
        v20->_variantIdentifier = (NSString *)v44;
        goto LABEL_34;
      }
    }
    else
    {

      v75 = 0;
    }
    if (!v76)
    {
LABEL_35:
      if (v20->_buttonViewType == 12)
      {
        objc_msgSend(v9, "getAttribute:", CFSTR("data-content-id"));
        v45 = objc_claimAutoreleasedReturnValue();
        playItemIdentifier = v20->_playItemIdentifier;
        v20->_playItemIdentifier = (NSString *)v45;

      }
      if (v20->_buttonViewSubType == 1)
      {
        objc_msgSend(v9, "getAttribute:", CFSTR("toggled-text"));
        v47 = objc_claimAutoreleasedReturnValue();
        toggledText = v20->_toggledText;
        v20->_toggledText = (NSString *)v47;

        objc_msgSend(v9, "getAttribute:", CFSTR("non-toggled-text"));
        v49 = objc_claimAutoreleasedReturnValue();
        nonToggledText = v20->_nonToggledText;
        v20->_nonToggledText = (NSString *)v49;

      }
      objc_msgSend(v9, "getAttribute:", CFSTR("big-hit-size"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v73, "length") && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v73, "floatValue");
        v20->_bigHitSize = v51;
      }
      objc_msgSend(v9, "getAttribute:", CFSTR("big-hit"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v52, "length"))
      {
        objc_msgSend(v52, "lowercaseString");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v20->_bigHitButton = objc_msgSend(v53, "isEqualToString:", CFSTR("true"));

      }
      objc_msgSend(v9, "getAttribute:", CFSTR("show-on-demand"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v54, "length"))
      {
        objc_msgSend(v54, "lowercaseString");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v20->_showOnDemand = objc_msgSend(v55, "isEqualToString:", CFSTR("true"));

      }
      objc_msgSend(v9, "getAttribute:", CFSTR("toggled"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v56, "length"))
      {
        objc_msgSend(v56, "lowercaseString");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v20->_toggled = objc_msgSend(v57, "isEqualToString:", CFSTR("true"));

      }
      objc_msgSend(v9, "getAttribute:", CFSTR("toggle-id"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v58, "length"))
      {
        objc_msgSend(v9, "getAttribute:", CFSTR("toggle-id"));
        v59 = objc_claimAutoreleasedReturnValue();
        toggleItemIdentifier = v20->_toggleItemIdentifier;
        v20->_toggleItemIdentifier = (NSString *)v59;

      }
      objc_msgSend(v9, "getAttribute:", CFSTR("auto-increment-count"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v61, "length"))
      {
        objc_msgSend(v61, "lowercaseString");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v20->_autoIncrementCount = objc_msgSend(v62, "isEqualToString:", CFSTR("true"));

      }
      objc_msgSend(v9, "getAttribute:", CFSTR("disabled-but-selectable"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v63, "length"))
      {
        objc_msgSend(v63, "lowercaseString");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v20->_disabledButSelectable = objc_msgSend(v64, "isEqualToString:", CFSTR("true"));

      }
      objc_msgSend(v9, "getAttribute:", CFSTR("suppress-cloud-restore"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v65, "length"))
      {
        objc_msgSend(v65, "lowercaseString");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v20->_suppressCloudRestore = objc_msgSend(v66, "isEqualToString:", CFSTR("true"));

      }
      _Block_object_dispose(&v78, 8);
      v11 = v70;
      v10 = v71;
      goto LABEL_57;
    }
    v42 = v76;
    variantIdentifier = v20->_variantIdentifier;
    v20->_variantIdentifier = &v42->isa;
LABEL_34:

    goto LABEL_35;
  }
LABEL_57:

  return v20;
}

void __66__SKUIButtonViewElement_initWithDOMElement_parent_elementFactory___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "elementType") == 138)
  {
    objc_msgSend(v7, "elementName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("span"));

    if (v6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }

}

- (void)dealloc
{
  IKDOMElement *xml;
  void *v4;
  IKDOMElement *v5;
  objc_super v6;

  xml = self->_xml;
  if (xml)
  {
    -[SKUIButtonViewElement appDocument](self, "appDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIViewElementTextDeadlockFix(xml, v4);

    v5 = self->_xml;
    self->_xml = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIButtonViewElement;
  -[SKUIViewElement dealloc](&v6, sel_dealloc);
}

- (SKUIImageViewElement)buttonImage
{
  return (SKUIImageViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
}

- (SKUIImageViewElement)additionalButtonImage
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  _QWORD v11[3];
  char v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__53;
  v9 = __Block_byref_object_dispose__53;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SKUIButtonViewElement_additionalButtonImage__block_invoke;
  v4[3] = &unk_1E73A01F8;
  v4[4] = v11;
  v4[5] = &v5;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(v11, 8);
  return (SKUIImageViewElement *)v2;
}

void __46__SKUIButtonViewElement_additionalButtonImage__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v6;

  if (objc_msgSend(a2, "elementType") == 49)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_BYTE *)(v6 + 24))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }
    else
    {
      *(_BYTE *)(v6 + 24) = 1;
    }
  }
}

- (SKUIViewElementText)buttonText
{
  SKUIViewElementText *buttonText;
  SKUIViewElementText *v4;
  SKUIViewElementText *v5;

  buttonText = self->_buttonText;
  if (!buttonText)
  {
    -[SKUIButtonViewElement _parseButtonText](self, "_parseButtonText");
    v4 = (SKUIViewElementText *)objc_claimAutoreleasedReturnValue();
    v5 = self->_buttonText;
    self->_buttonText = v4;

    buttonText = self->_buttonText;
  }
  return buttonText;
}

- (IKViewElementStyle)buttonTitleStyle
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 138);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "elementName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("span")),
        v4,
        (v5 & 1) == 0))
  {
    objc_msgSend(v3, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (IKViewElementStyle *)v6;
}

- (SKUIBuyButtonDescriptor)buyButtonDescriptor
{
  unint64_t v3;
  SKUIBuyButtonDescriptor *v4;
  uint64_t v5;
  SKUIBuyButtonDescriptor *buyButtonDescriptor;
  SKUIBuyButtonDescriptor *v7;
  SKUIBuyButtonDescriptor *v8;
  SKUIBuyButtonDescriptor *v9;
  void *v10;
  void *v11;
  SKUIBuyButtonDescriptor *v12;
  void *v13;
  SKUIBuyButtonDescriptor *v14;
  void *v15;
  SKUIBuyButtonDescriptor *v16;
  void *v17;

  v3 = -[SKUIButtonViewElement buttonViewType](self, "buttonViewType") - 2;
  if (v3 <= 7 && ((0x87u >> v3) & 1) != 0)
  {
    v5 = qword_1BBED1FA0[v3];
    buyButtonDescriptor = self->_buyButtonDescriptor;
    if (!buyButtonDescriptor)
    {
      v7 = objc_alloc_init(SKUIBuyButtonDescriptor);
      v8 = self->_buyButtonDescriptor;
      self->_buyButtonDescriptor = v7;

      buyButtonDescriptor = self->_buyButtonDescriptor;
    }
    -[SKUIBuyButtonDescriptor setButtonType:](buyButtonDescriptor, "setButtonType:", v5);
    v9 = self->_buyButtonDescriptor;
    -[SKUIButtonViewElement buttonText](self, "buttonText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIBuyButtonDescriptor setButtonText:](v9, "setButtonText:", v11);

    v12 = self->_buyButtonDescriptor;
    -[SKUIButtonViewElement confirmationText](self, "confirmationText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIBuyButtonDescriptor setConfirmationText:](v12, "setConfirmationText:", v13);

    -[SKUIBuyButtonDescriptor setElementType:](self->_buyButtonDescriptor, "setElementType:", -[SKUIButtonViewElement elementType](self, "elementType"));
    -[SKUIBuyButtonDescriptor setItemIdentifier:](self->_buyButtonDescriptor, "setItemIdentifier:", -[SKUIButtonViewElement itemIdentifier](self, "itemIdentifier"));
    v14 = self->_buyButtonDescriptor;
    -[SKUIButtonViewElement storeIdentifier](self, "storeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIBuyButtonDescriptor setStoreIdentifier:](v14, "setStoreIdentifier:", v15);

    v16 = self->_buyButtonDescriptor;
    -[SKUIButtonViewElement variantIdentifier](self, "variantIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIBuyButtonDescriptor setVariantIdentifier:](v16, "setVariantIdentifier:", v17);

    -[SKUIBuyButtonDescriptor setShouldSuppressCloudRestore:](self->_buyButtonDescriptor, "setShouldSuppressCloudRestore:", -[SKUIButtonViewElement suppressCloudRestore](self, "suppressCloudRestore"));
    v4 = self->_buyButtonDescriptor;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIButtonViewElement *v4;
  SKUIButtonViewElement *v5;
  SKUIButtonViewElement *v6;
  NSString *v7;
  NSString *badgeResourceName;
  SKUIViewElementText *v9;
  SKUIViewElementText *buttonText;
  SKUIBuyButtonDescriptor *v11;
  SKUIBuyButtonDescriptor *buyButtonDescriptor;
  NSString *v13;
  NSString *confirmationText;
  NSString *v15;
  NSString *nonToggledText;
  SKUIStoreIdentifier *v17;
  SKUIStoreIdentifier *storeIdentifier;
  NSString *v19;
  NSString *toggledText;
  NSString *v21;
  NSString *variantIdentifier;
  NSString *v23;
  void *bundleIdentifier;
  objc_super v26;

  v4 = (SKUIButtonViewElement *)a3;
  v26.receiver = self;
  v26.super_class = (Class)SKUIButtonViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v26, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUIButtonViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    -[SKUIButtonViewElement badgeResourceName](v4, "badgeResourceName");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    badgeResourceName = self->_badgeResourceName;
    self->_badgeResourceName = v7;

    -[SKUIButtonViewElement buttonText](v4, "buttonText");
    v9 = (SKUIViewElementText *)objc_claimAutoreleasedReturnValue();
    buttonText = self->_buttonText;
    self->_buttonText = v9;

    self->_buttonViewType = -[SKUIButtonViewElement buttonViewType](v4, "buttonViewType");
    -[SKUIButtonViewElement buyButtonDescriptor](v4, "buyButtonDescriptor");
    v11 = (SKUIBuyButtonDescriptor *)objc_claimAutoreleasedReturnValue();
    buyButtonDescriptor = self->_buyButtonDescriptor;
    self->_buyButtonDescriptor = v11;

    -[SKUIButtonViewElement confirmationText](v4, "confirmationText");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    confirmationText = self->_confirmationText;
    self->_confirmationText = v13;

    self->_enabled = v4->_enabled;
    self->_itemIdentifier = -[SKUIButtonViewElement itemIdentifier](v4, "itemIdentifier");
    -[SKUIButtonViewElement nonToggledText](v4, "nonToggledText");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    nonToggledText = self->_nonToggledText;
    self->_nonToggledText = v15;

    self->_selected = -[SKUIButtonViewElement isSelected](v4, "isSelected");
    -[SKUIButtonViewElement storeIdentifier](v4, "storeIdentifier");
    v17 = (SKUIStoreIdentifier *)objc_claimAutoreleasedReturnValue();
    storeIdentifier = self->_storeIdentifier;
    self->_storeIdentifier = v17;

    -[SKUIButtonViewElement toggledText](v4, "toggledText");
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    toggledText = self->_toggledText;
    self->_toggledText = v19;

    -[SKUIButtonViewElement variantIdentifier](v4, "variantIdentifier");
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    variantIdentifier = self->_variantIdentifier;
    self->_variantIdentifier = v21;

    -[SKUIButtonViewElement bundleIdentifier](v4, "bundleIdentifier");
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v23;
LABEL_6:

    goto LABEL_7;
  }
  if (v5 != self)
  {
    -[SKUIButtonViewElement buyButtonDescriptor](self, "buyButtonDescriptor");
    bundleIdentifier = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIButtonViewElement setBuyButtonDescriptor:](v4, "setBuyButtonDescriptor:", bundleIdentifier);
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)SKUIButtonViewElement;
  -[SKUIButtonViewElement description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Type: %ld, ID: %lld, Variant: %@"), v4, self->_buttonViewType, self->_itemIdentifier, self->_variantIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)elementType
{
  unint64_t v2;

  v2 = self->_buttonViewType - 2;
  if (v2 > 7)
    return 12;
  else
    return qword_1BBED1FE0[v2];
}

- (BOOL)isEnabled
{
  int enabled;
  objc_super v4;

  enabled = self->_enabled;
  if (enabled != 255)
    return enabled != 0;
  v4.receiver = self;
  v4.super_class = (Class)SKUIButtonViewElement;
  return -[SKUIViewElement isEnabled](&v4, sel_isEnabled);
}

- (int64_t)pageComponentType
{
  return 24;
}

- (id)personalizationLibraryItems
{
  SKUILibraryItem *v3;
  void *v4;

  if (self->_itemIdentifier)
  {
    v3 = objc_alloc_init(SKUILibraryItem);
    -[SKUILibraryItem setStoreIdentifier:](v3, "setStoreIdentifier:", self->_storeIdentifier);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_parseButtonText
{
  IKDOMElement *xml;
  _QWORD v4[5];

  xml = self->_xml;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__SKUIButtonViewElement__parseButtonText__block_invoke;
  v4[3] = &unk_1E73A2078;
  v4[4] = self;
  +[IKTextParser textWithDOMElement:usingParseBlock:](SKUIViewElementText, "textWithDOMElement:usingParseBlock:", xml, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __41__SKUIButtonViewElement__parseButtonText__block_invoke(uint64_t a1, uint64_t a2, void *a3, BOOL *a4)
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v6 = a3;
  objc_msgSend(v6, "nodeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("span"));

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v6, "getAttribute:", *MEMORY[0x1E0D3A448]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "elementWithIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      SKUILabelStringAttributesWithSpanElement(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v6, "textContent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v12);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  *a4 = v15 == 0;

  return v15;
}

- (BOOL)autoIncrementCount
{
  return self->_autoIncrementCount;
}

- (BOOL)isBigHitButton
{
  return self->_bigHitButton;
}

- (double)bigHitSize
{
  return self->_bigHitSize;
}

- (void)setBuyButtonDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_buyButtonDescriptor, a3);
}

- (int64_t)buttonViewType
{
  return self->_buttonViewType;
}

- (int64_t)buttonViewSubType
{
  return self->_buttonViewSubType;
}

- (NSString)confirmationText
{
  return self->_confirmationText;
}

- (NSString)nonToggledText
{
  return self->_nonToggledText;
}

- (NSString)toggledText
{
  return self->_toggledText;
}

- (NSString)badgeResourceName
{
  return self->_badgeResourceName;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (SKUIStoreIdentifier)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)dataPlaybackId
{
  return self->_dataPlaybackId;
}

- (NSString)playItemIdentifier
{
  return self->_playItemIdentifier;
}

- (NSString)sizeVariant
{
  return self->_sizeVariant;
}

- (BOOL)showOnDemand
{
  return self->_showOnDemand;
}

- (NSString)toggleItemIdentifier
{
  return self->_toggleItemIdentifier;
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (BOOL)isDisabledButSelectable
{
  return self->_disabledButSelectable;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isToggled
{
  return self->_toggled;
}

- (void)setToggled:(BOOL)a3
{
  self->_toggled = a3;
}

- (BOOL)suppressCloudRestore
{
  return self->_suppressCloudRestore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleItemIdentifier, 0);
  objc_storeStrong((id *)&self->_sizeVariant, 0);
  objc_storeStrong((id *)&self->_playItemIdentifier, 0);
  objc_storeStrong((id *)&self->_xml, 0);
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong((id *)&self->_toggleItemIdentfier, 0);
  objc_storeStrong((id *)&self->_toggledText, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_nonToggledText, 0);
  objc_storeStrong((id *)&self->_confirmationText, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptor, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_badgeResourceName, 0);
}

- (void)initWithDOMElement:(uint64_t)a3 parent:(uint64_t)a4 elementFactory:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
