@implementation _RTZip

- (_RTZip)initWithFirstInput:(id)a3 secondInput:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  _RTZip *v10;
  id *p_isa;
  _RTZip *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  if (v9 == objc_msgSend(v8, "count"))
  {
    v15.receiver = self;
    v15.super_class = (Class)_RTZip;
    v10 = -[_RTZip init](&v15, sel_init);
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_firstInput, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: firstInput.count == secondInput.count", buf, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (id)zippedArray
{
  void *v3;
  unint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_firstInput, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_firstInput, "count"))
  {
    v4 = 0;
    do
    {
      v5 = objc_alloc(MEMORY[0x1E0D18408]);
      -[NSArray objectAtIndexedSubscript:](self->_firstInput, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_secondInput, "objectAtIndexedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v5, "initWithFirstObject:secondObject:", v6, v7);

      if (v8)
        objc_msgSend(v3, "addObject:", v8);

      ++v4;
    }
    while (v4 < -[NSArray count](self->_firstInput, "count"));
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondInput, 0);
  objc_storeStrong((id *)&self->_firstInput, 0);
}

@end
