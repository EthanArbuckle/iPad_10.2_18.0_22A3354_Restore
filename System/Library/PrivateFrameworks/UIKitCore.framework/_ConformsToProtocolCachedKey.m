@implementation _ConformsToProtocolCachedKey

- (unint64_t)hash
{
  id WeakRetained;
  uint64_t v4;
  unint64_t v5;

  WeakRetained = objc_loadWeakRetained(&self->_object);
  v4 = objc_msgSend(WeakRetained, "hash");
  v5 = -[Protocol hash](self->_protocol, "hash") - v4 + 32 * v4;

  return v5;
}

- (_ConformsToProtocolCachedKey)initWithObject:(id)a3 protocol:(id)a4
{
  id v6;
  id v7;
  _ConformsToProtocolCachedKey *v8;
  _ConformsToProtocolCachedKey *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_ConformsToProtocolCachedKey;
  v8 = -[_ConformsToProtocolCachedKey init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_object, v6);
    objc_storeStrong((id *)&v9->_protocol, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  _ConformsToProtocolCachedKey *v4;
  void *v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  BOOL v10;

  v4 = (_ConformsToProtocolCachedKey *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    v5 = (void *)objc_opt_class();
    if (objc_msgSend(v5, "isEqual:", objc_opt_class()))
    {
      WeakRetained = objc_loadWeakRetained(&self->_object);
      if (WeakRetained)
      {
        v7 = objc_loadWeakRetained(&v4->_object);
        if (v7)
        {
          v8 = objc_loadWeakRetained(&self->_object);
          v9 = objc_loadWeakRetained(&v4->_object);
          v10 = v8 == v9 && self->_protocol == v4->_protocol;

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_destroyWeak(&self->_object);
}

@end
