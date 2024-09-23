@implementation UILabel

- (_QWORD)_setMaterialTextColorFollowsTintColor:(_QWORD *)result
{
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v2 = result[93];
    if (a2 != v2 >> 31)
    {
      v3 = 0x80000000;
      if (!a2)
        v3 = 0;
      result[93] = v2 & 0xFFFFFFFF7FFFFFFFLL | v3;
      return -[UILabel _invalidateLabelDisplay](result);
    }
  }
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  -[UILabel _invalidateAsNeededForNewSize:oldSize:](self, width, height, v8, v9);
  v10.receiver = self;
  v10.super_class = (Class)UILabel;
  -[UIView setFrame:](&v10, sel_setFrame_, x, y, width, height);
}

- (void)_invalidateAsNeededForNewSize:(double)a3 oldSize:(double)a4
{
  uint64_t v11;
  void (**v12)(_QWORD);
  char v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(_QWORD);
  char v20;
  char v21;
  _QWORD v22[5];
  _QWORD aBlock[5];

  if (a1)
  {
    if (a4 != a2 || a5 != a3)
    {
      v11 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __49__UILabel__invalidateAsNeededForNewSize_oldSize___block_invoke;
      aBlock[3] = &unk_1E16B1B28;
      aBlock[4] = a1;
      v12 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
      {
        v22[0] = v11;
        v22[1] = 3221225472;
        v22[2] = __49__UILabel__invalidateAsNeededForNewSize_oldSize___block_invoke_2;
        v22[3] = &unk_1E16E7120;
        v22[4] = a1;
        if ((_UITextLayoutSizeWillShrink(v22, a4, a5, a2, a3) & 1) != 0)
        {
          v13 = 1;
        }
        else
        {
          v12[2](v12);
          v13 = 0;
        }
        objc_msgSend(a1, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_labelLayerToClipDuringBoundsSizeAnimation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v14) = objc_msgSend(v15, "masksToBounds");
        objc_msgSend(v15, "_setLabelMasksToBoundsForAnimation:", 1);
        v17[0] = v11;
        v17[1] = 3221225472;
        v17[2] = __49__UILabel__invalidateAsNeededForNewSize_oldSize___block_invoke_3;
        v17[3] = &unk_1E16EA3E0;
        v18 = v15;
        v20 = (char)v14;
        v21 = v13;
        v19 = v12;
        v16 = v15;
        +[UIViewAnimationState _addSystemPostAnimationAction:](UIViewAnimationState, "_addSystemPostAnimationAction:", v17);

      }
      else
      {
        v12[2](v12);
      }

    }
  }
}

void __49__UILabel__invalidateAsNeededForNewSize_oldSize___block_invoke(uint64_t a1)
{
  objc_super v2;

  -[UILabel _updateVariableLengthStringIfNeeded](*(void **)(a1 + 32));
  -[UILabel _invalidateLabelMetrics](*(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 32))
  {
    v2.receiver = *(id *)(a1 + 32);
    v2.super_class = (Class)UILabel;
    objc_msgSendSuper2(&v2, sel_setNeedsDisplay);
  }
}

- (NSTextAlignment)textAlignment
{
  void *v2;
  void *v3;
  NSTextAlignment v4;

  -[UILabel _content](self, "_content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paragraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "alignment");

  return v4;
}

void __22__UILabel__commonInit__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "_defaultColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_nilBackgroundColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v6);

}

- (void)setTextColor:(UIColor *)textColor
{
  *(_QWORD *)&self->_textLabelFlags |= 0x80000uLL;
  -[UILabel _setTextColor:](self, "_setTextColor:", textColor);
}

- (void)_setTextColor:(id)a3
{
  UIColor *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  UIColor *lastSetColor;
  UIColor *v9;
  id v10;

  v4 = (UIColor *)a3;
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&self->_textLabelFlags &= ~0x80000uLL;
  }
  -[UILabel _content](self, "_content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)off_1E1678D98;
  v10 = v5;
  if ((objc_msgSend(v5, "isAttribute:uniformlyEqualToValue:", *(_QWORD *)off_1E1678D98, v4) & 1) == 0)
  {
    objc_msgSend(v10, "contentByApplyingAttributeToEntireRange:value:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setContent:](self, "_setContent:", v7);

  }
  lastSetColor = self->_lastSetColor;
  self->_lastSetColor = v4;
  v9 = v4;

  -[UILabel _resolveMaterialColor:]((uint64_t)self, v9);
}

- (UIFont)font
{
  void *v2;
  void *v3;

  -[UILabel _content](self, "_content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[UILabel _content](self, "_content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (_UILabelContent)_content
{
  _UILabelContent *content;
  _UILabelContent *v4;
  void *v5;
  _UILabelContent *v6;
  _UILabelContent *v7;

  content = self->_content;
  if (!content)
  {
    v4 = [_UILabelContent alloc];
    objc_msgSend((id)objc_opt_class(), "_defaultAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_UILabelContent initWithDefaultAttributes:](v4, "initWithDefaultAttributes:", v5);
    v7 = self->_content;
    self->_content = v6;

    content = self->_content;
  }
  return content;
}

- (void)_setFont:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (v8 || (objc_msgSend((id)objc_opt_class(), "defaultFont"), (v8 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UILabel _content](self, "_content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentByApplyingAttributeToEntireRange:value:", *(_QWORD *)off_1E1678D90, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setContent:](self, "_setContent:", v5);
  }
  else
  {
    v6 = objc_opt_class();
    -[UILabel font](self, "font");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pointSize");
    NSLog(CFSTR("nil passed to [UILabel setFont:] and [%@ defaultFont] is also nil. Don't know what to do, so leaving font as %@ %f"), v6, v4, v7);
  }

}

- (void)_setContent:(id)a3
{
  int v4;
  id v5;

  v5 = a3;
  v4 = dyld_program_sdk_at_least();
  -[UILabel _setContent:adjustingFontForAccessibilityTraits:adjustingFontForTypesettingLanguage:adjustingFontForTypesettingLanguageAwareLineHeightRatio:checkingForDifferences:]((uint64_t)self, v5, 1, v4, v4, 1);

}

- (void)_setContent:(int)a3 adjustingFontForAccessibilityTraits:(int)a4 adjustingFontForTypesettingLanguage:(int)a5 adjustingFontForTypesettingLanguageAwareLineHeightRatio:(char)a6 checkingForDifferences:
{
  id v12;
  id *v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  int v22;
  id v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  BOOL v28;
  unsigned __int8 v29;
  __int16 v30;

  v12 = a2;
  if (!a1)
    goto LABEL_41;
  v13 = (id *)(a1 + 560);
  if ((a6 & 1) == 0)
  {
    objc_storeStrong(v13, a2);
    goto LABEL_41;
  }
  v14 = *v13;
  v15 = v12;
  v12 = v15;
  if (v14 == v15)
  {

    goto LABEL_41;
  }
  if (v15 && v14)
  {
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_41;
  }
  else
  {

  }
  v17 = objc_msgSend(*(id *)(a1 + 560), "differenceVersusContent:", v12);
  v18 = v17;
  if ((*(_BYTE *)(a1 + 747) & 0x20) == 0 || (v17 & 0x200) != 0)
  {
    v28 = 0;
    if ((a3 & 1) != 0)
    {
LABEL_19:
      v21 = (v18 & 0x10000) == 0;
      goto LABEL_20;
    }
  }
  else
  {
    v19 = v12;
    objc_msgSend((id)a1, "_defaultAttributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentWithDefaultAttributes:", v20);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v28 = v12 != v19;
    if ((a3 & 1) != 0)
      goto LABEL_19;
  }
  if ((a4 & 1) != 0 || a5)
    goto LABEL_19;
  v21 = 1;
LABEL_20:
  v22 = 0;
  v30 = 0;
  v29 = 0;
  if (a4)
    v22 = objc_msgSend((id)a1, "_wantsContentAwareTypesettingLanguage");
  v23 = v12;
  v12 = v23;
  if (((a3 ^ 1 | v21) & 1) == 0)
  {
    -[UILabel _contentAdjustingFontForAccessibilityTraits:forced:didAdjustFont:]((_BYTE *)a1, v23, 0, (_BYTE *)&v30 + 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (((a5 ^ 1 | v21 | v22) & 1) != 0)
  {
    v24 = 0;
  }
  else
  {
    -[UILabel _contentAdjustingFontForTypesettingLanguageAwareLineHeightRatio:didAdjustFont:]((void *)a1, v12, &v30);
    v25 = objc_claimAutoreleasedReturnValue();

    v24 = (_BYTE)v30 != 0;
    v12 = (id)v25;
  }
  if (((a4 ^ 1 | (v24 || v21)) ^ 1 | v22) == 1)
  {
    -[UILabel _contentAdjustingFontForTypesettingLanguage:didAdjustFont:]((void *)a1, v12, &v29);
    v26 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v26;
  }
  if (v28 || HIBYTE(v30) | v30 | v29 && v23 != v12)
    v18 = objc_msgSend(*(id *)(a1 + 560), "differenceVersusContent:", v12);
  if (v18)
  {
    v27 = *(id *)(a1 + 560);
    objc_storeStrong((id *)(a1 + 560), v12);
    if ((v18 & 0xFFFFFFFFFFFFFFF7) != 0)
    {
      objc_msgSend((id)a1, "_contentDidChange:fromContent:", v18, v27);
      -[UILabel _invalidateLabelDisplay]((_QWORD *)a1);
      if ((v18 & 0x4000) != 0)
      {
        objc_msgSend((id)a1, "_invalidateLabelSize");
        if ((*(_QWORD *)(a1 + 104) & 0x400000000000000) != 0 && !*(_QWORD *)(a1 + 768))
          objc_msgSend((id)a1, "_invalidateBaselineConstraints");
      }
    }

  }
LABEL_41:

}

- (_QWORD)_invalidateLabelDisplay
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (result)
  {
    v1 = (uint64_t)result;
    result[93] &= ~0x1000000uLL;
    v2 = (void *)result[71];
    result[71] = 0;

    v3 = *(void **)(v1 + 576);
    *(_QWORD *)(v1 + 576) = 0;

    v4 = *(void **)(v1 + 616);
    *(_QWORD *)(v1 + 616) = 0;

    *(_OWORD *)(v1 + 624) = *MEMORY[0x1E0C9D820];
    *(_QWORD *)(v1 + 744) &= ~0x10000uLL;
    if ((*(_QWORD *)(v1 + 104) & 0x1000) == 0)
      -[UILabel _resolveMaterialColor:](v1, *(void **)(v1 + 704));
    v5 = *(void **)(v1 + 608);
    *(_QWORD *)(v1 + 608) = 0;

    v6.receiver = (id)v1;
    v6.super_class = (Class)UILabel;
    return objc_msgSendSuper2(&v6, sel_setNeedsDisplay);
  }
  return result;
}

- (void)_contentDidChange:(int64_t)a3 fromContent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[UILabel _content](self, "_content");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labelViewTextAttachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelViewTextAttachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel _addViewsForLabelViewTextAttachments:previousLabelViewTextAttachments:](self, "_addViewsForLabelViewTextAttachments:previousLabelViewTextAttachments:", v6, v7);
}

- (void)_resolveMaterialColor:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v3 = a2;
  if (a1)
  {
    v11 = v3;
    if (!v3)
    {
      objc_msgSend((id)a1, "mt_setContentEffects:", 0);
      goto LABEL_13;
    }
    v4 = v3;
    if ((objc_msgSend((id)a1, "isEnabled") & 1) == 0)
    {
      objc_msgSend((id)a1, "_disabledFontColor");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v5;
    }
    if (objc_msgSend(v4, "_isDynamic") && (*(_BYTE *)(a1 + 128) & 0x20) != 0)
    {
      objc_msgSend((id)a1, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_resolvedMaterialWithTraitCollection:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "isVibrant"))
      {
        objc_msgSend(*(id *)(a1 + 560), "string");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "_containsEmoji");

        if (!v9)
          goto LABEL_11;
      }

    }
    v7 = 0;
LABEL_11:
    objc_msgSend(v7, "contentEffects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "mt_setContentEffects:", v10);

LABEL_13:
    v3 = v11;
  }

}

- (BOOL)isEnabled
{
  return (*(_BYTE *)&self->_textLabelFlags >> 6) & 1;
}

- (id)_disabledFontColor
{
  return +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
}

- (void)setNeedsDisplay
{
  objc_super v3;

  if (dyld_program_sdk_at_least())
  {
    -[UILabel _invalidateLabelDisplay](self);
  }
  else
  {
    *(_QWORD *)&self->_textLabelFlags &= ~0x1000000uLL;
    v3.receiver = self;
    v3.super_class = (Class)UILabel;
    -[UIView setNeedsDisplay](&v3, sel_setNeedsDisplay);
  }
}

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled
{
  _BOOL8 v3;
  objc_super v5;
  objc_super v6;

  v3 = userInteractionEnabled;
  if (-[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled") != userInteractionEnabled)
  {
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    -[UIView setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_, v3);
    if (self)
    {
      v6.receiver = self;
      v6.super_class = (Class)UILabel;
      -[UIView setNeedsDisplay](&v6, sel_setNeedsDisplay);
    }
  }
}

+ (id)_defaultAttributes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (id)objc_opt_class();
  +[_UITextAttributeDefaults _unspecifiedDefaults](_UITextAttributeDefaults, "_unspecifiedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3 != a1)
  {
    v8 = objc_msgSend(v6, "copy");

    v7 = (void *)v8;
  }

  return v7;
}

+ (id)defaultFont
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 5)
    +[_UITextAttributeDefaults _defaultsForUserInterfaceIdiom:](_UITextAttributeDefaults, "_defaultsForUserInterfaceIdiom:", 5);
  else
    +[_UITextAttributeDefaults _unspecifiedDefaults](_UITextAttributeDefaults, "_unspecifiedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_defaultColor
{
  void *v2;
  void *v3;
  void *v4;

  +[_UITextAttributeDefaults _unspecifiedDefaults](_UITextAttributeDefaults, "_unspecifiedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_shouldInvalidateBaselineConstraintsForSize:(CGSize)a3 oldSize:(CGSize)a4
{
  return 0;
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  return (*(_QWORD *)&self->super._viewFlags & 0x20000000000000) != 0
      && self->_numberOfLines != 1
      && (*((_BYTE *)&self->_textLabelFlags + 1) & 0x20) == 0;
}

- (void)_invalidateLabelSize
{
  void *v3;
  void *v4;

  self->_size = (CGSize)*MEMORY[0x1E0C9D820];
  -[UILabel _invalidateLabelMetrics]((uint64_t)self);
  if (dyld_program_sdk_at_least())
  {
    if ((*((_BYTE *)&self->_textLabelFlags + 3) & 0x10) != 0)
    {
      -[UIView layer](self, "layer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "invalidateContentInsets");

    }
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
  if (!-[UILabel _useShortcutIntrinsicContentSize](self, "_useShortcutIntrinsicContentSize")
    || -[UILabel numberOfLines](self, "numberOfLines") != 1)
  {
    -[UILabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  if (-[UIView _wantsAutolayout](self, "_wantsAutolayout"))
  {
    if (-[UIView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints"))
    {
      -[UILabel __tightBoundingBoxLayoutGuide](self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        if ((*((_QWORD *)&self->super._viewFlags + 1) & 4) == 0)
          -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      }
    }
  }
}

- (void)_invalidateLabelMetrics
{
  void *v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  if (a1)
  {
    *(_QWORD *)(a1 + 744) &= ~0x800uLL;
    v2 = *(void **)(a1 + 608);
    *(_QWORD *)(a1 + 608) = 0;

    v3 = *(double *)(a1 + 456);
    if (*(double *)(a1 + 464) != 0.0)
    {
      objc_msgSend((id)a1, "bounds");
      *(double *)(a1 + 544) = v4 - *(double *)(a1 + 464);
    }
    v5 = *(double *)(a1 + 456);
    *(_QWORD *)(a1 + 464) = 0;
    if (v5 != 0.0)
      *(double *)(a1 + 552) = v5;
    *(_QWORD *)(a1 + 456) = 0;
    *(_QWORD *)(a1 + 504) = -1;
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(a1 + 472) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(a1 + 488) = v7;
    *(_OWORD *)(a1 + 512) = v6;
    *(_OWORD *)(a1 + 528) = v7;
    if (v3 != 0.0)
    {
      if (objc_msgSend((id)a1, "_shouldNotifyGeometryObserversForBaselineChanges"))
      {
        v26 = 0;
        v25 = 0u;
        v24 = 0u;
        v23 = 0u;
        v22 = 0u;
        v21 = 0u;
        v20 = 0u;
        v19 = 0u;
        v18 = 0u;
        v17 = 0u;
        v16 = 0u;
        v15 = 0u;
        v14 = 0u;
        v13 = 0u;
        v12 = 0u;
        v11 = 2048;
        -[UIView _notifyGeometryObserversWithChangeInfo:](a1, &v11);
      }
      if ((*(_DWORD *)(a1 + 120) & 2) != 0)
      {
        objc_msgSend((id)a1, "superview");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8)
        {
          if ((*(_QWORD *)(v8 + 104) & 0x8000000000000000) == 0)
          {
            objc_msgSend((id)a1, "superview");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setNeedsLayout");

          }
        }

      }
    }
  }
}

- (BOOL)_useShortcutIntrinsicContentSize
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 2) >> 6) & 1;
}

- (void)invalidateIntrinsicContentSize
{
  -[_UITextSizeCache removeAllSizes](self->_intrinsicContentSizeCache, "removeAllSizes");
  -[UIView _invalidateIntrinsicContentSizeNeedingLayout:](self, "_invalidateIntrinsicContentSizeNeedingLayout:", (*(_QWORD *)&self->super._viewFlags & 0x4000000000000) == 0);
}

- (void)_updateSystemConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UILabel;
  -[UIView _updateSystemConstraints](&v3, sel__updateSystemConstraints);
  -[UILabel _updateTightBoundingBoxLayoutGuideConstraintsIfNecessary](self);
}

- (void)_updateTightBoundingBoxLayoutGuideConstraintsIfNecessary
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double MaxY;
  double v24;
  double MinX;
  double v26;
  double MinY;
  id v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  if (a1)
  {
    -[UILabel __tightBoundingBoxLayoutGuide](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v28 = v2;
      objc_msgSend(a1, "bounds");
      v4 = v3;
      v6 = v5;
      objc_msgSend(a1, "intrinsicContentSize");
      v8 = v7;
      v10 = v9;
      v29.origin.x = -[UILabel _drawTextInRect:baselineCalculationOnly:returningDeviceMetricsOfFirstLine:returningMultilineDeviceMetrics:forceMultiline:]((uint64_t)a1, 1, 1, 0, 0, v4, v6, v7, v9);
      x = v29.origin.x;
      y = v29.origin.y;
      width = v29.size.width;
      height = v29.size.height;
      MinY = CGRectGetMinY(v29);
      v30.origin.x = v4;
      v30.origin.y = v6;
      v30.size.width = v8;
      v30.size.height = v10;
      v26 = CGRectGetMinY(v30);
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      MinX = CGRectGetMinX(v31);
      v32.origin.x = v4;
      v32.origin.y = v6;
      v32.size.width = v8;
      v32.size.height = v10;
      v24 = CGRectGetMinX(v32);
      v33.origin.x = v4;
      v33.origin.y = v6;
      v33.size.width = v8;
      v33.size.height = v10;
      MaxY = CGRectGetMaxY(v33);
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      v22 = CGRectGetMaxY(v34);
      v35.origin.x = v4;
      v35.origin.y = v6;
      v35.size.width = v8;
      v35.size.height = v10;
      MaxX = CGRectGetMaxX(v35);
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      v16 = MaxX - CGRectGetMaxX(v36);
      objc_msgSend(v28, "_systemConstraints");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setConstant:", MinY - v26);

      objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setConstant:", MinX - v24);

      objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setConstant:", MaxY - v22);

      objc_msgSend(v17, "objectAtIndexedSubscript:", 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setConstant:", v16);

      v2 = v28;
    }

  }
}

- (id)__tightBoundingBoxLayoutGuide
{
  if (a1)
  {
    objc_getAssociatedObject(a1, &kTightBoudingBoxLayoutGuideKey);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  -[UILabel _invalidateAsNeededForNewSize:oldSize:](self, width, height, v8, v9);
  v10.receiver = self;
  v10.super_class = (Class)UILabel;
  -[UIView setBounds:](&v10, sel_setBounds_, x, y, width, height);
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  objc_super v2;

  self->_preferredMaxLayoutWidth = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)UILabel;
  -[UIView _prepareForFirstIntrinsicContentSizeCalculation](&v2, sel__prepareForFirstIntrinsicContentSizeCalculation);
}

- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  self->_preferredMaxLayoutWidth = v8;
  v9.receiver = self;
  v9.super_class = (Class)UILabel;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v9, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (void)_setMultilineContextWidth:(double)a3
{
  self->_multilineContextWidth = a3;
}

- (void)_invalidateBaselineConstraints
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  if ((*(_QWORD *)&self->super._viewFlags & 0x400000000000000) != 0)
  {
    -[UIView _layoutEngine](self, "_layoutEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[UILabel _baselineOffsetFromBottom](self, "_baselineOffsetFromBottom");
      v5 = v4;
      if (self->_previousFirstLineBaseline != self->_intrinsicSizeBaselineInfo.firstBaseline
        || self->_previousBaselineOffsetFromBottom != v4)
      {
        v6.receiver = self;
        v6.super_class = (Class)UILabel;
        -[UIView _invalidateBaselineConstraints](&v6, sel__invalidateBaselineConstraints);
        self->_previousFirstLineBaseline = self->_intrinsicSizeBaselineInfo.firstBaseline;
        self->_previousBaselineOffsetFromBottom = v5;
      }
    }

  }
}

- (double)_baselineOffsetFromBottom
{
  UIFont *fontForShortcutBaselineCalculation;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v10;

  fontForShortcutBaselineCalculation = self->_fontForShortcutBaselineCalculation;
  if (fontForShortcutBaselineCalculation)
  {
    -[UIFont lineHeight](fontForShortcutBaselineCalculation, "lineHeight");
    UICeilToViewScale(self);
    v5 = v4;
    -[UILabel _firstBaselineOffsetFromTop](self, "_firstBaselineOffsetFromTop");
    v7 = v5 - v6;
  }
  else
  {
    -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:", -[UILabel _ensureBaselineMetricsReturningBounds]((uint64_t)self));
    v7 = CGRectGetMaxY(v10) - self->_intrinsicSizeBaselineInfo.lastBaseline;
  }
  -[UILabel _letterformAwareAllAlignmentInsets](self);
  return v7 + v8 + 0.0;
}

- (double)_firstBaselineOffsetFromTop
{
  UIFont *fontForShortcutBaselineCalculation;
  double v4;
  double firstBaseline;

  fontForShortcutBaselineCalculation = self->_fontForShortcutBaselineCalculation;
  if (fontForShortcutBaselineCalculation)
  {
    -[UIFont lineHeight](fontForShortcutBaselineCalculation, "lineHeight");
    -[UIFont descender](self->_fontForShortcutBaselineCalculation, "descender");
    UIRoundToViewScale(self);
    firstBaseline = v4;
  }
  else
  {
    -[UILabel _ensureBaselineMetricsReturningBounds]((uint64_t)self);
    firstBaseline = self->_intrinsicSizeBaselineInfo.firstBaseline;
  }
  return firstBaseline + -[UILabel _letterformAwareAllAlignmentInsets](self) + 0.0;
}

- (BOOL)_hasBaseline
{
  return 1;
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
  _UILabelContent *v4;
  void *v5;
  void *v6;
  _UILabelContent *content;
  NSAttributedString *v8;
  NSAttributedString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  UIColor *lastSetColor;
  NSAttributedString *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v15 = attributedText;
  v4 = self->_content;
  -[UILabel _content](self, "_content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentWithAttributedString:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel _setContent:](self, "_setContent:", v6);

  content = self->_content;
  v8 = v15;
  if (v4 != content)
  {
    -[UILabel _noteInstanceCustomizationForAttributedString:attributes:](self, v15, 0);
    v9 = v15;
    if (-[NSAttributedString length](v9, "length"))
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 0;
      v10 = -[NSAttributedString length](v9, "length");
      v11 = *(_QWORD *)off_1E1678C50;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __47__UILabel__resolveMaterialUsingAttributedText___block_invoke;
      v16[3] = &unk_1E16B6338;
      v16[4] = &v17;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v9, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v10, 0x100000, v16);
      v12 = *(_QWORD *)off_1E1678D98;
      if (-[_UILabelContent isAttribute:uniformlyEqualToValue:](self->_content, "isAttribute:uniformlyEqualToValue:", *(_QWORD *)off_1E1678D98, 0))
      {
        -[UILabel textColor](self, "textColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_lastSetColor, v13);
        -[UILabel _resolveMaterialColor:]((uint64_t)self, v13);
      }
      else
      {
        -[NSAttributedString attribute:atIndex:effectiveRange:](v9, "attribute:atIndex:effectiveRange:", v12, 0, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && -[_UILabelContent isAttribute:uniformlyEqualToValue:](self->_content, "isAttribute:uniformlyEqualToValue:", v12, v13)&& !*((_BYTE *)v18 + 24))
        {
          objc_storeStrong((id *)&self->_lastSetColor, v13);
          -[UILabel _resolveMaterialColor:]((uint64_t)self, v13);
        }
        else
        {
          lastSetColor = self->_lastSetColor;
          self->_lastSetColor = 0;

          -[UIView mt_setContentEffects:](self, "mt_setContentEffects:", 0);
        }
      }

      _Block_object_dispose(&v17, 8);
    }

    v8 = v15;
  }

}

- (void)_setLineBreakMode:(int64_t)a3
{
  void *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UILabel _content](self, "_content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paragraphStyle");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "lineBreakMode") != a3)
  {
    v6 = self;
    v7 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v7, "setLineBreakMode:", a3);
    -[UILabel _content](v6, "_content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentByApplyingAttributeToEntireRange:value:", *(_QWORD *)off_1E1678F98, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setContent:](v6, "_setContent:", v9);

    -[UILabel _invalidateLabelSize](v6, "_invalidateLabelSize");
  }

}

- (void)_noteInstanceCustomizationForAttributedString:(void *)a3 attributes:
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1, "_visualStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldDisableUpdateTextColorOnTraitCollectionChangeForAttributedString:attributes:", v8, v5);

    if (v7)
      a1[93] |= 0x80000uLL;
  }

}

- (void)drawRect:(CGRect)a3
{
  double v4;

  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UILabel drawTextInRect:](self, "drawTextInRect:", -[UILabel _sizingRuleAdjustedBoundsForBounds:](self, v4));
}

- (double)_sizingRuleAdjustedBoundsForBounds:(_QWORD *)a1
{
  uint64_t v3;
  double v4;

  if (!a1)
    return 0.0;
  v3 = a1[93];
  if ((v3 & 0x6000000000) != 0)
  {
    -[UILabel _letterformAwareAllAlignmentInsets](a1);
    if ((v3 & 0x4000000000) == 0)
      v4 = 0.0;
    return a2 + v4;
  }
  return a2;
}

