@implementation SKAStatusEncryptionManager

- (SKAStatusEncryptionManager)initWithDatabaseManager:(id)a3 invitationManager:(id)a4
{
  id v7;
  id v8;
  SKAStatusEncryptionManager *v9;
  SKAStatusEncryptionManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKAStatusEncryptionManager;
  v9 = -[SKAStatusEncryptionManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databaseManager, a3);
    objc_storeStrong((id *)&v10->_invitationManager, a4);
  }

  return v10;
}

- (id)encodeStatusPayload:(id)a3 statusUniqueIdentifier:(id)a4 dateCreated:(id)a5 currentServerTime:(id)a6 channel:(id)a7
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v12 = (objc_class *)MEMORY[0x24BDBCED8];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(v12);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("i"));

  objc_msgSend(v14, "timeIntervalSince1970");
  v20 = v19;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("p"));

  objc_msgSend(v15, "timeIntervalSince1970");
  v23 = v22;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("c"));

  objc_msgSend(v17, "payloadData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKAStatusEncryptionManager _encryptPayload:channel:](self, "_encryptPayload:channel:", v25, v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "encryptedMessage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "base64EncodedStringWithOptions:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, CFSTR("e"));
  v29 = objc_msgSend(v26, "index");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v30, CFSTR("r"));

  objc_msgSend(v26, "signature");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "base64EncodedStringWithOptions:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v32, CFSTR("s"));
  -[SKAStatusEncryptionManager _serializeDictionaryAsBinaryPlist:](self, "_serializeDictionaryAsBinaryPlist:", v18);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (void)encodeStatusPayloadForProvisioning:(id)a3 statusUniqueIdentifier:(id)a4 dateCreated:(id)a5 currentServerTime:(id)a6 channel:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  SharedChannelProvisionOffGridPacket *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  int v37;
  int v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  SharedChannelProvisionOffGridPacket *v43;
  void *v44;
  uint8_t buf[4];
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  objc_msgSend(v12, "statusPayload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAStatusEncryptionManager encodeStatusPayload:statusUniqueIdentifier:dateCreated:currentServerTime:channel:](self, "encodeStatusPayload:statusUniqueIdentifier:dateCreated:currentServerTime:channel:", v17, v16, v15, v14, v13);
  v18 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE50], "__imDataWithRandomBytes:", 32);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(SharedChannelProvisionOffGridPacket);
  v44 = (void *)v18;
  -[SharedChannelProvisionOffGridPacket setPublishPayload:](v20, "setPublishPayload:", v18);
  v21 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(v13, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(v21, "initWithBase64EncodedString:options:", v22, 0);
  -[SharedChannelProvisionOffGridPacket setChannelId:](v20, "setChannelId:", v23);

  -[SharedChannelProvisionOffGridPacket setChannelTopic:](v20, "setChannelTopic:", CFSTR("com.apple.icloud.presence.mode.status"));
  -[SharedChannelProvisionOffGridPacket setCommitmentSalt:](v20, "setCommitmentSalt:", v19);
  objc_msgSend(MEMORY[0x24BDBCE50], "__imDataWithRandomBytes:", 12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v20;
  -[SharedChannelProvisionOffGridPacket data](v20, "data");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "appendData:", v27);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", objc_msgSend(v26, "length"));
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 16);
  objc_msgSend(MEMORY[0x24BDBCE50], "__imDataWithRandomBytes:", 16);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v30, "bytes");
  objc_msgSend(v30, "length");
  v31 = objc_retainAutorelease(v25);
  objc_msgSend(v31, "bytes");
  v32 = objc_retainAutorelease(v26);
  objc_msgSend(v32, "bytes");
  v33 = objc_msgSend(v32, "length");
  v34 = objc_retainAutorelease(v28);
  v35 = objc_msgSend(v34, "mutableBytes");
  v36 = objc_retainAutorelease(v29);
  v42 = objc_msgSend(v36, "mutableBytes");
  v41 = v35;
  v37 = CCCryptorGCMOneshotEncrypt();
  if (v37)
  {
    v38 = v37;
    v39 = v31;
    +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger", v33, v41, v42, 16);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v46 = v38;
      _os_log_impl(&dword_2188DF000, v40, OS_LOG_TYPE_DEFAULT, "CCCryptorGCMOneshotEncrypt failed with result %d.", buf, 8u);
    }

  }
  else
  {
    objc_msgSend(v12, "setCommitmentSalt:", v19, v33, v35, v42, 16);
    objc_msgSend(v12, "setDecryptionKey:", v30);
    objc_msgSend(v12, "setInitializationVector:", v31);
    objc_msgSend(v34, "appendData:", v36);
    objc_msgSend(v12, "setEncryptedStatusPayload:", v34);
    v39 = v31;
  }

}

