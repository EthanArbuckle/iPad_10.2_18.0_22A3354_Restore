@implementation IMCellRotationContainer

- (void)dealloc
{
  objc_super v3;

  -[IMGridViewCell removeFromSuperview](self->_endCell, "removeFromSuperview");
  -[IMGridViewCell removeFromSuperview](self->_startCell, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)IMCellRotationContainer;
  -[IMCellRotationContainer dealloc](&v3, "dealloc");
}

- (void)setStartCell:(id)a3
{
  IMGridViewCell *v5;
  id *p_startCell;
  IMGridViewCell *startCell;
  id v8;
  IMGridViewCell *v9;

  v5 = (IMGridViewCell *)a3;
  p_startCell = (id *)&self->_startCell;
  startCell = self->_startCell;
  v9 = v5;
  if (startCell != v5)
  {
    -[IMGridViewCell removeFromSuperview](startCell, "removeFromSuperview");
    v8 = *p_startCell;
    *p_startCell = 0;

    objc_storeStrong((id *)&self->_startCell, a3);
    if (*p_startCell)
    {
      -[IMCellRotationContainer addSubview:](self, "addSubview:");
      objc_msgSend(*p_startCell, "frame");
      objc_msgSend(*p_startCell, "setFrame:", CGPointZero.x, CGPointZero.y);
    }
  }

}

- (void)setEndCell:(id)a3
{
  IMGridViewCell *v5;
  id *p_endCell;
  IMGridViewCell *endCell;
  id v8;
  IMGridViewCell *v9;

  v5 = (IMGridViewCell *)a3;
  p_endCell = (id *)&self->_endCell;
  endCell = self->_endCell;
  v9 = v5;
  if (endCell != v5)
  {
    -[IMGridViewCell removeFromSuperview](endCell, "removeFromSuperview");
    v8 = *p_endCell;
    *p_endCell = 0;

    objc_storeStrong((id *)&self->_endCell, a3);
    if (*p_endCell)
    {
      -[IMCellRotationContainer addSubview:](self, "addSubview:");
      objc_msgSend(*p_endCell, "frame");
      objc_msgSend(*p_endCell, "setFrame:", CGPointZero.x, CGPointZero.y);
    }
  }

}

- (void)setOrigin:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[IMCellRotationContainer frame](self, "frame");
  -[IMCellRotationContainer setFrame:](self, "setFrame:", x, y);
}

- (void)prepareToCrossfade
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_startCell, "layer"));
  objc_msgSend(v3, "setShouldRasterize:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "scale");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_startCell, "layer"));
  objc_msgSend(v7, "setRasterizationScale:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_startCell, "layer"));
  objc_msgSend(v8, "setPreloadsCache:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_startCell, "layer"));
  objc_msgSend(v9, "setFrozen:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_endCell, "layer"));
  objc_msgSend(v10, "setShouldRasterize:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v11, "scale");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_endCell, "layer"));
  objc_msgSend(v14, "setRasterizationScale:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_endCell, "layer"));
  objc_msgSend(v15, "setPreloadsCache:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_endCell, "layer"));
  objc_msgSend(v16, "setFrozen:", 1);

  -[IMGridViewCell setAlpha:](self->_startCell, "setAlpha:", 1.0);
  -[IMGridViewCell setAlpha:](self->_endCell, "setAlpha:", 0.0);
}

- (void)didFinishRotation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_startCell, "layer"));
  objc_msgSend(v3, "setShouldRasterize:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_startCell, "layer"));
  objc_msgSend(v4, "setRasterizationScale:", 1.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_startCell, "layer"));
  objc_msgSend(v5, "setPreloadsCache:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_startCell, "layer"));
  objc_msgSend(v6, "setFrozen:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_endCell, "layer"));
  objc_msgSend(v7, "setShouldRasterize:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_endCell, "layer"));
  objc_msgSend(v8, "setRasterizationScale:", 1.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_endCell, "layer"));
  objc_msgSend(v9, "setPreloadsCache:", 0);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self->_endCell, "layer"));
  objc_msgSend(v10, "setFrozen:", 0);

}

- (void)crossfadeWithDuration:(double)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 1.0;
  if (!self->_endCell)
    v3 = 0.5;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_6CC28;
  v4[3] = &unk_28B960;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, v3 * a3);
}

- (IMGridViewCell)startCell
{
  return self->_startCell;
}

- (IMGridViewCell)endCell
{
  return self->_endCell;
}

- (BOOL)cellNotVisible
{
  return self->_cellNotVisible;
}

- (void)setCellNotVisible:(BOOL)a3
{
  self->_cellNotVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startCell, 0);
  objc_storeStrong((id *)&self->_endCell, 0);
}

@end
