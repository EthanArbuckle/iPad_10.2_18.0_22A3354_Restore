@implementation TUIVBoxLayout

- (TUIVBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v8;
  id v9;
  id v10;
  TUIVBoxLayout *v11;
  TUIVBoxLayout *v12;
  uint64_t v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUIVBoxLayout;
  v11 = -[TUILayout initWithModel:parent:controller:](&v15, "initWithModel:parent:controller:", v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    -[TUILayout specifiedWidth](v11, "specifiedWidth");
    if ((v13 & 0x6000000000000) == 0x2000000000000)
      -[TUILayout setSpecifiedWidthComputeInherited:](v12, "setSpecifiedWidthComputeInherited:", 1);
  }

  return v12;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  float v23;
  double v24;
  unsigned int v25;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *__p;
  char *v34;
  char *v35;
  _BYTE v36[128];

  __p = 0;
  v34 = 0;
  v35 = 0;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(v3);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "validatedIntrinsicWidthConsideringSpecified");
        v9 = v7;
        v10 = v8;
        v11 = v34;
        if (v34 >= v35)
        {
          v13 = (v34 - (_BYTE *)__p) >> 4;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 60)
            sub_6F9C();
          v15 = v35 - (_BYTE *)__p;
          if ((v35 - (_BYTE *)__p) >> 3 > v14)
            v14 = v15 >> 3;
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
            v16 = 0xFFFFFFFFFFFFFFFLL;
          else
            v16 = v14;
          if (v16)
            v17 = (char *)sub_22FD4((uint64_t)&v35, v16);
          else
            v17 = 0;
          v18 = &v17[16 * v13];
          *(_QWORD *)v18 = v9;
          *((_QWORD *)v18 + 1) = v10;
          v20 = (char *)__p;
          v19 = v34;
          v21 = v18;
          if (v34 != __p)
          {
            do
            {
              *((_OWORD *)v21 - 1) = *((_OWORD *)v19 - 1);
              v21 -= 16;
              v19 -= 16;
            }
            while (v19 != v20);
            v19 = (char *)__p;
          }
          v12 = v18 + 16;
          __p = v21;
          v34 = v18 + 16;
          v35 = &v17[16 * v16];
          if (v19)
            operator delete(v19);
        }
        else
        {
          *(_QWORD *)v34 = v7;
          *((_QWORD *)v11 + 1) = v8;
          v12 = v11 + 16;
        }
        v34 = v12;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v4);
  }

  v22 = TUILengthCombine((float *)__p, (v34 - (_BYTE *)__p) >> 4);
  v24 = fmin(fmax(*(float *)&v22, *((float *)&v22 + 1)), v23);
  if (v24 <= -3.40282347e38)
  {
    v27 = 4286578687;
  }
  else
  {
    if (v24 < 3.40282347e38)
    {
      *(float *)&v25 = v24;
      v26 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v25 | 0x7FC0000000000000);
      goto LABEL_30;
    }
    v27 = 2139095039;
  }
  v26 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v27 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
