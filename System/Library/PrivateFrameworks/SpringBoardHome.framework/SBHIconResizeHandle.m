@implementation SBHIconResizeHandle

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  -[SBHIconResizeHandle layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "path");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithCGPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowPath:", v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self, v5);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithPath:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (SBIconResizeHandleMetrics)metrics
{
  char *v3;
  double v4;
  int64_t v5;
  __int128 v6;
  __int128 v7;

  v3 = (char *)self + OBJC_IVAR___SBHIconResizeHandle_metrics;
  v4 = *(double *)((char *)&self->var4 + OBJC_IVAR___SBHIconResizeHandle_metrics);
  v5 = *(int64_t *)((char *)&self->var5 + OBJC_IVAR___SBHIconResizeHandle_metrics);
  v6 = *(_OWORD *)((char *)&self->var2 + OBJC_IVAR___SBHIconResizeHandle_metrics);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self->var0 + OBJC_IVAR___SBHIconResizeHandle_metrics);
  *(_OWORD *)&retstr->var2 = v6;
  retstr->var4 = v4;
  retstr->var5 = v5;
  v7 = *((_OWORD *)v3 + 4);
  *(_OWORD *)&retstr->var6.top = *((_OWORD *)v3 + 3);
  *(_OWORD *)&retstr->var6.bottom = v7;
  return self;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (UIView)backgroundView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___SBHIconResizeHandle_backgroundView));
}

- (UIGestureRecognizer)resizingGestureRecognizer
{
  return (UIGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                        + OBJC_IVAR___SBHIconResizeHandle_resizingGestureRecognizer));
}

- (void)setResizingGestureRecognizer:(id)a3
{
  SBHIconResizeHandle *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1D0157DEC(a3);

}

- (SBHIconResizeHandle)initWithMetrics:(SBIconResizeHandleMetrics *)a3 iconImageInfo:(SBIconImageInfo *)a4 backgroundView:(id)a5
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double var4;
  int64_t var5;
  __int128 v14;
  __int128 v15;
  _OWORD v17[2];
  double v18;
  int64_t v19;
  __int128 v20;
  __int128 v21;

  v9 = v7;
  v10 = v6;
  v11 = v5;
  var4 = a3->var4;
  var5 = a3->var5;
  v14 = *(_OWORD *)&a3->var2;
  v17[0] = *(_OWORD *)&a3->var0;
  v17[1] = v14;
  v18 = var4;
  v19 = var5;
  v15 = *(_OWORD *)&a3->var6.bottom;
  v20 = *(_OWORD *)&a3->var6.top;
  v21 = v15;
  return (SBHIconResizeHandle *)sub_1D015655C(v17, a4, v11, v10, v9, v8);
}

- (SBHIconResizeHandle)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo19SBHIconResizeHandleC15SpringBoardHomeE5coderABSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIView *v10;
  SBHIconResizeHandle *v11;

  v11 = self;
  -[SBHIconResizeHandle bounds](v11, sel_bounds);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = -[SBHIconResizeHandle backgroundView](v11, sel_backgroundView);
  -[UIView setFrame:](v10, sel_setFrame_, v3, v5, v7, v9);

  objc_msgSend(*(id *)((char *)&v11->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_whiteTintView), sel_setFrame_, v3, v5, v7, v9);
  objc_msgSend(*(id *)((char *)&v11->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_highlightView), sel_setFrame_, v3, v5, v7, v9);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[SBHIconResizeHandle iconImageInfo](self, sel_iconImageInfo, a3.width, a3.height);
  v4 = v3;
  v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)highlighted
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  char v3;
  SBHIconResizeHandle *v4;

  v3 = *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_isHighlighted);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_isHighlighted) = a3;
  v4 = self;
  sub_1D01573CC(v3);

}

- (BOOL)isResizing
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle__isResizing);
}

- (void)setResizing:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle__isResizing) = a3;
}

- (BOOL)darkStyle
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_isDarkStyle);
}

- (void)setDarkStyle:(BOOL)a3
{
  void *v3;
  double v4;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_isDarkStyle) = a3;
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_whiteTintView);
  v4 = 0.42;
  if (a3)
    v4 = 0.0;
  objc_msgSend(v3, sel_setAlpha_, v4);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  SBHIconResizeHandle *v7;
  Swift::String_optional v8;
  Swift::Bool v9;

  if (a3)
  {
    v4 = sub_1D015F030();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  v9 = SBHIconResizeHandle._shouldAnimateProperty(withKey:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  long double y;
  CGFloat x;
  id v7;
  SBHIconResizeHandle *v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  LOBYTE(self) = _sSo19SBHIconResizeHandleC15SpringBoardHomeE5point6inside4withSbSo7CGPointV_So7UIEventCSgtF_0(x, y);

  return self & 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1D0157BE8(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesBegan_withEvent_, 1);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  SBHIconResizeHandle *v7;
  void *v8;
  objc_super v9;

  sub_1D01562D8(0, &qword_1EFC0F5A0);
  sub_1D0158280();
  sub_1D015F06C();
  v6 = a4;
  v7 = self;
  v8 = (void *)sub_1D015F060();
  v9.receiver = v7;
  v9.super_class = (Class)SBHIconResizeHandle;
  -[SBHIconResizeHandle touchesCancelled:withEvent:](&v9, sel_touchesCancelled_withEvent_, v8, v6);

  if (!-[SBHIconResizeHandle isResizing](v7, sel_isResizing))
    -[SBHIconResizeHandle setHighlighted:](v7, sel_setHighlighted_, 0);

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1D0157BE8(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_, 0);
}

- (SBHIconResizeHandle)initWithFrame:(CGRect)a3
{
  SBHIconResizeHandle *result;

  result = (SBHIconResizeHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
