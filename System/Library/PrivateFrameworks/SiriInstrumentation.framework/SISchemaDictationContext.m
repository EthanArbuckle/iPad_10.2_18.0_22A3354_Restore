@implementation SISchemaDictationContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SISchemaDictationContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v26, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaDictationContext keyboardLocale](self, "keyboardLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaDictationContext deleteKeyboardLocale](self, "deleteKeyboardLocale");
  -[SISchemaDictationContext dictationLocale](self, "dictationLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaDictationContext deleteDictationLocale](self, "deleteDictationLocale");
  -[SISchemaDictationContext userSelectedLocale](self, "userSelectedLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SISchemaDictationContext deleteUserSelectedLocale](self, "deleteUserSelectedLocale");
  -[SISchemaDictationContext siriSelectedLocale](self, "siriSelectedLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[SISchemaDictationContext deleteSiriSelectedLocale](self, "deleteSiriSelectedLocale");
  -[SISchemaDictationContext keyboardLocalesEnableds](self, "keyboardLocalesEnableds");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v18, v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaDictationContext setKeyboardLocalesEnableds:](self, "setKeyboardLocalesEnableds:", v19);

  -[SISchemaDictationContext dictationLocalesEnableds](self, "dictationLocalesEnableds");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v20, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaDictationContext setDictationLocalesEnableds:](self, "setDictationLocalesEnableds:", v21);

  -[SISchemaDictationContext textInputSessionId](self, "textInputSessionId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "applySensitiveConditionsPolicy:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "suppressMessage");

  if (v24)
    -[SISchemaDictationContext deleteTextInputSessionId](self, "deleteTextInputSessionId");

  return v5;
}

- (BOOL)hasKeyboardLanguage
{
  return self->_keyboardLanguage != 0;
}

- (void)deleteKeyboardLanguage
{
  -[SISchemaDictationContext setKeyboardLanguage:](self, "setKeyboardLanguage:", 0);
}

- (BOOL)hasKeyboardLocale
{
  return self->_keyboardLocale != 0;
}

- (void)deleteKeyboardLocale
{
  -[SISchemaDictationContext setKeyboardLocale:](self, "setKeyboardLocale:", 0);
}

- (BOOL)hasDictationLocale
{
  return self->_dictationLocale != 0;
}

- (void)deleteDictationLocale
{
  -[SISchemaDictationContext setDictationLocale:](self, "setDictationLocale:", 0);
}

- (BOOL)hasUserSelectedLocale
{
  return self->_userSelectedLocale != 0;
}

- (void)deleteUserSelectedLocale
{
  -[SISchemaDictationContext setUserSelectedLocale:](self, "setUserSelectedLocale:", 0);
}

- (BOOL)hasSiriSelectedLocale
{
  return self->_siriSelectedLocale != 0;
}

- (void)deleteSiriSelectedLocale
{
  -[SISchemaDictationContext setSiriSelectedLocale:](self, "setSiriSelectedLocale:", 0);
}

- (void)clearKeyboardLocalesEnabled
{
  -[NSArray removeAllObjects](self->_keyboardLocalesEnableds, "removeAllObjects");
}

- (void)addKeyboardLocalesEnabled:(id)a3
{
  id v4;
  NSArray *keyboardLocalesEnableds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  keyboardLocalesEnableds = self->_keyboardLocalesEnableds;
  v8 = v4;
  if (!keyboardLocalesEnableds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_keyboardLocalesEnableds;
    self->_keyboardLocalesEnableds = v6;

    v4 = v8;
    keyboardLocalesEnableds = self->_keyboardLocalesEnableds;
  }
  -[NSArray addObject:](keyboardLocalesEnableds, "addObject:", v4);

}

- (unint64_t)keyboardLocalesEnabledCount
{
  return -[NSArray count](self->_keyboardLocalesEnableds, "count");
}

- (id)keyboardLocalesEnabledAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_keyboardLocalesEnableds, "objectAtIndexedSubscript:", a3);
}

- (void)clearDictationLocalesEnabled
{
  -[NSArray removeAllObjects](self->_dictationLocalesEnableds, "removeAllObjects");
}

- (void)addDictationLocalesEnabled:(id)a3
{
  id v4;
  NSArray *dictationLocalesEnableds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  dictationLocalesEnableds = self->_dictationLocalesEnableds;
  v8 = v4;
  if (!dictationLocalesEnableds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_dictationLocalesEnableds;
    self->_dictationLocalesEnableds = v6;

    v4 = v8;
    dictationLocalesEnableds = self->_dictationLocalesEnableds;
  }
  -[NSArray addObject:](dictationLocalesEnableds, "addObject:", v4);

}

