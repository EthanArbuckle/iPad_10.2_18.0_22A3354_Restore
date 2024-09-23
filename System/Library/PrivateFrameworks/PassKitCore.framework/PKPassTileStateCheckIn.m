@implementation PKPassTileStateCheckIn

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  PKDateContainer *v10;
  PKDateContainer *availableFrom;
  void *v12;
  PKPassTileAccessory *v13;
  PKPassTileAccessory *secondaryAccessory;
  double v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPassTileStateCheckIn;
  if (-[PKPassTileState _setUpWithDictionary:](&v17, sel__setUpWithDictionary_, v4))
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("availableFrom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0.0;
    _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v5, 0, &v16);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (!v5 || (v8 = 0, v6))
    {
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", (uint64_t)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PKDateContainer initWithDate:timeZone:]([PKDateContainer alloc], "initWithDate:timeZone:", v7, v9);
        availableFrom = self->_availableFrom;
        self->_availableFrom = v10;

      }
      objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("secondaryAccessory"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
      if (v12)
      {
        v13 = +[PKPassTileAccessory _createForDictionary:](PKPassTileAccessory, "_createForDictionary:", v12);
        secondaryAccessory = self->_secondaryAccessory;
        self->_secondaryAccessory = v13;

        if (!self->_secondaryAccessory)
          v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKPassTileStateCheckIn;
  v6 = a4;
  v7 = a3;
  v8 = -[PKPassTileState createResolvedStateWithBundle:privateBundle:](&v14, sel_createResolvedStateWithBundle_privateBundle_, v7, v6);
  v9 = -[PKPassTileAccessory createResolvedAccessoryWithBundle:privateBundle:](self->_secondaryAccessory, "createResolvedAccessoryWithBundle:privateBundle:", v7, v6, v14.receiver, v14.super_class);

  v10 = (void *)v8[9];
  v8[9] = v9;

  v11 = -[PKDateContainer copy](self->_availableFrom, "copy");
  v12 = (void *)v8[8];
  v8[8] = v11;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileStateCheckIn)initWithCoder:(id)a3
{
  id v4;
  PKPassTileStateCheckIn *v5;
  uint64_t v6;
  PKDateContainer *availableFrom;
  uint64_t v8;
  PKPassTileAccessory *secondaryAccessory;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassTileStateCheckIn;
  v5 = -[PKPassTileState initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availableFrom"));
    v6 = objc_claimAutoreleasedReturnValue();
    availableFrom = v5->_availableFrom;
    v5->_availableFrom = (PKDateContainer *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryAccessory"));
    v8 = objc_claimAutoreleasedReturnValue();
    secondaryAccessory = v5->_secondaryAccessory;
    v5->_secondaryAccessory = (PKPassTileAccessory *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassTileStateCheckIn;
  v4 = a3;
  -[PKPassTileState encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_availableFrom, CFSTR("availableFrom"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_secondaryAccessory, CFSTR("secondaryAccessory"));

}

- (BOOL)isEqualToUnresolvedState:(id)a3
{
  id v4;
  _QWORD *v5;
  PKDateContainer *v6;
  PKDateContainer *availableFrom;
  BOOL v8;
  BOOL v9;
  PKPassTileAccessory *v10;
  PKPassTileAccessory *secondaryAccessory;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassTileStateCheckIn;
  if (-[PKPassTileState isEqualToUnresolvedState:](&v13, sel_isEqualToUnresolvedState_, v4))
  {
    v5 = v4;
    v6 = (PKDateContainer *)v5[8];
    availableFrom = self->_availableFrom;
    if (v6)
      v8 = availableFrom == 0;
    else
      v8 = 1;
    if (v8)
    {
      if (v6 == availableFrom)
      {
LABEL_11:
        v10 = (PKPassTileAccessory *)v5[9];
        secondaryAccessory = self->_secondaryAccessory;
        if (v10 && secondaryAccessory)
          v9 = -[PKPassTileAccessory isEqualToUnresolvedAccessory:](v10, "isEqualToUnresolvedAccessory:");
        else
          v9 = v10 == secondaryAccessory;
        goto LABEL_15;
      }
    }
    else if (-[PKDateContainer isEqual:](v6, "isEqual:"))
    {
      goto LABEL_11;
    }
    v9 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (PKDateContainer)availableFrom
{
  PKDateContainer *availableFrom;
  PKDateContainer *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  availableFrom = self->_availableFrom;
  if (availableFrom)
  {
    v3 = availableFrom;
  }
  else
  {
    -[PKPassTileState actions](self, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "availableFrom");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(v5, "availableFromOffsetFromUTC");
      objc_msgSend(v7, "timeZoneForSecondsFromGMT:", (uint64_t)v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[PKDateContainer initWithDate:timeZone:]([PKDateContainer alloc], "initWithDate:timeZone:", v6, v9);

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void)setAvailableFrom:(id)a3
{
  objc_storeStrong((id *)&self->_availableFrom, a3);
}

- (PKPassTileAccessory)secondaryAccessory
{
  return self->_secondaryAccessory;
}

- (void)setSecondaryAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryAccessory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryAccessory, 0);
  objc_storeStrong((id *)&self->_availableFrom, 0);
}

@end
