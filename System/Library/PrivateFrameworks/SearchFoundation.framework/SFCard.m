@implementation SFCard

- (SFCard)initWithProtobuf:(id)a3
{
  id v4;
  SFCard *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  SFCardSection *v15;
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
  SFAbstractCommand *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  SFNamedProtobufMessage *v52;
  void *v53;
  SFImage *v54;
  void *v55;
  SFImage *v56;
  void *v57;
  SFColor *v58;
  void *v59;
  SFColor *v60;
  void *v61;
  SFDrillDownMetadata *v62;
  void *v63;
  SFDrillDownMetadata *v64;
  void *v65;
  SFDrillDownMetadata *v66;
  void *v67;
  SFDrillDownMetadata *v68;
  void *v69;
  SFImage *v70;
  void *v71;
  SFImage *v72;
  SFCard *v73;
  SFCard *v75;
  __int128 v76;
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
  objc_super v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)SFCard;
  v5 = -[SFCard init](&v88, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCard setTitle:](v5, "setTitle:", v7);

    }
    if (objc_msgSend(v4, "type"))
      -[SFCard setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "cardSections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v5;
    if (v8)
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v9 = 0;

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    objc_msgSend(v4, "cardSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v85 != v13)
            objc_enumerationMutation(v10);
          v15 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i));
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
      }
      while (v12);
    }

    -[SFCard setCardSections:](v5, "setCardSections:", v9);
    objc_msgSend(v4, "intentMessageData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "intentMessageData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCard setIntentMessageData:](v5, "setIntentMessageData:", v17);

    }
    objc_msgSend(v4, "intentMessageName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "intentMessageName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCard setIntentMessageName:](v5, "setIntentMessageName:", v19);

    }
    objc_msgSend(v4, "intentResponseMessageData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "intentResponseMessageData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCard setIntentResponseMessageData:](v5, "setIntentResponseMessageData:", v21);

    }
    objc_msgSend(v4, "intentResponseMessageName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "intentResponseMessageName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCard setIntentResponseMessageName:](v5, "setIntentResponseMessageName:", v23);

    }
    objc_msgSend(v4, "dismissalCommands");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v25 = 0;

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    objc_msgSend(v4, "dismissalCommands");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v81;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v81 != v29)
            objc_enumerationMutation(v26);
          v31 = -[SFAbstractCommand initWithProtobuf:]([SFAbstractCommand alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j));
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
      }
      while (v28);
    }

    -[SFCard setDismissalCommands:](v75, "setDismissalCommands:", v25);
    objc_msgSend(v4, "cardId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "cardId");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCard setCardId:](v75, "setCardId:", v33);

    }
    objc_msgSend(v4, "contextReferenceIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v4, "contextReferenceIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCard setContextReferenceIdentifier:](v75, "setContextReferenceIdentifier:", v35);

    }
    objc_msgSend(v4, "urlValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v4, "urlValue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCard setUrlValue:](v75, "setUrlValue:", v38);

    }
    if (objc_msgSend(v4, "source"))
      -[SFCard setSource:](v75, "setSource:", objc_msgSend(v4, "source"));
    objc_msgSend(v4, "entityIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(v4, "entityIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCard setEntityIdentifier:](v75, "setEntityIdentifier:", v40);

    }
    objc_msgSend(v4, "resultIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v4, "resultIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCard setResultIdentifier:](v75, "setResultIdentifier:", v42);

    }
    if (objc_msgSend(v4, "queryId"))
      -[SFCard setQueryId:](v75, "setQueryId:", objc_msgSend(v4, "queryId"));
    objc_msgSend(v4, "fbr");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(v4, "fbr");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCard setFbr:](v75, "setFbr:", v44);

    }
    if (objc_msgSend(v4, "flexibleSectionOrder"))
      -[SFCard setFlexibleSectionOrder:](v75, "setFlexibleSectionOrder:", objc_msgSend(v4, "flexibleSectionOrder"));
    objc_msgSend(v4, "entityProtobufMessages");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
      v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v46 = 0;

    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    objc_msgSend(v4, "entityProtobufMessages");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v77;
      do
      {
        for (k = 0; k != v49; ++k)
        {
          if (*(_QWORD *)v77 != v50)
            objc_enumerationMutation(v47);
          v52 = -[SFNamedProtobufMessage initWithProtobuf:]([SFNamedProtobufMessage alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * k));
          if (v52)
            objc_msgSend(v46, "addObject:", v52);

        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
      }
      while (v49);
    }

    v5 = v75;
    -[SFCard setEntityProtobufMessages:](v75, "setEntityProtobufMessages:", v46);
    objc_msgSend(v4, "titleImage");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      v54 = [SFImage alloc];
      objc_msgSend(v4, "titleImage");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = -[SFImage initWithProtobuf:](v54, "initWithProtobuf:", v55);
      -[SFCard setTitleImage:](v75, "setTitleImage:", v56);

    }
    objc_msgSend(v4, "backgroundColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      v58 = [SFColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = -[SFColor initWithProtobuf:](v58, "initWithProtobuf:", v59);
      -[SFCard setBackgroundColor:](v75, "setBackgroundColor:", v60);

    }
    objc_msgSend(v4, "metadata");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      v62 = [SFDrillDownMetadata alloc];
      objc_msgSend(v4, "metadata");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = -[SFDrillDownMetadata initWithProtobuf:](v62, "initWithProtobuf:", v63);
      -[SFCard setMetadata:](v75, "setMetadata:", v64);

    }
    objc_msgSend(v4, "drilldownMetadata");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      v66 = [SFDrillDownMetadata alloc];
      objc_msgSend(v4, "drilldownMetadata");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = -[SFDrillDownMetadata initWithProtobuf:](v66, "initWithProtobuf:", v67);
      -[SFCard setDrilldownMetadata:](v75, "setDrilldownMetadata:", v68);

    }
    objc_msgSend(v4, "backgroundImage");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      v70 = [SFImage alloc];
      objc_msgSend(v4, "backgroundImage");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = -[SFImage initWithProtobuf:](v70, "initWithProtobuf:", v71);
      -[SFCard setBackgroundImage:](v75, "setBackgroundImage:", v72);

    }
    v73 = v75;

  }
  return v5;
}

