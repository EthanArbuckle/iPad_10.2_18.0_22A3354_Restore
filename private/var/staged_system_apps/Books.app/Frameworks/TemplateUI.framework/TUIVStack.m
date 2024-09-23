@implementation TUIVStack

- (TUIVStack)initWithLayout:(id)a3 children:(id)a4
{
  id v6;
  id v7;
  TUIVStack *v8;
  TUIVStack *v9;
  NSArray *v10;
  NSArray *children;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TUIVStack;
  v8 = -[TUIVStack init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_layout, v6);
    v10 = (NSArray *)objc_msgSend(v7, "copy");
    children = v9->_children;
    v9->_children = v10;

    v9->_flexedHeight = NAN;
    *(_OWORD *)&v9->_specifiedHeight.value = TUILengthNull;
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_guideLayoutController);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TUIVStack;
  -[TUIVStack dealloc](&v4, "dealloc");
}

- (void)setGuideLayoutController:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_guideLayoutController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_guideLayoutController);
    objc_msgSend(v6, "removeObserver:", self);

    v7 = objc_storeWeak((id *)&self->_guideLayoutController, obj);
    objc_msgSend(obj, "addObserver:", self);

    v5 = obj;
  }

}

- (void)guideLayoutController:(id)a3 changedPhase:(unint64_t)a4
{
  TUIGuide *guideBottom;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  if (self->_guideTop)
  {
    guideBottom = self->_guideBottom;
    if (guideBottom)
    {
      if (a4 == 1)
      {
        -[TUIGuide guideOffset](guideBottom, "guideOffset");
        v8 = v7;
        -[TUIGuide guideOffset](self->_guideTop, "guideOffset");
        if (v8 - v9 != self->_computedSize.width)
        {
LABEL_7:
          WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
          objc_msgSend(WeakRetained, "invalidateLayout");

        }
      }
      else if (!a4)
      {
        goto LABEL_7;
      }
    }
  }

}

- (void)computeLayoutWithOffset:(CGPoint)a3
{
  double y;
  double x;
  double width;
  void *v7;
  id v8;
  uint64_t v9;
  double v10;
  void *i;
  void *v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  id v36;
  uint64_t v37;
  void *k;
  void *v39;
  double v40;
  double v41;
  double v42;
  int v43;
  double v44;
  float v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  id v53;
  double v54;
  id v55;
  void *v56;
  unsigned __int8 v57;
  id v58;
  void *v59;
  int *v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *m;
  void *v65;
  id v66;
  char *v67;
  void *v68;
  char *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  TUIVStack *v78;
  id *location;
  id WeakRetained;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];

  y = a3.y;
  x = a3.x;
  width = self->_width;
  location = (id *)&self->_layout;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v78 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVStack children](self, "children"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
  if (!v8)
  {
    v81 = 0;
    goto LABEL_44;
  }
  v81 = 0;
  v9 = *(_QWORD *)v95;
  v10 = 0.0;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v95 != v9)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)i);
      objc_msgSend(WeakRetained, "flexedWidth");
      objc_msgSend(v12, "setFlexedWidth:");
      objc_msgSend(v12, "setFlexedHeight:", NAN);
      objc_msgSend(v12, "setContainingWidth:", width);
      objc_msgSend(v12, "validateLayout");
      objc_msgSend(v12, "computedTransformedSize");
      v14 = v13;
      v15 = objc_msgSend(v12, "computedHeight");
      v17 = v16;
      v18 = v7;
      if ((v16 & 0x8000000000000) != 0
        || (v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "box")),
            v20 = objc_msgSend(v19, "vcompressed") == 0,
            v19,
            !v20))
      {
        if (!v81)
          v81 = +[TUIFlexibleLayoutController newHeightController](TUIFlexibleLayoutController, "newHeightController");
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "box"));
        objc_msgSend(v81, "addLayout:length:compressed:", v12, v15, v17, objc_msgSend(v21, "vcompressed"));

      }
      v10 = v10 + v14;
      v7 = v18;
    }
    v8 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
  }
  while (v8);

  if (!v81)
  {
    v81 = 0;
    goto LABEL_46;
  }
  -[TUIVStack specifiedHeight](v78, "specifiedHeight");
  if ((v22 & 0x7000000000000uLL) <= 0x2000000000000)
    -[TUIVStack flexedHeight](v78, "flexedHeight");
  v23 = -[TUIVStack specifiedHeight](v78, "specifiedHeight");
  v25 = v24;
  -[TUIVStack specifiedHeight](v78, "specifiedHeight");
  if ((v26 & 0x7000000000000uLL) < 0x2000000000001
    || (-[TUIVStack specifiedHeight](v78, "specifiedHeight"), (v27 & 0x7000000000000) == 0x4000000000000))
  {
    -[TUIVStack flexedHeight](v78, "flexedHeight");
    -[TUIVStack flexedHeight](v78, "flexedHeight");
    if (v28 <= -3.40282347e38)
    {
      v30 = 4286578687;
    }
    else
    {
      if (v28 < 3.40282347e38)
      {
        *(float *)&v29 = v28;
        v23 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v29 | 0x7FC0000000000000);
LABEL_26:
        v25 = 2143289344;
        goto LABEL_27;
      }
      v30 = 2139095039;
    }
    v23 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v30 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
    goto LABEL_26;
  }
