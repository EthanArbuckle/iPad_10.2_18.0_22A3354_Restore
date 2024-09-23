@implementation PKContactAvatarManager

- (PKContactAvatarManager)initWithContactResolver:(id)a3 paymentDataProvider:(id)a4
{
  id v7;
  id v8;
  PKContactAvatarManager *v9;
  PKContactAvatarManager *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *dictionaryAvatars;
  id v13;
  void *v14;
  uint64_t v15;
  CNAvatarImageRenderer *renderer;
  Class v17;
  uint64_t v18;
  CNAvatarImageRenderingScope *scope;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKContactAvatarManager;
  v9 = -[PKContactAvatarManager init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentDataProvider, a4);
    objc_storeStrong((id *)&v10->_contactResolver, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionaryAvatars = v10->_dictionaryAvatars;
    v10->_dictionaryAvatars = v11;

    v13 = objc_alloc(_MergedGlobals_661());
    objc_msgSend((Class)off_1ED06C4D0(), "defaultSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithSettings:", v14);
    renderer = v10->_renderer;
    v10->_renderer = (CNAvatarImageRenderer *)v15;

    v17 = (Class)off_1ED06C4D8();
    -[objc_class scopeWithPointSize:scale:rightToLeft:style:](v17, "scopeWithPointSize:scale:rightToLeft:style:", 1, 0, 100.0, 100.0, PKUIScreenScale());
    v18 = objc_claimAutoreleasedReturnValue();
    scope = v10->_scope;
    v10->_scope = (CNAvatarImageRenderingScope *)v18;

  }
  return v10;
}

- (id)cachedAvatarForAltDSID:(id)a3
{
  os_unfair_lock_s *p_lockAvatars;
  id v5;
  void *v6;

  p_lockAvatars = &self->_lockAvatars;
  v5 = a3;
  os_unfair_lock_lock(p_lockAvatars);
  -[NSMutableDictionary objectForKey:](self->_dictionaryAvatars, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lockAvatars);
  return v6;
}

- (void)avatarForFamilyMember:(id)a3 peerPaymentAccount:(id)a4 invitation:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v9 = a5;
  v10 = a6;
  objc_msgSend(v19, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v9, "altDSID");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v19, "dsid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v16, "setContactType:", 0);
  if (v19)
  {
    objc_msgSend(v19, "firstName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setGivenName:", v17);

    objc_msgSend(v19, "lastName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFamilyName:", v18);

  }
  -[PKContactAvatarManager _avatarForAltDSID:dsid:handles:contact:completion:](self, "_avatarForAltDSID:dsid:handles:contact:completion:", v14, v15, 0, v16, v10);

}

- (void)avatarForFamilyMember:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dsid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v9, "setContactType:", 0);
  if (v12)
  {
    objc_msgSend(v12, "firstName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGivenName:", v10);

    objc_msgSend(v12, "lastName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFamilyName:", v11);

  }
  -[PKContactAvatarManager _avatarForAltDSID:dsid:handles:contact:completion:](self, "_avatarForAltDSID:dsid:handles:contact:completion:", v7, v8, 0, v9, v6);

}

