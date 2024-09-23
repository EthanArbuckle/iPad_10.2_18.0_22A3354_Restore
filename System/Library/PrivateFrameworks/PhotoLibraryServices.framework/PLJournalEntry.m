@implementation PLJournalEntry

- (PLJournalEntry)init
{
  return -[PLJournalEntry initWithPayloadID:payload:payloadClass:entryType:](self, "initWithPayloadID:payload:payloadClass:entryType:", 0, 0, 0, 0);
}

- (PLJournalEntry)initWithPayloadID:(id)a3 payload:(id)a4 payloadClass:(Class)a5 entryType:(int)a6
{
  uint64_t v6;
  id v11;
  id v12;
  PLJournalEntry *v13;
  PLJournalEntry *v14;
  PLJournalEntryHeader *v15;
  PLJournalEntryHeader *header;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v6 = *(_QWORD *)&a6;
  v29 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PLJournalEntry;
  v13 = -[PLJournalEntry init](&v27, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_payloadID, a3);
    v15 = objc_alloc_init(PLJournalEntryHeader);
    header = v14->_header;
    v14->_header = v15;

    -[PLJournalEntryHeader setEntryType:](v14->_header, "setEntryType:", v6);
    objc_storeStrong((id *)&v14->_payloadClass, a5);
    if (v12)
    {
      -[PLJournalEntryHeader setPayloadVersion:](v14->_header, "setPayloadVersion:", objc_msgSend(v12, "payloadVersion"));
      if ((_DWORD)v6 == 1)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v12, "nilProperties", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v24;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v24 != v20)
                objc_enumerationMutation(v17);
              -[PLJournalEntryHeader addNilProperties:](v14->_header, "addNilProperties:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v21++));
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          }
          while (v19);
        }

      }
      objc_storeStrong((id *)&v14->_payload, a4);
    }
  }

  return v14;
}

- (id)initForInsertWithPayload:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PLJournalEntry *v8;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "payloadID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "payloadClassID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLJournal.m"), 268, CFSTR("payloadID must be non-nil (payloadClassID: %@)"), v11);

  }
  objc_msgSend(v5, "payloadID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLJournalEntry initWithPayloadID:payload:payloadClass:entryType:](self, "initWithPayloadID:payload:payloadClass:entryType:", v7, v5, objc_opt_class(), 0);

  return v8;
}

- (id)initForUpdateWithPayload:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PLJournalEntry *v8;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "payloadID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "payloadClassID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLJournal.m"), 273, CFSTR("payloadID must be non-nil (payloadClassID: %@)"), v11);

  }
  objc_msgSend(v5, "payloadID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLJournalEntry initWithPayloadID:payload:payloadClass:entryType:](self, "initWithPayloadID:payload:payloadClass:entryType:", v7, v5, objc_opt_class(), 1);

  return v8;
}

- (id)initForDeleteWithPayloadID:(id)a3 payloadClass:(Class)a4
{
  id v7;
  PLJournalEntry *v8;
  void *v10;
  void *v11;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class payloadClassID](a4, "payloadClassID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLJournal.m"), 278, CFSTR("payloadID must be non-nil (payloadClassID: %@)"), v11);

  }
  v8 = -[PLJournalEntry initWithPayloadID:payload:payloadClass:entryType:](self, "initWithPayloadID:payload:payloadClass:entryType:", v7, 0, a4, 2);

  return v8;
}

- (unsigned)payloadVersion
{
  return -[PLJournalEntryHeader payloadVersion](self->_header, "payloadVersion");
}

- (void)setPayloadVersion:(unsigned int)a3
{
  -[PLJournalEntryHeader setPayloadVersion:](self->_header, "setPayloadVersion:", *(_QWORD *)&a3);
}

- (unint64_t)entryType
{
  return -[PLJournalEntryHeader entryType](self->_header, "entryType");
}

