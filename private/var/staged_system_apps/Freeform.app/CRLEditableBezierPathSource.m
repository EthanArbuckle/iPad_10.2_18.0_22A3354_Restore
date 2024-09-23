@implementation CRLEditableBezierPathSource

- (CRLEditableBezierPathSource)init
{
  CRLEditableBezierPathSource *v2;
  CRLBezierSubpath *v3;
  NSArray *v4;
  NSArray *mSubpaths;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLEditableBezierPathSource;
  v2 = -[CRLEditableBezierPathSource init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(CRLBezierSubpath);
    v4 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v3, 0);
    mSubpaths = v2->mSubpaths;
    v2->mSubpaths = v4;

  }
  return v2;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p subpaths=%p>"), v5, self, self->mSubpaths));

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  Class v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  objc_opt_class(self, a2);
  v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "setHasHorizontalFlip:", -[CRLPathSource hasHorizontalFlip](self, "hasHorizontalFlip"));
  objc_msgSend(v5, "setHasVerticalFlip:", -[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip"));
  v6 = objc_alloc((Class)NSArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v8 = objc_msgSend(v6, "initWithArray:copyItems:", v7, 1);

  objc_msgSend(v5, "setSubpaths:", v8);
  return v5;
}

+ (id)editableBezierPathSource
{
  return objc_alloc_init(CRLEditableBezierPathSource);
}

+ (CRLEditableBezierPathSource)editableBezierPathSourceWithPathSource:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bezierPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "editableBezierPathSourceWithBezierPath:", v4));

  return (CRLEditableBezierPathSource *)v5;
}

+ (CRLEditableBezierPathSource)editableBezierPathSourceWithBezierPath:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLEditableBezierPathSource editableBezierPathSource](CRLEditableBezierPathSource, "editableBezierPathSource"));
  objc_msgSend(v4, "setBezierPath:", v3);

  return (CRLEditableBezierPathSource *)v4;
}

- (BOOL)isEqual:(id)a3
{
  CRLEditableBezierPathSource *v4;
  CRLEditableBezierPathSource *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = (CRLEditableBezierPathSource *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLEditableBezierPathSource;
    if (-[CRLPathSource isEqual:](&v10, "isEqual:", v4))
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPath](self, "bezierPath"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPath](v5, "bezierPath"));

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  BOOL v4;
  id v5;
  objc_super v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPath](self, "bezierPath"));
  v4 = objc_msgSend(v3, "hash") != 0;

  v8 = v4;
  v7.receiver = self;
  v7.super_class = (Class)CRLEditableBezierPathSource;
  v5 = -[CRLPathSource hash](&v7, "hash");
  return sub_1000BC018((char *)&v8, 1, (uint64_t)v5);
}

- (BOOL)isEqualWithStrictComparison:(id)a3
{
  CRLEditableBezierPathSource *v4;
  CRLEditableBezierPathSource *v5;
  id v6;
  const CGPath *v7;
  id v8;
  const CGPath *v9;
  BOOL v10;
  objc_super v12;

  v4 = (CRLEditableBezierPathSource *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLEditableBezierPathSource;
    if (-[CRLPathSource isEqual:](&v12, "isEqual:", v4))
    {
      v5 = v4;
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPath](self, "bezierPath")));
      v7 = (const CGPath *)objc_msgSend(v6, "CGPath");

      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPath](v5, "bezierPath")));
      v9 = (const CGPath *)objc_msgSend(v8, "CGPath");

      v10 = v7 == v9 || CGPathEqualToPath(v7, v9);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)closeIfEndpointsAreEqual
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", self->mActiveSubpath));
  v5 = objc_msgSend(v4, "closeIfEndpointsAreEqual");

  return v5;
}

- (BOOL)isRectangular
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  if (objc_msgSend(v3, "count") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
    v6 = objc_msgSend(v5, "isRectangular");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isCircular
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  if (objc_msgSend(v3, "count") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
    v6 = objc_msgSend(v5, "isCircular");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)bezierPathWithoutFlips
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  objc_msgSend(v3, "moveToPoint:", CGPointZero.x, CGPointZero.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", "appendToBezierPath:", v3);

  return v3;
}

- (CGPath)pathWithoutFlips
{
  id v2;
  CGPath *v3;

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource bezierPathWithoutFlips](self, "bezierPathWithoutFlips")));
  v3 = (CGPath *)objc_msgSend(v2, "CGPath");

  return v3;
}

- (void)convertToHobby
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "convertToHobby");

}

