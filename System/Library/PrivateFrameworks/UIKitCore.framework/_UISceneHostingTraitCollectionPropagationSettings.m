@implementation _UISceneHostingTraitCollectionPropagationSettings

+ (id)protocol
{
  return &unk_1EDFBF620;
}

- (void)setTraitCollection:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D50], "bs_secureDataFromObject:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISceneHostingTraitCollectionPropagationSettings setValue:forProperty:](self, "setValue:forProperty:", v5, a2);

}

- (UITraitCollection)traitCollection
{
  void *v2;
  void *v3;

  -[_UISceneHostingTraitCollectionPropagationSettings valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection bs_secureDecodedFromData:](UITraitCollection, "bs_secureDecodedFromData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v3;
}

- (void)setTintColor:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D50], "bs_secureDataFromObject:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISceneHostingTraitCollectionPropagationSettings setValue:forProperty:](self, "setValue:forProperty:", v5, a2);

}

- (UIColor)tintColor
{
  void *v2;
  void *v3;

  -[_UISceneHostingTraitCollectionPropagationSettings valueForProperty:expectedClass:](self, "valueForProperty:expectedClass:", a2, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor bs_secureDecodedFromData:](UIColor, "bs_secureDecodedFromData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

@end
