@implementation PFStoryRecipeStyleFactory

+ (id)createStyleWithOriginalColorGradeCategory:(id)a3 customColorGradeKind:(int64_t)a4 songAssetIdentifier:(id)a5 isCustomized:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  PFStoryConcreteStyle *v11;

  v6 = a6;
  v9 = a5;
  v10 = a3;
  v11 = -[PFStoryConcreteStyle initWithIdentifier:originalColorGradeCategory:customColorGradeKind:songAssetIdentifier:isCustomized:]([PFStoryConcreteStyle alloc], "initWithIdentifier:originalColorGradeCategory:customColorGradeKind:songAssetIdentifier:isCustomized:", 0, v10, a4, v9, v6);

  return v11;
}

@end
