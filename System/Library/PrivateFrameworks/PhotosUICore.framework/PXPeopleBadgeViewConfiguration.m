@implementation PXPeopleBadgeViewConfiguration

- (PXPeopleBadgeViewConfiguration)initWithState:(int64_t)a3 displayScale:(double)a4 badgeViewDelegate:(id)a5
{
  id v9;
  void *v10;
  PXPeopleBadgeViewConfiguration *v11;
  PXPeopleBadgeViewConfiguration *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v9 = a5;
  v10 = v9;
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBadgeViewConfiguration.m"), 14, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayScale > 0"));

    if (v10)
      goto LABEL_3;
  }
  else if (v9)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBadgeViewConfiguration.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("badgeViewDelegate"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PXPeopleBadgeViewConfiguration;
  v11 = -[PXPeopleBadgeViewConfiguration init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_state = a3;
    v11->_displayScale = a4;
    objc_storeWeak((id *)&v11->_badgeViewDelegate, v10);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXPeopleBadgeViewConfiguration *v4;
  int64_t v5;
  double v6;
  double v7;
  void *v8;
  PXPeopleBadgeViewConfiguration *v9;

  v4 = +[PXPeopleBadgeViewConfiguration allocWithZone:](PXPeopleBadgeViewConfiguration, "allocWithZone:", a3);
  v5 = -[PXPeopleBadgeViewConfiguration state](self, "state");
  -[PXPeopleBadgeViewConfiguration displayScale](self, "displayScale");
  v7 = v6;
  -[PXPeopleBadgeViewConfiguration badgeViewDelegate](self, "badgeViewDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXPeopleBadgeViewConfiguration initWithState:displayScale:badgeViewDelegate:](v4, "initWithState:displayScale:badgeViewDelegate:", v5, v8, v7);

  return v9;
}

- (int64_t)state
{
  return self->_state;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (PXPeopleBadgeViewDelegate)badgeViewDelegate
{
  return (PXPeopleBadgeViewDelegate *)objc_loadWeakRetained((id *)&self->_badgeViewDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_badgeViewDelegate);
}

@end
