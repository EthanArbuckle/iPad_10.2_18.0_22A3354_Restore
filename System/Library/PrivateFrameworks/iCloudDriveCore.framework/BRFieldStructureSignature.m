@implementation BRFieldStructureSignature

- (id)etag
{
  void *v2;
  void *v3;
  id v4;

  -[NSString componentsSeparatedByString:](self->_versionIdentifier, "componentsSeparatedByString:", CFSTR(";"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)isEquivalentToSignature:(id)a3
{
  return areSignaturesEquivalent(self, a3);
}

- (BRFieldStructureSignature)initWithLocalStatInfo:(id)a3
{
  id v4;
  BRFieldStructureSignature *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  NSString *versionIdentifier;
  uint64_t v16;
  NSString *oldVersionIdentifier;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRFieldStructureSignature;
  v5 = -[BRFieldStructureSignature init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "ckInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "etag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "localChangeCount");
    v9 = v7;
    v10 = v9;
    v11 = &stru_24FE4A790;
    if (v9)
      v11 = v9;
    v12 = v11;
    v13 = v12;
    if (v8)
    {
      -[__CFString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR(";%llu"), v8);
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }

    versionIdentifier = v5->_versionIdentifier;
    v5->_versionIdentifier = (NSString *)v13;

    objc_msgSend(v4, "oldVersionIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    oldVersionIdentifier = v5->_oldVersionIdentifier;
    v5->_oldVersionIdentifier = (NSString *)v16;

  }
  return v5;
}

- (BOOL)hasOldVersionIdentifier
{
  return self->_oldVersionIdentifier != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BRFieldStructureSignature;
  -[BRFieldStructureSignature description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRFieldStructureSignature dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *versionIdentifier;
  NSString *oldVersionIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  versionIdentifier = self->_versionIdentifier;
  if (versionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", versionIdentifier, CFSTR("versionIdentifier"));
  oldVersionIdentifier = self->_oldVersionIdentifier;
  if (oldVersionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", oldVersionIdentifier, CFSTR("oldVersionIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldStructureSignatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_versionIdentifier)
    -[BRFieldStructureSignature writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_oldVersionIdentifier)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setVersionIdentifier:", self->_versionIdentifier);
  if (self->_oldVersionIdentifier)
    objc_msgSend(v4, "setOldVersionIdentifier:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_versionIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_oldVersionIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *versionIdentifier;
  NSString *oldVersionIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((versionIdentifier = self->_versionIdentifier, !((unint64_t)versionIdentifier | v4[2]))
     || -[NSString isEqual:](versionIdentifier, "isEqual:")))
  {
    oldVersionIdentifier = self->_oldVersionIdentifier;
    if ((unint64_t)oldVersionIdentifier | v4[1])
      v7 = -[NSString isEqual:](oldVersionIdentifier, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_versionIdentifier, "hash");
  return -[NSString hash](self->_oldVersionIdentifier, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[BRFieldStructureSignature setVersionIdentifier:](self, "setVersionIdentifier:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[BRFieldStructureSignature setOldVersionIdentifier:](self, "setOldVersionIdentifier:");
    v4 = v5;
  }

}

- (NSString)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void)setVersionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_versionIdentifier, a3);
}

- (NSString)oldVersionIdentifier
{
  return self->_oldVersionIdentifier;
}

- (void)setOldVersionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_oldVersionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionIdentifier, 0);
  objc_storeStrong((id *)&self->_oldVersionIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BRFieldStructureSignature writeTo:]", "BRFieldStructureSignature.m", 87, "nil != self->_versionIdentifier");
}

@end
