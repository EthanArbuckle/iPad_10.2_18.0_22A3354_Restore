@implementation EDRun

+ (id)runWithCharIndex:(unint64_t)a3 fontIndex:(unint64_t)a4 resources:(id)a5
{
  id v7;
  void *v8;

  v7 = a5;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCharIndex:fontIndex:resources:", a3, a4, v7);

  return v8;
}

- (EDRun)initWithCharIndex:(unint64_t)a3 fontIndex:(unint64_t)a4 resources:(id)a5
{
  EDRun *result;

  result = -[EDRun initWithResources:](self, "initWithResources:", a5);
  if (result)
  {
    result->mCharIndex = a3;
    result->mFontIndex = a4;
  }
  return result;
}

- (EDRun)initWithResources:(id)a3
{
  id v4;
  EDRun *v5;
  EDRun *v6;
  NSArray *mEffects;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDRun;
  v5 = -[EDRun init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mCharIndex = 0;
    v6->mFontIndex = 0;
    mEffects = v6->mEffects;
    v6->mEffects = 0;

  }
  return v6;
}

- (int64_t)key
{
  return self->mCharIndex;
}

- (unint64_t)charIndex
{
  return self->mCharIndex;
}

- (id)font
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "fonts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mFontIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)runWithCharIndex:(unint64_t)a3 font:(id)a4 resources:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCharIndex:font:resources:", a3, v7, v8);

  return v9;
}

- (EDRun)initWithCharIndex:(unint64_t)a3 font:(id)a4 resources:(id)a5
{
  id v8;
  id v9;
  EDRun *v10;
  EDRun *v11;

  v8 = a4;
  v9 = a5;
  v10 = -[EDRun initWithResources:](self, "initWithResources:", v9);
  v11 = v10;
  if (v10)
  {
    v10->mCharIndex = a3;
    -[EDRun setFont:](v10, "setFont:", v8);
  }

  return v11;
}

- (void)setFont:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "fonts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->mFontIndex = objc_msgSend(v5, "addOrEquivalentObject:", v6);
}

- (unint64_t)fontIndex
{
  return self->mFontIndex;
}

- (BOOL)isEqual:(id)a3
{
  EDRun *v4;
  objc_object **v5;
  BOOL v6;

  v4 = (EDRun *)a3;
  v5 = (objc_object **)v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && TCObjectEqual((objc_object *)self->mEffects, v5[4])
      && -[EDRun isEqualToRun:](self, "isEqualToRun:", v5);

  return v6;
}

- (BOOL)isEqualToRun:(id)a3
{
  return self->mFontIndex == *((_QWORD *)a3 + 3) && self->mCharIndex == *((_QWORD *)a3 + 2);
}

- (EDRun)initWithCharIndex:(unint64_t)a3 font:(id)a4 effects:(id)a5 resources:(id)a6
{
  id v11;
  EDRun *v12;
  EDRun *v13;

  v11 = a5;
  v12 = -[EDRun initWithCharIndex:font:resources:](self, "initWithCharIndex:font:resources:", a3, a4, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->mEffects, a5);

  return v13;
}

+ (id)runWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return v4;
}

+ (id)runWithCharIndex:(unint64_t)a3 font:(id)a4 effects:(id)a5 resources:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCharIndex:font:effects:resources:", a3, v9, v10, v11);

  return v12;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = (self->mFontIndex << 8) + (self->mCharIndex << 16);
  return v2 + -[NSArray count](self->mEffects, "count");
}

- (void)adjustIndex:(unint64_t)a3
{
  self->mCharIndex += a3;
}

- (void)setCharIndex:(unint64_t)a3
{
  self->mCharIndex = a3;
}

- (id)effects
{
  return self->mEffects;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDRun;
  -[EDRun description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (EDRun)initWithCharIndex:(unint64_t)a3 fontIndex:(unint64_t)a4 effects:(id)a5 resources:(id)a6
{
  id v11;
  EDRun *v12;
  EDRun *v13;

  v11 = a5;
  v12 = -[EDRun initWithCharIndex:fontIndex:resources:](self, "initWithCharIndex:fontIndex:resources:", a3, a4, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->mEffects, a5);

  return v13;
}

+ (id)runWithCharIndex:(unint64_t)a3 fontIndex:(unint64_t)a4 effects:(id)a5 resources:(id)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCharIndex:fontIndex:effects:resources:", a3, a4, v9, v10);

  return v11;
}

- (void)setFontIndex:(unint64_t)a3
{
  self->mFontIndex = a3;
}

@end
