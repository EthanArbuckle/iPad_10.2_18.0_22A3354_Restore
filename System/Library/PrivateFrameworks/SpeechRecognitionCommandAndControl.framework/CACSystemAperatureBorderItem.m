@implementation CACSystemAperatureBorderItem

+ (id)borderItemsForRect:(CGRect)a3 minimumRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CACSystemAperatureBorderItem *v11;
  CGFloat MinX;
  CGFloat MinY;
  CACSystemAperatureBorderItem *v14;
  CGFloat v15;
  CGFloat MaxY;
  CACSystemAperatureBorderItem *v17;
  CGFloat v18;
  CGFloat v19;
  CACSystemAperatureBorderItem *v20;
  CGFloat MaxX;
  CGFloat v22;
  CACSystemAperatureBorderItem *v23;
  CGFloat v24;
  CGFloat v25;
  CACSystemAperatureBorderItem *v26;
  CGFloat v27;
  CGFloat v28;
  CACSystemAperatureBorderItem *v29;
  CGFloat v30;
  CGFloat v31;
  CACSystemAperatureBorderItem *v32;
  CGFloat v33;
  CGFloat v34;
  CACSystemAperatureBorderItem *v35;
  void *v36;
  CGFloat v38;
  _QWORD v40[11];
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v40[9] = *MEMORY[0x24BDAC8D0];
  v41 = CGRectInset(a3, 10.0, 10.0);
  v38 = v41.origin.x;
  v8 = v41.origin.y;
  v9 = v41.size.width;
  v10 = v41.size.height;
  v11 = objc_alloc_init(CACSystemAperatureBorderItem);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  MinX = CGRectGetMinX(v42);
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  MinY = CGRectGetMinY(v43);
  v11->_frame.origin.x = MinX;
  v11->_frame.origin.y = MinY;
  v11->_frame.size.width = width;
  v11->_frame.size.height = 1.0;
  v14 = objc_alloc_init(CACSystemAperatureBorderItem);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  v15 = CGRectGetMinX(v44);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  MaxY = CGRectGetMaxY(v45);
  v14->_frame.origin.x = v15;
  v14->_frame.origin.y = MaxY;
  v14->_frame.size.width = width;
  v14->_frame.size.height = 1.0;
  v17 = objc_alloc_init(CACSystemAperatureBorderItem);
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v18 = CGRectGetMinX(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v19 = CGRectGetMinY(v47);
  v17->_frame.origin.x = v18;
  v17->_frame.origin.y = v19;
  v17->_frame.size.width = 1.0;
  v17->_frame.size.height = height;
  v20 = objc_alloc_init(CACSystemAperatureBorderItem);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  MaxX = CGRectGetMaxX(v48);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  v22 = CGRectGetMinY(v49);
  v20->_frame.origin.x = MaxX;
  v20->_frame.origin.y = v22;
  v20->_frame.size.width = 1.0;
  v20->_frame.size.height = height;
  v23 = objc_alloc_init(CACSystemAperatureBorderItem);
  v50.origin.x = v38;
  v50.origin.y = v8;
  v50.size.width = v9;
  v50.size.height = v10;
  v24 = CGRectGetMinX(v50);
  v51.origin.x = v38;
  v51.origin.y = v8;
  v51.size.width = v9;
  v51.size.height = v10;
  v25 = CGRectGetMinY(v51);
  v23->_frame.origin.x = v24;
  v23->_frame.origin.y = v25;
  v23->_frame.size.width = v9;
  v23->_frame.size.height = 1.0;
  v26 = objc_alloc_init(CACSystemAperatureBorderItem);
  v52.origin.x = v38;
  v52.origin.y = v8;
  v52.size.width = v9;
  v52.size.height = v10;
  v27 = CGRectGetMinX(v52);
  v53.origin.x = v38;
  v53.origin.y = v8;
  v53.size.width = v9;
  v53.size.height = v10;
  v28 = CGRectGetMaxY(v53);
  v26->_frame.origin.x = v27;
  v26->_frame.origin.y = v28;
  v26->_frame.size.width = v9;
  v26->_frame.size.height = 1.0;
  v29 = objc_alloc_init(CACSystemAperatureBorderItem);
  v54.origin.x = v38;
  v54.origin.y = v8;
  v54.size.width = v9;
  v54.size.height = v10;
  v30 = CGRectGetMinX(v54);
  v55.origin.x = v38;
  v55.origin.y = v8;
  v55.size.width = v9;
  v55.size.height = v10;
  v31 = CGRectGetMinY(v55);
  v29->_frame.origin.x = v30;
  v29->_frame.origin.y = v31;
  v29->_frame.size.width = 1.0;
  v29->_frame.size.height = v10;
  v32 = objc_alloc_init(CACSystemAperatureBorderItem);
  v56.origin.x = v38;
  v56.origin.y = v8;
  v56.size.width = v9;
  v56.size.height = v10;
  v33 = CGRectGetMaxX(v56);
  v57.origin.x = v38;
  v57.origin.y = v8;
  v57.size.width = v9;
  v57.size.height = v10;
  v34 = CGRectGetMinY(v57);
  v32->_frame.origin.x = v33;
  v32->_frame.origin.y = v34;
  v32->_frame.size.width = 1.0;
  v32->_frame.size.height = v10;
  v35 = objc_alloc_init(CACSystemAperatureBorderItem);
  v35->_frame = CGRectInset(a4, 2.0, 2.0);
  v40[0] = v11;
  v40[1] = v14;
  v40[2] = v17;
  v40[3] = v20;
  v40[4] = v23;
  v40[5] = v26;
  v40[6] = v29;
  v40[7] = v32;
  v40[8] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (NSString)elementName
{
  return (NSString *)CFSTR("____");
}

- (CGRect)elementFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)elementLabelContainerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isSpacer
{
  return 1;
}

@end
