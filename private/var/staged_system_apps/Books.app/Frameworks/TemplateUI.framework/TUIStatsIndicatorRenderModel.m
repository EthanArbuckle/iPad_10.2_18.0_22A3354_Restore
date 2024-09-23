@implementation TUIStatsIndicatorRenderModel

- (TUIStatsIndicatorRenderModel)initWithStats:(id)a3 uid:(id)a4
{
  id v7;
  id v8;
  TUIStatsIndicatorRenderModel *v9;
  TUIStatsIndicatorRenderModel *v10;
  NSString *v11;
  NSString *uid;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIStatsIndicatorRenderModel;
  v9 = -[TUIStatsIndicatorRenderModel init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stats, a3);
    v11 = (NSString *)objc_msgSend(v8, "copy");
    uid = v10->_uid;
    v10->_uid = v11;

  }
  return v10;
}

- (unint64_t)kind
{
  return 4;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  return a3 == self;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TUIStatsFeed)stats
{
  return self->_stats;
}

- (NSString)uid
{
  return self->_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