- (void)drawTextInRect:(CGRect)rect
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *ContextStack;
  CGContext *v9;
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  id v27;
  CGColor *v28;
  char v29;
  $E628185296FB360B9F692E5749A23446 v30;
  $E628185296FB360B9F692E5749A23446 v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  $E628185296FB360B9F692E5749A23446 v48;
  void *v49;
  double v50;
  double v51;
  id v52;
  uint64_t v53;
  double v54;
  double v55;
  _QWORD block[5];
  CGSize v57;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v9 = 0;
  else
    v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  textLabelFlags = self->_textLabelFlags;
  if ((*(_WORD *)&textLabelFlags & 0x200) != 0)
  {
    -[UIView bounds](self, "bounds");
    v14 = v13;
    -[UILabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
    v12 = v15;
    v16 = v15 + v14;
    -[UILabel marqueeLoopPadding](self, "marqueeLoopPadding");
    v55 = v17 + v16;
    if (v12 <= v14)
    {
      v11 = 0;
    }
    else
    {
      -[UILabel text](self, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v18, "_isNaturallyRTL");

    }
  }
  else
  {
    v11 = 0;
    v55 = 0.0;
    v12 = 0.0;
  }
  -[UILabel _shadow](self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "shadowColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (!v19)
    {
      v29 = 1;
      if ((*(_WORD *)&textLabelFlags & 0x200) == 0)
        goto LABEL_14;
      goto LABEL_16;
    }
    CGContextSaveGState(v9);
    objc_msgSend(v19, "shadowOffset");
    v22 = v21;
    v24 = v23;
    objc_msgSend(v19, "shadowBlurRadius");
    v26 = v25;
    objc_msgSend(v19, "shadowColor");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = (CGColor *)objc_msgSend(v27, "CGColor");
    v57.width = v22;
    v57.height = v24;
    CGContextSetShadowWithColor(v9, v57, v26, v28);

    v29 = 0;
  }
  else
  {
    v29 = 1;
  }

  if ((*(_WORD *)&textLabelFlags & 0x200) == 0)
  {
LABEL_14:
    -[UILabel _drawTextInRect:](self, "_drawTextInRect:", x, y, width, height);
    goto LABEL_41;
  }
LABEL_16:
  v30 = self->_textLabelFlags;
  v31 = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&v30 & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)(v12 > width) << 11));
  self->_textLabelFlags = v31;
  if ((*(_WORD *)&v30 & 0x1000) == 0 || v12 <= width)
  {
    -[UIView viewWithTag:](self, "viewWithTag:", 4032914800);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
      objc_msgSend(v32, "removeFromSuperview");

    v31 = self->_textLabelFlags;
  }
  if (width >= v12)
    v34 = width;
  else
    v34 = v12;
  if ((*(_WORD *)&v31 & 0x800) != 0)
    v35 = v34;
  else
    v35 = width;
  v36 = 0.0;
  v37 = 0.0;
  if ((*(_WORD *)&v31 & 0x1800) == 0x800)
  {
    -[UILabel _contentInsetsFromFonts](self, "_contentInsetsFromFonts", v34);
    v36 = height - (v40 + v41);
    v37 = y + v40;
    v42 = 0.0;
    if (v11)
      v38 = v39;
    else
      v42 = v38 + 0.0;
    v43 = width - v38;
    v44 = v37;
    v45 = v36;
    CGContextClipToRect(v9, *(CGRect *)&v42);
  }
  v46 = x;
  if (v11)
  {
    -[UILabel marqueeLoopPadding](self, "marqueeLoopPadding");
    v46 = v55 - v12 - v47 - v12;
  }
  v48 = self->_textLabelFlags;
  if ((~*(_DWORD *)&self->_textLabelFlags & 0x1800) != 0)
  {
    -[UILabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:", v46, y, v35, height);
    v48 = self->_textLabelFlags;
  }
  if ((*(_WORD *)&v48 & 0x1800) == 0x800)
  {
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UILabelMarqueeRightFade.png"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "size");
    v51 = v50;
    if (v11)
    {
      v52 = objc_retainAutorelease(v49);
      v53 = objc_msgSend(v52, "CGImage");
      objc_msgSend(v52, "scale");
      +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v53, 4);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = 0.0;
    }
    else
    {
      v54 = x + width - v50;
    }
    objc_msgSend(v49, "drawInRect:blendMode:alpha:", 22, v54, v37, v51, v36, 1.0);

  }
LABEL_41:
  if ((*((_BYTE *)&self->_textLabelFlags + 1) & 8) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__UILabel_drawTextInRect___block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  if ((v29 & 1) == 0)
    CGContextRestoreGState(v9);
}

- (CGRect)_drawTextInRect:(CGRect)a3 forceMultiline:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = -[UILabel _drawTextInRect:baselineCalculationOnly:returningDeviceMetricsOfFirstLine:returningMultilineDeviceMetrics:forceMultiline:]((uint64_t)self, 0, 0, 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_drawTextInRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UILabel _drawTextInRect:forceMultiline:](self, "_drawTextInRect:forceMultiline:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)_nilBackgroundColor
{
  void *v2;

  if (-[UIView isOpaque](self, "isOpaque"))
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (double)_firstLineBaselineFrameOriginY
{
  double v3;
  double v4;
  double v5;

  -[UIView frame](self, "frame");
  v4 = v3;
  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self, "_firstLineBaselineOffsetFromBoundsTop");
  return v5 + v4;
}

- (CGRect)_textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4 includingShadow:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  CGFloat y;
  double x;
  void *v12;
  uint64_t v13;
  $947844291C9B6B6407FCB39A34E7C403 *p_intrinsicSizeBaselineInfo;
  uint64_t *p_measuredNumberOfLines;
  UILabel *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  int v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  _BOOL4 v62;
  void *v63;
  uint64_t v64;
  void *v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double lastBaseline;
  double v72;
  double v73;
  double v74;
  double v75;
  _BOOL8 v76;
  void *v77;
  void *v78;
  uint64_t v79;
  unint64_t v80;
  void *v81;
  void *v82;
  double v83;
  uint64_t v84;
  uint64_t v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect result;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UILabel text](self, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (!v13)
  {
    v28 = 0.0;
    v29 = x;
    v30 = y;
    v31 = 0.0;
    goto LABEL_77;
  }
  v84 = 0;
  v85 = 0;
  p_intrinsicSizeBaselineInfo = &self->_intrinsicSizeBaselineInfo;
  p_measuredNumberOfLines = &self->_intrinsicSizeBaselineInfo.measuredNumberOfLines;
  v16 = self;
  v17 = (uint64_t)v16;
  if ((*(_BYTE *)&v16->_textLabelFlags & 4) != 0)
  {
    v19 = _UIComputedSizeForLabel(v16, 0, 0, a4, p_measuredNumberOfLines, &v85, &v84, width, height);
    v27 = v32;
  }
  else
  {
    -[UILabel _stringDrawingContext](v16, "_stringDrawingContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMaximumNumberOfLines:", a4);
    objc_msgSend(v18, "setWrapsForTruncationMode:", a4 != 1);
    objc_msgSend(v18, "setWantsNumberOfLineFragments:", 1);
    objc_msgSend(v18, "setWantsBaselineOffset:", 1);
    if (width < 0.0 || height < 0.0)
    {
      v19 = *MEMORY[0x1E0C9D820];
      v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    else
    {
      if (width == 0.0)
        v19 = 3.40282347e38;
      else
        v19 = width;
      if (height == 0.0)
        v20 = 3.40282347e38;
      else
        v20 = height;
      if (-[UILabel _updateScaledMetricsForRect:](v17, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v19, v20))objc_msgSend(v18, "setLayout:", 0);
      objc_msgSend((id)v17, "_content");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isAttributed"))
      {
        objc_msgSend((id)v17, "_synthesizedAttributedText");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = -[UILabel _boundingRectWithAttributedString:size:options:context:]((_BYTE *)v17, v22, objc_msgSend((id)v17, "_stringDrawingOptions"), v18, v19, 3.40282347e38);
          v25 = v24;
          v27 = v26;
        }
        else
        {
          v25 = *MEMORY[0x1E0C9D820];
          v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        }
        objc_msgSend(v21, "paragraphStyle", v23);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (dyld_program_sdk_at_least())
        {
          objc_msgSend(v38, "firstLineHeadIndent");
          if (v39 > 0.0)
          {
            if (objc_msgSend(v18, "numberOfLineFragments") == 1)
              goto LABEL_34;
            objc_msgSend(v22, "string");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "componentsSeparatedByCharactersInSet:", v78);
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            v79 = objc_msgSend(v82, "count");
            if (objc_msgSend(v82, "count"))
            {
              objc_msgSend(v82, "lastObject");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = objc_msgSend(v77, "length") == 0;

              v40 = v79 - v76;
            }
            else
            {
              v40 = v79;
            }
            v41 = 0x7FFFFFFFLL;
            if (a4)
              v41 = a4;
            if (v41 >= v40)
              v41 = v40;
            v80 = v41;
            v42 = objc_msgSend(v18, "numberOfLineFragments");

            if (v80 == v42)
            {
LABEL_34:
              objc_msgSend(v38, "firstLineHeadIndent");
              v44 = v25 + v43;
              if (v44 >= v19)
                v25 = v19;
              else
                v25 = v44;
            }
          }
        }

      }
      else if (objc_msgSend(v21, "isNil"))
      {
        v25 = *MEMORY[0x1E0C9D820];
        v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      else
      {
        objc_msgSend(v21, "string");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend((id)v17, "_stringDrawingOptions");
        -[UILabel _synthesizedTextAttributes]((_QWORD *)v17);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel _boundingRectWithString:size:options:attributes:context:]((_BYTE *)v17, v33, v34, v35, v18, v19, 3.40282347e38);
        v25 = v36;
        v27 = v37;

      }
      v45 = v25 - v19;
      if (v25 - v19 < 0.0001)
        v19 = v25;
      *p_measuredNumberOfLines = objc_msgSend(v18, "numberOfLineFragments", v45);
      objc_msgSend(v18, "baselineOffset");
      v85 = v46;
      objc_msgSend(v18, "firstBaselineOffset");
      v84 = v47;
      objc_msgSend(v18, "layout");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = *(void **)(v17 + 608);
      *(_QWORD *)(v17 + 608) = v48;

    }
  }

  if (v5
    && (objc_msgSend((id)v17, "shadowColor"), v50 = (void *)objc_claimAutoreleasedReturnValue(), v50, v50)
    && v19 > 0.0
    && v27 > 0.0)
  {
    objc_msgSend((id)v17, "shadowOffset");
    if (v51 < 0.0)
      v51 = -v51;
    v19 = v19 + v51;
    v53 = -v52;
    if (v52 >= 0.0)
      v53 = v52;
    v54 = v27 + v53;
  }
  else
  {
    v54 = v27;
  }
  v55 = objc_msgSend((id)v17, "_shouldCeilSizeToViewScale");
  if (width >= v19)
    v56 = v19;
  else
    v56 = width;
  if (height >= v54)
    v57 = v54;
  else
    v57 = height;
  if (v55)
  {
    UICeilToViewScale((void *)v17);
    v59 = v58;
    UICeilToViewScale((void *)v17);
    v31 = v60;
  }
  else
  {
    v59 = ceil(v56);
    v31 = ceil(v57);
  }
  objc_msgSend((id)v17, "_content");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = +[UIView _enableRTL](UIView, "_enableRTL");
  if (objc_msgSend(v61, "isAttributed"))
  {
    objc_msgSend((id)v17, "_synthesizedAttributedText");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "_ui_resolvedTextAlignment");
LABEL_68:

    goto LABEL_69;
  }
  if (v62)
    v64 = 4;
  else
    v64 = 0;
  if ((*(_BYTE *)(v17 + 744) & 0x80) != 0)
  {
    -[UILabel _synthesizedTextAttributes]((_QWORD *)v17);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKey:", *(_QWORD *)off_1E1678F98);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v65, "_ui_resolvedTextAlignment");

    goto LABEL_68;
  }
LABEL_69:
  v83 = v59;
  if (v64 == 1)
  {
    v87.origin.x = x;
    v87.origin.y = y;
    v87.size.width = width;
    v87.size.height = height;
    CGRectGetMaxX(v87);
    UIRoundToViewScale((void *)v17);
    v66 = height;
    goto LABEL_73;
  }
  v66 = height;
  v29 = x;
  if (v64 == 2)
  {
    v86.origin.x = x;
    v86.origin.y = y;
    v86.size.width = width;
    v86.size.height = v66;
    v67 = CGRectGetMaxX(v86) - v83;
LABEL_73:
    v29 = x + v67;
  }
  UIRoundToViewScale((void *)v17);
  v30 = v68;
  UIRoundToViewScale((void *)v17);
  p_intrinsicSizeBaselineInfo->lastBaseline = v69;
  UIRoundToViewScale((void *)v17);
  p_intrinsicSizeBaselineInfo->firstBaseline = v70;
  lastBaseline = p_intrinsicSizeBaselineInfo->lastBaseline;
  v88.origin.x = x;
  v88.origin.y = y;
  v88.size.width = width;
  v88.size.height = v66;
  if (lastBaseline > CGRectGetMaxY(v88))
  {
    p_intrinsicSizeBaselineInfo->firstBaseline = 0.0;
    p_intrinsicSizeBaselineInfo->lastBaseline = 0.0;
    p_intrinsicSizeBaselineInfo->measuredNumberOfLines = -1;
  }
  p_intrinsicSizeBaselineInfo->referenceBounds.origin.x = x;
  p_intrinsicSizeBaselineInfo->referenceBounds.origin.y = y;
  p_intrinsicSizeBaselineInfo->referenceBounds.size.width = width;
  p_intrinsicSizeBaselineInfo->referenceBounds.size.height = v66;
  p_intrinsicSizeBaselineInfo->bounds.origin.x = v29;
  p_intrinsicSizeBaselineInfo->bounds.origin.y = v30;
  v28 = v83;
  p_intrinsicSizeBaselineInfo->bounds.size.width = v83;
  p_intrinsicSizeBaselineInfo->bounds.size.height = v31;

LABEL_77:
  v72 = v29;
  v73 = v30;
  v74 = v28;
  v75 = v31;
  result.size.height = v75;
  result.size.width = v74;
  result.origin.y = v73;
  result.origin.x = v72;
  return result;
}

- (UIColor)shadowColor
{
  void *v2;
  void *v3;

  -[UILabel _shadow](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (id)_shadow
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "_content");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "shadow");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)_shouldCeilSizeToViewScale
{
  return dyld_program_sdk_at_least();
}

