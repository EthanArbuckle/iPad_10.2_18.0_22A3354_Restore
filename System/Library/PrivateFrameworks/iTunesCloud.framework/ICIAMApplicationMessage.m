@implementation ICIAMApplicationMessage

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)clearTargets
{
  -[NSMutableArray removeAllObjects](self->_targets, "removeAllObjects");
}

- (void)addTarget:(id)a3
{
  id v4;
  NSMutableArray *targets;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  targets = self->_targets;
  v8 = v4;
  if (!targets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_targets;
    self->_targets = v6;

    v4 = v8;
    targets = self->_targets;
  }
  -[NSMutableArray addObject:](targets, "addObject:", v4);

}

- (unint64_t)targetsCount
{
  return -[NSMutableArray count](self->_targets, "count");
}

- (id)targetAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_targets, "objectAtIndex:", a3);
}

- (int)messageType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_messageType;
  else
    return 0;
}

- (void)setMessageType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMessageType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)messageTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 5 && ((0x17u >> a3) & 1) != 0)
  {
    v3 = off_1E4389AF0[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsMessageType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Banner")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Modal")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Native")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Notification")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)carousel
{
  return (*(_WORD *)&self->_has & 0x100) != 0 && self->_carousel;
}

- (void)setCarousel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_carousel = a3;
}

- (void)setHasCarousel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasCarousel
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPriority:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasTemplateURL
{
  return self->_templateURL != 0;
}

- (void)setMaximumDisplays:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_maximumDisplays = a3;
}

- (void)setHasMaximumDisplays:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMaximumDisplays
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setStartDate:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasStartDate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setEndDate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasEndDate
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasCloseButton
{
  return (*(_WORD *)&self->_has & 0x200) == 0 || self->_hasCloseButton;
}

- (void)setHasCloseButton:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_hasCloseButton = a3;
}

- (void)setHasHasCloseButton:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasHasCloseButton
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)clearContentPages
{
  -[NSMutableArray removeAllObjects](self->_contentPages, "removeAllObjects");
}

- (void)addContentPages:(id)a3
{
  id v4;
  NSMutableArray *contentPages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contentPages = self->_contentPages;
  v8 = v4;
  if (!contentPages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contentPages;
    self->_contentPages = v6;

    v4 = v8;
    contentPages = self->_contentPages;
  }
  -[NSMutableArray addObject:](contentPages, "addObject:", v4);

}

- (unint64_t)contentPagesCount
{
  return -[NSMutableArray count](self->_contentPages, "count");
}

- (id)contentPagesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contentPages, "objectAtIndex:", a3);
}

- (BOOL)hasRule
{
  return self->_rule != 0;
}

- (BOOL)hasWebArchiveURL
{
  return self->_webArchiveURL != 0;
}

- (int)modalPresentationStyle
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_modalPresentationStyle;
  else
    return 0;
}

- (void)setModalPresentationStyle:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_modalPresentationStyle = a3;
}

- (void)setHasModalPresentationStyle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasModalPresentationStyle
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)modalPresentationStyleAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Card");
  if (a3 == 1)
  {
    v3 = CFSTR("Fullscreen");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsModalPresentationStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Card")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Fullscreen"));

  return v4;
}

- (int)globalPresentationPolicyGroup
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_globalPresentationPolicyGroup;
  else
    return 0;
}

- (void)setGlobalPresentationPolicyGroup:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_globalPresentationPolicyGroup = a3;
}

- (void)setHasGlobalPresentationPolicyGroup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGlobalPresentationPolicyGroup
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)globalPresentationPolicyGroupAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Normal");
  if (a3 == 1)
  {
    v3 = CFSTR("Restricted");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsGlobalPresentationPolicyGroup:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Normal")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Restricted"));

  return v4;
}

- (int)assetPrefetchStrategy
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_assetPrefetchStrategy;
  else
    return 0;
}

- (void)setAssetPrefetchStrategy:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_assetPrefetchStrategy = a3;
}