- (id)_encryptPayload:(id)a3 channel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  SKAInvitationManaging *invitationManager;
  void *v15;
  int v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  SKADatabaseManaging *databaseManager;
  void *v22;
  void *v23;
  id v25;
  id v26;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "currentOutgoingRatchet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
LABEL_2:
    v25 = 0;
    objc_msgSend(v8, "sealStatus:authenticating:error:", v6, 0, &v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v25;
    +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SKAStatusEncryptionManager _encryptPayload:channel:].cold.2();
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Message encrypted successfully", buf, 2u);
    }

    goto LABEL_21;
  }
  +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Channel does not have a current outgoing ratchet, rolling encryption key to generate a new one.", buf, 2u);
  }

  invitationManager = self->_invitationManager;
  objc_msgSend(v7, "statusType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v16 = -[SKAInvitationManaging rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:error:](invitationManager, "rollEncryptionKeyForPersonalChannelWithStatusTypeIdentifier:error:", v15, &v26);
  v17 = v26;

  +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v19, OS_LOG_TYPE_DEFAULT, "Encryption key rolled successfully, fetching new key", buf, 2u);
    }

    v20 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
    databaseManager = self->_databaseManager;
    objc_msgSend(v7, "statusType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKADatabaseManaging existingPersonalChannelForStatusTypeIdentifier:databaseContext:](databaseManager, "existingPersonalChannelForStatusTypeIdentifier:databaseContext:", v22, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "currentOutgoingRatchet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_2;
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SKAStatusEncryptionManager _encryptPayload:channel:].cold.3();

  }
  +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[SKAStatusEncryptionManager _encryptPayload:channel:].cold.1();
  v8 = 0;
  v9 = 0;
LABEL_21:

  return v9;
}

