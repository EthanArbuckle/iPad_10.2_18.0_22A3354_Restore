@implementation PXCuratedLibrarySectionHeaderLayout

uint64_t __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRect:inLayout:", *(_QWORD *)(a1 + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  _BOOL8 v8;
  PXCuratedLibrarySectionHeaderLayout *v9;
  unint64_t v10;
  PXGNamedImageViewConfiguration *v15;
  _BOOL8 v16;
  void *v18;
  PXGTitleSubtitleViewConfiguration *v19;
  void *v20;
  void *v21;
  PXCuratedLibrarySectionHeaderLayout *v22;
  void *v23;
  PXZoomableInlineHeaderViewConfiguration *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  -[NSArray objectAtIndexedSubscript:](self->_itemIdentifierBySpriteIndex, "objectAtIndexedSubscript:", a3, a4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButton")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground"))
  {
    v8 = v5 == CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground");
    v9 = self;
    v10 = 0;
LABEL_52:
    -[PXCuratedLibrarySectionHeaderLayout _configurationForButton:overBackgroundVariant:](v9, "_configurationForButton:overBackgroundVariant:", v10, v8);
    v15 = (PXGNamedImageViewConfiguration *)objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterButton")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground"))
  {
    v8 = v5 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground");
    v9 = self;
    v10 = 1;
    goto LABEL_52;
  }
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButton")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButtonOverBackground"))
  {
    v8 = v5 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButtonOverBackground");
    v9 = self;
    v10 = 2;
    goto LABEL_52;
  }
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectButton")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground"))
  {
    v8 = v5 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground");
    v9 = self;
    v10 = 3;
    goto LABEL_52;
  }
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemCancelButton")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground"))
  {
    v8 = v5 == CFSTR("PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground");
    v9 = self;
    v10 = 4;
    goto LABEL_52;
  }
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButton")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground"))
  {
    v16 = v5 == CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground");
    v10 = -[PXCuratedLibrarySectionHeaderLayout toggleAspectFitButton](self, "toggleAspectFitButton");
    v9 = self;
    v8 = v16;
    goto LABEL_52;
  }
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButton")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground"))
  {
    v8 = v5 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground");
    v9 = self;
    v10 = 7;
    goto LABEL_52;
  }
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButton")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground"))
  {
    v8 = v5 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground");
    v9 = self;
    v10 = 8;
    goto LABEL_52;
  }
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButton")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground"))
  {
    v8 = v5 == CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground");
    v9 = self;
    v10 = 9;
    goto LABEL_52;
  }
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButton")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground"))
  {
    v8 = v5 == CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground");
    v9 = self;
    v10 = 10;
    goto LABEL_52;
  }
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitle")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitleOverBackground"))
  {
    -[PXCuratedLibrarySectionHeaderLayout effectiveSpec](self, "effectiveSpec");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "requiresTitleRenderedAsView"))
    {
      v19 = objc_alloc_init(PXGTitleSubtitleViewConfiguration);
      -[PXCuratedLibrarySectionHeaderLayout title](self, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGTitleSubtitleViewConfiguration setTitle:](v19, "setTitle:", v20);

      -[PXCuratedLibrarySectionHeaderLayout subtitle](self, "subtitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGTitleSubtitleViewConfiguration setSubtitle:](v19, "setSubtitle:", v21);

      v22 = self;
      v15 = (PXGNamedImageViewConfiguration *)v19;
      -[PXCuratedLibrarySectionHeaderLayout _titleSubtitleSpecForItemIdentifier:](v22, "_titleSubtitleSpecForItemIdentifier:", v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGNamedImageViewConfiguration setSpec:](v15, "setSpec:", v23);
    }
    else
    {
      v24 = [PXZoomableInlineHeaderViewConfiguration alloc];
      -[PXCuratedLibrarySectionHeaderLayout title](self, "title");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibrarySectionHeaderLayout subtitle](self, "subtitle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibrarySectionHeaderLayout spec](self, "spec");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PXZoomableInlineHeaderViewConfiguration initWithTitle:subtitle:swapTitleAndSubtitle:style:](v24, "initWithTitle:subtitle:swapTitleAndSubtitle:style:", v23, v25, 0, objc_msgSend(v26, "inlineHeaderStyle"));

    }
    goto LABEL_59;
  }
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemGradient"))
  {
    -[PXCuratedLibrarySectionHeaderLayout spec](self, "spec");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "headerGradientImageConfiguration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "imageName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "px_bundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PXGNamedImageViewConfiguration initWithImageName:contentMode:bundle:]([PXGNamedImageViewConfiguration alloc], "initWithImageName:contentMode:bundle:", v29, 0, v30);
    -[PXGNamedImageViewConfiguration setContentMode:](v15, "setContentMode:", 0);

    goto LABEL_53;
  }
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectionTitle")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectionTitleOverBackground"))
  {
    -[PXCuratedLibrarySectionHeaderLayout _titleSubtitleSpecForItemIdentifier:](self, "_titleSubtitleSpecForItemIdentifier:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayout selectionTitle](self, "selectionTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayout _selectionTitleLabelConfigurationWithTitle:spec:](self, "_selectionTitleLabelConfigurationWithTitle:spec:", v23, v18);
    v15 = (PXGNamedImageViewConfiguration *)objc_claimAutoreleasedReturnValue();
LABEL_59:

    goto LABEL_53;
  }
  v15 = 0;
LABEL_53:

  return v15;
}

- (id)_configurationForButton:(unint64_t)a3 overBackgroundVariant:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  void *v9;

  v4 = a4;
  -[PXCuratedLibrarySectionHeaderLayout _configurationForButton:](self, "_configurationForButton:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout visibleRect](self, "visibleRect");
  if (v8 >= 0.0)
    objc_msgSend(v7, "setForcePointerInteractionEnabled:", 1);
  if (a3 == 2)
  {
    if (-[PXCuratedLibrarySectionHeaderLayout filterIndicatorButtonHighlighted](self, "filterIndicatorButtonHighlighted"))
    {
      return v7;
    }
  }
  else if (!a3 && -[PXCuratedLibrarySectionHeaderLayout ellipsisButtonHighlighted](self, "ellipsisButtonHighlighted"))
  {
    return v7;
  }
  if (a3 != 1 && v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v9);

  }
  return v7;
}

- (id)_configurationForButton:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[PXCuratedLibrarySectionHeaderLayout effectiveSpec](self, "effectiveSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionHeaderLayout configurationForButton:spec:](self, "configurationForButton:spec:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)effectiveSpec
{
  return self->_effectiveSpec;
}

- (id)configurationForButton:(unint64_t)a3 spec:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  id location;

  v6 = a4;
  switch(a3)
  {
    case 0uLL:
      if (-[PXCuratedLibrarySectionHeaderLayout ellipsisButtonHighlighted](self, "ellipsisButtonHighlighted"))
        v7 = 14;
      else
        v7 = 0;
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithButtonType:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithButtonType:spec:", 1, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibrarySectionHeaderLayout ellipsisButtonActionPerformer](self, "ellipsisButtonActionPerformer");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 1uLL:
      if (-[PXCuratedLibrarySectionHeaderLayout filterButtonHighlighted](self, "filterButtonHighlighted"))
        v7 = 12;
      else
        v7 = 10;
      -[PXCuratedLibrarySectionHeaderLayout filterButtonTitle](self, "filterButtonTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithButtonType:title:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithButtonType:title:spec:", 4, v12, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXCuratedLibrarySectionHeaderLayout filterButtonCaption](self, "filterButtonCaption");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCaption:", v13);

      goto LABEL_19;
    case 2uLL:
      v14 = -[PXCuratedLibrarySectionHeaderLayout filterIndicatorButtonHighlighted](self, "filterIndicatorButtonHighlighted");
      if (v14)
        v7 = 13;
      else
        v7 = 0;
      if (v14)
        v15 = 6;
      else
        v15 = 5;
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithButtonType:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithButtonType:spec:", v15, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
      -[PXCuratedLibrarySectionHeaderLayout showFiltersActionPerformer](self, "showFiltersActionPerformer");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v16 = (void *)v9;
      objc_msgSend(v8, "setActionPerformer:", v9);

      break;
    case 3uLL:
      -[PXCuratedLibrarySectionHeaderLayout selectButtonTitle](self, "selectButtonTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithTitle:spec:", v17, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXCuratedLibrarySectionHeaderLayout selectButtonActionPerformer](self, "selectButtonActionPerformer");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 4uLL:
      PXLocalizedStringFromTable(CFSTR("PXCuratedLibraryCancelSelectionButtonTitle"), CFSTR("PhotosUICore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithTitle:spec:", v10, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXCuratedLibrarySectionHeaderLayout cancelButtonActionPerformer](self, "cancelButtonActionPerformer");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 5uLL:
      -[PXCuratedLibrarySectionHeaderLayout toggleAspectFitButtonTitle](self, "toggleAspectFitButtonTitle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithTitle:spec:", v18, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXCuratedLibrarySectionHeaderLayout toggleAspectFitButtonActionPerformer](self, "toggleAspectFitButtonActionPerformer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setActionPerformer:", v19);

      -[PXCuratedLibrarySectionHeaderLayout toggleAspectFitButtonPossibleTitles](self, "toggleAspectFitButtonPossibleTitles");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPossibleTitles:", v20);
      goto LABEL_30;
    case 6uLL:
      v21 = -[PXCuratedLibrarySectionHeaderLayout toggleAspectFitCompactButtonSymbol](self, "toggleAspectFitCompactButtonSymbol");
      v22 = 7;
      if (v21 != 1)
        v22 = 0;
      if (v21)
        v23 = v22;
      else
        v23 = 8;
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithButtonType:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithButtonType:spec:", v23, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibrarySectionHeaderLayout toggleAspectFitButtonActionPerformer](self, "toggleAspectFitButtonActionPerformer");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_29:
      v20 = (void *)v11;
      objc_msgSend(v8, "setActionPerformer:", v11);
LABEL_30:

      v7 = 0;
      break;
    case 7uLL:
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithSystemImageName:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithSystemImageName:spec:", CFSTR("plus"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PXEdgeInsetsMake();
      objc_msgSend(v8, "setImageEdgeInsets:");
      objc_msgSend(v8, "setSegment:", 2);
      -[PXCuratedLibrarySectionHeaderLayout zoomInButtonActionPerformer](self, "zoomInButtonActionPerformer");
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    case 8uLL:
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithSystemImageName:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithSystemImageName:spec:", CFSTR("minus"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PXEdgeInsetsMake();
      objc_msgSend(v8, "setImageEdgeInsets:");
      objc_msgSend(v8, "setSegment:", 1);
      -[PXCuratedLibrarySectionHeaderLayout zoomOutButtonActionPerformer](self, "zoomOutButtonActionPerformer");
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_33:
      v25 = (void *)v24;
      objc_msgSend(v8, "setActionPerformer:", v24);

      v7 = 6;
      break;
    case 9uLL:
      v26 = -[PXCuratedLibrarySectionHeaderLayout controlStackButtonSelected](self, "controlStackButtonSelected");
      if (v26)
        v27 = CFSTR("xmark");
      else
        v27 = CFSTR("plus.slash.minus");
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithSystemImageName:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithSystemImageName:spec:", v27, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __67__PXCuratedLibrarySectionHeaderLayout_configurationForButton_spec___block_invoke;
      v34 = &unk_1E5148D30;
      objc_copyWeak(&v35, &location);
      objc_msgSend(v8, "setActionHandler:", &v31);
      if (v26)
        v7 = 8;
      else
        v7 = 0;
      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
      break;
    case 0xAuLL:
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithSystemImageName:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithSystemImageName:spec:", CFSTR("sidebar.leading"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibrarySectionHeaderLayout showSidebarButtonActionPerformer](self, "showSidebarButtonActionPerformer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setActionPerformer:", v28);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTintColor:", v29);

      v7 = 2;
      break;
    default:
      v7 = 0;
      v8 = 0;
      break;
  }
  objc_msgSend(v8, "setStyle:", v7, v31, v32, v33, v34);

  return v8;
}

- (BOOL)ellipsisButtonHighlighted
{
  return self->_ellipsisButtonHighlighted;
}

- (NSString)selectButtonTitle
{
  return self->_selectButtonTitle;
}

- (id)axSpriteIndexes
{
  return (id)-[NSMutableIndexSet copy](self->_axSpriteIndexes, "copy");
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  void *v8;
  void *v9;

  -[NSArray objectAtIndexedSubscript:](self->_itemIdentifierBySpriteIndex, "objectAtIndexedSubscript:", a3, a4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitle")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitleOverBackground"))
  {
    -[PXCuratedLibrarySectionHeaderLayout spec](self, "spec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requiresTitleRenderedAsView");

  }
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v9;
}

- (void)_updateLastBaseline
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[PXCuratedLibrarySectionHeaderLayout buttonsMaxY](self, "buttonsMaxY");
  v4 = v3;
  -[PXCuratedLibrarySectionHeaderLayout titleSubtitleTopSpacing](self, "titleSubtitleTopSpacing");
  v6 = v5;
  -[PXCuratedLibrarySectionHeaderLayout titleSubtitleLastBaseline](self, "titleSubtitleLastBaseline");
  v8 = v6 + v7;
  if (v4 >= v8)
    v8 = v4;
  -[PXGLayout setLastBaseline:](self, "setLastBaseline:", v8);
}

- (double)titleSubtitleTopSpacing
{
  return self->_titleSubtitleTopSpacing;
}

- (double)titleSubtitleLastBaseline
{
  return self->_titleSubtitleLastBaseline;
}

- (double)buttonsMaxY
{
  return self->_buttonsMaxY;
}

