@implementation UIKBSplitKeyplaneGenerator

- (UIKBSplitKeyplaneGenerator)init
{
  UIKBSplitKeyplaneGenerator *v2;
  uint64_t v3;
  NSMutableArray *rows;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  UIKBSplitKeyplaneGenerator *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIKBSplitKeyplaneGenerator;
  v2 = -[UIKBSplitKeyplaneGenerator init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    rows = v2->_rows;
    v2->_rows = (NSMutableArray *)v3;

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferencesActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rivenSizeFactor:", 1.0);
    v8 = v7;

    v2->_splitKeySizeFactor.width = v8;
    v2->_splitKeySizeFactor.height = v8;
    v9 = v2;
  }

  return v2;
}

- (id)keysOrderedByPosition
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIKBTree keysOrderedByPosition](self->_sourceKeyplane, "keysOrderedByPosition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)addSliceStart:(CGRect)a3 end:(CGRect)a4 startToken:(id)a5 endToken:(id)a6 left:(BOOL)a7 normalization:(int)a8 isDefaultWidth:(BOOL)a9 row:(int)a10
{
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  double height;
  double width;
  double y;
  double x;
  double v18;
  double v19;
  double v20;
  double v21;
  id v23;
  UIKeyboardTransitionSlice **p_leftSlice;
  UIKeyboardTransitionSlice *v25;
  UIKeyboardTransitionSlice *v26;
  UIKeyboardTransitionSlice **p_rightSlice;
  UIKeyboardTransitionSlice *v28;
  UIKeyboardTransitionSlice *v29;
  uint64_t v30;
  UIKeyboardTransitionSlice **v31;
  UIKeyboardTransitionSlice *v32;
  _BOOL4 v33;
  BOOL v34;
  int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double MinY;
  int v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  UIKeyboardTransitionSlice *v50;
  void *v51;
  UIKeyboardTransitionSlice *v52;
  double v53;
  id v54;
  CGRect v55;
  CGRect v56;

  v10 = *(_QWORD *)&a10;
  v11 = *(_QWORD *)&a8;
  v12 = a7;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = a3.size.height;
  v19 = a3.size.width;
  v20 = a3.origin.y;
  v21 = a3.origin.x;
  v54 = a5;
  v23 = a6;
  p_leftSlice = &self->_leftSlice;
  if (!self->_leftSlice)
  {
    v25 = objc_alloc_init(UIKeyboardTransitionSlice);
    v26 = *p_leftSlice;
    *p_leftSlice = v25;

  }
  p_rightSlice = &self->_rightSlice;
  if (!self->_rightSlice)
  {
    v28 = objc_alloc_init(UIKeyboardTransitionSlice);
    v29 = *p_rightSlice;
    *p_rightSlice = v28;

  }
  if (v12)
    v30 = 104;
  else
    v30 = 112;
  if (v12)
    v31 = &self->_leftSlice;
  else
    v31 = &self->_rightSlice;
  v32 = *v31;
  v33 = -[UIKeyboardTransitionSlice hasGeometry](v32, "hasGeometry");
  if (v54)
    v34 = v23 == 0;
  else
    v34 = 1;
  v35 = !v34;
  if (!v34 && !v33)
  {
    -[UIKeyboardTransitionSlice setStartRect:](v32, "setStartRect:", v21, v20, v19, v18);
    -[UIKeyboardTransitionSlice setEndRect:](v32, "setEndRect:", x, y, width, height);
    v33 = -[UIKeyboardTransitionSlice hasGeometry](v32, "hasGeometry");
  }
  v53 = v21;
  v55.origin.x = v21;
  v36 = v20;
  v55.origin.y = v20;
  v37 = v19;
  v55.size.width = v19;
  v38 = v18;
  v55.size.height = v18;
  v39 = x;
  v40 = y;
  v41 = width;
  v42 = height;
  MinY = CGRectGetMinY(v55);
  -[UIKeyboardTransitionSlice startRect](v32, "startRect");
  if (MinY == CGRectGetMinY(v56))
    v44 = v35;
  else
    v44 = 1;
  if (v33)
    v45 = v44;
  else
    v45 = 0;
  if (v35)
  {
    +[UIKeyboardTransitionSlice sliceWithStart:end:](UIKeyboardTransitionSlice, "sliceWithStart:end:", v53, v36, v37, v38, v39, v40, v41, v42);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setRowHint:", v10);
    objc_msgSend(v23, "setRowHint:", v10);
    objc_msgSend(v46, "setStartToken:", v54);
    objc_msgSend(v46, "setEndToken:", v23);
    objc_msgSend(v46, "setNormalization:", v11);
    objc_msgSend(v46, "setDelayCrossfade:", 1);
    -[UIKeyboardSliceSet addSlice:](self->_sliceSet, "addSlice:", v46);
    if ((_DWORD)v11 != 2)
    {
      objc_msgSend(v23, "name");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        -[UIKeyboardSliceSet controlKeys](self->_sliceSet, "controlKeys");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "name");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKey:", v46, v49);

      }
    }

  }
  if (v45)
  {
    -[UIKeyboardSliceSet addSlice:](self->_sliceSet, "addSlice:", v32);
    v50 = objc_alloc_init(UIKeyboardTransitionSlice);
    v51 = *(Class *)((char *)&self->super.isa + v30);
    *(Class *)((char *)&self->super.isa + v30) = (Class)v50;

    v52 = (UIKeyboardTransitionSlice *)*(id *)((char *)&self->super.isa + v30);
    v32 = v52;
  }
  if ((v35 & 1) == 0)
    -[UIKeyboardTransitionSlice addStartRect:end:](v32, "addStartRect:end:", v53, v36, v37, v38, v39, v40, v41, v42);

}

