@implementation PXSharedLibraryUIParticipant

- (PXSharedLibraryUIParticipant)initWithEmailAddress:(id)a3 contact:(id)a4
{
  id v8;
  id v9;
  PXSharedLibraryUIParticipant *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXSharedLibraryUIParticipant;
  v10 = -[PXSharedLibraryUIParticipant init](&v13, sel_init);
  if (v10)
  {
    if (!objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PXSharedLibraryUIParticipant.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddress.length > 0"));

    }
    objc_storeStrong((id *)&v10->_appleIDAddress, a3);
    v10->_addressKind = 1;
    objc_storeStrong((id *)&v10->_contact, a4);
  }

  return v10;
}

- (PXSharedLibraryUIParticipant)initWithPhoneNumber:(id)a3 contact:(id)a4
{
  id v8;
  id v9;
  PXSharedLibraryUIParticipant *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXSharedLibraryUIParticipant;
  v10 = -[PXSharedLibraryUIParticipant init](&v13, sel_init);
  if (v10)
  {
    if (!objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PXSharedLibraryUIParticipant.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phoneNumber.length > 0"));

    }
    objc_storeStrong((id *)&v10->_appleIDAddress, a3);
    v10->_addressKind = 2;
    objc_storeStrong((id *)&v10->_contact, a4);
  }

  return v10;
}

- (NSString)name
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;

  -[PXSharedLibraryUIParticipant contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") || objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v7, "setGivenName:", v5);
    objc_msgSend(v7, "setFamilyName:", v6);
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PXSharedLibraryUIParticipant appleIDAddress](self, "appleIDAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryUIParticipant.m"), 69, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXSharedLibraryUIParticipant appleIDAddress](self, "appleIDAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (NSPersonNameComponents)nameComponents
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[PXSharedLibraryUIParticipant contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "givenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") || objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v5, "setGivenName:", v3);
    objc_msgSend(v5, "setFamilyName:", v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSPersonNameComponents *)v5;
}

- (NSString)appleIDAddress
{
  NSString *appleIDAddress;
  void *v6;

  appleIDAddress = self->_appleIDAddress;
  if (!appleIDAddress)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryUIParticipant.m"), 95, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return appleIDAddress;
}

- (int)fetchImageForTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 resultHandler:(id)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v12;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v20;
  void *v21;
  void *v22;

  v6 = a5;
  height = a3.height;
  width = a3.width;
  v12 = a6;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryUIParticipant.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!CGSizeEqualToSize(targetSize, CGSizeZero)"));

  }
  if (a4 < 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryUIParticipant.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayScale >= 1"));

  }
  -[PXSharedLibraryUIParticipant contact](self, "contact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PXSharedLibraryUIParticipant contact](self, "contact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[PXSharedLibraryUIParticipant _fetchImageForContact:targetSize:displayScale:isRTL:resultHandler:](PXSharedLibraryUIParticipant, "_fetchImageForContact:targetSize:displayScale:isRTL:resultHandler:", v15, v6, v12, width, height, a4);
  }
  else
  {
    -[PXSharedLibraryUIParticipant appleIDAddress](self, "appleIDAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryUIParticipant.m"), 121, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXSharedLibraryUIParticipant appleIDAddress](self, "appleIDAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[PXSharedLibraryUIParticipant _fetchImageForEmailAddress:targetSize:displayScale:isRTL:resultHandler:](PXSharedLibraryUIParticipant, "_fetchImageForEmailAddress:targetSize:displayScale:isRTL:resultHandler:", v15, v6, v12, width, height, a4);
  }
  v18 = v16;

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXSharedLibraryUIParticipant appleIDAddress](self, "appleIDAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appleIDAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXSharedLibraryUIParticipant appleIDAddress](self, "appleIDAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXSharedLibraryUIParticipant *v4;

  v4 = -[PXSharedLibraryUIParticipant init](+[PXSharedLibraryUIParticipant allocWithZone:](PXSharedLibraryUIParticipant, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_contact, self->_contact);
  objc_storeStrong((id *)&v4->_appleIDAddress, self->_appleIDAddress);
  v4->_addressKind = self->_addressKind;
  return v4;
}

- (void)px_requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 resultHandler:(id)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a5;
  height = a3.height;
  width = a3.width;
  v11 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__PXSharedLibraryUIParticipant_px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke;
  v13[3] = &unk_1E5147AB8;
  v14 = v11;
  v12 = v11;
  -[PXSharedLibraryUIParticipant fetchImageForTargetSize:displayScale:isRTL:resultHandler:](self, "fetchImageForTargetSize:displayScale:isRTL:resultHandler:", v6, v13, width, height, a4);

}

