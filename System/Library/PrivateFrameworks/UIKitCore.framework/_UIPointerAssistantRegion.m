@implementation _UIPointerAssistantRegion

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPointerAssistantRegion;
  v4 = -[UIPointerRegion copyWithZone:](&v7, sel_copyWithZone_, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  objc_storeWeak(v4 + 10, WeakRetained);

  objc_storeStrong(v4 + 11, self->_assistant);
  *((_BYTE *)v4 + 72) = self->_selected;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _UIPointerAssistantRegion *v4;
  _UIPointerAssistantRegion *v5;
  id *v6;
  id WeakRetained;
  id v8;
  char v9;
  _UIAssistantEntry *assistant;
  id v11;
  _UIAssistantEntry *v12;
  _UIAssistantEntry *v13;
  _UIAssistantEntry *v14;
  objc_super v16;

  v4 = (_UIPointerAssistantRegion *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v16.receiver = self,
             v16.super_class = (Class)_UIPointerAssistantRegion,
             -[UIPointerRegion isEqual:](&v16, sel_isEqual_, v5)))
  {
    v6 = v5;
    if (self->_selected == *((unsigned __int8 *)v6 + 72))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
      v8 = objc_loadWeakRetained(v6 + 10);
      if (WeakRetained == v8)
      {
        assistant = self->_assistant;
        v11 = v6[11];
        v12 = assistant;
        v13 = (_UIAssistantEntry *)v11;
        v14 = v13;
        if (v12 == v13)
        {
          v9 = 1;
        }
        else
        {
          v9 = 0;
          if (v12 && v13)
            v9 = -[_UIAssistantEntry isEqual:](v12, "isEqual:", v13);
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
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  _UIAssistantEntry *assistant;
  id WeakRetained;
  void *v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)_UIPointerAssistantRegion;
  -[UIPointerRegion description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  assistant = self->_assistant;
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  v7 = WeakRetained;
  if (self->_selected)
    v8 = CFSTR(" selected");
  else
    v8 = &stru_1E16EDF20;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ assistant=%@ targetView=%p%@"), v4, assistant, WeakRetained, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)targetViewAsButton
{
  id WeakRetained;
  void *v2;
  id v3;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = WeakRetained;
    else
      v2 = 0;
    v3 = v2;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)targetView
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 10);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_destroyWeak((id *)&self->_targetView);
}

@end
