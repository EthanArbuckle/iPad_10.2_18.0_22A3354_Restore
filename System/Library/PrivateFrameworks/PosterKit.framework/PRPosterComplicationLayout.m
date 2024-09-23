@implementation PRPosterComplicationLayout

- (PRPosterComplicationLayout)initWithInlineComplication:(id)a3 complications:(id)a4
{
  return -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplications:complications:](self, "initWithInlineComplication:sidebarComplications:complications:", a3, MEMORY[0x1E0C9AA60], a4);
}

- (PRPosterComplicationLayout)initWithInlineComplication:(id)a3 sidebarComplications:(id)a4 complications:(id)a5
{
  return -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:](self, "initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:", a3, 0, a4, 0, a5);
}

- (PRPosterComplicationLayout)initWithInlineComplication:(id)a3 sidebarComplicationIconLayout:(id)a4 sidebarComplications:(id)a5 complicationIconLayout:(id)a6 complications:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PRPosterComplicationLayout *v23;
  PRPosterComplicationLayout *v24;
  uint64_t v25;
  NSDictionary *sidebarComplicationIconLayout;
  uint64_t v27;
  NSArray *sidebarComplications;
  uint64_t v29;
  NSDictionary *complicationIconLayout;
  uint64_t v31;
  NSArray *complications;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = v13;
  if (v18)
  {
    NSClassFromString(CFSTR("PRSWidget"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSWidgetClass]"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:].cold.5();
LABEL_28:
      objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18B6C2FFCLL);
    }
  }

  v19 = v14;
  if (v19)
  {
    NSClassFromString(CFSTR("NSDictionary"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:].cold.4();
      objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18B6C3060);
    }
  }

  v20 = v15;
  if (v20)
  {
    NSClassFromString(CFSTR("NSArray"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:].cold.3();
      objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18B6C30C4);
    }
  }

  v21 = v16;
  if (v21)
  {
    NSClassFromString(CFSTR("NSDictionary"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:].cold.2();
      objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18B6C3128);
    }
  }

  v22 = v17;
  if (v22)
  {
    NSClassFromString(CFSTR("NSArray"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:].cold.1();
      goto LABEL_28;
    }
  }

  v38.receiver = self;
  v38.super_class = (Class)PRPosterComplicationLayout;
  v23 = -[PRPosterComplicationLayout init](&v38, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_inlineComplication, a3);
    v25 = objc_msgSend(v19, "copy");
    sidebarComplicationIconLayout = v24->_sidebarComplicationIconLayout;
    v24->_sidebarComplicationIconLayout = (NSDictionary *)v25;

    v27 = objc_msgSend(v20, "copy");
    sidebarComplications = v24->_sidebarComplications;
    v24->_sidebarComplications = (NSArray *)v27;

    v29 = objc_msgSend(v21, "copy");
    complicationIconLayout = v24->_complicationIconLayout;
    v24->_complicationIconLayout = (NSDictionary *)v29;

    v31 = objc_msgSend(v22, "copy");
    complications = v24->_complications;
    v24->_complications = (NSArray *)v31;

  }
  return v24;
}

