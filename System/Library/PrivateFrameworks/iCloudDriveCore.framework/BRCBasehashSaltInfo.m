@implementation BRCBasehashSaltInfo

- (BRCBasehashSaltInfo)initWithBasehashSaltInfo:(id)a3
{
  id v4;
  BRCBasehashSaltInfo *v5;
  BRCBasehashSaltInfo *v6;
  uint64_t v7;
  NSData *childBasehashSalt;
  uint64_t v9;
  NSData *basehashSaltValidation;
  uint64_t v11;
  NSData *childBasehashSaltValidation;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCBasehashSaltInfo;
  v5 = -[BRCBasehashSaltInfo init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_saltingState = *((_DWORD *)v4 + 2);
    v7 = objc_msgSend(*((id *)v4 + 2), "copy");
    childBasehashSalt = v6->_childBasehashSalt;
    v6->_childBasehashSalt = (NSData *)v7;

    v9 = objc_msgSend(*((id *)v4 + 4), "copy");
    basehashSaltValidation = v6->_basehashSaltValidation;
    v6->_basehashSaltValidation = (NSData *)v9;

    v11 = objc_msgSend(*((id *)v4 + 3), "copy");
    childBasehashSaltValidation = v6->_childBasehashSaltValidation;
    v6->_childBasehashSaltValidation = (NSData *)v11;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBasehashSaltInfo:", self);
}

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4;
  id v6;
  BRCBasehashSaltInfo *v7;
  uint64_t v8;
  NSData *childBasehashSalt;
  void *v10;
  uint64_t v11;
  NSData *basehashSaltValidation;
  objc_super v14;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCBasehashSaltInfo;
  v7 = -[BRCBasehashSaltInfo init](&v14, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "objectOfClass:atIndex:", objc_opt_class(), v4);
    v8 = objc_claimAutoreleasedReturnValue();
    childBasehashSalt = v7->_childBasehashSalt;
    v7->_childBasehashSalt = (NSData *)v8;

    objc_msgSend(v6, "numberAtIndex:", (v4 + 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_saltingState = objc_msgSend(v10, "intValue");

    objc_msgSend(v6, "objectOfClass:atIndex:", objc_opt_class(), (v4 + 2));
    v11 = objc_claimAutoreleasedReturnValue();
    basehashSaltValidation = v7->_basehashSaltValidation;
    v7->_basehashSaltValidation = (NSData *)v11;

  }
  return v7;
}

- (BRCBasehashSaltInfo)init
{
  BRCBasehashSaltInfo *v2;
  BRCBasehashSaltInfo *v3;
  NSData *childBasehashSalt;
  NSData *basehashSaltValidation;
  NSData *childBasehashSaltValidation;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BRCBasehashSaltInfo;
  v2 = -[BRCBasehashSaltInfo init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_saltingState = 1;
    childBasehashSalt = v2->_childBasehashSalt;
    v2->_childBasehashSalt = 0;

    basehashSaltValidation = v3->_basehashSaltValidation;
    v3->_basehashSaltValidation = 0;

    childBasehashSaltValidation = v3->_childBasehashSaltValidation;
    v3->_childBasehashSaltValidation = 0;

  }
  return v3;
}

- (BRCBasehashSaltInfo)initWithRecord:(id)a3
{
  id v4;
  BRCBasehashSaltInfo *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSData *childBasehashSalt;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSData *basehashSaltValidation;
  void *v18;
  uint64_t v19;
  NSData *childBasehashSaltValidation;

  v4 = a3;
  v5 = -[BRCBasehashSaltInfo init](self, "init");
  if (v5)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsEnhancedDrivePrivacy");

    if (v7)
    {
      objc_msgSend(v4, "encryptedValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("childBasehashSalt"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "encryptedValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("childBasehashSalt"));
        v11 = objc_claimAutoreleasedReturnValue();
        childBasehashSalt = v5->_childBasehashSalt;
        v5->_childBasehashSalt = (NSData *)v11;

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("saltingState"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("saltingState"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_saltingState = objc_msgSend(v14, "intValue");

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("basehashSaltValidationKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("basehashSaltValidationKey"));
        v16 = objc_claimAutoreleasedReturnValue();
        basehashSaltValidation = v5->_basehashSaltValidation;
        v5->_basehashSaltValidation = (NSData *)v16;

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("childBasehashSaltValidationKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("childBasehashSaltValidationKey"));
        v19 = objc_claimAutoreleasedReturnValue();
        childBasehashSaltValidation = v5->_childBasehashSaltValidation;
        v5->_childBasehashSaltValidation = (NSData *)v19;

      }
    }
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[BRCBasehashSaltInfo saltingState](self, "saltingState");
  if (v5 > 3)
    v6 = CFSTR("no server item");
  else
    v6 = off_24FE41648[v5];
  -[BRCBasehashSaltInfo basehashSaltValidation](self, "basehashSaltValidation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ saltingState:'%@' basehashValidation: '%@' >"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSData)childBasehashSalt
{
  return self->_childBasehashSalt;
}

- (void)setChildBasehashSalt:(id)a3
{
  objc_storeStrong((id *)&self->_childBasehashSalt, a3);
}

- (NSData)childBasehashSaltValidation
{
  return self->_childBasehashSaltValidation;
}

- (void)setChildBasehashSaltValidation:(id)a3
{
  objc_storeStrong((id *)&self->_childBasehashSaltValidation, a3);
}

- (unsigned)saltingState
{
  return self->_saltingState;
}

- (void)setSaltingState:(unsigned int)a3
{
  self->_saltingState = a3;
}

- (NSData)basehashSaltValidation
{
  return self->_basehashSaltValidation;
}

- (void)setBasehashSaltValidation:(id)a3
{
  objc_storeStrong((id *)&self->_basehashSaltValidation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basehashSaltValidation, 0);
  objc_storeStrong((id *)&self->_childBasehashSaltValidation, 0);
  objc_storeStrong((id *)&self->_childBasehashSalt, 0);
}

@end
