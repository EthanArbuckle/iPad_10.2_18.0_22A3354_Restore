@implementation _UILabelLayer

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UILabelLayer _updateSublayers](self, "_updateSublayers");
  if (self && (self->_contentLayer || self->_lightReactiveLayer || self->_lightInertLayer))
  {
    -[_UILabelLayer _updateLayers:](self, &__block_literal_global_650);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UILabelLayer;
    -[_UILabelLayer setNeedsDisplayInRect:](&v8, sel_setNeedsDisplayInRect_, x, y, width, height);
  }
}

- (void)setContentsScale:(double)a3
{
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UILabelLayer;
  -[_UILabelLayer setContentsScale:](&v6, sel_setContentsScale_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34___UILabelLayer_setContentsScale___block_invoke;
  v5[3] = &__block_descriptor_40_e17_v16__0__CALayer_8l;
  *(double *)&v5[4] = a3;
  -[_UILabelLayer _updateLayers:](self, v5);
}

- (id)_labelLayerToClipDuringBoundsSizeAnimation
{
  if (self->_contentLayer)
    self = (_UILabelLayer *)self->_contentLayer;
  return self;
}

- (void)setFrame:(CGRect)a3
{
  _QWORD v3[5];
  CGRect v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26___UILabelLayer_setFrame___block_invoke;
  v3[3] = &unk_1E16B20D8;
  v4 = a3;
  v3[4] = self;
  -[_UILabelLayer _setFrameOrBounds:settingAction:]((uint64_t)self, v3);
}

- (void)setBounds:(CGRect)a3
{
  _QWORD v3[5];
  CGRect v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27___UILabelLayer_setBounds___block_invoke;
  v3[3] = &unk_1E16B20D8;
  v4 = a3;
  v3[4] = self;
  -[_UILabelLayer _setFrameOrBounds:settingAction:]((uint64_t)self, v3);
}

- (void)_setFrameOrBounds:(uint64_t)a1 settingAction:(void *)a2
{
  void *v3;
  uint64_t v4;
  void (**v5)(void);

  v5 = a2;
  if (a1)
  {
    v5[2]();
    if (*(_QWORD *)(a1 + 32) || *(_QWORD *)(a1 + 40) || *(_QWORD *)(a1 + 48))
    {
      objc_msgSend((id)a1, "setNeedsLayout");
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
      {
        v3 = *(void **)(a1 + 32);
        if (v3)
        {
          v4 = objc_msgSend(v3, "wantsAnimation");
          objc_msgSend(*(id *)(a1 + 32), "setWantsAnimation:", 1);
          objc_msgSend((id)a1, "layoutBelowIfNeeded");
          objc_msgSend(*(id *)(a1 + 32), "setWantsAnimation:", v4);
        }
      }
    }
  }

}

- (void)invalidateContentInsets
{
  self->_contentInsetsValid = 0;
  if (self->_contentLayer || self->_lightReactiveLayer || self->_lightInertLayer)
    -[_UILabelLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)setNeedsDisplayOnBoundsChange:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UILabelLayer;
  -[_UILabelLayer setNeedsDisplayOnBoundsChange:](&v7, sel_setNeedsDisplayOnBoundsChange_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47___UILabelLayer_setNeedsDisplayOnBoundsChange___block_invoke;
  v5[3] = &__block_descriptor_33_e17_v16__0__CALayer_8l;
  v6 = a3;
  -[_UILabelLayer _updateLayers:](self, v5);
}

- (void)setMasksToBounds:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[_UILabelLayer masksToBounds](self, "masksToBounds") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UILabelLayer;
    -[_UILabelLayer setMasksToBounds:](&v5, sel_setMasksToBounds_, v3);
    -[_UILabelLayer _updateSublayers](self, "_updateSublayers");
    -[_UILabelLayer setNeedsLayout](self, "setNeedsLayout");
    -[_UILabelLayer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setContentsGravity:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UILabelLayer;
  -[_UILabelLayer setContentsGravity:](&v8, sel_setContentsGravity_, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36___UILabelLayer_setContentsGravity___block_invoke;
  v6[3] = &unk_1E16EA650;
  v7 = v4;
  v5 = v4;
  -[_UILabelLayer _updateLayers:](self, v6);

}

- (void)setContentsMultiplyColor:(CGColor *)a3
{
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UILabelLayer;
  -[_UILabelLayer setContentsMultiplyColor:](&v6, sel_setContentsMultiplyColor_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42___UILabelLayer_setContentsMultiplyColor___block_invoke;
  v5[3] = &__block_descriptor_40_e17_v16__0__CALayer_8l;
  v5[4] = a3;
  -[_UILabelLayer _updateLayers:](self, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightContainerView, 0);
  objc_storeStrong((id *)&self->_lightInertLayer, 0);
  objc_storeStrong((id *)&self->_lightReactiveLayer, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
}

- (void)layoutSublayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  uint64_t v25;
  double v26;
  objc_super v27;
  _QWORD v28[5];
  _QWORD v29[2];
  void *v30;
  void *v31;
  _UILabelLayer *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect v38;

  if (self)
  {
    if (!self->_contentInsetsValid)
      -[_UILabelLayer updateContentInsets](self, "updateContentInsets");
    if (self->_contentLayer || self->_lightReactiveLayer || self->_lightInertLayer)
    {
      -[_UILabelLayer bounds](self, "bounds");
      v4 = v3;
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v11 = -[_UILabelLayer oversizeEdgesIncludedInLabelLayer](self, "oversizeEdgesIncludedInLabelLayer");
      v12 = self->_contentInsets.top + 0.0;
      if ((v11 & 1) != 0)
        v12 = 0.0;
      v13 = self->_contentInsets.left + 0.0;
      if ((~v11 & 2) == 0)
        v13 = 0.0;
      v14 = self->_contentInsets.bottom + 0.0;
      if ((~v11 & 4) == 0)
        v14 = 0.0;
      v15 = self->_contentInsets.right + 0.0;
      if ((~v11 & 8) == 0)
        v15 = 0.0;
      v26 = v4 + v13;
      v16 = v6 + v12;
      v17 = v8 - (v13 + v15);
      v18 = v10 - (v12 + v14);
      v37.origin.x = v4;
      v37.origin.y = v6;
      v37.size.width = v8;
      v37.size.height = v10;
      if (CGRectGetHeight(v37) == 0.0)
        v18 = 0.0;
      v38.origin.x = v4;
      v38.origin.y = v6;
      v38.size.width = v8;
      v38.size.height = v10;
      if (CGRectGetWidth(v38) == 0.0)
        v19 = 0.0;
      else
        v19 = v17;
      -[_UILabelContentLayer frame](self->_contentLayer, "frame");
      v24 = _UIRectEquivalentToRectWithAccuracy(v20, v21, v22, v23, v26, v16, v19, v18, 0.0001);
      v25 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      if (v24)
      {
        v30 = __39___UILabelLayer_updateContentLayerSize__block_invoke;
        v31 = &unk_1E16B20D8;
        v32 = self;
        v33 = v26;
        v34 = v16;
        v35 = v19;
        v36 = v18;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v29);
      }
      else
      {
        v30 = __39___UILabelLayer_updateContentLayerSize__block_invoke_3;
        v31 = &__block_descriptor_64_e17_v16__0__CALayer_8l;
        v32 = *(_UILabelLayer **)&v26;
        v33 = v16;
        v34 = v19;
        v35 = v18;
        -[_UILabelLayer _updateLayers:](self, v29);
      }
      v28[0] = v25;
      v28[1] = 3221225472;
      v28[2] = __39___UILabelLayer_updateContentLayerSize__block_invoke_4;
      v28[3] = &unk_1E16EA650;
      v28[4] = self;
      -[_UILabelLayer _updateLayers:](self, v28);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)_UILabelLayer;
  -[_UILabelLayer layoutSublayers](&v27, sel_layoutSublayers);
}

- (void)updateContentInsets
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  float64x2_t v9;
  float64x2_t v10;
  id v11;

  -[_UILabelLayer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UILabelLayer delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(float64x2_t *)&self->_contentInsets.bottom;
    v10 = *(float64x2_t *)&self->_contentInsets.top;
    v11 = v4;
    objc_msgSend(v4, "_contentInsetsFromFonts");
    self->_contentInsets.top = v5;
    self->_contentInsets.left = v6;
    self->_contentInsets.bottom = v7;
    self->_contentInsets.right = v8;
    self->_contentInsetsValid = 1;
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v10, *(float64x2_t *)&self->_contentInsets.top), (int32x4_t)vceqq_f64(v9, *(float64x2_t *)&self->_contentInsets.bottom))), 0xFuLL))) & 1) == 0)
    {
      -[_UILabelLayer _updateSublayers](self, "_updateSublayers");
      -[_UILabelLayer setNeedsDisplay](self, "setNeedsDisplay");
    }

  }
}

