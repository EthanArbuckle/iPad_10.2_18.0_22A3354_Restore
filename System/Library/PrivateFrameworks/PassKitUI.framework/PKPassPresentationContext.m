@implementation PKPassPresentationContext

+ (PKPassPresentationContext)contextWithAdditionalPassUniqueIdentifiers:(id)a3
{
  return (PKPassPresentationContext *)objc_msgSend(a1, "contextWithWasAutomaticallySelected:additionalPassUniqueIdentifiers:", 0, a3);
}

+ (PKPassPresentationContext)contextWithWasAutomaticallySelected:(BOOL)a3 additionalPassUniqueIdentifiers:(id)a4
{
  return (PKPassPresentationContext *)objc_msgSend(a1, "contextWithWasAutomaticallySelected:additionalPassUniqueIdentifiers:userInfo:", a3, a4, 0);
}

+ (PKPassPresentationContext)contextWithWasAutomaticallySelected:(BOOL)a3 additionalPassUniqueIdentifiers:(id)a4 userInfo:(id)a5
{
  return (PKPassPresentationContext *)objc_msgSend(a1, "contextWithWasAutomaticallySelected:additionalPassUniqueIdentifiers:userInfo:terminalType:", a3, a4, a5, 0);
}

+ (PKPassPresentationContext)contextWithWasAutomaticallySelected:(BOOL)a3 additionalPassUniqueIdentifiers:(id)a4 userInfo:(id)a5 terminalType:(int64_t)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  PKPassPresentationContext *v11;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = objc_alloc_init(PKPassPresentationContext);
  -[PKPassPresentationContext setAdditionalPassUniqueIdentifiers:](v11, "setAdditionalPassUniqueIdentifiers:", v10);

  -[PKPassPresentationContext setWasAutomaticallySelected:](v11, "setWasAutomaticallySelected:", v8);
  -[PKPassPresentationContext setUserInfo:](v11, "setUserInfo:", v9);

  -[PKPassPresentationContext setTerminalType:](v11, "setTerminalType:", a6);
  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_wasAutomaticallySelected)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; wasAutomaticallySelected: %@; additionalPassUniqueIdentifiers: %@; userInfo: %@; >"),
               v4,
               self,
               v5,
               self->_additionalPassUniqueIdentifiers,
               self->_userInfo);
}

- (BOOL)isFieldDetect
{
  return self->_fieldDetect;
}

- (void)setFieldDetect:(BOOL)a3
{
  self->_fieldDetect = a3;
}

- (int64_t)terminalType
{
  return self->_terminalType;
}

- (void)setTerminalType:(int64_t)a3
{
  self->_terminalType = a3;
}

- (BOOL)isPostPayment
{
  return self->_postPayment;
}

- (void)setPostPayment:(BOOL)a3
{
  self->_postPayment = a3;
}

- (int64_t)standaloneTransactionType
{
  return self->_standaloneTransactionType;
}

- (void)setStandaloneTransactionType:(int64_t)a3
{
  self->_standaloneTransactionType = a3;
}

- (BOOL)wantsForcedPayment
{
  return self->_forcePayment;
}

- (void)setForcePayment:(BOOL)a3
{
  self->_forcePayment = a3;
}

- (BOOL)wantsPersistentCardEmulation
{
  return self->_persistentCardEmulation;
}

- (void)setPersistentCardEmulation:(BOOL)a3
{
  self->_persistentCardEmulation = a3;
}

- (NSArray)additionalPassUniqueIdentifiers
{
  return self->_additionalPassUniqueIdentifiers;
}

- (void)setAdditionalPassUniqueIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)wasAutomaticallySelected
{
  return self->_wasAutomaticallySelected;
}

- (void)setWasAutomaticallySelected:(BOOL)a3
{
  self->_wasAutomaticallySelected = a3;
}

- (BOOL)wasForcedFromButton
{
  return self->_forcedFromButton;
}

- (void)setForcedFromButton:(BOOL)a3
{
  self->_forcedFromButton = a3;
}

- (NSCopying)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)limitServerLoad
{
  return self->_limitServerLoad;
}

- (void)setLimitServerLoad:(BOOL)a3
{
  self->_limitServerLoad = a3;
}

- (BOOL)presentFanned
{
  return self->_presentFanned;
}

- (void)setPresentFanned:(BOOL)a3
{
  self->_presentFanned = a3;
}

- (NSData)externalizedAuthenticationContext
{
  return self->_externalizedAuthenticationContext;
}

- (void)setExternalizedAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_externalizedAuthenticationContext, a3);
}

- (PKBackgroundContactlessInterfaceSessionController)backgroundSession
{
  return (PKBackgroundContactlessInterfaceSessionController *)objc_loadWeakRetained((id *)&self->_backgroundSession);
}

- (void)setBackgroundSession:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundSession, a3);
}

- (unint64_t)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(unint64_t)a3
{
  self->_presentationSource = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundSession);
  objc_storeStrong((id *)&self->_externalizedAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_additionalPassUniqueIdentifiers, 0);
}

@end
