@implementation ICMediaUserState

- (ICMusicUserState)music
{
  return self->_music;
}

- (ICMediaUserState)initWithBlock:(id)a3
{
  void (**v4)(id, ICMediaUserState *);
  ICMediaUserState *v5;
  objc_super v7;

  v4 = (void (**)(id, ICMediaUserState *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ICMediaUserState;
  v5 = -[ICMediaUserState init](&v7, sel_init);
  if (v5)
  {
    v4[2](v4, v5);
    v5->_frozen = 1;
  }

  return v5;
}

- (id)copyWithBlock:(id)a3
{
  id v4;
  ICMediaUserState *v5;
  id v6;
  ICMediaUserState *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = [ICMediaUserState alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__ICMediaUserState_copyWithBlock___block_invoke;
  v9[3] = &unk_1E438C7F8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = -[ICMediaUserState initWithBlock:](v5, "initWithBlock:", v9);

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMediaUserState dsid](self, "dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCreateLoggableValueForDSID(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dsid"));

  -[ICMediaUserState homeUserIDs](self, "homeUserIDs");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("homeUserIds"));

  -[ICMediaUserState firstName](self, "firstName");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("firstName"));

  -[ICMediaUserState lastName](self, "lastName");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("lastName"));

  if (-[ICMediaUserState isActive](self, "isActive"))
    v15 = MEMORY[0x1E0C9AAB0];
  else
    v15 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isActive"));
  -[ICMediaUserState music](self, "music");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("music"));

  -[ICMediaUserState tv](self, "tv");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("tv"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p [%@]>"), objc_opt_class(), self, v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v22;
}

