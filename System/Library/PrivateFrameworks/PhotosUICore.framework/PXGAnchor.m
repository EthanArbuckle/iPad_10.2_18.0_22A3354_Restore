@implementation PXGAnchor

- (void)adjustReferencedSpriteIndexesWithChangeDetails:(id)a3 appliedToLayout:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_QWORD *, void *);
  void *v13;
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__104192;
  v26 = __Block_byref_object_dispose__104193;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __76__PXGAnchor_adjustReferencedSpriteIndexesWithChangeDetails_appliedToLayout___block_invoke;
  v13 = &unk_1E5126868;
  v16 = &v22;
  v8 = v6;
  v14 = v8;
  v9 = v7;
  v15 = v9;
  v17 = &v18;
  -[PXGAnchor enumerateAllSpriteReferencesUsingBlock:](self, "enumerateAllSpriteReferencesUsingBlock:", &v10);
  if (objc_msgSend((id)v23[5], "count", v10, v11, v12, v13) && !*((_BYTE *)v19 + 24))
    -[PXGAnchor invalidate](self, "invalidate");

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

}

- (void)enumerateAllSpriteReferencesUsingBlock:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[3];
  char v26;
  _QWORD aBlock[4];
  id v28;

  v5 = a3;
  -[PXGAnchor spriteReferences](self, "spriteReferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGAnchor constraints](self, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") && objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAnchor.m"), 511, CFSTR("an anchor (%@) cannot have both spriteReferences (%@) and constraints (%@)"), self, v6, v7);

  }
  -[PXGAnchor spriteRects](self, "spriteRects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PXGAnchor_enumerateAllSpriteReferencesUsingBlock___block_invoke;
  aBlock[3] = &unk_1E5126890;
  v10 = v8;
  v28 = v10;
  v11 = _Block_copy(aBlock);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __52__PXGAnchor_enumerateAllSpriteReferencesUsingBlock___block_invoke_2;
  v21[3] = &unk_1E51268B8;
  v12 = v5;
  v21[4] = self;
  v22 = v12;
  v13 = v11;
  v23 = v13;
  v24 = v25;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v21);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __52__PXGAnchor_enumerateAllSpriteReferencesUsingBlock___block_invoke_3;
  v17[3] = &unk_1E51268E0;
  v14 = v12;
  v18 = v14;
  v15 = v13;
  v19 = v15;
  v20 = v25;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17);

  _Block_object_dispose(v25, 8);
}

- (NSArray)spriteReferences
{
  return self->_spriteReferences;
}

