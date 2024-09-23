@implementation PKPartialShareInvitation

- (PKPartialShareInvitation)initWithShare:(id)a3 pass:(id)a4
{
  id v7;
  id v8;
  PKPartialShareInvitation *v9;
  PKPartialShareInvitation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPartialShareInvitation;
  v9 = -[PKPartialShareInvitation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_share, a3);
    objc_storeStrong((id *)&v10->_pass, a4);
  }

  return v10;
}

- (PKPartialShareInvitation)initWithHomeInvite:(id)a3 displayInformation:(id)a4
{
  id v7;
  id v8;
  PKPartialShareInvitation *v9;
  PKPartialShareInvitation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPartialShareInvitation;
  v9 = -[PKPartialShareInvitation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeInvite, a3);
    objc_storeStrong((id *)&v10->_displayInformation, a4);
  }

  return v10;
}

- (BOOL)isHomeShare
{
  return self->_homeInvite != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPartialShareInvitation)initWithCoder:(id)a3
{
  id v4;
  PKPartialShareInvitation *v5;
  uint64_t v6;
  PKPassShare *share;
  uint64_t v8;
  PKSecureElementPass *pass;
  uint64_t v10;
  NSData *homeInvite;
  uint64_t v12;
  PKSharingMessageDisplayInformation *displayInformation;
  uint64_t v14;
  NSString *recipientNickname;
  uint64_t v16;
  NSString *recipientHandle;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  char v21;
  __CFString *v22;
  __CFString *v23;
  char v24;
  __CFString *v25;
  __CFString *v26;
  int v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPartialShareInvitation;
  v5 = -[PKPartialShareInvitation init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("share"));
    v6 = objc_claimAutoreleasedReturnValue();
    share = v5->_share;
    v5->_share = (PKPassShare *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pass"));
    v8 = objc_claimAutoreleasedReturnValue();
    pass = v5->_pass;
    v5->_pass = (PKSecureElementPass *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeInvite"));
    v10 = objc_claimAutoreleasedReturnValue();
    homeInvite = v5->_homeInvite;
    v5->_homeInvite = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayInformation"));
    v12 = objc_claimAutoreleasedReturnValue();
    displayInformation = v5->_displayInformation;
    v5->_displayInformation = (PKSharingMessageDisplayInformation *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientNickname"));
    v14 = objc_claimAutoreleasedReturnValue();
    recipientNickname = v5->_recipientNickname;
    v5->_recipientNickname = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientHandle"));
    v16 = objc_claimAutoreleasedReturnValue();
    recipientHandle = v5->_recipientHandle;
    v5->_recipientHandle = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestSource"));
    v18 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = 0;
    if (v18 == CFSTR("UI") || !v18)
      goto LABEL_12;
    v21 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("UI"));

    if ((v21 & 1) == 0)
    {
      v22 = v19;
      if (v22 == CFSTR("remoteLocalDevice")
        || (v23 = v22,
            v24 = -[__CFString isEqualToString:](v22, "isEqualToString:", CFSTR("remoteLocalDevice")),
            v23,
            (v24 & 1) != 0))
      {
        v20 = 1;
        goto LABEL_12;
      }
      v25 = v23;
      if (v25 == CFSTR("remoteExternalDevice")
        || (v26 = v25,
            v27 = -[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("remoteExternalDevice")),
            v26,
            v27))
      {
        v20 = 2;
        goto LABEL_12;
      }
    }
    v20 = 0;
LABEL_12:

    v5->_requestSource = v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPassShare *share;
  unint64_t requestSource;
  const __CFString *v6;
  const __CFString *v7;
  id v8;

  share = self->_share;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", share, CFSTR("share"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_pass, CFSTR("pass"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_homeInvite, CFSTR("homeInvite"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_displayInformation, CFSTR("displayInformation"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_recipientNickname, CFSTR("recipientNickname"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_recipientHandle, CFSTR("recipientHandle"));
  requestSource = self->_requestSource;
  v6 = CFSTR("UI");
  if (requestSource == 1)
    v6 = CFSTR("remoteLocalDevice");
  if (requestSource == 2)
    v7 = CFSTR("remoteExternalDevice");
  else
    v7 = v6;
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("requestSource"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t requestSource;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("share: '%@'; "), self->_share);
  objc_msgSend(v6, "appendFormat:", CFSTR("pass: '%@'; "), self->_pass);
  objc_msgSend(v6, "appendFormat:", CFSTR("homeInvite: '%@'; "), self->_homeInvite);
  objc_msgSend(v6, "appendFormat:", CFSTR("displayInformation: '%@'; "), self->_displayInformation);
  objc_msgSend(v6, "appendFormat:", CFSTR("recipientNickname: '%@'; "), self->_recipientNickname);
  objc_msgSend(v6, "appendFormat:", CFSTR("recipientHandle: '%@'; "), self->_recipientHandle);
  requestSource = self->_requestSource;
  v8 = CFSTR("UI");
  if (requestSource == 1)
    v8 = CFSTR("remoteLocalDevice");
  if (requestSource == 2)
    v9 = CFSTR("remoteExternalDevice");
  else
    v9 = v8;
  objc_msgSend(v6, "appendFormat:", CFSTR("requestSource: '%@'; "), v9);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  if (self->_share)
    objc_msgSend(v3, "addObject:");
  if (self->_pass)
    objc_msgSend(v4, "addObject:");
  if (self->_homeInvite)
    objc_msgSend(v4, "addObject:");
  if (self->_displayInformation)
    objc_msgSend(v4, "addObject:");
  if (self->_recipientNickname)
    objc_msgSend(v4, "addObject:");
  if (self->_recipientHandle)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->_requestSource - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKPartialShareInvitation *v4;
  PKPartialShareInvitation *v5;
  BOOL v6;

  v4 = (PKPartialShareInvitation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPartialShareInvitation isEqualToPartialShareInvitation:](self, "isEqualToPartialShareInvitation:", v5);

  return v6;
}

- (BOOL)isEqualToPartialShareInvitation:(id)a3
{
  _QWORD *v4;
  PKPassShare *share;
  PKPassShare *v6;
  BOOL v7;
  PKSecureElementPass *pass;
  PKSecureElementPass *v9;
  NSData *homeInvite;
  NSData *v11;
  PKSharingMessageDisplayInformation *displayInformation;
  PKSharingMessageDisplayInformation *v13;
  NSString *recipientNickname;
  NSString *v15;
  NSString *recipientHandle;
  NSString *v17;
  BOOL v18;

  v4 = a3;
  if (!v4)
    goto LABEL_35;
  share = self->_share;
  v6 = (PKPassShare *)v4[1];
  if (share)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (share != v6)
      goto LABEL_35;
  }
  else if (!-[PKPassShare isEqual:](share, "isEqual:"))
  {
    goto LABEL_35;
  }
  pass = self->_pass;
  v9 = (PKSecureElementPass *)v4[2];
  if (pass && v9)
  {
    if ((-[PKSecureElementPass isEqual:](pass, "isEqual:") & 1) == 0)
      goto LABEL_35;
  }
  else if (pass != v9)
  {
    goto LABEL_35;
  }
  homeInvite = self->_homeInvite;
  v11 = (NSData *)v4[4];
  if (homeInvite && v11)
  {
    if ((-[NSData isEqual:](homeInvite, "isEqual:") & 1) == 0)
      goto LABEL_35;
  }
  else if (homeInvite != v11)
  {
    goto LABEL_35;
  }
  displayInformation = self->_displayInformation;
  v13 = (PKSharingMessageDisplayInformation *)v4[5];
  if (displayInformation && v13)
  {
    if ((-[PKSharingMessageDisplayInformation isEqual:](displayInformation, "isEqual:") & 1) == 0)
      goto LABEL_35;
  }
  else if (displayInformation != v13)
  {
    goto LABEL_35;
  }
  recipientNickname = self->_recipientNickname;
  v15 = (NSString *)v4[6];
  if (recipientNickname && v15)
  {
    if ((-[NSString isEqual:](recipientNickname, "isEqual:") & 1) == 0)
      goto LABEL_35;
  }
  else if (recipientNickname != v15)
  {
    goto LABEL_35;
  }
  recipientHandle = self->_recipientHandle;
  v17 = (NSString *)v4[7];
  if (!recipientHandle || !v17)
  {
    if (recipientHandle == v17)
      goto LABEL_33;
LABEL_35:
    v18 = 0;
    goto LABEL_36;
  }
  if ((-[NSString isEqual:](recipientHandle, "isEqual:") & 1) == 0)
    goto LABEL_35;
LABEL_33:
  v18 = self->_requestSource == v4[3];
LABEL_36:

  return v18;
}

- (void)setRecipientHandle:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_recipientHandle, a3);
  if (self->_recipientHandle)
    -[PKPassShare setRecipientHandle:](self->_share, "setRecipientHandle:");

}

- (void)setRecipientNickname:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_recipientNickname, a3);
  if (self->_recipientNickname)
    -[PKPassShare setRecipientNickname:](self->_share, "setRecipientNickname:", v5);

}

- (PKPassShare)share
{
  return self->_share;
}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (unint64_t)requestSource
{
  return self->_requestSource;
}

- (void)setRequestSource:(unint64_t)a3
{
  self->_requestSource = a3;
}

- (NSData)homeInvite
{
  return self->_homeInvite;
}

- (PKSharingMessageDisplayInformation)displayInformation
{
  return self->_displayInformation;
}

- (NSString)recipientNickname
{
  return self->_recipientNickname;
}

- (NSString)recipientHandle
{
  return self->_recipientHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientHandle, 0);
  objc_storeStrong((id *)&self->_recipientNickname, 0);
  objc_storeStrong((id *)&self->_displayInformation, 0);
  objc_storeStrong((id *)&self->_homeInvite, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

@end
