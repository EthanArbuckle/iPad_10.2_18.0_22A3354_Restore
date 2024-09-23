@implementation SFDrillDownMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setCardOnlyMetadata:(id)a3
{
  SFEntitySearchMetadata *entitySearchOnlyMetadata;
  SFCardSearchMetadata *cardSearchMetadata;
  SFEntitySearchMetadata *entitySearchMetadata;
  id v8;

  *(_BYTE *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_cardOnlyMetadata, a3);
  v8 = a3;
  *(_BYTE *)&self->_has &= ~2u;
  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = 0;

  *(_BYTE *)&self->_has &= ~4u;
  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = 0;

  *(_BYTE *)&self->_has &= ~8u;
  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = 0;

}

- (BOOL)hasCardOnlyMetadata
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setEntitySearchOnlyMetadata:(id)a3
{
  SFCardMetadata *cardOnlyMetadata;
  SFCardSearchMetadata *cardSearchMetadata;
  SFEntitySearchMetadata *entitySearchMetadata;
  id v8;

  *(_BYTE *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_entitySearchOnlyMetadata, a3);
  v8 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = 0;

  *(_BYTE *)&self->_has &= ~4u;
  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = 0;

  *(_BYTE *)&self->_has &= ~8u;
  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = 0;

}

- (BOOL)hasEntitySearchOnlyMetadata
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCardSearchMetadata:(id)a3
{
  SFCardMetadata *cardOnlyMetadata;
  SFEntitySearchMetadata *entitySearchOnlyMetadata;
  SFEntitySearchMetadata *entitySearchMetadata;
  id v8;

  *(_BYTE *)&self->_has |= 4u;
  objc_storeStrong((id *)&self->_cardSearchMetadata, a3);
  v8 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = 0;

  *(_BYTE *)&self->_has &= ~2u;
  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = 0;

  *(_BYTE *)&self->_has &= ~8u;
  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = 0;

}

- (BOOL)hasCardSearchMetadata
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEntitySearchMetadata:(id)a3
{
  SFCardMetadata *cardOnlyMetadata;
  SFEntitySearchMetadata *entitySearchOnlyMetadata;
  SFCardSearchMetadata *cardSearchMetadata;
  id v8;

  *(_BYTE *)&self->_has |= 8u;
  objc_storeStrong((id *)&self->_entitySearchMetadata, a3);
  v8 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = 0;

  *(_BYTE *)&self->_has &= ~2u;
  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = 0;

  *(_BYTE *)&self->_has &= ~4u;
  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = 0;

}

