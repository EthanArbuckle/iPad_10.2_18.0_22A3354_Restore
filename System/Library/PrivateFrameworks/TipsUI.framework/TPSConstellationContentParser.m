@implementation TPSConstellationContentParser

+ (id)inlineIconPlaceHolderImage
{
  if (inlineIconPlaceHolderImage_predicate != -1)
    dispatch_once(&inlineIconPlaceHolderImage_predicate, &__block_literal_global);
  return (id)inlineIconPlaceHolderImage_gInlineIconPlaceHolderImage;
}

void __59__TPSConstellationContentParser_inlineIconPlaceHolderImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.TipsUI"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("InlineIconPlaceHolder"), v2, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)inlineIconPlaceHolderImage_gInlineIconPlaceHolderImage;
  inlineIconPlaceHolderImage_gInlineIconPlaceHolderImage = v0;

}

- (void)dealloc
{
  objc_super v3;

  -[TPSConstellationContentParser cancelAssetFetches](self, "cancelAssetFetches");
  v3.receiver = self;
  v3.super_class = (Class)TPSConstellationContentParser;
  -[TPSConstellationContentParser dealloc](&v3, sel_dealloc);
}

- (TPSConstellationContentParser)init
{
  TPSConstellationContentParser *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *syncQueue;
  uint64_t v6;
  NSMutableDictionary *assetsSessionItemMap;
  uint64_t v8;
  NSMutableDictionary *assetsTextAttachmentMap;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TPSConstellationContentParser;
  v2 = -[TPSConstellationContentParser init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.tips.constellationContentParserQueue", v3);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    assetsSessionItemMap = v2->_assetsSessionItemMap;
    v2->_assetsSessionItemMap = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    assetsTextAttachmentMap = v2->_assetsTextAttachmentMap;
    v2->_assetsTextAttachmentMap = (NSMutableDictionary *)v8;

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    -[TPSConstellationContentParser setDelegateRespondsToBoldFont:](self, "setDelegateRespondsToBoldFont:", objc_opt_respondsToSelector() & 1);

    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    -[TPSConstellationContentParser setDelegateRespondsToItalicFont:](self, "setDelegateRespondsToItalicFont:", objc_opt_respondsToSelector() & 1);

  }
}

- (void)cancelAssetFetches
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TPSConstellationContentParser assetsSessionItemMap](self, "assetsSessionItemMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "copy");

  -[TPSConstellationContentParser assetsSessionItemMap](self, "assetsSessionItemMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[TPSConstellationContentParser assetsTextAttachmentMap](self, "assetsTextAttachmentMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_26);
}

void __51__TPSConstellationContentParser_cancelAssetFetches__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BEB7DC8];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelSessionItem:", v4);

}

