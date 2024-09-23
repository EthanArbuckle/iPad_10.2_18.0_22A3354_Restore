@implementation _SFPBCard

- (_SFPBCard)initWithFacade:(id)a3
{
  id v4;
  _SFPBCard *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _SFPBCardSection *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  _SFPBAbstractCommand *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _SFPBURL *v37;
  void *v38;
  _SFPBURL *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  _SFPBNamedProtobufMessage *v53;
  void *v54;
  _SFPBImage *v55;
  void *v56;
  _SFPBImage *v57;
  void *v58;
  _SFPBColor *v59;
  void *v60;
  _SFPBColor *v61;
  void *v62;
  _SFPBDrillDownMetadata *v63;
  void *v64;
  _SFPBDrillDownMetadata *v65;
  void *v66;
  _SFPBDrillDownMetadata *v67;
  void *v68;
  _SFPBDrillDownMetadata *v69;
  void *v70;
  _SFPBImage *v71;
  void *v72;
  _SFPBImage *v73;
  _SFPBCard *v74;
  _SFPBCard *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBCard init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCard setTitle:](v5, "setTitle:", v7);

    }
    if (objc_msgSend(v4, "hasType"))
      -[_SFPBCard setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "cardSections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v5;
    if (v8)
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v9 = 0;

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    objc_msgSend(v4, "cardSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v86 != v13)
            objc_enumerationMutation(v10);
          v15 = -[_SFPBCardSection initWithFacade:]([_SFPBCardSection alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i));
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
      }
      while (v12);
    }

    -[_SFPBCard setCardSections:](v5, "setCardSections:", v9);
    objc_msgSend(v4, "intentMessageData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "intentMessageData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCard setIntentMessageData:](v5, "setIntentMessageData:", v17);

    }
    objc_msgSend(v4, "intentMessageName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "intentMessageName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCard setIntentMessageName:](v5, "setIntentMessageName:", v19);

    }
    objc_msgSend(v4, "intentResponseMessageData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "intentResponseMessageData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCard setIntentResponseMessageData:](v5, "setIntentResponseMessageData:", v21);

    }
    objc_msgSend(v4, "intentResponseMessageName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "intentResponseMessageName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCard setIntentResponseMessageName:](v5, "setIntentResponseMessageName:", v23);

    }
    objc_msgSend(v4, "dismissalCommands");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v25 = 0;

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    objc_msgSend(v4, "dismissalCommands");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v82;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v82 != v29)
            objc_enumerationMutation(v26);
          v31 = -[_SFPBAbstractCommand initWithFacade:]([_SFPBAbstractCommand alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j));
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
      }
      while (v28);
    }

    -[_SFPBCard setDismissalCommands:](v76, "setDismissalCommands:", v25);
    objc_msgSend(v4, "cardId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "cardId");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCard setCardId:](v76, "setCardId:", v33);

    }
    objc_msgSend(v4, "contextReferenceIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v4, "contextReferenceIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCard setContextReferenceIdentifier:](v76, "setContextReferenceIdentifier:", v35);

    }
    objc_msgSend(v4, "urlValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = [_SFPBURL alloc];
      objc_msgSend(v4, "urlValue");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[_SFPBURL initWithNSURL:](v37, "initWithNSURL:", v38);
      -[_SFPBCard setUrlValue:](v76, "setUrlValue:", v39);

    }
    if (objc_msgSend(v4, "hasSource"))
      -[_SFPBCard setSource:](v76, "setSource:", objc_msgSend(v4, "source"));
    objc_msgSend(v4, "entityIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v4, "entityIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCard setEntityIdentifier:](v76, "setEntityIdentifier:", v41);

    }
    objc_msgSend(v4, "resultIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v4, "resultIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCard setResultIdentifier:](v76, "setResultIdentifier:", v43);

    }
    if (objc_msgSend(v4, "hasQueryId"))
      -[_SFPBCard setQueryId:](v76, "setQueryId:", objc_msgSend(v4, "queryId"));
    objc_msgSend(v4, "fbr");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v4, "fbr");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCard setFbr:](v76, "setFbr:", v45);

    }
    if (objc_msgSend(v4, "hasFlexibleSectionOrder"))
      -[_SFPBCard setFlexibleSectionOrder:](v76, "setFlexibleSectionOrder:", objc_msgSend(v4, "flexibleSectionOrder"));
    objc_msgSend(v4, "entityProtobufMessages");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
      v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v47 = 0;

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    objc_msgSend(v4, "entityProtobufMessages");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v78 != v51)
            objc_enumerationMutation(v48);
          v53 = -[_SFPBNamedProtobufMessage initWithFacade:]([_SFPBNamedProtobufMessage alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k));
          if (v53)
            objc_msgSend(v47, "addObject:", v53);

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      }
      while (v50);
    }

    v5 = v76;
    -[_SFPBCard setEntityProtobufMessages:](v76, "setEntityProtobufMessages:", v47);
    objc_msgSend(v4, "titleImage");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v55 = [_SFPBImage alloc];
      objc_msgSend(v4, "titleImage");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[_SFPBImage initWithFacade:](v55, "initWithFacade:", v56);
      -[_SFPBCard setTitleImage:](v76, "setTitleImage:", v57);

    }
    objc_msgSend(v4, "backgroundColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      v59 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = -[_SFPBColor initWithFacade:](v59, "initWithFacade:", v60);
      -[_SFPBCard setBackgroundColor:](v76, "setBackgroundColor:", v61);

    }
    objc_msgSend(v4, "metadata");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      v63 = [_SFPBDrillDownMetadata alloc];
      objc_msgSend(v4, "metadata");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = -[_SFPBDrillDownMetadata initWithFacade:](v63, "initWithFacade:", v64);
      -[_SFPBCard setMetadata:](v76, "setMetadata:", v65);

    }
    objc_msgSend(v4, "drilldownMetadata");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      v67 = [_SFPBDrillDownMetadata alloc];
      objc_msgSend(v4, "drilldownMetadata");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = -[_SFPBDrillDownMetadata initWithFacade:](v67, "initWithFacade:", v68);
      -[_SFPBCard setDrilldownMetadata:](v76, "setDrilldownMetadata:", v69);

    }
    objc_msgSend(v4, "backgroundImage");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      v71 = [_SFPBImage alloc];
      objc_msgSend(v4, "backgroundImage");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = -[_SFPBImage initWithFacade:](v71, "initWithFacade:", v72);
      -[_SFPBCard setBackgroundImage:](v76, "setBackgroundImage:", v73);

    }
    v74 = v76;

  }
  return v5;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setCardSections:(id)a3
{
  NSArray *v4;
  NSArray *cardSections;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  cardSections = self->_cardSections;
  self->_cardSections = v4;

}

