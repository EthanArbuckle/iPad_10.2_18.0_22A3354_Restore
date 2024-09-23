@implementation TSDContentPath

+ (TSDContentPath)contentPathWithLocations:(id)a3
{
  TSDContentPath *v4;

  v4 = objc_alloc_init(TSDContentPath);
  -[TSDContentPath setContentLocations:](v4, "setContentLocations:", a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDContentPath;
  -[TSDContentPath dealloc](&v3, sel_dealloc);
}

- (id)contentLocationAtTime:(double)a3 withTimingFunction:(id)a4
{
  id v7;
  double v8;
  double v9;
  float v10;
  float v11;
  float v12;
  unint64_t v13;
  float v14;
  float v15;
  unint64_t v17;
  id v18;
  id v19;
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

  v7 = -[NSArray lastObject](self->_contentLocations, "lastObject");
  if (-[NSArray count](self->_contentLocations, "count") < 2)
    return v7;
  if (!a4)
    a4 = (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
  objc_msgSend(a4, "solveForTime:", a3);
  v9 = v8;
  v10 = v8 * (double)-[NSArray count](self->_contentLocations, "count");
  v11 = floorf(v10);
  v12 = (float)(-[NSArray count](self->_contentLocations, "count") - 1);
  v13 = -[NSArray count](self->_contentLocations, "count");
  if (v11 >= v12)
  {
    v15 = (float)(v13 - 1);
  }
  else
  {
    v14 = v9 * (double)v13;
    v15 = floorf(v14);
  }
  v17 = (unint64_t)v15;
  v18 = -[NSArray objectAtIndex:](self->_contentLocations, "objectAtIndex:", (unint64_t)v15);
  v19 = -[NSArray objectAtIndex:](self->_contentLocations, "objectAtIndex:", v17 + 1);
  v20 = v9 / (double)-[NSArray count](self->_contentLocations, "count");
  objc_msgSend(v19, "unscaledPoint");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v18, "unscaledPoint");
  v26 = TSDSubtractPoints(v22, v24, v25);
  v28 = TSDMultiplyPointScalar(v26, v27, v20);
  objc_msgSend(v19, "viewScale");
  v30 = v29;
  objc_msgSend(v18, "viewScale");
  v32 = v20 * (v30 - v31);
  objc_msgSend(v18, "unscaledPoint");
  v35 = TSDAddPoints(v33, v34, v28);
  v37 = v36;
  objc_msgSend(v18, "viewScale");
  return +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v35, v37, v32 + v38);
}

- (id)i_contentLocations
{
  return self->_contentLocations;
}

- (NSArray)contentLocations
{
  return self->_contentLocations;
}

- (void)setContentLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