- (PRPosterComplicationLayout)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  PRPosterComplicationLayout *v25;
  void *v27;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("inlineComplication"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("sidebarComplicationIconLayout"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("sidebarComplications"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v19, CFSTR("complicationIconLayout"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v23, CFSTR("complications"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:](self, "initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:", v27, v10, v14, v20, v24);
  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PRPosterComplicationLayout inlineComplication](self, "inlineComplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("inlineComplication"));

  -[PRPosterComplicationLayout sidebarComplicationIconLayout](self, "sidebarComplicationIconLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sidebarComplicationIconLayout"));

  -[PRPosterComplicationLayout sidebarComplications](self, "sidebarComplications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sidebarComplications"));

  -[PRPosterComplicationLayout complicationIconLayout](self, "complicationIconLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("complicationIconLayout"));

  -[PRPosterComplicationLayout complications](self, "complications");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("complications"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PRPosterMutableComplicationLayout *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PRPosterMutableComplicationLayout *v10;

  v4 = [PRPosterMutableComplicationLayout alloc];
  -[PRPosterComplicationLayout inlineComplication](self, "inlineComplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterComplicationLayout sidebarComplicationIconLayout](self, "sidebarComplicationIconLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterComplicationLayout sidebarComplications](self, "sidebarComplications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterComplicationLayout complicationIconLayout](self, "complicationIconLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterComplicationLayout complications](self, "complications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:](v4, "initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:", v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterComplicationLayout *v4;
  BOOL v5;

  v4 = (PRPosterComplicationLayout *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PRPosterComplicationLayout isEqualToComplicationLayout:](self, "isEqualToComplicationLayout:", v4);
  }

  return v5;
}

- (BOOL)isEqualToComplicationLayout:(id)a3
{
  PRPosterComplicationLayout *v4;
  PRPosterComplicationLayout *v5;
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
  BOOL v16;
  void *v18;
  void *v19;

  v4 = (PRPosterComplicationLayout *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v16 = 1;
  }
  else if (v4)
  {
    -[PRPosterComplicationLayout inlineComplication](self, "inlineComplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterComplicationLayout inlineComplication](v5, "inlineComplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (BSEqualObjects())
    {
      -[PRPosterComplicationLayout sidebarComplications](self, "sidebarComplications");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterComplicationLayout sidebarComplications](v5, "sidebarComplications");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PRPosterComplicationLayout _complications:AreEqualTo:](self, "_complications:AreEqualTo:", v8, v9))
      {
        -[PRPosterComplicationLayout sidebarComplicationIconLayout](self, "sidebarComplicationIconLayout");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRPosterComplicationLayout sidebarComplicationIconLayout](v5, "sidebarComplicationIconLayout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          -[PRPosterComplicationLayout complicationIconLayout](self, "complicationIconLayout");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PRPosterComplicationLayout complicationIconLayout](v5, "complicationIconLayout");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualObjects())
          {
            -[PRPosterComplicationLayout complications](self, "complications");
            v18 = v13;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[PRPosterComplicationLayout complications](v5, "complications");
            v19 = v12;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[PRPosterComplicationLayout _complications:AreEqualTo:](self, "_complications:AreEqualTo:", v14, v15);

            v12 = v19;
            v13 = v18;
          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_complications:(id)a3 AreEqualTo:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 != objc_msgSend(v6, "count"))
  {
LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqualToString:", v12);

      if (!v13)
        goto LABEL_8;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "intent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "intent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 != v17)
        goto LABEL_8;
    }
    while (objc_msgSend(v5, "count") > (unint64_t)++v8);
  }
  v18 = 1;
LABEL_9:

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  -[PRPosterComplicationLayout inlineComplication](self, "inlineComplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterComplicationLayout sidebarComplicationIconLayout](self, "sidebarComplicationIconLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterComplicationLayout sidebarComplications](self, "sidebarComplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterComplicationLayout complicationIconLayout](self, "complicationIconLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterComplicationLayout complications](self, "complications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "appendObject:", v3);
  v10 = (id)objc_msgSend(v8, "appendObject:", v4);
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __34__PRPosterComplicationLayout_hash__block_invoke;
  v22[3] = &unk_1E2185778;
  v12 = v8;
  v23 = v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v22);
  v13 = (id)objc_msgSend(v12, "appendObject:", v6);
  v17 = v11;
  v18 = 3221225472;
  v19 = __34__PRPosterComplicationLayout_hash__block_invoke_2;
  v20 = &unk_1E2185778;
  v21 = v12;
  v14 = v12;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v17);
  v15 = objc_msgSend(v14, "hash", v17, v18, v19, v20);

  return v15;
}

id __34__PRPosterComplicationLayout_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:", a2);
}

id __34__PRPosterComplicationLayout_hash__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:", a2);
}

- (BOOL)hasComplications
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v8;

  -[PRPosterComplicationLayout inlineComplication](self, "inlineComplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  -[PRPosterComplicationLayout sidebarComplications](self, "sidebarComplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return 1;
  -[PRPosterComplicationLayout complications](self, "complications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "count") != 0;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterComplicationLayout)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PRPosterComplicationLayout *v15;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("inlineComplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeDictionaryOfClass:forKey:", objc_opt_class(), CFSTR("sidebarComplicationIconLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v8, v9, CFSTR("sidebarComplications"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeDictionaryOfClass:forKey:", objc_opt_class(), CFSTR("complicationIconLayout"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v12, v13, CFSTR("complications"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:](self, "initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:", v6, v7, v10, v11, v14);
  return v15;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PRPosterComplicationLayout inlineComplication](self, "inlineComplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("inlineComplication"));

  -[PRPosterComplicationLayout sidebarComplicationIconLayout](self, "sidebarComplicationIconLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDictionary:forKey:", v6, CFSTR("sidebarComplicationIconLayout"));

  -[PRPosterComplicationLayout sidebarComplications](self, "sidebarComplications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v7, CFSTR("sidebarComplications"));

  -[PRPosterComplicationLayout complicationIconLayout](self, "complicationIconLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDictionary:forKey:", v8, CFSTR("complicationIconLayout"));

  -[PRPosterComplicationLayout complications](self, "complications");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v9, CFSTR("complications"));

}

- (PRSWidget)inlineComplication
{
  return self->_inlineComplication;
}

- (NSArray)sidebarComplications
{
  return self->_sidebarComplications;
}

- (NSArray)complications
{
  return self->_complications;
}

- (NSDictionary)sidebarComplicationIconLayout
{
  return self->_sidebarComplicationIconLayout;
}

- (NSDictionary)complicationIconLayout
{
  return self->_complicationIconLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationIconLayout, 0);
  objc_storeStrong((id *)&self->_sidebarComplicationIconLayout, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_sidebarComplications, 0);
  objc_storeStrong((id *)&self->_inlineComplication, 0);
}

- (void)initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