- (void)setBezierPath:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  _QWORD v28[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;

  v4 = a3;
  v5 = (uint64_t)objc_msgSend(v4, "elementCount");
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_10016CE10;
  v45 = sub_10016CE20;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_10016CE10;
  v39 = sub_10016CE20;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_10016CE10;
  v33 = sub_10016CE20;
  v34 = objc_alloc_init((Class)NSMutableArray);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10016CE28;
  v28[3] = &unk_10123D5D8;
  v28[4] = &v35;
  v28[5] = &v29;
  v28[6] = &v41;
  v6 = objc_retainBlock(v28);
  if (v5 < 1)
  {
    v8 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = objc_msgSend(v4, "elementAtIndex:associatedPoints:", v7, &v47);
      if (v42[5])
        ((void (*)(_QWORD *))v6[2])(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v36[5], "lastNode"));
      v11 = v10;
      switch((unint64_t)v9)
      {
        case 0uLL:
          v12 = objc_claimAutoreleasedReturnValue(+[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:", v47, v48));
          v13 = (void *)v42[5];
          v42[5] = v12;

          if (v7)
          {
            v14 = (void *)v36[5];
            v36[5] = 0;
            goto LABEL_17;
          }
          ((void (*)(_QWORD *))v6[2])(v6);
          break;
        case 1uLL:
          v15 = objc_claimAutoreleasedReturnValue(+[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:", v47, v48));

          objc_msgSend((id)v36[5], "addNode:", v15);
          v8 = (void *)v15;
          break;
        case 2uLL:
          objc_msgSend(v10, "setOutControlPoint:", v47, v48);
          objc_msgSend(v11, "setType:", 2);
          v16 = objc_claimAutoreleasedReturnValue(+[CRLBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](CRLBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v51, v52, v49, v50, v51, v52));

          objc_msgSend((id)v36[5], "addNode:", v16);
          v8 = (void *)v16;
          break;
        case 3uLL:
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v36[5], "firstNode"));
          v14 = (void *)v17;
          if (v11)
            v18 = v17 == 0;
          else
            v18 = 1;
          if (!v18)
          {
            objc_msgSend(v11, "nodePoint");
            v20 = v19;
            v22 = v21;
            objc_msgSend(v14, "nodePoint");
            if (sub_10005FDF0(v20, v22, v23, v24))
            {
              objc_msgSend(v11, "inControlPoint");
              objc_msgSend(v14, "setInControlPoint:");
              objc_msgSend((id)v36[5], "removeLastNode");
            }
          }
          objc_msgSend((id)v36[5], "setClosed:", 1);
LABEL_17:

          break;
        default:
          break;
      }

      ++v7;
    }
    while (v5 != v7);
  }
  -[CRLEditableBezierPathSource setSubpaths:](self, "setSubpaths:", v30[5]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  objc_msgSend(v25, "makeObjectsPerformSelector:", "updateReflectedState");

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v27 = objc_msgSend(v26, "BOOLForKey:", CFSTR("CRLCreateBezierNodesByDefault"));

  if ((v27 & 1) == 0)
    -[CRLEditableBezierPathSource convertToHobby](self, "convertToHobby");

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
}

- (void)setNodes:(id)a3
{
  id v4;
  CRLBezierSubpath *v5;
  void *v6;
  CRLBezierSubpath *v7;

  v4 = a3;
  v5 = objc_alloc_init(CRLBezierSubpath);
  -[CRLBezierSubpath setNodes:](v5, "setNodes:", v4);

  v7 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  -[CRLEditableBezierPathSource setSubpaths:](self, "setSubpaths:", v6);

}

- (NSArray)nodes
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", "addNodesToArray:", v3);

  v5 = objc_msgSend(v3, "copy");
  return (NSArray *)v5;
}

- (void)reverseDirection
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", self->mActiveSubpath));
  objc_msgSend(v3, "reverseDirection");

}

- (void)setLockedFlipTransform:(BOOL)a3
{
  CGAffineTransform *p_mLockedFlipTransform;
  objc_super v6;
  objc_super v7[4];

  p_mLockedFlipTransform = &self->mLockedFlipTransform;
  v7[0].receiver = self;
  v7[0].super_class = (Class)CRLEditableBezierPathSource;
  -[objc_super pathFlipTransform](v7, "pathFlipTransform");
  v6 = v7[2];
  *(objc_super *)&p_mLockedFlipTransform->a = v7[1];
  *(objc_super *)&p_mLockedFlipTransform->c = v6;
  *(objc_super *)&p_mLockedFlipTransform->tx = v7[3];
  self->mHasLockedFlipTransform = a3;
}

- (void)beginNewSubpath
{
  void *v3;
  CRLBezierSubpath *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v4 = objc_alloc_init(CRLBezierSubpath);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObject:", v4));
  -[CRLEditableBezierPathSource setSubpaths:](self, "setSubpaths:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  self->mActiveSubpath = (unint64_t)objc_msgSend(v6, "count") - 1;

}

- (CGAffineTransform)pathFlipTransform
{
  __int128 v3;
  objc_super v4;

  if (LOBYTE(self[1].d))
  {
    v3 = *(_OWORD *)&self[2].a;
    *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].tx;
    *(_OWORD *)&retstr->c = v3;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].c;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CRLEditableBezierPathSource;
    return (CGAffineTransform *)-[CGAffineTransform pathFlipTransform](&v4, "pathFlipTransform");
  }
  return self;
}

- (CGSize)naturalSize
{
  void *v2;
  void *v3;
  double v4;
  CGFloat width;
  double v6;
  CGFloat height;
  double v8;
  double v9;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource bezierPathWithoutFlips](self, "bezierPathWithoutFlips"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "bounds");
    width = v4;
    height = v6;
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }

  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  CGAffineTransform v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGAffineTransform v23;
  _BYTE v24[128];

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource nodes](self, "nodes"));
  v7 = objc_msgSend(v6, "count");

  if ((unint64_t)v7 >= 2)
  {
    -[CRLEditableBezierPathSource naturalSize](self, "naturalSize");
    if (v8 <= 0.0)
      v10 = 1.0;
    else
      v10 = width / v8;
    memset(&v23.c, 0, 32);
    if (v9 <= 0.0)
      v11 = 1.0;
    else
      v11 = height / v9;
    *(_OWORD *)&v23.a = 0uLL;
    CGAffineTransformMakeScale(&v23, v10, v11);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v18 = v23;
          objc_msgSend(v17, "transformUsingAffineTransform:", &v18);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v14);
    }

  }
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        v10 = *(_OWORD *)&a3->c;
        v11[0] = *(_OWORD *)&a3->a;
        v11[1] = v10;
        v11[2] = *(_OWORD *)&a3->tx;
        objc_msgSend(v9, "transformUsingAffineTransform:", v11);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)alignToOrigin
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  unsigned int v12;
  double v13;
  double v14;
  float64x2_t v15;
  double v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double MinY;
  double MinX;
  double v25;
  CGAffineTransform v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  _BYTE v33[128];
  CGRect v34;
  CGRect v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPath](self, "bezierPath"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.width = v9;
  v34.size.height = v11;
  MinX = CGRectGetMinX(v34);
  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  MinY = CGRectGetMinY(v35);
  LODWORD(v3) = -[CRLPathSource hasHorizontalFlip](self, "hasHorizontalFlip");
  v12 = -[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v13 = 1.0;
  if ((_DWORD)v3)
    v14 = -1.0;
  else
    v14 = 1.0;
  if (v12)
    v13 = -1.0;
  CGAffineTransformMakeScale(&v32, v14, v13);
  v15 = vaddq_f64(*(float64x2_t *)&v32.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v32.c, MinY), *(float64x2_t *)&v32.a, MinX));
  v16 = v15.f64[1];
  v25 = v15.f64[0];
  if (!sub_10005FDF0(v15.f64[0], v15.f64[1], CGPointZero.x, CGPointZero.y))
  {
    memset(&v31, 0, sizeof(v31));
    CGAffineTransformMakeTranslation(&v31, -v25, -v16);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v21);
          v26 = v31;
          objc_msgSend(v22, "transformUsingAffineTransform:", &v26);
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v19);
    }

  }
}

