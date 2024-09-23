@implementation VUIFamilyMember

- (void)setMemberIdentifier:(id)a3
{
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_memberIdentifier, a3);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __39__VUIFamilyMember_setMemberIdentifier___block_invoke;
  v10 = &unk_1E9F99C98;
  objc_copyWeak(&v11, &location);
  v6 = &v7;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v7, v8))
    v9((uint64_t)v6);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __39__VUIFamilyMember_setMemberIdentifier___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_alloc(MEMORY[0x1E0D20EC0]);
  objc_msgSend(WeakRetained, "memberIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFamilyMemberDSID:size:localFallback:", v4, 1, 0);

  objc_msgSend(v5, "setUseMonogramAsLastResort:", 0);
  +[VUIFamilyMemberCell maxMonogramHeight](VUIFamilyMemberCell, "maxMonogramHeight");
  objc_msgSend(v5, "setMonogramDiameter:");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__VUIFamilyMember_setMemberIdentifier___block_invoke_2;
  v6[3] = &unk_1E9FA03D0;
  objc_copyWeak(&v7, v1);
  objc_msgSend(v5, "startRequestWithCompletionHandler:", v6);
  objc_destroyWeak(&v7);

}

void __39__VUIFamilyMember_setMemberIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setMemberImage:", v4);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "familyMember:photoRequestDidCompleteWithImage:", WeakRetained, v4);

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[VUIFamilyMember memberIdentifier](self, "memberIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[VUIFamilyMember firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[VUIFamilyMember lastName](self, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[VUIFamilyMember accountName](self, "accountName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSNumber)memberIdentifier
{
  return self->_memberIdentifier;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
  objc_storeStrong((id *)&self->_accountName, a3);
}

- (BOOL)sharingPurchases
{
  return self->_sharingPurchases;
}

- (void)setSharingPurchases:(BOOL)a3
{
  self->_sharingPurchases = a3;
}

- (UIImage)memberImage
{
  return self->_memberImage;
}

- (void)setMemberImage:(id)a3
{
  objc_storeStrong((id *)&self->_memberImage, a3);
}

- (VUIFamilyMemberDelegate)delegate
{
  return (VUIFamilyMemberDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_memberImage, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_memberIdentifier, 0);
}

@end