- (unint64_t)dictationLocalesEnabledCount
{
  return -[NSArray count](self->_dictationLocalesEnableds, "count");
}

- (id)dictationLocalesEnabledAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_dictationLocalesEnableds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)deleteBundleId
{
  -[SISchemaDictationContext setBundleId:](self, "setBundleId:", 0);
}

- (BOOL)hasTextInputSessionId
{
  return self->_textInputSessionId != 0;
}

- (void)deleteTextInputSessionId
{
  -[SISchemaDictationContext setTextInputSessionId:](self, "setTextInputSessionId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDictationContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
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
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
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
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SISchemaDictationContext keyboardLanguage](self, "keyboardLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[SISchemaDictationContext keyboardLocale](self, "keyboardLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SISchemaDictationContext keyboardLocale](self, "keyboardLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaDictationContext dictationLocale](self, "dictationLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SISchemaDictationContext dictationLocale](self, "dictationLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaDictationContext userSelectedLocale](self, "userSelectedLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SISchemaDictationContext userSelectedLocale](self, "userSelectedLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaDictationContext siriSelectedLocale](self, "siriSelectedLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SISchemaDictationContext siriSelectedLocale](self, "siriSelectedLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = self->_keyboardLocalesEnableds;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v16);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = self->_dictationLocalesEnableds;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v28;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v21);
  }

  -[SISchemaDictationContext bundleId](self, "bundleId", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    PBDataWriterWriteStringField();
  -[SISchemaDictationContext textInputSessionId](self, "textInputSessionId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[SISchemaDictationContext textInputSessionId](self, "textInputSessionId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  BOOL v52;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[SISchemaDictationContext keyboardLanguage](self, "keyboardLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[SISchemaDictationContext keyboardLanguage](self, "keyboardLanguage");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaDictationContext keyboardLanguage](self, "keyboardLanguage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyboardLanguage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_47;
  }
  else
  {

  }
  -[SISchemaDictationContext keyboardLocale](self, "keyboardLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[SISchemaDictationContext keyboardLocale](self, "keyboardLocale");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaDictationContext keyboardLocale](self, "keyboardLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyboardLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_47;
  }
  else
  {

  }
  -[SISchemaDictationContext dictationLocale](self, "dictationLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictationLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[SISchemaDictationContext dictationLocale](self, "dictationLocale");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SISchemaDictationContext dictationLocale](self, "dictationLocale");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictationLocale");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_47;
  }
  else
  {

  }
  -[SISchemaDictationContext userSelectedLocale](self, "userSelectedLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userSelectedLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[SISchemaDictationContext userSelectedLocale](self, "userSelectedLocale");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[SISchemaDictationContext userSelectedLocale](self, "userSelectedLocale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userSelectedLocale");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_47;
  }
  else
  {

  }
  -[SISchemaDictationContext siriSelectedLocale](self, "siriSelectedLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriSelectedLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[SISchemaDictationContext siriSelectedLocale](self, "siriSelectedLocale");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[SISchemaDictationContext siriSelectedLocale](self, "siriSelectedLocale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriSelectedLocale");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_47;
  }
  else
  {

  }
  -[SISchemaDictationContext keyboardLocalesEnableds](self, "keyboardLocalesEnableds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardLocalesEnableds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[SISchemaDictationContext keyboardLocalesEnableds](self, "keyboardLocalesEnableds");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[SISchemaDictationContext keyboardLocalesEnableds](self, "keyboardLocalesEnableds");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyboardLocalesEnableds");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_47;
  }
  else
  {

  }
  -[SISchemaDictationContext dictationLocalesEnableds](self, "dictationLocalesEnableds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictationLocalesEnableds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[SISchemaDictationContext dictationLocalesEnableds](self, "dictationLocalesEnableds");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[SISchemaDictationContext dictationLocalesEnableds](self, "dictationLocalesEnableds");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictationLocalesEnableds");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_47;
  }
  else
  {

  }
  -[SISchemaDictationContext bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[SISchemaDictationContext bundleId](self, "bundleId");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[SISchemaDictationContext bundleId](self, "bundleId");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_47;
  }
  else
  {

  }
  -[SISchemaDictationContext textInputSessionId](self, "textInputSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaDictationContext textInputSessionId](self, "textInputSessionId");
    v47 = objc_claimAutoreleasedReturnValue();
    if (!v47)
    {

LABEL_50:
      v52 = 1;
      goto LABEL_48;
    }
    v48 = (void *)v47;
    -[SISchemaDictationContext textInputSessionId](self, "textInputSessionId");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textInputSessionId");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if ((v51 & 1) != 0)
      goto LABEL_50;
  }
  else
  {
LABEL_46:

  }