- (void)addNode:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", self->mActiveSubpath));
  objc_msgSend(v5, "addNode:", v4);

}

- (void)removeLastNode
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", self->mActiveSubpath));
  objc_msgSend(v3, "removeLastNode");

}

- (id)nodePriorToNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", self->mActiveSubpath));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nodePriorToNode:", v4));

  return v7;
}

- (id)nodeAfterNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", self->mActiveSubpath));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nodeAfterNode:", v4));

  return v7;
}

- (CRLBezierNode)firstNode
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", self->mActiveSubpath));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstNode"));

  return (CRLBezierNode *)v5;
}

- (CRLBezierNode)lastNode
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", self->mActiveSubpath));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastNode"));

  return (CRLBezierNode *)v5;
}

- (void)offsetSelectedNodesByDelta:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  y = a3.y;
  x = a3.x;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "offsetSelectedNodesByDelta:", x, y);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)offsetSelectedEdgesByDelta:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  y = a3.y;
  x = a3.x;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "offsetSelectedEdgesByDelta:", x, y);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)hasSelectedNode
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "hasSelectedNode") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)allNodesSelected
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "allNodesSelected"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (void)removeNode:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", self->mActiveSubpath));
  objc_msgSend(v5, "removeNode:", v4);

}

- (BOOL)isCompound
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (BOOL)canDeleteSelectedNodes
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 v10;
  void *v12;
  void *v13;

  v3 = -[CRLEditableBezierPathSource isCompound](self, "isCompound");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v5 = v4;
  if ((v3 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
    v10 = objc_msgSend(v8, "canDeleteSelectedNodes");
LABEL_9:

    v6 = v5;
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectEnumerator"));

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));
  if (v7)
  {
    v8 = (void *)v7;
    while (!objc_msgSend(v8, "hasSelectedNode")
         || objc_msgSend(v8, "canDeleteSelectedNodes"))
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));

      v8 = (void *)v9;
      if (!v9)
        goto LABEL_7;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectEnumerator"));

    do
    {
      v13 = v8;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextObject"));

      v10 = v8 != 0;
    }
    while (v8
         && objc_msgSend(v8, "hasSelectedNode")
         && !objc_msgSend(v8, "canDeleteSelectedNodes"));
    goto LABEL_9;
  }
LABEL_7:
  v10 = 1;
LABEL_10:

  return v10;
}

- (BOOL)deletingSelectedNodesWillDeleteShape
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nodes"));
        if ((unint64_t)objc_msgSend(v8, "count") < 3)
        {

        }
        else
        {
          if (!objc_msgSend(v7, "hasSelectedNode"))
          {

LABEL_15:
            v10 = 0;
            goto LABEL_16;
          }
          v9 = objc_msgSend(v7, "canDeleteSelectedNodes");

          if ((v9 & 1) != 0)
            goto LABEL_15;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_16:

  return v10;
}

- (void)deleteSelectedNodesForced:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "canDeleteSelectedNodes"))
        {
          objc_msgSend(v11, "deleteSelectedNodes");
        }
        else if (a3 || objc_msgSend(v11, "allNodesSelected"))
        {
          if (objc_msgSend(v11, "hasSelectedNode"))
            objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v13 = objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "removeObjectsInArray:", v5);
  -[CRLEditableBezierPathSource setSubpaths:](self, "setSubpaths:", v13);

}

- (void)deleteSelectedNodes
{
  -[CRLEditableBezierPathSource deleteSelectedNodesForced:](self, "deleteSelectedNodesForced:", 0);
}

- (void)selectAllNodes
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "selectAllNodes");

}

- (void)deselectAllNodes
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "deselectAllNodes");

}

- (id)bezierNodeUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6
{
  double y;
  double x;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  _OWORD v19[3];

  y = a3.y;
  x = a3.x;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectEnumerator"));

  v13 = 0;
  while (1)
  {
    v14 = v13;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextObject"));

    if (!v13)
      break;
    v15 = *(_OWORD *)&a4->c;
    v19[0] = *(_OWORD *)&a4->a;
    v19[1] = v15;
    v19[2] = *(_OWORD *)&a4->tx;
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bezierNodeUnderPoint:withTransform:andTolerance:returningType:", v19, a6, x, y, a5));
    if (v16)
    {
      v17 = (void *)v16;
      goto LABEL_6;
    }
  }
  v17 = 0;
LABEL_6:

  return v17;
}