- (BOOL)hasEntitySearchMetadata
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (SFDrillDownMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBDrillDownMetadata *v6;
  SFDrillDownMetadata *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBDrillDownMetadata initWithData:]([_SFPBDrillDownMetadata alloc], "initWithData:", v5);
  v7 = -[SFDrillDownMetadata initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBDrillDownMetadata *v6;

  v4 = a3;
  v6 = -[_SFPBDrillDownMetadata initWithFacade:]([_SFPBDrillDownMetadata alloc], "initWithFacade:", self);
  -[_SFPBDrillDownMetadata data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBDrillDownMetadata *v2;
  void *v3;

  v2 = -[_SFPBDrillDownMetadata initWithFacade:]([_SFPBDrillDownMetadata alloc], "initWithFacade:", self);
  -[_SFPBDrillDownMetadata dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBDrillDownMetadata *v2;
  void *v3;

  v2 = -[_SFPBDrillDownMetadata initWithFacade:]([_SFPBDrillDownMetadata alloc], "initWithFacade:", self);
  -[_SFPBDrillDownMetadata jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v24;
  void *v25;
  void *v26;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFDrillDownMetadata cardIdentifier](self, "cardIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCardIdentifier:", v6);

  -[SFDrillDownMetadata cardIdentifiers](self, "cardIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCardIdentifiers:", v8);

  -[SFDrillDownMetadata cardDomains](self, "cardDomains");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setCardDomains:", v10);

  -[SFDrillDownMetadata qtype](self, "qtype");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setQtype:", v12);

  -[SFDrillDownMetadata viewConfigName](self, "viewConfigName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setViewConfigName:", v14);

  if (-[SFDrillDownMetadata hasCardOnlyMetadata](self, "hasCardOnlyMetadata"))
  {
    -[SFDrillDownMetadata cardOnlyMetadata](self, "cardOnlyMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v4, "setCardOnlyMetadata:", v16);

  }
  if (-[SFDrillDownMetadata hasEntitySearchOnlyMetadata](self, "hasEntitySearchOnlyMetadata"))
  {
    -[SFDrillDownMetadata entitySearchOnlyMetadata](self, "entitySearchOnlyMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v4, "setEntitySearchOnlyMetadata:", v18);

  }
  if (-[SFDrillDownMetadata hasCardSearchMetadata](self, "hasCardSearchMetadata"))
  {
    -[SFDrillDownMetadata cardSearchMetadata](self, "cardSearchMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v4, "setCardSearchMetadata:", v20);

  }
  if (-[SFDrillDownMetadata hasEntitySearchMetadata](self, "hasEntitySearchMetadata"))
  {
    -[SFDrillDownMetadata entitySearchMetadata](self, "entitySearchMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v4, "setEntitySearchMetadata:", v22);

  }
  -[SFDrillDownMetadata debugParams](self, "debugParams");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setDebugParams:", v24);

  -[SFDrillDownMetadata params](self, "params");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setParams:", v26);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFDrillDownMetadata *v4;
  SFDrillDownMetadata *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  uint64_t v19;
  void *v20;
  SFDrillDownMetadata *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  SFDrillDownMetadata *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  __int128 v99;
  _QWORD v100[6];
  int v101;
  int v102;
  id v103;
  id v104;
  _QWORD v105[4];

  v4 = (SFDrillDownMetadata *)a3;
  if (self == v4)
  {
    v18 = 1;
    goto LABEL_78;
  }
  if (!-[SFDrillDownMetadata isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v18 = 0;
    goto LABEL_78;
  }
  v5 = v4;
  -[SFDrillDownMetadata cardIdentifier](self, "cardIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDrillDownMetadata cardIdentifier](v5, "cardIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v7;
  v104 = v6;
  v101 = v7 != 0;
  v102 = v6 == 0;
  if (v102 == v101)
  {
    memset(v100, 0, sizeof(v100));
    v99 = 0uLL;
    memset(v105, 0, sizeof(v105));
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_15;
  }
  -[SFDrillDownMetadata cardIdentifier](self, "cardIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;
  v98 = (void *)v8;
  if (v8)
  {
    -[SFDrillDownMetadata cardIdentifier](self, "cardIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDrillDownMetadata cardIdentifier](v5, "cardIdentifier");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v10;
    if (!objc_msgSend(v10, "isEqual:"))
    {
      memset(v100, 0, 44);
      memset(v105, 0, sizeof(v105));
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      HIDWORD(v100[5]) = 1;
      goto LABEL_15;
    }
  }
  -[SFDrillDownMetadata cardIdentifiers](self, "cardIdentifiers");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDrillDownMetadata cardIdentifiers](v5, "cardIdentifiers");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v100[5]) = v9;
  if ((v97 == 0) == (v96 != 0))
  {
    v99 = 0uLL;
    memset(v100, 0, 36);
    memset(v105, 0, sizeof(v105));
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    *(_QWORD *)((char *)&v100[4] + 4) = 1;
    goto LABEL_15;
  }
  -[SFDrillDownMetadata cardIdentifiers](self, "cardIdentifiers");
  v19 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v105[3]) = v19 != 0;
  v93 = (void *)v19;
  if (v19)
  {
    -[SFDrillDownMetadata cardIdentifiers](self, "cardIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDrillDownMetadata cardIdentifiers](v5, "cardIdentifiers");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v20;
    if (!objc_msgSend(v20, "isEqual:"))
    {
      memset(v100, 0, 32);
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      memset(v105, 0, 28);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      HIDWORD(v105[3]) = 1;
      goto LABEL_15;
    }
  }
  -[SFDrillDownMetadata cardDomains](self, "cardDomains");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDrillDownMetadata cardDomains](v5, "cardDomains");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v92 == 0) == (v91 != 0))
  {
    memset(v100, 0, 24);
    v99 = 0uLL;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    memset(v105, 0, 28);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 1;
    goto LABEL_15;
  }
  -[SFDrillDownMetadata cardDomains](self, "cardDomains");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v105[3]) = v88 != 0;
  if (v88)
  {
    -[SFDrillDownMetadata cardDomains](self, "cardDomains");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDrillDownMetadata cardDomains](v5, "cardDomains");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v29;
    if (!objc_msgSend(v29, "isEqual:"))
    {
      memset(v100, 0, 24);
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      memset(v105, 0, 24);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      LODWORD(v105[3]) = 1;
      goto LABEL_15;
    }
  }
  -[SFDrillDownMetadata qtype](self, "qtype");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDrillDownMetadata qtype](v5, "qtype");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v87 == 0) == (v86 != 0))
  {
    v100[0] = 0;
    v100[1] = 0;
    v99 = 0uLL;
    v11 = 0;
    v12 = 0;
    memset(v105, 0, 24);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 1;
    goto LABEL_15;
  }
  -[SFDrillDownMetadata qtype](self, "qtype");
  v30 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v105[2]) = v30 != 0;
  v83 = (void *)v30;
  if (v30)
  {
    -[SFDrillDownMetadata qtype](self, "qtype");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDrillDownMetadata qtype](v5, "qtype");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      v100[0] = 0;
      v100[1] = 0;
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      memset(v105, 0, 20);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      HIDWORD(v105[2]) = 1;
      goto LABEL_15;
    }
  }
  -[SFDrillDownMetadata viewConfigName](self, "viewConfigName");
  v32 = objc_claimAutoreleasedReturnValue();
  -[SFDrillDownMetadata viewConfigName](v5, "viewConfigName");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)v32;
  if ((v32 == 0) == (v81 != 0))
  {
    v100[0] = 0;
    v99 = 0uLL;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    memset(v105, 0, 20);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 1;
    goto LABEL_15;
  }
  -[SFDrillDownMetadata viewConfigName](self, "viewConfigName");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33 != 0;
  v78 = (void *)v33;
  if (v33)
  {
    -[SFDrillDownMetadata viewConfigName](self, "viewConfigName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDrillDownMetadata viewConfigName](v5, "viewConfigName");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      v100[0] = 0;
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      memset(v105, 0, 20);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      LODWORD(v100[5]) = 1;
      goto LABEL_15;
    }
    LODWORD(v100[5]) = v34;
  }
  else
  {
    LODWORD(v100[5]) = 0;
  }
  -[SFDrillDownMetadata cardOnlyMetadata](self, "cardOnlyMetadata");
  v36 = objc_claimAutoreleasedReturnValue();
  -[SFDrillDownMetadata cardOnlyMetadata](v5, "cardOnlyMetadata");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)v36;
  if ((v36 == 0) == (v76 != 0))
  {
    v100[0] = 0;
    *(_QWORD *)((char *)&v99 + 4) = 0;
    LODWORD(v99) = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    memset(v105, 0, 20);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    goto LABEL_15;
  }
  -[SFDrillDownMetadata cardOnlyMetadata](self, "cardOnlyMetadata");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v105[2]) = v73 != 0;
  if (v73)
  {
    -[SFDrillDownMetadata cardOnlyMetadata](self, "cardOnlyMetadata");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDrillDownMetadata cardOnlyMetadata](v5, "cardOnlyMetadata");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v37;
    if (!objc_msgSend(v37, "isEqual:"))
    {
      *(_QWORD *)((char *)&v99 + 4) = 0;
      v100[0] = 0x100000000;
      v105[0] = 0;
      v105[1] = 0;
      LODWORD(v99) = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      HIDWORD(v99) = 1;
      LODWORD(v105[2]) = 1;
      goto LABEL_15;
    }
  }
  -[SFDrillDownMetadata entitySearchOnlyMetadata](self, "entitySearchOnlyMetadata");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDrillDownMetadata entitySearchOnlyMetadata](v5, "entitySearchOnlyMetadata");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v72 == 0) == (v71 != 0))
  {
    v100[0] = 0x100000000;
    v105[0] = 0;
    v105[1] = 0;
    *(_QWORD *)&v99 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    *((_QWORD *)&v99 + 1) = 0x100000001;
    goto LABEL_15;
  }
  -[SFDrillDownMetadata entitySearchOnlyMetadata](self, "entitySearchOnlyMetadata");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v105[1]) = v68 != 0;
  if (v68)
  {
    -[SFDrillDownMetadata entitySearchOnlyMetadata](self, "entitySearchOnlyMetadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDrillDownMetadata entitySearchOnlyMetadata](v5, "entitySearchOnlyMetadata");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v38;
    if (!objc_msgSend(v38, "isEqual:"))
    {
      *(_QWORD *)&v99 = 0;
      v11 = 0;
      *(_QWORD *)((char *)v105 + 4) = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      LODWORD(v105[0]) = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      *((_QWORD *)&v99 + 1) = 0x100000001;
      v100[0] = 0x100000001;
      HIDWORD(v105[1]) = 1;
      goto LABEL_15;
    }
  }
  -[SFDrillDownMetadata cardSearchMetadata](self, "cardSearchMetadata");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDrillDownMetadata cardSearchMetadata](v5, "cardSearchMetadata");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v67 == 0) == (v66 != 0))
  {
    v11 = 0;
    *(_QWORD *)((char *)v105 + 4) = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    LODWORD(v105[0]) = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    v100[0] = 0x100000001;
    *(_QWORD *)((char *)&v99 + 4) = 0x100000000;
    LODWORD(v99) = 1;
    goto LABEL_15;
  }
  -[SFDrillDownMetadata cardSearchMetadata](self, "cardSearchMetadata");
  v39 = objc_claimAutoreleasedReturnValue();
  LODWORD(v105[1]) = v39 != 0;
  v63 = (void *)v39;
  v46 = v5;
  if (!v39
    || (-[SFDrillDownMetadata cardSearchMetadata](self, "cardSearchMetadata"),
        v40 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SFDrillDownMetadata cardSearchMetadata](v5, "cardSearchMetadata"),
        v59 = (void *)objc_claimAutoreleasedReturnValue(),
        v60 = v40,
        objc_msgSend(v40, "isEqual:")))
  {
    -[SFDrillDownMetadata entitySearchMetadata](self, "entitySearchMetadata");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDrillDownMetadata entitySearchMetadata](v5, "entitySearchMetadata");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v62 == 0) == (v61 != 0))
    {
      v12 = 0;
      v105[0] = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      *((_QWORD *)&v99 + 1) = 0x100000001;
      v100[0] = 0x100000001;
      v11 = 1;
      *(_QWORD *)&v99 = 0x100000001;
    }
    else
    {
      -[SFDrillDownMetadata entitySearchMetadata](self, "entitySearchMetadata");
      v41 = objc_claimAutoreleasedReturnValue();
      HIDWORD(v105[0]) = v41 != 0;
      v58 = (void *)v41;
      if (!v41
        || (-[SFDrillDownMetadata entitySearchMetadata](self, "entitySearchMetadata"),
            v42 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFDrillDownMetadata entitySearchMetadata](v46, "entitySearchMetadata"),
            v54 = (void *)objc_claimAutoreleasedReturnValue(),
            v55 = v42,
            objc_msgSend(v42, "isEqual:")))
      {
        -[SFDrillDownMetadata debugParams](self, "debugParams");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDrillDownMetadata debugParams](v46, "debugParams");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v57 == 0) == (v56 != 0))
        {
          v14 = 0;
          LODWORD(v105[0]) = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v100[4] = 0x100000001;
          v100[3] = 0x100000001;
          v100[2] = 0x100000001;
          v100[1] = 0x100000001;
          *((_QWORD *)&v99 + 1) = 0x100000001;
          v100[0] = 0x100000001;
          *(_QWORD *)&v99 = 0x100000001;
          v11 = 1;
          v12 = 1;
          v13 = 1;
        }
        else
        {
          -[SFDrillDownMetadata debugParams](self, "debugParams");
          v43 = objc_claimAutoreleasedReturnValue();
          LODWORD(v105[0]) = v43 != 0;
          v53 = (void *)v43;
          if (!v43
            || (-[SFDrillDownMetadata debugParams](self, "debugParams"),
                v44 = (void *)objc_claimAutoreleasedReturnValue(),
                -[SFDrillDownMetadata debugParams](v46, "debugParams"),
                v49 = (void *)objc_claimAutoreleasedReturnValue(),
                v50 = v44,
                objc_msgSend(v44, "isEqual:")))
          {
            -[SFDrillDownMetadata params](self, "params");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFDrillDownMetadata params](v46, "params");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v52 == 0) == (v51 != 0))
            {
              v16 = 0;
              v17 = 0;
              v18 = 0;
              v100[4] = 0x100000001;
              v100[3] = 0x100000001;
              v100[2] = 0x100000001;
              v100[1] = 0x100000001;
              *((_QWORD *)&v99 + 1) = 0x100000001;
              v100[0] = 0x100000001;
              *(_QWORD *)&v99 = 0x100000001;
              v11 = 1;
              v12 = 1;
              v13 = 1;
              v14 = 1;
              v15 = 1;
            }
            else
            {
              -[SFDrillDownMetadata params](self, "params");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (v48)
              {
                -[SFDrillDownMetadata params](self, "params");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v5 = v46;
                -[SFDrillDownMetadata params](v46, "params");
                v7 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v45;
                v18 = objc_msgSend(v45, "isEqual:", v7);
                v17 = 1;
                v100[4] = 0x100000001;
                v100[3] = 0x100000001;
                v100[2] = 0x100000001;
                v100[1] = 0x100000001;
                *((_QWORD *)&v99 + 1) = 0x100000001;
                v100[0] = 0x100000001;
                *(_QWORD *)&v99 = 0x100000001;
                v11 = 1;
                v12 = 1;
                v13 = 1;
                v14 = 1;
                v15 = 1;
                v16 = 1;
                goto LABEL_15;
              }
              v48 = 0;
              v17 = 0;
              v100[4] = 0x100000001;
              v100[3] = 0x100000001;
              v100[2] = 0x100000001;
              v100[1] = 0x100000001;
              *((_QWORD *)&v99 + 1) = 0x100000001;
              v100[0] = 0x100000001;
              *(_QWORD *)&v99 = 0x100000001;
              v11 = 1;
              v12 = 1;
              v13 = 1;
              v14 = 1;
              v15 = 1;
              v16 = 1;
              v18 = 1;
            }
          }
          else
          {
            v15 = 0;
            v16 = 0;
            v17 = 0;
            v18 = 0;
            v100[4] = 0x100000001;
            v100[3] = 0x100000001;
            v100[2] = 0x100000001;
            v100[1] = 0x100000001;
            *((_QWORD *)&v99 + 1) = 0x100000001;
            v100[0] = 0x100000001;
            *(_QWORD *)&v99 = 0x100000001;
            v11 = 1;
            v12 = 1;
            v13 = 1;
            v14 = 1;
            LODWORD(v105[0]) = 1;
          }
        }
      }
      else
      {
        v13 = 0;
        v14 = 0;
        v105[0] = 0x100000000;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v100[4] = 0x100000001;
        v100[3] = 0x100000001;
        v100[2] = 0x100000001;
        v100[1] = 0x100000001;
        *((_QWORD *)&v99 + 1) = 0x100000001;
        v100[0] = 0x100000001;
        *(_QWORD *)&v99 = 0x100000001;
        v11 = 1;
        v12 = 1;
      }
    }
  }
  else
  {
    v12 = 0;
    v105[0] = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    v100[0] = 0x100000001;
    *(_QWORD *)((char *)&v99 + 4) = 0x100000000;
    LODWORD(v99) = 1;
    v11 = 1;
    LODWORD(v105[1]) = 1;
  }
  v5 = v46;