- (BOOL)_readFromFileHandle:(id)a3 decodePayload:(BOOL)a4 payloadClass:(Class)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  int v21;
  id v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  PLJournalEntryPayloadID *v28;
  PLJournalEntryPayloadID *payloadID;
  void *v30;
  PLJournalEntryPayloadID *v31;
  PLJournalEntryPayloadID *v32;
  unint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  PLJournalEntryPayload *v39;
  uint64_t v40;
  unsigned int v41;
  BOOL v42;
  PLJournalEntryPayloadID *v43;
  uint64_t v44;
  PLJournalEntryPayload *v45;
  PLJournalEntryPayload *payload;
  id v47;
  _QWORD v48[4];

  v8 = a4;
  v48[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(v10, "readDataOfLength:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length") == 1)
  {
    v12 = objc_retainAutorelease(v11);
    if (*(_BYTE *)objc_msgSend(v12, "bytes") == 64)
    {

      objc_msgSend(v10, "readDataOfLength:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length") == 2)
      {
        LOWORD(v48[0]) = 0;
        objc_msgSend(v13, "getBytes:length:", v48, 2);
        v14 = LOWORD(v48[0]);

        objc_msgSend(v10, "readDataOfLength:", 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length") == 2)
        {
          LOWORD(v48[0]) = 0;
          objc_msgSend(v15, "getBytes:length:", v48, 2);
          v16 = LOWORD(v48[0]);

          if (v16)
          {
            v17 = __rev16(v16);
            objc_msgSend(v10, "readDataOfLength:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v18, "length"))
            {
              v19 = 51005;
              goto LABEL_21;
            }
            if (objc_msgSend(v18, "length") < v17)
            {
              v19 = 51001;
LABEL_21:

              goto LABEL_12;
            }
            v48[0] = 0;
            v23 = objc_retainAutorelease(v18);
            objc_msgSend(v23, "bytes");
            objc_msgSend(v23, "length");
            CNCRC();
            if (v48[0] == bswap32(v14) >> 16)
            {
              v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v23);
              if ((PLJournalEntryHeaderReadFrom((uint64_t)self->_header, (uint64_t)v24) & 1) != 0)
              {
                if (!-[PLJournalEntryHeader hasPayloadUUID](self->_header, "hasPayloadUUID")
                  || (-[PLJournalEntryHeader payloadUUID](self->_header, "payloadUUID"),
                      v25 = (void *)objc_claimAutoreleasedReturnValue(),
                      v26 = objc_msgSend(v25, "length") == 16,
                      v25,
                      v26))
                {
                  if (-[PLJournalEntryHeader hasPayloadUUID](self->_header, "hasPayloadUUID"))
                  {
                    -[PLJournalEntryHeader payloadUUID](self->_header, "payloadUUID");
                    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDBytes:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDBytes:", objc_msgSend(v27, "bytes"));
                    v28 = (PLJournalEntryPayloadID *)objc_claimAutoreleasedReturnValue();
                    payloadID = self->_payloadID;
                    self->_payloadID = v28;

                    -[PLJournalEntryHeader setPayloadUUID:](self->_header, "setPayloadUUID:", 0);
                    goto LABEL_31;
                  }
                  if (-[PLJournalEntryHeader hasPayloadID](self->_header, "hasPayloadID"))
                  {
                    -[PLJournalEntryHeader payloadID](self->_header, "payloadID");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    +[PLJournalEntryPayloadIDFactory payloadIDWithString:](PLJournalEntryPayloadIDFactory, "payloadIDWithString:", v30);
                    v31 = (PLJournalEntryPayloadID *)objc_claimAutoreleasedReturnValue();
                    v32 = self->_payloadID;
                    self->_payloadID = v31;

LABEL_31:
                    objc_storeStrong((id *)&self->_payloadClass, a5);
                    v33 = -[PLJournalEntryHeader payloadLength](self->_header, "payloadLength");
                    -[PLJournalEntryHeader nilProperties](self->_header, "nilProperties");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v34)
                    {
                      v35 = objc_alloc(MEMORY[0x1E0C99E60]);
                      -[PLJournalEntryHeader nilProperties](self->_header, "nilProperties");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      v37 = (void *)objc_msgSend(v35, "initWithArray:", v36);

                    }
                    else
                    {
                      v37 = 0;
                    }

                    if (v33)
                    {
                      objc_msgSend(v10, "readDataOfLength:", v33);
                      v38 = (id)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v38, "length") >= v33)
                      {
                        v48[0] = 0;
                        v38 = objc_retainAutorelease(v38);
                        objc_msgSend(v38, "bytes");
                        objc_msgSend(v38, "length");
                        CNCRC();
                        v40 = v48[0];
                        v41 = -[PLJournalEntryHeader payloadCRC](self->_header, "payloadCRC");
                        v20 = 0;
                        v42 = v40 == v41;
                        v21 = v42;
                        if (v40 == v41)
                          v19 = 0;
                        else
                          v19 = 51001;
                        if (v42 && v8)
                        {
                          v43 = self->_payloadID;
                          v44 = -[PLJournalEntryHeader payloadVersion](self->_header, "payloadVersion");
                          v47 = 0;
                          -[objc_class payloadWithData:forPayloadID:version:andNilProperties:error:](a5, "payloadWithData:forPayloadID:version:andNilProperties:error:", v38, v43, v44, v37, &v47);
                          v45 = (PLJournalEntryPayload *)objc_claimAutoreleasedReturnValue();
                          v20 = v47;
                          payload = self->_payload;
                          self->_payload = v45;

                          if (v20)
                          {
                            v21 = 0;
                            v19 = 51001;
                          }
                          else
                          {
                            v19 = 0;
                            v21 = 1;
                          }
                        }
                      }
                      else
                      {
                        v20 = 0;
                        v21 = 0;
                        v19 = 51005;
                      }
                    }
                    else
                    {
                      v19 = 0;
                      v21 = 1;
                      v20 = 0;
                      if (-[PLJournalEntryHeader entryType](self->_header, "entryType") == 2 || !v8)
                        goto LABEL_52;
                      -[objc_class payloadWithData:forPayloadID:version:andNilProperties:error:](a5, "payloadWithData:forPayloadID:version:andNilProperties:error:", 0, self->_payloadID, -[PLJournalEntryHeader payloadVersion](self->_header, "payloadVersion"), v37, 0);
                      v39 = (PLJournalEntryPayload *)objc_claimAutoreleasedReturnValue();
                      v19 = 0;
                      v20 = 0;
                      v38 = self->_payload;
                      self->_payload = v39;
                    }

LABEL_52:
                    goto LABEL_13;
                  }
                }
              }

            }
            else
            {

            }
          }
          v20 = 0;
          v21 = 0;
          v19 = 51001;
          goto LABEL_13;
        }

      }
      else
      {

      }
      v20 = 0;
      v21 = 0;
      v19 = 51005;
      goto LABEL_13;
    }
    v19 = 51001;
  }
  else
  {
    v19 = 51005;
  }

