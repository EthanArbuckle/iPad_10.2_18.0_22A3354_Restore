@implementation MapViewModeGridView

- (MapViewModeGridView)initWithFrame:(CGRect)a3
{
  MapViewModeGridView *v3;
  uint64_t v4;
  NSMutableArray *buttonViews;
  NSArray *buttonViewModels;
  uint64_t v7;
  NSMutableArray *rowLayoutGuides;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MapViewModeGridView;
  v3 = -[MapViewModeGridView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    buttonViews = v3->_buttonViews;
    v3->_buttonViews = (NSMutableArray *)v4;

    buttonViewModels = v3->_buttonViewModels;
    v3->_buttonViewModels = (NSArray *)&__NSArray0__struct;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    rowLayoutGuides = v3->_rowLayoutGuides;
    v3->_rowLayoutGuides = (NSMutableArray *)v7;

    -[MapViewModeGridView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("MapViewModeGridView"));
  }
  return v3;
}

- (void)setButtonViewModels:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  NSArray **p_buttonViewModels;
  unsigned __int8 v8;
  id v9;
  NSArray *v10;
  NSArray *v11;
  _QWORD v12[5];

  v5 = (NSArray *)a3;
  v6 = v5;
  p_buttonViewModels = &self->_buttonViewModels;
  if (self->_buttonViewModels != v5)
  {
    v11 = v5;
    v8 = -[NSArray isEqual:](v5, "isEqual:");
    v6 = v11;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_buttonViewModels, a3);
      v9 = -[NSMutableArray count](self->_buttonViews, "count");
      if (v9 != (id)-[NSArray count](*p_buttonViewModels, "count"))
        -[MapViewModeGridView _rebuildGrid](self, "_rebuildGrid");
      v10 = *p_buttonViewModels;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10085BB9C;
      v12[3] = &unk_1011D93F8;
      v12[4] = self;
      -[NSArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v12);
      v6 = v11;
    }
  }

}

- (void)_rebuildGrid
{
  MapViewModeGridView *v2;
  NSArray *constraints;
  uint64_t v4;
  NSMutableArray *buttonViews;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSMutableArray *rowLayoutGuides;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _UNKNOWN **v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  MapViewModeGridView *v22;
  uint64_t v23;
  _UNKNOWN **v24;
  uint64_t v25;
  void *v26;
  NSArray *v27;
  NSArray *v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[2];
  void *v37;

  v2 = self;
  if (self->_constraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    constraints = v2->_constraints;
    v2->_constraints = 0;

  }
  v4 = 8;
  buttonViews = v2->_buttonViews;
  v6 = -[NSArray count](v2->_buttonViewModels, "count");
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10085BF5C;
  v35[3] = &unk_1011D9420;
  v35[4] = v2;
  -[MapViewModeGridView _addOrRemoveObjectsInMutableArray:toMatchCount:addBlock:removeBlock:](v2, "_addOrRemoveObjectsInMutableArray:toMatchCount:addBlock:removeBlock:", buttonViews, v6, v35, &stru_1011D9440);
  v7 = (unint64_t)-[NSMutableArray count](v2->_buttonViews, "count") & 1;
  v8 = (unint64_t)-[NSMutableArray count](v2->_buttonViews, "count");
  v9 = 16;
  rowLayoutGuides = v2->_rowLayoutGuides;
  v33[4] = v2;
  v34[0] = _NSConcreteStackBlock;
  v29 = v7;
  v11 = v7 + (v8 >> 1);
  v34[1] = 3221225472;
  v34[2] = sub_10085BFBC;
  v34[3] = &unk_1011D9420;
  v34[4] = v2;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10085BFF8;
  v33[3] = &unk_1011D9468;
  -[MapViewModeGridView _addOrRemoveObjectsInMutableArray:toMatchCount:addBlock:removeBlock:](v2, "_addOrRemoveObjectsInMutableArray:toMatchCount:addBlock:removeBlock:", rowLayoutGuides, v11, v34, v33);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridView _constraintsForStackingRows](v2, "_constraintsForStackingRows"));
  v32 = v12;
  objc_msgSend(v12, "addObjectsFromArray:", v13);

  v31 = v11;
  if (v11)
  {
    v14 = 0;
    v15 = -(uint64_t)v29;
    v16 = MKPlaceCollectionsLogicController_ptr;
    do
    {
      if (v14 || !v29)
      {
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v4), "objectAtIndexedSubscript:", v15));
        v36[0] = v30;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v4), "objectAtIndexedSubscript:", v15 + 1));
        v36[1] = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16[304], "arrayWithObjects:count:", v36, 2));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v9), "objectAtIndexedSubscript:", v14));
        v21 = objc_claimAutoreleasedReturnValue(-[MapViewModeGridView _constraintsForStackingButtonViews:inRowLayoutGuide:](v2, "_constraintsForStackingButtonViews:inRowLayoutGuide:", v19, v20));
        v22 = v2;
        v23 = v4;
        v24 = v16;
        v25 = v9;
        v26 = (void *)v21;
        objc_msgSend(v32, "addObjectsFromArray:", v21);

        v9 = v25;
        v16 = v24;
        v4 = v23;
        v2 = v22;
        v17 = (void *)v30;
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v4), "firstObject"));
        v37 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16[304], "arrayWithObjects:count:", &v37, 1));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v9), "firstObject"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridView _constraintsForStackingButtonViews:inRowLayoutGuide:](v2, "_constraintsForStackingButtonViews:inRowLayoutGuide:", v18, v19));
        objc_msgSend(v32, "addObjectsFromArray:", v20);
      }

      ++v14;
      v15 += 2;
    }
    while (v31 != v14);
  }
  if (sub_1002A8AA0(v2) == 5)
    -[MapViewModeGridView setLayoutMargins:](v2, "setLayoutMargins:", 16.0, 14.0, 16.0, 14.0);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);
  v27 = (NSArray *)objc_msgSend(v32, "copy");
  v28 = v2->_constraints;
  v2->_constraints = v27;

}

