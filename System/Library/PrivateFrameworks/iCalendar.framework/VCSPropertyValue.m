@implementation VCSPropertyValue

- (VCSPropertyValue)initWithValue:(id)a3 type:(unint64_t)a4
{
  id v7;
  VCSPropertyValue *v8;
  VCSPropertyValue *v9;
  uint64_t v10;
  NSMutableDictionary *parameters;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VCSPropertyValue;
  v8 = -[VCSPropertyValue init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_valueType = a4;
    objc_storeStrong(&v8->_value, a3);
    v10 = objc_opt_new();
    parameters = v9->_parameters;
    v9->_parameters = (NSMutableDictionary *)v10;

  }
  return v9;
}

- (void)addParameter:(id)a3 withValue:(id)a4
{
  id v6;
  NSMutableDictionary *parameters;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    parameters = self->_parameters;
    if (v6)
      -[NSMutableDictionary setObject:forKeyedSubscript:](parameters, "setObject:forKeyedSubscript:", v6, v8);
    else
      -[NSMutableDictionary removeObjectForKey:](parameters, "removeObjectForKey:", v8);
  }

}

- (id)dictify
{
  void *v3;
  unint64_t valueType;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  valueType = self->_valueType;
  if (valueType >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid(%lu)"), self->_valueType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E953B4A0[valueType];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("valueType"));

  -[VCSPropertyValue valueDescription](self, "valueDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("value"));

  if (-[NSMutableDictionary count](self->_parameters, "count"))
  {
    v7 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSMutableDictionary allKeys](self->_parameters, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "dictify");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("parameters"));
  }
  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[VCSPropertyValue dictify](self, "dictify");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)valueDescription
{
  id v2;
  void *v3;
  id v5;

  switch(self->_valueType)
  {
    case 0uLL:
      stringForEntityStatus(objc_msgSend(self->_value, "unsignedIntegerValue"));
      v2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 1uLL:
      stringForEntityTransparency(objc_msgSend(self->_value, "unsignedIntegerValue"));
      v2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 2uLL:
      stringForEntityClassification(objc_msgSend(self->_value, "unsignedIntegerValue"));
      v2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 3uLL:
      v2 = self->_value;
      goto LABEL_3;
    case 5uLL:
      v5 = self->_value;
      v3 = (void *)objc_msgSend(CFSTR("P"), "mutableCopy");
      if (objc_msgSend(v5, "day") != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v3, "appendFormat:", CFSTR("%ldD"), objc_msgSend(v5, "day"));
      objc_msgSend(v3, "appendString:", CFSTR("T"));
      if (objc_msgSend(v5, "hour") != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v3, "appendFormat:", CFSTR("%ldH"), objc_msgSend(v5, "hour"));
      if (objc_msgSend(v5, "minute") != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v3, "appendFormat:", CFSTR("%ldM"), objc_msgSend(v5, "minute"));
      if (objc_msgSend(v5, "second") != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v3, "appendFormat:", CFSTR("%ldS"), objc_msgSend(v5, "second"));

      return v3;
    case 9uLL:
      objc_msgSend(self->_value, "dictify");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    default:
      objc_msgSend(self->_value, "description");
      v2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
      v3 = v2;
      return v3;
  }
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
