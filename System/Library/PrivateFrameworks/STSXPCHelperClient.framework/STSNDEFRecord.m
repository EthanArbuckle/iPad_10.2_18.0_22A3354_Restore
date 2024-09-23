@implementation STSNDEFRecord

- (STSNDEFRecord)initWithFormat:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  STSNDEFRecord *v13;
  const char *v14;
  STSNDEFRecord *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  objc_super v29;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)STSNDEFRecord;
  v13 = -[STSNDEFRecord init](&v29, sel_init);
  v15 = v13;
  if (v13)
  {
    objc_msgSend_setTypeNameFormat_(v13, v14, v8);
    v18 = (void *)objc_msgSend_copy(v10, v16, v17);
    objc_msgSend_setType_(v15, v19, (uint64_t)v18);

    v22 = (void *)objc_msgSend_copy(v11, v20, v21);
    objc_msgSend_setIdentifier_(v15, v23, (uint64_t)v22);

    v26 = (void *)objc_msgSend_copy(v12, v24, v25);
    objc_msgSend_setPayload_(v15, v27, (uint64_t)v26);

  }
  return v15;
}

- (unsigned)header
{
  return self->_firstOctet;
}

- (void)setHeader:(unsigned __int8)a3
{
  self->_firstOctet = a3;
}

- (BOOL)messageBegin
{
  return self->_firstOctet >> 7;
}

- (void)setMessageBegin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  self->_firstOctet = v3 & 0x80 | self->_firstOctet & 0x7F;
}

- (BOOL)messageEnd
{
  return (self->_firstOctet >> 6) & 1;
}

- (void)setMessageEnd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_firstOctet = self->_firstOctet & 0xBF | v3;
}

- (BOOL)chunked
{
  return (self->_firstOctet >> 5) & 1;
}

- (void)setChunked:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_firstOctet = self->_firstOctet & 0xDF | v3;
}

- (BOOL)shortRecord
{
  return (self->_firstOctet >> 4) & 1;
}

- (void)setShortRecord:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_firstOctet = self->_firstOctet & 0xEF | v3;
}

- (unsigned)typeNameFormat
{
  return self->_firstOctet & 7;
}

- (void)setTypeNameFormat:(unsigned __int8)a3
{
  self->_firstOctet = self->_firstOctet & 0xF8 | a3 & 7;
}

- (NSData)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (BOOL)_idLengthPresent
{
  return (self->_firstOctet >> 3) & 1;
}

- (void)_setIdLengthPresent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_firstOctet = self->_firstOctet & 0xF7 | v3;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  const char *v4;
  NSData *v5;
  NSData *identifier;
  NSData *v7;

  v7 = (NSData *)a3;
  if (v7)
  {
    objc_msgSend__setIdLengthPresent_(self, v4, 1);
    v5 = v7;
  }
  else
  {
    objc_msgSend__setIdLengthPresent_(self, v4, 0);
  }
  identifier = self->_identifier;
  self->_identifier = v7;

}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;

  objc_storeStrong((id *)&self->_payload, a3);
  v5 = a3;
  v8 = objc_msgSend_length(self->_payload, v6, v7);

  objc_msgSend_setShortRecord_(self, v9, v8 < 0x100);
}

