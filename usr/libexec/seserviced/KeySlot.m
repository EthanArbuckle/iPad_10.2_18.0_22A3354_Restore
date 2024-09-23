@implementation KeySlot

+ (id)emptySlot:(unsigned __int16)a3
{
  KeySlot *v4;

  v4 = objc_opt_new(KeySlot);
  v4->_number = a3;
  -[KeySlot resetToEmpty](v4, "resetToEmpty");
  return v4;
}

+ (id)withKeyData:(id)a3 state:(unsigned __int8)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  KeySlot *v11;
  uint64_t v12;
  uint64_t v13;
  NSData *keyIdentifier;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unsigned __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;

  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = DERParseSequenceSpecContent(v4, &off_100303F10);
  if ((_DWORD)v5)
  {
    v7 = v5;
    v8 = SESDefaultLogObject(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "base64"));
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      v25 = 1024;
      v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to parse keyData %@ %d", buf, 0x12u);

    }
    v11 = 0;
  }
  else
  {
    v11 = objc_opt_new(KeySlot);
    v11->_state = 2;
    v11->_number = bswap32(*(unsigned __int16 *)v18) >> 16;
    v11->_keyNumber = bswap32(*(_DWORD *)v19);
    v12 = DERDecodeData((const DERItem *)&v21, 4uLL);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    keyIdentifier = v11->_keyIdentifier;
    v11->_keyIdentifier = (NSData *)v13;

    v15 = *((_QWORD *)&v22 + 1) == 3 && *(unsigned __int8 *)(v22 + 2) == 255;
    v11->_synchronizable = v15;
    v11->_designation = 0;
  }

  return v11;
}

- (id)description
{
  uint64_t state;
  uint64_t number;
  uint64_t keyNumber;
  void *v6;
  void *v7;

  state = self->_state;
  number = self->_number;
  keyNumber = self->_keyNumber;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSData asHexString](self->_keyIdentifier, "asHexString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Slot: state %d number 0x%X keyNumber 0x%X keyIdentifier %@ synchronizable %d designation %d"), state, number, keyNumber, v6, self->_synchronizable, self->_designation));

  return v7;
}

- (void)resetToEmpty
{
  NSData *keyIdentifier;

  self->_state = 1;
  self->_keyNumber = -1;
  keyIdentifier = self->_keyIdentifier;
  self->_keyIdentifier = 0;

  self->_synchronizable = 0;
  self->_designation = 0;
}

- (void)resetLegacyToAvailable
{
  NSData *keyIdentifier;

  self->_state = 5;
  self->_keyNumber = -1;
  keyIdentifier = self->_keyIdentifier;
  self->_keyIdentifier = 0;

  self->_synchronizable = 0;
  self->_designation = 0;
}

- (void)didLoadKey:(id)a3
{
  void *v4;
  void *v5;
  NSData *v6;
  NSData *keyIdentifier;
  unsigned __int8 v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  self->_state = 2;
  self->_keyNumber = objc_msgSend(v12, "keyNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "publicKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sha256"));
  v6 = (NSData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subdataWithRange:", 0, 16));
  keyIdentifier = self->_keyIdentifier;
  self->_keyIdentifier = v6;

  if ((objc_msgSend(v12, "isExportedData") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = (void *)objc_opt_class(self);
    v10 = objc_msgSend(v12, "accessControlConstraintsItem");
    v8 = objc_msgSend(v9, "_acl:containsOperation:", v10, v11, "os");
  }
  self->_synchronizable = v8;

}

+ (BOOL)_acl:(id)a3 containsOperation:(const char *)a4
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  char v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  $BE749665CD263385F3F5ED554982D87D v17;
  uint8_t buf[4];
  int v19;

  v17 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100050BC8;
  v12[3] = &unk_100304C88;
  v12[5] = strlen(a4);
  v12[6] = a4;
  v12[4] = &v13;
  v5 = DERDecodeSequenceWithBlock((uint64_t)&v17, (uint64_t)v12);
  v7 = v5;
  if ((_DWORD)v5)
  {
    v8 = SESDefaultLogObject(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to parse ACL entries? %d", buf, 8u);
    }

  }
  v10 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (unsigned)number
{
  return self->_number;
}

- (unsigned)keyNumber
{
  return self->_keyNumber;
}

- (NSData)keyIdentifier
{
  return self->_keyIdentifier;
}

- (BOOL)synchronizable
{
  return self->_synchronizable;
}

- (int64_t)designation
{
  return self->_designation;
}

- (void)setDesignation:(int64_t)a3
{
  self->_designation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end
