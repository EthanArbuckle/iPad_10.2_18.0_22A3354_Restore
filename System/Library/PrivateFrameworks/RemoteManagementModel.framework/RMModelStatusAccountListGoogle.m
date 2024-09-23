@implementation RMModelStatusAccountListGoogle

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[10];

  v6[9] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("_removed");
  v6[2] = CFSTR("declaration-identifier");
  v6[3] = CFSTR("visible-name");
  v6[4] = CFSTR("username");
  v6[5] = CFSTR("is-mail-enabled");
  v6[6] = CFSTR("are-calendars-enabled");
  v6[7] = CFSTR("are-contacts-enabled");
  v6[8] = CFSTR("are-notes-enabled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return CFSTR("account.list.google");
}

- (BOOL)isArrayValue
{
  return 1;
}

+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 declarationIdentifier:(id)a5 visibleName:(id)a6 username:(id)a7 isMailEnabled:(id)a8 areCalendarsEnabled:(id)a9 areContactsEnabled:(id)a10 areNotesEnabled:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v28;

  v28 = a11;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setStatusIdentifier:", v24);

  if (v23)
    v26 = v23;
  else
    v26 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v25, "setStatusRemoved:", v26);

  objc_msgSend(v25, "setStatusDeclarationIdentifier:", v22);
  objc_msgSend(v25, "setStatusVisibleName:", v21);

  objc_msgSend(v25, "setStatusUsername:", v20);
  objc_msgSend(v25, "setStatusIsMailEnabled:", v19);

  objc_msgSend(v25, "setStatusAreCalendarsEnabled:", v18);
  objc_msgSend(v25, "setStatusAreContactsEnabled:", v17);

  objc_msgSend(v25, "setStatusAreNotesEnabled:", v28);
  return v25;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setStatusIdentifier:", v3);

  return v4;
}

+ (id)supportedOS
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[4];
  _QWORD v21[6];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v20[0] = &unk_25162A408;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626A30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626A48);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v20[1] = &unk_25162A450;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626A60);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626A78);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  v20[2] = &unk_25162A420;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626A90);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626AA8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  v20[3] = &unk_25162A468;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626AC0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626AD8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelStatusAccountListGoogle allowedStatusKeys](RMModelStatusAccountListGoogle, "allowedStatusKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("identifier"), CFSTR("statusIdentifier"), 1, 0, a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("_removed"), CFSTR("statusRemoved"), 0, MEMORY[0x24BDBD1C0], a5))
    {
      v13 = 0;
      if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("declaration-identifier"), CFSTR("statusDeclarationIdentifier"), 0, 0, a5))
      {
        v13 = 0;
        if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("visible-name"), CFSTR("statusVisibleName"), 0, 0, a5))
        {
          v13 = 0;
          if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("username"), CFSTR("statusUsername"), 0, 0, a5))
          {
            v13 = 0;
            if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("is-mail-enabled"), CFSTR("statusIsMailEnabled"), 0, 0, a5))
            {
              v13 = 0;
              if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("are-calendars-enabled"), CFSTR("statusAreCalendarsEnabled"), 0, 0, a5))
              {
                v13 = 0;
                if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("are-contacts-enabled"), CFSTR("statusAreContactsEnabled"), 0, 0, a5))
                {
                  v13 = -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("are-notes-enabled"), CFSTR("statusAreNotesEnabled"), 0, 0, a5);
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
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

  v4 = (void *)objc_opt_new();
  -[RMModelStatusAccountListGoogle statusIdentifier](self, "statusIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("identifier"), v5, 1, 0);

  -[RMModelStatusAccountListGoogle statusRemoved](self, "statusRemoved");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("_removed"), v6, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelStatusAccountListGoogle statusDeclarationIdentifier](self, "statusDeclarationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("declaration-identifier"), v7, 0, 0);

  -[RMModelStatusAccountListGoogle statusVisibleName](self, "statusVisibleName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("visible-name"), v8, 0, 0);

  -[RMModelStatusAccountListGoogle statusUsername](self, "statusUsername");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("username"), v9, 0, 0);

  -[RMModelStatusAccountListGoogle statusIsMailEnabled](self, "statusIsMailEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("is-mail-enabled"), v10, 0, 0);

  -[RMModelStatusAccountListGoogle statusAreCalendarsEnabled](self, "statusAreCalendarsEnabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("are-calendars-enabled"), v11, 0, 0);

  -[RMModelStatusAccountListGoogle statusAreContactsEnabled](self, "statusAreContactsEnabled");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("are-contacts-enabled"), v12, 0, 0);

  -[RMModelStatusAccountListGoogle statusAreNotesEnabled](self, "statusAreNotesEnabled");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("are-notes-enabled"), v13, 0, 0);

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)RMModelStatusAccountListGoogle;
  v4 = -[RMModelPayloadBase copyWithZone:](&v24, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_statusIdentifier, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_statusRemoved, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_statusDeclarationIdentifier, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_statusVisibleName, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_statusUsername, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSNumber copy](self->_statusIsMailEnabled, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSNumber copy](self->_statusAreCalendarsEnabled, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSNumber copy](self->_statusAreContactsEnabled, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_statusAreNotesEnabled, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  return v4;
}

- (NSString)statusIdentifier
{
  return self->_statusIdentifier;
}

- (void)setStatusIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)statusRemoved
{
  return self->_statusRemoved;
}

- (void)setStatusRemoved:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)statusDeclarationIdentifier
{
  return self->_statusDeclarationIdentifier;
}

- (void)setStatusDeclarationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)statusVisibleName
{
  return self->_statusVisibleName;
}

- (void)setStatusVisibleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)statusUsername
{
  return self->_statusUsername;
}

- (void)setStatusUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)statusIsMailEnabled
{
  return self->_statusIsMailEnabled;
}

- (void)setStatusIsMailEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)statusAreCalendarsEnabled
{
  return self->_statusAreCalendarsEnabled;
}

- (void)setStatusAreCalendarsEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)statusAreContactsEnabled
{
  return self->_statusAreContactsEnabled;
}

- (void)setStatusAreContactsEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)statusAreNotesEnabled
{
  return self->_statusAreNotesEnabled;
}

- (void)setStatusAreNotesEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusAreNotesEnabled, 0);
  objc_storeStrong((id *)&self->_statusAreContactsEnabled, 0);
  objc_storeStrong((id *)&self->_statusAreCalendarsEnabled, 0);
  objc_storeStrong((id *)&self->_statusIsMailEnabled, 0);
  objc_storeStrong((id *)&self->_statusUsername, 0);
  objc_storeStrong((id *)&self->_statusVisibleName, 0);
  objc_storeStrong((id *)&self->_statusDeclarationIdentifier, 0);
  objc_storeStrong((id *)&self->_statusRemoved, 0);
  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

@end