+ (id)recordsWithTNF:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6 chunkSize:(unint64_t)a7 outError:(unint64_t *)a8
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  _BOOL8 v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  const char *v68;
  void *v69;
  const char *v70;
  const char *v71;
  unsigned int v73;
  unint64_t v74;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_length(v14, v19, v20) > 0xFF
    || (v23 = objc_msgSend_length(v13, v21, v22), v12 > 7)
    || v23 >= 0x100)
  {
    if (a8)
    {
      v31 = 0;
      v32 = 5;
LABEL_8:
      *a8 = v32;
      goto LABEL_36;
    }
LABEL_35:
    v31 = 0;
    goto LABEL_36;
  }
  if (objc_msgSend_length(v15, v24, v25) >= a7)
  {
    v73 = v12;
    v33 = objc_msgSend_length(v15, v26, v27) / a7;
    if (objc_msgSend_length(v15, v34, v35) % a7)
      ++v33;
    sub_20A02B230(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSNDEFRecord recordsWithTNF:type:identifier:payload:chunkSize:outError:]", 167, CFSTR("ChunkSize=%lu, RecordCount=%lu"), v36, v37, v38, a7);
    v74 = v33;
    if (!v33)
      goto LABEL_18;
    v12 = v73;
    if (v74 != 1)
    {
      v52 = 0;
      v53 = 0;
      while (1)
      {
        v54 = (void *)objc_opt_new();
        if (!v54)
          break;
        v56 = v54;
        if (v53)
        {
          if (v74 - 1 == v53)
          {
            objc_msgSend_setChunked_(v54, v55, 1);
            objc_msgSend_setTypeNameFormat_(v56, v57, 6);
            v60 = objc_msgSend_length(v15, v58, v59);
            objc_msgSend_subdataWithRange_(v15, v61, (v74 - 1) * a7, v60 - (v74 - 1) * a7);
          }
          else
          {
            objc_msgSend_setTypeNameFormat_(v54, v55, 6);
            objc_msgSend_subdataWithRange_(v15, v68, v52, a7);
          }
        }
        else
        {
          objc_msgSend_setChunked_(v54, v55, 1);
          objc_msgSend_setTypeNameFormat_(v56, v62, v73);
          objc_msgSend_setType_(v56, v63, (uint64_t)v13);
          if (objc_msgSend_length(v14, v64, v65))
            objc_msgSend_setIdentifier_(v56, v66, (uint64_t)v14);
          else
            objc_msgSend_setIdentifier_(v56, v66, 0);
          objc_msgSend_subdataWithRange_(v15, v67, 0, a7);
        }
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPayload_(v56, v70, (uint64_t)v69);

        objc_msgSend_addObject_(v18, v71, (uint64_t)v56);
        ++v53;
        v52 += a7;
        if (v74 == v53)
          goto LABEL_18;
      }
LABEL_33:
      if (a8)
      {
        v31 = 0;
        v32 = 6;
        goto LABEL_8;
      }
      goto LABEL_35;
    }
  }
  else
  {
    sub_20A02B230(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSNDEFRecord recordsWithTNF:type:identifier:payload:chunkSize:outError:]", 167, CFSTR("ChunkSize=%lu, RecordCount=%lu"), v28, v29, v30, a7);
  }
  v39 = objc_opt_new();
  if (!v39)
    goto LABEL_33;
  v42 = (void *)v39;
  v43 = (unint64_t)objc_msgSend_length(v15, v40, v41) < 0x100;
  objc_msgSend_setShortRecord_(v42, v44, v43);
  objc_msgSend_setTypeNameFormat_(v42, v45, v12);
  objc_msgSend_setType_(v42, v46, (uint64_t)v13);
  if (objc_msgSend_length(v14, v47, v48))
    objc_msgSend_setIdentifier_(v42, v49, (uint64_t)v14);
  else
    objc_msgSend_setIdentifier_(v42, v49, 0);
  objc_msgSend_setPayload_(v42, v50, (uint64_t)v15);
  objc_msgSend_addObject_(v18, v51, (uint64_t)v42);

LABEL_18:
  if (a8)
    *a8 = 0;
  v31 = v18;
