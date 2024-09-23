@implementation RUITableViewRow

+ (void)initialize
{
  id v3;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel_resetLocale, *MEMORY[0x24BDBCA70], 0);

  }
}

+ (id)_timeZoneAdjustedDateFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCF38];
  v4 = a3;
  objc_msgSend(v3, "systemTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", (double)objc_msgSend(v5, "secondsFromGMT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_formatterForDateYMD
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = (void *)gYMDDateFormatter;
  if (!gYMDDateFormatter)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v4 = (void *)gYMDDateFormatter;
    gYMDDateFormatter = (uint64_t)v3;

    objc_msgSend((id)gYMDDateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF38]), "initWithName:", CFSTR("UTC"));
    objc_msgSend((id)gYMDDateFormatter, "setTimeZone:", v5);
    v6 = objc_alloc(MEMORY[0x24BDBCE48]);
    v7 = (void *)objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    objc_msgSend(v7, "setTimeZone:", v5);
    objc_msgSend((id)gYMDDateFormatter, "setCalendar:", v7);

    v2 = (void *)gYMDDateFormatter;
  }
  return v2;
}

+ (id)_formatterForShortDate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)gShortDateFormatter;
  if (!gShortDateFormatter)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v5 = (void *)gShortDateFormatter;
    gShortDateFormatter = (uint64_t)v4;

    objc_msgSend(a1, "_formatterForDateYMD");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)gShortDateFormatter;
    objc_msgSend(v6, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCalendar:", v8);

    v9 = (void *)gShortDateFormatter;
    objc_msgSend(v6, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZone:", v10);

    objc_msgSend((id)gShortDateFormatter, "setDateStyle:", 1);
    objc_msgSend((id)gShortDateFormatter, "setTimeStyle:", 0);
    v11 = (void *)gShortDateFormatter;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCalendar:", v12);

    v3 = (void *)gShortDateFormatter;
  }
  return v3;
}

+ (id)_formatterForMonthAndDay
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)gMonthAndDayFormatter;
  if (!gMonthAndDayFormatter)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v5 = (void *)gMonthAndDayFormatter;
    gMonthAndDayFormatter = (uint64_t)v4;

    objc_msgSend(a1, "_formatterForDateYMD");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)gMonthAndDayFormatter;
    objc_msgSend(v6, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCalendar:", v8);

    v9 = (void *)gMonthAndDayFormatter;
    objc_msgSend(v6, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZone:", v10);

    v11 = (void *)gMonthAndDayFormatter;
    v12 = (void *)MEMORY[0x24BDD1500];
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateFormatFromTemplate:options:locale:", CFSTR("d-MMMM"), 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDateFormat:", v14);

    v3 = (void *)gMonthAndDayFormatter;
  }
  return v3;
}

- (void)setSourceXMLElement:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RUITableViewRow;
  -[RUIElement setSourceXMLElement:](&v4, sel_setSourceXMLElement_, a3);
  -[RUITableViewRow parseBadge](self, "parseBadge");
}

+ (id)_formatterForYearAndMonth
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)gYearAndMonthFormatter;
  if (!gYearAndMonthFormatter)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v5 = (void *)gYearAndMonthFormatter;
    gYearAndMonthFormatter = (uint64_t)v4;

    objc_msgSend(a1, "_formatterForDateYMD");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)gYearAndMonthFormatter;
    objc_msgSend(v6, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCalendar:", v8);

    v9 = (void *)gYearAndMonthFormatter;
    objc_msgSend(v6, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZone:", v10);

    v11 = (void *)gYearAndMonthFormatter;
    v12 = (void *)MEMORY[0x24BDD1500];
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateFormatFromTemplate:options:locale:", CFSTR("MM/yyyy"), 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDateFormat:", v14);

    v3 = (void *)gYearAndMonthFormatter;
  }
  return v3;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a3;
  -[RUITableViewRow detailButton](self, "detailButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v7)
  {
    -[RUITableViewRow tableCell](self, "tableCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[RUIElement identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v4);

    if (v11)
    {
      -[RUITableViewRow tableCell](self, "tableCell");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)_datePickerFormatter
{
  NSDateFormatter *datePickerFormatter;
  int64_t datePickerMode;
  uint64_t v5;
  NSDateFormatter *v6;
  void *v7;
  NSDateFormatter *v8;
  void *v9;
  NSDateFormatter *v10;

  datePickerFormatter = self->_datePickerFormatter;
  if (!datePickerFormatter)
  {
    datePickerMode = self->_datePickerMode;
    if (datePickerMode == 4)
    {
      objc_msgSend((id)objc_opt_class(), "_formatterForYearAndMonth");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (datePickerMode == 4270)
        objc_msgSend((id)objc_opt_class(), "_formatterForMonthAndDay");
      else
        objc_msgSend((id)objc_opt_class(), "_formatterForShortDate");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (NSDateFormatter *)v5;
    -[RUITableViewRow dateFormatterCalendarIdentifier](self, "dateFormatterCalendarIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (NSDateFormatter *)-[NSDateFormatter copy](v6, "copy");

      objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter setCalendar:](v8, "setCalendar:", v9);

      v6 = v8;
    }
    v10 = self->_datePickerFormatter;
    self->_datePickerFormatter = v6;

    datePickerFormatter = self->_datePickerFormatter;
  }
  return datePickerFormatter;
}

+ (void)resetLocale
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)gYMDDateFormatter;
  gYMDDateFormatter = 0;

  v3 = (void *)gShortDateFormatter;
  gShortDateFormatter = 0;

  v4 = (void *)gMonthAndDayFormatter;
  gMonthAndDayFormatter = 0;

  v5 = (void *)gYearAndMonthFormatter;
  gYearAndMonthFormatter = 0;

}

- (void)setAttributes:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  RUITableViewRow *v20;
  _QWORD *v21;
  id v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v20 = self;
  v29 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = objc_msgSend(&unk_24C2B1F48, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(&unk_24C2B1F48);
        v8 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v8, v20);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR("\n"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v8);

        }
      }
      v5 = objc_msgSend(&unk_24C2B1F48, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("mode"), v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "isEqualToString:", CFSTR("monthandday")))
  {
    v14 = 4270;
    v15 = v21;
  }
  else
  {
    v15 = v21;
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("yearandmonth")))
      v14 = 4;
    else
      v14 = 1;
  }
  v15[24] = v14;
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("style"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lowercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "isEqualToString:", CFSTR("compact")))
  {
    v18 = 2;
  }
  else if (objc_msgSend(v17, "isEqualToString:", CFSTR("wheels")))
  {
    v18 = 1;
  }
  else
  {
    v18 = 3;
  }
  v15[25] = v18;
  v19 = (void *)v15[20];
  v15[20] = 0;

  v23.receiver = v15;
  v23.super_class = (Class)RUITableViewRow;
  -[RUIElement setAttributes:](&v23, sel_setAttributes_, v3);

}

- (BOOL)_hasSubLabel
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("subLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[RUITableViewRow htmlSubLabelData](self, "htmlSubLabelData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "length") != 0;

  }
  return v5;
}

- (id)dateFormatterCalendarIdentifier
{
  void *v2;
  void *v3;
  id v4;

  -[RUIElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("calendar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("gregorian")))
    v4 = (id)*MEMORY[0x24BDBCA18];
  else
    v4 = 0;

  return v4;
}

- (id)textColorForAttributeName:(id)a3 defaultColorString:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x24BEBD4B8];
  v7 = a4;
  v8 = a3;
  -[RUIElement attributes](self, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_remoteUI_colorWithString:defaultColor:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)textColorForAttributeName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BEBD4B8];
  v5 = a3;
  -[RUIElement attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_remoteUI_colorWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)radioGroupSelectedColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("radioGroupSelectedColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BEBD4B8];
    -[RUIElement attributes](self, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("radioGroupSelectedColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_remoteUI_colorWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[RUIElement style](self, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "radioGroupSelectedColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)configureAccessiblityWithTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  -[RUIElement attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("class"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("editableText")))
  {
    -[RemoteUITableViewCell editableTextField](self->_tableCell, "editableTextField");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)RUITableViewRow;
  -[RUIElement configureAccessiblityWithTarget:](&v8, sel_configureAccessiblityWithTarget_, v4);

}

- (void)_updateTextColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("class"));
  v42 = (id)objc_claimAutoreleasedReturnValue();

  if (-[RUITableViewRow isFocused](self, "isFocused"))
  {
    -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement style](self, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "focusedRowTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v6);

    -[RUIElement style](self, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "focusedRowTextColor");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v14 = (void *)v8;
    -[UITableViewCell ruiEditableTextField](self->_tableCell, "ruiEditableTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v14);

    goto LABEL_8;
  }
  -[RUIElement attributes](self, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("labelColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement style](self, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "labelRowTextColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v17);

    -[RUIElement style](self, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "labelRowTextColor");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[RUIElement attributes](self, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("labelColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[RUITableViewRow textColorForAttributeName:](self, "textColorForAttributeName:", CFSTR("labelColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v14);
  }
  else
  {
    -[RUIElement style](self, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "labelRowTextColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v36);

  }
LABEL_8:

  if (-[RUITableViewRow _hasSubLabel](self, "_hasSubLabel"))
  {
    -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell ruiValueLabel](self->_tableCell, "ruiValueLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement attributes](self, "attributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("subLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      if (-[RUITableViewRow isFocused](self, "isFocused"))
      {
        -[RUIElement style](self, "style");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "focusedRowTextColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTextColor:", v24);

      }
      else
      {
        -[RUITableViewRow textColorForAttributeName:defaultColorString:](self, "textColorForAttributeName:defaultColorString:", CFSTR("subLabelColor"), CFSTR("secondaryLabelColor"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTextColor:", v23);
      }

    }
    -[RUIElement attributes](self, "attributes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("detailLabel"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
      goto LABEL_25;
    if (-[RUITableViewRow isFocused](self, "isFocused"))
      goto LABEL_23;
    goto LABEL_18;
  }
  if ((objc_msgSend(v42, "isEqualToString:", CFSTR("link")) & 1) != 0
    || (objc_msgSend(v42, "isEqualToString:", CFSTR("label")) & 1) != 0
    || objc_msgSend(v42, "isEqualToString:", CFSTR("button")))
  {
    -[RUIElement attributes](self, "attributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("detailLabel"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[RUIElement attributes](self, "attributes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKey:", CFSTR("detailLinkURL"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
LABEL_26:

        goto LABEL_27;
      }
      v28 = -[RUITableViewRow isFocused](self, "isFocused");
      -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
LABEL_23:
        -[RUIElement style](self, "style");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "focusedRowTextColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTextColor:", v32);

        goto LABEL_24;
      }
LABEL_18:
      -[RUITableViewRow textColorForAttributeName:defaultColorString:](self, "textColorForAttributeName:defaultColorString:", CFSTR("detailLabelColor"), CFSTR("secondaryLabelColor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTextColor:", v29);
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
  }
LABEL_27:
  if (-[RUIElement enabled](self, "enabled") && objc_msgSend(v42, "isEqualToString:", CFSTR("button")))
  {
    -[RUIElement attributes](self, "attributes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKey:", CFSTR("accessory"));
    v34 = objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = (void *)v34;
    }
    else
    {
      -[RUIElement attributes](self, "attributes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKey:", CFSTR("detailLabel"));
      v37 = objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        v38 = (void *)v37;
      }
      else
      {
        -[RUIElement attributes](self, "attributes");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKey:", CFSTR("subLabel"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {

        }
        else
        {
          -[RUIElement attributes](self, "attributes");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKey:", CFSTR("placeholder"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
            goto LABEL_38;
          -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[RUIElement style](self, "style");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "buttonRowTextColor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setTextColor:", v38);
        }
      }

    }
  }
