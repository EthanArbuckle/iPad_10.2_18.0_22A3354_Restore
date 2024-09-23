@implementation FLOWSchemaFLOWSmsContext

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
  int v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FLOWSchemaFLOWSmsContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWSmsContext textMessageLength](self, "textMessageLength");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWSmsContext deleteTextMessageLength](self, "deleteTextMessageLength");
  -[FLOWSchemaFLOWSmsContext textContext](self, "textContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWSchemaFLOWSmsContext deleteTextContext](self, "deleteTextContext");
  -[FLOWSchemaFLOWSmsContext audioContext](self, "audioContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[FLOWSchemaFLOWSmsContext deleteAudioContext](self, "deleteAudioContext");
  -[FLOWSchemaFLOWSmsContext languageConfidenceMatrix](self, "languageConfidenceMatrix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[FLOWSchemaFLOWSmsContext deleteLanguageConfidenceMatrix](self, "deleteLanguageConfidenceMatrix");
  -[FLOWSchemaFLOWSmsContext richAttachmentIntelligenceFeatureUsage](self, "richAttachmentIntelligenceFeatureUsage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[FLOWSchemaFLOWSmsContext deleteRichAttachmentIntelligenceFeatureUsage](self, "deleteRichAttachmentIntelligenceFeatureUsage");

  return v5;
}

- (void)setMessageType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_messageType = a3;
}

- (BOOL)hasMessageType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasMessageType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteMessageType
{
  -[FLOWSchemaFLOWSmsContext setMessageType:](self, "setMessageType:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setEmojiUsed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_emojiUsed = a3;
}

- (BOOL)hasEmojiUsed
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasEmojiUsed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteEmojiUsed
{
  -[FLOWSchemaFLOWSmsContext setEmojiUsed:](self, "setEmojiUsed:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setKeyboardUsed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_keyboardUsed = a3;
}

- (BOOL)hasKeyboardUsed
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasKeyboardUsed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteKeyboardUsed
{
  -[FLOWSchemaFLOWSmsContext setKeyboardUsed:](self, "setKeyboardUsed:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)clearRecipientType
{
  -[NSArray removeAllObjects](self->_recipientTypes, "removeAllObjects");
}

- (void)addRecipientType:(int)a3
{
  uint64_t v3;
  NSArray *recipientTypes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  recipientTypes = self->_recipientTypes;
  if (!recipientTypes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_recipientTypes;
    self->_recipientTypes = v6;

    recipientTypes = self->_recipientTypes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](recipientTypes, "addObject:", v8);

}

- (unint64_t)recipientTypeCount
{
  return -[NSArray count](self->_recipientTypes, "count");
}

- (int)recipientTypeAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_recipientTypes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setMessageDurationMs:(unsigned int)a3
{
  FLOWSchemaFLOWTextMessageLength *textMessageLength;

  textMessageLength = self->_textMessageLength;
  self->_textMessageLength = 0;

  self->_whichMessagesize = 6;
  self->_messageDurationMs = a3;
}

- (unsigned)messageDurationMs
{
  if (self->_whichMessagesize == 6)
    return self->_messageDurationMs;
  else
    return 0;
}

- (void)deleteMessageDurationMs
{
  if (self->_whichMessagesize == 6)
  {
    self->_whichMessagesize = 0;
    self->_messageDurationMs = 0;
  }
}

- (void)setTextMessageLength:(id)a3
{
  unint64_t v3;

  self->_messageDurationMs = 0;
  v3 = 7;
  if (!a3)
    v3 = 0;
  self->_whichMessagesize = v3;
  objc_storeStrong((id *)&self->_textMessageLength, a3);
}

- (FLOWSchemaFLOWTextMessageLength)textMessageLength
{
  if (self->_whichMessagesize == 7)
    return self->_textMessageLength;
  else
    return (FLOWSchemaFLOWTextMessageLength *)0;
}

- (void)deleteTextMessageLength
{
  FLOWSchemaFLOWTextMessageLength *textMessageLength;

  if (self->_whichMessagesize == 7)
  {
    self->_whichMessagesize = 0;
    textMessageLength = self->_textMessageLength;
    self->_textMessageLength = 0;

  }
}

- (void)setTextContext:(id)a3
{
  FLOWSchemaFLOWSmsTextContext *v4;
  FLOWSchemaFLOWSmsAudioContext *audioContext;
  FLOWSchemaFLOWSmsTextContext *textContext;

  v4 = (FLOWSchemaFLOWSmsTextContext *)a3;
  audioContext = self->_audioContext;
  self->_audioContext = 0;

  self->_whichMessagecontext = 8 * (v4 != 0);
  textContext = self->_textContext;
  self->_textContext = v4;

}

- (FLOWSchemaFLOWSmsTextContext)textContext
{
  if (self->_whichMessagecontext == 8)
    return self->_textContext;
  else
    return (FLOWSchemaFLOWSmsTextContext *)0;
}

- (void)deleteTextContext
{
  FLOWSchemaFLOWSmsTextContext *textContext;

  if (self->_whichMessagecontext == 8)
  {
    self->_whichMessagecontext = 0;
    textContext = self->_textContext;
    self->_textContext = 0;

  }
}

- (void)setAudioContext:(id)a3
{
  FLOWSchemaFLOWSmsAudioContext *v4;
  FLOWSchemaFLOWSmsTextContext *textContext;
  unint64_t v6;
  FLOWSchemaFLOWSmsAudioContext *audioContext;

  v4 = (FLOWSchemaFLOWSmsAudioContext *)a3;
  textContext = self->_textContext;
  self->_textContext = 0;

  v6 = 9;
  if (!v4)
    v6 = 0;
  self->_whichMessagecontext = v6;
  audioContext = self->_audioContext;
  self->_audioContext = v4;

}

- (FLOWSchemaFLOWSmsAudioContext)audioContext
{
  if (self->_whichMessagecontext == 9)
    return self->_audioContext;
  else
    return (FLOWSchemaFLOWSmsAudioContext *)0;
}

- (void)deleteAudioContext
{
  FLOWSchemaFLOWSmsAudioContext *audioContext;

  if (self->_whichMessagecontext == 9)
  {
    self->_whichMessagecontext = 0;
    audioContext = self->_audioContext;
    self->_audioContext = 0;

  }
}

- (void)clearPersonType
{
  -[NSArray removeAllObjects](self->_personTypes, "removeAllObjects");
}

- (void)addPersonType:(int)a3
{
  uint64_t v3;
  NSArray *personTypes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  personTypes = self->_personTypes;
  if (!personTypes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_personTypes;
    self->_personTypes = v6;

    personTypes = self->_personTypes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](personTypes, "addObject:", v8);

}

- (unint64_t)personTypeCount
{
  return -[NSArray count](self->_personTypes, "count");
}

- (int)personTypeAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_personTypes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)clearReadMessageType
{
  -[NSArray removeAllObjects](self->_readMessageTypes, "removeAllObjects");
}

- (void)addReadMessageType:(int)a3
{
  uint64_t v3;
  NSArray *readMessageTypes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  readMessageTypes = self->_readMessageTypes;
  if (!readMessageTypes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_readMessageTypes;
    self->_readMessageTypes = v6;

    readMessageTypes = self->_readMessageTypes;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](readMessageTypes, "addObject:", v8);

}

- (unint64_t)readMessageTypeCount
{
  return -[NSArray count](self->_readMessageTypes, "count");
}

- (int)readMessageTypeAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_readMessageTypes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)clearIsMultiLingual
{
  -[NSArray removeAllObjects](self->_isMultiLinguals, "removeAllObjects");
}

- (void)addIsMultiLingual:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *isMultiLinguals;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = a3;
  isMultiLinguals = self->_isMultiLinguals;
  if (!isMultiLinguals)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_isMultiLinguals;
    self->_isMultiLinguals = v6;

    isMultiLinguals = self->_isMultiLinguals;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](isMultiLinguals, "addObject:", v8);

}

- (unint64_t)isMultiLingualCount
{
  return -[NSArray count](self->_isMultiLinguals, "count");
}

- (BOOL)isMultiLingualAtIndex:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSArray objectAtIndexedSubscript:](self->_isMultiLinguals, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)clearIsReadable
{
  -[NSArray removeAllObjects](self->_isReadables, "removeAllObjects");
}

- (void)addIsReadable:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *isReadables;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = a3;
  isReadables = self->_isReadables;
  if (!isReadables)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_isReadables;
    self->_isReadables = v6;

    isReadables = self->_isReadables;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](isReadables, "addObject:", v8);

}