- (id)_decryptPayload:(id)a3 withRatchetIndex:(unsigned __int16)a4 signatureData:(id)a5 channel:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  uint64_t v12;
  SKADatabaseManaging *databaseManager;
  _UNKNOWN **v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  SKADecryptedStatusPayload *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id obj;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  uint64_t v63;
  uint64_t v64;

  v8 = a4;
  v64 = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  v10 = a5;
  v11 = a6;
  LODWORD(a6) = objc_msgSend(v11, "isPersonal");
  v12 = -[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
  databaseManager = self->_databaseManager;
  v14 = &off_24D975000;
  v46 = (void *)v12;
  v49 = v11;
  if ((_DWORD)a6)
  {
    -[SKADatabaseManaging generatedEncryptionKeysForPersonalChannel:databaseContext:](databaseManager, "generatedEncryptionKeysForPersonalChannel:databaseContext:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v63 = objc_msgSend(v15, "count");
      _os_log_impl(&dword_2188DF000, v16, OS_LOG_TYPE_DEFAULT, "Attempting to decrypt incoming status on personal channel using keys from %ld outgoing ratchets.", buf, 0xCu);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v15;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v57;
LABEL_6:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v57 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v20);
        objc_msgSend(v21, "incomingRatchet", v46);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKAStatusEncryptionManager _decryptPayloadData:withIncomingRatchet:withRatchetIndex:signatureData:](self, "_decryptPayloadData:withIncomingRatchet:withRatchetIndex:signatureData:", v51, v22, v8, v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14[313], "logger");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (v23)
          break;
        if (v25)
        {
          *(_DWORD *)buf = 138412290;
          v63 = (uint64_t)v21;
          _os_log_impl(&dword_2188DF000, v24, OS_LOG_TYPE_DEFAULT, "Status payload not decrypteded from generatedKey: %@", buf, 0xCu);
        }

        ++v20;
        v14 = &off_24D975000;
        if (v18 == v20)
        {
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
          if (v18)
            goto LABEL_6;
          goto LABEL_14;
        }
      }
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        v63 = (uint64_t)v21;
        _os_log_impl(&dword_2188DF000, v24, OS_LOG_TYPE_DEFAULT, "Status payload successfully decrypteded from generatedKey: %@", buf, 0xCu);
      }

      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1090]), "initWithData:", v23);
      v38 = -[SKADecryptedStatusPayload initWithStatusPayload:invitation:]([SKADecryptedStatusPayload alloc], "initWithStatusPayload:invitation:", v37, 0);

      v14 = &off_24D975000;
      if (v38)
        goto LABEL_36;
    }
    else
    {
LABEL_14:

    }
    objc_msgSend(v14[313], "logger", v46);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v47;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[SKAStatusEncryptionManager _decryptPayload:withRatchetIndex:signatureData:channel:].cold.1();
  }
  else
  {
    -[SKADatabaseManaging receivedInvitationsForChannel:databaseContext:](databaseManager, "receivedInvitationsForChannel:databaseContext:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v63 = objc_msgSend(v26, "count");
      _os_log_impl(&dword_2188DF000, v27, OS_LOG_TYPE_DEFAULT, "Attempting to decrypt incoming status on non personal channel using incoming ratchet state from %ld received invitations.", buf, 0xCu);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v26;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v53;
LABEL_19:
      v31 = 0;
      while (1)
      {
        if (*(_QWORD *)v53 != v30)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v31);
        objc_msgSend(v32, "incomingRatchet", v46);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKAStatusEncryptionManager _decryptPayloadData:withIncomingRatchet:withRatchetIndex:signatureData:](self, "_decryptPayloadData:withIncomingRatchet:withRatchetIndex:signatureData:", v51, v33, v8, v10);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
        if (v34)
          break;
        if (v36)
        {
          *(_DWORD *)buf = 138412290;
          v63 = (uint64_t)v32;
          _os_log_impl(&dword_2188DF000, v35, OS_LOG_TYPE_DEFAULT, "Status payload not decrypted from invitation: %@", buf, 0xCu);
        }

        ++v31;
        v14 = &off_24D975000;
        if (v29 == v31)
        {
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
          if (v29)
            goto LABEL_19;
          goto LABEL_27;
        }
      }
      if (v36)
      {
        *(_DWORD *)buf = 138412290;
        v63 = (uint64_t)v32;
        _os_log_impl(&dword_2188DF000, v35, OS_LOG_TYPE_DEFAULT, "Status payload successfully decrypteded from invitation: %@", buf, 0xCu);
      }

      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1090]), "initWithData:", v34);
      objc_msgSend(obj, "firstObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[SKADecryptedStatusPayload initWithStatusPayload:invitation:]([SKADecryptedStatusPayload alloc], "initWithStatusPayload:invitation:", v41, v42);

      v14 = &off_24D975000;
      if (v38)
      {
LABEL_36:
        v40 = v46;
        v43 = v49;
        goto LABEL_40;
      }
    }
    else
    {
LABEL_27:

    }
    objc_msgSend(v14[313], "logger", v46);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v48;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[SKAStatusEncryptionManager _decryptPayload:withRatchetIndex:signatureData:channel:].cold.2();
  }
  v43 = v49;

  v38 = 0;
LABEL_40:

  objc_msgSend(v14[313], "logger");
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v63 = (uint64_t)v38;
    _os_log_impl(&dword_2188DF000, v44, OS_LOG_TYPE_DEFAULT, "Decrypteded payload: %@", buf, 0xCu);
  }

  return v38;
}

- (id)_decryptPayloadData:(id)a3 withIncomingRatchet:(id)a4 withRatchetIndex:(unsigned __int16)a5 signatureData:(id)a6
{
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v10;
  uint8_t v11[8];
  id v12;

  v12 = 0;
  objc_msgSend(a4, "unsealStatusWithIndex:encryptedMessage:authenticating:signature:error:", a5, a3, 0, a6, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v7)
  {
    +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SKAStatusEncryptionManager _decryptPayloadData:withIncomingRatchet:withRatchetIndex:signatureData:].cold.2();
  }
  else
  {
    +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Status payload successfully decrypted", v11, 2u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[SKAStatusEncryptionManager _decryptPayloadData:withIncomingRatchet:withRatchetIndex:signatureData:].cold.1();
    }
  }

  return v6;
}

