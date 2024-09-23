@implementation MRUHardwareInfo

- (MRUHardwareInfo)initWithChipID:(unsigned int)a3 chipRev:(unsigned int)a4 boardID:(unsigned int)a5 securityEpoch:(unsigned int)a6 productionStatus:(BOOL)a7 securityMode:(BOOL)a8 securityDomain:(unsigned int)a9 ecid:(unint64_t)a10
{
  MRUHardwareInfo *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MRUHardwareInfo;
  result = -[MRUHardwareInfo init](&v17, sel_init);
  if (result)
  {
    result->_chipID = a3;
    result->_chipRev = a4;
    result->_boardID = a5;
    result->_securityEpoch = a6;
    result->_productionStatus = a7;
    result->_securityMode = a8;
    result->_securityDomain = a9;
    result->_ecid = a10;
  }
  return result;
}

- (MRUHardwareInfo)initWithCoder:(id)a3
{
  id v4;
  MRUHardwareInfo *v5;
  MRUHardwareInfo *v6;
  MRUHardwareInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MRUHardwareInfo;
  v5 = -[MRUHardwareInfo init](&v24, sel_init);
  if (!v5)
    goto LABEL_25;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("chipID"));
  v6 = (MRUHardwareInfo *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v5->_chipID = -[MRUHardwareInfo unsignedIntValue](v6, "unsignedIntValue");
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("chipRev"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {

LABEL_24:
      v7 = 0;
      goto LABEL_26;
    }
    v9 = v8;
    v5->_chipRev = objc_msgSend(v8, "unsignedIntValue");
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("boardID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v5->_boardID = objc_msgSend(v10, "unsignedIntValue");
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("securityEpoch"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v5->_securityEpoch = objc_msgSend(v12, "unsignedIntValue");
        objc_msgSend(v4, "decodeObjectForKey:", CFSTR("productionStatus"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v5->_productionStatus = objc_msgSend(v14, "unsignedIntValue") != 0;
          objc_msgSend(v4, "decodeObjectForKey:", CFSTR("securityMode"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v5->_securityMode = objc_msgSend(v16, "unsignedIntValue") != 0;
            objc_msgSend(v4, "decodeObjectForKey:", CFSTR("securityDomain"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18)
            {
              v5->_securityDomain = objc_msgSend(v18, "unsignedIntValue");
              objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ecid"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                v23 = v20;
                v21 = 0;
                v5->_ecid = objc_msgSend(v20, "unsignedLongLongValue");
                v20 = v23;
              }
              else
              {
                v21 = 1;
              }

            }
            else
            {
              v21 = 1;
            }

          }
          else
          {
            v21 = 1;
          }

        }
        else
        {
          v21 = 1;
        }

      }
      else
      {
        v21 = 1;
      }

    }
    else
    {
      v21 = 1;
    }

    if (v21)
      goto LABEL_24;
LABEL_25:
    v7 = v5;
  }
LABEL_26:

  return v7;
}

- (MRUHardwareInfo)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  MRUHardwareInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  MRUHardwareInfo *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  objc_super v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v49.receiver = self;
  v49.super_class = (Class)MRUHardwareInfo;
  v7 = -[MRUHardwareInfo init](&v49, sel_init);
  if (!v7)
    goto LABEL_39;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("chipID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (*a4)
    {
      v25 = (void *)MEMORY[0x24BDD1540];
      v64 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No chipID in options dict"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v27);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_38;
  }
  v9 = v8;
  v7->_chipID = objc_msgSend(v8, "unsignedIntValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundlePath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (*a4)
    {
      v28 = (void *)MEMORY[0x24BDD1540];
      v62 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No chipRev in options dict"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v29;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v30);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_38;
  }
  v11 = v10;
  v7->_chipRev = objc_msgSend(v10, "unsignedIntValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("boardID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    if (!*a4)
    {
      v24 = 1;
      goto LABEL_37;
    }
    v31 = (void *)MEMORY[0x24BDD1540];
    v60 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No boardID in options dict"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v15;
    v24 = 1;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v31;
    v17 = (void *)v32;
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v32);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  v7->_boardID = objc_msgSend(v12, "unsignedIntValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("securityEpoch"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v7->_securityEpoch = objc_msgSend(v14, "unsignedIntValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("productionStatus"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
    {
      if (!*a4)
      {
        v24 = 1;
LABEL_35:

        goto LABEL_36;
      }
      v46 = (id)MEMORY[0x24BDD1540];
      v56 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No productionStatus in options dict"));
      v48 = objc_claimAutoreleasedReturnValue();
      v57 = v48;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v24 = 1;
      goto LABEL_33;
    }
    v7->_productionStatus = objc_msgSend(v16, "BOOLValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("securityMode"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v48 = (uint64_t)v18;
      v7->_securityMode = objc_msgSend(v18, "BOOLValue");
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("securityDomain"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v7->_securityDomain = objc_msgSend(v20, "unsignedIntValue");
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ecid"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = v22;
          v24 = 0;
          v7->_ecid = objc_msgSend(v22, "unsignedLongLongValue");
          v22 = v23;
LABEL_32:

LABEL_33:
          v19 = (void *)v48;
          goto LABEL_34;
        }
        if (!*a4)
        {
          v24 = 1;
          goto LABEL_32;
        }
        v42 = (void *)MEMORY[0x24BDD1540];
        v50 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No ecid in options dict"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v45;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v38 = v17;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v39);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v17 = v38;
        v22 = 0;
      }
      else
      {
        if (!*a4)
        {
          v24 = 1;
          goto LABEL_33;
        }
        v44 = (void *)MEMORY[0x24BDD1540];
        v52 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No securityDomain in options dict"));
        v36 = objc_claimAutoreleasedReturnValue();
        v53 = v36;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v47 = v17;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v37);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v22 = (void *)v36;
        v17 = v47;
      }
    }
    else
    {
      if (!*a4)
      {
        v24 = 1;
        goto LABEL_34;
      }
      v48 = 0;
      v43 = (void *)MEMORY[0x24BDD1540];
      v54 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No securityMode in options dict"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v35);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (void *)v35;
    }
    v24 = 1;
    goto LABEL_32;
  }
  if (*a4)
  {
    v34 = (void *)MEMORY[0x24BDD1540];
    v58 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No securityEpoch in options dict"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 1;
LABEL_34:

    goto LABEL_35;
  }
  v24 = 1;
LABEL_36:

LABEL_37:
  if (!v24)
  {
LABEL_39:
    v40 = v7;
    goto LABEL_40;
  }
LABEL_38:
  v40 = 0;
LABEL_40:

  return v40;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t chipID;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x24BDD16E0];
  chipID = self->_chipID;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", chipID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("chipID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_chipRev);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("chipRev"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_boardID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("boardID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_securityEpoch);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("securityEpoch"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_productionStatus);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("productionStatus"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_securityMode);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("securityMode"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_securityDomain);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("securityDomain"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ecid);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v14, CFSTR("ecid"));

}

- (NSDictionary)asDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[8];
  _QWORD v14[9];

  v14[8] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("chipID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_chipID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("bundlePath");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_chipRev);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("boardID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_boardID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v13[3] = CFSTR("securityEpoch");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_securityEpoch);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  v13[4] = CFSTR("productionStatus");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_productionStatus);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  v13[5] = CFSTR("securityMode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_securityMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v8;
  v13[6] = CFSTR("securityDomain");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_securityDomain);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v9;
  v13[7] = CFSTR("ecid");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ecid);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("\tchipID: %u\n"), self->_chipID);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tchipRev: %u\n"), self->_chipRev);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tboardID: %u\n"), self->_boardID);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tsecurityEpoch: %u\n"), self->_securityEpoch);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tproductionStatus: %u\n"), self->_productionStatus);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tsecurityMode: %u\n"), self->_securityMode);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tsecurityDomain: %u\n"), self->_securityDomain);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tecid: %llu\n"), self->_ecid);
  objc_msgSend(v6, "appendString:", CFSTR(")"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (unsigned)chipRev
{
  return self->_chipRev;
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (unsigned)securityEpoch
{
  return self->_securityEpoch;
}

- (BOOL)productionStatus
{
  return self->_productionStatus;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (unint64_t)ecid
{
  return self->_ecid;
}

@end
