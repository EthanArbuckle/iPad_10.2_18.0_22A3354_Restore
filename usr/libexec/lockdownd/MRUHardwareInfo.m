@implementation MRUHardwareInfo

- (MRUHardwareInfo)initWithChipID:(unsigned int)a3 chipRev:(unsigned int)a4 boardID:(unsigned int)a5 securityEpoch:(unsigned int)a6 productionStatus:(BOOL)a7 securityMode:(BOOL)a8 securityDomain:(unsigned int)a9 ecid:(unint64_t)a10
{
  MRUHardwareInfo *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MRUHardwareInfo;
  result = -[MRUHardwareInfo init](&v17, "init");
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
  v5 = -[MRUHardwareInfo init](&v24, "init");
  if (!v5)
    goto LABEL_25;
  v6 = (MRUHardwareInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("chipID")));
  v7 = v6;
  if (v6)
  {
    v5->_chipID = -[MRUHardwareInfo unsignedIntValue](v6, "unsignedIntValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("chipRev")));
    if (!v8)
    {

LABEL_24:
      v7 = 0;
      goto LABEL_26;
    }
    v9 = v8;
    v5->_chipRev = objc_msgSend(v8, "unsignedIntValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("boardID")));
    v11 = v10;
    if (v10)
    {
      v5->_boardID = objc_msgSend(v10, "unsignedIntValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("securityEpoch")));
      v13 = v12;
      if (v12)
      {
        v5->_securityEpoch = objc_msgSend(v12, "unsignedIntValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("productionStatus")));
        v15 = v14;
        if (v14)
        {
          v5->_productionStatus = objc_msgSend(v14, "unsignedIntValue") != 0;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("securityMode")));
          v17 = v16;
          if (v16)
          {
            v5->_securityMode = objc_msgSend(v16, "unsignedIntValue") != 0;
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("securityDomain")));
            v19 = v18;
            if (v18)
            {
              v5->_securityDomain = objc_msgSend(v18, "unsignedIntValue");
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ecid")));
              if (v20)
              {
                v23 = v20;
                v21 = 0;
                v5->_ecid = (unint64_t)objc_msgSend(v20, "unsignedLongLongValue");
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
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  MRUHardwareInfo *v34;
  void *v36;
  id v37;
  uint64_t v38;
  objc_super v39;
  NSErrorUserInfoKey v40;
  void *v41;
  NSErrorUserInfoKey v42;
  uint64_t v43;
  NSErrorUserInfoKey v44;
  void *v45;
  NSErrorUserInfoKey v46;
  uint64_t v47;
  NSErrorUserInfoKey v48;
  void *v49;
  NSErrorUserInfoKey v50;
  void *v51;
  NSErrorUserInfoKey v52;
  void *v53;
  NSErrorUserInfoKey v54;
  void *v55;

  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MRUHardwareInfo;
  v7 = -[MRUHardwareInfo init](&v39, "init");
  if (!v7)
    goto LABEL_39;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("chipID")));
  if (!v8)
  {
    if (*a4)
    {
      v54 = NSLocalizedDescriptionKey;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No chipID in options dict")));
      v55 = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v26));

    }
    goto LABEL_38;
  }
  v9 = v8;
  v7->_chipID = objc_msgSend(v8, "unsignedIntValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundlePath")));
  if (!v10)
  {
    if (*a4)
    {
      v52 = NSLocalizedDescriptionKey;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No chipRev in options dict")));
      v53 = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v28));

    }
    goto LABEL_38;
  }
  v11 = v10;
  v7->_chipRev = objc_msgSend(v10, "unsignedIntValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("boardID")));
  v13 = v12;
  if (!v12)
  {
    if (!*a4)
    {
      v24 = 1;
      goto LABEL_37;
    }
    v50 = NSLocalizedDescriptionKey;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No boardID in options dict")));
    v51 = v15;
    v24 = 1;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v17));
    goto LABEL_35;
  }
  v7->_boardID = objc_msgSend(v12, "unsignedIntValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("securityEpoch")));
  v15 = v14;
  if (v14)
  {
    v7->_securityEpoch = objc_msgSend(v14, "unsignedIntValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("productionStatus")));
    v17 = v16;
    if (!v16)
    {
      if (!*a4)
      {
        v24 = 1;
LABEL_35:

        goto LABEL_36;
      }
      v46 = NSLocalizedDescriptionKey;
      v38 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No productionStatus in options dict")));
      v47 = v38;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v21));
      v24 = 1;
      goto LABEL_33;
    }
    v7->_productionStatus = objc_msgSend(v16, "BOOLValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("securityMode")));
    v19 = v18;
    if (v18)
    {
      v38 = (uint64_t)v18;
      v7->_securityMode = objc_msgSend(v18, "BOOLValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("securityDomain")));
      v21 = v20;
      if (v20)
      {
        v7->_securityDomain = objc_msgSend(v20, "unsignedIntValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ecid")));
        if (v22)
        {
          v23 = v22;
          v24 = 0;
          v7->_ecid = (unint64_t)objc_msgSend(v22, "unsignedLongLongValue");
          v22 = v23;
LABEL_32:

LABEL_33:
          v19 = (void *)v38;
          goto LABEL_34;
        }
        if (!*a4)
        {
          v24 = 1;
          goto LABEL_32;
        }
        v40 = NSLocalizedDescriptionKey;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No ecid in options dict")));
        v41 = v36;
        v32 = v17;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v33));

        v17 = v32;
        v22 = 0;
      }
      else
      {
        if (!*a4)
        {
          v24 = 1;
          goto LABEL_33;
        }
        v42 = NSLocalizedDescriptionKey;
        v30 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No securityDomain in options dict")));
        v43 = v30;
        v37 = v17;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v31));

        v22 = (void *)v30;
        v17 = v37;
      }
    }
    else
    {
      if (!*a4)
      {
        v24 = 1;
        goto LABEL_34;
      }
      v38 = 0;
      v44 = NSLocalizedDescriptionKey;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No securityMode in options dict")));
      v45 = v21;
      v29 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v29));
      v22 = (void *)v29;
    }
    v24 = 1;
    goto LABEL_32;
  }
  if (*a4)
  {
    v48 = NSLocalizedDescriptionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No securityEpoch in options dict")));
    v49 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 1, v19));
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
    v34 = v7;
    goto LABEL_40;
  }
