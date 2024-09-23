@implementation TransitDirectionsCell

+ (Class)stepViewClass
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return (Class)objc_opt_class(TransitDirectionsStepView);
}

- (TransitDirectionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TransitDirectionsCell *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  TransitDirectionsStepView *v10;
  TransitDirectionsStepView *stepView;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[4];

  v32.receiver = self;
  v32.super_class = (Class)TransitDirectionsCell;
  v4 = -[TransitDirectionsCell initWithStyle:reuseIdentifier:](&v32, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TransitDirectionsCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsCell backgroundView](v4, "backgroundView"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

    v8 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(v4), "stepViewClass"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsCell contentView](v4, "contentView"));
    objc_msgSend(v9, "bounds");
    v10 = (TransitDirectionsStepView *)objc_msgSend(v8, "initWithFrame:");
    stepView = v4->_stepView;
    v4->_stepView = v10;

    -[TransitDirectionsStepView setTranslatesAutoresizingMaskIntoConstraints:](v4->_stepView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TransitDirectionsStepView setCell:](v4->_stepView, "setCell:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsCell contentView](v4, "contentView"));
    objc_msgSend(v12, "addSubview:", v4->_stepView);

    v13 = objc_alloc_init((Class)NSMutableArray);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView topAnchor](v4->_stepView, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsCell contentView](v4, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v33[0] = v28;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView leadingAnchor](v4->_stepView, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsCell contentView](v4, "contentView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
    v33[1] = v24;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsCell contentView](v4, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView bottomAnchor](v4->_stepView, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
    v33[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsCell contentView](v4, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView trailingAnchor](v4->_stepView, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v33[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
    objc_msgSend(v13, "addObjectsFromArray:", v21);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);
  }
  return v4;
}

- (TransitDirectionsListItem)transitListItem
{
  return -[TransitDirectionsStepView transitListItem](self->_stepView, "transitListItem");
}

- (void)configureWithItem:(id)a3
{
  -[TransitDirectionsStepView configureWithItem:](self->_stepView, "configureWithItem:", a3);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsCell;
  -[TransitDirectionsCell prepareForReuse](&v3, "prepareForReuse");
  -[TransitDirectionsStepView prepareForReuse](self->_stepView, "prepareForReuse");
}

- (CGRect)_separatorFrame
{
  id v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double MaxX;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  v22.receiver = self;
  v22.super_class = (Class)TransitDirectionsCell;
  v3 = -[TransitDirectionsCell _separatorFrame](&v22, "_separatorFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (self->_useLeadingInstructionMarginAsLeadingSeparatorInset)
  {
    if (MKApplicationLayoutDirectionIsRightToLeft(v3))
    {
      v23.origin.x = v5;
      v23.origin.y = v7;
      v23.size.width = v9;
      v23.size.height = v11;
      MaxX = CGRectGetMaxX(v23);
      -[TransitDirectionsCell bounds](self, "bounds");
      v13 = CGRectGetMaxX(v24);
      -[TransitDirectionsStepView leadingInstructionMargin](self->_stepView, "leadingInstructionMargin");
      v15 = MaxX - (v13 - v14);
    }
    else
    {
      -[TransitDirectionsStepView leadingInstructionMargin](self->_stepView, "leadingInstructionMargin");
      v17 = v16;
      v25.origin.x = v5;
      v25.origin.y = v7;
      v25.size.width = v9;
      v25.size.height = v11;
      v15 = v17 - CGRectGetMinX(v25);
      v5 = v5 + v15;
    }
    v9 = v9 - v15;
  }
  v18 = v5;
  v19 = v7;
  v20 = v9;
  v21 = v11;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)setUseLeadingInstructionMarginAsLeadingSeparatorInset:(BOOL)a3
{
  id v4;

  if (self->_useLeadingInstructionMarginAsLeadingSeparatorInset != a3)
  {
    self->_useLeadingInstructionMarginAsLeadingSeparatorInset = a3;
    v4 = -[TransitDirectionsCell separatorStyle](self, "separatorStyle");
    -[TransitDirectionsCell setSeparatorStyle:](self, "setSeparatorStyle:", ((uint64_t)v4 + 1) % 3);
    -[TransitDirectionsCell setSeparatorStyle:](self, "setSeparatorStyle:", v4);
  }
}

- (void)setAccessoryType:(int64_t)a3
{
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsCell;
  -[TransitDirectionsCell setAccessoryType:](&v6, "setAccessoryType:");
  v5 = 0.0;
  if (!a3)
    v5 = 16.0;
  -[TransitDirectionsStepView _setTrailingGuideToContentViewDistance:](self->_stepView, "_setTrailingGuideToContentViewDistance:", v5);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsCell;
  -[TransitDirectionsCell setHighlighted:animated:](&v6, "setHighlighted:animated:", a3, a4);
  -[TransitDirectionsStepView setHighlighted:](self->_stepView, "setHighlighted:", v4);
}

- (BOOL)useNavigationMetrics
{
  return -[TransitDirectionsStepView useNavigationMetrics](self->_stepView, "useNavigationMetrics");
}

- (void)setUseNavigationMetrics:(BOOL)a3
{
  -[TransitDirectionsStepView setUseNavigationMetrics:](self->_stepView, "setUseNavigationMetrics:", a3);
}

- (int64_t)navigationState
{
  return -[TransitDirectionsStepView navigationState](self->_stepView, "navigationState");
}

- (void)setNavigationState:(int64_t)a3
{
  -[TransitDirectionsStepView setNavigationState:](self->_stepView, "setNavigationState:", a3);
}

- (unint64_t)displayOptions
{
  return -[TransitDirectionsStepView displayOptions](self->_stepView, "displayOptions");
}

- (void)setDisplayOptions:(unint64_t)a3
{
  -[TransitDirectionsStepView setDisplayOptions:](self->_stepView, "setDisplayOptions:", a3);
}

- (double)leadingInstructionMargin
{
  double result;

  -[TransitDirectionsStepView leadingInstructionMargin](self->_stepView, "leadingInstructionMargin");
  return result;
}

- (void)setLeadingInstructionMargin:(double)a3
{
  -[TransitDirectionsStepView setLeadingInstructionMargin:](self->_stepView, "setLeadingInstructionMargin:", a3);
}

- (UIView)trailingView
{
  return -[TransitDirectionsStepView trailingView](self->_stepView, "trailingView");
}

- (void)setTrailingView:(id)a3
{
  -[TransitDirectionsStepView setTrailingView:](self->_stepView, "setTrailingView:", a3);
}

- (BOOL)useLeadingInstructionMarginAsLeadingSeparatorInset
{
  return self->_useLeadingInstructionMarginAsLeadingSeparatorInset;
}

- (TransitDirectionsStepView)stepView
{
  return self->_stepView;
}

- (double)_calculatedSeparatorHeight
{
  return self->__calculatedSeparatorHeight;
}

- (void)_setCalculatedSeparatorHeight:(double)a3
{
  self->__calculatedSeparatorHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepView, 0);
}

