@implementation RAPReportComposerBadRouteSelectionSection

- (RAPReportComposerBadRouteSelectionSection)initWithQuestion:(id)a3 willChangeQuestionRequiringNoScroll:(id)a4
{
  id v7;
  id v8;
  RAPReportComposerBadRouteSelectionSection *v9;
  RAPReportComposerBadRouteSelectionSection *v10;
  id *p_question;
  void *v12;
  id v13;
  id willChangeQuestionRequiringNoScroll;
  void *v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)RAPReportComposerBadRouteSelectionSection;
  v9 = -[RAPTablePartSection init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    p_question = (id *)&v9->_question;
    objc_storeStrong((id *)&v9->_question, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_question, "selectableRouteSuggestions"));
    v10->_collapsed = (unint64_t)objc_msgSend(v12, "count") > 5;

    v13 = objc_msgSend(v8, "copy");
    willChangeQuestionRequiringNoScroll = v10->_willChangeQuestionRequiringNoScroll;
    v10->_willChangeQuestionRequiringNoScroll = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Route"), CFSTR("localized string not found"), 0));
    -[RAPTablePartSection setHeaderTitle:](v10, "setHeaderTitle:", v16);

    objc_msgSend(*p_question, "addObserver:changeHandler:", v10, &stru_1011C0148);
  }

  return v10;
}

- (int64_t)rowsCount
{
  void *v4;
  id v5;

  if (self->_collapsed)
    return 7;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPBadRouteSuggestionsQuestion selectableRouteSuggestions](self->_question, "selectableRouteSuggestions"));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5 + self->_collapsed + 1;
}

- (BOOL)_isNoGoodCellIndex:(int64_t)a3
{
  return a3 == 0;
}

- (int64_t)_expansionCellIndex
{
  return 6;
}

- (BOOL)_isExpansionCellIndex:(int64_t)a3
{
  return self->_collapsed
      && -[RAPReportComposerBadRouteSelectionSection _expansionCellIndex](self, "_expansionCellIndex") == a3;
}

- (unint64_t)_selectableRouteSuggestionIndexForCellIndex:(int64_t)a3
{
  return a3 - 1;
}

- (UIEdgeInsets)_separatorInset
{
  CGFloat bottom;
  double right;
  double v4;
  CGFloat v5;
  void *v6;
  id v7;
  CGFloat left;
  void *v9;
  id v10;
  double top;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  +[TransitRouteRAPTableViewCell leadingTextAlignmentMargin](TransitRouteRAPTableViewCell, "leadingTextAlignmentMargin");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v7 = objc_msgSend(v6, "userInterfaceLayoutDirection");

  if (v7)
  {
    left = UIEdgeInsetsZero.left;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

    if (v10 == (id)1)
      right = v5;
    v5 = left;
  }
  top = UIEdgeInsetsZero.top;
  v12 = v5;
  v13 = bottom;
  v14 = right;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = top;
  return result;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  if (-[RAPReportComposerBadRouteSelectionSection _isNoGoodCellIndex:](self, "_isNoGoodCellIndex:"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueCellWithNamespacedReuseIdentifier:creationBlock:](self, "dequeueCellWithNamespacedReuseIdentifier:creationBlock:", CFSTR("NoGoodCell"), &stru_1011C0188));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("No good routes shown"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
    objc_msgSend(v8, "setText:", v7);

    objc_msgSend(v5, "setChecked:", -[RAPBadRouteSuggestionsQuestion noGoodRoutesShown](self->_question, "noGoodRoutesShown"));
    return v5;
  }
  else if (-[RAPReportComposerBadRouteSelectionSection _isExpansionCellIndex:](self, "_isExpansionCellIndex:", a3))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1006B22F0;
    v22[3] = &unk_1011C01B0;
    v22[4] = self;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueCellWithNamespacedReuseIdentifier:creationBlock:](self, "dequeueCellWithNamespacedReuseIdentifier:creationBlock:", CFSTR("ExpandCell"), v22));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tintColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
    objc_msgSend(v13, "setTextColor:", v12);

    return v10;
  }
  else
  {
    v14 = -[RAPReportComposerBadRouteSelectionSection _selectableRouteSuggestionIndexForCellIndex:](self, "_selectableRouteSuggestionIndexForCellIndex:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPBadRouteSuggestionsQuestion selectableRouteSuggestions](self->_question, "selectableRouteSuggestions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v14));

    v17 = (objc_class *)objc_opt_class(TransitRouteRAPTableViewCell);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dequeueCellWithNamespacedReuseIdentifier:creationBlock:](self, "dequeueCellWithNamespacedReuseIdentifier:creationBlock:", v19, &stru_1011C01D0));

    objc_msgSend(v20, "setRoute:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPBadRouteSuggestionsQuestion selectedRouteSuggestions](self->_question, "selectedRouteSuggestions"));
    objc_msgSend(v20, "setChecked:", objc_msgSend(v21, "containsObject:", v16));

    return v20;
  }
}