- (void)clearCardSections
{
  -[NSArray removeAllObjects](self->_cardSections, "removeAllObjects");
}

- (void)addCardSections:(id)a3
{
  id v4;
  NSArray *cardSections;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  cardSections = self->_cardSections;
  v8 = v4;
  if (!cardSections)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cardSections;
    self->_cardSections = v6;

    v4 = v8;
    cardSections = self->_cardSections;
  }
  -[NSArray addObject:](cardSections, "addObject:", v4);

}

- (unint64_t)cardSectionsCount
{
  return -[NSArray count](self->_cardSections, "count");
}

- (id)cardSectionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_cardSections, "objectAtIndexedSubscript:", a3);
}

- (void)setIntentMessageData:(id)a3
{
  NSData *v4;
  NSData *intentMessageData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  intentMessageData = self->_intentMessageData;
  self->_intentMessageData = v4;

}

- (void)setIntentMessageName:(id)a3
{
  NSString *v4;
  NSString *intentMessageName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  intentMessageName = self->_intentMessageName;
  self->_intentMessageName = v4;

}

- (void)setIntentResponseMessageData:(id)a3
{
  NSData *v4;
  NSData *intentResponseMessageData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  intentResponseMessageData = self->_intentResponseMessageData;
  self->_intentResponseMessageData = v4;

}