- (double)distanceToPoint:(CGPoint)a3 subpathIndex:(unint64_t *)a4 elementIndex:(unint64_t *)a5 tValue:(double *)a6 threshold:(double)a7
{
  double y;
  double x;
  void *v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v25;
  unint64_t v26;

  y = a3.y;
  x = a3.x;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v14 = objc_msgSend(v13, "count");

  v15 = 0;
  v16 = 0;
  v17 = 1.79769313e308;
  if (v14)
  {
    v18 = 0;
    if (a7 < 1.79769313e308)
    {
      v18 = 0;
      v15 = 0;
      v17 = 1.79769313e308;
      v19 = 1;
      do
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", v19 - 1));

        v25 = 0;
        v26 = 0;
        objc_msgSend(v21, "distanceToPoint:elementIndex:tValue:threshold:", &v26, &v25, x, y, a7);
        if (v22 < v17)
        {
          v15 = v26;
          v16 = v25;
          v18 = v19 - 1;
          v17 = v22;
        }

        if (v19 >= (unint64_t)v14)
          break;
        ++v19;
      }
      while (v17 > a7);
    }
    if (a4)
      goto LABEL_9;
  }
  else
  {
    v18 = 0;
    if (a4)
LABEL_9:
      *a4 = v18;
  }
  if (a5)
    *a5 = v15;
  if (a6)
    *(_QWORD *)a6 = v16;
  return v17;
}

- (CGRect)nodeBounds
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect result;
  CGRect v22;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectEnumerator"));

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      objc_msgSend(v9, "nodeBounds");
      v22.origin.x = v10;
      v22.origin.y = v11;
      v22.size.width = v12;
      v22.size.height = v13;
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v20 = CGRectUnion(v19, v22);
      x = v20.origin.x;
      y = v20.origin.y;
      width = v20.size.width;
      height = v20.size.height;
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));

      v9 = (void *)v14;
    }
    while (v14);
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)toggleNode:(id)a3 toType:(int64_t)a4 prevNode:(id)a5 nextNode:(id)a6
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
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
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  id v59;

  v59 = a3;
  v9 = a5;
  v10 = a6;
  if (objc_msgSend(v59, "type") != (id)a4)
  {
    switch(a4)
    {
      case 1:
        objc_msgSend(v59, "setType:", 1);
        if (objc_msgSend(v10, "type") == (id)1)
        {
          objc_msgSend(v59, "nodePoint");
          objc_msgSend(v59, "setOutControlPoint:");
          objc_msgSend(v10, "nodePoint");
          objc_msgSend(v10, "setInControlPoint:");
        }
        if (objc_msgSend(v9, "type") == (id)1)
        {
          objc_msgSend(v59, "nodePoint");
          objc_msgSend(v59, "setInControlPoint:");
          objc_msgSend(v9, "nodePoint");
          objc_msgSend(v9, "setOutControlPoint:");
        }
        break;
      case 3:
        objc_msgSend(v59, "setType:", 3);
        break;
      case 2:
        objc_msgSend(v59, "nodePoint");
        v12 = v11;
        v14 = v13;
        objc_msgSend(v59, "outControlPoint");
        if (sub_10005FDF0(v12, v14, v15, v16))
        {
          objc_msgSend(v10, "nodePoint");
          v18 = v17;
          v20 = v19;
          objc_msgSend(v10, "inControlPoint");
          if (sub_10005FDF0(v18, v20, v21, v22))
          {
            objc_msgSend(v59, "nodePoint");
            v24 = v23;
            v26 = v25;
            objc_msgSend(v10, "nodePoint");
            objc_msgSend(v59, "setOutControlPoint:", sub_100061A8C(v24, v26, v27, v28, 0.333333333));
            objc_msgSend(v59, "nodePoint");
            v30 = v29;
            v32 = v31;
            objc_msgSend(v10, "nodePoint");
            objc_msgSend(v10, "setInControlPoint:", sub_100061A8C(v30, v32, v33, v34, 0.666666667));
          }
        }
        objc_msgSend(v59, "nodePoint");
        v36 = v35;
        v38 = v37;
        objc_msgSend(v59, "inControlPoint");
        if (sub_10005FDF0(v36, v38, v39, v40))
        {
          objc_msgSend(v9, "nodePoint");
          v42 = v41;
          v44 = v43;
          objc_msgSend(v9, "outControlPoint");
          if (sub_10005FDF0(v42, v44, v45, v46))
          {
            objc_msgSend(v59, "nodePoint");
            v48 = v47;
            v50 = v49;
            objc_msgSend(v9, "nodePoint");
            objc_msgSend(v59, "setInControlPoint:", sub_100061A8C(v48, v50, v51, v52, 0.333333333));
            objc_msgSend(v59, "nodePoint");
            v54 = v53;
            v56 = v55;
            objc_msgSend(v9, "nodePoint");
            objc_msgSend(v9, "setOutControlPoint:", sub_100061A8C(v54, v56, v57, v58, 0.666666667));
          }
        }
        objc_msgSend(v59, "setType:", 2);
        objc_msgSend(v59, "updateReflectedState");
        break;
    }
  }

}

- (void)toggleSelectedNodesToType:(int64_t)a3
{
  void *i;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  char *v9;
  unint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  void *v15;
  id v16;
  id obj;
  uint64_t v18;
  id v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nodes"));
        if (objc_msgSend(v5, "count"))
        {
          v6 = objc_msgSend(v4, "isClosed");
          if (v6)
            v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
          else
            v7 = 0;
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
          v9 = (char *)objc_msgSend(v5, "count");
          if (v9)
          {
            v10 = (unint64_t)v9;
            v11 = 0;
            v12 = v9 - 1;
            do
            {
              v13 = v11 + 1;
              if ((((unint64_t)(v11 + 1) >= v10) & ~v6) != 0)
              {
                v15 = 0;
              }
              else
              {
                if (v12 == v11)
                  v14 = 0;
                else
                  v14 = v11 + 1;
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v14));
              }
              if (objc_msgSend(v8, "isSelected"))
                -[CRLEditableBezierPathSource toggleNode:toType:prevNode:nextNode:](self, "toggleNode:toType:prevNode:nextNode:", v8, a3, v7, v15);
              v16 = v8;

              v11 = v13;
              v8 = v15;
              v7 = v16;
            }
            while ((char *)v10 != v13);
          }
          else
          {
            v16 = v7;
            v15 = v8;
          }

        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v19);
  }

}