- (NSArray)spriteRects
{
  return self->_spriteRects;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (BOOL)isAutoInvalidated
{
  return self->_autoInvalidated;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)priority
{
  return self->_priority;
}

- (id)autoInvalidate
{
  *((_BYTE *)self + 10) = 1;
  return self;
}

- (CGRect)adjustVisibleRect:(CGRect)a3
{
  CGFloat y;
  CGFloat x;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void (**v25)(void *, uint64_t);
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  char v40;
  double MinY;
  double MinX;
  double v43;
  double v44;
  double MaxY;
  double v46;
  double v47;
  double v48;
  double v49;
  double MaxX;
  double v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  CGFloat v67;
  void *v68;
  CGFloat rect;
  double v70;
  double v71;
  double v72;
  double height;
  double width;
  _QWORD aBlock[5];
  id v76;
  uint64_t *v77;
  SEL v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD v84[4];
  id v85;
  PXGAnchor *v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  CGFloat v92;
  CGFloat v93;
  double v94;
  double v95;
  CGFloat v96;
  CGFloat v97;
  double v98;
  double v99;
  _QWORD v100[18];
  _QWORD v101[3];
  char v102;
  uint64_t v103;
  double *v104;
  uint64_t v105;
  void *v106;
  __int128 v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v103 = 0;
  v104 = (double *)&v103;
  v105 = 0x3010000000;
  v106 = &unk_1A7E74EE7;
  v107 = *MEMORY[0x1E0C9D538];
  -[PXGAnchor layout](self, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[PXGAnchor scrollPosition](self, "scrollPosition") & 0x100) != 0)
  {
    v70 = *((double *)off_1E50B8020 + 1);
    v71 = *(double *)off_1E50B8020;
  }
  else
  {
    objc_msgSend(v7, "safeAreaInsets");
    v70 = v9;
    v71 = v8;
  }
  -[PXGAnchor padding](self, "padding");
  PXEdgeInsetsAdd();
  PXEdgeInsetsInsetRect();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  switch(-[PXGAnchor type](self, "type"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAnchor.m"), 190, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      -[PXGAnchor visibleRect](self, "visibleRect");
      v101[0] = 0;
      v101[1] = v101;
      v101[2] = 0x2020000000;
      v102 = 0;
      v100[0] = MEMORY[0x1E0C809B0];
      v100[1] = 3221225472;
      v100[2] = __31__PXGAnchor_adjustVisibleRect___block_invoke;
      v100[3] = &unk_1E5126778;
      v100[4] = v101;
      v100[5] = &v103;
      *(CGFloat *)&v100[6] = x;
      *(CGFloat *)&v100[7] = y;
      *(double *)&v100[8] = width;
      *(double *)&v100[9] = height;
      v100[10] = v18;
      v100[11] = v19;
      v100[12] = v20;
      v100[13] = v21;
      v100[14] = v11;
      v100[15] = v13;
      v100[16] = v15;
      v100[17] = v17;
      -[PXGAnchor _enumerateSpriteConstraintsUsingBlock:](self, "_enumerateSpriteConstraintsUsingBlock:", v100);
      _Block_object_dispose(v101, 8);
      break;
    case 2:
      v22 = -[PXGAnchor referencingOptions](self, "referencingOptions");
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __31__PXGAnchor_adjustVisibleRect___block_invoke_3;
      v84[3] = &unk_1E51267C8;
      v85 = v7;
      v86 = self;
      v88 = v11;
      v89 = v13;
      v90 = v15;
      v91 = v17;
      v87 = &v103;
      v92 = x;
      v93 = y;
      v94 = width;
      v95 = height;
      v96 = x;
      v97 = y;
      v98 = width;
      v99 = height;
      -[PXGAnchor enumerateSpritesWithEnumerationOptions:referencingOptions:usingBlock:](self, "enumerateSpritesWithEnumerationOptions:referencingOptions:usingBlock:", 0, v22, v84);
      v23 = v85;
      goto LABEL_8;
    case 3:
      v40 = -[PXGAnchor edges](self, "edges");
      if ((v40 & 1) != 0)
      {
        -[PXGAnchor visibleRect](self, "visibleRect");
        MinY = CGRectGetMinY(v108);
        v109.origin.x = x;
        v109.origin.y = y;
        v109.size.height = height;
        v109.size.width = width;
        v104[5] = MinY - CGRectGetMinY(v109);
      }
      if ((v40 & 2) != 0)
      {
        -[PXGAnchor visibleRect](self, "visibleRect");
        MinX = CGRectGetMinX(v110);
        v111.origin.x = x;
        v111.origin.y = y;
        v111.size.height = height;
        v111.size.width = width;
        v104[4] = MinX - CGRectGetMinX(v111);
      }
      if ((v40 & 4) != 0)
      {
        objc_msgSend(v7, "contentSize");
        v44 = v43;
        v112.origin.x = x;
        v112.origin.y = y;
        v112.size.height = height;
        v112.size.width = width;
        MaxY = CGRectGetMaxY(v112);
        -[PXGAnchor contentSize](self, "contentSize");
        v47 = v46;
        -[PXGAnchor visibleRect](self, "visibleRect");
        v104[5] = v44 - MaxY - v47 + CGRectGetMaxY(v113);
      }
      if ((v40 & 8) != 0)
      {
        objc_msgSend(v7, "contentSize");
        v49 = v48;
        v114.origin.x = x;
        v114.origin.y = y;
        v114.size.height = height;
        v114.size.width = width;
        MaxX = CGRectGetMaxX(v114);
        -[PXGAnchor contentSize](self, "contentSize");
        v52 = v51;
        -[PXGAnchor visibleRect](self, "visibleRect");
        v104[4] = v49 - MaxX - v52 + CGRectGetMaxX(v115);
      }
      break;
    case 4:
      v24 = -[PXGAnchor edges](self, "edges");
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __31__PXGAnchor_adjustVisibleRect___block_invoke_5;
      aBlock[3] = &unk_1E51267F0;
      v78 = a2;
      v79 = v24;
      aBlock[4] = self;
      v77 = &v103;
      v76 = v7;
      v80 = v11;
      v81 = v13;
      v82 = v15;
      v83 = v17;
      v25 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
      v25[2](v25, 1);
      v25[2](v25, 2);

      v23 = v76;
LABEL_8:

      break;
    default:
      break;
  }
  PXPointApproximatelyEqualToPoint();
  PXPointAdd();
  v27 = v26;
  v29 = v28;
  if (self->_delegateRespondsTo.visibleRectOriginForProposedVisibleRectForLayout)
  {
    -[PXGAnchor delegate](self, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "anchor:visibleRectOriginForProposedVisibleRect:forLayout:", self, v7, v27, v29, width, height);
    v27 = v31;
    v29 = v32;

  }
  objc_msgSend(v7, "superlayout");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {

LABEL_14:
    v34 = v29;
    v35 = v27;
    goto LABEL_15;
  }
  if (-[PXGAnchor isScrollingAnimationAnchor](self, "isScrollingAnimationAnchor"))
    goto LABEL_14;
  objc_msgSend(v7, "scrollableAxis");
  PXEdgesForAxis();
  PXEdgeInsetsForEdges();
  PXEdgeInsetsInsetRect();
  v53 = v116.origin.x;
  v54 = v116.size.width;
  v55 = v116.size.height;
  rect = v116.origin.y;
  v56 = CGRectGetMaxY(v116);
  objc_msgSend(v7, "contentSize");
  v58 = v57;
  v59 = v53;
  v117.origin.x = v53;
  v117.origin.y = rect;
  v117.size.width = v54;
  v60 = v55;
  v117.size.height = v55;
  v61 = CGRectGetMinY(v117);
  v62 = v54;
  if (v56 - v58 <= 0.0)
  {
    v34 = v29;
    v35 = v27;
    if (v61 < 0.0)
    {
      v63 = -v61;
      v120.origin.x = v27;
      v120.origin.y = v29;
      v120.size.height = height;
      v120.size.width = width;
      v121 = CGRectOffset(v120, 0.0, v63);
      height = v121.size.height;
      width = v121.size.width;
      v35 = v121.origin.x;
      v34 = v121.origin.y;
    }
  }
  else
  {
    v118.origin.x = v27;
    v118.origin.y = v29;
    v118.size.height = height;
    v118.size.width = width;
    v119 = CGRectOffset(v118, 0.0, -(v56 - v58));
    height = v119.size.height;
    width = v119.size.width;
    v35 = v119.origin.x;
    if (v119.origin.y >= -v71)
      v34 = v119.origin.y;
    else
      v34 = -v71;
  }
  v122.origin.x = v59;
  v122.origin.y = rect;
  v122.size.width = v62;
  v122.size.height = v60;
  v72 = CGRectGetMinX(v122);
  v123.origin.x = v59;
  v123.origin.y = rect;
  v123.size.width = v62;
  v123.size.height = v60;
  v64 = CGRectGetMaxX(v123);
  objc_msgSend(v7, "contentSize");
  v66 = v64 - v65;
  if (v66 <= 0.0)
  {
    if (v72 < 0.0)
    {
      v126.origin.x = v35;
      v126.origin.y = v34;
      v126.size.height = height;
      v126.size.width = width;
      v127 = CGRectOffset(v126, -v72, 0.0);
      height = v127.size.height;
      width = v127.size.width;
      v35 = v127.origin.x;
      v34 = v127.origin.y;
    }
  }
  else
  {
    v67 = -v66;
    v124.origin.x = v35;
    v124.origin.y = v34;
    v124.size.height = height;
    v124.size.width = width;
    v125 = CGRectOffset(v124, v67, 0.0);
    height = v125.size.height;
    width = v125.size.width;
    v34 = v125.origin.y;
    if (v125.origin.x >= -v70)
      v35 = v125.origin.x;
    else
      v35 = -v70;
  }
  PXPointSubtract();
  PXPointApproximatelyEqualToPoint();
LABEL_15:

  _Block_object_dispose(&v103, 8);
  v36 = v35;
  v37 = v34;
  v39 = height;
  v38 = width;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (unint64_t)edges
{
  return self->_edges;
}

uint64_t __31__PXGAnchor_adjustVisibleRect___block_invoke_5(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = result;
  switch(a2)
  {
    case 1:
      v3 = 4;
LABEL_7:
      v4 = a2;
      goto LABEL_8;
    case 2:
      v3 = 8;
      goto LABEL_7;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 32), CFSTR("PXGAnchor.m"), 339, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v3 = 0;
  v4 = 0;
LABEL_8:
  v5 = *(_QWORD *)(result + 64);
  if (((v4 | v3) & ~v5) == 0)
  {
    objc_msgSend(*(id *)(result + 40), "contentSize");
    PXSizeValueForAxis();
    PXRectGetMidForAxis();
    return PXPointSetValueForAxis();
  }
  if ((v5 & v4) != 0)
  {
    PXRectGetMinForAxis();
    return PXPointSetValueForAxis();
  }
  if ((v5 & v3) != 0)
  {
    objc_msgSend(*(id *)(result + 40), "contentSize");
    PXSizeValueForAxis();
    PXRectGetMaxForAxis();
    return PXPointSetValueForAxis();
  }
  return result;
}

- (void)invalidate
{
  id v3;

  -[PXGAnchor layout](self, "layout");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnchor:", self);

}

- (PXGLayout)layout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

- (unint64_t)scrollPosition
{
  return self->_scrollPosition;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdges:(unint64_t)a3
{
  self->_edges = a3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (id)copyWithLayout:(id)a3
{
  id v4;
  uint64_t v5;
  CGPoint origin;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  id WeakRetained;
  id v22;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLayout:", v4);
  *(_QWORD *)(v5 + 40) = self->_type;
  *(_QWORD *)(v5 + 48) = self->_priority;
  origin = self->_visibleRect.origin;
  *(CGSize *)(v5 + 184) = self->_visibleRect.size;
  *(CGPoint *)(v5 + 168) = origin;
  *(CGSize *)(v5 + 120) = self->_contentSize;
  v7 = MEMORY[0x1E0C809B0];
  v22 = v4;
  PXMap();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  v11 = v22;
  PXMap();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy", v7, 3221225472, __28__PXGAnchor_copyWithLayout___block_invoke_2, &unk_1E5126930);
  v14 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v13;

  v15 = objc_msgSend(self->_customOffset, "copy");
  v16 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v15;

  v17 = -[NSArray copy](self->_spriteRects, "copy");
  v18 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v17;

  *(_QWORD *)(v5 + 72) = self->_referencingOptions;
  *(_QWORD *)(v5 + 80) = self->_edges;
  v19 = *(_OWORD *)&self->_padding.top;
  *(_OWORD *)(v5 + 216) = *(_OWORD *)&self->_padding.bottom;
  *(_OWORD *)(v5 + 200) = v19;
  *(_QWORD *)(v5 + 88) = self->_scrollPosition;
  objc_storeStrong((id *)(v5 + 96), self->_date);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak((id *)(v5 + 16), WeakRetained);

  objc_storeStrong((id *)(v5 + 24), self->_context);
  *(_BYTE *)(v5 + 8) = self->_delegateRespondsTo.visibleRectOriginForProposedVisibleRectForLayout;
  *(CGPoint *)(v5 + 136) = self->_visibleLocation;
  *(CGPoint *)(v5 + 152) = self->_normalizedAnchorPoint;

  return (id)v5;
}

- (PXGAnchor)initWithLayout:(id)a3
{
  id v4;
  PXGAnchor *v5;
  PXGAnchor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGAnchor;
  v5 = -[PXGAnchor init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_layout, v4);
    v6->_priority = 1;
    v6->_visibleLocation = *(CGPoint *)off_1E50B8580;
  }

  return v6;
}

- (void)setSpriteRects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isScrollingAnimationAnchor
{
  return (unint64_t)-[PXGAnchor type](self, "type") > 4;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_customOffset, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_spriteRects, 0);
  objc_storeStrong((id *)&self->_spriteReferences, 0);
  objc_destroyWeak((id *)&self->_layout);
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (unint64_t)anchoredContentEdges
{
  if ((unint64_t)(-[PXGAnchor type](self, "type") - 3) > 2)
    return 0;
  else
    return -[PXGAnchor edges](self, "edges");
}

- (BOOL)shouldFaultInContentAtAnchoredContentEdges
{
  return (unint64_t)(-[PXGAnchor type](self, "type") - 3) < 3;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (BOOL)canBeReused
{
  void *v3;
  double v4;
  double v5;
  BOOL v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  -[PXGAnchor date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;

  if (v5 > 0.0 || v5 <= -120.0)
    return 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __24__PXGAnchor_canBeReused__block_invoke;
  v9[3] = &unk_1E5126728;
  v9[4] = &v14;
  v9[5] = &v10;
  -[PXGAnchor enumerateAllSpriteReferencesUsingBlock:](self, "enumerateAllSpriteReferencesUsingBlock:", v9);
  if (*((_BYTE *)v11 + 24))
    v7 = 1;
  else
    v7 = *((_BYTE *)v15 + 24) == 0;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (PXGAnchor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAnchor.m"), 121, CFSTR("%s is not available as initializer"), "-[PXGAnchor init]");

  abort();
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.visibleRectOriginForProposedVisibleRectForLayout = objc_opt_respondsToSelector() & 1;
  }

}

- (NSString)description
{
  objc_class *v3;
  const __CFString *v4;
  __CFString *v5;
  unint64_t type;
  int64_t priority;
  __CFString *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id WeakRetained;
  void *v22;
  void *v23;
  CGRect v24;

  v22 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("unknown");
  v5 = CFSTR("Default");
  type = self->_type;
  priority = self->_priority;
  if (priority != 1)
    v5 = CFSTR("unknown");
  if (!priority)
    v5 = CFSTR("Low");
  if (type <= 5)
    v4 = off_1E5126B20[type];
  v8 = v5;
  -[PXGAnchor visibleRect](self, "visibleRect");
  NSStringFromCGRect(v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained((id *)&self->_layout);
  -[PXGAnchor constraints](self, "constraints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(",\n"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGAnchor spriteReferences](self, "spriteReferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR(",\n"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = &stru_1E5149688;
  if (v16)
    v18 = (const __CFString *)v16;
  objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@: %p; priority = %@; type = %@; visibleRect = %@; layout = <%@: %p>; constraints = [%@]; spriteReferences = [%@];>"),
    v23,
    self,
    v8,
    v4,
    v9,
    v11,
    v12,
    v14,
    v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

- (unsigned)anchoredSpriteIndexInLayout:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = -1;
  v5 = -[PXGAnchor type](self, "type");
  if (v5 == 1)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__PXGAnchor_anchoredSpriteIndexInLayout___block_invoke;
    v11[3] = &unk_1E5126818;
    v11[4] = &v12;
    -[PXGAnchor _enumerateSpriteConstraintsUsingBlock:](self, "_enumerateSpriteConstraintsUsingBlock:", v11);
  }
  else if (v5 == 2)
  {
    v6 = -[PXGAnchor referencingOptions](self, "referencingOptions");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__PXGAnchor_anchoredSpriteIndexInLayout___block_invoke_2;
    v10[3] = &unk_1E5126840;
    v10[4] = &v12;
    -[PXGAnchor enumerateSpritesWithEnumerationOptions:referencingOptions:usingBlock:](self, "enumerateSpritesWithEnumerationOptions:referencingOptions:usingBlock:", 0, v6, v10);
  }
  v7 = *((unsigned int *)v13 + 6);
  -[PXGAnchor layout](self, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v4, "convertSpriteIndex:fromLayout:", v7, v8);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)enumerateSpritesWithEnumerationOptions:(unint64_t)a3 referencingOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a5;
  -[PXGAnchor layout](self, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__PXGAnchor_enumerateSpritesWithEnumerationOptions_referencingOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E5126958;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[PXGAnchor enumerateAllSpriteReferencesUsingBlock:](self, "enumerateAllSpriteReferencesUsingBlock:", v10);

}

- (void)_enumerateSpriteConstraintsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PXGAnchor *v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[4];
  __int128 v18;
  __int128 v19;
  _QWORD v20[3];
  int v21;
  _QWORD v22[4];
  _QWORD v23[5];
  id v24;

  v4 = a3;
  -[PXGAnchor layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__104192;
  v23[4] = __Block_byref_object_dispose__104193;
  v24 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x4010000000;
  v17[3] = &unk_1A7E74EE7;
  v18 = 0u;
  v19 = 0u;
  -[PXGAnchor constraints](self, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PXGAnchor__enumerateSpriteConstraintsUsingBlock___block_invoke;
  v9[3] = &unk_1E5126980;
  v13 = v23;
  v14 = v22;
  v15 = v20;
  v16 = v17;
  v7 = v5;
  v10 = v7;
  v11 = self;
  v8 = v4;
  v12 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);

}

- (NSString)diagnosticDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  unint64_t v10;
  id WeakRetained;
  objc_class *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  CGSize v34;
  CGRect v35;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXGAnchor priority](self, "priority");
  v7 = CFSTR("unknown");
  v8 = CFSTR("Default");
  if (v6 != 1)
    v8 = CFSTR("unknown");
  if (!v6)
    v8 = CFSTR("Low");
  v9 = v8;
  v10 = -[PXGAnchor type](self, "type");
  if (v10 <= 5)
    v7 = off_1E5126B20[v10];
  WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained((id *)&self->_layout);
  -[PXGAnchor visibleRect](self, "visibleRect");
  NSStringFromCGRect(v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGAnchor contentSize](self, "contentSize");
  NSStringFromCGSize(v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, priority=%@ type=%@ layout=<%@: %p>\n\tvisibleRect=%@ contentSize=%@\n"), v5, self, v9, v7, v13, v14, v15, v16);

  -[PXGAnchor spriteReferences](self, "spriteReferences");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __34__PXGAnchor_diagnosticDescription__block_invoke;
  v32[3] = &unk_1E51269A8;
  v20 = v17;
  v33 = v20;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v32);

  -[PXGAnchor constraints](self, "constraints");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __34__PXGAnchor_diagnosticDescription__block_invoke_2;
  v30[3] = &unk_1E51269D0;
  v22 = v20;
  v31 = v22;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v30);

  -[PXGAnchor spriteRects](self, "spriteRects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __34__PXGAnchor_diagnosticDescription__block_invoke_3;
  v28[3] = &unk_1E51269F8;
  v24 = v22;
  v29 = v24;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v28);

  objc_msgSend(v24, "appendString:", CFSTR(">"));
  v25 = v29;
  v26 = v24;

  return (NSString *)v26;
}

- (PXGAnchorDelegate)delegate
{
  return (PXGAnchorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (void)setSpriteReferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)referencingOptions
{
  return self->_referencingOptions;
}

- (void)setReferencingOptions:(unint64_t)a3
{
  self->_referencingOptions = a3;
}

- (void)setScrollPosition:(unint64_t)a3
{
  self->_scrollPosition = a3;
}

- (id)customOffset
{
  return self->_customOffset;
}

- (void)setCustomOffset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CGPoint)visibleLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_visibleLocation.x;
  y = self->_visibleLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setVisibleLocation:(CGPoint)a3
{
  self->_visibleLocation = a3;
}

- (CGPoint)normalizedAnchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_normalizedAnchorPoint.x;
  y = self->_normalizedAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setNormalizedAnchorPoint:(CGPoint)a3
{
  self->_normalizedAnchorPoint = a3;
}

uint64_t __34__PXGAnchor_diagnosticDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%li: %@\n"), a3, a2);
}

uint64_t __34__PXGAnchor_diagnosticDescription__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%li: %@\n"), a3, a2);
}

uint64_t __34__PXGAnchor_diagnosticDescription__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%li: %@\n"), a3, a2);
}

void __51__PXGAnchor__enumerateSpriteConstraintsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  CGRect v30;

  v29 = a2;
  objc_msgSend(v29, "spriteReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v29, "referencingOptions");
    v7 = v6;
    if (v5 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
      && v6 == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v8 = *(double **)(*(_QWORD *)(a1 + 80) + 8);
      v9 = v8[4];
      v10 = v8[5];
      v11 = v8[6];
      v12 = v8[7];
    }
    else
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "spriteIndexForSpriteReference:options:", v5, v6);
      if ((_DWORD)v13 == -1)
      {
        v9 = *MEMORY[0x1E0C9D628];
        v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "anchoringRectForSpriteAtIndex:", v13);
        v9 = v14;
        v10 = v15;
        v11 = v16;
        v12 = v17;
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v5);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v7;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v13;
      v18 = *(double **)(*(_QWORD *)(a1 + 80) + 8);
      v18[4] = v9;
      v18[5] = v10;
      v18[6] = v11;
      v18[7] = v12;
    }
    v30.origin.x = v9;
    v30.origin.y = v10;
    v30.size.width = v11;
    v30.size.height = v12;
    if (!CGRectIsNull(v30))
    {
      objc_msgSend(*(id *)(a1 + 40), "spriteRects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "CGRectValue");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      (*(void (**)(double, double, double, double, double, double, double, double))(*(_QWORD *)(a1 + 48)
                                                                                             + 16))(v22, v24, v26, v28, v9, v10, v11, v12);
    }
  }

}

