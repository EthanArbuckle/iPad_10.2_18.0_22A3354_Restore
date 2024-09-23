@implementation PK_ipp_collection_t

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PK_ipp_collection_t)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PK_ipp_collection_t *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_attrs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PK_ipp_collection_t;
  v6 = -[PK_ipp_t _initWithAttrs:](&v8, sel__initWithAttrs_, v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->super._attrs, CFSTR("_attrs"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithAttrs:", self->super._attrs);
}

- (id)debugDescription
{
  void *v3;
  NSMutableArray *attrs;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v3 = (void *)objc_opt_new();
  attrs = self->super._attrs;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __39__PK_ipp_collection_t_debugDescription__block_invoke;
  v12[3] = &unk_24E6CB310;
  v14 = &v15;
  v5 = v3;
  v13 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](attrs, "enumerateObjectsUsingBlock:", v12);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)PK_ipp_collection_t;
  -[PK_ipp_t description](&v11, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PK_ipp_t _descriptionLeader](self, "_descriptionLeader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@ { \"%@\": %@ }"), v7, v8, v16[5], v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v15, 8);
  return v9;
}

@end