- (void)loadCardSectionsWithCompletionAndErrorHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__SFCard_Handwritten__loadCardSectionsWithCompletionAndErrorHandler___block_invoke;
  v6[3] = &unk_1E4041780;
  v7 = v4;
  v5 = v4;
  SFResourceLoaderLoadCard(self, v6);

}

- (void)loadCardSectionsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SFCard_Handwritten__loadCardSectionsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E40417A8;
  v7 = v4;
  v5 = v4;
  -[SFCard loadCardSectionsWithCompletionAndErrorHandler:](self, "loadCardSectionsWithCompletionAndErrorHandler:", v6);

}

uint64_t __61__SFCard_Handwritten__loadCardSectionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__SFCard_Handwritten__loadCardSectionsWithCompletionAndErrorHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "cardSections");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)setFlexibleSectionOrder:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_flexibleSectionOrder = a3;
}

- (BOOL)hasFlexibleSectionOrder
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setQueryId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_queryId = a3;
}

- (BOOL)hasQueryId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_source = a3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_type = a3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (SFCard)initWithCoder:(id)a3
{
  id v4;
  SFCard *v5;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SFCard;
  v5 = -[SFCard init](&v27, sel_init);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backgroundColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setBackgroundColor:](v5, "setBackgroundColor:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cardId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setCardId:](v5, "setCardId:", v7);

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_cardSections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setCardSections:](v5, "setCardSections:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contextReferenceIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setContextReferenceIdentifier:](v5, "setContextReferenceIdentifier:", v9);

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_dismissalCommands"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setDismissalCommands:](v5, "setDismissalCommands:", v10);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_entityIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setEntityIdentifier:](v5, "setEntityIdentifier:", v11);

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_entityProtobufMessages"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setEntityProtobufMessages:](v5, "setEntityProtobufMessages:", v12);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fbr"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setFbr:](v5, "setFbr:", v13);

  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasFlexibleSectionOrder")))
    -[SFCard setFlexibleSectionOrder:](v5, "setFlexibleSectionOrder:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_flexibleSectionOrder")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_intentMessageData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setIntentMessageData:](v5, "setIntentMessageData:", v14);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_intentMessageName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setIntentMessageName:](v5, "setIntentMessageName:", v15);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_intentResponseMessageData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setIntentResponseMessageData:](v5, "setIntentResponseMessageData:", v16);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_intentResponseMessageName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setIntentResponseMessageName:](v5, "setIntentResponseMessageName:", v17);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_metadata"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setMetadata:](v5, "setMetadata:", v18);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_drilldownMetadata"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setDrilldownMetadata:](v5, "setDrilldownMetadata:", v19);

  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasQueryId")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_queryId"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCard setQueryId:](v5, "setQueryId:", objc_msgSend(v20, "unsignedIntegerValue"));

  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resultIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setResultIdentifier:](v5, "setResultIdentifier:", v21);

  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasSource")))
    -[SFCard setSource:](v5, "setSource:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_source")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setTitle:](v5, "setTitle:", v22);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_titleImage"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setTitleImage:](v5, "setTitleImage:", v23);

  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasType")))
    -[SFCard setType:](v5, "setType:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_type")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_urlValue"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setUrlValue:](v5, "setUrlValue:", v24);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backgroundImage"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard setBackgroundImage:](v5, "setBackgroundImage:", v25);

  return v5;
}