uint64_t __82__PXGAnchor_enumerateSpritesWithEnumerationOptions_referencingOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "spriteIndexForSpriteReference:options:", a2, a3);
  if ((_DWORD)result != -1)
    return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(a4, a5, a6, a7);
  return result;
}

uint64_t __28__PXGAnchor_copyWithLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "spriteReferenceForSpriteReference:", a2);
}

id __28__PXGAnchor_copyWithLayout___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "spriteReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(v3, "copy");

    objc_msgSend(*(id *)(a1 + 32), "spriteReferenceForSpriteReference:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSpriteReference:", v6);

    v3 = v5;
  }

  return v3;
}

double __52__PXGAnchor_enumerateAllSpriteReferencesUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = *(void **)(a1 + 32);
  if (!v2)
    return *MEMORY[0x1E0C9D628];
  objc_msgSend(v2, "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGRectValue");
  v5 = v4;

  return v5;
}

void __52__PXGAnchor_enumerateAllSpriteReferencesUsingBlock___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;

  v7 = (void *)a1[4];
  v6 = a1[5];
  v8 = a2;
  v9 = objc_msgSend(v7, "referencingOptions");
  (*(void (**)(void))(a1[6] + 16))();
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v8, v9, *(_QWORD *)(a1[7] + 8) + 24);

  *a4 = *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24);
}