- (void)splitSpaceKey:(id)a3 leftSpace:(id)a4 left:(CGRect)a5 right:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  id v16;
  _BOOL4 IsNull;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  UIKBSplitKeyplaneGenerator *v43;
  void *v44;
  void *v45;
  _BOOL8 v46;
  uint64_t v47;
  _BOOL8 v48;
  double v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  id v56;
  CGRect v57;
  CGRect v58;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5.size.height;
  v11 = a5.size.width;
  v12 = a5.origin.y;
  v13 = a5.origin.x;
  v56 = a3;
  v16 = a4;
  v57.origin.x = v13;
  v57.origin.y = v12;
  v57.size.width = v11;
  v57.size.height = v10;
  IsNull = CGRectIsNull(v57);
  v51 = x;
  v52 = y;
  v58.origin.x = x;
  v58.origin.y = y;
  v53 = width;
  v54 = height;
  v58.size.width = width;
  v58.size.height = height;
  v18 = CGRectIsNull(v58);
  objc_msgSend(v56, "paddedFrame");
  v22 = v21;
  v55 = v23;
  v24 = v19;
  v25 = v20;
  if (IsNull || v18)
  {
    v48 = !IsNull;
    if (IsNull)
    {
      v13 = v51;
      v49 = v52;
    }
    else
    {
      v49 = v12;
    }
    if (IsNull)
    {
      v11 = v53;
      v50 = v54;
    }
    else
    {
      v50 = v10;
    }
    +[UIKBCacheToken tokenTemplateForKey:style:size:](UIKBCacheToken, "tokenTemplateForKey:style:size:", v56, 102, v19, v20);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBCacheToken tokenTemplateForKey:style:size:](UIKBCacheToken, "tokenTemplateForKey:style:size:", v56, 106, v11, v50);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[NSMutableArray count](self->_rows, "count");
    v35 = v22;
    v36 = v55;
    v37 = v24;
    v39 = v25;
    v38 = v13;
    v40 = v49;
    v41 = v11;
    v42 = v50;
    v43 = self;
    v44 = v32;
    v45 = v33;
    v46 = v48;
    v47 = 0;
  }
  else
  {
    -[UIKBTree frame](self->_sourceKeyplane, "frame");
    v27 = v26 * 0.5 - v22;
    objc_msgSend(v16, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBCacheToken tokenTemplateForKey:name:style:size:](UIKBCacheToken, "tokenTemplateForKey:name:style:size:", v56, v28, 102, v24, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBCacheToken tokenTemplateForKey:name:style:size:](UIKBCacheToken, "tokenTemplateForKey:name:style:size:", v56, v30, 106, v11, v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBSplitKeyplaneGenerator addSliceStart:end:startToken:endToken:left:normalization:isDefaultWidth:row:](self, "addSliceStart:end:startToken:endToken:left:normalization:isDefaultWidth:row:", v29, v31, 1, 1, 0, -[NSMutableArray count](self->_rows, "count"), v22, v55, v27, v25, v13, v12, v11, v10);
    +[UIKBCacheToken tokenTemplateForKey:style:size:](UIKBCacheToken, "tokenTemplateForKey:style:size:", v56, 102, v24, v25);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKBCacheToken tokenTemplateForKey:style:size:](UIKBCacheToken, "tokenTemplateForKey:style:size:", v56, 106, v53, v54);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = -[NSMutableArray count](self->_rows, "count");
    v35 = v22 + v27;
    v36 = v55;
    v37 = v24 - v27;
    v38 = v51;
    v39 = v25;
    v40 = v52;
    v41 = v53;
    v42 = v54;
    v43 = self;
    v44 = v32;
    v45 = v33;
    v46 = 0;
    v47 = 2;
  }
  -[UIKBSplitKeyplaneGenerator addSliceStart:end:startToken:endToken:left:normalization:isDefaultWidth:row:](v43, "addSliceStart:end:startToken:endToken:left:normalization:isDefaultWidth:row:", v44, v45, v46, v47, 0, v34, v35, v36, v37, v39, v38, v40, v41, v42);

}

- (void)commitUncommittedSlices
{
  void *v3;
  char v4;
  UIKeyboardTransitionSlice *leftSlice;
  void *v6;
  char v7;
  UIKeyboardTransitionSlice *rightSlice;

  if (-[UIKeyboardTransitionSlice hasGeometry](self->_leftSlice, "hasGeometry"))
  {
    -[UIKeyboardSliceSet slices](self->_sliceSet, "slices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", self->_leftSlice);

    if ((v4 & 1) == 0)
    {
      -[UIKeyboardSliceSet addSlice:](self->_sliceSet, "addSlice:", self->_leftSlice);
      leftSlice = self->_leftSlice;
      self->_leftSlice = 0;

    }
  }
  if (-[UIKeyboardTransitionSlice hasGeometry](self->_rightSlice, "hasGeometry"))
  {
    -[UIKeyboardSliceSet slices](self->_sliceSet, "slices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", self->_rightSlice);

    if ((v7 & 1) == 0)
    {
      -[UIKeyboardSliceSet addSlice:](self->_sliceSet, "addSlice:", self->_rightSlice);
      rightSlice = self->_rightSlice;
      self->_rightSlice = 0;

    }
  }
}

