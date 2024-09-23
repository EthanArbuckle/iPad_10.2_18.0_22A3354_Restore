@implementation UIKBRenderFactoryLayoutSegment

- (int)keyStates
{
  return self->_states;
}

- (BOOL)shouldOverlayTraitsForKey:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "dynamicLayout")
    && (objc_msgSend(v3, "displayType") == 21
     || objc_msgSend(v3, "displayType") == 18
     || objc_msgSend(v3, "displayType") == 3
     || objc_msgSend(v3, "displayType") == 5
     || objc_msgSend(v3, "displayType") == 26
     || objc_msgSend(v3, "displayType") == 4
     || objc_msgSend(v3, "displayType") == 53
     || objc_msgSend(v3, "displayType") == 32
     || objc_msgSend(v3, "displayType") == 33
     || objc_msgSend(v3, "interactionType") == 44
     || objc_msgSend(v3, "interactionType") == 41
     || objc_msgSend(v3, "interactionType") == 38
     || objc_msgSend(v3, "interactionType") == 9
     || objc_msgSend(v3, "interactionType") == 10
     || objc_msgSend(v3, "interactionType") == 14
     || objc_msgSend(v3, "interactionType") == 12
     || objc_msgSend(v3, "interactionType") == 17
     || (objc_msgSend(v3, "usesControlKeyAppearance") & 1) != 0);

  return v4;
}

- (BOOL)containsPoint:(CGPoint)a3 inRect:(CGRect)a4 withKeyplane:(id)a5
{
  double height;
  double width;
  double v7;
  double v8;
  id v10;
  int rectCount;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  double v20;
  char v21;
  void *v22;
  int edgeCount;
  uint64_t v24;
  unint64_t *edges;
  unint64_t v26;
  NSString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t i;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat MinY;
  double v39;
  double v40;
  double v41;
  double v42;
  double MaxY;
  double MaxX;
  char v45;
  BOOL v46;
  char v47;
  char v48;
  char v49;
  int v51;
  char v52;
  int v53;
  id v54;
  double v55;
  double x;
  double y;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;
  CGPoint v64;
  CGPoint v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  y = a4.origin.y;
  v7 = a3.y;
  v8 = a3.x;
  v63 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  rectCount = self->_rectCount;
  v55 = height;
  if (!rectCount)
  {
LABEL_14:
    v21 = 1;
    if (!v10)
      goto LABEL_50;
    goto LABEL_15;
  }
  if (rectCount >= 1)
  {
    v12 = 0;
    v13 = 24;
    do
    {
      v14 = x + width * *(double *)((char *)self + v13 - 8);
      v15 = y + height * *(double *)((char *)&self->super.isa + v13);
      v16 = width * *(double *)((char *)&self->_rectCount + v13);
      v17 = height * *(double *)((char *)&self->_rects[0].origin.x + v13);
      v18 = self->_triangleCorners[v12];
      v66.origin.x = v14;
      v66.origin.y = v15;
      v66.size.width = v16;
      v66.size.height = v17;
      v64.x = v8;
      v64.y = v7;
      if (CGRectContainsPoint(v66, v64))
      {
        if (!v18)
          goto LABEL_14;
        if ((v18 & 4) != 0)
        {
          v19 = v8 / v16;
LABEL_10:
          v68.origin.x = v14;
          v68.origin.y = v15;
          v68.size.width = v16;
          v68.size.height = v17;
          v20 = v19 + (CGRectGetMaxY(v68) - v7) / v17;
          height = v55;
          if (v20 <= 1.0)
            goto LABEL_14;
          goto LABEL_11;
        }
        if ((v18 & 8) != 0)
        {
          v67.origin.x = v14;
          v67.origin.y = v15;
          v67.size.width = v16;
          v67.size.height = v17;
          v19 = (CGRectGetMaxX(v67) - v8) / v16;
          goto LABEL_10;
        }
      }
LABEL_11:
      ++v12;
      v13 += 32;
    }
    while (v12 < self->_rectCount);
  }
  v21 = 0;
  if (v10)
  {
LABEL_15:
    objc_msgSend(v10, "cache");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      edgeCount = self->_edgeCount;
      if (edgeCount)
      {
        if (edgeCount < 1)
        {
          v45 = 0;
        }
        else
        {
          v51 = self->_edgeCount;
          v52 = v21;
          v53 = rectCount;
          v24 = 0;
          edges = self->_edges;
          v54 = v10;
          do
          {
            v26 = edges[v24];
            v27 = self->_cachedKeyNames[v24];
            objc_msgSend(v10, "cachedKeysByKeyName:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (v28
              && (v60 = 0u,
                  v61 = 0u,
                  v58 = 0u,
                  v59 = 0u,
                  (v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v58, v62, 16)) != 0))
            {
              v31 = v30;
              v32 = 0;
              v33 = *(_QWORD *)v59;
              do
              {
                for (i = 0; i != v31; ++i)
                {
                  if (*(_QWORD *)v59 != v33)
                    objc_enumerationMutation(v29);
                  objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "frame");
                  v36 = v35;
                  MinY = v37;
                  v40 = v39;
                  v42 = v41;
                  switch(v26)
                  {
                    case 1uLL:
                      v69.origin.x = x;
                      v69.origin.y = y;
                      v69.size.width = width;
                      v69.size.height = height;
                      MaxY = CGRectGetMaxY(v69);
                      v70.origin.x = v36;
                      v70.origin.y = MinY;
                      v70.size.width = v40;
                      v70.size.height = v42;
                      v42 = MaxY - CGRectGetMinY(v70);
                      goto LABEL_29;
                    case 2uLL:
                      v73.origin.x = x;
                      v73.origin.y = y;
                      v73.size.width = width;
                      v73.size.height = height;
                      MaxX = CGRectGetMaxX(v73);
                      v74.origin.x = v36;
                      v74.origin.y = MinY;
                      v74.size.width = v40;
                      v74.size.height = v42;
                      v40 = MaxX - CGRectGetMinX(v74);
LABEL_29:
                      height = v55;
                      break;
                    case 4uLL:
                      v71.origin.x = x;
                      v71.origin.y = y;
                      v71.size.width = width;
                      v71.size.height = height;
                      MinY = CGRectGetMinY(v71);
                      v72.origin.x = v36;
                      v72.origin.y = MinY;
                      v72.size.width = v40;
                      v72.size.height = v42;
                      v42 = CGRectGetMaxY(v72);
                      break;
                    case 8uLL:
                      v75.origin.x = x;
                      v75.origin.y = y;
                      v75.size.width = width;
                      v75.size.height = height;
                      v76.origin.x = CGRectGetMinX(v75);
                      v36 = v76.origin.x;
                      v76.origin.y = MinY;
                      v76.size.width = v40;
                      v76.size.height = v42;
                      v40 = CGRectGetMaxX(v76);
                      break;
                    default:
                      break;
                  }
                  v77.origin.x = v36;
                  v77.origin.y = MinY;
                  v77.size.width = v40;
                  v77.size.height = v42;
                  v65.x = v8;
                  v65.y = v7;
                  v32 |= CGRectContainsPoint(v77, v65);
                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
              }
              while (v31);

              edges = self->_edges;
              v10 = v54;
              if ((v32 & 1) != 0)
              {
                v45 = 1;
                goto LABEL_40;
              }
            }
            else
            {

            }
            ++v24;
          }
          while (v24 < self->_edgeCount);
          v45 = 0;
LABEL_40:
          v21 = v52;
          rectCount = v53;
          edgeCount = v51;
        }
      }
      else
      {
        v45 = 1;
      }
      v46 = -[UIKBRenderFactoryLayoutSegment requireAllMatches](self, "requireAllMatches");
      if (edgeCount)
        v47 = v45;
      else
        v47 = 0;
      if (rectCount)
        v48 = v21;
      else
        v48 = 0;
      v49 = v48 | v47;
      if (v46)
        v21 &= v45;
      else
        v21 = v49;
    }
  }