- (id)redactedDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ICMediaUserState firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> firstName=%@ isActive=%dl"), v4, self, v5, -[ICMediaUserState isActive](self, "isActive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ICMediaUserState *v4;
  ICMediaUserState *v5;
  id v6;
  id v7;
  int v8;
  BOOL v9;
  _BOOL4 v10;
  id v11;
  id v12;
  int v13;
  id v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  void *v27;
  int v28;
  id v29;
  id v30;
  void *v31;
  int v32;
  id v33;
  id v34;
  void *v35;
  int v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  _BOOL4 v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
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
  id v70;
  void *v71;

  v4 = (ICMediaUserState *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ICMediaUserState identifier](self, "identifier");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMediaUserState identifier](v5, "identifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
          goto LABEL_10;
      }
      v10 = -[ICMediaUserState isActive](self, "isActive");
      if (v10 != -[ICMediaUserState isActive](v5, "isActive"))
      {
LABEL_10:
        v9 = 0;
LABEL_62:

        goto LABEL_63;
      }
      -[ICMediaUserState dsid](self, "dsid");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMediaUserState dsid](v5, "dsid");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {

      }
      else
      {
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
        {
          v9 = 0;
LABEL_61:

          goto LABEL_62;
        }
      }
      -[ICMediaUserState alternateDSID](self, "alternateDSID");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMediaUserState alternateDSID](v5, "alternateDSID");
      v70 = (id)objc_claimAutoreleasedReturnValue();
      v71 = v14;
      if (v14 == v70)
      {

      }
      else
      {
        v15 = objc_msgSend(v14, "isEqual:", v70);

        if (!v15)
        {
          v9 = 0;
LABEL_60:

          goto LABEL_61;
        }
      }
      -[ICMediaUserState iCloudPersonID](self, "iCloudPersonID");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMediaUserState iCloudPersonID](v5, "iCloudPersonID");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v68 = v16;
      v69 = v17;
      if (v16 == v17)
      {

      }
      else
      {
        v18 = v17;
        v19 = objc_msgSend(v16, "isEqual:", v17);

        if (!v19)
        {
          v9 = 0;
          v20 = v68;
LABEL_59:

          goto LABEL_60;
        }
      }
      -[ICMediaUserState homeUserIDs](self, "homeUserIDs");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMediaUserState homeUserIDs](v5, "homeUserIDs");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v65 = v22;
      v66 = v21;
      if (v21 == v22)
      {

      }
      else
      {
        v23 = v22;
        v24 = objc_msgSend(v21, "isEqual:", v22);

        if (!v24)
        {
          v9 = 0;
          v20 = v68;
LABEL_58:

          goto LABEL_59;
        }
      }
      -[ICMediaUserState storefrontIdentifier](self, "storefrontIdentifier");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMediaUserState storefrontIdentifier](v5, "storefrontIdentifier");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v67 = v25;
      v63 = v26;
      if (v25 == v26)
      {

      }
      else
      {
        v27 = v26;
        v28 = objc_msgSend(v67, "isEqual:", v26);

        if (!v28)
        {
          v9 = 0;
          v20 = v68;
LABEL_57:

          goto LABEL_58;
        }
      }
      -[ICMediaUserState firstName](self, "firstName");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMediaUserState firstName](v5, "firstName");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v64 = v29;
      v61 = v30;
      if (v29 == v30)
      {

      }
      else
      {
        v31 = v30;
        v32 = objc_msgSend(v29, "isEqual:", v30);

        if (!v32)
        {
          v9 = 0;
          v20 = v68;
LABEL_56:

          goto LABEL_57;
        }
      }
      -[ICMediaUserState lastName](self, "lastName");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMediaUserState lastName](v5, "lastName");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v62 = v33;
      v60 = v34;
      if (v33 == v34)
      {

      }
      else
      {
        v35 = v34;
        v36 = objc_msgSend(v62, "isEqual:", v34);

        if (!v36)
        {
          v9 = 0;
          v20 = v68;
LABEL_55:

          goto LABEL_56;
        }
      }
      -[ICMediaUserState username](self, "username");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMediaUserState username](v5, "username");
      v38 = (id)objc_claimAutoreleasedReturnValue();
      v59 = v38;
      if (v37 == v38)
      {

      }
      else
      {
        v39 = v38;
        v40 = v37;
        v41 = v37;
        v42 = v39;
        v43 = objc_msgSend(v40, "isEqual:", v39);

        v37 = v41;
        if (!v43)
          goto LABEL_44;
      }
      v44 = -[ICMediaUserState ageVerificationRequired](self, "ageVerificationRequired");
      if (v44 != -[ICMediaUserState ageVerificationRequired](v5, "ageVerificationRequired"))
      {
LABEL_44:
        v9 = 0;
        v20 = v68;
LABEL_54:

        goto LABEL_55;
      }
      -[ICMediaUserState music](self, "music");
      v45 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMediaUserState music](v5, "music");
      v46 = (id)objc_claimAutoreleasedReturnValue();
      v58 = v46;
      if (v45 == v46)
      {

      }
      else
      {
        v47 = v46;
        v48 = v45;
        v56 = v45;
        v49 = v47;
        v50 = objc_msgSend(v48, "isEqual:", v47);

        v45 = v56;
        if (!v50)
        {
          v9 = 0;
          v20 = v68;
LABEL_53:

          goto LABEL_54;
        }
      }
      -[ICMediaUserState tv](self, "tv");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICMediaUserState tv](v5, "tv");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v51;
      if (v51 == v52)
      {
        v9 = 1;
      }
      else
      {
        v53 = v52;
        v54 = objc_msgSend(v51, "isEqual:", v52);
        v52 = v53;
        v9 = v54;
      }
      v20 = v68;

      goto LABEL_53;
    }
    v9 = 0;
  }
LABEL_63:

  return v9;
}