LABEL_36:

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  STSNDEFRecord *v4;
  STSNDEFRecord *v5;
  const char *v6;
  uint64_t v7;
  STSNDEFRecord *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSData *identifier;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  NSData *type;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  NSData *payload;
  BOOL v26;

  v4 = (STSNDEFRecord *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v26 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v5;
    v26 = 0;
    if (((v8->_firstOctet ^ self->_firstOctet) & 7) == 0)
    {
      v9 = objc_msgSend_length(self->_identifier, v6, v7);
      if (v9 == objc_msgSend_length(v8->_identifier, v10, v11))
      {
        identifier = self->_identifier;
        if (!identifier || objc_msgSend_isEqualToData_(identifier, v12, (uint64_t)v8->_identifier))
        {
          v15 = objc_msgSend_length(self->_type, v12, v13);
          if (v15 == objc_msgSend_length(v8->_type, v16, v17))
          {
            type = self->_type;
            if (!type || objc_msgSend_isEqualToData_(type, v18, (uint64_t)v8->_type))
            {
              v21 = objc_msgSend_length(self->_payload, v18, v19);
              if (v21 == objc_msgSend_length(v8->_payload, v22, v23))
              {
                payload = self->_payload;
                if (!payload || objc_msgSend_isEqualToData_(payload, v24, (uint64_t)v8->_payload))
                  v26 = 1;
              }
            }
          }
        }
      }
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)description
{
  uint64_t v2;
  id v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  unsigned int v15;
  const char *v16;
  uint64_t v17;
  unsigned int v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  unsigned int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  unsigned int v37;
  void *v38;

  if (self->_type)
  {
    v4 = objc_alloc(MEMORY[0x24BDD17C8]);
    v6 = (void *)objc_msgSend_initWithData_encoding_(v4, v5, (uint64_t)self->_type, 4);
    if (!v6)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@"), self->_type);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }
  if (self->_identifier)
  {
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    v9 = (void *)objc_msgSend_initWithData_encoding_(v7, v8, (uint64_t)self->_identifier, 4);
    if (!v9)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@"), self->_identifier);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }
  v38 = (void *)MEMORY[0x24BDD17C8];
  v37 = objc_msgSend_messageBegin(self, a2, v2);
  v12 = objc_msgSend_messageEnd(self, v10, v11);
  v15 = objc_msgSend_chunked(self, v13, v14);
  v18 = objc_msgSend_shortRecord(self, v16, v17);
  objc_msgSend_identifier(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_length(v21, v22, v23);
  v27 = objc_msgSend_typeNameFormat(self, v25, v26);
  v30 = objc_msgSend_length(self->_type, v28, v29);
  v33 = objc_msgSend_length(self->_payload, v31, v32);
  objc_msgSend_stringWithFormat_(v38, v34, (uint64_t)CFSTR("{MB=%d,ME=%d,CF=%d,SR=%d,IL=%ld,TNF=%d,TypeLength=%ld,Type=%@,ID=%@,PayloadLength=%ld,Payload=%@}"), v37, v12, v15, v18, v24, v27, v30, v6, v9, v33, self->_payload);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  const char *v5;
  NSData *type;
  NSData *identifier;
  NSData *payload;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend_encodeInteger_forKey_(v10, v4, self->_firstOctet, CFSTR("firstOctet"));
  type = self->_type;
  if (type)
    objc_msgSend_encodeObject_forKey_(v10, v5, (uint64_t)type, CFSTR("type"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend_encodeObject_forKey_(v10, v5, (uint64_t)identifier, CFSTR("identifier"));
  payload = self->_payload;
  v9 = v10;
  if (payload)
  {
    objc_msgSend_encodeObject_forKey_(v10, v5, (uint64_t)payload, CFSTR("payload"));
    v9 = v10;
  }

}

- (STSNDEFRecord)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  STSNDEFRecord *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSData *type;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSData *identifier;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSData *payload;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)STSNDEFRecord;
  v6 = -[STSNDEFRecord init](&v20, sel_init);
  if (v6)
  {
    v6->_firstOctet = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("firstOctet"));
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("type"));
    v9 = objc_claimAutoreleasedReturnValue();
    type = v6->_type;
    v6->_type = (NSData *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("identifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSData *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("payload"));
    v17 = objc_claimAutoreleasedReturnValue();
    payload = v6->_payload;
    v6->_payload = (NSData *)v17;

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)ndefRecordsWithData:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if ((objc_msgSend__parseNDEFData_outRecords_(STSNDEFRecord, v5, (uint64_t)v3, v4) & 1) != 0)
  {
    v11 = (void *)objc_msgSend_copy(v4, v6, v7);
  }
  else
  {
    sub_20A02B230(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSNDEFRecord ndefRecordsWithData:]", 290, CFSTR("Invalid NDEF data: %@"), v8, v9, v10, (uint64_t)v3);
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_parseNDEFData:(id)a3 outRecords:(id)a4
{
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  char v15;
  const char *v16;
  const char *v17;
  unsigned int v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t maxLength;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  BOOL v46;
  unsigned __int8 v48;
  unsigned __int8 v49;
  unsigned int v50;
  __int16 v51;

  v5 = a4;
  objc_msgSend_inputStreamWithData_(MEMORY[0x24BDBCE90], v6, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_open(v7, v8, v9);
  if (objc_msgSend_hasBytesAvailable(v7, v10, v11))
  {
    while (1)
    {
      v51 = 0;
      v50 = 0;
      v49 = 0;
      if (objc_msgSend_read_maxLength_(v7, v12, (uint64_t)&v51 + 1, 1) != 1)
        break;
      v15 = HIBYTE(v51);
      if (objc_msgSend_read_maxLength_(v7, v14, (uint64_t)&v49, 1) != 1)
        break;
      if ((v15 & 0x10) != 0)
      {
        v48 = 0;
        if (objc_msgSend_read_maxLength_(v7, v16, (uint64_t)&v48, 1) != 1)
          goto LABEL_30;
        v18 = v48;
      }
      else
      {
        if (objc_msgSend_read_maxLength_(v7, v16, (uint64_t)&v50, 4) != 4)
          break;
        v18 = bswap32(v50);
      }
      v50 = v18;
      if ((v15 & 8) != 0 && objc_msgSend_read_maxLength_(v7, v17, (uint64_t)&v51, 1) != 1)
        break;
      if (v49)
      {
        objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v17, v49);
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v22 = objc_msgSend_mutableBytes(v19, v20, v21);
        maxLength = objc_msgSend_read_maxLength_(v7, v23, v22, v49);
        if (maxLength != v49)
          goto LABEL_27;
      }
      else
      {
        v19 = 0;
      }
      if ((_BYTE)v51)
      {
        objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v17, v51);
        v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v28 = objc_msgSend_mutableBytes(v25, v26, v27);
        v30 = objc_msgSend_read_maxLength_(v7, v29, v28, v51);
        if (v30 != v51)
          goto LABEL_28;
      }
      else
      {
        v25 = 0;
      }
      if (v50)
      {
        objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v17, v50);
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34 = objc_msgSend_mutableBytes(v31, v32, v33);
        v36 = objc_msgSend_read_maxLength_(v7, v35, v34, v50);
        if (v36 < 0 || v36 != v50)
          goto LABEL_29;
      }
      else
      {
        v31 = 0;
      }
      v37 = objc_opt_new();
      *(_BYTE *)(v37 + 8) = HIBYTE(v51);
      v38 = *(void **)(v37 + 24);
      *(_QWORD *)(v37 + 24) = v19;
      v39 = v19;

      v40 = *(void **)(v37 + 16);
      *(_QWORD *)(v37 + 16) = v25;
      v41 = v25;

      v42 = *(void **)(v37 + 32);
      *(_QWORD *)(v37 + 32) = v31;

      objc_msgSend_addObject_(v5, v43, v37);
      if ((objc_msgSend_hasBytesAvailable(v7, v44, v45) & 1) == 0)
        goto LABEL_25;
    }
    v19 = 0;
LABEL_27:
    v25 = 0;
LABEL_28:
    v31 = 0;
LABEL_29:

LABEL_30:
    v46 = 0;
  }
  else
  {
LABEL_25:
    objc_msgSend_close(v7, v12, v13);
    v46 = 1;
  }

  return v46;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isWiFiAwareConfigurationRecord
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  char isEqualToData;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)"application/vnd.wfa.nanapplication/vnd.bluetooth.le.oob", 23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 2)
  {
    objc_msgSend_type(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isBluetoothLEConfigurationRecord
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  char isEqualToData;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)"application/vnd.bluetooth.le.oob", 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 2)
  {
    objc_msgSend_type(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isNfcConfigurationRecord
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  char isEqualToData;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)&unk_20A030590, 17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(CFSTR("nfc"), v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_typeNameFormat(self, v6, v7) == 4)
  {
    objc_msgSend_type(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToData_(v10, v11, (uint64_t)v3))
    {
      objc_msgSend_identifier(self, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToData = objc_msgSend_isEqualToData_(v14, v15, (uint64_t)v5);

    }
    else
    {
      isEqualToData = 0;
    }

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isHandoverRequestRecord
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  char isEqualToData;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)"Hr", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 1)
  {
    objc_msgSend_type(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isHandoverSelectRecord
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  char isEqualToData;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)"Hs", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 1)
  {
    objc_msgSend_type(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isCollisionResolutionRecord
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  char isEqualToData;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)"cr", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 1)
  {
    objc_msgSend_type(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isAlternativeCarrierRecord
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  char isEqualToData;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)"ac", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 1)
  {
    objc_msgSend_type(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isHandoverSelectErrorRecord
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  char isEqualToData;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)"err", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_typeNameFormat(self, v4, v5) == 1)
  {
    objc_msgSend_type(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToData = objc_msgSend_isEqualToData_(v8, v9, (uint64_t)v3);

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isISO18013DeviceEngagementRecord
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  char isEqualToData;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)"mdoc", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v4, (uint64_t)"iso.org:18013:deviceengagement", 30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_typeNameFormat(self, v6, v7) == 4)
  {
    objc_msgSend_type(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToData_(v10, v11, (uint64_t)v5))
    {
      objc_msgSend_identifier(self, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToData = objc_msgSend_isEqualToData_(v14, v15, (uint64_t)v3);

    }
    else
    {
      isEqualToData = 0;
    }

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (BOOL)isISO18013ReaderEngagementRecord
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  char isEqualToData;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a2, (uint64_t)"mdocreader", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v4, (uint64_t)"iso.org:18013:readerengagement", 30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_typeNameFormat(self, v6, v7) == 4)
  {
    objc_msgSend_type(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToData_(v10, v11, (uint64_t)v5))
    {
      objc_msgSend_identifier(self, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToData = objc_msgSend_isEqualToData_(v14, v15, (uint64_t)v3);

    }
    else
    {
      isEqualToData = 0;
    }

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (unint64_t)getCarrierPowerStateFromAlternativeCarrierRecord
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  _BYTE *v15;

  if (!objc_msgSend_isAlternativeCarrierRecord(self, a2, v2))
    return 3;
  objc_msgSend_payload(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_length(v6, v7, v8);

  if (!v9)
    return 3;
  objc_msgSend_payload(self, v10, v11);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (_BYTE *)objc_msgSend_bytes(v12, v13, v14);

  return *v15 & 3;
}

- (id)getCarrierDataReferenceFromAlternativeCarrierRecord
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  unint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;

  if (objc_msgSend_isAlternativeCarrierRecord(self, a2, v2))
  {
    objc_msgSend_payload(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_length(v6, v7, v8);

    if (v9 >= 2)
    {
      objc_msgSend_payload(self, v10, v11);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = objc_msgSend_bytes(v12, v13, v14);

      v16 = *(char *)(v15 + 1);
      objc_msgSend_payload(self, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend_length(v19, v20, v21);

      if (v22 >= v16)
      {
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v23, v15 + 2, v16);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        return v26;
      }
      sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSNDEFRecord(ConnectionHandover) getCarrierDataReferenceFromAlternativeCarrierRecord]", 92, self, CFSTR("Invalid length"), v24, v25, v28);
    }
  }
  v26 = 0;
  return v26;
}

- (id)getAuxiliaryDataReferencesFromAlternativeCarrierRecord
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unsigned int v29;
  uint64_t v30;
  BOOL v31;
  unsigned __int8 *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  BOOL v37;
  void *v38;
  const char *v39;
  uint64_t v40;

  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isAlternativeCarrierRecord(self, v5, v6))
  {
    objc_msgSend_payload(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_length(v9, v10, v11);

    objc_msgSend_payload(self, v13, v14);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend_bytes(v15, v16, v17);

    if (v12 == 1)
    {
      v26 = 111;
    }
    else
    {
      v24 = *(unsigned __int8 *)(v18 + 1);
      v23 = v18 + 1;
      v22 = v24;
      v25 = v24 + 1;
      if (v12 - 1 != v25)
      {
        v29 = *(unsigned __int8 *)(v23 + v25);
        v30 = v12 - v22 - 3;
        if (*(_BYTE *)(v23 + v25))
          v31 = v12 - v22 == 3;
        else
          v31 = 1;
        if (!v31)
        {
          v32 = (unsigned __int8 *)(v23 + v25 + 1);
          v33 = 1;
          do
          {
            v36 = *v32;
            v34 = (uint64_t)(v32 + 1);
            v35 = v36;
            v37 = v30 - 1 >= (unint64_t)v36;
            v30 = v30 - 1 - v36;
            if (v37)
            {
              objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v19, v34, v35);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v4, v39, (uint64_t)v38);

            }
            else
            {
              sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSNDEFRecord(ConnectionHandover) getAuxiliaryDataReferencesFromAlternativeCarrierRecord]", 137, self, CFSTR("Invalid length"), v20, v21, v40);
            }
            if (v33 >= v29)
              break;
            v32 = (unsigned __int8 *)(v34 + v35);
            ++v33;
          }
          while (v30);
        }
        goto LABEL_8;
      }
      v26 = 120;
    }
    sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSNDEFRecord(ConnectionHandover) getAuxiliaryDataReferencesFromAlternativeCarrierRecord]", v26, self, CFSTR("Invalid length"), v20, v21, v40);
LABEL_8:
    v27 = v4;
    goto LABEL_9;
  }
  v27 = 0;
LABEL_9:

  return v27;
}

@end
