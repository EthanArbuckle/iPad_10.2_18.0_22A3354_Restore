@implementation SKUILabelViewElement

- (SKUILabelViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
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
  SKUILabelViewElement *v20;
  void *v21;
  uint64_t v22;
  NSString *moreButtonTitle;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  uint64_t v28;
  NSMutableDictionary *v29;
  NSMutableDictionary *domObjectsToViewElements;
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v12)
        -[SKUILabelViewElement initWithDOMElement:parent:elementFactory:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)SKUILabelViewElement;
  v20 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v32, sel_initWithDOMElement_parent_elementFactory_, v9, v10, v11);
  if (v20)
  {
    objc_msgSend(v9, "tagName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20->_labelViewStyle = SKUILabelViewStyleForString(v21);

    objc_msgSend(v9, "getAttribute:", CFSTR("moreLabel"));
    v22 = objc_claimAutoreleasedReturnValue();
    moreButtonTitle = v20->_moreButtonTitle;
    v20->_moreButtonTitle = (NSString *)v22;

    objc_msgSend(v9, "getAttribute:", CFSTR("maxLines"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "length"))
      v25 = objc_msgSend(v24, "integerValue");
    else
      v25 = 1;
    v20->_numberOfLines = v25;
    v20->_badgePlacement = 0;
    objc_msgSend(v9, "getAttribute:", CFSTR("badgePlacement"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("firstBaseline"));
    v28 = 0;
    if ((v27 & 1) == 0)
    {
      if (!objc_msgSend(v26, "isEqualToString:", CFSTR("trailing")))
      {
LABEL_13:
        v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        domObjectsToViewElements = v20->_domObjectsToViewElements;
        v20->_domObjectsToViewElements = v29;

        -[SKUILabelViewElement _walkDOM:parent:elementFactory:](v20, "_walkDOM:parent:elementFactory:", v9, v10, v11);
        objc_storeStrong((id *)&v20->_xml, a3);
        -[SKUILabelViewElement _createText:](v20, "_createText:", v20->_xml);

        goto LABEL_14;
      }
      v28 = 1;
    }
    v20->_badgePlacement = v28;
    goto LABEL_13;
  }
LABEL_14:

  return v20;
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
    -[SKUILabelViewElement appDocument](self, "appDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIViewElementTextDeadlockFix(xml, v4);

    v5 = self->_xml;
    self->_xml = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)SKUILabelViewElement;
  -[SKUIViewElement dealloc](&v6, sel_dealloc);
}

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUILabelViewElement *v4;
  SKUILabelViewElement *v5;
  NSString *v8;
  NSString *moreButtonTitle;
  SKUIViewElementText *v10;
  SKUIViewElementText *text;
  objc_super v13;

  v4 = (SKUILabelViewElement *)a3;
  v13.receiver = self;
  v13.super_class = (Class)SKUILabelViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v13, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUILabelViewElement *)objc_claimAutoreleasedReturnValue();
  if (v5 == self && v4 != self && v4 != 0)
  {
    self->_labelViewStyle = -[SKUILabelViewElement labelViewStyle](v4, "labelViewStyle");
    -[SKUILabelViewElement moreButtonTitle](v4, "moreButtonTitle");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    moreButtonTitle = self->_moreButtonTitle;
    self->_moreButtonTitle = v8;

    self->_numberOfLines = -[SKUILabelViewElement numberOfLines](v4, "numberOfLines");
    -[SKUILabelViewElement text](v4, "text");
    v10 = (SKUIViewElementText *)objc_claimAutoreleasedReturnValue();
    text = self->_text;
    self->_text = v10;

  }
  return v5;
}

- (int64_t)pageComponentType
{
  return 5;
}

- (id)uniquingMapKey
{
  SKUIViewElementText *text;
  objc_super v4;

  text = self->_text;
  if (text)
    return text;
  v4.receiver = self;
  v4.super_class = (Class)SKUILabelViewElement;
  -[SKUIViewElement uniquingMapKey](&v4, sel_uniquingMapKey);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SKUIViewElementText)text
{
  return self->_text;
}

- (void)linkTapped:(id)a3 range:(_NSRange)a4
{
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  location = a4.location;
  -[IKTextParser attributedString](self->_text, "attributedString", a3, a4.location, a4.length, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attribute:atIndex:effectiveRange:", 0x1E73BC850, location, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKey:](self->_linkToViewButtonElements, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, &__block_literal_global_68);
    }

  }
}

