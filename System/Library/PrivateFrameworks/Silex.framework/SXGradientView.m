@implementation SXGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SXGradientView)initWithGradient:(id)a3
{
  id v5;
  SXGradientView *v6;
  SXGradientView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SXGradientView;
  v6 = -[SXGradientView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gradient, a3);
    -[SXGradientView layer](v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startPoint");
    objc_msgSend(v8, "setStartPoint:");
    objc_msgSend(v5, "endPoint");
    objc_msgSend(v8, "setEndPoint:");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXGradientView gradient](v7, "gradient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __35__SXGradientView_initWithGradient___block_invoke;
    v15[3] = &unk_24D689428;
    v16 = v9;
    v12 = v9;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);

    objc_msgSend(v8, "setColors:", v12);
    objc_msgSend(v5, "locations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocations:", v13);

  }
  return v7;
}

uint64_t __35__SXGradientView_initWithGradient___block_invoke(uint64_t a1, id a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(objc_retainAutorelease(a2), "CGColor"));
}

- (SXGradient)gradient
{
  return self->_gradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
}

@end
