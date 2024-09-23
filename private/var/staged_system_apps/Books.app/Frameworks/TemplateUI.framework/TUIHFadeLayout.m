@implementation TUIHFadeLayout

- (void)onChildrenUpdated
{
  TUILayout *content;
  TUILayout *decorator;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIHFadeLayout;
  -[TUILayout onChildrenUpdated](&v7, "onChildrenUpdated");
  content = self->_content;
  self->_content = 0;

  decorator = self->_decorator;
  self->_decorator = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_393E0;
  v6[3] = &unk_23E800;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  TUILayout *content;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  BOOL v10;
  float v11;
  uint64_t v12;
  TUILayout *decorator;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[6];

  content = self->_content;
  if (content)
  {
    v5 = -[TUILayout validatedIntrinsicWidth](content, "validatedIntrinsicWidth");
    v7 = v6;
  }
  else
  {
    v5 = 0x7FC000007FC00000;
    v7 = 0x200007FC00000;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v8, "padding");
  if (v9 <= -3.40282347e38)
  {
    v12 = 0x7FC00000FF7FFFFFLL;
  }
  else
  {
    v10 = v9 < 3.40282347e38;
    v11 = v9;
    if (v10)
      v12 = LODWORD(v11) | 0x7FC0000000000000;
    else
      v12 = 0x7FC000007F7FFFFFLL;
  }

  decorator = self->_decorator;
  if (decorator)
  {
    v14 = -[TUILayout validatedIntrinsicWidth](decorator, "validatedIntrinsicWidth");
  }
  else
  {
    v14 = 0x7FC000007FC00000;
    v15 = 0x200007FC00000;
  }
  v17[0] = v5;
  v17[1] = v7;
  v17[2] = v12;
  v17[3] = 0x1700007FC00000;
  v17[4] = v14;
  v17[5] = v15;
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthSum((unint64_t)v17, 3);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  TUILayout *content;

  content = self->_content;
  if (content)
    return -[TUILayout validatedIntrinsicHeight](content, "validatedIntrinsicHeight");
  else
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
}

- (void)computeLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  TUILayout *content;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  TUILayout *decorator;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  TUILayout **v23;
  char *v24;
  char *v25;
  char *v26;
  TUILayout *v27;
  double v28;
  _QWORD v29[3];
  void *__p;
  char *v31;
  char *v32;

  -[TUILayout computeWidth](self, "computeWidth");
  v4 = v3;
  -[TUILayout containingHeight](self, "containingHeight");
  v6 = v5;
  -[TUILayout setContainingWidth:](self->_content, "setContainingWidth:", v4);
  -[TUILayout setContainingHeight:](self->_content, "setContainingHeight:", v6);
  -[TUILayout validateLayout](self->_content, "validateLayout");
  -[TUILayout setContainingWidth:](self->_decorator, "setContainingWidth:", v4);
  -[TUILayout setContainingHeight:](self->_decorator, "setContainingHeight:", v6);
  -[TUILayout validateLayout](self->_decorator, "validateLayout");
  __p = 0;
  v31 = 0;
  v32 = 0;
  content = self->_content;
  v9 = (char *)sub_39CC4((uint64_t)&v32, 1uLL);
  v10 = &v9[8 * v8];
  *(_QWORD *)v9 = content;
  v11 = v9 + 8;
  v13 = (char *)__p;
  v12 = v31;
  v14 = v9;
  if (v31 != __p)
  {
    do
    {
      v15 = *((_QWORD *)v12 - 1);
      v12 -= 8;
      *((_QWORD *)v14 - 1) = v15;
      v14 -= 8;
    }
    while (v12 != v13);
    v12 = (char *)__p;
  }
  __p = v14;
  v31 = v9 + 8;
  v32 = &v9[8 * v8];
  if (v12)
  {
    operator delete(v12);
    v10 = v32;
  }
  v31 = v9 + 8;
  decorator = self->_decorator;
  if (v11 >= v10)
  {
    v18 = (v11 - (_BYTE *)__p) >> 3;
    if ((unint64_t)(v18 + 1) >> 61)
      sub_6F9C();
    v19 = v10 - (_BYTE *)__p;
    v20 = v19 >> 2;
    if (v19 >> 2 <= (unint64_t)(v18 + 1))
      v20 = v18 + 1;
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8)
      v21 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v21 = v20;
    if (v21)
      v22 = (char *)sub_39CC4((uint64_t)&v32, v21);
    else
      v22 = 0;
    v23 = (TUILayout **)&v22[8 * v18];
    v24 = &v22[8 * v21];
    *v23 = decorator;
    v17 = (char *)(v23 + 1);
    v26 = (char *)__p;
    v25 = v31;
    if (v31 != __p)
    {
      do
      {
        v27 = (TUILayout *)*((_QWORD *)v25 - 1);
        v25 -= 8;
        *--v23 = v27;
      }
      while (v25 != v26);
      v25 = (char *)__p;
    }
    __p = v23;
    v31 = v17;
    v32 = v24;
    if (v25)
      operator delete(v25);
  }
  else
  {
    *((_QWORD *)v9 + 1) = decorator;
    v17 = v9 + 16;
  }
  v31 = v17;
  v29[0] = __p;
  v29[1] = v17;
  v28 = sub_39850((uint64_t)v29);
  *(_QWORD *)&self->_heightAbovePivot = v29[2];
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v28);
  if (__p)
  {
    v31 = (char *)__p;
    operator delete(__p);
  }
}

- (double)computedHeightAbovePivot
{
  return self->_heightAbovePivot;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  double v39;
  double v40;
  double v41;

  v6 = a4;
  if (a3 < 4)
  {
    v37 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout model](self, "model"));
    objc_msgSend(v6, "contentsScale");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "renderModelForLayout:kind:", self->_content, 6));
    -[TUILayout erasableInsetsForContentsScale:](self->_content, "erasableInsetsForContentsScale:", v9);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "renderModelForLayout:kind:", self->_decorator, 6));
    v39 = v16;
    v40 = v14;
    v41 = v12;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    -[TUILayout computedNaturalSize](self, "computedNaturalSize");
    v23 = TUISizeRoundedForScale(v21, v22, v9);
    v25 = v24;
    -[TUILayout computedOrigin](self->_content, "computedOrigin");
    v27 = v26;
    v29 = v28;
    -[TUILayout computedOrigin](self->_decorator, "computedOrigin");
    v31 = v30;
    v33 = v32;
    objc_msgSend(v7, "padding");
    v35 = v34;
    objc_msgSend(v7, "gradientWidth");
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[TUIOverlayFadeView renderModelWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:](TUIOverlayFadeView, "renderModelWithIdentifier:size:content:contentOrigin:contentErasableInsets:overlay:overlayOrigin:padding:gradientWidth:layoutDirection:", v20, v10, v19, -[TUILayout computedLayoutDirection](self, "computedLayoutDirection"), v23, v25, v27, v29, v41, v40, v39, v18, v31, v33, v35,
                      v36));

  }
  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorator, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
