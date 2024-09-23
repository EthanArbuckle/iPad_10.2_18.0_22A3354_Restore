@implementation APPBAdLayoutDetails

- (int)type
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_type;
  else
    return 40000;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 40000) >= 9)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100214248 + a3 - 40000);
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Banner")) & 1) != 0)
  {
    v4 = 40000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Video")) & 1) != 0)
  {
    v4 = 40001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRTBrand")) & 1) != 0)
  {
    v4 = 40002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRTNews")) & 1) != 0)
  {
    v4 = 40003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRTVerizon")) & 1) != 0)
  {
    v4 = 40004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Native")) & 1) != 0)
  {
    v4 = 40005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Carousel")) & 1) != 0)
  {
    v4 = 40006;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AMP")) & 1) != 0)
  {
    v4 = 40007;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Sponsorship")))
  {
    v4 = 40008;
  }
  else
  {
    v4 = 40000;
  }

  return v4;
}

- (BOOL)hasHeadline
{
  return self->_headline != 0;
}

- (BOOL)hasAccessHeadline
{
  return self->_accessHeadline != 0;
}

- (BOOL)hasAdCopy
{
  return self->_adCopy != 0;
}

- (BOOL)hasAccessAdCopy
{
  return self->_accessAdCopy != 0;
}

- (BOOL)hasSponsoredBy
{
  return self->_sponsoredBy != 0;
}

- (void)clearElements
{
  -[NSMutableArray removeAllObjects](self->_elements, "removeAllObjects");
}

- (void)addElements:(id)a3
{
  id v4;
  NSMutableArray *elements;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  elements = self->_elements;
  v8 = v4;
  if (!elements)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_elements;
    self->_elements = v6;

    v4 = v8;
    elements = self->_elements;
  }
  -[NSMutableArray addObject:](elements, "addObject:", v4);

}

- (unint64_t)elementsCount
{
  return (unint64_t)-[NSMutableArray count](self->_elements, "count");
}

- (id)elementsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_elements, "objectAtIndex:", a3);
}

+ (Class)elementsType
{
  return (Class)objc_opt_class(APPBElement, a2);
}

- (BOOL)hasStyle
{
  return self->_style != 0;
}

- (int)adFormatType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_adFormatType;
  else
    return 22200;
}

- (void)setAdFormatType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_adFormatType = a3;
}

- (void)setHasAdFormatType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdFormatType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)adFormatTypeAsString:(int)a3
{
  if ((a3 - 22200) >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100214290 + a3 - 22200);
}

- (int)StringAsAdFormatType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Large")) & 1) != 0)
  {
    v4 = 22200;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Medium")) & 1) != 0)
  {
    v4 = 22201;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Small")))
  {
    v4 = 22202;
  }
  else
  {
    v4 = 22200;
  }

  return v4;
}

- (BOOL)hasSponsoredByAssetURL
{
  return self->_sponsoredByAssetURL != 0;
}

- (BOOL)hasCtaButton
{
  return self->_ctaButton != 0;
}

- (BOOL)hasActionURL
{
  return self->_actionURL != 0;
}

- (BOOL)hasSponsoredByAssetURLForDarkMode
{
  return self->_sponsoredByAssetURLForDarkMode != 0;
}

- (void)clearLocalizedHeadlines
{
  -[NSMutableArray removeAllObjects](self->_localizedHeadlines, "removeAllObjects");
}

- (void)addLocalizedHeadlines:(id)a3
{
  id v4;
  NSMutableArray *localizedHeadlines;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  localizedHeadlines = self->_localizedHeadlines;
  v8 = v4;
  if (!localizedHeadlines)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_localizedHeadlines;
    self->_localizedHeadlines = v6;

    v4 = v8;
    localizedHeadlines = self->_localizedHeadlines;
  }
  -[NSMutableArray addObject:](localizedHeadlines, "addObject:", v4);

}

- (unint64_t)localizedHeadlinesCount
{
  return (unint64_t)-[NSMutableArray count](self->_localizedHeadlines, "count");
}

- (id)localizedHeadlinesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_localizedHeadlines, "objectAtIndex:", a3);
}