+ (id)cellMapping
{
  if (qword_1014D3310 != -1)
    dispatch_once(&qword_1014D3310, &stru_1011C6A90);
  return (id)qword_1014D3308;
}

+ (Class)cellClassForListItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cellIdentifierForListItem:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cellMapping"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return (Class)v6;
}

+ (id)cellIdentifierForListItem:(id)a3
{
  id v3;
  __objc2_class *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;

  v3 = a3;
  switch((unint64_t)objc_msgSend(v3, "type"))
  {
    case 0uLL:
    case 1uLL:
      v5 = (objc_class *)objc_opt_class(TransitDirectionsInstructionsCell);
      v6 = NSStringFromClass(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      if (objc_msgSend(v3, "type"))
        v8 = CFSTR(".Destination");
      else
        v8 = CFSTR(".Origin");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", v8));

      break;
    case 2uLL:
    case 3uLL:
    case 8uLL:
    case 9uLL:
      v4 = TransitDirectionsInstructionsCell;
      goto LABEL_17;
    case 4uLL:
      v4 = TransitDirectionsClusteredVehiclesCell;
      goto LABEL_17;
    case 5uLL:
    case 6uLL:
    case 0xEuLL:
      v4 = TransitDirectionsPassItemCell;
      goto LABEL_17;
    case 7uLL:
      v4 = TransitDirectionsExpandStopsCell;
      goto LABEL_17;
    case 0xAuLL:
    case 0xBuLL:
      v4 = TransitDirectionsStopCell;
      goto LABEL_17;
    case 0xCuLL:
      v4 = TransitDirectionsBlockTransferCell;
      goto LABEL_17;
    case 0xDuLL:
      v4 = TransitDirectionsIncidentCell;
      goto LABEL_17;
    case 0xFuLL:
      v4 = TransitDirectionsOperatorInfoCell;
      goto LABEL_17;
    case 0x10uLL:
      v4 = TransitDirectionsBoardingInfoCell;
      goto LABEL_17;
    case 0x11uLL:
      v4 = TransitDirectionsBadgesCell;
LABEL_17:
      v10 = (objc_class *)objc_opt_class(v4);
      v11 = NSStringFromClass(v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

+ (void)registerCellsForTableView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cellMapping"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007A7E30;
  v7[3] = &unk_1011C6AB8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

+ (id)dequeueCellForListItem:(id)a3 fromTableView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cellIdentifierForListItem:", a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v8));

  return v11;
}

+ (id)collectionCellMapping
{
  if (qword_1014D3320 != -1)
    dispatch_once(&qword_1014D3320, &stru_1011C6AD8);
  return (id)qword_1014D3318;
}

+ (Class)collectionCellClassForListItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cellIdentifierForListItem:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "collectionCellMapping"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return (Class)v6;
}

+ (void)registerCellsForCollectionView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "collectionCellMapping"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007A82E8;
  v7[3] = &unk_1011C6AB8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

+ (id)dequeueCellForListItem:(id)a3 fromCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cellIdentifierForListItem:", a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v8));

  return v11;
}

@end