- (void)setLateralMargin:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_lateralMargin != a3)
  {
    self->_lateralMargin = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setLateralMargin:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1174, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setWantsOverBackgroundAppearance:(BOOL)a3
{
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  _QWORD aBlock[5];

  if (self->_wantsOverBackgroundAppearance != a3)
  {
    self->_wantsOverBackgroundAppearance = a3;
    if (a3)
      v4 = 1.0;
    else
      v4 = 0.0;
    -[PXCuratedLibrarySectionHeaderLayout alternateAppearanceMixAnimator](self, "alternateAppearanceMixAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PXCuratedLibrarySectionHeaderLayout_setWantsOverBackgroundAppearance___block_invoke;
    aBlock[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&aBlock[4] = v4;
    v6 = _Block_copy(aBlock);
    objc_msgSend(v5, "presentationValue");
    v8 = v7;
    if (self->_presentedTitleVisibility)
    {
      v9 = 0;
    }
    else
    {
      -[PXCuratedLibrarySectionHeaderLayout titleAlpha](self, "titleAlpha");
      v9 = v10 > 0.0;
    }
    if (!self->_presentedVisibility
      || v9
      || v4 == v8
      || (-[PXCuratedLibrarySectionHeaderLayout effectiveSpec](self, "effectiveSpec"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "userInterfaceStyle"),
          v11,
          v12 == 2))
    {
      objc_msgSend(v5, "performChangesWithoutAnimation:", v6);
    }
    else
    {
      +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatingHeadersAppearanceCrossfadeDuration");
      v15 = vabdd_f64(v4, v8) * v14;

      objc_msgSend(v5, "performChangesWithDuration:curve:changes:", 1, v6, v15);
    }

  }
}

- (void)setTitleAlpha:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_titleAlpha != a3)
  {
    self->_titleAlpha = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setTitleAlpha:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1636, CFSTR("invalidating %lu after it already has been updated"), 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 2;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

void __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke_3(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unsigned int v6;
  uint64_t v8;
  __CFString *v9;
  __n128 v10;
  __CFString *v11;
  uint64_t v13;
  float v15;
  BOOL v24;
  uint64_t v25;
  float v26;
  uint64_t v27;
  uint64_t v29;

  v4 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v6 = a2;
    v29 = a1 + 40;
    v8 = a1 + 48;
    while (1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 896), "objectAtIndexedSubscript:", v6);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      if (v9 == CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitle")
        || v9 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectionTitle"))
      {
        break;
      }
      if (v9 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectionTitleOverBackground")
        || v9 == CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitleOverBackground"))
      {
        v13 = *(_QWORD *)(a1 + 48);
        goto LABEL_15;
      }
      v24 = v9 == CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButton")
         || v9 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButton")
         || v9 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButton")
         || v9 == CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButton")
         || v9 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectButton")
         || v9 == CFSTR("PXCuratedLibrarySectionHeaderItemCancelButton")
         || v9 == CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButton")
         || v9 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButton")
         || v9 == CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButton")
         || v9 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterButton");
      v25 = v29;
      if (v24)
        goto LABEL_59;
      v25 = v8;
      if (v9 == CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground"))
        goto LABEL_59;
      v25 = v8;
      if (v9 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButtonOverBackground"))
        goto LABEL_59;
      v25 = v8;
      if (v9 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground")
        || (v25 = v8, v9 == CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground"))
        || (v25 = v8, v9 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground"))
        || (v25 = v8, v9 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground"))
        || (v25 = v8, v9 == CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground"))
        || (v25 = v8, v9 == CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground"))
        || (v25 = v8, v9 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground"))
        || (v25 = v8, v9 == CFSTR("PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground")))
      {
LABEL_59:
        v26 = (*(double (**)(double))(*(_QWORD *)v25 + 16))(*(double *)(a1 + 64));
        *(float *)(a4 + 160 * v6) = v26;
        *(double *)(a3 + 32 * v6 + 16) = *(float *)(a1 + 72);
        goto LABEL_17;
      }
      if (v9 == CFSTR("PXCuratedLibrarySectionHeaderItemGradient"))
      {
        v27 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "gradientAlpha");
        v13 = v27;
        goto LABEL_16;
      }
LABEL_17:

      ++v6;
      if (!--v4)
        return;
    }
    v13 = *(_QWORD *)(a1 + 40);
LABEL_15:
    v10.n128_u64[0] = *(_QWORD *)(a1 + 56);
LABEL_16:
    v15 = (*(double (**)(__n128))(v13 + 16))(v10);
    *(float *)(a4 + 160 * v6) = v15;
    goto LABEL_17;
  }
}

double __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke(uint64_t a1, double a2)
{
  return (1.0 - *(double *)(a1 + 32)) * a2;
}

double __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke_2(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) * a2;
}

void __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  __CFString *v11;
  __CFString *v12;
  CGFloat v14;
  CGFloat v15;
  char v16;
  CGFloat v17;
  CGFloat v18;
  float32x2_t *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  int v34;
  int v35;
  int v36;
  int v37;
  double v38;
  float32x4_t v39;
  BOOL v40;
  __int128 *v41;
  float32x2_t *v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  float64x2_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  float32x2_t v59;
  __int128 v60;
  char IsEmpty;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  int v65;
  char v66;
  __int128 v67;
  char v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  float32x2_t *v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  float64x2_t v79;
  _OWORD *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  __int128 v87;
  double v88;
  double v89;
  double v90;
  double v91;
  float32x2_t *v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  float64x2_t v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  float32x2_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  __int128 v111;
  __CFString *v112;
  void *v113;
  id v114;
  void (**v115)(void *, const __CFString *, const __CFString *, _QWORD, uint64_t, double, double, double, double);
  float32x4_t v116;
  char v118;
  CGFloat Width;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  __int128 *v123;
  __int128 *v124;
  _QWORD v126[4];
  id v127;
  _QWORD aBlock[4];
  __CFString *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  __int128 v136;
  __int128 v137;
  unsigned int v138;
  __int128 v139;
  __int128 v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;

  v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v7 = a4;
    v8 = a3;
    v9 = a2;
    v123 = (__int128 *)(a1 + 120);
    v116 = *(float32x4_t *)off_1E50B81E8;
    v124 = (__int128 *)(a1 + 216);
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 896), "objectAtIndexedSubscript:", v9, *(_OWORD *)&v116);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 == CFSTR("PXCuratedLibrarySectionHeaderItemGradient"))
      {
        v19 = (float32x2_t *)(v8 + 32 * v9);
        v20 = *(double *)(a1 + 48);
        v21 = *(double *)(a1 + 56);
        v22 = *(double *)(a1 + 64);
        v23 = *(double *)(a1 + 72);
        v141.origin.x = v20;
        v141.origin.y = v21;
        v141.size.width = v22;
        v141.size.height = v23;
        MidX = CGRectGetMidX(v141);
        v142.origin.x = v20;
        v142.origin.y = v21;
        v142.size.width = v22;
        v142.size.height = v23;
        MidY = CGRectGetMidY(v142);
        v143.origin.x = v20;
        v143.origin.y = v21;
        v143.size.width = v22;
        v143.size.height = v23;
        Width = CGRectGetWidth(v143);
        v144.origin.x = v20;
        v144.origin.y = v21;
        v144.size.width = v22;
        v144.size.height = v23;
        Height = CGRectGetHeight(v144);
        v27.f64[0] = Width;
        v27.f64[1] = Height;
        *(CGFloat *)v19 = MidX;
        *(CGFloat *)&v19[1] = MidY;
        v19[3] = vcvt_f32_f64(v27);
        v19[2] = (float32x2_t)0xBFECCCCCCCCCCCCDLL;
        v28 = v7 + 160 * v9;
        v29 = *((_OWORD *)off_1E50B83A0 + 7);
        *(_OWORD *)(v28 + 96) = *((_OWORD *)off_1E50B83A0 + 6);
        *(_OWORD *)(v28 + 112) = v29;
        v30 = *((_OWORD *)off_1E50B83A0 + 9);
        *(_OWORD *)(v28 + 128) = *((_OWORD *)off_1E50B83A0 + 8);
        *(_OWORD *)(v28 + 144) = v30;
        v31 = *((_OWORD *)off_1E50B83A0 + 3);
        *(_OWORD *)(v28 + 32) = *((_OWORD *)off_1E50B83A0 + 2);
        *(_OWORD *)(v28 + 48) = v31;
        v32 = *((_OWORD *)off_1E50B83A0 + 5);
        *(_OWORD *)(v28 + 64) = *((_OWORD *)off_1E50B83A0 + 4);
        *(_OWORD *)(v28 + 80) = v32;
        v33 = *((_OWORD *)off_1E50B83A0 + 1);
        *(_OWORD *)v28 = *(_OWORD *)off_1E50B83A0;
        *(_OWORD *)(v28 + 16) = v33;
        objc_msgSend(*(id *)(a1 + 40), "cornerRadius");
        *(_DWORD *)(v28 + 36) = v34;
        *(_DWORD *)(v28 + 40) = v35;
        *(_DWORD *)(v28 + 44) = v36;
        *(_DWORD *)(v28 + 48) = v37;
        if (CGRectIsNull(*(CGRect *)(a1 + 80)))
        {
          v38 = *(double *)(a1 + 112);
          v39 = v116;
        }
        else
        {
          IsEmpty = PXSizeIsEmpty();
          v38 = 0.0;
          if ((IsEmpty & 1) == 0)
            v38 = *(double *)(a1 + 112);
          v39 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 80)), *(float64x2_t *)(a1 + 96));
        }
        v41 = v123;
        v62 = v7 + 160 * v9;
        *(float32x4_t *)(v62 + 20) = v39;
        objc_msgSend(*(id *)(a1 + 32), "setGradientAlpha:", v38);
        *(_WORD *)(v62 + 68) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 920);
        v63 = a5 + 40 * v9;
        v64 = *((_OWORD *)off_1E50B8398 + 1);
        *(_OWORD *)v63 = *(_OWORD *)off_1E50B8398;
        *(_OWORD *)(v63 + 16) = v64;
        *(_QWORD *)(v63 + 32) = *((_QWORD *)off_1E50B8398 + 4);
        v65 = objc_msgSend(*(id *)(a1 + 40), "requiresTitleRenderedAsView");
        *(_BYTE *)v63 = v65;
        if (v65)
          v66 = 10;
        else
          v66 = 1;
        *(_BYTE *)(v63 + 1) = v66;
        v67 = v123[1];
        v139 = *v123;
        v140 = v67;
        *(_QWORD *)(v63 + 24) = PXGSectionedSpriteTagMake();
        v8 = a3;
      }
      else if (v11 == CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitle")
             || v11 == CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitleOverBackground"))
      {
        if (objc_msgSend(*(id *)(a1 + 40), "requiresTitleRenderedAsView"))
        {
          v14 = *(double *)(a1 + 152);
          v15 = *(double *)(a1 + 160);
          v118 = 10;
          v16 = 1;
          v17 = *(double *)(a1 + 168);
          v18 = *(double *)(a1 + 176);
        }
        else
        {
          v68 = objc_msgSend(*(id *)(a1 + 40), "wantsInlineHeader");
          v14 = *(double *)(a1 + 152);
          v15 = *(double *)(a1 + 160);
          v17 = *(double *)(a1 + 168);
          v18 = *(double *)(a1 + 176);
          if ((v68 & 1) != 0)
          {
            v118 = 10;
            v16 = 1;
          }
          else
          {
            PXEdgeInsetsInsetRect();
            v14 = v88;
            v15 = v89;
            v17 = v90;
            v18 = v91;
            v16 = 0;
            v118 = 4;
          }
        }
        v8 = a3;
        v92 = (float32x2_t *)(a3 + 32 * v9);
        v153.origin.x = v14;
        v153.origin.y = v15;
        v153.size.width = v17;
        v153.size.height = v18;
        v93 = CGRectGetMidX(v153);
        v154.origin.x = v14;
        v154.origin.y = v15;
        v154.size.width = v17;
        v154.size.height = v18;
        v94 = CGRectGetMidY(v154);
        v155.origin.x = v14;
        v155.origin.y = v15;
        v155.size.width = v17;
        v155.size.height = v18;
        v122 = CGRectGetWidth(v155);
        v156.origin.x = v14;
        v156.origin.y = v15;
        v156.size.width = v17;
        v156.size.height = v18;
        v95 = CGRectGetHeight(v156);
        v96.f64[0] = v122;
        v96.f64[1] = v95;
        *(CGFloat *)v92 = v93;
        *(CGFloat *)&v92[1] = v94;
        v92[3] = vcvt_f32_f64(v96);
        v92[2] = (float32x2_t)0xBFF0000000000000;
        v97 = a4 + 160 * v9;
        v98 = *((_OWORD *)off_1E50B83A0 + 7);
        *(_OWORD *)(v97 + 96) = *((_OWORD *)off_1E50B83A0 + 6);
        *(_OWORD *)(v97 + 112) = v98;
        v99 = *((_OWORD *)off_1E50B83A0 + 9);
        *(_OWORD *)(v97 + 128) = *((_OWORD *)off_1E50B83A0 + 8);
        *(_OWORD *)(v97 + 144) = v99;
        v100 = *((_OWORD *)off_1E50B83A0 + 3);
        *(_OWORD *)(v97 + 32) = *((_OWORD *)off_1E50B83A0 + 2);
        *(_OWORD *)(v97 + 48) = v100;
        v101 = *((_OWORD *)off_1E50B83A0 + 5);
        *(_OWORD *)(v97 + 64) = *((_OWORD *)off_1E50B83A0 + 4);
        *(_OWORD *)(v97 + 80) = v101;
        v102 = *((_OWORD *)off_1E50B83A0 + 1);
        *(_OWORD *)v97 = *(_OWORD *)off_1E50B83A0;
        *(_OWORD *)(v97 + 16) = v102;
        *(_BYTE *)(v97 + 70) = 10;
        v103 = a5;
        v104 = a5 + 40 * v9;
        *(_QWORD *)(v104 + 32) = *((_QWORD *)off_1E50B8398 + 4);
        v105 = *((_OWORD *)off_1E50B8398 + 1);
        *(_OWORD *)v104 = *(_OWORD *)off_1E50B8398;
        *(_OWORD *)(v104 + 16) = v105;
        *(_BYTE *)(v104 + 1) = v118;
        *(_BYTE *)v104 = v16;
        *(_WORD *)(v104 + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 872);
        v106 = v92[3];
        v7 = a4;
        *(float32x2_t *)(v104 + 8) = vmul_n_f32(v106, *(float *)(a1 + 536));
        v41 = v123;
        v107 = v123[1];
        v139 = *v123;
        v140 = v107;
        *(_QWORD *)(v104 + 24) = PXGSectionedSpriteTagMake();
        a5 = v103;
        if (v12 == CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitle"))
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "addIndex:", v9);
      }
      else if (v11 == CFSTR("PXCuratedLibrarySectionHeaderItemTitleHitArea"))
      {
        v69 = *(double *)(a1 + 152);
        v70 = *(double *)(a1 + 160);
        PXSizeMin();
        v72 = v71;
        v74 = v73;
        v75 = (float32x2_t *)(a3 + 32 * v9);
        v149.origin.x = v69;
        v149.origin.y = v70;
        v149.size.width = v72;
        v149.size.height = v74;
        v76 = CGRectGetMidX(v149);
        v150.origin.x = v69;
        v150.origin.y = v70;
        v150.size.width = v72;
        v150.size.height = v74;
        v77 = CGRectGetMidY(v150);
        v151.origin.x = v69;
        v151.origin.y = v70;
        v151.size.width = v72;
        v151.size.height = v74;
        v121 = CGRectGetWidth(v151);
        v152.origin.x = v69;
        v152.origin.y = v70;
        v152.size.width = v72;
        v152.size.height = v74;
        v78 = CGRectGetHeight(v152);
        v79.f64[0] = v121;
        v79.f64[1] = v78;
        *(CGFloat *)v75 = v76;
        *(CGFloat *)&v75[1] = v77;
        v75[3] = vcvt_f32_f64(v79);
        v75[2] = (float32x2_t)0xBFF3333333333333;
        v8 = a3;
        v80 = (_OWORD *)(v7 + 160 * v9);
        v81 = *((_OWORD *)off_1E50B83A0 + 1);
        *v80 = *(_OWORD *)off_1E50B83A0;
        v80[1] = v81;
        v82 = *((_OWORD *)off_1E50B83A0 + 5);
        v80[4] = *((_OWORD *)off_1E50B83A0 + 4);
        v80[5] = v82;
        v83 = *((_OWORD *)off_1E50B83A0 + 3);
        v80[2] = *((_OWORD *)off_1E50B83A0 + 2);
        v80[3] = v83;
        v84 = *((_OWORD *)off_1E50B83A0 + 9);
        v80[8] = *((_OWORD *)off_1E50B83A0 + 8);
        v80[9] = v84;
        v85 = *((_OWORD *)off_1E50B83A0 + 7);
        v80[6] = *((_OWORD *)off_1E50B83A0 + 6);
        v80[7] = v85;
        v86 = a5 + 40 * v9;
        *(_QWORD *)(v86 + 32) = *((_QWORD *)off_1E50B8398 + 4);
        v87 = *((_OWORD *)off_1E50B8398 + 1);
        *(_OWORD *)v86 = *(_OWORD *)off_1E50B8398;
        *(_OWORD *)(v86 + 16) = v87;
        v41 = v123;
      }
      else
      {
        v40 = v11 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectionTitle")
           || v11 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectionTitleOverBackground");
        v41 = v123;
        if (v40)
        {
          v42 = (float32x2_t *)(a3 + 32 * v9);
          v43 = *(double *)(a1 + 184);
          v44 = *(double *)(a1 + 192);
          v45 = *(double *)(a1 + 200);
          v46 = *(double *)(a1 + 208);
          v145.origin.x = v43;
          v145.origin.y = v44;
          v145.size.width = v45;
          v145.size.height = v46;
          v47 = CGRectGetMidX(v145);
          v146.origin.x = v43;
          v146.origin.y = v44;
          v146.size.width = v45;
          v146.size.height = v46;
          v48 = CGRectGetMidY(v146);
          v147.origin.x = v43;
          v147.origin.y = v44;
          v147.size.width = v45;
          v147.size.height = v46;
          v120 = CGRectGetWidth(v147);
          v148.origin.x = v43;
          v148.origin.y = v44;
          v148.size.width = v45;
          v148.size.height = v46;
          v49 = CGRectGetHeight(v148);
          v50.f64[0] = v120;
          v50.f64[1] = v49;
          *(CGFloat *)v42 = v47;
          *(CGFloat *)&v42[1] = v48;
          v42[3] = vcvt_f32_f64(v50);
          v42[2] = (float32x2_t)0xBFF0000000000000;
          v51 = v7 + 160 * v9;
          v52 = *((_OWORD *)off_1E50B83A0 + 7);
          *(_OWORD *)(v51 + 96) = *((_OWORD *)off_1E50B83A0 + 6);
          *(_OWORD *)(v51 + 112) = v52;
          v53 = *((_OWORD *)off_1E50B83A0 + 9);
          *(_OWORD *)(v51 + 128) = *((_OWORD *)off_1E50B83A0 + 8);
          *(_OWORD *)(v51 + 144) = v53;
          v54 = *((_OWORD *)off_1E50B83A0 + 3);
          *(_OWORD *)(v51 + 32) = *((_OWORD *)off_1E50B83A0 + 2);
          *(_OWORD *)(v51 + 48) = v54;
          v55 = *((_OWORD *)off_1E50B83A0 + 5);
          *(_OWORD *)(v51 + 64) = *((_OWORD *)off_1E50B83A0 + 4);
          *(_OWORD *)(v51 + 80) = v55;
          v56 = *((_OWORD *)off_1E50B83A0 + 1);
          *(_OWORD *)v51 = *(_OWORD *)off_1E50B83A0;
          *(_OWORD *)(v51 + 16) = v56;
          *(_BYTE *)(v51 + 70) = 11;
          v57 = a5 + 40 * v9;
          *(_QWORD *)(v57 + 32) = *((_QWORD *)off_1E50B8398 + 4);
          v58 = *((_OWORD *)off_1E50B8398 + 1);
          *(_OWORD *)v57 = *(_OWORD *)off_1E50B8398;
          *(_OWORD *)(v57 + 16) = v58;
          *(_WORD *)v57 = 2561;
          *(_WORD *)(v57 + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 880);
          v59 = v42[3];
          v8 = a3;
          *(float32x2_t *)(v57 + 8) = vmul_n_f32(v59, *(float *)(a1 + 536));
          v60 = v123[1];
          v139 = *v123;
          v140 = v60;
          *(_QWORD *)(v57 + 24) = PXGSectionedSpriteTagMake();
          v7 = a4;
        }
      }
      v108 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_9;
      aBlock[3] = &unk_1E5116AE0;
      v138 = v9;
      v109 = *(_QWORD *)(a1 + 32);
      v129 = v12;
      v130 = v109;
      v131 = v8;
      v132 = v7;
      v110 = v124[1];
      v133 = *v124;
      v134 = v110;
      v135 = a5;
      v111 = v41[1];
      v136 = *v41;
      v137 = v111;
      v112 = v12;
      v113 = _Block_copy(aBlock);
      v126[0] = v108;
      v126[1] = 3221225472;
      v126[2] = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_10;
      v126[3] = &unk_1E5116B08;
      v127 = v113;
      v114 = v113;
      v115 = (void (**)(void *, const __CFString *, const __CFString *, _QWORD, uint64_t, double, double, double, double))_Block_copy(v126);
      v115[2](v115, CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButton"), CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 874), 5, *(double *)(a1 + 216), *(double *)(a1 + 224), *(double *)(a1 + 232), *(double *)(a1 + 240));
      v115[2](v115, CFSTR("PXCuratedLibrarySectionHeaderItemFilterButton"), CFSTR("PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 876), 6, *(double *)(a1 + 248), *(double *)(a1 + 256), *(double *)(a1 + 264), *(double *)(a1 + 272));
      v115[2](v115, CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButton"), CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 878), 7, *(double *)(a1 + 280), *(double *)(a1 + 288), *(double *)(a1 + 296), *(double *)(a1 + 304));
      v115[2](v115, CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButton"), CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 892), 8, *(double *)(a1 + 312), *(double *)(a1 + 320), *(double *)(a1 + 328), *(double *)(a1 + 336));
      v115[2](v115, CFSTR("PXCuratedLibrarySectionHeaderItemSelectButton"), CFSTR("PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 882), 10, *(double *)(a1 + 344), *(double *)(a1 + 352), *(double *)(a1 + 360), *(double *)(a1 + 368));
      v115[2](v115, CFSTR("PXCuratedLibrarySectionHeaderItemCancelButton"), CFSTR("PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 884), 12, *(double *)(a1 + 376), *(double *)(a1 + 384), *(double *)(a1 + 392), *(double *)(a1 + 400));
      v115[2](v115, CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButton"), CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 886), 13, *(double *)(a1 + 408), *(double *)(a1 + 416), *(double *)(a1 + 424), *(double *)(a1 + 432));
      v115[2](v115, CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButton"), CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 888), 14, *(double *)(a1 + 440), *(double *)(a1 + 448), *(double *)(a1 + 456), *(double *)(a1 + 464));
      v115[2](v115, CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButton"), CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 890), 15, *(double *)(a1 + 472), *(double *)(a1 + 480), *(double *)(a1 + 488), *(double *)(a1 + 496));
      v115[2](v115, CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButton"), CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 894), 17, *(double *)(a1 + 504), *(double *)(a1 + 512), *(double *)(a1 + 520), *(double *)(a1 + 528));

      ++v9;
      --v5;
    }
    while (v5);
  }
}

void __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_10(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double, double, double, double);
  id v19;

  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double, double, double, double))(v17 + 16);
  v19 = a3;
  v18(v17, a2, a4, a5, 1, a6, a7, a8, a9);
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(a6, a7, a8, a9);

}

uint64_t __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_9(uint64_t result, uint64_t a2, __int16 a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, uint64_t a8, int a9)
{
  uint64_t v15;
  float32x2_t *v16;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v20;
  float v21;
  uint64_t v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  _WORD *v31;
  CGFloat Width;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  if (*(_QWORD *)(result + 32) == a2)
  {
    v15 = result;
    v16 = (float32x2_t *)(*(_QWORD *)(result + 48) + 32 * *(unsigned int *)(result + 136));
    MidX = CGRectGetMidX(*(CGRect *)&a4);
    v33.origin.x = a4;
    v33.origin.y = a5;
    v33.size.width = a6;
    v33.size.height = a7;
    MidY = CGRectGetMidY(v33);
    v34.origin.x = a4;
    v34.origin.y = a5;
    v34.size.width = a6;
    v34.size.height = a7;
    Width = CGRectGetWidth(v34);
    v35.origin.x = a4;
    v35.origin.y = a5;
    v35.size.width = a6;
    v35.size.height = a7;
    Height = CGRectGetHeight(v35);
    v20.f64[0] = Width;
    v20.f64[1] = Height;
    *(CGFloat *)v16 = MidX;
    *(CGFloat *)&v16[1] = MidY;
    v16[2] = 0;
    v16[3] = vcvt_f32_f64(v20);
    objc_msgSend(*(id *)(v15 + 40), "buttonsZIndex");
    v22 = *(unsigned int *)(v15 + 136);
    *(double *)(*(_QWORD *)(v15 + 48) + 32 * v22 + 16) = v21;
    v23 = (_OWORD *)(*(_QWORD *)(v15 + 56) + 160 * v22);
    v24 = *((_OWORD *)off_1E50B83A0 + 1);
    *v23 = *(_OWORD *)off_1E50B83A0;
    v23[1] = v24;
    v25 = *((_OWORD *)off_1E50B83A0 + 5);
    v23[4] = *((_OWORD *)off_1E50B83A0 + 4);
    v23[5] = v25;
    v26 = *((_OWORD *)off_1E50B83A0 + 3);
    v23[2] = *((_OWORD *)off_1E50B83A0 + 2);
    v23[3] = v26;
    v27 = *((_OWORD *)off_1E50B83A0 + 9);
    v23[8] = *((_OWORD *)off_1E50B83A0 + 8);
    v23[9] = v27;
    v28 = *((_OWORD *)off_1E50B83A0 + 7);
    v23[6] = *((_OWORD *)off_1E50B83A0 + 6);
    v23[7] = v28;
    v29 = *(_QWORD *)(v15 + 96) + 40 * *(unsigned int *)(v15 + 136);
    v30 = *((_OWORD *)off_1E50B8398 + 1);
    *(_OWORD *)v29 = *(_OWORD *)off_1E50B8398;
    *(_OWORD *)(v29 + 16) = v30;
    *(_QWORD *)(v29 + 32) = *((_QWORD *)off_1E50B8398 + 4);
    v31 = (_WORD *)(*(_QWORD *)(v15 + 96) + 40 * *(unsigned int *)(v15 + 136));
    *v31 = 2561;
    v31[16] = a3;
    result = PXGSectionedSpriteTagMake();
    *(_QWORD *)(*(_QWORD *)(v15 + 96) + 40 * *(unsigned int *)(v15 + 136) + 24) = result;
    if (a9)
      return objc_msgSend(*(id *)(*(_QWORD *)(v15 + 40) + 912), "addIndex:");
  }
  return result;
}

- (float)buttonsZIndex
{
  return self->_buttonsZIndex;
}

- (void)setGradientAlpha:(double)a3
{
  self->_gradientAlpha = a3;
}

- (double)gradientAlpha
{
  return self->_gradientAlpha;
}

- (void)setExternalTopButtonConfigurations:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  char v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *externalTopButtonConfigurations;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;
  NSArray *v15;

  v15 = (NSArray *)a3;
  v4 = self->_externalTopButtonConfigurations;
  if (v4 == v15)
  {

LABEL_10:
    v7 = v15;
    goto LABEL_11;
  }
  v5 = v4;
  v6 = -[NSArray isEqual:](v15, "isEqual:", v4);

  v7 = v15;
  if ((v6 & 1) == 0)
  {
    v8 = (NSArray *)-[NSArray copy](v15, "copy");
    externalTopButtonConfigurations = self->_externalTopButtonConfigurations;
    self->_externalTopButtonConfigurations = v8;

    self->_cachedExternalTopButtonsSize = *(CGSize *)off_1E50B8810;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_10;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      v7 = v15;
      if (willPerformUpdate)
        goto LABEL_11;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setExternalTopButtonConfigurations:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1464, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)setTitleSubtitleLastBaseline:(double)a3
{
  if (self->_titleSubtitleLastBaseline != a3)
  {
    self->_titleSubtitleLastBaseline = a3;
    -[PXCuratedLibrarySectionHeaderLayout _updateLastBaseline](self, "_updateLastBaseline");
  }
}

- (void)setVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v8;
  double v9;
  double v10;
  _BOOL4 v11;
  int v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a3.origin.y <= 0.0)
  {
    -[PXGLayout visibleRect](self, "visibleRect");
    v8 = v9 > 0.0;
  }
  else
  {
    v8 = 0;
  }
  if (y <= 0.0)
  {
    v11 = 0;
  }
  else
  {
    -[PXGLayout visibleRect](self, "visibleRect");
    v11 = v10 <= 0.0;
  }
  v12 = v8 || v11;
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  -[PXGLayout setVisibleRect:](&v13, sel_setVisibleRect_, x, y, width, height);
  if (v12 == 1)
    ++self->_ellipsisButtonVersion;
}

- (void)referenceSizeDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  -[PXGLayout referenceSizeDidChange](&v8, sel_referenceSizeDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout referenceSizeDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1106, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateSprites
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  _BOOL4 v15;
  _BOOL4 v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGSize *p_cachedExternalTrailingButtonsSize;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t i;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t j;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t k;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double height;
  void *v59;
  BOOL v60;
  void *v61;
  BOOL v62;
  __int128 v63;
  id v64;
  double (**v65)(void *, _QWORD, uint64_t);
  void *v66;
  int v67;
  void *v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  _BOOL4 v72;
  _BOOL4 v73;
  int v74;
  uint64_t v75;
  void *v76;
  int v77;
  int v78;
  void *v79;
  int v80;
  void *v81;
  int v82;
  void *v83;
  _BOOL4 v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  unsigned int v89;
  uint64_t v90;
  unsigned int v91;
  uint64_t v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double (*v110)(void *, uint64_t, uint64_t);
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  int v151;
  int v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  uint64_t v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  void *v172;
  CGFloat v173;
  CGFloat v174;
  void *v175;
  BOOL v176;
  CGSize *p_cachedLongestPossibleSelectionTitleSize;
  void *v178;
  void *v179;
  void *v180;
  CGFloat v181;
  CGFloat v182;
  double width;
  double v184;
  double v185;
  double MinY;
  double v187;
  CGFloat v188;
  id v189;
  double v190;
  double v191;
  double v192;
  double v193;
  CGFloat v194;
  double v195;
  double v196;
  int v197;
  double v198;
  id v199;
  id v200;
  double v201;
  CGFloat v202;
  CGFloat v203;
  CGFloat v204;
  CGFloat v205;
  CGFloat v206;
  CGFloat v207;
  uint64_t v208;
  void *v209;
  id v210;
  void *v211;
  id v212;
  void (**v213)(void *, const __CFString *, const __CFString *, _QWORD);
  uint64_t v214;
  int IsEmpty;
  int v216;
  int v217;
  int v218;
  int v219;
  int v220;
  int v221;
  int v222;
  int v223;
  int v224;
  int v225;
  NSArray **p_itemIdentifierBySpriteIndex;
  void *v227;
  uint64_t v228;
  float v229;
  uint64_t v230;
  id v231;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void (**v234)(double, double, double, double);
  _BOOL4 willPerformUpdate;
  void *v236;
  void *v237;
  double v238;
  double v239;
  unsigned int v240;
  CGFloat y;
  double v242;
  uint64_t v243;
  CGFloat v244;
  uint64_t v245;
  CGFloat v246;
  uint64_t v247;
  double v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  double v254;
  double v255;
  double v256;
  double v257;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  double v266;
  void *v267;
  uint64_t v268;
  double v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  CGSize *p_cachedExternalLeadingButtonsSize;
  CGFloat v275;
  void *v276;
  double v277;
  double v278;
  double v279;
  uint64_t v280;
  double v281;
  double v282;
  double v283;
  double v284;
  unsigned int v285;
  double v286;
  double v287;
  double v288;
  double v289;
  unsigned int v290;
  double v291;
  double v292;
  double v293;
  int v294;
  double v295;
  double v296;
  unsigned int v297;
  double v298;
  double v299;
  double v300;
  _BOOL4 v301;
  double v302;
  void *v303;
  double v304;
  double v305;
  CGFloat rect;
  _QWORD v307[5];
  uint64_t v308;
  double *v309;
  uint64_t v310;
  uint64_t v311;
  _QWORD v312[5];
  id v313;
  CGFloat v314;
  CGFloat v315;
  CGFloat v316;
  CGFloat v317;
  uint64_t v318;
  uint64_t v319;
  double v320;
  double v321;
  double v322;
  __int128 v323;
  __int128 v324;
  double v325;
  CGFloat v326;
  CGFloat v327;
  CGFloat v328;
  double v329;
  CGFloat v330;
  double v331;
  double v332;
  double v333;
  double v334;
  double v335;
  double v336;
  double v337;
  double v338;
  double v339;
  double v340;
  double v341;
  double v342;
  double v343;
  double v344;
  double v345;
  double v346;
  double v347;
  double v348;
  double v349;
  double v350;
  double v351;
  double v352;
  double v353;
  double v354;
  double v355;
  double v356;
  double v357;
  double v358;
  double v359;
  double v360;
  double v361;
  double v362;
  double v363;
  double v364;
  double v365;
  double v366;
  double v367;
  double v368;
  double v369;
  double v370;
  double v371;
  double v372;
  float v373;
  _QWORD v374[4];
  id v375;
  _QWORD v376[4];
  id v377;
  _QWORD v378[4];
  id v379;
  id v380;
  PXCuratedLibrarySectionHeaderLayout *v381;
  uint64_t *v382;
  uint64_t *v383;
  _QWORD *v384;
  CGFloat v385;
  CGFloat v386;
  CGFloat v387;
  CGFloat v388;
  _QWORD v389[4];
  id v390;
  PXCuratedLibrarySectionHeaderLayout *v391;
  uint64_t *v392;
  _QWORD *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  _QWORD v400[6];
  _QWORD aBlock[5];
  id v402;
  _QWORD *v403;
  uint64_t *v404;
  _QWORD *v405;
  uint64_t *v406;
  _QWORD *v407;
  CGFloat v408;
  CGFloat v409;
  CGFloat v410;
  CGFloat v411;
  BOOL v412;
  _QWORD v413[4];
  __int128 v414;
  __int128 v415;
  uint64_t v416;
  uint64_t *v417;
  uint64_t v418;
  BOOL v419;
  _QWORD v420[4];
  uint64_t v421;
  double *v422;
  uint64_t v423;
  CGFloat MaxX;
  _QWORD v425[3];
  CGFloat MinX;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  _BYTE v441[128];
  _BYTE v442[128];
  _BYTE v443[128];
  uint64_t v444;
  CGRect v445;
  CGRect v446;
  CGRect v447;
  CGRect v448;
  CGRect v449;
  CGRect v450;
  CGRect v451;
  CGRect v452;

  v444 = *MEMORY[0x1E0C80C00];
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionHeaderLayout effectiveSpec](self, "effectiveSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleGuide");
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v440 = 0u;
  v439 = 0u;
  -[PXCuratedLibrarySectionHeaderLayout assetCollectionReference](self, "assetCollectionReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "indexPath");
  }
  else
  {
    v440 = 0u;
    v439 = 0u;
  }

  -[PXGLayout referenceSize](self, "referenceSize");
  v270 = v7;
  v272 = v6;
  -[PXGLayout displayScale](self, "displayScale");
  v242 = v8;
  -[PXCuratedLibrarySectionHeaderLayout safeAreaInsetsWithCurrentBehavior](self, "safeAreaInsetsWithCurrentBehavior");
  v268 = v9;
  v245 = v11;
  v247 = v10;
  v243 = v12;
  -[PXCuratedLibrarySectionHeaderLayout maxPossibleHeight](self, "maxPossibleHeight");
  v14 = v13;
  v15 = (unint64_t)(objc_msgSend(v3, "contentSizeCategory") - 8) < 5;
  v16 = objc_msgSend(v3, "sizeClass") == 1 && v15;
  v301 = v16;
  objc_msgSend(v3, "padding");
  objc_msgSend(v3, "contentPadding");
  PXEdgeInsetsAdd();
  -[PXCuratedLibrarySectionHeaderLayout lateralMargin](self, "lateralMargin");
  -[PXCuratedLibrarySectionHeaderLayout safeAreaBehavior](self, "safeAreaBehavior");
  PXEdgeInsetsInsetRect();
  rect = v17;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  p_cachedExternalTrailingButtonsSize = &self->_cachedExternalTrailingButtonsSize;
  if (PXSizeIsNull())
  {
    v438 = 0u;
    v437 = 0u;
    v436 = 0u;
    v435 = 0u;
    -[PXCuratedLibrarySectionHeaderLayout externalTrailingButtonConfigurations](self, "externalTrailingButtonConfigurations");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v435, v443, 16);
    v28 = *MEMORY[0x1E0C9D820];
    v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v26)
    {
      v29 = *(_QWORD *)v436;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v436 != v29)
            objc_enumerationMutation(v25);
          +[PXCuratedLibraryOverlayButton sizeWithConfiguration:](PXCuratedLibraryOverlayButton, "sizeWithConfiguration:", *(_QWORD *)(*((_QWORD *)&v435 + 1) + 8 * i));
          v32 = v31;
          v34 = v33;
          objc_msgSend(v3, "buttonSpacing");
          v28 = v35 + v28 + v32;
          if (v27 < v34)
            v27 = v34;
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v435, v443, 16);
      }
      while (v26);
    }

    p_cachedExternalTrailingButtonsSize->width = v28;
    self->_cachedExternalTrailingButtonsSize.height = v27;
  }
  p_cachedExternalLeadingButtonsSize = &self->_cachedExternalLeadingButtonsSize;
  if (PXSizeIsNull())
  {
    v434 = 0u;
    v433 = 0u;
    v432 = 0u;
    v431 = 0u;
    -[PXCuratedLibrarySectionHeaderLayout externalLeadingButtonConfigurations](self, "externalLeadingButtonConfigurations");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v431, v442, 16);
    v39 = *MEMORY[0x1E0C9D820];
    v38 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v37)
    {
      v40 = *(_QWORD *)v432;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v432 != v40)
            objc_enumerationMutation(v36);
          +[PXCuratedLibraryOverlayButton sizeWithConfiguration:](PXCuratedLibraryOverlayButton, "sizeWithConfiguration:", *(_QWORD *)(*((_QWORD *)&v431 + 1) + 8 * j));
          v43 = v42;
          v45 = v44;
          objc_msgSend(v3, "buttonSpacing");
          v39 = v39 + v46 + v43;
          if (v38 < v45)
            v38 = v45;
        }
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v431, v442, 16);
      }
      while (v37);
    }

    p_cachedExternalLeadingButtonsSize->width = v39;
    self->_cachedExternalLeadingButtonsSize.height = v38;
  }
  if (PXSizeIsNull())
  {
    v430 = 0u;
    v429 = 0u;
    v428 = 0u;
    v427 = 0u;
    -[PXCuratedLibrarySectionHeaderLayout externalTopButtonConfigurations](self, "externalTopButtonConfigurations");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v427, v441, 16);
    v50 = *MEMORY[0x1E0C9D820];
    v49 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v48)
    {
      v51 = *(_QWORD *)v428;
      do
      {
        for (k = 0; k != v48; ++k)
        {
          if (*(_QWORD *)v428 != v51)
            objc_enumerationMutation(v47);
          +[PXCuratedLibraryOverlayButton sizeWithConfiguration:](PXCuratedLibraryOverlayButton, "sizeWithConfiguration:", *(_QWORD *)(*((_QWORD *)&v427 + 1) + 8 * k));
          v54 = v53;
          v56 = v55;
          objc_msgSend(v3, "buttonSpacing");
          v50 = v50 + v57 + v54;
          if (v49 < v56)
            v49 = v56;
        }
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v427, v441, 16);
      }
      while (v48);
    }

    self->_cachedExternalTopButtonsSize.width = v50;
    self->_cachedExternalTopButtonsSize.height = v49;
  }
  v280 = objc_msgSend(v303, "secondaryToolbarPlacement");
  v425[0] = 0;
  v425[1] = v425;
  v425[2] = 0x2020000000;
  MinX = 0.0;
  v445.origin.x = v19;
  v445.origin.y = v21;
  v445.size.width = v23;
  v445.size.height = rect;
  MinX = CGRectGetMinX(v445);
  v421 = 0;
  v422 = (double *)&v421;
  v423 = 0x2020000000;
  MaxX = 0.0;
  v446.origin.x = v19;
  v446.origin.y = v21;
  v446.size.width = v23;
  v446.size.height = rect;
  MaxX = CGRectGetMaxX(v446);
  v420[0] = 0;
  v420[1] = v420;
  height = self->_cachedExternalLeadingButtonsSize.height;
  if (height < self->_cachedExternalTrailingButtonsSize.height)
    height = self->_cachedExternalTrailingButtonsSize.height;
  if (height < self->_cachedExternalTopButtonsSize.height)
    height = self->_cachedExternalTopButtonsSize.height;
  v420[2] = 0x2020000000;
  *(double *)&v420[3] = height;
  v416 = 0;
  v417 = &v416;
  v418 = 0x2020000000;
  v419 = 0;
  -[PXCuratedLibrarySectionHeaderLayout externalTopButtonConfigurations](self, "externalTopButtonConfigurations");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "count") != 0;

  v419 = v60;
  if (v301)
  {
    -[PXCuratedLibrarySectionHeaderLayout externalLeadingButtonConfigurations](self, "externalLeadingButtonConfigurations");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "count") == 0;

    if (!v62)
      *((_BYTE *)v417 + 24) = 1;
  }
  v413[2] = 0x4010000000;
  v63 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v414 = *MEMORY[0x1E0C9D648];
  v413[0] = 0;
  v413[1] = v413;
  v413[3] = &unk_1A7E74EE7;
  v415 = v63;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_2;
  aBlock[3] = &unk_1E51169F0;
  aBlock[4] = self;
  v408 = v19;
  v409 = v21;
  v410 = v23;
  v411 = rect;
  v64 = v3;
  v412 = v301;
  v402 = v64;
  v403 = v425;
  v404 = &v416;
  v405 = v420;
  v406 = &v421;
  v407 = v413;
  v65 = (double (**)(void *, _QWORD, uint64_t))_Block_copy(aBlock);
  -[PXCuratedLibrarySectionHeaderLayout sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "hasSharedLibraryOrPreview");

  if (!v67
    || (-[PXCuratedLibrarySectionHeaderLayout effectiveSpec](self, "effectiveSpec"),
        v68 = (void *)objc_claimAutoreleasedReturnValue(),
        v69 = objc_msgSend(v68, "isFloating"),
        v68,
        (v69 & 1) == 0))
  {
    v422[3] = v422[3] - p_cachedExternalTrailingButtonsSize->width;
  }
  v70 = objc_msgSend(v303, "zoomButtonsButtonPlacement");
  v71 = objc_msgSend(v303, "toggleAspectFitButtonPlacement");
  v72 = -[PXCuratedLibrarySectionHeaderLayout controlStackButtonSelected](self, "controlStackButtonSelected");
  if (v70 == 2)
    v297 = objc_msgSend(v64, "canShowZoomButtons");
  else
    v297 = 0;
  if (objc_msgSend(v64, "canShowZoomButtons"))
  {
    v73 = v70 == 2 && v72;
    v74 = v70 == 1 || v73;
    if (v71)
      goto LABEL_61;
  }
  else
  {
    v74 = 0;
    if (v71)
    {
LABEL_61:
      v75 = objc_msgSend(v64, "canShowAspectFitButtons");
      goto LABEL_64;
    }
  }
  v75 = 0;