- (unint64_t)isReadableCount
{
  return -[NSArray count](self->_isReadables, "count");
}

- (BOOL)isReadableAtIndex:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSArray objectAtIndexedSubscript:](self->_isReadables, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)clearIsGroupMessage
{
  -[NSArray removeAllObjects](self->_isGroupMessages, "removeAllObjects");
}

- (void)addIsGroupMessage:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *isGroupMessages;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = a3;
  isGroupMessages = self->_isGroupMessages;
  if (!isGroupMessages)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_isGroupMessages;
    self->_isGroupMessages = v6;

    isGroupMessages = self->_isGroupMessages;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](isGroupMessages, "addObject:", v8);

}

- (unint64_t)isGroupMessageCount
{
  return -[NSArray count](self->_isGroupMessages, "count");
}

- (BOOL)isGroupMessageAtIndex:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSArray objectAtIndexedSubscript:](self->_isGroupMessages, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)hasLanguageConfidenceMatrix
{
  return self->_languageConfidenceMatrix != 0;
}

- (void)deleteLanguageConfidenceMatrix
{
  -[FLOWSchemaFLOWSmsContext setLanguageConfidenceMatrix:](self, "setLanguageConfidenceMatrix:", 0);
}

- (void)setIsSenderShortCode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isSenderShortCode = a3;
}

- (BOOL)hasIsSenderShortCode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasIsSenderShortCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteIsSenderShortCode
{
  -[FLOWSchemaFLOWSmsContext setIsSenderShortCode:](self, "setIsSenderShortCode:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setIsLongMessage:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isLongMessage = a3;
}

- (BOOL)hasIsLongMessage
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasIsLongMessage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteIsLongMessage
{
  -[FLOWSchemaFLOWSmsContext setIsLongMessage:](self, "setIsLongMessage:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setIsReply:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isReply = a3;
}

- (BOOL)hasIsReply
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasIsReply:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteIsReply
{
  -[FLOWSchemaFLOWSmsContext setIsReply:](self, "setIsReply:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setAppendingActionReadMessagesCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_appendingActionReadMessagesCount = a3;
}

- (BOOL)hasAppendingActionReadMessagesCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasAppendingActionReadMessagesCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteAppendingActionReadMessagesCount
{
  -[FLOWSchemaFLOWSmsContext setAppendingActionReadMessagesCount:](self, "setAppendingActionReadMessagesCount:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)clearIsSenderShortCodeList
{
  -[NSArray removeAllObjects](self->_isSenderShortCodeLists, "removeAllObjects");
}

- (void)addIsSenderShortCodeList:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *isSenderShortCodeLists;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = a3;
  isSenderShortCodeLists = self->_isSenderShortCodeLists;
  if (!isSenderShortCodeLists)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_isSenderShortCodeLists;
    self->_isSenderShortCodeLists = v6;

    isSenderShortCodeLists = self->_isSenderShortCodeLists;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](isSenderShortCodeLists, "addObject:", v8);

}

- (unint64_t)isSenderShortCodeListCount
{
  return -[NSArray count](self->_isSenderShortCodeLists, "count");
}

- (BOOL)isSenderShortCodeListAtIndex:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSArray objectAtIndexedSubscript:](self->_isSenderShortCodeLists, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)clearIsLongMessageList
{
  -[NSArray removeAllObjects](self->_isLongMessageLists, "removeAllObjects");
}

- (void)addIsLongMessageList:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *isLongMessageLists;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = a3;
  isLongMessageLists = self->_isLongMessageLists;
  if (!isLongMessageLists)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_isLongMessageLists;
    self->_isLongMessageLists = v6;

    isLongMessageLists = self->_isLongMessageLists;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](isLongMessageLists, "addObject:", v8);

}

- (unint64_t)isLongMessageListCount
{
  return -[NSArray count](self->_isLongMessageLists, "count");
}

- (BOOL)isLongMessageListAtIndex:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSArray objectAtIndexedSubscript:](self->_isLongMessageLists, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)hasRichAttachmentIntelligenceFeatureUsage
{
  return self->_richAttachmentIntelligenceFeatureUsage != 0;
}

- (void)deleteRichAttachmentIntelligenceFeatureUsage
{
  -[FLOWSchemaFLOWSmsContext setRichAttachmentIntelligenceFeatureUsage:](self, "setRichAttachmentIntelligenceFeatureUsage:", 0);
}

- (void)clearMessageDurationsInSeconds
{
  -[NSArray removeAllObjects](self->_messageDurationsInSeconds, "removeAllObjects");
}

