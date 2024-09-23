@implementation _UIContextMenuLayoutSection

- (_UIContextMenuLayoutSection)initWithLayoutGroup:(id)a3 hiddenSeparatorIndexPaths:(id)a4
{
  id v6;
  _UIContextMenuLayoutSection *v7;
  uint64_t v8;
  NSSet *hiddenSeparatorIndexPaths;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIContextMenuLayoutSection;
  v7 = -[NSCollectionLayoutSection initWithLayoutGroup:](&v11, sel_initWithLayoutGroup_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    hiddenSeparatorIndexPaths = v7->_hiddenSeparatorIndexPaths;
    v7->_hiddenSeparatorIndexPaths = (NSSet *)v8;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuLayoutSection;
  v4 = -[NSCollectionLayoutSection copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = -[NSSet copy](self->_hiddenSeparatorIndexPaths, "copy");
    v6 = (void *)v4[33];
    v4[33] = v5;

  }
  return v4;
}

- (id)_invalidationContextForCellBackgroundOrBottomSeparatorChangeAtIndexPath:(id)a3 interactionState:(id)a4 separatorOnly:(BOOL)a5
{
  return 0;
}

- (BOOL)_shouldInvalidateForScrollViewLayoutAdjustmentsChange
{
  return 0;
}

- (void)_enrichLayoutAttributes:(id)a3 interactionState:(id)a4
{
  __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "representedElementKind");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v5 != CFSTR("kContextMenuItemSeparator"))
  {

LABEL_5:
    v9 = v10;
    goto LABEL_6;
  }
  -[_UIContextMenuLayoutSection hiddenSeparatorIndexPaths](self, "hiddenSeparatorIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  v9 = v10;
  if (v8)
  {
    objc_msgSend(v10, "setHidden:", 1);
    goto LABEL_5;
  }
LABEL_6:

}

- (NSSet)hiddenSeparatorIndexPaths
{
  return self->_hiddenSeparatorIndexPaths;
}

- (void)setHiddenSeparatorIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenSeparatorIndexPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenSeparatorIndexPaths, 0);
}

@end
