@implementation SBSAContainerPanGestureDescription

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double x;
  double y;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  SBSAContainerPanGestureDescription *v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __46__SBSAContainerPanGestureDescription_isEqual___block_invoke;
  v20[3] = &unk_1E8E9EA50;
  v7 = v4;
  v21 = v7;
  v22 = self;
  objc_msgSend(v5, "appendEqualsBlocks:", v20, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __46__SBSAContainerPanGestureDescription_isEqual___block_invoke_2;
  v18[3] = &unk_1E8E9EA78;
  v9 = v7;
  v19 = v9;
  objc_msgSend(v8, "appendCGPoint:counterpart:", v18, self->_initialLocation.x, self->_initialLocation.y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __46__SBSAContainerPanGestureDescription_isEqual___block_invoke_3;
  v16[3] = &unk_1E8E9EA78;
  v17 = v9;
  x = self->_translation.x;
  y = self->_translation.y;
  v13 = v9;
  objc_msgSend(v10, "appendCGPoint:counterpart:", v16, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v14, "isEqual");

  return v6;
}

id __46__SBSAContainerPanGestureDescription_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)SBSAContainerPanGestureDescription;
  return objc_msgSendSuper2(&v3, sel_isEqual_, v1);
}

uint64_t __46__SBSAContainerPanGestureDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "initialLocation");
}

uint64_t __46__SBSAContainerPanGestureDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "translation");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = 3221225472;
  v9[2] = __42__SBSAContainerPanGestureDescription_hash__block_invoke;
  v9[3] = &unk_1E8E9EAA0;
  v9[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v3, "appendHashingBlocks:", v9, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCGPoint:", self->_initialLocation.x, self->_initialLocation.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendCGPoint:", self->_translation.x, self->_translation.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

id __42__SBSAContainerPanGestureDescription_hash__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)SBSAContainerPanGestureDescription;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSAContainerPanGestureDescription;
  -[SBSAGestureDescription description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromCGPoint(self->_initialLocation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_translation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("; initialLocation: %@; translation: %@; "), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "insertString:atIndex:", v8, objc_msgSend(v4, "rangeOfString:options:", CFSTR(">"), 4));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSAContainerPanGestureDescription;
  result = -[SBSAGestureDescription copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_OWORD *)result + 2) = self->_initialLocation;
  *((_OWORD *)result + 3) = self->_translation;
  return result;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)initialLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialLocation.x;
  y = self->_initialLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setInitialLocation:(CGPoint)a3
{
  self->_initialLocation = a3;
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

- (void)_setTranslation:(CGPoint)a3
{
  self->_translation = a3;
}

@end
