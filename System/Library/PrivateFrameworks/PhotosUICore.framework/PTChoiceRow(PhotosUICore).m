@implementation PTChoiceRow(PhotosUICore)

- (id)px_possibleValues:()PhotosUICore
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "possibleValues:titles:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)px_possibleValues:()PhotosUICore formatter:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  v11 = a4;
  v6 = v11;
  v7 = a3;
  PXMap();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "possibleValues:titles:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