- (UIFont)boldFont
{
  UIFont *boldFont;
  void *v4;
  UIFont *v5;
  UIFont *v6;
  void *v7;
  UIFont *v8;
  UIFont *v9;

  boldFont = self->_boldFont;
  if (!boldFont)
  {
    if (-[TPSConstellationContentParser delegateRespondsToBoldFont](self, "delegateRespondsToBoldFont"))
    {
      -[TPSConstellationContentParser delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "constellationContentParserBoldFont:", self);
      v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
      v6 = self->_boldFont;
      self->_boldFont = v5;

    }
    boldFont = self->_boldFont;
    if (!boldFont)
    {
      -[TPSConstellationContentParser defaultAttributes](self, "defaultAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BEBB360]);
      v8 = (UIFont *)objc_claimAutoreleasedReturnValue();
      v9 = self->_boldFont;
      self->_boldFont = v8;

      boldFont = self->_boldFont;
    }
  }
  return boldFont;
}

- (UIFont)italicFont
{
  UIFont *italicFont;
  void *v4;
  UIFont *v5;
  UIFont *v6;
  void *v7;
  UIFont *v8;
  UIFont *v9;

  italicFont = self->_italicFont;
  if (!italicFont)
  {
    if (-[TPSConstellationContentParser delegateRespondsToItalicFont](self, "delegateRespondsToItalicFont"))
    {
      -[TPSConstellationContentParser delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "constellationContentParserItalicFont:", self);
      v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
      v6 = self->_italicFont;
      self->_italicFont = v5;

    }
    italicFont = self->_italicFont;
    if (!italicFont)
    {
      -[TPSConstellationContentParser defaultAttributes](self, "defaultAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BEBB360]);
      v8 = (UIFont *)objc_claimAutoreleasedReturnValue();
      v9 = self->_italicFont;
      self->_italicFont = v8;

      italicFont = self->_italicFont;
    }
  }
  return italicFont;
}

- (int64_t)numOfActiveRemoteURLSessions
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[TPSConstellationContentParser syncQueue](self, "syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__TPSConstellationContentParser_numOfActiveRemoteURLSessions__block_invoke;
  v6[3] = &unk_24C5DDB08;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__TPSConstellationContentParser_numOfActiveRemoteURLSessions__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "assetsSessionItemMap");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (id)attributedStringForConstellationContent:(id)a3 defaultAttributes:(id)a4 identifier:(id)a5 language:(id)a6 assetsBaseURL:(id)a7 assetFileInfoManager:(id)a8 supportsLinks:(BOOL)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  _QWORD block[4];
  id v29;
  id v30;
  id location;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  -[TPSConstellationContentParser setIdentifier:](self, "setIdentifier:", v18);
  -[TPSConstellationContentParser setDefaultAttributes:](self, "setDefaultAttributes:", v17);
  -[TPSConstellationContentParser setNumberOfParagraphTags:](self, "setNumberOfParagraphTags:", 0);
  -[TPSConstellationContentParser setLanguage:](self, "setLanguage:", v19);
  -[TPSConstellationContentParser setAssetsBaseURL:](self, "setAssetsBaseURL:", v20);
  -[TPSConstellationContentParser setAssetFileInfoManager:](self, "setAssetFileInfoManager:", v21);
  -[TPSConstellationContentParser setSupportsLinks:](self, "setSupportsLinks:", a9);
  -[TPSConstellationContentParser attributedStringForContent:error:](self, "attributedStringForContent:error:", v16, a10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TPSConstellationContentParser numberOfParagraphTags](self, "numberOfParagraphTags") >= 2)
  {
    v23 = objc_alloc_init(MEMORY[0x24BEBB490]);
    objc_msgSend(v23, "setParagraphSpacing:", 12.0);
    objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x24BEBB3A8], v23, 0, objc_msgSend(v22, "length"));

  }
  objc_initWeak(&location, self);
  v24 = (void *)objc_msgSend(v22, "copy");
  -[TPSConstellationContentParser syncQueue](self, "syncQueue");
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __166__TPSConstellationContentParser_attributedStringForConstellationContent_defaultAttributes_identifier_language_assetsBaseURL_assetFileInfoManager_supportsLinks_error___block_invoke;
  block[3] = &unk_24C5DDB30;
  objc_copyWeak(&v30, &location);
  v26 = v24;
  v29 = v26;
  dispatch_async(v25, block);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v26;
}

void __166__TPSConstellationContentParser_attributedStringForConstellationContent_defaultAttributes_identifier_language_assetsBaseURL_assetFileInfoManager_supportsLinks_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAttributedString:", *(_QWORD *)(a1 + 32));

}