LABEL_64:
  -[PXCuratedLibrarySectionHeaderLayout toggleAspectFitButtonActionPerformer](self, "toggleAspectFitButtonActionPerformer");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76)
    v77 = v75;
  else
    v77 = 0;
  v240 = v74;
  if (v77 == 1)
  {
    v78 = !v72;
    if (v71 != 1)
      v78 = 0;
    v294 = v78;
  }
  else
  {
    v294 = 0;
  }

  -[PXCuratedLibrarySectionHeaderLayout setUsesCompactToggleAspectFitButton:](self, "setUsesCompactToggleAspectFitButton:", 0);
  if (objc_msgSend(v64, "canShowSelectButton"))
  {
    -[PXCuratedLibrarySectionHeaderLayout selectButtonActionPerformer](self, "selectButtonActionPerformer");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = !v72;
    if (!v79)
      v80 = 0;
    v290 = v80;

  }
  else
  {
    v290 = 0;
  }
  if (objc_msgSend(v64, "canShowCancelButton"))
  {
    -[PXCuratedLibrarySectionHeaderLayout cancelButtonActionPerformer](self, "cancelButtonActionPerformer");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = !v72;
    if (!v81)
      v82 = 0;
    v285 = v82;

  }
  else
  {
    v285 = 0;
  }
  -[PXCuratedLibrarySectionHeaderLayout showFiltersActionPerformer](self, "showFiltersActionPerformer");
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = -[PXCuratedLibrarySectionHeaderLayout filterIndicatorButtonHighlighted](self, "filterIndicatorButtonHighlighted");
  if (objc_msgSend(v64, "canShowEllipsisButton"))
  {
    -[PXCuratedLibrarySectionHeaderLayout spec](self, "spec");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayout ellipsisButtonActionPerformer](self, "ellipsisButtonActionPerformer");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayout selectButtonActionPerformer](self, "selectButtonActionPerformer");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v85, "showMainEllipsisButtonWhenSecondaryEllipsisButtonIsShown:selectButtonIsShown:", v86 != 0, v87 != 0);

  }
  else
  {
    v88 = 0;
  }
  v89 = objc_msgSend(v276, "enableFilterDropDownButton");
  if (v83)
    v90 = v89;
  else
    v90 = 0;
  v91 = objc_msgSend(v276, "enableFilterIndicatorButton");
  if (v83)
    v92 = v91;
  else
    v92 = 0;
  if (((v92 ^ 1 | v84) & 1) == 0)
    v92 = objc_msgSend(v276, "alwaysShowFilterIndicatorButton");
  v93 = v65[2](v65, 0, v88);
  v265 = v94;
  v266 = v93;
  v299 = v96;
  v300 = v95;
  -[PXCuratedLibrarySectionHeaderLayout showSidebarButtonActionPerformer](self, "showSidebarButtonActionPerformer");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v65[2](v65, 10, v97 != 0);
  v261 = v99;
  v262 = v98;
  v282 = v101;
  v283 = v100;

  v102 = v65[2](v65, 1, v90);
  v277 = v103;
  v278 = v102;
  v304 = v105;
  v305 = v104;
  v106 = v65[2](v65, 9, v297);
  v263 = v107;
  v264 = v106;
  v296 = v109;
  v298 = v108;
  v110 = v65[2];
  if (v301)
  {
    v111 = v110(v65, 2, v92);
    v259 = v112;
    v260 = v111;
    v302 = v113;
    v295 = v114;
    v115 = v65[2](v65, 5, v75);
    v251 = v116;
    v252 = v115;
    v279 = v118;
    v281 = v117;
    v119 = v65[2](v65, 4, v285);
    v255 = v120;
    v256 = v119;
    v284 = v122;
    v286 = v121;
    v123 = v65[2](v65, 3, v290);
    v257 = v124;
    v258 = v123;
    v289 = v126;
    v291 = v125;
    v127 = v65[2](v65, 8, v240);
    v249 = v128;
    v250 = v127;
    v287 = v130;
    v288 = v129;
    v131 = v65[2](v65, 7, v240);
    v253 = v132;
    v254 = v131;
    v292 = v134;
    v293 = v133;
  }
  else
  {
    v135 = v110(v65, 7, v240);
    v253 = v136;
    v254 = v135;
    v292 = v138;
    v293 = v137;
    v139 = v65[2](v65, 8, v240);
    v249 = v140;
    v250 = v139;
    v287 = v142;
    v288 = v141;
    v143 = v65[2](v65, 3, v290);
    v257 = v144;
    v258 = v143;
    v289 = v146;
    v291 = v145;
    v147 = v65[2](v65, 4, v285);
    v255 = v148;
    v256 = v147;
    v284 = v150;
    v286 = v149;
    if (!v294)
      goto LABEL_102;
    v151 = objc_msgSend(v64, "shouldAvoidOverlapWithSecondaryToolbar");
    v152 = v280 == 3 ? v151 : 0;
    if (v152 != 1)
      goto LABEL_103;
    -[PXGLayout referenceSize](self, "referenceSize");
    v154 = v153;
    objc_msgSend(v303, "secondaryToolbarSize");
    v156 = v155;
    objc_msgSend(v303, "secondaryToolbarPadding");
    v158 = v157;
    v159 = v422[3];
    -[PXCuratedLibrarySectionHeaderLayout _sizeOfButton:](self, "_sizeOfButton:", -[PXCuratedLibrarySectionHeaderLayout toggleAspectFitButton](self, "toggleAspectFitButton"));
    v160 = v159 - ((v154 + v156) * 0.5 + v158);
    if (v161 <= v160
      || (-[PXCuratedLibrarySectionHeaderLayout setUsesCompactToggleAspectFitButton:](self, "setUsesCompactToggleAspectFitButton:", 1), -[PXCuratedLibrarySectionHeaderLayout _sizeOfButton:](self, "_sizeOfButton:", -[PXCuratedLibrarySectionHeaderLayout toggleAspectFitButton](self, "toggleAspectFitButton")), v162 <= v160))
    {
LABEL_103:
      v163 = 1;
    }
    else
    {
LABEL_102:
      v163 = 0;
    }
    v164 = v65[2](v65, -[PXCuratedLibrarySectionHeaderLayout toggleAspectFitButton](self, "toggleAspectFitButton"), v163);
    v251 = v165;
    v252 = v164;
    v279 = v167;
    v281 = v166;
    v168 = v65[2](v65, 2, v92);
    v259 = v169;
    v260 = v168;
    v302 = v170;
    v295 = v171;
  }
  v422[3] = v422[3] - p_cachedExternalLeadingButtonsSize->width;
  -[PXCuratedLibrarySectionHeaderLayout leadingButtonsLayoutGuide](self, "leadingButtonsLayoutGuide");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v400[0] = MEMORY[0x1E0C809B0];
  v400[1] = 3221225472;
  v400[2] = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_3;
  v400[3] = &unk_1E5116A18;
  v400[5] = v413;
  v400[4] = self;
  objc_msgSend(v172, "performChanges:", v400);

  v173 = v23;
  v174 = v21;
  -[PXCuratedLibrarySectionHeaderLayout selectionTitle](self, "selectionTitle");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = objc_msgSend(v175, "length") == 0;

  if (v176)
  {
    v188 = v19;
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v239 = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v184 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    p_cachedLongestPossibleSelectionTitleSize = &self->_cachedLongestPossibleSelectionTitleSize;
    if (PXSizeIsNull())
    {
      -[PXCuratedLibrarySectionHeaderLayout _titleSubtitleSpecForItemIdentifier:](self, "_titleSubtitleSpecForItemIdentifier:", CFSTR("PXCuratedLibrarySectionHeaderItemSelectionTitle"));
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibrarySectionHeaderLayout longestPossibleSelectionTitle](self, "longestPossibleSelectionTitle");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibrarySectionHeaderLayout _selectionTitleLabelConfigurationWithTitle:spec:](self, "_selectionTitleLabelConfigurationWithTitle:spec:", v179, v178);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXCuratedLibraryLabel sizeThatFits:withConfiguration:](PXCuratedLibraryLabel, "sizeThatFits:withConfiguration:", v180, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      p_cachedLongestPossibleSelectionTitleSize->width = v181;
      self->_cachedLongestPossibleSelectionTitleSize.height = v182;

    }
    width = p_cachedLongestPossibleSelectionTitleSize->width;
    v184 = self->_cachedLongestPossibleSelectionTitleSize.height;
    v185 = v422[3];
    v447.origin.y = v277;
    v447.origin.x = v278;
    v447.size.height = v304;
    v447.size.width = v305;
    if (CGRectIsEmpty(v447))
    {
      v448.origin.x = v19;
      v448.origin.y = v174;
      v448.size.width = v173;
      v448.size.height = rect;
      MinY = CGRectGetMinY(v448);
      v187 = 0.0;
    }
    else
    {
      v449.origin.y = v277;
      v449.origin.x = v278;
      v449.size.height = v304;
      v449.size.width = v305;
      MinY = CGRectGetMidY(v449);
      v187 = v184 * -0.5;
    }
    v450.origin.y = MinY + v187;
    v450.origin.x = v185 - width;
    v239 = v185 - width;
    y = v450.origin.y;
    v450.size.width = width;
    v450.size.height = v184;
    v188 = v19;
    v422[3] = CGRectGetMinX(v450);
  }
  v389[0] = MEMORY[0x1E0C809B0];
  v389[1] = 3221225472;
  v389[2] = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_4;
  v389[3] = &unk_1E5116A40;
  v189 = v64;
  v390 = v189;
  v391 = self;
  v392 = &v416;
  v393 = v420;
  v394 = v272;
  v395 = v270;
  v396 = v268;
  v397 = v247;
  v398 = v245;
  v399 = v243;
  v190 = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_4((uint64_t)v389);
  v244 = v193;
  v246 = v190;
  v275 = v191;
  v194 = v192;
  v271 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
  v273 = *MEMORY[0x1E0C9D628];
  v269 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v248 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (v14 >= 0.0 && v14 < v192)
  {
    v271 = 0;
    v273 = 0;
    v269 = v191;
    v248 = v14;
  }
  objc_msgSend(v189, "gradientAlpha");
  v196 = v195;
  v197 = objc_msgSend(v267, "exaggerateContrast");
  v198 = 1.0;
  if (!v197)
    v198 = v196;
  v238 = v198;
  v378[0] = MEMORY[0x1E0C809B0];
  v378[1] = 3221225472;
  v378[2] = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_5;
  v378[3] = &unk_1E5116A68;
  v382 = &v421;
  v199 = v189;
  v379 = v199;
  v200 = v303;
  v380 = v200;
  v381 = self;
  v385 = v188;
  v386 = v174;
  v387 = v173;
  v388 = rect;
  v383 = &v416;
  v384 = v420;
  v201 = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_5((uint64_t)v378);
  v203 = v202;
  v205 = v204;
  v207 = v206;
  self->_titleSubtitleFrame.origin.x = v201;
  self->_titleSubtitleFrame.origin.y = v202;
  self->_titleSubtitleFrame.size.width = v204;
  self->_titleSubtitleFrame.size.height = v206;
  if ((objc_msgSend(v199, "wantsTitle") & 1) != 0 || objc_msgSend(v199, "wantsSubtitle"))
    v208 = PXSizeIsEmpty() ^ 1;
  else
    v208 = 0;
  v209 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
  -[NSMutableIndexSet removeAllIndexes](self->_axSpriteIndexes, "removeAllIndexes");
  v376[0] = MEMORY[0x1E0C809B0];
  v376[1] = 3221225472;
  v376[2] = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_6;
  v376[3] = &unk_1E5116A90;
  v210 = v209;
  v377 = v210;
  v211 = _Block_copy(v376);
  v374[0] = MEMORY[0x1E0C809B0];
  v374[1] = 3221225472;
  v374[2] = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_7;
  v374[3] = &unk_1E5116AB8;
  v212 = v211;
  v375 = v212;
  v213 = (void (**)(void *, const __CFString *, const __CFString *, _QWORD))_Block_copy(v374);
  if (-[PXCuratedLibrarySectionHeaderLayout showsBackgroundGradient](self, "showsBackgroundGradient"))
    v214 = PXSizeIsEmpty() ^ 1;
  else
    v214 = 0;
  (*((void (**)(id, const __CFString *, uint64_t))v212 + 2))(v212, CFSTR("PXCuratedLibrarySectionHeaderItemGradient"), v214);
  v213[2](v213, CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitle"), CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitleOverBackground"), v208);
  (*((void (**)(id, const __CFString *, uint64_t))v212 + 2))(v212, CFSTR("PXCuratedLibrarySectionHeaderItemTitleHitArea"), v208);
  IsEmpty = PXSizeIsEmpty();
  v213[2](v213, CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButton"), CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground"), IsEmpty ^ 1u);
  v216 = PXSizeIsEmpty();
  v213[2](v213, CFSTR("PXCuratedLibrarySectionHeaderItemFilterButton"), CFSTR("PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground"), v216 ^ 1u);
  v217 = PXSizeIsEmpty();
  v213[2](v213, CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButton"), CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButtonOverBackground"), v217 ^ 1u);
  v218 = PXSizeIsEmpty();
  v213[2](v213, CFSTR("PXCuratedLibrarySectionHeaderItemSelectionTitle"), CFSTR("PXCuratedLibrarySectionHeaderItemSelectionTitleOverBackground"), v218 ^ 1u);
  v219 = PXSizeIsEmpty();
  v213[2](v213, CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButton"), CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground"), v219 ^ 1u);
  v220 = PXSizeIsEmpty();
  v213[2](v213, CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButton"), CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground"), v220 ^ 1u);
  v221 = PXSizeIsEmpty();
  v213[2](v213, CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButton"), CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground"), v221 ^ 1u);
  v222 = PXSizeIsEmpty();
  v213[2](v213, CFSTR("PXCuratedLibrarySectionHeaderItemSelectButton"), CFSTR("PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground"), v222 ^ 1u);
  v223 = PXSizeIsEmpty();
  v213[2](v213, CFSTR("PXCuratedLibrarySectionHeaderItemCancelButton"), CFSTR("PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground"), v223 ^ 1u);
  v224 = PXSizeIsEmpty();
  v213[2](v213, CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButton"), CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground"), v224 ^ 1u);
  v225 = PXSizeIsEmpty();
  v213[2](v213, CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButton"), CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground"), v225 ^ 1u);
  p_itemIdentifierBySpriteIndex = &self->_itemIdentifierBySpriteIndex;
  if (!-[NSArray isEqualToArray:](self->_itemIdentifierBySpriteIndex, "isEqualToArray:", v210))
  {
    objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", *p_itemIdentifierBySpriteIndex, v210, MEMORY[0x1E0C9AA60]);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_itemIdentifierBySpriteIndex, v209);
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", v227, objc_msgSend(v210, "count"), 0, 0);

  }
  v228 = -[NSArray count](*p_itemIdentifierBySpriteIndex, "count");
  v229 = v242;
  v312[0] = MEMORY[0x1E0C809B0];
  v230 = v228 << 32;
  v312[1] = 3221225472;
  v312[2] = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_8;
  v312[3] = &unk_1E5116B30;
  v312[4] = self;
  v314 = v246;
  v315 = v244;
  v316 = v275;
  v317 = v194;
  v231 = v199;
  v318 = v273;
  v319 = v271;
  v320 = v269;
  v321 = v248;
  v323 = v439;
  v324 = v440;
  v373 = v229;
  v329 = v239;
  v330 = y;
  v331 = width;
  v332 = v184;
  v322 = v238;
  v328 = v207;
  v313 = v231;
  v325 = v201;
  v326 = v203;
  v327 = v205;
  v333 = v266;
  v334 = v265;
  v335 = v300;
  v336 = v299;
  v337 = v278;
  v338 = v277;
  v339 = v305;
  v340 = v304;
  v341 = v260;
  v342 = v259;
  v343 = v302;
  v344 = v295;
  v345 = v264;
  v346 = v263;
  v347 = v298;
  v348 = v296;
  v349 = v258;
  v350 = v257;
  v351 = v291;
  v352 = v289;
  v353 = v256;
  v354 = v255;
  v355 = v286;
  v356 = v284;
  v357 = v252;
  v358 = v251;
  v359 = v281;
  v360 = v279;
  v361 = v254;
  v362 = v253;
  v363 = v293;
  v364 = v292;
  v365 = v250;
  v366 = v249;
  v367 = v288;
  v368 = v287;
  v369 = v262;
  v370 = v261;
  v371 = v283;
  v372 = v282;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v230, v312);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_132:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      goto LABEL_133;
    }
