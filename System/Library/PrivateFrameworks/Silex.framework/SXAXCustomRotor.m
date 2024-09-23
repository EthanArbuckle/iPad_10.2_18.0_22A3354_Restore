@implementation SXAXCustomRotor

+ (id)rotorWithName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SXAXCustomRotor *v7;

  v3 = a3;
  v4 = (void *)__rotors;
  if (!__rotors)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)__rotors;
    __rotors = v5;

    v4 = (void *)__rotors;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v7 = (SXAXCustomRotor *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[SXAXCustomRotor initWithName:]([SXAXCustomRotor alloc], "initWithName:", v3);
    objc_msgSend((id)__rotors, "setObject:forKey:", v7, v3);
  }

  return v7;
}

- (SXAXCustomRotor)initWithName:(id)a3
{
  id v4;
  SXAXCustomRotor *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXAXCustomRotor;
  v5 = -[SXAXCustomRotor initWithName:itemSearchBlock:](&v10, sel_initWithName_itemSearchBlock_, v4, &__block_literal_global_59);
  objc_initWeak(&location, v5);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__SXAXCustomRotor_initWithName___block_invoke_2;
  v7[3] = &unk_24D68B5E0;
  objc_copyWeak(&v8, &location);
  -[SXAXCustomRotor setItemSearchBlock:](v5, "setItemSearchBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

uint64_t __32__SXAXCustomRotor_initWithName___block_invoke()
{
  return 0;
}

id __32__SXAXCustomRotor_initWithName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "searchDirection");
  if (v4 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v3, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "rotorItemAfter:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      v8 = 0;
      goto LABEL_7;
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v3, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "rotorItemBefore:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

LABEL_7:
  return v8;
}

- (id)rotorItemBefore:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = -[SXAXCustomRotor indexOfRotorItem:](self, "indexOfRotorItem:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SXAXCustomRotor rotorItems](self, "rotorItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXAXCustomRotor rotorItems](self, "rotorItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    goto LABEL_7;
  }
  v8 = v4 - 1;
  if (v4 >= 1)
  {
    -[SXAXCustomRotor rotorItems](self, "rotorItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:
  objc_msgSend(v7, "targetElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {

    v7 = 0;
  }
  return v7;
}

- (id)rotorItemAfter:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v4 = -[SXAXCustomRotor indexOfRotorItem:](self, "indexOfRotorItem:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SXAXCustomRotor rotorItems](self, "rotorItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
LABEL_5:
    objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v8 = v4 + 1;
  -[SXAXCustomRotor rotorItems](self, "rotorItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 < v10)
  {
    -[SXAXCustomRotor rotorItems](self, "rotorItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = v8;
    goto LABEL_5;
  }
  v11 = 0;
LABEL_7:
  objc_msgSend(v11, "targetElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {

    v11 = 0;
  }
  return v11;
}

- (int64_t)indexOfRotorItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  -[SXAXCustomRotor rotorItems](self, "rotorItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__SXAXCustomRotor_indexOfRotorItem___block_invoke;
  v9[3] = &unk_24D68B608;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __36__SXAXCustomRotor_indexOfRotorItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  id v16;

  v16 = a2;
  objc_msgSend(*(id *)(a1 + 32), "targetElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "targetElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  objc_msgSend(*(id *)(a1 + 32), "targetRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    goto LABEL_4;
  }
  objc_msgSend(v16, "targetRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "targetRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "targetRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    v15 = v14 ^ 1;
    if (!v9)
      goto LABEL_7;
    goto LABEL_5;
  }
  v15 = 0;
  if (!v9)
    goto LABEL_7;
LABEL_5:
  if ((v15 & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
LABEL_7:

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAXCustomRotor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAXCustomRotor rotorItems](self, "rotorItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %@; items={%@}>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSOrderedSet)rotorItems
{
  return self->_rotorItems;
}

- (void)setRotorItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotorItems, 0);
}

@end