- (void)setShowsExpansionTextWhenTruncated:(BOOL)showsExpansionTextWhenTruncated
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!showsExpansionTextWhenTruncated)
    v3 = 0;
  self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (CGSize)intrinsicContentSize
{
  _BOOL4 v3;
  uint64_t viewFlags;
  BOOL v5;
  _BOOL4 v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  if (!self)
  {
    v17 = 0.0;
    v7 = 0.0;
    goto LABEL_23;
  }
  v3 = -[UILabel _useShortcutIntrinsicContentSize](self, "_useShortcutIntrinsicContentSize");
  if (!v3)
  {
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      v6 = -[UILabel numberOfLines](self, "numberOfLines") == 1;
      goto LABEL_15;
    }
    v5 = -[UILabel _multilineLabelRequiresCarefulMeasurement](self, "_multilineLabelRequiresCarefulMeasurement");
    v6 = -[UILabel numberOfLines](self, "numberOfLines") == 1;
    if (v5)
      goto LABEL_15;
LABEL_9:
    viewFlags = (uint64_t)self->super._viewFlags;
    if ((viewFlags & 0x4000000000000) != 0)
      goto LABEL_10;
LABEL_15:
    -[UILabel _preferredMaxLayoutWidth](self, "_preferredMaxLayoutWidth");
    if (v11 <= 0.0)
      v11 = 3.40282347e38;
    -[UILabel _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", v11);
    v10 = v13;
    v14 = 65536.0;
    if (v6)
      v14 = v12;
    if (v3)
      v7 = v14;
    else
      v7 = v12;
    goto LABEL_22;
  }
  if (-[UILabel numberOfLines](self, "numberOfLines") != 1)
  {
    v6 = 0;
    goto LABEL_9;
  }
  viewFlags = (uint64_t)self->super._viewFlags;
LABEL_10:
  if ((viewFlags & 0x4000000000000) != 0)
    v7 = 65536.0;
  else
    v7 = -1.0;
  -[UILabel font](self, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lineHeight");
  UICeilToViewScale(self);
  v10 = v9;

LABEL_22:
  v15 = -[UILabel _letterformAwareAllAlignmentInsets](self);
  v17 = v10 + v15 + 0.0 + v16 + 0.0;
LABEL_23:
  v18 = v7;
  result.height = v17;
  result.width = v18;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[UILabel _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  textLabelFlags = self->_textLabelFlags;
  v9 = -[UILabel _letterformAwareAllAlignmentInsets](self);
  if ((*(_QWORD *)&textLabelFlags & 0x4000000000) == 0)
  {
    v10 = 0.0;
    v9 = v9 + 0.0;
    v11 = v11 + 0.0;
    v12 = 0.0;
  }
  v13 = v7 + v9 + v11;
  v14 = v5 + v10 + v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (double)_letterformAwareAllAlignmentInsets
{
  uint64_t v1;
  double v2;
  void *v3;
  void *v4;
  double v5;

  if (!a1)
    return 0.0;
  v1 = a1[93];
  v2 = 0.0;
  if ((v1 & 0x6000000000) != 0)
  {
    if ((v1 & 0x10000000) != 0)
    {
      objc_msgSend(a1, "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v4;
      if (v4 && (objc_msgSend(v4, "letterformAwareInsetsAreValid") & 1) == 0)
        objc_msgSend(v3, "updateContentInsets");
    }
    else
    {
      v3 = 0;
    }
    if (objc_msgSend(v3, "letterformAwareInsetsAreValid"))
    {
      objc_msgSend(v3, "letterformAwareInsets");
      v2 = 0.0 - v5;
    }

  }
  return v2;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  char v6;
  void *v7;
  _UITextSizeCache *intrinsicContentSizeCache;
  _UITextSizeCache *v9;
  _UITextSizeCache *v10;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  double v23;
  double v24;
  _OWORD v25[5];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIViewDebugSignposts, (uint64_t)CFSTR("UIViewDebugSignposts"));
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __36__UILabel__intrinsicSizeWithinSize___block_invoke;
  v19[3] = &unk_1E16E7148;
  v19[4] = self;
  if ((v6 & 1) != 0 || !byte_1ECD75E44)
  {
    v22 = 0;
    v20 = 0u;
    v21 = 0u;
  }
  else
  {
    memset(v25, 0, sizeof(v25));
    __36__UILabel__intrinsicSizeWithinSize___block_invoke((uint64_t)v19, (uint64_t)v25);
    if (LODWORD(v25[0]))
      kdebug_trace();
    v20 = *(_OWORD *)((char *)&v25[2] + 8);
    v21 = *(_OWORD *)((char *)&v25[3] + 8);
    v22 = *((_QWORD *)&v25[4] + 1);
  }
  -[UIView superview](self, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();

  intrinsicContentSizeCache = self->_intrinsicContentSizeCache;
  if (!intrinsicContentSizeCache)
  {
    v9 = (_UITextSizeCache *)objc_opt_new();
    v10 = self->_intrinsicContentSizeCache;
    self->_intrinsicContentSizeCache = v9;

    intrinsicContentSizeCache = self->_intrinsicContentSizeCache;
  }
  v23 = 0.0;
  v24 = 0.0;
  if (!-[_UITextSizeCache getSize:baselineInfo:forTargetSize:isMultiline:](intrinsicContentSizeCache, "getSize:baselineInfo:forTargetSize:isMultiline:", &v23, &self->_intrinsicSizeBaselineInfo, self->_numberOfLines != 1, width, height))
  {
    if (width <= 0.0 || self->_numberOfLines == 1)
      v12 = 3.40282347e38;
    else
      v12 = width;
    -[UILabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 0.0, 0.0, v12);
    v23 = v13;
    v24 = v14;
    -[_UITextSizeCache addSize:baselineInfo:forTargetSize:](self->_intrinsicContentSizeCache, "addSize:baselineInfo:forTargetSize:", &self->_intrinsicSizeBaselineInfo, v13, v14, width, height);
  }
  if (kdebug_is_enabled())
  {
    -[UIView description](self, "description");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "UTF8String");
    kdebug_trace_string();

    -[UIView superview](self, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    kdebug_trace();

  }
  if ((_DWORD)v20)
    kdebug_trace();
  v17 = v23;
  v18 = v24;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UILabel _textRectForBounds:limitedToNumberOfLines:includingShadow:](self, "_textRectForBounds:limitedToNumberOfLines:includingShadow:", numberOfLines, 1, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (NSInteger)numberOfLines
{
  return self->_numberOfLines;
}

- (double)_ensureBaselineMetricsReturningBounds
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;

  if (!a1)
    return 0.0;
  v2 = (double *)MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  objc_msgSend((id)a1, "_preferredMaxLayoutWidth");
  if (v4 != 0.0 && *(_QWORD *)(a1 + 448) != 1)
    v3 = v4;
  v6 = *v2;
  v5 = v2[1];
  objc_msgSend((id)a1, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend((id)a1, "_intrinsicSizeWithinSize:", v3, v2[3]);
    v10 = v9;
    v12 = v11;
    if (*(_QWORD *)(a1 + 448) == 1 && (*(_DWORD *)(a1 + 744) & 0x1000A) == 0)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend((id)a1, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      +[UILabel defaultFont](UILabel, "defaultFont");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(CFSTR("X"), "_legacy_sizeWithFont:forWidth:lineBreakMode:", v14, objc_msgSend((id)a1, "lineBreakMode"), 3.40282347e38);
    v10 = v15;
    v12 = v16;
    if (!v13)

  }
  objc_msgSend((id)a1, "_drawTextInRect:baselineCalculationOnly:", 1, v6, v5, v10, v12);
LABEL_15:
  *(double *)(a1 + 512) = v6;
  *(double *)(a1 + 520) = v5;
  *(double *)(a1 + 528) = v10;
  *(double *)(a1 + 536) = v12;
  return v6;
}

- (double)_preferredMaxLayoutWidth
{
  double result;

  if ((*((_BYTE *)&self->_textLabelFlags + 1) & 0x20) != 0)
    return self->_preferredMaxLayoutWidth;
  result = 0.0;
  if ((*(_QWORD *)&self->super._viewFlags & 0x4000000000000) == 0)
    return self->_preferredMaxLayoutWidth;
  return result;
}

- (BOOL)_multilineLabelRequiresCarefulMeasurement
{
  return *((unsigned __int8 *)&self->_textLabelFlags + 2) >> 7;
}

- (CGRect)_drawTextInRect:(CGRect)a3 baselineCalculationOnly:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if (self)
  {
    v4 = -[UILabel _drawTextInRect:baselineCalculationOnly:returningDeviceMetricsOfFirstLine:returningMultilineDeviceMetrics:forceMultiline:]((uint64_t)self, a4, 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else
  {
    v7 = 0.0;
    v6 = 0.0;
    v5 = 0.0;
    v4 = 0.0;
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

uint64_t __47__UILabel__resolveMaterialUsingAttributedText___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (id)_materializedAttributedString
{
  id v1;
  void *v2;
  id v3;
  int v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "_content");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributedStringContent");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = dyld_program_sdk_at_least();
    -[UILabel _setContent:adjustingFontForAccessibilityTraits:adjustingFontForTypesettingLanguage:adjustingFontForTypesettingLanguageAwareLineHeightRatio:checkingForDifferences:]((uint64_t)v1, v3, 1, v4, v4, 0);

    objc_msgSend(v1, "_content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributedString");
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void)tintColorDidChange
{
  if (self
    && (-[UILabel _textColorFollowsTintColor](self, "_textColorFollowsTintColor")
     || (*((_BYTE *)&self->_textLabelFlags + 3) & 0x80) != 0))
  {
    -[UILabel _invalidateLabelDisplay](self);
  }
}

- (id)_stringDrawingContext
{
  id v3;
  int64_t numberOfLines;

  v3 = objc_alloc_init((Class)off_1E1679CC0);
  numberOfLines = self->_numberOfLines;
  objc_msgSend(v3, "setWrapsForTruncationMode:", numberOfLines != 1);
  objc_msgSend(v3, "setMaximumNumberOfLines:", numberOfLines);
  if ((*((_BYTE *)&self->_textLabelFlags + 1) & 0x40) != 0)
    objc_msgSend(v3, "setDrawsDebugBaselines:", 1);
  objc_msgSend(v3, "setCachesLayout:", 1);
  objc_msgSend(v3, "setLayout:", self->_layout);
  if ((*((_BYTE *)&self->_textLabelFlags + 2) & 2) != 0)
    objc_msgSend(v3, "setUsesSimpleTextEffects:", 1);
  if (self->_cuiCatalog)
    objc_msgSend(v3, "setCuiCatalog:");
  if (self->_cuiStyleEffectConfiguration)
  {
    objc_msgSend(v3, "setCuiStyleEffects:");
    if (-[CUIStyleEffectConfiguration useSimplifiedEffect](self->_cuiStyleEffectConfiguration, "useSimplifiedEffect"))objc_msgSend(v3, "setUsesSimpleTextEffects:", 1);
  }
  return v3;
}

- (uint64_t)_updateScaledMetricsForRect:(double)a3
{
  uint64_t v9;
  double *v10;
  double v11;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;

  if (result)
  {
    v9 = result;
    v10 = *(double **)(result + 616);
    if (v10)
      v11 = v10[1];
    else
      v11 = 0.0;
    if (*(double *)(result + 624) != a4 || *(double *)(result + 632) != a5)
    {
      if (a4 < 3.40282347e38 || a5 < 3.40282347e38)
      {
        objc_msgSend((id)result, "_synthesizedAttributedText");
        v10 = (double *)objc_claimAutoreleasedReturnValue();
        -[UILabel _scaledMetricsForText:inRect:]((_UILabelLegacyScaledMetrics *)v9, v10, a2, a3, a4, a5);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *(void **)(v9 + 616);
        *(_QWORD *)(v9 + 616) = v13;

      }
      else
      {
        *(_QWORD *)(result + 616) = 0;
      }

      *(double *)(v9 + 624) = a4;
      *(double *)(v9 + 632) = a5;
      v10 = *(double **)(v9 + 616);
    }
    if (v10)
      v15 = v10[1];
    else
      v15 = 0.0;
    if (v11 == v15)
    {
      return 0;
    }
    else
    {
      v16 = *(void **)(v9 + 608);
      *(_QWORD *)(v9 + 608) = 0;

      return 1;
    }
  }
  return result;
}

- (NSAttributedString)_synthesizedAttributedText
{
  void *v3;
  NSAttributedString *v4;
  NSAttributedString *synthesizedAttributedText;
  NSUInteger v6;
  void *v7;

  if (!self->_synthesizedAttributedText)
  {
    -[UILabel _content](self, "_content");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _synthesizedAttributedTextForContent:]((uint64_t)self, v3);
    v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    synthesizedAttributedText = self->_synthesizedAttributedText;
    self->_synthesizedAttributedText = v4;

    v6 = -[NSAttributedString length](self->_synthesizedAttributedText, "length");
    if (v6)
    {
      -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_synthesizedAttributedText, "attribute:atIndex:longestEffectiveRange:inRange:", *(_QWORD *)off_1E1678C58, 0, 0, 0, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)(v7 != 0) << 16));

    }
    else
    {
      *(_QWORD *)&self->_textLabelFlags &= ~0x10000uLL;
    }
  }
  return self->_synthesizedAttributedText;
}

- (_UILabelLegacyScaledMetrics)_scaledMetricsForText:(double)a3 inRect:(double)a4
{
  id v9;
  _UILabelLegacyScaledMetrics *v10;
  _UILabelLegacyScaledMetrics *v11;
  uint64_t v12;
  uint64_t measuredNumberOfLines;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  _UILabelLegacyScaledMetrics *v26;
  double *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  _UILabelLegacyScaledMetrics *v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;

  v9 = a2;
  if (a1)
  {
    -[_UILabelLegacyScaledMetrics _associatedScalingLabel](a1, "_associatedScalingLabel");
    v10 = (_UILabelLegacyScaledMetrics *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10 || v10 == a1)
    {
      if ((LOBYTE(a1[7]._scaledSize.height) & 2) == 0
        || (objc_msgSend(*(id *)&a1[8]._scaledBaselineOffset, "minimumScaleFactor"), v34 >= 1.0))
      {
        a1 = 0;
        goto LABEL_37;
      }
      -[_UILabelLegacyScaledMetrics _stringDrawingContext](a1, "_stringDrawingContext");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v35, "copy");

      objc_msgSend(*(id *)&a1[8]._scaledBaselineOffset, "minimumScaleFactor");
      if (v36 >= 1.0)
      {
        a1 = 0;
        goto LABEL_24;
      }
      if (v36 <= 0.0)
        v36 = 0.01;
      objc_msgSend(v15, "setMinimumScaleFactor:", v36);
      objc_msgSend(v15, "setLayout:", 0);
      objc_msgSend(v15, "setWantsBaselineOffset:", 1);
      objc_msgSend(v15, "setWantsScaledBaselineOffset:", 1);
      objc_msgSend(v15, "setWantsScaledLineHeight:", 1);
      objc_msgSend(v15, "setWantsNumberOfLineFragments:", 1);
      objc_msgSend(v15, "setMaximumNumberOfLines:", *(_QWORD *)&a1[4]._scaledSize.width);
      objc_msgSend(v9, "boundingRectWithSize:options:context:", -[_UILabelLegacyScaledMetrics _stringDrawingOptions](a1, "_stringDrawingOptions"), v15, a5, a6);
      v38 = v37;
      v40 = v39;
      objc_msgSend(v15, "scaledLineHeight");
      v42 = v41;
      objc_msgSend(v15, "actualScaleFactor");
      a1 = 0;
      if (v43 <= 0.0)
        goto LABEL_24;
      v44 = v43;
      if (v43 >= 1.0 || 1.0 - v43 <= 0.00000011920929)
        goto LABEL_24;
      v45 = objc_alloc_init(_UILabelLegacyScaledMetrics);
      a1 = v45;
      if (v45)
      {
        v45->_scaledSize.width = v38;
        v45->_scaledSize.height = v42;
        v45->_unscaledAndPossiblyTooLargeSize.width = v38;
        v45->_unscaledAndPossiblyTooLargeSize.height = v40;
        objc_msgSend(v15, "baselineOffset");
        a1->_baselineOffset = v46;
        objc_msgSend(v15, "firstBaselineOffset");
        a1->_scaledFirstBaselineOffset = v47;
        objc_msgSend(v15, "scaledBaselineOffset");
        a1->_scaledBaselineOffset = v48;
        a1->_actualScaleFactor = v44;
        a1->_measuredNumberOfLines = objc_msgSend(v15, "numberOfLineFragments");
      }
      else
      {
        objc_msgSend(v15, "baselineOffset");
        objc_msgSend(v15, "firstBaselineOffset");
        objc_msgSend(v15, "scaledBaselineOffset");
        objc_msgSend(v15, "numberOfLineFragments");
      }
      v49 = objc_msgSend(v9, "length");
      objc_msgSend(v15, "actualScaleFactor");
      objc_msgSend(v9, "_ui_attributedSubstringFromRange:scaledByScaleFactor:", 0, v49);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (uint64_t)a1;
      v33 = v17;
LABEL_23:
      -[_UICollectionLayoutItemSolver setSolveResult:](v32, v33);

LABEL_24:
LABEL_37:

      goto LABEL_38;
    }
    if (!v10[6]._measuredNumberOfLines)
    {
      -[_UILabelLegacyScaledMetrics bounds](v10, "bounds");
      -[UILabel _updateScaledMetricsForRect:](v11);
    }
    v12 = objc_msgSend(v9, "length");
    measuredNumberOfLines = v11[6]._measuredNumberOfLines;
    if (measuredNumberOfLines)
      v14 = *(double *)(measuredNumberOfLines + 8);
    else
      v14 = 0.0;
    objc_msgSend(v9, "_ui_attributedSubstringFromRange:scaledByScaleFactor:", 0, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UILabelLegacyScaledMetrics _stringDrawingContext](a1, "_stringDrawingContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");

    objc_msgSend(v17, "setWantsNumberOfLineFragments:", 1);
    objc_msgSend(v17, "setMaximumNumberOfLines:", -[_UILabelLegacyScaledMetrics numberOfLines](a1, "numberOfLines"));
    objc_msgSend(v17, "setMinimumScaleFactor:", 1.0);
    objc_msgSend(v17, "setLayout:", 0);
    objc_msgSend(v9, "boundingRectWithSize:options:context:", -[_UILabelLegacyScaledMetrics _stringDrawingOptions](a1, "_stringDrawingOptions"), v17, a5, a6);
    v19 = v18;
    v21 = v20;
    objc_msgSend(v17, "setLayout:", 0);
    objc_msgSend(v15, "boundingRectWithSize:options:context:", -[_UILabelLegacyScaledMetrics _stringDrawingOptions](a1, "_stringDrawingOptions"), v17, a5, a6);
    v23 = v22;
    v25 = v24;
    v26 = objc_alloc_init(_UILabelLegacyScaledMetrics);
    a1 = v26;
    if (v26)
    {
      v26->_scaledSize.width = v23;
      v26->_scaledSize.height = v25;
      v26->_unscaledAndPossiblyTooLargeSize.width = v19;
      v26->_unscaledAndPossiblyTooLargeSize.height = v21;
    }
    v27 = (double *)v11[6]._measuredNumberOfLines;
    if (v27)
    {
      v28 = v27[2];
      if (!v26)
        goto LABEL_13;
    }
    else
    {
      v28 = 0.0;
      if (!v26)
      {
LABEL_13:
        if (v27)
        {
          v29 = v27[7];
          if (!v26)
            goto LABEL_16;
        }
        else
        {
          v29 = 0.0;
          if (!v26)
          {
LABEL_16:
            if (v27)
            {
              v30 = v27[3];
              if (!v26)
                goto LABEL_19;
            }
            else
            {
              v30 = 0.0;
              if (!v26)
              {
LABEL_19:
                if (v27)
                {
                  v31 = v27[1];
                  if (v26)
                  {
LABEL_21:
                    v26->_actualScaleFactor = v31;
                    v26->_measuredNumberOfLines = objc_msgSend(v17, "numberOfLineFragments");
LABEL_22:
                    v32 = (uint64_t)a1;
                    v33 = v15;
                    goto LABEL_23;
                  }
                }
                else
                {
                  v31 = 0.0;
                  if (v26)
                    goto LABEL_21;
                }
                objc_msgSend(v17, "numberOfLineFragments", v31);
                goto LABEL_22;
              }
            }
            v26->_scaledBaselineOffset = v30;
            v27 = (double *)v11[6]._measuredNumberOfLines;
            goto LABEL_19;
          }
        }
        v26->_scaledFirstBaselineOffset = v29;
        v27 = (double *)v11[6]._measuredNumberOfLines;
        goto LABEL_16;
      }
    }
    v26->_baselineOffset = v28;
    v27 = (double *)v11[6]._measuredNumberOfLines;
    goto LABEL_13;
  }
LABEL_38:

  return a1;
}

- (UILabel)_associatedScalingLabel
{
  return (UILabel *)objc_getAssociatedObject(self, &kAssociatedScalingLabelKey);
}

- (double)_boundingRectWithString:(uint64_t)a3 size:(void *)a4 options:(void *)a5 attributes:(double)a6 context:(double)a7
{
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  double v19;

  v13 = a2;
  v14 = a4;
  v15 = a5;
  if (a1)
  {
    if ((a1[748] & 0x80) != 0)
    {
      -[UILabel _verticalTextLayoutManager](a1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "boundingRectWithString:size:options:attributes:context:", v13, a3, v14, v15, a6, a7);
      v17 = v19;

    }
    else
    {
      objc_msgSend(v13, "boundingRectWithSize:options:attributes:context:", a3, v14, v15, a6, a7);
      v17 = v16;
    }
  }
  else
  {
    v17 = 0.0;
  }

  return v17;
}

- (double)_drawTextInRect:(int)a3 baselineCalculationOnly:(unsigned __int8)a4 returningDeviceMetricsOfFirstLine:(int)a5 returningMultilineDeviceMetrics:(double)a6 forceMultiline:(double)a7
{
  double v14;
  double v15;
  void *v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  int *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  float v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  double v40;
  double v41;
  uint64_t v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  void *v55;
  CGFloat y;
  void *v57;
  void *v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  uint64_t v76;
  double v77;
  double v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  uint64_t i;
  double v86;
  double v87;
  char v88;
  void *v89;
  uint64_t v90;
  unsigned int v91;
  double v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  double v104;
  uint64_t v105;
  double v106;
  _BYTE *v107;
  void *v108;
  char v109;
  unint64_t v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  void *v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  _UITextClippingDebugInfo *v127;
  NSObject *v128;
  NSObject *v129;
  void *v130;
  uint64_t v131;
  double v132;
  _BYTE *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  double v139;
  double v140;
  double v141;
  double v142;
  _BYTE *v143;
  void *v144;
  double x;
  double v146;
  void *v147;
  void *v148;
  CGSize v149;
  void *v150;
  _BYTE *v151;
  uint64_t v152;
  id v153;
  void *v154;
  double v155;
  double v156;
  double v157;
  double v158;
  BOOL v159;
  CGFloat v160;
  CGFloat v161;
  CGFloat width;
  CGFloat height;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  void *v170;
  double v171;
  CGFloat v172;
  double v173;
  double v174;
  double v175;
  CGFloat v176;
  double MaxX;
  double MaxY;
  double MinY;
  _UITextClippingDebugInfo *v180;
  char *v181;
  void *v182;
  void *v183;
  void *v184;
  double v185;
  double v186;
  double v187;
  void *v188;
  double v189;
  CGFloat v190;
  CGFloat v191;
  void *v192;
  double v193;
  double v194;
  _BOOL4 v195;
  double v196;
  double v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  double MinX;
  CGFloat v204;
  CGFloat v205;
  CGFloat v206;
  CGFloat v207;
  CGFloat v208;
  double v209;
  CGFloat v210;
  CGFloat v211;
  double v212;
  CGFloat v213;
  CGFloat v214;
  double v215;
  id v216;
  CGFloat v217;
  double v218;
  char r2;
  CGFloat r2a;
  CGFloat r2b;
  CGFloat r2c;
  CGFloat r2d;
  _BYTE *r2_8;
  CGFloat r2_16;
  double r2_16b;
  CGFloat r2_16a;
  double r2_24;
  CGFloat r2_24a;
  double v230;
  CGFloat v231;
  double rect;
  CGFloat recta;
  double rectb;
  void *v235;
  void *v236;
  double v237;
  int v238;
  unsigned __int8 v239;
  double v240;
  double v241;
  char v242;
  void *v243;
  void *v244;
  double v245;
  double rect2;
  double rect2a;
  void *v248;
  id v249;
  double v250;
  CGFloat rect1a;
  double rect1d;
  CGFloat rect1b;
  double rect1c;
  double v256;
  double v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  char v262;
  CGRect buf[4];
  uint64_t v264;
  CGRect v265;
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;
  CGRect v271;
  CGRect v272;
  CGRect v273;
  CGRect v274;
  CGRect v275;
  CGRect v276;
  CGRect v277;
  CGRect v278;
  CGRect v279;
  CGRect v280;
  CGRect v281;
  CGRect v282;
  CGRect v283;
  CGRect v284;
  CGRect v285;
  CGRect v286;
  CGRect v287;
  CGRect v288;
  CGRect v289;
  CGRect v290;
  CGRect v291;
  CGRect v292;
  CGRect v293;
  CGRect v294;
  CGRect v295;
  CGRect v296;
  CGRect v297;
  CGRect v298;
  CGRect v299;

  v264 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  v14 = a7;
  v15 = a6;
  *(double *)(a1 + 472) = a6;
  *(double *)(a1 + 480) = a7;
  *(double *)(a1 + 488) = a8;
  *(double *)(a1 + 496) = a9;
  objc_msgSend((id)a1, "_content");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "length") && (a2 & 1) == 0)
  {
    v18 = *MEMORY[0x1E0C9D628];
    goto LABEL_184;
  }
  *(_QWORD *)(a1 + 456) = 0;
  *(_QWORD *)(a1 + 464) = 0;
  *(_QWORD *)(a1 + 504) = -1;
  objc_msgSend((id)a1, "_stringDrawingContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel _synthesizedTextAttributes]((_QWORD *)a1);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v239 = a4;
  if (a2 && !objc_msgSend(v17, "length"))
  {
    v27 = objc_alloc(MEMORY[0x1E0CB3498]);
    v28 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend((id)a1, "font");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (!v29)
    {
      +[UILabel defaultFont](UILabel, "defaultFont");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v28, "dictionaryWithObject:forKey:", v30, *(_QWORD *)off_1E1678D90);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v27, "initWithString:attributes:", CFSTR("X"), v31);

    if (!v29)
    v20 = 1;
    v21 = (void *)v32;
  }
  else
  {
    v20 = 0;
    v21 = 0;
  }
  objc_msgSend(v19, "setWantsNumberOfLineFragments:", 1);
  if (a5)
    objc_msgSend(v19, "setMaximumNumberOfLines:", 0);
  -[UILabel _updateScaledMetricsForRect:](a1, v15, v14, a8, a9);
  if (*(_QWORD *)(a1 + 616))
    objc_msgSend(v19, "setLayout:", 0);
  v22 = &OBJC_IVAR____UIViewFittingSizeTargetInfo__verticalPriority;
  if (v21)
  {
LABEL_37:
    v36 = *(_QWORD *)(a1 + 616);
    if (v36)
    {
      if ((v20 & 1) != 0)
        goto LABEL_40;
      goto LABEL_39;
    }
    goto LABEL_43;
  }
  if (objc_msgSend(v17, "isAttributed"))
  {
    v23 = *(_QWORD *)(a1 + 744);
    goto LABEL_15;
  }
  objc_msgSend((id)a1, "_hyphenationFactor");
  if (v33 > 0.0)
  {
    v23 = *(_QWORD *)(a1 + 744);
    if ((v23 & 0x4000000) != 0)
    {
LABEL_15:
      if ((v23 & 0x30000000000) != 0)
      {
        objc_msgSend((id)a1, "_content");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "intelligenceLightAttributedStrings");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if ((*(_BYTE *)(a1 + 749) & 1) != 0
          && (objc_msgSend(v25, "lightReactiveAttributedString"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v26,
              v26))
        {
          objc_msgSend(v25, "lightReactiveAttributedString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = 0;
        }
        if ((*(_BYTE *)(a1 + 749) & 2) != 0)
        {
          objc_msgSend(v25, "lightInertAttributedString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            objc_msgSend(v25, "lightInertAttributedString");
            v35 = objc_claimAutoreleasedReturnValue();

            v21 = (void *)v35;
          }
        }
        if (v21)
        {
          objc_msgSend(v19, "setCachesLayout:", 0);

LABEL_36:
          v20 = 1;
          goto LABEL_37;
        }

      }
      objc_msgSend((id)a1, "_synthesizedAttributedText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
  }
  objc_msgSend(v17, "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 616))
  {
LABEL_39:
    objc_msgSend((id)a1, "_synthesizedAttributedText");
    v37 = objc_claimAutoreleasedReturnValue();

    v36 = *(_QWORD *)(a1 + 616);
    v21 = (void *)v37;
LABEL_40:
    v38 = *(_QWORD *)(a1 + 744);
    if ((v38 & 4) != 0)
    {
      v39 = &OBJC_IVAR____UIViewFittingSizeTargetInfo__verticalPriority;
      if (v36)
      {
        v40 = *(double *)(v36 + 24);
        rect2 = v40;
        goto LABEL_54;
      }
    }
    else
    {
      v39 = &OBJC_IVAR____UIViewFittingSizeTargetInfo__verticalPriority;
      if (v36)
      {
        rect2 = *(double *)(v36 + 24);
        v40 = *(double *)(v36 + 16);
LABEL_54:
        if (1.0 - *(double *)(v36 + 8) <= 0.00000011920929)
        {
          v249 = 0;
          goto LABEL_59;
        }
        v36 = *(_QWORD *)(v36 + 48);
LABEL_56:
        v249 = (id)v36;
        v36 = *(_QWORD *)(a1 + 616);
        if (!v36)
        {
          v257 = 0.0;
LABEL_62:
          v51 = a1 + v39[246];
          *(_QWORD *)(v51 + 48) = v36;
          v52 = *(_QWORD *)(a1 + 448);
          if (v52 >= 1)
          {
            if (v36 >= v52)
              v36 = *(_QWORD *)(a1 + 448);
            *(_QWORD *)(v51 + 48) = v36;
          }
          goto LABEL_66;
        }
        v38 = *(_QWORD *)(a1 + 744);
LABEL_59:
        v49 = (v38 & 4) == 0;
        v50 = 72;
        if (v49)
          v50 = 88;
        v257 = *(double *)(v36 + v50);
        v36 = *(_QWORD *)(v36 + 40);
        goto LABEL_62;
      }
    }
    v40 = 0.0;
    rect2 = 0.0;
    goto LABEL_56;
  }
  v20 = 0;
LABEL_43:
  v41 = v14;
  v42 = *(_QWORD *)(a1 + 744);
  if (*(_QWORD *)(a1 + 448) == 1)
  {
    if ((v42 & 0x8000000000) != 0)
      v43 = 3.40282347e38;
    else
      v43 = a8;
    if ((v42 & 0x8000000000) != 0)
      v44 = a8;
    else
      v44 = 3.40282347e38;
    objc_msgSend(v19, "setWantsBaselineOffset:", 1);
    v45 = objc_msgSend((id)a1, "_stringDrawingOptions");
    if (!v20)
    {
      objc_msgSend((id)a1, "_defaultAttributes");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _boundingRectWithString:size:options:attributes:context:]((_BYTE *)a1, &stru_1E16EDF20, v45, v119, v19, v43, v44);
      v257 = v120;

      objc_msgSend(v19, "baselineOffset");
      v249 = 0;
      v238 = 0;
      *(_QWORD *)(a1 + 504) = 1;
      rect2 = 0.0;
      v40 = v121;
      v14 = v41;
      goto LABEL_78;
    }
    v46 = -[UILabel _boundingRectWithAttributedString:size:options:context:]((_BYTE *)a1, v21, v45, v19, v43, v44);
    v257 = v47;
    objc_msgSend(v19, "baselineOffset", v46);
    v40 = v48;
    v249 = 0;
    *(_QWORD *)(a1 + 504) = 1;
    rect2 = 0.0;
    v14 = v41;
  }
  else
  {
    if ((v42 & 0x8000000000) != 0)
      v74 = a8;
    else
      v74 = a9;
    if ((v42 & 0x8000000000) != 0)
      v75 = a9;
    else
      v75 = a8;
    objc_msgSend(v19, "setWantsBaselineOffset:", 1);
    v76 = objc_msgSend((id)a1, "_stringDrawingOptions");
    if (v20)
      v77 = -[UILabel _boundingRectWithAttributedString:size:options:context:]((_BYTE *)a1, v21, v76, v19, v75, v74);
    else
      v77 = -[UILabel _boundingRectWithString:size:options:attributes:context:]((_BYTE *)a1, v21, v76, v243, v19, v75, v74);
    v257 = v78;
    objc_msgSend(v19, "baselineOffset", v77);
    v40 = v122;
    objc_msgSend(v19, "firstBaselineOffset");
    v249 = 0;
    rect2 = 0.0;
    v14 = v41;
    if (!v20)
    {
      v238 = 0;
      goto LABEL_78;
    }
  }
LABEL_66:
  buf[0].origin = (CGPoint)xmmword_186679030;
  v53 = dyld_program_sdk_at_least();
  v54 = *(_QWORD *)off_1E1678C58;
  if (v53)
    objc_msgSend(v21, "attribute:atIndex:longestEffectiveRange:inRange:", v54, 0, buf, 0, objc_msgSend(v21, "length"));
  else
    objc_msgSend(v21, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678C58, 0, buf);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  y = buf[0].origin.y;
  if (*(_QWORD *)&y == objc_msgSend(v21, "length") || !v55)
  {
    if (v55)
    {
      objc_msgSend(v55, "floatValue");
      dyld_program_sdk_at_least();
    }
  }
  else
  {
    if (v249)
      v57 = v249;
    else
      v57 = v21;
    v58 = (void *)objc_msgSend(v57, "mutableCopy");
    objc_msgSend(v58, "removeAttribute:range:", v54, 0, objc_msgSend(v58, "length"));
    objc_msgSend(v19, "setWantsBaselineOffset:", 1);
    v59 = objc_msgSend(v19, "cachesLayout");
    objc_msgSend(v19, "setCachesLayout:", 0);
    v60 = -[UILabel _boundingRectWithAttributedString:size:options:context:]((_BYTE *)a1, v58, objc_msgSend((id)a1, "_stringDrawingOptions"), v19, a8, 3.40282347e38);
    v257 = v61;
    objc_msgSend(v19, "baselineOffset", v60);
    v40 = v62;
    objc_msgSend(v19, "firstBaselineOffset");
    objc_msgSend(v19, "setCachesLayout:", v59);

  }
  v238 = 1;
LABEL_78:
  v242 = a2;
  UIRoundToViewScale((void *)a1);
  UIRoundToViewScale((void *)a1);
  *(_QWORD *)(a1 + 464) = v63;
  UIRoundToViewScale((void *)a1);
  *(_QWORD *)(a1 + 456) = v64;
  if (*(_QWORD *)(a1 + 504) == -1)
    *(_QWORD *)(a1 + 504) = objc_msgSend(v19, "numberOfLineFragments");
  v256 = *(double *)(a1 + 464) - v40;
  v248 = v21;
  v250 = a8;
  if (objc_msgSend((id)a1, "lineSpacing"))
  {
    objc_msgSend((id)a1, "_defaultAttributes");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectForKey:", *(_QWORD *)off_1E1678D90);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v238)
    {
      v67 = v249;
      if (!v249)
      {
        objc_msgSend((id)a1, "_synthesizedAttributedText");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v244 = v19;
      v68 = v67;
      v69 = v66;
      v70 = objc_msgSend(v68, "length");
      v235 = v17;
      if (v69)
      {
        -[NSAttributedString _ui_fontsInRange:usingDefaultFont:](v68, 0, v70, v69);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[UILabel defaultFont](UILabel, "defaultFont");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSAttributedString _ui_fontsInRange:usingDefaultFont:](v68, 0, v70, v79);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v260 = 0u;
      v261 = 0u;
      v258 = 0u;
      v259 = 0u;
      v80 = v71;
      v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v258, buf, 16);
      if (v81)
      {
        v82 = v81;
        v83 = *(_QWORD *)v259;
        v84 = 0.0;
        do
        {
          for (i = 0; i != v82; ++i)
          {
            if (*(_QWORD *)v259 != v83)
              objc_enumerationMutation(v80);
            objc_msgSend(*(id *)(*((_QWORD *)&v258 + 1) + 8 * i), "lineHeight");
            if (v86 > v84)
              v84 = v86;
          }
          v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v258, buf, 16);
        }
        while (v82);
      }

      UICeilToViewScale((void *)a1);
      v73 = v87;
      if (!v249)

      v17 = v235;
      v19 = v244;
      v21 = v248;
      v22 = &OBJC_IVAR____UIViewFittingSizeTargetInfo__verticalPriority;
    }
    else
    {
      objc_msgSend(v66, "lineHeight");
      UICeilToViewScale((void *)a1);
      v73 = v72;
    }
    v256 = v256 - (v73 - (double)objc_msgSend((id)a1, "lineSpacing"));

  }
  v88 = v242;
  v89 = v249;
  if (v249)
  {
    v90 = *(_QWORD *)(a1 + 744);
    if (*(_QWORD *)(a1 + 448) != 1 || (v91 = (v90 >> 4) & 3, v91 == 1))
    {
      if ((v90 & 4) != 0)
      {
        v265.origin.x = v15;
        v265.origin.y = v14;
        v265.size.width = a8;
        v265.size.height = a9;
        CGRectGetMinY(v265);
        v266.origin.x = v15;
        v266.origin.y = v14;
        v266.size.width = a8;
        v266.size.height = a9;
        CGRectGetHeight(v266);
        UICeilToViewScale((void *)a1);
        v256 = v95;
        UICeilToViewScale((void *)a1);
      }
      else
      {
        v93 = *(_QWORD *)(a1 + 616);
        if (v93)
        {
          v94 = *(double *)(v93 + 72);
          v257 = v257 - v94;
        }
        else
        {
          v94 = 0.0;
        }
        v256 = v256 + v257 * 0.5;
      }
      v257 = v94;
    }
    else
    {
      v92 = v256;
      if (!v91)
        v92 = v40 - rect2 + v256;
      v256 = v92;
    }
  }
  objc_msgSend((id)a1, "_currentScreenScale");
  *(double *)(a1 + 512) = UIRectRoundToScale(v15, v256, a8, v257, v96);
  *(_QWORD *)(a1 + 520) = v97;
  *(_QWORD *)(a1 + 528) = v98;
  *(_QWORD *)(a1 + 536) = v99;
  v100 = a3 | v239;
  if (((a3 | v239) & 1) == 0
    && !objc_msgSend((id)a1, "_drawsDebugGlyphPathBoundsClipping"))
  {
    v109 = 0;
    goto LABEL_167;
  }
  v237 = v15;
  v101 = objc_msgSend((id)a1, "_stringDrawingOptions");
  v102 = MEMORY[0x1E0C9D648];
  v104 = *MEMORY[0x1E0C9D648];
  v103 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v245 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  rect2a = *(double *)(MEMORY[0x1E0C9D648] + 16);
  if ((v239 & 1) != 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_133;
LABEL_128:
    objc_msgSend(v19, "setWantsMultilineDeviceMetrics:", 1);
    v105 = v101 | 8;
    if (v249)
    {
      v106 = v257;
      if (v257 <= 0.0)
      {
LABEL_152:
        objc_msgSend(v19, "multilineDeviceMetricsRect", v106);
        v18 = v123;
        v116 = v124;
        v117 = v125;
        v118 = v126;
        v109 = 1;
        goto LABEL_153;
      }
      v107 = (_BYTE *)a1;
      v108 = v249;
    }
    else
    {
      if (*(_QWORD *)(a1 + 448) == 1)
        objc_msgSend(v19, "setMinimumScaleFactor:", 0.0);
      if (!v238)
      {
        -[UILabel _drawWithString:rect:options:attributes:context:]((_BYTE *)a1, v21, v105, v243, v19, v237, v256, a8, v257);
        goto LABEL_152;
      }
      v107 = (_BYTE *)a1;
      v108 = v21;
    }
    -[UILabel _drawWithAttributedString:rect:options:context:](v107, v108, v105, v19, v237, v256, a8, v257);
    goto LABEL_152;
  }
  if (objc_msgSend((id)a1, "_drawsDebugGlyphPathBoundsClipping") && (a3 & 1) == 0)
    goto LABEL_128;
  if (!a3)
  {
    v109 = 0;
    v118 = v245;
    v117 = rect2a;
    v116 = v103;
    v18 = v104;
    goto LABEL_153;
  }
LABEL_133:
  v110 = v101 & 0xFFFFFFFFFFFFFFF6 | 8;
  if (v249)
  {
    v111 = v249;
  }
  else
  {
    if (*(_QWORD *)(a1 + 448) == 1)
      objc_msgSend(v19, "setMinimumScaleFactor:", 0.0);
    if (!v238)
    {
      objc_msgSend(v21, "boundingRectWithSize:options:attributes:context:", v110, v243, v19, a8, v257);
      goto LABEL_145;
    }
    v111 = v21;
  }
  objc_msgSend(v111, "boundingRectWithSize:options:context:", v110, v19, a8, v257);
LABEL_145:
  v18 = v112;
  v116 = v113;
  v117 = v114;
  v118 = v115;
  v109 = 0;
LABEL_153:
  v267.origin.x = v18;
  v267.origin.y = v116;
  v267.size.width = v117;
  v267.size.height = v118;
  v291.origin.x = v104;
  v291.origin.y = v103;
  v291.size.height = v245;
  v291.size.width = rect2a;
  if (!CGRectEqualToRect(v267, v291))
    v116 = *(double *)(a1 + 456) - v116 - v118;
  v268.origin.x = v18;
  v268.origin.y = v116;
  v268.size.width = v117;
  v268.size.height = v118;
  v292.origin.x = v104;
  v292.origin.y = v103;
  v292.size.height = v245;
  v292.size.width = rect2a;
  if (CGRectEqualToRect(v268, v292) || !objc_msgSend((id)a1, "_drawsDebugGlyphPathBoundsClipping"))
    goto LABEL_166;
  objc_msgSend((id)a1, "bounds");
  if (CGRectGetHeight(v269) == 0.0
    || (objc_msgSend((id)a1, "bounds"), CGRectGetWidth(v270) == 0.0)
    || !-[UIView _isInVisibleHierarchy](a1)
    || (objc_msgSend((id)a1, "isHiddenOrHasHiddenAncestor") & 1) != 0)
  {
    v127 = 0;
    goto LABEL_162;
  }
  v236 = v17;
  v216 = *(id *)(a1 + 80);
  objc_msgSend((id)a1, "convertRect:toView:", v18, v116, v117, v118);
  r2_24 = v140;
  v230 = v139;
  v240 = v141;
  rect = v142;
  v262 = 1;
  *(_QWORD *)&v258 = 0;
  v143 = (id)a1;
  r2 = 0;
  v144 = 0;
  x = v104;
  v146 = v103;
  r2_16 = rect2a;
  rect1a = v245;
  v147 = v143;
  r2_8 = v143;
  do
  {
    objc_msgSend(v147, "_viewControllerForAncestor");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v148, "_viewControllerIgnoresClippedGlyphPathFrame") & 1) != 0)
    {

      v144 = 0;
      goto LABEL_205;
    }
    if (v262)
    {
      v149 = *(CGSize *)(v102 + 16);
      buf[0].origin = *(CGPoint *)v102;
      buf[0].size = v149;
      if ((v143[747] & 0x10) != 0 && (objc_msgSend(v147, "clipsToBounds") & 1) == 0)
      {
        objc_msgSend(v143, "layer");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v150, "_glyphPathBoundsExcedesLayers:drawableGlyphPathBounds:edgesClipped:", buf, &v258, v18, v116, v117, v118))
        {
          v151 = v143;

          v271.origin.x = x;
          v271.origin.y = v146;
          v271.size.width = r2_16;
          v271.size.height = rect1a;
          v293.origin.x = v104;
          v293.origin.y = v103;
          v293.size.height = v245;
          v293.size.width = rect2a;
          if (CGRectEqualToRect(v271, v293))
          {
            v146 = buf[0].origin.y;
            r2_16 = buf[0].size.width;
            r2 = 1;
            rect1a = buf[0].size.height;
            x = buf[0].origin.x;
          }
          else
          {
            v294.origin.x = x;
            v294.origin.y = v146;
            v294.size.width = r2_16;
            v294.size.height = rect1a;
            v272 = CGRectIntersection(buf[0], v294);
            x = v272.origin.x;
            v146 = v272.origin.y;
            r2_16 = v272.size.width;
            rect1a = v272.size.height;
            r2 = 1;
          }
        }
        else
        {
          v151 = v144;
        }

        v144 = v151;
        v143 = r2_8;
      }
      if (v262
        && objc_msgSend(v147, "clipsToBounds")
        && objc_msgSend(v147, "_clipsGlyphPathFrame:shouldContinueSuperviewTraversal:", &v262, v230, r2_24, v240, rect))
      {
        v153 = v147;

        objc_msgSend(v153, "bounds");
        objc_msgSend(v143, "convertRect:fromView:", v153);
        r2a = v155;
        v210 = v157;
        v213 = v156;
        v206 = v158;
        v295.origin.x = v104;
        v295.origin.y = v103;
        v295.size.height = v245;
        v295.size.width = rect2a;
        v159 = CGRectEqualToRect(buf[0], v295);
        v160 = v18;
        v161 = v116;
        width = v117;
        height = v118;
        if (!v159)
        {
          v160 = buf[0].origin.x;
          v161 = buf[0].origin.y;
          height = buf[0].size.height;
          width = buf[0].size.width;
        }
        v273.origin.x = r2a;
        v273.size.width = v210;
        v273.origin.y = v213;
        v273.size.height = v206;
        v274 = CGRectIntersection(v273, *(CGRect *)&v160);
        v205 = v274.origin.x;
        v207 = v274.origin.y;
        v209 = v274.size.width;
        v212 = v274.size.height;
        v274.origin.x = x;
        v274.origin.y = v146;
        v274.size.width = r2_16;
        v274.size.height = rect1a;
        v296.origin.x = v104;
        v296.origin.y = v103;
        v296.size.height = v245;
        v296.size.width = rect2a;
        v22 = &OBJC_IVAR____UIViewFittingSizeTargetInfo__verticalPriority;
        if (!CGRectEqualToRect(v274, v296))
        {
          v275.origin.x = v205;
          v275.origin.y = v207;
          v275.size.width = v209;
          v275.size.height = v212;
          v297.origin.x = x;
          v297.origin.y = v146;
          v297.size.width = r2_16;
          v297.size.height = rect1a;
          v276 = CGRectIntersection(v275, v297);
          v205 = v276.origin.x;
          v207 = v276.origin.y;
          v209 = v276.size.width;
          v212 = v276.size.height;
        }
        objc_msgSend(v153, "bounds");
        v165 = v164;
        v167 = v166;
        rect1d = v168;
        r2_16b = v169;
        objc_msgSend(v153, "window");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "convertRect:toView:", v170, v165, v167, rect1d, r2_16b);
        v172 = v171;
        v204 = v173;
        rect1b = v174;
        v176 = v175;

        v277.origin.y = r2_24;
        v277.origin.x = v230;
        v277.size.width = v240;
        v277.size.height = rect;
        MinX = CGRectGetMinX(v277);
        v278.origin.x = v172;
        v278.origin.y = v204;
        v278.size.width = rect1b;
        r2b = v176;
        v278.size.height = v176;
        if (MinX < CGRectGetMinX(v278))
          *(_QWORD *)&v258 = v258 | 2;
        v279.origin.y = r2_24;
        v279.origin.x = v230;
        v279.size.width = v240;
        v279.size.height = rect;
        MaxX = CGRectGetMaxX(v279);
        v280.origin.x = v172;
        v280.origin.y = v204;
        v280.size.width = rect1b;
        v280.size.height = r2b;
        v154 = v216;
        if (MaxX > CGRectGetMaxX(v280))
          *(_QWORD *)&v258 = v258 | 8;
        v281.origin.y = r2_24;
        v281.origin.x = v230;
        v281.size.width = v240;
        v281.size.height = rect;
        MaxY = CGRectGetMaxY(v281);
        v282.origin.x = v172;
        v282.origin.y = v204;
        v282.size.width = rect1b;
        v282.size.height = r2b;
        if (MaxY > CGRectGetMaxY(v282))
          *(_QWORD *)&v258 = v258 | 4;
        v283.origin.y = r2_24;
        v283.origin.x = v230;
        v283.size.width = v240;
        v283.size.height = rect;
        MinY = CGRectGetMinY(v283);
        v284.origin.x = v172;
        v284.origin.y = v204;
        v284.size.width = rect1b;
        v284.size.height = r2b;
        if (MinY < CGRectGetMinY(v284))
          *(_QWORD *)&v258 = v258 | 1;

        v144 = v153;
        x = v205;
        v146 = v207;
        goto LABEL_219;
      }
    }

    objc_msgSend(v147, "superview");
    v152 = objc_claimAutoreleasedReturnValue();

    v147 = (void *)v152;
  }
  while (v152);
  if ((r2 & 1) == 0)
  {
LABEL_205:
    v127 = 0;
    v22 = &OBJC_IVAR____UIViewFittingSizeTargetInfo__verticalPriority;
    v154 = v216;
    goto LABEL_220;
  }
  v153 = v144;
  v209 = r2_16;
  v212 = rect1a;
  v22 = &OBJC_IVAR____UIViewFittingSizeTargetInfo__verticalPriority;
  v154 = v216;