void __52__PXGAnchor_enumerateAllSpriteReferencesUsingBlock___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "spriteReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = a1[4];
    v8 = objc_msgSend(v9, "referencingOptions");
    (*(void (**)(void))(a1[5] + 16))();
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v7 + 16))(v7, v6, v8, *(_QWORD *)(a1[6] + 8) + 24);
    *a4 = *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24);
  }

}

void __76__PXGAnchor_adjustReferencedSpriteIndexesWithChangeDetails_appliedToLayout___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v8 = v3;
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v8;
    v4 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  }
  if ((objc_msgSend(v4, "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(v8, "adjustReferencedSpriteIndexesWithChangeDetails:appliedToLayout:", a1[4], a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) |= objc_msgSend(v8, "isValid");
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v8);
  }

}

uint64_t __41__PXGAnchor_anchoredSpriteIndexInLayout___block_invoke(uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  *a4 = 1;
  return result;
}

uint64_t __41__PXGAnchor_anchoredSpriteIndexInLayout___block_invoke_2(uint64_t result, int a2, _BYTE *a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *a3 = 1;
  return result;
}

void __31__PXGAnchor_adjustVisibleRect___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8, double a9, double a10)
{
  id v19;
  uint64_t v20;
  id v21;
  void (**v22)(_QWORD, double, double, double, double);
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double height;
  double width;
  double y;
  double x;
  _QWORD aBlock[4];
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v19 = a2;
  v20 = objc_msgSend(v19, "inequality");
  if (v20)
  {
    objc_msgSend(v19, "inequality");
    objc_msgSend(v19, "spriteEdge");
    PXRectEdgeValue();
    objc_msgSend(v19, "visibleRectEdge");
    PXRectEdgeValue();
    objc_msgSend(v19, "offset");
    PXRectEdgeAxis();
    PXPointValueForAxis();
    PXPointSetValueForAxis();
  }
  else
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      goto LABEL_5;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __31__PXGAnchor_adjustVisibleRect___block_invoke_2;
    aBlock[3] = &unk_1E5126750;
    v21 = v19;
    v35 = v21;
    v22 = (void (**)(_QWORD, double, double, double, double))_Block_copy(aBlock);
    if ((objc_msgSend(v21, "visiblePortionOnly") & 1) != 0)
    {
      objc_msgSend(v21, "padding");
      PXEdgeInsetsInsetRect();
      v38.origin.x = v23;
      v38.origin.y = v24;
      v38.size.width = v25;
      v38.size.height = v26;
      v36.origin.x = a3;
      v36.origin.y = a4;
      v36.size.width = a5;
      v36.size.height = a6;
      v37 = CGRectIntersection(v36, v38);
      y = v37.origin.y;
      x = v37.origin.x;
      height = v37.size.height;
      width = v37.size.width;
      if (!CGRectIsEmpty(v37))
      {
        a3 = x;
        a4 = y;
        a5 = width;
        a6 = height;
      }
    }
    v22[2](v22, a7, a8, a9, a10);
    v22[2](v22, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    PXPointSubtract();
    v22[2](v22, a3, a4, a5, a6);
    v22[2](v22, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    PXPointSubtract();
    PXPointSubtract();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v27 + 32) = v28;
    *(_QWORD *)(v27 + 40) = v29;

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v20 == 0;
LABEL_5:

}

void __31__PXGAnchor_adjustVisibleRect___block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  uint64_t v13;
  char v14;
  double MinX;
  double MidX;
  double v17;
  double v18;
  double v19;
  double MinY;
  double MidY;
  void (**v22)(void *, uint64_t);
  void (**v23)(_QWORD, _QWORD, __n128, __n128, __n128, __n128);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[5];
  CGRect v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  __int128 v33;
  CGPoint origin;
  uint64_t v35;
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  objc_msgSend(*(id *)(a1 + 32), "anchoringRectForSpriteAtIndex:", a2);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(*(id *)(a1 + 40), "scrollPosition");
  if ((v13 & 0x80) != 0)
  {
    if (v12 > *(double *)(a1 + 80) * 0.5)
      v13 = 1;
    else
      v13 = 2;
  }
  objc_msgSend(*(id *)(a1 + 40), "visibleLocation");
  if ((PXPointIsNull() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "normalizedAnchorPoint");
    PXPointDenormalize();
    v18 = v17 - *(double *)(a1 + 96);
    objc_msgSend(*(id *)(a1 + 40), "visibleLocation");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v18 - v19;
    goto LABEL_23;
  }
  if ((v13 & 1) != 0)
  {
    v38.origin.x = v6;
    v38.origin.y = v8;
    v38.size.width = v10;
    v38.size.height = v12;
    MinY = CGRectGetMinY(v38);
    MidY = CGRectGetMinY(*(CGRect *)(a1 + 56));
    goto LABEL_15;
  }
  if ((v13 & 2) != 0)
  {
    v39.origin.x = v6;
    v39.origin.y = v8;
    v39.size.width = v10;
    v39.size.height = v12;
    MinY = CGRectGetMidY(v39);
    MidY = CGRectGetMidY(*(CGRect *)(a1 + 56));
    goto LABEL_15;
  }
  if ((v13 & 4) != 0)
  {
    v40.origin.x = v6;
    v40.origin.y = v8;
    v40.size.width = v10;
    v40.size.height = v12;
    MinY = CGRectGetMaxY(v40);
    MidY = CGRectGetMaxY(*(CGRect *)(a1 + 56));
LABEL_15:
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = MinY - MidY;
    v14 = 1;
    if ((v13 & 8) != 0)
      goto LABEL_10;
    goto LABEL_16;
  }
  v14 = 0;
  if ((v13 & 8) != 0)
  {
LABEL_10:
    v37.origin.x = v6;
    v37.origin.y = v8;
    v37.size.width = v10;
    v37.size.height = v12;
    MinX = CGRectGetMinX(v37);
    MidX = CGRectGetMinX(*(CGRect *)(a1 + 56));
LABEL_22:
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = MinX - MidX;
    goto LABEL_23;
  }
LABEL_16:
  if ((v13 & 0x10) != 0)
  {
    v42.origin.x = v6;
    v42.origin.y = v8;
    v42.size.width = v10;
    v42.size.height = v12;
    MinX = CGRectGetMidX(v42);
    MidX = CGRectGetMidX(*(CGRect *)(a1 + 56));
    goto LABEL_22;
  }
  if ((v13 & 0x20) != 0)
  {
    v43.origin.x = v6;
    v43.origin.y = v8;
    v43.size.width = v10;
    v43.size.height = v12;
    MinX = CGRectGetMaxX(v43);
    MidX = CGRectGetMaxX(*(CGRect *)(a1 + 56));
    goto LABEL_22;
  }
  if ((v14 & 1) == 0)
  {
    v45.origin.x = v6;
    v45.origin.y = v8;
    v45.size.width = v10;
    v45.size.height = v12;
    v41 = CGRectIntersection(*(CGRect *)(a1 + 56), v45);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __31__PXGAnchor_adjustVisibleRect___block_invoke_4;
    aBlock[3] = &unk_1E51267A0;
    v28 = v41;
    v29 = v6;
    v30 = v8;
    v31 = v10;
    v32 = v12;
    v41.origin = *(CGPoint *)(a1 + 72);
    v33 = *(_OWORD *)(a1 + 56);
    origin = v41.origin;
    v35 = 0x3FE6666666666666;
    v36 = v13;
    aBlock[4] = *(_QWORD *)(a1 + 48);
    v22 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v22[2](v22, 1);
    v22[2](v22, 2);

  }
LABEL_23:
  objc_msgSend(*(id *)(a1 + 40), "customOffset");
  v23 = (void (**)(_QWORD, _QWORD, __n128, __n128, __n128, __n128))objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v44 = CGRectOffset(*(CGRect *)(a1 + 120), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v23[2](v23, *(_QWORD *)(a1 + 32), (__n128)v44.origin, *(__n128 *)&v44.origin.y, (__n128)v44.size, *(__n128 *)&v44.size.height);
    PXPointAdd();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(_QWORD *)(v24 + 32) = v25;
    *(_QWORD *)(v24 + 40) = v26;
  }
  *a3 = 1;

}