- (id)attributedStringForContent:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", &stru_24C5E0A00, 0);
    objc_msgSend(v7, "beginEditing");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          switch(objc_msgSend(MEMORY[0x24BEB7D28], "contentTypeForContentDictionary:", v13))
          {
            case 0:
              -[TPSConstellationContentParser attributedStringForTextNode:](self, "attributedStringForTextNode:", v13);
              v14 = objc_claimAutoreleasedReturnValue();
              goto LABEL_13;
            case 1:
              -[TPSConstellationContentParser attributedStringForParagraphNode:error:](self, "attributedStringForParagraphNode:error:", v13, a4);
              v14 = objc_claimAutoreleasedReturnValue();
              goto LABEL_13;
            case 2:
              -[TPSConstellationContentParser attributedStringForSymbolNode:](self, "attributedStringForSymbolNode:", v13);
              v14 = objc_claimAutoreleasedReturnValue();
              goto LABEL_13;
            case 3:
              -[TPSConstellationContentParser attributedStringForInlineIconNode:](self, "attributedStringForInlineIconNode:", v13);
              v14 = objc_claimAutoreleasedReturnValue();
              goto LABEL_13;
            case 4:
              -[TPSConstellationContentParser attributedStringForPersonalizedTextNode:error:](self, "attributedStringForPersonalizedTextNode:error:", v13, a4);
              v14 = objc_claimAutoreleasedReturnValue();
LABEL_13:
              v15 = (void *)v14;
              if (v14)
              {
                objc_msgSend(v7, "appendAttributedString:", v14);

              }
              break;
            default:
              continue;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "endEditing");
    v6 = v17;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)attributesWithMarks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  TPSConstellationContentParser *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_22;
  -[TPSConstellationContentParser defaultAttributes](self, "defaultAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = v4;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    v11 = *MEMORY[0x24BEBB368];
    v12 = *MEMORY[0x24BEBB360];
    v27 = *MEMORY[0x24BEBB388];
    v28 = v7;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        switch(objc_msgSend(MEMORY[0x24BEB7D28], "markTypeForMarkDictionary:", v14))
        {
          case 0:
            if (!self->_ignoreLinks)
            {
              v15 = self;
              v16 = v12;
              v17 = v11;
              objc_msgSend(MEMORY[0x24BEB7D28], "hrefForLinkMark:", v14);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
                objc_msgSend(v6, "setObject:forKey:", v19, v27);

              v11 = v17;
              v12 = v16;
              self = v15;
              v7 = v28;
              goto LABEL_17;
            }
            continue;
          case 1:
            -[TPSConstellationContentParser boldFont](self, "boldFont");
            v20 = objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          case 2:
            -[TPSConstellationContentParser italicFont](self, "italicFont");
            v20 = objc_claimAutoreleasedReturnValue();
LABEL_14:
            v18 = (void *)v20;
            v21 = v6;
            v22 = v18;
            v23 = v12;
            goto LABEL_16;
          case 3:
            objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v6;
            v22 = v18;
            v23 = v11;
LABEL_16:
            objc_msgSend(v21, "setObject:forKey:", v22, v23);
LABEL_17:

            break;
          default:
            continue;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v9);
  }

  v4 = v26;
  if (v6)
  {
    v24 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
LABEL_22:
    -[TPSConstellationContentParser defaultAttributes](self, "defaultAttributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (id)attributedStringForTextNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "TPSSafeArrayForKey:", CFSTR("marks"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSConstellationContentParser attributesWithMarks:](self, "attributesWithMarks:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TPSConstellationContentParser supportsLinks](self, "supportsLinks")
    || (objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BEBB388]),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    objc_msgSend(MEMORY[0x24BEB7D28], "textForContentNode:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v9, v6);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)attributedStringForParagraphNode:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v6 = a3;
  if (-[TPSConstellationContentParser numberOfParagraphTags](self, "numberOfParagraphTags") < 1)
  {
    v10 = 0;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BDD1458]);
    -[TPSConstellationContentParser defaultAttributes](self, "defaultAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithString:attributes:", CFSTR("\n"), v8);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithAttributedString:", v9);
  }
  -[TPSConstellationContentParser setNumberOfParagraphTags:](self, "setNumberOfParagraphTags:", -[TPSConstellationContentParser numberOfParagraphTags](self, "numberOfParagraphTags") + 1);
  objc_msgSend(v6, "TPSSafeArrayForKey:", *MEMORY[0x24BEB7E88]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSConstellationContentParser attributedStringForContent:error:](self, "attributedStringForContent:error:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if (v10)
    {
      objc_msgSend(v10, "appendAttributedString:", v12);
      v14 = (id)objc_msgSend(v10, "copy");
    }
    else
    {
      v14 = v12;
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)attributedStringForSymbolNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  objc_msgSend(a3, "TPSSafeDictionaryForKey:", *MEMORY[0x24BEB7E80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "TPSSafeStringForKey:", *MEMORY[0x24BEB7E78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "TPSSafeStringForKey:", *MEMORY[0x24BEB7E50]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEB7E68]) & 1) != 0)
      {
        v8 = 1;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB7E60]) & 1) != 0)
      {
        v8 = 3;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB7E58]) & 1) != 0)
      {
        v8 = -1;
      }
      else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB7E70]))
      {
        v8 = 0;
      }
      else
      {
        v8 = 2;
      }
    }
    else
    {
      v8 = 2;
    }
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *MEMORY[0x24BEBE1D0], v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", v5, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v4, "TPSSafeStringForKey:", *MEMORY[0x24BEB7E20]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BEB7E28]))
      {

LABEL_18:
        objc_msgSend(MEMORY[0x24BEBB4B8], "textAttachmentWithImage:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPSConstellationContentParser accessibilityLabelFromAttribute:](self, "accessibilityLabelFromAttribute:", v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAccessibilityLabel:", v17);
        objc_msgSend(v16, "setAccessibilityElementsHidden:", objc_msgSend(v17, "isEqualToString:", CFSTR(" ")));
        v18 = objc_alloc(MEMORY[0x24BDD1458]);
        -[TPSConstellationContentParser defaultAttributes](self, "defaultAttributes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithAttachment:attributes:", v16, v19);

        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithAttributedString:", v20);
        v10 = v7;
        v7 = v12;
LABEL_20:

        goto LABEL_21;
      }
      -[TPSConstellationContentParser _colorForSystemColorString:](self, "_colorForSystemColorString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageWithTintColor:renderingMode:", v14, 1);
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
      if (v15)
        goto LABEL_18;
    }
    v9 = 0;
    goto LABEL_20;
  }
  v9 = 0;