- (void)setHasAssetPrefetchStrategy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAssetPrefetchStrategy
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)assetPrefetchStrategyAsString:(int)a3
{
  if (a3 < 3)
    return off_1E4389B18[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAssetPrefetchStrategy:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Immediate")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Never")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasHoldoutEvent
{
  return self->_holdoutEvent != 0;
}

- (BOOL)hasLocalNotification
{
  return self->_localNotification != 0;
}

- (BOOL)hasImpressionEvent
{
  return self->_impressionEvent != 0;
}

- (void)clearPresentationTriggers
{
  -[NSMutableArray removeAllObjects](self->_presentationTriggers, "removeAllObjects");
}

- (void)addPresentationTriggers:(id)a3
{
  id v4;
  NSMutableArray *presentationTriggers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  presentationTriggers = self->_presentationTriggers;
  v8 = v4;
  if (!presentationTriggers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_presentationTriggers;
    self->_presentationTriggers = v6;

    v4 = v8;
    presentationTriggers = self->_presentationTriggers;
  }
  -[NSMutableArray addObject:](presentationTriggers, "addObject:", v4);

}

- (unint64_t)presentationTriggersCount
{
  return -[NSMutableArray count](self->_presentationTriggers, "count");
}

- (id)presentationTriggersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_presentationTriggers, "objectAtIndex:", a3);
}

- (BOOL)hasApplicationBadge
{
  return self->_applicationBadge != 0;
}

- (BOOL)reportingEnabled
{
  return (*(_WORD *)&self->_has & 0x400) == 0 || self->_reportingEnabled;
}

- (void)setReportingEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_reportingEnabled = a3;
}

- (void)setHasReportingEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasReportingEnabled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICIAMApplicationMessage;
  -[ICIAMApplicationMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIAMApplicationMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSMutableArray *targets;
  __int16 has;
  uint64_t messageType;
  __CFString *v9;
  void *v10;
  void *v11;
  NSString *templateURL;
  __int16 v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  ICIAMMessageRule *rule;
  void *v23;
  NSString *webArchiveURL;
  __int16 v25;
  void *v26;
  void *v27;
  void *v28;
  int modalPresentationStyle;
  __CFString *v30;
  int globalPresentationPolicyGroup;
  __CFString *v32;
  uint64_t assetPrefetchStrategy;
  __CFString *v34;
  ICIAMMetricEvent *holdoutEvent;
  void *v36;
  ICIAMLocalNotification *localNotification;
  void *v38;
  ICIAMMetricEvent *impressionEvent;
  void *v40;
  void *v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  ICIAMApplicationBadge *applicationBadge;
  void *v49;
  void *v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  targets = self->_targets;
  if (targets)
    objc_msgSend(v4, "setObject:forKey:", targets, CFSTR("target"));
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    messageType = self->_messageType;
    if (messageType < 5 && ((0x17u >> messageType) & 1) != 0)
    {
      v9 = off_1E4389AF0[messageType];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_messageType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("messageType"));

    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_carousel);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("carousel"));

    has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_priority);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("priority"));

  }
  templateURL = self->_templateURL;
  if (templateURL)
    objc_msgSend(v4, "setObject:forKey:", templateURL, CFSTR("templateURL"));
  v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_maximumDisplays);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("maximumDisplays"));

    v13 = (__int16)self->_has;
    if ((v13 & 2) == 0)
    {
LABEL_19:
      if ((v13 & 1) == 0)
        goto LABEL_20;
      goto LABEL_41;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("startDate"));

  v13 = (__int16)self->_has;
  if ((v13 & 1) == 0)
  {
LABEL_20:
    if ((v13 & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("endDate"));

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasCloseButton);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("hasCloseButton"));

  }
LABEL_22:
  if (-[NSMutableArray count](self->_contentPages, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_contentPages, "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v16 = self->_contentPages;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v57 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("contentPages"));
  }
  rule = self->_rule;
  if (rule)
  {
    -[ICIAMMessageRule dictionaryRepresentation](rule, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("rule"));

  }
  webArchiveURL = self->_webArchiveURL;
  if (webArchiveURL)
    objc_msgSend(v4, "setObject:forKey:", webArchiveURL, CFSTR("webArchiveURL"));
  v25 = (__int16)self->_has;
  if ((v25 & 0x40) != 0)
  {
    modalPresentationStyle = self->_modalPresentationStyle;
    if (modalPresentationStyle)
    {
      if (modalPresentationStyle == 1)
      {
        v30 = CFSTR("Fullscreen");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modalPresentationStyle);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v30 = CFSTR("Card");
    }
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("modalPresentationStyle"));

    v25 = (__int16)self->_has;
    if ((v25 & 8) == 0)
    {
LABEL_37:
      if ((v25 & 4) == 0)
        goto LABEL_59;
      goto LABEL_55;
    }
  }
  else if ((v25 & 8) == 0)
  {
    goto LABEL_37;
  }
  globalPresentationPolicyGroup = self->_globalPresentationPolicyGroup;
  if (globalPresentationPolicyGroup)
  {
    if (globalPresentationPolicyGroup == 1)
    {
      v32 = CFSTR("Restricted");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_globalPresentationPolicyGroup);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v32 = CFSTR("Normal");
  }
  objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("globalPresentationPolicyGroup"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_55:
    assetPrefetchStrategy = self->_assetPrefetchStrategy;
    if (assetPrefetchStrategy >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_assetPrefetchStrategy);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = off_1E4389B18[assetPrefetchStrategy];
    }
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("assetPrefetchStrategy"));

  }