- (void)addKey:(id)a3 withShape:(id)a4 forRow:(id)a5 attribs:(id)a6 left:(BOOL)a7 force:(BOOL)a8 isDefaultWidth:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL8 v10;
  _BOOL8 v15;
  id v16;
  id v17;
  id v18;
  int v19;
  void *v20;
  char v21;
  char v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;

  v9 = a8;
  v10 = a7;
  v15 = a9;
  v58 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = objc_msgSend(v58, "interactionType");
  objc_msgSend(v18, "valueForKey:", CFSTR("KBghost"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  if (v19 == 15)
    v22 = 1;
  else
    v22 = v21;
  if (v9 || (v22 & 1) == 0)
  {
    if ((objc_msgSend(v58, "renderKeyInKeyplane:", self->_sourceKeyplane) & 1) != 0)
    {
      v23 = 0;
      v24 = 0;
LABEL_14:
      objc_msgSend(v58, "paddedFrame");
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v45 = v44;
      objc_msgSend(v16, "paddedFrame");
      -[UIKBSplitKeyplaneGenerator addSliceStart:end:startToken:endToken:left:normalization:isDefaultWidth:row:](self, "addSliceStart:end:startToken:endToken:left:normalization:isDefaultWidth:row:", v24, v23, v10, 0, v15, objc_msgSend(v17, "rowIndex") + 1, v39, v41, v43, v45, v46, v47, v48, v49);

      goto LABEL_15;
    }
    objc_msgSend(v58, "paddedFrame");
    +[UIKBCacheToken tokenTemplateForKey:style:size:](UIKBCacheToken, "tokenTemplateForKey:style:size:", v58, 102, v25, v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "paddedFrame");
    +[UIKBCacheToken tokenTemplateForKey:style:size:](UIKBCacheToken, "tokenTemplateForKey:style:size:", v58, 106, v27, v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray lastObject](self->_rows, "lastObject");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (v29 == v17)
    {
      v15 = a9;
      if (!v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      v30 = objc_msgSend(v58, "displayType");

      if (!v30)
        goto LABEL_14;
      objc_msgSend(v58, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBTree mergeStringForKeyName:](UIKBTree, "mergeStringForKeyName:", v31);
      v29 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v58, "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardSliceSet controlKeys](self->_sliceSet, "controlKeys");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("MoreIntlNames"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, v29);

      objc_msgSend(v58, "shape");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardSliceSet controlKeys](self->_sliceSet, "controlKeys");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("MoreIntlStarts"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v29);

      -[UIKeyboardSliceSet controlKeys](self->_sliceSet, "controlKeys");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("MoreIntlEnds"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v16, v29);

    }
    v15 = a9;
    goto LABEL_13;
  }
LABEL_15:
  objc_msgSend(v17, "listOfType:left:", 0, v10);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "listOfType:left:", 1, v10);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "listOfType:left:", 2, v10);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    objc_msgSend(v50, "subtrees");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObject:", v58);

  }
  objc_msgSend(v51, "subtrees");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v16);

  objc_msgSend(v52, "subtrees");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObject:", v18);

}

- (void)alignSpaceKeyEdges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  UIKBShape *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double rightSideWidestRow;
  double v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  UIKBShape *v69;
  UIKBTree *sourceKeyplane;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  int v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  CGRect v101;
  CGRect v102;

  -[NSMutableArray lastObject](self->_rows, "lastObject");
  v100 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "listOfType:left:", 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "listOfType:left:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "listOfType:left:", 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "listOfType:left:", 1, 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtreesWithProperty:value:", CFSTR("KBinteractionType"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtreesWithProperty:value:", CFSTR("KBinteractionType"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "count") && !objc_msgSend(v9, "count"))
    goto LABEL_39;
  v95 = v7;
  objc_msgSend(v7, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v5;
  if (v10)
  {
    objc_msgSend(v3, "subtrees");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "indexOfObject:", v10);

    objc_msgSend(v5, "subtrees");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v12;
    objc_msgSend(v13, "objectAtIndex:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
    v93 = 0;
  }
  objc_msgSend(v9, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v14;
  v94 = v9;
  if (!v15)
  {
    v24 = *MEMORY[0x1E0C9D628];
    v25 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v27 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v26 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    if (!v14)
    {
      v44 = *MEMORY[0x1E0C9D628];
      v48 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v46 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v40 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v19 = 0;
      goto LABEL_28;
    }
    v91 = 0;
    v20 = 0;
    v19 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v4, "subtrees");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "indexOfObject:", v15);

  objc_msgSend(v99, "subtrees");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v17;
  objc_msgSend(v18, "objectAtIndex:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v19 != 0;
  if (v14 && v19)
  {
    objc_msgSend(v14, "frame");
    v22 = v21;
    objc_msgSend(v19, "frame");
    v24 = *MEMORY[0x1E0C9D628];
    v25 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v27 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v26 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    if (v22 <= v23)
      v28 = v10;
    else
      v28 = v15;
    if (v22 > v23)
      v15 = v10;
    v20 = 1;
    v10 = v28;
    goto LABEL_18;
  }
  v24 = *MEMORY[0x1E0C9D628];
  v25 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v27 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v26 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (v14)
  {
LABEL_18:
    v29 = v19;
    objc_msgSend(v14, "frame");
    v31 = v30;
    objc_msgSend(v14, "frame");
    v33 = v31 + v32 - self->_leftSideWidestRow;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "preferencesActions");
    v35 = v14;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "rivenSizeFactor:", 3.0);
    v38 = v33 + v37;

    if (fabs(v38) > 0.00000011920929)
    {
      objc_msgSend(v35, "frame");
      v40 = v39;
      v42 = v41 + 0.0;
      v43 = v38 + 0.0;
      v44 = v42;
      v46 = v45 - v43;
      v48 = v47 + 0.0;
      objc_msgSend(v98, "subtrees");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, v44, v48, v46, v40, v44, v48, v46, v40);
      objc_msgSend(v49, "replaceObjectAtIndex:withObject:", v93, v50);

      v19 = v29;
      if (!v20)
        goto LABEL_28;
LABEL_23:
      v87 = v27;
      v89 = v44;
      v51 = v25;
      v52 = v26;
      v53 = v24;
      -[UIKBTree frame](self->_sourceKeyplane, "frame", *(_QWORD *)&v87);
      v55 = v54;
      rightSideWidestRow = self->_rightSideWidestRow;
      objc_msgSend(v19, "frame");
      v58 = rightSideWidestRow - (v55 - v57);
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "preferencesActions");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "rivenSizeFactor:", 3.0);
      v62 = v61;

      if (vabdd_f64(v58, v62) <= 0.00000011920929)
      {
        v24 = v53;
        v26 = v52;
        v25 = v51;
        v27 = v88;
      }
      else
      {
        v63 = v58 - v62;
        objc_msgSend(v19, "frame");
        v26 = v64;
        v24 = v65 - v63;
        v27 = v66 - (0.0 - v63);
        v25 = v67 + 0.0;
        objc_msgSend(v99, "subtrees");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, v24, v25, v27, v26, v24, v25, v27, v26);
        objc_msgSend(v68, "replaceObjectAtIndex:withObject:", v91, v69);

      }
      v44 = v89;
      goto LABEL_28;
    }
    v19 = v29;
  }
  v44 = v24;
  v48 = v25;
  v46 = v27;
  v40 = v26;
  if (v20)
    goto LABEL_23;