LABEL_21:

  return v9;
}

- (id)accessibilityLabelFromAttribute:(id)a3
{
  __CFString *v3;

  objc_msgSend(a3, "TPSSafeStringForKey:", *MEMORY[0x24BEB7E18]);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v3, "length"))
  {

    v3 = CFSTR(" ");
  }
  return v3;
}

- (id)attributedStringForInlineIconNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  float v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  _BOOL8 v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "TPSSafeDictionaryForKey:", *MEMORY[0x24BEB7E80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "TPSSafeStringForKey:", *MEMORY[0x24BEB7E38]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSConstellationContentParser assetsBaseURL](self, "assetsBaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSConstellationContentParser language](self, "language");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0)
  {
    objc_msgSend(MEMORY[0x24BEB7D68], "default");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CF80000, v11, OS_LOG_TYPE_DEFAULT, "Unable to fetch inline icon due due to missing imageID / baseURL / language", buf, 2u);
    }
    v12 = 0;
  }
  else
  {
    -[TPSConstellationContentParser traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceStyle") == 2;

    -[TPSConstellationContentParser traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayScale");
    v17 = v16;

    if (v17 == 0.0)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scale");
      v17 = v19;

    }
    -[TPSConstellationContentParser assetFileInfoManager](self, "assetFileInfoManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fileInfoWithMainIdentifier:userInterfaceStyle:scale:", v5, v14, (uint64_t)v17);
    v11 = objc_claimAutoreleasedReturnValue();

    -[NSObject size](v11, "size");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "width");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    v24 = v23;
    objc_msgSend(v21, "height");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "floatValue");
    v27 = v26;

    v28 = *(double *)(MEMORY[0x24BDBF148] + 8);
    if (*MEMORY[0x24BDBF148] == v24 && v28 == v27)
    {
      objc_msgSend(MEMORY[0x24BEB7D68], "default", *MEMORY[0x24BDBF148], v28);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v5;
        _os_log_impl(&dword_20CF80000, v45, OS_LOG_TYPE_DEFAULT, "No file found with size information for identifier %@", buf, 0xCu);
      }
      v12 = 0;
    }
    else
    {
      v51 = v21;
      -[TPSConstellationContentParser normalizedSizeFromSize:scale:](self, "normalizedSizeFromSize:scale:", v24, v27, v17);
      v31 = v30;
      v33 = v32;
      v34 = objc_alloc_init(MEMORY[0x24BEBB4B8]);
      -[TPSConstellationContentParser accessibilityLabelFromAttribute:](self, "accessibilityLabelFromAttribute:", v4);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setAccessibilityLabel:", v35);
      v50 = v35;
      objc_msgSend(v34, "setAccessibilityElementsHidden:", objc_msgSend(v35, "isEqualToString:", CFSTR(" ")));
      v36 = objc_alloc_init(MEMORY[0x24BEB7D00]);
      objc_msgSend(v36, "setImageId:", v5);
      objc_msgSend(v36, "setBaseURL:", v6);
      v37 = objc_alloc(MEMORY[0x24BEB7D08]);
      -[TPSConstellationContentParser assetFileInfoManager](self, "assetFileInfoManager");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v14;
      v40 = (void *)v38;
      v41 = (void *)objc_msgSend(v37, "initWithAssets:language:userInterfaceStyle:assetFileInfoManager:", v36, v8, v39, v38);

      v52 = v41;
      objc_msgSend(v41, "cacheIdentifierForType:", 0);
      v42 = objc_claimAutoreleasedReturnValue();
      +[TPSImageAssetController getImageForIdentifier:](TPSImageAssetController, "getImageForIdentifier:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        objc_msgSend((id)objc_opt_class(), "inlineIconPlaceHolderImage");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPSConstellationContentParser fetchAssetConfiguration:cacheIdentifier:textAttachment:](self, "fetchAssetConfiguration:cacheIdentifier:textAttachment:", v52, v42, v34);
      }
      objc_msgSend(v34, "setImage:", v43);
      -[TPSConstellationContentParser boundsForImage:size:](self, "boundsForImage:size:", v43, v31, v33);
      objc_msgSend(v34, "setBounds:");
      v48 = v42;
      if (v34)
      {
        objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v34, v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      objc_msgSend(MEMORY[0x24BEB7D68], "default", v48);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        -[TPSConstellationContentParser attributedStringForInlineIconNode:].cold.1((uint64_t)v5, v46, v31, v33);

      v45 = v44;
      v12 = v45;
      v21 = v51;
    }

  }
  return v12;
}