LABEL_59:
  holdoutEvent = self->_holdoutEvent;
  if (holdoutEvent)
  {
    -[ICIAMMetricEvent dictionaryRepresentation](holdoutEvent, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("holdoutEvent"));

  }
  localNotification = self->_localNotification;
  if (localNotification)
  {
    -[ICIAMLocalNotification dictionaryRepresentation](localNotification, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("localNotification"));

  }
  impressionEvent = self->_impressionEvent;
  if (impressionEvent)
  {
    -[ICIAMMetricEvent dictionaryRepresentation](impressionEvent, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("impressionEvent"));

  }
  if (-[NSMutableArray count](self->_presentationTriggers, "count"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_presentationTriggers, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v42 = self->_presentationTriggers;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v53 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "dictionaryRepresentation");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v47);

        }
        v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v44);
    }

    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("presentationTriggers"));
  }
  applicationBadge = self->_applicationBadge;
  if (applicationBadge)
  {
    -[ICIAMApplicationBadge dictionaryRepresentation](applicationBadge, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("applicationBadge"));

  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_reportingEnabled);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("reportingEnabled"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMApplicationMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 has;
  __int16 v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int16 v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = self->_targets;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_12:
      if ((has & 0x80) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_13:
    PBDataWriterWriteInt32Field();
LABEL_14:
  if (self->_templateURL)
    PBDataWriterWriteStringField();
  v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = (__int16)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_18:
      if ((v11 & 1) == 0)
        goto LABEL_19;
      goto LABEL_59;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteDoubleField();
  v11 = (__int16)self->_has;
  if ((v11 & 1) == 0)
  {
LABEL_19:
    if ((v11 & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_59:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
LABEL_20:
    PBDataWriterWriteBOOLField();
LABEL_21:
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = self->_contentPages;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v14);
  }

  if (self->_rule)
    PBDataWriterWriteSubmessage();
  if (self->_webArchiveURL)
    PBDataWriterWriteStringField();
  v17 = (__int16)self->_has;
  if ((v17 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v17 = (__int16)self->_has;
    if ((v17 & 8) == 0)
    {
LABEL_34:
      if ((v17 & 4) == 0)
        goto LABEL_36;
      goto LABEL_35;
    }
  }
  else if ((v17 & 8) == 0)
  {
    goto LABEL_34;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 4) != 0)
LABEL_35:
    PBDataWriterWriteInt32Field();
LABEL_36:
  if (self->_holdoutEvent)
    PBDataWriterWriteSubmessage();
  if (self->_localNotification)
    PBDataWriterWriteSubmessage();
  if (self->_impressionEvent)
    PBDataWriterWriteSubmessage();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = self->_presentationTriggers;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage();
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v20);
  }

  if (self->_applicationBadge)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  __int16 has;
  _DWORD *v9;
  __int16 v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  _DWORD *v15;
  __int16 v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t k;
  void *v20;
  id v21;

  v21 = a3;
  if (self->_identifier)
    objc_msgSend(v21, "setIdentifier:");
  if (-[ICIAMApplicationMessage targetsCount](self, "targetsCount"))
  {
    objc_msgSend(v21, "clearTargets");
    v4 = -[ICIAMApplicationMessage targetsCount](self, "targetsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ICIAMApplicationMessage targetAtIndex:](self, "targetAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addTarget:", v7);

      }
    }
  }
  has = (__int16)self->_has;
  v9 = v21;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v21 + 23) = self->_messageType;
    *((_WORD *)v21 + 78) |= 0x20u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_9;
  }
  *((_BYTE *)v21 + 152) = self->_carousel;
  *((_WORD *)v21 + 78) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_10:
    *((_DWORD *)v21 + 28) = self->_priority;
    *((_WORD *)v21 + 78) |= 0x80u;
  }
