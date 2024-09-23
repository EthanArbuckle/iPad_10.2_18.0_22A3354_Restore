@implementation _UIDiffableDataSourceSectionControllerInternal

- (void)applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 completion:(id)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDiffableDataSourceSectionControllerInternal;
  -[_UIDiffableDataSourceSectionController applySnapshot:toSection:animatingDifferences:completion:](&v6, sel_applySnapshot_toSection_animatingDifferences_completion_, a3, a4, a5, a6);
}

- (_UIDiffableDataSourceSectionControllerInternal)initWithItemRenderers:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDiffableDataSourceSectionControllerInternal;
  return -[_UIDiffableDataSourceSectionController initWithItemRenderers:](&v4, sel_initWithItemRenderers_, a3);
}

- (_UIDiffableDataSourceSectionControllerInternal)initWithItemRenderers:(id)a3 associatedSectionIdentifiers:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDiffableDataSourceSectionControllerInternal;
  return -[_UIDiffableDataSourceSectionController initWithItemRenderers:associatedSectionIdentifiers:](&v5, sel_initWithItemRenderers_associatedSectionIdentifiers_, a3, a4);
}

- (void)applySnapshot:(id)a3 toSection:(id)a4 customAnimationsProvider:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDiffableDataSourceSectionControllerInternal;
  -[_UIDiffableDataSourceSectionController applySnapshot:toSection:customAnimationsProvider:](&v5, sel_applySnapshot_toSection_customAnimationsProvider_, a3, a4, a5);
}

- (void)applySnapshot:(id)a3 toSection:(id)a4 viewPropertyAnimator:(id)a5 customAnimationsProvider:(id)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDiffableDataSourceSectionControllerInternal;
  -[_UIDiffableDataSourceSectionController applySnapshot:toSection:viewPropertyAnimator:customAnimationsProvider:](&v6, sel_applySnapshot_toSection_viewPropertyAnimator_customAnimationsProvider_, a3, a4, a5, a6);
}

@end
