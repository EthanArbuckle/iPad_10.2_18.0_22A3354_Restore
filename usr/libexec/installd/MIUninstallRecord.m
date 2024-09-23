@implementation MIUninstallRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIUninstallRecord)initWithCoder:(id)a3
{
  id v4;
  MIUninstallRecord *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MIUninstallRecord;
  v5 = -[MIUninstallRecord initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
  {
    v5->_isLastReference = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLastReference"));
    v5->_isLinked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLinked"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIUninstallRecord;
  v4 = a3;
  -[MIUninstallRecord encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[MIUninstallRecord isLastReference](self, "isLastReference", v5.receiver, v5.super_class), CFSTR("isLastReference"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MIUninstallRecord isLinked](self, "isLinked"), CFSTR("isLinked"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MIUninstallRecord;
  v4 = -[MIUninstallRecord copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setIsLastReference:", -[MIUninstallRecord isLastReference](self, "isLastReference"));
  objc_msgSend(v4, "setIsLinked:", -[MIUninstallRecord isLinked](self, "isLinked"));
  return v4;
}

- (id)legacyDictionary
{
  NSMutableDictionary *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v3 = objc_opt_new(NSMutableDictionary);
  v10.receiver = self;
  v10.super_class = (Class)MIUninstallRecord;
  v4 = -[MIUninstallRecord legacyDictionary](&v10, "legacyDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v5);

  if (-[MIUninstallRecord isLinked](self, "isLinked"))
    v6 = &__kCFBooleanTrue;
  else
    v6 = &__kCFBooleanFalse;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CFSTR("IsLinkedBundle"));
  if (-[MIUninstallRecord isLastReference](self, "isLastReference"))
    v7 = &__kCFBooleanTrue;
  else
    v7 = &__kCFBooleanFalse;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("LastReference"));
  v8 = -[NSMutableDictionary copy](v3, "copy");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  BOOL v8;
  unsigned int v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MIUninstallRecord;
  if (-[MIUninstallRecord isEqual:](&v11, "isEqual:", v4))
  {
    objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4) & 1) != 0)
    {
      v5 = v4;
      v6 = -[MIUninstallRecord isLinked](self, "isLinked");
      if (v6 == objc_msgSend(v5, "isLinked"))
      {
        v9 = -[MIUninstallRecord isLastReference](self, "isLastReference");
        if (v9 == objc_msgSend(v5, "isLastReference"))
        {
          v8 = 1;
          goto LABEL_14;
        }
        v7 = qword_10009E048;
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        {
LABEL_12:
          v8 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        v7 = qword_10009E048;
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
          goto LABEL_12;
      }
      MOLogWrite(v7, 3, "-[MIUninstallRecord isEqual:]", CFSTR("Property %s did not match"));
      goto LABEL_12;
    }
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  objc_super v7;

  v3 = -[MIUninstallRecord isLinked](self, "isLinked");
  v4 = -[MIUninstallRecord isLastReference](self, "isLastReference");
  v5 = 2;
  if (!v4)
    v5 = 0;
  v7.receiver = self;
  v7.super_class = (Class)MIUninstallRecord;
  return -[MIUninstallRecord hash](&v7, "hash") ^ (v5 | v3);
}

- (id)ICLUninstallRecord
{
  ICLUninstallRecord *v3;
  void *v4;

  v3 = objc_opt_new(ICLUninstallRecord);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstallRecord bundleIdentifier](self, "bundleIdentifier"));
  -[ICLUninstallRecord setBundleIdentifier:](v3, "setBundleIdentifier:", v4);

  -[ICLUninstallRecord setIsPlaceholder:](v3, "setIsPlaceholder:", -[MIUninstallRecord isPlaceholder](self, "isPlaceholder"));
  -[ICLUninstallRecord setHasParallelPlaceholder:](v3, "setHasParallelPlaceholder:", -[MIUninstallRecord hasParallelPlaceholder](self, "hasParallelPlaceholder"));
  return v3;
}

+ (id)uninstallRecordArrayToICLUninstallRecordArray:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "ICLUninstallRecord", (_QWORD)v13));
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = objc_msgSend(v4, "copy");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isLastReference
{
  return self->_isLastReference;
}

- (void)setIsLastReference:(BOOL)a3
{
  self->_isLastReference = a3;
}

- (BOOL)isLinked
{
  return self->_isLinked;
}

- (void)setIsLinked:(BOOL)a3
{
  self->_isLinked = a3;
}

- (BOOL)doesNotHaveBundleContainer
{
  return self->_doesNotHaveBundleContainer;
}

- (void)setDoesNotHaveBundleContainer:(BOOL)a3
{
  self->_doesNotHaveBundleContainer = a3;
}

@end