- (void)sharpenAllNodes
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "sharpenAllNodes");

}

- (void)smoothNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectEnumerator"));

  v6 = 0;
  while (1)
  {
    v7 = v6;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextObject"));

    if (!v6)
      break;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nodes"));
    v9 = objc_msgSend(v8, "containsObject:", v10);

    if (v9)
    {
      objc_msgSend(v6, "smoothNode:", v10);
      break;
    }
  }

}

- (void)smoothAllNodes
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "smoothAllNodes");

}

- (BOOL)isClosed
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nodes"));
        if (objc_msgSend(v7, "count"))
        {
          v8 = objc_msgSend(v6, "isClosed");

          if ((v8 & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)isOpen
{
  return !-[CRLEditableBezierPathSource isClosed](self, "isClosed");
}

- (void)setClosed:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setClosed:", v3);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)selectSubpathForNode:(id)a3 toggle:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;

  v4 = a4;
  v12 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectEnumerator"));

  v8 = 0;
  while (1)
  {
    v9 = v8;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));

    if (!v8)
      break;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nodes"));
    v11 = objc_msgSend(v10, "containsObject:", v12);

    if (v11)
    {
      if (v4 && objc_msgSend(v8, "allNodesSelected"))
        objc_msgSend(v8, "deselectAllNodes");
      else
        objc_msgSend(v8, "selectAllNodes");
      break;
    }
  }

}

- (id)subpathsForConnectingUsingFirstSubpathFirstNode:(BOOL *)a3 andSecondPathFirstNode:(BOOL *)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  BOOL *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _BYTE v29[128];

  *a3 = 0;
  *a4 = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (!v7)
  {
    v9 = 0;
LABEL_18:
    v21 = 0;
LABEL_22:

    goto LABEL_24;
  }
  v8 = v7;
  v23 = a4;
  v9 = 0;
  v10 = *(_QWORD *)v25;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v25 != v10)
      objc_enumerationMutation(v6);
    v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
    if ((objc_msgSend(v12, "isClosed") & 1) != 0)
      goto LABEL_14;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nodes"));
    v14 = objc_msgSend(v13, "count");

    if (!v14)
      goto LABEL_14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstNode"));
    v16 = objc_msgSend(v15, "isSelected");

    if (v16)
      break;
LABEL_11:
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastNode"));
    v19 = objc_msgSend(v18, "isSelected");

    if (v19)
    {
      v20 = v12;
      if (v9)
        goto LABEL_20;
      v9 = v20;
    }
LABEL_14:
    if (v8 == (id)++v11)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v8)
        goto LABEL_3;
      goto LABEL_18;
    }
  }
  v17 = v12;
  if (!v9)
  {
    *a3 = 1;
    v9 = v17;
    goto LABEL_11;
  }
  *v23 = 1;
LABEL_20:

  if (v12)
  {
    v28[0] = v9;
    v28[1] = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2));
    v6 = v12;
    goto LABEL_22;
  }
  v21 = 0;
LABEL_24:

  return v21;
}

- (BOOL)canConnectSelectedNodes
{
  void *v2;
  BOOL v3;
  __int16 v5;

  v5 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpathsForConnectingUsingFirstSubpathFirstNode:andSecondPathFirstNode:](self, "subpathsForConnectingUsingFirstSubpathFirstNode:andSecondPathFirstNode:", (char *)&v5 + 1, &v5));
  v3 = v2 != 0;

  return v3;
}

- (void)connectSelectedNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int16 v18;

  v18 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpathsForConnectingUsingFirstSubpathFirstNode:andSecondPathFirstNode:](self, "subpathsForConnectingUsingFirstSubpathFirstNode:andSecondPathFirstNode:", (char *)&v18 + 1, &v18));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 1));
    if (v5 == v6)
    {
      if (HIBYTE(v18) != v18)
        objc_msgSend(v5, "setClosed:", 1);
      goto LABEL_16;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
    v8 = objc_msgSend(v7, "mutableCopy");

    if (HIBYTE(v18) || !(_BYTE)v18)
    {
      if (HIBYTE(v18) && !(_BYTE)v18)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nodes"));
        v10 = objc_msgSend(v9, "mutableCopy");

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodes"));
        objc_msgSend(v10, "addObjectsFromArray:", v11);

        objc_msgSend(v6, "setNodes:", v10);
        v12 = v5;
LABEL_14:
        objc_msgSend(v8, "removeObjectIdenticalTo:", v12);

LABEL_15:
        -[CRLEditableBezierPathSource setSubpaths:](self, "setSubpaths:", v8);

LABEL_16:
        goto LABEL_17;
      }
      if (HIBYTE(v18) | v18)
      {
        if (!HIBYTE(v18) || !(_BYTE)v18)
          goto LABEL_15;
        objc_msgSend(v6, "reverseDirection");
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodes"));
        v10 = objc_msgSend(v15, "mutableCopy");

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nodes"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nodes"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, objc_msgSend(v16, "count")));
        objc_msgSend(v10, "insertObjects:atIndexes:", v14, v17);

        goto LABEL_13;
      }
      objc_msgSend(v6, "reverseDirection");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodes"));
    v10 = objc_msgSend(v13, "mutableCopy");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nodes"));
    objc_msgSend(v10, "addObjectsFromArray:", v14);
LABEL_13:

    objc_msgSend(v5, "setNodes:", v10);
    v12 = v6;
    goto LABEL_14;
  }
LABEL_17:

}

