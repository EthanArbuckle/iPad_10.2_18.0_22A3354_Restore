@implementation _UILAConfigurationHistory

- (NSSet)_newlyUnhiddenItems
{
  return &self->_newlyUnhiddenItems->super;
}

- (NSSet)_newlyHiddenItems
{
  return &self->_newlyHiddenItems->super;
}

- (BOOL)isInLayoutArrangementUpdateSection
{
  return self->_inLayoutArrangementUpdateSection;
}

- (void)setLayoutFillsCanvas:(BOOL)a3
{
  self->_layoutFillsCanvas = a3;
}

- (void)setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3
{
  self->_layoutUsesCanvasMarginsWhenFilling = a3;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

- (void)setHasEstablishedBaseValues:(BOOL)a3
{
  self->_hasEstablishedBaseValues = a3;
}

- (NSSet)invalidBaselineConstraints
{
  return &self->_invalidBaselineConstraints->super;
}

- (int64_t)axis
{
  return self->_axis;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setHasEstablishedBaseValues:", self->_hasEstablishedBaseValues);
  objc_msgSend(v4, "setInLayoutArrangementUpdateSection:", self->_inLayoutArrangementUpdateSection);
  objc_msgSend(v4, "setAxis:", self->_axis);
  objc_msgSend(v4, "setLayoutFillsCanvas:", self->_layoutFillsCanvas);
  objc_msgSend(v4, "setLayoutUsesCanvasMarginsWhenFilling:", self->_layoutUsesCanvasMarginsWhenFilling);
  v5 = -[NSMutableSet mutableCopy](self->_newlyHiddenItems, "mutableCopy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSMutableSet mutableCopy](self->_newlyUnhiddenItems, "mutableCopy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSMutableSet mutableCopy](self->_invalidBaselineConstraints, "mutableCopy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

- (_UILAConfigurationHistory)init
{
  _UILAConfigurationHistory *v2;
  NSMutableSet *v3;
  NSMutableSet *newlyHiddenItems;
  NSMutableSet *v5;
  NSMutableSet *newlyUnhiddenItems;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UILAConfigurationHistory;
  v2 = -[_UILAConfigurationHistory init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    newlyHiddenItems = v2->_newlyHiddenItems;
    v2->_newlyHiddenItems = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    newlyUnhiddenItems = v2->_newlyUnhiddenItems;
    v2->_newlyUnhiddenItems = v5;

  }
  return v2;
}

- (void)setInLayoutArrangementUpdateSection:(BOOL)a3
{
  self->_inLayoutArrangementUpdateSection = a3;
}

- (BOOL)hasEstablishedBaseValues
{
  return self->_hasEstablishedBaseValues;
}

- (BOOL)layoutFillsCanvas
{
  return self->_layoutFillsCanvas;
}

- (BOOL)layoutUsesCanvasMarginsWhenFilling
{
  return self->_layoutUsesCanvasMarginsWhenFilling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidBaselineConstraints, 0);
  objc_storeStrong((id *)&self->_newlyUnhiddenItems, 0);
  objc_storeStrong((id *)&self->_newlyHiddenItems, 0);
}

- (void)_invalidateBaselineConstraint:(id)a3
{
  id v4;
  NSMutableSet *invalidBaselineConstraints;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  invalidBaselineConstraints = self->_invalidBaselineConstraints;
  v8 = v4;
  if (!invalidBaselineConstraints)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_invalidBaselineConstraints;
    self->_invalidBaselineConstraints = v6;

    v4 = v8;
    invalidBaselineConstraints = self->_invalidBaselineConstraints;
  }
  -[NSMutableSet addObject:](invalidBaselineConstraints, "addObject:", v4);

}

@end
