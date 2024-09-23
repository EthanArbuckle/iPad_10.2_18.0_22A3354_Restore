@implementation SSCalendarResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.mobilecal");
}

+ (BOOL)supportsResult:(id)a3
{
  id v4;
  char v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SSCalendarResultBuilder;
  if ((objc_msgSendSuper2(&v8, sel_supportsResult_, v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "applicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.iCal"));

  }
  return v5;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (id)stringWithStartDate:(id)a3 endDate:(id)a4 isAllDay:(BOOL)a5
{
  void *v5;
  void *v6;

  +[SSDateFormatManager stringsFromDate:toDate:isAllDay:](SSDateFormatManager, "stringsFromDate:toDate:isAllDay:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" · "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SSCalendarResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSCalendarResultBuilder *v5;
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
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SSCalendarResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v20, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA68C8], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalendarResultBuilder setStartDate:](v5, "setStartDate:", v6);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA61C8], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalendarResultBuilder setEndDate:](v5, "setEndDate:", v7);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60C0], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalendarResultBuilder setCalendarName:](v5, "setCalendarName:", v8);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6078], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalendarResultBuilder setDelegateCalendarName:](v5, "setDelegateCalendarName:", v9);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA63D8], objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalendarResultBuilder setIsAllDay:](v5, "setIsAllDay:", objc_msgSend(v10, "BOOLValue"));

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6968], objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalendarResultBuilder setEventName:](v5, "setEventName:", v11);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA64A0], objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalendarResultBuilder setLocation:](v5, "setLocation:", v12);

    -[SSCalendarResultBuilder location](v5, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalendarResultBuilder location](v5, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\\n+"), CFSTR(" "), 1024, 0, objc_msgSend(v14, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalendarResultBuilder setLocation:](v5, "setLocation:", v15);

    if (isMacOS())
    {
      objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6380], objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSCalendarResultBuilder setEventIdentifier:](v5, "setEventIdentifier:", v16);
    }
    else
    {
      objc_msgSend(v4, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("."));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSCalendarResultBuilder setEventIdentifier:](v5, "setEventIdentifier:", v18);

    }
  }

  return v5;
}

- (id)buildInlineCardSection
{
  void *v3;
  void *v4;
  char v5;
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
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SSCalendarResultBuilder location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && SSSnippetModernizationEnabled())
    objc_msgSend(v3, "addObject:", v4);
  if (SSSnippetModernizationEnabled())
    v5 = isMacOS();
  else
    v5 = 0;
  -[SSCalendarResultBuilder startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v9 = 0;
    if (!v4)
      goto LABEL_15;
    goto LABEL_13;
  }
  v7 = (void *)objc_opt_class();
  -[SSCalendarResultBuilder endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithStartDate:endDate:isAllDay:", v6, v8, -[SSCalendarResultBuilder isAllDay](self, "isAllDay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v3, "addObject:", v9);

    v9 = 0;
  }

  if (v4)
  {
LABEL_13:
    if ((SSSnippetModernizationEnabled() & 1) == 0)
      objc_msgSend(v3, "addObject:", v4);
  }
LABEL_15:
  v10 = (void *)objc_opt_new();
  if ((v5 & 1) == 0)
  {
    -[SSCalendarResultBuilder calendarName](self, "calendarName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalendarResultBuilder delegateCalendarName](self, "delegateCalendarName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v10, "addObject:", v12);
    if (v11)
      objc_msgSend(v10, "addObject:", v11);

  }
  v31.receiver = self;
  v31.super_class = (Class)SSCalendarResultBuilder;
  -[SSResultBuilder buildInlineCardSection](&v31, sel_buildInlineCardSection);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSecondaryTitle:", v14);

  }
  else
  {
    objc_msgSend(v13, "setSecondaryTitle:", 0);
  }
  objc_msgSend(v13, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMaxLines:", 1);

  objc_msgSend(v13, "secondaryTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIsSecondaryTitleDetached:", v16 != 0);

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "richTextsFromStrings:", v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDescriptions:", v17);

  }
  else
  {
    objc_msgSend(v13, "setDescriptions:", 0);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v13, "descriptions", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "setMaxLines:", 1);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v20);
  }

  if ((SSSnippetModernizationEnabled() & 1) != 0 || !objc_msgSend(v10, "count"))
  {
    objc_msgSend(v13, "setFootnote:", 0);
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" — "));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textWithString:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFootnote:", v25);

  }
  return v13;
}

- (id)buildBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[SSCalendarResultBuilder eventIdentifier](self, "eventIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[SSCalendarResultBuilder eventIdentifier](self, "eventIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEventIdentifier:", v5);

    return v4;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SSCalendarResultBuilder;
    -[SSResultBuilder buildBackgroundColor](&v7, sel_buildBackgroundColor);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)buildCompactCardSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)objc_opt_new();
  -[SSCalendarResultBuilder startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SSCalendarResultBuilder endDate](self, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSDateFormatManager stringsFromDate:toDate:isAllDay:](SSDateFormatManager, "stringsFromDate:toDate:isAllDay:", v4, v5, -[SSCalendarResultBuilder isAllDay](self, "isAllDay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObjectsFromArray:", v6);
  }
  -[SSCalendarResultBuilder location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "addObject:", v7);
  v11.receiver = self;
  v11.super_class = (Class)SSCalendarResultBuilder;
  -[SSResultBuilder buildCompactCardSection](&v11, sel_buildCompactCardSection);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "richTextsFromStrings:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDescriptions:", v9);

  return v8;
}

- (id)buildThumbnail
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[SSCalendarResultBuilder startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8C200]), "initWithDate:", v3);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SSCalendarResultBuilder;
    -[SSResultBuilder buildThumbnail](&v7, sel_buildThumbnail);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)buildTitle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSCalendarResultBuilder;
  -[SSResultBuilder buildTitle](&v10, sel_buildTitle);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v2, "formattedTextPieces");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_opt_class();
      objc_msgSend(v2, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "whiteSpaceCondensedStringForString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setText:", v8);

    }
  }
  return v2;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSString)calendarName
{
  return self->_calendarName;
}

- (void)setCalendarName:(id)a3
{
  objc_storeStrong((id *)&self->_calendarName, a3);
}

- (NSString)delegateCalendarName
{
  return self->_delegateCalendarName;
}

- (void)setDelegateCalendarName:(id)a3
{
  objc_storeStrong((id *)&self->_delegateCalendarName, a3);
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_eventIdentifier, a3);
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
  objc_storeStrong((id *)&self->_eventName, a3);
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (void)setIsAllDay:(BOOL)a3
{
  self->_isAllDay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_delegateCalendarName, 0);
  objc_storeStrong((id *)&self->_calendarName, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