LABEL_11:
  if (self->_templateURL)
  {
    objc_msgSend(v21, "setTemplateURL:");
    v9 = v21;
  }
  v10 = (__int16)self->_has;
  if ((v10 & 0x10) != 0)
  {
    v9[22] = self->_maximumDisplays;
    *((_WORD *)v9 + 78) |= 0x10u;
    v10 = (__int16)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_15:
      if ((v10 & 1) == 0)
        goto LABEL_16;
LABEL_50:
      *((_QWORD *)v9 + 1) = *(_QWORD *)&self->_endDate;
      *((_WORD *)v9 + 78) |= 1u;
      if ((*(_WORD *)&self->_has & 0x200) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_15;
  }
  *((_QWORD *)v9 + 2) = *(_QWORD *)&self->_startDate;
  *((_WORD *)v9 + 78) |= 2u;
  v10 = (__int16)self->_has;
  if ((v10 & 1) != 0)
    goto LABEL_50;
LABEL_16:
  if ((v10 & 0x200) != 0)
  {
LABEL_17:
    *((_BYTE *)v9 + 153) = self->_hasCloseButton;
    *((_WORD *)v9 + 78) |= 0x200u;
  }
LABEL_18:
  if (-[ICIAMApplicationMessage contentPagesCount](self, "contentPagesCount"))
  {
    objc_msgSend(v21, "clearContentPages");
    v11 = -[ICIAMApplicationMessage contentPagesCount](self, "contentPagesCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[ICIAMApplicationMessage contentPagesAtIndex:](self, "contentPagesAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addContentPages:", v14);

      }
    }
  }
  if (self->_rule)
    objc_msgSend(v21, "setRule:");
  v15 = v21;
  if (self->_webArchiveURL)
  {
    objc_msgSend(v21, "setWebArchiveURL:");
    v15 = v21;
  }
  v16 = (__int16)self->_has;
  if ((v16 & 0x40) != 0)
  {
    v15[24] = self->_modalPresentationStyle;
    *((_WORD *)v15 + 78) |= 0x40u;
    v16 = (__int16)self->_has;
    if ((v16 & 8) == 0)
    {
LABEL_28:
      if ((v16 & 4) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((v16 & 8) == 0)
  {
    goto LABEL_28;
  }
  v15[12] = self->_globalPresentationPolicyGroup;
  *((_WORD *)v15 + 78) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_29:
    v15[8] = self->_assetPrefetchStrategy;
    *((_WORD *)v15 + 78) |= 4u;
  }
LABEL_30:
  if (self->_holdoutEvent)
    objc_msgSend(v21, "setHoldoutEvent:");
  if (self->_localNotification)
    objc_msgSend(v21, "setLocalNotification:");
  if (self->_impressionEvent)
    objc_msgSend(v21, "setImpressionEvent:");
  if (-[ICIAMApplicationMessage presentationTriggersCount](self, "presentationTriggersCount"))
  {
    objc_msgSend(v21, "clearPresentationTriggers");
    v17 = -[ICIAMApplicationMessage presentationTriggersCount](self, "presentationTriggersCount");
    if (v17)
    {
      v18 = v17;
      for (k = 0; k != v18; ++k)
      {
        -[ICIAMApplicationMessage presentationTriggersAtIndex:](self, "presentationTriggersAtIndex:", k);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addPresentationTriggers:", v20);

      }
    }
  }
  if (self->_applicationBadge)
    objc_msgSend(v21, "setApplicationBadge:");
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_BYTE *)v21 + 154) = self->_reportingEnabled;
    *((_WORD *)v21 + 78) |= 0x400u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int16 has;
  uint64_t v15;
  void *v16;
  __int16 v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int16 v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  id v41;
  void *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v8 = self->_targets;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v53 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTarget:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v10);
  }

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_messageType;
    *(_WORD *)(v5 + 156) |= 0x20u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_10:
      if ((has & 0x80) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_10;
  }
  *(_BYTE *)(v5 + 152) = self->_carousel;
  *(_WORD *)(v5 + 156) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 112) = self->_priority;
    *(_WORD *)(v5 + 156) |= 0x80u;
  }
