@implementation ICTTParagraphStyle(UI)

- (uint64_t)layoutWritingDirection
{
  if (objc_msgSend(a1, "writingDirection") == -1)
    return objc_msgSend(MEMORY[0x1E0DC1290], "defaultWritingDirectionForLanguage:", 0);
  else
    return objc_msgSend(a1, "writingDirection");
}

- (uint64_t)alignmentAdjustedForLists
{
  uint64_t v2;

  if (!objc_msgSend(a1, "isList"))
    return objc_msgSend(a1, "alignment");
  if (objc_msgSend(a1, "layoutWritingDirection") == 1)
    v2 = MEMORY[0x1E0D63978];
  else
    v2 = MEMORY[0x1E0D63970];
  return *(_QWORD *)v2;
}

@end
