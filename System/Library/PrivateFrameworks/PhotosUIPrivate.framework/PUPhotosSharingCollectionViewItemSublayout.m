@implementation PUPhotosSharingCollectionViewItemSublayout

- (PUPhotosSharingCollectionViewItemSublayout)initWithIndexPath:(id)a3 itemFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  PUPhotosSharingCollectionViewItemSublayout *v11;
  PUPhotosSharingCollectionViewItemSublayout *v12;
  uint64_t v13;
  UICollectionViewLayoutAttributes *selectionBadgeLayoutAttributes;
  uint64_t v15;
  UICollectionViewLayoutAttributes *optionBadgeLayoutAttributes;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUPhotosSharingCollectionViewItemSublayout;
  v11 = -[PUPhotosSharingCollectionViewItemSublayout init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_indexPath, a3);
    v12->_itemFrame.origin.x = x;
    v12->_itemFrame.origin.y = y;
    v12->_itemFrame.size.width = width;
    v12->_itemFrame.size.height = height;
    v12->_visibleItemFrame.origin.x = x;
    v12->_visibleItemFrame.origin.y = y;
    v12->_visibleItemFrame.size.width = width;
    v12->_visibleItemFrame.size.height = height;
    v12->_badgesCorner = 8;
    objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUPhotosSharingSelectionBadgeKind"), v10);
    v13 = objc_claimAutoreleasedReturnValue();
    selectionBadgeLayoutAttributes = v12->_selectionBadgeLayoutAttributes;
    v12->_selectionBadgeLayoutAttributes = (UICollectionViewLayoutAttributes *)v13;

    objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUPhotosSharingOptionBadgeKind"), v10);
    v15 = objc_claimAutoreleasedReturnValue();
    optionBadgeLayoutAttributes = v12->_optionBadgeLayoutAttributes;
    v12->_optionBadgeLayoutAttributes = (UICollectionViewLayoutAttributes *)v15;

  }
  return v12;
}

- (void)setSelectionBadgeSize:(CGSize)a3
{
  -[UICollectionViewLayoutAttributes setSize:](self->_selectionBadgeLayoutAttributes, "setSize:", a3.width, a3.height);
}

- (CGSize)selectionBadgeSize
{
  double v2;
  double v3;
  CGSize result;

  -[UICollectionViewLayoutAttributes size](self->_selectionBadgeLayoutAttributes, "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setOptionBadgeSize:(CGSize)a3
{
  -[UICollectionViewLayoutAttributes setSize:](self->_optionBadgeLayoutAttributes, "setSize:", a3.width, a3.height);
}

- (CGSize)optionBadgeSize
{
  double v2;
  double v3;
  CGSize result;

  -[UICollectionViewLayoutAttributes size](self->_optionBadgeLayoutAttributes, "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareSublayout
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  unint64_t v15;
  unint64_t v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v21;
  CGFloat *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGSize size;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  UICollectionViewLayoutAttributes *selectionBadgeLayoutAttributes;
  _BYTE v66[128];
  uint64_t v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  selectionBadgeLayoutAttributes = self->_selectionBadgeLayoutAttributes;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &selectionBadgeLayoutAttributes, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v61;
    v8 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v61 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v11, "size");
        if (v13 != v8 || v12 != v9)
          objc_msgSend(v3, "addObject:", v11);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    }
    while (v6);
  }

  v15 = -[PUPhotosSharingCollectionViewItemSublayout badgesCorner](self, "badgesCorner") & 0xA;
  v16 = -[PUPhotosSharingCollectionViewItemSublayout badgesCorner](self, "badgesCorner") & 0xC;
  x = self->_itemFrame.origin.x;
  y = self->_itemFrame.origin.y;
  width = self->_itemFrame.size.width;
  height = self->_itemFrame.size.height;
  if (v15)
    v21 = CGRectGetMaxX(*(CGRect *)&x) - self->_badgesOffset.horizontal;
  else
    v21 = CGRectGetMinX(*(CGRect *)&x) + self->_badgesOffset.horizontal;
  v22 = (CGFloat *)MEMORY[0x1E0C9D628];
  v23 = self->_itemFrame.origin.x;
  v24 = self->_itemFrame.origin.y;
  v25 = self->_itemFrame.size.width;
  v26 = self->_itemFrame.size.height;
  if (v16)
    v27 = CGRectGetMaxY(*(CGRect *)&v23) - self->_bottomBadgeInset - self->_badgesOffset.vertical;
  else
    v27 = CGRectGetMinY(*(CGRect *)&v23) + self->_badgesOffset.vertical;
  v28 = v22[1];
  v55 = *v22;
  v30 = v22[2];
  v29 = v22[3];
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v31 = v3;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v57 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        objc_msgSend(v36, "frame", *(_QWORD *)&v29);
        v41 = v38;
        v42 = v39;
        v43 = v40;
        if (v15)
          v21 = v21 - CGRectGetWidth(*(CGRect *)&v37);
        v44 = v27;
        if (v16)
        {
          v68.origin.x = v21;
          v68.origin.y = v41;
          v68.size.width = v42;
          v68.size.height = v43;
          v44 = v27 - CGRectGetHeight(v68);
        }
        objc_msgSend(v36, "setFrame:", v21, v44, v42, v43);
        v69.size.height = v54;
        v69.origin.x = v55;
        v69.origin.y = v28;
        v69.size.width = v30;
        v71.origin.x = v21;
        v71.origin.y = v44;
        v71.size.width = v42;
        v71.size.height = v43;
        v70 = CGRectUnion(v69, v71);
        v55 = v70.origin.x;
        v28 = v70.origin.y;
        v30 = v70.size.width;
        v29 = v70.size.height;
        v45 = v21;
        v46 = v44;
        v47 = v42;
        v48 = v43;
        if (v15)
          v21 = CGRectGetMinX(*(CGRect *)&v45) - self->_badgesOffset.horizontal;
        else
          v21 = CGRectGetMaxX(*(CGRect *)&v45) + self->_badgesOffset.horizontal;
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v33);
  }

  self->_badgesContainerFrame.origin.x = v55;
  self->_badgesContainerFrame.origin.y = v28;
  self->_badgesContainerFrame.size.width = v30;
  self->_badgesContainerFrame.size.height = v29;
  size = self->_badgesContainerFrame.size;
  self->_floatingBadgesContainerFrame.origin = self->_badgesContainerFrame.origin;
  self->_floatingBadgesContainerFrame.size = size;
  -[UICollectionViewLayoutAttributes center](self->_selectionBadgeLayoutAttributes, "center");
  self->_selectionBadgeCenter.x = v50;
  self->_selectionBadgeCenter.y = v51;
  -[UICollectionViewLayoutAttributes center](self->_optionBadgeLayoutAttributes, "center");
  self->_optionBadgeCenter.x = v52;
  self->_optionBadgeCenter.y = v53;

}