LABEL_50:

  return v21;
}

- (BOOL)requireAllMatches
{
  return self->_requireAllMatches;
}

- (UIKBRenderTraits)traits
{
  return self->_traits;
}

- (void)addRelativeLayoutRectFromEdge:(unint64_t)a3 ofCachedKey:(id)a4
{
  int edgeCount;
  void *v9;
  id v10;

  v10 = a4;
  edgeCount = self->_edgeCount;
  if (edgeCount < 10
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKBRenderFactory.m"), 201, CFSTR("Too many layout edges")), v9, edgeCount = self->_edgeCount, edgeCount <= 9))
  {
    self->_edges[edgeCount] = a3;
    objc_storeStrong((id *)&self->_cachedKeyNames[self->_edgeCount], a4);
    ++self->_edgeCount;
  }

}

- (void)setKeyStates:(int)a3
{
  self->_states = a3;
}

+ (id)segmentWithTraits:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTraits:", v4);

  return v5;
}

- (UIKBRenderFactoryLayoutSegment)initWithTraits:(id)a3
{
  id v5;
  UIKBRenderFactoryLayoutSegment *v6;
  UIKBRenderFactoryLayoutSegment *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBRenderFactoryLayoutSegment;
  v6 = -[UIKBRenderFactoryLayoutSegment init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_traits, a3);
    v7->_rectCount = 0;
    v7->_edgeCount = 0;
  }

  return v7;
}

- (void)addLayoutRect:(CGRect)a3 asTriangle:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int rectCount;
  CGFloat *v11;
  void *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  rectCount = self->_rectCount;
  if (rectCount < 10
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKBRenderFactory.m"), 191, CFSTR("Too many layout rects")), v13, rectCount = self->_rectCount, rectCount <= 9))
  {
    v11 = (CGFloat *)((char *)self + 32 * rectCount);
    v11[2] = x;
    v11[3] = y;
    v11[4] = width;
    v11[5] = height;
    self->_triangleCorners[rectCount] = a4;
    ++self->_rectCount;
  }
}

- (void)setRequireAllMatches:(BOOL)a3
{
  self->_requireAllMatches = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;
  NSString **v4;

  objc_storeStrong((id *)&self->_traits, 0);
  v3 = 0;
  v4 = &self->_cachedKeyNames[9];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -10);
}

@end
