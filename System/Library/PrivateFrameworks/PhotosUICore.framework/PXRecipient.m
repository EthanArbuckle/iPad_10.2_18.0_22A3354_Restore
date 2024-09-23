@implementation PXRecipient

- (PXRecipient)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRecipient.m"), 96, CFSTR("%s is not available as initializer"), "-[PXRecipient init]");

  abort();
}

- (PXRecipient)initWithAddress:(id)a3 nameComponents:(id)a4 recipientKind:(int64_t)a5
{
  return -[PXRecipient initWithContact:address:nameComponents:recipientKind:](self, "initWithContact:address:nameComponents:recipientKind:", 0, a3, a4, a5);
}

- (PXRecipient)initWithEmailAddress:(id)a3 phoneNumber:(id)a4 nameComponents:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  PXRecipient *v14;
  void *v16;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  if (objc_msgSend(v11, "length"))
  {
    v12 = 1;
    v13 = v11;
  }
  else
  {
    if (!objc_msgSend(v9, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRecipient.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hasEmailAddress || (phoneNumber.length > 0)"));

    }
    v12 = 2;
    v13 = v9;
  }
  v14 = -[PXRecipient initWithContact:address:nameComponents:recipientKind:](self, "initWithContact:address:nameComponents:recipientKind:", 0, v13, v10, v12);

  return v14;
}

- (PXRecipient)initWithContact:(id)a3 address:(id)a4 nameComponents:(id)a5 recipientKind:(int64_t)a6
{
  unint64_t v11;
  unint64_t v12;
  id v13;
  PXRecipient *v14;
  id v15;
  objc_class *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *localizedName;
  NSString *v24;
  NSString *v25;
  uint64_t v26;
  NSString *firstName;
  uint64_t v28;
  NSString *lastName;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  BOOL v39;
  uint64_t v40;
  NSString *emailAddressString;
  uint64_t v42;
  uint64_t v43;
  NSSet *allEmails;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *phoneNumberString;
  uint64_t v57;
  NSString *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSSet *allPhones;
  uint64_t v63;
  NSSet *unformattedAllPhones;
  PXRecipientTransport *v65;
  NSString *v66;
  uint64_t v67;
  uint64_t v68;
  PXRecipientTransport *invalidAddressString;
  id v71;
  uint64_t v72;
  NSString *v73;
  uint64_t v74;
  uint64_t v75;
  NSSet *v76;
  uint64_t v77;
  NSString *v78;
  NSString *v79;
  void *v80;
  uint64_t v81;
  NSSet *v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  NSSet *v86;
  uint64_t v87;
  NSString *v88;
  NSString *v89;
  NSString *v90;
  void *v91;
  unint64_t v92;
  id v93;
  id v94;
  int64_t v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSString *v101;
  PXRecipient *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  objc_super v111;
  uint8_t buf[4];
  id v113;
  __int16 v114;
  unint64_t v115;
  __int16 v116;
  int64_t v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v11 = (unint64_t)a3;
  v12 = (unint64_t)a4;
  v13 = a5;
  if (!(v11 | v12))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRecipient.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("providedContact != nil || providedAddress != nil"));

  }
  v111.receiver = self;
  v111.super_class = (Class)PXRecipient;
  v14 = -[PXRecipient init](&v111, sel_init);
  if (v14)
  {
    v15 = (id)v11;
    v93 = v15;
    if (v11
      || (objc_msgSend((id)objc_opt_class(), "_contactForAddress:recipientKind:", v12, a6),
          (v15 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_storeStrong((id *)&v14->_contact, v15);
      v16 = (objc_class *)MEMORY[0x1E0CB3850];
      v17 = v15;
      v18 = objc_alloc_init(v16);
      objc_msgSend(v17, "givenName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setGivenName:", v19);

      objc_msgSend(v17, "familyName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setFamilyName:", v20);
      objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v18, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v21, "copy");
      localizedName = v14->_localizedName;
      v14->_localizedName = (NSString *)v22;

      v95 = a6;
      if (-[NSString length](v14->_localizedName, "length"))
        v24 = v14->_localizedName;
      else
        v24 = (NSString *)objc_msgSend((id)v12, "copy");
      v25 = v14->_localizedName;
      v14->_localizedName = v24;

      objc_msgSend(v17, "givenName");
      v26 = objc_claimAutoreleasedReturnValue();
      firstName = v14->_firstName;
      v14->_firstName = (NSString *)v26;

      objc_msgSend(v17, "familyName");
      v28 = objc_claimAutoreleasedReturnValue();
      lastName = v14->_lastName;
      v14->_lastName = (NSString *)v28;

      v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v14;
      v96 = v13;
      v94 = v17;
      if (objc_msgSend(v17, "isKeyAvailable:", *MEMORY[0x1E0C966A8]))
      {
        objc_msgSend(v17, "emailAddresses");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
        if (!v32)
          goto LABEL_24;
        v33 = v32;
        v34 = *(_QWORD *)v108;
        while (1)
        {
          v35 = 0;
          do
          {
            if (*(_QWORD *)v108 != v34)
              objc_enumerationMutation(v31);
            objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * v35), "value");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = +[PXRecipientTransportUtilities px_IsValidEmailAddress:](PXRecipientTransportUtilities, "px_IsValidEmailAddress:", v36);
            v38 = v30;
            if (v37)
            {
              if (v12)
              {
                v39 = +[PXRecipientTransportUtilities px_IsEmailAddress:equalToEmailAddress:](PXRecipientTransportUtilities, "px_IsEmailAddress:equalToEmailAddress:", v36, v12);
                v38 = v100;
                if (!v39)
                  goto LABEL_19;
LABEL_18:
                v40 = objc_msgSend(v36, "copy");
                emailAddressString = v102->_emailAddressString;
                v102->_emailAddressString = (NSString *)v40;

                v38 = v100;
                goto LABEL_19;
              }
              v38 = v100;
              if (!v102->_emailAddressString)
                goto LABEL_18;
            }
LABEL_19:
            objc_msgSend(v38, "addObject:", v36);

            ++v35;
          }
          while (v33 != v35);
          v42 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
          v33 = v42;
          if (!v42)
          {
LABEL_24:

            v14 = v102;
            v17 = v94;
            break;
          }
        }
      }
      v43 = objc_msgSend(v100, "copy");
      allEmails = v14->_allEmails;
      v14->_allEmails = (NSSet *)v43;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "isKeyAvailable:", *MEMORY[0x1E0C967C0]))
        goto LABEL_46;
      v97 = v30;
      objc_msgSend(v17, "phoneNumbers");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = v12;
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v12);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = 0u;
      v104 = 0u;
      v105 = 0u;
      v106 = 0u;
      v47 = v45;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
      if (!v48)
        goto LABEL_45;
      v49 = v48;
      v50 = *(_QWORD *)v104;