- (unint64_t)oversizeEdgesIncludedInLabelLayer
{
  return self->_oversizeEdgesIncludedInLabelLayer;
}

- (void)setContentsFormat:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UILabelLayer;
  -[_UILabelLayer setContentsFormat:](&v8, sel_setContentsFormat_, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35___UILabelLayer_setContentsFormat___block_invoke;
  v6[3] = &unk_1E16EA650;
  v7 = v4;
  v5 = v4;
  -[_UILabelLayer _updateLayers:](self, v6);

}

- (void)_setLabelMasksToBoundsForAnimation:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UILabelLayer;
  -[_UILabelLayer setMasksToBounds:](&v3, sel_setMasksToBounds_, a3);
}

- (void)_updateLayers:(_QWORD *)a1
{
  void (**v3)(void);

  v3 = a2;
  if (a1)
  {
    if (a1[4])
      v3[2]();
    if (a1[5])
      v3[2]();
    if (a1[6])
      v3[2]();
  }

}

- (void)_updateSublayers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  if (self)
  {
    if ((-[_UILabelLayer masksToBounds](self, "masksToBounds") & 1) == 0
      && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_contentInsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_contentInsets.bottom))))) & 1) != 0|| (-[_UILabelLayer lightContainerView](self, "lightContainerView"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
    {
      if (!self->_contentLayer)
      {
        -[_UILabelLayer lightContainerView](self, "lightContainerView");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v4)
        {
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __33___UILabelLayer__updateSublayers__block_invoke;
          v9[3] = &unk_1E16B1B28;
          v9[4] = self;
          v6 = v9;
          goto LABEL_14;
        }
      }
      -[_UILabelLayer lightContainerView](self, "lightContainerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 && !self->_lightReactiveLayer && !self->_lightInertLayer)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __33___UILabelLayer__updateSublayers__block_invoke_2;
        v8[3] = &unk_1E16B1B28;
        v8[4] = self;
        v6 = v8;
LABEL_14:
        -[_UILabelLayer _configureSublayers:]((uint64_t)self, v6);
      }
    }
    else if (self->_contentLayer
           || (self->_lightReactiveLayer || self->_lightInertLayer)
           && (-[_UILabelLayer lightContainerView](self, "lightContainerView"),
               v7 = (void *)objc_claimAutoreleasedReturnValue(),
               v7,
               !v7))
    {
      -[_UILabelLayer _removeSublayers]((id *)&self->super.super.isa);
    }
  }
}