LABEL_38:

}

- (void)_updateContentForDisabledState
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  id v20;

  v3 = -[RUIElement enabled](self, "enabled");
  -[RUIElement attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("class"));
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "isEqualToString:", CFSTR("editableText")))
  {
    -[UITableViewCell ruiEditableTextField](self->_tableCell, "ruiEditableTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

    -[UITableViewCell ruiEditableTextField](self->_tableCell, "ruiEditableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0.5;
    if (v3)
      v8 = 1.0;
    objc_msgSend(v6, "setAlpha:", v8);

  }
  -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v3);

  -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell ruiValueLabel](self->_tableCell, "ruiValueLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v3);
  -[RUIElement attributes](self, "attributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("subLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else
  {
    -[RUIElement attributes](self, "attributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("detailLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_9;
  }
  objc_msgSend(v10, "setEnabled:", v3);
LABEL_9:
  -[UISwitch setEnabled:](self->_switchControl, "setEnabled:", v3);
  -[RUITableViewRow _updateCellSelectionStyle](self, "_updateCellSelectionStyle");
  -[UITableViewCell ruiImageView](self->_tableCell, "ruiImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", v3);

  -[UITableViewCell ruiImageView](self->_tableCell, "ruiImageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = 0.5;
  if (v3)
    v19 = 1.0;
  objc_msgSend(v17, "setAlpha:", v19);

  -[RUITableViewRow _updateTextColors](self, "_updateTextColors");
}

- (void)_updateCellSelectionStyle
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;

  v3 = -[RUIElement enabled](self, "enabled");
  -[RUIElement attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("class"));
  v23 = (id)objc_claimAutoreleasedReturnValue();

  -[RUITableViewRow tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "allowsMultipleSelectionDuringEditing") & 1) != 0)
  {
    -[RUITableViewRow tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEditing");

    if ((v9 & v3) != 0)
      v10 = 3;
    else
      v10 = 0;
  }
  else
  {

    v10 = 0;
  }
  -[RUIElement attributes](self, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("editing"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[RUIElement attributes](self, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("editing"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");
    -[RUITableViewRow tableCell](self, "tableCell");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEditing:", v15);

  }
  if (!v3
    || (objc_msgSend(v23, "isEqualToString:", CFSTR("editableText")) & 1) != 0
    || (objc_msgSend(v23, "isEqualToString:", CFSTR("numberPicker")) & 1) != 0
    || (objc_msgSend(v23, "isEqualToString:", CFSTR("switch")) & 1) != 0)
  {
    goto LABEL_19;
  }
  if (!objc_msgSend(v23, "isEqualToString:", CFSTR("label")))
  {
    if ((objc_msgSend(v23, "isEqualToString:", CFSTR("htmlLabel")) & 1) != 0)
      goto LABEL_19;
    goto LABEL_17;
  }
  -[RUIElement attributes](self, "attributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("radioGroup"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

    goto LABEL_19;
  }
  v19 = (void *)v18;
  v20 = objc_msgSend(v23, "isEqualToString:", CFSTR("htmlLabel"));

  if ((v20 & 1) == 0)
LABEL_17:
    v10 = 3;
LABEL_19:
  -[RUITableViewRow _cellSelectionStyleNumber](self, "_cellSelectionStyleNumber");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
    v10 = objc_msgSend(v21, "integerValue");
  -[RemoteUITableViewCell setSelectionStyle:](self->_tableCell, "setSelectionStyle:", v10);

}

- (id)_cellSelectionStyleNumber
{
  void *v2;
  void *v3;
  void *v4;

  -[RUIElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("selectionStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(&unk_24C2B1EF0, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAlignment:(int64_t)a3
{
  void *v4;
  id v5;

  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextAlignment:", -[RUITableViewRow alignment](self, "alignment"));

    if (-[RUITableViewRow tableCellStyle](self, "tableCellStyle") == 3)
    {
      -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTextAlignment:", -[RUITableViewRow alignment](self, "alignment"));

    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RUITableViewRow;
  -[RUIElement setEnabled:](&v4, sel_setEnabled_, a3);
  if (self->_tableCell)
    -[RUITableViewRow _updateContentForDisabledState](self, "_updateContentForDisabledState");
}

- (void)setRowInvalid:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_rowInvalid = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[RemoteUITableViewCell setRowInvalid:](self->_tableCell, "setRowInvalid:", v3);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  id v40;

  if (self->_selected != a3)
  {
    v3 = a3;
    self->_selected = a3;
    if (a3)
      v5 = 3;
    else
      v5 = 0;
    -[RUITableViewRow tableCell](self, "tableCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[RUIElement attributes](self, "attributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("radioGroupSelectedColor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[RUITableViewRow tableCell](self, "tableCell");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
      {
        -[RUITableViewRow radioGroupSelectedColor](self, "radioGroupSelectedColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_setRemoteUIAccessoryType:withColor:", v5, v12);

      }
      else
      {
        objc_msgSend(v10, "setRemoteUIAccessoryType:", v5);
      }
    }
    else
    {
      -[RUITableViewRow tableCell](self, "tableCell");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAccessoryType:", v5);
    }

    if (v3)
      -[RUITableViewRow radioGroupSelectedColor](self, "radioGroupSelectedColor");
    else
      -[RUITableViewRow textColorForAttributeName:defaultColorString:](self, "textColorForAttributeName:defaultColorString:", CFSTR("labelColor"), CFSTR("labelColor"));
    v40 = (id)objc_claimAutoreleasedReturnValue();
    -[RUITableViewRow tableCell](self, "tableCell");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ruiTextLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v40);

    -[RUIElement attributes](self, "attributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("radioGroupSelectedColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[RUITableViewRow tableCell](self, "tableCell");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ruiDetailTextLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTextColor:", v40);

    }
    -[RUIElement attributes](self, "attributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("accessory"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "length") && objc_msgSend(v20, "isEqualToString:", CFSTR("checkmark.circle")))
    {
      -[RUITableViewRow tableCell](self, "tableCell");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v22 = objc_opt_isKindOfClass();

      if ((v22 & 1) != 0)
      {
        -[RUITableViewRow tableCell](self, "tableCell");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setRemoteUIAccessoryType:", 0);

      }
      -[RUITableViewRow _checkmarkAccessoryViewWithSelected:](self, "_checkmarkAccessoryViewWithSelected:", v3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[RemoteUITableViewCell setRemoteUIAccessoryView:](self->_tableCell, "setRemoteUIAccessoryView:", v24);

    }
    -[RUIElement attributes](self, "attributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("borderColor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      if (v3)
        objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v26);
      else
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[RemoteUITableViewCell layer](self->_tableCell, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setCornerRadius:", 8.0);

      -[RemoteUITableViewCell layer](self->_tableCell, "layer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setMasksToBounds:", 1);

      -[RemoteUITableViewCell layer](self->_tableCell, "layer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_retainAutorelease(v27);
      objc_msgSend(v30, "setBorderColor:", objc_msgSend(v31, "CGColor"));

      -[RemoteUITableViewCell layer](self->_tableCell, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setBorderWidth:", 3.0);

      -[RemoteUITableViewCell layer](self->_tableCell, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setShadowOffset:", 2.0, 3.0);

      objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v35 = objc_msgSend(v34, "CGColor");
      -[RemoteUITableViewCell layer](self->_tableCell, "layer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setShadowColor:", v35);

      -[RemoteUITableViewCell layer](self->_tableCell, "layer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v38) = 1050253722;
      objc_msgSend(v37, "setShadowOpacity:", v38);

      -[RemoteUITableViewCell layer](self->_tableCell, "layer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setShadowRadius:", 8.0);

    }
    -[RUITableViewRow _drawCustomImage:](self, "_drawCustomImage:", v3);

  }
}

- (void)setFocused:(BOOL)a3
{
  if (self->_focused != a3)
  {
    self->_focused = a3;
    -[RUITableViewRow _updateTextColors](self, "_updateTextColors");
  }
}

- (RUITableView)tableView
{
  void *v2;
  void *v3;

  -[RUITableViewRow section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RUITableView *)v3;
}

- (BOOL)wantsInlineActivityIndicator
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  if (!-[RUITableViewRow rowSupportsLoadingIndicator](self, "rowSupportsLoadingIndicator"))
    return 0;
  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("shouldShowLoadingIndicator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[RUITableViewRow tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "page");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityIndicatorStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "isEqualToString:", CFSTR("activeElement"));

  }
  return v5;
}

- (void)setShowingProgressIndicator:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_showingProgressIndicator != a3)
  {
    v3 = a3;
    self->_showingProgressIndicator = a3;
    -[RUITableViewRow tableCell](self, "tableCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[RUITableViewRow tableCell](self, "tableCell");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setActivityIndicatorVisible:", self->_showingProgressIndicator);

      -[RUIElement pageElement](self, "pageElement");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "page");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUserInteractionEnabled:", !v3);

    }
  }
}

- (Class)tableCellClass
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_msgSend(WeakRetained, "tableCellClassForTableViewRow:", self);

  if (!v4)
  {
    -[RUIElement attributes](self, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("detailLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[RUIElement attributes](self, "attributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subLabel"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 != 0;

    }
    else
    {
      v10 = 0;
    }

    -[RUITableViewRow htmlSubLabelData](self, "htmlSubLabelData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    -[RUIElement attributes](self, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("subLabelNumberOfLines"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 || v12 || v10)
    {
      -[RUIElement style](self, "style");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[RUIStyle osloStyle](RUIStyle, "osloStyle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_opt_isKindOfClass();

    }
    else
    {
      -[RUIElement attributes](self, "attributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("class"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("linkedOption")))
      {

      }
      else
      {
        -[RUIElement attributes](self, "attributes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("class"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("selectPage"));

        if (!v21)
        {
          -[RUIElement attributes](self, "attributes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", CFSTR("detailLinkURL"));
          v24 = objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = (void *)v24;
            -[RUIElement attributes](self, "attributes");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKey:", CFSTR("customDetailLink"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("true"));

            if (v28)
              goto LABEL_14;
          }
          else
          {

          }
          -[RUIElement attributes](self, "attributes");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKey:", CFSTR("reducedImagePaddings"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "isEqualToString:", CFSTR("true"));

        }
      }
    }
LABEL_14:
    objc_opt_class();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    return (Class)v5;
  }
  v5 = v4;
  return (Class)v5;
}

- (int64_t)tableCellStyle
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v15;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("class"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("editableText")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("numberPicker")) & 1) == 0)
  {
    -[RUIElement attributes](self, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("subLabel"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[RUIElement attributes](self, "attributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("detailLabel"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v5 = 3;
        goto LABEL_15;
      }
    }
    else
    {

    }
    -[RUIElement attributes](self, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("detailLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      -[RUIElement attributes](self, "attributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("placeholder"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13
        && (objc_msgSend(v4, "isEqualToString:", CFSTR("datePicker")) & 1) == 0
        && (objc_msgSend(v4, "isEqualToString:", CFSTR("select")) & 1) == 0)
      {
        v15 = objc_msgSend(v4, "isEqualToString:", CFSTR("selectPage"));

        if ((v15 & 1) == 0)
        {
          v5 = 0;
          goto LABEL_15;
        }
        goto LABEL_14;
      }

    }
LABEL_14:
    v5 = 1;
    goto LABEL_15;
  }
  v5 = 1000;
LABEL_15:

  return v5;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v4 = a3;
  -[RUIElement attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("imageTintColor"));
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell ruiImageView](self->_tableCell, "ruiImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v6);

  }
  else
  {
    v6 = 0;
  }
  -[RUIElement attributes](self, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("imagePadding"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  -[RemoteUITableViewCell setImage:padding:tintColor:](self->_tableCell, "setImage:padding:tintColor:", v4, v6, (double)v10, (double)v10, (double)v10, (double)v10);
  -[RUIElement attributes](self, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("imageBackgroundColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell ruiImageView](self->_tableCell, "ruiImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

  }
  -[RUIElement attributes](self, "attributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("imageCornerRadius"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  -[UITableViewCell ruiImageView](self->_tableCell, "ruiImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setCornerRadius:", (double)v17);

  -[RemoteUITableViewCell setNeedsLayout](self->_tableCell, "setNeedsLayout");
}

- (void)setImageSize:(CGSize)a3
{
  -[RemoteUITableViewCell setImageSize:](self->_tableCell, "setImageSize:", a3.width, a3.height);
}

- (UIControl)control
{
  void *v3;
  void *v4;
  UISwitch *v5;
  UISwitch *v6;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("class"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("switch")))
  {
    v5 = self->_switchControl;
  }
  else if (objc_msgSend(v4, "isEqual:", CFSTR("datePicker")))
  {
    -[RUITableViewRow pickerView](self, "pickerView");
    v5 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("editableText")) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", CFSTR("numberPicker")))
    {
      v6 = 0;
      goto LABEL_9;
    }
    -[UITableViewCell ruiEditableTextField](self->_tableCell, "ruiEditableTextField");
    v5 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_9:

  return (UIControl *)v6;
}

- (void)accessoryImageLoaded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  RemoteUITableViewCell *tableCell;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  double v13;

  v13 = -1.0;
  -[RUIElement URLAttributeForImageName:getScale:](self, "URLAttributeForImageName:getScale:", CFSTR("accessoryImage"), &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[RUIImageLoader sharedImageLoader](RUIImageLoader, "sharedImageLoader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "imageForURL:loadIfAbsent:", v3, 0);
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v5, 0, v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      tableCell = self->_tableCell;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v6);
      -[RemoteUITableViewCell setAccessoryView:](tableCell, "setAccessoryView:", v8);

    }
    objc_msgSend(v4, "notificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = RUIImageLoaderDidLoadImageNotification;
    objc_msgSend(v3, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, v12, 0);

  }
}

- (BOOL)loadAccessoryImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  RemoteUITableViewCell *tableCell;
  void *v18;
  __CFString *v19;
  void *v20;
  double v22;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessorySystemImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RUIElement attributes](self, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("accessorySymbolRenderingMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement systemImageNamed:symbolRenderingMode:](self, "systemImageNamed:symbolRenderingMode:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v7);
    -[RUIElement attributes](self, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("accessoryTintColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTintColor:", v11);

    }
    -[RemoteUITableViewCell setAccessoryView:](self->_tableCell, "setAccessoryView:", v8);

    v12 = 1;
  }
  else
  {
    v22 = -1.0;
    -[RUIElement URLAttributeForImageName:getScale:](self, "URLAttributeForImageName:getScale:", CFSTR("accessoryImage"), &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13 != 0;
    if (v13)
    {
      +[RUIImageLoader sharedImageLoader](RUIImageLoader, "sharedImageLoader");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "imageForURL:loadIfAbsent:", v13, 1);
      if (v15)
      {
        objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v15, 0, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        tableCell = self->_tableCell;
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v16);
        -[RemoteUITableViewCell setAccessoryView:](tableCell, "setAccessoryView:", v18);
      }
      else
      {
        objc_msgSend(v14, "notificationCenter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = RUIImageLoaderDidLoadImageNotification;
        objc_msgSend(v13, "absoluteString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_accessoryImageLoaded, v20, 0);

      }
    }

  }
  return v12;
}

- (id)tableCell
{
  void *v3;
  RemoteUITableViewCell *v4;
  RemoteUITableViewCell *tableCell;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  id v24;
  UISwitch *v25;
  UISwitch *switchControl;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t (*v34)(void);
  void *v35;
  void *v36;
  void *v37;
  RemoteUITableViewCell *v38;
  NSData *data;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  RemoteUITableViewCell *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  RemoteUITableViewCell *v75;
  float v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  RemoteUITableViewCell *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  BOOL v103;
  void *v104;
  void *v105;
  RemoteUITableViewCell *v106;
  void *v107;
  void *v108;
  int v109;
  void *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  void *v114;
  void *v115;
  _BOOL4 v116;
  void *v117;
  void *v118;
  _BOOL4 v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v132;
  void *v133;
  _QWORD v134[4];
  id v135;
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  void *v139;
  __int128 buf;
  void *(*v141)(uint64_t);
  void *v142;
  uint64_t *v143;
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  if (self->_tableCell)
    goto LABEL_154;
  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("class"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (RemoteUITableViewCell *)objc_msgSend(objc_alloc(-[RUITableViewRow tableCellClass](self, "tableCellClass")), "initWithStyle:reuseIdentifier:", -[RUITableViewRow tableCellStyle](self, "tableCellStyle"), 0);
  tableCell = self->_tableCell;
  self->_tableCell = v4;

  -[RUITableViewRow setBadgeInTableCell:](self, "setBadgeInTableCell:", self->_tableCell);
  v6 = v133;
  if ((objc_msgSend(v133, "isEqualToString:", CFSTR("editableText")) & 1) != 0
    || objc_msgSend(v133, "isEqualToString:", CFSTR("numberPicker")))
  {
    -[UITableViewCell ruiEditableTextField](self->_tableCell, "ruiEditableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement attributes](self, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("placeholder"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlaceholder:", v9);

    -[RUIElement attributes](self, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[RUIElement attributes](self, "attributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("clientValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "isEqualToString:", CFSTR("phoneNumber"))
        && (objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "userInterfaceIdiom"),
            v14,
            !v15))
      {
        v136 = 0;
        v137 = &v136;
        v138 = 0x2020000000;
        v34 = (uint64_t (*)(void))getCTSettingCopyMyPhoneNumberSymbolLoc_ptr;
        v139 = getCTSettingCopyMyPhoneNumberSymbolLoc_ptr;
        if (!getCTSettingCopyMyPhoneNumberSymbolLoc_ptr)
        {
          *(_QWORD *)&buf = MEMORY[0x24BDAC760];
          *((_QWORD *)&buf + 1) = 3221225472;
          v141 = __getCTSettingCopyMyPhoneNumberSymbolLoc_block_invoke;
          v142 = &unk_24C297758;
          v143 = &v136;
          __getCTSettingCopyMyPhoneNumberSymbolLoc_block_invoke((uint64_t)&buf);
          v34 = (uint64_t (*)(void))v137[3];
        }
        _Block_object_dispose(&v136, 8);
        if (!v34)
          -[RUITableViewRow tableCell].cold.1();
        v11 = (void *)v34();
      }
      else
      {
        v11 = 0;
      }

    }
    -[RUITableViewRow setEditableTextFieldValue:](self, "setEditableTextFieldValue:", v11);
    -[RemoteUITableViewCell editableTextField](self->_tableCell, "editableTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v16, "addTarget:action:forEvents:", WeakRetained, sel_textFieldStartedEditing_, 0x10000);

    -[RemoteUITableViewCell editableTextField](self->_tableCell, "editableTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel_textFieldEditingDidEnd_, 0x40000);

    -[UITableViewCell ruiEditableTextField](self->_tableCell, "ruiEditableTextField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", self);
    -[RUIElement attributes](self, "attributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("keyboardType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "isEqualToString:", CFSTR("email")))
    {
      objc_msgSend(v19, "setKeyboardType:", 7);
    }
    else
    {
      if (!objc_msgSend(v21, "isEqualToString:", CFSTR("url")))
      {
        if (objc_msgSend(v21, "isEqualToString:", CFSTR("asciiCapable")))
        {
          objc_msgSend(v19, "setKeyboardType:", 1);
        }
        else if (objc_msgSend(v21, "isEqualToString:", CFSTR("numbersAndPunctuation")))
        {
          objc_msgSend(v19, "setKeyboardType:", 2);
          -[RUITableViewRow _addDoneButtonToTextField:](self, "_addDoneButtonToTextField:", v19);
        }
        else if (objc_msgSend(v21, "isEqualToString:", CFSTR("numberPad")))
        {
          objc_msgSend(v19, "setKeyboardType:", 4);
          -[RUITableViewRow _addDoneButtonToTextField:](self, "_addDoneButtonToTextField:", v19);
        }
        else if (objc_msgSend(v21, "isEqualToString:", CFSTR("phonePad")))
        {
          objc_msgSend(v19, "setKeyboardType:", 5);
          -[RUITableViewRow _addDoneButtonToTextField:](self, "_addDoneButtonToTextField:", v19);
        }
        else if (objc_msgSend(v21, "isEqualToString:", CFSTR("namePhonePad")))
        {
          objc_msgSend(v19, "setKeyboardType:", 6);
        }
        else if (objc_msgSend(v21, "isEqualToString:", CFSTR("decimalPad")))
        {
          objc_msgSend(v19, "setKeyboardType:", 8);
          -[RUITableViewRow _addDoneButtonToTextField:](self, "_addDoneButtonToTextField:", v19);
        }
        v22 = 0;
LABEL_62:
        -[RUIElement attributes](self, "attributes");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKey:", CFSTR("autocapitalizationType"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v46, "isEqualToString:", CFSTR("none")) & 1) != 0)
        {
          v47 = 0;
        }
        else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("words")) & 1) != 0)
        {
          v47 = 1;
        }
        else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("sentences")) & 1) != 0)
        {
          v47 = 2;
        }
        else
        {
          if (!objc_msgSend(v46, "isEqualToString:", CFSTR("allCharacters")))
            goto LABEL_71;
          v47 = 3;
        }
        objc_msgSend(v19, "setAutocapitalizationType:", v47);
LABEL_71:
        -[RUIElement attributes](self, "attributes");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKey:", CFSTR("secure"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "BOOLValue");

        if (v50)
        {
          objc_msgSend(v19, "setSecureTextEntry:", 1);
        }
        else if (!v22)
        {
LABEL_75:
          -[RUIElement attributes](self, "attributes");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectForKey:", CFSTR("disableAutocorrection"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "BOOLValue");

          if (v53)
          {
            objc_msgSend(v19, "setAutocorrectionType:", 1);
            objc_msgSend(v19, "setShortcutConversionType:", 1);
          }
          -[RUIElement attributes](self, "attributes");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKey:", CFSTR("disableAutocapitalization"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (v55)
          {
            NSLog(CFSTR("Warning : RemoteUI markup is specifying a deprecated 'disableAutocapitalization' property."));
            if (objc_msgSend(v55, "BOOLValue"))
              objc_msgSend(v19, "setAutocapitalizationType:", 0);
          }
          -[RUIElement attributes](self, "attributes");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKey:", CFSTR("suffix"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v57, "length"))
          {
            -[RUITableViewRow textColorForAttributeName:](self, "textColorForAttributeName:", CFSTR("suffixColor"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "_setSuffix:withColor:", v57, v58);

          }
          -[UITableViewCell ruiEditableTextField](self->_tableCell, "ruiEditableTextField");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[RUITableViewRow textColorForAttributeName:](self, "textColorForAttributeName:", CFSTR("textColor"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setTextColor:", v60);

          goto LABEL_83;
        }
        objc_msgSend(v19, "setAutocapitalizationType:", 0);
        objc_msgSend(v19, "setAutocorrectionType:", 1);
        goto LABEL_75;
      }
      objc_msgSend(v19, "setKeyboardType:", 3);
    }
    v22 = 1;
    goto LABEL_62;
  }
  if (objc_msgSend(v133, "isEqualToString:", CFSTR("switch")))
  {
    if (+[RUIPlatform isAppleTV](RUIPlatform, "isAppleTV"))
    {
      if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_209E87000, v23, OS_LOG_TYPE_DEFAULT, "AppleTV does not support switchRow", (uint8_t *)&buf, 2u);
        }

      }
    }
    else if (!self->_switchControl)
    {
      v24 = objc_alloc(MEMORY[0x24BEBD9B8]);
      v25 = (UISwitch *)objc_msgSend(v24, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      switchControl = self->_switchControl;
      self->_switchControl = v25;

      -[UISwitch addTarget:action:forControlEvents:](self->_switchControl, "addTarget:action:forControlEvents:", self, sel__switchFlipped_, 4096);
    }
    -[RemoteUITableViewCell setRemoteUIAccessoryView:](self->_tableCell, "setRemoteUIAccessoryView:", self->_switchControl);
    -[RUIElement attributes](self, "attributes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKey:", CFSTR("on"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "BOOLValue"))
    {

    }
    else
    {
      -[RUIElement attributes](self, "attributes");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKey:", CFSTR("value"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "BOOLValue");

      if (!v33)
      {
LABEL_34:
        self->_switchValue = -[UISwitch isOn](self->_switchControl, "isOn");
        goto LABEL_83;
      }
    }
    -[UISwitch setOn:](self->_switchControl, "setOn:", 1);
    goto LABEL_34;
  }
  if (objc_msgSend(v133, "isEqualToString:", CFSTR("datePicker")))
  {
    -[RUITableViewRow setupDatePickerWithCell:](self, "setupDatePickerWithCell:", self->_tableCell);
    goto LABEL_83;
  }
  if (objc_msgSend(v133, "isEqualToString:", CFSTR("select")))
  {
    -[RUIElement attributes](self, "attributes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", CFSTR("value"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUITableViewRow setSelectRowValue:](self, "setSelectRowValue:", v30);

LABEL_52:
    goto LABEL_83;
  }
  if (objc_msgSend(v133, "hasPrefix:", CFSTR("html")) && -[NSData length](self->_data, "length"))
  {
    if ((objc_msgSend(v133, "isEqualToString:", CFSTR("htmlLabel")) & 1) == 0)
    {
      -[RemoteUITableViewCell webContainerView](self->_tableCell, "webContainerView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "webView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setUserInteractionEnabled:", 0);

      v6 = v133;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("htmlLink")))
    {
      -[RemoteUITableViewCell contentView](self->_tableCell, "contentView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setUserInteractionEnabled:", 0);

    }
    v38 = self->_tableCell;
    data = self->_data;
    -[RUIElement sourceURL](self, "sourceURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUITableViewCell setHTMLData:sourceURL:delegate:](v38, "setHTMLData:sourceURL:delegate:", data, v29, self);
    goto LABEL_52;
  }
  if (objc_msgSend(v133, "isEqualToString:", CFSTR("linkedOption")))
  {
    -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setLineBreakMode:", 0);
    objc_msgSend(v29, "setNumberOfLines:", 0);
    goto LABEL_52;
  }
  if (objc_msgSend(v133, "isEqualToString:", CFSTR("selectPage")))
  {
    -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setLineBreakMode:", 0);
    objc_msgSend(v40, "setNumberOfLines:", 0);
    -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setLineBreakMode:", 0);
    objc_msgSend(v41, "setNumberOfLines:", 0);
    -[RUIElement attributes](self, "attributes");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("align"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      v44 = self->_tableCell;
      -[RemoteUITableViewCell setDetailTextAlignment:](v44, "setDetailTextAlignment:", +[RUIParser textAlignmentForString:](RUIParser, "textAlignmentForString:", v43));

    }
    -[RUITableViewRow setDetailAndPlaceholderText](self, "setDetailAndPlaceholderText");

  }
LABEL_83:
  -[RUIElement attributes](self, "attributes");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectForKey:", CFSTR("label"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v132, "length"))
  {
    -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setText:", v132);

    -[RUIElement attributes](self, "attributes");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("labelNumberOfLines"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      v65 = objc_msgSend(v64, "integerValue");
      -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setNumberOfLines:", v65);

    }
    -[RUIElement attributes](self, "attributes");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("labelTextStyle"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement textStyleWithString:](self, "textStyleWithString:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setFont:", v70);

      -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setAdjustsFontForContentSizeCategory:", 1);

    }
  }
  -[RUIElement attributes](self, "attributes");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "objectForKey:", CFSTR("indentation"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v74, "length"))
  {
    -[RemoteUITableViewCell setIndentationLevel:](self->_tableCell, "setIndentationLevel:", 1);
    v75 = self->_tableCell;
    objc_msgSend(v74, "floatValue");
    -[RemoteUITableViewCell setIndentationWidth:](v75, "setIndentationWidth:", v76);
  }
  -[RemoteUITableViewCell textLabel](self->_tableCell, "textLabel");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setTextAlignment:", -[RUITableViewRow alignment](self, "alignment"));

  if (-[RUITableViewRow alignment](self, "alignment") && -[RUITableViewRow tableCellStyle](self, "tableCellStyle") == 3)
  {
    -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setTextAlignment:", -[RUITableViewRow alignment](self, "alignment"));

  }
  -[RUIElement attributes](self, "attributes");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "objectForKey:", CFSTR("subLabel"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v80, "length"))
  {

  }
  else
  {
    -[RUITableViewRow htmlSubLabelData](self, "htmlSubLabelData");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "length");

    if (!v82)
      goto LABEL_116;
  }
  -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell ruiValueLabel](self->_tableCell, "ruiValueLabel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIElement attributes](self, "attributes");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "objectForKey:", CFSTR("subLabel"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "objectForKey:", CFSTR("detailLabel"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = self->_tableCell;
  -[RUITableViewRow htmlSubLabelData](self, "htmlSubLabelData");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIElement sourceURL](self, "sourceURL");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[RemoteUITableViewCell setHTMLSubLabelData:sourceURL:delegate:](v89, "setHTMLSubLabelData:sourceURL:delegate:", v90, v91, self);

  if (objc_msgSend(v86, "length"))
  {
    objc_msgSend(v83, "setText:", v86);
    -[RUIElement attributes](self, "attributes");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("subLabelNumberOfLines"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v93)
      objc_msgSend(v83, "setNumberOfLines:", objc_msgSend(v93, "integerValue"));
    -[RUIElement attributes](self, "attributes");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("subLabelTextStyle"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement textStyleWithString:](self, "textStyleWithString:", v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    if (v96)
    {
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setFont:", v97);

      objc_msgSend(v83, "setAdjustsFontForContentSizeCategory:", 1);
    }

  }
  if (objc_msgSend(v88, "length"))
  {
    objc_msgSend(v84, "setText:", v88);
    -[RUITableViewRow textColorForAttributeName:](self, "textColorForAttributeName:", CFSTR("detailLabelColor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setTextColor:", v98);

  }
  -[RUIElement style](self, "style");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  +[RUIStyle osloStyle](RUIStyle, "osloStyle");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RUIElement attributes](self, "attributes");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("detailLabel"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v102 == 0;

    if (!v103)
    {
      if (objc_msgSend(v88, "length"))
      {
        -[RUIElement attributes](self, "attributes");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "objectForKey:", CFSTR("detailLinkURL"));
        v105 = (void *)objc_claimAutoreleasedReturnValue();

        if (v105)
        {
          objc_initWeak((id *)&buf, self);
          v106 = self->_tableCell;
          v134[0] = MEMORY[0x24BDAC760];
          v134[1] = 3221225472;
          v134[2] = __28__RUITableViewRow_tableCell__block_invoke;
          v134[3] = &unk_24C298630;
          objc_copyWeak(&v135, (id *)&buf);
          -[RemoteUITableViewCell setDetailLinkText:handler:](v106, "setDetailLinkText:handler:", v88, v134);
          objc_destroyWeak(&v135);
          objc_destroyWeak((id *)&buf);
        }
        else
        {
          objc_msgSend(v83, "setText:", v88);
        }

      }
      if (objc_msgSend(v86, "length"))
        objc_msgSend(v84, "setText:", v86);
    }
  }
  else
  {

  }
LABEL_116:
  -[RUITableViewRow _updateDetailLabel](self, "_updateDetailLabel");
  -[RUIElement attributes](self, "attributes");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "objectForKey:", CFSTR("invalid"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v108, "BOOLValue");

  if (v109)
  {
    self->_rowInvalid = 1;
  }
  else if (!self->_rowInvalid)
  {
    goto LABEL_120;
  }
  -[RemoteUITableViewCell setRowInvalid:](self->_tableCell, "setRowInvalid:", 1);
LABEL_120:
  -[RUIElement attributes](self, "attributes");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "objectForKey:", CFSTR("accessory"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUITableViewRow detailButton](self, "detailButton");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v112)
  {
    if ((objc_msgSend(v111, "isEqualToString:", CFSTR("disclosure")) & 1) != 0
      || objc_msgSend(v133, "isEqualToString:", CFSTR("selectPage")))
    {
      -[RemoteUITableViewCell setRemoteUIAccessoryType:](self->_tableCell, "setRemoteUIAccessoryType:", 1);
    }
    else if (objc_msgSend(v111, "isEqualToString:", CFSTR("detailDisclosure")))
    {
      -[RemoteUITableViewCell setRemoteUIAccessoryType:](self->_tableCell, "setRemoteUIAccessoryType:", 2);
    }
    else if (objc_msgSend(v111, "isEqualToString:", CFSTR("checkmark")))
    {
      -[RemoteUITableViewCell setRemoteUIAccessoryType:](self->_tableCell, "setRemoteUIAccessoryType:", 3);
    }
    else if (objc_msgSend(v111, "isEqualToString:", CFSTR("none")))
    {
      -[RemoteUITableViewCell setRemoteUIAccessoryType:](self->_tableCell, "setRemoteUIAccessoryType:", 0);
    }
    else if (objc_msgSend(v111, "isEqualToString:", CFSTR("spinner")))
    {
      -[RemoteUITableViewCell setActivityIndicatorVisible:](self->_tableCell, "setActivityIndicatorVisible:", 1);
    }
    goto LABEL_137;
  }
  if (objc_msgSend(v111, "length") && _isInternalInstall())
  {
    _RUILoggingFacility();
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v133;
      _os_log_impl(&dword_209E87000, v113, OS_LOG_TYPE_DEFAULT, "%@ has a detail button and an accessory. Ignoring accessory.", (uint8_t *)&buf, 0xCu);
    }

  }
  -[RUITableViewRow detailButton](self, "detailButton");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v114, "visibility") == 1)
  {

  }
  else
  {
    -[RUITableViewRow detailButton](self, "detailButton");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v115, "visibility") == 0;

    if (!v116)
      goto LABEL_133;
  }
  -[RemoteUITableViewCell setEditingAccessoryType:](self->_tableCell, "setEditingAccessoryType:", 4);
