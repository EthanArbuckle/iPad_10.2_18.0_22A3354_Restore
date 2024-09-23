@implementation CRLDescription

- (CRLDescription)initWithObject:(id)a3 class:(Class)a4 header:(id)a5
{
  id v8;
  id v9;
  CRLDescription *v10;
  CRLDescription *v11;
  NSString *v12;
  NSString *header;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  +[CRLDescription pushDescriptionDepth](CRLDescription, "pushDescriptionDepth");
  v15.receiver = self;
  v15.super_class = (Class)CRLDescription;
  v10 = -[CRLDescription init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_object, v8);
    v11->_class = a4;
    v12 = (NSString *)objc_msgSend(v9, "copy");
    header = v11->_header;
    v11->_header = v12;

  }
  return v11;
}

- (CRLDescription)initWithCFType:(void *)a3 header:(id)a4
{
  id v6;
  CRLDescription *v7;
  CRLDescription *v8;
  NSString *v9;
  NSString *header;
  objc_super v12;

  v6 = a4;
  +[CRLDescription pushDescriptionDepth](CRLDescription, "pushDescriptionDepth");
  v12.receiver = self;
  v12.super_class = (Class)CRLDescription;
  v7 = -[CRLDescription init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_cfType = a3;
    v9 = (NSString *)objc_msgSend(v6, "copy");
    header = v8->_header;
    v8->_header = v9;

  }
  return v8;
}

- (CRLDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5 arguments:(char *)a6
{
  id v10;
  id v11;
  id v12;
  CRLDescription *v13;

  v10 = a5;
  v11 = a3;
  v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v10, a6);

  v13 = -[CRLDescription initWithObject:class:header:](self, "initWithObject:class:header:", v11, a4, v12);
  return v13;
}

- (CRLDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  uint64_t v6;

  return -[CRLDescription initWithObject:class:format:arguments:](self, "initWithObject:class:format:arguments:", a3, a4, a5, &v6);
}

- (CRLDescription)initWithObject:(id)a3 format:(id)a4
{
  id v6;
  id v7;
  CRLDescription *v8;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  v8 = -[CRLDescription initWithObject:class:format:arguments:](self, "initWithObject:class:format:arguments:", v7, object_getClass(v7), v6, &v10);

  return v8;
}

- (CRLDescription)initWithObject:(id)a3
{
  id v4;
  CRLDescription *v5;

  v4 = a3;
  v5 = -[CRLDescription initWithObject:class:format:](self, "initWithObject:class:format:", v4, object_getClass(v4), &stru_1012A72B0);

  return v5;
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  id v7;
  id v8;
  CRLDescription *v9;
  uint64_t v11;

  v7 = a5;
  v8 = a3;
  v9 = -[CRLDescription initWithObject:class:format:arguments:]([CRLDescription alloc], "initWithObject:class:format:arguments:", v8, a4, v7, &v11);

  return v9;
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4
{
  id v5;
  CRLDescription *v6;

  v5 = a3;
  v6 = -[CRLDescription initWithObject:class:format:]([CRLDescription alloc], "initWithObject:class:format:", v5, a4, &stru_1012A72B0);

  return v6;
}

+ (id)descriptionWithObject:(id)a3 format:(id)a4
{
  id v5;
  id v6;
  CRLDescription *v7;
  uint64_t v9;

  v5 = a4;
  v6 = a3;
  v7 = -[CRLDescription initWithObject:class:format:arguments:]([CRLDescription alloc], "initWithObject:class:format:arguments:", v6, object_getClass(v6), v5, &v9);

  return v7;
}

+ (id)descriptionWithCFType:(void *)a3 format:(id)a4
{
  id v5;
  id v6;
  CRLDescription *v7;
  uint64_t v9;

  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v5, &v9);

  v7 = -[CRLDescription initWithCFType:header:]([CRLDescription alloc], "initWithCFType:header:", a3, v6);
  return v7;
}

+ (id)descriptionWithObject:(id)a3
{
  return objc_msgSend(a1, "descriptionWithObject:format:", a3, &stru_1012A72B0);
}

+ (unint64_t)pushDescriptionDepth
{
  void *v2;
  void *v3;
  void *v4;
  char *v5;
  unint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "threadDictionary"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CRLDescriptionDepthThreadLocalKey")));
  v5 = (char *)objc_msgSend(v4, "unsignedIntegerValue");

  v6 = (unint64_t)(v5 + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5 + 1));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("CRLDescriptionDepthThreadLocalKey"));

  return v6;
}

+ (unint64_t)popDescriptionDepth
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "threadDictionary"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CRLDescriptionDepthThreadLocalKey")));
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v5)
    v6 = (unint64_t)v5 - 1;
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("CRLDescriptionDepthThreadLocalKey"));

  return v6;
}

+ (unint64_t)peekDescriptionDepth
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "threadDictionary"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CRLDescriptionDepthThreadLocalKey")));
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return (unint64_t)v5;
}

- (id)p_header
{
  NSObject **p_object;
  id WeakRetained;
  const char *Name;
  id v6;
  __CFString *v7;
  void *cfType;
  CFTypeID v9;
  CFStringRef v10;

  p_object = &self->_object;
  WeakRetained = objc_loadWeakRetained((id *)&self->_object);

  if (WeakRetained)
  {
    Name = class_getName(self->_class);
    v6 = objc_loadWeakRetained((id *)p_object);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%s*)%p%@"), Name, v6, self->_header));

  }
  else
  {
    cfType = self->_cfType;
    if (cfType)
    {
      v9 = CFGetTypeID(cfType);
      v10 = CFCopyTypeIDDescription(v9);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@Ref)%p%@"), v10, self->_cfType, self->_header));
      CFRelease(v10);
    }
    else
    {
      v7 = CFSTR("(void*)nil");
    }
  }
  return v7;
}