LABEL_30:
  if (__p)
  {
    v34 = (char *)__p;
    operator delete(__p);
  }
  return v26;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p;
  char *v29;
  char *v30;
  _BYTE v31[128];

  __p = 0;
  v29 = 0;
  v30 = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v3);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "validatedIntrinsicHeightConsideringSpecified");
        v9 = v7;
        v10 = v8;
        v11 = v29;
        if (v29 >= v30)
        {
          v13 = (v29 - (_BYTE *)__p) >> 4;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 60)
            sub_6F9C();
          v15 = v30 - (_BYTE *)__p;
          if ((v30 - (_BYTE *)__p) >> 3 > v14)
            v14 = v15 >> 3;
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
            v16 = 0xFFFFFFFFFFFFFFFLL;
          else
            v16 = v14;
          if (v16)
            v17 = (char *)sub_22FD4((uint64_t)&v30, v16);
          else
            v17 = 0;
          v18 = &v17[16 * v13];
          *(_QWORD *)v18 = v9;
          *((_QWORD *)v18 + 1) = v10;
          v20 = (char *)__p;
          v19 = v29;
          v21 = v18;
          if (v29 != __p)
          {
            do
            {
              *((_OWORD *)v21 - 1) = *((_OWORD *)v19 - 1);
              v21 -= 16;
              v19 -= 16;
            }
            while (v19 != v20);
            v19 = (char *)__p;
          }
          v12 = v18 + 16;
          __p = v21;
          v29 = v18 + 16;
          v30 = &v17[16 * v16];
          if (v19)
            operator delete(v19);
        }
        else
        {
          *(_QWORD *)v29 = v7;
          *((_QWORD *)v11 + 1) = v8;
          v12 = v11 + 16;
        }
        v29 = v12;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v4);
  }

  v22 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthSum((unint64_t)__p, (v29 - (_BYTE *)__p) >> 4);
  if (__p)
  {
    v29 = (char *)__p;
    operator delete(__p);
  }
  return v22;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p;
  char *v29;
  char *v30;
  _BYTE v31[128];

  __p = 0;
  v29 = 0;
  v30 = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v3);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "computedHeight");
        v9 = v7;
        v10 = v8;
        v11 = v29;
        if (v29 >= v30)
        {
          v13 = (v29 - (_BYTE *)__p) >> 4;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 60)
            sub_6F9C();
          v15 = v30 - (_BYTE *)__p;
          if ((v30 - (_BYTE *)__p) >> 3 > v14)
            v14 = v15 >> 3;
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
            v16 = 0xFFFFFFFFFFFFFFFLL;
          else
            v16 = v14;
          if (v16)
            v17 = (char *)sub_22FD4((uint64_t)&v30, v16);
          else
            v17 = 0;
          v18 = &v17[16 * v13];
          *(_QWORD *)v18 = v9;
          *((_QWORD *)v18 + 1) = v10;
          v20 = (char *)__p;
          v19 = v29;
          v21 = v18;
          if (v29 != __p)
          {
            do
            {
              *((_OWORD *)v21 - 1) = *((_OWORD *)v19 - 1);
              v21 -= 16;
              v19 -= 16;
            }
            while (v19 != v20);
            v19 = (char *)__p;
          }
          v12 = v18 + 16;
          __p = v21;
          v29 = v18 + 16;
          v30 = &v17[16 * v16];
          if (v19)
            operator delete(v19);
        }
        else
        {
          *(_QWORD *)v29 = v7;
          *((_QWORD *)v11 + 1) = v8;
          v12 = v11 + 16;
        }
        v29 = v12;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v4);
  }

  v22 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthSum((unint64_t)__p, (v29 - (_BYTE *)__p) >> 4);
  if (__p)
  {
    v29 = (char *)__p;
    operator delete(__p);
  }
  return v22;
}

- (BOOL)isHorizontallyAligningChildren
{
  return 1;
}

- (void)_buildVStacks
{
  void *v3;
  uint64_t v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  BOOL v12;
  TUIVStack *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  TUIVStack *v18;
  void *v19;
  uint64_t v20;
  TUIVStack *v21;
  void *v22;
  TUIVStack *v23;
  void *v24;
  TUIVStack *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id obj;
  void *v36;
  NSMutableArray *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  if (!self->_vstacks)
  {
    v33 = 128;
    v37 = objc_opt_new(NSMutableArray);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideProvider](self, "guideProvider"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "guideLayoutControllerForLayout:", self));

    v36 = (void *)v4;
    if (v4)
    {
      v5 = objc_opt_new(NSMutableArray);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideTop](self, "guideTop"));
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v8)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "guideTop", v33));
            if (v11)
            {
              v12 = -[NSMutableArray count](v5, "count") == 0;

              if (!v12)
              {
                v13 = -[TUIVStack initWithLayout:children:]([TUIVStack alloc], "initWithLayout:children:", self, v5);
                -[TUIVStack setGuideTop:](v13, "setGuideTop:", v6);
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "guideTop"));
                -[TUIVStack setGuideBottom:](v13, "setGuideBottom:", v14);

                -[TUIVStack setGuideLayoutController:](v13, "setGuideLayoutController:", v36);
                v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "guideTop"));

                -[NSMutableArray removeAllObjects](v5, "removeAllObjects");
                -[NSMutableArray addObject:](v37, "addObject:", v13);

                v6 = (void *)v15;
              }
            }
            -[NSMutableArray addObject:](v5, "addObject:", v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "guideBottom"));
            v17 = v16 == 0;

            if (!v17)
            {
              v18 = -[TUIVStack initWithLayout:children:]([TUIVStack alloc], "initWithLayout:children:", self, v5);
              -[TUIVStack setGuideTop:](v18, "setGuideTop:", v6);
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "guideBottom"));
              -[TUIVStack setGuideBottom:](v18, "setGuideBottom:", v19);

              -[TUIVStack setGuideLayoutController:](v18, "setGuideLayoutController:", v36);
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "guideBottom"));

              -[NSMutableArray removeAllObjects](v5, "removeAllObjects");
              -[NSMutableArray addObject:](v37, "addObject:", v18);

              v6 = (void *)v20;
            }
          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v7);
      }

      if (-[NSMutableArray count](v5, "count"))
      {
        v21 = -[TUIVStack initWithLayout:children:]([TUIVStack alloc], "initWithLayout:children:", self, v5);
        -[TUIVStack setGuideTop:](v21, "setGuideTop:", v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideBottom](self, "guideBottom"));
        -[TUIVStack setGuideBottom:](v21, "setGuideBottom:", v22);

        -[TUIVStack setGuideLayoutController:](v21, "setGuideLayoutController:", v36);
        -[NSMutableArray addObject:](v37, "addObject:", v21);

      }
    }
    else
    {
      v23 = [TUIVStack alloc];
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
      v25 = -[TUIVStack initWithLayout:children:](v23, "initWithLayout:children:", self, v24);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideProvider](self, "guideProvider"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "guideLayoutControllerForLayout:", self));
      -[TUIVStack setGuideLayoutController:](v25, "setGuideLayoutController:", v27);

      -[NSMutableArray addObject:](v37, "addObject:", v25);
    }
    v28 = (objc_class *)-[NSMutableArray copy](v37, "copy", v33);
    v29 = *(Class *)((char *)&self->super.super.isa + v34);
    *(Class *)((char *)&self->super.super.isa + v34) = v28;

    if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v34), "count") == (char *)&dword_0 + 1)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa + v34), "firstObject"));
      v31 = -[TUILayout specifiedHeight](self, "specifiedHeight");
      objc_msgSend(v30, "setSpecifiedHeight:", v31, v32);
      objc_msgSend(v30, "setValignEnabled:", 1);

    }
  }
}