- (BOOL)canCloseSelectedNodes
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isClosed") & 1) == 0)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nodes"));
          v8 = objc_msgSend(v7, "count");

          if (v8)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstNode"));
            if (objc_msgSend(v9, "isSelected"))
            {

LABEL_14:
              LOBYTE(v3) = 1;
              goto LABEL_15;
            }
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastNode"));
            v11 = objc_msgSend(v10, "isSelected");

            if ((v11 & 1) != 0)
              goto LABEL_14;
          }
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_15:

  return (char)v3;
}

- (void)closeSelectedNodes
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "isClosed") & 1) == 0)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nodes"));
          v9 = objc_msgSend(v8, "count");

          if (v9)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstNode"));
            if (objc_msgSend(v10, "isSelected"))
            {

            }
            else
            {
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastNode"));
              v12 = objc_msgSend(v11, "isSelected");

              if (!v12)
                continue;
            }
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstNode"));
            v14 = objc_msgSend(v13, "type");

            if (v14 == (id)3)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstNode"));
              objc_msgSend(v15, "setType:", 1);

            }
            objc_msgSend(v7, "setClosed:", 1);
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

- (void)deleteSelectedEdges
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  char v11;
  CRLBezierSubpath *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  CRLBezierSubpath *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unsigned int v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  CRLBezierSubpath *v35;
  uint64_t v36;
  id v38;
  void *v39;
  void *v40;
  id v41;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v38 = objc_msgSend(v2, "copy");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectEnumerator"));
  v41 = objc_alloc_init((Class)NSMutableArray);
  v39 = v3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextObject"));
  if (!v4)
    goto LABEL_33;
  v5 = (void *)v4;
  do
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodes"));
    v7 = objc_msgSend(v6, "mutableCopy");

    v8 = (uint64_t)objc_msgSend(v7, "count");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v10 = objc_msgSend(v9, "isSelected");

    if (v10)
      objc_msgSend(v5, "setClosed:", 0);
    if (v8 < 1)
    {
      v12 = 0;
      v15 = 0;
LABEL_29:
      objc_msgSend(v41, "addObject:", v5);
      goto LABEL_32;
    }
    v40 = v5;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    do
    {
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v14));

      if (v16 && objc_msgSend(v16, "isSelected"))
      {
        if (v14 - v13 < 2)
        {
LABEL_16:
          v11 = 1;
          v13 = v14;
          goto LABEL_17;
        }
        v18 = objc_alloc_init(CRLBezierSubpath);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v13, v14 - v13));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectsAtIndexes:", v19));
        -[CRLBezierSubpath setNodes:](v18, "setNodes:", v20);

        objc_msgSend(v41, "addObject:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](v18, "nodes"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastObject"));

        objc_msgSend(v22, "nodePoint");
        objc_msgSend(v22, "setOutControlPoint:");
        if (v12 || (objc_msgSend(v40, "isClosed") & 1) == 0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](v18, "nodes"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", 0));

          objc_msgSend(v23, "nodePoint");
          objc_msgSend(v23, "setInControlPoint:");
          if (v12)
          {
LABEL_15:

            goto LABEL_16;
          }
        }
        else
        {
          v23 = v22;
        }
        v12 = v18;
        goto LABEL_15;
      }
LABEL_17:
      v15 = v17;

      ++v14;
    }
    while (v8 != v14);
    if ((v11 & 1) == 0)
    {
      v5 = v40;
      goto LABEL_29;
    }
    v25 = v8 - v13;
    v5 = v40;
    if (v8 - v13 > 1 || (v26 = objc_msgSend(v40, "isClosed"), v25 == 1) && v26)
    {
      v27 = objc_alloc_init((Class)NSMutableArray);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v13, v25));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectsAtIndexes:", v28));
      objc_msgSend(v27, "addObjectsFromArray:", v29);

      if (objc_msgSend(v40, "isClosed"))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](v12, "nodes"));
        v31 = objc_msgSend(v30, "count");

        if (v31)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](v12, "nodes"));
          objc_msgSend(v27, "addObjectsFromArray:", v32);

        }
        if (v12)
          objc_msgSend(v41, "removeObjectIdenticalTo:", v12);
      }
      else
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndex:", 0));
        objc_msgSend(v33, "nodePoint");
        objc_msgSend(v33, "setInControlPoint:");
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastObject"));

        objc_msgSend(v34, "nodePoint");
        objc_msgSend(v34, "setOutControlPoint:");

      }
      v35 = objc_alloc_init(CRLBezierSubpath);
      -[CRLBezierSubpath setNodes:](v35, "setNodes:", v27);
      objc_msgSend(v41, "addObject:", v35);

    }
LABEL_32:

    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "nextObject"));
    v5 = (void *)v36;
  }
  while (v36);
LABEL_33:
  -[CRLEditableBezierPathSource setSubpaths:](self, "setSubpaths:", v41);

}

- (id)splitEdge:(int64_t)a3 at:(double)a4 fromSubpath:(int64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  float64_t v33;
  float64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  float64x2_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[16];
  double v52;
  double v53;
  double v54;
  double v55;
  double v56[8];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", a5));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nodes"));
  v11 = v10;
  if (a3 <= 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", 0));
    a3 = (int64_t)objc_msgSend(v11, "count");
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", a3 - 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", a3));
  }
  objc_msgSend(v13, "nodePoint");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v13, "inControlPoint");
  if (sub_10005FDF0(v15, v17, v18, v19)
    && (objc_msgSend(v12, "nodePoint"),
        v21 = v20,
        v23 = v22,
        objc_msgSend(v12, "outControlPoint"),
        sub_10005FDF0(v21, v23, v24, v25)))
  {
    objc_msgSend(v12, "nodePoint");
    v27 = v26;
    v29 = v28;
    objc_msgSend(v13, "nodePoint");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:", (1.0 - a4) * v27 + a4 * v30, (1.0 - a4) * v29 + a4 * v31));
  }
  else
  {
    objc_msgSend(v12, "nodePoint");
    v44.f64[0] = v33;
    v44.f64[1] = v34;
    objc_msgSend(v12, "outControlPoint");
    v45 = v35;
    v46 = v36;
    objc_msgSend(v13, "inControlPoint");
    v47 = v37;
    v48 = v38;
    objc_msgSend(v13, "nodePoint");
    v49 = v39;
    v50 = v40;
    sub_100313400(&v44, (uint64_t)v51, 0.0, a4);
    sub_100313400(&v44, (uint64_t)v56, a4, 1.0);
    objc_msgSend(v12, "setOutControlPoint:", v52, v53);
    objc_msgSend(v13, "setInControlPoint:", v56[4], v56[5]);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](CRLBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v56[0], v56[1], v54, v55, v56[2], v56[3]));
  }
  v41 = v32;
  objc_msgSend(v32, "setSelected:", 1);
  v42 = objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v42, "insertObject:atIndex:", v41, a3);
  objc_msgSend(v9, "setNodes:", v42);

  return v41;
}

