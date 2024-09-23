@implementation SFAirDropAction

- (SFAirDropAction)initWithTransferIdentifier:(id)a3 actionIdentifier:(id)a4 title:(id)a5 singleItemTitle:(id)a6 type:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SFAirDropAction *v16;
  SFAirDropAction *v17;
  uint64_t v18;
  NSString *transferIdentifier;
  uint64_t v20;
  NSString *actionIdentifier;
  uint64_t v22;
  NSString *localizedTitle;
  uint64_t v24;
  NSString *singleItemLocalizedTitle;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v27.receiver = self;
  v27.super_class = (Class)SFAirDropAction;
  v16 = -[SFAirDropAction init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_type = a7;
    v18 = objc_msgSend(v12, "copy");
    transferIdentifier = v17->_transferIdentifier;
    v17->_transferIdentifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    actionIdentifier = v17->_actionIdentifier;
    v17->_actionIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    localizedTitle = v17->_localizedTitle;
    v17->_localizedTitle = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    singleItemLocalizedTitle = v17->_singleItemLocalizedTitle;
    v17->_singleItemLocalizedTitle = (NSString *)v24;

    *(_OWORD *)&v17->_minRequiredTransferState = xmmword_1A2AF7700;
    *(_WORD *)&v17->_requiresUnlockedUI = 257;
  }

  return v17;
}

- (SFAirDropAction)initWithTransferIdentifier:(id)a3 actionIdentifier:(id)a4 title:(id)a5 singleItemTitle:(id)a6 type:(int64_t)a7 handler:(id)a8
{
  id v14;
  SFAirDropAction *v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v14 = a8;
  v15 = -[SFAirDropAction initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:](self, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", a3, a4, a5, a6, a7);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__SFAirDropAction_initWithTransferIdentifier_actionIdentifier_title_singleItemTitle_type_handler___block_invoke;
  v18[3] = &unk_1E482FFB0;
  v19 = v14;
  v16 = v14;
  -[SFAirDropAction setActionHandler:](v15, "setActionHandler:", v18);

  return v15;
}

uint64_t __98__SFAirDropAction_initWithTransferIdentifier_actionIdentifier_title_singleItemTitle_type_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAirDropAction)initWithCoder:(id)a3
{
  id v4;
  SFAirDropAction *v5;
  void *v6;
  uint64_t v7;
  NSString *transferIdentifier;
  void *v9;
  uint64_t v10;
  NSString *actionIdentifier;
  void *v12;
  uint64_t v13;
  NSString *localizedTitle;
  void *v15;
  uint64_t v16;
  NSString *singleItemLocalizedTitle;

  v4 = a3;
  v5 = -[SFAirDropAction initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:](self, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", &stru_1E483B8E8, &stru_1E483B8E8, &stru_1E483B8E8, &stru_1E483B8E8, 1);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    transferIdentifier = v5->_transferIdentifier;
    v5->_transferIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("singleItemLocalizedTitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    singleItemLocalizedTitle = v5->_singleItemLocalizedTitle;
    v5->_singleItemLocalizedTitle = (NSString *)v16;

    v5->_minRequiredTransferState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minRequiredTransferState"));
    v5->_maxTransferState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxTransferState"));
    v5->_requiresUnlockedUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresUnlockedUI"));
    v5->_shouldUpdateUserResponse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldUpdateUserResponse"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *transferIdentifier;
  id v5;

  transferIdentifier = self->_transferIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transferIdentifier, CFSTR("transferIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionIdentifier, CFSTR("actionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_singleItemLocalizedTitle, CFSTR("singleItemLocalizedTitle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minRequiredTransferState, CFSTR("minRequiredTransferState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxTransferState, CFSTR("maxTransferState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresUnlockedUI, CFSTR("requiresUnlockedUI"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldUpdateUserResponse, CFSTR("shouldUpdateUserResponse"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (id)description
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v13;
  id v14;

  objc_opt_class();
  NSAppendPrintF();
  v14 = 0;
  NSAppendPrintF();
  v3 = v14;

  NSAppendPrintF();
  v4 = v3;

  NSAppendPrintF();
  v5 = v4;

  NSAppendPrintF();
  v6 = v5;

  SFAirDropTransferStateToString(self->_minRequiredTransferState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SFAirDropTransferStateToString(self->_maxTransferState);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v8 = v6;

  NSAppendPrintF();
  v9 = v8;

  NSAppendPrintF();
  v10 = v9;

  NSAppendPrintF();
  v11 = v10;

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SFAirDropAction transferIdentifier](self, "transferIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFAirDropAction actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SFAirDropAction transferIdentifier](self, "transferIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transferIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[SFAirDropAction actionIdentifier](self, "actionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "actionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)triggerAction
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;
  void *v7;
  id location;

  -[SFAirDropAction transferIdentifier](self, "transferIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFAirDropAction.m"), 117, CFSTR("Cannot trigger action on action not associated with a Transfer"));

  }
  location = 0;
  objc_initWeak(&location, self);
  -[SFAirDropAction actionHandler](self, "actionHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&location);
  ((void (**)(_QWORD, id))v5)[2](v5, v6);

  objc_destroyWeak(&location);
}

+ (id)testActionWithTitle:(id)a3 actionHandler:(id)a4
{
  id v5;
  id v6;
  SFAirDropAction *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SFAirDropAction *v12;

  v5 = a4;
  v6 = a3;
  v7 = [SFAirDropAction alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SFAirDropAction initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:](v7, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v9, v11, v6, v6, 1);

  -[SFAirDropAction setActionHandler:](v12, "setActionHandler:", v5);
  return v12;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)singleItemLocalizedTitle
{
  return self->_singleItemLocalizedTitle;
}

- (void)setSingleItemLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)transferIdentifier
{
  return self->_transferIdentifier;
}

- (unint64_t)minRequiredTransferState
{
  return self->_minRequiredTransferState;
}

- (void)setMinRequiredTransferState:(unint64_t)a3
{
  self->_minRequiredTransferState = a3;
}

- (unint64_t)maxTransferState
{
  return self->_maxTransferState;
}

- (void)setMaxTransferState:(unint64_t)a3
{
  self->_maxTransferState = a3;
}

- (BOOL)requiresUnlockedUI
{
  return self->_requiresUnlockedUI;
}

- (void)setRequiresUnlockedUI:(BOOL)a3
{
  self->_requiresUnlockedUI = a3;
}

- (BOOL)shouldUpdateUserResponse
{
  return self->_shouldUpdateUserResponse;
}

- (void)setShouldUpdateUserResponse:(BOOL)a3
{
  self->_shouldUpdateUserResponse = a3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_transferIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_singleItemLocalizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