- (void)updateGuides
{
  NSArray *vstacks;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIVBoxLayout;
  -[TUILayout updateGuides](&v4, "updateGuides");
  vstacks = self->_vstacks;
  self->_vstacks = 0;

}

- (void)onChildTransformedSizeDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIVBoxLayout;
  -[TUILayout onChildTransformedSizeDidChange:](&v5, "onChildTransformedSizeDidChange:", v4);
  -[TUILayout setFlexedHeight:](self, "setFlexedHeight:", NAN);

}

- (void)computeLayout
{
  TUIVBoxLayout *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  NSArray *v14;
  id v15;
  uint64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  double v19;
  void *i;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  BOOL v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  TUIVBoxLayout *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  v2 = self;
  -[TUIVBoxLayout _buildVStacks](self, "_buildVStacks");
  -[TUILayout computeWidth](v2, "computeWidth");
  v4 = v3;
  v43 = v2;
  if ((char *)-[NSArray count](v2->_vstacks, "count") == (char *)&dword_0 + 1)
  {
    -[TUILayout flexedHeight](v2, "flexedHeight");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2->_vstacks, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v7, "setFlexedHeight:", v6);

    -[TUILayout containingHeight](v43, "containingHeight");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v43->_vstacks, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v10, "setContainingHeight:", v9);

    v2 = v43;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideProvider](v2, "guideProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "guideLayoutControllerForLayout:", v43));

  v13 = (char *)objc_msgSend(v12, "layoutPhase");
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v14 = v43->_vstacks;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v45;
    v17 = v13 == (_BYTE *)&dword_0 + 1 && v12 != 0;
    if (v13)
      v18 = 0;
    else
      v18 = v12 != 0;
    v19 = 0.0;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v21, "setWidth:", v4);
        if (v17)
        {
          objc_msgSend(v21, "computedSize");
          v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "guideTop"));
          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "guideBottom"));
            v26 = v25 == 0;

            v27 = v23;
            if (!v26)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "guideBottom", v23));
              objc_msgSend(v28, "guideOffset");
              v30 = v29;
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "guideTop"));
              objc_msgSend(v31, "guideOffset");
              v33 = v32;

              v27 = fmax(v30 - v33, 0.0);
            }
          }
          else
          {
            v27 = v23;
          }
          if (v23 != v27)
            objc_msgSend(v21, "setFlexedHeight:");
        }
        objc_msgSend(v21, "computeLayoutWithOffset:", 0.0, v19);
        objc_msgSend(v21, "computedSize");
        v35 = v34;
        if (v18)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "guideTop"));
          if (v36)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "guideBottom"));
            v38 = v37 == 0;

            if (!v38)
            {
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "guideTop"));
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "guideBottom"));
              v41 = objc_msgSend(v21, "computedHeight");
              objc_msgSend(v12, "addEdgeFrom:to:length:", v39, v40, v41, v42);

            }
          }
        }
        v19 = v19 + v35;
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v15);
  }
  else
  {
    v19 = 0.0;
  }

  if (v43->_dynamicLayouts)
    -[TUIVBoxLayout _updateDynamicLayouts](v43, "_updateDynamicLayouts");
  -[TUILayout setComputedNaturalSize:](v43, "setComputedNaturalSize:", v4, v19);
  *(_BYTE *)&v43->_flags |= 1u;

}