- (void)setIntentResponseMessageName:(id)a3
{
  NSString *v4;
  NSString *intentResponseMessageName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  intentResponseMessageName = self->_intentResponseMessageName;
  self->_intentResponseMessageName = v4;

}

- (void)setDismissalCommands:(id)a3
{
  NSArray *v4;
  NSArray *dismissalCommands;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  dismissalCommands = self->_dismissalCommands;
  self->_dismissalCommands = v4;

}

- (void)clearDismissalCommands
{
  -[NSArray removeAllObjects](self->_dismissalCommands, "removeAllObjects");
}

- (void)addDismissalCommands:(id)a3
{
  id v4;
  NSArray *dismissalCommands;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  dismissalCommands = self->_dismissalCommands;
  v8 = v4;
  if (!dismissalCommands)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_dismissalCommands;
    self->_dismissalCommands = v6;

    v4 = v8;
    dismissalCommands = self->_dismissalCommands;
  }
  -[NSArray addObject:](dismissalCommands, "addObject:", v4);

}

- (unint64_t)dismissalCommandsCount
{
  return -[NSArray count](self->_dismissalCommands, "count");
}

- (id)dismissalCommandsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_dismissalCommands, "objectAtIndexedSubscript:", a3);
}

- (void)setCardId:(id)a3
{
  NSString *v4;
  NSString *cardId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  cardId = self->_cardId;
  self->_cardId = v4;

}

- (void)setContextReferenceIdentifier:(id)a3
{
  NSString *v4;
  NSString *contextReferenceIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contextReferenceIdentifier = self->_contextReferenceIdentifier;
  self->_contextReferenceIdentifier = v4;

}

- (void)setUrlValue:(id)a3
{
  objc_storeStrong((id *)&self->_urlValue, a3);
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (void)setEntityIdentifier:(id)a3
{
  NSData *v4;
  NSData *entityIdentifier;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  entityIdentifier = self->_entityIdentifier;
  self->_entityIdentifier = v4;

}

- (void)setResultIdentifier:(id)a3
{
  NSString *v4;
  NSString *resultIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  resultIdentifier = self->_resultIdentifier;
  self->_resultIdentifier = v4;

}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (void)setFbr:(id)a3
{
  NSString *v4;
  NSString *fbr;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  fbr = self->_fbr;
  self->_fbr = v4;

}

- (void)setFlexibleSectionOrder:(BOOL)a3
{
  self->_flexibleSectionOrder = a3;
}

- (void)setEntityProtobufMessages:(id)a3
{
  NSArray *v4;
  NSArray *entityProtobufMessages;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  entityProtobufMessages = self->_entityProtobufMessages;
  self->_entityProtobufMessages = v4;

}

- (void)clearEntityProtobufMessages
{
  -[NSArray removeAllObjects](self->_entityProtobufMessages, "removeAllObjects");
}

- (void)addEntityProtobufMessages:(id)a3
{
  id v4;
  NSArray *entityProtobufMessages;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  entityProtobufMessages = self->_entityProtobufMessages;
  v8 = v4;
  if (!entityProtobufMessages)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_entityProtobufMessages;
    self->_entityProtobufMessages = v6;

    v4 = v8;
    entityProtobufMessages = self->_entityProtobufMessages;
  }
  -[NSArray addObject:](entityProtobufMessages, "addObject:", v4);

}

- (unint64_t)entityProtobufMessagesCount
{
  return -[NSArray count](self->_entityProtobufMessages, "count");
}

- (id)entityProtobufMessagesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_entityProtobufMessages, "objectAtIndexedSubscript:", a3);
}

