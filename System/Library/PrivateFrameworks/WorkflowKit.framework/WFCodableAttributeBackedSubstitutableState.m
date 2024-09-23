@implementation WFCodableAttributeBackedSubstitutableState

- (NSString)readableTitle
{
  NSString *readableTitle;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  readableTitle = self->_readableTitle;
  if (!readableTitle)
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCodableAttributeBackedSubstitutableState stringLocalizer](self, "stringLocalizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[WFCodableAttributeBackedSubstitutableState codableAttribute](self, "codableAttribute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_intents_readableTitleWithLocalizer:metadata:", v6, v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_readableTitle;
    self->_readableTitle = v9;

    if (!v5)
    readableTitle = self->_readableTitle;
  }
  return readableTitle;
}

- (NSString)readableSubtitle
{
  NSString *readableSubtitle;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  readableSubtitle = self->_readableSubtitle;
  if (!readableSubtitle)
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCodableAttributeBackedSubstitutableState stringLocalizer](self, "stringLocalizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[WFCodableAttributeBackedSubstitutableState codableAttribute](self, "codableAttribute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_intents_readableSubtitleWithLocalizer:metadata:", v6, v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_readableSubtitle;
    self->_readableSubtitle = v9;

    if (!v5)
    readableSubtitle = self->_readableSubtitle;
  }
  return readableSubtitle;
}

- (WFCodableAttributeBackedSubstitutableState)initWithValue:(id)a3 codableAttribute:(id)a4 stringLocalizer:(id)a5
{
  id v9;
  id v10;
  WFCodableAttributeBackedSubstitutableState *v11;
  WFCodableAttributeBackedSubstitutableState *v12;
  WFCodableAttributeBackedSubstitutableState *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFCodableAttributeBackedSubstitutableState;
  v11 = -[WFVariableSubstitutableParameterState initWithValue:](&v15, sel_initWithValue_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_codableAttribute, a4);
    objc_storeStrong((id *)&v12->_stringLocalizer, a5);
    v13 = v12;
  }

  return v12;
}

- (WFCodableAttributeBackedSubstitutableState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  WFCodableAttributeBackedSubstitutableState *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WFDeserializedVariableObject(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self = -[WFVariableSubstitutableParameterState initWithVariable:](self, "initWithVariable:", v11);
      v12 = self;
      goto LABEL_14;
    }

  }
  v13 = v10;
  v14 = v13;
  if (v13)
  {
    if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EF74ED78))
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  objc_msgSend(v16, "codableAttribute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringLocalizer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc_init(MEMORY[0x1E0CBD9B8]);
  objc_msgSend(v18, "decodeWithCodableAttribute:from:", v11, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    self = -[WFCodableAttributeBackedSubstitutableState initWithValue:codableAttribute:stringLocalizer:](self, "initWithValue:codableAttribute:stringLocalizer:", v19, v11, v17);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

LABEL_14:
  return v12;
}

- (id)serializedRepresentation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    WFSerializedVariableObject(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[WFCodableAttributeBackedSubstitutableState resizeDisplayImageIfNecessary:](self, "resizeDisplayImageIfNecessary:", v6);
    }

    v4 = objc_alloc_init(MEMORY[0x1E0CBD9C0]);
    -[WFVariableSubstitutableParameterState value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCodableAttributeBackedSubstitutableState codableAttribute](self, "codableAttribute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:withCodableAttribute:", v7, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  objc_msgSend(v8, "parameter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "codableAttribute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v14, "prompt");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v15, 0);

    }
    else
    {

      -[WFVariableSubstitutableParameterState variable](self, "variable");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __103__WFCodableAttributeBackedSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v18[3] = &unk_1E7AF6F98;
      v20 = v10;
      v19 = v12;
      objc_msgSend(v16, "getContentWithContext:completionHandler:", v8, v18);

      v14 = v20;
    }
  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wf_processedParameterValueForValue:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v14, 0);
  }

}

- (void)resizeDisplayImageIfNecessary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFData *v9;
  CGImageSourceRef v10;
  CGImageSource *v11;
  void (**v12)(_QWORD);
  CFStringRef Type;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "displayImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "displayImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_imageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      objc_msgSend(v3, "displayImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_imageData");
      v9 = (const __CFData *)objc_claimAutoreleasedReturnValue();

      v10 = CGImageSourceCreateWithData(v9, 0);
      if (v10)
      {
        v11 = v10;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __76__WFCodableAttributeBackedSubstitutableState_resizeDisplayImageIfNecessary___block_invoke;
        aBlock[3] = &__block_descriptor_40_e5_v8__0l;
        aBlock[4] = v10;
        v12 = (void (**)(_QWORD))_Block_copy(aBlock);
        Type = CGImageSourceGetType(v11);
        if (Type)
        {
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", Type);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            WFImageSizeFromImageSource();
            if (v16 >= 100.0 || v15 >= 100.0)
            {
              objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", v14);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              WFResizedImageFromImageSource();
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v18, "data");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v19, "length"))
              {
                objc_msgSend(MEMORY[0x1E0CBD958], "imageWithImageData:", v19);
                v20 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setDisplayImage:", v20);
              }
              else
              {
                getWFGeneralLogObject();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v23 = "-[WFCodableAttributeBackedSubstitutableState resizeDisplayImageIfNecessary:]";
                  _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_FAULT, "%s Unable to resize oversized display image provided by custom intent.", buf, 0xCu);
                }
              }

            }
          }

        }
        v12[2](v12);

      }
    }
  }

}

- (void)setReadableTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setReadableSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (INCodableAttribute)codableAttribute
{
  return self->_codableAttribute;
}

- (INStringLocalizer)stringLocalizer
{
  return self->_stringLocalizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringLocalizer, 0);
  objc_storeStrong((id *)&self->_codableAttribute, 0);
  objc_storeStrong((id *)&self->_readableSubtitle, 0);
  objc_storeStrong((id *)&self->_readableTitle, 0);
}

void __76__WFCodableAttributeBackedSubstitutableState_resizeDisplayImageIfNecessary___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __103__WFCodableAttributeBackedSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  char v9;

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = objc_msgSend(*(id *)(a1 + 32), "supportsDynamicEnumeration") ^ 1;
    else
      v4 = 0;
    v5 = objc_msgSend(*(id *)(a1 + 32), "wf_contentItemClass");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __103__WFCodableAttributeBackedSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v6[3] = &unk_1E7AF4CB0;
    v8 = *(id *)(a1 + 40);
    v9 = v4;
    v7 = v3;
    objc_msgSend(v7, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __103__WFCodableAttributeBackedSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void (*v11)(void);
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7 && !v9)
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_7:
    v11();
    goto LABEL_8;
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __103__WFCodableAttributeBackedSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3;
  v13[3] = &unk_1E7AF96D8;
  v12 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v12, "getStringRepresentation:", v13);

LABEL_8:
}

void __103__WFCodableAttributeBackedSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, _QWORD, id);
  id v10;

  v10 = a2;
  if (v10)
  {
    v5 = (objc_class *)MEMORY[0x1E0CBDA08];
    v6 = a3;
    v7 = (id)objc_msgSend([v5 alloc], "initWithIdentifier:displayString:", 0, v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void (**)(uint64_t, _QWORD, id))(v8 + 16);
    v7 = a3;
    v9(v8, 0, v7);
  }

}

+ (id)processingValueClasses
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
