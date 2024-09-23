@implementation SBWindowingLayoutFormatAdapter

- (SBWindowingLayoutFormatAdapter)initWithWindowScene:(id)a3
{
  id v4;
  SBWindowingLayoutFormatAdapter *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  SBSwitcherChamoisLayoutAttributes *chamoisLayoutAttributes;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBWindowingLayoutFormatAdapter;
  v5 = -[SBWindowingLayoutFormatAdapter init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "switcherController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    v9 = v7;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v5->_containerViewBounds.origin.x = v13;
    v5->_containerViewBounds.origin.y = v14;
    v5->_containerViewBounds.size.width = v15;
    v5->_containerViewBounds.size.height = v16;

    objc_msgSend(v11, "chamoisLayoutAttributes");
    v17 = objc_claimAutoreleasedReturnValue();

    chamoisLayoutAttributes = v5->_chamoisLayoutAttributes;
    v5->_chamoisLayoutAttributes = (SBSwitcherChamoisLayoutAttributes *)v17;

  }
  return v5;
}

- (CGRect)_calculateProposedFrameForSizeClass:(int64_t)a3 positionClass:(int64_t)a4 index:(unint64_t)a5
{
  double width;
  double height;
  SBSwitcherChamoisLayoutAttributes *v11;
  SBSwitcherChamoisLayoutAttributes *v12;
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
  CGRect result;

  width = self->_containerViewBounds.size.width;
  height = self->_containerViewBounds.size.height;
  v11 = self->_chamoisLayoutAttributes;
  v12 = v11;
  v13 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  if (self->_numberOfItems != 1)
  {
    -[SBSwitcherChamoisLayoutAttributes stageInterItemSpacing](v11, "stageInterItemSpacing");
    v14 = v16;
    if (self->_numberOfItems != 1)
    {
      -[SBSwitcherChamoisLayoutAttributes screenEdgePadding](v12, "screenEdgePadding");
      v15 = v17;
    }
  }
  v18 = 0.0;
  switch(a3)
  {
    case 0:
      v18 = (width + v15 * -2.0) / (double)self->_numberOfItems - v14;
      goto LABEL_9;
    case 1:
    case 2:
      v13 = height;
      v18 = width;
      break;
    case 3:
      -[SBSwitcherChamoisLayoutAttributes minimumWindowWidth](v12, "minimumWindowWidth");
      v18 = v19;
      -[SBSwitcherChamoisLayoutAttributes minimumWindowWidth](v12, "minimumWindowWidth");
      v13 = v20;
      break;
    case 4:
      break;
    case 5:
      v18 = (width - v15 * 2.0) * 0.5 - v14;
      v13 = (height - v15 * 2.0) * 0.5 - v14;
      break;
    case 6:
      v18 = (width + v15 * -2.0) * 0.5;
LABEL_9:
      v13 = height;
      break;
    default:
      v18 = 0.0;
      break;
  }
  v21 = 0.0;
  switch(a4)
  {
    case 0:
      if (a5)
        v15 = v14 + v18 + self->_xPositionOffset;
      self->_xPositionOffset = v15;
      UIRectGetCenter();
      +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:");
      v21 = v22;
      v24 = v23;
      break;
    case 1:
      v24 = 0.5;
      v21 = 0.5;
      break;
    case 2:
      v21 = 1.0;
      goto LABEL_18;
    case 3:
      v24 = 0.01;
      v21 = 0.01;
      break;
    case 4:
      v24 = 1.0;
      break;
    case 5:
      v24 = 1.0;
      v21 = 1.0;
      break;
    default:
LABEL_18:
      v24 = 0.0;
      break;
  }

  v25 = v21;
  v26 = v24;
  v27 = v18;
  v28 = v13;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)_createLayoutRoleToLayoutAttributesMap
{
  CGSize size;
  SBSwitcherChamoisLayoutAttributes *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  SBSwitcherChamoisLayoutAttributes *v8;
  _QWORD v9[5];
  SBSwitcherChamoisLayoutAttributes *v10;
  uint64_t *v11;
  CGPoint v12;
  CGSize v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  CGPoint origin;
  CGSize v21;

  size = self->_containerViewBounds.size;
  origin = self->_containerViewBounds.origin;
  v21 = size;
  v4 = self->_chamoisLayoutAttributes;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__91;
  v18 = __Block_byref_object_dispose__91;
  v19 = (id)objc_opt_new();
  -[NSArray bs_flatten](self->_layoutRequests, "bs_flatten");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = MEMORY[0x1E0C809B0];
  self->_numberOfItems = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __72__SBWindowingLayoutFormatAdapter__createLayoutRoleToLayoutAttributesMap__block_invoke;
  v9[3] = &unk_1E8EBA920;
  v9[4] = self;
  v8 = v4;
  v12 = origin;
  v13 = v21;
  v10 = v8;
  v11 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
  if (objc_msgSend((id)v15[5], "count"))
    objc_storeStrong((id *)&self->_layoutRoleToLayoutAttributes, (id)v15[5]);

  _Block_object_dispose(&v14, 8);
}

