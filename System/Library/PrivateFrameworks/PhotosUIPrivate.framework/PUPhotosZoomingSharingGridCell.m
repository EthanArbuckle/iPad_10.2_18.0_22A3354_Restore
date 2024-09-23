@implementation PUPhotosZoomingSharingGridCell

- (PUPhotosZoomingSharingGridCell)initWithFrame:(CGRect)a3 selectionView:(id)a4 optionView:(id)a5 layoutAnchor:(unint64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  char *v16;
  PUPhotosZoomingSharingGridCell *v17;
  _QWORD *v18;
  uint64_t v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v15 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PUPhotosZoomingSharingGridCell;
  v16 = -[PUPhotosSharingGridCell initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  v17 = (PUPhotosZoomingSharingGridCell *)v16;
  if (v16)
  {
    *((_OWORD *)v16 + 45) = *MEMORY[0x1E0C9D538];
    *((double *)v16 + 92) = width;
    *((double *)v16 + 93) = height;
    v18 = v16 + 768;
    objc_msgSend(v14, "center");
    *v18 = v19;
    v17->_selectionViewDefaultCenter.y = v20;
    objc_storeStrong((id *)&v17->_selectionView, a4);
    -[PUPhotosZoomingSharingGridCell addSubview:](v17, "addSubview:", v17->_selectionView);
    objc_msgSend(v15, "center");
    v17->_optionViewDefaultCenter.x = v21;
    v17->_optionViewDefaultCenter.y = v22;
    objc_storeStrong((id *)&v17->_optionView, a5);
    if (v17->_optionView)
      -[PUPhotosZoomingSharingGridCell addSubview:](v17, "addSubview:");
    v17->_badgesLayoutAnchor = a6;
    -[PUPhotosZoomingSharingGridCell setUserInteractionEnabled:](v17, "setUserInteractionEnabled:", 0);
  }

  return v17;
}

- (void)layoutSubviews
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  CGFloat x;
  CGFloat v17;
  double MaxY;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  double MinY;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double MaxX;
  double MinX;
  double v35;
  CGRect rect;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  *(_QWORD *)&rect.size.width = self;
  *(_QWORD *)&rect.size.height = PUPhotosZoomingSharingGridCell;
  -[CGSize layoutSubviews]((objc_super *)&rect.size, sel_layoutSubviews);
  -[PUPhotosZoomingSharingGridCell bounds](self, "bounds");
  v7 = v6;
  v9 = *MEMORY[0x1E0DC51A8];
  v8 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
  v10 = v3;
  v11 = v4;
  v12 = v5;
  y = self->_defaultBounds.origin.y;
  width = self->_defaultBounds.size.width;
  height = self->_defaultBounds.size.height;
  switch(self->_badgesLayoutAnchor)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
    case 8uLL:
      x = self->_defaultBounds.origin.x;
      rect.origin.x = x;
      v17 = v7;
      MaxX = CGRectGetMaxX(*(CGRect *)&v3);
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      v9 = MaxX - CGRectGetMaxX(v37);
      v38.origin.x = v10;
      v38.origin.y = v11;
      v38.size.width = v7;
      v38.size.height = v12;
      MaxY = CGRectGetMaxY(v38);
      v39.origin.x = rect.origin.x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      v8 = MaxY - CGRectGetMaxY(v39);
      break;
    case 1uLL:
      v19 = self->_defaultBounds.size.width;
      rect.origin.y = v19;
      v20 = self->_defaultBounds.origin.x;
      v21 = v7;
      MinX = CGRectGetMinX(*(CGRect *)&v3);
      v40.origin.x = v20;
      v40.origin.y = y;
      v40.size.width = v19;
      v40.size.height = height;
      v22 = CGRectGetMinX(v40);
      goto LABEL_5;
    case 2uLL:
      v23 = self->_defaultBounds.size.width;
      rect.origin.y = v23;
      v20 = self->_defaultBounds.origin.x;
      v24 = v7;
      MinX = CGRectGetMaxX(*(CGRect *)&v3);
      v41.origin.x = v20;
      v41.origin.y = y;
      v41.size.width = v23;
      v41.size.height = height;
      v22 = CGRectGetMaxX(v41);
LABEL_5:
      v9 = MinX - v22;
      v42.origin.x = v10;
      v42.origin.y = v11;
      v42.size.width = v7;
      v42.size.height = v12;
      MinY = CGRectGetMinY(v42);
      v43.origin.x = v20;
      v43.origin.y = y;
      v43.size.width = rect.origin.y;
      v43.size.height = height;
      v26 = CGRectGetMinY(v43);
      goto LABEL_7;
    case 4uLL:
      v27 = self->_defaultBounds.size.width;
      rect.origin.y = v27;
      v28 = self->_defaultBounds.origin.x;
      v29 = v7;
      v35 = CGRectGetMinX(*(CGRect *)&v3);
      v44.origin.x = v28;
      v44.origin.y = y;
      v44.size.width = v27;
      v44.size.height = height;
      v9 = v35 - CGRectGetMinX(v44);
      v45.origin.x = v10;
      v45.origin.y = v11;
      v45.size.width = v7;
      v45.size.height = v12;
      MinY = CGRectGetMaxY(v45);
      v46.origin.x = v28;
      v46.origin.y = y;
      v46.size.width = rect.origin.y;
      v46.size.height = height;
      v26 = CGRectGetMaxY(v46);
LABEL_7:
      v8 = MinY - v26;
      break;
    default:
      break;
  }
  v30 = v9 + self->_selectionViewDefaultCenter.x;
  v31 = v9 + self->_optionViewDefaultCenter.x;
  v32 = v8 + self->_optionViewDefaultCenter.y;
  -[UIView setCenter:](self->_selectionView, "setCenter:", v30, v8 + self->_selectionViewDefaultCenter.y);
  -[UIView setCenter:](self->_optionView, "setCenter:", v31, v32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionView, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
}

@end