LABEL_47:
  v52 = 0;
LABEL_48:

  return v52;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;

  v3 = -[NSString hash](self->_keyboardLanguage, "hash");
  v4 = -[SISchemaLocaleIdentifier hash](self->_keyboardLocale, "hash") ^ v3;
  v5 = -[SISchemaLocaleIdentifier hash](self->_dictationLocale, "hash");
  v6 = v4 ^ v5 ^ -[SISchemaLocaleIdentifier hash](self->_userSelectedLocale, "hash");
  v7 = -[SISchemaLocaleIdentifier hash](self->_siriSelectedLocale, "hash");
  v8 = v7 ^ -[NSArray hash](self->_keyboardLocalesEnableds, "hash");
  v9 = v6 ^ v8 ^ -[NSArray hash](self->_dictationLocalesEnableds, "hash");
  v10 = -[NSString hash](self->_bundleId, "hash");
  return v9 ^ v10 ^ -[SISchemaUUID hash](self->_textInputSessionId, "hash");
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
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
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
  void *v37;
  void *v38;
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
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bundleId)
  {
    -[SISchemaDictationContext bundleId](self, "bundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bundleId"));

  }
  if (self->_dictationLocale)
  {
    -[SISchemaDictationContext dictationLocale](self, "dictationLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("dictationLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("dictationLocale"));

    }
  }
  if (-[NSArray count](self->_dictationLocalesEnableds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v10 = self->_dictationLocalesEnableds;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v45 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v9, "addObject:", v15);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v16);

          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dictationLocalesEnabled"));
  }
  if (self->_keyboardLanguage)
  {
    -[SISchemaDictationContext keyboardLanguage](self, "keyboardLanguage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("keyboardLanguage"));

  }
  if (self->_keyboardLocale)
  {
    -[SISchemaDictationContext keyboardLocale](self, "keyboardLocale");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("keyboardLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("keyboardLocale"));

    }
  }
  if (-[NSArray count](self->_keyboardLocalesEnableds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v23 = self->_keyboardLocalesEnableds;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v41 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v40);
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
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("keyboardLocalesEnabled"));
  }
  if (self->_siriSelectedLocale)
  {
    -[SISchemaDictationContext siriSelectedLocale](self, "siriSelectedLocale");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("siriSelectedLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("siriSelectedLocale"));

    }
  }
  if (self->_textInputSessionId)
  {
    -[SISchemaDictationContext textInputSessionId](self, "textInputSessionId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("textInputSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("textInputSessionId"));

    }
  }
  if (self->_userSelectedLocale)
  {
    -[SISchemaDictationContext userSelectedLocale](self, "userSelectedLocale");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("userSelectedLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("userSelectedLocale"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v40);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaDictationContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaDictationContext)initWithJSON:(id)a3
{
  void *v4;
  SISchemaDictationContext *v5;
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
    self = -[SISchemaDictationContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaDictationContext)initWithDictionary:(id)a3
{
  id v4;
  SISchemaDictationContext *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaLocaleIdentifier *v9;
  void *v10;
  SISchemaLocaleIdentifier *v11;
  void *v12;
  SISchemaLocaleIdentifier *v13;
  uint64_t v14;
  SISchemaLocaleIdentifier *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  SISchemaLocaleIdentifier *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  SISchemaLocaleIdentifier *v31;
  void *v32;
  void *v33;
  void *v34;
  SISchemaUUID *v35;
  SISchemaDictationContext *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SISchemaDictationContext;
  v5 = -[SISchemaDictationContext init](&v51, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyboardLanguage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaDictationContext setKeyboardLanguage:](v5, "setKeyboardLanguage:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyboardLocale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaLocaleIdentifier initWithDictionary:]([SISchemaLocaleIdentifier alloc], "initWithDictionary:", v8);
      -[SISchemaDictationContext setKeyboardLocale:](v5, "setKeyboardLocale:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationLocale"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaLocaleIdentifier initWithDictionary:]([SISchemaLocaleIdentifier alloc], "initWithDictionary:", v10);
      -[SISchemaDictationContext setDictationLocale:](v5, "setDictationLocale:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userSelectedLocale"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaLocaleIdentifier initWithDictionary:]([SISchemaLocaleIdentifier alloc], "initWithDictionary:", v12);
      -[SISchemaDictationContext setUserSelectedLocale:](v5, "setUserSelectedLocale:", v13);

    }
    v41 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriSelectedLocale"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaLocaleIdentifier initWithDictionary:]([SISchemaLocaleIdentifier alloc], "initWithDictionary:", v14);
      -[SISchemaDictationContext setSiriSelectedLocale:](v5, "setSiriSelectedLocale:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyboardLocalesEnabled"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v42 = v16;
    v40 = v8;
    v39 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v48 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = -[SISchemaLocaleIdentifier initWithDictionary:]([SISchemaLocaleIdentifier alloc], "initWithDictionary:", v22);
              -[SISchemaDictationContext addKeyboardLocalesEnabled:](v5, "addKeyboardLocalesEnabled:", v23);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        }
        while (v19);
      }

      v8 = v40;
      v12 = v39;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationLocalesEnabled"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v44 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v31 = -[SISchemaLocaleIdentifier initWithDictionary:]([SISchemaLocaleIdentifier alloc], "initWithDictionary:", v30);
              -[SISchemaDictationContext addDictationLocalesEnabled:](v5, "addDictationLocalesEnabled:", v31);

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        }
        while (v27);
      }

      v8 = v40;
      v12 = v39;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = (void *)objc_msgSend(v32, "copy");
      -[SISchemaDictationContext setBundleId:](v5, "setBundleId:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textInputSessionId"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v34);
      -[SISchemaDictationContext setTextInputSessionId:](v5, "setTextInputSessionId:", v35);

    }
    v36 = v5;

  }
  return v5;
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (void)setKeyboardLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SISchemaLocaleIdentifier)keyboardLocale
{
  return self->_keyboardLocale;
}

