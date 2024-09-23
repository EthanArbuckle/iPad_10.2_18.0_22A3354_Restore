@implementation _NSAttributedStringIntentResolver

+ (void)resolveAttributedString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  _QWORD v9[6];

  length = a4.length;
  location = a4.location;
  if (objc_msgSend(a3, "_mayRequireIntentResolution"))
  {
    v8 = *MEMORY[0x1E0CB2C28];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69___NSAttributedStringIntentResolver_resolveAttributedString_inRange___block_invoke;
    v9[3] = &unk_1E26046E8;
    v9[4] = a1;
    v9[5] = a3;
    objc_msgSend(a3, "enumerateAttribute:inRange:options:usingBlock:", v8, location, length, 0x100000, v9);
    if (!length && location == objc_msgSend(a3, "length"))
      objc_msgSend(a3, "_markIntentsResolved");
  }
}

+ (id)attributedStringByResolvingString:(id)a3
{
  if (objc_msgSend(a3, "_mayRequireIntentResolution"))
    return -[_NSAttributedStringWithResolvedIntents initWithUnresolvedString:resolver:]([_NSAttributedStringWithResolvedIntents alloc], "initWithUnresolvedString:resolver:", a3, a1);
  else
    return a3;
}

+ (id)attributesByResolvingIntentsInAttributes:(id)a3
{
  id v3;
  uint64_t v5;
  _QWORD v7[6];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v3 = a3;
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2C28]);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  v7[5] = &v9;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78___NSAttributedStringIntentResolver_attributesByResolvingIntentsInAttributes___block_invoke;
  v8[3] = &unk_1E2604710;
  v8[4] = v3;
  v8[5] = &v9;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78___NSAttributedStringIntentResolver_attributesByResolvingIntentsInAttributes___block_invoke_2;
  v7[3] = &unk_1E2604738;
  v7[4] = v3;
  objc_msgSend(a1, "_replaceInlinePresentationIntent:get:set:", v5, v8, v7);
  if (v10[5])
    v3 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v3;
}

+ (void)_replaceInlinePresentationIntentInString:(id)a3 range:(_NSRange)a4 value:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  _QWORD v10[7];
  _QWORD v11[7];

  length = a4.length;
  location = a4.location;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __90___NSAttributedStringIntentResolver__replaceInlinePresentationIntentInString_range_value___block_invoke;
    v11[3] = &unk_1E2604760;
    v11[4] = a3;
    v11[5] = location;
    v11[6] = length;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __90___NSAttributedStringIntentResolver__replaceInlinePresentationIntentInString_range_value___block_invoke_2;
    v10[3] = &unk_1E2604788;
    v10[4] = a3;
    v10[5] = location;
    v10[6] = length;
    objc_msgSend(a1, "_replaceInlinePresentationIntent:get:set:", a5, v11, v10);
  }
}

+ (void)_replaceInlinePresentationIntent:(id)a3 get:(id)a4 set:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = objc_msgSend(a3, "integerValue");
  v9 = (*((uint64_t (**)(id, const __CFString *))a4 + 2))(a4, CFSTR("NSFont"));
  v10 = v9;
  v11 = v9;
  if (!v9)
    v11 = NSDefaultFont();
  v12 = objc_msgSend(a1, "fontAttributeValueForInlinePresentationIntent:suggestedBaseFont:suggestingTheDefaultFont:", v8, v11, v9 == 0);
  if (v12)
  {
    (*((void (**)(id, const __CFString *, uint64_t))a5 + 2))(a5, CFSTR("NSFont"), v12);
    if (v8 != 32)
      goto LABEL_14;
    goto LABEL_13;
  }
  if ((unint64_t)(v8 - 1) < 2)
    goto LABEL_9;
  if (v8 == 32)
  {
LABEL_13:
    (*((void (**)(id, const __CFString *, void *))a5 + 2))(a5, CFSTR("NSStrikethrough"), &unk_1E2631738);
    goto LABEL_14;
  }
  if (v8 == 4)
  {
LABEL_9:
    if (!v9)
      v10 = NSDefaultFont();
    v13 = objc_msgSend(a1, "fontAttributeValueForInlineIntent:suggestedBaseFont:suggestingTheDefaultFont:", v8, v10, v9 == 0);
    if (v13)
      (*((void (**)(id, const __CFString *, uint64_t))a5 + 2))(a5, CFSTR("NSFont"), v13);
  }
LABEL_14:
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, *MEMORY[0x1E0CB2C28], 0);
}

+ (id)fontAttributeValueForInlineIntent:(int64_t)a3 suggestedBaseFont:(id)a4 suggestingTheDefaultFont:(BOOL)a5
{
  return 0;
}

+ (id)fontAttributeValueForInlinePresentationIntent:(unint64_t)a3 suggestedBaseFont:(id)a4 suggestingTheDefaultFont:(BOOL)a5
{
  return 0;
}

@end