LABEL_28:
  sourceKeyplane = self->_sourceKeyplane;
  v96 = v4;
  if (v10)
    v71 = v10;
  else
    v71 = v15;
  objc_msgSend(v71, "name");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree keysByKeyName:](sourceKeyplane, "keysByKeyName:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = v97;
  if (objc_msgSend(v73, "count"))
  {
    objc_msgSend(v73, "lastObject");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBSplitKeyplaneGenerator splitSpaceKey:leftSpace:left:right:](self, "splitSpaceKey:leftSpace:left:right:", v75, v10, v44, v48, v46, v40, v24, v25, v27, v26);
    if (v10)
    {
      v90 = v19;
      v92 = v3;
      objc_msgSend(v10, "name");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardSliceSet controlKeys](self->_sliceSet, "controlKeys");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("MoreIntlNames"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setObject:forKeyedSubscript:", v76, CFSTR("Space"));

      objc_msgSend(v10, "shape");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = (void *)objc_msgSend(v79, "copy");

      v101.origin.x = v44;
      v101.origin.y = v48;
      v101.size.width = v46;
      v101.size.height = v40;
      if (!CGRectIsNull(v101))
      {
        v102.origin.x = v24;
        v102.origin.y = v25;
        v102.size.width = v27;
        v102.size.height = v26;
        if (!CGRectIsNull(v102))
          objc_msgSend(v80, "scaleWidth:", 0.5);
      }
      -[UIKeyboardSliceSet controlKeys](self->_sliceSet, "controlKeys");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("MoreIntlStarts"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setObject:forKeyedSubscript:", v80, CFSTR("Space"));

      objc_msgSend(v98, "subtrees");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "objectAtIndexedSubscript:", v93);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardSliceSet controlKeys](self->_sliceSet, "controlKeys");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("MoreIntlEnds"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setObject:forKeyedSubscript:", v84, CFSTR("Space"));

      v19 = v90;
      v3 = v92;
      v74 = v97;
    }

  }
  v7 = v95;
  v4 = v96;
  v5 = v98;
  v9 = v94;
LABEL_39:

}