LABEL_133:
  -[RUITableViewRow detailButton](self, "detailButton");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v117, "visibility") == 2)
  {

LABEL_136:
    -[RemoteUITableViewCell setAccessoryType:](self->_tableCell, "setAccessoryType:", 4);
    goto LABEL_137;
  }
  -[RUITableViewRow detailButton](self, "detailButton");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v118, "visibility") == 0;

  if (v119)
    goto LABEL_136;
LABEL_137:
  if (-[RUITableViewRow isSelected](self, "isSelected"))
  {
    -[RemoteUITableViewCell setRemoteUIAccessoryType:](self->_tableCell, "setRemoteUIAccessoryType:", 3);
    -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement style](self, "style");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "radioGroupSelectedColor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "setTextColor:", v122);

  }
  if (objc_msgSend(v111, "isEqualToString:", CFSTR("checkmark.circle")))
  {
    -[RemoteUITableViewCell setRemoteUIAccessoryType:](self->_tableCell, "setRemoteUIAccessoryType:", 0);
    -[RUITableViewRow _checkmarkAccessoryViewWithSelected:](self, "_checkmarkAccessoryViewWithSelected:", -[RUITableViewRow isSelected](self, "isSelected"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUITableViewCell setRemoteUIAccessoryView:](self->_tableCell, "setRemoteUIAccessoryView:", v123);

  }
  if (-[RUIElement loadImage](self, "loadImage"))
    -[RemoteUITableViewCell setClipsContents:](self->_tableCell, "setClipsContents:", 1);
  -[RUITableViewRow loadAccessoryImage](self, "loadAccessoryImage");
  -[RUIElement attributes](self, "attributes");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "objectForKey:", CFSTR("firstResponder"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v125, "BOOLValue"))
  {
    if ((objc_msgSend(v133, "isEqualToString:", CFSTR("editableText")) & 1) != 0
      || (objc_msgSend(v133, "isEqualToString:", CFSTR("numberPicker")) & 1) != 0
      || (objc_msgSend(v133, "isEqualToString:", CFSTR("select")) & 1) != 0
      || objc_msgSend(v133, "isEqualToString:", CFSTR("datePicker")))
    {
      v126 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v126, "rowIsFirstResponder:", self);

    }
    else
    {
      NSLog(CFSTR("Warning: firstResponder not supported on row type %@"), v133);
    }
  }
  -[RUIElement attributes](self, "attributes");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "objectForKey:", CFSTR("forceFullSizeDetailLabel"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v128, "BOOLValue"))
    -[RemoteUITableViewCell setForceFullSizeDetailLabel:](self->_tableCell, "setForceFullSizeDetailLabel:", 1);
  -[RUIElement attributes](self, "attributes");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "objectForKey:", CFSTR("leftAlignDetailLabel"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v130, "BOOLValue"))
    -[RemoteUITableViewCell setLeftAlignDetailLabel:](self->_tableCell, "setLeftAlignDetailLabel:", 1);
  -[RUITableViewRow _updateContentForDisabledState](self, "_updateContentForDisabledState");