- (void)addMessageDurationsInSeconds:(unint64_t)a3
{
  NSArray *messageDurationsInSeconds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  messageDurationsInSeconds = self->_messageDurationsInSeconds;
  if (!messageDurationsInSeconds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_messageDurationsInSeconds;
    self->_messageDurationsInSeconds = v6;

    messageDurationsInSeconds = self->_messageDurationsInSeconds;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](messageDurationsInSeconds, "addObject:", v8);

}

- (unint64_t)messageDurationsInSecondsCount
{
  return -[NSArray count](self->_messageDurationsInSeconds, "count");
}

- (unint64_t)messageDurationsInSecondsAtIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_messageDurationsInSeconds, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (void)setUserPersona:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_userPersona = a3;
}

- (BOOL)hasUserPersona
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasUserPersona:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteUserPersona
{
  -[FLOWSchemaFLOWSmsContext setUserPersona:](self, "setUserPersona:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setIsSummarized:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isSummarized = a3;
}

- (BOOL)hasIsSummarized
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasIsSummarized:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteIsSummarized
{
  -[FLOWSchemaFLOWSmsContext setIsSummarized:](self, "setIsSummarized:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setSummarySourceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_summarySourceType = a3;
}

- (BOOL)hasSummarySourceType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasSummarySourceType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteSummarySourceType
{
  -[FLOWSchemaFLOWSmsContext setSummarySourceType:](self, "setSummarySourceType:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWSmsContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  NSArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t ii;
  void *v42;
  void *v43;
  __int16 v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t jj;
  NSArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t kk;
  void *v55;
  void *v56;
  NSArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t mm;
  __int16 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
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
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteBOOLField();
LABEL_5:
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v6 = self->_recipientTypes;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v96 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "intValue");
        PBDataWriterWriteInt32Field();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
    }
    while (v8);
  }

  if (self->_whichMessagesize == 6)
    PBDataWriterWriteUint32Field();
  -[FLOWSchemaFLOWSmsContext textMessageLength](self, "textMessageLength");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[FLOWSchemaFLOWSmsContext textMessageLength](self, "textMessageLength");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWSmsContext textContext](self, "textContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[FLOWSchemaFLOWSmsContext textContext](self, "textContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWSmsContext audioContext](self, "audioContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[FLOWSchemaFLOWSmsContext audioContext](self, "audioContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v17 = self->_personTypes;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v92;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v92 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * j), "intValue");
        PBDataWriterWriteInt32Field();
      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
    }
    while (v19);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v22 = self->_readMessageTypes;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v88;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v88 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * k), "intValue");
        PBDataWriterWriteInt32Field();
      }
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
    }
    while (v24);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v27 = self->_isMultiLinguals;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v83, v104, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v84;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v84 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * m), "BOOLValue");
        PBDataWriterWriteBOOLField();
      }
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v83, v104, 16);
    }
    while (v29);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v32 = self->_isReadables;
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v79, v103, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v80;
    do
    {
      for (n = 0; n != v34; ++n)
      {
        if (*(_QWORD *)v80 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * n), "BOOLValue");
        PBDataWriterWriteBOOLField();
      }
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v79, v103, 16);
    }
    while (v34);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v37 = self->_isGroupMessages;
  v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v75, v102, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v76;
    do
    {
      for (ii = 0; ii != v39; ++ii)
      {
        if (*(_QWORD *)v76 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * ii), "BOOLValue");
        PBDataWriterWriteBOOLField();
      }
      v39 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v75, v102, 16);
    }
    while (v39);
  }

  -[FLOWSchemaFLOWSmsContext languageConfidenceMatrix](self, "languageConfidenceMatrix");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[FLOWSchemaFLOWSmsContext languageConfidenceMatrix](self, "languageConfidenceMatrix");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v44 = (__int16)self->_has;
  if ((v44 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v44 = (__int16)self->_has;
    if ((v44 & 0x10) == 0)
    {
LABEL_59:
      if ((v44 & 0x20) == 0)
        goto LABEL_60;
      goto LABEL_95;
    }
  }
  else if ((v44 & 0x10) == 0)
  {
    goto LABEL_59;
  }
  PBDataWriterWriteBOOLField();
  v44 = (__int16)self->_has;
  if ((v44 & 0x20) == 0)
  {
LABEL_60:
    if ((v44 & 0x40) == 0)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_95:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_61:
    PBDataWriterWriteInt32Field();
LABEL_62:
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v45 = self->_isSenderShortCodeLists;
  v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v71, v101, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v72;
    do
    {
      for (jj = 0; jj != v47; ++jj)
      {
        if (*(_QWORD *)v72 != v48)
          objc_enumerationMutation(v45);
        objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * jj), "BOOLValue");
        PBDataWriterWriteBOOLField();
      }
      v47 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v71, v101, 16);
    }
    while (v47);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v50 = self->_isLongMessageLists;
  v51 = -[NSArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v67, v100, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v68;
    do
    {
      for (kk = 0; kk != v52; ++kk)
      {
        if (*(_QWORD *)v68 != v53)
          objc_enumerationMutation(v50);
        objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * kk), "BOOLValue");
        PBDataWriterWriteBOOLField();
      }
      v52 = -[NSArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v67, v100, 16);
    }
    while (v52);
  }

  -[FLOWSchemaFLOWSmsContext richAttachmentIntelligenceFeatureUsage](self, "richAttachmentIntelligenceFeatureUsage");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    -[FLOWSchemaFLOWSmsContext richAttachmentIntelligenceFeatureUsage](self, "richAttachmentIntelligenceFeatureUsage");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v57 = self->_messageDurationsInSeconds;
  v58 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v63, v99, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v64;
    do
    {
      for (mm = 0; mm != v59; ++mm)
      {
        if (*(_QWORD *)v64 != v60)
          objc_enumerationMutation(v57);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * mm), "unsignedLongLongValue", (_QWORD)v63);
        PBDataWriterWriteUint64Field();
      }
      v59 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v63, v99, 16);
    }
    while (v59);
  }

  v62 = (__int16)self->_has;
  if ((v62 & 0x80) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_87;
LABEL_98:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_89;
    goto LABEL_88;
  }
  PBDataWriterWriteInt32Field();
  v62 = (__int16)self->_has;
  if ((v62 & 0x100) != 0)
    goto LABEL_98;
LABEL_87:
  if ((v62 & 0x200) != 0)
LABEL_88:
    PBDataWriterWriteInt32Field();