- (CGSize)normalizedSizeFromSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TPSConstellationContentParser defaultAttributes](self, "defaultAttributes", a3.width, a3.height, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BEBB360]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    +[TPSAppearance bodyFont](TPSAppearance, "bodyFont");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v10, "pointSize");
  v12 = 19.0;
  if (width <= 200.0)
    v13 = width;
  else
    v13 = 19.0;
  if (height <= 40.0)
    v12 = height;
  v14 = v11 / 17.0;
  v15 = v13 * v14;
  v16 = v12 * v14;

  v17 = v15;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)attributedStringForPersonalizedTextNode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  objc_msgSend(v6, "TPSSafeArrayForKey:", CFSTR("marks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSConstellationContentParser attributesWithMarks:](self, "attributesWithMarks:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "TPSSafeDictionaryForKey:", *MEMORY[0x24BEB7E80]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "TPSSafeNumberForKey:", *MEMORY[0x24BEB7E48]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "TPSSafeNumberForKey:", *MEMORY[0x24BEB7E40]);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    v14 = objc_msgSend(v10, "integerValue");
    v15 = objc_msgSend(v12, "integerValue");
    if (!v14)
    {
      v16 = v15;
      -[TPSConstellationContentParser delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) != 0)
      {
        -[TPSConstellationContentParser delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constellationContentParser:personalizedStringForID:", self, v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          goto LABEL_10;
      }
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BEB7E30]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
    {
      if (v20)
      {
LABEL_10:
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v20, v8);
        goto LABEL_16;
      }
    }
    else
    {

    }
  }
  if (a4 && !*a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.tipsUI.contentParser"), 1, 0);
    v20 = 0;
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
    v21 = 0;
  }
LABEL_16:

  return v21;
}

