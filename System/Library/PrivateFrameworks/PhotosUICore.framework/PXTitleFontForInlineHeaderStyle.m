@implementation PXTitleFontForInlineHeaderStyle

void __PXTitleFontForInlineHeaderStyle_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)PXTitleFontForInlineHeaderStyle_fontCache;
  PXTitleFontForInlineHeaderStyle_fontCache = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0DC48E8], 0, 0, &__block_literal_global_124_102423);

}

uint64_t __PXTitleFontForInlineHeaderStyle_block_invoke_2()
{
  return objc_msgSend((id)PXTitleFontForInlineHeaderStyle_fontCache, "removeAllObjects");
}

@end