- (void)_removeSublayers
{
  id v2;
  id v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1[4], "removeFromSuperlayer");
    objc_msgSend(a1[5], "removeFromSuperlayer");
    objc_msgSend(a1[6], "removeFromSuperlayer");
    v2 = a1[4];
    a1[4] = 0;

    v3 = a1[5];
    a1[5] = 0;

    v4 = a1[6];
    a1[6] = 0;

  }
}

- (uint64_t)_configureSublayers:(uint64_t)result
{
  id *v2;
  void (**v3)(_QWORD);
  _QWORD v4[5];

  if (result)
  {
    v2 = (id *)result;
    v3 = a2;
    -[_UILabelLayer _removeSublayers](v2);
    v3[2](v3);

    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __37___UILabelLayer__configureSublayers___block_invoke;
    v4[3] = &unk_1E16EA650;
    v4[4] = v2;
    -[_UILabelLayer _updateLayers:](v2, v4);
    objc_msgSend(v2, "setContents:", 0);
    return objc_msgSend(v2, "setNeedsLayout");
  }
  return result;
}

- (void)reactToLightChanged
{
  -[_UILabelLayer _updateSublayers](self, "_updateSublayers");
  -[_UILabelLayer setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)_glyphPathBoundsExcedesLayers:(CGRect)a3 drawableGlyphPathBounds:(CGRect *)a4 edgesClipped:(unint64_t *)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  _UILabelContentLayer *contentLayer;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  BOOL v40;
  CGFloat MinX;
  double v42;
  _BOOL4 v43;
  uint64_t v44;
  double MaxY;
  double MinY;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGRect v54;
  double MaxX;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UILabelLayer delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:toView:", v13, x, y, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  contentLayer = self->_contentLayer;
  v54.size.width = width;
  v54.size.height = height;
  v54.origin.x = x;
  v54.origin.y = y;
  if (contentLayer)
    -[_UILabelContentLayer frame](contentLayer, "frame");
  else
    -[_UILabelLayer bounds](self, "bounds");
  v27 = v23;
  v28 = v24;
  v29 = v25;
  v30 = v26;
  v50 = v26;
  v51 = v25;
  v52 = v24;
  v53 = v23;
  objc_msgSend(v12, "window");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:toView:", v31, v27, v28, v29, v30);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  v56.origin.x = v33;
  v56.origin.y = v35;
  v56.size.width = v37;
  v56.size.height = v39;
  v66.origin.x = v15;
  v66.origin.y = v17;
  v66.size.width = v19;
  v66.size.height = v21;
  if (!CGRectIntersectsRect(v56, v66))
    goto LABEL_6;
  v57.origin.x = v33;
  v57.origin.y = v35;
  v57.size.width = v37;
  v57.size.height = v39;
  v49 = v15;
  v67.origin.x = v15;
  v67.origin.y = v17;
  v67.size.width = v19;
  v67.size.height = v21;
  if (!CGRectContainsRect(v57, v67))
  {
    if (a4)
    {
      v68.origin.y = v52;
      v68.origin.x = v53;
      v68.size.height = v50;
      v68.size.width = v51;
      *a4 = CGRectIntersection(v54, v68);
    }
    if (a5)
    {
      v58.origin.x = v15;
      v58.origin.y = v17;
      v58.size.width = v19;
      v58.size.height = v21;
      MinX = CGRectGetMinX(v58);
      v59.size.height = v39;
      v48 = v39;
      v42 = MinX;
      v59.origin.x = v33;
      v59.origin.y = v35;
      v59.size.width = v37;
      v43 = v42 < CGRectGetMinX(v59);
      v60.origin.x = v15;
      v60.origin.y = v17;
      v60.size.width = v19;
      v60.size.height = v21;
      MaxX = CGRectGetMaxX(v60);
      v61.origin.x = v33;
      v61.origin.y = v35;
      v61.size.width = v37;
      v61.size.height = v48;
      if (MaxX <= CGRectGetMaxX(v61))
        v44 = 2 * v43;
      else
        v44 = (2 * v43) | 8;
      v62.origin.x = v15;
      v62.origin.y = v17;
      v62.size.width = v19;
      v62.size.height = v21;
      MaxY = CGRectGetMaxY(v62);
      v63.origin.x = v33;
      v63.origin.y = v35;
      v63.size.width = v37;
      v63.size.height = v48;
      if (MaxY > CGRectGetMaxY(v63))
        v44 |= 4uLL;
      v64.origin.x = v49;
      v64.origin.y = v17;
      v64.size.width = v19;
      v64.size.height = v21;
      MinY = CGRectGetMinY(v64);
      v65.origin.x = v33;
      v65.origin.y = v35;
      v65.size.width = v37;
      v65.size.height = v48;
      *a5 = v44 | (MinY < CGRectGetMinY(v65));
    }
    v40 = 1;
  }
  else
  {
LABEL_6:
    v40 = 0;
  }

  return v40;
}

- (void)_clearContents
{
  -[_UILabelLayer setContents:](self, "setContents:", 0);
  -[_UILabelLayer _updateLayers:](self, &__block_literal_global_18_0);
}

- (BOOL)letterformAwareInsetsAreValid
{
  return self->_contentInsetsValid;
}

- (UIEdgeInsets)letterformAwareInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setOversizeEdgesIncludedInLabelLayer:(unint64_t)a3
{
  self->_oversizeEdgesIncludedInLabelLayer = a3;
}

- (UIView)lightContainerView
{
  return self->_lightContainerView;
}

- (void)setLightContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_lightContainerView, a3);
}

@end