LABEL_219:
  v180 = [_UITextClippingDebugInfo alloc];
  v127 = -[_UITextClippingDebugInfo initWithClippingView:visibleBounds:ignoresResult:edgesClipped:](v180, "initWithClippingView:visibleBounds:ignoresResult:edgesClipped:", v153, 0, (_QWORD)v258, x, v146, v209, v212);
LABEL_220:

  if (!v127)
  {
    v17 = v236;
    goto LABEL_162;
  }
  if (!-[_UITextClippingDebugInfo hasClippedEdges](v127, "hasClippedEdges"))
  {
    v17 = v236;
    if (-[_UITextClippingDebugInfo ignoresResult](v127, "ignoresResult")
      && -[_UITextClippingDebugInfo hasClippedEdges](v127, "hasClippedEdges"))
    {
      goto LABEL_165;
    }
LABEL_162:
    objc_msgSend((id)a1, "_glyphPathBoundsIntersectionData", *(_QWORD *)&MinX);
    v128 = objc_claimAutoreleasedReturnValue();
    v129 = v128;
    if (v128)
    {
      -[NSObject setClippingView:](v128, "setClippingView:", 0);
      -[NSObject setGlyphPathBounds:](v129, "setGlyphPathBounds:", v104, v103, rect2a, v245);
      -[NSObject setAvailableBounds:](v129, "setAvailableBounds:", v104, v103, rect2a, v245);
    }
    goto LABEL_164;
  }
  v181 = getenv("__ViewHierarchyCaptureInProgress");
  v17 = v236;
  if (!v181 || *v181 != 49)
  {
    +[UIColor systemGreenColor](UIColor, "systemGreenColor", *(_QWORD *)&MinX);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "setStroke");

    +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v18, v116, v117, v118);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "strokeWithBlendMode:alpha:", 0, 1.0);
    +[UIColor systemRedColor](UIColor, "systemRedColor");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "setFill");

    r2_16a = v104;
    r2_24a = v103;
    v231 = v245;
    recta = rect2a;
    if (-[_UITextClippingDebugInfo topEdgeClipped](v127, "topEdgeClipped"))
    {
      -[_UITextClippingDebugInfo visibleBounds](v127, "visibleBounds");
      r2_24a = v185;
      v231 = 2.5;
      r2_16a = v186;
      recta = v187;
      +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v186);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v188, "fillWithBlendMode:alpha:", 0, 0.6);

    }
    rect1c = v104;
    v241 = v103;
    v189 = rect2a;
    r2c = v245;
    if (-[_UITextClippingDebugInfo bottomEdgeClipped](v127, "bottomEdgeClipped"))
    {
      -[_UITextClippingDebugInfo visibleBounds](v127, "visibleBounds");
      v190 = v285.origin.x;
      v217 = v285.size.width;
      r2d = v285.origin.x;
      v211 = v285.size.height;
      v214 = v285.origin.y;
      v191 = v285.size.width;
      rect1c = CGRectGetMinX(v285);
      v286.origin.x = v190;
      v286.origin.y = v214;
      v286.size.width = v191;
      v286.size.height = v211;
      v241 = CGRectGetMaxY(v286) + -2.5;
      v287.size.width = v217;
      v287.origin.x = r2d;
      v287.origin.y = v214;
      v287.size.height = v211;
      v189 = CGRectGetWidth(v287);
      r2c = 2.5;
      +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", rect1c, v241, v189, 2.5);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "fillWithBlendMode:alpha:", 0, 0.6);

    }
    if (-[_UITextClippingDebugInfo leftEdgeClipped](v127, "leftEdgeClipped")
      || -[_UITextClippingDebugInfo rightEdgeClipped](v127, "rightEdgeClipped"))
    {
      -[_UITextClippingDebugInfo visibleBounds](v127, "visibleBounds");
      v218 = v193;
      -[_UITextClippingDebugInfo visibleBounds](v127, "visibleBounds");
      v215 = v194;
      v288.origin.x = r2_16a;
      v288.origin.y = r2_24a;
      v288.size.height = v231;
      v288.size.width = recta;
      v298.origin.x = v104;
      v208 = v103;
      v298.origin.y = v103;
      v298.size.width = rect2a;
      v298.size.height = v245;
      v195 = CGRectEqualToRect(v288, v298);
      v196 = v218 + 2.5;
      if (v195)
        v196 = v218;
      rectb = v196;
      if (v195)
        v197 = v215;
      else
        v197 = v215 + -2.5;
      v289.origin.x = rect1c;
      v289.origin.y = v241;
      v289.size.width = v189;
      v289.size.height = r2c;
      v299.origin.x = v104;
      v299.origin.y = v208;
      v299.size.width = rect2a;
      v299.size.height = v245;
      if (!CGRectEqualToRect(v289, v299))
        v197 = v197 + -2.5;
      if (-[_UITextClippingDebugInfo leftEdgeClipped](v127, "leftEdgeClipped"))
      {
        -[_UITextClippingDebugInfo visibleBounds](v127, "visibleBounds");
        +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v198, "fillWithBlendMode:alpha:", 0, 0.6);

      }
      if (-[_UITextClippingDebugInfo rightEdgeClipped](v127, "rightEdgeClipped"))
      {
        -[_UITextClippingDebugInfo visibleBounds](v127, "visibleBounds");
        +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", CGRectGetMaxX(v290) + -2.5, rectb, 2.5, v197);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "fillWithBlendMode:alpha:", 0, 0.6);

      }
    }

    v22 = &OBJC_IVAR____UIViewFittingSizeTargetInfo__verticalPriority;
    v143 = r2_8;
  }
  if ((objc_msgSend(v143, "_glyphPathBoundsClippingDetected", *(_QWORD *)&MinX) & 1) == 0)
  {
    -[_UITextClippingDebugInfo clippingView](v127, "clippingView");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _markGlyphPathBoundsClippingDetected:glyphPathBounds:availableBounds:](v143, v200, v18, v116, v117, v118, v237, v256, v250, v257);

    _UIClippingFaultLog();
    v129 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v129, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v143, "text");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextClippingDebugInfo clippingView](v127, "clippingView");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0].origin.x) = 138543874;
      *(_QWORD *)((char *)&buf[0].origin.x + 4) = r2_8;
      WORD2(buf[0].origin.y) = 2114;
      *(_QWORD *)((char *)&buf[0].origin.y + 6) = v201;
      HIWORD(buf[0].size.width) = 2114;
      *(_QWORD *)&buf[0].size.height = v202;
      _os_log_fault_impl(&dword_185066000, v129, OS_LOG_TYPE_FAULT, "[Internal] Text Clipping Detected: %{public}@ '%{public}@'. Clipping View: %{public}@", (uint8_t *)buf, 0x20u);

    }
LABEL_164:

  }
LABEL_165:

  v88 = v242;
  v89 = v249;
LABEL_166:
  v15 = v237;
  if ((v100 & 1) == 0)
  {
LABEL_167:
    if ((v109 & 1) == 0 && (v88 & 1) == 0)
    {
      if ((*(_BYTE *)(a1 + v22[242] + 5) & 8) != 0)
      {
        objc_msgSend((id)a1, "_delegate");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "_glyphPathsBoundingRectWillChange:", a1);

      }
      v131 = objc_msgSend((id)a1, "_stringDrawingOptions", *(_QWORD *)&MinX);
      if (v89)
      {
        v132 = v257;
        if (v257 > 0.0)
        {
          v133 = (_BYTE *)a1;
          v134 = v89;
          goto LABEL_178;
        }
      }
      else
      {
        if (*(_QWORD *)(a1 + 448) == 1)
          objc_msgSend(v19, "setMinimumScaleFactor:", 0.0);
        if (v238)
        {
          v133 = (_BYTE *)a1;
          v134 = v248;
LABEL_178:
          -[UILabel _drawWithAttributedString:rect:options:context:](v133, v134, v131, v19, v15, v256, v250, v257);
        }
        else
        {
          -[UILabel _drawWithString:rect:options:attributes:context:]((_BYTE *)a1, v248, v131, v243, v19, v15, v256, v250, v257);
        }
      }
      objc_msgSend(v19, "layout", v132);
      v135 = objc_claimAutoreleasedReturnValue();
      v136 = *(void **)(a1 + 608);
      *(_QWORD *)(a1 + 608) = v135;

      if ((*(_BYTE *)(a1 + v22[242] + 5) & 4) != 0)
      {
        objc_msgSend((id)a1, "_delegate");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "_glyphPathsBoundingRectDidChange:", a1);

      }
    }
    v18 = v15;
  }

LABEL_184:
  return v18;
}

- (int64_t)_stringDrawingOptions
{
  int64_t v3;

  if (-[UILabel _textAlignmentFollowsWritingDirection](self, "_textAlignmentFollowsWritingDirection"))
    v3 = 1049089;
  else
    v3 = 1048577;
  if (-[UILabel _textAlignmentMirrored](self, "_textAlignmentMirrored"))
    return v3 | 0x400;
  else
    return v3;
}

- (BOOL)_textAlignmentFollowsWritingDirection
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 2) >> 4) & 1;
}

- (BOOL)_textAlignmentMirrored
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 2) >> 5) & 1;
}

- (_QWORD)_synthesizedTextAttributes
{
  _QWORD *v1;
  void *v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  _BOOL4 ShouldReverseNaturalAlignment;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[72];
    if (!v2)
    {
      if (!objc_msgSend(a1, "isEnabled")
        || (objc_msgSend(v1, "isHighlighted") & 1) != 0
        || (objc_msgSend(v1, "_textColorFollowsTintColor") & 1) != 0
        || (*((_BYTE *)v1 + 747) & 0x80) != 0)
      {
        v4 = 0;
      }
      else
      {
        objc_msgSend(v1, "_textEncapsulation");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3 == 0;

      }
      objc_msgSend(v1, "_content");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ShouldReverseNaturalAlignment = _UILabelShouldReverseNaturalAlignment(v5, objc_msgSend(v1, "semanticContentAttribute"));

      if (!v4 || ShouldReverseNaturalAlignment)
      {
        v9 = (void *)MEMORY[0x1E0C99E08];
        objc_msgSend(v1, "_defaultAttributes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dictionaryWithDictionary:", v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v4)
        {
          if ((objc_msgSend(v1, "isEnabled") & 1) == 0)
          {
            v11 = objc_alloc_init((Class)off_1E1679CA0);
            objc_msgSend(v11, "setShadowColor:", 0);
            objc_msgSend(v8, "setObject:forKey:", v11, *(_QWORD *)off_1E1679048);

          }
          objc_msgSend(v1, "textColor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "currentTextColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) == 0)
          {
            objc_msgSend(v1, "currentTextColor");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v15, *(_QWORD *)off_1E1678D98);

          }
          objc_msgSend(v1, "_textEncapsulation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v1, "_textEncapsulation");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)objc_msgSend(v17, "copy");
            objc_msgSend(v8, "setObject:forKey:", v18, *MEMORY[0x1E0CA80D0]);

          }
        }
        if (ShouldReverseNaturalAlignment)
        {
          _UILabelReverseNaturalAlignment(v8);
          objc_claimAutoreleasedReturnValue();

        }
        v19 = objc_msgSend(v8, "copy");
        v20 = (void *)v1[72];
        v1[72] = v19;

      }
      else
      {
        objc_msgSend(v1, "_defaultAttributes");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v1[72];
        v1[72] = v7;
      }

      v2 = (void *)v1[72];
    }
    a1 = v2;
  }
  return a1;
}

- (BOOL)_textColorFollowsTintColor
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 3) >> 6) & 1;
}

- (id)_defaultAttributes
{
  void *v2;
  void *v3;

  -[UILabel _content](self, "_content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)lineSpacing
{
  return self->_lineSpacing;
}

- (BOOL)_drawsDebugGlyphPathBoundsClipping
{
  return *((unsigned __int8 *)&self->_textLabelFlags + 1) >> 7;
}

- (BOOL)isHighlighted
{
  return *(_DWORD *)&self->_textLabelFlags & 1;
}

- (id)_synthesizedAttributedTextForContent:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  float v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  _QWORD *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t, void *, uint64_t, uint64_t);
  void *v78;
  id v79;
  id v80;
  uint64_t *v81;
  uint64_t *v82;
  void *v83;
  _BOOL8 v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD v89[4];
  id v90;
  uint64_t *v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "attributedString");
    v5 = objc_claimAutoreleasedReturnValue();
    v68 = (void *)v5;
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "defaultAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _synthesizedTextAttributes]((_QWORD *)a1);
      v66 = v7;
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v67)
      {
        -[NSAttributedString _ui_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:](v6, 0, objc_msgSend(v4, "length"), v7);
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "defaultAttributes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v6, "mutableCopy");
        v10 = *(_QWORD *)off_1E1678D98;
        objc_msgSend(v8, "objectForKey:", *(_QWORD *)off_1E1678D98);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "length");
        v13 = MEMORY[0x1E0C809B0];
        v72[0] = MEMORY[0x1E0C809B0];
        v72[1] = 3221225472;
        v72[2] = __48__UILabel__synthesizedAttributedTextForContent___block_invoke;
        v72[3] = &unk_1E16E6108;
        v14 = v11;
        v73 = v14;
        v15 = v9;
        v74 = v15;
        objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v10, 0, v12, 0, v72);
        if ((objc_msgSend((id)a1, "isEnabled") & 1) == 0)
        {
          v16 = *(_QWORD *)off_1E1679048;
          objc_msgSend(v8, "objectForKey:", *(_QWORD *)off_1E1679048);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v4, "length");
          v69[0] = v13;
          v69[1] = 3221225472;
          v69[2] = __48__UILabel__synthesizedAttributedTextForContent___block_invoke_2;
          v69[3] = &unk_1E16E6108;
          v70 = v17;
          v71 = v15;
          v19 = v17;
          objc_msgSend(v71, "enumerateAttribute:inRange:options:usingBlock:", v16, 0, v18, 0, v69);

        }
        -[NSAttributedString _ui_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:](v15, 0, objc_msgSend(v4, "length"), v67);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (id)objc_msgSend(v20, "copy");

      }
      if (objc_msgSend((id)a1, "_overallWritingDirectionFollowsLayoutDirection"))
      {
        v22 = v21;
        if (objc_msgSend(v22, "length"))
        {
          v23 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend((id)a1, "semanticContentAttribute")) != UIUserInterfaceLayoutDirectionLeftToRight;
          v97 = 0;
          v98 = &v97;
          v99 = 0x2020000000;
          v100 = 0;
          v93 = 0;
          v94 = &v93;
          v95 = 0x2020000000;
          v96 = 0;
          objc_msgSend((id)a1, "_content");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "paragraphStyle");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v22, "length");
          v27 = *(_QWORD *)off_1E1678F98;
          v28 = MEMORY[0x1E0C809B0];
          v89[0] = MEMORY[0x1E0C809B0];
          v89[1] = 3221225472;
          v89[2] = __60__UILabel__attributedStringIsolatingStringWritingDirection___block_invoke;
          v89[3] = &unk_1E16EA368;
          v29 = v25;
          v90 = v29;
          v91 = &v93;
          v92 = &v97;
          objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", v27, 0, v26, 0, v89);
          v30 = v98[3];
          if (!v30)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", sel__attributedStringIsolatingStringWritingDirection_, a1, CFSTR("UILabel.m"), 1066, CFSTR("should have at least one isolate range (beginning to end)"));

            v30 = v98[3];
          }
          v64 = v29;
          v31 = malloc_type_malloc(16 * v30, 0x100004030AC6366uLL);
          v63 = v4;
          v85 = 0;
          v86 = &v85;
          v87 = 0x2020000000;
          v88 = 0;
          *((_WORD *)v94 + 12) = 0;
          v32 = (void *)objc_msgSend(v22, "mutableCopy");
          v33 = objc_msgSend(v22, "length");
          v75 = v28;
          v76 = 3221225472;
          v77 = __60__UILabel__attributedStringIsolatingStringWritingDirection___block_invoke_2;
          v78 = &unk_1E16EA390;
          v34 = v24;
          v79 = v34;
          v81 = &v93;
          v82 = &v85;
          v83 = v31;
          v84 = v23;
          v35 = v32;
          v80 = v35;
          objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", v27, 0, v33, 0, &v75);
          v36 = v86[3];
          if (v36 != v98[3])
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", sel__attributedStringIsolatingStringWritingDirection_, a1, CFSTR("UILabel.m"), 1095, CFSTR("Number of writing direction changes was inconsistent"));

            v36 = v98[3];
          }
          v61 = v34;
          v65 = v31;
          if (v36)
          {
            v37 = 0;
            v38 = 0;
            v39 = *(_QWORD *)off_1E1678C48;
            v40 = v65 + 1;
            do
            {
              v41 = *((unsigned __int16 *)v40 - 4);
              v42 = *v40 + v37;
              if (v38)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", 8297, v61);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "replaceCharactersInRange:withString:", v42, 0, v43);

                objc_msgSend(v35, "removeAttribute:range:", v39, v42++, 1);
                ++v37;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", v41, v61);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "replaceCharactersInRange:withString:", v42, 0, v44);

              objc_msgSend(v35, "removeAttribute:range:", v39, v42, 1);
              v40 += 2;
              ++v37;
              ++v38;
            }
            while (v38 < v98[3]);
          }
          v45 = objc_msgSend(v35, "length", v61);
          objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", 8297);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "replaceCharactersInRange:withString:", v45, 0, v46);

          objc_msgSend(v35, "removeAttribute:range:", *(_QWORD *)off_1E1678C48, v45, 1);
          free(v65);
          v47 = v80;
          v21 = v35;

          _Block_object_dispose(&v85, 8);
          _Block_object_dispose(&v93, 8);
          _Block_object_dispose(&v97, 8);
          v4 = v63;
        }
        else
        {
          v21 = v22;
        }

      }
      objc_msgSend((id)a1, "_hyphenationFactor");
      if (v48 > 0.0 && (*(_BYTE *)(a1 + 747) & 4) != 0)
      {
        v49 = v21;
        objc_msgSend(v49, "string");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "length");
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 32, 0);
        objc_msgSend(v52, "matchesInString:options:range:", v50, 0, 0, v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v49;
        v21 = v54;
        if (objc_msgSend(v53, "count"))
        {
          v55 = (void *)objc_msgSend(v54, "mutableCopy");
          v56 = *(_QWORD *)off_1E1678F98;
          v75 = MEMORY[0x1E0C809B0];
          v76 = 3221225472;
          v77 = __65__UILabel__attributedStringByDisablingHyphenationIfURLsDetected___block_invoke;
          v78 = &unk_1E16EA3B8;
          v57 = v55;
          v79 = v57;
          objc_msgSend(v54, "enumerateAttribute:inRange:options:usingBlock:", v56, 0, v51, 0, &v75);
          v21 = v57;

        }
      }

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_textEncapsulation
{
  return self->_textEncapsulation;
}

- (BOOL)_overallWritingDirectionFollowsLayoutDirection
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 3) >> 1) & 1;
}

- (double)_boundingRectWithAttributedString:(uint64_t)a3 size:(void *)a4 options:(double)a5 context:(double)a6
{
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  double v16;

  v11 = a2;
  v12 = a4;
  if (a1)
  {
    if ((a1[748] & 0x80) != 0)
    {
      -[UILabel _verticalTextLayoutManager](a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "boundingRectWithAttributedString:size:options:context:", v11, a3, v12, a5, a6);
      v14 = v16;

    }
    else
    {
      objc_msgSend(v11, "boundingRectWithSize:options:context:", a3, v12, a5, a6);
      v14 = v13;
    }
  }
  else
  {
    v14 = 0.0;
  }

  return v14;
}

- (NSLineBreakMode)lineBreakMode
{
  void *v2;
  void *v3;
  NSLineBreakMode v4;

  -[UILabel _content](self, "_content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paragraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lineBreakMode");

  return v4;
}

- (float)_hyphenationFactor
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[UILabel _content](self, "_content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paragraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hyphenationFactor");
  v5 = v4;

  return v5;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 4) >> 1) & 1;
}

- (UIColor)textColor
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UILabel _content](self, "_content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultValueForAttribute:", *(_QWORD *)off_1E1678D98);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_defaultColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIColor *)v6;
}

