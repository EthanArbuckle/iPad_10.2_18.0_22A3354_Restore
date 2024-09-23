@implementation TSUDescription

- (TSUDescription)initWithObject:(id)a3 class:(Class)a4 header:(id)a5
{
  TSUDescription *v8;
  TSUDescription *v9;
  objc_super v11;

  ++TSUDescriptionDepth;
  v11.receiver = self;
  v11.super_class = (Class)TSUDescription;
  v8 = -[TSUDescription init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_object = a3;
    v8->_class = a4;
    v8->_header = (NSString *)objc_msgSend(a5, "copy");
  }
  return v9;
}

- (TSUDescription)initWithCFType:(void *)a3 header:(id)a4
{
  TSUDescription *v6;
  TSUDescription *v7;
  objc_super v9;

  ++TSUDescriptionDepth;
  v9.receiver = self;
  v9.super_class = (Class)TSUDescription;
  v6 = -[TSUDescription init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_cfType = a3;
    v6->_header = (NSString *)objc_msgSend(a4, "copy");
  }
  return v7;
}

- (TSUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5 arguments:(char *)a6
{
  void *v9;
  TSUDescription *v10;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a5, a6);
  v10 = -[TSUDescription initWithObject:class:header:](self, "initWithObject:class:header:", a3, a4, v9);

  return v10;
}

- (TSUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  uint64_t v6;

  return -[TSUDescription initWithObject:class:format:arguments:](self, "initWithObject:class:format:arguments:", a3, a4, a5, &v6);
}

- (TSUDescription)initWithObject:(id)a3 format:(id)a4
{
  uint64_t v5;

  return -[TSUDescription initWithObject:class:format:arguments:](self, "initWithObject:class:format:arguments:", a3, object_getClass(a3), a4, &v5);
}

- (TSUDescription)initWithObject:(id)a3
{
  return -[TSUDescription initWithObject:class:format:](self, "initWithObject:class:format:", a3, object_getClass(a3), &stru_24D61C228);
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  uint64_t v6;

  return -[TSUDescription initWithObject:class:format:arguments:]([TSUDescription alloc], "initWithObject:class:format:arguments:", a3, a4, a5, &v6);
}

+ (id)descriptionWithObject:(id)a3 format:(id)a4
{
  uint64_t v5;

  return -[TSUDescription initWithObject:class:format:arguments:]([TSUDescription alloc], "initWithObject:class:format:arguments:", a3, object_getClass(a3), a4, &v5);
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4
{
  return -[TSUDescription initWithObject:class:format:]([TSUDescription alloc], "initWithObject:class:format:", a3, a4, &stru_24D61C228);
}

+ (id)descriptionWithCFType:(void *)a3 format:(id)a4
{
  void *v5;
  TSUDescription *v6;
  uint64_t v8;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a4, &v8);
  v6 = -[TSUDescription initWithCFType:header:]([TSUDescription alloc], "initWithCFType:header:", a3, v5);

  return v6;
}

+ (id)descriptionWithObject:(id)a3
{
  return (id)objc_msgSend(a1, "descriptionWithObject:format:", a3, &stru_24D61C228);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUDescription;
  -[TSUDescription dealloc](&v3, sel_dealloc);
}

- (id)p_header
{
  void *cfType;
  CFTypeID v5;
  CFStringRef v6;
  void *v7;

  if (self->_object)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%s*)%p%@"), class_getName(self->_class), self->_object, self->_header);
  cfType = self->_cfType;
  if (!cfType)
    return CFSTR("(void*)nil");
  v5 = CFGetTypeID(cfType);
  v6 = CFCopyTypeIDDescription(v5);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@Ref)%p%@"), v6, self->_cfType, self->_header);
  CFRelease(v6);
  return v7;
}

- (void)addField:(id)a3 value:(id)a4
{
  uint64_t v7;
  void *v8;
  unint64_t v9;

  if (!self->_fields)
  {
    self->_fields = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    self->_fieldOrder = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  }
  if (!a4)
    a4 = CFSTR("nil");
  if (a3 && objc_msgSend(a3, "length"))
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: "), a3);
  else
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("$$$%lu"), -[NSMutableDictionary count](self->_fields, "count"));
  v8 = (void *)v7;
  -[NSMutableArray addObject:](self->_fieldOrder, "addObject:", v7);
  -[NSMutableDictionary setObject:forKey:](self->_fields, "setObject:forKey:", a4, v8);
  if ((objc_msgSend(v8, "hasPrefix:", CFSTR("$$$")) & 1) == 0)
  {
    v9 = objc_msgSend(v8, "length");
    if (v9 > self->_fieldNameWidth)
      self->_fieldNameWidth = v9;
  }
}

