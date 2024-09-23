@implementation PXSharedAlbumSubscriberInfo

- (PXSharedAlbumSubscriberInfo)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumSubscriberInfo.m"), 90, CFSTR("%s is not available as initializer"), "-[PXSharedAlbumSubscriberInfo init]");

  return 0;
}

- (PXSharedAlbumSubscriberInfo)initWithInvitationRecord:(id)a3 identifier:(id)a4 email:(id)a5 phone:(id)a6 firstName:(id)a7 lastName:(id)a8 displayName:(id)a9 isOwner:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PXSharedAlbumSubscriberInfo *v24;
  PXSharedAlbumSubscriberInfo *v25;
  uint64_t v26;
  NSString *identifier;
  uint64_t v28;
  NSString *email;
  uint64_t v30;
  NSString *phone;
  uint64_t v32;
  NSString *firstName;
  uint64_t v34;
  NSString *lastName;
  uint64_t v36;
  NSString *displayName;
  objc_super v39;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v39.receiver = self;
  v39.super_class = (Class)PXSharedAlbumSubscriberInfo;
  v24 = -[PXSharedAlbumSubscriberInfo init](&v39, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_invitationRecord, a3);
    v26 = objc_msgSend(v18, "copy");
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    v28 = objc_msgSend(v19, "copy");
    email = v25->_email;
    v25->_email = (NSString *)v28;

    v30 = objc_msgSend(v20, "copy");
    phone = v25->_phone;
    v25->_phone = (NSString *)v30;

    v32 = objc_msgSend(v21, "copy");
    firstName = v25->_firstName;
    v25->_firstName = (NSString *)v32;

    v34 = objc_msgSend(v22, "copy");
    lastName = v25->_lastName;
    v25->_lastName = (NSString *)v34;

    v36 = objc_msgSend(v23, "copy");
    displayName = v25->_displayName;
    v25->_displayName = (NSString *)v36;

    v25->_isOwner = a10;
  }

  return v25;
}

- (id)matchingContactWithKeysToFetch:(id)a3 outMatchingKey:(id *)a4 outMatchingIdentifier:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id *v48;
  id *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  id *v56;
  id *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  id v80;
  _QWORD v81[5];

  v81[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x1E0C966A8];
  v12 = (void *)*MEMORY[0x1E0C967C0];
  v81[0] = *MEMORY[0x1E0C966A8];
  v81[1] = v12;
  v50 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v13);

  -[PXSharedAlbumSubscriberInfo firstName](self, "firstName");
  v14 = objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumSubscriberInfo lastName](self, "lastName");
  v15 = objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumSubscriberInfo email](self, "email");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumSubscriberInfo phone](self, "phone");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 | v15 && (v17 = objc_alloc_init(MEMORY[0x1E0C97218])) != 0)
  {
    v62 = v17;
    objc_msgSend(v17, "setStyle:", 0);
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v18);

  }
  else
  {
    v62 = 0;
  }
  v60 = (void *)v15;
  if (!objc_msgSend(v16, "length"))
  {
    v63 = 0;
    v23 = 0;
LABEL_28:
    if (objc_msgSend(v61, "length"))
    {
      v55 = v14;
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v61);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = 0;
      objc_msgSend(v9, "unifiedContactsMatchingPredicate:keysToFetch:error:", v30, v10, &v69);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v69;
      if (v53)
      {
        PLUIGetLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v78 = "-[PXSharedAlbumSubscriberInfo matchingContactWithKeysToFetch:outMatchingKey:outMatchingIdentifier:]";
          v79 = 2112;
          v80 = v53;
          _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "%s: Error attempting to fetch unified contacts : %@", buf, 0x16u);
        }

      }
      if (objc_msgSend(v59, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C97200], "pl_findBestMatchingContactFromMatchingContacts:firstName:lastName:contactFormatter:", v59, v55, v60, v62);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v49 = a5;
          v47 = v10;
          v51 = v50;

          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          objc_msgSend(v21, "phoneNumbers");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
          if (v33)
          {
            v34 = v33;
            v64 = v30;
            v57 = a4;
            v43 = v9;
            v45 = v8;
            v35 = *(_QWORD *)v66;
            while (2)
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v66 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
                objc_msgSend(v37, "value", v43, v45);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v38, "isLikePhoneNumber:", v29))
                {
                  objc_msgSend(v37, "identifier");
                  v39 = objc_claimAutoreleasedReturnValue();

                  v23 = (void *)v39;
                  goto LABEL_48;
                }

              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
              if (v34)
                continue;
              break;
            }
LABEL_48:
            v9 = v43;
            v8 = v45;
            a4 = v57;
            v30 = v64;
          }

          a5 = v49;
          v63 = v51;
          v10 = v47;
        }
      }
      else
      {
        v21 = 0;
      }

      v14 = v55;
    }
    else
    {
      v21 = 0;
    }
    goto LABEL_51;
  }
  v56 = a4;
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v16);
  v74 = 0;
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unifiedContactsMatchingPredicate:keysToFetch:error:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  if (v58)
  {
    PLUIGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v78 = "-[PXSharedAlbumSubscriberInfo matchingContactWithKeysToFetch:outMatchingKey:outMatchingIdentifier:]";
      v79 = 2112;
      v80 = v58;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "%s: Error attempting to fetch unified contacts : %@", buf, 0x16u);
    }

  }
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C97200], "pl_findBestMatchingContactFromMatchingContacts:firstName:lastName:contactFormatter:", v19, v14, v15, v62);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v48 = a5;
      v63 = v11;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      objc_msgSend(v21, "emailAddresses");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      if (v23)
      {
        v54 = v14;
        v44 = v8;
        v46 = v10;
        v42 = v9;
        v24 = *(_QWORD *)v71;
        while (2)
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(_QWORD *)v71 != v24)
              objc_enumerationMutation(v22);
            v26 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v26, "value", v42, v44);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", v16);

            if (v28)
            {
              objc_msgSend(v26, "identifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_24;
            }
          }
          v23 = (void *)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
          if (v23)
            continue;
          break;
        }