+ (Class)localizedHeadlinesType
{
  return (Class)objc_opt_class(APPBLocalizedStringEntry, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAdLayoutDetails;
  v3 = -[APPBAdLayoutDetails description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdLayoutDetails dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  void *v5;
  NSString *headline;
  NSString *accessHeadline;
  NSString *adCopy;
  NSString *accessAdCopy;
  NSString *sponsoredBy;
  id v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  APPBStyle *style;
  void *v19;
  int v20;
  void *v21;
  NSString *sponsoredByAssetURL;
  APPBButton *ctaButton;
  void *v24;
  NSString *actionURL;
  NSString *sponsoredByAssetURLForDarkMode;
  id v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = self->_type - 40000;
    if (v4 >= 9)
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type));
    else
      v5 = *(&off_100214248 + v4);
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  headline = self->_headline;
  if (headline)
    objc_msgSend(v3, "setObject:forKey:", headline, CFSTR("headline"));
  accessHeadline = self->_accessHeadline;
  if (accessHeadline)
    objc_msgSend(v3, "setObject:forKey:", accessHeadline, CFSTR("accessHeadline"));
  adCopy = self->_adCopy;
  if (adCopy)
    objc_msgSend(v3, "setObject:forKey:", adCopy, CFSTR("adCopy"));
  accessAdCopy = self->_accessAdCopy;
  if (accessAdCopy)
    objc_msgSend(v3, "setObject:forKey:", accessAdCopy, CFSTR("accessAdCopy"));
  sponsoredBy = self->_sponsoredBy;
  if (sponsoredBy)
    objc_msgSend(v3, "setObject:forKey:", sponsoredBy, CFSTR("sponsoredBy"));
  if (-[NSMutableArray count](self->_elements, "count"))
  {
    v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_elements, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v12 = self->_elements;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("elements"));
  }
  style = self->_style;
  if (style)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[APPBStyle dictionaryRepresentation](style, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("style"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v20 = self->_adFormatType - 22200;
    if (v20 >= 3)
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adFormatType));
    else
      v21 = *(&off_100214290 + v20);
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("adFormatType"));

  }
  sponsoredByAssetURL = self->_sponsoredByAssetURL;
  if (sponsoredByAssetURL)
    objc_msgSend(v3, "setObject:forKey:", sponsoredByAssetURL, CFSTR("sponsoredByAssetURL"));
  ctaButton = self->_ctaButton;
  if (ctaButton)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[APPBButton dictionaryRepresentation](ctaButton, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("ctaButton"));

  }
  actionURL = self->_actionURL;
  if (actionURL)
    objc_msgSend(v3, "setObject:forKey:", actionURL, CFSTR("actionURL"));
  sponsoredByAssetURLForDarkMode = self->_sponsoredByAssetURLForDarkMode;
  if (sponsoredByAssetURLForDarkMode)
    objc_msgSend(v3, "setObject:forKey:", sponsoredByAssetURLForDarkMode, CFSTR("sponsoredByAssetURLForDarkMode"));
  if (-[NSMutableArray count](self->_localizedHeadlines, "count"))
  {
    v27 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_localizedHeadlines, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v28 = self->_localizedHeadlines;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(_QWORD *)v36 != v31)
            objc_enumerationMutation(v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v30);
    }

    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("localizedHeadlines"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdLayoutDetailsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSString *headline;
  NSString *accessHeadline;
  NSString *adCopy;
  NSString *accessAdCopy;
  NSString *sponsoredBy;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  APPBStyle *style;
  NSString *sponsoredByAssetURL;
  APPBButton *ctaButton;
  NSString *actionURL;
  NSString *sponsoredByAssetURLForDarkMode;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field(v4, self->_type, 1);
  headline = self->_headline;
  if (headline)
    PBDataWriterWriteStringField(v5, headline, 2);
  accessHeadline = self->_accessHeadline;
  if (accessHeadline)
    PBDataWriterWriteStringField(v5, accessHeadline, 3);
  adCopy = self->_adCopy;
  if (adCopy)
    PBDataWriterWriteStringField(v5, adCopy, 4);
  accessAdCopy = self->_accessAdCopy;
  if (accessAdCopy)
    PBDataWriterWriteStringField(v5, accessAdCopy, 5);
  sponsoredBy = self->_sponsoredBy;
  if (sponsoredBy)
    PBDataWriterWriteStringField(v5, sponsoredBy, 6);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = self->_elements;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v15), 7);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v13);
  }

  style = self->_style;
  if (style)
    PBDataWriterWriteSubmessage(v5, style, 8);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field(v5, self->_adFormatType, 9);
  sponsoredByAssetURL = self->_sponsoredByAssetURL;
  if (sponsoredByAssetURL)
    PBDataWriterWriteStringField(v5, sponsoredByAssetURL, 10);
  ctaButton = self->_ctaButton;
  if (ctaButton)
    PBDataWriterWriteSubmessage(v5, ctaButton, 11);
  actionURL = self->_actionURL;
  if (actionURL)
    PBDataWriterWriteStringField(v5, actionURL, 12);
  sponsoredByAssetURLForDarkMode = self->_sponsoredByAssetURLForDarkMode;
  if (sponsoredByAssetURLForDarkMode)
    PBDataWriterWriteStringField(v5, sponsoredByAssetURLForDarkMode, 13);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = self->_localizedHeadlines;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v25), 14);
        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v23);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id v13;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[28] = self->_type;
    *((_BYTE *)v4 + 116) |= 2u;
  }
  v13 = v4;
  if (self->_headline)
    objc_msgSend(v4, "setHeadline:");
  if (self->_accessHeadline)
    objc_msgSend(v13, "setAccessHeadline:");
  if (self->_adCopy)
    objc_msgSend(v13, "setAdCopy:");
  if (self->_accessAdCopy)
    objc_msgSend(v13, "setAccessAdCopy:");
  if (self->_sponsoredBy)
    objc_msgSend(v13, "setSponsoredBy:");
  if (-[APPBAdLayoutDetails elementsCount](self, "elementsCount"))
  {
    objc_msgSend(v13, "clearElements");
    v5 = -[APPBAdLayoutDetails elementsCount](self, "elementsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdLayoutDetails elementsAtIndex:](self, "elementsAtIndex:", i));
        objc_msgSend(v13, "addElements:", v8);

      }
    }
  }
  if (self->_style)
    objc_msgSend(v13, "setStyle:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v13 + 10) = self->_adFormatType;
    *((_BYTE *)v13 + 116) |= 1u;
  }
  if (self->_sponsoredByAssetURL)
    objc_msgSend(v13, "setSponsoredByAssetURL:");
  if (self->_ctaButton)
    objc_msgSend(v13, "setCtaButton:");
  if (self->_actionURL)
    objc_msgSend(v13, "setActionURL:");
  if (self->_sponsoredByAssetURLForDarkMode)
    objc_msgSend(v13, "setSponsoredByAssetURLForDarkMode:");
  if (-[APPBAdLayoutDetails localizedHeadlinesCount](self, "localizedHeadlinesCount"))
  {
    objc_msgSend(v13, "clearLocalizedHeadlines");
    v9 = -[APPBAdLayoutDetails localizedHeadlinesCount](self, "localizedHeadlinesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdLayoutDetails localizedHeadlinesAtIndex:](self, "localizedHeadlinesAtIndex:", j));
        objc_msgSend(v13, "addLocalizedHeadlines:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  NSMutableArray *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[28] = self->_type;
    *((_BYTE *)v5 + 116) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_headline, "copyWithZone:", a3);
  v8 = (void *)v6[8];
  v6[8] = v7;

  v9 = -[NSString copyWithZone:](self->_accessHeadline, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[NSString copyWithZone:](self->_adCopy, "copyWithZone:", a3);
  v12 = (void *)v6[4];
  v6[4] = v11;

  v13 = -[NSString copyWithZone:](self->_accessAdCopy, "copyWithZone:", a3);
  v14 = (void *)v6[1];
  v6[1] = v13;

  v15 = -[NSString copyWithZone:](self->_sponsoredBy, "copyWithZone:", a3);
  v16 = (void *)v6[10];
  v6[10] = v15;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v17 = self->_elements;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v45;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(v17);
        v22 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v21), "copyWithZone:", a3);
        objc_msgSend(v6, "addElements:", v22);

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v19);
  }

  v23 = -[APPBStyle copyWithZone:](self->_style, "copyWithZone:", a3);
  v24 = (void *)v6[13];
  v6[13] = v23;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_adFormatType;
    *((_BYTE *)v6 + 116) |= 1u;
  }
  v25 = -[NSString copyWithZone:](self->_sponsoredByAssetURL, "copyWithZone:", a3);
  v26 = (void *)v6[11];
  v6[11] = v25;

  v27 = -[APPBButton copyWithZone:](self->_ctaButton, "copyWithZone:", a3);
  v28 = (void *)v6[6];
  v6[6] = v27;

  v29 = -[NSString copyWithZone:](self->_actionURL, "copyWithZone:", a3);
  v30 = (void *)v6[3];
  v6[3] = v29;

  v31 = -[NSString copyWithZone:](self->_sponsoredByAssetURLForDarkMode, "copyWithZone:", a3);
  v32 = (void *)v6[12];
  v6[12] = v31;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v33 = self->_localizedHeadlines;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v41;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v41 != v36)
          objc_enumerationMutation(v33);
        v38 = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v37), "copyWithZone:", a3, (_QWORD)v40);
        objc_msgSend(v6, "addLocalizedHeadlines:", v38);

        v37 = (char *)v37 + 1;
      }
      while (v35 != v37);
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v35);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *headline;
  NSString *accessHeadline;
  NSString *adCopy;
  NSString *accessAdCopy;
  NSString *sponsoredBy;
  NSMutableArray *elements;
  APPBStyle *style;
  NSString *sponsoredByAssetURL;
  APPBButton *ctaButton;
  NSString *actionURL;
  NSString *sponsoredByAssetURLForDarkMode;
  NSMutableArray *localizedHeadlines;
  unsigned __int8 v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_36;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 2) == 0 || self->_type != *((_DWORD *)v4 + 28))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 116) & 2) != 0)
  {
LABEL_36:
    v17 = 0;
    goto LABEL_37;
  }
  headline = self->_headline;
  if ((unint64_t)headline | *((_QWORD *)v4 + 8) && !-[NSString isEqual:](headline, "isEqual:"))
    goto LABEL_36;
  accessHeadline = self->_accessHeadline;
  if ((unint64_t)accessHeadline | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](accessHeadline, "isEqual:"))
      goto LABEL_36;
  }
  adCopy = self->_adCopy;
  if ((unint64_t)adCopy | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](adCopy, "isEqual:"))
      goto LABEL_36;
  }
  accessAdCopy = self->_accessAdCopy;
  if ((unint64_t)accessAdCopy | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](accessAdCopy, "isEqual:"))
      goto LABEL_36;
  }
  sponsoredBy = self->_sponsoredBy;
  if ((unint64_t)sponsoredBy | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](sponsoredBy, "isEqual:"))
      goto LABEL_36;
  }
  elements = self->_elements;
  if ((unint64_t)elements | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](elements, "isEqual:"))
      goto LABEL_36;
  }
  style = self->_style;
  if ((unint64_t)style | *((_QWORD *)v4 + 13))
  {
    if (!-[APPBStyle isEqual:](style, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 1) == 0 || self->_adFormatType != *((_DWORD *)v4 + 10))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 116) & 1) != 0)
  {
    goto LABEL_36;
  }
  sponsoredByAssetURL = self->_sponsoredByAssetURL;
  if ((unint64_t)sponsoredByAssetURL | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](sponsoredByAssetURL, "isEqual:"))
  {
    goto LABEL_36;
  }
  ctaButton = self->_ctaButton;
  if ((unint64_t)ctaButton | *((_QWORD *)v4 + 6))
  {
    if (!-[APPBButton isEqual:](ctaButton, "isEqual:"))
      goto LABEL_36;
  }
  actionURL = self->_actionURL;
  if ((unint64_t)actionURL | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](actionURL, "isEqual:"))
      goto LABEL_36;
  }
  sponsoredByAssetURLForDarkMode = self->_sponsoredByAssetURLForDarkMode;
  if ((unint64_t)sponsoredByAssetURLForDarkMode | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](sponsoredByAssetURLForDarkMode, "isEqual:"))
      goto LABEL_36;
  }
  localizedHeadlines = self->_localizedHeadlines;
  if ((unint64_t)localizedHeadlines | *((_QWORD *)v4 + 9))
    v17 = -[NSMutableArray isEqual:](localizedHeadlines, "isEqual:");
  else
    v17 = 1;
