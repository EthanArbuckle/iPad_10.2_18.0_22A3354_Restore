@implementation SKUIViewElementFontWithStyle

void __SKUIViewElementFontWithStyle_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 1282, 0);
  v1 = (void *)SKUIViewElementFontWithStyle_sTextScaleMap;
  SKUIViewElementFontWithStyle_sTextScaleMap = v0;

  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, CFSTR("x-small"), (const void *)1);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, CFSTR("small"), (const void *)2);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, CFSTR("medium"), (const void *)3);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, CFSTR("large"), (const void *)4);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, CFSTR("x-large"), (const void *)5);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, CFSTR("xx-large"), (const void *)6);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, CFSTR("xxx-large"), (const void *)7);
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 1282, 0);
  v3 = (void *)SKUIViewElementFontWithStyle_sTextStyleMap;
  SKUIViewElementFontWithStyle_sTextStyleMap = v2;

  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("body"), (const void *)1);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("body-short"), (const void *)2);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("callout"), (const void *)3);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("callout-short"), (const void *)4);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("caption1"), (const void *)5);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("caption1-medium-short"), (const void *)6);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("caption1-short"), (const void *)7);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("caption2"), (const void *)8);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("caption2-short"), (const void *)9);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("caption3"), (const void *)0xA);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("footnote"), (const void *)0xB);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("footnote-short"), (const void *)0xC);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("headline"), (const void *)0xD);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("headline-short"), (const void *)0xE);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("subhead"), (const void *)0x10);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("subhead-short"), (const void *)0x11);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("subhead2"), (const void *)0x12);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("subhead2-medium-short"), (const void *)0x13);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("subhead2-short"), (const void *)0x14);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("subhead2-tall"), (const void *)0x15);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("super-headline-1"), (const void *)0x16);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("super-headline-2"), (const void *)0x17);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("super-headline-3"), (const void *)0x18);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("super-headline-4"), (const void *)0x19);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("super-headline-5"), (const void *)0x1A);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("super-headline-5-medium-short"), (const void *)0x1B);
  NSMapInsertKnownAbsent((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, CFSTR("super-headline-5-short"), (const void *)0x1C);
}

@end