- (void)splitRow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  void *v16;
  __int128 v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double y;
  _UNKNOWN **v39;
  double v40;
  double height;
  double v42;
  uint64_t v43;
  char v44;
  void *v45;
  BOOL v46;
  _BOOL4 v47;
  BOOL v48;
  _BOOL8 v49;
  void *v50;
  float v51;
  float v52;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  double x;
  double width;
  UIKBShape *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  char v65;
  __int128 v66;
  int v67;
  uint64_t v68;
  UIKBSplitKeyplaneGenerator *v69;
  void *v70;
  BOOL v71;
  char v72;
  _BOOL4 v73;
  _BOOL8 v75;
  void *v76;
  float v77;
  float v78;
  double v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  CGFloat v86;
  double v87;
  double v88;
  void *v89;
  uint64_t v90;
  _UNKNOWN **v91;
  void *v92;
  uint64_t v93;
  char v94;
  _BOOL8 v95;
  __int128 v96;
  void *v97;
  float64x2_t v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  double v113;
  int v114;
  id v115;
  uint64_t v116;
  UIKBSplitKeyplaneGenerator *v117;
  uint64_t v118;
  double v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  double v123;
  __int128 rect;
  __int128 rect_16;
  id v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;

  v126 = a3;
  objc_msgSend(v126, "hints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v117 = self;
    v5 = v4;
    objc_msgSend(v4, "valueForKey:", CFSTR("LeftMargin"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    objc_msgSend(v5, "valueForKey:", CFSTR("RightMargin"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferencesActions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rivenSizeFactor:", v8);
    rect = v14;

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferencesActions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rivenSizeFactor:", v11);
    rect_16 = v17;

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferencesActions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rivenSizeFactor:", 3.0);
    v21 = v20;

    v22 = (double *)MEMORY[0x1E0C9D648];
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v118 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("WidthFactors"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("LeftCount"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "intValue");

    v115 = v5;
    objc_msgSend(v5, "valueForKey:", CFSTR("RightCount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "intValue");

    objc_msgSend(v126, "keys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    v114 = v27 + v25;
    v122 = v25;
    if (v29 < v27 + (int)v25)
    {
      objc_msgSend(v126, "keyAtIndex:", (v25 - 1));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "copy");
      v32 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v30, "cache");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "dictionaryWithDictionary:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKey:", v35, CFSTR("KBsplitMode"));

      objc_msgSend(v31, "setCache:", v34);
      objc_msgSend(v31, "setSplitMode:", 3);
      objc_msgSend(v126, "keys");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "insertObject:atIndex:", v31, (int)v122);

      v25 = v122;
    }
    v37 = *v22;
    y = v22[1];
    v39 = &off_1E167A000;
    v40 = v22[2];
    height = v22[3];
    v116 = (v25 - 1);
    v123 = v21;
    v119 = height;
    if ((int)v25 < 1)
    {
      v44 = 0;
      width = v22[2];
      v42 = v22[1];
      x = *v22;
    }
    else
    {
      v112 = v27;
      v42 = v22[1];
      v43 = 0;
      v44 = 0;
      v121 = v25;
      do
      {
        objc_msgSend(v126, "keyAtIndex:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "interactionType") == 15;
        v47 = objc_msgSend(v45, "interactionType") == 15;
        v48 = v116 == v43 && v46;
        v44 |= v48;
        v49 = v116 != v43 && v47;
        objc_msgSend(v23, "objectAtIndex:", v43);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "floatValue");
        v52 = v51;
        v53 = v51;

        objc_msgSend(v126, "defaultKeySize");
        v55 = v54 * v53;
        objc_msgSend(v126, "defaultKeySize");
        v57 = v56;
        objc_msgSend(v126, "rowOffset");
        v127.origin.y = v58;
        *(_QWORD *)&v127.origin.x = rect;
        v127.size.width = v55;
        v127.size.height = v57;
        v128 = CGRectIntegral(v127);
        x = v128.origin.x;
        y = v128.origin.y;
        width = v128.size.width;
        height = v128.size.height;
        v61 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, x, y, width, height, x, y, width, height);
        objc_msgSend(v45, "cache");
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = (void *)v62;
        if (v62)
          v64 = v62;
        else
          v64 = v118;
        v71 = v52 == 1.0;
        v21 = v123;
        v65 = v71;
        LOBYTE(v109) = v65;
        -[UIKBSplitKeyplaneGenerator addKey:withShape:forRow:attribs:left:force:isDefaultWidth:](v117, "addKey:withShape:forRow:attribs:left:force:isDefaultWidth:", v45, v61, v126, v64, 1, v49, v109);

        *((_QWORD *)&v66 + 1) = *((_QWORD *)&rect + 1);
        *(double *)&v66 = *(double *)&rect + v123 + width;
        rect = v66;

        ++v43;
      }
      while (v121 != v43);
      v25 = v122;
      v39 = &off_1E167A000;
      v27 = v112;
    }
    v67 = v27 - 1;
    if (v27 < 1)
    {
      v69 = v117;
    }
    else
    {
      v113 = height;
      v68 = v114;
      v120 = (int)v25;
      v69 = v117;
      do
      {
        --v68;
        objc_msgSend(v126, "keyAtIndex:", (v25 + v67));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "interactionType") == 15 && v67 == 0;
        v72 = v71;
        v44 |= v72;
        v73 = objc_msgSend(v70, "interactionType") == 15;
        v75 = v67-- != 0 && v73;
        objc_msgSend(v23, "objectAtIndex:", v68);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "floatValue");
        v78 = v77;
        v79 = v77;

        objc_msgSend(v126, "defaultKeySize");
        v81 = v80 * v79;
        objc_msgSend(v126, "defaultKeySize");
        v83 = v82;
        objc_msgSend(v126, "rowWidth");
        v85 = v84 - *(double *)&rect_16 - v81;
        objc_msgSend(v126, "rowOffset");
        v129.origin.y = v86;
        v129.origin.x = v85;
        v129.size.width = v81;
        v129.size.height = v83;
        v130 = CGRectIntegral(v129);
        v87 = v130.origin.x;
        v42 = v130.origin.y;
        v40 = v130.size.width;
        v88 = v130.size.height;
        v89 = (void *)objc_msgSend(objc_alloc((Class)v39[415]), "initWithGeometry:frame:paddedFrame:", 0, v87, v42, v40, v88, v87, v42, v40, v88);
        objc_msgSend(v70, "cache");
        v90 = objc_claimAutoreleasedReturnValue();
        v91 = v39;
        v92 = (void *)v90;
        if (v90)
          v93 = v90;
        else
          v93 = v118;
        v71 = v78 == 1.0;
        v21 = v123;
        v94 = v71;
        LOBYTE(v109) = v94;
        v95 = v75;
        v25 = v122;
        -[UIKBSplitKeyplaneGenerator addKey:withShape:forRow:attribs:left:force:isDefaultWidth:](v117, "addKey:withShape:forRow:attribs:left:force:isDefaultWidth:", v70, v89, v126, v93, 0, v95, v109);

        v39 = v91;
        *((_QWORD *)&v96 + 1) = *((_QWORD *)&rect_16 + 1);
        *(double *)&v96 = *(double *)&rect_16 + v123 + v40;
        rect_16 = v96;

      }
      while (v68 > v120);
      v119 = v88;
      v37 = v87;
      height = v113;
    }
    v97 = (void *)v118;
    *(_QWORD *)&v98.f64[0] = rect;
    if ((v44 & 1) != 0)
    {
      -[UIKBSplitKeyplaneGenerator commitUncommittedSlices](v69, "commitUncommittedSlices");
      -[UIKBSplitKeyplaneGenerator alignSpaceKeyEdges](v69, "alignSpaceKeyEdges");
    }
    else
    {
      *(_QWORD *)&v98.f64[1] = rect_16;
      *(int8x16_t *)&v69->_leftSideWidestRow = vbslq_s8((int8x16_t)vcgtq_f64(v98, *(float64x2_t *)&v69->_leftSideWidestRow), (int8x16_t)v98, *(int8x16_t *)&v69->_leftSideWidestRow);
      -[UIKBSplitKeyplaneGenerator commitUncommittedSlices](v69, "commitUncommittedSlices");
    }
    -[NSMutableArray lastObject](v69->_rows, "lastObject");
    v99 = (id)objc_claimAutoreleasedReturnValue();

    if (v99 != v126)
    {
      v100 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "dictionaryWithObjectsAndKeys:", v101, CFSTR("KBghost"), 0);
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v126, "keyAtIndex:", v25);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "keyAtIndex:", v116);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = (void *)objc_msgSend(objc_alloc((Class)v39[415]), "initWithGeometry:frame:paddedFrame:", 0, v21 + width + x, y, width, height, v21 + width + x, y, width, height);
      v106 = (void *)objc_msgSend(v103, "copy");
      LOBYTE(v110) = 1;
      -[UIKBSplitKeyplaneGenerator addKey:withShape:forRow:attribs:left:force:isDefaultWidth:](v69, "addKey:withShape:forRow:attribs:left:force:isDefaultWidth:", v106, v105, v126, v102, 1, 0, v110);

      v107 = (void *)objc_msgSend(objc_alloc((Class)v39[415]), "initWithGeometry:frame:paddedFrame:", 0, v37 - (v123 + v40), v42, v40, v119, v37 - (v123 + v40), v42, v40, v119);
      v108 = (void *)objc_msgSend(v104, "copy");
      LOBYTE(v111) = 1;
      -[UIKBSplitKeyplaneGenerator addKey:withShape:forRow:attribs:left:force:isDefaultWidth:](v69, "addKey:withShape:forRow:attribs:left:force:isDefaultWidth:", v108, v107, v126, v102, 0, 0, v111);

      v97 = (void *)v118;
    }

    v4 = v115;
  }

}

