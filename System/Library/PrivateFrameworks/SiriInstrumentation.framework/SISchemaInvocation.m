@implementation SISchemaInvocation

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
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SISchemaInvocation;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v28, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInvocation viewContainer](self, "viewContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaInvocation deleteViewContainer](self, "deleteViewContainer");
  -[SISchemaInvocation carPlayInvocationContext](self, "carPlayInvocationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaInvocation deleteCarPlayInvocationContext](self, "deleteCarPlayInvocationContext");
  -[SISchemaInvocation cardInvocationContext](self, "cardInvocationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SISchemaInvocation deleteCardInvocationContext](self, "deleteCardInvocationContext");
  -[SISchemaInvocation tvRemoteInvocationContext](self, "tvRemoteInvocationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[SISchemaInvocation deleteTvRemoteInvocationContext](self, "deleteTvRemoteInvocationContext");
  -[SISchemaInvocation keyboardInvocationContext](self, "keyboardInvocationContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[SISchemaInvocation deleteKeyboardInvocationContext](self, "deleteKeyboardInvocationContext");
  -[SISchemaInvocation hardwareButtonInvocationContext](self, "hardwareButtonInvocationContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[SISchemaInvocation deleteHardwareButtonInvocationContext](self, "deleteHardwareButtonInvocationContext");
  -[SISchemaInvocation bluetoothCarInvocationContext](self, "bluetoothCarInvocationContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[SISchemaInvocation deleteBluetoothCarInvocationContext](self, "deleteBluetoothCarInvocationContext");

  return v5;
}

- (void)setInvocationAction:(int)a3
{
  *(&self->_isDeviceLocked + 1) |= 1u;
  self->_invocationAction = a3;
}

- (BOOL)hasInvocationAction
{
  return *(&self->_isDeviceLocked + 1);
}

- (void)setHasInvocationAction:(BOOL)a3
{
  *(&self->_isDeviceLocked + 1) = *(&self->_isDeviceLocked + 1) & 0xFE | a3;
}

- (void)deleteInvocationAction
{
  -[SISchemaInvocation setInvocationAction:](self, "setInvocationAction:", 0);
  *(&self->_isDeviceLocked + 1) &= ~1u;
}

- (void)setInvocationSource:(int)a3
{
  *(&self->_isDeviceLocked + 1) |= 2u;
  self->_invocationSource = a3;
}

- (BOOL)hasInvocationSource
{
  return (*((unsigned __int8 *)&self->_isDeviceLocked + 1) >> 1) & 1;
}

- (void)setHasInvocationSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isDeviceLocked + 1) = *(&self->_isDeviceLocked + 1) & 0xFD | v3;
}

- (void)deleteInvocationSource
{
  -[SISchemaInvocation setInvocationSource:](self, "setInvocationSource:", 0);
  *(&self->_isDeviceLocked + 1) &= ~2u;
}

- (BOOL)hasViewContainer
{
  return self->_viewContainer != 0;
}

- (void)deleteViewContainer
{
  -[SISchemaInvocation setViewContainer:](self, "setViewContainer:", 0);
}

- (void)setCarPlayInvocationContext:(id)a3
{
  SISchemaCarPlayInvocationContext *v4;
  SISchemaVerticalLayoutCardSectionInvocationContext *cardInvocationContext;
  SISchemaTVRemoteInvocationContext *tvRemoteInvocationContext;
  SISchemaCardSectionKeyboardInvocationContext *keyboardInvocationContext;
  SISchemaHardwareButtonInvocationContext *hardwareButtonInvocationContext;
  SISchemaBluetoothCarInvocationContext *bluetoothCarInvocationContext;
  SISchemaCarPlayInvocationContext *carPlayInvocationContext;

  v4 = (SISchemaCarPlayInvocationContext *)a3;
  cardInvocationContext = self->_cardInvocationContext;
  self->_cardInvocationContext = 0;

  tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
  self->_tvRemoteInvocationContext = 0;

  keyboardInvocationContext = self->_keyboardInvocationContext;
  self->_keyboardInvocationContext = 0;

  hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
  self->_hardwareButtonInvocationContext = 0;

  bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
  self->_bluetoothCarInvocationContext = 0;

  self->_whichInvocationcontext = 4 * (v4 != 0);
  carPlayInvocationContext = self->_carPlayInvocationContext;
  self->_carPlayInvocationContext = v4;

}

- (SISchemaCarPlayInvocationContext)carPlayInvocationContext
{
  if (self->_whichInvocationcontext == 4)
    return self->_carPlayInvocationContext;
  else
    return (SISchemaCarPlayInvocationContext *)0;
}

- (void)deleteCarPlayInvocationContext
{
  SISchemaCarPlayInvocationContext *carPlayInvocationContext;

  if (self->_whichInvocationcontext == 4)
  {
    self->_whichInvocationcontext = 0;
    carPlayInvocationContext = self->_carPlayInvocationContext;
    self->_carPlayInvocationContext = 0;

  }
}

- (void)setCardInvocationContext:(id)a3
{
  SISchemaVerticalLayoutCardSectionInvocationContext *v4;
  SISchemaCarPlayInvocationContext *carPlayInvocationContext;
  SISchemaTVRemoteInvocationContext *tvRemoteInvocationContext;
  SISchemaCardSectionKeyboardInvocationContext *keyboardInvocationContext;
  SISchemaHardwareButtonInvocationContext *hardwareButtonInvocationContext;
  SISchemaBluetoothCarInvocationContext *bluetoothCarInvocationContext;
  unint64_t v10;
  SISchemaVerticalLayoutCardSectionInvocationContext *cardInvocationContext;

  v4 = (SISchemaVerticalLayoutCardSectionInvocationContext *)a3;
  carPlayInvocationContext = self->_carPlayInvocationContext;
  self->_carPlayInvocationContext = 0;

  tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
  self->_tvRemoteInvocationContext = 0;

  keyboardInvocationContext = self->_keyboardInvocationContext;
  self->_keyboardInvocationContext = 0;

  hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
  self->_hardwareButtonInvocationContext = 0;

  bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
  self->_bluetoothCarInvocationContext = 0;

  v10 = 5;
  if (!v4)
    v10 = 0;
  self->_whichInvocationcontext = v10;
  cardInvocationContext = self->_cardInvocationContext;
  self->_cardInvocationContext = v4;

}

- (SISchemaVerticalLayoutCardSectionInvocationContext)cardInvocationContext
{
  if (self->_whichInvocationcontext == 5)
    return self->_cardInvocationContext;
  else
    return (SISchemaVerticalLayoutCardSectionInvocationContext *)0;
}

- (void)deleteCardInvocationContext
{
  SISchemaVerticalLayoutCardSectionInvocationContext *cardInvocationContext;

  if (self->_whichInvocationcontext == 5)
  {
    self->_whichInvocationcontext = 0;
    cardInvocationContext = self->_cardInvocationContext;
    self->_cardInvocationContext = 0;

  }
}

- (void)setTvRemoteInvocationContext:(id)a3
{
  SISchemaTVRemoteInvocationContext *v4;
  SISchemaCarPlayInvocationContext *carPlayInvocationContext;
  SISchemaVerticalLayoutCardSectionInvocationContext *cardInvocationContext;
  SISchemaCardSectionKeyboardInvocationContext *keyboardInvocationContext;
  SISchemaHardwareButtonInvocationContext *hardwareButtonInvocationContext;
  SISchemaBluetoothCarInvocationContext *bluetoothCarInvocationContext;
  unint64_t v10;
  SISchemaTVRemoteInvocationContext *tvRemoteInvocationContext;

  v4 = (SISchemaTVRemoteInvocationContext *)a3;
  carPlayInvocationContext = self->_carPlayInvocationContext;
  self->_carPlayInvocationContext = 0;

  cardInvocationContext = self->_cardInvocationContext;
  self->_cardInvocationContext = 0;

  keyboardInvocationContext = self->_keyboardInvocationContext;
  self->_keyboardInvocationContext = 0;

  hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
  self->_hardwareButtonInvocationContext = 0;

  bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
  self->_bluetoothCarInvocationContext = 0;

  v10 = 7;
  if (!v4)
    v10 = 0;
  self->_whichInvocationcontext = v10;
  tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
  self->_tvRemoteInvocationContext = v4;

}

- (SISchemaTVRemoteInvocationContext)tvRemoteInvocationContext
{
  if (self->_whichInvocationcontext == 7)
    return self->_tvRemoteInvocationContext;
  else
    return (SISchemaTVRemoteInvocationContext *)0;
}

- (void)deleteTvRemoteInvocationContext
{
  SISchemaTVRemoteInvocationContext *tvRemoteInvocationContext;

  if (self->_whichInvocationcontext == 7)
  {
    self->_whichInvocationcontext = 0;
    tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
    self->_tvRemoteInvocationContext = 0;

  }
}

- (void)setKeyboardInvocationContext:(id)a3
{
  SISchemaCardSectionKeyboardInvocationContext *v4;
  SISchemaCarPlayInvocationContext *carPlayInvocationContext;
  SISchemaVerticalLayoutCardSectionInvocationContext *cardInvocationContext;
  SISchemaTVRemoteInvocationContext *tvRemoteInvocationContext;
  SISchemaHardwareButtonInvocationContext *hardwareButtonInvocationContext;
  SISchemaBluetoothCarInvocationContext *bluetoothCarInvocationContext;
  SISchemaCardSectionKeyboardInvocationContext *keyboardInvocationContext;

  v4 = (SISchemaCardSectionKeyboardInvocationContext *)a3;
  carPlayInvocationContext = self->_carPlayInvocationContext;
  self->_carPlayInvocationContext = 0;

  cardInvocationContext = self->_cardInvocationContext;
  self->_cardInvocationContext = 0;

  tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
  self->_tvRemoteInvocationContext = 0;

  hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
  self->_hardwareButtonInvocationContext = 0;

  bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
  self->_bluetoothCarInvocationContext = 0;

  self->_whichInvocationcontext = 8 * (v4 != 0);
  keyboardInvocationContext = self->_keyboardInvocationContext;
  self->_keyboardInvocationContext = v4;

}

- (SISchemaCardSectionKeyboardInvocationContext)keyboardInvocationContext
{
  if (self->_whichInvocationcontext == 8)
    return self->_keyboardInvocationContext;
  else
    return (SISchemaCardSectionKeyboardInvocationContext *)0;
}

- (void)deleteKeyboardInvocationContext
{
  SISchemaCardSectionKeyboardInvocationContext *keyboardInvocationContext;

  if (self->_whichInvocationcontext == 8)
  {
    self->_whichInvocationcontext = 0;
    keyboardInvocationContext = self->_keyboardInvocationContext;
    self->_keyboardInvocationContext = 0;

  }
}

- (void)setHardwareButtonInvocationContext:(id)a3
{
  SISchemaHardwareButtonInvocationContext *v4;
  SISchemaCarPlayInvocationContext *carPlayInvocationContext;
  SISchemaVerticalLayoutCardSectionInvocationContext *cardInvocationContext;
  SISchemaTVRemoteInvocationContext *tvRemoteInvocationContext;
  SISchemaCardSectionKeyboardInvocationContext *keyboardInvocationContext;
  SISchemaBluetoothCarInvocationContext *bluetoothCarInvocationContext;
  unint64_t v10;
  SISchemaHardwareButtonInvocationContext *hardwareButtonInvocationContext;

  v4 = (SISchemaHardwareButtonInvocationContext *)a3;
  carPlayInvocationContext = self->_carPlayInvocationContext;
  self->_carPlayInvocationContext = 0;

  cardInvocationContext = self->_cardInvocationContext;
  self->_cardInvocationContext = 0;

  tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
  self->_tvRemoteInvocationContext = 0;

  keyboardInvocationContext = self->_keyboardInvocationContext;
  self->_keyboardInvocationContext = 0;

  bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
  self->_bluetoothCarInvocationContext = 0;

  v10 = 9;
  if (!v4)
    v10 = 0;
  self->_whichInvocationcontext = v10;
  hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
  self->_hardwareButtonInvocationContext = v4;

}

- (SISchemaHardwareButtonInvocationContext)hardwareButtonInvocationContext
{
  if (self->_whichInvocationcontext == 9)
    return self->_hardwareButtonInvocationContext;
  else
    return (SISchemaHardwareButtonInvocationContext *)0;
}

- (void)deleteHardwareButtonInvocationContext
{
  SISchemaHardwareButtonInvocationContext *hardwareButtonInvocationContext;

  if (self->_whichInvocationcontext == 9)
  {
    self->_whichInvocationcontext = 0;
    hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
    self->_hardwareButtonInvocationContext = 0;

  }
}

- (void)setBluetoothCarInvocationContext:(id)a3
{
  SISchemaBluetoothCarInvocationContext *v4;
  SISchemaCarPlayInvocationContext *carPlayInvocationContext;
  SISchemaVerticalLayoutCardSectionInvocationContext *cardInvocationContext;
  SISchemaTVRemoteInvocationContext *tvRemoteInvocationContext;
  SISchemaCardSectionKeyboardInvocationContext *keyboardInvocationContext;
  SISchemaHardwareButtonInvocationContext *hardwareButtonInvocationContext;
  unint64_t v10;
  SISchemaBluetoothCarInvocationContext *bluetoothCarInvocationContext;

  v4 = (SISchemaBluetoothCarInvocationContext *)a3;
  carPlayInvocationContext = self->_carPlayInvocationContext;
  self->_carPlayInvocationContext = 0;

  cardInvocationContext = self->_cardInvocationContext;
  self->_cardInvocationContext = 0;

  tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
  self->_tvRemoteInvocationContext = 0;

  keyboardInvocationContext = self->_keyboardInvocationContext;
  self->_keyboardInvocationContext = 0;

  hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
  self->_hardwareButtonInvocationContext = 0;

  v10 = 10;
  if (!v4)
    v10 = 0;
  self->_whichInvocationcontext = v10;
  bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
  self->_bluetoothCarInvocationContext = v4;

}

- (SISchemaBluetoothCarInvocationContext)bluetoothCarInvocationContext
{
  if (self->_whichInvocationcontext == 10)
    return self->_bluetoothCarInvocationContext;
  else
    return (SISchemaBluetoothCarInvocationContext *)0;
}

- (void)deleteBluetoothCarInvocationContext
{
  SISchemaBluetoothCarInvocationContext *bluetoothCarInvocationContext;

  if (self->_whichInvocationcontext == 10)
  {
    self->_whichInvocationcontext = 0;
    bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
    self->_bluetoothCarInvocationContext = 0;

  }
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  *(&self->_isDeviceLocked + 1) |= 4u;
  self->_isDeviceLocked = a3;
}

- (BOOL)hasIsDeviceLocked
{
  return (*((unsigned __int8 *)&self->_isDeviceLocked + 1) >> 2) & 1;
}

- (void)setHasIsDeviceLocked:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isDeviceLocked + 1) = *(&self->_isDeviceLocked + 1) & 0xFB | v3;
}

- (void)deleteIsDeviceLocked
{
  -[SISchemaInvocation setIsDeviceLocked:](self, "setIsDeviceLocked:", 0);
  *(&self->_isDeviceLocked + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaInvocationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
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
  id v19;

  v19 = a3;
  v4 = *(&self->_isDeviceLocked + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = *(&self->_isDeviceLocked + 1);
  }
  if ((v4 & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[SISchemaInvocation viewContainer](self, "viewContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SISchemaInvocation viewContainer](self, "viewContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaInvocation carPlayInvocationContext](self, "carPlayInvocationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SISchemaInvocation carPlayInvocationContext](self, "carPlayInvocationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaInvocation cardInvocationContext](self, "cardInvocationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SISchemaInvocation cardInvocationContext](self, "cardInvocationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaInvocation tvRemoteInvocationContext](self, "tvRemoteInvocationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SISchemaInvocation tvRemoteInvocationContext](self, "tvRemoteInvocationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaInvocation keyboardInvocationContext](self, "keyboardInvocationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SISchemaInvocation keyboardInvocationContext](self, "keyboardInvocationContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaInvocation hardwareButtonInvocationContext](self, "hardwareButtonInvocationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SISchemaInvocation hardwareButtonInvocationContext](self, "hardwareButtonInvocationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaInvocation bluetoothCarInvocationContext](self, "bluetoothCarInvocationContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[SISchemaInvocation bluetoothCarInvocationContext](self, "bluetoothCarInvocationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(&self->_isDeviceLocked + 1) & 4) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unint64_t whichInvocationcontext;
  unsigned int v6;
  unsigned int v7;
  int invocationAction;
  int v9;
  int invocationSource;
  void *v11;
  void *v12;
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
  BOOL v48;
  int v50;
  int isDeviceLocked;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_45;
  whichInvocationcontext = self->_whichInvocationcontext;
  if (whichInvocationcontext != objc_msgSend(v4, "whichInvocationcontext"))
    goto LABEL_45;
  v6 = *((unsigned __int8 *)&self->_isDeviceLocked + 1);
  v7 = v4[73];
  if ((v6 & 1) != (v7 & 1))
    goto LABEL_45;
  if ((v6 & 1) != 0)
  {
    invocationAction = self->_invocationAction;
    if (invocationAction != objc_msgSend(v4, "invocationAction"))
      goto LABEL_45;
    v6 = *((unsigned __int8 *)&self->_isDeviceLocked + 1);
    v7 = v4[73];
  }
  v9 = (v6 >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1))
    goto LABEL_45;
  if (v9)
  {
    invocationSource = self->_invocationSource;
    if (invocationSource != objc_msgSend(v4, "invocationSource"))
      goto LABEL_45;
  }
  -[SISchemaInvocation viewContainer](self, "viewContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_44;
  -[SISchemaInvocation viewContainer](self, "viewContainer");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SISchemaInvocation viewContainer](self, "viewContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_45;
  }
  else
  {

  }
  -[SISchemaInvocation carPlayInvocationContext](self, "carPlayInvocationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carPlayInvocationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_44;
  -[SISchemaInvocation carPlayInvocationContext](self, "carPlayInvocationContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[SISchemaInvocation carPlayInvocationContext](self, "carPlayInvocationContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carPlayInvocationContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_45;
  }
  else
  {

  }
  -[SISchemaInvocation cardInvocationContext](self, "cardInvocationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardInvocationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_44;
  -[SISchemaInvocation cardInvocationContext](self, "cardInvocationContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[SISchemaInvocation cardInvocationContext](self, "cardInvocationContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardInvocationContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_45;
  }
  else
  {

  }
  -[SISchemaInvocation tvRemoteInvocationContext](self, "tvRemoteInvocationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tvRemoteInvocationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_44;
  -[SISchemaInvocation tvRemoteInvocationContext](self, "tvRemoteInvocationContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[SISchemaInvocation tvRemoteInvocationContext](self, "tvRemoteInvocationContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvRemoteInvocationContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_45;
  }
  else
  {

  }
  -[SISchemaInvocation keyboardInvocationContext](self, "keyboardInvocationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardInvocationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_44;
  -[SISchemaInvocation keyboardInvocationContext](self, "keyboardInvocationContext");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[SISchemaInvocation keyboardInvocationContext](self, "keyboardInvocationContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyboardInvocationContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_45;
  }
  else
  {

  }
  -[SISchemaInvocation hardwareButtonInvocationContext](self, "hardwareButtonInvocationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hardwareButtonInvocationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_44;
  -[SISchemaInvocation hardwareButtonInvocationContext](self, "hardwareButtonInvocationContext");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[SISchemaInvocation hardwareButtonInvocationContext](self, "hardwareButtonInvocationContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hardwareButtonInvocationContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_45;
  }
  else
  {

  }
  -[SISchemaInvocation bluetoothCarInvocationContext](self, "bluetoothCarInvocationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bluetoothCarInvocationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
  {
LABEL_44:

    goto LABEL_45;
  }
  -[SISchemaInvocation bluetoothCarInvocationContext](self, "bluetoothCarInvocationContext");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[SISchemaInvocation bluetoothCarInvocationContext](self, "bluetoothCarInvocationContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bluetoothCarInvocationContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_45;
  }
  else
  {

  }
  v50 = (*((unsigned __int8 *)&self->_isDeviceLocked + 1) >> 2) & 1;
  if (v50 == ((v4[73] >> 2) & 1))
  {
    if (!v50
      || (isDeviceLocked = self->_isDeviceLocked, isDeviceLocked == objc_msgSend(v4, "isDeviceLocked")))
    {
      v48 = 1;
      goto LABEL_46;
    }
  }
LABEL_45:
  v48 = 0;
LABEL_46:

  return v48;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (*(&self->_isDeviceLocked + 1))
  {
    v3 = 2654435761 * self->_invocationAction;
    if ((*(&self->_isDeviceLocked + 1) & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(&self->_isDeviceLocked + 1) & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_invocationSource;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[SISchemaViewContainer hash](self->_viewContainer, "hash");
  v6 = -[SISchemaCarPlayInvocationContext hash](self->_carPlayInvocationContext, "hash");
  v7 = -[SISchemaVerticalLayoutCardSectionInvocationContext hash](self->_cardInvocationContext, "hash");
  v8 = -[SISchemaTVRemoteInvocationContext hash](self->_tvRemoteInvocationContext, "hash");
  v9 = -[SISchemaCardSectionKeyboardInvocationContext hash](self->_keyboardInvocationContext, "hash");
  v10 = -[SISchemaHardwareButtonInvocationContext hash](self->_hardwareButtonInvocationContext, "hash");
  v11 = -[SISchemaBluetoothCarInvocationContext hash](self->_bluetoothCarInvocationContext, "hash");
  if ((*(&self->_isDeviceLocked + 1) & 4) != 0)
    v12 = 2654435761 * self->_isDeviceLocked;
  else
    v12 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
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
  char v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bluetoothCarInvocationContext)
  {
    -[SISchemaInvocation bluetoothCarInvocationContext](self, "bluetoothCarInvocationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bluetoothCarInvocationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("bluetoothCarInvocationContext"));

    }
  }
  if (self->_carPlayInvocationContext)
  {
    -[SISchemaInvocation carPlayInvocationContext](self, "carPlayInvocationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("carPlayInvocationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("carPlayInvocationContext"));

    }
  }
  if (self->_cardInvocationContext)
  {
    -[SISchemaInvocation cardInvocationContext](self, "cardInvocationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("cardInvocationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("cardInvocationContext"));

    }
  }
  if (self->_hardwareButtonInvocationContext)
  {
    -[SISchemaInvocation hardwareButtonInvocationContext](self, "hardwareButtonInvocationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hardwareButtonInvocationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hardwareButtonInvocationContext"));

    }
  }
  v16 = *(&self->_isDeviceLocked + 1);
  if ((v16 & 1) != 0)
  {
    v20 = -[SISchemaInvocation invocationAction](self, "invocationAction") - 1;
    if (v20 > 0xE)
      v21 = CFSTR("INVOCATIONACTION_UNKNOWN_INVOCATION_ACTION");
    else
      v21 = off_1E56368E8[v20];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("invocationAction"));
    v16 = *(&self->_isDeviceLocked + 1);
    if ((v16 & 2) == 0)
    {
LABEL_23:
      if ((v16 & 4) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(&self->_isDeviceLocked + 1) & 2) == 0)
  {
    goto LABEL_23;
  }
  v25 = -[SISchemaInvocation invocationSource](self, "invocationSource") - 1;
  if (v25 > 0x5F)
    v26 = CFSTR("INVOCATIONSOURCE_UNKNOWN_INVOCATION_SOURCE");
  else
    v26 = off_1E5636960[v25];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("invocationSource"));
  if ((*(&self->_isDeviceLocked + 1) & 4) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaInvocation isDeviceLocked](self, "isDeviceLocked"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isDeviceLocked"));

  }
LABEL_25:
  if (self->_keyboardInvocationContext)
  {
    -[SISchemaInvocation keyboardInvocationContext](self, "keyboardInvocationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("keyboardInvocationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("keyboardInvocationContext"));

    }
  }
  if (self->_tvRemoteInvocationContext)
  {
    -[SISchemaInvocation tvRemoteInvocationContext](self, "tvRemoteInvocationContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("tvRemoteInvocationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("tvRemoteInvocationContext"));

    }
  }
  if (self->_viewContainer)
  {
    -[SISchemaInvocation viewContainer](self, "viewContainer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("viewContainer"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("viewContainer"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaInvocation dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaInvocation)initWithJSON:(id)a3
{
  void *v4;
  SISchemaInvocation *v5;
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
    self = -[SISchemaInvocation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaInvocation)initWithDictionary:(id)a3
{
  id v4;
  SISchemaInvocation *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaViewContainer *v9;
  void *v10;
  SISchemaCarPlayInvocationContext *v11;
  void *v12;
  SISchemaVerticalLayoutCardSectionInvocationContext *v13;
  void *v14;
  SISchemaTVRemoteInvocationContext *v15;
  void *v16;
  SISchemaCardSectionKeyboardInvocationContext *v17;
  void *v18;
  SISchemaHardwareButtonInvocationContext *v19;
  void *v20;
  SISchemaBluetoothCarInvocationContext *v21;
  void *v22;
  SISchemaInvocation *v23;
  void *v25;
  void *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SISchemaInvocation;
  v5 = -[SISchemaInvocation init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invocationAction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaInvocation setInvocationAction:](v5, "setInvocationAction:", objc_msgSend(v6, "intValue"));
    v26 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invocationSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaInvocation setInvocationSource:](v5, "setInvocationSource:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewContainer"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaViewContainer initWithDictionary:]([SISchemaViewContainer alloc], "initWithDictionary:", v8);
      -[SISchemaInvocation setViewContainer:](v5, "setViewContainer:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carPlayInvocationContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaCarPlayInvocationContext initWithDictionary:]([SISchemaCarPlayInvocationContext alloc], "initWithDictionary:", v10);
      -[SISchemaInvocation setCarPlayInvocationContext:](v5, "setCarPlayInvocationContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardInvocationContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaVerticalLayoutCardSectionInvocationContext initWithDictionary:]([SISchemaVerticalLayoutCardSectionInvocationContext alloc], "initWithDictionary:", v12);
      -[SISchemaInvocation setCardInvocationContext:](v5, "setCardInvocationContext:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tvRemoteInvocationContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaTVRemoteInvocationContext initWithDictionary:]([SISchemaTVRemoteInvocationContext alloc], "initWithDictionary:", v14);
      -[SISchemaInvocation setTvRemoteInvocationContext:](v5, "setTvRemoteInvocationContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyboardInvocationContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[SISchemaCardSectionKeyboardInvocationContext initWithDictionary:]([SISchemaCardSectionKeyboardInvocationContext alloc], "initWithDictionary:", v16);
      -[SISchemaInvocation setKeyboardInvocationContext:](v5, "setKeyboardInvocationContext:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hardwareButtonInvocationContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[SISchemaHardwareButtonInvocationContext initWithDictionary:]([SISchemaHardwareButtonInvocationContext alloc], "initWithDictionary:", v18);
      -[SISchemaInvocation setHardwareButtonInvocationContext:](v5, "setHardwareButtonInvocationContext:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bluetoothCarInvocationContext"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[SISchemaBluetoothCarInvocationContext initWithDictionary:]([SISchemaBluetoothCarInvocationContext alloc], "initWithDictionary:", v20);
      -[SISchemaInvocation setBluetoothCarInvocationContext:](v5, "setBluetoothCarInvocationContext:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDeviceLocked"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaInvocation setIsDeviceLocked:](v5, "setIsDeviceLocked:", objc_msgSend(v22, "BOOLValue"));
    v23 = v5;

  }
  return v5;
}

- (unint64_t)whichInvocationcontext
{
  return self->_whichInvocationcontext;
}

- (int)invocationAction
{
  return self->_invocationAction;
}

- (int)invocationSource
{
  return self->_invocationSource;
}

- (SISchemaViewContainer)viewContainer
{
  return self->_viewContainer;
}

- (void)setViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_viewContainer, a3);
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (void)setHasViewContainer:(BOOL)a3
{
  *(&self->_isDeviceLocked + 2) = a3;
}

- (BOOL)hasCarPlayInvocationContext
{
  return *(&self->_isDeviceLocked + 3);
}

- (void)setHasCarPlayInvocationContext:(BOOL)a3
{
  *(&self->_isDeviceLocked + 3) = a3;
}

- (BOOL)hasCardInvocationContext
{
  return (BOOL)self->_has;
}

- (void)setHasCardInvocationContext:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (BOOL)hasTvRemoteInvocationContext
{
  return *((_BYTE *)&self->_has + 1);
}

- (void)setHasTvRemoteInvocationContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (BOOL)hasKeyboardInvocationContext
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasKeyboardInvocationContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (BOOL)hasHardwareButtonInvocationContext
{
  return *((_BYTE *)&self->_has + 3);
}

- (void)setHasHardwareButtonInvocationContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (BOOL)hasBluetoothCarInvocationContext
{
  return self->_hasViewContainer;
}

- (void)setHasBluetoothCarInvocationContext:(BOOL)a3
{
  self->_hasViewContainer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothCarInvocationContext, 0);
  objc_storeStrong((id *)&self->_hardwareButtonInvocationContext, 0);
  objc_storeStrong((id *)&self->_keyboardInvocationContext, 0);
  objc_storeStrong((id *)&self->_tvRemoteInvocationContext, 0);
  objc_storeStrong((id *)&self->_cardInvocationContext, 0);
  objc_storeStrong((id *)&self->_carPlayInvocationContext, 0);
  objc_storeStrong((id *)&self->_viewContainer, 0);
}

@end