LABEL_12:
  v20 = 0;
  v21 = 0;
LABEL_13:
  if (a6 && v19)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], v19, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21 != 0;
}

- (BOOL)readFromFileHandle:(id)a3 decodePayload:(BOOL)a4 payloadClass:(Class)a5 entryOffset:(unint64_t *)a6 error:(id *)a7
{
  _BOOL8 v10;
  id v12;
  unint64_t v13;
  BOOL v14;
  id v15;
  BOOL v16;
  uint64_t v17;
  _BOOL4 v18;
  id v19;
  id v21;
  id v22;

  v10 = a4;
  v12 = a3;
  v13 = objc_msgSend(v12, "offsetInFile");
  v22 = 0;
  v14 = -[PLJournalEntry _readFromFileHandle:decodePayload:payloadClass:error:](self, "_readFromFileHandle:decodePayload:payloadClass:error:", v12, v10, a5, &v22);
  v15 = v22;
  if (v14)
  {
    v16 = 1;
    if (!a6)
      goto LABEL_9;
LABEL_8:
    *a6 = v13;
    goto LABEL_9;
  }
  while (1)
  {
    v17 = objc_msgSend(v15, "code");
    v16 = v17 == 51001;
    if (v17 != 51001)
      break;
    objc_msgSend(v12, "seekToFileOffset:", ++v13);
    v21 = v15;
    v18 = -[PLJournalEntry _readFromFileHandle:decodePayload:payloadClass:error:](self, "_readFromFileHandle:decodePayload:payloadClass:error:", v12, v10, a5, &v21);
    v19 = v21;

    v15 = v19;
    if (v18)
    {
      v16 = 1;
      v15 = v19;
      break;
    }
  }
  if (a6)
    goto LABEL_8;
LABEL_9:
  if (a7)
    *a7 = objc_retainAutorelease(v15);

  return v16;
}

