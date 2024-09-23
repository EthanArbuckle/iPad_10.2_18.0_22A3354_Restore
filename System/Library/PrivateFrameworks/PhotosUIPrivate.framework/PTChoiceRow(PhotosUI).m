@implementation PTChoiceRow(PhotosUI)

- (id)pu_possibleValues:()PhotosUI
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

@end