LABEL_89:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  unint64_t whichMessagesize;
  unint64_t whichMessagecontext;
  $43EA71C45EF27CC8A4D45F36FE3240D2 has;
  unsigned int v8;
  int messageType;
  int v10;
  int emojiUsed;
  int v12;
  int keyboardUsed;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  unsigned int messageDurationMs;
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
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  $43EA71C45EF27CC8A4D45F36FE3240D2 v67;
  int v68;
  unsigned int v69;
  int isSenderShortCode;
  int v71;
  int isLongMessage;
  int v73;
  int isReply;
  int v75;
  int appendingActionReadMessagesCount;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  BOOL v97;
  $43EA71C45EF27CC8A4D45F36FE3240D2 v99;
  int v100;
  unsigned int v101;
  int userPersona;
  int v103;
  int isSummarized;
  int v105;
  int summarySourceType;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_101;
  whichMessagesize = self->_whichMessagesize;
  if (whichMessagesize != objc_msgSend(v4, "whichMessagesize"))
    goto LABEL_101;
  whichMessagecontext = self->_whichMessagecontext;
  if (whichMessagecontext != objc_msgSend(v4, "whichMessagecontext"))
    goto LABEL_101;
  has = self->_has;
  v8 = v4[78];
  if ((*(_BYTE *)&has & 1) != (v8 & 1))
    goto LABEL_101;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    messageType = self->_messageType;
    if (messageType != objc_msgSend(v4, "messageType"))
      goto LABEL_101;
    has = self->_has;
    v8 = v4[78];
  }
  v10 = (*(unsigned int *)&has >> 1) & 1;
  if (v10 != ((v8 >> 1) & 1))
    goto LABEL_101;
  if (v10)
  {
    emojiUsed = self->_emojiUsed;
    if (emojiUsed != objc_msgSend(v4, "emojiUsed"))
      goto LABEL_101;
    has = self->_has;
    v8 = v4[78];
  }
  v12 = (*(unsigned int *)&has >> 2) & 1;
  if (v12 != ((v8 >> 2) & 1))
    goto LABEL_101;
  if (v12)
  {
    keyboardUsed = self->_keyboardUsed;
    if (keyboardUsed != objc_msgSend(v4, "keyboardUsed"))
      goto LABEL_101;
  }
  -[FLOWSchemaFLOWSmsContext recipientTypes](self, "recipientTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipientTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_100;
  -[FLOWSchemaFLOWSmsContext recipientTypes](self, "recipientTypes");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[FLOWSchemaFLOWSmsContext recipientTypes](self, "recipientTypes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipientTypes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_101;
  }
  else
  {

  }
  messageDurationMs = self->_messageDurationMs;
  if (messageDurationMs != objc_msgSend(v4, "messageDurationMs"))
    goto LABEL_101;
  -[FLOWSchemaFLOWSmsContext textMessageLength](self, "textMessageLength");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textMessageLength");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_100;
  -[FLOWSchemaFLOWSmsContext textMessageLength](self, "textMessageLength");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[FLOWSchemaFLOWSmsContext textMessageLength](self, "textMessageLength");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textMessageLength");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_101;
  }
  else
  {

  }
  -[FLOWSchemaFLOWSmsContext textContext](self, "textContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_100;
  -[FLOWSchemaFLOWSmsContext textContext](self, "textContext");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[FLOWSchemaFLOWSmsContext textContext](self, "textContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_101;
  }
  else
  {

  }
  -[FLOWSchemaFLOWSmsContext audioContext](self, "audioContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_100;
  -[FLOWSchemaFLOWSmsContext audioContext](self, "audioContext");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[FLOWSchemaFLOWSmsContext audioContext](self, "audioContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_101;
  }
  else
  {

  }
  -[FLOWSchemaFLOWSmsContext personTypes](self, "personTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_100;
  -[FLOWSchemaFLOWSmsContext personTypes](self, "personTypes");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[FLOWSchemaFLOWSmsContext personTypes](self, "personTypes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personTypes");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_101;
  }
  else
  {

  }
  -[FLOWSchemaFLOWSmsContext readMessageTypes](self, "readMessageTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readMessageTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_100;
  -[FLOWSchemaFLOWSmsContext readMessageTypes](self, "readMessageTypes");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[FLOWSchemaFLOWSmsContext readMessageTypes](self, "readMessageTypes");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "readMessageTypes");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_101;
  }
  else
  {

  }
  -[FLOWSchemaFLOWSmsContext isMultiLinguals](self, "isMultiLinguals");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isMultiLinguals");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_100;
  -[FLOWSchemaFLOWSmsContext isMultiLinguals](self, "isMultiLinguals");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[FLOWSchemaFLOWSmsContext isMultiLinguals](self, "isMultiLinguals");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isMultiLinguals");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_101;
  }
  else
  {

  }
  -[FLOWSchemaFLOWSmsContext isReadables](self, "isReadables");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isReadables");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_100;
  -[FLOWSchemaFLOWSmsContext isReadables](self, "isReadables");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[FLOWSchemaFLOWSmsContext isReadables](self, "isReadables");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isReadables");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_101;
  }
  else
  {

  }
  -[FLOWSchemaFLOWSmsContext isGroupMessages](self, "isGroupMessages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isGroupMessages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_100;
  -[FLOWSchemaFLOWSmsContext isGroupMessages](self, "isGroupMessages");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[FLOWSchemaFLOWSmsContext isGroupMessages](self, "isGroupMessages");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isGroupMessages");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_101;
  }
  else
  {

  }
  -[FLOWSchemaFLOWSmsContext languageConfidenceMatrix](self, "languageConfidenceMatrix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageConfidenceMatrix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_100;
  -[FLOWSchemaFLOWSmsContext languageConfidenceMatrix](self, "languageConfidenceMatrix");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    -[FLOWSchemaFLOWSmsContext languageConfidenceMatrix](self, "languageConfidenceMatrix");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageConfidenceMatrix");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqual:", v65);

    if (!v66)
      goto LABEL_101;
  }
  else
  {

  }
  v67 = self->_has;
  v68 = (*(unsigned int *)&v67 >> 3) & 1;
  v69 = v4[78];
  if (v68 != ((v69 >> 3) & 1))
    goto LABEL_101;
  if (v68)
  {
    isSenderShortCode = self->_isSenderShortCode;
    if (isSenderShortCode != objc_msgSend(v4, "isSenderShortCode"))
      goto LABEL_101;
    v67 = self->_has;
    v69 = v4[78];
  }
  v71 = (*(unsigned int *)&v67 >> 4) & 1;
  if (v71 != ((v69 >> 4) & 1))
    goto LABEL_101;
  if (v71)
  {
    isLongMessage = self->_isLongMessage;
    if (isLongMessage != objc_msgSend(v4, "isLongMessage"))
      goto LABEL_101;
    v67 = self->_has;
    v69 = v4[78];
  }
  v73 = (*(unsigned int *)&v67 >> 5) & 1;
  if (v73 != ((v69 >> 5) & 1))
    goto LABEL_101;
  if (v73)
  {
    isReply = self->_isReply;
    if (isReply != objc_msgSend(v4, "isReply"))
      goto LABEL_101;
    v67 = self->_has;
    v69 = v4[78];
  }
  v75 = (*(unsigned int *)&v67 >> 6) & 1;
  if (v75 != ((v69 >> 6) & 1))
    goto LABEL_101;
  if (v75)
  {
    appendingActionReadMessagesCount = self->_appendingActionReadMessagesCount;
    if (appendingActionReadMessagesCount != objc_msgSend(v4, "appendingActionReadMessagesCount"))
      goto LABEL_101;
  }
  -[FLOWSchemaFLOWSmsContext isSenderShortCodeLists](self, "isSenderShortCodeLists");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isSenderShortCodeLists");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_100;
  -[FLOWSchemaFLOWSmsContext isSenderShortCodeLists](self, "isSenderShortCodeLists");
  v77 = objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    v78 = (void *)v77;
    -[FLOWSchemaFLOWSmsContext isSenderShortCodeLists](self, "isSenderShortCodeLists");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isSenderShortCodeLists");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v79, "isEqual:", v80);

    if (!v81)
      goto LABEL_101;
  }
  else
  {

  }
  -[FLOWSchemaFLOWSmsContext isLongMessageLists](self, "isLongMessageLists");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isLongMessageLists");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_100;
  -[FLOWSchemaFLOWSmsContext isLongMessageLists](self, "isLongMessageLists");
  v82 = objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (void *)v82;
    -[FLOWSchemaFLOWSmsContext isLongMessageLists](self, "isLongMessageLists");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isLongMessageLists");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v84, "isEqual:", v85);

    if (!v86)
      goto LABEL_101;
  }
  else
  {

  }
  -[FLOWSchemaFLOWSmsContext richAttachmentIntelligenceFeatureUsage](self, "richAttachmentIntelligenceFeatureUsage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "richAttachmentIntelligenceFeatureUsage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
    goto LABEL_100;
  -[FLOWSchemaFLOWSmsContext richAttachmentIntelligenceFeatureUsage](self, "richAttachmentIntelligenceFeatureUsage");
  v87 = objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    v88 = (void *)v87;
    -[FLOWSchemaFLOWSmsContext richAttachmentIntelligenceFeatureUsage](self, "richAttachmentIntelligenceFeatureUsage");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "richAttachmentIntelligenceFeatureUsage");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v89, "isEqual:", v90);

    if (!v91)
      goto LABEL_101;
  }
  else
  {

  }
  -[FLOWSchemaFLOWSmsContext messageDurationsInSeconds](self, "messageDurationsInSeconds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageDurationsInSeconds");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 == 0) == (v15 != 0))
  {
LABEL_100:

    goto LABEL_101;
  }
  -[FLOWSchemaFLOWSmsContext messageDurationsInSeconds](self, "messageDurationsInSeconds");
  v92 = objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    v93 = (void *)v92;
    -[FLOWSchemaFLOWSmsContext messageDurationsInSeconds](self, "messageDurationsInSeconds");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageDurationsInSeconds");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v94, "isEqual:", v95);

    if (!v96)
      goto LABEL_101;
  }
  else
  {

  }
  v99 = self->_has;
  v100 = (*(unsigned int *)&v99 >> 7) & 1;
  v101 = v4[78];
  if (v100 == ((v101 >> 7) & 1))
  {
    if (v100)
    {
      userPersona = self->_userPersona;
      if (userPersona != objc_msgSend(v4, "userPersona"))
        goto LABEL_101;
      v99 = self->_has;
      v101 = v4[78];
    }
    v103 = (*(unsigned int *)&v99 >> 8) & 1;
    if (v103 == ((v101 >> 8) & 1))
    {
      if (v103)
      {
        isSummarized = self->_isSummarized;
        if (isSummarized != objc_msgSend(v4, "isSummarized"))
          goto LABEL_101;
        v99 = self->_has;
        v101 = v4[78];
      }
      v105 = (*(unsigned int *)&v99 >> 9) & 1;
      if (v105 == ((v101 >> 9) & 1))
      {
        if (!v105
          || (summarySourceType = self->_summarySourceType,
              summarySourceType == objc_msgSend(v4, "summarySourceType")))
        {
          v97 = 1;
          goto LABEL_102;
        }
      }
    }
  }
