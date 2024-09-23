@implementation _LayerHUDPropertiesListener

- (_LayerHUDPropertiesListener)initWithLayer:(id)a3 andOverlay:(void *)a4
{
  id v6;
  _LayerHUDPropertiesListener *v7;
  _LayerHUDPropertiesListener *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LayerHUDPropertiesListener;
  v7 = -[_LayerHUDPropertiesListener init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[_LayerHUDPropertiesListener setM_metalLayer:](v7, "setM_metalLayer:", v6);
    v8->m_overlay = a4;
    -[_LayerHUDPropertiesListener m_metalLayer](v8, "m_metalLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v8, CFSTR("developerHUDProperties"), 1, 0);

  }
  return v8;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->m_metalLayer);
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:", self, CFSTR("developerHUDProperties"));

  v4.receiver = self;
  v4.super_class = (Class)_LayerHUDPropertiesListener;
  -[_LayerHUDPropertiesListener dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  id WeakRetained;
  id v26;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("developerHUDProperties"), a4, a5, a6)
    && *(_BYTE *)self->m_overlay)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->m_metalLayer);
    objc_msgSend(WeakRetained, "developerHUDProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)self->m_overlay + 1))
    {
      v9 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("default"));
      else
        v9 = 0;
    }
    objc_msgSend(*((id *)self->m_overlay + 1), "setEnabled:", v9);
    v10 = objc_loadWeakRetained((id *)&self->m_metalLayer);
    objc_msgSend(v10, "developerHUDProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("logging"));
    v26 = (id)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)self->m_overlay + 1))
    {
      v12 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = objc_msgSend(v26, "isEqualToString:", CFSTR("default"));
      else
        v12 = 0;
    }
    objc_msgSend(*((id *)self->m_overlay + 1), "setLoggingEnabled:", v12);
    if (!objc_msgSend(*((id *)self->m_overlay + 1), "alignment"))
    {
      v13 = objc_loadWeakRetained((id *)&self->m_metalLayer);
      objc_msgSend(v13, "developerHUDProperties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("alignment"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(*((id *)self->m_overlay + 1), "setAlignment:", objc_msgSend(v15, "integerValue") & 0x1F);
      }

    }
    v16 = objc_loadWeakRetained((id *)&self->m_metalLayer);
    objc_msgSend(v16, "developerHUDProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("positionX"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_loadWeakRetained((id *)&self->m_metalLayer);
    objc_msgSend(v19, "developerHUDProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("positionY"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & (v21 != 0)) == 1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v18, "floatValue");
          v23 = v22;
          objc_msgSend(v21, "floatValue");
          objc_msgSend(*((id *)self->m_overlay + 1), "setPosition:", v23, v24);
          objc_msgSend(*((id *)self->m_overlay + 1), "setAlignment:", 1);
        }
      }
    }

  }
}

- (CAMetalLayer)m_metalLayer
{
  return (CAMetalLayer *)objc_loadWeakRetained((id *)&self->m_metalLayer);
}

- (void)setM_metalLayer:(id)a3
{
  objc_storeWeak((id *)&self->m_metalLayer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->m_metalLayer);
}

@end