- (NSString)description
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
  unint64_t v12;
  const __CFString *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryUIParticipant;
  -[PXSharedLibraryUIParticipant description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[PXSharedLibraryUIParticipant contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("contact: %@,\n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[PXSharedLibraryUIParticipant appleIDAddress](self, "appleIDAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("address: %@,\n"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = -[PXSharedLibraryUIParticipant addressKind](self, "addressKind");
  v13 = CFSTR("PXSharedLibraryUIParticipantAddressKindInvalid");
  if (v12 == 1)
    v13 = CFSTR("PXSharedLibraryUIParticipantAddressKindEmail");
  if (v12 == 2)
    v13 = CFSTR("PXSharedLibraryUIParticipantAddressKindPhone");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("addressKind: %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v14);

  return (NSString *)v4;
}

- (unint64_t)addressKind
{
  return self->_addressKind;
}

- (void)setAppleIDAddress:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDAddress, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_appleIDAddress, 0);
}

uint64_t __95__PXSharedLibraryUIParticipant_px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

+ (int)_fetchImageForContact:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 resultHandler:(id)a7
{
  _BOOL8 v8;
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  int v17;
  void *v19;
  _QWORD v20[4];
  id v21;

  v8 = a6;
  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSharedLibraryUIParticipant.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __98__PXSharedLibraryUIParticipant__fetchImageForContact_targetSize_displayScale_isRTL_resultHandler___block_invoke;
  v20[3] = &unk_1E5147A90;
  v21 = v15;
  v16 = v15;
  +[PXActivityUtilities requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:](PXActivityUtilities, "requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v14, v8, 0, v20, width, height, a5);
  v17 = +[PXPeopleFaceCropManager generateUniqueRequestID](PXPeopleFaceCropManager, "generateUniqueRequestID");

  return v17;
}

+ (int)_fetchImageForEmailAddress:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 resultHandler:(id)a7
{
  _BOOL8 v8;
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  int v17;
  void *v19;
  _QWORD v20[4];
  id v21;

  v8 = a6;
  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSharedLibraryUIParticipant.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddress"));

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __103__PXSharedLibraryUIParticipant__fetchImageForEmailAddress_targetSize_displayScale_isRTL_resultHandler___block_invoke;
  v20[3] = &unk_1E5147A90;
  v21 = v15;
  v16 = v15;
  +[PXActivityUtilities requestMonogramForEmailAddress:targetSize:displayScale:isRTL:completion:](PXActivityUtilities, "requestMonogramForEmailAddress:targetSize:displayScale:isRTL:completion:", v14, v8, v20, width, height, a5);
  v17 = +[PXPeopleFaceCropManager generateUniqueRequestID](PXPeopleFaceCropManager, "generateUniqueRequestID");

  return v17;
}

void __103__PXSharedLibraryUIParticipant__fetchImageForEmailAddress_targetSize_displayScale_isRTL_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    if (v6)
    {
      v10 = *(_QWORD *)off_1E50B8440;
      v11[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v5, v9);

    }
    else
    {
      (*(void (**)(uint64_t, id, _QWORD))(v8 + 16))(v8, v5, MEMORY[0x1E0C9AA70]);
    }
  }

}

void __98__PXSharedLibraryUIParticipant__fetchImageForContact_targetSize_displayScale_isRTL_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    if (v6)
    {
      v10 = *(_QWORD *)off_1E50B8440;
      v11[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v5, v9);

    }
    else
    {
      (*(void (**)(uint64_t, id, _QWORD))(v8 + 16))(v8, v5, MEMORY[0x1E0C9AA70]);
    }
  }

}

@end