LABEL_101:
  v97 = 0;
LABEL_102:

  return v97;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    v31 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v30 = 0;
    if ((has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v31 = 2654435761 * self->_messageType;
  if ((has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v30 = 2654435761 * self->_emojiUsed;
  if ((has & 4) != 0)
  {
LABEL_4:
    v29 = 2654435761 * self->_keyboardUsed;
    goto LABEL_8;
  }
LABEL_7:
  v29 = 0;
LABEL_8:
  v28 = -[NSArray hash](self->_recipientTypes, "hash");
  if (self->_whichMessagesize == 6)
    v27 = 2654435761 * self->_messageDurationMs;
  else
    v27 = 0;
  v26 = -[FLOWSchemaFLOWTextMessageLength hash](self->_textMessageLength, "hash");
  v25 = -[FLOWSchemaFLOWSmsTextContext hash](self->_textContext, "hash");
  v24 = -[FLOWSchemaFLOWSmsAudioContext hash](self->_audioContext, "hash");
  v23 = -[NSArray hash](self->_personTypes, "hash");
  v22 = -[NSArray hash](self->_readMessageTypes, "hash");
  v21 = -[NSArray hash](self->_isMultiLinguals, "hash");
  v20 = -[NSArray hash](self->_isReadables, "hash");
  v19 = -[NSArray hash](self->_isGroupMessages, "hash");
  v17 = -[FLOWSchemaFLOWLanguageConfidenceMatrix hash](self->_languageConfidenceMatrix, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 8) != 0)
  {
    v5 = 2654435761 * self->_isSenderShortCode;
    if ((v4 & 0x10) != 0)
    {
LABEL_13:
      v6 = 2654435761 * self->_isLongMessage;
      if ((v4 & 0x20) != 0)
        goto LABEL_14;
LABEL_18:
      v7 = 0;
      if ((v4 & 0x40) != 0)
        goto LABEL_15;
      goto LABEL_19;
    }
  }
  else
  {
    v5 = 0;
    if ((v4 & 0x10) != 0)
      goto LABEL_13;
  }
  v6 = 0;
  if ((v4 & 0x20) == 0)
    goto LABEL_18;
LABEL_14:
  v7 = 2654435761 * self->_isReply;
  if ((v4 & 0x40) != 0)
  {
LABEL_15:
    v8 = 2654435761 * self->_appendingActionReadMessagesCount;
    goto LABEL_20;
  }
LABEL_19:
  v8 = 0;
LABEL_20:
  v9 = -[NSArray hash](self->_isSenderShortCodeLists, "hash", v17);
  v10 = -[NSArray hash](self->_isLongMessageLists, "hash");
  v11 = -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage hash](self->_richAttachmentIntelligenceFeatureUsage, "hash");
  v12 = -[NSArray hash](self->_messageDurationsInSeconds, "hash");
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
    v13 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_22;
LABEL_25:
    v14 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_23;
LABEL_26:
    v15 = 0;
    return v30 ^ v31 ^ v29 ^ v27 ^ v28 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
  v13 = 2654435761 * self->_userPersona;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_25;
LABEL_22:
  v14 = 2654435761 * self->_isSummarized;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_26;
LABEL_23:
  v15 = 2654435761 * self->_summarySourceType;
  return v30 ^ v31 ^ v29 ^ v27 ^ v28 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int16 has;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int16 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  const __CFString *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  const __CFString *v53;
  id v54;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FLOWSchemaFLOWSmsContext appendingActionReadMessagesCount](self, "appendingActionReadMessagesCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("appendingActionReadMessagesCount"));

  }
  if (self->_audioContext)
  {
    -[FLOWSchemaFLOWSmsContext audioContext](self, "audioContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioContext"));

    }
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWSmsContext emojiUsed](self, "emojiUsed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("emojiUsed"));

  }
  if (-[NSArray count](self->_isGroupMessages, "count"))
  {
    -[FLOWSchemaFLOWSmsContext isGroupMessages](self, "isGroupMessages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isGroupMessage"));

  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWSmsContext isLongMessage](self, "isLongMessage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isLongMessage"));

  }
  if (-[NSArray count](self->_isLongMessageLists, "count"))
  {
    -[FLOWSchemaFLOWSmsContext isLongMessageLists](self, "isLongMessageLists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isLongMessageList"));

  }
  if (-[NSArray count](self->_isMultiLinguals, "count"))
  {
    -[FLOWSchemaFLOWSmsContext isMultiLinguals](self, "isMultiLinguals");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isMultiLingual"));

  }
  if (-[NSArray count](self->_isReadables, "count"))
  {
    -[FLOWSchemaFLOWSmsContext isReadables](self, "isReadables");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isReadable"));

  }
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWSmsContext isReply](self, "isReply"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("isReply"));

    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWSmsContext isSenderShortCode](self, "isSenderShortCode"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("isSenderShortCode"));

  }
  if (-[NSArray count](self->_isSenderShortCodeLists, "count"))
  {
    -[FLOWSchemaFLOWSmsContext isSenderShortCodeLists](self, "isSenderShortCodeLists");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("isSenderShortCodeList"));

  }
  v23 = (__int16)self->_has;
  if ((v23 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWSmsContext isSummarized](self, "isSummarized"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("isSummarized"));

    v23 = (__int16)self->_has;
  }
  if ((v23 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWSmsContext keyboardUsed](self, "keyboardUsed"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("keyboardUsed"));

  }
  if (self->_languageConfidenceMatrix)
  {
    -[FLOWSchemaFLOWSmsContext languageConfidenceMatrix](self, "languageConfidenceMatrix");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("languageConfidenceMatrix"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("languageConfidenceMatrix"));

    }
  }
  if (self->_whichMessagesize == 6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLOWSchemaFLOWSmsContext messageDurationMs](self, "messageDurationMs"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("messageDurationMs"));

  }
  if (-[NSArray count](self->_messageDurationsInSeconds, "count"))
  {
    -[FLOWSchemaFLOWSmsContext messageDurationsInSeconds](self, "messageDurationsInSeconds");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("messageDurationsInSeconds"));

  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    v32 = -[FLOWSchemaFLOWSmsContext messageType](self, "messageType") - 1;
    if (v32 > 3)
      v33 = CFSTR("FLOWMESSAGETYPE_UNKNOWN");
    else
      v33 = off_1E562E980[v32];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("messageType"));
  }
  if (-[NSArray count](self->_personTypes, "count"))
  {
    -[FLOWSchemaFLOWSmsContext personTypes](self, "personTypes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("personType"));

  }
  if (-[NSArray count](self->_readMessageTypes, "count"))
  {
    -[FLOWSchemaFLOWSmsContext readMessageTypes](self, "readMessageTypes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("readMessageType"));

  }
  if (-[NSArray count](self->_recipientTypes, "count"))
  {
    -[FLOWSchemaFLOWSmsContext recipientTypes](self, "recipientTypes");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("recipientType"));

  }
  if (self->_richAttachmentIntelligenceFeatureUsage)
  {
    -[FLOWSchemaFLOWSmsContext richAttachmentIntelligenceFeatureUsage](self, "richAttachmentIntelligenceFeatureUsage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("richAttachmentIntelligenceFeatureUsage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("richAttachmentIntelligenceFeatureUsage"));

    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v43 = -[FLOWSchemaFLOWSmsContext summarySourceType](self, "summarySourceType");
    v44 = CFSTR("FLOWSUMMARYSOURCETYPE_UNKNOWN");
    if (v43 == 1)
      v44 = CFSTR("FLOWSUMMARYSOURCETYPE_SINGLE_MESSAGE");
    if (v43 == 2)
      v45 = CFSTR("FLOWSUMMARYSOURCETYPE_MULTIPLE_MESSAGES");
    else
      v45 = v44;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("summarySourceType"));
  }
  if (self->_textContext)
  {
    -[FLOWSchemaFLOWSmsContext textContext](self, "textContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("textContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("textContext"));

    }
  }
  if (self->_textMessageLength)
  {
    -[FLOWSchemaFLOWSmsContext textMessageLength](self, "textMessageLength");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("textMessageLength"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("textMessageLength"));

    }
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v52 = -[FLOWSchemaFLOWSmsContext userPersona](self, "userPersona") - 1;
    if (v52 > 5)
      v53 = CFSTR("INFERENCEAPPSELECTIONUSERPERSONA_UNKNOWN");
    else
      v53 = off_1E562E9A0[v52];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("userPersona"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v54 = v3;

  return v54;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWSmsContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWSmsContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWSmsContext *v5;
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
    self = -[FLOWSchemaFLOWSmsContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWSmsContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWSmsContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  FLOWSchemaFLOWTextMessageLength *v18;
  uint64_t v19;
  FLOWSchemaFLOWSmsTextContext *v20;
  uint64_t v21;
  FLOWSchemaFLOWSmsAudioContext *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t n;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t ii;
  void *v59;
  uint64_t v60;
  FLOWSchemaFLOWLanguageConfidenceMatrix *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t jj;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t kk;
  void *v81;
  void *v82;
  FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage *v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t mm;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  FLOWSchemaFLOWSmsContext *v95;
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
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  objc_super v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v153.receiver = self;
  v153.super_class = (Class)FLOWSchemaFLOWSmsContext;
  v5 = -[FLOWSchemaFLOWSmsContext init](&v153, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsContext setMessageType:](v5, "setMessageType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("emojiUsed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsContext setEmojiUsed:](v5, "setEmojiUsed:", objc_msgSend(v7, "BOOLValue"));
    v103 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyboardUsed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsContext setKeyboardUsed:](v5, "setKeyboardUsed:", objc_msgSend(v8, "BOOLValue"));
    v102 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recipientType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v116 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v151 = 0u;
      v152 = 0u;
      v149 = 0u;
      v150 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v150;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v150 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWSmsContext addRecipientType:](v5, "addRecipientType:", objc_msgSend(v15, "intValue"));
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
        }
        while (v12);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageDurationMs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v115 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsContext setMessageDurationMs:](v5, "setMessageDurationMs:", objc_msgSend(v16, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textMessageLength"));
    v17 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v114 = (void *)v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[FLOWSchemaFLOWTextMessageLength initWithDictionary:]([FLOWSchemaFLOWTextMessageLength alloc], "initWithDictionary:", v17);
      -[FLOWSchemaFLOWSmsContext setTextMessageLength:](v5, "setTextMessageLength:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textContext"));
    v19 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v113 = (void *)v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[FLOWSchemaFLOWSmsTextContext initWithDictionary:]([FLOWSchemaFLOWSmsTextContext alloc], "initWithDictionary:", v19);
      -[FLOWSchemaFLOWSmsContext setTextContext:](v5, "setTextContext:", v20);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioContext"));
    v21 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v112 = (void *)v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[FLOWSchemaFLOWSmsAudioContext initWithDictionary:]([FLOWSchemaFLOWSmsAudioContext alloc], "initWithDictionary:", v21);
      -[FLOWSchemaFLOWSmsContext setAudioContext:](v5, "setAudioContext:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v111 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v147 = 0u;
      v148 = 0u;
      v145 = 0u;
      v146 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v146;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v146 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWSmsContext addPersonType:](v5, "addPersonType:", objc_msgSend(v29, "intValue"));
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
        }
        while (v26);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("readMessageType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v110 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v143 = 0u;
      v144 = 0u;
      v141 = 0u;
      v142 = 0u;
      v31 = v30;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v142;
        do
        {
          for (k = 0; k != v33; ++k)
          {
            if (*(_QWORD *)v142 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWSmsContext addReadMessageType:](v5, "addReadMessageType:", objc_msgSend(v36, "intValue"));
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
        }
        while (v33);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMultiLingual"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v109 = v37;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      v38 = v37;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v138;
        do
        {
          for (m = 0; m != v40; ++m)
          {
            if (*(_QWORD *)v138 != v41)
              objc_enumerationMutation(v38);
            v43 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWSmsContext addIsMultiLingual:](v5, "addIsMultiLingual:", objc_msgSend(v43, "BOOLValue"));
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
        }
        while (v40);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isReadable"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v108 = v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v135 = 0u;
      v136 = 0u;
      v133 = 0u;
      v134 = 0u;
      v45 = v44;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v133, v158, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v134;
        do
        {
          for (n = 0; n != v47; ++n)
          {
            if (*(_QWORD *)v134 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWSmsContext addIsReadable:](v5, "addIsReadable:", objc_msgSend(v50, "BOOLValue"));
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v133, v158, 16);
        }
        while (v47);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isGroupMessage"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = v6;
      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      v53 = v51;
      v54 = v51;
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v129, v157, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v130;
        do
        {
          for (ii = 0; ii != v56; ++ii)
          {
            if (*(_QWORD *)v130 != v57)
              objc_enumerationMutation(v54);
            v59 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * ii);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWSmsContext addIsGroupMessage:](v5, "addIsGroupMessage:", objc_msgSend(v59, "BOOLValue"));
          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v129, v157, 16);
        }
        while (v56);
      }

      v51 = v53;
      v6 = v52;
    }
    v107 = v51;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageConfidenceMatrix"));
    v60 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = -[FLOWSchemaFLOWLanguageConfidenceMatrix initWithDictionary:]([FLOWSchemaFLOWLanguageConfidenceMatrix alloc], "initWithDictionary:", v60);
      -[FLOWSchemaFLOWSmsContext setLanguageConfidenceMatrix:](v5, "setLanguageConfidenceMatrix:", v61);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSenderShortCode"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsContext setIsSenderShortCode:](v5, "setIsSenderShortCode:", objc_msgSend(v62, "BOOLValue"));
    v63 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLongMessage"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsContext setIsLongMessage:](v5, "setIsLongMessage:", objc_msgSend(v64, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isReply"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v106 = v65;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsContext setIsReply:](v5, "setIsReply:", objc_msgSend(v65, "BOOLValue"));
    v99 = v64;
    v100 = v62;
    v101 = (void *)v60;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appendingActionReadMessagesCount"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsContext setAppendingActionReadMessagesCount:](v5, "setAppendingActionReadMessagesCount:", objc_msgSend(v66, "intValue"));
    v98 = v66;
    v104 = v63;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSenderShortCodeList"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      v68 = v67;
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v125, v156, 16);
      if (v69)
      {
        v70 = v69;
        v71 = *(_QWORD *)v126;
        do
        {
          for (jj = 0; jj != v70; ++jj)
          {
            if (*(_QWORD *)v126 != v71)
              objc_enumerationMutation(v68);
            v73 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * jj);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWSmsContext addIsSenderShortCodeList:](v5, "addIsSenderShortCodeList:", objc_msgSend(v73, "BOOLValue"));
          }
          v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v125, v156, 16);
        }
        while (v70);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLongMessageList"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v105 = v74;
    v75 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v76 = v74;
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v121, v155, 16);
      if (v77)
      {
        v78 = v77;
        v79 = *(_QWORD *)v122;
        do
        {
          for (kk = 0; kk != v78; ++kk)
          {
            if (*(_QWORD *)v122 != v79)
              objc_enumerationMutation(v76);
            v81 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * kk);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWSmsContext addIsLongMessageList:](v5, "addIsLongMessageList:", objc_msgSend(v81, "BOOLValue"));
          }
          v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v121, v155, 16);
        }
        while (v78);
      }

      v4 = v75;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("richAttachmentIntelligenceFeatureUsage"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v83 = -[FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage initWithDictionary:]([FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage alloc], "initWithDictionary:", v82);
      -[FLOWSchemaFLOWSmsContext setRichAttachmentIntelligenceFeatureUsage:](v5, "setRichAttachmentIntelligenceFeatureUsage:", v83);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageDurationsInSeconds"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v85 = v107;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v97 = v67;
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v86 = v84;
      v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v117, v154, 16);
      if (v87)
      {
        v88 = v87;
        v89 = *(_QWORD *)v118;
        do
        {
          for (mm = 0; mm != v88; ++mm)
          {
            if (*(_QWORD *)v118 != v89)
              objc_enumerationMutation(v86);
            v91 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * mm);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[FLOWSchemaFLOWSmsContext addMessageDurationsInSeconds:](v5, "addMessageDurationsInSeconds:", objc_msgSend(v91, "unsignedLongLongValue"));
          }
          v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v117, v154, 16);
        }
        while (v88);
      }

      v4 = v75;
      v85 = v107;
      v67 = v97;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userPersona"), v97);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsContext setUserPersona:](v5, "setUserPersona:", objc_msgSend(v92, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSummarized"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsContext setIsSummarized:](v5, "setIsSummarized:", objc_msgSend(v93, "BOOLValue"));
    objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("summarySourceType"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWSmsContext setSummarySourceType:](v5, "setSummarySourceType:", objc_msgSend(v94, "intValue"));
    v95 = v5;

    v4 = v75;
  }

  return v5;
}

