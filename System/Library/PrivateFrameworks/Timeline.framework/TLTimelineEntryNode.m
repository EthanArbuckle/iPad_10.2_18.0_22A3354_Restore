@implementation TLTimelineEntryNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TLTimelineEntryNode;
  v4 = a3;
  -[TLTimelineNode encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[TLTimelineEntryNode entry](self, "entry", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entry"));

  -[TLTimelineEntryNode entry](self, "entry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("entryClass"));

}

- (TLTimelineEntryNode)initWithCoder:(id)a3
{
  id v4;
  TLTimelineEntryNode *v5;
  NSString *v6;
  Class v7;
  uint64_t v8;
  NSObject *entry;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TLTimelineEntryNode;
  v5 = -[TLTimelineNode initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entryClass"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = NSClassFromString(v6);
    if (-[objc_class conformsToProtocol:](v7, "conformsToProtocol:", &unk_254B5CC28))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("entry"));
      v8 = objc_claimAutoreleasedReturnValue();
      entry = v5->_entry;
      v5->_entry = (TLTimelineEntry *)v8;
    }
    else
    {
      TLLoggingObjectForDomain(0);
      entry = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(entry, OS_LOG_TYPE_FAULT))
        -[TLTimelineEntryNode initWithCoder:].cold.1((uint64_t)v6, entry);
    }

  }
  return v5;
}

- (TLTimelineEntry)entry
{
  TLTimelineEntryNode *v2;
  TLTimelineEntry *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_entry;
  objc_sync_exit(v2);

  return v3;
}

- (void)setEntry:(id)a3
{
  TLTimelineEntryNode *v5;
  TLTimelineEntry *v6;

  v6 = (TLTimelineEntry *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_entry != v6)
    objc_storeStrong((id *)&v5->_entry, a3);
  objc_sync_exit(v5);

}

- (NSDate)date
{
  void *v2;
  void *v3;

  -[TLTimelineEntryNode entry](self, "entry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tl_entryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TLTimelineEntryNode;
  v3 = -[TLTimelineNode hash](&v8, sel_hash);
  v4 = +[TLTimelineEntryNode hash](TLTimelineEntryNode, "hash") ^ v3;
  -[TLTimelineEntryNode entry](self, "entry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)TLTimelineEntryNode,
        -[TLTimelineNode isEqual:](&v9, sel_isEqual_, v4)))
  {
    -[TLTimelineEntryNode entry](self, "entry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[TLTimelineUtilities object:isEqualToObject:](TLTimelineUtilities, "object:isEqualToObject:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TLTimelineEntryNode;
  v5 = -[TLTimelineNode copyWithZone:](&v17, sel_copyWithZone_);
  if (v5)
  {
    -[TLTimelineEntryNode entry](self, "entry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
    objc_msgSend(v5, "setEntry:", v7);

    -[TLTimelineEntryNode leftEntryNode](self, "leftEntryNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);

    objc_msgSend(v5, "leftEntryNode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEntry:", v10);

    -[TLTimelineEntryNode rightEntryNode](self, "rightEntryNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "entry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);

    objc_msgSend(v5, "rightEntryNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEntry:", v14);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
}

- (id)rightEntryNode
{
  TLTimelineEntryNode *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[TLTimelineNode rightNode](v2, "rightNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NodeIfEntryNode(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v4;
}

- (id)leftEntryNode
{
  TLTimelineEntryNode *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[TLTimelineNode leftNode](v2, "leftNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NodeIfEntryNode(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v4;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_212829000, a2, OS_LOG_TYPE_FAULT, "Class doesn't conform - %@", (uint8_t *)&v2, 0xCu);
}

@end