- (void)fetchAssetConfiguration:(id)a3 cacheIdentifier:(id)a4 textAttachment:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  void (**v15)(void *);
  void (**v16)(void *);
  void (*v17)(void *);
  void *v18;
  int v19;
  id v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  TPSConstellationContentParser *v33;
  uint64_t *v34;
  id v35;
  _QWORD aBlock[4];
  id v37;
  TPSConstellationContentParser *v38;
  id v39;
  id v40;
  _QWORD block[5];
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    objc_initWeak(location, self);
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy_;
    v48 = __Block_byref_object_dispose_;
    v49 = 0;
    -[TPSConstellationContentParser syncQueue](self, "syncQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke;
    block[3] = &unk_24C5DDB58;
    v43 = &v44;
    block[4] = self;
    v13 = v9;
    v42 = v13;
    dispatch_sync(v11, block);

    aBlock[0] = v12;
    aBlock[1] = 3221225472;
    aBlock[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_2;
    aBlock[3] = &unk_24C5DDBA8;
    v14 = v13;
    v37 = v14;
    v38 = self;
    objc_copyWeak(&v40, location);
    v39 = v10;
    v15 = (void (**)(void *))_Block_copy(aBlock);
    v16 = v15;
    v17 = v15[2];
    if (v45[5])
    {
      v17(v15);
    }
    else
    {
      v17(v15);
      objc_msgSend(MEMORY[0x24BEB7D30], "assetPathFromAssetConfiguration:type:", v8, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BDD1350];
      v31[0] = v12;
      v31[1] = 3221225472;
      v31[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_4;
      v31[3] = &unk_24C5DDC20;
      objc_copyWeak(&v35, location);
      v34 = &v44;
      v20 = v14;
      v32 = v20;
      v33 = self;
      LODWORD(v21) = v19;
      +[TPSImageAssetController formattedDataForPath:identifier:priority:completionHandler:](TPSImageAssetController, "formattedDataForPath:identifier:priority:completionHandler:", v18, v20, v31, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v45[5];
      v45[5] = v22;

      objc_msgSend((id)v45[5], "sessionTask");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v25) = v19;
      objc_msgSend(v24, "setPriority:", v25);

      -[TPSConstellationContentParser syncQueue](self, "syncQueue");
      v26 = objc_claimAutoreleasedReturnValue();
      v27[0] = v12;
      v27[1] = 3221225472;
      v27[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_7;
      v27[3] = &unk_24C5DDC48;
      objc_copyWeak(&v30, location);
      v28 = v20;
      v29 = &v44;
      dispatch_async(v26, v27);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&v35);

    }
    objc_destroyWeak(&v40);

    _Block_object_dispose(&v44, 8);
    objc_destroyWeak(location);
  }

}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "assetsSessionItemMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_2(id *a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  if (a1[4])
  {
    objc_msgSend(a1[5], "syncQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_3;
    block[3] = &unk_24C5DDB80;
    objc_copyWeak(&v6, a1 + 7);
    v4 = a1[4];
    v5 = a1[6];
    dispatch_async(v2, block);

    objc_destroyWeak(&v6);
  }
}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "assetsTextAttachmentMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "assetsTextAttachmentMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "sessionTask");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v13 = *(void **)(a1 + 32);
  v14 = v13;

  v15 = 0;
  if (v9 && !a7)
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isCancelled") & 1) != 0)
      v15 = 0;
    else
      v15 = v9;
  }
  objc_msgSend(*(id *)(a1 + 40), "syncQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_5;
  block[3] = &unk_24C5DDBF8;
  v20 = v15;
  v21 = WeakRetained;
  v22 = v14;
  v17 = v14;
  v18 = v15;
  dispatch_async(v16, block);

}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "assetsTextAttachmentMap");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "setImage:", *(_QWORD *)(a1 + 32));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_6;
    block[3] = &unk_24C5DDBD0;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "assetsSessionItemMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "assetsTextAttachmentMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));

  }
}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_6(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constellationContentParserAttributedStringUpdated:", *(_QWORD *)(a1 + 32));

  }
}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(WeakRetained, "assetsSessionItemMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 32));

}