- (id)hintsForRow:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "keys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v5;
  objc_msgSend(v5, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalShape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "originalShape");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "frame");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%d-"), (int)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v3, "keys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    do
    {
      v16 = 0;
      v17 = v11;
      do
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v16), "shape");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "originalShape");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v18, "originalShape");
          v20 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v20;
        }
        objc_msgSend(v18, "frame");
        objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("%d:"), (int)v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v16;
        v17 = v11;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v14);
  }

  objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary valueForKey:](self->_splitLayoutHints, "valueForKey:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary valueForKey:](self->_splitLayoutHints, "valueForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

    v23 = v24;
    goto LABEL_20;
  }
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (unint64_t)objc_msgSend(v25, "count") >> 1;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "keys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v28, "count") - v26);
    v29 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("LeftCount"));
    v38 = (void *)v29;
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, CFSTR("RightCount"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", CFSTR("10"), CFSTR("LeftMargin"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", CFSTR("10"), CFSTR("RightMargin"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keys");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v32)
    {
      v33 = 0;
      do
      {
        objc_msgSend(v30, "addObject:", CFSTR("1"));
        ++v33;
        objc_msgSend(v3, "keys");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "count");

      }
      while (v35 > v33);
    }
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v30, CFSTR("WidthFactors"));

    goto LABEL_19;
  }
LABEL_20:

  return v23;
}