- (void)_addOrRemoveObjectsInMutableArray:(id)a3 toMatchCount:(unint64_t)a4 addBlock:(id)a5 removeBlock:(id)a6
{
  uint64_t (**v9)(_QWORD);
  void (**v10)(id, void *);
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = (uint64_t (**)(_QWORD))a5;
  v10 = (void (**)(id, void *))a6;
  v11 = objc_msgSend(v16, "count");
  v12 = objc_msgSend(v16, "count");
  if ((unint64_t)v11 >= a4)
  {
    if ((unint64_t)v12 > a4)
    {
      while ((unint64_t)objc_msgSend(v16, "count") > a4)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastObject"));
        objc_msgSend(v16, "removeLastObject");
        v10[2](v10, v15);

      }
    }
  }
  else
  {
    while ((unint64_t)v12 < a4)
    {
      v13 = v9[2](v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_msgSend(v16, "addObject:", v14);

      v12 = objc_msgSend(v16, "count");
    }
  }

}

- (id)_constraintsForStackingRows
{
  void *v3;
  double v4;
  id v5;
  uint64_t v6;
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
  NSMutableArray *obj;
  void *v32;
  uint64_t v33;
  id v34;
  MapViewModeGridView *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[2];
  _BYTE v44[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (sub_1002A8AA0(self) == 5)
    v4 = 14.0;
  else
    v4 = 20.0;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = self->_rowLayoutGuides;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  v5 = 0;
  if (v34)
  {
    v32 = v3;
    v33 = *(_QWORD *)v40;
    v35 = self;
    do
    {
      v6 = 0;
      v7 = v5;
      do
      {
        if (*(_QWORD *)v40 != v33)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
        v37 = v7;
        v38 = v6;
        if (v7)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, v4));
          objc_msgSend(v3, "addObject:", v11);
        }
        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridView layoutMarginsGuide](self, "layoutMarginsGuide"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
          objc_msgSend(v3, "addObject:", v12);

        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridView layoutMarginsGuide](self, "layoutMarginsGuide"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
        v15 = v8;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v14));
        v43[0] = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridView layoutMarginsGuide](self, "layoutMarginsGuide"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
        v43[1] = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 2));
        objc_msgSend(v32, "addObjectsFromArray:", v21);

        self = v35;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v35->_rowLayoutGuides, "lastObject"));

        v3 = v32;
        if (v15 == v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridView layoutMarginsGuide](v35, "layoutMarginsGuide"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
          objc_msgSend(v32, "addObject:", v26);

          self = v35;
        }
        if (v37)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "heightAnchor"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "heightAnchor"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
          objc_msgSend(v32, "addObject:", v29);

        }
        v5 = v15;

        v6 = v38 + 1;
        v7 = v5;
      }
      while (v34 != (id)(v38 + 1));
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v34);
  }

  return v3;
}

- (id)_constraintsForStackingButtonViews:(id)a3 inRowLayoutGuide:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  void *v41;
  MapViewModeGridView *v42;
  id v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[2];
  _BYTE v51[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v42 = self;
  v46 = 0u;
  v47 = 0u;
  if (sub_1002A8AA0(self) == 5)
    v9 = 14.0;
  else
    v9 = 20.0;
  v48 = 0uLL;
  v49 = 0uLL;
  v10 = v6;
  v43 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v43)
  {
    v11 = 0;
    v40 = *(_QWORD *)v47;
    v41 = v10;
    v44 = v7;
    do
    {
      v12 = 0;
      v13 = v11;
      do
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor", v40));
        v45 = v13;
        if (v13)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, v9));
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
        }
        v18 = (void *)v17;
        objc_msgSend(v8, "addObject:", v17);

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
        v50[0] = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
        v23 = v8;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
        v50[1] = v25;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 2));
        objc_msgSend(v23, "addObjectsFromArray:", v26);

        v8 = v23;
        v10 = v41;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "lastObject"));

        if (v14 == v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
          objc_msgSend(v8, "addObject:", v30);

        }
        if (v45)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "widthAnchor"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "widthAnchor"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
          objc_msgSend(v8, "addObject:", v33);

        }
        if ((unint64_t)objc_msgSend(v41, "count") >= 2)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "widthAnchor"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "heightAnchor"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:multiplier:", v35, 1.42105263));
          objc_msgSend(v8, "addObject:", v36);

        }
        if (sub_1002A8AA0(v42) == 5)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "widthAnchor"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToConstant:", 152.0));
          objc_msgSend(v8, "addObject:", v38);

        }
        v11 = v14;

        v12 = (char *)v12 + 1;
        v13 = v11;
        v7 = v44;
      }
      while (v43 != v12);
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v43);

  }
  return v8;
}

- (NSArray)buttonViewModels
{
  return self->_buttonViewModels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonViewModels, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_rowLayoutGuides, 0);
  objc_storeStrong((id *)&self->_buttonViews, 0);
}

@end
