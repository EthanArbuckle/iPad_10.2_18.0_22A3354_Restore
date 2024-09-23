@implementation PMLSpotlightReference

- (PMLSpotlightReference)initWithBundleId:(id)a3 domainId:(id)a4 itemIds:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PMLSpotlightReference *v14;
  PMLSpotlightReference *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLTraining.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLTraining.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIds"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)PMLSpotlightReference;
  v14 = -[PMLSpotlightReference init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v15->_domainIdentifier, a4);
    objc_storeStrong((id *)&v15->_itemIdentifiers, a5);
  }

  return v15;
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
}

+ (id)referenceWithBundleId:(id)a3 domainId:(id)a4 itemIds:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleId:domainId:itemIds:", v10, v9, v8);

  return v11;
}

@end