- (void)setTitleImage:(id)a3
{
  objc_storeStrong((id *)&self->_titleImage, a3);
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)setDrilldownMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_drilldownMetadata, a3);
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCardReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
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
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBCard title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  if (-[_SFPBCard type](self, "type"))
    PBDataWriterWriteInt32Field();
  -[_SFPBCard cardSections](self, "cardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v8);
  }

  -[_SFPBCard intentMessageData](self, "intentMessageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteDataField();

  -[_SFPBCard intentMessageName](self, "intentMessageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  -[_SFPBCard intentResponseMessageData](self, "intentResponseMessageData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteDataField();

  -[_SFPBCard intentResponseMessageName](self, "intentResponseMessageName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteStringField();

  -[_SFPBCard dismissalCommands](self, "dismissalCommands");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v41;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v17);
  }

  -[_SFPBCard cardId](self, "cardId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteStringField();

  -[_SFPBCard contextReferenceIdentifier](self, "contextReferenceIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    PBDataWriterWriteStringField();

  -[_SFPBCard urlValue](self, "urlValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBCard source](self, "source"))
    PBDataWriterWriteInt32Field();
  -[_SFPBCard entityIdentifier](self, "entityIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    PBDataWriterWriteDataField();

  -[_SFPBCard resultIdentifier](self, "resultIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    PBDataWriterWriteStringField();

  if (-[_SFPBCard queryId](self, "queryId"))
    PBDataWriterWriteUint64Field();
  -[_SFPBCard fbr](self, "fbr");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    PBDataWriterWriteStringField();

  if (-[_SFPBCard flexibleSectionOrder](self, "flexibleSectionOrder"))
    PBDataWriterWriteBOOLField();
  -[_SFPBCard entityProtobufMessages](self, "entityProtobufMessages");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v37;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteSubmessage();
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v28);
  }

  -[_SFPBCard titleImage](self, "titleImage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    PBDataWriterWriteSubmessage();

  -[_SFPBCard backgroundColor](self, "backgroundColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    PBDataWriterWriteSubmessage();

  -[_SFPBCard metadata](self, "metadata");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    PBDataWriterWriteSubmessage();

  -[_SFPBCard drilldownMetadata](self, "drilldownMetadata");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    PBDataWriterWriteSubmessage();

  -[_SFPBCard backgroundImage](self, "backgroundImage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int type;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  int source;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  unint64_t queryId;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  int flexibleSectionOrder;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  char v105;
  BOOL v106;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_101;
  -[_SFPBCard title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard title](self, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBCard title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_101;
  }
  else
  {

  }
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_101;
  -[_SFPBCard cardSections](self, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard cardSections](self, "cardSections");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_SFPBCard cardSections](self, "cardSections");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard intentMessageData](self, "intentMessageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMessageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard intentMessageData](self, "intentMessageData");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[_SFPBCard intentMessageData](self, "intentMessageData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMessageData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard intentMessageName](self, "intentMessageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMessageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard intentMessageName](self, "intentMessageName");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_SFPBCard intentMessageName](self, "intentMessageName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMessageName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard intentResponseMessageData](self, "intentResponseMessageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentResponseMessageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard intentResponseMessageData](self, "intentResponseMessageData");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[_SFPBCard intentResponseMessageData](self, "intentResponseMessageData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentResponseMessageData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard intentResponseMessageName](self, "intentResponseMessageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentResponseMessageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard intentResponseMessageName](self, "intentResponseMessageName");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[_SFPBCard intentResponseMessageName](self, "intentResponseMessageName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentResponseMessageName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard dismissalCommands](self, "dismissalCommands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissalCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard dismissalCommands](self, "dismissalCommands");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[_SFPBCard dismissalCommands](self, "dismissalCommands");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissalCommands");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard cardId](self, "cardId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard cardId](self, "cardId");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[_SFPBCard cardId](self, "cardId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardId");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard contextReferenceIdentifier](self, "contextReferenceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextReferenceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard contextReferenceIdentifier](self, "contextReferenceIdentifier");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[_SFPBCard contextReferenceIdentifier](self, "contextReferenceIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextReferenceIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard urlValue](self, "urlValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard urlValue](self, "urlValue");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[_SFPBCard urlValue](self, "urlValue");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlValue");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_101;
  }
  else
  {

  }
  source = self->_source;
  if (source != objc_msgSend(v4, "source"))
    goto LABEL_101;
  -[_SFPBCard entityIdentifier](self, "entityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard entityIdentifier](self, "entityIdentifier");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    -[_SFPBCard entityIdentifier](self, "entityIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "isEqual:", v62);

    if (!v63)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard resultIdentifier](self, "resultIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard resultIdentifier](self, "resultIdentifier");
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = (void *)v64;
    -[_SFPBCard resultIdentifier](self, "resultIdentifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultIdentifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "isEqual:", v67);

    if (!v68)
      goto LABEL_101;
  }
  else
  {

  }
  queryId = self->_queryId;
  if (queryId != objc_msgSend(v4, "queryId"))
    goto LABEL_101;
  -[_SFPBCard fbr](self, "fbr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fbr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard fbr](self, "fbr");
  v70 = objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    v71 = (void *)v70;
    -[_SFPBCard fbr](self, "fbr");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fbr");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v72, "isEqual:", v73);

    if (!v74)
      goto LABEL_101;
  }
  else
  {

  }
  flexibleSectionOrder = self->_flexibleSectionOrder;
  if (flexibleSectionOrder != objc_msgSend(v4, "flexibleSectionOrder"))
    goto LABEL_101;
  -[_SFPBCard entityProtobufMessages](self, "entityProtobufMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityProtobufMessages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard entityProtobufMessages](self, "entityProtobufMessages");
  v76 = objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    v77 = (void *)v76;
    -[_SFPBCard entityProtobufMessages](self, "entityProtobufMessages");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityProtobufMessages");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v78, "isEqual:", v79);

    if (!v80)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard titleImage](self, "titleImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard titleImage](self, "titleImage");
  v81 = objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    v82 = (void *)v81;
    -[_SFPBCard titleImage](self, "titleImage");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleImage");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v83, "isEqual:", v84);

    if (!v85)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard backgroundColor](self, "backgroundColor");
  v86 = objc_claimAutoreleasedReturnValue();
  if (v86)
  {
    v87 = (void *)v86;
    -[_SFPBCard backgroundColor](self, "backgroundColor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v88, "isEqual:", v89);

    if (!v90)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard metadata](self, "metadata");
  v91 = objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    v92 = (void *)v91;
    -[_SFPBCard metadata](self, "metadata");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v93, "isEqual:", v94);

    if (!v95)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard drilldownMetadata](self, "drilldownMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drilldownMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_100;
  -[_SFPBCard drilldownMetadata](self, "drilldownMetadata");
  v96 = objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    v97 = (void *)v96;
    -[_SFPBCard drilldownMetadata](self, "drilldownMetadata");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "drilldownMetadata");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v98, "isEqual:", v99);

    if (!v100)
      goto LABEL_101;
  }
  else
  {

  }
  -[_SFPBCard backgroundImage](self, "backgroundImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_100:

    goto LABEL_101;
  }
  -[_SFPBCard backgroundImage](self, "backgroundImage");
  v101 = objc_claimAutoreleasedReturnValue();
  if (!v101)
  {

LABEL_104:
    v106 = 1;
    goto LABEL_102;
  }
  v102 = (void *)v101;
  -[_SFPBCard backgroundImage](self, "backgroundImage");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundImage");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v103, "isEqual:", v104);

  if ((v105 & 1) != 0)
    goto LABEL_104;
