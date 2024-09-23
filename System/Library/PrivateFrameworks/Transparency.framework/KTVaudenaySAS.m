@implementation KTVaudenaySAS

- (KTVaudenaySAS)init
{
  abort();
}

+ (id)randomValueOfLength:(unint64_t)a3
{
  id v4;

  v4 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", a3));
  if (SecRandomCopyBytes(0, a3, (void *)objc_msgSend(v4, "mutableBytes")))
    abort();
  return v4;
}

- (id)initInitiatorWithPublic:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  KTVaudenaySAS *v8;
  KTVaudenaySAS *v9;
  void *v10;
  KTVaudenaySAS *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)KTVaudenaySAS;
  v8 = -[KTVaudenaySAS init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[KTVaudenaySAS setInitiator:](v8, "setInitiator:", 1);
    -[KTVaudenaySAS setInitiatorInfo:](v9, "setInitiatorInfo:", v6);
    -[KTVaudenaySAS setConfig:](v9, "setConfig:", v7);
    +[KTVaudenaySAS randomValueOfLength:](KTVaudenaySAS, "randomValueOfLength:", 16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTVaudenaySAS setInitiatorRandom:](v9, "setInitiatorRandom:", v10);

    v11 = v9;
  }

  return v9;
}

- (id)initAcceptorWithPublic:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  KTVaudenaySAS *v8;
  KTVaudenaySAS *v9;
  void *v10;
  KTVaudenaySAS *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)KTVaudenaySAS;
  v8 = -[KTVaudenaySAS init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[KTVaudenaySAS setInitiator:](v8, "setInitiator:", 0);
    -[KTVaudenaySAS setAcceptorInfo:](v9, "setAcceptorInfo:", v6);
    -[KTVaudenaySAS setConfig:](v9, "setConfig:", v7);
    +[KTVaudenaySAS randomValueOfLength:](KTVaudenaySAS, "randomValueOfLength:", 16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTVaudenaySAS setAcceptorRandom:](v9, "setAcceptorRandom:", v10);

    v11 = v9;
  }

  return v9;
}

- (void)setPeerPublic:(id)a3
{
  id v4;

  v4 = a3;
  if (-[KTVaudenaySAS initiator](self, "initiator"))
    -[KTVaudenaySAS setAcceptorInfo:](self, "setAcceptorInfo:", v4);
  else
    -[KTVaudenaySAS setInitiatorInfo:](self, "setInitiatorInfo:", v4);

}

- (id)undisclosedInitiatorValue:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x24BDBCEC8];
  v5 = a3;
  v6 = [v4 alloc];
  -[KTVaudenaySAS config](self, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithLength:", *(_QWORD *)objc_msgSend(v7, "di"));

  -[KTVaudenaySAS config](self, "config");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "di");
  objc_msgSend(v5, "length");
  v10 = objc_retainAutorelease(v5);
  objc_msgSend(v10, "bytes");

  v11 = objc_retainAutorelease(v8);
  objc_msgSend(v11, "mutableBytes");
  ccdigest();

  return v11;
}

- (id)undisclosedInitiatorRandom
{
  void *v3;
  void *v4;

  -[KTVaudenaySAS initiatorRandom](self, "initiatorRandom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTVaudenaySAS undisclosedInitiatorValue:](self, "undisclosedInitiatorValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)setInitiatorUndisclosedRandom:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  if (-[KTVaudenaySAS initiator](self, "initiator"))
    goto LABEL_5;
  -[KTVaudenaySAS sentUndisclosedRandom](self, "sentUndisclosedRandom");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  -[KTVaudenaySAS sentUndisclosedRandom](self, "sentUndisclosedRandom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v4);

  if (!v8)
  {
LABEL_5:
    v10 = 0;
  }
  else
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTVaudenaySAS setSentUndisclosedRandom:](self, "setSentUndisclosedRandom:", v9);

    v10 = 1;
  }

  return v10;
}

- (BOOL)setPeerRandom:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "length") != 16)
    goto LABEL_8;
  if (!-[KTVaudenaySAS initiator](self, "initiator"))
  {
    -[KTVaudenaySAS sentUndisclosedRandom](self, "sentUndisclosedRandom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[KTVaudenaySAS undisclosedInitiatorValue:](self, "undisclosedInitiatorValue:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTVaudenaySAS sentUndisclosedRandom](self, "sentUndisclosedRandom");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqual:", v8);

      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTVaudenaySAS setInitiatorRandom:](self, "setInitiatorRandom:", v9);

      }
      goto LABEL_7;
    }
LABEL_8:
    LOBYTE(v6) = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTVaudenaySAS setAcceptorRandom:](self, "setAcceptorRandom:", v5);
  LOBYTE(v6) = 1;
LABEL_7:

LABEL_9:
  return v6;
}

