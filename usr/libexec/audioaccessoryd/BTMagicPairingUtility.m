@implementation BTMagicPairingUtility

- (id)cipherBluetoothAddress:(id)a3
{
  _WORD *v3;
  uint64_t v4;
  uint64_t i;
  _BYTE v7[6];
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;

  v11 = 0;
  v10 = 0;
  v3 = objc_msgSend(objc_retainAutorelease(a3), "bytes");
  *(_DWORD *)v7 = *(_DWORD *)v3;
  *(_WORD *)&v7[4] = v3[2];
  v9 = *(_WORD *)&v7[4];
  v8 = *(_DWORD *)v7;
  v4 = 6;
  for (i = 5; i != -1; --i)
    *((_BYTE *)&v8 + v4++) = v7[i];
  v12 = *(_DWORD *)&v7[1] ^ *(_DWORD *)v7;
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v8, 16));
}

- (id)magicPairingEncryptDataWithKey:(id)a3 payload:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  int v13;
  os_log_t v14;
  NSObject *v15;
  _DWORD v17[2];
  _QWORD v18[2];

  v5 = a4;
  v6 = a3;
  v7 = ccaes_ecb_encrypt_mode();
  v18[0] = 0;
  v18[1] = 0;
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "bytes");

  v10 = objc_retainAutorelease(v5);
  v11 = objc_msgSend(v10, "bytes");

  v12 = ccecb_one_shot(v7, 16, v9, 1, v11, v18);
  if (!v12)
    return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v18, 16));
  v13 = v12;
  v14 = sub_1000681B8("BTMagicPairingUtility");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109120;
    v17[1] = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to encrypt key with error code: %d", (uint8_t *)v17, 8u);
  }

  return 0;
}

- (id)magicPairingDecryptDataWithKey:(id)a3 payload:(id)a4 length:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  int v15;
  os_log_t v16;
  NSObject *v17;
  _DWORD v19[2];
  _QWORD v20[2];

  v7 = a4;
  v8 = a3;
  v9 = ccaes_ecb_decrypt_mode();
  v20[0] = 0;
  v20[1] = 0;
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "bytes");

  v12 = objc_retainAutorelease(v7);
  v13 = objc_msgSend(v12, "bytes");

  v14 = ccecb_one_shot(v9, a5, v11, 1, v13, v20);
  if (!v14)
    return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v20, a5));
  v15 = v14;
  v16 = sub_1000681B8("BTMagicPairingUtility");
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109120;
    v19[1] = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to decrypt key with error code: %d", (uint8_t *)v19, 8u);
  }

  return 0;
}

@end