LABEL_15:
  if (v17)
  {
    v21 = v5;
    v22 = v11;
    v23 = v13;
    v24 = v12;
    v25 = v14;
    v26 = v15;
    v27 = v16;

    v16 = v27;
    v15 = v26;
    v14 = v25;
    v12 = v24;
    v13 = v23;
    v11 = v22;
    v5 = v21;
  }
  if (v16)

  if (v15)
  {

  }
  if (LODWORD(v105[0]))
  {

    if (!v14)
      goto LABEL_23;
LABEL_80:

    if (!v13)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (v14)
    goto LABEL_80;
LABEL_23:
  if (v13)
  {
LABEL_24:

  }
LABEL_25:
  if (HIDWORD(v105[0]))
  {

  }
  if (v12)

  if (DWORD1(v99))
  {

  }
  if (LODWORD(v105[1]))
  {

  }
  if (v11)

  if ((_DWORD)v99)
  {

  }
  if (HIDWORD(v105[1]))
  {

  }
  if (LODWORD(v100[0]))

  if (DWORD2(v99))
  {

  }
  if (LODWORD(v105[2]))
  {

  }
  if (HIDWORD(v100[0]))

  if (HIDWORD(v99))
  {

  }
  if (LODWORD(v100[5]))
  {

  }
  if (HIDWORD(v100[1]))

  if (LODWORD(v100[1]))
  {

  }
  if (HIDWORD(v105[2]))
  {

  }
  if (HIDWORD(v100[2]))

  if (LODWORD(v100[2]))
  {

  }
  if (LODWORD(v105[3]))
  {

  }
  if (HIDWORD(v100[3]))

  if (LODWORD(v100[3]))
  {

  }
  if (HIDWORD(v105[3]))
  {

  }
  if (LODWORD(v100[4]))

  if (HIDWORD(v100[4]))
  {

  }
  if (HIDWORD(v100[5]))
  {

  }
  if (v102 != v101)

LABEL_78:
  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v23;
  void *v24;
  void *v25;

  -[SFDrillDownMetadata cardIdentifier](self, "cardIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v25, "hash");
  -[SFDrillDownMetadata cardIdentifiers](self, "cardIdentifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v24, "hash") ^ v3;
  -[SFDrillDownMetadata cardDomains](self, "cardDomains");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v23, "hash");
  -[SFDrillDownMetadata qtype](self, "qtype");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ v5 ^ objc_msgSend(v6, "hash");
  -[SFDrillDownMetadata viewConfigName](self, "viewConfigName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[SFDrillDownMetadata cardOnlyMetadata](self, "cardOnlyMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[SFDrillDownMetadata entitySearchOnlyMetadata](self, "entitySearchOnlyMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7 ^ v11 ^ objc_msgSend(v12, "hash");
  -[SFDrillDownMetadata cardSearchMetadata](self, "cardSearchMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[SFDrillDownMetadata entitySearchMetadata](self, "entitySearchMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[SFDrillDownMetadata debugParams](self, "debugParams");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  -[SFDrillDownMetadata params](self, "params");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v13 ^ v19 ^ objc_msgSend(v20, "hash");

  return v21;
}

- (NSString)cardIdentifier
{
  return self->_cardIdentifier;
}

- (void)setCardIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)cardIdentifiers
{
  return self->_cardIdentifiers;
}

- (void)setCardIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)cardDomains
{
  return self->_cardDomains;
}

- (void)setCardDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)qtype
{
  return self->_qtype;
}

- (void)setQtype:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)viewConfigName
{
  return self->_viewConfigName;
}