- (void)setKeyboardLocale:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardLocale, a3);
}

- (SISchemaLocaleIdentifier)dictationLocale
{
  return self->_dictationLocale;
}

- (void)setDictationLocale:(id)a3
{
  objc_storeStrong((id *)&self->_dictationLocale, a3);
}

- (SISchemaLocaleIdentifier)userSelectedLocale
{
  return self->_userSelectedLocale;
}

- (void)setUserSelectedLocale:(id)a3
{
  objc_storeStrong((id *)&self->_userSelectedLocale, a3);
}

- (SISchemaLocaleIdentifier)siriSelectedLocale
{
  return self->_siriSelectedLocale;
}

- (void)setSiriSelectedLocale:(id)a3
{
  objc_storeStrong((id *)&self->_siriSelectedLocale, a3);
}

- (NSArray)keyboardLocalesEnableds
{
  return self->_keyboardLocalesEnableds;
}

- (void)setKeyboardLocalesEnableds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)dictationLocalesEnableds
{
  return self->_dictationLocalesEnableds;
}

- (void)setDictationLocalesEnableds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SISchemaUUID)textInputSessionId
{
  return self->_textInputSessionId;
}

- (void)setTextInputSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_textInputSessionId, a3);
}

- (void)setHasKeyboardLanguage:(BOOL)a3
{
  self->_hasKeyboardLanguage = a3;
}

- (void)setHasKeyboardLocale:(BOOL)a3
{
  self->_hasKeyboardLocale = a3;
}

- (void)setHasDictationLocale:(BOOL)a3
{
  self->_hasDictationLocale = a3;
}

- (void)setHasUserSelectedLocale:(BOOL)a3
{
  self->_hasUserSelectedLocale = a3;
}

- (void)setHasSiriSelectedLocale:(BOOL)a3
{
  self->_hasSiriSelectedLocale = a3;
}

- (void)setHasBundleId:(BOOL)a3
{
  self->_hasBundleId = a3;
}

- (void)setHasTextInputSessionId:(BOOL)a3
{
  self->_hasTextInputSessionId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInputSessionId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_dictationLocalesEnableds, 0);
  objc_storeStrong((id *)&self->_keyboardLocalesEnableds, 0);
  objc_storeStrong((id *)&self->_siriSelectedLocale, 0);
  objc_storeStrong((id *)&self->_userSelectedLocale, 0);
  objc_storeStrong((id *)&self->_dictationLocale, 0);
  objc_storeStrong((id *)&self->_keyboardLocale, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
}

@end
