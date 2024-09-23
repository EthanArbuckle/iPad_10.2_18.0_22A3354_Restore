@implementation FxParameterGroup

- (FxParameterGroup)init
{
  FxParameterGroup *v2;
  FxParameterGroupPriv *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FxParameterGroup;
  v2 = -[FxPinParameter init](&v5, sel_init);
  if (v2)
  {
    v3 = (FxParameterGroupPriv *)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    v2->_groupPriv = v3;
    if (v3)
      v2->_groupPriv->var0 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    -[FxPin setValueClass:](v2, "setValueClass:", objc_opt_class());
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FxParameterGroupPriv *groupPriv;
  objc_super v10;

  FxDebugAssert(self->_groupPriv != 0, CFSTR("_groupPriv == NULL"), v2, v3, v4, v5, v6, v7, (char)v10.receiver);
  groupPriv = self->_groupPriv;
  if (groupPriv)
  {
    if (groupPriv->var0)
    {

      groupPriv = self->_groupPriv;
    }
    free(groupPriv);
  }
  v10.receiver = self;
  v10.super_class = (Class)FxParameterGroup;
  -[FxPinParameter dealloc](&v10, sel_dealloc);
}

- (id)subPins
{
  return self->_groupPriv->var0;
}

- (void)setSubPins:(id)a3
{
  id var0;

  var0 = self->_groupPriv->var0;
  if (var0)

  self->_groupPriv->var0 = a3;
}

@end