- (void)addField:(id)a3 format:(id)a4
{
  void *v6;
  uint64_t v7;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a4, &v7);
  -[TSUDescription addField:value:](self, "addField:value:", a3, v6);

}

- (void)addFieldWithFormat:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a3, &v5);
  -[TSUDescription addField:value:](self, "addField:value:", 0, v4);

}

- (void)addFieldValue:(id)a3
{
  -[TSUDescription addFieldWithFormat:](self, "addFieldWithFormat:", CFSTR("%@"), a3);
}

- (void)addSuperDescription
{
  objc_class *v3;
  NSObject *object;
  id v5;
  objc_super v6;

  object = self->_object;
  v3 = self->_class;
  v6.receiver = object;
  v6.super_class = class_getSuperclass(v3);
  v5 = -[TSUDescription description](&v6, sel_description);
  -[TSUDescription addFieldValue:](self, "addFieldValue:", v5, v6.receiver);
}

- (void)setFieldOptionCommaSeparated
{
  self->_commaSeparated = 1;
}

- (id)descriptionString
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  TSUDescription *v16;
  const __CFString *v17;
  const __CFString *v18;
  id v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  const char *v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableArray *obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (!self->_fields)
    goto LABEL_5;
  if ((unint64_t)TSUDescriptionDepth >= 5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v3 = (id)-[NSObject shortDescription](self->_object, "shortDescription");
LABEL_6:
      v4 = v3;
      goto LABEL_30;
    }
LABEL_5:
    v3 = -[TSUDescription p_header](self, "p_header");
    goto LABEL_6;
  }
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@ {"), -[TSUDescription p_header](self, "p_header"));
  v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = self->_fieldOrder;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v6)
  {
    v7 = v6;
    v30 = v4;
    v8 = 0;
    v9 = 0;
    v10 = &stru_24D61C228;
    v11 = *(_QWORD *)v36;
    v12 = CFSTR(",\n");
    v13 = CFSTR("\n");
    do
    {
      v14 = 0;
      v31 = v8;
      v15 = v8 + 1;
      v16 = self;
      v32 = v15;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(obj);
        if ((unint64_t)(v15 + v14) > 0x63)
        {
          ++v9;
        }
        else
        {
          v17 = v13;
          v18 = v12;
          v19 = v5;
          v20 = *(__CFString **)(*((_QWORD *)&v35 + 1) + 8 * v14);
          v21 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](v16->_fields, "objectForKey:", v20), "mutableCopy");
          v22 = v7;
          v23 = v11;
          v24 = v9;
          v25 = v21;
          objc_msgSend(v21, "tsu_indentBy:", self->_fieldNameWidth);
          if (-[__CFString hasPrefix:](v20, "hasPrefix:", CFSTR("$$$")))
            v20 = &stru_24D61C228;
          v26 = -[__CFString length](v20, "length");
          v27 = v20;
          v5 = v19;
          v12 = v18;
          v13 = v17;
          v15 = v32;
          objc_msgSend(v25, "replaceCharactersInRange:withString:", 0, v26, v27);
          objc_msgSend(v5, "appendFormat:", CFSTR("%@%@"), v10, v25);

          v9 = v24;
          v11 = v23;
          v7 = v22;
          v16 = self;
        }
        if (v16->_commaSeparated)
          v10 = v12;
        else
          v10 = v13;
        ++v14;
      }
      while (v7 != v14);
      v8 = v31 + v7;
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v7);
    v4 = v30;
    if (v9)
    {
      v28 = "";
      if (v9 != 1)
        v28 = "s";
      objc_msgSend(v5, "appendFormat:", CFSTR("%@...omitting %lu field%s (set to truncate after %lu field%s)"), v10, v9, v28, 99, "s");
    }
  }
  while ((objc_msgSend(v5, "hasSuffix:", CFSTR("\n")) & 1) != 0
       || objc_msgSend(v5, "hasSuffix:", CFSTR(" ")))
    objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);
  objc_msgSend(v5, "tsu_indentBy:", 2);
  objc_msgSend(v4, "appendFormat:", CFSTR("\n%@\n}"), v5);

LABEL_30:
  --TSUDescriptionDepth;
  return v4;
}

@end