- (void)_createText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  SKUIViewElementText *v9;
  SKUIViewElementText *text;
  uint64_t v11;
  uint64_t v12;
  __CFString *(*v13)(uint64_t, void *, void *, _BYTE *);
  void *v14;
  SKUILabelViewElement *v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__106;
  v19[4] = __Block_byref_object_dispose__106;
  v20 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __36__SKUILabelViewElement__createText___block_invoke;
  v14 = &unk_1E73A9C48;
  v15 = self;
  v7 = v5;
  v16 = v7;
  v8 = v6;
  v17 = v8;
  v18 = v19;
  +[IKTextParser textWithDOMElement:usingParseBlock:](SKUIViewElementText, "textWithDOMElement:usingParseBlock:", v4, &v11);
  v9 = (SKUIViewElementText *)objc_claimAutoreleasedReturnValue();
  text = self->_text;
  self->_text = v9;

  if (objc_msgSend(v8, "count", v11, v12, v13, v14, v15))
    objc_storeStrong((id *)&self->_trailingBadges, v6);
  if (objc_msgSend(v7, "count"))
    objc_storeStrong((id *)&self->_badges, v5);

  _Block_object_dispose(v19, 8);
}

__CFString *__36__SKUILabelViewElement__createText___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  SKUIBadgeTextAttachment *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void **v31;
  __CFString **v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  __CFString *v59;
  void *v60;
  _QWORD v61[2];
  _QWORD v62[4];

  v62[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SKUILabelStringAttributesWithSpanElement(v10);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nodeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("badge")))
  {
    v13 = v7;
    *a4 = 1;
    v14 = v10;
    v15 = -[SKUIBadgeTextAttachment initWithViewElement:]([SKUIBadgeTextAttachment alloc], "initWithViewElement:", v14);
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
    }

    v16 = 0;
    v17 = 0;
    v7 = v13;
    goto LABEL_19;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("button")))
  {
    v51 = v7;
    *a4 = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 288) = 1;
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 312), *(id *)(a1 + 32));
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(_QWORD *)(v19 + 304);
    *(_QWORD *)(v19 + 304) = v20 + 1;
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%li"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(*(_QWORD *)(a1 + 32) + 320);
    if (!v22)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(void **)(v24 + 320);
      *(_QWORD *)(v24 + 320) = v23;

      v22 = *(void **)(*(_QWORD *)(a1 + 32) + 320);
    }
    objc_msgSend(v22, "setObject:forKey:", v10, v21);
    objc_msgSend(*(id *)(a1 + 32), "_stringFromNumberElement:", v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "style");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "ikColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "color");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v61[0] = 0x1E73BC870;
      v61[1] = 0x1E73BC850;
      v62[0] = v29;
      v62[1] = v21;
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = (void **)v62;
      v32 = (__CFString **)v61;
      v33 = 2;
    }
    else
    {
      v59 = CFSTR("SKUILinkAttributeName");
      v60 = v21;
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = &v60;
      v32 = &v59;
      v33 = 1;
    }
    objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v26, v35);

    v16 = 0;
    v7 = v51;
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("number")))
  {
    *a4 = 1;
    objc_msgSend(*(id *)(a1 + 32), "_stringFromNumberElement:", v8);
    v34 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v17 = (__CFString *)v34;
    v16 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("date")))
  {
    *a4 = 1;
    objc_msgSend(*(id *)(a1 + 32), "_stringFromDateElement:", v8);
    v34 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("duration")))
  {
    *a4 = 1;
    objc_msgSend(*(id *)(a1 + 32), "_stringFromDurationElement:", v8);
    v34 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("br")))
  {
    v16 = 0;
    *a4 = 1;
    v17 = CFSTR("\n");
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    v37 = 0;
    if (!objc_msgSend(0, "length"))
    {
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("span")))
      {
        v48 = v12;
        v49 = v10;
        v50 = v9;
        v52 = v7;
        objc_msgSend(v8, "childNodesAsArray");
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        if (v38)
        {
          v39 = v38;
          v37 = 0;
          v40 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v55 != v40)
                objc_enumerationMutation(obj);
              v42 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
              objc_msgSend(v42, "nodeName");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("#text"));

              if (v44)
              {
                if (!v37)
                  v37 = objc_opt_new();
                objc_msgSend(v42, "textContent");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v37, "stringByAppendingString:", v45);
                v46 = objc_claimAutoreleasedReturnValue();

                *a4 = 0;
                v37 = v46;
              }
            }
            v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
          }
          while (v39);
        }
        else
        {
          v37 = 0;
        }

        v9 = v50;
        v7 = v52;
        v10 = v49;
        v12 = v48;
      }
      else
      {
        v37 = 0;
      }
    }
    if (v11 | v37)
    {
      v47 = &stru_1E73A9FB0;
      if (v37)
        v47 = (__CFString *)v37;
      v16 = v47;

      v17 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v16, v11);
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
  }
LABEL_19:

  return v17;
}

