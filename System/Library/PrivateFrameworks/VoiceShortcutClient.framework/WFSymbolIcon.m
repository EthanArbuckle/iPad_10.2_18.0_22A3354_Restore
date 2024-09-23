@implementation WFSymbolIcon

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_symbolColor, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

- (WFColor)symbolColor
{
  return self->_symbolColor;
}

- (WFSymbolIcon)iconWithSymbolColor:(id)a3 background:(id)a4
{
  WFIconBackground *v6;
  WFColor *v7;
  id v8;
  WFColor *symbolColor;
  WFIconBackground *background;
  void *v11;

  v6 = (WFIconBackground *)a4;
  v7 = (WFColor *)a3;
  v8 = objc_alloc((Class)objc_opt_class());
  symbolColor = v7;
  if (!v7)
    symbolColor = self->_symbolColor;
  background = v6;
  if (!v6)
    background = self->_background;
  v11 = (void *)objc_msgSend(v8, "initWithSymbolName:symbolColor:background:", self->_symbolName, symbolColor, background);

  return (WFSymbolIcon *)v11;
}

- (BOOL)hasClearBackground
{
  void *v2;
  void *v3;
  char v4;

  -[WFSymbolIcon background](self, "background");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFIconColorBackground clearBackground](WFIconColorBackground, "clearBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (WFIconBackground)background
{
  return self->_background;
}

- (WFSymbolIcon)initWithSymbolName:(id)a3 background:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WFSymbolIcon *v9;

  v6 = a4;
  v7 = a3;
  +[WFColor whiteColor](WFColor, "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFSymbolIcon initWithSymbolName:symbolColor:background:](self, "initWithSymbolName:symbolColor:background:", v7, v8, v6);

  return v9;
}

- (WFSymbolIcon)initWithSymbolName:(id)a3 symbolColor:(id)a4 background:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFSymbolIcon *v12;
  uint64_t v13;
  NSString *symbolName;
  WFSymbolIcon *v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFIcon.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("symbolColor"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFIcon.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("symbolName"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFIcon.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("background"));

LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)WFSymbolIcon;
  v12 = -[WFIcon _init](&v20, sel__init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    symbolName = v12->_symbolName;
    v12->_symbolName = (NSString *)v13;

    objc_storeStrong((id *)&v12->_symbolColor, a4);
    objc_storeStrong((id *)&v12->_background, a5);
    v15 = v12;
  }

  return v12;
}

- (WFSymbolIcon)initWithSymbolName:(id)a3 symbolColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WFSymbolIcon *v9;

  v6 = a4;
  v7 = a3;
  +[WFIconColorBackground clearBackground](WFIconColorBackground, "clearBackground");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFSymbolIcon initWithSymbolName:symbolColor:background:](self, "initWithSymbolName:symbolColor:background:", v7, v6, v8);

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_symbolName, "hash");
  v4 = -[WFColor hash](self->_symbolColor, "hash") ^ v3;
  return v4 ^ -[WFIconBackground hash](self->_background, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFSymbolIcon symbolName](self, "symbolName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "symbolName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {

      }
      else
      {
        LOBYTE(v10) = 0;
        v11 = v8;
        v12 = v7;
        if (!v7 || !v8)
          goto LABEL_23;
        v13 = objc_msgSend(v7, "isEqualToString:", v8);

        if (!v13)
        {
          LOBYTE(v10) = 0;
LABEL_24:

          goto LABEL_25;
        }
      }
      -[WFSymbolIcon symbolColor](self, "symbolColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "symbolColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      v16 = v15;
      v11 = v16;
      if (v12 == v16)
      {

      }
      else
      {
        LOBYTE(v10) = 0;
        v17 = v16;
        v18 = v12;
        if (!v12 || !v16)
        {
LABEL_22:

LABEL_23:
          goto LABEL_24;
        }
        v10 = objc_msgSend(v12, "isEqual:", v16);

        if (!v10)
          goto LABEL_23;
      }
      -[WFSymbolIcon background](self, "background");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "background");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v19;
      v21 = v20;
      v17 = v21;
      if (v18 == v21)
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        LOBYTE(v10) = 0;
        if (v18 && v21)
          LOBYTE(v10) = objc_msgSend(v18, "isEqual:", v21);
      }

      goto LABEL_22;
    }
  }
  LOBYTE(v10) = 0;
