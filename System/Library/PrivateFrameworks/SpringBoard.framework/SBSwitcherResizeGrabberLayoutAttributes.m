@implementation SBSwitcherResizeGrabberLayoutAttributes

+ (id)attributesWithLeafAppLayout:(id)a3 edge:(unint64_t)a4
{
  id v5;
  SBSwitcherResizeGrabberLayoutAttributes *v6;

  v5 = a3;
  v6 = objc_alloc_init(SBSwitcherResizeGrabberLayoutAttributes);
  -[SBSwitcherResizeGrabberLayoutAttributes setLeafAppLayout:](v6, "setLeafAppLayout:", v5);

  -[SBSwitcherResizeGrabberLayoutAttributes setEdge:](v6, "setEdge:", a4);
  return v6;
}

- (void)setLeafAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_leafAppLayout, a3);
}

- (void)setEdge:(unint64_t)a3
{
  self->_edge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafAppLayout, 0);
}

- (SBAppLayout)leafAppLayout
{
  return self->_leafAppLayout;
}

- (unint64_t)edge
{
  return self->_edge;
}

- (id)_copy
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)objc_opt_class());
  v4 = (void *)-[SBAppLayout copy](self->_leafAppLayout, "copy");
  objc_msgSend(v3, "setLeafAppLayout:", v4);

  objc_msgSend(v3, "setEdge:", self->_edge);
  return v3;
}

@end
