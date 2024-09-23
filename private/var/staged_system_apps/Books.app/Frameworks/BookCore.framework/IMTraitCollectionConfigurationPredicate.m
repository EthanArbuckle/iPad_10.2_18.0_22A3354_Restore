@implementation IMTraitCollectionConfigurationPredicate

+ (id)predicateWithTraitCollection:(id)a3
{
  id v3;
  IMTraitCollectionConfigurationPredicate *v4;

  v3 = a3;
  v4 = objc_alloc_init(IMTraitCollectionConfigurationPredicate);
  -[IMTraitCollectionConfigurationPredicate setTraitCollection:](v4, "setTraitCollection:", v3);

  return v4;
}

- (BOOL)evaluateWithContext:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTraitCollectionConfigurationPredicate traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v4, "containsTraitsInCollection:", v5);

  return v6;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