LABEL_27:
  objc_msgSend(v81, "computeWithMeasured:desired:", v23, v25, v10);
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "layouts"));
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v91;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(_QWORD *)v91 != v33)
          objc_enumerationMutation(v31);
        v35 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v81, "adjustedLengthForLayout:", v35);
        objc_msgSend(v35, "setFlexedHeight:");
        objc_msgSend(v35, "validateLayout");
      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
    }
    while (v32);
  }

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVStack children](v78, "children"));
  v36 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v87;
    v10 = 0.0;
    do
    {
      for (k = 0; k != v36; k = (char *)k + 1)
      {
        if (*(_QWORD *)v87 != v37)
          objc_enumerationMutation(v7);
        v39 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)k);
        if ((objc_msgSend(v39, "hidden") & 1) == 0)
        {
          objc_msgSend(v39, "computedTransformedSize");
          v10 = v10 + v40;
        }
      }
      v36 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
    }
    while (v36);
    goto LABEL_45;
  }
LABEL_44:
  v10 = 0.0;
LABEL_45:

LABEL_46:
  LODWORD(v41) = -[TUIVStack specifiedHeight](v78, "specifiedHeight");
  v42 = COERCE_FLOAT(-[TUIVStack specifiedHeight](v78, "specifiedHeight", v41));
  -[TUIVStack specifiedHeight](v78, "specifiedHeight");
  LODWORD(v44) = v43;
  -[TUIVStack specifiedHeight](v78, "specifiedHeight", v44);
  v46 = fmin(v42, v45);
  LODWORD(v47) = (unint64_t)-[TUIVStack specifiedHeight](v78, "specifiedHeight") >> 32;
  v48 = fmax(v46, COERCE_FLOAT((unint64_t)-[TUIVStack specifiedHeight](v78, "specifiedHeight", v47) >> 32));
  -[TUIVStack flexedHeight](v78, "flexedHeight");
  -[TUIVStack flexedHeight](v78, "flexedHeight");
  v50 = fmax(v48, v49);
  -[TUIVStack specifiedHeight](v78, "specifiedHeight");
  if ((v51 & 0x7000000000000) == 0x4000000000000)
  {
    -[TUIVStack flexedHeight](v78, "flexedHeight");
    -[TUIVStack flexedHeight](v78, "flexedHeight");
    v50 = v52;
  }
  v53 = objc_loadWeakRetained((id *)&v78->_guideLayoutController);
  if (v53)
  {

    v54 = 0.0;
  }
  else
  {
    v55 = objc_loadWeakRetained(location);
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "layoutAncestor"));
    v57 = objc_msgSend(v56, "isVerticallyAligningChildren");

    v54 = 0.0;
    if ((v57 & 1) == 0)
    {
      v58 = objc_loadWeakRetained(location);
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "box"));
      v60 = (int *)objc_msgSend(v59, "valign");

      if (v60 == (int *)((char *)&dword_0 + 1) || v60 == (int *)((char *)&dword_0 + 3))
      {
        v54 = v50 - v10;
      }
      else if (v60 == &dword_4)
      {
        v54 = (v50 - v10) * 0.5;
      }
    }
  }
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVStack children](v78, "children"));
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
  if (v62)
  {
    v63 = *(_QWORD *)v83;
    do
    {
      for (m = 0; m != v62; m = (char *)m + 1)
      {
        if (*(_QWORD *)v83 != v63)
          objc_enumerationMutation(v61);
        v65 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)m);
        if ((objc_msgSend(v65, "hidden") & 1) == 0)
        {
          v66 = objc_loadWeakRetained(location);
          v67 = (char *)objc_msgSend(v66, "computedLayoutDirection");

          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "box"));
          v69 = (char *)objc_msgSend(v68, "halign");

          if ((unint64_t)v69 < 2)
          {
            if (v67 == (_BYTE *)&dword_0 + 2)
            {
              objc_msgSend(v65, "computedTransformedSize");
              v73 = v72;
              objc_msgSend(v65, "computedLeadingEdge");
              v70 = width - v73 + v74;
            }
            else
            {
              objc_msgSend(v65, "computedLeadingEdge");
LABEL_71:
              v70 = -v71;
            }
          }
          else if (v69 == (_BYTE *)&dword_0 + 2)
          {
            objc_msgSend(v65, "computedHorizontalCenter");
            v70 = -(v75 - width * 0.5);
          }
          else
          {
            v70 = 0.0;
            if (v69 == (_BYTE *)&dword_0 + 3)
            {
              if (v67 == (_BYTE *)&dword_0 + 2)
              {
                objc_msgSend(v65, "computedTrailingEdge", 0.0);
                goto LABEL_71;
              }
              objc_msgSend(v65, "computedTrailingEdge", 0.0);
              v70 = width - v76;
            }
          }
          objc_msgSend(v65, "setComputedOrigin:", x + v70, y + v54);
          objc_msgSend(v65, "computedTransformedSize");
          v54 = v54 + v77;
          continue;
        }
      }
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
    }
    while (v62);
  }

  *(double *)&v78->_specifiedHeight._flags = width;
  v78->_computedSize.width = v50;

}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedHeight
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVStack children](self, "children", 0));
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

