@implementation PATCCAccess

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccService, 0);
}

- (unint64_t)hashWithOptions:(unint64_t)a3
{
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PATCCAccess;
  v4 = -[PAAccess hashWithOptions:](&v6, sel_hashWithOptions_, a3);
  return -[NSString hash](self->_tccService, "hash") - v4 + 32 * v4;
}

+ (id)accessWithAuditToken:(id *)a3 forService:(id)a4
{
  id v6;
  id v7;
  __int128 v8;
  void *v9;
  _OWORD v11[2];

  v6 = a4;
  v7 = objc_alloc((Class)a1);
  v8 = *(_OWORD *)&a3->var0[4];
  v11[0] = *(_OWORD *)a3->var0;
  v11[1] = v8;
  v9 = (void *)objc_msgSend(v7, "initWithAuditToken:forService:", v11, v6);

  return v9;
}

- (PATCCAccess)initWithAuditToken:(id *)a3 forService:(id)a4
{
  __int128 v5;
  id v6;
  void *v7;
  PATCCAccess *v8;
  __int128 v10;
  __int128 v11;

  v5 = *(_OWORD *)&a3->var0[4];
  v10 = *(_OWORD *)a3->var0;
  v11 = v5;
  v6 = a4;
  +[PAApplication applicationWithAuditToken:](PAApplication, "applicationWithAuditToken:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PATCCAccess initWithAccessor:forService:](self, "initWithAccessor:forService:", v7, v6, v10, v11);

  return v8;
}

- (PATCCAccess)initWithAccessor:(id)a3 forService:(id)a4 assetIdentifiers:(id)a5
{
  id v8;
  PATCCAccess *v9;
  uint64_t v10;
  NSString *tccService;
  PATCCAccess *v12;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PATCCAccess;
  v9 = -[PAAccess initWithAccessor:assetIdentifiers:](&v14, sel_initWithAccessor_assetIdentifiers_, a3, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    tccService = v9->_tccService;
    v9->_tccService = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (PATCCAccess)initWithAccessor:(id)a3 forService:(id)a4
{
  return -[PATCCAccess initWithAccessor:forService:assetIdentifiers:](self, "initWithAccessor:forService:assetIdentifiers:", a3, a4, 0);
}

- (NSString)tccService
{
  return self->_tccService;
}

- (id)descriptionForCategory
{
  void *tccService;
  void *v4;
  id v5;

  -[PATCCAccess category](self, "category");
  tccService = (void *)objc_claimAutoreleasedReturnValue();
  v4 = tccService;
  if (!tccService)
    tccService = self->_tccService;
  v5 = tccService;

  return v5;
}

- (id)category
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  if (category_onceToken != -1)
    dispatch_once(&category_onceToken, &__block_literal_global_2);
  objc_msgSend((id)category_tccServiceToCategory, "objectForKeyedSubscript:", self->_tccService);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("unknown");
  v5 = v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PATCCAccess;
  v5 = -[PAAccess copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_tccService, "copyWithZone:", a3);
    v7 = (void *)v5[9];
    v5[9] = v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PATCCAccess;
  v4 = a3;
  -[PAAccess encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tccService, CFSTR("tccService"), v5.receiver, v5.super_class);

}

- (BOOL)isEqualToAccess:(id)a3 withOptions:(unint64_t)a4
{
  id v6;
  NSString *tccService;
  void *v8;
  BOOL v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PATCCAccess;
  if (-[PAAccess isEqualToAccess:withOptions:](&v11, sel_isEqualToAccess_withOptions_, v6, a4))
  {
    tccService = self->_tccService;
    objc_msgSend(v6, "tccService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSString isEqualToString:](tccService, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PATCCAccess)initWithCoder:(id)a3
{
  id v4;
  PATCCAccess *v5;
  uint64_t v6;
  NSString *tccService;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PATCCAccess;
  v5 = -[PAAccess initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tccService"));
    v6 = objc_claimAutoreleasedReturnValue();
    tccService = v5->_tccService;
    v5->_tccService = (NSString *)v6;

  }
  return v5;
}

void __23__PATCCAccess_category__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DB10D0];
  v5[0] = *MEMORY[0x1E0DB10F0];
  v5[1] = v0;
  v6[0] = CFSTR("camera");
  v6[1] = CFSTR("contacts");
  v1 = *MEMORY[0x1E0DB1168];
  v5[2] = *MEMORY[0x1E0DB1158];
  v5[3] = v1;
  v6[2] = CFSTR("mediaLibrary");
  v6[3] = CFSTR("microphone");
  v2 = *MEMORY[0x1E0DB11C8];
  v5[4] = *MEMORY[0x1E0DB1188];
  v5[5] = v2;
  v6[4] = CFSTR("photos");
  v6[5] = CFSTR("userTracking");
  v5[6] = *MEMORY[0x1E0DB10E8];
  v6[6] = CFSTR("calendar");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)category_tccServiceToCategory;
  category_tccServiceToCategory = v3;

}

+ (id)accessWithAccessor:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccessor:forService:", v7, v6);

  return v8;
}

+ (id)accessWithAuthorization:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAuthorization:", v4);

  return v5;
}