- (unint64_t)whichMessagesize
{
  return self->_whichMessagesize;
}

- (unint64_t)whichMessagecontext
{
  return self->_whichMessagecontext;
}

- (int)messageType
{
  return self->_messageType;
}

- (BOOL)emojiUsed
{
  return self->_emojiUsed;
}

- (BOOL)keyboardUsed
{
  return self->_keyboardUsed;
}

- (NSArray)recipientTypes
{
  return self->_recipientTypes;
}

- (void)setRecipientTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)personTypes
{
  return self->_personTypes;
}

- (void)setPersonTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)readMessageTypes
{
  return self->_readMessageTypes;
}

- (void)setReadMessageTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)isMultiLinguals
{
  return self->_isMultiLinguals;
}

- (void)setIsMultiLinguals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)isReadables
{
  return self->_isReadables;
}

- (void)setIsReadables:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)isGroupMessages
{
  return self->_isGroupMessages;
}

- (void)setIsGroupMessages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (FLOWSchemaFLOWLanguageConfidenceMatrix)languageConfidenceMatrix
{
  return self->_languageConfidenceMatrix;
}

- (void)setLanguageConfidenceMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_languageConfidenceMatrix, a3);
}

- (BOOL)isSenderShortCode
{
  return self->_isSenderShortCode;
}

