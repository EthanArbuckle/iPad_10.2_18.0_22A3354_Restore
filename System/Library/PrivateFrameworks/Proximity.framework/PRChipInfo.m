@implementation PRChipInfo

- (PRChipInfo)initWithECID:(unint64_t)a3 chipID:(unsigned __int16)a4 boardID:(unsigned __int16)a5 bootMode:(unsigned int)a6 prodMode:(unsigned __int8)a7 secureMode:(unsigned __int8)a8 securityDomain:(unsigned __int8)a9 chipRevision:(unsigned __int16)a10
{
  PRChipInfo *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PRChipInfo;
  result = -[PRChipInfo init](&v17, sel_init);
  if (result)
  {
    result->_ECID = a3;
    result->_chipID = a4;
    result->_boardID = a5;
    result->_bootMode = a6;
    result->_prodMode = a7;
    result->_secureMode = a8;
    result->_securityDomain = a9;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRChipInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int16 v6;
  unsigned __int16 v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  char v11;
  PRChipInfo *v12;
  uint64_t v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ECID"));
  v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("chipID"));
  v7 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("boardID"));
  v8 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bootMode"));
  v9 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("prodMode"));
  v10 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("secureMode"));
  v11 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("securityDomain"));
  WORD1(v14) = objc_msgSend(v4, "decodeIntForKey:", CFSTR("chipRevision"));
  LOBYTE(v14) = v11;
  v12 = -[PRChipInfo initWithECID:chipID:boardID:bootMode:prodMode:secureMode:securityDomain:chipRevision:](self, "initWithECID:chipID:boardID:bootMode:prodMode:secureMode:securityDomain:chipRevision:", v5, v6, v7, v8, v9, v10, v14);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_ECID, CFSTR("ECID"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_chipID, CFSTR("chipID"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_boardID, CFSTR("boardID"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_bootMode, CFSTR("bootMode"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_prodMode, CFSTR("prodMode"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_secureMode, CFSTR("secureMode"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_securityDomain, CFSTR("securityDomain"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PRChipInfo *v4;
  uint64_t v6;

  v4 = [PRChipInfo alloc];
  WORD1(v6) = self->_chipRevision;
  LOBYTE(v6) = self->_securityDomain;
  return -[PRChipInfo initWithECID:chipID:boardID:bootMode:prodMode:secureMode:securityDomain:chipRevision:](v4, "initWithECID:chipID:boardID:bootMode:prodMode:secureMode:securityDomain:chipRevision:", self->_ECID, self->_chipID, self->_boardID, self->_bootMode, self->_prodMode, self->_secureMode, v6);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ECID: %llu, chipID: %d, boardID: %d, bootMode: %d, prodMode: %d, secureMode: %d, securityDomain: %d, chipRevision: 0x%04x"), self->_ECID, self->_chipID, self->_boardID, self->_bootMode, self->_prodMode, self->_secureMode, self->_securityDomain, self->_chipRevision);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  BOOL v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "ECID");
    if (v6 == -[PRChipInfo ECID](self, "ECID")
      && (v7 = objc_msgSend(v5, "chipID"), v7 == -[PRChipInfo chipID](self, "chipID"))
      && (v8 = objc_msgSend(v5, "boardID"), v8 == -[PRChipInfo boardID](self, "boardID"))
      && (v9 = objc_msgSend(v5, "bootMode"), v9 == -[PRChipInfo bootMode](self, "bootMode"))
      && (v10 = objc_msgSend(v5, "prodMode"), v10 == -[PRChipInfo prodMode](self, "prodMode"))
      && (v11 = objc_msgSend(v5, "secureMode"), v11 == -[PRChipInfo secureMode](self, "secureMode"))
      && (v12 = objc_msgSend(v5, "securityDomain"), v12 == -[PRChipInfo securityDomain](self, "securityDomain")))
    {
      v13 = objc_msgSend(v5, "chipRevision");
      v14 = v13 == -[PRChipInfo chipRevision](self, "chipRevision");
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)ECID
{
  return self->_ECID;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (unsigned)bootMode
{
  return self->_bootMode;
}

- (unsigned)prodMode
{
  return self->_prodMode;
}

- (unsigned)secureMode
{
  return self->_secureMode;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (unsigned)chipRevision
{
  return self->_chipRevision;
}

@end