- (void)organizeKeyplaneIntoRows
{
  NSMutableArray *rows;
  NSMutableArray *v4;
  NSMutableArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  UIKBSplitRow *v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  uint64_t i;
  void *v18;
  double y;
  void *v20;
  UIKBSplitRow *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  v28 = *MEMORY[0x1E0C80C00];
  rows = self->_rows;
  if (rows)
  {
    -[NSMutableArray removeAllObjects](rows, "removeAllObjects");
  }
  else
  {
    v4 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v5 = self->_rows;
    self->_rows = v4;

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[UIKBSplitKeyplaneGenerator keysOrderedByPosition](self, "keysOrderedByPosition", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v7)
  {

    v10 = 0;
    goto LABEL_21;
  }
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v24;
  v12 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v16 = 2147483650.0;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v24 != v11)
        objc_enumerationMutation(v6);
      v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_msgSend(v18, "frame");
      y = v29.origin.y;
      v30.origin.x = v12;
      v30.origin.y = v13;
      v30.size.width = v14;
      v30.size.height = v15;
      if (!CGRectEqualToRect(v29, v30))
      {
        if (v10)
        {
          if (vabdd_f64(v16, y) < 0.00000011920929)
          {
            -[UIKBSplitRow addKey:](v10, "addKey:", v18);
            continue;
          }
          -[UIKBSplitKeyplaneGenerator hintsForRow:](self, "hintsForRow:", v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBSplitRow setHints:](v10, "setHints:", v20);

          -[NSMutableArray addObject:](self->_rows, "addObject:", v10);
          ++v9;
        }
        v21 = objc_alloc_init(UIKBSplitRow);

        -[UIKBSplitRow setRowIndex:](v21, "setRowIndex:", v9);
        -[UIKBSplitRow addKey:](v21, "addKey:", v18);
        v16 = y;
        v10 = v21;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v8);

  if (v10 && (-[NSMutableArray containsObject:](self->_rows, "containsObject:", v10) & 1) == 0)
  {
    -[UIKBSplitKeyplaneGenerator hintsForRow:](self, "hintsForRow:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBSplitRow setHints:](v10, "setHints:", v22);

    -[NSMutableArray addObject:](self->_rows, "addObject:", v10);
  }
LABEL_21:

}

- (void)initializeGeneratorForKeyplane:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  UIKeyboardSliceSet *v21;
  UIKeyboardSliceSet *sliceSet;
  id v23;

  v6 = a4;
  v7 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textInputTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_keyboardType = objc_msgSend(v9, "keyboardType");

  objc_msgSend(v7, "frame");
  v11 = v10;
  v13 = v12;

  self->_keyboardSize.width = v11;
  self->_keyboardSize.height = v13;
  v14 = (void *)initializeGeneratorForKeyplane_name__hints;
  if (!initializeGeneratorForKeyplane_name__hints)
  {
    +[UIRivenFactory _splitKeyboardLayoutHints](UIRivenFactory, "_splitKeyboardLayoutHints");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)initializeGeneratorForKeyplane_name__hints;
    initializeGeneratorForKeyplane_name__hints = v15;

    v14 = (void *)initializeGeneratorForKeyplane_name__hints;
  }
  objc_storeStrong((id *)&self->_splitLayoutHints, v14);
  self->_leftSideWidestRow = 0.0;
  self->_rightSideWidestRow = 0.0;
  if (self->_keyboardType == 1)
    self->_keyboardType = 0;
  +[UIKeyboardImpl defaultSizeForInterfaceOrientation:](UIKeyboardImpl, "defaultSizeForInterfaceOrientation:", 1);
  v18 = v17;
  -[UIKBTree frame](self->_sourceKeyboard, "frame");
  if (v19 == v18)
    v20 = 1;
  else
    v20 = 4;
  +[UIKeyboardSliceStore sliceSetIDForKeyplaneName:type:orientation:](UIKeyboardSliceStore, "sliceSetIDForKeyplaneName:type:orientation:", v6, self->_keyboardType, v20);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  v21 = -[UIKeyboardSliceSet initWithSliceID:]([UIKeyboardSliceSet alloc], "initWithSliceID:", v23);
  sliceSet = self->_sliceSet;
  self->_sliceSet = v21;

}