LABEL_101:
  v106 = 0;
LABEL_102:

  return v106;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  NSUInteger v21;
  uint64_t v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSUInteger v27;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = 2654435761;
  v26 = 2654435761 * self->_type;
  v27 = v3;
  v25 = -[NSArray hash](self->_cardSections, "hash");
  v24 = -[NSData hash](self->_intentMessageData, "hash");
  v23 = -[NSString hash](self->_intentMessageName, "hash");
  v22 = -[NSData hash](self->_intentResponseMessageData, "hash");
  v21 = -[NSString hash](self->_intentResponseMessageName, "hash");
  v5 = -[NSArray hash](self->_dismissalCommands, "hash");
  v6 = -[NSString hash](self->_cardId, "hash");
  v7 = -[NSString hash](self->_contextReferenceIdentifier, "hash");
  v8 = -[_SFPBURL hash](self->_urlValue, "hash");
  v9 = 2654435761 * self->_source;
  v10 = -[NSData hash](self->_entityIdentifier, "hash");
  v11 = -[NSString hash](self->_resultIdentifier, "hash");
  v12 = 2654435761u * self->_queryId;
  v13 = -[NSString hash](self->_fbr, "hash");
  if (!self->_flexibleSectionOrder)
    v4 = 0;
  v14 = v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  v15 = v4 ^ -[NSArray hash](self->_entityProtobufMessages, "hash");
  v16 = v15 ^ -[_SFPBImage hash](self->_titleImage, "hash");
  v17 = v16 ^ -[_SFPBColor hash](self->_backgroundColor, "hash");
  v18 = v17 ^ -[_SFPBDrillDownMetadata hash](self->_metadata, "hash");
  v19 = v18 ^ -[_SFPBDrillDownMetadata hash](self->_drilldownMetadata, "hash");
  return v14 ^ v19 ^ -[_SFPBImage hash](self->_backgroundImage, "hash");
}