- (void)writeBytes:(const void *)a3 length:(unint64_t)a4 toFileHandle:(id)a5 checksumContext:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;

  v9 = (objc_class *)MEMORY[0x1E0C99D50];
  v10 = a6;
  v11 = a5;
  v12 = (id)objc_msgSend([v9 alloc], "initWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
  objc_msgSend(v10, "update:", v12);

  objc_msgSend(v11, "writeData:", v12);
}

- (void)_appendHeaderData:(id)a3 headerCRC:(unsigned __int16)a4 payloadData:(id)a5 toFileHandle:(id)a6 checksumContext:(id)a7
{
  unsigned int v10;
  id v12;
  id v13;
  id v14;
  id v15;
  PLJournalEntry *v16;
  SEL v17;
  id v18;
  unsigned __int16 v19;
  id v20;
  id v21;
  id v22;
  __int16 v23;
  __int16 v24;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[PLJournalEntry writeBytes:length:toFileHandle:checksumContext:](self, "writeBytes:length:toFileHandle:checksumContext:", &kPLJournalEntryMagic, 1, v14, v15);
  v24 = __rev16(v10);
  -[PLJournalEntry writeBytes:length:toFileHandle:checksumContext:](self, "writeBytes:length:toFileHandle:checksumContext:", &v24, 2, v14, v15);
  if ((unint64_t)objc_msgSend(v12, "length") >= 0x10000)
  {
    objc_msgSend(v12, "length");
    v16 = (PLJournalEntry *)_PFAssertFailHandler();
    -[PLJournalEntry appendHeaderData:headerCRC:payloadData:toFileHandle:checksumContext:](v16, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    v23 = bswap32(objc_msgSend(v12, "length")) >> 16;
    -[PLJournalEntry writeBytes:length:toFileHandle:checksumContext:](self, "writeBytes:length:toFileHandle:checksumContext:", &v23, 2, v14, v15);
    objc_msgSend(v14, "writeData:", v12);
    objc_msgSend(v15, "update:", v12);
    if (v13)
    {
      objc_msgSend(v14, "writeData:", v13);
      objc_msgSend(v15, "update:", v13);
    }

  }
}

- (BOOL)writeToFileHandle:(id)a3 checksumContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  PLJournalEntryPayload *payload;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v22[3];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  payload = self->_payload;
  if (!payload)
  {
    v11 = 0;
LABEL_7:
    v15 = objc_alloc_init(MEMORY[0x1E0D82B98]);
    -[PLJournalEntryPayloadID payloadUUIDData](self->_payloadID, "payloadUUIDData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[PLJournalEntryHeader setPayloadUUID:](self->_header, "setPayloadUUID:", v17);
    }
    else
    {
      -[PLJournalEntryPayloadID payloadIDString](self->_payloadID, "payloadIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLJournalEntryHeader setPayloadID:](self->_header, "setPayloadID:", v18);

    }
    if (objc_msgSend(v11, "length"))
    {
      v19 = objc_retainAutorelease(v11);
      objc_msgSend(v19, "bytes");
      objc_msgSend(v19, "length");
      CNCRC();
      -[PLJournalEntryHeader setPayloadCRC:](self->_header, "setPayloadCRC:", 0);
      -[PLJournalEntryHeader setPayloadLength:](self->_header, "setPayloadLength:", objc_msgSend(v19, "length"));
    }
    -[PLJournalEntryHeader writeTo:](self->_header, "writeTo:", v15);
    objc_msgSend(v15, "immutableData");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v20, "bytes");
    objc_msgSend(v20, "length");
    CNCRC();
    -[PLJournalEntryHeader setPayloadID:](self->_header, "setPayloadID:", 0);
    -[PLJournalEntry appendHeaderData:headerCRC:payloadData:toFileHandle:checksumContext:](self, "appendHeaderData:headerCRC:payloadData:toFileHandle:checksumContext:", v20, 0, v11, v8, v9);
    v16 = 1;

    v13 = v11;
    goto LABEL_13;
  }
  v22[0] = 0;
  -[PLJournalEntryPayload payloadDataWithError:](payload, "payloadDataWithError:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v22[0];
  v13 = v12;
  if (!a5 || v11)
  {

    if (!v11)
    {
      v16 = 0;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  v14 = (void *)MEMORY[0x1E0CB35C8];
  v23 = *MEMORY[0x1E0CB3388];
  v24[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 51002, v15);
  v16 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_14:
  return v16;
}

- (id)description
{
  PLDescriptionBuilder *v3;
  void *v4;

  v3 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", self, 1, 0);
  -[PLJournalEntry descriptionWithBuilder:](self, "descriptionWithBuilder:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescription
{
  PLDescriptionBuilder *v3;
  void *v4;

  v3 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", self, 3, 0);
  -[PLJournalEntry descriptionWithBuilder:](self, "descriptionWithBuilder:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionWithBuilder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[PLJournalEntry header](self, "header");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "entryType");
  if (v6 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E366E708[v6];
  }
  objc_msgSend(v4, "appendName:object:", CFSTR("type"), v7);

  -[PLJournalEntry payloadID](self, "payloadID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLJournalEntry payloadID](self, "payloadID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendName:object:", CFSTR("payloadID"), v9);

  }
  -[PLJournalEntry header](self, "header");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "entryType");

  if (v11 != 2)
    objc_msgSend(v4, "appendName:integerValue:", CFSTR("version"), -[PLJournalEntry payloadVersion](self, "payloadVersion"));
  -[PLJournalEntry payload](self, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (objc_msgSend(v4, "style") == 3)
    {
      -[PLJournalEntryPayload prettyDescriptionForEntry:indent:](self->_payload, "prettyDescriptionForEntry:indent:", self, objc_msgSend(v4, "indent") + 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendName:object:", CFSTR("payload"), v13);
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      -[PLJournalEntryPayload descriptionForEntry:](self->_payload, "descriptionForEntry:", self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("[%@]"), v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendName:object:", CFSTR("payload"), v15);

    }
  }
  objc_msgSend(v4, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)entryTypeDescription
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  -[PLJournalEntry header](self, "header");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "entryType");
  if (v3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E366E708[v3];
  }

  return v4;
}

- (PLJournalEntryPayloadID)payloadID
{
  return self->_payloadID;
}

- (void)setPayloadID:(id)a3
{
  objc_storeStrong((id *)&self->_payloadID, a3);
}

- (Class)payloadClass
{
  return self->_payloadClass;
}

- (PLJournalEntryPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (PLJournalEntryHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (NSPersistentHistoryToken)historyToken
{
  return self->_historyToken;
}

- (void)setHistoryToken:(id)a3
{
  objc_storeStrong((id *)&self->_historyToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_payloadClass, 0);
  objc_storeStrong((id *)&self->_payloadID, 0);
}

@end