- (void)avatarForFamilyMember:(id)a3 accountUser:(id)a4 invitation:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  PKContactAvatarManager *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;

  v31 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "altDSID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v29 = v11;
  v15 = self;
  if (v13)
  {
    v16 = v13;
  }
  else
  {
    objc_msgSend(v11, "invitationDetails", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accountUserAltDSID");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v31, "dsid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v19, "setContactType:", 0);
  if (v31)
  {
    objc_msgSend(v31, "firstName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setGivenName:", v20);

    objc_msgSend(v31, "lastName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFamilyName:", v21);
LABEL_8:

    goto LABEL_9;
  }
  if (v10)
  {
    objc_msgSend(v10, "nameComponents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "givenName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setGivenName:", v22);

    objc_msgSend(v21, "familyName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFamilyName:", v23);

    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v10, "addressableHandles", v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");

  objc_msgSend(v10, "appleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 && (objc_msgSend(v25, "containsObject:", v26) & 1) == 0)
    objc_msgSend(v25, "addObject:", v26);
  v27 = (void *)objc_msgSend(v25, "copy");
  v28 = (void *)objc_msgSend(v19, "copy");
  -[PKContactAvatarManager _avatarForAltDSID:dsid:handles:contact:completion:](v15, "_avatarForAltDSID:dsid:handles:contact:completion:", v16, v18, v27, v28, v12);

}

- (void)_avatarForAltDSID:(id)a3 dsid:(id)a4 handles:(id)a5 contact:(id)a6 completion:(id)a7
{
  id v12;
  void (**v13)(id, uint64_t);
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  void (**v33)(id, uint64_t);
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  void (**v38)(id, uint64_t);
  _QWORD *v39;
  _QWORD v40[6];
  id v41;
  void (**v42)(id, uint64_t);
  _QWORD *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  id v49;
  _QWORD *v50;
  _QWORD v51[5];
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v29 = a4;
  v26 = a5;
  v28 = a6;
  v13 = (void (**)(id, uint64_t))a7;
  os_unfair_lock_lock(&self->_lockAvatars);
  v30 = v12;
  -[NSMutableDictionary objectForKey:](self->_dictionaryAvatars, "objectForKey:", v12);
  v27 = objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lockAvatars);
  v14 = (void *)v27;
  if (v27)
  {
    v13[2](v13, v27);
  }
  else
  {
    -[CNAvatarImageRenderer placeholderImageProvider](self->_renderer, "placeholderImageProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageForSize:scale:", 100.0, 100.0, PKUIScreenScale());
    v24 = objc_claimAutoreleasedReturnValue();

    if (v24)
      ((void (*)(void (**)(id, uint64_t)))v13[2])(v13);
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = __Block_byref_object_copy__29;
    v51[4] = __Block_byref_object_dispose__29;
    v52 = 0;
    v16 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    if (v29)
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke;
      v48[3] = &unk_1E3E63610;
      v48[4] = self;
      v49 = v29;
      v50 = v51;
      objc_msgSend(v16, "addOperation:", v48);

    }
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v17 = v26;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v45 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_3;
          v40[3] = &unk_1E3E6E120;
          v40[4] = self;
          v40[5] = v21;
          v43 = v51;
          v41 = v30;
          v42 = v13;
          objc_msgSend(v16, "addOperation:", v40);

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v18);
    }

    if (v28)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_7;
      v35[3] = &unk_1E3E6E120;
      v35[4] = self;
      v36 = v28;
      v39 = v51;
      v37 = v30;
      v38 = v13;
      objc_msgSend(v16, "addOperation:", v35);

    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_9;
    v31[3] = &unk_1E3E6E148;
    v34 = v51;
    v31[4] = self;
    v32 = v30;
    v33 = v13;
    v23 = (id)objc_msgSend(v16, "evaluateWithInput:completion:", v22, v31);

    _Block_object_dispose(v51, 8);
    v14 = 0;
  }

}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v19[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_2;
  v14[3] = &unk_1E3E6E080;
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v17 = v7;
  v18 = v11;
  v15 = v10;
  v16 = v6;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v8, "photosForFamilyMembersWithDSIDs:completion:", v9, v14);

}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKey:", a1[4]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v4);
    if (v3)
      objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v3);
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v8 + 8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_4;
  v13[3] = &unk_1E3E6E0F8;
  v18 = *(_QWORD *)(a1 + 64);
  v16 = v7;
  v13[4] = v8;
  v14 = v6;
  v15 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "contactForHandle:withCompletion:", v9, v13);

}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_5;
  block[3] = &unk_1E3E6E0D0;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v13 = *(_QWORD *)(a1 + 72);
  v11 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 64);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[3];
  char v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v19 = 0;
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v20[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_6;
    v10[3] = &unk_1E3E6E0A8;
    v6 = *(_QWORD *)(a1 + 80);
    v16 = v18;
    v17 = v6;
    v14 = *(id *)(a1 + 64);
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 40);
    v11 = v7;
    v12 = v8;
    v13 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 72);
    v9 = (id)objc_msgSend(v3, "renderAvatarsForContacts:scope:imageHandler:", v4, v5, v10);

    _Block_object_dispose(v18, 8);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), 0);
  }
}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_6(_QWORD *a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a2;
  v5 = *(_QWORD *)(a1[9] + 8);
  v6 = v4;
  if (*(_BYTE *)(v5 + 24))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[5] + 16));
    objc_msgSend(*(id *)(a1[5] + 24), "setObject:forKey:", v6, a1[6]);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 16));
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    if (v4)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[10] + 8) + 40), a2);
      v5 = *(_QWORD *)(a1[9] + 8);
    }
    *(_BYTE *)(v5 + 24) = 1;
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD v26[3];
  char v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v28[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_8;
  v18[3] = &unk_1E3E6E0A8;
  v13 = *(_QWORD *)(a1 + 64);
  v24 = v26;
  v25 = v13;
  v14 = v9;
  v22 = v14;
  v15 = v8;
  v16 = *(_QWORD *)(a1 + 32);
  v19 = v15;
  v20 = v16;
  v21 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v17 = (id)objc_msgSend(v10, "renderAvatarsForContacts:scope:imageHandler:", v11, v12, v18);

  _Block_object_dispose(v26, 8);
}

void __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_8(_QWORD *a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a2;
  v5 = *(_QWORD *)(a1[9] + 8);
  v6 = v4;
  if (*(_BYTE *)(v5 + 24))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[5] + 16));
    objc_msgSend(*(id *)(a1[5] + 24), "setObject:forKey:", v6, a1[6]);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 16));
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    if (v4)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[10] + 8) + 40), a2);
      v5 = *(_QWORD *)(a1[9] + 8);
    }
    *(_BYTE *)(v5 + 24) = 1;
    (*(void (**)(void))(a1[7] + 16))();
  }

}

uint64_t __76__PKContactAvatarManager__avatarForAltDSID_dsid_handles_contact_completion___block_invoke_9(uint64_t result)
{
  _QWORD *v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40))
  {
    v1 = (_QWORD *)result;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(result + 32) + 16));
    objc_msgSend(*(id *)(v1[4] + 24), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(v1[7] + 8) + 40), v1[5]);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1[4] + 16));
    return (*(uint64_t (**)(void))(v1[6] + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_dictionaryAvatars, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
}

@end
