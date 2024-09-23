@implementation HAPFragmentationPacket

- (HAPFragmentationPacket)init
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (HAPFragmentationPacket)initWithFragmentedPacketData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  __CFString *v16;
  HAPFragmentationPacket *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  __CFString *v34;
  void *v35;
  _QWORD v37[2];
  NSErrorUserInfoKey v38;
  _BYTE buf[12];
  __int16 v40;
  uint64_t v41;

  v4 = a3;
  v6 = v4;
  if (!v4)
  {
    v15 = sub_10007CCE4(0, v5);
    v9 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = sub_10007CD2C(0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v11;
      v12 = "%{public}@[HAPFragmentationPacket] Invalid paramter 'data'";
      v13 = v9;
      v14 = 12;
      goto LABEL_7;
    }
LABEL_8:
    v17 = 0;
    goto LABEL_20;
  }
  if ((unint64_t)objc_msgSend(v4, "length") <= 0xB)
  {
    v8 = sub_10007CCE4(0, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = sub_10007CD2C(0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      v40 = 2048;
      v41 = 12;
      v12 = "%{public}@[HAPFragmentationPacket] Fragmented data must have a length of at least %lu bytes";
      v13 = v9;
      v14 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v18 = v6;
  memset(v37, 0, 12);
  v19 = objc_msgSend(v18, "length");
  if ((unint64_t)v19 <= 0xB)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid serialized data length %tu"), objc_msgSend(v18, "length")));
    v26 = sub_10007CCE4(0, v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = sub_10007CD2C(0);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v29;
      v40 = 2112;
      v41 = (uint64_t)v24;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPFragmentationPacket] %@", buf, 0x16u);

    }
    v38 = NSLocalizedDescriptionKey;
    *(_QWORD *)buf = v24;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v38, 1));
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6743, v30));

    v21 = 0;
    v22 = 0;
    v23 = 0;
  }
  else
  {
    objc_msgSend(v18, "getBytes:length:", v37, 12);
    v20 = 0;
    v21 = LOWORD(v37[0]);
    v22 = *(unsigned int *)((char *)v37 + 2);
    v23 = *(unsigned int *)((char *)v37 + 6);
  }

  v9 = v20;
  if ((unint64_t)v19 <= 0xB)
  {
    v33 = sub_10007CCE4(0, v31);
    v32 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v34 = sub_10007CD2C(0);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v35;
      v40 = 2112;
      v41 = (uint64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationPacket] Failed to deserialize packet header with erorr: %@", buf, 0x16u);

    }
    v17 = 0;
  }
  else
  {
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subdataWithRange:", 12, (char *)objc_msgSend(v18, "length") - 12));
    self = -[HAPFragmentationPacket initWithData:transactionIdentifier:length:offset:](self, "initWithData:transactionIdentifier:length:offset:", v32, v21, v22, v23);
    v17 = self;
  }

LABEL_20:
  return v17;
}

- (HAPFragmentationPacket)initWithData:(id)a3 transactionIdentifier:(unsigned __int16)a4 length:(unsigned int)a5 offset:(unsigned int)a6
{
  id v11;
  HAPFragmentationPacket *v12;
  HAPFragmentationPacket *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HAPFragmentationPacket;
  v12 = -[HAPFragmentationPacket init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    v13->_transactionIdentifier = a4;
    v13->_length = a5;
    v13->_offset = a6;
  }

  return v13;
}

- (id)shortDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), objc_opt_class(self, a2));
}

- (id)debugDescription
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFragmentationPacket shortDescription](self, "shortDescription"));
  v4 = -[HAPFragmentationPacket transactionIdentifier](self, "transactionIdentifier");
  v5 = -[HAPFragmentationPacket length](self, "length");
  v6 = -[HAPFragmentationPacket offset](self, "offset");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFragmentationPacket data](self, "data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p, Transaction Identifier = %u, Transaction Length = %u, Offset = %u, Data Length = %tu>"), v3, self, v4, v5, v6, objc_msgSend(v7, "length")));

  return v8;
}

- (id)description
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFragmentationPacket shortDescription](self, "shortDescription"));
  v4 = -[HAPFragmentationPacket transactionIdentifier](self, "transactionIdentifier");
  v5 = -[HAPFragmentationPacket length](self, "length");
  v6 = -[HAPFragmentationPacket offset](self, "offset");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFragmentationPacket data](self, "data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@, Transaction Identifier = %u, Transaction Length = %u, Offset = %u, Data Length = %tu>"), v3, v4, v5, v6, objc_msgSend(v7, "length")));

  return v8;
}

- (unint64_t)hash
{
  unsigned int v3;

  v3 = -[HAPFragmentationPacket transactionIdentifier](self, "transactionIdentifier");
  return -[HAPFragmentationPacket offset](self, "offset") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPFragmentationPacket *v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;

  v5 = (HAPFragmentationPacket *)a3;
  v9 = 1;
  if (v5 != self)
  {
    v6 = objc_opt_class(HAPFragmentationPacket, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0
      || (v7 = -[HAPFragmentationPacket transactionIdentifier](self, "transactionIdentifier"),
          v7 != -[HAPFragmentationPacket transactionIdentifier](v5, "transactionIdentifier"))
      || (v8 = -[HAPFragmentationPacket offset](self, "offset"), v8 != -[HAPFragmentationPacket offset](v5, "offset")))
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v8;
  uint64_t v9;
  int v10;

  LOWORD(v8) = -[HAPFragmentationPacket transactionIdentifier](self, "transactionIdentifier");
  *(_DWORD *)((char *)&v8 + 2) = -[HAPFragmentationPacket length](self, "length");
  *(_DWORD *)((char *)&v8 + 6) = -[HAPFragmentationPacket offset](self, "offset");
  v9 = v8;
  v10 = WORD4(v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v9, 12));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFragmentationPacket data](self, "data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)objc_msgSend(v4, "length") + 12));

  objc_msgSend(v5, "appendData:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFragmentationPacket data](self, "data"));
  objc_msgSend(v5, "appendData:", v6);

  return v5;
}

- (unsigned)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (unsigned)length
{
  return self->_length;
}

- (unsigned)offset
{
  return self->_offset;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
