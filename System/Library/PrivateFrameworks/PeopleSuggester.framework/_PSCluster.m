@implementation _PSCluster

- (_PSCluster)init
{
  _PSCluster *v2;
  uint64_t v3;
  NSMutableArray *points;
  uint64_t v5;
  NSMutableArray *convexHull;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PSCluster;
  v2 = -[_PSCluster init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    points = v2->_points;
    v2->_points = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    convexHull = v2->_convexHull;
    v2->_convexHull = (NSMutableArray *)v5;

  }
  return v2;
}

- (_PSCluster)initWithPoints:(id)a3 andHull:(id)a4
{
  id v7;
  id v8;
  _PSCluster *v9;
  _PSCluster *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSCluster;
  v9 = -[_PSCluster init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_points, a3);
    objc_storeStrong((id *)&v10->_convexHull, a4);
  }

  return v10;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[_PSCluster points](self, "points");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)pointAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[_PSCluster points](self, "points");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addPointToCluster:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_PSCluster points](self, "points");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if ((v5 & 1) == 0)
  {
    -[_PSCluster points](self, "points");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (void)clearCluster
{
  id v2;

  -[_PSCluster points](self, "points");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (BOOL)containsPoint:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[_PSCluster points](self, "points");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (int)orientationOfPoints:(id)a3 and:(id)a4 and:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
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

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "x");
  v11 = v10;
  objc_msgSend(v8, "x");
  v13 = v11 - v12;
  objc_msgSend(v8, "y");
  v15 = v14;
  objc_msgSend(v9, "y");
  v17 = v15 - v16;
  objc_msgSend(v8, "x");
  v19 = v18;
  objc_msgSend(v9, "x");
  v21 = v20;

  v22 = v19 - v21;
  objc_msgSend(v7, "y");
  v24 = v23;

  objc_msgSend(v8, "y");
  v26 = v25;

  v27 = v13 * v17 - v22 * (v24 - v26);
  if (v27 > 0.0)
    return 1;
  else
    return 2 * (v27 < 0.0);
}

- (int64_t)compareByAnglePoint:(id)a3 andPoint:(id)a4 withRef:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  int64_t v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[_PSCluster orientationOfPoints:and:and:](self, "orientationOfPoints:and:and:", v10, v8, v9);
  if (v11)
  {
    v12 = v11 == 2;
  }
  else
  {
    objc_msgSend(v10, "euclideanDistanceToPoint:", v9);
    v14 = v13;
    objc_msgSend(v10, "euclideanDistanceToPoint:", v8);
    v12 = v14 - v15 > -2.22044605e-16;
  }
  if (v12)
    v16 = -1;
  else
    v16 = 1;

  return v16;
}

- (void)sortArray:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v9 = a3;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v5, "removeObjectAtIndex:", 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __24___PSCluster_sortArray___block_invoke;
  v10[3] = &unk_1E4400868;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "sortUsingComparator:", v10);
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:atIndexedSubscript:", v8, ++v7);

    }
    while (v7 < objc_msgSend(v5, "count"));
  }

}

- (void)computeConvexHull
{
  _PSCluster *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v66;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  _PSCluster *v70;

  v2 = self;
  -[_PSCluster convexHull](self, "convexHull");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[_PSCluster convexHull](v2, "convexHull");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

  }
  -[_PSCluster points](v2, "points");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 3)
  {
    -[_PSCluster points](v2, "points");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v70 = v2;
    if (v9)
    {
      v68 = 0;
      v10 = 0;
      v11 = 1.79769313e308;
      while (1)
      {
        -[_PSCluster points](v2, "points");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "y");
        if (v11 - v14 > 2.22044605e-16)
        {

        }
        else
        {
          -[_PSCluster points](v2, "points");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "y");
          if (vabdd_f64(v17, v11) >= 2.22044605e-16)
          {

            goto LABEL_13;
          }
          -[_PSCluster points](v2, "points");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", v68);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "x");
          v21 = v20;
          -[_PSCluster points](v70, "points");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndexedSubscript:", v10);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "x");
          v25 = v21 - v24;

          v2 = v70;
          if (v25 <= 2.22044605e-16)
            goto LABEL_14;
        }
        -[_PSCluster points](v2, "points");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "y");
        v11 = v26;
        v68 = v10;
LABEL_13:

LABEL_14:
        ++v10;
        -[_PSCluster points](v2, "points");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

        if (v10 >= v28)
          goto LABEL_17;
      }
    }
    v68 = 0;
