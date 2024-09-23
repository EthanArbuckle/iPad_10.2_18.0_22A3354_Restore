@implementation ECColumnWidthConvertor

- (void)setupWithEDFont:(id)a3 state:(id)a4
{
  id v5;
  double v6;
  float v7;
  float v8;
  id v9;

  v5 = a3;
  self->mMultiplier = 7;
  v9 = v5;
  -[ECColumnWidthConvertor stringSizeWithFont:edFont:drawingState:](self, "stringSizeWithFont:edFont:drawingState:", CFSTR("m"));
  v7 = v6 * 0.65;
  if (v7 != 0.0)
  {
    -[ECColumnWidthConvertor fontWidthAdjustmentFor:](self, "fontWidthAdjustmentFor:", v9);
    self->mMultiplier = (int)((float)(v8 * v7) + 0.5);
  }

}

- (CGSize)stringSizeWithFont:(id)a3 edFont:(id)a4 drawingState:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  __CFString *v12;
  double v13;
  CTFontRef v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  CGSize result;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x24BDBF148];
  v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v7 && objc_msgSend(v7, "length"))
  {
    objc_msgSend(v8, "name");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v8, "height");
      v14 = CTFontCreateWithName(v12, v13 / 20.0, 0);
      if (v14)
      {
        +[TCImportFontCache stringSizeForText:ctFontRef:](TCImportFontCache, "stringSizeForText:ctFontRef:", v7, v14);
        v10 = v15;
        v11 = v16;
        CFRelease(v14);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[ECColumnWidthConvertor(Private) stringSizeWithFont:edFont:drawingState:]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Excel/Common/ECColumnWidthConvertor.mm");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 90, 0, "invalid nil value for '%{public}s'", "ctFontRef");

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
    }

  }
  v19 = v10;
  v20 = v11;
  result.height = v20;
  result.width = v19;
  return result;
}

- (double)xlColumnWidthFromXlBaseColumnWidth:(double)a3
{
  return 5.0 / (double)self->mMultiplier + a3;
}

- (double)lassoColumnWidthFromXl:(double)a3
{
  return round((double)self->mMultiplier * a3);
}

- (double)xlColumnWidthFromLasso:(double)a3
{
  return a3 / (double)self->mMultiplier;
}

- (float)fontWidthAdjustmentFor:(id)a3
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;

  v3 = a3;
  if ((v4 & 1) == 0
  {
    -[ECColumnWidthConvertor(Private) fontWidthAdjustmentFor:]::sFontAdjustmentMap = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("Academy Engraved LET"), &unk_24F46AAD8, CFSTR("Apple-Chancery"), &unk_24F46AAE8, CFSTR("AbadiMT-CondensedExtraBold"), &unk_24F46AAF8, CFSTR("Ayuthaya"), &unk_24F46AB08, CFSTR("Arial"), &unk_24F46AB08, CFSTR("ArialMT"), &unk_24F46AB08, CFSTR("ArialRoundedMTBold"), &unk_24F46AB08, CFSTR("AmericanTypewriter"), &unk_24F46AB08, CFSTR("AlBayan"),
                                                                                       &unk_24F46AB08,
                                                                                       CFSTR("AppleSymbols"),
                                                                                       &unk_24F46AB08,
                                                                                       CFSTR("Avenir-Heavy"),
                                                                                       &unk_24F46AB08,
                                                                                       CFSTR("Avenir-Black"),
                                                                                       &unk_24F46AB18,
                                                                                       CFSTR("Avenir-Light"),
                                                                                       &unk_24F46AB08,
                                                                                       CFSTR("Avenir Next"),
                                                                                       &unk_24F46AB08,
                                                                                       CFSTR("Avenir Medium"),
                                                                                       &unk_24F46AB08,
                                                                                       CFSTR("AvenirNext-DemiBold"),
                                                                                       &unk_24F46AB08,
                                                                                       CFSTR("AvenirNext-Heavy"),
                                                                                       &unk_24F46AB08,
                                                                                       CFSTR("AvenirNext-Medium"),
                                                                                       &unk_24F46AB08,
                                                                                       CFSTR("AvenirNextCondensed-Medium"),
                                                                                       &unk_24F46AB28,
                                                                                       CFSTR("Avenir Next Condensed Ultra Lig"),
                                                                                       &unk_24F46AB18,
                                                                                       CFSTR("AvenirNext-UltraLight"),
                                                                                       &unk_24F46AAF8,
                                                                                       CFSTR("Baghdad"),
                                                                                       &unk_24F46AAE8,
                                                                                       CFSTR("BanglaSangamMN"),
                                                                                       &unk_24F46AB38,
                                                                                       CFSTR("Bank Gothic"),
                                                                                       &unk_24F46AB38,
                                                                                       CFSTR("Blackmoor LET"),
                                                                                       &unk_24F46AB48,
                                                                                       CFSTR("BlairMdITC TT"),
                                                                                       &unk_24F46AB48,
                                                                                       CFSTR("Bodoni 72"),
                                                                                       &unk_24F46AB48,
                                                                                       CFSTR("Bodoni 72 Oldstyle"),
                                                                                       &unk_24F46AAF8,
                                                                                       CFSTR("Bodoni 72 Smallcaps"),
                                                                                       &unk_24F46AB58,
                                                                                       CFSTR("BodoniOrnamentsITCTT"),
                                                                                       &unk_24F46AAD8,
                                                                                       CFSTR("BookshelfSymbolSeven"));
  }
  v5 = (void *)-[ECColumnWidthConvertor(Private) fontWidthAdjustmentFor:]::sFontAdjustmentMap;
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "floatValue");
    v9 = v8;
  }
  else
  {
    v9 = 1.0;
  }

  return v9;
}

@end
