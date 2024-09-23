@implementation NRDLDKeys

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRDLDKeys)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("remotePublicKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    v9 = objc_msgSend(v8, "length");
    if (v9)
      v10 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", objc_msgSend(v8, "bytes"), v9);
    else
      v10 = objc_alloc_init((Class)NSData);
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }
  if (self)
    objc_storeStrong((id *)&self->_remotePublicKey, v11);
  if (v7)

  v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("localPublicKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v13)
  {
    v15 = v13;
    v16 = objc_msgSend(v15, "length");
    if (v16)
      v17 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", objc_msgSend(v15, "bytes"), v16);
    else
      v17 = objc_alloc_init((Class)NSData);
    v18 = v17;

  }
  else
  {
    v18 = 0;
  }
  if (self)
    objc_storeStrong((id *)&self->_localPublicKey, v18);
  if (v14)

  v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("localPrivateKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  if (v20)
  {
    v22 = v20;
    v23 = objc_msgSend(v22, "length");
    if (v23)
      v24 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", objc_msgSend(v22, "bytes"), v23);
    else
      v24 = objc_alloc_init((Class)NSData);
    v25 = v24;

  }
  else
  {
    v25 = 0;
  }
  if (self)
    objc_storeStrong((id *)&self->_localPrivateKey, v25);
  if (v21)

  v26 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("sharedSecret"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = v27;
  if (v27)
  {
    v29 = v27;
    v30 = objc_msgSend(v29, "length");
    if (v30)
      v31 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", objc_msgSend(v29, "bytes"), v30);
    else
      v31 = objc_alloc_init((Class)NSData);
    v32 = v31;

  }
  else
  {
    v32 = 0;
  }
  if (self)
    objc_storeStrong((id *)&self->_sharedSecret, v32);
  if (v28)

  v33 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("dhLocalPublic"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v35 = v34;
  if (v34)
  {
    v36 = v34;
    v37 = objc_msgSend(v36, "length");
    if (v37)
      v38 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", objc_msgSend(v36, "bytes"), v37);
    else
      v38 = objc_alloc_init((Class)NSData);
    v39 = v38;

  }
  else
  {
    v39 = 0;
  }
  if (self)
    objc_storeStrong((id *)&self->_dhLocalPublic, v39);
  if (v35)

  v40 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("dhLocalPrivate"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v42 = v41;
  if (v41)
  {
    v43 = v41;
    v44 = objc_msgSend(v43, "length");
    if (v44)
      v45 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", objc_msgSend(v43, "bytes"), v44);
    else
      v45 = objc_alloc_init((Class)NSData);
    v46 = v45;

  }
  else
  {
    v46 = 0;
  }
  if (self)
    objc_storeStrong((id *)&self->_dhLocalPrivate, v46);
  if (v42)

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dhLocalPrivate, 0);
  objc_storeStrong((id *)&self->_dhLocalPublic, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_localPrivateKey, 0);
  objc_storeStrong((id *)&self->_localPublicKey, 0);
  objc_storeStrong((id *)&self->_remotePublicKey, 0);
}

@end