- (void)splitSelectedEdges
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t j;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v4 = (uint64_t)objc_msgSend(v3, "count");

  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", i));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nodes"));

      v9 = (uint64_t)objc_msgSend(v8, "count");
      if (v9 >= 1)
      {
        v10 = v9;
        v11 = 0;
        for (j = 0; j < v10; ++j)
        {
          v13 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", j));

          if (v13)
          {
            if (objc_msgSend(v13, "isSelected"))
            {
              v15 = -[CRLEditableBezierPathSource splitEdge:at:fromSubpath:](self, "splitEdge:at:fromSubpath:", j++, i, 0.5);
              ++v10;
            }
          }
          v11 = v14;

        }
      }

    }
  }
}

- (void)splitSelectedNodes
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  id v8;
  char *v9;
  char *v10;
  void *v11;
  unint64_t j;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nodes"));
        v8 = objc_msgSend(v7, "mutableCopy");

        v9 = (char *)objc_msgSend(v8, "count");
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          for (j = 0; j < (unint64_t)v10; ++j)
          {
            v13 = v11;
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", j));

            if (objc_msgSend(v11, "isSelected"))
            {
              objc_msgSend(v11, "nodePoint");
              v15 = v14;
              v17 = v16;
              objc_msgSend(v11, "nodePoint");
              v19 = v18;
              v21 = v20;
              objc_msgSend(v11, "outControlPoint");
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](CRLBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v15, v17, v19, v21, v22, v23));
              objc_msgSend(v24, "setSelected:", 0);
              objc_msgSend(v11, "nodePoint");
              objc_msgSend(v11, "setOutControlPoint:");
              objc_msgSend(v8, "insertObject:atIndex:", v24, ++j);
              ++v10;

            }
          }

        }
        objc_msgSend(v6, "setNodes:", v8);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v3);
  }

}

- (BOOL)canCutAtSelectedNodes
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  unsigned int v9;
  char *v10;
  unint64_t v11;
  char *v12;
  void *v13;
  unsigned int v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nodes"));
        v9 = objc_msgSend(v7, "isClosed");
        v10 = (char *)objc_msgSend(v8, "count");
        if (v10)
        {
          v11 = v9 ^ 1;
          v12 = &v10[-(objc_msgSend(v7, "isClosed") ^ 1)];
          if ((unint64_t)v12 > v11)
          {
            while (1)
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v11));
              v14 = objc_msgSend(v13, "isSelected");

              if (v14)
                break;
              if (v12 == (char *)++v11)
                goto LABEL_10;
            }

            v15 = 1;
            goto LABEL_15;
          }
        }
LABEL_10:

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v15 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_15:

  return v15;
}

- (void)cutAtSelectedNodes
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char *v11;
  char *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  char *v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  CRLBezierSubpath *v26;
  void *v27;
  void *v28;
  CRLEditableBezierPathSource *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v33 = objc_alloc_init((Class)NSMutableArray);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v29 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v35;
    v30 = v3;
    v31 = *(_QWORD *)v35;
    do
    {
      v7 = 0;
      v32 = v5;
      do
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nodes"));
        v10 = objc_msgSend(v9, "mutableCopy");

        if (objc_msgSend(v10, "count"))
        {
          if (objc_msgSend(v8, "isClosed"))
          {
            v11 = (char *)objc_msgSend(v10, "count");
            if (v11)
            {
              v12 = v11 - 1;
              while (1)
              {
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v12));
                if (objc_msgSend(v13, "isSelected"))
                  break;

                if (--v12 == (char *)-1)
                {
                  v6 = v31;
                  v5 = v32;
                  goto LABEL_16;
                }
              }
              objc_msgSend(v13, "setSelected:", 0);
              if (v12)
              {
                v14 = objc_alloc_init((Class)NSMutableArray);
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", v12, (_BYTE *)objc_msgSend(v10, "count") - v12));
                objc_msgSend(v14, "addObjectsFromArray:", v15);

                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", 0, v12));
                objc_msgSend(v14, "addObjectsFromArray:", v16);

                objc_msgSend(v8, "setNodes:", v14);
                v10 = v14;
              }
              v6 = v31;
              v5 = v32;
              v17 = objc_msgSend(v13, "copy");
              objc_msgSend(v10, "addObject:", v17);
              objc_msgSend(v8, "setClosed:", 0);
              objc_msgSend(v8, "setNodes:", v10);

            }
          }