LABEL_154:
  -[RUITableViewRow setSelectedRowTextColor](self, "setSelectedRowTextColor");
  -[RUITableViewRow _drawCustomImage:](self, "_drawCustomImage:", -[RUITableViewRow isSelected](self, "isSelected"));
  -[RUITableViewRow _setBackgroundColor](self, "_setBackgroundColor");
  -[RUITableViewRow _updateDetailLabel](self, "_updateDetailLabel");
  return self->_tableCell;
}

void __28__RUITableViewRow_tableCell__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "detailLabelActivatedLinkFromCell:completion:", v6, v5);

}

- (void)_updateDetailLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  RemoteUITableViewCell *tableCell;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("class"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("link")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("label")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("button")))
  {
    -[RUIElement attributes](self, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("detailLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[RUIElement attributes](self, "attributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("detailLabel"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[RUIElement attributes](self, "attributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("alternateDetailLabel"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[RUITableViewRow showAlternateDetailLabel](self, "showAlternateDetailLabel") && objc_msgSend(v10, "length"))
      {
        v11 = v10;

        v8 = v11;
      }
      if (objc_msgSend(v8, "length"))
      {
        -[RUIElement attributes](self, "attributes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("detailLinkURL"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_initWeak(&location, self);
          tableCell = self->_tableCell;
          v16[0] = MEMORY[0x24BDAC760];
          v16[1] = 3221225472;
          v16[2] = __37__RUITableViewRow__updateDetailLabel__block_invoke;
          v16[3] = &unk_24C298630;
          objc_copyWeak(&v17, &location);
          -[RemoteUITableViewCell setDetailLinkText:handler:](tableCell, "setDetailLinkText:handler:", v8, v16);
          objc_destroyWeak(&v17);
          objc_destroyWeak(&location);
        }
        else
        {
          -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setText:", v8);

        }
      }

    }
  }

}

void __37__RUITableViewRow__updateDetailLabel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "detailLabelActivatedLinkFromCell:completion:", v6, v5);

}