- (id)selfRandom
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = -[KTVaudenaySAS initiator](self, "initiator");
  -[KTVaudenaySAS acceptorRandom](self, "acceptorRandom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {

    if (v5)
    {
      -[KTVaudenaySAS initiatorRandom](self, "initiatorRandom");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (id)shortAuthenticationString
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  size_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  unint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t *v56;
  id v57;
  unsigned int v58;
  unsigned int v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  -[KTVaudenaySAS initiatorInfo](self, "initiatorInfo");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_11;
  v4 = (void *)v3;
  -[KTVaudenaySAS initiatorRandom](self, "initiatorRandom");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_10;
  v6 = (void *)v5;
  -[KTVaudenaySAS acceptorInfo](self, "acceptorInfo");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

LABEL_10:
    goto LABEL_11;
  }
  v8 = (void *)v7;
  -[KTVaudenaySAS acceptorRandom](self, "acceptorRandom");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_11:
    v49 = 0;
    return v49;
  }
  -[KTVaudenaySAS config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "di");
  -[KTVaudenaySAS config](self, "config");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "di");
  -[KTVaudenaySAS config](self, "config");
  v57 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "di");
  v56 = &v54;
  MEMORY[0x24BDAC7A8]();
  bzero((char *)&v54 - v12, v13);
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTVaudenaySAS config](self, "config");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "digestPrefix");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[KTVaudenaySAS config](self, "config");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "digestPrefix");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendData:", v18);

  }
  -[KTVaudenaySAS initiatorRandom](self, "initiatorRandom");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendData:", v19);

  -[KTVaudenaySAS acceptorRandom](self, "acceptorRandom");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendData:", v20);

  -[KTVaudenaySAS config](self, "config");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "di");
  objc_msgSend(v14, "length");
  v22 = objc_retainAutorelease(v14);
  objc_msgSend(v22, "mutableBytes");
  cchmac_init();

  objc_msgSend(v22, "length");
  v23 = objc_retainAutorelease(v22);
  objc_msgSend(v23, "mutableBytes");
  cc_clear();
  -[KTVaudenaySAS initiatorInfo](self, "initiatorInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = bswap32(objc_msgSend(v24, "length"));

  -[KTVaudenaySAS acceptorInfo](self, "acceptorInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = bswap32(objc_msgSend(v25, "length"));

  -[KTVaudenaySAS config](self, "config");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "di");
  cchmac_update();

  -[KTVaudenaySAS config](self, "config");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "di");
  -[KTVaudenaySAS initiatorInfo](self, "initiatorInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "length");
  -[KTVaudenaySAS initiatorInfo](self, "initiatorInfo");
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v29, "bytes");
  cchmac_update();

  -[KTVaudenaySAS config](self, "config");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "di");
  cchmac_update();

  -[KTVaudenaySAS config](self, "config");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "di");
  -[KTVaudenaySAS acceptorInfo](self, "acceptorInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "length");
  -[KTVaudenaySAS acceptorInfo](self, "acceptorInfo");
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v33, "bytes");
  cchmac_update();

  v34 = objc_alloc(MEMORY[0x24BDBCEC8]);
  -[KTVaudenaySAS config](self, "config");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v34, "initWithLength:", *(_QWORD *)objc_msgSend(v35, "di"));

  -[KTVaudenaySAS config](self, "config");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "di");
  if (v36)
  {
    v38 = objc_retainAutorelease(v36);
    objc_msgSend(v38, "mutableBytes");
    cchmac_final();

    -[KTVaudenaySAS config](self, "config");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "di");
    -[KTVaudenaySAS config](self, "config");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "di");
    v55 = v23;
    v41 = v11;
    v42 = v10;
    -[KTVaudenaySAS config](self, "config");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "di");
    cc_clear();

    v44 = bswap64(*(_QWORD *)objc_msgSend(objc_retainAutorelease(v38), "bytes"));
    -[KTVaudenaySAS config](self, "config");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v44 % objc_msgSend(v45, "shortCodeMod10");

    v47 = (void *)MEMORY[0x24BDD17C8];
    -[KTVaudenaySAS config](self, "config");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v37, "shortCodeLength");
    v53 = v46;
    v10 = v42;
    v11 = v41;
    v23 = v55;
    objc_msgSend(v47, "stringWithFormat:", CFSTR("%0.*llu"), v48, v53);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[KTVaudenaySAS config](self, "config");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "di");
    -[KTVaudenaySAS config](self, "config");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "di");
    cc_clear();

    v49 = 0;
  }

  return v49;
}

- (BOOL)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(BOOL)a3
{
  self->_initiator = a3;
}

- (KTVaudenaySASConfiguration)config
{
  return (KTVaudenaySASConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)initiatorInfo
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInitiatorInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)initiatorRandom
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInitiatorRandom:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)acceptorInfo
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAcceptorInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSData)acceptorRandom
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAcceptorRandom:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSData)sentUndisclosedRandom
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSentUndisclosedRandom:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentUndisclosedRandom, 0);
  objc_storeStrong((id *)&self->_acceptorRandom, 0);
  objc_storeStrong((id *)&self->_acceptorInfo, 0);
  objc_storeStrong((id *)&self->_initiatorRandom, 0);
  objc_storeStrong((id *)&self->_initiatorInfo, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
