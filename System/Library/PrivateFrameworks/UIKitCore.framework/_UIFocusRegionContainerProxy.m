@implementation _UIFocusRegionContainerProxy

- (_UIFocusRegionContainerProxy)initWithOwningEnvironment:(id)a3 itemContainer:(id)a4
{
  void *v5;
  _UIFocusRegionContainerProxy *v6;

  +[_UIFocusEnvironmentContainerTuple tupleWithOwningEnvironment:itemContainer:](_UIFocusEnvironmentContainerTuple, "tupleWithOwningEnvironment:itemContainer:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIFocusRegionContainerProxy initWithEnvironmentContainer:](self, "initWithEnvironmentContainer:", v5);

  return v6;
}

- (_UIFocusRegionContainerProxy)initWithEnvironmentContainer:(id)a3
{
  id v6;
  _UIFocusRegionContainerProxy *v7;
  _UIFocusRegionContainerProxy *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusRegionContainerProxy.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environmentContainer != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_UIFocusRegionContainerProxy;
  v7 = -[_UIFocusRegionContainerProxy init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_environmentContainer, a3);
    *(_WORD *)&v8->_allowsLazyLoading = 257;
    v8->_shouldCreateRegionForGuideBehavior = 1;
  }

  return v8;
}

- (BOOL)_ui_isUIFocusRegionContainerProxy
{
  return 1;
}

- (id)_focusSystem
{
  return +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self);
}

- (UIFocusEnvironment)owningEnvironment
{
  return -[_UIFocusEnvironmentContainerTuple owningEnvironment](self->_environmentContainer, "owningEnvironment");
}

- (id)_itemContainer
{
  return -[_UIFocusEnvironmentContainerTuple itemContainer](self->_environmentContainer, "itemContainer");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  v6 = v4
    && objc_msgSend(v4, "_ui_isUIFocusRegionContainerProxy")
    && -[_UIFocusEnvironmentContainerTuple isEqualToEnvironmentContainerTuple:](self->_environmentContainer, "isEqualToEnvironmentContainerTuple:", v5[2]);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_UIFocusRegionContainerProxy environmentContainer](self, "environmentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_UIFocusEnvironmentContainerTuple itemContainer](self->_environmentContainer, "itemContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("(nil)");
  }
  -[_UIFocusEnvironmentContainerTuple owningEnvironment](self->_environmentContainer, "owningEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>"), v12, v9);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = CFSTR("(nil)");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<UIFocusRegionContainer: %p; focusItemContainer: %@; owningEnvironment: %@>"),
    self,
    v8,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;
  void *v3;

  -[_UIFocusRegionContainerProxy owningEnvironment](self, "owningEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusEnvironmentPreferredFocusEnvironments(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[_UIFocusRegionContainerProxy owningEnvironment](self, "owningEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_UIFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v5))
    v6 = objc_msgSend(v5, "shouldUpdateFocusInContext:", v4);
  else
    v6 = 1;

  return v6;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIFocusRegionContainerProxy owningEnvironment](self, "owningEnvironment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_notifyEnvironment:didUpdateFocusInContext:", v6, v4);

}

- (void)setNeedsFocusUpdate
{
  void *v3;
  id v4;

  -[_UIFocusRegionContainerProxy _focusSystem](self, "_focusSystem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionContainerProxy owningEnvironment](self, "owningEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestFocusUpdateToEnvironment:", v3);

}

- (void)updateFocusIfNeeded
{
  id v2;

  -[_UIFocusRegionContainerProxy _focusSystem](self, "_focusSystem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFocusIfNeeded");

}

- (UIFocusEnvironment)parentFocusEnvironment
{
  void *v2;
  id v3;
  void *v4;

  -[_UIFocusRegionContainerProxy owningEnvironment](self, "owningEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(v2, "parentFocusEnvironment");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return (UIFocusEnvironment *)v4;
}

- (CGRect)_clippingRectInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  -[_UIFocusRegionContainerProxy owningEnvironment](self, "owningEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "_clippingRectInCoordinateSpace:", v4);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)_isEligibleForFocusInteraction
{
  void *v2;
  char IsEligibleForFocusInteraction;

  -[_UIFocusRegionContainerProxy owningEnvironment](self, "owningEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsEligibleForFocusInteraction = _UIFocusEnvironmentIsEligibleForFocusInteraction(v2);

  return IsEligibleForFocusInteraction;
}

- (BOOL)_isEligibleForFocusOcclusion
{
  void *v2;
  char IsEligibleForFocusOcclusion;

  -[_UIFocusRegionContainerProxy owningEnvironment](self, "owningEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsEligibleForFocusOcclusion = _UIFocusEnvironmentIsEligibleForFocusOcclusion(v2, 0);

  return IsEligibleForFocusOcclusion;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_UIFocusRegionContainerProxy owningEnvironment](self, "owningEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  objc_msgSend(v3, "focusItemContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = -[_UIFocusRegionContainerProxy shouldCreateRegionForOwningItem](self, "shouldCreateRegionForOwningItem");
  v6 = -[_UIFocusRegionContainerProxy allowsLazyLoading](self, "allowsLazyLoading");
  v7 = -[_UIFocusRegionContainerProxy shouldCreateRegionForGuideBehavior](self, "shouldCreateRegionForGuideBehavior");
  -[_UIFocusRegionContainerProxy owningEnvironment](self, "owningEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  v9 = 0x10000;
  if (!v7)
    v9 = 0;
  v10 = 256;
  if (!v6)
    v10 = 0;
  _UIFocusRegionSearchContextSearchForFocusRegionsInEnvironment(v4, v8, v10 | v5 | v9);

}

- (BOOL)allowsLazyLoading
{
  return self->_allowsLazyLoading;
}

- (void)setAllowsLazyLoading:(BOOL)a3
{
  self->_allowsLazyLoading = a3;
}

- (BOOL)shouldCreateRegionForOwningItem
{
  return self->_shouldCreateRegionForOwningItem;
}

- (void)setShouldCreateRegionForOwningItem:(BOOL)a3
{
  self->_shouldCreateRegionForOwningItem = a3;
}

- (BOOL)shouldCreateRegionForGuideBehavior
{
  return self->_shouldCreateRegionForGuideBehavior;
}

- (void)setShouldCreateRegionForGuideBehavior:(BOOL)a3
{
  self->_shouldCreateRegionForGuideBehavior = a3;
}

- (_UIFocusEnvironmentContainerTuple)environmentContainer
{
  return self->_environmentContainer;
}

- (void)setEnvironmentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_environmentContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentContainer, 0);
}

@end