LABEL_24:
        v9 = v42;
        v8 = v44;
        v10 = v46;
        v14 = v54;
      }

      a5 = v48;
    }
    else
    {
      v23 = 0;
      v63 = 0;
    }
  }
  else
  {
    v23 = 0;
    v63 = 0;
    v21 = 0;
  }

  a4 = v56;
  if (!v21)
    goto LABEL_28;
LABEL_51:
  if (a4)
    *a4 = objc_retainAutorelease(v63);
  if (a5)
    *a5 = objc_retainAutorelease(v23);
  v40 = v21;

  return v40;
}

- (PLCloudSharedAlbumInvitationRecord)invitationRecord
{
  return self->_invitationRecord;
}

- (BOOL)isOwner
{
  return self->_isOwner;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)phone
{
  return self->_phone;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_phone, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_invitationRecord, 0);
}

+ (id)allSubscribersForAlbum:(id)a3
{
  return (id)objc_msgSend(a1, "_allSubscribersForAlbum:includeMyself:", a3, 1);
}

+ (id)allSubscribersForAlbumWithObjectID:(id)a3 includingCurrentUser:(BOOL)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__17226;
  v24 = __Block_byref_object_dispose__17227;
  v25 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __108__PXSharedAlbumSubscriberInfo_allSubscribersForAlbumWithObjectID_includingCurrentUser_managedObjectContext___block_invoke;
  v14[3] = &unk_1E5118FA8;
  v10 = v8;
  v15 = v10;
  v11 = v9;
  v16 = v11;
  v17 = &v20;
  v18 = a1;
  v19 = a4;
  objc_msgSend(v11, "performBlockAndWait:", v14);
  v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v12;
}

+ (id)_allSubscribersForAlbum:(id)a3 includeMyself:(BOOL)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  PXSharedAlbumSubscriberInfo *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_msgSend(v5, "isOwnedCloudSharedAlbum");
  v37 = v5;
  objc_msgSend(v5, "cloudAlbumSubscriberRecords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v12);
        if (a4 || (objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v12), "isMine") & 1) == 0)
        {
          objc_msgSend(v13, "invitationState");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "integerValue");

          if (!v7)
          {
            if (v15 != 2)
              goto LABEL_13;
LABEL_12:
            objc_msgSend(v6, "addObject:", v13);
            goto LABEL_13;
          }
          if ((unint64_t)(v15 - 1) < 4)
            goto LABEL_12;
        }
LABEL_13:
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v10);
  }

  v16 = objc_msgSend(v6, "count");
  v17 = v37;
  v18 = v16 + (objc_msgSend(v37, "isOwnedCloudSharedAlbum") ^ 1);
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v18);
  v20 = (void *)v19;
  if (v18)
  {
    v21 = 0;
    v35 = v18;
    v36 = (void *)v19;
    do
    {
      v22 = v17;
      v23 = v6;
      if (objc_msgSend(v22, "isOwnedCloudSharedAlbum"))
      {
        v24 = v23;
        v25 = v21;
      }
      else
      {
        if (!v21)
        {
          v27 = v22;
          objc_msgSend(v27, "cloudOwnerEmail");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "cloudOwnerFirstName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "cloudOwnerLastName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "cloudOwnerDisplayNameIncludingEmail:allowsEmail:", 0, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "cloudOwnerHashedPersonID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v34) = 1;
          v26 = -[PXSharedAlbumSubscriberInfo initWithInvitationRecord:identifier:email:phone:firstName:lastName:displayName:isOwner:]([PXSharedAlbumSubscriberInfo alloc], "initWithInvitationRecord:identifier:email:phone:firstName:lastName:displayName:isOwner:", 0, v32, v28, 0, v29, v30, v31, v34);

          v18 = v35;
          v20 = v36;

          v17 = v37;
          goto LABEL_22;
        }
        v25 = v21 - 1;
        v24 = v23;
      }
      _subscriberInfoForAdjustedIndex(v24, v25);
      v26 = (PXSharedAlbumSubscriberInfo *)objc_claimAutoreleasedReturnValue();
LABEL_22:

      objc_msgSend(v20, "addObject:", v26);
      ++v21;
    }
    while (v18 != v21);
  }

  return v20;
}

void __108__PXSharedAlbumSubscriberInfo_allSubscribersForAlbumWithObjectID_includingCurrentUser_managedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D71628], "cloudSharedAlbumWithObjectID:managedObjectContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v2;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 56), "_allSubscribersForAlbum:includeMyself:", v2, *(unsigned __int8 *)(a1 + 64));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