- (id)currentTextColor
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (!self)
  {
    v3 = 0;
    return v3;
  }
  if (-[UILabel _textColorFollowsTintColor](self, "_textColorFollowsTintColor")
    || (*((_BYTE *)&self->_textLabelFlags + 3) & 0x80) != 0)
  {
    -[UIView tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[UILabel textColor](self, "textColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v7;

    if (!v3)
      goto LABEL_16;
  }
  else
  {
    if (-[UILabel isEnabled](self, "isEnabled"))
    {
      if (-[UILabel isHighlighted](self, "isHighlighted"))
      {
        if ((*((_BYTE *)&self->_textLabelFlags + 4) & 8) == 0)
        {
          -[UILabel highlightedTextColor](self, "highlightedTextColor");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (v3)
            return v3;
        }
      }
      -[UILabel textColor](self, "textColor");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UILabel _disabledFontColor](self, "_disabledFontColor");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v3 = (void *)v4;
    if (!v4)
    {
LABEL_16:
      objc_msgSend((id)objc_opt_class(), "_defaultColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (BOOL)_hasFontInfoForVerticalBaselineSpacing
{
  return 1;
}

- (void)_commonInit
{
  objc_class *v3;
  UILabel *v4;
  void *v5;
  UILabel *v6;
  _UILabelLegacyImpl *v7;
  _UILabelImplProtocol *impl;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  _QWORD v14[5];

  if (self)
  {
    if (qword_1ECD792D8 != -1)
      dispatch_once(&qword_1ECD792D8, &__block_literal_global_648);
    v3 = (objc_class *)objc_opt_class();
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)(qword_1ECD792D0 != (_QWORD)class_getMethodImplementation(v3, sel__defaultAttributes)) << 29));
    v4 = self;
    +[_UILabelVisualStyle inferredVisualStyle](_UILabelVisualStyle, "inferredVisualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setVisualStyle:](v4, "_setVisualStyle:", v5);

    v6 = v4;
    v7 = objc_alloc_init(_UILabelLegacyImpl);
    impl = v6->__impl;
    v6->__impl = (_UILabelImplProtocol *)v7;

    if (dyld_program_sdk_at_least())
    {
      v9 = _UIBarsUseDynamicType();
      v10 = 0x8000000;
      if (!v9)
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFF7FFFFFFLL | v10);
    v6->_numberOfLines = 1;
    v11 = MEMORY[0x1E0C809B0];
    v6->_intrinsicSizeBaselineInfo.measuredNumberOfLines = -1;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __22__UILabel__commonInit__block_invoke_2;
    v14[3] = &unk_1E16B1B28;
    v14[4] = v6;
    if (dyld_program_sdk_at_least())
      +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v14);
    else
      __22__UILabel__commonInit__block_invoke_2((uint64_t)v14);
    *(_QWORD *)&self->_textLabelFlags &= ~0x80000uLL;
    v12 = dyld_program_sdk_at_least();
    v13 = 64;
    if (v12)
      v13 = 68;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFF8BLL | v13);
    -[UIView setContentsPosition:](v6, "setContentsPosition:", 3);
    if ((dyld_program_sdk_at_least() & 1) == 0)
      -[UIView setClipsToBounds:](v6, "setClipsToBounds:", 1);
    -[UILabel setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    if (dyld_program_sdk_at_least())
      -[UIView setClipsToBounds:](v6, "setClipsToBounds:", 0);
    UILabelCommonInit(v6);
  }
}

+ (Class)layerClass
{
  dyld_program_sdk_at_least();
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (_UILabelVisualStyle)_visualStyle
{
  return self->__visualStyle;
}

- (void)_setDrawsDebugGlyphPathBoundsClipping:(BOOL)a3
{
  uint64_t v4;
  objc_super v5;

  if (((((*(_QWORD *)&self->_textLabelFlags & 0x8000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x8000;
    if (!a3)
      v4 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFFFF7FFFLL | v4);
    if (a3)
      -[UIView _addGeometryChangeObserver:](self, self);
    else
      -[UIView _removeGeometryChangeObserver:](self, self);
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    -[UIView setNeedsDisplay](&v5, sel_setNeedsDisplay);
  }
}

- (void)_setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->__visualStyle, a3);
}

- (UILabel)initWithFrame:(CGRect)a3
{
  UILabel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UILabel;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UILabel _commonInit](v3, "_commonInit");
  return v3;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  if (-[UIView semanticContentAttribute](self, "semanticContentAttribute") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_, a3);
    -[UILabel _invalidateLabelDisplay](self);
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  if ((*((_BYTE *)&self->_textLabelFlags + 4) & 0x40) != 0)
  {
    -[UILabel _letterformAwareAllAlignmentInsets](self);
    v2 = v4 + 0.0;
    v3 = v5 + 0.0;
  }
  v6 = 0.0;
  v7 = 0.0;
  result.right = v3;
  result.bottom = v7;
  result.left = v2;
  result.top = v6;
  return result;
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UILabel;
  -[UIView _didChangeFromIdiom:onScreen:traverseHierarchy:](&v9, sel__didChangeFromIdiom_onScreen_traverseHierarchy_, a3, a4, a5);
  -[UIView _screen](self, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_userInterfaceIdiom");

  if (v8 != a3 && (a3 == 3 || v8 == 3))
    -[UILabel _accessibilityButtonShapesParametersDidChange](self, "_accessibilityButtonShapesParametersDidChange");
}

- (void)traitCollectionDidChange:(id)a3
{
  _QWORD *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  char v40;
  void *v41;
  CUIStyleEffectConfiguration *cuiStyleEffectConfiguration;
  id v43;
  id layout;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  objc_super v48;
  void (*v49)(uint64_t);
  void *v50;
  UILabel *v51;
  double v52;
  _QWORD v53[4];
  id v54;

  v47 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "displayScale");
  v6 = v5;
  objc_msgSend(v4, "displayScale");
  v8 = v7;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    if (v6 <= 0.0)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scale");

    }
    if (v8 <= 0.0)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scale");

    }
  }
  objc_msgSend(v4, "typesettingLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "typesettingLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
    -[UILabel _adjustFontForTypesettingLanguage](self);
  objc_msgSend(v4, "_typesettingLanguageAwareLineHeightRatio");
  v15 = v14;
  objc_msgSend(v47, "_typesettingLanguageAwareLineHeightRatio");
  if (self && v15 != v16)
  {
    -[UILabel _content](self, "_content");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _contentAdjustingFontForTypesettingLanguageAwareLineHeightRatio:didAdjustFont:](self, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setContent:adjustingFontForAccessibilityTraits:adjustingFontForTypesettingLanguage:adjustingFontForTypesettingLanguageAwareLineHeightRatio:checkingForDifferences:]((uint64_t)self, v18, 0, 0, 1, 1);

  }
  v19 = v47;
  if (v4 && (!v47 || v4[13] != v47[13] || v4[15] != v47[15]))
  {
    -[UILabel _adjustFontForAccessibilityTraits:](self, objc_msgSend(v4, "legibilityWeight") != objc_msgSend(v47, "legibilityWeight"));
    v19 = v47;
  }
  v20 = objc_msgSend(v19, "_backlightLuminance");
  if (v20 != objc_msgSend(v4, "_backlightLuminance"))
  {
    if (objc_msgSend(v4, "_backlightLuminance") == 1)
    {
      if (self)
      {
        -[UIView viewWithTag:](self, "viewWithTag:", 4032914800);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          -[UIView viewWithTag:](self, "viewWithTag:", 4032914800);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
            goto LABEL_25;
          v23 = v22;
          objc_msgSend(v22, "layer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "animationForKey:", CFSTR("UILabelMarqueeLayerContentOriginXAnimationKey"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = CACurrentMediaTime();
          objc_msgSend(v25, "beginTime");
          v28 = v26 - (v27 + 0.0 + 1.5);

          if (v28 >= 0.0)
          {
            +[_UIBacklightEnvironment _defaultAnimationDuration](_UIBacklightEnvironment, "_defaultAnimationDuration");
            v30 = v29 * 0.5;
            v31 = (void *)MEMORY[0x1E0C809B0];
            v53[0] = MEMORY[0x1E0C809B0];
            v53[1] = 3221225472;
            v53[2] = __35__UILabel__applyBacklightLuminance__block_invoke;
            v53[3] = &unk_1E16B1B28;
            v54 = v21;
            v48.receiver = v31;
            v48.super_class = (Class)3221225472;
            v49 = __35__UILabel__applyBacklightLuminance__block_invoke_2;
            v50 = &unk_1E16B7A60;
            v51 = self;
            v52 = v30;
            +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v53, &v48, v30);

          }
          else
          {
LABEL_25:
            -[UILabel _stopMarqueeWithRedisplay:](self, "_stopMarqueeWithRedisplay:", 1);
          }
        }

      }
    }
    else if (self)
    {
      -[UILabel _startMarqueeIfNecessary](self, "_startMarqueeIfNecessary");
    }
  }
  v32 = objc_msgSend(v4, "userInterfaceStyle");
  v33 = objc_msgSend(v47, "userInterfaceStyle");
  if (self && v32 != v33 && self->_cuiStyleEffectConfiguration)
  {
    -[UIView traitCollection](self, "traitCollection");
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[UITraitCollection _styleEffectAppearanceName](v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[CUIStyleEffectConfiguration appearanceName](self->_cuiStyleEffectConfiguration, "appearanceName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v35;
    v38 = v36;
    if (v37 == v38)
    {

    }
    else
    {
      v39 = v38;
      if (v37 && v38)
      {
        v40 = objc_msgSend(v37, "isEqual:", v38);

        if ((v40 & 1) != 0)
          goto LABEL_38;
      }
      else
      {

      }
      v41 = (void *)-[CUIStyleEffectConfiguration copy](self->_cuiStyleEffectConfiguration, "copy");
      objc_msgSend(v41, "setAppearanceName:", v37);
      cuiStyleEffectConfiguration = self->_cuiStyleEffectConfiguration;
      self->_cuiStyleEffectConfiguration = (CUIStyleEffectConfiguration *)v41;
      v43 = v41;

      layout = self->_layout;
      self->_layout = 0;

      v48.receiver = self;
      v48.super_class = (Class)UILabel;
      -[UIView setNeedsDisplay](&v48, sel_setNeedsDisplay);

    }
LABEL_38:

  }
  v45 = objc_msgSend(v4, "_userInterfaceRenderingMode");
  if (v45 != objc_msgSend(v47, "_userInterfaceRenderingMode")
    || (v46 = objc_msgSend(v4, "_vibrancy"), v46 != objc_msgSend(v47, "_vibrancy")))
  {
    -[UILabel _resolveMaterialColor:]((uint64_t)self, self->_lastSetColor);
  }

}

- (id)_contentAdjustingFontForTypesettingLanguage:(_BYTE *)a3 didAdjustFont:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  const __CTFont *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__234;
  v31 = __Block_byref_object_dispose__234;
  v5 = a2;
  v32 = v5;
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "_wantsContentAwareTypesettingLanguage")
    && objc_msgSend(v6, "length")
    && (v7 = (void *)CTFontCopyTallestTextStyleLanguageForString()) != 0)
  {
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(a1, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "typesettingLanguage");
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v10;
  }
  objc_msgSend((id)v28[5], "font");
  v11 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  -[UIFont _fontAdjustedForTypesettingLanguage:](v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (objc_msgSend(v5, "isAttributed"))
    {
      objc_msgSend(v5, "attributedString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend((id)v28[5], "length");
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __69__UILabel__contentAdjustingFontForTypesettingLanguage_didAdjustFont___block_invoke;
      v23[3] = &unk_1E16EA408;
      v24 = v8;
      v25 = &v27;
      v26 = a3;
      objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", 0, v14, 0x100000, v23);

    }
    objc_msgSend((id)v28[5], "font");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v12;
    v17 = v16;
    if (v15 == v16)
    {

    }
    else
    {
      if (v15)
      {
        v18 = objc_msgSend(v15, "isEqual:", v16);

        if ((v18 & 1) != 0)
          goto LABEL_19;
      }
      else
      {

      }
      objc_msgSend((id)v28[5], "contentByAddingAttribute:toDefaultAttributesWithValue:", *(_QWORD *)off_1E1678D90, v17);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v28[5];
      v28[5] = v19;

      if (a3)
        *a3 = 1;
    }
  }
LABEL_19:
  v21 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v21;
}

- (BOOL)_wantsContentAwareTypesettingLanguage
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 4) >> 4) & 1;
}

- (id)_contentAdjustingFontForTypesettingLanguageAwareLineHeightRatio:(_BYTE *)a3 didAdjustFont:
{
  id v5;
  void *v6;
  double v7;
  double v8;
  const __CTFont *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__234;
  v26 = __Block_byref_object_dispose__234;
  v5 = a2;
  v27 = v5;
  objc_msgSend(a1, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_typesettingLanguageAwareLineHeightRatio");
  v8 = v7;

  objc_msgSend((id)v23[5], "font");
  v9 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  -[UIFont _fontAdjustedForTypesettingLanguageAwareLineHeightRatio:](v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend(v5, "isAttributed"))
    {
      objc_msgSend(v5, "attributedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend((id)v23[5], "length");
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __89__UILabel__contentAdjustingFontForTypesettingLanguageAwareLineHeightRatio_didAdjustFont___block_invoke;
      v21[3] = &unk_1E16EA430;
      *(double *)&v21[5] = v8;
      v21[4] = &v22;
      v21[6] = a3;
      objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0x100000, v21);

    }
    objc_msgSend((id)v23[5], "font");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v10;
    v15 = v14;
    if (v13 == v14)
    {

    }
    else
    {
      if (v13)
      {
        v16 = objc_msgSend(v13, "isEqual:", v14);

        if ((v16 & 1) != 0)
          goto LABEL_12;
      }
      else
      {

      }
      objc_msgSend((id)v23[5], "contentByAddingAttribute:toDefaultAttributesWithValue:", *(_QWORD *)off_1E1678D90, v15);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v23[5];
      v23[5] = v17;

      if (a3)
        *a3 = 1;
    }
  }
LABEL_12:
  v19 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v19;
}

- (void)_adjustFontForTypesettingLanguage
{
  void *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(a1, "_content");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel _contentAdjustingFontForTypesettingLanguage:didAdjustFont:](a1, v3, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setContent:adjustingFontForAccessibilityTraits:adjustingFontForTypesettingLanguage:adjustingFontForTypesettingLanguageAwareLineHeightRatio:checkingForDifferences:]((uint64_t)a1, v2, 0, 0, 0, 1);

  }
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UILabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)set_fontForShortcutBaselineCalculation:(id)a3
{
  UIFont **p_fontForShortcutBaselineCalculation;
  id v6;

  p_fontForShortcutBaselineCalculation = &self->_fontForShortcutBaselineCalculation;
  v6 = a3;
  if (!objc_msgSend(v6, "isEqual:", *p_fontForShortcutBaselineCalculation)
    || !v6 && *p_fontForShortcutBaselineCalculation)
  {
    objc_storeStrong((id *)&self->_fontForShortcutBaselineCalculation, a3);
    -[UILabel _invalidateBaselineConstraints](self, "_invalidateBaselineConstraints");
  }

}

- (void)setAdjustsLetterSpacingToFitWidth:(BOOL)adjustsLetterSpacingToFitWidth
{
  uint64_t v4;
  objc_super v5;

  if (((((*(_QWORD *)&self->_textLabelFlags & 8) == 0) ^ adjustsLetterSpacingToFitWidth) & 1) == 0)
  {
    v4 = 8;
    if (!adjustsLetterSpacingToFitWidth)
      v4 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFFF7 | v4);
    -[UILabel _invalidateLabelSize](self, "_invalidateLabelSize");
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    -[UIView setNeedsDisplay](&v5, sel_setNeedsDisplay);
  }
}

- (void)_drawWithString:(uint64_t)a3 rect:(void *)a4 options:(void *)a5 attributes:(double)a6 context:(double)a7
{
  id v17;
  id v18;
  void *v19;
  id v20;

  v20 = a2;
  v17 = a4;
  v18 = a5;
  if ((a1[748] & 0x80) != 0)
  {
    -[UILabel _verticalTextLayoutManager](a1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "drawWithString:rect:options:attributes:context:", v20, a3, v17, v18, a6, a7, a8, a9);

  }
  else
  {
    objc_msgSend(v20, "drawWithRect:options:attributes:context:", a3, v17, v18, a6, a7, a8, a9);
  }

}

- (void)_setTextAlignment:(int64_t)a3
{
  void *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  *(_QWORD *)&self->_textLabelFlags |= 0x80uLL;
  -[UILabel _content](self, "_content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paragraphStyle");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "alignment") != a3)
  {
    v6 = self;
    v7 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v7, "setAlignment:", a3);
    -[UILabel _content](v6, "_content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentByApplyingAttributeToEntireRange:value:", *(_QWORD *)off_1E1678F98, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setContent:](v6, "_setContent:", v9);

    -[UILabel _invalidateLabelSize](v6, "_invalidateLabelSize");
  }

}

- (id)_contentAdjustingFontForAccessibilityTraits:(char)a3 forced:(_BYTE *)a4 didAdjustFont:
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a2;
  v8 = v7;
  if ((a1[748] & 2) != 0 || (a3 & 1) != 0)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__234;
    v31 = __Block_byref_object_dispose__234;
    v10 = v7;
    v32 = v10;
    objc_msgSend(a1, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (objc_msgSend(v10, "isAttributed"))
      {
        objc_msgSend(v10, "attributedString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend((id)v28[5], "length");
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __76__UILabel__contentAdjustingFontForAccessibilityTraits_forced_didAdjustFont___block_invoke;
        v23[3] = &unk_1E16EA408;
        v24 = v11;
        v25 = &v27;
        v26 = a4;
        objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v15, 0x100000, v23);

      }
      objc_msgSend((id)v28[5], "font");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v13;
      v18 = v17;
      if (v16 != v17)
      {
        if (v16)
        {
          v19 = objc_msgSend(v16, "isEqual:", v17);

          if ((v19 & 1) != 0)
            goto LABEL_15;
        }
        else
        {

        }
        objc_msgSend((id)v28[5], "contentByAddingAttribute:toDefaultAttributesWithValue:", *(_QWORD *)off_1E1678D90, v18);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v28[5];
        v28[5] = v20;

        if (a4)
          *a4 = 1;
        goto LABEL_15;
      }

    }
LABEL_15:
    v9 = (id)v28[5];

    _Block_object_dispose(&v27, 8);
    goto LABEL_16;
  }
  v9 = v7;
LABEL_16:

  return v9;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  uint64_t v4;

  textLabelFlags = self->_textLabelFlags;
  if (((((*(_QWORD *)&textLabelFlags & 0x200000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x200000000;
    if (!a3)
      v4 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&textLabelFlags & 0xFFFFFFFDFFFFFFFFLL | v4);
    -[UILabel _adjustFontForAccessibilityTraits:](self, 0);
  }
}

- (void)_adjustFontForAccessibilityTraits:(_BYTE *)a1
{
  void *v4;
  id v5;

  if (a1)
  {
    objc_msgSend(a1, "_content");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel _contentAdjustingFontForAccessibilityTraits:forced:didAdjustFont:](a1, v5, a2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setContent:adjustingFontForAccessibilityTraits:adjustingFontForTypesettingLanguage:adjustingFontForTypesettingLanguageAwareLineHeightRatio:checkingForDifferences:]((uint64_t)a1, v4, 0, 0, 0, 1);

  }
}

- (void)setHighlighted:(BOOL)highlighted
{
  if (((((*(_QWORD *)&self->_textLabelFlags & 1) == 0) ^ highlighted) & 1) == 0)
  {
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFFFELL | highlighted);
    -[UILabel _invalidateLabelDisplay](self);
  }
}

- (void)setEnabled:(BOOL)enabled
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = enabled;
  if (-[UILabel isEnabled](self, "isEnabled") != enabled)
  {
    v5 = 64;
    if (!v3)
      v5 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFFBFLL | v5);
    -[UILabel _invalidateLabelDisplay](self);
  }
}

- (void)setBaselineAdjustment:(UIBaselineAdjustment)baselineAdjustment
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  id layout;
  objc_super v6;

  textLabelFlags = self->_textLabelFlags;
  if (((*(unint64_t *)&textLabelFlags >> 4) & 3) != baselineAdjustment)
  {
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&textLabelFlags & 0xFFFFFFFFFFFFFFCFLL | (16 * (baselineAdjustment & 3)));
    v6.receiver = self;
    v6.super_class = (Class)UILabel;
    -[UIView setNeedsDisplay](&v6, sel_setNeedsDisplay);
    layout = self->_layout;
    self->_layout = 0;

    if ((dyld_program_sdk_at_least() & 1) == 0)
      -[UILabel _invalidateLabelSize](self, "_invalidateLabelSize");
  }
}

- (void)_setWantsUnderlineForAccessibilityButtonShapesEnabled:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  uint64_t v4;

  textLabelFlags = self->_textLabelFlags;
  if (((((*(_QWORD *)&textLabelFlags & 0x40000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x40000;
    if (!a3)
      v4 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&textLabelFlags & 0xFFFFFFFFFFFBFFFFLL | v4);
    -[UILabel _accessibilityButtonShapesParametersDidChange](self, "_accessibilityButtonShapesParametersDidChange");
  }
}

- (void)_setSupportMultiLineShrinkToFit:(uint64_t)a1
{
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v3 = 4;
    if (!a2)
      v3 = 0;
    *(_QWORD *)(a1 + 744) = *(_QWORD *)(a1 + 744) & 0xFFFFFFFFFFFFFFFBLL | v3;
    v4 = *(void **)(a1 + 616);
    *(_QWORD *)(a1 + 616) = 0;

    *(_OWORD *)(a1 + 624) = *MEMORY[0x1E0C9D820];
    -[UILabel _invalidateLabelMetrics](a1);
  }
}

- (void)_accessibilityButtonShapesParametersDidChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[UILabel _defaultAttributes](self, "_defaultAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "mutableCopy");

  v4 = *(_QWORD *)off_1E1679240;
  objc_msgSend(v7, "objectForKey:", *(_QWORD *)off_1E1679240);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self
    && _AXSButtonShapesEnabled()
    && objc_msgSend(-[UIView _screen](self, "_screen"), "_userInterfaceIdiom") != 3)
  {
    v6 = v7;
    if ((v5 != 0) != (*((_BYTE *)&self->_textLabelFlags + 2) & 4) >> 2)
    {
      if (!v5)
      {
        objc_msgSend(v7, "setObject:forKey:", &unk_1E1A9ADA0, v4);
        goto LABEL_6;
      }
LABEL_5:
      objc_msgSend(v6, "removeObjectForKey:", v4);
LABEL_6:
      -[UILabel _setDefaultAttributes:](self, "_setDefaultAttributes:", v7);

      return;
    }
  }
  else
  {
    v6 = v7;
    if (v5)
      goto LABEL_5;
  }

}

- (void)setShadowOffset:(CGSize)shadowOffset
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  id v10;

  height = shadowOffset.height;
  width = shadowOffset.width;
  -[UILabel _shadow](self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "copy");

  objc_msgSend(v10, "shadowOffset");
  v9 = v8 == width && v7 == height;
  if (!v9 || dyld_program_sdk_at_least())
  {
    objc_msgSend(v10, "setShadowOffset:", width, height);
    -[UILabel _setShadow:](self, v10);
  }

}

- (void)setShadowColor:(UIColor *)shadowColor
{
  void *v4;
  void *v5;
  UIColor *v6;
  char v7;
  UIColor *v8;

  v8 = shadowColor;
  -[UILabel _shadow](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "shadowColor");
  v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
  if (v6 != v8)
  {

LABEL_4:
    objc_msgSend(v5, "setShadowColor:", v8);
    -[UILabel _setShadow:](self, v5);
    goto LABEL_5;
  }
  v7 = dyld_program_sdk_at_least();

  if ((v7 & 1) != 0)
    goto LABEL_4;
LABEL_5:

}

- (void)_setShadow:(void *)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "_content");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentByApplyingAttributeToEntireRange:value:", *(_QWORD *)off_1E1679048, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_setContent:", v4);
  }
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)allowsDefaultTighteningForTruncation
{
  -[UILabel _setAllowsDefaultTighteningForTruncation:](self, allowsDefaultTighteningForTruncation);
}

- (void)_setAllowsDefaultTighteningForTruncation:(void *)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a1)
  {
    objc_msgSend(a1, "_content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paragraphStyle");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "allowsDefaultTighteningForTruncation") != (_DWORD)a2)
    {
      v5 = a1;
      v6 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v6, "setAllowsDefaultTighteningForTruncation:", a2);
      objc_msgSend(v5, "_content");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentByApplyingAttributeToEntireRange:value:", *(_QWORD *)off_1E1678F98, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setContent:", v8);

      objc_msgSend(v5, "_invalidateLabelSize");
    }

  }
}

- (void)_setDefaultAttributes:(id)a3
{
  _UILabelContent *v4;
  void *v5;
  void *v6;
  UIColor *v7;
  UIColor *lastSetColor;
  UIColor *v9;
  UIColor *v10;
  id v11;

  v11 = a3;
  v4 = self->_content;
  -[UILabel _content](self, "_content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentWithDefaultAttributes:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel _setContent:](self, "_setContent:", v6);

  if (v4 != self->_content)
  {
    -[UILabel _noteInstanceCustomizationForAttributedString:attributes:](self, 0, v11);
    if (-[_UILabelContent isAttribute:uniformlyEqualToValue:](self->_content, "isAttribute:uniformlyEqualToValue:", *(_QWORD *)off_1E1678D98, 0))
    {
      -[UILabel textColor](self, "textColor");
      v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
      lastSetColor = self->_lastSetColor;
      self->_lastSetColor = v7;
      v9 = v7;

      -[UILabel _resolveMaterialColor:]((uint64_t)self, v9);
    }
    else
    {
      v10 = self->_lastSetColor;
      self->_lastSetColor = 0;

      -[UIView mt_setContentEffects:](self, "mt_setContentEffects:", 0);
      v9 = 0;
    }

  }
}

- (CGSize)textSize
{
  void *v3;
  void *v4;
  CGSize *p_size;
  void *v6;
  uint64_t v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  uint64_t v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat width;
  CGFloat height;
  double v17;
  double v18;
  CGSize result;

  -[UILabel _content](self, "_content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  p_size = &self->_size;
  if (self->_size.width == 0.0 && self->_size.height == 0.0 && objc_msgSend(v3, "length") >= 1)
  {
    if (objc_msgSend(v4, "isAttributed"))
    {
      -[UILabel _synthesizedAttributedText](self, "_synthesizedAttributedText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[UILabel _stringDrawingOptions](self, "_stringDrawingOptions");
      -[UILabel _stringDrawingContext](self, "_stringDrawingContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _boundingRectWithAttributedString:size:options:context:](self, v6, v7, v8, 3.40282347e38, 3.40282347e38);
      p_size->width = v9;
      self->_size.height = v10;
    }
    else
    {
      objc_msgSend(v4, "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[UILabel _stringDrawingOptions](self, "_stringDrawingOptions");
      -[UILabel _defaultAttributes](self, "_defaultAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _stringDrawingContext](self, "_stringDrawingContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel _boundingRectWithString:size:options:attributes:context:](self, v6, v11, v8, v12, 3.40282347e38, 3.40282347e38);
      p_size->width = v13;
      self->_size.height = v14;

    }
  }
  width = p_size->width;
  height = self->_size.height;

  v17 = width;
  v18 = height;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  NSMutableDictionary *marqueeMaskAnimations;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *marqueeAnimations;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  NSMutableDictionary *obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)UILabel;
  -[UIView _didMoveFromWindow:toWindow:](&v43, sel__didMoveFromWindow_toWindow_, v6, v7);
  if (v7)
  {
    if ((*((_BYTE *)&self->_textLabelFlags + 1) & 0x80) != 0)
    {
      -[UIView _removeGeometryChangeObserver:](self, self);
      -[UIView _addGeometryChangeObserver:](self, self);
      v44.receiver = self;
      v44.super_class = (Class)UILabel;
      -[UIView setNeedsDisplay](&v44, sel_setNeedsDisplay);
    }
    -[UILabel _updateVariableLengthStringIfNeeded](self);
    if ((*((_BYTE *)&self->_textLabelFlags + 1) & 2) != 0)
    {
      -[UIView viewWithTag:](self, "viewWithTag:", 4032914800);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v32 = v7;
        v33 = v6;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v9 = self->_marqueeAnimations;
        v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v40 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_msgSend(v8, "layer");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](self->_marqueeAnimations, "objectForKeyedSubscript:", v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addAnimation:forKey:", v16, v14);

            }
            v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
          }
          while (v11);
        }

        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        marqueeMaskAnimations = self->_marqueeMaskAnimations;
        v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](marqueeMaskAnimations, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v36;
          obj = marqueeMaskAnimations;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v36 != v20)
                objc_enumerationMutation(obj);
              v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
              objc_msgSend(v8, "layer");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "mask");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](self->_marqueeMaskAnimations, "objectForKeyedSubscript:", v22);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addAnimation:forKey:", v25, v22);

            }
            marqueeMaskAnimations = obj;
            v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          }
          while (v19);
        }
        v7 = v32;
        v6 = v33;
      }
      else
      {
        marqueeAnimations = self->_marqueeAnimations;
        self->_marqueeAnimations = 0;

        marqueeMaskAnimations = self->_marqueeMaskAnimations;
        self->_marqueeMaskAnimations = 0;
      }

    }
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(v7, "traitCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "userInterfaceIdiom");
      objc_msgSend(v6, "traitCollection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 == objc_msgSend(v29, "userInterfaceIdiom"))
      {

      }
      else
      {
        objc_msgSend(v7, "traitCollection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "userInterfaceIdiom");

        if (v31 == 3)
          -[UILabel _adjustFontForAccessibilityTraits:](self, 1);
      }
    }
  }
  else
  {
    -[UIView _removeGeometryChangeObserver:](self, self);
    if ((*((_BYTE *)&self->_textLabelFlags + 1) & 0x80) != 0)
    {
      v44.receiver = self;
      v44.super_class = (Class)UILabel;
      -[UIView setNeedsDisplay](&v44, sel_setNeedsDisplay);
    }
  }

}

- (void)_setText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[UILabel _content](self, "_content");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "widthVariantContentForView:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel _setContent:](self, "_setContent:", v6);

}

- (void)_updateVariableLengthStringIfNeeded
{
  void *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(a1, "_content");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "widthVariantContentForView:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setContent:", v2);

  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height;
  double width;
  int has_internal_diagnostics;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  UIFont *fontForShortcutBaselineCalculation;
  UIFont *v13;
  UIFont *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  _QWORD v29[2];
  uint8_t buf[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint8_t v36[4];
  UILabel *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;
  NSSize v41;
  NSSize v42;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  height = a3.height;
  width = a3.width;
  v40 = *MEMORY[0x1E0C80C00];
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  -[UILabel alignmentRectInsets](self, "alignmentRectInsets");
  v10 = v9 == 0.0;
  if (v11 != 0.0)
    v10 = 0;
  if (v8 != 0.0)
    v10 = 0;
  if (v7 != 0.0)
    v10 = 0;
  if (has_internal_diagnostics)
  {
    if (!v10)
    {
      __UIFaultDebugAssertLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "Text Field not expected to have alignmnetRectInsets.", buf, 2u);
      }

    }
  }
  else if (!v10)
  {
    v23 = qword_1ECD792F8;
    if (!qword_1ECD792F8)
    {
      v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v23, (unint64_t *)&qword_1ECD792F8);
    }
    v24 = *(NSObject **)(v23 + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Text Field not expected to have alignmnetRectInsets.", buf, 2u);
    }
  }
  fontForShortcutBaselineCalculation = self->_fontForShortcutBaselineCalculation;
  if (fontForShortcutBaselineCalculation || -[_UILabelContent isAttributed](self->_content, "isAttributed"))
  {
    v13 = fontForShortcutBaselineCalculation;
  }
  else
  {
    -[UILabel font](self, "font");
    v13 = (UIFont *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  if (!v13)
  {
    -[UILabel sizeThatFits:](self, "sizeThatFits:", width, height);
    v35 = 0;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    *(_OWORD *)buf = 0u;
    v29[0] = 0;
    v29[1] = 0;
    v19 = -[_UITextSizeCache getSize:baselineInfo:forTargetSize:isMultiline:](self->_intrinsicContentSizeCache, "getSize:baselineInfo:forTargetSize:isMultiline:", v29, buf, -[UILabel numberOfLines](self, "numberOfLines", 0, 0) != 1, width, height);
    if (os_variant_has_internal_diagnostics())
    {
      if (v19)
      {
LABEL_16:
        v16 = *(double *)buf;
        v18 = height - *(double *)&buf[8];
        goto LABEL_17;
      }
      __UIFaultDebugAssertLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
LABEL_35:

        goto LABEL_16;
      }
      v41.width = width;
      v41.height = height;
      NSStringFromSize(v41);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v36 = 138412546;
      v37 = self;
      v38 = 2112;
      v39 = v26;
      _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "UIKit bug. Failed baseline lookup for %@ at %@", v36, 0x16u);
    }
    else
    {
      if (v19)
        goto LABEL_16;
      v27 = qword_1ECD79300;
      if (!qword_1ECD79300)
      {
        v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v27, (unint64_t *)&qword_1ECD79300);
      }
      v28 = *(NSObject **)(v27 + 8);
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v25 = v28;
      v42.width = width;
      v42.height = height;
      NSStringFromSize(v42);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v36 = 138412546;
      v37 = self;
      v38 = 2112;
      v39 = v26;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "UIKit bug. Failed baseline lookup for %@ at %@", v36, 0x16u);
    }

    goto LABEL_35;
  }
  -[UIFont lineHeight](v13, "lineHeight");
  -[UIFont descender](v14, "descender");
  UIRoundToViewScale(self);
  v16 = v15;
  -[UIFont lineHeight](v14, "lineHeight");
  UICeilToViewScale(self);
  v18 = v17 - v16;
LABEL_17:

  v20 = v16;
  v21 = v18;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (void)setNumberOfLines:(NSInteger)numberOfLines
{
  int v5;
  objc_super v6;

  if (self->_numberOfLines != numberOfLines)
  {
    v5 = -[UILabel _needsDoubleUpdateConstraintsPass](self, "_needsDoubleUpdateConstraintsPass");
    self->_numberOfLines = numberOfLines;
    -[UILabel _invalidateLabelSize](self, "_invalidateLabelSize");
    v6.receiver = self;
    v6.super_class = (Class)UILabel;
    -[UIView setNeedsDisplay](&v6, sel_setNeedsDisplay);
    -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v5);
    -[UILabel setMarqueeEnabled:](self, "setMarqueeEnabled:", (*(_QWORD *)&self->_textLabelFlags >> 8) & 1);
    -[UILabel _runMarqueeIfEnabledAndAncestorIsFocused](self);
  }
}

