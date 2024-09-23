@implementation DataStreamMessageCoder

+ (BOOL)_decryptEncryptedOPACKFrame:(id)a3 sessionEncryption:(id)a4 receivedHeader:(id *)a5 receivedPayload:(id *)a6 error:(id *)a7
{
  id v11;
  id v12;
  BOOL v13;
  id v14;
  char *v15;
  char *v16;
  void *v17;
  id v18;
  void *v19;
  id v21;

  v11 = a3;
  v12 = a4;
  if ((unint64_t)objc_msgSend(v11, "length") > 0x13)
  {
    v14 = objc_retainAutorelease(v11);
    v15 = (char *)objc_msgSend(v14, "bytes");
    v16 = (char *)objc_msgSend(v14, "length");
    v21 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "decrypt:length:additionalAuthData:additionalAuthDataLength:authTagData:authTagDataLength:counterData:counterDataLength:error:", v15 + 4, v16 - 28, v15, 4, &v16[(_QWORD)v15 - 24], 16, &v16[(_QWORD)v15 - 8], 8, &v21));
    v18 = v21;
    v19 = v18;
    if (v18)
    {
      v13 = 0;
      if (a7)
        *a7 = objc_retainAutorelease(v18);
    }
    else
    {
      v13 = +[DataStreamMessageCoder _decodeOPACKFrame:receivedHeader:receivedPayload:error:](DataStreamMessageCoder, "_decodeOPACKFrame:receivedHeader:receivedPayload:error:", v17, a5, a6, a7);
    }

  }
  else
  {
    v13 = 0;
    if (a7)
      *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 26, 0));
  }

  return v13;
}

+ (BOOL)_decodeOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6
{
  id v9;
  unsigned __int8 *v10;
  char *v11;
  unint64_t v12;
  BOOL v13;
  char *v14;
  BOOL v15;
  unsigned __int8 *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  unsigned int v28;

  v9 = objc_retainAutorelease(a3);
  v10 = (unsigned __int8 *)objc_msgSend(v9, "bytes");
  v11 = (char *)objc_msgSend(v9, "length");

  v28 = 0;
  if (v11)
  {
    v12 = *v10;
    v13 = (unint64_t)(v11 - 1) >= v12;
    v14 = &v11[-v12 - 1];
    if (v13)
    {
      v16 = v10 + 1;
      v18 = (void *)OPACKDecodeBytes(v10 + 1, *v10, 8, &v28);
      if (v28)
      {
        if (a6)
        {
          v19 = sub_100040DDC(v28);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
LABEL_16:
          v15 = 0;
          *a6 = v20;
LABEL_30:

          return v15;
        }
        goto LABEL_17;
      }
      if (!v18 || (v21 = objc_opt_class(NSDictionary, v17), (objc_opt_isKindOfClass(v18, v21) & 1) == 0))
      {
        if (a6)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 27, 0));
          goto LABEL_16;
        }
LABEL_17:
        v15 = 0;
        goto LABEL_30;
      }
      v23 = (void *)OPACKDecodeBytes(&v16[v12], v14, 8, &v28);
      if (v28)
      {
        if (a6)
        {
          v24 = sub_100040DDC(v28);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
LABEL_27:
          v15 = 0;
          *a6 = v25;
LABEL_29:

          goto LABEL_30;
        }
      }
      else
      {
        if (v23)
        {
          v26 = objc_opt_class(NSDictionary, v22);
          if ((objc_opt_isKindOfClass(v23, v26) & 1) != 0)
          {
            if (a4)
              *a4 = objc_retainAutorelease(v18);
            if (a5)
              *a5 = objc_retainAutorelease(v23);
            v15 = 1;
            goto LABEL_29;
          }
        }
        if (a6)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 27, 0));
          goto LABEL_27;
        }
      }
      v15 = 0;
      goto LABEL_29;
    }
  }
  v15 = 0;
  if (a6)
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 26, 0));
  return v15;
}

