@implementation PXPhotosGridAddButtonViewUserData

- (PXPhotosGridAddButtonViewUserData)initWithStyle:(int64_t)a3 actionHandler:(id)a4
{
  id v6;
  PXPhotosGridAddButtonViewUserData *v7;
  PXPhotosGridAddButtonViewUserData *v8;
  uint64_t v9;
  id actionHandler;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosGridAddButtonViewUserData;
  v7 = -[PXPhotosGridAddButtonViewUserData init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_style = a3;
    v9 = objc_msgSend(v6, "copy");
    actionHandler = v8->_actionHandler;
    v8->_actionHandler = (id)v9;

    v8->_preferredUserInterfaceStyle = 0;
  }

  return v8;
}

- (PXPhotosGridAddButtonViewUserData)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridAddButtonView.m"), 184, CFSTR("%s is not available as initializer"), "-[PXPhotosGridAddButtonViewUserData init]");

  abort();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[PXPhotosGridAddButtonViewUserData style](self, "style");
  -[PXPhotosGridAddButtonViewUserData actionHandler](self, "actionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_QWORD *)objc_msgSend(v4, "initWithStyle:actionHandler:", v5, v6);

  -[PXPhotosGridAddButtonViewUserData cornerRadius](self, "cornerRadius");
  v7[4] = v8;
  v7[3] = -[PXPhotosGridAddButtonViewUserData preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle");
  return v7;
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;

  -[PXPhotosGridAddButtonViewUserData cornerRadius](self, "cornerRadius");
  v4 = (unint64_t)v3 ^ (4 * -[PXPhotosGridAddButtonViewUserData style](self, "style"));
  return v4 ^ (8 * -[PXPhotosGridAddButtonViewUserData preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle"));
}

- (BOOL)isEqual:(id)a3
{
  PXPhotosGridAddButtonViewUserData *v4;
  PXPhotosGridAddButtonViewUserData *v5;
  int64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;

  v4 = (PXPhotosGridAddButtonViewUserData *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXPhotosGridAddButtonViewUserData style](self, "style");
      if (v6 == -[PXPhotosGridAddButtonViewUserData style](v5, "style"))
      {
        -[PXPhotosGridAddButtonViewUserData actionHandler](self, "actionHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosGridAddButtonViewUserData actionHandler](v5, "actionHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v8
          && (-[PXPhotosGridAddButtonViewUserData cornerRadius](self, "cornerRadius"),
              v11 = v10,
              -[PXPhotosGridAddButtonViewUserData cornerRadius](v5, "cornerRadius"),
              v11 == v12))
        {
          v13 = -[PXPhotosGridAddButtonViewUserData preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle");
          v9 = v13 == -[PXPhotosGridAddButtonViewUserData preferredUserInterfaceStyle](v5, "preferredUserInterfaceStyle");
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (int64_t)style
{
  return self->_style;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (void)setPreferredUserInterfaceStyle:(int64_t)a3
{
  self->_preferredUserInterfaceStyle = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
}

@end