- (BOOL)isLongMessage
{
  return self->_isLongMessage;
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (int)appendingActionReadMessagesCount
{
  return self->_appendingActionReadMessagesCount;
}

- (NSArray)isSenderShortCodeLists
{
  return self->_isSenderShortCodeLists;
}

- (void)setIsSenderShortCodeLists:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)isLongMessageLists
{
  return self->_isLongMessageLists;
}

- (void)setIsLongMessageLists:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (FLOWSchemaFLOWRichAttachmentIntelligenceFeatureUsage)richAttachmentIntelligenceFeatureUsage
{
  return self->_richAttachmentIntelligenceFeatureUsage;
}

- (void)setRichAttachmentIntelligenceFeatureUsage:(id)a3
{
  objc_storeStrong((id *)&self->_richAttachmentIntelligenceFeatureUsage, a3);
}

- (NSArray)messageDurationsInSeconds
{
  return self->_messageDurationsInSeconds;
}

- (void)setMessageDurationsInSeconds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int)userPersona
{
  return self->_userPersona;
}

- (BOOL)isSummarized
{
  return self->_isSummarized;
}

- (int)summarySourceType
{
  return self->_summarySourceType;
}

- (BOOL)hasMessageDurationMs
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasMessageDurationMs:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (BOOL)hasTextMessageLength
{
  return *((_BYTE *)&self->_has + 3);
}