- (void)setMarqueeEnabled:(BOOL)a3
{
  NSInteger v4;
  void *v5;
  uint64_t v6;
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  objc_super v8;

  if (!a3)
  {
    textLabelFlags = self->_textLabelFlags;
    if ((*(_WORD *)&textLabelFlags & 0x200) == 0)
      return;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&textLabelFlags & 0xFFFFFFFFFFFFFDFFLL);
    goto LABEL_7;
  }
  v4 = -[UILabel numberOfLines](self, "numberOfLines");
  if ((v4 == 1) != ((*(_QWORD *)&self->_textLabelFlags & 0x200) == 0))
    return;
  self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)(v4 == 1) << 9));
  if (v4 != 1)
  {
LABEL_7:
    -[UILabel setMarqueeRunning:](self, "setMarqueeRunning:", 0);
    v6 = 0;
    goto LABEL_8;
  }
  -[UILabel setLineBreakMode:](self, "setLineBreakMode:", 2);
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpaque:", 0);

  v6 = 1;
LABEL_8:
  v8.receiver = self;
  v8.super_class = (Class)UILabel;
  -[UIView setNeedsDisplay](&v8, sel_setNeedsDisplay);
  -[UIView _setTracksFocusedAncestors:](self, "_setTracksFocusedAncestors:", v6);
}

- (void)_runMarqueeIfEnabledAndAncestorIsFocused
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    objc_msgSend(a1, "_focusSystem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_focusedView");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = objc_msgSend(a1, "isDescendantOfView:", v6);
    v4 = (void *)v6;
    if (v3)
    {
      if (v6)
        v5 = objc_msgSend(a1, "_tracksFocusedAncestors");
      else
        v5 = 0;
      objc_msgSend(a1, "setMarqueeRunning:", v5);
      v4 = (void *)v6;
    }

  }
}

- (UIEdgeInsets)_contentInsetsFromFonts
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  -[UILabel _content](self, "_content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if ((objc_msgSend(v3, "isNil") & 1) != 0)
  {
    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
  }
  else
  {
    objc_msgSend(v3, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UILabel _tooBigChars]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v9);

    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v3, "isAttributed"))
      {
        objc_msgSend(v3, "attributedString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "defaultAttributes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v11, v13, self);
        v6 = v14;
        v5 = v15;
        v4 = v16;

      }
      else
      {
        objc_msgSend(v3, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel font](self, "font");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = +[UILabel _insetsForString:withFont:inView:]((uint64_t)UILabel, v17, v12, self);
        v6 = v18;
        v5 = v19;
        v4 = v20;
      }

    }
  }

  v21 = v7;
  v22 = v6;
  v23 = v5;
  v24 = v4;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

+ (id)_tooBigChars
{
  objc_opt_self();
  if (qword_1ECD792F0 != -1)
    dispatch_once(&qword_1ECD792F0, &__block_literal_global_224_1);
  return (id)qword_1ECD792E8;
}

+ (double)_insetsForString:(void *)a3 withFont:(void *)a4 inView:
{
  id v5;
  id v6;
  double v7;
  double v9;

  v5 = a4;
  v6 = a3;
  objc_opt_self();
  CTFontGetLanguageAwareOutsets();

  UICeilToViewScale(v5);
  v9 = -v7;
  UICeilToViewScale(v5);
  UICeilToViewScale(v5);
  UICeilToViewScale(v5);

  return v9;
}

+ (double)_insetsForAttributedString:(void *)a3 withDefaultFont:(void *)a4 inView:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t i;
  double v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = a2;
  objc_opt_self();
  +[_NSAttributedStringIntentResolver attributedStringByResolvingString:](_UIAttributedStringIntentResolver, "attributedStringByResolvingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSAttributedString _ui_fontsInRange:usingDefaultFont:](v9, 0, objc_msgSend(v9, "length"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    objc_msgSend(v10, "setByAddingObject:", v6);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    v17 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
    v20 = 0.0;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        if (CTFontGetLanguageAwareOutsets())
        {
          v20 = fmax(0.0, v20);
          v18 = fmax(0.0, v18);
          v19 = fmax(0.0, v19);
          v17 = fmax(0.0, v17);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

  UICeilToViewScale(v7);
  v23 = v22;
  UICeilToViewScale(v7);
  UICeilToViewScale(v7);
  UICeilToViewScale(v7);

  return -v23;
}

- (void)layerWillDraw:(id)a3
{
  objc_super v3;

  *(_QWORD *)&self->_textLabelFlags &= ~0x1000000uLL;
  v3.receiver = self;
  v3.super_class = (Class)UILabel;
  -[UIView layerWillDraw:](&v3, sel_layerWillDraw_, a3);
}

- (void)_setLineBreakStrategy:(unint64_t)a3
{
  void *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UILabel _content](self, "_content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paragraphStyle");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "lineBreakStrategy") != a3)
  {
    v6 = self;
    v7 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v7, "setLineBreakStrategy:", a3);
    -[UILabel _content](v6, "_content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentByApplyingAttributeToEntireRange:value:", *(_QWORD *)off_1E1678F98, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setContent:](v6, "_setContent:", v9);

    -[UILabel _invalidateLabelSize](v6, "_invalidateLabelSize");
  }

}

- (NSLineBreakStrategy)lineBreakStrategy
{
  void *v2;
  void *v3;
  NSLineBreakStrategy v4;

  -[UILabel _content](self, "_content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paragraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lineBreakStrategy");

  return v4;
}

- (double)_multilineContextWidth
{
  return self->_multilineContextWidth;
}

- (void)_setUseShortcutIntrinsicContentSize:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (void)_drawWithAttributedString:(uint64_t)a3 rect:(void *)a4 options:(double)a5 context:(double)a6
{
  id v15;
  void *v16;
  id v17;

  v17 = a2;
  v15 = a4;
  if ((a1[748] & 0x80) != 0)
  {
    -[UILabel _verticalTextLayoutManager](a1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "drawWithAttributedString:rect:options:context:", v17, a3, v15, a5, a6, a7, a8);

  }
  else
  {
    objc_msgSend(v17, "drawWithRect:options:context:", a3, v15, a5, a6, a7, a8);
  }

}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  unint64_t v4;
  _UILabelLegacyScaledMetrics *scaledMetrics;
  id layout;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  textLabelFlags = self->_textLabelFlags;
  v4 = 2;
  if (!adjustsFontSizeToFitWidth)
    v4 = 0;
  self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&textLabelFlags & 0xFFFFFFFFFFFFFFFDLL | v4);
  if ((v4 >> 1) != ((*(unint64_t *)&textLabelFlags >> 1) & 1))
  {
    if ((*(_BYTE *)&textLabelFlags & 2) == 0)
    {
      scaledMetrics = self->_scaledMetrics;
      self->_scaledMetrics = 0;

      self->_scaledMetricsTargetSize = (CGSize)*MEMORY[0x1E0C9D820];
      layout = self->_layout;
      self->_layout = 0;

LABEL_10:
      -[UILabel _invalidateLabelSize](self, "_invalidateLabelSize");
      v13.receiver = self;
      v13.super_class = (Class)UILabel;
      -[UIView setNeedsDisplay](&v13, sel_setNeedsDisplay);
      return;
    }
    -[UIView window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else if (!self->_scaledMetrics)
    {
      return;
    }
    -[UIView bounds](self, "bounds");
    if (-[UILabel _updateScaledMetricsForRect:]((uint64_t)self, v9, v10, v11, v12))
      goto LABEL_10;
  }
}

- (void)setMinimumScaleFactor:(CGFloat)minimumScaleFactor
{
  if (self)
    -[_UILabelImplProtocol setMinimumScaleFactor:](self->__impl, "setMinimumScaleFactor:", minimumScaleFactor);
  self->_minimumFontSize = 0.0;
}

uint64_t __48__UILabel__synthesizedAttributedTextForContent___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *(_QWORD *)off_1E1678D98, a3, a4);
  return result;
}

- (void)_setOverallWritingDirectionFollowsLayoutDirection:(BOOL)a3
{
  uint64_t v3;

  if (((((*(_QWORD *)&self->_textLabelFlags & 0x2000000) == 0) ^ a3) & 1) == 0)
  {
    v3 = 0x2000000;
    if (!a3)
      v3 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFDFFFFFFLL | v3);
    -[UILabel _invalidateLabelDisplay](self);
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_accessibilityButtonShapesChangedToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_removeObserver:", self->_accessibilityButtonShapesChangedToken);

    self->_accessibilityButtonShapesChangedToken = 0;
  }
  -[UILabel _visualStyle](self, "_visualStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionsForDeallocationOfLabel:", self);

  v5.receiver = self;
  v5.super_class = (Class)UILabel;
  -[UIView dealloc](&v5, sel_dealloc);
}

uint64_t __49__UILabel__invalidateAsNeededForNewSize_oldSize___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setLabelMasksToBoundsForAnimation:", *(unsigned __int8 *)(a1 + 48));
  if (*(_BYTE *)(a1 + 49))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

uint64_t __49__UILabel__invalidateAsNeededForNewSize_oldSize___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_intrinsicSizeWithinSize:");
}

- (void)_setMinimumFontSize:(double)a3
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  if (self->_minimumFontSize != a3)
  {
    -[UILabel font](self, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pointSize");
    if (v6 > 0.0)
      -[UILabel font](self, "font");
    else
      objc_msgSend((id)objc_opt_class(), "defaultFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointSize");
    v9 = v8;

    v10 = a3 / v9;
    if (v9 == 0.0)
      v10 = 0.0;
    -[_UILabelImplProtocol setMinimumScaleFactor:](self->__impl, "setMinimumScaleFactor:", v10);
    self->_minimumFontSize = a3;
    -[UILabel _invalidateLabelSize](self, "_invalidateLabelSize");
    v11.receiver = self;
    v11.super_class = (Class)UILabel;
    -[UIView setNeedsDisplay](&v11, sel_setNeedsDisplay);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__configuration, 0);
  objc_storeStrong((id *)&self->__impl, 0);
  objc_storeStrong((id *)&self->__visualStyle, 0);
  objc_storeStrong((id *)&self->_fontForShortcutBaselineCalculation, 0);
  objc_storeStrong((id *)&self->_lightContainerView, 0);
  objc_storeStrong((id *)&self->_lightSourceDescriptor, 0);
  objc_storeStrong((id *)&self->_lastSetColor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_marqueeMaskAnimations, 0);
  objc_storeStrong((id *)&self->_marqueeAnimations, 0);
  objc_storeStrong((id *)&self->_cuiStyleEffectConfiguration, 0);
  objc_storeStrong((id *)&self->_textEncapsulation, 0);
  objc_storeStrong((id *)&self->_cuiCatalog, 0);
  objc_storeStrong((id *)&self->_intrinsicContentSizeCache, 0);
  objc_storeStrong((id *)&self->_scaledMetrics, 0);
  objc_storeStrong(&self->_layout, 0);
  objc_storeStrong((id *)&self->_fallbackColorsForUserInterfaceStyle, 0);
  objc_storeStrong((id *)&self->_cachedSynthesizedTextAttributes, 0);
  objc_storeStrong((id *)&self->_synthesizedAttributedText, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_highlightedColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)_setTextAlignmentFollowsWritingDirection:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  uint64_t v4;
  objc_super v5;

  textLabelFlags = self->_textLabelFlags;
  if (((((*(_QWORD *)&textLabelFlags & 0x100000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x100000;
    if (!a3)
      v4 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&textLabelFlags & 0xFFFFFFFFFFEFFFFFLL | v4);
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    -[UIView setNeedsDisplay](&v5, sel_setNeedsDisplay);
  }
}

uint64_t __59__UILabel_UILabel_ModernUISupport___capOffsetFromBoundsTop__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t result;
  double v5;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "capHeight");
  if (v3 >= v5)
    v5 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

void __76__UILabel__contentAdjustingFontForAccessibilityTraits_forced_didAdjustFont___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BYTE *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v10, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", a1[4]);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13 && (objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "contentByApplyingAttribute:value:toRange:", *(_QWORD *)off_1E1678D90, v12, a3, a4);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1[5] + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v17 = (_BYTE *)a1[6];
    if (v17)
      *v17 = 1;
  }

}

- (void)_setCuiStyleEffectConfiguration:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  CUIStyleEffectConfiguration *cuiStyleEffectConfiguration;
  id layout;
  objc_super v10;

  if (self->_cuiStyleEffectConfiguration != a3)
  {
    v4 = (id)objc_msgSend(a3, "copy");
    if (!v4)
    {
      if (dyld_program_sdk_at_least())
        v4 = objc_alloc_init(MEMORY[0x1E0D1A6E8]);
      else
        v4 = 0;
    }
    objc_msgSend(v4, "appearanceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[UIView traitCollection](self, "traitCollection");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[UITraitCollection _styleEffectAppearanceName](v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAppearanceName:", v7);

    }
    cuiStyleEffectConfiguration = self->_cuiStyleEffectConfiguration;
    self->_cuiStyleEffectConfiguration = (CUIStyleEffectConfiguration *)v4;

    layout = self->_layout;
    self->_layout = 0;

    v10.receiver = self;
    v10.super_class = (Class)UILabel;
    -[UIView setNeedsDisplay](&v10, sel_setNeedsDisplay);
  }
}

- (void)_setCuiCatalog:(id)a3
{
  CUICatalog *v5;
  id layout;
  CUICatalog *v7;
  objc_super v8;

  v5 = (CUICatalog *)a3;
  if (self->_cuiCatalog != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_cuiCatalog, a3);
    layout = self->_layout;
    self->_layout = 0;

    v8.receiver = self;
    v8.super_class = (Class)UILabel;
    -[UIView setNeedsDisplay](&v8, sel_setNeedsDisplay);
    v5 = v7;
  }

}

void __89__UILabel__contentAdjustingFontForTypesettingLanguageAwareLineHeightRatio_didAdjustFont___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  const __CTFont *v9;
  const __CTFont *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BYTE *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v9 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  -[UIFont _fontAdjustedForTypesettingLanguageAwareLineHeightRatio:](v10, *(double *)(a1 + 40));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13 && (-[__CTFont isEqual:](v10, "isEqual:", v11) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "contentByApplyingAttribute:value:toRange:", *(_QWORD *)off_1E1678D90, v12, a3, a4);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v17 = *(_BYTE **)(a1 + 48);
    if (v17)
      *v17 = 1;
  }

}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6
{
  double result;
  objc_super v8;

  if ((a3 - 5) > 1)
  {
    v8.receiver = self;
    v8.super_class = (Class)UILabel;
    -[UIView _autolayoutSpacingAtEdge:forAttribute:inContainer:isGuide:](&v8, sel__autolayoutSpacingAtEdge_forAttribute_inContainer_isGuide_, *(_QWORD *)&a3, a4, a5, a6);
  }
  else
  {
    _UIViewBaselineToEdgeSpacing(-[UILabel _fontInfoForBaselineSpacing](self, "_fontInfoForBaselineSpacing"), a3);
    UICeilToViewScale(self);
  }
  return result;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 nextToNeighbor:(id)a5 edge:(int)a6 attribute:(int64_t)a7 multiplier:(double)a8
{
  uint64_t v10;
  uint64_t v13;
  unsigned int v15;
  double result;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  objc_super v20;
  uint8_t buf[16];

  v10 = *(_QWORD *)&a6;
  v13 = *(_QWORD *)&a3;
  if ((a3 - 5) <= 1)
  {
    v15 = a4 - 11;
    if (os_variant_has_internal_diagnostics())
    {
      if (v15 < 2)
        goto LABEL_4;
      v17 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "UIKit problem: invalid argument for internal layout spacing method", buf, 2u);
      }
    }
    else
    {
      if (v15 < 2)
      {
LABEL_4:
        _UIViewBaselineSpacing(self, a5, v13);
        return result;
      }
      v18 = _autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier____s_category;
      if (!_autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier____s_category)
      {
        v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&_autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier____s_category);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "UIKit problem: invalid argument for internal layout spacing method", buf, 2u);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)UILabel;
  -[UIView _autolayoutSpacingAtEdge:forAttribute:nextToNeighbor:edge:attribute:multiplier:](&v20, sel__autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier_, v13, a4, a5, v10, a7, a8);
  return result;
}

void __23__UILabel__tooBigChars__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  v1 = (void *)qword_1ECD792E8;
  qword_1ECD792E8 = v0;

}

IMP __22__UILabel__commonInit__block_invoke()
{
  objc_class *v0;
  IMP result;

  v0 = (objc_class *)objc_opt_class();
  result = class_getMethodImplementation(v0, sel__defaultAttributes);
  qword_1ECD792D0 = (uint64_t)result;
  return result;
}

- (void)_setHyphenationFactor:(float)a3
{
  void *v5;
  float v6;
  UILabel *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  -[UILabel _content](self, "_content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paragraphStyle");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "hyphenationFactor");
  if (v6 != a3)
  {
    v7 = self;
    v8 = (void *)objc_msgSend(v12, "mutableCopy");
    *(float *)&v9 = a3;
    objc_msgSend(v8, "setHyphenationFactor:", v9);
    -[UILabel _content](v7, "_content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentByApplyingAttributeToEntireRange:value:", *(_QWORD *)off_1E1678F98, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setContent:](v7, "_setContent:", v11);

    -[UILabel _invalidateLabelSize](v7, "_invalidateLabelSize");
  }

}

- (void)setHighlightedTextColor:(UIColor *)highlightedTextColor
{
  UIColor *v5;
  UIColor *v6;
  UIColor *v7;
  BOOL v8;
  UIColor *v9;

  v5 = highlightedTextColor;
  v6 = self->_highlightedColor;
  v7 = v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UIColor isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_highlightedColor, highlightedTextColor);
    if ((*(_BYTE *)&self->_textLabelFlags & 1) != 0)
      -[UILabel _invalidateLabelDisplay](self);
  }
LABEL_10:

}

- (void)_setFirstLineBaselineFrameOriginY:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[UIView frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self, "_firstLineBaselineOffsetFromBoundsTop");
  -[UILabel setFrame:](self, "setFrame:", v6, a3 - v11, v8, v10);
}

- (double)_lastLineBaselineFrameOriginY
{
  double v3;
  double v4;
  double v5;

  -[UIView frame](self, "frame");
  v4 = v3;
  -[UILabel _lastLineBaseline](self, "_lastLineBaseline");
  return v5 + v4;
}

- (double)_firstLineBaselineOffsetFromBoundsTop
{
  double result;

  if (-[UILabel _measuredNumberOfLines](self, "_measuredNumberOfLines") < 1)
    -[UILabel _lastLineBaseline](self, "_lastLineBaseline");
  else
    -[UILabel _firstLineBaseline](self, "_firstLineBaseline");
  UIRoundToViewScale(self);
  return result;
}

- (int64_t)_measuredNumberOfLines
{
  -[UILabel _lastLineBaseline](self, "_lastLineBaseline");
  return self->_intrinsicSizeBaselineInfo.measuredNumberOfLines;
}

- (double)_lastLineBaseline
{
  $947844291C9B6B6407FCB39A34E7C403 *p_intrinsicSizeBaselineInfo;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  CGRect v15;

  p_intrinsicSizeBaselineInfo = &self->_intrinsicSizeBaselineInfo;
  v4 = fabs(self->_intrinsicSizeBaselineInfo.lastBaseline);
  -[UIView bounds](self, "bounds");
  v6 = -[UILabel _sizingRuleAdjustedBoundsForBounds:](self, v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  textLabelFlags = self->_textLabelFlags;
  if ((*(_DWORD *)&textLabelFlags & 0x1000000) == 0
    && (self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(unint64_t *)&textLabelFlags | 0x1000000),
        -[UIView needsDisplay](self, "needsDisplay"))
    || v4 >= 2.22044605e-16
    || (v15.origin.x = v6,
        v15.origin.y = v8,
        v15.size.width = v10,
        v15.size.height = v12,
        !CGRectEqualToRect(p_intrinsicSizeBaselineInfo->referenceBounds, v15)))
  {
    -[UILabel _drawTextInRect:baselineCalculationOnly:](self, "_drawTextInRect:baselineCalculationOnly:", 1, v6, v8, v10, v12);
  }
  return p_intrinsicSizeBaselineInfo->lastBaseline;
}

- (void)_setFirstLineCapFrameOriginY:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[UIView frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel _capOffsetFromBoundsTop](self, "_capOffsetFromBoundsTop");
  -[UILabel setFrame:](self, "setFrame:", v6, a3 - v11, v8, v10);
}

- (double)_capOffsetFromBoundsTop
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  _QWORD v13[5];
  _QWORD v14[3];
  uint64_t v15;

  -[UILabel _content](self, "_content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  -[UILabel font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capHeight");
  v6 = v5;

  v15 = v6;
  if (objc_msgSend(v3, "isAttributed"))
  {
    objc_msgSend(v3, "attributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "length");
    v9 = *(_QWORD *)off_1E1678D90;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__UILabel_UILabel_ModernUISupport___capOffsetFromBoundsTop__block_invoke;
    v13[3] = &unk_1E16EA4D0;
    v13[4] = v14;
    objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0x100000, v13);

  }
  -[UILabel _firstLineBaseline](self, "_firstLineBaseline");
  UIRoundToViewScale(self);
  v11 = v10;
  _Block_object_dispose(v14, 8);

  return v11;
}

- (double)_firstLineBaseline
{
  $947844291C9B6B6407FCB39A34E7C403 *p_intrinsicSizeBaselineInfo;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  CGRect v15;

  p_intrinsicSizeBaselineInfo = &self->_intrinsicSizeBaselineInfo;
  v4 = fabs(self->_intrinsicSizeBaselineInfo.firstBaseline);
  -[UIView bounds](self, "bounds");
  v6 = -[UILabel _sizingRuleAdjustedBoundsForBounds:](self, v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  textLabelFlags = self->_textLabelFlags;
  if ((*(_DWORD *)&textLabelFlags & 0x1000000) == 0
    && (self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(unint64_t *)&textLabelFlags | 0x1000000),
        -[UIView needsDisplay](self, "needsDisplay"))
    || v4 < 2.22044605e-16
    || (v15.origin.x = v6,
        v15.origin.y = v8,
        v15.size.width = v10,
        v15.size.height = v12,
        !CGRectEqualToRect(p_intrinsicSizeBaselineInfo->referenceBounds, v15)))
  {
    -[UILabel _drawTextInRect:baselineCalculationOnly:](self, "_drawTextInRect:baselineCalculationOnly:", 1, v6, v8, v10, v12);
  }
  return p_intrinsicSizeBaselineInfo->firstBaseline;
}

- (void)_setTextColorFollowsTintColor:(BOOL)a3
{
  uint64_t v3;

  if (((((*(_QWORD *)&self->_textLabelFlags & 0x40000000) == 0) ^ a3) & 1) == 0)
  {
    v3 = 0x40000000;
    if (!a3)
      v3 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFBFFFFFFFLL | v3);
    -[UILabel _invalidateLabelDisplay](self);
  }
}

- (void)setLineSpacing:(int64_t)a3
{
  void *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  if (self->_lineSpacing != a3)
  {
    self->_lineSpacing = a3;
    -[UILabel _content](self, "_content");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "paragraphStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __26__UILabel_setLineSpacing___block_invoke;
    v10[3] = &unk_1E16EA458;
    v10[4] = self;
    v5 = self;
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    __26__UILabel_setLineSpacing___block_invoke((uint64_t)v10, v6);
    -[UILabel _content](v5, "_content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentByApplyingAttributeToEntireRange:value:", *(_QWORD *)off_1E1678F98, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setContent:](v5, "_setContent:", v8);

    -[UILabel _invalidateLabelSize](v5, "_invalidateLabelSize");
  }
}

uint64_t __48__UILabel__synthesizedAttributedTextForContent___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *(_QWORD *)off_1E1679048, a3, a4);
  return result;
}

- (CGSize)shadowOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UILabel _shadow](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth
{
  int v5;

  v5 = -[UILabel _needsDoubleUpdateConstraintsPass](self, "_needsDoubleUpdateConstraintsPass");
  if (dyld_program_sdk_at_least())
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)(preferredMaxLayoutWidth != 0.0) << 13));
  else
    *(_QWORD *)&self->_textLabelFlags |= 0x2000uLL;
  if (self->_preferredMaxLayoutWidth != preferredMaxLayoutWidth)
  {
    self->_preferredMaxLayoutWidth = preferredMaxLayoutWidth;
    -[UILabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v5);
}

- (CGFloat)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (UILabel)initWithCoder:(id)a3
{
  id v4;
  UILabel *v5;
  UILabel *v6;
  id *v7;
  _UILabelLegacyImpl *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  float v22;
  float v23;
  float v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  float v36;
  int v37;
  uint64_t v38;
  UILabel *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)UILabel;
  v5 = -[UIView initWithCoder:](&v45, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v8 = objc_alloc_init(_UILabelLegacyImpl);
    objc_storeStrong(v7 + 99, v8);

    v9 = v7;
    +[_UILabelVisualStyle inferredVisualStyle](_UILabelVisualStyle, "inferredVisualStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setVisualStyle:", v10);

    UILabelCommonInit(v9);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIHighlightedColor"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v9[55];
    v9[55] = (id)v11;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIShadowColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowColor:", v13);

    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("UIShadowOffset"));
    objc_msgSend(v9, "setShadowOffset:");
    v9[56] = (id)1;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UINumberOfLines")))
      v9[56] = (id)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UINumberOfLines"));
    v9[93] = (id)((unint64_t)v9[93] & 0xFFFFFFFFFFFFFFCFLL);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIBaselineAdjustment")))
      v9[93] = (id)((unint64_t)v9[93] & 0xFFFFFFFFFFFFFFCFLL | (16
                                                                     * (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIBaselineAdjustment")) & 3)));
    v14 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAdjustsFontSizeToFit"));
    v15 = 2;
    if (!v14)
      v15 = 0;
    v9[93] = (id)((unint64_t)v9[93] & 0xFFFFFFFFFFFFFFFDLL | v15);
    v16 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAdjustsLetterSpacingToFit"));
    v17 = 128;
    if (v16)
      v17 = 136;
    v9[93] = (id)((unint64_t)v9[93] & 0xFFFFFFFFFFFFFFF7 | v17);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIEnablesMarqueeWhenAncestorFocused")))
    {
      v18 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIEnablesMarqueeWhenAncestorFocused"));
      v19 = 256;
      if (!(_DWORD)v18)
        v19 = 0;
      v9[93] = (id)((unint64_t)v9[93] & 0xFFFFFFFFFFFFFEFFLL | v19);
      objc_msgSend(v9, "setMarqueeEnabled:", v18);
    }
    v9[93] = (id)((unint64_t)v9[93] | 0x40);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIEnabled")))
    {
      v20 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIEnabled"));
      v21 = 64;
      if (!v20)
        v21 = 0;
      v9[93] = (id)((unint64_t)v9[93] & 0xFFFFFFFFFFFFFFBFLL | v21);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIPreferredMaxLayoutWidth")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIPreferredMaxLayoutWidth"));
      *((double *)v9 + 94) = v22;
      v9[93] = (id)((unint64_t)v9[93] | 0x2000);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIAdjustsFontForContentSizeCategory")))
      objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAdjustsFontForContentSizeCategory")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIShowsExpansionTextWhenTruncated")))
      objc_msgSend(v9, "setShowsExpansionTextWhenTruncated:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIShowsExpansionTextWhenTruncated")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIFont"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITextColor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIMinimumFontSize"));
    v24 = v23;
    +[UILabel _defaultAttributes](UILabel, "_defaultAttributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F98);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v26;
    if (v26)
    {
      v27 = objc_msgSend(v26, "lineBreakMode");
      v28 = objc_msgSend(v26, "lineBreakStrategy");
    }
    else
    {
      v28 = 0xFFFFLL;
      v27 = 4;
    }
    v29 = v27;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILineBreakMode")))
      v29 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UILineBreakMode"));
    v41 = v28;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILineBreakStrategy")))
      v28 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UILineBreakStrategy"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITextAlignment")))
      v30 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UITextAlignment"));
    else
      v30 = 0;
    v31 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAllowsDefaultTighteningForTruncation"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAttributedText"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      v40 = v6;
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIText"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
        objc_msgSend(v9, "_setText:", v33);

      v6 = v40;
    }
    if (v44)
      objc_msgSend(v9, "_setFont:");
    if (v43)
    {
      objc_msgSend(v9, "_setTextColor:");
      v9[93] = (id)((unint64_t)v9[93] | 0x80000);
    }
    if (v29 != v27)
      objc_msgSend(v9, "_setLineBreakMode:", v29);
    if (v28 != v41)
      objc_msgSend(v9, "_setLineBreakStrategy:", v28);
    objc_msgSend(v9, "_setTextAlignment:", v30);
    if (v24 != 0.0)
      objc_msgSend(v9, "_setMinimumFontSize:", v24);
    if (v31)
      -[UILabel _setAllowsDefaultTighteningForTruncation:](v9, 1);
    if (v32)
    {
      objc_msgSend(v9, "_content");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "contentWithAttributedString:", v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setContent:", v35);

      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIMinimumScaleFactor")))
      {
        objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIMinimumScaleFactor"));
        objc_msgSend(v9, "setMinimumScaleFactor:", v36);
      }
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIDisableUpdateTextColorOnTraitCollectionChange")))
    {
      v37 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIDisableUpdateTextColorOnTraitCollectionChange"));
      v38 = 0x80000;
      if (!v37)
        v38 = 0;
      v9[93] = (id)((unint64_t)v9[93] & 0xFFFFFFFFFFF7FFFFLL | v38);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILetterformAwareSizingRule")))
      v9[93] = (id)((unint64_t)v9[93] & 0xFFFFFFBFFFFFFFFFLL | ((objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UILetterformAwareSizingRule")) & 1) << 38));

  }
  return v6;
}

- (CGRect)_drawingRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UILabel _drawTextInRect:baselineCalculationOnly:](self, "_drawTextInRect:baselineCalculationOnly:", 1, -[UILabel _sizingRuleAdjustedBoundsForBounds:](self, a3.origin.x));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (Class)_intelligenceBaseClass
{
  sub_1851F9080(0, &qword_1EDD8AAC8);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  id v5;
  UILabel *v6;

  v5 = a4;
  v6 = self;
  _sSo7UILabelC5UIKitE27_intelligenceCollectContent2in9collectorySo6CGRectV_21UIIntelligenceSupport0I16ElementCollectorCtF_0((uint64_t)v5);

}

- (BOOL)isAccessibilityElementByDefault
{
  return 1;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 1;
}

- (unint64_t)defaultAccessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UILabel;
  return -[NSObject defaultAccessibilityTraits](&v3, sel_defaultAccessibilityTraits) | 0x40;
}

- (id)_image
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v17[9];

  -[UILabel _contentInsetsFromFonts](self, "_contentInsetsFromFonts");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView bounds](self, "bounds");
  v12 = v11 - (v10 + v6);
  v14 = v13 - (v4 + v8);
  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __32__UILabel__UILegibility___image__block_invoke;
  v17[3] = &unk_1E16CB380;
  *(double *)&v17[5] = v4;
  *(double *)&v17[6] = v6;
  *(double *)&v17[7] = v8;
  *(double *)&v17[8] = v10;
  v17[4] = self;
  return _UIGraphicsDrawIntoImageContextWithMoreOptions(0, 0, v17, v12, v14, v15);
}

