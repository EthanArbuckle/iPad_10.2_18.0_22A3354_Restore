@implementation SBSystemApertureTestRecipe

- (SBSystemApertureTestRecipe)init
{
  SBSystemApertureTestRecipe *v2;
  uint64_t v3;
  NSMutableArray *elementAssertions;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *prototypeElementClasses;
  objc_super v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SBSystemApertureTestRecipe;
  v2 = -[SBSystemApertureTestRecipe init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    elementAssertions = v2->_elementAssertions;
    v2->_elementAssertions = (NSMutableArray *)v3;

    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v8 = objc_claimAutoreleasedReturnValue();
    prototypeElementClasses = v2->_prototypeElementClasses;
    v2->_prototypeElementClasses = (NSArray *)v8;

  }
  return v2;
}

- (id)title
{
  return CFSTR("Jindo Elements");
}

- (void)handleVolumeIncrease
{
  objc_class *v3;
  void *v4;
  id v5;
  void *v6;
  int64_t elementClassToInsertIndex;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v3 = -[NSArray objectAtIndex:](self->_prototypeElementClasses, "objectAtIndex:", self->_elementClassToInsertIndex);
  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "registerElement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __50__SBSystemApertureTestRecipe_handleVolumeIncrease__block_invoke;
  v11 = &unk_1E8EABB30;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v6, "addInvalidationBlock:", &v8);
  if (v6)
  {
    -[NSMutableArray addObject:](self->_elementAssertions, "addObject:", v6, v8, v9, v10, v11);
    elementClassToInsertIndex = self->_elementClassToInsertIndex;
    self->_elementClassToInsertIndex = (elementClassToInsertIndex + 1)
                                     % -[NSArray count](self->_prototypeElementClasses, "count");
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __50__SBSystemApertureTestRecipe_handleVolumeIncrease__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_msgSend(*((id *)WeakRetained + 2), "indexOfObject:", v9);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
      v7 = (void *)v4[2];
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v6, v8);

    }
  }

}

- (void)handleVolumeDecrease
{
  void *v3;
  char v4;
  int64_t elementClassToInsertIndex;
  void *v6;

  -[NSMutableArray lastObject](self->_elementAssertions, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    -[NSMutableArray removeObject:](self->_elementAssertions, "removeObject:", v3);
    v4 = objc_opt_respondsToSelector();
    v3 = v6;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v6, "invalidateWithReason:", CFSTR("volume decrease"));
      v3 = v6;
    }
  }
  elementClassToInsertIndex = self->_elementClassToInsertIndex;
  if (elementClassToInsertIndex <= 0)
  {
    elementClassToInsertIndex = -[NSArray count](self->_prototypeElementClasses, "count");
    v3 = v6;
  }
  self->_elementClassToInsertIndex = elementClassToInsertIndex - 1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementAssertions, 0);
  objc_storeStrong((id *)&self->_prototypeElementClasses, 0);
}

@end
