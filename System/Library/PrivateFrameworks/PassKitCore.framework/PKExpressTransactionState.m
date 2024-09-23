@implementation PKExpressTransactionState

+ (id)createForStandaloneTransaction:(int64_t)a3 applicationIdentifier:(id)a4 keyIdentifier:(id)a5 passUniqueIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  unsigned __int8 *v12;

  if (!a4)
    return 0;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = -[PKExpressTransactionState _initForStandaloneTransaction:applicationIdentifier:keyIdentifier:passUniqueIdentifier:terminalReaderIdentifier:]((unsigned __int8 *)[PKExpressTransactionState alloc], a3, v11, v10, v9, 0);

  return v12;
}

- (unsigned)_initForStandaloneTransaction:(void *)a3 applicationIdentifier:(void *)a4 keyIdentifier:(void *)a5 passUniqueIdentifier:(void *)a6 terminalReaderIdentifier:
{
  id v11;
  id v12;
  id v13;
  id v14;
  unsigned __int8 *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uuid_t out;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (a1)
  {
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    v15 = -[PKExpressTransactionState _initWithUUID:](a1, out);
    a1 = v15;
    if (v15)
    {
      *((_WORD *)v15 + 16) = 0;
      *((_QWORD *)v15 + 10) = a2;
      *((_QWORD *)v15 + 11) = 0;
      v15[34] = 1;
      v16 = objc_msgSend(v11, "copy");
      v17 = (void *)*((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v16;

      v18 = objc_msgSend(v12, "copy");
      v19 = (void *)*((_QWORD *)a1 + 6);
      *((_QWORD *)a1 + 6) = v18;

      v20 = objc_msgSend(v13, "copy");
      v21 = (void *)*((_QWORD *)a1 + 7);
      *((_QWORD *)a1 + 7) = v20;

      v22 = objc_msgSend(v14, "copy");
      v23 = (void *)*((_QWORD *)a1 + 8);
      *((_QWORD *)a1 + 8) = v22;

    }
  }

  return a1;
}

+ (id)createForStandaloneTransaction:(int64_t)a3 applicationIdentifier:(id)a4 keyIdentifier:(id)a5 passUniqueIdentifier:(id)a6 terminalReaderIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  unsigned __int8 *v15;

  if (a4)
  {
    v11 = a7;
    v12 = a6;
    v13 = a5;
    v14 = a4;
    v15 = -[PKExpressTransactionState _initForStandaloneTransaction:applicationIdentifier:keyIdentifier:passUniqueIdentifier:terminalReaderIdentifier:]((unsigned __int8 *)[PKExpressTransactionState alloc], a3, v14, v13, v12, v11);

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

+ (id)create
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "createForExpressType:", 0);
  objc_msgSend(v2, "resolve");
  return v2;
}

+ (id)createForExpressType:(int64_t)a3
{
  id result;
  id v5;
  uuid_t out;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = [PKExpressTransactionState alloc];
  if (result)
  {
    v5 = result;
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    result = -[PKExpressTransactionState _initWithUUID:](v5, out);
    if (result)
    {
      *((_WORD *)result + 16) = 257;
      *((_QWORD *)result + 10) = 0;
      *((_QWORD *)result + 11) = a3;
      *((_BYTE *)result + 34) = 0;
    }
  }
  return result;
}

- (PKExpressTransactionState)init
{

  return 0;
}

- (unsigned)_initWithUUID:(void *)a1
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)PKExpressTransactionState;
  v3 = (unsigned __int8 *)objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
    uuid_copy(v3 + 8, a2);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKExpressTransactionState *v5;
  uint64_t v6;
  NSMutableSet *TCIs;
  uuid_t out;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = +[PKExpressTransactionState allocWithZone:](PKExpressTransactionState, "allocWithZone:");
  if (v5)
  {
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    v5 = (PKExpressTransactionState *)-[PKExpressTransactionState _initWithUUID:](v5, out);
  }
  uuid_copy(v5->_uuid, self->_uuid);
  v5->_express = self->_express;
  v5->_type = self->_type;
  v5->_standaloneTransactionType = self->_standaloneTransactionType;
  v6 = -[NSMutableSet mutableCopyWithZone:](self->_TCIs, "mutableCopyWithZone:", a3);
  TCIs = v5->_TCIs;
  v5->_TCIs = (NSMutableSet *)v6;

  v5->_processing = self->_processing;
  v5->_associated = self->_associated;
  if (self->_associated)
  {
    objc_storeStrong((id *)&v5->_applicationIdentifier, self->_applicationIdentifier);
    objc_storeStrong((id *)&v5->_keyIdentifier, self->_keyIdentifier);
    objc_storeStrong((id *)&v5->_terminalReaderIdentifier, self->_terminalReaderIdentifier);
    objc_storeStrong((id *)&v5->_passUniqueIdentifier, self->_passUniqueIdentifier);
  }
  v5->_receivedEvents = self->_receivedEvents;
  return v5;
}