LABEL_16:
          if ((objc_msgSend(v8, "isClosed") & 1) == 0)
          {
            v18 = (char *)objc_msgSend(v10, "count");
            v19 = v18 - 1;
            if ((unint64_t)(v18 - 1) >= 2)
            {
              v20 = 1 - (_QWORD)v18;
              do
              {
                v21 = (unint64_t)(v19 - 1);
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v19 - 1));
                if (objc_msgSend(v22, "isSelected"))
                {
                  objc_msgSend(v22, "setSelected:", 0);
                  v23 = objc_msgSend(v22, "copy");
                  v24 = objc_alloc_init((Class)NSMutableArray);
                  objc_msgSend(v24, "addObject:", v23);
                  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", v19, (char *)objc_msgSend(v10, "count") + v20));
                  objc_msgSend(v24, "addObjectsFromArray:", v25);

                  v26 = objc_alloc_init(CRLBezierSubpath);
                  -[CRLBezierSubpath setNodes:](v26, "setNodes:", v24);
                  objc_msgSend(v10, "removeObjectsInRange:", v19, (char *)objc_msgSend(v10, "count") + v20);
                  objc_msgSend(v8, "setNodes:", v10);
                  objc_msgSend(v33, "addObject:", v26);

                }
                ++v20;
                --v19;
              }
              while (v21 > 1);
              v3 = v30;
              v6 = v31;
              v5 = v32;
            }
          }
        }

        v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v5);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](v29, "subpaths"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "arrayByAddingObjectsFromArray:", v33));
  -[CRLEditableBezierPathSource setSubpaths:](v29, "setSubpaths:", v28);

}

- (CGPath)subpathForSelection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  CGPath *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectEnumerator"));

  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextObject"));
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      objc_msgSend(v7, "appendToBezierPath:selectedNodesOnly:fromIndex:", v3, 1, 0);
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextObject"));

      v7 = (void *)v8;
    }
    while (v8);
  }
  v9 = objc_retainAutorelease(v3);
  v10 = (CGPath *)objc_msgSend(v9, "CGPath");

  return v10;
}

- (NSArray)nodeTypes
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v7);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nodes"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v18;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v18 != v12)
                objc_enumerationMutation(v9);
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithChar:](NSNumber, "numberWithChar:", (char)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13), "type")));
              objc_msgSend(v3, "addObject:", v14);

              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v11);
        }

        v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (void)setNodeTypes:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v18 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v8);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nodes"));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", (char *)v14 + v7));
              objc_msgSend(v15, "setType:", (int)objc_msgSend(v16, "intValue"));

              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            v7 += (uint64_t)v14;
          }
          while (v12);
        }

        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

}

- (void)moveToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  CRLBezierSubpath *v12;
  void *v13;
  void *v14;
  id v15;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nodes"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nodes"));
    v10 = objc_msgSend(v9, "count");

    if (v10 == (id)1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nodes"));
      v12 = (CRLBezierSubpath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));

      -[CRLBezierSubpath setNodePoint:](v12, "setNodePoint:", x, y);
    }
    else
    {
      v12 = objc_alloc_init(CRLBezierSubpath);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayByAddingObject:", v12));
      -[CRLEditableBezierPathSource setSubpaths:](self, "setSubpaths:", v14);

    }
  }
  else
  {
    v12 = (CRLBezierSubpath *)objc_claimAutoreleasedReturnValue(+[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:", x, y));
    objc_msgSend(v15, "addNode:", v12);
  }

}

- (void)lineToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nodes"));
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D5F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E00EB0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D618);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditableBezierPathSource lineToPoint:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 2047, 0, "cannot add line to subpath without move first");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:", x, y));
  objc_msgSend(v6, "addNode:", v12);

}

- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nodes"));
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D638);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E00F30();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D658);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditableBezierPathSource curveToPoint:controlPoint1:controlPoint2:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 2054, 0, "cannot add line to subpath without move first");

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nodes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));

  objc_msgSend(v19, "setOutControlPoint:", v8, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](CRLBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v10, v9, x, y, v10, v9));
  objc_msgSend(v12, "addNode:", v20);

}

- (void)smoothCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CRLEditableBezierPathSource curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", a3.x, a3.y, a4.x, a4.y, a5.x, a5.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nodes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));

  objc_msgSend(v8, "setType:", 3);
}

- (void)closePath
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nodes"));
  v5 = objc_msgSend(v4, "count");

  if ((unint64_t)v5 <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D678);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E00FB0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D698);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLEditableBezierPathSource closePath]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 2073, 0, "cannot close subpath without a line or curve segment");

  }
  objc_msgSend(v3, "setClosed:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nodes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nodes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));

  objc_msgSend(v10, "nodePoint");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "nodePoint");
  if (sub_10005FDF0(v14, v16, v17, v18))
  {
    objc_msgSend(v12, "inControlPoint");
    objc_msgSend(v10, "setInControlPoint:");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nodes"));
    v20 = objc_msgSend(v19, "mutableCopy");

    objc_msgSend(v20, "removeLastObject");
  }

}

- (id)inferredAccessibilityDescriptionNoShapeNames
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource userDefinedName](self, "userDefinedName"));
  if (!objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPath](self, "bezierPath"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "inferredAccessibilityDescription"));

    v3 = (void *)v5;
  }
  return v3;
}

- (id)inferredAccessibilityDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource bezierPath](self, "bezierPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "inferredAccessibilityDescription"));

  return v3;
}

- (NSUUID)persistedUUID
{
  return self->mPersistedUUID;
}

- (void)setPersistedUUID:(id)a3
{
  objc_storeStrong((id *)&self->mPersistedUUID, a3);
}

- (NSArray)subpaths
{
  return self->mSubpaths;
}

- (void)setSubpaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)activeSubpath
{
  return self->mActiveSubpath;
}

- (void)setActiveSubpath:(unint64_t)a3
{
  self->mActiveSubpath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPersistedUUID, 0);
  objc_storeStrong((id *)&self->mSubpaths, 0);
}

- (void)morphWithMorphInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  -[CRLEditableBezierPathSource updateSmoothNodes](self, "updateSmoothNodes");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "morphWithMorphInfo:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)updateSmoothNodes
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "updateSmoothNodes");

}

- (void)addTemporarySmoothNodes
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self, "subpaths"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "addTemporarySmoothNodes");

}

@end
