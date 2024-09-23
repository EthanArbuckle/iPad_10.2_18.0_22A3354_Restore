@implementation UIInterpolatedColorArray

+ (id)valueWithCGColors:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  UIInterpolatedColorArray *v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIInterpolatedColor valueWithCGColor:](UIInterpolatedColor, "valueWithCGColor:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }
  v8 = -[UIInterpolatedColorArray initWithColors:]([UIInterpolatedColorArray alloc], "initWithColors:", v4);

  return v8;
}

- (UIInterpolatedColorArray)initWithColors:(id)a3
{
  id v5;
  UIInterpolatedColorArray *v6;
  UIInterpolatedColorArray *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIInterpolatedColorArray;
  v6 = -[UIInterpolatedColorArray init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_colors, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIInterpolatedColorArray *v4;
  void *v5;
  UIInterpolatedColorArray *v6;

  v4 = +[UIInterpolatedColorArray allocWithZone:](UIInterpolatedColorArray, "allocWithZone:", a3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", self->_colors, 1);
  v6 = -[UIInterpolatedColorArray initWithColors:](v4, "initWithColors:", v5);

  return v6;
}

- (void)reinitWithVector:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t i;
  NSMutableArray *colors;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id *v15;

  v15 = (id *)a3;
  v5 = -[NSMutableArray count](self->_colors, "count");
  if (v5 > objc_msgSend(v15[1], "count"))
    -[NSMutableArray removeObjectsInRange:](self->_colors, "removeObjectsInRange:", objc_msgSend(v15[1], "count"), -[NSMutableArray count](self->_colors, "count") - objc_msgSend(v15[1], "count"));
  if (-[NSMutableArray count](self->_colors, "count"))
  {
    v6 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15[1], "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reinitWithVector:", v8);

      ++v6;
    }
    while (v6 < -[NSMutableArray count](self->_colors, "count"));
  }
  for (i = -[NSMutableArray count](self->_colors, "count"); i < objc_msgSend(v15[1], "count"); ++i)
  {
    colors = self->_colors;
    objc_msgSend(v15[1], "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[NSMutableArray addObject:](colors, "addObject:", v12);

  }
  v13 = -[NSMutableArray count](self->_colors, "count");
  if (v13 != objc_msgSend(v15[1], "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInterpolatedColorArray.m"), 46, CFSTR("Arrays should be the same length (%lu != %lu)"), -[NSMutableArray count](self->_colors, "count"), objc_msgSend(v15[1], "count"));

  }
}

- (id)interpolateTo:(id)a3 progress:(double)a4
{
  id *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (id *)a3;
  v7 = -[NSMutableArray count](self->_colors, "count");
  if (v7 == objc_msgSend(v6[1], "count"))
  {
    if (-[NSMutableArray count](self->_colors, "count"))
    {
      v8 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6[1], "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (id)objc_msgSend(v9, "interpolateTo:progress:", v10, a4);

        ++v8;
      }
      while (v8 < -[NSMutableArray count](self->_colors, "count"));
    }
  }
  else
  {
    -[UIInterpolatedColorArray reinitWithVector:](self, "reinitWithVector:", v6);
  }

  return self;
}

- (void)integrateWithVelocity:(id)a3 target:(id)a4 intermediateTarget:(id)a5 intermediateTargetVelocity:(id)a6 parameters:(id *)a7 state:(id *)a8 delta:(double)a9
{
  id *v16;
  id *v17;
  id *v18;
  id *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  id *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  $F24F406B2B787EFB06265DBA3D28CBD5 var1;
  id *v36;
  UIInterpolatedColorArray *v37;
  $22447E269F592A6BAB60C6B6905FC588 *v38;
  _OWORD v39[3];
  _OWORD v40[6];
  uint64_t v41;

  v16 = (id *)a3;
  v17 = (id *)a4;
  v18 = (id *)a5;
  v19 = (id *)a6;
  v20 = -[NSMutableArray count](self->_colors, "count");
  if (v20 == objc_msgSend(v16[1], "count")
    && (v21 = -[NSMutableArray count](self->_colors, "count"), v21 == objc_msgSend(v17[1], "count"))
    && (v22 = -[NSMutableArray count](self->_colors, "count"), v22 == objc_msgSend(v18[1], "count"))
    && (v23 = -[NSMutableArray count](self->_colors, "count"), v23 == objc_msgSend(v19[1], "count")))
  {
    v38 = a8;
    if (-[NSMutableArray count](self->_colors, "count"))
    {
      v24 = 0;
      v36 = v18;
      v37 = self;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16[1], "objectAtIndexedSubscript:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17[1], "objectAtIndexedSubscript:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18[1], "objectAtIndexedSubscript:", v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19[1], "objectAtIndexedSubscript:", v24);
        v29 = v17;
        v30 = v16;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *(_OWORD *)&a7->var2.var2;
        v40[4] = *(_OWORD *)&a7->var2.var0;
        v40[5] = v32;
        v41 = *(_QWORD *)&a7->var3;
        v33 = *(_OWORD *)&a7->var0.var2;
        v40[0] = *(_OWORD *)&a7->var0.var0;
        v40[1] = v33;
        v34 = *(_OWORD *)&a7->var1.var2;
        v40[2] = *(_OWORD *)&a7->var1.var0;
        v40[3] = v34;
        var1 = v38->var1;
        v39[0] = v38->var0;
        v39[1] = var1;
        v39[2] = *(_OWORD *)&v38->var2;
        objc_msgSend(v25, "integrateWithVelocity:target:intermediateTarget:intermediateTargetVelocity:parameters:state:delta:", v26, v27, v28, v31, v40, v39, a9);

        v16 = v30;
        v17 = v29;

        v18 = v36;
        self = v37;
        ++v24;
      }
      while (v24 < -[NSMutableArray count](v37->_colors, "count"));
    }
  }
  else
  {
    -[UIInterpolatedColorArray reinitWithVector:](self, "reinitWithVector:", v17);
  }

}

