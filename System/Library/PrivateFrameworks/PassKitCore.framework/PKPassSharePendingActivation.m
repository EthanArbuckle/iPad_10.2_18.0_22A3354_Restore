@implementation PKPassSharePendingActivation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassSharePendingActivation)initWithCoder:(id)a3
{
  id v4;
  PKPassSharePendingActivation *v5;
  uint64_t v6;
  PKSharingMessage *originalInvitation;
  uint64_t v8;
  NSString *shareIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassSharePendingActivation;
  v5 = -[PKPassSharePendingActivation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalInvitation"));
    v6 = objc_claimAutoreleasedReturnValue();
    originalInvitation = v5->_originalInvitation;
    v5->_originalInvitation = (PKSharingMessage *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    shareIdentifier = v5->_shareIdentifier;
    v5->_shareIdentifier = (NSString *)v8;

    v5->_isWaitingOnUserAction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isWaitingOnUserAction"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKSharingMessage *originalInvitation;
  id v5;

  originalInvitation = self->_originalInvitation;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originalInvitation, CFSTR("originalInvitation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shareIdentifier, CFSTR("shareIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isWaitingOnUserAction, CFSTR("isWaitingOnUserAction"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("originalInvitation: '%@'; "), self->_originalInvitation);
  objc_msgSend(v6, "appendFormat:", CFSTR("shareIdentifier: '%@'; "), self->_shareIdentifier);
  if (self->_isWaitingOnUserAction)
    v7 = CFSTR("Yes");
  else
    v7 = CFSTR("No");
  objc_msgSend(v6, "appendFormat:", CFSTR("isWaitingOnUserAction: '%@'; "), v7);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_originalInvitation)
    objc_msgSend(v3, "addObject:");
  if (self->_shareIdentifier)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->_isWaitingOnUserAction - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKPassSharePendingActivation *v4;
  PKPassSharePendingActivation *v5;
  BOOL v6;

  v4 = (PKPassSharePendingActivation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassSharePendingActivation isEqualToPassSharePendingActivation:](self, "isEqualToPassSharePendingActivation:", v5);

  return v6;
}

- (BOOL)isEqualToPassSharePendingActivation:(id)a3
{
  _QWORD *v4;
  PKSharingMessage *originalInvitation;
  PKSharingMessage *v6;
  BOOL v7;
  NSString *shareIdentifier;
  NSString *v9;
  BOOL v10;

  v4 = a3;
  if (!v4)
    goto LABEL_15;
  originalInvitation = self->_originalInvitation;
  v6 = (PKSharingMessage *)v4[2];
  if (originalInvitation)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (originalInvitation != v6)
      goto LABEL_15;
  }
  else if ((-[PKSharingMessage isEqual:](originalInvitation, "isEqual:") & 1) == 0)
  {
    goto LABEL_15;
  }
  shareIdentifier = self->_shareIdentifier;
  v9 = (NSString *)v4[3];
  if (!shareIdentifier || !v9)
  {
    if (shareIdentifier == v9)
      goto LABEL_13;
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  if ((-[NSString isEqual:](shareIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_15;
LABEL_13:
  v10 = self->_isWaitingOnUserAction == *((unsigned __int8 *)v4 + 8);
LABEL_16:

  return v10;
}

- (PKSharingMessage)originalInvitation
{
  return self->_originalInvitation;
}

- (void)setOriginalInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_originalInvitation, a3);
}

- (NSString)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void)setShareIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_shareIdentifier, a3);
}

- (BOOL)isWaitingOnUserAction
{
  return self->_isWaitingOnUserAction;
}

- (void)setIsWaitingOnUserAction:(BOOL)a3
{
  self->_isWaitingOnUserAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareIdentifier, 0);
  objc_storeStrong((id *)&self->_originalInvitation, 0);
}

@end
