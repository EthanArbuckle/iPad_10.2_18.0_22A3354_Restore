@implementation PXHUDView

- (PXHUDView)initWithCoder:(id)a3
{
  PXHUDView *v3;
  PXHUDView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXHUDView;
  v3 = -[PXHUDView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    commonInit(v3);
  return v4;
}

- (PXHUDView)initWithFrame:(CGRect)a3
{
  PXHUDView *v3;
  PXHUDView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXHUDView;
  v3 = -[PXHUDView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    commonInit(v3);
  return v4;
}

- (void)addVisualization:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PXHUDView visualizationToView](self, "visualizationToView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_class();
    v5 = objc_alloc_init((Class)objc_msgSend(v6, "visualizationClassToViewClass:", objc_opt_class()));
    objc_msgSend(v5, "setVisualization:", v9);
    -[PXHUDView stackView](self, "stackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addArrangedSubview:", v5);

    -[PXHUDView visualizationToView](self, "visualizationToView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v5, v9);

  }
}

- (void)removeVisualization:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PXHUDView visualizationToView](self, "visualizationToView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXHUDView visualizationToView](self, "visualizationToView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v8);

    -[PXHUDView stackView](self, "stackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeArrangedSubview:", v5);

    objc_msgSend(v5, "removeFromSuperview");
  }

}

- (NSMapTable)visualizationToView
{
  return self->_visualizationToView;
}

- (void)setVisualizationToView:(id)a3
{
  objc_storeStrong((id *)&self->_visualizationToView, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_visualizationToView, 0);
}

+ (Class)visualizationClassToViewClass:(Class)a3
{
  if (visualizationClassToViewClass__onceToken != -1)
    dispatch_once(&visualizationClassToViewClass__onceToken, &__block_literal_global_201775);
  return (Class)objc_msgSend((id)visualizationClassToViewClass__visualizationClassToViewClass, "objectForKey:", a3);
}

uint64_t __43__PXHUDView_visualizationClassToViewClass___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)visualizationClassToViewClass__visualizationClassToViewClass;
  visualizationClassToViewClass__visualizationClassToViewClass = v0;

  v2 = (void *)visualizationClassToViewClass__visualizationClassToViewClass;
  v3 = objc_opt_class();
  objc_msgSend(v2, "setObject:forKey:", v3, objc_opt_class());
  v4 = (void *)visualizationClassToViewClass__visualizationClassToViewClass;
  v5 = objc_opt_class();
  objc_msgSend(v4, "setObject:forKey:", v5, objc_opt_class());
  v6 = (void *)visualizationClassToViewClass__visualizationClassToViewClass;
  v7 = objc_opt_class();
  return objc_msgSend(v6, "setObject:forKey:", v7, objc_opt_class());
}

@end
