@implementation PCSShareProtectionObject

- (PCSShareProtectionObject)initWithShareProtectionRef:(_OpaquePCSShareProtection *)a3
{
  PCSShareProtectionObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PCSShareProtectionObject;
  v4 = -[PCSShareProtectionObject init](&v6, sel_init);
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    v4->_shareProtection = a3;
  }
  return v4;
}

- (PCSShareProtectionObject)initWithSharingRequestData:(id)a3 identitySet:(_PCSIdentitySetData *)a4 error:(id *)a5
{
  id v8;
  PCSShareProtectionObject *v9;
  PCSShareProtectionObject *v10;
  PCSManateeShareInvitation *v11;
  PCSManateeShareInvitation *v12;
  const __CFDictionary *v13;
  PCSShareProtectionObject *v14;
  void *v15;
  _QWORD context[4];
  PCSShareProtectionObject *v18;
  PCSManateeShareInvitation *v19;
  uint64_t *v20;
  uint64_t v21;
  const void **v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;

  v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PCSShareProtectionObject;
  v9 = -[PCSShareProtectionObject init](&v25, sel_init);
  if (v9)
  {
    v10 = v9;
    v21 = 0;
    v22 = (const void **)&v21;
    v23 = 0x2020000000;
    v24 = 0;
    v11 = -[PCSManateeShareInvitation initWithData:]([PCSManateeShareInvitation alloc], "initWithData:", v8);
    v12 = v11;
    if (v11 && -[PCSManateeShareInvitation hasExportedPCSData](v11, "hasExportedPCSData"))
    {
      v13 = (const __CFDictionary *)PCSIdentitySetCopyIdentities((uint64_t)a4, 0);
      context[0] = MEMORY[0x1E0C809B0];
      context[1] = 3221225472;
      context[2] = __73__PCSShareProtectionObject_initWithSharingRequestData_identitySet_error___block_invoke;
      context[3] = &unk_1E553E1A8;
      v14 = v10;
      v18 = v14;
      v20 = &v21;
      v19 = v12;
      CFDictionaryApplyFunction(v13, (CFDictionaryApplierFunction)apply_block_2_1, context);
      if (v13)
        CFRelease(v13);
      if (!v14->_shareProtection)
      {

        v14 = 0;
      }

      v10 = v18;
    }
    else
    {
      _PCSError(v22 + 3, 139, CFSTR("Failed to deserialize PCSManateeShareInvitation"));
      v14 = 0;
    }

    v15 = (void *)v22[3];
    if (a5)
    {
      *a5 = v15;
      v22[3] = 0;
    }
    else if (v15)
    {
      v22[3] = 0;
      CFRelease(v15);
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __73__PCSShareProtectionObject_initWithSharingRequestData_identitySet_error___block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  const void **v9;
  CFTypeRef Mutable;
  const void *v11;
  _DWORD *v12;
  uint64_t v13;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    return;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(const void **)(v5 + 24);
  if (v6)
  {
    *(_QWORD *)(v5 + 24) = 0;
    CFRelease(v6);
  }
  objc_msgSend(*(id *)(a1 + 40), "exportedPCSData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = (const void **)(v8 + 24);
  if (!a3)
  {
    _PCSError((const void **)(v8 + 24), 27, CFSTR("PCSFPCreateWithExportedManateeSharingInvitation need an identity"));
    goto LABEL_15;
  }
  Mutable = PCSIdentitySetCreateMutable((const void **)(v8 + 24));
  if (!Mutable)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_9;
  }
  v11 = Mutable;
  if (PCSIdentitySetAddIdentity((uint64_t)Mutable, (uint64_t)a3))
    v12 = CreateWithExportedInternal(v7, (uint64_t)v11, 0, 0, 1, 0, 0, v9);
  else
    v12 = 0;
  CFRelease(v11);
LABEL_9:
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = v12;

  v13 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v13 + 8))
  {
    if (a3)
    {
      CFRetain(a3);
      v13 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v13 + 16) = a3;
  }
}