- (id)addVector:(id)a3
{
  id *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;

  v5 = (id *)a3;
  v6 = -[NSMutableArray count](self->_colors, "count");
  if (v6 != objc_msgSend(v5[1], "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInterpolatedColorArray.m"), 80, CFSTR("Cannot add color array with different number of colors (%lu != %lu)"), -[NSMutableArray count](self->_colors, "count"), objc_msgSend(v5[1], "count"));

  }
  if (-[NSMutableArray count](self->_colors, "count"))
  {
    v7 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5[1], "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v8, "addVector:", v9);

      ++v7;
    }
    while (v7 < -[NSMutableArray count](self->_colors, "count"));
  }

  return self;
}

- (id)multiplyByScalar:(double)a3
{
  unint64_t v5;
  void *v6;
  id v7;

  if (-[NSMutableArray count](self->_colors, "count"))
  {
    v5 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v6, "multiplyByScalar:", a3);

      ++v5;
    }
    while (v5 < -[NSMutableArray count](self->_colors, "count"));
  }
  return self;
}

- (id)multiplyByVector:(id)a3
{
  id *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;

  v5 = (id *)a3;
  v6 = -[NSMutableArray count](self->_colors, "count");
  if (v6 != objc_msgSend(v5[1], "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInterpolatedColorArray.m"), 95, CFSTR("Cannot multiply by color array with different number of colors (%lu != %lu)"), -[NSMutableArray count](self->_colors, "count"), objc_msgSend(v5[1], "count"));

  }
  if (-[NSMutableArray count](self->_colors, "count"))
  {
    v7 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5[1], "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v8, "multiplyByVector:", v9);

      ++v7;
    }
    while (v7 < -[NSMutableArray count](self->_colors, "count"));
  }

  return self;
}

- (BOOL)isApproximatelyEqualTo:(id)a3 withinEpsilon:(id)a4
{
  id *v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (id *)a3;
  v7 = (id *)a4;
  v8 = -[NSMutableArray count](self->_colors, "count");
  if (v8 == objc_msgSend(v6[1], "count")
    && (v9 = -[NSMutableArray count](self->_colors, "count"), v9 == objc_msgSend(v7[1], "count")))
  {
    if (-[NSMutableArray count](self->_colors, "count"))
    {
      v10 = 0;
      v11 = 1;
      do
      {
        if ((v11 & 1) != 0)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6[1], "objectAtIndexedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7[1], "objectAtIndexedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v12, "isApproximatelyEqualTo:withinEpsilon:", v13, v14);

        }
        else
        {
          v11 = 0;
        }
        ++v10;
      }
      while (v10 < -[NSMutableArray count](self->_colors, "count"));
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isCompatibleWith:(id)a3
{
  NSMutableArray *colors;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  colors = self->_colors;
  v4 = a3;
  v5 = -[NSMutableArray count](colors, "count");
  v6 = (void *)v4[1];

  return v5 == objc_msgSend(v6, "count");
}

- (BOOL)isUndefined
{
  unint64_t v3;
  char v4;
  void *v5;

  if (!-[NSMutableArray count](self->_colors, "count"))
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    if ((v4 & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "isUndefined");

    }
    ++v3;
  }
  while (v3 < -[NSMutableArray count](self->_colors, "count"));
  return v4;
}

- (id)getValue
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_colors, "count"));
  if (-[NSMutableArray count](self->_colors, "count"))
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "getValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_colors, "count"));
  }
  return v3;
}

+ (id)epsilonCompatibleWithVector:(id)a3
{
  id *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  UIInterpolatedColorArray *v8;

  v3 = (id *)a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3[1], "count"));
  if (objc_msgSend(v3[1], "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3[1], "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIInterpolatedColor epsilonCompatibleWithVector:](UIInterpolatedColor, "epsilonCompatibleWithVector:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

      ++v5;
    }
    while (v5 < objc_msgSend(v3[1], "count"));
  }
  v8 = -[UIInterpolatedColorArray initWithColors:]([UIInterpolatedColorArray alloc], "initWithColors:", v4);

  return v8;
}

+ (id)zeroCompatibleWithVector:(id)a3
{
  id *v3;
  id *v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  UIInterpolatedColorArray *v10;

  v3 = (id *)a3;
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3[1], "count");
  else
    v5 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v4[1], "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIInterpolatedColor zeroCompatibleWithVector:](UIInterpolatedColor, "zeroCompatibleWithVector:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

    }
  }
  v10 = -[UIInterpolatedColorArray initWithColors:]([UIInterpolatedColorArray alloc], "initWithColors:", v6);

  return v10;
}

- (NSString)debugDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("Colors: ["));
  if (-[NSMutableArray count](self->_colors, "count") != 1)
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conciseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v6);

      objc_msgSend(v3, "appendString:", CFSTR(", "));
      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_colors, "count") - 1);
  }
  -[NSMutableArray lastObject](self->_colors, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conciseDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v8);

  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
