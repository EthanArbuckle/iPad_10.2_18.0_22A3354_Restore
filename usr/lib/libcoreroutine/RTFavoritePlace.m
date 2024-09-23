@implementation RTFavoritePlace

- (RTFavoritePlace)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithTitle_mapItem_);
}

- (RTFavoritePlace)initWithTitle:(id)a3 mapItem:(id)a4
{
  id v6;
  id v7;
  RTFavoritePlace *v8;
  uint64_t v9;
  NSString *title;
  RTFavoritePlace *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)RTFavoritePlace;
    v8 = -[RTFavoritePlace init](&v14, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v6, "copy");
      title = v8->_title;
      v8->_title = (NSString *)v9;

      objc_storeStrong((id *)&v8->_mapItem, a4);
    }
    self = v8;
    v11 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTFavoritePlace initWithTitle:mapItem:]";
      v17 = 1024;
      v18 = 27;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem (in %s:%d)", buf, 0x12u);
    }

    v11 = 0;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("title, %@, mapItem, %@"), self->_title, self->_mapItem);
}

- (NSString)title
{
  return self->_title;
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