- (void)_updateDynamicLayouts
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];

  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = self->_dynamicLayouts;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5), "updateSummariesFromChildren", (_QWORD)v6);
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (double)computedHeightAbovePivot
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TUIVBoxLayout;
  -[TUILayout computedHeightAbovePivot](&v15, "computedHeightAbovePivot");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pivotChild"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutForModel:", v7));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
    v10 = objc_msgSend(v9, "indexOfObjectIdenticalTo:", v8);

    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "computedHeightAbovePivot");
      v12 = v11;
      objc_msgSend(v8, "computedFrame");
      v4 = v12 + v13;
    }
  }

  return v4;
}

- (void)onChildInvalidate:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIVBoxLayout;
  -[TUILayout onChildInvalidate:](&v5, "onChildInvalidate:", v4);
  objc_msgSend(v4, "setFlexedWidth:", NAN);

}

- (void)onChildrenUpdated
{
  NSArray *vstacks;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];

  v21.receiver = self;
  v21.super_class = (Class)TUIVBoxLayout;
  -[TUILayout onChildrenUpdated](&v21, "onChildrenUpdated");
  -[TUILayout invalidateIntrinsicSize](self, "invalidateIntrinsicSize");
  vstacks = self->_vstacks;
  self->_vstacks = 0;

  v4 = objc_opt_new(NSMutableArray);
  v6 = objc_opt_class(_TUIVBoxDynamicArrayLayout, v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout containers](self, "containers", 0));
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_opt_class(v12, v8) == v6)
          v13 = v12;
        else
          v13 = 0;
        v14 = v13;
        if (v14)
          -[NSMutableArray addObject:](v4, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v9);
  }

  v15 = -[NSMutableArray count](v4, "count");
  if (v15)
    v16 = -[NSMutableArray copy](v4, "copy");
  else
    v16 = 0;
  objc_storeStrong((id *)&self->_dynamicLayouts, v16);
  if (v15)

}

- (void)appendVisibleBoundsObservers:(id)a3 axis:(unint64_t)a4 offset:(double)a5
{
  id v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSMutableArray *v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v8 = a3;
  if (a4 == 2)
  {
    v17 = 2;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      *(_BYTE *)&self->_flags &= ~1u;
      ++self->_visibleBoundsGeneration;
    }
    v18 = objc_opt_new(NSMutableArray);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout model](self, "model"));
    objc_msgSend(v9, "appendLayoutChildrenToArray:", v18);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v18;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v14, "dynamicArrayWindowingBox") & 1) != 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dynamicArrayWindowingBox"));
            if (v15)
            {
              v16 = +[TUIVisibleBoundsObserver newVerticalWithWindow:layout:offset:](TUIVisibleBoundsObserver, "newVerticalWithWindow:layout:offset:", v15, self, a5);
              objc_msgSend(v8, "addObject:", v16);

            }
          }
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    a4 = 2;
  }
  v19.receiver = self;
  v19.super_class = (Class)TUIVBoxLayout;
  -[TUILayout appendVisibleBoundsObservers:axis:offset:](&v19, "appendVisibleBoundsObservers:axis:offset:", v8, a4, a5, v17);

}

- (id)guideProviderForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "guideProviderForLayout:", v4));

  return v6;
}

- (BOOL)groupedContainingIsGrouped
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v3 = objc_msgSend(v2, "grouped");

  return v3;
}

- (UIEdgeInsets)groupedContainingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (unint64_t)groupedContainingInsetsMode
{
  return 0;
}

- (unint64_t)groupedContainingContentMode
{
  return 0;
}

- (unint64_t)visibleBoundsGeneration
{
  return self->_visibleBoundsGeneration;
}

- (NSArray)vstacks
{
  return self->_vstacks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vstacks, 0);
  objc_storeStrong((id *)&self->_dynamicLayouts, 0);
}

@end
