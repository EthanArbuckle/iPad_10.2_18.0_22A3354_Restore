@implementation UIAccessibilityConvertAttachmentsInAttributedStringToAX

void __UIAccessibilityConvertAttachmentsInAttributedStringToAX_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  void *v19;
  UITextAttachmentAccessibilityElement *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  UITextAttachmentAccessibilityElement *v26;
  UITextAttachmentAccessibilityElement *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;

  v7 = a2;
  if (v7 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v8 = (void *)MEMORY[0x1E0CF40C0];
    objc_msgSend(*(id *)(a1 + 32), "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "axAttributedStringWithString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  v13 = *MEMORY[0x1E0CA8158];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8158]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (_QWORD *)MEMORY[0x1E0CEA098];
  v16 = (uint64_t *)MEMORY[0x1E0CEA0A0];
  if (v14)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "contentDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "length"))
      {
        v20 = -[UITextAttachmentAccessibilityElement initWithAccessibilityContainer:]([UITextAttachmentAccessibilityElement alloc], "initWithAccessibilityContainer:", *(_QWORD *)(a1 + 40));
        -[UITextAttachmentAccessibilityElement setGlyph:](v20, "setGlyph:", v18);
        -[UITextAttachmentAccessibilityElement setAccessibilityLabel:](v20, "setAccessibilityLabel:", v19);
        v21 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AdaptiveGlyph-%p"), v20);
        v22 = v15;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_accessibilitySetRetainedValue:forKey:", v20, v23);

        v15 = v22;
        v16 = (uint64_t *)MEMORY[0x1E0CEA0A0];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v20, *MEMORY[0x1E0CF4138], a3, a4);

      }
    }
LABEL_9:

    goto LABEL_18;
  }
  v24 = *MEMORY[0x1E0CEA050];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CEA050]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v7, "objectForKey:", v24);
    v26 = (UITextAttachmentAccessibilityElement *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v26;
      -[UITextAttachmentAccessibilityElement accessibilityLabel](v27, "accessibilityLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "length");

      if (v29)
      {
        -[UITextAttachmentAccessibilityElement setAccessibilityTraits:](v27, "setAccessibilityTraits:", *MEMORY[0x1E0CEB170]);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v27, *MEMORY[0x1E0CF4138], a3, a4);
        v26 = v27;
      }
      else
      {
        -[UITextAttachmentAccessibilityElement image](v27, "image");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          _UIAccessibilityProcessImageAttachment(v27);
          v26 = (UITextAttachmentAccessibilityElement *)objc_claimAutoreleasedReturnValue();

          -[UITextAttachmentAccessibilityElement accessibilityLabel](v26, "accessibilityLabel");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "length");

          if (v45)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v26, *MEMORY[0x1E0CF4138], a3, a4);
        }
        else
        {
          -[UITextAttachmentAccessibilityElement fileType](v27, "fileType");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = v27;
          if (v52)
          {
            v53 = (void *)MEMORY[0x1E0CB3940];
            -[UITextAttachmentAccessibilityElement fileWrapper](v27, "fileWrapper");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "preferredFilename");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "stringWithFormat:", CFSTR("TextAttachment-%@"), v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 40), "_accessibilityValueForKey:", v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v57;
            if (v57)
            {
              v26 = v57;
            }
            else
            {
              v26 = -[UITextAttachmentAccessibilityElement initWithAccessibilityContainer:]([UITextAttachmentAccessibilityElement alloc], "initWithAccessibilityContainer:", *(_QWORD *)(a1 + 40));
              -[UITextAttachmentAccessibilityElement setAttachment:](v26, "setAttachment:", v27);
              v60 = _UIAccessibilityProcessImageAttachment(v27);
              -[UITextAttachmentAccessibilityElement accessibilityLabel](v27, "accessibilityLabel");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITextAttachmentAccessibilityElement setAccessibilityLabel:](v26, "setAccessibilityLabel:", v61);

              -[UITextAttachmentAccessibilityElement setAccessibilityTraits:](v26, "setAccessibilityTraits:", -[UITextAttachmentAccessibilityElement accessibilityTraits](v27, "accessibilityTraits"));
              -[UITextAttachmentAccessibilityElement accessibilityValue](v27, "accessibilityValue");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITextAttachmentAccessibilityElement setAccessibilityValue:](v26, "setAccessibilityValue:", v62);

              objc_msgSend(*(id *)(a1 + 40), "_accessibilitySetRetainedValue:forKey:", v26, v56);
            }

            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v26, *MEMORY[0x1E0CF4138], a3, a4);
            v15 = (_QWORD *)MEMORY[0x1E0CEA098];
          }
        }
      }

    }
LABEL_15:

    goto LABEL_18;
  }
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CEA0C0]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("UIAccessibilityTextAttributeContext"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CEB0C0]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      AXSSTextualContextFromUITextualContext(v42);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v18, *MEMORY[0x1E0CF4068], a3, a4);
      goto LABEL_9;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("animatedPlaceholderIdentifier"));
    v46 = objc_claimAutoreleasedReturnValue();
    if (!v46)
      goto LABEL_35;
    v47 = (void *)v46;
    v48 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("􀮷"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringByTrimmingCharactersInSet:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "length");

    if (v51)
    {
LABEL_35:
      v18 = (void *)objc_msgSend(v7, "mutableCopy");
      if (!AXDoesRequestingClientDeserveAutomation())
      {
        objc_msgSend(v18, "removeObjectForKey:", *MEMORY[0x1E0CEA0D0]);
        objc_msgSend(v18, "removeObjectForKey:", *v15);
        objc_msgSend(v18, "removeObjectForKey:", *MEMORY[0x1E0CEA0F0]);
        objc_msgSend(v18, "removeObjectForKey:", *v16);
      }
      objc_msgSend(v18, "removeObjectForKey:", *MEMORY[0x1E0CEA140]);
      objc_msgSend(v18, "removeObjectForKey:", *MEMORY[0x1E0CEA148]);
      objc_msgSend(v18, "removeObjectForKey:", CFSTR("_UITextInputDictationResultMetadata"));
      objc_msgSend(v18, "removeObjectForKey:", *MEMORY[0x1E0CEA0C8]);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAttributes:withRange:", v18, a3, a4);
      goto LABEL_9;
    }
    v59 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    UIKitAccessibilityLocalizedString(CFSTR("textview.animated.placeholder"));
    v26 = (UITextAttachmentAccessibilityElement *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setAttribute:forKey:withRange:", v26, *MEMORY[0x1E0CF4318], a3, a4);
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CF4200], a3, a4);
LABEL_18:
  v31 = *v16;
  objc_msgSend(v7, "objectForKey:", *v16);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = _UIAXColorForObject(v32);

  if (v33)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v33, v31, a3, a4);
  v34 = *MEMORY[0x1E0CEA058];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CEA058]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = _UIAXColorForObject(v35);

  if (v36)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v36, v34, a3, a4);
  v37 = *v15;
  objc_msgSend(v7, "objectForKey:", *v15);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_opt_class();
    objc_msgSend(v7, "objectForKeyedSubscript:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAttribute:forKey:withRange:", v40, v37, a3, a4);

  }
}

@end