- (void)_noteWillSelectWithoutScroll
{
  void (**willChangeQuestionRequiringNoScroll)(void);

  willChangeQuestionRequiringNoScroll = (void (**)(void))self->_willChangeQuestionRequiringNoScroll;
  if (willChangeQuestionRequiringNoScroll)
    willChangeQuestionRequiringNoScroll[2]();
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

  if (-[RAPReportComposerBadRouteSelectionSection _isNoGoodCellIndex:](self, "_isNoGoodCellIndex:", a3))
  {
    -[RAPBadRouteSuggestionsQuestion setNoGoodRoutesShown:](self->_question, "setNoGoodRoutesShown:", -[RAPBadRouteSuggestionsQuestion noGoodRoutesShown](self->_question, "noGoodRoutesShown") ^ 1);
    -[RAPReportComposerBadRouteSelectionSection _noteWillSelectWithoutScroll](self, "_noteWillSelectWithoutScroll");
  }
  else if (-[RAPReportComposerBadRouteSelectionSection _isExpansionCellIndex:](self, "_isExpansionCellIndex:", a3))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
    objc_msgSend(v8, "beginUpdates");

    self->_collapsed = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[RAPReportComposerBadRouteSelectionSection _expansionCellIndex](self, "_expansionCellIndex"), -[RAPTablePartSection sectionIndex](self, "sectionIndex")));
    v22 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    objc_msgSend(v9, "deleteRowsAtIndexPaths:withRowAnimation:", v11, 4);

    v12 = objc_alloc_init((Class)NSMutableArray);
    for (i = -[RAPReportComposerBadRouteSelectionSection _expansionCellIndex](self, "_expansionCellIndex");
          i < -[RAPReportComposerBadRouteSelectionSection rowsCount](self, "rowsCount");
          ++i)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, -[RAPTablePartSection sectionIndex](self, "sectionIndex")));
      objc_msgSend(v12, "addObject:", v14);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
    objc_msgSend(v20, "insertRowsAtIndexPaths:withRowAnimation:", v12, 3);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
    objc_msgSend(v21, "endUpdates");

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPBadRouteSuggestionsQuestion selectedRouteSuggestions](self->_question, "selectedRouteSuggestions"));
    v16 = objc_msgSend(v15, "mutableCopy");

    if (!v16)
      v16 = objc_alloc_init((Class)NSMutableSet);
    v17 = -[RAPReportComposerBadRouteSelectionSection _selectableRouteSuggestionIndexForCellIndex:](self, "_selectableRouteSuggestionIndexForCellIndex:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPBadRouteSuggestionsQuestion selectableRouteSuggestions](self->_question, "selectableRouteSuggestions"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v17));

    if (v19)
    {
      if ((objc_msgSend(v16, "containsObject:", v19) & 1) != 0)
        objc_msgSend(v16, "removeObject:", v19);
      else
        objc_msgSend(v16, "addObject:", v19);
    }
    -[RAPReportComposerBadRouteSelectionSection _noteWillSelectWithoutScroll](self, "_noteWillSelectWithoutScroll");
    -[RAPBadRouteSuggestionsQuestion setSelectedRouteSuggestions:](self->_question, "setSelectedRouteSuggestions:", v16);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_willChangeQuestionRequiringNoScroll, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