- (id)newConfiguredDatePicker
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[RUITableViewRow dateFormatterCalendarIdentifier](self, "dateFormatterCalendarIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", v3);
  else
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  v6 = objc_alloc(MEMORY[0x24BEBD520]);
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v7, "setCalendar:", v4);
  +[RUITableViewRow _formatterForDateYMD](RUITableViewRow, "_formatterForDateYMD");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v9);

  objc_msgSend(v7, "setAutoresizingMask:", 10);
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__datePickerChanged_, 4096);
  objc_msgSend(v7, "setDatePickerMode:", -[RUITableViewRow datePickerMode](self, "datePickerMode"));
  -[RUITableViewRow date](self, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[RUITableViewRow _timeZoneAdjustedDateFromDate:](RUITableViewRow, "_timeZoneAdjustedDateFromDate:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "components:fromDate:", 30, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHour:", 0);
  objc_msgSend(v13, "setMinute:", 0);
  objc_msgSend(v13, "setSecond:", 0);
  objc_msgSend(v7, "calendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateFromComponents:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUITableViewRow dateMin](self, "dateMin");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMinimumDate:", v16);

  -[RUITableViewRow dateMax](self, "dateMax");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaximumDate:", v17);

  objc_msgSend(v7, "setDate:animated:", v15, 0);
  return v7;
}