- (unint64_t)hash
{
  return SipHash();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
    v6 = -[PKExpressTransactionState isEqualToState:](self, "isEqualToState:", v4);

  return v6;
}

- (BOOL)isRelatedToState:(id)a3
{
  return a3 && uuid_compare((const unsigned __int8 *)a3 + 8, self->_uuid) == 0;
}

- (BOOL)isEqualToState:(id)a3
{
  unsigned __int8 *v4;
  NSMutableSet *v5;
  NSMutableSet *TCIs;
  NSString *applicationIdentifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  NSString *keyIdentifier;
  NSString *v13;
  _BOOL4 v14;
  NSString *terminalReaderIdentifier;
  NSString *v16;
  _BOOL4 v17;
  NSString *passUniqueIdentifier;
  NSString *v19;
  _BOOL4 v20;
  BOOL v21;

  v4 = (unsigned __int8 *)a3;
  if (!-[PKExpressTransactionState isRelatedToState:](self, "isRelatedToState:", v4)
    || v4[32] != self->_express
    || *((_QWORD *)v4 + 11) != self->_type
    || *((_QWORD *)v4 + 10) != self->_standaloneTransactionType)
  {
    goto LABEL_37;
  }
  v5 = (NSMutableSet *)*((_QWORD *)v4 + 3);
  TCIs = self->_TCIs;
  if (v5 && TCIs)
  {
    if ((-[NSMutableSet isEqual:](v5, "isEqual:") & 1) == 0)
      goto LABEL_37;
  }
  else if (v5 != TCIs)
  {
    goto LABEL_37;
  }
  if (v4[33] != self->_processing || v4[34] != self->_associated)
    goto LABEL_37;
  if (!v4[34])
  {
LABEL_40:
    v21 = *((_QWORD *)v4 + 9) == self->_receivedEvents;
    goto LABEL_38;
  }
  applicationIdentifier = self->_applicationIdentifier;
  v8 = (NSString *)*((id *)v4 + 5);
  v9 = applicationIdentifier;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if (!v8 || !v9)
      goto LABEL_36;
    v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

    if (!v11)
      goto LABEL_37;
  }
  keyIdentifier = self->_keyIdentifier;
  v8 = (NSString *)*((id *)v4 + 6);
  v13 = keyIdentifier;
  if (v8 == v13)
  {

  }
  else
  {
    v10 = v13;
    if (!v8 || !v13)
      goto LABEL_36;
    v14 = -[NSString isEqualToString:](v8, "isEqualToString:", v13);

    if (!v14)
      goto LABEL_37;
  }
  terminalReaderIdentifier = self->_terminalReaderIdentifier;
  v8 = (NSString *)*((id *)v4 + 8);
  v16 = terminalReaderIdentifier;
  if (v8 == v16)
  {

  }
  else
  {
    v10 = v16;
    if (!v8 || !v16)
      goto LABEL_36;
    v17 = -[NSString isEqualToString:](v8, "isEqualToString:", v16);

    if (!v17)
      goto LABEL_37;
  }
  passUniqueIdentifier = self->_passUniqueIdentifier;
  v8 = (NSString *)*((id *)v4 + 7);
  v19 = passUniqueIdentifier;
  if (v8 == v19)
  {

    goto LABEL_40;
  }
  v10 = v19;
  if (!v8 || !v19)
  {
LABEL_36:

    goto LABEL_37;
  }
  v20 = -[NSString isEqualToString:](v8, "isEqualToString:", v19);

  if (v20)
    goto LABEL_40;