- (id)extractEnvelopeFromStatusEnvelopeData:(id)a3
{
  void *v3;
  SKAStatusUnencryptedEnvelope *v4;

  -[SKAStatusEncryptionManager _deserializeBinaryPlistDictionaryData:](self, "_deserializeBinaryPlistDictionaryData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[SKAStatusUnencryptedEnvelope initWithEnvelopeDictionary:]([SKAStatusUnencryptedEnvelope alloc], "initWithEnvelopeDictionary:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)decryptStatusPayloadFromStatusEnvelopeData:(id)a3 channel:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v17;
  uint8_t v18[16];

  v6 = a4;
  if (a3)
  {
    -[SKAStatusEncryptionManager _deserializeBinaryPlistDictionaryData:](self, "_deserializeBinaryPlistDictionaryData:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SKAStatusEncryptionManager decryptStatusPayloadFromStatusEnvelopeData:channel:].cold.1();
      v15 = 0;
      goto LABEL_25;
    }
    objc_msgSend(v7, "ska_dataFrombase64EncodedStringForKey:", CFSTR("e"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SKAStatusEncryptionManager decryptStatusPayloadFromStatusEnvelopeData:channel:].cold.2();
      v15 = 0;
      goto LABEL_24;
    }
    objc_msgSend(v8, "ska_dataFrombase64EncodedStringForKey:", CFSTR("s"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SKAStatusEncryptionManager decryptStatusPayloadFromStatusEnvelopeData:channel:].cold.3();
      v15 = 0;
      goto LABEL_23;
    }
    objc_msgSend(v8, "ska_numberForKey:", CFSTR("r"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = -[NSObject integerValue](v11, "integerValue");
      if (v13 < 0x10000)
      {
        -[SKAStatusEncryptionManager _decryptPayload:withRatchetIndex:signatureData:channel:](self, "_decryptPayload:withRatchetIndex:signatureData:channel:", v9, (unsigned __int16)v13, v10, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
        v17 = objc_claimAutoreleasedReturnValue();
        v14 = v17;
        if (v15)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v18 = 0;
            _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Successfully decrypted status payload", v18, 2u);
          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          -[SKAStatusEncryptionManager decryptStatusPayloadFromStatusEnvelopeData:channel:].cold.6();
        }
        goto LABEL_22;
      }
      +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SKAStatusEncryptionManager decryptStatusPayloadFromStatusEnvelopeData:channel:].cold.5();
    }
    else
    {
      +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SKAStatusEncryptionManager decryptStatusPayloadFromStatusEnvelopeData:channel:].cold.4();
    }
    v15 = 0;
LABEL_22:

LABEL_23:
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  v15 = 0;
LABEL_26:

  return v15;
}

- (id)encryptionValidationTokenForChannel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;

  -[SKAStatusEncryptionManager _mostRecentIncomingRatchetForChannel:](self, "_mostRecentIncomingRatchetForChannel:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "signingKeyIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "ska_hexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (v6 >= 4)
    v7 = 4;
  else
    v7 = v6;
  objc_msgSend(v5, "substringToIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_mostRecentIncomingRatchetForChannel:(id)a3
{
  id v4;
  int v5;
  void *v6;
  SKADatabaseManaging *databaseManager;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "isPersonal");
  v6 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
  databaseManager = self->_databaseManager;
  if (!v5)
  {
    -[SKADatabaseManaging receivedInvitationsForChannel:databaseContext:](databaseManager, "receivedInvitationsForChannel:databaseContext:", v4, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v36 = objc_msgSend(v16, "count");
      _os_log_impl(&dword_2188DF000, v17, OS_LOG_TYPE_DEFAULT, "Finding most recent incoming ratchet for non personal channel using incoming ratchet state from %ld received invitations.", buf, 0xCu);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v16;
    v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
LABEL_17:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v21), "incomingRatchet", (_QWORD)v25);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
          goto LABEL_24;
        if (v19 == ++v21)
        {
          v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v19)
            goto LABEL_17;
          break;
        }
      }
    }
LABEL_23:
    v22 = 0;
    goto LABEL_25;
  }
  -[SKADatabaseManaging generatedEncryptionKeysForPersonalChannel:databaseContext:](databaseManager, "generatedEncryptionKeysForPersonalChannel:databaseContext:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v36 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Finding most recent incoming ratchet for personal channel from %ld outgoing ratchets.", buf, 0xCu);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (!v11)
    goto LABEL_23;
  v12 = v11;
  v13 = *(_QWORD *)v30;
LABEL_6:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v30 != v13)
      objc_enumerationMutation(v10);
    objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v14), "incomingRatchet");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
      break;
    if (v12 == ++v14)
    {
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v12)
        goto LABEL_6;
      goto LABEL_23;
    }
  }
LABEL_24:
  v22 = (void *)v15;
LABEL_25:

  if (!v22)
  {
    +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[SKAStatusEncryptionManager _mostRecentIncomingRatchetForChannel:].cold.1();

  }
  return v22;
}

