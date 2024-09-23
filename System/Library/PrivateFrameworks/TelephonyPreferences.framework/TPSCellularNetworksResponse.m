@implementation TPSCellularNetworksResponse

- (TPSCellularNetworksResponse)initWithSubscriptionContext:(id)a3 error:(id)a4
{
  -[TPSCellularNetworksResponse doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (TPSCellularNetworksResponse)initWithSubscriptionContext:(id)a3 error:(id)a4 cellularNetworks:(id)a5
{
  id v8;
  TPSCellularNetworksResponse *v9;
  uint64_t v10;
  NSArray *cellularNetworks;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TPSCellularNetworksResponse;
  v9 = -[TPSResponse initWithSubscriptionContext:error:](&v13, sel_initWithSubscriptionContext_error_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    cellularNetworks = v9->_cellularNetworks;
    v9->_cellularNetworks = (NSArray *)v10;

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPSCellularNetworksResponse;
  v5 = -[TPSResponse copyWithZone:](&v9, sel_copyWithZone_);
  v6 = -[NSArray copyWithZone:](self->_cellularNetworks, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSArray *cellularNetworks;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSCellularNetworksResponse;
  v4 = a3;
  -[TPSResponse encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  cellularNetworks = self->_cellularNetworks;
  NSStringFromSelector(sel_cellularNetworks);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", cellularNetworks, v6, v7.receiver, v7.super_class);

}

- (TPSCellularNetworksResponse)initWithCoder:(id)a3
{
  id v4;
  TPSCellularNetworksResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *cellularNetworks;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSCellularNetworksResponse;
  v5 = -[TPSResponse initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_cellularNetworks);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    cellularNetworks = v5->_cellularNetworks;
    v5->_cellularNetworks = (NSArray *)v10;

  }
  return v5;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_subscriptionContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSResponse subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_error);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSResponse error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v6, v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_cellularNetworks);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v8, self->_cellularNetworks);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSCellularNetworksResponse;
  v3 = -[TPSResponse hash](&v7, sel_hash);
  -[TPSCellularNetworksResponse cellularNetworks](self, "cellularNetworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  TPSCellularNetworksResponse *v4;
  BOOL v5;

  v4 = (TPSCellularNetworksResponse *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPSCellularNetworksResponse isEqualToResponse:](self, "isEqualToResponse:", v4);
  }

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCellularNetworksResponse;
  if (-[TPSResponse isEqualToResponse:](&v9, sel_isEqualToResponse_, v4))
  {
    -[TPSCellularNetworksResponse cellularNetworks](self, "cellularNetworks");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellularNetworks");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (v5 | v6) == 0;
    if (v6)
      v7 = objc_msgSend((id)v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)unarchivedObjectClasses
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___TPSCellularNetworksResponse;
  objc_msgSendSuper2(&v9, sel_unarchivedObjectClasses);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSet:", v4);

  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v10[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)cellularNetworks
{
  return self->_cellularNetworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularNetworks, 0);
}

@end
