@implementation EBColorTable

+ (void)readWithState:(id)a3
{
  id v3;
  uint64_t v4;
  EDColorsCollection *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  unsigned __int16 v9;
  unsigned __int16 v10;

  v3 = a3;
  XlColorTable::XlColorTable((XlColorTable *)v8);
  v4 = objc_msgSend(v3, "xlReader", XlColorTable::init((XlColorTable *)v8));
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 264))(v4, v8);
  v5 = -[EDColorsCollection initWithDefaultSetup:]([EDColorsCollection alloc], "initWithDefaultSetup:", 1);
  -[EDColorsCollection addPalette:paletteSize:paletteX:paletteXSize:](v5, "addPalette:paletteSize:paletteX:paletteXSize:", v8[1], v9, v8[2], v10);
  objc_msgSend(v3, "resources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColors:", v5);

  objc_msgSend(v3, "oaState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColorPalette:", v5);

  XlColorTable::~XlColorTable((XlColorTable *)v8);
}

@end
