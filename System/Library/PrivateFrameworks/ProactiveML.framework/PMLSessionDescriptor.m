@implementation PMLSessionDescriptor

- (PMLSessionDescriptor)initWithName:(id)a3 version:(id)a4 locale:(id)a5
{
  id v10;
  id v11;
  id v12;
  PMLSessionDescriptor *v13;
  PMLSessionDescriptor *v14;
  id v15;
  uint64_t v16;
  _PASLazyResult *featureVersion;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSessionDescriptor.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("version"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSessionDescriptor.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSessionDescriptor.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locale"));

LABEL_4:
  v26.receiver = self;
  v26.super_class = (Class)PMLSessionDescriptor;
  v13 = -[PMLSessionDescriptor init](&v26, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    objc_storeStrong((id *)&v14->_version, a4);
    objc_storeStrong((id *)&v14->_locale, a5);
    v15 = objc_alloc(MEMORY[0x24BE7A608]);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __52__PMLSessionDescriptor_initWithName_version_locale___block_invoke;
    v22[3] = &unk_24D3DBBA8;
    v23 = v11;
    v24 = v10;
    v25 = v12;
    v16 = objc_msgSend(v15, "initWithBlock:", v22);
    featureVersion = v14->_featureVersion;
    v14->_featureVersion = (_PASLazyResult *)v16;

  }
  return v14;
}

- (float)featureVersion
{
  void *v2;
  float v3;
  float v4;

  -[_PASLazyResult result](self->_featureVersion, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (id)subSessionDescriptorForLabel:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x2199EA600](self, a2);
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[PMLSessionDescriptor name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@_label%lu"), v7, a3);

  -[PMLSessionDescriptor version](self, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLSessionDescriptor locale](self, "locale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PMLSessionDescriptor descriptorForName:version:locale:](PMLSessionDescriptor, "descriptorForName:version:locale:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v11;
}

- (id)baseSessionDescriptor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x2199EA600](self, a2);
  if (baseSessionDescriptor__pasOnceToken1 != -1)
    dispatch_once(&baseSessionDescriptor__pasOnceToken1, &__block_literal_global_31);
  v4 = (id)baseSessionDescriptor__pasExprOnceResult;
  -[PMLSessionDescriptor name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLSessionDescriptor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v6, "length"), &stru_24D3DC000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PMLSessionDescriptor version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLSessionDescriptor locale](self, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PMLSessionDescriptor descriptorForName:version:locale:](PMLSessionDescriptor, "descriptorForName:version:locale:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v10;
}

- (BOOL)isSubSessionDescriptor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x2199EA600](self, a2);
  if (isSubSessionDescriptor__pasOnceToken2 != -1)
    dispatch_once(&isSubSessionDescriptor__pasOnceToken2, &__block_literal_global_36);
  v4 = (id)isSubSessionDescriptor__pasExprOnceResult;
  -[PMLSessionDescriptor name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLSessionDescriptor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v6, "length"));

  objc_autoreleasePoolPop(v3);
  return v7 != 0;
}

- (unint64_t)subSessionLabel
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v16;

  v4 = (void *)MEMORY[0x2199EA600]();
  if (subSessionLabel__pasOnceToken3 != -1)
    dispatch_once(&subSessionLabel__pasOnceToken3, &__block_literal_global_37);
  v5 = (id)subSessionLabel__pasExprOnceResult;
  -[PMLSessionDescriptor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLSessionDescriptor name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSessionDescriptor.m"), 119, CFSTR("Handle %@ is not a sub-model handle."), self);

  }
  v9 = objc_msgSend(v8, "rangeAtIndex:", 1);
  v11 = v10;
  -[PMLSessionDescriptor name](self, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "substringWithRange:", v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "integerValue");
  objc_autoreleasePoolPop(v4);
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PMLSessionDescriptor name](self, "name", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLSessionDescriptor version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLSessionDescriptor locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PMLSessionDescriptor descriptorForName:version:locale:](PMLSessionDescriptor, "descriptorForName:version:locale:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_version, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_locale, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  void *v6;
  NSString *version;
  void *v8;
  NSString *locale;
  void *v10;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    name = self->_name;
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](name, "isEqual:", v6))
    {
      version = self->_version;
      objc_msgSend(v4, "version");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](version, "isEqual:", v8))
      {
        locale = self->_locale;
        objc_msgSend(v4, "locale");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[NSString isEqual:](locale, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)toPlistWithChunks:(id)a3
{
  __int128 v3;
  _QWORD v5[3];
  __int128 v6;
  NSString *locale;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_OWORD *)&self->_name;
  v5[0] = CFSTR("NAME");
  v5[1] = CFSTR("VERSION");
  v6 = v3;
  v5[2] = CFSTR("LOCALE");
  locale = self->_locale;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v6, v5, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PMLSessionDescriptor)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PMLSessionDescriptor *v10;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NAME"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VERSION"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOCALE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PMLSessionDescriptor initWithName:version:locale:](self, "initWithName:version:locale:", v7, v8, v9);
  return v10;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %@ %@ %@>"), v5, self->_name, self->_version, self->_locale);

  return (NSString *)v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_featureVersion, 0);
}