LABEL_28:
      v51 = 0;
      while (1)
      {
        if (*(_QWORD *)v104 != v50)
          objc_enumerationMutation(v47);
        objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * v51), "value");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "formattedStringValue");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXRecipientTransportUtilities px_validPhoneNumberFromString:](PXRecipientTransportUtilities, "px_validPhoneNumberFromString:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v54;
        if (!v54)
        {
          if (v53)
            objc_msgSend(v97, "addObject:", v53);
          goto LABEL_43;
        }
        if (v46)
          break;
        if (!v102->_phoneNumberString)
        {
          v59 = objc_msgSend(v54, "copy");
          phoneNumberString = v102->_phoneNumberString;
          v102->_phoneNumberString = (NSString *)v59;
LABEL_39:

        }
        objc_msgSend(v99, "addObject:", v55);
        objc_msgSend(v52, "unformattedInternationalStringValue");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60)
          objc_msgSend(v98, "addObject:", v60);

LABEL_43:
        if (v49 == ++v51)
        {
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
          if (!v49)
          {
LABEL_45:

            v12 = v92;
            v13 = v96;
            v30 = v97;
            v14 = v102;
            v17 = v94;
LABEL_46:
            v61 = objc_msgSend(v99, "copy");
            allPhones = v14->_allPhones;
            v14->_allPhones = (NSSet *)v61;

            v63 = objc_msgSend(v98, "copy");
            unformattedAllPhones = v14->_unformattedAllPhones;
            v14->_unformattedAllPhones = (NSSet *)v63;

            a6 = v95;
LABEL_47:

            goto LABEL_48;
          }
          goto LABEL_28;
        }
      }
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v54);
      phoneNumberString = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(phoneNumberString, "isLikePhoneNumber:", v46))
      {
        v57 = objc_msgSend(v55, "copy");
        v58 = v102->_phoneNumberString;
        v102->_phoneNumberString = (NSString *)v57;

      }
      goto LABEL_39;
    }
    if (v13)
    {
      v71 = objc_alloc_init(MEMORY[0x1E0CB3858]);
      objc_msgSend(v71, "setStyle:", 0);
      objc_msgSend(v71, "stringFromPersonNameComponents:", v13);
      v72 = objc_claimAutoreleasedReturnValue();
      v73 = v14->_localizedName;
      v14->_localizedName = (NSString *)v72;

    }
    +[PXRecipientTransportUtilities px_validPhoneNumberFromString:](PXRecipientTransportUtilities, "px_validPhoneNumberFromString:", v12);
    v74 = objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      v30 = (id)v74;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v74);
      v75 = objc_claimAutoreleasedReturnValue();
      v76 = v14->_allPhones;
      v14->_allPhones = (NSSet *)v75;

      v77 = objc_msgSend(v30, "copy");
      v78 = v14->_phoneNumberString;
      v14->_phoneNumberString = (NSString *)v77;

      v79 = v14->_localizedName;
      if (!v79)
        v79 = v14->_phoneNumberString;
      objc_storeStrong((id *)&v14->_localizedName, v79);
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v30);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "unformattedInternationalStringValue");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v80)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v80);
        v81 = objc_claimAutoreleasedReturnValue();
        v82 = v14->_unformattedAllPhones;
        v14->_unformattedAllPhones = (NSSet *)v81;

      }
      v17 = 0;
      goto LABEL_47;
    }
    if (+[PXRecipientTransportUtilities px_IsValidEmailAddress:](PXRecipientTransportUtilities, "px_IsValidEmailAddress:", v12))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
      v85 = objc_claimAutoreleasedReturnValue();
      v86 = v14->_allEmails;
      v14->_allEmails = (NSSet *)v85;

      v87 = objc_msgSend((id)v12, "copy");
      v88 = v14->_emailAddressString;
      v14->_emailAddressString = (NSString *)v87;

      v89 = v14->_localizedName;
      if (!v89)
        v89 = v14->_emailAddressString;
      v90 = v89;
      v30 = 0;
      v17 = 0;
      v101 = v14->_localizedName;
      v14->_localizedName = v90;

    }
    else
    {
      v30 = 0;
      v17 = 0;
    }