- (void)setupDatePickerWithCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[RUIElement attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("minValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("maxValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    +[RUITableViewRow _formatterForDateYMD](RUITableViewRow, "_formatterForDateYMD");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFromString:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[RUITableViewRow _timeZoneAdjustedDateFromDate:](RUITableViewRow, "_timeZoneAdjustedDateFromDate:", v10);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUITableViewRow setDate:](self, "setDate:", v11);

  if (objc_msgSend(v7, "length"))
  {
    +[RUITableViewRow _formatterForDateYMD](RUITableViewRow, "_formatterForDateYMD");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateFromString:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUITableViewRow setDateMin:](self, "setDateMin:", v13);

  }
  if (objc_msgSend(v9, "length"))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("today")))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUITableViewRow setDateMax:](self, "setDateMax:", v14);
    }
    else
    {
      +[RUITableViewRow _formatterForDateYMD](RUITableViewRow, "_formatterForDateYMD");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dateFromString:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUITableViewRow setDateMax:](self, "setDateMax:", v15);

    }
  }
  if (-[RUITableViewRow datePickerStyle](self, "datePickerStyle") == 2)
  {
    objc_msgSend(v21, "ruiDetailTextLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 1);

    v17 = -[RUITableViewRow newConfiguredDatePicker](self, "newConfiguredDatePicker");
    objc_msgSend(v17, "setUserInteractionEnabled:", 0);
    -[RUITableViewRow setPickerView:](self, "setPickerView:", v17);
    objc_msgSend(v21, "setRemoteUIAccessoryView:", v17);
  }
  else
  {
    -[RUIElement attributes](self, "attributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("placeholder"));
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v19 = v17;
    if (!v17)
    {
      -[RUITableViewRow _datePickerFormatter](self, "_datePickerFormatter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringFromDate:", self->_date);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "ruiDetailTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

    if (!v17)
    {

    }
  }

}

- (void)activateDatePicker
{
  void *v3;
  char isKindOfClass;
  unint64_t v5;
  id v6;

  -[RUITableViewRow pickerView](self, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[RUITableViewRow pickerView](self, "pickerView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "datePickerMode");
    if (v5 <= 3)
      objc_msgSend(v6, "_compactStyleSetActiveComponent:", qword_209F76028[v5]);

  }
}

- (void)_addDoneButtonToTextField:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BEBDA90];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonTapped);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v10[0] = v8;
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v9);

  objc_msgSend(v6, "sizeToFit");
  objc_msgSend(v5, "setInputAccessoryView:", v6);

}

- (void)_doneButtonTapped
{
  id v2;

  -[RemoteUITableViewCell editableTextField](self->_tableCell, "editableTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)setDetailAndPlaceholderText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("detailLabel"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("placeholder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v6, "setText:", v10);
    -[RUIElement style](self, "style");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectPageDetailTextColor");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v8;
    objc_msgSend(v6, "setTextColor:", v8);

    goto LABEL_6;
  }
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v6, "setText:", v5);
    v7 = objc_alloc_init(MEMORY[0x24BEBDA48]);
    objc_msgSend(v7, "_placeholderColor");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)_matchesSearchTermComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  -[RUITableViewRow searchTerms](self, "searchTerms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    -[RUITableViewRow searchTerms](self, "searchTerms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __47__RUITableViewRow__matchesSearchTermComponent___block_invoke;
    v17[3] = &unk_24C298658;
    v18 = v4;
    v19 = &v20;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);

    v7 = *((_BYTE *)v21 + 24) != 0;
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    -[RUIElement attributes](self, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("label"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "localizedStandardContainsString:", v4);

    if ((v10 & 1) != 0
      || (-[RUIElement attributes](self, "attributes"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("subLabel")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "localizedStandardContainsString:", v4),
          v12,
          v11,
          (v13 & 1) != 0))
    {
      v7 = 1;
    }
    else
    {
      -[RUIElement attributes](self, "attributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("detailLabel"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v15, "localizedStandardContainsString:", v4);

    }
  }

  return v7;
}

uint64_t __47__RUITableViewRow__matchesSearchTermComponent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "localizedStandardContainsString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)matchesSearchTerm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__RUITableViewRow_matchesSearchTerm___block_invoke;
  v8[3] = &unk_24C298680;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);
  LOBYTE(self) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)self;
}

uint64_t __37__RUITableViewRow_matchesSearchTerm___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_matchesSearchTermComponent:", a2);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    result = 0;
  }
  *(_BYTE *)(v2 + 24) = result;
  return result;
}

- (void)setSelectedRowTextColor
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("class"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("selectPage"));

  if (v5)
  {
    -[RUIElement style](self, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectPageDetailTextColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[RUIElement attributes](self, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("selectPageRowColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[RUITableViewRow textColorForAttributeName:](self, "textColorForAttributeName:", CFSTR("selectPageRowColor"));
      v9 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v9;
    }
    -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v11);

  }
}

- (void)setSelectRowValue:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  self->_selectedRow = -1;
  v14 = v4;
  if (objc_msgSend(v4, "length") && -[NSMutableArray count](self->_selectOptions, "count"))
  {
    v5 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_selectOptions, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", v14);

      if (v8)
        break;

      if (-[NSMutableArray count](self->_selectOptions, "count") <= (unint64_t)++v5)
        goto LABEL_8;
    }
    self->_selectedRow = v5;
    objc_msgSend(v6, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

  }
LABEL_8:
  if (self->_selectedRow < 0)
  {
    -[RUIElement attributes](self, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("placeholder"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

  }
}

- (BOOL)setSelectPageRowValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[RUITableViewRow selectOptions](self, "selectOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqualToString:", v10);

        if (v11)
        {
          v34 = v5;
          -[RUIElement attributes](self, "attributes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "mutableCopy");

          objc_msgSend(v9, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("value"));

          objc_msgSend(v9, "label");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("detailLabel"));

          -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "label");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setText:", v17);

          v33 = v13;
          -[RUITableViewRow setAttributes:](self, "setAttributes:", v13);
          -[RUITableViewRow linkedPage](self, "linkedPage");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "tableViewOM");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "sections");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v32 = v21;
          objc_msgSend(v21, "rows");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v36;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v36 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
                objc_msgSend(v27, "attributes");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("value"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "isEqualToString:", v4);

                objc_msgSend(v27, "setSelected:", v30);
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v24);
          }

          LOBYTE(v6) = 1;
          v5 = v34;
          goto LABEL_18;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_18:

  return v6;
}

- (void)setValueFromString:(id)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id WeakRetained;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  int v23;
  id v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[RUIElement attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("class"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("editableText")))
  {
    -[UITableViewCell ruiEditableTextField](self->_tableCell, "ruiEditableTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v6);

    if ((v11 & 1) != 0)
      goto LABEL_17;
    -[UITableViewCell ruiEditableTextField](self->_tableCell, "ruiEditableTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v6);

    goto LABEL_15;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("switch")))
  {
    v13 = -[UISwitch isOn](self->_switchControl, "isOn");
    if (v13 == objc_msgSend(v6, "BOOLValue"))
      goto LABEL_17;
    -[UISwitch setOn:](self->_switchControl, "setOn:", objc_msgSend(v6, "BOOLValue"));
    goto LABEL_15;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("datePicker")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("select")))
    {
      -[RUITableViewRow setSelectRowValue:](self, "setSelectRowValue:", v6);
      goto LABEL_15;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("selectPage")))
    {
      if (-[RUITableViewRow setSelectPageRowValue:](self, "setSelectPageRowValue:", v6))
      {
LABEL_15:
        if (v4)
        {
LABEL_16:
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "rowDidChange:action:", self, 1);

          goto LABEL_17;
        }
        goto LABEL_17;
      }
      if (!_isInternalInstall())
        goto LABEL_17;
      _RUILoggingFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      v23 = 138412290;
      v24 = v6;
      v20 = "Warning: No selectPageRow linkedOption found with value '%@'";
    }
    else
    {
      if (!_isInternalInstall())
        goto LABEL_17;
      _RUILoggingFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      v23 = 138412290;
      v24 = v8;
      v20 = "Warning: Attempt to set value on row with class '%@' which is not settable";
    }
    v21 = v19;
    v22 = 12;
    goto LABEL_30;
  }
  if (!objc_msgSend(v6, "length"))
  {
    if (!_isInternalInstall())
      goto LABEL_17;
    _RUILoggingFacility();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      v20 = "Warning: Ignoring empty date value";
      v21 = v19;
      v22 = 2;
LABEL_30:
      _os_log_impl(&dword_209E87000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v23, v22);
    }
LABEL_31:

    goto LABEL_17;
  }
  +[RUITableViewRow _formatterForDateYMD](RUITableViewRow, "_formatterForDateYMD");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateFromString:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUITableViewRow date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", v15);

  if (!v17)
  {
    -[RUITableViewRow setDate:](self, "setDate:", v15);

    if (!v4)
      goto LABEL_17;
    goto LABEL_16;
  }

LABEL_17:
}

- (void)setValueFromString:(id)a3
{
  -[RUITableViewRow setValueFromString:notify:](self, "setValueFromString:notify:", a3, 1);
}

- (BOOL)supportsAutomaticSelection
{
  void *v2;
  void *v3;
  char v4;

  -[RUIElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("class"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("datePicker")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("select"));

  return v4;
}

- (void)populatePostbackDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a3;
  -[RUIElement attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("postback"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    -[RUIElement attributes](self, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("id"));
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  v8 = -[RUITableViewRow tableCell](self, "tableCell");
  if (objc_msgSend(v5, "length"))
  {
    -[RUIElement attributes](self, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("class"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("editableText")) & 1) != 0
      || objc_msgSend(v10, "isEqualToString:", CFSTR("numberPicker")))
    {
      -[UITableViewCell ruiEditableTextField](self->_tableCell, "ruiEditableTextField");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "text");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v12)
        v13 = v12;
      else
        v13 = &stru_24C29B280;
      objc_msgSend(v25, "setValue:forKey:", v13, v5);

      goto LABEL_10;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("switch")))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UISwitch isOn](self->_switchControl, "isOn"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setValue:forKey:", v22, v5);
LABEL_33:

      goto LABEL_10;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("datePicker")))
    {
      objc_msgSend(v25, "setValue:forKey:", self->_date, v5);
LABEL_10:

      goto LABEL_11;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("select")))
    {
      if (self->_selectedRow < 0)
        goto LABEL_10;
      -[NSMutableArray objectAtIndex:](self->_selectOptions, "objectAtIndex:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "value");
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("selectPage")))
        goto LABEL_10;
      -[RUIElement attributes](self, "attributes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("value"));
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v23;
    objc_msgSend(v25, "setValue:forKey:", v23, v5);

    goto LABEL_33;
  }
