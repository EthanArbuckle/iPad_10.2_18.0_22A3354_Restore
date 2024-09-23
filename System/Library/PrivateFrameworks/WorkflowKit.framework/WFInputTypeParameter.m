@implementation WFInputTypeParameter

- (WFInputTypeParameter)initWithDefinition:(id)a3
{
  WFInputTypeParameter *v3;
  WFInputTypeParameter *v4;
  WFInputTypeParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFInputTypeParameter;
  v3 = -[WFEnumerationParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFDynamicEnumerationParameter setDataSource:](v3, "setDataSource:", v3);
    v5 = v4;
  }

  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)accessoryIconForPossibleState:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC7B68], "clearBackground");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFImageContentItem")) & 1) != 0)
    {
      v8 = CFSTR("photo");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFAVAssetContentItem")) & 1) != 0)
    {
      v8 = CFSTR("music.on.film");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFiTunesProductContentItem")) & 1) != 0)
    {
      v8 = CFSTR("star.square");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFGenericFileContentItem")) & 1) != 0)
    {
      v8 = CFSTR("doc");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFFolderContentItem")) & 1) != 0)
    {
      v8 = CFSTR("folder");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFPDFContentItem")) & 1) != 0)
    {
      v8 = CFSTR("doc.text");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFStringContentItem")) & 1) != 0)
    {
      v8 = CFSTR("text.alignleft");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFRichTextContentItem")) & 1) != 0)
    {
      v8 = CFSTR("doc.richtext");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFSafariWebPageContentItem")) & 1) != 0)
    {
      v8 = CFSTR("safari");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFURLContentItem")) & 1) != 0)
    {
      v8 = CFSTR("link");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFArticleContentItem")) & 1) != 0)
    {
      v8 = CFSTR("doc.plaintext");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFDCMapsLinkContentItem")) & 1) != 0)
    {
      v8 = CFSTR("map");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFLocationContentItem")) & 1) != 0)
    {
      v8 = CFSTR("mappin.and.ellipse");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFContactContentItem")) & 1) != 0)
    {
      v8 = CFSTR("person.crop.circle");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFEmailAddressContentItem")) & 1) != 0)
    {
      v8 = CFSTR("envelope");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFPhoneNumberContentItem")) & 1) != 0)
    {
      v8 = CFSTR("phone.fill");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFDateContentItem")) & 1) != 0)
    {
      v8 = CFSTR("calendar");
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("WFAppStoreAppContentItem")))
      {
        v9 = 0;
        goto LABEL_45;
      }
      v8 = CFSTR("appstore");
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7DB0]), "initWithSymbolName:background:", v8, v7);
LABEL_45:

    goto LABEL_46;
  }
  v9 = 0;
LABEL_46:

  return v9;
}

- (id)localizedLabelForMultipleCompleteState:(id)a3
{
  return WFLocalizedString(CFSTR("Any"));
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (BOOL)allowsMultipleValues
{
  return 1;
}

- (id)defaultSupportedVariableTypes
{
  return 0;
}

- (id)selectionType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFInputTypeParameter;
  -[WFEnumerationParameter selectionType](&v3, sel_selectionType);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSString *v9;
  Class v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  objc_msgSend(v8, "value");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (v10 = NSClassFromString(v9),
        -[objc_class conformsToProtocol:](v10, "conformsToProtocol:", &unk_1EF725778)))
  {
    -[objc_class localizedPluralTypeDescription](v10, "localizedPluralTypeDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  WFCategorizedInputTypes();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a5 + 2))(v6, v7, 0);

}

- (id)possibleStatesForEnumeration:(id)a3
{
  void *v3;
  void *v4;

  WFCategorizedInputTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