+ (id)accessWithInsecureProcessIdentifier:(int)a3 forService:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInsecureProcessIdentifier:forService:", v4, v6);

  return v7;
}

+ (id)eventStreamIdentifier
{
  return CFSTR("com.apple.privacy.accounting.stream.tcc");
}

- (PATCCAccess)initWithAuthorization:(id)a3
{
  id v4;
  void *v5;
  uint64_t CF_name;
  void *v7;
  PAApplication *v8;
  PATCCAccess *v9;

  v4 = a3;
  tcc_authorization_record_get_service();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    CF_name = tcc_service_get_CF_name();
    tcc_authorization_record_get_subject_identity();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = -[PAApplication initWithTCCIdentity:]([PAApplication alloc], "initWithTCCIdentity:", v7);
      if (v8)
      {
        self = -[PATCCAccess initWithAccessor:forService:](self, "initWithAccessor:forService:", v8, CF_name);
        v9 = self;
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PATCCAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5 forService:(id)a6
{
  id v10;
  PATCCAccess *v11;
  uint64_t v12;
  NSString *tccService;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PATCCAccess;
  v11 = -[PAAccess initWithAccessor:identifier:kind:](&v15, sel_initWithAccessor_identifier_kind_, a3, a4, a5);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    tccService = v11->_tccService;
    v11->_tccService = (NSString *)v12;

  }
  return v11;
}

- (PATCCAccess)initWithInsecureProcessIdentifier:(int)a3 forService:(id)a4
{
  uint64_t v4;
  id v6;
  PAApplication *v7;
  PATCCAccess *v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = -[PAApplication initWithInsecureProcessIdentifier:]([PAApplication alloc], "initWithInsecureProcessIdentifier:", v4);
  v8 = -[PATCCAccess initWithAccessor:forService:](self, "initWithAccessor:forService:", v7, v6);

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PATCCAccess;
  -[PAAccess description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ tccService:%@"), v4, self->_tccService);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PATCCAccess)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  PATCCAccess *v7;
  NSString *v8;
  NSString *tccService;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "access");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11.receiver = self;
    v11.super_class = (Class)PATCCAccess;
    self = -[PAAccess initWithProto:](&v11, sel_initWithProto_, v6);

    if (self)
    {
      objc_msgSend(v5, "tccService");
      v7 = (PATCCAccess *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v5, "tccService");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        tccService = self->_tccService;
        self->_tccService = v8;

        v7 = self;
      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PATCCAccess)initWithProtoData:(id)a3
{
  id v4;
  PAPBTCCAccess *v5;
  PATCCAccess *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[PAPBTCCAccess initWithData:]([PAPBTCCAccess alloc], "initWithData:", v4);

    v6 = -[PATCCAccess initWithProto:](self, "initWithProto:", v5);
    self = v6;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v3 = (void *)objc_opt_new();
  v7.receiver = self;
  v7.super_class = (Class)PATCCAccess;
  -[PAAccess proto](&v7, sel_proto);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setAccess:", v4);
    objc_msgSend(v3, "setTccService:", self->_tccService);
    v5 = v3;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
