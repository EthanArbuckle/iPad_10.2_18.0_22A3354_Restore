@implementation BRFieldContentSignature

- (BOOL)contentDiffersWithSignature:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (-[BRFieldContentSignature isEquivalentToSignature:](self, "isEquivalentToSignature:", v4))
  {
    v5 = 0;
  }
  else if (-[BRFieldContentSignature hasContentSignature](self, "hasContentSignature")
         && objc_msgSend(v4, "hasContentSignature"))
  {
    -[BRFieldContentSignature contentSignature](self, "contentSignature");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentSignature");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToData:", v7);

    v5 = v8 ^ 1;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)hasOnlyLocalEditsOnTopOfSignature:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  unint64_t v14;

  v6 = a3;
  -[BRFieldContentSignature etag](self, "etag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "etag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8
    || (-[BRFieldContentSignature etag](self, "etag"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "etag"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "isEqualToString:", v4)))
  {
    v9 = -[BRFieldContentSignature _localEditCounter](self, "_localEditCounter");
    v10 = objc_msgSend(v6, "_localEditCounter");
    if (v7 == v8)
    {

    }
    else
    {

    }
    if (v9 > v10)
    {
      v11 = 1;
      goto LABEL_17;
    }
  }
  else
  {

  }
  if (-[BRFieldContentSignature hasOldVersionIdentifier](self, "hasOldVersionIdentifier"))
  {
    -[BRFieldContentSignature _oldVersionEtag](self, "_oldVersionEtag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "etag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13
      || (-[BRFieldContentSignature _oldVersionEtag](self, "_oldVersionEtag"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "etag"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqualToString:", v4)))
    {
      v14 = -[BRFieldContentSignature _oldVersionLocalEditCounter](self, "_oldVersionLocalEditCounter");
      v11 = v14 > objc_msgSend(v6, "_localEditCounter");
      if (v12 == v13)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v11 = 0;
    }

    goto LABEL_16;
  }
  v11 = 0;
LABEL_17:

  return v11;
}

+ (unint64_t)localEditCounterFromVersionIdentifier:(id)a3
{
  void *v3;
  unint64_t v4;
  void *v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(";"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "objectAtIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "longLongValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)containsLocalEdits
{
  return -[BRFieldContentSignature _localEditCounter](self, "_localEditCounter") != 0;
}

- (unint64_t)_localEditCounter
{
  return objc_msgSend((id)objc_opt_class(), "localEditCounterFromVersionIdentifier:", self->_versionIdentifier);
}

- (unint64_t)_oldVersionLocalEditCounter
{
  return objc_msgSend((id)objc_opt_class(), "localEditCounterFromVersionIdentifier:", self->_oldVersionIdentifier);
}

- (id)etag
{
  return etagFromVersionIdentifier(self->_versionIdentifier);
}

- (id)_oldVersionEtag
{
  return etagFromVersionIdentifier(self->_oldVersionIdentifier);
}

- (BOOL)isPendingSignature
{
  void *v3;
  _BOOL4 v4;

  if (-[NSString length](self->_versionIdentifier, "length"))
  {
    -[BRFieldContentSignature etag](self, "etag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 || -[BRFieldContentSignature hasOldVersionIdentifier](self, "hasOldVersionIdentifier"))
      LOBYTE(v4) = 0;
    else
      v4 = !-[BRFieldContentSignature hasContentSignature](self, "hasContentSignature");

  }
  else if (-[BRFieldContentSignature hasOldVersionIdentifier](self, "hasOldVersionIdentifier"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    return !-[BRFieldContentSignature hasContentSignature](self, "hasContentSignature");
  }
  return v4;
}

- (BOOL)hasPopulatedVersionAndSignature
{
  _BOOL4 v3;

  if (-[NSString length](self->_versionIdentifier, "length")
    || (v3 = -[BRFieldContentSignature hasOldVersionIdentifier](self, "hasOldVersionIdentifier")))
  {
    LOBYTE(v3) = -[BRFieldContentSignature hasContentSignature](self, "hasContentSignature");
  }
  return v3;
}

- (BOOL)isEquivalentToSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  BRFieldContentSignature *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!areSignaturesEquivalent(self, v4))
    goto LABEL_12;
  if (!-[BRFieldContentSignature hasContentSignature](self, "hasContentSignature")
    || !objc_msgSend(v4, "hasContentSignature"))
  {
    goto LABEL_7;
  }
  -[BRFieldContentSignature contentSignature](self, "contentSignature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "brc_signatureIsPackage") & 1) == 0)
    goto LABEL_11;
  objc_msgSend(v4, "contentSignature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "brc_signatureIsPackage");

  if (!v7)
  {
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  -[BRFieldContentSignature contentSignature](self, "contentSignature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSignature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToData:", v9);

  if ((v10 & 1) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v14 = 138412802;
      v15 = self;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v5;
      _os_log_fault_impl(&dword_230455000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Signatures are equivalent but content is different %@ vs %@%@", (uint8_t *)&v14, 0x20u);
    }

LABEL_11:
    goto LABEL_12;
  }
LABEL_7:
  v11 = 1;
LABEL_13:

  return v11;
}

- (BRFieldContentSignature)initWithLocalVersion:(id)a3
{
  id v4;
  BRFieldContentSignature *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRFieldContentSignature;
  v5 = -[BRFieldContentSignature init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "oldVersionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRFieldContentSignature setOldVersionIdentifier:](v5, "setOldVersionIdentifier:", v6);

    objc_msgSend(v4, "contentSignature");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "brc_signatureIsPendingPlaceHolder"))
    {
      -[BRFieldContentSignature setContentSignature:](v5, "setContentSignature:", 0);
    }
    else
    {
      objc_msgSend(v4, "contentSignature");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRFieldContentSignature setContentSignature:](v5, "setContentSignature:", v8);

    }
    objc_msgSend(v4, "ckInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "etag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "localChangeCount");
    v12 = v10;
    v13 = v12;
    v14 = &stru_24FE4A790;
    if (v12)
      v14 = v12;
    v15 = v14;
    v16 = v15;
    if (v11)
    {
      -[__CFString stringByAppendingFormat:](v15, "stringByAppendingFormat:", CFSTR(";%llu"), v11);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }

    -[BRFieldContentSignature setVersionIdentifier:](v5, "setVersionIdentifier:", v16);
    -[BRFieldContentSignature setSize:](v5, "setSize:", objc_msgSend(v4, "size"));
  }

  return v5;
}

- (BRFieldContentSignature)initWithLoserEtag:(id)a3
{
  __CFString *v4;
  BRFieldContentSignature *v5;
  __CFString *v6;
  __CFString *v7;
  objc_super v9;

  v4 = (__CFString *)a3;
  v9.receiver = self;
  v9.super_class = (Class)BRFieldContentSignature;
  v5 = -[BRFieldContentSignature init](&v9, sel_init);
  if (v5)
  {
    v6 = &stru_24FE4A790;
    if (v4)
      v6 = v4;
    v7 = v6;
    -[BRFieldContentSignature setVersionIdentifier:](v5, "setVersionIdentifier:", v7);

  }
  return v5;
}

- (BOOL)isPackage
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[BRFieldContentSignature hasContentSignature](self, "hasContentSignature");
  if (v3)
  {
    -[BRFieldContentSignature contentSignature](self, "contentSignature");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "brc_signatureIsPackage");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)_initWithVersionIdentifier:(id)a3 size:(int64_t)a4 contentSignature:(id)a5
{
  return -[BRFieldContentSignature _initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:](self, "_initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:", a3, a4, 0, a5);
}

- (id)_initWithVersionIdentifier:(id)a3 size:(int64_t)a4 oldVersionIdentifier:(id)a5 contentSignature:(id)a6
{
  id v10;
  id v11;
  id v12;
  BRFieldContentSignature *v13;
  BRFieldContentSignature *v14;
  id v15;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BRFieldContentSignature;
  v13 = -[BRFieldContentSignature init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[BRFieldContentSignature setOldVersionIdentifier:](v13, "setOldVersionIdentifier:", v11);
    -[BRFieldContentSignature setVersionIdentifier:](v14, "setVersionIdentifier:", v10);
    -[BRFieldContentSignature setSize:](v14, "setSize:", a4);
    if (objc_msgSend(v12, "brc_signatureIsPendingPlaceHolder"))
      v15 = 0;
    else
      v15 = v12;
    -[BRFieldContentSignature setContentSignature:](v14, "setContentSignature:", v15);
  }

  return v14;
}

- (id)equivalentVersions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BRFieldContentSignature *v15;
  void *v16;
  id v17;
  BRFieldContentSignature *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  BRFieldContentSignature *v23;
  void *v24;
  int64_t v25;
  void *v26;
  id v27;
  BRFieldContentSignature *v28;
  void *v29;
  int64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  BRFieldContentSignature *v35;
  void *v36;
  BRFieldContentSignature *v37;
  void *v38;
  void *v39;
  void *v40;
  BRFieldContentSignature *v41;
  void *v42;
  int64_t v43;
  void *v44;
  BRFieldContentSignature *v45;
  void *v46;
  int64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  BRFieldContentSignature *v56;
  int64_t v57;
  void *v58;
  BRFieldContentSignature *v59;
  int64_t v60;
  void *v61;
  void *v62;
  void *v63;

  -[BRFieldContentSignature contentSignature](self, "contentSignature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
    v4 = (void *)objc_opt_class();
    -[BRFieldContentSignature versionIdentifier](self, "versionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "localEditCounterFromVersionIdentifier:", v5))
    {
      -[BRFieldContentSignature oldVersionIdentifier](self, "oldVersionIdentifier");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!v6)
      {

LABEL_19:
        v35 = [BRFieldContentSignature alloc];
        -[BRFieldContentSignature versionIdentifier](self, "versionIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[BRFieldContentSignature _initWithVersionIdentifier:size:contentSignature:](v35, "_initWithVersionIdentifier:size:contentSignature:", v36, -[BRFieldContentSignature size](self, "size"), 0);

        v37 = [BRFieldContentSignature alloc];
        -[BRFieldContentSignature versionIdentifier](self, "versionIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[BRFieldContentSignature _initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:](v37, "_initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:", v38, -[BRFieldContentSignature size](self, "size"), &stru_24FE4A790, 0);

        if (!-[BRFieldContentSignature isEqual:](self, "isEqual:", v27))
        {
          objc_msgSend(v27, "data");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v39);

        }
        if (!-[BRFieldContentSignature isEqual:](self, "isEqual:", v32))
        {
          objc_msgSend(v32, "data");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v40);

        }
        v41 = [BRFieldContentSignature alloc];
        -[BRFieldContentSignature versionIdentifier](self, "versionIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[BRFieldContentSignature size](self, "size");
        -[BRFieldContentSignature contentSignature](self, "contentSignature");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[BRFieldContentSignature _initWithVersionIdentifier:size:contentSignature:](v41, "_initWithVersionIdentifier:size:contentSignature:", v42, v43, v44);

        v45 = [BRFieldContentSignature alloc];
        -[BRFieldContentSignature versionIdentifier](self, "versionIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = -[BRFieldContentSignature size](self, "size");
        -[BRFieldContentSignature contentSignature](self, "contentSignature");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[BRFieldContentSignature _initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:](v45, "_initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:", v46, v47, &stru_24FE4A790, v48);

LABEL_31:
        if (!-[BRFieldContentSignature isEqual:](self, "isEqual:", v34))
        {
          objc_msgSend(v34, "data");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v62);

        }
        if (!-[BRFieldContentSignature isEqual:](self, "isEqual:", v49))
        {
          objc_msgSend(v49, "data");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v63);

        }
        goto LABEL_36;
      }
      v7 = (void *)v6;
      -[BRFieldContentSignature oldVersionIdentifier](self, "oldVersionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (!v9)
        goto LABEL_19;
    }
    else
    {

    }
    -[BRFieldContentSignature oldVersionIdentifier](self, "oldVersionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v12 = (void *)objc_opt_class();
      -[BRFieldContentSignature oldVersionIdentifier](self, "oldVersionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "localEditCounterFromVersionIdentifier:", v13);

      if (v14)
      {
        v15 = [BRFieldContentSignature alloc];
        -[BRFieldContentSignature oldVersionIdentifier](self, "oldVersionIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[BRFieldContentSignature _initWithVersionIdentifier:size:contentSignature:](v15, "_initWithVersionIdentifier:size:contentSignature:", v16, -[BRFieldContentSignature size](self, "size"), 0);

        v18 = [BRFieldContentSignature alloc];
        -[BRFieldContentSignature oldVersionIdentifier](self, "oldVersionIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[BRFieldContentSignature _initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:](v18, "_initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:", v19, -[BRFieldContentSignature size](self, "size"), &stru_24FE4A790, 0);

        if (!-[BRFieldContentSignature isEqual:](self, "isEqual:", v17))
        {
          objc_msgSend(v17, "data");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v21);

        }
        if (!-[BRFieldContentSignature isEqual:](self, "isEqual:", v20))
        {
          objc_msgSend(v20, "data");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v22);

        }
      }
      v23 = [BRFieldContentSignature alloc];
      -[BRFieldContentSignature oldVersionIdentifier](self, "oldVersionIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[BRFieldContentSignature size](self, "size");
      -[BRFieldContentSignature contentSignature](self, "contentSignature");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[BRFieldContentSignature _initWithVersionIdentifier:size:contentSignature:](v23, "_initWithVersionIdentifier:size:contentSignature:", v24, v25, v26);

      v28 = [BRFieldContentSignature alloc];
      -[BRFieldContentSignature oldVersionIdentifier](self, "oldVersionIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[BRFieldContentSignature size](self, "size");
      -[BRFieldContentSignature contentSignature](self, "contentSignature");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[BRFieldContentSignature _initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:](v28, "_initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:", v29, v30, &stru_24FE4A790, v31);

      if (!-[BRFieldContentSignature isEqual:](self, "isEqual:", v27))
      {
        objc_msgSend(v27, "data");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v33);

      }
      if (-[BRFieldContentSignature isEqual:](self, "isEqual:", v32))
        goto LABEL_37;
      objc_msgSend(v32, "data");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v34);
LABEL_36:

LABEL_37:
      return v3;
    }
    -[BRFieldContentSignature oldVersionIdentifier](self, "oldVersionIdentifier");
    v50 = objc_claimAutoreleasedReturnValue();
    if (!v50
      || (v51 = (void *)v50,
          -[BRFieldContentSignature oldVersionIdentifier](self, "oldVersionIdentifier"),
          v52 = (void *)objc_claimAutoreleasedReturnValue(),
          v53 = objc_msgSend(v52, "length"),
          v52,
          v51,
          !v53))
    {
      v27 = -[BRFieldContentSignature _initWithVersionIdentifier:size:contentSignature:]([BRFieldContentSignature alloc], "_initWithVersionIdentifier:size:contentSignature:", &stru_24FE4A790, -[BRFieldContentSignature size](self, "size"), 0);
      v32 = -[BRFieldContentSignature _initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:]([BRFieldContentSignature alloc], "_initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:", &stru_24FE4A790, -[BRFieldContentSignature size](self, "size"), &stru_24FE4A790, 0);
      if (!-[BRFieldContentSignature isEqual:](self, "isEqual:", v27))
      {
        objc_msgSend(v27, "data");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v54);

      }
      if (!-[BRFieldContentSignature isEqual:](self, "isEqual:", v32))
      {
        objc_msgSend(v32, "data");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v55);

      }
      v56 = [BRFieldContentSignature alloc];
      v57 = -[BRFieldContentSignature size](self, "size");
      -[BRFieldContentSignature contentSignature](self, "contentSignature");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[BRFieldContentSignature _initWithVersionIdentifier:size:contentSignature:](v56, "_initWithVersionIdentifier:size:contentSignature:", &stru_24FE4A790, v57, v58);

      v59 = [BRFieldContentSignature alloc];
      v60 = -[BRFieldContentSignature size](self, "size");
      -[BRFieldContentSignature contentSignature](self, "contentSignature");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[BRFieldContentSignature _initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:](v59, "_initWithVersionIdentifier:size:oldVersionIdentifier:contentSignature:", &stru_24FE4A790, v60, &stru_24FE4A790, v61);

      goto LABEL_31;
    }
  }
  return v3;
}

- (BOOL)hasContentSignature
{
  return self->_contentSignature != 0;
}

- (BOOL)hasOldVersionIdentifier
{
  return self->_oldVersionIdentifier != 0;
}

- (void)setSize:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSize
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)BRFieldContentSignature;
  -[BRFieldContentSignature description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRFieldContentSignature dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *contentSignature;
  NSString *oldVersionIdentifier;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  versionIdentifier = self->_versionIdentifier;
  if (versionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", versionIdentifier, CFSTR("versionIdentifier"));
  contentSignature = self->_contentSignature;
  if (contentSignature)
    objc_msgSend(v4, "setObject:forKey:", contentSignature, CFSTR("contentSignature"));
  oldVersionIdentifier = self->_oldVersionIdentifier;
  if (oldVersionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", oldVersionIdentifier, CFSTR("oldVersionIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_size);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("size"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldContentSignatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_versionIdentifier)
    -[BRFieldContentSignature writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteStringField();
  if (self->_contentSignature)
    PBDataWriterWriteDataField();
  if (self->_oldVersionIdentifier)
    PBDataWriterWriteStringField();
  v5 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setVersionIdentifier:", self->_versionIdentifier);
  if (self->_contentSignature)
    objc_msgSend(v4, "setContentSignature:");
  if (self->_oldVersionIdentifier)
    objc_msgSend(v4, "setOldVersionIdentifier:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_size;
    *((_BYTE *)v4 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_versionIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSData copyWithZone:](self->_contentSignature, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_oldVersionIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_size;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *versionIdentifier;
  NSData *contentSignature;
  NSString *oldVersionIdentifier;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  versionIdentifier = self->_versionIdentifier;
  if ((unint64_t)versionIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](versionIdentifier, "isEqual:"))
      goto LABEL_12;
  }
  contentSignature = self->_contentSignature;
  if ((unint64_t)contentSignature | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](contentSignature, "isEqual:"))
      goto LABEL_12;
  }
  oldVersionIdentifier = self->_oldVersionIdentifier;
  if ((unint64_t)oldVersionIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](oldVersionIdentifier, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0 && self->_size == *((_QWORD *)v4 + 1))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_versionIdentifier, "hash");
  v4 = -[NSData hash](self->_contentSignature, "hash");
  v5 = -[NSString hash](self->_oldVersionIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_size;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  int64_t *v5;

  v4 = (int64_t *)a3;
  v5 = v4;
  if (v4[4])
  {
    -[BRFieldContentSignature setVersionIdentifier:](self, "setVersionIdentifier:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[BRFieldContentSignature setContentSignature:](self, "setContentSignature:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[BRFieldContentSignature setOldVersionIdentifier:](self, "setOldVersionIdentifier:");
    v4 = v5;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_size = v4[1];
    *(_BYTE *)&self->_has |= 1u;
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

- (NSData)contentSignature
{
  return self->_contentSignature;
}

- (void)setContentSignature:(id)a3
{
  objc_storeStrong((id *)&self->_contentSignature, a3);
}

- (NSString)oldVersionIdentifier
{
  return self->_oldVersionIdentifier;
}

- (void)setOldVersionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_oldVersionIdentifier, a3);
}

- (int64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionIdentifier, 0);
  objc_storeStrong((id *)&self->_oldVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_contentSignature, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BRFieldContentSignature writeTo:]", "BRFieldContentSignature.m", 126, "nil != self->_versionIdentifier");
}

@end