LABEL_131:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout _updateSprites]");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "handleFailureInFunction:file:lineNumber:description:", v237, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 725, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_132;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_131;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_133:
  v451.origin.x = v201;
  v451.origin.y = v203;
  v451.size.width = v205;
  v451.size.height = v207;
  CGRectGetMaxY(v451);
  if (-[PXCuratedLibrarySectionHeaderLayout showsBackgroundGradient](self, "showsBackgroundGradient"))
  {
    v452.origin.y = v244;
    v452.origin.x = v246;
    v452.size.width = v275;
    v452.size.height = v194;
    CGRectGetMaxY(v452);
  }
  -[PXGLayout referenceSize](self, "referenceSize");
  -[PXGLayout setContentSize:](self, "setContentSize:");
  v308 = 0;
  v309 = (double *)&v308;
  v310 = 0x2020000000;
  v311 = 0;
  v307[0] = MEMORY[0x1E0C809B0];
  v307[1] = 3221225472;
  v307[2] = __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_11;
  v307[3] = &unk_1E5136CF8;
  v307[4] = &v308;
  v234 = (void (**)(double, double, double, double))_Block_copy(v307);
  v234[2](v266, v265, v300, v299);
  ((void (*)(void (**)(double, double, double, double), double, double, double, double))v234[2])(v234, v278, v277, v305, v304);
  ((void (*)(void (**)(double, double, double, double), double, double, double, double))v234[2])(v234, v260, v259, v302, v295);
  ((void (*)(void (**)(double, double, double, double), double, double, double, double))v234[2])(v234, v264, v263, v298, v296);
  ((void (*)(void (**)(double, double, double, double), double, double, double, double))v234[2])(v234, v258, v257, v291, v289);
  ((void (*)(void (**)(double, double, double, double), double, double, double, double))v234[2])(v234, v256, v255, v286, v284);
  ((void (*)(void (**)(double, double, double, double), double, double, double, double))v234[2])(v234, v252, v251, v281, v279);
  ((void (*)(void (**)(double, double, double, double), double, double, double, double))v234[2])(v234, v254, v253, v293, v292);
  ((void (*)(void (**)(double, double, double, double), double, double, double, double))v234[2])(v234, v250, v249, v288, v287);
  ((void (*)(void (**)(double, double, double, double), double, double, double, double))v234[2])(v234, v262, v261, v283, v282);
  -[PXCuratedLibrarySectionHeaderLayout setButtonsMaxY:](self, "setButtonsMaxY:", v309[3]);

  _Block_object_dispose(&v308, 8);
  _Block_object_dispose(v413, 8);
  _Block_object_dispose(&v416, 8);
  _Block_object_dispose(v420, 8);
  _Block_object_dispose(&v421, 8);
  _Block_object_dispose(v425, 8);

}

void __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_7(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  id v9;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v9 = a3;
  v8(v7, a2, a4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_6(uint64_t result, uint64_t a2, int a3)
{
  if (a3)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

double __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  int v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  CGRect v21;

  if ((a3 & 1) == 0)
    return *MEMORY[0x1E0C9D648];
  objc_msgSend(*(id *)(a1 + 32), "_sizeOfButton:", a2);
  v6 = v5;
  v8 = v7;
  v9 = *(double *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 40), "buttonSpacing");
  v11 = v10;
  switch(a2)
  {
    case 1:
      v12 = CGRectGetMaxX(*(CGRect *)(a1 + 88)) - v6;
      v15 = v9 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 40), "buttonHorizontalPadding");
      v16 = 0;
      v9 = v15 + v17;
      goto LABEL_19;
    case 3:
    case 4:
    case 5:
    case 6:
      if (!*(_BYTE *)(a1 + 120))
        goto LABEL_6;
      v11 = v10;
      goto LABEL_16;
    case 7:
      v11 = v10;
      if (*(_BYTE *)(a1 + 120))
        goto LABEL_16;
      v10 = 1.0;
LABEL_17:
      v13 = a1 + 72;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                              + 24)
                                                                  - v6;
      goto LABEL_18;
    case 8:
      v11 = 1.0;
      if (*(_BYTE *)(a1 + 120))
        goto LABEL_16;
      goto LABEL_17;
    case 10:
LABEL_16:
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(double *)(v18 + 24);
      *(double *)(v18 + 24) = v6 + v12;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24);
      v16 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_19;
    default:
LABEL_6:
      v13 = a1 + 72;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                              + 24)
                                                                  - v6;
      if (a2 == 2)
        v14 = v9 + 0.0;
      else
        v14 = v9;
      if (a2)
        v9 = v14;
      else
        v9 = v9 + 0.0;
LABEL_18:
      v16 = 0;
      v19 = *(_QWORD *)(*(_QWORD *)v13 + 8);
      v12 = *(double *)(v19 + 24);
      *(double *)(v19 + 24) = v12 - v10;
LABEL_19:
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = fmax(v8 + v9 - *(double *)(a1 + 96), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 24));
      if (v16)
      {
        v21.origin.x = v12;
        v21.origin.y = v9;
        v21.size.width = v6;
        v21.size.height = v8;
        *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 80)+ 8)+ 32), v21);
      }
      break;
  }
  return v12;
}

void __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_11(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v6;
  double MaxY;

  v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  MaxY = CGRectGetMaxY(*(CGRect *)&a2);
  if (v6 >= MaxY)
    MaxY = v6;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = MaxY;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)spec
{
  return self->_spec;
}

- (PXCuratedLibraryActionPerformer)selectButtonActionPerformer
{
  return self->_selectButtonActionPerformer;
}

- (BOOL)showsBackgroundGradient
{
  return self->_showsBackgroundGradient;
}

- (PXCuratedLibraryEllipsisButtonActionPerformer)ellipsisButtonActionPerformer
{
  return self->_ellipsisButtonActionPerformer;
}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

- (PXGLayoutGuide)leadingButtonsLayoutGuide
{
  return self->_leadingButtonsLayoutGuide;
}

- (NSArray)externalTopButtonConfigurations
{
  return self->_externalTopButtonConfigurations;
}

double __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_5(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "buttonSpacing");
  objc_msgSend(*(id *)(a1 + 32), "buttonHorizontalPadding");
  if (objc_msgSend(*(id *)(a1 + 32), "shouldAvoidOverlapWithSecondaryToolbar")
    && objc_msgSend(*(id *)(a1 + 40), "secondaryToolbarPlacement") == 3)
  {
    objc_msgSend(*(id *)(a1 + 48), "referenceSize");
    objc_msgSend(*(id *)(a1 + 40), "secondaryToolbarSize");
    objc_msgSend(*(id *)(a1 + 40), "secondaryToolbarPadding");
  }
  objc_msgSend(*(id *)(a1 + 32), "minimumSpacingBetweenTopSafeAreaAndTitleTop");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "titlePadding");
  objc_msgSend(*(id *)(a1 + 48), "setTitleSubtitleTopSpacing:", v3 + v4);
  objc_msgSend(*(id *)(a1 + 32), "minimumSpacingBetweenTopSafeAreaAndTitleTop");
  objc_msgSend(*(id *)(a1 + 32), "minimumSpacingBetweenTopSafeAreaAndContentTop");
  objc_msgSend(*(id *)(a1 + 32), "titlePadding");
  PXEdgeInsetsInsetRect();
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "maximumTitleSubtitleHeight");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && objc_msgSend(*(id *)(a1 + 32), "shouldAccommodateLeadingButtonsLayout"))
  {
    if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) > 0.0)
      objc_msgSend(*(id *)(a1 + 32), "minimumSpacingBetweenTopSafeAreaAndTitleTop");
    v7 = objc_msgSend(*(id *)(a1 + 48), "safeAreaBehavior");
    if (v7 < 2)
    {
      objc_msgSend(*(id *)(a1 + 48), "visibleRect");
      objc_msgSend(*(id *)(a1 + 48), "safeAreaInsets");
      PXClamp();
    }
  }
  return v6;
}