LABEL_37:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  unint64_t v14;
  NSUInteger v15;
  unint64_t v16;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_headline, "hash");
  v5 = -[NSString hash](self->_accessHeadline, "hash");
  v6 = -[NSString hash](self->_adCopy, "hash");
  v7 = -[NSString hash](self->_accessAdCopy, "hash");
  v8 = -[NSString hash](self->_sponsoredBy, "hash");
  v9 = (unint64_t)-[NSMutableArray hash](self->_elements, "hash");
  v10 = -[APPBStyle hash](self->_style, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_adFormatType;
  else
    v11 = 0;
  v12 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v13 = v10 ^ v11 ^ -[NSString hash](self->_sponsoredByAssetURL, "hash");
  v14 = v12 ^ v13 ^ -[APPBButton hash](self->_ctaButton, "hash");
  v15 = -[NSString hash](self->_actionURL, "hash");
  v16 = v15 ^ -[NSString hash](self->_sponsoredByAssetURLForDarkMode, "hash");
  return v14 ^ v16 ^ (unint64_t)-[NSMutableArray hash](self->_localizedHeadlines, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  APPBStyle *style;
  uint64_t v12;
  APPBButton *ctaButton;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v4 = a3;
  v5 = v4;
  if ((v4[29] & 2) != 0)
  {
    self->_type = v4[28];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 8))
    -[APPBAdLayoutDetails setHeadline:](self, "setHeadline:");
  if (*((_QWORD *)v5 + 2))
    -[APPBAdLayoutDetails setAccessHeadline:](self, "setAccessHeadline:");
  if (*((_QWORD *)v5 + 4))
    -[APPBAdLayoutDetails setAdCopy:](self, "setAdCopy:");
  if (*((_QWORD *)v5 + 1))
    -[APPBAdLayoutDetails setAccessAdCopy:](self, "setAccessAdCopy:");
  if (*((_QWORD *)v5 + 10))
    -[APPBAdLayoutDetails setSponsoredBy:](self, "setSponsoredBy:");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = *((id *)v5 + 7);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        -[APPBAdLayoutDetails addElements:](self, "addElements:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  style = self->_style;
  v12 = *((_QWORD *)v5 + 13);
  if (style)
  {
    if (v12)
      -[APPBStyle mergeFrom:](style, "mergeFrom:");
  }
  else if (v12)
  {
    -[APPBAdLayoutDetails setStyle:](self, "setStyle:");
  }
  if ((*((_BYTE *)v5 + 116) & 1) != 0)
  {
    self->_adFormatType = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v5 + 11))
    -[APPBAdLayoutDetails setSponsoredByAssetURL:](self, "setSponsoredByAssetURL:");
  ctaButton = self->_ctaButton;
  v14 = *((_QWORD *)v5 + 6);
  if (ctaButton)
  {
    if (v14)
      -[APPBButton mergeFrom:](ctaButton, "mergeFrom:");
  }
  else if (v14)
  {
    -[APPBAdLayoutDetails setCtaButton:](self, "setCtaButton:");
  }
  if (*((_QWORD *)v5 + 3))
    -[APPBAdLayoutDetails setActionURL:](self, "setActionURL:");
  if (*((_QWORD *)v5 + 12))
    -[APPBAdLayoutDetails setSponsoredByAssetURLForDarkMode:](self, "setSponsoredByAssetURLForDarkMode:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = *((id *)v5 + 9);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[APPBAdLayoutDetails addLocalizedHeadlines:](self, "addLocalizedHeadlines:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (NSString)headline
{
  return self->_headline;
}

- (void)setHeadline:(id)a3
{
  objc_storeStrong((id *)&self->_headline, a3);
}

- (NSString)accessHeadline
{
  return self->_accessHeadline;
}

- (void)setAccessHeadline:(id)a3
{
  objc_storeStrong((id *)&self->_accessHeadline, a3);
}

- (NSString)adCopy
{
  return self->_adCopy;
}

- (void)setAdCopy:(id)a3
{
  objc_storeStrong((id *)&self->_adCopy, a3);
}

- (NSString)accessAdCopy
{
  return self->_accessAdCopy;
}

- (void)setAccessAdCopy:(id)a3
{
  objc_storeStrong((id *)&self->_accessAdCopy, a3);
}

- (NSString)sponsoredBy
{
  return self->_sponsoredBy;
}

- (void)setSponsoredBy:(id)a3
{
  objc_storeStrong((id *)&self->_sponsoredBy, a3);
}

- (NSMutableArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
  objc_storeStrong((id *)&self->_elements, a3);
}

- (APPBStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (NSString)sponsoredByAssetURL
{
  return self->_sponsoredByAssetURL;
}

- (void)setSponsoredByAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->_sponsoredByAssetURL, a3);
}

- (APPBButton)ctaButton
{
  return self->_ctaButton;
}

- (void)setCtaButton:(id)a3
{
  objc_storeStrong((id *)&self->_ctaButton, a3);
}

- (NSString)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (NSString)sponsoredByAssetURLForDarkMode
{
  return self->_sponsoredByAssetURLForDarkMode;
}

- (void)setSponsoredByAssetURLForDarkMode:(id)a3
{
  objc_storeStrong((id *)&self->_sponsoredByAssetURLForDarkMode, a3);
}

- (NSMutableArray)localizedHeadlines
{
  return self->_localizedHeadlines;
}

- (void)setLocalizedHeadlines:(id)a3
{
  objc_storeStrong((id *)&self->_localizedHeadlines, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_sponsoredByAssetURLForDarkMode, 0);
  objc_storeStrong((id *)&self->_sponsoredByAssetURL, 0);
  objc_storeStrong((id *)&self->_sponsoredBy, 0);
  objc_storeStrong((id *)&self->_localizedHeadlines, 0);
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_ctaButton, 0);
  objc_storeStrong((id *)&self->_adCopy, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_accessHeadline, 0);
  objc_storeStrong((id *)&self->_accessAdCopy, 0);
}

@end