LABEL_17:
    -[_PSCluster points](v2, "points");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "exchangeObjectAtIndex:withObjectAtIndex:", 0, v68);

    -[_PSCluster points](v2, "points");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSCluster sortArray:](v2, "sortArray:", v30);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v66 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObject:", v31);

    -[_PSCluster points](v2, "points");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33 >= 2)
    {
      v34 = 1;
      v35 = 1;
      do
      {
        v67 = v35;
        -[_PSCluster points](v2, "points");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34 >= objc_msgSend(v36, "count") - 1)
        {
LABEL_22:

          v41 = v34 + 1;
        }
        else
        {
          while (1)
          {
            -[_PSCluster points](v2, "points");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "objectAtIndexedSubscript:", 0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSCluster points](v2, "points");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectAtIndexedSubscript:", v34);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSCluster points](v2, "points");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v34 + 1;
            objc_msgSend(v40, "objectAtIndexedSubscript:", v34 + 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = -[_PSCluster orientationOfPoints:and:and:](v2, "orientationOfPoints:and:and:", v37, v39, v42);

            if (v43)
              break;
            -[_PSCluster points](v2, "points");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            ++v34;
            if (v41 >= objc_msgSend(v36, "count") - 1)
              goto LABEL_22;
          }
        }
        -[_PSCluster points](v2, "points");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "exchangeObjectAtIndex:withObjectAtIndex:", v67, v34);

        v35 = v67 + 1;
        -[_PSCluster points](v2, "points");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "count");

        v34 = v41;
      }
      while (v41 < v46);
      if (v35 >= 3)
      {
        for (i = 0; i != 3; ++i)
        {
          -[_PSCluster convexHull](v2, "convexHull");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSCluster points](v2, "points");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectAtIndexedSubscript:", i);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addObject:", v50);

        }
        if (v35 >= 4)
        {
          v51 = 3;
          do
          {
            while (1)
            {
              -[_PSCluster convexHull](v2, "convexHull");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              -[_PSCluster convexHull](v2, "convexHull");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "objectAtIndexedSubscript:", objc_msgSend(v53, "count") - 2);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              -[_PSCluster convexHull](v2, "convexHull");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[_PSCluster convexHull](v2, "convexHull");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "objectAtIndexedSubscript:", objc_msgSend(v56, "count") - 1);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              -[_PSCluster points](v2, "points");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "objectAtIndexedSubscript:", v51);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = -[_PSCluster orientationOfPoints:and:and:](v70, "orientationOfPoints:and:and:", v54, v57, v59);

              v2 = v70;
              -[_PSCluster convexHull](v70, "convexHull");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = v61;
              if (v60 == 2)
                break;
              objc_msgSend(v61, "removeLastObject");

            }
            -[_PSCluster points](v70, "points");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "objectAtIndexedSubscript:", v51);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "addObject:", v64);

          }
          while (v51++ != v67);
        }
      }
    }

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_PSCluster points](self, "points");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_points);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[_PSCluster convexHull](self, "convexHull");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_convexHull);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (_PSCluster)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _PSCluster *v16;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_points);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_convexHull);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[_PSCluster initWithPoints:andHull:](self, "initWithPoints:andHull:", v13, v15);
  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _PSCluster *v37;
  id obj;
  id obja;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[_PSCluster points](self, "points");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[_PSCluster convexHull](self, "convexHull");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Points, convex hulls:<%@ %@>"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v37 = self;
  -[_PSCluster points](self, "points");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v45;
    do
    {
      v14 = 0;
      v15 = v10;
      do
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v14);
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v16, "x");
        objc_msgSend(v18, "numberWithDouble:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v16, "y");
        objc_msgSend(v20, "numberWithDouble:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@ %@>"), v19, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingString:", v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v10;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v12);
  }

  objc_msgSend(v10, "stringByAppendingString:", CFSTR(","));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[_PSCluster convexHull](v37, "convexHull");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    do
    {
      v27 = 0;
      v28 = v23;
      do
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(obja);
        v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v27);
        v30 = (void *)MEMORY[0x1E0CB3940];
        v31 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v29, "x");
        objc_msgSend(v31, "numberWithDouble:");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v29, "y");
        objc_msgSend(v33, "numberWithDouble:");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("<%@ %@>"), v32, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringByAppendingString:", v35);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        ++v27;
        v28 = v23;
      }
      while (v25 != v27);
      v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v25);
  }

  return v23;
}

- (NSMutableArray)points
{
  return self->_points;
}

- (void)setPoints:(id)a3
{
  objc_storeStrong((id *)&self->_points, a3);
}

- (NSMutableArray)convexHull
{
  return self->_convexHull;
}

- (void)setConvexHull:(id)a3
{
  objc_storeStrong((id *)&self->_convexHull, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convexHull, 0);
  objc_storeStrong((id *)&self->_points, 0);
}

@end
