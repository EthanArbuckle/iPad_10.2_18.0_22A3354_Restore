@implementation SCLUnlockHistoryItemFormatter

- (SCLUnlockHistoryItemFormatter)init
{
  SCLUnlockHistoryItemFormatter *v2;
  uint64_t v3;
  UIColor *highlightColor;
  uint64_t v5;
  UIColor *color;
  uint64_t v7;
  NSLocale *locale;
  NSDateFormatter *v9;
  NSDateFormatter *dateFormatter;
  NSDateComponentsFormatter *v11;
  NSDateComponentsFormatter *componentsFormatter;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SCLUnlockHistoryItemFormatter;
  v2 = -[SCLUnlockHistoryItemFormatter init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "orangeColor");
    v3 = objc_claimAutoreleasedReturnValue();
    highlightColor = v2->_highlightColor;
    v2->_highlightColor = (UIColor *)v3;

    objc_msgSend(MEMORY[0x24BDF6950], "tableCellGrayTextColor");
    v5 = objc_claimAutoreleasedReturnValue();
    color = v2->_color;
    v2->_color = (UIColor *)v5;

    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v7 = objc_claimAutoreleasedReturnValue();
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v7;

    v9 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v9;

    -[NSDateFormatter setDateStyle:](v2->_dateFormatter, "setDateStyle:", 0);
    -[NSDateFormatter setTimeStyle:](v2->_dateFormatter, "setTimeStyle:", 1);
    v11 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x24BDD14F8]);
    componentsFormatter = v2->_componentsFormatter;
    v2->_componentsFormatter = v11;

    -[NSDateComponentsFormatter setUnitsStyle:](v2->_componentsFormatter, "setUnitsStyle:", 2);
    -[NSDateComponentsFormatter setAllowedUnits:](v2->_componentsFormatter, "setAllowedUnits:", 192);
    -[NSDateComponentsFormatter setMaximumUnitCount:](v2->_componentsFormatter, "setMaximumUnitCount:", 1);
  }
  return v2;
}

- (id)localizedStringWithTimeString:(id)a3 durationString:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("UNLOCK_HISTORY_LIST_FORMAT"), &stru_24E712518, CFSTR("SettingsFormatters"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@%@"), 0, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SCLUnlockHistoryItemFormatter timeStringForHistoryItem:](self, "timeStringForHistoryItem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLUnlockHistoryItemFormatter durationStringForHistoryItem:](self, "durationStringForHistoryItem:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLUnlockHistoryItemFormatter localizedStringWithTimeString:durationString:](self, "localizedStringWithTimeString:durationString:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SCLUnlockHistoryItemFormatter timeStringForHistoryItem:](self, "timeStringForHistoryItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLUnlockHistoryItemFormatter durationStringForHistoryItem:](self, "durationStringForHistoryItem:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLUnlockHistoryItemFormatter localizedStringWithTimeString:durationString:](self, "localizedStringWithTimeString:durationString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLUnlockHistoryItemFormatter fontDescriptor](self, "fontDescriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BEBB368];
    v24[0] = *MEMORY[0x24BEBB368];
    -[SCLUnlockHistoryItemFormatter color](self, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = *MEMORY[0x24BEBB360];
    v25[0] = v11;
    v25[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (v7)
      objc_msgSend(v13, "addEntriesFromDictionary:", v7);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v9, v13);
    v15 = objc_msgSend(v9, "rangeOfString:", v8);
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = v15;
      v18 = v16;
      -[SCLUnlockHistoryItemFormatter highlightColor](self, "highlightColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAttribute:value:range:", v21, v19, v17, v18);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)fontDescriptor
{
  return (id)objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77B0]);
}

- (id)timeStringForHistoryItem:(id)a3
{
  NSDateFormatter *dateFormatter;
  id v5;
  void *v6;
  NSDateFormatter *v7;
  void *v8;
  NSDateFormatter *v9;
  void *v10;
  void *v11;
  void *v12;

  dateFormatter = self->_dateFormatter;
  v5 = a3;
  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setCalendar:](dateFormatter, "setCalendar:", v6);

  v7 = self->_dateFormatter;
  objc_msgSend(v5, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setTimeZone:](v7, "setTimeZone:", v8);

  v9 = self->_dateFormatter;
  objc_msgSend(v5, "unlockedInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)durationStringForHistoryItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "unlockedInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "unlockedInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "components:fromDate:toDate:options:", 192, v6, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateComponentsFormatter stringFromDateComponents:](self->_componentsFormatter, "stringFromDateComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (NSDateComponentsFormatter)componentsFormatter
{
  return self->_componentsFormatter;
}

- (void)setComponentsFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_componentsFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentsFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