- (TUILayout)layout
{
  return (TUILayout *)objc_loadWeakRetained((id *)&self->_layout);
}

- (NSArray)children
{
  return self->_children;
}

- (TUIGuideLayoutController)guideLayoutController
{
  return (TUIGuideLayoutController *)objc_loadWeakRetained((id *)&self->_guideLayoutController);
}

- (TUIGuide)guideTop
{
  return self->_guideTop;
}

- (void)setGuideTop:(id)a3
{
  objc_storeStrong((id *)&self->_guideTop, a3);
}

- (TUIGuide)guideBottom
{
  return self->_guideBottom;
}

- (void)setGuideBottom:(id)a3
{
  objc_storeStrong((id *)&self->_guideBottom, a3);
}

- (BOOL)valignEnabled
{
  return self->_valignEnabled;
}

- (void)setValignEnabled:(BOOL)a3
{
  self->_valignEnabled = a3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedHeight
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_specifiedHeight.value;
}

- (void)setSpecifiedHeight:(id *)a3
{
  uint64_t v3;

  *(_QWORD *)&self->_specifiedHeight.value = a3;
  *(_QWORD *)&self->_specifiedHeight.max = v3;
}

- (double)containingHeight
{
  return self->_containingHeight;
}

- (void)setContainingHeight:(double)a3
{
  self->_containingHeight = a3;
}

- (double)flexedHeight
{
  return self->_flexedHeight;
}

- (void)setFlexedHeight:(double)a3
{
  self->_flexedHeight = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (CGSize)computedSize
{
  double v2;
  double width;
  CGSize result;

  v2 = *(double *)&self->_specifiedHeight._flags;
  width = self->_computedSize.width;
  result.height = width;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideBottom, 0);
  objc_storeStrong((id *)&self->_guideTop, 0);
  objc_destroyWeak((id *)&self->_guideLayoutController);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_layout);
}

@end
