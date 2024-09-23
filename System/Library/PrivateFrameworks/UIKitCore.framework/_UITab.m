@implementation _UITab

- (BOOL)_isVisible
{
  return !-[UITab isHidden](self, "isHidden");
}

- (void)_setVisible:(BOOL)a3
{
  -[UITab setHidden:](self, "setHidden:", !a3);
}

- (int64_t)_tabBarPlacement
{
  int64_t v2;

  v2 = -[UITab preferredPlacement](self, "preferredPlacement");
  if ((unint64_t)(v2 - 1) > 5)
    return -1;
  else
    return qword_186679EA0[v2 - 1];
}

- (void)_setTabBarPlacement:(int64_t)a3
{
  uint64_t v3;

  if ((unint64_t)a3 > 5)
    v3 = 0;
  else
    v3 = qword_186679ED0[a3];
  -[UITab setPreferredPlacement:](self, "setPreferredPlacement:", v3);
}

- (id)_parentGroup
{
  return objc_loadWeakRetained((id *)&self->__parent);
}

- (void)_setAttributes:(int64_t)a3
{
  char v3;

  if (self->__attributes != a3)
  {
    v3 = a3;
    self->__attributes = a3;
    if ((a3 & 2) != 0)
      -[_UITab _setTabBarPlacement:](self, "_setTabBarPlacement:", 4);
    if ((v3 & 4) != 0)
      -[UITab setSpringLoaded:](self, "setSpringLoaded:", 1);
    -[UITab _contentDidChange](self, "_contentDidChange");
  }
}

- (BOOL)_isElement
{
  return 0;
}

- (BOOL)_isUniquelySPI
{
  return 1;
}

- (_UITabElementGroup)_parent
{
  return (_UITabElementGroup *)objc_loadWeakRetained((id *)&self->__parent);
}

- (void)set_parent:(id)a3
{
  objc_storeWeak((id *)&self->__parent, a3);
}

- (int64_t)_attributes
{
  return self->__attributes;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__parent);
}

@end