- (void)setViewConfigName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SFCardMetadata)cardOnlyMetadata
{
  return self->_cardOnlyMetadata;
}

- (SFEntitySearchMetadata)entitySearchOnlyMetadata
{
  return self->_entitySearchOnlyMetadata;
}

- (SFCardSearchMetadata)cardSearchMetadata
{
  return self->_cardSearchMetadata;
}

- (SFEntitySearchMetadata)entitySearchMetadata
{
  return self->_entitySearchMetadata;
}

- (NSString)debugParams
{
  return self->_debugParams;
}

- (void)setDebugParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_debugParams, 0);
  objc_storeStrong((id *)&self->_entitySearchMetadata, 0);
  objc_storeStrong((id *)&self->_cardSearchMetadata, 0);
  objc_storeStrong((id *)&self->_entitySearchOnlyMetadata, 0);
  objc_storeStrong((id *)&self->_cardOnlyMetadata, 0);
  objc_storeStrong((id *)&self->_viewConfigName, 0);
  objc_storeStrong((id *)&self->_qtype, 0);
  objc_storeStrong((id *)&self->_cardDomains, 0);
  objc_storeStrong((id *)&self->_cardIdentifiers, 0);
  objc_storeStrong((id *)&self->_cardIdentifier, 0);
}