LABEL_25:

  return v10;
}

- (WFSymbolIcon)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFSymbolIcon *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("background"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFSymbolIcon initWithSymbolName:symbolColor:background:](self, "initWithSymbolName:symbolColor:background:", v5, v7, v6);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *symbolName;
  id v5;

  symbolName = self->_symbolName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", symbolName, CFSTR("symbolName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_symbolColor, CFSTR("symbolColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_background, CFSTR("background"));

}

- (BOOL)hasTransparentBackground
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  -[WFSymbolIcon background](self, "background");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "color");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alpha");
    v5 = v4 < 1.0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)symbolIconForActionIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  WFSymbolIcon *v12;

  v5 = a3;
  v6 = a4;
  if (symbolIconForActionIdentifier_bundleIdentifier__onceToken[0] != -1)
    dispatch_once(symbolIconForActionIdentifier_bundleIdentifier__onceToken, &__block_literal_global_16905);
  objc_msgSend((id)symbolIconForActionIdentifier_bundleIdentifier__actionIdentifierMapping, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (objc_msgSend((id)symbolIconForActionIdentifier_bundleIdentifier__bundleIdentifierMapping, "objectForKeyedSubscript:", v6), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    +[WFColor tintColorForBundleIdentifier:](WFColor, "tintColorForBundleIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 21);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    v12 = -[WFSymbolIcon initWithSymbolName:symbolColor:]([WFSymbolIcon alloc], "initWithSymbolName:symbolColor:", v7, v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __86__WFSymbolIcon_IconicSymbolUtilities__symbolIconForActionIdentifier_bundleIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[9];
  _QWORD v7[10];

  v7[9] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("com.apple.VoiceMemos.ToggleRecording");
  v6[1] = CFSTR("com.apple.mobiletimer.INCreateTimerIntent");
  v7[0] = CFSTR("waveform");
  v7[1] = CFSTR("timer");
  v6[2] = CFSTR("com.apple.mobiletimer.CreateAlarmIntent");
  v6[3] = CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents.MTCreateAlarmIntent");
  v7[2] = CFSTR("alarm.fill");
  v7[3] = CFSTR("alarm.fill");
  v6[4] = CFSTR("com.apple.TVRemoteUIService.LaunchRemoteIntent");
  v6[5] = CFSTR("com.apple.iBooks.OpenBookIntent");
  v7[4] = CFSTR("appletvremote.gen4.fill");
  v7[5] = CFSTR("book.fill");
  v6[6] = CFSTR("com.apple.iBooks.PlayAudiobookIntent");
  v6[7] = CFSTR("com.apple.DocumentsApp.ScanDocument");
  v7[6] = CFSTR("headphones");
  v7[7] = CFSTR("doc.viewfinder.fill");
  v6[8] = CFSTR("is.workflow.actions.timer.start");
  v7[8] = CFSTR("timer");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)symbolIconForActionIdentifier_bundleIdentifier__actionIdentifierMapping;
  symbolIconForActionIdentifier_bundleIdentifier__actionIdentifierMapping = v0;

  v4[0] = CFSTR("com.apple.Pages");
  v4[1] = CFSTR("com.apple.Numbers");
  v5[0] = CFSTR("apple.pages");
  v5[1] = CFSTR("apple.numbers");
  v4[2] = CFSTR("com.apple.Keynote");
  v4[3] = CFSTR("com.apple.BarcodeScanner");
  v5[2] = CFSTR("apple.keynote");
  v5[3] = CFSTR("qrcode.viewfinder");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)symbolIconForActionIdentifier_bundleIdentifier__bundleIdentifierMapping;
  symbolIconForActionIdentifier_bundleIdentifier__bundleIdentifierMapping = v2;

}

@end
