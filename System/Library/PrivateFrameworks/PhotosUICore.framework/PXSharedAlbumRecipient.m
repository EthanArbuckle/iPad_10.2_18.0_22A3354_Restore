@implementation PXSharedAlbumRecipient

- (PXSharedAlbumRecipient)initWithInvitationRecord:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXSharedAlbumRecipient *v13;
  uint64_t v15;

  v5 = a3;
  objc_msgSend(v5, "inviteeHashedPersonID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inviteeFirstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inviteeLastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inviteeFullName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inviteeEmails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inviteePhones");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invitationState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v12, "intValue");
  v13 = -[PXSharedAlbumRecipient initWithPersonID:firstName:lastName:fullName:emails:phones:state:](self, "initWithPersonID:firstName:lastName:fullName:emails:phones:state:", v6, v7, v8, v9, v10, v11, v15);

  if (v13)
    objc_storeStrong((id *)&v13->_invitationRecord, a3);

  return v13;
}

- (PXSharedAlbumRecipient)initWithPersonID:(id)a3 firstName:(id)a4 lastName:(id)a5 fullName:(id)a6 emails:(id)a7 phones:(id)a8 state:(int)a9
{
  unint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  PXSharedAlbumRecipient *v23;
  id v25;
  void *v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v16 = (unint64_t)a4;
  v17 = (unint64_t)a5;
  v25 = a6;
  v18 = a7;
  v19 = a8;
  if (v16 | v17)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v20, "setFamilyName:", v17, v25, v27);
    objc_msgSend(v20, "setGivenName:", v16);
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v18, "firstObject", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)PXSharedAlbumRecipient;
  v23 = -[PXRecipient initWithEmailAddress:phoneNumber:nameComponents:](&v28, sel_initWithEmailAddress_phoneNumber_nameComponents_, v21, v22, v20);

  if (v23)
  {
    objc_storeStrong((id *)&v23->_personID, a3);
    objc_storeStrong((id *)&v23->_fullName, a6);
    v23->_state = a9;
  }

  return v23;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PXSharedAlbumRecipient fullName](self, "fullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PXRecipient localizedName](self, "localizedName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSArray)allEmailsArray
{
  void *v2;
  void *v3;

  -[PXRecipient allEmails](self, "allEmails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)allPhonesArray
{
  void *v2;
  void *v3;

  -[PXRecipient allPhones](self, "allPhones");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSNumber)stateNumber
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PXSharedAlbumRecipient state](self, "state"));
}

- (NSString)stateDescription
{
  void *v3;
  PXSharedAlbumRecipient *v4;
  void *v5;
  void *v6;

  -[PXSharedAlbumRecipient invitationRecord](self, "invitationRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = self;
  if (v3)
  {
    -[PXSharedAlbumRecipient invitationRecord](self, "invitationRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invitationStateDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
    switch(-[PXSharedAlbumRecipient state](v4, "state"))
    {
      case 0:
      case 2:
        return (NSString *)v6;
      default:
        PLLocalizedFrameworkString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  return (NSString *)v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXSharedAlbumRecipient displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRecipient allEmails](self, "allEmails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRecipient allPhones](self, "allPhones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("displayName: \"%@\", emails: %@, phones: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)displayAddress
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PXRecipient suggestedTransport](self, "suggestedTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[PXRecipient invalidAddressString](self, "invalidAddressString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
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

  -[PXRecipient firstName](self, "firstName");
  v14 = objc_claimAutoreleasedReturnValue();
  -[PXRecipient lastName](self, "lastName");
  v15 = objc_claimAutoreleasedReturnValue();
  -[PXRecipient emailAddressString](self, "emailAddressString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRecipient phoneNumberString](self, "phoneNumberString");
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
          v78 = "-[PXSharedAlbumRecipient matchingContactWithKeysToFetch:outMatchingKey:outMatchingIdentifier:]";
          v79 = 2112;
          v80 = v53;
          _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "%s: Error attempting to fetch unified contacts from phone : %@", buf, 0x16u);
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
      v78 = "-[PXSharedAlbumRecipient matchingContactWithKeysToFetch:outMatchingKey:outMatchingIdentifier:]";
      v79 = 2112;
      v80 = v58;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "%s: Error attempting to fetch unified contacts from email : %@", buf, 0x16u);
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

- (NSString)personID
{
  return self->_personID;
}

- (PLCloudSharedAlbumInvitationRecord)invitationRecord
{
  return self->_invitationRecord;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (int)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_invitationRecord, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

@end