LABEL_12:
  v15 = -[NSString copyWithZone:](self->_templateURL, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v15;

  v17 = (__int16)self->_has;
  if ((v17 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_maximumDisplays;
    *(_WORD *)(v5 + 156) |= 0x10u;
    v17 = (__int16)self->_has;
    if ((v17 & 2) == 0)
    {
LABEL_14:
      if ((v17 & 1) == 0)
        goto LABEL_15;
      goto LABEL_43;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_14;
  }
  *(double *)(v5 + 16) = self->_startDate;
  *(_WORD *)(v5 + 156) |= 2u;
  v17 = (__int16)self->_has;
  if ((v17 & 1) == 0)
  {
LABEL_15:
    if ((v17 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_43:
  *(double *)(v5 + 8) = self->_endDate;
  *(_WORD *)(v5 + 156) |= 1u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_16:
    *(_BYTE *)(v5 + 153) = self->_hasCloseButton;
    *(_WORD *)(v5 + 156) |= 0x200u;
  }
LABEL_17:
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v18 = self->_contentPages;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v49 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addContentPages:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v20);
  }

  v24 = -[ICIAMMessageRule copyWithZone:](self->_rule, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v24;

  v26 = -[NSString copyWithZone:](self->_webArchiveURL, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v26;

  v28 = (__int16)self->_has;
  if ((v28 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_modalPresentationStyle;
    *(_WORD *)(v5 + 156) |= 0x40u;
    v28 = (__int16)self->_has;
    if ((v28 & 8) == 0)
    {
LABEL_26:
      if ((v28 & 4) == 0)
        goto LABEL_28;
      goto LABEL_27;
    }
  }
  else if ((v28 & 8) == 0)
  {
    goto LABEL_26;
  }
  *(_DWORD *)(v5 + 48) = self->_globalPresentationPolicyGroup;
  *(_WORD *)(v5 + 156) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_27:
    *(_DWORD *)(v5 + 32) = self->_assetPrefetchStrategy;
    *(_WORD *)(v5 + 156) |= 4u;
  }
LABEL_28:
  v29 = -[ICIAMMetricEvent copyWithZone:](self->_holdoutEvent, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v29;

  v31 = -[ICIAMLocalNotification copyWithZone:](self->_localNotification, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v31;

  v33 = -[ICIAMMetricEvent copyWithZone:](self->_impressionEvent, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v33;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v35 = self->_presentationTriggers;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v45;
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v45 != v38)
          objc_enumerationMutation(v35);
        v40 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v44);
        objc_msgSend((id)v5, "addPresentationTriggers:", v40);

      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v37);
  }

  v41 = -[ICIAMApplicationBadge copyWithZone:](self->_applicationBadge, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v41;

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 154) = self->_reportingEnabled;
    *(_WORD *)(v5 + 156) |= 0x400u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSMutableArray *targets;
  __int16 has;
  __int16 v8;
  NSString *templateURL;
  NSMutableArray *contentPages;
  ICIAMMessageRule *rule;
  NSString *webArchiveURL;
  __int16 v13;
  __int16 v14;
  ICIAMMetricEvent *holdoutEvent;
  ICIAMLocalNotification *localNotification;
  ICIAMMetricEvent *impressionEvent;
  NSMutableArray *presentationTriggers;
  ICIAMApplicationBadge *applicationBadge;
  BOOL v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_84;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_84;
  }
  targets = self->_targets;
  if ((unint64_t)targets | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](targets, "isEqual:"))
      goto LABEL_84;
  }
  has = (__int16)self->_has;
  v8 = *((_WORD *)v4 + 78);
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_messageType != *((_DWORD *)v4 + 23))
      goto LABEL_84;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 78) & 0x100) == 0)
      goto LABEL_84;
    if (self->_carousel)
    {
      if (!*((_BYTE *)v4 + 152))
        goto LABEL_84;
    }
    else if (*((_BYTE *)v4 + 152))
    {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 78) & 0x100) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_priority != *((_DWORD *)v4 + 28))
      goto LABEL_84;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_84;
  }
  templateURL = self->_templateURL;
  if ((unint64_t)templateURL | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](templateURL, "isEqual:"))
      goto LABEL_84;
    has = (__int16)self->_has;
    v8 = *((_WORD *)v4 + 78);
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_maximumDisplays != *((_DWORD *)v4 + 22))
      goto LABEL_84;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_startDate != *((double *)v4 + 2))
      goto LABEL_84;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_endDate != *((double *)v4 + 1))
      goto LABEL_84;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0)
      goto LABEL_84;
    if (self->_hasCloseButton)
    {
      if (!*((_BYTE *)v4 + 153))
        goto LABEL_84;
    }
    else if (*((_BYTE *)v4 + 153))
    {
      goto LABEL_84;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_84;
  }
  contentPages = self->_contentPages;
  if ((unint64_t)contentPages | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](contentPages, "isEqual:"))
  {
    goto LABEL_84;
  }
  rule = self->_rule;
  if ((unint64_t)rule | *((_QWORD *)v4 + 15))
  {
    if (!-[ICIAMMessageRule isEqual:](rule, "isEqual:"))
      goto LABEL_84;
  }
  webArchiveURL = self->_webArchiveURL;
  if ((unint64_t)webArchiveURL | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](webArchiveURL, "isEqual:"))
      goto LABEL_84;
  }
  v13 = (__int16)self->_has;
  v14 = *((_WORD *)v4 + 78);
  if ((v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_modalPresentationStyle != *((_DWORD *)v4 + 24))
      goto LABEL_84;
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_84;
  }
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_globalPresentationPolicyGroup != *((_DWORD *)v4 + 12))
      goto LABEL_84;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_84;
  }
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_assetPrefetchStrategy != *((_DWORD *)v4 + 8))
      goto LABEL_84;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_84;
  }
  holdoutEvent = self->_holdoutEvent;
  if ((unint64_t)holdoutEvent | *((_QWORD *)v4 + 7) && !-[ICIAMMetricEvent isEqual:](holdoutEvent, "isEqual:"))
    goto LABEL_84;
  localNotification = self->_localNotification;
  if ((unint64_t)localNotification | *((_QWORD *)v4 + 10))
  {
    if (!-[ICIAMLocalNotification isEqual:](localNotification, "isEqual:"))
      goto LABEL_84;
  }
  impressionEvent = self->_impressionEvent;
  if ((unint64_t)impressionEvent | *((_QWORD *)v4 + 9))
  {
    if (!-[ICIAMMetricEvent isEqual:](impressionEvent, "isEqual:"))
      goto LABEL_84;
  }
  presentationTriggers = self->_presentationTriggers;
  if ((unint64_t)presentationTriggers | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](presentationTriggers, "isEqual:"))
      goto LABEL_84;
  }
  applicationBadge = self->_applicationBadge;
  if ((unint64_t)applicationBadge | *((_QWORD *)v4 + 3))
  {
    if (!-[ICIAMApplicationBadge isEqual:](applicationBadge, "isEqual:"))
      goto LABEL_84;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 78) & 0x400) != 0)
    {
      if (self->_reportingEnabled)
      {
        if (!*((_BYTE *)v4 + 154))
          goto LABEL_84;
      }
      else if (*((_BYTE *)v4 + 154))
      {
        goto LABEL_84;
      }
      v20 = 1;
      goto LABEL_85;
    }