- (id)_serializeDictionaryAsBinaryPlist:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  if (a3)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (v4)
    {
      +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SKAStatusEncryptionManager _serializeDictionaryAsBinaryPlist:].cold.1();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_deserializeBinaryPlistDictionaryData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  SharedChannelPublishPayload *v8;
  SharedChannelPublishPayload *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  id v17;

  v3 = a3;
  if (v3)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v3, 0, 0, &v17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v17;
    if (v5)
    {
      v6 = v5;
      +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[SKAStatusEncryptionManager _deserializeBinaryPlistDictionaryData:].cold.3();

      v8 = -[SharedChannelPublishPayload initWithData:]([SharedChannelPublishPayload alloc], "initWithData:", v3);
      v9 = v8;
      if (v8
        && (-[SharedChannelPublishPayload publishPayloadContent](v8, "publishPayloadContent"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v10,
            v10))
      {

        v11 = (void *)MEMORY[0x24BDD1770];
        -[SharedChannelPublishPayload publishPayloadContent](v9, "publishPayloadContent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        objc_msgSend(v11, "propertyListWithData:options:format:error:", v12, 0, 0, &v16);
        v13 = objc_claimAutoreleasedReturnValue();
        v6 = v16;

        if (!v6)
        {
LABEL_15:

          v4 = (void *)v13;
          goto LABEL_16;
        }
        +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[SKAStatusEncryptionManager _deserializeBinaryPlistDictionaryData:].cold.2(v9, (uint64_t)v6, v14);
      }
      else
      {
        +[SKAStatusEncryptionManager logger](SKAStatusEncryptionManager, "logger");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[SKAStatusEncryptionManager _deserializeBinaryPlistDictionaryData:].cold.1();
        v13 = (uint64_t)v4;
      }

      goto LABEL_15;
    }
  }
  else
  {
    v4 = 0;
  }
LABEL_16:

  return v4;
}

+ (id)logger
{
  if (logger_onceToken != -1)
    dispatch_once(&logger_onceToken, &__block_literal_global);
  return (id)logger__logger;
}

void __36__SKAStatusEncryptionManager_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAStatusEncryptionManager");
  v1 = (void *)logger__logger;
  logger__logger = (uint64_t)v0;

}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (SKAInvitationManaging)invitationManager
{
  return self->_invitationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

- (void)_encryptPayload:channel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Unable to encrypt status due to nil outgoing encryption key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_encryptPayload:channel:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error encrypting status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_encryptPayload:channel:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Key roll failed, unable to encrypt status", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_decryptPayload:withRatchetIndex:signatureData:channel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Status payload failed to decrypt with all known generated encryption keys.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_decryptPayload:withRatchetIndex:signatureData:channel:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Status payload failed to decrypt with all known invitations.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_decryptPayloadData:withIncomingRatchet:withRatchetIndex:signatureData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Status payload decypted to nil data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_decryptPayloadData:withIncomingRatchet:withRatchetIndex:signatureData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Status payload failed to decrypt with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)decryptStatusPayloadFromStatusEnvelopeData:channel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Extracting status payload, but envelope dictionary is not deserializable. Returning nil payload.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)decryptStatusPayloadFromStatusEnvelopeData:channel:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Extracting status payload, but encrypted payload is missing, is this an empty status update, or a malformed status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)decryptStatusPayloadFromStatusEnvelopeData:channel:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to extract status payload, signature is missing: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)decryptStatusPayloadFromStatusEnvelopeData:channel:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to extract status payload, ratchet index is missing: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)decryptStatusPayloadFromStatusEnvelopeData:channel:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Failed to extract status payload, ratchet index is an invalid number: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)decryptStatusPayloadFromStatusEnvelopeData:channel:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Failed to decrypt status payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_mostRecentIncomingRatchetForChannel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Unable to find most recent incoming ratchet for channel: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_serializeDictionaryAsBinaryPlist:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error serializing status envelope dictionary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_deserializeBinaryPlistDictionaryData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error deserializing status envelope data from protobuf content %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_deserializeBinaryPlistDictionaryData:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "publishPayloadContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_2188DF000, a3, OS_LOG_TYPE_ERROR, "Error deserializing status envelope data as dictionary from proto data: %@ with error %@", v6, 0x16u);

}

- (void)_deserializeBinaryPlistDictionaryData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error deserializing status envelope data as dictionary, will attempt as proto data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