- (void)addField:(id)a3 value:(id)a4
{
  id v6;
  __CFString *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *fields;
  NSMutableArray *v10;
  NSMutableArray *fieldOrder;
  NSString *v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = (__CFString *)a4;
  if (!self->_fields)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fields = self->_fields;
    self->_fields = v8;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    fieldOrder = self->_fieldOrder;
    self->_fieldOrder = v10;

  }
  if (!v7)
    v7 = CFSTR("nil");
  if (v6 && objc_msgSend(v6, "length"))
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: "), v6);
  else
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("$$$%lu"), -[NSMutableDictionary count](self->_fields, "count"));
  v14 = (id)objc_claimAutoreleasedReturnValue(v12);

  -[NSMutableArray addObject:](self->_fieldOrder, "addObject:", v14);
  -[NSMutableDictionary setObject:forKey:](self->_fields, "setObject:forKey:", v7, v14);
  if ((objc_msgSend(v14, "hasPrefix:", CFSTR("$$$")) & 1) == 0)
  {
    v13 = objc_msgSend(v14, "length");
    if ((unint64_t)v13 > self->_fieldNameWidth)
      self->_fieldNameWidth = (unint64_t)v13;
  }

}

- (void)addField:(id)a3 format:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v6, &v9);

  -[CRLDescription addField:value:](self, "addField:value:", v7, v8);
}

- (void)addFieldWithFormat:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v4, &v6);

  -[CRLDescription addField:value:](self, "addField:value:", 0, v5);
}

- (void)addFieldValue:(id)a3
{
  -[CRLDescription addFieldWithFormat:](self, "addFieldWithFormat:", CFSTR("%@"), a3);
}

- (void)addSuperDescription
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = objc_loadWeakRetained((id *)&self->_object);
  v5.super_class = class_getSuperclass(self->_class);

  v3 = -[CRLDescription description](&v5, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[CRLDescription addFieldValue:](self, "addFieldValue:", v4, v5.receiver, v5.super_class);

}

- (void)setFieldOptionCommaSeparated
{
  self->_commaSeparated = 1;
}

- (NSString)descriptionString
{
  __objc2_class *v3;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  __CFString *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  __CFString *v18;
  NSMutableArray *v19;
  void *v20;
  void *v21;
  id v22;
  __CFString *v23;
  __CFString *v24;
  const char *v25;
  void *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v3 = CRLMisspelledWordRotorSearchController;
  if (self->_fields)
  {
    if (+[CRLDescription peekDescriptionDepth](CRLDescription, "peekDescriptionDepth") < 5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDescription p_header](self, "p_header"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@ {"), v8));

      v31 = objc_alloc_init((Class)NSMutableString);
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v9 = self->_fieldOrder;
      v10 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v10)
      {
        v11 = v10;
        v27 = v7;
        v12 = 0;
        v13 = 0;
        v14 = &stru_1012A72B0;
        v15 = *(_QWORD *)v33;
        v29 = *(_QWORD *)v33;
        do
        {
          v16 = 0;
          v28 = v13;
          v17 = v13 + 1;
          v18 = v14;
          v30 = v17;
          do
          {
            if (*(_QWORD *)v33 != v15)
              objc_enumerationMutation(v9);
            if (&v16[(_QWORD)v17] > (char *)0x63)
            {
              ++v12;
            }
            else
            {
              v19 = v9;
              v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v16);
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_fields, "objectForKey:", v20));
              v22 = objc_msgSend(v21, "mutableCopy");

              v23 = v20;
              objc_msgSend(v22, "crl_indentBy:", self->_fieldNameWidth);
              if (-[__CFString hasPrefix:](v23, "hasPrefix:", CFSTR("$$$")))
              {

                v23 = &stru_1012A72B0;
              }
              objc_msgSend(v22, "replaceCharactersInRange:withString:", 0, -[__CFString length](v23, "length"), v23);
              objc_msgSend(v31, "appendFormat:", CFSTR("%@%@"), v18, v22);

              v9 = v19;
              v15 = v29;
              v17 = v30;
            }
            v24 = CFSTR("\n");
            if (self->_commaSeparated)
              v24 = CFSTR(",\n");
            v14 = v24;

            ++v16;
            v18 = v14;
          }
          while (v11 != v16);
          v13 = &v11[(_QWORD)v28];
          v11 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v11);

        if (v12)
        {
          v25 = "";
          if (v12 != 1)
            v25 = "s";
          objc_msgSend(v31, "appendFormat:", CFSTR("%@...omitting %lu field%s (set to truncate after %lu field%s)"), v14, v12, v25, 99, "s");
        }
        v3 = CRLMisspelledWordRotorSearchController;
        v7 = v27;
      }
      else
      {

        v14 = &stru_1012A72B0;
      }
      while ((objc_msgSend(v31, "hasSuffix:", CFSTR("\n")) & 1) != 0
           || objc_msgSend(v31, "hasSuffix:", CFSTR(" ")))
        objc_msgSend(v31, "deleteCharactersInRange:", (char *)objc_msgSend(v31, "length") - 1, 1);
      v6 = v31;
      objc_msgSend(v31, "crl_indentBy:", 2);
      objc_msgSend(v7, "appendFormat:", CFSTR("\n%@\n}"), v31);

      goto LABEL_30;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_object);
    v5 = objc_opt_respondsToSelector(WeakRetained, "shortDescription");

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_object);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortDescription"));
LABEL_30:

      goto LABEL_31;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDescription p_header](self, "p_header"));
LABEL_31:
  objc_msgSend(&v3[101], "popDescriptionDepth");
  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldOrder, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_destroyWeak((id *)&self->_object);
}

@end
