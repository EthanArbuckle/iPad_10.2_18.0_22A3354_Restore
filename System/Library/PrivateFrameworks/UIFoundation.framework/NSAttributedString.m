@implementation NSAttributedString

- (id)_ui_scaledStringWithAttributes:(void *)a3 font:(double)a4 scale:
{
  void *v6;
  double v8;

  if (result)
  {
    v6 = result;
    if (a2)
    {
      objc_msgSend(a3, "pointSize");
      objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(a3, "fontWithSize:", round(v8 * a4 * 4.0) * 0.25), CFSTR("NSFont"));
      return (id)objc_msgSend(v6, "string");
    }
    else
    {
      return -[NSAttributedString _ui_attributedStringScaledByScaleFactor:](result, a4);
    }
  }
  return result;
}

NSFont *__87__NSAttributedString_NSExtendedStringDrawing___ui_attributedStringScaledByScaleFactor___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  double v8;
  NSFont *result;

  objc_msgSend(a2, "pointSize");
  result = +[UIFont fontWithDescriptor:size:](NSFont, "fontWithDescriptor:size:", objc_msgSend(a2, "fontDescriptor"), round(v8 * *(double *)(a1 + 40) * 4.0) * 0.25);
  if (result)
    return (NSFont *)objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", CFSTR("NSFont"), result, a3, a4);
  return result;
}

- (id)_ui_attributedStringScaledByScaleFactor:(id)result
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[6];

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(result, "mutableCopy");
    v5 = objc_msgSend((id)objc_msgSend(v3, "string"), "length");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __87__NSAttributedString_NSExtendedStringDrawing___ui_attributedStringScaledByScaleFactor___block_invoke;
    v6[3] = &unk_1E2605318;
    *(double *)&v6[5] = a2;
    v6[4] = v4;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSFont"), 0, v5, 0x100000, v6);
    return v4;
  }
  return result;
}

uint64_t __90__NSAttributedString_NSAttributedStringUIFoundationAdditions__containsAttachmentsInRange___block_invoke()
{
  void *v0;
  uint64_t result;

  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSAttributedStringTreatsAdaptiveImageGlyphsAsTextAttachment"));
  if (v0)
    result = objc_msgSend(v0, "BOOLValue");
  else
    result = 1;
  containsAttachmentsInRange__checksImageGlyphs = result;
  return result;
}

id __109__NSAttributedString_NSAttributedStringUIFoundationAdditions__lineBreakByHyphenatingBeforeIndex_withinRange___block_invoke()
{
  uint64_t v0;
  id result;

  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSHyphenationLanguage"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages"), "firstObject");
  result = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v0);
  lineBreakByHyphenatingBeforeIndex_withinRange__defaultLocale = (uint64_t)result;
  return result;
}

uint64_t __84__NSAttributedString_NSExtendedStringDrawing__boundingRectWithSize_options_context___block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  boundingRectWithSize_options_context__scaleSingleLineWithHeight = result;
  return result;
}

uint64_t __87__NSAttributedString_NSAttributedStringAttachmentConveniences___sharedAttachmentString__block_invoke()
{
  __int16 v1;

  v1 = -4;
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v1, 1);
}

uint64_t __95__NSAttributedString_NSAttributedStringAttachmentConveniences__attributedStringWithAttachment___block_invoke()
{
  uint64_t result;

  result = dyld_program_minos_at_least();
  attributedStringWithAttachment__useInitWithAttachment = result;
  return result;
}

uint64_t __87__NSAttributedString_NSAttributedStringUIFoundationAdditions___isAttributedStringAgent__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_inASA");
    _isAttributedStringAgent_isInAgent = result;
  }
  return result;
}

Class __89__NSAttributedString_NSAttributedStringUIFoundationAdditions__allowedSecureCodingClasses__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  Class Class;
  Class v12;
  Class v13;
  Class v14;
  Class v15;
  Class v16;
  Class result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = objc_alloc(MEMORY[0x1E0C99E20]);
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v23, "initWithObjects:", v22, v21, v20, v19, v18, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  Class = objc_getClass("NSFont");
  if (Class)
    objc_msgSend(v10, "addObject:", Class);
  v12 = objc_getClass("NSColor");
  if (v12)
    objc_msgSend(v10, "addObject:", v12);
  v13 = objc_getClass("NSImage");
  if (v13)
    objc_msgSend(v10, "addObject:", v13);
  v14 = objc_getClass("NSImageRep");
  if (v14)
    objc_msgSend(v10, "addObject:", v14);
  v15 = objc_getClass("UIFont");
  if (v15)
    objc_msgSend(v10, "addObject:", v15);
  v16 = objc_getClass("UIColor");
  if (v16)
    objc_msgSend(v10, "addObject:", v16);
  result = objc_getClass("UIImage");
  if (result)
    result = (Class)objc_msgSend(v10, "addObject:", result);
  allowedSecureCodingClasses_allowedClasses = (uint64_t)v10;
  return result;
}

uint64_t __90__NSAttributedString_NSAttributedStringUIFoundationAdditions__containsAttachmentsInRange___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void __101__NSAttributedString_NSAttributedStringUIFoundationAdditions__readFromURL_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  id v8;

  v6 = a2;
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      a2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithAttributedString:", v6);
    else
      a2 = 0;
  }
  v8 = (id)a2;
  if (!a2)
    a2 = v6;
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, a4);

}

void __102__NSAttributedString_NSAttributedStringUIFoundationAdditions__readFromData_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  id v8;

  v6 = a2;
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      a2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithAttributedString:", v6);
    else
      a2 = 0;
  }
  v8 = (id)a2;
  if (!a2)
    a2 = v6;
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, a4);

}

void __103__NSAttributedString_NSExtendedStringDrawing___ui_attributedSubstringFromRange_withTrackingAdjustment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8;
  double v9;
  id v10;

  v8 = objc_alloc(MEMORY[0x1E0CB37E8]);
  if (a2)
    objc_msgSend(a2, "doubleValue");
  else
    v9 = 0.0;
  v10 = (id)objc_msgSend(v8, "initWithDouble:", v9 + *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", CFSTR("NSKern"), v10, a3, a4);

}

@end
