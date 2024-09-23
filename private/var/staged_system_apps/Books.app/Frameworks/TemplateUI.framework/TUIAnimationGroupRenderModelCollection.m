@implementation TUIAnimationGroupRenderModelCollection

- (id)copyWithZone:(_NSZone *)a3
{
  TUIAnimationGroupRenderModelCollection *v4;
  NSDictionary *v5;
  NSDictionary *groupPhases;

  v4 = -[TUIAnimationGroupRenderModelCollection init](+[TUIAnimationGroupRenderModelCollection allocWithZone:](TUIAnimationGroupRenderModelCollection, "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = (NSDictionary *)-[NSDictionary copy](self->_groupPhases, "copy");
    groupPhases = v4->_groupPhases;
    v4->_groupPhases = v5;

  }
  return v4;
}

- (NSDictionary)groupPhases
{
  return self->_groupPhases;
}

- (void)setGroupPhases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupPhases, 0);
}

@end
