@implementation SBSwipeToKillSwitcherModifierEvent

- (SBSwipeToKillSwitcherModifierEvent)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 progress:(double)a5 translation:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  id v12;
  SBSwipeToKillSwitcherModifierEvent *v13;
  SBSwipeToKillSwitcherModifierEvent *v14;
  objc_super v16;

  y = a6.y;
  x = a6.x;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBSwipeToKillSwitcherModifierEvent;
  v13 = -[SBSwipeToKillSwitcherModifierEvent init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_layoutRole = a3;
    objc_storeStrong((id *)&v13->_appLayout, a4);
    v14->_progress = a5;
    v14->_translation.x = x;
    v14->_translation.y = y;
  }

  return v14;
}

- (int64_t)type
{
  return 12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSwipeToKillSwitcherModifierEvent;
  v4 = -[SBChainableModifierEvent copyWithZone:](&v8, sel_copyWithZone_, a3);
  v4[4] = self->_layoutRole;
  v5 = -[SBAppLayout copy](self->_appLayout, "copy");
  v6 = (void *)v4[5];
  v4[5] = v5;

  v4[6] = *(_QWORD *)&self->_progress;
  *((_OWORD *)v4 + 4) = self->_translation;
  *((_BYTE *)v4 + 24) = self->_dragging;
  v4[7] = *(_QWORD *)&self->_decelerationTargetProgress;
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifierEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v11, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("progress"), self->_progress);
  v6 = (id)objc_msgSend(v4, "appendPoint:withName:", CFSTR("translation"), self->_translation.x, self->_translation.y);
  SBLayoutRoleDescription(self->_layoutRole);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("role"));

  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("appLayout"));

  return v4;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (CGPoint)translation
{
  double x;
  double y;
  CGPoint result;

  x = self->_translation.x;
  y = self->_translation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTranslation:(CGPoint)a3
{
  self->_translation = a3;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (void)setDragging:(BOOL)a3
{
  self->_dragging = a3;
}

- (double)decelerationTargetProgress
{
  return self->_decelerationTargetProgress;
}

- (void)setDecelerationTargetProgress:(double)a3
{
  self->_decelerationTargetProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