uint64_t __32__UILabel__UILegibility___image__block_invoke(uint64_t a1)
{
  _QWORD *ContextStack;
  CGContext *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v3 = 0;
  else
    v3 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextTranslateCTM(v3, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 40));
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "layer");
  v5 = GetContextStack(0);
  if (*(int *)v5 < 1)
    v6 = 0;
  else
    v6 = v5[3 * (*(_DWORD *)v5 - 1) + 1];
  return objc_msgSend(v4, "renderInContext:", v6);
}

- (id)largeContentTitle
{
  void *v3;
  int v4;
  void *v6;
  void *v7;
  objc_super v8;

  -[UIView _largeContentStoredProperties](self, "_largeContentStoredProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "didSetLargeContentTitle");

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)UILabel;
    -[UIView largeContentTitle](&v8, sel_largeContentTitle);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UILabel attributedText](self, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (void)_ola_willApplyMultilineTextWidthDisambiguationConstraint
{
  -[UILabel _setMultilineLabelRequiresCarefulMeasurement:](self, "_setMultilineLabelRequiresCarefulMeasurement:", 1);
}

- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3
{
  return ((_DWORD)a3 - 11) < 2;
}

- (id)_cuiCatalog
{
  return self->_cuiCatalog;
}

- (id)_cuiStyleEffectConfiguration
{
  return self->_cuiStyleEffectConfiguration;
}

void __60__UILabel__attributedStringIsolatingStringWritingDirection___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  id v6;

  if (!a2)
    a2 = (void *)a1[4];
  v6 = a2;
  v3 = objc_msgSend(v6, "baseWritingDirection");
  if (v3)
    v4 = 8296;
  else
    v4 = 8294;
  if (v3 == 1)
    v4 = 8295;
  v5 = *(_QWORD *)(a1[5] + 8);
  if (v4 != *(unsigned __int16 *)(v5 + 24))
  {
    *(_WORD *)(v5 + 24) = v4;
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  }

}

void __60__UILabel__attributedStringIsolatingStringWritingDirection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a2;
  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "paragraphStyle");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v7;
  v8 = objc_msgSend(v7, "baseWritingDirection");
  if (v8)
    v9 = 8296;
  else
    v9 = 8294;
  if (v8 == 1)
    v9 = 8295;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v9 != *(unsigned __int16 *)(v10 + 24))
  {
    *(_WORD *)(v10 + 24) = v9;
    v11 = *(_QWORD *)(a1 + 64) + 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(_WORD *)v11 = v9;
    *(_DWORD *)(v11 + 2) = 0;
    *(_WORD *)(v11 + 6) = 0;
    *(_QWORD *)(v11 + 8) = a3;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  v12 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v12, "setBaseWritingDirection:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(_QWORD *)off_1E1678F98, v12, a3, a4);

}

void __65__UILabel__attributedStringByDisablingHyphenationIfURLsDetected___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  double v7;
  id v8;

  if (a2)
  {
    v8 = (id)objc_msgSend(a2, "mutableCopy");
    LODWORD(v7) = 0;
    objc_msgSend(v8, "setHyphenationFactor:", v7);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *(_QWORD *)off_1E1678F98, v8, a3, a4);

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIColor *highlightedColor;
  void *v12;
  void *v13;
  double v14;
  double v15;
  int64_t numberOfLines;
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  $E628185296FB360B9F692E5749A23446 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  double preferredMaxLayoutWidth;
  $E628185296FB360B9F692E5749A23446 *p_textLabelFlags;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)UILabel;
  -[UIView encodeWithCoder:](&v43, sel_encodeWithCoder_, v4);
  -[UILabel text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UILabel text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UIText"));

  }
  if (-[UILabel adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIAdjustsFontForContentSizeCategory"));
  if (-[UILabel showsExpansionTextWhenTruncated](self, "showsExpansionTextWhenTruncated"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIShowsExpansionTextWhenTruncated"));
  -[UILabel font](self, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UILabel font](self, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UIFont"));

  }
  -[UILabel color](self, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UILabel color](self, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("UITextColor"));

  }
  highlightedColor = self->_highlightedColor;
  if (highlightedColor)
    objc_msgSend(v4, "encodeObject:forKey:", highlightedColor, CFSTR("UIHighlightedColor"));
  -[UILabel shadowColor](self, "shadowColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UILabel shadowColor](self, "shadowColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("UIShadowColor"));

  }
  -[UILabel shadowOffset](self, "shadowOffset");
  if (v15 != *MEMORY[0x1E0C9D820] || v14 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("UIShadowOffset"));
  numberOfLines = self->_numberOfLines;
  if (numberOfLines != 1)
    objc_msgSend(v4, "encodeInteger:forKey:", numberOfLines, CFSTR("UINumberOfLines"));
  textLabelFlags = self->_textLabelFlags;
  v18 = (*(unint64_t *)&textLabelFlags >> 4) & 3;
  if (v18)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", v18, CFSTR("UIBaselineAdjustment"));
    textLabelFlags = self->_textLabelFlags;
  }
  if ((*(_BYTE *)&textLabelFlags & 2) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIAdjustsFontSizeToFit"));
  -[UILabel _minimumFontSize](self, "_minimumFontSize");
  if (v19 != 0.0)
  {
    -[UILabel _minimumFontSize](self, "_minimumFontSize");
    *(float *)&v20 = v20;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIMinimumFontSize"), v20);
  }
  if (-[UILabel allowsDefaultTighteningForTruncation](self, "allowsDefaultTighteningForTruncation"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIAllowsDefaultTighteningForTruncation"));
  +[UILabel _defaultAttributes](UILabel, "_defaultAttributes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)off_1E1678F98;
  objc_msgSend(v21, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F98);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_msgSend(v23, "lineBreakMode");
    v25 = objc_msgSend(v23, "lineBreakStrategy");
  }
  else
  {
    v25 = 0xFFFFLL;
    v24 = 4;
  }
  if (-[UILabel lineBreakMode](self, "lineBreakMode") != v24)
    objc_msgSend(v4, "encodeInteger:forKey:", -[UILabel lineBreakMode](self, "lineBreakMode"), CFSTR("UILineBreakMode"));
  if (-[UILabel lineBreakStrategy](self, "lineBreakStrategy") != v25)
    objc_msgSend(v4, "encodeInteger:forKey:", -[UILabel lineBreakStrategy](self, "lineBreakStrategy"), CFSTR("UILineBreakStrategy"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UILabel textAlignment](self, "textAlignment"), CFSTR("UITextAlignment"));
  v26 = self->_textLabelFlags;
  if ((*(_BYTE *)&v26 & 0x40) == 0)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIEnabled"));
    v26 = self->_textLabelFlags;
  }
  if ((*(_WORD *)&v26 & 0x100) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIEnablesMarqueeWhenAncestorFocused"));
  -[UILabel _content](self, "_content");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "isAttributed"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self, "font");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setValue:forKey:", v29, *(_QWORD *)off_1E1678D90);

    -[UILabel color](self, "color");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setValue:forKey:", v30, *(_QWORD *)off_1E1678D98);

    v31 = objc_alloc_init((Class)off_1E1679CA0);
    -[UILabel shadowColor](self, "shadowColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setShadowColor:", v32);

    -[UILabel shadowOffset](self, "shadowOffset");
    objc_msgSend(v31, "setShadowOffset:");
    objc_msgSend(v28, "setValue:forKey:", v31, *(_QWORD *)off_1E1679048);
    v33 = objc_alloc_init((Class)off_1E1679BC0);
    objc_msgSend(v33, "setLineBreakMode:", -[UILabel lineBreakMode](self, "lineBreakMode"));
    objc_msgSend(v33, "setLineBreakStrategy:", -[UILabel lineBreakStrategy](self, "lineBreakStrategy"));
    objc_msgSend(v33, "setAlignment:", -[UILabel textAlignment](self, "textAlignment"));
    objc_msgSend(v28, "setValue:forKey:", v33, v22);
    v34 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v27, "string");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v34, "initWithString:attributes:", v35, v28);

    LOBYTE(v35) = objc_msgSend(v27, "isEqualToAttributedString:", v36);
    if ((v35 & 1) != 0)
      goto LABEL_43;
    v37 = objc_alloc(MEMORY[0x1E0CB3778]);
    -[UILabel _materializedAttributedString](self);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v37, "initWithAttributedString:", v38);

    objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("UIAttributedText"));
  }

LABEL_43:
  -[UILabel minimumScaleFactor](self, "minimumScaleFactor");
  if (v39 != 0.0)
  {
    -[UILabel minimumScaleFactor](self, "minimumScaleFactor");
    *(float *)&v40 = v40;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIMinimumScaleFactor"), v40);
  }
  if (-[UILabel adjustsLetterSpacingToFitWidth](self, "adjustsLetterSpacingToFitWidth"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIAdjustsLetterSpacingToFit"));
  preferredMaxLayoutWidth = self->_preferredMaxLayoutWidth;
  if (preferredMaxLayoutWidth > 0.0)
  {
    *(float *)&preferredMaxLayoutWidth = preferredMaxLayoutWidth;
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIPreferredMaxLayoutWidth"), preferredMaxLayoutWidth);
  }
  p_textLabelFlags = &self->_textLabelFlags;
  objc_msgSend(v4, "encodeBool:forKey:", (*(unint64_t *)p_textLabelFlags >> 19) & 1, CFSTR("UIDisableUpdateTextColorOnTraitCollectionChange"));
  if ((*((_BYTE *)p_textLabelFlags + 4) & 0x40) != 0)
    objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("UILetterformAwareSizingRule"));

}

- (id)_verticalTextLayoutManager
{
  objc_getAssociatedObject(a1, &kTextLayoutManagerKey);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)_tightBoundingRectOfFirstLine
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[UIView bounds](self, "bounds");
  if (self)
  {
    v7 = -[UILabel _drawTextInRect:baselineCalculationOnly:returningDeviceMetricsOfFirstLine:returningMultilineDeviceMetrics:forceMultiline:]((uint64_t)self, 1, 1, 0, 0, v3, v4, v5, v6);
  }
  else
  {
    v10 = 0.0;
    v9 = 0.0;
    v8 = 0.0;
    v7 = 0.0;
  }
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)_tightBoundingRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[UIView bounds](self, "bounds");
  if (self)
  {
    v7 = -[UILabel _drawTextInRect:baselineCalculationOnly:returningDeviceMetricsOfFirstLine:returningMultilineDeviceMetrics:forceMultiline:]((uint64_t)self, 1, 0, 1u, 0, v3, v4, v5, v6);
  }
  else
  {
    v10 = 0.0;
    v9 = 0.0;
    v8 = 0.0;
    v7 = 0.0;
  }
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (CGRect)_insetRect:(CGRect)a3 forAttributedString:(id)a4 withDefaultFont:(id)a5 inView:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v13, "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[UILabel _tooBigChars]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "rangeOfCharacterFromSet:", v17);

  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)a1, v13, v14, v15);
    x = x + v20;
    width = width - (v21 + v20);
    y = y + v19;
    height = height - (v19 + v22);
  }

  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)_setFallbackTextColor:(id)a3 forUserInterfaceStyle:(int64_t)a4
{
  NSMutableDictionary *fallbackColorsForUserInterfaceStyle;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  fallbackColorsForUserInterfaceStyle = self->_fallbackColorsForUserInterfaceStyle;
  if (!fallbackColorsForUserInterfaceStyle)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = self->_fallbackColorsForUserInterfaceStyle;
    self->_fallbackColorsForUserInterfaceStyle = v7;

    fallbackColorsForUserInterfaceStyle = self->_fallbackColorsForUserInterfaceStyle;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](fallbackColorsForUserInterfaceStyle, "setObject:forKey:", v10, v9);

  -[UILabel _updateTextColorWithFallbackColorIfNeeded](self, "_updateTextColorWithFallbackColorIfNeeded");
}

- (void)setPreferredVibrancy:(UILabelVibrancy)preferredVibrancy
{
  uint64_t v3;

  if (self->_preferredVibrancy != preferredVibrancy)
  {
    self->_preferredVibrancy = preferredVibrancy;
    if (preferredVibrancy == UILabelVibrancyNone)
    {
      v3 = 1;
      goto LABEL_5;
    }
    if (preferredVibrancy == UILabelVibrancyAutomatic)
    {
      v3 = 2;
LABEL_5:
      -[UIView _setOverrideUserInterfaceRenderingMode:](self, "_setOverrideUserInterfaceRenderingMode:", v3);
    }
  }
}

- (void)_setTextEncapsulation:(id)a3
{
  objc_storeStrong((id *)&self->_textEncapsulation, a3);
  -[UILabel _invalidateLabelDisplay](self);
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return (*(_BYTE *)&self->_textLabelFlags >> 1) & 1;
}

- (double)_actualScaleFactor
{
  double v3;
  double v4;
  double v5;
  double v6;
  _UILabelLegacyScaledMetrics *scaledMetrics;

  -[UIView bounds](self, "bounds");
  -[UILabel _updateScaledMetricsForRect:]((uint64_t)self, v3, v4, v5, v6);
  scaledMetrics = self->_scaledMetrics;
  if (scaledMetrics)
    return scaledMetrics->_actualScaleFactor;
  else
    return 1.0;
}

- (void)_setAssociatedScalingLabel:(id)a3
{
  id v4;
  void *v5;
  id value;

  value = a3;
  -[UILabel _associatedScalingLabel](self, "_associatedScalingLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(self, &kAssociatedScalingLabelKey, value, (void *)1);
    -[UILabel setNeedsDisplay](self, "setNeedsDisplay");
    v5 = value;
  }

}

- (double)_minimumFontSize
{
  double minimumFontSize;
  void *v4;
  double v5;
  double v6;
  double v7;

  minimumFontSize = self->_minimumFontSize;
  if (minimumFontSize <= 0.0)
  {
    -[UILabel font](self, "font");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pointSize");
    v6 = v5;
    -[_UILabelImplProtocol minimumScaleFactor](self->__impl, "minimumScaleFactor");
    minimumFontSize = round(v6 * v7 * 4.0) * 0.25;

  }
  return minimumFontSize;
}

- (CGFloat)minimumScaleFactor
{
  CGFloat result;

  if (!self)
    return 0.0;
  -[_UILabelImplProtocol minimumScaleFactor](self->__impl, "minimumScaleFactor");
  return result;
}

- (BOOL)allowsDefaultTighteningForTruncation
{
  void *v2;
  void *v3;
  char v4;

  -[UILabel _content](self, "_content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paragraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsDefaultTighteningForTruncation");

  return v4;
}

- (BOOL)enablesMarqueeWhenAncestorFocused
{
  return *((_BYTE *)&self->_textLabelFlags + 1) & 1;
}

- (void)setEnablesMarqueeWhenAncestorFocused:(BOOL)enablesMarqueeWhenAncestorFocused
{
  uint64_t v4;
  $E628185296FB360B9F692E5749A23446 *p_textLabelFlags;
  void *v6;
  void *v7;

  if (((((*(_QWORD *)&self->_textLabelFlags & 0x100) == 0) ^ enablesMarqueeWhenAncestorFocused) & 1) == 0)
  {
    v4 = 256;
    if (!enablesMarqueeWhenAncestorFocused)
      v4 = 0;
    p_textLabelFlags = &self->_textLabelFlags;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFEFFLL | v4);
    -[UILabel setMarqueeEnabled:](self, "setMarqueeEnabled:");
    if ((*((_BYTE *)p_textLabelFlags + 3) & 0x10) != 0)
    {
      -[UIView layer](self, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidateContentInsets");

    }
    -[UIView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    -[UILabel _runMarqueeIfEnabledAndAncestorIsFocused](self);
  }
}

- (BOOL)showsExpansionTextWhenTruncated
{
  return *((_BYTE *)&self->_textLabelFlags + 4) & 1;
}

- (void)_setExtremeSizingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  if (-[UILabel _isExtremeSizingEnabled](self, "_isExtremeSizingEnabled") != a3)
  {
    v5 = 0x2000000000;
    if (!v3)
      v5 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFDFFFFFFFFFLL | v5);
    -[UILabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    if ((*((_BYTE *)&self->_textLabelFlags + 3) & 0x10) != 0)
    {
      -[UIView layer](self, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setOversizeEdgesIncludedInLabelLayer:", 5);

      if ((*((_BYTE *)&self->_textLabelFlags + 3) & 0x10) != 0)
      {
        -[UIView layer](self, "layer");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "invalidateContentInsets");

      }
    }
  }
}

- (BOOL)_isExtremeSizingEnabled
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 4) >> 5) & 1;
}

- (void)setSizingRule:(int64_t)a3
{
  void *v5;
  id v6;

  if (-[UILabel sizingRule](self, "sizingRule") != a3)
  {
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFBFFFFFFFFFLL | ((unint64_t)(a3 == 1) << 38));
    -[UILabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    if ((*((_BYTE *)&self->_textLabelFlags + 3) & 0x10) != 0)
    {
      -[UIView layer](self, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setOversizeEdgesIncludedInLabelLayer:", 15);

      if ((*((_BYTE *)&self->_textLabelFlags + 3) & 0x10) != 0)
      {
        -[UIView layer](self, "layer");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "invalidateContentInsets");

      }
    }
  }
}

- (int64_t)sizingRule
{
  return (*(_QWORD *)&self->_textLabelFlags >> 38) & 1;
}

void __69__UILabel__contentAdjustingFontForTypesettingLanguage_didAdjustFont___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  const __CTFont *v9;
  const __CTFont *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BYTE *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v9 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  -[UIFont _fontAdjustedForTypesettingLanguage:](v10, *(void **)(a1 + 32));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13 && (-[__CTFont isEqual:](v10, "isEqual:", v11) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "contentByApplyingAttribute:value:toRange:", *(_QWORD *)off_1E1678D90, v12, a3, a4);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v17 = *(_BYTE **)(a1 + 48);
    if (v17)
      *v17 = 1;
  }

}

- (void)setShadowBlur:(double)a3
{
  void *v5;
  double v6;
  id v7;

  -[UILabel _shadow](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "copy");

  objc_msgSend(v7, "shadowBlurRadius");
  if (v6 != a3 || dyld_program_sdk_at_least())
  {
    objc_msgSend(v7, "setShadowBlurRadius:", a3);
    -[UILabel _setShadow:](self, v7);
  }

}

- (double)shadowBlur
{
  void *v2;
  double v3;
  double v4;

  -[UILabel _shadow](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowBlurRadius");
  v4 = v3;

  return v4;
}

void __26__UILabel_setLineSpacing___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = (double)*(uint64_t *)(*(_QWORD *)(a1 + 32) + 600);
  v4 = a2;
  objc_msgSend(v4, "setMinimumLineHeight:", v3);
  objc_msgSend(v4, "setMaximumLineHeight:", (double)*(uint64_t *)(*(_QWORD *)(a1 + 32) + 600));

}

- (_QWORD)_setHyphenationFactorIgnoredIfURLsDetected:(_QWORD *)result
{
  void *v2;
  uint64_t v3;

  if (result)
  {
    v2 = result;
    if (((((result[93] & 0x4000000) == 0) ^ a2) & 1) == 0)
    {
      v3 = 0x4000000;
      if (!a2)
        v3 = 0;
      result[93] = result[93] & 0xFFFFFFFFFBFFFFFFLL | v3;
      -[UILabel _invalidateLabelDisplay](result);
      return (_QWORD *)objc_msgSend(v2, "_invalidateLabelSize");
    }
  }
  return result;
}

- (BOOL)adjustsLetterSpacingToFitWidth
{
  return (*(_BYTE *)&self->_textLabelFlags >> 3) & 1;
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  objc_super v4;

  if (self)
  {
    v4.receiver = self;
    v4.super_class = (Class)UILabel;
    -[UIView setNeedsDisplay](&v4, sel_setNeedsDisplay, a3, a4);
  }
}

- (void)_setDrawsDebugBaselines:(BOOL)a3
{
  uint64_t v3;
  objc_super v4;

  if (((((*(_QWORD *)&self->_textLabelFlags & 0x4000) == 0) ^ a3) & 1) == 0)
  {
    v3 = 0x4000;
    if (!a3)
      v3 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFFFFBFFFLL | v3);
    v4.receiver = self;
    v4.super_class = (Class)UILabel;
    -[UIView setNeedsDisplay](&v4, sel_setNeedsDisplay);
  }
}

- (BOOL)_drawsDebugBaselines
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 1) >> 6) & 1;
}

- (UIBaselineAdjustment)baselineAdjustment
{
  return (*(_QWORD *)&self->_textLabelFlags >> 4) & 3;
}

- (void)_updateTextColorWithFallbackColorIfNeeded
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  uint64_t v4;
  NSMutableDictionary *fallbackColorsForUserInterfaceStyle;
  void *v6;
  void *v7;
  id v8;

  -[UILabel _visualStyle](self, "_visualStyle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "updatesTextColorOnUserInterfaceStyleChanges"))
  {
    textLabelFlags = self->_textLabelFlags;

    if ((*(_DWORD *)&textLabelFlags & 0x80000) != 0)
      return;
    -[UIView traitCollection](self, "traitCollection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v8, "userInterfaceStyle");
    fallbackColorsForUserInterfaceStyle = self->_fallbackColorsForUserInterfaceStyle;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](fallbackColorsForUserInterfaceStyle, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel _setTextColor:](self, "_setTextColor:", v7);
  }

}

void __36__UILabel__intrinsicSizeWithinSize___block_invoke(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  objc_class *v4;
  const char *Name;
  void *v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  strncpy((char *)&v8, Name, 0x18uLL);
  *(_DWORD *)a2 = 93;
  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a2 + 8) = v6;
  *(_OWORD *)(a2 + 16) = v8;
  *(_QWORD *)(a2 + 32) = v9;
  *(_DWORD *)(a2 + 40) = 94;
  *(_QWORD *)(a2 + 48) = v6;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = v6;
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a2 + 72) = v7;

}

- (void)_setMultilineLabelRequiresCarefulMeasurement:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

uint64_t __26__UILabel_drawTextInRect___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startMarqueeIfNecessary");
}

- (id)_delegate
{
  return objc_getAssociatedObject(self, &kLabelDelegateKey);
}

- (void)_setDelegate:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  id value;

  value = a3;
  -[UILabel _delegate](self, "_delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != value)
  {
    objc_setAssociatedObject(self, &kLabelDelegateKey, value, (void *)1);
    v5 = objc_opt_respondsToSelector();
    v6 = 0x40000000000;
    if ((v5 & 1) == 0)
      v6 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFBFFFFFFFFFFLL | v6);
    v7 = objc_opt_respondsToSelector();
    v8 = 0x80000000000;
    if ((v7 & 1) == 0)
      v8 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFF7FFFFFFFFFFLL | v8);
  }

}

- (void)_markGlyphPathBoundsClippingDetected:(double)a3 glyphPathBounds:(double)a4 availableBounds:(double)a5
{
  id v19;
  _UIGlyphPathBoundsIntersectionViewData *v20;
  _UIGlyphPathBoundsIntersectionViewData *value;

  v19 = a2;
  objc_msgSend(a1, "_glyphPathBoundsIntersectionData");
  v20 = (_UIGlyphPathBoundsIntersectionViewData *)objc_claimAutoreleasedReturnValue();
  if (!v20)
    v20 = objc_alloc_init(_UIGlyphPathBoundsIntersectionViewData);
  value = v20;
  -[_UIGlyphPathBoundsIntersectionViewData setGlyphPathBounds:](v20, "setGlyphPathBounds:", a3, a4, a5, a6);
  -[_UIGlyphPathBoundsIntersectionViewData setClippingView:](value, "setClippingView:", v19);

  -[_UIGlyphPathBoundsIntersectionViewData setAvailableBounds:](value, "setAvailableBounds:", a7, a8, a9, a10);
  objc_setAssociatedObject(a1, &_UIGylphPathBoundsClippingAssociationKey, value, (void *)1);

}

- (BOOL)_glyphPathBoundsClippingDetected
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[UILabel _glyphPathBoundsIntersectionData](self, "_glyphPathBoundsIntersectionData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "clippingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_UIGlyphPathBoundsIntersectionViewData)_glyphPathBoundsIntersectionData
{
  return (_UIGlyphPathBoundsIntersectionViewData *)objc_getAssociatedObject(self, &_UIGylphPathBoundsClippingAssociationKey);
}

- (BOOL)_clipsGlyphPathFrame:(CGRect)a3 shouldContinueSuperviewTraversal:(BOOL *)a4
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UILabel;
  v5 = -[UIView _clipsGlyphPathFrame:shouldContinueSuperviewTraversal:](&v7, sel__clipsGlyphPathFrame_shouldContinueSuperviewTraversal_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
    *a4 = 0;
  return v5;
}

- (void)setMarqueeRepeatCount:(unint64_t)a3
{
  self->_marqueeRepeatCount = a3;
}

- (void)setMarqueeLoopPadding:(double)a3
{
  self->_marqueeLoopPadding = a3;
}

- (void)_setMarqueeUpdatable:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (id)_siblingMarqueeLabels
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (~*(_DWORD *)(v10 + 744) & 0xA00) == 0)
          objc_msgSend(v2, "addObject:", v10, (_QWORD)v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v2;
}

- (double)_maximumMarqueeTextWidth
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t i;
  double v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[UILabel _siblingMarqueeLabels](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    v5 = 0.0;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "textSizeForWidth:", 3.40282347e38, (_QWORD)v9);
        if (v7 > v5)
          v5 = v7;
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)_drawFullMarqueeTextInRect:(CGRect)a3
{
  -[UILabel _drawTextInRect:baselineCalculationOnly:](self, "_drawTextInRect:baselineCalculationOnly:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

void __24__UILabel__startMarquee__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "backgroundColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "set");
    UIRectFillUsingOperation(1, 0.0, 0.0, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  }
  if (*(_BYTE *)(a1 + 136))
    v2 = *(double *)(a1 + 40) - *(double *)(a1 + 56);
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "_drawFullMarqueeTextInRect:", v2 - *(double *)(a1 + 72), -*(double *)(a1 + 64), *(double *)(a1 + 96), *(double *)(a1 + 128));
  if (*(_BYTE *)(a1 + 136))
  {
    v3 = *(double *)(a1 + 40) - *(double *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "marqueeLoopPadding");
    v5 = v3 - v4 - *(double *)(a1 + 56);
  }
  else
  {
    v6 = *(double *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "marqueeLoopPadding");
    v5 = v6 + v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "_drawFullMarqueeTextInRect:", v5 - *(double *)(a1 + 72), -*(double *)(a1 + 64), *(double *)(a1 + 96), *(double *)(a1 + 128));

}