- (id)finalizeSplitKeyplane
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double rightSideWidestRow;
  double v8;
  double height;
  CGFloat v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIKBShape *v16;
  void *v17;
  UIKBShape *v18;
  UIKBShape *v19;
  void *v20;
  UIKBShape *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableArray *rows;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  id v55;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rivenSizeFactor:", 7.0);
  v6 = v5;

  rightSideWidestRow = self->_rightSideWidestRow;
  v8 = v6 + self->_leftSideWidestRow;
  height = self->_keyboardSize.height;
  v10 = self->_keyboardSize.width - rightSideWidestRow - v6;
  v11 = v6 + rightSideWidestRow;
  +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[UIKBTree name](self->_sourceKeyplane, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-split"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", v15);

  +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setName:", CFSTR("split-left"));
  v16 = [UIKBShape alloc];
  +[UIKBGeometry geometryWithRect:](UIKBGeometry, "geometryWithRect:", 0.0, 0.0, v8, height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v16, "initWithGeometry:frame:paddedFrame:", v17, 0.0, 0.0, v8, height, 0.0, 0.0, v8, height);
  objc_msgSend(v59, "setShape:", v18);

  +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setName:", CFSTR("split-right"));
  v19 = [UIKBShape alloc];
  +[UIKBGeometry geometryWithRect:](UIKBGeometry, "geometryWithRect:", v10, 0.0, v11, height);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v19, "initWithGeometry:frame:paddedFrame:", v20, v10, 0.0, v11, height, v10, 0.0, v11, height);
  objc_msgSend(v58, "setShape:", v21);

  +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  rows = self->_rows;
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __51__UIKBSplitKeyplaneGenerator_finalizeSplitKeyplane__block_invoke;
  v62[3] = &unk_1E16D8B80;
  v63 = v22;
  v64 = v23;
  v65 = v24;
  v66 = v25;
  v67 = v26;
  v68 = v27;
  v57 = v12;
  v69 = v57;
  v60 = v27;
  v29 = v26;
  v30 = v25;
  v61 = v24;
  v31 = v23;
  v32 = v22;
  -[NSMutableArray enumerateObjectsUsingBlock:](rows, "enumerateObjectsUsingBlock:", v62);
  objc_msgSend(v59, "subtrees");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v32);

  objc_msgSend(v59, "subtrees");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObject:", v31);

  objc_msgSend(v59, "subtrees");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObject:", v61);

  objc_msgSend(v58, "subtrees");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObject:", v30);

  objc_msgSend(v58, "subtrees");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v29);

  objc_msgSend(v58, "subtrees");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObject:", v60);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v59, v58, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setSubtrees:", v39);

  -[UIKBTree properties](self->_sourceKeyplane, "properties");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setProperties:", v40);

  objc_msgSend(v57, "subtrees");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree subtreeWithType:](self->_sourceKeyplane, "subtreeWithType:", 11);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObject:", v42);

  -[UIKBTree subtrees](self->_sourceKeyplane, "subtrees");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectAtIndex:", 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "frame");
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;

  if (+[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton"))
    v53 = v52;
  else
    v53 = v52 + 20.0;
  -[UIKeyboardSliceSet setStartRect:](self->_sliceSet, "setStartRect:", v46, v48, v50, v53);
  -[UIKeyboardSliceSet setEndRect:](self->_sliceSet, "setEndRect:", 0.0, 0.0, self->_keyboardSize.width, self->_keyboardSize.height);
  -[UIKeyboardSliceSet setLeftWidth:](self->_sliceSet, "setLeftWidth:", v8);
  -[UIKeyboardSliceSet setRightWidth:](self->_sliceSet, "setRightWidth:", v11);
  +[UIKeyboardSliceStore archiveSet:](UIKeyboardSliceStore, "archiveSet:", self->_sliceSet);
  v54 = v69;
  v55 = v57;

  return v55;
}

void __51__UIKBSplitKeyplaneGenerator_finalizeSplitKeyplane__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "listOfType:left:", 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "subtrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  objc_msgSend(a1[5], "subtrees");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listOfType:left:", 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(a1[6], "subtrees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listOfType:left:", 2, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  objc_msgSend(v3, "listOfType:left:", 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[7], "subtrees");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v10);

  objc_msgSend(a1[8], "subtrees");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listOfType:left:", 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  objc_msgSend(a1[9], "subtrees");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listOfType:left:", 2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v15);

  objc_msgSend(v4, "subtrees");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subtrees");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v24, "shouldCacheKey", (_QWORD)v25))
          objc_msgSend(a1[10], "cacheKey:", v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v21);
  }

}

- (id)generateRivenKeyplaneFromKeyplane:(id)a3 forKeyboard:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  NSString *v33;
  CGSize v34;
  double width;
  double height;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  void *v50;
  void *v51;
  id v52;
  id v53;
  NSMutableArray *obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_sourceKeyplane, a3);
    objc_storeStrong((id *)&self->_sourceKeyboard, a4);
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "looksLikeShiftAlternate") && objc_msgSend(v7, "isShiftKeyplane"))
    {
      objc_msgSend(v7, "shiftAlternateKeyplaneName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subtreeWithName:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
    }
    -[UIKBSplitKeyplaneGenerator initializeGeneratorForKeyplane:name:](self, "initializeGeneratorForKeyplane:name:", v7, v9);
    -[UIKBSplitKeyplaneGenerator organizeKeyplaneIntoRows](self, "organizeKeyplaneIntoRows");
    -[NSMutableArray objectAtIndex:](self->_rows, "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForKey:", CFSTR("RowPadding"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = v15;
    if (v15)
    {
      objc_msgSend(v15, "floatValue");
      v17 = v16;
    }
    else
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "preferencesActions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "rivenSizeFactor:", 5.0);
      v17 = v21;

    }
    v53 = v7;
    if ((unint64_t)-[NSMutableArray count](self->_rows, "count") <= 4)
      v22 = v17;
    else
      v22 = v17 + 1.0;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "preferencesActions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rivenSizeFactor:", 9.0);
    v26 = v25;

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = self->_rows;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    v51 = v9;
    v52 = v8;
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v56 != v29)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v31, "hints");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "valueForKey:", CFSTR("KeySize"));
          v33 = (NSString *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            v34 = CGSizeFromString(v33);
            width = v34.width;
            height = v34.height;
          }
          else
          {
            height = 46.0;
            width = 40.0;
          }
          +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "preferencesActions");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "rivenSizeFactor:", width);
          v40 = v39;

          +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "preferencesActions");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "rivenSizeFactor:", height);
          v44 = v43;

          objc_msgSend(v31, "setRowOffset:", v26);
          objc_msgSend(v31, "setRowWidth:", self->_keyboardSize.width);
          objc_msgSend(v31, "setDefaultKeySize:", v40, v44);
          -[UIKBSplitKeyplaneGenerator splitRow:](self, "splitRow:", v31);
          objc_msgSend(v31, "defaultKeySize");
          v26 = v26 + v22 + v45;

        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      }
      while (v28);
    }

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "preferencesActions");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "rivenSizeFactor:", 3.0);
    self->_keyboardSize.height = v26 + v48;

    -[UIKBSplitKeyplaneGenerator finalizeSplitKeyplane](self, "finalizeSplitKeyplane");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v52;
    v7 = v53;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSlice, 0);
  objc_storeStrong((id *)&self->_leftSlice, 0);
  objc_storeStrong((id *)&self->_sliceSet, 0);
  objc_storeStrong((id *)&self->_sourceKeyplane, 0);
  objc_storeStrong((id *)&self->_sourceKeyboard, 0);
  objc_storeStrong((id *)&self->_splitLayoutHints, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end
