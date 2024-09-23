@implementation TUIAnimationGroupPhaseRenderModelCollection

- (id)copyWithZone:(_NSZone *)a3
{
  TUIAnimationGroupPhaseRenderModelCollection *v4;
  NSDictionary *v5;
  NSDictionary *phaseRenderModels;

  v4 = -[TUIAnimationGroupPhaseRenderModelCollection init](+[TUIAnimationGroupPhaseRenderModelCollection allocWithZone:](TUIAnimationGroupPhaseRenderModelCollection, "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = (NSDictionary *)-[NSDictionary copy](self->_phaseRenderModels, "copy");
    phaseRenderModels = v4->_phaseRenderModels;
    v4->_phaseRenderModels = v5;

  }
  return v4;
}

- (NSDictionary)phaseRenderModels
{
  return self->_phaseRenderModels;
}

- (void)setPhaseRenderModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phaseRenderModels, 0);
}

@end