- (NSString)digest
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  NSString *v7;
  NSInteger v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  NSString *v24;
  NSArray *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSString *v41;
  NSString *v42;
  NSString *v43;
  NSString *v44;
  ICMusicUserState *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;

  v3 = MSVHasherSharedSeed();
  v104 = v3 ^ 0x736F6D6570736575;
  v108 = v4 ^ 0x646F72616E646F6DLL;
  v112 = v3 ^ 0x6C7967656E657261;
  v116 = v4 ^ 0x7465646279746573;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "UTF8String");
  objc_msgSend(v6, "length");

  v7 = objc_retainAutorelease(self->_identifier);
  -[NSString UTF8String](v7, "UTF8String");
  -[NSString length](v7, "length");

  v120 = self->_isActive + 0x400000000000000;
  v8 = -[NSNumber integerValue](self->_dsid, "integerValue");
  v9 = v120;
  if ((v120 & 0x400000000000000) != 0)
  {
    if ((v120 & 0x300000000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "handleFailureInFunction:file:lineNumber:description:", v99, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v120);

      v9 = v120;
    }
    v16 = v9 & 0xFFFFFFFFFFFFFFLL | (v8 << 32);
    v17 = (v104 + v108) ^ __ROR8__(v108, 51);
    v18 = v112 + (v16 ^ v116);
    v19 = __ROR8__(v16 ^ v116, 48);
    v20 = (v18 ^ v19) + __ROR8__(v104 + v108, 32);
    v21 = v20 ^ __ROR8__(v18 ^ v19, 43);
    v22 = v18 + v17;
    v113 = __ROR8__(v22, 32);
    v117 = v21;
    v105 = v20 ^ v16;
    v109 = v22 ^ __ROR8__(v17, 47);
    v9 = v9 & 0xFF00000000000000 | HIDWORD(v8);
  }
  else
  {
    if ((v120 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "handleFailureInFunction:file:lineNumber:description:", v93, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v120);

      v9 = v120;
    }
    v10 = (v104 + v108) ^ __ROR8__(v108, 51);
    v11 = v112 + (v116 ^ v8);
    v12 = __ROR8__(v116 ^ v8, 48);
    v13 = (v11 ^ v12) + __ROR8__(v104 + v108, 32);
    v14 = v13 ^ __ROR8__(v11 ^ v12, 43);
    v15 = v11 + v10;
    v113 = __ROR8__(v15, 32);
    v117 = v14;
    v105 = v13 ^ v8;
    v109 = v15 ^ __ROR8__(v10, 47);
  }
  v121 = v9 + 0x800000000000000;
  v23 = objc_retainAutorelease(self->_alternateDSID);
  -[NSString UTF8String](v23, "UTF8String");
  -[NSString length](v23, "length");

  v24 = objc_retainAutorelease(self->_iCloudPersonID);
  -[NSString UTF8String](v24, "UTF8String");
  -[NSString length](v24, "length");

  v25 = self->_homeUserIDs;
  v26 = -[NSArray hash](v25, "hash");
  v27 = v121;
  if ((v121 & 0x400000000000000) != 0)
  {
    if ((v121 & 0x300000000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "handleFailureInFunction:file:lineNumber:description:", v101, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v121);

      v27 = v121;
    }
    v34 = v27 & 0xFFFFFFFFFFFFFFLL | (v26 << 32);
    v35 = (v105 + v109) ^ __ROR8__(v109, 51);
    v36 = v113 + (v34 ^ v117);
    v37 = __ROR8__(v34 ^ v117, 48);
    v38 = (v36 ^ v37) + __ROR8__(v105 + v109, 32);
    v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
    v40 = v36 + v35;
    v114 = __ROR8__(v40, 32);
    v118 = v39;
    v106 = v38 ^ v34;
    v110 = v40 ^ __ROR8__(v35, 47);
    v27 = v27 & 0xFF00000000000000 | HIDWORD(v26);
  }
  else
  {
    if ((v121 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "handleFailureInFunction:file:lineNumber:description:", v95, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v121);

      v27 = v121;
    }
    v28 = (v105 + v109) ^ __ROR8__(v109, 51);
    v29 = v113 + (v117 ^ v26);
    v30 = __ROR8__(v117 ^ v26, 48);
    v31 = (v29 ^ v30) + __ROR8__(v105 + v109, 32);
    v32 = v31 ^ __ROR8__(v29 ^ v30, 43);
    v33 = v29 + v28;
    v114 = __ROR8__(v33, 32);
    v118 = v32;
    v106 = v31 ^ v26;
    v110 = v33 ^ __ROR8__(v28, 47);
  }
  v122 = v27 + 0x800000000000000;

  v41 = objc_retainAutorelease(self->_storefrontIdentifier);
  -[NSString UTF8String](v41, "UTF8String");
  -[NSString length](v41, "length");

  v42 = objc_retainAutorelease(self->_firstName);
  -[NSString UTF8String](v42, "UTF8String");
  -[NSString length](v42, "length");

  v43 = objc_retainAutorelease(self->_lastName);
  -[NSString UTF8String](v43, "UTF8String");
  -[NSString length](v43, "length");

  v44 = objc_retainAutorelease(self->_username);
  -[NSString UTF8String](v44, "UTF8String");
  -[NSString length](v44, "length");

  v45 = self->_music;
  v46 = -[ICMusicUserState hash](v45, "hash");
  v47 = v122;
  if ((v122 & 0x400000000000000) != 0)
  {
    if ((v122 & 0x300000000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "handleFailureInFunction:file:lineNumber:description:", v103, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v122);

      v47 = v122;
    }
    v54 = v47 & 0xFFFFFFFFFFFFFFLL | (v46 << 32);
    v55 = (v106 + v110) ^ __ROR8__(v110, 51);
    v56 = v114 + (v54 ^ v118);
    v57 = __ROR8__(v54 ^ v118, 48);
    v58 = (v56 ^ v57) + __ROR8__(v106 + v110, 32);
    v59 = v58 ^ __ROR8__(v56 ^ v57, 43);
    v60 = v56 + v55;
    v115 = __ROR8__(v60, 32);
    v119 = v59;
    v107 = v58 ^ v54;
    v111 = v60 ^ __ROR8__(v55, 47);
    v47 = v47 & 0xFF00000000000000 | HIDWORD(v46);
  }
  else
  {
    if ((v122 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "handleFailureInFunction:file:lineNumber:description:", v97, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v122);

      v47 = v122;
    }
    v48 = (v106 + v110) ^ __ROR8__(v110, 51);
    v49 = v114 + (v118 ^ v46);
    v50 = __ROR8__(v118 ^ v46, 48);
    v51 = (v49 ^ v50) + __ROR8__(v106 + v110, 32);
    v52 = v51 ^ __ROR8__(v49 ^ v50, 43);
    v53 = v49 + v48;
    v115 = __ROR8__(v53, 32);
    v119 = v52;
    v107 = v51 ^ v46;
    v111 = v53 ^ __ROR8__(v48, 47);
  }
  v123 = v47 + 0x800000000000000;

  v61 = (v107 + v111) ^ __ROR8__(v111, 51);
  v62 = v115 + (v119 ^ v123);
  v63 = __ROR8__(v119 ^ v123, 48);
  v64 = (v62 ^ v63) + __ROR8__(v107 + v111, 32);
  v65 = v64 ^ __ROR8__(v62 ^ v63, 43);
  v66 = v62 + v61;
  v67 = v66 ^ __ROR8__(v61, 47);
  v68 = (v64 ^ v123) + v67;
  v69 = v68 ^ __ROR8__(v67, 51);
  v70 = (__ROR8__(v66, 32) ^ 0xFFLL) + v65;
  v71 = __ROR8__(v65, 48);
  v72 = __ROR8__(v68, 32) + (v70 ^ v71);
  v73 = v72 ^ __ROR8__(v70 ^ v71, 43);
  v74 = v69 + v70;
  v75 = v74 ^ __ROR8__(v69, 47);
  v76 = v75 + v72;
  v77 = v76 ^ __ROR8__(v75, 51);
  v78 = __ROR8__(v74, 32) + v73;
  v79 = __ROR8__(v73, 48);
  v80 = __ROR8__(v76, 32) + (v78 ^ v79);
  v81 = v80 ^ __ROR8__(v78 ^ v79, 43);
  v82 = v77 + v78;
  v83 = v82 ^ __ROR8__(v77, 47);
  v84 = v83 + v80;
  v85 = v84 ^ __ROR8__(v83, 51);
  v86 = __ROR8__(v82, 32) + v81;
  v87 = __ROR8__(v81, 48);
  v88 = __ROR8__(v84, 32) + (v86 ^ v87);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (v85 + v86) ^ __ROR8__(v85, 47) ^ v88 ^ __ROR8__(v85 + v86, 32) ^ v88 ^ __ROR8__(v86 ^ v87, 43));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "stringValue");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v90;
}

