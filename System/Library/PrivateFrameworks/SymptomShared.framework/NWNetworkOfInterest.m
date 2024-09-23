@implementation NWNetworkOfInterest

- (NWNetworkOfInterest)initWithSpec:(unsigned __int8)a3 isAny:(BOOL)a4 isBuiltin:(BOOL)a5 scopedToLOI:(int64_t)a6 flags:(int64_t)a7 hasCustomSignature:(id)a8
{
  uint64_t v13;
  id v15;
  NWNetworkOfInterest *v16;
  NWNetworkOfInterest *v17;
  objc_super v19;

  v13 = a3;
  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)NWNetworkOfInterest;
  v16 = -[NWNetworkOfInterest init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_version = 0;
    v16->_functionalInterfaceType = v13;
    v16->_interface = +[FunctionalInterfaceUtils nwInterfaceTypeForNWFunctionalInterfaceType:](FunctionalInterfaceUtils, "nwInterfaceTypeForNWFunctionalInterfaceType:", v13);
    v17->_interfaceSubtype = +[FunctionalInterfaceUtils nwInterfaceSubtypeForNWFunctionalInterfaceType:](FunctionalInterfaceUtils, "nwInterfaceSubtypeForNWFunctionalInterfaceType:", v17->_functionalInterfaceType);
    v17->_isAny = a4;
    v17->_isBuiltin = a5;
    v17->_scopedToLOI = a6;
    v17->_flags = a7;
    objc_storeStrong((id *)&v17->_customSignature, a8);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NWNetworkOfInterest)initWithCoder:(id)a3
{
  id v4;
  NWNetworkOfInterest *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  NSPredicate *customSignature;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NWNetworkAdviceUpdate *considerAlternateUpdate;
  uint64_t v16;
  NSDate *predictionsGeneratedAt;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *predictions;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NWNetworkOfInterest;
  v5 = -[NWNetworkOfInterest init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24958F0D4]();
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interfaceType"));
    v5->_functionalInterfaceType = v7;
    v5->_interface = +[FunctionalInterfaceUtils nwInterfaceTypeForNWFunctionalInterfaceType:](FunctionalInterfaceUtils, "nwInterfaceTypeForNWFunctionalInterfaceType:", v7);
    v5->_interfaceSubtype = +[FunctionalInterfaceUtils nwInterfaceSubtypeForNWFunctionalInterfaceType:](FunctionalInterfaceUtils, "nwInterfaceSubtypeForNWFunctionalInterfaceType:", v5->_functionalInterfaceType);
    v5->_isAny = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAny"));
    v5->_isBuiltin = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBuiltin"));
    v5->_scopedToLOI = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scopedToLOI"));
    v5->_flags = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flags"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("customSignature"));
    v8 = objc_claimAutoreleasedReturnValue();
    customSignature = v5->_customSignature;
    v5->_customSignature = (NSPredicate *)v8;

    v5->_isTrafficEligible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTrafficEligible"));
    v5->_willGetDiscretionaryTrafficInvites = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("willGetDiscretionaryTrafficInvites"));
    v5->_discretionaryTrafficInvited = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("discretionaryTrafficInvited"));
    v5->_interfaceClass = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interfaceClass"));
    v5->_considerAlternate = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("considerAlternate"));
    v10 = objc_alloc(MEMORY[0x24BDBCF20]);
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = (void *)objc_msgSend(v10, "initWithObjects:", v11, v12, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("considerAlternateUpdate"));
    v14 = objc_claimAutoreleasedReturnValue();
    considerAlternateUpdate = v5->_considerAlternateUpdate;
    v5->_considerAlternateUpdate = (NWNetworkAdviceUpdate *)v14;

    v5->_linkQuality = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("linkQuality"));
    v5->_powerCostDL = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("powerCostDL"));
    v5->_powerCostUL = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("powerCostUL"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("predictionsGeneratedAt"));
    v16 = objc_claimAutoreleasedReturnValue();
    predictionsGeneratedAt = v5->_predictionsGeneratedAt;
    v5->_predictionsGeneratedAt = (NSDate *)v16;

    v18 = objc_alloc(MEMORY[0x24BDBCF20]);
    v19 = objc_opt_class();
    v20 = (void *)objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("predictions"));
    v21 = objc_claimAutoreleasedReturnValue();
    predictions = v5->_predictions;
    v5->_predictions = (NSArray *)v21;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)MEMORY[0x24958F0D4]();
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest version](self, "version"), CFSTR("version"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest functionalInterfaceType](self, "functionalInterfaceType"), CFSTR("interfaceType"));
  objc_msgSend(v9, "encodeBool:forKey:", -[NWNetworkOfInterest isAny](self, "isAny"), CFSTR("isAny"));
  objc_msgSend(v9, "encodeBool:forKey:", -[NWNetworkOfInterest isBuiltin](self, "isBuiltin"), CFSTR("isBuiltin"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest scopedToLOI](self, "scopedToLOI"), CFSTR("scopedToLOI"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest flags](self, "flags"), CFSTR("flags"));
  -[NWNetworkOfInterest customSignature](self, "customSignature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("customSignature"));

  objc_msgSend(v9, "encodeBool:forKey:", -[NWNetworkOfInterest isTrafficEligible](self, "isTrafficEligible"), CFSTR("isTrafficEligible"));
  objc_msgSend(v9, "encodeBool:forKey:", -[NWNetworkOfInterest willGetDiscretionaryTrafficInvites](self, "willGetDiscretionaryTrafficInvites"), CFSTR("willGetDiscretionaryTrafficInvites"));
  objc_msgSend(v9, "encodeBool:forKey:", -[NWNetworkOfInterest discretionaryTrafficInvited](self, "discretionaryTrafficInvited"), CFSTR("discretionaryTrafficInvited"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest interfaceClass](self, "interfaceClass"), CFSTR("interfaceClass"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest considerAlternate](self, "considerAlternate"), CFSTR("considerAlternate"));
  -[NWNetworkOfInterest considerAlternateUpdate](self, "considerAlternateUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("considerAlternateUpdate"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest linkQuality](self, "linkQuality"), CFSTR("linkQuality"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest powerCostDL](self, "powerCostDL"), CFSTR("powerCostDL"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest powerCostUL](self, "powerCostUL"), CFSTR("powerCostUL"));
  -[NWNetworkOfInterest predictionsGeneratedAt](self, "predictionsGeneratedAt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("predictionsGeneratedAt"));

  -[NWNetworkOfInterest predictions](self, "predictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("predictions"));

  objc_autoreleasePoolPop(v4);
}

- (id)description
{
  return -[NWNetworkOfInterest _descriptionFull:](self, "_descriptionFull:", 1);
}

- (id)typePrettyPrint
{
  return -[NWNetworkOfInterest _descriptionFull:](self, "_descriptionFull:", 0);
}

- (id)_descriptionFull:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  int64_t v10;
  const char *v11;
  const char *v12;
  id v13;

  +[FunctionalInterfaceUtils stringForFunctionalInterfaceType:](FunctionalInterfaceUtils, "stringForFunctionalInterfaceType:", -[NWNetworkOfInterest functionalInterfaceType](self, "functionalInterfaceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NWNetworkOfInterest version](self, "version");
    v11 = "yes";
    if (-[NWNetworkOfInterest isAny](self, "isAny"))
      v12 = "yes";
    else
      v12 = "no";
    if (!-[NWNetworkOfInterest isBuiltin](self, "isBuiltin"))
      v11 = "no";
    v13 = (id)objc_msgSend(v7, "initWithFormat:", CFSTR("NOI(%@): v:%ld type:%@, isAny:%s, isBuiltin:%s, loi:%ld, flags:%lu"), v9, v10, v6, v12, v11, -[NWNetworkOfInterest scopedToLOI](self, "scopedToLOI"), -[NWNetworkOfInterest flags](self, "flags"));

  }
  else
  {
    v13 = v5;
  }

  return v13;
}

- (BOOL)atHomeScopedNOI
{
  return -[NWNetworkOfInterest scopedToLOI](self, "scopedToLOI") == 0;
}

- (BOOL)atWorkScopedNOI
{
  return -[NWNetworkOfInterest scopedToLOI](self, "scopedToLOI") == 1;
}

- (BOOL)isEqual:(id)a3
{
  NWNetworkOfInterest *v4;
  BOOL v5;

  v4 = (NWNetworkOfInterest *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NWNetworkOfInterest _isEqualToNOI:](self, "_isEqualToNOI:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NWNetworkOfInterest description](self, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)_isEqualToNOI:(id)a3
{
  void *v3;
  id v5;
  int64_t v6;
  int v7;
  int v8;
  int v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v5 = a3;
  v6 = -[NWNetworkOfInterest version](self, "version");
  if (v6 == objc_msgSend(v5, "version"))
  {
    v7 = -[NWNetworkOfInterest functionalInterfaceType](self, "functionalInterfaceType");
    if (v7 == objc_msgSend(v5, "functionalInterfaceType"))
    {
      v8 = -[NWNetworkOfInterest isAny](self, "isAny");
      if (v8 == objc_msgSend(v5, "isAny"))
      {
        v9 = -[NWNetworkOfInterest isBuiltin](self, "isBuiltin");
        if (v9 == objc_msgSend(v5, "isBuiltin"))
        {
          v10 = -[NWNetworkOfInterest scopedToLOI](self, "scopedToLOI");
          if (v10 == objc_msgSend(v5, "scopedToLOI"))
          {
            v11 = -[NWNetworkOfInterest flags](self, "flags");
            if (v11 == objc_msgSend(v5, "flags"))
            {
              -[NWNetworkOfInterest customSignature](self, "customSignature");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12
                || (objc_msgSend(v5, "customSignature"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                -[NWNetworkOfInterest customSignature](self, "customSignature");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "customSignature");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v13, "isEqual:", v14);

                if (v12)
                {
LABEL_15:

                  goto LABEL_12;
                }
              }
              else
              {
                v15 = 1;
              }

              goto LABEL_15;
            }
          }
        }
      }
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NWNetworkOfInterest *v4;
  uint64_t v5;
  NWNetworkAdviceUpdate *considerAlternateUpdate;
  uint64_t v7;
  NSDate *predictionsGeneratedAt;
  uint64_t v9;
  NSArray *predictions;

  v4 = objc_alloc_init(NWNetworkOfInterest);
  v4->_version = self->_version;
  v4->_functionalInterfaceType = self->_functionalInterfaceType;
  v4->_isAny = self->_isAny;
  v4->_isBuiltin = self->_isBuiltin;
  v4->_scopedToLOI = self->_scopedToLOI;
  v4->_flags = self->_flags;
  objc_storeStrong((id *)&v4->_customSignature, self->_customSignature);
  v4->_isTrafficEligible = self->_isTrafficEligible;
  v4->_willGetDiscretionaryTrafficInvites = self->_willGetDiscretionaryTrafficInvites;
  v4->_discretionaryTrafficInvited = self->_discretionaryTrafficInvited;
  v4->_interfaceClass = self->_interfaceClass;
  v4->_considerAlternate = self->_considerAlternate;
  v4->_linkQuality = self->_linkQuality;
  v4->_powerCostDL = self->_powerCostDL;
  v4->_powerCostUL = self->_powerCostUL;
  v5 = -[NWNetworkAdviceUpdate copy](self->_considerAlternateUpdate, "copy");
  considerAlternateUpdate = v4->_considerAlternateUpdate;
  v4->_considerAlternateUpdate = (NWNetworkAdviceUpdate *)v5;

  v7 = -[NSDate copy](self->_predictionsGeneratedAt, "copy");
  predictionsGeneratedAt = v4->_predictionsGeneratedAt;
  v4->_predictionsGeneratedAt = (NSDate *)v7;

  v9 = -[NSArray copy](self->_predictions, "copy");
  predictions = v4->_predictions;
  v4->_predictions = (NSArray *)v9;

  return v4;
}

- (id)_thinCopy
{
  NWNetworkOfInterest *v3;

  v3 = objc_alloc_init(NWNetworkOfInterest);
  v3->_version = self->_version;
  v3->_functionalInterfaceType = self->_functionalInterfaceType;
  v3->_isAny = self->_isAny;
  v3->_isBuiltin = self->_isBuiltin;
  v3->_scopedToLOI = self->_scopedToLOI;
  v3->_flags = self->_flags;
  objc_storeStrong((id *)&v3->_customSignature, self->_customSignature);
  v3->_isThinnedOut = 1;
  return v3;
}

- (void)addObserverForAllKeyPaths:(id)a3
{
  id v4;

  v4 = a3;
  -[NWNetworkOfInterest addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v4, CFSTR("isTrafficEligible"), 1, 1);
  -[NWNetworkOfInterest addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v4, CFSTR("willGetDiscretionaryTrafficInvites"), 1, 2);
  -[NWNetworkOfInterest addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v4, CFSTR("discretionaryTrafficInvited"), 1, 3);
  -[NWNetworkOfInterest addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v4, CFSTR("interfaceClass"), 1, 4);
  -[NWNetworkOfInterest addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v4, CFSTR("considerAlternate"), 1, 5);
  -[NWNetworkOfInterest addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v4, CFSTR("considerAlternateUpdate"), 1, 6);
  -[NWNetworkOfInterest addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v4, CFSTR("linkQuality"), 1, 7);
  -[NWNetworkOfInterest addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v4, CFSTR("powerCostDL"), 1, 8);
  -[NWNetworkOfInterest addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v4, CFSTR("powerCostUL"), 1, 9);
  -[NWNetworkOfInterest addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v4, CFSTR("predictionsGeneratedAt"), 1, 0);

}

- (void)removeObserverForAllKeyPaths:(id)a3
{
  id v4;

  v4 = a3;
  -[NWNetworkOfInterest removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", v4, CFSTR("isTrafficEligible"));
  -[NWNetworkOfInterest removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", v4, CFSTR("willGetDiscretionaryTrafficInvites"));
  -[NWNetworkOfInterest removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", v4, CFSTR("discretionaryTrafficInvited"));
  -[NWNetworkOfInterest removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", v4, CFSTR("interfaceClass"));
  -[NWNetworkOfInterest removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", v4, CFSTR("considerAlternate"));
  -[NWNetworkOfInterest removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", v4, CFSTR("considerAlternateUpdate"));
  -[NWNetworkOfInterest removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", v4, CFSTR("linkQuality"));
  -[NWNetworkOfInterest removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", v4, CFSTR("powerCostDL"));
  -[NWNetworkOfInterest removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", v4, CFSTR("powerCostUL"));
  -[NWNetworkOfInterest removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", v4, CFSTR("predictionsGeneratedAt"));

}

- (int64_t)interface
{
  return self->_interface;
}

- (int64_t)interfaceSubtype
{
  return self->_interfaceSubtype;
}

- (BOOL)isAny
{
  return self->_isAny;
}

- (BOOL)isBuiltin
{
  return self->_isBuiltin;
}

- (NSPredicate)customSignature
{
  return (NSPredicate *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isTrafficEligible
{
  return self->_isTrafficEligible;
}

- (void)setIsTrafficEligible:(BOOL)a3
{
  self->_isTrafficEligible = a3;
}

- (BOOL)willGetDiscretionaryTrafficInvites
{
  return self->_willGetDiscretionaryTrafficInvites;
}

- (void)setWillGetDiscretionaryTrafficInvites:(BOOL)a3
{
  self->_willGetDiscretionaryTrafficInvites = a3;
}

- (BOOL)discretionaryTrafficInvited
{
  return self->_discretionaryTrafficInvited;
}

- (void)setDiscretionaryTrafficInvited:(BOOL)a3
{
  self->_discretionaryTrafficInvited = a3;
}

- (int64_t)interfaceClass
{
  return self->_interfaceClass;
}

- (void)setInterfaceClass:(int64_t)a3
{
  self->_interfaceClass = a3;
}

- (int64_t)considerAlternate
{
  return self->_considerAlternate;
}

- (void)setConsiderAlternate:(int64_t)a3
{
  self->_considerAlternate = a3;
}

- (NWNetworkAdviceUpdate)considerAlternateUpdate
{
  return (NWNetworkAdviceUpdate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setConsiderAlternateUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (int64_t)linkQuality
{
  return self->_linkQuality;
}

- (void)setLinkQuality:(int64_t)a3
{
  self->_linkQuality = a3;
}

- (int64_t)powerCostDL
{
  return self->_powerCostDL;
}

- (void)setPowerCostDL:(int64_t)a3
{
  self->_powerCostDL = a3;
}

- (int64_t)powerCostUL
{
  return self->_powerCostUL;
}

- (void)setPowerCostUL:(int64_t)a3
{
  self->_powerCostUL = a3;
}

- (NSDate)predictionsGeneratedAt
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPredictionsGeneratedAt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSArray)predictions
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPredictions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (int64_t)version
{
  return self->_version;
}

- (int64_t)scopedToLOI
{
  return self->_scopedToLOI;
}

- (int64_t)flags
{
  return self->_flags;
}

- (unsigned)functionalInterfaceType
{
  return self->_functionalInterfaceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_predictionsGeneratedAt, 0);
  objc_storeStrong((id *)&self->_considerAlternateUpdate, 0);
  objc_storeStrong((id *)&self->_customSignature, 0);
}

@end
