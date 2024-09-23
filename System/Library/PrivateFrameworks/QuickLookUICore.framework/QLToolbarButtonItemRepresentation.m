@implementation QLToolbarButtonItemRepresentation

- (BOOL)isEqual:(id)a3
{
  QLToolbarButtonItemRepresentation *v4;
  QLToolbarButtonItemRepresentation *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (QLToolbarButtonItemRepresentation *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[QLToolbarButtonItemRepresentation identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLToolbarButtonItemRepresentation identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (!v8)
        goto LABEL_7;
      v9 = -[QLToolbarButtonItemRepresentation action](self, "action");
      if (v9 != -[QLToolbarButtonItemRepresentation action](v5, "action"))
        goto LABEL_7;
      v10 = -[QLToolbarButtonItemRepresentation placement](self, "placement");
      if (v10 == -[QLToolbarButtonItemRepresentation placement](v5, "placement")
        && (-[QLToolbarButtonItemRepresentation target](self, "target"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            -[QLToolbarButtonItemRepresentation target](v5, "target"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v12,
            v11,
            v11 == v12))
      {
        -[QLToolbarButtonItemRepresentation originalButton](self, "originalButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLToolbarButtonItemRepresentation originalButton](v5, "originalButton");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v15 == (void *)v16)
        {
          v13 = 1;
          v17 = v15;
        }
        else
        {
          v17 = (void *)v16;
          -[QLToolbarButtonItemRepresentation originalButton](self, "originalButton");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[QLToolbarButtonItemRepresentation originalButton](v5, "originalButton");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v18, "isEqual:", v19);

        }
      }
      else
      {
LABEL_7:
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (void)setLongPressTarget:(id)a3 action:(SEL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[QLToolbarButtonItemRepresentation longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v11, a4);
    -[QLToolbarButtonItemRepresentation setLongPressGestureRecognizer:](self, "setLongPressGestureRecognizer:", v7);
    -[QLToolbarButtonItemRepresentation _gestureRecognizers](self, "_gestureRecognizers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    -[QLToolbarButtonItemRepresentation longPressGestureRecognizer](self, "longPressGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    -[QLToolbarButtonItemRepresentation _setGestureRecognizers:](self, "_setGestureRecognizers:", v9);
  }

}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 408, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (unint64_t)placement
{
  return self->_placement;
}

- (void)setPlacement:(unint64_t)a3
{
  self->_placement = a3;
}

- (BOOL)disappearsOnTap
{
  return self->_disappearsOnTap;
}

- (void)setDisappearsOnTap:(BOOL)a3
{
  self->_disappearsOnTap = a3;
}

- (QLToolbarButtonDelegate)presentingViewController
{
  return (QLToolbarButtonDelegate *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (QLToolbarButton)originalButton
{
  return (QLToolbarButton *)objc_loadWeakRetained((id *)&self->_originalButton);
}

- (void)setOriginalButton:(id)a3
{
  objc_storeWeak((id *)&self->_originalButton, a3);
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_originalButton);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