double __53__PXCuratedLibrarySectionHeaderLayout__updateSprites__block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(*(id *)(a1 + 32), "gradientHeight");
  objc_msgSend(*(id *)(a1 + 32), "maximumTitleSubtitleHeight");
  if (objc_msgSend(*(id *)(a1 + 40), "safeAreaBehavior") == 1
    || objc_msgSend(*(id *)(a1 + 40), "safeAreaBehavior") == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "safeAreaInsets");
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "minimumSpacingBetweenTopSafeAreaAndContentTop");
    v2 = v4 + v5;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && objc_msgSend(*(id *)(a1 + 32), "shouldAccommodateLeadingButtonsLayout"))
  {
    v2 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  objc_msgSend(*(id *)(a1 + 32), "padding", v2);
  PXEdgeInsetsInsetRect();
  v7 = v6;
  if (objc_msgSend(*(id *)(a1 + 32), "gradientRespectsSafeArea"))
  {
    PXEdgeInsetsForEdges();
    PXEdgeInsetsInsetRect();
    v7 = v8;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "safeAreaBehavior") == 2)
    objc_msgSend(*(id *)(a1 + 40), "visibleRect");
  return v7;
}

- (int64_t)safeAreaBehavior
{
  return self->_safeAreaBehavior;
}

- (unint64_t)toggleAspectFitButton
{
  if (self->_usesCompactToggleAspectFitButton)
    return 6;
  else
    return 5;
}

- (PXCuratedLibraryActionPerformer)toggleAspectFitButtonActionPerformer
{
  return self->_toggleAspectFitButtonActionPerformer;
}

- (PXCuratedLibraryActionPerformer)showSidebarButtonActionPerformer
{
  return self->_showSidebarButtonActionPerformer;
}

- (PXCuratedLibraryShowFiltersActionPerformer)showFiltersActionPerformer
{
  return self->_showFiltersActionPerformer;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (void)setUsesCompactToggleAspectFitButton:(BOOL)a3
{
  if (self->_usesCompactToggleAspectFitButton != a3)
  {
    self->_usesCompactToggleAspectFitButton = a3;
    ++self->_toggleAspectFitButtonVersion;
  }
}

- (void)setTitleSubtitleTopSpacing:(double)a3
{
  if (self->_titleSubtitleTopSpacing != a3)
  {
    self->_titleSubtitleTopSpacing = a3;
    -[PXCuratedLibrarySectionHeaderLayout _updateLastBaseline](self, "_updateLastBaseline");
  }
}

- (void)setButtonsMaxY:(double)a3
{
  if (self->_buttonsMaxY != a3)
  {
    self->_buttonsMaxY = a3;
    -[PXCuratedLibrarySectionHeaderLayout _updateLastBaseline](self, "_updateLastBaseline");
  }
}

- (NSString)selectionTitle
{
  return self->_selectionTitle;
}

- (UIEdgeInsets)safeAreaInsetsWithCurrentBehavior
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIEdgeInsets result;

  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[PXCuratedLibrarySectionHeaderLayout safeAreaBehavior](self, "safeAreaBehavior");
  switch(v11)
  {
    case 2:
      -[PXCuratedLibrarySectionHeaderLayout effectiveSpec](self, "effectiveSpec");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "minimumSpacingBetweenTopSafeAreaAndContentTop");
      v14 = v13;
      v15 = objc_msgSend(v12, "userInterfaceIdiom");
      v16 = objc_msgSend(v12, "layoutOrientation");
      v17 = objc_msgSend(v12, "ellipsisButtonSpecialTreatment");
      if (v15 == 1 && v16 == 2 && (v17 & 1) == 0)
      {
        objc_msgSend(v12, "contentPadding");
        v4 = v18;
      }
      else
      {
        -[PXGLayout visibleRect](self, "visibleRect");
        if (v14 + v4 + v21 >= v4 + v14)
          v4 = v4 + v14;
        else
          v4 = v14 + v4 + v21;
      }

      break;
    case 1:
      -[PXCuratedLibrarySectionHeaderLayout effectiveSpec](self, "effectiveSpec");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "minimumSpacingBetweenTopSafeAreaAndContentTop");

      -[PXGLayout visibleRect](self, "visibleRect");
      PXClamp();
      v4 = v20;
      break;
    case 0:
      v4 = *(double *)off_1E50B8020;
      v6 = *((double *)off_1E50B8020 + 1);
      v8 = *((double *)off_1E50B8020 + 2);
      v10 = *((double *)off_1E50B8020 + 3);
      break;
  }
  v22 = v4;
  v23 = v6;
  v24 = v8;
  v25 = v10;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (double)maxPossibleHeight
{
  return self->_maxPossibleHeight;
}

- (double)lateralMargin
{
  return self->_lateralMargin;
}

- (BOOL)filterIndicatorButtonHighlighted
{
  return self->_filterIndicatorButtonHighlighted;
}

- (BOOL)controlStackButtonSelected
{
  return self->_controlStackButtonSelected;
}

- (PXCuratedLibraryActionPerformer)cancelButtonActionPerformer
{
  return self->_cancelButtonActionPerformer;
}

- (CGSize)_sizeOfButton:(unint64_t)a3
{
  CGSize *v5;
  double width;
  double height;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v5 = &self->_cachedSizeByButtonIdentifier[a3];
  width = v5->width;
  height = v5->height;
  if (PXSizeIsNull())
  {
    -[PXCuratedLibrarySectionHeaderLayout _configurationForButton:](self, "_configurationForButton:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXCuratedLibraryOverlayButton sizeWithConfiguration:](PXCuratedLibraryOverlayButton, "sizeWithConfiguration:", v8);
    width = v9;
    height = v10;

    v5->width = width;
    v5->height = height;
  }
  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (NSArray)externalLeadingButtonConfigurations
{
  return self->_externalLeadingButtonConfigurations;
}

- (NSArray)externalTrailingButtonConfigurations
{
  return self->_externalTrailingButtonConfigurations;
}

uint64_t __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke_4(uint64_t result)
{
  BOOL v1;

  v1 = *(double *)(result + 40) > 0.0 && *(_DWORD *)(result + 56) != 0;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 904) = v1;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 905) = *(double *)(result + 48) > 0.0;
  return result;
}

- (CGRect)titleSubtitleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_titleSubtitleFrame.origin.x;
  y = self->_titleSubtitleFrame.origin.y;
  width = self->_titleSubtitleFrame.size.width;
  height = self->_titleSubtitleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v4;
  void *v5;

  -[PXCuratedLibrarySectionHeaderLayout spec](self, "spec", *(_QWORD *)&a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerGradientImageConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)didRenderTitleAndSubtitleSpriteAtIndex:(unsigned int)a3 layoutVersion:(int64_t)a4 withLastBaseline:(double)a5
{
  if (-[PXGLayout version](self, "version", *(_QWORD *)&a3) == a4)
    -[PXCuratedLibrarySectionHeaderLayout setTitleSubtitleLastBaseline:](self, "setTitleSubtitleLastBaseline:", a5);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (id)titleSubtitleSpecForSpriteAtIndex:(unsigned int)a3
{
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;

  if (-[PXCuratedLibrarySectionHeaderLayout showsDebugDescription](self, "showsDebugDescription"))
  {
    -[PXCuratedLibrarySectionHeaderLayout effectiveSpec](self, "effectiveSpec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayout assetCollectionReference](self, "assetCollectionReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "promotionScore");
    v11 = v10;
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nonInterestingPromotionScore");
    v14 = v13;

    if (v11 >= v14)
      objc_msgSend(v5, "debugInterestingTitleSubtitleLabelSpec");
    else
      objc_msgSend(v5, "debugNonInterestingTitleSubtitleLabelSpec");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayout _effectiveTitleSubtitleLabelSpec:](self, "_effectiveTitleSubtitleLabelSpec:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_itemIdentifierBySpriteIndex, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayout _titleSubtitleSpecForItemIdentifier:](self, "_titleSubtitleSpecForItemIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)showsDebugDescription
{
  return self->_showsDebugDescription;
}

- (id)_titleSubtitleSpecForItemIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitle")
    || v4 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectionTitle"))
  {
    -[PXCuratedLibrarySectionHeaderLayout effectiveTitleSubtitleLabelSpec](self, "effectiveTitleSubtitleLabelSpec");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v9 = (void *)v7;
    goto LABEL_14;
  }
  if (v4 == CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitleOverBackground")
    || v4 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectionTitleOverBackground"))
  {
    -[PXCuratedLibrarySectionHeaderLayout effectiveOverBackgroundTitleSubtitleLabelSpec](self, "effectiveOverBackgroundTitleSubtitleLabelSpec");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  PXAssertGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "unsupported itemIdentifier %@", (uint8_t *)&v11, 0xCu);
  }

  v9 = 0;
LABEL_14:

  return v9;
}

- (PXTitleSubtitleLabelSpec)effectiveTitleSubtitleLabelSpec
{
  return self->_effectiveTitleSubtitleLabelSpec;
}

- (PXTitleSubtitleLabelSpec)effectiveOverBackgroundTitleSubtitleLabelSpec
{
  return self->_effectiveOverBackgroundTitleSubtitleLabelSpec;
}

- (void)setMaxPossibleHeight:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_maxPossibleHeight != a3)
  {
    self->_maxPossibleHeight = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setMaxPossibleHeight:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1628, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setButtonsAlpha:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_buttonsAlpha != a3)
  {
    self->_buttonsAlpha = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setButtonsAlpha:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1644, CFSTR("invalidating %lu after it already has been updated"), 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 2;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setEllipsisButtonActionPerformer:(id)a3
{
  PXCuratedLibraryEllipsisButtonActionPerformer *v5;
  PXCuratedLibraryEllipsisButtonActionPerformer *v6;
  char v7;
  PXCuratedLibraryEllipsisButtonActionPerformer *v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  uint64_t v11;
  _BOOL4 willPerformUpdate;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PXCuratedLibraryEllipsisButtonActionPerformer *v17;

  v17 = (PXCuratedLibraryEllipsisButtonActionPerformer *)a3;
  v5 = self->_ellipsisButtonActionPerformer;
  if (v5 == v17)
  {

LABEL_20:
    v8 = v17;
    goto LABEL_21;
  }
  v6 = v17;
  v7 = -[PXCuratedLibraryEllipsisButtonActionPerformer isEqual:](v6, "isEqual:", v5);

  v8 = v17;
  if ((v7 & 1) == 0)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_ellipsisButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
          goto LABEL_14;
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_ellipsisButtonActionPerformer, a3);
          ++self->_ellipsisButtonVersion;
          -[PXCuratedLibraryEllipsisButtonActionPerformer setLayout:](v6, "setLayout:", self);
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setEllipsisButtonActionPerformer:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 8;
LABEL_28:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1236, CFSTR("invalidating %lu after it already has been updated"), v16);

        abort();
      }
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 8;
LABEL_24:
      p_updateFlags->needsUpdate = v13;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_17;
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 1;
      goto LABEL_24;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setEllipsisButtonActionPerformer:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 1;
      goto LABEL_28;
    }
LABEL_17:
    v11 = needsUpdate | 1;
    goto LABEL_18;
  }
LABEL_21:

}

- (void)setExternalLeadingButtonConfigurations:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  char v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *externalLeadingButtonConfigurations;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;
  NSArray *v15;

  v15 = (NSArray *)a3;
  v4 = self->_externalLeadingButtonConfigurations;
  if (v4 == v15)
  {

LABEL_10:
    v7 = v15;
    goto LABEL_11;
  }
  v5 = v4;
  v6 = -[NSArray isEqual:](v15, "isEqual:", v4);

  v7 = v15;
  if ((v6 & 1) == 0)
  {
    v8 = (NSArray *)-[NSArray copy](v15, "copy");
    externalLeadingButtonConfigurations = self->_externalLeadingButtonConfigurations;
    self->_externalLeadingButtonConfigurations = v8;

    self->_cachedExternalLeadingButtonsSize = *(CGSize *)off_1E50B8810;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_10;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      v7 = v15;
      if (willPerformUpdate)
        goto LABEL_11;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setExternalLeadingButtonConfigurations:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1455, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)setSpec:(id)a3
{
  PXCuratedLibrarySectionHeaderLayoutSpec *v5;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v9;
  void *v10;
  PXCuratedLibrarySectionHeaderLayoutSpec *v11;

  v5 = (PXCuratedLibrarySectionHeaderLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0x20;
LABEL_8:
        v5 = v11;
        goto LABEL_9;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 32;
      v5 = v11;
      if (willPerformUpdate)
        goto LABEL_9;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setSpec:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1142, CFSTR("invalidating %lu after it already has been updated"), 32);

      abort();
    }
    goto LABEL_7;
  }
LABEL_9:

}

- (void)setShowFiltersActionPerformer:(id)a3
{
  PXCuratedLibraryShowFiltersActionPerformer *v5;
  PXCuratedLibraryShowFiltersActionPerformer *v6;
  char v7;
  PXCuratedLibraryShowFiltersActionPerformer *v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  uint64_t v11;
  _BOOL4 willPerformUpdate;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PXCuratedLibraryShowFiltersActionPerformer *v17;

  v17 = (PXCuratedLibraryShowFiltersActionPerformer *)a3;
  v5 = self->_showFiltersActionPerformer;
  if (v5 == v17)
  {

LABEL_20:
    v8 = v17;
    goto LABEL_21;
  }
  v6 = v17;
  v7 = -[PXCuratedLibraryShowFiltersActionPerformer isEqual:](v6, "isEqual:", v5);

  v8 = v17;
  if ((v7 & 1) == 0)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_showFiltersActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
          goto LABEL_14;
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_showFiltersActionPerformer, a3);
          ++self->_filterButtonVersion;
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setShowFiltersActionPerformer:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 8;
LABEL_28:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1248, CFSTR("invalidating %lu after it already has been updated"), v16);

        abort();
      }
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 8;
LABEL_24:
      p_updateFlags->needsUpdate = v13;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_17;
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 1;
      goto LABEL_24;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setShowFiltersActionPerformer:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 1;
      goto LABEL_28;
    }
LABEL_17:
    v11 = needsUpdate | 1;
    goto LABEL_18;
  }
LABEL_21:

}

- (void)setSafeAreaBehavior:(int64_t)a3
{
  self->_safeAreaBehavior = a3;
}

- (void)setShowsDebugDescription:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_showsDebugDescription != a3)
  {
    self->_showsDebugDescription = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setShowsDebugDescription:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1190, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setAssetCollectionReference:(id)a3
{
  PXAssetCollectionReference **p_assetCollectionReference;
  PXAssetCollectionReference *v6;
  PXAssetCollectionReference *v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v16;
  void *v17;
  PXAssetCollectionReference *v18;

  v18 = (PXAssetCollectionReference *)a3;
  p_assetCollectionReference = &self->_assetCollectionReference;
  v6 = self->_assetCollectionReference;
  v7 = v18;
  if (v6 == v18)
    goto LABEL_12;
  v8 = -[PXAssetCollectionReference isEqual:](v18, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    v7 = *p_assetCollectionReference;
    objc_storeStrong((id *)&self->_assetCollectionReference, a3);
    -[PXAssetCollectionReference assetCollection](v7, "assetCollection");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PXAssetCollectionReference assetCollection](*p_assetCollectionReference, "assetCollection");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if ((v12 & 1) == 0)
      {
        p_updateFlags = &self->_updateFlags;
        needsUpdate = self->_updateFlags.needsUpdate;
        if (needsUpdate)
        {
          if (!self->_updateFlags.isPerformingUpdate)
          {
LABEL_11:
            p_updateFlags->needsUpdate = needsUpdate | 4;
            goto LABEL_12;
          }
        }
        else if (!self->_updateFlags.isPerformingUpdate)
        {
          willPerformUpdate = self->_updateFlags.willPerformUpdate;
          p_updateFlags->needsUpdate = 4;
          if (!willPerformUpdate)
            -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
          goto LABEL_12;
        }
        if ((self->_updateFlags.updated & 4) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setAssetCollectionReference:]");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1133, CFSTR("invalidating %lu after it already has been updated"), 4);

          abort();
        }
        goto LABEL_11;
      }
    }
LABEL_12:

  }
}

- (void)setZoomOutButtonActionPerformer:(id)a3
{
  PXCuratedLibraryActionPerformer *v5;
  PXCuratedLibraryActionPerformer *v6;
  char v7;
  PXCuratedLibraryActionPerformer *v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  uint64_t v11;
  _BOOL4 willPerformUpdate;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PXCuratedLibraryActionPerformer *v17;

  v17 = (PXCuratedLibraryActionPerformer *)a3;
  v5 = self->_zoomOutButtonActionPerformer;
  if (v5 == v17)
  {

LABEL_20:
    v8 = v17;
    goto LABEL_21;
  }
  v6 = v17;
  v7 = -[PXCuratedLibraryActionPerformer isEqual:](v6, "isEqual:", v5);

  v8 = v17;
  if ((v7 & 1) == 0)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_zoomOutButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
          goto LABEL_14;
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_zoomOutButtonActionPerformer, a3);
          ++self->_zoomOutButtonVersion;
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setZoomOutButtonActionPerformer:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 8;
LABEL_28:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1287, CFSTR("invalidating %lu after it already has been updated"), v16);

        abort();
      }
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 8;
LABEL_24:
      p_updateFlags->needsUpdate = v13;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_17;
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 1;
      goto LABEL_24;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setZoomOutButtonActionPerformer:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 1;
      goto LABEL_28;
    }
LABEL_17:
    v11 = needsUpdate | 1;
    goto LABEL_18;
  }
LABEL_21:

}

- (void)setZoomInButtonActionPerformer:(id)a3
{
  PXCuratedLibraryActionPerformer *v5;
  PXCuratedLibraryActionPerformer *v6;
  char v7;
  PXCuratedLibraryActionPerformer *v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  uint64_t v11;
  _BOOL4 willPerformUpdate;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PXCuratedLibraryActionPerformer *v17;

  v17 = (PXCuratedLibraryActionPerformer *)a3;
  v5 = self->_zoomInButtonActionPerformer;
  if (v5 == v17)
  {

LABEL_20:
    v8 = v17;
    goto LABEL_21;
  }
  v6 = v17;
  v7 = -[PXCuratedLibraryActionPerformer isEqual:](v6, "isEqual:", v5);

  v8 = v17;
  if ((v7 & 1) == 0)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_zoomInButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
          goto LABEL_14;
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_zoomInButtonActionPerformer, a3);
          ++self->_zoomInButtonVersion;
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setZoomInButtonActionPerformer:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 8;
LABEL_28:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1278, CFSTR("invalidating %lu after it already has been updated"), v16);

        abort();
      }
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 8;
LABEL_24:
      p_updateFlags->needsUpdate = v13;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_17;
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 1;
      goto LABEL_24;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setZoomInButtonActionPerformer:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 1;
      goto LABEL_28;
    }
LABEL_17:
    v11 = needsUpdate | 1;
    goto LABEL_18;
  }
LABEL_21:

}