- (id)dictionaryRepresentation
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
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
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
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundColor)
  {
    -[_SFPBCard backgroundColor](self, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("backgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("backgroundColor"));

    }
  }
  if (self->_backgroundImage)
  {
    -[_SFPBCard backgroundImage](self, "backgroundImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("backgroundImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("backgroundImage"));

    }
  }
  if (self->_cardId)
  {
    -[_SFPBCard cardId](self, "cardId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("cardId"));

  }
  if (-[NSArray count](self->_cardSections, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v13 = self->_cardSections;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v86 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v12, "addObject:", v18);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("cardSections"));
  }
  if (self->_contextReferenceIdentifier)
  {
    -[_SFPBCard contextReferenceIdentifier](self, "contextReferenceIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("contextReferenceIdentifier"));

  }
  if (-[NSArray count](self->_dismissalCommands, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v23 = self->_dismissalCommands;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v82;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v82 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * j), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            objc_msgSend(v22, "addObject:", v28);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v29);

          }
        }
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("dismissalCommands"));
  }
  if (self->_drilldownMetadata)
  {
    -[_SFPBCard drilldownMetadata](self, "drilldownMetadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("drilldownMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("drilldownMetadata"));

    }
  }
  if (self->_entityIdentifier)
  {
    -[_SFPBCard entityIdentifier](self, "entityIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "base64EncodedStringWithOptions:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("entityIdentifier"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("entityIdentifier"));

    }
  }
  if (-[NSArray count](self->_entityProtobufMessages, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v37 = self->_entityProtobufMessages;
    v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v78 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * k), "dictionaryRepresentation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            objc_msgSend(v36, "addObject:", v42);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObject:", v43);

          }
        }
        v39 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      }
      while (v39);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("entityProtobufMessages"));
  }
  if (self->_fbr)
  {
    -[_SFPBCard fbr](self, "fbr");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v44, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("fbr"));

  }
  if (self->_flexibleSectionOrder)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCard flexibleSectionOrder](self, "flexibleSectionOrder"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("flexibleSectionOrder"));

  }
  if (self->_intentMessageData)
  {
    -[_SFPBCard intentMessageData](self, "intentMessageData");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "base64EncodedStringWithOptions:", 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("intentMessageData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("intentMessageData"));

    }
  }
  if (self->_intentMessageName)
  {
    -[_SFPBCard intentMessageName](self, "intentMessageName");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v50, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("intentMessageName"));

  }
  if (self->_intentResponseMessageData)
  {
    -[_SFPBCard intentResponseMessageData](self, "intentResponseMessageData");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "base64EncodedStringWithOptions:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("intentResponseMessageData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("intentResponseMessageData"));

    }
  }
  if (self->_intentResponseMessageName)
  {
    -[_SFPBCard intentResponseMessageName](self, "intentResponseMessageName");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v55, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("intentResponseMessageName"));

  }
  if (self->_metadata)
  {
    -[_SFPBCard metadata](self, "metadata");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "dictionaryRepresentation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("metadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("metadata"));

    }
  }
  if (self->_queryId)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBCard queryId](self, "queryId"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("queryId"));

  }
  if (self->_resultIdentifier)
  {
    -[_SFPBCard resultIdentifier](self, "resultIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)objc_msgSend(v61, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("resultIdentifier"));

  }
  if (self->_source)
  {
    v63 = -[_SFPBCard source](self, "source");
    if (v63 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v64 = *(&off_1E4042178 + v63);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("source"));

  }
  if (self->_title)
  {
    -[_SFPBCard title](self, "title");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend(v65, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("title"));

  }
  if (self->_titleImage)
  {
    -[_SFPBCard titleImage](self, "titleImage");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("titleImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("titleImage"));

    }
  }
  if (self->_type)
  {
    v70 = -[_SFPBCard type](self, "type");
    if (v70 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v71 = *(&off_1E4042190 + v70);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("type"));

  }
  if (self->_urlValue)
  {
    -[_SFPBCard urlValue](self, "urlValue");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "dictionaryRepresentation");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("urlValue"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("urlValue"));

    }
  }
  v75 = v3;

  return v75;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCard dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBCard)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCard *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBCard initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCard)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCard *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  _SFPBCardSection *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  _SFPBAbstractCommand *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _SFPBURL *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  uint64_t v54;
  _SFPBNamedProtobufMessage *v55;
  void *v56;
  _SFPBImage *v57;
  void *v58;
  _SFPBColor *v59;
  void *v60;
  _SFPBDrillDownMetadata *v61;
  void *v62;
  _SFPBDrillDownMetadata *v63;
  void *v64;
  _SFPBImage *v65;
  _SFPBCard *v66;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  objc_super v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)_SFPBCard;
  v5 = -[_SFPBCard init](&v97, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBCard setTitle:](v5, "setTitle:", v7);

    }
    v71 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCard setType:](v5, "setType:", objc_msgSend(v8, "intValue"));
    v70 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardSections"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v84 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v94;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v94 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[_SFPBCardSection initWithDictionary:]([_SFPBCardSection alloc], "initWithDictionary:", v15);
              -[_SFPBCard addCardSections:](v5, "addCardSections:", v16);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
        }
        while (v12);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentMessageData"));
    v17 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = (void *)v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v17, 0);
      -[_SFPBCard setIntentMessageData:](v5, "setIntentMessageData:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentMessageName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v82 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = (void *)objc_msgSend(v19, "copy");
      -[_SFPBCard setIntentMessageName:](v5, "setIntentMessageName:", v20);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentResponseMessageData"));
    v21 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = (void *)v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v21, 0);
      -[_SFPBCard setIntentResponseMessageData:](v5, "setIntentResponseMessageData:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentResponseMessageName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v80 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = (void *)objc_msgSend(v23, "copy");
      -[_SFPBCard setIntentResponseMessageName:](v5, "setIntentResponseMessageName:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dismissalCommands"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v79 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v26 = v25;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v90;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v90 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v32 = -[_SFPBAbstractCommand initWithDictionary:]([_SFPBAbstractCommand alloc], "initWithDictionary:", v31);
              -[_SFPBCard addDismissalCommands:](v5, "addDismissalCommands:", v32);

            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
        }
        while (v28);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardId"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = (void *)objc_msgSend(v33, "copy");
      -[_SFPBCard setCardId:](v5, "setCardId:", v34);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextReferenceIdentifier"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v78 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = (void *)objc_msgSend(v35, "copy");
      -[_SFPBCard setContextReferenceIdentifier:](v5, "setContextReferenceIdentifier:", v36);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("urlValue"));
    v37 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v77 = (void *)v37;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = -[_SFPBURL initWithDictionary:]([_SFPBURL alloc], "initWithDictionary:", v37);
      -[_SFPBCard setUrlValue:](v5, "setUrlValue:", v38);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("source"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v76 = v39;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCard setSource:](v5, "setSource:", objc_msgSend(v39, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityIdentifier"));
    v40 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v75 = (void *)v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v40, 0);
      -[_SFPBCard setEntityIdentifier:](v5, "setEntityIdentifier:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultIdentifier"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v74 = v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = (void *)objc_msgSend(v42, "copy");
      -[_SFPBCard setResultIdentifier:](v5, "setResultIdentifier:", v43);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryId"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v73 = v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCard setQueryId:](v5, "setQueryId:", objc_msgSend(v44, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fbr"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v72 = v45;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = (void *)objc_msgSend(v45, "copy");
      -[_SFPBCard setFbr:](v5, "setFbr:", v46);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flexibleSectionOrder"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCard setFlexibleSectionOrder:](v5, "setFlexibleSectionOrder:", objc_msgSend(v47, "BOOLValue"));
    v68 = v47;
    v69 = v33;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityProtobufMessages"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v49 = v48;
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
      if (v50)
      {
        v51 = v50;
        v52 = *(_QWORD *)v86;
        do
        {
          for (k = 0; k != v51; ++k)
          {
            if (*(_QWORD *)v86 != v52)
              objc_enumerationMutation(v49);
            v54 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v55 = -[_SFPBNamedProtobufMessage initWithDictionary:]([_SFPBNamedProtobufMessage alloc], "initWithDictionary:", v54);
              -[_SFPBCard addEntityProtobufMessages:](v5, "addEntityProtobufMessages:", v55);

            }
          }
          v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
        }
        while (v51);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("titleImage"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v56);
      -[_SFPBCard setTitleImage:](v5, "setTitleImage:", v57);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v58);
      -[_SFPBCard setBackgroundColor:](v5, "setBackgroundColor:", v59);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = -[_SFPBDrillDownMetadata initWithDictionary:]([_SFPBDrillDownMetadata alloc], "initWithDictionary:", v60);
      -[_SFPBCard setMetadata:](v5, "setMetadata:", v61);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("drilldownMetadata"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = -[_SFPBDrillDownMetadata initWithDictionary:]([_SFPBDrillDownMetadata alloc], "initWithDictionary:", v62);
      -[_SFPBCard setDrilldownMetadata:](v5, "setDrilldownMetadata:", v63);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundImage"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v64);
      -[_SFPBCard setBackgroundImage:](v5, "setBackgroundImage:", v65);

    }
    v66 = v5;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (int)type
{
  return self->_type;
}

- (NSArray)cardSections
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)intentMessageData
{
  return self->_intentMessageData;
}

