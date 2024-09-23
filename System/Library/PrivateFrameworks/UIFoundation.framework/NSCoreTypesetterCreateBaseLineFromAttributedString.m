@implementation NSCoreTypesetterCreateBaseLineFromAttributedString

void ____NSCoreTypesetterCreateBaseLineFromAttributedString_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v6;
  void *v7;
  void *v8;
  NSCountableTextLocation *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSCountableTextLocation *v13;

  if (!a2)
    return;
  v4 = a2;
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "string"), "characterAtIndex:", a3) != 65532)return;
  if (objc_msgSend(v4, "_isEmojiImage"))
    goto LABEL_6;
  v6 = objc_msgSend(v4, "adaptiveImageGlyph");
  if (v6)
  {
    v4 = (void *)v6;
LABEL_6:
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v7)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = -[_NSCachedAttributedString initWithAttributedString:]([_NSCachedAttributedString alloc], "initWithAttributedString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 40));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 40);
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E0CA8158], v4, a3, 1);
    return;
  }
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "textLayoutFragment");
  if (v8)
    v9 = (NSCountableTextLocation *)(id)objc_msgSend((id)objc_msgSend(v8, "textParagraph"), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a3, 0, 0);
  else
    v9 = -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", a3);
  v13 = v9;
  v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "textAttachmentLayoutInfoForLocation:attributes:", v9, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "attributesAtIndex:effectiveRange:", a3, 0)), "runDelegate");
  if (v10)
  {
    v11 = v10;
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v12)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = -[_NSCachedAttributedString initWithAttributedString:]([_NSCachedAttributedString alloc], "initWithAttributedString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 40));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 40);
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x1E0CA85C0], v11, a3, 1);
  }

}

@end