- (void)setToggleAspectFitCompactButtonSymbol:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_toggleAspectFitCompactButtonSymbol != a3)
  {
    self->_toggleAspectFitCompactButtonSymbol = a3;
    ++self->_toggleAspectFitButtonVersion;
    self->_cachedSizeByButtonIdentifier[6] = *(CGSize *)off_1E50B8810;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitCompactButtonSymbol:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1437, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setToggleAspectFitButtonTitle:(id)a3
{
  NSString *v5;
  char v6;
  NSString *v7;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v11;
  void *v12;
  NSString *v13;

  v13 = (NSString *)a3;
  v5 = self->_toggleAspectFitButtonTitle;
  if (v5 == v13)
  {

LABEL_10:
    v7 = v13;
    goto LABEL_11;
  }
  v6 = -[NSString isEqual:](v13, "isEqual:", v5);

  v7 = v13;
  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_toggleAspectFitButtonTitle, a3);
    ++self->_toggleAspectFitButtonVersion;
    self->_cachedSizeByButtonIdentifier[5] = *(CGSize *)off_1E50B8810;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_10;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      v7 = v13;
      if (willPerformUpdate)
        goto LABEL_11;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitButtonTitle:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1417, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)setToggleAspectFitButtonPossibleTitles:(id)a3
{
  NSSet *v5;
  char v6;
  NSSet *v7;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v11;
  void *v12;
  NSSet *v13;

  v13 = (NSSet *)a3;
  v5 = self->_toggleAspectFitButtonPossibleTitles;
  if (v5 == v13)
  {

LABEL_10:
    v7 = v13;
    goto LABEL_11;
  }
  v6 = -[NSSet isEqual:](v13, "isEqual:", v5);

  v7 = v13;
  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_toggleAspectFitButtonPossibleTitles, a3);
    ++self->_toggleAspectFitButtonVersion;
    self->_cachedSizeByButtonIdentifier[5] = *(CGSize *)off_1E50B8810;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_10;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      v7 = v13;
      if (willPerformUpdate)
        goto LABEL_11;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitButtonPossibleTitles:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1427, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)setToggleAspectFitButtonActionPerformer:(id)a3
{
  PXCuratedLibraryActionPerformer *v5;
  PXCuratedLibraryActionPerformer *v6;
  char v7;
  PXCuratedLibraryActionPerformer *v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  uint64_t v11;
  _BOOL4 willPerformUpdate;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PXCuratedLibraryActionPerformer *v17;

  v17 = (PXCuratedLibraryActionPerformer *)a3;
  v5 = self->_toggleAspectFitButtonActionPerformer;
  if (v5 == v17)
  {

LABEL_20:
    v8 = v17;
    goto LABEL_21;
  }
  v6 = v17;
  v7 = -[PXCuratedLibraryActionPerformer isEqual:](v6, "isEqual:", v5);

  v8 = v17;
  if ((v7 & 1) == 0)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_toggleAspectFitButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
          goto LABEL_14;
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_toggleAspectFitButtonActionPerformer, a3);
          ++self->_toggleAspectFitButtonVersion;
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitButtonActionPerformer:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 8;
LABEL_28:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1296, CFSTR("invalidating %lu after it already has been updated"), v16);

        abort();
      }
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 8;
LABEL_24:
      p_updateFlags->needsUpdate = v13;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_17;
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 1;
      goto LABEL_24;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setToggleAspectFitButtonActionPerformer:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 1;
      goto LABEL_28;
    }
LABEL_17:
    v11 = needsUpdate | 1;
    goto LABEL_18;
  }
LABEL_21:

}

- (void)setShowsBackgroundGradient:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_showsBackgroundGradient != a3)
  {
    self->_showsBackgroundGradient = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setShowsBackgroundGradient:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1182, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setShowSidebarButtonActionPerformer:(id)a3
{
  PXCuratedLibraryActionPerformer *v5;
  PXCuratedLibraryActionPerformer *v6;
  char v7;
  PXCuratedLibraryActionPerformer *v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  uint64_t v11;
  _BOOL4 willPerformUpdate;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PXCuratedLibraryActionPerformer *v17;

  v17 = (PXCuratedLibraryActionPerformer *)a3;
  v5 = self->_showSidebarButtonActionPerformer;
  if (v5 == v17)
  {

LABEL_20:
    v8 = v17;
    goto LABEL_21;
  }
  v6 = v17;
  v7 = -[PXCuratedLibraryActionPerformer isEqual:](v6, "isEqual:", v5);

  v8 = v17;
  if ((v7 & 1) == 0)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_showSidebarButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
          goto LABEL_14;
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_showSidebarButtonActionPerformer, a3);
          ++self->_showSidebarButtonVersion;
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setShowSidebarButtonActionPerformer:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 8;
LABEL_28:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1305, CFSTR("invalidating %lu after it already has been updated"), v16);

        abort();
      }
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 8;
LABEL_24:
      p_updateFlags->needsUpdate = v13;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_17;
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 1;
      goto LABEL_24;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setShowSidebarButtonActionPerformer:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 1;
      goto LABEL_28;
    }
LABEL_17:
    v11 = needsUpdate | 1;
    goto LABEL_18;
  }
LABEL_21:

}

- (void)setSelectButtonTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *selectButtonTitle;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;
  NSString *v15;

  v15 = (NSString *)a3;
  v4 = self->_selectButtonTitle;
  if (v4 == v15)
  {

LABEL_10:
    v7 = v15;
    goto LABEL_11;
  }
  v5 = v4;
  v6 = -[NSString isEqualToString:](v15, "isEqualToString:", v4);

  v7 = v15;
  if (!v6)
  {
    v8 = (NSString *)-[NSString copy](v15, "copy");
    selectButtonTitle = self->_selectButtonTitle;
    self->_selectButtonTitle = v8;

    ++self->_selectButtonVersion;
    self->_cachedSizeByButtonIdentifier[3] = *(CGSize *)off_1E50B8810;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_10;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      v7 = v15;
      if (willPerformUpdate)
        goto LABEL_11;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setSelectButtonTitle:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1345, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)setSelectButtonActionPerformer:(id)a3
{
  PXCuratedLibraryActionPerformer *v5;
  PXCuratedLibraryActionPerformer *v6;
  char v7;
  PXCuratedLibraryActionPerformer *v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  uint64_t v11;
  _BOOL4 willPerformUpdate;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PXCuratedLibraryActionPerformer *v17;

  v17 = (PXCuratedLibraryActionPerformer *)a3;
  v5 = self->_selectButtonActionPerformer;
  if (v5 == v17)
  {

LABEL_20:
    v8 = v17;
    goto LABEL_21;
  }
  v6 = v17;
  v7 = -[PXCuratedLibraryActionPerformer isEqual:](v6, "isEqual:", v5);

  v8 = v17;
  if ((v7 & 1) == 0)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_selectButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
          goto LABEL_14;
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_selectButtonActionPerformer, a3);
          ++self->_selectButtonVersion;
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setSelectButtonActionPerformer:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 8;
LABEL_28:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1258, CFSTR("invalidating %lu after it already has been updated"), v16);

        abort();
      }
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 8;
LABEL_24:
      p_updateFlags->needsUpdate = v13;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_17;
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 1;
      goto LABEL_24;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setSelectButtonActionPerformer:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 1;
      goto LABEL_28;
    }
LABEL_17:
    v11 = needsUpdate | 1;
    goto LABEL_18;
  }
LABEL_21:

}

- (void)setFilterIndicatorButtonHighlighted:(BOOL)a3
{
  if (self->_filterIndicatorButtonHighlighted != a3)
  {
    self->_filterIndicatorButtonHighlighted = a3;
    -[PXCuratedLibrarySectionHeaderLayout _invalidateFilterIndicatorButton](self, "_invalidateFilterIndicatorButton");
  }
}

- (void)setFilterButtonTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *filterButtonTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_filterButtonTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      filterButtonTitle = self->_filterButtonTitle;
      self->_filterButtonTitle = v6;

      -[PXCuratedLibrarySectionHeaderLayout _invalidateFilterButton](self, "_invalidateFilterButton");
    }
  }

}

- (void)setFilterButtonHighlighted:(BOOL)a3
{
  if (self->_filterButtonHighlighted != a3)
  {
    self->_filterButtonHighlighted = a3;
    -[PXCuratedLibrarySectionHeaderLayout _invalidateFilterButton](self, "_invalidateFilterButton");
  }
}

- (void)setFilterButtonCaption:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *filterButtonCaption;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_filterButtonCaption;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      filterButtonCaption = self->_filterButtonCaption;
      self->_filterButtonCaption = v6;

      -[PXCuratedLibrarySectionHeaderLayout _invalidateFilterButton](self, "_invalidateFilterButton");
    }
  }

}

- (void)setExternalTrailingButtonConfigurations:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  char v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *externalTrailingButtonConfigurations;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;
  NSArray *v15;

  v15 = (NSArray *)a3;
  v4 = self->_externalTrailingButtonConfigurations;
  if (v4 == v15)
  {

LABEL_10:
    v7 = v15;
    goto LABEL_11;
  }
  v5 = v4;
  v6 = -[NSArray isEqual:](v15, "isEqual:", v4);

  v7 = v15;
  if ((v6 & 1) == 0)
  {
    v8 = (NSArray *)-[NSArray copy](v15, "copy");
    externalTrailingButtonConfigurations = self->_externalTrailingButtonConfigurations;
    self->_externalTrailingButtonConfigurations = v8;

    self->_cachedExternalTrailingButtonsSize = *(CGSize *)off_1E50B8810;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_10;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      v7 = v15;
      if (willPerformUpdate)
        goto LABEL_11;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setExternalTrailingButtonConfigurations:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1446, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)setEllipsisButtonHighlighted:(BOOL)a3
{
  if (self->_ellipsisButtonHighlighted != a3)
  {
    self->_ellipsisButtonHighlighted = a3;
    -[PXCuratedLibrarySectionHeaderLayout _invalidateEllipsisButton](self, "_invalidateEllipsisButton");
  }
}

- (void)setCancelButtonActionPerformer:(id)a3
{
  PXCuratedLibraryActionPerformer *v5;
  PXCuratedLibraryActionPerformer *v6;
  char v7;
  PXCuratedLibraryActionPerformer *v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  uint64_t v11;
  _BOOL4 willPerformUpdate;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PXCuratedLibraryActionPerformer *v17;

  v17 = (PXCuratedLibraryActionPerformer *)a3;
  v5 = self->_cancelButtonActionPerformer;
  if (v5 == v17)
  {

LABEL_20:
    v8 = v17;
    goto LABEL_21;
  }
  v6 = v17;
  v7 = -[PXCuratedLibraryActionPerformer isEqual:](v6, "isEqual:", v5);

  v8 = v17;
  if ((v7 & 1) == 0)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (v6 && self->_cancelButtonActionPerformer)
    {
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
          goto LABEL_14;
        goto LABEL_13;
      }
      if (self->_updateFlags.isPerformingUpdate)
      {
LABEL_13:
        if ((self->_updateFlags.updated & 8) == 0)
        {
LABEL_14:
          v11 = needsUpdate | 8;
LABEL_18:
          p_updateFlags->needsUpdate = v11;
LABEL_19:
          objc_storeStrong((id *)&self->_cancelButtonActionPerformer, a3);
          ++self->_cancelButtonVersion;
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setCancelButtonActionPerformer:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 8;
LABEL_28:
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1268, CFSTR("invalidating %lu after it already has been updated"), v16);

        abort();
      }
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 8;
LABEL_24:
      p_updateFlags->needsUpdate = v13;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_19;
    }
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_17;
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v13 = 1;
      goto LABEL_24;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setCancelButtonActionPerformer:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 1;
      goto LABEL_28;
    }
LABEL_17:
    v11 = needsUpdate | 1;
    goto LABEL_18;
  }
LABEL_21:

}

- (void)setButtonsZIndex:(float)a3
{
  self->_buttonsZIndex = a3;
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t updated;
  unint64_t v9;
  unint64_t v10;
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
  objc_super v29;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 32;
    if ((needsUpdate & 0x20) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFDFLL;
      -[PXCuratedLibrarySectionHeaderLayout _updateEffectiveSpec](self, "_updateEffectiveSpec");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout update]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v5 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXCuratedLibrarySectionHeaderLayout _updateTitleAndSubtitle](self, "_updateTitleAndSubtitle");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout update]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    v7 = p_updateFlags->updated | 1;
    p_updateFlags->updated = v7;
    if ((v6 & 1) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFELL;
      -[PXCuratedLibrarySectionHeaderLayout _updateSprites](self, "_updateSprites");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout update]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
      v6 = p_updateFlags->needsUpdate;
      updated = p_updateFlags->updated | 8;
      p_updateFlags->updated = updated;
      if ((v6 & 8) != 0)
      {
        v6 &= ~8uLL;
        p_updateFlags->needsUpdate = v6;
      }
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout update]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 240, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

        v6 = p_updateFlags->needsUpdate;
        updated = p_updateFlags->updated;
      }
      v7 = updated | 0x10;
      p_updateFlags->updated = v7;
      if ((v6 & 0x10) != 0)
      {
        v6 &= ~0x10uLL;
        p_updateFlags->needsUpdate = v6;
      }
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout update]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      v6 = p_updateFlags->needsUpdate;
      v7 = p_updateFlags->updated;
    }
    p_updateFlags->updated = v7 | 2;
    if ((v6 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXCuratedLibrarySectionHeaderLayout _updateSpritesAlpha](self, "_updateSpritesAlpha");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout update]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v9 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFF7;
      -[PXCuratedLibrarySectionHeaderLayout _updateButtonActionPerformers](self, "_updateButtonActionPerformers");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout update]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v10 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v10 & 0x10) != 0)
    {
      p_updateFlags->needsUpdate = v10 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXCuratedLibrarySectionHeaderLayout _updateSpriteTags](self, "_updateSpriteTags");
      v10 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout update]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 252, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v29.receiver = self;
  v29.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  -[PXGLayout update](&v29, sel_update);
}

- (void)safeAreaInsetsDidChange
{
  void *v3;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  -[PXGLayout safeAreaInsetsDidChange](&v9, sel_safeAreaInsetsDidChange);
  -[PXCuratedLibrarySectionHeaderLayout spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "shouldTextFadeOutWhenReachingTop") & 1) != 0
    || objc_msgSend(v3, "shouldButtonsFadeOutWhenReachingTop"))
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_8:
        p_updateFlags->needsUpdate = needsUpdate | 2;
        goto LABEL_9;
      }
LABEL_7:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout safeAreaInsetsDidChange]");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1100, CFSTR("invalidating %lu after it already has been updated"), 2);

        abort();
      }
      goto LABEL_8;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_7;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 2;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_9:

}

- (void)visibleRectDidChange
{
  void *v3;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  $F40CD077B40800501ED060B808F886F7 *v5;
  _BOOL4 v6;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  -[PXGLayout visibleRectDidChange](&v10, sel_visibleRectDidChange);
  -[PXCuratedLibrarySectionHeaderLayout spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXCuratedLibrarySectionHeaderLayout safeAreaBehavior](self, "safeAreaBehavior"))
  {
    p_updateFlags = &self->_updateFlags;
    if (self->_updateFlags.needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate |= 1uLL;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout visibleRectDidChange]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1089, CFSTR("invalidating %lu after it already has been updated"), 1);
        goto LABEL_23;
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_8:
  if ((objc_msgSend(v3, "shouldTextFadeOutWhenReachingTop") & 1) != 0
    || objc_msgSend(v3, "shouldButtonsFadeOutWhenReachingTop"))
  {
    v5 = &self->_updateFlags;
    if (self->_updateFlags.needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_15;
      goto LABEL_14;
    }
    if (self->_updateFlags.isPerformingUpdate)
    {
LABEL_14:
      if ((self->_updateFlags.updated & 2) == 0)
      {
LABEL_15:
        v5->needsUpdate |= 2uLL;
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout visibleRectDidChange]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1092, CFSTR("invalidating %lu after it already has been updated"), 2);
LABEL_23:

      abort();
    }
    v6 = self->_updateFlags.willPerformUpdate;
    v5->needsUpdate = 2;
    if (!v6)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_16:

}

- (void)_updateSpritesAlpha
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[7];
  unsigned int v25;
  _QWORD v26[5];
  id v27;
  id v28;
  double v29;
  double v30;
  float v31;
  _QWORD v32[5];
  _QWORD aBlock[5];
  CGRect v34;

  -[PXGLayout alpha](self, "alpha");
  v4 = v3;
  -[PXCuratedLibrarySectionHeaderLayout titleAlpha](self, "titleAlpha");
  v6 = v5;
  -[PXCuratedLibrarySectionHeaderLayout buttonsAlpha](self, "buttonsAlpha");
  v8 = v7;
  -[PXCuratedLibrarySectionHeaderLayout spec](self, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "shouldTextFadeOutWhenReachingTop") & 1) == 0
    && !objc_msgSend(v9, "shouldButtonsFadeOutWhenReachingTop"))
  {
    goto LABEL_7;
  }
  -[PXGLayout visibleRect](self, "visibleRect");
  CGRectGetMinY(v34);
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  objc_msgSend(v9, "fadeOutDistanceFromSafeAreaTop");
  objc_msgSend(v9, "fadeOutDistance");
  PXClamp();
  if (objc_msgSend(v9, "shouldTextFadeOutWhenReachingTop"))
  {
    objc_msgSend(v9, "textFadeOutMinimumAlpha");
    PXFloatByLinearlyInterpolatingFloats();
    v6 = v6 * v10;
  }
  if (objc_msgSend(v9, "shouldButtonsFadeOutWhenReachingTop"))
  {
    objc_msgSend(v9, "buttonsFadeOutMinimumAlpha");
    PXFloatByLinearlyInterpolatingFloats();
    v12 = v8 * v11;
  }
  else
  {
LABEL_7:
    v12 = v8;
  }
  v13 = dbl_1A7C0C210[v8 < 1.0];
  if (v6 >= v4)
    v14 = v4;
  else
    v14 = v6;
  -[PXCuratedLibrarySectionHeaderLayout alternateAppearanceMixAnimator](self, "alternateAppearanceMixAnimator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentationValue");
  v17 = v16;

  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke;
  aBlock[3] = &__block_descriptor_40_e8_d16__0d8l;
  aBlock[4] = v17;
  v19 = _Block_copy(aBlock);
  v32[0] = v18;
  v32[1] = 3221225472;
  v32[2] = __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke_2;
  v32[3] = &__block_descriptor_40_e8_d16__0d8l;
  v32[4] = v17;
  v20 = _Block_copy(v32);
  v26[0] = v18;
  v21 = -[PXGLayout numberOfSprites](self, "numberOfSprites") << 32;
  v26[1] = 3221225472;
  v26[2] = __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke_3;
  v26[3] = &unk_1E5116C48;
  v26[4] = self;
  v27 = v19;
  v28 = v20;
  v29 = v14;
  v30 = v12;
  v31 = v13;
  v22 = v20;
  v23 = v19;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v21, v26);
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __58__PXCuratedLibrarySectionHeaderLayout__updateSpritesAlpha__block_invoke_4;
  v24[3] = &unk_1E5116C70;
  v24[4] = self;
  v25 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  *(double *)&v24[5] = v4;
  *(double *)&v24[6] = v14;
  -[PXGLayout installLayoutCompletionBlock:](self, "installLayoutCompletionBlock:", v24);

}

- (double)titleAlpha
{
  return self->_titleAlpha;
}

- (double)buttonsAlpha
{
  return self->_buttonsAlpha;
}

- (PXNumberAnimator)alternateAppearanceMixAnimator
{
  return self->_alternateAppearanceMixAnimator;
}