- (void)setHasTextMessageLength:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (BOOL)hasTextContext
{
  return self->_hasMessageDurationMs;
}

- (void)setHasTextContext:(BOOL)a3
{
  self->_hasMessageDurationMs = a3;
}

- (BOOL)hasAudioContext
{
  return self->_hasTextMessageLength;
}

- (void)setHasAudioContext:(BOOL)a3
{
  self->_hasTextMessageLength = a3;
}

- (void)setHasLanguageConfidenceMatrix:(BOOL)a3
{
  self->_hasTextContext = a3;
}

- (void)setHasRichAttachmentIntelligenceFeatureUsage:(BOOL)a3
{
  self->_hasAudioContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDurationsInSeconds, 0);
  objc_storeStrong((id *)&self->_richAttachmentIntelligenceFeatureUsage, 0);
  objc_storeStrong((id *)&self->_isLongMessageLists, 0);
  objc_storeStrong((id *)&self->_isSenderShortCodeLists, 0);
  objc_storeStrong((id *)&self->_languageConfidenceMatrix, 0);
  objc_storeStrong((id *)&self->_isGroupMessages, 0);
  objc_storeStrong((id *)&self->_isReadables, 0);
  objc_storeStrong((id *)&self->_isMultiLinguals, 0);
  objc_storeStrong((id *)&self->_readMessageTypes, 0);
  objc_storeStrong((id *)&self->_personTypes, 0);
  objc_storeStrong((id *)&self->_audioContext, 0);
  objc_storeStrong((id *)&self->_textContext, 0);
  objc_storeStrong((id *)&self->_textMessageLength, 0);
  objc_storeStrong((id *)&self->_recipientTypes, 0);
}

@end
