@implementation RTNavigationRouteSummary

- (RTNavigationRouteSummary)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithOriginMapItem_destinationMapItem_);
}

- (RTNavigationRouteSummary)initWithOriginMapItem:(id)a3 destinationMapItem:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTNavigationRouteSummary *v10;
  id *p_isa;
  RTNavigationRouteSummary *v12;
  NSObject *v13;
  const char *v14;
  objc_super v16;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: originMapItem";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: destinationMapItem";
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTNavigationRouteSummary;
  v10 = -[RTNavigationRouteSummary init](&v16, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_originMapItem, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_10:

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTNavigationRouteSummary originMapItem](self, "originMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNavigationRouteSummary destinationMapItem](self, "destinationMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("origin map item, %@, destination map item, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTNavigationRouteSummary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RTNavigationRouteSummary *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("OriginMapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("DestinationMapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[RTNavigationRouteSummary initWithOriginMapItem:destinationMapItem:](self, "initWithOriginMapItem:destinationMapItem:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  RTMapItem *originMapItem;
  id v5;

  originMapItem = self->_originMapItem;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originMapItem, CFSTR("OriginMapItem"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationMapItem, CFSTR("DestinationMapItem"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[RTNavigationRouteSummary originMapItem](self, "originMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RTNavigationRouteSummary destinationMapItem](self, "destinationMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  RTNavigationRouteSummary *v4;
  RTNavigationRouteSummary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (RTNavigationRouteSummary *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTNavigationRouteSummary originMapItem](self, "originMapItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTNavigationRouteSummary originMapItem](v5, "originMapItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToMapItem:", v7))
      {
        -[RTNavigationRouteSummary destinationMapItem](self, "destinationMapItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTNavigationRouteSummary destinationMapItem](v5, "destinationMapItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToMapItem:", v9);

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

- (RTMapItem)originMapItem
{
  return self->_originMapItem;
}

- (void)setOriginMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_originMapItem, a3);
}

- (RTMapItem)destinationMapItem
{
  return self->_destinationMapItem;
}

- (void)setDestinationMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_destinationMapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMapItem, 0);
  objc_storeStrong((id *)&self->_originMapItem, 0);
}

@end