LABEL_84:
    v20 = 0;
    goto LABEL_85;
  }
  v20 = (*((_WORD *)v4 + 78) & 0x400) == 0;
LABEL_85:

  return v20;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  double startDate;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double endDate;
  double v12;
  long double v13;
  double v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  NSUInteger v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSUInteger v38;

  v38 = -[NSString hash](self->_identifier, "hash");
  v37 = -[NSMutableArray hash](self->_targets, "hash");
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
    v36 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_3;
LABEL_6:
    v35 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v36 = 2654435761 * self->_messageType;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_6;
LABEL_3:
  v35 = 2654435761 * self->_carousel;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v34 = 2654435761 * self->_priority;
    goto LABEL_8;
  }
LABEL_7:
  v34 = 0;
LABEL_8:
  v33 = -[NSString hash](self->_templateURL, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x10) != 0)
  {
    v32 = 2654435761 * self->_maximumDisplays;
    if ((v4 & 2) != 0)
      goto LABEL_10;
LABEL_15:
    v9 = 0;
    goto LABEL_18;
  }
  v32 = 0;
  if ((v4 & 2) == 0)
    goto LABEL_15;
LABEL_10:
  startDate = self->_startDate;
  v6 = -startDate;
  if (startDate >= 0.0)
    v6 = self->_startDate;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_18:
  if ((v4 & 1) != 0)
  {
    endDate = self->_endDate;
    v12 = -endDate;
    if (endDate >= 0.0)
      v12 = self->_endDate;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v30 = v10;
  if ((v4 & 0x200) != 0)
    v29 = 2654435761 * self->_hasCloseButton;
  else
    v29 = 0;
  v31 = v9;
  v28 = -[NSMutableArray hash](self->_contentPages, "hash");
  v27 = -[ICIAMMessageRule hash](self->_rule, "hash");
  v26 = -[NSString hash](self->_webArchiveURL, "hash");
  v15 = (__int16)self->_has;
  if ((v15 & 0x40) == 0)
  {
    v16 = 0;
    if ((v15 & 8) != 0)
      goto LABEL_31;
LABEL_34:
    v17 = 0;
    if ((v15 & 4) != 0)
      goto LABEL_32;
    goto LABEL_35;
  }
  v16 = 2654435761 * self->_modalPresentationStyle;
  if ((v15 & 8) == 0)
    goto LABEL_34;
LABEL_31:
  v17 = 2654435761 * self->_globalPresentationPolicyGroup;
  if ((v15 & 4) != 0)
  {
LABEL_32:
    v18 = 2654435761 * self->_assetPrefetchStrategy;
    goto LABEL_36;
  }
LABEL_35:
  v18 = 0;
LABEL_36:
  v19 = -[ICIAMMetricEvent hash](self->_holdoutEvent, "hash");
  v20 = -[ICIAMLocalNotification hash](self->_localNotification, "hash");
  v21 = -[ICIAMMetricEvent hash](self->_impressionEvent, "hash");
  v22 = -[NSMutableArray hash](self->_presentationTriggers, "hash");
  v23 = -[ICIAMApplicationBadge hash](self->_applicationBadge, "hash");
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    v24 = 2654435761 * self->_reportingEnabled;
  else
    v24 = 0;
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 v10;
  __int16 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  ICIAMMessageRule *rule;
  uint64_t v18;
  __int16 v19;
  ICIAMMetricEvent *holdoutEvent;
  uint64_t v21;
  ICIAMLocalNotification *localNotification;
  uint64_t v23;
  ICIAMMetricEvent *impressionEvent;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  ICIAMApplicationBadge *applicationBadge;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 8))
    -[ICIAMApplicationMessage setIdentifier:](self, "setIdentifier:");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = *((id *)v4 + 16);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        -[ICIAMApplicationMessage addTarget:](self, "addTarget:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v7);
  }

  v10 = *((_WORD *)v4 + 78);
  if ((v10 & 0x20) != 0)
  {
    self->_messageType = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_has |= 0x20u;
    v10 = *((_WORD *)v4 + 78);
    if ((v10 & 0x100) == 0)
    {
LABEL_12:
      if ((v10 & 0x80) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*((_WORD *)v4 + 78) & 0x100) == 0)
  {
    goto LABEL_12;
  }
  self->_carousel = *((_BYTE *)v4 + 152);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 78) & 0x80) != 0)
  {
LABEL_13:
    self->_priority = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 17))
    -[ICIAMApplicationMessage setTemplateURL:](self, "setTemplateURL:");
  v11 = *((_WORD *)v4 + 78);
  if ((v11 & 0x10) != 0)
  {
    self->_maximumDisplays = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x10u;
    v11 = *((_WORD *)v4 + 78);
    if ((v11 & 2) == 0)
    {
LABEL_18:
      if ((v11 & 1) == 0)
        goto LABEL_19;
      goto LABEL_36;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_18;
  }
  self->_startDate = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v11 = *((_WORD *)v4 + 78);
  if ((v11 & 1) == 0)
  {
LABEL_19:
    if ((v11 & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_36:
  self->_endDate = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 78) & 0x200) != 0)
  {
LABEL_20:
    self->_hasCloseButton = *((_BYTE *)v4 + 153);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_21:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = *((id *)v4 + 5);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v12);
        -[ICIAMApplicationMessage addContentPages:](self, "addContentPages:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v14);
  }

  rule = self->_rule;
  v18 = *((_QWORD *)v4 + 15);
  if (rule)
  {
    if (v18)
      -[ICIAMMessageRule mergeFrom:](rule, "mergeFrom:");
  }
  else if (v18)
  {
    -[ICIAMApplicationMessage setRule:](self, "setRule:");
  }
  if (*((_QWORD *)v4 + 18))
    -[ICIAMApplicationMessage setWebArchiveURL:](self, "setWebArchiveURL:");
  v19 = *((_WORD *)v4 + 78);
  if ((v19 & 0x40) != 0)
  {
    self->_modalPresentationStyle = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x40u;
    v19 = *((_WORD *)v4 + 78);
    if ((v19 & 8) == 0)
    {
LABEL_44:
      if ((v19 & 4) == 0)
        goto LABEL_46;
      goto LABEL_45;
    }
  }
  else if ((v19 & 8) == 0)
  {
    goto LABEL_44;
  }
  self->_globalPresentationPolicyGroup = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 78) & 4) != 0)
  {
LABEL_45:
    self->_assetPrefetchStrategy = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_46:
  holdoutEvent = self->_holdoutEvent;
  v21 = *((_QWORD *)v4 + 7);
  if (holdoutEvent)
  {
    if (v21)
      -[ICIAMMetricEvent mergeFrom:](holdoutEvent, "mergeFrom:");
  }
  else if (v21)
  {
    -[ICIAMApplicationMessage setHoldoutEvent:](self, "setHoldoutEvent:");
  }
  localNotification = self->_localNotification;
  v23 = *((_QWORD *)v4 + 10);
  if (localNotification)
  {
    if (v23)
      -[ICIAMLocalNotification mergeFrom:](localNotification, "mergeFrom:");
  }
  else if (v23)
  {
    -[ICIAMApplicationMessage setLocalNotification:](self, "setLocalNotification:");
  }
  impressionEvent = self->_impressionEvent;
  v25 = *((_QWORD *)v4 + 9);
  if (impressionEvent)
  {
    if (v25)
      -[ICIAMMetricEvent mergeFrom:](impressionEvent, "mergeFrom:");
  }
  else if (v25)
  {
    -[ICIAMApplicationMessage setImpressionEvent:](self, "setImpressionEvent:");
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = *((id *)v4 + 13);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v26);
        -[ICIAMApplicationMessage addPresentationTriggers:](self, "addPresentationTriggers:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k), (_QWORD)v33);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v28);
  }

  applicationBadge = self->_applicationBadge;
  v32 = *((_QWORD *)v4 + 3);
  if (applicationBadge)
  {
    if (v32)
      -[ICIAMApplicationBadge mergeFrom:](applicationBadge, "mergeFrom:");
  }
  else if (v32)
  {
    -[ICIAMApplicationMessage setApplicationBadge:](self, "setApplicationBadge:");
  }
  if ((*((_WORD *)v4 + 78) & 0x400) != 0)
  {
    self->_reportingEnabled = *((_BYTE *)v4 + 154);
    *(_WORD *)&self->_has |= 0x400u;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSMutableArray)targets
{
  return self->_targets;
}

- (void)setTargets:(id)a3
{
  objc_storeStrong((id *)&self->_targets, a3);
}

- (int)priority
{
  return self->_priority;
}

- (NSString)templateURL
{
  return self->_templateURL;
}

- (void)setTemplateURL:(id)a3
{
  objc_storeStrong((id *)&self->_templateURL, a3);
}

- (int)maximumDisplays
{
  return self->_maximumDisplays;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (NSMutableArray)contentPages
{
  return self->_contentPages;
}

- (void)setContentPages:(id)a3
{
  objc_storeStrong((id *)&self->_contentPages, a3);
}

- (ICIAMMessageRule)rule
{
  return self->_rule;
}

- (void)setRule:(id)a3
{
  objc_storeStrong((id *)&self->_rule, a3);
}

- (NSString)webArchiveURL
{
  return self->_webArchiveURL;
}

- (void)setWebArchiveURL:(id)a3
{
  objc_storeStrong((id *)&self->_webArchiveURL, a3);
}

- (ICIAMMetricEvent)holdoutEvent
{
  return self->_holdoutEvent;
}

- (void)setHoldoutEvent:(id)a3
{
  objc_storeStrong((id *)&self->_holdoutEvent, a3);
}

- (ICIAMLocalNotification)localNotification
{
  return self->_localNotification;
}

- (void)setLocalNotification:(id)a3
{
  objc_storeStrong((id *)&self->_localNotification, a3);
}

- (ICIAMMetricEvent)impressionEvent
{
  return self->_impressionEvent;
}

- (void)setImpressionEvent:(id)a3
{
  objc_storeStrong((id *)&self->_impressionEvent, a3);
}

- (NSMutableArray)presentationTriggers
{
  return self->_presentationTriggers;
}

- (void)setPresentationTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_presentationTriggers, a3);
}

- (ICIAMApplicationBadge)applicationBadge
{
  return self->_applicationBadge;
}

- (void)setApplicationBadge:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBadge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webArchiveURL, 0);
  objc_storeStrong((id *)&self->_templateURL, 0);
  objc_storeStrong((id *)&self->_targets, 0);
  objc_storeStrong((id *)&self->_rule, 0);
  objc_storeStrong((id *)&self->_presentationTriggers, 0);
  objc_storeStrong((id *)&self->_localNotification, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_holdoutEvent, 0);
  objc_storeStrong((id *)&self->_contentPages, 0);
  objc_storeStrong((id *)&self->_applicationBadge, 0);
}

+ (Class)targetType
{
  return (Class)objc_opt_class();
}

+ (Class)contentPagesType
{
  return (Class)objc_opt_class();
}

+ (Class)presentationTriggersType
{
  return (Class)objc_opt_class();
}

@end