LABEL_11:
  -[RUIElement attributes](self, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("radioGroup"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length")
    && -[RemoteUITableViewCell remoteUIAccessoryType](self->_tableCell, "remoteUIAccessoryType") == 3)
  {
    -[RUIElement attributes](self, "attributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("value"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "length"))
      objc_msgSend(v25, "setValue:forKey:", v17, v15);

  }
  -[RUIElement attributes](self, "attributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("accessory"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length")
    && objc_msgSend(v19, "isEqualToString:", CFSTR("checkmark.circle"))
    && -[RUITableViewRow isSelected](self, "isSelected"))
  {
    -[RUIElement attributes](self, "attributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("value"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "length"))
      objc_msgSend(v25, "setValue:forKey:", v21, v15);

  }
}

- (id)selectOptions
{
  NSMutableArray *selectOptions;
  NSMutableArray *v4;
  NSMutableArray *v5;

  selectOptions = self->_selectOptions;
  if (!selectOptions)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->_selectOptions;
    self->_selectOptions = v4;

    selectOptions = self->_selectOptions;
  }
  return selectOptions;
}

- (BOOL)isCopyable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  BOOL v8;
  void *v9;
  void *v11;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isCopyable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isCopyable"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSString BOOLValue](v7, "BOOLValue");
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("copyableAttribute"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      return 1;
    -[RUIElement attributes](self, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("class"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("label")))
    {
      v8 = 0;
      goto LABEL_4;
    }
    v7 = -[RUITableViewRow copyText](self, "copyText");
    v8 = v7 != 0;
  }

LABEL_4:
  return v8;
}

- (NSString)copyText
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[RUITableViewRow copyTextFromCopyableAttribute](self, "copyTextFromCopyableAttribute");
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell ruiValueLabel](self->_tableCell, "ruiValueLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v5, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    v4 = v7;

  }
  return (NSString *)v4;
}

- (id)copyTextFromCopyableAttribute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("copyableAttribute"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RUITableViewRow;
  -[RUIElement dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[RUIElement attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("class"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIElement attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("label"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, rowClass: '%@', label: '%@'>"), v4, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)startActivityIndicator
{
  if (-[RUITableViewRow wantsInlineActivityIndicator](self, "wantsInlineActivityIndicator"))
    -[RUITableViewRow setShowingProgressIndicator:](self, "setShowingProgressIndicator:", 1);
}

- (void)stopActivityIndicator
{
  -[RUITableViewRow setShowingProgressIndicator:](self, "setShowingProgressIndicator:", 0);
}

- (void)setDate:(id)a3
{
  NSDate *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDate *v9;

  v5 = (NSDate *)a3;
  if (self->_date != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_date, a3);
    -[RUITableViewRow _datePickerFormatter](self, "_datePickerFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", self->_date);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    v5 = v9;
  }

}

- (void)_datePickerChanged:(id)a3
{
  void *v4;
  id WeakRetained;

  objc_msgSend(a3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUITableViewRow setDate:](self, "setDate:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "rowDidChange:action:", self, 1);

}

- (double)height
{
  double height;
  void *v3;
  void *v4;
  float v5;

  height = self->_height;
  if (height <= 0.0)
  {
    -[RUIElement attributes](self, "attributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("height"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    height = v5;

  }
  return height;
}

- (float)rowHeightWithMax:(float)a3 peggedHeight:(float)a4 tableView:(id)a5 indexPath:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  float v13;
  void *v14;
  char IsAccessibilityContentSizeCategory;
  double v16;
  double v17;
  id v18;
  double v19;
  CGSize *p_cachedSize;
  double width;
  double v22;
  double height;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  float v33;
  void *v35;
  char isKindOfClass;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  int64_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;

  v9 = a5;
  -[RUIElement attributes](self, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("class"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_2;
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  -[RUITableViewRow height](self, "height");
  v17 = v16;
  if (v16 > 0.0 && (IsAccessibilityContentSizeCategory & 1) == 0)
  {
    v13 = v16;
    goto LABEL_22;
  }
  if (objc_msgSend(v11, "hasPrefix:", CFSTR("html")))
  {
    v18 = -[RUITableViewRow tableCell](self, "tableCell");
    -[RemoteUITableViewCell frame](self->_tableCell, "frame");
    if (v19 < 44.0)
      -[RemoteUITableViewCell setFrame:](self->_tableCell, "setFrame:");
    p_cachedSize = &self->_cachedSize;
    width = self->_cachedSize.width;
    -[RemoteUITableViewCell webViewWidth](self->_tableCell, "webViewWidth");
    if (width != v22 || (height = self->_cachedSize.height, height == 0.0))
    {
      -[RemoteUITableViewCell webContainerView](self->_tableCell, "webContainerView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[RemoteUITableViewCell webViewWidth](self->_tableCell, "webViewWidth");
      objc_msgSend(v24, "heightForWidth:");
      self->_cachedSize.height = v25 + 1.0 + 16.0;

      height = self->_cachedSize.height;
      if (height > a3)
      {
        height = a4;
        self->_cachedSize.height = a4;
        if (a3 > 0.0)
        {
          -[RemoteUITableViewCell webContainerView](self->_tableCell, "webContainerView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "webView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "_scrollView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setBounces:", 1);

          -[RemoteUITableViewCell webContainerView](self->_tableCell, "webContainerView");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "webView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "_scrollView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setScrollEnabled:", 1);

          height = p_cachedSize->height;
        }
      }
    }
    v12 = fmax(height, 44.0);
    goto LABEL_3;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("linkedOption"))
    || objc_msgSend(v11, "isEqualToString:", CFSTR("selectPage")))
  {
    -[RemoteUITableViewCell height](self->_tableCell, "height");
    v17 = v32;
  }
  else
  {
    -[RUITableViewRow tableCell](self, "tableCell");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v17 = *MEMORY[0x24BEBE770];
    }
    else
    {
      if ((IsAccessibilityContentSizeCategory & 1) != 0)
      {
LABEL_2:
        v12 = *MEMORY[0x24BEBE770];
LABEL_3:
        v13 = v12;
        goto LABEL_22;
      }
      -[RUITableViewRow tableCell](self, "tableCell");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "textLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "numberOfLines") == 1)
      {
        -[RUITableViewRow tableCell](self, "tableCell");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "detailTextLabel");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "numberOfLines") != 1;

      }
      else
      {
        v41 = 1;
      }

      v42 = -[RUITableViewRow tableCellStyle](self, "tableCellStyle");
      if (v41 || v42 == 3)
      {
        objc_msgSend(v9, "readableContentGuide");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "layoutFrame");
        v45 = v44;

        -[RemoteUITableViewCell contentView](self->_tableCell, "contentView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "layoutMargins");
        v48 = v47;
        -[RemoteUITableViewCell contentView](self->_tableCell, "contentView");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "layoutMargins");
        v51 = v45 - (v48 + v50);

        -[UITableViewCell ruiImageView](self->_tableCell, "ruiImageView");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "image");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          -[UITableViewCell ruiImageView](self->_tableCell, "ruiImageView");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "size");
          v51 = v51 - v55;

        }
        -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableViewCell ruiTextLabel](self->_tableCell, "ruiTextLabel");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v57, "numberOfLines"), 0.0, 0.0, v51, 1.79769313e308);
        v59 = v58;

        -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "sizeThatFits:", v51, 1.79769313e308);
        v62 = v61;

        v63 = v59 + v62 + 23.0;
        -[RUITableViewRow tableCell](self, "tableCell");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "ruiDetailTextLabel");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "text");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "length");

        if (v67)
          v17 = v63 + -1.5;
        else
          v17 = v63;
      }
    }
  }
  if (v17 > 44.0)
  {
    v33 = v17;
    v13 = v33;
  }
  else
  {
    v13 = -1.0;
  }
LABEL_22:

  return v13;
}

- (void)clearCachedHeight
{
  self->_cachedSize = (CGSize)*MEMORY[0x24BDBF148];
}

- (void)_switchFlipped:(id)a3
{
  id WeakRetained;

  if (self->_switchValue != -[UISwitch isOn](self->_switchControl, "isOn", a3))
  {
    self->_switchValue = -[UISwitch isOn](self->_switchControl, "isOn");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "rowDidChange:action:", self, 2);

  }
}

- (void)switchCanceled
{
  _BOOL8 v2;

  v2 = !self->_switchValue;
  self->_switchValue ^= 1u;
  -[UISwitch setOn:](self->_switchControl, "setOn:", v2);
}