- (void)setFloatingOffset:(UIOffset)a3
{
  CGFloat vertical;
  CGFloat horizontal;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[UICollectionViewLayoutAttributes setCenter:](self->_selectionBadgeLayoutAttributes, "setCenter:", a3.horizontal + self->_selectionBadgeCenter.x, a3.vertical + self->_selectionBadgeCenter.y);
  self->_floatingBadgesContainerFrame = CGRectOffset(self->_badgesContainerFrame, horizontal, vertical);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (CGRect)itemFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_itemFrame.origin.x;
  y = self->_itemFrame.origin.y;
  width = self->_itemFrame.size.width;
  height = self->_itemFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)visibleItemFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleItemFrame.origin.x;
  y = self->_visibleItemFrame.origin.y;
  width = self->_visibleItemFrame.size.width;
  height = self->_visibleItemFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisibleItemFrame:(CGRect)a3
{
  self->_visibleItemFrame = a3;
}

- (double)bottomBadgeInset
{
  return self->_bottomBadgeInset;
}

- (void)setBottomBadgeInset:(double)a3
{
  self->_bottomBadgeInset = a3;
}

- (UIOffset)badgesOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_badgesOffset.horizontal;
  vertical = self->_badgesOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setBadgesOffset:(UIOffset)a3
{
  self->_badgesOffset = a3;
}

- (unint64_t)badgesCorner
{
  return self->_badgesCorner;
}

- (void)setBadgesCorner:(unint64_t)a3
{
  self->_badgesCorner = a3;
}

- (UICollectionViewLayoutAttributes)selectionBadgeLayoutAttributes
{
  return self->_selectionBadgeLayoutAttributes;
}

- (UICollectionViewLayoutAttributes)optionBadgeLayoutAttributes
{
  return self->_optionBadgeLayoutAttributes;
}

- (CGRect)badgesContainerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_badgesContainerFrame.origin.x;
  y = self->_badgesContainerFrame.origin.y;
  width = self->_badgesContainerFrame.size.width;
  height = self->_badgesContainerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)floatingBadgesContainerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_floatingBadgesContainerFrame.origin.x;
  y = self->_floatingBadgesContainerFrame.origin.y;
  width = self->_floatingBadgesContainerFrame.size.width;
  height = self->_floatingBadgesContainerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionBadgeLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_selectionBadgeLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
}

@end