- (void)encodeWithCoder:(id)a3
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  -[SFCard backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v4, CFSTR("_backgroundColor"));

  -[SFCard cardId](self, "cardId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v5, CFSTR("_cardId"));

  -[SFCard cardSections](self, "cardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v6, CFSTR("_cardSections"));

  -[SFCard contextReferenceIdentifier](self, "contextReferenceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v7, CFSTR("_contextReferenceIdentifier"));

  -[SFCard dismissalCommands](self, "dismissalCommands");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v8, CFSTR("_dismissalCommands"));

  -[SFCard entityIdentifier](self, "entityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v9, CFSTR("_entityIdentifier"));

  -[SFCard entityProtobufMessages](self, "entityProtobufMessages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v10, CFSTR("_entityProtobufMessages"));

  -[SFCard fbr](self, "fbr");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v11, CFSTR("_fbr"));

  if (-[SFCard hasFlexibleSectionOrder](self, "hasFlexibleSectionOrder"))
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("_hasFlexibleSectionOrder"));
    objc_msgSend(v24, "encodeBool:forKey:", -[SFCard flexibleSectionOrder](self, "flexibleSectionOrder"), CFSTR("_flexibleSectionOrder"));
  }
  -[SFCard intentMessageData](self, "intentMessageData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v12, CFSTR("_intentMessageData"));

  -[SFCard intentMessageName](self, "intentMessageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v13, CFSTR("_intentMessageName"));

  -[SFCard intentResponseMessageData](self, "intentResponseMessageData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v14, CFSTR("_intentResponseMessageData"));

  -[SFCard intentResponseMessageName](self, "intentResponseMessageName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v15, CFSTR("_intentResponseMessageName"));

  -[SFCard metadata](self, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v16, CFSTR("_metadata"));

  -[SFCard drilldownMetadata](self, "drilldownMetadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v17, CFSTR("_drilldownMetadata"));

  if (-[SFCard hasQueryId](self, "hasQueryId"))
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("_hasQueryId"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SFCard queryId](self, "queryId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v18, CFSTR("_queryId"));

  }
  -[SFCard resultIdentifier](self, "resultIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v19, CFSTR("_resultIdentifier"));

  if (-[SFCard hasSource](self, "hasSource"))
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("_hasSource"));
    objc_msgSend(v24, "encodeInt32:forKey:", -[SFCard source](self, "source"), CFSTR("_source"));
  }
  -[SFCard title](self, "title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v20, CFSTR("_title"));

  -[SFCard titleImage](self, "titleImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v21, CFSTR("_titleImage"));

  if (-[SFCard hasType](self, "hasType"))
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("_hasType"));
    objc_msgSend(v24, "encodeInt32:forKey:", -[SFCard type](self, "type"), CFSTR("_type"));
  }
  -[SFCard urlValue](self, "urlValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v22, CFSTR("_urlValue"));

  -[SFCard backgroundImage](self, "backgroundImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v23, CFSTR("_backgroundImage"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCard *v2;
  void *v3;

  v2 = -[_SFPBCard initWithFacade:]([_SFPBCard alloc], "initWithFacade:", self);
  -[_SFPBCard dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCard *v2;
  void *v3;

  v2 = -[_SFPBCard initWithFacade:]([_SFPBCard alloc], "initWithFacade:", self);
  -[_SFPBCard jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFCard title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTitle:", v6);

  objc_msgSend(v4, "setType:", -[SFCard type](self, "type"));
  -[SFCard cardSections](self, "cardSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCardSections:", v8);

  -[SFCard intentMessageData](self, "intentMessageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setIntentMessageData:", v10);

  -[SFCard intentMessageName](self, "intentMessageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setIntentMessageName:", v12);

  -[SFCard intentResponseMessageData](self, "intentResponseMessageData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setIntentResponseMessageData:", v14);

  -[SFCard intentResponseMessageName](self, "intentResponseMessageName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setIntentResponseMessageName:", v16);

  -[SFCard dismissalCommands](self, "dismissalCommands");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setDismissalCommands:", v18);

  -[SFCard cardId](self, "cardId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setCardId:", v20);

  -[SFCard contextReferenceIdentifier](self, "contextReferenceIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setContextReferenceIdentifier:", v22);

  -[SFCard urlValue](self, "urlValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setUrlValue:", v24);

  objc_msgSend(v4, "setSource:", -[SFCard source](self, "source"));
  -[SFCard entityIdentifier](self, "entityIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setEntityIdentifier:", v26);

  -[SFCard resultIdentifier](self, "resultIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setResultIdentifier:", v28);

  objc_msgSend(v4, "setQueryId:", -[SFCard queryId](self, "queryId"));
  -[SFCard fbr](self, "fbr");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setFbr:", v30);

  objc_msgSend(v4, "setFlexibleSectionOrder:", -[SFCard flexibleSectionOrder](self, "flexibleSectionOrder"));
  -[SFCard entityProtobufMessages](self, "entityProtobufMessages");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setEntityProtobufMessages:", v32);

  -[SFCard titleImage](self, "titleImage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setTitleImage:", v34);

  -[SFCard backgroundColor](self, "backgroundColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v36);

  -[SFCard metadata](self, "metadata");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v4, "setMetadata:", v38);

  -[SFCard drilldownMetadata](self, "drilldownMetadata");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");
  objc_msgSend(v4, "setDrilldownMetadata:", v40);

  -[SFCard backgroundImage](self, "backgroundImage");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  objc_msgSend(v4, "setBackgroundImage:", v42);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  SFCard *v5;
  SFCard *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  uint64_t v26;
  _BOOL4 v27;
  void *v28;
  uint64_t v29;
  _BOOL4 v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  uint64_t v45;
  _BOOL4 v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  _BOOL4 v50;
  void *v51;
  unint64_t v52;
  uint64_t v53;
  void *v54;
  _BOOL4 v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
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
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
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
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  _BYTE v142[12];
  _BYTE v143[56];
  _QWORD v144[6];

  v5 = (SFCard *)a3;
  if (self == v5)
  {
    v10 = 1;
    goto LABEL_86;
  }
  if (!-[SFCard isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
  {
    v10 = 0;
    goto LABEL_86;
  }
  v6 = v5;
  -[SFCard title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCard title](v6, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8
    && (-[SFCard title](self, "title"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SFCard title](v6, "title"),
        v139 = (void *)objc_claimAutoreleasedReturnValue(),
        v140 = v9,
        !objc_msgSend(v9, "isEqual:"))
    || (v11 = -[SFCard type](self, "type"), v11 != -[SFCard type](v6, "type")))
  {
    v14 = 0;
    memset(v143, 0, sizeof(v143));
    v141 = 0;
    memset(v142, 0, sizeof(v142));
    memset(v144, 0, sizeof(v144));
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v10 = 0;
    goto LABEL_13;
  }
  -[SFCard cardSections](self, "cardSections");
  v12 = objc_claimAutoreleasedReturnValue();
  -[SFCard cardSections](v6, "cardSections");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = (void *)v12;
  v3 = v12 != (_QWORD)v137;
  if ((void *)v12 != v137)
  {
    -[SFCard cardSections](self, "cardSections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCard cardSections](v6, "cardSections");
    v134 = v13;
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isEqual:"))
    {
      v14 = 0;
      memset(v143, 0, 32);
      v141 = 0;
      *(_OWORD *)&v143[36] = 0uLL;
      memset(v142, 0, sizeof(v142));
      memset(v144, 0, sizeof(v144));
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(_DWORD *)&v143[52] = 1;
      goto LABEL_13;
    }
  }
  -[SFCard intentMessageData](self, "intentMessageData");
  v26 = objc_claimAutoreleasedReturnValue();
  -[SFCard intentMessageData](v6, "intentMessageData");
  v136 = (void *)v26;
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 != (_QWORD)v135;
  *(_DWORD *)&v143[52] = v3;
  if ((void *)v26 != v135)
  {
    -[SFCard intentMessageData](self, "intentMessageData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCard intentMessageData](v6, "intentMessageData");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = v28;
    if (!objc_msgSend(v28, "isEqual:"))
    {
      v14 = 0;
      memset(v143, 0, 28);
      v141 = 0;
      memset(v142, 0, sizeof(v142));
      memset(v144, 0, sizeof(v144));
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v10 = 0;
      *(_OWORD *)&v143[32] = 1uLL;
      *(_DWORD *)&v143[28] = 1;
      *(_DWORD *)&v143[48] = 1;
      goto LABEL_13;
    }
  }
  -[SFCard intentMessageName](self, "intentMessageName");
  v29 = objc_claimAutoreleasedReturnValue();
  -[SFCard intentMessageName](v6, "intentMessageName");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29 != (_QWORD)v131;
  *(_DWORD *)&v143[48] = v27;
  v132 = (void *)v29;
  if ((void *)v29 != v131)
  {
    -[SFCard intentMessageName](self, "intentMessageName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCard intentMessageName](v6, "intentMessageName");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      v14 = 0;
      memset(v143, 0, 24);
      v141 = 0;
      *(_QWORD *)&v143[36] = 0;
      memset(v142, 0, sizeof(v142));
      memset(v144, 0, sizeof(v144));
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(_QWORD *)&v143[24] = 0x100000001;
      *(_DWORD *)&v143[44] = 1;
      goto LABEL_13;
    }
    v30 = 1;
  }
  -[SFCard intentResponseMessageData](self, "intentResponseMessageData");
  v32 = objc_claimAutoreleasedReturnValue();
  -[SFCard intentResponseMessageData](v6, "intentResponseMessageData");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = (void *)v32;
  HIDWORD(v144[5]) = v32 != (_QWORD)v127;
  *(_DWORD *)&v143[44] = v30;
  if ((void *)v32 != v127)
  {
    -[SFCard intentResponseMessageData](self, "intentResponseMessageData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCard intentResponseMessageData](v6, "intentResponseMessageData");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = v33;
    if (!objc_msgSend(v33, "isEqual:"))
    {
      v14 = 0;
      memset(v143, 0, 20);
      v141 = 0;
      *(_QWORD *)&v143[36] = 0;
      memset(v142, 0, sizeof(v142));
      v15 = 0;
      v16 = 0;
      memset(v144, 0, 44);
      v17 = 0;
      v18 = 0;
      v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(_DWORD *)&v143[20] = 1;
      *(_QWORD *)&v143[24] = 0x100000001;
      HIDWORD(v144[5]) = 1;
      goto LABEL_13;
    }
  }
  -[SFCard intentResponseMessageName](self, "intentResponseMessageName");
  v34 = objc_claimAutoreleasedReturnValue();
  -[SFCard intentResponseMessageName](v6, "intentResponseMessageName");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = (void *)v34;
  LODWORD(v144[5]) = v34 != (_QWORD)v123;
  if ((void *)v34 != v123)
  {
    -[SFCard intentResponseMessageName](self, "intentResponseMessageName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCard intentResponseMessageName](v6, "intentResponseMessageName");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      v14 = 0;
      *(_QWORD *)v143 = 0;
      *(_QWORD *)&v143[8] = 0;
      v141 = 0;
      *(_QWORD *)&v143[36] = 0;
      memset(v142, 0, sizeof(v142));
      v15 = 0;
      memset(v144, 0, 40);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(_QWORD *)&v143[24] = 0x100000001;
      *(_QWORD *)&v143[16] = 0x100000001;
      LODWORD(v144[5]) = 1;
      goto LABEL_13;
    }
  }
  -[SFCard dismissalCommands](self, "dismissalCommands");
  v36 = objc_claimAutoreleasedReturnValue();
  -[SFCard dismissalCommands](v6, "dismissalCommands");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = (void *)v36;
  HIDWORD(v144[4]) = v36 != (_QWORD)v119;
  if ((void *)v36 != v119)
  {
    -[SFCard dismissalCommands](self, "dismissalCommands");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCard dismissalCommands](v6, "dismissalCommands");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v37;
    if (!objc_msgSend(v37, "isEqual:"))
    {
      *(_QWORD *)v143 = 0;
      *(_QWORD *)&v143[8] = 0;
      v141 = 0;
      *(_QWORD *)&v143[36] = 0;
      memset(v142, 0, sizeof(v142));
      v15 = 0;
      v16 = 0;
      memset(v144, 0, 36);
      v17 = 0;
      v18 = 0;
      v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(_QWORD *)&v143[24] = 0x100000001;
      *(_QWORD *)&v143[16] = 0x100000001;
      v14 = 1;
      HIDWORD(v144[4]) = 1;
      goto LABEL_13;
    }
  }
  -[SFCard cardId](self, "cardId");
  v38 = objc_claimAutoreleasedReturnValue();
  -[SFCard cardId](v6, "cardId");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v144[4]) = v38 != (_QWORD)v115;
  v116 = (void *)v38;
  if ((void *)v38 != v115)
  {
    -[SFCard cardId](self, "cardId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCard cardId](v6, "cardId");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v39;
    if (!objc_msgSend(v39, "isEqual:"))
    {
      *(_QWORD *)v143 = 0;
      v141 = 0;
      *(_QWORD *)&v143[36] = 0;
      memset(v142, 0, sizeof(v142));
      memset(v144, 0, 32);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(_QWORD *)&v143[24] = 0x100000001;
      *(_QWORD *)&v143[16] = 0x100000001;
      v14 = 1;
      *(_QWORD *)&v143[8] = 0x100000000;
      LODWORD(v144[4]) = 1;
      goto LABEL_13;
    }
  }
  -[SFCard contextReferenceIdentifier](self, "contextReferenceIdentifier");
  v40 = objc_claimAutoreleasedReturnValue();
  -[SFCard contextReferenceIdentifier](v6, "contextReferenceIdentifier");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v144[3]) = v40 != (_QWORD)v111;
  v112 = (void *)v40;
  if ((void *)v40 != v111)
  {
    -[SFCard contextReferenceIdentifier](self, "contextReferenceIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCard contextReferenceIdentifier](v6, "contextReferenceIdentifier");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v41;
    if (!objc_msgSend(v41, "isEqual:"))
    {
      v141 = 0;
      *(_QWORD *)v142 = 0;
      *(_QWORD *)&v143[36] = 0;
      *(_QWORD *)v143 = 0;
      v15 = 0;
      v16 = 0;
      memset(v144, 0, 28);
      v17 = 0;
      v18 = 0;
      v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(_QWORD *)&v143[24] = 0x100000001;
      *(_QWORD *)&v143[16] = 0x100000001;
      v14 = 1;
      *(_QWORD *)&v143[8] = 0x100000000;
      *(_DWORD *)&v142[8] = 1;
      HIDWORD(v144[3]) = 1;
      goto LABEL_13;
    }
  }
  -[SFCard urlValue](self, "urlValue");
  v42 = objc_claimAutoreleasedReturnValue();
  -[SFCard urlValue](v6, "urlValue");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v144[3]) = v42 != (_QWORD)v107;
  v108 = (void *)v42;
  if ((void *)v42 != v107)
  {
    -[SFCard urlValue](self, "urlValue");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCard urlValue](v6, "urlValue");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v43;
    if (!objc_msgSend(v43, "isEqual:"))
    {
      *(_QWORD *)v142 = 0;
      *(_QWORD *)&v143[36] = 0;
      *(_QWORD *)v143 = 0;
      v15 = 0;
      memset(v144, 0, 24);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(_QWORD *)&v143[24] = 0x100000001;
      *(_QWORD *)&v143[16] = 0x100000001;
      v14 = 1;
      *(_QWORD *)&v143[8] = 0x100000000;
      *(_DWORD *)&v142[8] = 1;
      v141 = 0x100000000;
      LODWORD(v144[3]) = 1;
      goto LABEL_13;
    }
  }
  v44 = -[SFCard source](self, "source");
  if (v44 != -[SFCard source](v6, "source"))
  {
    *(_QWORD *)v142 = 0;
    *(_QWORD *)&v143[36] = 0;
    v141 = 0x100000000;
    *(_QWORD *)v143 = 0;
    v15 = 0;
    memset(v144, 0, 24);
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v10 = 0;
    *(_DWORD *)&v143[32] = 1;
    *(_QWORD *)&v143[24] = 0x100000001;
    *(_QWORD *)&v143[16] = 0x100000001;
    v14 = 1;
    *(_QWORD *)&v143[8] = 0x100000000;
    *(_DWORD *)&v142[8] = 1;
    goto LABEL_13;
  }
  -[SFCard entityIdentifier](self, "entityIdentifier");
  v45 = objc_claimAutoreleasedReturnValue();
  -[SFCard entityIdentifier](v6, "entityIdentifier");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = (void *)v45;
  v46 = v45 != (_QWORD)v101;
  if ((void *)v45 != v101)
  {
    -[SFCard entityIdentifier](self, "entityIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCard entityIdentifier](v6, "entityIdentifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v47;
    if (!objc_msgSend(v47, "isEqual:"))
    {
      v141 = 0x100000000;
      *(_QWORD *)v143 = 0;
      v15 = 0;
      memset(v144, 0, 24);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(_QWORD *)&v143[36] = 0x100000000;
      *(_QWORD *)&v143[24] = 0x100000001;
      *(_QWORD *)&v143[16] = 0x100000001;
      v14 = 1;
      *(_QWORD *)&v143[8] = 0x100000000;
      *(_DWORD *)&v142[8] = 1;
      *(_QWORD *)v142 = 0x100000000;
      goto LABEL_13;
    }
  }
  -[SFCard resultIdentifier](self, "resultIdentifier");
  v48 = objc_claimAutoreleasedReturnValue();
  -[SFCard resultIdentifier](v6, "resultIdentifier");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = (void *)v48;
  v49 = v48 == (_QWORD)v99;
  v50 = v48 != (_QWORD)v99;
  *(_DWORD *)&v143[40] = v46;
  if (v49)
  {
    *(_DWORD *)&v143[36] = v50;
  }
  else
  {
    -[SFCard resultIdentifier](self, "resultIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCard resultIdentifier](v6, "resultIdentifier");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v51;
    if (!objc_msgSend(v51, "isEqual:"))
    {
      *(_QWORD *)v143 = 0;
      v15 = 0;
      memset(v144, 0, 24);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v10 = 0;
      *(_QWORD *)&v143[32] = 0x100000001;
      *(_QWORD *)&v143[24] = 0x100000001;
      *(_QWORD *)&v143[16] = 0x100000001;
      v14 = 1;
      *(_QWORD *)&v143[8] = 0x100000000;
      *(_DWORD *)&v142[8] = 1;
      *(_QWORD *)v142 = 0x100000000;
      v141 = 0x100000001;
      goto LABEL_13;
    }
    *(_DWORD *)&v143[36] = v50;
  }
  v52 = -[SFCard queryId](self, "queryId");
  if (v52 == -[SFCard queryId](v6, "queryId"))
  {
    -[SFCard fbr](self, "fbr");
    v53 = objc_claimAutoreleasedReturnValue();
    -[SFCard fbr](v6, "fbr");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v144[2]) = v53 != (_QWORD)v93;
    v94 = (void *)v53;
    if ((void *)v53 == v93
      || (-[SFCard fbr](self, "fbr"),
          v54 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SFCard fbr](v6, "fbr"),
          v91 = (void *)objc_claimAutoreleasedReturnValue(),
          v92 = v54,
          objc_msgSend(v54, "isEqual:")))
    {
      v55 = -[SFCard flexibleSectionOrder](self, "flexibleSectionOrder");
      if (v55 == -[SFCard flexibleSectionOrder](v6, "flexibleSectionOrder"))
      {
        -[SFCard entityProtobufMessages](self, "entityProtobufMessages");
        v56 = objc_claimAutoreleasedReturnValue();
        -[SFCard entityProtobufMessages](v6, "entityProtobufMessages");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v144[2]) = v56 != (_QWORD)v89;
        v90 = (void *)v56;
        if ((void *)v56 == v89
          || (-[SFCard entityProtobufMessages](self, "entityProtobufMessages"),
              v57 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFCard entityProtobufMessages](v6, "entityProtobufMessages"),
              v85 = (void *)objc_claimAutoreleasedReturnValue(),
              v86 = v57,
              objc_msgSend(v57, "isEqual:")))
        {
          -[SFCard titleImage](self, "titleImage");
          v58 = objc_claimAutoreleasedReturnValue();
          -[SFCard titleImage](v6, "titleImage");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = (void *)v58;
          HIDWORD(v144[1]) = v58 != (_QWORD)v87;
          if ((void *)v58 == v87
            || (-[SFCard titleImage](self, "titleImage"),
                v59 = (void *)objc_claimAutoreleasedReturnValue(),
                -[SFCard titleImage](v6, "titleImage"),
                v81 = (void *)objc_claimAutoreleasedReturnValue(),
                v82 = v59,
                objc_msgSend(v59, "isEqual:")))
          {
            -[SFCard backgroundColor](self, "backgroundColor");
            v60 = objc_claimAutoreleasedReturnValue();
            -[SFCard backgroundColor](v6, "backgroundColor");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = (void *)v60;
            LODWORD(v144[1]) = v60 != (_QWORD)v83;
            if ((void *)v60 == v83
              || (-[SFCard backgroundColor](self, "backgroundColor"),
                  v61 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[SFCard backgroundColor](v6, "backgroundColor"),
                  v77 = (void *)objc_claimAutoreleasedReturnValue(),
                  v78 = v61,
                  objc_msgSend(v61, "isEqual:")))
            {
              -[SFCard metadata](self, "metadata");
              v62 = objc_claimAutoreleasedReturnValue();
              -[SFCard metadata](v6, "metadata");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = (void *)v62;
              HIDWORD(v144[0]) = v62 != (_QWORD)v79;
              if ((void *)v62 == v79
                || (-[SFCard metadata](self, "metadata"),
                    v63 = (void *)objc_claimAutoreleasedReturnValue(),
                    -[SFCard metadata](v6, "metadata"),
                    v71 = (void *)objc_claimAutoreleasedReturnValue(),
                    v72 = v63,
                    objc_msgSend(v63, "isEqual:")))
              {
                -[SFCard drilldownMetadata](self, "drilldownMetadata");
                v64 = objc_claimAutoreleasedReturnValue();
                -[SFCard drilldownMetadata](v6, "drilldownMetadata");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = (void *)v64;
                LODWORD(v144[0]) = v64 != (_QWORD)v75;
                if ((void *)v64 == v75
                  || (-[SFCard drilldownMetadata](self, "drilldownMetadata"),
                      v65 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFCard drilldownMetadata](v6, "drilldownMetadata"),
                      v69 = (void *)objc_claimAutoreleasedReturnValue(),
                      v70 = v65,
                      objc_msgSend(v65, "isEqual:")))
                {
                  -[SFCard backgroundImage](self, "backgroundImage");
                  v66 = objc_claimAutoreleasedReturnValue();
                  -[SFCard backgroundImage](v6, "backgroundImage");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  v74 = (void *)v66;
                  if ((void *)v66 == v73)
                  {
                    v18 = 0;
                    *(_DWORD *)&v143[32] = 1;
                    *(_QWORD *)&v143[24] = 0x100000001;
                    *(_QWORD *)&v143[16] = 0x100000001;
                    v14 = 1;
                    *(_DWORD *)&v142[8] = 1;
                    v141 = 0x100000001;
                    *(_QWORD *)v142 = 0x100000001;
                    *(_QWORD *)v143 = 0x100000001;
                    *(_QWORD *)&v143[8] = 0x100000001;
                    v15 = 1;
                    v16 = 1;
                    v73 = (void *)v66;
                    v17 = 1;
                    v10 = 1;
                  }
                  else
                  {
                    -[SFCard backgroundImage](self, "backgroundImage");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFCard backgroundImage](v6, "backgroundImage");
                    v3 = objc_claimAutoreleasedReturnValue();
                    v68 = v67;
                    v10 = objc_msgSend(v67, "isEqual:", v3);
                    v18 = 1;
                    *(_DWORD *)&v143[32] = 1;
                    *(_QWORD *)&v143[24] = 0x100000001;
                    *(_QWORD *)&v143[16] = 0x100000001;
                    v14 = 1;
                    *(_DWORD *)&v142[8] = 1;
                    v141 = 0x100000001;
                    *(_QWORD *)v142 = 0x100000001;
                    *(_QWORD *)v143 = 0x100000001;
                    *(_QWORD *)&v143[8] = 0x100000001;
                    v15 = 1;
                    v16 = 1;
                    v17 = 1;
                  }
                }
                else
                {
                  v17 = 0;
                  v18 = 0;
                  v10 = 0;
                  *(_DWORD *)&v143[32] = 1;
                  *(_QWORD *)&v143[24] = 0x100000001;
                  *(_QWORD *)&v143[16] = 0x100000001;
                  v14 = 1;
                  *(_DWORD *)&v142[8] = 1;
                  v141 = 0x100000001;
                  *(_QWORD *)v142 = 0x100000001;
                  *(_QWORD *)v143 = 0x100000001;
                  *(_QWORD *)&v143[8] = 0x100000001;
                  v15 = 1;
                  v16 = 1;
                  LODWORD(v144[0]) = 1;
                }
              }
              else
              {
                v16 = 0;
                v144[0] = 0x100000000;
                v17 = 0;
                v18 = 0;
                v10 = 0;
                *(_DWORD *)&v143[32] = 1;
                *(_QWORD *)&v143[24] = 0x100000001;
                *(_QWORD *)&v143[16] = 0x100000001;
                v14 = 1;
                *(_DWORD *)&v142[8] = 1;
                v141 = 0x100000001;
                *(_QWORD *)v142 = 0x100000001;
                *(_QWORD *)v143 = 0x100000001;
                *(_QWORD *)&v143[8] = 0x100000001;
                v15 = 1;
              }
            }
            else
            {
              v15 = 0;
              v144[0] = 0;
              v16 = 0;
              v17 = 0;
              v18 = 0;
              v10 = 0;
              *(_DWORD *)&v143[32] = 1;
              *(_QWORD *)&v143[24] = 0x100000001;
              *(_QWORD *)&v143[16] = 0x100000001;
              v14 = 1;
              *(_DWORD *)&v142[8] = 1;
              v141 = 0x100000001;
              *(_QWORD *)v142 = 0x100000001;
              *(_QWORD *)v143 = 0x100000001;
              *(_QWORD *)&v143[8] = 0x100000001;
              LODWORD(v144[1]) = 1;
            }
          }
          else
          {
            *(_QWORD *)((char *)v144 + 4) = 0;
            v15 = 0;
            v16 = 0;
            LODWORD(v144[0]) = 0;
            v17 = 0;
            v18 = 0;
            v10 = 0;
            *(_DWORD *)&v143[32] = 1;
            *(_QWORD *)&v143[24] = 0x100000001;
            *(_QWORD *)&v143[16] = 0x100000001;
            v14 = 1;
            *(_QWORD *)&v143[8] = 0x100000000;
            *(_DWORD *)&v142[8] = 1;
            v141 = 0x100000001;
            *(_QWORD *)v142 = 0x100000001;
            *(_QWORD *)v143 = 0x100000001;
            HIDWORD(v144[1]) = 1;
          }
        }
        else
        {
          *(_QWORD *)&v143[4] = 0;
          v144[0] = 0;
          v144[1] = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v10 = 0;
          *(_DWORD *)&v143[32] = 1;
          *(_QWORD *)&v143[24] = 0x100000001;
          *(_DWORD *)&v143[12] = 1;
          *(_QWORD *)&v143[16] = 0x100000001;
          v14 = 1;
          *(_DWORD *)&v142[8] = 1;
          v141 = 0x100000001;
          *(_QWORD *)v142 = 0x100000001;
          *(_DWORD *)v143 = 1;
          LODWORD(v144[2]) = 1;
        }
      }
      else
      {
        *(_QWORD *)v143 = 0;
        v15 = 0;
        v16 = 0;
        memset(v144, 0, 20);
        v17 = 0;
        v18 = 0;
        v10 = 0;
        *(_DWORD *)&v143[32] = 1;
        *(_QWORD *)&v143[24] = 0x100000001;
        *(_QWORD *)&v143[16] = 0x100000001;
        v14 = 1;
        *(_QWORD *)&v143[8] = 0x100000000;
        *(_DWORD *)&v142[8] = 1;
        v141 = 0x100000001;
        *(_QWORD *)v142 = 0x100000001;
      }
    }
    else
    {
      *(_QWORD *)v143 = 0;
      v15 = 0;
      v16 = 0;
      memset(v144, 0, 20);
      v17 = 0;
      v18 = 0;
      v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(_QWORD *)&v143[24] = 0x100000001;
      *(_QWORD *)&v143[16] = 0x100000001;
      v14 = 1;
      *(_QWORD *)&v143[8] = 0x100000000;
      *(_DWORD *)&v142[8] = 1;
      v141 = 0x100000001;
      *(_QWORD *)v142 = 0x100000001;
      HIDWORD(v144[2]) = 1;
    }
  }
  else
  {
    *(_QWORD *)v143 = 0;
    v15 = 0;
    memset(v144, 0, 24);
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v10 = 0;
    *(_DWORD *)&v143[32] = 1;
    *(_QWORD *)&v143[24] = 0x100000001;
    *(_QWORD *)&v143[16] = 0x100000001;
    v14 = 1;
    *(_QWORD *)&v143[8] = 0x100000000;
    *(_DWORD *)&v142[8] = 1;
    *(_QWORD *)v142 = 0x100000000;
    v141 = 0x100000001;
  }
LABEL_13:
  if (v18)
  {
    v19 = v15;
    v20 = v8;
    v21 = v7;
    v22 = v16;
    v23 = v14;
    v24 = v17;

    v17 = v24;
    v14 = v23;
    v16 = v22;
    v7 = v21;
    v8 = v20;
    v15 = v19;
  }
  if (v17)
  {

  }
  if (LODWORD(v144[0]))
  {

  }
  if (v16)
  {

  }
  if (HIDWORD(v144[0]))
  {

  }
  if (v15)
  {

  }
  if (LODWORD(v144[1]))
  {

  }
  if (*(_DWORD *)&v143[8])
  {

  }
  if (HIDWORD(v144[1]))
  {

  }
  if (*(_DWORD *)&v143[4])
  {

  }
  if (LODWORD(v144[2]))
  {

  }
  if (*(_DWORD *)v143)
  {

  }
  if (HIDWORD(v144[2]))
  {

  }
  if (*(_DWORD *)v142)
  {

  }
  if (*(_DWORD *)&v143[36])
  {

  }
  if ((_DWORD)v141)
  {

  }
  if (*(_DWORD *)&v143[40])
  {

  }
  if (*(_DWORD *)&v142[4])
  {

  }
  if (LODWORD(v144[3]))
  {

  }
  if (HIDWORD(v141))
  {

  }
  if (HIDWORD(v144[3]))
  {

  }
  if (*(_DWORD *)&v142[8])
  {

  }
  if (LODWORD(v144[4]))
  {

  }
  if (*(_DWORD *)&v143[12])
  {

  }
  if (!HIDWORD(v144[4]))
  {
    if (!v14)
      goto LABEL_63;
LABEL_88:

    if (!LODWORD(v144[5]))
      goto LABEL_65;
    goto LABEL_64;
  }

  if (v14)
    goto LABEL_88;
LABEL_63:
  if (LODWORD(v144[5]))
  {
LABEL_64:

  }
LABEL_65:
  if (*(_DWORD *)&v143[16])
  {

  }
  if (HIDWORD(v144[5]))
  {

  }
  if (*(_DWORD *)&v143[20])
  {

  }
  if (*(_DWORD *)&v143[44])
  {

  }
  if (*(_DWORD *)&v143[24])
  {

  }
  if (*(_DWORD *)&v143[48])
  {

  }
  if (*(_DWORD *)&v143[28])
  {

  }
  if (*(_DWORD *)&v143[52])
  {

  }
  if (*(_DWORD *)&v143[32])
  {

  }
  if (v7 != v8)
  {

  }
LABEL_86:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  -[SFCard title](self, "title");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v45, "hash");
  v4 = v3 ^ -[SFCard type](self, "type");
  -[SFCard cardSections](self, "cardSections");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v44, "hash");
  -[SFCard intentMessageData](self, "intentMessageData");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v43, "hash");
  -[SFCard intentMessageName](self, "intentMessageName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v42, "hash");
  -[SFCard intentResponseMessageData](self, "intentResponseMessageData");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v41, "hash");
  -[SFCard intentResponseMessageName](self, "intentResponseMessageName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v40, "hash");
  -[SFCard dismissalCommands](self, "dismissalCommands");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v39, "hash");
  -[SFCard cardId](self, "cardId");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 ^ objc_msgSend(v38, "hash");
  -[SFCard contextReferenceIdentifier](self, "contextReferenceIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v37, "hash");
  -[SFCard urlValue](self, "urlValue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v12 ^ objc_msgSend(v36, "hash");
  v14 = -[SFCard source](self, "source");
  -[SFCard entityIdentifier](self, "entityIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 ^ objc_msgSend(v35, "hash");
  -[SFCard resultIdentifier](self, "resultIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 ^ objc_msgSend(v34, "hash");
  v17 = v16 ^ -[SFCard queryId](self, "queryId");
  -[SFCard fbr](self, "fbr");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13 ^ v17 ^ objc_msgSend(v18, "hash");
  v20 = -[SFCard flexibleSectionOrder](self, "flexibleSectionOrder");
  -[SFCard entityProtobufMessages](self, "entityProtobufMessages");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[SFCard titleImage](self, "titleImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash");
  -[SFCard backgroundColor](self, "backgroundColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24 ^ objc_msgSend(v25, "hash");
  -[SFCard metadata](self, "metadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v19 ^ v26 ^ objc_msgSend(v27, "hash");
  -[SFCard drilldownMetadata](self, "drilldownMetadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "hash");
  -[SFCard backgroundImage](self, "backgroundImage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v28 ^ v30 ^ objc_msgSend(v31, "hash");

  return v32;
}

- (SFColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (NSString)cardId
{
  return self->_cardId;
}

- (void)setCardId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)cardSections
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCardSections:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)contextReferenceIdentifier
{
  return self->_contextReferenceIdentifier;
}

- (void)setContextReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)dismissalCommands
{
  return self->_dismissalCommands;
}

- (void)setDismissalCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)entityProtobufMessages
{
  return self->_entityProtobufMessages;
}

- (void)setEntityProtobufMessages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)fbr
{
  return self->_fbr;
}

- (void)setFbr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)flexibleSectionOrder
{
  return self->_flexibleSectionOrder;
}

- (NSData)intentMessageData
{
  return self->_intentMessageData;
}

- (void)setIntentMessageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)intentMessageName
{
  return self->_intentMessageName;
}

- (void)setIntentMessageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)intentResponseMessageData
{
  return self->_intentResponseMessageData;
}

- (void)setIntentResponseMessageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)intentResponseMessageName
{
  return self->_intentResponseMessageName;
}

- (void)setIntentResponseMessageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (SFDrillDownMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (SFDrillDownMetadata)drilldownMetadata
{
  return self->_drilldownMetadata;
}

- (void)setDrilldownMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_drilldownMetadata, a3);
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (void)setResultIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int)source
{
  return self->_source;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (SFImage)titleImage
{
  return self->_titleImage;
}

- (void)setTitleImage:(id)a3
{
  objc_storeStrong((id *)&self->_titleImage, a3);
}

- (int)type
{
  return self->_type;
}

- (NSURL)urlValue
{
  return self->_urlValue;
}

- (void)setUrlValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (SFImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (NSData)_originalCardData
{
  return self->_originalCardData;
}

- (void)_setOriginalCardData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalCardData, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_urlValue, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
  objc_storeStrong((id *)&self->_drilldownMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_intentResponseMessageName, 0);
  objc_storeStrong((id *)&self->_intentResponseMessageData, 0);
  objc_storeStrong((id *)&self->_intentMessageName, 0);
  objc_storeStrong((id *)&self->_intentMessageData, 0);
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_entityProtobufMessages, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_dismissalCommands, 0);
  objc_storeStrong((id *)&self->_contextReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_cardSections, 0);
  objc_storeStrong((id *)&self->_cardId, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