- (NSString)intentMessageName
{
  return self->_intentMessageName;
}

- (NSData)intentResponseMessageData
{
  return self->_intentResponseMessageData;
}

- (NSString)intentResponseMessageName
{
  return self->_intentResponseMessageName;
}

- (NSArray)dismissalCommands
{
  return self->_dismissalCommands;
}

- (NSString)cardId
{
  return self->_cardId;
}

- (NSString)contextReferenceIdentifier
{
  return self->_contextReferenceIdentifier;
}

- (_SFPBURL)urlValue
{
  return self->_urlValue;
}

- (int)source
{
  return self->_source;
}

- (NSData)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (NSString)fbr
{
  return self->_fbr;
}

- (BOOL)flexibleSectionOrder
{
  return self->_flexibleSectionOrder;
}

- (NSArray)entityProtobufMessages
{
  return self->_entityProtobufMessages;
}

- (_SFPBImage)titleImage
{
  return self->_titleImage;
}

- (_SFPBColor)backgroundColor
{
  return self->_backgroundColor;
}

- (_SFPBDrillDownMetadata)metadata
{
  return self->_metadata;
}

- (_SFPBDrillDownMetadata)drilldownMetadata
{
  return self->_drilldownMetadata;
}

- (_SFPBImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_drilldownMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_entityProtobufMessages, 0);
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_urlValue, 0);
  objc_storeStrong((id *)&self->_contextReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_cardId, 0);
  objc_storeStrong((id *)&self->_dismissalCommands, 0);
  objc_storeStrong((id *)&self->_intentResponseMessageName, 0);
  objc_storeStrong((id *)&self->_intentResponseMessageData, 0);
  objc_storeStrong((id *)&self->_intentMessageName, 0);
  objc_storeStrong((id *)&self->_intentMessageData, 0);
  objc_storeStrong((id *)&self->_cardSections, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