LABEL_37:
  v21 = 0;
LABEL_38:

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKExpressTransactionState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  PKExpressTransactionState *v10;
  unsigned __int8 *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37[128];
  char in[16];
  unsigned __int8 v39[21];
  uuid_t uu;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  memset(uu, 0, sizeof(uu));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKExpressTransactionState"), 0, 0);
    objc_msgSend(v4, "failWithError:", v9);

    goto LABEL_6;
  }
  *(_OWORD *)in = 0u;
  memset(v39, 0, sizeof(v39));
  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "UTF8String");
  if ((unint64_t)__strlcpy_chk() > 0x24 || uuid_parse(in, uu))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKExpressTransactionState"), 0, 0);
    objc_msgSend(v4, "failWithError:", v8);

LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }

  v12 = -[PKExpressTransactionState _initWithUUID:](self, uu);
  if (v12)
  {
    v12[32] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("express"));
    *((_QWORD *)v12 + 11) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    *((_QWORD *)v12 + 10) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("standaloneTransaction"));
    v13 = objc_opt_class();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v13, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("TCIs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v34 != v19)
                objc_enumerationMutation(v16);
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                goto LABEL_21;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            if (v18)
              continue;
            break;
          }
        }

        v21 = objc_msgSend(v16, "mutableCopy");
        v22 = (void *)*((_QWORD *)v12 + 3);
        *((_QWORD *)v12 + 3) = v21;

      }
      else
      {
LABEL_21:

        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKExpressTransactionState"), 0, 0);
        objc_msgSend(v4, "failWithError:", v16);
      }

    }
    v12[33] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("processing"));
    v23 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("associated"));
    v12[34] = v23;
    if (v23)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("applicationIdentifier"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)*((_QWORD *)v12 + 5);
      *((_QWORD *)v12 + 5) = v24;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("keyIdentifier"));
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)*((_QWORD *)v12 + 6);
      *((_QWORD *)v12 + 6) = v26;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("terminalReaderIdentifier"));
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)*((_QWORD *)v12 + 8);
      *((_QWORD *)v12 + 8) = v28;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("passUniqueIdentifier"));
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)*((_QWORD *)v12 + 7);
      *((_QWORD *)v12 + 7) = v30;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("events"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v12 + 9) = objc_msgSend(v32, "unsignedIntegerValue");

  }
  self = v12;
  v10 = self;