- (void)_updateTitleAndSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  OS_dispatch_queue *asyncDateQueue;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD block[4];
  id v39;
  __CFString *v40;
  __CFString *v41;
  id v42[4];
  id location;

  -[PXCuratedLibrarySectionHeaderLayout effectiveSpec](self, "effectiveSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionHeaderLayout assetCollectionReference](self, "assetCollectionReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibrarySectionHeaderLayout assetCollectionReference](self, "assetCollectionReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_40;
  if (objc_msgSend(v3, "wantsTitle"))
  {
    if ((objc_msgSend(v3, "shouldOmitYear") & 1) != 0)
    {
      v7 = CFSTR(" ");
      v8 = 1;
      v9 = 2;
      goto LABEL_8;
    }
    objc_msgSend(v5, "localizedDateDescription");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v9 = 0;
  v8 = 0;
LABEL_8:
  if (objc_msgSend(v3, "wantsSubtitle"))
  {
    objc_msgSend(v5, "localizedSmartDescription");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v3, "titleDateFormatter");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitleDateFormatter");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!(v11 | v12))
    goto LABEL_19;
  v35 = v8;
  objc_msgSend(v5, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 && v14)
  {
    v33 = v9;
    v34 = v5;
    objc_msgSend(v14, "timeIntervalSinceDate:", v13);
    objc_msgSend(v13, "dateByAddingTimeInterval:", v16 * 0.5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v18 = v11;
      objc_msgSend((id)v11, "stringFromDate:", v17);
      v19 = objc_claimAutoreleasedReturnValue();

      v7 = (__CFString *)v19;
      if (!v12)
      {
LABEL_17:
        v11 = v18;

        v9 = v33;
        v5 = v34;
        goto LABEL_18;
      }
    }
    else
    {
      v18 = 0;
      if (!v12)
        goto LABEL_17;
    }
    objc_msgSend((id)v12, "stringFromDate:", v17);
    v20 = objc_claimAutoreleasedReturnValue();

    v10 = (__CFString *)v20;
    goto LABEL_17;
  }
LABEL_18:

  v8 = v35;
LABEL_19:
  if (objc_msgSend(v3, "swapTitleWithSubtitle"))
  {
    v21 = -[__CFString length](v10, "length");
    if (v21)
      v22 = v7;
    else
      v22 = v10;
    if (v21)
      v7 = v10;
    else
      v9 = v8;
    v10 = v22;
  }
  else
  {
    v9 = v8;
  }
  if (-[PXCuratedLibrarySectionHeaderLayout showsDebugDescription](self, "showsDebugDescription"))
  {
    v37 = v8;
    objc_msgSend(v5, "localizedDebugDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30 && v10)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v10, v30);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v30, v32);
    v31 = objc_claimAutoreleasedReturnValue();

    v10 = (__CFString *)v31;
    v8 = v37;
    if (v9 == 2)
      goto LABEL_38;
  }
  if (!v9)
  {
LABEL_38:
    -[PXCuratedLibrarySectionHeaderLayout setTitle:](self, "setTitle:", v7);
    -[PXCuratedLibrarySectionHeaderLayout setSubtitle:](self, "setSubtitle:", v10);
  }
  else
  {
    v36 = (void *)v9;
    v23 = v12;
    v24 = v7;
    v25 = (void *)v8;
    v26 = (void *)(self->_asyncDateGeneration + 1);
    self->_asyncDateGeneration = (int64_t)v26;
    objc_initWeak(&location, self);
    v27 = v11;
    asyncDateQueue = self->_asyncDateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__PXCuratedLibrarySectionHeaderLayout__updateTitleAndSubtitle__block_invoke;
    block[3] = &unk_1E5116C98;
    v39 = v5;
    v42[1] = v25;
    v7 = v24;
    v12 = v23;
    objc_copyWeak(v42, &location);
    v40 = v7;
    v10 = v10;
    v41 = v10;
    v42[2] = v36;
    v42[3] = v26;
    v29 = asyncDateQueue;
    v11 = v27;
    dispatch_async(v29, block);

    objc_destroyWeak(v42);
    objc_destroyWeak(&location);
  }

LABEL_40:
}

- (void)_updateEffectiveSpec
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXTitleSubtitleLabelSpec *v8;
  PXTitleSubtitleLabelSpec *v9;
  void *effectiveOverBackgroundTitleSubtitleLabelSpec;
  PXTitleSubtitleLabelSpec *v11;
  PXTitleSubtitleLabelSpec *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[PXCuratedLibrarySectionHeaderLayout spec](self, "spec");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if ((-[PXGLayout referenceOptions](self, "referenceOptions") & 1) != 0)
  {
    objc_msgSend(v16, "smallVariantSpec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = v4;
    else
      v5 = v16;
    v3 = v5;

  }
  else
  {
    v3 = v16;
  }
  -[PXCuratedLibrarySectionHeaderLayout setEffectiveSpec:](self, "setEffectiveSpec:", v3);
  if ((-[PXGLayout referenceOptions](self, "referenceOptions") & 8) != 0)
  {
    objc_msgSend(v16, "firstCardVariantSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayout setEffectiveSpec:](self, "setEffectiveSpec:", v6);

  }
  objc_msgSend(v3, "titleSubtitleLabelSpec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionHeaderLayout _effectiveTitleSubtitleLabelSpec:](self, "_effectiveTitleSubtitleLabelSpec:", v7);
  v8 = (PXTitleSubtitleLabelSpec *)objc_claimAutoreleasedReturnValue();

  if (v8 != self->_effectiveTitleSubtitleLabelSpec)
  {
    objc_storeStrong((id *)&self->_effectiveTitleSubtitleLabelSpec, v8);
    if (objc_msgSend(v3, "userInterfaceStyle") == 2)
    {
      v9 = v8;
      effectiveOverBackgroundTitleSubtitleLabelSpec = self->_effectiveOverBackgroundTitleSubtitleLabelSpec;
      self->_effectiveOverBackgroundTitleSubtitleLabelSpec = v9;
    }
    else
    {
      v11 = (PXTitleSubtitleLabelSpec *)-[PXTitleSubtitleLabelSpec copy](v8, "copy");
      v12 = self->_effectiveOverBackgroundTitleSubtitleLabelSpec;
      self->_effectiveOverBackgroundTitleSubtitleLabelSpec = v11;

      objc_msgSend(v3, "titleSubtitleColorOverBackground");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXTitleSubtitleLabelSpec titleLabelSpec](self->_effectiveOverBackgroundTitleSubtitleLabelSpec, "titleLabelSpec");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextColor:", v13);

      objc_msgSend(v3, "titleSubtitleColorOverBackground");
      effectiveOverBackgroundTitleSubtitleLabelSpec = (void *)objc_claimAutoreleasedReturnValue();
      -[PXTitleSubtitleLabelSpec subtitleLabelSpec](self->_effectiveOverBackgroundTitleSubtitleLabelSpec, "subtitleLabelSpec");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTextColor:", effectiveOverBackgroundTitleSubtitleLabelSpec);

    }
  }

}

- (void)setEffectiveSpec:(id)a3
{
  PXCuratedLibrarySectionHeaderLayoutSpec *v5;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v9;
  void *v10;
  PXCuratedLibrarySectionHeaderLayoutSpec *v11;

  v5 = (PXCuratedLibrarySectionHeaderLayoutSpec *)a3;
  if (self->_effectiveSpec != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_effectiveSpec, a3);
    ++self->_textVersion;
    ++self->_ellipsisButtonVersion;
    ++self->_selectButtonVersion;
    ++self->_cancelButtonVersion;
    ++self->_toggleAspectFitButtonVersion;
    ++self->_zoomInButtonVersion;
    ++self->_zoomOutButtonVersion;
    ++self->_controlStackButtonVersion;
    ++self->_showSidebarButtonVersion;
    ++self->_filterButtonVersion;
    ++self->_filterIndicatorButtonVersion;
    -[PXCuratedLibrarySectionHeaderLayout _discardAllCachedButtonSizes](self, "_discardAllCachedButtonSizes");
    -[PXCuratedLibrarySectionHeaderLayout setControlStackButtonSelected:](self, "setControlStackButtonSelected:", 0);
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 5;
LABEL_8:
        v5 = v11;
        goto LABEL_9;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 5;
      v5 = v11;
      if (willPerformUpdate)
        goto LABEL_9;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 5) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setEffectiveSpec:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1166, CFSTR("invalidating %lu after it already has been updated"), 5);

      abort();
    }
    goto LABEL_7;
  }
LABEL_9:

}

- (void)setControlStackButtonSelected:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_controlStackButtonSelected != a3)
  {
    self->_controlStackButtonSelected = a3;
    ++self->_controlStackButtonVersion;
    ++self->_zoomInButtonVersion;
    ++self->_zoomOutButtonVersion;
    ++self->_toggleAspectFitButtonVersion;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setControlStackButtonSelected:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1334, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (id)_effectiveTitleSubtitleLabelSpec:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v3, "padding");
  PXEdgeInsetsAdd();
  objc_msgSend(v3, "setPadding:");
  return v3;
}

- (PXCuratedLibrarySectionHeaderLayout)init
{
  PXCuratedLibrarySectionHeaderLayout *v2;
  PXCuratedLibrarySectionHeaderLayout *v3;
  NSArray *itemIdentifierBySpriteIndex;
  NSMutableIndexSet *v5;
  NSMutableIndexSet *axSpriteIndexes;
  double v7;
  double v8;
  double v9;
  double v10;
  NSString *selectButtonTitle;
  NSString *filterButtonTitle;
  NSString *filterButtonCaption;
  NSString *toggleAspectFitButtonTitle;
  uint64_t v15;
  PXNumberAnimator *alternateAppearanceMixAnimator;
  PXGLayoutGuide *v17;
  PXGLayoutGuide *leadingButtonsLayoutGuide;
  void *v19;
  uint64_t v20;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  PXLibraryFilterState *v22;
  PXLibraryFilterState *libraryFilterState;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  v2 = -[PXGLayout init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXGLayout setContentSource:](v2, "setContentSource:", v2);
    v3->_maxPossibleHeight = 1.79769313e308;
    v3->_titleAlpha = 1.0;
    v3->_buttonsAlpha = 1.0;
    v3->_showsBackgroundGradient = 1;
    v3->_buttonsZIndex = -1.2;
    itemIdentifierBySpriteIndex = v3->_itemIdentifierBySpriteIndex;
    v3->_itemIdentifierBySpriteIndex = (NSArray *)MEMORY[0x1E0C9AA60];

    v5 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    axSpriteIndexes = v3->_axSpriteIndexes;
    v3->_axSpriteIndexes = v5;

    LODWORD(v7) = 0;
    LODWORD(v8) = 0;
    LODWORD(v9) = 1.0;
    LODWORD(v10) = 0;
    v3->_gradientResizableCapInsetsIndex = -[PXGLayout addResizableCapInsets:](v3, "addResizableCapInsets:", v7, v8, v9, v10);
    selectButtonTitle = v3->_selectButtonTitle;
    v3->_selectButtonTitle = (NSString *)&stru_1E5149688;

    filterButtonTitle = v3->_filterButtonTitle;
    v3->_filterButtonTitle = (NSString *)&stru_1E5149688;

    filterButtonCaption = v3->_filterButtonCaption;
    v3->_filterButtonCaption = (NSString *)&stru_1E5149688;

    toggleAspectFitButtonTitle = v3->_toggleAspectFitButtonTitle;
    v3->_toggleAspectFitButtonTitle = (NSString *)&stru_1E5149688;

    v15 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:epsilon:", 0.0, 0.01);
    alternateAppearanceMixAnimator = v3->_alternateAppearanceMixAnimator;
    v3->_alternateAppearanceMixAnimator = (PXNumberAnimator *)v15;

    -[PXNumberAnimator registerChangeObserver:context:](v3->_alternateAppearanceMixAnimator, "registerChangeObserver:context:", v3, AlternateAppearanceMixAnimatorObservationContext);
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, &__block_literal_global_4215);
    objc_storeStrong((id *)&v3->_asyncDateQueue, (id)init_asyncDateQueue);
    v17 = objc_alloc_init(PXGLayoutGuide);
    leadingButtonsLayoutGuide = v3->_leadingButtonsLayoutGuide;
    v3->_leadingButtonsLayoutGuide = v17;

    -[PXCuratedLibrarySectionHeaderLayout _discardAllCachedButtonSizes](v3, "_discardAllCachedButtonSizes");
    if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      sharedLibraryStatusProvider = v3->_sharedLibraryStatusProvider;
      v3->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v20;

      -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v3->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v3, PXSharedLibraryStatusProviderObservationContext);
    }
    v22 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v3->_sharedLibraryStatusProvider);
    libraryFilterState = v3->_libraryFilterState;
    v3->_libraryFilterState = v22;

    -[PXLibraryFilterState registerChangeObserver:context:](v3->_libraryFilterState, "registerChangeObserver:context:", v3, PXLibraryFilterStateObservationContext);
  }
  return v3;
}

- (void)_discardAllCachedButtonSizes
{
  uint64_t v2;
  CGSize v3;

  v2 = 0;
  v3 = *(CGSize *)off_1E50B8810;
  do
    self->_cachedSizeByButtonIdentifier[v2++] = v3;
  while (v2 != 11);
  self->_cachedExternalTrailingButtonsSize = v3;
  self->_cachedExternalLeadingButtonsSize = v3;
}

- (void)setTitle:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v12;
  void *v13;
  NSString *v14;

  v14 = (NSString *)a3;
  v5 = self->_title;
  if (v5 == v14)
  {

LABEL_10:
    v8 = v14;
    goto LABEL_11;
  }
  v6 = v5;
  v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v14);

  v8 = v14;
  if (!v7)
  {
    objc_storeStrong((id *)&self->_title, a3);
    ++self->_textVersion;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_10;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      v8 = v14;
      if (willPerformUpdate)
        goto LABEL_11;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setTitle:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1475, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)setSubtitle:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v12;
  void *v13;
  NSString *v14;

  v14 = (NSString *)a3;
  v5 = self->_subtitle;
  if (v5 == v14)
  {

LABEL_10:
    v8 = v14;
    goto LABEL_11;
  }
  v6 = v5;
  v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v14);

  v8 = v14;
  if (!v7)
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    ++self->_textVersion;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_10;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      v8 = v14;
      if (willPerformUpdate)
        goto LABEL_11;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setSubtitle:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1484, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)displayScaleDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  -[PXGLayout displayScaleDidChange](&v8, sel_displayScaleDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout displayScaleDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1116, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)setSelectionTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *selectionTitle;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;
  NSString *v15;

  v15 = (NSString *)a3;
  v4 = self->_selectionTitle;
  if (v4 == v15)
  {

LABEL_10:
    v7 = v15;
    goto LABEL_11;
  }
  v5 = v4;
  v6 = -[NSString isEqualToString:](v15, "isEqualToString:", v4);

  v7 = v15;
  if (!v6)
  {
    v8 = (NSString *)-[NSString copy](v15, "copy");
    selectionTitle = self->_selectionTitle;
    self->_selectionTitle = v8;

    ++self->_selectionTitleVersion;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_10;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      v7 = v15;
      if (willPerformUpdate)
        goto LABEL_11;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setSelectionTitle:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1398, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

uint64_t __43__PXCuratedLibrarySectionHeaderLayout_init__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.photos.curatedlibrary-header-async-dates", v1);
  v3 = (void *)init_asyncDateQueue;
  init_asyncDateQueue = (uint64_t)v2;

  result = sub_1A7AE3F38();
  PXCuratedLibrarySectionHeaderPaddingForSpecialCharactersInvert_0 = v5;
  PXCuratedLibrarySectionHeaderPaddingForSpecialCharactersInvert_1 = v6;
  PXCuratedLibrarySectionHeaderPaddingForSpecialCharactersInvert_2 = v7;
  PXCuratedLibrarySectionHeaderPaddingForSpecialCharactersInvert_3 = v8;
  return result;
}

- (void)_updateButtonActionPerformers
{
  id v3;
  _QWORD v4[5];

  if (_updateButtonActionPerformers_onceToken != -1)
    dispatch_once(&_updateButtonActionPerformers_onceToken, &__block_literal_global_220);
  -[NSArray indexesOfObjectsPassingTest:](self->_itemIdentifierBySpriteIndex, "indexesOfObjectsPassingTest:", &__block_literal_global_223);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_3;
  v4[3] = &unk_1E5127210;
  v4[4] = self;
  -[PXGLayout modifySpritesAtIndexes:state:](self, "modifySpritesAtIndexes:state:", v3, v4);

}

- (void)_updateSpriteTags
{
  void *v3;
  void *v4;
  NSUInteger v5;
  _QWORD v6[5];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if (_updateSpriteTags_onceToken != -1)
    dispatch_once(&_updateSpriteTags_onceToken, &__block_literal_global_226);
  v9 = 0u;
  v10 = 0u;
  -[PXCuratedLibrarySectionHeaderLayout assetCollectionReference](self, "assetCollectionReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "indexPath");
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }

  v5 = -[NSArray count](self->_itemIdentifierBySpriteIndex, "count");
  v6[1] = 3221225472;
  v7 = v9;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __56__PXCuratedLibrarySectionHeaderLayout__updateSpriteTags__block_invoke_240;
  v6[3] = &unk_1E513AEF0;
  v6[4] = self;
  v8 = v10;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v5 << 32, v6);
}

