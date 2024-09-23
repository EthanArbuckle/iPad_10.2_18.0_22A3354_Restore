@implementation PSPointerHoverRegion

- (PSPointerHoverRegion)init
{
  PSPointerHoverRegion *v2;
  PSPointerHoverRegion *v3;
  uint64_t v4;
  PSPointerShape *pointerShape;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSPointerHoverRegion;
  v2 = -[PSPointerHoverRegion init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_contentHoverInverseScale = 1.0;
    +[PSPointerShape systemShape](PSPointerShape, "systemShape");
    v4 = objc_claimAutoreleasedReturnValue();
    pointerShape = v3->_pointerShape;
    v3->_pointerShape = (PSPointerShape *)v4;

    v3->_pointerVisualIntensity = 1.0;
  }
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PSPointerHoverRegion _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (PSPointerHoverRegion)initWithCoder:(id)a3
{
  id v4;
  PSPointerHoverRegion *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  uint64_t v12;
  PSMatchMoveSource *contentMatchMoveSource;
  uint64_t v14;
  NSValue *contentSlipValue;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  uint64_t v21;
  PSPointerPortalSourceCollection *pointerPortalSourceCollection;
  uint64_t v23;
  PSPointerShape *pointerShape;
  uint64_t v25;
  NSValue *pointerSlipValue;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *accessories;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PSPointerHoverRegion;
  v5 = -[PSPointerHoverRegion init](&v34, sel_init);
  if (v5)
  {
    v5->_coordinateSpaceSourceContextID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("coordinateSpaceSourceContextID"));
    v5->_coordinateSpaceSourceLayerRenderID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("coordinateSpaceSourceLayerRenderID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentBounds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_CGRectValue");
    v5->_contentBounds.origin.x = v7;
    v5->_contentBounds.origin.y = v8;
    v5->_contentBounds.size.width = v9;
    v5->_contentBounds.size.height = v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("contentHoverInverseScale"));
    v5->_contentHoverInverseScale = v11;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentMatchMoveSource"));
    v12 = objc_claimAutoreleasedReturnValue();
    contentMatchMoveSource = v5->_contentMatchMoveSource;
    v5->_contentMatchMoveSource = (PSMatchMoveSource *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentSlipValue"));
    v14 = objc_claimAutoreleasedReturnValue();
    contentSlipValue = v5->_contentSlipValue;
    v5->_contentSlipValue = (NSValue *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hitTestBounds"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bs_CGRectValue");
    v5->_hitTestBounds.origin.x = v17;
    v5->_hitTestBounds.origin.y = v18;
    v5->_hitTestBounds.size.width = v19;
    v5->_hitTestBounds.size.height = v20;

    v5->_overlayEffectStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("overlayEffectStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pointerPortalSourceCollection"));
    v21 = objc_claimAutoreleasedReturnValue();
    pointerPortalSourceCollection = v5->_pointerPortalSourceCollection;
    v5->_pointerPortalSourceCollection = (PSPointerPortalSourceCollection *)v21;

    v5->_pointerRecenteringAxes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pointerRecenteringAxes"));
    v5->_pointerLatchingAxes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pointerLatchingAxes"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pointerShape"));
    v23 = objc_claimAutoreleasedReturnValue();
    pointerShape = v5->_pointerShape;
    v5->_pointerShape = (PSPointerShape *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pointerSlipValue"));
    v25 = objc_claimAutoreleasedReturnValue();
    pointerSlipValue = v5->_pointerSlipValue;
    v5->_pointerSlipValue = (NSValue *)v25;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pointerVisualIntensity"));
    v5->_pointerVisualIntensity = v27;
    v5->_preferredPointerMaterialLuminance = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredPointerMaterialLuminance"));
    v5->_shouldPointerUnderlayContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldPointerUnderlayContent"));
    v5->_shouldPointerSuppressMirroring = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldPointerSuppressMirroring"));
    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("accessories"));
    v31 = objc_claimAutoreleasedReturnValue();
    accessories = v5->_accessories;
    v5->_accessories = (NSArray *)v31;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t coordinateSpaceSourceContextID;
  void *v5;
  void *v6;
  id v7;

  coordinateSpaceSourceContextID = self->_coordinateSpaceSourceContextID;
  v7 = a3;
  objc_msgSend(v7, "encodeInt32:forKey:", coordinateSpaceSourceContextID, CFSTR("coordinateSpaceSourceContextID"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_coordinateSpaceSourceLayerRenderID, CFSTR("coordinateSpaceSourceLayerRenderID"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", self->_contentBounds.origin.x, self->_contentBounds.origin.y, self->_contentBounds.size.width, self->_contentBounds.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("contentBounds"));

  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("contentHoverInverseScale"), self->_contentHoverInverseScale);
  objc_msgSend(v7, "encodeObject:forKey:", self->_contentMatchMoveSource, CFSTR("contentMatchMoveSource"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_contentSlipValue, CFSTR("contentSlipValue"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", self->_hitTestBounds.origin.x, self->_hitTestBounds.origin.y, self->_hitTestBounds.size.width, self->_hitTestBounds.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("hitTestBounds"));

  objc_msgSend(v7, "encodeInteger:forKey:", self->_overlayEffectStyle, CFSTR("overlayEffectStyle"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_pointerPortalSourceCollection, CFSTR("pointerPortalSourceCollection"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_pointerRecenteringAxes, CFSTR("pointerRecenteringAxes"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_pointerLatchingAxes, CFSTR("pointerLatchingAxes"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_pointerShape, CFSTR("pointerShape"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_pointerSlipValue, CFSTR("pointerSlipValue"));
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("pointerVisualIntensity"), self->_pointerVisualIntensity);
  objc_msgSend(v7, "encodeInteger:forKey:", self->_preferredPointerMaterialLuminance, CFSTR("preferredPointerMaterialLuminance"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_shouldPointerUnderlayContent, CFSTR("shouldPointerUnderlayContent"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_shouldPointerSuppressMirroring, CFSTR("shouldPointerSuppressMirroring"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_accessories, CFSTR("accessories"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_copyWithClass:(Class)a3
{
  CGSize *v4;
  CGSize *v5;
  CGSize size;
  uint64_t v7;
  CGFloat width;
  uint64_t v9;
  CGFloat height;
  CGPoint origin;
  uint64_t v12;
  CGFloat v13;
  uint64_t v14;
  CGFloat v15;
  uint64_t v16;
  CGFloat v17;
  uint64_t v18;
  CGFloat v19;

  v4 = (CGSize *)objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)&v4->height = self->_coordinateSpaceSourceLayerRenderID;
    LODWORD(v4[9].height) = self->_coordinateSpaceSourceContextID;
    size = self->_contentBounds.size;
    v4[1] = (CGSize)self->_contentBounds.origin;
    v4[2] = size;
    v4[3].width = self->_contentHoverInverseScale;
    v7 = -[PSMatchMoveSource copy](self->_contentMatchMoveSource, "copy");
    width = v5[4].width;
    *(_QWORD *)&v5[4].width = v7;

    v9 = -[NSValue copy](self->_contentSlipValue, "copy");
    height = v5[3].height;
    *(_QWORD *)&v5[3].height = v9;

    origin = self->_hitTestBounds.origin;
    *(CGSize *)((char *)v5 + 88) = self->_hitTestBounds.size;
    *(CGPoint *)&v5[4].height = origin;
    *(_QWORD *)&v5[10].width = self->_overlayEffectStyle;
    v12 = -[PSPointerPortalSourceCollection copy](self->_pointerPortalSourceCollection, "copy");
    v13 = v5[6].height;
    *(_QWORD *)&v5[6].height = v12;

    *(_QWORD *)&v5[7].width = self->_pointerRecenteringAxes;
    *(_QWORD *)&v5[11].width = self->_pointerLatchingAxes;
    v14 = -[PSPointerShape copy](self->_pointerShape, "copy");
    v15 = v5[7].height;
    *(_QWORD *)&v5[7].height = v14;

    v16 = -[NSValue copy](self->_pointerSlipValue, "copy");
    v17 = v5[8].width;
    *(_QWORD *)&v5[8].width = v16;

    v5[8].height = self->_pointerVisualIntensity;
    *(_QWORD *)&v5[9].width = self->_preferredPointerMaterialLuminance;
    LOBYTE(v5[10].height) = self->_shouldPointerUnderlayContent;
    BYTE1(v5[10].height) = self->_shouldPointerSuppressMirroring;
    v18 = -[NSArray copy](self->_accessories, "copy");
    v19 = v5[11].height;
    *(_QWORD *)&v5[11].height = v18;

  }
  return v5;
}

- (BOOL)isOverlayEffectVisible
{
  return -[PSPointerHoverRegion overlayEffectStyle](self, "overlayEffectStyle") != 0;
}

- (BOOL)isNumericDataValid
{
  _BOOL4 v3;
  double v4;
  double v5;
  BOOL v6;
  BOOL v7;
  NSValue *contentSlipValue;
  double v10;
  double v11;
  double v12;
  NSValue *pointerSlipValue;
  double v16;
  BOOL result;
  double v18;

  v3 = 0;
  if (fabs(self->_contentBounds.origin.x) != INFINITY)
  {
    v4 = fabs(self->_contentBounds.size.width);
    v5 = fabs(self->_contentBounds.size.height);
    v6 = fabs(self->_contentBounds.origin.y) == INFINITY || v4 == INFINITY;
    v7 = v6;
    if (!v7 && v5 != INFINITY)
      v3 = fabs(self->_contentHoverInverseScale) != INFINITY;
  }
  contentSlipValue = self->_contentSlipValue;
  if (contentSlipValue)
  {
    if (!v3)
      goto LABEL_28;
    -[NSValue bs_CGPointValue](contentSlipValue, "bs_CGPointValue");
    v3 = 0;
    if (fabs(v11) == INFINITY || fabs(v10) == INFINITY)
      goto LABEL_28;
  }
  else if (!v3)
  {
    goto LABEL_28;
  }
  v3 = 0;
  if (fabs(self->_hitTestBounds.origin.x) != INFINITY)
  {
    v12 = fabs(self->_hitTestBounds.size.width);
    if (fabs(self->_hitTestBounds.origin.y) != INFINITY && v12 != INFINITY)
      v3 = fabs(self->_hitTestBounds.size.height) != INFINITY;
  }
LABEL_28:
  pointerSlipValue = self->_pointerSlipValue;
  if (!pointerSlipValue)
  {
    if (v3)
      goto LABEL_34;
    return 0;
  }
  if (!v3)
    return 0;
  -[NSValue bs_CGPointValue](pointerSlipValue, "bs_CGPointValue");
  result = 0;
  if (fabs(v18) != INFINITY && fabs(v16) != INFINITY)
  {
LABEL_34:
    result = 0;
    if (fabs(self->_pointerVisualIntensity) == INFINITY)
      return result;
    if (self->_preferredPointerMaterialLuminance <= 2)
      return self->_overlayEffectStyle < 3uLL;
    return 0;
  }
  return result;
}

- (BOOL)isLatching
{
  return self->_pointerLatchingAxes != 0;
}

- (unint64_t)coordinateSpaceSourceLayerRenderID
{
  return self->_coordinateSpaceSourceLayerRenderID;
}

- (unsigned)coordinateSpaceSourceContextID
{
  return self->_coordinateSpaceSourceContextID;
}

- (PSPointerPortalSourceCollection)pointerPortalSourceCollection
{
  return self->_pointerPortalSourceCollection;
}

- (PSMatchMoveSource)contentMatchMoveSource
{
  return self->_contentMatchMoveSource;
}

- (CGRect)contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBounds.origin.x;
  y = self->_contentBounds.origin.y;
  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)contentHoverInverseScale
{
  return self->_contentHoverInverseScale;
}

- (NSValue)contentSlipValue
{
  return self->_contentSlipValue;
}

- (CGRect)hitTestBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_hitTestBounds.origin.x;
  y = self->_hitTestBounds.origin.y;
  width = self->_hitTestBounds.size.width;
  height = self->_hitTestBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)overlayEffectStyle
{
  return self->_overlayEffectStyle;
}

- (unint64_t)preferredPointerMaterialLuminance
{
  return self->_preferredPointerMaterialLuminance;
}

- (PSPointerShape)pointerShape
{
  return self->_pointerShape;
}

- (NSValue)pointerSlipValue
{
  return self->_pointerSlipValue;
}

- (unint64_t)pointerRecenteringAxes
{
  return self->_pointerRecenteringAxes;
}

- (unint64_t)pointerLatchingAxes
{
  return self->_pointerLatchingAxes;
}

- (double)pointerVisualIntensity
{
  return self->_pointerVisualIntensity;
}

- (BOOL)shouldPointerUnderlayContent
{
  return self->_shouldPointerUnderlayContent;
}

- (BOOL)shouldPointerSuppressMirroring
{
  return self->_shouldPointerSuppressMirroring;
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_pointerSlipValue, 0);
  objc_storeStrong((id *)&self->_pointerShape, 0);
  objc_storeStrong((id *)&self->_pointerPortalSourceCollection, 0);
  objc_storeStrong((id *)&self->_contentMatchMoveSource, 0);
  objc_storeStrong((id *)&self->_contentSlipValue, 0);
}

@end