void __72__SBWindowingLayoutFormatAdapter__createLayoutRoleToLayoutAttributesMap__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  SBDisplayItemLayoutAttributes *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _BYTE v36[56];
  _BYTE v37[56];
  _BYTE v38[56];
  _BYTE v39[56];

  v5 = a2;
  v6 = objc_alloc_init(SBDisplayItemLayoutAttributes);
  objc_msgSend(*(id *)(a1 + 32), "_calculateProposedFrameForSizeClass:positionClass:index:", objc_msgSend(v5, "size"), objc_msgSend(v5, "position"), a3);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v5, "size");
  if ((unint64_t)(v15 - 1) >= 2)
  {
    if (v15 == 4)
    {
      -[SBDisplayItemLayoutAttributes attributesByModifyingSizingPolicy:](v6, "attributesByModifyingSizingPolicy:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "defaultWindowSize");
      v20 = v19;
      v22 = v21;
      objc_msgSend(*(id *)(a1 + 40), "defaultWindowSize");
      objc_msgSend(*(id *)(a1 + 40), "screenEdgePadding");
      v35 = v23;
      SBDisplayItemAttributedSizeInfer((uint64_t)v37, v20, v22, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
      v24 = v37;
    }
    else
    {
      -[SBDisplayItemLayoutAttributes attributesByModifyingSizingPolicy:](v6, "attributesByModifyingSizingPolicy:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "defaultWindowSize");
      objc_msgSend(*(id *)(a1 + 40), "screenEdgePadding");
      v35 = v25;
      SBDisplayItemAttributedSizeInfer((uint64_t)v36, v12, v14, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
      v24 = v36;
    }
    objc_msgSend(v17, "attributesByModifyingAttributedSize:", v24, v35);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBDisplayItemLayoutAttributes attributesByModifyingSizingPolicy:](v6, "attributesByModifyingSizingPolicy:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "attributesByModifyingAttributedSize:", v39, SBDisplayItemAttributedSizeUnspecified((uint64_t)v39).n128_f64[0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "attributesByModifyingAttributedUserSizeBeforeOverlapping:", v38, SBDisplayItemAttributedSizeUnspecified((uint64_t)v38).n128_f64[0]);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v18;

  objc_msgSend(v26, "attributesByModifyingNormalizedCenter:", v8, v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v5, "wantsFocus");
  v29 = 56;
  if (v28)
    v29 = 48;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + v29);
  objc_msgSend(v27, "attributesByModifyingLastInteractionTime:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "wantsFocus"))
    v31 = 1;
  else
    v31 = 2;
  objc_msgSend(v30, "attributesByModifyingOcclusionState:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "layoutRole"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKey:", v32, v34);

}

- (void)parse:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  NSArray *v7;
  id v8;
  NSArray *layoutRequests;
  id v10;

  v10 = 0;
  +[SBWindowingLayoutFormatParser parse:bundleIdentifiersToLaunch:error:](SBWindowingLayoutFormatParser, "parse:bundleIdentifiersToLaunch:error:", a3, a4, &v10);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  layoutRequests = self->_layoutRequests;
  self->_layoutRequests = v7;

  if (v8)
    *a5 = objc_retainAutorelease(v8);
  else
    -[SBWindowingLayoutFormatAdapter _createLayoutRoleToLayoutAttributesMap](self, "_createLayoutRoleToLayoutAttributesMap");

}

- (NSArray)layoutRequests
{
  return self->_layoutRequests;
}

- (NSDictionary)layoutRoleToLayoutAttributes
{
  return self->_layoutRoleToLayoutAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutRoleToLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_layoutRequests, 0);
  objc_storeStrong((id *)&self->_chamoisLayoutAttributes, 0);
}

@end