- (BOOL)rowSupportsLoadingIndicator
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("class"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("link")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("switch")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[RUITableViewRow detailButton](self, "detailButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (BOOL)indentWhileEditing
{
  void *v2;
  void *v3;
  char v4;

  -[RUIElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("indentWhileEditing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isEditingEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[RUIElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("editingEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  if (-[NSMutableArray count](self->_selectOptions, "count", a3, a4, a5) > (unint64_t)a4)
  {
    -[NSMutableArray objectAtIndex:](self->_selectOptions, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell ruiDetailTextLabel](self->_tableCell, "ruiDetailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    self->_selectedRow = a4;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "rowDidChange:action:", self, 1);

}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v7;
  void *v8;

  if (-[NSMutableArray count](self->_selectOptions, "count", a3, a4, a5) <= (unint64_t)a4)
  {
    v8 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_selectOptions, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return -[NSMutableArray count](self->_selectOptions, "count", a3, a4);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "rowDidEndEditing:", self);

  return 1;
}

- (void)setEditableTextFieldValue:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char isKindOfClass;
  void *v12;
  id v13;

  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[UITableViewCell ruiEditableTextField](self->_tableCell, "ruiEditableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "textFieldRow:changeCharactersInRange:replacementString:", self, 0, objc_msgSend(v6, "length"), v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UITableViewCell ruiEditableTextField](self->_tableCell, "ruiEditableTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v7;
LABEL_6:
    objc_msgSend(v8, "setText:", v10);
    goto LABEL_7;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[UITableViewCell ruiEditableTextField](self->_tableCell, "ruiEditableTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((isKindOfClass & 1) == 0)
  {
    v10 = v13;
    goto LABEL_6;
  }
  objc_msgSend(v7, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v12);

LABEL_7:
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v24;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "textFieldRow:changeCharactersInRange:replacementString:", self, location, length, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", location, length, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v12, "isEqualToString:", v14);
    if ((v15 & 1) == 0)
      objc_msgSend(v9, "setText:", v12);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v9, "setText:", v16);
        if ((unint64_t)objc_msgSend(v12, "count") >= 2)
        {
          objc_msgSend(v12, "objectAtIndex:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = (int)objc_msgSend(v18, "intValue");
            if ((unint64_t)objc_msgSend(v12, "count") < 3)
            {
              v21 = 0;
            }
            else
            {
              v24 = v19;
              objc_msgSend(v12, "objectAtIndex:", 2);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v21 = (int)objc_msgSend(v20, "intValue");
              else
                v21 = 0;

              v19 = v24;
            }
            objc_msgSend(v9, "setSelectionRange:", v19, v21);
          }

        }
      }

      v15 = isKindOfClass ^ 1;
    }
    else
    {
      v15 = 1;
    }
  }
  v22 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v22, "rowDidChange:action:", self, 1);

  return v15 & 1;
}

- (void)textFieldEditingDidEnd:(id)a3
{
  RUITextFieldChangeObserver **p_textFieldChangeObserver;
  id v4;
  id WeakRetained;

  p_textFieldChangeObserver = &self->_textFieldChangeObserver;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textFieldChangeObserver);
  objc_msgSend(WeakRetained, "textFieldEditingDidEnd:", v4);

}

- (void)detailLabelActivatedLinkFromCell:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RUIElement *v9;
  id v10;

  v10 = a4;
  -[RUIElement attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("detailLinkURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RUIElement attributes](self, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("url"));
    v9 = -[RUIElement initWithAttributes:parent:]([RUIElement alloc], "initWithAttributes:parent:", v8, self);
    -[RUIElement performAction:forElement:completion:](self, "performAction:forElement:completion:", 2, v9, v10);

  }
}

- (void)webContainerView:(id)a3 didClickLinkWithURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  RUIElement *v8;
  id v9;

  v5 = a4;
  -[RUIElement attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v5, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("url"));
  v8 = -[RUIElement initWithAttributes:parent:]([RUIElement alloc], "initWithAttributes:parent:", v9, self);
  -[RUIElement performAction:forElement:completion:](self, "performAction:forElement:completion:", 2, v8, 0);

}

- (id)_checkmarkAccessoryViewWithSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBB520], "defaultFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v7 = CFSTR("checkmark.circle.fill");
  else
    v7 = CFSTR("circle");
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v8);
  -[RUIElement attributes](self, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("checkedColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v3)
      objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v11);
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v12);

  }
  return v9;
}

- (void)_drawCustomImage:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  CGFloat v48;
  void *v49;
  void *v50;
  CGContext *CurrentContext;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  _QWORD v68[2];
  _QWORD v69[4];
  CGSize v70;
  CGRect v71;

  v65 = a3;
  v69[2] = *MEMORY[0x24BDAC8D0];
  -[RUIElement attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("imageText"));
  v5 = objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("lightImageTextColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("darkImageTextColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("selectedLightImageTextColor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("selectedDarkImageTextColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("darkBackgroundColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("lightBackgroundColor"));
  v16 = objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("selectedDarkColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIElement attributes](self, "attributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("selectedLightColor"));
  v20 = objc_claimAutoreleasedReturnValue();

  v21 = (void *)v20;
  v22 = (void *)v16;
  v23 = (void *)v5;
  if (v5 || v7 || v9 || v14 || v16 || v18 || v21 || v67 || v12)
  {
    v63 = v14;
    v59 = v21;
    if (v21)
      objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v16);
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemLightGrayColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v67)
      objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v67);
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v7;
    v62 = v18;
    v58 = v22;
    if (v7)
      objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v7);
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBDAB0], "_currentTraitCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "userInterfaceStyle");

    v60 = v12;
    if (v28 == 2)
    {
      if (v62)
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:");
        v29 = objc_claimAutoreleasedReturnValue();

        v64 = (void *)v29;
      }
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:");
        v30 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v30;
      }
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v12);
        v31 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v31;
      }
      if (v9)
        objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v9);
      else
        objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v33 = objc_claimAutoreleasedReturnValue();

      v32 = (void *)v33;
    }
    else
    {
      v32 = v26;
    }
    v56 = v32;
    v57 = v25;
    if (v65)
      v34 = v64;
    else
      v34 = v24;
    if (v65)
      v35 = v25;
    else
      v35 = v32;
    v36 = (void *)MEMORY[0x24BEBB520];
    v37 = v35;
    v38 = v34;
    objc_msgSend(v36, "systemFontOfSize:", 17.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *MEMORY[0x24BEBB368];
    v68[0] = *MEMORY[0x24BEBB360];
    v68[1] = v39;
    v69[0] = v66;
    v69[1] = v37;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v23;
    objc_msgSend(v23, "boundingRectWithSize:options:attributes:context:", 1, v40, 0, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    v43 = v42;
    v45 = v44;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "scale");
    v48 = v47;
    v70.width = 77.0;
    v70.height = 40.0;
    UIGraphicsBeginImageContextWithOptions(v70, 0, v48);

    -[RemoteUITableViewCell imageView](self->_tableCell, "imageView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "image");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "drawInRect:", 0.0, 0.0, 77.0, 40.0);

    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend(v38, "setFill");

    v71.origin.x = 0.0;
    v71.origin.y = 0.0;
    v71.size.width = 77.0;
    v71.size.height = 40.0;
    CGContextFillRect(CurrentContext, v71);
    v23 = v41;
    objc_msgSend(v41, "drawAtPoint:withAttributes:", v40, 38.5 - v43 * 0.5, 20.0 - v45 * 0.5);
    UIGraphicsGetImageFromCurrentImageContext();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUITableViewCell imageView](self->_tableCell, "imageView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setImage:", v52);

    -[RemoteUITableViewCell imageView](self->_tableCell, "imageView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "_setCornerRadius:", 8.0);

    -[RemoteUITableViewCell imageView](self->_tableCell, "imageView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v55, "setClipsToBounds:", 1);
    UIGraphicsEndImageContext();

    v7 = v61;
    v21 = v59;
    v12 = v60;
    v18 = v62;
    v14 = v63;
    v22 = v58;
  }

}

- (void)_setBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUITableViewCell setBackgroundColor:](self->_tableCell, "setBackgroundColor:", v5);

    v4 = v6;
  }

}

- (RUITableViewRowDelegate)delegate
{
  return (RUITableViewRowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)rowInvalid
{
  return self->_rowInvalid;
}

- (NSDictionary)deleteAction
{
  return self->_deleteAction;
}

- (void)setDeleteAction:(id)a3
{
  objc_storeStrong((id *)&self->_deleteAction, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSData)htmlSubLabelData
{
  return self->_htmlSubLabelData;
}

- (void)setHtmlSubLabelData:(id)a3
{
  objc_storeStrong((id *)&self->_htmlSubLabelData, a3);
}

- (int64_t)selectedRow
{
  return self->_selectedRow;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDate)dateMin
{
  return self->_dateMin;
}

- (void)setDateMin:(id)a3
{
  objc_storeStrong((id *)&self->_dateMin, a3);
}

- (NSDate)dateMax
{
  return self->_dateMax;
}

- (void)setDateMax:(id)a3
{
  objc_storeStrong((id *)&self->_dateMax, a3);
}

- (int64_t)datePickerMode
{
  return self->_datePickerMode;
}

- (int64_t)datePickerStyle
{
  return self->_datePickerStyle;
}

- (UIView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_pickerView, a3);
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (BOOL)configured
{
  return self->_configured;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (BOOL)isShowingProgressIndicator
{
  return self->_showingProgressIndicator;
}

- (RUITextFieldChangeObserver)textFieldChangeObserver
{
  return (RUITextFieldChangeObserver *)objc_loadWeakRetained((id *)&self->_textFieldChangeObserver);
}

- (void)setTextFieldChangeObserver:(id)a3
{
  objc_storeWeak((id *)&self->_textFieldChangeObserver, a3);
}

- (RUIPage)linkedPage
{
  return (RUIPage *)objc_loadWeakRetained((id *)&self->_linkedPage);
}

- (void)setLinkedPage:(id)a3
{
  objc_storeWeak((id *)&self->_linkedPage, a3);
}

- (RUIDetailButtonElement)detailButton
{
  return self->_detailButton;
}

- (void)setDetailButton:(id)a3
{
  objc_storeStrong((id *)&self->_detailButton, a3);
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (BOOL)showAlternateDetailLabel
{
  return self->_showAlternateDetailLabel;
}

- (void)setShowAlternateDetailLabel:(BOOL)a3
{
  self->_showAlternateDetailLabel = a3;
}

- (NSMutableSet)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
  objc_storeStrong((id *)&self->_searchTerms, a3);
}

- (void)setSection:(id)a3
{
  objc_storeWeak((id *)&self->_section, a3);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_section);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_detailButton, 0);
  objc_destroyWeak((id *)&self->_linkedPage);
  objc_destroyWeak((id *)&self->_textFieldChangeObserver);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_htmlSubLabelData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_datePickerFormatter, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_deleteAction, 0);
  objc_storeStrong((id *)&self->_switchControl, 0);
  objc_storeStrong((id *)&self->_dateMin, 0);
  objc_storeStrong((id *)&self->_dateMax, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_selectOptions, 0);
  objc_storeStrong((id *)&self->_tableCell, 0);
}

- (void)parseBadge
{
  RUITableViewRow *v2;

  v2 = self;
  RUITableViewRow.parseBadge()();

}

- (void)setBadgeInTableCell:(id)a3
{
  UITableViewCell *v4;
  RUITableViewRow *v5;

  v4 = (UITableViewCell *)a3;
  v5 = self;
  RUITableViewRow.setBadge(in:)(v4);

}

- (void)tableCell
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef RUICTSettingCopyMyPhoneNumber()");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("RUITableViewRow.m"), 49, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