LABEL_7:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BYTE v7[37];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v7, 0, sizeof(v7));
  uuid_unparse_upper(self->_uuid, v7);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v7);
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_express, CFSTR("express"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_standaloneTransactionType, CFSTR("standaloneTransaction"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_TCIs, CFSTR("TCIs"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_processing, CFSTR("processing"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_associated, CFSTR("associated"));
  if (self->_associated)
  {
    objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("applicationIdentifier"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_keyIdentifier, CFSTR("keyIdentifier"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_terminalReaderIdentifier, CFSTR("terminalReaderIdentifier"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_passUniqueIdentifier, CFSTR("passUniqueIdentifier"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_receivedEvents);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("events"));

}

- (void)associateWithTCIs:(id)a3
{
  id v4;
  NSMutableSet *TCIs;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  if (self->_processing && v4)
  {
    v8 = v4;
    if (objc_msgSend(v4, "count"))
    {
      TCIs = self->_TCIs;
      if (TCIs)
      {
        -[NSMutableSet unionSet:](TCIs, "unionSet:", v8);
      }
      else
      {
        v6 = (NSMutableSet *)objc_msgSend(v8, "mutableCopy");
        v7 = self->_TCIs;
        self->_TCIs = v6;

      }
    }

  }
  else
  {
    __break(1u);
  }
}

- (void)associateWithApplicationIdentifier:(id)a3 keyIdentifier:(id)a4 terminalReaderIdentifier:(id)a5 passUniqueIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSString *v14;
  NSString *applicationIdentifier;
  NSString *v16;
  NSString *keyIdentifier;
  NSString *v18;
  NSString *terminalReaderIdentifier;
  NSString *v20;
  NSString *passUniqueIdentifier;
  id v22;

  v22 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!self->_processing || self->_associated)
  {
    __break(1u);
  }
  else
  {
    v13 = v12;
    self->_associated = 1;
    v14 = (NSString *)objc_msgSend(v22, "copy");
    applicationIdentifier = self->_applicationIdentifier;
    self->_applicationIdentifier = v14;

    v16 = (NSString *)objc_msgSend(v10, "copy");
    keyIdentifier = self->_keyIdentifier;
    self->_keyIdentifier = v16;

    v18 = (NSString *)objc_msgSend(v11, "copy");
    terminalReaderIdentifier = self->_terminalReaderIdentifier;
    self->_terminalReaderIdentifier = v18;

    v20 = (NSString *)objc_msgSend(v13, "copy");
    passUniqueIdentifier = self->_passUniqueIdentifier;
    self->_passUniqueIdentifier = v20;

  }
}

- (void)_populatePassUniqueIdentifierWithLookup:(id)a3
{
  id v4;
  NSString *applicationIdentifier;
  void *v6;
  NSString *v7;
  NSString *passUniqueIdentifier;
  id v9;

  v4 = a3;
  if (self->_associated)
  {
    if (!self->_passUniqueIdentifier)
    {
      applicationIdentifier = self->_applicationIdentifier;
      if (applicationIdentifier)
      {
        v9 = v4;
        (*((void (**)(id, NSString *, NSString *))v4 + 2))(v4, applicationIdentifier, self->_keyIdentifier);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (NSString *)objc_msgSend(v6, "copy");
        passUniqueIdentifier = self->_passUniqueIdentifier;
        self->_passUniqueIdentifier = v7;

        v4 = v9;
      }
    }

  }
  else
  {
    __break(1u);
  }
}

- (BOOL)mergeState:(id)a3
{
  id *v4;
  id *v5;
  NSMutableSet *TCIs;
  NSMutableSet *v7;
  NSMutableSet *v8;
  id v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  _BOOL4 v13;
  char v14;
  id v15;
  NSString *v16;
  _BOOL4 v17;
  id v18;
  NSString *v19;
  _BOOL4 v20;
  id v21;
  NSString *v22;
  BOOL v23;

  v4 = (id *)a3;
  if (!self->_processing || (v5 = v4) == 0)
  {
    __break(1u);
    return (char)v4;
  }
  if (!-[PKExpressTransactionState isRelatedToState:](self, "isRelatedToState:", v4))
    goto LABEL_39;
  if (v5[3])
  {
    TCIs = self->_TCIs;
    if (TCIs)
    {
      -[NSMutableSet unionSet:](TCIs, "unionSet:");
    }
    else
    {
      v7 = (NSMutableSet *)objc_msgSend(v5[3], "mutableCopy");
      v8 = self->_TCIs;
      self->_TCIs = v7;

    }
  }
  if (!self->_associated)
  {
    if (*((_BYTE *)v5 + 34))
      -[PKExpressTransactionState associateWithApplicationIdentifier:keyIdentifier:terminalReaderIdentifier:passUniqueIdentifier:](self, "associateWithApplicationIdentifier:keyIdentifier:terminalReaderIdentifier:passUniqueIdentifier:", v5[5], v5[6], v5[8], v5[7]);
    goto LABEL_17;
  }
  if (*((_BYTE *)v5 + 34))
  {
    v9 = v5[5];
    v10 = self->_applicationIdentifier;
    v11 = (NSString *)v9;
    if (v10 == v11)
    {

    }
    else
    {
      v12 = v11;
      if (!v10 || !v11)
        goto LABEL_38;
      v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

      if (!v13)
        goto LABEL_39;
    }
    v15 = v5[6];
    v10 = self->_keyIdentifier;
    v16 = (NSString *)v15;
    if (v10 == v16)
    {

    }
    else
    {
      v12 = v16;
      if (!v10 || !v16)
        goto LABEL_38;
      v17 = -[NSString isEqualToString:](v10, "isEqualToString:", v16);

      if (!v17)
        goto LABEL_39;
    }
    v18 = v5[8];
    v10 = self->_terminalReaderIdentifier;
    v19 = (NSString *)v18;
    if (v10 == v19)
    {

LABEL_33:
      v21 = v5[7];
      v10 = self->_passUniqueIdentifier;
      v22 = (NSString *)v21;
      if (v10 == v22)
      {

        goto LABEL_17;
      }
      v12 = v22;
      if (v10 && v22)
      {
        v23 = -[NSString isEqualToString:](v10, "isEqualToString:", v22);

        if (!v23)
          goto LABEL_39;
LABEL_17:
        -[PKExpressTransactionState receiveEvents:](self, "receiveEvents:", v5[9]);
        -[PKExpressTransactionState receiveStandaloneTransaction:](self, "receiveStandaloneTransaction:", v5[10]);
        if (!*((_BYTE *)v5 + 33))
          -[PKExpressTransactionState resolve](self, "resolve");
        v14 = 1;
        goto LABEL_40;
      }
      goto LABEL_38;
    }
    v12 = v19;
    if (v10 && v19)
    {
      v20 = -[NSString isEqualToString:](v10, "isEqualToString:", v19);

      if (!v20)
        goto LABEL_39;
      goto LABEL_33;
    }
LABEL_38:

  }
LABEL_39:
  v14 = 0;
LABEL_40:

  LOBYTE(v4) = v14;
  return (char)v4;
}

- (BOOL)receiveEvents:(unint64_t)a3
{
  PKExpressTransactionState *v4;
  uint64_t v5;

  if (self->_processing)
  {
    v4 = self;
    v5 = -[PKExpressTransactionState _normalizedStatus]((uint64_t)self);
    v4->_receivedEvents |= a3;
    LOBYTE(self) = -[PKExpressTransactionState _normalizedStatus]((uint64_t)v4) != v5;
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (uint64_t)_normalizedStatus
{
  unint64_t v1;
  unint64_t v2;

  if (result)
  {
    if ((unint64_t)(*(_QWORD *)(result + 80) - 1) < 2)
      return 1;
    v1 = *(_QWORD *)(result + 72);
    if ((v1 & 6) != 0)
    {
      return 1;
    }
    else if ((v1 & 0x200) != 0)
    {
      return 3;
    }
    else
    {
      v2 = v1 >> 7;
      if ((v2 & 2) != 0)
        return v2 & 2;
      else
        return 2 * (*(_BYTE *)(result + 33) == 0);
    }
  }
  return result;
}

- (BOOL)receiveStandaloneTransaction:(int64_t)a3
{
  PKExpressTransactionState *v4;
  uint64_t v5;

  if (self->_processing)
  {
    if (a3)
    {
      v4 = self;
      v5 = -[PKExpressTransactionState _normalizedStatus]((uint64_t)self);
      v4->_standaloneTransactionType = a3;
      LOBYTE(self) = -[PKExpressTransactionState _normalizedStatus]((uint64_t)v4) != v5;
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (void)resolve
{
  if (self->_processing)
    self->_processing = 0;
  else
    __break(1u);
}

- (BOOL)isIgnorable
{
  unint64_t receivedEvents;
  _BOOL8 v3;

  if (!self)
  {
    receivedEvents = MEMORY[0x48];
    return (receivedEvents >> 10) & 1;
  }
  if ((unint64_t)(self->_standaloneTransactionType - 1) >= 2)
  {
    receivedEvents = self->_receivedEvents;
    if ((receivedEvents & 0x306) == 0)
      return (receivedEvents >> 10) & 1;
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)transacted
{
  return (self->_receivedEvents & 7) != 0 || self->_standaloneTransactionType != 0;
}

- (NSSet)TCIs
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_TCIs, "copy");
}

- (BOOL)isExpress
{
  return self->_express;
}

- (BOOL)isProcessing
{
  return self->_processing;
}

- (BOOL)isAssociated
{
  return self->_associated;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (NSString)terminalReaderIdentifier
{
  return self->_terminalReaderIdentifier;
}

- (unint64_t)receivedEvents
{
  return self->_receivedEvents;
}

- (int64_t)standaloneTransactionType
{
  return self->_standaloneTransactionType;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminalReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_TCIs, 0);
}

@end