- (SFDrillDownMetadata)initWithProtobuf:(id)a3
{
  id v4;
  SFDrillDownMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  SFCardMetadata *v27;
  void *v28;
  SFCardMetadata *v29;
  void *v30;
  SFEntitySearchMetadata *v31;
  void *v32;
  SFEntitySearchMetadata *v33;
  void *v34;
  SFCardSearchMetadata *v35;
  void *v36;
  SFCardSearchMetadata *v37;
  void *v38;
  SFEntitySearchMetadata *v39;
  void *v40;
  SFEntitySearchMetadata *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  SFDrillDownMetadata *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)SFDrillDownMetadata;
  v5 = -[SFDrillDownMetadata init](&v56, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "cardIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "cardIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDrillDownMetadata setCardIdentifier:](v5, "setCardIdentifier:", v7);

    }
    objc_msgSend(v4, "cardIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v9 = 0;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v4, "cardIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v53 != v13)
            objc_enumerationMutation(v10);
          if (*(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i))
            objc_msgSend(v9, "addObject:");
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v12);
    }

    -[SFDrillDownMetadata setCardIdentifiers:](v5, "setCardIdentifiers:", v9);
    objc_msgSend(v4, "cardDomains");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v16 = 0;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v4, "cardDomains", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v49 != v20)
            objc_enumerationMutation(v17);
          if (*(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j))
            objc_msgSend(v16, "addObject:");
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v19);
    }

    -[SFDrillDownMetadata setCardDomains:](v5, "setCardDomains:", v16);
    objc_msgSend(v4, "qtype");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "qtype");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDrillDownMetadata setQtype:](v5, "setQtype:", v23);

    }
    objc_msgSend(v4, "viewConfigName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "viewConfigName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDrillDownMetadata setViewConfigName:](v5, "setViewConfigName:", v25);

    }
    objc_msgSend(v4, "cardOnlyMetadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [SFCardMetadata alloc];
      objc_msgSend(v4, "cardOnlyMetadata");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[SFCardMetadata initWithProtobuf:](v27, "initWithProtobuf:", v28);
      -[SFDrillDownMetadata setCardOnlyMetadata:](v5, "setCardOnlyMetadata:", v29);

    }
    objc_msgSend(v4, "entitySearchOnlyMetadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [SFEntitySearchMetadata alloc];
      objc_msgSend(v4, "entitySearchOnlyMetadata");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[SFEntitySearchMetadata initWithProtobuf:](v31, "initWithProtobuf:", v32);
      -[SFDrillDownMetadata setEntitySearchOnlyMetadata:](v5, "setEntitySearchOnlyMetadata:", v33);

    }
    objc_msgSend(v4, "cardSearchMetadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [SFCardSearchMetadata alloc];
      objc_msgSend(v4, "cardSearchMetadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[SFCardSearchMetadata initWithProtobuf:](v35, "initWithProtobuf:", v36);
      -[SFDrillDownMetadata setCardSearchMetadata:](v5, "setCardSearchMetadata:", v37);

    }
    objc_msgSend(v4, "entitySearchMetadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [SFEntitySearchMetadata alloc];
      objc_msgSend(v4, "entitySearchMetadata");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[SFEntitySearchMetadata initWithProtobuf:](v39, "initWithProtobuf:", v40);
      -[SFDrillDownMetadata setEntitySearchMetadata:](v5, "setEntitySearchMetadata:", v41);

    }
    objc_msgSend(v4, "debugParams");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v4, "debugParams");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDrillDownMetadata setDebugParams:](v5, "setDebugParams:", v43);

    }
    objc_msgSend(v4, "params");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v4, "params");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDrillDownMetadata setParams:](v5, "setParams:", v45);

    }
    v46 = v5;

  }
  return v5;
}

@end
