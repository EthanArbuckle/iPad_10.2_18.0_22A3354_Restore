@implementation TPSWidgetContent

- (id)titleContent
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t i;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)TPSWidgetContent;
  -[TPSContent titleContent](&v15, sel_titleContent);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      v7 = 1;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            v7 = 0;
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v5);

      if ((v7 & 1) == 0)
        goto LABEL_12;
    }
    else
    {

    }
    v9 = v3;
    goto LABEL_15;
  }
LABEL_12:
  v9 = 0;
LABEL_15:

  return v9;
}

- (TPSWidgetContent)initWithDictionary:(id)a3 metadata:(id)a4
{
  id v6;
  TPSWidgetContent *v7;
  uint64_t v8;
  NSDictionary *attributes;
  TPSWidgetContent *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSWidgetContent;
  v7 = -[TPSContent initWithDictionary:metadata:](&v12, sel_initWithDictionary_metadata_, v6, a4);
  if (v7
    && (objc_msgSend(v6, "TPSSafeDictionaryForKey:", CFSTR("attrs")),
        v8 = objc_claimAutoreleasedReturnValue(),
        attributes = v7->_attributes,
        v7->_attributes = (NSDictionary *)v8,
        attributes,
        !-[TPSWidgetContent hasAssets](v7, "hasAssets")))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (BOOL)hasAssets
{
  void *v2;
  BOOL v3;

  -[TPSContent assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSWidgetContent;
  v4 = a3;
  -[TPSContent encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[TPSWidgetContent attributes](self, "attributes", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("attrs"));

  objc_msgSend(v4, "encodeInteger:forKey:", (int)-[TPSWidgetContent priority](self, "priority"), CFSTR("priority"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSWidgetContent;
  v4 = -[TPSContent copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[TPSWidgetContent attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributes:", v5);

  objc_msgSend(v4, "setPriority:", -[TPSWidgetContent priority](self, "priority"));
  return v4;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (TPSWidgetContent)initWithCoder:(id)a3
{
  id v4;
  TPSWidgetContent *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *attributes;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSWidgetContent;
  v5 = -[TPSContent initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("attrs"));
    v12 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v12;

    v5->_priority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priority"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "priority");
  if (v5 <= -[TPSWidgetContent priority](self, "priority"))
  {
    v7 = objc_msgSend(v4, "priority");
    v6 = v7 != -[TPSWidgetContent priority](self, "priority");
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v8.receiver = self;
  v8.super_class = (Class)TPSWidgetContent;
  -[TPSContent debugDescription](&v8, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("WIDGET PRIORITY: %ld"), -[TPSWidgetContent priority](self, "priority"));
  -[TPSWidgetContent attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@\n"), CFSTR("attrs"), v6);

  return v5;
}

- (void)setHasAssets:(BOOL)a3
{
  self->_hasAssets = a3;
}

@end