LABEL_38:
  v34 = 0;
LABEL_40:

  return v34;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t chipID;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  chipID = self->_chipID;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", chipID));
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("chipID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_chipRev));
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("chipRev"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_boardID));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("boardID"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_securityEpoch));
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("securityEpoch"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_productionStatus));
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("productionStatus"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_securityMode));
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("securityMode"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_securityDomain));
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("securityDomain"));

  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_ecid));
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("ecid"));

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
  _QWORD v14[8];

  v13[0] = CFSTR("chipID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_chipID));
  v14[0] = v3;
  v13[1] = CFSTR("bundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_chipRev));
  v14[1] = v4;
  v13[2] = CFSTR("boardID");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_boardID));
  v14[2] = v5;
  v13[3] = CFSTR("securityEpoch");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_securityEpoch));
  v14[3] = v6;
  v13[4] = CFSTR("productionStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_productionStatus));
  v14[4] = v7;
  v13[5] = CFSTR("securityMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_securityMode));
  v14[5] = v8;
  v13[6] = CFSTR("securityDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_securityDomain));
  v14[6] = v9;
  v13[7] = CFSTR("ecid");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_ecid));
  v14[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 8));

  return (NSDictionary *)v11;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@(\n"), v5));

  objc_msgSend(v6, "appendFormat:", CFSTR("\tchipID: %u\n"), self->_chipID);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tchipRev: %u\n"), self->_chipRev);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tboardID: %u\n"), self->_boardID);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tsecurityEpoch: %u\n"), self->_securityEpoch);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tproductionStatus: %u\n"), self->_productionStatus);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tsecurityMode: %u\n"), self->_securityMode);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tsecurityDomain: %u\n"), self->_securityDomain);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tecid: %llu\n"), self->_ecid);
  objc_msgSend(v6, "appendString:", CFSTR(")"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v6));

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
