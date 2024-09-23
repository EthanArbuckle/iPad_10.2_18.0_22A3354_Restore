@implementation CRLiOSTitlesPageControlScrollView

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v6 = objc_opt_class(UIButton, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLiOSTitlesPageControlScrollView;
    v7 = -[CRLiOSTitlesPageControlScrollView touchesShouldCancelInContentView:](&v9, "touchesShouldCancelInContentView:", v4);
  }

  return v7;
}

@end