- (id)_selectionTitleLabelConfigurationWithTitle:(id)a3 spec:(id)a4
{
  id v5;
  id v6;
  PXCuratedLibraryLabelConfiguration *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PXCuratedLibraryLabelConfiguration);
  -[PXCuratedLibraryLabelConfiguration setText:](v7, "setText:", v6);

  -[PXCuratedLibraryLabelConfiguration setTextAlignment:](v7, "setTextAlignment:", 2);
  objc_msgSend(v5, "titleLabelSpec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "textColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryLabelConfiguration setTextColor:](v7, "setTextColor:", v9);

  return v7;
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  __CFString *v5;
  __CFString *v6;
  uint64_t v8;
  BOOL v10;
  BOOL v11;
  void *v12;
  objc_super v14;

  v3 = *(_QWORD *)&a3;
  if (-[NSArray count](self->_itemIdentifierBySpriteIndex, "count") <= a3)
  {
    v14.receiver = self;
    v14.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
    -[PXGLayout objectReferenceForSpriteIndex:](&v14, sel_objectReferenceForSpriteIndex_, v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  -[NSArray objectAtIndexedSubscript:](self->_itemIdentifierBySpriteIndex, "objectAtIndexedSubscript:", v3);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButton")
    || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground"))
  {
    -[PXCuratedLibrarySectionHeaderLayout ellipsisButtonActionPerformer](self, "ellipsisButtonActionPerformer");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v5 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterButton")
       || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground");
    if (v10
      || (v5 != CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButton")
        ? (v11 = v5 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButtonOverBackground"))
        : (v11 = 1),
          v11))
    {
      -[PXCuratedLibrarySectionHeaderLayout showFiltersActionPerformer](self, "showFiltersActionPerformer");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectButton")
           || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground"))
    {
      -[PXCuratedLibrarySectionHeaderLayout selectButtonActionPerformer](self, "selectButtonActionPerformer");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemCancelButton")
           || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground"))
    {
      -[PXCuratedLibrarySectionHeaderLayout cancelButtonActionPerformer](self, "cancelButtonActionPerformer");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButton")
           || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground"))
    {
      -[PXCuratedLibrarySectionHeaderLayout toggleAspectFitButtonActionPerformer](self, "toggleAspectFitButtonActionPerformer");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButton")
           || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground"))
    {
      -[PXCuratedLibrarySectionHeaderLayout zoomInButtonActionPerformer](self, "zoomInButtonActionPerformer");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (v5 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButton")
           || v5 == CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground"))
    {
      -[PXCuratedLibrarySectionHeaderLayout zoomOutButtonActionPerformer](self, "zoomOutButtonActionPerformer");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v5 != CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButton")
        && v5 != CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground"))
      {
        v12 = 0;
        goto LABEL_20;
      }
      -[PXCuratedLibrarySectionHeaderLayout showSidebarButtonActionPerformer](self, "showSidebarButtonActionPerformer");
      v8 = objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = (void *)v8;
LABEL_20:

  return v12;
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8;
  void *v9;
  const __CFString *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  objc_super v16;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "actionType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("PXCuratedLibraryActionEllipsisButton")))
    {
      if (self->_wantsOverBackgroundAppearance)
        v10 = CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground");
      else
        v10 = CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButton");
      v11 = -[NSArray indexOfObject:](self->_itemIdentifierBySpriteIndex, "indexOfObject:", v10);
      -[PXCuratedLibrarySectionHeaderLayout ellipsisButtonActionPerformer](self, "ellipsisButtonActionPerformer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("PXCuratedLibraryActionShowFilters")))
      {
        +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "enableFilterIndicatorButton") & 1) != 0)
        {
          v14 = CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButton");
        }
        else if ((objc_msgSend(v13, "enableFilterDropDownButton") & 1) != 0)
        {
          v14 = CFSTR("PXCuratedLibrarySectionHeaderItemFilterButton");
        }
        else if (objc_msgSend(v13, "enableNewActionMenu"))
        {
          v14 = CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButton");
        }
        else
        {
          v14 = 0;
        }
        v11 = -[NSArray indexOfObject:](self->_itemIdentifierBySpriteIndex, "indexOfObject:", v14);
        -[PXCuratedLibrarySectionHeaderLayout showFiltersActionPerformer](self, "showFiltersActionPerformer");
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("PXCuratedLibraryActionEnterSelectMode")))
      {
        v11 = -[NSArray indexOfObject:](self->_itemIdentifierBySpriteIndex, "indexOfObject:", CFSTR("PXCuratedLibrarySectionHeaderItemSelectButton"));
        -[PXCuratedLibrarySectionHeaderLayout selectButtonActionPerformer](self, "selectButtonActionPerformer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("PXCuratedLibraryActionCancelSelectMode")))
      {
        v11 = -[NSArray indexOfObject:](self->_itemIdentifierBySpriteIndex, "indexOfObject:", CFSTR("PXCuratedLibrarySectionHeaderItemCancelButton"));
        -[PXCuratedLibrarySectionHeaderLayout cancelButtonActionPerformer](self, "cancelButtonActionPerformer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("PXCuratedLibraryActionAllPhotosToggleAspectFit")))
      {
        v11 = -[NSArray indexOfObject:](self->_itemIdentifierBySpriteIndex, "indexOfObject:", CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButton"));
        -[PXCuratedLibrarySectionHeaderLayout toggleAspectFitButtonActionPerformer](self, "toggleAspectFitButtonActionPerformer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("PXCuratedLibraryActionAllPhotosZoomIn")))
      {
        v11 = -[NSArray indexOfObject:](self->_itemIdentifierBySpriteIndex, "indexOfObject:", CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButton"));
        -[PXCuratedLibrarySectionHeaderLayout zoomInButtonActionPerformer](self, "zoomInButtonActionPerformer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v9, "isEqualToString:", CFSTR("PXCuratedLibraryActionAllPhotosZoomOut")))
        {
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("PXCuratedLibraryActionShowSidebar")))
          {
            v11 = -[NSArray indexOfObject:](self->_itemIdentifierBySpriteIndex, "indexOfObject:", CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButton"));
            -[PXCuratedLibrarySectionHeaderLayout showSidebarButtonActionPerformer](self, "showSidebarButtonActionPerformer");
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = -1;
          }
          goto LABEL_22;
        }
        v11 = -[NSArray indexOfObject:](self->_itemIdentifierBySpriteIndex, "indexOfObject:", CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButton"));
        -[PXCuratedLibrarySectionHeaderLayout zoomOutButtonActionPerformer](self, "zoomOutButtonActionPerformer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    *a5 = v12;
LABEL_22:

    goto LABEL_23;
  }
  v16.receiver = self;
  v16.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  v11 = -[PXGLayout spriteIndexForObjectReference:options:updatedObjectReference:](&v16, sel_spriteIndexForObjectReference_options_updatedObjectReference_, v8, a4, a5);
LABEL_23:

  return v11;
}

- (void)referenceOptionsDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  -[PXGLayout referenceOptionsDidChange](&v8, sel_referenceOptionsDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout referenceOptionsDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1111, CFSTR("invalidating %lu after it already has been updated"), 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 32;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)alphaDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibrarySectionHeaderLayout;
  -[PXGLayout alphaDidChange](&v8, sel_alphaDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout alphaDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1121, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_invalidateEllipsisButton
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  ++self->_ellipsisButtonVersion;
  self->_cachedSizeByButtonIdentifier[0] = *(CGSize *)off_1E50B8810;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout _invalidateEllipsisButton]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1323, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_invalidateFilterButton
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  ++self->_filterButtonVersion;
  self->_cachedSizeByButtonIdentifier[1] = *(CGSize *)off_1E50B8810;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout _invalidateFilterButton]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1375, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_invalidateFilterIndicatorButton
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  ++self->_filterIndicatorButtonVersion;
  self->_cachedSizeByButtonIdentifier[2] = *(CGSize *)off_1E50B8810;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout _invalidateFilterIndicatorButton]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1389, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)setLongestPossibleSelectionTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *longestPossibleSelectionTitle;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;
  NSString *v15;

  v15 = (NSString *)a3;
  v4 = self->_longestPossibleSelectionTitle;
  if (v4 == v15)
  {

LABEL_10:
    v7 = v15;
    goto LABEL_11;
  }
  v5 = v4;
  v6 = -[NSString isEqualToString:](v15, "isEqualToString:", v4);

  v7 = v15;
  if (!v6)
  {
    v8 = (NSString *)-[NSString copy](v15, "copy");
    longestPossibleSelectionTitle = self->_longestPossibleSelectionTitle;
    self->_longestPossibleSelectionTitle = v8;

    self->_cachedLongestPossibleSelectionTitleSize = *(CGSize *)off_1E50B8810;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_10;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      v7 = v15;
      if (willPerformUpdate)
        goto LABEL_11;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout setLongestPossibleSelectionTitle:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1407, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)_handleAsyncDateDescription:(id)a3 title:(id)a4 subtitle:(id)a5 placement:(int64_t)a6 generation:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  int64_t v20;
  int64_t v21;
  SEL v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (self->_asyncDateGeneration == a7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__PXCuratedLibrarySectionHeaderLayout__handleAsyncDateDescription_title_subtitle_placement_generation___block_invoke;
    block[3] = &unk_1E5116CC0;
    v20 = a7;
    v21 = a6;
    block[4] = self;
    v22 = a2;
    v17 = v13;
    v18 = v15;
    v19 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v10;
  PXCuratedLibraryHitTestResult *v14;
  PXCuratedLibraryHitTestResult *v15;

  v3 = *(_QWORD *)&a3;
  -[PXCuratedLibrarySectionHeaderLayout assetCollectionReference](self, "assetCollectionReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout spriteReferenceForSpriteIndex:objectReference:](self, "spriteReferenceForSpriteIndex:objectReference:", v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_itemIdentifierBySpriteIndex, "objectAtIndexedSubscript:", v3);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButton")
    || v7 == CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground"))
  {
    v10 = 7;
  }
  else if (v7 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterButton")
         || v7 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground"))
  {
    v10 = 8;
  }
  else if (v7 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButton")
         || v7 == CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButtonOverBackground"))
  {
    v10 = 9;
  }
  else if (v7 == CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButton")
         || v7 == CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground"))
  {
    v10 = 10;
  }
  else
  {
    v10 = 11;
    if (v7 != CFSTR("PXCuratedLibrarySectionHeaderItemSelectButton")
      && v7 != CFSTR("PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground"))
    {
      v10 = 12;
      if (v7 != CFSTR("PXCuratedLibrarySectionHeaderItemCancelButton")
        && v7 != CFSTR("PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground"))
      {
        v10 = 13;
        if (v7 != CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButton")
          && v7 != CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground"))
        {
          v10 = 14;
          if (v7 != CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButton")
            && v7 != CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground"))
          {
            v10 = 15;
            if (v7 != CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButton")
              && v7 != CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground"))
            {
              v10 = 16;
              if (v7 != CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButton")
                && v7 != CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground"))
              {
                if (v7 != CFSTR("PXCuratedLibrarySectionHeaderItemTitleHitArea"))
                {
                  if (!v5)
                  {
                    v15 = 0;
                    goto LABEL_45;
                  }
                  v10 = 5;
                  goto LABEL_42;
                }
                v10 = 6;
              }
            }
          }
        }
      }
    }
  }
  if (!v5)
  {
    v14 = -[PXCuratedLibraryHitTestResult initWithControl:spriteReference:layout:]([PXCuratedLibraryHitTestResult alloc], "initWithControl:spriteReference:layout:", v10, v6, self);
    goto LABEL_44;
  }
LABEL_42:
  v14 = -[PXCuratedLibraryHitTestResult initWithControl:spriteReference:layout:assetCollectionReference:]([PXCuratedLibraryHitTestResult alloc], "initWithControl:spriteReference:layout:assetCollectionReference:", v10, v6, self, v5);
LABEL_44:
  v15 = v14;
LABEL_45:

  return v15;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  char v11;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext == a5)
  {
    if ((v6 & 3) == 0)
      goto LABEL_14;
    goto LABEL_12;
  }
  if ((void *)PXLibraryFilterStateObservationContext == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_14;
LABEL_12:
    v18 = v9;
    -[PXCuratedLibrarySectionHeaderLayout _invalidateEllipsisButton](self, "_invalidateEllipsisButton");
LABEL_13:
    v9 = v18;
    goto LABEL_14;
  }
  if ((void *)AlternateAppearanceMixAnimatorObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 2019, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 2) != 0)
  {
    v18 = v9;
    -[PXCuratedLibrarySectionHeaderLayout alternateAppearanceMixAnimator](self, "alternateAppearanceMixAnimator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isBeingMutated");

    v9 = v18;
    if ((v11 & 1) == 0)
    {
      p_updateFlags = &self->_updateFlags;
      needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_17:
          p_updateFlags->needsUpdate = needsUpdate | 2;
          goto LABEL_14;
        }
LABEL_16:
        if ((self->_updateFlags.updated & 2) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionHeaderLayout observable:didChange:context:]");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 2016, CFSTR("invalidating %lu after it already has been updated"), 2);

          abort();
        }
        goto LABEL_17;
      }
      if (self->_updateFlags.isPerformingUpdate)
        goto LABEL_16;
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 2;
      if (willPerformUpdate)
        goto LABEL_14;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_13;
    }
  }
LABEL_14:

}

- (BOOL)wantsOverBackgroundAppearance
{
  return self->_wantsOverBackgroundAppearance;
}

- (PXCuratedLibraryActionPerformer)zoomInButtonActionPerformer
{
  return self->_zoomInButtonActionPerformer;
}

- (PXCuratedLibraryActionPerformer)zoomOutButtonActionPerformer
{
  return self->_zoomOutButtonActionPerformer;
}

- (NSString)filterButtonCaption
{
  return self->_filterButtonCaption;
}

- (NSString)filterButtonTitle
{
  return self->_filterButtonTitle;
}

- (BOOL)filterButtonHighlighted
{
  return self->_filterButtonHighlighted;
}

- (NSString)longestPossibleSelectionTitle
{
  return self->_longestPossibleSelectionTitle;
}

- (NSString)toggleAspectFitButtonTitle
{
  return self->_toggleAspectFitButtonTitle;
}

- (NSSet)toggleAspectFitButtonPossibleTitles
{
  return self->_toggleAspectFitButtonPossibleTitles;
}

- (int64_t)toggleAspectFitCompactButtonSymbol
{
  return self->_toggleAspectFitCompactButtonSymbol;
}

- (void)setLeadingButtonsLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_leadingButtonsLayoutGuide, a3);
}

- (BOOL)usesCompactToggleAspectFitButton
{
  return self->_usesCompactToggleAspectFitButton;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_alternateAppearanceMixAnimator, 0);
  objc_storeStrong((id *)&self->_effectiveOverBackgroundTitleSubtitleLabelSpec, 0);
  objc_storeStrong((id *)&self->_effectiveTitleSubtitleLabelSpec, 0);
  objc_storeStrong((id *)&self->_effectiveSpec, 0);
  objc_storeStrong((id *)&self->_leadingButtonsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_externalTopButtonConfigurations, 0);
  objc_storeStrong((id *)&self->_externalLeadingButtonConfigurations, 0);
  objc_storeStrong((id *)&self->_externalTrailingButtonConfigurations, 0);
  objc_storeStrong((id *)&self->_toggleAspectFitButtonPossibleTitles, 0);
  objc_storeStrong((id *)&self->_toggleAspectFitButtonTitle, 0);
  objc_storeStrong((id *)&self->_longestPossibleSelectionTitle, 0);
  objc_storeStrong((id *)&self->_selectionTitle, 0);
  objc_storeStrong((id *)&self->_filterButtonTitle, 0);
  objc_storeStrong((id *)&self->_filterButtonCaption, 0);
  objc_storeStrong((id *)&self->_selectButtonTitle, 0);
  objc_storeStrong((id *)&self->_showSidebarButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_toggleAspectFitButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_zoomOutButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_zoomInButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_cancelButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_selectButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_showFiltersActionPerformer, 0);
  objc_storeStrong((id *)&self->_ellipsisButtonActionPerformer, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_asyncDateQueue, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_itemIdentifierBySpriteIndex, 0);
}

void __67__PXCuratedLibrarySectionHeaderLayout_configurationForButton_spec___block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "controlStackButtonSelected") ^ 1;
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setControlStackButtonSelected:", v2);

}

uint64_t __72__PXCuratedLibrarySectionHeaderLayout_setWantsOverBackgroundAppearance___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

_QWORD *__103__PXCuratedLibrarySectionHeaderLayout__handleAsyncDateDescription_title_subtitle_placement_generation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  _QWORD *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 64);
  result = *(_QWORD **)(a1 + 32);
  if (v2 == result[146])
  {
    v4 = *(_QWORD *)(a1 + 72);
    switch(v4)
    {
      case 1:
        objc_msgSend(result, "setTitle:", *(_QWORD *)(a1 + 40));
        v5 = (_QWORD *)(a1 + 48);
        break;
      case 2:
        objc_msgSend(result, "setTitle:", *(_QWORD *)(a1 + 56));
        v5 = (_QWORD *)(a1 + 40);
        break;
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("PXCuratedLibrarySectionHeaderLayout.m"), 1607, CFSTR("Code which should be unreachable has been reached"));

        abort();
      default:
        return result;
    }
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "setSubtitle:", *v5);
  }
  return result;
}

void __62__PXCuratedLibrarySectionHeaderLayout__updateTitleAndSubtitle__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "localizedDateDescriptionWithOptions:", *(_QWORD *)(a1 + 64));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleAsyncDateDescription:title:subtitle:placement:generation:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

}

void __56__PXCuratedLibrarySectionHeaderLayout__updateSpriteTags__block_invoke_240(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  unsigned int v7;
  __int128 *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;

  v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v7 = a2;
    v9 = (__int128 *)(a1 + 40);
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 896), "objectAtIndexedSubscript:", v7, v12, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_updateSpriteTags_itemIDToSpriteKindMap, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "integerValue");

      v12 = *v9;
      v13 = v9[1];
      *(_QWORD *)(a5 + 40 * v7 + 24) = PXGSectionedSpriteTagMake();

      ++v7;
      --v5;
    }
    while (v5);
  }
}

void __56__PXCuratedLibrarySectionHeaderLayout__updateSpriteTags__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[23];
  _QWORD v3[24];

  v3[23] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PXCuratedLibrarySectionHeaderItemGradient");
  v2[1] = CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitle");
  v3[0] = &unk_1E53EAD28;
  v3[1] = &unk_1E53EAD40;
  v2[2] = CFSTR("PXCuratedLibrarySectionHeaderItemTitleSubtitleOverBackground");
  v2[3] = CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButton");
  v3[2] = &unk_1E53EAD40;
  v3[3] = &unk_1E53EAD58;
  v2[4] = CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground");
  v2[5] = CFSTR("PXCuratedLibrarySectionHeaderItemFilterButton");
  v3[4] = &unk_1E53EAD58;
  v3[5] = &unk_1E53EAD70;
  v2[6] = CFSTR("PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground");
  v2[7] = CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButton");
  v3[6] = &unk_1E53EAD70;
  v3[7] = &unk_1E53EAD88;
  v2[8] = CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButtonOverBackground");
  v2[9] = CFSTR("PXCuratedLibrarySectionHeaderItemSelectButton");
  v3[8] = &unk_1E53EAD88;
  v3[9] = &unk_1E53EADA0;
  v2[10] = CFSTR("PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground");
  v2[11] = CFSTR("PXCuratedLibrarySectionHeaderItemCancelButton");
  v3[10] = &unk_1E53EADA0;
  v3[11] = &unk_1E53EADB8;
  v2[12] = CFSTR("PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground");
  v2[13] = CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButton");
  v3[12] = &unk_1E53EADB8;
  v3[13] = &unk_1E53EADD0;
  v2[14] = CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground");
  v2[15] = CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButton");
  v3[14] = &unk_1E53EADD0;
  v3[15] = &unk_1E53EADE8;
  v2[16] = CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground");
  v2[17] = CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButton");
  v3[16] = &unk_1E53EADE8;
  v3[17] = &unk_1E53EAE00;
  v2[18] = CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground");
  v2[19] = CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButton");
  v3[18] = &unk_1E53EAE00;
  v3[19] = &unk_1E53EAE18;
  v2[20] = CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground");
  v2[21] = CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButton");
  v3[20] = &unk_1E53EAE18;
  v3[21] = &unk_1E53EAE30;
  v2[22] = CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground");
  v3[22] = &unk_1E53EAE30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 23);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateSpriteTags_itemIDToSpriteKindMap;
  _updateSpriteTags_itemIDToSpriteKindMap = v0;

}

void __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_3(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  int v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void (**v15)(void *, const __CFString *, const __CFString *, _QWORD);
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[4];
  id v19;
  uint64_t v20;
  uint64_t v21;

  v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v7 = a2;
    v9 = 0;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 896), "objectAtIndexedSubscript:", (v7 + v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = v10;
      aBlock[1] = 3221225472;
      aBlock[2] = __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_4;
      aBlock[3] = &unk_1E5116BB8;
      v19 = v11;
      v20 = a5;
      v21 = v9;
      v12 = v11;
      v13 = _Block_copy(aBlock);
      v16[0] = v10;
      v16[1] = 3221225472;
      v16[2] = __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_5;
      v16[3] = &unk_1E5116BE0;
      v17 = v13;
      v14 = v13;
      v15 = (void (**)(void *, const __CFString *, const __CFString *, _QWORD))_Block_copy(v16);
      v15[2](v15, CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButton"), CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 874));
      v15[2](v15, CFSTR("PXCuratedLibrarySectionHeaderItemFilterButton"), CFSTR("PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 876));
      v15[2](v15, CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButton"), CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 878));
      v15[2](v15, CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButton"), CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 892));
      v15[2](v15, CFSTR("PXCuratedLibrarySectionHeaderItemSelectButton"), CFSTR("PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 882));
      v15[2](v15, CFSTR("PXCuratedLibrarySectionHeaderItemCancelButton"), CFSTR("PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 884));
      v15[2](v15, CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButton"), CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 886));
      v15[2](v15, CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButton"), CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 888));
      v15[2](v15, CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButton"), CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 890));

      ++v9;
    }
    while (v5 != v9);
  }
}

_QWORD *__68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_4(_QWORD *result, uint64_t a2, __int16 a3)
{
  if (result[4] == a2)
    *(_WORD *)(result[5] + 40 * result[6] + 32) = a3;
  return result;
}

void __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  id v9;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v9 = a3;
  v8(v7, a2, a4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)_updateButtonActionPerformers_buttonIDs, "containsObject:", a2);
}

void __68__PXCuratedLibrarySectionHeaderLayout__updateButtonActionPerformers__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[21];

  v2[20] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButton");
  v2[1] = CFSTR("PXCuratedLibrarySectionHeaderItemEllipsisButtonOverBackground");
  v2[2] = CFSTR("PXCuratedLibrarySectionHeaderItemFilterButton");
  v2[3] = CFSTR("PXCuratedLibrarySectionHeaderItemFilterButtonOverBackground");
  v2[4] = CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButton");
  v2[5] = CFSTR("PXCuratedLibrarySectionHeaderItemFilterIndicatorButtonOverBackground");
  v2[6] = CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButton");
  v2[7] = CFSTR("PXCuratedLibrarySectionHeaderItemControlStackButtonOverBackground");
  v2[8] = CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButton");
  v2[9] = CFSTR("PXCuratedLibrarySectionHeaderItemZoomInButtonOverBackground");
  v2[10] = CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButton");
  v2[11] = CFSTR("PXCuratedLibrarySectionHeaderItemZoomOutButtonOverBackground");
  v2[12] = CFSTR("PXCuratedLibrarySectionHeaderItemSelectButton");
  v2[13] = CFSTR("PXCuratedLibrarySectionHeaderItemSelectButtonOverBackground");
  v2[14] = CFSTR("PXCuratedLibrarySectionHeaderItemCancelButton");
  v2[15] = CFSTR("PXCuratedLibrarySectionHeaderItemCancelButtonOverBackground");
  v2[16] = CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButton");
  v2[17] = CFSTR("PXCuratedLibrarySectionHeaderItemToggleAspectFitButtonOverBackground");
  v2[18] = CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButton");
  v2[19] = CFSTR("PXCuratedLibrarySectionHeaderItemShowSidebarButtonOverBackground");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 20);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateButtonActionPerformers_buttonIDs;
  _updateButtonActionPerformers_buttonIDs = v0;

}

@end