- (_UILabelMarqueeAnimationDelegate)_marqueeAnimationDelegate
{
  _UILabelMarqueeAnimationDelegate *v2;

  objc_getAssociatedObject(a1, &__marqueeAnimationDelegateKey);
  v2 = (_UILabelMarqueeAnimationDelegate *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = -[_UILabelMarqueeAnimationDelegate initWithLabel:]([_UILabelMarqueeAnimationDelegate alloc], "initWithLabel:", a1);
    objc_setAssociatedObject(a1, &__marqueeAnimationDelegateKey, v2, (void *)1);
  }
  return v2;
}

- (void)_startMarqueeIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  UIGraphicsImageRenderer *v32;
  uint64_t v33;
  UIImageView *v34;
  UIImageView *v35;
  double v36;
  void *v37;
  UILabel *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  unint64_t v47;
  float v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  uint64_t v66;
  NSMutableDictionary *marqueeAnimations;
  uint64_t v68;
  NSMutableDictionary *marqueeMaskAnimations;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  id v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id *v110;
  double v111;
  void *v112;
  float v113;
  uint64_t v114;
  void *v115;
  float v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  void *v122;
  uint64_t i;
  id *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  double v138;
  double v139;
  void *v140;
  double v141;
  void *v142;
  double v143;
  void *v144;
  double v145;
  void *v146;
  void *v147;
  double v148;
  UIGraphicsImageRenderer *v149;
  double v150;
  void *v151;
  void *v152;
  double v153;
  void *v154;
  double v155;
  UIImageView *v156;
  double obj;
  id obja;
  id *p_isa;
  double v160;
  uint64_t v161;
  double v162;
  uint64_t v163;
  _QWORD v164[17];
  char v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _QWORD v170[6];
  _QWORD v171[6];
  _QWORD v172[6];
  _QWORD v173[4];
  _QWORD v174[4];
  _BYTE v175[128];
  uint64_t v176;

  v176 = *MEMORY[0x1E0C80C00];
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_backlightLuminance");

  if (v4 != 1 && (~*(_DWORD *)&self->_textLabelFlags & 0xE00) == 0)
  {
    -[UILabel text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isNaturallyRTL");

    -[UIView bounds](self, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v160 = v11;
    v14 = v13;
    v155 = v13;
    -[UILabel _contentInsetsFromFonts](self, "_contentInsetsFromFonts");
    v16 = v15;
    v18 = v17;
    v150 = v19;
    obj = v20;
    v21 = v17 + v20;
    v22 = v14 - (v15 + v19);
    v23 = v12 - (v17 + v20);
    -[UILabel textSizeForWidth:](self, "textSizeForWidth:");
    v148 = v24;
    v25 = v24 - v21;
    v26 = v24 - v21 + v23;
    -[UILabel marqueeLoopPadding](self, "marqueeLoopPadding");
    v28 = v27 + v26;
    os_variant_has_internal_diagnostics();
    +[UITraitCollection _currentTraitCollectionIfExists]();
    v29 = objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v30);

    v31 = (void *)_UISetCurrentFallbackEnvironment(self);
    v32 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", v28, v22);
    v164[0] = MEMORY[0x1E0C809B0];
    v164[1] = 3221225472;
    v164[2] = __24__UILabel__startMarquee__block_invoke;
    v164[3] = &unk_1E16EA480;
    v164[4] = self;
    *(double *)&v164[5] = v28;
    *(double *)&v164[6] = v22;
    v153 = v22;
    v165 = v6;
    v138 = v25;
    *(double *)&v164[7] = v25;
    *(double *)&v164[8] = v16;
    v162 = v18;
    *(double *)&v164[9] = v18;
    *(double *)&v164[10] = v150;
    *(double *)&v164[11] = obj;
    *(double *)&v164[12] = v148;
    *(double *)&v164[13] = v8;
    *(double *)&v164[14] = v10;
    *(double *)&v164[15] = v160;
    *(double *)&v164[16] = v155;
    v149 = v32;
    -[UIGraphicsImageRenderer imageWithActions:](v32, "imageWithActions:", v164);
    v33 = objc_claimAutoreleasedReturnValue();
    _UIRestorePreviousFallbackEnvironment(v31);
    v151 = (void *)v29;
    +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v29);
    -[UIView viewWithTag:](self, "viewWithTag:", 4032914800);
    v34 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = v34;
      -[UIView setAlpha:](v34, "setAlpha:", 1.0);
      -[UIImageView setImage:](v35, "setImage:", v33);
    }
    else
    {
      v35 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v33);
      -[UIView setTag:](v35, "setTag:", 4032914800);
      -[UIView addSubview:](self, "addSubview:", v35);
    }
    -[UIImageView setFrame:](v35, "setFrame:", v8 + v18, v10 + v16, v23, v22);
    v145 = v28;
    v36 = v23 / v28;
    -[UIView layer](v35, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setContentsRect:", 0.0, 0.0, v23 / v28, 1.0);

    v38 = self;
    -[UILabel textSizeForWidth:](v38, "textSizeForWidth:", 3.40282347e38);
    v40 = v39;
    -[UILabel marqueeLoopPadding](v38, "marqueeLoopPadding");
    v42 = (v40 + v41) / 30.0;
    v43 = -[UILabel _maximumMarqueeTextWidth](v38);
    -[UILabel marqueeLoopPadding](v38, "marqueeLoopPadding");
    v45 = v44;

    v143 = (v43 + v45) / 30.0 - v42 + 0.0;
    v46 = v42 + 1.5 + v143;
    v47 = -[UILabel marqueeRepeatCount](v38, "marqueeRepeatCount");
    if (v47)
      v48 = (float)v47;
    else
      v48 = 3.4028e38;
    v49 = CACurrentMediaTime();
    v50 = v49 + 0.0;
    v147 = (void *)v33;
    if ((*((_BYTE *)&self->_textLabelFlags + 1) & 0x10) != 0)
    {
      -[UIView layer](v35, "layer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "animationForKey:", CFSTR("UILabelMarqueeLayerContentOriginXAnimationKey"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v54, "beginTime");
      v52 = v55;
      -[UILabel _marqueeAnimationDelegate](v38);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setSuppressEnded:", 1);

      -[UIView layer](v35, "layer");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "removeAnimationForKey:", CFSTR("UILabelMarqueeLayerContentOriginXAnimationKey"));

      objc_msgSend(v54, "duration");
      if (v58 >= v46)
        v46 = v58;
      -[UIView layer](v35, "layer");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "mask");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v60, "animationForKey:", CFSTR("UILabelMarqueeMaskLayerWidthAnimationKey"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v61, "beginTime");
      v51 = v62;
      objc_msgSend(v60, "removeAnimationForKey:", CFSTR("UILabelMarqueeMaskLayerWidthAnimationKey"));
      objc_msgSend(v60, "animationForKey:", CFSTR("UILabelMarqueeMaskLayerPositionXAnimationKey"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "beginTime");
      v141 = v64;
      objc_msgSend(v60, "removeAnimationForKey:", CFSTR("UILabelMarqueeMaskLayerPositionXAnimationKey"));

    }
    else
    {
      v141 = v49 + 0.0;
      v51 = v49 + 0.0;
      v52 = v49 + 0.0;
    }
    v65 = v162;
    v66 = objc_opt_new();
    marqueeAnimations = v38->_marqueeAnimations;
    v38->_marqueeAnimations = (NSMutableDictionary *)v66;

    v68 = objc_opt_new();
    marqueeMaskAnimations = v38->_marqueeMaskAnimations;
    v38->_marqueeMaskAnimations = (NSMutableDictionary *)v68;

    -[UIView layer](v35, "layer");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "mask");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView layer](v35, "layer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "mask");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v73)
    {
      +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UILabelMarqueeMask.png"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "size");
      v75 = v51;
      v77 = 1.0 / v76;
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      v79 = objc_retainAutorelease(v74);
      objc_msgSend(v78, "setContents:", objc_msgSend(v79, "CGImage"));
      v80 = 0.5 - v77 * 0.5;
      v81 = v77;
      v51 = v75;
      v65 = v162;
      objc_msgSend(v78, "setContentsCenter:", v80, 0.0, v81, 1.0);
      objc_msgSend(v79, "scale");
      objc_msgSend(v78, "setContentsScale:");
      objc_msgSend(v78, "setFrame:", -v162, 0.0, v160, v153);
      -[UIView layer](v35, "layer");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setMask:", v78);

      v71 = v78;
    }
    p_isa = (id *)&v38->super.super.super.isa;
    v156 = v35;
    if (v6)
    {
      v83 = 1.0 - v36;
    }
    else
    {
      -[UILabel marqueeLoopPadding](v38, "marqueeLoopPadding");
      v83 = (v138 + v84) / v145;
    }
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("contentsRect.origin.x"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setBeginTime:", v52);
    objc_msgSend(v85, "setDuration:", v46);
    *(float *)&v86 = v48;
    objc_msgSend(v85, "setRepeatCount:", v86);
    v154 = v85;
    v87 = *MEMORY[0x1E0CD2B58];
    objc_msgSend(v85, "setFillMode:");
    v174[0] = &unk_1E1A9AD88;
    v174[1] = &unk_1E1A9AD88;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v83);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v174[2] = v88;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v83);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v174[3] = v89;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v174, 4);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v152 = v71;
    if (v6)
    {
      objc_msgSend(v90, "reverseObjectEnumerator");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "allObjects");
      v92 = objc_claimAutoreleasedReturnValue();

      v139 = v65;
      v90 = (void *)v92;
      v93 = obj;
    }
    else
    {
      v139 = 8.0;
      v93 = v65;
    }
    v146 = v90;
    objc_msgSend(v154, "setValues:", v90);
    v173[0] = &unk_1E1A96330;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.5 / v46);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v173[1] = v94;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - v143 / v46);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v173[2] = v95;
    v173[3] = &unk_1E1A96340;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v173, 4);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "setKeyTimes:", v96);

    -[UILabel _marqueeAnimationDelegate](v38);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "setDelegate:", v97);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v38->_marqueeAnimations, "setObject:forKeyedSubscript:", v154, CFSTR("UILabelMarqueeLayerContentOriginXAnimationKey"));
    -[UIView layer](v35, "layer");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "addAnimation:forKey:", v154, CFSTR("UILabelMarqueeLayerContentOriginXAnimationKey"));

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds.size.width"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setBeginTime:", v51);
    objc_msgSend(v99, "setDuration:", v46);
    *(float *)&v100 = v48;
    objc_msgSend(v99, "setRepeatCount:", v100);
    objc_msgSend(v99, "setFillMode:", v87);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v160 - v93 + 8.0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v160);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v172[0] = v101;
    v172[1] = v101;
    v172[2] = v102;
    v172[3] = v102;
    v172[4] = v101;
    v172[5] = v101;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 6);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setValues:", v103);

    v171[0] = &unk_1E1A96330;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.5 / v46);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v171[1] = v104;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.76666667 / v46);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v171[2] = v105;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - (v143 + 0.266666667) / v46);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v171[3] = v106;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - v143 / v46);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v171[4] = v107;
    v171[5] = &unk_1E1A96340;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v171, 6);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setKeyTimes:", v108);

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.x"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setBeginTime:", v141);
    objc_msgSend(v109, "setDuration:", v46);
    v110 = p_isa;
    objc_msgSend(v109, "setFillMode:", v87);
    *(float *)&v111 = v48;
    objc_msgSend(v109, "setRepeatCount:", v111);
    v112 = (void *)MEMORY[0x1E0CB37E8];
    v142 = v101;
    objc_msgSend(v101, "floatValue");
    objc_msgSend(v112, "numberWithDouble:", v113 * 0.5 - v139);
    v114 = objc_claimAutoreleasedReturnValue();
    v115 = (void *)MEMORY[0x1E0CB37E8];
    v140 = v102;
    objc_msgSend(v102, "floatValue");
    objc_msgSend(v115, "numberWithDouble:", v116 * 0.5 - v162);
    v117 = objc_claimAutoreleasedReturnValue();
    v170[0] = v114;
    v170[1] = v114;
    v170[2] = v117;
    v170[3] = v117;
    v136 = (void *)v117;
    v137 = (void *)v114;
    v170[4] = v114;
    v170[5] = v114;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 6);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setValues:", v118);

    objc_msgSend(v99, "keyTimes");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setKeyTimes:", v119);

    v120 = v152;
    objc_msgSend(v152, "addAnimation:forKey:", v99, CFSTR("UILabelMarqueeMaskLayerWidthAnimationKey"));
    v144 = v99;
    objc_msgSend(p_isa[85], "setObject:forKey:", v99, CFSTR("UILabelMarqueeMaskLayerWidthAnimationKey"));
    objc_msgSend(v152, "addAnimation:forKey:", v109, CFSTR("UILabelMarqueeMaskLayerPositionXAnimationKey"));
    objc_msgSend(p_isa[85], "setObject:forKey:", v109, CFSTR("UILabelMarqueeMaskLayerPositionXAnimationKey"));
    textLabelFlags = self->_textLabelFlags;
    if ((*(_DWORD *)&textLabelFlags & 0x10000000) != 0)
    {
      objc_msgSend(p_isa, "layer");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "_clearContents");

      textLabelFlags = self->_textLabelFlags;
    }
    if ((*(_WORD *)&textLabelFlags & 0x1000) == 0)
    {
      v166 = 0u;
      v167 = 0u;
      v168 = 0u;
      v169 = 0u;
      -[UILabel _siblingMarqueeLabels](p_isa);
      obja = (id)objc_claimAutoreleasedReturnValue();
      v163 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v166, v175, 16);
      if (v163)
      {
        v161 = *(_QWORD *)v167;
        do
        {
          for (i = 0; i != v163; ++i)
          {
            if (*(_QWORD *)v167 != v161)
              objc_enumerationMutation(obja);
            v124 = *(id **)(*((_QWORD *)&v166 + 1) + 8 * i);
            if (v124 != v110)
            {
              objc_msgSend(v124, "viewWithTag:", 4032914800);
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v125, "layer");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v126, "mask");
              v127 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v125, "layer");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v128, "animationForKey:", CFSTR("UILabelMarqueeLayerContentOriginXAnimationKey"));
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              v130 = (void *)objc_msgSend(v129, "copy");

              objc_msgSend(v127, "animationForKey:", CFSTR("UILabelMarqueeMaskLayerWidthAnimationKey"));
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              v132 = (void *)objc_msgSend(v131, "copy");

              objc_msgSend(v127, "animationForKey:", CFSTR("UILabelMarqueeMaskLayerPositionXAnimationKey"));
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              v134 = (void *)objc_msgSend(v133, "copy");

              objc_msgSend(v130, "setBeginTime:", v50);
              objc_msgSend(v132, "setBeginTime:", v50);
              objc_msgSend(v134, "setBeginTime:", v50);
              objc_msgSend(v125, "layer");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v135, "addAnimation:forKey:", v130, CFSTR("UILabelMarqueeLayerContentOriginXAnimationKey"));

              objc_msgSend(v127, "addAnimation:forKey:", v132, CFSTR("UILabelMarqueeMaskLayerWidthAnimationKey"));
              objc_msgSend(v127, "addAnimation:forKey:", v134, CFSTR("UILabelMarqueeMaskLayerPositionXAnimationKey"));

              v110 = p_isa;
            }
          }
          v163 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v166, v175, 16);
        }
        while (v163);
      }

      v120 = v152;
    }

  }
}

uint64_t __35__UILabel__applyBacklightLuminance__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __35__UILabel__applyBacklightLuminance__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  _QWORD v7[6];

  if (objc_msgSend(*(id *)(a1 + 32), "marqueeRunning"))
  {
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "_backlightLuminance");

    if (v3 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_stopMarqueeWithRedisplay:", 1);
      objc_msgSend(*(id *)(a1 + 32), "alpha");
      v5 = v4;
      objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
      v6 = *(double *)(a1 + 40);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __35__UILabel__applyBacklightLuminance__block_invoke_3;
      v7[3] = &unk_1E16B1888;
      v7[4] = *(_QWORD *)(a1 + 32);
      v7[5] = v5;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, v6);
    }
  }
}

uint64_t __35__UILabel__applyBacklightLuminance__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_stopMarqueeWithRedisplay:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableDictionary *marqueeAnimations;
  NSMutableDictionary *marqueeMaskAnimations;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  marqueeAnimations = self->_marqueeAnimations;
  self->_marqueeAnimations = 0;

  marqueeMaskAnimations = self->_marqueeMaskAnimations;
  self->_marqueeMaskAnimations = 0;

  -[UIView viewWithTag:](self, "viewWithTag:", 4032914800);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "removeFromSuperview");
    if (v3)
    {
      v9.receiver = self;
      v9.super_class = (Class)UILabel;
      -[UIView setNeedsDisplay](&v9, sel_setNeedsDisplay);
    }
  }

}

- (BOOL)marqueeRunning
{
  void *v2;
  BOOL v3;

  -[UIView viewWithTag:](self, "viewWithTag:", 4032914800);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)marqueeEnabled
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 1) >> 1) & 1;
}

- (unint64_t)marqueeRepeatCount
{
  return self->_marqueeRepeatCount;
}

- (double)marqueeLoopPadding
{
  return self->_marqueeLoopPadding;
}

- (BOOL)_isMarqueeUpdatable
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 1) >> 4) & 1;
}

- (void)setMarqueeRunning:(BOOL)a3
{
  uint64_t v4;

  v4 = 1024;
  if (!a3)
    v4 = 0;
  self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFBFFLL | v4);
  if (a3)
  {
    -[UILabel _startMarqueeIfNecessary](self, "_startMarqueeIfNecessary");
  }
  else if (-[UILabel marqueeRunning](self, "marqueeRunning"))
  {
    -[UILabel _stopMarqueeWithRedisplay:](self, "_stopMarqueeWithRedisplay:", 1);
  }
}

- (void)_ancestorWillUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "nextFocusedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8
    && -[UIView isDescendantOfView:](self, "isDescendantOfView:", v8)
    && -[UIView _tracksFocusedAncestors](self, "_tracksFocusedAncestors");
  -[UILabel setMarqueeRunning:](self, "setMarqueeRunning:", v9);
  v10.receiver = self;
  v10.super_class = (Class)UILabel;
  -[UIView _ancestorWillUpdateFocusInContext:withAnimationCoordinator:](&v10, sel__ancestorWillUpdateFocusInContext_withAnimationCoordinator_, v7, v6);

}

- (void)setDrawsUnderline:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[UILabel _content](self, "_content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)off_1E1679240;
  v10 = v5;
  objc_msgSend(v5, "defaultValueForAttribute:", *(_QWORD *)off_1E1679240);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (((((objc_msgSend(v7, "integerValue") & 1) == 0) ^ v3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentByApplyingAttributeToEntireRange:value:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setContent:](self, "_setContent:", v9);

  }
}

- (BOOL)drawsUnderline
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (self)
  {
    -[UILabel _content](self, "_content");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "defaultValueForAttribute:", *(_QWORD *)off_1E1679240);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      v4 = objc_msgSend(v3, "integerValue") & 1;
    else
      LOBYTE(v4) = 0;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_setUsesSimpleTextEffects:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  uint64_t v4;
  objc_super v5;

  textLabelFlags = self->_textLabelFlags;
  if (((((*(_QWORD *)&textLabelFlags & 0x20000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x20000;
    if (!a3)
      v4 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&textLabelFlags & 0xFFFFFFFFFFFDFFFFLL | v4);
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    -[UIView setNeedsDisplay](&v5, sel_setNeedsDisplay);
  }
}

- (BOOL)_usesSimpleTextEffects
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 2) >> 1) & 1;
}

- (void)_setTextAlignmentMirrored:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  uint64_t v4;
  objc_super v5;

  textLabelFlags = self->_textLabelFlags;
  if (((((*(_QWORD *)&textLabelFlags & 0x200000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x200000;
    if (!a3)
      v4 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&textLabelFlags & 0xFFFFFFFFFFDFFFFFLL | v4);
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    -[UIView setNeedsDisplay](&v5, sel_setNeedsDisplay);
  }
}

- (id)_tightBoundingBoxLayoutGuide
{
  UILayoutGuide *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  -[UILabel __tightBoundingBoxLayoutGuide](self);
  v3 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(UILayoutGuide);
    -[UIView addLayoutGuide:](self, "addLayoutGuide:", v3);
    -[UILayoutGuide _setLockedToOwningView:](v3, "_setLockedToOwningView:", 1);
    -[UILayoutGuide _setAllowsNegativeDimensions:](v3, "_setAllowsNegativeDimensions:", 1);
    -[UILayoutGuide setIdentifier:](v3, "setIdentifier:", CFSTR("UILabelTightBoundingBoxLayoutGuide"));
    -[UIView _frameLayoutItem](self, "_frameLayoutItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v3, "topAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILayoutGuide leftAnchor](v3, "leftAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leftAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "rightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide rightAnchor](v3, "rightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setIdentifier:", CFSTR("UILabelTightBoundingBoxLayoutGuide-top"));
    objc_msgSend(v10, "setIdentifier:", CFSTR("UILabelTightBoundingBoxLayoutGuide-left"));
    objc_msgSend(v13, "setIdentifier:", CFSTR("UILabelTightBoundingBoxLayoutGuide-bottom"));
    objc_msgSend(v16, "setIdentifier:", CFSTR("UILabelTightBoundingBoxLayoutGuide-right"));
    v19[0] = v7;
    v19[1] = v10;
    v19[2] = v13;
    v19[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide _setSystemConstraints:](v3, "_setSystemConstraints:", v17);
    -[UILabel _updateTightBoundingBoxLayoutGuideConstraintsIfNecessary](self);
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v17);
    if (self)
      objc_setAssociatedObject(self, &kTightBoudingBoxLayoutGuideKey, v3, (void *)1);

  }
  return v3;
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  double v3;
  id v4;

  -[UIView layer](self, "layer", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v4, "setSpeed:", v3);
  objc_msgSend(v4, "setTimeOffset:", CACurrentMediaTime());

}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  double v3;
  id v4;

  -[UIView layer](self, "layer", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v4, "setSpeed:", v3);
  objc_msgSend(v4, "setTimeOffset:", 0.0);

}

- (UIColor)highlightedTextColor
{
  return self->_highlightedColor;
}

- (UIFont)_fontForShortcutBaselineCalculation
{
  return self->_fontForShortcutBaselineCalculation;
}

- (UILabelVibrancy)preferredVibrancy
{
  return self->_preferredVibrancy;
}

- (_UILabelConfiguration)_configuration
{
  return self->__configuration;
}

- (void)_setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->__configuration, a3);
}

- (_UIIntelligenceLightSourceDescriptor)_lightSourceDescriptor
{
  return self->_lightSourceDescriptor;
}

- (void)_setLightSourceDescriptor:(id)a3
{
  _UIIntelligenceLightSourceDescriptor *v5;
  void *v6;
  _UIIntelligenceLightSourceDescriptor *v7;

  v5 = (_UIIntelligenceLightSourceDescriptor *)a3;
  if (self->_lightSourceDescriptor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_lightSourceDescriptor, a3);
    -[UILabel _removeLightSourceView](self, "_removeLightSourceView");
    v5 = v7;
    if (v7)
    {
      -[UILabel _addLightSourceView](self, "_addLightSourceView");
      v5 = v7;
    }
    if ((*((_BYTE *)&self->_textLabelFlags + 3) & 0x10) != 0)
    {
      -[UIView layer](self, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reactToLightChanged");

      v5 = v7;
    }
  }

}

- (void)_addLightSourceView
{
  UIView *v3;
  UIView *lightContainerView;
  _UIIntelligenceLightSourceDescriptor *lightSourceDescriptor;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[10];

  v35[8] = *MEMORY[0x1E0C80C00];
  if (self->_lightSourceDescriptor)
  {
    v3 = (UIView *)objc_opt_new();
    lightContainerView = self->_lightContainerView;
    self->_lightContainerView = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_lightContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self, "addSubview:", self->_lightContainerView);
    lightSourceDescriptor = self->_lightSourceDescriptor;
    -[UIView frame](self, "frame");
    -[_UIIntelligenceLightSourceDescriptor _createLightSourceViewWithFrame:usage:](lightSourceDescriptor, "_createLightSourceViewWithFrame:usage:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_lightContainerView, "addSubview:", v6);
    v24 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(v6, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_lightContainerView, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v31;
    objc_msgSend(v6, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_lightContainerView, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v28;
    objc_msgSend(v6, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_lightContainerView, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v25;
    v34 = v6;
    objc_msgSend(v6, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_lightContainerView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v21;
    -[UIView topAnchor](self->_lightContainerView, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v18;
    -[UIView leadingAnchor](self->_lightContainerView, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v35[5] = v7;
    -[UIView trailingAnchor](self->_lightContainerView, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35[6] = v10;
    -[UIView bottomAnchor](self->_lightContainerView, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[7] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v14);

    if ((*((_BYTE *)&self->_textLabelFlags + 3) & 0x10) != 0)
    {
      -[UIView layer](self, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLightContainerView:", self->_lightContainerView);

    }
  }
}

- (void)_removeLightSourceView
{
  UIView *lightContainerView;
  id v4;

  -[UIView removeFromSuperview](self->_lightContainerView, "removeFromSuperview");
  lightContainerView = self->_lightContainerView;
  self->_lightContainerView = 0;

  if ((*((_BYTE *)&self->_textLabelFlags + 3) & 0x10) != 0)
  {
    -[UIView layer](self, "layer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLightContainerView:", 0);

  }
}

- (void)_addViewsForLabelViewTextAttachments:(id)a3 previousLabelViewTextAttachments:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToArray:", v7) & 1) == 0)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = v7;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeFromSuperview");

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v10);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v6;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      v18 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v20, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = v18;
          v25[1] = 3221225472;
          v25[2] = __124__UILabel_UILabel_Internal_IntelligenceLightSupport___addViewsForLabelViewTextAttachments_previousLabelViewTextAttachments___block_invoke;
          v25[3] = &unk_1E16EA4A8;
          v26 = v21;
          v22 = v21;
          objc_msgSend(v20, "setLayoutInRect:", v25);
          -[UIView addSubview:](self, "addSubview:", v22);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v16);
    }

    v7 = v23;
    v6 = v24;
  }

}

uint64_t __124__UILabel_UILabel_Internal_IntelligenceLightSupport___addViewsForLabelViewTextAttachments_previousLabelViewTextAttachments___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:");
}

- (BOOL)_drawingLightReactiveLayer
{
  return *((_BYTE *)&self->_textLabelFlags + 5) & 1;
}

- (void)_setDrawingLightReactiveLayer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)_drawingLightInertLayer
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 5) >> 1) & 1;
}

- (void)_setDrawingLightInertLayer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&self->_textLabelFlags & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (double)_firstLineCapFrameOriginY
{
  double v3;
  double v4;
  double v5;

  -[UIView frame](self, "frame");
  v4 = v3;
  -[UILabel _capOffsetFromBoundsTop](self, "_capOffsetFromBoundsTop");
  return v5 + v4;
}

- (void)_setLastLineBaselineFrameOriginY:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[UIView frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel _lastLineBaseline](self, "_lastLineBaseline");
  -[UILabel setFrame:](self, "setFrame:", v6, a3 - v11, v8, v10);
}

- (void)_setWantsContentAwareTypesettingLanguage:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  uint64_t v4;

  textLabelFlags = self->_textLabelFlags;
  if (((((*(_QWORD *)&textLabelFlags & 0x1000000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x1000000000;
    if (!a3)
      v4 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&textLabelFlags & 0xFFFFFFEFFFFFFFFFLL | v4);
    -[UILabel _adjustFontForTypesettingLanguage](self);
  }
}

- (void)_setVerticalTextEnabled:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags;
  _UILabelVerticalTextLayoutManager *v5;
  uint64_t v6;
  _UILabelVerticalTextLayoutManager *v7;

  textLabelFlags = self->_textLabelFlags;
  if (((((*(_QWORD *)&textLabelFlags & 0x8000000000) == 0) ^ a3) & 1) == 0)
  {
    v5 = 0;
    v6 = 0x8000000000;
    if (!a3)
      v6 = 0;
    self->_textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(_QWORD *)&textLabelFlags & 0xFFFFFF7FFFFFFFFFLL | v6);
    if (a3)
      v5 = -[_UILabelVerticalTextLayoutManager initWithConfiguration:]([_UILabelVerticalTextLayoutManager alloc], "initWithConfiguration:", self->_configuration);
    v7 = v5;
    objc_setAssociatedObject(self, &kTextLayoutManagerKey, v5, (void *)1);
    -[UILabel _invalidateLabelDisplay](self);
    -[UILabel _invalidateLabelSize](self, "_invalidateLabelSize");

  }
}

- (BOOL)_verticalTextEnabled
{
  return *((unsigned __int8 *)&self->_textLabelFlags + 4) >> 7;
}

- (BOOL)_wantsUnderlineForAccessibilityButtonShapesEnabled
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 2) >> 2) & 1;
}

- (void)_resetUsesExplicitPreferredMaxLayoutWidth
{
  int v3;

  v3 = -[UILabel _needsDoubleUpdateConstraintsPass](self, "_needsDoubleUpdateConstraintsPass");
  *(_QWORD *)&self->_textLabelFlags &= ~0x2000uLL;
  self->_preferredMaxLayoutWidth = 0.0;
  -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v3);
  -[UILabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)textSizeForWidth:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UILabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0, a3, 3.40282347e38);
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setRawSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)rawSize
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

@end
