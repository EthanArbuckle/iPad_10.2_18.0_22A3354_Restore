@implementation AllRefinementsViewModel

- (AllRefinementsViewModel)initWithSections:(id)a3 displayName:(id)a4 viewTakesFullHeight:(BOOL)a5
{
  id v9;
  id v10;
  AllRefinementsViewModel *v11;
  AllRefinementsViewModel *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AllRefinementsViewModel;
  v11 = -[AllRefinementsViewModel init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sections, a3);
    objc_storeStrong((id *)&v12->_displayName, a4);
    v12->_viewTakesFullHeight = a5;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  AllRefinementsViewModel *v7;
  void *v8;
  AllRefinementsViewModel *v9;
  void *v10;

  v4 = objc_alloc((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModel sections](self, "sections"));
  v6 = objc_msgSend(v4, "initWithArray:copyItems:", v5, 1);

  v7 = [AllRefinementsViewModel alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModel displayName](self, "displayName"));
  v9 = -[AllRefinementsViewModel initWithSections:displayName:viewTakesFullHeight:](v7, "initWithSections:displayName:viewTakesFullHeight:", v6, v8, -[AllRefinementsViewModel viewTakesFullHeight](self, "viewTakesFullHeight"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModel tappedBarButtonIndex](self, "tappedBarButtonIndex"));
  -[AllRefinementsViewModel setTappedBarButtonIndex:](v9, "setTappedBarButtonIndex:", v10);

  return v9;
}

- (BOOL)viewTakesFullHeight
{
  return self->_viewTakesFullHeight;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSNumber)tappedBarButtonIndex
{
  return self->_tappedBarButtonIndex;
}

- (void)setTappedBarButtonIndex:(id)a3
{
  objc_storeStrong((id *)&self->_tappedBarButtonIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tappedBarButtonIndex, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