+ (BOOL)_unpackUnencryptedOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6
{
  id v9;
  BOOL v10;
  void *v11;

  v9 = a3;
  if ((unint64_t)objc_msgSend(v9, "length") > 3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subdataWithRange:", 4, (char *)objc_msgSend(v9, "length") - 4));
    v10 = +[DataStreamMessageCoder _decodeOPACKFrame:receivedHeader:receivedPayload:error:](DataStreamMessageCoder, "_decodeOPACKFrame:receivedHeader:receivedPayload:error:", v11, a4, a5, a6);

  }
  else
  {
    v10 = 0;
    if (a6)
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 26, 0));
  }

  return v10;
}

+ (id)_encodeOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  char *v15;
  void *v16;
  id v17;
  char v19;
  unsigned int v20;

  v7 = a4;
  v20 = 0;
  v8 = (void *)OPACKEncoderCreateData(a3, 0, &v20);
  if (v20)
    v9 = 1;
  else
    v9 = v8 == 0;
  if (!v9)
  {
    v12 = OPACKEncoderCreateData(v7, 0, &v20);
    v13 = (void *)v12;
    if (v20 || !v12)
    {
      if (a5)
      {
        v17 = sub_100040DDC(v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v17);
        goto LABEL_15;
      }
    }
    else
    {
      v14 = (unint64_t)objc_msgSend(v8, "length");
      v15 = (char *)objc_msgSend(v13, "length");
      if (v14 < 0x100)
      {
        v19 = v14;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", &v15[v14 + 1]));
        objc_msgSend(v11, "appendBytes:length:", &v19, 1);
        objc_msgSend(v11, "appendData:", v8);
        objc_msgSend(v11, "appendData:", v13);
        goto LABEL_19;
      }
      if (a5)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 27, 0));
LABEL_15:
        v11 = 0;
        *a5 = v16;
LABEL_19:

        goto LABEL_20;
      }
    }
    v11 = 0;
    goto LABEL_19;
  }
  if (a5)
  {
    v10 = sub_100040DDC(v20);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v10);
  }
  else
  {
    v11 = 0;
  }
LABEL_20:

  return v11;
}

+ (id)_encryptEncryptedOPACKHeader:(id)a3 payload:(id)a4 sessionEncryption:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE v18[4];

  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DataStreamMessageCoder _encodeOPACKHeader:payload:error:](DataStreamMessageCoder, "_encodeOPACKHeader:payload:error:", a3, a4, a6));
  v11 = v10;
  if (!v10)
    goto LABEL_5;
  v12 = (char *)objc_msgSend(v10, "length");
  v13 = v12 + 20;
  if ((unint64_t)(v12 + 20) < 0x100000)
  {
    v18[0] = 1;
    v18[1] = BYTE2(v12);
    v18[2] = BYTE1(v12);
    v18[3] = (_BYTE)v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v18, 4));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "encrypt:additionalAuthenticatedData:", v11, v15));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", v13));
    objc_msgSend(v14, "appendBytes:length:", v18, 4);
    objc_msgSend(v14, "appendData:", v16);

    goto LABEL_7;
  }
  if (a6)
  {
    v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 27, 0));
  }
  else
  {
LABEL_5:
    v14 = 0;
  }
LABEL_7:

  return v14;
}

+ (id)_buildUnencryptedOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _BYTE v11[4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DataStreamMessageCoder _encodeOPACKHeader:payload:error:](DataStreamMessageCoder, "_encodeOPACKHeader:payload:error:", a3, a4));
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  v8 = objc_msgSend(v6, "length");
  if ((unint64_t)v8 + 4 < 0x100000)
  {
    v11[0] = 3;
    v11[1] = BYTE2(v8);
    v11[2] = BYTE1(v8);
    v11[3] = (_BYTE)v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:"));
    objc_msgSend(v9, "appendBytes:length:", v11, 4);
    objc_msgSend(v9, "appendData:", v7);
    goto LABEL_7;
  }
  if (a5)
  {
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 27, 0));
  }
  else
  {
LABEL_5:
    v9 = 0;
  }
LABEL_7:

  return v9;
}