LABEL_48:

    if (-[NSString length](v14->_phoneNumberString, "length"))
    {
      v65 = [PXRecipientTransport alloc];
      v66 = v14->_phoneNumberString;
      v67 = 2;
    }
    else
    {
      if (!-[NSString length](v14->_emailAddressString, "length"))
      {
        PLUIGetLog();
        v83 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v113 = v93;
          v114 = 2112;
          v115 = v12;
          v116 = 2048;
          v117 = a6;
          _os_log_impl(&dword_1A6789000, v83, OS_LOG_TYPE_ERROR, "No valid email address or phone number for the provided contact: \"%@\", address: \"%@\", kind: %ld", buf, 0x20u);
        }

        v84 = objc_msgSend((id)v12, "copy");
        invalidAddressString = (PXRecipientTransport *)v14->_invalidAddressString;
        v14->_invalidAddressString = (NSString *)v84;
        goto LABEL_53;
      }
      v65 = [PXRecipientTransport alloc];
      v66 = v14->_emailAddressString;
      v67 = 1;
    }
    v68 = -[PXRecipientTransport initWithAddress:addressKind:](v65, "initWithAddress:addressKind:", v66, v67);
    invalidAddressString = v14->_suggestedTransport;
    v14->_suggestedTransport = (PXRecipientTransport *)v68;
