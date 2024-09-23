@implementation SSResponseAction

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v5 + 8), self->_account);
  v6 = -[NSString copyWithZone:](self->_actionType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_creditsString, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  objc_storeStrong((id *)(v5 + 40), self->_dialog);
  v12 = -[NSString copyWithZone:](self->_footerSection, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  *(_QWORD *)(v5 + 64) = self->_urlBagType;
  return (id)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)SSResponseAction;
  -[SSResponseAction description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, self->_actionType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_actionWithActionType:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

+ (id)_checkInAppQueueActionWithClientID:(id)a3 environment:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)v7[2];
  v7[2] = CFSTR("SSResponseActionTypeCheckInAppPurchaseQueue");

  v9 = objc_msgSend(v6, "copy");
  v10 = (void *)v7[3];
  v7[3] = v9;

  LODWORD(v6) = objc_msgSend(v5, "isEqualToString:", CFSTR("sandbox"));
  v7[8] = v6;
  return v7;
}

+ (id)_dialogActionWithDialog:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[2];
  v4[2] = CFSTR("SSResponseActionTypeShowDialog");

  v6 = (void *)v4[5];
  v4[5] = v3;

  return v4;
}

+ (id)_dialogActionWithTouchIDDialog:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[2];
  v4[2] = CFSTR("SSResponseActionTypeShowTouchIDDialog");

  v6 = (void *)v4[5];
  v4[5] = v3;

  return v4;
}

+ (id)_invalidateURLBagsAction
{
  _QWORD *v2;
  void *v3;

  v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = (void *)v2[2];
  v2[2] = CFSTR("SSResponseActionTypeInvalidateURLBags");

  return v2;
}

+ (id)_selectFooterActionWithSection:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[2];
  v4[2] = CFSTR("SSResponseActionTypeSelectFooterSection");

  v6 = objc_msgSend(v3, "copy");
  v7 = (void *)v4[6];
  v4[6] = v6;

  return v4;
}

+ (id)_setActiveAccountActionWithAccount:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[2];
  v4[2] = CFSTR("SSResponseActionTypeSetActiveAccount");

  v6 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

+ (id)_setCreditsActionWithCredits:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)v7[2];
  v7[2] = CFSTR("SSResponseActionTypeSetAccountCredits");

  v9 = (void *)v7[1];
  v7[1] = v5;
  v10 = v5;

  v11 = objc_msgSend(v6, "copy");
  v12 = (void *)v7[4];
  v7[4] = v11;

  return v7;
}

+ (id)_urlActionWithType:(id)a3 URL:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = objc_msgSend(v6, "copy");

  v9 = (void *)v7[2];
  v7[2] = v8;

  v10 = objc_msgSend(v5, "copy");
  v11 = (void *)v7[7];
  v7[7] = v10;

  return v7;
}

- (SSAccount)account
{
  return self->_account;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)creditsString
{
  return self->_creditsString;
}

- (SSDialog)dialog
{
  return self->_dialog;
}

- (NSString)footerSection
{
  return self->_footerSection;
}

- (NSURL)URL
{
  return self->_url;
}

- (int64_t)URLBagType
{
  return self->_urlBagType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_footerSection, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_creditsString, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
