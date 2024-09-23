@implementation NSTextAttachmentLayoutContext

uint64_t __91___NSTextAttachmentLayoutContext_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t result;

  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", a2);
  result = objc_msgSend(v3, "textAttachmentViewProvider");
  if (result)
  {
    result = objc_msgSend(v3, "textLayoutFragment");
    if (result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

@end
