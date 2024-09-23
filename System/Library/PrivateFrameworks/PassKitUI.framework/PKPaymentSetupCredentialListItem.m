@implementation PKPaymentSetupCredentialListItem

- (PKPaymentSetupCredentialListItem)initWithCredential:(id)a3
{
  id v5;
  PKPaymentSetupCredentialListItem *v6;
  PKPaymentSetupCredentialListItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupCredentialListItem;
  v6 = -[PKPaymentSetupListItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_credential, a3);
    v7->_isCellDisabled = 0;
  }

  return v7;
}

- (BOOL)isDeletable
{
  int v3;

  v3 = -[PKPaymentCredential isDeletable](self->_credential, "isDeletable");
  if (v3)
    LOBYTE(v3) = !self->_isBeingProvisioned;
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v8.receiver = self;
    v8.super_class = (Class)PKPaymentSetupCredentialListItem;
    v6 = -[PKPaymentSetupListItem isEqual:](&v8, sel_isEqual_, v5)
      && self->_lastCheckedCredentialHash == v5[10]
      && PKEqualObjects()
      && self->_isAvailable == *((unsigned __int8 *)v5 + 64)
      && self->_isUnavailable == *((unsigned __int8 *)v5 + 65)
      && self->_isRefund == *((unsigned __int8 *)v5 + 66)
      && self->_isBeingProvisioned == *((unsigned __int8 *)v5 + 67)
      && self->_isCellDisabled == *((unsigned __int8 *)v5 + 68);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;
  objc_super v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupCredentialListItem;
  -[PKPaymentSetupListItem hash](&v6, sel_hash);
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  v4 = PKIntegerHash();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupCredentialListItem;
  v4 = -[PKPaymentSetupListItem copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 9, self->_credential);
  objc_storeStrong(v4 + 11, self->_passSnapshot);
  *((_BYTE *)v4 + 64) = self->_isAvailable;
  *((_BYTE *)v4 + 65) = self->_isUnavailable;
  *((_BYTE *)v4 + 66) = self->_isRefund;
  *((_BYTE *)v4 + 67) = self->_isBeingProvisioned;
  *((_BYTE *)v4 + 68) = self->_isCellDisabled;
  *((_BYTE *)v4 + 69) = self->_isSnapshotFetchInProgress;
  v4[10] = (id)self->_lastCheckedCredentialHash;
  return v4;
}

- (NSString)description
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("credential: '%@'; "), self->_credential);
  if (self->_isAvailable)
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  objc_msgSend(v3, "appendFormat:", CFSTR("isAvailable: '%@'; "), v4);
  if (self->_isUnavailable)
    v5 = CFSTR("Y");
  else
    v5 = CFSTR("N");
  objc_msgSend(v3, "appendFormat:", CFSTR("isUnavailable: '%@'; "), v5);
  if (self->_isRefund)
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  objc_msgSend(v3, "appendFormat:", CFSTR("isRefund: '%@'; "), v6);
  if (self->_isBeingProvisioned)
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  objc_msgSend(v3, "appendFormat:", CFSTR("isBeingProvisioned: '%@'; "), v7);
  if (self->_isCellDisabled)
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  objc_msgSend(v3, "appendFormat:", CFSTR("isCellDisabled: '%@'; "), v8);
  if (self->_isSnapshotFetchInProgress)
    v9 = CFSTR("Y");
  else
    v9 = CFSTR("N");
  objc_msgSend(v3, "appendFormat:", CFSTR("isSnapshotFetchInProgress: '%@'; "), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (PKPaymentCredential)credential
{
  return self->_credential;
}

- (unint64_t)lastCheckedCredentialHash
{
  return self->_lastCheckedCredentialHash;
}

- (void)setLastCheckedCredentialHash:(unint64_t)a3
{
  self->_lastCheckedCredentialHash = a3;
}

- (UIImage)passSnapshot
{
  return self->_passSnapshot;
}

- (void)setPassSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_passSnapshot, a3);
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (BOOL)isUnavailable
{
  return self->_isUnavailable;
}

- (void)setIsUnavailable:(BOOL)a3
{
  self->_isUnavailable = a3;
}

- (BOOL)isRefund
{
  return self->_isRefund;
}

- (void)setIsRefund:(BOOL)a3
{
  self->_isRefund = a3;
}

- (BOOL)isBeingProvisioned
{
  return self->_isBeingProvisioned;
}

- (void)setIsBeingProvisioned:(BOOL)a3
{
  self->_isBeingProvisioned = a3;
}

- (BOOL)isCellDisabled
{
  return self->_isCellDisabled;
}

- (void)setIsCellDisabled:(BOOL)a3
{
  self->_isCellDisabled = a3;
}

- (BOOL)isSnapshotFetchInProgress
{
  return self->_isSnapshotFetchInProgress;
}

- (void)setIsSnapshotFetchInProgress:(BOOL)a3
{
  self->_isSnapshotFetchInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passSnapshot, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