- (id)_stringFromDateElement:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  if (!_stringFromDateElement__sOutputFormatter)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = (void *)_stringFromDateElement__sOutputFormatter;
    _stringFromDateElement__sOutputFormatter = (uint64_t)v4;

    objc_msgSend((id)_stringFromDateElement__sOutputFormatter, "setDateStyle:", 2);
    objc_msgSend((id)_stringFromDateElement__sOutputFormatter, "setTimeStyle:", 0);
  }
  objc_msgSend(v3, "textContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementDateWithString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)_stringFromDateElement__sOutputFormatter, "stringFromDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (v8)
    v9 = v8;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

- (id)_stringFromDurationElement:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;

  v3 = a3;
  if (!_stringFromDurationElement__sInputFormatter)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v5 = (void *)_stringFromDurationElement__sInputFormatter;
    _stringFromDurationElement__sInputFormatter = (uint64_t)v4;

  }
  objc_msgSend(v3, "textContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_stringFromDurationElement__sInputFormatter, "numberFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v17 = 0;
    goto LABEL_12;
  }
  v9 = objc_msgSend(v7, "integerValue");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", (double)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "components:fromDate:toDate:options:", 224, v10, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "hour") < 1)
  {
    v14 = &_stringFromDurationElement__sOutputFormatter;
    v15 = (id)_stringFromDurationElement__sOutputFormatter;
    if (!_stringFromDurationElement__sOutputFormatter)
    {
      v16 = 192;
      goto LABEL_10;
    }
  }
  else
  {
    v14 = &_stringFromDurationElement__sHourOutputFormatter;
    v15 = (id)_stringFromDurationElement__sHourOutputFormatter;
    if (!_stringFromDurationElement__sHourOutputFormatter)
    {
      v16 = 224;
LABEL_10:
      v18 = objc_alloc_init(MEMORY[0x1E0CB3570]);
      v19 = (id)*v14;
      *v14 = (uint64_t)v18;

      objc_msgSend((id)*v14, "setUnitsStyle:", 0);
      objc_msgSend((id)*v14, "setZeroFormattingBehavior:", 0x10000);
      objc_msgSend((id)*v14, "setFormattingContext:", 2);
      objc_msgSend((id)*v14, "setAllowedUnits:", v16);
      v15 = (id)*v14;
    }
  }
  v20 = v15;
  objc_msgSend(v20, "stringFromDateComponents:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  if (v17)
    v21 = v17;
  else
    v21 = v6;
  v22 = v21;

  return v22;
}

- (id)_stringFromNumberElement:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  if (!_stringFromNumberElement__sInputFormatter)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v5 = (void *)_stringFromNumberElement__sInputFormatter;
    _stringFromNumberElement__sInputFormatter = (uint64_t)v4;

  }
  if (!_stringFromNumberElement__sOutputFormatter)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v7 = (void *)_stringFromNumberElement__sOutputFormatter;
    _stringFromNumberElement__sOutputFormatter = (uint64_t)v6;

    objc_msgSend((id)_stringFromNumberElement__sOutputFormatter, "setNumberStyle:", 1);
  }
  objc_msgSend(v3, "textContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_stringFromNumberElement__sInputFormatter, "numberFromString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend((id)_stringFromNumberElement__sOutputFormatter, "stringFromNumber:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (v10)
    v11 = v10;
  else
    v11 = v8;
  v12 = v11;

  return v12;
}

- (void)_walkDOM:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "nodeName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("span"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_msgSend(v11, "isEqualToString:", CFSTR("badge")) & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", CFSTR("button")))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "elementForDOMElement:parent:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_domObjectsToViewElements, "setObject:forKey:", v13, v12);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v8, "childNodesAsArray", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        -[SKUILabelViewElement _walkDOM:parent:elementFactory:](self, "_walkDOM:parent:elementFactory:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), v9, v10);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (NSArray)badges
{
  return self->_badges;
}

- (BOOL)containsLinks
{
  return self->_containsLinks;
}

- (void)setContainsLinks:(BOOL)a3
{
  self->_containsLinks = a3;
}

- (int64_t)labelViewStyle
{
  return self->_labelViewStyle;
}

- (SKUILinkHandler)linkDelegate
{
  return (SKUILinkHandler *)objc_loadWeakRetained((id *)&self->_linkDelegate);
}

- (void)setLinkDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_linkDelegate, a3);
}

- (NSString)moreButtonTitle
{
  return self->_moreButtonTitle;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (NSArray)trailingBadges
{
  return self->_trailingBadges;
}

- (int64_t)badgePlacement
{
  return self->_badgePlacement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xml, 0);
  objc_storeStrong((id *)&self->_trailingBadges, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_domObjectsToViewElements, 0);
  objc_storeStrong((id *)&self->_moreButtonTitle, 0);
  objc_storeStrong((id *)&self->_linkToViewButtonElements, 0);
  objc_destroyWeak((id *)&self->_linkDelegate);
  objc_storeStrong((id *)&self->_badges, 0);
}

- (void)initWithDOMElement:(uint64_t)a3 parent:(uint64_t)a4 elementFactory:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