- (NSString)shortDebugName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICMediaUserState username](self, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMediaUserState identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"%@\" (%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shortDebugName, CFSTR("shortDebugName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isActive, CFSTR("isActive"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dsid, CFSTR("dsid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternateDSID, CFSTR("alternateDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iCloudPersonID, CFSTR("iCloudPersonID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeUserIDs, CFSTR("homeUserIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storefrontIdentifier, CFSTR("storefrontIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstName, CFSTR("firstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastName, CFSTR("lastName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_username, CFSTR("username"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ageVerificationRequired, CFSTR("ageVerificationRequired"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_music, CFSTR("music"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tv, CFSTR("tv"));

}

- (ICMediaUserState)initWithCoder:(id)a3
{
  id v4;
  ICMediaUserState *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *shortDebugName;
  uint64_t v10;
  NSNumber *dsid;
  uint64_t v12;
  NSString *alternateDSID;
  uint64_t v14;
  NSString *iCloudPersonID;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *homeUserIDs;
  uint64_t v21;
  NSString *storefrontIdentifier;
  uint64_t v23;
  NSString *countryCode;
  uint64_t v25;
  NSString *firstName;
  uint64_t v27;
  NSString *lastName;
  uint64_t v29;
  NSString *username;
  uint64_t v31;
  ICMusicUserState *music;
  uint64_t v33;
  ICTVUserState *tv;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ICMediaUserState;
  v5 = -[ICMediaUserState init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortDebugName"));
    v8 = objc_claimAutoreleasedReturnValue();
    shortDebugName = v5->_shortDebugName;
    v5->_shortDebugName = (NSString *)v8;

    v5->_isActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isActive"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dsid"));
    v10 = objc_claimAutoreleasedReturnValue();
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alternateDSID"));
    v12 = objc_claimAutoreleasedReturnValue();
    alternateDSID = v5->_alternateDSID;
    v5->_alternateDSID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iCloudPersonID"));
    v14 = objc_claimAutoreleasedReturnValue();
    iCloudPersonID = v5->_iCloudPersonID;
    v5->_iCloudPersonID = (NSString *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("homeUserIDs"));
    v19 = objc_claimAutoreleasedReturnValue();
    homeUserIDs = v5->_homeUserIDs;
    v5->_homeUserIDs = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storefrontIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    storefrontIdentifier = v5->_storefrontIdentifier;
    v5->_storefrontIdentifier = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v23 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v25 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v27 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("username"));
    v29 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v29;

    v5->_ageVerificationRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ageVerificationRequired"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("music"));
    v31 = objc_claimAutoreleasedReturnValue();
    music = v5->_music;
    v5->_music = (ICMusicUserState *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tv"));
    v33 = objc_claimAutoreleasedReturnValue();
    tv = v5->_tv;
    v5->_tv = (ICTVUserState *)v33;

  }
  return v5;
}

- (void)setIdentifier:(id)a3
{
  id v5;
  NSString *v6;
  NSString *identifier;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMediaUserState.m"), 216, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  identifier = self->_identifier;
  self->_identifier = v6;

}

- (void)setIsActive:(BOOL)a3
{
  void *v6;

  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMediaUserState.m"), 221, CFSTR("Attempt to mutate after being initialized."));

  }
  self->_isActive = a3;
}

- (void)setDsid:(id)a3
{
  id v5;
  NSNumber *v6;
  NSNumber *dsid;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMediaUserState.m"), 226, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSNumber *)objc_msgSend(v5, "copy");
  dsid = self->_dsid;
  self->_dsid = v6;

}

- (void)setAlternateDSID:(id)a3
{
  id v5;
  NSString *v6;
  NSString *alternateDSID;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMediaUserState.m"), 231, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  alternateDSID = self->_alternateDSID;
  self->_alternateDSID = v6;

}

- (void)setICloudPersonID:(id)a3
{
  id v5;
  NSString *v6;
  NSString *iCloudPersonID;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMediaUserState.m"), 236, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  iCloudPersonID = self->_iCloudPersonID;
  self->_iCloudPersonID = v6;

}

- (void)setHomeUserIDs:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *homeUserIDs;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMediaUserState.m"), 241, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSArray *)objc_msgSend(v5, "copy");
  homeUserIDs = self->_homeUserIDs;
  self->_homeUserIDs = v6;

}

- (void)setStorefrontIdentifier:(id)a3
{
  id v5;
  NSString *v6;
  NSString *storefrontIdentifier;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMediaUserState.m"), 246, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  storefrontIdentifier = self->_storefrontIdentifier;
  self->_storefrontIdentifier = v6;

}

- (void)setFirstName:(id)a3
{
  id v5;
  NSString *v6;
  NSString *firstName;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMediaUserState.m"), 251, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  firstName = self->_firstName;
  self->_firstName = v6;

}

- (void)setLastName:(id)a3
{
  id v5;
  NSString *v6;
  NSString *lastName;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMediaUserState.m"), 256, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  lastName = self->_lastName;
  self->_lastName = v6;

}

- (void)setUsername:(id)a3
{
  id v5;
  NSString *v6;
  NSString *username;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMediaUserState.m"), 261, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  username = self->_username;
  self->_username = v6;

}

- (void)setMusic:(id)a3
{
  id v5;
  ICMusicUserState *v6;
  ICMusicUserState *music;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMediaUserState.m"), 266, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (ICMusicUserState *)objc_msgSend(v5, "copy");
  music = self->_music;
  self->_music = v6;

}

- (void)setCountryCode:(id)a3
{
  NSString *v5;
  NSString *countryCode;
  void *v7;

  v5 = (NSString *)a3;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMediaUserState.m"), 271, CFSTR("Attempt to mutate after being initialized."));

  }
  countryCode = self->_countryCode;
  self->_countryCode = v5;

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setShortDebugName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (NSString)alternateDSID
{
  return self->_alternateDSID;
}

- (NSString)iCloudPersonID
{
  return self->_iCloudPersonID;
}

- (NSArray)homeUserIDs
{
  return self->_homeUserIDs;
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)username
{
  return self->_username;
}

- (BOOL)ageVerificationRequired
{
  return self->_ageVerificationRequired;
}

- (void)setAgeVerificationRequired:(BOOL)a3
{
  self->_ageVerificationRequired = a3;
}

- (ICTVUserState)tv
{
  return self->_tv;
}

- (void)setTv:(id)a3
{
  objc_storeStrong((id *)&self->_tv, a3);
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tv, 0);
  objc_storeStrong((id *)&self->_music, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_homeUserIDs, 0);
  objc_storeStrong((id *)&self->_iCloudPersonID, 0);
  objc_storeStrong((id *)&self->_alternateDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_shortDebugName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __34__ICMediaUserState_copyWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v30 = a2;
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)v30[2];
  v30[2] = v4;

  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v7 = (void *)v30[3];
  v30[3] = v6;

  *((_BYTE *)v30 + 8) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v9 = (void *)v30[4];
  v30[4] = v8;

  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v11 = (void *)v30[5];
  v30[5] = v10;

  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v13 = (void *)v30[6];
  v30[6] = v12;

  v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v15 = (void *)v30[7];
  v30[7] = v14;

  v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v17 = (void *)v30[8];
  v30[8] = v16;

  v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v19 = (void *)v30[9];
  v30[9] = v18;

  v20 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  v21 = (void *)v30[10];
  v30[10] = v20;

  v22 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "copy");
  v23 = (void *)v30[11];
  v30[11] = v22;

  v24 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "copy");
  v25 = (void *)v30[12];
  v30[12] = v24;

  *((_BYTE *)v30 + 9) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9);
  v26 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  v27 = (void *)v30[13];
  v30[13] = v26;

  v28 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "copy");
  v29 = (void *)v30[14];
  v30[14] = v28;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