- (void)dealloc
{
  _OpaquePCSShareProtection *shareProtection;
  _PCSIdentityData *identity;
  objc_super v5;

  shareProtection = self->_shareProtection;
  if (shareProtection)
  {
    self->_shareProtection = 0;
    CFRelease(shareProtection);
  }
  identity = self->_identity;
  if (identity)
  {
    self->_identity = 0;
    CFRelease(identity);
  }
  v5.receiver = self;
  v5.super_class = (Class)PCSShareProtectionObject;
  -[PCSShareProtectionObject dealloc](&v5, sel_dealloc);
}

- (id)sharingRequestDataForIdentity:(_PCSPublicIdentityData *)a3 error:(id *)a4
{
  return -[PCSShareProtectionObject sharingRequestDataForIdentity:flags:error:](self, "sharingRequestDataForIdentity:flags:error:", a3, 0, a4);
}

- (id)sharingRequestDataForIdentity:(_PCSPublicIdentityData *)a3 flags:(unsigned int)a4 error:(id *)a5
{
  return -[PCSShareProtectionObject sharingRequestDataForIdentity:owner:flags:error:](self, "sharingRequestDataForIdentity:owner:flags:error:", a3, 0, *(_QWORD *)&a4, a5);
}

- (id)sharingRequestDataForIdentity:(_PCSPublicIdentityData *)a3 owner:(void *)a4 flags:(unsigned int)a5 error:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OpaquePCSShareProtection *shareProtection;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFData *v21;
  id v22;
  PCSManateeShareInvitation *v23;
  CFDataRef v24;
  void *v25;
  id v27;

  v27 = 0;
  PCSFPAddPublicIdentityWithShareFlags((uint64_t)self->_shareProtection, a3, *(uint64_t *)&a5, (uint64_t)a4, *(uint64_t *)&a5, (uint64_t)a6, v6, v7);
  shareProtection = self->_shareProtection;
  if (a4)
  {
    PCSFPSetOwnerIdentity((uint64_t)shareProtection, a4);
  }
  else if (!shareProtection->var19)
  {
    v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v16)
      -[PCSShareProtectionObject sharingRequestDataForIdentity:owner:flags:error:].cold.1(v16, v17, v18, v19, v20, v12, v13, v14);
  }
  v21 = _PCSFPCopyExportedWithOptions((uint64_t)self->_shareProtection, 0, 1, (uint64_t)a3, (const void **)&v27, v12, v13, v14);
  v22 = v27;
  if (a6)
  {
    *a6 = v27;
    v27 = 0;
  }
  else if (v27)
  {
    v27 = 0;
    CFRelease(v22);
  }
  if (v21)
  {
    v23 = objc_alloc_init(PCSManateeShareInvitation);
    -[PCSManateeShareInvitation setExportedPCSData:](v23, "setExportedPCSData:", v21);
    v24 = PCSPublicIdentityCopyPublicKey((uint64_t)a3);
    -[PCSManateeShareInvitation setShareePublicKeyData:](v23, "setShareePublicKeyData:", v24);

    -[PCSManateeShareInvitation data](v23, "data");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)exportAcceptedSharingRequestWithError:(id *)a3
{
  uint64_t SigningIdentity;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  __CFData *v11;
  id v12;
  void *v13;
  __CFString *v14;
  void *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  SigningIdentity = _PCSIdentityGetSigningIdentity((uint64_t)self->_identity);
  v6 = PCSIdentityCopyPublicIdentity(SigningIdentity);
  if (v6)
  {
    v10 = v6;
    v17 = 0;
    v11 = _PCSFPCopyExportedWithOptions((uint64_t)self->_shareProtection, 1, 1, (uint64_t)v6, (const void **)&v17, v7, v8, v9);
    v12 = v17;
    if (a3)
    {
      *a3 = v17;
      v17 = 0;
    }
    else if (v17)
    {
      v17 = 0;
      CFRelease(v12);
    }
    CFRelease(v10);
    return v11;
  }
  else
  {
    if (a3)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = kPCSErrorDomain;
      v18 = *MEMORY[0x1E0CB2D50];
      v19[0] = CFSTR("missing signing identity");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 144, v15);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

- (_OpaquePCSShareProtection)shareProtection
{
  return self->_shareProtection;
}

- (void)sharingRequestDataForIdentity:(uint64_t)a3 owner:(uint64_t)a4 flags:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A9508000, MEMORY[0x1E0C81028], a3, "generating a sharing request with no owner; this will not work",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_0();
}

@end
