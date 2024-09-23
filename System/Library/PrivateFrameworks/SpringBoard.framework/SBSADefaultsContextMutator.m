@implementation SBSADefaultsContextMutator

- (SBSADefaultsContextMutator)initWithDefaultsContext:(id)a3
{
  id v5;
  SBSADefaultsContextMutator *v6;
  SBSADefaultsContextMutator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSADefaultsContextMutator;
  v6 = -[SBSADefaultsContextMutator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mutatable, a3);

  return v7;
}

- (void)setSuppressDynamicIslandCompletely:(BOOL)a3
{
  -[SBSADefaultsContext _setSuppressDynamicIslandCompletely:](self->_mutatable, "_setSuppressDynamicIslandCompletely:", a3);
}

- (void)setNeverRenderSystemApertureFillOnGPU:(BOOL)a3
{
  -[SBSADefaultsContext _setNeverRenderSystemApertureFillOnGPU:](self->_mutatable, "_setNeverRenderSystemApertureFillOnGPU:", a3);
}

- (void)setAlwaysShowSystemApertureOnClonedDisplays:(BOOL)a3
{
  -[SBSADefaultsContext _setAlwaysShowSystemApertureOnClonedDisplays:](self->_mutatable, "_setAlwaysShowSystemApertureOnClonedDisplays:", a3);
}

- (void)setAlwaysShowSystemApertureInSnapshots:(BOOL)a3
{
  -[SBSADefaultsContext _setAlwaysShowSystemApertureInSnapshots:](self->_mutatable, "_setAlwaysShowSystemApertureInSnapshots:", a3);
}

- (void)setAlwaysRenderSystemApertureFillOnGPU:(BOOL)a3
{
  -[SBSADefaultsContext _setAlwaysRenderSystemApertureFillOnGPU:](self->_mutatable, "_setAlwaysRenderSystemApertureFillOnGPU:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutatable, 0);
}

- (BOOL)suppressDynamicIslandCompletely
{
  return -[SBSADefaultsContext suppressDynamicIslandCompletely](self->_mutatable, "suppressDynamicIslandCompletely");
}

- (BOOL)alwaysShowSystemApertureOnClonedDisplays
{
  return -[SBSADefaultsContext alwaysShowSystemApertureOnClonedDisplays](self->_mutatable, "alwaysShowSystemApertureOnClonedDisplays");
}

- (BOOL)alwaysShowSystemApertureInSnapshots
{
  return -[SBSADefaultsContext alwaysShowSystemApertureInSnapshots](self->_mutatable, "alwaysShowSystemApertureInSnapshots");
}

- (BOOL)alwaysRenderSystemApertureFillOnGPU
{
  return -[SBSADefaultsContext alwaysRenderSystemApertureFillOnGPU](self->_mutatable, "alwaysRenderSystemApertureFillOnGPU");
}

- (BOOL)neverRenderSystemApertureFillOnGPU
{
  return -[SBSADefaultsContext neverRenderSystemApertureFillOnGPU](self->_mutatable, "neverRenderSystemApertureFillOnGPU");
}

- (BOOL)enableSystemApertureStateCollection
{
  return -[SBSADefaultsContext enableSystemApertureStateCollection](self->_mutatable, "enableSystemApertureStateCollection");
}

- (void)setEnableSystemApertureStateCollection:(BOOL)a3
{
  -[SBSADefaultsContext _setEnableSystemApertureStateCollection:](self->_mutatable, "_setEnableSystemApertureStateCollection:", a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; defaultsContext: %@>"),
               objc_opt_class(),
               self,
               self->_mutatable);
}

- (SBSADefaultsContext)mutatable
{
  return self->_mutatable;
}

@end