LABEL_53:

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  char v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXRecipient firstName](self, "firstName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {

    }
    else
    {
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (!v8)
      {
        v9 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    -[PXRecipient lastName](self, "lastName");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastName");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {

    }
    else
    {
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if (!v12)
      {
        v9 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    -[PXRecipient allPhones](self, "allPhones");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allPhones");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13 == (void *)v14)
    {
      v26 = (void *)v14;
    }
    else
    {
      -[PXRecipient allPhones](self, "allPhones");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allPhones");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "isEqualToSet:"))
      {
        v9 = 0;
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      v25 = v16;
      v26 = v15;
    }
    -[PXRecipient allEmails](self, "allEmails");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allEmails");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v17 == (void *)v18)
    {

      v9 = 1;
    }
    else
    {
      v19 = (void *)v18;
      -[PXRecipient allEmails](self, "allEmails");
      v23 = v13;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allEmails");
      v24 = v10;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v20, "isEqualToSet:", v21);

      v10 = v24;
      v13 = v23;

    }
    v16 = v25;
    v15 = v26;
    if (v13 == v26)
      goto LABEL_21;
    goto LABEL_20;
  }
  v9 = 0;
LABEL_24:

  return v9;
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

  -[PXRecipient firstName](self, "firstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXRecipient lastName](self, "lastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[PXRecipient allPhones](self, "allPhones");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[PXRecipient allEmails](self, "allEmails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXRecipient localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRecipient allEmails](self, "allEmails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRecipient allPhones](self, "allPhones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRecipient suggestedTransport](self, "suggestedTransport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("localizedName %@ emails %@ phones %@ suggestedTransport %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSSet)allEmails
{
  return self->_allEmails;
}

- (NSSet)allPhones
{
  return self->_allPhones;
}

- (NSSet)unformattedAllPhones
{
  return self->_unformattedAllPhones;
}

- (NSString)phoneNumberString
{
  return self->_phoneNumberString;
}

- (NSString)emailAddressString
{
  return self->_emailAddressString;
}

- (PXRecipientTransport)suggestedTransport
{
  return self->_suggestedTransport;
}

- (void)setSuggestedTransport:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedTransport, a3);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)invalidAddressString
{
  return self->_invalidAddressString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidAddressString, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_suggestedTransport, 0);
  objc_storeStrong((id *)&self->_emailAddressString, 0);
  objc_storeStrong((id *)&self->_phoneNumberString, 0);
  objc_storeStrong((id *)&self->_unformattedAllPhones, 0);
  objc_storeStrong((id *)&self->_allPhones, 0);
  objc_storeStrong((id *)&self->_allEmails, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXRecipient.m"), 100, CFSTR("%s is not available as initializer"), "+[PXRecipient new]");

  abort();
}

+ (id)_contactForAddress:(id)a3 recipientKind:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = 0;
  v7 = 0;
  if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 3) > 0xFFFFFFFFFFFFFFFDLL)
    goto LABEL_17;
  +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
    a4 = +[PXRecipientTransportUtilities px_recipientKindFromString:](PXRecipientTransportUtilities, "px_recipientKindFromString:", v5);
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_7;
LABEL_10:
    v7 = 0;
    goto LABEL_17;
  }
  if (a4 != 2)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_10;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v12 = *MEMORY[0x1E0C966A8];
    v28[0] = v10;
    v28[1] = v12;
    v28[2] = *MEMORY[0x1E0C967C0];
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = v28;
    v15 = 3;
  }
  else
  {
    v16 = *MEMORY[0x1E0C967C0];
    v27[0] = *MEMORY[0x1E0C966A8];
    v27[1] = v16;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = v27;
    v15 = 2;
  }
  objc_msgSend(v13, "arrayWithObjects:count:", v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v6, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, v17, &v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v22;
  if (v19)
  {
    PLUIGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "+[PXRecipient _contactForAddress:recipientKind:]";
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "%s: Error while fetching contacts: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v18, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v7;
}

- (void)px_requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 resultHandler:(id)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v6 = a5;
  height = a3.height;
  width = a3.width;
  v12 = a6;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRecipient+PXFaceTileImageCombinerItem.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!CGSizeEqualToSize(targetSize, CGSizeZero)"));

  }
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRecipient+PXFaceTileImageCombinerItem.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayScale > 0"));

    if (v12)
      goto LABEL_8;
  }
  else if (v12)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRecipient+PXFaceTileImageCombinerItem.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultHandler"));

LABEL_8:
  -[PXRecipient suggestedTransport](self, "suggestedTransport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "addressKind");
  if (v15 == 1)
  {
    objc_msgSend(v14, "address");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
  }
  else
  {
    if (v15 == 2)
    {
      objc_msgSend(v14, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRecipient+PXFaceTileImageCombinerItem.m"), 35, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      v16 = 0;
    }
    v17 = 0;
  }
  -[PXRecipient firstName](self, "firstName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRecipient lastName](self, "lastName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __107__PXRecipient_PXFaceTileImageCombinerItem__px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke;
  v25[3] = &unk_1E5147BC8;
  v26 = v12;
  v20 = v12;
  +[PXActivityUtilities requestPersonImageWithTargetSize:displayScale:isRTL:matchingEmail:orPhone:withFirstName:lastName:prefersPhotosImage:withCompletion:](PXActivityUtilities, "requestPersonImageWithTargetSize:displayScale:isRTL:matchingEmail:orPhone:withFirstName:lastName:prefersPhotosImage:withCompletion:", v6, v17, v16, v18, v19, 1, width, height, a4, v25);

}

uint64_t __107__PXRecipient_PXFaceTileImageCombinerItem__px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
