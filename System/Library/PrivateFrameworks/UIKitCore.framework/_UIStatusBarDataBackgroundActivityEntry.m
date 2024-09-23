@implementation _UIStatusBarDataBackgroundActivityEntry

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t displayStartDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataBackgroundActivityEntry;
  v3 = self->_type ^ -[_UIStatusBarDataEntry hash](&v6, sel_hash);
  displayStartDate = (int)self->_displayStartDate;
  return v3 ^ -[NSString hash](self->_detailString, "hash") ^ displayStartDate;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataBackgroundActivityEntry;
  v4 = -[_UIStatusBarDataEntry copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setType:", self->_type);
  objc_msgSend(v4, "setDisplayStartDate:", self->_displayStartDate);
  v5 = (void *)-[NSString copy](self->_detailString, "copy");
  objc_msgSend(v4, "setDetailString:", v5);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataBackgroundActivityEntry;
  v4 = a3;
  -[_UIStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("displayStartDate"), self->_displayStartDate);
  objc_msgSend(v4, "encodeObject:forKey:", self->_detailString, CFSTR("detailString"));

}

- (_UIStatusBarDataBackgroundActivityEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataBackgroundActivityEntry *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataBackgroundActivityEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  -[_UIStatusBarDataBackgroundActivityEntry setType:](v4, "setType:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"), v7.receiver, v7.super_class));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("displayStartDate"));
  -[_UIStatusBarDataBackgroundActivityEntry setDisplayStartDate:](v4, "setDisplayStartDate:");
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detailString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarDataBackgroundActivityEntry setDetailString:](v4, "setDetailString:", v5);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t type;
  double displayStartDate;
  double v8;
  NSString *detailString;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIStatusBarDataBackgroundActivityEntry;
  if (-[_UIStatusBarDataEntry isEqual:](&v16, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      type = self->_type;
      if (type == objc_msgSend(v5, "type")
        && (displayStartDate = self->_displayStartDate, objc_msgSend(v5, "displayStartDate"), displayStartDate == v8))
      {
        detailString = self->_detailString;
        objc_msgSend(v5, "detailString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = detailString;
        v12 = v10;
        v13 = v12;
        if (v11 == v12)
        {
          v14 = 1;
        }
        else
        {
          v14 = 0;
          if (v11 && v12)
            v14 = -[NSString isEqual:](v11, "isEqual:", v12);
        }

      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 1;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_ui_descriptionBuilder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarDataBackgroundActivityEntry;
  -[_UIStatusBarDataEntry _ui_descriptionBuilder](&v8, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  NSStringFromSelector(sel_detailString);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)displayStartDate
{
  return self->_displayStartDate;
}

- (void)setDisplayStartDate:(double)a3
{
  self->_displayStartDate = a3;
}

- (NSString)detailString
{
  return self->_detailString;
}

- (void)setDetailString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailString, 0);
}

@end