+ (BOOL)decryptEncryptedOPACKFrame:(id)a3 sessionEncryption:(id)a4 receivedHeader:(id *)a5 receivedPayload:(id *)a6 error:(id *)a7
{
  return +[DataStreamMessageCoder _decryptEncryptedOPACKFrame:sessionEncryption:receivedHeader:receivedPayload:error:](DataStreamMessageCoder, "_decryptEncryptedOPACKFrame:sessionEncryption:receivedHeader:receivedPayload:error:", a3, a4, a5, a6, a7);
}

+ (id)encryptEncryptedOPACKHeader:(id)a3 payload:(id)a4 sessionEncryption:(id)a5 error:(id *)a6
{
  return +[DataStreamMessageCoder _encryptEncryptedOPACKHeader:payload:sessionEncryption:error:](DataStreamMessageCoder, "_encryptEncryptedOPACKHeader:payload:sessionEncryption:error:", a3, a4, a5, a6);
}

+ (BOOL)unpackUnencryptedOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6
{
  return +[DataStreamMessageCoder _unpackUnencryptedOPACKFrame:receivedHeader:receivedPayload:error:](DataStreamMessageCoder, "_unpackUnencryptedOPACKFrame:receivedHeader:receivedPayload:error:", a3, a4, a5, a6);
}

+ (id)buildUnencryptedOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5
{
  return +[DataStreamMessageCoder _buildUnencryptedOPACKHeader:payload:error:](DataStreamMessageCoder, "_buildUnencryptedOPACKHeader:payload:error:", a3, a4, a5);
}

+ (BOOL)readHeaderFromPartialData:(id)a3 frameType:(unsigned __int8 *)a4 payloadLength:(unint64_t *)a5
{
  BOOL v8;
  NSObject *subrange;
  dispatch_data_t v10;
  size_t v12;
  void *buffer_ptr;

  if (dispatch_data_get_size((dispatch_data_t)a3) < 4)
    return 0;
  subrange = dispatch_data_create_subrange((dispatch_data_t)a3, 0, 4uLL);
  v12 = 0;
  buffer_ptr = 0;
  v10 = dispatch_data_create_map(subrange, (const void **)&buffer_ptr, &v12);

  v8 = v10 != 0;
  if (v10)
  {
    if (a4)
      *a4 = *(_BYTE *)buffer_ptr;
    if (a5)
      *a5 = ((unint64_t)*((unsigned __int8 *)buffer_ptr + 1) << 16) | ((unint64_t)*((unsigned __int8 *)buffer_ptr
                                                                                                + 2) << 8) | *((unsigned __int8 *)buffer_ptr + 3);
  }

  return v8;
}

+ (BOOL)readHeaderFromPartialData:(const char *)a3 length:(unint64_t)a4 frameType:(unsigned __int8 *)a5 payloadLength:(unint64_t *)a6
{
  if (a4 >= 4)
  {
    if (a5)
      *a5 = *a3;
    if (a6)
      *a6 = ((unint64_t)*((unsigned __int8 *)a3 + 1) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 2) << 8) | *((unsigned __int8 *)a3 + 3);
  }
  return a4 > 3;
}

+ (id)eventHeaderForProtocol:(id)a3 topic:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v9[0] = CFSTR("protocol");
  v9[1] = CFSTR("event");
  v10[0] = a3;
  v10[1] = a4;
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  return v7;
}

+ (id)requestHeaderForProtocol:(id)a3 topic:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];

  v12[0] = CFSTR("protocol");
  v12[1] = CFSTR("request");
  v13[0] = a3;
  v13[1] = a4;
  v12[2] = CFSTR("id");
  v13[2] = a5;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));

  return v10;
}

+ (id)responseHeaderForRequestHeader:(id)a3 status:(unsigned __int16)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[4];

  v4 = a4;
  v12[0] = CFSTR("protocol");
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("protocol")));
  v13[0] = v6;
  v12[1] = CFSTR("response");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("request")));
  v13[1] = v7;
  v12[2] = CFSTR("id");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:"));

  v13[2] = v8;
  v12[3] = CFSTR("status");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v4));
  v13[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 4));

  return v10;
}

@end
