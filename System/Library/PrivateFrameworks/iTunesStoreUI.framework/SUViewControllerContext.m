@implementation SUViewControllerContext

- (SUViewControllerContext)initWithCoder:(id)a3
{
  SUViewControllerContext *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUViewControllerContext.m"), 50, CFSTR("Must use keyed-coding"));
  v6 = -[SUViewControllerContext init](self, "init");
  if (v6)
  {
    v19 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    v17 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v6->_metadata = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v19, "setWithObjects:", v18, v17, v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0), CFSTR("metadata"));
    v6->_sectionIdentifier = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("section"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("typeString")))
      v15 = -[SUViewControllerContext _typeForTypeString:](v6, "_typeForTypeString:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeString")));
    else
      v15 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("type"));
    v6->_type = v15;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUViewControllerContext.m"), 76, CFSTR("Must use keyed-coding"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_sectionIdentifier, CFSTR("section"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(a3, "encodeObject:forKey:", -[SUViewControllerContext _typeStringForType:](self, "_typeStringForType:", self->_type), CFSTR("typeString"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  self->_metadata = 0;
  self->_sectionIdentifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUViewControllerContext;
  -[SUViewControllerContext dealloc](&v3, sel_dealloc);
}

- (id)copyViewController
{
  uint64_t v3;
  objc_class *v4;
  id v5;

  v3 = 0;
  while (__SUContextMap[v3] != self->_type)
  {
    v3 += 2;
    if (v3 == 12)
      return 0;
  }
  v4 = NSClassFromString((NSString *)__SUContextMap[v3 + 1]);
  if (v4)
  {
    v5 = objc_alloc_init(v4);
    objc_msgSend(v5, "restoreArchivableContext:", self);
    return v5;
  }
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUViewControllerContext;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %ld, %@"), -[SUViewControllerContext description](&v3, sel_description), -[SUViewControllerContext type](self, "type"), -[SUViewControllerContext sectionIdentifier](self, "sectionIdentifier"));
}

- (void)setValue:(id)a3 forMetadataKey:(id)a4
{
  NSMutableDictionary *metadata;

  metadata = self->_metadata;
  if (a3)
  {
    if (!metadata)
    {
      metadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      self->_metadata = metadata;
    }
    -[NSMutableDictionary setObject:forKey:](metadata, "setObject:forKey:", a3, a4);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](metadata, "removeObjectForKey:", a4);
  }
}

- (id)valueForMetadataKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_metadata, "objectForKey:", a3);
}

- (int64_t)_typeForTypeString:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("storepage")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("overlay")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("overlay-bg")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("split-view")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("navigation")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("searchpage")))
    return 6;
  return 0;
}

- (id)_typeStringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return CFSTR("unknown");
  else
    return off_24DE7B868[a3 - 1];
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end