void __39__PMLSessionDescriptor_subSessionLabel__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2199EA600]();
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("_label([0-9]+)"), 1, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)subSessionLabel__pasExprOnceResult;
  subSessionLabel__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __46__PMLSessionDescriptor_isSubSessionDescriptor__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2199EA600]();
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("_label[0-9]+"), 1, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)isSubSessionDescriptor__pasExprOnceResult;
  isSubSessionDescriptor__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __45__PMLSessionDescriptor_baseSessionDescriptor__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2199EA600]();
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("_label[0-9]+"), 1, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)baseSessionDescriptor__pasExprOnceResult;
  baseSessionDescriptor__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __52__PMLSessionDescriptor_initWithName_version_locale___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD16E0];
  v2 = a1[4];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@-%@-%@"), a1[5], v2, a1[6]);
  +[PMLSessionDescriptor _parseFeatureVersion:descriptor:](PMLSessionDescriptor, "_parseFeatureVersion:descriptor:", v2, v3);
  objc_msgSend(v1, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)descriptorForName:(id)a3 version:(id)a4 locale:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:version:locale:", v10, v9, v8);

  return v11;
}

+ (float)_parseFeatureVersion:(id)a3 descriptor:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  void *context;

  v7 = a3;
  v8 = a4;
  context = (void *)MEMORY[0x2199EA600]();
  if (_parseFeatureVersion_descriptor___pasOnceToken0 != -1)
    dispatch_once(&_parseFeatureVersion_descriptor___pasOnceToken0, &__block_literal_global_4044);
  v9 = (id)_parseFeatureVersion_descriptor___pasExprOnceResult;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PMLSessionDescriptor.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regex"));

  }
  objc_msgSend(v9, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = (uint64_t *)MEMORY[0x24BDBCAB0];
  if (v11 != 1)
  {
    v13 = (void *)MEMORY[0x24BDBCE88];
    v14 = *MEMORY[0x24BDBCAB0];
    objc_msgSend(v9, "pattern");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("Unexpected number of matches for %@; pattern: %@; descriptor: %@"),
      v7,
      v15,
      v8,
      context);

  }
  objc_msgSend(v10, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "numberOfRanges") != 5)
  {
    v17 = (void *)MEMORY[0x24BDBCE88];
    v18 = *v12;
    objc_msgSend(v9, "pattern");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "raise:format:", v18, CFSTR("Unexpected number of match ranges for %@; pattern: %@; descriptor: %@"),
      v7,
      v19,
      v8);

  }
  v20 = objc_msgSend(v16, "rangeAtIndex:", 2);
  objc_msgSend(v7, "substringWithRange:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v24 = v23;

  if (v24 <= 0.0)
  {
    v25 = (void *)MEMORY[0x24BDBCE88];
    v26 = *v12;
    objc_msgSend(v9, "pattern");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "raise:format:", v26, CFSTR("Unexpected featureVersion extracted for %@; pattern: %@; descriptor: %@"),
      v7,
      v27,
      v8);

  }
  objc_autoreleasePoolPop(context);

  return v24;
}

void __56__PMLSessionDescriptor__parseFeatureVersion_descriptor___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2199EA600]();
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(^|&)FV=([0-9]+(.[0-9]+)?)($|&)"), 0, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_parseFeatureVersion_descriptor___pasExprOnceResult;
  _parseFeatureVersion_descriptor___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