uint64_t __31__PXGAnchor_adjustVisibleRect___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  PXRectGetLengthForAxis();
  v3 = v2;
  result = PXRectGetLengthForAxis();
  v6 = v3 / v5;
  if ((*(double *)(a1 + 96) <= *(double *)(a1 + 128) || v6 <= 0.1) && v6 < *(double *)(a1 + 136))
  {
    if (v6 < 0.01 && (*(_BYTE *)(a1 + 144) & 0x40) != 0)
    {
      PXRectGetMidForAxis();
      PXRectGetMidForAxis();
    }
    else
    {
      PXRectGetMidForAxis();
      v8 = v7;
      PXRectGetMidForAxis();
      if (v8 > v9)
      {
        PXRectGetMaxForAxis();
        PXRectGetMaxForAxis();
        PXPointSetValueForAxis();
        PXPointValueForAxis();
      }
      PXRectGetMinForAxis();
      PXRectGetMinForAxis();
    }
    return PXPointSetValueForAxis();
  }
  return result;
}

double __31__PXGAnchor_adjustVisibleRect___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MidX;
  double v10;
  void *v12;
  void *v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  switch(objc_msgSend(*(id *)(a1 + 32), "spriteAttribute"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPoint _PXGAnchoredPointInRectForSpriteAttribute(CGRect, PXGSpriteAttribute)");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGAnchor.m"), 88, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      v14.origin.x = a2;
      v14.origin.y = a3;
      v14.size.width = a4;
      v14.size.height = a5;
      MidX = CGRectGetMidX(v14);
      goto LABEL_8;
    case 2:
      v15.origin.x = a2;
      v15.origin.y = a3;
      v15.size.width = a4;
      v15.size.height = a5;
      v10 = CGRectGetMidX(v15);
      v16.origin.x = a2;
      v16.origin.y = a3;
      v16.size.width = a4;
      v16.size.height = a5;
      CGRectGetMinY(v16);
      return v10;
    case 3:
      v17.origin.x = a2;
      v17.origin.y = a3;
      v17.size.width = a4;
      v17.size.height = a5;
      v10 = CGRectGetMidX(v17);
      v18.origin.x = a2;
      v18.origin.y = a3;
      v18.size.width = a4;
      v18.size.height = a5;
      CGRectGetMaxY(v18);
      return v10;
    case 4:
      v19.origin.x = a2;
      v19.origin.y = a3;
      v19.size.width = a4;
      v19.size.height = a5;
      MidX = CGRectGetMinX(v19);
      goto LABEL_8;
    case 5:
      v20.origin.x = a2;
      v20.origin.y = a3;
      v20.size.width = a4;
      v20.size.height = a5;
      MidX = CGRectGetMaxX(v20);
LABEL_8:
      v10 = MidX;
      v21.origin.x = a2;
      v21.origin.y = a3;
      v21.size.width = a4;
      v21.size.height = a5;
      CGRectGetMidY(v21);
      break;
    default:
      v10 = 0.0;
      break;
  }
  return v10;
}

uint64_t __24__PXGAnchor_canBeReused__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  result = objc_msgSend(a2, "hasObjectReference");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end