- (CGRect)boundsForImage:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "size");
  if (width == 0.0)
  {
    if (v7 == 0.0)
      width = 19.0;
    else
      width = v7;
  }
  v9 = 19.0;
  if (v8 != 0.0)
    v9 = v8;
  if (height == 0.0)
    height = v9;
  -[TPSConstellationContentParser scaledValueForSize:](self, "scaledValueForSize:", width);
  v11 = v10;
  -[TPSConstellationContentParser scaledValueForSize:](self, "scaledValueForSize:", height);
  v13 = v12;
  v14 = -floor(v12 * 0.25);
  v15 = 0.0;
  v16 = v11;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (double)scaledValueForSize:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  -[TPSConstellationContentParser defaultAttributes](self, "defaultAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEBB360]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "pointSize");
  v10 = v9;
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    a3 = a3 / v12;

  }
  return v10 / 17.0 * a3;
}

- (id)_colorForSystemColorString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("black")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("labelColor")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "hasSuffix:", CFSTR("Color")) & 1) == 0)
    {
      objc_msgSend(v3, "stringByAppendingString:", CFSTR("Color"));
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v5;
    }
    objc_msgSend(MEMORY[0x24BEBD4B8], "performSelector:", NSSelectorFromString((NSString *)v3));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  v7 = v4;

  return v7;
}

- (TPSConstellationContentParserDelegate)delegate
{
  return (TPSConstellationContentParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setNumOfActiveRemoteURLSessions:(int64_t)a3
{
  self->_numOfActiveRemoteURLSessions = a3;
}

- (BOOL)ignoreLinks
{
  return self->_ignoreLinks;
}

- (void)setIgnoreLinks:(BOOL)a3
{
  self->_ignoreLinks = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)delegateRespondsToBoldFont
{
  return self->_delegateRespondsToBoldFont;
}

- (void)setDelegateRespondsToBoldFont:(BOOL)a3
{
  self->_delegateRespondsToBoldFont = a3;
}

- (BOOL)delegateRespondsToItalicFont
{
  return self->_delegateRespondsToItalicFont;
}

- (void)setDelegateRespondsToItalicFont:(BOOL)a3
{
  self->_delegateRespondsToItalicFont = a3;
}

- (BOOL)supportsLinks
{
  return self->_supportsLinks;
}

- (void)setSupportsLinks:(BOOL)a3
{
  self->_supportsLinks = a3;
}

- (int)numberOfParagraphTags
{
  return self->_numberOfParagraphTags;
}

- (void)setNumberOfParagraphTags:(int)a3
{
  self->_numberOfParagraphTags = a3;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (NSMutableDictionary)assetsSessionItemMap
{
  return self->_assetsSessionItemMap;
}

- (void)setAssetsSessionItemMap:(id)a3
{
  objc_storeStrong((id *)&self->_assetsSessionItemMap, a3);
}

- (NSMutableDictionary)assetsTextAttachmentMap
{
  return self->_assetsTextAttachmentMap;
}

- (void)setAssetsTextAttachmentMap:(id)a3
{
  objc_storeStrong((id *)&self->_assetsTextAttachmentMap, a3);
}

- (void)setBoldFont:(id)a3
{
  objc_storeStrong((id *)&self->_boldFont, a3);
}

- (void)setItalicFont:(id)a3
{
  objc_storeStrong((id *)&self->_italicFont, a3);
}

- (NSDictionary)defaultAttributes
{
  return self->_defaultAttributes;
}

- (void)setDefaultAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAttributes, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (NSURL)assetsBaseURL
{
  return self->_assetsBaseURL;
}

- (void)setAssetsBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_assetsBaseURL, a3);
}

- (TPSAssetFileInfoManager)assetFileInfoManager
{
  return self->_assetFileInfoManager;
}

- (void)setAssetFileInfoManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetFileInfoManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetFileInfoManager, 0);
  objc_storeStrong((id *)&self->_assetsBaseURL, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_defaultAttributes, 0);
  objc_storeStrong((id *)&self->_italicFont, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_assetsTextAttachmentMap, 0);
  objc_storeStrong((id *)&self->_assetsSessionItemMap, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)attributedStringForInlineIconNode:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3, double a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  NSStringFromCGSize(*(CGSize *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_20CF80000, a2, OS_LOG_TYPE_DEBUG, "Displaying %@ with size %@", (uint8_t *)&v7, 0x16u);

}

@end
